@interface EMListUnsubscribePostValues
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (EMListUnsubscribePostValues)initWithCoder:(id)a3;
- (EMListUnsubscribePostValues)initWithURL:(id)a3 postContent:(id)a4;
- (NSString)postContent;
- (NSURL)oneClickURL;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EMListUnsubscribePostValues

- (EMListUnsubscribePostValues)initWithURL:(id)a3 postContent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EMListUnsubscribePostValues;
  v8 = [(EMListUnsubscribePostValues *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    oneClickURL = v8->_oneClickURL;
    v8->_oneClickURL = (NSURL *)v9;

    uint64_t v11 = [v7 copy];
    postContent = v8->_postContent;
    v8->_postContent = (NSString *)v11;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMListUnsubscribePostValues)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EMListUnsubscribePostValues;
  v5 = [(EMListUnsubscribePostValues *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_oneClickURL"];
    oneClickURL = v5->_oneClickURL;
    v5->_oneClickURL = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_postContent"];
    postContent = v5->_postContent;
    v5->_postContent = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(EMListUnsubscribePostValues *)self oneClickURL];
  [v6 encodeObject:v4 forKey:@"EFPropertyKey_oneClickURL"];

  v5 = [(EMListUnsubscribePostValues *)self postContent];
  [v6 encodeObject:v5 forKey:@"EFPropertyKey_postContent"];
}

- (unint64_t)hash
{
  uint64_t v3 = 17 * [(NSURL *)self->_oneClickURL hash];
  return [(NSString *)self->_postContent hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    v5 = [v4 oneClickURL];
    if (EFObjectsAreEqual())
    {
      id v6 = [v4 postContent];
      EFObjectsAreEqual();
    }
  }

  return 0;
}

- (NSURL)oneClickURL
{
  return self->_oneClickURL;
}

- (NSString)postContent
{
  return self->_postContent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postContent, 0);
  objc_storeStrong((id *)&self->_oneClickURL, 0);
}

@end