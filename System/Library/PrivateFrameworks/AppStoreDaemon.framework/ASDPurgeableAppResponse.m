@interface ASDPurgeableAppResponse
+ (BOOL)supportsSecureCoding;
- (ASDPurgeableAppResponse)initWithCoder:(id)a3;
- (ASDPurgeableAppResponse)initWithError:(id)a3;
- (ASDPurgeableAppResponse)initWithPurgeableSize:(int64_t)a3 purgeableApps:(id)a4;
- (NSArray)purgeableApps;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)purgeableSize;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASDPurgeableAppResponse

- (ASDPurgeableAppResponse)initWithPurgeableSize:(int64_t)a3 purgeableApps:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ASDPurgeableAppResponse;
  v8 = [(ASDRequestResponse *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_purgeableApps, a4);
    v9->_purgeableSize = a3;
  }

  return v9;
}

- (ASDPurgeableAppResponse)initWithError:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ASDPurgeableAppResponse;
  v3 = [(ASDRequestResponse *)&v7 initWithError:a3];
  v4 = v3;
  if (v3)
  {
    purgeableApps = v3->_purgeableApps;
    v3->_purgeableApps = (NSArray *)MEMORY[0x1E4F1CBF0];

    v4->_purgeableSize = 0;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(NSArray *)self->_purgeableApps copyWithZone:a3];
  objc_super v7 = (void *)v5[3];
  v5[3] = v6;

  v5[2] = self->_purgeableSize;
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDPurgeableAppResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASDPurgeableAppResponse;
  v5 = [(ASDRequestResponse *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"purgeableApps"];
    purgeableApps = v5->_purgeableApps;
    v5->_purgeableApps = (NSArray *)v9;

    v5->_purgeableSize = [v4 decodeInt64ForKey:@"purgeableSize"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ASDPurgeableAppResponse;
  id v4 = a3;
  [(ASDRequestResponse *)&v6 encodeWithCoder:v4];
  v5 = [(ASDPurgeableAppResponse *)self purgeableApps];
  [v4 encodeObject:v5 forKey:@"purgeableApps"];

  objc_msgSend(v4, "encodeInt64:forKey:", -[ASDPurgeableAppResponse purgeableSize](self, "purgeableSize"), @"purgeableSize");
}

- (int64_t)purgeableSize
{
  return self->_purgeableSize;
}

- (NSArray)purgeableApps
{
  return self->_purgeableApps;
}

- (void).cxx_destruct
{
}

@end