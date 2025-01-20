@interface TDLayerStackRenditionSpec
- (BOOL)canBePackedWithDocument:(id)a3;
- (CGSize)canvasSize;
- (CGSize)primitiveCanvasSize;
- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5;
- (void)awakeFromFetch;
- (void)prepareForDeletion;
- (void)setCanvasSize:(CGSize)a3;
- (void)setPrimitiveCanvasSize:(CGSize)a3;
@end

@implementation TDLayerStackRenditionSpec

- (BOOL)canBePackedWithDocument:(id)a3
{
  return 0;
}

- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v7 = (void *)[(TDLayerStackRenditionSpec *)self asset];
  if ([(TDThemeConstant *)[(TDRenditionSpec *)self renditionType] identifier] == 1002) {
    uint64_t v8 = 1002;
  }
  else {
    uint64_t v8 = 1018;
  }
  uint64_t v9 = [v7 imageStackDataWithDocument:a5];
  id v10 = objc_alloc(MEMORY[0x263F38370]);
  [(TDLayerStackRenditionSpec *)self canvasSize];
  v11 = objc_msgSend(v10, "initWithLayerStackData:type:withCanvasSize:", v9, v8);
  objc_msgSend(v11, "setTargetPlatform:", objc_msgSend(a5, "targetPlatform"));
  objc_msgSend(v11, "setScaleFactor:", objc_msgSend(v7, "scaleFactor"));
  [v11 setUtiType:@"public.layeredimage"];
  objc_msgSend(v11, "setName:", objc_msgSend(v7, "name"));
  v12 = (void *)[(TDLayerStackRenditionSpec *)self layerReferences];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(v11, "addLayerReference:", objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "cuiLayerReference"));
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }
  objc_msgSend(v11, "setRenditionProperties:", -[TDRenditionSpec propertiesAsDictionary](self, "propertiesAsDictionary"));
  v17 = (void *)[v11 CSIRepresentationWithCompression:1];

  return v17;
}

- (void)setCanvasSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(TDLayerStackRenditionSpec *)self willChangeValueForKey:@"canvasSize"];
  -[TDLayerStackRenditionSpec setPrimitiveCanvasSize:](self, "setPrimitiveCanvasSize:", width, height);
  [(TDLayerStackRenditionSpec *)self didChangeValueForKey:@"canvasSize"];
  v8.double width = width;
  v8.double height = height;
  v6 = NSStringFromSize(v8);

  [(TDLayerStackRenditionSpec *)self setCanvasSizeString:v6];
}

- (CGSize)canvasSize
{
  [(TDLayerStackRenditionSpec *)self willAccessValueForKey:@"canvasSize"];
  [(TDLayerStackRenditionSpec *)self primitiveCanvasSize];
  double v4 = v3;
  double v6 = v5;
  [(TDLayerStackRenditionSpec *)self didAccessValueForKey:@"canvasSize"];
  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)awakeFromFetch
{
  v4.receiver = self;
  v4.super_class = (Class)TDLayerStackRenditionSpec;
  [(TDLayerStackRenditionSpec *)&v4 awakeFromFetch];
  NSSize v3 = NSSizeFromString((NSString *)[(TDLayerStackRenditionSpec *)self canvasSizeString]);
  -[TDLayerStackRenditionSpec setPrimitiveCanvasSize:](self, "setPrimitiveCanvasSize:", v3.width, v3.height);
}

- (void)prepareForDeletion
{
  v3.receiver = self;
  v3.super_class = (Class)TDLayerStackRenditionSpec;
  [(TDLayerStackRenditionSpec *)&v3 prepareForDeletion];
  if ([(TDLayerStackRenditionSpec *)self asset])
  {
    if ((unint64_t)objc_msgSend((id)objc_msgSend((id)-[TDLayerStackRenditionSpec asset](self, "asset"), "renditions"), "count") <= 1)objc_msgSend((id)-[TDLayerStackRenditionSpec managedObjectContext](self, "managedObjectContext"), "deleteObject:", -[TDLayerStackRenditionSpec asset](self, "asset")); {
  }
    }
}

- (CGSize)primitiveCanvasSize
{
  double width = self->primitiveCanvasSize.width;
  double height = self->primitiveCanvasSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPrimitiveCanvasSize:(CGSize)a3
{
  self->primitiveCanvasSize = a3;
}

@end