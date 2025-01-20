@interface IFCacheImage
+ (BOOL)supportsSecureCoding;
- (IFCacheImage)initWithCoder:(id)a3;
- (IFCacheImage)initWithData:(id)a3 uuid:(id)a4 validationToken:(id)a5;
- (NSData)validationToken;
- (NSUUID)uuid;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IFCacheImage

- (NSData)validationToken
{
  return (NSData *)objc_getProperty(self, a2, 120, 1);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 112, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validationToken, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

- (IFCacheImage)initWithData:(id)a3 uuid:(id)a4 validationToken:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_msgSend(v8, "__IS_imageHeader");
  if (!v11)
  {
    v12 = IFDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[IFCacheImage initWithData:uuid:validationToken:]();
    }
  }
  v13 = +[IFImage createCGImageWithIFImageData:v8];
  if (v13)
  {
    if (v11) {
      goto LABEL_7;
    }
  }
  else
  {
    v22 = IFDefaultLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[IFCacheImage initWithData:uuid:validationToken:]();
    }

    if (v11)
    {
LABEL_7:
      if (*(_DWORD *)(v11 + 8))
      {
        v15 = +[IFImage createCALayereWithIFImageData:v8];
        if (v15)
        {
LABEL_13:
          double v17 = *(float *)(v11 + 24);
          double v18 = *(float *)(v11 + 28);
          LODWORD(v14) = *(_DWORD *)(v11 + 12);
          double v19 = *(float *)(v11 + 16);
          double v20 = *(float *)(v11 + 20);
          double v21 = (double)v14;
          goto LABEL_18;
        }
        v16 = IFDefaultLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[IFCacheImage initWithData:uuid:validationToken:]();
        }
      }
      v15 = 0;
      goto LABEL_13;
    }
  }
  v15 = 0;
  double v21 = 0.0;
  double v19 = 0.0;
  double v20 = 0.0;
  double v17 = 0.0;
  double v18 = 0.0;
LABEL_18:
  v23 = [(IFConcreteImage *)self initWithCGImage:v13 scale:v21];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_uuid, a4);
    objc_storeStrong((id *)&v24->_validationToken, a5);
    -[IFConcreteImage setMinimumSize:](v24, "setMinimumSize:", v17, v18);
    -[IFConcreteImage setIconSize:](v24, "setIconSize:", v19, v20);
    [(IFImage *)v24 setCALayer:v15];
  }
  if (v13) {
    CFRelease(v13);
  }

  return v24;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IFCacheImage)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)IFCacheImage;
  v5 = [(IFImage *)&v17 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "_IF_decodeObjectOfClass:forKey:", objc_opt_class(), @"uuid");
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    uint64_t v8 = objc_msgSend(v4, "_IF_decodeObjectOfClass:forKey:", objc_opt_class(), @"validationToken");
    validationToken = v5->_validationToken;
    v5->_validationToken = (NSData *)v8;

    [v4 decodeFloatForKey:@"minimumSize.width"];
    double v11 = v10;
    [v4 decodeFloatForKey:@"minimumSize.height"];
    -[IFConcreteImage setMinimumSize:](v5, "setMinimumSize:", v11, v12);
    [v4 decodeFloatForKey:@"iconSize.width"];
    double v14 = v13;
    [v4 decodeFloatForKey:@"iconSize.height"];
    -[IFConcreteImage setIconSize:](v5, "setIconSize:", v14, v15);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)IFCacheImage;
  id v4 = a3;
  [(IFImage *)&v11 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_uuid, @"uuid", v11.receiver, v11.super_class);
  [v4 encodeObject:self->_validationToken forKey:@"validationToken"];
  [(IFConcreteImage *)self minimumSize];
  *(float *)&double v5 = v5;
  [v4 encodeFloat:@"minimumSize.width" forKey:v5];
  [(IFConcreteImage *)self minimumSize];
  *(float *)&double v7 = v6;
  [v4 encodeFloat:@"minimumSize.height" forKey:v7];
  [(IFConcreteImage *)self iconSize];
  *(float *)&double v8 = v8;
  [v4 encodeFloat:@"iconSize.width" forKey:v8];
  [(IFConcreteImage *)self iconSize];
  *(float *)&double v10 = v9;
  [v4 encodeFloat:@"iconSize.height" forKey:v10];
}

- (void)initWithData:uuid:validationToken:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DC6CA000, v0, v1, "Failed to read layer tree from cache data", v2, v3, v4, v5, v6);
}

- (void)initWithData:uuid:validationToken:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DC6CA000, v0, v1, "Failed to read bitmap image from cache data", v2, v3, v4, v5, v6);
}

- (void)initWithData:uuid:validationToken:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DC6CA000, v0, v1, "Failed to read header from cache data", v2, v3, v4, v5, v6);
}

@end