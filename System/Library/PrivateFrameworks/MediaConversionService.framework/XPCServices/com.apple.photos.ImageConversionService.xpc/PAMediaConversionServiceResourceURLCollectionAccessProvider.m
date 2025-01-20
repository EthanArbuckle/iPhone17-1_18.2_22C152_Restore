@interface PAMediaConversionServiceResourceURLCollectionAccessProvider
- (BOOL)isBlastDoorAccessRequired;
- (NSDictionary)blastDoorMainSourceProperties;
- (NSError)error;
- (NSURL)blastDoorSourceURL;
- (PAMediaConversionServiceResourceURLCollection)collection;
- (PAMediaConversionServiceResourceURLCollectionAccessProvider)initWithOptions:(id)a3;
- (id)_blastDoorConvertImageMetadata:(id)a3;
- (id)_blastDoorMetadataWithSourceURL:(id)a3;
- (id)_blastDoorStoreTemporarySourceImageWithImageRef:(CGImage *)a3 sourceURL:(id)a4 error:(id *)a5;
- (id)_blastDoorURLWithImageSourceURL:(id)a3 properties:(id *)a4;
- (id)_blastDoorURLWithVideoSourceURL:(id)a3 sourceMetadata:(id)a4;
- (id)propertiesForVideoComplementURL:(id)a3;
- (id)validateAccessForURL:(id)a3 role:(id)a4;
- (void)setBlastDoorAccessRequired:(BOOL)a3;
- (void)setBlastDoorMainSourceProperties:(id)a3;
- (void)setCollection:(id)a3;
- (void)setError:(id)a3;
@end

@implementation PAMediaConversionServiceResourceURLCollectionAccessProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_blastDoorMainSourceProperties, 0);
  objc_storeStrong((id *)&self->_blastDoorSourceURL, 0);
  objc_storeStrong((id *)&self->_blastdoorInterface, 0);
}

- (void)setCollection:(id)a3
{
}

- (PAMediaConversionServiceResourceURLCollection)collection
{
  return (PAMediaConversionServiceResourceURLCollection *)objc_getProperty(self, a2, 56, 1);
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 48, 1);
}

- (void)setBlastDoorMainSourceProperties:(id)a3
{
}

- (NSDictionary)blastDoorMainSourceProperties
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBlastDoorAccessRequired:(BOOL)a3
{
  self->_blastDoorAccessRequired = a3;
}

- (BOOL)isBlastDoorAccessRequired
{
  return self->_blastDoorAccessRequired;
}

- (id)_blastDoorConvertImageMetadata:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v5 = kPFMediaPropertyCreationDate;
  uint64_t v6 = [v3 imageDate];
  v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8) {
    [v4 setObject:v6 forKey:v5];
  }

  if (objc_msgSend(v3, "has_timezoneOffset"))
  {
    uint64_t v9 = kPFMediaPropertyTimeZoneOffsetSeconds;
    uint64_t v10 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 timezoneOffset]);
    v11 = (void *)v10;
    if (v9) {
      BOOL v12 = v10 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    if (!v12) {
      [v4 setObject:v10 forKey:v9];
    }
  }
  if (objc_msgSend(v3, "has_subsecTimeOriginal"))
  {
    [v3 subsecTimeOriginal];
    uint64_t v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v14 = (void *)v13;
    if (kCGImagePropertyExifSubsecTimeOriginal) {
      BOOL v15 = v13 == 0;
    }
    else {
      BOOL v15 = 1;
    }
    if (!v15) {
      [v4 setObject:v13 forKey:kCGImagePropertyExifSubsecTimeOriginal];
    }
  }
  if (objc_msgSend(v3, "has_rawOrientation"))
  {
    uint64_t v16 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 rawOrientation]);
    v17 = (void *)v16;
    if (kCGImagePropertyOrientation && v16) {
      [v4 setObject:v16 forKey:kCGImagePropertyOrientation];
    }
  }
  if (objc_msgSend(v3, "has_rawPixelWidth"))
  {
    uint64_t v18 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 rawPixelWidth]);
    v19 = (void *)v18;
    if (kCGImagePropertyPixelWidth && v18) {
      [v4 setObject:v18 forKey:kCGImagePropertyPixelWidth];
    }
  }
  if (objc_msgSend(v3, "has_rawPixelHeight"))
  {
    uint64_t v20 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 rawPixelHeight]);
    v21 = (void *)v20;
    if (kCGImagePropertyPixelHeight && v20) {
      [v4 setObject:v20 forKey:kCGImagePropertyPixelHeight];
    }
  }
  uint64_t v22 = [v3 lensModel];
  v23 = (void *)v22;
  if (kCGImagePropertyExifLensModel && v22) {
    [v4 setObject:v22 forKey:kCGImagePropertyExifLensModel];
  }

  uint64_t v24 = [v3 lensMake];
  v25 = (void *)v24;
  if (kCGImagePropertyExifLensMake && v24) {
    [v4 setObject:v24 forKey:kCGImagePropertyExifLensMake];
  }

  uint64_t v26 = [v3 profileName];
  v27 = (void *)v26;
  if (kCGImagePropertyProfileName && v26) {
    [v4 setObject:v26 forKey:kCGImagePropertyProfileName];
  }

  if (objc_msgSend(v3, "has_processingFlags"))
  {
    uint64_t v28 = kPFImagePropertyCustomPhotoProcessingFlags;
    uint64_t v29 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 processingFlags]);
    v30 = (void *)v29;
    if (v28 && v29) {
      [v4 setObject:v29 forKey:v28];
    }
  }
  if (objc_msgSend(v3, "has_isCustomRendered"))
  {
    uint64_t v31 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isCustomRendered]);
    v32 = (void *)v31;
    if (kCGImagePropertyExifCustomRendered && v31) {
      [v4 setObject:v31 forKey:kCGImagePropertyExifCustomRendered];
    }
  }
  if (objc_msgSend(v3, "has_apertureValue"))
  {
    [v3 apertureValue];
    uint64_t v33 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v34 = (void *)v33;
    if (kCGImagePropertyExifFNumber && v33) {
      [v4 setObject:v33 forKey:kCGImagePropertyExifFNumber];
    }
  }
  if (objc_msgSend(v3, "has_exposureBiasValue"))
  {
    uint64_t v35 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 exposureBiasValue]);
    v36 = (void *)v35;
    if (kCGImagePropertyExifExposureBiasValue && v35) {
      [v4 setObject:v35 forKey:kCGImagePropertyExifExposureBiasValue];
    }
  }
  if (objc_msgSend(v3, "has_flash"))
  {
    uint64_t v37 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 flash]);
    v38 = (void *)v37;
    if (kCGImagePropertyExifFlash && v37) {
      [v4 setObject:v37 forKey:kCGImagePropertyExifFlash];
    }
  }
  if (objc_msgSend(v3, "has_focalLength"))
  {
    [v3 focalLength];
    uint64_t v39 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v40 = (void *)v39;
    if (kCGImagePropertyExifFocalLength && v39) {
      [v4 setObject:v39 forKey:kCGImagePropertyExifFocalLength];
    }
  }
  if (objc_msgSend(v3, "has_focalLenIn35mmFilm"))
  {
    [v3 focalLenIn35mmFilm];
    uint64_t v41 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v42 = (void *)v41;
    if (kCGImagePropertyExifFocalLenIn35mmFilm && v41) {
      [v4 setObject:v41 forKey:kCGImagePropertyExifFocalLenIn35mmFilm];
    }
  }
  if (objc_msgSend(v3, "has_isoRatingValue"))
  {
    uint64_t v43 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 isoRatingValue]);
    v44 = (void *)v43;
    if (kCGImagePropertyExifISOSpeed && v43) {
      [v4 setObject:v43 forKey:kCGImagePropertyExifISOSpeed];
    }
  }
  if (objc_msgSend(v3, "has_meteringMode"))
  {
    uint64_t v45 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 meteringMode]);
    v46 = (void *)v45;
    if (kCGImagePropertyExifMeteringMode && v45) {
      [v4 setObject:v45 forKey:kCGImagePropertyExifMeteringMode];
    }
  }
  if (objc_msgSend(v3, "has_shutterSpeed"))
  {
    [v3 shutterSpeed];
    uint64_t v47 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v48 = (void *)v47;
    if (kCGImagePropertyExifExposureTime && v47) {
      [v4 setObject:v47 forKey:kCGImagePropertyExifExposureTime];
    }
  }
  uint64_t v49 = [v3 model];
  v50 = (void *)v49;
  if (kCGImagePropertyTIFFModel && v49) {
    [v4 setObject:v49 forKey:kCGImagePropertyTIFFModel];
  }

  uint64_t v51 = [v3 make];
  v52 = (void *)v51;
  if (kCGImagePropertyTIFFMake && v51) {
    [v4 setObject:v51 forKey:kCGImagePropertyTIFFMake];
  }

  if (objc_msgSend(v3, "has_whiteBalance"))
  {
    uint64_t v53 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 whiteBalance]);
    v54 = (void *)v53;
    if (kCGImagePropertyExifWhiteBalance && v53) {
      [v4 setObject:v53 forKey:kCGImagePropertyExifWhiteBalance];
    }
  }
  if (objc_msgSend(v3, "has_lightSource"))
  {
    uint64_t v55 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 lightSource]);
    v56 = (void *)v55;
    if (kCGImagePropertyExifLightSource && v55) {
      [v4 setObject:v55 forKey:kCGImagePropertyExifLightSource];
    }
  }
  if (objc_msgSend(v3, "has_ciffWhiteBalanceIndex"))
  {
    uint64_t v57 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 ciffWhiteBalanceIndex]);
    v58 = (void *)v57;
    if (kCGImagePropertyCIFFWhiteBalanceIndex && v57) {
      [v4 setObject:v57 forKey:kCGImagePropertyCIFFWhiteBalanceIndex];
    }
  }
  if (objc_msgSend(v3, "has_hdrGain"))
  {
    uint64_t v59 = kPFImagePropertyHDRGain;
    [v3 hdrGain];
    uint64_t v60 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v61 = (void *)v60;
    if (v59 && v60) {
      [v4 setObject:v60 forKey:v59];
    }
  }
  if (objc_msgSend(v3, "has_hasHDRGainMap"))
  {
    uint64_t v62 = kPFImagePropertyHasHDRGainMap;
    uint64_t v63 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 hasHDRGainMap]);
    v64 = (void *)v63;
    if (v62 && v63) {
      [v4 setObject:v63 forKey:v62];
    }
  }
  if (objc_msgSend(v3, "has_videoDynamicRange"))
  {
    uint64_t v65 = kPFVideoPropertyVideoDynamicRange;
    uint64_t v66 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 videoDynamicRange]);
    v67 = (void *)v66;
    if (v65 && v66) {
      [v4 setObject:v66 forKey:v65];
    }
  }
  if (objc_msgSend(v3, "has_videoContainsCinematicData"))
  {
    uint64_t v68 = kPFVideoPropertyVideoContainsCinematicData;
    uint64_t v69 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 videoContainsCinematicData]);
    v70 = (void *)v69;
    if (v68 && v69) {
      [v4 setObject:v69 forKey:v68];
    }
  }
  uint64_t v71 = kPFMediaPropertyLivePhotoPairingIdentifier;
  uint64_t v72 = [v3 videoComplementMediaGroupId];
  v73 = (void *)v72;
  if (v71 && v72) {
    [v4 setObject:v72 forKey:v71];
  }

  if (objc_msgSend(v3, "has_gifDelayTime"))
  {
    [v3 gifDelayTime];
    uint64_t v74 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v75 = (void *)v74;
    if (kCGImagePropertyGIFDelayTime && v74) {
      [v4 setObject:v74 forKey:kCGImagePropertyGIFDelayTime];
    }
  }
  if (objc_msgSend(v3, "has_variationIdentifier"))
  {
    uint64_t v76 = kPFVideoPropertyPlaybackVariationIdentifier;
    uint64_t v77 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 variationIdentifier]);
    v78 = (void *)v77;
    if (v76 && v77) {
      [v4 setObject:v77 forKey:v76];
    }
  }
  if (objc_msgSend(v3, "has_videoComplementDurationValue"))
  {
    uint64_t v79 = kPFVideoPropertyVideoComplVideoDurationValue;
    [v3 videoComplementDurationValue];
    uint64_t v80 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v81 = (void *)v80;
    if (v79 && v80) {
      [v4 setObject:v80 forKey:v79];
    }
  }
  if (objc_msgSend(v3, "has_videoComplementDurationTimescale"))
  {
    uint64_t v82 = kPFVideoPropertyVideoComplVideoDurationTimescale;
    [v3 videoComplementDurationTimescale];
    uint64_t v83 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v84 = (void *)v83;
    if (v82 && v83) {
      [v4 setObject:v83 forKey:v82];
    }
  }
  if (objc_msgSend(v3, "has_videoComplementImageDisplayValue"))
  {
    uint64_t v85 = kPFVideoPropertyVideoComplVideoImageDisplayValue;
    [v3 videoComplementImageDisplayValue];
    uint64_t v86 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v87 = (void *)v86;
    if (v85 && v86) {
      [v4 setObject:v86 forKey:v85];
    }
  }
  if (objc_msgSend(v3, "has_videoComplementImageDisplayTimescale"))
  {
    uint64_t v88 = kPFVideoPropertyVideoComplVideoImageDisplayTimescale;
    [v3 videoComplementImageDisplayTimescale];
    uint64_t v89 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v90 = (void *)v89;
    if (v88 && v89) {
      [v4 setObject:v89 forKey:v88];
    }
  }
  if (objc_msgSend(v3, "has_videoDurationValue"))
  {
    uint64_t v91 = kPFVideoPropertyVideoDurationValue;
    [v3 videoDurationValue];
    uint64_t v92 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v93 = (void *)v92;
    if (v91 && v92) {
      [v4 setObject:v92 forKey:v91];
    }
  }
  if (objc_msgSend(v3, "has_videoDurationTimescale"))
  {
    uint64_t v94 = kPFVideoPropertyVideoDurationTimescale;
    [v3 videoDurationTimescale];
    uint64_t v95 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v96 = (void *)v95;
    if (v94 && v95) {
      [v4 setObject:v95 forKey:v94];
    }
  }
  if (objc_msgSend(v3, "has_avFPS"))
  {
    uint64_t v97 = kPFVideoPropertyAVFPS;
    [v3 avFPS];
    uint64_t v98 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v99 = (void *)v98;
    if (v97 && v98) {
      [v4 setObject:v98 forKey:v97];
    }
  }
  uint64_t v100 = kPFVideoPropertyCustomCodecFourCharCode;
  uint64_t v101 = [v3 codecFourCharCode];
  v102 = (void *)v101;
  if (v100 && v101) {
    [v4 setObject:v101 forKey:v100];
  }

  uint64_t v103 = kPFVideoPropertyCaptureMode;
  uint64_t v104 = [v3 captureMode];
  v105 = (void *)v104;
  if (v103 && v104) {
    [v4 setObject:v104 forKey:v103];
  }

  uint64_t v106 = kPFVideoPropertyVideoIsMontage;
  uint64_t v107 = [v3 isVideoMontage];
  v108 = (void *)v107;
  if (v106 && v107) {
    [v4 setObject:v107 forKey:v106];
  }

  if (objc_msgSend(v3, "has_isProRes"))
  {
    uint64_t v109 = kPFVideoPropertyIsProRes;
    uint64_t v110 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isProRes]);
    v111 = (void *)v110;
    if (v109 && v110) {
      [v4 setObject:v110 forKey:v109];
    }
  }
  uint64_t v112 = kPFMediaPropertyOriginatingAssetIdentifier;
  uint64_t v113 = [v3 originatingAssetIdentifier];
  v114 = (void *)v113;
  if (v112 && v113) {
    [v4 setObject:v113 forKey:v112];
  }

  if (objc_msgSend(v3, "has_longitude"))
  {
    [v3 longitude];
    uint64_t v115 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v116 = (void *)v115;
    if (kCGImagePropertyGPSLongitude && v115) {
      [v4 setObject:v115 forKey:kCGImagePropertyGPSLongitude];
    }
  }
  if (objc_msgSend(v3, "has_latitude"))
  {
    [v3 latitude];
    uint64_t v117 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v118 = (void *)v117;
    if (kCGImagePropertyGPSLatitude && v117) {
      [v4 setObject:v117 forKey:kCGImagePropertyGPSLatitude];
    }
  }
  if (objc_msgSend(v3, "has_gpsSpeed"))
  {
    [v3 gpsSpeed];
    uint64_t v119 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v120 = (void *)v119;
    if (kCGImagePropertyGPSSpeed && v119) {
      [v4 setObject:v119 forKey:kCGImagePropertyGPSSpeed];
    }
  }
  uint64_t v121 = [v3 gpsSpeedRef];
  v122 = (void *)v121;
  if (kCGImagePropertyGPSSpeedRef && v121) {
    [v4 setObject:v121 forKey:kCGImagePropertyGPSSpeedRef];
  }

  uint64_t v123 = kPFImagePropertyExifGPSDateTime;
  uint64_t v124 = [v3 gpsTimestamp];
  v125 = (void *)v124;
  if (v123 && v124) {
    [v4 setObject:v124 forKey:v123];
  }

  if (objc_msgSend(v3, "has_gpsHPositioningError"))
  {
    [v3 gpsHPositioningError];
    uint64_t v126 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v127 = (void *)v126;
    if (kCGImagePropertyGPSHPositioningError && v126) {
      [v4 setObject:v126 forKey:kCGImagePropertyGPSHPositioningError];
    }
  }
  if (objc_msgSend(v3, "has_altitude"))
  {
    [v3 altitude];
    uint64_t v128 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v129 = (void *)v128;
    if (kCGImagePropertyGPSAltitude && v128) {
      [v4 setObject:v128 forKey:kCGImagePropertyGPSAltitude];
    }
  }
  if (objc_msgSend(v3, "has_imageDirection"))
  {
    [v3 imageDirection];
    uint64_t v130 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v131 = (void *)v130;
    if (kCGImagePropertyGPSImgDirection && v130) {
      [v4 setObject:v130 forKey:kCGImagePropertyGPSImgDirection];
    }
  }
  uint64_t v132 = [v3 imageDirectionRef];
  v133 = (void *)v132;
  if (kCGImagePropertyGPSImgDirectionRef && v132) {
    [v4 setObject:v132 forKey:kCGImagePropertyGPSImgDirectionRef];
  }

  if (objc_msgSend(v3, "has_isPhotoBooth"))
  {
    uint64_t v134 = kPFImagePropertyIsPhotoBooth;
    uint64_t v135 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isPhotoBooth]);
    v136 = (void *)v135;
    if (v134 && v135) {
      [v4 setObject:v135 forKey:v134];
    }
  }
  uint64_t v137 = [v3 userComment];
  v138 = (void *)v137;
  if (kCGImagePropertyExifUserComment && v137) {
    [v4 setObject:v137 forKey:kCGImagePropertyExifUserComment];
  }

  uint64_t v139 = kPFImagePropertyBurstUuid;
  uint64_t v140 = [v3 burstUuid];
  v141 = (void *)v140;
  if (v139 && v140) {
    [v4 setObject:v140 forKey:v139];
  }

  if (objc_msgSend(v3, "has_isFrontFacingCamera"))
  {
    uint64_t v142 = kPFImagePropertyFrontFacingCamera;
    uint64_t v143 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isFrontFacingCamera]);
    v144 = (void *)v143;
    if (v142 && v143) {
      [v4 setObject:v143 forKey:v142];
    }
  }
  uint64_t v145 = kPFImagePropertySpatialOverCaptureIdentifier;
  uint64_t v146 = [v3 spatialOverCaptureIdentifier];
  v147 = (void *)v146;
  if (v145 && v146) {
    [v4 setObject:v146 forKey:v145];
  }

  if (objc_msgSend(v3, "has_hasSpatialAudio"))
  {
    uint64_t v148 = kPFImagePropertyHasSpatialAudio;
    uint64_t v149 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 hasSpatialAudio]);
    v150 = (void *)v149;
    if (v148 && v149) {
      [v4 setObject:v149 forKey:v148];
    }
  }
  if (objc_msgSend(v3, "has_fileSize"))
  {
    uint64_t v151 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 fileSize]);
    v152 = (void *)v151;
    if (NSFileSize && v151) {
      [v4 setObject:v151 forKey:NSFileSize];
    }
  }
  uint64_t v153 = kPFFilePropertyOriginalFilename;
  uint64_t v154 = [v3 originalFileName];
  v155 = (void *)v154;
  if (v153 && v154) {
    [v4 setObject:v154 forKey:v153];
  }

  if (objc_msgSend(v3, "has_semanticStyleSceneBias"))
  {
    uint64_t v156 = kPFImagePropertySemanticStyleSceneBias;
    [v3 semanticStyleSceneBias];
    uint64_t v157 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v158 = (void *)v157;
    if (v156 && v157) {
      [v4 setObject:v157 forKey:v156];
    }
  }
  if (objc_msgSend(v3, "has_semanticStyleWarmthBias"))
  {
    uint64_t v159 = kPFImagePropertySemanticStyleWarmthBias;
    [v3 semanticStyleWarmthBias];
    uint64_t v160 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v161 = (void *)v160;
    if (v159 && v160) {
      [v4 setObject:v160 forKey:v159];
    }
  }
  if (objc_msgSend(v3, "has_semanticStyleRenderingVersion"))
  {
    uint64_t v162 = kPFImagePropertySemanticStyleRenderingVersion;
    uint64_t v163 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 semanticStyleRenderingVersion]);
    v164 = (void *)v163;
    if (v162 && v163) {
      [v4 setObject:v163 forKey:v162];
    }
  }
  if (objc_msgSend(v3, "has_semanticStylePreset"))
  {
    uint64_t v165 = kPFImagePropertySemanticStylePreset;
    uint64_t v166 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 semanticStylePreset]);
    v167 = (void *)v166;
    if (v165 && v166) {
      [v4 setObject:v166 forKey:v165];
    }
  }
  if (objc_msgSend(v3, "has_smartStyleToneBias"))
  {
    uint64_t v168 = kPFImagePropertySmartStyleToneBias;
    [v3 smartStyleToneBias];
    uint64_t v169 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v170 = (void *)v169;
    if (v168 && v169) {
      [v4 setObject:v169 forKey:v168];
    }
  }
  if (objc_msgSend(v3, "has_smartStyleColorBias"))
  {
    uint64_t v171 = kPFImagePropertySmartStyleColorBias;
    [v3 smartStyleColorBias];
    uint64_t v172 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v173 = (void *)v172;
    if (v171 && v172) {
      [v4 setObject:v172 forKey:v171];
    }
  }
  if (objc_msgSend(v3, "has_smartStyleIntensity"))
  {
    uint64_t v174 = kPFImagePropertySmartStyleIntensity;
    [v3 smartStyleIntensity];
    uint64_t v175 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v176 = (void *)v175;
    if (v174 && v175) {
      [v4 setObject:v175 forKey:v174];
    }
  }
  if (objc_msgSend(v3, "has_smartStyleCast"))
  {
    uint64_t v177 = kPFImagePropertySmartStyleCast;
    [v3 smartStyleCast];
    uint64_t v178 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v179 = (void *)v178;
    if (v177 && v178) {
      [v4 setObject:v178 forKey:v177];
    }
  }
  if (objc_msgSend(v3, "has_smartStyleRenderingVersion"))
  {
    uint64_t v180 = kPFImagePropertySmartStyleRenderingVersion;
    uint64_t v181 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 smartStyleRenderingVersion]);
    v182 = (void *)v181;
    if (v180 && v181) {
      [v4 setObject:v181 forKey:v180];
    }
  }
  if (objc_msgSend(v3, "has_smartStyleIsReversible"))
  {
    uint64_t v183 = kPFImagePropertySmartStyleIsReversible;
    uint64_t v184 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 smartStyleIsReversible]);
    v185 = (void *)v184;
    if (v183 && v184) {
      [v4 setObject:v184 forKey:v183];
    }
  }
  uint64_t v186 = kPFImagePropertyIsHDR;
  uint64_t v187 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isHDR]);
  v188 = (void *)v187;
  if (v186 && v187) {
    [v4 setObject:v187 forKey:v186];
  }

  uint64_t v189 = kPFImagePropertyHasISOGainMap;
  uint64_t v190 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 hasISOGainMap]);
  v191 = (void *)v190;
  if (v189 && v190) {
    [v4 setObject:v190 forKey:v189];
  }

  uint64_t v192 = kPFImagePropertyIsAnimatedImage;
  uint64_t v193 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isAnimatedImage]);
  v194 = (void *)v193;
  if (v192 && v193) {
    [v4 setObject:v193 forKey:v192];
  }

  uint64_t v195 = kPFImagePropertyStillImageCaptureFlags;
  uint64_t v196 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 stillImageCaptureFlags]);
  v197 = (void *)v196;
  if (v195 && v196) {
    [v4 setObject:v196 forKey:v195];
  }

  uint64_t v198 = kPFImagePropertyExifFlashFired;
  uint64_t v199 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 exifFlashFired]);
  v200 = (void *)v199;
  if (v198 && v199) {
    [v4 setObject:v199 forKey:v198];
  }

  uint64_t v201 = kPFImagePropertyIsAlchemist;
  uint64_t v202 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isAlchemist]);
  v203 = (void *)v202;
  if (v201 && v202) {
    [v4 setObject:v202 forKey:v201];
  }

  [v3 exifAuxFlashCompensation];
  uint64_t v204 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v205 = (void *)v204;
  if (kCGImagePropertyExifAuxFlashCompensation && v204) {
    [v4 setObject:v204 forKey:kCGImagePropertyExifAuxFlashCompensation];
  }

  uint64_t v206 = [v3 IPTCCredit];
  v207 = (void *)v206;
  if (kCGImagePropertyIPTCCredit && v206) {
    [v4 setObject:v206 forKey:kCGImagePropertyIPTCCredit];
  }

  uint64_t v208 = kPFVideoPropertyCaptureModeTimelapse;
  uint64_t v209 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 captureModeTimelapse]);
  v210 = (void *)v209;
  if (v208 && v209) {
    [v4 setObject:v209 forKey:v208];
  }

  uint64_t v211 = kPFImagePropertyIsThreeImageStereoHEIC;
  uint64_t v212 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isThreeImageStereoHEIC]);
  v213 = (void *)v212;
  if (v211 && v212) {
    [v4 setObject:v212 forKey:v211];
  }

  uint64_t v214 = kPFImagePropertyGenerativeAIImageType;
  [v3 generativeAIImageType];
  uint64_t v215 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v216 = (void *)v215;
  if (v214 && v215) {
    [v4 setObject:v215 forKey:v214];
  }

  v217 = [v3 uniformTypeIdentifier];
  if (!v217)
  {
    v218 = [v3 originalFileName];
    v219 = [v218 pathExtension];
    v220 = +[PFUniformTypeUtilities typeWithFilenameExtension:v219];

    v217 = [v220 identifier];
  }
  if (v217 && kPFFilePropertyUniformTypeIdentifier) {
    objc_msgSend(v4, "setObject:forKey:", v217);
  }
  id v221 = v4;

  return v221;
}

- (id)_blastDoorStoreTemporarySourceImageWithImageRef:(CGImage *)a3 sourceURL:(id)a4 error:(id *)a5
{
  id v7 = a4;
  BOOL v8 = v7;
  if (!a3)
  {
    NSErrorUserInfoKey v30 = NSDebugDescriptionErrorKey;
    v11 = +[NSString stringWithFormat:@"Invalid image access for the blast door reference. Source: %@", v7];
    uint64_t v31 = v11;
    uint64_t v16 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    uint64_t v22 = +[NSError errorWithDomain:@"PAMediaConversionServiceErrorDomain" code:3 userInfo:v16];
    goto LABEL_12;
  }
  uint64_t v9 = [v7 stringByDeletingPathExtension];
  uint64_t v10 = +[PFUniformTypeUtilities preferredOrFallbackFilenameExtensionForType:UTTypeJPEG];
  v11 = [v9 stringByAppendingPathExtension:v10];

  BOOL v12 = NSTemporaryDirectory();
  v38[0] = v12;
  uint64_t v13 = +[NSUUID UUID];
  v14 = [v13 UUIDString];
  v38[1] = v14;
  v38[2] = v11;
  uint64_t v15 = +[NSArray arrayWithObjects:v38 count:3];
  uint64_t v16 = +[NSURL fileURLWithPathComponents:v15];

  v17 = +[NSFileManager defaultManager];
  uint64_t v18 = [v16 URLByDeletingLastPathComponent];
  id v29 = 0;
  LOBYTE(v15) = [v17 createDirectoryAtURL:v18 withIntermediateDirectories:1 attributes:0 error:&v29];
  id v19 = v29;

  if ((v15 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v37 = v19;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[BlastDoor] Failed to create tempory source location for blast door reference. Error: %@", buf, 0xCu);
    }
    goto LABEL_9;
  }
  uint64_t v20 = [UTTypeJPEG identifier];
  v21 = CGImageDestinationCreateWithURL((CFURLRef)v16, v20, 1uLL, 0);

  if (!v21)
  {
LABEL_9:
    NSErrorUserInfoKey v32 = NSDebugDescriptionErrorKey;
    v23 = +[NSString stringWithFormat:@"Failed to access temporary destination location for the blast door reference to %@. Source: %@", v16, v8];
    uint64_t v33 = v23;
    uint64_t v24 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    uint64_t v22 = +[NSError errorWithDomain:@"PAMediaConversionServiceErrorDomain" code:3 userInfo:v24];

    a3 = 0;
    goto LABEL_12;
  }
  CGImageDestinationAddImage(v21, a3, 0);
  if (CGImageDestinationFinalize(v21))
  {
    a3 = v16;
  }
  else
  {
    NSErrorUserInfoKey v34 = NSDebugDescriptionErrorKey;
    v25 = +[NSString stringWithFormat:@"Failed to write temporary image from blast door reference to %@. Source: %@", v16, v8];
    uint64_t v35 = v25;
    uint64_t v26 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    uint64_t v27 = +[NSError errorWithDomain:@"PAMediaConversionServiceErrorDomain" code:3 userInfo:v26];

    a3 = 0;
    id v19 = (id)v27;
  }
  CFRelease(v21);
  uint64_t v22 = v19;
LABEL_12:

  if (!v22 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    if (!a5) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  *(_DWORD *)buf = 138543362;
  id v37 = v22;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[BlastDoor] Failed to process blast door temporary source. Error: %{public}@", buf, 0xCu);
  if (a5) {
LABEL_15:
  }
    *a5 = v22;
LABEL_16:

  return a3;
}

- (id)_blastDoorURLWithVideoSourceURL:(id)a3 sourceMetadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = v7;
  uint64_t v31 = 0;
  NSErrorUserInfoKey v32 = &v31;
  uint64_t v33 = 0x3032000000;
  NSErrorUserInfoKey v34 = sub_100004F8C;
  uint64_t v35 = sub_100004F9C;
  id v36 = 0;
  if (v7)
  {
    uint64_t v9 = [v7 objectForKeyedSubscript:kCGImagePropertyPixelWidth];
    [v9 floatValue];
    float v11 = v10;

    BOOL v12 = [v8 objectForKeyedSubscript:kCGImagePropertyPixelHeight];
    [v12 floatValue];
    float v14 = v13;

    if (v11 >= v14) {
      float v15 = v11;
    }
    else {
      float v15 = v14;
    }
    float v16 = fabsf(v15);
    if (v15 != 0.0 && v16 <= 1200.0) {
      float v18 = v16;
    }
    else {
      float v18 = 1200.0;
    }
  }
  else
  {
    float v18 = 1200.0;
  }
  dispatch_block_t v19 = dispatch_block_create((dispatch_block_flags_t)0, &stru_100034C90);
  blastdoorInterface = self->_blastdoorInterface;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100004FA4;
  v27[3] = &unk_100034C28;
  NSErrorUserInfoKey v30 = &v31;
  v27[4] = self;
  id v21 = v6;
  id v28 = v21;
  id v22 = v19;
  id v29 = v22;
  LODWORD(v23) = 1.0;
  *(float *)&double v24 = v18;
  -[IMMessagesBlastDoorInterface generateMoviePreviewForAttachmentWithFileURL:maxPixelDimension:minThumbnailPxSize:scale:resultHandler:](blastdoorInterface, "generateMoviePreviewForAttachmentWithFileURL:maxPixelDimension:minThumbnailPxSize:scale:resultHandler:", v21, v27, v24, 0.0, 0.0, v23);
  dispatch_block_wait(v22, 0xFFFFFFFFFFFFFFFFLL);
  id v25 = (id)v32[5];

  _Block_object_dispose(&v31, 8);
  return v25;
}

- (id)_blastDoorURLWithImageSourceURL:(id)a3 properties:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = sub_100004F8C;
  id v28 = sub_100004F9C;
  id v29 = 0;
  uint64_t v18 = 0;
  dispatch_block_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = sub_100004F8C;
  id v22 = sub_100004F9C;
  id v23 = 0;
  dispatch_block_t v7 = dispatch_block_create((dispatch_block_flags_t)0, &stru_100034C48);
  blastdoorInterface = self->_blastdoorInterface;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000056F4;
  v13[3] = &unk_100034C70;
  float v16 = &v24;
  v13[4] = self;
  id v9 = v6;
  id v14 = v9;
  v17 = &v18;
  id v10 = v7;
  id v15 = v10;
  [(IMMessagesBlastDoorInterface *)blastdoorInterface generatePreviewforAttachmentWithfileURL:v9 resultHandler:v13];
  dispatch_block_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  if (a4) {
    *a4 = (id) v19[5];
  }
  id v11 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

- (id)_blastDoorMetadataWithSourceURL:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  float v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = sub_100004F8C;
  dispatch_block_t v19 = sub_100004F9C;
  id v20 = 0;
  dispatch_block_t v5 = dispatch_block_create((dispatch_block_flags_t)0, &stru_100034C00);
  blastdoorInterface = self->_blastdoorInterface;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100005D04;
  v11[3] = &unk_100034C28;
  id v14 = &v15;
  v11[4] = self;
  id v7 = v4;
  id v12 = v7;
  id v8 = v5;
  id v13 = v8;
  [(IMMessagesBlastDoorInterface *)blastdoorInterface generateMetadataforAttachmentWithfileURL:v7 resultHandler:v11];
  dispatch_block_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (id)propertiesForVideoComplementURL:(id)a3
{
  if (a3)
  {
    id v4 = -[PAMediaConversionServiceResourceURLCollectionAccessProvider _blastDoorMetadataWithSourceURL:](self, "_blastDoorMetadataWithSourceURL:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)validateAccessForURL:(id)a3 role:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (NSURL *)v6;
  id v9 = v8;
  if ([(PAMediaConversionServiceResourceURLCollectionAccessProvider *)self isBlastDoorAccessRequired])
  {
    id v9 = v8;
    if ([v7 isEqualToString:@"PAMediaConversionResourceRoleMainResource"])
    {
      id v10 = self;
      objc_sync_enter(v10);
      if (!v10->_blastDoorSourceURL)
      {
        if (v10->_isImageMedia)
        {
          id v18 = 0;
          uint64_t v11 = [(PAMediaConversionServiceResourceURLCollectionAccessProvider *)v10 _blastDoorURLWithImageSourceURL:v8 properties:&v18];
          id v12 = v18;
          blastDoorSourceURL = v10->_blastDoorSourceURL;
          v10->_blastDoorSourceURL = (NSURL *)v11;

          [(PAMediaConversionServiceResourceURLCollectionAccessProvider *)v10 setBlastDoorMainSourceProperties:v12];
        }
        else
        {
          id v14 = [(PAMediaConversionServiceResourceURLCollectionAccessProvider *)v10 _blastDoorMetadataWithSourceURL:v8];
          [(PAMediaConversionServiceResourceURLCollectionAccessProvider *)v10 setBlastDoorMainSourceProperties:v14];

          id v12 = [(PAMediaConversionServiceResourceURLCollectionAccessProvider *)v10 blastDoorMainSourceProperties];
          uint64_t v15 = [(PAMediaConversionServiceResourceURLCollectionAccessProvider *)v10 _blastDoorURLWithVideoSourceURL:v8 sourceMetadata:v12];
          float v16 = v10->_blastDoorSourceURL;
          v10->_blastDoorSourceURL = (NSURL *)v15;
        }
      }
      id v9 = v10->_blastDoorSourceURL;

      objc_sync_exit(v10);
    }
  }

  return v9;
}

- (NSURL)blastDoorSourceURL
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_blastDoorSourceURL;
  objc_sync_exit(v2);

  return v3;
}

- (PAMediaConversionServiceResourceURLCollectionAccessProvider)initWithOptions:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PAMediaConversionServiceResourceURLCollectionAccessProvider;
  dispatch_block_t v5 = [(PAMediaConversionServiceResourceURLCollectionAccessProvider *)&v21 init];
  if (!v5) {
    goto LABEL_12;
  }
  id v6 = [v4 objectForKeyedSubscript:@"PAMediaConversionServiceOptionBlastDoorMediaIsImageKey"];
  if (v6)
  {
    id v7 = [v4 objectForKeyedSubscript:@"PAMediaConversionServiceOptionBlastDoorMediaIsImageKey"];
    v5->_isImageMedia = [v7 BOOLValue];
  }
  else
  {
    v5->_isImageMedia = 1;
  }

  id v8 = [v4 objectForKeyedSubscript:@"PAMediaConversionServiceOptionRequiresBlastDoorAccessKey"];
  v5->_blastDoorAccessRequired = [v8 BOOLValue];

  if (!v5->_blastDoorAccessRequired) {
    goto LABEL_12;
  }
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2050000000;
  id v9 = (void *)qword_10003CCD0;
  uint64_t v30 = qword_10003CCD0;
  if (!qword_10003CCD0)
  {
    id v22 = _NSConcreteStackBlock;
    uint64_t v23 = 3221225472;
    uint64_t v24 = sub_1000064B4;
    id v25 = &unk_100034CB8;
    uint64_t v26 = &v27;
    sub_1000064B4((uint64_t)&v22);
    id v9 = (void *)v28[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v27, 8);
  id v11 = [v10 alloc];
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000;
  id v12 = (id *)qword_10003CCE0;
  uint64_t v30 = qword_10003CCE0;
  if (!qword_10003CCE0)
  {
    id v22 = _NSConcreteStackBlock;
    uint64_t v23 = 3221225472;
    uint64_t v24 = sub_1000066A0;
    id v25 = &unk_100034CB8;
    uint64_t v26 = &v27;
    id v13 = sub_100005334();
    id v14 = dlsym(v13, "BlastDoorInstanceTypeHubble");
    *(void *)(v26[1] + 24) = v14;
    qword_10003CCE0 = *(void *)(v26[1] + 24);
    id v12 = (id *)v28[3];
  }
  _Block_object_dispose(&v27, 8);
  if (v12)
  {
    id v15 = *v12;
    float v16 = (IMMessagesBlastDoorInterface *)[v11 initWithBlastDoorInstanceType:v15];
    blastdoorInterface = v5->_blastdoorInterface;
    v5->_blastdoorInterface = v16;

LABEL_12:
    return v5;
  }
  dispatch_block_t v19 = +[NSAssertionHandler currentHandler];
  id v20 = +[NSString stringWithUTF8String:"BlastDoorInstanceType getBlastDoorInstanceTypeHubble(void)"];
  objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, @"PAMediaConversionServiceResourceURLCollectionAccessProvider.m", 35, @"%s", dlerror());

  __break(1u);
  return result;
}

@end