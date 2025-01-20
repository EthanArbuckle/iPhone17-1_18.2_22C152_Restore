@interface CDMConfig
+ (id)defaultEnabledServiceGraph;
- (CDMConfig)init;
- (CDMConfig)initWithMaxConcurrentCount:(unsigned int)a3;
- (NSOrderedSet)availableServiceGraphs;
- (NSString)defaultLocaleIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (unsigned)maxConcurrentCount;
@end

@implementation CDMConfig

- (NSOrderedSet)availableServiceGraphs
{
  return self->_availableServiceGraphs;
}

- (unsigned)maxConcurrentCount
{
  return self->_maxConcurrentCount;
}

- (NSString)defaultLocaleIdentifier
{
  v2 = +[CDMPlatformUtils normalizedAssistantLocaleIdentifier];
  if (!v2) {
    v2 = @"en_US";
  }
  return (NSString *)v2;
}

- (CDMConfig)init
{
  return [(CDMConfig *)self initWithMaxConcurrentCount:0];
}

- (CDMConfig)initWithMaxConcurrentCount:(unsigned int)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)CDMConfig;
  v4 = [(CDMConfig *)&v11 init];
  if (v4)
  {
    if (!a3)
    {
      a3 = +[CDMUserDefaultsUtils readGraphRunnerMaxConcurrentCount];
      v5 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v13 = "-[CDMConfig initWithMaxConcurrentCount:]";
        __int16 v14 = 1024;
        unsigned int v15 = a3;
        _os_log_impl(&dword_2263A0000, v5, OS_LOG_TYPE_INFO, "%s initWithDefaultMaxConcurrentCount=%d", buf, 0x12u);
      }
    }
    v4->_maxConcurrentCount = a3;
    v6 = (void *)MEMORY[0x263EFF9D8];
    v7 = (void *)[&unk_26DA3E5F8 copy];
    uint64_t v8 = [v6 orderedSetWithArray:v7];
    availableServiceGraphs = v4->_availableServiceGraphs;
    v4->_availableServiceGraphs = (NSOrderedSet *)v8;
  }
  return v4;
}

- (void).cxx_destruct
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init((Class)objc_opt_class());
  if (v4)
  {
    uint64_t v5 = [(NSOrderedSet *)self->_availableServiceGraphs copy];
    v6 = (void *)v4[1];
    v4[1] = v5;
  }
  return v4;
}

+ (id)defaultEnabledServiceGraph
{
  v2 = (void *)[&unk_26DA3E5F8 copy];
  return v2;
}

@end