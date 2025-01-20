@interface APUIAppFallback
- (APUIAppFallback)initWithBundleId:(id)a3;
- (APUIAppFallback)initWithProactiveSuggestion:(id)a3;
- (ATXProactiveSuggestion)suggestion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAPUIAppFallback:(id)a3;
- (NSString)bundleId;
- (unint64_t)hash;
@end

@implementation APUIAppFallback

- (APUIAppFallback)initWithBundleId:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)APUIAppFallback;
  v5 = [(APUIAppFallback *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    bundleId = v5->_bundleId;
    v5->_bundleId = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (APUIAppFallback)initWithProactiveSuggestion:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 executableSpecification];
  uint64_t v7 = [v6 executableType];

  if (v7 == 1
    && (v13.receiver = self,
        v13.super_class = (Class)APUIAppFallback,
        (self = [(APUIAppFallback *)&v13 init]) != 0))
  {
    v8 = [v5 executableSpecification];
    v9 = [v8 executableObject];
    bundleId = self->_bundleId;
    self->_bundleId = v9;

    objc_storeStrong((id *)&self->_suggestion, a3);
    self = self;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  return [(NSString *)self->_bundleId hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (APUIAppFallback *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(APUIAppFallback *)self isEqualToAPUIAppFallback:v5];

  return v6;
}

- (BOOL)isEqualToAPUIAppFallback:(id)a3
{
  bundleId = self->_bundleId;
  id v4 = [a3 bundleId];
  LOBYTE(bundleId) = [(NSString *)bundleId isEqualToString:v4];

  return (char)bundleId;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (ATXProactiveSuggestion)suggestion
{
  return self->_suggestion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end