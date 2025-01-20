@interface _EARLanguageDetectorLoggingInfo
- (NSDictionary)loggingDict;
- (_EARLanguageDetectorRequestContext)context;
- (void)setContext:(id)a3;
- (void)setLoggingDict:(id)a3;
@end

@implementation _EARLanguageDetectorLoggingInfo

- (NSDictionary)loggingDict
{
  return self->_loggingDict;
}

- (void)setLoggingDict:(id)a3
{
}

- (_EARLanguageDetectorRequestContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_loggingDict, 0);
}

@end