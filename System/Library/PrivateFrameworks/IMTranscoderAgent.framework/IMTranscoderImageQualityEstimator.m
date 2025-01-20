@interface IMTranscoderImageQualityEstimator
+ (MLModel)imageQualityEstimatorModel;
+ (double)_entropyForTranscodedImage:(CGImageSource *)a3;
+ (double)getEntropyForImage:(CGImage *)a3;
+ (double)predictQualityFactor:(id)a3 suggestedMaxLength:(int)a4;
+ (id)getInputImageFeatures:(CGImageSource *)a3;
+ (id)oneHotEncodeTargetMaxDimFeature:(id)a3 suggestedMaxLength:(int)a4;
+ (id)standardizeModelInputFeatures:(id)a3;
+ (void)setImageQualityEstimatorModel:(id)a3;
@end

@implementation IMTranscoderImageQualityEstimator

+ (MLModel)imageQualityEstimatorModel
{
  v6 = (void *)qword_2683E9588;
  if (!qword_2683E9588)
  {
    objc_msgSend_setImageQualityEstimatorModel_(IMTranscoderImageQualityEstimator, a2, 0, v2, v3, v4, v5);
    v6 = (void *)qword_2683E9588;
  }
  return (MLModel *)v6;
}

+ (void)setImageQualityEstimatorModel:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x263F086E0];
  uint64_t v5 = objc_opt_class();
  v11 = objc_msgSend_bundleForClass_(v4, v6, v5, v7, v8, v9, v10);
  v18 = objc_msgSend_bundlePath(v11, v12, v13, v14, v15, v16, v17);

  v24 = objc_msgSend_stringWithFormat_(NSString, v19, @"%@/%@", v20, v21, v22, v23, v18, @"Image_Estimator_HEIF.mlmodelc");
  v30 = objc_msgSend_fileURLWithPath_(NSURL, v25, (uint64_t)v24, v26, v27, v28, v29);
  id v38 = 0;
  v35 = objc_msgSend_modelWithContentsOfURL_error_(MEMORY[0x263F00D80], v31, (uint64_t)v30, (uint64_t)&v38, v32, v33, v34);
  id v36 = v38;
  if (v36)
  {
    if (IMOSLoggingEnabled())
    {
      v37 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v40 = v36;
        _os_log_impl(&dword_22B280000, v37, OS_LOG_TYPE_INFO, "Error happened when creating a compiled model instance: %@", buf, 0xCu);
      }
LABEL_11:
    }
  }
  else if (v35)
  {
    objc_storeStrong((id *)&qword_2683E9588, v35);
  }
  else if (IMOSLoggingEnabled())
  {
    v37 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v40 = v24;
      _os_log_impl(&dword_22B280000, v37, OS_LOG_TYPE_INFO, "Failed to initialize model instance using model path %@", buf, 0xCu);
    }
    goto LABEL_11;
  }
}

+ (id)standardizeModelInputFeatures:(id)a3
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_msgSend_allKeys(v3, v4, v5, v6, v7, v8, v9);
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v85, (uint64_t)v89, 16, v12, v13);
  if (v19)
  {
    uint64_t v20 = *(void *)v86;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v86 != v20) {
          objc_enumerationMutation(v10);
        }
        uint64_t v22 = *(void **)(*((void *)&v85 + 1) + 8 * v21);
        if ((objc_msgSend_isEqual_(v22, v14, @"Input Quality Factor", v15, v16, v17, v18) & 1) != 0
          || objc_msgSend_isEqual_(v22, v23, @"Input Qf Square", v24, v25, v26, v27))
        {
          if (!IMOSLoggingEnabled()) {
            goto LABEL_12;
          }
          uint64_t v33 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v84 = 0;
            _os_log_impl(&dword_22B280000, v33, OS_LOG_TYPE_INFO, "These keys are not supported for HEIC model, therefore dont standardize.", v84, 2u);
          }
          goto LABEL_11;
        }
        uint64_t v34 = objc_msgSend_objectForKey_(&unk_26DE89818, v28, (uint64_t)v22, v29, v30, v31, v32);
        objc_msgSend_doubleValue(v34, v35, v36, v37, v38, v39, v40);
        double v42 = v41;

        v48 = objc_msgSend_objectForKey_(&unk_26DE89840, v43, (uint64_t)v22, v44, v45, v46, v47);
        objc_msgSend_doubleValue(v48, v49, v50, v51, v52, v53, v54);
        double v56 = v55;

        v62 = objc_msgSend_objectForKey_(v3, v57, (uint64_t)v22, v58, v59, v60, v61);
        objc_msgSend_doubleValue(v62, v63, v64, v65, v66, v67, v68);
        double v70 = v69;

        if (v56 == 0.0)
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v33 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v84 = 0;
              _os_log_impl(&dword_22B280000, v33, OS_LOG_TYPE_INFO, "Do not standardize for this key.", v84, 2u);
            }
LABEL_11:
          }
        }
        else
        {
          v77 = objc_msgSend_numberWithDouble_(NSNumber, v71, v72, v73, v74, v75, v76, (v70 - v42) / v56);
          objc_msgSend_setObject_forKey_(v3, v78, (uint64_t)v77, (uint64_t)v22, v79, v80, v81);
        }
LABEL_12:
        ++v21;
      }
      while (v19 != v21);
      uint64_t v82 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v14, (uint64_t)&v85, (uint64_t)v89, 16, v17, v18);
      uint64_t v19 = v82;
    }
    while (v82);
  }

  return v3;
}

+ (id)oneHotEncodeTargetMaxDimFeature:(id)a3 suggestedMaxLength:(int)a4
{
  id v10 = a3;
  if (a4 <= 1599)
  {
    switch(a4)
    {
      case 800:
        v11 = objc_msgSend_numberWithInt_(NSNumber, v5, 1, v6, v7, v8, v9);
        objc_msgSend_setObject_forKey_(v10, v28, (uint64_t)v11, @"Target Max Dimension_800", v29, v30, v31);
        break;
      case 1024:
        v11 = objc_msgSend_numberWithInt_(NSNumber, v5, 1, v6, v7, v8, v9);
        objc_msgSend_setObject_forKey_(v10, v36, (uint64_t)v11, @"Target Max Dimension_1024", v37, v38, v39);
        break;
      case 1280:
        v11 = objc_msgSend_numberWithInt_(NSNumber, v5, 1, v6, v7, v8, v9);
        objc_msgSend_setObject_forKey_(v10, v16, (uint64_t)v11, @"Target Max Dimension_1280", v17, v18, v19);
        break;
      default:
        goto LABEL_18;
    }
  }
  else if (a4 > 2999)
  {
    if (a4 == 3000)
    {
      v11 = objc_msgSend_numberWithInt_(NSNumber, v5, 1, v6, v7, v8, v9);
      objc_msgSend_setObject_forKey_(v10, v32, (uint64_t)v11, @"Target Max Dimension_3000", v33, v34, v35);
    }
    else
    {
      if (a4 != 4032) {
        goto LABEL_18;
      }
      v11 = objc_msgSend_numberWithInt_(NSNumber, v5, 1, v6, v7, v8, v9);
      objc_msgSend_setObject_forKey_(v10, v20, (uint64_t)v11, @"Target Max Dimension_4032", v21, v22, v23);
    }
  }
  else if (a4 == 1600)
  {
    v11 = objc_msgSend_numberWithInt_(NSNumber, v5, 1, v6, v7, v8, v9);
    objc_msgSend_setObject_forKey_(v10, v24, (uint64_t)v11, @"Target Max Dimension_1600", v25, v26, v27);
  }
  else
  {
    if (a4 != 2048) {
      goto LABEL_18;
    }
    v11 = objc_msgSend_numberWithInt_(NSNumber, v5, 1, v6, v7, v8, v9);
    objc_msgSend_setObject_forKey_(v10, v12, (uint64_t)v11, @"Target Max Dimension_2048", v13, v14, v15);
  }

LABEL_18:
  return v10;
}

+ (double)getEntropyForImage:(CGImage *)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  memset(&src, 0, sizeof(src));
  int v29 = 0;
  LOBYTE(v23) = CGImageGetBitsPerComponent(a3);
  int v23 = v23;
  LOBYTE(v24) = CGImageGetBitsPerPixel(a3);
  int v24 = v24;
  ColorSpace = CGImageGetColorSpace(a3);
  CGColorSpaceRef v25 = CGColorSpaceRetain(ColorSpace);
  CGBitmapInfo BitmapInfo = CGImageGetBitmapInfo(a3);
  uint64_t v28 = 0;
  uint64_t v27 = 0;
  if (MEMORY[0x230F44510](&src, &v23, 0, a3, 0))
  {
    free(src.data);
    double v5 = -1.0;
    if (IMOSLoggingEnabled())
    {
      uint64_t v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22B280000, v6, OS_LOG_TYPE_INFO, "Error: Failed to create vImageBuffer using CGImageRef", buf, 2u);
      }
    }
  }
  else
  {
    uint64_t v7 = malloc_type_malloc(0x800uLL, 0xCF2D719FuLL);
    uint64_t v8 = malloc_type_malloc(0x800uLL, 0x619059E8uLL);
    uint64_t v9 = malloc_type_malloc(0x800uLL, 0x40D07244uLL);
    id v10 = malloc_type_malloc(0x800uLL, 0x207D27EAuLL);
    *(void *)buf = v7;
    uint64_t v32 = v8;
    uint64_t v33 = v9;
    uint64_t v34 = v10;
    vImage_Error v11 = vImageHistogramCalculation_ARGB8888(&src, (vImagePixelCount **)buf, 0);
    if (v11)
    {
      NSLog(&cfstr_ErrorCalculati.isa, v11);
      free(src.data);
      free(v7);
      free(v8);
      free(v9);
      free(v10);
      return -1.0;
    }
    else
    {
      uint64_t v12 = (double *)malloc_type_malloc(0x800uLL, 0x100004000313F17uLL);
      vDSP_vaddD((const double *)v7, 1, (const double *)v8, 1, v12, 1, 0x100uLL);
      vDSP_vaddD(v12, 1, (const double *)v9, 1, v12, 1, 0x100uLL);
      double __C = 0.0;
      double __B = (double)(3 * src.height * src.width);
      uint64_t v13 = (double *)malloc_type_malloc(0x800uLL, 0x100004000313F17uLL);
      uint64_t v14 = (double *)malloc_type_malloc(0x800uLL, 0x100004000313F17uLL);
      uint64_t v15 = (const double *)malloc_type_malloc(0x800uLL, 0x100004000313F17uLL);
      uint64_t v16 = (double *)v15;
      for (uint64_t i = 0; i != 256; i += 2)
        *(float64x2_t *)&v15[i] = vcvtq_f64_u64(*(uint64x2_t *)&v12[i]);
      vDSP_vsdivD(v15, 1, &__B, v13, 1, 0x100uLL);
      for (uint64_t j = 0; j != 256; ++j)
      {
        long double v19 = v13[j];
        if (v19 != 0.0) {
          v14[j] = log2(v19);
        }
      }
      vDSP_vnegD(v13, 1, v13, 1, 0x100uLL);
      vDSP_vmulD(v13, 1, v14, 1, v14, 1, 0x100uLL);
      vDSP_sveD(v14, 1, &__C, 0x100uLL);
      free(v14);
      free(v13);
      free(v7);
      free(v8);
      free(v9);
      free(v10);
      free(v12);
      free(v16);
      free(src.data);
      return __C;
    }
  }
  return v5;
}

+ (double)_entropyForTranscodedImage:(CGImageSource *)a3
{
  double v5 = (void *)MEMORY[0x230F44180](a1, a2);
  uint64_t v6 = NSDictionary;
  uint64_t v7 = *MEMORY[0x263EFFB40];
  uint64_t v8 = *MEMORY[0x263F0F5F8];
  uint64_t v9 = *MEMORY[0x263F0F5B8];
  uint64_t v10 = *MEMORY[0x263F0F5A8];
  uint64_t v16 = objc_msgSend_numberWithInt_(NSNumber, v11, 1024, v12, v13, v14, v15);
  objc_msgSend_dictionaryWithObjectsAndKeys_(v6, v17, v7, v18, v19, v20, v21, v8, v7, v9, v7, v10, v16, *MEMORY[0x263F0F638], 0);
  CFDictionaryRef v22 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(a3, 0, v22);
  int v24 = (__CFData *)objc_alloc_init(MEMORY[0x263EFF990]);
  if (v24)
  {
    CFDataRef v25 = v24;
    uint64_t v26 = CGImageDestinationCreateWithData(v24, @"public.heic", 1uLL, 0);
    CFDictionaryRef v27 = CGImageSourceCopyPropertiesAtIndex(a3, 0, 0);
    id v28 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v34 = objc_msgSend_numberWithBool_(NSNumber, v29, 1, v30, v31, v32, v33);
    objc_msgSend_setObject_forKey_(v28, v35, (uint64_t)v34, *MEMORY[0x263F0F008], v36, v37, v38);

    v78 = v5;
    uint64_t v39 = *MEMORY[0x263F0F4C8];
    uint64_t v45 = objc_msgSend_objectForKey_(v27, v40, *MEMORY[0x263F0F4C8], v41, v42, v43, v44);
    objc_msgSend_setValue_forKey_(v28, v46, (uint64_t)v45, v39, v47, v48, v49);
    objc_msgSend_addEntriesFromDictionary_(v28, v50, (uint64_t)v27, v51, v52, v53, v54);
    LODWORD(v55) = 0.75;
    v62 = objc_msgSend_numberWithFloat_(NSNumber, v56, v57, v58, v59, v60, v61, v55);
    objc_msgSend_setObject_forKey_(v28, v63, (uint64_t)v62, *MEMORY[0x263F0EFE8], v64, v65, v66);

    CGImageDestinationAddImage(v26, ThumbnailAtIndex, (CFDictionaryRef)v28);
    CGImageDestinationFinalize(v26);
    uint64_t v67 = CGImageSourceCreateWithData(v25, 0);
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v67, 0, 0);
    objc_msgSend_getEntropyForImage_(a1, v69, (uint64_t)ImageAtIndex, v70, v71, v72, v73);
    double v75 = v74;
    CGImageRelease(ThumbnailAtIndex);
    CGImageRelease(ImageAtIndex);
    CFRelease(v26);
    uint64_t v76 = v67;
    double v5 = v78;
    CFRelease(v76);
  }
  else
  {
    CGImageRelease(ThumbnailAtIndex);
    double v75 = -1.0;
  }

  return v75;
}

+ (id)getInputImageFeatures:(CGImageSource *)a3
{
  uint64_t v224 = *MEMORY[0x263EF8340];
  if (!a3)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v73 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
      {
        LOWORD(v222) = 0;
        _os_log_impl(&dword_22B280000, v73, OS_LOG_TYPE_INFO, "Error: Image source is NULL.", (uint8_t *)&v222, 2u);
      }
      goto LABEL_15;
    }
LABEL_16:
    id v74 = 0;
    goto LABEL_30;
  }
  CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(a3, 0, 0);
  if (!ImageAtIndex)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v73 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
      {
        LOWORD(v222) = 0;
        _os_log_impl(&dword_22B280000, v73, OS_LOG_TYPE_INFO, "Error: CGImage reference could not be created for the image source.", (uint8_t *)&v222, 2u);
      }
LABEL_15:

      goto LABEL_16;
    }
    goto LABEL_16;
  }
  uint64_t v6 = ImageAtIndex;
  CFDictionaryRef v7 = CGImageSourceCopyPropertiesAtIndex(a3, 0, 0);
  CFDictionaryRef v8 = CGImageSourceCopyProperties(a3, 0);
  CFDictionaryRef v9 = CGImageSourceCopyProperties(a3, 0);
  uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v9, v10, @"FileSize", v11, v12, v13, v14);
  CFDictionaryRef v22 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v16, v17, v18, v19, v20, v21);
  id v28 = objc_msgSend_objectForKeyedSubscript_(v7, v23, @"PixelWidth", v24, v25, v26, v27);
  objc_msgSend_doubleValue(v28, v29, v30, v31, v32, v33, v34);
  double v36 = v35;

  uint64_t v42 = objc_msgSend_objectForKeyedSubscript_(v7, v37, @"PixelHeight", v38, v39, v40, v41);
  objc_msgSend_doubleValue(v42, v43, v44, v45, v46, v47, v48);
  double v50 = v49;

  double v56 = objc_msgSend_objectForKeyedSubscript_(v8, v51, @"FileSize", v52, v53, v54, v55);
  objc_msgSend_doubleValue(v56, v57, v58, v59, v60, v61, v62);
  double v64 = v63;

  double v70 = CACurrentMediaTime();
  if (v36 >= v50) {
    double v71 = v36;
  }
  else {
    double v71 = v50;
  }
  if (v71 >= 1024.0) {
    objc_msgSend__entropyForTranscodedImage_(a1, v65, (uint64_t)a3, v66, v67, v68, v69);
  }
  else {
    objc_msgSend_getEntropyForImage_(a1, v65, (uint64_t)v6, v66, v67, v68, v69);
  }
  long double v75 = v72;
  CGImageRelease(v6);
  double v76 = CACurrentMediaTime();
  if (IMOSLoggingEnabled())
  {
    v77 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
    {
      int v222 = 134217984;
      double v223 = v76 - v70;
      _os_log_impl(&dword_22B280000, v77, OS_LOG_TYPE_INFO, "Time taken for computing input Entropy: %lf", (uint8_t *)&v222, 0xCu);
    }
  }
  if (v75 >= 0.0)
  {
    double v79 = exp(v75);
    uint64_t v80 = NSNumber;
    objc_msgSend_doubleValue(v15, v81, v82, v83, v84, v85, v86);
    v93 = objc_msgSend_numberWithDouble_(v80, v87, v88, v89, v90, v91, v92);
    objc_msgSend_setObject_forKey_(v22, v94, (uint64_t)v93, @"Input File Size", v95, v96, v97);

    v104 = objc_msgSend_numberWithDouble_(NSNumber, v98, v99, v100, v101, v102, v103, v50);
    objc_msgSend_setObject_forKey_(v22, v105, (uint64_t)v104, @"Input Height", v106, v107, v108);

    v115 = objc_msgSend_numberWithDouble_(NSNumber, v109, v110, v111, v112, v113, v114, (double)v75);
    objc_msgSend_setObject_forKey_(v22, v116, (uint64_t)v115, @"Input Entropy", v117, v118, v119);

    v126 = objc_msgSend_numberWithDouble_(NSNumber, v120, v121, v122, v123, v124, v125, v79);
    objc_msgSend_setObject_forKey_(v22, v127, (uint64_t)v126, @"Exponential Entropy", v128, v129, v130);

    v137 = objc_msgSend_numberWithDouble_(NSNumber, v131, v132, v133, v134, v135, v136, v36 / v50);
    objc_msgSend_setObject_forKey_(v22, v138, (uint64_t)v137, @"Aspect Ratio", v139, v140, v141);

    objc_msgSend_setObject_forKey_(v22, v142, (uint64_t)&unk_26DE895F8, @"Target Width", v143, v144, v145);
    objc_msgSend_setObject_forKey_(v22, v146, (uint64_t)&unk_26DE895F8, @"Target Height", v147, v148, v149);
    objc_msgSend_setObject_forKey_(v22, v150, (uint64_t)&unk_26DE897D8, @"Target File Size", v151, v152, v153);
    objc_msgSend_setObject_forKey_(v22, v154, (uint64_t)&unk_26DE895F8, @"Target Max Dimension_4032", v155, v156, v157);
    objc_msgSend_setObject_forKey_(v22, v158, (uint64_t)&unk_26DE895F8, @"Target Max Dimension_3000", v159, v160, v161);
    objc_msgSend_setObject_forKey_(v22, v162, (uint64_t)&unk_26DE895F8, @"Target Max Dimension_2048", v163, v164, v165);
    objc_msgSend_setObject_forKey_(v22, v166, (uint64_t)&unk_26DE895F8, @"Target Max Dimension_1600", v167, v168, v169);
    objc_msgSend_setObject_forKey_(v22, v170, (uint64_t)&unk_26DE895F8, @"Target Max Dimension_1280", v171, v172, v173);
    objc_msgSend_setObject_forKey_(v22, v174, (uint64_t)&unk_26DE895F8, @"Target Max Dimension_1024", v175, v176, v177);
    objc_msgSend_setObject_forKey_(v22, v178, (uint64_t)&unk_26DE895F8, @"Target Max Dimension_800", v179, v180, v181);
    v188 = objc_msgSend_numberWithDouble_(NSNumber, v182, v183, v184, v185, v186, v187, v64 / 358400.0);
    objc_msgSend_setObject_forKey_(v22, v189, (uint64_t)v188, @"Compression Ratio", v190, v191, v192);

    long double v193 = v36 * v50;
    v199 = objc_msgSend_numberWithInt_(NSNumber, v194, (int)v193, v195, v196, v197, v198);
    objc_msgSend_setObject_forKey_(v22, v200, (uint64_t)v199, @"Input H x W (NumOfPixels)", v201, v202, v203);

    v204 = NSNumber;
    long double v205 = log(v193);
    v212 = objc_msgSend_numberWithDouble_(v204, v206, v207, v208, v209, v210, v211, (double)v205);
    objc_msgSend_setObject_forKey_(v22, v213, (uint64_t)v212, @"Input log(NumOfPixels)", v214, v215, v216);

    objc_msgSend_setObject_forKey_(v22, v217, (uint64_t)&unk_26DE895F8, @"Ratio of NumOfPixels", v218, v219, v220);
    id v74 = v22;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v78 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
      {
        LOWORD(v222) = 0;
        _os_log_impl(&dword_22B280000, v78, OS_LOG_TYPE_INFO, "Error: Failed to compute entropy of the input image", (uint8_t *)&v222, 2u);
      }
    }
    id v74 = 0;
  }

LABEL_30:
  return v74;
}

+ (double)predictQualityFactor:(id)a3 suggestedMaxLength:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v186 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v13 = objc_msgSend_date(MEMORY[0x263EFF910], v7, v8, v9, v10, v11, v12);
  uint64_t v20 = objc_msgSend_imageQualityEstimatorModel(IMTranscoderImageQualityEstimator, v14, v15, v16, v17, v18, v19);

  if (v20)
  {
    if (v6)
    {
      uint64_t v26 = objc_msgSend_objectForKeyedSubscript_(v6, v21, @"Aspect Ratio", v22, v23, v24, v25);
      objc_msgSend_doubleValue(v26, v27, v28, v29, v30, v31, v32);
      double v34 = v33;

      uint64_t v46 = objc_msgSend_mutableCopy(v6, v35, v36, v37, v38, v39, v40);
      double v47 = (double)(int)v4;
      if (v34 >= 1.0) {
        uint64_t v48 = v4;
      }
      else {
        uint64_t v48 = (int)(v34 * (double)(int)v4);
      }
      if (v34 >= 1.0) {
        uint64_t v49 = (int)((double)(int)v4 / v34);
      }
      else {
        uint64_t v49 = v4;
      }
      if (v34 >= 1.0) {
        int v50 = (int)((double)(int)v4 / v34);
      }
      else {
        int v50 = (int)(v34 * (double)(int)v4);
      }
      uint64_t v51 = objc_msgSend_numberWithInt_(NSNumber, v41, v48, v42, v43, v44, v45);
      objc_msgSend_setObject_forKey_(v46, v52, (uint64_t)v51, @"Target Width", v53, v54, v55);

      uint64_t v61 = objc_msgSend_numberWithInt_(NSNumber, v56, v49, v57, v58, v59, v60);
      objc_msgSend_setObject_forKey_(v46, v62, (uint64_t)v61, @"Target Height", v63, v64, v65);

      double v71 = objc_msgSend_valueForKey_(v46, v66, @"Input H x W (NumOfPixels)", v67, v68, v69, v70);
      objc_msgSend_doubleValue(v71, v72, v73, v74, v75, v76, v77);
      double v79 = v78 / (double)(v50 * (int)v4);

      uint64_t v86 = objc_msgSend_numberWithDouble_(NSNumber, v80, v81, v82, v83, v84, v85, v79);
      objc_msgSend_setObject_forKey_(v46, v87, (uint64_t)v86, @"Ratio of NumOfPixels", v88, v89, v90);

      uint64_t v95 = objc_msgSend_oneHotEncodeTargetMaxDimFeature_suggestedMaxLength_(a1, v91, (uint64_t)v46, v4, v92, v93, v94);

      uint64_t v102 = objc_msgSend_numberWithDouble_(NSNumber, v96, v97, v98, v99, v100, v101, v34);
      objc_msgSend_setObject_forKey_(v95, v103, (uint64_t)v102, @"Aspect Ratio", v104, v105, v106);

      uint64_t v112 = objc_msgSend_standardizeModelInputFeatures_(a1, v107, (uint64_t)v95, v108, v109, v110, v111);

      id v113 = objc_alloc(MEMORY[0x263F00D38]);
      uint64_t v118 = objc_msgSend_initWithDictionary_error_(v113, v114, (uint64_t)v112, 0, v115, v116, v117);
      if (IMOSLoggingEnabled())
      {
        uint64_t v125 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v125, OS_LOG_TYPE_INFO))
        {
          objc_msgSend_dictionary(v118, v126, v127, v128, v129, v130, v131);
          double v132 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          int v180 = 138412290;
          double v181 = v132;
          _os_log_impl(&dword_22B280000, v125, OS_LOG_TYPE_INFO, "Features set for image quality estimator model prediction: %@", (uint8_t *)&v180, 0xCu);
        }
      }
      uint64_t v133 = objc_msgSend_imageQualityEstimatorModel(IMTranscoderImageQualityEstimator, v119, v120, v121, v122, v123, v124);
      v138 = objc_msgSend_predictionFromFeatures_error_(v133, v134, (uint64_t)v118, 0, v135, v136, v137);

      if (!v138)
      {
        double v160 = -1.0;
        if (IMOSLoggingEnabled())
        {
          v170 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v170, OS_LOG_TYPE_INFO))
          {
            LOWORD(v180) = 0;
            _os_log_impl(&dword_22B280000, v170, OS_LOG_TYPE_INFO, "Failed to initialize features set using image quality estimator model instance", (uint8_t *)&v180, 2u);
          }
          goto LABEL_41;
        }
LABEL_42:

        goto LABEL_43;
      }
      uint64_t v145 = objc_msgSend_dictionary(v138, v139, v140, v141, v142, v143, v144);
      uint64_t v151 = objc_msgSend_valueForKey_(v145, v146, @"Target Quality Factor", v147, v148, v149, v150);
      objc_msgSend_doubleValue(v151, v152, v153, v154, v155, v156, v157);
      double v159 = v158;

      double v160 = ceil(v159) / 100.0;
      int v161 = IMOSLoggingEnabled();
      if (v160 >= 0.45)
      {
        if (!v161) {
          goto LABEL_38;
        }
        uint64_t v168 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v168, OS_LOG_TYPE_INFO))
        {
          int v180 = 134217984;
          double v181 = v160;
          _os_log_impl(&dword_22B280000, v168, OS_LOG_TYPE_INFO, "Quality factor is within the pivot limit %lf , Transcoding", (uint8_t *)&v180, 0xCu);
        }
      }
      else
      {
        if (!v161) {
          goto LABEL_38;
        }
        uint64_t v168 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v168, OS_LOG_TYPE_INFO))
        {
          int v180 = 134218496;
          double v181 = v47;
          __int16 v182 = 2048;
          double v183 = v160;
          __int16 v184 = 2048;
          uint64_t v185 = 0x3FDCCCCCCCCCCCCDLL;
          _os_log_impl(&dword_22B280000, v168, OS_LOG_TYPE_INFO, "For dimension %f, Quality Factor: %lf is less than Pivot value of %lf", (uint8_t *)&v180, 0x20u);
        }
      }

LABEL_38:
      uint64_t v171 = objc_msgSend_date(MEMORY[0x263EFF910], v162, v163, v164, v165, v166, v167);
      objc_msgSend_timeIntervalSinceDate_(v171, v172, (uint64_t)v13, v173, v174, v175, v176);
      double v178 = v177;

      if (IMOSLoggingEnabled())
      {
        v170 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v170, OS_LOG_TYPE_INFO))
        {
          int v180 = 134217984;
          double v181 = v178;
          _os_log_impl(&dword_22B280000, v170, OS_LOG_TYPE_INFO, "time for predicting quality factor: %lf", (uint8_t *)&v180, 0xCu);
        }
LABEL_41:

        goto LABEL_42;
      }
      goto LABEL_42;
    }
    double v160 = -1.0;
    if (IMOSLoggingEnabled())
    {
      uint64_t v169 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v169, OS_LOG_TYPE_INFO))
      {
        LOWORD(v180) = 0;
        _os_log_impl(&dword_22B280000, v169, OS_LOG_TYPE_INFO, "Error: Input feature dictionary is nil.", (uint8_t *)&v180, 2u);
      }
LABEL_25:
    }
  }
  else
  {
    double v160 = -1.0;
    if (IMOSLoggingEnabled())
    {
      uint64_t v169 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v169, OS_LOG_TYPE_INFO))
      {
        int v180 = 67109120;
        LODWORD(v181) = v4;
        _os_log_impl(&dword_22B280000, v169, OS_LOG_TYPE_INFO, "Error: Model is not initialized for dimension %d", (uint8_t *)&v180, 8u);
      }
      goto LABEL_25;
    }
  }
LABEL_43:

  return v160;
}

@end