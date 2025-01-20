@interface VCVideoRuleCollections
+ (id)newCorrectedVideoRules:(id)a3 payload:(int)a4;
+ (id)newU1VideoRuleCollections;
+ (void)addRulesForU1ToCollection:(id)a3;
+ (void)newU1VideoRuleCollections;
- (BOOL)isDecodeSupported;
- (BOOL)isEncodeSupported;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPayloadSupported:(int)a3;
- (NSMutableArray)supportedPayloads;
- (NSMutableDictionary)rules;
- (NSSet)supportedTransportTypes;
- (VCVideoRuleCollections)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)filterRules:(id)a3 byBitrateRule:(id)a4;
- (id)getVideoRulesForTransport:(unsigned __int8)a3 payload:(int)a4 encodingType:(unsigned __int8)a5;
- (id)supportedVideoRulesForBitrate:(id)a3 transportType:(unsigned __int8)a4 payload:(int)a5 encodingType:(unsigned __int8)a6;
- (id)supportedVideoRulesSizesForBitrate:(id)a3 transportType:(unsigned __int8)a4 payload:(int)a5 encodingType:(unsigned __int8)a6;
- (id)supportedVideoRulesSyncForTransportType:(unsigned __int8)a3 payload:(int)a4 encodingType:(unsigned __int8)a5;
- (id)supportedVideoSizesForKey:(id)a3;
- (id)videoRulesCollectionsByRemovingPayload:(int)a3 andPayload:(int)a4 removeCellular:(BOOL)a5;
- (void)addSupportedPayload:(int)a3;
- (void)addVideoRules:(id)a3 transportType:(unsigned __int8)a4 payload:(int)a5 encodingType:(unsigned __int8)a6;
- (void)appendVideoRules:(id)a3 transportType:(unsigned __int8)a4 payload:(int)a5 encodingType:(unsigned __int8)a6;
- (void)dealloc;
- (void)init;
- (void)limitRulesFromVideoRules:(int)a3 frameHeight:(int)a4 videoRules:(id)a5;
- (void)limitVideoRulesToMaxWidth:(int)a3 maxHeight:(int)a4 transportType:(unsigned __int8)a5;
- (void)removeVideoRulesWithFrameRate:(int)a3 transportType:(unsigned __int8)a4;
- (void)removeVideoRulesWithWidth:(int)a3 height:(int)a4 transportType:(unsigned __int8)a5 encodingType:(unsigned __int8)a6;
- (void)setRules:(id)a3;
- (void)setSupportedPayloads:(id)a3;
@end

@implementation VCVideoRuleCollections

- (id)getVideoRulesForTransport:(unsigned __int8)a3 payload:(int)a4 encodingType:(unsigned __int8)a5
{
  v6 = [[VCVideoRuleCollectionKey alloc] initWithPayload:*(void *)&a4 transportType:a3 encodingType:a5];
  v7 = (void *)[(NSMutableDictionary *)self->_rules objectForKeyedSubscript:v6];

  v8 = (void *)[v7 copy];

  return v8;
}

- (VCVideoRuleCollections)init
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)VCVideoRuleCollections;
  v2 = [(VCVideoRuleCollections *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    v2->_rules = (NSMutableDictionary *)v3;
    if (v3)
    {
      uint64_t v4 = objc_opt_new();
      v2->_supportedPayloads = (NSMutableArray *)v4;
      if (v4) {
        return v2;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCVideoRuleCollections init]();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoRuleCollections init]();
      }
    }

    return 0;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCVideoRuleCollections;
  [(VCVideoRuleCollections *)&v3 dealloc];
}

- (id)filterRules:(id)a3 byBitrateRule:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    objc_super v6 = objc_opt_new();
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v7 = [a3 countByEnumeratingWithState:&v24 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(a3);
          }
          v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          if ([v11 compare:a4] <= 0) {
            [v6 addObject:v11];
          }
        }
        uint64_t v8 = [a3 countByEnumeratingWithState:&v24 objects:v23 count:16];
      }
      while (v8);
    }
    if ([v6 count] || !objc_msgSend(a3, "count")) {
      [v6 sortUsingSelector:sel_compare_];
    }
    else {
      [v6 addObject:a4];
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136315906;
        uint64_t v16 = v13;
        __int16 v17 = 2080;
        v18 = "-[VCVideoRuleCollections filterRules:byBitrateRule:]";
        __int16 v19 = 1024;
        int v20 = 122;
        __int16 v21 = 2080;
        uint64_t v22 = objc_msgSend((id)objc_msgSend(v6, "description"), "UTF8String");
        _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCVideoRuleCollections: Returning filtered video rules %s", (uint8_t *)&v15, 0x26u);
      }
    }
    return v6;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoRuleCollections filterRules:byBitrateRule:]();
      }
    }
    return 0;
  }
}

- (id)supportedVideoRulesSyncForTransportType:(unsigned __int8)a3 payload:(int)a4 encodingType:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = a3;
  objc_sync_enter(self);
  id v9 = [(VCVideoRuleCollections *)self getVideoRulesForTransport:v7 payload:v6 encodingType:v5];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v9];
  objc_sync_exit(self);

  return v10;
}

- (id)supportedVideoSizesForKey:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = (void *)[(NSMutableDictionary *)self->_rules objectForKeyedSubscript:a3];
  if ([v6 count])
  {
    uint64_t v7 = (void *)[v6 objectAtIndexedSubscript:0];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        uint64_t v11 = 0;
        v12 = v7;
        do
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v7 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
          int v13 = [v7 iWidth];
          if (v13 != [v12 iWidth]
            || (int v14 = [v7 iHeight], v14 != objc_msgSend(v12, "iHeight")))
          {
            [v5 addObject:v12];
          }
          ++v11;
          v12 = v7;
        }
        while (v9 != v11);
        uint64_t v9 = [v6 countByEnumeratingWithState:&v17 objects:v16 count:16];
      }
      while (v9);
    }
    [v5 addObject:v7];
  }
  return v5;
}

- (id)description
{
  v7[5] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  objc_msgSend(v3, "appendFormat:", @"VCVideoRuleCollections description: count = %lu.\n", -[NSMutableDictionary count](self->_rules, "count"));
  rules = self->_rules;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__VCVideoRuleCollections_description__block_invoke;
  v7[3] = &unk_1E6DB9D18;
  v7[4] = v3;
  [(NSMutableDictionary *)rules enumerateKeysAndObjectsUsingBlock:v7];
  id v5 = (id)[v3 copy];

  return v5;
}

uint64_t __37__VCVideoRuleCollections_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) appendFormat:@"  encodingType = %d, payload = %d, transportType = %d, rules = ", objc_msgSend(a2, "encodingType"), objc_msgSend(a2, "payload"), objc_msgSend(a2, "transportType")];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v16 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = *(void **)(a1 + 32);
        uint64_t v11 = [v9 iWidth];
        uint64_t v12 = [v9 iHeight];
        [v9 fRate];
        objc_msgSend(v10, "appendFormat:", @"%dx%d@%u ", v11, v12, v13);
      }
      uint64_t v6 = [a3 countByEnumeratingWithState:&v16 objects:v15 count:16];
    }
    while (v6);
  }
  return [*(id *)(a1 + 32) appendString:@"\n"];
}

- (id)supportedVideoRulesSizesForBitrate:(id)a3 transportType:(unsigned __int8)a4 payload:(int)a5 encodingType:(unsigned __int8)a6
{
  uint64_t v9 = [[VCVideoRuleCollectionKey alloc] initWithPayload:*(void *)&a5 transportType:a4 encodingType:a6];
  id v10 = [(VCVideoRuleCollections *)self supportedVideoSizesForKey:v9];

  if (a5 != 126 || !v10) {
    return v10;
  }

  return [(VCVideoRuleCollections *)self filterRules:v10 byBitrateRule:a3];
}

- (id)supportedVideoRulesForBitrate:(id)a3 transportType:(unsigned __int8)a4 payload:(int)a5 encodingType:(unsigned __int8)a6
{
  id v9 = [(VCVideoRuleCollections *)self supportedVideoRulesSyncForTransportType:a4 payload:*(void *)&a5 encodingType:a6];
  if (a5 == 126) {
    id v10 = [(VCVideoRuleCollections *)self filterRules:v9 byBitrateRule:a3];
  }
  else {
    id v10 = (id)[MEMORY[0x1E4F1CA48] arrayWithArray:v9];
  }
  uint64_t v11 = v10;
  [v10 sortUsingSelector:sel_compareByPref_];
  return v11;
}

- (NSSet)supportedTransportTypes
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  rules = self->_rules;
  uint64_t v5 = [(NSMutableDictionary *)rules countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(rules);
        }
        objc_msgSend(v3, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v8++), "transportType")));
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableDictionary *)rules countByEnumeratingWithState:&v11 objects:v10 count:16];
    }
    while (v6);
  }
  return (NSSet *)v3;
}

+ (id)newCorrectedVideoRules:(id)a3 payload:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[a3 firstObject];
  if ([a3 count]
    && [v5 iPayload] != v4
    && ((int v7 = [v5 iPayload], v4 == 126) && v7 == 123
     || (int v8 = [v5 iPayload], v4 == 123) && v8 == 126))
  {
    id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a3, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v10 = [a3 countByEnumeratingWithState:&v26 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(a3);
          }
          long long v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          uint64_t v15 = [VCVideoRule alloc];
          uint64_t v16 = [v14 iWidth];
          uint64_t v17 = [v14 iHeight];
          [v14 fRate];
          int v19 = v18;
          [v14 fPref];
          LODWORD(v21) = v20;
          LODWORD(v22) = v19;
          v23 = [(VCVideoRule *)v15 initWithFrameWidth:v16 frameHeight:v17 frameRate:v4 payload:v22 priority:v21];
          [v9 addObject:v23];
        }
        uint64_t v11 = [a3 countByEnumeratingWithState:&v26 objects:v25 count:16];
      }
      while (v11);
    }
    return v9;
  }
  else
  {
    return a3;
  }
}

- (void)addVideoRules:(id)a3 transportType:(unsigned __int8)a4 payload:(int)a5 encodingType:(unsigned __int8)a6
{
  if (a3)
  {
    uint64_t v6 = a6;
    uint64_t v7 = *(void *)&a5;
    uint64_t v8 = a4;
    id v10 = +[VCVideoRuleCollections newCorrectedVideoRules:a3 payload:*(void *)&a5];
    if (v10)
    {
      id v12 = v10;
      if ((-[NSMutableArray containsObject:](self->_supportedPayloads, "containsObject:", [NSNumber numberWithUnsignedInt:v7]) & 1) == 0)-[NSMutableArray addObject:](self->_supportedPayloads, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v7)); {
      uint64_t v11 = [[VCVideoRuleCollectionKey alloc] initWithPayload:v7 transportType:v8 encodingType:v6];
      }
      [v12 sortUsingSelector:sel_compare_];
      [(NSMutableDictionary *)self->_rules setObject:v12 forKeyedSubscript:v11];
    }
  }
}

- (void)appendVideoRules:(id)a3 transportType:(unsigned __int8)a4 payload:(int)a5 encodingType:(unsigned __int8)a6
{
  uint64_t v6 = a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = [[VCVideoRuleCollectionKey alloc] initWithPayload:*(void *)&a5 transportType:a4 encodingType:a6];
  id v12 = (void *)[(NSMutableDictionary *)self->_rules objectForKeyedSubscript:v11];

  if (v12)
  {
    id v13 = +[VCVideoRuleCollections newCorrectedVideoRules:a3 payload:v7];
    if (v13)
    {
      long long v14 = v13;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v20 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v22 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void *)(*((void *)&v21 + 1) + 8 * i);
            if (([v12 containsObject:v19] & 1) == 0) {
              [v12 addObject:v19];
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v20 count:16];
        }
        while (v16);
      }
      [v12 sortUsingSelector:sel_compare_];
    }
  }
  else
  {
    [(VCVideoRuleCollections *)self addVideoRules:a3 transportType:v8 payload:v7 encodingType:v6];
  }
}

- (void)removeVideoRulesWithWidth:(int)a3 height:(int)a4 transportType:(unsigned __int8)a5 encodingType:(unsigned __int8)a6
{
  unsigned int v20 = a5;
  unsigned int v21 = a6;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = self->_supportedPayloads;
  uint64_t v22 = [(NSMutableArray *)obj countByEnumeratingWithState:&v29 objects:v28 count:16];
  if (v22)
  {
    uint64_t v18 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(obj);
        }
        id v9 = -[VCVideoRuleCollectionKey initWithPayload:transportType:encodingType:]([VCVideoRuleCollectionKey alloc], "initWithPayload:transportType:encodingType:", [*(id *)(*((void *)&v29 + 1) + 8 * i) intValue], v20, v21);
        id v10 = (void *)[(NSMutableDictionary *)self->_rules objectForKeyedSubscript:v9];
        uint64_t v11 = objc_opt_new();
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v23 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v25;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v25 != v14) {
                objc_enumerationMutation(v10);
              }
              uint64_t v16 = *(void **)(*((void *)&v24 + 1) + 8 * j);
              if ([v16 iWidth] == a3 && objc_msgSend(v16, "iHeight") == a4) {
                [v11 addObject:v16];
              }
            }
            uint64_t v13 = [v10 countByEnumeratingWithState:&v24 objects:v23 count:16];
          }
          while (v13);
        }
        [v10 removeObjectsInArray:v11];
      }
      uint64_t v22 = [(NSMutableArray *)obj countByEnumeratingWithState:&v29 objects:v28 count:16];
    }
    while (v22);
  }
}

- (void)limitRulesFromVideoRules:(int)a3 frameHeight:(int)a4 videoRules:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = [a5 countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(a5);
        }
        uint64_t v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ((int)[v13 iWidth] > a3 || (int)objc_msgSend(v13, "iHeight") > a4) {
          [v8 addObject:v13];
        }
      }
      uint64_t v10 = [a5 countByEnumeratingWithState:&v15 objects:v14 count:16];
    }
    while (v10);
  }
  [a5 removeObjectsInArray:v8];
}

- (void)limitVideoRulesToMaxWidth:(int)a3 maxHeight:(int)a4 transportType:(unsigned __int8)a5
{
  unsigned int v21 = a5;
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v10 = "Cellular";
      uint64_t v28 = v8;
      __int16 v29 = 2080;
      long long v30 = "-[VCVideoRuleCollections limitVideoRulesToMaxWidth:maxHeight:transportType:]";
      __int16 v31 = 1024;
      if (v21 == 1) {
        uint64_t v10 = "WiFi";
      }
      int v32 = 314;
      __int16 v33 = 1024;
      int v34 = v6;
      __int16 v35 = 1024;
      int v36 = v5;
      __int16 v37 = 2080;
      v38 = v10;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d maxWidth=%d, maxHeight=%d, transportType=%s", buf, 0x32u);
    }
  }
  if ([&unk_1F3DC89B8 count])
  {
    unint64_t v11 = 0;
    int v12 = 0;
    do
    {
      int v20 = v12;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      supportedPayloads = self->_supportedPayloads;
      uint64_t v14 = [(NSMutableArray *)supportedPayloads countByEnumeratingWithState:&v23 objects:v22 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v24 != v16) {
              objc_enumerationMutation(supportedPayloads);
            }
            long long v18 = -[VCVideoRuleCollectionKey initWithPayload:transportType:encodingType:]([VCVideoRuleCollectionKey alloc], "initWithPayload:transportType:encodingType:", [*(id *)(*((void *)&v23 + 1) + 8 * i) intValue], v21, objc_msgSend((id)objc_msgSend(&unk_1F3DC89B8, "objectAtIndexedSubscript:", v11), "intValue"));
            [(VCVideoRuleCollections *)self limitRulesFromVideoRules:v6 frameHeight:v5 videoRules:[(NSMutableDictionary *)self->_rules objectForKeyedSubscript:v18]];
          }
          uint64_t v15 = [(NSMutableArray *)supportedPayloads countByEnumeratingWithState:&v23 objects:v22 count:16];
        }
        while (v15);
      }
      unint64_t v11 = (v20 + 1);
      unint64_t v19 = [&unk_1F3DC89B8 count];
      int v12 = v20 + 1;
    }
    while (v19 > v11);
  }
}

- (void)removeVideoRulesWithFrameRate:(int)a3 transportType:(unsigned __int8)a4
{
  unsigned int v32 = a4;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  obuint64_t j = self->_supportedPayloads;
  uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v51 objects:v50 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v31 = *(void *)v52;
    uint64_t v8 = "Cellular";
    if (v32 == 1) {
      uint64_t v8 = "WiFi";
    }
    uint64_t v28 = v8;
    *(void *)&long long v6 = 136316418;
    long long v27 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v52 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = -[VCVideoRuleCollectionKey initWithPayload:transportType:encodingType:]([VCVideoRuleCollectionKey alloc], "initWithPayload:transportType:encodingType:", [*(id *)(*((void *)&v51 + 1) + 8 * i) intValue], v32, 1);
        unint64_t v11 = objc_opt_new();
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        int v12 = (void *)[(NSMutableDictionary *)self->_rules objectForKeyedSubscript:v10];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v46 objects:v45 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v47;
          do
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v47 != v15) {
                objc_enumerationMutation(v12);
              }
              long long v17 = *(void **)(*((void *)&v46 + 1) + 8 * j);
              objc_msgSend(v17, "fRate", v27);
              if (v18 == (float)a3) {
                [v11 addObject:v17];
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v46 objects:v45 count:16];
          }
          while (v14);
        }
        if (objc_msgSend(v11, "count", v27))
        {
          if ((VCVideoRuleCollections *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v25 = VRTraceErrorLogLevelToCSTR();
              long long v26 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v27;
                uint64_t v34 = v25;
                __int16 v35 = 2080;
                int v36 = "-[VCVideoRuleCollections removeVideoRulesWithFrameRate:transportType:]";
                __int16 v37 = 1024;
                int v38 = 335;
                __int16 v39 = 1024;
                *(_DWORD *)v40 = a3;
                *(_WORD *)&v40[4] = 2080;
                *(void *)&v40[6] = v28;
                *(_WORD *)&v40[14] = 2112;
                *(void *)&v40[16] = v11;
                uint64_t v22 = v26;
                long long v23 = " [%s] %s:%d frameRate=%d,  transportType=%s, rulesToRemove=%@";
                uint32_t v24 = 54;
                goto LABEL_27;
              }
            }
          }
          else
          {
            unint64_t v19 = &stru_1F3D3E450;
            if (objc_opt_respondsToSelector()) {
              unint64_t v19 = (__CFString *)[(VCVideoRuleCollections *)self performSelector:sel_logPrefix];
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v20 = VRTraceErrorLogLevelToCSTR();
              unsigned int v21 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136316930;
                uint64_t v34 = v20;
                __int16 v35 = 2080;
                int v36 = "-[VCVideoRuleCollections removeVideoRulesWithFrameRate:transportType:]";
                __int16 v37 = 1024;
                int v38 = 335;
                __int16 v39 = 2112;
                *(void *)v40 = v19;
                *(_WORD *)&v40[8] = 2048;
                *(void *)&v40[10] = self;
                *(_WORD *)&v40[18] = 1024;
                *(_DWORD *)&v40[20] = a3;
                __int16 v41 = 2080;
                v42 = v28;
                __int16 v43 = 2112;
                v44 = v11;
                uint64_t v22 = v21;
                long long v23 = " [%s] %s:%d %@(%p) frameRate=%d,  transportType=%s, rulesToRemove=%@";
                uint32_t v24 = 74;
LABEL_27:
                _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, v23, buf, v24);
              }
            }
          }
        }
        objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_rules, "objectForKeyedSubscript:", v10), "removeObjectsInArray:", v11);
      }
      uint64_t v7 = [(NSMutableArray *)obj countByEnumeratingWithState:&v51 objects:v50 count:16];
    }
    while (v7);
  }
}

- (void)addSupportedPayload:(int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  [(NSMutableArray *)self->_supportedPayloads addObject:v4];
}

- (BOOL)isPayloadSupported:(int)a3
{
  id v4 = (void *)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  LOBYTE(self) = [(NSMutableArray *)self->_supportedPayloads containsObject:v4];

  return (char)self;
}

+ (void)addRulesForU1ToCollection:(id)a3
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    int v4 = VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      +[VCVideoRuleCollections addRulesForU1ToCollection:](v4, (Class)a1);
    }
  }
}

+ (id)newU1VideoRuleCollections
{
  id v3 = objc_alloc_init((Class)a1);
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      int v5 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCVideoRuleCollections newU1VideoRuleCollections];
      }
    }
    goto LABEL_10;
  }
  [a1 addRulesForU1ToCollection:v3];
  if (!objc_msgSend((id)objc_msgSend(v3, "rules"), "count"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      int v6 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCVideoRuleCollections newU1VideoRuleCollections];
      }
    }
LABEL_10:

    return 0;
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = [(NSMutableArray *)self->_supportedPayloads count];
  if (v5 != objc_msgSend((id)objc_msgSend(a3, "supportedPayloads"), "count")) {
    return 0;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  supportedPayloads = self->_supportedPayloads;
  uint64_t v7 = [(NSMutableArray *)supportedPayloads countByEnumeratingWithState:&v19 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v20;
LABEL_5:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v20 != v8) {
        objc_enumerationMutation(supportedPayloads);
      }
      if (!objc_msgSend((id)objc_msgSend(a3, "supportedPayloads"), "containsObject:", *(void *)(*((void *)&v19 + 1) + 8 * v9)))return 0; {
      if (v7 == ++v9)
      }
      {
        uint64_t v7 = [(NSMutableArray *)supportedPayloads countByEnumeratingWithState:&v19 objects:v18 count:16];
        if (v7) {
          goto LABEL_5;
        }
        break;
      }
    }
  }
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 1;
  rules = self->_rules;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __34__VCVideoRuleCollections_isEqual___block_invoke;
  v13[3] = &unk_1E6DB9D40;
  v13[4] = a3;
  v13[5] = &v14;
  [(NSMutableDictionary *)rules enumerateKeysAndObjectsUsingBlock:v13];
  BOOL v11 = *((unsigned char *)v15 + 24) != 0;
  _Block_object_dispose(&v14, 8);
  return v11;
}

void *__34__VCVideoRuleCollections_isEqual___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "rules"), "objectForKeyedSubscript:", a2);
  if (result)
  {
    uint64_t v8 = result;
    uint64_t v9 = [result count];
    result = (void *)[a3 count];
    if ((void *)v9 == result)
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      result = (void *)[a3 countByEnumeratingWithState:&v14 objects:v13 count:16];
      if (!result) {
        return result;
      }
      uint64_t v10 = result;
      uint64_t v11 = *(void *)v15;
LABEL_5:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(a3);
        }
        result = (void *)[v8 containsObject:*(void *)(*((void *)&v14 + 1) + 8 * v12)];
        if (!result) {
          break;
        }
        if (v10 == (void *)++v12)
        {
          result = (void *)[a3 countByEnumeratingWithState:&v14 objects:v13 count:16];
          uint64_t v10 = result;
          if (result) {
            goto LABEL_5;
          }
          return result;
        }
      }
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  *a4 = 1;
  return result;
}

- (BOOL)isEncodeSupported
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  rules = self->_rules;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__VCVideoRuleCollections_isEncodeSupported__block_invoke;
  v5[3] = &unk_1E6DB9D68;
  v5[4] = &v6;
  [(NSMutableDictionary *)rules enumerateKeysAndObjectsUsingBlock:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__VCVideoRuleCollections_isEncodeSupported__block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a2 encodingType];
  if (result == 1)
  {
    uint64_t result = [a3 count];
    if (result)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
  return result;
}

- (BOOL)isDecodeSupported
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  rules = self->_rules;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__VCVideoRuleCollections_isDecodeSupported__block_invoke;
  v5[3] = &unk_1E6DB9D68;
  v5[4] = &v6;
  [(NSMutableDictionary *)rules enumerateKeysAndObjectsUsingBlock:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__VCVideoRuleCollections_isDecodeSupported__block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a2 encodingType];
  if (result == 2)
  {
    uint64_t result = [a3 count];
    if (result)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
  return result;
}

- (id)videoRulesCollectionsByRemovingPayload:(int)a3 andPayload:(int)a4 removeCellular:(BOOL)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = objc_alloc_init(VCVideoRuleCollections);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = [(VCVideoRuleCollections *)self supportedPayloads];
  uint64_t v9 = [(NSMutableArray *)obj countByEnumeratingWithState:&v20 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = [*(id *)(*((void *)&v20 + 1) + 8 * i) unsignedIntValue];
        if (v13 != a3 && v13 != a4)
        {
          uint64_t v15 = v13;
          [(VCVideoRuleCollections *)v8 addSupportedPayload:v13];
          -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](v8, "addVideoRules:transportType:payload:encodingType:", objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:", -[VCVideoRuleCollections getVideoRulesForTransport:payload:encodingType:](self, "getVideoRulesForTransport:payload:encodingType:", 1, v15, 1)), 1, v15, 1);
          -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](v8, "addVideoRules:transportType:payload:encodingType:", objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:", -[VCVideoRuleCollections getVideoRulesForTransport:payload:encodingType:](self, "getVideoRulesForTransport:payload:encodingType:", 1, v15, 2)), 1, v15, 2);
          if (!a5)
          {
            -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](v8, "addVideoRules:transportType:payload:encodingType:", objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:", -[VCVideoRuleCollections getVideoRulesForTransport:payload:encodingType:](self, "getVideoRulesForTransport:payload:encodingType:", 2, v15, 1)), 2, v15, 1);
            -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](v8, "addVideoRules:transportType:payload:encodingType:", objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:", -[VCVideoRuleCollections getVideoRulesForTransport:payload:encodingType:](self, "getVideoRulesForTransport:payload:encodingType:", 2, v15, 2)), 2, v15, 2);
          }
        }
      }
      uint64_t v10 = [(NSMutableArray *)obj countByEnumeratingWithState:&v20 objects:v19 count:16];
    }
    while (v10);
  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = (void *)[(NSMutableArray *)self->_supportedPayloads mutableCopyWithZone:a3];
  [v5 setSupportedPayloads:v6];

  uint64_t v7 = (void *)[(NSMutableDictionary *)self->_rules mutableCopyWithZone:a3];
  [v5 setRules:v7];

  return v5;
}

- (NSMutableArray)supportedPayloads
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSupportedPayloads:(id)a3
{
}

- (NSMutableDictionary)rules
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRules:(id)a3
{
}

- (void)init
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCVideoRules: Failed to create supported payload array", v2, v3, v4, v5, v6);
}

- (void)filterRules:byBitrateRule:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCVideoRuleCollections: invalid bitrate rule", v2, v3, v4, v5, v6);
}

+ (void)addRulesForU1ToCollection:(int)a1 .cold.1(int a1, Class cls)
{
  class_getName(cls);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v2, v3, " [%s] %s:%d Class=%s does NOT override this method.", v4, v5, v6, v7, v8);
}

+ (void)newU1VideoRuleCollections
{
  class_getName(cls);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v2, v3, " [%s] %s:%d Skipping negotiating settings, as the local device does not support U+1 stream given by class=%s", v4, v5, v6, v7, v8);
}

@end