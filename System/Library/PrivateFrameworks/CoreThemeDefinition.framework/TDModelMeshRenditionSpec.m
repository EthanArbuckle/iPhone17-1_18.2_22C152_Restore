@interface TDModelMeshRenditionSpec
+ (id)fetchRequest;
- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5;
- (void)processSubMesh:(id)a3 withAssetSubmeshIndex:(unsigned int *)a4 assetKeySpec:(id)a5 inDocument:(id)a6;
@end

@implementation TDModelMeshRenditionSpec

- (void)processSubMesh:(id)a3 withAssetSubmeshIndex:(unsigned int *)a4 assetKeySpec:(id)a5 inDocument:(id)a6
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v11 = (void *)[a6 newObjectForEntity:@"ModelIOSubmeshRenditionSpec"];
  v12 = (void *)[a6 newObjectForEntity:@"RenditionKeySpec"];
  [a5 copyAttributesInto:v12];
  objc_msgSend(v12, "setElement:", objc_msgSend(a6, "elementWithIdentifier:", 164));
  id v28 = a6;
  objc_msgSend(v12, "setPart:", objc_msgSend(a6, "partWithIdentifier:", 233));
  [v12 setDimension2:a4];
  [v11 setParentRendition:self];
  [(TDModelMeshRenditionSpec *)self addSubmeshesObject:v11];
  [v11 setKeySpec:v12];
  v27 = v11;
  objc_msgSend((id)-[TDModelMeshRenditionSpec production](self, "production"), "addRenditionsObject:", v11);
  v13 = (void *)[a3 material];
  id v26 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v25 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (v13)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v31 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          uint64_t v19 = objc_msgSend(v18, "URLValue", v25);
          if ([v18 type] == 1 && v19 != 0)
          {
            v21 = objc_alloc_init(TDNamedAssetImportInfo);
            -[TDNamedAssetImportInfo setName:](v21, "setName:", [v18 stringValue]);
            [(TDNamedAssetImportInfo *)v21 setNameIdentifier:33333];
            [(TDNamedAssetImportInfo *)v21 setIdiom:0];
            [(TDNamedAssetImportInfo *)v21 setScaleFactor:1];
            -[TDNamedAssetImportInfo setModificationDate:](v21, "setModificationDate:", [MEMORY[0x263EFF910] date]);
            [(TDNamedAssetImportInfo *)v21 setRenditionType:1007];
            [(TDNamedAssetImportInfo *)v21 setTexturePixelFormat:1];
            [(TDNamedAssetImportInfo *)v21 setTextureWidth:120];
            [(TDNamedAssetImportInfo *)v21 setTextureHeight:120];
            id v22 = objc_alloc_init(MEMORY[0x263EFF980]);
            v23 = objc_alloc_init(TDTextureAssetInfo);
            [(TDTextureAssetInfo *)v23 setFileURL:v19];
            [(TDTextureAssetInfo *)v23 setMipLevel:0];
            [v22 addObject:v23];
            [(TDNamedAssetImportInfo *)v21 setTextureInfos:v22];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v15);
    }
  }
  uint64_t v29 = 0;
  v24 = v25;
  objc_msgSend(v28, "createNamedTexturesForCustomInfos:referenceFiles:bitSource:error:", v26, 1, objc_msgSend(v28, "_themeBitSourceForReferencedFilesAtURLs:createIfNecessary:", v25, 1, v25), &v29);
}

- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "_cachedModelAssets"), "objectAtIndex:", (int)objc_msgSend((id)-[TDModelMeshRenditionSpec parentRendition](self, "parentRendition", a3, a4), "modelAssetIndex")), "objectAtIndex:", objc_msgSend((id)-[TDModelMeshRenditionSpec keySpec](self, "keySpec"), "dimension1"));
  v7 = (void *)[objc_alloc(MEMORY[0x263F38370]) initWithModelMesh:v6];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v8 = (void *)[(TDModelMeshRenditionSpec *)self submeshes];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(v7, "addSubmeshReference:", objc_msgSend(MEMORY[0x263F383B8], "renditionKeyWithKeyList:", objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12++), "keySpec"), "key")));
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
  [v7 setCompressionType:2];
  v13 = (void *)[v7 CSIRepresentationWithCompression:1];

  return v13;
}

+ (id)fetchRequest
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF260]) initWithEntityName:@"ModelIOMeshRenditionSpec"];

  return v2;
}

@end