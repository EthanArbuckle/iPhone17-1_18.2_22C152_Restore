@interface CDMSpanMatchDataUpdateCommand
- (CDMSpanMatchDataUpdateCommand)init;
- (SEMSpanMatcher)semSpanMatcher;
@end

@implementation CDMSpanMatchDataUpdateCommand

- (void).cxx_destruct
{
}

- (SEMSpanMatcher)semSpanMatcher
{
  return self->_semSpanMatcher;
}

- (CDMSpanMatchDataUpdateCommand)init
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v7.receiver = self;
  v7.super_class = (Class)CDMSpanMatchDataUpdateCommand;
  v2 = [(CDMBaseCommand *)&v7 init];
  if (v2)
  {
    v3 = CDMLogContext;
    if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "-[CDMSpanMatchDataUpdateCommand init]";
      __int16 v10 = 2112;
      v11 = @"spanmatch";
      _os_log_impl(&dword_2263A0000, v3, OS_LOG_TYPE_INFO, "%s [insights-cdm-%@]:\nSiriVocabularyProtoSpanMatcher initialized", buf, 0x16u);
    }
    uint64_t v4 = [MEMORY[0x263F6D188] indexMatcher];
    semSpanMatcher = v2->_semSpanMatcher;
    v2->_semSpanMatcher = (SEMSpanMatcher *)v4;
  }
  return v2;
}

@end