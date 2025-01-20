@interface LPARAsset
+ (BOOL)supportsSecureCoding;
- (BOOL)_isSubstitute;
- (BOOL)isEqual:(id)a3;
- (LPARAsset)initWithCoder:(id)a3;
- (LPARAsset)initWithData:(id)a3 MIMEType:(id)a4 properties:(id)a5;
- (id)_createTemporaryFileAndWriteData;
- (id)_ensureTemporaryAssetURL;
- (id)_initWithARAsset:(id)a3;
- (id)initByReferencingFileURL:(id)a3 MIMEType:(id)a4 properties:(id)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LPARAsset

- (id)initByReferencingFileURL:(id)a3 MIMEType:(id)a4 properties:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)LPARAsset;
  id v5 = [(LPVisualMedia *)&v9 _initByReferencingFileURL:a3 MIMEType:a4 properties:a5];
  v6 = v5;
  if (v5) {
    id v7 = v5;
  }

  return v6;
}

- (LPARAsset)initWithData:(id)a3 MIMEType:(id)a4 properties:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)LPARAsset;
  id v5 = [(LPVisualMedia *)&v9 _initWithData:a3 MIMEType:a4 properties:a5];
  v6 = v5;
  if (v5) {
    id v7 = v5;
  }

  return v6;
}

- (id)_initWithARAsset:(id)a3
{
  id v4 = a3;
  id v5 = [v4 data];
  v6 = [v4 fileURL];
  id v7 = [v4 MIMEType];
  v8 = [v4 properties];
  v12.receiver = self;
  v12.super_class = (Class)LPARAsset;
  id v9 = [(LPVisualMedia *)&v12 _initWithData:v5 fileURL:v6 MIMEType:v7 properties:v8];

  if (v9) {
    id v10 = v9;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_createTemporaryFileAndWriteData
{
  v3 = (void *)MEMORY[0x1E4F1CB10];
  id v4 = NSTemporaryDirectory();
  id v5 = [MEMORY[0x1E4F29128] UUID];
  v6 = [v5 UUIDString];
  id v7 = [v4 stringByAppendingPathComponent:v6];
  v8 = [v3 fileURLWithPath:v7];

  id v9 = [v8 URLByAppendingPathExtension:@"usdz"];

  id v10 = [(LPVisualMedia *)self data];
  [v10 writeToURL:v9 atomically:1];

  objc_storeStrong((id *)&self->_temporaryFileURL, v9);

  return v9;
}

- (id)_ensureTemporaryAssetURL
{
  if ([(NSURL *)self->_temporaryFileURL isFileURL])
  {
    v3 = self->_temporaryFileURL;
  }
  else
  {
    v3 = [(LPARAsset *)self _createTemporaryFileAndWriteData];
  }

  return v3;
}

- (BOOL)_isSubstitute
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)LPARAsset;
  [(LPVisualMedia *)&v3 encodeWithCoder:a3];
}

- (LPARAsset)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(LPARAssetProperties);
  v6 = objc_msgSend(v4, "_lp_strictlyDecodeNSStringForKey:", @"accessibilityText");
  [(LPVisualMediaProperties *)v5 setAccessibilityText:v6];

  v11.receiver = self;
  v11.super_class = (Class)LPARAsset;
  id v7 = [(LPVisualMedia *)&v11 initWithCoder:v4 properties:v5];
  v8 = v7;
  if (v7) {
    id v9 = v7;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)LPARAsset;
  if ([(LPVisualMedia *)&v7 isEqual:v4])
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (void).cxx_destruct
{
}

@end