@interface UIDocumentProperties(SwiftUI)
- (uint64_t)initWithTitle:()SwiftUI iconProvider:imageProvider:;
@end

@implementation UIDocumentProperties(SwiftUI)

- (uint64_t)initWithTitle:()SwiftUI iconProvider:imageProvider:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2050000000;
  v11 = (void *)getLPLinkMetadataClass_softClass;
  uint64_t v20 = getLPLinkMetadataClass_softClass;
  if (!getLPLinkMetadataClass_softClass)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __getLPLinkMetadataClass_block_invoke;
    v16[3] = &unk_1E53B8560;
    v16[4] = &v17;
    __getLPLinkMetadataClass_block_invoke((uint64_t)v16);
    v11 = (void *)v18[3];
  }
  v12 = v11;
  _Block_object_dispose(&v17, 8);
  id v13 = objc_alloc_init(v12);
  [v13 setTitle:v8];
  [v13 setIconProvider:v9];
  [v13 setImageProvider:v10];
  uint64_t v14 = [a1 initWithMetadata:v13];

  return v14;
}

@end