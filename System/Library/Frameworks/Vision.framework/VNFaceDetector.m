@interface VNFaceDetector
+ (BOOL)calculateTilesForRegionOfInterest:(CGRect)a3 imageWidth:(unint64_t)a4 imageHeight:(unint64_t)a5 tileSizeInPixels:(unint64_t)a6 overlapFraction:(float)a7 aspectRatioThreshold:(float)a8 columns:(unint64_t *)a9 rows:(unint64_t *)a10 tiles:(void *)a11 error:(id *)a12;
+ (BOOL)shouldDumpDebugIntermediates;
+ (Class)detectorClassForConfigurationOptions:(id)a3 error:(id *)a4;
+ (id)configurationOptionKeysForDetectorKey;
+ (void)fullyPopulateConfigurationOptions:(id)a3;
+ (void)printDebugInfo:(id)a3 facesDataRaw:(void *)a4 faceDetectorBGRAImage:(__CVBuffer *)a5 tempImage:(vImage_Buffer *)a6 session:(id)a7;
+ (void)recordDefaultConfigurationOptionsInDictionary:(id)a3;
- (id)internalProcessUsingQualityOfServiceClass:(unsigned int)a3 options:(id)a4 regionOfInterest:(CGRect)a5 warningRecorder:(id)a6 error:(id *)a7 progressHandler:(id)a8;
@end

@implementation VNFaceDetector

+ (void)recordDefaultConfigurationOptionsInDictionary:(id)a3
{
  id v4 = a3;
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___VNFaceDetector;
  objc_msgSendSuper2(&v5, sel_recordDefaultConfigurationOptionsInDictionary_, v4);
  [v4 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"VNFaceDetectorInitOption_EnableLowMemoryMode"];
}

+ (Class)detectorClassForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v5 error:a4];
  if (!v6) {
    goto LABEL_8;
  }
  if ([v6 specifiesRequestClass:objc_opt_class()])
  {
    uint64_t v7 = [v6 requestRevision];
    if ((unint64_t)(v7 - 1) < 2 || v7 == 3737841665)
    {
      v8 = objc_opt_class();
      goto LABEL_9;
    }
  }
  if (a4)
  {
    +[VNError errorForUnsupportedRequestSpecifier:v6];
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_8:
    v8 = 0;
  }
LABEL_9:

  return (Class)v8;
}

+ (void)fullyPopulateConfigurationOptions:(id)a3
{
  id v4 = a3;
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___VNFaceDetector;
  objc_msgSendSuper2(&v10, sel_fullyPopulateConfigurationOptions_, v4);
  id v5 = [v4 objectForKeyedSubscript:@"VNFaceDetectorInitOption_MinFaceSize"];

  if (!v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"VNDetectorOption_RequestDetectionLevel"];
    uint64_t v7 = [v6 unsignedIntegerValue];

    v8 = &unk_1EF7A8220;
    if (v7 == 1) {
      v8 = &unk_1EF7A8230;
    }
    if (v7 == 2) {
      v9 = &unk_1EF7A8240;
    }
    else {
      v9 = v8;
    }
    [v4 setObject:v9 forKeyedSubscript:@"VNFaceDetectorInitOption_MinFaceSize"];
  }
}

+ (BOOL)calculateTilesForRegionOfInterest:(CGRect)a3 imageWidth:(unint64_t)a4 imageHeight:(unint64_t)a5 tileSizeInPixels:(unint64_t)a6 overlapFraction:(float)a7 aspectRatioThreshold:(float)a8 columns:(unint64_t *)a9 rows:(unint64_t *)a10 tiles:(void *)a11 error:(id *)a12
{
  v98.origin.double x = a3.origin.x * (double)a4;
  v98.size.double width = a3.size.width * (double)a4;
  v98.origin.double y = a3.origin.y * (double)a5;
  v98.size.CGFloat height = a3.size.height * (double)a5;
  CGRect v99 = CGRectIntegral(v98);
  double x = v99.origin.x;
  double y = v99.origin.y;
  double width = v99.size.width;
  CGFloat height = v99.size.height;
  float v24 = (float)a4 / (float)a5;
  if (v24 < a8 && v24 > (float)(1.0 / a8))
  {
    v31 = (double *)*((void *)a11 + 1);
    unint64_t v30 = *((void *)a11 + 2);
    if ((unint64_t)v31 >= v30)
    {
      v39 = *(double **)a11;
      uint64_t v40 = ((uint64_t)v31 - *(void *)a11) >> 5;
      unint64_t v41 = v40 + 1;
      if ((unint64_t)(v40 + 1) >> 59) {
        goto LABEL_122;
      }
      uint64_t v42 = v30 - (void)v39;
      if (v42 >> 4 > v41) {
        unint64_t v41 = v42 >> 4;
      }
      BOOL v63 = (unint64_t)v42 >= 0x7FFFFFFFFFFFFFE0;
      unint64_t v43 = 0x7FFFFFFFFFFFFFFLL;
      if (!v63) {
        unint64_t v43 = v41;
      }
      if (v43)
      {
        unint64_t v43 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<vImage_Buffer>>(v43);
        v39 = *(double **)a11;
        v31 = (double *)*((void *)a11 + 1);
      }
      else
      {
        uint64_t v44 = 0;
      }
      v58 = (double *)(v43 + 32 * v40);
      double *v58 = x;
      v58[1] = y;
      unint64_t v59 = v43 + 32 * v44;
      v58[2] = width;
      v58[3] = height;
      v32 = v58 + 4;
      if (v31 != v39)
      {
        do
        {
          long long v60 = *((_OWORD *)v31 - 1);
          *((_OWORD *)v58 - 2) = *((_OWORD *)v31 - 2);
          *((_OWORD *)v58 - 1) = v60;
          v58 -= 4;
          v31 -= 4;
        }
        while (v31 != v39);
        v39 = *(double **)a11;
      }
      *(void *)a11 = v58;
      *((void *)a11 + 1) = v32;
      *((void *)a11 + 2) = v59;
      if (v39) {
        operator delete(v39);
      }
    }
    else
    {
      double *v31 = x;
      v31[1] = v99.origin.y;
      v32 = v31 + 4;
      v31[2] = v99.size.width;
      v31[3] = v99.size.height;
    }
    *((void *)a11 + 1) = v32;
    return 1;
  }
  v26 = a12;
  if (v99.size.width < 1.0 || v99.size.height < 1.0)
  {
    if (!a12) {
      return 0;
    }
    v28 = objc_msgSend(NSString, "stringWithFormat:", @"invalid ROI size of %f x %f", *(void *)&v99.size.width, *(void *)&v99.size.height);
    v29 = +[VNError errorWithCode:3 message:v28];
LABEL_52:
    id *v26 = v29;

    return 0;
  }
  unint64_t v33 = (unint64_t)v99.size.width;
  unint64_t v34 = (unint64_t)v99.size.height;
  if ((unint64_t)v99.size.width * (unint64_t)v99.size.height <= a6)
  {
    float v38 = (float)v33;
    float v37 = (float)v34;
  }
  else
  {
    double v35 = (double)v33 / (double)v34;
    double v36 = sqrt((double)a6 / v35);
    float v37 = v36;
    float v38 = v35 * v36;
  }
  unint64_t v45 = (unint64_t)(float)(v38 + 0.5);
  unint64_t v46 = 32;
  if (v45 <= 0x20) {
    unint64_t v45 = 32;
  }
  float v47 = v37 + 0.5;
  if ((unint64_t)v47 > 0x20) {
    unint64_t v46 = (unint64_t)v47;
  }
  unint64_t v48 = (v45 + 15) & 0xFFFFFFFFFFFFFFF0;
  unint64_t v49 = (v46 + 15) & 0xFFFFFFFFFFFFFFF0;
  if (v48 >= v33) {
    unint64_t v50 = (unint64_t)width;
  }
  else {
    unint64_t v50 = (v45 + 15) & 0xFFFFFFFFFFFFFFF0;
  }
  if (v49 >= v34) {
    unint64_t v51 = (unint64_t)v99.size.height;
  }
  else {
    unint64_t v51 = (v46 + 15) & 0xFFFFFFFFFFFFFFF0;
  }
  if (v50) {
    BOOL v52 = v51 == 0;
  }
  else {
    BOOL v52 = 1;
  }
  if (v52)
  {
    if (!a12) {
      return 0;
    }
    v28 = objc_msgSend(NSString, "stringWithFormat:", @"invalid tile size of %ld x %ld", v50, v51);
    v29 = +[VNError errorWithCode:3 message:v28];
    goto LABEL_52;
  }
  unint64_t v53 = ((unint64_t)(float)((float)(a7 * (float)v50) + 0.5) + 8) & 0xFFFFFFFFFFFFFFF0;
  unint64_t v54 = ((unint64_t)(float)((float)(a7 * (float)v51) + 0.5) + 8) & 0xFFFFFFFFFFFFFFF0;
  if (v53 >= v50) {
    unint64_t v53 = 0;
  }
  if (v54 >= v51) {
    unint64_t v54 = 0;
  }
  unint64_t v97 = v51 - v54;
  unint64_t v55 = v50 - v53;
  if (v50 == v53 || v51 == v54)
  {
    if (!a12) {
      return 0;
    }
    v28 = objc_msgSend(NSString, "stringWithFormat:", @"invalid tile increment of %lu x %lu", v55, v97);
    v29 = +[VNError errorForInvalidOperationWithLocalizedDescription:v28];
    goto LABEL_52;
  }
  double v61 = (double)v50;
  double v62 = (double)v51;
  BOOL v63 = v48 >= v33 && v49 >= v34;
  if (!v63)
  {
    unint64_t v64 = (unint64_t)y;
    if ((unint64_t)y >= v34)
    {
      if (!a9)
      {
        unint64_t v65 = 0;
LABEL_120:
        if (a10) {
          *a10 = v65;
        }
        return 1;
      }
    }
    else
    {
      v93 = a9;
      unint64_t v65 = 0;
      double v95 = (double)(v34 - v51);
      double v96 = (double)v34;
      double v66 = (double)(v33 - v50);
      unint64_t v94 = (unint64_t)v99.size.height;
      do
      {
        if (v62 + (double)v64 <= v96) {
          double v67 = (double)v64;
        }
        else {
          double v67 = v95;
        }
        if ((unint64_t)x < v33)
        {
          v68 = (double *)*((void *)a11 + 1);
          unint64_t v69 = (unint64_t)x;
          do
          {
            if (v61 + (double)v69 <= (double)v33) {
              double v70 = (double)v69;
            }
            else {
              double v70 = v66;
            }
            unint64_t v71 = *((void *)a11 + 2);
            if ((unint64_t)v68 >= v71)
            {
              v72 = *(double **)a11;
              uint64_t v73 = ((uint64_t)v68 - *(void *)a11) >> 5;
              unint64_t v74 = v73 + 1;
              if ((unint64_t)(v73 + 1) >> 59) {
                goto LABEL_122;
              }
              uint64_t v75 = v71 - (void)v72;
              if (v75 >> 4 > v74) {
                unint64_t v74 = v75 >> 4;
              }
              if ((unint64_t)v75 >= 0x7FFFFFFFFFFFFFE0) {
                unint64_t v76 = 0x7FFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v76 = v74;
              }
              if (v76)
              {
                unint64_t v76 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<vImage_Buffer>>(v76);
                v72 = *(double **)a11;
                v68 = (double *)*((void *)a11 + 1);
              }
              else
              {
                uint64_t v77 = 0;
              }
              v78 = (double *)(v76 + 32 * v73);
              double *v78 = v70;
              v78[1] = v67;
              v78[2] = v61;
              v78[3] = v62;
              v79 = v78;
              if (v68 != v72)
              {
                do
                {
                  long long v80 = *((_OWORD *)v68 - 1);
                  *((_OWORD *)v79 - 2) = *((_OWORD *)v68 - 2);
                  *((_OWORD *)v79 - 1) = v80;
                  v79 -= 4;
                  v68 -= 4;
                }
                while (v68 != v72);
                v72 = *(double **)a11;
              }
              v68 = v78 + 4;
              *(void *)a11 = v79;
              *((void *)a11 + 1) = v78 + 4;
              *((void *)a11 + 2) = v76 + 32 * v77;
              if (v72) {
                operator delete(v72);
              }
            }
            else
            {
              double *v68 = v70;
              v68[1] = v67;
              v68[2] = v61;
              v68[3] = v62;
              v68 += 4;
            }
            *((void *)a11 + 1) = v68;
            v69 += v55;
          }
          while (v69 < v33);
        }
        ++v65;
        v64 += v97;
      }
      while (v64 < v94);
      v26 = a12;
      if (!v93) {
        goto LABEL_120;
      }
      if (v65)
      {
        unint64_t *v93 = ((uint64_t)(*((void *)a11 + 1) - *(void *)a11) >> 5) / v65;
        goto LABEL_120;
      }
    }
    if (v26)
    {
      v28 = objc_msgSend([NSString alloc], "initWithFormat:", @"unexpected ROI origin causing %lui rows of %f x %f", 0, *(void *)&x, *(void *)&y);
      v29 = +[VNError errorForInternalErrorWithLocalizedDescription:v28];
      goto LABEL_52;
    }
    return 0;
  }
  v82 = (double *)*((void *)a11 + 1);
  unint64_t v81 = *((void *)a11 + 2);
  if ((unint64_t)v82 < v81)
  {
    double *v82 = x;
    v82[1] = y;
    v83 = v82 + 4;
    v82[2] = v61;
    v82[3] = v62;
    goto LABEL_116;
  }
  v84 = *(double **)a11;
  uint64_t v85 = ((uint64_t)v82 - *(void *)a11) >> 5;
  unint64_t v86 = v85 + 1;
  if ((unint64_t)(v85 + 1) >> 59) {
LABEL_122:
  }
    std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
  uint64_t v87 = v81 - (void)v84;
  if (v87 >> 4 > v86) {
    unint64_t v86 = v87 >> 4;
  }
  BOOL v63 = (unint64_t)v87 >= 0x7FFFFFFFFFFFFFE0;
  unint64_t v88 = 0x7FFFFFFFFFFFFFFLL;
  if (!v63) {
    unint64_t v88 = v86;
  }
  if (v88)
  {
    unint64_t v88 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<vImage_Buffer>>(v88);
    v84 = *(double **)a11;
    v82 = (double *)*((void *)a11 + 1);
  }
  else
  {
    uint64_t v89 = 0;
  }
  v90 = (double *)(v88 + 32 * v85);
  double *v90 = x;
  v90[1] = y;
  unint64_t v91 = v88 + 32 * v89;
  v90[2] = v61;
  v90[3] = v62;
  v83 = v90 + 4;
  if (v82 != v84)
  {
    do
    {
      long long v92 = *((_OWORD *)v82 - 1);
      *((_OWORD *)v90 - 2) = *((_OWORD *)v82 - 2);
      *((_OWORD *)v90 - 1) = v92;
      v90 -= 4;
      v82 -= 4;
    }
    while (v82 != v84);
    v84 = *(double **)a11;
  }
  *(void *)a11 = v90;
  *((void *)a11 + 1) = v83;
  *((void *)a11 + 2) = v91;
  if (v84) {
    operator delete(v84);
  }
LABEL_116:
  *((void *)a11 + 1) = v83;
  if (a9) {
    *a9 = 1;
  }
  if (!a10) {
    return 1;
  }
  BOOL result = 1;
  *a10 = 1;
  return result;
}

+ (void)printDebugInfo:(id)a3 facesDataRaw:(void *)a4 faceDetectorBGRAImage:(__CVBuffer *)a5 tempImage:(vImage_Buffer *)a6 session:(id)a7
{
  v72[2] = *MEMORY[0x1E4F143B8];
  id v60 = a3;
  id v59 = a7;
  if (+[VNFaceDetector shouldDumpDebugIntermediates])
  {
    v58 = [MEMORY[0x1E4F28CB8] defaultManager];
    objc_super v10 = NSTemporaryDirectory();
    uint64_t v11 = [v10 stringByAppendingString:@"VN_facedetector_debug_intermediates/"];

    v57 = (void *)v11;
    v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v11];
    LODWORD(v11) = [v58 createDirectoryAtURL:v12 withIntermediateDirectories:1 attributes:0 error:0];

    if (v11)
    {
      v13 = [v60 fileURL];
      v14 = [v13 path];

      unint64_t v55 = v14;
      if (v14)
      {
        v15 = [(__CFString *)v14 lastPathComponent];
        v16 = [v15 stringByDeletingPathExtension];
        uint64_t v17 = [v16 stringByAppendingString:@"_"];

        v18 = (__CFString *)v17;
      }
      else
      {
        v18 = &stru_1EF75C0C0;
      }
      uint64_t v20 = *(void *)a4;
      uint64_t v19 = *((void *)a4 + 1);
      unint64_t v53 = v18;
      v21 = objc_msgSend(v57, "stringByAppendingString:");
      v22 = [NSNumber numberWithUnsignedLongLong:+[VNFaceDetector printDebugInfo:facesDataRaw:faceDetectorBGRAImage:tempImage:session:]::image_name_offset];
      v23 = [v22 stringValue];
      float v24 = [v21 stringByAppendingString:v23];

      unint64_t v64 = v24;
      unint64_t v50 = [v24 stringByAppendingString:@"_fd_image.vdump"];
      id v54 = [v24 stringByAppendingString:@"_fd_image.png"];
      v56 = [v24 stringByAppendingString:@"_raw_bboxes.json"];
      v25 = [VNImageBuffer alloc];
      BOOL v63 = [(VNImageBuffer *)v25 initWithCVPixelBuffer:a5 orientation:1 options:MEMORY[0x1E4F1CC08] session:v59];
      v26 = (void *)MEMORY[0x1A6257080]();
      id v52 = v50;
      ImageProcessing_save((FILE *)[v52 UTF8String], a6, 4);
      id v51 = v54;
      saveCVPixelBuffer((const char *)[v51 UTF8String], a5);
      id v65 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      if (v19 != v20)
      {
        uint64_t v27 = 0;
        uint64_t v28 = 0;
        unint64_t v29 = (v19 - v20) / 80;
        unint64_t v30 = @"<binary-data>";
        if (v55) {
          unint64_t v30 = v55;
        }
        if (v29 <= 1) {
          unint64_t v29 = 1;
        }
        unint64_t v61 = v29;
        double v62 = v30;
        do
        {
          uint64_t v31 = *(void *)a4;
          v68 = [NSString stringWithFormat:@"%@_face_%d", v64, v28];
          v32 = [v68 stringByAppendingString:@"_raw_bbox_crop.png"];
          unint64_t v33 = (_DWORD *)(v31 + v27);
          unint64_t v34 = -[VNImageBuffer croppedBufferWithWidth:height:format:cropRect:options:error:](v63, "croppedBufferWithWidth:height:format:cropRect:options:error:", (unint64_t)*(float *)(v31 + v27 + 36), (unint64_t)*(float *)(v31 + v27 + 32), 1111970369, MEMORY[0x1E4F1CC08], 0, *(float *)(v31 + v27 + 24), *(float *)(v31 + v27 + 28), *(float *)(v31 + v27 + 36), *(float *)(v31 + v27 + 32));
          context = (void *)MEMORY[0x1A6257080]();
          id v35 = v32;
          saveCVPixelBuffer((const char *)[v35 UTF8String], v34);
          v71[0] = @"imageURL";
          v71[1] = @"rect";
          v72[0] = v62;
          v69[0] = @"x";
          LODWORD(v36) = *(_DWORD *)(v31 + v27 + 24);
          float v37 = [NSNumber numberWithFloat:v36];
          v70[0] = v37;
          v69[1] = @"y";
          LODWORD(v38) = v33[7];
          v39 = [NSNumber numberWithFloat:v38];
          v70[1] = v39;
          v69[2] = @"width";
          LODWORD(v40) = v33[9];
          unint64_t v41 = [NSNumber numberWithFloat:v40];
          v70[2] = v41;
          v69[3] = @"height";
          LODWORD(v42) = v33[8];
          unint64_t v43 = [NSNumber numberWithFloat:v42];
          v70[3] = v43;
          uint64_t v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:v69 count:4];
          v72[1] = v44;
          unint64_t v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:v71 count:2];

          unint64_t v46 = [NSNumber numberWithInt:v28];
          float v47 = [v46 stringValue];
          [v65 setObject:v45 forKey:v47];

          CVPixelBufferRelease(v34);

          ++v28;
          v27 += 80;
        }
        while (v61 != v28);
      }
      unint64_t v48 = (void *)MEMORY[0x1A6257080]();
      unint64_t v49 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v65 options:1 error:0];
      [v49 writeToFile:v56 atomically:1];

      NSLog(&cfstr_VnFaceDetector.isa, v57);
      +++[VNFaceDetector printDebugInfo:facesDataRaw:faceDetectorBGRAImage:tempImage:session:]::image_name_offset;
    }
  }
}

- (id)internalProcessUsingQualityOfServiceClass:(unsigned int)a3 options:(id)a4 regionOfInterest:(CGRect)a5 warningRecorder:(id)a6 error:(id *)a7 progressHandler:(id)a8
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v16 = a4;
  id v124 = a6;
  id v122 = a8;
  v123 = v16;
  uint64_t v17 = [(VNDetector *)self validatedImageBufferFromOptions:v16 error:a7];
  v18 = v17;
  if (!v17)
  {
    id v107 = 0;
    goto LABEL_39;
  }
  uint64_t v183 = 0;
  v184[0] = 0;
  v180 = 0;
  v181 = 0;
  uint64_t v182 = 0;
  uint64_t v19 = [v17 width];
  uint64_t v20 = [v18 height];
  LODWORD(v21) = 1050253722;
  LODWORD(v22) = 2.0;
  if (!+[VNFaceDetector calculateTilesForRegionOfInterest:imageWidth:imageHeight:tileSizeInPixels:overlapFraction:aspectRatioThreshold:columns:rows:tiles:error:](VNFaceDetector, "calculateTilesForRegionOfInterest:imageWidth:imageHeight:tileSizeInPixels:overlapFraction:aspectRatioThreshold:columns:rows:tiles:error:", v19, v20, 3145728, v184, &v183, &v180, x, y, width, height, v21, v22, a7))
  {
    id v107 = 0;
    goto LABEL_37;
  }
  VNRecordImageTilingWarning(v124, v184[0], v183);
  float v24 = v180;
  v23 = v181;
  unint64_t v113 = v181 - v180;
  unint64_t v121 = (v181 - v180) >> 5;
  v117 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:");
  uint64_t v174 = 0;
  v175 = &v174;
  uint64_t v176 = 0x3032000000;
  v177 = __Block_byref_object_copy__21204;
  v178 = __Block_byref_object_dispose__21205;
  id v179 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v172[0] = 0;
  v172[1] = v172;
  v172[2] = 0x3812000000;
  v172[3] = __Block_byref_object_copy__46_21206;
  v172[4] = __Block_byref_object_dispose__47_21207;
  v172[5] = "";
  int v173 = 0;
  objc_initWeak(&location, self);
  v25 = objc_opt_class();
  int v114 = [v25 VNClassCode];
  v116 = [v25 detectorCropCreationAsyncTasksQueue];
  dispatch_group_t v120 = dispatch_group_create();
  v115 = [v25 detectorCropProcessingAsyncTasksQueue];
  v110 = a7;
  v111 = v18;
  dispatch_group_t v119 = dispatch_group_create();
  kdebug_trace();
  VNValidatedLog(1, @"Start processing tilesProcessingGroup. currentDetector: %@", v26, v27, v28, v29, v30, v31, (uint64_t)self);
  v129 = self;
  if (v23 != v24)
  {
    uint64_t v38 = 0;
    v39 = 0;
    uint64_t v40 = v121;
    if (v121 <= 1) {
      uint64_t v40 = 1;
    }
    uint64_t v112 = v40;
    do
    {
      uint64_t v127 = v38;
      long long v41 = *(_OWORD *)&v180[v38 + 16];
      long long v169 = *(_OWORD *)&v180[v38];
      long long v170 = v41;
      v167[0] = 0;
      v167[1] = v167;
      v167[2] = 0x3032000000;
      v167[3] = __Block_byref_object_copy__21204;
      v167[4] = __Block_byref_object_dispose__21205;
      id v168 = 0;
      v165[0] = 0;
      v165[1] = v165;
      v165[2] = 0x3032000000;
      v165[3] = __Block_byref_object_copy__21204;
      v165[4] = __Block_byref_object_dispose__21205;
      id v166 = 0;
      v164[0] = 0;
      v164[1] = v164;
      v164[2] = 0x2020000000;
      v164[3] = 0;
      double v42 = (void *)[v123 mutableCopy];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __123__VNFaceDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke;
      block[3] = &unk_1E5B1FE38;
      objc_copyWeak(v158, &location);
      int v162 = v114;
      v156 = v167;
      v158[1] = v39;
      v125 = v120;
      v151 = v125;
      long long v159 = v169;
      long long v160 = v170;
      id v43 = v42;
      id v152 = v43;
      unsigned int v163 = a3;
      id v44 = v124;
      id v153 = v44;
      v157 = v164;
      id v45 = v122;
      id v155 = v45;
      unint64_t v161 = v121;
      id v46 = v116;
      id v154 = v46;
      dispatch_block_t v47 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)a3, 0, block);
      v131[0] = MEMORY[0x1E4F143A8];
      v131[1] = 3221225472;
      v131[2] = __123__VNFaceDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_3;
      v131[3] = &unk_1E5B1F3C8;
      objc_copyWeak(v144, &location);
      v139 = v167;
      unint64_t v48 = v47;
      int v148 = v114;
      unint64_t v49 = v48;
      id v137 = v48;
      v126 = v39;
      v144[1] = v39;
      unint64_t v50 = v119;
      v132 = v50;
      v140 = v165;
      v141 = v164;
      long long v145 = v169;
      long long v146 = v170;
      id v51 = v43;
      id v133 = v51;
      unsigned int v149 = a3;
      id v134 = v44;
      id v138 = v45;
      v142 = v172;
      v143 = &v174;
      id v135 = v117;
      unint64_t v147 = v121;
      id v52 = v115;
      id v136 = v52;
      id v59 = (void (**)(void))dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)a3, 0, v131);
      if (v113 < 0x21)
      {
        VNValidatedLog(1, @"Performing createRegionOfInterestCropForProcessingBlock. currentDetector: %@", v53, v54, v55, v56, v57, v58, (uint64_t)v129);
        v49[2](v49);
        VNValidatedLog(1, @"Performing processRegionOfInterestBlock. currentDetector: %@", v66, v67, v68, v69, v70, v71, (uint64_t)v129);
        v59[2](v59);
        VNValidatedLog(1, @"Finish processing createRegionOfInterestCropForProcessingBlock and processRegionOfInterestBlock. currentDetector: %@", v72, v73, v74, v75, v76, v77, (uint64_t)v129);
      }
      else
      {
        VNValidatedLog(1, @"Scheduling createRegionOfInterestCropForProcessingBlock. currentDetector: %@; group: %@",
          v53,
          v54,
          v55,
          v56,
          v57,
          v58,
          (uint64_t)v129);
        [v46 dispatchGroupAsyncByPreservingQueueCapacity:v125 block:v49];
        VNValidatedLog(1, @"Scheduling processRegionOfInterestBlock. currentDetector: %@; group: %@",
          v60,
          v61,
          v62,
          v63,
          v64,
          v65,
          (uint64_t)v129);
        [v52 dispatchGroupAsyncByPreservingQueueCapacity:v50 block:v59];
      }

      objc_destroyWeak(v144);
      objc_destroyWeak(v158);

      _Block_object_dispose(v164, 8);
      _Block_object_dispose(v165, 8);

      _Block_object_dispose(v167, 8);
      ++v39;
      uint64_t v38 = v127 + 32;
    }
    while ((char *)v112 != v126 + 1);
  }
  v18 = v111;
  if (v113 > 0x20)
  {
    VNValidatedLog(1, @"Waiting for tilesCropCreationGroup. currentDetector: %@; group: %@",
      v32,
      v33,
      v34,
      v35,
      v36,
      v37,
      (uint64_t)v129);
    if ([v116 dispatchGroupWait:v120 error:v110])
    {
      VNValidatedLog(1, @"Waiting for tilesCropProcessingGroup. currentDetector: %@; group: %@",
        v78,
        v79,
        v80,
        v81,
        v82,
        v83,
        (uint64_t)v129);
      if ([v115 dispatchGroupWait:v119 error:v110])
      {
        VNValidatedLog(1, @"Finish processing tilesCropCreationGroup and tilesCropProcessingGroup. currentDetector: %@; cropCreationGroup: %@; cropProcessingGroup: %@",
          v78,
          v79,
          v80,
          v81,
          v82,
          v83,
          (uint64_t)v129);
        goto LABEL_15;
      }
      v108 = @"Timed out waiting for face detector tilesCropProcessingGroup when processing %lu tiles. currentDetector: %@; group: %@";
    }
    else
    {
      v108 = @"Timed out waiting for face detector tilesCropCreationGroup when processing %lu tiles. currentDetector: %@; group: %@";
    }
    VNValidatedLog(4, (uint64_t)v108, v78, v79, v80, v81, v82, v83, v121);
    goto LABEL_35;
  }
LABEL_15:
  kdebug_trace();
  if (+[VNValidationUtilities validateAsyncStatusResults:v117 error:v110])
  {
    id v84 = (id)v175[5];
    id v85 = &__block_literal_global_21221;
    for (unint64_t i = 0; [v84 count] > i; ++i)
    {
      uint64_t v87 = [v84 objectAtIndexedSubscript:i];
      double v88 = __123__VNFaceDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_6((uint64_t)&__block_literal_global_21221, v87);
      to = v89;
      CGFloat v130 = v88;
      double v91 = v90;
      double v93 = v92;

      unint64_t v95 = i + 1;
      while (v95 < [v84 count])
      {
        double v96 = [v84 objectAtIndexedSubscript:v95];
        double v97 = __123__VNFaceDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_6((uint64_t)&__block_literal_global_21221, v96);
        CGFloat v99 = v98;
        double v101 = v100;
        double v103 = v102;

        *(void *)&v186.origin.double y = to;
        v186.origin.double x = v130;
        v186.size.double width = v91;
        v186.size.double height = v93;
        v188.origin.double x = v97;
        v188.origin.double y = v99;
        v188.size.double width = v101;
        v188.size.double height = v103;
        CGRect v187 = CGRectIntersection(v186, v188);
        if (v187.size.width * v187.size.height / (v91 * v93 + v101 * v103 - v187.size.width * v187.size.height) < 0.5)
        {
          ++v95;
        }
        else
        {
          float v104 = v101 * v103;
          float v94 = v91 * v93;
          if (v94 > v104) {
            int v105 = v95;
          }
          else {
            int v105 = i;
          }
          if (i == v105)
          {
            v106 = [v84 objectAtIndexedSubscript:v95];
            [v84 setObject:v106 atIndexedSubscript:i];
          }
          [v84 removeObjectAtIndex:v95];
        }
      }
    }

    id v107 = (id)v175[5];
    goto LABEL_36;
  }
LABEL_35:
  id v107 = 0;
LABEL_36:

  objc_destroyWeak(&location);
  _Block_object_dispose(v172, 8);
  _Block_object_dispose(&v174, 8);

LABEL_37:
  if (v180)
  {
    v181 = v180;
    operator delete(v180);
  }
LABEL_39:

  return v107;
}

void __123__VNFaceDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (WeakRetained)
  {
    kdebug_trace();
    VNValidatedLog(1, @"createRegionOfInterestCropForProcessingBlock: start processing; currentDetector: %@",
      v3,
      v4,
      v5,
      v6,
      v7,
      v8,
      (uint64_t)WeakRetained);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __123__VNFaceDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_2;
    aBlock[3] = &unk_1E5B1FE10;
    id v9 = WeakRetained;
    id v34 = v9;
    long long v39 = *(_OWORD *)(a1 + 104);
    long long v40 = *(_OWORD *)(a1 + 120);
    id v35 = *(id *)(a1 + 40);
    int v41 = *(_DWORD *)(a1 + 148);
    id v10 = *(id *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 80);
    id v36 = v10;
    uint64_t v38 = v11;
    id v37 = *(id *)(a1 + 64);
    v12 = (uint64_t (**)(void *, id *, double, double, double, double))_Block_copy(aBlock);
    double v13 = *(double *)(a1 + 104);
    double v14 = *(double *)(a1 + 112);
    double v15 = *(double *)(a1 + 120);
    double v16 = *(double *)(a1 + 128);
    id v32 = 0;
    uint64_t v17 = v12[2](v12, &v32, v13, v14, v15, v16);
    id v18 = v32;
    uint64_t v19 = [[VNAsyncStatus alloc] initWithStatus:v17 error:v18];
    uint64_t v20 = *(void *)(*(void *)(a1 + 72) + 8);
    double v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;

    VNValidatedLog(1, @"createRegionOfInterestCropForProcessingBlock: finish processing; currentDetector: %@",
      v22,
      v23,
      v24,
      v25,
      v26,
      v27,
      (uint64_t)v9);
    kdebug_trace();
    if (*(void *)(a1 + 136) >= 2uLL) {
      [*(id *)(a1 + 56) dispatchReportBlockCompletion];
    }
  }
  else
  {
    uint64_t v28 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Currently executed Detector should not be nil"];
    uint64_t v29 = [[VNAsyncStatus alloc] initWithStatus:0 error:v28];
    uint64_t v30 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v31 = *(void **)(v30 + 40);
    *(void *)(v30 + 40) = v29;
  }
}

void __123__VNFaceDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 128));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    VNValidatedLog(1, @"processRegionOfInterestBlock: start processing; currentDetector: %@",
      v3,
      v4,
      v5,
      v6,
      v7,
      v8,
      (uint64_t)WeakRetained);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __123__VNFaceDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_4;
    aBlock[3] = &unk_1E5B1F3A0;
    id v35 = *(id *)(a1 + 72);
    id v10 = v9;
    int v42 = *(_DWORD *)(a1 + 184);
    uint64_t v11 = *(void *)(a1 + 136);
    id v31 = v10;
    uint64_t v39 = v11;
    id v32 = *(id *)(a1 + 32);
    long long v37 = *(_OWORD *)(a1 + 88);
    long long v12 = *(_OWORD *)(a1 + 160);
    long long v40 = *(_OWORD *)(a1 + 144);
    long long v41 = v12;
    uint64_t v38 = *(void *)(a1 + 104);
    id v33 = *(id *)(a1 + 40);
    int v43 = *(_DWORD *)(a1 + 188);
    id v34 = *(id *)(a1 + 48);
    id v36 = *(id *)(a1 + 80);
    double v13 = _Block_copy(aBlock);
    id v29 = 0;
    uint64_t v14 = VNExecuteBlock(v13, (uint64_t)&v29);
    id v15 = v29;
    double v16 = [[VNAsyncStatus alloc] initWithStatus:v14 error:v15];
    uint64_t v17 = *(void *)(*(void *)(a1 + 88) + 8);
    id v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 112) + 8) + 48));
    [*(id *)(*(void *)(*(void *)(a1 + 120) + 8) + 40) addObjectsFromArray:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40)];
    [*(id *)(a1 + 56) addObject:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 112) + 8) + 48));
    VNValidatedLog(1, @"processRegionOfInterestBlock: finish processing; currentDetector: %@",
      v19,
      v20,
      v21,
      v22,
      v23,
      v24,
      (uint64_t)v10);
    kdebug_trace();
    if (*(void *)(a1 + 176) >= 2uLL) {
      [*(id *)(a1 + 64) dispatchReportBlockCompletion];
    }
  }
  else
  {
    uint64_t v25 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Currently executed Detector should not be nil"];
    uint64_t v26 = [[VNAsyncStatus alloc] initWithStatus:0 error:v25];
    uint64_t v27 = *(void *)(*(void *)(a1 + 88) + 8);
    uint64_t v28 = *(void **)(v27 + 40);
    *(void *)(v27 + 40) = v26;
  }
  CVPixelBufferRelease(*(CVPixelBufferRef *)(*(void *)(*(void *)(a1 + 104) + 8) + 24));
  *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = 0;
}

double __123__VNFaceDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v2 alignedBoundingBox];
    double v4 = v3;
  }
  else
  {
    double v4 = *MEMORY[0x1E4F1DB20];
  }

  return v4;
}

BOOL __123__VNFaceDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_4(uint64_t a1, void *a2)
{
  if (dispatch_block_wait(*(dispatch_block_t *)(a1 + 64), 0xFFFFFFFFFFFFFFFFLL))
  {
    if (a2)
    {
      double v4 = +[VNError errorForExecutionTimeoutWithLocalizedDescription:@"Timed out waiting for dependent task execution"];
LABEL_8:
      BOOL v13 = 0;
      *a2 = v4;
      return v13;
    }
    return 0;
  }
  kdebug_trace();
  VNValidatedLog(1, @"processRegionOfInterestBlock: start processing (crop is ready); currentDetector: %@",
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
    *(void *)(a1 + 32));
  if (([*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) completed] & 1) == 0)
  {
    if (a2)
    {
      double v4 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) error];
      goto LABEL_8;
    }
    return 0;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __123__VNFaceDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_5;
  aBlock[3] = &unk_1E5B1EB78;
  id v16 = *(id *)(a1 + 32);
  int v24 = *(_DWORD *)(a1 + 144);
  id v17 = *(id *)(a1 + 40);
  long long v11 = *(_OWORD *)(a1 + 128);
  long long v22 = *(_OWORD *)(a1 + 112);
  long long v23 = v11;
  long long v21 = *(_OWORD *)(a1 + 88);
  id v18 = *(id *)(a1 + 48);
  int v25 = *(_DWORD *)(a1 + 148);
  id v19 = *(id *)(a1 + 56);
  id v20 = *(id *)(a1 + 72);
  long long v12 = _Block_copy(aBlock);
  CVPixelBufferLockBaseAddress(*(CVPixelBufferRef *)(*(void *)(*(void *)(a1 + 96) + 8) + 24), 1uLL);
  [(id)objc_opt_class() runSuccessReportingBlockSynchronously:v12 detector:*(void *)(a1 + 32) qosClass:*(unsigned int *)(a1 + 148) error:a2];
  CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(*(void *)(*(void *)(a1 + 96) + 8) + 24), 1uLL);
  BOOL v13 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) != 0;

  return v13;
}

BOOL __123__VNFaceDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_5(uint64_t a1, uint64_t a2)
{
  kdebug_trace();
  VNValidatedLog(1, @"processRegionOfInterest Netto: start processing; currentDetector: %@",
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    *(void *)(a1 + 32));
  uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "processRegionOfInterest:croppedPixelBuffer:options:qosClass:warningRecorder:error:progressHandler:", *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24), *(void *)(a1 + 48), *(unsigned int *)(a1 + 124), *(void *)(a1 + 56), a2, *(void *)(a1 + 64), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
  uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
  long long v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  VNValidatedLog(1, @"processRegionOfInterest Netto: finish processing; currentDetector: %@",
    v13,
    v14,
    v15,
    v16,
    v17,
    v18,
    *(void *)(a1 + 32));
  kdebug_trace();
  return *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) != 0;
}

uint64_t __123__VNFaceDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "createRegionOfInterestCrop:options:qosClass:warningRecorder:pixelBuffer:error:progressHandler:", *(void *)(a1 + 40), *(unsigned int *)(a1 + 104), *(void *)(a1 + 48), *(void *)(*(void *)(a1 + 64) + 8) + 24, a2, *(void *)(a1 + 56), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
}

+ (BOOL)shouldDumpDebugIntermediates
{
  if (+[VNFaceDetector shouldDumpDebugIntermediates]::onceToken != -1) {
    dispatch_once(&+[VNFaceDetector shouldDumpDebugIntermediates]::onceToken, &__block_literal_global_115);
  }
  return +[VNFaceDetector shouldDumpDebugIntermediates]::dumpDebug;
}

void __46__VNFaceDetector_shouldDumpDebugIntermediates__block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v1 = [v0 BOOLForKey:@"VN_DEBUG_DUMP_FACE_DETECT_INTERMEDIATES"];

  if (v1) {
    +[VNFaceDetector shouldDumpDebugIntermediates]::dumpDebug = 1;
  }
}

+ (id)configurationOptionKeysForDetectorKey
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__VNFaceDetector_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (+[VNFaceDetector configurationOptionKeysForDetectorKey]::onceToken != -1) {
    dispatch_once(&+[VNFaceDetector configurationOptionKeysForDetectorKey]::onceToken, block);
  }
  id v2 = (void *)+[VNFaceDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;

  return v2;
}

void __55__VNFaceDetector_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNFaceDetector;
  int v1 = objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  id v2 = (void *)[v1 mutableCopy];

  [v2 addObject:@"VNDetectorOption_RequestDetectionLevel"];
  [v2 addObject:@"VNFaceDetectorInitOption_MinFaceSize"];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = (void *)+[VNFaceDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNFaceDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;
}

@end