@interface EMDeliveryAccount
+ (BOOL)supportsSecureCoding;
- (BOOL)isPrimaryiCloudAccount;
- (EMDeliveryAccount)initWithCoder:(id)a3;
- (EMDeliveryAccount)initWithObjectID:(id)a3 name:(id)a4 hostname:(id)a5 builder:(id)a6;
- (NSString)hostname;
- (NSString)username;
- (id)name;
- (unint64_t)maximumMessageBytes;
- (void)_commonInitName:(id)a3 hostname:(id)a4 builder:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)setHostname:(id)a3;
- (void)setMaximumMessageBytes:(unint64_t)a3;
- (void)setPrimaryiCloudAccount:(BOOL)a3;
- (void)setUsername:(id)a3;
@end

@implementation EMDeliveryAccount

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMDeliveryAccount;
  [(EMObject *)&v9 encodeWithCoder:v4];
  v5 = [(EMDeliveryAccount *)self name];
  [v4 encodeObject:v5 forKey:@"EFPropertyKey_name"];

  v6 = [(EMDeliveryAccount *)self hostname];
  [v4 encodeObject:v6 forKey:@"EFPropertyKey_hostname"];

  v7 = [(EMDeliveryAccount *)self username];
  [v4 encodeObject:v7 forKey:@"EFPropertyKey_username"];

  v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[EMDeliveryAccount maximumMessageBytes](self, "maximumMessageBytes"));
  [v4 encodeObject:v8 forKey:@"EFPropertyKey_maximumMessageBytes"];

  objc_msgSend(v4, "encodeBool:forKey:", -[EMDeliveryAccount isPrimaryiCloudAccount](self, "isPrimaryiCloudAccount"), @"EFPropertyKey_primaryiCloudAccount");
}

- (NSString)username
{
  return self->_username;
}

- (id)name
{
  return self->_name;
}

- (unint64_t)maximumMessageBytes
{
  return self->_maximumMessageBytes;
}

- (BOOL)isPrimaryiCloudAccount
{
  return self->_primaryiCloudAccount;
}

- (NSString)hostname
{
  return self->_hostname;
}

- (EMDeliveryAccount)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EMDeliveryAccount;
  v5 = [(EMObject *)&v11 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_name"];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_hostname"];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __35__EMDeliveryAccount_initWithCoder___block_invoke;
    v9[3] = &unk_1E63E3138;
    id v10 = v4;
    [(EMDeliveryAccount *)v5 _commonInitName:v6 hostname:v7 builder:v9];
  }
  return v5;
}

- (void)_commonInitName:(id)a3 hostname:(id)a4 builder:(id)a5
{
  id v12 = a3;
  objc_super v9 = (NSString *)a4;
  objc_storeStrong((id *)&self->_name, a3);
  id v10 = (void (**)(id, EMDeliveryAccount *))a5;
  hostname = self->_hostname;
  self->_hostname = v9;

  v10[2](v10, self);
}

void __35__EMDeliveryAccount_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_username"];
  [v7 setUsername:v3];

  id v4 = *(void **)(a1 + 32);
  v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  v6 = [v4 decodeObjectOfClasses:v5 forKey:@"EFPropertyKey_maximumMessageBytes"];
  objc_msgSend(v7, "setMaximumMessageBytes:", objc_msgSend(v6, "unsignedLongLongValue"));

  objc_msgSend(v7, "setPrimaryiCloudAccount:", objc_msgSend(*(id *)(a1 + 32), "decodeBoolForKey:", @"EFPropertyKey_primaryiCloudAccount"));
}

- (void)setUsername:(id)a3
{
}

- (void)setPrimaryiCloudAccount:(BOOL)a3
{
  self->_primaryiCloudAccount = a3;
}

- (void)setMaximumMessageBytes:(unint64_t)a3
{
  self->_maximumMessageBytes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostname, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (EMDeliveryAccount)initWithObjectID:(id)a3 name:(id)a4 hostname:(id)a5 builder:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = (void (**)(id, EMDeliveryAccount *))a6;
  if (!v14)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"EMDeliveryAccount.m", 27, @"Invalid parameter not satisfying: %@", @"builderBlock" object file lineNumber description];
  }
  v19.receiver = self;
  v19.super_class = (Class)EMDeliveryAccount;
  v15 = [(EMObject *)&v19 initWithObjectID:v11];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_name, a4);
    objc_storeStrong((id *)&v16->_hostname, a5);
    v14[2](v14, v16);
  }

  return v16;
}

- (void)setHostname:(id)a3
{
}

@end