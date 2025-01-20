@interface TITypingLog
+ (id)emptyTouchEventForLogging;
+ (id)typingLog;
+ (id)typingLogWithDebug:(BOOL)a3;
- (BOOL)adjustForContinuousPath;
- (BOOL)isDebugEnabled;
- (NSArray)keystrokesForTokens;
- (NSMutableArray)currentKeystrokeSequence;
- (TIKeystrokeRecord)currentKeystroke;
- (TITypingLog)init;
- (TITypingLog)initWithDebug:(BOOL)a3;
- (id)correctedTransliterationSequence;
- (id)getDebugData;
- (id)getDebugObject:(id)a3;
- (id)intendedTransliterationSequence;
- (void)addDebugObject:(id)a3 forKey:(id)a4;
- (void)beginKeystrokeWithIntendedKey:(id)a3 touchEvent:(id)a4 touchError:(id)a5;
- (void)beginKeystrokeWithIntendedKey:(id)a3 touchEvent:(id)a4 touchError:(id)a5 documentBefore:(id)a6;
- (void)beginToken;
- (void)enumerateKeystrokesAndPathsForTokensWithBlock:(id)a3;
- (void)finishKeystrokeWithTouchedKey:(id)a3 touchEvent:(id)a4 insertedKey:(id)a5;
- (void)finishKeystrokeWithTouchedKey:(id)a3 touchEvent:(id)a4 insertedKey:(id)a5 predictionBarState:(id)a6 inlineCompletionBarState:(id)a7;
- (void)logAcceptedCandidate:(id)a3;
- (void)logAcceptedCandidate:(id)a3 intendedTransliterationCandidate:(id)a4;
- (void)logAutocorrectionInserted;
- (void)logRejectedAutocorrection;
- (void)registerPathStringAsKeyStrokes:(id)a3 path:(id)a4 predictionBarState:(id)a5;
- (void)revisitPreviousToken;
- (void)setCurrentKeystroke:(id)a3;
- (void)setCurrentKeystrokeSequence:(id)a3;
- (void)setTokenIndex:(unint64_t)a3;
@end

@implementation TITypingLog

+ (id)typingLog
{
  return +[TITypingLog typingLogWithDebug:0];
}

+ (id)typingLogWithDebug:(BOOL)a3
{
  v3 = [[TITypingLog alloc] initWithDebug:a3];

  return v3;
}

- (TITypingLog)initWithDebug:(BOOL)a3
{
  BOOL v3 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TITypingLog;
  v4 = [(TITypingLog *)&v16 init];
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    keystrokesForTokens = v4->_keystrokesForTokens;
    v4->_keystrokesForTokens = v5;

    v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    correctedTransliterationForTokens = v4->_correctedTransliterationForTokens;
    v4->_correctedTransliterationForTokens = v7;

    v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    intendedTransliterationForTokens = v4->_intendedTransliterationForTokens;
    v4->_intendedTransliterationForTokens = v9;

    uint64_t v11 = +[NSMutableDictionary dictionary];
    pathsForTokens = v4->_pathsForTokens;
    v4->_pathsForTokens = (NSMutableDictionary *)v11;

    v4->_isTransliterating = 0;
    if (v3)
    {
      uint64_t v13 = +[NSMutableDictionary dictionary];
      debugData = v4->_debugData;
      v4->_debugData = (NSMutableDictionary *)v13;
    }
  }
  return v4;
}

- (TITypingLog)init
{
  return [(TITypingLog *)self initWithDebug:0];
}

- (void)beginToken
{
  BOOL v3 = +[NSMutableArray array];
  [(TITypingLog *)self setCurrentKeystrokeSequence:v3];

  keystrokesForTokens = self->_keystrokesForTokens;
  v5 = [(TITypingLog *)self currentKeystrokeSequence];
  [(NSMutableArray *)keystrokesForTokens addObject:v5];

  correctedTransliterationForTokens = self->_correctedTransliterationForTokens;
  v7 = +[NSMutableString stringWithString:&stru_8DEF0];
  [(NSMutableArray *)correctedTransliterationForTokens addObject:v7];

  intendedTransliterationForTokens = self->_intendedTransliterationForTokens;
  id v9 = +[NSMutableString stringWithString:&stru_8DEF0];
  [(NSMutableArray *)intendedTransliterationForTokens addObject:v9];
}

- (void)setTokenIndex:(unint64_t)a3
{
  for (i = self->_keystrokesForTokens;
        (unint64_t)[(NSMutableArray *)i count] <= a3;
        i = self->_keystrokesForTokens)
  {
    [(TITypingLog *)self beginToken];
  }
  unint64_t v6 = a3 + 1;
  while (v6 < (unint64_t)[(NSMutableArray *)self->_keystrokesForTokens count])
    [(TITypingLog *)self revisitPreviousToken];
}

- (void)revisitPreviousToken
{
  id v4 = [(NSMutableArray *)self->_keystrokesForTokens lastObject];
  [(NSMutableArray *)self->_keystrokesForTokens removeLastObject];
  BOOL v3 = [(NSMutableArray *)self->_keystrokesForTokens lastObject];
  [v3 addObjectsFromArray:v4];
  [(TITypingLog *)self setCurrentKeystrokeSequence:v3];
}

+ (id)emptyTouchEventForLogging
{
  return +[TIKeyboardTouchEvent touchEventWithStage:location:radius:timestamp:pathIndex:forcedKeyCode:](TIKeyboardTouchEvent, "touchEventWithStage:location:radius:timestamp:pathIndex:forcedKeyCode:", 7, 0, -1, -1.0, -1.0, 0.0, 0.0);
}

- (void)beginKeystrokeWithIntendedKey:(id)a3 touchEvent:(id)a4 touchError:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = (__CFString *)a3;
  uint64_t v11 = +[TIKeystrokeRecord keystrokeRecord];
  [(TITypingLog *)self setCurrentKeystroke:v11];

  v12 = [(TITypingLog *)self currentKeystrokeSequence];
  uint64_t v13 = [(TITypingLog *)self currentKeystroke];
  [v12 addObject:v13];

  if (v10) {
    CFStringRef v14 = v10;
  }
  else {
    CFStringRef v14 = &stru_8DEF0;
  }
  v15 = [(TITypingLog *)self currentKeystroke];
  [v15 setIntendedKey:v14];

  objc_super v16 = v9;
  if (!v9)
  {
    objc_super v16 = +[TITypingLog emptyTouchEventForLogging];
  }
  v17 = [(TITypingLog *)self currentKeystroke];
  [v17 setTouch:v16];

  if (!v9) {
  id v19 = v8;
  }
  if (!v8)
  {
    +[TIPointError errorWithErrorVector:](TIPointError, "errorWithErrorVector:", 0.0, 0.0);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = [(TITypingLog *)self currentKeystroke];
  [v18 setTouchError:v19];

  if (!v8)
  {
  }
}

- (void)beginKeystrokeWithIntendedKey:(id)a3 touchEvent:(id)a4 touchError:(id)a5 documentBefore:(id)a6
{
  v10 = (__CFString *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  CFStringRef v14 = +[TIKeystrokeRecord keystrokeRecord];
  [(TITypingLog *)self setCurrentKeystroke:v14];

  v15 = [(TITypingLog *)self currentKeystrokeSequence];
  objc_super v16 = [(TITypingLog *)self currentKeystroke];
  [v15 addObject:v16];

  if (v10) {
    CFStringRef v17 = v10;
  }
  else {
    CFStringRef v17 = &stru_8DEF0;
  }
  v18 = [(TITypingLog *)self currentKeystroke];
  [v18 setIntendedKey:v17];

  id v19 = v11;
  if (!v11)
  {
    id v19 = +[TITypingLog emptyTouchEventForLogging];
  }
  v20 = [(TITypingLog *)self currentKeystroke];
  [v20 setTouch:v19];

  if (!v11) {
  v21 = v12;
  }
  if (!v12)
  {
    v21 = +[TIPointError errorWithErrorVector:](TIPointError, "errorWithErrorVector:", 0.0, 0.0);
  }
  v22 = [(TITypingLog *)self currentKeystroke];
  [v22 setTouchError:v21];

  if (!v12) {
  uint64_t v33 = 0;
  }
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = sub_49C0;
  v37 = sub_49D0;
  id v23 = v13;
  id v38 = v23;
  if ((unint64_t)[(id)v34[5] length] >= 0x21)
  {
    id v24 = [v23 length];
    v27 = _NSConcreteStackBlock;
    uint64_t v28 = 3221225472;
    v29 = sub_49D8;
    v30 = &unk_8CCD8;
    id v31 = v23;
    v32 = &v33;
    objc_msgSend(v31, "enumerateSubstringsInRange:options:usingBlock:", 0, v24, 259, &v27);
  }
  uint64_t v25 = v34[5];
  v26 = [(TITypingLog *)self currentKeystroke];
  [v26 setDocumentState:v25];

  _Block_object_dispose(&v33, 8);
}

- (void)finishKeystrokeWithTouchedKey:(id)a3 touchEvent:(id)a4 insertedKey:(id)a5 predictionBarState:(id)a6 inlineCompletionBarState:(id)a7
{
  if (a3) {
    CFStringRef v12 = (const __CFString *)a3;
  }
  else {
    CFStringRef v12 = @"<NoKey>";
  }
  id v13 = a7;
  id v14 = a6;
  v15 = (__CFString *)a5;
  id v16 = a4;
  id v17 = a3;
  v18 = [(TITypingLog *)self currentKeystroke];
  [v18 setTouchedKey:v12];

  if (v15) {
    CFStringRef v19 = v15;
  }
  else {
    CFStringRef v19 = &stru_8DEF0;
  }
  v20 = [(TITypingLog *)self currentKeystroke];
  [v20 setInsertedKey:v19];

  v21 = v16;
  if (!v16)
  {
    v21 = +[TITypingLog emptyTouchEventForLogging];
  }
  v22 = [(TITypingLog *)self currentKeystroke];
  [v22 setTouch:v21];

  if (!v16) {
  id v23 = v14;
  }
  if (!v14)
  {
    id v23 = +[NSArray array];
  }
  id v24 = [(TITypingLog *)self currentKeystroke];
  [v24 setPredictionBarState:v23];

  if (!v14) {
  id v26 = v13;
  }
  if (!v13)
  {
    id v26 = +[NSArray array];
  }
  uint64_t v25 = [(TITypingLog *)self currentKeystroke];
  [v25 setInlineCompletionBarState:v26];

  if (!v13)
  {
  }
}

- (void)finishKeystrokeWithTouchedKey:(id)a3 touchEvent:(id)a4 insertedKey:(id)a5
{
}

- (void)registerPathStringAsKeyStrokes:(id)a3 path:(id)a4 predictionBarState:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v15 length])
  {
    uint64_t v10 = 0;
    unsigned int v11 = 1;
    do
    {
      CFStringRef v12 = objc_msgSend(v15, "substringWithRange:", v10, 1);
      [(TITypingLog *)self beginKeystrokeWithIntendedKey:0 touchEvent:0 touchError:0];
      [(TITypingLog *)self finishKeystrokeWithTouchedKey:v12 touchEvent:0 insertedKey:v12 predictionBarState:v9 inlineCompletionBarState:0];

      uint64_t v10 = v11;
    }
    while ([v15 length] != (id)v11++);
  }
  id v14 = +[NSNumber numberWithUnsignedInteger:(char *)[(NSMutableArray *)self->_keystrokesForTokens count] - 1];
  [(NSMutableDictionary *)self->_pathsForTokens setObject:v8 forKeyedSubscript:v14];
}

- (void)logAcceptedCandidate:(id)a3
{
}

- (void)logAcceptedCandidate:(id)a3 intendedTransliterationCandidate:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = +[NSString stringWithFormat:@"{%@}", v10];
  [(TITypingLog *)self beginKeystrokeWithIntendedKey:v7 touchEvent:0 touchError:0];
  [(TITypingLog *)self finishKeystrokeWithTouchedKey:v7 touchEvent:0 insertedKey:&stru_8DEF0];
  if (v6)
  {
    self->_isTransliterating = 1;
    id v8 = [(NSMutableArray *)self->_correctedTransliterationForTokens lastObject];
    [v8 appendString:v10];

    id v9 = [(NSMutableArray *)self->_intendedTransliterationForTokens lastObject];
    [v9 appendString:v6];
  }
}

- (void)logRejectedAutocorrection
{
  [(TITypingLog *)self beginKeystrokeWithIntendedKey:@"<Reject>" touchEvent:0 touchError:0];

  [(TITypingLog *)self finishKeystrokeWithTouchedKey:@"<Reject>" touchEvent:0 insertedKey:&stru_8DEF0];
}

- (void)logAutocorrectionInserted
{
  [(TITypingLog *)self beginKeystrokeWithIntendedKey:@"<Autocorrect>" touchEvent:0 touchError:0];

  [(TITypingLog *)self finishKeystrokeWithTouchedKey:@"<Autocorrect>" touchEvent:0 insertedKey:&stru_8DEF0];
}

- (void)enumerateKeystrokesAndPathsForTokensWithBlock:(id)a3
{
  id v4 = a3;
  v5 = [(TITypingLog *)self keystrokesForTokens];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_4FE8;
  v7[3] = &unk_8CD00;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

- (id)getDebugData
{
  return self->_debugData;
}

- (void)addDebugObject:(id)a3 forKey:(id)a4
{
  debugData = self->_debugData;
  if (debugData) {
    [(NSMutableDictionary *)debugData setObject:a3 forKey:a4];
  }
}

- (id)getDebugObject:(id)a3
{
  debugData = self->_debugData;
  if (debugData)
  {
    debugData = [debugData objectForKey:a3];
  }

  return debugData;
}

- (BOOL)isDebugEnabled
{
  return self->_debugData != 0;
}

- (BOOL)adjustForContinuousPath
{
  int v3 = [(NSMutableArray *)self->_currentKeystrokeSequence count];
  if (v3 < 2) {
    return 0;
  }
  id v4 = [(NSMutableArray *)self->_currentKeystrokeSequence objectAtIndex:(v3 - 1)];
  v5 = [v4 touchedKey];

  id v6 = [(NSMutableArray *)self->_currentKeystrokeSequence objectAtIndex:(v3 - 2)];
  v7 = [v6 touchedKey];

  if ([v5 length] == (char *)&def_3B118 + 1
    && [v7 length] == (char *)&def_3B118 + 1
    && ([v5 characterAtIndex:0], TICharIsSpace())
    && ([v7 characterAtIndex:0], TICharIsAlphaNumeric()))
  {
    [(NSMutableArray *)self->_currentKeystrokeSequence removeLastObject];
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)correctedTransliterationSequence
{
  if (self->_isTransliterating) {
    v2 = self->_correctedTransliterationForTokens;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (id)intendedTransliterationSequence
{
  if (self->_isTransliterating) {
    v2 = self->_intendedTransliterationForTokens;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (NSArray)keystrokesForTokens
{
  return &self->_keystrokesForTokens->super;
}

- (NSMutableArray)currentKeystrokeSequence
{
  return self->_currentKeystrokeSequence;
}

- (void)setCurrentKeystrokeSequence:(id)a3
{
}

- (TIKeystrokeRecord)currentKeystroke
{
  return self->_currentKeystroke;
}

- (void)setCurrentKeystroke:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentKeystroke, 0);
  objc_storeStrong((id *)&self->_currentKeystrokeSequence, 0);
  objc_storeStrong((id *)&self->_debugData, 0);
  objc_storeStrong((id *)&self->_intendedTransliterationForTokens, 0);
  objc_storeStrong((id *)&self->_correctedTransliterationForTokens, 0);
  objc_storeStrong((id *)&self->_pathsForTokens, 0);

  objc_storeStrong((id *)&self->_keystrokesForTokens, 0);
}

@end