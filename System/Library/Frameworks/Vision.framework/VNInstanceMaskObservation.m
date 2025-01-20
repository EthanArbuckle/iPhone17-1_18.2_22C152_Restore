@interface VNInstanceMaskObservation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CVPixelBufferRef)generateMaskForInstances:(NSIndexSet *)instances error:(NSError *)error;
- (CVPixelBufferRef)generateMaskedImageOfInstances:(NSIndexSet *)instances fromRequestHandler:(VNImageRequestHandler *)requestHandler croppedToInstancesExtent:(BOOL)cropResult error:(NSError *)error;
- (CVPixelBufferRef)generateMaskedImageOfInstances:(void *)a3 imageBuffer:(int)a4 inPlace:(int)a5 croppedToInstancesExtent:(double *)a6 returnCropRect:(void *)a7 error:;
- (CVPixelBufferRef)generateScaledMaskForImageForInstances:(NSIndexSet *)instances fromRequestHandler:(VNImageRequestHandler *)requestHandler error:(NSError *)error;
- (CVPixelBufferRef)instanceMask;
- (NSIndexSet)allInstances;
- (VNInstanceMaskObservation)initWithCoder:(id)a3;
- (VNInstanceMaskObservation)initWithOriginatingRequestSpecifier:(id)a3 instanceLowResMaskArray:(id)a4 instanceFeatureKeyIndexMap:(id)a5 instanceCategoryKeyIndexMap:(id)a6 instanceMask:(__CVBuffer *)a7 numComponents:(unint64_t)a8 regionOfInterest:(CGRect)a9;
- (VNInstanceMaskObservation)initWithOriginatingRequestSpecifier:(id)a3 instanceLowResMaskArray:(id)a4 instanceMask:(__CVBuffer *)a5 numComponents:(unint64_t)a6 regionOfInterest:(CGRect)a7;
- (VNInstanceMaskObservation)initWithOriginatingRequestSpecifier:(id)a3 lowResMask:(__CVBuffer *)a4 instanceMask:(__CVBuffer *)a5 numComponents:(unint64_t)a6 regionOfInterest:(CGRect)a7;
- (__CVBuffer)createMattedImageOfInstances:(id)a3 fromRequestHandler:(id)a4 croppedToInstancesExtent:(BOOL)a5 error:(id *)a6;
- (__CVBuffer)generateMaskedImageOfInstances:(id)a3 fromRequestHandler:(id)a4 inPlace:(BOOL)a5 croppedToInstancesExtent:(BOOL)a6 error:(id *)a7;
- (__CVBuffer)generateMaskedImageOfInstances:(id)a3 fromRequestHandler:(id)a4 inPlace:(BOOL)a5 croppedToInstancesExtent:(BOOL)a6 returnCropRect:(CGRect *)a7 error:(id *)a8;
- (__CVBuffer)generateMaskedImageOfInstances:(id)a3 imageBuffer:(id)a4 inPlace:(BOOL)a5 croppedToInstancesExtent:(BOOL)a6 error:(id *)a7;
- (__CVBuffer)generateScaledMaskForImageForInstances:(id)a3 imageBuffer:(id)a4 croppedToInstancesExtent:(BOOL)a5 error:(id *)a6;
- (id)_maskProductionResourcesAndReturnError:(void *)a1;
- (id)description;
- (id)instanceAtPoint:(CGPoint)a3 error:(id *)a4;
- (id)instancesForCategory:(id)a3 error:(id *)a4;
- (id)instancesForFeature:(id)a3 error:(id *)a4;
- (id)vn_cloneObject;
- (id)vn_deepCloneObjectWithError:(id *)a3;
- (uint64_t)_cropInOutPixelBuffer:(void *)a3 normalizedBoundingBox:(double *)a4 maskProductionResources:(void *)a5 returnCropRect:(double)a6 error:(double)a7;
- (uint64_t)_upsampleLowResMask:(uint64_t)a3 reference:(void *)a4 maskProductionResources:(uint64_t)a5 error:;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNInstanceMaskObservation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceCategoriesMap, 0);
  objc_storeStrong((id *)&self->_instanceSegmentationMaskFeatureMap, 0);
  objc_storeStrong((id *)&self->_maskProductionResources_DO_NOT_DIRECTLY_ACCESS, 0);

  objc_storeStrong((id *)&self->_lowResAlphaMask, 0);
}

- (CVPixelBufferRef)instanceMask
{
  return self->_instanceMask;
}

- (id)instancesForCategory:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  if (self->_numComponents != 1)
  {
    unint64_t v7 = 0;
    do
    {
      v8 = [(NSArray *)self->_instanceCategoriesMap objectAtIndexedSubscript:v7];
      int v9 = [v8 containsObject:v5];

      ++v7;
      if (v9) {
        [v6 addIndex:v7];
      }
    }
    while (self->_numComponents - 1 > v7);
  }

  return v6;
}

- (id)instancesForFeature:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  if (self->_numComponents != 1)
  {
    unint64_t v7 = 0;
    do
    {
      v8 = [(NSArray *)self->_instanceSegmentationMaskFeatureMap objectAtIndexedSubscript:v7];
      int v9 = [v8 isEqualToString:v5];

      ++v7;
      if (v9) {
        [v6 addIndex:v7];
      }
    }
    while (self->_numComponents - 1 > v7);
  }

  return v6;
}

- (id)instanceAtPoint:(CGPoint)a3 error:(id *)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v26.origin.CGFloat x = 0.0;
  v26.origin.CGFloat y = 0.0;
  v26.size.width = 1.0;
  v26.size.height = 1.0;
  v25.CGFloat x = x;
  v25.CGFloat y = y;
  if (CGRectContainsPoint(v26, v25))
  {
    v8 = [(VNInstanceMaskObservation *)self instanceMask];
    CVPixelBufferGetWidth(v8);
    size_t Height = CVPixelBufferGetHeight(v8);
    VisionCoreImagePointForNormalizedPoint();
    if (self->_numComponents == 1)
    {
LABEL_9:
      id v19 = objc_alloc(MEMORY[0x1E4F28D60]);
      uint64_t v20 = 0;
    }
    else
    {
      uint64_t v12 = 0;
      size_t v13 = (int)v10;
      size_t v14 = (int)((double)Height - v11);
      while (1)
      {
        v15 = [(_VNLowResAlphaMask *)self->_lowResAlphaMask _alphaMaskAtIndex:v12];
        if (((v13 | v14) & 0x80000000) == 0)
        {
          v16 = v15;
          if (CVPixelBufferGetWidth(v15) > v13 && CVPixelBufferGetHeight(v16) > v14)
          {
            CVPixelBufferLockBaseAddress(v16, 1uLL);
            size_t v17 = CVPixelBufferGetBytesPerRow(v16) >> 2;
            float v18 = *((float *)CVPixelBufferGetBaseAddress(v16) + (int)v17 * (int)v14 + v13);
            CVPixelBufferUnlockBaseAddress(v16, 0);
            if (v18 != 0.0) {
              break;
            }
          }
        }
        if (self->_numComponents - 1 <= ++v12) {
          goto LABEL_9;
        }
      }
      id v19 = objc_alloc(MEMORY[0x1E4F28D60]);
      uint64_t v20 = (v12 + 1);
    }
    v21 = (void *)[v19 initWithIndex:v20];
  }
  else
  {
    if (a4)
    {
      v22 = objc_msgSend(NSString, "stringWithFormat:", @" pointOfInterest value is out of bounds: %f,%f", *(void *)&x, *(void *)&y);
      *a4 = +[VNError errorWithCode:4 message:v22];
    }
    v21 = 0;
  }

  return v21;
}

- (__CVBuffer)generateMaskedImageOfInstances:(id)a3 fromRequestHandler:(id)a4 inPlace:(BOOL)a5 croppedToInstancesExtent:(BOOL)a6 returnCropRect:(CGRect *)a7 error:(id *)a8
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a4;
  v16 = v15;
  if (v15)
  {
    size_t v17 = [v15 imageBuffer];
    float v18 = -[VNInstanceMaskObservation generateMaskedImageOfInstances:imageBuffer:inPlace:croppedToInstancesExtent:returnCropRect:error:]((uint64_t)self, v14, v17, v11, v10, &a7->origin.x, a8);
  }
  else if (a8)
  {
    +[VNError errorForInvalidArgument:0 named:@"requestHandler"];
    float v18 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    float v18 = 0;
  }

  return v18;
}

- (CVPixelBufferRef)generateMaskedImageOfInstances:(void *)a3 imageBuffer:(int)a4 inPlace:(int)a5 croppedToInstancesExtent:(double *)a6 returnCropRect:(void *)a7 error:
{
  id v13 = a2;
  id v14 = a3;
  id v15 = v14;
  if (!a1) {
    goto LABEL_12;
  }
  if (v13)
  {
    if (v14)
    {
      uint64_t v16 = -[VNInstanceMaskObservation _maskProductionResourcesAndReturnError:]((void *)a1, a7);
      size_t v17 = (void *)v16;
      if (!v16)
      {
        CVPixelBufferRef v26 = 0;
LABEL_36:

        goto LABEL_37;
      }
      v44 = (void *)v16;
      double v19 = *(double *)(a1 + 120);
      double v18 = *(double *)(a1 + 128);
      double v21 = *(double *)(a1 + 136);
      double v20 = *(double *)(a1 + 144);
      unint64_t v22 = [v15 width];
      unint64_t v23 = [v15 height];
      int v43 = a5;
      if (a4)
      {
        v82.origin.double x = 0.0;
        v82.origin.double y = 0.0;
        v82.size.double width = 1.0;
        v82.size.double height = 1.0;
        BOOL v24 = !CGRectEqualToRect(*(CGRect *)(a1 + 120), v82);
      }
      else
      {
        BOOL v24 = 0;
      }
      uint64_t v77 = 0;
      v78 = &v77;
      uint64_t v79 = 0x2020000000;
      uint64_t v80 = 0;
      uint64_t v73 = 0;
      v74 = &v73;
      uint64_t v75 = 0x2020000000;
      uint64_t v76 = 0;
      uint64_t v69 = 0;
      v70 = &v69;
      uint64_t v71 = 0x2020000000;
      uint64_t v72 = 0;
      uint64_t v65 = 0;
      v66 = (CVPixelBufferRef *)&v65;
      uint64_t v67 = 0x2020000000;
      uint64_t v68 = 0;
      uint64_t v61 = 0;
      v62 = &v61;
      uint64_t v63 = 0x2020000000;
      char v64 = 0;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __126__VNInstanceMaskObservation_generateMaskedImageOfInstances_imageBuffer_inPlace_croppedToInstancesExtent_returnCropRect_error___block_invoke;
      aBlock[3] = &unk_1E5B1C390;
      char v59 = a4;
      v50 = &v77;
      double v55 = v19 * (double)v22;
      double v56 = v18 * (double)v23;
      double v57 = v21 * (double)v22;
      double v58 = v20 * (double)v23;
      v51 = &v73;
      id v46 = v15;
      uint64_t v47 = a1;
      BOOL v60 = v24;
      id v48 = v13;
      v52 = &v69;
      size_t v17 = v44;
      id v27 = v44;
      id v49 = v27;
      v53 = &v65;
      v54 = &v61;
      v28 = _Block_copy(aBlock);
      if ((VNExecuteBlock(v28, (uint64_t)a7) & 1) == 0) {
        goto LABEL_29;
      }
      if (v43)
      {
        v81.origin.double x = calculateCropSizeOfPixelBuffer((__CVBuffer *)v74[3], a7, 0.1);
        double x = v81.origin.x;
        double y = v81.origin.y;
        double width = v81.size.width;
        double height = v81.size.height;
        if (CGRectIsNull(v81)) {
          goto LABEL_29;
        }
        size_t v33 = CVPixelBufferGetWidth((CVPixelBufferRef)v74[3]);
        size_t v34 = CVPixelBufferGetHeight((CVPixelBufferRef)v74[3]);
        double v35 = 0.0;
        double v36 = 0.0;
        double v37 = 0.0;
        if (v33)
        {
          double v36 = x / (double)v33;
          double v37 = width / (double)v33;
        }
        if (v34)
        {
          double v35 = y / (double)v34;
          double v38 = height / (double)v34;
        }
        else
        {
          double v38 = 0.0;
        }
      }
      else
      {
        double v37 = 1.0;
        double v36 = 0.0;
        double v35 = 0.0;
        double v38 = 1.0;
      }
      if (*((unsigned char *)v62 + 24))
      {
        v39 = [v27 completionSemaphore];
        dispatch_semaphore_wait(v39, 0xFFFFFFFFFFFFFFFFLL);
      }
      if (!v43
        || (a4 & 1) != 0
        || -[VNInstanceMaskObservation _cropInOutPixelBuffer:normalizedBoundingBox:maskProductionResources:returnCropRect:error:](a1, v66 + 3, v27, a6, a7, v36, v35, v37, v38))
      {
        int v40 = 1;
LABEL_30:
        if (*((unsigned char *)v62 + 24))
        {
          v41 = [v27 completionSemaphore];
          dispatch_semaphore_wait(v41, 0);
        }
        CVPixelBufferRelease((CVPixelBufferRef)v70[3]);
        v70[3] = 0;
        CVPixelBufferRelease((CVPixelBufferRef)v74[3]);
        v74[3] = 0;
        CVPixelBufferRelease((CVPixelBufferRef)v78[3]);
        v78[3] = 0;
        if (v40) {
          CVPixelBufferRef v26 = v66[3];
        }
        else {
          CVPixelBufferRef v26 = 0;
        }

        _Block_object_dispose(&v61, 8);
        _Block_object_dispose(&v65, 8);
        _Block_object_dispose(&v69, 8);
        _Block_object_dispose(&v73, 8);
        _Block_object_dispose(&v77, 8);
        goto LABEL_36;
      }
LABEL_29:
      int v40 = 0;
      goto LABEL_30;
    }
    if (a7)
    {
      CGPoint v25 = +[VNError errorForInvalidArgument:0 named:@"imageBuffer"];
      goto LABEL_11;
    }
LABEL_12:
    CVPixelBufferRef v26 = 0;
    goto LABEL_37;
  }
  if (!a7) {
    goto LABEL_12;
  }
  CGPoint v25 = +[VNError errorForInvalidArgument:0 named:@"instances"];
LABEL_11:
  CVPixelBufferRef v26 = 0;
  *a7 = v25;
LABEL_37:

  return v26;
}

- (id)_maskProductionResourcesAndReturnError:(void *)a1
{
  if (a1)
  {
    v3 = a1;
    objc_sync_enter(v3);
    v4 = (void *)v3[19];
    if (v4) {
      goto LABEL_21;
    }
    id v5 = objc_alloc_init((Class)self);
    id v6 = +[VNProcessingDevice defaultMetalDevice];
    unint64_t v7 = v6;
    if (v6)
    {
      v8 = [v6 metalDevice];
    }
    else
    {
      v8 = 0;
    }
    uint64_t v9 = +[VNMetalContext metalContextForDevice:error:]((uint64_t)VNMetalContext, v8, a2);
    BOOL v10 = (void *)v5[2];
    v5[2] = v9;

    uint64_t v11 = v5[2];
    if (v11)
    {
      uint64_t v12 = -[VNMetalContext computePipelineStateForFunctionWithName:error:](v11, @"removebkgnd_maskimage", (uint64_t)a2);
      id v13 = (void *)v5[4];
      v5[4] = v12;

      if (v5[4])
      {
        uint64_t v14 = -[VNMetalContext computePipelineStateForFunctionWithName:error:](v5[2], @"removebkgnd_copyCrop", (uint64_t)a2);
        id v15 = (void *)v5[5];
        v5[5] = v14;

        if (v5[5])
        {
          dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
          size_t v17 = (void *)v5[1];
          v5[1] = v16;

          if (v5[1])
          {
            double v18 = [VNBGRBilinearUpsampler alloc];
            double v19 = (void *)v5[2];
            if (v19) {
              double v19 = (void *)v19[1];
            }
            double v20 = v19;
            uint64_t v21 = [(VNBGRBilinearUpsampler *)v18 initWithMetalDevice:v20];
            unint64_t v22 = (void *)v5[3];
            v5[3] = v21;

            if (v5[3])
            {
              unint64_t v23 = v5;
              goto LABEL_20;
            }
            if (a2)
            {
              BOOL v24 = +[VNError errorForInternalErrorWithLocalizedDescription:@"failed to create bilinear upsampler"];
              goto LABEL_18;
            }
          }
          else if (a2)
          {
            BOOL v24 = +[VNError errorForInternalErrorWithLocalizedDescription:@"failed to create execution completion semaphore"];
LABEL_18:
            unint64_t v23 = 0;
            *a2 = v24;
            goto LABEL_20;
          }
        }
      }
    }
    unint64_t v23 = 0;
LABEL_20:

    CGPoint v25 = (void *)v3[19];
    v3[19] = v23;

    v4 = (void *)v3[19];
    if (!v4)
    {
      id v26 = 0;
      goto LABEL_22;
    }
LABEL_21:
    id v26 = v4;
LABEL_22:
    objc_sync_exit(v3);

    goto LABEL_23;
  }
  id v26 = 0;
LABEL_23:

  return v26;
}

uint64_t __126__VNInstanceMaskObservation_generateMaskedImageOfInstances_imageBuffer_inPlace_croppedToInstancesExtent_returnCropRect_error___block_invoke(uint64_t a1, void *a2)
{
  int v4 = *(unsigned __int8 *)(a1 + 136);
  id v5 = *(void **)(a1 + 32);
  if (!v4)
  {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = objc_msgSend(v5, "croppedBufferWithWidth:height:format:cropRect:options:error:", (unint64_t)*(double *)(a1 + 120), (unint64_t)*(double *)(a1 + 128), 1111970369, 0, a2, *(double *)(a1 + 104), *(double *)(a1 + 112));
    if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      if (a2)
      {
        id v18 = +[VNError errorForMemoryAllocationFailureWithLocalizedDescription:@"Could not create target buffer"];
        uint64_t result = 0;
        *a2 = v18;
        return result;
      }
      return 0;
    }
LABEL_9:
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [*(id *)(a1 + 40) generateMaskForInstances:*(void *)(a1 + 48) error:a2];
    if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
      return 0;
    }
    if (*(unsigned char *)(a1 + 137))
    {
      uint64_t v9 = *(double **)(a1 + 40);
      double v11 = v9[15];
      double v10 = v9[16];
      double v13 = v9[17];
      double v12 = v9[18];
      unint64_t v14 = [*(id *)(a1 + 32) width];
      unint64_t v15 = [*(id *)(a1 + 32) height];
      dispatch_semaphore_t v16 = (__CVBuffer *)objc_msgSend(*(id *)(a1 + 32), "croppedBufferWithWidth:height:format:cropRect:options:error:", (unint64_t)(v13 * (double)v14), (unint64_t)(v12 * (double)v15), 1111970369, 0, a2, v11 * (double)v14, v10 * (double)v15);
      if (!v16)
      {
        BOOL v17 = 0;
        goto LABEL_17;
      }
    }
    else
    {
      dispatch_semaphore_t v16 = CVPixelBufferRetain(*(CVPixelBufferRef *)(*(void *)(*(void *)(a1 + 64) + 8) + 24));
    }
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = -[VNInstanceMaskObservation _upsampleLowResMask:reference:maskProductionResources:error:](*(void *)(a1 + 40), *(void *)(*(void *)(*(void *)(a1 + 72) + 8)+ 24), (uint64_t)v16, *(void **)(a1 + 56), (uint64_t)a2);
    BOOL v17 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) != 0;
LABEL_17:
    CVPixelBufferRelease(v16);
    if (v17)
    {
      if (*(unsigned char *)(a1 + 136))
      {
        *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = CVPixelBufferRetain(*(CVPixelBufferRef *)(*(void *)(*(void *)(a1 + 64) + 8) + 24));
        goto LABEL_20;
      }
      size_t Width = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(*(void *)(*(void *)(a1 + 64) + 8) + 24));
      size_t Height = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(*(void *)(*(void *)(a1 + 64) + 8) + 24));
      uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(*(CVPixelBufferRef *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                            + 24));
      *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, Width, Height, PixelFormatType, a2);
      if (*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
      {
        CFStringRef v25 = (const __CFString *)*MEMORY[0x1E4F24A00];
        if (CVBufferHasAttachment(*(CVBufferRef *)(*(void *)(*(void *)(a1 + 64) + 8) + 24), (CFStringRef)*MEMORY[0x1E4F24A00]))
        {
          attachmentMode[0] = kCVAttachmentMode_ShouldNotPropagate;
          CFTypeRef v26 = CVBufferCopyAttachment(*(CVBufferRef *)(*(void *)(*(void *)(a1 + 64) + 8) + 24), v25, attachmentMode);
          CVBufferSetAttachment(*(CVBufferRef *)(*(void *)(*(void *)(a1 + 88) + 8) + 24), v25, v26, attachmentMode[0]);
          CFRelease(v26);
        }
LABEL_20:
        if (*(unsigned char *)(a1 + 137))
        {
          [*(id *)(a1 + 32) width];
          [*(id *)(a1 + 32) height];
          VisionCoreImagePointForNormalizedPoint();
          HIWORD(v38) = (int)v20;
          LOWORD(v38) = (int)v19;
          int v21 = v38;
        }
        else
        {
          int v21 = 0;
        }
        uint64_t v27 = *(void *)(a1 + 40);
        uint64_t v28 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
        uint64_t v29 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
        uint64_t v30 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
        id v31 = *(id *)(a1 + 56);
        v32 = v31;
        if (v27)
        {
          size_t v33 = [v31 metalContext];
          *(void *)attachmentMode = MEMORY[0x1E4F143A8];
          uint64_t v40 = 3221225472;
          v41 = __123__VNInstanceMaskObservation__removeBackgroundFromPixelBuffer_toPixelBuffer_usingMask_offset_maskProductionResources_error___block_invoke;
          v42 = &unk_1E5B1D6B0;
          id v43 = v33;
          uint64_t v45 = v28;
          uint64_t v46 = v29;
          uint64_t v47 = v30;
          id v34 = v32;
          id v44 = v34;
          int v48 = v21;
          id v35 = v33;
          double v36 = _Block_copy(attachmentMode);
          int v37 = VNExecuteBlock(v36, (uint64_t)a2);

          if (v37)
          {
            uint64_t result = 1;
            *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 1;
            return result;
          }
        }
        else
        {
        }
      }
    }
    return 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = CVPixelBufferRetain((CVPixelBufferRef)[v5 originalPixelBuffer]);
  id v6 = *(__CVBuffer **)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  if (v6
    && CVPixelBufferGetPixelFormatType(v6) == 1111970369
    && CVPixelBufferGetIOSurface(*(CVPixelBufferRef *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)))
  {
    goto LABEL_9;
  }
  if (a2)
  {
    unint64_t v7 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 136)];
    *a2 = +[VNError errorForInvalidOption:v7 named:@"inPlace" localizedDescription:@"Conditions for in-place execution not met"];
  }
  CVPixelBufferRelease(*(CVPixelBufferRef *)(*(void *)(*(void *)(a1 + 64) + 8) + 24));
  uint64_t result = 0;
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  return result;
}

- (uint64_t)_cropInOutPixelBuffer:(void *)a3 normalizedBoundingBox:(double *)a4 maskProductionResources:(void *)a5 returnCropRect:(double)a6 error:(double)a7
{
  v54[2] = *MEMORY[0x1E4F143B8];
  id v43 = a3;
  if (a1)
  {
    dispatch_semaphore_t v16 = *a2;
    size_t Width = CVPixelBufferGetWidth(*a2);
    size_t Height = CVPixelBufferGetHeight(v16);
    v55.origin.double x = a6 * (double)Width;
    v55.size.double width = a8 * (double)Width;
    v55.origin.double y = (1.0 - a7 - a9) * (double)Height;
    v55.size.double height = a9 * (double)Height;
    CGRect v56 = CGRectIntegral(v55);
    double x = v56.origin.x;
    double y = v56.origin.y;
    double v21 = v56.size.width;
    double v22 = v56.size.height;
    if (a4)
    {
      size_t v23 = CVPixelBufferGetHeight(v16);
      *a4 = x;
      a4[1] = (double)v23 - y - v22;
      a4[2] = v21;
      a4[3] = v22;
    }
    BOOL v24 = (void *)MEMORY[0x1A6257080]();
    CFStringRef v25 = [v43 metalContext];
    id v52 = 0;
    CFTypeRef v26 = -[VNMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:plane:error:](v25, v16, 80, &v52);
    id v27 = v52;
    if (v26)
    {
      id v51 = v27;
      uint64_t v28 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, (unint64_t)v21, (unint64_t)v22, 1111970369, &v51);
      id v29 = v51;

      if (v28)
      {
        id v50 = v29;
        uint64_t v30 = -[VNMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:plane:error:](v25, v28, 80, &v50);
        id v27 = v50;

        if (v30)
        {
          id v49 = v27;
          v41 = -[VNMetalContext commandQueueReturnError:](v25, &v49);
          id v31 = v49;

          if (v41)
          {
            id v39 = v31;
            v32 = [v41 commandBuffer];
            uint64_t v40 = [v43 cropCopyingComputeState];
            uint64_t v38 = [v30 width];
            uint64_t v33 = [v30 height];
            v54[0] = v26;
            v54[1] = v30;
            id v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
            v46[0] = MEMORY[0x1E4F143A8];
            v46[1] = 3221225472;
            v46[2] = __118__VNInstanceMaskObservation__cropInOutPixelBuffer_normalizedBoundingBox_maskProductionResources_returnCropRect_error___block_invoke;
            v46[3] = &__block_descriptor_36_e36_v16__0___MTLComputeCommandEncoder__8l;
            __int16 v48 = (int)y;
            __int16 v47 = (int)x;
            -[VNMetalContext encodeCommandsForBuffer:state:label:width:height:textures:buffers:block:]((uint64_t)v25, v32, v40, v38, v33, v34, v46);

            id v31 = v39;
            v44[0] = MEMORY[0x1E4F143A8];
            v44[1] = 3221225472;
            v44[2] = __118__VNInstanceMaskObservation__cropInOutPixelBuffer_normalizedBoundingBox_maskProductionResources_returnCropRect_error___block_invoke_2;
            v44[3] = &unk_1E5B1F7F8;
            id v45 = v43;
            [v32 addCompletedHandler:v44];
            [v32 commit];
            [v32 waitUntilCompleted];

            int v35 = 0;
          }
          else
          {
            unsigned __int8 v53 = 0;
            int v35 = 1;
          }

          id v27 = v31;
        }
        else
        {
          unsigned __int8 v53 = 0;
          int v35 = 1;
        }
      }
      else
      {
        unsigned __int8 v53 = 0;
        int v35 = 1;
        id v27 = v29;
      }
    }
    else
    {
      uint64_t v28 = 0;
      unsigned __int8 v53 = 0;
      int v35 = 1;
    }

    CVPixelBufferRelease(v16);
    *a2 = v28;
    if (a5 && v27) {
      *a5 = v27;
    }
    if (!v35) {
      unsigned __int8 v53 = 1;
    }

    uint64_t v36 = v53;
  }
  else
  {
    uint64_t v36 = 0;
  }

  return v36;
}

uint64_t __118__VNInstanceMaskObservation__cropInOutPixelBuffer_normalizedBoundingBox_maskProductionResources_returnCropRect_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setBytes:a1 + 32 length:4 atIndex:0];
}

void __118__VNInstanceMaskObservation__cropInOutPixelBuffer_normalizedBoundingBox_maskProductionResources_returnCropRect_error___block_invoke_2(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) completionSemaphore];
  dispatch_semaphore_signal(v1);
}

- (uint64_t)_upsampleLowResMask:(uint64_t)a3 reference:(void *)a4 maskProductionResources:(uint64_t)a5 error:
{
  id v9 = a4;
  if (a1)
  {
    uint64_t v23 = 0;
    BOOL v24 = &v23;
    uint64_t v25 = 0x2020000000;
    uint64_t v26 = 0;
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x2020000000;
    char v22 = 0;
    char v22 = [*(id *)(a1 + 96) isSingleMask];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __89__VNInstanceMaskObservation__upsampleLowResMask_reference_maskProductionResources_error___block_invoke;
    v14[3] = &unk_1E5B1C368;
    uint64_t v19 = a3;
    uint64_t v20 = a2;
    BOOL v17 = &v23;
    id v18 = v21;
    id v15 = v9;
    uint64_t v16 = a1;
    double v10 = _Block_copy(v14);
    char v11 = VNExecuteBlock(v10, a5);
    uint64_t v12 = v24[3];
    if ((v11 & 1) == 0)
    {
      CVPixelBufferRelease((CVPixelBufferRef)v24[3]);
      uint64_t v12 = 0;
      v24[3] = 0;
    }

    _Block_object_dispose(v21, 8);
    _Block_object_dispose(&v23, 8);
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

BOOL __123__VNInstanceMaskObservation__removeBackgroundFromPixelBuffer_toPixelBuffer_usingMask_offset_maskProductionResources_error___block_invoke(uint64_t a1, void *a2)
{
  v22[3] = *MEMORY[0x1E4F143B8];
  int v4 = -[VNMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:plane:error:](*(void **)(a1 + 32), *(CVPixelBufferRef *)(a1 + 48), 80, a2);
  if (v4)
  {
    id v5 = -[VNMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:plane:error:](*(void **)(a1 + 32), *(CVPixelBufferRef *)(a1 + 56), 80, a2);
    if (v5)
    {
      id v6 = -[VNMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:plane:error:](*(void **)(a1 + 32), *(CVPixelBufferRef *)(a1 + 64), 55, a2);
      if (v6)
      {
        unint64_t v7 = -[VNMetalContext commandQueueReturnError:](*(os_unfair_lock_s **)(a1 + 32), a2);
        v8 = v7;
        BOOL v9 = v7 != 0;
        if (v7)
        {
          uint64_t v10 = [v7 commandBuffer];
          uint64_t v16 = *(void *)(a1 + 32);
          BOOL v17 = (void *)v10;
          char v11 = [*(id *)(a1 + 40) applyMaskComputeState];
          uint64_t v12 = [v6 width];
          uint64_t v13 = [v6 height];
          v22[0] = v6;
          v22[1] = v4;
          v22[2] = v5;
          unint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __123__VNInstanceMaskObservation__removeBackgroundFromPixelBuffer_toPixelBuffer_usingMask_offset_maskProductionResources_error___block_invoke_2;
          v20[3] = &__block_descriptor_36_e36_v16__0___MTLComputeCommandEncoder__8l;
          int v21 = *(_DWORD *)(a1 + 72);
          -[VNMetalContext encodeCommandsForBuffer:state:label:width:height:textures:buffers:block:](v16, v17, v11, v12, v13, v14, v20);

          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __123__VNInstanceMaskObservation__removeBackgroundFromPixelBuffer_toPixelBuffer_usingMask_offset_maskProductionResources_error___block_invoke_3;
          v18[3] = &unk_1E5B1F7F8;
          id v19 = *(id *)(a1 + 40);
          [v17 addCompletedHandler:v18];
          [v17 commit];
        }
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

uint64_t __123__VNInstanceMaskObservation__removeBackgroundFromPixelBuffer_toPixelBuffer_usingMask_offset_maskProductionResources_error___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setBytes:a1 + 32 length:4 atIndex:0];
}

void __123__VNInstanceMaskObservation__removeBackgroundFromPixelBuffer_toPixelBuffer_usingMask_offset_maskProductionResources_error___block_invoke_3(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) completionSemaphore];
  dispatch_semaphore_signal(v1);
}

uint64_t __89__VNInstanceMaskObservation__upsampleLowResMask_reference_maskProductionResources_error___block_invoke(uint64_t a1, void *a2)
{
  v37[1] = *MEMORY[0x1E4F143B8];
  size_t Width = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + 64));
  size_t Height = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 64));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, Width, Height, 1278226534, a2);
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    CVPixelBufferLockBaseAddress(*(CVPixelBufferRef *)(a1 + 72), 1uLL);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      size_t v6 = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 72));
      size_t v7 = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + 72));
      v8 = (int64x2_t *)operator new(0x20uLL);
      int64x2_t *v8 = vdupq_n_s64(1uLL);
      v8[1].i64[0] = v6;
      v8[1].i64[1] = v7;
      long long v35 = 0u;
      long long v34 = 0u;
      long long v33 = 0u;
      long long v32 = 0u;
      long long v31 = 0u;
      long long v30 = 0u;
      long long v29 = 0u;
      long long v28 = 0u;
      long long v27 = 0u;
      long long v26 = 0u;
      BaseAddress = CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)(a1 + 72));
      espresso_buffer_pack_tensor_shape();
      v24[0] = *(void *)(a1 + 64);
      v24[1] = &BaseAddress;
      v24[2] = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      BOOL v9 = [*(id *)(a1 + 32) bilinearUpsampler];
      LOBYTE(v7) = [v9 handlePostProcessingRequest:v24];

      if (v7)
      {
        operator delete(v8);
LABEL_29:
        uint64_t v10 = 1;
        goto LABEL_30;
      }
      if (a2)
      {
        *a2 = +[VNError errorForOperationFailedErrorWithLocalizedDescription:@"unable to perform bilinear upsampling"];
      }
      operator delete(v8);
LABEL_28:
      uint64_t v10 = 0;
LABEL_30:
      CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(a1 + 72), 1uLL);
      return v10;
    }
    v37[0] = *(void *)(a1 + 72);
    char v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
    uint64_t v36 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
    uint64_t v13 = [*(id *)(a1 + 32) metalContext];
    unint64_t v14 = v13;
    if (v13)
    {
      id v15 = -[VNMetalContext bindPixelBuffersToTextures:error:](v13, v11, a2);
      if (v15)
      {
        uint64_t v16 = -[VNMetalContext bindPixelBuffersToTextures:error:](v14, v12, a2);
        if (v16)
        {
          BOOL v17 = -[VNMetalContext bindPixelBufferToMTL2DTexture:error:](v14, *(CVPixelBufferRef *)(a1 + 64), a2);
          if (v17)
          {
            id v18 = -[VNMetalContext createGuidedFilterForTextures:referenceTexture:error:](v14, v15, v17, a2);
            if (v18
              && -[VNMetalContext upsampleTextures:referenceTexture:constraintsTextures:upsampledTextures:filter:waitForCompletion:error:]((BOOL)v14, v15, v17, 0, v16, v18, 1, a2))
            {

              int v19 = 0;
              id v18 = 0;
            }
            else
            {
              int v19 = 1;
            }
          }
          else
          {
            int v19 = 1;
          }
        }
        else
        {
          int v19 = 1;
        }

        goto LABEL_26;
      }
    }
    else
    {
      if (!a2)
      {
        int v19 = 1;
        goto LABEL_27;
      }
      id v20 = [NSString alloc];
      int v21 = (objc_class *)objc_opt_class();
      char v22 = NSStringFromClass(v21);
      id v15 = (void *)[v20 initWithFormat:@"%@ does not have a metal context", v22];

      *a2 = +[VNError errorForInternalErrorWithLocalizedDescription:v15];
    }
    int v19 = 1;
LABEL_26:

LABEL_27:
    if (!v19) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  return 0;
}

- (__CVBuffer)generateMaskedImageOfInstances:(id)a3 imageBuffer:(id)a4 inPlace:(BOOL)a5 croppedToInstancesExtent:(BOOL)a6 error:(id *)a7
{
  return -[VNInstanceMaskObservation generateMaskedImageOfInstances:imageBuffer:inPlace:croppedToInstancesExtent:returnCropRect:error:]((uint64_t)self, a3, a4, a5, a6, 0, a7);
}

- (__CVBuffer)generateMaskedImageOfInstances:(id)a3 fromRequestHandler:(id)a4 inPlace:(BOOL)a5 croppedToInstancesExtent:(BOOL)a6 error:(id *)a7
{
  return [(VNInstanceMaskObservation *)self generateMaskedImageOfInstances:a3 fromRequestHandler:a4 inPlace:a5 croppedToInstancesExtent:a6 returnCropRect:0 error:a7];
}

- (__CVBuffer)generateScaledMaskForImageForInstances:(id)a3 imageBuffer:(id)a4 croppedToInstancesExtent:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  if (v10)
  {
    uint64_t v12 = -[VNInstanceMaskObservation _maskProductionResourcesAndReturnError:](self, a6);
    if (v12)
    {
      uint64_t v33 = 0;
      double x = self->_regionOfInterest.origin.x;
      double y = self->_regionOfInterest.origin.y;
      double width = self->_regionOfInterest.size.width;
      double height = self->_regionOfInterest.size.height;
      unint64_t v17 = [v11 width];
      unint64_t v18 = [v11 height];
      int v19 = (__CVBuffer *)objc_msgSend(v11, "croppedBufferWithWidth:height:format:cropRect:options:error:", (unint64_t)(width * (double)v17), (unint64_t)(height * (double)v18), 1111970369, 0, a6, x * (double)v17, y * (double)v18);
      if (v19)
      {
        id v20 = [(VNInstanceMaskObservation *)self generateMaskForInstances:v10 error:a6];
        if (v20)
        {
          uint64_t v33 = -[VNInstanceMaskObservation _upsampleLowResMask:reference:maskProductionResources:error:]((uint64_t)self, (uint64_t)v20, (uint64_t)v19, v12, (uint64_t)a6);
          if (!v7) {
            goto LABEL_12;
          }
          v34.origin.double x = calculateCropSizeOfPixelBuffer(v20, a6, 0.0);
          double v21 = v34.origin.x;
          double v22 = v34.origin.y;
          double v23 = v34.size.width;
          double v24 = v34.size.height;
          if (CGRectIsNull(v34)) {
            goto LABEL_18;
          }
          size_t v25 = CVPixelBufferGetWidth(v20);
          size_t v26 = CVPixelBufferGetHeight(v20);
          double v27 = 0.0;
          double v28 = 0.0;
          double v29 = 0.0;
          if (v25)
          {
            double v28 = v21 / (double)v25;
            double v29 = v23 / (double)v25;
          }
          double v30 = 0.0;
          if (v26)
          {
            double v27 = v22 / (double)v26;
            double v30 = v24 / (double)v26;
          }
          if (!-[VNInstanceMaskObservation _cropInOutPixelBuffer:normalizedBoundingBox:maskProductionResources:returnCropRect:error:]((uint64_t)self, (CVPixelBufferRef *)&v33, v12, 0, a6, v28, v27, v29, v30))LABEL_18:int v31 = 1; {
          else
          }
LABEL_12:
            int v31 = 0;
          CVPixelBufferRelease(v20);
        }
        else
        {
          int v31 = 2;
        }
        CVPixelBufferRelease(v19);
        if (v31) {
          int v19 = 0;
        }
        else {
          int v19 = (__CVBuffer *)v33;
        }
      }
    }
    else
    {
      int v19 = 0;
    }
  }
  else if (a6)
  {
    +[VNError errorForInvalidArgument:0 named:@"instances"];
    int v19 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v19 = 0;
  }

  return v19;
}

- (CVPixelBufferRef)generateScaledMaskForImageForInstances:(NSIndexSet *)instances fromRequestHandler:(VNImageRequestHandler *)requestHandler error:(NSError *)error
{
  v8 = instances;
  BOOL v9 = requestHandler;
  id v10 = v9;
  if (self)
  {
    if (v9)
    {
      id v11 = [(VNImageRequestHandler *)v9 imageBuffer];
      self = [(VNInstanceMaskObservation *)self generateScaledMaskForImageForInstances:v8 imageBuffer:v11 croppedToInstancesExtent:0 error:error];
    }
    else if (error)
    {
      +[VNError errorForInvalidArgument:0 named:@"requestHandler"];
      self = 0;
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      self = 0;
    }
  }

  return (CVPixelBufferRef)self;
}

- (CVPixelBufferRef)generateMaskedImageOfInstances:(NSIndexSet *)instances fromRequestHandler:(VNImageRequestHandler *)requestHandler croppedToInstancesExtent:(BOOL)cropResult error:(NSError *)error
{
  return [(VNInstanceMaskObservation *)self generateMaskedImageOfInstances:instances fromRequestHandler:requestHandler inPlace:0 croppedToInstancesExtent:cropResult error:error];
}

- (CVPixelBufferRef)generateMaskForInstances:(NSIndexSet *)instances error:(NSError *)error
{
  uint64_t v71 = instances;
  if (v71)
  {
    BOOL v6 = [(_VNLowResAlphaMask *)self->_lowResAlphaMask isSingleMask];
    BOOL v7 = v71;
    if (v6)
    {
      CVPixelBufferRef pixelBuffer = 0;
      v8 = self;
      BOOL v9 = [(_VNLowResAlphaMask *)self->_lowResAlphaMask _alphaMaskAtIndex:0];
      size_t Width = CVPixelBufferGetWidth(v9);
      size_t Height = CVPixelBufferGetHeight(v9);
      OSType PixelFormatType = CVPixelBufferGetPixelFormatType(v9);
      uint64_t v13 = VNCVPixelBufferCreateUsingIOSurface(Width, Height, PixelFormatType, 0, &pixelBuffer);
      if (!v13)
      {
        CVPixelBufferLockBaseAddress(self->_instanceMask, 1uLL);
        CVPixelBufferLockBaseAddress(v9, 1uLL);
        CVPixelBufferLockBaseAddress(pixelBuffer, 0);
        int v25 = [(NSIndexSet *)v7 containsIndex:0];
        unint64_t numComponents = self->_numComponents;
        unsigned __int8 v72 = 0;
        std::vector<BOOL>::vector(__p, numComponents, &v72);
        if (self->_numComponents >= 2)
        {
          unint64_t v27 = 1;
          do
          {
            int v28 = [(NSIndexSet *)v7 containsIndex:v27];
            unint64_t v29 = v27 >> 6;
            uint64_t v30 = 1 << v27;
            if (v25 == v28) {
              uint64_t v31 = *((void *)__p[0] + v29) & ~v30;
            }
            else {
              uint64_t v31 = *((void *)__p[0] + v29) | v30;
            }
            *((void *)__p[0] + v29) = v31;
            ++v27;
          }
          while (v27 < self->_numComponents);
        }
        long long v32 = v7;
        BaseAddress = CVPixelBufferGetBaseAddress(v8->_instanceMask);
        size_t BytesPerRow = CVPixelBufferGetBytesPerRow(v9);
        size_t v35 = CVPixelBufferGetHeight(v9);
        size_t v36 = CVPixelBufferGetWidth(v9);
        int v37 = (char *)CVPixelBufferGetBaseAddress(v9);
        uint64_t v38 = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
        if (v35)
        {
          uint64_t v39 = 0;
          uint64_t v40 = (char *)__p[0];
          v41 = v38;
          do
          {
            if (v36)
            {
              for (uint64_t i = 0; i != v36; ++i)
              {
                if ((*(void *)&v40[((unint64_t)BaseAddress[i] >> 3) & 0x18] >> BaseAddress[i])) {
                  int v43 = *(_DWORD *)&v37[4 * i];
                }
                else {
                  int v43 = 0;
                }
                *(_DWORD *)&v41[4 * i] = v43;
              }
            }
            ++v39;
            v41 += BytesPerRow;
            v37 += BytesPerRow;
            BaseAddress += v36;
          }
          while (v39 != v35);
          if (v25)
          {
            for (uint64_t j = 0; j != v35; ++j)
            {
              if (v36)
              {
                id v45 = (float *)&v38[j * BytesPerRow];
                size_t v46 = v36;
                do
                {
                  *id v45 = 1.0 - *v45;
                  ++v45;
                  --v46;
                }
                while (v46);
              }
            }
          }
        }
        CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
        CVPixelBufferUnlockBaseAddress(v8->_instanceMask, 1uLL);
        CVPixelBufferUnlockBaseAddress(v9, 1uLL);
        unint64_t v17 = pixelBuffer;
        BOOL v7 = v32;
        if (__p[0]) {
          operator delete(__p[0]);
        }
        goto LABEL_62;
      }
      if (error)
      {
        size_t v14 = CVPixelBufferGetWidth(v9);
        size_t v15 = CVPixelBufferGetHeight(v9);
        uint64_t v16 = +[VNError errorForCVReturnCode:v13 width:v14 height:v15 pixelFormat:CVPixelBufferGetPixelFormatType(v9) localizedDescription:@"failed to create the combined mask for instances buffer"];
LABEL_11:
        unint64_t v17 = 0;
        *error = (NSError *)v16;
LABEL_62:

        goto LABEL_63;
      }
    }
    else
    {
      __p[0] = 0;
      v70 = self;
      unint64_t v18 = [(_VNLowResAlphaMask *)self->_lowResAlphaMask _alphaMaskAtIndex:0];
      size_t v19 = CVPixelBufferGetWidth(v18);
      size_t v20 = CVPixelBufferGetHeight(v18);
      OSType v21 = CVPixelBufferGetPixelFormatType(v18);
      uint64_t UsingIOSurface = VNCVPixelBufferCreateUsingIOSurface(v19, v20, v21, 0, (CVPixelBufferRef *)__p);
      if (!UsingIOSurface)
      {
        CVPixelBufferLockBaseAddress((CVPixelBufferRef)__p[0], 0);
        size_t v47 = CVPixelBufferGetBytesPerRow((CVPixelBufferRef)__p[0]);
        size_t v48 = CVPixelBufferGetHeight((CVPixelBufferRef)__p[0]);
        size_t v49 = CVPixelBufferGetWidth((CVPixelBufferRef)__p[0]);
        id v50 = (char *)CVPixelBufferGetBaseAddress((CVPixelBufferRef)__p[0]);
        bzero(v50, v48 * v47);
        lowResAlphaMasuint64_t k = self->_lowResAlphaMask;
        if (lowResAlphaMask) {
          uint64_t v52 = [(NSArray *)lowResAlphaMask->_instanceLowResMaskArray count];
        }
        else {
          uint64_t v52 = 0;
        }
        unsigned __int8 v53 = v7;
        BOOL v54 = [(NSIndexSet *)v7 containsIndex:0];
        if (v52)
        {
          uint64_t v55 = 0;
          do
          {
            uint64_t v56 = v55 + 1;
            if (v54 != [(NSIndexSet *)v53 containsIndex:v55 + 1])
            {
              double v57 = [(_VNLowResAlphaMask *)v70->_lowResAlphaMask _alphaMaskAtIndex:v55];
              CVPixelBufferLockBaseAddress(v57, 1uLL);
              double v58 = (char *)CVPixelBufferGetBaseAddress(v57);
              if (v48)
              {
                for (uint64_t k = 0; k != v48; ++k)
                {
                  if (v49)
                  {
                    BOOL v60 = (float *)&v50[k * v47];
                    uint64_t v61 = (float *)&v58[k * v47];
                    size_t v62 = v49;
                    do
                    {
                      float v63 = *v61++;
                      float v64 = v63 + *v60;
                      if (v64 >= 1.0) {
                        float v64 = 1.0;
                      }
                      *v60++ = v64;
                      --v62;
                    }
                    while (v62);
                  }
                }
              }
              CVPixelBufferUnlockBaseAddress(v57, 1uLL);
            }
            uint64_t v55 = v56;
          }
          while (v56 != v52);
        }
        if (v48) {
          BOOL v65 = v54;
        }
        else {
          BOOL v65 = 0;
        }
        if (v65)
        {
          uint64_t v66 = 0;
          do
          {
            if (v49)
            {
              uint64_t v67 = (float *)&v50[v66 * v47];
              size_t v68 = v49;
              do
              {
                *uint64_t v67 = 1.0 - *v67;
                ++v67;
                --v68;
              }
              while (v68);
            }
            ++v66;
          }
          while (v66 != v48);
        }
        CVPixelBufferUnlockBaseAddress((CVPixelBufferRef)__p[0], 0);
        unint64_t v17 = (__CVBuffer *)__p[0];
        BOOL v7 = v53;
        goto LABEL_62;
      }
      if (error)
      {
        size_t v23 = CVPixelBufferGetWidth(v18);
        size_t v24 = CVPixelBufferGetHeight(v18);
        uint64_t v16 = +[VNError errorForCVReturnCode:UsingIOSurface width:v23 height:v24 pixelFormat:CVPixelBufferGetPixelFormatType(v18) localizedDescription:@"failed to create the combined mask for instances buffer"];
        goto LABEL_11;
      }
    }
    unint64_t v17 = 0;
    goto LABEL_62;
  }
  if (error)
  {
    +[VNError errorForInvalidArgument:0 named:@"instances"];
    unint64_t v17 = 0;
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unint64_t v17 = 0;
  }
LABEL_63:

  return v17;
}

- (NSIndexSet)allInstances
{
  unint64_t numComponents = self->_numComponents;
  if (numComponents > 1) {
    objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 1, numComponents - 1);
  }
  else {
  v3 = [MEMORY[0x1E4F28D60] indexSet];
  }

  return (NSIndexSet *)v3;
}

- (__CVBuffer)createMattedImageOfInstances:(id)a3 fromRequestHandler:(id)a4 croppedToInstancesExtent:(BOOL)a5 error:(id *)a6
{
  return [(VNInstanceMaskObservation *)self generateMaskedImageOfInstances:a3 fromRequestHandler:a4 inPlace:0 croppedToInstancesExtent:a5 error:a6];
}

- (id)vn_deepCloneObjectWithError:(id *)a3
{
  v22.receiver = self;
  v22.super_class = (Class)VNInstanceMaskObservation;
  uint64_t v5 = [(VNObservation *)&v22 vn_cloneObject];
  if (v5)
  {
    instanceMasuint64_t k = self->_instanceMask;
    self;
    int Width = CVPixelBufferGetWidth(instanceMask);
    size_t Height = CVPixelBufferGetHeight(instanceMask);
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType(instanceMask);
    CVPixelBufferGetAttributes();
    CFDictionaryRef v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CFDictionaryRef v11 = CVBufferCopyAttachments(instanceMask, kCVAttachmentMode_ShouldNotPropagate);
    CVBufferRef buffer = 0;
    uint64_t v12 = VNCVPixelBufferCreateUsingIOSurface(Width, (int)Height, PixelFormatType, v10, &buffer);
    if (v12)
    {
      if (a3)
      {
        *a3 = +[VNError errorForCVReturnCode:v12 localizedDescription:@"failed to create pixel buffer"];
      }

LABEL_6:
      id v13 = 0;
      goto LABEL_12;
    }
    if (v11) {
      CVBufferSetAttachments(buffer, v11, kCVAttachmentMode_ShouldNotPropagate);
    }
    CVPixelBufferLockBaseAddress(buffer, 0);
    CVPixelBufferLockBaseAddress(instanceMask, 0);
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(instanceMask);
    BaseAddress = CVPixelBufferGetBaseAddress(instanceMask);
    uint64_t v16 = CVPixelBufferGetBaseAddress(buffer);
    memcpy(BaseAddress, v16, (uint64_t)((Height << 32) * BytesPerRow) >> 32);
    CVPixelBufferUnlockBaseAddress(instanceMask, 0);
    CVPixelBufferUnlockBaseAddress(buffer, 0);
    CVBufferRef v17 = buffer;

    if (!v17) {
      goto LABEL_6;
    }
    *(void *)(v5 + 104) = v17;
    uint64_t v18 = [(_VNLowResAlphaMask *)self->_lowResAlphaMask copy];
    size_t v19 = *(void **)(v5 + 96);
    *(void *)(v5 + 96) = v18;

    CGSize size = self->_regionOfInterest.size;
    *(CGPoint *)(v5 + 120) = self->_regionOfInterest.origin;
    *(CGSize *)(v5 + 136) = size;
    *(void *)(v5 + 112) = self->_numComponents;
  }
  id v13 = (id)v5;
LABEL_12:

  return v13;
}

- (id)vn_cloneObject
{
  v8.receiver = self;
  v8.super_class = (Class)VNInstanceMaskObservation;
  uint64_t v3 = [(VNObservation *)&v8 vn_cloneObject];
  if (v3)
  {
    uint64_t v4 = [(_VNLowResAlphaMask *)self->_lowResAlphaMask copy];
    uint64_t v5 = *(void **)(v3 + 96);
    *(void *)(v3 + 96) = v4;

    *(void *)(v3 + 104) = CVPixelBufferRetain(self->_instanceMask);
    CGSize size = self->_regionOfInterest.size;
    *(CGPoint *)(v3 + 120) = self->_regionOfInterest.origin;
    *(CGSize *)(v3 + 136) = size;
    *(void *)(v3 + 112) = self->_numComponents;
  }

  return (id)v3;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v7.receiver = self;
  v7.super_class = (Class)VNInstanceMaskObservation;
  uint64_t v4 = [(VNObservation *)&v7 description];
  [v3 appendString:v4];

  uint64_t v5 = (__CFString *)CFCopyDescription(self->_instanceMask);
  [v3 appendFormat:@" %@ %ld", v5, self->_numComponents];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (VNInstanceMaskObservation *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      BOOL v6 = [(_VNLowResAlphaMask *)self->_lowResAlphaMask isEqual:v5->_lowResAlphaMask]
        && +[VNCVPixelBufferConversionHelpers isCVPixelBuffer:self->_instanceMask equalToCVPixelBuffer:v5->_instanceMask]&& self->_numComponents == v5->_numComponents&& CGRectEqualToRect(self->_regionOfInterest, v5->_regionOfInterest);
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  v11.receiver = self;
  v11.super_class = (Class)VNInstanceMaskObservation;
  unint64_t v3 = self->_numComponents ^ __ROR8__(+[VNCVPixelBufferConversionHelpers computeHashForCVPixelBuffer:](VNCVPixelBufferConversionHelpers, "computeHashForCVPixelBuffer:", self->_instanceMask) ^ __ROR8__(+[_VNLowResAlphaMask hash], 51), 51);
  double x = self->_regionOfInterest.origin.x;
  if (x == 0.0) {
    double x = 0.0;
  }
  double y = self->_regionOfInterest.origin.y;
  if (y == 0.0) {
    double y = 0.0;
  }
  uint64_t v6 = *(void *)&y ^ __ROR8__(*(void *)&x, 51);
  double width = self->_regionOfInterest.size.width;
  if (width == 0.0) {
    double width = 0.0;
  }
  uint64_t v8 = *(void *)&width ^ __ROR8__(v6, 51);
  double height = self->_regionOfInterest.size.height;
  if (height == 0.0) {
    double height = 0.0;
  }
  return *(void *)&height ^ __ROR8__(v8, 51) ^ __ROR8__(v3, 51);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNInstanceMaskObservation;
  [(VNObservation *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_lowResAlphaMask forKey:@"lowAlphaResMask"];
  objc_msgSend(v4, "vn_encodePixelBuffer:forKey:", self->_instanceMask, @"instanceMask");
  [v4 encodeInt64:self->_numComponents forKey:@"numComponents"];
  objc_msgSend(v4, "vn_encodeRect:forKey:", @"regionOfInterest", self->_regionOfInterest.origin.x, self->_regionOfInterest.origin.y, self->_regionOfInterest.size.width, self->_regionOfInterest.size.height);
}

- (VNInstanceMaskObservation)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)VNInstanceMaskObservation;
  objc_super v5 = [(VNObservation *)&v19 initWithCoder:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    if ([v4 containsValueForKey:@"lowResMask"])
    {
      objc_super v7 = (__CVBuffer *)objc_msgSend(v4, "vn_decodePixelBufferForKey:", @"lowResMask");
      uint64_t v8 = [[_VNLowResAlphaMask alloc] initWithSingleAlphaMask:v7];
      lowResAlphaMasuint64_t k = v5->_lowResAlphaMask;
      v5->_lowResAlphaMasuint64_t k = v8;

      CVPixelBufferRelease(v7);
    }
    else
    {
      uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lowAlphaResMask"];
      objc_super v11 = v5->_lowResAlphaMask;
      v5->_lowResAlphaMasuint64_t k = (_VNLowResAlphaMask *)v10;
    }
    uint64_t v12 = objc_msgSend(v4, "vn_decodePixelBufferForKey:", @"instanceMask");
    v5->_instanceMasuint64_t k = (__CVBuffer *)v12;
    if (!v12)
    {
      CVBufferRef v17 = 0;
      goto LABEL_9;
    }
    v5->_unint64_t numComponents = [v4 decodeInt64ForKey:@"numComponents"];
    objc_msgSend(v4, "vn_decodeRectForKey:", @"regionOfInterest");
    v5->_regionOfInterest.origin.double x = v13;
    v5->_regionOfInterest.origin.double y = v14;
    v5->_regionOfInterest.size.double width = v15;
    v5->_regionOfInterest.size.double height = v16;
  }
  CVBufferRef v17 = v5;
LABEL_9:

  return v17;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_instanceMask);
  self->_instanceMasuint64_t k = 0;
  v3.receiver = self;
  v3.super_class = (Class)VNInstanceMaskObservation;
  [(VNInstanceMaskObservation *)&v3 dealloc];
}

- (VNInstanceMaskObservation)initWithOriginatingRequestSpecifier:(id)a3 instanceLowResMaskArray:(id)a4 instanceFeatureKeyIndexMap:(id)a5 instanceCategoryKeyIndexMap:(id)a6 instanceMask:(__CVBuffer *)a7 numComponents:(unint64_t)a8 regionOfInterest:(CGRect)a9
{
  CGFloat height = a9.size.height;
  CGFloat width = a9.size.width;
  CGFloat y = a9.origin.y;
  CGFloat x = a9.origin.x;
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a6;
  v28.receiver = self;
  v28.super_class = (Class)VNInstanceMaskObservation;
  size_t v23 = [(VNObservation *)&v28 initWithOriginatingRequestSpecifier:v19];
  if (v23)
  {
    if ([v20 count] != a8 - 1)
    {
      size_t v26 = 0;
      goto LABEL_6;
    }
    size_t v24 = [[_VNLowResAlphaMask alloc] initWithAlphaMaskArray:v20];
    lowResAlphaMasuint64_t k = v23->_lowResAlphaMask;
    v23->_lowResAlphaMasuint64_t k = v24;

    v23->_instanceMasuint64_t k = CVPixelBufferRetain(a7);
    v23->_unint64_t numComponents = a8;
    v23->_regionOfInterest.origin.CGFloat x = x;
    v23->_regionOfInterest.origin.CGFloat y = y;
    v23->_regionOfInterest.size.CGFloat width = width;
    v23->_regionOfInterest.size.CGFloat height = height;
    objc_storeStrong((id *)&v23->_instanceSegmentationMaskFeatureMap, a5);
    objc_storeStrong((id *)&v23->_instanceCategoriesMap, a6);
  }
  size_t v26 = v23;
LABEL_6:

  return v26;
}

- (VNInstanceMaskObservation)initWithOriginatingRequestSpecifier:(id)a3 instanceLowResMaskArray:(id)a4 instanceMask:(__CVBuffer *)a5 numComponents:(unint64_t)a6 regionOfInterest:(CGRect)a7
{
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  id v15 = a3;
  id v16 = a4;
  id v17 = objc_alloc_init(MEMORY[0x1E4F1C978]);
  id v18 = objc_alloc_init(MEMORY[0x1E4F1C978]);
  id v19 = -[VNInstanceMaskObservation initWithOriginatingRequestSpecifier:instanceLowResMaskArray:instanceFeatureKeyIndexMap:instanceCategoryKeyIndexMap:instanceMask:numComponents:regionOfInterest:](self, "initWithOriginatingRequestSpecifier:instanceLowResMaskArray:instanceFeatureKeyIndexMap:instanceCategoryKeyIndexMap:instanceMask:numComponents:regionOfInterest:", v15, v16, v17, v18, a5, a6, x, y, width, height);

  return v19;
}

- (VNInstanceMaskObservation)initWithOriginatingRequestSpecifier:(id)a3 lowResMask:(__CVBuffer *)a4 instanceMask:(__CVBuffer *)a5 numComponents:(unint64_t)a6 regionOfInterest:(CGRect)a7
{
  CGFloat height = a7.size.height;
  CGFloat width = a7.size.width;
  CGFloat y = a7.origin.y;
  CGFloat x = a7.origin.x;
  id v15 = a3;
  v20.receiver = self;
  v20.super_class = (Class)VNInstanceMaskObservation;
  id v16 = [(VNObservation *)&v20 initWithOriginatingRequestSpecifier:v15];
  if (v16)
  {
    id v17 = [[_VNLowResAlphaMask alloc] initWithSingleAlphaMask:a4];
    lowResAlphaMasuint64_t k = v16->_lowResAlphaMask;
    v16->_lowResAlphaMasuint64_t k = v17;

    v16->_instanceMasuint64_t k = CVPixelBufferRetain(a5);
    v16->_unint64_t numComponents = a6;
    v16->_regionOfInterest.origin.CGFloat x = x;
    v16->_regionOfInterest.origin.CGFloat y = y;
    v16->_regionOfInterest.size.CGFloat width = width;
    v16->_regionOfInterest.size.CGFloat height = height;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end