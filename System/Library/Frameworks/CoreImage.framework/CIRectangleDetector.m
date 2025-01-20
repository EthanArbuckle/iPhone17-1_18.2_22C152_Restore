@interface CIRectangleDetector
- (CIContext)context;
- (CIRectangleDetector)initWithContext:(id)a3 options:(id)a4;
- (id)featuresInImage:(id)a3;
- (id)featuresInImage:(id)a3 options:(id)a4;
- (void)dealloc;
- (void)releaseResources;
- (void)setContext:(id)a3;
@end

@implementation CIRectangleDetector

- (CIRectangleDetector)initWithContext:(id)a3 options:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)CIRectangleDetector;
  v6 = [(CIDetector *)&v15 init];
  if (v6)
  {
    if (!a3) {
      a3 = +[CIContext _singletonContext];
    }
    [(CIRectangleDetector *)v6 setContext:a3];
    v6->featureOptions = (NSMutableDictionary *)(id)[MEMORY[0x1E4F1CA60] dictionary];
    v7 = (void *)[a4 objectForKey:@"CIDetectorAccuracy"];
    if ([v7 isEqual:@"CIDetectorAccuracyHigh"])
    {
      [(NSMutableDictionary *)v6->featureOptions setObject:@"CIDetectorAccuracyHigh" forKey:@"CIDetectorAccuracy"];
    }
    else if (v7 && ([v7 isEqual:@"CIDetectorAccuracyLow"] & 1) == 0)
    {
      NSLog(&cfstr_UnknownCidetec.isa);
    }
    v8 = (void *)[a4 objectForKey:@"CIDetectorMinFeatureSize"];
    if (v8)
    {
      v9 = v8;
      [v8 floatValue];
      if (v10 >= 0.2 && ([v9 floatValue], v11 <= 1.0)) {
        [(NSMutableDictionary *)v6->featureOptions setObject:v9 forKey:@"CIDetectorMinFeatureSize"];
      }
      else {
        NSLog(&cfstr_InvalidCidetec.isa);
      }
    }
    v12 = (void *)[a4 objectForKey:@"CIDetectorMaxFeatureCount"];
    if (v12)
    {
      v13 = v12;
      if ((int)[v12 intValue] <= 0) {
        NSLog(&cfstr_InvalidOptionm.isa);
      }
      else {
        [(NSMutableDictionary *)v6->featureOptions setObject:v13 forKey:@"CIDetectorMaxFeatureCount"];
      }
    }
  }
  return v6;
}

- (void)releaseResources
{
  [(CIRectangleDetector *)self setContext:0];
  featureOptions = self->featureOptions;
  if (featureOptions)
  {
  }
}

- (void)dealloc
{
  [(CIRectangleDetector *)self releaseResources];
  v3.receiver = self;
  v3.super_class = (Class)CIRectangleDetector;
  [(CIRectangleDetector *)&v3 dealloc];
}

- (id)featuresInImage:(id)a3
{
  return [(CIRectangleDetector *)self featuresInImage:a3 options:0];
}

- (id)featuresInImage:(id)a3 options:(id)a4
{
  v81[1] = *MEMORY[0x1E4F143B8];
  v7 = ci_signpost_log_detector();
  if ((unint64_t)&self->super.super.isa + 1 >= 2)
  {
    v12 = v7;
    if (os_signpost_enabled(v7))
    {
      LOWORD(buf.a) = 0;
      _os_signpost_emit_with_name_impl(&dword_193671000, v12, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "CIRectangleDetector", "", (uint8_t *)&buf, 2u);
    }
  }
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v71 = __47__CIRectangleDetector_featuresInImage_options___block_invoke;
  v72 = &__block_descriptor_40_e5_v8__0l;
  v73 = self;
  if (a3)
  {
    [a3 extent];
    CGFloat x = v82.origin.x;
    CGFloat y = v82.origin.y;
    CGFloat width = v82.size.width;
    CGFloat height = v82.size.height;
    if (CGRectIsEmpty(v82))
    {
LABEL_58:
      a3 = (id)MEMORY[0x1E4F1CBF0];
      goto LABEL_59;
    }
    v83.origin.CGFloat x = x;
    v83.origin.CGFloat y = y;
    v83.size.CGFloat width = width;
    v83.size.CGFloat height = height;
    if (CGRectIsInfinite(v83))
    {
      NSLog(&cfstr_CannotFindFeat.isa);
      goto LABEL_58;
    }
    uint64_t v69 = 0;
    buf.double a = 0.0;
    *(void *)&buf.double b = &buf;
    *(void *)&buf.c = 0x3052000000;
    *(void *)&buf.d = __Block_byref_object_copy__15;
    *(void *)&buf.tCGFloat x = __Block_byref_object_dispose__15;
    v13 = (objc_class *)getVNDetectRectanglesRequestClass(void)::softClass;
    *(void *)&buf.tCGFloat y = getVNDetectRectanglesRequestClass(void)::softClass;
    if (!getVNDetectRectanglesRequestClass(void)::softClass)
    {
      uint64_t v74 = MEMORY[0x1E4F143A8];
      uint64_t v75 = 3221225472;
      uint64_t v76 = (uint64_t)___ZL33getVNDetectRectanglesRequestClassv_block_invoke;
      v77 = &unk_1E57710B8;
      p_CGAffineTransform buf = &buf;
      ___ZL33getVNDetectRectanglesRequestClassv_block_invoke((uint64_t)&v74);
      v13 = *(objc_class **)(*(void *)&buf.b + 40);
    }
    _Block_object_dispose(&buf, 8);
    id v14 = objc_alloc_init(v13);
    if (!v14)
    {
      NSLog(&cfstr_UnableToCreate.isa);
      goto LABEL_58;
    }
    objc_super v15 = (__CFString *)[a4 objectForKey:@"CIDetectorAccuracy"];
    if (!v15)
    {
      uint64_t v16 = [(NSMutableDictionary *)self->featureOptions objectForKey:@"CIDetectorAccuracy"];
      if (v16) {
        objc_super v15 = (__CFString *)v16;
      }
      else {
        objc_super v15 = @"CIDetectorAccuracyHigh";
      }
    }
    v17 = (void *)[a4 objectForKey:@"CIDetectorMinFeatureSize"];
    if (!v17) {
      v17 = (void *)[(NSMutableDictionary *)self->featureOptions objectForKey:@"CIDetectorMinFeatureSize"];
    }
    v18 = (void *)[a4 objectForKey:@"CIDetectorMaxFeatureCount"];
    if (!v18) {
      v18 = (void *)[(NSMutableDictionary *)self->featureOptions objectForKey:@"CIDetectorMaxFeatureCount"];
    }
    v19 = (void *)[a4 objectForKey:@"CIDetectorAspectRatio"];
    if (!v19) {
      v19 = (void *)[(NSMutableDictionary *)self->featureOptions objectForKey:@"CIDetectorAspectRatio"];
    }
    LODWORD(v20) = 0.5;
    [v14 setMinimumConfidence:v20];
    LODWORD(v21) = 15.0;
    [v14 setQuadratureTolerance:v21];
    if (v18) {
      int v22 = [v18 intValue];
    }
    else {
      int v22 = 1;
    }
    [v14 setMaximumObservations:v22];
    if (v17) {
      [v17 floatValue];
    }
    else {
      LODWORD(v23) = 1045220557;
    }
    [v14 setMinimumSize:v23];
    if (v19)
    {
      [v19 floatValue];
      if (*(float *)&v24 <= 1.0) {
        float v25 = *(float *)&v24;
      }
      else {
        float v25 = 1.0 / *(float *)&v24;
      }
      *(float *)&double v24 = v25 * 0.93;
      if ((float)(v25 * 0.93) < 0.0) {
        *(float *)&double v24 = 0.0;
      }
      [v14 setMinimumAspectRatio:v24];
      *(float *)&double v26 = v25 * 1.07;
      if ((float)(v25 * 1.07) > 1.0) {
        *(float *)&double v26 = 1.0;
      }
      [v14 setMaximumAspectRatio:v26];
    }
    v27 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    if ([(CIRectangleDetector *)self context])
    {
      context = self->context;
      uint64_t v74 = 0;
      uint64_t v75 = (uint64_t)&v74;
      uint64_t v76 = 0x2020000000;
      v29 = (void *)getVNImageOptionCIContextSymbolLoc(void)::ptr;
      v77 = (void *)getVNImageOptionCIContextSymbolLoc(void)::ptr;
      if (!getVNImageOptionCIContextSymbolLoc(void)::ptr)
      {
        *(void *)&buf.double a = MEMORY[0x1E4F143A8];
        *(void *)&buf.double b = 3221225472;
        *(void *)&buf.c = ___ZL34getVNImageOptionCIContextSymbolLocv_block_invoke_0;
        *(void *)&buf.d = &unk_1E57710B8;
        *(void *)&buf.tCGFloat x = &v74;
        v30 = (void *)VisionLibrary();
        v31 = dlsym(v30, "VNImageOptionCIContext");
        *(void *)(*(void *)(*(void *)&buf.tx + 8) + 24) = v31;
        getVNImageOptionCIContextSymbolLoc(void)::ptr = *(void *)(*(void *)(*(void *)&buf.tx + 8) + 24);
        v29 = *(void **)(v75 + 24);
      }
      _Block_object_dispose(&v74, 8);
      if (!v29)
      {
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", @"NSString *getVNImageOptionCIContext()", @"CIVision.h", 61, @"%s", dlerror());
        __break(1u);
      }
      [v27 setObject:context forKey:*v29];
    }
    if (([(__CFString *)v15 isEqual:@"CIDetectorAccuracyHigh"] & 1) == 0) {
      [v27 setObject:@"VNRequestOptionDetectionLevel_Fast" forKey:@"VNRequestOptionDetectionLevel"];
    }
    buf.double a = 0.0;
    *(void *)&buf.double b = &buf;
    *(void *)&buf.c = 0x3052000000;
    *(void *)&buf.d = __Block_byref_object_copy__15;
    *(void *)&buf.tCGFloat x = __Block_byref_object_dispose__15;
    v32 = (objc_class *)getVNImageRequestHandlerClass(void)::softClass;
    *(void *)&buf.tCGFloat y = getVNImageRequestHandlerClass(void)::softClass;
    if (!getVNImageRequestHandlerClass(void)::softClass)
    {
      uint64_t v74 = MEMORY[0x1E4F143A8];
      uint64_t v75 = 3221225472;
      uint64_t v76 = (uint64_t)___ZL29getVNImageRequestHandlerClassv_block_invoke_0;
      v77 = &unk_1E57710B8;
      p_CGAffineTransform buf = &buf;
      ___ZL29getVNImageRequestHandlerClassv_block_invoke_0((uint64_t)&v74);
      v32 = *(objc_class **)(*(void *)&buf.b + 40);
    }
    _Block_object_dispose(&buf, 8);
    v33 = (void *)[[v32 alloc] initWithCIImage:a3 options:v27];
    id v34 = v33;
    v81[0] = v14;
    if ((objc_msgSend(v33, "performRequests:error:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v81, 1), &v69) & 1) == 0)goto LABEL_58; {
    v35 = (void *)[v14 results];
    }
    if (![v35 count]) {
      goto LABEL_58;
    }
    a3 = (id)[MEMORY[0x1E4F1CA48] array];
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    uint64_t v36 = [v35 countByEnumeratingWithState:&v65 objects:v80 count:16];
    if (v36)
    {
      uint64_t v37 = *(void *)v66;
      double v58 = height;
      double v59 = width;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v66 != v37) {
            objc_enumerationMutation(v35);
          }
          v39 = *(void **)(*((void *)&v65 + 1) + 8 * i);
          [v39 topLeft];
          double v41 = v40;
          double v43 = v42;
          [v39 topRight];
          double v45 = v44;
          double v47 = v46;
          [v39 bottomLeft];
          double v62 = v49;
          double v63 = v48;
          [v39 bottomRight];
          double v60 = v51;
          double v61 = v50;
          memset(&buf, 0, sizeof(buf));
          CGAffineTransformMakeScale(&buf, width, height);
          double a = buf.a;
          double b = buf.b;
          long long v54 = *(_OWORD *)&buf.c;
          long long v55 = *(_OWORD *)&buf.tx;
          [v39 boundingBox];
          CGAffineTransform v64 = buf;
          CGRect v85 = CGRectApplyAffineTransform(v84, &v64);
          v56 = -[CIRectangleFeature initWithBounds:topLeft:topRight:bottomLeft:bottomRight:]([CIRectangleFeature alloc], "initWithBounds:topLeft:topRight:bottomLeft:bottomRight:", v85.origin.x, v85.origin.y, v85.size.width, v85.size.height, *(double *)&v55 + v43 * *(double *)&v54 + a * v41, *((double *)&v55 + 1) + v43 * *((double *)&v54 + 1) + b * v41, *(double *)&v55 + v47 * *(double *)&v54 + a * v45, *((double *)&v55 + 1) + v47 * *((double *)&v54 + 1) + b * v45, *(double *)&v55 + v62 * *(double *)&v54 + a * v63, *((double *)&v55 + 1) + v62 * *((double *)&v54 + 1) + b * v63, *(double *)&v55 + v60 * *(double *)&v54 + a * v61, *((double *)&v55 + 1) + v60 * *((double *)&v54 + 1) + b * v61);
          if (v56)
          {
            [a3 addObject:v56];
          }
          CGFloat height = v58;
          CGFloat width = v59;
        }
        uint64_t v36 = [v35 countByEnumeratingWithState:&v65 objects:v80 count:16];
      }
      while (v36);
    }
  }
LABEL_59:
  v71((uint64_t)v70);
  return a3;
}

void __47__CIRectangleDetector_featuresInImage_options___block_invoke(uint64_t a1)
{
  v2 = ci_signpost_log_detector();
  os_signpost_id_t v3 = *(void *)(a1 + 32);
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v4 = v2;
    if (os_signpost_enabled(v2))
    {
      *(_WORD *)v5 = 0;
      _os_signpost_emit_with_name_impl(&dword_193671000, v4, OS_SIGNPOST_INTERVAL_END, v3, "CIRectangleDetector", "", v5, 2u);
    }
  }
}

- (CIContext)context
{
  return self->context;
}

- (void)setContext:(id)a3
{
}

@end