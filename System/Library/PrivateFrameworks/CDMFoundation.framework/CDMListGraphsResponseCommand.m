@interface CDMListGraphsResponseCommand
- (CDMListGraphsResponseCommand)initWithGraphs:(id)a3;
- (NSOrderedSet)availableServiceGraphs;
@end

@implementation CDMListGraphsResponseCommand

- (void).cxx_destruct
{
}

- (NSOrderedSet)availableServiceGraphs
{
  return self->_availableServiceGraphs;
}

- (CDMListGraphsResponseCommand)initWithGraphs:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMListGraphsResponseCommand;
  v6 = [(CDMBaseCommand *)&v9 init];
  if (v6)
  {
    if (![v5 count])
    {
      v7 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v11 = "-[CDMListGraphsResponseCommand initWithGraphs:]";
        _os_log_impl(&dword_2263A0000, v7, OS_LOG_TYPE_INFO, "%s [WARN]: Zero service graphs configured? That doesn't sound right! But not going to bail, will just return empty set", buf, 0xCu);
      }
    }
    objc_storeStrong((id *)&v6->_availableServiceGraphs, a3);
  }

  return v6;
}

@end