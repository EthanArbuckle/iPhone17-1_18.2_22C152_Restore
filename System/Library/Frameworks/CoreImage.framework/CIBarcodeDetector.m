@interface CIBarcodeDetector
- (CIBarcodeDetector)initWithContext:(id)a3 options:(id)a4;
- (CIContext)context;
- (id)featuresInImage:(id)a3;
- (id)featuresInImage:(id)a3 options:(id)a4;
- (void)dealloc;
- (void)setContext:(id)a3;
@end

@implementation CIBarcodeDetector

- (CIBarcodeDetector)initWithContext:(id)a3 options:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CIBarcodeDetector;
  v6 = [(CIDetector *)&v9 init];
  if (v6)
  {
    if (!a3) {
      a3 = +[CIContext _singletonContext];
    }
    [(CIBarcodeDetector *)v6 setContext:a3];
    if (!v6->featureOptions) {
      v6->featureOptions = (NSMutableDictionary *)(id)[MEMORY[0x1E4F1CA60] dictionary];
    }
    v7 = (void *)[a4 objectForKey:@"CIDetectorAccuracy"];
    if ([v7 isEqual:@"CIDetectorAccuracyHigh"])
    {
      [(NSMutableDictionary *)v6->featureOptions setObject:@"CIDetectorAccuracyHigh" forKey:@"CIDetectorAccuracy"];
    }
    else if (v7 && ([v7 isEqual:@"CIDetectorAccuracyLow"] & 1) == 0)
    {
      NSLog(&cfstr_UnknownCidetec.isa);
    }
  }
  return v6;
}

- (void)dealloc
{
  [(CIBarcodeDetector *)self setContext:0];
  featureOptions = self->featureOptions;
  if (featureOptions) {

  }
  v4.receiver = self;
  v4.super_class = (Class)CIBarcodeDetector;
  [(CIBarcodeDetector *)&v4 dealloc];
}

- (id)featuresInImage:(id)a3 options:(id)a4
{
  values[1] = *(void **)MEMORY[0x1E4F143B8];
  v6 = ci_signpost_log_detector();
  if ((unint64_t)&self->super.super.isa + 1 >= 2)
  {
    v26 = v6;
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_193671000, v26, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "CIBarcodeDetector", "", buf, 2u);
    }
  }
  v112[0] = MEMORY[0x1E4F143A8];
  v112[1] = 3221225472;
  v113 = __45__CIBarcodeDetector_featuresInImage_options___block_invoke;
  v114 = &__block_descriptor_40_e5_v8__0l;
  v115 = self;
  ACBS = loadACBS();
  v8 = ACBS;
  if (!ACBS || (uint64_t v9 = ((uint64_t (*)(void))*ACBS)()) == 0)
  {
    id v92 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_69;
  }
  uint64_t v90 = v9;
  CVPixelBufferRef pixelBufferOut = 0;
  values[0] = @"QR";
  CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFArrayRef cf = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)values, 1, MEMORY[0x1E4F1D510]);
  if (!cf) {
    __assert_rtn("-[CIBarcodeDetector featuresInImage:options:]", "CIBarcodeDetector.mm", 89, "NULL != symbologies");
  }
  id v92 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [a3 extent];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGAffineTransformMakeTranslation(&v110, -v11, -v13);
  uint64_t v19 = [a3 imageByApplyingTransform:&v110];
  v119.origin.x = v12;
  v119.origin.y = v14;
  v119.size.width = v16;
  v119.size.height = v18;
  self->_width = CGRectGetWidth(v119);
  v120.origin.x = v12;
  v120.origin.y = v14;
  v120.size.width = v16;
  v120.size.height = v18;
  self->_height = CGRectGetHeight(v120);
  uint64_t v116 = *MEMORY[0x1E4F24D20];
  uint64_t v117 = MEMORY[0x1E4F1CC08];
  CVPixelBufferCreate(0, (unint64_t)self->_width, (unint64_t)self->_height, 0x34323066u, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v117 forKeys:&v116 count:1], &pixelBufferOut);
  CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E4F24C18], (CFTypeRef)*MEMORY[0x1E4F24C40], kCVAttachmentMode_ShouldPropagate);
  if (!pixelBufferOut)
  {
    CFDictionaryRef theDict = 0;
LABEL_66:
    ((void (*)(uint64_t))v8[1])(v90);
    if (theDict) {
      CFRelease(theDict);
    }
    CFRelease(cf);
    goto LABEL_69;
  }
  v20 = [(CIBarcodeDetector *)self context];
  [(CIContext *)v20 render:v19 toCVPixelBuffer:pixelBufferOut];
  CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
  size_t Width = CVPixelBufferGetWidth(pixelBufferOut);
  size_t Height = CVPixelBufferGetHeight(pixelBufferOut);
  ((void (*)(uint64_t, CFArrayRef))v8[4])(v90, cf);
  ((void (*)(uint64_t, uint64_t))v8[2])(v90, 5000);
  CFDictionaryRef theDict = (CFDictionaryRef)((uint64_t (*)(uint64_t, CVPixelBufferRef, void, double, double, double, double))v8[3])(v90, pixelBufferOut, 0, 0.0, 0.0, (double)Width, (double)Height);
  CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
  if (theDict)
  {
    CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(theDict, @"SymbolDescriptionArray");
    CFArrayRef v24 = Value;
    if (Value)
    {
      int Count = CFArrayGetCount(Value);
      goto LABEL_15;
    }
  }
  else
  {
    CFArrayRef v24 = 0;
  }
  int Count = 0;
LABEL_15:
  Mutable = CFArrayCreateMutable(v10, 4, MEMORY[0x1E4F1D510]);
  if (Count >= 1)
  {
    CFIndex v28 = 0;
    uint64_t v29 = Count;
    do
    {
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v24, v28);
      v31 = CFDictionaryGetValue(ValueAtIndex, @"BarcodeType");
      if (CFEqual(v31, @"QR")) {
        CFArrayAppendValue(Mutable, ValueAtIndex);
      }
      ++v28;
    }
    while (v29 != v28);
  }
  if (!Mutable) {
    goto LABEL_65;
  }
  int v32 = CFArrayGetCount(Mutable);
  if (v32 < 1)
  {
LABEL_64:
    CFRelease(Mutable);
LABEL_65:
    CVPixelBufferRelease(pixelBufferOut);
    goto LABEL_66;
  }
  CFIndex v33 = 0;
  uint64_t v91 = v32;
  while (1)
  {
    CFDictionaryRef v34 = (const __CFDictionary *)CFArrayGetValueAtIndex(Mutable, v33);
    v35 = (void *)CFDictionaryGetValue(v34, @"CodeLocation");
    v36 = (void *)[v35 objectAtIndex:0];
    objc_msgSend((id)objc_msgSend(v36, "objectForKey:", @"X"), "floatValue");
    float v38 = v37;
    objc_msgSend((id)objc_msgSend(v36, "objectForKey:", @"Y"), "floatValue");
    float v40 = v39;
    v41 = (void *)[v35 objectAtIndex:1];
    objc_msgSend((id)objc_msgSend(v41, "objectForKey:", @"X"), "floatValue");
    float v43 = v42;
    objc_msgSend((id)objc_msgSend(v41, "objectForKey:", @"Y"), "floatValue");
    float v45 = v44;
    v46 = (void *)[v35 objectAtIndex:2];
    objc_msgSend((id)objc_msgSend(v46, "objectForKey:", @"X"), "floatValue");
    float v48 = v47;
    objc_msgSend((id)objc_msgSend(v46, "objectForKey:", @"Y"), "floatValue");
    float v50 = v49;
    v51 = (void *)[v35 objectAtIndex:3];
    objc_msgSend((id)objc_msgSend(v51, "objectForKey:", @"X"), "floatValue");
    float v53 = v52;
    objc_msgSend((id)objc_msgSend(v51, "objectForKey:", @"Y"), "floatValue");
    double v54 = v38;
    double v55 = v43;
    double v56 = v50;
    double v57 = v53;
    double v59 = self->_height;
    double v60 = v59 - v40;
    float v61 = v43;
    double v62 = v59 - v45;
    float v63 = v38;
    double v64 = v59 - v56;
    double v65 = v59 - v58;
    if (v48 >= v53) {
      double v66 = v53;
    }
    else {
      double v66 = v48;
    }
    double v95 = v48;
    double v96 = v55;
    if (v48 <= v53) {
      double v67 = v53;
    }
    else {
      double v67 = v48;
    }
    BOOL v68 = v63 <= v61;
    if (v63 >= v61) {
      double v69 = v55;
    }
    else {
      double v69 = v54;
    }
    if (v68) {
      double v70 = v55;
    }
    else {
      double v70 = v54;
    }
    if (v69 >= v66) {
      double v71 = v66;
    }
    else {
      double v71 = v69;
    }
    if (v70 <= v67) {
      double v72 = v67;
    }
    else {
      double v72 = v70;
    }
    if (v64 >= v65) {
      double v73 = v65;
    }
    else {
      double v73 = v64;
    }
    if (v64 <= v65) {
      double v74 = v65;
    }
    else {
      double v74 = v64;
    }
    if (v60 >= v62) {
      double v75 = v62;
    }
    else {
      double v75 = v60;
    }
    if (v60 <= v62) {
      double v76 = v62;
    }
    else {
      double v76 = v60;
    }
    if (v75 >= v73) {
      double v77 = v73;
    }
    else {
      double v77 = v75;
    }
    if (v76 <= v74) {
      double v78 = v74;
    }
    else {
      double v78 = v76;
    }
    double v93 = v78;
    double v94 = v72;
    CFDictionaryRef v79 = (const __CFDictionary *)CFDictionaryGetValue(v34, @"CodeProperties");
    unsigned int v80 = objc_msgSend((id)CFDictionaryGetValue(v79, @"ErrorCorrectionLevel"), "intValue");
    if (v80 >= 4) {
      __assert_rtn("-[CIBarcodeDetector featuresInImage:options:]", "CIBarcodeDetector.mm", 187, "0 && \"unreachable\"");
    }
    uint64_t v81 = qword_19394CD20[v80];
    uint64_t v82 = objc_msgSend((id)CFDictionaryGetValue(v79, @"SymbolVersion"), "integerValue");
    uint64_t v83 = objc_msgSend((id)CFDictionaryGetValue(v79, @"QRMASK"), "unsignedCharValue");
    v84 = (id)CFDictionaryGetValue(v34, @"BarcodeRawData");
    if (!v84) {
      break;
    }
    v85 = +[CIQRCodeDescriptor descriptorWithPayload:v84 symbolVersion:v82 maskPattern:v83 errorCorrectionLevel:v81];
    *(double *)buf = v71;
    double v98 = v77;
    double v99 = v94 - v71;
    double v100 = v93 - v77;
    double v101 = v54;
    double v102 = v60;
    double v103 = v57;
    double v104 = v65;
    double v105 = v96;
    double v106 = v62;
    double v107 = v95;
    double v108 = v64;
    v109 = v85;
    v86 = [[CIQRCodeFeature alloc] initWithInternalRepresentation:buf];

    if (v86) {
      [v92 addObject:v86];
    }

    if (v91 == ++v33) {
      goto LABEL_64;
    }
  }
  id v92 = 0;
LABEL_69:
  v113((uint64_t)v112);
  return v92;
}

void __45__CIBarcodeDetector_featuresInImage_options___block_invoke(uint64_t a1)
{
  v2 = ci_signpost_log_detector();
  os_signpost_id_t v3 = *(void *)(a1 + 32);
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_super v4 = v2;
    if (os_signpost_enabled(v2))
    {
      *(_WORD *)v5 = 0;
      _os_signpost_emit_with_name_impl(&dword_193671000, v4, OS_SIGNPOST_INTERVAL_END, v3, "CIBarcodeDetector", "", v5, 2u);
    }
  }
}

- (id)featuresInImage:(id)a3
{
  return [(CIBarcodeDetector *)self featuresInImage:a3 options:0];
}

- (CIContext)context
{
  return self->context;
}

- (void)setContext:(id)a3
{
}

@end