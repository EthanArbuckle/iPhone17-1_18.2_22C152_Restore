@interface CLPLocation
+ (Class)appBundleIdIndicesType;
- (BOOL)hasAltitude;
- (BOOL)hasBaroCalibrationIndication;
- (BOOL)hasContext;
- (BOOL)hasCourse;
- (BOOL)hasCourseAccuracy;
- (BOOL)hasDominantMotionActivity;
- (BOOL)hasFloor;
- (BOOL)hasHorzUncSemiMaj;
- (BOOL)hasHorzUncSemiMajAz;
- (BOOL)hasHorzUncSemiMin;
- (BOOL)hasIsFromLocationController;
- (BOOL)hasIsProactiveLocation;
- (BOOL)hasModeIndicator;
- (BOOL)hasMotionActivity;
- (BOOL)hasMotionActivityConfidence;
- (BOOL)hasMotionActivityType;
- (BOOL)hasMotionVehicleConnected;
- (BOOL)hasMotionVehicleConnectedStateChanged;
- (BOOL)hasPipelineDiagnosticReport;
- (BOOL)hasProcessingMetadata;
- (BOOL)hasProvider;
- (BOOL)hasRawMotionActivity;
- (BOOL)hasSatReport;
- (BOOL)hasSpeed;
- (BOOL)hasSpeedAccuracy;
- (BOOL)hasVehicleType;
- (BOOL)hasVerticalAccuracy;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFromLocationController;
- (BOOL)isProactiveLocation;
- (BOOL)motionVehicleConnected;
- (BOOL)motionVehicleConnectedStateChanged;
- (BOOL)readFrom:(id)a3;
- (CLPBaroCalibrationIndication)baroCalibrationIndication;
- (CLPLocationProcessingMetadata)processingMetadata;
- (CLPMotionActivity)dominantMotionActivity;
- (CLPMotionActivity)motionActivity;
- (CLPMotionActivity)rawMotionActivity;
- (CLPPipelineDiagnosticReport)pipelineDiagnosticReport;
- (CLPSatelliteReport)satReport;
- (CLPVehicleType)vehicleType;
- (NSMutableArray)appBundleIdIndices;
- (double)latitude;
- (double)longitude;
- (double)timestamp;
- (float)altitude;
- (float)course;
- (float)courseAccuracy;
- (float)horizontalAccuracy;
- (float)horzUncSemiMaj;
- (float)horzUncSemiMajAz;
- (float)horzUncSemiMin;
- (float)speed;
- (float)speedAccuracy;
- (float)verticalAccuracy;
- (id)appBundleIdIndicesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)modeIndicatorAsString:(int)a3;
- (int)StringAsModeIndicator:(id)a3;
- (int)context;
- (int)floor;
- (int)modeIndicator;
- (int)motionActivityConfidence;
- (int)motionActivityType;
- (int)provider;
- (unint64_t)appBundleIdIndicesCount;
- (unint64_t)hash;
- (void)addAppBundleIdIndices:(id)a3;
- (void)clearAppBundleIdIndices;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAltitude:(float)a3;
- (void)setAppBundleIdIndices:(id)a3;
- (void)setBaroCalibrationIndication:(id)a3;
- (void)setContext:(int)a3;
- (void)setCourse:(float)a3;
- (void)setCourseAccuracy:(float)a3;
- (void)setDominantMotionActivity:(id)a3;
- (void)setFloor:(int)a3;
- (void)setHasAltitude:(BOOL)a3;
- (void)setHasContext:(BOOL)a3;
- (void)setHasCourse:(BOOL)a3;
- (void)setHasCourseAccuracy:(BOOL)a3;
- (void)setHasFloor:(BOOL)a3;
- (void)setHasHorzUncSemiMaj:(BOOL)a3;
- (void)setHasHorzUncSemiMajAz:(BOOL)a3;
- (void)setHasHorzUncSemiMin:(BOOL)a3;
- (void)setHasIsFromLocationController:(BOOL)a3;
- (void)setHasIsProactiveLocation:(BOOL)a3;
- (void)setHasModeIndicator:(BOOL)a3;
- (void)setHasMotionActivityConfidence:(BOOL)a3;
- (void)setHasMotionActivityType:(BOOL)a3;
- (void)setHasMotionVehicleConnected:(BOOL)a3;
- (void)setHasMotionVehicleConnectedStateChanged:(BOOL)a3;
- (void)setHasProvider:(BOOL)a3;
- (void)setHasSpeed:(BOOL)a3;
- (void)setHasSpeedAccuracy:(BOOL)a3;
- (void)setHasVerticalAccuracy:(BOOL)a3;
- (void)setHorizontalAccuracy:(float)a3;
- (void)setHorzUncSemiMaj:(float)a3;
- (void)setHorzUncSemiMajAz:(float)a3;
- (void)setHorzUncSemiMin:(float)a3;
- (void)setIsFromLocationController:(BOOL)a3;
- (void)setIsProactiveLocation:(BOOL)a3;
- (void)setLatitude:(double)a3;
- (void)setLongitude:(double)a3;
- (void)setModeIndicator:(int)a3;
- (void)setMotionActivity:(id)a3;
- (void)setMotionActivityConfidence:(int)a3;
- (void)setMotionActivityType:(int)a3;
- (void)setMotionVehicleConnected:(BOOL)a3;
- (void)setMotionVehicleConnectedStateChanged:(BOOL)a3;
- (void)setPipelineDiagnosticReport:(id)a3;
- (void)setProcessingMetadata:(id)a3;
- (void)setProvider:(int)a3;
- (void)setRawMotionActivity:(id)a3;
- (void)setSatReport:(id)a3;
- (void)setSpeed:(float)a3;
- (void)setSpeedAccuracy:(float)a3;
- (void)setTimestamp:(double)a3;
- (void)setVehicleType:(id)a3;
- (void)setVerticalAccuracy:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPLocation

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (void)setLongitude:(double)a3
{
  self->_longitude = a3;
}

- (void)setLatitude:(double)a3
{
  self->_latitude = a3;
}

- (void)setHorizontalAccuracy:(float)a3
{
  self->_horizontalAccuracy = a3;
}

- (void)setRawMotionActivity:(id)a3
{
}

- (void)setMotionActivity:(id)a3
{
}

- (void)setDominantMotionActivity:(id)a3
{
}

- (void)setProvider:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_provider = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]
    || self->_latitude != *((double *)v4 + 1)
    || self->_longitude != *((double *)v4 + 2)
    || self->_horizontalAccuracy != *((float *)v4 + 21))
  {
    goto LABEL_127;
  }
  $68CE81C649BB310E20AD4460D39D0015 has = self->_has;
  int v6 = *((_DWORD *)v4 + 46);
  if (*(unsigned char *)&has)
  {
    if ((v6 & 1) == 0 || self->_altitude != *((float *)v4 + 8)) {
      goto LABEL_127;
    }
  }
  else if (v6)
  {
    goto LABEL_127;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_verticalAccuracy != *((float *)v4 + 44)) {
      goto LABEL_127;
    }
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_127;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_speed != *((float *)v4 + 40)) {
      goto LABEL_127;
    }
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_127;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_course != *((float *)v4 + 15)) {
      goto LABEL_127;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_127;
  }
  if (self->_timestamp != *((double *)v4 + 3)) {
    goto LABEL_127;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_context != *((_DWORD *)v4 + 14)) {
      goto LABEL_127;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_127;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_motionActivityType != *((_DWORD *)v4 + 29)) {
      goto LABEL_127;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_127;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_motionActivityConfidence != *((_DWORD *)v4 + 28)) {
      goto LABEL_127;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_127;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_provider != *((_DWORD *)v4 + 34)) {
      goto LABEL_127;
    }
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_127;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_floor != *((_DWORD *)v4 + 20)) {
      goto LABEL_127;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_127;
  }
  appBundleIdIndices = self->_appBundleIdIndices;
  if ((unint64_t)appBundleIdIndices | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](appBundleIdIndices, "isEqual:")) {
      goto LABEL_127;
    }
    $68CE81C649BB310E20AD4460D39D0015 has = self->_has;
  }
  int v8 = *((_DWORD *)v4 + 46);
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v8 & 0x40000) == 0) {
      goto LABEL_127;
    }
    if (self->_motionVehicleConnectedStateChanged)
    {
      if (!*((unsigned char *)v4 + 183)) {
        goto LABEL_127;
      }
    }
    else if (*((unsigned char *)v4 + 183))
    {
      goto LABEL_127;
    }
  }
  else if ((v8 & 0x40000) != 0)
  {
    goto LABEL_127;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v8 & 0x20000) == 0) {
      goto LABEL_127;
    }
    if (self->_motionVehicleConnected)
    {
      if (!*((unsigned char *)v4 + 182)) {
        goto LABEL_127;
      }
    }
    else if (*((unsigned char *)v4 + 182))
    {
      goto LABEL_127;
    }
  }
  else if ((v8 & 0x20000) != 0)
  {
    goto LABEL_127;
  }
  rawMotionActivity = self->_rawMotionActivity;
  if ((unint64_t)rawMotionActivity | *((void *)v4 + 18)
    && !-[CLPMotionActivity isEqual:](rawMotionActivity, "isEqual:"))
  {
    goto LABEL_127;
  }
  motionActivity = self->_motionActivity;
  if ((unint64_t)motionActivity | *((void *)v4 + 13))
  {
    if (!-[CLPMotionActivity isEqual:](motionActivity, "isEqual:")) {
      goto LABEL_127;
    }
  }
  dominantMotionActivity = self->_dominantMotionActivity;
  if ((unint64_t)dominantMotionActivity | *((void *)v4 + 9))
  {
    if (!-[CLPMotionActivity isEqual:](dominantMotionActivity, "isEqual:")) {
      goto LABEL_127;
    }
  }
  $68CE81C649BB310E20AD4460D39D0015 v12 = self->_has;
  int v13 = *((_DWORD *)v4 + 46);
  if ((*(unsigned char *)&v12 & 8) != 0)
  {
    if ((v13 & 8) == 0 || self->_courseAccuracy != *((float *)v4 + 16)) {
      goto LABEL_127;
    }
  }
  else if ((v13 & 8) != 0)
  {
    goto LABEL_127;
  }
  if ((*(_WORD *)&v12 & 0x2000) != 0)
  {
    if ((v13 & 0x2000) == 0 || self->_speedAccuracy != *((float *)v4 + 41)) {
      goto LABEL_127;
    }
  }
  else if ((v13 & 0x2000) != 0)
  {
    goto LABEL_127;
  }
  if ((*(_WORD *)&v12 & 0x100) != 0)
  {
    if ((v13 & 0x100) == 0 || self->_modeIndicator != *((_DWORD *)v4 + 25)) {
      goto LABEL_127;
    }
  }
  else if ((v13 & 0x100) != 0)
  {
    goto LABEL_127;
  }
  if ((*(unsigned char *)&v12 & 0x20) != 0)
  {
    if ((v13 & 0x20) == 0 || self->_horzUncSemiMaj != *((float *)v4 + 22)) {
      goto LABEL_127;
    }
  }
  else if ((v13 & 0x20) != 0)
  {
    goto LABEL_127;
  }
  if ((*(unsigned char *)&v12 & 0x80) != 0)
  {
    if ((v13 & 0x80) == 0 || self->_horzUncSemiMin != *((float *)v4 + 24)) {
      goto LABEL_127;
    }
  }
  else if ((v13 & 0x80) != 0)
  {
    goto LABEL_127;
  }
  if ((*(unsigned char *)&v12 & 0x40) != 0)
  {
    if ((v13 & 0x40) == 0 || self->_horzUncSemiMajAz != *((float *)v4 + 23)) {
      goto LABEL_127;
    }
  }
  else if ((v13 & 0x40) != 0)
  {
    goto LABEL_127;
  }
  satReport = self->_satReport;
  if ((unint64_t)satReport | *((void *)v4 + 19))
  {
    if (!-[CLPSatelliteReport isEqual:](satReport, "isEqual:")) {
      goto LABEL_127;
    }
    $68CE81C649BB310E20AD4460D39D0015 v12 = self->_has;
  }
  int v15 = *((_DWORD *)v4 + 46);
  if ((*(_WORD *)&v12 & 0x8000) != 0)
  {
    if ((v15 & 0x8000) == 0) {
      goto LABEL_127;
    }
    if (self->_isFromLocationController)
    {
      if (!*((unsigned char *)v4 + 180)) {
        goto LABEL_127;
      }
    }
    else if (*((unsigned char *)v4 + 180))
    {
      goto LABEL_127;
    }
  }
  else if ((v15 & 0x8000) != 0)
  {
    goto LABEL_127;
  }
  pipelineDiagnosticReport = self->_pipelineDiagnosticReport;
  if ((unint64_t)pipelineDiagnosticReport | *((void *)v4 + 15)
    && !-[CLPPipelineDiagnosticReport isEqual:](pipelineDiagnosticReport, "isEqual:"))
  {
    goto LABEL_127;
  }
  baroCalibrationIndication = self->_baroCalibrationIndication;
  if ((unint64_t)baroCalibrationIndication | *((void *)v4 + 6))
  {
    if (!-[CLPBaroCalibrationIndication isEqual:](baroCalibrationIndication, "isEqual:")) {
      goto LABEL_127;
    }
  }
  processingMetadata = self->_processingMetadata;
  if ((unint64_t)processingMetadata | *((void *)v4 + 16))
  {
    if (!-[CLPLocationProcessingMetadata isEqual:](processingMetadata, "isEqual:")) {
      goto LABEL_127;
    }
  }
  int v19 = *((_DWORD *)v4 + 46);
  if ((*((unsigned char *)&self->_has + 2) & 1) == 0)
  {
    if ((v19 & 0x10000) == 0) {
      goto LABEL_133;
    }
LABEL_127:
    char v20 = 0;
    goto LABEL_128;
  }
  if ((v19 & 0x10000) == 0) {
    goto LABEL_127;
  }
  if (!self->_isProactiveLocation)
  {
    if (!*((unsigned char *)v4 + 181)) {
      goto LABEL_133;
    }
    goto LABEL_127;
  }
  if (!*((unsigned char *)v4 + 181)) {
    goto LABEL_127;
  }
LABEL_133:
  vehicleType = self->_vehicleType;
  if ((unint64_t)vehicleType | *((void *)v4 + 21)) {
    char v20 = -[CLPVehicleType isEqual:](vehicleType, "isEqual:");
  }
  else {
    char v20 = 1;
  }
LABEL_128:

  return v20;
}

- (unint64_t)hash
{
  double latitude = self->_latitude;
  double v4 = -latitude;
  if (latitude >= 0.0) {
    double v4 = self->_latitude;
  }
  long double v5 = floor(v4 + 0.5);
  double v6 = (v4 - v5) * 1.84467441e19;
  double v7 = fmod(v5, 1.84467441e19);
  unint64_t v8 = 2654435761u * (unint64_t)v7;
  unint64_t v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0) {
    unint64_t v9 = 2654435761u * (unint64_t)v7;
  }
  unint64_t v10 = v8 - (unint64_t)fabs(v6);
  if (v6 >= 0.0) {
    unint64_t v10 = v9;
  }
  unint64_t v116 = v10;
  double longitude = self->_longitude;
  double v12 = -longitude;
  if (longitude >= 0.0) {
    double v12 = self->_longitude;
  }
  long double v13 = floor(v12 + 0.5);
  double v14 = (v12 - v13) * 1.84467441e19;
  unint64_t v15 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
  unint64_t v16 = v15 + (unint64_t)v14;
  double v17 = fabs(v14);
  if (v14 <= 0.0) {
    unint64_t v16 = v15;
  }
  unint64_t v18 = v15 - (unint64_t)v17;
  if (v14 >= 0.0) {
    unint64_t v18 = v16;
  }
  unint64_t v115 = v18;
  float horizontalAccuracy = self->_horizontalAccuracy;
  float v20 = -horizontalAccuracy;
  if (horizontalAccuracy >= 0.0) {
    float v20 = self->_horizontalAccuracy;
  }
  float v21 = floorf(v20 + 0.5);
  float v22 = (float)(v20 - v21) * 1.8447e19;
  float v23 = fmodf(v21, 1.8447e19);
  unint64_t v24 = 2654435761u * (unint64_t)v23;
  unint64_t v25 = v24 + (unint64_t)v22;
  if (v22 <= 0.0) {
    unint64_t v25 = 2654435761u * (unint64_t)v23;
  }
  unint64_t v26 = v24 - (unint64_t)fabsf(v22);
  if (v22 >= 0.0) {
    unint64_t v26 = v25;
  }
  unint64_t v114 = v26;
  $68CE81C649BB310E20AD4460D39D0015 has = self->_has;
  if (*(unsigned char *)&has)
  {
    float altitude = self->_altitude;
    float v30 = -altitude;
    if (altitude >= 0.0) {
      float v30 = self->_altitude;
    }
    float v31 = floorf(v30 + 0.5);
    float v32 = (float)(v30 - v31) * 1.8447e19;
    unint64_t v28 = 2654435761u * (unint64_t)fmodf(v31, 1.8447e19);
    if (v32 >= 0.0)
    {
      if (v32 > 0.0) {
        v28 += (unint64_t)v32;
      }
    }
    else
    {
      v28 -= (unint64_t)fabsf(v32);
    }
  }
  else
  {
    unint64_t v28 = 0;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    float verticalAccuracy = self->_verticalAccuracy;
    float v35 = -verticalAccuracy;
    if (verticalAccuracy >= 0.0) {
      float v35 = self->_verticalAccuracy;
    }
    float v36 = floorf(v35 + 0.5);
    float v37 = (float)(v35 - v36) * 1.8447e19;
    unint64_t v33 = 2654435761u * (unint64_t)fmodf(v36, 1.8447e19);
    if (v37 >= 0.0)
    {
      if (v37 > 0.0) {
        v33 += (unint64_t)v37;
      }
    }
    else
    {
      v33 -= (unint64_t)fabsf(v37);
    }
  }
  else
  {
    unint64_t v33 = 0;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    float speed = self->_speed;
    float v40 = -speed;
    if (speed >= 0.0) {
      float v40 = self->_speed;
    }
    float v41 = floorf(v40 + 0.5);
    float v42 = (float)(v40 - v41) * 1.8447e19;
    unint64_t v38 = 2654435761u * (unint64_t)fmodf(v41, 1.8447e19);
    if (v42 >= 0.0)
    {
      if (v42 > 0.0) {
        v38 += (unint64_t)v42;
      }
    }
    else
    {
      v38 -= (unint64_t)fabsf(v42);
    }
  }
  else
  {
    unint64_t v38 = 0;
  }
  unint64_t v113 = v38;
  if ((*(unsigned char *)&has & 4) != 0)
  {
    float course = self->_course;
    float v44 = -course;
    if (course >= 0.0) {
      float v44 = self->_course;
    }
    float v45 = floorf(v44 + 0.5);
    float v46 = (float)(v44 - v45) * 1.8447e19;
    float v47 = fmodf(v45, 1.8447e19);
    unint64_t v48 = 2654435761u * (unint64_t)v47;
    unint64_t v49 = v48 + (unint64_t)v46;
    if (v46 <= 0.0) {
      unint64_t v49 = 2654435761u * (unint64_t)v47;
    }
    unint64_t v50 = v48 - (unint64_t)fabsf(v46);
    if (v46 >= 0.0) {
      unint64_t v50 = v49;
    }
    unint64_t v112 = v50;
  }
  else
  {
    unint64_t v112 = 0;
  }
  double timestamp = self->_timestamp;
  double v52 = -timestamp;
  if (timestamp >= 0.0) {
    double v52 = self->_timestamp;
  }
  long double v53 = floor(v52 + 0.5);
  double v54 = (v52 - v53) * 1.84467441e19;
  double v55 = fmod(v53, 1.84467441e19);
  unint64_t v56 = 2654435761u * (unint64_t)v55;
  unint64_t v57 = v56 + (unint64_t)v54;
  if (v54 <= 0.0) {
    unint64_t v57 = 2654435761u * (unint64_t)v55;
  }
  unint64_t v58 = v56 - (unint64_t)fabs(v54);
  if (v54 >= 0.0) {
    unint64_t v58 = v57;
  }
  unint64_t v111 = v58;
  if ((*(unsigned char *)&has & 2) != 0)
  {
    uint64_t v110 = 2654435761 * self->_context;
    if ((*(_WORD *)&has & 0x400) != 0)
    {
LABEL_60:
      uint64_t v109 = 2654435761 * self->_motionActivityType;
      if ((*(_WORD *)&has & 0x200) != 0) {
        goto LABEL_61;
      }
      goto LABEL_66;
    }
  }
  else
  {
    uint64_t v110 = 0;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_60;
    }
  }
  uint64_t v109 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_61:
    uint64_t v108 = 2654435761 * self->_motionActivityConfidence;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_62;
    }
LABEL_67:
    uint64_t v107 = 0;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_63;
    }
    goto LABEL_68;
  }
LABEL_66:
  uint64_t v108 = 0;
  if ((*(_WORD *)&has & 0x800) == 0) {
    goto LABEL_67;
  }
LABEL_62:
  uint64_t v107 = 2654435761 * self->_provider;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_63:
    uint64_t v106 = 2654435761 * self->_floor;
    goto LABEL_69;
  }
LABEL_68:
  uint64_t v106 = 0;
LABEL_69:
  uint64_t v105 = [(NSMutableArray *)self->_appBundleIdIndices hash];
  $68CE81C649BB310E20AD4460D39D0015 v59 = self->_has;
  if ((*(_DWORD *)&v59 & 0x40000) != 0)
  {
    uint64_t v104 = 2654435761 * self->_motionVehicleConnectedStateChanged;
    if ((*(_DWORD *)&v59 & 0x20000) != 0) {
      goto LABEL_71;
    }
  }
  else
  {
    uint64_t v104 = 0;
    if ((*(_DWORD *)&v59 & 0x20000) != 0)
    {
LABEL_71:
      uint64_t v103 = 2654435761 * self->_motionVehicleConnected;
      goto LABEL_74;
    }
  }
  uint64_t v103 = 0;
LABEL_74:
  unint64_t v102 = [(CLPMotionActivity *)self->_rawMotionActivity hash];
  unint64_t v101 = [(CLPMotionActivity *)self->_motionActivity hash];
  unint64_t v100 = [(CLPMotionActivity *)self->_dominantMotionActivity hash];
  $68CE81C649BB310E20AD4460D39D0015 v60 = self->_has;
  if ((*(unsigned char *)&v60 & 8) != 0)
  {
    float courseAccuracy = self->_courseAccuracy;
    float v63 = -courseAccuracy;
    if (courseAccuracy >= 0.0) {
      float v63 = self->_courseAccuracy;
    }
    float v64 = floorf(v63 + 0.5);
    float v65 = (float)(v63 - v64) * 1.8447e19;
    unint64_t v61 = 2654435761u * (unint64_t)fmodf(v64, 1.8447e19);
    if (v65 >= 0.0)
    {
      if (v65 > 0.0) {
        v61 += (unint64_t)v65;
      }
    }
    else
    {
      v61 -= (unint64_t)fabsf(v65);
    }
  }
  else
  {
    unint64_t v61 = 0;
  }
  if ((*(_WORD *)&v60 & 0x2000) != 0)
  {
    float speedAccuracy = self->_speedAccuracy;
    float v68 = -speedAccuracy;
    if (speedAccuracy >= 0.0) {
      float v68 = self->_speedAccuracy;
    }
    float v69 = floorf(v68 + 0.5);
    float v70 = (float)(v68 - v69) * 1.8447e19;
    unint64_t v66 = 2654435761u * (unint64_t)fmodf(v69, 1.8447e19);
    if (v70 >= 0.0)
    {
      if (v70 > 0.0) {
        v66 += (unint64_t)v70;
      }
    }
    else
    {
      v66 -= (unint64_t)fabsf(v70);
    }
  }
  else
  {
    unint64_t v66 = 0;
  }
  if ((*(_WORD *)&v60 & 0x100) != 0)
  {
    uint64_t v97 = 2654435761 * self->_modeIndicator;
    if ((*(unsigned char *)&v60 & 0x20) != 0) {
      goto LABEL_92;
    }
LABEL_97:
    unint64_t v75 = 0;
    goto LABEL_100;
  }
  uint64_t v97 = 0;
  if ((*(unsigned char *)&v60 & 0x20) == 0) {
    goto LABEL_97;
  }
LABEL_92:
  float horzUncSemiMaj = self->_horzUncSemiMaj;
  float v72 = -horzUncSemiMaj;
  if (horzUncSemiMaj >= 0.0) {
    float v72 = self->_horzUncSemiMaj;
  }
  float v73 = floorf(v72 + 0.5);
  float v74 = (float)(v72 - v73) * 1.8447e19;
  unint64_t v75 = 2654435761u * (unint64_t)fmodf(v73, 1.8447e19);
  if (v74 >= 0.0)
  {
    if (v74 > 0.0) {
      v75 += (unint64_t)v74;
    }
  }
  else
  {
    v75 -= (unint64_t)fabsf(v74);
  }
LABEL_100:
  unint64_t v98 = v66;
  if ((*(unsigned char *)&v60 & 0x80) != 0)
  {
    float horzUncSemiMin = self->_horzUncSemiMin;
    float v78 = -horzUncSemiMin;
    if (horzUncSemiMin >= 0.0) {
      float v78 = self->_horzUncSemiMin;
    }
    float v79 = floorf(v78 + 0.5);
    float v80 = (float)(v78 - v79) * 1.8447e19;
    unint64_t v76 = 2654435761u * (unint64_t)fmodf(v79, 1.8447e19);
    if (v80 >= 0.0)
    {
      if (v80 > 0.0) {
        v76 += (unint64_t)v80;
      }
    }
    else
    {
      v76 -= (unint64_t)fabsf(v80);
    }
  }
  else
  {
    unint64_t v76 = 0;
  }
  unint64_t v96 = v76;
  unint64_t v99 = v28;
  if ((*(unsigned char *)&v60 & 0x40) != 0)
  {
    float horzUncSemiMajAz = self->_horzUncSemiMajAz;
    float v84 = -horzUncSemiMajAz;
    if (horzUncSemiMajAz >= 0.0) {
      float v84 = self->_horzUncSemiMajAz;
    }
    float v85 = floorf(v84 + 0.5);
    float v86 = (float)(v84 - v85) * 1.8447e19;
    float v87 = fmodf(v85, 1.8447e19);
    unint64_t v88 = 2654435761u * (unint64_t)v87;
    unint64_t v81 = v75;
    if (v86 >= 0.0)
    {
      if (v86 > 0.0) {
        unint64_t v82 = v88 + (unint64_t)v86;
      }
      else {
        unint64_t v82 = 2654435761u * (unint64_t)v87;
      }
    }
    else
    {
      unint64_t v82 = v88 - (unint64_t)fabsf(v86);
    }
  }
  else
  {
    unint64_t v81 = v75;
    unint64_t v82 = 0;
  }
  unint64_t v89 = [(CLPSatelliteReport *)self->_satReport hash];
  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0) {
    uint64_t v90 = 2654435761 * self->_isFromLocationController;
  }
  else {
    uint64_t v90 = 0;
  }
  unint64_t v91 = [(CLPPipelineDiagnosticReport *)self->_pipelineDiagnosticReport hash];
  unint64_t v92 = [(CLPBaroCalibrationIndication *)self->_baroCalibrationIndication hash];
  unint64_t v93 = [(CLPLocationProcessingMetadata *)self->_processingMetadata hash];
  if (*((unsigned char *)&self->_has + 2)) {
    uint64_t v94 = 2654435761 * self->_isProactiveLocation;
  }
  else {
    uint64_t v94 = 0;
  }
  return v115 ^ v116 ^ v114 ^ v99 ^ v33 ^ v113 ^ v112 ^ v111 ^ v110 ^ v109 ^ v108 ^ v107 ^ v106 ^ v105 ^ v104 ^ v103 ^ v102 ^ v101 ^ v100 ^ v61 ^ v98 ^ v97 ^ v81 ^ v96 ^ v82 ^ v89 ^ v90 ^ v91 ^ v92 ^ v93 ^ v94 ^ [(CLPVehicleType *)self->_vehicleType hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleType, 0);
  objc_storeStrong((id *)&self->_satReport, 0);
  objc_storeStrong((id *)&self->_rawMotionActivity, 0);
  objc_storeStrong((id *)&self->_processingMetadata, 0);
  objc_storeStrong((id *)&self->_pipelineDiagnosticReport, 0);
  objc_storeStrong((id *)&self->_motionActivity, 0);
  objc_storeStrong((id *)&self->_dominantMotionActivity, 0);
  objc_storeStrong((id *)&self->_baroCalibrationIndication, 0);

  objc_storeStrong((id *)&self->_appBundleIdIndices, 0);
}

- (void)setVerticalAccuracy:(float)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_float verticalAccuracy = a3;
}

- (void)setAltitude:(float)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_float altitude = a3;
}

- (void)setIsFromLocationController:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_isFromLocationController = a3;
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteFloatField();
  $68CE81C649BB310E20AD4460D39D0015 has = self->_has;
  if (*(unsigned char *)&has)
  {
    PBDataWriterWriteFloatField();
    $68CE81C649BB310E20AD4460D39D0015 has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x1000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_53;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  $68CE81C649BB310E20AD4460D39D0015 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_53:
  PBDataWriterWriteFloatField();
  if ((*(_DWORD *)&self->_has & 4) != 0) {
LABEL_5:
  }
    PBDataWriterWriteFloatField();
LABEL_6:
  PBDataWriterWriteDoubleField();
  $68CE81C649BB310E20AD4460D39D0015 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    $68CE81C649BB310E20AD4460D39D0015 v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x400) == 0)
    {
LABEL_8:
      if ((*(_WORD *)&v6 & 0x200) == 0) {
        goto LABEL_9;
      }
      goto LABEL_57;
    }
  }
  else if ((*(_WORD *)&v6 & 0x400) == 0)
  {
    goto LABEL_8;
  }
  PBDataWriterWriteInt32Field();
  $68CE81C649BB310E20AD4460D39D0015 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x200) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&v6 & 0x800) == 0) {
      goto LABEL_10;
    }
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteInt32Field();
  $68CE81C649BB310E20AD4460D39D0015 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x800) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&v6 & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_58:
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 0x10) != 0) {
LABEL_11:
  }
    PBDataWriterWriteInt32Field();
LABEL_12:
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v7 = self->_appBundleIdIndices;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteStringField();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  $68CE81C649BB310E20AD4460D39D0015 v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x40000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $68CE81C649BB310E20AD4460D39D0015 v12 = self->_has;
  }
  if ((*(_DWORD *)&v12 & 0x20000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_rawMotionActivity) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_motionActivity) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_dominantMotionActivity) {
    PBDataWriterWriteSubmessage();
  }
  $68CE81C649BB310E20AD4460D39D0015 v13 = self->_has;
  if ((*(unsigned char *)&v13 & 8) != 0)
  {
    PBDataWriterWriteFloatField();
    $68CE81C649BB310E20AD4460D39D0015 v13 = self->_has;
    if ((*(_WORD *)&v13 & 0x2000) == 0)
    {
LABEL_31:
      if ((*(_WORD *)&v13 & 0x100) == 0) {
        goto LABEL_32;
      }
      goto LABEL_62;
    }
  }
  else if ((*(_WORD *)&v13 & 0x2000) == 0)
  {
    goto LABEL_31;
  }
  PBDataWriterWriteFloatField();
  $68CE81C649BB310E20AD4460D39D0015 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x100) == 0)
  {
LABEL_32:
    if ((*(unsigned char *)&v13 & 0x20) == 0) {
      goto LABEL_33;
    }
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteInt32Field();
  $68CE81C649BB310E20AD4460D39D0015 v13 = self->_has;
  if ((*(unsigned char *)&v13 & 0x20) == 0)
  {
LABEL_33:
    if ((*(unsigned char *)&v13 & 0x80) == 0) {
      goto LABEL_34;
    }
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteFloatField();
  $68CE81C649BB310E20AD4460D39D0015 v13 = self->_has;
  if ((*(unsigned char *)&v13 & 0x80) == 0)
  {
LABEL_34:
    if ((*(unsigned char *)&v13 & 0x40) == 0) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
LABEL_64:
  PBDataWriterWriteFloatField();
  if ((*(_DWORD *)&self->_has & 0x40) != 0) {
LABEL_35:
  }
    PBDataWriterWriteFloatField();
LABEL_36:
  if (self->_satReport) {
    PBDataWriterWriteSubmessage();
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_pipelineDiagnosticReport) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_baroCalibrationIndication) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_processingMetadata) {
    PBDataWriterWriteSubmessage();
  }
  if (*((unsigned char *)&self->_has + 2)) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_vehicleType) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)setHasAltitude:(BOOL)a3
{
  self->_$68CE81C649BB310E20AD4460D39D0015 has = ($68CE81C649BB310E20AD4460D39D0015)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasAltitude
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setHasVerticalAccuracy:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_$68CE81C649BB310E20AD4460D39D0015 has = ($68CE81C649BB310E20AD4460D39D0015)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasVerticalAccuracy
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setSpeed:(float)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_float speed = a3;
}

- (void)setHasSpeed:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_$68CE81C649BB310E20AD4460D39D0015 has = ($68CE81C649BB310E20AD4460D39D0015)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasSpeed
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setCourse:(float)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_float course = a3;
}

- (void)setHasCourse:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_$68CE81C649BB310E20AD4460D39D0015 has = ($68CE81C649BB310E20AD4460D39D0015)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasCourse
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setContext:(int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_context = a3;
}

- (void)setHasContext:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_$68CE81C649BB310E20AD4460D39D0015 has = ($68CE81C649BB310E20AD4460D39D0015)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasContext
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setMotionActivityType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_motionActivityType = a3;
}

- (void)setHasMotionActivityType:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_$68CE81C649BB310E20AD4460D39D0015 has = ($68CE81C649BB310E20AD4460D39D0015)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasMotionActivityType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setMotionActivityConfidence:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_motionActivityConfidence = a3;
}

- (void)setHasMotionActivityConfidence:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_$68CE81C649BB310E20AD4460D39D0015 has = ($68CE81C649BB310E20AD4460D39D0015)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasMotionActivityConfidence
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setHasProvider:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_$68CE81C649BB310E20AD4460D39D0015 has = ($68CE81C649BB310E20AD4460D39D0015)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasProvider
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setFloor:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_floor = a3;
}

- (void)setHasFloor:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_$68CE81C649BB310E20AD4460D39D0015 has = ($68CE81C649BB310E20AD4460D39D0015)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasFloor
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)clearAppBundleIdIndices
{
}

- (void)addAppBundleIdIndices:(id)a3
{
  id v4 = a3;
  appBundleIdIndices = self->_appBundleIdIndices;
  id v8 = v4;
  if (!appBundleIdIndices)
  {
    $68CE81C649BB310E20AD4460D39D0015 v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    double v7 = self->_appBundleIdIndices;
    self->_appBundleIdIndices = v6;

    id v4 = v8;
    appBundleIdIndices = self->_appBundleIdIndices;
  }
  [(NSMutableArray *)appBundleIdIndices addObject:v4];
}

- (unint64_t)appBundleIdIndicesCount
{
  return [(NSMutableArray *)self->_appBundleIdIndices count];
}

- (id)appBundleIdIndicesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_appBundleIdIndices objectAtIndex:a3];
}

+ (Class)appBundleIdIndicesType
{
  return (Class)objc_opt_class();
}

- (void)setMotionVehicleConnectedStateChanged:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_motionVehicleConnectedStateChanged = a3;
}

- (void)setHasMotionVehicleConnectedStateChanged:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_$68CE81C649BB310E20AD4460D39D0015 has = ($68CE81C649BB310E20AD4460D39D0015)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasMotionVehicleConnectedStateChanged
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setMotionVehicleConnected:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_motionVehicleConnected = a3;
}

- (void)setHasMotionVehicleConnected:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_$68CE81C649BB310E20AD4460D39D0015 has = ($68CE81C649BB310E20AD4460D39D0015)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasMotionVehicleConnected
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (BOOL)hasRawMotionActivity
{
  return self->_rawMotionActivity != 0;
}

- (BOOL)hasMotionActivity
{
  return self->_motionActivity != 0;
}

- (BOOL)hasDominantMotionActivity
{
  return self->_dominantMotionActivity != 0;
}

- (void)setCourseAccuracy:(float)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_float courseAccuracy = a3;
}

- (void)setHasCourseAccuracy:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_$68CE81C649BB310E20AD4460D39D0015 has = ($68CE81C649BB310E20AD4460D39D0015)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasCourseAccuracy
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setSpeedAccuracy:(float)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_float speedAccuracy = a3;
}

- (void)setHasSpeedAccuracy:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_$68CE81C649BB310E20AD4460D39D0015 has = ($68CE81C649BB310E20AD4460D39D0015)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasSpeedAccuracy
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (int)modeIndicator
{
  if (*((unsigned char *)&self->_has + 1)) {
    return self->_modeIndicator;
  }
  else {
    return 0;
  }
}

- (void)setModeIndicator:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_modeIndicator = a3;
}

- (void)setHasModeIndicator:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_$68CE81C649BB310E20AD4460D39D0015 has = ($68CE81C649BB310E20AD4460D39D0015)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasModeIndicator
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (id)modeIndicatorAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E6C35FA8[a3];
  }

  return v3;
}

- (int)StringAsModeIndicator:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NotRecognized"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NotSpecified"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Autonomous"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Differential"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Estimated"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setHorzUncSemiMaj:(float)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_float horzUncSemiMaj = a3;
}

- (void)setHasHorzUncSemiMaj:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_$68CE81C649BB310E20AD4460D39D0015 has = ($68CE81C649BB310E20AD4460D39D0015)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasHorzUncSemiMaj
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHorzUncSemiMin:(float)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_float horzUncSemiMin = a3;
}

- (void)setHasHorzUncSemiMin:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_$68CE81C649BB310E20AD4460D39D0015 has = ($68CE81C649BB310E20AD4460D39D0015)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasHorzUncSemiMin
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setHorzUncSemiMajAz:(float)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_float horzUncSemiMajAz = a3;
}

- (void)setHasHorzUncSemiMajAz:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_$68CE81C649BB310E20AD4460D39D0015 has = ($68CE81C649BB310E20AD4460D39D0015)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasHorzUncSemiMajAz
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (BOOL)hasSatReport
{
  return self->_satReport != 0;
}

- (void)setHasIsFromLocationController:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_$68CE81C649BB310E20AD4460D39D0015 has = ($68CE81C649BB310E20AD4460D39D0015)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasIsFromLocationController
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (BOOL)hasPipelineDiagnosticReport
{
  return self->_pipelineDiagnosticReport != 0;
}

- (BOOL)hasBaroCalibrationIndication
{
  return self->_baroCalibrationIndication != 0;
}

- (BOOL)hasProcessingMetadata
{
  return self->_processingMetadata != 0;
}

- (void)setIsProactiveLocation:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_isProactiveLocation = a3;
}

- (void)setHasIsProactiveLocation:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_$68CE81C649BB310E20AD4460D39D0015 has = ($68CE81C649BB310E20AD4460D39D0015)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasIsProactiveLocation
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (BOOL)hasVehicleType
{
  return self->_vehicleType != 0;
}

- (id)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPLocation;
  int v4 = [(CLPLocation *)&v8 description];
  long double v5 = [(CLPLocation *)self dictionaryRepresentation];
  $68CE81C649BB310E20AD4460D39D0015 v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  int v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = [NSNumber numberWithDouble:self->_latitude];
  [v3 setObject:v4 forKey:@"latitude"];

  long double v5 = [NSNumber numberWithDouble:self->_longitude];
  [v3 setObject:v5 forKey:@"longitude"];

  *(float *)&double v6 = self->_horizontalAccuracy;
  double v7 = [NSNumber numberWithFloat:v6];
  [v3 setObject:v7 forKey:@"horizontalAccuracy"];

  objc_super v8 = [NSNumber numberWithDouble:self->_timestamp];
  [v3 setObject:v8 forKey:@"timestamp"];

  $68CE81C649BB310E20AD4460D39D0015 has = self->_has;
  if (*(unsigned char *)&has)
  {
    *(float *)&double v9 = self->_altitude;
    float v37 = [NSNumber numberWithFloat:v9];
    [v3 setObject:v37 forKey:@"altitude"];

    $68CE81C649BB310E20AD4460D39D0015 has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x1000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_49;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  *(float *)&double v9 = self->_verticalAccuracy;
  unint64_t v38 = [NSNumber numberWithFloat:v9];
  [v3 setObject:v38 forKey:@"verticalAccuracy"];

  $68CE81C649BB310E20AD4460D39D0015 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_50;
  }
LABEL_49:
  *(float *)&double v9 = self->_speed;
  v39 = [NSNumber numberWithFloat:v9];
  [v3 setObject:v39 forKey:@"speed"];

  $68CE81C649BB310E20AD4460D39D0015 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_51;
  }
LABEL_50:
  *(float *)&double v9 = self->_course;
  float v40 = [NSNumber numberWithFloat:v9];
  [v3 setObject:v40 forKey:@"course"];

  $68CE81C649BB310E20AD4460D39D0015 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_52;
  }
LABEL_51:
  float v41 = [NSNumber numberWithInt:self->_context];
  [v3 setObject:v41 forKey:@"context"];

  $68CE81C649BB310E20AD4460D39D0015 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_53;
  }
LABEL_52:
  float v42 = [NSNumber numberWithInt:self->_motionActivityType];
  [v3 setObject:v42 forKey:@"motionActivityType"];

  $68CE81C649BB310E20AD4460D39D0015 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_54;
  }
LABEL_53:
  v43 = [NSNumber numberWithInt:self->_motionActivityConfidence];
  [v3 setObject:v43 forKey:@"motionActivityConfidence"];

  $68CE81C649BB310E20AD4460D39D0015 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_54:
  float v44 = [NSNumber numberWithInt:self->_provider];
  [v3 setObject:v44 forKey:@"provider"];

  if ((*(_DWORD *)&self->_has & 0x10) != 0)
  {
LABEL_10:
    uint64_t v11 = [NSNumber numberWithInt:self->_floor];
    [v3 setObject:v11 forKey:@"floor"];
  }
LABEL_11:
  appBundleIdIndices = self->_appBundleIdIndices;
  if (appBundleIdIndices) {
    [v3 setObject:appBundleIdIndices forKey:@"appBundleIdIndices"];
  }
  $68CE81C649BB310E20AD4460D39D0015 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x40000) != 0)
  {
    long long v14 = [NSNumber numberWithBool:self->_motionVehicleConnectedStateChanged];
    [v3 setObject:v14 forKey:@"motionVehicleConnectedStateChanged"];

    $68CE81C649BB310E20AD4460D39D0015 v13 = self->_has;
  }
  if ((*(_DWORD *)&v13 & 0x20000) != 0)
  {
    long long v15 = [NSNumber numberWithBool:self->_motionVehicleConnected];
    [v3 setObject:v15 forKey:@"motionVehicleConnected"];
  }
  rawMotionActivity = self->_rawMotionActivity;
  if (rawMotionActivity)
  {
    long long v17 = [(CLPMotionActivity *)rawMotionActivity dictionaryRepresentation];
    [v3 setObject:v17 forKey:@"rawMotionActivity"];
  }
  motionActivity = self->_motionActivity;
  if (motionActivity)
  {
    uint64_t v19 = [(CLPMotionActivity *)motionActivity dictionaryRepresentation];
    [v3 setObject:v19 forKey:@"motionActivity"];
  }
  dominantMotionActivity = self->_dominantMotionActivity;
  if (dominantMotionActivity)
  {
    float v21 = [(CLPMotionActivity *)dominantMotionActivity dictionaryRepresentation];
    [v3 setObject:v21 forKey:@"dominantMotionActivity"];
  }
  $68CE81C649BB310E20AD4460D39D0015 v22 = self->_has;
  if ((*(unsigned char *)&v22 & 8) != 0)
  {
    *(float *)&double v9 = self->_courseAccuracy;
    float v45 = [NSNumber numberWithFloat:v9];
    [v3 setObject:v45 forKey:@"courseAccuracy"];

    $68CE81C649BB310E20AD4460D39D0015 v22 = self->_has;
    if ((*(_WORD *)&v22 & 0x2000) == 0)
    {
LABEL_25:
      if ((*(_WORD *)&v22 & 0x100) == 0) {
        goto LABEL_26;
      }
      goto LABEL_58;
    }
  }
  else if ((*(_WORD *)&v22 & 0x2000) == 0)
  {
    goto LABEL_25;
  }
  *(float *)&double v9 = self->_speedAccuracy;
  float v46 = [NSNumber numberWithFloat:v9];
  [v3 setObject:v46 forKey:@"speedAccuracy"];

  $68CE81C649BB310E20AD4460D39D0015 v22 = self->_has;
  if ((*(_WORD *)&v22 & 0x100) == 0)
  {
LABEL_26:
    if ((*(unsigned char *)&v22 & 0x20) == 0) {
      goto LABEL_27;
    }
    goto LABEL_62;
  }
LABEL_58:
  uint64_t modeIndicator = self->_modeIndicator;
  if (modeIndicator >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_modeIndicator);
    unint64_t v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unint64_t v48 = off_1E6C35FA8[modeIndicator];
  }
  [v3 setObject:v48 forKey:@"modeIndicator"];

  $68CE81C649BB310E20AD4460D39D0015 v22 = self->_has;
  if ((*(unsigned char *)&v22 & 0x20) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&v22 & 0x80) == 0) {
      goto LABEL_28;
    }
    goto LABEL_63;
  }
LABEL_62:
  *(float *)&double v9 = self->_horzUncSemiMaj;
  unint64_t v49 = [NSNumber numberWithFloat:v9];
  [v3 setObject:v49 forKey:@"horzUncSemiMaj"];

  $68CE81C649BB310E20AD4460D39D0015 v22 = self->_has;
  if ((*(unsigned char *)&v22 & 0x80) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&v22 & 0x40) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_63:
  *(float *)&double v9 = self->_horzUncSemiMin;
  unint64_t v50 = [NSNumber numberWithFloat:v9];
  [v3 setObject:v50 forKey:@"horzUncSemiMin"];

  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_29:
    *(float *)&double v9 = self->_horzUncSemiMajAz;
    float v23 = [NSNumber numberWithFloat:v9];
    [v3 setObject:v23 forKey:@"horzUncSemiMajAz"];
  }
LABEL_30:
  satReport = self->_satReport;
  if (satReport)
  {
    unint64_t v25 = [(CLPSatelliteReport *)satReport dictionaryRepresentation];
    [v3 setObject:v25 forKey:@"satReport"];
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0)
  {
    unint64_t v26 = [NSNumber numberWithBool:self->_isFromLocationController];
    [v3 setObject:v26 forKey:@"isFromLocationController"];
  }
  pipelineDiagnosticReport = self->_pipelineDiagnosticReport;
  if (pipelineDiagnosticReport)
  {
    unint64_t v28 = [(CLPPipelineDiagnosticReport *)pipelineDiagnosticReport dictionaryRepresentation];
    [v3 setObject:v28 forKey:@"pipelineDiagnosticReport"];
  }
  baroCalibrationIndication = self->_baroCalibrationIndication;
  if (baroCalibrationIndication)
  {
    float v30 = [(CLPBaroCalibrationIndication *)baroCalibrationIndication dictionaryRepresentation];
    [v3 setObject:v30 forKey:@"baroCalibrationIndication"];
  }
  processingMetadata = self->_processingMetadata;
  if (processingMetadata)
  {
    float v32 = [(CLPLocationProcessingMetadata *)processingMetadata dictionaryRepresentation];
    [v3 setObject:v32 forKey:@"processingMetadata"];
  }
  if (*((unsigned char *)&self->_has + 2))
  {
    unint64_t v33 = [NSNumber numberWithBool:self->_isProactiveLocation];
    [v3 setObject:v33 forKey:@"isProactiveLocation"];
  }
  vehicleType = self->_vehicleType;
  if (vehicleType)
  {
    float v35 = [(CLPVehicleType *)vehicleType dictionaryRepresentation];
    [v3 setObject:v35 forKey:@"vehicleType"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPLocationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  v4[1] = *(void *)&self->_latitude;
  v4[2] = *(void *)&self->_longitude;
  *((_DWORD *)v4 + 21) = LODWORD(self->_horizontalAccuracy);
  $68CE81C649BB310E20AD4460D39D0015 has = self->_has;
  if (*(unsigned char *)&has)
  {
    *((_DWORD *)v4 + 8) = LODWORD(self->_altitude);
    *((_DWORD *)v4 + 46) |= 1u;
    $68CE81C649BB310E20AD4460D39D0015 has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x1000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_52;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 44) = LODWORD(self->_verticalAccuracy);
  *((_DWORD *)v4 + 46) |= 0x4000u;
  $68CE81C649BB310E20AD4460D39D0015 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_52:
  *((_DWORD *)v4 + 40) = LODWORD(self->_speed);
  *((_DWORD *)v4 + 46) |= 0x1000u;
  if ((*(_DWORD *)&self->_has & 4) != 0)
  {
LABEL_5:
    *((_DWORD *)v4 + 15) = LODWORD(self->_course);
    *((_DWORD *)v4 + 46) |= 4u;
  }
LABEL_6:
  v4[3] = *(void *)&self->_timestamp;
  $68CE81C649BB310E20AD4460D39D0015 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 2) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_context;
    *((_DWORD *)v4 + 46) |= 2u;
    $68CE81C649BB310E20AD4460D39D0015 v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x400) == 0)
    {
LABEL_8:
      if ((*(_WORD *)&v6 & 0x200) == 0) {
        goto LABEL_9;
      }
      goto LABEL_56;
    }
  }
  else if ((*(_WORD *)&v6 & 0x400) == 0)
  {
    goto LABEL_8;
  }
  *((_DWORD *)v4 + 29) = self->_motionActivityType;
  *((_DWORD *)v4 + 46) |= 0x400u;
  $68CE81C649BB310E20AD4460D39D0015 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x200) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&v6 & 0x800) == 0) {
      goto LABEL_10;
    }
LABEL_57:
    *((_DWORD *)v4 + 34) = self->_provider;
    *((_DWORD *)v4 + 46) |= 0x800u;
    if ((*(_DWORD *)&self->_has & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_56:
  *((_DWORD *)v4 + 28) = self->_motionActivityConfidence;
  *((_DWORD *)v4 + 46) |= 0x200u;
  $68CE81C649BB310E20AD4460D39D0015 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x800) != 0) {
    goto LABEL_57;
  }
LABEL_10:
  if ((*(unsigned char *)&v6 & 0x10) != 0)
  {
LABEL_11:
    *((_DWORD *)v4 + 20) = self->_floor;
    *((_DWORD *)v4 + 46) |= 0x10u;
  }
LABEL_12:
  id v14 = v4;
  if ([(CLPLocation *)self appBundleIdIndicesCount])
  {
    [v14 clearAppBundleIdIndices];
    unint64_t v7 = [(CLPLocation *)self appBundleIdIndicesCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t i = 0; i != v8; ++i)
      {
        uint64_t v10 = [(CLPLocation *)self appBundleIdIndicesAtIndex:i];
        [v14 addAppBundleIdIndices:v10];
      }
    }
  }
  $68CE81C649BB310E20AD4460D39D0015 v11 = self->_has;
  $68CE81C649BB310E20AD4460D39D0015 v12 = v14;
  if ((*(_DWORD *)&v11 & 0x40000) != 0)
  {
    *((unsigned char *)v14 + 183) = self->_motionVehicleConnectedStateChanged;
    *((_DWORD *)v14 + 46) |= 0x40000u;
    $68CE81C649BB310E20AD4460D39D0015 v11 = self->_has;
  }
  if ((*(_DWORD *)&v11 & 0x20000) != 0)
  {
    *((unsigned char *)v14 + 182) = self->_motionVehicleConnected;
    *((_DWORD *)v14 + 46) |= 0x20000u;
  }
  if (self->_rawMotionActivity)
  {
    objc_msgSend(v14, "setRawMotionActivity:");
    $68CE81C649BB310E20AD4460D39D0015 v12 = v14;
  }
  if (self->_motionActivity)
  {
    objc_msgSend(v14, "setMotionActivity:");
    $68CE81C649BB310E20AD4460D39D0015 v12 = v14;
  }
  if (self->_dominantMotionActivity)
  {
    objc_msgSend(v14, "setDominantMotionActivity:");
    $68CE81C649BB310E20AD4460D39D0015 v12 = v14;
  }
  $68CE81C649BB310E20AD4460D39D0015 v13 = self->_has;
  if ((*(unsigned char *)&v13 & 8) != 0)
  {
    v12[16] = LODWORD(self->_courseAccuracy);
    v12[46] |= 8u;
    $68CE81C649BB310E20AD4460D39D0015 v13 = self->_has;
    if ((*(_WORD *)&v13 & 0x2000) == 0)
    {
LABEL_28:
      if ((*(_WORD *)&v13 & 0x100) == 0) {
        goto LABEL_29;
      }
      goto LABEL_61;
    }
  }
  else if ((*(_WORD *)&v13 & 0x2000) == 0)
  {
    goto LABEL_28;
  }
  v12[41] = LODWORD(self->_speedAccuracy);
  v12[46] |= 0x2000u;
  $68CE81C649BB310E20AD4460D39D0015 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x100) == 0)
  {
LABEL_29:
    if ((*(unsigned char *)&v13 & 0x20) == 0) {
      goto LABEL_30;
    }
    goto LABEL_62;
  }
LABEL_61:
  v12[25] = self->_modeIndicator;
  v12[46] |= 0x100u;
  $68CE81C649BB310E20AD4460D39D0015 v13 = self->_has;
  if ((*(unsigned char *)&v13 & 0x20) == 0)
  {
LABEL_30:
    if ((*(unsigned char *)&v13 & 0x80) == 0) {
      goto LABEL_31;
    }
    goto LABEL_63;
  }
LABEL_62:
  v12[22] = LODWORD(self->_horzUncSemiMaj);
  v12[46] |= 0x20u;
  $68CE81C649BB310E20AD4460D39D0015 v13 = self->_has;
  if ((*(unsigned char *)&v13 & 0x80) == 0)
  {
LABEL_31:
    if ((*(unsigned char *)&v13 & 0x40) == 0) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
LABEL_63:
  v12[24] = LODWORD(self->_horzUncSemiMin);
  v12[46] |= 0x80u;
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_32:
    v12[23] = LODWORD(self->_horzUncSemiMajAz);
    v12[46] |= 0x40u;
  }
LABEL_33:
  if (self->_satReport)
  {
    objc_msgSend(v14, "setSatReport:");
    $68CE81C649BB310E20AD4460D39D0015 v12 = v14;
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0)
  {
    *((unsigned char *)v12 + 180) = self->_isFromLocationController;
    v12[46] |= 0x8000u;
  }
  if (self->_pipelineDiagnosticReport)
  {
    objc_msgSend(v14, "setPipelineDiagnosticReport:");
    $68CE81C649BB310E20AD4460D39D0015 v12 = v14;
  }
  if (self->_baroCalibrationIndication)
  {
    objc_msgSend(v14, "setBaroCalibrationIndication:");
    $68CE81C649BB310E20AD4460D39D0015 v12 = v14;
  }
  if (self->_processingMetadata)
  {
    objc_msgSend(v14, "setProcessingMetadata:");
    $68CE81C649BB310E20AD4460D39D0015 v12 = v14;
  }
  if (*((unsigned char *)&self->_has + 2))
  {
    *((unsigned char *)v12 + 181) = self->_isProactiveLocation;
    v12[46] |= 0x10000u;
  }
  if (self->_vehicleType)
  {
    objc_msgSend(v14, "setVehicleType:");
    $68CE81C649BB310E20AD4460D39D0015 v12 = v14;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  *(double *)(v5 + 8) = self->_latitude;
  *(double *)(v5 + 16) = self->_longitude;
  *(float *)(v5 + 84) = self->_horizontalAccuracy;
  $68CE81C649BB310E20AD4460D39D0015 has = self->_has;
  if (*(unsigned char *)&has)
  {
    *(float *)(v5 + 32) = self->_altitude;
    *(_DWORD *)(v5 + 184) |= 1u;
    $68CE81C649BB310E20AD4460D39D0015 has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x1000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_37;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  *(float *)(v5 + 176) = self->_verticalAccuracy;
  *(_DWORD *)(v5 + 184) |= 0x4000u;
  $68CE81C649BB310E20AD4460D39D0015 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_37:
  *(float *)(v5 + 160) = self->_speed;
  *(_DWORD *)(v5 + 184) |= 0x1000u;
  if ((*(_DWORD *)&self->_has & 4) != 0)
  {
LABEL_5:
    *(float *)(v5 + 60) = self->_course;
    *(_DWORD *)(v5 + 184) |= 4u;
  }
LABEL_6:
  *(double *)(v5 + 24) = self->_timestamp;
  $68CE81C649BB310E20AD4460D39D0015 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_context;
    *(_DWORD *)(v5 + 184) |= 2u;
    $68CE81C649BB310E20AD4460D39D0015 v8 = self->_has;
    if ((*(_WORD *)&v8 & 0x400) == 0)
    {
LABEL_8:
      if ((*(_WORD *)&v8 & 0x200) == 0) {
        goto LABEL_9;
      }
      goto LABEL_41;
    }
  }
  else if ((*(_WORD *)&v8 & 0x400) == 0)
  {
    goto LABEL_8;
  }
  *(_DWORD *)(v5 + 116) = self->_motionActivityType;
  *(_DWORD *)(v5 + 184) |= 0x400u;
  $68CE81C649BB310E20AD4460D39D0015 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x200) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&v8 & 0x800) == 0) {
      goto LABEL_10;
    }
    goto LABEL_42;
  }
LABEL_41:
  *(_DWORD *)(v5 + 112) = self->_motionActivityConfidence;
  *(_DWORD *)(v5 + 184) |= 0x200u;
  $68CE81C649BB310E20AD4460D39D0015 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x800) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&v8 & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_42:
  *(_DWORD *)(v5 + 136) = self->_provider;
  *(_DWORD *)(v5 + 184) |= 0x800u;
  if ((*(_DWORD *)&self->_has & 0x10) != 0)
  {
LABEL_11:
    *(_DWORD *)(v5 + 80) = self->_floor;
    *(_DWORD *)(v5 + 184) |= 0x10u;
  }
LABEL_12:
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  double v9 = self->_appBundleIdIndices;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v35;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * v13), "copyWithZone:", a3, (void)v34);
        [(id)v6 addAppBundleIdIndices:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v11);
  }

  $68CE81C649BB310E20AD4460D39D0015 v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x40000) != 0)
  {
    *(unsigned char *)(v6 + 183) = self->_motionVehicleConnectedStateChanged;
    *(_DWORD *)(v6 + 184) |= 0x40000u;
    $68CE81C649BB310E20AD4460D39D0015 v15 = self->_has;
  }
  if ((*(_DWORD *)&v15 & 0x20000) != 0)
  {
    *(unsigned char *)(v6 + 182) = self->_motionVehicleConnected;
    *(_DWORD *)(v6 + 184) |= 0x20000u;
  }
  id v16 = -[CLPMotionActivity copyWithZone:](self->_rawMotionActivity, "copyWithZone:", a3, (void)v34);
  long long v17 = *(void **)(v6 + 144);
  *(void *)(v6 + 144) = v16;

  id v18 = [(CLPMotionActivity *)self->_motionActivity copyWithZone:a3];
  uint64_t v19 = *(void **)(v6 + 104);
  *(void *)(v6 + 104) = v18;

  id v20 = [(CLPMotionActivity *)self->_dominantMotionActivity copyWithZone:a3];
  float v21 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v20;

  $68CE81C649BB310E20AD4460D39D0015 v22 = self->_has;
  if ((*(unsigned char *)&v22 & 8) != 0)
  {
    *(float *)(v6 + 64) = self->_courseAccuracy;
    *(_DWORD *)(v6 + 184) |= 8u;
    $68CE81C649BB310E20AD4460D39D0015 v22 = self->_has;
    if ((*(_WORD *)&v22 & 0x2000) == 0)
    {
LABEL_25:
      if ((*(_WORD *)&v22 & 0x100) == 0) {
        goto LABEL_26;
      }
      goto LABEL_46;
    }
  }
  else if ((*(_WORD *)&v22 & 0x2000) == 0)
  {
    goto LABEL_25;
  }
  *(float *)(v6 + 164) = self->_speedAccuracy;
  *(_DWORD *)(v6 + 184) |= 0x2000u;
  $68CE81C649BB310E20AD4460D39D0015 v22 = self->_has;
  if ((*(_WORD *)&v22 & 0x100) == 0)
  {
LABEL_26:
    if ((*(unsigned char *)&v22 & 0x20) == 0) {
      goto LABEL_27;
    }
    goto LABEL_47;
  }
LABEL_46:
  *(_DWORD *)(v6 + 100) = self->_modeIndicator;
  *(_DWORD *)(v6 + 184) |= 0x100u;
  $68CE81C649BB310E20AD4460D39D0015 v22 = self->_has;
  if ((*(unsigned char *)&v22 & 0x20) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&v22 & 0x80) == 0) {
      goto LABEL_28;
    }
    goto LABEL_48;
  }
LABEL_47:
  *(float *)(v6 + 88) = self->_horzUncSemiMaj;
  *(_DWORD *)(v6 + 184) |= 0x20u;
  $68CE81C649BB310E20AD4460D39D0015 v22 = self->_has;
  if ((*(unsigned char *)&v22 & 0x80) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&v22 & 0x40) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_48:
  *(float *)(v6 + 96) = self->_horzUncSemiMin;
  *(_DWORD *)(v6 + 184) |= 0x80u;
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_29:
    *(float *)(v6 + 92) = self->_horzUncSemiMajAz;
    *(_DWORD *)(v6 + 184) |= 0x40u;
  }
LABEL_30:
  id v23 = [(CLPSatelliteReport *)self->_satReport copyWithZone:a3];
  unint64_t v24 = *(void **)(v6 + 152);
  *(void *)(v6 + 152) = v23;

  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0)
  {
    *(unsigned char *)(v6 + 180) = self->_isFromLocationController;
    *(_DWORD *)(v6 + 184) |= 0x8000u;
  }
  id v25 = [(CLPPipelineDiagnosticReport *)self->_pipelineDiagnosticReport copyWithZone:a3];
  unint64_t v26 = *(void **)(v6 + 120);
  *(void *)(v6 + 120) = v25;

  id v27 = [(CLPBaroCalibrationIndication *)self->_baroCalibrationIndication copyWithZone:a3];
  unint64_t v28 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v27;

  id v29 = [(CLPLocationProcessingMetadata *)self->_processingMetadata copyWithZone:a3];
  float v30 = *(void **)(v6 + 128);
  *(void *)(v6 + 128) = v29;

  if (*((unsigned char *)&self->_has + 2))
  {
    *(unsigned char *)(v6 + 181) = self->_isProactiveLocation;
    *(_DWORD *)(v6 + 184) |= 0x10000u;
  }
  id v31 = [(CLPVehicleType *)self->_vehicleType copyWithZone:a3];
  float v32 = *(void **)(v6 + 168);
  *(void *)(v6 + 168) = v31;

  return (id)v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  self->_double latitude = *((double *)v4 + 1);
  self->_double longitude = *((double *)v4 + 2);
  self->_float horizontalAccuracy = *((float *)v4 + 21);
  int v6 = *((_DWORD *)v4 + 46);
  if (v6)
  {
    self->_float altitude = *((float *)v4 + 8);
    *(_DWORD *)&self->_has |= 1u;
    int v6 = *((_DWORD *)v4 + 46);
    if ((v6 & 0x4000) == 0)
    {
LABEL_3:
      if ((v6 & 0x1000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_28;
    }
  }
  else if ((v6 & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  self->_float verticalAccuracy = *((float *)v4 + 44);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v6 = *((_DWORD *)v4 + 46);
  if ((v6 & 0x1000) == 0)
  {
LABEL_4:
    if ((v6 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_28:
  self->_float speed = *((float *)v4 + 40);
  *(_DWORD *)&self->_has |= 0x1000u;
  if ((*((_DWORD *)v4 + 46) & 4) != 0)
  {
LABEL_5:
    self->_float course = *((float *)v4 + 15);
    *(_DWORD *)&self->_has |= 4u;
  }
LABEL_6:
  self->_double timestamp = *((double *)v4 + 3);
  int v7 = *((_DWORD *)v4 + 46);
  if ((v7 & 2) != 0)
  {
    self->_context = *((_DWORD *)v4 + 14);
    *(_DWORD *)&self->_has |= 2u;
    int v7 = *((_DWORD *)v4 + 46);
    if ((v7 & 0x400) == 0)
    {
LABEL_8:
      if ((v7 & 0x200) == 0) {
        goto LABEL_9;
      }
      goto LABEL_32;
    }
  }
  else if ((v7 & 0x400) == 0)
  {
    goto LABEL_8;
  }
  self->_motionActivityType = *((_DWORD *)v4 + 29);
  *(_DWORD *)&self->_has |= 0x400u;
  int v7 = *((_DWORD *)v4 + 46);
  if ((v7 & 0x200) == 0)
  {
LABEL_9:
    if ((v7 & 0x800) == 0) {
      goto LABEL_10;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_motionActivityConfidence = *((_DWORD *)v4 + 28);
  *(_DWORD *)&self->_has |= 0x200u;
  int v7 = *((_DWORD *)v4 + 46);
  if ((v7 & 0x800) == 0)
  {
LABEL_10:
    if ((v7 & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_33:
  self->_provider = *((_DWORD *)v4 + 34);
  *(_DWORD *)&self->_has |= 0x800u;
  if ((*((_DWORD *)v4 + 46) & 0x10) != 0)
  {
LABEL_11:
    self->_floor = *((_DWORD *)v4 + 20);
    *(_DWORD *)&self->_has |= 0x10u;
  }
LABEL_12:
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v8 = *((id *)v4 + 5);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v8);
        }
        -[CLPLocation addAppBundleIdIndices:](self, "addAppBundleIdIndices:", *(void *)(*((void *)&v31 + 1) + 8 * i), (void)v31);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v10);
  }

  int v13 = *((_DWORD *)v5 + 46);
  if ((v13 & 0x40000) != 0)
  {
    self->_motionVehicleConnectedStateChanged = *((unsigned char *)v5 + 183);
    *(_DWORD *)&self->_has |= 0x40000u;
    int v13 = *((_DWORD *)v5 + 46);
  }
  if ((v13 & 0x20000) != 0)
  {
    self->_motionVehicleConnected = *((unsigned char *)v5 + 182);
    *(_DWORD *)&self->_has |= 0x20000u;
  }
  rawMotionActivity = self->_rawMotionActivity;
  uint64_t v15 = *((void *)v5 + 18);
  if (rawMotionActivity)
  {
    if (v15) {
      -[CLPMotionActivity mergeFrom:](rawMotionActivity, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[CLPLocation setRawMotionActivity:](self, "setRawMotionActivity:");
  }
  motionActivity = self->_motionActivity;
  uint64_t v17 = *((void *)v5 + 13);
  if (motionActivity)
  {
    if (v17) {
      -[CLPMotionActivity mergeFrom:](motionActivity, "mergeFrom:");
    }
  }
  else if (v17)
  {
    -[CLPLocation setMotionActivity:](self, "setMotionActivity:");
  }
  dominantMotionActivity = self->_dominantMotionActivity;
  uint64_t v19 = *((void *)v5 + 9);
  if (dominantMotionActivity)
  {
    if (v19) {
      -[CLPMotionActivity mergeFrom:](dominantMotionActivity, "mergeFrom:");
    }
  }
  else if (v19)
  {
    -[CLPLocation setDominantMotionActivity:](self, "setDominantMotionActivity:");
  }
  int v20 = *((_DWORD *)v5 + 46);
  if ((v20 & 8) != 0)
  {
    self->_float courseAccuracy = *((float *)v5 + 16);
    *(_DWORD *)&self->_has |= 8u;
    int v20 = *((_DWORD *)v5 + 46);
    if ((v20 & 0x2000) == 0)
    {
LABEL_49:
      if ((v20 & 0x100) == 0) {
        goto LABEL_50;
      }
      goto LABEL_59;
    }
  }
  else if ((v20 & 0x2000) == 0)
  {
    goto LABEL_49;
  }
  self->_float speedAccuracy = *((float *)v5 + 41);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v20 = *((_DWORD *)v5 + 46);
  if ((v20 & 0x100) == 0)
  {
LABEL_50:
    if ((v20 & 0x20) == 0) {
      goto LABEL_51;
    }
    goto LABEL_60;
  }
LABEL_59:
  self->_uint64_t modeIndicator = *((_DWORD *)v5 + 25);
  *(_DWORD *)&self->_has |= 0x100u;
  int v20 = *((_DWORD *)v5 + 46);
  if ((v20 & 0x20) == 0)
  {
LABEL_51:
    if ((v20 & 0x80) == 0) {
      goto LABEL_52;
    }
    goto LABEL_61;
  }
LABEL_60:
  self->_float horzUncSemiMaj = *((float *)v5 + 22);
  *(_DWORD *)&self->_has |= 0x20u;
  int v20 = *((_DWORD *)v5 + 46);
  if ((v20 & 0x80) == 0)
  {
LABEL_52:
    if ((v20 & 0x40) == 0) {
      goto LABEL_54;
    }
    goto LABEL_53;
  }
LABEL_61:
  self->_float horzUncSemiMin = *((float *)v5 + 24);
  *(_DWORD *)&self->_has |= 0x80u;
  if ((*((_DWORD *)v5 + 46) & 0x40) != 0)
  {
LABEL_53:
    self->_float horzUncSemiMajAz = *((float *)v5 + 23);
    *(_DWORD *)&self->_has |= 0x40u;
  }
LABEL_54:
  satReport = self->_satReport;
  uint64_t v22 = *((void *)v5 + 19);
  if (satReport)
  {
    if (v22) {
      -[CLPSatelliteReport mergeFrom:](satReport, "mergeFrom:");
    }
  }
  else if (v22)
  {
    -[CLPLocation setSatReport:](self, "setSatReport:");
  }
  if ((*((unsigned char *)v5 + 185) & 0x80) != 0)
  {
    self->_isFromLocationController = *((unsigned char *)v5 + 180);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
  pipelineDiagnosticReport = self->_pipelineDiagnosticReport;
  uint64_t v24 = *((void *)v5 + 15);
  if (pipelineDiagnosticReport)
  {
    if (v24) {
      -[CLPPipelineDiagnosticReport mergeFrom:](pipelineDiagnosticReport, "mergeFrom:");
    }
  }
  else if (v24)
  {
    -[CLPLocation setPipelineDiagnosticReport:](self, "setPipelineDiagnosticReport:");
  }
  baroCalibrationIndication = self->_baroCalibrationIndication;
  uint64_t v26 = *((void *)v5 + 6);
  if (baroCalibrationIndication)
  {
    if (v26) {
      -[CLPBaroCalibrationIndication mergeFrom:](baroCalibrationIndication, "mergeFrom:");
    }
  }
  else if (v26)
  {
    -[CLPLocation setBaroCalibrationIndication:](self, "setBaroCalibrationIndication:");
  }
  processingMetadata = self->_processingMetadata;
  uint64_t v28 = *((void *)v5 + 16);
  if (processingMetadata)
  {
    if (v28) {
      -[CLPLocationProcessingMetadata mergeFrom:](processingMetadata, "mergeFrom:");
    }
  }
  else if (v28)
  {
    -[CLPLocation setProcessingMetadata:](self, "setProcessingMetadata:");
  }
  if (*((unsigned char *)v5 + 186))
  {
    self->_isProactiveLocation = *((unsigned char *)v5 + 181);
    *(_DWORD *)&self->_has |= 0x10000u;
  }
  vehicleType = self->_vehicleType;
  uint64_t v30 = *((void *)v5 + 21);
  if (vehicleType)
  {
    if (v30) {
      -[CLPVehicleType mergeFrom:](vehicleType, "mergeFrom:");
    }
  }
  else if (v30)
  {
    -[CLPLocation setVehicleType:](self, "setVehicleType:");
  }
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (float)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (float)altitude
{
  return self->_altitude;
}

- (float)verticalAccuracy
{
  return self->_verticalAccuracy;
}

- (float)speed
{
  return self->_speed;
}

- (float)course
{
  return self->_course;
}

- (int)context
{
  return self->_context;
}

- (int)motionActivityType
{
  return self->_motionActivityType;
}

- (int)motionActivityConfidence
{
  return self->_motionActivityConfidence;
}

- (int)provider
{
  return self->_provider;
}

- (int)floor
{
  return self->_floor;
}

- (NSMutableArray)appBundleIdIndices
{
  return self->_appBundleIdIndices;
}

- (void)setAppBundleIdIndices:(id)a3
{
}

- (BOOL)motionVehicleConnectedStateChanged
{
  return self->_motionVehicleConnectedStateChanged;
}

- (BOOL)motionVehicleConnected
{
  return self->_motionVehicleConnected;
}

- (CLPMotionActivity)rawMotionActivity
{
  return self->_rawMotionActivity;
}

- (CLPMotionActivity)motionActivity
{
  return self->_motionActivity;
}

- (CLPMotionActivity)dominantMotionActivity
{
  return self->_dominantMotionActivity;
}

- (float)courseAccuracy
{
  return self->_courseAccuracy;
}

- (float)speedAccuracy
{
  return self->_speedAccuracy;
}

- (float)horzUncSemiMaj
{
  return self->_horzUncSemiMaj;
}

- (float)horzUncSemiMin
{
  return self->_horzUncSemiMin;
}

- (float)horzUncSemiMajAz
{
  return self->_horzUncSemiMajAz;
}

- (CLPSatelliteReport)satReport
{
  return self->_satReport;
}

- (void)setSatReport:(id)a3
{
}

- (BOOL)isFromLocationController
{
  return self->_isFromLocationController;
}

- (CLPPipelineDiagnosticReport)pipelineDiagnosticReport
{
  return self->_pipelineDiagnosticReport;
}

- (void)setPipelineDiagnosticReport:(id)a3
{
}

- (CLPBaroCalibrationIndication)baroCalibrationIndication
{
  return self->_baroCalibrationIndication;
}

- (void)setBaroCalibrationIndication:(id)a3
{
}

- (CLPLocationProcessingMetadata)processingMetadata
{
  return self->_processingMetadata;
}

- (void)setProcessingMetadata:(id)a3
{
}

- (BOOL)isProactiveLocation
{
  return self->_isProactiveLocation;
}

- (CLPVehicleType)vehicleType
{
  return self->_vehicleType;
}

- (void)setVehicleType:(id)a3
{
}

@end