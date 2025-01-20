@interface CLPIndoorEvent
- (BOOL)hasBundleId;
- (BOOL)hasCmAttitude;
- (BOOL)hasCmPedometer;
- (BOOL)hasInertialOdometry;
- (BOOL)hasLocation;
- (BOOL)hasMotionActivity;
- (BOOL)hasOutdoorUpdate;
- (BOOL)hasPressure;
- (BOOL)hasType;
- (BOOL)hasVioEstimation;
- (BOOL)hasVlLocalizationResult;
- (BOOL)hasWifiScan;
- (BOOL)hasWorkoutUpdateMotionActivity;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CLPBundleId)bundleId;
- (CLPIndoorCMAttitude)cmAttitude;
- (CLPIndoorCMPedometer)cmPedometer;
- (CLPIndoorMotionActivity)motionActivity;
- (CLPIndoorPressure)pressure;
- (CLPIndoorWifiScan)wifiScan;
- (CLPInertialOdometry)inertialOdometry;
- (CLPLOGENTRYVISIONVIOEstimation)vioEstimation;
- (CLPLOGENTRYVISIONVLLocalizationResult)vlLocalizationResult;
- (CLPLocation)location;
- (CLPOutdoorUpdate)outdoorUpdate;
- (CLPWorkoutUpdateMotionActivity)workoutUpdateMotionActivity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setCmAttitude:(id)a3;
- (void)setCmPedometer:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setInertialOdometry:(id)a3;
- (void)setLocation:(id)a3;
- (void)setMotionActivity:(id)a3;
- (void)setOutdoorUpdate:(id)a3;
- (void)setPressure:(id)a3;
- (void)setType:(int)a3;
- (void)setVioEstimation:(id)a3;
- (void)setVlLocalizationResult:(id)a3;
- (void)setWifiScan:(id)a3;
- (void)setWorkoutUpdateMotionActivity:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPIndoorEvent

- (CLPInertialOdometry)inertialOdometry
{
  return self->_inertialOdometry;
}

- (int)type
{
  if (*(unsigned char *)&self->_has) {
    return self->_type;
  }
  else {
    return 1;
  }
}

- (CLPIndoorPressure)pressure
{
  return self->_pressure;
}

- (CLPOutdoorUpdate)outdoorUpdate
{
  return self->_outdoorUpdate;
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutUpdateMotionActivity, 0);
  objc_storeStrong((id *)&self->_wifiScan, 0);
  objc_storeStrong((id *)&self->_vlLocalizationResult, 0);
  objc_storeStrong((id *)&self->_vioEstimation, 0);
  objc_storeStrong((id *)&self->_pressure, 0);
  objc_storeStrong((id *)&self->_outdoorUpdate, 0);
  objc_storeStrong((id *)&self->_motionActivity, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_inertialOdometry, 0);
  objc_storeStrong((id *)&self->_cmPedometer, 0);
  objc_storeStrong((id *)&self->_cmAttitude, 0);

  objc_storeStrong((id *)&self->_bundleId, 0);
}

- (CLPIndoorCMAttitude)cmAttitude
{
  return self->_cmAttitude;
}

- (CLPLocation)location
{
  return self->_location;
}

- (void)setInertialOdometry:(id)a3
{
}

- (void)setLocation:(id)a3
{
}

- (void)setPressure:(id)a3
{
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_cmAttitude)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_cmPedometer)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_location)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_motionActivity)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_pressure)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_wifiScan)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_bundleId)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_vioEstimation)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_vlLocalizationResult)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_workoutUpdateMotionActivity)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_inertialOdometry)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_outdoorUpdate)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)setOutdoorUpdate:(id)a3
{
}

- (CLPIndoorWifiScan)wifiScan
{
  return self->_wifiScan;
}

- (void)setCmAttitude:(id)a3
{
}

- (void)setWifiScan:(id)a3
{
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)typeAsString:(int)a3
{
  if ((a3 - 1) >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E6C35E80[a3 - 1];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CMAttitude"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CMPedometer"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Location"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MotionActivity"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Pressure"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"WifiScan"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"BundleId"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"VIOEstimation"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"VLLocalizationResult"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"WorkoutUpdateMotionActivity"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"InertialOdometry"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"OutdoorUpdate"])
  {
    int v4 = 12;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (BOOL)hasCmAttitude
{
  return self->_cmAttitude != 0;
}

- (BOOL)hasCmPedometer
{
  return self->_cmPedometer != 0;
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (BOOL)hasMotionActivity
{
  return self->_motionActivity != 0;
}

- (BOOL)hasPressure
{
  return self->_pressure != 0;
}

- (BOOL)hasWifiScan
{
  return self->_wifiScan != 0;
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (BOOL)hasVioEstimation
{
  return self->_vioEstimation != 0;
}

- (BOOL)hasVlLocalizationResult
{
  return self->_vlLocalizationResult != 0;
}

- (BOOL)hasWorkoutUpdateMotionActivity
{
  return self->_workoutUpdateMotionActivity != 0;
}

- (BOOL)hasInertialOdometry
{
  return self->_inertialOdometry != 0;
}

- (BOOL)hasOutdoorUpdate
{
  return self->_outdoorUpdate != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPIndoorEvent;
  int v4 = [(CLPIndoorEvent *)&v8 description];
  id v5 = [(CLPIndoorEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v4 = self->_type - 1;
    if (v4 >= 0xC)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
      id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v5 = off_1E6C35E80[v4];
    }
    [v3 setObject:v5 forKey:@"type"];
  }
  cmAttitude = self->_cmAttitude;
  if (cmAttitude)
  {
    v7 = [(CLPIndoorCMAttitude *)cmAttitude dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"cmAttitude"];
  }
  cmPedometer = self->_cmPedometer;
  if (cmPedometer)
  {
    v9 = [(CLPIndoorCMPedometer *)cmPedometer dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"cmPedometer"];
  }
  location = self->_location;
  if (location)
  {
    v11 = [(CLPLocation *)location dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"location"];
  }
  motionActivity = self->_motionActivity;
  if (motionActivity)
  {
    v13 = [(CLPIndoorMotionActivity *)motionActivity dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"motionActivity"];
  }
  pressure = self->_pressure;
  if (pressure)
  {
    v15 = [(CLPIndoorPressure *)pressure dictionaryRepresentation];
    [v3 setObject:v15 forKey:@"pressure"];
  }
  wifiScan = self->_wifiScan;
  if (wifiScan)
  {
    v17 = [(CLPIndoorWifiScan *)wifiScan dictionaryRepresentation];
    [v3 setObject:v17 forKey:@"wifiScan"];
  }
  bundleId = self->_bundleId;
  if (bundleId)
  {
    v19 = [(CLPBundleId *)bundleId dictionaryRepresentation];
    [v3 setObject:v19 forKey:@"bundleId"];
  }
  vioEstimation = self->_vioEstimation;
  if (vioEstimation)
  {
    v21 = [(CLPLOGENTRYVISIONVIOEstimation *)vioEstimation dictionaryRepresentation];
    [v3 setObject:v21 forKey:@"vioEstimation"];
  }
  vlLocalizationResult = self->_vlLocalizationResult;
  if (vlLocalizationResult)
  {
    v23 = [(CLPLOGENTRYVISIONVLLocalizationResult *)vlLocalizationResult dictionaryRepresentation];
    [v3 setObject:v23 forKey:@"vlLocalizationResult"];
  }
  workoutUpdateMotionActivity = self->_workoutUpdateMotionActivity;
  if (workoutUpdateMotionActivity)
  {
    v25 = [(CLPWorkoutUpdateMotionActivity *)workoutUpdateMotionActivity dictionaryRepresentation];
    [v3 setObject:v25 forKey:@"workoutUpdateMotionActivity"];
  }
  inertialOdometry = self->_inertialOdometry;
  if (inertialOdometry)
  {
    v27 = [(CLPInertialOdometry *)inertialOdometry dictionaryRepresentation];
    [v3 setObject:v27 forKey:@"inertialOdometry"];
  }
  outdoorUpdate = self->_outdoorUpdate;
  if (outdoorUpdate)
  {
    v29 = [(CLPOutdoorUpdate *)outdoorUpdate dictionaryRepresentation];
    [v3 setObject:v29 forKey:@"outdoorUpdate"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPIndoorEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  unsigned int v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[18] = self->_type;
    *((unsigned char *)v4 + 112) |= 1u;
  }
  id v5 = v4;
  if (self->_cmAttitude)
  {
    objc_msgSend(v4, "setCmAttitude:");
    unsigned int v4 = v5;
  }
  if (self->_cmPedometer)
  {
    objc_msgSend(v5, "setCmPedometer:");
    unsigned int v4 = v5;
  }
  if (self->_location)
  {
    objc_msgSend(v5, "setLocation:");
    unsigned int v4 = v5;
  }
  if (self->_motionActivity)
  {
    objc_msgSend(v5, "setMotionActivity:");
    unsigned int v4 = v5;
  }
  if (self->_pressure)
  {
    objc_msgSend(v5, "setPressure:");
    unsigned int v4 = v5;
  }
  if (self->_wifiScan)
  {
    objc_msgSend(v5, "setWifiScan:");
    unsigned int v4 = v5;
  }
  if (self->_bundleId)
  {
    objc_msgSend(v5, "setBundleId:");
    unsigned int v4 = v5;
  }
  if (self->_vioEstimation)
  {
    objc_msgSend(v5, "setVioEstimation:");
    unsigned int v4 = v5;
  }
  if (self->_vlLocalizationResult)
  {
    objc_msgSend(v5, "setVlLocalizationResult:");
    unsigned int v4 = v5;
  }
  if (self->_workoutUpdateMotionActivity)
  {
    objc_msgSend(v5, "setWorkoutUpdateMotionActivity:");
    unsigned int v4 = v5;
  }
  if (self->_inertialOdometry)
  {
    objc_msgSend(v5, "setInertialOdometry:");
    unsigned int v4 = v5;
  }
  if (self->_outdoorUpdate)
  {
    objc_msgSend(v5, "setOutdoorUpdate:");
    unsigned int v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 72) = self->_type;
    *(unsigned char *)(v5 + 112) |= 1u;
  }
  id v7 = [(CLPIndoorCMAttitude *)self->_cmAttitude copyWithZone:a3];
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  id v9 = [(CLPIndoorCMPedometer *)self->_cmPedometer copyWithZone:a3];
  v10 = (void *)v6[3];
  v6[3] = v9;

  id v11 = [(CLPLocation *)self->_location copyWithZone:a3];
  v12 = (void *)v6[5];
  v6[5] = v11;

  id v13 = [(CLPIndoorMotionActivity *)self->_motionActivity copyWithZone:a3];
  v14 = (void *)v6[6];
  v6[6] = v13;

  id v15 = [(CLPIndoorPressure *)self->_pressure copyWithZone:a3];
  v16 = (void *)v6[8];
  v6[8] = v15;

  id v17 = [(CLPIndoorWifiScan *)self->_wifiScan copyWithZone:a3];
  v18 = (void *)v6[12];
  v6[12] = v17;

  id v19 = [(CLPBundleId *)self->_bundleId copyWithZone:a3];
  v20 = (void *)v6[1];
  v6[1] = v19;

  id v21 = [(CLPLOGENTRYVISIONVIOEstimation *)self->_vioEstimation copyWithZone:a3];
  v22 = (void *)v6[10];
  v6[10] = v21;

  id v23 = [(CLPLOGENTRYVISIONVLLocalizationResult *)self->_vlLocalizationResult copyWithZone:a3];
  v24 = (void *)v6[11];
  v6[11] = v23;

  id v25 = [(CLPWorkoutUpdateMotionActivity *)self->_workoutUpdateMotionActivity copyWithZone:a3];
  v26 = (void *)v6[13];
  v6[13] = v25;

  id v27 = [(CLPInertialOdometry *)self->_inertialOdometry copyWithZone:a3];
  v28 = (void *)v6[4];
  v6[4] = v27;

  id v29 = [(CLPOutdoorUpdate *)self->_outdoorUpdate copyWithZone:a3];
  v30 = (void *)v6[7];
  v6[7] = v29;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 112) & 1) == 0 || self->_type != *((_DWORD *)v4 + 18)) {
      goto LABEL_31;
    }
  }
  else if (*((unsigned char *)v4 + 112))
  {
LABEL_31:
    char v17 = 0;
    goto LABEL_32;
  }
  cmAttitude = self->_cmAttitude;
  if ((unint64_t)cmAttitude | *((void *)v4 + 2) && !-[CLPIndoorCMAttitude isEqual:](cmAttitude, "isEqual:")) {
    goto LABEL_31;
  }
  cmPedometer = self->_cmPedometer;
  if ((unint64_t)cmPedometer | *((void *)v4 + 3))
  {
    if (!-[CLPIndoorCMPedometer isEqual:](cmPedometer, "isEqual:")) {
      goto LABEL_31;
    }
  }
  location = self->_location;
  if ((unint64_t)location | *((void *)v4 + 5))
  {
    if (!-[CLPLocation isEqual:](location, "isEqual:")) {
      goto LABEL_31;
    }
  }
  motionActivity = self->_motionActivity;
  if ((unint64_t)motionActivity | *((void *)v4 + 6))
  {
    if (!-[CLPIndoorMotionActivity isEqual:](motionActivity, "isEqual:")) {
      goto LABEL_31;
    }
  }
  pressure = self->_pressure;
  if ((unint64_t)pressure | *((void *)v4 + 8))
  {
    if (!-[CLPIndoorPressure isEqual:](pressure, "isEqual:")) {
      goto LABEL_31;
    }
  }
  wifiScan = self->_wifiScan;
  if ((unint64_t)wifiScan | *((void *)v4 + 12))
  {
    if (!-[CLPIndoorWifiScan isEqual:](wifiScan, "isEqual:")) {
      goto LABEL_31;
    }
  }
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((void *)v4 + 1))
  {
    if (!-[CLPBundleId isEqual:](bundleId, "isEqual:")) {
      goto LABEL_31;
    }
  }
  vioEstimation = self->_vioEstimation;
  if ((unint64_t)vioEstimation | *((void *)v4 + 10))
  {
    if (!-[CLPLOGENTRYVISIONVIOEstimation isEqual:](vioEstimation, "isEqual:")) {
      goto LABEL_31;
    }
  }
  vlLocalizationResult = self->_vlLocalizationResult;
  if ((unint64_t)vlLocalizationResult | *((void *)v4 + 11))
  {
    if (!-[CLPLOGENTRYVISIONVLLocalizationResult isEqual:](vlLocalizationResult, "isEqual:")) {
      goto LABEL_31;
    }
  }
  workoutUpdateMotionActivity = self->_workoutUpdateMotionActivity;
  if ((unint64_t)workoutUpdateMotionActivity | *((void *)v4 + 13))
  {
    if (!-[CLPWorkoutUpdateMotionActivity isEqual:](workoutUpdateMotionActivity, "isEqual:")) {
      goto LABEL_31;
    }
  }
  inertialOdometry = self->_inertialOdometry;
  if ((unint64_t)inertialOdometry | *((void *)v4 + 4))
  {
    if (!-[CLPInertialOdometry isEqual:](inertialOdometry, "isEqual:")) {
      goto LABEL_31;
    }
  }
  outdoorUpdate = self->_outdoorUpdate;
  if ((unint64_t)outdoorUpdate | *((void *)v4 + 7)) {
    char v17 = -[CLPOutdoorUpdate isEqual:](outdoorUpdate, "isEqual:");
  }
  else {
    char v17 = 1;
  }
LABEL_32:

  return v17;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(CLPIndoorCMAttitude *)self->_cmAttitude hash] ^ v3;
  unint64_t v5 = [(CLPIndoorCMPedometer *)self->_cmPedometer hash];
  unint64_t v6 = v4 ^ v5 ^ [(CLPLocation *)self->_location hash];
  unint64_t v7 = [(CLPIndoorMotionActivity *)self->_motionActivity hash];
  unint64_t v8 = v7 ^ [(CLPIndoorPressure *)self->_pressure hash];
  unint64_t v9 = v6 ^ v8 ^ [(CLPIndoorWifiScan *)self->_wifiScan hash];
  unint64_t v10 = [(CLPBundleId *)self->_bundleId hash];
  unint64_t v11 = v10 ^ [(CLPLOGENTRYVISIONVIOEstimation *)self->_vioEstimation hash];
  unint64_t v12 = v11 ^ [(CLPLOGENTRYVISIONVLLocalizationResult *)self->_vlLocalizationResult hash];
  unint64_t v13 = v9 ^ v12 ^ [(CLPWorkoutUpdateMotionActivity *)self->_workoutUpdateMotionActivity hash];
  unint64_t v14 = [(CLPInertialOdometry *)self->_inertialOdometry hash];
  return v13 ^ v14 ^ [(CLPOutdoorUpdate *)self->_outdoorUpdate hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (*((unsigned char *)v4 + 112))
  {
    self->_type = *((_DWORD *)v4 + 18);
    *(unsigned char *)&self->_has |= 1u;
  }
  cmAttitude = self->_cmAttitude;
  uint64_t v7 = v5[2];
  v30 = v5;
  if (cmAttitude)
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[CLPIndoorCMAttitude mergeFrom:](cmAttitude, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[CLPIndoorEvent setCmAttitude:](self, "setCmAttitude:");
  }
  unint64_t v5 = v30;
LABEL_9:
  cmPedometer = self->_cmPedometer;
  uint64_t v9 = v5[3];
  if (cmPedometer)
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[CLPIndoorCMPedometer mergeFrom:](cmPedometer, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[CLPIndoorEvent setCmPedometer:](self, "setCmPedometer:");
  }
  unint64_t v5 = v30;
LABEL_15:
  location = self->_location;
  uint64_t v11 = v5[5];
  if (location)
  {
    if (!v11) {
      goto LABEL_21;
    }
    -[CLPLocation mergeFrom:](location, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_21;
    }
    -[CLPIndoorEvent setLocation:](self, "setLocation:");
  }
  unint64_t v5 = v30;
LABEL_21:
  motionActivity = self->_motionActivity;
  uint64_t v13 = v5[6];
  if (motionActivity)
  {
    if (!v13) {
      goto LABEL_27;
    }
    -[CLPIndoorMotionActivity mergeFrom:](motionActivity, "mergeFrom:");
  }
  else
  {
    if (!v13) {
      goto LABEL_27;
    }
    -[CLPIndoorEvent setMotionActivity:](self, "setMotionActivity:");
  }
  unint64_t v5 = v30;
LABEL_27:
  pressure = self->_pressure;
  uint64_t v15 = v5[8];
  if (pressure)
  {
    if (!v15) {
      goto LABEL_33;
    }
    -[CLPIndoorPressure mergeFrom:](pressure, "mergeFrom:");
  }
  else
  {
    if (!v15) {
      goto LABEL_33;
    }
    -[CLPIndoorEvent setPressure:](self, "setPressure:");
  }
  unint64_t v5 = v30;
LABEL_33:
  wifiScan = self->_wifiScan;
  uint64_t v17 = v5[12];
  if (wifiScan)
  {
    if (!v17) {
      goto LABEL_39;
    }
    -[CLPIndoorWifiScan mergeFrom:](wifiScan, "mergeFrom:");
  }
  else
  {
    if (!v17) {
      goto LABEL_39;
    }
    -[CLPIndoorEvent setWifiScan:](self, "setWifiScan:");
  }
  unint64_t v5 = v30;
LABEL_39:
  bundleId = self->_bundleId;
  uint64_t v19 = v5[1];
  if (bundleId)
  {
    if (!v19) {
      goto LABEL_45;
    }
    -[CLPBundleId mergeFrom:](bundleId, "mergeFrom:");
  }
  else
  {
    if (!v19) {
      goto LABEL_45;
    }
    -[CLPIndoorEvent setBundleId:](self, "setBundleId:");
  }
  unint64_t v5 = v30;
LABEL_45:
  vioEstimation = self->_vioEstimation;
  uint64_t v21 = v5[10];
  if (vioEstimation)
  {
    if (!v21) {
      goto LABEL_51;
    }
    -[CLPLOGENTRYVISIONVIOEstimation mergeFrom:](vioEstimation, "mergeFrom:");
  }
  else
  {
    if (!v21) {
      goto LABEL_51;
    }
    -[CLPIndoorEvent setVioEstimation:](self, "setVioEstimation:");
  }
  unint64_t v5 = v30;
LABEL_51:
  vlLocalizationResult = self->_vlLocalizationResult;
  uint64_t v23 = v5[11];
  if (vlLocalizationResult)
  {
    if (!v23) {
      goto LABEL_57;
    }
    -[CLPLOGENTRYVISIONVLLocalizationResult mergeFrom:](vlLocalizationResult, "mergeFrom:");
  }
  else
  {
    if (!v23) {
      goto LABEL_57;
    }
    -[CLPIndoorEvent setVlLocalizationResult:](self, "setVlLocalizationResult:");
  }
  unint64_t v5 = v30;
LABEL_57:
  workoutUpdateMotionActivity = self->_workoutUpdateMotionActivity;
  uint64_t v25 = v5[13];
  if (workoutUpdateMotionActivity)
  {
    if (!v25) {
      goto LABEL_63;
    }
    -[CLPWorkoutUpdateMotionActivity mergeFrom:](workoutUpdateMotionActivity, "mergeFrom:");
  }
  else
  {
    if (!v25) {
      goto LABEL_63;
    }
    [(CLPIndoorEvent *)self setWorkoutUpdateMotionActivity:"setWorkoutUpdateMotionActivity:"];
  }
  unint64_t v5 = v30;
LABEL_63:
  inertialOdometry = self->_inertialOdometry;
  uint64_t v27 = v5[4];
  if (inertialOdometry)
  {
    if (!v27) {
      goto LABEL_69;
    }
    -[CLPInertialOdometry mergeFrom:](inertialOdometry, "mergeFrom:");
  }
  else
  {
    if (!v27) {
      goto LABEL_69;
    }
    -[CLPIndoorEvent setInertialOdometry:](self, "setInertialOdometry:");
  }
  unint64_t v5 = v30;
LABEL_69:
  outdoorUpdate = self->_outdoorUpdate;
  uint64_t v29 = v5[7];
  if (outdoorUpdate)
  {
    if (v29) {
      -[CLPOutdoorUpdate mergeFrom:](outdoorUpdate, "mergeFrom:");
    }
  }
  else if (v29)
  {
    -[CLPIndoorEvent setOutdoorUpdate:](self, "setOutdoorUpdate:");
  }

  MEMORY[0x1F41817F8]();
}

- (CLPIndoorCMPedometer)cmPedometer
{
  return self->_cmPedometer;
}

- (void)setCmPedometer:(id)a3
{
}

- (CLPIndoorMotionActivity)motionActivity
{
  return self->_motionActivity;
}

- (void)setMotionActivity:(id)a3
{
}

- (CLPBundleId)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (CLPLOGENTRYVISIONVIOEstimation)vioEstimation
{
  return self->_vioEstimation;
}

- (void)setVioEstimation:(id)a3
{
}

- (CLPLOGENTRYVISIONVLLocalizationResult)vlLocalizationResult
{
  return self->_vlLocalizationResult;
}

- (void)setVlLocalizationResult:(id)a3
{
}

- (CLPWorkoutUpdateMotionActivity)workoutUpdateMotionActivity
{
  return self->_workoutUpdateMotionActivity;
}

- (void)setWorkoutUpdateMotionActivity:(id)a3
{
}

@end