@interface CIBarcodeGenerator
+ (id)customAttributes;
- (CGImage)outputCGImage;
- (CGImage)outputCGImageForAztecCodeDescriptor;
- (CGImage)outputCGImageForDataMatrixCodeDescriptor;
- (CGImage)outputCGImageForPDF417CodeDescriptor;
- (CGImage)outputCGImageForQRCodeDescriptor;
- (CIBarcodeDescriptor)inputBarcodeDescriptor;
- (id)outputImage;
- (void)setInputBarcodeDescriptor:(id)a3;
@end

@implementation CIBarcodeGenerator

+ (id)customAttributes
{
  v6[0] = kCIAttributeFilterCategories;
  v5[0] = kCICategoryGenerator;
  v5[1] = kCICategoryVideo;
  v5[2] = kCICategoryStillImage;
  v5[3] = kCICategoryBuiltIn;
  v2 = +[NSArray arrayWithObjects:v5 count:4];
  v7[0] = v2;
  v7[1] = @"11";
  v6[1] = kCIAttributeFilterAvailable_iOS;
  v6[2] = kCIAttributeFilterAvailable_Mac;
  v7[2] = @"10.13";
  v3 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:3];

  return v3;
}

- (CGImage)outputCGImageForQRCodeDescriptor
{
  v2 = self->inputBarcodeDescriptor;
  v3 = [(CIBarcodeDescriptor *)v2 errorCorrectedPayload];
  if (v3)
  {
    int v4 = [(CIBarcodeDescriptor *)v2 maskPattern];
    int v5 = [(CIBarcodeDescriptor *)v2 symbolVersion];
    unint64_t v6 = (unint64_t)[(CIBarcodeDescriptor *)v2 errorCorrectionLevel] - 72;
    if (v6 >= 0xA || ((0x231u >> v6) & 1) == 0) {
      sub_10854();
    }
    CGImageRef v7 = sub_EF28(v3, *(&off_1C428 + v6), v4, v5);
    v8 = v7;
    if (v7)
    {
      CFAutorelease(v7);
    }
    else
    {
      v9 = sub_AC68();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10880();
      }
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (CGImage)outputCGImageForAztecCodeDescriptor
{
  v2 = self->inputBarcodeDescriptor;
  v3 = [(CIBarcodeDescriptor *)v2 errorCorrectedPayload];
  if (v3)
  {
    v15[0] = &__kCFBooleanTrue;
    v14[0] = @"AztecOptionMessageDataIsDataCodeWords";
    v14[1] = @"AztecOptionUseCompactStyle";
    int v4 = +[NSNumber numberWithBool:[(CIBarcodeDescriptor *)v2 isCompact]];
    v15[1] = v4;
    v14[2] = @"AztecOptionLayers";
    int v5 = +[NSNumber numberWithInteger:[(CIBarcodeDescriptor *)v2 layerCount]];
    v15[2] = v5;
    v14[3] = @"AztecOptionMessageCodeWordCount";
    unint64_t v6 = +[NSNumber numberWithInteger:[(CIBarcodeDescriptor *)v2 dataCodewordCount]];
    v15[3] = v6;
    CGImageRef v7 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:4];

    id v13 = 0;
    CGImageRef v8 = sub_CA60(v3, v7, (uint64_t)&v13);
    id v9 = v13;
    if (v8)
    {
      CFAutorelease(v8);
    }
    else
    {
      v10 = sub_AC68();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
      if (v9)
      {
        if (v11) {
          sub_108B4(v9);
        }
      }
      else if (v11)
      {
        sub_10880();
      }
    }
  }
  else
  {
    CGImageRef v8 = 0;
  }

  return v8;
}

- (CGImage)outputCGImageForPDF417CodeDescriptor
{
  v2 = self->inputBarcodeDescriptor;
  v3 = [(CIBarcodeDescriptor *)v2 errorCorrectedPayload];
  if (v3)
  {
    v14[0] = &__kCFBooleanTrue;
    v13[0] = @"PDF417OptionMessageDataIsCodeWordData";
    v13[1] = @"PDF417OptionUseCompactStyle";
    int v4 = +[NSNumber numberWithBool:[(CIBarcodeDescriptor *)v2 isCompact]];
    v14[1] = v4;
    v13[2] = @"PDF417OptionRows";
    int v5 = +[NSNumber numberWithInteger:[(CIBarcodeDescriptor *)v2 rowCount]];
    v14[2] = v5;
    v13[3] = @"PDF417OptionDataColumns";
    unint64_t v6 = +[NSNumber numberWithInteger:[(CIBarcodeDescriptor *)v2 columnCount]];
    v14[3] = v6;
    CGImageRef v7 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];

    CGImageRef v8 = sub_7698(v3, v7);
    id v9 = 0;
    if (v8)
    {
      CFAutorelease(v8);
    }
    else
    {
      v10 = sub_AC68();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
      if (v9)
      {
        if (v11) {
          sub_10944(v9);
        }
      }
      else if (v11)
      {
        sub_10880();
      }
    }
  }
  else
  {
    CGImageRef v8 = 0;
  }

  return v8;
}

- (CGImage)outputCGImageForDataMatrixCodeDescriptor
{
  v2 = sub_AC68();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_109D4();
  }

  return 0;
}

- (CGImage)outputCGImage
{
  p_inputBarcodeDescriptor = &self->inputBarcodeDescriptor;
  inputBarcodeDescriptor = self->inputBarcodeDescriptor;
  if (!inputBarcodeDescriptor) {
    return 0;
  }
  if ([(CIBarcodeDescriptor *)inputBarcodeDescriptor isMemberOfClass:objc_opt_class()])
  {
    return [(CIBarcodeGenerator *)self outputCGImageForQRCodeDescriptor];
  }
  if ([(CIBarcodeDescriptor *)*p_inputBarcodeDescriptor isMemberOfClass:objc_opt_class()])
  {
    return [(CIBarcodeGenerator *)self outputCGImageForAztecCodeDescriptor];
  }
  if ([(CIBarcodeDescriptor *)*p_inputBarcodeDescriptor isMemberOfClass:objc_opt_class()])
  {
    return [(CIBarcodeGenerator *)self outputCGImageForPDF417CodeDescriptor];
  }
  if (![(CIBarcodeDescriptor *)*p_inputBarcodeDescriptor isMemberOfClass:objc_opt_class()])
  {
    int v5 = sub_AC68();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10A08();
    }

    return 0;
  }
  return [(CIBarcodeGenerator *)self outputCGImageForDataMatrixCodeDescriptor];
}

- (id)outputImage
{
  v2 = [(CIBarcodeGenerator *)self outputCGImage];
  if (v2)
  {
    v5[0] = kCIImageNearestSampling;
    v5[1] = kCIImageAlphaOne;
    v6[0] = &__kCFBooleanTrue;
    v6[1] = &__kCFBooleanTrue;
    v3 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
    v2 = +[CIImage imageWithCGImage:v2 options:v3];
  }
  return v2;
}

- (CIBarcodeDescriptor)inputBarcodeDescriptor
{
  return self->inputBarcodeDescriptor;
}

- (void)setInputBarcodeDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end