@interface EQKitSourceAttribution
- (BOOL)isEqual:(id)a3;
- (EQKitSourceAttribution)initWithSource:(id)a3 range:(_NSRange)a4;
- (NSString)source;
- (_NSRange)range;
- (void)dealloc;
@end

@implementation EQKitSourceAttribution

- (EQKitSourceAttribution)initWithSource:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v9.receiver = self;
  v9.super_class = (Class)EQKitSourceAttribution;
  v7 = [(EQKitSourceAttribution *)&v9 init];
  if (v7)
  {
    v7->mSource = (NSString *)[a3 copy];
    v7->mRange.NSUInteger location = location;
    v7->mRange.NSUInteger length = length;
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)EQKitSourceAttribution;
  [(EQKitSourceAttribution *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    int v5 = [a3 isMemberOfClass:objc_opt_class()];
    if (v5)
    {
      if (self->mRange.location == [a3 range] && self->mRange.length == v6)
      {
        mSource = self->mSource;
        uint64_t v8 = [a3 source];
        LOBYTE(v5) = [(NSString *)mSource isEqualToString:v8];
      }
      else
      {
        LOBYTE(v5) = 0;
      }
    }
  }
  return v5;
}

- (NSString)source
{
  return self->mSource;
}

- (_NSRange)range
{
  NSUInteger length = self->mRange.length;
  NSUInteger location = self->mRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

@end