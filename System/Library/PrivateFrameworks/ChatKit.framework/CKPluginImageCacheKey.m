@interface CKPluginImageCacheKey
+ (id)keyWithStringIdentifier:(id)a3 integerIdentifier:(int64_t)a4;
- (BOOL)isEqual:(id)a3;
- (CKPluginImageCacheKey)initWithStringIdentifier:(id)a3 integerIdentifier:(int64_t)a4;
- (NSString)stringIdentifier;
- (id)description;
- (int64_t)integerIdentifier;
- (unint64_t)hash;
- (void)setIntegerIdentifier:(int64_t)a3;
- (void)setStringIdentifier:(id)a3;
@end

@implementation CKPluginImageCacheKey

+ (id)keyWithStringIdentifier:(id)a3 integerIdentifier:(int64_t)a4
{
  id v5 = a3;
  v6 = [[CKPluginImageCacheKey alloc] initWithStringIdentifier:v5 integerIdentifier:a4];

  return v6;
}

- (CKPluginImageCacheKey)initWithStringIdentifier:(id)a3 integerIdentifier:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKPluginImageCacheKey;
  v8 = [(CKPluginImageCacheKey *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_stringIdentifier, a3);
    v9->_integerIdentifier = a4;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (uint64_t v5 = [v4 integerIdentifier],
        v5 == [(CKPluginImageCacheKey *)self integerIdentifier]))
  {
    v6 = [v4 stringIdentifier];
    id v7 = [(CKPluginImageCacheKey *)self stringIdentifier];
    char v8 = [v6 isEqualToString:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  int64_t v3 = [(CKPluginImageCacheKey *)self integerIdentifier];
  id v4 = [(CKPluginImageCacheKey *)self stringIdentifier];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (id)description
{
  int64_t v3 = NSString;
  id v4 = [(CKPluginImageCacheKey *)self stringIdentifier];
  unint64_t v5 = [v3 stringWithFormat:@"%@ - %ld", v4, -[CKPluginImageCacheKey integerIdentifier](self, "integerIdentifier")];

  return v5;
}

- (NSString)stringIdentifier
{
  return self->_stringIdentifier;
}

- (void)setStringIdentifier:(id)a3
{
}

- (int64_t)integerIdentifier
{
  return self->_integerIdentifier;
}

- (void)setIntegerIdentifier:(int64_t)a3
{
  self->_integerIdentifier = a3;
}

- (void).cxx_destruct
{
}

@end