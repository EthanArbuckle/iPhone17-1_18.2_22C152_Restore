@interface IXAppRemovabilityMetadataList
+ (BOOL)supportsSecureCoding;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (IXAppRemovabilityMetadataList)initWithCoder:(id)a3;
- (IXAppRemovabilityMetadataList)initWithInitialRemovability:(unint64_t)a3 client:(unint64_t)a4;
- (IXAppRemovabilityMetadataList)initWithInitialRemovabilityMetadata:(id)a3;
- (IXAppRemovabilityMetadataList)initWithMetadataDictionary:(id)a3;
- (IXAppRemovabilityMetadataList)initWithSerializedDictionary:(id)a3;
- (NSDictionary)clientToRemovabilityMetadataMap;
- (NSDictionary)propertyListRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mostRestrictiveRemovabilityMetadata;
- (unint64_t)hash;
- (unint64_t)removabilityForClient:(unint64_t)a3 notFoundRemovability:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setClientToRemovabilityMetadataMap:(id)a3;
- (void)updateRemovability:(unint64_t)a3 forClient:(unint64_t)a4;
- (void)updateRemovabilityWithMetadata:(id)a3;
@end

@implementation IXAppRemovabilityMetadataList

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IXAppRemovabilityMetadataList)initWithMetadataDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)IXAppRemovabilityMetadataList;
    v5 = [(IXAppRemovabilityMetadataList *)&v10 init];
    if (v5)
    {
      uint64_t v6 = [v4 copy];
      clientToRemovabilityMetadataMap = v5->_clientToRemovabilityMetadataMap;
      v5->_clientToRemovabilityMetadataMap = (NSDictionary *)v6;
    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (IXAppRemovabilityMetadataList)initWithInitialRemovability:(unint64_t)a3 client:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)IXAppRemovabilityMetadataList;
  uint64_t v6 = [(IXAppRemovabilityMetadataList *)&v10 init];
  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    clientToRemovabilityMetadataMap = v6->_clientToRemovabilityMetadataMap;
    v6->_clientToRemovabilityMetadataMap = (NSDictionary *)v7;

    [(IXAppRemovabilityMetadataList *)v6 updateRemovability:a3 forClient:a4];
  }
  return v6;
}

- (IXAppRemovabilityMetadataList)initWithInitialRemovabilityMetadata:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)IXAppRemovabilityMetadataList;
    v5 = [(IXAppRemovabilityMetadataList *)&v10 init];
    if (v5)
    {
      uint64_t v6 = objc_opt_new();
      clientToRemovabilityMetadataMap = v5->_clientToRemovabilityMetadataMap;
      v5->_clientToRemovabilityMetadataMap = (NSDictionary *)v6;

      [(IXAppRemovabilityMetadataList *)v5 updateRemovabilityWithMetadata:v4];
    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (IXAppRemovabilityMetadataList)initWithSerializedDictionary:(id)a3
{
  if (a3)
  {
    id v4 = [a3 objectForKeyedSubscript:@"metadata"];
    objc_opt_class();
    id v5 = v4;
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }

    if (v6)
    {
      v16.receiver = self;
      v16.super_class = (Class)IXAppRemovabilityMetadataList;
      v8 = [(IXAppRemovabilityMetadataList *)&v16 init];
      if (v8)
      {
        v9 = objc_opt_new();
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __62__IXAppRemovabilityMetadataList_initWithSerializedDictionary___block_invoke;
        v14[3] = &unk_1E5D17C00;
        id v15 = v9;
        id v10 = v9;
        [v6 enumerateObjectsUsingBlock:v14];
        uint64_t v11 = [v10 copy];
        clientToRemovabilityMetadataMap = v8->_clientToRemovabilityMetadataMap;
        v8->_clientToRemovabilityMetadataMap = (NSDictionary *)v11;
      }
      self = v8;
      uint64_t v7 = self;
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __62__IXAppRemovabilityMetadataList_initWithSerializedDictionary___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  objc_opt_class();
  id v12 = v6;
  if (objc_opt_isKindOfClass())
  {
    if (!v12) {
      goto LABEL_7;
    }
    uint64_t v7 = [[IXAppRemovabilityMetadata alloc] initWithMetadataDictionary:v12];
    v8 = v7;
    if (v7)
    {
      v9 = *(void **)(a1 + 32);
      id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[IXAppRemovabilityMetadata client](v7, "client"));
      [v9 setObject:v8 forKeyedSubscript:v10];
    }
  }

LABEL_7:
  *a4 = 0;

  return MEMORY[0x1F41817F8]();
}

- (id)mostRestrictiveRemovabilityMetadata
{
  v2 = [(IXAppRemovabilityMetadataList *)self clientToRemovabilityMetadataMap];
  if ([v2 count])
  {
    uint64_t v7 = 0;
    v8 = &v7;
    uint64_t v9 = 0x3032000000;
    id v10 = __Block_byref_object_copy__0;
    uint64_t v11 = __Block_byref_object_dispose__0;
    id v12 = 0;
    v6[0] = 0;
    v6[1] = v6;
    v6[2] = 0x2020000000;
    v6[3] = 0;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __68__IXAppRemovabilityMetadataList_mostRestrictiveRemovabilityMetadata__block_invoke;
    v5[3] = &unk_1E5D17C28;
    v5[4] = &v7;
    v5[5] = v6;
    [v2 enumerateKeysAndObjectsUsingBlock:v5];
    id v3 = (id)v8[5];
    _Block_object_dispose(v6, 8);
    _Block_object_dispose(&v7, 8);
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

void __68__IXAppRemovabilityMetadataList_mostRestrictiveRemovabilityMetadata__block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v11 = a2;
  id v7 = a3;
  v8 = v7;
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(void *)(v9 + 40))
  {
    unint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    if (v10 >= [v7 removability]) {
      goto LABEL_5;
    }
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  objc_storeStrong((id *)(v9 + 40), a3);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) removability];
LABEL_5:
  *a4 = 0;
}

- (void)updateRemovability:(unint64_t)a3 forClient:(unint64_t)a4
{
  id v7 = [(IXAppRemovabilityMetadataList *)self clientToRemovabilityMetadataMap];
  id v12 = (id)[v7 mutableCopy];

  v8 = [NSNumber numberWithUnsignedInteger:a4];
  if (a3 == 1)
  {
    uint64_t v9 = [v12 objectForKeyedSubscript:v8];

    if (v9) {
      [v12 removeObjectForKey:v8];
    }
  }
  else
  {
    unint64_t v10 = [[IXAppRemovabilityMetadata alloc] initWithRemovability:a3 client:a4];
    [v12 setObject:v10 forKeyedSubscript:v8];
  }
  id v11 = (void *)[v12 copy];
  [(IXAppRemovabilityMetadataList *)self setClientToRemovabilityMetadataMap:v11];
}

- (void)updateRemovabilityWithMetadata:(id)a3
{
  id v9 = a3;
  id v4 = [(IXAppRemovabilityMetadataList *)self clientToRemovabilityMetadataMap];
  id v5 = (void *)[v4 mutableCopy];

  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "client"));
  if ([v9 removability] == 1)
  {
    id v7 = [v5 objectForKeyedSubscript:v6];

    if (v7) {
      [v5 removeObjectForKey:v6];
    }
  }
  else
  {
    [v5 setObject:v9 forKeyedSubscript:v6];
  }
  v8 = (void *)[v5 copy];
  [(IXAppRemovabilityMetadataList *)self setClientToRemovabilityMetadataMap:v8];
}

- (unint64_t)removabilityForClient:(unint64_t)a3 notFoundRemovability:(unint64_t)a4
{
  if (![(IXAppRemovabilityMetadataList *)self isEmpty])
  {
    id v7 = [(IXAppRemovabilityMetadataList *)self clientToRemovabilityMetadataMap];
    v8 = [NSNumber numberWithUnsignedInteger:a3];
    id v9 = [v7 objectForKeyedSubscript:v8];

    if (v9) {
      a4 = [v9 removability];
    }
  }
  return a4;
}

- (BOOL)isEmpty
{
  v2 = [(IXAppRemovabilityMetadataList *)self clientToRemovabilityMetadataMap];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (id)description
{
  BOOL v3 = objc_opt_new();
  id v4 = [(IXAppRemovabilityMetadataList *)self clientToRemovabilityMetadataMap];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  unint64_t v10 = __44__IXAppRemovabilityMetadataList_description__block_invoke;
  id v11 = &unk_1E5D17C50;
  id v12 = v3;
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:&v8];

  id v6 = [NSString stringWithFormat:@"%@", v5, v8, v9, v10, v11];

  return v6;
}

void __44__IXAppRemovabilityMetadataList_description__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = [a3 description];
  [v5 addObject:v6];

  *a4 = 0;
}

- (NSDictionary)propertyListRepresentation
{
  v15[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = objc_opt_new();
  id v4 = [(IXAppRemovabilityMetadataList *)self clientToRemovabilityMetadataMap];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __59__IXAppRemovabilityMetadataList_propertyListRepresentation__block_invoke;
  id v12 = &unk_1E5D17C50;
  id v13 = v3;
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:&v9];

  v14 = @"metadata";
  id v6 = objc_msgSend(v5, "copy", v9, v10, v11, v12);
  v15[0] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];

  return (NSDictionary *)v7;
}

void __59__IXAppRemovabilityMetadataList_propertyListRepresentation__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = [a3 dictionaryRepresentation];
  [v5 addObject:v6];

  *a4 = 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[IXAppRemovabilityMetadataList allocWithZone:a3];
  id v5 = [(IXAppRemovabilityMetadataList *)self clientToRemovabilityMetadataMap];
  id v6 = [(IXAppRemovabilityMetadataList *)v4 initWithMetadataDictionary:v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (IXAppRemovabilityMetadataList *)a3;
  id v5 = v4;
  if (self == v4)
  {
    char v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = [(IXAppRemovabilityMetadataList *)v5 clientToRemovabilityMetadataMap];
    id v7 = [(IXAppRemovabilityMetadataList *)self clientToRemovabilityMetadataMap];
    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(IXAppRemovabilityMetadataList *)self clientToRemovabilityMetadataMap];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(IXAppRemovabilityMetadataList *)self clientToRemovabilityMetadataMap];
  [v4 encodeObject:v5 forKey:@"clientToRemovabilityMetadataMap"];
}

- (IXAppRemovabilityMetadataList)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IXAppRemovabilityMetadataList;
  id v5 = [(IXAppRemovabilityMetadataList *)&v14 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"clientToRemovabilityMetadataMap"];
    clientToRemovabilityMetadataMap = v5->_clientToRemovabilityMetadataMap;
    v5->_clientToRemovabilityMetadataMap = (NSDictionary *)v11;
  }
  return v5;
}

- (NSDictionary)clientToRemovabilityMetadataMap
{
  return self->_clientToRemovabilityMetadataMap;
}

- (void)setClientToRemovabilityMetadataMap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end