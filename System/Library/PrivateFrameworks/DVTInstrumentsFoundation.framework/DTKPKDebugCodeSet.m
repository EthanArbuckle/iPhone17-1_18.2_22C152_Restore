@interface DTKPKDebugCodeSet
+ (void)releaseFilterMask:(char *)a3;
+ (void)releaseKperfFilter:(kperf_kdebug_filter *)a3;
- (BOOL)containsClass:(unsigned int)a3;
- (BOOL)containsClass:(unsigned int)a3 subclassID:(unsigned int)a4;
- (DTKPKDebugCodeSet)init;
- (DTKPKDebugCodeSet)initWithCodes:(id)a3;
- (DTKPKDebugCodeSet)initWithLegacyCodes:(id)a3;
- (NSMutableSet)kdebugCodes;
- (char)createFilterMask:(BOOL)a3;
- (id)description;
- (id)legacyXML;
- (kperf_kdebug_filter)createKperfFilter;
- (void)addClass:(unsigned int)a3;
- (void)addClass:(unsigned int)a3 subclassID:(unsigned int)a4;
- (void)addClass:(unsigned int)a3 subclassID:(unsigned int)a4 code:(unsigned int)a5;
- (void)addCodeSet:(id)a3;
- (void)addCodes:(id)a3;
- (void)convertLegacyCodes;
@end

@implementation DTKPKDebugCodeSet

- (DTKPKDebugCodeSet)init
{
  v6.receiver = self;
  v6.super_class = (Class)DTKPKDebugCodeSet;
  v2 = [(DTKPKDebugCodeSet *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    kdebugCodes = v2->_kdebugCodes;
    v2->_kdebugCodes = (NSMutableSet *)v3;
  }
  return v2;
}

- (DTKPKDebugCodeSet)initWithCodes:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DTKPKDebugCodeSet;
  v5 = [(DTKPKDebugCodeSet *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    kdebugCodes = v5->_kdebugCodes;
    v5->_kdebugCodes = (NSMutableSet *)v6;
  }
  return v5;
}

- (DTKPKDebugCodeSet)initWithLegacyCodes:(id)a3
{
  uint64_t v3 = [(DTKPKDebugCodeSet *)self initWithCodes:a3];
  id v4 = v3;
  if (v3) {
    [(DTKPKDebugCodeSet *)v3 convertLegacyCodes];
  }
  return v4;
}

- (void)convertLegacyCodes
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_23090199C;
  objc_super v9 = sub_2309019AC;
  id v10 = [MEMORY[0x263EFF9C0] set];
  kdebugCodes = self->_kdebugCodes;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_2309019B4;
  v4[3] = &unk_264B8DCE8;
  v4[4] = &v5;
  [(NSMutableSet *)kdebugCodes enumerateObjectsUsingBlock:v4];
  objc_storeStrong((id *)&self->_kdebugCodes, (id)v6[5]);
  _Block_object_dispose(&v5, 8);
}

- (id)description
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:@"KDebugCodeSet:"];
  kdebugCodes = self->_kdebugCodes;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_230901AE4;
  v7[3] = &unk_264B90240;
  id v5 = v3;
  id v8 = v5;
  [(NSMutableSet *)kdebugCodes enumerateObjectsUsingBlock:v7];

  return v5;
}

- (void)addCodeSet:(id)a3
{
  id v4 = [a3 kdebugCodes];
  [(DTKPKDebugCodeSet *)self addCodes:v4];
}

- (void)addCodes:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = sub_230901CC8;
  v3[3] = &unk_264B90240;
  v3[4] = self;
  [a3 enumerateObjectsUsingBlock:v3];
}

- (void)addClass:(unsigned int)a3
{
  kdebugCodes = self->_kdebugCodes;
  id v4 = [NSNumber numberWithUnsignedInt:(a3 << 24) | 0xFFFFFC];
  [(NSMutableSet *)kdebugCodes addObject:v4];
}

- (void)addClass:(unsigned int)a3 subclassID:(unsigned int)a4
{
  kdebugCodes = self->_kdebugCodes;
  id v5 = [NSNumber numberWithUnsignedInt:(a3 << 24) | (a4 << 16) | 0xFFFC];
  [(NSMutableSet *)kdebugCodes addObject:v5];
}

- (void)addClass:(unsigned int)a3 subclassID:(unsigned int)a4 code:(unsigned int)a5
{
  kdebugCodes = self->_kdebugCodes;
  id v6 = [NSNumber numberWithUnsignedInt:(a3 << 24) | (a4 << 16) | (4 * (a5 & 0x3FFF))];
  [(NSMutableSet *)kdebugCodes addObject:v6];
}

- (BOOL)containsClass:(unsigned int)a3
{
  kdebugCodes = self->_kdebugCodes;
  id v5 = [NSNumber numberWithUnsignedInt:(a3 << 24) | 0xFFFFFC];
  if ([(NSMutableSet *)kdebugCodes containsObject:v5])
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v7 = self->_kdebugCodes;
    id v8 = [NSNumber numberWithUnsignedInt:4294967292];
    char v6 = [(NSMutableSet *)v7 containsObject:v8];
  }
  return v6;
}

- (BOOL)containsClass:(unsigned int)a3 subclassID:(unsigned int)a4
{
  kdebugCodes = self->_kdebugCodes;
  id v8 = [NSNumber numberWithUnsignedInt:(a4 << 16) & 0xFF0000 | (a3 << 24) | 0xFFFC];
  if ([(NSMutableSet *)kdebugCodes containsObject:v8])
  {
    char v9 = 1;
  }
  else
  {
    id v10 = self->_kdebugCodes;
    v11 = [NSNumber numberWithUnsignedInt:(a3 << 24) | 0xFFFFFC];
    if ([(NSMutableSet *)v10 containsObject:v11])
    {
      char v9 = 1;
    }
    else
    {
      v12 = self->_kdebugCodes;
      v13 = [NSNumber numberWithUnsignedInt:(a4 << 16) | 0xFF00FFFC];
      if ([(NSMutableSet *)v12 containsObject:v13])
      {
        char v9 = 1;
      }
      else
      {
        v14 = self->_kdebugCodes;
        v15 = [NSNumber numberWithUnsignedInt:4294967292];
        char v9 = [(NSMutableSet *)v14 containsObject:v15];
      }
    }
  }
  return v9;
}

- (id)legacyXML
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:@"<events>"];
  kdebugCodes = self->_kdebugCodes;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_23090208C;
  v7[3] = &unk_264B90240;
  id v5 = v3;
  id v8 = v5;
  [(NSMutableSet *)kdebugCodes enumerateObjectsUsingBlock:v7];
  [v5 appendString:@"</events>"];

  return v5;
}

- (char)createFilterMask:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (char *)malloc_type_calloc(0x2000uLL, 1uLL, 0x100004077774924uLL);
  char v6 = [(DTKPKDebugCodeSet *)self kdebugCodes];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_23090223C;
  v8[3] = &unk_264B90260;
  v8[4] = v5;
  [v6 enumerateObjectsUsingBlock:v8];

  if (v3) {
    kperf_typefilter_invert();
  }
  return v5;
}

- (kperf_kdebug_filter)createKperfFilter
{
  BOOL v3 = (kperf_kdebug_filter *)kperf_kdebug_filter_create();
  id v4 = [(DTKPKDebugCodeSet *)self kdebugCodes];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_230902378;
  v6[3] = &unk_264B90260;
  v6[4] = v3;
  [v4 enumerateObjectsUsingBlock:v6];

  return v3;
}

+ (void)releaseFilterMask:(char *)a3
{
  if (a3) {
    free(a3);
  }
}

+ (void)releaseKperfFilter:(kperf_kdebug_filter *)a3
{
}

- (NSMutableSet)kdebugCodes
{
  return self->_kdebugCodes;
}

- (void).cxx_destruct
{
}

@end