@interface CATInitializingIDSServiceConnectionContentAccept
+ (id)instanceWithDictionary:(id)a3;
- (CATInitializingIDSServiceConnectionContentAccept)initWithConnectionIdentifier:(id)a3;
- (NSDictionary)dictionaryValue;
- (NSUUID)connectionIdentifier;
- (int64_t)contentType;
@end

@implementation CATInitializingIDSServiceConnectionContentAccept

- (CATInitializingIDSServiceConnectionContentAccept)initWithConnectionIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CATInitializingIDSServiceConnectionContentAccept;
  v6 = [(CATInitializingIDSServiceConnectionContentAccept *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connectionIdentifier, a3);
  }

  return v7;
}

- (int64_t)contentType
{
  return 2;
}

- (NSDictionary)dictionaryValue
{
  v7[1] = *MEMORY[0x263EF8340];
  v6 = @"ConnectionIdentifier";
  v2 = [(CATInitializingIDSServiceConnectionContentAccept *)self connectionIdentifier];
  v3 = [v2 UUIDString];
  v7[0] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return (NSDictionary *)v4;
}

+ (id)instanceWithDictionary:(id)a3
{
  v4 = objc_msgSend(a3, "cat_uuidForKey:", @"ConnectionIdentifier");
  if (v4) {
    id v5 = (void *)[objc_alloc((Class)a1) initWithConnectionIdentifier:v4];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (NSUUID)connectionIdentifier
{
  return self->_connectionIdentifier;
}

- (void).cxx_destruct
{
}

@end