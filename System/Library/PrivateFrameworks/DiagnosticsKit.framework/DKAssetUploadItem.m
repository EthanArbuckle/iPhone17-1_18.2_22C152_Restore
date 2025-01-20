@interface DKAssetUploadItem
+ (BOOL)supportsSecureCoding;
+ (id)assetWithData:(id)a3 andExtra:(id)a4;
- (DKAssetUploadItem)initWithCoder:(id)a3;
- (DKAssetUploadItem)initWithData:(id)a3 andExtra:(id)a4;
- (NSData)data;
- (NSDictionary)extra;
- (id)_decoderClasses;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DKAssetUploadItem

+ (id)assetWithData:(id)a3 andExtra:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithData:v7 andExtra:v6];

  return v8;
}

- (DKAssetUploadItem)initWithData:(id)a3 andExtra:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DKAssetUploadItem;
  v9 = [(DKAssetUploadItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_data, a3);
    objc_storeStrong((id *)&v10->_extra, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_decoderClasses
{
  if (_decoderClasses_onceToken != -1) {
    dispatch_once(&_decoderClasses_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)_decoderClasses_decoderClasses;
  return v2;
}

uint64_t __36__DKAssetUploadItem__decoderClasses__block_invoke()
{
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  _decoderClasses_decoderClasses = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, objc_opt_class(), 0);
  return MEMORY[0x270F9A758]();
}

- (DKAssetUploadItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DKAssetUploadItem;
  uint64_t v5 = [(DKAssetUploadItem *)&v14 init];
  id v6 = v5;
  if (v5)
  {
    id v7 = [(DKAssetUploadItem *)v5 _decoderClasses];
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"data"];
    data = v6->_data;
    v6->_data = (NSData *)v8;

    v10 = [(DKAssetUploadItem *)v6 _decoderClasses];
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"extra"];
    extra = v6->_extra;
    v6->_extra = (NSDictionary *)v11;
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DKAssetUploadItem *)self data];
  [v4 encodeObject:v5 forKey:@"data"];

  id v6 = [(DKAssetUploadItem *)self extra];
  [v4 encodeObject:v6 forKey:@"extra"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_data copyWithZone:a3];
  id v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSDictionary *)self->_extra copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (NSData)data
{
  return self->_data;
}

- (NSDictionary)extra
{
  return self->_extra;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extra, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end