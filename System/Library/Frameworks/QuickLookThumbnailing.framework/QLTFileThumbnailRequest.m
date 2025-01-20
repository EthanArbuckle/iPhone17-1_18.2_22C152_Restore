@interface QLTFileThumbnailRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldProvideFoldedGenericIcon;
- (FPItem)item;
- (FPSandboxingURLWrapper)genericSandboxWrapper;
- (FPSandboxingURLWrapper)quicklookSandboxWrapper;
- (QLTFileThumbnailRequest)initWithCoder:(id)a3;
- (QLTFileThumbnailRequest)initWithFileAtURL:(id)a3 size:(CGSize)a4 minimumDimension:(double)a5 scale:(double)a6 iconMode:(BOOL)a7 error:(id *)a8;
- (QLTFileThumbnailRequest)initWithFileAtURL:(id)a3 size:(CGSize)a4 minimumDimension:(double)a5 scale:(double)a6 iconMode:(BOOL)a7 error:(id *)a8 shouldMakeSandboxWrapper:(BOOL)a9;
- (QLTFileThumbnailRequest)initWithFileAtURL:(id)a3 size:(CGSize)a4 scale:(double)a5 iconMode:(BOOL)a6;
- (id)computeContentType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setItem:(id)a3;
@end

@implementation QLTFileThumbnailRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (QLTFileThumbnailRequest)initWithFileAtURL:(id)a3 size:(CGSize)a4 scale:(double)a5 iconMode:(BOOL)a6
{
  return -[QLTFileThumbnailRequest initWithFileAtURL:size:minimumDimension:scale:iconMode:error:](self, "initWithFileAtURL:size:minimumDimension:scale:iconMode:error:", a3, a6, 0, a4.width, a4.height, 0.0, a5);
}

- (QLTFileThumbnailRequest)initWithFileAtURL:(id)a3 size:(CGSize)a4 minimumDimension:(double)a5 scale:(double)a6 iconMode:(BOOL)a7 error:(id *)a8
{
  return -[QLTFileThumbnailRequest initWithFileAtURL:size:minimumDimension:scale:iconMode:error:shouldMakeSandboxWrapper:](self, "initWithFileAtURL:size:minimumDimension:scale:iconMode:error:shouldMakeSandboxWrapper:", a3, a7, a8, 1, a4.width, a4.height, a5, a6);
}

- (QLTFileThumbnailRequest)initWithFileAtURL:(id)a3 size:(CGSize)a4 minimumDimension:(double)a5 scale:(double)a6 iconMode:(BOOL)a7 error:(id *)a8 shouldMakeSandboxWrapper:(BOOL)a9
{
  BOOL v9 = a9;
  BOOL v11 = a7;
  double height = a4.height;
  double width = a4.width;
  id v17 = a3;
  uint64_t v18 = _CFURLPromiseCopyPhysicalURL();
  v19 = (void *)v18;
  if (v18) {
    v20 = (void *)v18;
  }
  else {
    v20 = v17;
  }
  id v21 = v20;

  v22 = [[QLCacheBasicFileIdentifier alloc] initWithFileURL:v21 error:a8];
  if (v22)
  {
    v23 = [[QLThumbnailVersion alloc] initWithFileURL:v17 automaticallyGenerated:1];
    v24 = [[QLCacheBasicVersionedFileIdentifier alloc] initWithFileIdentifier:v22 version:v23];
    v25 = -[QLTThumbnailRequest initWithVersionedFileIdentifier:size:scale:iconMode:flavor:wantsBaseline:minimumDimension:requestedTypes:](self, "initWithVersionedFileIdentifier:size:scale:iconMode:flavor:wantsBaseline:minimumDimension:requestedTypes:", v24, v11, 0, 0, -1, width, height, a6, a5);
    if (!v25)
    {
LABEL_23:
      self = v25;

      v39 = self;
      goto LABEL_24;
    }
    v51 = v23;
    id v26 = objc_alloc_init(MEMORY[0x1E4F28CA0]);
    uint64_t v57 = 0;
    v58[0] = &v57;
    v58[1] = 0x3032000000;
    v58[2] = __Block_byref_object_copy__4;
    v58[3] = __Block_byref_object_dispose__4;
    id v59 = 0;
    v55[4] = &v57;
    id v56 = 0;
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __113__QLTFileThumbnailRequest_initWithFileAtURL_size_minimumDimension_scale_iconMode_error_shouldMakeSandboxWrapper___block_invoke;
    v55[3] = &unk_1E600A610;
    id v50 = v26;
    [v26 coordinateReadingItemAtURL:v17 options:4 error:&v56 byAccessor:v55];
    id v27 = v56;
    unint64_t v28 = 0x1E9C2F000;
    if (*(void *)(v58[0] + 40))
    {
      if (!v9) {
        goto LABEL_17;
      }
      id FPSandboxingURLWrapperClass = getFPSandboxingURLWrapperClass();
      uint64_t v30 = *(void *)(v58[0] + 40);
      id v54 = v27;
      uint64_t v31 = [FPSandboxingURLWrapperClass wrapperWithURL:v30 extensionClass:"com.apple.quicklook.readonly" error:&v54];
      id v32 = v54;

      quicklookSandboxWrapper = v25->_quicklookSandboxWrapper;
      v25->_quicklookSandboxWrapper = (FPSandboxingURLWrapper *)v31;

      id v34 = getFPSandboxingURLWrapperClass();
      uint64_t v35 = *(void *)(v58[0] + 40);
      uint64_t v36 = *MEMORY[0x1E4F14008];
      id v53 = v32;
      uint64_t v37 = [v34 wrapperWithURL:v35 extensionClass:v36 error:&v53];
      id v27 = v53;

      genericSandboxWrapper = v25->_genericSandboxWrapper;
      v25->_genericSandboxWrapper = (FPSandboxingURLWrapper *)v37;

      if (v25->_genericSandboxWrapper)
      {
        unint64_t v28 = 0x1E9C2F000;
        goto LABEL_17;
      }
      v41 = _log();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        -[QLTFileThumbnailRequest initWithFileAtURL:size:minimumDimension:scale:iconMode:error:shouldMakeSandboxWrapper:]((uint64_t)v58, (uint64_t)v27, v41);
      }

      id v42 = getFPSandboxingURLWrapperClass();
      uint64_t v43 = *(void *)(v58[0] + 40);
      uint64_t v44 = *MEMORY[0x1E4F14000];
      id v52 = v27;
      uint64_t v45 = [v42 wrapperWithURL:v43 extensionClass:v44 error:&v52];
      id v46 = v52;

      v40 = v25->_genericSandboxWrapper;
      v25->_genericSandboxWrapper = (FPSandboxingURLWrapper *)v45;
      id v27 = v46;
      unint64_t v28 = 0x1E9C2F000uLL;
    }
    else
    {
      v40 = _log();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        -[QLTFileThumbnailRequest initWithFileAtURL:size:minimumDimension:scale:iconMode:error:shouldMakeSandboxWrapper:]();
      }
    }

LABEL_17:
    uint64_t v47 = *(uint64_t *)((char *)&v25->super.super.isa + *(int *)(v28 + 1440));
    v23 = v51;
    if (!v47 || !v25->_quicklookSandboxWrapper)
    {

      v48 = _log();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
        -[QLThumbnailServiceProxy touchOrAddThumbnailAddition:forURL:]();
      }

      v25 = 0;
    }

    _Block_object_dispose(&v57, 8);
    goto LABEL_23;
  }
  v39 = 0;
LABEL_24:

  return v39;
}

void __113__QLTFileThumbnailRequest_initWithFileAtURL_size_minimumDimension_scale_iconMode_error_shouldMakeSandboxWrapper___block_invoke(uint64_t a1, void *a2)
{
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(QLTFileThumbnailRequest *)self genericSandboxWrapper];
  v7 = [v6 url];
  v8 = [v7 lastPathComponent];
  [(QLTThumbnailRequest *)self size];
  uint64_t v10 = v9;
  [(QLTThumbnailRequest *)self size];
  v12 = (void *)[v3 initWithFormat:@"<%@:%p %@ {%g,%g}>", v5, self, v8, v10, v11];

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  quicklookSandboxWrapper = self->_quicklookSandboxWrapper;
  id v5 = a3;
  [v5 encodeObject:quicklookSandboxWrapper forKey:@"quicklookSandboxWrapper"];
  [v5 encodeObject:self->_genericSandboxWrapper forKey:@"genericSandboxWrapper"];
  v6.receiver = self;
  v6.super_class = (Class)QLTFileThumbnailRequest;
  [(QLTThumbnailRequest *)&v6 encodeWithCoder:v5];
}

- (QLTFileThumbnailRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)QLTFileThumbnailRequest;
  id v5 = [(QLTThumbnailRequest *)&v11 initWithCoder:v4];
  if (v5)
  {
    getFPSandboxingURLWrapperClass();
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"quicklookSandboxWrapper"];
    quicklookSandboxWrapper = v5->_quicklookSandboxWrapper;
    v5->_quicklookSandboxWrapper = (FPSandboxingURLWrapper *)v6;

    getFPSandboxingURLWrapperClass();
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"genericSandboxWrapper"];
    genericSandboxWrapper = v5->_genericSandboxWrapper;
    v5->_genericSandboxWrapper = (FPSandboxingURLWrapper *)v8;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)QLTFileThumbnailRequest;
  id v4 = [(QLTThumbnailRequest *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 12, self->_quicklookSandboxWrapper);
  objc_storeStrong(v4 + 13, self->_genericSandboxWrapper);
  return v4;
}

- (id)computeContentType
{
  v2 = [(QLTFileThumbnailRequest *)self genericSandboxWrapper];
  id v3 = [v2 url];
  id v4 = +[QLUTIAnalyzer UTIForURL:v3];

  return v4;
}

- (BOOL)shouldProvideFoldedGenericIcon
{
  return 1;
}

- (FPSandboxingURLWrapper)quicklookSandboxWrapper
{
  return self->_quicklookSandboxWrapper;
}

- (FPSandboxingURLWrapper)genericSandboxWrapper
{
  return self->_genericSandboxWrapper;
}

- (FPItem)item
{
  return (FPItem *)objc_getProperty(self, a2, 112, 1);
}

- (void)setItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_genericSandboxWrapper, 0);

  objc_storeStrong((id *)&self->_quicklookSandboxWrapper, 0);
}

- (void)initWithFileAtURL:size:minimumDimension:scale:iconMode:error:shouldMakeSandboxWrapper:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1B281E000, v0, v1, "Will not create a FPSandboxingURLWrapper for thumbnail request because no URL was obtained using coordinateReadingItemAtURL for url: %@ (%@).");
}

- (void)initWithFileAtURL:(NSObject *)a3 size:minimumDimension:scale:iconMode:error:shouldMakeSandboxWrapper:.cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138412546;
  *(void *)&v3[4] = *(void *)(*(void *)a1 + 40);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_0(&dword_1B281E000, a2, a3, "Could not create FPSandboxingURLWrapper with write extension for %@ with error %@, thumbnail additions can not be added to this file, falling back to read only", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

@end