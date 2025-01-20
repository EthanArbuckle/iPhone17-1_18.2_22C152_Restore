@interface CTFetchRoadsideProvidersContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTFetchRoadsideProvidersContext)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation CTFetchRoadsideProvidersContext

- (id)description
{
  v2 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  [v2 appendString:@">"];

  return v2;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTFetchRoadsideProvidersContext *)a3;
  if (self == v4)
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = (void *)[(id)objc_opt_class() allocWithZone:a3];

  return (id)[v3 init];
}

- (CTFetchRoadsideProvidersContext)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CTFetchRoadsideProvidersContext;
  return [(CTFetchRoadsideProvidersContext *)&v4 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end