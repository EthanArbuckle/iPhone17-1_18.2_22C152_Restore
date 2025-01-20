@interface SGReverseTemplateJS
+ (id)fakeFlightInformationWithAirlineCode:(id)a3 flightNumber:(id)a4 flightDate:(id)a5;
- (BOOL)shouldDownloadFull:(id)a3;
- (SGReverseTemplateJS)init;
- (id)_callJSFunction:(id)a3 withArguments:(id)a4;
- (id)_diffSchemas:(id)a3 withExpectedSchemas:(id)a4;
- (id)_eventClassificationForEntity:(id)a3;
- (id)_getFlightReferencesAndReservationId:(id)a3;
- (id)_mergeSchemas:(id)a3 withExpectedSchemas:(id)a4;
- (id)_prepareArguments:(id)a3;
- (id)_prepareEntity:(id)a3;
- (id)_privacyAwareLogsForMLExtractions:(id)a3;
- (id)_resolveCandidatesForJSDict:(id)a3;
- (id)_stringFromMemoryPressureStatus:(unint64_t)a3;
- (id)dictionaryFromTimezone:(id)a3;
- (id)flightInformationWithAirlineCode:(id)a3 flightNumber:(id)a4 flightDate:(id)a5;
- (id)formattedDate:(id)a3 withTimezone:(id)a4;
- (id)getJSContext;
- (id)loadJSFromASCIIFile:(id)a3;
- (id)loadTrieWithFileName:(id)a3;
- (id)mappedArrayBufferForFileName:(id)a3;
- (id)md5Hash:(id)a3;
- (id)outputExceptionsFromOutput:(id)a3;
- (id)payloadToOutputWithEntryPoint:(id)a3 arguments:(id)a4;
- (id)preprocessPackedSGMessage:(id)a3;
- (id)processLoadRequestWithFileName:(id)a3;
- (id)reverseMapEntity:(id)a3 forCategory:(id)a4 withSchemaExpectation:(id)a5;
- (id)sfAirportToDictionnary:(id)a3;
- (id)sfFlightStatusToString:(int)a3;
- (id)sfFlightsToDictionary:(id)a3;
- (void)_handleMemoryPressureStatus:(unint64_t)a3;
- (void)dealloc;
- (void)diffSchemas:(id)a3 withExpectedSchemas:(id)a4 reply:(id)a5;
- (void)emailToJsonLd:(id)a3 reply:(id)a4;
- (void)emailToOutput:(id)a3 reply:(id)a4;
- (void)eventClassificationForEntity:(id)a3 reply:(id)a4;
- (void)flightInformationWithAirlineCode:(id)a3 flightNumber:(id)a4 flightDate:(id)a5 reply:(id)a6;
- (void)freeJSContext;
- (void)getFlightReferencesAndReservationId:(id)a3 reply:(id)a4;
- (void)holdXpcTransactionForShortDelay;
- (void)initCurrentAsset;
- (void)mergeSchemas:(id)a3 withExpectedSchemas:(id)a4 reply:(id)a5;
- (void)parseHTML:(id)a3 reply:(id)a4;
- (void)payloadToOutputWithEntryPoint:(id)a3 arguments:(id)a4 reply:(id)a5;
- (void)privacyAwareLogsForMLExtractions:(id)a3 reply:(id)a4;
- (void)refreshAssetPath;
- (void)resolveCandidatesForJSDict:(id)a3 reply:(id)a4;
- (void)schemaOrgToJsonLd:(id)a3 reply:(id)a4;
- (void)schemaOrgToOutput:(id)a3 reply:(id)a4;
- (void)setAssetPath:(id)a3;
- (void)shouldDownloadFull:(id)a3 reply:(id)a4;
- (void)textMessageToOutput:(id)a3 reply:(id)a4;
@end

@implementation SGReverseTemplateJS

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_memoryPressureSource, 0);
  objc_storeStrong((id *)&self->_memoryPressureQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_assetPath, 0);
  objc_storeStrong((id *)&self->_assetUpdateToken, 0);
  objc_storeStrong((id *)&self->_dd, 0);
  objc_storeStrong((id *)&self->_jsContext, 0);
  objc_storeStrong((id *)&self->_memoryMappedFileNames, 0);
  objc_storeStrong((id *)&self->_memoryMappedFiles, 0);
  objc_storeStrong((id *)&self->_jsVM, 0);
}

- (id)_prepareArguments:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v12 = [(SGReverseTemplateJS *)self _prepareEntity:v11];
          [v5 addObject:v12];
        }
        else
        {
          objc_msgSend(v5, "addObject:", v11, (void)v14);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_prepareEntity:(id)a3
{
  id v5 = a3;
  if (!self->_jsContext)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"SGReverseTemplateJS.m", 1179, @"Invalid parameter not satisfying: %@", @"_jsContext" object file lineNumber description];
  }
  return v5;
}

- (id)outputExceptionsFromOutput:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"exceptions"];
  id v4 = [MEMORY[0x1E4F5DA28] simpleDedupe:v3];

  return v4;
}

- (void)schemaOrgToJsonLd:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1E4F93BD8];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__SGReverseTemplateJS_schemaOrgToJsonLd_reply___block_invoke;
  v11[3] = &unk_1E65BFFF0;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 runWithExceptionBarrier:v11];
}

void __47__SGReverseTemplateJS_schemaOrgToJsonLd_reply___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  v3 = [v2 preprocessPackedSGMessage:*(void *)(a1 + 40)];
  v6[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  id v5 = [v2 payloadToOutputWithEntryPoint:@"schemaOrgToJsonLdWithExceptions" arguments:v4];

  [*(id *)(a1 + 32) holdXpcTransactionForShortDelay];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)emailToJsonLd:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1E4F93BD8];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __43__SGReverseTemplateJS_emailToJsonLd_reply___block_invoke;
  v11[3] = &unk_1E65BFFF0;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 runWithExceptionBarrier:v11];
}

void __43__SGReverseTemplateJS_emailToJsonLd_reply___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  v3 = [v2 preprocessPackedSGMessage:*(void *)(a1 + 40)];
  v6[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  id v5 = [v2 payloadToOutputWithEntryPoint:@"emailToJsonLdWithExceptions" arguments:v4];

  [*(id *)(a1 + 32) holdXpcTransactionForShortDelay];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)schemaOrgToOutput:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1E4F93BD8];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__SGReverseTemplateJS_schemaOrgToOutput_reply___block_invoke;
  v11[3] = &unk_1E65BFFF0;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 runWithExceptionBarrier:v11];
}

void __47__SGReverseTemplateJS_schemaOrgToOutput_reply___block_invoke(void *a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)a1[4];
  v3 = [v2 preprocessPackedSGMessage:a1[5]];
  v5[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [v2 payloadToOutputWithEntryPoint:@"schemaOrgToOutputWithTiming" arguments:v4 reply:a1[6]];
}

- (void)textMessageToOutput:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1E4F93BD8];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__SGReverseTemplateJS_textMessageToOutput_reply___block_invoke;
  v11[3] = &unk_1E65BFFF0;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 runWithExceptionBarrier:v11];
}

void __49__SGReverseTemplateJS_textMessageToOutput_reply___block_invoke(void *a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)a1[4];
  v3 = [v2 preprocessPackedSGMessage:a1[5]];
  v5[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [v2 payloadToOutputWithEntryPoint:@"textMessageToOutputWithTiming" arguments:v4 reply:a1[6]];
}

- (void)emailToOutput:(id)a3 reply:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__14860;
  v31 = __Block_byref_object_dispose__14861;
  id v32 = 0;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __43__SGReverseTemplateJS_emailToOutput_reply___block_invoke;
  v26[3] = &unk_1E65BB0C8;
  v26[4] = &v27;
  [(SGReverseTemplateJS *)self privacyAwareLogsForMLExtractions:v6 reply:v26];
  uint64_t v8 = sgLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = v7;
    v22 = [(id)v28[5] objectForKeyedSubscript:@"domain"];
    v21 = [(id)v28[5] objectForKeyedSubscript:@"documentDateReceived"];
    v20 = [(id)v28[5] objectForKeyedSubscript:@"hashedSubject"];
    id v9 = [(id)v28[5] objectForKeyedSubscript:@"privacyAwareSubject"];
    id v10 = [(id)v28[5] objectForKeyedSubscript:@"tdDistrib"];
    uint64_t v11 = [(id)v28[5] objectForKeyedSubscript:@"tdCount"];
    id v12 = [(id)v28[5] objectForKeyedSubscript:@"deviceLocale"];
    id v13 = [(id)v28[5] objectForKeyedSubscript:@"messageLength"];
    long long v14 = [(id)v28[5] objectForKeyedSubscript:@"documentDateProcessed"];
    long long v15 = [(id)v28[5] objectForKeyedSubscript:@"containsSchemaorg"];
    *(_DWORD *)buf = 138414594;
    v34 = v22;
    __int16 v35 = 2112;
    v36 = v21;
    __int16 v37 = 2112;
    v38 = v20;
    __int16 v39 = 2112;
    v40 = v9;
    __int16 v41 = 2112;
    v42 = v10;
    __int16 v43 = 2112;
    v44 = v11;
    __int16 v45 = 2112;
    v46 = v12;
    __int16 v47 = 2112;
    v48 = v13;
    __int16 v49 = 2112;
    v50 = v14;
    __int16 v51 = 2112;
    v52 = v15;
    _os_log_impl(&dword_1CA650000, v8, OS_LOG_TYPE_DEFAULT, "Email: %@ %@ %@ %@ %@ %@ %@ %@ %@ %@", buf, 0x66u);

    id v7 = v19;
  }

  long long v16 = (void *)MEMORY[0x1E4F93BD8];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __43__SGReverseTemplateJS_emailToOutput_reply___block_invoke_505;
  v23[3] = &unk_1E65BFFF0;
  v23[4] = self;
  id v17 = v6;
  id v24 = v17;
  id v18 = v7;
  id v25 = v18;
  [v16 runWithExceptionBarrier:v23];

  _Block_object_dispose(&v27, 8);
}

void __43__SGReverseTemplateJS_emailToOutput_reply___block_invoke(uint64_t a1, void *a2)
{
}

void __43__SGReverseTemplateJS_emailToOutput_reply___block_invoke_505(void *a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)a1[4];
  v3 = [v2 preprocessPackedSGMessage:a1[5]];
  v5[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [v2 payloadToOutputWithEntryPoint:@"emailToOutputWithTiming" arguments:v4 reply:a1[6]];
}

- (void)payloadToOutputWithEntryPoint:(id)a3 arguments:(id)a4 reply:(id)a5
{
  uint64_t v8 = (void (**)(id, void *, void *, void *, void *))a5;
  id v13 = [(SGReverseTemplateJS *)self payloadToOutputWithEntryPoint:a3 arguments:a4];
  id v9 = [v13 objectForKeyedSubscript:@"outputs"];
  id v10 = [v13 objectForKeyedSubscript:@"sourceMetadata"];
  uint64_t v11 = [(SGReverseTemplateJS *)self outputExceptionsFromOutput:v13];
  id v12 = [v13 objectForKeyedSubscript:@"jsMessageLogs"];
  [(SGReverseTemplateJS *)self holdXpcTransactionForShortDelay];
  v8[2](v8, v9, v10, v11, v12);
}

- (void)parseHTML:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1E4F93BD8];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __39__SGReverseTemplateJS_parseHTML_reply___block_invoke;
  v11[3] = &unk_1E65BFFF0;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 runWithExceptionBarrier:v11];
}

void __39__SGReverseTemplateJS_parseHTML_reply___block_invoke(uint64_t a1)
{
  id v3 = (id)objc_opt_new();
  v2 = [v3 parseHTML:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) holdXpcTransactionForShortDelay];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)mergeSchemas:(id)a3 withExpectedSchemas:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)MEMORY[0x1E4F93BD8];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__SGReverseTemplateJS_mergeSchemas_withExpectedSchemas_reply___block_invoke;
  v15[3] = &unk_1E65B85A8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 runWithExceptionBarrier:v15];
}

void __62__SGReverseTemplateJS_mergeSchemas_withExpectedSchemas_reply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _mergeSchemas:*(void *)(a1 + 40) withExpectedSchemas:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) holdXpcTransactionForShortDelay];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)diffSchemas:(id)a3 withExpectedSchemas:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)MEMORY[0x1E4F93BD8];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61__SGReverseTemplateJS_diffSchemas_withExpectedSchemas_reply___block_invoke;
  v15[3] = &unk_1E65B85A8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 runWithExceptionBarrier:v15];
}

void __61__SGReverseTemplateJS_diffSchemas_withExpectedSchemas_reply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _diffSchemas:*(void *)(a1 + 40) withExpectedSchemas:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) holdXpcTransactionForShortDelay];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)resolveCandidatesForJSDict:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F93BD8];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__SGReverseTemplateJS_resolveCandidatesForJSDict_reply___block_invoke;
  v11[3] = &unk_1E65BFFF0;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 runWithExceptionBarrier:v11];
}

void __56__SGReverseTemplateJS_resolveCandidatesForJSDict_reply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _resolveCandidatesForJSDict:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) holdXpcTransactionForShortDelay];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)getFlightReferencesAndReservationId:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F93BD8];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__SGReverseTemplateJS_getFlightReferencesAndReservationId_reply___block_invoke;
  v11[3] = &unk_1E65BFFF0;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 runWithExceptionBarrier:v11];
}

void __65__SGReverseTemplateJS_getFlightReferencesAndReservationId_reply___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 preprocessPackedSGMessage:*(void *)(a1 + 40)];
  id v4 = [v2 _getFlightReferencesAndReservationId:v3];

  [*(id *)(a1 + 32) holdXpcTransactionForShortDelay];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)privacyAwareLogsForMLExtractions:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F93BD8];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__SGReverseTemplateJS_privacyAwareLogsForMLExtractions_reply___block_invoke;
  v11[3] = &unk_1E65BFFF0;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 runWithExceptionBarrier:v11];
}

void __62__SGReverseTemplateJS_privacyAwareLogsForMLExtractions_reply___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 preprocessPackedSGMessage:*(void *)(a1 + 40)];
  id v4 = [v2 _privacyAwareLogsForMLExtractions:v3];

  [*(id *)(a1 + 32) holdXpcTransactionForShortDelay];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)eventClassificationForEntity:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F93BD8];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__SGReverseTemplateJS_eventClassificationForEntity_reply___block_invoke;
  v11[3] = &unk_1E65BFFF0;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 runWithExceptionBarrier:v11];
}

void __58__SGReverseTemplateJS_eventClassificationForEntity_reply___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 preprocessPackedSGMessage:*(void *)(a1 + 40)];
  id v4 = [v2 _eventClassificationForEntity:v3];

  [*(id *)(a1 + 32) holdXpcTransactionForShortDelay];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)shouldDownloadFull:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F93BD8];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__SGReverseTemplateJS_shouldDownloadFull_reply___block_invoke;
  v11[3] = &unk_1E65BFFF0;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 runWithExceptionBarrier:v11];
}

uint64_t __48__SGReverseTemplateJS_shouldDownloadFull_reply___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 preprocessPackedSGMessage:*(void *)(a1 + 40)];
  [v2 shouldDownloadFull:v3];

  [*(id *)(a1 + 32) holdXpcTransactionForShortDelay];
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v4();
}

- (id)payloadToOutputWithEntryPoint:(id)a3 arguments:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__14860;
  id v25 = __Block_byref_object_dispose__14861;
  id v26 = 0;
  queue = self->_queue;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  long long v15 = __63__SGReverseTemplateJS_payloadToOutputWithEntryPoint_arguments___block_invoke;
  id v16 = &unk_1E65BE418;
  id v17 = self;
  v20 = &v21;
  id v9 = v6;
  id v18 = v9;
  id v10 = v7;
  id v19 = v10;
  dispatch_sync(queue, &v13);
  uint64_t v11 = objc_msgSend((id)v22[5], "copy", v13, v14, v15, v16, v17);

  _Block_object_dispose(&v21, 8);
  return v11;
}

void __63__SGReverseTemplateJS_payloadToOutputWithEntryPoint_arguments___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1CB79B230]();
  id v3 = [*(id *)(a1 + 32) getJSContext];
  id v4 = sgEventsLogHandle();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v6 = *(void **)(a1 + 40);
      int v19 = 138412290;
      v20 = v6;
      _os_log_impl(&dword_1CA650000, v5, OS_LOG_TYPE_INFO, "SGReverseTemplateJS: Calling payloadToOutput with entry point: %@", (uint8_t *)&v19, 0xCu);
    }

    id v7 = *(void **)(a1 + 32);
    id v8 = [v3 objectForKeyedSubscript:*(void *)(a1 + 40)];
    id v9 = [*(id *)(a1 + 32) _prepareArguments:*(void *)(a1 + 48)];
    id v10 = [v7 _callJSFunction:v8 withArguments:v9];
    uint64_t v11 = [v10 toDictionary];
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    uint64_t v14 = [v3 exception];

    if (v14)
    {
      long long v15 = sgEventsLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        id v18 = [v3 exception];
        int v19 = 138412290;
        v20 = v18;
        _os_log_fault_impl(&dword_1CA650000, v15, OS_LOG_TYPE_FAULT, "SGReverseTemplateJS payloadToOutputWithEntryPoint: JS exception during messageToOutput: %@", (uint8_t *)&v19, 0xCu);
      }
    }
    SGJSGarbageCollect([v3 JSGlobalContextRef]);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v19) = 0;
      _os_log_fault_impl(&dword_1CA650000, v5, OS_LOG_TYPE_FAULT, "SGReverseTemplateJS payloadToOutputWithEntryPoint: Tried to call messageToOutput without JS assets", (uint8_t *)&v19, 2u);
    }

    uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
    id v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = 0;
  }
}

- (id)reverseMapEntity:(id)a3 forCategory:(id)a4 withSchemaExpectation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__14860;
  id v26 = __Block_byref_object_dispose__14861;
  id v27 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__SGReverseTemplateJS_reverseMapEntity_forCategory_withSchemaExpectation___block_invoke;
  block[3] = &unk_1E65B8580;
  id v20 = v10;
  uint64_t v21 = &v22;
  block[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(queue, block);
  id v15 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v15;
}

void __74__SGReverseTemplateJS_reverseMapEntity_forCategory_withSchemaExpectation___block_invoke(uint64_t a1)
{
  v40[3] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1CB79B230]();
  id v3 = [*(id *)(a1 + 32) getJSContext];
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    id v7 = *(void **)(a1 + 32);
    id v8 = [v3 objectForKeyedSubscript:@"reverseMapForEntity"];
    id v10 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v11 = &stru_1F24EEF20;
    if (!v9) {
      uint64_t v9 = MEMORY[0x1E4F1CC08];
    }
    uint64_t v12 = *(void *)(a1 + 56);
    if (*(void *)(a1 + 48)) {
      uint64_t v11 = *(__CFString **)(a1 + 48);
    }
    v40[0] = v9;
    v40[1] = v11;
    if (v12) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = MEMORY[0x1E4F1CC08];
    }
    v40[2] = v13;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:3];
    id v15 = [v10 _prepareArguments:v14];
    uint64_t v16 = [v7 _callJSFunction:v8 withArguments:v15];
    id v17 = [v16 toDictionary];

    if (v17)
    {
      [v17 objectForKeyedSubscript:@"taggedCharacterRanges"];
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v19 = [v18 countByEnumeratingWithState:&v33 objects:v39 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v34;
        while (2)
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v34 != v21) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = *(void *)(*((void *)&v33 + 1) + 8 * i);
            uint64_t v24 = [SGTaggedCharacterRange alloc];
            uint64_t v25 = -[SGTaggedCharacterRange initWithDict:](v24, "initWithDict:", v23, (void)v33);
            if (!v25)
            {
              id v27 = sgEventsLogHandle();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl(&dword_1CA650000, v27, OS_LOG_TYPE_ERROR, "SGReverseTemplateJS: Unable to convert JS taggedCharacterRange to Objective-C", buf, 2u);
              }

              uint64_t v28 = *(void *)(*(void *)(a1 + 64) + 8);
              uint64_t v29 = *(void **)(v28 + 40);
              *(void *)(v28 + 40) = 0;

              goto LABEL_24;
            }
            id v26 = (void *)v25;
            [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:v25];
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v33 objects:v39 count:16];
          if (v20) {
            continue;
          }
          break;
        }
      }
LABEL_24:
    }
    v30 = objc_msgSend(v3, "exception", (void)v33);

    if (v30)
    {
      v31 = sgEventsLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      {
        id v32 = [v3 exception];
        *(_DWORD *)buf = 138412290;
        v38 = v32;
        _os_log_fault_impl(&dword_1CA650000, v31, OS_LOG_TYPE_FAULT, "SGReverseTemplateJS: JS Exception during reverseMapEntity %@", buf, 0xCu);
      }
    }
    SGJSGarbageCollect([v3 JSGlobalContextRef]);
  }
  else
  {
    id v17 = sgEventsLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1CA650000, v17, OS_LOG_TYPE_FAULT, "SGReverseTemplateJS: Tried to call reverseMapEntity without JS assets", buf, 2u);
    }
  }
}

- (id)_mergeSchemas:(id)a3 withExpectedSchemas:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sgEventsLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA650000, v8, OS_LOG_TYPE_DEFAULT, "SGReverseTemplateJS: Calling JS to merge schemas", buf, 2u);
  }

  *(void *)buf = 0;
  uint64_t v19 = buf;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__14860;
  uint64_t v22 = __Block_byref_object_dispose__14861;
  id v23 = 0;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__SGReverseTemplateJS__mergeSchemas_withExpectedSchemas___block_invoke;
  v14[3] = &unk_1E65BE418;
  v14[4] = self;
  id v15 = v7;
  id v16 = v6;
  id v17 = buf;
  id v10 = v6;
  id v11 = v7;
  dispatch_sync(queue, v14);
  id v12 = *((id *)v19 + 5);

  _Block_object_dispose(buf, 8);
  return v12;
}

void __57__SGReverseTemplateJS__mergeSchemas_withExpectedSchemas___block_invoke(uint64_t a1)
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1CB79B230]();
  id v3 = [*(id *)(a1 + 32) getJSContext];
  if (v3)
  {
    v25[0] = @"expected";
    v25[1] = @"predicted";
    uint64_t v4 = *(void *)(a1 + 48);
    v26[0] = *(void *)(a1 + 40);
    v26[1] = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
    id v6 = *(void **)(a1 + 32);
    id v7 = [v3 objectForKeyedSubscript:@"mergeSchemasArrays"];
    id v8 = *(void **)(a1 + 32);
    uint64_t v24 = v5;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
    id v10 = [v8 _prepareArguments:v9];
    id v11 = [v6 _callJSFunction:v7 withArguments:v10];
    uint64_t v12 = [v11 toDictionary];
    uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    id v15 = sgEventsLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v20 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      int v22 = 138412290;
      id v23 = v20;
      _os_log_debug_impl(&dword_1CA650000, v15, OS_LOG_TYPE_DEBUG, "SGReverseTemplateJS: Called mergeSchemasArrays with result: %@", (uint8_t *)&v22, 0xCu);
    }

    id v16 = [v3 exception];

    if (v16)
    {
      id v17 = sgEventsLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        uint64_t v21 = [v3 exception];
        int v22 = 138412290;
        id v23 = v21;
        _os_log_fault_impl(&dword_1CA650000, v17, OS_LOG_TYPE_FAULT, "SGReverseTemplateJS _mergeSchemas: JS Exception during mergeSchemasArrays: %@", (uint8_t *)&v22, 0xCu);
      }
    }
    SGJSGarbageCollect([v3 JSGlobalContextRef]);
  }
  else
  {
    id v18 = sgEventsLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v22) = 0;
      _os_log_fault_impl(&dword_1CA650000, v18, OS_LOG_TYPE_FAULT, "Tried to call mergeSchemas without JS assets", (uint8_t *)&v22, 2u);
    }

    uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v5 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = 0;
  }
}

- (id)_diffSchemas:(id)a3 withExpectedSchemas:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sgEventsLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA650000, v8, OS_LOG_TYPE_DEFAULT, "SGReverseTemplateJS: Calling JS to diff schemas", buf, 2u);
  }

  *(void *)buf = 0;
  uint64_t v19 = buf;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__14860;
  int v22 = __Block_byref_object_dispose__14861;
  id v23 = 0;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__SGReverseTemplateJS__diffSchemas_withExpectedSchemas___block_invoke;
  v14[3] = &unk_1E65BE418;
  v14[4] = self;
  id v15 = v7;
  id v16 = v6;
  id v17 = buf;
  id v10 = v6;
  id v11 = v7;
  dispatch_sync(queue, v14);
  id v12 = *((id *)v19 + 5);

  _Block_object_dispose(buf, 8);
  return v12;
}

void __56__SGReverseTemplateJS__diffSchemas_withExpectedSchemas___block_invoke(uint64_t a1)
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1CB79B230]();
  id v3 = [*(id *)(a1 + 32) getJSContext];
  if (v3)
  {
    v25[0] = @"expected";
    v25[1] = @"predicted";
    uint64_t v4 = *(void *)(a1 + 48);
    v26[0] = *(void *)(a1 + 40);
    v26[1] = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
    id v6 = *(void **)(a1 + 32);
    id v7 = [v3 objectForKeyedSubscript:@"diffSchemasArrays"];
    id v8 = *(void **)(a1 + 32);
    uint64_t v24 = v5;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
    id v10 = [v8 _prepareArguments:v9];
    id v11 = [v6 _callJSFunction:v7 withArguments:v10];
    uint64_t v12 = [v11 toDictionary];
    uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    id v15 = sgEventsLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v20 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      int v22 = 138412290;
      id v23 = v20;
      _os_log_debug_impl(&dword_1CA650000, v15, OS_LOG_TYPE_DEBUG, "SGReverseTemplateJS: Called diffSchemasArrays with result: %@", (uint8_t *)&v22, 0xCu);
    }

    id v16 = [v3 exception];

    if (v16)
    {
      id v17 = sgEventsLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        uint64_t v21 = [v3 exception];
        int v22 = 138412290;
        id v23 = v21;
        _os_log_fault_impl(&dword_1CA650000, v17, OS_LOG_TYPE_FAULT, "SGReverseTemplateJS _diffSchemas: JS Exception during diffSchemasArrays: %@", (uint8_t *)&v22, 0xCu);
      }
    }
    SGJSGarbageCollect([v3 JSGlobalContextRef]);
  }
  else
  {
    id v18 = sgEventsLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v22) = 0;
      _os_log_fault_impl(&dword_1CA650000, v18, OS_LOG_TYPE_FAULT, "Tried to call diffSchemas without JS assets", (uint8_t *)&v22, 2u);
    }

    uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v5 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = 0;
  }
}

- (id)_getFlightReferencesAndReservationId:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sgEventsLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEFAULT, "SGReverseTemplateJS: Calling JS to get flight references and reservation id given text message", buf, 2u);
  }

  *(void *)buf = 0;
  id v14 = buf;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__14860;
  id v17 = __Block_byref_object_dispose__14861;
  id v18 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__SGReverseTemplateJS__getFlightReferencesAndReservationId___block_invoke;
  block[3] = &unk_1E65C0700;
  id v11 = v4;
  uint64_t v12 = buf;
  block[4] = self;
  id v7 = v4;
  dispatch_sync(queue, block);
  id v8 = *((id *)v14 + 5);

  _Block_object_dispose(buf, 8);
  return v8;
}

void __60__SGReverseTemplateJS__getFlightReferencesAndReservationId___block_invoke(uint64_t a1)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1CB79B230]();
  id v3 = [*(id *)(a1 + 32) getJSContext];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = [v3 objectForKeyedSubscript:@"getFlightReferencesAndReservationId"];
    id v7 = *(void **)(a1 + 32);
    v24[0] = *(void *)(a1 + 40);
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    uint64_t v9 = [v7 _prepareArguments:v8];
    id v10 = [v5 _callJSFunction:v6 withArguments:v9];
    uint64_t v11 = [v10 toDictionary];
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    id v14 = sgEventsLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v20 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      int v22 = 138412290;
      id v23 = v20;
      _os_log_debug_impl(&dword_1CA650000, v14, OS_LOG_TYPE_DEBUG, "SGReverseTemplateJS: Called getFlightReferencesAndReservationId with result: %@", (uint8_t *)&v22, 0xCu);
    }

    uint64_t v15 = [v4 exception];

    if (v15)
    {
      id v16 = sgEventsLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        uint64_t v21 = [v4 exception];
        int v22 = 138412290;
        id v23 = v21;
        _os_log_fault_impl(&dword_1CA650000, v16, OS_LOG_TYPE_FAULT, "SGReverseTemplateJS: JS Exception during getFlightReferencesAndReservationId: %@", (uint8_t *)&v22, 0xCu);
      }
    }
    SGJSGarbageCollect([v4 JSGlobalContextRef]);
  }
  else
  {
    id v17 = sgEventsLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v22) = 0;
      _os_log_fault_impl(&dword_1CA650000, v17, OS_LOG_TYPE_FAULT, "Tried to call getFlightReferencesAndReservationId without JS assets", (uint8_t *)&v22, 2u);
    }

    uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = 0;
  }
}

- (id)_privacyAwareLogsForMLExtractions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sgEventsLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEFAULT, "SGReverseTemplateJS: Calling JS to get privacy aware logging", buf, 2u);
  }

  *(void *)buf = 0;
  id v14 = buf;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__14860;
  id v17 = __Block_byref_object_dispose__14861;
  id v18 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__SGReverseTemplateJS__privacyAwareLogsForMLExtractions___block_invoke;
  block[3] = &unk_1E65C0700;
  id v11 = v4;
  uint64_t v12 = buf;
  block[4] = self;
  id v7 = v4;
  dispatch_sync(queue, block);
  id v8 = *((id *)v14 + 5);

  _Block_object_dispose(buf, 8);
  return v8;
}

void __57__SGReverseTemplateJS__privacyAwareLogsForMLExtractions___block_invoke(uint64_t a1)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1CB79B230]();
  id v3 = [*(id *)(a1 + 32) getJSContext];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = [v3 objectForKeyedSubscript:@"getPrivacyAwareMlLogs"];
    id v7 = *(void **)(a1 + 32);
    v24[0] = *(void *)(a1 + 40);
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    uint64_t v9 = [v7 _prepareArguments:v8];
    id v10 = [v5 _callJSFunction:v6 withArguments:v9];
    uint64_t v11 = [v10 toDictionary];
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    id v14 = sgEventsLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v20 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      int v22 = 138412290;
      id v23 = v20;
      _os_log_debug_impl(&dword_1CA650000, v14, OS_LOG_TYPE_DEBUG, "SGReverseTemplateJS: Called getPrivacyAwareMlLogs with result: %@", (uint8_t *)&v22, 0xCu);
    }

    uint64_t v15 = [v4 exception];

    if (v15)
    {
      id v16 = sgEventsLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        uint64_t v21 = [v4 exception];
        int v22 = 138412290;
        id v23 = v21;
        _os_log_fault_impl(&dword_1CA650000, v16, OS_LOG_TYPE_FAULT, "SGReverseTemplateJS: JS Exception during getPrivacyAwareMlLogs: %@", (uint8_t *)&v22, 0xCu);
      }
    }
    SGJSGarbageCollect([v4 JSGlobalContextRef]);
  }
  else
  {
    id v17 = sgEventsLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v22) = 0;
      _os_log_fault_impl(&dword_1CA650000, v17, OS_LOG_TYPE_FAULT, "Tried to call getPrivacyAwareMlLogs without JS assets", (uint8_t *)&v22, 2u);
    }

    uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = 0;
  }
}

- (id)_resolveCandidatesForJSDict:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sgEventsLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEFAULT, "SGReverseTemplateJS: Calling JS to resolve candidates", buf, 2u);
  }

  *(void *)buf = 0;
  id v14 = buf;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__14860;
  id v17 = __Block_byref_object_dispose__14861;
  id v18 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__SGReverseTemplateJS__resolveCandidatesForJSDict___block_invoke;
  block[3] = &unk_1E65C0700;
  id v11 = v4;
  uint64_t v12 = buf;
  block[4] = self;
  id v7 = v4;
  dispatch_sync(queue, block);
  id v8 = *((id *)v14 + 5);

  _Block_object_dispose(buf, 8);
  return v8;
}

void __51__SGReverseTemplateJS__resolveCandidatesForJSDict___block_invoke(uint64_t a1)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1CB79B230]();
  id v3 = [*(id *)(a1 + 32) getJSContext];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = [v3 objectForKeyedSubscript:@"resolveCandidatesForJSDict"];
    id v7 = *(void **)(a1 + 32);
    v23[0] = *(void *)(a1 + 40);
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    uint64_t v9 = [v7 _prepareArguments:v8];
    id v10 = [v5 _callJSFunction:v6 withArguments:v9];

    if (([v10 isNull] & 1) == 0)
    {
      uint64_t v11 = [v10 toString];
      uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;
    }
    id v14 = sgEventsLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v19 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      int v21 = 138412290;
      int v22 = v19;
      _os_log_debug_impl(&dword_1CA650000, v14, OS_LOG_TYPE_DEBUG, "SGReverseTemplateJS: Called resolveCandidatesForJSDict with result: %@", (uint8_t *)&v21, 0xCu);
    }

    uint64_t v15 = [v4 exception];

    if (v15)
    {
      id v16 = sgEventsLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        uint64_t v20 = [v4 exception];
        int v21 = 138412290;
        int v22 = v20;
        _os_log_fault_impl(&dword_1CA650000, v16, OS_LOG_TYPE_FAULT, "SGReverseTemplateJS: JS Exception during resolveCandidatesForJSDict: %@", (uint8_t *)&v21, 0xCu);
      }
    }
    SGJSGarbageCollect([v4 JSGlobalContextRef]);
  }
  else
  {
    id v17 = sgEventsLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v21) = 0;
      _os_log_fault_impl(&dword_1CA650000, v17, OS_LOG_TYPE_FAULT, "Tried to call resolveCandidatesForJSDict without JS assets", (uint8_t *)&v21, 2u);
    }

    uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = 0;
  }
}

- (id)_eventClassificationForEntity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sgEventsLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEFAULT, "SGReverseTemplateJS: Calling js for event classification", buf, 2u);
  }

  *(void *)buf = 0;
  id v14 = buf;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__14860;
  id v17 = __Block_byref_object_dispose__14861;
  id v18 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__SGReverseTemplateJS__eventClassificationForEntity___block_invoke;
  block[3] = &unk_1E65C0700;
  id v11 = v4;
  uint64_t v12 = buf;
  block[4] = self;
  id v7 = v4;
  dispatch_sync(queue, block);
  id v8 = *((id *)v14 + 5);

  _Block_object_dispose(buf, 8);
  return v8;
}

void __53__SGReverseTemplateJS__eventClassificationForEntity___block_invoke(uint64_t a1)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1CB79B230]();
  id v3 = [*(id *)(a1 + 32) getJSContext];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = [v3 objectForKeyedSubscript:@"eventClassificationForEntity"];
    id v7 = *(void **)(a1 + 32);
    v24[0] = *(void *)(a1 + 40);
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    uint64_t v9 = [v7 _prepareArguments:v8];
    id v10 = [v5 _callJSFunction:v6 withArguments:v9];
    uint64_t v11 = [v10 toDictionary];
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    id v14 = sgEventsLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v20 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      int v22 = 138412290;
      id v23 = v20;
      _os_log_debug_impl(&dword_1CA650000, v14, OS_LOG_TYPE_DEBUG, "SGReverseTemplateJS: Called eventClassificationForEntity with result: %@", (uint8_t *)&v22, 0xCu);
    }

    uint64_t v15 = [v4 exception];

    if (v15)
    {
      id v16 = sgEventsLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        int v21 = [v4 exception];
        int v22 = 138412290;
        id v23 = v21;
        _os_log_fault_impl(&dword_1CA650000, v16, OS_LOG_TYPE_FAULT, "SGReverseTemplateJS _eventClassificationForEntity: JS Exception during eventClassificationForEntity: %@", (uint8_t *)&v22, 0xCu);
      }
    }
    SGJSGarbageCollect([v4 JSGlobalContextRef]);
  }
  else
  {
    id v17 = sgEventsLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v22) = 0;
      _os_log_fault_impl(&dword_1CA650000, v17, OS_LOG_TYPE_FAULT, "Tried to call eventClassificationForEntity without JS assets", (uint8_t *)&v22, 2u);
    }

    uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = 0;
  }
}

- (BOOL)shouldDownloadFull:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__SGReverseTemplateJS_shouldDownloadFull___block_invoke;
  block[3] = &unk_1E65C0700;
  id v9 = v4;
  id v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

void __42__SGReverseTemplateJS_shouldDownloadFull___block_invoke(uint64_t a1)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1CB79B230]();
  id v3 = [*(id *)(a1 + 32) getJSContext];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = [v3 objectForKeyedSubscript:@"shouldDownloadFull"];
    id v7 = *(void **)(a1 + 32);
    v19[0] = *(void *)(a1 + 40);
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    id v9 = [v7 _prepareArguments:v8];
    id v10 = [v5 _callJSFunction:v6 withArguments:v9];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v10 toBool];

    uint64_t v11 = sgEventsLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v15 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      int v17 = 67109120;
      LODWORD(v18) = v15;
      _os_log_debug_impl(&dword_1CA650000, v11, OS_LOG_TYPE_DEBUG, "SGReverseTemplateJS Called shouldDownloadFull with result = %d", (uint8_t *)&v17, 8u);
    }

    uint64_t v12 = [v4 exception];

    if (v12)
    {
      uint64_t v13 = sgEventsLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        id v16 = [v4 exception];
        int v17 = 138412290;
        uint64_t v18 = v16;
        _os_log_fault_impl(&dword_1CA650000, v13, OS_LOG_TYPE_FAULT, "SGReverseTemplateJS JS exception during shouldDownloadFull: %@.", (uint8_t *)&v17, 0xCu);
      }
    }
    SGJSGarbageCollect([v4 JSGlobalContextRef]);
  }
  else
  {
    char v14 = sgEventsLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v17) = 0;
      _os_log_fault_impl(&dword_1CA650000, v14, OS_LOG_TYPE_FAULT, "SGReverseTemplateJS Tried to call shouldDownloadFull without JS assets", (uint8_t *)&v17, 2u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

- (void)holdXpcTransactionForShortDelay
{
  id v2 = +[SGXpcTransaction transactionWithName:"SGReverseTemplateJS.holdXpcTransactionForShortDelay"];
  id v3 = (void *)MEMORY[0x1E4F93B18];
  id v4 = dispatch_get_global_queue(9, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __54__SGReverseTemplateJS_holdXpcTransactionForShortDelay__block_invoke;
  v6[3] = &unk_1E65BEF88;
  id v7 = v2;
  id v5 = v2;
  [v3 runAsyncOnQueue:v4 afterDelaySeconds:v6 block:0.1];
}

uint64_t __54__SGReverseTemplateJS_holdXpcTransactionForShortDelay__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) done];
}

- (id)loadJSFromASCIIFile:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    context = (void *)MEMORY[0x1CB79B230]();
    id v54 = 0;
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v5 options:1 error:&v54];
    id v53 = v54;
    if (v6)
    {
      id v7 = [v5 lastPathComponent];
      if (!v7)
      {
        v38 = [MEMORY[0x1E4F28B00] currentHandler];
        [v38 handleFailureInMethod:a2 object:self file:@"SGReverseTemplateJS.m" lineNumber:771 description:@"File URL must be a valid path."];
      }
      [(NSMutableArray *)self->_memoryMappedFiles addObject:v6];
      [(NSMutableArray *)self->_memoryMappedFileNames addObject:v7];
      __int16 v51 = [(JSContext *)self->_jsContext JSGlobalContextRef];
      uint64_t v55 = 0;
      v56 = &v55;
      uint64_t v57 = 0x2020000000;
      id v8 = (uint64_t (*)(OpaqueJSContext *))getJSContextGetGroupSymbolLoc_ptr;
      v58 = getJSContextGetGroupSymbolLoc_ptr;
      if (!getJSContextGetGroupSymbolLoc_ptr)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&uint8_t buf[8] = 3221225472;
        *(void *)&buf[16] = __getJSContextGetGroupSymbolLoc_block_invoke;
        v60 = &unk_1E65C0148;
        v61 = &v55;
        id v9 = JavaScriptCoreLibrary();
        id v10 = dlsym(v9, "JSContextGetGroup");
        *(void *)(v61[1] + 24) = v10;
        getJSContextGetGroupSymbolLoc_ptr = *(_UNKNOWN **)(v61[1] + 24);
        id v8 = (uint64_t (*)(OpaqueJSContext *))v56[3];
      }
      _Block_object_dispose(&v55, 8);
      if (v8)
      {
        uint64_t v11 = v8(v51);
        id v12 = [v5 absoluteString];
        uint64_t v13 = [v12 UTF8String];
        uint64_t v55 = 0;
        v56 = &v55;
        uint64_t v57 = 0x2020000000;
        char v14 = (uint64_t (*)(uint64_t))getJSStringCreateWithUTF8CStringSymbolLoc_ptr;
        v58 = getJSStringCreateWithUTF8CStringSymbolLoc_ptr;
        if (!getJSStringCreateWithUTF8CStringSymbolLoc_ptr)
        {
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&uint8_t buf[8] = 3221225472;
          *(void *)&buf[16] = __getJSStringCreateWithUTF8CStringSymbolLoc_block_invoke;
          v60 = &unk_1E65C0148;
          v61 = &v55;
          int v15 = JavaScriptCoreLibrary();
          id v16 = dlsym(v15, "JSStringCreateWithUTF8CString");
          *(void *)(v61[1] + 24) = v16;
          getJSStringCreateWithUTF8CStringSymbolLoc_ptr = *(_UNKNOWN **)(v61[1] + 24);
          char v14 = (uint64_t (*)(uint64_t))v56[3];
        }
        _Block_object_dispose(&v55, 8);
        if (v14)
        {
          uint64_t v17 = v14(v13);

          id v18 = v6;
          uint64_t v19 = [v18 bytes];
          uint64_t v20 = [v18 length];
          uint64_t v55 = 0;
          v56 = &v55;
          uint64_t v57 = 0x2020000000;
          int v21 = getJSScriptCreateReferencingImmortalASCIITextSymbolLoc_ptr;
          v58 = getJSScriptCreateReferencingImmortalASCIITextSymbolLoc_ptr;
          if (!getJSScriptCreateReferencingImmortalASCIITextSymbolLoc_ptr)
          {
            *(void *)buf = MEMORY[0x1E4F143A8];
            *(void *)&uint8_t buf[8] = 3221225472;
            *(void *)&buf[16] = __getJSScriptCreateReferencingImmortalASCIITextSymbolLoc_block_invoke;
            v60 = &unk_1E65C0148;
            v61 = &v55;
            int v22 = JavaScriptCoreLibrary();
            id v23 = dlsym(v22, "JSScriptCreateReferencingImmortalASCIIText");
            *(void *)(v61[1] + 24) = v23;
            getJSScriptCreateReferencingImmortalASCIITextSymbolLoc_ptr = *(_UNKNOWN **)(v61[1] + 24);
            int v21 = (void *)v56[3];
          }
          _Block_object_dispose(&v55, 8);
          if (v21)
          {
            uint64_t v24 = ((uint64_t (*)(uint64_t, uint64_t, void, uint64_t, uint64_t, void, void))v21)(v11, v17, 0, v19, v20, 0, 0);
            uint64_t v55 = 0;
            v56 = &v55;
            uint64_t v57 = 0x2020000000;
            uint64_t v25 = (void (*)(uint64_t))getJSStringReleaseSymbolLoc_ptr;
            v58 = getJSStringReleaseSymbolLoc_ptr;
            if (!getJSStringReleaseSymbolLoc_ptr)
            {
              *(void *)buf = MEMORY[0x1E4F143A8];
              *(void *)&uint8_t buf[8] = 3221225472;
              *(void *)&buf[16] = __getJSStringReleaseSymbolLoc_block_invoke;
              v60 = &unk_1E65C0148;
              v61 = &v55;
              id v26 = JavaScriptCoreLibrary();
              id v27 = dlsym(v26, "JSStringRelease");
              *(void *)(v61[1] + 24) = v27;
              getJSStringReleaseSymbolLoc_ptr = *(_UNKNOWN **)(v61[1] + 24);
              uint64_t v25 = (void (*)(uint64_t))v56[3];
            }
            _Block_object_dispose(&v55, 8);
            if (v25)
            {
              v25(v17);
              uint64_t v55 = 0;
              v56 = &v55;
              uint64_t v57 = 0x2020000000;
              uint64_t v28 = getJSScriptEvaluateSymbolLoc_ptr;
              v58 = getJSScriptEvaluateSymbolLoc_ptr;
              if (!getJSScriptEvaluateSymbolLoc_ptr)
              {
                *(void *)buf = MEMORY[0x1E4F143A8];
                *(void *)&uint8_t buf[8] = 3221225472;
                *(void *)&buf[16] = __getJSScriptEvaluateSymbolLoc_block_invoke;
                v60 = &unk_1E65C0148;
                v61 = &v55;
                uint64_t v29 = JavaScriptCoreLibrary();
                v30 = dlsym(v29, "JSScriptEvaluate");
                *(void *)(v61[1] + 24) = v30;
                getJSScriptEvaluateSymbolLoc_ptr = *(_UNKNOWN **)(v61[1] + 24);
                uint64_t v28 = (void *)v56[3];
              }
              _Block_object_dispose(&v55, 8);
              if (v28)
              {
                uint64_t v31 = ((uint64_t (*)(OpaqueJSContext *, uint64_t, void, void))v28)(v51, v24, 0, 0);
                uint64_t v55 = 0;
                v56 = &v55;
                uint64_t v57 = 0x2020000000;
                id v32 = (void (*)(uint64_t))getJSScriptReleaseSymbolLoc_ptr;
                v58 = getJSScriptReleaseSymbolLoc_ptr;
                if (!getJSScriptReleaseSymbolLoc_ptr)
                {
                  *(void *)buf = MEMORY[0x1E4F143A8];
                  *(void *)&uint8_t buf[8] = 3221225472;
                  *(void *)&buf[16] = __getJSScriptReleaseSymbolLoc_block_invoke;
                  v60 = &unk_1E65C0148;
                  v61 = &v55;
                  long long v33 = JavaScriptCoreLibrary();
                  long long v34 = dlsym(v33, "JSScriptRelease");
                  *(void *)(v61[1] + 24) = v34;
                  getJSScriptReleaseSymbolLoc_ptr = *(_UNKNOWN **)(v61[1] + 24);
                  id v32 = (void (*)(uint64_t))v56[3];
                }
                _Block_object_dispose(&v55, 8);
                if (v32)
                {
                  v32(v24);
                  long long v35 = [getJSValueClass() valueWithJSValueRef:v31 inContext:self->_jsContext];
LABEL_30:

                  goto LABEL_31;
                }
                __int16 v49 = [MEMORY[0x1E4F28B00] currentHandler];
                v50 = [NSString stringWithUTF8String:"void SGJSScriptRelease(JSScriptRef)"];
                objc_msgSend(v49, "handleFailureInFunction:file:lineNumber:description:", v50, @"SGReverseTemplateJS.m", 55, @"%s", dlerror());
              }
              else
              {
                __int16 v47 = [MEMORY[0x1E4F28B00] currentHandler];
                v48 = objc_msgSend(NSString, "stringWithUTF8String:", "JSValueRef SGJSScriptEvaluate(JSContextRef, JSScriptRef, JSValueRef, JSValueRef *)");
                objc_msgSend(v47, "handleFailureInFunction:file:lineNumber:description:", v48, @"SGReverseTemplateJS.m", 54, @"%s", dlerror());
              }
            }
            else
            {
              __int16 v45 = [MEMORY[0x1E4F28B00] currentHandler];
              v46 = [NSString stringWithUTF8String:"void SGJSStringRelease(JSStringRef)"];
              objc_msgSend(v45, "handleFailureInFunction:file:lineNumber:description:", v46, @"SGReverseTemplateJS.m", 53, @"%s", dlerror());
            }
          }
          else
          {
            __int16 v43 = [MEMORY[0x1E4F28B00] currentHandler];
            v44 = objc_msgSend(NSString, "stringWithUTF8String:", "JSScriptRef SGJSScriptCreateReferencingImmortalASCIIText(JSContextGroupRef, JSStringRef, int, const char *, size_t, JSStringRef *, int *)");
            objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v44, @"SGReverseTemplateJS.m", 52, @"%s", dlerror());
          }
        }
        else
        {
          __int16 v41 = [MEMORY[0x1E4F28B00] currentHandler];
          v42 = [NSString stringWithUTF8String:"JSStringRef SGJSStringCreateWithUTF8CString(const char *)"];
          objc_msgSend(v41, "handleFailureInFunction:file:lineNumber:description:", v42, @"SGReverseTemplateJS.m", 51, @"%s", dlerror());
        }
      }
      else
      {
        __int16 v39 = [MEMORY[0x1E4F28B00] currentHandler];
        v40 = [NSString stringWithUTF8String:"JSContextGroupRef SGJSContextGetGroup(JSContextRef)"];
        objc_msgSend(v39, "handleFailureInFunction:file:lineNumber:description:", v40, @"SGReverseTemplateJS.m", 50, @"%s", dlerror());
      }
      __break(1u);
    }
    id v7 = sgEventsLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v5;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v53;
      _os_log_fault_impl(&dword_1CA650000, v7, OS_LOG_TYPE_FAULT, "SGReverseTemplateJS loadJSFromASCIIFile: Error loading JS file %@: %@", buf, 0x16u);
    }
    long long v35 = 0;
    goto LABEL_30;
  }
  long long v36 = sgEventsLogHandle();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1CA650000, v36, OS_LOG_TYPE_FAULT, "SGReverseTemplateJS loadJSFromASCIIFile: no file defined.", buf, 2u);
  }

  long long v35 = 0;
LABEL_31:

  return v35;
}

- (id)sfFlightStatusToString:(int)a3
{
  if ((a3 - 1) > 8) {
    return @"unknown";
  }
  else {
    return off_1E65B85E0[a3 - 1];
  }
}

- (id)dictionaryFromTimezone:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [v3 name];

  if (v5)
  {
    id v6 = [v3 name];
    [v4 setObject:v6 forKeyedSubscript:@"name"];
  }
  id v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "secondsFromGMT"));
  [v4 setObject:v7 forKeyedSubscript:@"secondsFromGMT"];

  return v4;
}

- (id)sfAirportToDictionnary:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1CB79B230]();
  id v6 = objc_opt_new();
  id v7 = [v4 code];
  if (v7)
  {
    [v6 setObject:v7 forKeyedSubscript:@"code"];
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA98] null];
    [v6 setObject:v8 forKeyedSubscript:@"code"];
  }
  id v9 = [v4 timezone];
  id v10 = [(SGReverseTemplateJS *)self dictionaryFromTimezone:v9];
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"timezone"];
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
    [v6 setObject:v11 forKeyedSubscript:@"timezone"];
  }
  id v12 = [v4 city];
  if (v12)
  {
    [v6 setObject:v12 forKeyedSubscript:@"city"];
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
    [v6 setObject:v13 forKeyedSubscript:@"city"];
  }
  char v14 = [v4 street];
  if (v14)
  {
    [v6 setObject:v14 forKeyedSubscript:@"street"];
  }
  else
  {
    int v15 = [MEMORY[0x1E4F1CA98] null];
    [v6 setObject:v15 forKeyedSubscript:@"street"];
  }
  id v16 = [v4 district];
  if (v16)
  {
    [v6 setObject:v16 forKeyedSubscript:@"district"];
  }
  else
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
    [v6 setObject:v17 forKeyedSubscript:@"district"];
  }
  id v18 = [v4 state];
  if (v18)
  {
    [v6 setObject:v18 forKeyedSubscript:@"state"];
  }
  else
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
    [v6 setObject:v19 forKeyedSubscript:@"state"];
  }
  uint64_t v20 = [v4 postalCode];
  if (v20)
  {
    [v6 setObject:v20 forKeyedSubscript:@"postalCode"];
  }
  else
  {
    int v21 = [MEMORY[0x1E4F1CA98] null];
    [v6 setObject:v21 forKeyedSubscript:@"postalCode"];
  }
  int v22 = [v4 countryCode];
  if (v22)
  {
    [v6 setObject:v22 forKeyedSubscript:@"countryCode"];
  }
  else
  {
    id v23 = [MEMORY[0x1E4F1CA98] null];
    [v6 setObject:v23 forKeyedSubscript:@"countryCode"];
  }
  uint64_t v24 = [v4 country];
  if (v24)
  {
    [v6 setObject:v24 forKeyedSubscript:@"country"];
  }
  else
  {
    uint64_t v25 = [MEMORY[0x1E4F1CA98] null];
    [v6 setObject:v25 forKeyedSubscript:@"country"];
  }
  id v26 = [v4 name];
  if (v26)
  {
    [v6 setObject:v26 forKeyedSubscript:@"name"];
  }
  else
  {
    id v27 = [MEMORY[0x1E4F1CA98] null];
    [v6 setObject:v27 forKeyedSubscript:@"name"];
  }
  uint64_t v28 = objc_opt_new();
  uint64_t v29 = NSNumber;
  v30 = [v4 location];
  [v30 lat];
  uint64_t v31 = objc_msgSend(v29, "numberWithDouble:");
  if (v31)
  {
    [v28 setObject:v31 forKeyedSubscript:@"lat"];
  }
  else
  {
    id v32 = [MEMORY[0x1E4F1CA98] null];
    [v28 setObject:v32 forKeyedSubscript:@"lat"];
  }
  long long v33 = NSNumber;
  long long v34 = [v4 location];
  [v34 lng];
  long long v35 = objc_msgSend(v33, "numberWithDouble:");
  if (v35)
  {
    [v28 setObject:v35 forKeyedSubscript:@"lng"];
  }
  else
  {
    long long v36 = [MEMORY[0x1E4F1CA98] null];
    [v28 setObject:v36 forKeyedSubscript:@"lng"];
  }
  if (v28)
  {
    [v6 setObject:v28 forKeyedSubscript:@"location"];
  }
  else
  {
    __int16 v37 = [MEMORY[0x1E4F1CA98] null];
    [v6 setObject:v37 forKeyedSubscript:@"location"];
  }
  v38 = (void *)[v6 copy];

  return v38;
}

- (id)formattedDate:(id)a3 withTimezone:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)MEMORY[0x1CB79B230]();
  if (!v7)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"SGReverseTemplateJS.m", 676, @"Can't create formattedDate, date is nil" object file lineNumber description];
  }
  dateFormatter = self->_dateFormatter;
  if (dateFormatter)
  {
    if (v8)
    {
LABEL_5:
      uint64_t v11 = dateFormatter;
      [(NSISO8601DateFormatter *)v11 setTimeZone:v8];
      unint64_t v12 = [(NSISO8601DateFormatter *)v11 formatOptions] | 0x40;
      goto LABEL_8;
    }
  }
  else
  {
    dateFormatter = (NSISO8601DateFormatter *)objc_opt_new();
    uint64_t v13 = self->_dateFormatter;
    self->_dateFormatter = dateFormatter;

    if (v8) {
      goto LABEL_5;
    }
  }
  char v14 = (void *)MEMORY[0x1E4F1CAF0];
  int v15 = dateFormatter;
  id v16 = [v14 timeZoneForSecondsFromGMT:0];
  [(NSISO8601DateFormatter *)v15 setTimeZone:v16];

  unint64_t v12 = [(NSISO8601DateFormatter *)v15 formatOptions] & 0xFFFFFFFFFFFFFFBFLL;
LABEL_8:
  [(NSISO8601DateFormatter *)dateFormatter setFormatOptions:v12];
  uint64_t v17 = [(NSISO8601DateFormatter *)dateFormatter stringFromDate:v7];

  return v17;
}

- (id)sfFlightsToDictionary:(id)a3
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v76 = objc_opt_new();
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id obj = v4;
  uint64_t v77 = [obj countByEnumeratingWithState:&v89 objects:v94 count:16];
  if (v77)
  {
    uint64_t v75 = *(void *)v90;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v90 != v75) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v89 + 1) + 8 * v5);
        uint64_t v7 = MEMORY[0x1CB79B230]();
        id v8 = objc_opt_new();
        id v9 = [v6 flightNumber];
        v80 = v8;
        if (v9)
        {
          [v8 setObject:v9 forKeyedSubscript:@"flightNumber"];
        }
        else
        {
          id v10 = [MEMORY[0x1E4F1CA98] null];
          [v80 setObject:v10 forKeyedSubscript:@"flightNumber"];

          id v8 = v80;
        }

        uint64_t v11 = [v6 carrierCode];
        if (v11)
        {
          [v8 setObject:v11 forKeyedSubscript:@"carrierCode"];
        }
        else
        {
          unint64_t v12 = [MEMORY[0x1E4F1CA98] null];
          [v80 setObject:v12 forKeyedSubscript:@"carrierCode"];

          id v8 = v80;
        }

        uint64_t v13 = [v6 carrierName];
        if (v13)
        {
          [v8 setObject:v13 forKeyedSubscript:@"carrierName"];
        }
        else
        {
          char v14 = [MEMORY[0x1E4F1CA98] null];
          [v80 setObject:v14 forKeyedSubscript:@"carrierName"];

          id v8 = v80;
        }

        int v15 = [v6 carrierPhoneNumber];
        if (v15)
        {
          [v8 setObject:v15 forKeyedSubscript:@"carrierPhoneNumber"];
        }
        else
        {
          id v16 = [MEMORY[0x1E4F1CA98] null];
          [v80 setObject:v16 forKeyedSubscript:@"carrierPhoneNumber"];

          id v8 = v80;
        }

        uint64_t v17 = [v6 flightID];
        if (v17)
        {
          [v8 setObject:v17 forKeyedSubscript:@"flightID"];
        }
        else
        {
          id v18 = [MEMORY[0x1E4F1CA98] null];
          [v80 setObject:v18 forKeyedSubscript:@"flightID"];

          id v8 = v80;
        }

        uint64_t v19 = [v6 operatorCarrierCode];
        if (v19)
        {
          [v8 setObject:v19 forKeyedSubscript:@"operatorCarrierCode"];
        }
        else
        {
          uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
          [v80 setObject:v20 forKeyedSubscript:@"operatorCarrierCode"];

          id v8 = v80;
        }

        int v21 = [v6 operatorFlightNumber];
        v78 = (void *)v7;
        uint64_t v79 = v5;
        if (v21)
        {
          [v8 setObject:v21 forKeyedSubscript:@"operatorFlightNumber"];
        }
        else
        {
          uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
          id v23 = v8;
          uint64_t v24 = (void *)v22;
          [v23 setObject:v22 forKeyedSubscript:@"operatorFlightNumber"];
        }
        uint64_t v25 = objc_opt_new();
        long long v85 = 0u;
        long long v86 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        id v81 = [v6 legs];
        uint64_t v84 = [v81 countByEnumeratingWithState:&v85 objects:v93 count:16];
        if (v84)
        {
          uint64_t v82 = *(void *)v86;
          v83 = v25;
          do
          {
            for (uint64_t i = 0; i != v84; ++i)
            {
              if (*(void *)v86 != v82) {
                objc_enumerationMutation(v81);
              }
              id v27 = *(void **)(*((void *)&v85 + 1) + 8 * i);
              uint64_t v28 = objc_opt_new();
              uint64_t v29 = -[SGReverseTemplateJS sfFlightStatusToString:](self, "sfFlightStatusToString:", [v27 status]);
              if (v29)
              {
                [v28 setObject:v29 forKeyedSubscript:@"status"];
              }
              else
              {
                v30 = [MEMORY[0x1E4F1CA98] null];
                [v28 setObject:v30 forKeyedSubscript:@"status"];
              }
              uint64_t v31 = [v27 title];
              if (v31)
              {
                [v28 setObject:v31 forKeyedSubscript:@"title"];
              }
              else
              {
                id v32 = [MEMORY[0x1E4F1CA98] null];
                [v28 setObject:v32 forKeyedSubscript:@"title"];
              }
              long long v33 = [v27 departurePublishedTime];
              long long v34 = [v27 departureAirport];
              long long v35 = [v34 timezone];
              long long v36 = [(SGReverseTemplateJS *)self formattedDate:v33 withTimezone:v35];
              if (v36)
              {
                [v28 setObject:v36 forKeyedSubscript:@"departurePublishedTime"];
              }
              else
              {
                __int16 v37 = [MEMORY[0x1E4F1CA98] null];
                [v28 setObject:v37 forKeyedSubscript:@"departurePublishedTime"];
              }
              v38 = [v27 departureActualTime];
              __int16 v39 = [v27 departureAirport];
              v40 = [v39 timezone];
              __int16 v41 = [(SGReverseTemplateJS *)self formattedDate:v38 withTimezone:v40];
              if (v41)
              {
                [v28 setObject:v41 forKeyedSubscript:@"departureActualTime"];
              }
              else
              {
                v42 = [MEMORY[0x1E4F1CA98] null];
                [v28 setObject:v42 forKeyedSubscript:@"departureActualTime"];
              }
              __int16 v43 = [v27 departureTerminal];
              if (v43)
              {
                [v28 setObject:v43 forKeyedSubscript:@"departureTerminal"];
              }
              else
              {
                v44 = [MEMORY[0x1E4F1CA98] null];
                [v28 setObject:v44 forKeyedSubscript:@"departureTerminal"];
              }
              __int16 v45 = [v27 departureGate];
              if (v45)
              {
                [v28 setObject:v45 forKeyedSubscript:@"departureGate"];
              }
              else
              {
                v46 = [MEMORY[0x1E4F1CA98] null];
                [v28 setObject:v46 forKeyedSubscript:@"departureGate"];
              }
              __int16 v47 = [v27 arrivalPublishedTime];
              v48 = [v27 arrivalAirport];
              __int16 v49 = [v48 timezone];
              v50 = [(SGReverseTemplateJS *)self formattedDate:v47 withTimezone:v49];
              if (v50)
              {
                [v28 setObject:v50 forKeyedSubscript:@"arrivalPublishedTime"];
              }
              else
              {
                __int16 v51 = [MEMORY[0x1E4F1CA98] null];
                [v28 setObject:v51 forKeyedSubscript:@"arrivalPublishedTime"];
              }
              v52 = [v27 arrivalActualTime];
              id v53 = [v27 arrivalAirport];
              id v54 = [v53 timezone];
              uint64_t v55 = [(SGReverseTemplateJS *)self formattedDate:v52 withTimezone:v54];
              if (v55)
              {
                [v28 setObject:v55 forKeyedSubscript:@"arrivalActualTime"];
              }
              else
              {
                v56 = [MEMORY[0x1E4F1CA98] null];
                [v28 setObject:v56 forKeyedSubscript:@"arrivalActualTime"];
              }
              uint64_t v57 = [v27 arrivalTerminal];
              if (v57)
              {
                [v28 setObject:v57 forKeyedSubscript:@"arrivalTerminal"];
              }
              else
              {
                v58 = [MEMORY[0x1E4F1CA98] null];
                [v28 setObject:v58 forKeyedSubscript:@"arrivalTerminal"];
              }
              uint64_t v25 = v83;

              v59 = [v27 arrivalGate];
              if (v59)
              {
                [v28 setObject:v59 forKeyedSubscript:@"arrivalGate"];
              }
              else
              {
                v60 = [MEMORY[0x1E4F1CA98] null];
                [v28 setObject:v60 forKeyedSubscript:@"arrivalGate"];
              }
              v61 = [v27 departureAirport];
              uint64_t v62 = [(SGReverseTemplateJS *)self sfAirportToDictionnary:v61];
              if (v62)
              {
                [v28 setObject:v62 forKeyedSubscript:@"departureAirport"];
              }
              else
              {
                v63 = [MEMORY[0x1E4F1CA98] null];
                [v28 setObject:v63 forKeyedSubscript:@"departureAirport"];
              }
              v64 = [v27 arrivalAirport];
              v65 = [(SGReverseTemplateJS *)self sfAirportToDictionnary:v64];
              if (v65)
              {
                [v28 setObject:v65 forKeyedSubscript:@"arrivalAirport"];
              }
              else
              {
                v66 = [MEMORY[0x1E4F1CA98] null];
                [v28 setObject:v66 forKeyedSubscript:@"arrivalAirport"];
              }
              v67 = [v27 divertedAirport];
              v68 = [(SGReverseTemplateJS *)self sfAirportToDictionnary:v67];
              if (v68)
              {
                [v28 setObject:v68 forKeyedSubscript:@"divertedAirport"];
              }
              else
              {
                v69 = [MEMORY[0x1E4F1CA98] null];
                [v28 setObject:v69 forKeyedSubscript:@"divertedAirport"];
              }
              [v83 addObject:v28];
            }
            uint64_t v84 = [v81 countByEnumeratingWithState:&v85 objects:v93 count:16];
          }
          while (v84);
        }

        if (v25)
        {
          v70 = v80;
          [v80 setObject:v25 forKeyedSubscript:@"legs"];
        }
        else
        {
          v71 = [MEMORY[0x1E4F1CA98] null];
          v70 = v80;
          [v80 setObject:v71 forKeyedSubscript:@"legs"];
        }
        [v76 addObject:v70];

        uint64_t v5 = v79 + 1;
      }
      while (v79 + 1 != v77);
      uint64_t v77 = [obj countByEnumeratingWithState:&v89 objects:v94 count:16];
    }
    while (v77);
  }

  v72 = (void *)[v76 copy];
  return v72;
}

- (void)flightInformationWithAirlineCode:(id)a3 flightNumber:(id)a4 flightDate:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  char v14 = (void *)MEMORY[0x1E4F93BD8];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  void v19[2] = __86__SGReverseTemplateJS_flightInformationWithAirlineCode_flightNumber_flightDate_reply___block_invoke;
  v19[3] = &unk_1E65B8558;
  v19[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  [v14 runWithExceptionBarrier:v19];
}

void __86__SGReverseTemplateJS_flightInformationWithAirlineCode_flightNumber_flightDate_reply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) flightInformationWithAirlineCode:*(void *)(a1 + 40) flightNumber:*(void *)(a1 + 48) flightDate:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) holdXpcTransactionForShortDelay];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (id)flightInformationWithAirlineCode:(id)a3 flightNumber:(id)a4 flightDate:(id)a5
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v11;
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__14860;
  uint64_t v62 = __Block_byref_object_dispose__14861;
  id v63 = 0;
  if (!v9)
  {
    id v13 = sgEventsLogHandle();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    uint64_t v28 = "SGReverseTemplateJS flightInformationWithAirlineCode: Can't get flightInformation, airlineCode is nil";
LABEL_19:
    _os_log_fault_impl(&dword_1CA650000, v13, OS_LOG_TYPE_FAULT, v28, buf, 2u);
    goto LABEL_20;
  }
  if (!v10)
  {
    id v13 = sgEventsLogHandle();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    uint64_t v28 = "SGReverseTemplateJS flightInformationWithAirlineCode: Can't get flightInformation, flightNumber is nil";
    goto LABEL_19;
  }
  if (!v11)
  {
    id v13 = sgEventsLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v28 = "SGReverseTemplateJS flightInformationWithAirlineCode: Can't get flightInformation, flightDate is nil";
      goto LABEL_19;
    }
LABEL_20:
    id v27 = 0;
    goto LABEL_32;
  }
  id v13 = [[NSString alloc] initWithFormat:@"%@%@", v9, v10];
  char v14 = objc_opt_new();
  [v14 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
  id v15 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
  [v14 setTimeZone:v15];
  v44 = v14;

  __int16 v43 = [v14 dateFromString:v12];
  if (v43)
  {
    id v16 = [MEMORY[0x1E4F28B50] mainBundle];
    id v17 = [v16 bundleIdentifier];

    if (!v17)
    {
      id v18 = sgEventsLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CA650000, v18, OS_LOG_TYPE_ERROR, "SGReverseTemplateJS flightInformationWithAirlineCode: bundleIdentifier is undefined.", buf, 2u);
      }

      id v17 = @"com.apple.undefined";
    }
    v40 = v17;
    v42 = [MEMORY[0x1E4F5CBB0] flightRequestForQuery:v13 date:v43 appBundleId:v17];
    if (!v42)
    {
      __int16 v39 = [MEMORY[0x1E4F28B00] currentHandler];
      [v39 handleFailureInMethod:a2, self, @"SGReverseTemplateJS.m", 589, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];
    }
    uint64_t v19 = [MEMORY[0x1E4F5CBD8] sharedSession];
    *(void *)buf = 0;
    id v53 = buf;
    uint64_t v54 = 0x3032000000;
    uint64_t v55 = __Block_byref_object_copy__14860;
    v56 = __Block_byref_object_dispose__14861;
    id v57 = 0;
    dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __80__SGReverseTemplateJS_flightInformationWithAirlineCode_flightNumber_flightDate___block_invoke;
    v45[3] = &unk_1E65B8530;
    v50 = &v58;
    __int16 v51 = buf;
    v45[4] = self;
    id v21 = v9;
    id v46 = v21;
    id v22 = v10;
    id v47 = v22;
    id v23 = v12;
    id v48 = v23;
    uint64_t v24 = v20;
    __int16 v49 = v24;
    __int16 v41 = v19;
    uint64_t v25 = [v19 taskWithRequest:v42 completion:v45];
    [v25 resume];
    if ([MEMORY[0x1E4F93B18] waitForSemaphore:v24 timeoutSeconds:60.0])
    {
      id v26 = v25;
      id v27 = (id)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      v30 = sgEventsLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v38 = v59[5];
        *(_DWORD *)v67 = 138413058;
        id v68 = v21;
        __int16 v69 = 2112;
        id v70 = v22;
        __int16 v71 = 2112;
        id v72 = v23;
        __int16 v73 = 2112;
        uint64_t v74 = v38;
        _os_log_debug_impl(&dword_1CA650000, v30, OS_LOG_TYPE_DEBUG, "SGReverseTemplateJS flightInformationWithAirlineCode: CoreParsec results for: %@, %@, %@ = %@", v67, 0x2Au);
      }

      if (![(id)v59[5] count])
      {
        uint64_t v31 = (void *)*((void *)v53 + 5);
        if (v31)
        {
          v65[0] = @"error";
          v64[0] = @"type";
          v64[1] = @"errorCode";
          id v32 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v31, "code"));
          v65[1] = v32;
          v64[2] = @"userInfo";
          long long v33 = [*((id *)v53 + 5) userInfo];
          v65[2] = v33;
          long long v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:3];
          v66 = v34;
          uint64_t v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v66 count:1];
          long long v36 = (void *)v59[5];
          v59[5] = v35;
        }
      }
      id v26 = v25;
      id v27 = (id)v59[5];
    }

    _Block_object_dispose(buf, 8);
    uint64_t v29 = v40;
  }
  else
  {
    uint64_t v29 = sgEventsLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA650000, v29, OS_LOG_TYPE_ERROR, "SGReverseTemplateJS flightInformationWithAirlineCode: Can't get flightInformation, flightDate is malformed", buf, 2u);
    }
    id v27 = 0;
  }

LABEL_32:
  _Block_object_dispose(&v58, 8);

  return v27;
}

void __80__SGReverseTemplateJS_flightInformationWithAirlineCode_flightNumber_flightDate___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = *(void **)(a1 + 32);
  id v9 = [a3 flightResults];
  uint64_t v10 = [v8 sfFlightsToDictionary:v9];
  uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), a4);
    id v13 = sgEventsLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(a1 + 40);
      uint64_t v15 = *(void *)(a1 + 48);
      uint64_t v16 = *(void *)(a1 + 56);
      int v17 = 138413058;
      uint64_t v18 = v14;
      __int16 v19 = 2112;
      uint64_t v20 = v15;
      __int16 v21 = 2112;
      uint64_t v22 = v16;
      __int16 v23 = 2112;
      id v24 = v7;
      _os_log_error_impl(&dword_1CA650000, v13, OS_LOG_TYPE_ERROR, "flightInformationWithAirlineCode flightInformationWithAirlineCode: error when calling CoreParsec for: %@, %@, %@ = %@", (uint8_t *)&v17, 0x2Au);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
}

- (id)md5Hash:(id)a3
{
  return (id)objc_msgSend(a3, "sg_md5Hash");
}

- (id)preprocessPackedSGMessage:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"html"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = (void *)[v3 mutableCopy];
    id v7 = NSString;
    id v8 = [v6 objectForKeyedSubscript:@"html"];
    id v9 = objc_msgSend(v7, "_pas_stringWithDataNoCopy:encoding:nullTerminated:", v8, 4, 0);
    [v6 setObject:v9 forKeyedSubscript:@"html"];

    id v3 = v6;
  }
  return v3;
}

- (id)mappedArrayBufferForFileName:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[SGAsset asset];
  id v6 = [v5 filesystemPathForAssetDataRelativePath:@"ReverseTemplateJS"];

  id v7 = (void *)MEMORY[0x1CB79B230]();
  id v8 = [v6 stringByAppendingPathComponent:v4];
  id v25 = 0;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v8 options:1 error:&v25];
  id v24 = v25;
  if (v9)
  {
    CFRetain(v9);
    __int16 v23 = [(JSContext *)self->_jsContext JSGlobalContextRef];
    id v10 = v9;
    uint64_t v11 = [v10 bytes];
    uint64_t v12 = [v10 length];
    id v13 = v4;
    uint64_t v26 = 0;
    id v27 = &v26;
    uint64_t v28 = 0x2020000000;
    uint64_t v14 = (uint64_t (*)(OpaqueJSContext *, uint64_t, uint64_t, void (*)(int, CFTypeRef), id, void))getJSObjectMakeArrayBufferWithBytesNoCopySymbolLoc_ptr;
    uint64_t v29 = getJSObjectMakeArrayBufferWithBytesNoCopySymbolLoc_ptr;
    if (!getJSObjectMakeArrayBufferWithBytesNoCopySymbolLoc_ptr)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&uint8_t buf[8] = 3221225472;
      *(void *)&buf[16] = __getJSObjectMakeArrayBufferWithBytesNoCopySymbolLoc_block_invoke;
      uint64_t v31 = &unk_1E65C0148;
      id v32 = &v26;
      uint64_t v15 = JavaScriptCoreLibrary();
      uint64_t v16 = dlsym(v15, "JSObjectMakeArrayBufferWithBytesNoCopy");
      *(void *)(v32[1] + 24) = v16;
      getJSObjectMakeArrayBufferWithBytesNoCopySymbolLoc_ptr = *(_UNKNOWN **)(v32[1] + 24);
      uint64_t v14 = (uint64_t (*)(OpaqueJSContext *, uint64_t, uint64_t, void (*)(int, CFTypeRef), id, void))v27[3];
    }
    _Block_object_dispose(&v26, 8);
    if (!v14)
    {
      __int16 v21 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v22 = objc_msgSend(NSString, "stringWithUTF8String:", "JSObjectRef SGJSObjectMakeArrayBufferWithBytesNoCopy(JSContextRef, void *, size_t, JSTypedArrayBytesDeallocator, void *, JSValueRef *)");
      objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, @"SGReverseTemplateJS.m", 49, @"%s", dlerror());

      __break(1u);
    }
    uint64_t v17 = v14(v23, v11, v12, typedArrayDeallocatorRelease, v10, 0);
    id v4 = v13;
    uint64_t v18 = [getJSValueClass() valueWithJSValueRef:v17 inContext:self->_jsContext];
  }
  else
  {
    __int16 v19 = sgEventsLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v24;
      _os_log_fault_impl(&dword_1CA650000, v19, OS_LOG_TYPE_FAULT, "Could not load data asset %@: %@", buf, 0x16u);
    }

    uint64_t v18 = 0;
  }

  return v18;
}

- (void)initCurrentAsset
{
  v73[1] = *MEMORY[0x1E4F143B8];
  id v3 = self->_localeIdentifier;
  id v4 = self->_queue;
  id location = 0;
  objc_initWeak(&location, self);
  v70[0] = 0;
  v70[1] = v70;
  v70[2] = 0x2020000000;
  v70[3] = 0;
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x2020000000;
  char v69 = 0;
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __39__SGReverseTemplateJS_initCurrentAsset__block_invoke;
  void v64[3] = &unk_1E65B82D0;
  objc_copyWeak(&v65, &location);
  uint64_t v5 = (void *)MEMORY[0x1CB79B4C0](v64);
  [(JSContext *)self->_jsContext setObject:v5 forKeyedSubscript:@"load"];

  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_2;
  v59[3] = &unk_1E65B82F8;
  v61 = &v66;
  uint64_t v62 = v70;
  id v6 = v4;
  uint64_t v60 = v6;
  objc_copyWeak(&v63, &location);
  id v7 = (void *)MEMORY[0x1CB79B4C0](v59);
  [(JSContext *)self->_jsContext setObject:v7 forKeyedSubscript:@"loadWithVmGrowthCounter"];

  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_4;
  v57[3] = &unk_1E65B82D0;
  objc_copyWeak(&v58, &location);
  id v8 = (void *)MEMORY[0x1CB79B4C0](v57);
  [(JSContext *)self->_jsContext setObject:v8 forKeyedSubscript:@"loadNoVmGrowthCounter"];

  [(JSContext *)self->_jsContext setObject:&__block_literal_global_77 forKeyedSubscript:@"debug"];
  [(JSContext *)self->_jsContext setObject:&__block_literal_global_83 forKeyedSubscript:@"developerLog"];
  id v9 = [(JSContext *)self->_jsContext objectForKeyedSubscript:@"console"];
  LODWORD(v8) = v9 == 0;

  if (v8)
  {
    id v72 = @"log";
    id v10 = [(JSContext *)self->_jsContext objectForKeyedSubscript:@"debug"];
    v73[0] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:&v72 count:1];
    [(JSContext *)self->_jsContext setObject:v11 forKeyedSubscript:@"console"];
  }
  uint64_t v12 = self->_dd;
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_94;
  v55[3] = &unk_1E65B8340;
  id v13 = v12;
  v56 = v13;
  uint64_t v14 = (void *)MEMORY[0x1CB79B4C0](v55);
  [(JSContext *)self->_jsContext setObject:v14 forKeyedSubscript:@"runDataDetectors"];

  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_2_99;
  v53[3] = &unk_1E65B8368;
  uint64_t v15 = v13;
  uint64_t v54 = v15;
  uint64_t v16 = (void *)MEMORY[0x1CB79B4C0](v53);
  [(JSContext *)self->_jsContext setObject:v16 forKeyedSubscript:@"runDataDetectorsWithMetadata"];

  [(JSContext *)self->_jsContext setObject:&__block_literal_global_109_15104 forKeyedSubscript:@"parseMicrodata"];
  [(JSContext *)self->_jsContext setObject:&__block_literal_global_116 forKeyedSubscript:@"tokenizeString"];
  [(JSContext *)self->_jsContext setObject:&__block_literal_global_124_15107 forKeyedSubscript:@"decodeEntitiesInString"];
  [(JSContext *)self->_jsContext setObject:&__block_literal_global_130 forKeyedSubscript:@"detectLanguageForString"];
  uint64_t v17 = +[SGAsset asset];
  uint64_t v18 = [v17 assetVersion];

  if (v18 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v19 = 0;
  }
  else {
    uint64_t v19 = v18;
  }
  uint64_t v20 = [NSNumber numberWithUnsignedInteger:v19];
  [(JSContext *)self->_jsContext setObject:v20 forKeyedSubscript:@"ASSET_VERSION"];

  [(JSContext *)self->_jsContext setObject:&__block_literal_global_141 forKeyedSubscript:@"htmlToPlainText"];
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_8;
  v51[3] = &unk_1E65BB830;
  __int16 v21 = v3;
  v52 = v21;
  uint64_t v22 = (void *)MEMORY[0x1CB79B4C0](v51);
  [(JSContext *)self->_jsContext setObject:v22 forKeyedSubscript:@"getCurrentLocale"];

  [(JSContext *)self->_jsContext setObject:&__block_literal_global_156 forKeyedSubscript:@"getLinguisticTagsForString"];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_11;
  v49[3] = &unk_1E65B8410;
  __int16 v23 = v21;
  v50 = v23;
  id v24 = (void *)MEMORY[0x1CB79B4C0](v49);
  [(JSContext *)self->_jsContext setObject:v24 forKeyedSubscript:@"getPreferredLocalizationsFromArray"];

  [(JSContext *)self->_jsContext setObject:&__block_literal_global_181 forKeyedSubscript:@"getLocalizedFormattedDatetimeString"];
  [(JSContext *)self->_jsContext setObject:&__block_literal_global_190 forKeyedSubscript:@"isInternalDevice"];
  [(JSContext *)self->_jsContext setObject:&__block_literal_global_195 forKeyedSubscript:@"isSplashScreenAcknowledged"];
  [(JSContext *)self->_jsContext setObject:&__block_literal_global_201 forKeyedSubscript:@"allowAnyDomainForMarkup"];
  [(JSContext *)self->_jsContext setObject:&__block_literal_global_206 forKeyedSubscript:@"allowUnverifiedSourceForMarkup"];
  [(JSContext *)self->_jsContext setObject:&__block_literal_global_212 forKeyedSubscript:@"getSystemVersion"];
  [(JSContext *)self->_jsContext setObject:&__block_literal_global_220 forKeyedSubscript:@"getGMTOffsetFromDateTimeAndTimeZoneOlsonCode"];
  if (initCurrentAsset_onceToken != -1) {
    dispatch_once(&initCurrentAsset_onceToken, &__block_literal_global_228);
  }
  uint64_t v25 = mach_absolute_time();
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_21;
  v48[3] = &__block_descriptor_40_e5_d8__0l;
  v48[4] = v25;
  uint64_t v26 = (void *)MEMORY[0x1CB79B4C0](v48);
  [(JSContext *)self->_jsContext setObject:v26 forKeyedSubscript:@"secondsForTiming"];

  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_22;
  v45[3] = &unk_1E65BB450;
  id v27 = v6;
  id v46 = v27;
  objc_copyWeak(&v47, &location);
  uint64_t v28 = (void *)MEMORY[0x1CB79B4C0](v45);
  [(JSContext *)self->_jsContext setObject:v28 forKeyedSubscript:@"freeJSContext"];

  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_24;
  v43[3] = &unk_1E65B84B8;
  objc_copyWeak(&v44, &location);
  uint64_t v29 = (void *)MEMORY[0x1CB79B4C0](v43);
  [(JSContext *)self->_jsContext setObject:v29 forKeyedSubscript:@"getFlightInformation"];

  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_25;
  v41[3] = &unk_1E65B84E0;
  objc_copyWeak(&v42, &location);
  v30 = (void *)MEMORY[0x1CB79B4C0](v41);
  [(JSContext *)self->_jsContext setObject:v30 forKeyedSubscript:@"getMD5Hash"];

  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_26;
  v39[3] = &unk_1E65B8508;
  objc_copyWeak(&v40, &location);
  uint64_t v31 = (void *)MEMORY[0x1CB79B4C0](v39);
  [(JSContext *)self->_jsContext setObject:v31 forKeyedSubscript:@"loadBurstTrie"];

  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_27;
  v37[3] = &unk_1E65B82D0;
  objc_copyWeak(&v38, &location);
  id v32 = (void *)MEMORY[0x1CB79B4C0](v37);
  [(JSContext *)self->_jsContext setObject:v32 forKeyedSubscript:@"loadMappedData"];

  uint64_t v33 = [(JSContext *)self->_jsContext objectForKeyedSubscript:@"load"];
  id v34 = [(SGReverseTemplateJS *)self _callJSFunction:v33 withArguments:&unk_1F2536908];

  *((unsigned char *)v67 + 24) = 1;
  uint64_t v35 = sgEventsLogHandle();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA650000, v35, OS_LOG_TYPE_INFO, "SGReverseTemplateJS: completed initialization of JS context.", buf, 2u);
  }

  objc_destroyWeak(&v38);
  objc_destroyWeak(&v40);
  objc_destroyWeak(&v42);
  objc_destroyWeak(&v44);
  objc_destroyWeak(&v47);

  objc_destroyWeak(&v58);
  objc_destroyWeak(&v63);

  objc_destroyWeak(&v65);
  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(v70, 8);
  objc_destroyWeak(&location);
}

id __39__SGReverseTemplateJS_initCurrentAsset__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v5 = [WeakRetained processLoadRequestWithFileName:v3];

  return v5;
}

id __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v5 = *(void *)(v4 + 24);
    *(void *)(v4 + 24) = v5 + 1;
    if (v5 == 20)
    {
      id v6 = *(NSObject **)(a1 + 32);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_3;
      block[3] = &unk_1E65C0018;
      objc_copyWeak(&v11, (id *)(a1 + 56));
      dispatch_async(v6, block);
      objc_destroyWeak(&v11);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v8 = [WeakRetained processLoadRequestWithFileName:v3];

  return v8;
}

id __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v5 = [WeakRetained processLoadRequestWithFileName:v3];

  return v5;
}

uint64_t __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "runDataDetectors:locale:epoch:metadataForTypes:", a3, a2, 0);
}

id __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_2_99(uint64_t a1, void *a2, void *a3, void *a4, double a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v11 count]) {
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v11];
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = [*(id *)(a1 + 32) runDataDetectors:v10 locale:v9 epoch:v12 metadataForTypes:a5];

  return v13;
}

id __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_8(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    id v2 = v1;
  }
  else
  {
    id v3 = [MEMORY[0x1E4F1CA20] currentLocale];
    id v2 = [v3 localeIdentifier];
  }
  return v2;
}

id __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_11(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v4 = a2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v5)
  {
    id v2 = (char *)v5;
    uint64_t v6 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id JSValueClass = getJSValueClass();
          id v10 = objc_msgSend(getJSContextClass(), "currentContext", v17);
          uint64_t v14 = [JSValueClass valueWithNewErrorFromMessage:@"getPreferredLocalizationsFromArray must be called with an array of strings" inContext:v10];
          uint64_t v15 = [getJSContextClass() currentContext];
          [v15 setException:v14];

          uint64_t v12 = 0;
          id v2 = v4;
          goto LABEL_14;
        }
      }
      id v2 = (char *)[v4 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }

  id v8 = (void *)MEMORY[0x1E4F28B50];
  id v9 = *(void **)(a1 + 32);
  id v10 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E4F1CA20], "currentLocale", v17);
    id v2 = (char *)objc_claimAutoreleasedReturnValue();
    id v10 = [v2 localeIdentifier];
  }
  __int16 v21 = v10;
  id v11 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v21, 1, v17);
  uint64_t v12 = [v8 preferredLocalizationsFromArray:v4 forPreferences:v11];

  if (!v9)
  {
LABEL_14:
  }
  return v12;
}

double __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_21(uint64_t a1)
{
  return (double)((mach_absolute_time() - *(void *)(a1 + 32))
                * initCurrentAsset_machTimebaseInfo
                / *(unsigned int *)algn_1EB9F008C)
       * 0.000000001;
}

void __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_22(uint64_t a1)
{
  v1 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_23;
  block[3] = &unk_1E65C0018;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

id __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_24(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  id v11 = [WeakRetained flightInformationWithAirlineCode:v9 flightNumber:v8 flightDate:v7];

  return v11;
}

id __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_25(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v5 = [WeakRetained md5Hash:v3];

  return v5;
}

id __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_26(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v5 = [WeakRetained loadTrieWithFileName:v3];

  return v5;
}

id __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_27(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v5 = [WeakRetained mappedArrayBufferForFileName:v3];

  return v5;
}

void __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_23(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained freeJSContext];
}

uint64_t __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_20()
{
  return mach_timebase_info((mach_timebase_info_t)&initCurrentAsset_machTimebaseInfo);
}

id __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  [a2 doubleValue];
  uint64_t v6 = objc_msgSend(v4, "dateWithTimeIntervalSince1970:");
  id v7 = objc_opt_new();
  [v7 setDateFormat:@"ZZZZZ"];
  id v8 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:v5];

  [v7 setTimeZone:v8];
  id v9 = [v7 stringFromDate:v6];

  return v9;
}

id __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_17()
{
  if (_block_invoke_onceToken != -1) {
    dispatch_once(&_block_invoke_onceToken, &__block_literal_global_214);
  }
  v0 = (void *)_block_invoke_version;
  return v0;
}

void __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_18()
{
  uint64_t v0 = _CFCopyServerVersionDictionary();
  v1 = (void *)_block_invoke_version;
  _block_invoke_version = v0;

  if (!_block_invoke_version)
  {
    _block_invoke_version = _CFCopySystemVersionDictionary();
    MEMORY[0x1F41817F8]();
  }
}

uint64_t __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_16()
{
  return [MEMORY[0x1E4F5DAF0] allowUnverifiedSourceForMarkup];
}

uint64_t __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_15()
{
  return [MEMORY[0x1E4F5DAF0] allowAnyDomainForMarkup];
}

uint64_t __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_14()
{
  return [MEMORY[0x1E4F5DAF0] allowGeocode];
}

uint64_t __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_13()
{
  return os_variant_has_internal_diagnostics();
}

id __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_12(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = a2;
  uint64_t v12 = objc_opt_new();
  [v12 setFormatterBehavior:1040];
  uint64_t v13 = [v10 unsignedIntegerValue];

  [v12 setDateStyle:v13];
  uint64_t v14 = [v9 unsignedIntegerValue];

  [v12 setTimeStyle:v14];
  uint64_t v15 = (void *)MEMORY[0x1E4F1CAF0];
  if (v8) {
    uint64_t v16 = [v8 unsignedIntegerValue];
  }
  else {
    uint64_t v16 = 0;
  }
  long long v17 = [v15 timeZoneForSecondsFromGMT:v16];
  [v12 setTimeZone:v17];

  long long v18 = (void *)MEMORY[0x1E4F1C9C8];
  [v11 doubleValue];
  double v20 = v19;

  __int16 v21 = [v18 dateWithTimeIntervalSince1970:v20];
  uint64_t v22 = [v12 stringFromDate:v21];

  return v22;
}

id __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_9(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  uint64_t v11 = [v10 length];
  uint64_t v12 = [MEMORY[0x1E4F28F28] defaultOrthographyForLanguage:v9];

  id v18 = 0;
  uint64_t v13 = objc_msgSend(v10, "linguisticTagsInRange:scheme:options:orthography:tokenRanges:", 0, v11, v8, a5, v12, &v18);

  id v14 = v18;
  if ([v14 count])
  {
    uint64_t v15 = sgMap();

    id v14 = (id)v15;
  }
  v19[0] = @"tags";
  v19[1] = @"ranges";
  v20[0] = v13;
  v20[1] = v14;
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];

  return v16;
}

id __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_10(uint64_t a1, void *a2)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a2 rangeValue];
  uint64_t v4 = v3;
  id v5 = [NSNumber numberWithUnsignedInteger:v2];
  v9[0] = v5;
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:v4];
  v9[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];

  return v7;
}

__CFString *__39__SGReverseTemplateJS_initCurrentAsset__block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = +[SGMonochrome stringByExtractingPlainTextFromHTML:a2 tableDelimiters:1 stripLinks:a3];
  uint64_t v4 = v3;
  if (!v3) {
    uint64_t v3 = &stru_1F24EEF20;
  }
  id v5 = v3;

  return v5;
}

uint64_t __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_6(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F5DFA0] dominantLanguageTagFromText:a2];
}

id __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_5_121(uint64_t a1, uint64_t a2)
{
  return +[SGHtmlEntities decodeEntities:a2];
}

id __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_4_114(uint64_t a1, uint64_t a2)
{
  return +[SGTokenizer tokenize:a2];
}

id __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_3_106(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = +[SGMicrodataParser parse:a2];
  uint64_t v3 = [v2 asJsonLd];

  return v3;
}

void __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_81(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = sgDeveloperLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_1CA650000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

void __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = sgEventsLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_debug_impl(&dword_1CA650000, v3, OS_LOG_TYPE_DEBUG, "JS log: %@", (uint8_t *)&v4, 0xCu);
  }
}

void __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained freeJSContext];
}

- (id)loadTrieWithFileName:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 stringByAppendingPathExtension:@"trie"];
  if (!v6)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SGReverseTemplateJS.m", 286, @"Invalid parameter not satisfying: %@", @"fileNameWithPathExtension" object file lineNumber description];
  }
  id v7 = (void *)MEMORY[0x1CB79B230]();
  id v8 = +[SGAsset asset];
  id v9 = [v8 filesystemPathForAssetDataRelativePath:v6];

  if (!v9)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SGReverseTemplateJS.m", 288, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];
  }
  id v10 = [(_PASCFBurstTrie *)[SGJSBurstTrie alloc] initWithPath:v9];

  return v10;
}

- (id)processLoadRequestWithFileName:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [getJSValueClass() valueWithUndefinedInContext:self->_jsContext];
  if (v5 && (unint64_t)[v5 length] > 2)
  {
    id v8 = objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v5, "length") - 3);
    if ([v8 isEqualToString:@".js"])
    {
      id v9 = sgEventsLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v5;
        _os_log_impl(&dword_1CA650000, v9, OS_LOG_TYPE_INFO, "SGReverseTemplateJS: loading %@ in JS context.", buf, 0xCu);
      }

      id v10 = +[SGAsset asset];
      uint64_t v11 = [v10 filesystemPathForAssetDataRelativePath:@"ReverseTemplateJS"];

      if (!v11)
      {
        uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
        [v16 handleFailureInMethod:a2, self, @"SGReverseTemplateJS.m", 278, @"Invalid parameter not satisfying: %@", @"parentDir" object file lineNumber description];
      }
      uint64_t v12 = (void *)MEMORY[0x1CB79B230]();
      uint64_t v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v11];
      id v14 = [v13 URLByAppendingPathComponent:v5];

      id v7 = [(SGReverseTemplateJS *)self loadJSFromASCIIFile:v14];
    }
    else
    {
      id v7 = v6;
    }
  }
  else
  {
    id v7 = v6;
  }

  return v7;
}

- (void)setAssetPath:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  id obj = [v5 URLByStandardizingPath];

  assetPath = self->_assetPath;
  if (!assetPath || ([(NSURL *)assetPath isEqual:obj] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_assetPath, obj);
    [(SGReverseTemplateJS *)self freeJSContext];
  }
}

- (void)refreshAssetPath
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int v4 = +[SGAsset asset];
  id v8 = [v4 filesystemPathForAssetDataRelativePath:@"ReverseTemplateJS"];

  id v5 = v8;
  if (!v8)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"SGReverseTemplateJS.m", 246, @"Invalid parameter not satisfying: %@", @"assetPath" object file lineNumber description];

    id v5 = 0;
  }
  uint64_t v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5 isDirectory:1];
  [(SGReverseTemplateJS *)self setAssetPath:v6];
}

- (void)freeJSContext
{
  uint64_t v3 = sgEventsLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_1CA650000, v3, OS_LOG_TYPE_INFO, "SGReverseTemplateJS: freeing JS context.", v8, 2u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  jsVM = self->_jsVM;
  self->_jsVM = 0;

  jsContext = self->_jsContext;
  self->_jsContext = 0;

  memoryMappedFiles = self->_memoryMappedFiles;
  self->_memoryMappedFiles = 0;

  memoryMappedFileNames = self->_memoryMappedFileNames;
  self->_memoryMappedFileNames = 0;
}

- (id)getJSContext
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(SGReverseTemplateJS *)self refreshAssetPath];
  jsContext = self->_jsContext;
  if (!jsContext)
  {
    if (self->_assetPath)
    {
      uint64_t v17 = 0;
      id v18 = &v17;
      uint64_t v19 = 0x2050000000;
      int v4 = (void *)getJSVirtualMachineClass_softClass;
      uint64_t v20 = getJSVirtualMachineClass_softClass;
      if (!getJSVirtualMachineClass_softClass)
      {
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __getJSVirtualMachineClass_block_invoke;
        v16[3] = &unk_1E65C0148;
        v16[4] = &v17;
        __getJSVirtualMachineClass_block_invoke((uint64_t)v16);
        int v4 = (void *)v18[3];
      }
      id v5 = v4;
      _Block_object_dispose(&v17, 8);
      uint64_t v6 = (JSVirtualMachine *)objc_opt_new();
      jsVM = self->_jsVM;
      self->_jsVM = v6;

      id v8 = (JSContext *)[objc_alloc((Class)getJSContextClass()) initWithVirtualMachine:self->_jsVM];
      id v9 = self->_jsContext;
      self->_jsContext = v8;

      [(JSContext *)self->_jsContext setName:@"SGReverseTemplateJS"];
      id v10 = (NSMutableArray *)objc_opt_new();
      memoryMappedFiles = self->_memoryMappedFiles;
      self->_memoryMappedFiles = v10;

      uint64_t v12 = (NSMutableArray *)objc_opt_new();
      memoryMappedFileNames = self->_memoryMappedFileNames;
      self->_memoryMappedFileNames = v12;

      id v14 = sgEventsLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        LOWORD(v16[0]) = 0;
        _os_log_impl(&dword_1CA650000, v14, OS_LOG_TYPE_INFO, "SGReverseTemplateJS: initialized JS context.", (uint8_t *)v16, 2u);
      }

      [(SGReverseTemplateJS *)self initCurrentAsset];
      jsContext = self->_jsContext;
    }
    else
    {
      jsContext = 0;
    }
  }
  return jsContext;
}

- (void)dealloc
{
  uint64_t v3 = +[SGAsset asset];
  [v3 deregisterUpdateHandlerAsyncWithToken:self->_assetUpdateToken];

  memoryPressureSource = self->_memoryPressureSource;
  if (memoryPressureSource) {
    dispatch_source_cancel(memoryPressureSource);
  }
  v5.receiver = self;
  v5.super_class = (Class)SGReverseTemplateJS;
  [(SGReverseTemplateJS *)&v5 dealloc];
}

- (id)_stringFromMemoryPressureStatus:(unint64_t)a3
{
  if ((uint64_t)a3 > 3)
  {
    if (a3 == 4) {
      return @"DISPATCH_MEMORYPRESSURE_CRITICAL";
    }
    if (a3 == 16) {
      return @"DISPATCH_MEMORYPRESSURE_PROC_LIMIT_WARN";
    }
  }
  else
  {
    if (a3 == 1) {
      return @"DISPATCH_MEMORYPRESSURE_NORMAL";
    }
    if (a3 == 2) {
      return @"DISPATCH_MEMORYPRESSURE_WARN";
    }
  }
  if (a3 == 32) {
    return @"DISPATCH_MEMORYPRESSURE_PROC_LIMIT_CRITICAL";
  }
  else {
    return @"UNKNOWN";
  }
}

- (void)_handleMemoryPressureStatus:(unint64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  objc_super v5 = sgEventsLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = [(SGReverseTemplateJS *)self _stringFromMemoryPressureStatus:a3];
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v6;
    _os_log_impl(&dword_1CA650000, v5, OS_LOG_TYPE_INFO, "SGReverseTemplateJS: Received %@ notification.", buf, 0xCu);
  }
  if (a3 == 32 || a3 == 16)
  {
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    objc_copyWeak(&v7, (id *)buf);
    SGThrottle();
    objc_destroyWeak(&v7);
    objc_destroyWeak((id *)buf);
  }
}

void __51__SGReverseTemplateJS__handleMemoryPressureStatus___block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  int v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_super v5 = WeakRetained[9];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__SGReverseTemplateJS__handleMemoryPressureStatus___block_invoke_2;
    block[3] = &unk_1E65BEF88;
    void block[4] = v4;
    dispatch_async(v5, block);
    if (a2)
    {
      uint64_t v6 = sgEventsLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v9 = a2;
        _os_log_impl(&dword_1CA650000, v6, OS_LOG_TYPE_INFO, "SGReverseTemplateJS: suppressed process memory warning %lu times", buf, 0xCu);
      }
    }
  }
}

uint64_t __51__SGReverseTemplateJS__handleMemoryPressureStatus___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = sgEventsLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_1CA650000, v2, OS_LOG_TYPE_INFO, "SGReverseTemplateJS: Queuing request to free JS context.", (uint8_t *)&v9, 2u);
  }

  uint64_t v3 = sgEventsLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = +[SGAsset asset];
    uint64_t v5 = [v4 assetVersion];
    int v9 = 134217984;
    uint64_t v10 = v5;
    _os_log_impl(&dword_1CA650000, v3, OS_LOG_TYPE_INFO, "SGReverseTemplateJS: Asset version = %lu", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v6 = sgEventsLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "_pas_componentsJoinedByString:", @", ");
    int v9 = 138412290;
    uint64_t v10 = (uint64_t)v7;
    _os_log_impl(&dword_1CA650000, v6, OS_LOG_TYPE_INFO, "SGReverseTemplateJS: List of loaded JS files in context = %@", (uint8_t *)&v9, 0xCu);
  }
  return [*(id *)(a1 + 32) freeJSContext];
}

- (id)_callJSFunction:(id)a3 withArguments:(id)a4
{
  uint64_t v6 = dispatch_get_global_queue(2, 0);
  id v7 = a4;
  id v8 = a3;
  int v9 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v6);

  dispatch_source_set_event_handler(v9, &__block_literal_global_15279);
  dispatch_time_t v10 = dispatch_time(0, 5000000000);
  dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  dispatch_resume(v9);
  uint64_t v11 = [v8 callWithArguments:v7];

  dispatch_source_cancel(v9);
  return v11;
}

void __53__SGReverseTemplateJS__callJSFunction_withArguments___block_invoke()
{
  uint64_t v0 = sgLogHandle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_fault_impl(&dword_1CA650000, v0, OS_LOG_TYPE_FAULT, "JS not interrupted after timeout!", v1, 2u);
  }

  if (!_PASEvaluateLogFaultAndProbCrashCriteria()) {
    exit(1);
  }
  abort();
}

- (SGReverseTemplateJS)init
{
  v25.receiver = self;
  v25.super_class = (Class)SGReverseTemplateJS;
  id v2 = [(SGReverseTemplateJS *)&v25 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    int v4 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v3;

    uint64_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.suggestions.reversetemplatejs", v5);

    objc_storeStrong((id *)v2 + 9, v6);
    id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.suggestions.reversetemplatejs.pressure", v8);
    dispatch_time_t v10 = (void *)*((void *)v2 + 10);
    *((void *)v2 + 10) = v9;

    id location = 0;
    objc_initWeak(&location, v2);
    uint64_t v11 = +[SGAsset asset];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __27__SGReverseTemplateJS_init__block_invoke;
    v21[3] = &unk_1E65B8280;
    uint64_t v12 = v6;
    uint64_t v22 = v12;
    objc_copyWeak(&v23, &location);
    uint64_t v13 = [v11 registerUpdateHandler:v21];
    id v14 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v13;

    dispatch_source_t v15 = dispatch_source_create(MEMORY[0x1E4F14468], 0, 0x37uLL, *((dispatch_queue_t *)v2 + 10));
    uint64_t v16 = (void *)*((void *)v2 + 11);
    *((void *)v2 + 11) = v15;

    uint64_t v17 = *((void *)v2 + 11);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    void v19[2] = __27__SGReverseTemplateJS_init__block_invoke_3;
    v19[3] = &unk_1E65C0018;
    objc_copyWeak(&v20, &location);
    dispatch_source_set_event_handler(v17, v19);
    dispatch_resume(*((dispatch_object_t *)v2 + 11));
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v23);

    objc_destroyWeak(&location);
  }
  return (SGReverseTemplateJS *)v2;
}

void __27__SGReverseTemplateJS_init__block_invoke(uint64_t a1)
{
  v1 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__SGReverseTemplateJS_init__block_invoke_2;
  block[3] = &unk_1E65C0018;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void __27__SGReverseTemplateJS_init__block_invoke_3(uint64_t a1)
{
  id WeakRetained = (dispatch_source_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [(dispatch_source_t *)WeakRetained _handleMemoryPressureStatus:dispatch_source_get_data(WeakRetained[11])];
    id WeakRetained = v2;
  }
}

void __27__SGReverseTemplateJS_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained freeJSContext];
}

+ (id)fakeFlightInformationWithAirlineCode:(id)a3 flightNumber:(id)a4 flightDate:(id)a5
{
  id v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5);
  [v7 handleFailureInMethod:a2 object:a1 file:@"SGReverseTemplateJS.m" lineNumber:1198 description:@"This method must be stubbed!"];

  return 0;
}

@end