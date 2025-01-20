@interface DIImageInfoParams
+ (BOOL)supportsSecureCoding;
- (BOOL)extraInfo;
- (BOOL)openEncryption;
- (BOOL)retrieveWithError:(id *)a3;
- (DIImageInfoParams)initWithExistingParams:(id)a3 error:(id *)a4;
- (DIImageInfoParams)initWithURL:(id)a3 error:(id *)a4;
- (NSDictionary)imageInfo;
- (void)setExtraInfo:(BOOL)a3;
- (void)setImageInfo:(id)a3;
- (void)setOpenEncryption:(BOOL)a3;
@end

@implementation DIImageInfoParams

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DIImageInfoParams)initWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DIImageInfoParams;
  v7 = [(DIBaseParams *)&v11 initWithURL:v6 error:a4];
  v8 = v7;
  if (v7
    && (v7->_extraInfo = 0,
        v7->_openEncryption = 1,
        ![(DIBaseParams *)v7 openExistingImageWithFlags:0 error:a4]))
  {
    v9 = 0;
  }
  else
  {
    v9 = v8;
  }

  return v9;
}

- (DIImageInfoParams)initWithExistingParams:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 inputURL];
  v16.receiver = self;
  v16.super_class = (Class)DIImageInfoParams;
  v8 = [(DIBaseParams *)&v16 initWithURL:v7 error:a4];

  if (!v8) {
    goto LABEL_3;
  }
  v9 = [v6 diskImageParamsXPC];
  [(DIBaseParams *)v8 setDiskImageParamsXPC:v9];

  v10 = [(DIBaseParams *)v8 shadowChain];
  objc_super v11 = [v6 shadowChain];
  v12 = [v11 nodes];
  unsigned __int8 v13 = [v10 addShadowNodes:v12 error:a4];

  if ((v13 & 1) == 0) {
    v14 = 0;
  }
  else {
LABEL_3:
  }
    v14 = v8;

  return v14;
}

- (BOOL)retrieveWithError:(id *)a3
{
  if ([(DIImageInfoParams *)self openEncryption])
  {
    v5 = objc_alloc_init(DIClient2Controller_XPCHandler);
    if (![(DIClient2Controller_XPCHandler *)v5 connectWithError:a3]
      || ![(DIBaseParams *)self prepareImageWithXpcHandler:v5 fileMode:2 error:a3])
    {

      return 0;
    }
  }
  id v6 = [(DIBaseParams *)self diskImageParamsXPC];
  BOOL v7 = [(DIImageInfoParams *)self extraInfo];
  if (v6) {
    [v6 getImageInfoWithExtra:v7 error:a3];
  }
  else {
    v14 = 0;
  }

  BOOL v8 = v14 != 0;
  if (v14)
  {
    (*(void (**)(CFTypeRef *__return_ptr))(*(void *)((char *)v14 + *(void *)(*v14 - 96)) + 16))(&cf);
    v9 = (NSDictionary *)CFRetain(cf);
    imageInfo = self->_imageInfo;
    self->_imageInfo = v9;

    sub_10000D758(&cf);
    objc_super v11 = v14;
    v14 = 0;
    if (v11) {
      (*(void (**)(void *))(*v11 + 8))(v11);
    }
  }
  return v8;
}

- (NSDictionary)imageInfo
{
  return self->_imageInfo;
}

- (void)setImageInfo:(id)a3
{
}

- (BOOL)extraInfo
{
  return self->_extraInfo;
}

- (void)setExtraInfo:(BOOL)a3
{
  self->_extraInfo = a3;
}

- (BOOL)openEncryption
{
  return self->_openEncryption;
}

- (void)setOpenEncryption:(BOOL)a3
{
  self->_openEncryption = a3;
}

- (void).cxx_destruct
{
}

@end