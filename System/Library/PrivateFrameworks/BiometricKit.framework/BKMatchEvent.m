@interface BKMatchEvent
+ (id)matchEventWithDictionary:(id)a3 device:(id)a4 error:(id *)a5;
- (BKIdentity)matchedIdentity;
- (BOOL)result;
- (unint64_t)timeStamp;
- (void)setMatchedIdentity:(id)a3;
- (void)setResult:(BOOL)a3;
- (void)setTimeStamp:(unint64_t)a3;
@end

@implementation BKMatchEvent

+ (id)matchEventWithDictionary:(id)a3 device:(id)a4 error:(id *)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    if (__osLog) {
      v18 = __osLog;
    }
    else {
      v18 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    int v19 = 136316162;
    v20 = "dictionary";
    __int16 v21 = 2048;
    uint64_t v22 = 0;
    __int16 v23 = 2080;
    v24 = &unk_1B3B370EE;
    __int16 v25 = 2080;
    v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKMatchEvent.m";
    __int16 v27 = 1024;
    int v28 = 17;
    goto LABEL_18;
  }
  v9 = objc_alloc_init(BKMatchEvent);
  if (!v9)
  {
    if (__osLog) {
      v18 = __osLog;
    }
    else {
      v18 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    int v19 = 136316162;
    v20 = "matchEvent";
    __int16 v21 = 2048;
    uint64_t v22 = 0;
    __int16 v23 = 2080;
    v24 = &unk_1B3B370EE;
    __int16 v25 = 2080;
    v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKMatchEvent.m";
    __int16 v27 = 1024;
    int v28 = 20;
LABEL_18:
    _os_log_impl(&dword_1B3AF1000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v19, 0x30u);
LABEL_19:
    setError((id)1, a5);
    v10 = 0;
    goto LABEL_21;
  }
  v10 = v9;
  v11 = [v7 objectForKeyedSubscript:@"BKMatchEventTimeStamp"];
  -[BKMatchEvent setTimeStamp:](v10, "setTimeStamp:", [v11 unsignedLongValue]);

  if ([(BKMatchEvent *)v10 timeStamp])
  {
    v12 = [v7 objectForKeyedSubscript:@"BKMatchEventResult"];
    -[BKMatchEvent setResult:](v10, "setResult:", [v12 BOOLValue]);

    v13 = [BKIdentity alloc];
    v14 = [v7 objectForKeyedSubscript:@"BKMatchEventMatchedIdentity"];
    v15 = [(BKIdentity *)v13 initWithServerIdentity:v14 device:v8];
    [(BKMatchEvent *)v10 setMatchedIdentity:v15];

    v10 = v10;
    v16 = v10;
    goto LABEL_5;
  }
  setError((id)2, a5);
LABEL_21:
  v16 = 0;
LABEL_5:

  return v16;
}

- (BOOL)result
{
  return self->_result;
}

- (void)setResult:(BOOL)a3
{
  self->_result = a3;
}

- (unint64_t)timeStamp
{
  return self->_timeStamp;
}

- (void)setTimeStamp:(unint64_t)a3
{
  self->_timeStamp = a3;
}

- (BKIdentity)matchedIdentity
{
  return self->_matchedIdentity;
}

- (void)setMatchedIdentity:(id)a3
{
}

- (void).cxx_destruct
{
}

@end