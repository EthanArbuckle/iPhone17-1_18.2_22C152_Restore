@interface GKAutoPeerIDTable
- (id)objectForKey:(unsigned int)a3;
- (void)setObject:(id)a3 forKey:(unsigned int)a4;
@end

@implementation GKAutoPeerIDTable

- (id)objectForKey:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v11.receiver = self;
  v11.super_class = (Class)GKAutoPeerIDTable;
  id v5 = -[GKTable objectForKey:](&v11, sel_objectForKey_);
  if (v5)
  {
    id v6 = v5;
    return v6;
  }
  uint64_t v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"%d", v3);
  if (v7)
  {
    v8 = (void *)v7;
    v10.receiver = self;
    v10.super_class = (Class)GKAutoPeerIDTable;
    [(GKTable *)&v10 setObject:v7 forKey:v3];
    id v6 = v8;
    return v6;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
      -[GKAutoPeerIDTable objectForKey:]();
    }
  }
  return @"0";
}

- (void)setObject:(id)a3 forKey:(unsigned int)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136316162;
      uint64_t v9 = v6;
      __int16 v10 = 2080;
      objc_super v11 = "-[GKAutoPeerIDTable setObject:forKey:]";
      __int16 v12 = 1024;
      int v13 = 631;
      __int16 v14 = 2112;
      id v15 = a3;
      __int16 v16 = 1024;
      unsigned int v17 = a4;
      _os_log_impl(&dword_221563000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKAutoPeerIDTable setObject:[%@] forKey:[%d] ignored", (uint8_t *)&v8, 0x2Cu);
    }
  }
}

- (void)objectForKey:.cold.1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d GKAutoPeerIDTable: CANNOT CREATE NSSTRING?", v2, v3, v4, v5, v6);
}

@end