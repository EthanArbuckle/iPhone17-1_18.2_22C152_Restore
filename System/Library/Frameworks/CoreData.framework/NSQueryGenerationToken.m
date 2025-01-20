@interface NSQueryGenerationToken
+ (BOOL)supportsSecureCoding;
+ (NSQueryGenerationToken)currentQueryGenerationToken;
+ (id)nostoresQueryGenerationToken;
+ (id)unpinnedQueryGenerationToken;
+ (void)initialize;
- (BOOL)_isEnabled;
- (BOOL)isEqual:(id)a3;
- (NSQueryGenerationToken)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSQueryGenerationToken

- (BOOL)_isEnabled
{
  return _MergedGlobals_75 != (void)self;
}

+ (id)unpinnedQueryGenerationToken
{
  return (id)_MergedGlobals_75;
}

+ (NSQueryGenerationToken)currentQueryGenerationToken
{
  return (NSQueryGenerationToken *)qword_1EB2706C8;
}

+ (id)nostoresQueryGenerationToken
{
  return (id)qword_1EB2706D0;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    _MergedGlobals_75 = (uint64_t)-[_NSQueryGenerationToken _initWithValue:singleton:]([_NSQueryGenerationToken alloc], @"unpinned", 1);
    qword_1EB2706C8 = (uint64_t)-[_NSQueryGenerationToken _initWithValue:singleton:]([_NSQueryGenerationToken alloc], @"current", 1);
    qword_1EB2706D0 = (uint64_t)-[_NSQueryGenerationToken _initWithValue:singleton:]([_NSQueryGenerationToken alloc], @"nostore", 1);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSQueryGenerationToken)initWithCoder:(id)a3
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

- (BOOL)isEqual:(id)a3
{
  return self == a3;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<NSQueryGenerationToken: %p>", self);
}

@end