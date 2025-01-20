@interface SCNScene(AVTExtensionMRR)
+ (id)avt_newSceneWithURL:()AVTExtensionMRR options:error:;
+ (id)avt_nodeNamed:()AVTExtensionMRR forSceneAtURL:options:error:;
+ (id)avt_rootNodeForSceneAtURL:()AVTExtensionMRR options:error:;
+ (uint64_t)avt_rootObjectForSceneAtURL:()AVTExtensionMRR options:error:;
- (uint64_t)avt_writeByArchivingRootNodeInsteadOfScene:()AVTExtensionMRR toURL:options:error:;
@end

@implementation SCNScene(AVTExtensionMRR)

+ (uint64_t)avt_rootObjectForSceneAtURL:()AVTExtensionMRR options:error:
{
  v8 = (void *)[a3 pathExtension];
  if ([v8 hasPrefix:@"scn"])
  {
    v9 = (void *)[MEMORY[0x263EFF8F8] dataWithContentsOfURL:a3 options:1 error:a5];
    if ([v8 isEqualToString:@"scnz"]) {
      v9 = objc_msgSend(v9, "scn_uncompressedDataUsingCompressionAlgorithm:", 517);
    }
    v10 = (void *)[objc_alloc(MEMORY[0x263F16A68]) initForReadingWithData:v9 secure:0];
    [v10 setDocumentURL:a3];
    v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_msgSend(v10, "decodeObjectOfClasses:forKey:", objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0), *MEMORY[0x263F081D0]);
    [v10 finishDecoding];

    return v13;
  }
  else
  {
    v15 = (void *)MEMORY[0x263F16AD8];
    return [v15 sceneWithURL:a3 options:a4 error:a5];
  }
}

+ (id)avt_newSceneWithURL:()AVTExtensionMRR options:error:
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v9 = (void *)MEMORY[0x2105397E0]();
  v10 = objc_msgSend(a1, "avt_rootObjectForSceneAtURL:options:error:", a3, a4, a5);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v10;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = objc_alloc_init((Class)a1);
      uint64_t v12 = (void *)[v11 rootNode];
      uint64_t v13 = (void *)[v10 childNodes];
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v21 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            [v18 removeFromParentNode];
            [v12 addChildNode:v18];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v15);
      }
    }
    else
    {
      id v11 = 0;
    }
  }
  return v11;
}

+ (id)avt_rootNodeForSceneAtURL:()AVTExtensionMRR options:error:
{
  v9 = (void *)MEMORY[0x2105397E0]();
  v10 = objc_msgSend(a1, "avt_rootObjectForSceneAtURL:options:error:", a3, a4, a5);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = (id)[v10 rootNode];
    id v12 = v11;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }
  }
  return v11;
}

+ (id)avt_nodeNamed:()AVTExtensionMRR forSceneAtURL:options:error:
{
  id v11 = (void *)MEMORY[0x2105397E0]();
  id v12 = objc_msgSend(a1, "avt_rootObjectForSceneAtURL:options:error:", a4, a5, a6);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = (void *)[v12 rootNode];
LABEL_4:
    uint64_t v13 = (void *)[v12 childNodeWithName:a3 recursively:1];
    id v14 = v13;
    [v13 removeFromParentNode];
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_4;
  }
  uint64_t v13 = 0;
LABEL_6:
  return v13;
}

- (uint64_t)avt_writeByArchivingRootNodeInsteadOfScene:()AVTExtensionMRR toURL:options:error:
{
  id v11 = (void *)[a4 pathExtension];
  int v12 = [v11 hasPrefix:@"scn"];
  if (a3 && v12)
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x263F16A60], "archivedDataWithRootObject:options:", objc_msgSend(a1, "rootNode"), a5);
    if ([v11 isEqualToString:@"scnz"]) {
      uint64_t v13 = objc_msgSend(v13, "scn_compressedDataUsingCompressionAlgorithm:", 517);
    }
    return [v13 writeToURL:a4 options:1 error:a6];
  }
  else
  {
    return [a1 writeToURL:a4 options:a5 delegate:0 progressHandler:0];
  }
}

@end