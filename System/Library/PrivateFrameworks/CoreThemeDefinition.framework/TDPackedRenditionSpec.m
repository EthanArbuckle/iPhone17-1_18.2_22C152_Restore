@interface TDPackedRenditionSpec
- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5;
- (id)renditionPackName;
@end

@implementation TDPackedRenditionSpec

- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5
{
  BOOL v6 = a3;
  uint64_t v59 = *MEMORY[0x263EF8340];
  v8 = objc_msgSend((id)-[TDPackedRenditionSpec packedRenditions](self, "packedRenditions", a3, a4), "allObjects");
  v56[0] = MEMORY[0x263EF8330];
  v56[1] = 3221225472;
  v56[2] = __86__TDPackedRenditionSpec_createCSIRepresentationWithCompression_colorSpaceID_document___block_invoke;
  v56[3] = &unk_264C44E68;
  id v47 = a5;
  v56[4] = a5;
  v9 = (void *)[v8 sortedArrayUsingComparator:v56];
  if (![v9 count]) {
    return 0;
  }
  BOOL v46 = v6;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v52 objects:v58 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    uint64_t v16 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v53 != v16) {
          objc_enumerationMutation(v9);
        }
        v18 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v12 |= [v18 allowsPaletteImageCompression];
          v13 |= [v18 allowsHevcCompression];
          v14 |= [v18 allowsDeepmapCompression];
          v15 |= [v18 allowsDeepmap2Compression];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v52 objects:v58 count:16];
    }
    while (v11);
  }
  else
  {
    LOBYTE(v12) = 0;
    LOBYTE(v13) = 0;
    LOBYTE(v14) = 0;
    LOBYTE(v15) = 0;
  }
  int v20 = [v47 allowsExtendedRangePixelFormats];
  int v21 = [(TDPackedRenditionSpec *)self monochrome];
  v22 = objc_msgSend(objc_alloc(MEMORY[0x263F38370]), "initWithCanvasSize:sliceCount:layout:", 0, 1004, (double)(int)-[TDPackedRenditionSpec width](self, "width"), (double)(int)-[TDPackedRenditionSpec height](self, "height"));
  objc_msgSend(v22, "setTargetPlatform:", objc_msgSend(v47, "targetPlatform"));
  int v23 = objc_msgSend((id)objc_msgSend((id)-[TDPackedRenditionSpec keySpec](self, "keySpec"), "gamut"), "identifier");
  if (v21) {
    __int16 v24 = 2;
  }
  else {
    __int16 v24 = 1;
  }
  if (v21) {
    unsigned int v25 = 1195456544;
  }
  else {
    unsigned int v25 = 1095911234;
  }
  if (v20) {
    __int16 v26 = 4;
  }
  else {
    __int16 v26 = 3;
  }
  if (v20) {
    __int16 v27 = 6;
  }
  else {
    __int16 v27 = 2;
  }
  if (v21) {
    unsigned int v28 = 1195454774;
  }
  else {
    unsigned int v28 = 1380401751;
  }
  if (v21) {
    __int16 v26 = v27;
  }
  if (v23 == 1) {
    uint64_t v29 = v28;
  }
  else {
    uint64_t v29 = v25;
  }
  if (v23 == 1) {
    __int16 v30 = v26;
  }
  else {
    __int16 v30 = v24;
  }
  [v22 setPixelFormat:v29];
  int v31 = [(TDPackedRenditionSpec *)self alphaCrop];
  objc_msgSend(v22, "setName:", -[TDPackedRenditionSpec renditionPackName](self, "renditionPackName"));
  if (objc_msgSend((id)-[TDPackedRenditionSpec compressionType](self, "compressionType"), "identifier")) {
    objc_msgSend(v22, "setCompressionType:", objc_msgSend((id)-[TDPackedRenditionSpec compressionType](self, "compressionType"), "identifier"));
  }
  [v22 setAllowsMultiPassEncoding:1];
  [v22 setAllowsPaletteImageCompression:v12 & 1];
  [v22 setAllowsHevcCompression:v13 & 1];
  [v22 setAllowsDeepmapImageCompression:v14 & 1];
  [v22 setAllowsDeepmap2ImageCompression:v15 & 1];
  [v22 setColorSpaceID:v30];
  objc_msgSend(v22, "setScaleFactor:", objc_msgSend((id)-[TDPackedRenditionSpec keySpec](self, "keySpec"), "scaleFactor"));
  objc_msgSend(v22, "addSliceRect:", *MEMORY[0x263F08670], *(double *)(MEMORY[0x263F08670] + 8), *(double *)(MEMORY[0x263F08670] + 16), *(double *)(MEMORY[0x263F08670] + 24));
  [v22 setBlendMode:0];
  [v22 setOpacity:1.0];
  objc_msgSend(v22, "setPreserveForArchiveOnly:", -[TDPackedRenditionSpec preserveForArchiveOnly](self, "preserveForArchiveOnly"));
  v32 = objc_msgSend(objc_alloc(MEMORY[0x263F38368]), "initWithPixelWidth:pixelHeight:", -[TDPackedRenditionSpec width](self, "width"), -[TDPackedRenditionSpec height](self, "height"));
  objc_msgSend(v32, "setTargetPlatform:", objc_msgSend(v47, "targetPlatform"));
  [v32 setAllowsMultiPassEncoding:1];
  objc_msgSend(v32, "setPixelFormat:", objc_msgSend(v22, "pixelFormat"));
  objc_msgSend(v32, "setColorSpaceID:", (int)objc_msgSend(v22, "colorSpaceID"));
  if ([(TDPackedRenditionSpec *)self opaque]) {
    uint64_t v33 = 6;
  }
  else {
    uint64_t v33 = 2;
  }
  [v32 setSourceAlphaInfo:v33];
  v34 = v22;
  [v22 addBitmap:v32];
  v45 = v32;
  uint64_t v35 = [v32 bitmapContext];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v36 = [v9 countByEnumeratingWithState:&v48 objects:v57 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v49;
    do
    {
      v39 = v9;
      for (uint64_t j = 0; j != v37; ++j)
      {
        if (*(void *)v49 != v38) {
          objc_enumerationMutation(v39);
        }
        v41 = *(void **)(*((void *)&v48 + 1) + 8 * j);
        if (v31)
        {
          id v42 = objc_alloc_init(MEMORY[0x263F383C0]);
          v43 = objc_msgSend(objc_alloc(MEMORY[0x263F383B8]), "initWithKeyList:", objc_msgSend((id)objc_msgSend(v41, "keySpec"), "key"));
          [v42 setReferenceKey:v43];
          [v34 addLayerReference:v42];
        }
        [v41 drawPackableRenditionInContext:v35 withDocument:v47];
      }
      v9 = v39;
      uint64_t v37 = [v39 countByEnumeratingWithState:&v48 objects:v57 count:16];
    }
    while (v37);
  }
  v19 = (void *)[v34 CSIRepresentationWithCompression:v46];

  return v19;
}

uint64_t __86__TDPackedRenditionSpec_createCSIRepresentationWithCompression_colorSpaceID_document___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a2, "keySpec"), "key");
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "keySpec"), "key");
  uint64_t v7 = [*(id *)(a1 + 32) untrimmedRenditionKeyFormat];

  return MEMORY[0x270F23A38](v5, v6, v7);
}

- (id)renditionPackName
{
  int v3 = [(TDPackedRenditionSpec *)self alphaCrop];
  v4 = NSString;
  uint64_t v5 = objc_msgSend((id)-[TDPackedRenditionSpec keySpec](self, "keySpec"), "scaleFactor");
  unsigned int v6 = [(TDPackedRenditionSpec *)self opaque];
  unsigned int v7 = [(TDPackedRenditionSpec *)self monochrome];
  uint64_t v8 = objc_msgSend((id)objc_msgSend((id)-[TDPackedRenditionSpec keySpec](self, "keySpec"), "gamut"), "identifier");
  if (v3) {
    v9 = @"ZZZZExplicitlyPackedAsset-%d.%d.%d-gamut%d";
  }
  else {
    v9 = @"ZZZZPackedAsset-%d.%d.%d-gamut%d";
  }
  return (id)objc_msgSend(v4, "stringWithFormat:", v9, v5, v6, v7, v8);
}

@end