@interface IHKSliderNetCPModel
+ (id)loadJSonFrom:(id)a3;
+ (id)loadModelAtPath:(id)a3;
+ (id)loadModelAtPath:(id)a3 options:(id)a4 error:(id *)a5;
- (BOOL)checkColorspaceForPixelBuffer:(__CVBuffer *)a3 error:(id *)a4;
- (BOOL)pixelBufferShapesMatchRequirement:(__CVBuffer *)a3;
- (BOOL)useClipEmbedding;
- (CGColorSpace)colorSpace;
- (CGColorSpace)extractColorSpaceFromInfo:(id)a3;
- (CGSize)imageSize;
- (IHKFilterSequence)filterSequence;
- (IHKSliderNetCPModel)initWithModel:(id)a3;
- (IHKSliderNetCPModel)initWithModel:(id)a3 options:(id)a4 error:(id *)a5;
- (IHKSliderNetCPModel)initWithModelType:(unint64_t)a3;
- (IHKSliderNetCPModel)initWithModelType:(unint64_t)a3 options:(id)a4 error:(id *)a5;
- (NSArray)sliderOrder;
- (NSDictionary)info;
- (NSDictionary)sliderSpecs;
- (PixelBufferTensor)preprocessTensor:(SEL)a3;
- (__CVBuffer)preprocessPixelBuffer:(__CVBuffer *)a3 error:(id *)a4;
- (__CVBuffer)resizePixelBuffer:(__CVBuffer *)a3 targetSize:(CGSize)a4;
- (float)gatingScoreForStyleVector:(id)a3 contentVector:(id)a4;
- (float)gatingScoreForStyleVector:(id)a3 contentVector:(id)a4 error:(id *)a5;
- (float)gatingScoreToTransferStyleFrom:(id)a3 to:(id)a4 error:(id *)a5;
- (id).cxx_construct;
- (id)applyAdjustments:(id)a3 toCIImage:(id)a4 error:(id *)a5;
- (id)computeClipEmbeddingForImage:(__CVBuffer *)a3 error:(id *)a4;
- (id)predictContentVectorForPixelBuffer:(__CVBuffer *)a3 error:(id *)a4;
- (id)predictContentVectorForPixelBuffer:(__CVBuffer *)a3 scenePrint:(id)a4 error:(id *)a5;
- (id)predictSlidersForStyleVector:(id)a3 contentVector:(id)a4 error:(id *)a5;
- (id)predictSlidersToTransferStyleFrom:(id)a3 to:(id)a4 error:(id *)a5;
- (id)predictStylePrintForPixelBuffer:(__CVBuffer *)a3 error:(id *)a4;
- (id)predictStylePrintForPixelBuffer:(__CVBuffer *)a3 scenePrint:(id)a4 error:(id *)a5;
- (id)predictStyleVectorForPixelBuffer:(__CVBuffer *)a3 error:(id *)a4;
- (id)predictStyleVectorForPixelBuffer:(__CVBuffer *)a3 scenePrint:(id)a4 error:(id *)a5;
- (shared_ptr<ik::PixelBufferTransfer>)resampler;
- (unint64_t)gatingMethod;
- (unint64_t)product:(id)a3;
- (void)setGatingMethod:(unint64_t)a3;
- (void)setInfo:(id)a3;
@end

@implementation IHKSliderNetCPModel

- (unint64_t)product:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = a3;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v14, (uint64_t)v18, 16);
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    unint64_t v11 = 1;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v3);
        }
        v11 *= objc_msgSend_unsignedIntValue(*(void **)(*((void *)&v14 + 1) + 8 * i), v5, v6, v7, v8, (void)v14);
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v5, (uint64_t)&v14, (uint64_t)v18, 16);
    }
    while (v9);
  }
  else
  {
    unint64_t v11 = 1;
  }

  return v11;
}

+ (id)loadJSonFrom:(id)a3
{
  id v3 = a3;
  id v4 = [NSString alloc];
  id v18 = 0;
  uint64_t v6 = objc_msgSend_initWithContentsOfFile_encoding_error_(v4, v5, (uint64_t)v3, 4, (uint64_t)&v18);
  id v7 = v18;
  unint64_t v11 = v7;
  if (v7) {
    NSLog(&cfstr_Error.isa, v7);
  }
  v12 = objc_msgSend_dataUsingEncoding_(v6, v8, 4, v9, v10);
  id v17 = v11;
  long long v14 = objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x263F08900], v13, (uint64_t)v12, 0, (uint64_t)&v17);
  id v15 = v17;

  if (v15) {
    NSLog(&cfstr_Error.isa, v15);
  }

  return v14;
}

- (CGColorSpace)extractColorSpaceFromInfo:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_objectForKeyedSubscript_(v4, v5, @"colorspace", v6, v7);

  if (v8)
  {
    v13 = objc_msgSend_info(self, v9, v10, v11, v12);
    id v17 = objc_msgSend_objectForKeyedSubscript_(v13, v14, @"colorspace", v15, v16);

    if (objc_msgSend_isEqualToString_(v17, v18, @"sRGB", v19, v20))
    {
      v24 = (CFStringRef *)MEMORY[0x263F002D8];
    }
    else
    {
      if (!objc_msgSend_isEqualToString_(v17, v21, @"P3", v22, v23))
      {
        NSLog(&cfstr_UnrecognizedCo.isa, v17);
        v25 = 0;
        goto LABEL_9;
      }
      v24 = (CFStringRef *)MEMORY[0x263F001E8];
    }
    v25 = CGColorSpaceCreateWithName(*v24);
LABEL_9:

    goto LABEL_10;
  }
  v25 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F002D8]);
LABEL_10:

  return v25;
}

- (IHKSliderNetCPModel)initWithModel:(id)a3
{
  return (IHKSliderNetCPModel *)objc_msgSend_initWithModel_options_error_(self, a2, (uint64_t)a3, 0, 0);
}

- (IHKSliderNetCPModel)initWithModel:(id)a3 options:(id)a4 error:(id *)a5
{
  id v6 = a4;
  v29.receiver = self;
  v29.super_class = (Class)IHKSliderNetCPModel;
  uint64_t v7 = [(IHKSliderNetCPModel *)&v29 init];
  uint64_t v11 = v7;
  if (v7)
  {
    objc_msgSend_setGatingMethod_(v7, v8, 0, v9, v10);
    if (v6)
    {
      uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v6, v12, @"slidernet_gating_method", v13, v14);

      if (v15)
      {
        uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v6, v16, @"slidernet_gating_method", v17, v18);
        unsigned int v24 = objc_msgSend_unsignedIntValue(v19, v20, v21, v22, v23);
        objc_msgSend_setGatingMethod_(v11, v25, v24, v26, v27);
      }
    }
  }

  return v11;
}

- (IHKSliderNetCPModel)initWithModelType:(unint64_t)a3
{
  return (IHKSliderNetCPModel *)MEMORY[0x270F9A6D0](self, sel_initWithModelType_options_error_, a3, 0, 0);
}

- (IHKSliderNetCPModel)initWithModelType:(unint64_t)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if (a3)
  {
    if (a3 != 1)
    {
      uint64_t v19 = 0;
      goto LABEL_10;
    }
    uint64_t v9 = @"SliderNetCP_ColorBalance_Exposure_v2.1.1";
  }
  else
  {
    uint64_t v9 = @"SliderNetCP_TempTint_Exposure_v2.0.1";
  }
  uint64_t v10 = (void *)MEMORY[0x263F086E0];
  uint64_t v11 = objc_opt_class();
  uint64_t v15 = objc_msgSend_bundleForClass_(v10, v12, v11, v13, v14);
  uint64_t v18 = objc_msgSend_pathForResource_ofType_inDirectory_(v15, v16, (uint64_t)v9, @"slidernetmodel", @"Models");
  if (v18)
  {
    objc_msgSend_loadModelAtPath_options_error_(IHKSliderNetCPModel, v17, (uint64_t)v18, (uint64_t)v8, (uint64_t)a5);
    uint64_t v19 = (IHKSliderNetCPModel *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v19 = 0;
  }

LABEL_10:
  return v19;
}

- (BOOL)useClipEmbedding
{
  uint64_t v6 = objc_msgSend_gatingMethod(self, a2, v2, v3, v4);
  if (v6 != 1) {
    LOBYTE(v6) = objc_msgSend_gatingMethod(self, v7, v8, v9, v10) == 2;
  }
  return v6;
}

- (id)computeClipEmbeddingForImage:(__CVBuffer *)a3 error:(id *)a4
{
  v58[1] = *MEMORY[0x263EF8340];
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x2050000000;
  uint64_t v6 = (void *)qword_269C3FAA0;
  uint64_t v57 = qword_269C3FAA0;
  if (!qword_269C3FAA0)
  {
    uint64_t v49 = MEMORY[0x263EF8330];
    uint64_t v50 = 3221225472;
    v51 = sub_2529CD98C;
    v52 = &unk_265385DF0;
    v53 = &v54;
    sub_2529CD98C((uint64_t)&v49);
    uint64_t v6 = (void *)v55[3];
  }
  uint64_t v7 = v6;
  _Block_object_dispose(&v54, 8);
  id v8 = objc_alloc_init(v7);
  if (objc_msgSend_setRevision_error_(v8, v9, 3737841671, (uint64_t)a4, v10))
  {
    uint64_t v54 = 0;
    v55 = &v54;
    uint64_t v56 = 0x2050000000;
    uint64_t v11 = (void *)qword_269C3FAB0;
    uint64_t v57 = qword_269C3FAB0;
    if (!qword_269C3FAB0)
    {
      uint64_t v49 = MEMORY[0x263EF8330];
      uint64_t v50 = 3221225472;
      v51 = sub_2529CDB44;
      v52 = &unk_265385DF0;
      v53 = &v54;
      sub_2529CDB44((uint64_t)&v49);
      uint64_t v11 = (void *)v55[3];
    }
    uint64_t v12 = v11;
    _Block_object_dispose(&v54, 8);
    id v13 = [v12 alloc];
    uint64_t v16 = objc_msgSend_initWithCVPixelBuffer_options_(v13, v14, (uint64_t)a3, MEMORY[0x263EFFA78], v15);
    v58[0] = v8;
    uint64_t v19 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v17, (uint64_t)v58, 1, v18);
    char v22 = objc_msgSend_performRequests_error_(v16, v20, (uint64_t)v19, (uint64_t)a4, v21);

    if (v22)
    {
      uint64_t v27 = objc_msgSend_results(v8, v23, v24, v25, v26);
      v32 = objc_msgSend_firstObject(v27, v28, v29, v30, v31);
      v37 = objc_msgSend_sceneprints(v32, v33, v34, v35, v36);
      v42 = objc_msgSend_firstObject(v37, v38, v39, v40, v41);

      v47 = objc_msgSend_descriptorData(v42, v43, v44, v45, v46);
    }
    else
    {
      v47 = 0;
    }
  }
  else
  {
    v47 = 0;
  }

  return v47;
}

- (id)predictStyleVectorForPixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  return (id)objc_msgSend_predictStyleVectorForPixelBuffer_scenePrint_error_(self, a2, (uint64_t)a3, 0, (uint64_t)a4);
}

- (id)predictStyleVectorForPixelBuffer:(__CVBuffer *)a3 scenePrint:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if (objc_msgSend_useClipEmbedding(self, v9, v10, v11, v12))
  {
    if (v8)
    {
      uint64_t v15 = [IHKFeatureVector alloc];
      uint64_t v19 = objc_msgSend_initWithData_(v15, v16, (uint64_t)v8, v17, v18);
    }
    else
    {
      uint64_t v20 = objc_msgSend_computeClipEmbeddingForImage_error_(self, v13, (uint64_t)a3, (uint64_t)a5, v14);
      if (a5 && *a5)
      {
        uint64_t v19 = 0;
      }
      else
      {
        uint64_t v21 = [IHKFeatureVector alloc];
        uint64_t v19 = objc_msgSend_initWithData_(v21, v22, (uint64_t)v20, v23, v24);
      }
    }
  }
  else
  {
    uint64_t v19 = 0;
  }

  return v19;
}

- (id)predictContentVectorForPixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  return (id)MEMORY[0x270F9A6D0](self, sel_predictContentVectorForPixelBuffer_scenePrint_error_, a3, 0, a4);
}

- (id)predictContentVectorForPixelBuffer:(__CVBuffer *)a3 scenePrint:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if (objc_msgSend_useClipEmbedding(self, v9, v10, v11, v12))
  {
    if (v8)
    {
      uint64_t v15 = [IHKFeatureVector alloc];
      uint64_t v19 = objc_msgSend_initWithData_(v15, v16, (uint64_t)v8, v17, v18);
    }
    else
    {
      uint64_t v20 = objc_msgSend_computeClipEmbeddingForImage_error_(self, v13, (uint64_t)a3, (uint64_t)a5, v14);
      if (a5 && *a5)
      {
        uint64_t v19 = 0;
      }
      else
      {
        uint64_t v21 = [IHKFeatureVector alloc];
        uint64_t v19 = objc_msgSend_initWithData_(v21, v22, (uint64_t)v20, v23, v24);
      }
    }
  }
  else
  {
    uint64_t v19 = 0;
  }

  return v19;
}

- (float)gatingScoreForStyleVector:(id)a3 contentVector:(id)a4
{
  MEMORY[0x270F9A6D0](self, sel_gatingScoreForStyleVector_contentVector_error_, a3, a4, 0);
  return result;
}

- (float)gatingScoreForStyleVector:(id)a3 contentVector:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (objc_msgSend_gatingMethod(self, v9, v10, v11, v12) && objc_msgSend_gatingMethod(self, v13, v14, v15, v16) != 2)
  {
    float v29 = 0.0;
    if (objc_msgSend_gatingMethod(self, v13, v17, v15, v16) == 1)
    {
      uint64_t v35 = objc_msgSend_subFeatureVectorWithRange_(v7, v33, 0, 768, v34);
      v38 = objc_msgSend_subFeatureVectorWithRange_(v8, v36, 0, 768, v37);
      objc_msgSend_cosineSimilarity_(v35, v39, (uint64_t)v38, v40, v41);
      float v43 = v42;
      objc_msgSend_cosineSimilarity_(v35, v44, (uint64_t)v35, v45, v46);
      float v48 = v47;
      objc_msgSend_cosineSimilarity_(v38, v49, (uint64_t)v38, v50, v51);
      float v29 = (float)(v43 / (float)(v48 + 1.0e-10)) / (float)(v52 + 1.0e-10);
    }
  }
  else
  {
    objc_msgSend_cosineSimilarity_(v7, v13, (uint64_t)v8, v15, v16);
    float v19 = v18;
    objc_msgSend_cosineSimilarity_(v7, v20, (uint64_t)v7, v21, v22);
    float v24 = v23;
    objc_msgSend_cosineSimilarity_(v8, v25, (uint64_t)v8, v26, v27);
    float v29 = (float)(v19 / (float)(v24 + 1.0e-10)) / (float)(v28 + 1.0e-10);
  }
  float v30 = (float)(v29 * 0.5) + 0.5;
  if (v30 > 1.0) {
    float v30 = 1.0;
  }
  if (v30 >= 0.0) {
    float v31 = v30;
  }
  else {
    float v31 = 0.0;
  }

  return v31;
}

- (id)predictSlidersForStyleVector:(id)a3 contentVector:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_stringWithFormat_(NSString, v8, @"The method %s must be overridden in a subclass/category", v9, v10, "-[IHKSliderNetCPModel predictSlidersForStyleVector:contentVector:error:]");
  objc_msgSend_errorWithCode_message_(IHKError, v12, 1, (uint64_t)v11, v13);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v14);
}

- (id)predictStylePrintForPixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  return (id)MEMORY[0x270F9A6D0](self, sel_predictStylePrintForPixelBuffer_scenePrint_error_, a3, 0, a4);
}

- (id)predictStylePrintForPixelBuffer:(__CVBuffer *)a3 scenePrint:(id)a4 error:(id *)a5
{
  v5 = objc_msgSend_predictStyleVectorForPixelBuffer_scenePrint_error_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);

  return v5;
}

- (float)gatingScoreToTransferStyleFrom:(id)a3 to:(id)a4 error:(id *)a5
{
  MEMORY[0x270F9A6D0](self, sel_gatingScoreForStyleVector_contentVector_error_, a4, a3, a5);
  return result;
}

- (id)predictSlidersToTransferStyleFrom:(id)a3 to:(id)a4 error:(id *)a5
{
  v5 = objc_msgSend_predictSlidersForStyleVector_contentVector_error_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);

  return v5;
}

- (shared_ptr<ik::PixelBufferTransfer>)resampler
{
  uint64_t v3 = v2;
  if (!self->_resampler.__ptr_) {
    operator new();
  }
  cntrl = self->_resampler.__cntrl_;
  *uint64_t v3 = self->_resampler.__ptr_;
  v3[1] = (PixelBufferTransfer *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (PixelBufferTransfer *)self;
  return result;
}

- (PixelBufferTensor)preprocessTensor:(SEL)a3
{
}

- (BOOL)checkColorspaceForPixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  ColorSpace = CVImageBufferGetColorSpace(a3);
  id v7 = CGColorSpaceGetName(ColorSpace);
  uint64_t v12 = (CGColorSpace *)objc_msgSend_colorSpace(self, v8, v9, v10, v11);
  uint64_t v13 = CGColorSpaceGetName(v12);
  char isEqualToString = objc_msgSend_isEqualToString_(v13, v14, (uint64_t)v7, v15, v16);
  BOOL v21 = isEqualToString;
  if (a4) {
    char v22 = isEqualToString;
  }
  else {
    char v22 = 1;
  }
  if ((v22 & 1) == 0)
  {
    float v23 = objc_msgSend_stringWithFormat_(NSString, v18, @"Buffer color space is %@, while network expects %@.", v19, v20, v7, v13);
    objc_msgSend_errorWithCode_message_(IHKError, v24, 3, (uint64_t)v23, v25);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v21;
}

- (BOOL)pixelBufferShapesMatchRequirement:(__CVBuffer *)a3
{
  size_t Width = CVPixelBufferGetWidth(a3);
  objc_msgSend_imageSize(self, v6, v7, v8, v9);
  if (Width != (unint64_t)v10) {
    return 0;
  }
  size_t Height = CVPixelBufferGetHeight(a3);
  objc_msgSend_imageSize(self, v12, v13, v14, v15);
  return Height == (unint64_t)v16;
}

- (__CVBuffer)preprocessPixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  v5 = a3;
  if (!objc_msgSend_checkColorspaceForPixelBuffer_error_(self, a2, (uint64_t)a3, (uint64_t)a4, v4)) {
    return 0;
  }
  if (objc_msgSend_pixelBufferShapesMatchRequirement_(self, v7, (uint64_t)v5, v8, v9)) {
    return v5;
  }
  objc_msgSend_imageSize(self, v10, v11, v12, v13);

  return (__CVBuffer *)MEMORY[0x270F9A6D0](self, sel_resizePixelBuffer_targetSize_, v5, v14, v15);
}

- (__CVBuffer)resizePixelBuffer:(__CVBuffer *)a3 targetSize:(CGSize)a4
{
  CVPixelBufferRef pixelBufferOut = 0;
  CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (unint64_t)a4.width, (unint64_t)a4.height, 0x42475241u, 0, &pixelBufferOut);
  objc_msgSend_resampler(self, v6, v7, v8, v9);
  uint64_t v10 = VTPixelTransferSessionTransferImage(***(VTPixelTransferSessionRef ***)attachmentMode, a3, pixelBufferOut);
  sub_2529CDD6C(v10, "Image Transfer");
  uint64_t v11 = v16;
  if (v16 && !atomic_fetch_add(&v16->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
    std::__shared_weak_count::__release_weak(v11);
  }
  attachmentMode[0] = kCVAttachmentMode_ShouldPropagate;
  CFStringRef v12 = (const __CFString *)*MEMORY[0x263F03E38];
  CFTypeRef v13 = CVBufferCopyAttachment(a3, (CFStringRef)*MEMORY[0x263F03E38], attachmentMode);
  CVBufferSetAttachment(pixelBufferOut, v12, v13, kCVAttachmentMode_ShouldNotPropagate);
  return pixelBufferOut;
}

- (id)applyAdjustments:(id)a3 toCIImage:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_stringWithFormat_(NSString, v8, @"The method %s must be overridden in a subclass/category", v9, v10, "-[IHKSliderNetCPModel applyAdjustments:toCIImage:error:]");
  objc_msgSend_errorWithCode_message_(IHKError, v12, 1, (uint64_t)v11, v13);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v14);
}

- (CGSize)imageSize
{
  objc_copyStruct(v4, &self->_imageSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (NSArray)sliderOrder
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSDictionary)sliderSpecs
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (IHKFilterSequence)filterSequence
{
  return (IHKFilterSequence *)objc_getProperty(self, a2, 48, 1);
}

- (unint64_t)gatingMethod
{
  return self->_gatingMethod;
}

- (void)setGatingMethod:(unint64_t)a3
{
  self->_gatingMethod = a3;
}

- (NSDictionary)info
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_filterSequence, 0);
  objc_storeStrong((id *)&self->_sliderSpecs, 0);
  objc_storeStrong((id *)&self->_sliderOrder, 0);
  cntrl = self->_resampler.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

+ (id)loadModelAtPath:(id)a3
{
  double v3 = objc_msgSend_loadModelAtPath_options_error_(IHKSliderNetCPModel, a2, (uint64_t)a3, 0, 0);

  return v3;
}

+ (id)loadModelAtPath:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  CFStringRef v12 = objc_msgSend_stringByAppendingPathComponent_(v7, v9, @"net_info.json", v10, v11);
  double v16 = objc_msgSend_loadJSonFrom_(IHKSliderNetCPModel, v13, (uint64_t)v12, v14, v15);
  uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(v16, v17, @"network_type", v18, v19);
  if (objc_msgSend_isEqualToString_(v20, v21, @"copy_paste_edit_3way_v1", v22, v23))
  {
    uint64_t v27 = off_265385BB8;
LABEL_6:
    id v34 = objc_alloc(*v27);
    uint64_t v36 = objc_msgSend_initWithModel_options_error_(v34, v35, (uint64_t)v7, (uint64_t)v8, (uint64_t)a5);
    goto LABEL_7;
  }
  if ((objc_msgSend_isEqualToString_(v20, v24, @"copy_paste_edit_3way_v2", v25, v26) & 1) != 0
    || objc_msgSend_isEqualToString_(v20, v28, @"copy_paste_edit_3way_v2.1", v29, v30))
  {
    uint64_t v27 = &off_265385BC0;
    goto LABEL_6;
  }
  v38 = objc_msgSend_stringWithFormat_(NSString, v31, @"Unknown network type: %@", v32, v33, v20);
  NSLog(&stru_2702DE530.isa, v38);
  if (a5)
  {
    objc_msgSend_errorWithCode_message_(IHKError, v39, 8, (uint64_t)v38, v40);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v36 = 0;
LABEL_7:

  return v36;
}

@end