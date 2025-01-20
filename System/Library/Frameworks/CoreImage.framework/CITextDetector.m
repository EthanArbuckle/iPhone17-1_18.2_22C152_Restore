@interface CITextDetector
- (CGAffineTransform)ctmForImageWithBounds:(SEL)a3 orientation:(CGRect)a4;
- (CIContext)context;
- (CITextDetector)initWithContext:(id)a3 options:(id)a4;
- (id)adjustedImageFromImage:(id)a3 orientation:(int)a4 inverseCTM:(CGAffineTransform *)a5;
- (id)featuresInImage:(id)a3;
- (id)featuresInImage:(id)a3 options:(id)a4;
- (void)dealloc;
- (void)setContext:(id)a3;
@end

@implementation CITextDetector

- (CITextDetector)initWithContext:(id)a3 options:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)CITextDetector;
  v6 = [(CIDetector *)&v12 init];
  if (v6)
  {
    if (initWithContext_options__onceToken != -1) {
      dispatch_once(&initWithContext_options__onceToken, &__block_literal_global_65);
    }
    if (initWithContext_options__loadedOK)
    {
      v6->textDetector = (FKTextDetector *)objc_msgSend(objc_alloc(NSClassFromString(&cfstr_Fktextdetector.isa)), "initWithDimensions:", 128.0, 128.0);
      if (!a3) {
        a3 = +[CIContext _singletonContext];
      }
      [(CITextDetector *)v6 setContext:a3];
      if (!v6->featureOptions) {
        v6->featureOptions = (NSMutableDictionary *)(id)[MEMORY[0x1E4F1CA60] dictionary];
      }
      v7 = (void *)[a4 objectForKey:@"CIDetectorMinFeatureSize"];
      if (v7)
      {
        v8 = v7;
        [v7 floatValue];
        if (v9 >= 0.0 && ([v8 floatValue], v10 <= 1.0)) {
          [(NSMutableDictionary *)v6->featureOptions setObject:v8 forKey:@"CIDetectorMinFeatureSize"];
        }
        else {
          NSLog(&cfstr_UnknownCidetec_1.isa);
        }
      }
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

void __42__CITextDetector_initWithContext_options___block_invoke()
{
  v0 = (void *)[MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/PrivateFrameworks/Futhark.framework"];
  [v0 load];
  if ([v0 classNamed:@"FKTextDetector"]) {
    initWithContext_options__loadedOK = 1;
  }
  else {
    NSLog(&cfstr_Fktextdetector_0.isa);
  }
}

- (void)dealloc
{
  [(CITextDetector *)self setContext:0];
  textDetector = self->textDetector;
  if (textDetector)
  {

    self->textDetector = 0;
  }
  featureOptions = self->featureOptions;
  if (featureOptions) {

  }
  v5.receiver = self;
  v5.super_class = (Class)CITextDetector;
  [(CITextDetector *)&v5 dealloc];
}

- (id)featuresInImage:(id)a3 options:(id)a4
{
  v79[1] = *MEMORY[0x1E4F143B8];
  v7 = ci_signpost_log_detector();
  if ((unint64_t)&self->super.super.isa + 1 >= 2)
  {
    v56 = v7;
    if (os_signpost_enabled(v7))
    {
      LOWORD(buf.a) = 0;
      _os_signpost_emit_with_name_impl(&dword_193671000, v56, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "CITextDetector", "", (uint8_t *)&buf, 2u);
    }
  }
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v8 = __42__CITextDetector_featuresInImage_options___block_invoke;
  v75 = __42__CITextDetector_featuresInImage_options___block_invoke;
  v76 = &__block_descriptor_40_e5_v8__0l;
  v77 = self;
  if (!a3 || !self->textDetector)
  {
    id v59 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_33;
  }
  uint64_t v72 = 0;
  CVPixelBufferRef pixelBufferOut = 0;
  id v59 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  memset(&buf, 0, sizeof(buf));
  id v9 = -[CITextDetector adjustedImageFromImage:orientation:inverseCTM:](self, "adjustedImageFromImage:orientation:inverseCTM:", a3, objc_msgSend((id)objc_msgSend(a4, "valueForKey:", @"CIDetectorImageOrientation"), "intValue"), &buf);
  [v9 extent];
  double x = v80.origin.x;
  double y = v80.origin.y;
  double width = v80.size.width;
  double height = v80.size.height;
  self->_double width = CGRectGetWidth(v80);
  v81.origin.double x = x;
  v81.origin.double y = y;
  v81.size.double width = width;
  v81.size.double height = height;
  self->_double height = CGRectGetHeight(v81);
  [(FKTextDetector *)self->textDetector resetOptions];
  v14 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:self->featureOptions];
  [v14 addEntriesFromDictionary:a4];
  v15 = (void *)[v14 objectForKey:@"CIDetectorMinFeatureSize"];
  if (v15)
  {
    [v15 floatValue];
    [(FKTextDetector *)self->textDetector setMinimumCharacterHeight:(int)(self->_height * v16)];
  }
  v17 = (void *)[v14 objectForKey:@"CIDetectorDetectDiacritics"];
  if (v17) {
    -[FKTextDetector setDetectDiacritics:](self->textDetector, "setDetectDiacritics:", [v17 BOOLValue]);
  }
  v18 = (void *)[v14 objectForKey:@"CIDetectorReturnSubFeatures"];
  if (v18) {
    -[FKTextDetector setReturnSubFeatures:](self->textDetector, "setReturnSubFeatures:", [v18 BOOLValue]);
  }
  v19 = (void *)[v14 objectForKey:@"CITextDetectorMinimizeFalseDetections"];
  if (v19) {
    -[FKTextDetector setMinimizeFalseDetections:](self->textDetector, "setMinimizeFalseDetections:", [v19 BOOLValue]);
  }
  v20 = (void *)[v14 objectForKey:@"CIDetectorLanguage"];
  uint64_t v21 = [v14 objectForKey:@"CIDetectorExtraCharacters"];
  if (v20)
  {
    uint64_t v22 = v21;
    if (([v20 isEqualToString:@"CIDetectorLanguageNone"] & 1) == 0)
    {
      if ([v20 isEqualToString:@"CIDetectorLanguageASCII"])
      {
        v23 = @"ASCII";
      }
      else if ([v20 isEqualToString:@"CIDetectorLanguageEnglish"])
      {
        v23 = @"en";
      }
      else if ([v20 isEqualToString:@"CIDetectorLanguageDanish"])
      {
        v23 = @"da";
      }
      else if ([v20 isEqualToString:@"CIDetectorLanguageDutch"])
      {
        v23 = @"nl";
      }
      else if ([v20 isEqualToString:@"CIDetectorLanguageFrench"])
      {
        v23 = @"fr";
      }
      else if ([v20 isEqualToString:@"CIDetectorLanguageGerman"])
      {
        v23 = @"de";
      }
      else if ([v20 isEqualToString:@"CIDetectorLanguageIcelandic"])
      {
        v23 = @"is";
      }
      else if ([v20 isEqualToString:@"CIDetectorLanguageItalian"])
      {
        v23 = @"it";
      }
      else if ([v20 isEqualToString:@"CIDetectorLanguageNorwegian"])
      {
        v23 = @"no";
      }
      else if ([v20 isEqualToString:@"CIDetectorLanguagePortuguese"])
      {
        v23 = @"pt";
      }
      else
      {
        if (([v20 isEqualToString:@"CIDetectorLanguageSpanish"] & 1) == 0)
        {
          int v58 = [v20 isEqualToString:@"CIDetectorLanguageSwedish"];
          if (v58) {
            v23 = @"se";
          }
          else {
            v23 = 0;
          }
          if (!v22) {
            goto LABEL_15;
          }
          goto LABEL_57;
        }
        v23 = @"es";
      }
      int v58 = 1;
      if (!v22) {
        goto LABEL_15;
      }
LABEL_57:
      if (v58) {
        v23 = (__CFString *)[NSString stringWithFormat:@"%@;%@", v23, v22];
      }
      goto LABEL_15;
    }
  }
  v23 = 0;
LABEL_15:
  [(FKTextDetector *)self->textDetector setRecognitionLanguage:v23];
  uint64_t v78 = *MEMORY[0x1E4F24D20];
  v79[0] = MEMORY[0x1E4F1CC08];
  CVPixelBufferCreate(0, (unint64_t)self->_width, (unint64_t)self->_height, 0x34323066u, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:&v78 count:1], &pixelBufferOut);
  CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E4F24C18], (CFTypeRef)*MEMORY[0x1E4F24C40], kCVAttachmentMode_ShouldPropagate);
  if (pixelBufferOut)
  {
    v24 = [(CITextDetector *)self context];
    [(CIContext *)v24 render:v9 toCVPixelBuffer:pixelBufferOut];
    v25 = (void *)-[FKTextDetector detectFeaturesInBuffer:withRegionOfInterest:error:](self->textDetector, "detectFeaturesInBuffer:withRegionOfInterest:error:", pixelBufferOut, &v72, x, y, width, height);
    if (v72) {
      NSLog(&cfstr_TextDetectionF.isa, v72);
    }
    CVPixelBufferRelease(pixelBufferOut);
    unint64_t v26 = 0;
    v60 = v25;
    while ([v25 count] > v26)
    {
      unint64_t v61 = v26;
      v27 = (void *)[v25 objectAtIndex:v26];
      float v28 = self->_width;
      BoundingBodouble x = makeBoundingBox(v27, v28);
      CGFloat v31 = v30;
      CGFloat v33 = v32;
      CGFloat v35 = v34;
      v70.double x = 0.0;
      v70.double y = 0.0;
      v69.double x = 0.0;
      v69.double y = 0.0;
      v68.double x = 0.0;
      v68.double y = 0.0;
      v67.double x = 0.0;
      v67.double y = 0.0;
      float v36 = self->_width;
      *(float *)&CGFloat v30 = self->_height;
      v37 = objc_msgSend(v27, "subFeatures", makeCorners(v27, &v70, &v69, &v68, &v67, v36, *(float *)&v30));
      v38 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v37, "count"));
      for (unint64_t i = 0; [v37 count] > i; ++i)
      {
        v40 = (void *)[v37 objectAtIndex:i];
        float v41 = self->_width;
        double v42 = makeBoundingBox(v40, v41);
        CGFloat v44 = v43;
        CGFloat v46 = v45;
        CGFloat v48 = v47;
        v66.double x = 0.0;
        v66.double y = 0.0;
        v65.double x = 0.0;
        v65.double y = 0.0;
        v64.double x = 0.0;
        v64.double y = 0.0;
        v63.double x = 0.0;
        v63.double y = 0.0;
        float v49 = self->_width;
        *(float *)&CGFloat v43 = self->_height;
        uint64_t v50 = objc_msgSend(v40, "text", makeCorners(v40, &v66, &v65, &v64, &v63, v49, *(float *)&v43));
        v51 = [CITextFeature alloc];
        CGAffineTransform v62 = buf;
        v82.origin.double x = v42;
        v82.origin.double y = v44;
        v82.size.double width = v46;
        v82.size.double height = v48;
        CGRect v83 = CGRectApplyAffineTransform(v82, &v62);
        v52 = -[CITextFeature initWithBounds:topLeft:topRight:bottomLeft:bottomRight:subFeatures:messageString:](v51, "initWithBounds:topLeft:topRight:bottomLeft:bottomRight:subFeatures:messageString:", 0, v50, v83.origin.x, v83.origin.y, v83.size.width, v83.size.height, buf.tx + v66.y * buf.c + buf.a * v66.x, buf.ty + v66.y * buf.d + buf.b * v66.x, buf.tx + buf.c * v64.y + buf.a * v64.x, buf.ty + buf.d * v64.y + buf.b * v64.x, buf.tx + buf.c * v65.y + buf.a * v65.x, buf.ty + buf.d * v65.y + buf.b * v65.x, buf.tx + buf.c * v63.y + buf.a * v63.x, buf.ty + buf.d * v63.y + buf.b * v63.x);
        if (v52) {
          [v38 addObject:v52];
        }
      }
      uint64_t v53 = [v27 text];
      v54 = [CITextFeature alloc];
      CGAffineTransform v62 = buf;
      v84.origin.double x = BoundingBox;
      v84.origin.double y = v31;
      v84.size.double width = v33;
      v84.size.double height = v35;
      CGRect v85 = CGRectApplyAffineTransform(v84, &v62);
      v55 = -[CITextFeature initWithBounds:topLeft:topRight:bottomLeft:bottomRight:subFeatures:messageString:](v54, "initWithBounds:topLeft:topRight:bottomLeft:bottomRight:subFeatures:messageString:", v38, v53, v85.origin.x, v85.origin.y, v85.size.width, v85.size.height, buf.tx + v70.y * buf.c + buf.a * v70.x, buf.ty + v70.y * buf.d + buf.b * v70.x, buf.tx + buf.c * v68.y + buf.a * v68.x, buf.ty + buf.d * v68.y + buf.b * v68.x, buf.tx + buf.c * v69.y + buf.a * v69.x, buf.ty + buf.d * v69.y + buf.b * v69.x, buf.tx + buf.c * v67.y + buf.a * v67.x, buf.ty + buf.d * v67.y + buf.b * v67.x);
      if (v55) {
        [v59 addObject:v55];
      }

      v25 = v60;
      unint64_t v26 = v61 + 1;
    }
  }
  else
  {
    id v59 = (id)MEMORY[0x1E4F1CBF0];
  }
  v8 = v75;
LABEL_33:
  v8((uint64_t)v74);
  return v59;
}

void __42__CITextDetector_featuresInImage_options___block_invoke(uint64_t a1)
{
  v2 = ci_signpost_log_detector();
  os_signpost_id_t v3 = *(void *)(a1 + 32);
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v4 = v2;
    if (os_signpost_enabled(v2))
    {
      *(_WORD *)objc_super v5 = 0;
      _os_signpost_emit_with_name_impl(&dword_193671000, v4, OS_SIGNPOST_INTERVAL_END, v3, "CITextDetector", "", v5, 2u);
    }
  }
}

- (id)featuresInImage:(id)a3
{
  return [(CITextDetector *)self featuresInImage:a3 options:0];
}

- (CIContext)context
{
  return self->context;
}

- (void)setContext:(id)a3
{
}

- (CGAffineTransform)ctmForImageWithBounds:(SEL)a3 orientation:(CGRect)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  double v5 = fmax(a4.size.width, a4.size.height);
  t1.b = 0.0;
  t1.c = 0.0;
  v16[0] = 0x3FF0000000000000;
  v16[1] = 0;
  v16[2] = 0;
  v16[3] = 0x3FF0000000000000;
  v16[4] = 0;
  v16[5] = 0;
  v16[6] = 0xBFF0000000000000;
  v16[7] = 0;
  v16[8] = 0;
  v16[9] = 0x3FF0000000000000;
  double v6 = 1024.0 / v5;
  BOOL v7 = v5 <= 1228.0;
  double v8 = 1.0;
  if (!v7) {
    double v8 = v6;
  }
  *(double *)&v16[10] = a4.size.width * v8;
  long long v17 = xmmword_193953160;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  unint64_t v20 = 0xBFF0000000000000;
  double v21 = a4.size.width * v8;
  double v22 = a4.size.height * v8;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v23 = 0x3FF0000000000000;
  long long v26 = xmmword_193951E50;
  long long v28 = xmmword_193953160;
  long long v29 = xmmword_193951E50;
  double v27 = a4.size.height * v8;
  double v30 = a4.size.height * v8;
  double v31 = a4.size.width * v8;
  long long v32 = xmmword_193953160;
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  uint64_t v33 = 0x3FF0000000000000;
  double v36 = a4.size.width * v8;
  long long v37 = xmmword_193953170;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v38 = 0x3FF0000000000000;
  uint64_t v41 = 0x3FF0000000000000;
  long long v42 = xmmword_193951E50;
  double v43 = a4.size.height * v8;
  uint64_t v44 = 0;
  if ((a5 - 9) >= 0xFFFFFFF8) {
    int v9 = a5 - 1;
  }
  else {
    int v9 = 0;
  }
  float v10 = &v16[6 * v9];
  t1.a = v8;
  t1.d = v8;
  CGFloat y = a4.origin.y;
  *(int8x16_t *)&t1.tdouble x = vandq_s8((int8x16_t)vmulq_n_f64(vnegq_f64((float64x2_t)a4.origin), v8), (int8x16_t)vcgtq_f64(vabsq_f64((float64x2_t)a4.origin), (float64x2_t)vdupq_n_s64(0x3F847AE147AE147BuLL)));
  long long v12 = v10[1];
  *(_OWORD *)&v14.a = *v10;
  *(_OWORD *)&v14.c = v12;
  *(_OWORD *)&v14.tdouble x = v10[2];
  return CGAffineTransformConcat(retstr, &t1, &v14);
}

- (id)adjustedImageFromImage:(id)a3 orientation:(int)a4 inverseCTM:(CGAffineTransform *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  memset(&v13, 0, sizeof(v13));
  [a3 extent];
  if (self) {
    -[CITextDetector ctmForImageWithBounds:orientation:](self, "ctmForImageWithBounds:orientation:", v6);
  }
  else {
    memset(&v13, 0, sizeof(v13));
  }
  CGAffineTransform v11 = v13;
  CGAffineTransformInvert(&v12, &v11);
  long long v9 = *(_OWORD *)&v12.c;
  *(_OWORD *)&a5->a = *(_OWORD *)&v12.a;
  *(_OWORD *)&a5->c = v9;
  *(_OWORD *)&a5->tdouble x = *(_OWORD *)&v12.tx;
  CGAffineTransform v12 = v13;
  if (!CGAffineTransformIsIdentity(&v12))
  {
    CGAffineTransform v12 = v13;
    return (id)[v7 imageByApplyingTransform:&v12];
  }
  return v7;
}

@end