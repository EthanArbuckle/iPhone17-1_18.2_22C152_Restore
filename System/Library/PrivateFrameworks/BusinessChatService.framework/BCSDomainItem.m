@interface BCSDomainItem
- (BCSDomainBundleIdPatterns)domainBundleIDPatterns;
- (BCSDomainItem)initWithBase64EncodedShardString:(id)a3 expirationDate:(id)a4;
- (BOOL)isExpired;
- (NSDate)expirationDate;
- (NSString)base64EncodedShardString;
- (NSString)domain;
- (int64_t)type;
- (void)setBase64EncodedShardString:(id)a3;
- (void)setDomainBundleIDPatterns:(id)a3;
- (void)setExpirationDate:(id)a3;
@end

@implementation BCSDomainItem

- (BCSDomainItem)initWithBase64EncodedShardString:(id)a3 expirationDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BCSDomainItem;
  v9 = [(BCSDomainItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_base64EncodedShardString, a3);
    objc_storeStrong((id *)&v10->_expirationDate, a4);
  }

  return v10;
}

- (BCSDomainBundleIdPatterns)domainBundleIDPatterns
{
  if (!self->_domainBundleIDPatterns)
  {
    v3 = [(BCSDomainItem *)self base64EncodedShardString];
    uint64_t v4 = [v3 length];

    if (v4)
    {
      id v5 = objc_alloc(MEMORY[0x263EFF8F8]);
      v6 = [(BCSDomainItem *)self base64EncodedShardString];
      id v7 = (void *)[v5 initWithBase64EncodedString:v6 options:0];

      id v8 = [[BCSDomainBundleIdPatterns alloc] initWithData:v7];
      domainBundleIDPatterns = self->_domainBundleIDPatterns;
      self->_domainBundleIDPatterns = v8;
    }
  }
  v10 = self->_domainBundleIDPatterns;

  return v10;
}

- (BOOL)isExpired
{
  v2 = [(BCSDomainItem *)self expirationDate];
  v3 = [MEMORY[0x263EFF910] date];
  BOOL v4 = [v2 compare:v3] == -1;

  return v4;
}

- (int64_t)type
{
  return 3;
}

- (NSString)domain
{
  v2 = [(BCSDomainItem *)self domainBundleIDPatterns];
  v3 = [v2 domain];

  return (NSString *)v3;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (NSString)base64EncodedShardString
{
  return self->_base64EncodedShardString;
}

- (void)setBase64EncodedShardString:(id)a3
{
}

- (void)setDomainBundleIDPatterns:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainBundleIDPatterns, 0);
  objc_storeStrong((id *)&self->_base64EncodedShardString, 0);

  objc_storeStrong((id *)&self->_expirationDate, 0);
}

@end