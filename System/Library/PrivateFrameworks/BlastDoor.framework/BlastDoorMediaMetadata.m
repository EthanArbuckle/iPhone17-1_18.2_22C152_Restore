@interface BlastDoorMediaMetadata
- (BOOL)captureModeTimelapse;
- (BOOL)exifFlashFired;
- (BOOL)hasHDRGainMap;
- (BOOL)hasISOGainMap;
- (BOOL)hasSmartStyle;
- (BOOL)hasSpatialAudio;
- (BOOL)has_altitude;
- (BOOL)has_apertureValue;
- (BOOL)has_avDuration;
- (BOOL)has_avFPS;
- (BOOL)has_captureModeTimelapse;
- (BOOL)has_ciffWhiteBalanceIndex;
- (BOOL)has_exifAuxFlashCompensation;
- (BOOL)has_exifFlashFired;
- (BOOL)has_exposureBiasValue;
- (BOOL)has_fileSize;
- (BOOL)has_flash;
- (BOOL)has_focalLenIn35mmFilm;
- (BOOL)has_focalLength;
- (BOOL)has_generativeAIImageType;
- (BOOL)has_gifDelayTime;
- (BOOL)has_gpsHPositioningError;
- (BOOL)has_gpsSpeed;
- (BOOL)has_hasHDRGainMap;
- (BOOL)has_hasISOGainMap;
- (BOOL)has_hasSmartStyle;
- (BOOL)has_hasSpatialAudio;
- (BOOL)has_hdrGain;
- (BOOL)has_imageDirection;
- (BOOL)has_isAlchemist;
- (BOOL)has_isAnimatedImage;
- (BOOL)has_isCustomRendered;
- (BOOL)has_isFrontFacingCamera;
- (BOOL)has_isHDR;
- (BOOL)has_isPhotoBooth;
- (BOOL)has_isProRes;
- (BOOL)has_isThreeImageStereoHEIC;
- (BOOL)has_isoRatingValue;
- (BOOL)has_latitude;
- (BOOL)has_lightSource;
- (BOOL)has_longitude;
- (BOOL)has_meteringMode;
- (BOOL)has_processingFlags;
- (BOOL)has_rawOrientation;
- (BOOL)has_rawPixelHeight;
- (BOOL)has_rawPixelWidth;
- (BOOL)has_semanticStylePreset;
- (BOOL)has_semanticStyleRenderingVersion;
- (BOOL)has_semanticStyleSceneBias;
- (BOOL)has_semanticStyleWarmthBias;
- (BOOL)has_shutterSpeed;
- (BOOL)has_smartStyleCast;
- (BOOL)has_smartStyleColorBias;
- (BOOL)has_smartStyleIntensity;
- (BOOL)has_smartStyleIsReversible;
- (BOOL)has_smartStyleRenderingVersion;
- (BOOL)has_smartStyleToneBias;
- (BOOL)has_smartStyleVideoCastValue;
- (BOOL)has_stillImageCaptureFlags;
- (BOOL)has_subsecTimeOriginal;
- (BOOL)has_timezoneOffset;
- (BOOL)has_variationIdentifier;
- (BOOL)has_videoComplementDurationTimescale;
- (BOOL)has_videoComplementDurationValue;
- (BOOL)has_videoComplementImageDisplayTimescale;
- (BOOL)has_videoComplementImageDisplayValue;
- (BOOL)has_videoContainsCinematicData;
- (BOOL)has_videoDurationTimescale;
- (BOOL)has_videoDurationValue;
- (BOOL)has_videoDynamicRange;
- (BOOL)has_whiteBalance;
- (BOOL)isAlchemist;
- (BOOL)isAnimatedImage;
- (BOOL)isCustomRendered;
- (BOOL)isFrontFacingCamera;
- (BOOL)isHDR;
- (BOOL)isPhotoBooth;
- (BOOL)isProRes;
- (BOOL)isThreeImageStereoHEIC;
- (BOOL)smartStyleIsReversible;
- (BOOL)videoContainsCinematicData;
- (BlastDoorMediaMetadata)init;
- (BlastDoorMediaMetadata_LargeImageContextualInfo)largeImageContextualInfo;
- (NSDate)gpsTimestamp;
- (NSDate)imageDate;
- (NSString)IPTCCredit;
- (NSString)captureMode;
- (NSString)codecFourCharCode;
- (NSString)description;
- (NSString)gpsSpeedRef;
- (NSString)imageDirectionRef;
- (NSString)isVideoMontage;
- (NSString)lensMake;
- (NSString)lensModel;
- (NSString)make;
- (NSString)model;
- (NSString)originalFileName;
- (NSString)originatingAssetIdentifier;
- (NSString)profileName;
- (NSString)spatialOverCaptureIdentifier;
- (NSString)uniformTypeIdentifier;
- (NSString)userComment;
- (NSString)videoComplementMediaGroupId;
- (NSUUID)burstUuid;
- (double)altitude;
- (double)apertureValue;
- (double)avDuration;
- (double)avFPS;
- (double)exifAuxFlashCompensation;
- (double)focalLenIn35mmFilm;
- (double)focalLength;
- (double)generativeAIImageType;
- (double)gifDelayTime;
- (double)gpsHPositioningError;
- (double)gpsSpeed;
- (double)hdrGain;
- (double)imageDirection;
- (double)latitude;
- (double)longitude;
- (double)semanticStyleSceneBias;
- (double)semanticStyleWarmthBias;
- (double)shutterSpeed;
- (double)smartStyleCast;
- (double)smartStyleColorBias;
- (double)smartStyleIntensity;
- (double)smartStyleToneBias;
- (double)smartStyleVideoCastValue;
- (double)subsecTimeOriginal;
- (double)videoComplementDurationTimescale;
- (double)videoComplementDurationValue;
- (double)videoComplementImageDisplayTimescale;
- (double)videoComplementImageDisplayValue;
- (double)videoDurationTimescale;
- (double)videoDurationValue;
- (int64_t)cameraUsedForCapture;
- (int64_t)ciffWhiteBalanceIndex;
- (int64_t)exposureBiasValue;
- (int64_t)flash;
- (int64_t)isoRatingValue;
- (int64_t)lightSource;
- (int64_t)meteringMode;
- (int64_t)rawOrientation;
- (int64_t)semanticStylePreset;
- (int64_t)semanticStyleRenderingVersion;
- (int64_t)smartStyleRenderingVersion;
- (int64_t)timezoneOffset;
- (int64_t)videoDynamicRange;
- (int64_t)whiteBalance;
- (unint64_t)fileSize;
- (unint64_t)processingFlags;
- (unint64_t)rawPixelHeight;
- (unint64_t)rawPixelWidth;
- (unint64_t)stillImageCaptureFlags;
- (unint64_t)variationIdentifier;
@end

@implementation BlastDoorMediaMetadata

- (NSString)description
{
  return (NSString *)sub_1B177A380((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for MediaMetadata, &OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata, (uint64_t (*)(void))type metadata accessor for MediaMetadata);
}

- (BlastDoorMediaMetadata_LargeImageContextualInfo)largeImageContextualInfo
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  if (self->mediaMetadata[OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata + 16])
  {
    v3 = 0;
  }
  else
  {
    uint64_t v4 = *((void *)v2 + 2);
    long long v9 = *(_OWORD *)v2;
    v5 = (objc_class *)type metadata accessor for _ObjCMediaMetadata_LargeImageContextualInfoWrapper();
    v6 = (char *)objc_allocWithZone(v5);
    v7 = &v6[OBJC_IVAR___BlastDoorMediaMetadata_LargeImageContextualInfo_mediaMetadata_LargeImageContextualInfo];
    *(_OWORD *)v7 = v9;
    *((void *)v7 + 2) = v4;
    v10.receiver = v6;
    v10.super_class = v5;
    v3 = [(BlastDoorMediaMetadata *)&v10 init];
  }
  return (BlastDoorMediaMetadata_LargeImageContextualInfo *)v3;
}

- (NSDate)imageDate
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(qword_1EB7B00E0);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  uint64_t v7 = type metadata accessor for MediaMetadata();
  sub_1B11D863C((uint64_t)&v6[*(int *)(v7 + 20)], (uint64_t)v5, qword_1EB7B00E0);
  uint64_t v8 = sub_1B1969E80();
  uint64_t v9 = *(void *)(v8 - 8);
  objc_super v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v5, 1, v8) != 1)
  {
    objc_super v10 = (void *)sub_1B1969E50();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v5, v8);
  }
  return (NSDate *)v10;
}

- (BOOL)has_timezoneOffset
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 24) + 8] & 1) == 0;
}

- (int64_t)timezoneOffset
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 24)];
  if (v3[8]) {
    return 0;
  }
  else {
    return *(void *)v3;
  }
}

- (BOOL)has_subsecTimeOriginal
{
  return sub_1B1788420((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata, (uint64_t (*)(void))type metadata accessor for MediaMetadata);
}

- (double)subsecTimeOriginal
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 28)];
  double result = *(double *)v3;
  if (v3[8]) {
    return 0.0;
  }
  return result;
}

- (BOOL)has_rawOrientation
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 32) + 8] & 1) == 0;
}

- (int64_t)rawOrientation
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 32)];
  if (v3[8]) {
    return 0;
  }
  else {
    return *(void *)v3;
  }
}

- (BOOL)has_rawPixelWidth
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 36) + 8] & 1) == 0;
}

- (unint64_t)rawPixelWidth
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 36)];
  if (v3[8]) {
    return 0;
  }
  else {
    return *(void *)v3;
  }
}

- (BOOL)has_rawPixelHeight
{
  return sub_1B17887B0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata, (uint64_t (*)(void))type metadata accessor for MediaMetadata);
}

- (unint64_t)rawPixelHeight
{
  return sub_1B1788878((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata, (uint64_t (*)(void))type metadata accessor for MediaMetadata);
}

- (NSString)lensModel
{
  return (NSString *)sub_1B17A3284((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata, (uint64_t (*)(void))type metadata accessor for MediaMetadata);
}

- (NSString)lensMake
{
  return (NSString *)sub_1B179C448((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata, (uint64_t (*)(void))type metadata accessor for MediaMetadata);
}

- (NSString)profileName
{
  return (NSString *)sub_1B179C554((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata, (uint64_t (*)(void))type metadata accessor for MediaMetadata);
}

- (BOOL)has_processingFlags
{
  return sub_1B17A3640((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata, (uint64_t (*)(void))type metadata accessor for MediaMetadata);
}

- (unint64_t)processingFlags
{
  return sub_1B17A3708((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata, (uint64_t (*)(void))type metadata accessor for MediaMetadata);
}

- (BOOL)has_isCustomRendered
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 60)] != 2;
}

- (BOOL)isCustomRendered
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 60)] & 1;
}

- (BOOL)has_apertureValue
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 64) + 8] & 1) == 0;
}

- (double)apertureValue
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 64)];
  double result = *(double *)v3;
  if (v3[8]) {
    return 0.0;
  }
  return result;
}

- (BOOL)has_exposureBiasValue
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 68) + 8] & 1) == 0;
}

- (int64_t)exposureBiasValue
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 68)];
  if (v3[8]) {
    return 0;
  }
  else {
    return *(void *)v3;
  }
}

- (BOOL)has_flash
{
  return sub_1B179C904((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata, (uint64_t (*)(void))type metadata accessor for MediaMetadata);
}

- (int64_t)flash
{
  return sub_1B179C9CC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata, (uint64_t (*)(void))type metadata accessor for MediaMetadata);
}

- (BOOL)has_focalLength
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 76) + 8] & 1) == 0;
}

- (double)focalLength
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 76)];
  double result = *(double *)v3;
  if (v3[8]) {
    return 0.0;
  }
  return result;
}

- (BOOL)has_focalLenIn35mmFilm
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 80) + 8] & 1) == 0;
}

- (double)focalLenIn35mmFilm
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 80)];
  double result = *(double *)v3;
  if (v3[8]) {
    return 0.0;
  }
  return result;
}

- (BOOL)has_isoRatingValue
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 84) + 8] & 1) == 0;
}

- (int64_t)isoRatingValue
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 84)];
  if (v3[8]) {
    return 0;
  }
  else {
    return *(void *)v3;
  }
}

- (BOOL)has_meteringMode
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 88) + 8] & 1) == 0;
}

- (int64_t)meteringMode
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 88)];
  if (v3[8]) {
    return 0;
  }
  else {
    return *(void *)v3;
  }
}

- (BOOL)has_shutterSpeed
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 92) + 8] & 1) == 0;
}

- (double)shutterSpeed
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 92)];
  double result = *(double *)v3;
  if (v3[8]) {
    return 0.0;
  }
  return result;
}

- (NSString)model
{
  return (NSString *)sub_1B17A4488((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata, (uint64_t (*)(void))type metadata accessor for MediaMetadata);
}

- (NSString)make
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  if (*(void *)&v2[*(int *)(type metadata accessor for MediaMetadata() + 100) + 8])
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  return (NSString *)v3;
}

- (BOOL)has_whiteBalance
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 104) + 8] & 1) == 0;
}

- (int64_t)whiteBalance
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 104)];
  if (v3[8]) {
    return 0;
  }
  else {
    return *(void *)v3;
  }
}

- (BOOL)has_lightSource
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 108) + 8] & 1) == 0;
}

- (int64_t)lightSource
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 108)];
  if (v3[8]) {
    return 0;
  }
  else {
    return *(void *)v3;
  }
}

- (BOOL)has_ciffWhiteBalanceIndex
{
  return sub_1B17A4724((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata, (uint64_t (*)(void))type metadata accessor for MediaMetadata);
}

- (int64_t)ciffWhiteBalanceIndex
{
  return sub_1B17A47EC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata, (uint64_t (*)(void))type metadata accessor for MediaMetadata);
}

- (BOOL)has_videoDynamicRange
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 116) + 8] & 1) == 0;
}

- (int64_t)videoDynamicRange
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 116)];
  if (v3[8]) {
    return 0;
  }
  else {
    return *(void *)v3;
  }
}

- (BOOL)has_hdrGain
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 120) + 8] & 1) == 0;
}

- (double)hdrGain
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 120)];
  double result = *(double *)v3;
  if (v3[8]) {
    return 0.0;
  }
  return result;
}

- (BOOL)has_hasHDRGainMap
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 124)] != 2;
}

- (BOOL)hasHDRGainMap
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 124)] & 1;
}

- (BOOL)has_videoContainsCinematicData
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 128)] != 2;
}

- (BOOL)videoContainsCinematicData
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 128)] & 1;
}

- (NSString)videoComplementMediaGroupId
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  if (*(void *)&v2[*(int *)(type metadata accessor for MediaMetadata() + 132) + 8])
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  return (NSString *)v3;
}

- (BOOL)has_gifDelayTime
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 136) + 8] & 1) == 0;
}

- (double)gifDelayTime
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 136)];
  double result = *(double *)v3;
  if (v3[8]) {
    return 0.0;
  }
  return result;
}

- (BOOL)has_variationIdentifier
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 140) + 8] & 1) == 0;
}

- (unint64_t)variationIdentifier
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 140)];
  if (v3[8]) {
    return 0;
  }
  else {
    return *(void *)v3;
  }
}

- (BOOL)has_videoComplementDurationValue
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 144) + 8] & 1) == 0;
}

- (double)videoComplementDurationValue
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 144)];
  double result = *(double *)v3;
  if (v3[8]) {
    return 0.0;
  }
  return result;
}

- (BOOL)has_videoComplementDurationTimescale
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 148) + 8] & 1) == 0;
}

- (double)videoComplementDurationTimescale
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 148)];
  double result = *(double *)v3;
  if (v3[8]) {
    return 0.0;
  }
  return result;
}

- (BOOL)has_videoComplementImageDisplayValue
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 152) + 8] & 1) == 0;
}

- (double)videoComplementImageDisplayValue
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 152)];
  double result = *(double *)v3;
  if (v3[8]) {
    return 0.0;
  }
  return result;
}

- (BOOL)has_videoComplementImageDisplayTimescale
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 156) + 8] & 1) == 0;
}

- (double)videoComplementImageDisplayTimescale
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 156)];
  double result = *(double *)v3;
  if (v3[8]) {
    return 0.0;
  }
  return result;
}

- (BOOL)has_avDuration
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 160) + 8] & 1) == 0;
}

- (double)avDuration
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 160)];
  double result = *(double *)v3;
  if (v3[8]) {
    return 0.0;
  }
  return result;
}

- (BOOL)has_avFPS
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 164) + 8] & 1) == 0;
}

- (double)avFPS
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 164)];
  double result = *(double *)v3;
  if (v3[8]) {
    return 0.0;
  }
  return result;
}

- (NSString)codecFourCharCode
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  if (*(void *)&v2[*(int *)(type metadata accessor for MediaMetadata() + 168) + 8])
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)captureMode
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  if (*(void *)&v2[*(int *)(type metadata accessor for MediaMetadata() + 172) + 8])
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)isVideoMontage
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  if (*(void *)&v2[*(int *)(type metadata accessor for MediaMetadata() + 176) + 8])
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  return (NSString *)v3;
}

- (BOOL)has_isProRes
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 180)] != 2;
}

- (BOOL)isProRes
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 180)] & 1;
}

- (BOOL)has_videoDurationValue
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 184) + 8] & 1) == 0;
}

- (double)videoDurationValue
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 184)];
  double result = *(double *)v3;
  if (v3[8]) {
    return 0.0;
  }
  return result;
}

- (BOOL)has_videoDurationTimescale
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 188) + 8] & 1) == 0;
}

- (double)videoDurationTimescale
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 188)];
  double result = *(double *)v3;
  if (v3[8]) {
    return 0.0;
  }
  return result;
}

- (NSString)originatingAssetIdentifier
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  if (*(void *)&v2[*(int *)(type metadata accessor for MediaMetadata() + 192) + 8])
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  return (NSString *)v3;
}

- (BOOL)has_longitude
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 196) + 8] & 1) == 0;
}

- (double)longitude
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 196)];
  double result = *(double *)v3;
  if (v3[8]) {
    return 0.0;
  }
  return result;
}

- (BOOL)has_latitude
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 200) + 8] & 1) == 0;
}

- (double)latitude
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 200)];
  double result = *(double *)v3;
  if (v3[8]) {
    return 0.0;
  }
  return result;
}

- (BOOL)has_altitude
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 204) + 8] & 1) == 0;
}

- (double)altitude
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 204)];
  double result = *(double *)v3;
  if (v3[8]) {
    return 0.0;
  }
  return result;
}

- (BOOL)has_gpsSpeed
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 208) + 8] & 1) == 0;
}

- (double)gpsSpeed
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 208)];
  double result = *(double *)v3;
  if (v3[8]) {
    return 0.0;
  }
  return result;
}

- (NSString)gpsSpeedRef
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  if (*(void *)&v2[*(int *)(type metadata accessor for MediaMetadata() + 212) + 8])
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  return (NSString *)v3;
}

- (NSDate)gpsTimestamp
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(qword_1EB7B00E0);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  uint64_t v7 = type metadata accessor for MediaMetadata();
  sub_1B11D863C((uint64_t)&v6[*(int *)(v7 + 216)], (uint64_t)v5, qword_1EB7B00E0);
  uint64_t v8 = sub_1B1969E80();
  uint64_t v9 = *(void *)(v8 - 8);
  objc_super v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v5, 1, v8) != 1)
  {
    objc_super v10 = (void *)sub_1B1969E50();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v5, v8);
  }
  return (NSDate *)v10;
}

- (BOOL)has_gpsHPositioningError
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 220) + 8] & 1) == 0;
}

- (double)gpsHPositioningError
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 220)];
  double result = *(double *)v3;
  if (v3[8]) {
    return 0.0;
  }
  return result;
}

- (BOOL)has_imageDirection
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 224) + 8] & 1) == 0;
}

- (double)imageDirection
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 224)];
  double result = *(double *)v3;
  if (v3[8]) {
    return 0.0;
  }
  return result;
}

- (NSString)imageDirectionRef
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  if (*(void *)&v2[*(int *)(type metadata accessor for MediaMetadata() + 228) + 8])
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)uniformTypeIdentifier
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  if (*(void *)&v2[*(int *)(type metadata accessor for MediaMetadata() + 232) + 8])
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  return (NSString *)v3;
}

- (BOOL)has_fileSize
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 236) + 8] & 1) == 0;
}

- (unint64_t)fileSize
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 236)];
  if (v3[8]) {
    return 0;
  }
  else {
    return *(void *)v3;
  }
}

- (NSString)originalFileName
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  if (*(void *)&v2[*(int *)(type metadata accessor for MediaMetadata() + 240) + 8])
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  return (NSString *)v3;
}

- (BOOL)has_isPhotoBooth
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 244)] != 2;
}

- (BOOL)isPhotoBooth
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 244)] & 1;
}

- (NSUUID)burstUuid
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7B4140);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  uint64_t v7 = type metadata accessor for MediaMetadata();
  sub_1B11D863C((uint64_t)&v6[*(int *)(v7 + 248)], (uint64_t)v5, &qword_1EB7B4140);
  uint64_t v8 = sub_1B1969EE0();
  uint64_t v9 = *(void *)(v8 - 8);
  objc_super v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v5, 1, v8) != 1)
  {
    objc_super v10 = (void *)sub_1B1969EB0();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v5, v8);
  }
  return (NSUUID *)v10;
}

- (NSString)userComment
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  if (*(void *)&v2[*(int *)(type metadata accessor for MediaMetadata() + 252) + 8])
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  return (NSString *)v3;
}

- (BOOL)has_isFrontFacingCamera
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 256)] != 2;
}

- (BOOL)isFrontFacingCamera
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 256)] & 1;
}

- (NSString)spatialOverCaptureIdentifier
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  if (*(void *)&v2[*(int *)(type metadata accessor for MediaMetadata() + 260) + 8])
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  return (NSString *)v3;
}

- (BOOL)has_semanticStyleSceneBias
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 264) + 8] & 1) == 0;
}

- (double)semanticStyleSceneBias
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 264)];
  double result = *(double *)v3;
  if (v3[8]) {
    return 0.0;
  }
  return result;
}

- (BOOL)has_semanticStyleWarmthBias
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 268) + 8] & 1) == 0;
}

- (double)semanticStyleWarmthBias
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 268)];
  double result = *(double *)v3;
  if (v3[8]) {
    return 0.0;
  }
  return result;
}

- (BOOL)has_semanticStyleRenderingVersion
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 272) + 8] & 1) == 0;
}

- (int64_t)semanticStyleRenderingVersion
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 272)];
  if (v3[8]) {
    return 0;
  }
  else {
    return *(void *)v3;
  }
}

- (BOOL)has_semanticStylePreset
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 276) + 8] & 1) == 0;
}

- (int64_t)semanticStylePreset
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 276)];
  if (v3[8]) {
    return 0;
  }
  else {
    return *(void *)v3;
  }
}

- (BOOL)has_hasSmartStyle
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 280)] != 2;
}

- (BOOL)hasSmartStyle
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 280)] & 1;
}

- (BOOL)has_smartStyleToneBias
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 284) + 8] & 1) == 0;
}

- (double)smartStyleToneBias
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 284)];
  double result = *(double *)v3;
  if (v3[8]) {
    return 0.0;
  }
  return result;
}

- (BOOL)has_smartStyleColorBias
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 288) + 8] & 1) == 0;
}

- (double)smartStyleColorBias
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 288)];
  double result = *(double *)v3;
  if (v3[8]) {
    return 0.0;
  }
  return result;
}

- (BOOL)has_smartStyleIntensity
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 292) + 8] & 1) == 0;
}

- (double)smartStyleIntensity
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 292)];
  double result = *(double *)v3;
  if (v3[8]) {
    return 0.0;
  }
  return result;
}

- (BOOL)has_smartStyleCast
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 296) + 8] & 1) == 0;
}

- (double)smartStyleCast
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 296)];
  double result = *(double *)v3;
  if (v3[8]) {
    return 0.0;
  }
  return result;
}

- (BOOL)has_smartStyleRenderingVersion
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 300) + 8] & 1) == 0;
}

- (int64_t)smartStyleRenderingVersion
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 300)];
  if (v3[8]) {
    return 0;
  }
  else {
    return *(void *)v3;
  }
}

- (BOOL)has_smartStyleIsReversible
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 304)] != 2;
}

- (BOOL)smartStyleIsReversible
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 304)] & 1;
}

- (BOOL)has_smartStyleVideoCastValue
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 308) + 8] & 1) == 0;
}

- (double)smartStyleVideoCastValue
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 308)];
  double result = *(double *)v3;
  if (v3[8]) {
    return 0.0;
  }
  return result;
}

- (BOOL)has_isHDR
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 312)] != 2;
}

- (BOOL)isHDR
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 312)] & 1;
}

- (BOOL)has_hasISOGainMap
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 316)] != 2;
}

- (BOOL)hasISOGainMap
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 316)] & 1;
}

- (BOOL)has_isAnimatedImage
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 320)] != 2;
}

- (BOOL)isAnimatedImage
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 320)] & 1;
}

- (BOOL)has_stillImageCaptureFlags
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 324) + 8] & 1) == 0;
}

- (unint64_t)stillImageCaptureFlags
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 324)];
  if (v3[8]) {
    return 0;
  }
  else {
    return *(void *)v3;
  }
}

- (int64_t)cameraUsedForCapture
{
  return sub_1B178CE8C();
}

- (BOOL)has_exifFlashFired
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 332)] != 2;
}

- (BOOL)exifFlashFired
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 332)] & 1;
}

- (BOOL)has_exifAuxFlashCompensation
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 336) + 8] & 1) == 0;
}

- (double)exifAuxFlashCompensation
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 336)];
  double result = *(double *)v3;
  if (v3[8]) {
    return 0.0;
  }
  return result;
}

- (BOOL)has_captureModeTimelapse
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 340)] != 2;
}

- (BOOL)captureModeTimelapse
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 340)] & 1;
}

- (BOOL)has_hasSpatialAudio
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 344)] != 2;
}

- (BOOL)hasSpatialAudio
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 344)] & 1;
}

- (BOOL)has_isAlchemist
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 348)] != 2;
}

- (BOOL)isAlchemist
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 348)] & 1;
}

- (BOOL)has_isThreeImageStereoHEIC
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 352)] != 2;
}

- (BOOL)isThreeImageStereoHEIC
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return v2[*(int *)(type metadata accessor for MediaMetadata() + 352)] & 1;
}

- (BOOL)has_generativeAIImageType
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  return (v2[*(int *)(type metadata accessor for MediaMetadata() + 356) + 8] & 1) == 0;
}

- (double)generativeAIImageType
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for MediaMetadata() + 356)];
  double result = *(double *)v3;
  if (v3[8]) {
    return 0.0;
  }
  return result;
}

- (NSString)IPTCCredit
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorMediaMetadata_mediaMetadata;
  if (*(void *)&v2[*(int *)(type metadata accessor for MediaMetadata() + 360) + 8])
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  return (NSString *)v3;
}

- (BlastDoorMediaMetadata)init
{
  double result = (BlastDoorMediaMetadata *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end