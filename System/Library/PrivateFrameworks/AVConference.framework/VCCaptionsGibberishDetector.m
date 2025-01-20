@interface VCCaptionsGibberishDetector
- (BOOL)gibberishStateForCaptionsToken:(int64_t)a3;
- (BOOL)processTranscript:(id)a3;
- (VCCaptionsGibberishDetector)initWithGibberishThreshold:(double)a3 windowLength:(unint64_t)a4;
- (void)dealloc;
- (void)reset;
@end

@implementation VCCaptionsGibberishDetector

- (VCCaptionsGibberishDetector)initWithGibberishThreshold:(double)a3 windowLength:(unint64_t)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)VCCaptionsGibberishDetector;
  v6 = [(VCCaptionsGibberishDetector *)&v19 init];
  v7 = v6;
  if (v6)
  {
    v6->_gibberishThreshold = a3;
    v6->_windowLength = a4;
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v7->_gibberishStates = v8;
    if (v8)
    {
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v7->_history = v9;
      if (v9) {
        return v7;
      }
      if ((VCCaptionsGibberishDetector *)objc_opt_class() == v7)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v14 = VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCCaptionsGibberishDetector initWithGibberishThreshold:windowLength:](v14);
          }
        }
        goto LABEL_24;
      }
      if (objc_opt_respondsToSelector()) {
        v12 = (__CFString *)[(VCCaptionsGibberishDetector *)v7 performSelector:sel_logPrefix];
      }
      else {
        v12 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3
        || (uint64_t v18 = VRTraceErrorLogLevelToCSTR(),
            v16 = *MEMORY[0x1E4F47A50],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
      {
LABEL_24:

        return 0;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v21 = v18;
      __int16 v22 = 2080;
      v23 = "-[VCCaptionsGibberishDetector initWithGibberishThreshold:windowLength:]";
      __int16 v24 = 1024;
      int v25 = 32;
      __int16 v26 = 2112;
      v27 = v12;
      __int16 v28 = 2048;
      v29 = v7;
      v17 = " [%s] %s:%d %@(%p) Failed to create history dictionary";
    }
    else
    {
      if ((VCCaptionsGibberishDetector *)objc_opt_class() == v7)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v13 = VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCCaptionsGibberishDetector initWithGibberishThreshold:windowLength:](v13);
          }
        }
        goto LABEL_24;
      }
      if (objc_opt_respondsToSelector()) {
        v11 = (__CFString *)[(VCCaptionsGibberishDetector *)v7 performSelector:sel_logPrefix];
      }
      else {
        v11 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_24;
      }
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v21 = v15;
      __int16 v22 = 2080;
      v23 = "-[VCCaptionsGibberishDetector initWithGibberishThreshold:windowLength:]";
      __int16 v24 = 1024;
      int v25 = 30;
      __int16 v26 = 2112;
      v27 = v11;
      __int16 v28 = 2048;
      v29 = v7;
      v17 = " [%s] %s:%d %@(%p) Failed to create gibberish states dictionary";
    }
    _os_log_error_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_ERROR, v17, buf, 0x30u);
    goto LABEL_24;
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCCaptionsGibberishDetector;
  [(VCCaptionsGibberishDetector *)&v3 dealloc];
}

- (BOOL)gibberishStateForCaptionsToken:(int64_t)a3
{
  objc_super v3 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_gibberishStates, "objectForKeyedSubscript:", [NSNumber numberWithInteger:a3]);

  return [v3 BOOLValue];
}

- (void)reset
{
  [(NSMutableDictionary *)self->_gibberishStates removeAllObjects];
  history = self->_history;

  [(NSMutableDictionary *)history removeAllObjects];
}

- (BOOL)processTranscript:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  BOOL v29 = -[VCCaptionsGibberishDetector gibberishStateForCaptionsToken:](self, "gibberishStateForCaptionsToken:", [a3 streamToken]);
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a3, "streamToken"));
  uint64_t v27 = [(NSMutableDictionary *)self->_history objectForKeyedSubscript:v5];
  if (!v27) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_history, "setObject:forKeyedSubscript:", [MEMORY[0x1E4F1CA48] array], v5);
  }
  v6 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_history, "objectForKeyedSubscript:", v5, v27);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v7 = (void *)[a3 segments];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v36 objects:v35 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v37 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        if ([v12 confidence]) {
          objc_msgSend(v6, "insertObject:atIndex:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v12, "confidence")), 0);
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v36 objects:v35 count:16];
    }
    while (v9);
  }
  while ([v6 count] > self->_windowLength)
    [v6 removeLastObject];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v13 = [v6 countByEnumeratingWithState:&v31 objects:v30 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v32;
    double v16 = 0.0;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v31 + 1) + 8 * j) doubleValue];
        double v16 = v16 + v18;
      }
      uint64_t v14 = [v6 countByEnumeratingWithState:&v31 objects:v30 count:16];
    }
    while (v14);
  }
  else
  {
    double v16 = 0.0;
  }
  unint64_t v19 = [v6 count];
  if (v19 <= 1) {
    unint64_t v20 = 1;
  }
  else {
    unint64_t v20 = v19;
  }
  double v21 = v16 / (double)v20 * 0.01;
  unint64_t v22 = [v6 count];
  BOOL v24 = v21 < self->_gibberishThreshold && v22 >= self->_windowLength;
  if (v28) {
    int v25 = v29 ^ v24;
  }
  else {
    int v25 = 1;
  }
  if (v25 == 1) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_gibberishStates, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:"), v5);
  }
  return v25;
}

- (void)initWithGibberishThreshold:(uint64_t)a1 windowLength:.cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 30;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to create gibberish states dictionary", (uint8_t *)&v2, 0x1Cu);
}

- (void)initWithGibberishThreshold:(uint64_t)a1 windowLength:.cold.2(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 32;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to create history dictionary", (uint8_t *)&v2, 0x1Cu);
}

@end