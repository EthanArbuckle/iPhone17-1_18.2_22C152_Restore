@interface TDTextureRenditionSpec
- (BOOL)canBePackedWithDocument:(id)a3;
- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5;
@end

@implementation TDTextureRenditionSpec

- (BOOL)canBePackedWithDocument:(id)a3
{
  return 0;
}

- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5
{
  v26[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend((id)-[TDTextureRenditionSpec pixelFormat](self, "pixelFormat", a3, a4, a5), "identifier");
  v7 = (void *)[(TDTextureRenditionSpec *)self mipLevels];
  v8 = objc_msgSend(v7, "filteredSetUsingPredicate:", objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"(face = nil) OR (face.identifier = 0)"));
  v26[0] = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"level" ascending:1];
  id v9 = (id)objc_msgSend(v8, "sortedArrayUsingDescriptors:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v26, 1));
  v10 = (void *)[v9 objectAtIndexedSubscript:0];
  double v11 = (double)(int)objc_msgSend((id)objc_msgSend(v10, "textureImage"), "width");
  double v12 = (double)(int)objc_msgSend((id)objc_msgSend(v10, "textureImage"), "height");
  v13 = (void *)[objc_alloc(MEMORY[0x263F38370]) initWithTextureForPixelFormat:v6];
  objc_msgSend(v13, "setSize:", v11, v12);
  objc_msgSend(v13, "setName:", objc_msgSend((id)objc_msgSend((id)-[TDTextureRenditionSpec production](self, "production"), "name"), "name"));
  [v13 setTextureFormat:v6];
  objc_msgSend(v13, "setCubemap:", -[TDTextureRenditionSpec cubeMap](self, "cubeMap"));
  [v13 setPixelFormat:1095911234];
  [v13 setColorSpaceID:1];
  objc_msgSend(v13, "setTextureInterpretation:", objc_msgSend((id)objc_msgSend((id)-[TDTextureRenditionSpec production](self, "production"), "textureInterpretation"), "identifier"));
  objc_msgSend(v13, "setTextureOpaque:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "lastObject"), "textureImage"), "opaque"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v14 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v9);
        }
        v18 = objc_msgSend(objc_alloc(MEMORY[0x263F383B8]), "initWithKeyList:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v17), "textureImage"), "keySpec"), "key"));
        [v13 addMipReference:v18];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v15);
  }
  objc_msgSend(v13, "setRenditionProperties:", -[TDRenditionSpec propertiesAsDictionary](self, "propertiesAsDictionary"));
  v19 = (void *)[v13 CSIRepresentationWithCompression:1];

  return v19;
}

@end