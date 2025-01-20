@interface DOCThumbnailRequest
+ (id)iconRequestForNode:(id)a3 descriptor:(id)a4 thumbnailGenerator:(id)a5;
+ (id)iconRequestForURL:(id)a3 descriptor:(id)a4 thumbnailGenerator:(id)a5;
+ (id)requestForNode:(id)a3 descriptor:(id)a4 thumbnailGenerator:(id)a5;
- (id)thumbnailGenerationRequiresDownloadHandler;
- (void)generateThumbnailWithCompletionHandler:(id)a3;
- (void)setThumbnailGenerationRequiresDownloadHandler:(id)a3;
@end

@implementation DOCThumbnailRequest

- (void).cxx_destruct
{
}

+ (id)requestForNode:(id)a3 descriptor:(id)a4 thumbnailGenerator:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"DOCThumbnailRequest.m", 58, @"Invalid parameter not satisfying: %@", @"node" object file lineNumber description];
  }
  if ([v9 isActionable])
  {
    if (v10) {
      goto LABEL_5;
    }
LABEL_21:
    v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2, a1, @"DOCThumbnailRequest.m", 60, @"Invalid parameter not satisfying: %@", @"descriptor" object file lineNumber description];

    if (v11) {
      goto LABEL_6;
    }
LABEL_22:
    v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2, a1, @"DOCThumbnailRequest.m", 61, @"Invalid parameter not satisfying: %@", @"thumbnailGenerator" object file lineNumber description];

    goto LABEL_6;
  }
  v20 = [MEMORY[0x263F08690] currentHandler];
  [v20 handleFailureInMethod:a2 object:a1 file:@"DOCThumbnailRequest.m" lineNumber:59 description:@"Attempting to generate a thumbnail request for a non-actionable node"];

  if (!v10) {
    goto LABEL_21;
  }
LABEL_5:
  if (!v11) {
    goto LABEL_22;
  }
LABEL_6:
  if ([v9 isRootItem])
  {
    a1 = [v9 providerID];
    int v12 = [a1 isEqualToString:*MEMORY[0x263F3AB10]];

    if (v12)
    {
      v13 = [[DOCVolumeThumbnailRequest alloc] initWithDescriptor:v10];
LABEL_14:
      a1 = v13;
      goto LABEL_15;
    }
  }
  unint64_t v14 = objc_msgSend(v9, "doc_folderIconType");
  unint64_t v15 = v14;
  if (v14 - 2 < 4)
  {
    v16 = [DOCStaticBadgedFolderThumbnailRequest alloc];
    uint64_t v17 = v15;
LABEL_11:
    v13 = [(DOCStaticBadgedFolderThumbnailRequest *)v16 initWithFolderType:v17 descriptor:v10];
    goto LABEL_14;
  }
  if (v14 < 2)
  {
    v13 = [[DOCRegularNodeThumbnailRequest alloc] initWithNode:v9 descriptor:v10 thumbnailGenerator:v11];
    goto LABEL_14;
  }
  if (v14 == 6)
  {
    v16 = [DOCStaticBadgedFolderThumbnailRequest alloc];
    uint64_t v17 = 6;
    goto LABEL_11;
  }
LABEL_15:

  return a1;
}

- (void)setThumbnailGenerationRequiresDownloadHandler:(id)a3
{
}

+ (id)iconRequestForNode:(id)a3 descriptor:(id)a4 thumbnailGenerator:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_11:
    v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"DOCThumbnailRequest.m", 110, @"Invalid parameter not satisfying: %@", @"descriptor" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_12;
  }
  uint64_t v17 = [MEMORY[0x263F08690] currentHandler];
  [v17 handleFailureInMethod:a2, a1, @"DOCThumbnailRequest.m", 109, @"Invalid parameter not satisfying: %@", @"node" object file lineNumber description];

  if (!v10) {
    goto LABEL_11;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_12:
  v19 = [MEMORY[0x263F08690] currentHandler];
  [v19 handleFailureInMethod:a2, a1, @"DOCThumbnailRequest.m", 111, @"Invalid parameter not satisfying: %@", @"thumbnailGenerator" object file lineNumber description];

LABEL_4:
  int v12 = [v9 contentType];
  int v13 = [v12 conformsToType:*MEMORY[0x263F1DAB0]];

  if (v13) {
    unint64_t v14 = [[DOCPlainFolderThumbnailRequest alloc] initWithDescriptor:v10];
  }
  else {
    unint64_t v14 = [[DOCIconThumbnailRequest alloc] initWithNode:v9 descriptor:v10 thumbnailGenerator:v11];
  }
  unint64_t v15 = v14;

  return v15;
}

+ (id)iconRequestForURL:(id)a3 descriptor:(id)a4 thumbnailGenerator:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_13:
    v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"DOCThumbnailRequest.m", 91, @"Invalid parameter not satisfying: %@", @"descriptor" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_14;
  }
  v18 = [MEMORY[0x263F08690] currentHandler];
  [v18 handleFailureInMethod:a2, a1, @"DOCThumbnailRequest.m", 90, @"Invalid parameter not satisfying: %@", @"url" object file lineNumber description];

  if (!v10) {
    goto LABEL_13;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_14:
  v20 = [MEMORY[0x263F08690] currentHandler];
  [v20 handleFailureInMethod:a2, a1, @"DOCThumbnailRequest.m", 92, @"Invalid parameter not satisfying: %@", @"thumbnailGenerator" object file lineNumber description];

LABEL_4:
  id v21 = 0;
  int v12 = [v9 getPromisedItemResourceValue:&v21 forKey:*MEMORY[0x263EFF608] error:0];
  id v13 = v21;
  unint64_t v14 = v13;
  unint64_t v15 = 0;
  if (v12)
  {
    if ([v13 conformsToType:*MEMORY[0x263F1DAB0]]) {
      v16 = [[DOCPlainFolderThumbnailRequest alloc] initWithDescriptor:v10];
    }
    else {
      v16 = [[DOCIconThumbnailRequest alloc] initWithURL:v9 descriptor:v10 thumbnailGenerator:v11];
    }
    unint64_t v15 = v16;
  }

  return v15;
}

- (void)generateThumbnailWithCompletionHandler:(id)a3
{
  objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = NSStringFromSelector(a2);
  [v6 handleFailureInMethod:a2, self, @"DOCThumbnailRequest.m", 123, @"Subclasses should override %@", v5 object file lineNumber description];
}

- (id)thumbnailGenerationRequiresDownloadHandler
{
  return self->_thumbnailGenerationRequiresDownloadHandler;
}

@end