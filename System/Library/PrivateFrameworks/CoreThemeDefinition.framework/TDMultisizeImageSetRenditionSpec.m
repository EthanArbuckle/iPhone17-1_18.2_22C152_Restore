@interface TDMultisizeImageSetRenditionSpec
- (BOOL)canBePackedWithDocument:(id)a3;
- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5;
@end

@implementation TDMultisizeImageSetRenditionSpec

- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  v6 = (void *)[(TDMultisizeImageSetRenditionSpec *)self production];
  uint64_t v32 = objc_msgSend((id)objc_msgSend(v6, "name"), "name");
  v7 = (void *)[v6 sizeIndexes];
  v34 = self;
  v8 = (void *)[(TDMultisizeImageSetRenditionSpec *)self multisizeImageRenditions];
  v9 = (void *)[MEMORY[0x263EFF980] array];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v10 = [v7 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v44 != v12) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void *)(*((void *)&v43 + 1) + 8 * i);
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        uint64_t v15 = [v8 countByEnumeratingWithState:&v39 objects:v48 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v40;
          while (2)
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v40 != v17) {
                objc_enumerationMutation(v8);
              }
              if (v14 == [*(id *)(*((void *)&v39 + 1) + 8 * j) sizeIndex])
              {
                [v9 addObject:v14];
                goto LABEL_16;
              }
            }
            uint64_t v16 = [v8 countByEnumeratingWithState:&v39 objects:v48 count:16];
            if (v16) {
              continue;
            }
            break;
          }
        }
LABEL_16:
        ;
      }
      uint64_t v11 = [v7 countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v11);
  }
  if (![v9 count]) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v34, @"TDMultisizeImageSetRenditionSpec.m", 36, @"All multisize image sets need at least one multisize image. This one '%@' has zero.", objc_msgSend((id)objc_msgSend((id)-[TDMultisizeImageSetRenditionSpec production](v34, "production"), "name"), "name"));
  }
  v19 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v20 = [v9 countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v36;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v36 != v22) {
          objc_enumerationMutation(v9);
        }
        v24 = *(void **)(*((void *)&v35 + 1) + 8 * k);
        double v25 = (double)(int)[v24 width];
        int v26 = [v24 height];
        uint64_t v27 = objc_msgSend(MEMORY[0x263F08D40], "valueWithSize:", v25, (double)v26);
        objc_msgSend(v19, "setObject:forKey:", v27, objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v24, "index")));
      }
      uint64_t v21 = [v9 countByEnumeratingWithState:&v35 objects:v47 count:16];
    }
    while (v21);
  }
  v28 = (void *)[objc_alloc(MEMORY[0x263F38370]) initWithMultisizeImageSetNamed:v32 sizesByIndex:v19];
  objc_msgSend(v28, "setTargetPlatform:", objc_msgSend(a5, "targetPlatform"));
  objc_msgSend(v28, "setRenditionProperties:", -[TDRenditionSpec propertiesAsDictionary](v34, "propertiesAsDictionary"));
  v29 = (void *)[v28 CSIRepresentationWithCompression:0];

  return v29;
}

- (BOOL)canBePackedWithDocument:(id)a3
{
  return 0;
}

@end