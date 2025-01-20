@interface TDContentsRenditionSpec
- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5;
@end

@implementation TDContentsRenditionSpec

- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v8 = (void *)[(TDContentsRenditionSpec *)self contains];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(v7, "addObject:", objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v12++), "name"));
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
  [v7 sortUsingSelector:sel_localizedCompare_];
  v13 = (void *)[objc_alloc(MEMORY[0x263F38370]) initWithNameList:v7];
  objc_msgSend(v13, "setTargetPlatform:", objc_msgSend(a5, "targetPlatform"));
  v14 = (void *)[v13 CSIRepresentationWithCompression:0];

  return v14;
}

@end