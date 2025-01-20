@interface _LSQueryResult
+ (BOOL)supportsSecureCoding;
- (_LSQueryResult)init;
- (id)_init;
@end

@implementation _LSQueryResult

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)_LSQueryResult;
  return [(_LSQueryResult *)&v3 init];
}

- (_LSQueryResult)init
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end