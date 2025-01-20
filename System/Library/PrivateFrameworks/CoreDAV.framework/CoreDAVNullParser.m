@interface CoreDAVNullParser
+ (BOOL)canHandleContentType:(id)a3;
- (BOOL)processData:(id)a3 forTask:(id)a4;
- (NSError)parserError;
@end

@implementation CoreDAVNullParser

- (NSError)parserError
{
  return self->_parserError;
}

- (BOOL)processData:(id)a3 forTask:(id)a4
{
  return 1;
}

+ (BOOL)canHandleContentType:(id)a3
{
  return 1;
}

- (void).cxx_destruct
{
}

@end