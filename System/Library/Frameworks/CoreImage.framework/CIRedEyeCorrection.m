@interface CIRedEyeCorrection
- (BOOL)_isIdentity;
- (CIImage)inputImage;
- (NSDictionary)inputCorrectionInfo;
- (NSString)inputCameraModel;
- (id)outputImage;
- (void)setDefaults;
- (void)setInputCameraModel:(id)a3;
- (void)setInputCorrectionInfo:(id)a3;
- (void)setInputImage:(id)a3;
@end

@implementation CIRedEyeCorrection

- (void)setDefaults
{
  self->inputCameraModel = 0;
  v3 = self->inputCorrectionInfo;
  self->inputCorrectionInfo = 0;
}

- (BOOL)_isIdentity
{
  return self->inputCorrectionInfo == 0;
}

- (id)outputImage
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  inputImage = self->inputImage;
  if (!inputImage) {
    return 0;
  }
  inputCorrectionInfo = self->inputCorrectionInfo;
  if (inputCorrectionInfo)
  {
    id v5 = (id)[(NSDictionary *)inputCorrectionInfo copy];
    uint64_t v6 = [v5 objectForKeyedSubscript:@"convexHull"];
    if (v6)
    {
      int v7 = 3;
      goto LABEL_7;
    }
    if ([v5 objectForKeyedSubscript:@"pointX"])
    {
      int v7 = 1;
LABEL_7:
      inputCameraModel = self->inputCameraModel;
      if (inputCameraModel) {
        v9 = (__CFString *)(id)[(NSString *)inputCameraModel copy];
      }
      else {
        v9 = @"undefined";
      }
      [(CIImage *)self->inputImage extent];
      uint64_t v13 = v12;
      uint64_t v15 = v14;
      double v16 = v10;
      double v17 = v11;
      v18 = off_1E576FBD8;
      if (v6) {
        v18 = off_1E576FBE0;
      }
      -[__objc2_class supportRectangleWithRepair:imageSize:](*v18, "supportRectangleWithRepair:imageSize:", v5, v10, v11);
      CGFloat x = v72.origin.x;
      CGFloat y = v72.origin.y;
      CGFloat width = v72.size.width;
      CGFloat height = v72.size.height;
      if (CGRectIsNull(v72))
      {
        unint64_t v23 = 0;
        unint64_t v24 = 0;
        int v25 = 0x7FFFFFFF;
LABEL_14:
        if (v25 != 0x7FFFFFFF || v23)
        {
          int v26 = 0x7FFFFFFF;
        }
        else
        {
          int v26 = 0x7FFFFFFF;
          if (!v24) {
            goto LABEL_45;
          }
        }
LABEL_30:
        double v27 = (double)v26;
        double v28 = (double)v25;
        double v29 = (double)v23;
        double v30 = (double)v24;
        if (v23)
        {
LABEL_31:
          if (v24)
          {
            id v53 = v5;
            unint64_t v54 = v24;
            int v55 = v25;
            unint64_t v56 = v23;
            int v57 = v26;
            v51 = v9;
            int v52 = v7;
            long long v67 = 0u;
            long long v68 = 0u;
            long long v65 = 0u;
            long long v66 = 0u;
            v32 = (void *)[v5 allValues];
            uint64_t v33 = [v32 countByEnumeratingWithState:&v65 objects:v69 count:16];
            if (v33)
            {
              uint64_t v34 = v33;
              uint64_t v35 = 0;
              uint64_t v36 = *(void *)v66;
              do
              {
                for (uint64_t i = 0; i != v34; ++i)
                {
                  if (*(void *)v66 != v36) {
                    objc_enumerationMutation(v32);
                  }
                  v38 = *(void **)(*((void *)&v65 + 1) + 8 * i);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    [v38 doubleValue];
                    double v40 = v39 * 1000.0;
                    if (-2654435761 * (uint64_t)v40 >= 0) {
                      uint64_t v41 = -(uint64_t)(1640531535 * (uint64_t)v40);
                    }
                    else {
                      uint64_t v41 = -1640531535 * (uint64_t)v40;
                    }
                    v35 ^= v41;
                  }
                }
                uint64_t v34 = [v32 countByEnumeratingWithState:&v65 objects:v69 count:16];
              }
              while (v34);
            }
            else
            {
              uint64_t v35 = 0;
            }
            v44 = self->inputImage;
            v45 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DB90]);
            if (v6) {
              v46 = [(CIImage *)v44 imageByColorMatchingWorkingSpaceToColorSpace:v45];
            }
            else {
              v46 = [(CIImage *)v44 imageByApplyingFilter:@"CILinearToSRGBToneCurve" withInputParameters:MEMORY[0x1E4F1CC08]];
            }
            id v47 = -[CIImage _imageByRenderingToIntermediate](-[CIImage imageByCroppingToRect:](v46, "imageByCroppingToRect:", v27, v28, v29, v30), "_imageByRenderingToIntermediate");
            uint64_t v48 = objc_msgSend(NSString, "stringWithFormat:", @"CIRedEyeCorrections %lu", v35);
            v64[0] = MEMORY[0x1E4F143A8];
            v64[1] = 3221225472;
            v64[2] = __33__CIRedEyeCorrection_outputImage__block_invoke;
            v64[3] = &__block_descriptor_64_e70__CGRect__CGPoint_dd__CGSize_dd__40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
            *(double *)&v64[4] = v27;
            *(double *)&v64[5] = v28;
            *(double *)&v64[6] = v29;
            *(double *)&v64[7] = v30;
            v58[0] = MEMORY[0x1E4F143A8];
            v58[1] = 3221225472;
            v58[2] = __33__CIRedEyeCorrection_outputImage__block_invoke_2;
            v58[3] = &unk_1E5772B40;
            int v63 = v52;
            v58[6] = v13;
            v58[7] = v15;
            *(double *)&v58[8] = v16;
            *(double *)&v58[9] = v17;
            int v59 = v57;
            int v60 = v55;
            unint64_t v61 = v56;
            unint64_t v62 = v54;
            v58[4] = v53;
            v58[5] = v51;
            v49 = objc_msgSend(v47, "imageWithExtent:processorDescription:argumentDigest:inputFormat:outputFormat:options:roiCallback:processor:", v48, v35, 266, 2056, 0, v64, v27, v28, v29, v30, v58);
            if (v6) {
              uint64_t v50 = [v49 imageByColorMatchingColorSpaceToWorkingSpace:v45];
            }
            else {
              uint64_t v50 = [v49 imageByApplyingFilter:@"CISRGBToneCurveToLinear" withInputParameters:MEMORY[0x1E4F1CC08]];
            }
            v31 = (void *)v50;
            CGColorSpaceRelease(v45);
            return v31;
          }
        }
LABEL_45:
        inputImage = self->inputImage;
        goto LABEL_46;
      }
      v73.origin.CGFloat x = x;
      v73.origin.CGFloat y = y;
      v73.size.CGFloat width = width;
      v73.size.CGFloat height = height;
      int v26 = -2147483647;
      if (CGRectIsInfinite(v73))
      {
        unint64_t v23 = 0xFFFFFFFFLL;
        int v25 = -2147483647;
        unint64_t v24 = 0xFFFFFFFFLL;
      }
      else
      {
        v74.origin.CGFloat x = x;
        v74.origin.CGFloat y = y;
        v74.size.CGFloat width = width;
        v74.size.CGFloat height = height;
        CGRect v75 = CGRectInset(v74, 0.000001, 0.000001);
        CGRect v76 = CGRectIntegral(v75);
        int v25 = (int)v76.origin.y;
        unint64_t v23 = (unint64_t)v76.size.width;
        unint64_t v24 = (unint64_t)v76.size.height;
        if ((int)v76.origin.x != -2147483647)
        {
          int v26 = (int)v76.origin.x;
          if ((int)v76.origin.x != 0x7FFFFFFF) {
            goto LABEL_30;
          }
          goto LABEL_14;
        }
      }
      if (v25 == -2147483647 && v23 == 0xFFFFFFFF && v24 == 0xFFFFFFFF)
      {
        double v27 = *MEMORY[0x1E4F1DB10];
        double v28 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
        double v29 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
        double v30 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
        unint64_t v23 = 0xFFFFFFFFLL;
        int v25 = -2147483647;
        unint64_t v24 = 0xFFFFFFFFLL;
        goto LABEL_31;
      }
      goto LABEL_30;
    }
    puts("red-eye repair dictionary is of unknown type");
    return 0;
  }
LABEL_46:
  v42 = inputImage;

  return v42;
}

double __33__CIRedEyeCorrection_outputImage__block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

void __33__CIRedEyeCorrection_outputImage__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a3 contextID];
  int v7 = ci_signpost_log_render();
  if ((unint64_t)((v6 << 32) - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v8 = v7;
    if (os_signpost_enabled(v7))
    {
      int v9 = *(_DWORD *)(a1 + 104);
      *(_DWORD *)buf = 67109120;
      int v96 = v9;
      _os_signpost_emit_with_name_impl(&dword_193671000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6 << 32, "CIRedEyeCorrection_processor", "version %d", buf, 8u);
    }
  }
  TimerBase::TimerBase((uint64_t)buf, v6, 0, (uint64_t)"CIRedEyeCorrection_processor", 33);
  if ((CI::format_is_ycc([a3 format]) & 1) == 0)
  {
    size_t AllocSize = IOSurfaceGetAllocSize((IOSurfaceRef)[a3 surface]);
    bzero((void *)[a3 baseAddress], AllocSize);
    double v12 = *(double *)(a1 + 48);
    double v11 = *(double *)(a1 + 56);
    double v14 = *(double *)(a1 + 64);
    double v13 = *(double *)(a1 + 72);
    int v15 = *(_DWORD *)(a1 + 80);
    int v89 = *(_DWORD *)(a1 + 84);
    vImagePixelCount v16 = *(void *)(a1 + 88);
    vImagePixelCount v17 = *(void *)(a1 + 96);
    v91 = *(void **)(a1 + 32);
    uint64_t v82 = *(void *)(a1 + 40);
    [a2 region];
    CGFloat x = v101.origin.x;
    CGFloat y = v101.origin.y;
    CGFloat width = v101.size.width;
    CGFloat height = v101.size.height;
    if (CGRectIsNull(v101))
    {
      LODWORD(v22) = 0;
      int v23 = 0x7FFFFFFF;
      int v24 = 0x7FFFFFFF;
    }
    else
    {
      v102.origin.CGFloat x = x;
      v102.origin.CGFloat y = y;
      v102.size.CGFloat width = width;
      v102.size.CGFloat height = height;
      if (!CGRectIsInfinite(v102))
      {
        v103.origin.CGFloat x = x;
        v103.origin.CGFloat y = y;
        v103.size.CGFloat width = width;
        v103.size.CGFloat height = height;
        CGRect v104 = CGRectInset(v103, 0.000001, 0.000001);
        CGRect v105 = CGRectIntegral(v104);
        int v85 = (int)v105.origin.x;
        int v23 = (int)v105.origin.y;
        unint64_t v22 = (unint64_t)v105.size.height;
LABEL_11:
        uint64_t v25 = [a2 format];
        uint64_t v26 = [a2 baseAddress];
        size_t v27 = [a2 bytesPerRow];
        int v92 = v15;
        [a3 region];
        CGFloat v28 = v106.origin.x;
        CGFloat v29 = v106.origin.y;
        CGFloat v30 = v106.size.width;
        CGFloat v31 = v106.size.height;
        if (CGRectIsNull(v106))
        {
          unint64_t v83 = 0;
          unint64_t v88 = 0;
          int v32 = 0x7FFFFFFF;
          int v84 = 0x7FFFFFFF;
        }
        else
        {
          v107.origin.CGFloat x = v28;
          v107.origin.CGFloat y = v29;
          v107.size.CGFloat width = v30;
          v107.size.CGFloat height = v31;
          if (!CGRectIsInfinite(v107))
          {
            v108.origin.CGFloat x = v28;
            v108.origin.CGFloat y = v29;
            v108.size.CGFloat width = v30;
            v108.size.CGFloat height = v31;
            CGRect v109 = CGRectInset(v108, 0.000001, 0.000001);
            CGRect v110 = CGRectIntegral(v109);
            int v86 = (int)v110.origin.x;
            int v84 = (int)v110.origin.y;
            unint64_t v88 = (unint64_t)v110.size.width;
            unint64_t v83 = (unint64_t)v110.size.height;
            goto LABEL_17;
          }
          int v84 = -2147483647;
          unint64_t v83 = 0xFFFFFFFFLL;
          unint64_t v88 = 0xFFFFFFFFLL;
          int v32 = -2147483647;
        }
        int v86 = v32;
LABEL_17:
        unsigned int v81 = [a3 format];
        uint64_t v80 = [a3 baseAddress];
        size_t v90 = [a3 bytesPerRow];
        uint64_t v33 = [v91 objectForKeyedSubscript:@"convexHull"];
        if (!v33 && ![v91 objectForKeyedSubscript:@"pointX"])
        {
          puts("red-eye repair dictionary is of unknown type");
          goto LABEL_94;
        }
        if (v25 == 2056)
        {
          size_t v34 = 4 * v16;
          uint64_t v79 = v15;
          src.data = (void *)(v26 + v27 * (v23 + (int)v22 - (uint64_t)(v89 + (int)v17)) + 8 * (v15 - (uint64_t)v85));
          src.CGFloat height = v17;
          src.CGFloat width = 4 * v16;
          src.rowBytes = v27;
          uint64_t v35 = v17 * 4 * v16;
          v87 = (void *)[MEMORY[0x1E4F1CA58] dataWithLength:v35];
          uint64_t v36 = (char *)[v87 mutableBytes];
          dest.data = v36;
          dest.CGFloat height = v17;
          dest.CGFloat width = 4 * v16;
          dest.rowBytes = 4 * v16;
          vImage_Error v37 = vImageConvert_Planar16FtoPlanar8(&src, &dest, 0);
          if (v37)
          {
            NSLog(&cfstr_VimageconvertP.isa, v37);
            goto LABEL_94;
          }
        }
        else
        {
          if (v25 != 266)
          {
            NSLog(&cfstr_UnknownInputPi.isa, v25);
            goto LABEL_94;
          }
          uint64_t v79 = v15;
          size_t v34 = 4 * v16;
          uint64_t v35 = v17 * 4 * v16;
          v87 = (void *)[MEMORY[0x1E4F1CA58] dataWithLength:v35];
          uint64_t v38 = [v87 mutableBytes];
          uint64_t v36 = (char *)v38;
          if (v16 && v17)
          {
            double v39 = (char *)(v26 + v27 * (v23 + (int)v22 - (uint64_t)(v89 + (int)v17)) + 4 * (v92 - (uint64_t)v85));
            vImagePixelCount v40 = v17;
            uint64_t v41 = (char *)v38;
            do
            {
              memcpy(v41, v39, 4 * v16);
              v39 += v27;
              v41 += v34;
              --v40;
            }
            while (v40);
          }
          if (!v33)
          {
            src.data = v36;
            src.CGFloat height = v17;
            src.CGFloat width = v16;
            src.rowBytes = 4 * v16;
            LODWORD(dest.data) = 50331906;
            vImagePermuteChannels_ARGB8888(&src, &src, (const uint8_t *)&dest, 0);
          }
        }
        v42 = (void *)[MEMORY[0x1E4F1CA58] dataWithLength:v35];
        uint64_t v43 = [v42 mutableBytes];
        if (v16 && v17)
        {
          uint64_t v44 = v43;
          uint64_t v45 = 0;
          vImagePixelCount v46 = v17;
          do
          {
            memcpy((void *)(v44 + v45), &v36[v45], 4 * v16);
            v45 += v34;
            --v46;
          }
          while (v46);
        }
        if (v33)
        {
          v97[0] = @"imageExtent";
          src.data = (void *)[NSNumber numberWithDouble:v12];
          src.CGFloat height = [NSNumber numberWithDouble:v11];
          src.CGFloat width = [NSNumber numberWithDouble:v14];
          src.rowBytes = [NSNumber numberWithDouble:v13];
          uint64_t v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:&src count:4];
          v97[1] = @"cameraModel";
          v98[0] = v47;
          v98[1] = v82;
          uint64_t v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v98 forKeys:v97 count:2];
          v49 = [CIRedEyeRepair3 alloc];
          if (v92 == -2147483647)
          {
            if (v89 == -2147483647 && v16 == 0xFFFFFFFF && v17 == 0xFFFFFFFF)
            {
              uint64_t v50 = (double *)MEMORY[0x1E4F1DB10];
              goto LABEL_50;
            }
          }
          else if (v92 == 0x7FFFFFFF && v89 == 0x7FFFFFFF && !(v17 | v16))
          {
            uint64_t v50 = (double *)MEMORY[0x1E4F1DB20];
LABEL_50:
            double v53 = *v50;
            double v54 = v50[1];
            double v55 = v50[2];
            double v56 = v50[3];
LABEL_52:
            int v57 = -[CIRedEyeRepair3 initWithExternalBuffer:subRectangle:rowBytes:options:](v49, "initWithExternalBuffer:subRectangle:rowBytes:options:", v36, v34, v48, v53, v54, v55, v56);
            goto LABEL_60;
          }
          double v53 = (double)v92;
          double v54 = (double)v89;
          double v55 = (double)v16;
          double v56 = (double)v17;
          goto LABEL_52;
        }
        v51 = [CIRedEyeRepair alloc];
        if (v92 == -2147483647)
        {
          if (v89 == -2147483647 && v16 == 0xFFFFFFFF && v17 == 0xFFFFFFFF)
          {
            int v52 = (double *)MEMORY[0x1E4F1DB10];
            goto LABEL_57;
          }
        }
        else if (v92 == 0x7FFFFFFF && v89 == 0x7FFFFFFF && !(v17 | v16))
        {
          int v52 = (double *)MEMORY[0x1E4F1DB20];
LABEL_57:
          double v58 = *v52;
          double v59 = v52[1];
          double v60 = v52[2];
          double v61 = v52[3];
LABEL_59:
          int v57 = -[CIRedEyeRepair initWithExternalBuffer:subRectangle:fullSize:rowBytes:cameraModel:](v51, "initWithExternalBuffer:subRectangle:fullSize:rowBytes:cameraModel:", v36, v34, v82, v58, v59, v60, v61, v14, v13);
LABEL_60:
          unint64_t v62 = v57;
          [(CIRedEyeRepair3 *)v57 executeRepair:v91];
          [(CIRedEyeRepair3 *)v62 repairExternalBuffer];

          uint64_t v63 = [v42 bytes];
          uint64_t v64 = [v87 mutableBytes];
          if (v17)
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (v16)
              {
                for (uint64_t j = 0; j != v16; ++j)
                {
                  if (*(_DWORD *)(v63 + 4 * j) == *(_DWORD *)(v64 + 4 * j)) {
                    *(_DWORD *)(v64 + 4 * j) = 0;
                  }
                }
              }
              v63 += v34;
              v64 += v34;
            }
          }
          int v67 = 0x7FFFFFFF;
          if (v92 == 0x7FFFFFFF && v89 == 0x7FFFFFFF && !(v17 | v16)
            || v86 == 0x7FFFFFFF && v84 == 0x7FFFFFFF && !v88 && !v83)
          {
            goto LABEL_75;
          }
          if (v92 == -2147483647 && v89 == -2147483647 && v16 == 0xFFFFFFFF && v17 == 0xFFFFFFFF)
          {
            vImagePixelCount v68 = v83;
            int v67 = v84;
            int v69 = v86;
          }
          else if (v86 == -2147483647 && v84 == -2147483647 && v88 == 0xFFFFFFFF && v83 == 0xFFFFFFFF)
          {
            vImagePixelCount v68 = v17;
            unint64_t v88 = v16;
            int v67 = v89;
            int v69 = v92;
          }
          else
          {
            if (v92 <= v86) {
              int v69 = v86;
            }
            else {
              int v69 = v92;
            }
            int v74 = v92 + v16;
            if (v92 + (int)v16 >= v86 + (int)v88) {
              int v74 = v86 + v88;
            }
            BOOL v75 = __OFSUB__(v74, v69);
            int v76 = v74 - v69;
            if (v76 < 0 != v75)
            {
LABEL_75:
              vImagePixelCount v68 = 0;
              unint64_t v88 = 0;
LABEL_76:
              int v69 = 0x7FFFFFFF;
              goto LABEL_77;
            }
            if (v89 <= v84) {
              int v67 = v84;
            }
            else {
              int v67 = v89;
            }
            int v77 = v89 + v17;
            if (v89 + (int)v17 >= v84 + (int)v83) {
              int v77 = v84 + v83;
            }
            BOOL v75 = __OFSUB__(v77, v67);
            int v78 = v77 - v67;
            if (v78 < 0 != v75)
            {
              vImagePixelCount v68 = 0;
              unint64_t v88 = 0;
              int v67 = 0x7FFFFFFF;
              goto LABEL_76;
            }
            unint64_t v88 = v76;
            vImagePixelCount v68 = v78;
          }
LABEL_77:
          if (v81 == 2056)
          {
            dest.CGFloat height = v68;
            dest.CGFloat width = 4 * v88;
            dest.data = (void *)([v87 mutableBytes]
                               + (v89 + (int)v17 - (uint64_t)(v67 + (int)v68)) * v34
                               + 4 * (v69 - v79));
            dest.rowBytes = v34;
            v93.data = (void *)(v80 + (v84 + (int)v83 - (uint64_t)(v67 + (int)v68)) * v90 + 8 * (v69 - (uint64_t)v86));
            v93.CGFloat height = v68;
            v93.CGFloat width = 4 * v88;
            v93.rowBytes = v90;
            vImage_Error v70 = vImageConvert_Planar8toPlanar16F(&dest, &v93, 0);
            if (v70) {
              NSLog(&cfstr_VimageconvertP_0.isa, v70);
            }
          }
          else if (v81 == 266)
          {
            if (!v33)
            {
              dest.data = v36;
              dest.CGFloat height = v17;
              dest.CGFloat width = v16;
              dest.rowBytes = v34;
              LODWORD(v93.data) = 50331906;
              vImagePermuteChannels_ARGB8888(&dest, &dest, (const uint8_t *)&v93, 0);
            }
            if (v68 && v88)
            {
              int v71 = v67 + v68;
              CGRect v72 = (char *)(v80 + (v84 + (int)v83 - (uint64_t)(v67 + (int)v68)) * v90 + 4 * (v69 - (uint64_t)v86));
              CGRect v73 = &v36[4 * (v69 - v79) + (v89 + (int)v17 - (uint64_t)v71) * v34];
              do
              {
                memcpy(v72, v73, 4 * v88);
                v73 += v34;
                v72 += v90;
                --v68;
              }
              while (v68);
            }
          }
          else
          {
            NSLog(&cfstr_UnknownOutputP.isa, v81);
          }
          goto LABEL_94;
        }
        double v58 = (double)v92;
        double v59 = (double)v89;
        double v60 = (double)v16;
        double v61 = (double)v17;
        goto LABEL_59;
      }
      int v23 = -2147483647;
      LODWORD(v22) = -1;
      int v24 = -2147483647;
    }
    int v85 = v24;
    goto LABEL_11;
  }
LABEL_94:
  _ZZZ33__CIRedEyeCorrection_outputImage_EUb_EN13SignpostTimerD1Ev((TimerBase *)buf);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (NSString)inputCameraModel
{
  return self->inputCameraModel;
}

- (void)setInputCameraModel:(id)a3
{
}

- (NSDictionary)inputCorrectionInfo
{
  return self->inputCorrectionInfo;
}

- (void)setInputCorrectionInfo:(id)a3
{
}

@end