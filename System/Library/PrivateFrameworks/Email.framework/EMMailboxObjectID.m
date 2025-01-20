@interface EMMailboxObjectID
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (EMMailboxObjectID)init;
- (EMMailboxObjectID)initWithCoder:(id)a3;
- (EMMailboxObjectID)initWithURL:(id)a3;
- (NSString)accountIdentifier;
- (NSString)debugDescription;
- (NSString)ef_publicDescription;
- (NSURL)url;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EMMailboxObjectID

- (void).cxx_destruct
{
}

- (EMMailboxObjectID)initWithURL:(id)a3
{
  id v5 = a3;
  v6 = [v5 scheme];
  int v7 = [v6 isEqualToString:@"ephemeral"];

  if (v7)
  {
    v8 = [v5 host];
    v13.receiver = self;
    v13.super_class = (Class)EMMailboxObjectID;
    v9 = [(EMObjectID *)&v13 initAsEphemeralID:1 representedObjectID:v8];

    if (!v9) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v12.receiver = self;
  v12.super_class = (Class)EMMailboxObjectID;
  v9 = [(EMObjectID *)&v12 initAsEphemeralID:0];
  if (v9) {
LABEL_5:
  }
    objc_storeStrong(v9 + 5, a3);
LABEL_6:
  v10 = [v9 cachedSelf];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (EMMailboxObjectID *)a3;
  if (v4 == self)
  {
    unsigned __int8 v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      if ([(EMObjectID *)self isEphemeral])
      {
        v10.receiver = self;
        v10.super_class = (Class)EMMailboxObjectID;
        unsigned __int8 v6 = [(EMObjectID *)&v10 isEqual:v5];
      }
      else
      {
        int v7 = [(EMMailboxObjectID *)self url];
        v8 = [(EMMailboxObjectID *)v5 url];
        unsigned __int8 v6 = [v7 isEqual:v8];
      }
    }
    else
    {
      unsigned __int8 v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  if ([(EMObjectID *)self isEphemeral])
  {
    v6.receiver = self;
    v6.super_class = (Class)EMMailboxObjectID;
    return [(EMObjectID *)&v6 hash];
  }
  else
  {
    v4 = [(EMMailboxObjectID *)self url];
    unint64_t v3 = [v4 hash];
  }
  return v3;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)debugDescription
{
  v2 = [(EMMailboxObjectID *)self url];
  unint64_t v3 = [v2 description];

  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __37__EMMailboxObjectID_encodeWithCoder___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v5.receiver = *(id *)(a1 + 40);
  v5.super_class = (Class)EMMailboxObjectID;
  objc_msgSendSuper2(&v5, sel_encodeWithCoder_, v2);
  unint64_t v3 = *(void **)(a1 + 32);
  v4 = [*(id *)(a1 + 40) url];
  [v3 encodeObject:v4 forKey:@"EFPropertyKey_url"];
}

- (EMMailboxObjectID)init
{
  unint64_t v3 = objc_msgSend(NSString, "ef_UUID");
  v11.receiver = self;
  v11.super_class = (Class)EMMailboxObjectID;
  v4 = [(EMObjectID *)&v11 initAsEphemeralID:1 representedObjectID:v3];

  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F29088]);
    [v5 setScheme:@"ephemeral"];
    objc_super v6 = [v4 representedObjectID];
    [v5 setHost:v6];

    uint64_t v7 = [v5 URL];
    v8 = (void *)v4[5];
    v4[5] = v7;
  }
  v9 = [v4 cachedSelf];

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  EFEncodeCacheableInstance();
}

- (EMMailboxObjectID)initWithCoder:(id)a3
{
  id v8 = a3;
  v9 = self;
  id v4 = self;
  id v5 = v8;
  EFDecodeCacheableInstance();
  objc_super v6 = (EMMailboxObjectID *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)ef_publicDescription
{
  uint64_t v2 = (void *)MEMORY[0x1E4F60E00];
  id v3 = [(EMMailboxObjectID *)self url];
  id v4 = objc_msgSend(v2, "ec_redactedStringForMailboxURL:", v3);

  return (NSString *)v4;
}

id __35__EMMailboxObjectID_initWithCoder___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 32);
  v9.receiver = v2;
  v9.super_class = (Class)EMMailboxObjectID;
  id v4 = objc_msgSendSuper2(&v9, sel_initWithCoder_, v3);
  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_url"];
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  return v4;
}

- (NSString)accountIdentifier
{
  id v2 = [(EMMailboxObjectID *)self url];
  uint64_t v3 = [v2 host];

  return (NSString *)v3;
}

@end