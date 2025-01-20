@interface TDVectorGlyphRenditionSpec
+ (id)fetchRequest;
- (BOOL)canBePackedWithDocument:(id)a3;
- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5;
@end

@implementation TDVectorGlyphRenditionSpec

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"VectorGlyphRenditionSpec"];
}

- (BOOL)canBePackedWithDocument:(id)a3
{
  return 0;
}

- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5
{
  v30[3] = *MEMORY[0x263EF8340];
  v7 = (void *)[(TDVectorGlyphRenditionSpec *)self asset];
  uint64_t v27 = 0;
  v8 = +[TDVectorGlyphReader vectorGlyphReaderWithURL:platform:error:](TDVectorGlyphReader, "vectorGlyphReaderWithURL:platform:error:", [v7 fileURLWithDocument:a5], objc_msgSend(a5, "targetPlatform"), 0);
  if (!-[TDVectorGlyphReader vectorGlyphWithWeight:size:error:](v8, "vectorGlyphWithWeight:size:error:", objc_msgSend((id)objc_msgSend((id)-[TDVectorGlyphRenditionSpec keySpec](self, "keySpec"), "glyphWeight"), "identifier"), objc_msgSend((id)objc_msgSend((id)-[TDVectorGlyphRenditionSpec keySpec](self, "keySpec"), "glyphSize"), "identifier"), &v27))goto LABEL_12; {
  id v9 = objc_alloc_init(MEMORY[0x263EFF990]);
  }
  uint64_t v10 = *MEMORY[0x263F37F40];
  v29[0] = *MEMORY[0x263F37F38];
  v29[1] = v10;
  v30[0] = MEMORY[0x263EFFA88];
  v30[1] = MEMORY[0x263EFFA88];
  v29[2] = @"kCGSVGOmitHeaders";
  v30[2] = MEMORY[0x263EFFA88];
  [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:3];
  if (!CGSVGDocumentWriteToData())
  {

    CGSVGDocumentRelease();
LABEL_12:
    v21 = 0;
    v11 = v8;
    goto LABEL_13;
  }
  v11 = (TDVectorGlyphReader *)[objc_alloc(MEMORY[0x263F38370]) initWithRawData:v9 pixelFormat:1398163232 layout:1017];
  -[TDVectorGlyphReader setTargetPlatform:](v11, "setTargetPlatform:", [a5 targetPlatform]);
  [(TDVectorGlyphReader *)v11 setIsVectorBased:1];
  -[TDVectorGlyphReader setName:](v11, "setName:", [v7 name]);
  -[TDVectorGlyphReader setScaleFactor:](v11, "setScaleFactor:", objc_msgSend((id)-[TDVectorGlyphRenditionSpec keySpec](self, "keySpec"), "scaleFactor"));
  [(TDVectorGlyphReader *)v11 setCompressionType:2];
  -[TDVectorGlyphReader setTemplateRenderingMode:](v11, "setTemplateRenderingMode:", objc_msgSend((id)objc_msgSend((id)-[TDVectorGlyphRenditionSpec production](self, "production"), "templateRenderingMode"), "identifier"));
  -[TDVectorGlyphReader setOptOutOfThinning:](v11, "setOptOutOfThinning:", objc_msgSend((id)-[TDVectorGlyphRenditionSpec production](self, "production"), "optOutOfThinning"));
  -[TDVectorGlyphReader setIsFlippable:](v11, "setIsFlippable:", objc_msgSend((id)-[TDVectorGlyphRenditionSpec production](self, "production"), "isFlippable"));
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v13 = (void *)[(TDVectorGlyphRenditionSpec *)self avaliablePointSizes];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v24;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(v12, "addObject:", objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v17++), "pointSize"));
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v15);
  }
  [(TDVectorGlyphReader *)v8 defaultPointSize];
  [(TDVectorGlyphReader *)v11 setStandardVectorSize:v18];
  [(TDVectorGlyphReader *)v11 setVectorSizes:v12];

  -[TDVectorGlyphReader baselineForVectorGlyphWithWeight:size:](v8, "baselineForVectorGlyphWithWeight:size:", objc_msgSend((id)objc_msgSend((id)-[TDVectorGlyphRenditionSpec keySpec](self, "keySpec"), "glyphWeight"), "identifier"), objc_msgSend((id)objc_msgSend((id)-[TDVectorGlyphRenditionSpec keySpec](self, "keySpec"), "glyphSize"), "identifier"));
  *(float *)&double v19 = v19;
  [(TDVectorGlyphReader *)v11 setBaseline:v19];
  -[TDVectorGlyphReader capHeightForVectorGlyphWithWeight:size:](v8, "capHeightForVectorGlyphWithWeight:size:", objc_msgSend((id)objc_msgSend((id)-[TDVectorGlyphRenditionSpec keySpec](self, "keySpec"), "glyphWeight"), "identifier"), objc_msgSend((id)objc_msgSend((id)-[TDVectorGlyphRenditionSpec keySpec](self, "keySpec"), "glyphSize"), "identifier"));
  *(float *)&double v20 = v20;
  [(TDVectorGlyphReader *)v11 setCapHeight:v20];
  -[TDVectorGlyphReader alignmentRectInsetsForVectorGlyphWithWeight:size:](v8, "alignmentRectInsetsForVectorGlyphWithWeight:size:", objc_msgSend((id)objc_msgSend((id)-[TDVectorGlyphRenditionSpec keySpec](self, "keySpec"), "glyphWeight"), "identifier"), objc_msgSend((id)objc_msgSend((id)-[TDVectorGlyphRenditionSpec keySpec](self, "keySpec"), "glyphSize"), "identifier"));
  -[TDVectorGlyphReader setAlignmentRectInsets:](v11, "setAlignmentRectInsets:");
  [(TDVectorGlyphReader *)v8 templateVersion];
  -[TDVectorGlyphReader setTemplateVersion:](v11, "setTemplateVersion:");
  -[TDVectorGlyphReader setInterpolatable:](v11, "setInterpolatable:", -[TDVectorGlyphReader isInterpolatableForWeight:size:](v8, "isInterpolatableForWeight:size:", objc_msgSend((id)objc_msgSend((id)-[TDVectorGlyphRenditionSpec keySpec](self, "keySpec"), "glyphWeight"), "identifier"), objc_msgSend((id)objc_msgSend((id)-[TDVectorGlyphRenditionSpec keySpec](self, "keySpec"), "glyphSize"), "identifier")));
  -[TDVectorGlyphReader setVectorGlyphRenderingMode:](v11, "setVectorGlyphRenderingMode:", objc_msgSend((id)objc_msgSend((id)-[TDVectorGlyphRenditionSpec production](self, "production"), "vectorGlyphRenderingMode"), "identifier"));
  [(TDVectorGlyphReader *)v11 setVectorContainsMulticolorLayers:[(TDVectorGlyphReader *)v8 containsMulticolorLayers]];
  [(TDVectorGlyphReader *)v11 setVectorContainsHierarchicalLayers:[(TDVectorGlyphReader *)v8 containsHierarchicalLayers]];
  v21 = (void *)[(TDVectorGlyphReader *)v11 CSIRepresentationWithCompression:0];
  CGSVGDocumentRelease();

LABEL_13:
  return v21;
}

@end