@interface TDModelRenditionSpec
+ (id)fetchRequest;
- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5;
- (void)processMesh:(id)a3 withAssetMeshIndex:(unsigned int *)a4 assetKeySpec:(id)a5 inDocument:(id)a6;
- (void)processModelObjectsInDocument:(id)a3;
@end

@implementation TDModelRenditionSpec

+ (id)fetchRequest
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF260]) initWithEntityName:@"ModelIORenditionSpec"];

  return v2;
}

- (void)processMesh:(id)a3 withAssetMeshIndex:(unsigned int *)a4 assetKeySpec:(id)a5 inDocument:(id)a6
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v11 = (void *)[a6 newObjectForEntity:@"ModelIOMeshRenditionSpec"];
  v12 = (void *)[a6 newObjectForEntity:@"RenditionKeySpec"];
  [a5 copyAttributesInto:v12];
  objc_msgSend(v12, "setElement:", objc_msgSend(a6, "elementWithIdentifier:", 164));
  objc_msgSend(v12, "setPart:", objc_msgSend(a6, "partWithIdentifier:", 232));
  [v12 setDimension1:a4];
  [v11 setParentRendition:self];
  [(TDModelRenditionSpec *)self addChildRenditionsObject:v11];
  [v11 setKeySpec:v12];
  objc_msgSend((id)-[TDModelRenditionSpec production](self, "production"), "addRenditionsObject:", v11);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v13 = objc_msgSend(a3, "submeshes", 0);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    int v16 = 0;
    uint64_t v17 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(v11, "processSubMesh:withAssetSubmeshIndex:assetKeySpec:inDocument:", *(void *)(*((void *)&v19 + 1) + 8 * i), (v16 + i), objc_msgSend(v11, "keySpec"), a6);
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
      v16 += i;
    }
    while (v15);
  }
}

- (void)processModelObjectsInDocument:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v5 = (void *)[a3 _cachedModelAssets];
  uint64_t v6 = objc_msgSend((id)-[TDModelRenditionSpec asset](self, "asset"), "fileURLWithDocument:", a3);
  uint64_t v7 = [objc_alloc(MEMORY[0x263F135E8]) initWithURL:v6];
  if (v7)
  {
    v8 = (void *)v7;
    [v5 addObject:v7];
    -[TDModelRenditionSpec setModelAssetIndex:](self, "setModelAssetIndex:", [v5 count] - 1);
    v9 = (void *)[v8 childObjectsOfClass:objc_opt_class()];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      int v12 = 0;
      uint64_t v13 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v9);
          }
          [(TDModelRenditionSpec *)self processMesh:*(void *)(*((void *)&v15 + 1) + 8 * i) withAssetMeshIndex:(v12 + i) assetKeySpec:[(TDModelRenditionSpec *)self keySpec] inDocument:a3];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
        v12 += i;
      }
      while (v11);
    }
  }
  else
  {
    NSLog(&cfstr_CouldnTLoadAss.isa, v6);
  }
}

- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a5, "_cachedModelAssets", a3, a4), "objectAtIndex:", (int)-[TDModelRenditionSpec modelAssetIndex](self, "modelAssetIndex"));
  v8 = (void *)[(TDModelRenditionSpec *)self childRenditions];
  v9 = (void *)[objc_alloc(MEMORY[0x263F38370]) initWithModelAsset:v7];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(v9, "addMeshReference:", objc_msgSend(MEMORY[0x263F383B8], "renditionKeyWithKeyList:", objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v13++), "keySpec"), "key")));
      }
      while (v11 != v13);
      uint64_t v11 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
  objc_msgSend(v9, "setTargetPlatform:", objc_msgSend(a5, "targetPlatform"));
  [v9 setCompressionType:2];
  uint64_t v14 = (void *)[v9 CSIRepresentationWithCompression:1];

  return v14;
}

@end