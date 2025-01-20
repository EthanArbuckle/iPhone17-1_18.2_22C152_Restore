@interface CIFileSaverProcessor
+ (BOOL)allowPartialOutputRegion;
+ (BOOL)allowSRGBTranferFuntionOnInputAtIndex:(int)a3;
+ (BOOL)allowSRGBTranferFuntionOnOutput;
+ (BOOL)canReduceOutputChannels;
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
+ (BOOL)synchronizeInputs;
@end

@implementation CIFileSaverProcessor

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  v8 = objc_msgSend(a3, "objectAtIndexedSubscript:", 0, a4, a5, a6);
  v9 = (__IOSurface *)[v8 surface];
  uint64_t v10 = [a4 objectForKeyedSubscript:@"filename"];
  v11 = (void *)[NSString stringWithFormat:@"%@.bmtl", v10];
  printf("dumping surface for filename %s\n", (const char *)[v11 UTF8String]);
  double Width = (double)IOSurfaceGetWidth(v9);
  double Height = (double)IOSurfaceGetHeight(v9);
  SurfaceCroppedWriteBmtlToFile(v9, (const char *)[v11 UTF8String], Width, Height);
  v14 = objc_msgSend((id)objc_msgSend(a5, "metalCommandBuffer"), "blitCommandEncoder");
  uint64_t v15 = [v8 metalTexture];
  memset(v19, 0, sizeof(v19));
  v18[0] = objc_msgSend((id)objc_msgSend(v8, "metalTexture"), "width");
  v18[1] = objc_msgSend((id)objc_msgSend(v8, "metalTexture"), "height");
  v18[2] = 1;
  memset(v17, 0, sizeof(v17));
  objc_msgSend(v14, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v15, 0, 0, v19, v18, objc_msgSend(a5, "metalTexture"), 0, 0, v17);
  [v14 endEncoding];
  return 1;
}

+ (BOOL)synchronizeInputs
{
  return 1;
}

+ (BOOL)allowPartialOutputRegion
{
  return 0;
}

+ (BOOL)canReduceOutputChannels
{
  return 1;
}

+ (BOOL)allowSRGBTranferFuntionOnOutput
{
  return 1;
}

+ (BOOL)allowSRGBTranferFuntionOnInputAtIndex:(int)a3
{
  return 1;
}

@end