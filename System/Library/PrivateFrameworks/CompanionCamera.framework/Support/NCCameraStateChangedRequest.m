@interface NCCameraStateChangedRequest
- (BOOL)burstSupport;
- (BOOL)capturing;
- (BOOL)capturingPaused;
- (BOOL)hasBurstSupport;
- (BOOL)hasCaptureDevice;
- (BOOL)hasCaptureMode;
- (BOOL)hasCapturePauseDate;
- (BOOL)hasCaptureStartDate;
- (BOOL)hasCapturing;
- (BOOL)hasCapturingPaused;
- (BOOL)hasCurrentZoomMagnification;
- (BOOL)hasFlashMode;
- (BOOL)hasFlashSupport;
- (BOOL)hasHdrMode;
- (BOOL)hasHdrSupport;
- (BOOL)hasIrisMode;
- (BOOL)hasIrisSupport;
- (BOOL)hasIsSpatialCapture;
- (BOOL)hasMaximumZoomMagnification;
- (BOOL)hasMinimumZoomMagnification;
- (BOOL)hasOrientation;
- (BOOL)hasShallowDepthOfFieldStatus;
- (BOOL)hasSharedLibraryMode;
- (BOOL)hasSharedLibrarySupport;
- (BOOL)hasShowingLivePreview;
- (BOOL)hasSupportsMomentCapture;
- (BOOL)hasToggleCameraDeviceSupport;
- (BOOL)hasZoomAmount;
- (BOOL)hasZoomMagnificationSupport;
- (BOOL)hasZoomSupport;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSpatialCapture;
- (BOOL)readFrom:(id)a3;
- (BOOL)showingLivePreview;
- (BOOL)supportsMomentCapture;
- (BOOL)toggleCameraDeviceSupport;
- (BOOL)zoomMagnificationSupport;
- (BOOL)zoomSupport;
- (double)capturePauseDate;
- (double)captureStartDate;
- (float)currentZoomMagnification;
- (float)maximumZoomMagnification;
- (float)minimumZoomMagnification;
- (float)significantZoomMagnifications;
- (float)significantZoomMagnificationsAtIndex:(unint64_t)a3;
- (float)zoomAmount;
- (id)captureDeviceAsString:(int)a3;
- (id)captureModeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)flashModeAsString:(int)a3;
- (id)flashSupportAsString:(int)a3;
- (id)hdrModeAsString:(int)a3;
- (id)hdrSupportAsString:(int)a3;
- (id)irisModeAsString:(int)a3;
- (id)irisSupportAsString:(int)a3;
- (id)orientationAsString:(int)a3;
- (id)shallowDepthOfFieldStatusAsString:(int)a3;
- (id)sharedLibraryModeAsString:(int)a3;
- (id)sharedLibrarySupportAsString:(int)a3;
- (id)supportedCaptureDevicesAsString:(int)a3;
- (id)supportedCaptureModesAsString:(int)a3;
- (int)StringAsCaptureDevice:(id)a3;
- (int)StringAsCaptureMode:(id)a3;
- (int)StringAsFlashMode:(id)a3;
- (int)StringAsFlashSupport:(id)a3;
- (int)StringAsHdrMode:(id)a3;
- (int)StringAsHdrSupport:(id)a3;
- (int)StringAsIrisMode:(id)a3;
- (int)StringAsIrisSupport:(id)a3;
- (int)StringAsOrientation:(id)a3;
- (int)StringAsShallowDepthOfFieldStatus:(id)a3;
- (int)StringAsSharedLibraryMode:(id)a3;
- (int)StringAsSharedLibrarySupport:(id)a3;
- (int)StringAsSupportedCaptureDevices:(id)a3;
- (int)StringAsSupportedCaptureModes:(id)a3;
- (int)captureDevice;
- (int)captureMode;
- (int)flashMode;
- (int)flashSupport;
- (int)hdrMode;
- (int)hdrSupport;
- (int)irisMode;
- (int)irisSupport;
- (int)orientation;
- (int)shallowDepthOfFieldStatus;
- (int)sharedLibraryMode;
- (int)sharedLibrarySupport;
- (int)supportedCaptureDeviceAtIndex:(unint64_t)a3;
- (int)supportedCaptureDevices;
- (int)supportedCaptureModeAtIndex:(unint64_t)a3;
- (int)supportedCaptureModes;
- (unint64_t)hash;
- (unint64_t)significantZoomMagnificationsCount;
- (unint64_t)supportedCaptureDevicesCount;
- (unint64_t)supportedCaptureModesCount;
- (void)addSignificantZoomMagnifications:(float)a3;
- (void)addSupportedCaptureDevice:(int)a3;
- (void)addSupportedCaptureMode:(int)a3;
- (void)clearSignificantZoomMagnifications;
- (void)clearSupportedCaptureDevices;
- (void)clearSupportedCaptureModes;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBurstSupport:(BOOL)a3;
- (void)setCaptureDevice:(int)a3;
- (void)setCaptureMode:(int)a3;
- (void)setCapturePauseDate:(double)a3;
- (void)setCaptureStartDate:(double)a3;
- (void)setCapturing:(BOOL)a3;
- (void)setCapturingPaused:(BOOL)a3;
- (void)setCurrentZoomMagnification:(float)a3;
- (void)setFlashMode:(int)a3;
- (void)setFlashSupport:(int)a3;
- (void)setHasBurstSupport:(BOOL)a3;
- (void)setHasCaptureDevice:(BOOL)a3;
- (void)setHasCaptureMode:(BOOL)a3;
- (void)setHasCapturePauseDate:(BOOL)a3;
- (void)setHasCaptureStartDate:(BOOL)a3;
- (void)setHasCapturing:(BOOL)a3;
- (void)setHasCapturingPaused:(BOOL)a3;
- (void)setHasCurrentZoomMagnification:(BOOL)a3;
- (void)setHasFlashMode:(BOOL)a3;
- (void)setHasFlashSupport:(BOOL)a3;
- (void)setHasHdrMode:(BOOL)a3;
- (void)setHasHdrSupport:(BOOL)a3;
- (void)setHasIrisMode:(BOOL)a3;
- (void)setHasIrisSupport:(BOOL)a3;
- (void)setHasIsSpatialCapture:(BOOL)a3;
- (void)setHasMaximumZoomMagnification:(BOOL)a3;
- (void)setHasMinimumZoomMagnification:(BOOL)a3;
- (void)setHasOrientation:(BOOL)a3;
- (void)setHasShallowDepthOfFieldStatus:(BOOL)a3;
- (void)setHasSharedLibraryMode:(BOOL)a3;
- (void)setHasSharedLibrarySupport:(BOOL)a3;
- (void)setHasShowingLivePreview:(BOOL)a3;
- (void)setHasSupportsMomentCapture:(BOOL)a3;
- (void)setHasToggleCameraDeviceSupport:(BOOL)a3;
- (void)setHasZoomAmount:(BOOL)a3;
- (void)setHasZoomMagnificationSupport:(BOOL)a3;
- (void)setHasZoomSupport:(BOOL)a3;
- (void)setHdrMode:(int)a3;
- (void)setHdrSupport:(int)a3;
- (void)setIrisMode:(int)a3;
- (void)setIrisSupport:(int)a3;
- (void)setIsSpatialCapture:(BOOL)a3;
- (void)setMaximumZoomMagnification:(float)a3;
- (void)setMinimumZoomMagnification:(float)a3;
- (void)setOrientation:(int)a3;
- (void)setShallowDepthOfFieldStatus:(int)a3;
- (void)setSharedLibraryMode:(int)a3;
- (void)setSharedLibrarySupport:(int)a3;
- (void)setShowingLivePreview:(BOOL)a3;
- (void)setSignificantZoomMagnifications:(float *)a3 count:(unint64_t)a4;
- (void)setSupportedCaptureDevices:(int *)a3 count:(unint64_t)a4;
- (void)setSupportedCaptureModes:(int *)a3 count:(unint64_t)a4;
- (void)setSupportsMomentCapture:(BOOL)a3;
- (void)setToggleCameraDeviceSupport:(BOOL)a3;
- (void)setZoomAmount:(float)a3;
- (void)setZoomMagnificationSupport:(BOOL)a3;
- (void)setZoomSupport:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NCCameraStateChangedRequest

- (void)dealloc
{
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedFloatClear();
  v3.receiver = self;
  v3.super_class = (Class)NCCameraStateChangedRequest;
  [(NCCameraStateChangedRequest *)&v3 dealloc];
}

- (int)orientation
{
  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0) {
    return self->_orientation;
  }
  else {
    return 0;
  }
}

- (void)setOrientation:(int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_orientation = a3;
}

- (void)setHasOrientation:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3968B84FE20F39BD8F64B4450FE8BD1)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasOrientation
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (id)orientationAsString:(int)a3
{
  if (a3 >= 5)
  {
    int v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    int v3 = *(&off_100030B88 + a3);
  }
  return v3;
}

- (int)StringAsOrientation:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Portrait"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PortraitUpsideDown"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LandscapeLeft"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"LandscapeRight"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setZoomAmount:(float)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_zoomAmount = a3;
}

- (void)setHasZoomAmount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3968B84FE20F39BD8F64B4450FE8BD1)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasZoomAmount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (int)flashSupport
{
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    return self->_flashSupport;
  }
  else {
    return 0;
  }
}

- (void)setFlashSupport:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_flashSupport = a3;
}

- (void)setHasFlashSupport:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3968B84FE20F39BD8F64B4450FE8BD1)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasFlashSupport
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (id)flashSupportAsString:(int)a3
{
  if (a3 >= 3)
  {
    int v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    int v3 = *(&off_100030BD0 + a3);
  }
  return v3;
}

- (int)StringAsFlashSupport:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"OnOff"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AutoOnOff"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)flashMode
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    return self->_flashMode;
  }
  else {
    return 0;
  }
}

- (void)setFlashMode:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_flashMode = a3;
}

- (void)setHasFlashMode:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3968B84FE20F39BD8F64B4450FE8BD1)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasFlashMode
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)flashModeAsString:(int)a3
{
  if (a3 >= 3)
  {
    int v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    int v3 = *(&off_100030BE8 + a3);
  }
  return v3;
}

- (int)StringAsFlashMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Off"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"On"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Auto"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)hdrSupport
{
  if (*((unsigned char *)&self->_has + 1)) {
    return self->_hdrSupport;
  }
  else {
    return 0;
  }
}

- (void)setHdrSupport:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_hdrSupport = a3;
}

- (void)setHasHdrSupport:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3968B84FE20F39BD8F64B4450FE8BD1)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasHdrSupport
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (id)hdrSupportAsString:(int)a3
{
  if (a3 >= 4)
  {
    int v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    int v3 = *(&off_100030BB0 + a3);
  }
  return v3;
}

- (int)StringAsHdrSupport:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"OnOff"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AutoOff"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"AutoOnOff"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)hdrMode
{
  if ((*(unsigned char *)&self->_has & 0x80) != 0) {
    return self->_hdrMode;
  }
  else {
    return 0;
  }
}

- (void)setHdrMode:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_hdrMode = a3;
}

- (void)setHasHdrMode:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3968B84FE20F39BD8F64B4450FE8BD1)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasHdrMode
{
  return *(unsigned char *)&self->_has >> 7;
}

- (id)hdrModeAsString:(int)a3
{
  if (a3 >= 3)
  {
    int v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    int v3 = *(&off_100030BE8 + a3);
  }
  return v3;
}

- (int)StringAsHdrMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Off"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"On"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Auto"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)irisSupport
{
  if ((*((unsigned char *)&self->_has + 1) & 4) != 0) {
    return self->_irisSupport;
  }
  else {
    return 0;
  }
}

- (void)setIrisSupport:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_irisSupport = a3;
}

- (void)setHasIrisSupport:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3968B84FE20F39BD8F64B4450FE8BD1)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasIrisSupport
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (id)irisSupportAsString:(int)a3
{
  if (a3 >= 3)
  {
    int v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    int v3 = *(&off_100030BD0 + a3);
  }
  return v3;
}

- (int)StringAsIrisSupport:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"OnOff"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AutoOnOff"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)irisMode
{
  if ((*((unsigned char *)&self->_has + 1) & 2) != 0) {
    return self->_irisMode;
  }
  else {
    return 0;
  }
}

- (void)setIrisMode:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_irisMode = a3;
}

- (void)setHasIrisMode:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3968B84FE20F39BD8F64B4450FE8BD1)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasIrisMode
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (id)irisModeAsString:(int)a3
{
  if (a3 >= 3)
  {
    int v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    int v3 = *(&off_100030BE8 + a3);
  }
  return v3;
}

- (int)StringAsIrisMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Off"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"On"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Auto"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setBurstSupport:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_burstSupport = a3;
}

- (void)setHasBurstSupport:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3968B84FE20F39BD8F64B4450FE8BD1)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasBurstSupport
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (int)captureMode
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_captureMode;
  }
  else {
    return 0;
  }
}

- (void)setCaptureMode:(int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_captureMode = a3;
}

- (void)setHasCaptureMode:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3968B84FE20F39BD8F64B4450FE8BD1)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasCaptureMode
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)captureModeAsString:(int)a3
{
  if a3 < 0xB && ((0x7ABu >> a3))
  {
    int v3 = *(&off_100030C00 + a3);
  }
  else
  {
    int v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  return v3;
}

- (int)StringAsCaptureMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Photo"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Video"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Square"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Timelapse"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"Portrait"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"Slomo"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"Panorama"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"Cinematic"])
  {
    int v4 = 10;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setToggleCameraDeviceSupport:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_toggleCameraDeviceSupport = a3;
}

- (void)setHasToggleCameraDeviceSupport:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3968B84FE20F39BD8F64B4450FE8BD1)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasToggleCameraDeviceSupport
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setZoomSupport:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_zoomSupport = a3;
}

- (void)setHasZoomSupport:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3968B84FE20F39BD8F64B4450FE8BD1)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasZoomSupport
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (unint64_t)supportedCaptureModesCount
{
  return self->_supportedCaptureModes.count;
}

- (int)supportedCaptureModes
{
  return self->_supportedCaptureModes.list;
}

- (void)clearSupportedCaptureModes
{
}

- (void)addSupportedCaptureMode:(int)a3
{
}

- (int)supportedCaptureModeAtIndex:(unint64_t)a3
{
  p_supportedCaptureModes = &self->_supportedCaptureModes;
  unint64_t count = self->_supportedCaptureModes.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_supportedCaptureModes->list[a3];
}

- (void)setSupportedCaptureModes:(int *)a3 count:(unint64_t)a4
{
}

- (id)supportedCaptureModesAsString:(int)a3
{
  if a3 < 0xB && ((0x7ABu >> a3))
  {
    int v3 = *(&off_100030C00 + a3);
  }
  else
  {
    int v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  return v3;
}

- (int)StringAsSupportedCaptureModes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Photo"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Video"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Square"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Timelapse"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"Portrait"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"Slomo"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"Panorama"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"Cinematic"])
  {
    int v4 = 10;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setCapturing:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_capturing = a3;
}

- (void)setHasCapturing:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3968B84FE20F39BD8F64B4450FE8BD1)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasCapturing
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setCaptureStartDate:(double)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_captureStartDate = a3;
}

- (void)setHasCaptureStartDate:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3968B84FE20F39BD8F64B4450FE8BD1)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasCaptureStartDate
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setShowingLivePreview:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_showingLivePreview = a3;
}

- (void)setHasShowingLivePreview:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3968B84FE20F39BD8F64B4450FE8BD1)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasShowingLivePreview
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (int)shallowDepthOfFieldStatus
{
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0) {
    return self->_shallowDepthOfFieldStatus;
  }
  else {
    return 0;
  }
}

- (void)setShallowDepthOfFieldStatus:(int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_shallowDepthOfFieldStatus = a3;
}

- (void)setHasShallowDepthOfFieldStatus:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3968B84FE20F39BD8F64B4450FE8BD1)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasShallowDepthOfFieldStatus
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (id)shallowDepthOfFieldStatusAsString:(int)a3
{
  if (a3 >= 9)
  {
    int v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    int v3 = *(&off_100030C58 + a3);
  }
  return v3;
}

- (int)StringAsShallowDepthOfFieldStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unsupported"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Enabled"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LensOccluded"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SubjectTooFar"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SubjectTooClose"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"NotEnoughLight"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"DeviceTooHot"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"TooMuchLight"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"BackgroundTooFar"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setSupportsMomentCapture:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_supportsMomentCapture = a3;
}

- (void)setHasSupportsMomentCapture:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3968B84FE20F39BD8F64B4450FE8BD1)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasSupportsMomentCapture
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (unint64_t)supportedCaptureDevicesCount
{
  return self->_supportedCaptureDevices.count;
}

- (int)supportedCaptureDevices
{
  return self->_supportedCaptureDevices.list;
}

- (void)clearSupportedCaptureDevices
{
}

- (void)addSupportedCaptureDevice:(int)a3
{
}

- (int)supportedCaptureDeviceAtIndex:(unint64_t)a3
{
  p_supportedCaptureDevices = &self->_supportedCaptureDevices;
  unint64_t count = self->_supportedCaptureDevices.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_supportedCaptureDevices->list[a3];
}

- (void)setSupportedCaptureDevices:(int *)a3 count:(unint64_t)a4
{
}

- (id)supportedCaptureDevicesAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"Front";
    }
    else
    {
      int v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
    }
  }
  else
  {
    int v4 = @"Back";
  }
  return v4;
}

- (int)StringAsSupportedCaptureDevices:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Back"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"Front"];
  }

  return v4;
}

- (int)captureDevice
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_captureDevice;
  }
  else {
    return 0;
  }
}

- (void)setCaptureDevice:(int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_captureDevice = a3;
}

- (void)setHasCaptureDevice:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3968B84FE20F39BD8F64B4450FE8BD1)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasCaptureDevice
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)captureDeviceAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"Front";
    }
    else
    {
      int v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
    }
  }
  else
  {
    int v4 = @"Back";
  }
  return v4;
}

- (int)StringAsCaptureDevice:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Back"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"Front"];
  }

  return v4;
}

- (int)sharedLibrarySupport
{
  if (*((unsigned char *)&self->_has + 2)) {
    return self->_sharedLibrarySupport;
  }
  else {
    return 0;
  }
}

- (void)setSharedLibrarySupport:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_sharedLibrarySupport = a3;
}

- (void)setHasSharedLibrarySupport:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3968B84FE20F39BD8F64B4450FE8BD1)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasSharedLibrarySupport
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (id)sharedLibrarySupportAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"OnOff";
    }
    else
    {
      int v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
    }
  }
  else
  {
    int v4 = @"None";
  }
  return v4;
}

- (int)StringAsSharedLibrarySupport:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"OnOff"];
  }

  return v4;
}

- (int)sharedLibraryMode
{
  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0) {
    return self->_sharedLibraryMode;
  }
  else {
    return 0;
  }
}

- (void)setSharedLibraryMode:(int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_sharedLibraryMode = a3;
}

- (void)setHasSharedLibraryMode:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3968B84FE20F39BD8F64B4450FE8BD1)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasSharedLibraryMode
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (id)sharedLibraryModeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"On";
    }
    else
    {
      int v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
    }
  }
  else
  {
    int v4 = @"Off";
  }
  return v4;
}

- (int)StringAsSharedLibraryMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Off"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"On"];
  }

  return v4;
}

- (void)setZoomMagnificationSupport:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_zoomMagnificationSupport = a3;
}

- (void)setHasZoomMagnificationSupport:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3968B84FE20F39BD8F64B4450FE8BD1)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasZoomMagnificationSupport
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setMinimumZoomMagnification:(float)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_minimumZoomMagnification = a3;
}

- (void)setHasMinimumZoomMagnification:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3968B84FE20F39BD8F64B4450FE8BD1)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasMinimumZoomMagnification
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setMaximumZoomMagnification:(float)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_maximumZoomMagnification = a3;
}

- (void)setHasMaximumZoomMagnification:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3968B84FE20F39BD8F64B4450FE8BD1)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasMaximumZoomMagnification
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (unint64_t)significantZoomMagnificationsCount
{
  return self->_significantZoomMagnifications.count;
}

- (float)significantZoomMagnifications
{
  return self->_significantZoomMagnifications.list;
}

- (void)clearSignificantZoomMagnifications
{
}

- (void)addSignificantZoomMagnifications:(float)a3
{
}

- (float)significantZoomMagnificationsAtIndex:(unint64_t)a3
{
  p_significantZoomMagnifications = &self->_significantZoomMagnifications;
  unint64_t count = self->_significantZoomMagnifications.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_significantZoomMagnifications->list[a3];
}

- (void)setSignificantZoomMagnifications:(float *)a3 count:(unint64_t)a4
{
}

- (void)setCurrentZoomMagnification:(float)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_currentZoomMagnification = a3;
}

- (void)setHasCurrentZoomMagnification:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3968B84FE20F39BD8F64B4450FE8BD1)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasCurrentZoomMagnification
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setIsSpatialCapture:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_isSpatialCapture = a3;
}

- (void)setHasIsSpatialCapture:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3968B84FE20F39BD8F64B4450FE8BD1)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasIsSpatialCapture
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setCapturePauseDate:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_capturePauseDate = a3;
}

- (void)setHasCapturePauseDate:(BOOL)a3
{
  self->_has = ($F3968B84FE20F39BD8F64B4450FE8BD1)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasCapturePauseDate
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setCapturingPaused:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_capturingPaused = a3;
}

- (void)setHasCapturingPaused:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F3968B84FE20F39BD8F64B4450FE8BD1)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasCapturingPaused
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NCCameraStateChangedRequest;
  int v3 = [(NCCameraStateChangedRequest *)&v7 description];
  int v4 = [(NCCameraStateChangedRequest *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  int v3 = +[NSMutableDictionary dictionary];
  $F3968B84FE20F39BD8F64B4450FE8BD1 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    uint64_t orientation = self->_orientation;
    if (orientation >= 5)
    {
      objc_super v7 = +[NSString stringWithFormat:@"(unknown: %i)", self->_orientation];
    }
    else
    {
      objc_super v7 = *(&off_100030B88 + orientation);
    }
    [v3 setObject:v7 forKey:@"orientation"];

    $F3968B84FE20F39BD8F64B4450FE8BD1 has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    *(float *)&double v4 = self->_zoomAmount;
    v29 = +[NSNumber numberWithFloat:v4];
    [v3 setObject:v29 forKey:@"zoomAmount"];

    $F3968B84FE20F39BD8F64B4450FE8BD1 has = self->_has;
    if ((*(unsigned char *)&has & 0x40) == 0)
    {
LABEL_8:
      if ((*(unsigned char *)&has & 0x20) == 0) {
        goto LABEL_9;
      }
      goto LABEL_73;
    }
  }
  else if ((*(unsigned char *)&has & 0x40) == 0)
  {
    goto LABEL_8;
  }
  uint64_t flashSupport = self->_flashSupport;
  if (flashSupport >= 3)
  {
    v31 = +[NSString stringWithFormat:@"(unknown: %i)", self->_flashSupport];
  }
  else
  {
    v31 = *(&off_100030BD0 + flashSupport);
  }
  [v3 setObject:v31 forKey:@"flashSupport"];

  $F3968B84FE20F39BD8F64B4450FE8BD1 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_80;
  }
LABEL_73:
  uint64_t flashMode = self->_flashMode;
  if (flashMode >= 3)
  {
    v43 = +[NSString stringWithFormat:@"(unknown: %i)", self->_flashMode];
  }
  else
  {
    v43 = *(&off_100030BE8 + flashMode);
  }
  [v3 setObject:v43 forKey:@"flashMode"];

  $F3968B84FE20F39BD8F64B4450FE8BD1 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_84;
  }
LABEL_80:
  uint64_t hdrSupport = self->_hdrSupport;
  if (hdrSupport >= 4)
  {
    v45 = +[NSString stringWithFormat:@"(unknown: %i)", self->_hdrSupport];
  }
  else
  {
    v45 = *(&off_100030BB0 + hdrSupport);
  }
  [v3 setObject:v45 forKey:@"hdrSupport"];

  $F3968B84FE20F39BD8F64B4450FE8BD1 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_88;
  }
LABEL_84:
  uint64_t hdrMode = self->_hdrMode;
  if (hdrMode >= 3)
  {
    v47 = +[NSString stringWithFormat:@"(unknown: %i)", self->_hdrMode];
  }
  else
  {
    v47 = *(&off_100030BE8 + hdrMode);
  }
  [v3 setObject:v47 forKey:@"hdrMode"];

  $F3968B84FE20F39BD8F64B4450FE8BD1 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_92;
  }
LABEL_88:
  uint64_t irisSupport = self->_irisSupport;
  if (irisSupport >= 3)
  {
    v49 = +[NSString stringWithFormat:@"(unknown: %i)", self->_irisSupport];
  }
  else
  {
    v49 = *(&off_100030BD0 + irisSupport);
  }
  [v3 setObject:v49 forKey:@"irisSupport"];

  $F3968B84FE20F39BD8F64B4450FE8BD1 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_96;
  }
LABEL_92:
  uint64_t irisMode = self->_irisMode;
  if (irisMode >= 3)
  {
    v51 = +[NSString stringWithFormat:@"(unknown: %i)", self->_irisMode];
  }
  else
  {
    v51 = *(&off_100030BE8 + irisMode);
  }
  [v3 setObject:v51 forKey:@"irisMode"];

  $F3968B84FE20F39BD8F64B4450FE8BD1 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_15;
    }
    goto LABEL_97;
  }
LABEL_96:
  v52 = +[NSNumber numberWithBool:self->_burstSupport];
  [v3 setObject:v52 forKey:@"burstSupport"];

  $F3968B84FE20F39BD8F64B4450FE8BD1 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_120;
  }
LABEL_97:
  uint64_t captureMode = self->_captureMode;
  if captureMode < 0xB && ((0x7ABu >> captureMode))
  {
    v54 = *(&off_100030C00 + captureMode);
  }
  else
  {
    v54 = +[NSString stringWithFormat:@"(unknown: %i)", self->_captureMode];
  }
  [v3 setObject:v54 forKey:@"captureMode"];

  $F3968B84FE20F39BD8F64B4450FE8BD1 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_120:
  v61 = +[NSNumber numberWithBool:self->_toggleCameraDeviceSupport];
  [v3 setObject:v61 forKey:@"toggleCameraDeviceSupport"];

  if ((*(_DWORD *)&self->_has & 0x4000000) != 0)
  {
LABEL_17:
    v8 = +[NSNumber numberWithBool:self->_zoomSupport];
    [v3 setObject:v8 forKey:@"zoomSupport"];
  }
LABEL_18:
  p_supportedCaptureModes = &self->_supportedCaptureModes;
  if (self->_supportedCaptureModes.count)
  {
    v10 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:");
    if (self->_supportedCaptureModes.count)
    {
      unint64_t v11 = 0;
      do
      {
        uint64_t v12 = p_supportedCaptureModes->list[v11];
        if v12 < 0xB && ((0x7ABu >> v12))
        {
          v13 = *(&off_100030C00 + v12);
        }
        else
        {
          v13 = +[NSString stringWithFormat:@"(unknown: %i)", p_supportedCaptureModes->list[v11]];
        }
        [v10 addObject:v13];

        ++v11;
      }
      while (v11 < self->_supportedCaptureModes.count);
    }
    [v3 setObject:v10 forKey:@"supportedCaptureMode"];
  }
  $F3968B84FE20F39BD8F64B4450FE8BD1 v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x80000) != 0)
  {
    v32 = +[NSNumber numberWithBool:self->_capturing];
    [v3 setObject:v32 forKey:@"capturing"];

    $F3968B84FE20F39BD8F64B4450FE8BD1 v14 = self->_has;
    if ((*(unsigned char *)&v14 & 2) == 0)
    {
LABEL_29:
      if ((*(_DWORD *)&v14 & 0x400000) == 0) {
        goto LABEL_30;
      }
      goto LABEL_61;
    }
  }
  else if ((*(unsigned char *)&v14 & 2) == 0)
  {
    goto LABEL_29;
  }
  v33 = +[NSNumber numberWithDouble:self->_captureStartDate];
  [v3 setObject:v33 forKey:@"captureStartDate"];

  $F3968B84FE20F39BD8F64B4450FE8BD1 v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x400000) == 0)
  {
LABEL_30:
    if ((*(_WORD *)&v14 & 0x4000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_62;
  }
LABEL_61:
  v34 = +[NSNumber numberWithBool:self->_showingLivePreview];
  [v3 setObject:v34 forKey:@"showingLivePreview"];

  $F3968B84FE20F39BD8F64B4450FE8BD1 v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x4000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v14 & 0x800000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
LABEL_62:
  uint64_t shallowDepthOfFieldStatus = self->_shallowDepthOfFieldStatus;
  if (shallowDepthOfFieldStatus >= 9)
  {
    v36 = +[NSString stringWithFormat:@"(unknown: %i)", self->_shallowDepthOfFieldStatus];
  }
  else
  {
    v36 = *(&off_100030C58 + shallowDepthOfFieldStatus);
  }
  [v3 setObject:v36 forKey:@"shallowDepthOfFieldStatus"];

  if ((*(_DWORD *)&self->_has & 0x800000) != 0)
  {
LABEL_32:
    v15 = +[NSNumber numberWithBool:self->_supportsMomentCapture];
    [v3 setObject:v15 forKey:@"supportsMomentCapture"];
  }
LABEL_33:
  p_supportedCaptureDevices = &self->_supportedCaptureDevices;
  if (self->_supportedCaptureDevices.count)
  {
    v17 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:");
    if (self->_supportedCaptureDevices.count)
    {
      unint64_t v18 = 0;
      do
      {
        int v19 = p_supportedCaptureDevices->list[v18];
        if (v19)
        {
          if (v19 == 1)
          {
            v20 = @"Front";
          }
          else
          {
            v20 = +[NSString stringWithFormat:@"(unknown: %i)", p_supportedCaptureDevices->list[v18]];
          }
        }
        else
        {
          v20 = @"Back";
        }
        [v17 addObject:v20];

        ++v18;
      }
      while (v18 < self->_supportedCaptureDevices.count);
    }
    [v3 setObject:v17 forKey:@"supportedCaptureDevice"];
  }
  $F3968B84FE20F39BD8F64B4450FE8BD1 v21 = self->_has;
  if ((*(unsigned char *)&v21 & 4) != 0)
  {
    int captureDevice = self->_captureDevice;
    if (captureDevice)
    {
      if (captureDevice == 1)
      {
        v38 = @"Front";
      }
      else
      {
        v38 = +[NSString stringWithFormat:@"(unknown: %i)", self->_captureDevice];
      }
    }
    else
    {
      v38 = @"Back";
    }
    [v3 setObject:v38 forKey:@"captureDevice"];

    $F3968B84FE20F39BD8F64B4450FE8BD1 v21 = self->_has;
    if ((*(_DWORD *)&v21 & 0x10000) == 0)
    {
LABEL_45:
      if ((*(_WORD *)&v21 & 0x8000) == 0) {
        goto LABEL_46;
      }
      goto LABEL_109;
    }
  }
  else if ((*(_DWORD *)&v21 & 0x10000) == 0)
  {
    goto LABEL_45;
  }
  int sharedLibrarySupport = self->_sharedLibrarySupport;
  if (sharedLibrarySupport)
  {
    if (sharedLibrarySupport == 1)
    {
      v56 = @"OnOff";
    }
    else
    {
      v56 = +[NSString stringWithFormat:@"(unknown: %i)", self->_sharedLibrarySupport];
    }
  }
  else
  {
    v56 = @"None";
  }
  [v3 setObject:v56 forKey:@"sharedLibrarySupport"];

  $F3968B84FE20F39BD8F64B4450FE8BD1 v21 = self->_has;
  if ((*(_WORD *)&v21 & 0x8000) == 0)
  {
LABEL_46:
    if ((*(_DWORD *)&v21 & 0x2000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_115;
  }
LABEL_109:
  int sharedLibraryMode = self->_sharedLibraryMode;
  if (sharedLibraryMode)
  {
    if (sharedLibraryMode == 1)
    {
      v58 = @"On";
    }
    else
    {
      v58 = +[NSString stringWithFormat:@"(unknown: %i)", self->_sharedLibraryMode];
    }
  }
  else
  {
    v58 = @"Off";
  }
  [v3 setObject:v58 forKey:@"sharedLibraryMode"];

  $F3968B84FE20F39BD8F64B4450FE8BD1 v21 = self->_has;
  if ((*(_DWORD *)&v21 & 0x2000000) == 0)
  {
LABEL_47:
    if ((*(_WORD *)&v21 & 0x1000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_116;
  }
LABEL_115:
  v59 = +[NSNumber numberWithBool:self->_zoomMagnificationSupport];
  [v3 setObject:v59 forKey:@"zoomMagnificationSupport"];

  $F3968B84FE20F39BD8F64B4450FE8BD1 v21 = self->_has;
  if ((*(_WORD *)&v21 & 0x1000) == 0)
  {
LABEL_48:
    if ((*(_WORD *)&v21 & 0x800) == 0) {
      goto LABEL_50;
    }
    goto LABEL_49;
  }
LABEL_116:
  *(float *)&double v4 = self->_minimumZoomMagnification;
  v60 = +[NSNumber numberWithFloat:v4];
  [v3 setObject:v60 forKey:@"minimumZoomMagnification"];

  if ((*(_DWORD *)&self->_has & 0x800) != 0)
  {
LABEL_49:
    *(float *)&double v4 = self->_maximumZoomMagnification;
    v22 = +[NSNumber numberWithFloat:v4];
    [v3 setObject:v22 forKey:@"maximumZoomMagnification"];
  }
LABEL_50:
  v23 = PBRepeatedFloatNSArray();
  [v3 setObject:v23 forKey:@"significantZoomMagnifications"];

  $F3968B84FE20F39BD8F64B4450FE8BD1 v25 = self->_has;
  if ((*(unsigned char *)&v25 & 0x10) != 0)
  {
    *(float *)&double v24 = self->_currentZoomMagnification;
    v39 = +[NSNumber numberWithFloat:v24];
    [v3 setObject:v39 forKey:@"currentZoomMagnification"];

    $F3968B84FE20F39BD8F64B4450FE8BD1 v25 = self->_has;
    if ((*(_DWORD *)&v25 & 0x200000) == 0)
    {
LABEL_52:
      if ((*(unsigned char *)&v25 & 1) == 0) {
        goto LABEL_53;
      }
LABEL_69:
      v41 = +[NSNumber numberWithDouble:self->_capturePauseDate];
      [v3 setObject:v41 forKey:@"capturePauseDate"];

      if ((*(_DWORD *)&self->_has & 0x100000) == 0) {
        goto LABEL_55;
      }
      goto LABEL_54;
    }
  }
  else if ((*(_DWORD *)&v25 & 0x200000) == 0)
  {
    goto LABEL_52;
  }
  v40 = +[NSNumber numberWithBool:self->_isSpatialCapture];
  [v3 setObject:v40 forKey:@"isSpatialCapture"];

  $F3968B84FE20F39BD8F64B4450FE8BD1 v25 = self->_has;
  if (*(unsigned char *)&v25) {
    goto LABEL_69;
  }
LABEL_53:
  if ((*(_DWORD *)&v25 & 0x100000) != 0)
  {
LABEL_54:
    v26 = +[NSNumber numberWithBool:self->_capturingPaused];
    [v3 setObject:v26 forKey:@"capturingPaused"];
  }
LABEL_55:
  id v27 = v3;

  return v27;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10001802C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  $F3968B84FE20F39BD8F64B4450FE8BD1 has = self->_has;
  id v12 = v4;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v12;
    $F3968B84FE20F39BD8F64B4450FE8BD1 has = self->_has;
    if ((*(_DWORD *)&has & 0x20000) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_46;
    }
  }
  else if ((*(_DWORD *)&has & 0x20000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  id v4 = v12;
  $F3968B84FE20F39BD8F64B4450FE8BD1 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteInt32Field();
  id v4 = v12;
  $F3968B84FE20F39BD8F64B4450FE8BD1 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteInt32Field();
  id v4 = v12;
  $F3968B84FE20F39BD8F64B4450FE8BD1 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteInt32Field();
  id v4 = v12;
  $F3968B84FE20F39BD8F64B4450FE8BD1 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteInt32Field();
  id v4 = v12;
  $F3968B84FE20F39BD8F64B4450FE8BD1 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteInt32Field();
  id v4 = v12;
  $F3968B84FE20F39BD8F64B4450FE8BD1 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteInt32Field();
  id v4 = v12;
  $F3968B84FE20F39BD8F64B4450FE8BD1 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteBOOLField();
  id v4 = v12;
  $F3968B84FE20F39BD8F64B4450FE8BD1 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteInt32Field();
  id v4 = v12;
  $F3968B84FE20F39BD8F64B4450FE8BD1 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_54:
  PBDataWriterWriteBOOLField();
  id v4 = v12;
  if ((*(_DWORD *)&self->_has & 0x4000000) != 0)
  {
LABEL_13:
    PBDataWriterWriteBOOLField();
    id v4 = v12;
  }
LABEL_14:
  if (self->_supportedCaptureModes.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v4 = v12;
      ++v6;
    }
    while (v6 < self->_supportedCaptureModes.count);
  }
  $F3968B84FE20F39BD8F64B4450FE8BD1 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x80000) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v12;
    $F3968B84FE20F39BD8F64B4450FE8BD1 v7 = self->_has;
    if ((*(unsigned char *)&v7 & 2) == 0)
    {
LABEL_19:
      if ((*(_DWORD *)&v7 & 0x400000) == 0) {
        goto LABEL_20;
      }
      goto LABEL_58;
    }
  }
  else if ((*(unsigned char *)&v7 & 2) == 0)
  {
    goto LABEL_19;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v12;
  $F3968B84FE20F39BD8F64B4450FE8BD1 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x400000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v7 & 0x4000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteBOOLField();
  id v4 = v12;
  $F3968B84FE20F39BD8F64B4450FE8BD1 v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x4000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&v7 & 0x800000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_59:
  PBDataWriterWriteInt32Field();
  id v4 = v12;
  if ((*(_DWORD *)&self->_has & 0x800000) != 0)
  {
LABEL_22:
    PBDataWriterWriteBOOLField();
    id v4 = v12;
  }
LABEL_23:
  if (self->_supportedCaptureDevices.count)
  {
    unint64_t v8 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v4 = v12;
      ++v8;
    }
    while (v8 < self->_supportedCaptureDevices.count);
  }
  $F3968B84FE20F39BD8F64B4450FE8BD1 v9 = self->_has;
  if ((*(unsigned char *)&v9 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v12;
    $F3968B84FE20F39BD8F64B4450FE8BD1 v9 = self->_has;
    if ((*(_DWORD *)&v9 & 0x10000) == 0)
    {
LABEL_28:
      if ((*(_WORD *)&v9 & 0x8000) == 0) {
        goto LABEL_29;
      }
      goto LABEL_63;
    }
  }
  else if ((*(_DWORD *)&v9 & 0x10000) == 0)
  {
    goto LABEL_28;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v12;
  $F3968B84FE20F39BD8F64B4450FE8BD1 v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x8000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v9 & 0x2000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteInt32Field();
  id v4 = v12;
  $F3968B84FE20F39BD8F64B4450FE8BD1 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x2000000) == 0)
  {
LABEL_30:
    if ((*(_WORD *)&v9 & 0x1000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteBOOLField();
  id v4 = v12;
  $F3968B84FE20F39BD8F64B4450FE8BD1 v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x1000) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&v9 & 0x800) == 0) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
LABEL_65:
  PBDataWriterWriteFloatField();
  id v4 = v12;
  if ((*(_DWORD *)&self->_has & 0x800) != 0)
  {
LABEL_32:
    PBDataWriterWriteFloatField();
    id v4 = v12;
  }
LABEL_33:
  if (self->_significantZoomMagnifications.count)
  {
    unint64_t v10 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      id v4 = v12;
      ++v10;
    }
    while (v10 < self->_significantZoomMagnifications.count);
  }
  $F3968B84FE20F39BD8F64B4450FE8BD1 v11 = self->_has;
  if ((*(unsigned char *)&v11 & 0x10) != 0)
  {
    PBDataWriterWriteFloatField();
    id v4 = v12;
    $F3968B84FE20F39BD8F64B4450FE8BD1 v11 = self->_has;
    if ((*(_DWORD *)&v11 & 0x200000) == 0)
    {
LABEL_38:
      if ((*(unsigned char *)&v11 & 1) == 0) {
        goto LABEL_39;
      }
      goto LABEL_69;
    }
  }
  else if ((*(_DWORD *)&v11 & 0x200000) == 0)
  {
    goto LABEL_38;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v12;
  $F3968B84FE20F39BD8F64B4450FE8BD1 v11 = self->_has;
  if ((*(unsigned char *)&v11 & 1) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&v11 & 0x100000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_40;
  }
LABEL_69:
  PBDataWriterWriteDoubleField();
  id v4 = v12;
  if ((*(_DWORD *)&self->_has & 0x100000) != 0)
  {
LABEL_40:
    PBDataWriterWriteBOOLField();
    id v4 = v12;
  }
LABEL_41:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  $F3968B84FE20F39BD8F64B4450FE8BD1 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    v4[35] = self->_orientation;
    v4[43] |= 0x2000u;
    $F3968B84FE20F39BD8F64B4450FE8BD1 has = self->_has;
    if ((*(_DWORD *)&has & 0x20000) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_49;
    }
  }
  else if ((*(_DWORD *)&has & 0x20000) == 0)
  {
    goto LABEL_3;
  }
  v4[39] = LODWORD(self->_zoomAmount);
  v4[43] |= 0x20000u;
  $F3968B84FE20F39BD8F64B4450FE8BD1 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_50;
  }
LABEL_49:
  v4[28] = self->_flashSupport;
  v4[43] |= 0x40u;
  $F3968B84FE20F39BD8F64B4450FE8BD1 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_51;
  }
LABEL_50:
  v4[27] = self->_flashMode;
  v4[43] |= 0x20u;
  $F3968B84FE20F39BD8F64B4450FE8BD1 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_52;
  }
LABEL_51:
  v4[30] = self->_hdrSupport;
  v4[43] |= 0x100u;
  $F3968B84FE20F39BD8F64B4450FE8BD1 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_53;
  }
LABEL_52:
  v4[29] = self->_hdrMode;
  v4[43] |= 0x80u;
  $F3968B84FE20F39BD8F64B4450FE8BD1 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_54;
  }
LABEL_53:
  v4[32] = self->_irisSupport;
  v4[43] |= 0x400u;
  $F3968B84FE20F39BD8F64B4450FE8BD1 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_55;
  }
LABEL_54:
  v4[31] = self->_irisMode;
  v4[43] |= 0x200u;
  $F3968B84FE20F39BD8F64B4450FE8BD1 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_56;
  }
LABEL_55:
  *((unsigned char *)v4 + 160) = self->_burstSupport;
  v4[43] |= 0x40000u;
  $F3968B84FE20F39BD8F64B4450FE8BD1 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_12;
    }
LABEL_57:
    *((unsigned char *)v4 + 166) = self->_toggleCameraDeviceSupport;
    v4[43] |= 0x1000000u;
    if ((*(_DWORD *)&self->_has & 0x4000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_56:
  v4[25] = self->_captureMode;
  v4[43] |= 8u;
  $F3968B84FE20F39BD8F64B4450FE8BD1 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) != 0) {
    goto LABEL_57;
  }
LABEL_12:
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_13:
    *((unsigned char *)v4 + 168) = self->_zoomSupport;
    v4[43] |= 0x4000000u;
  }
LABEL_14:
  id v18 = v4;
  if ([(NCCameraStateChangedRequest *)self supportedCaptureModesCount])
  {
    [v18 clearSupportedCaptureModes];
    unint64_t v6 = [(NCCameraStateChangedRequest *)self supportedCaptureModesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        objc_msgSend(v18, "addSupportedCaptureMode:", -[NCCameraStateChangedRequest supportedCaptureModeAtIndex:](self, "supportedCaptureModeAtIndex:", i));
    }
  }
  $F3968B84FE20F39BD8F64B4450FE8BD1 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x80000) != 0)
  {
    *((unsigned char *)v18 + 161) = self->_capturing;
    *((_DWORD *)v18 + 43) |= 0x80000u;
    $F3968B84FE20F39BD8F64B4450FE8BD1 v9 = self->_has;
    if ((*(unsigned char *)&v9 & 2) == 0)
    {
LABEL_20:
      if ((*(_DWORD *)&v9 & 0x400000) == 0) {
        goto LABEL_21;
      }
      goto LABEL_61;
    }
  }
  else if ((*(unsigned char *)&v9 & 2) == 0)
  {
    goto LABEL_20;
  }
  *((void *)v18 + 11) = *(void *)&self->_captureStartDate;
  *((_DWORD *)v18 + 43) |= 2u;
  $F3968B84FE20F39BD8F64B4450FE8BD1 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x400000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v9 & 0x4000) == 0) {
      goto LABEL_22;
    }
LABEL_62:
    *((_DWORD *)v18 + 36) = self->_shallowDepthOfFieldStatus;
    *((_DWORD *)v18 + 43) |= 0x4000u;
    if ((*(_DWORD *)&self->_has & 0x800000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_61:
  *((unsigned char *)v18 + 164) = self->_showingLivePreview;
  *((_DWORD *)v18 + 43) |= 0x400000u;
  $F3968B84FE20F39BD8F64B4450FE8BD1 v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x4000) != 0) {
    goto LABEL_62;
  }
LABEL_22:
  if ((*(_DWORD *)&v9 & 0x800000) != 0)
  {
LABEL_23:
    *((unsigned char *)v18 + 165) = self->_supportsMomentCapture;
    *((_DWORD *)v18 + 43) |= 0x800000u;
  }
LABEL_24:
  if ([(NCCameraStateChangedRequest *)self supportedCaptureDevicesCount])
  {
    [v18 clearSupportedCaptureDevices];
    unint64_t v10 = [(NCCameraStateChangedRequest *)self supportedCaptureDevicesCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
        objc_msgSend(v18, "addSupportedCaptureDevice:", -[NCCameraStateChangedRequest supportedCaptureDeviceAtIndex:](self, "supportedCaptureDeviceAtIndex:", j));
    }
  }
  $F3968B84FE20F39BD8F64B4450FE8BD1 v13 = self->_has;
  if ((*(unsigned char *)&v13 & 4) != 0)
  {
    *((_DWORD *)v18 + 24) = self->_captureDevice;
    *((_DWORD *)v18 + 43) |= 4u;
    $F3968B84FE20F39BD8F64B4450FE8BD1 v13 = self->_has;
    if ((*(_DWORD *)&v13 & 0x10000) == 0)
    {
LABEL_30:
      if ((*(_WORD *)&v13 & 0x8000) == 0) {
        goto LABEL_31;
      }
      goto LABEL_66;
    }
  }
  else if ((*(_DWORD *)&v13 & 0x10000) == 0)
  {
    goto LABEL_30;
  }
  *((_DWORD *)v18 + 38) = self->_sharedLibrarySupport;
  *((_DWORD *)v18 + 43) |= 0x10000u;
  $F3968B84FE20F39BD8F64B4450FE8BD1 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x8000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v13 & 0x2000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_67;
  }
LABEL_66:
  *((_DWORD *)v18 + 37) = self->_sharedLibraryMode;
  *((_DWORD *)v18 + 43) |= 0x8000u;
  $F3968B84FE20F39BD8F64B4450FE8BD1 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x2000000) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v13 & 0x1000) == 0) {
      goto LABEL_33;
    }
LABEL_68:
    *((_DWORD *)v18 + 34) = LODWORD(self->_minimumZoomMagnification);
    *((_DWORD *)v18 + 43) |= 0x1000u;
    if ((*(_DWORD *)&self->_has & 0x800) == 0) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
LABEL_67:
  *((unsigned char *)v18 + 167) = self->_zoomMagnificationSupport;
  *((_DWORD *)v18 + 43) |= 0x2000000u;
  $F3968B84FE20F39BD8F64B4450FE8BD1 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x1000) != 0) {
    goto LABEL_68;
  }
LABEL_33:
  if ((*(_WORD *)&v13 & 0x800) != 0)
  {
LABEL_34:
    *((_DWORD *)v18 + 33) = LODWORD(self->_maximumZoomMagnification);
    *((_DWORD *)v18 + 43) |= 0x800u;
  }
LABEL_35:
  if ([(NCCameraStateChangedRequest *)self significantZoomMagnificationsCount])
  {
    [v18 clearSignificantZoomMagnifications];
    unint64_t v14 = [(NCCameraStateChangedRequest *)self significantZoomMagnificationsCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t k = 0; k != v15; ++k)
      {
        [(NCCameraStateChangedRequest *)self significantZoomMagnificationsAtIndex:k];
        objc_msgSend(v18, "addSignificantZoomMagnifications:");
      }
    }
  }
  $F3968B84FE20F39BD8F64B4450FE8BD1 v17 = self->_has;
  if ((*(unsigned char *)&v17 & 0x10) != 0)
  {
    *((_DWORD *)v18 + 26) = LODWORD(self->_currentZoomMagnification);
    *((_DWORD *)v18 + 43) |= 0x10u;
    $F3968B84FE20F39BD8F64B4450FE8BD1 v17 = self->_has;
    if ((*(_DWORD *)&v17 & 0x200000) == 0)
    {
LABEL_41:
      if ((*(unsigned char *)&v17 & 1) == 0) {
        goto LABEL_42;
      }
      goto LABEL_72;
    }
  }
  else if ((*(_DWORD *)&v17 & 0x200000) == 0)
  {
    goto LABEL_41;
  }
  *((unsigned char *)v18 + 163) = self->_isSpatialCapture;
  *((_DWORD *)v18 + 43) |= 0x200000u;
  $F3968B84FE20F39BD8F64B4450FE8BD1 v17 = self->_has;
  if ((*(unsigned char *)&v17 & 1) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v17 & 0x100000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_43;
  }
LABEL_72:
  *((void *)v18 + 10) = *(void *)&self->_capturePauseDate;
  *((_DWORD *)v18 + 43) |= 1u;
  if ((*(_DWORD *)&self->_has & 0x100000) != 0)
  {
LABEL_43:
    *((unsigned char *)v18 + 162) = self->_capturingPaused;
    *((_DWORD *)v18 + 43) |= 0x100000u;
  }
LABEL_44:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  $F3968B84FE20F39BD8F64B4450FE8BD1 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    v4[35] = self->_orientation;
    v4[43] |= 0x2000u;
    $F3968B84FE20F39BD8F64B4450FE8BD1 has = self->_has;
    if ((*(_DWORD *)&has & 0x20000) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_35;
    }
  }
  else if ((*(_DWORD *)&has & 0x20000) == 0)
  {
    goto LABEL_3;
  }
  v4[39] = LODWORD(self->_zoomAmount);
  v4[43] |= 0x20000u;
  $F3968B84FE20F39BD8F64B4450FE8BD1 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_36;
  }
LABEL_35:
  v4[28] = self->_flashSupport;
  v4[43] |= 0x40u;
  $F3968B84FE20F39BD8F64B4450FE8BD1 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_37;
  }
LABEL_36:
  v4[27] = self->_flashMode;
  v4[43] |= 0x20u;
  $F3968B84FE20F39BD8F64B4450FE8BD1 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_38;
  }
LABEL_37:
  v4[30] = self->_hdrSupport;
  v4[43] |= 0x100u;
  $F3968B84FE20F39BD8F64B4450FE8BD1 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_39;
  }
LABEL_38:
  v4[29] = self->_hdrMode;
  v4[43] |= 0x80u;
  $F3968B84FE20F39BD8F64B4450FE8BD1 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_40;
  }
LABEL_39:
  v4[32] = self->_irisSupport;
  v4[43] |= 0x400u;
  $F3968B84FE20F39BD8F64B4450FE8BD1 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_41;
  }
LABEL_40:
  v4[31] = self->_irisMode;
  v4[43] |= 0x200u;
  $F3968B84FE20F39BD8F64B4450FE8BD1 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((unsigned char *)v4 + 160) = self->_burstSupport;
  v4[43] |= 0x40000u;
  $F3968B84FE20F39BD8F64B4450FE8BD1 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_43;
  }
LABEL_42:
  v4[25] = self->_captureMode;
  v4[43] |= 8u;
  $F3968B84FE20F39BD8F64B4450FE8BD1 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_43:
  *((unsigned char *)v4 + 166) = self->_toggleCameraDeviceSupport;
  v4[43] |= 0x1000000u;
  if ((*(_DWORD *)&self->_has & 0x4000000) != 0)
  {
LABEL_13:
    *((unsigned char *)v4 + 168) = self->_zoomSupport;
    v4[43] |= 0x4000000u;
  }
LABEL_14:
  PBRepeatedInt32Copy();
  $F3968B84FE20F39BD8F64B4450FE8BD1 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x80000) != 0)
  {
    v5[161] = self->_capturing;
    *((_DWORD *)v5 + 43) |= 0x80000u;
    $F3968B84FE20F39BD8F64B4450FE8BD1 v7 = self->_has;
    if ((*(unsigned char *)&v7 & 2) == 0)
    {
LABEL_16:
      if ((*(_DWORD *)&v7 & 0x400000) == 0) {
        goto LABEL_17;
      }
      goto LABEL_47;
    }
  }
  else if ((*(unsigned char *)&v7 & 2) == 0)
  {
    goto LABEL_16;
  }
  *((void *)v5 + 11) = *(void *)&self->_captureStartDate;
  *((_DWORD *)v5 + 43) |= 2u;
  $F3968B84FE20F39BD8F64B4450FE8BD1 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x400000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v7 & 0x4000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_48;
  }
LABEL_47:
  v5[164] = self->_showingLivePreview;
  *((_DWORD *)v5 + 43) |= 0x400000u;
  $F3968B84FE20F39BD8F64B4450FE8BD1 v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x4000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&v7 & 0x800000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_48:
  *((_DWORD *)v5 + 36) = self->_shallowDepthOfFieldStatus;
  *((_DWORD *)v5 + 43) |= 0x4000u;
  if ((*(_DWORD *)&self->_has & 0x800000) != 0)
  {
LABEL_19:
    v5[165] = self->_supportsMomentCapture;
    *((_DWORD *)v5 + 43) |= 0x800000u;
  }
LABEL_20:
  PBRepeatedInt32Copy();
  $F3968B84FE20F39BD8F64B4450FE8BD1 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 4) != 0)
  {
    *((_DWORD *)v5 + 24) = self->_captureDevice;
    *((_DWORD *)v5 + 43) |= 4u;
    $F3968B84FE20F39BD8F64B4450FE8BD1 v8 = self->_has;
    if ((*(_DWORD *)&v8 & 0x10000) == 0)
    {
LABEL_22:
      if ((*(_WORD *)&v8 & 0x8000) == 0) {
        goto LABEL_23;
      }
      goto LABEL_52;
    }
  }
  else if ((*(_DWORD *)&v8 & 0x10000) == 0)
  {
    goto LABEL_22;
  }
  *((_DWORD *)v5 + 38) = self->_sharedLibrarySupport;
  *((_DWORD *)v5 + 43) |= 0x10000u;
  $F3968B84FE20F39BD8F64B4450FE8BD1 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x8000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v8 & 0x2000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)v5 + 37) = self->_sharedLibraryMode;
  *((_DWORD *)v5 + 43) |= 0x8000u;
  $F3968B84FE20F39BD8F64B4450FE8BD1 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x2000000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v8 & 0x1000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_54;
  }
LABEL_53:
  v5[167] = self->_zoomMagnificationSupport;
  *((_DWORD *)v5 + 43) |= 0x2000000u;
  $F3968B84FE20F39BD8F64B4450FE8BD1 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x1000) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v8 & 0x800) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_54:
  *((_DWORD *)v5 + 34) = LODWORD(self->_minimumZoomMagnification);
  *((_DWORD *)v5 + 43) |= 0x1000u;
  if ((*(_DWORD *)&self->_has & 0x800) != 0)
  {
LABEL_26:
    *((_DWORD *)v5 + 33) = LODWORD(self->_maximumZoomMagnification);
    *((_DWORD *)v5 + 43) |= 0x800u;
  }
LABEL_27:
  PBRepeatedFloatCopy();
  $F3968B84FE20F39BD8F64B4450FE8BD1 v9 = self->_has;
  if ((*(unsigned char *)&v9 & 0x10) != 0)
  {
    *((_DWORD *)v5 + 26) = LODWORD(self->_currentZoomMagnification);
    *((_DWORD *)v5 + 43) |= 0x10u;
    $F3968B84FE20F39BD8F64B4450FE8BD1 v9 = self->_has;
    if ((*(_DWORD *)&v9 & 0x200000) == 0)
    {
LABEL_29:
      if ((*(unsigned char *)&v9 & 1) == 0) {
        goto LABEL_30;
      }
LABEL_58:
      *((void *)v5 + 10) = *(void *)&self->_capturePauseDate;
      *((_DWORD *)v5 + 43) |= 1u;
      if ((*(_DWORD *)&self->_has & 0x100000) == 0) {
        return v5;
      }
      goto LABEL_31;
    }
  }
  else if ((*(_DWORD *)&v9 & 0x200000) == 0)
  {
    goto LABEL_29;
  }
  v5[163] = self->_isSpatialCapture;
  *((_DWORD *)v5 + 43) |= 0x200000u;
  $F3968B84FE20F39BD8F64B4450FE8BD1 v9 = self->_has;
  if (*(unsigned char *)&v9) {
    goto LABEL_58;
  }
LABEL_30:
  if ((*(_DWORD *)&v9 & 0x100000) != 0)
  {
LABEL_31:
    v5[162] = self->_capturingPaused;
    *((_DWORD *)v5 + 43) |= 0x100000u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_162;
  }
  $F3968B84FE20F39BD8F64B4450FE8BD1 has = self->_has;
  int v6 = *((_DWORD *)v4 + 43);
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_orientation != *((_DWORD *)v4 + 35)) {
      goto LABEL_162;
    }
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_zoomAmount != *((float *)v4 + 39)) {
      goto LABEL_162;
    }
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_flashSupport != *((_DWORD *)v4 + 28)) {
      goto LABEL_162;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_162;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_flashMode != *((_DWORD *)v4 + 27)) {
      goto LABEL_162;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_hdrSupport != *((_DWORD *)v4 + 30)) {
      goto LABEL_162;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_162;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_hdrMode != *((_DWORD *)v4 + 29)) {
      goto LABEL_162;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_irisSupport != *((_DWORD *)v4 + 32)) {
      goto LABEL_162;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_irisMode != *((_DWORD *)v4 + 31)) {
      goto LABEL_162;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v6 & 0x40000) == 0) {
      goto LABEL_162;
    }
    if (self->_burstSupport)
    {
      if (!*((unsigned char *)v4 + 160)) {
        goto LABEL_162;
      }
    }
    else if (*((unsigned char *)v4 + 160))
    {
      goto LABEL_162;
    }
  }
  else if ((v6 & 0x40000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_captureMode != *((_DWORD *)v4 + 25)) {
      goto LABEL_162;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v6 & 0x1000000) == 0) {
      goto LABEL_162;
    }
    if (self->_toggleCameraDeviceSupport)
    {
      if (!*((unsigned char *)v4 + 166)) {
        goto LABEL_162;
      }
    }
    else if (*((unsigned char *)v4 + 166))
    {
      goto LABEL_162;
    }
  }
  else if ((v6 & 0x1000000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v6 & 0x4000000) == 0) {
      goto LABEL_162;
    }
    if (self->_zoomSupport)
    {
      if (!*((unsigned char *)v4 + 168)) {
        goto LABEL_162;
      }
    }
    else if (*((unsigned char *)v4 + 168))
    {
      goto LABEL_162;
    }
  }
  else if ((v6 & 0x4000000) != 0)
  {
    goto LABEL_162;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_162;
  }
  $F3968B84FE20F39BD8F64B4450FE8BD1 v7 = self->_has;
  int v8 = *((_DWORD *)v4 + 43);
  if ((*(_DWORD *)&v7 & 0x80000) != 0)
  {
    if ((v8 & 0x80000) == 0) {
      goto LABEL_162;
    }
    if (self->_capturing)
    {
      if (!*((unsigned char *)v4 + 161)) {
        goto LABEL_162;
      }
    }
    else if (*((unsigned char *)v4 + 161))
    {
      goto LABEL_162;
    }
  }
  else if ((v8 & 0x80000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(unsigned char *)&v7 & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_captureStartDate != *((double *)v4 + 11)) {
      goto LABEL_162;
    }
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&v7 & 0x400000) != 0)
  {
    if ((v8 & 0x400000) == 0) {
      goto LABEL_162;
    }
    if (self->_showingLivePreview)
    {
      if (!*((unsigned char *)v4 + 164)) {
        goto LABEL_162;
      }
    }
    else if (*((unsigned char *)v4 + 164))
    {
      goto LABEL_162;
    }
  }
  else if ((v8 & 0x400000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&v7 & 0x4000) != 0)
  {
    if ((v8 & 0x4000) == 0 || self->_shallowDepthOfFieldStatus != *((_DWORD *)v4 + 36)) {
      goto LABEL_162;
    }
  }
  else if ((v8 & 0x4000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&v7 & 0x800000) != 0)
  {
    if ((v8 & 0x800000) == 0) {
      goto LABEL_162;
    }
    if (self->_supportsMomentCapture)
    {
      if (!*((unsigned char *)v4 + 165)) {
        goto LABEL_162;
      }
    }
    else if (*((unsigned char *)v4 + 165))
    {
      goto LABEL_162;
    }
  }
  else if ((v8 & 0x800000) != 0)
  {
    goto LABEL_162;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_162;
  }
  $F3968B84FE20F39BD8F64B4450FE8BD1 v9 = self->_has;
  int v10 = *((_DWORD *)v4 + 43);
  if ((*(unsigned char *)&v9 & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_captureDevice != *((_DWORD *)v4 + 24)) {
      goto LABEL_162;
    }
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&v9 & 0x10000) != 0)
  {
    if ((v10 & 0x10000) == 0 || self->_sharedLibrarySupport != *((_DWORD *)v4 + 38)) {
      goto LABEL_162;
    }
  }
  else if ((v10 & 0x10000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&v9 & 0x8000) != 0)
  {
    if ((v10 & 0x8000) == 0 || self->_sharedLibraryMode != *((_DWORD *)v4 + 37)) {
      goto LABEL_162;
    }
  }
  else if ((v10 & 0x8000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&v9 & 0x2000000) != 0)
  {
    if ((v10 & 0x2000000) == 0) {
      goto LABEL_162;
    }
    if (self->_zoomMagnificationSupport)
    {
      if (!*((unsigned char *)v4 + 167)) {
        goto LABEL_162;
      }
    }
    else if (*((unsigned char *)v4 + 167))
    {
      goto LABEL_162;
    }
  }
  else if ((v10 & 0x2000000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&v9 & 0x1000) != 0)
  {
    if ((v10 & 0x1000) == 0 || self->_minimumZoomMagnification != *((float *)v4 + 34)) {
      goto LABEL_162;
    }
  }
  else if ((v10 & 0x1000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&v9 & 0x800) != 0)
  {
    if ((v10 & 0x800) == 0 || self->_maximumZoomMagnification != *((float *)v4 + 33)) {
      goto LABEL_162;
    }
  }
  else if ((v10 & 0x800) != 0)
  {
    goto LABEL_162;
  }
  if (!PBRepeatedFloatIsEqual())
  {
LABEL_162:
    BOOL v13 = 0;
    goto LABEL_163;
  }
  $F3968B84FE20F39BD8F64B4450FE8BD1 v11 = self->_has;
  int v12 = *((_DWORD *)v4 + 43);
  if ((*(unsigned char *)&v11 & 0x10) != 0)
  {
    if ((v12 & 0x10) == 0 || self->_currentZoomMagnification != *((float *)v4 + 26)) {
      goto LABEL_162;
    }
  }
  else if ((v12 & 0x10) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&v11 & 0x200000) != 0)
  {
    if ((v12 & 0x200000) == 0) {
      goto LABEL_162;
    }
    if (self->_isSpatialCapture)
    {
      if (!*((unsigned char *)v4 + 163)) {
        goto LABEL_162;
      }
    }
    else if (*((unsigned char *)v4 + 163))
    {
      goto LABEL_162;
    }
  }
  else if ((v12 & 0x200000) != 0)
  {
    goto LABEL_162;
  }
  if (*(unsigned char *)&v11)
  {
    if ((v12 & 1) == 0 || self->_capturePauseDate != *((double *)v4 + 10)) {
      goto LABEL_162;
    }
  }
  else if (v12)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&v11 & 0x100000) != 0)
  {
    if ((v12 & 0x100000) != 0)
    {
      if (self->_capturingPaused)
      {
        if (!*((unsigned char *)v4 + 162)) {
          goto LABEL_162;
        }
      }
      else if (*((unsigned char *)v4 + 162))
      {
        goto LABEL_162;
      }
      BOOL v13 = 1;
      goto LABEL_163;
    }
    goto LABEL_162;
  }
  BOOL v13 = (v12 & 0x100000) == 0;
LABEL_163:

  return v13;
}

- (unint64_t)hash
{
  $F3968B84FE20F39BD8F64B4450FE8BD1 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    uint64_t v62 = 2654435761 * self->_orientation;
    if ((*(_DWORD *)&has & 0x20000) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v8 = 0;
    goto LABEL_11;
  }
  uint64_t v62 = 0;
  if ((*(_DWORD *)&has & 0x20000) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  float zoomAmount = self->_zoomAmount;
  float v5 = -zoomAmount;
  if (zoomAmount >= 0.0) {
    float v5 = self->_zoomAmount;
  }
  float v6 = floorf(v5 + 0.5);
  float v7 = (float)(v5 - v6) * 1.8447e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmodf(v6, 1.8447e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabsf(v7);
  }
LABEL_11:
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    uint64_t v60 = 2654435761 * self->_flashSupport;
    if ((*(unsigned char *)&has & 0x20) != 0)
    {
LABEL_13:
      uint64_t v59 = 2654435761 * self->_flashMode;
      if ((*(_WORD *)&has & 0x100) != 0) {
        goto LABEL_14;
      }
      goto LABEL_23;
    }
  }
  else
  {
    uint64_t v60 = 0;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_13;
    }
  }
  uint64_t v59 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_14:
    uint64_t v58 = 2654435761 * self->_hdrSupport;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_15;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v58 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_15:
    uint64_t v57 = 2654435761 * self->_hdrMode;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_16;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v57 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_16:
    uint64_t v56 = 2654435761 * self->_irisSupport;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_17;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v56 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_17:
    uint64_t v55 = 2654435761 * self->_irisMode;
    if ((*(_DWORD *)&has & 0x40000) != 0) {
      goto LABEL_18;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v55 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_18:
    uint64_t v54 = 2654435761 * self->_burstSupport;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_19;
    }
LABEL_28:
    uint64_t v53 = 0;
    if ((*(_DWORD *)&has & 0x1000000) != 0) {
      goto LABEL_20;
    }
    goto LABEL_29;
  }
LABEL_27:
  uint64_t v54 = 0;
  if ((*(unsigned char *)&has & 8) == 0) {
    goto LABEL_28;
  }
LABEL_19:
  uint64_t v53 = 2654435761 * self->_captureMode;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_20:
    uint64_t v52 = 2654435761 * self->_toggleCameraDeviceSupport;
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v52 = 0;
LABEL_30:
  unint64_t v61 = v8;
  if ((*(_DWORD *)&has & 0x4000000) != 0) {
    uint64_t v51 = 2654435761 * self->_zoomSupport;
  }
  else {
    uint64_t v51 = 0;
  }
  uint64_t v50 = PBRepeatedInt32Hash();
  $F3968B84FE20F39BD8F64B4450FE8BD1 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x80000) != 0)
  {
    uint64_t v49 = 2654435761 * self->_capturing;
    if ((*(unsigned char *)&v9 & 2) != 0) {
      goto LABEL_35;
    }
LABEL_40:
    unint64_t v14 = 0;
    goto LABEL_43;
  }
  uint64_t v49 = 0;
  if ((*(unsigned char *)&v9 & 2) == 0) {
    goto LABEL_40;
  }
LABEL_35:
  double captureStartDate = self->_captureStartDate;
  double v11 = -captureStartDate;
  if (captureStartDate >= 0.0) {
    double v11 = self->_captureStartDate;
  }
  long double v12 = floor(v11 + 0.5);
  double v13 = (v11 - v12) * 1.84467441e19;
  unint64_t v14 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
  if (v13 >= 0.0)
  {
    if (v13 > 0.0) {
      v14 += (unint64_t)v13;
    }
  }
  else
  {
    v14 -= (unint64_t)fabs(v13);
  }
LABEL_43:
  if ((*(_DWORD *)&v9 & 0x400000) == 0)
  {
    uint64_t v48 = 0;
    if ((*(_WORD *)&v9 & 0x4000) != 0) {
      goto LABEL_45;
    }
LABEL_48:
    uint64_t v47 = 0;
    if ((*(_DWORD *)&v9 & 0x800000) != 0) {
      goto LABEL_46;
    }
    goto LABEL_49;
  }
  uint64_t v48 = 2654435761 * self->_showingLivePreview;
  if ((*(_WORD *)&v9 & 0x4000) == 0) {
    goto LABEL_48;
  }
LABEL_45:
  uint64_t v47 = 2654435761 * self->_shallowDepthOfFieldStatus;
  if ((*(_DWORD *)&v9 & 0x800000) != 0)
  {
LABEL_46:
    uint64_t v46 = 2654435761 * self->_supportsMomentCapture;
    goto LABEL_50;
  }
LABEL_49:
  uint64_t v46 = 0;
LABEL_50:
  uint64_t v45 = PBRepeatedInt32Hash();
  $F3968B84FE20F39BD8F64B4450FE8BD1 v15 = self->_has;
  if ((*(unsigned char *)&v15 & 4) != 0)
  {
    uint64_t v44 = 2654435761 * self->_captureDevice;
    if ((*(_DWORD *)&v15 & 0x10000) != 0)
    {
LABEL_52:
      uint64_t v43 = 2654435761 * self->_sharedLibrarySupport;
      if ((*(_WORD *)&v15 & 0x8000) != 0) {
        goto LABEL_53;
      }
      goto LABEL_61;
    }
  }
  else
  {
    uint64_t v44 = 0;
    if ((*(_DWORD *)&v15 & 0x10000) != 0) {
      goto LABEL_52;
    }
  }
  uint64_t v43 = 0;
  if ((*(_WORD *)&v15 & 0x8000) != 0)
  {
LABEL_53:
    uint64_t v42 = 2654435761 * self->_sharedLibraryMode;
    if ((*(_DWORD *)&v15 & 0x2000000) != 0) {
      goto LABEL_54;
    }
LABEL_62:
    uint64_t v16 = 0;
    if ((*(_WORD *)&v15 & 0x1000) != 0) {
      goto LABEL_55;
    }
LABEL_63:
    unint64_t v21 = 0;
    goto LABEL_66;
  }
LABEL_61:
  uint64_t v42 = 0;
  if ((*(_DWORD *)&v15 & 0x2000000) == 0) {
    goto LABEL_62;
  }
LABEL_54:
  uint64_t v16 = 2654435761 * self->_zoomMagnificationSupport;
  if ((*(_WORD *)&v15 & 0x1000) == 0) {
    goto LABEL_63;
  }
LABEL_55:
  float minimumZoomMagnification = self->_minimumZoomMagnification;
  float v18 = -minimumZoomMagnification;
  if (minimumZoomMagnification >= 0.0) {
    float v18 = self->_minimumZoomMagnification;
  }
  float v19 = floorf(v18 + 0.5);
  float v20 = (float)(v18 - v19) * 1.8447e19;
  unint64_t v21 = 2654435761u * (unint64_t)fmodf(v19, 1.8447e19);
  if (v20 >= 0.0)
  {
    if (v20 > 0.0) {
      v21 += (unint64_t)v20;
    }
  }
  else
  {
    v21 -= (unint64_t)fabsf(v20);
  }
LABEL_66:
  if ((*(_WORD *)&v15 & 0x800) != 0)
  {
    float maximumZoomMagnification = self->_maximumZoomMagnification;
    float v24 = -maximumZoomMagnification;
    if (maximumZoomMagnification >= 0.0) {
      float v24 = self->_maximumZoomMagnification;
    }
    float v25 = floorf(v24 + 0.5);
    float v26 = (float)(v24 - v25) * 1.8447e19;
    unint64_t v22 = 2654435761u * (unint64_t)fmodf(v25, 1.8447e19);
    if (v26 >= 0.0)
    {
      if (v26 > 0.0) {
        v22 += (unint64_t)v26;
      }
    }
    else
    {
      v22 -= (unint64_t)fabsf(v26);
    }
  }
  else
  {
    unint64_t v22 = 0;
  }
  uint64_t v27 = PBRepeatedFloatHash();
  $F3968B84FE20F39BD8F64B4450FE8BD1 v28 = self->_has;
  if ((*(unsigned char *)&v28 & 0x10) != 0)
  {
    float currentZoomMagnification = self->_currentZoomMagnification;
    float v31 = -currentZoomMagnification;
    if (currentZoomMagnification >= 0.0) {
      float v31 = self->_currentZoomMagnification;
    }
    float v32 = floorf(v31 + 0.5);
    float v33 = (float)(v31 - v32) * 1.8447e19;
    unint64_t v29 = 2654435761u * (unint64_t)fmodf(v32, 1.8447e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0) {
        v29 += (unint64_t)v33;
      }
    }
    else
    {
      v29 -= (unint64_t)fabsf(v33);
    }
  }
  else
  {
    unint64_t v29 = 0;
  }
  if ((*(_DWORD *)&v28 & 0x200000) != 0)
  {
    uint64_t v34 = 2654435761 * self->_isSpatialCapture;
    if (*(unsigned char *)&v28) {
      goto LABEL_84;
    }
LABEL_89:
    unint64_t v39 = 0;
    goto LABEL_92;
  }
  uint64_t v34 = 0;
  if ((*(unsigned char *)&v28 & 1) == 0) {
    goto LABEL_89;
  }
LABEL_84:
  double capturePauseDate = self->_capturePauseDate;
  double v36 = -capturePauseDate;
  if (capturePauseDate >= 0.0) {
    double v36 = self->_capturePauseDate;
  }
  long double v37 = floor(v36 + 0.5);
  double v38 = (v36 - v37) * 1.84467441e19;
  unint64_t v39 = 2654435761u * (unint64_t)fmod(v37, 1.84467441e19);
  if (v38 >= 0.0)
  {
    if (v38 > 0.0) {
      v39 += (unint64_t)v38;
    }
  }
  else
  {
    v39 -= (unint64_t)fabs(v38);
  }
LABEL_92:
  if ((*(_DWORD *)&v28 & 0x100000) != 0) {
    uint64_t v40 = 2654435761 * self->_capturingPaused;
  }
  else {
    uint64_t v40 = 0;
  }
  return v61 ^ v62 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v49 ^ v14 ^ v50 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v16 ^ v21 ^ v22 ^ v27 ^ v29 ^ v34 ^ v39 ^ v40;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  int v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 0x2000) != 0)
  {
    self->_uint64_t orientation = *((_DWORD *)v4 + 35);
    *(_DWORD *)&self->_has |= 0x2000u;
    int v5 = *((_DWORD *)v4 + 43);
    if ((v5 & 0x20000) == 0)
    {
LABEL_3:
      if ((v5 & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_46;
    }
  }
  else if ((v5 & 0x20000) == 0)
  {
    goto LABEL_3;
  }
  self->_float zoomAmount = *((float *)v4 + 39);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 0x40) == 0)
  {
LABEL_4:
    if ((v5 & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_47;
  }
LABEL_46:
  self->_uint64_t flashSupport = *((_DWORD *)v4 + 28);
  *(_DWORD *)&self->_has |= 0x40u;
  int v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 0x20) == 0)
  {
LABEL_5:
    if ((v5 & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_48;
  }
LABEL_47:
  self->_uint64_t flashMode = *((_DWORD *)v4 + 27);
  *(_DWORD *)&self->_has |= 0x20u;
  int v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 0x100) == 0)
  {
LABEL_6:
    if ((v5 & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_49;
  }
LABEL_48:
  self->_uint64_t hdrSupport = *((_DWORD *)v4 + 30);
  *(_DWORD *)&self->_has |= 0x100u;
  int v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 0x80) == 0)
  {
LABEL_7:
    if ((v5 & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_50;
  }
LABEL_49:
  self->_uint64_t hdrMode = *((_DWORD *)v4 + 29);
  *(_DWORD *)&self->_has |= 0x80u;
  int v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 0x400) == 0)
  {
LABEL_8:
    if ((v5 & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_51;
  }
LABEL_50:
  self->_uint64_t irisSupport = *((_DWORD *)v4 + 32);
  *(_DWORD *)&self->_has |= 0x400u;
  int v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 0x200) == 0)
  {
LABEL_9:
    if ((v5 & 0x40000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_52;
  }
LABEL_51:
  self->_uint64_t irisMode = *((_DWORD *)v4 + 31);
  *(_DWORD *)&self->_has |= 0x200u;
  int v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 0x40000) == 0)
  {
LABEL_10:
    if ((v5 & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_53;
  }
LABEL_52:
  self->_burstSupport = *((unsigned char *)v4 + 160);
  *(_DWORD *)&self->_has |= 0x40000u;
  int v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 8) == 0)
  {
LABEL_11:
    if ((v5 & 0x1000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_54;
  }
LABEL_53:
  self->_uint64_t captureMode = *((_DWORD *)v4 + 25);
  *(_DWORD *)&self->_has |= 8u;
  int v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_12:
    if ((v5 & 0x4000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_54:
  self->_toggleCameraDeviceSupport = *((unsigned char *)v4 + 166);
  *(_DWORD *)&self->_has |= 0x1000000u;
  if ((*((_DWORD *)v4 + 43) & 0x4000000) != 0)
  {
LABEL_13:
    self->_zoomSupport = *((unsigned char *)v4 + 168);
    *(_DWORD *)&self->_has |= 0x4000000u;
  }
LABEL_14:
  id v18 = v4;
  float v6 = (char *)[v4 supportedCaptureModesCount];
  if (v6)
  {
    float v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[NCCameraStateChangedRequest addSupportedCaptureMode:](self, "addSupportedCaptureMode:", [v18 supportedCaptureModeAtIndex:i]);
  }
  int v9 = *((_DWORD *)v18 + 43);
  if ((v9 & 0x80000) != 0)
  {
    self->_capturing = *((unsigned char *)v18 + 161);
    *(_DWORD *)&self->_has |= 0x80000u;
    int v9 = *((_DWORD *)v18 + 43);
    if ((v9 & 2) == 0)
    {
LABEL_19:
      if ((v9 & 0x400000) == 0) {
        goto LABEL_20;
      }
      goto LABEL_58;
    }
  }
  else if ((v9 & 2) == 0)
  {
    goto LABEL_19;
  }
  self->_double captureStartDate = *((double *)v18 + 11);
  *(_DWORD *)&self->_has |= 2u;
  int v9 = *((_DWORD *)v18 + 43);
  if ((v9 & 0x400000) == 0)
  {
LABEL_20:
    if ((v9 & 0x4000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_59;
  }
LABEL_58:
  self->_showingLivePreview = *((unsigned char *)v18 + 164);
  *(_DWORD *)&self->_has |= 0x400000u;
  int v9 = *((_DWORD *)v18 + 43);
  if ((v9 & 0x4000) == 0)
  {
LABEL_21:
    if ((v9 & 0x800000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_59:
  self->_uint64_t shallowDepthOfFieldStatus = *((_DWORD *)v18 + 36);
  *(_DWORD *)&self->_has |= 0x4000u;
  if ((*((_DWORD *)v18 + 43) & 0x800000) != 0)
  {
LABEL_22:
    self->_supportsMomentCapture = *((unsigned char *)v18 + 165);
    *(_DWORD *)&self->_has |= 0x800000u;
  }
LABEL_23:
  int v10 = (char *)[v18 supportedCaptureDevicesCount];
  if (v10)
  {
    double v11 = v10;
    for (uint64_t j = 0; j != v11; ++j)
      -[NCCameraStateChangedRequest addSupportedCaptureDevice:](self, "addSupportedCaptureDevice:", [v18 supportedCaptureDeviceAtIndex:j]);
  }
  int v13 = *((_DWORD *)v18 + 43);
  if ((v13 & 4) != 0)
  {
    self->_int captureDevice = *((_DWORD *)v18 + 24);
    *(_DWORD *)&self->_has |= 4u;
    int v13 = *((_DWORD *)v18 + 43);
    if ((v13 & 0x10000) == 0)
    {
LABEL_28:
      if ((v13 & 0x8000) == 0) {
        goto LABEL_29;
      }
      goto LABEL_63;
    }
  }
  else if ((v13 & 0x10000) == 0)
  {
    goto LABEL_28;
  }
  self->_int sharedLibrarySupport = *((_DWORD *)v18 + 38);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v13 = *((_DWORD *)v18 + 43);
  if ((v13 & 0x8000) == 0)
  {
LABEL_29:
    if ((v13 & 0x2000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_64;
  }
LABEL_63:
  self->_int sharedLibraryMode = *((_DWORD *)v18 + 37);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v13 = *((_DWORD *)v18 + 43);
  if ((v13 & 0x2000000) == 0)
  {
LABEL_30:
    if ((v13 & 0x1000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_65;
  }
LABEL_64:
  self->_zoomMagnificationSupport = *((unsigned char *)v18 + 167);
  *(_DWORD *)&self->_has |= 0x2000000u;
  int v13 = *((_DWORD *)v18 + 43);
  if ((v13 & 0x1000) == 0)
  {
LABEL_31:
    if ((v13 & 0x800) == 0) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
LABEL_65:
  self->_float minimumZoomMagnification = *((float *)v18 + 34);
  *(_DWORD *)&self->_has |= 0x1000u;
  if ((*((_DWORD *)v18 + 43) & 0x800) != 0)
  {
LABEL_32:
    self->_float maximumZoomMagnification = *((float *)v18 + 33);
    *(_DWORD *)&self->_has |= 0x800u;
  }
LABEL_33:
  unint64_t v14 = (char *)[v18 significantZoomMagnificationsCount];
  if (v14)
  {
    $F3968B84FE20F39BD8F64B4450FE8BD1 v15 = v14;
    for (uint64_t k = 0; k != v15; ++k)
    {
      [v18 significantZoomMagnificationsAtIndex:k];
      -[NCCameraStateChangedRequest addSignificantZoomMagnifications:](self, "addSignificantZoomMagnifications:");
    }
  }
  int v17 = *((_DWORD *)v18 + 43);
  if ((v17 & 0x10) != 0)
  {
    self->_float currentZoomMagnification = *((float *)v18 + 26);
    *(_DWORD *)&self->_has |= 0x10u;
    int v17 = *((_DWORD *)v18 + 43);
    if ((v17 & 0x200000) == 0)
    {
LABEL_38:
      if ((v17 & 1) == 0) {
        goto LABEL_39;
      }
      goto LABEL_69;
    }
  }
  else if ((v17 & 0x200000) == 0)
  {
    goto LABEL_38;
  }
  self->_isSpatialCapture = *((unsigned char *)v18 + 163);
  *(_DWORD *)&self->_has |= 0x200000u;
  int v17 = *((_DWORD *)v18 + 43);
  if ((v17 & 1) == 0)
  {
LABEL_39:
    if ((v17 & 0x100000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_40;
  }
LABEL_69:
  self->_double capturePauseDate = *((double *)v18 + 10);
  *(_DWORD *)&self->_has |= 1u;
  if ((*((_DWORD *)v18 + 43) & 0x100000) != 0)
  {
LABEL_40:
    self->_capturingPaused = *((unsigned char *)v18 + 162);
    *(_DWORD *)&self->_has |= 0x100000u;
  }
LABEL_41:
}

- (float)zoomAmount
{
  return self->_zoomAmount;
}

- (BOOL)burstSupport
{
  return self->_burstSupport;
}

- (BOOL)toggleCameraDeviceSupport
{
  return self->_toggleCameraDeviceSupport;
}

- (BOOL)zoomSupport
{
  return self->_zoomSupport;
}

- (BOOL)capturing
{
  return self->_capturing;
}

- (double)captureStartDate
{
  return self->_captureStartDate;
}

- (BOOL)showingLivePreview
{
  return self->_showingLivePreview;
}

- (BOOL)supportsMomentCapture
{
  return self->_supportsMomentCapture;
}

- (BOOL)zoomMagnificationSupport
{
  return self->_zoomMagnificationSupport;
}

- (float)minimumZoomMagnification
{
  return self->_minimumZoomMagnification;
}

- (float)maximumZoomMagnification
{
  return self->_maximumZoomMagnification;
}

- (float)currentZoomMagnification
{
  return self->_currentZoomMagnification;
}

- (BOOL)isSpatialCapture
{
  return self->_isSpatialCapture;
}

- (double)capturePauseDate
{
  return self->_capturePauseDate;
}

- (BOOL)capturingPaused
{
  return self->_capturingPaused;
}

@end