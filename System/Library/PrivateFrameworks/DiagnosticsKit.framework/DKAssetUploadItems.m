@interface DKAssetUploadItems
+ (BOOL)supportsSecureCoding;
+ (id)assetWithItems:(id)a3;
- (DKAssetUploadItems)initWithCoder:(id)a3;
- (DKAssetUploadItems)initWithItems:(id)a3;
- (NSArray)items;
- (id)_decoderClasses;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DKAssetUploadItems

+ (id)assetWithItems:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithItems:v4];

  return v5;
}

- (DKAssetUploadItems)initWithItems:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DKAssetUploadItems;
  v6 = [(DKAssetUploadItems *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_items, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_decoderClasses
{
  if (_decoderClasses_onceToken_45 != -1) {
    dispatch_once(&_decoderClasses_onceToken_45, &__block_literal_global_47);
  }
  v2 = (void *)_decoderClasses_decoderClasses_44;
  return v2;
}

uint64_t __37__DKAssetUploadItems__decoderClasses__block_invoke()
{
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  _decoderClasses_decoderClasses_44 = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, objc_opt_class(), 0);
  return MEMORY[0x270F9A758]();
}

- (DKAssetUploadItems)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DKAssetUploadItems;
  uint64_t v5 = [(DKAssetUploadItems *)&v11 init];
  uint64_t v6 = v5;
  if (v5)
  {
    v7 = [(DKAssetUploadItems *)v5 _decoderClasses];
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"items"];
    items = v6->_items;
    v6->_items = (NSArray *)v8;
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(DKAssetUploadItems *)self items];
  [v4 encodeObject:v5 forKey:@"items"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSArray *)self->_items copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
}

@end