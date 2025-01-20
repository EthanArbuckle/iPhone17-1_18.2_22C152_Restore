@interface VOTOutputRequest
+ (BOOL)setCopyLastOutputRequestEnabled:(BOOL)a3;
+ (id)createRequest;
+ (id)lastRequest;
+ (id)previousRequests;
+ (id)stringShouldSeparateDueToLanguage:(id)a3 language:(id)a4 keyboardLanguageHint:(id)a5;
+ (void)addPreviousRequests:(id)a3;
+ (void)blockNextRequest;
+ (void)clearPreviousRequests;
+ (void)initialize;
+ (void)resetBlockedRequestCount;
+ (void)sendRequestWithString:(id)a3;
+ (void)sendRequestWithString:(id)a3 shouldQueue:(BOOL)a4;
+ (void)setRequestEnqueuedBlock:(id)a3;
- (BOOL)cancelRequest;
- (BOOL)cannotBeInterrupted;
- (BOOL)containsActions;
- (BOOL)disableOutput;
- (BOOL)doesNotInterrupt;
- (BOOL)finishedSuccessfully;
- (BOOL)generatesBraille;
- (BOOL)hasSameOutputAs:(id)a3;
- (BOOL)interruptsEverything;
- (BOOL)isComputerVisionAsynchrousRequest;
- (BOOL)lastSystemRequest;
- (BOOL)sendsToDisplay;
- (BOOL)startedRequest;
- (BOOL)suppressSpeech;
- (BOOL)synthesizeSilently;
- (NSArray)elementHeadersForOutput;
- (NSArray)imageCaptionResults;
- (NSMutableArray)outputActions;
- (NSNumber)brailleAlertTimeout;
- (NSString)keyboardLanguageHint;
- (NSString)language;
- (NSString)supplementalBrailleDescription;
- (VOTOutputRequest)init;
- (VOTOutputRequestCompletionProtocol)completionDelegate;
- (_NSRange)brailleLineRange;
- (double)sendTimestamp;
- (id)_addAXOutputActions:(id)a3 atIndex:(unint64_t)a4;
- (id)actionCompletionBlock;
- (id)actionStringAtIndex:(int64_t)a3;
- (id)addAttributedString:(id)a3;
- (id)addAttributedString:(id)a3 withLanguage:(id)a4;
- (id)addAttributedString:(id)a3 withLanguage:(id)a4 category:(id)a5;
- (id)addString:(id)a3;
- (id)addString:(id)a3 brailleString:(id)a4 breakWords:(BOOL)a5 withLanguage:(id)a6 atIndex:(int64_t)a7;
- (id)addString:(id)a3 brailleString:(id)a4 breakWords:(BOOL)a5 withLanguage:(id)a6 atIndex:(int64_t)a7 category:(id)a8;
- (id)addString:(id)a3 brailleString:(id)a4 withLanguage:(id)a5;
- (id)addString:(id)a3 breakWords:(BOOL)a4 withLanguage:(id)a5 atIndex:(int64_t)a6;
- (id)addString:(id)a3 breakWords:(BOOL)a4 withLanguage:(id)a5 atIndex:(int64_t)a6 category:(id)a7;
- (id)addString:(id)a3 category:(id)a4;
- (id)addString:(id)a3 withLanguage:(id)a4;
- (id)addString:(id)a3 withLanguage:(id)a4 category:(id)a5;
- (id)combinedActionString;
- (id)combinedOriginalString;
- (id)completionBlock;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)lastAction;
- (id)requestQueueMixinBehavior;
- (id)startBlock;
- (int)brailleType;
- (int)limitToComponentType;
- (int64_t)originationType;
- (unint64_t)numberOfActions;
- (unint64_t)numberOfActionsWithString:(id)a3;
- (void)_handleAttachmentInRequest:(__AXUIElement *)a3;
- (void)_mergeActionsStartingAtIndex:(unint64_t)a3;
- (void)addNotificationEvent:(unsigned int)a3 forDelegate:(id)a4;
- (void)addOutputEvent:(id)a3 toFirstActionMatchingCategory:(id)a4;
- (void)addPause:(float)a3;
- (void)addSound:(id)a3;
- (void)addTVElement:(id)a3 filterWithAspectMask:(BOOL)a4;
- (void)addTVElement:(id)a3 servesAsHeader:(BOOL)a4 filterWithAspectMask:(BOOL)a5;
- (void)removeActions;
- (void)removeActionsWithHelper:(id)a3;
- (void)removeLastActionWithString:(id)a3;
- (void)send;
- (void)setActionCompletionBlock:(id)a3;
- (void)setBrailleAlertTimeout:(id)a3;
- (void)setBrailleLineRange:(_NSRange)a3;
- (void)setBrailleType:(int)a3;
- (void)setCancelRequest:(BOOL)a3;
- (void)setCannotBeInterrupted:(BOOL)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setCompletionDelegate:(id)a3;
- (void)setDisableOutput:(BOOL)a3;
- (void)setDoesNotInterrupt:(BOOL)a3;
- (void)setElementHeadersForOutput:(id)a3;
- (void)setFinishedSuccessfully:(BOOL)a3;
- (void)setGeneratesBraille:(BOOL)a3;
- (void)setImageCaptionResults:(id)a3;
- (void)setInterruptsEverything:(BOOL)a3;
- (void)setIsComputerVisionAsynchrousRequest:(BOOL)a3;
- (void)setKeyboardLanguageHint:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setLastSystemRequest:(BOOL)a3;
- (void)setLimitToComponentType:(int)a3;
- (void)setOriginationType:(int64_t)a3;
- (void)setRequestQueueMixinBehavior:(id)a3;
- (void)setSendsToDisplay:(BOOL)a3 fromDirection:(int64_t)a4;
- (void)setStartBlock:(id)a3;
- (void)setStartedRequest:(BOOL)a3;
- (void)setSupplementalBrailleDescription:(id)a3;
- (void)setSuppressSpeech:(BOOL)a3;
- (void)setSynthesizeSilently:(BOOL)a3;
@end

@implementation VOTOutputRequest

+ (void)initialize
{
  if (qword_1001EB648 != -1) {
    dispatch_once(&qword_1001EB648, &stru_1001B3220);
  }
}

- (VOTOutputRequest)init
{
  v7.receiver = self;
  v7.super_class = (Class)VOTOutputRequest;
  v2 = [(VOTOutputRequest *)&v7 init];
  if (v2)
  {
    id v3 = [objc_allocWithZone((Class)NSMutableArray) init];
    v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    *((_DWORD *)v2 + 18) = 0;
    objc_storeWeak((id *)v2 + 18, 0);
    *(_OWORD *)(v2 + 168) = xmmword_10016E480;
    v5 = v2;
  }

  return (VOTOutputRequest *)v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(VOTOutputRequest);
  uint64_t v5 = objc_opt_new();
  outputActions = v4->_outputActions;
  v4->_outputActions = (NSMutableArray *)v5;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  objc_super v7 = self->_outputActions;
  id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = v4->_outputActions;
        id v13 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)v11), "copy", (void)v19);
        [(NSMutableArray *)v12 addObject:v13];

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  v14 = (NSString *)[(NSString *)self->_language copy];
  language = v4->_language;
  v4->_language = v14;

  v16 = (NSArray *)[(NSArray *)self->_elementHeadersForOutput copy];
  elementHeadersForOutput = v4->_elementHeadersForOutput;
  v4->_elementHeadersForOutput = v16;

  v4->_generatesBraille = self->_generatesBraille;
  v4->_brailleType = self->_brailleType;
  v4->_doesNotInterrupt = self->_doesNotInterrupt;
  v4->_cannotBeInterrupted = self->_cannotBeInterrupted;
  return v4;
}

+ (id)createRequest
{
  id v2 = objc_allocWithZone((Class)VOTOutputRequest);

  return [v2 init];
}

+ (void)setRequestEnqueuedBlock:(id)a3
{
  uint64_t v3 = qword_1001EB660;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1001EB660, &stru_1001B3240);
  }
  [(id)qword_1001EB650 lock];
  id v5 = objc_retainBlock(v4);

  v6 = (void *)qword_1001EB658;
  qword_1001EB658 = (uint64_t)v5;

  objc_super v7 = (void *)qword_1001EB650;

  [v7 unlock];
}

+ (void)sendRequestWithString:(id)a3
{
}

+ (void)sendRequestWithString:(id)a3 shouldQueue:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  id v5 = [objc_allocWithZone((Class)VOTOutputRequest) init];
  v6 = v5;
  if (v4) {
    [v5 setDoesNotInterrupt:1];
  }
  id v7 = [v6 addString:v8];
  [v6 send];
}

+ (void)clearPreviousRequests
{
  [(id)qword_1001EB638 lock];
  [(id)qword_1001EB640 removeAllObjects];
  id v2 = (void *)qword_1001EB638;

  [v2 unlock];
}

+ (id)previousRequests
{
  [(id)qword_1001EB638 lock];
  id v2 = [(id)qword_1001EB640 reverseObjectEnumerator];
  uint64_t v3 = [v2 allObjects];

  [(id)qword_1001EB638 unlock];

  return v3;
}

+ (id)lastRequest
{
  [(id)qword_1001EB638 lock];
  id v2 = [(id)qword_1001EB640 reverseObjectEnumerator];
  uint64_t v3 = [v2 nextObject];

  [(id)qword_1001EB638 unlock];

  return v3;
}

+ (void)blockNextRequest
{
}

+ (void)resetBlockedRequestCount
{
  qword_1001EBE10 = 0;
}

+ (void)addPreviousRequests:(id)a3
{
  uint64_t v3 = (void *)qword_1001EB638;
  id v4 = a3;
  [v3 lock];
  [(id)qword_1001EB640 axSafelyAddObjectsFromArray:v4];

  id v5 = (void *)qword_1001EB638;

  [v5 unlock];
}

- (void)removeActions
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = self->_outputActions;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * (void)v7), "setOutputRequest:", 0, (void)v8);
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_outputActions removeAllObjects];
}

- (void)removeActionsWithHelper:(id)a3
{
  id v4 = a3;
  id v5 = [(VOTOutputRequest *)self outputActions];
  id v6 = [v5 mutableCopy];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100006138;
  v9[3] = &unk_1001B3268;
  id v10 = v4;
  id v7 = v4;
  long long v8 = [v6 indexesOfObjectsPassingTest:v9];
  [v6 removeObjectsAtIndexes:v8];

  [(NSMutableArray *)self->_outputActions setArray:v6];
}

- (void)removeLastActionWithString:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(NSMutableArray *)self->_outputActions reverseObjectEnumerator];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
      long long v11 = [v10 string];
      unsigned __int8 v12 = [v11 isEqualToString:v4];

      if (v12) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
    id v13 = v10;

    if (!v13) {
      goto LABEL_13;
    }
    [v13 setOutputRequest:0];
    [(NSMutableArray *)self->_outputActions removeObject:v13];
    id v5 = v13;
  }
LABEL_12:

LABEL_13:
}

- (unint64_t)numberOfActionsWithString:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = self->_outputActions;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "string", (void)v14);
        unsigned int v12 = [v11 isEqualToString:v4];

        v8 += v12;
      }
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)containsActions
{
  return [(NSMutableArray *)self->_outputActions count] != 0;
}

- (VOTOutputRequestCompletionProtocol)completionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_completionDelegate);

  return (VOTOutputRequestCompletionProtocol *)WeakRetained;
}

- (void)setLanguage:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

+ (BOOL)setCopyLastOutputRequestEnabled:(BOOL)a3
{
  BOOL result = byte_1001EB668;
  byte_1001EB668 = a3;
  return result;
}

- (double)sendTimestamp
{
  return self->_sendTimestamp;
}

- (void)send
{
  +[NSDate timeIntervalSinceReferenceDate];
  self->_sendTimestamp = v3;
  [(id)qword_1001EB638 lock];
  id v4 = (void *)qword_1001EB640;
  if (byte_1001EB668)
  {
    id v5 = [(VOTOutputRequest *)self copy];
    [v4 addObject:v5];
  }
  else
  {
    [(id)qword_1001EB640 addObject:self];
  }
  int v6 = _AXSAutomationEnabled();
  id v7 = [(id)qword_1001EB640 count];
  if (v6) {
    unint64_t v8 = 100;
  }
  else {
    unint64_t v8 = 10;
  }
  if ((unint64_t)v7 > v8)
  {
    uint64_t v9 = (char *)[(id)qword_1001EB640 count] - v8;
    id v10 = objc_msgSend((id)qword_1001EB640, "subarrayWithRange:", 0, v9);
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v11 = [v10 countByEnumeratingWithState:&v51 objects:v56 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v52;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v52 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          [v15 setFinishedSuccessfully:0];
          long long v16 = [v15 completionDelegate];
          [v16 outputRequestFinished:v15];
        }
        id v12 = [v10 countByEnumeratingWithState:&v51 objects:v56 count:16];
      }
      while (v12);
    }
    objc_msgSend((id)qword_1001EB640, "removeObjectsInRange:", 0, v9);
  }
  [(id)qword_1001EB638 unlock];
  if (_AXSAutomationEnabled())
  {
    long long v17 = +[NSDistributedNotificationCenter defaultCenter];
    [v17 postNotificationName:@"VoiceOverEventOccurred" object:@"DidProcessOutputRequest"];
  }
  if ([(id)VOTSharedWorkspace inUnitTestMode])
  {
    [(id)qword_1001EB650 lock];
    if (qword_1001EB658)
    {
      _Block_copy((const void *)qword_1001EB658);
      v18 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
      [(id)qword_1001EB650 unlock];
      if (v18)
      {
        ((void (**)(void, VOTOutputRequest *))v18)[2](v18, self);
      }
    }
    else
    {
      [(id)qword_1001EB650 unlock];
    }
  }
  if (qword_1001EBE10 < 1)
  {
    if ([(NSMutableArray *)self->_outputActions count])
    {
      if (([(id)VOTSharedWorkspace outputDisabled] & 1) == 0)
      {
        v45 = +[NSMutableString string];
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v19 = self->_outputActions;
        id v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v47 objects:v55 count:16];
        if (v20)
        {
          id v21 = v20;
          uint64_t v22 = *(void *)v48;
          do
          {
            for (j = 0; j != v21; j = (char *)j + 1)
            {
              if (*(void *)v48 != v22) {
                objc_enumerationMutation(v19);
              }
              v24 = *(void **)(*((void *)&v47 + 1) + 8 * (void)j);
              [v24 setOutputRequest:self];
              if (![v24 component])
              {
                if (self->_generatesBraille && [v24 generatesBraille])
                {
                  v25 = [v24 brailleString];
                  v26 = v25;
                  if (v25)
                  {
                    id v27 = v25;
                  }
                  else
                  {
                    id v27 = [v24 string];
                  }
                  v28 = v27;

                  [v45 appendFormat:@"%@ ", v28];
                }
                if ([v24 performPunctuationTranslation])
                {
                  v29 = [v24 string];
                  id v30 = [v24 replaceCommas];
                  v31 = [v24 objectForVariant:15];
                  v32 = sub_100052644(v29, (uint64_t)v30, v31);
                  [v24 setString:v32];
                }
              }
            }
            id v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v47 objects:v55 count:16];
          }
          while (v21);
        }

        if (self->_generatesBraille)
        {
          v33 = [[VOTOutputAction alloc] initWithString:v45];
          [(VOTOutputAction *)v33 setComponent:3];
          [(VOTOutputAction *)v33 setSynchronization:1];
          [(VOTOutputAction *)v33 setOutputRequest:self];
          if (self->_brailleType)
          {
            v34 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
            [(VOTOutputAction *)v33 setObject:v34 forVariant:34];
          }
          id WeakRetained = objc_loadWeakRetained((id *)&self->_brailleAlertTimeout);

          if (WeakRetained)
          {
            id v36 = objc_loadWeakRetained((id *)&self->_brailleAlertTimeout);
            [(VOTOutputAction *)v33 setObject:v36 forVariant:36];
          }
          if (self->_brailleLineRange.location || self->_brailleLineRange.length != 0x7FFFFFFF)
          {
            v37 = +[NSValue valueWithRange:](NSValue, "valueWithRange:");
            [(VOTOutputAction *)v33 setObject:v37 forVariant:35];
          }
          [(NSMutableArray *)self->_outputActions addObject:v33];
        }
        if ([(VOTOutputRequest *)self limitToComponentType])
        {
          v46[0] = _NSConcreteStackBlock;
          v46[1] = 3221225472;
          v46[2] = sub_100006B20;
          v46[3] = &unk_1001B3290;
          v46[4] = self;
          [(VOTOutputRequest *)self removeActionsWithHelper:v46];
        }
        id v38 = [objc_allocWithZone((Class)NSNumber) initWithUnsignedInt:2];
        id v39 = [objc_allocWithZone((Class)AXIndexMap) init];
        [v39 setObject:v38 forIndex:1];
        [v39 setObject:self forIndex:14];
        v40 = +[VOTOutputManager outputManager];
        [v40 handleEvent:v39];

        if ([(VOTOutputRequest *)self lastSystemRequest])
        {
          v41 = +[VOTOutputManager outputManager];
          [v41 shutdown];
        }
      }
    }
    else
    {
      [(VOTOutputRequest *)self setFinishedSuccessfully:1];
      v42 = [(VOTOutputRequest *)self completionDelegate];
      [v42 outputRequestFinished:self];

      v43 = [(VOTOutputRequest *)self completionBlock];

      if (v43)
      {
        v44 = [(VOTOutputRequest *)self completionBlock];
        ((void (**)(void, VOTOutputRequest *))v44)[2](v44, self);
      }
    }
  }
  else
  {
    --qword_1001EBE10;
  }
}

- (BOOL)hasSameOutputAs:(id)a3
{
  id v4 = a3;
  id v5 = [(VOTOutputRequest *)self outputActions];
  int v6 = [v4 outputActions];
  id v7 = [v5 count];
  if (v7 == [v6 count])
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = v5;
    id v8 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v29;
      id v21 = v5;
      id v22 = v4;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          id v13 = v6;
          id v14 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (!v14)
          {

LABEL_21:
            BOOL v19 = 0;
            id v5 = v21;
            id v4 = v22;
            goto LABEL_22;
          }
          id v15 = v14;
          int v16 = 0;
          uint64_t v17 = *(void *)v25;
          do
          {
            for (j = 0; j != v15; j = (char *)j + 1)
            {
              if (*(void *)v25 != v17) {
                objc_enumerationMutation(v13);
              }
              v16 |= [v12 hasSameOutputAs:*(void *)(*((void *)&v24 + 1) + 8 * (void)j)];
            }
            id v15 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v15);

          if ((v16 & 1) == 0) {
            goto LABEL_21;
          }
        }
        id v9 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
        BOOL v19 = 1;
        id v5 = v21;
        id v4 = v22;
        if (v9) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v19 = 1;
    }
LABEL_22:
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (void)addOutputEvent:(id)a3 toFirstActionMatchingCategory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = self->_outputActions;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v14 = objc_msgSend(v13, "objectForVariant:", 86, (void)v15);
        if ([v7 isEqual:v14])
        {
          [v13 addOutputEvent:v6];

          goto LABEL_11;
        }
      }
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (NSMutableArray)outputActions
{
  return self->_outputActions;
}

- (id)actionStringAtIndex:(int64_t)a3
{
  double v3 = [(NSMutableArray *)self->_outputActions objectAtIndex:a3];
  id v4 = [v3 string];

  return v4;
}

- (id)combinedActionString
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_100007020;
  id v10 = sub_100007030;
  id v11 = 0;
  outputActions = self->_outputActions;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100007038;
  v5[3] = &unk_1001B32B8;
  v5[4] = &v6;
  [(NSMutableArray *)outputActions enumerateObjectsUsingBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)combinedOriginalString
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_100007020;
  id v10 = sub_100007030;
  id v11 = 0;
  outputActions = self->_outputActions;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000071DC;
  v5[3] = &unk_1001B32B8;
  v5[4] = &v6;
  [(NSMutableArray *)outputActions enumerateObjectsUsingBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (unint64_t)numberOfActions
{
  return (unint64_t)[(NSMutableArray *)self->_outputActions count];
}

- (id)lastAction
{
  return [(NSMutableArray *)self->_outputActions lastObject];
}

- (BOOL)doesNotInterrupt
{
  return self->_doesNotInterrupt;
}

- (void)setDoesNotInterrupt:(BOOL)a3
{
  self->_doesNotInterrupt = a3;
}

- (void)setInterruptsEverything:(BOOL)a3
{
  self->_interruptsEverything = a3;
}

- (BOOL)interruptsEverything
{
  return self->_interruptsEverything;
}

- (void)_handleAttachmentInRequest:(__AXUIElement *)a3
{
  if ([(id)VOTSharedWorkspace inUnitTestMode])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      +[VOTElement elementWithUIElement:a3];
    }
    else
    {
      objc_opt_class();
      __UIAccessibilityCastAsClass();
    uint64_t v6 = };
  }
  else
  {
    id v5 = +[AXUIElement uiElementWithAXElement:a3];
    uint64_t v6 = +[VOTElement elementWithUIElement:v5];
  }
  [v6 addTextualInformationToRequest:self options:0xC11004000 dataPackage:0];
}

- (id)addAttributedString:(id)a3 withLanguage:(id)a4 category:(id)a5
{
  id v8 = a3;
  id v9 = (__CFString *)a4;
  id v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v108 = [(VOTOutputRequest *)self addString:v8 withLanguage:v9 category:v10];
    goto LABEL_97;
  }
  if (![v8 length])
  {
    id v108 = 0;
    goto LABEL_97;
  }
  id v11 = [v8 copy];

  id v12 = +[NSMutableDictionary dictionary];
  uint64_t v13 = AXUIAccessibilitySpeechAttributePhonemeSubstitution;
  id v14 = [v11 length];
  v121[0] = _NSConcreteStackBlock;
  v121[1] = 3221225472;
  v121[2] = sub_1000080CC;
  v121[3] = &unk_1001B32E0;
  id v15 = v12;
  id v122 = v15;
  id v8 = v11;
  id v123 = v8;
  objc_msgSend(v8, "enumerateAttribute:inRange:options:usingBlock:", v13, 0, v14, 0, v121);
  uint64_t v127 = v13;
  long long v16 = +[NSArray arrayWithObjects:&v127 count:1];
  [v8 removeAttributes:v16];

  if ([v15 count]) {
    [v8 setAttribute:v15 forKey:v13];
  }
  v102 = v15;
  long long v17 = [(VOTOutputRequest *)self outputActions];
  v101 = (char *)[v17 count];

  unint64_t v119 = 0;
  uint64_t v120 = 0;
  id v103 = [v8 length];
  id v108 = +[NSMutableArray array];
  long long v18 = 0;
  uint64_t v104 = UIAccessibilityTokenBrailleOverride;
  unint64_t v19 = 0;
  id v105 = v8;
  id v106 = v10;
  while (1)
  {
    id v20 = [v8 attributesAtIndex:v19 effectiveRange:&v119];
    id v21 = v20;
    if (v119 == 0x7FFFFFFFFFFFFFFFLL)
    {

      goto LABEL_96;
    }
    v112 = v18;
    id v22 = objc_msgSend(v8, "substringWithRange:", v119, v120);
    v23 = +[AXSubsystemVoiceOver sharedInstance];
    unsigned __int8 v24 = [v23 ignoreLogging];

    if ((v24 & 1) == 0)
    {
      long long v25 = +[AXSubsystemVoiceOver identifier];
      long long v26 = AXLoggerForFacility();

      os_log_type_t v27 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v26, v27))
      {
        long long v28 = AXColorizeFormatLog();
        unint64_t v99 = v119;
        uint64_t v100 = v120;
        id v97 = v22;
        v98 = v21;
        long long v29 = _AXStringForArgs();
        if (os_log_type_enabled(v26, v27))
        {
          *(_DWORD *)buf = 138543362;
          v126 = v29;
          _os_log_impl((void *)&_mh_execute_header, v26, v27, "%{public}@", buf, 0xCu);
        }

        id v10 = v106;
      }
    }
    unint64_t v30 = v119;
    uint64_t v31 = objc_msgSend(v21, "objectForKey:", UIAccessibilityTokenLiteralTextRanges, v97, v98, v99, v100);
    uint64_t v32 = v31;
    v111 = (void *)v31;
    if (v9)
    {
      if (v31) {
        goto LABEL_20;
      }
    }
    else
    {
      v33 = [v21 objectForKey:UIAccessibilityTokenLanguage];
      if (v33
        || ([v21 objectForKey:UIAccessibilityTokenOverrideLanguage],
            (v33 = objc_claimAutoreleasedReturnValue()) != 0)
        || ([v21 objectForKey:@"accessibilityLanguage"],
            (v33 = objc_claimAutoreleasedReturnValue()) != 0))
      {

LABEL_20:
        id v9 = &stru_1001B7888;
        goto LABEL_21;
      }
      if (v32) {
        goto LABEL_20;
      }
      id v9 = 0;
    }
LABEL_21:
    v34 = [(VOTOutputRequest *)self outputActions];
    v35 = [v34 count];

    id v113 = v22;
    id v36 = (char *)[v113 rangeOfString:v113];
    if (v36 == (char *)0x7FFFFFFFFFFFFFFFLL) {
      v37 = 0;
    }
    else {
      v37 = v36;
    }
    id v38 = [v21 objectForKey:UIAccessibilityTokenListItemLabel];

    if (v38 && &v37[v30] != (char *)0x7FFFFFFFFFFFFFFFLL && (char *)v119 == &v37[v30])
    {
      id v39 = [v21 objectForKey:UIAccessibilityTokenListItemIdentifier];
      id v40 = [v39 unsignedIntegerValue];
      if (v40 != [v112 unsignedIntegerValue])
      {
        id v41 = v39;

        v42 = [v21 objectForKey:UIAccessibilityTokenListItemLabel];
        v43 = +[AXAttributedString axAttributedStringWithString:v42];

        id v10 = v106;
        [v43 setAttribute:kCFBooleanTrue forKey:UIAccessibilityTokenLowPitch];
        id v44 = [(VOTOutputRequest *)self addAttributedString:v43 withLanguage:0 category:v106];

        v112 = v41;
      }
    }
    uint64_t v45 = [v21 objectForKeyedSubscript:v104];
    v46 = [v21 allKeys];
    [v113 removeAttributes:v46];

    v110 = (void *)v45;
    v109 = [(VOTOutputRequest *)self addString:v113 brailleString:v45 breakWords:0 withLanguage:v9 atIndex:0x7FFFFFFFFFFFFFFFLL category:v10];
    objc_msgSend(v108, "axSafelyAddObjectsFromArray:");
    long long v47 = [(VOTOutputRequest *)self outputActions];
    long long v48 = [v47 count];

    if ([v21 count])
    {
      v107 = v9;
      long long v49 = [(VOTOutputRequest *)self outputActions];
      long long v50 = objc_msgSend(v49, "subarrayWithRange:", v35, v48 - v35);

      long long v117 = 0u;
      long long v118 = 0u;
      long long v115 = 0u;
      long long v116 = 0u;
      id obj = v50;
      id v51 = [obj countByEnumeratingWithState:&v115 objects:v124 count:16];
      if (!v51) {
        goto LABEL_86;
      }
      id v52 = v51;
      uint64_t v53 = *(void *)v116;
      while (1)
      {
        for (i = 0; i != v52; i = (char *)i + 1)
        {
          if (*(void *)v116 != v53) {
            objc_enumerationMutation(obj);
          }
          v55 = *(void **)(*((void *)&v115 + 1) + 8 * i);
          id v56 = +[AXOutputRequest addAttributesToAction:v55 fromDictionary:v21];
          v57 = [v55 objectForVariant:53];

          if (v57)
          {
            v58 = sub_100051804(off_1001EA9E8, @"element.header.text.nolevel", 0);
            v59 = +[AXAttributedString axAttributedStringWithString:v58];

            [v59 setAttribute:kCFBooleanTrue forKey:UIAccessibilityTokenLowPitch];
            id v60 = [(VOTOutputRequest *)self addAttributedString:v59 withLanguage:0];
          }
          v61 = [v55 objectForVariant:52];

          if (v61)
          {
            v62 = sub_100051804(off_1001EA9E8, @"element.link.text", 0);
            v63 = +[AXAttributedString axAttributedStringWithString:v62];

            v64 = +[AXSettings sharedInstance];
            unint64_t v65 = (unint64_t)[v64 voiceOverLinkFeedback];

            if ((v65 & 2) != 0)
            {
              id v66 = [(VOTOutputRequest *)self addAttributedString:v63 withLanguage:0];
              v67 = [(VOTOutputRequest *)self lastAction];
              [v67 setIsVoiceOverGeneratedContent:1];

              if ((v65 & 8) != 0) {
                [v55 setObject:&off_1001C4EA8 forVariant:32];
              }
              v68 = [(VOTOutputRequest *)self lastAction];
              [v68 setGeneratesBraille:(v65 >> 4) & 1];
            }
            if ((v65 & 4) != 0)
            {
              v69 = [(VOTOutputRequest *)self lastAction];
              [v69 setObject:@"Sounds/LinkBegin.aiff" forVariant:75];
            }
          }
          v70 = [v55 objectForVariant:62];

          if (v70)
          {
            v71 = [v55 objectForVariant:62];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v72 = v71;
LABEL_49:
              v73 = v72;
              if (v72)
              {
                v74 = +[AXAttributedString axAttributedStringWithString:v72];
                [v74 setAttribute:kCFBooleanTrue forKey:UIAccessibilityTokenLowPitch];
                id v75 = [(VOTOutputRequest *)self addAttributedString:v74 withLanguage:0];
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && [v71 BOOLValue])
              {
                sub_100051804(off_1001EA9E8, @"highlighted", 0);
                id v72 = (id)objc_claimAutoreleasedReturnValue();
                goto LABEL_49;
              }
            }
          }
          v76 = [v55 objectForVariant:85];

          if (v76)
          {
            v77 = [v55 objectForVariant:85];
            [(VOTOutputRequest *)self _handleAttachmentInRequest:v77];
          }
          v78 = [v55 objectForVariant:88];

          if (v78)
          {
            v79 = +[AXSettings sharedInstance];
            unsigned __int8 v80 = [v79 voiceOverInlineTextCompletionAppearanceFeedback];

            if ([(id)VOTSharedWorkspace typingPitchChangeEnabled])
            {
              if ((v80 & 8) != 0) {
                [v55 setObject:UIAccessibilityTokenLowPitch forVariant:32];
              }
            }
          }
          v81 = [v55 objectForVariant:30];
          if (v81)
          {
            [v55 removeObjectForVariant:30];
            unsigned __int8 v82 = [v81 isEqualToString:UIAccessibilityTokenSpeakLiteralPunctuation];
            v83 = &AXSSVoiceOverPunctuationGroupAll;
            if ((v82 & 1) != 0
              || (unsigned int v84 = [v81 isEqualToString:UIAccessibilityTokenSpeakNoPunctuation],
                  v83 = &AXSSVoiceOverPunctuationGroupNone,
                  v84))
            {
              v85 = [(id)VOTSharedWorkspace punctuationGroupForUUID:*v83];
              [v55 setObject:v85 forVariant:30];
            }
          }
          v86 = [v55 objectForVariant:32];

          if (v86)
          {
            if (![(id)VOTSharedWorkspace typingPitchChangeEnabled])
            {
              [v55 removeObjectForVariant:32];
              goto LABEL_84;
            }
            v87 = [v55 objectForVariant:32];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v88 = v87;
              if ([v88 isEqualToString:UIAccessibilityTokenHighPitch])
              {
                LODWORD(v89) = 1.5;
                goto LABEL_77;
              }
              if ([v88 isEqualToString:UIAccessibilityTokenLowPitch])
              {
                LODWORD(v89) = 0.75;
LABEL_77:
                v95 = +[NSNumber numberWithFloat:v89];
                [v55 setObject:v95 forVariant:32];

LABEL_82:
LABEL_83:

                goto LABEL_84;
              }
              if (![v88 isEqualToString:UIAccessibilityTokenPlaceholder])
              {
                id v97 = v88;
                _AXAssert();
              }
              v93 = v55;
              v94 = &off_1001C4EA8;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_83;
              }
              [v87 floatValue];
              double v91 = v90;
              if (v91 > 2.0) {
                double v91 = 2.0;
              }
              double v92 = fmax(v91, 0.0);
              *(float *)&double v92 = v92;
              id v88 = +[NSNumber numberWithFloat:v92];
              v93 = v55;
              v94 = (_UNKNOWN **)v88;
            }
            objc_msgSend(v93, "setObject:forVariant:", v94, 32, v97);
            goto LABEL_82;
          }
LABEL_84:
        }
        id v52 = [obj countByEnumeratingWithState:&v115 objects:v124 count:16];
        if (!v52)
        {
LABEL_86:

          id v10 = v106;
          id v9 = v107;
          break;
        }
      }
    }
    v119 += v120;

    unint64_t v19 = v119;
    if (v119 == 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    id v8 = v105;
    long long v18 = v112;
    if (v119 >= (unint64_t)v103) {
      goto LABEL_96;
    }
  }
  id v8 = v105;
  long long v18 = v112;
LABEL_96:
  [(VOTOutputRequest *)self _mergeActionsStartingAtIndex:&v101[-((uint64_t)v101 > 0)]];

LABEL_97:

  return v108;
}

- (id)addAttributedString:(id)a3 withLanguage:(id)a4
{
  return [(VOTOutputRequest *)self addAttributedString:a3 withLanguage:a4 category:0];
}

- (id)_addAXOutputActions:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = objc_opt_new();
  id v8 = [(NSMutableArray *)self->_outputActions count];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v6;
  id v9 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = [[VOTOutputAction alloc] initWithAXAction:*(void *)(*((void *)&v20 + 1) + 8 * i)];
        [(VOTOutputAction *)v13 setOutputRequest:self];
        id v14 = [(id)VOTSharedWorkspace applicationForCurrentElement];
        id v15 = [v14 bundleIdentifier];
        [(VOTOutputAction *)v13 setObject:v15 forVariant:43];

        [v7 addObject:v13];
        id v16 = [(NSMutableArray *)self->_outputActions count];
        outputActions = self->_outputActions;
        if (a4 >= (unint64_t)v16) {
          [(NSMutableArray *)outputActions addObject:v13];
        }
        else {
          [(NSMutableArray *)outputActions insertObject:v13 atIndex:a4];
        }
        a4 += (unsigned char *)[(NSMutableArray *)self->_outputActions count] - v8;
      }
      id v10 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  return v7;
}

- (void)_mergeActionsStartingAtIndex:(unint64_t)a3
{
  unint64_t v47 = a3;
  int64_t v4 = a3 + 1;
  if (a3 + 1 <= (unint64_t)[(NSMutableArray *)self->_outputActions count])
  {
    id v41 = self;
    id v5 = [(VOTOutputRequest *)self outputActions];
    id v44 = [v5 count];
    id v6 = objc_alloc_init((Class)NSMutableIndexSet);
    uint64_t v7 = 0;
    do
      [v6 addIndex:v7++];
    while (v4 != v7);
    v42 = v6;
    uint64_t v45 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
    if (v4 < (uint64_t)v44)
    {
      v43 = v5;
      do
      {
        id v8 = [v5 objectAtIndexedSubscript:v47];
        id v9 = [v8 outputVariants];

        id v10 = [v5 objectAtIndexedSubscript:v4];
        uint64_t v11 = [v10 outputVariants];

        if (v9)
        {
          id v46 = [v9 copy];
          [v46 addObjectsFromIndexMap:v11];
        }
        else
        {
          id v46 = [v11 copy];
        }
        uint64_t v53 = 0;
        long long v54 = &v53;
        uint64_t v55 = 0x2020000000;
        char v56 = 1;
        id v12 = +[NSMutableSet set];
        uint64_t v13 = [v46 indexes];
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472;
        v48[2] = sub_100008890;
        v48[3] = &unk_1001B3308;
        id v14 = v9;
        id v49 = v14;
        id v15 = v11;
        id v50 = v15;
        id v16 = v12;
        id v51 = v16;
        id v52 = &v53;
        [v13 enumerateIndexesUsingBlock:v48];

        long long v17 = [v5 objectAtIndexedSubscript:v47];
        long long v18 = [v17 string];
        unint64_t v19 = [v18 stringByTrimmingCharactersInSet:v45];
        id v20 = [v19 length];

        long long v21 = [v5 objectAtIndexedSubscript:v4];
        long long v22 = [v21 string];
        long long v23 = [v22 stringByTrimmingCharactersInSet:v45];

        unint64_t v24 = (unint64_t)[v23 length];
        long long v25 = objc_msgSend(v16, "ax_filteredSetUsingBlock:", &stru_1001B3348);
        BOOL v26 = ((unint64_t)[v25 count] | v24) == 0;
        if (v24) {
          BOOL v27 = v20 == 0;
        }
        else {
          BOOL v27 = 1;
        }
        BOOL v28 = v27 || *((unsigned char *)v54 + 24) == 0;
        if (!v28 || v26)
        {
          if ([v23 length])
          {
            long long v29 = [v5 objectAtIndexedSubscript:v47];
            unint64_t v30 = [v29 string];

            if ([v30 length])
            {
              unsigned int v31 = objc_msgSend(v45, "characterIsMember:", objc_msgSend(v30, "characterAtIndex:", (char *)objc_msgSend(v30, "length") - 1));
              CFStringRef v32 = @" ";
              if (v31) {
                CFStringRef v32 = &stru_1001B7888;
              }
            }
            else
            {
              CFStringRef v32 = @" ";
            }
            v33 = +[NSString stringWithFormat:@"%@%@", v32, v23];
            v34 = [v43 objectAtIndexedSubscript:v47];
            v35 = [v34 objectForVariant:54];

            if (v35)
            {
              id v36 = v23;

              v33 = v36;
            }
            v37 = [v30 stringByAppendingString:v33];
            id v38 = [v43 objectAtIndexedSubscript:v47];
            [v38 setString:v37 overrideOriginalString:1];

            id v5 = v43;
          }
        }
        else
        {
          [v42 addIndex:v4];
          unint64_t v47 = v4;
        }
        ++v4;

        _Block_object_dispose(&v53, 8);
      }
      while (v44 != (id)v4);
    }
    id v39 = [v5 objectsAtIndexes:v42];
    id v40 = [v39 count];
    if (v40 < [v5 count])
    {
      [(VOTOutputRequest *)v41 removeActions];
      [(NSMutableArray *)v41->_outputActions addObjectsFromArray:v39];
    }
  }
}

- (id)addAttributedString:(id)a3
{
  return [(VOTOutputRequest *)self addAttributedString:a3 withLanguage:0];
}

- (id)addString:(id)a3
{
  id v4 = a3;
  if ([v4 isAXAttributedString]) {
    [(VOTOutputRequest *)self addAttributedString:v4];
  }
  else {
  id v5 = [(VOTOutputRequest *)self addString:v4 breakWords:0 withLanguage:0 atIndex:0x7FFFFFFFFFFFFFFFLL];
  }

  return v5;
}

- (id)addString:(id)a3 withLanguage:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([v7 isAXAttributedString]) {
    [(VOTOutputRequest *)self addAttributedString:v7 withLanguage:v6];
  }
  else {
  id v8 = [(VOTOutputRequest *)self addString:v7 breakWords:0 withLanguage:v6 atIndex:0x7FFFFFFFFFFFFFFFLL];
  }

  return v8;
}

- (id)addString:(id)a3 brailleString:(id)a4 withLanguage:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  if ([v8 isAXAttributedString])
  {
    uint64_t v11 = UIAccessibilityTokenBrailleOverride;
    id v12 = v8;
    [v12 setAttribute:v10 forKey:v11];

    uint64_t v13 = [(VOTOutputRequest *)self addAttributedString:v12 withLanguage:v9];
    id v10 = v12;
  }
  else
  {
    uint64_t v13 = [(VOTOutputRequest *)self addString:v8 brailleString:v10 breakWords:0 withLanguage:v9 atIndex:0x7FFFFFFFFFFFFFFFLL];
  }

  return v13;
}

- (id)addString:(id)a3 category:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([v7 isAXAttributedString]) {
    [(VOTOutputRequest *)self addAttributedString:v7 withLanguage:0 category:v6];
  }
  else {
  id v8 = [(VOTOutputRequest *)self addString:v7 breakWords:0 withLanguage:0 atIndex:0x7FFFFFFFFFFFFFFFLL category:v6];
  }

  return v8;
}

- (id)addString:(id)a3 withLanguage:(id)a4 category:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  if ([v10 isAXAttributedString]) {
    [(VOTOutputRequest *)self addAttributedString:v10 withLanguage:v9 category:v8];
  }
  else {
  uint64_t v11 = [(VOTOutputRequest *)self addString:v10 breakWords:0 withLanguage:v9 atIndex:0x7FFFFFFFFFFFFFFFLL category:v8];
  }

  return v11;
}

+ (id)stringShouldSeparateDueToLanguage:(id)a3 language:(id)a4 keyboardLanguageHint:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v122 = objc_opt_new();
  uint64_t v137 = (uint64_t)[v7 length];
  v131 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  v124 = +[NSMutableCharacterSet punctuationCharacterSet];
  uint64_t v120 = +[NSCharacterSet decimalDigitCharacterSet];
  v126 = +[NSCharacterSet characterSetWithCharactersInString:@"ー"];
  if (v8)
  {
    id v10 = +[AXLanguageManager sharedInstance];
    uint64_t v11 = [v10 dialectForLanguageID:v8];

    id v127 = v8;
  }
  else
  {
    id v12 = [(id)VOTSharedWorkspace selectedLanguage];

    if (v12)
    {
      uint64_t v13 = +[AXLanguageManager sharedInstance];
      id v14 = [(id)VOTSharedWorkspace selectedLanguage];
      uint64_t v11 = [v13 dialectForLanguageID:v14];
    }
    else
    {
      uint64_t v13 = +[VOTOutputManager outputManager];
      uint64_t v11 = [v13 currentLanguageMap];
    }

    id v15 = [(id)VOTSharedWorkspace selectedLanguage];
    id v16 = v15;
    if (v15)
    {
      id v127 = v15;
    }
    else
    {
      id v127 = [(id)VOTSharedWorkspace systemSpokenLanguage];
    }
  }
  v125 = +[AXLanguageManager sharedInstance];
  long long v17 = [v11 specificLanguageID];
  int v123 = sub_100038290(v17);
  int v121 = sub_1000382E8();
  long long v118 = v17;
  if ([v17 hasPrefix:@"he"]) {
    [v124 removeCharactersInString:@"-"];
  }
  unint64_t v129 = (unint64_t)v9;
  id v119 = v8;
  id v130 = objc_alloc_init((Class)AXIndexMap);
  v141 = v11;
  if (v137 < 1)
  {
    long long v18 = 0;
    uint64_t v133 = 0;
    uint64_t v142 = 0;
    goto LABEL_171;
  }
  uint64_t v142 = 0;
  uint64_t v133 = 0;
  BYTE4(v128) = 0;
  long long v18 = 0;
  uint64_t v19 = 0;
  v138 = v7;
  do
  {
    id v20 = v18;
    id v21 = [v7 rangeOfComposedCharacterSequenceAtIndex:v19];
    long long v18 = objc_msgSend(v7, "substringWithRange:", v21, v22);
    id v23 = [v18 characterAtIndex:0];
    if ([v18 length] == (id)1)
    {
      if ([v131 characterIsMember:v23])
      {
        BYTE4(v128) &= v123 ^ 1;
LABEL_18:
        id v24 = v18;
        goto LABEL_168;
      }
      if ([v124 characterIsMember:v23]) {
        goto LABEL_18;
      }
    }
    v134 = v20;
    long long v25 = sub_10003838C();
    unsigned int v26 = [v25 characterIsMember:v23];

    BOOL v27 = sub_1000382F0();
    unsigned int v147 = v23;
    unsigned int v28 = [v27 characterIsMember:v23];

    v132 = v18;
    if ((sub_10005180C(v141, v127, v18) & 1) != 0 || (v26 & 1) != 0 || v28)
    {
      if ((v123 & v26 & 1) == 0 && (!v121 || !v28))
      {
        LODWORD(v128) = 0;
        id v20 = 0;
        int v29 = 1;
        goto LABEL_74;
      }
      if ((v128 & 0x100000000) != 0)
      {
        LODWORD(v128) = 0;
      }
      else
      {
        id v30 = [v134 characterAtIndex:0];
        uint64_t v31 = v23;
        if (v134)
        {
          id v32 = v30;
          if (([v131 characterIsMember:v30] & 1) == 0
            && ([v124 characterIsMember:v32] & 1) == 0
            && v32 != 8207
            && ([v120 characterIsMember:v23] & 1) == 0
            && ![v124 characterIsMember:v23])
          {
            uint64_t v128 = 0;
            id v20 = 0;
            int v29 = 1;
            goto LABEL_75;
          }
        }
        id v33 = +[NSMutableString string];
        uint64_t v34 = v19;
        v35 = 0;
        uint64_t v36 = v19;
        if (v19 < v137)
        {
          while (1)
          {
            id v37 = [v138 characterAtIndex:v36];
            unsigned int v38 = [v131 characterIsMember:v37];
            if (v38)
            {
              if (v35) {
                goto LABEL_47;
              }
              v35 = (__CFString *)[v33 mutableCopy];
            }
            id v39 = sub_10003838C();
            unsigned int v40 = v38 | [v39 characterIsMember:v37];

            if (v40 != 1) {
              break;
            }
            if (v35) {
              [(__CFString *)v35 appendFormat:@"%C", v37];
            }
            else {
              objc_msgSend(v33, "appendFormat:", @"%C", v37);
            }
            uint64_t v19 = v34;
            if (v137 == ++v36)
            {
              uint64_t v36 = v137;
              goto LABEL_47;
            }
          }
          uint64_t v19 = v34;
        }
LABEL_47:
        id v41 = +[AXLanguageManager doNotTranslateWords];
        if (([v41 containsObject:v33] & 1) != 0
          || [v41 containsObject:v35])
        {
          if ([v33 isEqualToString:@"VoiceOver"])
          {
            id v20 = 0;
            int v29 = 1;
            uint64_t v128 = 1;
            id v7 = v138;
LABEL_73:

            long long v18 = v132;
            goto LABEL_74;
          }
          if (v19 >= 1)
          {
            v42 = objc_msgSend(v138, "substringWithRange:", v133, v19 - v133);
            v177[0] = @"string";
            v177[1] = @"language";
            v178[0] = v42;
            uint64_t v43 = v142;
            if (!v142)
            {
              long long v116 = +[NSNull null];
              uint64_t v43 = (uint64_t)v116;
            }
            v178[1] = v43;
            id v44 = +[NSDictionary dictionaryWithObjects:v178 forKeys:v177 count:2];
            [(id)v122 addObject:v44];

            if (!v142) {
            uint64_t v19 = v34;
            }
          }

          uint64_t v133 = v19;
          uint64_t v19 = v36 - 1;
          LODWORD(v128) = 1;
          uint64_t v142 = @"en-US";
        }
        else
        {
          LODWORD(v128) = 0;
        }
        id v7 = v138;
      }
      uint64_t v45 = [(id)VOTSharedWorkspace languageRotorItems];
      long long v161 = 0u;
      long long v162 = 0u;
      long long v163 = 0u;
      long long v164 = 0u;
      id v33 = v45;
      id v46 = [v33 countByEnumeratingWithState:&v161 objects:v176 count:16];
      if (v46)
      {
        id v47 = v46;
        uint64_t v139 = v19;
        uint64_t v48 = *(void *)v162;
        while (2)
        {
          for (i = 0; i != v47; i = (char *)i + 1)
          {
            if (*(void *)v162 != v48) {
              objc_enumerationMutation(v33);
            }
            id v50 = *(void **)(*((void *)&v161 + 1) + 8 * i);
            id v51 = [v50 objectForKeyedSubscript:@"RotorItem"];
            id v52 = AXLanguageCanonicalFormToGeneralLanguage();
            unsigned int v53 = [v52 hasPrefix:@"en"];

            if (v53)
            {
              v35 = [v50 objectForKeyedSubscript:@"RotorItem"];
              goto LABEL_70;
            }
          }
          id v47 = [v33 countByEnumeratingWithState:&v161 objects:v176 count:16];
          if (v47) {
            continue;
          }
          break;
        }
        v35 = @"en-US";
LABEL_70:
        id v7 = v138;
        uint64_t v19 = v139;
      }
      else
      {
        v35 = @"en-US";
      }

      id v41 = +[AXLanguageManager sharedInstance];
      id v20 = [v41 dialectForLanguageID:v35];
      int v29 = 0;
      BYTE4(v128) = 1;
      goto LABEL_73;
    }
    int v29 = 0;
    LODWORD(v128) = 0;
    id v20 = 0;
LABEL_74:
    uint64_t v31 = v147;
LABEL_75:
    unint64_t v143 = (unint64_t)v20;
    if (sub_1000518D0(v31) && !sub_1000518C0(v31))
    {
      uint64_t v55 = +[VOTOutputManager outputManager];
      unsigned int v54 = [v55 replacesCharacterAsPunctuation:v31];
    }
    else
    {
      unsigned int v54 = 0;
    }
    char v56 = +[NSNumber numberWithBool:v54 & ~v29];
    [v130 setObject:v56 forIndex:v19];

    id v57 = v18;
    if ((((v29 | v54) & 1) != 0 || (AXLanguageIsSpeakableEmojiString() & 1) != 0
                                 || sub_10005205C(v19, v7))
      && ([v126 characterIsMember:v147] & 1) == 0)
    {
      if (v142)
      {
        unsigned __int8 v80 = objc_msgSend(v125, "dialectForLanguageID:");
        v58 = v80;
        if ((v54 & ~v29) != 0
          && (([v80 canSpeakCharacter:v147] & 1) != 0
           || ([v58 canSpeakString:v57] & 1) != 0))
        {
          goto LABEL_167;
        }
        objc_msgSend(v138, "substringWithRange:", v133, v19 - v133);
        id v60 = (id)objc_claimAutoreleasedReturnValue();
        v174[0] = @"string";
        v174[1] = @"language";
        v175[0] = v60;
        v175[1] = v142;
        v81 = +[NSDictionary dictionaryWithObjects:v175 forKeys:v174 count:2];
        [(id)v122 addObject:v81];
      }
      else
      {
        if (!v128)
        {
          uint64_t v142 = 0;
          goto LABEL_168;
        }
        v58 = objc_msgSend(v7, "substringWithRange:", v133, v19 - v133);
        v172[0] = @"string";
        v172[1] = @"skipsUnpronounceable";
        v173[0] = v58;
        v173[1] = &__kCFBooleanTrue;
        id v60 = +[NSDictionary dictionaryWithObjects:v173 forKeys:v172 count:2];
        [(id)v122 addObject:v60];
      }
      uint64_t v142 = 0;
      uint64_t v133 = v19;
      goto LABEL_166;
    }
    uint64_t v140 = v19;
    v58 = +[NSMutableArray array];
    v59 = [(id)VOTSharedWorkspace languageRotorItems];
    long long v157 = 0u;
    long long v158 = 0u;
    long long v159 = 0u;
    long long v160 = 0u;
    id v60 = v59;
    id v61 = [v60 countByEnumeratingWithState:&v157 objects:v171 count:16];
    if (v61)
    {
      id v62 = v61;
      uint64_t v63 = *(void *)v158;
      do
      {
        for (j = 0; j != v62; j = (char *)j + 1)
        {
          if (*(void *)v158 != v63) {
            objc_enumerationMutation(v60);
          }
          unint64_t v65 = *(void **)(*((void *)&v157 + 1) + 8 * (void)j);
          id v66 = [v65 objectForKeyedSubscript:@"Enabled"];
          unsigned int v67 = [v66 BOOLValue];

          if (v67)
          {
            v68 = [v65 objectForKeyedSubscript:@"RotorItem"];
            if (v68) {
              [v58 addObject:v68];
            }
          }
        }
        id v62 = [v60 countByEnumeratingWithState:&v157 objects:v171 count:16];
      }
      while (v62);
    }
    id v20 = (id)v143;

    if (!(v129 | v143))
    {
      uint64_t v69 = v147;
      v70 = [v125 dialectsThatCanSpeakCharacter:v147 overridePreferredLanguages:v58];
      long long v153 = 0u;
      long long v154 = 0u;
      long long v155 = 0u;
      long long v156 = 0u;
      id v71 = v70;
      uint64_t v19 = v140;
      id v144 = [v71 countByEnumeratingWithState:&v153 objects:v170 count:16];
      if (v144)
      {
        uint64_t v72 = *(void *)v154;
        uint64_t v135 = *(void *)v154;
        while (2)
        {
          for (k = 0; k != v144; k = (char *)k + 1)
          {
            if (*(void *)v154 != v72) {
              objc_enumerationMutation(v71);
            }
            v74 = *(void **)(*((void *)&v153 + 1) + 8 * (void)k);
            if (([v74 isDialectSecondaryForCharacter:v69] & 1) == 0)
            {
              id v75 = [v74 langMap];
              if (![v75 isWestern]) {
                goto LABEL_130;
              }
              id v76 = v71;
              v77 = [v141 langMap];
              if (![v77 isWestern] || v19 <= 0)
              {

                id v71 = v76;
LABEL_130:

LABEL_131:
                id v20 = v74;
                goto LABEL_132;
              }
              v78 = [v74 specificLanguageID];
              unsigned __int8 v79 = [(id)v142 isEqual:v78];

              uint64_t v19 = v140;
              id v71 = v76;
              uint64_t v72 = v135;
              if (v79) {
                goto LABEL_131;
              }
            }
            uint64_t v69 = v147;
          }
          id v144 = [v71 countByEnumeratingWithState:&v153 objects:v170 count:16];
          if (v144) {
            continue;
          }
          break;
        }
      }
      id v20 = 0;
LABEL_132:

      goto LABEL_137;
    }
    uint64_t v19 = v140;
    uint64_t v82 = v147;
    if (v143)
    {
LABEL_138:
      double v92 = [v20 specificLanguageID];
      if ([(id)v142 isEqualToString:v92])
      {
        id v93 = (id)v133;
        goto LABEL_163;
      }
      if (v142)
      {

LABEL_143:
        if (v19 < 1)
        {
          uint64_t v133 = v19;
        }
        else
        {
          v146 = v20;
          id v93 = (id)v19;
          id v95 = (id)v133;
          if (v19 > v133)
          {
            id v96 = (id)v140;
            uint64_t v97 = v140;
            while (1)
            {
              v98 = [v130 objectForIndex:--v97];
              unsigned int v99 = [v98 BOOLValue];

              if (!v99) {
                break;
              }
              id v148 = [v138 rangeOfComposedCharacterSequenceAtIndex:v97];
              uint64_t v100 = objc_msgSend(v138, "substringWithRange:");
              id v101 = [v100 characterAtIndex:0];
              v102 = [v146 speakableCharacters];
              if (v102 && ([v146 canSpeakCharacter:v101] & 1) == 0)
              {
                unsigned __int8 v103 = [v146 canSpeakString:v100];

                if ((v103 & 1) == 0)
                {

                  break;
                }
              }
              else
              {
              }
              id v93 = v148;
              id v96 = v148;
              id v95 = (id)v133;
              if (v97 <= v133) {
                goto LABEL_156;
              }
            }
            id v93 = v96;
            id v95 = (id)v133;
          }
LABEL_156:
          if (v93 == v95)
          {
            uint64_t v19 = v140;
            id v20 = v146;
          }
          else
          {
            double v92 = objc_msgSend(v138, "substringWithRange:");
            v168[0] = v92;
            v167[0] = @"string";
            v167[1] = @"language";
            uint64_t v104 = v142;
            if (!v142)
            {
              long long v117 = +[NSNull null];
              uint64_t v104 = (uint64_t)v117;
            }
            v168[1] = v104;
            id v105 = +[NSDictionary dictionaryWithObjects:v168 forKeys:v167 count:2];
            [(id)v122 addObject:v105];

            if (!v142) {
            uint64_t v19 = v140;
            }
            id v20 = v146;
LABEL_163:

            uint64_t v133 = (uint64_t)v93;
          }
        }
      }
      else
      {
        uint64_t v94 = [v141 isEqual:v20];

        if ((v94 & 1) == 0) {
          goto LABEL_143;
        }
      }
      if (([v20 isEqual:v141] & 1) == 0)
      {
        uint64_t v106 = [v20 specificLanguageID];

        uint64_t v142 = v106;
      }
      goto LABEL_166;
    }
    v83 = [v125 dialectsThatCanSpeakCharacter:v147 overridePreferredLanguages:v58];
    long long v149 = 0u;
    long long v150 = 0u;
    long long v151 = 0u;
    long long v152 = 0u;
    id v71 = v83;
    id v145 = [v71 countByEnumeratingWithState:&v149 objects:v169 count:16];
    if (!v145)
    {
LABEL_124:

      goto LABEL_135;
    }
    uint64_t v84 = *(void *)v150;
    uint64_t v136 = *(void *)v150;
LABEL_116:
    uint64_t v85 = 0;
    while (1)
    {
      if (*(void *)v150 != v84) {
        objc_enumerationMutation(v71);
      }
      v86 = *(void **)(*((void *)&v149 + 1) + 8 * v85);
      if ([v86 isDialectSecondaryForCharacter:v82]) {
        goto LABEL_122;
      }
      id v87 = v71;
      id v88 = [v86 langMap];
      double v89 = [v88 generalLanguageID];
      if ([v89 isEqual:v129]) {
        break;
      }
      float v90 = [v86 specificLanguageID];
      unsigned __int8 v91 = [v90 isEqualToString:v129];

      uint64_t v82 = v147;
      id v71 = v87;
      uint64_t v84 = v136;
      if (v91) {
        goto LABEL_134;
      }
LABEL_122:
      if (v145 == (id)++v85)
      {
        id v145 = [v71 countByEnumeratingWithState:&v149 objects:v169 count:16];
        if (v145) {
          goto LABEL_116;
        }
        goto LABEL_124;
      }
    }

    id v71 = v87;
LABEL_134:
    id v20 = v86;

    if (v20) {
      goto LABEL_136;
    }
LABEL_135:
    id v20 = [v71 firstObject];
LABEL_136:
    uint64_t v19 = v140;
LABEL_137:

    if (v20) {
      goto LABEL_138;
    }
LABEL_166:

    long long v18 = v132;
LABEL_167:

    id v7 = v138;
LABEL_168:

    ++v19;
  }
  while (v19 < v137);
LABEL_171:
  if (v142 | v122)
  {
    v107 = v119;
    id v108 = (void *)v129;
    if (v137 == 1)
    {
      BOOL v109 = sub_1000518D0((uint64_t)[v7 characterAtIndex:0]);
      if (!v129 && v109)
      {

        uint64_t v142 = 0;
      }
    }
    if (v137 != v133)
    {
      v110 = objc_msgSend(v7, "substringWithRange:", v133, v137 - v133);
      v165[0] = @"string";
      v165[1] = @"language";
      v166[0] = v110;
      v111 = (void *)v142;
      if (!v142)
      {
        v111 = +[NSNull null];
      }
      v166[1] = v111;
      v112 = +[NSDictionary dictionaryWithObjects:v166 forKeys:v165 count:2];
      [(id)v122 addObject:v112];

      if (!v142) {
    }
      }
    id v113 = (void *)v142;
  }
  else
  {
    id v113 = 0;
    v107 = v119;
    id v108 = (void *)v129;
  }
  id v114 = (id)v122;

  return v114;
}

- (void)addPause:(float)a3
{
  id v7 = [objc_allocWithZone((Class)VOTOutputAction) initWithString:&stru_1001B7888];
  *(float *)&double v5 = a3;
  id v6 = +[NSNumber numberWithFloat:v5];
  [v7 setObject:v6 forVariant:38];

  [v7 setOutputRequest:self];
  [(NSMutableArray *)self->_outputActions addObject:v7];
}

- (id)addString:(id)a3 breakWords:(BOOL)a4 withLanguage:(id)a5 atIndex:(int64_t)a6
{
  return [(VOTOutputRequest *)self addString:a3 breakWords:a4 withLanguage:a5 atIndex:a6 category:0];
}

- (id)addString:(id)a3 breakWords:(BOOL)a4 withLanguage:(id)a5 atIndex:(int64_t)a6 category:(id)a7
{
  return [(VOTOutputRequest *)self addString:a3 brailleString:0 breakWords:a4 withLanguage:a5 atIndex:a6 category:a7];
}

- (id)addString:(id)a3 brailleString:(id)a4 breakWords:(BOOL)a5 withLanguage:(id)a6 atIndex:(int64_t)a7
{
  return [(VOTOutputRequest *)self addString:a3 brailleString:a4 breakWords:a5 withLanguage:a6 atIndex:a7 category:0];
}

- (id)addString:(id)a3 brailleString:(id)a4 breakWords:(BOOL)a5 withLanguage:(id)a6 atIndex:(int64_t)a7 category:(id)a8
{
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a8;
  if (!v14)
  {
    id v23 = 0;
    goto LABEL_43;
  }
  if (v16) {
    goto LABEL_8;
  }
  long long v18 = objc_opt_class();
  uint64_t v19 = [(VOTOutputRequest *)self keyboardLanguageHint];
  id v20 = [v18 stringShouldSeparateDueToLanguage:v14 language:0 keyboardLanguageHint:v19];

  id v21 = +[AXOutputRequest processStringsAndLanguages:v20 brailleString:v15 breakWords:v11 withLanguage:0 atIndex:a7 category:v17];
  uint64_t v22 = v21;
  if (!v21 || ![v21 count])
  {

LABEL_8:
    if (self->_sendsToDisplay)
    {
      id v24 = [objc_allocWithZone((Class)VOTOutputAction) initWithTextDisplay:v14];
      [v24 setOutputRequest:self];
      [v24 setObject:v17 forVariant:86];
      long long v25 = +[NSNumber numberWithInteger:self->_textDisplayDirection];
      [v24 setObject:v25 forVariant:11];
      id v26 = [(NSMutableArray *)self->_outputActions count];
      outputActions = self->_outputActions;
      if ((unint64_t)v26 <= a7) {
        [(NSMutableArray *)outputActions addObject:v24];
      }
      else {
        [(NSMutableArray *)outputActions insertObject:v24 atIndex:a7];
      }
    }
    else
    {
      id v24 = 0;
    }
    if ((unint64_t)[v14 length] >= 0x3E9 && v11)
    {
      id v41 = v15;
      unsigned int v28 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
      id v23 = objc_opt_new();
      if ((unint64_t)[v14 length] < 0x3E9)
      {
LABEL_34:
        id v32 = v24;
      }
      else
      {
        int v29 = v14;
        while (2)
        {
          uint64_t v30 = 1000;
          while ((objc_msgSend(v28, "characterIsMember:", objc_msgSend(v29, "characterAtIndex:", v30)) & 1) == 0)
          {
            if (--v30 == -1)
            {
              uint64_t v30 = (uint64_t)[v29 length];
              if (v30 < 0)
              {
                id v14 = v29;
                goto LABEL_34;
              }
              break;
            }
          }
          uint64_t v31 = [v29 substringToIndex:v30];
          id v32 = [objc_allocWithZone((Class)VOTOutputAction) initWithString:v31];

          [v32 setObject:v17 forVariant:86];
          [v32 setOutputRequest:self];
          [v32 setWasDivided:1];
          [v32 setObject:v16 forVariant:15];
          [(NSMutableArray *)self->_outputActions addObject:v32];
          [v23 addObject:v32];
          unint64_t v33 = v30 + 1;
          if (v33 >= (unint64_t)[v29 length])
          {

            id v14 = v29;
          }
          else
          {
            id v14 = [v29 substringFromIndex:v33];

            int v29 = v14;
            id v24 = v32;
            if ((unint64_t)[v14 length] > 0x3E8) {
              continue;
            }
          }
          break;
        }
      }
      if ([v14 length])
      {
        id v34 = [objc_allocWithZone((Class)VOTOutputAction) initWithString:v14];

        [v34 setObject:v17 forVariant:86];
        [v34 setOutputRequest:self];
        [v34 setWasDivided:1];
        if ([v16 length]) {
          [v34 setObject:v16 forVariant:15];
        }
        [(NSMutableArray *)self->_outputActions addObject:v34];
        [v23 addObject:v34];
      }
      else
      {
        id v34 = v32;
      }
      id v15 = v41;
    }
    else
    {
      id v34 = [objc_allocWithZone((Class)VOTOutputAction) initWithString:v14 brailleString:v15];

      [v34 setObject:v17 forVariant:86];
      if ([v16 length]) {
        id v35 = v16;
      }
      else {
        id v35 = 0;
      }
      [v34 setObject:v35 forVariant:15];
      uint64_t v36 = [(id)VOTSharedWorkspace applicationForCurrentElement];
      id v37 = [v36 bundleIdentifier];
      [v34 setObject:v37 forVariant:43];

      [v34 setOutputRequest:self];
      id v38 = [(NSMutableArray *)self->_outputActions count];
      id v39 = self->_outputActions;
      if ((unint64_t)v38 <= a7) {
        [(NSMutableArray *)v39 addObject:v34];
      }
      else {
        [(NSMutableArray *)v39 insertObject:v34 atIndex:a7];
      }
      id v42 = v34;
      id v23 = +[NSArray arrayWithObjects:&v42 count:1];
    }

    goto LABEL_42;
  }
  id v23 = [(VOTOutputRequest *)self _addAXOutputActions:v22 atIndex:a7];

LABEL_42:
LABEL_43:

  return v23;
}

- (void)addSound:(id)a3
{
  id v4 = a3;
  id v5 = [objc_allocWithZone((Class)VOTOutputAction) initWithSoundPath:v4];

  [v5 setOutputRequest:self];
  [(NSMutableArray *)self->_outputActions addObject:v5];
}

- (void)addNotificationEvent:(unsigned int)a3 forDelegate:(id)a4
{
  if (a4)
  {
    outputActions = self->_outputActions;
    id v6 = a4;
    id v7 = [(NSMutableArray *)outputActions lastObject];
    [v7 setObject:v6 forVariant:a3];
  }
}

- (void)setSendsToDisplay:(BOOL)a3 fromDirection:(int64_t)a4
{
  self->_sendsToDisplay = a3;
  self->_textDisplayDirection = a4;
}

- (BOOL)sendsToDisplay
{
  return self->_sendsToDisplay;
}

- (void)setCannotBeInterrupted:(BOOL)a3
{
  self->_cannotBeInterrupted = a3;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = self->_outputActions;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * (void)v7), "setObject:forVariant:", kCFBooleanTrue, 23, (void)v8);
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (BOOL)cannotBeInterrupted
{
  return self->_cannotBeInterrupted;
}

- (id)description
{
  id v3 = +[NSMutableString stringWithFormat:@"[%p] OutputRequest:\n", self];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v16 = self;
  id v4 = self->_outputActions;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [v3 appendString:@"Action: "];
        long long v10 = [v9 string];

        if (v10)
        {
          long long v11 = [v9 string];
          [v3 appendFormat:@"'%@'", v11];
        }
        else
        {
          [v3 appendString:@"__NO_STRING__"];
        }
        [v3 appendString:@"\n"];
      }
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  id v12 = +[NSMutableArray array];
  uint64_t v13 = v12;
  if (v16->_cannotBeInterrupted) {
    [v12 addObject:@"Cannot be interrupted"];
  }
  if (v16->_doesNotInterrupt) {
    [v13 addObject:@"Does not interrupt"];
  }
  if (v16->_interruptsEverything) {
    [v13 addObject:@"Interrupts everything"];
  }
  if ([v13 count])
  {
    id v14 = [v13 componentsJoinedByString:@", "];
    [v3 appendFormat:@"%@\n", v14];
  }

  return v3;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  id v4 = [(VOTOutputRequest *)self combinedActionString];
  if (v4) {
    [v3 setObject:v4 forKeyedSubscript:@"combinedActionString"];
  }
  id v5 = [(VOTOutputRequest *)self combinedOriginalString];
  if (v5) {
    [v3 setObject:v5 forKeyedSubscript:@"combinedOriginalString"];
  }
  id v6 = +[NSNumber numberWithBool:[(VOTOutputRequest *)self finishedSuccessfully]];
  [v3 setObject:v6 forKeyedSubscript:@"finishedSuccessfully"];

  return v3;
}

- (BOOL)startedRequest
{
  return self->startedRequest;
}

- (void)setStartedRequest:(BOOL)a3
{
  self->startedRequest = a3;
}

- (BOOL)disableOutput
{
  return self->disableOutput;
}

- (void)setDisableOutput:(BOOL)a3
{
  self->disableOutput = a3;
}

- (BOOL)finishedSuccessfully
{
  return self->finishedSuccessfully;
}

- (void)setFinishedSuccessfully:(BOOL)a3
{
  self->finishedSuccessfully = a3;
}

- (NSArray)elementHeadersForOutput
{
  return self->elementHeadersForOutput;
}

- (void)setElementHeadersForOutput:(id)a3
{
}

- (BOOL)lastSystemRequest
{
  return self->lastSystemRequest;
}

- (void)setLastSystemRequest:(BOOL)a3
{
  self->lastSystemRequest = a3;
}

- (BOOL)cancelRequest
{
  return self->cancelRequest;
}

- (void)setCancelRequest:(BOOL)a3
{
  self->cancelRequest = a3;
}

- (NSArray)imageCaptionResults
{
  return self->imageCaptionResults;
}

- (void)setImageCaptionResults:(id)a3
{
}

- (void)setCompletionDelegate:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (id)actionCompletionBlock
{
  return self->_actionCompletionBlock;
}

- (void)setActionCompletionBlock:(id)a3
{
}

- (id)startBlock
{
  return self->_startBlock;
}

- (void)setStartBlock:(id)a3
{
}

- (int)limitToComponentType
{
  return self->_limitToComponentType;
}

- (void)setLimitToComponentType:(int)a3
{
  self->_limitToComponentType = a3;
}

- (int64_t)originationType
{
  return self->_originationType;
}

- (void)setOriginationType:(int64_t)a3
{
  self->_originationType = a3;
}

- (id)requestQueueMixinBehavior
{
  return self->_requestQueueMixinBehavior;
}

- (void)setRequestQueueMixinBehavior:(id)a3
{
}

- (BOOL)generatesBraille
{
  return self->_generatesBraille;
}

- (void)setGeneratesBraille:(BOOL)a3
{
  self->_generatesBraille = a3;
}

- (BOOL)suppressSpeech
{
  return self->_suppressSpeech;
}

- (void)setSuppressSpeech:(BOOL)a3
{
  self->_suppressSpeech = a3;
}

- (int)brailleType
{
  return self->_brailleType;
}

- (void)setBrailleType:(int)a3
{
  self->_brailleType = a3;
}

- (NSNumber)brailleAlertTimeout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_brailleAlertTimeout);

  return (NSNumber *)WeakRetained;
}

- (void)setBrailleAlertTimeout:(id)a3
{
}

- (_NSRange)brailleLineRange
{
  NSUInteger length = self->_brailleLineRange.length;
  NSUInteger location = self->_brailleLineRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setBrailleLineRange:(_NSRange)a3
{
  self->_brailleLineRange = a3;
}

- (NSString)supplementalBrailleDescription
{
  return self->_supplementalBrailleDescription;
}

- (void)setSupplementalBrailleDescription:(id)a3
{
}

- (BOOL)synthesizeSilently
{
  return self->_synthesizeSilently;
}

- (void)setSynthesizeSilently:(BOOL)a3
{
  self->_synthesizeSilently = a3;
}

- (BOOL)isComputerVisionAsynchrousRequest
{
  return self->_isComputerVisionAsynchrousRequest;
}

- (void)setIsComputerVisionAsynchrousRequest:(BOOL)a3
{
  self->_isComputerVisionAsynchrousRequest = a3;
}

- (NSString)keyboardLanguageHint
{
  return self->_keyboardLanguageHint;
}

- (void)setKeyboardLanguageHint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardLanguageHint, 0);
  objc_storeStrong((id *)&self->_supplementalBrailleDescription, 0);
  objc_destroyWeak((id *)&self->_brailleAlertTimeout);
  objc_storeStrong(&self->_requestQueueMixinBehavior, 0);
  objc_storeStrong(&self->_startBlock, 0);
  objc_storeStrong(&self->_actionCompletionBlock, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_destroyWeak((id *)&self->_completionDelegate);
  objc_storeStrong((id *)&self->imageCaptionResults, 0);
  objc_storeStrong((id *)&self->elementHeadersForOutput, 0);
  objc_storeStrong((id *)&self->_elementHeadersForOutput, 0);
  objc_storeStrong((id *)&self->_language, 0);

  objc_storeStrong((id *)&self->_outputActions, 0);
}

- (void)addTVElement:(id)a3 filterWithAspectMask:(BOOL)a4
{
}

- (void)addTVElement:(id)a3 servesAsHeader:(BOOL)a4 filterWithAspectMask:(BOOL)a5
{
  BOOL v5 = a5;
  id v23 = a3;
  if (a4 || (unint64_t v8 = (unint64_t)[v23 traits], (kAXHeaderTrait & v8) != 0))
  {
    if (v5 && ([v23 aspectMask] & 1) == 0) {
      goto LABEL_6;
    }
    id v9 = objc_alloc((Class)AXAttributedString);
    long long v10 = [v23 label];
    id v11 = [v9 initWithString:v10];

    uint64_t v12 = AXUIAccessibilitySpeechAttributePitch;
    [v11 setAttribute:&off_1001C4F08 forKey:AXUIAccessibilitySpeechAttributePitch];
    uint64_t v13 = [v23 language];
    id v14 = [(VOTOutputRequest *)self addAttributedString:v11 withLanguage:v13];

    if (v5)
    {
LABEL_6:
      if (([v23 aspectMask] & 2) == 0) {
        goto LABEL_11;
      }
      uint64_t v12 = AXUIAccessibilitySpeechAttributePitch;
    }
    id v15 = objc_alloc((Class)AXAttributedString);
    id v16 = [v23 value];
    id v17 = [v15 initWithString:v16];

    [v17 setAttribute:&off_1001C4F08 forKey:v12];
    long long v18 = [v23 language];
    id v19 = [(VOTOutputRequest *)self addAttributedString:v17 withLanguage:v18];
  }
  else
  {
    if (v5) {
      uint64_t v20 = 17827842;
    }
    else {
      uint64_t v20 = 16779266;
    }
    [v23 addTextualInformationToRequest:self options:v20 dataPackage:0];
    if (![v23 doesHaveTraits:kAXKeyboardKeyTrait] || !objc_msgSend(v23, "aspectMask")) {
      goto LABEL_11;
    }
    id v17 = [v23 label];
    if ([v17 length] != (id)1) {
      goto LABEL_10;
    }
    long long v18 = sub_100052754(v17, 0, 0);
    if ([v18 length])
    {
      LODWORD(v21) = 0.75;
      [(VOTOutputRequest *)self addPause:v21];
      id v22 = [(VOTOutputRequest *)self addString:v18];
    }
  }

LABEL_10:
LABEL_11:

  _objc_release_x1();
}

@end