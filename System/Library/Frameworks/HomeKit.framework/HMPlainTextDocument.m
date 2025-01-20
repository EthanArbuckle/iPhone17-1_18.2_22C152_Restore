@interface HMPlainTextDocument
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
- (BOOL)isEqual:(id)a3;
- (HMPlainTextDocument)initWithCoder:(id)a3;
- (HMPlainTextDocument)initWithData:(id)a3 error:(id *)a4;
- (HMPlainTextDocument)initWithString:(id)a3;
- (HMPlainTextDocument)initWithURL:(id)a3 error:(id *)a4;
- (HMPlainTextDocument)initWithURL:(id)a3 fileManager:(id)a4 error:(id *)a5;
- (NSAttributedString)attributedString;
- (NSString)stringValue;
- (_HMDocument)document;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMPlainTextDocument

- (void).cxx_destruct
{
}

- (_HMDocument)document
{
  return (_HMDocument *)objc_getProperty(self, a2, 8, 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMPlainTextDocument *)self stringValue];
  [v4 encodeObject:v5 forKey:@"HM.stringValue"];
}

- (HMPlainTextDocument)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.stringValue"];

  v6 = [(HMPlainTextDocument *)self initWithString:v5];
  return v6;
}

- (NSAttributedString)attributedString
{
  if (UIKitLibraryCore())
  {
    uint64_t v7 = 0;
    v8 = &v7;
    uint64_t v9 = 0x3032000000;
    v10 = __Block_byref_object_copy__25476;
    v11 = __Block_byref_object_dispose__25477;
    id v12 = 0;
    v3 = dispatch_get_global_queue(0, 0);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __39__HMPlainTextDocument_attributedString__block_invoke;
    v6[3] = &unk_1E5940A38;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(v3, v6);

    id v4 = (id)v8[5];
    _Block_object_dispose(&v7, 8);
  }
  else
  {
    id v4 = 0;
  }

  return (NSAttributedString *)v4;
}

void __39__HMPlainTextDocument_attributedString__block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 32);
  v3 = [*(id *)(a1 + 32) stringValue];
  uint64_t v4 = [v3 fastestEncoding];

  id v5 = [*v2 stringValue];
  v6 = [v5 dataUsingEncoding:v4];

  id v7 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  v8 = (id *)getNSDocumentTypeDocumentAttributeSymbolLoc_ptr;
  uint64_t v35 = getNSDocumentTypeDocumentAttributeSymbolLoc_ptr;
  if (!getNSDocumentTypeDocumentAttributeSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getNSDocumentTypeDocumentAttributeSymbolLoc_block_invoke;
    v40 = &unk_1E5943DD8;
    v41 = &v32;
    uint64_t v9 = (void *)UIKitLibrary();
    v10 = dlsym(v9, "NSDocumentTypeDocumentAttribute");
    *(void *)(v41[1] + 24) = v10;
    getNSDocumentTypeDocumentAttributeSymbolLoc_ptr = *(void *)(v41[1] + 24);
    v8 = (id *)v33[3];
  }
  _Block_object_dispose(&v32, 8);
  if (!v8) {
    goto LABEL_15;
  }
  id v11 = *v8;
  id v36 = v11;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  id v12 = (id *)getNSPlainTextDocumentTypeSymbolLoc_ptr;
  uint64_t v35 = getNSPlainTextDocumentTypeSymbolLoc_ptr;
  if (!getNSPlainTextDocumentTypeSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getNSPlainTextDocumentTypeSymbolLoc_block_invoke;
    v40 = &unk_1E5943DD8;
    v41 = &v32;
    v13 = (void *)UIKitLibrary();
    v14 = dlsym(v13, "NSPlainTextDocumentType");
    *(void *)(v41[1] + 24) = v14;
    getNSPlainTextDocumentTypeSymbolLoc_ptr = *(void *)(v41[1] + 24);
    id v12 = (id *)v33[3];
  }
  _Block_object_dispose(&v32, 8);
  if (!v12) {
    goto LABEL_15;
  }
  id v15 = *v12;
  v38[0] = v15;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  v16 = (id *)getNSCharacterEncodingDocumentAttributeSymbolLoc_ptr;
  uint64_t v35 = getNSCharacterEncodingDocumentAttributeSymbolLoc_ptr;
  if (!getNSCharacterEncodingDocumentAttributeSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getNSCharacterEncodingDocumentAttributeSymbolLoc_block_invoke;
    v40 = &unk_1E5943DD8;
    v41 = &v32;
    v17 = (void *)UIKitLibrary();
    v18 = dlsym(v17, "NSCharacterEncodingDocumentAttribute");
    *(void *)(v41[1] + 24) = v18;
    getNSCharacterEncodingDocumentAttributeSymbolLoc_ptr = *(void *)(v41[1] + 24);
    v16 = (id *)v33[3];
  }
  _Block_object_dispose(&v32, 8);
  if (!v16)
  {
LABEL_15:
    dlerror();
    abort_report_np();
    __break(1u);
  }
  id v37 = *v16;
  v19 = NSNumber;
  id v20 = v37;
  v21 = [v19 numberWithUnsignedInteger:v4];
  v38[1] = v21;
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v36 count:2];
  id v31 = 0;
  uint64_t v23 = [v7 initWithData:v6 options:v22 documentAttributes:0 error:&v31];
  id v24 = v31;
  uint64_t v25 = *(void *)(*(void *)(a1 + 40) + 8);
  v26 = *(void **)(v25 + 40);
  *(void *)(v25 + 40) = v23;

  if (v24)
  {
    v27 = (void *)MEMORY[0x19F3A64A0]();
    id v28 = *(id *)(a1 + 32);
    v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v30;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v24;
      _os_log_impl(&dword_19D1A8000, v29, OS_LOG_TYPE_ERROR, "%{public}@Create NSAttributedString failed with error: %@", buf, 0x16u);
    }
  }
}

- (NSString)stringValue
{
  v2 = [(HMPlainTextDocument *)self document];
  v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HMPlainTextDocument *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    v6 = v5;
    if (v6)
    {
      id v7 = [(HMPlainTextDocument *)self document];
      v8 = [(HMPlainTextDocument *)v6 document];
      char v9 = [v7 isEqual:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (unint64_t)hash
{
  v2 = [(HMPlainTextDocument *)self stringValue];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (HMPlainTextDocument)initWithURL:(id)a3 fileManager:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HMPlainTextDocument;
  v10 = [(HMPlainTextDocument *)&v15 init];
  if (v10
    && (id v11 = [[_HMDocument alloc] initWithURL:v8 fileManager:v9 error:a5], document = v10->_document, v10->_document = v11, document, !v10->_document))
  {
    v13 = 0;
  }
  else
  {
    v13 = v10;
  }

  return v13;
}

- (HMPlainTextDocument)initWithURL:(id)a3 error:(id *)a4
{
  v6 = (void *)MEMORY[0x1E4F28CB8];
  id v7 = a3;
  id v8 = [v6 defaultManager];
  id v9 = [(HMPlainTextDocument *)self initWithURL:v7 fileManager:v8 error:a4];

  return v9;
}

- (HMPlainTextDocument)initWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMPlainTextDocument;
  id v7 = [(HMPlainTextDocument *)&v12 init];
  if (v7
    && (id v8 = [[_HMDocument alloc] initWithData:v6 error:a4],
        document = v7->_document,
        v7->_document = v8,
        document,
        !v7->_document))
  {
    v10 = 0;
  }
  else
  {
    v10 = v7;
  }

  return v10;
}

- (HMPlainTextDocument)initWithString:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMPlainTextDocument;
  id v5 = [(HMPlainTextDocument *)&v10 init];
  if (v5
    && (id v6 = [[_HMDocument alloc] initWithString:v4],
        document = v5->_document,
        v5->_document = v6,
        document,
        !v5->_document))
  {
    id v8 = 0;
  }
  else
  {
    id v8 = v5;
  }

  return v8;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_25500 != -1) {
    dispatch_once(&logCategory__hmf_once_t2_25500, &__block_literal_global_25501);
  }
  v2 = (void *)logCategory__hmf_once_v3_25502;

  return v2;
}

uint64_t __34__HMPlainTextDocument_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v3_25502;
  logCategory__hmf_once_v3_25502 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end