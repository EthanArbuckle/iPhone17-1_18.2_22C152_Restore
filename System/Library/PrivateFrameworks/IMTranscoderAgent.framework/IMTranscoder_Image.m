@interface IMTranscoder_Image
+ (BOOL)_canConvertPNGToJPEG:(CGImage *)a3;
+ (BOOL)_imageContainsTranslucentPixels:(CGImage *)a3;
+ (id)findOrientationFromProperties:(id)a3;
+ (id)supportedUTIs;
+ (unint64_t)findLargerDimensionFromImage:(CGImageSource *)a3 withProperties:(id)a4 toWidth:(id *)a5 toHeight:(id *)a6;
- (BOOL)_isHEIFImageFormat:(__CFString *)a3;
- (BOOL)_isWebPImageFormat:(__CFString *)a3;
- (BOOL)_isWideGamutImage:(CGImageSource *)a3;
- (double)overrideJPEGCompressionQuality;
- (id)_checkAndSaveImageData:(id)a3 sourceURL:(id)a4 inFormat:(__CFString *)a5 withMaxByteSize:(unint64_t)a6 actualSize:(unint64_t *)a7 usedLengthIndex:(int *)a8 currentIndex:(int)a9;
- (id)_getScaleFactorArray:(id)a3 transferURL:(id)a4 outputURLs:(id)a5;
- (id)_imMetricsCollectorForLQMQualityEstimatorModel:(__CFString *)a3 suggestedMaxLength:(unint64_t)a4 shouldUseQualityEstimatorModel:(BOOL)a5 inputImageFeatures:(id)a6;
- (id)_newGeneratedImage:(CGImageSource *)a3 sourceWidth:(id)a4 sourceHeight:(id)a5 sourceLength:(unint64_t)a6 sourceProps:(id)a7 target:(int64_t)a8 hardwareEncoder:(id)a9 inFormat:(__CFString *)a10 fromFormat:(__CFString *)a11 withMaxLength:(unint64_t)a12 withMaxCount:(unint64_t)a13 withCompressionQuality:(double)a14 enforceMaxes:(BOOL)a15 subsampling:(int)a16 shouldSkipAuxillaryData:(BOOL)a17;
- (id)_wideGamutImage:(CGImageSource *)a3 sourceURL:(id)a4 inFormat:(__CFString *)a5 withMaxByteSize:(unint64_t)a6 maxDimension:(unint64_t)a7 actualSize:(unint64_t *)a8 telemetry:(id)a9;
- (id)_writeHEIFImage:(CGImageSource *)a3 sourceURL:(id)a4 inFormat:(__CFString *)a5 withMaxByteSize:(unint64_t)a6 maxDimension:(unint64_t)a7 downgradingMultiFrameImageToSingleFrame:(BOOL)a8 actualSize:(unint64_t *)a9 startingLengthIndex:(int)a10 usedLengthIndex:(int *)a11 telemetry:(id)a12;
- (id)_writeImage:(CGImageSource *)a3 sourceURL:(id)a4 target:(int64_t)a5 hardwareEncoder:(id)a6 inFormat:(__CFString *)a7 fromFormat:(__CFString *)a8 withMaxByteSize:(unint64_t)a9 maxDimension:(unint64_t)a10 actualSize:(unint64_t *)a11 startingLengthIndex:(int)a12 usedLengthIndex:(int *)a13 estimator:(id)a14 isLQMEnabled:(BOOL)a15 telemetry:(id)a16;
- (id)_writeImageData:(id)a3 inFormat:(__CFString *)a4 sourceURL:(id)a5;
- (id)_writeRepresentationsForImage:(CGImageSource *)a3 target:(int64_t)a4 sourceURL:(id)a5 sizes:(id)a6 maxDimension:(unint64_t)a7 srcUTI:(__CFString *)a8 inFormat:(__CFString *)a9 downgradingMultiFrameImageToSingleFrame:(BOOL)a10 estimator:(id)a11 isLQMEnabled:(BOOL)a12 telemetry:(id)a13;
- (id)copyFramePropertiesFrom:(CGImageSource *)a3 index:(unint64_t)a4 inFormat:(__CFString *)a5 outFormat:(__CFString *)a6;
- (id)copyImagePropertiesFrom:(CGImageSource *)a3 frameCount:(unint64_t)a4 withProps:(id)a5 inFormat:(__CFString *)a6 outFormat:(__CFString *)a7;
- (int64_t)shouldTranscodeTransfer:(id)a3 transcoderUserInfo:(id)a4 target:(int64_t)a5 utiType:(id)a6 allowUnfilteredUTIs:(id)a7 fileSizeLimit:(unint64_t)a8 commonCapabilities:(id)a9;
- (unint64_t)_determineFrameIndexForDowngradeFromMultiFrameToSingleFrameWithMaxDimension:(unint64_t)a3 fromImageSource:(CGImageSource *)a4;
- (unint64_t)_getImageWidth:(CGImageSource *)a3;
- (void)_imMetricsCollectorForLQMQualityEstimatorModeImageTypeHEIC:(unint64_t)a3 shouldUseQualityEstimatorModel:(BOOL)a4 inputImageFeatures:(id)a5 metricsDict:(id)a6;
- (void)_setWideGamutProperties:(id)a3 scaledImage:(CGImage *)a4;
- (void)copyAuxiliaryImagesFromImageSource:(CGImageSource *)a3 toDestination:(CGImageDestination *)a4 fromImageAtIndex:(unint64_t)a5 scaleFactor:(double)a6;
- (void)setOverrideJPEGCompressionQuality:(double)a3;
- (void)transcodeFileTransfer:(id)a3 utiType:(id)a4 allowUnfilteredUTIs:(id)a5 target:(int64_t)a6 sizes:(id)a7 commonCapabilities:(id)a8 maxDimension:(unint64_t)a9 transcoderUserInfo:(id)a10 representations:(int64_t)a11 isLQMEnabled:(BOOL)a12 completionBlock:(id)a13;
@end

@implementation IMTranscoder_Image

+ (id)supportedUTIs
{
  return (id)MEMORY[0x270F3D120](a1, a2);
}

- (BOOL)_isWideGamutImage:(CGImageSource *)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a3)
  {
    int IsColorOptimizedForSharing = CGImageSourceIsColorOptimizedForSharing();
    char v4 = IsColorOptimizedForSharing ^ 1;
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = @"YES";
        if (IsColorOptimizedForSharing) {
          v6 = @"NO";
        }
        int v9 = 138412290;
        v10 = v6;
        _os_log_impl(&dword_22B280000, v5, OS_LOG_TYPE_INFO, "_isWideGamut %@ ", (uint8_t *)&v9, 0xCu);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_22B280000, v7, OS_LOG_TYPE_INFO, "Transcoding _isWideGamut nil sourceRef", (uint8_t *)&v9, 2u);
      }
    }
    return 0;
  }
  return v4;
}

- (BOOL)_isHEIFImageFormat:(__CFString *)a3
{
  return UTTypeConformsTo(a3, (CFStringRef)*MEMORY[0x263F4B0F0]) != 0;
}

- (BOOL)_isWebPImageFormat:(__CFString *)a3
{
  return UTTypeConformsTo(a3, (CFStringRef)*MEMORY[0x263F4B0F8]) != 0;
}

- (int64_t)shouldTranscodeTransfer:(id)a3 transcoderUserInfo:(id)a4 target:(int64_t)a5 utiType:(id)a6 allowUnfilteredUTIs:(id)a7 fileSizeLimit:(unint64_t)a8 commonCapabilities:(id)a9
{
  v159[1] = *MEMORY[0x263EF8340];
  CFURLRef v15 = (const __CFURL *)a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v23 = a9;
  if (!v15)
  {
    int64_t v29 = 0;
    goto LABEL_90;
  }
  if (!objc_msgSend_BOOLFromTranscoderUserInfo_withKey_(self, v19, (uint64_t)v16, *MEMORY[0x263F4AC28], v20, v21, v22))
  {
    if (objc_msgSend_BOOLFromTranscoderUserInfo_withKey_(self, v24, (uint64_t)v16, *MEMORY[0x263F4AC20], v25, v26, v27))
    {
      if (IMOSLoggingEnabled())
      {
        v34 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22B280000, v34, OS_LOG_TYPE_INFO, "This is a genmoji, skip transcoding", buf, 2u);
        }
LABEL_19:

        goto LABEL_20;
      }
      goto LABEL_20;
    }
    int v35 = objc_msgSend_BOOLFromTranscoderUserInfo_withKey_(self, v30, (uint64_t)v16, @"isSticker", v31, v32, v33);
    if (a5 != 1 && v35)
    {
      if (IMOSLoggingEnabled())
      {
        v34 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22B280000, v34, OS_LOG_TYPE_INFO, "This is a sticker, skip transcoding", buf, 2u);
        }
        goto LABEL_19;
      }
LABEL_20:
      int64_t v29 = 1;
      goto LABEL_90;
    }
    int v40 = objc_msgSend_BOOLFromTranscoderUserInfo_withKey_(self, v36, (uint64_t)v16, @"preserveHEIF", v37, v38, v39);
    if (a5) {
      int v41 = 0;
    }
    else {
      int v41 = v40;
    }
    if (IMOSLoggingEnabled())
    {
      v45 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v155 = v15;
        _os_log_impl(&dword_22B280000, v45, OS_LOG_TYPE_INFO, "Creating CGImageSource from url: %@", buf, 0xCu);
      }
    }
    if (v17)
    {
      uint64_t v158 = *MEMORY[0x263F0F640];
      v159[0] = v17;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v42, (uint64_t)v159, (uint64_t)&v158, 1, v43, v44);
      CFDictionaryRef v46 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      CFDictionaryRef v46 = 0;
    }
    CFDictionaryRef v150 = v46;
    isrc = CGImageSourceCreateWithURL(v15, v46);
    if (IMOSLoggingEnabled())
    {
      v47 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        v48 = @"good";
        if (!isrc) {
          v48 = @"NULL";
        }
        *(_DWORD *)buf = 138412290;
        id v155 = v48;
        _os_log_impl(&dword_22B280000, v47, OS_LOG_TYPE_INFO, "Source ref is %@", buf, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      v49 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v155 = v15;
        _os_log_impl(&dword_22B280000, v49, OS_LOG_TYPE_INFO, "Checking uti from source ref at url: %@", buf, 0xCu);
      }
    }
    CFStringRef Type = CGImageSourceGetType(isrc);
    if (objc_msgSend__isHEIFImageFormat_(self, v51, (uint64_t)Type, v52, v53, v54, v55))
    {
      if ((v41 & 1) == 0)
      {
        if (isrc) {
          CFRelease(isrc);
        }
        if (!IMOSLoggingEnabled()) {
          goto LABEL_87;
        }
        v72 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22B280000, v72, OS_LOG_TYPE_INFO, "Needs transcode, the image was HEIF but preserveHEIF was NO", buf, 2u);
        }
        goto LABEL_86;
      }
      if (IMImageSourceHasStereoPair())
      {
        if (isrc) {
          CFRelease(isrc);
        }
        if (IMOSLoggingEnabled())
        {
          v62 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22B280000, v62, OS_LOG_TYPE_INFO, "Image is HEIF standard-compliant, recipients prefer it, and it has a stereo pair. Not transcoding", buf, 2u);
          }
        }
        int64_t v29 = 1;
        goto LABEL_88;
      }
      if (IMOSLoggingEnabled())
      {
        v71 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22B280000, v71, OS_LOG_TYPE_INFO, "Image is HEIF standard-compliant. Proceeding with other checks", buf, 2u);
        }
LABEL_66:
      }
    }
    else
    {
      if (v41)
      {
        v63 = objc_msgSend_sharedFeatureFlags(MEMORY[0x263F4AF80], v56, v57, v58, v59, v60, v61);
        char isHighQualityPhotosEnabled = objc_msgSend_isHighQualityPhotosEnabled(v63, v64, v65, v66, v67, v68, v69);

        if ((isHighQualityPhotosEnabled & 1) == 0)
        {
          if (isrc) {
            CFRelease(isrc);
          }
          if (!IMOSLoggingEnabled()) {
            goto LABEL_87;
          }
          v72 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v155 = v17;
            _os_log_impl(&dword_22B280000, v72, OS_LOG_TYPE_INFO, "Needs transcode as all recipients support heif (source uti %@)", buf, 0xCu);
          }
          goto LABEL_86;
        }
      }
      if (IMOSLoggingEnabled())
      {
        v71 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22B280000, v71, OS_LOG_TYPE_INFO, "Image is not HEIF-standard compliant. Proceeding with other checks", buf, 2u);
        }
        goto LABEL_66;
      }
    }
    CFStringRef v73 = CGImageSourceGetType(isrc);
    if (objc_msgSend__isWebPImageFormat_(self, v74, (uint64_t)v73, v75, v76, v77, v78))
    {
      if (isrc) {
        CFRelease(isrc);
      }
      if (!IMOSLoggingEnabled()) {
        goto LABEL_87;
      }
      v72 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22B280000, v72, OS_LOG_TYPE_INFO, "Needs transcode as WebP is not supported", buf, 2u);
      }
      goto LABEL_86;
    }
    if (objc_msgSend__isWideGamutImage_(self, v79, (uint64_t)isrc, v80, v81, v82, v83))
    {
      if (isrc) {
        CFRelease(isrc);
      }
      if (!IMOSLoggingEnabled()) {
        goto LABEL_87;
      }
      v72 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22B280000, v72, OS_LOG_TYPE_INFO, "Needs transcode as image is wide-gamut", buf, 2u);
      }
      goto LABEL_86;
    }
    if (IMOSLoggingEnabled())
    {
      v86 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22B280000, v86, OS_LOG_TYPE_INFO, "Not wide gamut image. Proceeding with other checks", buf, 2u);
      }
    }
    if (isrc) {
      CFRelease(isrc);
    }
    int v87 = IMOSLoggingEnabled();
    if (v17)
    {
      if (v87)
      {
        v88 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v155 = v17;
          _os_log_impl(&dword_22B280000, v88, OS_LOG_TYPE_INFO, "shouldTranscodeTransfer with uti: %@ ?", buf, 0xCu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        v89 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22B280000, v89, OS_LOG_TYPE_INFO, "Trying to discriminate based on type alone:", buf, 2u);
        }
      }
      v90 = objc_opt_class();
      v97 = objc_msgSend_supportedUTIs(v90, v91, v92, v93, v94, v95, v96);
      char v103 = objc_msgSend_containsObject_(v97, v98, (uint64_t)v17, v99, v100, v101, v102);

      if (v103)
      {
        if (objc_msgSend_isEqualToIgnoringCase_(v17, v104, @"________WBMP_________", v105, v106, v107, v108))
        {
          if (!IMOSLoggingEnabled()) {
            goto LABEL_87;
          }
          v72 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22B280000, v72, OS_LOG_TYPE_INFO, "This appears to be a WBMP, this requires a transcode", buf, 2u);
          }
        }
        else
        {
          int v110 = IMOSLoggingEnabled();
          if (a5 != 1)
          {
            if (v110)
            {
              v117 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v117, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_22B280000, v117, OS_LOG_TYPE_INFO, "That wasn't enough, let's look at filesize too:", buf, 2u);
              }
            }
            v118 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v111, v112, v113, v114, v115, v116);
            v125 = objc_msgSend_path(v15, v119, v120, v121, v122, v123, v124);
            id v153 = 0;
            v130 = objc_msgSend_attributesOfItemAtPath_error_(v118, v126, (uint64_t)v125, (uint64_t)&v153, v127, v128, v129);
            CGImageSourceRef isrca = (CGImageSourceRef)v153;
            unint64_t v137 = objc_msgSend_fileSize(v130, v131, v132, v133, v134, v135, v136);

            if (IMOSLoggingEnabled())
            {
              v138 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v138, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                id v155 = v15;
                __int16 v156 = 2112;
                CGImageSourceRef v157 = isrca;
                _os_log_impl(&dword_22B280000, v138, OS_LOG_TYPE_INFO, "Checked size of file %@ with error %@", buf, 0x16u);
              }
            }
            id v139 = v18;
            v145 = v139;
            if (v139) {
              LODWORD(v139) = objc_msgSend_containsObject_(v139, v140, (uint64_t)v17, v141, v142, v143, v144);
            }
            if (isrca) {
              int v146 = 0;
            }
            else {
              int v146 = (int)v139;
            }
            if (v137 < a8) {
              int v147 = v146;
            }
            else {
              int v147 = 0;
            }
            if (IMOSLoggingEnabled())
            {
              v148 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v148, OS_LOG_TYPE_INFO))
              {
                v149 = @"NO";
                if (v147) {
                  v149 = @"YES";
                }
                *(_DWORD *)buf = 138412290;
                id v155 = v149;
                _os_log_impl(&dword_22B280000, v148, OS_LOG_TYPE_INFO, "Is the original sendable without transcode? %@", buf, 0xCu);
              }
            }
            if (v147) {
              int64_t v29 = 1;
            }
            else {
              int64_t v29 = 2;
            }

            goto LABEL_88;
          }
          CFDictionaryRef v84 = v150;
          if (!v110)
          {
            int64_t v29 = 2;
            goto LABEL_89;
          }
          v72 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22B280000, v72, OS_LOG_TYPE_INFO, "This is MMS, we should always transcode", buf, 2u);
          }
        }
LABEL_86:

LABEL_87:
        int64_t v29 = 2;
LABEL_88:
        CFDictionaryRef v84 = v150;
LABEL_89:

        goto LABEL_90;
      }
      if (IMOSLoggingEnabled())
      {
        v109 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v109, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22B280000, v109, OS_LOG_TYPE_INFO, "Uti is not contained in supportedUTIs", buf, 2u);
        }
LABEL_119:
      }
    }
    else if (v87)
    {
      v109 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v109, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22B280000, v109, OS_LOG_TYPE_INFO, "No UTI supplied", buf, 2u);
      }
      goto LABEL_119;
    }
    int64_t v29 = 0;
    goto LABEL_88;
  }
  if (IMOSLoggingEnabled())
  {
    v28 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22B280000, v28, OS_LOG_TYPE_INFO, "Genmoji heic needs fallback to png", buf, 2u);
    }
  }
  int64_t v29 = 2;
LABEL_90:

  return v29;
}

- (id)copyImagePropertiesFrom:(CGImageSource *)a3 frameCount:(unint64_t)a4 withProps:(id)a5 inFormat:(__CFString *)a6 outFormat:(__CFString *)a7
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  id v10 = a5;
  CFStringRef v11 = (const __CFString *)*MEMORY[0x263F01AE0];
  uint64_t v81 = v10;
  if (UTTypeConformsTo(a6, (CFStringRef)*MEMORY[0x263F01AE0]))
  {
    id v12 = (id)*MEMORY[0x263F0F4E0];
    id v82 = (id)*MEMORY[0x263F0F068];
    id v13 = (id)*MEMORY[0x263F0F058];
    id v14 = (id)*MEMORY[0x263F0F070];
    CFURLRef v15 = (void **)MEMORY[0x263F0F060];
LABEL_5:
    id v16 = *v15;
    id v17 = v16;
    goto LABEL_6;
  }
  if (UTTypeConformsTo(a6, (CFStringRef)*MEMORY[0x263F4B0E8]))
  {
    id v12 = (id)*MEMORY[0x263F0F430];
    id v82 = (id)*MEMORY[0x263F0F440];
    id v13 = (id)*MEMORY[0x263F0F428];
    id v14 = (id)*MEMORY[0x263F0F448];
    CFURLRef v15 = (void **)MEMORY[0x263F0F438];
    goto LABEL_5;
  }
  if (!UTTypeConformsTo(a6, (CFStringRef)*MEMORY[0x263F4B0F0]))
  {
    if (UTTypeConformsTo(a6, (CFStringRef)*MEMORY[0x263F01A40]))
    {
      id v12 = (id)*MEMORY[0x263F0F370];
      id v82 = (id)*MEMORY[0x263F0F388];
      id v13 = (id)*MEMORY[0x263F0F368];
      id v14 = (id)*MEMORY[0x263F0F390];
      CFURLRef v15 = (void **)MEMORY[0x263F0F378];
    }
    else
    {
      if (!UTTypeConformsTo(a6, (CFStringRef)*MEMORY[0x263F4B0F8]))
      {
        uint64_t v26 = 0;
        id v12 = 0;
        id v82 = 0;
        uint64_t v83 = 0;
        CFDictionaryRef v84 = 0;
        id v17 = 0;
        goto LABEL_11;
      }
      id v12 = (id)*MEMORY[0x263F0F570];
      id v82 = (id)*MEMORY[0x263F0F580];
      id v13 = (id)*MEMORY[0x263F0F568];
      id v14 = (id)*MEMORY[0x263F0F588];
      CFURLRef v15 = (void **)MEMORY[0x263F0F578];
    }
    goto LABEL_5;
  }
  id v82 = 0;
  id v13 = 0;
  id v14 = 0;
  id v17 = 0;
  id v16 = (void *)*MEMORY[0x263F0F450];
  id v12 = (id)*MEMORY[0x263F0F450];
LABEL_6:
  uint64_t v83 = v13;
  CFDictionaryRef v84 = v14;
  id v18 = v16;
  if (!v12)
  {
    uint64_t v26 = 0;
    goto LABEL_11;
  }
  uint64_t v25 = objc_msgSend_objectForKey_(v10, v19, (uint64_t)v12, v21, v22, v23, v24);
  uint64_t v26 = v25;
  if (!v25)
  {
LABEL_11:
    uint64_t v27 = 0;
    v28 = 0;
    v86 = 0;
    goto LABEL_12;
  }
  if (v82)
  {
    v86 = objc_msgSend_objectForKey_(v25, v19, (uint64_t)v82, v21, v22, v23, v24);
  }
  else
  {
    v86 = 0;
  }
  if (v13)
  {
    uint64_t v27 = objc_msgSend_objectForKey_(v26, v19, (uint64_t)v13, v21, v22, v23, v24);
  }
  else
  {
    uint64_t v27 = 0;
  }
  uint64_t v20 = (uint64_t)v84;
  if (v84)
  {
    v28 = objc_msgSend_objectForKey_(v26, v19, (uint64_t)v84, v21, v22, v23, v24);
    if (!v17) {
      goto LABEL_12;
    }
LABEL_21:
    v85 = objc_msgSend_objectForKey_(v26, v19, (uint64_t)v17, v21, v22, v23, v24);
    goto LABEL_22;
  }
  v28 = 0;
  if (v17) {
    goto LABEL_21;
  }
LABEL_12:
  v85 = 0;
LABEL_22:
  if (a4 < 2) {
    goto LABEL_40;
  }
  if (!v27 || !v28)
  {
    CFDictionaryRef v29 = CGImageSourceCopyPropertiesAtIndex(a3, 0, 0);
    CFDictionaryRef v35 = v29;
    if (v29)
    {
      v36 = objc_msgSend_objectForKey_(v29, v30, (uint64_t)v12, v31, v32, v33, v34);
      v42 = v36;
      if (v36)
      {
        if (!v27)
        {
          uint64_t v27 = objc_msgSend_objectForKey_(v36, v37, (uint64_t)v83, v38, v39, v40, v41);
        }
        if (!v28)
        {
          v28 = objc_msgSend_objectForKey_(v42, v37, (uint64_t)v84, v38, v39, v40, v41);
        }
      }
    }
  }
  if (!objc_msgSend_count(v26, v19, v20, v21, v22, v23, v24))
  {
LABEL_40:
    CFMutableDictionaryRef v49 = 0;
    goto LABEL_84;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v43 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      v88 = v27;
      __int16 v89 = 2112;
      v90 = v28;
      __int16 v91 = 2112;
      uint64_t v92 = v86;
      __int16 v93 = 2112;
      uint64_t v94 = v85;
      _os_log_impl(&dword_22B280000, v43, OS_LOG_TYPE_INFO, "Found delay %@ unclampedDelay %@ loopCount %@ FrameInfo %@. copying to destination", buf, 0x2Au);
    }
  }
  if (UTTypeConformsTo(a7, v11))
  {
    uint64_t v44 = (id *)MEMORY[0x263F0F060];
    v45 = (id *)MEMORY[0x263F0F070];
    CFDictionaryRef v46 = (id *)MEMORY[0x263F0F058];
    v47 = (id *)MEMORY[0x263F0F068];
    v48 = (id *)MEMORY[0x263F0F4E0];
  }
  else if (UTTypeConformsTo(a7, (CFStringRef)*MEMORY[0x263F4B0E8]))
  {
    uint64_t v44 = (id *)MEMORY[0x263F0F438];
    v45 = (id *)MEMORY[0x263F0F448];
    CFDictionaryRef v46 = (id *)MEMORY[0x263F0F428];
    v47 = (id *)MEMORY[0x263F0F440];
    v48 = (id *)MEMORY[0x263F0F430];
  }
  else if (UTTypeConformsTo(a7, (CFStringRef)*MEMORY[0x263F01A40]))
  {
    uint64_t v44 = (id *)MEMORY[0x263F0F378];
    v45 = (id *)MEMORY[0x263F0F390];
    CFDictionaryRef v46 = (id *)MEMORY[0x263F0F368];
    v47 = (id *)MEMORY[0x263F0F388];
    v48 = (id *)MEMORY[0x263F0F370];
  }
  else
  {
    if (!UTTypeConformsTo(a7, (CFStringRef)*MEMORY[0x263F4B0F8]))
    {
      uint64_t v77 = 0;
      id v78 = 0;
      inUTIa = 0;
      id v57 = 0;
      uint64_t v65 = 0;
      CFMutableDictionaryRef Mutable = 0;
      uint64_t v71 = objc_msgSend_count(0, v50, v51, v52, v53, v54, v55);
      goto LABEL_80;
    }
    uint64_t v44 = (id *)MEMORY[0x263F0F578];
    v45 = (id *)MEMORY[0x263F0F588];
    CFDictionaryRef v46 = (id *)MEMORY[0x263F0F568];
    v47 = (id *)MEMORY[0x263F0F580];
    v48 = (id *)MEMORY[0x263F0F570];
  }
  id v78 = *v48;
  id v56 = *v47;
  inUTIa = (__CFString *)*v46;
  id v57 = *v45;
  id v58 = *v44;
  uint64_t v65 = v58;
  uint64_t v77 = v56;
  if (!v86 || !v56)
  {
    if (!v27 || !inUTIa)
    {
      if (!v28 || !v57)
      {
        CFMutableDictionaryRef Mutable = 0;
        if (!v85 || !v58) {
          goto LABEL_79;
        }
LABEL_77:
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
        goto LABEL_78;
      }
      goto LABEL_69;
    }
    goto LABEL_61;
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  objc_msgSend_setObject_forKey_(Mutable, v67, (uint64_t)v86, (uint64_t)v56, v68, v69, v70);
  if (v27 && inUTIa)
  {
    if (Mutable)
    {
LABEL_62:
      objc_msgSend_setObject_forKey_(Mutable, v59, (uint64_t)v27, (uint64_t)inUTIa, v62, v63, v64);
      goto LABEL_63;
    }
LABEL_61:
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    goto LABEL_62;
  }
LABEL_63:
  if (v28 && v57)
  {
    if (Mutable)
    {
LABEL_70:
      objc_msgSend_setObject_forKey_(Mutable, v59, (uint64_t)v28, (uint64_t)v57, v62, v63, v64);
      goto LABEL_71;
    }
LABEL_69:
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    goto LABEL_70;
  }
LABEL_71:
  if (!v85 || !v65) {
    goto LABEL_79;
  }
  if (!Mutable) {
    goto LABEL_77;
  }
LABEL_78:
  objc_msgSend_setObject_forKey_(Mutable, v59, (uint64_t)v85, (uint64_t)v65, v62, v63, v64);
LABEL_79:
  uint64_t v71 = objc_msgSend_count(Mutable, v59, v60, v61, v62, v63, v64);
LABEL_80:
  if (v71)
  {
    CFMutableDictionaryRef v49 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    objc_msgSend_setObject_forKey_(v49, v72, (uint64_t)Mutable, (uint64_t)v78, v73, v74, v75);
  }
  else
  {
    CFMutableDictionaryRef v49 = 0;
  }

LABEL_84:
  return v49;
}

- (id)copyFramePropertiesFrom:(CGImageSource *)a3 index:(unint64_t)a4 inFormat:(__CFString *)a5 outFormat:(__CFString *)a6
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  CFDictionaryRef v9 = CGImageSourceCopyPropertiesAtIndex(a3, a4, 0);
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v87 = 134218242;
      unint64_t v88 = a4;
      __int16 v89 = 2112;
      CFDictionaryRef v90 = v9;
      _os_log_impl(&dword_22B280000, v10, OS_LOG_TYPE_INFO, "Got image properties for image at index %zu: %@", (uint8_t *)&v87, 0x16u);
    }
  }
  CFStringRef v11 = (const __CFString *)*MEMORY[0x263F01AE0];
  int v12 = UTTypeConformsTo(a5, (CFStringRef)*MEMORY[0x263F01AE0]);
  id v18 = (CFStringRef *)MEMORY[0x263F4B0E8];
  v19 = (CFStringRef *)MEMORY[0x263F4B0F8];
  if (v12)
  {
    uint64_t v20 = objc_msgSend_objectForKey_(v9, v13, *MEMORY[0x263F0F4E0], v14, v15, v16, v17);
    if (IMOSLoggingEnabled())
    {
      uint64_t v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        int v87 = 138412290;
        unint64_t v88 = (unint64_t)v20;
        _os_log_impl(&dword_22B280000, v26, OS_LOG_TYPE_INFO, "Checking for PNG Properties: %@", (uint8_t *)&v87, 0xCu);
      }
    }
    uint64_t v27 = (uint64_t *)MEMORY[0x263F0F070];
    v28 = (uint64_t *)MEMORY[0x263F0F058];
LABEL_29:
    v47 = objc_msgSend_objectForKey_(v20, v21, *v28, v22, v23, v24, v25);
    uint64_t v53 = objc_msgSend_objectForKey_(v20, v48, *v27, v49, v50, v51, v52);
    goto LABEL_30;
  }
  if (UTTypeConformsTo(a5, (CFStringRef)*MEMORY[0x263F4B0E8]))
  {
    uint64_t v20 = objc_msgSend_objectForKey_(v9, v29, *MEMORY[0x263F0F430], v30, v31, v32, v33);
    if (IMOSLoggingEnabled())
    {
      uint64_t v34 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        int v87 = 138412290;
        unint64_t v88 = (unint64_t)v20;
        _os_log_impl(&dword_22B280000, v34, OS_LOG_TYPE_INFO, "Checking for HEICS Properties: %@", (uint8_t *)&v87, 0xCu);
      }
    }
    uint64_t v27 = (uint64_t *)MEMORY[0x263F0F448];
    v28 = (uint64_t *)MEMORY[0x263F0F428];
    goto LABEL_29;
  }
  if (UTTypeConformsTo(a5, (CFStringRef)*MEMORY[0x263F01A40]))
  {
    uint64_t v20 = objc_msgSend_objectForKey_(v9, v35, *MEMORY[0x263F0F370], v36, v37, v38, v39);
    if (IMOSLoggingEnabled())
    {
      uint64_t v40 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        int v87 = 138412290;
        unint64_t v88 = (unint64_t)v20;
        _os_log_impl(&dword_22B280000, v40, OS_LOG_TYPE_INFO, "Checking for GIF Properties: %@", (uint8_t *)&v87, 0xCu);
      }
    }
    uint64_t v27 = (uint64_t *)MEMORY[0x263F0F390];
    v28 = (uint64_t *)MEMORY[0x263F0F368];
    goto LABEL_29;
  }
  if (UTTypeConformsTo(a5, *v19))
  {
    uint64_t v20 = objc_msgSend_objectForKey_(v9, v41, *MEMORY[0x263F0F570], v42, v43, v44, v45);
    if (IMOSLoggingEnabled())
    {
      CFDictionaryRef v46 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        int v87 = 138412290;
        unint64_t v88 = (unint64_t)v20;
        _os_log_impl(&dword_22B280000, v46, OS_LOG_TYPE_INFO, "Checking for WebP Properties: %@", (uint8_t *)&v87, 0xCu);
      }
    }
    uint64_t v27 = (uint64_t *)MEMORY[0x263F0F588];
    v28 = (uint64_t *)MEMORY[0x263F0F568];
    goto LABEL_29;
  }
  v47 = 0;
  uint64_t v53 = 0;
  uint64_t v20 = 0;
LABEL_30:
  if (UTTypeConformsTo(a6, v11))
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    id v55 = v47;
    if (v55)
    {
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F0F058], v55);
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      sub_22B29F3A8();
    }

    id v57 = v53;
    if (v57)
    {
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F0F070], v57);
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      sub_22B29F320();
    }

    if (objc_msgSend_count(Mutable, v58, v59, v60, v61, v62, v63))
    {
      id v56 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      uint64_t v64 = Mutable;
      if (v64)
      {
        CFDictionarySetValue(v56, (const void *)*MEMORY[0x263F0F4E0], v64);
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        sub_22B29F298();
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v65 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
        {
          LOWORD(v87) = 0;
          _os_log_impl(&dword_22B280000, v65, OS_LOG_TYPE_INFO, "No png property dictionary to add", (uint8_t *)&v87, 2u);
        }
      }
      id v56 = 0;
    }
  }
  else
  {
    id v56 = 0;
  }
  if (UTTypeConformsTo(a6, *v18))
  {
    uint64_t v66 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    id v67 = v47;
    if (v67)
    {
      CFDictionarySetValue(v66, (const void *)*MEMORY[0x263F0F428], v67);
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      sub_22B29F210();
    }

    id v68 = v53;
    if (v68)
    {
      CFDictionarySetValue(v66, (const void *)*MEMORY[0x263F0F448], v68);
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      sub_22B29F188();
    }

    if (objc_msgSend_count(v66, v69, v70, v71, v72, v73, v74))
    {
      if (!v56) {
        id v56 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      }
      uint64_t v75 = v66;
      if (v75)
      {
        CFDictionarySetValue(v56, (const void *)*MEMORY[0x263F0F430], v75);
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        sub_22B29F100();
      }
    }
    else
    {
      if (!IMOSLoggingEnabled())
      {
LABEL_73:

        goto LABEL_74;
      }
      uint64_t v75 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
      {
        LOWORD(v87) = 0;
        _os_log_impl(&dword_22B280000, v75, OS_LOG_TYPE_INFO, "No HEICS property dictionary to add", (uint8_t *)&v87, 2u);
      }
    }

    goto LABEL_73;
  }
LABEL_74:
  if (UTTypeConformsTo(a6, *v19))
  {
    uint64_t v76 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    id v77 = v47;
    if (v77)
    {
      CFDictionarySetValue(v76, (const void *)*MEMORY[0x263F0F568], v77);
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      sub_22B29F078();
    }

    id v78 = v53;
    if (v78)
    {
      CFDictionarySetValue(v76, (const void *)*MEMORY[0x263F0F588], v78);
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      sub_22B29EFF0();
    }

    if (objc_msgSend_count(v76, v79, v80, v81, v82, v83, v84))
    {
      if (!v56) {
        id v56 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      }
      v85 = v76;
      if (v85)
      {
        CFDictionarySetValue(v56, (const void *)*MEMORY[0x263F0F570], v85);
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        sub_22B29EF68();
      }
    }
    else
    {
      if (!IMOSLoggingEnabled())
      {
LABEL_95:

        goto LABEL_96;
      }
      v85 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
      {
        LOWORD(v87) = 0;
        _os_log_impl(&dword_22B280000, v85, OS_LOG_TYPE_INFO, "No WebP property dictionary to add", (uint8_t *)&v87, 2u);
      }
    }

    goto LABEL_95;
  }
LABEL_96:

  return v56;
}

+ (id)findOrientationFromProperties:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x263F0F4C8];
  uint64_t v15 = objc_msgSend_objectForKey_(v3, v5, *MEMORY[0x263F0F4C8], v6, v7, v8, v9);
  if (v15)
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_10;
    }
    uint64_t v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v24 = 138412290;
      uint64_t v25 = v15;
      _os_log_impl(&dword_22B280000, v16, OS_LOG_TYPE_INFO, "Orientation data found in default location: %@", (uint8_t *)&v24, 0xCu);
    }
  }
  else
  {
    uint64_t v17 = objc_msgSend_objectForKey_(v3, v10, *MEMORY[0x263F0F518], v11, v12, v13, v14);
    uint64_t v15 = objc_msgSend_objectForKey_(v17, v18, v4, v19, v20, v21, v22);

    if (!IMOSLoggingEnabled()) {
      goto LABEL_10;
    }
    uint64_t v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v24 = 138412290;
      uint64_t v25 = v15;
      _os_log_impl(&dword_22B280000, v16, OS_LOG_TYPE_INFO, "Orientation data NOT found in default location, checked TIFF location: %@", (uint8_t *)&v24, 0xCu);
    }
  }

LABEL_10:
  return v15;
}

+ (unint64_t)findLargerDimensionFromImage:(CGImageSource *)a3 withProperties:(id)a4 toWidth:(id *)a5 toHeight:(id *)a6
{
  id v9 = a4;
  uint64_t v15 = v9;
  if (!v9)
  {
    if (IMOSLoggingEnabled())
    {
      id v57 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v60 = 0;
        _os_log_impl(&dword_22B280000, v57, OS_LOG_TYPE_INFO, "Couldn't find props for image to find source height and width", v60, 2u);
      }
    }
    uint64_t v17 = 0;
    uint64_t v31 = 0;
    goto LABEL_30;
  }
  uint64_t v16 = *MEMORY[0x263F0F4F8];
  uint64_t v17 = objc_msgSend_objectForKey_(v9, v10, *MEMORY[0x263F0F4F8], v11, v12, v13, v14);
  uint64_t v18 = *MEMORY[0x263F0F4F0];
  uint64_t v24 = objc_msgSend_objectForKey_(v15, v19, *MEMORY[0x263F0F4F0], v20, v21, v22, v23);
  uint64_t v31 = (void *)v24;
  if (v17) {
    BOOL v32 = v24 == 0;
  }
  else {
    BOOL v32 = 1;
  }
  if (v32 && CGImageSourceGetCount(a3))
  {
    CFDictionaryRef v33 = CGImageSourceCopyPropertiesAtIndex(a3, 0, 0);
    CFDictionaryRef v39 = v33;
    if (v33)
    {
      uint64_t v40 = objc_msgSend_objectForKey_(v33, v34, v16, v35, v36, v37, v38);

      uint64_t v46 = objc_msgSend_objectForKey_(v39, v41, v18, v42, v43, v44, v45);

      uint64_t v31 = (void *)v46;
      uint64_t v17 = (void *)v40;
    }
  }
  if (a5 && v17) {
    *a5 = v17;
  }
  if (a6 && v31) {
    *a6 = v31;
  }
  if (v17) {
    BOOL v47 = v31 == 0;
  }
  else {
    BOOL v47 = 1;
  }
  if (v47)
  {
LABEL_30:
    id v49 = 0;
    uint64_t v56 = objc_msgSend_unsignedIntegerValue(0, v25, v26, v27, v28, v29, v30);
    goto LABEL_31;
  }
  if (objc_msgSend_compare_(v17, v25, (uint64_t)v31, v27, v28, v29, v30) >= 0) {
    v48 = v17;
  }
  else {
    v48 = v31;
  }
  id v49 = v48;
  uint64_t v56 = objc_msgSend_unsignedIntegerValue(v49, v50, v51, v52, v53, v54, v55);
LABEL_31:
  unint64_t v58 = v56;

  return v58;
}

- (id)_newGeneratedImage:(CGImageSource *)a3 sourceWidth:(id)a4 sourceHeight:(id)a5 sourceLength:(unint64_t)a6 sourceProps:(id)a7 target:(int64_t)a8 hardwareEncoder:(id)a9 inFormat:(__CFString *)a10 fromFormat:(__CFString *)a11 withMaxLength:(unint64_t)a12 withMaxCount:(unint64_t)a13 withCompressionQuality:(double)a14 enforceMaxes:(BOOL)a15 subsampling:(int)a16 shouldSkipAuxillaryData:(BOOL)a17
{
  uint64_t v263 = *MEMORY[0x263EF8340];
  id v251 = a4;
  id v250 = a5;
  id v252 = a7;
  id v22 = a9;
  uint64_t v23 = v22;
  if (a3)
  {
    v248 = v22;
    if (!a10)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v27 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22B280000, v27, OS_LOG_TYPE_INFO, "Cannot generate image because format is NULL", buf, 2u);
        }
      }
      uint64_t v26 = 0;
      goto LABEL_31;
    }
    size_t v24 = CGImageSourceGetCount(a3);
    if (v24) {
      CFDictionaryRef v247 = CGImageSourceCopyPropertiesAtIndex(a3, 0, 0);
    }
    else {
      CFDictionaryRef v247 = 0;
    }
    if (!v251 || !v250)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v29 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22B280000, v29, OS_LOG_TYPE_INFO, "No source width and height", buf, 2u);
        }
      }
      goto LABEL_29;
    }
    if (a12 > a6 && a15 && v24 < a13)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v28 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218752;
          *(void *)v257 = a12;
          *(_WORD *)&v257[8] = 2048;
          v258 = (const char *)a13;
          __int16 v259 = 2048;
          unint64_t v260 = a6;
          __int16 v261 = 2048;
          size_t v262 = v24;
          _os_log_impl(&dword_22B280000, v28, OS_LOG_TYPE_INFO, "Not considering resizing to %lu or reducing to %zd images, it's larger than the current image dimension (%zd) and the current image count (%zd)", buf, 0x2Au);
        }
      }
LABEL_29:
      uint64_t v26 = 0;
LABEL_30:

LABEL_31:
      uint64_t v23 = v248;
      goto LABEL_32;
    }
    if (v24 >= a13) {
      unint64_t v31 = a13;
    }
    else {
      unint64_t v31 = v24;
    }
    size_t count = v31;
    if (a12 >= a6) {
      unint64_t v32 = a6;
    }
    else {
      unint64_t v32 = a12;
    }
    uint64_t v246 = v32;
    if (IMOSLoggingEnabled())
    {
      CFDictionaryRef v33 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)v257 = count;
        _os_log_impl(&dword_22B280000, v33, OS_LOG_TYPE_INFO, "    Image size_t count = %lu", buf, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v34 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)v257 = v24;
        _os_log_impl(&dword_22B280000, v34, OS_LOG_TYPE_INFO, " Original size_t count = %lu", buf, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v35 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)v257 = a13;
        _os_log_impl(&dword_22B280000, v35, OS_LOG_TYPE_INFO, "      Max size_t count = %lu", buf, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v36 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)v257 = v246;
        _os_log_impl(&dword_22B280000, v36, OS_LOG_TYPE_INFO, "         Length = %lu", buf, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v37 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)v257 = a12;
        _os_log_impl(&dword_22B280000, v37, OS_LOG_TYPE_INFO, "     Max length = %lu", buf, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v38 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)v257 = a6;
        _os_log_impl(&dword_22B280000, v38, OS_LOG_TYPE_INFO, "Original Length = %lu", buf, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      CFDictionaryRef v39 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v257 = a16;
        _os_log_impl(&dword_22B280000, v39, OS_LOG_TYPE_INFO, "    subsampling = %d", buf, 8u);
      }
    }
    double v45 = (double)(unint64_t)v246 / (double)a6;
    if (IMOSLoggingEnabled())
    {
      uint64_t v46 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(double *)v257 = v45;
        _os_log_impl(&dword_22B280000, v46, OS_LOG_TYPE_INFO, "   scale factor = %f", buf, 0xCu);
      }
    }
    int isWideGamutImage = objc_msgSend__isWideGamutImage_(self, v40, (uint64_t)a3, v41, v42, v43, v44);
    CFStringRef Type = CGImageSourceGetType(a3);
    int isHEIFImageFormat = objc_msgSend__isHEIFImageFormat_(self, v49, (uint64_t)Type, v50, v51, v52, v53);
    if (v248) {
      int v61 = isWideGamutImage;
    }
    else {
      int v61 = 1;
    }
    if ((v61 | isHEIFImageFormat))
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v62 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
        {
          uint64_t v63 = @"NO";
          if (isWideGamutImage) {
            uint64_t v63 = @"YES";
          }
          *(_DWORD *)buf = 138412546;
          *(void *)v257 = v248;
          *(_WORD *)&v257[8] = 2112;
          v258 = (const char *)v63;
          _os_log_impl(&dword_22B280000, v62, OS_LOG_TYPE_INFO, "Not using hardware encoding. encoder %@  isWideGamut %@", buf, 0x16u);
        }
      }
    }
    else
    {
      objc_msgSend_setTargetJPEGCompressionValue_(v248, v55, v56, v57, v58, v59, v60, a14);
      uint64_t v69 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v64, v246, v65, v66, v67, v68);
      id v255 = 0;
      int v74 = objc_msgSend_scaleImageToFitLargestDimension_outputData_(v248, v70, (uint64_t)v69, (uint64_t)&v255, v71, v72, v73);
      uint64_t v26 = (__CFData *)v255;

      int v75 = IMOSLoggingEnabled();
      if (v74)
      {
        if (v75)
        {
          uint64_t v76 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22B280000, v76, OS_LOG_TYPE_INFO, "Successfully used hardware encoding", buf, 2u);
          }
        }
        goto LABEL_30;
      }
      if (v75)
      {
        id v77 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22B280000, v77, OS_LOG_TYPE_INFO, "Failed using hardware encoding", buf, 2u);
        }
      }
    }
    data = (__CFData *)objc_alloc_init(MEMORY[0x263EFF990]);
    idst = CGImageDestinationCreateWithData(data, a10, count, 0);
    if (idst)
    {
      if (v252)
      {
        CFDictionaryRef v80 = (const __CFDictionary *)objc_msgSend_copyImagePropertiesFrom_frameCount_withProps_inFormat_outFormat_(self, v78, (uint64_t)a3, v24, (uint64_t)v252, (uint64_t)a11, (uint64_t)a10);
        if (v80)
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v81 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v257 = v80;
              _os_log_impl(&dword_22B280000, v81, OS_LOG_TYPE_INFO, "Setting output props: %@", buf, 0xCu);
            }
          }
          CGImageDestinationSetProperties(idst, v80);
        }
      }
      if (count)
      {
        size_t v82 = 0;
        BOOL v84 = a8 != 1 && v247 != 0;
        BOOL v240 = v84;
        uint64_t v238 = *MEMORY[0x263F0F628];
        uint64_t v244 = *MEMORY[0x263F0F5A8];
        uint64_t v243 = *MEMORY[0x263F0F638];
        CFStringRef inConformsToUTI = (const __CFString *)*MEMORY[0x263F01A80];
        uint64_t v242 = *MEMORY[0x263F0F5B8];
        CFStringRef v236 = (const __CFString *)*MEMORY[0x263F4B0F0];
        float v85 = a14;
        key = (void *)*MEMORY[0x263F0EFE8];
        uint64_t v234 = *MEMORY[0x263F0F4C8];
        v239 = (void *)*MEMORY[0x263F0F008];
        *(void *)&long long v79 = 134218242;
        long long v233 = v79;
        do
        {
          v86 = (void *)MEMORY[0x230F44180]();
          id v87 = objc_alloc(MEMORY[0x263EFF9A0]);
          __int16 v93 = objc_msgSend_initWithCapacity_(v87, v88, 4, v89, v90, v91, v92);
          uint64_t v99 = v93;
          if (a16 == -1)
          {
            objc_msgSend_setObject_forKey_(v93, v94, MEMORY[0x263EFFA88], v244, v96, v97, v98);
            uint64_t v136 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v131, v246, v132, v133, v134, v135);
            objc_msgSend_setObject_forKey_(v99, v137, (uint64_t)v136, v243, v138, v139, v140);

            int v146 = objc_msgSend_numberWithBool_(NSNumber, v141, a8 == 1, v142, v143, v144, v145);
            objc_msgSend_setObject_forKey_(v99, v147, (uint64_t)v146, v242, v148, v149, v150);

            ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(a3, v82, (CFDictionaryRef)v99);
            if (IMOSLoggingEnabled())
            {
              v152 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v152, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)v257 = ThumbnailAtIndex;
                _os_log_impl(&dword_22B280000, v152, OS_LOG_TYPE_INFO, "Used thumbnail path %@", buf, 0xCu);
              }
            }
          }
          else
          {
            uint64_t v100 = objc_msgSend_numberWithInt_(NSNumber, v94, a16, v95, v96, v97, v98);
            objc_msgSend_setObject_forKey_(v99, v101, (uint64_t)v100, v238, v102, v103, v104);

            objc_msgSend_setObject_forKey_(v99, v105, MEMORY[0x263EFFA88], v244, v106, v107, v108);
            uint64_t v114 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v109, v246, v110, v111, v112, v113);
            objc_msgSend_setObject_forKey_(v99, v115, (uint64_t)v114, v243, v116, v117, v118);

            uint64_t v124 = objc_msgSend_numberWithBool_(NSNumber, v119, a8 == 1, v120, v121, v122, v123);
            objc_msgSend_setObject_forKey_(v99, v125, (uint64_t)v124, v242, v126, v127, v128);

            if (IMOSLoggingEnabled())
            {
              uint64_t v129 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v129, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v257 = a16;
                *(_WORD *)&v257[4] = 1024;
                *(_DWORD *)&v257[6] = v82;
                _os_log_impl(&dword_22B280000, v129, OS_LOG_TYPE_INFO, "Using subsamping with: %d  (index: %d)", buf, 0xEu);
              }
            }
            if (count == 1)
            {
              CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(a3, v82, (CFDictionaryRef)v99);
            }
            else
            {
              if (IMOSLoggingEnabled())
              {
                id v153 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v153, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = v233;
                  *(void *)v257 = v82;
                  *(_WORD *)&v257[8] = 2112;
                  v258 = (const char *)a3;
                  _os_log_impl(&dword_22B280000, v153, OS_LOG_TYPE_INFO, "Getting thumbnail at index %zu from %@", buf, 0x16u);
                }
              }
              CGImageRef ImageAtIndex = CGImageSourceCreateThumbnailAtIndex(a3, v82, (CFDictionaryRef)v99);
            }
            v154 = ImageAtIndex;
            if (a8 != 1) {
              goto LABEL_136;
            }
            ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(a3, v82, (CFDictionaryRef)v99);
            int v155 = IMOSLoggingEnabled();
            if (!ThumbnailAtIndex)
            {
              if (v155)
              {
                CGImageSourceRef v157 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v157, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_22B280000, v157, OS_LOG_TYPE_INFO, "Failed to create a a rotated image for MMS", buf, 2u);
                }
              }
LABEL_136:
              ThumbnailAtIndex = v154;
              goto LABEL_137;
            }
            if (v155)
            {
              __int16 v156 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v156, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)v257 = ThumbnailAtIndex;
                _os_log_impl(&dword_22B280000, v156, OS_LOG_TYPE_INFO, "Created a rotated image for MMS: %@", buf, 0xCu);
              }
            }
            if (v154) {
              CFRelease(v154);
            }
          }
LABEL_137:
          if (!UTTypeConformsTo(a10, inConformsToUTI) && !UTTypeConformsTo(a10, v236))
          {
            v205 = objc_msgSend_copyFramePropertiesFrom_index_inFormat_outFormat_(self, v158, (uint64_t)a3, v82, (uint64_t)a11, (uint64_t)a10, v159);
            if (!v205) {
              goto LABEL_174;
            }
LABEL_171:
            CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
LABEL_172:
            objc_msgSend_addEntriesFromDictionary_(Mutable, v200, (uint64_t)v205, v201, v202, v203, v204, v233);
            goto LABEL_173;
          }
          CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
          *(float *)&double v161 = v85;
          v168 = objc_msgSend_numberWithFloat_(NSNumber, v162, v163, v164, v165, v166, v167, v161);
          if (v168)
          {
            CFDictionarySetValue(Mutable, key, v168);
          }
          else
          {
            v169 = &_os_log_internal;
            id v170 = &_os_log_internal;
            if (os_log_type_enabled(v169, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)v257 = key;
              *(_WORD *)&v257[8] = 2080;
              v258 = "properties";
              _os_log_error_impl(&dword_22B280000, v169, OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", buf, 0x16u);
            }
          }
          CFDictionaryRef v171 = CGImageSourceCopyPropertiesAtIndex(a3, 0, 0);
          if (IMOSLoggingEnabled())
          {
            v172 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v172, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v257 = v171;
              _os_log_impl(&dword_22B280000, v172, OS_LOG_TYPE_INFO, "Checking for properties: %@", buf, 0xCu);
            }
          }
          if (v171)
          {
            if (a8 == 1)
            {
              if (IMOSLoggingEnabled())
              {
                v179 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v179, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_22B280000, v179, OS_LOG_TYPE_INFO, " ...this is MMS, we don't want orientation appended, it's all pre-rotated", buf, 2u);
                }
              }
              if (objc_msgSend_count(v252, v173, v174, v175, v176, v177, v178, v233))
              {
                if (IMOSLoggingEnabled())
                {
                  v185 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v185, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_22B280000, v185, OS_LOG_TYPE_INFO, " ... * Adding original properties to the set", buf, 2u);
                  }
                }
                objc_msgSend_addEntriesFromDictionary_(Mutable, v180, (uint64_t)v252, v181, v182, v183, v184);
              }
            }
            else
            {
              v186 = objc_opt_class();
              objc_msgSend_findOrientationFromProperties_(v186, v187, (uint64_t)v171, v188, v189, v190, v191);
              v192 = (char *)objc_claimAutoreleasedReturnValue();
              if (v192)
              {
                if (IMOSLoggingEnabled())
                {
                  v197 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v197, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412546;
                    *(void *)v257 = v234;
                    *(_WORD *)&v257[8] = 2112;
                    v258 = v192;
                    _os_log_impl(&dword_22B280000, v197, OS_LOG_TYPE_INFO, "Setting the image orientation (key=%@) to (%@)", buf, 0x16u);
                  }
                }
                objc_msgSend_setValue_forKey_(Mutable, v193, (uint64_t)v192, v234, v194, v195, v196, v233);
              }
            }
          }

          v205 = objc_msgSend_copyFramePropertiesFrom_index_inFormat_outFormat_(self, v198, (uint64_t)a3, v82, (uint64_t)a11, (uint64_t)a10, v199);
          if (v205)
          {
            if (!Mutable) {
              goto LABEL_171;
            }
            goto LABEL_172;
          }
LABEL_173:
          if (!Mutable) {
LABEL_174:
          }
            CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
          v206 = objc_msgSend_numberWithBool_(NSNumber, v200, 1, v201, v202, v203, v204, v233);
          if (v206)
          {
            CFDictionarySetValue(Mutable, v239, v206);
          }
          else
          {
            v207 = &_os_log_internal;
            id v208 = &_os_log_internal;
            if (os_log_type_enabled(v207, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)v257 = v239;
              *(_WORD *)&v257[8] = 2080;
              v258 = "properties";
              _os_log_error_impl(&dword_22B280000, v207, OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", buf, 0x16u);
            }
          }
          if (v240) {
            objc_msgSend_addEntriesFromDictionary_(Mutable, v209, (uint64_t)v247, v210, v211, v212, v213);
          }
          if ((objc_msgSend__isHEIFImageFormat_(self, v209, (uint64_t)a10, v210, v211, v212, v213) & 1) == 0) {
            objc_msgSend__setWideGamutProperties_scaledImage_(self, v214, (uint64_t)Mutable, (uint64_t)ThumbnailAtIndex, v215, v216, v217);
          }
          int v218 = IMOSLoggingEnabled();
          if (ThumbnailAtIndex)
          {
            if (v218)
            {
              v219 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v219, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 134217984;
                *(void *)v257 = v82;
                _os_log_impl(&dword_22B280000, v219, OS_LOG_TYPE_INFO, "adding scaled image at index %lu", buf, 0xCu);
              }
            }
            if (IMOSLoggingEnabled())
            {
              v220 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v220, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)v257 = Mutable;
                _os_log_impl(&dword_22B280000, v220, OS_LOG_TYPE_INFO, "  properties: %@", buf, 0xCu);
              }
            }
            CGImageDestinationAddImage(idst, ThumbnailAtIndex, Mutable);
            int v221 = IMOSLoggingEnabled();
            if (a17)
            {
              if (v221)
              {
                v225 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v225, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_22B280000, v225, OS_LOG_TYPE_INFO, "Skipping Aux data addition for new quality estimator based transcoding for LQM", buf, 2u);
                }
              }
            }
            else
            {
              if (v221)
              {
                v227 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v227, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_22B280000, v227, OS_LOG_TYPE_INFO, "Adding Aux data", buf, 2u);
                }
              }
              objc_msgSend_copyAuxiliaryImagesFromImageSource_toDestination_fromImageAtIndex_scaleFactor_(self, v222, (uint64_t)a3, (uint64_t)idst, v82, v223, v224, v45);
            }
            CGImageRelease(ThumbnailAtIndex);
          }
          else if (v218)
          {
            v226 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v226, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134217984;
              *(void *)v257 = v82;
              _os_log_impl(&dword_22B280000, v226, OS_LOG_TYPE_INFO, "Failed adding scaled image at index (%zd)!", buf, 0xCu);
            }
          }
          ++v82;
        }
        while (count != v82);
      }
      BOOL v228 = CGImageDestinationFinalize(idst);
      if (IMOSLoggingEnabled())
      {
        v229 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v229, OS_LOG_TYPE_INFO))
        {
          v230 = @"NO";
          if (v228) {
            v230 = @"YES";
          }
          *(_DWORD *)buf = 138412290;
          *(void *)v257 = v230;
          _os_log_impl(&dword_22B280000, v229, OS_LOG_TYPE_INFO, "Success finalizing image: %@", buf, 0xCu);
        }
      }
      if (!v228)
      {

        data = 0;
      }
      CFRelease(idst);
      v231 = data;
      uint64_t v26 = v231;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v232 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v232, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22B280000, v232, OS_LOG_TYPE_INFO, "Cannot generate image because imageDestination is NULL", buf, 2u);
        }
      }
      uint64_t v26 = 0;
      v231 = data;
    }

    goto LABEL_30;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22B280000, v25, OS_LOG_TYPE_INFO, "Cannot generate image because source is NULL", buf, 2u);
    }
  }
  uint64_t v26 = 0;
LABEL_32:

  return v26;
}

- (void)_setWideGamutProperties:(id)a3 scaledImage:(CGImage *)a4
{
  id v5 = a3;
  if (a4)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v23 = 0;
        _os_log_impl(&dword_22B280000, v6, OS_LOG_TYPE_INFO, "Adding backward compatible color profile for non-heif-destination wide-gamut image", v23, 2u);
      }
    }
    size_t Width = CGImageGetWidth(a4);
    size_t Height = CGImageGetHeight(a4);
    if (Width <= Height) {
      objc_msgSend_numberWithUnsignedLong_(NSNumber, v9, Height, v10, v11, v12, v13);
    }
    else {
    uint64_t v14 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v9, Width, v10, v11, v12, v13);
    }
    objc_msgSend_setObject_forKey_(v5, v15, (uint64_t)v14, *MEMORY[0x263F0EFE0], v16, v17, v18);

    objc_msgSend_setObject_forKey_(v5, v19, MEMORY[0x263EFFA88], *MEMORY[0x263F0F008], v20, v21, v22);
  }
}

- (id)_checkAndSaveImageData:(id)a3 sourceURL:(id)a4 inFormat:(__CFString *)a5 withMaxByteSize:(unint64_t)a6 actualSize:(unint64_t *)a7 usedLengthIndex:(int *)a8 currentIndex:(int)a9
{
  *(void *)&v35[5] = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  unint64_t v23 = objc_msgSend_length(v15, v17, v18, v19, v20, v21, v22);
  int v24 = IMOSLoggingEnabled();
  if (!v15 || !v23)
  {
    if (v24)
    {
      unint64_t v32 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        LOWORD(v34) = 0;
        _os_log_impl(&dword_22B280000, v32, OS_LOG_TYPE_INFO, "No image generated for this iteration, we got no image data.", (uint8_t *)&v34, 2u);
      }
    }
    goto LABEL_25;
  }
  if (v24)
  {
    uint64_t v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      int v34 = 67109376;
      v35[0] = v23;
      LOWORD(v35[1]) = 1024;
      *(_DWORD *)((char *)&v35[1] + 2) = a6;
      _os_log_impl(&dword_22B280000, v25, OS_LOG_TYPE_INFO, "Successfully generated image! Comparing data length (%d) to maxByteSize (%d)", (uint8_t *)&v34, 0xEu);
    }
  }
  if (a7) {
    *a7 = v23;
  }
  if (v23 > a6)
  {
LABEL_25:
    uint64_t v30 = 0;
    goto LABEL_26;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v29 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      LOWORD(v34) = 0;
      _os_log_impl(&dword_22B280000, v29, OS_LOG_TYPE_INFO, "This image is a keeper, writing it out to url!", (uint8_t *)&v34, 2u);
    }
  }
  uint64_t v30 = objc_msgSend__writeImageData_inFormat_sourceURL_(self, v26, (uint64_t)v15, (uint64_t)a5, (uint64_t)v16, v27, v28);
  if (v30)
  {
    if (IMOSLoggingEnabled())
    {
      unint64_t v31 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        int v34 = 138412290;
        *(void *)uint64_t v35 = v30;
        _os_log_impl(&dword_22B280000, v31, OS_LOG_TYPE_INFO, "Saving %@ and breaking out of transcode loop", (uint8_t *)&v34, 0xCu);
      }
    }
    if (a8) {
      *a8 = a9;
    }
  }
LABEL_26:

  return v30;
}

- (void)copyAuxiliaryImagesFromImageSource:(CGImageSource *)a3 toDestination:(CGImageDestination *)a4 fromImageAtIndex:(unint64_t)a5 scaleFactor:(double)a6
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  uint64_t v11 = objc_msgSend_auxiliaryImagesToPreserveForDerivativesFromImageSource_imageIndex_(MEMORY[0x263F5DF08], a2, (uint64_t)a3, a5, a5, v6, v7);
  uint64_t v18 = objc_msgSend_count(v11, v12, v13, v14, v15, v16, v17);
  if (v11) {
    BOOL v23 = v18 == 0;
  }
  else {
    BOOL v23 = 1;
  }
  if (!v23)
  {
    uint64_t v24 = v18;
    uint64_t v25 = objc_msgSend_transformAuxiliaryImages_scaleFactor_applyingOrientation_(MEMORY[0x263F5DF08], v19, (uint64_t)v11, 1, v20, v21, v22, a6);
    if (IMOSLoggingEnabled())
    {
      unint64_t v31 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134219266;
        uint64_t v34 = v24;
        __int16 v35 = 2048;
        unint64_t v36 = a5;
        __int16 v37 = 2048;
        double v38 = a6;
        __int16 v39 = 1024;
        int v40 = 1;
        __int16 v41 = 2112;
        uint64_t v42 = v11;
        __int16 v43 = 2112;
        uint64_t v44 = v25;
        _os_log_impl(&dword_22B280000, v31, OS_LOG_TYPE_INFO, "Copying %zd aux images (index %zd scaleFactor %f orientation %d) from input %@, to output %@", buf, 0x3Au);
      }
    }
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = sub_22B28B714;
    v32[3] = &unk_26488E9E0;
    v32[4] = a4;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v25, v26, (uint64_t)v32, v27, v28, v29, v30);
  }
}

- (id)_writeImageData:(id)a3 inFormat:(__CFString *)a4 sourceURL:(id)a5
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  if (!v7)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v65 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
      {
        LOWORD(v69) = 0;
        _os_log_impl(&dword_22B280000, v65, OS_LOG_TYPE_INFO, "Cannot write out image because data is nil", (uint8_t *)&v69, 2u);
      }
      goto LABEL_23;
    }
LABEL_24:
    uint64_t v58 = 0;
    goto LABEL_38;
  }
  if (!a4)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v65 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
      {
        LOWORD(v69) = 0;
        _os_log_impl(&dword_22B280000, v65, OS_LOG_TYPE_INFO, "Cannot write out image because format is NULL", (uint8_t *)&v69, 2u);
      }
LABEL_23:

      goto LABEL_24;
    }
    goto LABEL_24;
  }
  id v9 = (__CFString *)UTTypeCopyPreferredTagWithClass(a4, (CFStringRef)*MEMORY[0x263F01910]);
  int v10 = IMOSLoggingEnabled();
  if (!v9)
  {
    if (v10)
    {
      uint64_t v66 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
      {
        LOWORD(v69) = 0;
        _os_log_impl(&dword_22B280000, v66, OS_LOG_TYPE_INFO, "Nil file extension, aborting writing of image", (uint8_t *)&v69, 2u);
      }
    }
    uint64_t v58 = 0;
    goto LABEL_37;
  }
  if (v10)
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v69 = 138412290;
      uint64_t v70 = v9;
      _os_log_impl(&dword_22B280000, v17, OS_LOG_TYPE_INFO, "Using file extension: %@", (uint8_t *)&v69, 0xCu);
    }
  }
  uint64_t v18 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v11, v12, v13, v14, v15, v16);
  uint64_t v25 = objc_msgSend_lastPathComponent(v8, v19, v20, v21, v22, v23, v24);
  unint64_t v32 = objc_msgSend_stringByDeletingPathExtension(v25, v26, v27, v28, v29, v30, v31);
  double v38 = objc_msgSend_stringByAppendingPathExtension_(v32, v33, (uint64_t)v9, v34, v35, v36, v37);
  uint64_t v44 = objc_msgSend_im_randomTemporaryFileURLWithFileName_(v18, v39, (uint64_t)v38, v40, v41, v42, v43);
  objc_msgSend_path(v44, v45, v46, v47, v48, v49, v50);
  uint64_t v51 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    uint64_t v57 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
    {
      int v69 = 138412290;
      uint64_t v70 = v51;
      _os_log_impl(&dword_22B280000, v57, OS_LOG_TYPE_INFO, "creating destination with output path: %@", (uint8_t *)&v69, 0xCu);
    }
  }
  if (!v51)
  {
    uint64_t v58 = 0;
LABEL_31:
    if (IMOSLoggingEnabled())
    {
      uint64_t v67 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
      {
        int v69 = 138412290;
        uint64_t v70 = v58;
        _os_log_impl(&dword_22B280000, v67, OS_LOG_TYPE_INFO, "Writing to url %@ failed", (uint8_t *)&v69, 0xCu);
      }
    }
    uint64_t v58 = 0;
    goto LABEL_36;
  }
  objc_msgSend_fileURLWithPath_(NSURL, v52, (uint64_t)v51, v53, v54, v55, v56);
  uint64_t v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v58) {
    goto LABEL_31;
  }
  uint64_t v59 = (void *)MEMORY[0x230F44180]();
  char v64 = objc_msgSend_writeToURL_atomically_(v7, v60, (uint64_t)v58, 1, v61, v62, v63);
  if ((v64 & 1) == 0) {
    goto LABEL_31;
  }
LABEL_36:

LABEL_37:
LABEL_38:

  return v58;
}

- (id)_writeImage:(CGImageSource *)a3 sourceURL:(id)a4 target:(int64_t)a5 hardwareEncoder:(id)a6 inFormat:(__CFString *)a7 fromFormat:(__CFString *)a8 withMaxByteSize:(unint64_t)a9 maxDimension:(unint64_t)a10 actualSize:(unint64_t *)a11 startingLengthIndex:(int)a12 usedLengthIndex:(int *)a13 estimator:(id)a14 isLQMEnabled:(BOOL)a15 telemetry:(id)a16
{
  uint64_t v261 = *MEMORY[0x263EF8340];
  id v247 = a4;
  id v246 = a6;
  id v251 = a14;
  id v239 = a16;
  v249 = a3;
  if (!a3)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v42 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22B280000, v42, OS_LOG_TYPE_INFO, "Invalid image source given to writeImage!", buf, 2u);
      }
      goto LABEL_32;
    }
LABEL_33:
    uint64_t v43 = 0;
    goto LABEL_152;
  }
  if (*(double *)&a7 == 0.0)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v42 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22B280000, v42, OS_LOG_TYPE_INFO, "Invalid destination format provided to writeImage", buf, 2u);
      }
LABEL_32:

      goto LABEL_33;
    }
    goto LABEL_33;
  }
  id v252 = a7;
  size_t Count = CGImageSourceGetCount(a3);
  *(double *)&CFDictionaryRef v244 = COERCE_DOUBLE(CGImageSourceCopyProperties(a3, 0));
  if (IMOSLoggingEnabled())
  {
    uint64_t v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      double v256 = *(double *)&v244;
      _os_log_impl(&dword_22B280000, v20, OS_LOG_TYPE_INFO, "Original image properties: %@", buf, 0xCu);
    }
  }
  uint64_t v21 = objc_opt_class();
  id v253 = 0;
  id v254 = 0;
  LargerDimensionFromImage_withProperties_toWidth_tosize_t Height = objc_msgSend_findLargerDimensionFromImage_withProperties_toWidth_toHeight_(v21, v22, (uint64_t)a3, (uint64_t)v244, (uint64_t)&v254, (uint64_t)&v253, v23);
  id v242 = v254;
  id v243 = v253;
  if (IMOSLoggingEnabled())
  {
    uint64_t v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413314;
      double v256 = *(double *)&a7;
      __int16 v257 = 1024;
      *(_DWORD *)v258 = a9;
      *(_WORD *)&v258[4] = 2048;
      *(void *)&v258[6] = a10;
      *(_WORD *)&v258[14] = 2112;
      *(void *)&v258[16] = v242;
      __int16 v259 = 2112;
      id v260 = v243;
      _os_log_impl(&dword_22B280000, v24, OS_LOG_TYPE_INFO, "Beginning transcode loop for image format %@ with maxByteSize %d maxDimension %zd width %@ height %@", buf, 0x30u);
    }
  }
  if (a13) {
    *a13 = -1;
  }
  CFStringRef v25 = (const __CFString *)*MEMORY[0x263F01A40];
  if (!UTTypeConformsTo(a7, (CFStringRef)*MEMORY[0x263F01A40]) || !UTTypeConformsTo(a8, v25)) {
    goto LABEL_47;
  }
  double v38 = objc_msgSend_objectForKey_(v244, v26, *MEMORY[0x263F0F360], v28, v29, v30, v31);
  if (v242) {
    BOOL v39 = v243 == 0;
  }
  else {
    BOOL v39 = 1;
  }
  char v40 = v39;
  if (v39)
  {
    double v45 = 1.79769313e308;
    double v41 = 1.79769313e308;
    if (!v38) {
      goto LABEL_43;
    }
  }
  else
  {
    objc_msgSend_doubleValue(v242, v32, v33, v34, v35, v36, v37);
    double v45 = v44;
    objc_msgSend_doubleValue(v243, v46, v47, v48, v49, v50, v51);
    double v41 = v52;
    if (!v38) {
      goto LABEL_43;
    }
  }
  float v53 = (float)(unint64_t)objc_msgSend_longValue(v38, v32, v33, v34, v35, v36, v37) / (float)a9;
  if (v53 <= 2.0) {
    char v54 = 1;
  }
  else {
    char v54 = v40;
  }
  if ((v54 & 1) == 0)
  {
    double v45 = v45 * 0.8;
    double v41 = v41 * 0.8;
    if (IMOSLoggingEnabled())
    {
      uint64_t v55 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218496;
        double v256 = v53;
        __int16 v257 = 2048;
        *(double *)v258 = v45;
        *(_WORD *)&v258[8] = 2048;
        *(double *)&v258[10] = v41;
        _os_log_impl(&dword_22B280000, v55, OS_LOG_TYPE_INFO, "Compressed input size is %.02f times larger than target output size, using initial scaled res of %.02f %.02f", buf, 0x20u);
      }
    }
  }
LABEL_43:
  uint64_t v56 = sub_22B28CAE4(v249, a9, v45, v41);
  if (objc_msgSend_length(v56, v57, v58, v59, v60, v61, v62) >= a9)
  {
  }
  else
  {
    uint64_t v43 = objc_msgSend__writeImageData_inFormat_sourceURL_(self, v63, (uint64_t)v56, (uint64_t)a7, (uint64_t)v247, v64, v65);

    if (v43) {
      goto LABEL_151;
    }
  }
LABEL_47:
  uint64_t v66 = objc_msgSend_sharedFeatureFlags(MEMORY[0x263F4AF80], v26, v27, v28, v29, v30, v31);
  int isLQMImageQualityEstimatorEnabled = objc_msgSend_isLQMImageQualityEstimatorEnabled(v66, v67, v68, v69, v70, v71, v72);

  if (isLQMImageQualityEstimatorEnabled)
  {
    uint64_t v238 = 0;
    int v79 = 0;
    int v80 = -1;
    if (UTTypeConformsTo(a8, @"public.heic") && a15)
    {
      uint64_t v238 = objc_msgSend_getInputImageFeatures_(IMTranscoderImageQualityEstimator, v74, (uint64_t)v249, v75, v76, v77, v78);
      if (v238)
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v81 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22B280000, v81, OS_LOG_TYPE_INFO, "Use image quality estimator model for getting low quality image.", buf, 2u);
          }
        }
        int v80 = 0;
        int v79 = 1;
      }
      else
      {
        int v79 = 0;
        uint64_t v238 = 0;
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      size_t v82 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22B280000, v82, OS_LOG_TYPE_INFO, "Legacy iMessage estimator to be used for getting low quality image.", buf, 2u);
      }
    }
    int v79 = 0;
    uint64_t v238 = 0;
    int v80 = -1;
  }
  CFStringRef inConformsToUTI = (const __CFString *)*MEMORY[0x263F01AE0];
  CFStringRef v236 = (const __CFString *)*MEMORY[0x263F01A80];
  while (1)
  {
    context = (void *)MEMORY[0x230F44180]();
    unint64_t v83 = LargerDimensionFromImage_withProperties_toWidth_toHeight;
    if (v80 < 0) {
      break;
    }
    unint64_t v83 = dword_22B2A0A78[v80];
    BOOL v84 = !LargerDimensionFromImage_withProperties_toWidth_toHeight
       || LargerDimensionFromImage_withProperties_toWidth_toHeight >= v83;
    BOOL v85 = !v84;
    BOOL v86 = v83 <= a10 || a10 == 0;
    if (v86 && !v85) {
      break;
    }
LABEL_146:
    if (v80++ >= 25)
    {

      if (IMOSLoggingEnabled())
      {
        v231 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v231, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22B280000, v231, OS_LOG_TYPE_INFO, "Warning! Did not find a valid size for this image given the filesize constraint!", buf, 2u);
        }
      }
      uint64_t v43 = 0;
      goto LABEL_151;
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v87 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218496;
      double v256 = *(double *)&v83;
      __int16 v257 = 1024;
      *(_DWORD *)v258 = v80;
      *(_WORD *)&v258[4] = 1024;
      *(_DWORD *)&v258[6] = 26;
      _os_log_impl(&dword_22B280000, v87, OS_LOG_TYPE_INFO, "Trying maxSize = %lu  (index: %d/%d)", buf, 0x18u);
    }
  }
  if (v80 > 2) {
    int v88 = -1;
  }
  else {
    int v88 = 2;
  }
  int v245 = v88;
  if (CGImageSourceGetCount(v249) >= 2 && UTTypeConformsTo(a8, inConformsToUTI))
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v89 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v256) = 8;
        _os_log_impl(&dword_22B280000, v89, OS_LOG_TYPE_INFO, "Overrriding subsampling to %d for APNG", buf, 8u);
      }
    }
    int v245 = 8;
  }
  if (UTTypeConformsTo(v252, v236))
  {
    if (UTTypeConformsTo(a8, v236)) {
      uint64_t v96 = 2;
    }
    else {
      uint64_t v96 = 1;
    }
  }
  else
  {
    uint64_t v96 = 1;
  }
  uint64_t v97 = (float *)&dword_22B2A0AE0;
  while (1)
  {
    float v98 = *v97;
    objc_msgSend_overrideJPEGCompressionQuality(self, v90, v91, v92, v93, v94, v95);
    if (v105 == 0.0)
    {
      double v107 = v98;
    }
    else
    {
      objc_msgSend_overrideJPEGCompressionQuality(self, v99, v100, v101, v102, v103, v104);
      double v107 = v106;
    }
    uint64_t v108 = objc_msgSend_sharedFeatureFlags(MEMORY[0x263F4AF80], v99, v100, v101, v102, v103, v104);
    int v115 = objc_msgSend_isLQMImageQualityEstimatorEnabled(v108, v109, v110, v111, v112, v113, v114);

    if (v115) {
      break;
    }
    *(double *)&unint64_t v142 = COERCE_DOUBLE(objc_msgSend_estimatedSizeForOutputUTI_maximumDimension_quality_(v251, v116, (uint64_t)v252, v83, v118, v119, v120, v107));
    if (v142 <= a9)
    {
      LOBYTE(v127) = 0;
      goto LABEL_121;
    }
    if (IMOSLoggingEnabled())
    {
      shouldSkipAuxillaryData = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(shouldSkipAuxillaryData, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        double v256 = *(double *)&v142;
        __int16 v257 = 2048;
        *(void *)v258 = a9;
        _os_log_impl(&dword_22B280000, shouldSkipAuxillaryData, OS_LOG_TYPE_INFO, "Estimated size %lu is larger than required size %lu, skipping", buf, 0x16u);
      }
      goto LABEL_132;
    }
LABEL_133:
    ++v97;
    if (!--v96) {
      goto LABEL_146;
    }
  }
  uint64_t v121 = objc_msgSend_numberWithInteger_(NSNumber, v116, v83, v117, v118, v119, v120);
  int v127 = objc_msgSend_containsObject_(&unk_26DE89610, v122, (uint64_t)v121, v123, v124, v125, v126);

  if ((v79 & v127) == 1)
  {
    double v132 = CACurrentMediaTime();
    objc_msgSend_predictQualityFactor_suggestedMaxLength_(IMTranscoderImageQualityEstimator, v133, (uint64_t)v238, v83, v134, v135, v136);
    double v107 = v137;
    double v138 = CACurrentMediaTime();
    if (IMOSLoggingEnabled())
    {
      uint64_t v139 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v139, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        double v256 = v138 - v132;
        _os_log_impl(&dword_22B280000, v139, OS_LOG_TYPE_INFO, "Prediction Time taken by image quality estimator: %f", buf, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v141 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v141, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        double v256 = v107;
        _os_log_impl(&dword_22B280000, v141, OS_LOG_TYPE_INFO, "[v5.1]Estimated quality factor for image when LQM is enabled: %lf", buf, 0xCu);
      }
    }
    if (v107 < 0.45)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v190 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v190, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          double v256 = v107;
          _os_log_impl(&dword_22B280000, v190, OS_LOG_TYPE_INFO, "Estimated quality factor is less than pivot : %lf, try for lower dimension.", buf, 0xCu);
        }
      }
      uint64_t v191 = objc_msgSend_lastObject(&unk_26DE89610, v184, v185, v186, v187, v188, v189);
      BOOL v198 = v83 == objc_msgSend_integerValue(v191, v192, v193, v194, v195, v196, v197);

      if (v198)
      {
        v80 -= objc_msgSend_count(&unk_26DE89610, v90, v91, v92, v93, v94, v95);
        if (IMOSLoggingEnabled())
        {
          uint64_t v199 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v199, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            double v256 = v107;
            _os_log_impl(&dword_22B280000, v199, OS_LOG_TYPE_INFO, "Estimated quality factor is less than pivot : %lf for the lowest model supported dimension. Fallback to iMessage estimator.", buf, 0xCu);
          }
        }
        int v79 = 0;
      }
      else
      {
        int v79 = 1;
      }
      goto LABEL_133;
    }
    LOBYTE(v127) = 1;
  }
  else
  {
    *(double *)&unint64_t v144 = COERCE_DOUBLE(objc_msgSend_estimatedSizeForOutputUTI_maximumDimension_quality_(v251, v128, (uint64_t)v252, v83, v129, v130, v131, v107));
    if (v144 > a9)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v145 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v145, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          double v256 = *(double *)&v144;
          __int16 v257 = 2048;
          *(void *)v258 = a9;
          _os_log_impl(&dword_22B280000, v145, OS_LOG_TYPE_INFO, "Estimated size %lu is larger than required size %lu, skipping", buf, 0x16u);
        }
      }
      goto LABEL_133;
    }
  }
LABEL_121:
  LOBYTE(v234) = v79 & v127;
  HIDWORD(v233) = v245;
  LOBYTE(v233) = v80 < 0x19;
  shouldSkipAuxillaryData = objc_msgSend__newGeneratedImage_sourceWidth_sourceHeight_sourceLength_sourceProps_target_hardwareEncoder_inFormat_fromFormat_withMaxLength_withMaxCount_withCompressionQuality_enforceMaxes_subsampling_shouldSkipAuxillaryData_(self, v140, (uint64_t)v249, (uint64_t)v242, (uint64_t)v243, LargerDimensionFromImage_withProperties_toWidth_toHeight, (uint64_t)v244, a5, v107, v246, v252, a8, v83, Count, v233, v234);
  LODWORD(v232) = v80;
  uint64_t v43 = objc_msgSend__checkAndSaveImageData_sourceURL_inFormat_withMaxByteSize_actualSize_usedLengthIndex_currentIndex_(self, v146, (uint64_t)shouldSkipAuxillaryData, (uint64_t)v247, (uint64_t)v252, a9, (uint64_t)a11, a13, v232);
  id v153 = objc_msgSend_sharedFeatureFlags(MEMORY[0x263F4AF80], v147, v148, v149, v150, v151, v152);
  int v160 = objc_msgSend_isLQMImageQualityEstimatorEnabled(v153, v154, v155, v156, v157, v158, v159);

  if ((v160 & v79) == 1 && !v43)
  {
    uint64_t v167 = objc_msgSend_lastObject(&unk_26DE89610, v161, v162, v163, v164, v165, v166);
    BOOL v174 = v83 == objc_msgSend_integerValue(v167, v168, v169, v170, v171, v172, v173);

    if (v174)
    {
      v80 -= objc_msgSend_count(&unk_26DE89610, v161, v175, v163, v164, v165, v166);
      if (IMOSLoggingEnabled())
      {
        uint64_t v176 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v176, OS_LOG_TYPE_INFO))
        {
          *(double *)&uint64_t v183 = COERCE_DOUBLE(objc_msgSend_length(shouldSkipAuxillaryData, v177, v178, v179, v180, v181, v182));
          *(_DWORD *)buf = 134217984;
          double v256 = *(double *)&v183;
          _os_log_impl(&dword_22B280000, v176, OS_LOG_TYPE_INFO, "Transcoded Image size of %lu is greater than the LQM maxLimit using image quality estimator model. Fallback to iMessage legacy estimator.", buf, 0xCu);
        }
      }
      int v79 = 0;
LABEL_132:

      goto LABEL_133;
    }
LABEL_130:
    if (shouldSkipAuxillaryData) {
      objc_msgSend_emitSignpostTranscodeStepForDestinationUTI_(v239, v161, (uint64_t)v252, v163, v164, v165, v166);
    }
    goto LABEL_132;
  }
  if (!v43) {
    goto LABEL_130;
  }
  objc_msgSend_emitSignpostTranscodeFinalForDestinationUTI_(v239, v161, (uint64_t)v252, v163, v164, v165, v166);

  v207 = objc_msgSend_sharedFeatureFlags(MEMORY[0x263F4AF80], v201, v202, v203, v204, v205, v206);
  unsigned __int8 v214 = objc_msgSend_isLQMImageQualityEstimatorEnabled(v207, v208, v209, v210, v211, v212, v213);

  if (v214 & a15)
  {
    uint64_t v217 = objc_msgSend__imMetricsCollectorForLQMQualityEstimatorModel_suggestedMaxLength_shouldUseQualityEstimatorModel_inputImageFeatures_(self, v215, (uint64_t)a8, v83, v79 & 1, (uint64_t)v238, v216);
    uint64_t v224 = objc_msgSend_sharedInstance(MEMORY[0x263F4AFD0], v218, v219, v220, v221, v222, v223);
    objc_msgSend_trackEvent_withDictionary_(v224, v225, *MEMORY[0x263F4AD10], (uint64_t)v217, v226, v227, v228);
  }

LABEL_151:
LABEL_152:

  return v43;
}

- (id)_writeRepresentationsForImage:(CGImageSource *)a3 target:(int64_t)a4 sourceURL:(id)a5 sizes:(id)a6 maxDimension:(unint64_t)a7 srcUTI:(__CFString *)a8 inFormat:(__CFString *)a9 downgradingMultiFrameImageToSingleFrame:(BOOL)a10 estimator:(id)a11 isLQMEnabled:(BOOL)a12 telemetry:(id)a13
{
  uint64_t v213 = *MEMORY[0x263EF8340];
  id v204 = a5;
  uint64_t v16 = (__CFString *)a6;
  id v198 = a11;
  inUTI = a8;
  id v200 = a13;
  char v23 = 0;
  if (a8 && a9)
  {
    CFStringRef v24 = (const __CFString *)*MEMORY[0x263F01A80];
    if (CFEqual(a9, (CFTypeRef)*MEMORY[0x263F01A80]))
    {
      int v25 = UTTypeConformsTo(a8, v24);
      char v23 = 0;
      if (a4 != 1 && v25)
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v26 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22B280000, v26, OS_LOG_TYPE_INFO, "Will use hardware JPEG encoding", buf, 2u);
          }
        }
        char v23 = 1;
      }
    }
    else
    {
      char v23 = 0;
    }
  }
  objc_msgSend_array(MEMORY[0x263EFF980], v17, v18, v19, v20, v21, v22);
  uint64_t v27 = (__CFArray *)objc_claimAutoreleasedReturnValue();
  uint64_t v34 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v28, v29, v30, v31, v32, v33);
  double v41 = objc_msgSend_path(v204, v35, v36, v37, v38, v39, v40);
  id v207 = 0;
  uint64_t v46 = objc_msgSend_attributesOfItemAtPath_error_(v34, v42, (uint64_t)v41, (uint64_t)&v207, v43, v44, v45);
  id v194 = v207;
  unint64_t v201 = objc_msgSend_fileSize(v46, v47, v48, v49, v50, v51, v52);

  uint64_t v206 = (__CFString *)v201;
  uint64_t v58 = objc_msgSend_objectAtIndexedSubscript_(v16, v53, 0, v54, v55, v56, v57);
  unint64_t v65 = objc_msgSend_unsignedLongValue(v58, v59, v60, v61, v62, v63, v64);

  if (IMOSLoggingEnabled())
  {
    uint64_t v71 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218498;
      uint64_t v209 = (__CFString *)v201;
      __int16 v210 = 2112;
      *(void *)uint64_t v211 = v194;
      *(_WORD *)&v211[8] = 2112;
      uint64_t v212 = v16;
      _os_log_impl(&dword_22B280000, v71, OS_LOG_TYPE_INFO, "Generating the representations, originalSize %ld (err %@) sizes %@", buf, 0x20u);
    }
  }
  int isWideGamutImage = objc_msgSend__isWideGamutImage_(self, v66, (uint64_t)a3, v67, v68, v69, v70);
  unint64_t v73 = 0;
  if (v194) {
    int v74 = 0;
  }
  else {
    int v74 = isWideGamutImage;
  }
  if (v74 == 1 && v201 < v65)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v76 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v209 = (__CFString *)v201;
        __int16 v210 = 2048;
        *(void *)uint64_t v211 = v65;
        _os_log_impl(&dword_22B280000, v76, OS_LOG_TYPE_INFO, "Attempting copy+add props for size %lu (reason: the source is wide gamut and smaller than the limit %lu)", buf, 0x16u);
      }
    }
    objc_msgSend__wideGamutImage_sourceURL_inFormat_withMaxByteSize_maxDimension_actualSize_telemetry_(self, v75, (uint64_t)a3, (uint64_t)v204, (uint64_t)a9, v65, a7, &v206, v200);
    uint64_t v77 = (__CFString *)objc_claimAutoreleasedReturnValue();
    int v78 = IMOSLoggingEnabled();
    if (v77)
    {
      if (v78)
      {
        int v79 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v209 = v77;
          _os_log_impl(&dword_22B280000, v79, OS_LOG_TYPE_INFO, "Using original wide-gamut image with added properties answerImageURL: %@", buf, 0xCu);
        }
      }
      if (v27) {
        CFArrayAppendValue(v27, v77);
      }
      unint64_t v73 = 1;
    }
    else
    {
      if (v78)
      {
        int v80 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          uint64_t v209 = v206;
          __int16 v210 = 2048;
          *(void *)uint64_t v211 = v65;
          _os_log_impl(&dword_22B280000, v80, OS_LOG_TYPE_INFO, "Couldn't use copy of wide-gamut image with added properties (size %ld max %ld), transcoding", buf, 0x16u);
        }
      }
      unint64_t v73 = 0;
      unint64_t v201 = (unint64_t)v206;
    }
  }
  char v81 = v23 ^ 1;
  if (!v204) {
    char v81 = 1;
  }
  if (v81)
  {
    uint64_t v197 = 0;
  }
  else
  {
    id v82 = objc_alloc(MEMORY[0x263EFF8F8]);
    BOOL v86 = objc_msgSend_initWithContentsOfURL_options_error_(v82, v83, (uint64_t)v204, 1, 0, v84, v85);
    if (objc_msgSend_length(v86, v87, v88, v89, v90, v91, v92))
    {
      uint64_t v93 = [IMEmbeddedHardwareJPEGTranscoder alloc];
      uint64_t v197 = objc_msgSend_initWithImageData_imageSource_(v93, v94, (uint64_t)v86, (uint64_t)a3, v95, v96, v97);
    }
    else
    {
      uint64_t v197 = 0;
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v104 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v104, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v209 = v16;
      __int16 v210 = 2048;
      *(void *)uint64_t v211 = v201;
      _os_log_impl(&dword_22B280000, v104, OS_LOG_TYPE_INFO, "Beginning to transcode images with size limits: %@ originalFileSize %lu", buf, 0x16u);
    }
  }
  if (v73 < objc_msgSend_count(v16, v98, v99, v100, v101, v102, v103))
  {
    unsigned int v105 = 0;
    if (v194) {
      BOOL v106 = 1;
    }
    else {
      BOOL v106 = v201 == 0;
    }
    int v107 = !v106;
    int v195 = v107;
    while (1)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v113 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v113, OS_LOG_TYPE_INFO))
        {
          uint64_t v119 = objc_msgSend_objectAtIndexedSubscript_(v16, v114, v73, v115, v116, v117, v118);
          *(_DWORD *)buf = 134218242;
          uint64_t v209 = (__CFString *)v73;
          __int16 v210 = 2112;
          *(void *)uint64_t v211 = v119;
          _os_log_impl(&dword_22B280000, v113, OS_LOG_TYPE_INFO, "Trying to transcode to target size index %lu size limit %@", buf, 0x16u);
        }
      }
      if (v105 >= 0x1A)
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v180 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v180, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v209) = v105;
            _os_log_impl(&dword_22B280000, v180, OS_LOG_TYPE_INFO, "Transcoding: Aborting further transcoding attempts: current image resize index is %d.", buf, 8u);
          }
        }
        goto LABEL_151;
      }
      uint64_t v120 = objc_msgSend_objectAtIndexedSubscript_(v16, v108, v73, v109, v110, v111, v112);
      unint64_t v127 = objc_msgSend_unsignedLongValue(v120, v121, v122, v123, v124, v125, v126);

      if (!v73) {
        break;
      }
      uint64_t v133 = objc_msgSend_objectAtIndexedSubscript_(v16, v128, v73 - 1, v129, v130, v131, v132);
      BOOL v140 = objc_msgSend_unsignedLongValue(v133, v134, v135, v136, v137, v138, v139) == v127;

      if (!v140)
      {
        uint64_t v148 = (void *)MEMORY[0x230F44180]();
        if ((unint64_t)v206 > v127)
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v151 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v151, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134218240;
              uint64_t v209 = (__CFString *)v127;
              __int16 v210 = 2048;
              *(void *)uint64_t v211 = v206;
              _os_log_impl(&dword_22B280000, v151, OS_LOG_TYPE_INFO, "Transcoding at size %tu (the previous size is %tu)", buf, 0x16u);
            }
            goto LABEL_122;
          }
LABEL_132:
          unsigned int v205 = v105;
          LOBYTE(v193) = a12;
          LODWORD(v192) = v105;
          objc_msgSend__writeImage_sourceURL_target_hardwareEncoder_inFormat_fromFormat_withMaxByteSize_maxDimension_actualSize_startingLengthIndex_usedLengthIndex_estimator_isLQMEnabled_telemetry_(self, v150, (uint64_t)a3, (uint64_t)v204, a4, (uint64_t)v197, (uint64_t)a9, inUTI, v127, a7, &v206, v192, &v205, v198, v193, v200);
          uint64_t v170 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (IMOSLoggingEnabled())
          {
            uint64_t v178 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v178, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412802;
              uint64_t v209 = v170;
              __int16 v210 = 1024;
              *(_DWORD *)uint64_t v211 = v105;
              *(_WORD *)&v211[4] = 1024;
              *(_DWORD *)&v211[6] = v205;
              _os_log_impl(&dword_22B280000, v178, OS_LOG_TYPE_INFO, "Transcoding result URL: %@ (start/stop length index: %d => %d)", buf, 0x18u);
            }
          }
          unsigned int v105 = v205 + 1;
LABEL_137:
          if (IMOSLoggingEnabled())
          {
            uint64_t v179 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v179, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v209 = (__CFString *)v27;
              __int16 v210 = 2112;
              *(void *)uint64_t v211 = v170;
              _os_log_impl(&dword_22B280000, v179, OS_LOG_TYPE_INFO, "answer: %@ answerImageURL: %@", buf, 0x16u);
            }
          }
          if (v27 && v170) {
            CFArrayAppendValue(v27, v170);
          }

          goto LABEL_145;
        }
LABEL_123:
        uint64_t v170 = 0;
LABEL_124:
        if (IMOSLoggingEnabled())
        {
          uint64_t v177 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v177, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v209 = (__CFString *)v127;
            _os_log_impl(&dword_22B280000, v177, OS_LOG_TYPE_INFO, "Not transcoding an image for size: %tu", buf, 0xCu);
          }
        }
        goto LABEL_137;
      }
      if (IMOSLoggingEnabled())
      {
        int v147 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v147, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v209 = (__CFString *)v127;
          _os_log_impl(&dword_22B280000, v147, OS_LOG_TYPE_INFO, "Aborting transcoding attempt: current size limit %tu is the same as the previous size.", buf, 0xCu);
        }
      }
LABEL_145:
      if (++v73 >= objc_msgSend_count(v16, v141, v142, v143, v144, v145, v146)) {
        goto LABEL_151;
      }
    }
    uint64_t v148 = (void *)MEMORY[0x230F44180]();
    if (v201 <= v127) {
      int v149 = v195;
    }
    else {
      int v149 = 0;
    }
    if (a4 == 1)
    {
      if (!IMOSLoggingEnabled()) {
        goto LABEL_132;
      }
      uint64_t v151 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v151, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v209 = (__CFString *)v127;
        _os_log_impl(&dword_22B280000, v151, OS_LOG_TYPE_INFO, "Transcoding large size %tu (reason: the target is MMS).", buf, 0xCu);
      }
      goto LABEL_122;
    }
    CFStringRef Type = CGImageSourceGetType(a3);
    if (objc_msgSend__isHEIFImageFormat_(self, v153, (uint64_t)Type, v154, v155, v156, v157)
      && (objc_msgSend__isHEIFImageFormat_(self, v158, (uint64_t)a9, v159, v160, v161, v162) & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v171 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v171, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v209 = (__CFString *)v127;
          _os_log_impl(&dword_22B280000, v171, OS_LOG_TYPE_INFO, "Transcoding to size %tu (reason: the source is HEIF).", buf, 0xCu);
        }
      }
      if ((double)v201 * 2.5 <= (double)v127) {
        int v172 = v195;
      }
      else {
        int v172 = 0;
      }
      int v173 = IMOSLoggingEnabled();
      if (v172)
      {
        if (v173)
        {
          BOOL v174 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v174, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22B280000, v174, OS_LOG_TYPE_INFO, "Transcoded size fits within the max limit so only writing URL for wide gamut properties", buf, 2u);
          }
        }
        *(_DWORD *)buf = v105;
        LODWORD(v191) = v105;
        objc_msgSend__writeHEIFImage_sourceURL_inFormat_withMaxByteSize_maxDimension_downgradingMultiFrameImageToSingleFrame_actualSize_startingLengthIndex_usedLengthIndex_telemetry_(self, v150, (uint64_t)a3, (uint64_t)v204, (uint64_t)a9, v127, a7, a10, &v206, v191, buf, v200);
        uint64_t v170 = (__CFString *)objc_claimAutoreleasedReturnValue();
        unsigned int v105 = *(_DWORD *)buf + 1;
        if (!v170) {
          goto LABEL_132;
        }
        goto LABEL_124;
      }
      if (!v173) {
        goto LABEL_132;
      }
      uint64_t v175 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v175, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22B280000, v175, OS_LOG_TYPE_INFO, "Original size is larger than max limit so needs transcoding", buf, 2u);
      }
    }
    else
    {
      if (!objc_msgSend__isHEIFImageFormat_(self, v158, (uint64_t)a9, v159, v160, v161, v162)
        || (CFStringRef v163 = CGImageSourceGetType(a3),
            (objc_msgSend__isHEIFImageFormat_(self, v164, (uint64_t)v163, v165, v166, v167, v168) & 1) != 0))
      {
        if (UTTypeEqual(a9, inUTI))
        {
          if (v149)
          {
            if (IMOSLoggingEnabled())
            {
              uint64_t v169 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v169, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 134218240;
                uint64_t v209 = (__CFString *)v127;
                __int16 v210 = 2048;
                *(void *)uint64_t v211 = v201;
                _os_log_impl(&dword_22B280000, v169, OS_LOG_TYPE_INFO, "Given size limit %lu is already greater than the original file size %lu.", buf, 0x16u);
              }
            }
            uint64_t v170 = (__CFString *)v204;
            goto LABEL_124;
          }
          int v176 = v195;
          if (v201 <= v127) {
            int v176 = 0;
          }
          if (v176 != 1) {
            goto LABEL_123;
          }
          if (!IMOSLoggingEnabled()) {
            goto LABEL_132;
          }
          uint64_t v151 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v151, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218240;
            uint64_t v209 = (__CFString *)v201;
            __int16 v210 = 2048;
            *(void *)uint64_t v211 = v127;
            _os_log_impl(&dword_22B280000, v151, OS_LOG_TYPE_INFO, "Original file size limit %lu is bigger than target size %lu", buf, 0x16u);
          }
        }
        else
        {
          if (!IMOSLoggingEnabled()) {
            goto LABEL_132;
          }
          uint64_t v151 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v151, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v209 = a9;
            __int16 v210 = 2112;
            *(void *)uint64_t v211 = inUTI;
            _os_log_impl(&dword_22B280000, v151, OS_LOG_TYPE_INFO, "Destination (%@) and source (%@) UTIs do not match, so transcoding", buf, 0x16u);
          }
        }
LABEL_122:

        goto LABEL_132;
      }
      if (!IMOSLoggingEnabled()) {
        goto LABEL_132;
      }
      uint64_t v175 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v175, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22B280000, v175, OS_LOG_TYPE_INFO, "Original is not HEIF, we want to send HEIF, so transcoding", buf, 2u);
      }
    }

    goto LABEL_132;
  }
LABEL_151:
  if (IMOSLoggingEnabled())
  {
    uint64_t v181 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v181, OS_LOG_TYPE_INFO))
    {
      uint64_t v188 = objc_msgSend_count(v27, v182, v183, v184, v185, v186, v187);
      *(_DWORD *)buf = 134218242;
      uint64_t v209 = (__CFString *)v188;
      __int16 v210 = 2112;
      *(void *)uint64_t v211 = v27;
      _os_log_impl(&dword_22B280000, v181, OS_LOG_TYPE_INFO, "Finished transcoding images with %tu results: %@", buf, 0x16u);
    }
  }
  uint64_t v189 = v27;

  return v189;
}

- (id)_wideGamutImage:(CGImageSource *)a3 sourceURL:(id)a4 inFormat:(__CFString *)a5 withMaxByteSize:(unint64_t)a6 maxDimension:(unint64_t)a7 actualSize:(unint64_t *)a8 telemetry:(id)a9
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v65 = a4;
  id v66 = a9;
  size_t Count = CGImageSourceGetCount(a3);
  context = (void *)MEMORY[0x230F44180]();
  if (IMOSLoggingEnabled())
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      size_t v69 = Count;
      _os_log_impl(&dword_22B280000, v13, OS_LOG_TYPE_INFO, "Trying to copy wide gamut properties with original image size_t count = %zu", buf, 0xCu);
    }
  }
  data = (__CFData *)objc_alloc_init(MEMORY[0x263EFF990]);
  uint64_t v14 = CGImageDestinationCreateWithData(data, a5, Count, 0);
  int v15 = IMOSLoggingEnabled();
  if (!v14)
  {
    if (v15)
    {
      uint64_t v46 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22B280000, v46, OS_LOG_TYPE_INFO, "Cannot set gamut properties because imageDestination is NULL", buf, 2u);
      }
    }
    goto LABEL_48;
  }
  if (v15)
  {
    uint64_t v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      size_t v69 = Count;
      _os_log_impl(&dword_22B280000, v16, OS_LOG_TYPE_INFO, " ==> Image size_t Count = %zu", buf, 0xCu);
    }
  }
  if (Count)
  {
    for (size_t i = 0; i != Count; ++i)
    {
      uint64_t v18 = (void *)MEMORY[0x230F44180]();
      CFDictionaryRef v19 = CGImageSourceCopyPropertiesAtIndex(a3, i, 0);
      CFDictionaryRef v26 = (const __CFDictionary *)objc_msgSend_mutableCopy(v19, v20, v21, v22, v23, v24, v25);

      CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(a3, i, 0);
      if (IMOSLoggingEnabled())
      {
        uint64_t v33 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          uint64_t v34 = @"YES";
          if (!ImageAtIndex) {
            uint64_t v34 = @"NO";
          }
          *(_DWORD *)buf = 138412290;
          size_t v69 = (size_t)v34;
          _os_log_impl(&dword_22B280000, v33, OS_LOG_TYPE_INFO, "adding image properties for wide gamut properties only. Created scaled image: %@", buf, 0xCu);
        }
      }
      if ((objc_msgSend__isHEIFImageFormat_(self, v28, (uint64_t)a5, v29, v30, v31, v32) & 1) == 0) {
        objc_msgSend__setWideGamutProperties_scaledImage_(self, v35, (uint64_t)v26, (uint64_t)ImageAtIndex, v36, v37, v38);
      }
      int v39 = IMOSLoggingEnabled();
      if (ImageAtIndex)
      {
        if (v39)
        {
          uint64_t v40 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            size_t v69 = i;
            _os_log_impl(&dword_22B280000, v40, OS_LOG_TYPE_INFO, "adding scaled image at index %lu", buf, 0xCu);
          }
        }
        if (IMOSLoggingEnabled())
        {
          double v41 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            size_t v69 = (size_t)v26;
            _os_log_impl(&dword_22B280000, v41, OS_LOG_TYPE_INFO, "  properties: %@", buf, 0xCu);
          }
        }
        CGImageDestinationAddImage(v14, ImageAtIndex, v26);
        objc_msgSend_copyAuxiliaryImagesFromImageSource_toDestination_fromImageAtIndex_scaleFactor_(self, v42, (uint64_t)a3, (uint64_t)v14, i, v43, v44, 1.0);
        CGImageRelease(ImageAtIndex);
      }
      else if (v39)
      {
        uint64_t v45 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          size_t v69 = i;
          _os_log_impl(&dword_22B280000, v45, OS_LOG_TYPE_INFO, "Failed adding scaled image at index (%zd)!", buf, 0xCu);
        }
      }
    }
  }
  if (!CGImageDestinationFinalize(v14))
  {
    CFRelease(v14);
LABEL_48:

    float v53 = 0;
    goto LABEL_49;
  }
  float v53 = objc_msgSend__checkAndSaveImageData_sourceURL_inFormat_withMaxByteSize_actualSize_usedLengthIndex_currentIndex_(self, v47, (uint64_t)data, (uint64_t)v65, (uint64_t)a5, a6, (uint64_t)a8, 0, -1);
  if (v53)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v59 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        size_t v69 = (size_t)v53;
        _os_log_impl(&dword_22B280000, v59, OS_LOG_TYPE_INFO, "Success copying wide gamut image w/ props to url: %@", buf, 0xCu);
      }
    }
    objc_msgSend_emitSignpostTranscodeFinalForDestinationUTI_(v66, v54, (uint64_t)a5, v55, v56, v57, v58);
    CFRelease(v14);
  }
  else
  {
    objc_msgSend_emitSignpostTranscodeStepForDestinationUTI_(v66, v48, (uint64_t)a5, v49, v50, v51, v52);
    CFRelease(v14);

    if (IMOSLoggingEnabled())
    {
      uint64_t v61 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22B280000, v61, OS_LOG_TYPE_INFO, "Failed to copy an image url for a wide gamut transformation", buf, 2u);
      }
    }
  }
LABEL_49:

  return v53;
}

- (id)_writeHEIFImage:(CGImageSource *)a3 sourceURL:(id)a4 inFormat:(__CFString *)a5 withMaxByteSize:(unint64_t)a6 maxDimension:(unint64_t)a7 downgradingMultiFrameImageToSingleFrame:(BOOL)a8 actualSize:(unint64_t *)a9 startingLengthIndex:(int)a10 usedLengthIndex:(int *)a11 telemetry:(id)a12
{
  BOOL v91 = a8;
  unsigned int v15 = a10;
  *(void *)((char *)&v101[2] + 2) = *MEMORY[0x263EF8340];
  id v87 = a4;
  id v86 = a12;
  if (a10 >= 0x1A) {
    unsigned int v15 = 0;
  }
  size_t Count = CGImageSourceGetCount(a3);
  if (!a7) {
    goto LABEL_7;
  }
  uint64_t v16 = &dword_22B2A0A78[v15--];
  do
  {
    unint64_t v17 = *v16++;
    ++v15;
  }
  while (v17 > a7);
  if (v15 > 0x19)
  {
LABEL_57:
    if (IMOSLoggingEnabled())
    {
      unint64_t v73 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22B280000, v73, OS_LOG_TYPE_INFO, "Failed to generate an image url for a wide gamut transformation", buf, 2u);
      }
    }
  }
  else
  {
LABEL_7:
    uint64_t v94 = v15;
    double v18 = (double)a7;
    uint64_t v83 = *MEMORY[0x263F0F638];
    uint64_t v84 = *MEMORY[0x263F0F5A8];
    unint64_t v89 = a7;
    while (1)
    {
      context = (void *)MEMORY[0x230F44180]();
      uint64_t v19 = dword_22B2A0A78[v94];
      size_t v20 = dword_22B2A0AE8[v94];
      if (a7) {
        double v21 = (double)(unint64_t)v19 / v18;
      }
      else {
        double v21 = 1.0;
      }
      if (Count >= v20) {
        uint64_t v22 = dword_22B2A0AE8[v94];
      }
      else {
        uint64_t v22 = Count;
      }
      if (v91) {
        size_t v23 = 1;
      }
      else {
        size_t v23 = v22;
      }
      if (IMOSLoggingEnabled())
      {
        uint64_t v24 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218496;
          size_t v99 = v20;
          __int16 v100 = 1024;
          LODWORD(v101[0]) = v94;
          WORD2(v101[0]) = 2048;
          *(void *)((char *)v101 + 6) = Count;
          _os_log_impl(&dword_22B280000, v24, OS_LOG_TYPE_INFO, "Trying to copy wide gamut properties for index maxSize = %lu (index: %d) with original image size_t count = %zu", buf, 0x1Cu);
        }
      }
      uint64_t v93 = (__CFData *)objc_alloc_init(MEMORY[0x263EFF990]);
      uint64_t v25 = CGImageDestinationCreateWithData(v93, a5, v23, 0);
      int v26 = IMOSLoggingEnabled();
      if (!v25) {
        break;
      }
      if (v26)
      {
        uint64_t v32 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          size_t v99 = v23;
          __int16 v100 = 2048;
          v101[0] = v19;
          _os_log_impl(&dword_22B280000, v32, OS_LOG_TYPE_INFO, " ==> Image size_t Count = %zu, suggestedMaxLength = %zu", buf, 0x16u);
        }
      }
      v96[0] = v84;
      v96[1] = v83;
      v97[0] = MEMORY[0x263EFFA88];
      uint64_t v33 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v27, v19, v28, v29, v30, v31);
      v97[1] = v33;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v34, (uint64_t)v97, (uint64_t)v96, 2, v35, v36);
      CFDictionaryRef v95 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

      if (v91)
      {
        unint64_t v41 = objc_msgSend__determineFrameIndexForDowngradeFromMultiFrameToSingleFrameWithMaxDimension_fromImageSource_(self, v37, v89, (uint64_t)a3, v38, v39, v40);
        uint64_t v22 = 1;
      }
      else
      {
        unint64_t v41 = 0;
      }
      if (v41 < v22 + v41)
      {
        do
        {
          uint64_t v42 = (void *)MEMORY[0x230F44180]();
          CFDictionaryRef v43 = CGImageSourceCopyPropertiesAtIndex(a3, v41, 0);
          CFDictionaryRef v50 = (const __CFDictionary *)objc_msgSend_mutableCopy(v43, v44, v45, v46, v47, v48, v49);

          if (v23 >= 2) {
            CGImageRef ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(a3, v41, v95);
          }
          else {
            CGImageRef ThumbnailAtIndex = CGImageSourceCreateImageAtIndex(a3, v41, 0);
          }
          uint64_t v52 = ThumbnailAtIndex;
          if (IMOSLoggingEnabled())
          {
            uint64_t v57 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
            {
              uint64_t v58 = @"YES";
              if (!v52) {
                uint64_t v58 = @"NO";
              }
              *(_DWORD *)buf = 138412290;
              size_t v99 = (size_t)v58;
              _os_log_impl(&dword_22B280000, v57, OS_LOG_TYPE_INFO, "adding image properties for HEIF Images only. Created scaled image: %@", buf, 0xCu);
            }
          }
          objc_msgSend__setWideGamutProperties_scaledImage_(self, v53, (uint64_t)v50, (uint64_t)v52, v54, v55, v56);
          int v59 = IMOSLoggingEnabled();
          if (v52)
          {
            if (v59)
            {
              uint64_t v60 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 134217984;
                size_t v99 = v41;
                _os_log_impl(&dword_22B280000, v60, OS_LOG_TYPE_INFO, "adding scaled image at index %lu", buf, 0xCu);
              }
            }
            if (IMOSLoggingEnabled())
            {
              uint64_t v61 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                size_t v99 = (size_t)v50;
                _os_log_impl(&dword_22B280000, v61, OS_LOG_TYPE_INFO, "  properties: %@", buf, 0xCu);
              }
            }
            CGImageDestinationAddImage(v25, v52, v50);
            objc_msgSend_copyAuxiliaryImagesFromImageSource_toDestination_fromImageAtIndex_scaleFactor_(self, v62, (uint64_t)a3, (uint64_t)v25, v41, v63, v64, v21);
            CGImageRelease(v52);
          }
          else if (v59)
          {
            id v65 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134217984;
              size_t v99 = v41;
              _os_log_impl(&dword_22B280000, v65, OS_LOG_TYPE_INFO, "Failed adding scaled image at index (%zd)!", buf, 0xCu);
            }
          }
          ++v41;
          --v22;
        }
        while (v22);
      }
      if (!CGImageDestinationFinalize(v25))
      {
        CFRelease(v25);

        goto LABEL_67;
      }
      LODWORD(v82) = v94;
      uint64_t v72 = objc_msgSend__checkAndSaveImageData_sourceURL_inFormat_withMaxByteSize_actualSize_usedLengthIndex_currentIndex_(self, v66, (uint64_t)v93, (uint64_t)v87, (uint64_t)a5, a6, (uint64_t)a9, a11, v82);
      if (v72)
      {
        if (IMOSLoggingEnabled())
        {
          char v81 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            size_t v99 = (size_t)v72;
            _os_log_impl(&dword_22B280000, v81, OS_LOG_TYPE_INFO, "Success writing wide gamut image out, breaking from loop with url: %@", buf, 0xCu);
          }
        }
        objc_msgSend_emitSignpostTranscodeFinalForDestinationUTI_(v86, v76, (uint64_t)a5, v77, v78, v79, v80);
        CFRelease(v25);

        goto LABEL_68;
      }
      objc_msgSend_emitSignpostTranscodeStepForDestinationUTI_(v86, v67, (uint64_t)a5, v68, v69, v70, v71);
      CFRelease(v25);

      ++v94;
      a7 = v89;
      if (v94 == 26) {
        goto LABEL_57;
      }
    }
    if (v26)
    {
      int v74 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22B280000, v74, OS_LOG_TYPE_INFO, "Cannot set gamut properties because imageDestination is NULL", buf, 2u);
      }
    }
  }
LABEL_67:
  uint64_t v72 = 0;
LABEL_68:

  return v72;
}

- (unint64_t)_determineFrameIndexForDowngradeFromMultiFrameToSingleFrameWithMaxDimension:(unint64_t)a3 fromImageSource:(CGImageSource *)a4
{
  uint64_t v4 = a4;
  uint64_t v63 = *MEMORY[0x263EF8340];
  size_t Count = CGImageSourceGetCount(a4);
  size_t v7 = Count;
  if (!Count)
  {
    unint64_t v53 = 0;
    uint64_t v54 = -1;
    unint64_t v10 = 0;
LABEL_22:
    id v8 = IMLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218752;
      unint64_t v9 = v54;
      uint64_t v56 = v54;
      __int16 v57 = 2048;
      unint64_t v58 = v10;
      __int16 v59 = 2048;
      unint64_t v60 = v53;
      __int16 v61 = 2048;
      size_t v62 = v7;
      _os_log_impl(&dword_22B280000, v8, OS_LOG_TYPE_INFO, "Using frame index %ld with dimensions (%ld x %ld) for downgrade from %ld frame image to single frame.", buf, 0x2Au);
    }
    else
    {
      unint64_t v9 = v54;
    }
    goto LABEL_25;
  }
  if (Count != 1)
  {
    size_t v11 = 0;
    unint64_t v53 = 0;
    unint64_t v10 = 0;
    uint64_t v12 = *MEMORY[0x263F0F4F8];
    uint64_t v52 = *MEMORY[0x263F0F4F0];
    uint64_t v54 = -1;
    do
    {
      CFDictionaryRef v13 = CGImageSourceCopyPropertiesAtIndex(v4, v11, 0);
      uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v13, v14, v12, v15, v16, v17, v18);
      unint64_t v26 = objc_msgSend_unsignedIntegerValue(v19, v20, v21, v22, v23, v24, v25);

      if (v26 <= a3)
      {
        uint64_t v32 = objc_msgSend_objectForKeyedSubscript_(v13, v27, v52, v28, v29, v30, v31);
        uint64_t v39 = v4;
        size_t v40 = v7;
        unint64_t v41 = objc_msgSend_unsignedIntegerValue(v32, v33, v34, v35, v36, v37, v38);

        BOOL v42 = v10 < v26;
        unint64_t v44 = v53;
        uint64_t v43 = v54;
        BOOL v45 = v53 < v41;
        BOOL v46 = !v42 || !v45;
        if (v42 && v45) {
          size_t v47 = v11;
        }
        else {
          size_t v47 = v54;
        }
        if (v46) {
          unint64_t v48 = v10;
        }
        else {
          unint64_t v48 = v26;
        }
        if (v46) {
          unint64_t v49 = v53;
        }
        else {
          unint64_t v49 = v41;
        }
        BOOL v50 = v41 > a3;
        size_t v7 = v40;
        uint64_t v4 = v39;
        if (!v50)
        {
          uint64_t v43 = v47;
          unint64_t v10 = v48;
          unint64_t v44 = v49;
        }
        unint64_t v53 = v44;
        uint64_t v54 = v43;
      }

      ++v11;
    }
    while (v7 != v11);
    goto LABEL_22;
  }
  id v8 = IMLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22B280000, v8, OS_LOG_TYPE_INFO, "Image only contains one frame, no need to choose a best frame for downgrade from multiframe to single frame.", buf, 2u);
  }
  unint64_t v9 = 0;
LABEL_25:

  return v9;
}

- (unint64_t)_getImageWidth:(CGImageSource *)a3
{
  if (!a3 || !CGImageSourceGetCount(a3)) {
    return 0;
  }
  CFDictionaryRef v4 = CGImageSourceCopyPropertiesAtIndex(a3, 0, 0);
  unint64_t v10 = objc_msgSend_objectForKey_(v4, v5, *MEMORY[0x263F0F4F8], v6, v7, v8, v9);
  unint64_t v17 = objc_msgSend_unsignedIntegerValue(v10, v11, v12, v13, v14, v15, v16);

  return v17;
}

- (id)_getScaleFactorArray:(id)a3 transferURL:(id)a4 outputURLs:(id)a5
{
  uint64_t v106 = *MEMORY[0x263EF8340];
  inUTI = (__CFString *)a3;
  CFURLRef url = (const __CFURL *)a4;
  CFURLRef v92 = (const __CFURL *)a5;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v101 = (uint64_t)inUTI;
      __int16 v102 = 2112;
      uint64_t v103 = url;
      __int16 v104 = 2112;
      CFURLRef v105 = v92;
      _os_log_impl(&dword_22B280000, v8, OS_LOG_TYPE_INFO, "_getScaleFactorArray uti %@ transferURL %@ outputURLs %@", buf, 0x20u);
    }
  }
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ((UTTypeConformsTo(inUTI, (CFStringRef)*MEMORY[0x263F01AE0])
     || UTTypeConformsTo(inUTI, (CFStringRef)*MEMORY[0x263F01A40])
     || UTTypeConformsTo(inUTI, (CFStringRef)*MEMORY[0x263F01A80]))
    && (uint64_t v16 = objc_msgSend_count(v92, v10, v11, v12, v13, v14, v15), url)
    && v16)
  {
    CGImageSourceRef cf = CGImageSourceCreateWithURL(url, 0);
    Imagesize_t Width = objc_msgSend__getImageWidth_(self, v17, (uint64_t)cf, v18, v19, v20, v21);
    if (IMOSLoggingEnabled())
    {
      uint64_t v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v101 = ImageWidth;
        _os_log_impl(&dword_22B280000, v23, OS_LOG_TYPE_INFO, "_getScaleFactor inImagesize_t Width = %lu", buf, 0xCu);
      }
    }
    long long v97 = 0u;
    long long v98 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    CFURLRef obj = v92;
    uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v24, (uint64_t)&v95, (uint64_t)v99, 16, v25, v26);
    if (v27)
    {
      uint64_t v28 = *(void *)v96;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v96 != v28) {
            objc_enumerationMutation(obj);
          }
          CGImageSourceRef v30 = CGImageSourceCreateWithURL(*(CFURLRef *)(*((void *)&v95 + 1) + 8 * i), 0);
          uint64_t v36 = objc_msgSend__getImageWidth_(self, v31, (uint64_t)v30, v32, v33, v34, v35);
          if (IMOSLoggingEnabled())
          {
            uint64_t v37 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134217984;
              uint64_t v101 = v36;
              _os_log_impl(&dword_22B280000, v37, OS_LOG_TYPE_INFO, "_getScaleFactor outImagesize_t Width = %lu", buf, 0xCu);
            }
          }
          if (v36) {
            BOOL v38 = ImageWidth == 0;
          }
          else {
            BOOL v38 = 1;
          }
          if (v38)
          {
            float v39 = 1.0;
            if (!IMOSLoggingEnabled()) {
              goto LABEL_36;
            }
            size_t v40 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              LODWORD(v47) = 1.0;
              unint64_t v48 = objc_msgSend_numberWithFloat_(NSNumber, v41, v42, v43, v44, v45, v46, v47);
              *(_DWORD *)buf = 138412290;
              uint64_t v101 = (uint64_t)v48;
              _os_log_impl(&dword_22B280000, v40, OS_LOG_TYPE_INFO, "_getScaleFactorArray resorting to default scale factor for outPutURL %@", buf, 0xCu);
            }
            goto LABEL_35;
          }
          int v49 = IMOSLoggingEnabled();
          float v39 = (float)(unint64_t)ImageWidth / (float)(unint64_t)v36;
          if (v49)
          {
            size_t v40 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              *(float *)&double v63 = v39;
              uint64_t v64 = objc_msgSend_numberWithFloat_(NSNumber, v57, v58, v59, v60, v61, v62, v63);
              *(_DWORD *)buf = 138412290;
              uint64_t v101 = (uint64_t)v64;
              _os_log_impl(&dword_22B280000, v40, OS_LOG_TYPE_INFO, "_getScaleFactorArray scale factor for outPutURL %@", buf, 0xCu);
            }
LABEL_35:
          }
LABEL_36:
          if (v30) {
            CFRelease(v30);
          }
          *(float *)&double v56 = v39;
          id v65 = objc_msgSend_numberWithFloat_(NSNumber, v50, v51, v52, v53, v54, v55, v56);
          objc_msgSend_addObject_(v9, v66, (uint64_t)v65, v67, v68, v69, v70);
        }
        uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v71, (uint64_t)&v95, (uint64_t)v99, 16, v72, v73);
      }
      while (v27);
    }

    if (cf) {
      CFRelease(cf);
    }
  }
  else if (IMOSLoggingEnabled())
  {
    int v74 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
    {
      char v81 = NSNumber;
      uint64_t v82 = objc_msgSend_count(v92, v75, v76, v77, v78, v79, v80);
      uint64_t v88 = objc_msgSend_numberWithUnsignedInteger_(v81, v83, v82, v84, v85, v86, v87);
      *(_DWORD *)buf = 138412802;
      uint64_t v101 = (uint64_t)v88;
      __int16 v102 = 2112;
      uint64_t v103 = inUTI;
      __int16 v104 = 2112;
      CFURLRef v105 = url;
      _os_log_impl(&dword_22B280000, v74, OS_LOG_TYPE_INFO, "Did not compute sticker scale. [outputURLs count] %@, uti %@, transferURL %@", buf, 0x20u);
    }
  }

  return v9;
}

- (void)transcodeFileTransfer:(id)a3 utiType:(id)a4 allowUnfilteredUTIs:(id)a5 target:(int64_t)a6 sizes:(id)a7 commonCapabilities:(id)a8 maxDimension:(unint64_t)a9 transcoderUserInfo:(id)a10 representations:(int64_t)a11 isLQMEnabled:(BOOL)a12 completionBlock:(id)a13
{
  uint64_t v432 = *MEMORY[0x263EF8340];
  CFURLRef v18 = (const __CFURL *)a3;
  uint64_t v19 = (__CFString *)a4;
  id v414 = a5;
  id v20 = a7;
  id v419 = a8;
  id v21 = a10;
  id v416 = a13;
  id v22 = v20;
  if ((unint64_t)objc_msgSend_count(v22, v23, v24, v25, v26, v27, v28) < 2)
  {
LABEL_5:
    uint64_t v34 = 0;
  }
  else
  {
    uint64_t v34 = 1;
    unint64_t v35 = 1;
    while (1)
    {
      uint64_t v36 = objc_msgSend_objectAtIndexedSubscript_(v22, v29, v35, v30, v31, v32, v33);
      uint64_t v37 = v35 - 1;
      uint64_t v43 = objc_msgSend_objectAtIndexedSubscript_(v22, v38, v37, v39, v40, v41, v42);
      char isEqualToValue = objc_msgSend_isEqualToValue_(v36, v44, (uint64_t)v43, v45, v46, v47, v48);

      if ((isEqualToValue & 1) == 0) {
        break;
      }
      unint64_t v35 = v37 + 2;
      if (v35 >= objc_msgSend_count(v22, v50, v51, v52, v53, v54, v55)) {
        goto LABEL_5;
      }
    }
  }

  if (v34 != a11 && IMOSLoggingEnabled())
  {
    uint64_t v59 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v22;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = a11;
      _os_log_impl(&dword_22B280000, v59, OS_LOG_TYPE_INFO, "Warning - sizes %@ do not match the number of reps requested (%d)", buf, 0x12u);
    }
  }
  int shouldPreserveHEIFEncoding_target_sourceUTI = objc_msgSend_shouldPreserveHEIFEncoding_target_sourceUTI_(IMTranscoder, v56, (uint64_t)v419, a6, (uint64_t)v19, v57, v58);
  id v66 = objc_msgSend_lastObject(v22, v60, v61, v62, v63, v64, v65);
  uint64_t v73 = objc_msgSend_longValue(v66, v67, v68, v69, v70, v71, v72);
  uint64_t shouldTranscodeTransfer_transcoderUserInfo_target_utiType_allowUnfilteredUTIs_fileSizeLimit_commonCapabilities = objc_msgSend_shouldTranscodeTransfer_transcoderUserInfo_target_utiType_allowUnfilteredUTIs_fileSizeLimit_commonCapabilities_(self, v74, (uint64_t)v18, (uint64_t)v21, a6, (uint64_t)v19, (uint64_t)v414, v73, v419);

  BOOL v76 = shouldTranscodeTransfer_transcoderUserInfo_target_utiType_allowUnfilteredUTIs_fileSizeLimit_commonCapabilities == 2;
  int isEqualToIgnoringCase = objc_msgSend_isEqualToIgnoringCase_(v19, v77, @"________WBMP_________", v78, v79, v80, v81);
  v417 = objc_msgSend_objectForKey_(v21, v83, @"ImageQuality", v84, v85, v86, v87);
  if (v417)
  {
    objc_msgSend_floatValue(v417, v88, v89, v90, v91, v92, v93);
    objc_msgSend_setOverrideJPEGCompressionQuality_(self, v95, v96, v97, v98, v99, v100, v94);
  }
  unsigned int v415 = isEqualToIgnoringCase | v76;
  if (IMOSLoggingEnabled())
  {
    uint64_t v106 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v106, OS_LOG_TYPE_INFO))
    {
      int v107 = @"NO";
      if (v415) {
        int v107 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v18;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v107;
      _os_log_impl(&dword_22B280000, v106, OS_LOG_TYPE_INFO, "Transfer: %@   needsTranscode? %@", buf, 0x16u);
    }
  }
  if (a6 == 1)
  {
    uint64_t v108 = objc_msgSend_objectForKey_(v21, v101, *MEMORY[0x263F4AEA0], v102, v103, v104, v105);
    uint64_t v114 = objc_msgSend_objectForKey_(v21, v109, *MEMORY[0x263F4AEA8], v110, v111, v112, v113);
    int v119 = (int)((double)(int)objc_msgSend_IMMMSMaximumMessageByteCountForPhoneNumber_simID_(MEMORY[0x263F4AF40], v115, (uint64_t)v108, (uint64_t)v114, v116, v117, v118)* 0.92);
    if (IMOSLoggingEnabled())
    {
      uint64_t v120 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v120, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v119;
        _os_log_impl(&dword_22B280000, v120, OS_LOG_TYPE_INFO, "       Max byte size is: %d", buf, 8u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v126 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v126, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v22;
        _os_log_impl(&dword_22B280000, v126, OS_LOG_TYPE_INFO, "         Supplied sizes: %@", buf, 0xCu);
      }
    }
    unint64_t v127 = objc_msgSend_numberWithLong_(NSNumber, v121, v119, v122, v123, v124, v125);
    v422[0] = MEMORY[0x263EF8330];
    v422[1] = 3221225472;
    v422[2] = sub_22B292228;
    v422[3] = &unk_26488EA08;
    int v424 = v119;
    id v128 = v127;
    id v423 = v128;
    uint64_t v134 = objc_msgSend___imArrayByApplyingBlock_(v22, v129, (uint64_t)v422, v130, v131, v132, v133);

    int v139 = objc_msgSend_IMMMSMaxImageDimensionForPhoneNumber_simID_(MEMORY[0x263F4AF40], v135, (uint64_t)v108, (uint64_t)v114, v136, v137, v138);
    if (IMOSLoggingEnabled())
    {
      BOOL v140 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v140, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22B280000, v140, OS_LOG_TYPE_INFO, " Always transcoding MMS, setting transcoding to YES", buf, 2u);
      }
    }
    unint64_t v413 = v139;
    unsigned int v415 = 1;
    id v22 = (id)v134;
  }
  else
  {
    unint64_t v413 = a9;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v141 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v141, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v413;
      _os_log_impl(&dword_22B280000, v141, OS_LOG_TYPE_INFO, " Max image dimension is: %zd", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v142 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v142, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v22;
      _os_log_impl(&dword_22B280000, v142, OS_LOG_TYPE_INFO, "              Max sizes: %@", buf, 0xCu);
    }
  }
  v418 = objc_alloc_init(IMTranscoderTelemetry);
  if (v415)
  {
    objc_msgSend_emitTranscodeBeginFromUTI_(v418, v143, (uint64_t)v19, v144, v145, v146, v147);
    if (IMOSLoggingEnabled())
    {
      id v153 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v153, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22B280000, v153, OS_LOG_TYPE_INFO, "This image needs to be transcoded!", buf, 2u);
      }
    }
    if (!objc_msgSend_isEqualToIgnoringCase_(v19, v148, @"________WBMP_________", v149, v150, v151, v152))
    {
      if (v18)
      {
LABEL_107:
        if (IMOSLoggingEnabled())
        {
          uint64_t v220 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v220, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v18;
            _os_log_impl(&dword_22B280000, v220, OS_LOG_TYPE_INFO, "Creating CGImageSource from url: %@", buf, 0xCu);
          }
        }
        if (v19)
        {
          uint64_t v427 = *MEMORY[0x263F0F640];
          v428 = v19;
          objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v217, (uint64_t)&v428, (uint64_t)&v427, 1, v218, v219);
          id v221 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v221 = 0;
        }
        uint64_t v188 = CGImageSourceCreateWithURL(v18, (CFDictionaryRef)v221);
        if (IMOSLoggingEnabled())
        {
          uint64_t v227 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v227, OS_LOG_TYPE_INFO))
          {
            uint64_t v228 = @"good";
            if (!v188) {
              uint64_t v228 = @"NULL";
            }
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v228;
            _os_log_impl(&dword_22B280000, v227, OS_LOG_TYPE_INFO, "Source ref is %@", buf, 0xCu);
          }
        }
        if (IMOSLoggingEnabled())
        {
          v229 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v229, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22B280000, v229, OS_LOG_TYPE_INFO, "Source image properties unavailable (sourceRef is NULL)", buf, 2u);
          }
        }
        char v226 = 0;
        goto LABEL_130;
      }
      uint64_t v188 = 0;
LABEL_113:
      if (IMOSLoggingEnabled())
      {
        v225 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v225, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22B280000, v225, OS_LOG_TYPE_INFO, "transferURL is nil, no image to transcode...", buf, 2u);
        }
      }
      char v226 = 1;
LABEL_130:
      BOOL v409 = v188 == 0;
      if (!v188 && !IMIsRunningInUnitTesting())
      {
        if (IMOSLoggingEnabled())
        {
          v286 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v286, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22B280000, v286, OS_LOG_TYPE_INFO, "The imageSource was NULL when trying to load original attachment file", buf, 2u);
          }
        }
        unint64_t v201 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v283, @"__kIMTranscodeErrorDomain", -2, 0, v284, v285);
        uint64_t v202 = 0;
        uint64_t v197 = 0;
        goto LABEL_281;
      }
      os_log_t loga = (os_log_t)objc_msgSend_newEstimatorWithURL_uti_imageSource_(IMTranscoderImageSizeEstimator, v222, (uint64_t)v18, (uint64_t)v19, (uint64_t)v188, v223, v224);
      if (a6 != 1)
      {
        BOOL v231 = 0;
        BOOL v216 = 1;
        goto LABEL_177;
      }
      if (v226)
      {
        unint64_t v230 = 0;
        id v408 = 0;
LABEL_137:
        if (IMOSLoggingEnabled())
        {
          __int16 v257 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v257, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            *(void *)&uint8_t buf[4] = v18;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v408;
            *(_WORD *)&buf[22] = 2048;
            unint64_t v431 = v230;
            _os_log_impl(&dword_22B280000, v257, OS_LOG_TYPE_INFO, " File size of file %@ with error %@   (%llu bytes)", buf, 0x20u);
          }
        }
        v258 = objc_msgSend_firstObject(v22, v251, v252, v253, v254, v255, v256);
        BOOL v265 = v230 < objc_msgSend_longValue(v258, v259, v260, v261, v262, v263, v264);

        if (v265)
        {
          if (UTTypeConformsTo(v19, (CFStringRef)*MEMORY[0x263F01A80]))
          {
            CFDictionaryRef v266 = CGImageSourceCopyPropertiesAtIndex(v188, 0, 0);
            if (IMOSLoggingEnabled())
            {
              v272 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v272, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v266;
                _os_log_impl(&dword_22B280000, v272, OS_LOG_TYPE_INFO, "  This is a JPEG, checking properties: %@", buf, 0xCu);
              }
            }
            v273 = objc_msgSend_objectForKey_(v266, v267, *MEMORY[0x263F0F4C8], v268, v269, v270, v271);
            int v280 = objc_msgSend_intValue(v273, v274, v275, v276, v277, v278, v279);
            if (IMOSLoggingEnabled())
            {
              v281 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v281, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)&uint8_t buf[4] = v280;
                *(_WORD *)&buf[8] = 2112;
                *(void *)&buf[10] = v273;
                _os_log_impl(&dword_22B280000, v281, OS_LOG_TYPE_INFO, "  Image orientation is: %d  (%@)", buf, 0x12u);
              }
            }
            BOOL v216 = v280 != 0;
          }
          else
          {
            if (IMOSLoggingEnabled())
            {
              v292 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v292, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_22B280000, v292, OS_LOG_TYPE_INFO, "  Image still might requiree transcoding", buf, 2u);
              }
            }
            BOOL v216 = 1;
          }
          if (IMOSLoggingEnabled())
          {
            v293 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v293, OS_LOG_TYPE_INFO))
            {
              v294 = @"NO";
              if (v216) {
                v294 = @"YES";
              }
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v294;
              _os_log_impl(&dword_22B280000, v293, OS_LOG_TYPE_INFO, " File still requires transcoding: %@", buf, 0xCu);
            }
          }
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            v282 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v282, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_22B280000, v282, OS_LOG_TYPE_INFO, " File is too large, we'll need to transcode it", buf, 2u);
            }
          }
          BOOL v216 = 1;
        }

        if (!IMMMSRestrictedModeEnabled())
        {
LABEL_176:
          BOOL v231 = 0;
          if (!v216) {
            goto LABEL_186;
          }
          goto LABEL_177;
        }
        BOOL v231 = UTTypeConformsTo(v19, (CFStringRef)*MEMORY[0x263F01A40]) != 0;
        if (!v216) {
          goto LABEL_186;
        }
LABEL_177:
        if (!v231)
        {
          if (objc_msgSend_BOOLFromTranscoderUserInfo_withKey_(self, v210, (uint64_t)v21, *MEMORY[0x263F4AC28], v213, v214, v215))
          {
            if (IMOSLoggingEnabled())
            {
              v296 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v296, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v19;
                _os_log_impl(&dword_22B280000, v296, OS_LOG_TYPE_INFO, "Transcoding Genmoji to single frame PNG, original uti: %@", buf, 0xCu);
              }
            }
            uint64_t v197 = objc_msgSend__writeRepresentationsForImage_target_sourceURL_sizes_maxDimension_srcUTI_inFormat_downgradingMultiFrameImageToSingleFrame_estimator_isLQMEnabled_telemetry_(self, v295, (uint64_t)v188, a6, (uint64_t)v18, (uint64_t)v22, v413, v19, *MEMORY[0x263F01AE0], 1, loga, a12, v418);
            if (objc_msgSend_count(v197, v297, v298, v299, v300, v301, v302))
            {
              if (v197) {
                goto LABEL_259;
              }
            }
            else
            {
              if (IMOSLoggingEnabled())
              {
                v319 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v319, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_22B280000, v319, OS_LOG_TYPE_INFO, "Couldn't fit genmoji image into any size of PNG", buf, 2u);
                }
              }
            }
          }
          if (a6 == 1 && (IMMMSRestrictedModeEnabled() & 1) != 0) {
            goto LABEL_254;
          }
          size_t Count = CGImageSourceGetCount(v188);
          v327 = objc_msgSend_sharedFeatureFlags(MEMORY[0x263F4AF80], v321, v322, v323, v324, v325, v326);
          int isHighQualityPhotosEnabled = objc_msgSend_isHighQualityPhotosEnabled(v327, v328, v329, v330, v331, v332, v333);

          if (shouldPreserveHEIFEncoding_target_sourceUTI)
          {
            int v335 = Count > 1 ? 1 : isHighQualityPhotosEnabled;
            if (v335 != 1 || UTTypeConformsTo(v19, (CFStringRef)*MEMORY[0x263F4B0F0]))
            {
              if (IMOSLoggingEnabled())
              {
                v336 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v336, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v19;
                  _os_log_impl(&dword_22B280000, v336, OS_LOG_TYPE_INFO, "Transcoding to HEIF, original uti: %@", buf, 0xCu);
                }
              }
              v337 = (id *)MEMORY[0x263F4B0E8];
              if (Count <= 1) {
                v337 = (id *)MEMORY[0x263F4B0E0];
              }
              id v338 = *v337;
              LOBYTE(v407) = a12;
              LOBYTE(v406) = 0;
              uint64_t v197 = objc_msgSend__writeRepresentationsForImage_target_sourceURL_sizes_maxDimension_srcUTI_inFormat_downgradingMultiFrameImageToSingleFrame_estimator_isLQMEnabled_telemetry_(self, v339, (uint64_t)v188, a6, (uint64_t)v18, (uint64_t)v22, v413, v19, v338, v406, loga, v407, v418);
              if (!objc_msgSend_count(v197, v340, v341, v342, v343, v344, v345))
              {
                if (IMOSLoggingEnabled())
                {
                  v346 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v346, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_22B280000, v346, OS_LOG_TYPE_INFO, "Couldn't fit this image into any size of HEIF", buf, 2u);
                  }
                }
                uint64_t v197 = 0;
              }

              goto LABEL_247;
            }
          }
          uint64_t v347 = *MEMORY[0x263F01AE0];
          if (UTTypeConformsTo(v19, (CFStringRef)*MEMORY[0x263F01AE0]))
          {
            if (a12)
            {
              if (CGImageSourceGetCount(v188) == 1)
              {
                CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v188, 0, 0);
                v350 = objc_opt_class();
                if (objc_msgSend__canConvertPNGToJPEG_(v350, v351, (uint64_t)ImageAtIndex, v352, v353, v354, v355))
                {
                  int v356 = IMOSLoggingEnabled();
                  uint64_t v347 = *MEMORY[0x263F01A80];
                  if (v356)
                  {
                    v357 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v357, OS_LOG_TYPE_INFO))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_22B280000, v357, OS_LOG_TYPE_INFO, "We've got an opaque PNG, try to reencode as a JPEG", buf, 2u);
                    }
                  }
                }
                if (ImageAtIndex) {
                  CFRelease(ImageAtIndex);
                }
              }
            }
            else if (IMOSLoggingEnabled())
            {
              v368 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v368, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_22B280000, v368, OS_LOG_TYPE_INFO, "We've got a PNG, we'll try to preserve it since LQM is not enabled.", buf, 2u);
              }
            }
            LOBYTE(v407) = a12;
            LOBYTE(v406) = 0;
            uint64_t v197 = objc_msgSend__writeRepresentationsForImage_target_sourceURL_sizes_maxDimension_srcUTI_inFormat_downgradingMultiFrameImageToSingleFrame_estimator_isLQMEnabled_telemetry_(self, v348, (uint64_t)v188, a6, (uint64_t)v18, (uint64_t)v22, v413, v19, v347, v406, loga, v407, v418);
            if (objc_msgSend_count(v197, v369, v370, v371, v372, v373, v374)) {
              goto LABEL_247;
            }
            if (!IMOSLoggingEnabled()) {
              goto LABEL_253;
            }
            v367 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v367, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_22B280000, v367, OS_LOG_TYPE_INFO, "Couldn't fit this image into any size of PNG", buf, 2u);
            }
            goto LABEL_252;
          }
          uint64_t v358 = *MEMORY[0x263F01A40];
          if (UTTypeConformsTo(v19, (CFStringRef)*MEMORY[0x263F01A40]))
          {
            if (IMOSLoggingEnabled())
            {
              v360 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v360, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_22B280000, v360, OS_LOG_TYPE_INFO, "We've got a GIF, try to reencode as a GIF", buf, 2u);
              }
            }
            LOBYTE(v407) = a12;
            LOBYTE(v406) = 0;
            uint64_t v197 = objc_msgSend__writeRepresentationsForImage_target_sourceURL_sizes_maxDimension_srcUTI_inFormat_downgradingMultiFrameImageToSingleFrame_estimator_isLQMEnabled_telemetry_(self, v359, (uint64_t)v188, a6, (uint64_t)v18, (uint64_t)v22, v413, v19, v358, v406, loga, v407, v418);
            if (!objc_msgSend_count(v197, v361, v362, v363, v364, v365, v366))
            {
              if (!IMOSLoggingEnabled())
              {
LABEL_253:

                goto LABEL_254;
              }
              v367 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v367, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_22B280000, v367, OS_LOG_TYPE_INFO, "Couldn't fit this image into any size of GIF", buf, 2u);
              }
LABEL_252:

              goto LABEL_253;
            }
          }
          else
          {
            if (!UTTypeConformsTo(v19, (CFStringRef)*MEMORY[0x263F4B0F8]))
            {
LABEL_254:
              if (IMOSLoggingEnabled())
              {
                v376 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v376, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_22B280000, v376, OS_LOG_TYPE_INFO, "Ok, let's see if we can fit this image into a JPEG", buf, 2u);
                }
              }
              LOBYTE(v407) = a12;
              LOBYTE(v406) = 0;
              uint64_t v197 = objc_msgSend__writeRepresentationsForImage_target_sourceURL_sizes_maxDimension_srcUTI_inFormat_downgradingMultiFrameImageToSingleFrame_estimator_isLQMEnabled_telemetry_(self, v375, (uint64_t)v188, a6, (uint64_t)v18, (uint64_t)v22, v413, v19, *MEMORY[0x263F01A80], v406, loga, v407, v418);
              if (!v197)
              {
LABEL_260:
                if (IMOSLoggingEnabled())
                {
                  v383 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v383, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_22B280000, v383, OS_LOG_TYPE_INFO, "Image failed to transcode; falling back to original",
                      buf,
                      2u);
                  }
                }
                v318 = _IMTranscoderLinkFile(v18, v377, v378, v379, v380, v381, v382);
                uint64_t v384 = IMSingleObjectArray();

                uint64_t v197 = (void *)v384;
LABEL_265:

                goto LABEL_266;
              }
LABEL_259:
              if (objc_msgSend_count(v197, v303, v304, v305, v306, v307, v308))
              {
LABEL_266:
                if (IMOSLoggingEnabled())
                {
                  v391 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v391, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(void *)&uint8_t buf[4] = v197;
                    _os_log_impl(&dword_22B280000, v391, OS_LOG_TYPE_INFO, "We've reached the end of the image transcode attempt. outputURL = %@", buf, 0xCu);
                  }
                }
                if (v197 && objc_msgSend_count(v197, v385, v386, v387, v388, v389, v390))
                {
                  unint64_t v201 = 0;
                  uint64_t v202 = 1;
                }
                else
                {
                  unint64_t v201 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v385, @"__kIMTranscodeErrorDomain", -7, 0, v389, v390);
                  if (IMOSLoggingEnabled())
                  {
                    v392 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v392, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      *(void *)&uint8_t buf[4] = v201;
                      _os_log_impl(&dword_22B280000, v392, OS_LOG_TYPE_INFO, "Failed to re-encode: %@", buf, 0xCu);
                    }
                  }
                  uint64_t v202 = 0;
                }
                if (!v409) {
                  CFRelease(v188);
                }

LABEL_281:
                objc_msgSend_emitTranscodeEndFromUTI_(v418, v287, (uint64_t)v19, v288, v289, v290, v291);
                goto LABEL_282;
              }
              goto LABEL_260;
            }
            if (Count <= 1) {
              uint64_t v397 = *MEMORY[0x263F01A80];
            }
            else {
              uint64_t v397 = v358;
            }
            if (IMOSLoggingEnabled())
            {
              v399 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v399, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                *(void *)&uint8_t buf[4] = v397;
                *(_WORD *)&buf[12] = 2048;
                *(void *)&buf[14] = Count;
                _os_log_impl(&dword_22B280000, v399, OS_LOG_TYPE_INFO, "We've got a WebP, try to reencode as a %@ (frame count %zu)", buf, 0x16u);
              }
            }
            LOBYTE(v407) = a12;
            LOBYTE(v406) = 0;
            uint64_t v197 = objc_msgSend__writeRepresentationsForImage_target_sourceURL_sizes_maxDimension_srcUTI_inFormat_downgradingMultiFrameImageToSingleFrame_estimator_isLQMEnabled_telemetry_(self, v398, (uint64_t)v188, a6, (uint64_t)v18, (uint64_t)v22, v413, v19, v397, v406, loga, v407, v418);
            if (!objc_msgSend_count(v197, v400, v401, v402, v403, v404, v405))
            {
              if (!IMOSLoggingEnabled()) {
                goto LABEL_253;
              }
              v367 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v367, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v397;
                _os_log_impl(&dword_22B280000, v367, OS_LOG_TYPE_INFO, "Couldn't fit this image into any size of %@", buf, 0xCu);
              }
              goto LABEL_252;
            }
          }
LABEL_247:
          if (v197) {
            goto LABEL_259;
          }
          goto LABEL_254;
        }
LABEL_186:
        if (IMOSLoggingEnabled())
        {
          v315 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v315, OS_LOG_TYPE_INFO))
          {
            v316 = @"NO";
            if (v231) {
              v317 = @"YES";
            }
            else {
              v317 = @"NO";
            }
            if (v216) {
              v316 = @"YES";
            }
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v317;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v316;
            _os_log_impl(&dword_22B280000, v315, OS_LOG_TYPE_INFO, "Didn't require transcode, defaulting to the original image MMSGIFCarrierTesting %@, needsTrancode %@", buf, 0x16u);
          }
        }
        v318 = _IMTranscoderLinkFile(v18, v309, v310, v311, v312, v313, v314);
        uint64_t v197 = IMSingleObjectArray();
        goto LABEL_265;
      }
LABEL_136:
      uint64_t v232 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v210, v211, v212, v213, v214, v215);
      id v239 = objc_msgSend_path(v18, v233, v234, v235, v236, v237, v238);
      id v421 = 0;
      CFDictionaryRef v244 = objc_msgSend_attributesOfItemAtPath_error_(v232, v240, (uint64_t)v239, (uint64_t)&v421, v241, v242, v243);
      id v408 = v421;
      unint64_t v230 = objc_msgSend_fileSize(v244, v245, v246, v247, v248, v249, v250);

      goto LABEL_137;
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v154 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v154, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22B280000, v154, OS_LOG_TYPE_INFO, "This is a WBMP, converting to JPEG first", buf, 2u);
      }
    }
    id v155 = objc_alloc(MEMORY[0x263EFF8F8]);
    uint64_t v161 = objc_msgSend_initWithContentsOfURL_(v155, v156, (uint64_t)v18, v157, v158, v159, v160);
    if (!objc_msgSend_length(v161, v162, v163, v164, v165, v166, v167) && IMOSLoggingEnabled())
    {
      uint64_t v168 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v168, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v18;
        _os_log_impl(&dword_22B280000, v168, OS_LOG_TYPE_INFO, "Failing, Empty data created from URL: %@", buf, 0xCu);
      }
    }
    if (v161 && (uint64_t v169 = (CGImage *)CGImageCreateWithWBMPData()) != 0)
    {
      values[3] = 0;
      uint64_t valuePtr = 0x3FF0000000000000;
      uint64_t v170 = *MEMORY[0x263F0EFE8];
      unint64_t v431 = 0;
      *(void *)buf = v170;
      values[0] = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
      *(void *)&buf[8] = *MEMORY[0x263F0EFE0];
      size_t Width = CGImageGetWidth(v169);
      size_t Height = CGImageGetHeight(v169);
      if (Width <= Height) {
        objc_msgSend_numberWithUnsignedLong_(NSNumber, v173, Height, v174, v175, v176, v177);
      }
      else {
      uint64_t v178 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v173, Width, v174, v175, v176, v177);
      }
      values[1] = (void *)CFRetain(v178);

      *(void *)&buf[16] = *MEMORY[0x263F0F008];
      values[2] = (void *)CFRetain(MEMORY[0x263EFFA88]);
      CFDictionaryRef v179 = CFDictionaryCreate(0, (const void **)buf, (const void **)values, 3, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      uint64_t v180 = 2;
      do
      {
        CFRelease(values[v180]);
        unint64_t v181 = v180-- + 1;
      }
      while (v181 > 1);
      uint64_t v182 = (__CFData *)objc_alloc_init(MEMORY[0x263EFF990]);
      uint64_t v183 = v182;
      if (v182)
      {
        uint64_t v184 = CGImageDestinationCreateWithData(v182, @"public.jpeg", 1uLL, 0);
        uint64_t v185 = v184;
        if (v184)
        {
          CGImageDestinationAddImage(v184, v169, v179);
          if (CGImageDestinationFinalize(v185))
          {
            CFRelease(v185);
            CFRelease(v179);
            uint64_t v186 = v183;

            if (IMOSLoggingEnabled())
            {
              uint64_t v187 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v187, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_22B280000, v187, OS_LOG_TYPE_INFO, "Created source from JPEG converted data", buf, 2u);
              }
            }
            uint64_t v188 = CGImageSourceCreateWithData(v186, 0);
            CFRelease(v169);
            goto LABEL_102;
          }
          if (IMOSLoggingEnabled())
          {
            log = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v425 = 0;
              _os_log_impl(&dword_22B280000, log, OS_LOG_TYPE_INFO, "Failed finalizing image destination from WBMP", v425, 2u);
            }
          }
          CFRelease(v185);
        }
        else if (IMOSLoggingEnabled())
        {
          unsigned int v205 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v205, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v425 = 0;
            _os_log_impl(&dword_22B280000, v205, OS_LOG_TYPE_INFO, "Failed creating image destination with data", v425, 2u);
          }
        }
      }
      CFRelease(v179);

      if (!IMOSLoggingEnabled())
      {
        uint64_t v188 = 0;
        uint64_t v186 = v169;
        goto LABEL_102;
      }
      char v204 = 0;
      uint64_t v186 = v169;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v203 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v203, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22B280000, v203, OS_LOG_TYPE_INFO, "Failing to create jpeg from WBMP, no image ref passed in", buf, 2u);
        }
      }
      uint64_t v186 = 0;
      if ((IMOSLoggingEnabled() & 1) == 0)
      {
        uint64_t v188 = 0;
        goto LABEL_103;
      }
      char v204 = 1;
    }
    uint64_t v206 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v206, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22B280000, v206, OS_LOG_TYPE_INFO, "Failed converting WBMP to JPEG", buf, 2u);
    }

    uint64_t v188 = 0;
    if (v204)
    {
LABEL_103:

      if (v18)
      {
        if (v188)
        {
          os_log_t loga = (os_log_t)objc_msgSend_newEstimatorWithURL_uti_imageSource_(IMTranscoderImageSizeEstimator, v207, (uint64_t)v18, (uint64_t)v19, (uint64_t)v188, v208, v209);
          BOOL v409 = 0;
          if (a6 != 1)
          {
            BOOL v216 = 1;
            goto LABEL_176;
          }
          goto LABEL_136;
        }
        goto LABEL_107;
      }
      goto LABEL_113;
    }
LABEL_102:
    CFRelease(v186);
    goto LABEL_103;
  }
  objc_msgSend_emitSignpostTranscodeSkipSourceUTI_(v418, v143, (uint64_t)v19, v144, v145, v146, v147);
  if (IMOSLoggingEnabled())
  {
    int v195 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v195, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22B280000, v195, OS_LOG_TYPE_INFO, "Image ended up not needing a transcode operation", buf, 2u);
    }
  }
  uint64_t v196 = _IMTranscoderLinkFile(v18, v189, v190, v191, v192, v193, v194);
  uint64_t v197 = IMSingleObjectArray();

  unint64_t v201 = 0;
  uint64_t v202 = 1;
LABEL_282:
  v393 = objc_msgSend__getScaleFactorArray_transferURL_outputURLs_(self, v198, (uint64_t)v19, (uint64_t)v18, (uint64_t)v197, v199, v200);
  if (IMOSLoggingEnabled())
  {
    v394 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v394, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v393;
      _os_log_impl(&dword_22B280000, v394, OS_LOG_TYPE_INFO, "scaleFactorArray = %@", buf, 0xCu);
    }
  }
  v395 = (__CFDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v396 = v393;
  if (v396) {
    CFDictionarySetValue(v395, (const void *)*MEMORY[0x263F4AE98], v396);
  }

  if (v416) {
    (*((void (**)(id, const __CFURL *, void *, void, void *, uint64_t, void, __CFDictionary *))v416 + 2))(v416, v18, v197, 0, v201, v202, v415, v395);
  }
}

- (id)_imMetricsCollectorForLQMQualityEstimatorModel:(__CFString *)a3 suggestedMaxLength:(unint64_t)a4 shouldUseQualityEstimatorModel:(BOOL)a5 inputImageFeatures:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (UTTypeConformsTo(a3, @"public.heic"))
  {
    objc_msgSend__imMetricsCollectorForLQMQualityEstimatorModeImageTypeHEIC_shouldUseQualityEstimatorModel_inputImageFeatures_metricsDict_(self, v12, a4, v6, (uint64_t)v10, (uint64_t)v11, v13);
    objc_msgSend_numberWithUnsignedInteger_(NSNumber, v14, 1, v15, v16, v17, v18);
  }
  else if (UTTypeConformsTo(a3, @"public.png"))
  {
    objc_msgSend_numberWithUnsignedInteger_(NSNumber, v19, 2, v20, v21, v22, v23);
  }
  else if (UTTypeConformsTo(a3, @"public.jpeg"))
  {
    objc_msgSend_numberWithUnsignedInteger_(NSNumber, v24, 3, v25, v26, v27, v28);
  }
  else if (UTTypeConformsTo(a3, (CFStringRef)*MEMORY[0x263F01A40]))
  {
    objc_msgSend_numberWithUnsignedInteger_(NSNumber, v29, 4, v30, v31, v32, v33);
  }
  else if (UTTypeConformsTo(a3, (CFStringRef)*MEMORY[0x263F01B18]))
  {
    objc_msgSend_numberWithUnsignedInteger_(NSNumber, v34, 6, v35, v36, v37, v38);
  }
  else if (UTTypeConformsTo(a3, (CFStringRef)*MEMORY[0x263F4B0F8]))
  {
    objc_msgSend_numberWithUnsignedInteger_(NSNumber, v39, 5, v40, v41, v42, v43);
  }
  else
  {
    objc_msgSend_numberWithUnsignedInteger_(NSNumber, v39, 7, v40, v41, v42, v43);
  uint64_t v44 = };
  objc_msgSend_setObject_forKey_(v11, v45, (uint64_t)v44, *MEMORY[0x263F4AD00], v46, v47, v48);

  return v11;
}

- (void)_imMetricsCollectorForLQMQualityEstimatorModeImageTypeHEIC:(unint64_t)a3 shouldUseQualityEstimatorModel:(BOOL)a4 inputImageFeatures:(id)a5 metricsDict:(id)a6
{
  BOOL v7 = a4;
  uint64_t v106 = *MEMORY[0x263EF8340];
  id v9 = a5;
  id v10 = a6;
  uint64_t v16 = objc_msgSend_numberWithInteger_(NSNumber, v11, a3, v12, v13, v14, v15);
  int v22 = objc_msgSend_containsObject_(&unk_26DE89610, v17, (uint64_t)v16, v18, v19, v20, v21);

  if (v22) {
    BOOL v23 = !v7;
  }
  else {
    BOOL v23 = 1;
  }
  if (!v23)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v97 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
      {
        int v104 = 134217984;
        unint64_t v105 = a3;
        _os_log_impl(&dword_22B280000, v97, OS_LOG_TYPE_INFO, "Quality estimator model used, suggestedMaxLength: %zu", (uint8_t *)&v104, 0xCu);
      }
    }
    uint64_t v98 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v92, 3, v93, v94, v95, v96);
LABEL_25:
    uint64_t v86 = (void *)v98;
    objc_msgSend_setObject_forKey_(v10, v99, v98, *MEMORY[0x263F4AD08], v100, v101, v102);
    goto LABEL_26;
  }
  int v24 = IMOSLoggingEnabled();
  if (!v9 || ((v22 | !v7) & 1) == 0)
  {
    if (v24)
    {
      uint64_t v103 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v103, OS_LOG_TYPE_INFO))
      {
        int v104 = 134217984;
        unint64_t v105 = a3;
        _os_log_impl(&dword_22B280000, v103, OS_LOG_TYPE_INFO, "Legacy model used without fallback, suggestedMaxLength: %zu", (uint8_t *)&v104, 0xCu);
      }
    }
    uint64_t v98 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v25, 1, v26, v27, v28, v29);
    goto LABEL_25;
  }
  if (v24)
  {
    uint64_t v30 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      int v104 = 134217984;
      unint64_t v105 = a3;
      _os_log_impl(&dword_22B280000, v30, OS_LOG_TYPE_INFO, "Legacy model used with fallback, suggestedMaxLength: %zu", (uint8_t *)&v104, 0xCu);
    }
  }
  uint64_t v31 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v25, 2, v26, v27, v28, v29);
  objc_msgSend_setObject_forKey_(v10, v32, (uint64_t)v31, *MEMORY[0x263F4AD08], v33, v34, v35);

  uint64_t v36 = NSNumber;
  uint64_t v42 = objc_msgSend_objectForKey_(v9, v37, @"Input File Size", v38, v39, v40, v41);
  int v49 = objc_msgSend_intValue(v42, v43, v44, v45, v46, v47, v48);
  int v55 = v49 + 0xFFFFF;
  if (v49 >= 0) {
    int v55 = v49;
  }
  double v56 = objc_msgSend_numberWithInteger_(v36, v50, (uint64_t)v55 >> 20, v51, v52, v53, v54);
  objc_msgSend_setObject_forKey_(v10, v57, (uint64_t)v56, *MEMORY[0x263F4ACF8], v58, v59, v60);

  id v66 = objc_msgSend_objectForKey_(v9, v61, @"Input Entropy", v62, v63, v64, v65);
  objc_msgSend_setObject_forKey_(v10, v67, (uint64_t)v66, *MEMORY[0x263F4ACF0], v68, v69, v70);

  BOOL v76 = objc_msgSend_objectForKey_(v9, v71, @"Input Height", v72, v73, v74, v75);
  objc_msgSend_setObject_forKey_(v10, v77, (uint64_t)v76, *MEMORY[0x263F4ACE8], v78, v79, v80);

  uint64_t v86 = objc_msgSend_objectForKey_(v9, v81, @"Aspect Ratio", v82, v83, v84, v85);
  objc_msgSend_setObject_forKey_(v10, v87, (uint64_t)v86, *MEMORY[0x263F4ACE0], v88, v89, v90);
LABEL_26:
}

+ (BOOL)_canConvertPNGToJPEG:(CGImage *)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v7 = objc_msgSend__imageContainsTranslucentPixels_(a1, a2, (uint64_t)a3, v3, v4, v5, v6);
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = @"YES";
      if (v7) {
        id v9 = @"NO";
      }
      int v11 = 138412290;
      uint64_t v12 = v9;
      _os_log_impl(&dword_22B280000, v8, OS_LOG_TYPE_INFO, "PNG can be converted to JPG: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  return v7 ^ 1;
}

+ (BOOL)_imageContainsTranslucentPixels:(CGImage *)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  CGImageAlphaInfo AlphaInfo = CGImageGetAlphaInfo(a3);
  if (AlphaInfo > kCGImageAlphaOnly)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        LOWORD(v36) = 0;
        _os_log_impl(&dword_22B280000, v5, OS_LOG_TYPE_INFO, "Image alpha channel unknown, translucency check may fail", (uint8_t *)&v36, 2u);
      }
      goto LABEL_20;
    }
  }
  else
  {
    if (((1 << AlphaInfo) & 0x61) != 0)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v6 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          LOWORD(v36) = 0;
          _os_log_impl(&dword_22B280000, v6, OS_LOG_TYPE_INFO, "Image has no alpha channel, assuming opaque", (uint8_t *)&v36, 2u);
        }
      }
      return 0;
    }
    if (((1 << AlphaInfo) & 0x98) != 0)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v5 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          LOWORD(v36) = 0;
          _os_log_impl(&dword_22B280000, v5, OS_LOG_TYPE_INFO, "Image has alpha channel, checking for translucent pixels", (uint8_t *)&v36, 2u);
        }
LABEL_20:
      }
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        LOWORD(v36) = 0;
        _os_log_impl(&dword_22B280000, v5, OS_LOG_TYPE_INFO, "Image has premultiplied alpha channel, checking for translucent pixels", (uint8_t *)&v36, 2u);
      }
      goto LABEL_20;
    }
  }
  size_t BitsPerComponent = CGImageGetBitsPerComponent(a3);
  if (BitsPerComponent >= 9) {
    size_t v9 = 16;
  }
  else {
    size_t v9 = 8;
  }
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v36 = 134218240;
      unint64_t v37 = BitsPerComponent;
      __int16 v38 = 2048;
      unint64_t v39 = v9;
      _os_log_impl(&dword_22B280000, v10, OS_LOG_TYPE_INFO, " ==> Image has %ld bits per component, using %ld bpc for test", (uint8_t *)&v36, 0x16u);
    }
  }
  size_t Width = CGImageGetWidth(a3);
  size_t Height = CGImageGetHeight(a3);
  size_t v13 = Height;
  if (BitsPerComponent < 9) {
    unint64_t v14 = 1;
  }
  else {
    unint64_t v14 = 8;
  }
  if (BitsPerComponent >= 9) {
    char v15 = 3;
  }
  else {
    char v15 = 0;
  }
  if (!is_mul_ok(Width, Height) || (size_t v16 = Width * Height, !is_mul_ok(Width * Height, v14)))
  {
    if (!IMOSLoggingEnabled()) {
      return 1;
    }
    uint64_t v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v36 = 134218240;
      unint64_t v37 = Width;
      __int16 v38 = 2048;
      unint64_t v39 = v13;
      _os_log_impl(&dword_22B280000, v17, OS_LOG_TYPE_INFO, "_imageContainsTranslucentPixels overflowed with %ld width and %ld height", (uint8_t *)&v36, 0x16u);
    }
LABEL_39:

    return 1;
  }
  unint64_t v19 = v16 * v14;
  int v20 = IMOSLoggingEnabled();
  if (v16 * v14 > 0x2FAF080)
  {
    if (!v20) {
      return 1;
    }
    uint64_t v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v36 = 134217984;
      unint64_t v37 = v19 / 0xF4240;
      _os_log_impl(&dword_22B280000, v17, OS_LOG_TYPE_INFO, "Translucency buffer size (%ld MB) exceeds maximum, cannot test pixels, assuming YES", (uint8_t *)&v36, 0xCu);
    }
    goto LABEL_39;
  }
  if (v20)
  {
    uint64_t v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v36 = 134218240;
      unint64_t v37 = v19 / 0xF4240uLL;
      __int16 v38 = 2048;
      unint64_t v39 = v19 / 0x3E8uLL;
      _os_log_impl(&dword_22B280000, v21, OS_LOG_TYPE_INFO, " ==> Attempting to allocate opacity test buffer of size %ld MB (%ld KB)", (uint8_t *)&v36, 0x16u);
    }
  }
  int v22 = (__int16 *)malloc_type_calloc(Width * v13, v14, 0x2BB677DBuLL);
  if (!v22)
  {
    if (!IMOSLoggingEnabled()) {
      return 1;
    }
    uint64_t v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      LOWORD(v36) = 0;
      _os_log_impl(&dword_22B280000, v17, OS_LOG_TYPE_INFO, "Failed to allocate buffer for image translucency test", (uint8_t *)&v36, 2u);
    }
    goto LABEL_39;
  }
  if (BitsPerComponent >= 9)
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    uint32_t v24 = 1;
  }
  else
  {
    DeviceRGB = 0;
    uint32_t v24 = 7;
  }
  uint64_t v25 = CGBitmapContextCreate(v22, Width, v13, v9, Width << v15, DeviceRGB, v24);
  uint64_t v26 = v25;
  if (!v25)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v35 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        LOWORD(v36) = 0;
        _os_log_impl(&dword_22B280000, v35, OS_LOG_TYPE_INFO, "Failed to create bitmap context while checking translucency of image, returning YES", (uint8_t *)&v36, 2u);
      }
    }
    if (DeviceRGB) {
      CFRelease(DeviceRGB);
    }
    return 1;
  }
  v41.size.width = (double)Width;
  v41.size.height = (double)v13;
  v41.origin.x = 0.0;
  v41.origin.y = 0.0;
  CGContextDrawImage(v25, v41, a3);
  if (v13)
  {
    size_t v27 = 0;
    uint64_t v28 = v22 + 3;
    BOOL v7 = 1;
    uint64_t v29 = (unsigned __int8 *)v22;
    do
    {
      if (Width)
      {
        uint64_t v30 = v29;
        uint64_t v31 = v28;
        size_t v32 = Width;
        do
        {
          if (BitsPerComponent > 8)
          {
            if (*v31 != -1) {
              goto LABEL_71;
            }
          }
          else if (*v30 != 255)
          {
            goto LABEL_71;
          }
          v31 += 4;
          ++v30;
          --v32;
        }
        while (v32);
      }
      ++v27;
      v28 += 4 * Width;
      v29 += Width;
      BOOL v7 = v27 < v13;
    }
    while (v27 != v13);
  }
  BOOL v7 = 0;
LABEL_71:
  if (IMOSLoggingEnabled())
  {
    uint64_t v33 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      uint64_t v34 = @"NO";
      if (v7) {
        uint64_t v34 = @"YES";
      }
      int v36 = 138412290;
      unint64_t v37 = (unint64_t)v34;
      _os_log_impl(&dword_22B280000, v33, OS_LOG_TYPE_INFO, "Found translucent pixel(s) in image: %@", (uint8_t *)&v36, 0xCu);
    }
  }
  CFRelease(v26);
  if (DeviceRGB) {
    CFRelease(DeviceRGB);
  }
  free(v22);
  return v7;
}

- (double)overrideJPEGCompressionQuality
{
  return self->_overrideJPEGCompressionQuality;
}

- (void)setOverrideJPEGCompressionQuality:(double)a3
{
  self->_overrideJPEGCompressionQuality = a3;
}

@end