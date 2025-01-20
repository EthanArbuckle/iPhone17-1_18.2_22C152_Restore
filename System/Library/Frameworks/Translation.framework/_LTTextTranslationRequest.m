@interface _LTTextTranslationRequest
- (NSArray)ignoringAttributes;
- (NSAttributedString)text;
- (NSString)sentence;
- (id)_alignmentAttributeKeyFromRequestIdentifier:(id)a3 alignmentIdentifier:(id)a4;
- (id)_getStoredAttributesForRequestIdentifier:(id)a3 alignmentIdentifier:(id)a4;
- (id)_paragraphRequestForText:(id)a3;
- (id)completionHandler;
- (id)loggingType;
- (id)serviceDelegate;
- (id)textHandler;
- (id)textTranslationHandler;
- (id)translationHandler;
- (void)_addAlignmentAttributesToResult:(id)a3 requestIdentifier:(id)a4;
- (void)_callCompletionHandlersWithResult:(id)a3 error:(id)a4;
- (void)_cleanUpTemporaryStorage;
- (void)_constructFinalParagraphResult;
- (void)_handleParagraphResponse:(id)a3 error:(id)a4;
- (void)_saveAttributes:(id)a3 forRequestUniqueID:(id)a4 alignmentIdentifier:(id)a5;
- (void)_startTranslationWithService:(id)a3 done:(id)a4;
- (void)_translationFailedWithError:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setIgnoringAttributes:(id)a3;
- (void)setSentence:(id)a3;
- (void)setText:(id)a3;
- (void)setTextHandler:(id)a3;
- (void)setTextTranslationHandler:(id)a3;
- (void)setTranslationHandler:(id)a3;
- (void)translationDidFinishWithError:(id)a3;
- (void)translatorDidTranslate:(id)a3;
@end

@implementation _LTTextTranslationRequest

- (id)loggingType
{
  return @"text";
}

- (id)_paragraphRequestForText:(id)a3
{
  id v4 = a3;
  v5 = [_LTParagraphTranslationRequest alloc];
  v6 = [(_LTTranslationRequest *)self localePair];
  v7 = [(_LTTranslationRequest *)v5 initWithLocalePair:v6];

  [(_LTTranslationRequest *)v7 setTaskHint:[(_LTTranslationRequest *)self taskHint]];
  v8 = [v4 string];
  [(_LTParagraphTranslationRequest *)v7 setText:v8];

  v9 = [MEMORY[0x263EFF980] array];
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0;
  uint64_t v10 = [v4 length];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __54___LTTextTranslationRequest__paragraphRequestForText___block_invoke;
  v17[3] = &unk_2651DC628;
  v22 = v23;
  id v11 = v4;
  id v18 = v11;
  v19 = self;
  id v12 = v9;
  id v20 = v12;
  v13 = v7;
  v21 = v13;
  objc_msgSend(v11, "enumerateAttributesInRange:options:usingBlock:", 0, v10, 0, v17);
  [(_LTParagraphTranslationRequest *)v13 setRanges:v12];
  v14 = v21;
  v15 = v13;

  _Block_object_dispose(v23, 8);

  return v15;
}

- (void)setText:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_storeStrong((id *)&self->_text, a3);
  v6 = [(_LTTextTranslationRequest *)self text];
  v7 = [v6 paragraphs];

  if ([v7 count])
  {
    if (self->_session
      || ([(_LTTranslationRequest *)self batchSessionUUID],
          v8 = objc_claimAutoreleasedReturnValue(),
          v8,
          v8))
    {
      v9 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        -[_LTTextTranslationRequest setText:]();
      }
    }
    uint64_t v10 = [MEMORY[0x263F08C38] UUID];
    id v11 = [_LTTranslationSession alloc];
    id v12 = [(_LTTranslationRequest *)self logIdentifier];
    v13 = [(_LTTranslationSession *)v11 initForFutureServiceWithSessionID:v10 selfLoggingInvocationId:v12];
    session = self->_session;
    self->_session = v13;

    v15 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v23 = 138543362;
      v24 = v10;
      _os_log_impl(&dword_24639B000, v15, OS_LOG_TYPE_INFO, "Created _LTTranslationSession for use in a _LTTextTranslationRequest. SessionID: %{public}@", (uint8_t *)&v23, 0xCu);
    }
    v16 = (void *)[v10 copy];
    [(_LTTranslationRequest *)self setBatchSessionUUID:v16];
  }
  else
  {
    v17 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = v17;
      v19 = [(_LTTranslationRequest *)self uniqueID];
      int v23 = 138543362;
      v24 = v19;
      _os_log_impl(&dword_24639B000, v18, OS_LOG_TYPE_INFO, "_LTTranslationRequest had text set, creating sub-request with suggested uniqueID: %{public}@", (uint8_t *)&v23, 0xCu);
    }
    id v20 = [_LTTextToSpeechTranslationRequest alloc];
    uint64_t v10 = [(_LTTranslationRequest *)self localePair];
    v16 = [(_LTTranslationRequest *)self uniqueID];
    v21 = [(_LTTextToSpeechTranslationRequest *)v20 initWithLocalePair:v10 suggestedUniqueID:v16];
    request = self->_request;
    self->_request = v21;
  }
}

- (id)serviceDelegate
{
  request = self->_request;
  if (!request) {
    request = self->_session;
  }
  return request;
}

- (void)_startTranslationWithService:(id)a3 done:(id)a4
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v39 = a3;
  id v40 = a4;
  v6 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_24639B000, v6, OS_LOG_TYPE_INFO, "Text Translation: start with service", (uint8_t *)buf, 2u);
  }
  v7 = [(_LTTranslationRequest *)self logIdentifier];
  uint64_t v8 = [(_LTTranslationRequest *)self localePair];
  [(_LTTranslationRequest *)self setLogIdentifier:v7];

  v9 = [MEMORY[0x263EFF9A0] dictionary];
  savedAttributes = self->_savedAttributes;
  self->_savedAttributes = v9;

  id v11 = [MEMORY[0x263EFF9A0] dictionary];
  receivedParagraphs = self->_receivedParagraphs;
  self->_receivedParagraphs = v11;

  paragraphOrder = self->_paragraphOrder;
  self->_paragraphOrder = 0;

  v14 = (void *)[v40 copy];
  id done = self->_done;
  self->_id done = v14;

  self->_outstandingCount = 0;
  self->_translationFinished = 0;
  LOBYTE(v8) = self->_session == 0;
  v16 = _LTOSLogTranslationEngine();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v17)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_24639B000, v16, OS_LOG_TYPE_INFO, "Fallback to text to speech translation", (uint8_t *)buf, 2u);
    }
    [(_LTTranslationRequest *)self->_request setTaskHint:[(_LTTranslationRequest *)self taskHint]];
    [(_LTTranslationRequest *)self->_request setForcedOfflineTranslation:[(_LTTranslationRequest *)self forcedOfflineTranslation]];
    [(_LTTranslationRequest *)self->_request setCensorSpeech:[(_LTTranslationRequest *)self censorSpeech]];
    v34 = [(_LTTextTranslationRequest *)self text];
    v35 = [v34 string];
    [(_LTTextToSpeechTranslationRequest *)self->_request setText:v35];

    [(_LTTextToSpeechTranslationRequest *)self->_request setDelegate:self];
    v36 = [(_LTTranslationRequest *)self appIdentifier];
    [(_LTTranslationRequest *)self->_request setAppIdentifier:v36];

    [(_LTTranslationRequest *)self->_request setSourceOrigin:[(_LTTranslationRequest *)self sourceOrigin]];
    [(_LTTranslationRequest *)self->_request setIsFinal:[(_LTTranslationRequest *)self isFinal]];
    [(_LTTranslationRequest *)self->_request set_supportsGenderDisambiguation:[(_LTTranslationRequest *)self _supportsGenderDisambiguation]];
    [(_LTTranslationRequest *)self->_request setOverrideOngoingSessionIfNeeded:[(_LTTranslationRequest *)self overrideOngoingSessionIfNeeded]];
    v37 = [(_LTTranslationRequest *)self logIdentifier];
    [(_LTTranslationRequest *)self->_request setLogIdentifier:v37];

    [(_LTTextToSpeechTranslationRequest *)self->_request _startTranslationWithService:v39 done:v40];
  }
  else
  {
    if (v17)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_24639B000, v16, OS_LOG_TYPE_INFO, "Using paragraph translation", (uint8_t *)buf, 2u);
    }
    id v18 = [(_LTTranslationRequest *)self logIdentifier];
    [(_LTTranslationSession *)self->_session setLogIdentifier:v18];

    [(_LTTranslationSession *)self->_session prepareWithService:v39];
    v19 = [MEMORY[0x263EFF980] array];
    id v20 = [MEMORY[0x263EFF980] array];
    v21 = [(_LTTextTranslationRequest *)self text];
    v22 = [v21 paragraphs];

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id obj = v22;
    uint64_t v23 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v46 != v24) {
            objc_enumerationMutation(obj);
          }
          v26 = [(_LTTextTranslationRequest *)self _paragraphRequestForText:*(void *)(*((void *)&v45 + 1) + 8 * i)];
          objc_msgSend(v26, "setTaskHint:", -[_LTTranslationRequest taskHint](self, "taskHint"));
          objc_msgSend(v26, "setCensorSpeech:", -[_LTTranslationRequest censorSpeech](self, "censorSpeech"));
          objc_msgSend(v26, "setForcedOfflineTranslation:", -[_LTTranslationRequest forcedOfflineTranslation](self, "forcedOfflineTranslation"));
          v27 = [(_LTTranslationRequest *)self appIdentifier];
          [v26 setAppIdentifier:v27];

          objc_msgSend(v26, "setSourceOrigin:", -[_LTTranslationRequest sourceOrigin](self, "sourceOrigin"));
          objc_msgSend(v26, "setIsFinal:", -[_LTTranslationRequest isFinal](self, "isFinal"));
          objc_msgSend(v26, "set_supportsGenderDisambiguation:", -[_LTTranslationRequest _supportsGenderDisambiguation](self, "_supportsGenderDisambiguation"));
          objc_msgSend(v26, "setOverrideOngoingSessionIfNeeded:", -[_LTTranslationRequest overrideOngoingSessionIfNeeded](self, "overrideOngoingSessionIfNeeded"));
          v28 = [(_LTTranslationRequest *)self logIdentifier];
          [v26 setLogIdentifier:v28];

          objc_initWeak(buf, self);
          v42[0] = MEMORY[0x263EF8330];
          v42[1] = 3221225472;
          v42[2] = __63___LTTextTranslationRequest__startTranslationWithService_done___block_invoke;
          v42[3] = &unk_2651DC650;
          objc_copyWeak(&v43, buf);
          [v26 setCompletionHandler:v42];
          v29 = [v26 uniqueID];
          [(NSArray *)v20 addObject:v29];

          [v19 addObject:v26];
          objc_destroyWeak(&v43);
          objc_destroyWeak(buf);
        }
        uint64_t v23 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
      }
      while (v23);
    }

    v30 = self->_paragraphOrder;
    self->_paragraphOrder = v20;
    v31 = v20;

    *(Class *)((char *)&self->super.super.isa + v38) = (Class)[(NSArray *)v31 count];
    v32 = (void *)[v40 copy];
    id v33 = self->_done;
    self->_id done = v32;

    [(_LTTranslationSession *)self->_session translate:v19];
  }
}

- (void)_translationFailedWithError:(id)a3
{
  id v4 = a3;
  id v5 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[_LTTextTranslationRequest _translationFailedWithError:]();
  }
  [(_LTTextTranslationRequest *)self _callCompletionHandlersWithResult:0 error:v4];
}

- (void)_constructFinalParagraphResult
{
  v3 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_24639B000, v3, OS_LOG_TYPE_INFO, "Constructing final paragraph result", (uint8_t *)buf, 2u);
  }
  id v4 = (void *)[(NSMutableDictionary *)self->_receivedParagraphs copy];
  objc_initWeak(buf, self);
  paragraphOrder = self->_paragraphOrder;
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = __59___LTTextTranslationRequest__constructFinalParagraphResult__block_invoke;
  v14 = &unk_2651DC678;
  id v6 = v4;
  id v15 = v6;
  objc_copyWeak(&v16, buf);
  v7 = [(NSArray *)paragraphOrder _ltCompactMap:&v11];
  uint64_t v8 = [_LTCombinedTranslationResult alloc];
  v9 = [(_LTTranslationRequest *)self localePair];
  uint64_t v10 = [(_LTCombinedTranslationResult *)v8 initWithParagraphResults:v7 localePair:v9];

  [(_LTTranslationRequest *)self logIdentifier];
  [(_LTTextTranslationRequest *)self _callCompletionHandlersWithResult:v10 error:0];

  objc_destroyWeak(&v16);
  objc_destroyWeak(buf);
}

- (void)_handleParagraphResponse:(id)a3 error:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (a4)
  {
    [(_LTTextTranslationRequest *)self translationDidFinishWithError:a4];
  }
  else
  {
    v7 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = v7;
      v9 = [v6 identifier];
      int v16 = 138543362;
      unint64_t v17 = (unint64_t)v9;
      _os_log_impl(&dword_24639B000, v8, OS_LOG_TYPE_INFO, "Received translated paragraph for ID: %{public}@", (uint8_t *)&v16, 0xCu);
    }
    receivedParagraphs = self->_receivedParagraphs;
    uint64_t v11 = [v6 identifier];
    [(NSMutableDictionary *)receivedParagraphs setObject:v6 forKeyedSubscript:v11];

    unint64_t outstandingCount = self->_outstandingCount;
    if (outstandingCount)
    {
      self->_unint64_t outstandingCount = outstandingCount - 1;
      v13 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        unint64_t v14 = self->_outstandingCount;
        int v16 = 134217984;
        unint64_t v17 = v14;
        _os_log_impl(&dword_24639B000, v13, OS_LOG_TYPE_INFO, "New outstanding count: %zd", (uint8_t *)&v16, 0xCu);
      }
      if (!self->_outstandingCount) {
        [(_LTTextTranslationRequest *)self _constructFinalParagraphResult];
      }
    }
    else
    {
      id v15 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        -[_LTTextTranslationRequest _handleParagraphResponse:error:](v15, v6);
      }
    }
  }
}

- (id)_alignmentAttributeKeyFromRequestIdentifier:(id)a3 alignmentIdentifier:(id)a4
{
  return (id)[NSString stringWithFormat:@"%@/%@", a3, a4];
}

- (id)_getStoredAttributesForRequestIdentifier:(id)a3 alignmentIdentifier:(id)a4
{
  id v5 = [(_LTTextTranslationRequest *)self _alignmentAttributeKeyFromRequestIdentifier:a3 alignmentIdentifier:a4];
  id v6 = [(NSMutableDictionary *)self->_savedAttributes objectForKeyedSubscript:v5];

  return v6;
}

- (void)_saveAttributes:(id)a3 forRequestUniqueID:(id)a4 alignmentIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = [(_LTTextTranslationRequest *)self _alignmentAttributeKeyFromRequestIdentifier:a4 alignmentIdentifier:a5];
  [(NSMutableDictionary *)self->_savedAttributes setObject:v8 forKeyedSubscript:v9];
}

- (void)_addAlignmentAttributesToResult:(id)a3 requestIdentifier:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (a3)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id obj = [a3 alignments];
    uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v32 count:16];
    if (v7)
    {
      uint64_t v9 = v7;
      uint64_t v10 = *(void *)v23;
      *(void *)&long long v8 = 138740483;
      long long v20 = v8;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          v13 = objc_msgSend(v12, "identifier", v20);
          unint64_t v14 = [(_LTTextTranslationRequest *)self _getStoredAttributesForRequestIdentifier:v6 alignmentIdentifier:v13];

          id v15 = [v12 identifier];
          int v16 = [(_LTTextTranslationRequest *)self _alignmentAttributeKeyFromRequestIdentifier:v6 alignmentIdentifier:v15];

          unint64_t v17 = _LTOSLogTranslationEngine();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            uint64_t v18 = v17;
            v19 = [v12 text];
            *(_DWORD *)buf = v20;
            v27 = v19;
            __int16 v28 = 2114;
            v29 = v16;
            __int16 v30 = 2114;
            v31 = v14;
            _os_log_impl(&dword_24639B000, v18, OS_LOG_TYPE_INFO, "Alignment '%{sensitive}@' ID: %{public}@; attributes: %{public}@",
              buf,
              0x20u);
          }
          [v12 setSourceAttributes:v14];
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v32 count:16];
      }
      while (v9);
    }
  }
}

- (void)translatorDidTranslate:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_24639B000, v5, OS_LOG_TYPE_INFO, "Received text to speech result", v10, 2u);
  }
  if (v4)
  {
    v11[0] = v4;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  }
  else
  {
    id v6 = (void *)MEMORY[0x263EFFA68];
  }
  uint64_t v7 = [_LTCombinedTranslationResult alloc];
  long long v8 = [(_LTTranslationRequest *)self localePair];
  uint64_t v9 = [(_LTCombinedTranslationResult *)v7 initWithParagraphResults:v6 localePair:v8];

  [(_LTTranslationRequest *)self logIdentifier];
  [(_LTTextTranslationRequest *)self _callCompletionHandlersWithResult:v9 error:0];
}

- (void)translationDidFinishWithError:(id)a3
{
  id v4 = a3;
  if (!self->_translationFinished)
  {
    self->_translationFinished = 1;
    id done = (void (**)(void))self->_done;
    if (done) {
      done[2]();
    }
    if (v4)
    {
      [(_LTTranslationRequest *)self->_request logIdentifier];

      id v6 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[_LTTextTranslationRequest _translationFailedWithError:]();
      }
      [(_LTTextTranslationRequest *)self _callCompletionHandlersWithResult:0 error:v4];
    }
  }
}

- (void)_callCompletionHandlersWithResult:(id)a3 error:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (self->_hasCalledCompletionHandler)
  {
    long long v8 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[_LTTextTranslationRequest _callCompletionHandlersWithResult:error:].cold.4((uint64_t)v6, (uint64_t)v7, v8);
    }
  }
  else
  {
    self->_hasCalledCompletionHandler = 1;
    if (!self->_receivedParagraphs)
    {
      uint64_t v9 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[_LTTextTranslationRequest _callCompletionHandlersWithResult:error:]();
      }
    }
    uint64_t v10 = [(_LTTextTranslationRequest *)self textTranslationHandler];

    if (v10)
    {
      uint64_t v11 = [v6 paragraphResults];
      if ([v11 count] == 1)
      {
        uint64_t v12 = [v11 firstObject];
      }
      else
      {
        uint64_t v12 = 0;
      }
      unint64_t v14 = [v6 translatedText];
      id v15 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = v15;
        *(_DWORD *)long long v22 = 134218498;
        *(void *)&v22[4] = [v14 length];
        *(_WORD *)&v22[12] = 1024;
        *(_DWORD *)&v22[14] = v12 != 0;
        __int16 v23 = 2112;
        id v24 = v7;
        _os_log_impl(&dword_24639B000, v16, OS_LOG_TYPE_DEFAULT, "Calling _LTTextTranslationRequest.textTranslationHandler with translatedText of length %zu; has result: %{BOOL}i; error: %@",
          v22,
          0x1Cu);
      }
      unint64_t v17 = [(_LTTextTranslationRequest *)self textTranslationHandler];
      ((void (**)(void, void *, void *, id))v17)[2](v17, v14, v12, v7);
    }
    else
    {
      v13 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[_LTTextTranslationRequest _callCompletionHandlersWithResult:error:]();
      }
    }
    uint64_t v18 = [(_LTTextTranslationRequest *)self completionHandler];

    v19 = _LTOSLogTranslationEngine();
    long long v20 = v19;
    if (v18)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long v22 = 67109378;
        *(_DWORD *)&v22[4] = v6 != 0;
        *(_WORD *)&v22[8] = 2112;
        *(void *)&v22[10] = v7;
        _os_log_impl(&dword_24639B000, v20, OS_LOG_TYPE_DEFAULT, "Calling _LTTextTranslationRequest.completionHandler; has result: %{BOOL}i; error: %@",
          v22,
          0x12u);
      }
      v21 = [(_LTTextTranslationRequest *)self completionHandler];
      ((void (**)(void, id, id))v21)[2](v21, v6, v7);
    }
    else if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      -[_LTTextTranslationRequest _callCompletionHandlersWithResult:error:]();
    }
    [(_LTTextTranslationRequest *)self _cleanUpTemporaryStorage];
  }
}

- (void)_cleanUpTemporaryStorage
{
  paragraphOrder = self->_paragraphOrder;
  self->_paragraphOrder = 0;

  receivedParagraphs = self->_receivedParagraphs;
  self->_receivedParagraphs = 0;

  savedAttributes = self->_savedAttributes;
  self->_savedAttributes = 0;
}

- (NSString)sentence
{
  return self->_sentence;
}

- (void)setSentence:(id)a3
{
}

- (NSAttributedString)text
{
  return self->_text;
}

- (NSArray)ignoringAttributes
{
  return self->_ignoringAttributes;
}

- (void)setIgnoringAttributes:(id)a3
{
}

- (id)textHandler
{
  return self->_textHandler;
}

- (void)setTextHandler:(id)a3
{
}

- (id)translationHandler
{
  return self->_translationHandler;
}

- (void)setTranslationHandler:(id)a3
{
}

- (id)textTranslationHandler
{
  return self->_textTranslationHandler;
}

- (void)setTextTranslationHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_textTranslationHandler, 0);
  objc_storeStrong(&self->_translationHandler, 0);
  objc_storeStrong(&self->_textHandler, 0);
  objc_storeStrong((id *)&self->_ignoringAttributes, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_sentence, 0);
  objc_storeStrong(&self->_done, 0);
  objc_storeStrong((id *)&self->_receivedParagraphs, 0);
  objc_storeStrong((id *)&self->_paragraphOrder, 0);
  objc_storeStrong((id *)&self->_savedAttributes, 0);
  objc_storeStrong((id *)&self->_request, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

- (void)setText:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  _os_log_fault_impl(&dword_24639B000, v0, OS_LOG_TYPE_FAULT, "Trying to set new text on a request that had a session (and may have already had text) set; this could lead to unexpected behavior",
    v1,
    2u);
}

- (void)_translationFailedWithError:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_24639B000, v0, v1, "Translation failed with error: %@", v2, v3, v4, v5, v6);
}

- (void)_handleParagraphResponse:(void *)a1 error:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 identifier];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_24639B000, v3, OS_LOG_TYPE_FAULT, "Received a paragraph response with ID %{public}@, but we didn't expect any paragraphs to be outstanding; this should never happen",
    v5,
    0xCu);
}

- (void)_callCompletionHandlersWithResult:error:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_24639B000, v0, OS_LOG_TYPE_DEBUG, "Not calling _LTTextTranslationRequest.completionHandler since the client hasn't set this property", v1, 2u);
}

- (void)_callCompletionHandlersWithResult:error:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_24639B000, v0, OS_LOG_TYPE_DEBUG, "Not calling _LTTextTranslationRequest.textTranslationHandler since the client hasn't set this property", v1, 2u);
}

- (void)_callCompletionHandlersWithResult:error:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
    "er was likely already called, or translation never started",
    v1,
    2u);
}

- (void)_callCompletionHandlersWithResult:(os_log_t)log error:.cold.4(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109378;
  v3[1] = a1 != 0;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_error_impl(&dword_24639B000, log, OS_LOG_TYPE_ERROR, "Attempted to call completionHandler even though it's already been called, will not call it again. Combined result exists: %{BOOL}i; error: %@",
    (uint8_t *)v3,
    0x12u);
}

@end