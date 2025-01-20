@interface VCImageAttributeRules
- (NSMutableDictionary)imageAttributeRules;
- (VCImageAttributeRules)init;
- (id)description;
- (id)extractDimensionsForInterface:(int)a3 direction:(int)a4;
- (void)addRuleForVideoPayload:(int)a3 withDirection:(int)a4 width:(int)a5 height:(int)a6 frameRate:(int)a7 priority:(int)a8 interface:(int)a9;
- (void)dealloc;
- (void)interfaceKey:(id *)a3 forInterface:(int)a4 directionKey:(id *)a5 forDirection:(int)a6;
- (void)setImageAttributeRules:(id)a3;
- (void)swapSendAndReceiveRules;
@end

@implementation VCImageAttributeRules

- (VCImageAttributeRules)init
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)VCImageAttributeRules;
  v2 = [(VCImageAttributeRules *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v3, @"send", v4, @"recv", 0);
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v5, @"send", v6, @"recv", 0);
    v2->_imageAttributeRules = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", v7, @"wifiRules", v8, @"cellRules", 0);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCImageAttributeRules;
  [(VCImageAttributeRules *)&v3 dealloc];
}

- (id)description
{
  v2 = [(VCImageAttributeRules *)self imageAttributeRules];

  return (id)[(NSMutableDictionary *)v2 description];
}

- (void)addRuleForVideoPayload:(int)a3 withDirection:(int)a4 width:(int)a5 height:(int)a6 frameRate:(int)a7 priority:(int)a8 interface:(int)a9
{
  v22[4] = *MEMORY[0x1E4F143B8];
  if (a5 && (v9 = *(void *)&a6, a6) && (uint64_t v10 = *(void *)&a7, a7) && a9)
  {
    uint64_t v11 = *(void *)&a8;
    uint64_t v12 = *(void *)&a4;
    uint64_t v13 = *(void *)&a3;
    v21[0] = @"width";
    v22[0] = [NSNumber numberWithInt:*(void *)&a5];
    v21[1] = @"height";
    v22[1] = [NSNumber numberWithInt:v9];
    v21[2] = @"frameRate";
    v22[2] = [NSNumber numberWithInt:v10];
    v21[3] = @"priority";
    v22[3] = [NSNumber numberWithInt:v11];
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:4];
    unint64_t v19 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v20 = 0xAAAAAAAAAAAAAAAALL;
    [(VCImageAttributeRules *)self interfaceKey:&v20 forInterface:a9 directionKey:&v19 forDirection:v12];
    v16 = [(VCImageAttributeRules *)self imageAttributeRules];
    v17 = (void *)[(NSMutableDictionary *)v16 objectForKeyedSubscript:v20];
    v18 = (void *)[v17 objectForKey:v19];
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v15, objc_msgSend(NSNumber, "numberWithInt:", v13));
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCImageAttributeRules addRuleForVideoPayload:withDirection:width:height:frameRate:priority:interface:]();
    }
  }
}

- (id)extractDimensionsForInterface:(int)a3 direction:(int)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v4 = *(void *)&a4;
    unint64_t v19 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v20 = 0xAAAAAAAAAAAAAAAALL;
    [(VCImageAttributeRules *)self interfaceKey:&v20 forInterface:*(void *)&a3 directionKey:&v19 forDirection:*(void *)&a4];
    uint64_t v7 = [(VCImageAttributeRules *)self imageAttributeRules];
    uint64_t v8 = (void *)[(NSMutableDictionary *)v7 objectForKeyedSubscript:v20];
    uint64_t v9 = (void *)[v8 objectForKey:v19];
    uint64_t v10 = [v9 count];
    if (a3 == 1 && !v10)
    {
      LODWORD(v18) = 1;
      [(VCImageAttributeRules *)self addRuleForVideoPayload:123 withDirection:v4 width:320 height:240 frameRate:15 priority:0 interface:v18];
      uint64_t v11 = [(VCImageAttributeRules *)self imageAttributeRules];
      uint64_t v12 = (void *)[(NSMutableDictionary *)v11 objectForKeyedSubscript:v20];
      uint64_t v9 = (void *)[v12 objectForKey:v19];
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        if (v9) {
          uint64_t v15 = (const char *)objc_msgSend((id)objc_msgSend(v9, "description"), "UTF8String");
        }
        else {
          uint64_t v15 = "<nil>";
        }
        if ([(VCImageAttributeRules *)self imageAttributeRules]) {
          v16 = (const char *)objc_msgSend((id)-[NSMutableDictionary description](-[VCImageAttributeRules imageAttributeRules](self, "imageAttributeRules"), "description"), "UTF8String");
        }
        else {
          v16 = "<nil>";
        }
        *(_DWORD *)buf = 136316674;
        uint64_t v22 = v13;
        __int16 v23 = 2080;
        v24 = "-[VCImageAttributeRules extractDimensionsForInterface:direction:]";
        __int16 v25 = 1024;
        int v26 = 107;
        __int16 v27 = 1024;
        int v28 = a3;
        __int16 v29 = 1024;
        int v30 = v4;
        __int16 v31 = 2080;
        v32 = v15;
        __int16 v33 = 2080;
        v34 = v16;
        _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCImageAttributeRules: extract dimensions for interface %d direction %d: %s, from %s", buf, 0x3Cu);
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCImageAttributeRules extractDimensionsForInterface:direction:]();
      }
    }
    return 0;
  }
  return v9;
}

- (void)swapSendAndReceiveRules
{
  v12[1] = *MEMORY[0x1E4F143B8];
  unint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
  v12[0] = 0xAAAAAAAAAAAAAAAALL;
  [(VCImageAttributeRules *)self interfaceKey:v12 forInterface:2 directionKey:0 forDirection:0];
  [(VCImageAttributeRules *)self interfaceKey:&v11 forInterface:1 directionKey:0 forDirection:0];
  objc_super v3 = [(VCImageAttributeRules *)self imageAttributeRules];
  uint64_t v4 = (void *)[(NSMutableDictionary *)v3 objectForKeyedSubscript:v12[0]];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"send"];
  id v6 = (id)[v4 objectForKeyedSubscript:@"recv"];
  [v4 setObject:v5 forKeyedSubscript:@"recv"];
  [v4 setObject:v6 forKeyedSubscript:@"send"];

  uint64_t v7 = [(VCImageAttributeRules *)self imageAttributeRules];
  uint64_t v8 = (void *)[(NSMutableDictionary *)v7 objectForKeyedSubscript:v11];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"send"];
  id v10 = (id)[v8 objectForKeyedSubscript:@"recv"];
  [v8 setObject:v9 forKeyedSubscript:@"recv"];
  [v8 setObject:v10 forKeyedSubscript:@"send"];
}

- (void)interfaceKey:(id *)a3 forInterface:(int)a4 directionKey:(id *)a5 forDirection:(int)a6
{
  if (a3)
  {
    id v6 = @"wifiRules";
    if (a4 != 2) {
      id v6 = 0;
    }
    if (a4 == 1) {
      id v6 = @"cellRules";
    }
    *a3 = v6;
  }
  if (a5)
  {
    uint64_t v7 = @"recv";
    if (a6 != 1) {
      uint64_t v7 = 0;
    }
    if (!a6) {
      uint64_t v7 = @"send";
    }
    *a5 = v7;
  }
}

- (NSMutableDictionary)imageAttributeRules
{
  return self->_imageAttributeRules;
}

- (void)setImageAttributeRules:(id)a3
{
}

- (void)addRuleForVideoPayload:withDirection:width:height:frameRate:priority:interface:.cold.1()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  objc_super v3 = "-[VCImageAttributeRules addRuleForVideoPayload:withDirection:width:height:frameRate:priority:interface:]";
  __int16 v4 = 1024;
  int v5 = 58;
  __int16 v6 = v0;
  uint64_t v7 = "-[VCImageAttributeRules addRuleForVideoPayload:withDirection:width:height:frameRate:priority:interface:]";
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d VCImageAttrbuteRules: %s received invalid arguments ", v2, 0x26u);
}

- (void)extractDimensionsForInterface:direction:.cold.1()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  objc_super v3 = "-[VCImageAttributeRules extractDimensionsForInterface:direction:]";
  __int16 v4 = 1024;
  int v5 = 80;
  __int16 v6 = v0;
  uint64_t v7 = "-[VCImageAttributeRules extractDimensionsForInterface:direction:]";
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d VCImageAttrbuteRules: %s received unknown wireless interface", v2, 0x26u);
}

@end