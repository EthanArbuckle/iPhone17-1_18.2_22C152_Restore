@interface PHAssetPhotosInfoPanelExtendedProperties
+ (id)entityName;
+ (id)keyPathFromPrimaryObject;
+ (id)propertiesToFetch;
+ (id)propertySetName;
- (NSDate)dateCreated;
- (NSNumber)aperture;
- (NSNumber)bitrate;
- (NSNumber)digitalZoomRatio;
- (NSNumber)duration;
- (NSNumber)exposureBias;
- (NSNumber)flashFired;
- (NSNumber)focalLength;
- (NSNumber)focalLengthIn35mm;
- (NSNumber)fps;
- (NSNumber)generativeAIType;
- (NSNumber)iso;
- (NSNumber)meteringMode;
- (NSNumber)sampleRate;
- (NSNumber)semanticStylePreset;
- (NSNumber)shutterSpeed;
- (NSNumber)timezoneOffset;
- (NSNumber)trackFormat;
- (NSNumber)whiteBalance;
- (NSString)cameraMake;
- (NSString)cameraModel;
- (NSString)codec;
- (NSString)credit;
- (NSString)formattedCameraModel;
- (NSString)lensModel;
- (NSString)timezoneName;
- (PHAssetPhotosInfoPanelExtendedProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5;
@end

@implementation PHAssetPhotosInfoPanelExtendedProperties

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credit, 0);
  objc_storeStrong((id *)&self->_generativeAIType, 0);
  objc_storeStrong((id *)&self->_timezoneName, 0);
  objc_storeStrong((id *)&self->_timezoneOffset, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_digitalZoomRatio, 0);
  objc_storeStrong((id *)&self->_semanticStylePreset, 0);
  objc_storeStrong((id *)&self->_trackFormat, 0);
  objc_storeStrong((id *)&self->_bitrate, 0);
  objc_storeStrong((id *)&self->_sampleRate, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_fps, 0);
  objc_storeStrong((id *)&self->_codec, 0);
  objc_storeStrong((id *)&self->_shutterSpeed, 0);
  objc_storeStrong((id *)&self->_aperture, 0);
  objc_storeStrong((id *)&self->_exposureBias, 0);
  objc_storeStrong((id *)&self->_focalLengthIn35mm, 0);
  objc_storeStrong((id *)&self->_focalLength, 0);
  objc_storeStrong((id *)&self->_iso, 0);
  objc_storeStrong((id *)&self->_meteringMode, 0);
  objc_storeStrong((id *)&self->_whiteBalance, 0);
  objc_storeStrong((id *)&self->_flashFired, 0);
  objc_storeStrong((id *)&self->_lensModel, 0);
  objc_storeStrong((id *)&self->_formattedCameraModel, 0);
  objc_storeStrong((id *)&self->_cameraModel, 0);

  objc_storeStrong((id *)&self->_cameraMake, 0);
}

- (NSString)credit
{
  return self->_credit;
}

- (NSNumber)generativeAIType
{
  return self->_generativeAIType;
}

- (NSString)timezoneName
{
  return self->_timezoneName;
}

- (NSNumber)timezoneOffset
{
  return self->_timezoneOffset;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (NSNumber)digitalZoomRatio
{
  return self->_digitalZoomRatio;
}

- (NSNumber)semanticStylePreset
{
  return self->_semanticStylePreset;
}

- (NSNumber)trackFormat
{
  return self->_trackFormat;
}

- (NSNumber)bitrate
{
  return self->_bitrate;
}

- (NSNumber)sampleRate
{
  return self->_sampleRate;
}

- (NSNumber)duration
{
  return self->_duration;
}

- (NSNumber)fps
{
  return self->_fps;
}

- (NSString)codec
{
  return self->_codec;
}

- (NSNumber)shutterSpeed
{
  return self->_shutterSpeed;
}

- (NSNumber)aperture
{
  return self->_aperture;
}

- (NSNumber)exposureBias
{
  return self->_exposureBias;
}

- (NSNumber)focalLengthIn35mm
{
  return self->_focalLengthIn35mm;
}

- (NSNumber)focalLength
{
  return self->_focalLength;
}

- (NSNumber)iso
{
  return self->_iso;
}

- (NSNumber)meteringMode
{
  return self->_meteringMode;
}

- (NSNumber)whiteBalance
{
  return self->_whiteBalance;
}

- (NSNumber)flashFired
{
  return self->_flashFired;
}

- (NSString)lensModel
{
  return self->_lensModel;
}

- (NSString)formattedCameraModel
{
  return self->_formattedCameraModel;
}

- (NSString)cameraModel
{
  return self->_cameraModel;
}

- (NSString)cameraMake
{
  return self->_cameraMake;
}

- (PHAssetPhotosInfoPanelExtendedProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (v8
    && (v134.receiver = self,
        v134.super_class = (Class)PHAssetPhotosInfoPanelExtendedProperties,
        v10 = [(PHAssetPhotosInfoPanelExtendedProperties *)&v134 init],
        (self = v10) != 0))
  {
    id v133 = v9;
    objc_storeWeak((id *)&v10->super._asset, v9);
    BOOL v11 = !v5;
    if (v5) {
      v12 = @"extendedAttributes.cameraMake";
    }
    else {
      v12 = @"cameraMake";
    }
    if (v5) {
      v13 = @"extendedAttributes.cameraModel";
    }
    else {
      v13 = @"cameraModel";
    }
    if (v5) {
      v14 = @"extendedAttributes.lensModel";
    }
    else {
      v14 = @"lensModel";
    }
    if (v11) {
      v15 = @"flashFired";
    }
    else {
      v15 = @"extendedAttributes.flashFired";
    }
    if (v11) {
      v16 = @"whiteBalance";
    }
    else {
      v16 = @"extendedAttributes.whiteBalance";
    }
    if (v11) {
      v17 = @"meteringMode";
    }
    else {
      v17 = @"extendedAttributes.meteringMode";
    }
    if (v11) {
      v18 = @"iso";
    }
    else {
      v18 = @"extendedAttributes.iso";
    }
    if (v11) {
      v19 = @"focalLength";
    }
    else {
      v19 = @"extendedAttributes.focalLength";
    }
    if (v11) {
      v20 = @"focalLengthIn35mm";
    }
    else {
      v20 = @"extendedAttributes.focalLengthIn35mm";
    }
    v105 = v20;
    if (v11) {
      v21 = @"exposureBias";
    }
    else {
      v21 = @"extendedAttributes.exposureBias";
    }
    v22 = @"aperture";
    if (!v11) {
      v22 = @"extendedAttributes.aperture";
    }
    v107 = v21;
    v109 = v22;
    if (v11) {
      v23 = @"shutterSpeed";
    }
    else {
      v23 = @"extendedAttributes.shutterSpeed";
    }
    v24 = @"extendedAttributes.codec";
    if (v11) {
      v24 = @"codec";
    }
    v111 = v23;
    v113 = v24;
    v25 = @"fps";
    if (!v11) {
      v25 = @"extendedAttributes.fps";
    }
    v115 = v25;
    if (v11) {
      v26 = @"duration";
    }
    else {
      v26 = @"extendedAttributes.duration";
    }
    v117 = v26;
    if (v11) {
      v27 = @"sampleRate";
    }
    else {
      v27 = @"extendedAttributes.sampleRate";
    }
    v28 = @"bitrate";
    if (!v11) {
      v28 = @"extendedAttributes.bitrate";
    }
    v119 = v27;
    v121 = v28;
    if (v11) {
      v29 = @"trackFormat";
    }
    else {
      v29 = @"extendedAttributes.trackFormat";
    }
    v30 = @"extendedAttributes.slushPreset";
    if (v11) {
      v30 = @"slushPreset";
    }
    v123 = v29;
    v125 = v30;
    v31 = @"digitalZoomRatio";
    if (!v11) {
      v31 = @"extendedAttributes.digitalZoomRatio";
    }
    v126 = v31;
    if (v11) {
      v32 = @"dateCreated";
    }
    else {
      v32 = @"extendedAttributes.dateCreated";
    }
    v127 = v32;
    if (v11) {
      v33 = @"timezoneOffset";
    }
    else {
      v33 = @"extendedAttributes.timezoneOffset";
    }
    v34 = @"timezoneName";
    if (!v11) {
      v34 = @"extendedAttributes.timezoneName";
    }
    v128 = v33;
    v129 = v34;
    v35 = @"generativeAIType";
    if (!v11) {
      v35 = @"extendedAttributes.generativeAIType";
    }
    v130 = v35;
    v36 = @"extendedAttributes.credit";
    if (v11) {
      v36 = @"credit";
    }
    v132 = v36;
    v37 = [v8 objectForKeyedSubscript:v12];
    cameraMake = self->_cameraMake;
    self->_cameraMake = v37;

    v131 = self->_cameraMake;
    v39 = [v8 objectForKeyedSubscript:v13];
    cameraModel = self->_cameraModel;
    self->_cameraModel = v39;

    v104 = self->_cameraModel;
    v41 = [v8 objectForKeyedSubscript:v14];
    lensModel = self->_lensModel;
    self->_lensModel = v41;

    v103 = self->_lensModel;
    v43 = [v8 objectForKeyedSubscript:v15];
    flashFired = self->_flashFired;
    self->_flashFired = v43;

    v102 = self->_flashFired;
    v45 = [v8 objectForKeyedSubscript:v16];
    whiteBalance = self->_whiteBalance;
    self->_whiteBalance = v45;

    v101 = self->_whiteBalance;
    v47 = [v8 objectForKeyedSubscript:v17];
    meteringMode = self->_meteringMode;
    self->_meteringMode = v47;

    v100 = self->_meteringMode;
    v49 = [v8 objectForKeyedSubscript:v18];
    iso = self->_iso;
    self->_iso = v49;

    v99 = self->_iso;
    v51 = [v8 objectForKeyedSubscript:v19];
    focalLength = self->_focalLength;
    self->_focalLength = v51;

    v98 = self->_focalLength;
    v53 = [v8 objectForKeyedSubscript:v105];
    focalLengthIn35mm = self->_focalLengthIn35mm;
    self->_focalLengthIn35mm = v53;

    v106 = self->_focalLengthIn35mm;
    v55 = [v8 objectForKeyedSubscript:v107];
    exposureBias = self->_exposureBias;
    self->_exposureBias = v55;

    v108 = self->_exposureBias;
    v57 = [v8 objectForKeyedSubscript:v109];
    aperture = self->_aperture;
    self->_aperture = v57;

    v110 = self->_aperture;
    v59 = [v8 objectForKeyedSubscript:v111];
    shutterSpeed = self->_shutterSpeed;
    self->_shutterSpeed = v59;

    v112 = self->_shutterSpeed;
    v61 = [v8 objectForKeyedSubscript:v113];
    codec = self->_codec;
    self->_codec = v61;

    v114 = self->_codec;
    v63 = [v8 objectForKeyedSubscript:v115];
    fps = self->_fps;
    self->_fps = v63;

    v116 = self->_fps;
    v65 = [v8 objectForKeyedSubscript:v117];
    duration = self->_duration;
    self->_duration = v65;

    v118 = self->_duration;
    v67 = [v8 objectForKeyedSubscript:v119];
    sampleRate = self->_sampleRate;
    self->_sampleRate = v67;

    v120 = self->_sampleRate;
    v69 = [v8 objectForKeyedSubscript:v121];
    bitrate = self->_bitrate;
    self->_bitrate = v69;

    v122 = self->_bitrate;
    v71 = [v8 objectForKeyedSubscript:v123];
    trackFormat = self->_trackFormat;
    self->_trackFormat = v71;

    v124 = self->_trackFormat;
    v73 = [MEMORY[0x1E4F8CC38] formattedCameraModelFromCameraModel:self->_cameraModel cameraMake:self->_cameraMake];
    formattedCameraModel = self->_formattedCameraModel;
    self->_formattedCameraModel = v73;

    v75 = self->_formattedCameraModel;
    v76 = [v8 objectForKeyedSubscript:v125];
    semanticStylePreset = self->_semanticStylePreset;
    self->_semanticStylePreset = v76;

    v78 = self->_semanticStylePreset;
    v79 = [v8 objectForKeyedSubscript:v126];
    digitalZoomRatio = self->_digitalZoomRatio;
    self->_digitalZoomRatio = v79;

    v81 = self->_digitalZoomRatio;
    v82 = [v8 objectForKeyedSubscript:v127];
    dateCreated = self->_dateCreated;
    self->_dateCreated = v82;

    v84 = self->_dateCreated;
    v85 = [v8 objectForKeyedSubscript:v128];
    timezoneOffset = self->_timezoneOffset;
    self->_timezoneOffset = v85;

    v87 = self->_timezoneOffset;
    v88 = [v8 objectForKeyedSubscript:v129];
    timezoneName = self->_timezoneName;
    self->_timezoneName = v88;

    v90 = self->_timezoneName;
    v91 = [v8 objectForKeyedSubscript:v130];
    generativeAIType = self->_generativeAIType;
    self->_generativeAIType = v91;

    v93 = self->_generativeAIType;
    v94 = [v8 objectForKeyedSubscript:v132];
    credit = self->_credit;
    self->_credit = v94;

    if (v131
      || v104
      || v103
      || v102
      || v101
      || v100
      || v99
      || v98
      || v106
      || v108
      || v110
      || v112
      || v114
      || v116
      || v118
      || v120
      || v122
      || v124
      || v75
      || v78
      || v81
      || v84
      || v87
      || v90
      || v93
      || self->_credit)
    {
      self = self;
      v96 = self;
    }
    else
    {
      v96 = 0;
    }
    id v9 = v133;
  }
  else
  {
    v96 = 0;
  }

  return v96;
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  v2 = (void *)propertiesToFetch_pl_once_object_44;

  return v2;
}

void __61__PHAssetPhotosInfoPanelExtendedProperties_propertiesToFetch__block_invoke()
{
  v3[25] = *MEMORY[0x1E4F143B8];
  v3[0] = @"cameraMake";
  v3[1] = @"cameraModel";
  v3[2] = @"lensModel";
  v3[3] = @"flashFired";
  v3[4] = @"whiteBalance";
  v3[5] = @"meteringMode";
  v3[6] = @"iso";
  v3[7] = @"focalLength";
  v3[8] = @"focalLengthIn35mm";
  v3[9] = @"exposureBias";
  v3[10] = @"aperture";
  v3[11] = @"shutterSpeed";
  v3[12] = @"codec";
  v3[13] = @"fps";
  v3[14] = @"duration";
  v3[15] = @"sampleRate";
  v3[16] = @"bitrate";
  v3[17] = @"trackFormat";
  v3[18] = @"slushPreset";
  v3[19] = @"digitalZoomRatio";
  v3[20] = @"dateCreated";
  v3[21] = @"timezoneOffset";
  v3[22] = @"timezoneName";
  v3[23] = @"generativeAIType";
  v3[24] = @"credit";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:25];
  uint64_t v1 = [v0 copy];
  v2 = (void *)propertiesToFetch_pl_once_object_44;
  propertiesToFetch_pl_once_object_44 = v1;
}

+ (id)keyPathFromPrimaryObject
{
  return @"extendedAttributes";
}

+ (id)entityName
{
  return @"ExtendedAttributes";
}

+ (id)propertySetName
{
  return @"PHAssetPropertySetPhotosInfoPanelExtended";
}

@end