@interface DTKTraceTapTriggerConfig
+ (id)deviceSignPostConfig;
- (BOOL)hasThreadStateFilter;
- (BOOL)isAllProcesses;
- (DTKPKDebugCodeSet)kdebugFilter;
- (DTKTraceTapTriggerConfig)init;
- (DTKTraceTapTriggerConfig)initWithPlist:(id)a3;
- (DTKTraceTapTriggerConfig)initWithUUIDString:(id)a3;
- (NSArray)pmiDeviceIndices;
- (NSString)pmiCounterName;
- (NSString)pmiEventMnemonic;
- (NSString)uuid;
- (id)_GetTriggerDict;
- (id)plist;
- (int)kind;
- (unint64_t)callstackFrameDepth;
- (unint64_t)eventLimitHint;
- (unint64_t)pmiEventThreshold;
- (unint64_t)sampleInterval;
- (void)_SetTriggerDict:(id)a3;
- (void)addAction:(int)a3;
- (void)enumerateActions:(id)a3;
- (void)enumeratePIDsInFilter:(id)a3;
- (void)enumerateThreadStatesToInclude:(id)a3;
- (void)includePID:(int)a3;
- (void)includeThreadState:(unsigned int)a3;
- (void)setCallstackFrameDepth:(unint64_t)a3;
- (void)setEventLimitHint:(unint64_t)a3;
- (void)setHasThreadStateFilter:(BOOL)a3;
- (void)setIsAllProcesses:(BOOL)a3;
- (void)setKdebugFilter:(id)a3;
- (void)setKind:(int)a3;
- (void)setPmiCounterName:(id)a3;
- (void)setPmiDeviceIndices:(id)a3;
- (void)setPmiEventMnemonic:(id)a3;
- (void)setPmiEventThreshold:(unint64_t)a3;
- (void)setSampleInterval:(unint64_t)a3;
- (void)setUuid:(id)a3;
@end

@implementation DTKTraceTapTriggerConfig

+ (id)deviceSignPostConfig
{
  v2 = [[DTKTraceTapTriggerConfig alloc] initWithUUIDString:@"56594D66-845C-4205-B7D1-A8D7CF32362D"];
  [(DTKTraceTapTriggerConfig *)v2 setKind:3];
  v3 = objc_opt_new();
  [v3 addClass:33 subclassID:10];
  [(DTKTraceTapTriggerConfig *)v2 setKdebugFilter:v3];
  [(DTKTraceTapTriggerConfig *)v2 addAction:3];
  [(DTKTraceTapTriggerConfig *)v2 addAction:0];
  [(DTKTraceTapTriggerConfig *)v2 addAction:2];

  return v2;
}

- (DTKTraceTapTriggerConfig)init
{
  v8.receiver = self;
  v8.super_class = (Class)DTKTraceTapTriggerConfig;
  v2 = [(DTKTraceTapTriggerConfig *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    dict = v2->_dict;
    v2->_dict = (NSMutableDictionary *)v3;

    CFUUIDRef v5 = CFUUIDCreate(0);
    v6 = (__CFString *)CFUUIDCreateString(0, v5);
    CFRelease(v5);
    [(NSMutableDictionary *)v2->_dict setObject:v6 forKeyedSubscript:@"uuid"];
  }
  return v2;
}

- (DTKTraceTapTriggerConfig)initWithPlist:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DTKTraceTapTriggerConfig;
  CFUUIDRef v5 = [(DTKTraceTapTriggerConfig *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    dict = v5->_dict;
    v5->_dict = (NSMutableDictionary *)v6;
  }
  return v5;
}

- (DTKTraceTapTriggerConfig)initWithUUIDString:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DTKTraceTapTriggerConfig;
  CFUUIDRef v5 = [(DTKTraceTapTriggerConfig *)&v9 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    dict = v5->_dict;
    v5->_dict = (NSMutableDictionary *)v6;

    [(NSMutableDictionary *)v5->_dict setObject:v4 forKeyedSubscript:@"uuid"];
  }

  return v5;
}

- (int)kind
{
  v2 = [(NSMutableDictionary *)self->_dict objectForKeyedSubscript:@"tk"];
  int v3 = [v2 intValue];
  if ((v3 - 1) >= 3) {
    int v4 = 0;
  }
  else {
    int v4 = v3;
  }

  return v4;
}

- (void)setKind:(int)a3
{
  id v4 = [NSNumber numberWithInt:*(void *)&a3];
  [(NSMutableDictionary *)self->_dict setObject:v4 forKeyedSubscript:@"tk"];
}

- (unint64_t)sampleInterval
{
  v2 = [(NSMutableDictionary *)self->_dict objectForKeyedSubscript:@"si"];
  int v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 unsignedLongLongValue];
  }
  else {
    unint64_t v4 = 1000000;
  }

  return v4;
}

- (void)setSampleInterval:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)self->_dict setObject:v4 forKeyedSubscript:@"si"];
}

- (unint64_t)eventLimitHint
{
  v2 = [(NSMutableDictionary *)self->_dict objectForKeyedSubscript:@"elh"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)setEventLimitHint:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableDictionary *)self->_dict setObject:v4 forKeyedSubscript:@"elh"];
}

- (BOOL)hasThreadStateFilter
{
  v2 = [(NSMutableDictionary *)self->_dict objectForKey:@"tsf"];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setHasThreadStateFilter:(BOOL)a3
{
  dict = self->_dict;
  if (a3)
  {
    CFUUIDRef v5 = [(NSMutableDictionary *)dict objectForKeyedSubscript:@"tsf"];

    if (!v5)
    {
      id v6 = [MEMORY[0x263EFF980] array];
      [(NSMutableDictionary *)self->_dict setObject:v6 forKeyedSubscript:@"tsf"];
    }
  }
  else
  {
    [(NSMutableDictionary *)dict removeObjectForKey:@"tsf"];
  }
}

- (void)includeThreadState:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(DTKTraceTapTriggerConfig *)self setHasThreadStateFilter:1];
  id v8 = [(NSMutableDictionary *)self->_dict objectForKey:@"tsf"];
  if (!v8)
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"DTKTraceTapTriggerConfig.m" lineNumber:146 description:@"self.hasThreadStateFilter = YES is supposed to create an entry in the dictionary"];
  }
  id v6 = (void *)[objc_alloc(NSNumber) initWithInt:v3];
  if (([v8 containsObject:v6] & 1) == 0) {
    [v8 addObject:v6];
  }
}

- (void)enumerateThreadStatesToInclude:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, uint64_t))a3;
  CFUUIDRef v5 = [(NSMutableDictionary *)self->_dict objectForKey:@"tsf"];
  id v6 = v5;
  if (v5)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          v4[2](v4, [*(id *)(*((void *)&v11 + 1) + 8 * i) intValue]);
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
  else
  {
    v4[2](v4, 1);
    v4[2](v4, 0x400000);
  }
}

- (BOOL)isAllProcesses
{
  v2 = [(NSMutableDictionary *)self->_dict objectForKeyedSubscript:@"pf"];
  BOOL v3 = v2 == 0;

  return v3;
}

- (void)setIsAllProcesses:(BOOL)a3
{
  dict = self->_dict;
  if (a3)
  {
    [(NSMutableDictionary *)dict removeObjectForKey:@"pf"];
  }
  else
  {
    CFUUIDRef v5 = [(NSMutableDictionary *)dict objectForKeyedSubscript:@"pf"];

    if (!v5)
    {
      id v6 = [MEMORY[0x263EFF980] array];
      [(NSMutableDictionary *)self->_dict setObject:v6 forKeyedSubscript:@"pf"];
    }
  }
}

- (void)includePID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(DTKTraceTapTriggerConfig *)self setIsAllProcesses:0];
  id v8 = [(NSMutableDictionary *)self->_dict objectForKeyedSubscript:@"pf"];
  if (!v8)
  {
    uint64_t v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"DTKTraceTapTriggerConfig.m" lineNumber:188 description:@"self.isAllProcesses = NO is supposed to create an entry in the dictionary"];
  }
  id v6 = (void *)[objc_alloc(NSNumber) initWithInt:v3];
  if (([v8 containsObject:v6] & 1) == 0) {
    [v8 addObject:v6];
  }
}

- (void)enumeratePIDsInFilter:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, uint64_t))a3;
  CFUUIDRef v5 = [(NSMutableDictionary *)self->_dict objectForKeyedSubscript:@"pf"];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, [*(id *)(*((void *)&v10 + 1) + 8 * v9++) intValue]);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)addAction:(int)a3
{
  v16[2] = *MEMORY[0x263EF8340];
  switch(a3)
  {
    case 0:
    case 2:
    case 3:
      id v4 = (void *)MEMORY[0x263EFF8C0];
      [NSNumber numberWithInt:];
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v6 = [v4 arrayWithObjects:v5];
      goto LABEL_7;
    case 1:
      id v5 = [NSNumber numberWithInt:1];
      v15[0] = v5;
      id v7 = [NSNumber numberWithInt:v17];
      v15[1] = v7;
      uint64_t v8 = [NSNumber numberWithInt:v18];
      v15[2] = v8;
      uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:3];
      goto LABEL_5;
    case 4:
      uint64_t v9 = NSNumber;
      id v7 = v18;
      id v5 = v17;
      uint64_t v8 = [v9 numberWithInt:4];
      v14[0] = v8;
      v14[1] = v5;
      v14[2] = v7;
      long long v10 = [NSNumber numberWithUnsignedInt:v19];
      v14[3] = v10;
      uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:4];

LABEL_5:
      goto LABEL_7;
    case 5:
      long long v11 = NSNumber;
      id v5 = v17;
      long long v12 = [v11 numberWithInt:5];
      v16[0] = v12;
      v16[1] = v5;
      uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];

LABEL_7:
      if (v6)
      {
        long long v13 = [(NSMutableDictionary *)self->_dict objectForKey:@"ta"];
        if (!v13)
        {
          long long v13 = objc_opt_new();
          [(NSMutableDictionary *)self->_dict setObject:v13 forKey:@"ta"];
        }
        [v13 addObject:v6];
      }
      break;
    case 6:
      NSLog(&cfstr_DtktActionMaxN.isa, a2);
      break;
    default:
      return;
  }
}

- (void)enumerateActions:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, uint64_t))a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = [(NSMutableDictionary *)self->_dict objectForKey:@"ta"];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v11 = [v10 count];
        if (v11)
        {
          unint64_t v12 = v11;
          long long v13 = [v10 objectAtIndex:0];
          uint64_t v14 = [v13 intValue];
          switch((int)v14)
          {
            case 0:
            case 2:
            case 3:
              v4[2](v4, v14);
              break;
            case 1:
              if (v12 >= 3)
              {
                uint64_t v15 = [v10 objectAtIndex:1];
                [v15 intValue];
                uint64_t v16 = [v10 objectAtIndex:2];
                [v16 intValue];
                v4[2](v4, 1);

                goto LABEL_13;
              }
              break;
            case 4:
              if (v12 >= 4)
              {
                uint64_t v15 = [v10 objectAtIndex:1];
                v17 = [v10 objectAtIndex:2];
                v18 = [v10 objectAtIndex:3];
                [v18 unsignedIntValue];
                v4[2](v4, 4);

LABEL_13:
              }
              break;
            case 5:
              if (v12 >= 2)
              {
                unsigned int v19 = [v10 objectAtIndex:1];
                v4[2](v4, 5);
              }
              break;
            default:
              break;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }
}

- (NSString)pmiCounterName
{
  return (NSString *)[(NSMutableDictionary *)self->_dict objectForKeyedSubscript:@"pmicn"];
}

- (void)setPmiCounterName:(id)a3
{
}

- (NSString)pmiEventMnemonic
{
  return (NSString *)[(NSMutableDictionary *)self->_dict objectForKeyedSubscript:@"pmiem"];
}

- (void)setPmiEventMnemonic:(id)a3
{
}

- (unint64_t)pmiEventThreshold
{
  v2 = [(NSMutableDictionary *)self->_dict objectForKeyedSubscript:@"pmiet"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)setPmiEventThreshold:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableDictionary *)self->_dict setObject:v4 forKeyedSubscript:@"pmiet"];
}

- (NSArray)pmiDeviceIndices
{
  return (NSArray *)[(NSMutableDictionary *)self->_dict objectForKeyedSubscript:@"pmidi"];
}

- (void)setPmiDeviceIndices:(id)a3
{
}

- (NSString)uuid
{
  return (NSString *)[(NSMutableDictionary *)self->_dict objectForKeyedSubscript:@"uuid"];
}

- (void)setUuid:(id)a3
{
}

- (void)setKdebugFilter:(id)a3
{
  id v4 = (DTKPKDebugCodeSet *)a3;
  id v7 = [(DTKPKDebugCodeSet *)v4 legacyXML];
  if (v7)
  {
    [(NSMutableDictionary *)self->_dict setObject:v7 forKeyedSubscript:@"kdf"];
    id v5 = [(DTKPKDebugCodeSet *)v4 kdebugCodes];
    [(NSMutableDictionary *)self->_dict setObject:v5 forKeyedSubscript:@"kdf2"];
  }
  kdebugFilterSet = self->_kdebugFilterSet;
  self->_kdebugFilterSet = v4;
}

- (DTKPKDebugCodeSet)kdebugFilter
{
  kdebugFilterSet = self->_kdebugFilterSet;
  if (!kdebugFilterSet)
  {
    id v4 = [(NSMutableDictionary *)self->_dict objectForKeyedSubscript:@"kdf2"];
    if (v4)
    {
      id v5 = [[DTKPKDebugCodeSet alloc] initWithCodes:v4];
      uint64_t v6 = self->_kdebugFilterSet;
      self->_kdebugFilterSet = v5;
    }
    kdebugFilterSet = self->_kdebugFilterSet;
  }
  return kdebugFilterSet;
}

- (unint64_t)callstackFrameDepth
{
  v2 = [(NSMutableDictionary *)self->_dict objectForKeyedSubscript:@"csd"];
  unint64_t v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 unsignedIntegerValue];
  }
  else {
    unint64_t v4 = 128;
  }

  return v4;
}

- (void)setCallstackFrameDepth:(unint64_t)a3
{
  if (a3)
  {
    [NSNumber numberWithUnsignedInteger:];
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [(NSMutableDictionary *)self->_dict setObject:v5 forKeyedSubscript:@"csd"];
  }
  else
  {
    dict = self->_dict;
    [(NSMutableDictionary *)dict removeObjectForKey:@"csd"];
  }
}

- (id)plist
{
  return self->_dict;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kdebugFilterSet, 0);
  objc_storeStrong((id *)&self->_dict, 0);
}

- (id)_GetTriggerDict
{
  return self->_dict;
}

- (void)_SetTriggerDict:(id)a3
{
}

@end