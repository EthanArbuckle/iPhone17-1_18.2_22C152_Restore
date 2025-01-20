@interface EMActivityObjectID
+ (BOOL)supportsSecureCoding;
- (EMActivityObjectID)init;
- (EMActivityObjectID)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EMActivityObjectID

id __38__EMActivityObjectID_encodeWithCoder___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)EMActivityObjectID;
  return objc_msgSendSuper2(&v3, sel_encodeWithCoder_, v1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  EFEncodeCacheableInstance();
}

- (EMActivityObjectID)initWithCoder:(id)a3
{
  id v8 = a3;
  v9 = self;
  id v4 = self;
  id v5 = v8;
  EFDecodeCacheableInstance();
  v6 = (EMActivityObjectID *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __36__EMActivityObjectID_initWithCoder___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 32);
  v6.receiver = v2;
  v6.super_class = (Class)EMActivityObjectID;
  id v4 = objc_msgSendSuper2(&v6, sel_initWithCoder_, v3);
  return v4;
}

- (EMActivityObjectID)init
{
  v3.receiver = self;
  v3.super_class = (Class)EMActivityObjectID;
  return (EMActivityObjectID *)[(EMObjectID *)&v3 initAsEphemeralID:1];
}

@end