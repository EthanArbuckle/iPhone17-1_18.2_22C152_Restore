@interface TDTextureRawRenditionSpec
+ (id)fetchRequest;
- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5;
- (id)textureWithDocument:(id)a3;
@end

@implementation TDTextureRawRenditionSpec

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"TextureRawRenditionSpec"];
}

- (id)textureWithDocument:(id)a3
{
  int v15 = 0;
  v6 = -[TDTextureImageRenditionSpec _createImageRefWithURL:andDocument:format:](self, "_createImageRefWithURL:andDocument:format:", objc_msgSend((id)-[TDTextureRawRenditionSpec asset](self, "asset"), "fileURLWithDocument:", a3), a3, &v15);
  int v7 = objc_msgSend((id)-[TDTextureRawRenditionSpec keySpec](self, "keySpec"), "dimension1");
  if (v7 == 2)
  {
    [a3 targetPlatform];
    v8 = (void *)CUICreateSDFGradientTextureFromImage();
    if (!v8)
    {
      v9 = (void *)[MEMORY[0x263F08690] currentHandler];
      v10 = @"CUICreateSDFGradientTextureFromImage() returned a NULL";
      SEL v11 = a2;
      v12 = self;
      uint64_t v13 = 32;
      goto LABEL_8;
    }
  }
  else
  {
    if (v7 != 1)
    {
LABEL_9:
      CGImageRelease(v6);
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TDTextureRawRenditionSpec+CoreDataClass.m", 40, @"%s got a NULL texture", "-[TDTextureRawRenditionSpec textureWithDocument:]");
      return 0;
    }
    [a3 targetPlatform];
    v8 = (void *)CUICreateSDFEdgeTextureFromImage();
    if (!v8)
    {
      v9 = (void *)[MEMORY[0x263F08690] currentHandler];
      v10 = @"CUICreateSDFEdgeTextureFromImage() returned a NULL";
      SEL v11 = a2;
      v12 = self;
      uint64_t v13 = 28;
LABEL_8:
      [v9 handleFailureInMethod:v11 object:v12 file:@"TDTextureRawRenditionSpec+CoreDataClass.m" lineNumber:v13 description:v10];
      goto LABEL_9;
    }
  }
  CGImageRelease(v6);
  return v8;
}

- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5
{
  BOOL v23 = a3;
  memset(v25, 0, sizeof(v25));
  id v7 = -[TDTextureRawRenditionSpec textureWithDocument:](self, "textureWithDocument:", a5, a4);
  [v7 dimensions];
  int v9 = v8;
  [v7 dimensions];
  uint64_t v11 = v10;
  unsigned int v24 = v9;
  double v12 = (double)v10;
  uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x263F38370]), "initWithTextureImageWithSize:forPixelFormat:cubeMap:", objc_msgSend(v7, "pixelFormat"), objc_msgSend(v7, "cubemap"), (double)v9, (double)v10);
  objc_msgSend(v13, "setScaleFactor:", objc_msgSend((id)-[TDTextureRawRenditionSpec asset](self, "asset"), "scaleFactor"));
  id v14 = a5;
  objc_msgSend(v13, "setTargetPlatform:", objc_msgSend(a5, "targetPlatform"));
  [v13 setPixelFormat:1095911234];
  objc_msgSend(v13, "setName:", objc_msgSend((id)-[TDTextureRawRenditionSpec asset](self, "asset"), "name"));
  double v26 = (double)v9;
  double v27 = v12;
  [v13 addMetrics:v25];
  int v15 = objc_msgSend((id)objc_msgSend(v7, "mipmapLevels"), "objectAtIndexedSubscript:", objc_msgSend((id)-[TDTextureRawRenditionSpec keySpec](self, "keySpec"), "dimension2"));
  if (objc_msgSend((id)objc_msgSend(v15, "elements"), "count"))
  {
    unint64_t v16 = 0;
    do
    {
      v17 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "elements"), "objectAtIndexedSubscript:", v16), "faces"), "objectAtIndexedSubscript:", v16);
      v18 = objc_msgSend((id)objc_msgSend(v17, "buffer"), "map");
      v19 = objc_msgSend(objc_alloc(MEMORY[0x263F38368]), "initWithCGImage:width:height:texturePixelFormat:", 0, v24, v11, objc_msgSend(v7, "pixelFormat"));
      [v19 setSourceAlphaInfo:0];
      objc_msgSend(v19, "setRowbytes:", objc_msgSend(v17, "bytesPerRow"));
      objc_msgSend(v19, "setTargetPlatform:", objc_msgSend(v14, "targetPlatform"));
      objc_msgSend(v19, "setPixelFormat:", objc_msgSend(v13, "pixelFormat"));
      [v19 setTextureInterpretation:0];
      v20 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8F8]), "initWithBytes:length:", objc_msgSend(v18, "bytes"), objc_msgSend(v17, "bytesPerImage"));
      [v19 setPixelData:v20];

      [v13 addBitmap:v19];
      ++v16;
    }
    while (v16 < objc_msgSend((id)objc_msgSend(v15, "elements"), "count"));
  }
  objc_msgSend(v13, "setOptOutOfThinning:", objc_msgSend((id)-[TDTextureRawRenditionSpec production](self, "production"), "optOutOfThinning"));
  objc_msgSend(v13, "setPreserveForArchiveOnly:", -[TDTextureRawRenditionSpec preserveForArchiveOnly](self, "preserveForArchiveOnly"));
  v21 = (void *)[v13 CSIRepresentationWithCompression:v23];

  return v21;
}

@end