@interface CDMOverridesProtoResponseCommand
- (CDMOverridesProtoResponseCommand)initWithParsesForReplacement:(id)a3 parsesForAppending:(id)a4;
- (NSArray)parsesForAppending;
- (NSArray)parsesForReplacement;
- (void)setParsesForAppending:(id)a3;
- (void)setParsesForReplacement:(id)a3;
@end

@implementation CDMOverridesProtoResponseCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parsesForAppending, 0);
  objc_storeStrong((id *)&self->_parsesForReplacement, 0);
}

- (void)setParsesForAppending:(id)a3
{
}

- (NSArray)parsesForAppending
{
  return self->_parsesForAppending;
}

- (void)setParsesForReplacement:(id)a3
{
}

- (NSArray)parsesForReplacement
{
  return self->_parsesForReplacement;
}

- (CDMOverridesProtoResponseCommand)initWithParsesForReplacement:(id)a3 parsesForAppending:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CDMOverridesProtoResponseCommand;
  v8 = [(CDMBaseCommand *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    parsesForReplacement = v8->_parsesForReplacement;
    v8->_parsesForReplacement = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    parsesForAppending = v8->_parsesForAppending;
    v8->_parsesForAppending = (NSArray *)v11;
  }
  return v8;
}

@end