@interface CIDetector
+ (CIDetector)detectorOfType:(NSString *)type context:(CIContext *)context options:(NSDictionary *)options;
- (CIDetector)init;
- (NSArray)featuresInImage:(CIImage *)image;
- (NSArray)featuresInImage:(CIImage *)image options:(NSDictionary *)options;
@end

@implementation CIDetector

- (CIDetector)init
{
  v5.receiver = self;
  v5.super_class = (Class)CIDetector;
  v2 = [(CIDetector *)&v5 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_class();
    if (v3 == objc_opt_class())
    {

      return 0;
    }
  }
  return v2;
}

+ (CIDetector)detectorOfType:(NSString *)type context:(CIContext *)context options:(NSDictionary *)options
{
  if ([(NSString *)type isEqualToString:@"CIDetectorTypeFace"])
  {
    int v8 = objc_msgSend(-[NSDictionary objectForKey:](options, "objectForKey:", @"CIDetectorAccuracy"), "isEqualToString:", @"CIDetectorAccuracyLow");
    char v9 = objc_msgSend(-[NSDictionary objectForKey:](options, "objectForKey:", @"ForceVision"), "BOOLValue");
    char v10 = objc_msgSend(-[NSDictionary objectForKey:](options, "objectForKey:", @"ForceFaceCore"), "BOOLValue");
    int v11 = objc_msgSend(-[NSDictionary objectForKey:](options, "objectForKey:", @"CIDetectorBetterEyeLocs"), "BOOLValue");
    int v12 = objc_msgSend(-[NSDictionary objectForKey:](options, "objectForKey:", @"CIDetectorTracking"), "BOOLValue");
    int v13 = dyld_program_sdk_at_least();
    if ((v9 & 1) == 0 && ((v10 & 1) != 0 || ((v8 & (v11 ^ 1) | v12) & 1) != 0 || v13 != 1)) {
      v14 = CIFaceCoreDetector;
    }
    else {
      v14 = CIVNFaceDetector;
    }
  }
  else if ([(NSString *)type isEqualToString:@"CIDetectorTypeRectangle"])
  {
    v14 = CIRectangleDetector;
  }
  else if ([(NSString *)type isEqualToString:@"CIDetectorTypeQRCode"])
  {
    v14 = CIBarcodeDetector;
  }
  else
  {
    if (![(NSString *)type isEqualToString:@"CIDetectorTypeText"])
    {
      NSLog(&cfstr_CidetectorDete.isa, type);
      return 0;
    }
    v14 = CITextDetector;
  }
  v15 = (void *)[[v14 alloc] initWithContext:context options:options];

  return (CIDetector *)v15;
}

- (NSArray)featuresInImage:(CIImage *)image
{
  return [(CIDetector *)self featuresInImage:image options:0];
}

- (NSArray)featuresInImage:(CIImage *)image options:(NSDictionary *)options
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E4F1C978], "array", image, options);
}

@end