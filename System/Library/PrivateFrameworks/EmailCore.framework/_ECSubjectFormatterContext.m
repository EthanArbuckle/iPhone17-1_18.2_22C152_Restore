@interface _ECSubjectFormatterContext
- (BOOL)prefixLastStrongDirectionalityIsLeftToRight;
- (NSRegularExpression)regex;
- (NSString)localizedPrefix;
- (_ECSubjectFormatterContext)initWithRegex:(id)a3 localizedPrefix:(id)a4;
@end

@implementation _ECSubjectFormatterContext

- (_ECSubjectFormatterContext)initWithRegex:(id)a3 localizedPrefix:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_ECSubjectFormatterContext;
  v9 = [(_ECSubjectFormatterContext *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_regex, a3);
    uint64_t v11 = [v8 copy];
    localizedPrefix = v10->_localizedPrefix;
    v10->_localizedPrefix = (NSString *)v11;

    v10->_prefixLastStrongDirectionalityIsLeftToRight = objc_msgSend(v8, "ef_lastStrongDirectionalityIsLeftToRight");
  }

  return v10;
}

- (NSRegularExpression)regex
{
  return self->_regex;
}

- (NSString)localizedPrefix
{
  return self->_localizedPrefix;
}

- (BOOL)prefixLastStrongDirectionalityIsLeftToRight
{
  return self->_prefixLastStrongDirectionalityIsLeftToRight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedPrefix, 0);
  objc_storeStrong((id *)&self->_regex, 0);
}

@end