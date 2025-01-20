@interface MADCoreMLRequest
+ (BOOL)supportsSecureCoding;
+ (id)requestWithModelURL:(id)a3 error:(id *)a4;
- (MADCoreMLRequest)initWithCoder:(id)a3;
- (MADCoreMLRequest)initWithModelURL:(id)a3 error:(id *)a4;
- (NSURL)modelURL;
- (id)_extensionData;
- (id)description;
- (void)_extensionData;
- (void)consumeSandboxExtension;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADCoreMLRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADCoreMLRequest)initWithModelURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MADCoreMLRequest;
  v7 = [(MADCoreMLRequest *)&v12 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_modelURL, a3);
    uint64_t v9 = [(MADCoreMLRequest *)v8 _extensionData];
    extensionData = v8->_extensionData;
    v8->_extensionData = (NSData *)v9;
  }
  return v8;
}

+ (id)requestWithModelURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithModelURL:v6 error:a4];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MADCoreMLRequest;
  [(MADRequest *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_modelURL forKey:@"ModelURL"];
  [v4 encodeObject:self->_extensionData forKey:@"ModelURLExtensionData"];
}

- (MADCoreMLRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MADCoreMLRequest;
  objc_super v5 = [(MADRequest *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ModelURL"];
    modelURL = v5->_modelURL;
    v5->_modelURL = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ModelURLExtensionData"];
    extensionData = v5->_extensionData;
    v5->_extensionData = (NSData *)v8;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  uint64_t v6 = [(NSURL *)self->_modelURL description];
  v7 = [v3 stringWithFormat:@"%@-%@", v5, v6];

  return v7;
}

- (id)_extensionData
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    -[MADCoreMLRequest _extensionData]((uint64_t)self);
  }
  p_modelURL = (uint64_t *)&self->_modelURL;
  id v4 = [(NSURL *)self->_modelURL path];
  [v4 UTF8String];
  objc_super v5 = (void *)sandbox_extension_issue_file();

  if (v5)
  {
    uint64_t v6 = [NSString stringWithUTF8String:v5];
    free(v5);
    if ([v6 length])
    {
      v7 = (void *)MEMORY[0x1E4F1C9B8];
      id v8 = v6;
      uint64_t v9 = objc_msgSend(v7, "dataWithBytes:length:", objc_msgSend(v8, "UTF8String"), strlen((const char *)objc_msgSend(v8, "UTF8String")) + 1);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[MADCoreMLRequest _extensionData](p_modelURL);
      }
      uint64_t v9 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[MADCoreMLRequest _extensionData](p_modelURL);
    }
    uint64_t v9 = 0;
  }
  return v9;
}

- (void)consumeSandboxExtension
{
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelURL, 0);
  objc_storeStrong((id *)&self->_extensionData, 0);
}

- (void)_extensionData
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = 138412290;
  uint64_t v3 = v1;
  _os_log_debug_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "[MADCoreMLRequest] Getting sandbox extension - %@", (uint8_t *)&v2, 0xCu);
}

@end