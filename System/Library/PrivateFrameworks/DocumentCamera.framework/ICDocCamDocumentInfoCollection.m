@interface ICDocCamDocumentInfoCollection
+ (BOOL)supportsSecureCoding;
+ (ICDocCamDocumentInfoCollection)infoCollectionWithArchivedDocumentCameraScanData:(id)a3 imageCache:(id)a4 error:(id *)a5;
+ (id)infoCollectionFromArchiveSidecarItems:(id)a3 imageCache:(id)a4;
+ (void)infoCollectionFromImageSidecarItems:(id)a3 imageCache:(id)a4 completion:(id)a5;
+ (void)infoCollectionFromSidecarItems:(id)a3 imageCache:(id)a4 completion:(id)a5;
- (ICDocCamDocumentInfoCollection)init;
- (ICDocCamDocumentInfoCollection)initWithCoder:(id)a3;
- (NSDate)creationDate;
- (NSDate)modificationDate;
- (NSMutableArray)docInfos;
- (NSString)title;
- (NSString)uniqueIdentifier;
- (int64_t)docCamPDFVersion;
- (void)bumpModificationDate;
- (void)encodeWithCoder:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setDocInfos:(id)a3;
- (void)setModificationDate:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
@end

@implementation ICDocCamDocumentInfoCollection

- (int64_t)docCamPDFVersion
{
  v2 = [(ICDocCamDocumentInfoCollection *)self modificationDate];
  [v2 timeIntervalSince1970];
  int64_t v4 = (uint64_t)v3;

  return v4;
}

- (ICDocCamDocumentInfoCollection)init
{
  v13.receiver = self;
  v13.super_class = (Class)ICDocCamDocumentInfoCollection;
  v2 = [(ICDocCamDocumentInfoCollection *)&v13 init];
  double v3 = v2;
  if (v2)
  {
    title = v2->_title;
    v2->_title = 0;

    uint64_t v5 = [MEMORY[0x263EFF910] date];
    creationDate = v3->_creationDate;
    v3->_creationDate = (NSDate *)v5;

    objc_storeStrong((id *)&v3->_modificationDate, v3->_creationDate);
    v7 = [MEMORY[0x263F08C38] UUID];
    uint64_t v8 = [v7 UUIDString];
    uniqueIdentifier = v3->_uniqueIdentifier;
    v3->_uniqueIdentifier = (NSString *)v8;

    uint64_t v10 = [MEMORY[0x263EFF980] array];
    docInfos = v3->_docInfos;
    v3->_docInfos = (NSMutableArray *)v10;
  }
  return v3;
}

+ (ICDocCamDocumentInfoCollection)infoCollectionWithArchivedDocumentCameraScanData:(id)a3 imageCache:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [[VNDocumentCameraScan alloc] initWithArchivedData:v8 error:a5];

  uint64_t v10 = [(VNDocumentCameraScan *)v9 infoCollectionWithImageCache:v7 error:a5];

  return (ICDocCamDocumentInfoCollection *)v10;
}

- (void)bumpModificationDate
{
  id v3 = [MEMORY[0x263EFF910] date];
  [(ICDocCamDocumentInfoCollection *)self setModificationDate:v3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICDocCamDocumentInfoCollection)initWithCoder:(id)a3
{
  v16[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICDocCamDocumentInfoCollection;
  uint64_t v5 = [(ICDocCamDocumentInfoCollection *)&v15 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kTitleFieldCodingKey"];
    [(ICDocCamDocumentInfoCollection *)v5 setTitle:v6];

    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCreationDateFieldCodingKey"];
    [(ICDocCamDocumentInfoCollection *)v5 setCreationDate:v7];

    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kModificationDateFieldCodingKey"];
    [(ICDocCamDocumentInfoCollection *)v5 setModificationDate:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kUniqueIdentifierFieldCodingKey"];
    [(ICDocCamDocumentInfoCollection *)v5 setUniqueIdentifier:v9];

    uint64_t v10 = (void *)MEMORY[0x263EFFA08];
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
    v12 = [v10 setWithArray:v11];
    objc_super v13 = [v4 decodeObjectOfClasses:v12 forKey:@"kDocInfosFieldCodingKey"];
    [(ICDocCamDocumentInfoCollection *)v5 setDocInfos:v13];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICDocCamDocumentInfoCollection *)self title];
  [v4 encodeObject:v5 forKey:@"kTitleFieldCodingKey"];

  v6 = [(ICDocCamDocumentInfoCollection *)self creationDate];
  [v4 encodeObject:v6 forKey:@"kCreationDateFieldCodingKey"];

  id v7 = [(ICDocCamDocumentInfoCollection *)self modificationDate];
  [v4 encodeObject:v7 forKey:@"kModificationDateFieldCodingKey"];

  id v8 = [(ICDocCamDocumentInfoCollection *)self uniqueIdentifier];
  [v4 encodeObject:v8 forKey:@"kUniqueIdentifierFieldCodingKey"];

  id v10 = [(ICDocCamDocumentInfoCollection *)self docInfos];
  v9 = (void *)[v10 copy];
  [v4 encodeObject:v9 forKey:@"kDocInfosFieldCodingKey"];
}

+ (void)infoCollectionFromSidecarItems:(id)a3 imageCache:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  v11 = [a1 infoCollectionFromArchiveSidecarItems:v8 imageCache:v9];
  if (v11)
  {
    if (v10) {
      v10[2](v10, v11);
    }
  }
  else
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __87__ICDocCamDocumentInfoCollection_infoCollectionFromSidecarItems_imageCache_completion___block_invoke;
    v12[3] = &unk_2642A9F70;
    objc_super v13 = v10;
    [a1 infoCollectionFromImageSidecarItems:v8 imageCache:v9 completion:v12];
  }
}

uint64_t __87__ICDocCamDocumentInfoCollection_infoCollectionFromSidecarItems_imageCache_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (id)infoCollectionFromArchiveSidecarItems:(id)a3 imageCache:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = os_log_create("com.apple.documentcamera", "");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    +[ICDocCamDocumentInfoCollection infoCollectionFromArchiveSidecarItems:imageCache:].cold.5(v5);
  }

  id v8 = objc_msgSend(v5, "dc_objectPassingTest:", &__block_literal_global_14);
  id v9 = [v8 data];

  if (v9)
  {
    id v10 = [VNDocumentCameraScan alloc];
    v11 = [v8 data];
    id v21 = 0;
    v12 = [(VNDocumentCameraScan *)v10 initWithArchivedData:v11 error:&v21];
    objc_super v13 = v21;

    if (v12)
    {
      v20 = v13;
      v14 = [(VNDocumentCameraScan *)v12 infoCollectionWithImageCache:v6 error:&v20];
      objc_super v15 = v20;

      v16 = os_log_create("com.apple.documentcamera", "");
      v17 = v16;
      if (v14)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          +[ICDocCamDocumentInfoCollection infoCollectionFromArchiveSidecarItems:imageCache:].cold.4();
        }

        v14 = v14;
        v18 = v14;
      }
      else
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          +[ICDocCamDocumentInfoCollection infoCollectionFromArchiveSidecarItems:imageCache:]();
        }

        v18 = 0;
      }
    }
    else
    {
      v14 = os_log_create("com.apple.documentcamera", "");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        +[ICDocCamDocumentInfoCollection infoCollectionFromArchiveSidecarItems:imageCache:]();
      }
      v18 = 0;
      objc_super v15 = v13;
    }
  }
  else
  {
    objc_super v15 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[ICDocCamDocumentInfoCollection infoCollectionFromArchiveSidecarItems:imageCache:]();
    }
    v18 = 0;
  }

  return v18;
}

uint64_t __83__ICDocCamDocumentInfoCollection_infoCollectionFromArchiveSidecarItems_imageCache___block_invoke(uint64_t a1, void *a2)
{
  return [a2 conformsToType:@"com.apple.DocumentCamera.scan-archive"];
}

+ (void)infoCollectionFromImageSidecarItems:(id)a3 imageCache:(id)a4 completion:(id)a5
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v34 = a4;
  id v32 = a5;
  id v8 = os_log_create("com.apple.documentcamera", "");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    +[ICDocCamDocumentInfoCollection infoCollectionFromImageSidecarItems:imageCache:completion:](v7);
  }

  id v9 = dispatch_group_create();
  v33 = [MEMORY[0x263EFF980] array];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v45;
    v14 = (void *)*MEMORY[0x263F1DB40];
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v45 != v13) {
          objc_enumerationMutation(v10);
        }
        v16 = *(void **)(*((void *)&v44 + 1) + 8 * v15);
        v17 = objc_msgSend(v14, "identifier", v32);
        if ([v16 conformsToType:v17])
        {

LABEL_14:
          id v22 = objc_alloc(MEMORY[0x263F1C6B0]);
          v23 = [v16 data];
          os_log_t v21 = (os_log_t)[v22 initWithData:v23];

          if (v21)
          {
            dispatch_group_enter(v9);
            v24 = objc_alloc_init(ICDocCamDocumentInfo);
            v38[0] = MEMORY[0x263EF8330];
            v38[1] = 3221225472;
            v38[2] = __92__ICDocCamDocumentInfoCollection_infoCollectionFromImageSidecarItems_imageCache_completion___block_invoke;
            v38[3] = &unk_2642A9FB8;
            v39 = v24;
            id v40 = v33;
            v41 = v9;
            os_log_t v20 = v24;
            v25 = [v34 setImage:v21 metaData:MEMORY[0x263EFFA78] addToMemoryCache:0 completion:v38];
            [v20 setFullImageUUID:v25];
          }
          else
          {
            os_log_t v20 = os_log_create("com.apple.documentcamera", "");
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
              +[ICDocCamDocumentInfoCollection infoCollectionFromImageSidecarItems:imageCache:completion:](&v42, v43, v20);
            }
          }
          goto LABEL_18;
        }
        v18 = [v16 data];
        uint64_t v19 = [v18 length];

        if (!v19) {
          goto LABEL_14;
        }
        os_log_t v20 = os_log_create("com.apple.documentcamera", "");
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          v26 = [v16 type];
          v27 = NSNumber;
          v28 = [v16 data];
          v29 = objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v28, "length"));
          *(_DWORD *)buf = 138412546;
          v49 = v26;
          __int16 v50 = 2112;
          v51 = v29;
          _os_log_debug_impl(&dword_217885000, v20, OS_LOG_TYPE_DEBUG, "Item data doesn't conform to JPEG — skipping {type: %@, data.length: %@}", buf, 0x16u);
        }
        os_log_t v21 = v20;
LABEL_18:

        ++v15;
      }
      while (v12 != v15);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v44 objects:v52 count:16];
    }
    while (v12);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __92__ICDocCamDocumentInfoCollection_infoCollectionFromImageSidecarItems_imageCache_completion___block_invoke_201;
  block[3] = &unk_2642A9310;
  id v36 = v33;
  id v37 = v32;
  id v30 = v32;
  id v31 = v33;
  dispatch_group_notify(v9, MEMORY[0x263EF83A0], block);
}

void __92__ICDocCamDocumentInfoCollection_infoCollectionFromImageSidecarItems_imageCache_completion___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) fullImageUUID];
    [*(id *)(a1 + 32) setCroppedAndFilteredImageUUID:v3];

    [*(id *)(a1 + 40) addObject:*(void *)(a1 + 32)];
  }
  else
  {
    id v4 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __92__ICDocCamDocumentInfoCollection_infoCollectionFromImageSidecarItems_imageCache_completion___block_invoke_cold_1();
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __92__ICDocCamDocumentInfoCollection_infoCollectionFromImageSidecarItems_imageCache_completion___block_invoke_201(uint64_t a1)
{
  if (![*(id *)(a1 + 32) count])
  {
    v2 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __92__ICDocCamDocumentInfoCollection_infoCollectionFromImageSidecarItems_imageCache_completion___block_invoke_201_cold_2();
    }

    uint64_t v3 = *(void *)(a1 + 40);
    if (v3) {
      (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
    }
  }
  id v4 = objc_alloc_init(ICDocCamDocumentInfoCollection);
  id v5 = (void *)[*(id *)(a1 + 32) mutableCopy];
  [(ICDocCamDocumentInfoCollection *)v4 setDocInfos:v5];

  id v6 = os_log_create("com.apple.documentcamera", "");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __92__ICDocCamDocumentInfoCollection_infoCollectionFromImageSidecarItems_imageCache_completion___block_invoke_201_cold_1();
  }

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, ICDocCamDocumentInfoCollection *))(v7 + 16))(v7, v4);
  }
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(id)a3
{
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (NSMutableArray)docInfos
{
  return self->_docInfos;
}

- (void)setDocInfos:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_docInfos, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

+ (void)infoCollectionFromArchiveSidecarItems:imageCache:.cold.1()
{
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_217885000, v0, OS_LOG_TYPE_ERROR, "Item doesn't have data — returning", v1, 2u);
}

+ (void)infoCollectionFromArchiveSidecarItems:imageCache:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_217885000, v0, OS_LOG_TYPE_ERROR, "Cannot convert item data to scan document — returning {error: %@}", v1, 0xCu);
}

+ (void)infoCollectionFromArchiveSidecarItems:imageCache:.cold.3()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_217885000, v0, OS_LOG_TYPE_ERROR, "Cannot convert scan document to info collection — returning {error: %@}", v1, 0xCu);
}

+ (void)infoCollectionFromArchiveSidecarItems:imageCache:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_217885000, v0, v1, "Created info collection from archive sidecar item", v2, v3, v4, v5, v6);
}

+ (void)infoCollectionFromArchiveSidecarItems:(void *)a1 imageCache:.cold.5(void *a1)
{
  uint64_t v1 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_217885000, v2, v3, "Collecting info collection for scan archive items… {#items: %@}", v4, v5, v6, v7, v8);
}

+ (void)infoCollectionFromImageSidecarItems:(uint8_t *)buf imageCache:(unsigned char *)a2 completion:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_217885000, log, OS_LOG_TYPE_ERROR, "Item data cannot be converted to image — skipping", buf, 2u);
}

+ (void)infoCollectionFromImageSidecarItems:(void *)a1 imageCache:completion:.cold.2(void *a1)
{
  uint64_t v1 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_217885000, v2, v3, "Collecting info collection for image sidecar items… {#items: %@}", v4, v5, v6, v7, v8);
}

void __92__ICDocCamDocumentInfoCollection_infoCollectionFromImageSidecarItems_imageCache_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_217885000, v0, OS_LOG_TYPE_ERROR, "Cannot set image for cache — skipping", v1, 2u);
}

void __92__ICDocCamDocumentInfoCollection_infoCollectionFromImageSidecarItems_imageCache_completion___block_invoke_201_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_217885000, v0, v1, "Created info collection from image sidecar items", v2, v3, v4, v5, v6);
}

void __92__ICDocCamDocumentInfoCollection_infoCollectionFromImageSidecarItems_imageCache_completion___block_invoke_201_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_217885000, v0, v1, "Didn't find any suitable sidecar items", v2, v3, v4, v5, v6);
}

@end