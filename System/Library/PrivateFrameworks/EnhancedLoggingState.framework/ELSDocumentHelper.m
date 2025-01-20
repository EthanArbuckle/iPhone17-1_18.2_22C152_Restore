@interface ELSDocumentHelper
+ (id)sharedHelper;
- (NSArray)contentsText;
- (NSMutableData)pdfData;
- (NSString)fullName;
- (NSURL)tempURL;
- (UIImage)imageSignature;
- (WKWebView)webView;
- (id)initSingleton;
- (id)saveData:(id)a3 toFilePath:(id)a4;
- (void)setContentsText:(id)a3;
- (void)setFullName:(id)a3;
- (void)setImageSignature:(id)a3;
- (void)setPdfData:(id)a3;
- (void)setTempURL:(id)a3;
- (void)setWebView:(id)a3;
@end

@implementation ELSDocumentHelper

+ (id)sharedHelper
{
  if (sharedHelper_onceToken != -1) {
    dispatch_once(&sharedHelper_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedHelper_singleton;
  return v2;
}

uint64_t __33__ELSDocumentHelper_sharedHelper__block_invoke()
{
  sharedHelper_singleton = [[ELSDocumentHelper alloc] initSingleton];
  return MEMORY[0x270F9A758]();
}

- (id)initSingleton
{
  v6.receiver = self;
  v6.super_class = (Class)ELSDocumentHelper;
  v2 = [(ELSDocumentHelper *)&v6 init];
  if (v2)
  {
    +[ELSEntitlementUtilities assertCurrentProcessHasEntitlement];
    uint64_t v3 = [MEMORY[0x263EFF990] data];
    pdfData = v2->_pdfData;
    v2->_pdfData = (NSMutableData *)v3;
  }
  return v2;
}

- (id)saveData:(id)a3 toFilePath:(id)a4
{
  id v5 = a4;
  objc_super v6 = (void *)MEMORY[0x263F08850];
  id v7 = a3;
  v8 = [v6 defaultManager];
  v9 = [v5 path];
  char v10 = [v8 createFileAtPath:v9 contents:v7 attributes:0];

  v11 = 0;
  if ((v10 & 1) == 0)
  {
    v12 = (void *)MEMORY[0x263F087E8];
    v13 = (void *)[@"com.apple.EnhancedLoggingState" copy];
    v11 = [v12 errorWithDomain:v13 code:4 userInfo:0];

    v14 = ELSLogHandleForCategory(11);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ELSDocumentHelper saveData:toFilePath:](v5, v14);
    }
  }
  return v11;
}

- (NSArray)contentsText
{
  return self->_contentsText;
}

- (void)setContentsText:(id)a3
{
}

- (NSString)fullName
{
  return self->_fullName;
}

- (void)setFullName:(id)a3
{
}

- (UIImage)imageSignature
{
  return self->_imageSignature;
}

- (void)setImageSignature:(id)a3
{
}

- (NSMutableData)pdfData
{
  return self->_pdfData;
}

- (void)setPdfData:(id)a3
{
}

- (NSURL)tempURL
{
  return self->_tempURL;
}

- (void)setTempURL:(id)a3
{
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_tempURL, 0);
  objc_storeStrong((id *)&self->_pdfData, 0);
  objc_storeStrong((id *)&self->_imageSignature, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_contentsText, 0);
}

- (void)saveData:(void *)a1 toFilePath:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 absoluteString];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_21F731000, a2, OS_LOG_TYPE_ERROR, "Cannot write the data to file at path: %@", (uint8_t *)&v4, 0xCu);
}

@end