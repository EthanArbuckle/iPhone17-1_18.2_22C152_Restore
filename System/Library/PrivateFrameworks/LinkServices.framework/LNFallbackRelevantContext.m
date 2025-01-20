@interface LNFallbackRelevantContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNFallbackRelevantContext)init;
- (id)analyticsDescription;
- (id)description;
- (unint64_t)hash;
@end

@implementation LNFallbackRelevantContext

- (id)analyticsDescription
{
  return @".fallback";
}

- (id)description
{
  return @"<fallback>";
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    char isKindOfClass = 1;
  }
  else
  {
    id v3 = a3;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (unint64_t)hash
{
  return 0;
}

- (LNFallbackRelevantContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)LNFallbackRelevantContext;
  return (LNFallbackRelevantContext *)[(LNRelevantContext *)&v3 _init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end