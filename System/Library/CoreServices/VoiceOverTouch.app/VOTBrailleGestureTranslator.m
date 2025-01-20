@interface VOTBrailleGestureTranslator
- (BOOL)_isFullCellStrong;
- (BOOL)_shouldUseEightDotBraille;
- (BOOL)areDotNumberPositionsCalibrated;
- (BOOL)isActive;
- (BOOL)isExistingInputContainedIn:(id)a3 withMode:(unint64_t)a4 isPrefix:(BOOL *)a5;
- (BOOL)isUnitTesting;
- (BOOL)performBrailleBufferBackspace:(id *)a3;
- (BOOL)shouldUseContractedBraille;
- (BRLTTranslationService)translationService;
- (CGSize)keyboardSize;
- (VOTBrailleGestureTranslator)init;
- (VOTBrailleGestureTranslatorDelegate)delegate;
- (id)_outputForBefore:(id)a3 after:(id)a4 delete:(BOOL)a5;
- (id)_trimCommonPrefixWithString:(id)a3 fromString:(id)a4;
- (id)brailleForText:(id)a3 mode:(unint64_t)a4;
- (id)dotNumberPositions;
- (id)outputForLatestInput;
- (id)popLastBrailleCellFromBuffer;
- (id)printBrailleForAllTouchPointsInInput:(id)a3 shouldLearn:(BOOL)a4 error:(id *)a5;
- (id)printBrailleForGesturePattern:(id)a3;
- (id)printBrailleForInput:(id)a3 error:(id *)a4;
- (id)textForBraille:(id)a3 mode:(unint64_t)a4;
- (id)translateExistingInputWithMode:(unint64_t)a3;
- (id)translatedTextForPrintBraille:(id)a3 mode:(unint64_t)a4;
- (id)translatedTextForPrintBraille:(id)a3 mode:(unint64_t)a4 buffer:(id)a5;
- (id)translatedTextOfBufferWithMode:(unint64_t)a3;
- (int64_t)typingMode;
- (void)_resetTranslator;
- (void)addPrintBrailleToBuffer:(id)a3 language:(id)a4;
- (void)calibrateWithTouchPoints:(id)a3;
- (void)clearBrailleBuffer;
- (void)didInputBackspace;
- (void)didInputSpace;
- (void)didPressReturnKey;
- (void)savePersistentGestureData;
- (void)setActive:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setShouldUseContractedBraille:(BOOL)a3;
- (void)setTranslationService:(id)a3;
- (void)setTypingMode:(int64_t)a3 keyboardSize:(CGSize)a4 shouldUseEightDotBraille:(BOOL)a5 shouldReverseDots:(BOOL)a6;
- (void)setUnitTesting:(BOOL)a3;
@end

@implementation VOTBrailleGestureTranslator

- (VOTBrailleGestureTranslator)init
{
  v14.receiver = self;
  v14.super_class = (Class)VOTBrailleGestureTranslator;
  v2 = [(VOTBrailleGestureTranslator *)&v14 init];
  v3 = v2;
  if (v2)
  {
    v2->_unitTesting = 0;
    v4 = objc_alloc_init(VOTBrailleGesturePatternRecognitionEngine);
    recognitionEngine = v3->_recognitionEngine;
    v3->_recognitionEngine = v4;

    [(VOTBrailleGesturePatternRecognitionEngine *)v3->_recognitionEngine setDelegate:v3];
    v6 = (NSMutableString *)objc_alloc_init((Class)NSMutableString);
    brailleBuffer = v3->_brailleBuffer;
    v3->_brailleBuffer = v6;

    objc_initWeak(&location, v3);
    v8 = +[AXSettings sharedInstance];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10002936C;
    v11[3] = &unk_1001B35A8;
    objc_copyWeak(&v12, &location);
    id v9 = objc_loadWeakRetained(&location);
    [v8 registerUpdateBlock:v11 forRetrieveSelector:"voiceOverBrailleTableIdentifier" withListener:v9];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)setUnitTesting:(BOOL)a3
{
  if (self->_unitTesting != a3)
  {
    self->_unitTesting = a3;
    self->_translationService = 0;
    _objc_release_x1();
  }
}

- (id)printBrailleForAllTouchPointsInInput:(id)a3 shouldLearn:(BOOL)a4 error:(id *)a5
{
  BOOL v5 = a4;
  id v7 = a3;
  v8 = +[NSMutableString string];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v24 = v7;
  id v9 = [v7 seriesOfTouchPoints];
  id v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v27;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        recognitionEngine = self->_recognitionEngine;
        id v25 = 0;
        v16 = [(VOTBrailleGesturePatternRecognitionEngine *)recognitionEngine printBrailleForTouchPoints:v14 shouldLearn:v5 error:&v25];
        id v17 = v25;
        if (v17)
        {
          v20 = v17;
          v21 = VOTLogBrailleGestures();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            sub_10011C654(v20, v14, v21);
          }

          v19 = v24;
          if (a5) {
            *a5 = v20;
          }

          v18 = &stru_1001B7888;
          goto LABEL_15;
        }
        [v8 appendString:v16];
      }
      id v11 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  v18 = v8;
  v19 = v24;
LABEL_15:

  return v18;
}

- (void)addPrintBrailleToBuffer:(id)a3 language:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSMutableString *)self->_brailleBuffer copy];
  [(NSMutableString *)self->_brailleBuffer appendString:v6];
  id v9 = VOTLogBrailleGestures();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    brailleBuffer = self->_brailleBuffer;
    int v13 = 138543874;
    uint64_t v14 = brailleBuffer;
    __int16 v15 = 2114;
    id v16 = v6;
    __int16 v17 = 2114;
    id v18 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Braille buffer = \"%{public}@\", added \"%{public}@\" (language = %{public}@)", (uint8_t *)&v13, 0x20u);
  }

  id v10 = [(VOTBrailleGestureTranslator *)self _outputForBefore:v8 after:self->_brailleBuffer delete:0];
  outputForLatestInput = self->_outputForLatestInput;
  self->_outputForLatestInput = v10;
}

- (id)popLastBrailleCellFromBuffer
{
  p_brailleBuffer = &self->_brailleBuffer;
  if (![(NSMutableString *)self->_brailleBuffer length]
    || ((v4 = [(NSMutableString *)*p_brailleBuffer rangeOfComposedCharacterSequenceAtIndex:(char *)[(NSMutableString *)*p_brailleBuffer length] - 1], v4 != (id)0x7FFFFFFFFFFFFFFFLL)? (BOOL v6 = v5 == 0): (BOOL v6 = 1), v6))
  {
    outputForLatestInput = self->_outputForLatestInput;
    self->_outputForLatestInput = 0;

    id v11 = 0;
  }
  else
  {
    id v8 = v4;
    uint64_t v9 = v5;
    id v10 = [(NSMutableString *)*p_brailleBuffer copy];
    id v11 = -[NSMutableString substringWithRange:](*p_brailleBuffer, "substringWithRange:", v8, v9);
    -[NSMutableString deleteCharactersInRange:](*p_brailleBuffer, "deleteCharactersInRange:", v8, v9);
    uint64_t v12 = VOTLogBrailleGestures();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_10011C704(p_brailleBuffer);
    }

    uint64_t v14 = [(VOTBrailleGestureTranslator *)self _outputForBefore:v10 after:self->_brailleBuffer delete:1];
    __int16 v15 = self->_outputForLatestInput;
    self->_outputForLatestInput = v14;
  }

  return v11;
}

- (id)translatedTextOfBufferWithMode:(unint64_t)a3
{
  return [(VOTBrailleGestureTranslator *)self translatedTextForPrintBraille:self->_brailleBuffer mode:a3];
}

- (id)translatedTextForPrintBraille:(id)a3 mode:(unint64_t)a4
{
  return [(VOTBrailleGestureTranslator *)self translatedTextForPrintBraille:a3 mode:a4 buffer:self->_brailleBuffer];
}

- (id)translatedTextForPrintBraille:(id)a3 mode:(unint64_t)a4 buffer:(id)a5
{
  id v8 = (__CFString *)a3;
  id v9 = a5;
  uint64_t v10 = [(VOTBrailleGestureTranslator *)self textForBraille:@"⠿" mode:a4];
  id v11 = (__CFString *)v10;
  if (a4 == 4)
  {
    id v18 = [(VOTBrailleGestureTranslator *)self textForBraille:v8 mode:4];
  }
  else
  {
    if (a4 == 3)
    {
      if (!v10)
      {
        uint64_t v12 = VOTLogBraille();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_10011C864(v12);
        }

        id v11 = &stru_1001B7888;
      }
      v57 = v11;
      if ([v9 length])
      {
        int v13 = +[NSString stringWithFormat:@"%@%@%@", @"⠿", v8, @"⠿"];
        uint64_t v14 = [(VOTBrailleGestureTranslator *)self textForBraille:v13 mode:3];
        __int16 v15 = (char *)[v14 rangeOfString:v11 options:0];
        if (v15 == (char *)0x7FFFFFFFFFFFFFFFLL)
        {
          __int16 v17 = &stru_1001B7888;
        }
        else
        {
          __int16 v17 = [v14 substringFromIndex:&v15[v16]];
        }

        id v24 = [(__CFString *)v17 rangeOfString:v11 options:4];
        if (v24 == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          id v25 = &stru_1001B7888;
        }
        else
        {
          id v25 = [(__CFString *)v17 substringToIndex:v24];
        }

        long long v26 = [@"⠿" stringByAppendingString:v8];
        long long v27 = [(VOTBrailleGestureTranslator *)self textForBraille:v26 mode:3];
        long long v28 = (char *)[v27 rangeOfString:v11];
        if (v28 == (char *)0x7FFFFFFFFFFFFFFFLL)
        {
          v30 = &stru_1001B7888;
        }
        else
        {
          v30 = [v27 substringFromIndex:&v28[v29]];
        }

        v31 = VOTLogBrailleGestures();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
          sub_10011C7F0((uint64_t)v25);
        }

        if (!v25 || (id v32 = [(__CFString *)v25 length], v33 = v25, !v32)) {
          v33 = v30;
        }
        id v18 = v33;
      }
      else
      {
        v19 = [(VOTBrailleGestureTranslator *)self textForBraille:v8 mode:3];
        v20 = [(__CFString *)v8 stringByAppendingString:@"⠿"];
        v21 = [(VOTBrailleGestureTranslator *)self textForBraille:v20 mode:3];
        id v22 = [v21 rangeOfString:v11 options:4];
        if (v22 == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          v23 = &stru_1001B7888;
        }
        else
        {
          v23 = [v21 substringToIndex:v22];
        }

        v34 = VOTLogBrailleGestures();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
          sub_10011C77C((uint64_t)v19);
        }

        if (!v23 || (id v35 = [(__CFString *)v23 length], v36 = v23, !v35)) {
          v36 = v19;
        }
        id v18 = v36;
      }
    }
    else
    {
      v57 = (__CFString *)v10;
      id v18 = [(VOTBrailleGestureTranslator *)self textForBraille:v8 mode:a4];
    }
    v37 = [(__CFString *)v18 uppercaseString];
    v38 = [(__CFString *)v18 capitalizedString];
    id v58 = v9;
    v59 = v8;
    v39 = [v9 stringByAppendingString:v8];
    v40 = [(VOTBrailleGestureTranslator *)self translateExistingInputWithMode:a4];
    v41 = [(VOTBrailleGestureTranslator *)self textForBraille:v39 mode:a4];
    v42 = [(VOTBrailleGestureTranslator *)self _trimCommonPrefixWithString:v40 fromString:v41];
    v43 = [(VOTBrailleGestureTranslator *)self textForBraille:v39 mode:a4];
    v44 = VOTLogBrailleGestures();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138544898;
      v61 = v18;
      __int16 v62 = 2114;
      v63 = v38;
      __int16 v64 = 2114;
      v65 = v37;
      __int16 v66 = 2114;
      v67 = v40;
      __int16 v68 = 2114;
      v69 = v41;
      __int16 v70 = 2114;
      v71 = v42;
      __int16 v72 = 2114;
      v73 = v43;
      _os_log_debug_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "Context translations:\n  translatedText = \"%{public}@\", capitalized: \"%{public}@\", uppercase: \"%{public}@\"\n  currentBufferTranslation = \"%{public}@\"\n  contextTranslation = \"%{public}@\"\n  contextSuffix = \"%{public}@\"\n  uncontractedTranslation = \"%{public}@\"", buf, 0x48u);
    }

    unsigned __int8 v45 = [v41 isEqualToString:v37];
    v46 = v37;
    if (v45) {
      goto LABEL_46;
    }
    unsigned __int8 v47 = [v41 isEqualToString:v38];
    v46 = v38;
    if (v47) {
      goto LABEL_46;
    }
    if (v18)
    {
      id v48 = [(__CFString *)v42 length];
      id v49 = [(__CFString *)v18 length];
      v46 = v42;
      if (v48 == v49) {
        goto LABEL_46;
      }
      if (v38)
      {
        unsigned __int8 v50 = [v43 hasSuffix:v38];
        v46 = v38;
        if (v50) {
          goto LABEL_46;
        }
      }
      if (v37 && (unsigned __int8 v51 = [(__CFString *)v42 hasPrefix:v37], v46 = v37, (v51 & 1) != 0)
        || v38 && (unsigned int v52 = [(__CFString *)v42 hasPrefix:v38], v46 = v38, v52))
      {
LABEL_46:
        v53 = v46;

        id v18 = v53;
      }
    }

    id v9 = v58;
    id v8 = v59;
    id v11 = v57;
  }
  v54 = VOTLogBrailleGestures();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    BRLTModeDescription();
    v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v61 = v8;
    __int16 v62 = 2114;
    v63 = v18;
    __int16 v64 = 2112;
    v65 = v55;
    _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "Translated text: \"%{public}@\" -> \"%{public}@\" (mode:%@)", buf, 0x20u);
  }

  return v18;
}

- (id)_trimCommonPrefixWithString:(id)a3 fromString:(id)a4
{
  id v5 = a4;
  BOOL v6 = [v5 commonPrefixWithString:a3 options:0];
  id v7 = objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v6, "length"));

  return v7;
}

- (id)translateExistingInputWithMode:(unint64_t)a3
{
  id v4 = [(VOTBrailleGestureTranslator *)self textForBraille:self->_brailleBuffer mode:a3];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = +[VOTBrailleManager manager];
  BOOL v6 = [v5 textReplacementEntries];

  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v12 = [v11 shortcut];
        id v13 = [v12 compare:v4 options:129];

        if (!v13)
        {
          uint64_t v14 = [v11 phrase];

          id v4 = (void *)v14;
          goto LABEL_11;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  __int16 v15 = VOTLogBrailleGestures();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    brailleBuffer = self->_brailleBuffer;
    *(_DWORD *)buf = 138543618;
    v23 = brailleBuffer;
    __int16 v24 = 2114;
    id v25 = v4;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Translated text: \"%{public}@\" -> \"%{public}@\"", buf, 0x16u);
  }

  return v4;
}

- (BOOL)isExistingInputContainedIn:(id)a3 withMode:(unint64_t)a4 isPrefix:(BOOL *)a5
{
  id v8 = a3;
  brailleBuffer = self->_brailleBuffer;
  if (brailleBuffer && [(NSMutableString *)brailleBuffer length])
  {
    uint64_t v10 = [v8 lowercaseString];
    v24[0] = v10;
    v24[1] = v8;
    +[NSArray arrayWithObjects:v24 count:2];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v20;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = -[VOTBrailleGestureTranslator brailleForText:mode:](self, "brailleForText:mode:", *(void *)(*((void *)&v19 + 1) + 8 * i), a4, (void)v19);
          if ([v16 containsString:self->_brailleBuffer])
          {
            if (a5) {
              *a5 = [v16 hasPrefix:self->_brailleBuffer];
            }

            BOOL v17 = 1;
            goto LABEL_17;
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    BOOL v17 = 0;
    if (a5) {
      *a5 = 0;
    }
LABEL_17:
  }
  else
  {
    BOOL v17 = 1;
  }

  return v17;
}

- (void)didInputSpace
{
  v2 = VOTLogBrailleGestures();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Did input space", v3, 2u);
  }
}

- (BOOL)performBrailleBufferBackspace:(id *)a3
{
  id v5 = [(NSMutableString *)self->_brailleBuffer length];
  if (v5)
  {
    id v6 = [(NSMutableString *)self->_brailleBuffer copy];
    if (a3)
    {
      *a3 = [(NSMutableString *)self->_brailleBuffer substringFromIndex:(char *)[(NSMutableString *)self->_brailleBuffer length] - 1];
    }
    -[NSMutableString deleteCharactersInRange:](self->_brailleBuffer, "deleteCharactersInRange:", (char *)[(NSMutableString *)self->_brailleBuffer length] - 1, 1);
    [(VOTBrailleGesturePatternRecognitionEngine *)self->_recognitionEngine unlearnLastGesture];
    id v7 = VOTLogBrailleGestures();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      brailleBuffer = self->_brailleBuffer;
      int v12 = 138477827;
      id v13 = brailleBuffer;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Did backspace from braille buffer, which is now \"%{private}@\"", (uint8_t *)&v12, 0xCu);
    }

    uint64_t v9 = [(VOTBrailleGestureTranslator *)self _outputForBefore:v6 after:self->_brailleBuffer delete:1];
    outputForLatestInput = self->_outputForLatestInput;
    self->_outputForLatestInput = v9;
  }
  return v5 != 0;
}

- (void)didInputBackspace
{
  v3 = VOTLogBrailleGestures();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Did input backspace", v4, 2u);
  }

  if ([(NSMutableString *)self->_brailleBuffer length]) {
    _AXAssert();
  }
}

- (void)didPressReturnKey
{
  v2 = VOTLogBrailleGestures();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Did press return key", v3, 2u);
  }
}

- (id)printBrailleForInput:(id)a3 error:(id *)a4
{
  id v7 = a3;
  id v8 = [v7 seriesOfTouchPoints];
  if ([v8 count] != (id)1)
  {
    id v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"VOTBrailleGestureTranslator.m" lineNumber:363 description:@"Should have only sent one set of touch points for determining print Braille"];
  }
  uint64_t v9 = [v8 lastObject];
  uint64_t v10 = [(VOTBrailleGesturePatternRecognitionEngine *)self->_recognitionEngine printBrailleForTouchPoints:v9 shouldLearn:0 error:a4];
  id v11 = VOTLogBrailleGestures();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_10011C8E8((uint64_t)v10);
  }

  return v10;
}

- (id)printBrailleForGesturePattern:(id)a3
{
  return +[NSString stringWithFormat:@"%C", [(VOTBrailleGesturePatternRecognitionEngine *)self->_recognitionEngine printBrailleCharacterFromBraillePattern:a3]];
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    id v5 = VOTLogBrailleGestures();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_10011C95C(a3, v5);
    }

    self->_active = a3;
    [(VOTBrailleGesturePatternRecognitionEngine *)self->_recognitionEngine resetLastGestures];
  }
}

- (void)setTypingMode:(int64_t)a3 keyboardSize:(CGSize)a4 shouldUseEightDotBraille:(BOOL)a5 shouldReverseDots:(BOOL)a6
{
}

- (id)dotNumberPositions
{
  return [(VOTBrailleGesturePatternRecognitionEngine *)self->_recognitionEngine dotNumberPositions];
}

- (void)calibrateWithTouchPoints:(id)a3
{
  id v4 = a3;
  id v5 = VOTLogBrailleGestures();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10011CA04((uint64_t)v4, v5);
  }

  [(VOTBrailleGesturePatternRecognitionEngine *)self->_recognitionEngine calibrateWithTouchPoints:v4];
}

- (void)savePersistentGestureData
{
}

- (BOOL)areDotNumberPositionsCalibrated
{
  return [(VOTBrailleGesturePatternRecognitionEngine *)self->_recognitionEngine areDotNumberPositionsCalibrated];
}

- (id)outputForLatestInput
{
  id v3 = [(VOTOutputRequest *)self->_outputForLatestInput copy];
  outputForLatestInput = self->_outputForLatestInput;
  self->_outputForLatestInput = 0;

  return v3;
}

- (void)_resetTranslator
{
  id v3 = VOTLogBrailleGestures();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10011CA7C(v3);
  }

  translationService = self->_translationService;
  self->_translationService = 0;
}

- (BRLTTranslationService)translationService
{
  id v3 = [(id)VOTSharedWorkspace selectedBrailleGesturesInputTable];
  id v4 = v3;
  if (v3)
  {
    if (!self->_translationService
      || ([v3 serviceIdentifier],
          id v5 = objc_claimAutoreleasedReturnValue(),
          [(BRLTTranslationService *)self->_translationService serviceIdentifier],
          id v6 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v7 = [v5 isEqualToString:v6],
          v6,
          v5,
          (v7 & 1) == 0))
    {
      id v8 = [v4 serviceIdentifier];
      uint64_t v9 = +[BRLTTranslationService serviceForIdentifier:v8 input:0 loopback:[(VOTBrailleGestureTranslator *)self isUnitTesting]];

      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10002A978;
      v14[3] = &unk_1001B33B8;
      id v15 = v4;
      [v9 setInvalidationHandler:v14];
      translationService = self->_translationService;
      self->_translationService = (BRLTTranslationService *)v9;
      id v11 = v9;
    }
    int v12 = self->_translationService;
  }
  else
  {
    int v12 = 0;
  }

  return v12;
}

- (BOOL)_shouldUseEightDotBraille
{
  return [(VOTBrailleGesturePatternRecognitionEngine *)self->_recognitionEngine shouldUseEightDotBraille];
}

- (void)clearBrailleBuffer
{
  id v3 = VOTLogBrailleGestures();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Clear braille buffer", v4, 2u);
  }

  [(NSMutableString *)self->_brailleBuffer setString:&stru_1001B7888];
  [(VOTBrailleGesturePatternRecognitionEngine *)self->_recognitionEngine resetLastGestures];
}

- (BOOL)_isFullCellStrong
{
  id v3 = [(VOTBrailleGestureTranslator *)self textForBraille:@"⠿" mode:1];
  id v4 = [(VOTBrailleGestureTranslator *)self textForBraille:@"⠿⠿⠿" mode:1];
  id v5 = [v4 stringByReplacingOccurrencesOfString:@" " withString:&stru_1001B7888];

  id v6 = +[NSString stringWithFormat:@"%@%@%@", v3, v3, v3];
  unsigned __int8 v7 = [v6 stringByReplacingOccurrencesOfString:@" " withString:&stru_1001B7888];

  if ([v3 length]) {
    unsigned __int8 v8 = [v5 isEqualToString:v7];
  }
  else {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (id)_outputForBefore:(id)a3 after:(id)a4 delete:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if ([(VOTBrailleGestureTranslator *)self _isFullCellStrong])
  {
    uint64_t v10 = [(VOTBrailleGestureTranslator *)self translatedTextForPrintBraille:v8 mode:3 buffer:&stru_1001B7888];
    [(VOTBrailleGestureTranslator *)self translatedTextForPrintBraille:v9 mode:3 buffer:&stru_1001B7888];
  }
  else
  {
    uint64_t v10 = [(VOTBrailleGestureTranslator *)self textForBraille:v8 mode:1];
    [(VOTBrailleGestureTranslator *)self textForBraille:v9 mode:1];
  id v11 = };
  unint64_t v12 = 0;
  if ([v10 length])
  {
    do
    {
      if (v12 >= (unint64_t)[v11 length]) {
        break;
      }
      unsigned int v13 = [v10 characterAtIndex:v12];
      if (v13 != [v11 characterAtIndex:v12]) {
        break;
      }
      ++v12;
    }
    while (v12 < (unint64_t)[v10 length]);
  }
  uint64_t v14 = objc_opt_new();
  if (v5)
  {
    id v15 = [v10 substringFromIndex:v12];
    id v16 = [objc_alloc((Class)AXAttributedString) initWithString:v15];
    objc_msgSend(v16, "addAttribute:forKey:withRange:", kCFBooleanTrue, UIAccessibilityTokenLowPitch, 0, objc_msgSend(v16, "length"));
    id v17 = [v14 addAttributedString:v16];
  }
  else
  {
    id v15 = [v11 substringFromIndex:v12];
    id v18 = [v14 addString:v15];
  }

  return v14;
}

- (id)textForBraille:(id)a3 mode:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v23 = 0;
  __int16 v24 = &v23;
  uint64_t v25 = 0x3032000000;
  long long v26 = sub_10002AFC4;
  long long v27 = sub_10002AFD4;
  id v28 = 0;
  unsigned __int8 v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  id v8 = [(id)VOTSharedWorkspace selectedBrailleGesturesInputTable];
  id v9 = [v8 tableIdentifier];
  uint64_t v10 = v9;
  if (a4 == 4)
  {

    uint64_t v10 = @"nemeth";
  }
  id v11 = objc_alloc((Class)BRLTTranslationParameters);
  unint64_t v12 = [(__CFString *)v10 brl_languageAndVariant];
  id v13 = objc_msgSend(v11, "initWithLanguage:mode:partial:useTechnicalTable:textPositionsRange:textFormattingRanges:", v12, a4, 0, a4 == 4, 0x7FFFFFFFFFFFFFFFLL, 0, 0);

  uint64_t v14 = [(VOTBrailleGestureTranslator *)self translationService];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10002AFDC;
  v20[3] = &unk_1001B3AB0;
  long long v22 = &v23;
  id v15 = v7;
  long long v21 = v15;
  [v14 textForBraille:v6 parameters:v13 withReply:v20];

  dispatch_time_t v16 = dispatch_time(0, 1000000000);
  if (dispatch_group_wait(v15, v16))
  {
    id v17 = VOTLogBraille();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10011CB3C((uint64_t)v6);
    }
  }
  id v18 = (id)v24[5];

  _Block_object_dispose(&v23, 8);

  return v18;
}

- (id)brailleForText:(id)a3 mode:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v23 = 0;
  __int16 v24 = &v23;
  uint64_t v25 = 0x3032000000;
  long long v26 = sub_10002AFC4;
  long long v27 = sub_10002AFD4;
  id v28 = 0;
  unsigned __int8 v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  id v8 = [(id)VOTSharedWorkspace selectedBrailleGesturesInputTable];
  id v9 = [v8 tableIdentifier];
  uint64_t v10 = v9;
  if (a4 == 4)
  {

    uint64_t v10 = @"nemeth";
  }
  id v11 = objc_alloc((Class)BRLTTranslationParameters);
  unint64_t v12 = [(__CFString *)v10 brl_languageAndVariant];
  id v13 = objc_msgSend(v11, "initWithLanguage:mode:partial:useTechnicalTable:textPositionsRange:textFormattingRanges:", v12, a4, 0, a4 == 4, 0x7FFFFFFFFFFFFFFFLL, 0, 0);

  uint64_t v14 = [(VOTBrailleGestureTranslator *)self translationService];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10002B2A0;
  v20[3] = &unk_1001B3AB0;
  long long v22 = &v23;
  id v15 = v7;
  long long v21 = v15;
  [v14 brailleForText:v6 parameters:v13 withReply:v20];

  dispatch_time_t v16 = dispatch_time(0, 1000000000);
  if (dispatch_group_wait(v15, v16))
  {
    id v17 = VOTLogBraille();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10011CB3C((uint64_t)v6);
    }
  }
  id v18 = (id)v24[5];

  _Block_object_dispose(&v23, 8);

  return v18;
}

- (VOTBrailleGestureTranslatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VOTBrailleGestureTranslatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)shouldUseContractedBraille
{
  return self->_shouldUseContractedBraille;
}

- (void)setShouldUseContractedBraille:(BOOL)a3
{
  self->_shouldUseContractedBraille = a3;
}

- (BOOL)isUnitTesting
{
  return self->_unitTesting;
}

- (int64_t)typingMode
{
  return self->_typingMode;
}

- (CGSize)keyboardSize
{
  double width = self->_keyboardSize.width;
  double height = self->_keyboardSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setTranslationService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_translationService, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_outputForLatestInput, 0);
  objc_storeStrong((id *)&self->_brailleBuffer, 0);

  objc_storeStrong((id *)&self->_recognitionEngine, 0);
}

@end