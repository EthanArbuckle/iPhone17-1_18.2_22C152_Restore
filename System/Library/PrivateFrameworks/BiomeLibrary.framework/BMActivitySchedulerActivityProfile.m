@interface BMActivitySchedulerActivityProfile
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMActivitySchedulerActivityProfile)initWithBundleID:(id)a3 activityname:(id)a4 completed:(id)a5 CPUAwakeTime:(id)a6 CPUTime:(id)a7 endBatteryTemperature:(id)a8 endTime:(id)a9 endedInIdle:(id)a10 endedOnBattery:(id)a11 networkProfSuccess:(id)a12 qosBackground:(id)a13 qosLegacy:(id)a14 qosUserInit:(id)a15 runTime:(id)a16 rusageProfSuccess:(id)a17 servicedEnergy:(id)a18 sessionProfSuccess:(id)a19 startBatteryTemperature:(id)a20 startTime:(id)a21 startedInIdle:(id)a22 startedOnBattery:(id)a23 version:(id)a24 wifiDown:(id)a25 wifiUp:(id)a26 dirtyMemoryDelta:(id)a27;
- (BMActivitySchedulerActivityProfile)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)completed;
- (BOOL)endedInIdle;
- (BOOL)endedOnBattery;
- (BOOL)hasCPUAwakeTime;
- (BOOL)hasCPUTime;
- (BOOL)hasCompleted;
- (BOOL)hasDirtyMemoryDelta;
- (BOOL)hasEndBatteryTemperature;
- (BOOL)hasEndedInIdle;
- (BOOL)hasEndedOnBattery;
- (BOOL)hasNetworkProfSuccess;
- (BOOL)hasQosBackground;
- (BOOL)hasQosLegacy;
- (BOOL)hasQosUserInit;
- (BOOL)hasRunTime;
- (BOOL)hasRusageProfSuccess;
- (BOOL)hasServicedEnergy;
- (BOOL)hasSessionProfSuccess;
- (BOOL)hasStartBatteryTemperature;
- (BOOL)hasStartedInIdle;
- (BOOL)hasStartedOnBattery;
- (BOOL)hasVersion;
- (BOOL)hasWifiDown;
- (BOOL)hasWifiUp;
- (BOOL)isEqual:(id)a3;
- (BOOL)networkProfSuccess;
- (BOOL)rusageProfSuccess;
- (BOOL)sessionProfSuccess;
- (BOOL)startedInIdle;
- (BOOL)startedOnBattery;
- (NSDate)endTime;
- (NSDate)startTime;
- (NSString)activityname;
- (NSString)bundleID;
- (NSString)description;
- (double)CPUTime;
- (double)qosBackground;
- (double)qosLegacy;
- (double)qosUserInit;
- (double)runTime;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)CPUAwakeTime;
- (int)dirtyMemoryDelta;
- (int)endBatteryTemperature;
- (int)servicedEnergy;
- (int)startBatteryTemperature;
- (int)version;
- (int)wifiDown;
- (int)wifiUp;
- (unsigned)dataVersion;
- (void)setHasCPUAwakeTime:(BOOL)a3;
- (void)setHasCPUTime:(BOOL)a3;
- (void)setHasCompleted:(BOOL)a3;
- (void)setHasDirtyMemoryDelta:(BOOL)a3;
- (void)setHasEndBatteryTemperature:(BOOL)a3;
- (void)setHasEndedInIdle:(BOOL)a3;
- (void)setHasEndedOnBattery:(BOOL)a3;
- (void)setHasNetworkProfSuccess:(BOOL)a3;
- (void)setHasQosBackground:(BOOL)a3;
- (void)setHasQosLegacy:(BOOL)a3;
- (void)setHasQosUserInit:(BOOL)a3;
- (void)setHasRunTime:(BOOL)a3;
- (void)setHasRusageProfSuccess:(BOOL)a3;
- (void)setHasServicedEnergy:(BOOL)a3;
- (void)setHasSessionProfSuccess:(BOOL)a3;
- (void)setHasStartBatteryTemperature:(BOOL)a3;
- (void)setHasStartedInIdle:(BOOL)a3;
- (void)setHasStartedOnBattery:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setHasWifiDown:(BOOL)a3;
- (void)setHasWifiUp:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMActivitySchedulerActivityProfile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityname, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

- (void)setHasDirtyMemoryDelta:(BOOL)a3
{
  self->_hasDirtyMemoryDelta = a3;
}

- (BOOL)hasDirtyMemoryDelta
{
  return self->_hasDirtyMemoryDelta;
}

- (int)dirtyMemoryDelta
{
  return self->_dirtyMemoryDelta;
}

- (void)setHasWifiUp:(BOOL)a3
{
  self->_hasWifiUp = a3;
}

- (BOOL)hasWifiUp
{
  return self->_hasWifiUp;
}

- (int)wifiUp
{
  return self->_wifiUp;
}

- (void)setHasWifiDown:(BOOL)a3
{
  self->_hasWifiDown = a3;
}

- (BOOL)hasWifiDown
{
  return self->_hasWifiDown;
}

- (int)wifiDown
{
  return self->_wifiDown;
}

- (void)setHasVersion:(BOOL)a3
{
  self->_hasVersion = a3;
}

- (BOOL)hasVersion
{
  return self->_hasVersion;
}

- (int)version
{
  return self->_version;
}

- (void)setHasStartedOnBattery:(BOOL)a3
{
  self->_hasStartedOnBattery = a3;
}

- (BOOL)hasStartedOnBattery
{
  return self->_hasStartedOnBattery;
}

- (BOOL)startedOnBattery
{
  return self->_startedOnBattery;
}

- (void)setHasStartedInIdle:(BOOL)a3
{
  self->_hasStartedInIdle = a3;
}

- (BOOL)hasStartedInIdle
{
  return self->_hasStartedInIdle;
}

- (BOOL)startedInIdle
{
  return self->_startedInIdle;
}

- (void)setHasStartBatteryTemperature:(BOOL)a3
{
  self->_hasStartBatteryTemperature = a3;
}

- (BOOL)hasStartBatteryTemperature
{
  return self->_hasStartBatteryTemperature;
}

- (int)startBatteryTemperature
{
  return self->_startBatteryTemperature;
}

- (void)setHasSessionProfSuccess:(BOOL)a3
{
  self->_hasSessionProfSuccess = a3;
}

- (BOOL)hasSessionProfSuccess
{
  return self->_hasSessionProfSuccess;
}

- (BOOL)sessionProfSuccess
{
  return self->_sessionProfSuccess;
}

- (void)setHasServicedEnergy:(BOOL)a3
{
  self->_hasServicedEnergy = a3;
}

- (BOOL)hasServicedEnergy
{
  return self->_hasServicedEnergy;
}

- (int)servicedEnergy
{
  return self->_servicedEnergy;
}

- (void)setHasRusageProfSuccess:(BOOL)a3
{
  self->_hasRusageProfSuccess = a3;
}

- (BOOL)hasRusageProfSuccess
{
  return self->_hasRusageProfSuccess;
}

- (BOOL)rusageProfSuccess
{
  return self->_rusageProfSuccess;
}

- (void)setHasRunTime:(BOOL)a3
{
  self->_hasRunTime = a3;
}

- (BOOL)hasRunTime
{
  return self->_hasRunTime;
}

- (double)runTime
{
  return self->_runTime;
}

- (void)setHasQosUserInit:(BOOL)a3
{
  self->_hasQosUserInit = a3;
}

- (BOOL)hasQosUserInit
{
  return self->_hasQosUserInit;
}

- (double)qosUserInit
{
  return self->_qosUserInit;
}

- (void)setHasQosLegacy:(BOOL)a3
{
  self->_hasQosLegacy = a3;
}

- (BOOL)hasQosLegacy
{
  return self->_hasQosLegacy;
}

- (double)qosLegacy
{
  return self->_qosLegacy;
}

- (void)setHasQosBackground:(BOOL)a3
{
  self->_hasQosBackground = a3;
}

- (BOOL)hasQosBackground
{
  return self->_hasQosBackground;
}

- (double)qosBackground
{
  return self->_qosBackground;
}

- (void)setHasNetworkProfSuccess:(BOOL)a3
{
  self->_hasNetworkProfSuccess = a3;
}

- (BOOL)hasNetworkProfSuccess
{
  return self->_hasNetworkProfSuccess;
}

- (BOOL)networkProfSuccess
{
  return self->_networkProfSuccess;
}

- (void)setHasEndedOnBattery:(BOOL)a3
{
  self->_hasEndedOnBattery = a3;
}

- (BOOL)hasEndedOnBattery
{
  return self->_hasEndedOnBattery;
}

- (BOOL)endedOnBattery
{
  return self->_endedOnBattery;
}

- (void)setHasEndedInIdle:(BOOL)a3
{
  self->_hasEndedInIdle = a3;
}

- (BOOL)hasEndedInIdle
{
  return self->_hasEndedInIdle;
}

- (BOOL)endedInIdle
{
  return self->_endedInIdle;
}

- (void)setHasEndBatteryTemperature:(BOOL)a3
{
  self->_hasEndBatteryTemperature = a3;
}

- (BOOL)hasEndBatteryTemperature
{
  return self->_hasEndBatteryTemperature;
}

- (int)endBatteryTemperature
{
  return self->_endBatteryTemperature;
}

- (void)setHasCPUTime:(BOOL)a3
{
  self->_hasCPUTime = a3;
}

- (BOOL)hasCPUTime
{
  return self->_hasCPUTime;
}

- (double)CPUTime
{
  return self->_CPUTime;
}

- (void)setHasCPUAwakeTime:(BOOL)a3
{
  self->_hasCPUAwakeTime = a3;
}

- (BOOL)hasCPUAwakeTime
{
  return self->_hasCPUAwakeTime;
}

- (int)CPUAwakeTime
{
  return self->_CPUAwakeTime;
}

- (void)setHasCompleted:(BOOL)a3
{
  self->_hasCompleted = a3;
}

- (BOOL)hasCompleted
{
  return self->_hasCompleted;
}

- (BOOL)completed
{
  return self->_completed;
}

- (NSString)activityname
{
  return self->_activityname;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(BMActivitySchedulerActivityProfile *)self bundleID];
    uint64_t v7 = [v5 bundleID];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMActivitySchedulerActivityProfile *)self bundleID];
      v10 = [v5 bundleID];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_124;
      }
    }
    v13 = [(BMActivitySchedulerActivityProfile *)self activityname];
    uint64_t v14 = [v5 activityname];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMActivitySchedulerActivityProfile *)self activityname];
      v17 = [v5 activityname];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_124;
      }
    }
    if ([(BMActivitySchedulerActivityProfile *)self hasCompleted]
      || [v5 hasCompleted])
    {
      if (![(BMActivitySchedulerActivityProfile *)self hasCompleted]) {
        goto LABEL_124;
      }
      if (![v5 hasCompleted]) {
        goto LABEL_124;
      }
      int v19 = [(BMActivitySchedulerActivityProfile *)self completed];
      if (v19 != [v5 completed]) {
        goto LABEL_124;
      }
    }
    if ([(BMActivitySchedulerActivityProfile *)self hasCPUAwakeTime]
      || [v5 hasCPUAwakeTime])
    {
      if (![(BMActivitySchedulerActivityProfile *)self hasCPUAwakeTime]) {
        goto LABEL_124;
      }
      if (![v5 hasCPUAwakeTime]) {
        goto LABEL_124;
      }
      int v20 = [(BMActivitySchedulerActivityProfile *)self CPUAwakeTime];
      if (v20 != [v5 CPUAwakeTime]) {
        goto LABEL_124;
      }
    }
    if ([(BMActivitySchedulerActivityProfile *)self hasCPUTime]
      || [v5 hasCPUTime])
    {
      if (![(BMActivitySchedulerActivityProfile *)self hasCPUTime]) {
        goto LABEL_124;
      }
      if (![v5 hasCPUTime]) {
        goto LABEL_124;
      }
      [(BMActivitySchedulerActivityProfile *)self CPUTime];
      double v22 = v21;
      [v5 CPUTime];
      if (v22 != v23) {
        goto LABEL_124;
      }
    }
    if ([(BMActivitySchedulerActivityProfile *)self hasEndBatteryTemperature]
      || [v5 hasEndBatteryTemperature])
    {
      if (![(BMActivitySchedulerActivityProfile *)self hasEndBatteryTemperature]) {
        goto LABEL_124;
      }
      if (![v5 hasEndBatteryTemperature]) {
        goto LABEL_124;
      }
      int v24 = [(BMActivitySchedulerActivityProfile *)self endBatteryTemperature];
      if (v24 != [v5 endBatteryTemperature]) {
        goto LABEL_124;
      }
    }
    v25 = [(BMActivitySchedulerActivityProfile *)self endTime];
    uint64_t v26 = [v5 endTime];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMActivitySchedulerActivityProfile *)self endTime];
      v29 = [v5 endTime];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_124;
      }
    }
    if ([(BMActivitySchedulerActivityProfile *)self hasEndedInIdle]
      || [v5 hasEndedInIdle])
    {
      if (![(BMActivitySchedulerActivityProfile *)self hasEndedInIdle]) {
        goto LABEL_124;
      }
      if (![v5 hasEndedInIdle]) {
        goto LABEL_124;
      }
      int v31 = [(BMActivitySchedulerActivityProfile *)self endedInIdle];
      if (v31 != [v5 endedInIdle]) {
        goto LABEL_124;
      }
    }
    if ([(BMActivitySchedulerActivityProfile *)self hasEndedOnBattery]
      || [v5 hasEndedOnBattery])
    {
      if (![(BMActivitySchedulerActivityProfile *)self hasEndedOnBattery]) {
        goto LABEL_124;
      }
      if (![v5 hasEndedOnBattery]) {
        goto LABEL_124;
      }
      int v32 = [(BMActivitySchedulerActivityProfile *)self endedOnBattery];
      if (v32 != [v5 endedOnBattery]) {
        goto LABEL_124;
      }
    }
    if ([(BMActivitySchedulerActivityProfile *)self hasNetworkProfSuccess]
      || [v5 hasNetworkProfSuccess])
    {
      if (![(BMActivitySchedulerActivityProfile *)self hasNetworkProfSuccess]) {
        goto LABEL_124;
      }
      if (![v5 hasNetworkProfSuccess]) {
        goto LABEL_124;
      }
      int v33 = [(BMActivitySchedulerActivityProfile *)self networkProfSuccess];
      if (v33 != [v5 networkProfSuccess]) {
        goto LABEL_124;
      }
    }
    if ([(BMActivitySchedulerActivityProfile *)self hasQosBackground]
      || [v5 hasQosBackground])
    {
      if (![(BMActivitySchedulerActivityProfile *)self hasQosBackground]) {
        goto LABEL_124;
      }
      if (![v5 hasQosBackground]) {
        goto LABEL_124;
      }
      [(BMActivitySchedulerActivityProfile *)self qosBackground];
      double v35 = v34;
      [v5 qosBackground];
      if (v35 != v36) {
        goto LABEL_124;
      }
    }
    if ([(BMActivitySchedulerActivityProfile *)self hasQosLegacy]
      || [v5 hasQosLegacy])
    {
      if (![(BMActivitySchedulerActivityProfile *)self hasQosLegacy]) {
        goto LABEL_124;
      }
      if (![v5 hasQosLegacy]) {
        goto LABEL_124;
      }
      [(BMActivitySchedulerActivityProfile *)self qosLegacy];
      double v38 = v37;
      [v5 qosLegacy];
      if (v38 != v39) {
        goto LABEL_124;
      }
    }
    if ([(BMActivitySchedulerActivityProfile *)self hasQosUserInit]
      || [v5 hasQosUserInit])
    {
      if (![(BMActivitySchedulerActivityProfile *)self hasQosUserInit]) {
        goto LABEL_124;
      }
      if (![v5 hasQosUserInit]) {
        goto LABEL_124;
      }
      [(BMActivitySchedulerActivityProfile *)self qosUserInit];
      double v41 = v40;
      [v5 qosUserInit];
      if (v41 != v42) {
        goto LABEL_124;
      }
    }
    if ([(BMActivitySchedulerActivityProfile *)self hasRunTime]
      || [v5 hasRunTime])
    {
      if (![(BMActivitySchedulerActivityProfile *)self hasRunTime]) {
        goto LABEL_124;
      }
      if (![v5 hasRunTime]) {
        goto LABEL_124;
      }
      [(BMActivitySchedulerActivityProfile *)self runTime];
      double v44 = v43;
      [v5 runTime];
      if (v44 != v45) {
        goto LABEL_124;
      }
    }
    if ([(BMActivitySchedulerActivityProfile *)self hasRusageProfSuccess]
      || [v5 hasRusageProfSuccess])
    {
      if (![(BMActivitySchedulerActivityProfile *)self hasRusageProfSuccess]) {
        goto LABEL_124;
      }
      if (![v5 hasRusageProfSuccess]) {
        goto LABEL_124;
      }
      int v46 = [(BMActivitySchedulerActivityProfile *)self rusageProfSuccess];
      if (v46 != [v5 rusageProfSuccess]) {
        goto LABEL_124;
      }
    }
    if ([(BMActivitySchedulerActivityProfile *)self hasServicedEnergy]
      || [v5 hasServicedEnergy])
    {
      if (![(BMActivitySchedulerActivityProfile *)self hasServicedEnergy]) {
        goto LABEL_124;
      }
      if (![v5 hasServicedEnergy]) {
        goto LABEL_124;
      }
      int v47 = [(BMActivitySchedulerActivityProfile *)self servicedEnergy];
      if (v47 != [v5 servicedEnergy]) {
        goto LABEL_124;
      }
    }
    if ([(BMActivitySchedulerActivityProfile *)self hasSessionProfSuccess]
      || [v5 hasSessionProfSuccess])
    {
      if (![(BMActivitySchedulerActivityProfile *)self hasSessionProfSuccess]) {
        goto LABEL_124;
      }
      if (![v5 hasSessionProfSuccess]) {
        goto LABEL_124;
      }
      int v48 = [(BMActivitySchedulerActivityProfile *)self sessionProfSuccess];
      if (v48 != [v5 sessionProfSuccess]) {
        goto LABEL_124;
      }
    }
    if ([(BMActivitySchedulerActivityProfile *)self hasStartBatteryTemperature]
      || [v5 hasStartBatteryTemperature])
    {
      if (![(BMActivitySchedulerActivityProfile *)self hasStartBatteryTemperature]) {
        goto LABEL_124;
      }
      if (![v5 hasStartBatteryTemperature]) {
        goto LABEL_124;
      }
      int v49 = [(BMActivitySchedulerActivityProfile *)self startBatteryTemperature];
      if (v49 != [v5 startBatteryTemperature]) {
        goto LABEL_124;
      }
    }
    v50 = [(BMActivitySchedulerActivityProfile *)self startTime];
    uint64_t v51 = [v5 startTime];
    if (v50 == (void *)v51)
    {
    }
    else
    {
      v52 = (void *)v51;
      v53 = [(BMActivitySchedulerActivityProfile *)self startTime];
      v54 = [v5 startTime];
      int v55 = [v53 isEqual:v54];

      if (!v55) {
        goto LABEL_124;
      }
    }
    if (![(BMActivitySchedulerActivityProfile *)self hasStartedInIdle]
      && ![v5 hasStartedInIdle]
      || [(BMActivitySchedulerActivityProfile *)self hasStartedInIdle]
      && [v5 hasStartedInIdle]
      && (int v56 = [(BMActivitySchedulerActivityProfile *)self startedInIdle],
          v56 == [v5 startedInIdle]))
    {
      if (![(BMActivitySchedulerActivityProfile *)self hasStartedOnBattery]
        && ![v5 hasStartedOnBattery]
        || [(BMActivitySchedulerActivityProfile *)self hasStartedOnBattery]
        && [v5 hasStartedOnBattery]
        && (int v57 = [(BMActivitySchedulerActivityProfile *)self startedOnBattery],
            v57 == [v5 startedOnBattery]))
      {
        if (![(BMActivitySchedulerActivityProfile *)self hasVersion]
          && ![v5 hasVersion]
          || [(BMActivitySchedulerActivityProfile *)self hasVersion]
          && [v5 hasVersion]
          && (int v58 = [(BMActivitySchedulerActivityProfile *)self version],
              v58 == [v5 version]))
        {
          if (![(BMActivitySchedulerActivityProfile *)self hasWifiDown]
            && ![v5 hasWifiDown]
            || [(BMActivitySchedulerActivityProfile *)self hasWifiDown]
            && [v5 hasWifiDown]
            && (int v59 = [(BMActivitySchedulerActivityProfile *)self wifiDown],
                v59 == [v5 wifiDown]))
          {
            if (![(BMActivitySchedulerActivityProfile *)self hasWifiUp]
              && ![v5 hasWifiUp]
              || [(BMActivitySchedulerActivityProfile *)self hasWifiUp]
              && [v5 hasWifiUp]
              && (int v60 = [(BMActivitySchedulerActivityProfile *)self wifiUp],
                  v60 == [v5 wifiUp]))
            {
              if (![(BMActivitySchedulerActivityProfile *)self hasDirtyMemoryDelta]
                && ![v5 hasDirtyMemoryDelta])
              {
                BOOL v12 = 1;
                goto LABEL_125;
              }
              if ([(BMActivitySchedulerActivityProfile *)self hasDirtyMemoryDelta]
                && [v5 hasDirtyMemoryDelta])
              {
                int v61 = [(BMActivitySchedulerActivityProfile *)self dirtyMemoryDelta];
                BOOL v12 = v61 == [v5 dirtyMemoryDelta];
LABEL_125:

                goto LABEL_126;
              }
            }
          }
        }
      }
    }
LABEL_124:
    BOOL v12 = 0;
    goto LABEL_125;
  }
  BOOL v12 = 0;
LABEL_126:

  return v12;
}

- (NSDate)startTime
{
  if (self->_hasRaw_startTime)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_startTime];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSDate)endTime
{
  if (self->_hasRaw_endTime)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_endTime];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (id)jsonDictionary
{
  v95[25] = *MEMORY[0x1E4F143B8];
  v3 = [(BMActivitySchedulerActivityProfile *)self bundleID];
  uint64_t v4 = [(BMActivitySchedulerActivityProfile *)self activityname];
  if ([(BMActivitySchedulerActivityProfile *)self hasCompleted])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMActivitySchedulerActivityProfile completed](self, "completed"));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = 0;
  }
  if ([(BMActivitySchedulerActivityProfile *)self hasCPUAwakeTime])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMActivitySchedulerActivityProfile CPUAwakeTime](self, "CPUAwakeTime"));
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = 0;
  }
  if (![(BMActivitySchedulerActivityProfile *)self hasCPUTime]
    || ([(BMActivitySchedulerActivityProfile *)self CPUTime], fabs(v7) == INFINITY))
  {
    id v9 = 0;
  }
  else
  {
    [(BMActivitySchedulerActivityProfile *)self CPUTime];
    v8 = NSNumber;
    [(BMActivitySchedulerActivityProfile *)self CPUTime];
    objc_msgSend(v8, "numberWithDouble:");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ([(BMActivitySchedulerActivityProfile *)self hasEndBatteryTemperature])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMActivitySchedulerActivityProfile endBatteryTemperature](self, "endBatteryTemperature"));
    id v76 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v76 = 0;
  }
  v10 = [(BMActivitySchedulerActivityProfile *)self endTime];
  if (v10)
  {
    int v11 = NSNumber;
    BOOL v12 = [(BMActivitySchedulerActivityProfile *)self endTime];
    [v12 timeIntervalSince1970];
    objc_msgSend(v11, "numberWithDouble:");
    id v75 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v75 = 0;
  }

  if ([(BMActivitySchedulerActivityProfile *)self hasEndedInIdle])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMActivitySchedulerActivityProfile endedInIdle](self, "endedInIdle"));
    id v93 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v93 = 0;
  }
  if ([(BMActivitySchedulerActivityProfile *)self hasEndedOnBattery])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMActivitySchedulerActivityProfile endedOnBattery](self, "endedOnBattery"));
    id v92 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v92 = 0;
  }
  if ([(BMActivitySchedulerActivityProfile *)self hasNetworkProfSuccess])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMActivitySchedulerActivityProfile networkProfSuccess](self, "networkProfSuccess"));
    id v91 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v91 = 0;
  }
  if (![(BMActivitySchedulerActivityProfile *)self hasQosBackground]
    || ([(BMActivitySchedulerActivityProfile *)self qosBackground], fabs(v13) == INFINITY))
  {
    id v90 = 0;
  }
  else
  {
    [(BMActivitySchedulerActivityProfile *)self qosBackground];
    uint64_t v14 = NSNumber;
    [(BMActivitySchedulerActivityProfile *)self qosBackground];
    objc_msgSend(v14, "numberWithDouble:");
    id v90 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMActivitySchedulerActivityProfile *)self hasQosLegacy]
    || ([(BMActivitySchedulerActivityProfile *)self qosLegacy], fabs(v15) == INFINITY))
  {
    id v89 = 0;
  }
  else
  {
    [(BMActivitySchedulerActivityProfile *)self qosLegacy];
    v16 = NSNumber;
    [(BMActivitySchedulerActivityProfile *)self qosLegacy];
    objc_msgSend(v16, "numberWithDouble:");
    id v89 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMActivitySchedulerActivityProfile *)self hasQosUserInit]
    || ([(BMActivitySchedulerActivityProfile *)self qosUserInit], fabs(v17) == INFINITY))
  {
    id v88 = 0;
  }
  else
  {
    [(BMActivitySchedulerActivityProfile *)self qosUserInit];
    int v18 = NSNumber;
    [(BMActivitySchedulerActivityProfile *)self qosUserInit];
    objc_msgSend(v18, "numberWithDouble:");
    id v88 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMActivitySchedulerActivityProfile *)self hasRunTime]
    || ([(BMActivitySchedulerActivityProfile *)self runTime], fabs(v19) == INFINITY))
  {
    id v87 = 0;
  }
  else
  {
    [(BMActivitySchedulerActivityProfile *)self runTime];
    int v20 = NSNumber;
    [(BMActivitySchedulerActivityProfile *)self runTime];
    objc_msgSend(v20, "numberWithDouble:");
    id v87 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ([(BMActivitySchedulerActivityProfile *)self hasRusageProfSuccess])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMActivitySchedulerActivityProfile rusageProfSuccess](self, "rusageProfSuccess"));
    id v86 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v86 = 0;
  }
  if ([(BMActivitySchedulerActivityProfile *)self hasServicedEnergy])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMActivitySchedulerActivityProfile servicedEnergy](self, "servicedEnergy"));
    id v85 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v85 = 0;
  }
  if ([(BMActivitySchedulerActivityProfile *)self hasSessionProfSuccess])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMActivitySchedulerActivityProfile sessionProfSuccess](self, "sessionProfSuccess"));
    id v84 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v84 = 0;
  }
  if ([(BMActivitySchedulerActivityProfile *)self hasStartBatteryTemperature])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMActivitySchedulerActivityProfile startBatteryTemperature](self, "startBatteryTemperature"));
    id v83 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v83 = 0;
  }
  double v21 = [(BMActivitySchedulerActivityProfile *)self startTime];
  if (v21)
  {
    double v22 = NSNumber;
    double v23 = [(BMActivitySchedulerActivityProfile *)self startTime];
    [v23 timeIntervalSince1970];
    objc_msgSend(v22, "numberWithDouble:");
    id v82 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v82 = 0;
  }

  if ([(BMActivitySchedulerActivityProfile *)self hasStartedInIdle])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMActivitySchedulerActivityProfile startedInIdle](self, "startedInIdle"));
    id v81 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v81 = 0;
  }
  if ([(BMActivitySchedulerActivityProfile *)self hasStartedOnBattery])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMActivitySchedulerActivityProfile startedOnBattery](self, "startedOnBattery"));
    id v80 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v80 = 0;
  }
  if ([(BMActivitySchedulerActivityProfile *)self hasVersion])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMActivitySchedulerActivityProfile version](self, "version"));
    id v79 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v79 = 0;
  }
  if ([(BMActivitySchedulerActivityProfile *)self hasWifiDown])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMActivitySchedulerActivityProfile wifiDown](self, "wifiDown"));
    id v78 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v78 = 0;
  }
  if ([(BMActivitySchedulerActivityProfile *)self hasWifiUp])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMActivitySchedulerActivityProfile wifiUp](self, "wifiUp"));
    id v77 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v77 = 0;
  }
  if ([(BMActivitySchedulerActivityProfile *)self hasDirtyMemoryDelta])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMActivitySchedulerActivityProfile dirtyMemoryDelta](self, "dirtyMemoryDelta"));
    id v74 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v74 = 0;
  }
  v94[0] = @"bundleID";
  uint64_t v24 = (uint64_t)v3;
  if (!v3)
  {
    uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v67 = (void *)v24;
  v95[0] = v24;
  v94[1] = @"activityname";
  uint64_t v25 = v4;
  if (!v4)
  {
    uint64_t v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v66 = (void *)v25;
  v95[1] = v25;
  v94[2] = @"completed";
  uint64_t v26 = (uint64_t)v5;
  if (!v5)
  {
    uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
  }
  v65 = (void *)v26;
  v95[2] = v26;
  v94[3] = @"CPUAwakeTime";
  uint64_t v27 = (uint64_t)v6;
  if (!v6)
  {
    uint64_t v27 = [MEMORY[0x1E4F1CA98] null];
  }
  v64 = (void *)v27;
  v95[3] = v27;
  v94[4] = @"CPUTime";
  uint64_t v28 = (uint64_t)v9;
  if (!v9)
  {
    uint64_t v28 = [MEMORY[0x1E4F1CA98] null];
  }
  v63 = (void *)v28;
  v95[4] = v28;
  v94[5] = @"endBatteryTemperature";
  uint64_t v29 = (uint64_t)v76;
  if (!v76)
  {
    uint64_t v29 = [MEMORY[0x1E4F1CA98] null];
  }
  v69 = v6;
  v62 = (void *)v29;
  v95[5] = v29;
  v94[6] = @"endTime";
  uint64_t v30 = (uint64_t)v75;
  if (!v75)
  {
    uint64_t v30 = [MEMORY[0x1E4F1CA98] null];
  }
  int v31 = (void *)v4;
  int v61 = (void *)v30;
  v95[6] = v30;
  v94[7] = @"endedInIdle";
  uint64_t v32 = (uint64_t)v93;
  if (!v93)
  {
    uint64_t v32 = [MEMORY[0x1E4F1CA98] null];
  }
  v95[7] = v32;
  v94[8] = @"endedOnBattery";
  int v33 = v92;
  if (!v92)
  {
    int v33 = [MEMORY[0x1E4F1CA98] null];
  }
  v95[8] = v33;
  v94[9] = @"networkProfSuccess";
  uint64_t v34 = (uint64_t)v91;
  if (!v91)
  {
    uint64_t v34 = [MEMORY[0x1E4F1CA98] null];
  }
  v95[9] = v34;
  v94[10] = @"qosBackground";
  uint64_t v35 = (uint64_t)v90;
  if (!v90)
  {
    uint64_t v35 = [MEMORY[0x1E4F1CA98] null];
  }
  v95[10] = v35;
  v94[11] = @"qosLegacy";
  uint64_t v36 = (uint64_t)v89;
  if (!v89)
  {
    uint64_t v36 = [MEMORY[0x1E4F1CA98] null];
  }
  v95[11] = v36;
  v94[12] = @"qosUserInit";
  uint64_t v37 = (uint64_t)v88;
  if (!v88)
  {
    uint64_t v37 = [MEMORY[0x1E4F1CA98] null];
  }
  v71 = (void *)v37;
  v95[12] = v37;
  v94[13] = @"runTime";
  uint64_t v38 = (uint64_t)v87;
  if (!v87)
  {
    uint64_t v38 = [MEMORY[0x1E4F1CA98] null];
  }
  v70 = (void *)v38;
  v95[13] = v38;
  v94[14] = @"rusageProfSuccess";
  uint64_t v39 = (uint64_t)v86;
  if (!v86)
  {
    uint64_t v39 = [MEMORY[0x1E4F1CA98] null];
  }
  double v40 = (void *)v39;
  v95[14] = v39;
  v94[15] = @"servicedEnergy";
  uint64_t v41 = (uint64_t)v85;
  if (!v85)
  {
    uint64_t v41 = [MEMORY[0x1E4F1CA98] null];
  }
  int v56 = (void *)v41;
  v95[15] = v41;
  v94[16] = @"sessionProfSuccess";
  uint64_t v42 = (uint64_t)v84;
  if (!v84)
  {
    uint64_t v42 = [MEMORY[0x1E4F1CA98] null];
  }
  v73 = v5;
  int v55 = (void *)v42;
  v95[16] = v42;
  v94[17] = @"startBatteryTemperature";
  uint64_t v43 = (uint64_t)v83;
  if (!v83)
  {
    uint64_t v43 = [MEMORY[0x1E4F1CA98] null];
  }
  int v58 = (void *)v35;
  v54 = (void *)v43;
  v95[17] = v43;
  v94[18] = @"startTime";
  uint64_t v44 = (uint64_t)v82;
  if (!v82)
  {
    uint64_t v44 = [MEMORY[0x1E4F1CA98] null];
  }
  v53 = (void *)v44;
  v95[18] = v44;
  v94[19] = @"startedInIdle";
  double v45 = v81;
  if (!v81)
  {
    double v45 = [MEMORY[0x1E4F1CA98] null];
  }
  v72 = v9;
  v95[19] = v45;
  v94[20] = @"startedOnBattery";
  int v46 = v80;
  if (!v80)
  {
    int v46 = [MEMORY[0x1E4F1CA98] null];
  }
  int v57 = (void *)v36;
  v95[20] = v46;
  v94[21] = @"version";
  int v47 = v79;
  if (!v79)
  {
    int v47 = [MEMORY[0x1E4F1CA98] null];
  }
  int v60 = (void *)v32;
  v95[21] = v47;
  v94[22] = @"wifiDown";
  int v48 = v78;
  if (!v78)
  {
    int v48 = [MEMORY[0x1E4F1CA98] null];
  }
  int v59 = (void *)v34;
  v95[22] = v48;
  v94[23] = @"wifiUp";
  int v49 = v77;
  if (!v77)
  {
    int v49 = [MEMORY[0x1E4F1CA98] null];
  }
  v95[23] = v49;
  v94[24] = @"dirtyMemoryDelta";
  v50 = v74;
  if (!v74)
  {
    v50 = [MEMORY[0x1E4F1CA98] null];
  }
  v95[24] = v50;
  id v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v95 forKeys:v94 count:25];
  if (!v74) {

  }
  uint64_t v51 = v40;
  if (!v77)
  {

    uint64_t v51 = v40;
  }
  if (!v78)
  {

    uint64_t v51 = v40;
  }
  if (!v79)
  {

    uint64_t v51 = v40;
  }
  if (!v80)
  {

    uint64_t v51 = v40;
  }
  if (!v81)
  {

    uint64_t v51 = v40;
  }
  if (!v82)
  {

    uint64_t v51 = v40;
  }
  if (!v83)
  {

    uint64_t v51 = v40;
  }
  if (!v84)
  {

    uint64_t v51 = v40;
  }
  if (!v85)
  {

    uint64_t v51 = v40;
  }
  if (!v86) {

  }
  if (!v87) {
  if (!v88)
  }

  if (!v89) {
  if (!v90)
  }

  if (!v91) {
  if (!v92)
  }

  if (v93)
  {
    if (v75) {
      goto LABEL_161;
    }
  }
  else
  {

    if (v75)
    {
LABEL_161:
      if (v76) {
        goto LABEL_162;
      }
      goto LABEL_172;
    }
  }

  if (v76)
  {
LABEL_162:
    if (v72) {
      goto LABEL_163;
    }
    goto LABEL_173;
  }
LABEL_172:

  if (v72)
  {
LABEL_163:
    if (v69) {
      goto LABEL_164;
    }
    goto LABEL_174;
  }
LABEL_173:

  if (v69)
  {
LABEL_164:
    if (v73) {
      goto LABEL_165;
    }
    goto LABEL_175;
  }
LABEL_174:

  if (v73)
  {
LABEL_165:
    if (v31) {
      goto LABEL_166;
    }
LABEL_176:

    if (v3) {
      goto LABEL_167;
    }
    goto LABEL_177;
  }
LABEL_175:

  if (!v31) {
    goto LABEL_176;
  }
LABEL_166:
  if (v3) {
    goto LABEL_167;
  }
LABEL_177:

LABEL_167:

  return v68;
}

- (BMActivitySchedulerActivityProfile)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v304[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [v6 objectForKeyedSubscript:@"bundleID"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v254 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v254 = v7;
LABEL_4:
    v8 = [v6 objectForKeyedSubscript:@"activityname"];
    if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v253 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v253 = v8;
LABEL_7:
      id v9 = [v6 objectForKeyedSubscript:@"completed"];
      if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v250 = 0;
        goto LABEL_10;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v250 = v9;
LABEL_10:
        uint64_t v10 = [v6 objectForKeyedSubscript:@"CPUAwakeTime"];
        v251 = (void *)v10;
        if (!v10 || (int v11 = (void *)v10, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v247 = 0;
          goto LABEL_13;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v247 = v11;
LABEL_13:
          uint64_t v12 = [v6 objectForKeyedSubscript:@"CPUTime"];
          v249 = (void *)v12;
          if (!v12 || (double v13 = (void *)v12, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            id v248 = 0;
            goto LABEL_16;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v248 = v13;
LABEL_16:
            uint64_t v14 = [v6 objectForKeyedSubscript:@"endBatteryTemperature"];
            v246 = (void *)v14;
            if (!v14 || (double v15 = (void *)v14, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              id v245 = 0;
LABEL_19:
              id v16 = [v6 objectForKeyedSubscript:@"endTime"];
              v244 = v16;
              if (!v16)
              {
LABEL_53:
                id v241 = v16;
                uint64_t v64 = [v6 objectForKeyedSubscript:@"endedInIdle"];
                v243 = (void *)v64;
                if (!v64)
                {
                  id v242 = 0;
                  v66 = a4;
                  goto LABEL_59;
                }
                v65 = (void *)v64;
                objc_opt_class();
                v66 = a4;
                if (objc_opt_isKindOfClass())
                {
                  id v242 = 0;
                  goto LABEL_59;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v242 = v65;
LABEL_59:
                  uint64_t v67 = [v6 objectForKeyedSubscript:@"endedOnBattery"];
                  v240 = (void *)v67;
                  if (!v67 || (id v68 = (void *)v67, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    id v239 = 0;
                    goto LABEL_62;
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v239 = v68;
LABEL_62:
                    uint64_t v69 = [v6 objectForKeyedSubscript:@"networkProfSuccess"];
                    v237 = (void *)v69;
                    if (!v69 || (v70 = (void *)v69, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      id v236 = 0;
                      goto LABEL_65;
                    }
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v236 = v70;
LABEL_65:
                      uint64_t v71 = [v6 objectForKeyedSubscript:@"qosBackground"];
                      v235 = (void *)v71;
                      if (!v71 || (v72 = (void *)v71, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        id v234 = 0;
                        goto LABEL_68;
                      }
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        id v234 = v72;
LABEL_68:
                        uint64_t v73 = [v6 objectForKeyedSubscript:@"qosLegacy"];
                        v232 = (void *)v73;
                        if (!v73 || (id v74 = (void *)v73, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                        {
                          id v233 = 0;
                          goto LABEL_71;
                        }
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          id v233 = v74;
LABEL_71:
                          uint64_t v75 = [v6 objectForKeyedSubscript:@"qosUserInit"];
                          v230 = (void *)v75;
                          if (!v75 || (id v76 = (void *)v75, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            id v231 = 0;
                            goto LABEL_74;
                          }
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            id v231 = v76;
LABEL_74:
                            uint64_t v77 = [v6 objectForKeyedSubscript:@"runTime"];
                            v228 = (void *)v77;
                            if (!v77 || (id v78 = (void *)v77, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                            {
                              id v229 = 0;
                              goto LABEL_77;
                            }
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              id v229 = v78;
LABEL_77:
                              uint64_t v79 = [v6 objectForKeyedSubscript:@"rusageProfSuccess"];
                              v226 = (void *)v79;
                              if (!v79 || (id v80 = (void *)v79, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                              {
                                id v227 = 0;
                                goto LABEL_80;
                              }
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                id v227 = v80;
LABEL_80:
                                uint64_t v81 = [v6 objectForKeyedSubscript:@"servicedEnergy"];
                                v224 = (void *)v81;
                                if (!v81 || (id v82 = (void *)v81, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                {
                                  id v225 = 0;
                                  goto LABEL_83;
                                }
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  id v225 = v82;
LABEL_83:
                                  uint64_t v83 = [v6 objectForKeyedSubscript:@"sessionProfSuccess"];
                                  v222 = (void *)v83;
                                  if (!v83
                                    || (id v84 = (void *)v83, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                  {
                                    id v223 = 0;
                                    goto LABEL_86;
                                  }
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    id v223 = v84;
LABEL_86:
                                    uint64_t v85 = [v6 objectForKeyedSubscript:@"startBatteryTemperature"];
                                    v220 = (void *)v85;
                                    if (!v85
                                      || (id v86 = (void *)v85, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                    {
                                      id v221 = 0;
                                      goto LABEL_89;
                                    }
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      id v221 = v86;
LABEL_89:
                                      uint64_t v87 = [v6 objectForKeyedSubscript:@"startTime"];
                                      v216 = (void *)v87;
                                      if (!v87
                                        || (id v88 = (void *)v87, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                      {
                                        id v218 = 0;
                                        goto LABEL_161;
                                      }
                                      objc_opt_class();
                                      if (objc_opt_isKindOfClass())
                                      {
                                        id v124 = v88;
                                        id v125 = objc_alloc(MEMORY[0x1E4F1C9C8]);
                                        [v124 doubleValue];
                                        id v218 = (id)objc_msgSend(v125, "initWithTimeIntervalSince1970:");
LABEL_160:

                                        goto LABEL_161;
                                      }
                                      objc_opt_class();
                                      if (objc_opt_isKindOfClass())
                                      {
                                        id v124 = objc_alloc_init(MEMORY[0x1E4F28D48]);
                                        id v152 = v88;
                                        id v218 = [v124 dateFromString:v152];

                                        goto LABEL_160;
                                      }
                                      objc_opt_class();
                                      if (objc_opt_isKindOfClass())
                                      {
                                        id v218 = v88;
LABEL_161:
                                        uint64_t v153 = [v6 objectForKeyedSubscript:@"startedInIdle"];
                                        v214 = (void *)v153;
                                        if (!v153
                                          || (v154 = (void *)v153, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                        {
                                          id v217 = 0;
                                          goto LABEL_164;
                                        }
                                        objc_opt_class();
                                        if (objc_opt_isKindOfClass())
                                        {
                                          id v217 = v154;
LABEL_164:
                                          uint64_t v155 = [v6 objectForKeyedSubscript:@"startedOnBattery"];
                                          v213 = (void *)v155;
                                          if (!v155
                                            || (v156 = (void *)v155,
                                                objc_opt_class(),
                                                (objc_opt_isKindOfClass() & 1) != 0))
                                          {
                                            id v215 = 0;
                                            goto LABEL_167;
                                          }
                                          objc_opt_class();
                                          if (objc_opt_isKindOfClass())
                                          {
                                            id v215 = v156;
LABEL_167:
                                            uint64_t v157 = [v6 objectForKeyedSubscript:@"version"];
                                            v210 = (void *)v157;
                                            if (!v157
                                              || (v158 = (void *)v157,
                                                  objc_opt_class(),
                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                            {
                                              id v212 = 0;
                                              goto LABEL_170;
                                            }
                                            objc_opt_class();
                                            if (objc_opt_isKindOfClass())
                                            {
                                              id v212 = v158;
LABEL_170:
                                              uint64_t v159 = [v6 objectForKeyedSubscript:@"wifiDown"];
                                              v208 = (void *)v159;
                                              if (!v159
                                                || (v160 = (void *)v159,
                                                    objc_opt_class(),
                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                              {
                                                id v211 = 0;
                                                goto LABEL_173;
                                              }
                                              objc_opt_class();
                                              if (objc_opt_isKindOfClass())
                                              {
                                                id v211 = v160;
LABEL_173:
                                                uint64_t v161 = [v6 objectForKeyedSubscript:@"wifiUp"];
                                                v207 = (void *)v161;
                                                if (!v161
                                                  || (v162 = (void *)v161,
                                                      objc_opt_class(),
                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                {
                                                  id v209 = 0;
LABEL_176:
                                                  id v163 = [v6 objectForKeyedSubscript:@"dirtyMemoryDelta"];
                                                  v206 = v163;
                                                  if (!v163)
                                                  {
LABEL_179:
                                                    uint64_t v25 = v250;
                                                    uint64_t v38 = v247;
LABEL_180:
                                                    v165 = v163;
                                                    int v61 = v241;
                                                    self = objc_retain(-[BMActivitySchedulerActivityProfile initWithBundleID:activityname:completed:CPUAwakeTime:CPUTime:endBatteryTemperature:endTime:endedInIdle:endedOnBattery:networkProfSuccess:qosBackground:qosLegacy:qosUserInit:runTime:rusageProfSuccess:servicedEnergy:sessionProfSuccess:startBatteryTemperature:startTime:startedInIdle:startedOnBattery:version:wifiDown:wifiUp:dirtyMemoryDelta:](self, "initWithBundleID:activityname:completed:CPUAwakeTime:CPUTime:endBatteryTemperature:endTime:endedInIdle:endedOnBattery:networkProfSuccess:qosBackground:qosLegacy:qosUserInit:runTime:rusageProfSuccess:servicedEnergy:sessionProfSuccess:startBatteryTemperature:startTime:startedInIdle:startedOnBattery:version:wifiDown:wifiUp:dirtyMemoryDelta:", v254, v253, v25, v38, v248, v245, v241, v242, v239, v236, v234,
                                                               v233,
                                                               v231,
                                                               v229,
                                                               v227,
                                                               v225,
                                                               v223,
                                                               v221,
                                                               v218,
                                                               v217,
                                                               v215,
                                                               v212,
                                                               v211,
                                                               v209,
                                                               v163));
                                                    int v20 = self;
LABEL_220:

LABEL_221:
LABEL_222:

LABEL_223:
LABEL_224:

LABEL_225:
                                                    goto LABEL_226;
                                                  }
                                                  v164 = v163;
                                                  objc_opt_class();
                                                  if (objc_opt_isKindOfClass())
                                                  {
                                                    id v163 = 0;
                                                    goto LABEL_179;
                                                  }
                                                  objc_opt_class();
                                                  uint64_t v25 = v250;
                                                  uint64_t v38 = v247;
                                                  if (objc_opt_isKindOfClass())
                                                  {
                                                    id v163 = v164;
                                                    goto LABEL_180;
                                                  }
                                                  if (v66)
                                                  {
                                                    id v193 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                    v194 = self;
                                                    uint64_t v195 = *MEMORY[0x1E4F502C8];
                                                    uint64_t v255 = *MEMORY[0x1E4F28568];
                                                    v196 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"dirtyMemoryDelta"];
                                                    v256 = v196;
                                                    v197 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v256 forKeys:&v255 count:1];
                                                    uint64_t v198 = v195;
                                                    self = v194;
                                                    id *v66 = (id)[v193 initWithDomain:v198 code:2 userInfo:v197];

                                                    uint64_t v38 = v247;
                                                    uint64_t v25 = v250;
                                                  }
                                                  v165 = 0;
                                                  int v20 = 0;
LABEL_219:
                                                  int v61 = v241;
                                                  goto LABEL_220;
                                                }
                                                objc_opt_class();
                                                if (objc_opt_isKindOfClass())
                                                {
                                                  id v209 = v162;
                                                  goto LABEL_176;
                                                }
                                                if (v66)
                                                {
                                                  id v186 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                  v238 = v7;
                                                  v187 = v8;
                                                  v188 = v9;
                                                  v189 = self;
                                                  uint64_t v190 = *MEMORY[0x1E4F502C8];
                                                  uint64_t v257 = *MEMORY[0x1E4F28568];
                                                  v165 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"wifiUp"];
                                                  v258 = v165;
                                                  uint64_t v191 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v258 forKeys:&v257 count:1];
                                                  uint64_t v192 = v190;
                                                  self = v189;
                                                  id v9 = v188;
                                                  v8 = v187;
                                                  double v7 = v238;
                                                  v206 = (void *)v191;
                                                  int v20 = 0;
                                                  id v209 = 0;
                                                  id *v66 = (id)objc_msgSend(v186, "initWithDomain:code:userInfo:", v192, 2);
                                                  uint64_t v25 = v250;
                                                  uint64_t v38 = v247;
                                                  goto LABEL_219;
                                                }
                                                id v209 = 0;
                                                int v20 = 0;
LABEL_256:
                                                uint64_t v25 = v250;
                                                uint64_t v38 = v247;
                                                int v61 = v241;
                                                goto LABEL_221;
                                              }
                                              if (v66)
                                              {
                                                id v181 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                v182 = self;
                                                uint64_t v183 = *MEMORY[0x1E4F502C8];
                                                uint64_t v259 = *MEMORY[0x1E4F28568];
                                                id v209 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"wifiDown"];
                                                id v260 = v209;
                                                uint64_t v184 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v260 forKeys:&v259 count:1];
                                                uint64_t v185 = v183;
                                                self = v182;
                                                v207 = (void *)v184;
                                                int v20 = 0;
                                                id v211 = 0;
                                                id *v66 = (id)objc_msgSend(v181, "initWithDomain:code:userInfo:", v185, 2);
                                                goto LABEL_256;
                                              }
                                              id v211 = 0;
                                              int v20 = 0;
LABEL_254:
                                              uint64_t v25 = v250;
                                              uint64_t v38 = v247;
                                              int v61 = v241;
                                              goto LABEL_222;
                                            }
                                            if (v66)
                                            {
                                              id v176 = objc_alloc(MEMORY[0x1E4F28C58]);
                                              v177 = self;
                                              uint64_t v178 = *MEMORY[0x1E4F502C8];
                                              uint64_t v261 = *MEMORY[0x1E4F28568];
                                              id v211 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"version"];
                                              id v262 = v211;
                                              uint64_t v179 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v262 forKeys:&v261 count:1];
                                              uint64_t v180 = v178;
                                              self = v177;
                                              v208 = (void *)v179;
                                              int v20 = 0;
                                              id v212 = 0;
                                              id *v66 = (id)objc_msgSend(v176, "initWithDomain:code:userInfo:", v180, 2);
                                              goto LABEL_254;
                                            }
                                            id v212 = 0;
                                            int v20 = 0;
LABEL_249:
                                            uint64_t v25 = v250;
                                            uint64_t v38 = v247;
                                            int v61 = v241;
                                            goto LABEL_223;
                                          }
                                          if (v66)
                                          {
                                            id v171 = objc_alloc(MEMORY[0x1E4F28C58]);
                                            v172 = self;
                                            uint64_t v173 = *MEMORY[0x1E4F502C8];
                                            uint64_t v263 = *MEMORY[0x1E4F28568];
                                            id v212 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"startedOnBattery"];
                                            id v264 = v212;
                                            uint64_t v174 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v264 forKeys:&v263 count:1];
                                            uint64_t v175 = v173;
                                            self = v172;
                                            v210 = (void *)v174;
                                            int v20 = 0;
                                            id v215 = 0;
                                            id *v66 = (id)objc_msgSend(v171, "initWithDomain:code:userInfo:", v175, 2);
                                            goto LABEL_249;
                                          }
                                          id v215 = 0;
                                          int v20 = 0;
LABEL_247:
                                          uint64_t v25 = v250;
                                          uint64_t v38 = v247;
                                          int v61 = v241;
                                          goto LABEL_224;
                                        }
                                        if (v66)
                                        {
                                          id v166 = objc_alloc(MEMORY[0x1E4F28C58]);
                                          v167 = self;
                                          uint64_t v168 = *MEMORY[0x1E4F502C8];
                                          uint64_t v265 = *MEMORY[0x1E4F28568];
                                          id v215 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"startedInIdle"];
                                          id v266 = v215;
                                          uint64_t v169 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v266 forKeys:&v265 count:1];
                                          uint64_t v170 = v168;
                                          self = v167;
                                          v213 = (void *)v169;
                                          int v20 = 0;
                                          id v217 = 0;
                                          id *v66 = (id)objc_msgSend(v166, "initWithDomain:code:userInfo:", v170, 2);
                                          goto LABEL_247;
                                        }
                                        id v217 = 0;
                                        int v20 = 0;
LABEL_252:
                                        uint64_t v25 = v250;
                                        uint64_t v38 = v247;
                                        int v61 = v241;
                                        goto LABEL_225;
                                      }
                                      if (v66)
                                      {
                                        id v219 = objc_alloc(MEMORY[0x1E4F28C58]);
                                        v200 = self;
                                        uint64_t v201 = *MEMORY[0x1E4F502C8];
                                        uint64_t v267 = *MEMORY[0x1E4F28568];
                                        id v217 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"startTime"];
                                        id v268 = v217;
                                        uint64_t v202 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v268 forKeys:&v267 count:1];
                                        uint64_t v203 = v201;
                                        self = v200;
                                        v214 = (void *)v202;
                                        id v204 = (id)objc_msgSend(v219, "initWithDomain:code:userInfo:", v203, 2);
                                        id v218 = 0;
                                        int v20 = 0;
                                        id *v66 = v204;
                                        goto LABEL_252;
                                      }
                                      id v218 = 0;
                                      int v20 = 0;
LABEL_155:
                                      uint64_t v25 = v250;
                                      uint64_t v38 = v247;
                                      int v61 = v241;
LABEL_226:

                                      goto LABEL_227;
                                    }
                                    if (v66)
                                    {
                                      id v147 = objc_alloc(MEMORY[0x1E4F28C58]);
                                      v148 = self;
                                      uint64_t v149 = *MEMORY[0x1E4F502C8];
                                      uint64_t v269 = *MEMORY[0x1E4F28568];
                                      id v218 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"startBatteryTemperature"];
                                      id v270 = v218;
                                      uint64_t v150 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v270 forKeys:&v269 count:1];
                                      uint64_t v151 = v149;
                                      self = v148;
                                      v216 = (void *)v150;
                                      id v221 = 0;
                                      int v20 = 0;
                                      id *v66 = (id)objc_msgSend(v147, "initWithDomain:code:userInfo:", v151, 2);
                                      goto LABEL_155;
                                    }
                                    id v221 = 0;
                                    int v20 = 0;
LABEL_215:
                                    uint64_t v25 = v250;
                                    uint64_t v38 = v247;
                                    int v61 = v241;
LABEL_227:

                                    goto LABEL_228;
                                  }
                                  if (v66)
                                  {
                                    id v142 = objc_alloc(MEMORY[0x1E4F28C58]);
                                    v143 = self;
                                    uint64_t v144 = *MEMORY[0x1E4F502C8];
                                    uint64_t v271 = *MEMORY[0x1E4F28568];
                                    id v221 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"sessionProfSuccess"];
                                    id v272 = v221;
                                    uint64_t v145 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v272 forKeys:&v271 count:1];
                                    uint64_t v146 = v144;
                                    self = v143;
                                    v220 = (void *)v145;
                                    id v223 = 0;
                                    int v20 = 0;
                                    id *v66 = (id)objc_msgSend(v142, "initWithDomain:code:userInfo:", v146, 2);
                                    goto LABEL_215;
                                  }
                                  id v223 = 0;
                                  int v20 = 0;
LABEL_209:
                                  uint64_t v25 = v250;
                                  uint64_t v38 = v247;
                                  int v61 = v241;
LABEL_228:

                                  goto LABEL_229;
                                }
                                if (v66)
                                {
                                  id v137 = objc_alloc(MEMORY[0x1E4F28C58]);
                                  v138 = self;
                                  uint64_t v139 = *MEMORY[0x1E4F502C8];
                                  uint64_t v273 = *MEMORY[0x1E4F28568];
                                  id v223 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"servicedEnergy"];
                                  id v274 = v223;
                                  uint64_t v140 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v274 forKeys:&v273 count:1];
                                  uint64_t v141 = v139;
                                  self = v138;
                                  v222 = (void *)v140;
                                  id v225 = 0;
                                  int v20 = 0;
                                  id *v66 = (id)objc_msgSend(v137, "initWithDomain:code:userInfo:", v141, 2);
                                  goto LABEL_209;
                                }
                                id v225 = 0;
                                int v20 = 0;
LABEL_205:
                                uint64_t v25 = v250;
                                uint64_t v38 = v247;
                                int v61 = v241;
LABEL_229:

                                goto LABEL_230;
                              }
                              if (v66)
                              {
                                id v126 = objc_alloc(MEMORY[0x1E4F28C58]);
                                v127 = self;
                                uint64_t v128 = *MEMORY[0x1E4F502C8];
                                uint64_t v275 = *MEMORY[0x1E4F28568];
                                id v225 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"rusageProfSuccess"];
                                id v276 = v225;
                                uint64_t v129 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v276 forKeys:&v275 count:1];
                                uint64_t v130 = v128;
                                self = v127;
                                v224 = (void *)v129;
                                id v227 = 0;
                                int v20 = 0;
                                id *v66 = (id)objc_msgSend(v126, "initWithDomain:code:userInfo:", v130, 2);
                                goto LABEL_205;
                              }
                              id v227 = 0;
                              int v20 = 0;
LABEL_200:
                              uint64_t v25 = v250;
                              uint64_t v38 = v247;
                              int v61 = v241;
LABEL_230:

                              goto LABEL_231;
                            }
                            if (v66)
                            {
                              id v119 = objc_alloc(MEMORY[0x1E4F28C58]);
                              v120 = self;
                              uint64_t v121 = *MEMORY[0x1E4F502C8];
                              uint64_t v277 = *MEMORY[0x1E4F28568];
                              id v227 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"runTime"];
                              id v278 = v227;
                              uint64_t v122 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v278 forKeys:&v277 count:1];
                              uint64_t v123 = v121;
                              self = v120;
                              v226 = (void *)v122;
                              id v229 = 0;
                              int v20 = 0;
                              id *v66 = (id)objc_msgSend(v119, "initWithDomain:code:userInfo:", v123, 2);
                              goto LABEL_200;
                            }
                            id v229 = 0;
                            int v20 = 0;
LABEL_194:
                            uint64_t v25 = v250;
                            uint64_t v38 = v247;
                            int v61 = v241;
LABEL_231:

                            goto LABEL_232;
                          }
                          if (v66)
                          {
                            id v114 = objc_alloc(MEMORY[0x1E4F28C58]);
                            v115 = self;
                            uint64_t v116 = *MEMORY[0x1E4F502C8];
                            uint64_t v279 = *MEMORY[0x1E4F28568];
                            id v229 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"qosUserInit"];
                            id v280 = v229;
                            uint64_t v117 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v280 forKeys:&v279 count:1];
                            uint64_t v118 = v116;
                            self = v115;
                            v228 = (void *)v117;
                            id v231 = 0;
                            int v20 = 0;
                            id *v66 = (id)objc_msgSend(v114, "initWithDomain:code:userInfo:", v118, 2);
                            goto LABEL_194;
                          }
                          id v231 = 0;
                          int v20 = 0;
LABEL_157:
                          uint64_t v25 = v250;
                          uint64_t v38 = v247;
                          int v61 = v241;
LABEL_232:

                          goto LABEL_233;
                        }
                        if (v66)
                        {
                          id v109 = objc_alloc(MEMORY[0x1E4F28C58]);
                          v110 = self;
                          uint64_t v111 = *MEMORY[0x1E4F502C8];
                          uint64_t v281 = *MEMORY[0x1E4F28568];
                          id v231 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"qosLegacy"];
                          id v282 = v231;
                          uint64_t v112 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v282 forKeys:&v281 count:1];
                          uint64_t v113 = v111;
                          self = v110;
                          v230 = (void *)v112;
                          id v233 = 0;
                          int v20 = 0;
                          id *v66 = (id)objc_msgSend(v109, "initWithDomain:code:userInfo:", v113, 2);
                          goto LABEL_157;
                        }
                        id v233 = 0;
                        int v20 = 0;
LABEL_152:
                        uint64_t v25 = v250;
                        uint64_t v38 = v247;
                        int v61 = v241;
LABEL_233:

                        goto LABEL_234;
                      }
                      if (v66)
                      {
                        id v104 = objc_alloc(MEMORY[0x1E4F28C58]);
                        v105 = self;
                        uint64_t v106 = *MEMORY[0x1E4F502C8];
                        uint64_t v283 = *MEMORY[0x1E4F28568];
                        id v233 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"qosBackground"];
                        id v284 = v233;
                        uint64_t v107 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v284 forKeys:&v283 count:1];
                        uint64_t v108 = v106;
                        self = v105;
                        v232 = (void *)v107;
                        id v234 = 0;
                        int v20 = 0;
                        id *v66 = (id)objc_msgSend(v104, "initWithDomain:code:userInfo:", v108, 2);
                        goto LABEL_152;
                      }
                      id v234 = 0;
                      int v20 = 0;
LABEL_148:
                      uint64_t v25 = v250;
                      uint64_t v38 = v247;
                      int v61 = v241;
LABEL_234:

                      goto LABEL_235;
                    }
                    if (v66)
                    {
                      id v99 = objc_alloc(MEMORY[0x1E4F28C58]);
                      v100 = self;
                      uint64_t v101 = *MEMORY[0x1E4F502C8];
                      uint64_t v285 = *MEMORY[0x1E4F28568];
                      id v234 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"networkProfSuccess"];
                      id v286 = v234;
                      uint64_t v102 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v286 forKeys:&v285 count:1];
                      uint64_t v103 = v101;
                      self = v100;
                      v235 = (void *)v102;
                      id v236 = 0;
                      int v20 = 0;
                      id *v66 = (id)objc_msgSend(v99, "initWithDomain:code:userInfo:", v103, 2);
                      goto LABEL_148;
                    }
                    id v236 = 0;
                    int v20 = 0;
LABEL_142:
                    uint64_t v25 = v250;
                    uint64_t v38 = v247;
                    int v61 = v241;
LABEL_235:

                    goto LABEL_236;
                  }
                  if (v66)
                  {
                    id v94 = objc_alloc(MEMORY[0x1E4F28C58]);
                    v95 = self;
                    uint64_t v96 = *MEMORY[0x1E4F502C8];
                    uint64_t v287 = *MEMORY[0x1E4F28568];
                    id v236 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"endedOnBattery"];
                    id v288 = v236;
                    uint64_t v97 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v288 forKeys:&v287 count:1];
                    uint64_t v98 = v96;
                    self = v95;
                    v237 = (void *)v97;
                    id v239 = 0;
                    int v20 = 0;
                    id *v66 = (id)objc_msgSend(v94, "initWithDomain:code:userInfo:", v98, 2);
                    goto LABEL_142;
                  }
                  id v239 = 0;
                  int v20 = 0;
LABEL_136:
                  uint64_t v25 = v250;
                  uint64_t v38 = v247;
                  int v61 = v241;
LABEL_236:

                  goto LABEL_237;
                }
                if (a4)
                {
                  id v89 = self;
                  id v90 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v91 = *MEMORY[0x1E4F502C8];
                  uint64_t v289 = *MEMORY[0x1E4F28568];
                  id v239 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"endedInIdle"];
                  id v290 = v239;
                  uint64_t v92 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v290 forKeys:&v289 count:1];
                  id v93 = v90;
                  self = v89;
                  v240 = (void *)v92;
                  id v242 = 0;
                  int v20 = 0;
                  id *v66 = (id)objc_msgSend(v93, "initWithDomain:code:userInfo:", v91, 2);
                  goto LABEL_136;
                }
                id v242 = 0;
                int v20 = 0;
                uint64_t v25 = v250;
                uint64_t v38 = v247;
                int v61 = v241;
LABEL_237:

                goto LABEL_238;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v16 = 0;
                goto LABEL_53;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v28 = v16;
                uint64_t v29 = self;
                id v30 = objc_alloc(MEMORY[0x1E4F1C9C8]);
                [v28 doubleValue];
                int v31 = v30;
                self = v29;
                id v16 = (id)objc_msgSend(v31, "initWithTimeIntervalSince1970:");
LABEL_52:

                goto LABEL_53;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v28 = objc_alloc_init(MEMORY[0x1E4F28D48]);
                v62 = self;
                id v63 = v16;
                id v16 = [v28 dateFromString:v63];

                self = v62;
                goto LABEL_52;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v16 = v16;
                goto LABEL_53;
              }
              if (a4)
              {
                id v131 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v132 = *MEMORY[0x1E4F502C8];
                uint64_t v291 = *MEMORY[0x1E4F28568];
                v133 = self;
                id v134 = [NSString alloc];
                uint64_t v205 = objc_opt_class();
                v135 = v134;
                self = v133;
                id v242 = (id)[v135 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", v205, @"endTime"];
                id v292 = v242;
                v243 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v292 forKeys:&v291 count:1];
                id v136 = (id)objc_msgSend(v131, "initWithDomain:code:userInfo:", v132, 2);
                int v61 = 0;
                int v20 = 0;
                *a4 = v136;
                uint64_t v25 = v250;
                uint64_t v38 = v247;
                goto LABEL_237;
              }
              int v61 = 0;
              int v20 = 0;
LABEL_48:
              uint64_t v25 = v250;
              uint64_t v38 = v247;
LABEL_238:

              goto LABEL_239;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v245 = v15;
              goto LABEL_19;
            }
            if (a4)
            {
              id v53 = objc_alloc(MEMORY[0x1E4F28C58]);
              v54 = a4;
              int v55 = self;
              uint64_t v56 = *MEMORY[0x1E4F502C8];
              uint64_t v293 = *MEMORY[0x1E4F28568];
              uint64_t v57 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"endBatteryTemperature"];
              uint64_t v294 = v57;
              uint64_t v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v294 forKeys:&v293 count:1];
              uint64_t v59 = v56;
              self = v55;
              v244 = (void *)v58;
              id v60 = (id)objc_msgSend(v53, "initWithDomain:code:userInfo:", v59, 2);
              id v245 = 0;
              int v20 = 0;
              id *v54 = v60;
              int v61 = (void *)v57;
              goto LABEL_48;
            }
            id v245 = 0;
            int v20 = 0;
LABEL_125:
            uint64_t v25 = v250;
            uint64_t v38 = v247;
LABEL_239:

            goto LABEL_240;
          }
          if (a4)
          {
            id v46 = objc_alloc(MEMORY[0x1E4F28C58]);
            int v47 = a4;
            int v48 = self;
            uint64_t v49 = *MEMORY[0x1E4F502C8];
            uint64_t v295 = *MEMORY[0x1E4F28568];
            id v245 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"CPUTime"];
            id v296 = v245;
            uint64_t v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v296 forKeys:&v295 count:1];
            uint64_t v51 = v49;
            self = v48;
            v246 = (void *)v50;
            id v52 = (id)objc_msgSend(v46, "initWithDomain:code:userInfo:", v51, 2);
            id v248 = 0;
            int v20 = 0;
            *int v47 = v52;
            goto LABEL_125;
          }
          id v248 = 0;
          int v20 = 0;
          uint64_t v25 = v250;
          uint64_t v38 = v247;
LABEL_240:

          goto LABEL_241;
        }
        if (a4)
        {
          id v39 = objc_alloc(MEMORY[0x1E4F28C58]);
          double v40 = a4;
          uint64_t v41 = self;
          uint64_t v42 = *MEMORY[0x1E4F502C8];
          uint64_t v297 = *MEMORY[0x1E4F28568];
          id v248 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"CPUAwakeTime"];
          id v298 = v248;
          uint64_t v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v298 forKeys:&v297 count:1];
          uint64_t v44 = v42;
          self = v41;
          v249 = (void *)v43;
          id v45 = (id)objc_msgSend(v39, "initWithDomain:code:userInfo:", v44, 2);
          uint64_t v38 = 0;
          int v20 = 0;
          *double v40 = v45;
          uint64_t v25 = v250;
          goto LABEL_240;
        }
        uint64_t v38 = 0;
        int v20 = 0;
        uint64_t v25 = v250;
LABEL_241:

        goto LABEL_242;
      }
      if (a4)
      {
        id v252 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v32 = self;
        uint64_t v33 = *MEMORY[0x1E4F502C8];
        uint64_t v299 = *MEMORY[0x1E4F28568];
        uint64_t v34 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"completed"];
        uint64_t v300 = v34;
        uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v300 forKeys:&v299 count:1];
        uint64_t v36 = v252;
        uint64_t v37 = v33;
        self = v32;
        uint64_t v38 = (void *)v34;
        v251 = (void *)v35;
        uint64_t v25 = 0;
        int v20 = 0;
        *a4 = (id)objc_msgSend(v36, "initWithDomain:code:userInfo:", v37, 2);
        goto LABEL_241;
      }
      uint64_t v25 = 0;
      int v20 = 0;
LABEL_242:

      goto LABEL_243;
    }
    if (a4)
    {
      id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
      double v22 = a4;
      double v23 = self;
      uint64_t v24 = *MEMORY[0x1E4F502C8];
      uint64_t v301 = *MEMORY[0x1E4F28568];
      uint64_t v25 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"activityname"];
      v302 = v25;
      id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v302 forKeys:&v301 count:1];
      uint64_t v26 = v24;
      self = v23;
      id v27 = (id)[v21 initWithDomain:v26 code:2 userInfo:v9];
      id v253 = 0;
      int v20 = 0;
      *double v22 = v27;
      goto LABEL_242;
    }
    id v253 = 0;
    int v20 = 0;
LABEL_243:

    goto LABEL_244;
  }
  if (a4)
  {
    id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v18 = *MEMORY[0x1E4F502C8];
    uint64_t v303 = *MEMORY[0x1E4F28568];
    id v253 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"bundleID"];
    v304[0] = v253;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v304 forKeys:&v303 count:1];
    id v19 = (id)[v17 initWithDomain:v18 code:2 userInfo:v8];
    id v254 = 0;
    int v20 = 0;
    *a4 = v19;
    goto LABEL_243;
  }
  id v254 = 0;
  int v20 = 0;
LABEL_244:

  return v20;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMActivitySchedulerActivityProfile *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_bundleID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_activityname)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasCompleted)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasCPUAwakeTime)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasCPUTime)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_hasEndBatteryTemperature)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasRaw_endTime)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_hasEndedInIdle)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasEndedOnBattery)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasNetworkProfSuccess)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasQosBackground)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_hasQosLegacy)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_hasQosUserInit)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_hasRunTime)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_hasRusageProfSuccess)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasServicedEnergy)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasSessionProfSuccess)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasStartBatteryTemperature)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasRaw_startTime)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_hasStartedInIdle)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasStartedOnBattery)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasVersion)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasWifiDown)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasWifiUp)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasDirtyMemoryDelta)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v149.receiver = self;
  v149.super_class = (Class)BMActivitySchedulerActivityProfile;
  id v5 = [(BMEventBase *)&v149 init];
  if (!v5) {
    goto LABEL_242;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  double v7 = (int *)MEMORY[0x1E4F940E0];
  v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    id v9 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v8]) {
        break;
      }
      char v10 = 0;
      unsigned int v11 = 0;
      unint64_t v12 = 0;
      while (1)
      {
        uint64_t v13 = *v6;
        uint64_t v14 = *(void *)&v4[v13];
        unint64_t v15 = v14 + 1;
        if (v14 == -1 || v15 > *(void *)&v4[*v7]) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)&v4[*v9] + v14);
        *(void *)&v4[v13] = v15;
        v12 |= (unint64_t)(v16 & 0x7F) << v10;
        if ((v16 & 0x80) == 0) {
          goto LABEL_13;
        }
        v10 += 7;
        BOOL v17 = v11++ >= 9;
        if (v17)
        {
          unint64_t v12 = 0;
          int v18 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      int v18 = v4[*v8];
      if (v4[*v8]) {
        unint64_t v12 = 0;
      }
LABEL_15:
      if (v18 || (v12 & 7) == 4) {
        break;
      }
      switch((v12 >> 3))
      {
        case 1u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 120;
          goto LABEL_24;
        case 2u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 128;
LABEL_24:
          double v22 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        case 3u:
          char v23 = 0;
          unsigned int v24 = 0;
          uint64_t v25 = 0;
          v5->_hasCompleted = 1;
          while (2)
          {
            uint64_t v26 = *v6;
            uint64_t v27 = *(void *)&v4[v26];
            unint64_t v28 = v27 + 1;
            if (v27 == -1 || v28 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v29 = *(unsigned char *)(*(void *)&v4[*v9] + v27);
              *(void *)&v4[v26] = v28;
              v25 |= (unint64_t)(v29 & 0x7F) << v23;
              if (v29 < 0)
              {
                v23 += 7;
                BOOL v17 = v24++ >= 9;
                if (v17)
                {
                  uint64_t v25 = 0;
                  goto LABEL_161;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v25 = 0;
          }
LABEL_161:
          BOOL v143 = v25 != 0;
          uint64_t v144 = 48;
          goto LABEL_206;
        case 4u:
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v32 = 0;
          v5->_hasCPUAwakeTime = 1;
          while (2)
          {
            uint64_t v33 = *v6;
            uint64_t v34 = *(void *)&v4[v33];
            unint64_t v35 = v34 + 1;
            if (v34 == -1 || v35 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v36 = *(unsigned char *)(*(void *)&v4[*v9] + v34);
              *(void *)&v4[v33] = v35;
              v32 |= (unint64_t)(v36 & 0x7F) << v30;
              if (v36 < 0)
              {
                v30 += 7;
                BOOL v17 = v31++ >= 9;
                if (v17)
                {
                  LODWORD(v32) = 0;
                  goto LABEL_165;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v32) = 0;
          }
LABEL_165:
          uint64_t v145 = 84;
          goto LABEL_223;
        case 5u:
          v5->_hasCPUTime = 1;
          uint64_t v37 = *v6;
          unint64_t v38 = *(void *)&v4[v37];
          if (v38 <= 0xFFFFFFFFFFFFFFF7 && v38 + 8 <= *(void *)&v4[*v7])
          {
            id v39 = *(objc_class **)(*(void *)&v4[*v9] + v38);
            *(void *)&v4[v37] = v38 + 8;
          }
          else
          {
            v4[*v8] = 1;
            id v39 = 0;
          }
          uint64_t v146 = 136;
          goto LABEL_238;
        case 6u:
          char v40 = 0;
          unsigned int v41 = 0;
          uint64_t v32 = 0;
          v5->_hasEndBatteryTemperature = 1;
          while (2)
          {
            uint64_t v42 = *v6;
            uint64_t v43 = *(void *)&v4[v42];
            unint64_t v44 = v43 + 1;
            if (v43 == -1 || v44 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v45 = *(unsigned char *)(*(void *)&v4[*v9] + v43);
              *(void *)&v4[v42] = v44;
              v32 |= (unint64_t)(v45 & 0x7F) << v40;
              if (v45 < 0)
              {
                v40 += 7;
                BOOL v17 = v41++ >= 9;
                if (v17)
                {
                  LODWORD(v32) = 0;
                  goto LABEL_169;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v32) = 0;
          }
LABEL_169:
          uint64_t v145 = 88;
          goto LABEL_223;
        case 7u:
          v5->_hasRaw_endTime = 1;
          uint64_t v46 = *v6;
          unint64_t v47 = *(void *)&v4[v46];
          if (v47 <= 0xFFFFFFFFFFFFFFF7 && v47 + 8 <= *(void *)&v4[*v7])
          {
            id v39 = *(objc_class **)(*(void *)&v4[*v9] + v47);
            *(void *)&v4[v46] = v47 + 8;
          }
          else
          {
            v4[*v8] = 1;
            id v39 = 0;
          }
          uint64_t v146 = 24;
          goto LABEL_238;
        case 8u:
          char v48 = 0;
          unsigned int v49 = 0;
          uint64_t v50 = 0;
          v5->_hasEndedInIdle = 1;
          while (2)
          {
            uint64_t v51 = *v6;
            uint64_t v52 = *(void *)&v4[v51];
            unint64_t v53 = v52 + 1;
            if (v52 == -1 || v53 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v54 = *(unsigned char *)(*(void *)&v4[*v9] + v52);
              *(void *)&v4[v51] = v53;
              v50 |= (unint64_t)(v54 & 0x7F) << v48;
              if (v54 < 0)
              {
                v48 += 7;
                BOOL v17 = v49++ >= 9;
                if (v17)
                {
                  uint64_t v50 = 0;
                  goto LABEL_173;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v50 = 0;
          }
LABEL_173:
          BOOL v143 = v50 != 0;
          uint64_t v144 = 53;
          goto LABEL_206;
        case 9u:
          char v55 = 0;
          unsigned int v56 = 0;
          uint64_t v57 = 0;
          v5->_hasEndedOnBattery = 1;
          while (2)
          {
            uint64_t v58 = *v6;
            uint64_t v59 = *(void *)&v4[v58];
            unint64_t v60 = v59 + 1;
            if (v59 == -1 || v60 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v61 = *(unsigned char *)(*(void *)&v4[*v9] + v59);
              *(void *)&v4[v58] = v60;
              v57 |= (unint64_t)(v61 & 0x7F) << v55;
              if (v61 < 0)
              {
                v55 += 7;
                BOOL v17 = v56++ >= 9;
                if (v17)
                {
                  uint64_t v57 = 0;
                  goto LABEL_177;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v57 = 0;
          }
LABEL_177:
          BOOL v143 = v57 != 0;
          uint64_t v144 = 55;
          goto LABEL_206;
        case 0xAu:
          char v62 = 0;
          unsigned int v63 = 0;
          uint64_t v64 = 0;
          v5->_hasNetworkProfSuccess = 1;
          while (2)
          {
            uint64_t v65 = *v6;
            uint64_t v66 = *(void *)&v4[v65];
            unint64_t v67 = v66 + 1;
            if (v66 == -1 || v67 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v68 = *(unsigned char *)(*(void *)&v4[*v9] + v66);
              *(void *)&v4[v65] = v67;
              v64 |= (unint64_t)(v68 & 0x7F) << v62;
              if (v68 < 0)
              {
                v62 += 7;
                BOOL v17 = v63++ >= 9;
                if (v17)
                {
                  uint64_t v64 = 0;
                  goto LABEL_181;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v64 = 0;
          }
LABEL_181:
          BOOL v143 = v64 != 0;
          uint64_t v144 = 57;
          goto LABEL_206;
        case 0xBu:
          v5->_hasQosBackground = 1;
          uint64_t v69 = *v6;
          unint64_t v70 = *(void *)&v4[v69];
          if (v70 <= 0xFFFFFFFFFFFFFFF7 && v70 + 8 <= *(void *)&v4[*v7])
          {
            id v39 = *(objc_class **)(*(void *)&v4[*v9] + v70);
            *(void *)&v4[v69] = v70 + 8;
          }
          else
          {
            v4[*v8] = 1;
            id v39 = 0;
          }
          uint64_t v146 = 144;
          goto LABEL_238;
        case 0xCu:
          v5->_hasQosLegacy = 1;
          uint64_t v71 = *v6;
          unint64_t v72 = *(void *)&v4[v71];
          if (v72 <= 0xFFFFFFFFFFFFFFF7 && v72 + 8 <= *(void *)&v4[*v7])
          {
            id v39 = *(objc_class **)(*(void *)&v4[*v9] + v72);
            *(void *)&v4[v71] = v72 + 8;
          }
          else
          {
            v4[*v8] = 1;
            id v39 = 0;
          }
          uint64_t v146 = 152;
          goto LABEL_238;
        case 0xDu:
          v5->_hasQosUserInit = 1;
          uint64_t v73 = *v6;
          unint64_t v74 = *(void *)&v4[v73];
          if (v74 <= 0xFFFFFFFFFFFFFFF7 && v74 + 8 <= *(void *)&v4[*v7])
          {
            id v39 = *(objc_class **)(*(void *)&v4[*v9] + v74);
            *(void *)&v4[v73] = v74 + 8;
          }
          else
          {
            v4[*v8] = 1;
            id v39 = 0;
          }
          uint64_t v146 = 160;
          goto LABEL_238;
        case 0xEu:
          v5->_hasRunTime = 1;
          uint64_t v75 = *v6;
          unint64_t v76 = *(void *)&v4[v75];
          if (v76 <= 0xFFFFFFFFFFFFFFF7 && v76 + 8 <= *(void *)&v4[*v7])
          {
            id v39 = *(objc_class **)(*(void *)&v4[*v9] + v76);
            *(void *)&v4[v75] = v76 + 8;
          }
          else
          {
            v4[*v8] = 1;
            id v39 = 0;
          }
          uint64_t v146 = 168;
          goto LABEL_238;
        case 0xFu:
          char v77 = 0;
          unsigned int v78 = 0;
          uint64_t v79 = 0;
          v5->_hasRusageProfSuccess = 1;
          while (2)
          {
            uint64_t v80 = *v6;
            uint64_t v81 = *(void *)&v4[v80];
            unint64_t v82 = v81 + 1;
            if (v81 == -1 || v82 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v83 = *(unsigned char *)(*(void *)&v4[*v9] + v81);
              *(void *)&v4[v80] = v82;
              v79 |= (unint64_t)(v83 & 0x7F) << v77;
              if (v83 < 0)
              {
                v77 += 7;
                BOOL v17 = v78++ >= 9;
                if (v17)
                {
                  uint64_t v79 = 0;
                  goto LABEL_185;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v79 = 0;
          }
LABEL_185:
          BOOL v143 = v79 != 0;
          uint64_t v144 = 63;
          goto LABEL_206;
        case 0x10u:
          char v84 = 0;
          unsigned int v85 = 0;
          uint64_t v32 = 0;
          v5->_hasServicedEnergy = 1;
          while (2)
          {
            uint64_t v86 = *v6;
            uint64_t v87 = *(void *)&v4[v86];
            unint64_t v88 = v87 + 1;
            if (v87 == -1 || v88 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v89 = *(unsigned char *)(*(void *)&v4[*v9] + v87);
              *(void *)&v4[v86] = v88;
              v32 |= (unint64_t)(v89 & 0x7F) << v84;
              if (v89 < 0)
              {
                v84 += 7;
                BOOL v17 = v85++ >= 9;
                if (v17)
                {
                  LODWORD(v32) = 0;
                  goto LABEL_189;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v32) = 0;
          }
LABEL_189:
          uint64_t v145 = 92;
          goto LABEL_223;
        case 0x11u:
          char v90 = 0;
          unsigned int v91 = 0;
          uint64_t v92 = 0;
          v5->_hasSessionProfSuccess = 1;
          while (2)
          {
            uint64_t v93 = *v6;
            uint64_t v94 = *(void *)&v4[v93];
            unint64_t v95 = v94 + 1;
            if (v94 == -1 || v95 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v96 = *(unsigned char *)(*(void *)&v4[*v9] + v94);
              *(void *)&v4[v93] = v95;
              v92 |= (unint64_t)(v96 & 0x7F) << v90;
              if (v96 < 0)
              {
                v90 += 7;
                BOOL v17 = v91++ >= 9;
                if (v17)
                {
                  uint64_t v92 = 0;
                  goto LABEL_193;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v92 = 0;
          }
LABEL_193:
          BOOL v143 = v92 != 0;
          uint64_t v144 = 66;
          goto LABEL_206;
        case 0x12u:
          char v97 = 0;
          unsigned int v98 = 0;
          uint64_t v32 = 0;
          v5->_hasStartBatteryTemperature = 1;
          while (2)
          {
            uint64_t v99 = *v6;
            uint64_t v100 = *(void *)&v4[v99];
            unint64_t v101 = v100 + 1;
            if (v100 == -1 || v101 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v102 = *(unsigned char *)(*(void *)&v4[*v9] + v100);
              *(void *)&v4[v99] = v101;
              v32 |= (unint64_t)(v102 & 0x7F) << v97;
              if (v102 < 0)
              {
                v97 += 7;
                BOOL v17 = v98++ >= 9;
                if (v17)
                {
                  LODWORD(v32) = 0;
                  goto LABEL_197;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v32) = 0;
          }
LABEL_197:
          uint64_t v145 = 96;
          goto LABEL_223;
        case 0x13u:
          v5->_hasRaw_startTime = 1;
          uint64_t v103 = *v6;
          unint64_t v104 = *(void *)&v4[v103];
          if (v104 <= 0xFFFFFFFFFFFFFFF7 && v104 + 8 <= *(void *)&v4[*v7])
          {
            id v39 = *(objc_class **)(*(void *)&v4[*v9] + v104);
            *(void *)&v4[v103] = v104 + 8;
          }
          else
          {
            v4[*v8] = 1;
            id v39 = 0;
          }
          uint64_t v146 = 40;
LABEL_238:
          *(Class *)((char *)&v5->super.super.isa + v146) = v39;
          continue;
        case 0x14u:
          char v105 = 0;
          unsigned int v106 = 0;
          uint64_t v107 = 0;
          v5->_hasStartedInIdle = 1;
          while (2)
          {
            uint64_t v108 = *v6;
            uint64_t v109 = *(void *)&v4[v108];
            unint64_t v110 = v109 + 1;
            if (v109 == -1 || v110 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v111 = *(unsigned char *)(*(void *)&v4[*v9] + v109);
              *(void *)&v4[v108] = v110;
              v107 |= (unint64_t)(v111 & 0x7F) << v105;
              if (v111 < 0)
              {
                v105 += 7;
                BOOL v17 = v106++ >= 9;
                if (v17)
                {
                  uint64_t v107 = 0;
                  goto LABEL_201;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v107 = 0;
          }
LABEL_201:
          BOOL v143 = v107 != 0;
          uint64_t v144 = 69;
          goto LABEL_206;
        case 0x15u:
          char v112 = 0;
          unsigned int v113 = 0;
          uint64_t v114 = 0;
          v5->_hasStartedOnBattery = 1;
          while (2)
          {
            uint64_t v115 = *v6;
            uint64_t v116 = *(void *)&v4[v115];
            unint64_t v117 = v116 + 1;
            if (v116 == -1 || v117 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v118 = *(unsigned char *)(*(void *)&v4[*v9] + v116);
              *(void *)&v4[v115] = v117;
              v114 |= (unint64_t)(v118 & 0x7F) << v112;
              if (v118 < 0)
              {
                v112 += 7;
                BOOL v17 = v113++ >= 9;
                if (v17)
                {
                  uint64_t v114 = 0;
                  goto LABEL_205;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v114 = 0;
          }
LABEL_205:
          BOOL v143 = v114 != 0;
          uint64_t v144 = 71;
LABEL_206:
          *((unsigned char *)&v5->super.super.isa + v144) = v143;
          continue;
        case 0x16u:
          char v119 = 0;
          unsigned int v120 = 0;
          uint64_t v32 = 0;
          v5->_hasVersion = 1;
          while (2)
          {
            uint64_t v121 = *v6;
            uint64_t v122 = *(void *)&v4[v121];
            unint64_t v123 = v122 + 1;
            if (v122 == -1 || v123 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v124 = *(unsigned char *)(*(void *)&v4[*v9] + v122);
              *(void *)&v4[v121] = v123;
              v32 |= (unint64_t)(v124 & 0x7F) << v119;
              if (v124 < 0)
              {
                v119 += 7;
                BOOL v17 = v120++ >= 9;
                if (v17)
                {
                  LODWORD(v32) = 0;
                  goto LABEL_210;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v32) = 0;
          }
LABEL_210:
          uint64_t v145 = 100;
          goto LABEL_223;
        case 0x17u:
          char v125 = 0;
          unsigned int v126 = 0;
          uint64_t v32 = 0;
          v5->_hasWifiDown = 1;
          while (2)
          {
            uint64_t v127 = *v6;
            uint64_t v128 = *(void *)&v4[v127];
            unint64_t v129 = v128 + 1;
            if (v128 == -1 || v129 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v130 = *(unsigned char *)(*(void *)&v4[*v9] + v128);
              *(void *)&v4[v127] = v129;
              v32 |= (unint64_t)(v130 & 0x7F) << v125;
              if (v130 < 0)
              {
                v125 += 7;
                BOOL v17 = v126++ >= 9;
                if (v17)
                {
                  LODWORD(v32) = 0;
                  goto LABEL_214;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v32) = 0;
          }
LABEL_214:
          uint64_t v145 = 104;
          goto LABEL_223;
        case 0x18u:
          char v131 = 0;
          unsigned int v132 = 0;
          uint64_t v32 = 0;
          v5->_hasWifiUp = 1;
          while (2)
          {
            uint64_t v133 = *v6;
            uint64_t v134 = *(void *)&v4[v133];
            unint64_t v135 = v134 + 1;
            if (v134 == -1 || v135 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v136 = *(unsigned char *)(*(void *)&v4[*v9] + v134);
              *(void *)&v4[v133] = v135;
              v32 |= (unint64_t)(v136 & 0x7F) << v131;
              if (v136 < 0)
              {
                v131 += 7;
                BOOL v17 = v132++ >= 9;
                if (v17)
                {
                  LODWORD(v32) = 0;
                  goto LABEL_218;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v32) = 0;
          }
LABEL_218:
          uint64_t v145 = 108;
          goto LABEL_223;
        case 0x19u:
          char v137 = 0;
          unsigned int v138 = 0;
          uint64_t v32 = 0;
          v5->_hasDirtyMemoryDelta = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_241;
          }
          continue;
      }
      while (1)
      {
        uint64_t v139 = *v6;
        uint64_t v140 = *(void *)&v4[v139];
        unint64_t v141 = v140 + 1;
        if (v140 == -1 || v141 > *(void *)&v4[*v7]) {
          break;
        }
        char v142 = *(unsigned char *)(*(void *)&v4[*v9] + v140);
        *(void *)&v4[v139] = v141;
        v32 |= (unint64_t)(v142 & 0x7F) << v137;
        if ((v142 & 0x80) == 0) {
          goto LABEL_220;
        }
        v137 += 7;
        BOOL v17 = v138++ >= 9;
        if (v17)
        {
          LODWORD(v32) = 0;
          goto LABEL_222;
        }
      }
      v4[*v8] = 1;
LABEL_220:
      if (v4[*v8]) {
        LODWORD(v32) = 0;
      }
LABEL_222:
      uint64_t v145 = 112;
LABEL_223:
      *(_DWORD *)((char *)&v5->super.super.isa + v145) = v32;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_241:
  }
    id v147 = 0;
  else {
LABEL_242:
  }
    id v147 = v5;

  return v147;
}

- (NSString)description
{
  id v22 = [NSString alloc];
  unint64_t v35 = [(BMActivitySchedulerActivityProfile *)self bundleID];
  uint64_t v34 = [(BMActivitySchedulerActivityProfile *)self activityname];
  uint64_t v33 = objc_msgSend(NSNumber, "numberWithBool:", -[BMActivitySchedulerActivityProfile completed](self, "completed"));
  uint64_t v32 = objc_msgSend(NSNumber, "numberWithInt:", -[BMActivitySchedulerActivityProfile CPUAwakeTime](self, "CPUAwakeTime"));
  v3 = NSNumber;
  [(BMActivitySchedulerActivityProfile *)self CPUTime];
  unsigned int v31 = objc_msgSend(v3, "numberWithDouble:");
  char v29 = objc_msgSend(NSNumber, "numberWithInt:", -[BMActivitySchedulerActivityProfile endBatteryTemperature](self, "endBatteryTemperature"));
  unint64_t v28 = [(BMActivitySchedulerActivityProfile *)self endTime];
  uint64_t v27 = objc_msgSend(NSNumber, "numberWithBool:", -[BMActivitySchedulerActivityProfile endedInIdle](self, "endedInIdle"));
  uint64_t v25 = objc_msgSend(NSNumber, "numberWithBool:", -[BMActivitySchedulerActivityProfile endedOnBattery](self, "endedOnBattery"));
  char v30 = objc_msgSend(NSNumber, "numberWithBool:", -[BMActivitySchedulerActivityProfile networkProfSuccess](self, "networkProfSuccess"));
  id v4 = NSNumber;
  [(BMActivitySchedulerActivityProfile *)self qosBackground];
  uint64_t v26 = objc_msgSend(v4, "numberWithDouble:");
  id v5 = NSNumber;
  [(BMActivitySchedulerActivityProfile *)self qosLegacy];
  uint64_t v21 = objc_msgSend(v5, "numberWithDouble:");
  id v6 = NSNumber;
  [(BMActivitySchedulerActivityProfile *)self qosUserInit];
  unsigned int v24 = objc_msgSend(v6, "numberWithDouble:");
  double v7 = NSNumber;
  [(BMActivitySchedulerActivityProfile *)self runTime];
  uint64_t v20 = objc_msgSend(v7, "numberWithDouble:");
  BOOL v17 = objc_msgSend(NSNumber, "numberWithBool:", -[BMActivitySchedulerActivityProfile rusageProfSuccess](self, "rusageProfSuccess"));
  id v19 = objc_msgSend(NSNumber, "numberWithInt:", -[BMActivitySchedulerActivityProfile servicedEnergy](self, "servicedEnergy"));
  int v18 = objc_msgSend(NSNumber, "numberWithBool:", -[BMActivitySchedulerActivityProfile sessionProfSuccess](self, "sessionProfSuccess"));
  char v16 = objc_msgSend(NSNumber, "numberWithInt:", -[BMActivitySchedulerActivityProfile startBatteryTemperature](self, "startBatteryTemperature"));
  v8 = [(BMActivitySchedulerActivityProfile *)self startTime];
  unint64_t v15 = objc_msgSend(NSNumber, "numberWithBool:", -[BMActivitySchedulerActivityProfile startedInIdle](self, "startedInIdle"));
  id v9 = objc_msgSend(NSNumber, "numberWithBool:", -[BMActivitySchedulerActivityProfile startedOnBattery](self, "startedOnBattery"));
  char v10 = objc_msgSend(NSNumber, "numberWithInt:", -[BMActivitySchedulerActivityProfile version](self, "version"));
  unsigned int v11 = objc_msgSend(NSNumber, "numberWithInt:", -[BMActivitySchedulerActivityProfile wifiDown](self, "wifiDown"));
  unint64_t v12 = objc_msgSend(NSNumber, "numberWithInt:", -[BMActivitySchedulerActivityProfile wifiUp](self, "wifiUp"));
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithInt:", -[BMActivitySchedulerActivityProfile dirtyMemoryDelta](self, "dirtyMemoryDelta"));
  char v23 = objc_msgSend(v22, "initWithFormat:", @"BMActivitySchedulerActivityProfile with bundleID: %@, activityname: %@, completed: %@, CPUAwakeTime: %@, CPUTime: %@, endBatteryTemperature: %@, endTime: %@, endedInIdle: %@, endedOnBattery: %@, networkProfSuccess: %@, qosBackground: %@, qosLegacy: %@, qosUserInit: %@, runTime: %@, rusageProfSuccess: %@, servicedEnergy: %@, sessionProfSuccess: %@, startBatteryTemperature: %@, startTime: %@, startedInIdle: %@, startedOnBattery: %@, version: %@, wifiDown: %@, wifiUp: %@, dirtyMemoryDelta: %@", v35, v34, v33, v32, v31, v29, v28, v27, v25, v30, v26, v21, v24, v20, v17, v19,
                  v18,
                  v16,
                  v8,
                  v15,
                  v9,
                  v10,
                  v11,
                  v12,
                  v13);

  return (NSString *)v23;
}

- (BMActivitySchedulerActivityProfile)initWithBundleID:(id)a3 activityname:(id)a4 completed:(id)a5 CPUAwakeTime:(id)a6 CPUTime:(id)a7 endBatteryTemperature:(id)a8 endTime:(id)a9 endedInIdle:(id)a10 endedOnBattery:(id)a11 networkProfSuccess:(id)a12 qosBackground:(id)a13 qosLegacy:(id)a14 qosUserInit:(id)a15 runTime:(id)a16 rusageProfSuccess:(id)a17 servicedEnergy:(id)a18 sessionProfSuccess:(id)a19 startBatteryTemperature:(id)a20 startTime:(id)a21 startedInIdle:(id)a22 startedOnBattery:(id)a23 version:(id)a24 wifiDown:(id)a25 wifiUp:(id)a26 dirtyMemoryDelta:(id)a27
{
  id v62 = a3;
  id v59 = a4;
  id v61 = a4;
  id v76 = a5;
  id v75 = a6;
  id v74 = a7;
  id v73 = a8;
  id v32 = a9;
  id v72 = a10;
  id v71 = a11;
  id v70 = a12;
  id v69 = a13;
  id v68 = a14;
  id v67 = a15;
  id v66 = a16;
  id v65 = a17;
  id v33 = a18;
  id v64 = a19;
  id v63 = a20;
  id v34 = a21;
  id v35 = a22;
  id v36 = a23;
  id v37 = a24;
  id v38 = a25;
  id v39 = a26;
  id v40 = a27;
  v77.receiver = self;
  v77.super_class = (Class)BMActivitySchedulerActivityProfile;
  unsigned int v41 = [(BMEventBase *)&v77 init];
  if (v41)
  {
    v41->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v41->_bundleID, a3);
    objc_storeStrong((id *)&v41->_activityname, v59);
    if (v76)
    {
      v41->_hasCompleted = 1;
      v41->_completed = [v76 BOOLValue];
    }
    else
    {
      v41->_hasCompleted = 0;
      v41->_completed = 0;
    }
    if (v75)
    {
      v41->_hasCPUAwakeTime = 1;
      int v42 = [v75 intValue];
    }
    else
    {
      v41->_hasCPUAwakeTime = 0;
      int v42 = -1;
    }
    v41->_CPUAwakeTime = v42;
    if (v74)
    {
      v41->_hasCPUTime = 1;
      [v74 doubleValue];
    }
    else
    {
      v41->_hasCPUTime = 0;
      double v43 = -1.0;
    }
    v41->_CPUTime = v43;
    if (v73)
    {
      v41->_hasEndBatteryTemperature = 1;
      int v44 = [v73 intValue];
    }
    else
    {
      v41->_hasEndBatteryTemperature = 0;
      int v44 = -1;
    }
    v41->_endBatteryTemperature = v44;
    if (v32)
    {
      v41->_hasRaw_endTime = 1;
      [v32 timeIntervalSince1970];
    }
    else
    {
      v41->_hasRaw_endTime = 0;
      double v45 = -1.0;
    }
    v41->_raw_endTime = v45;
    if (v72)
    {
      v41->_hasEndedInIdle = 1;
      v41->_endedInIdle = [v72 BOOLValue];
    }
    else
    {
      v41->_hasEndedInIdle = 0;
      v41->_endedInIdle = 0;
    }
    if (v71)
    {
      v41->_hasEndedOnBattery = 1;
      v41->_endedOnBattery = [v71 BOOLValue];
    }
    else
    {
      v41->_hasEndedOnBattery = 0;
      v41->_endedOnBattery = 0;
    }
    if (v70)
    {
      v41->_hasNetworkProfSuccess = 1;
      v41->_networkProfSuccess = [v70 BOOLValue];
    }
    else
    {
      v41->_hasNetworkProfSuccess = 0;
      v41->_networkProfSuccess = 0;
    }
    if (v69)
    {
      v41->_hasQosBackground = 1;
      [v69 doubleValue];
    }
    else
    {
      v41->_hasQosBackground = 0;
      double v46 = -1.0;
    }
    v41->_qosBackground = v46;
    if (v68)
    {
      v41->_hasQosLegacy = 1;
      [v68 doubleValue];
    }
    else
    {
      v41->_hasQosLegacy = 0;
      double v47 = -1.0;
    }
    v41->_qosLegacy = v47;
    if (v67)
    {
      v41->_hasQosUserInit = 1;
      [v67 doubleValue];
    }
    else
    {
      v41->_hasQosUserInit = 0;
      double v48 = -1.0;
    }
    v41->_qosUserInit = v48;
    if (v66)
    {
      v41->_hasRunTime = 1;
      [v66 doubleValue];
    }
    else
    {
      v41->_hasRunTime = 0;
      double v49 = -1.0;
    }
    v41->_runTime = v49;
    if (v65)
    {
      v41->_hasRusageProfSuccess = 1;
      v41->_rusageProfSuccess = [v65 BOOLValue];
    }
    else
    {
      v41->_hasRusageProfSuccess = 0;
      v41->_rusageProfSuccess = 0;
    }
    if (v33)
    {
      v41->_hasServicedEnergy = 1;
      int v50 = [v33 intValue];
    }
    else
    {
      v41->_hasServicedEnergy = 0;
      int v50 = -1;
    }
    v41->_servicedEnergy = v50;
    if (v64)
    {
      v41->_hasSessionProfSuccess = 1;
      v41->_sessionProfSuccess = [v64 BOOLValue];
    }
    else
    {
      v41->_hasSessionProfSuccess = 0;
      v41->_sessionProfSuccess = 0;
    }
    if (v63)
    {
      v41->_hasStartBatteryTemperature = 1;
      int v51 = [v63 intValue];
    }
    else
    {
      v41->_hasStartBatteryTemperature = 0;
      int v51 = -1;
    }
    v41->_startBatteryTemperature = v51;
    if (v34)
    {
      v41->_hasRaw_startTime = 1;
      [v34 timeIntervalSince1970];
    }
    else
    {
      v41->_hasRaw_startTime = 0;
      double v52 = -1.0;
    }
    v41->_raw_startTime = v52;
    if (v35)
    {
      v41->_hasStartedInIdle = 1;
      v41->_startedInIdle = [v35 BOOLValue];
    }
    else
    {
      v41->_hasStartedInIdle = 0;
      v41->_startedInIdle = 0;
    }
    if (v36)
    {
      v41->_hasStartedOnBattery = 1;
      v41->_startedOnBattery = [v36 BOOLValue];
    }
    else
    {
      v41->_hasStartedOnBattery = 0;
      v41->_startedOnBattery = 0;
    }
    if (v37)
    {
      v41->_hasVersion = 1;
      int v53 = [v37 intValue];
    }
    else
    {
      v41->_hasVersion = 0;
      int v53 = -1;
    }
    v41->_version = v53;
    if (v38)
    {
      v41->_hasWifiDown = 1;
      int v54 = [v38 intValue];
    }
    else
    {
      v41->_hasWifiDown = 0;
      int v54 = -1;
    }
    v41->_wifiDown = v54;
    if (v39)
    {
      v41->_hasWifiUp = 1;
      int v55 = [v39 intValue];
    }
    else
    {
      v41->_hasWifiUp = 0;
      int v55 = -1;
    }
    v41->_wifiUp = v55;
    if (v40)
    {
      v41->_hasDirtyMemoryDelta = 1;
      int v56 = [v40 intValue];
    }
    else
    {
      v41->_hasDirtyMemoryDelta = 0;
      int v56 = -1;
    }
    v41->_dirtyMemoryDelta = v56;
  }

  return v41;
}

+ (id)protoFields
{
  v29[25] = *MEMORY[0x1E4F143B8];
  unint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleID" number:1 type:13 subMessageClass:0];
  v29[0] = v28;
  uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"activityname" number:2 type:13 subMessageClass:0];
  v29[1] = v27;
  uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"completed" number:3 type:12 subMessageClass:0];
  v29[2] = v26;
  uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"CPUAwakeTime" number:4 type:2 subMessageClass:0];
  v29[3] = v25;
  unsigned int v24 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"CPUTime" number:5 type:0 subMessageClass:0];
  v29[4] = v24;
  char v23 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"endBatteryTemperature" number:6 type:2 subMessageClass:0];
  v29[5] = v23;
  id v22 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"endTime" number:7 type:0 subMessageClass:0];
  v29[6] = v22;
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"endedInIdle" number:8 type:12 subMessageClass:0];
  v29[7] = v21;
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"endedOnBattery" number:9 type:12 subMessageClass:0];
  v29[8] = v20;
  id v19 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"networkProfSuccess" number:10 type:12 subMessageClass:0];
  v29[9] = v19;
  int v18 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"qosBackground" number:11 type:0 subMessageClass:0];
  v29[10] = v18;
  BOOL v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"qosLegacy" number:12 type:0 subMessageClass:0];
  v29[11] = v17;
  char v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"qosUserInit" number:13 type:0 subMessageClass:0];
  v29[12] = v16;
  unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"runTime" number:14 type:0 subMessageClass:0];
  v29[13] = v15;
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"rusageProfSuccess" number:15 type:12 subMessageClass:0];
  v29[14] = v14;
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"servicedEnergy" number:16 type:2 subMessageClass:0];
  v29[15] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"sessionProfSuccess" number:17 type:12 subMessageClass:0];
  v29[16] = v2;
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"startBatteryTemperature" number:18 type:2 subMessageClass:0];
  v29[17] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"startTime" number:19 type:0 subMessageClass:0];
  v29[18] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"startedInIdle" number:20 type:12 subMessageClass:0];
  v29[19] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"startedOnBattery" number:21 type:12 subMessageClass:0];
  v29[20] = v6;
  double v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"version" number:22 type:2 subMessageClass:0];
  v29[21] = v7;
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"wifiDown" number:23 type:2 subMessageClass:0];
  v29[22] = v8;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"wifiUp" number:24 type:2 subMessageClass:0];
  v29[23] = v9;
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"dirtyMemoryDelta" number:25 type:2 subMessageClass:0];
  v29[24] = v10;
  unsigned int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:25];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4710;
}

+ (id)columns
{
  v29[25] = *MEMORY[0x1E4F143B8];
  unint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleID" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"activityname" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"completed" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:12 convertedType:0];
  uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"CPUAwakeTime" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:2 convertedType:0];
  unsigned int v24 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"CPUTime" dataType:1 requestOnly:0 fieldNumber:5 protoDataType:0 convertedType:0];
  char v23 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"endBatteryTemperature" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:2 convertedType:0];
  id v22 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"endTime" dataType:3 requestOnly:0 fieldNumber:7 protoDataType:0 convertedType:2];
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"endedInIdle" dataType:0 requestOnly:0 fieldNumber:8 protoDataType:12 convertedType:0];
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"endedOnBattery" dataType:0 requestOnly:0 fieldNumber:9 protoDataType:12 convertedType:0];
  id v19 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"networkProfSuccess" dataType:0 requestOnly:0 fieldNumber:10 protoDataType:12 convertedType:0];
  int v18 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"qosBackground" dataType:1 requestOnly:0 fieldNumber:11 protoDataType:0 convertedType:0];
  BOOL v17 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"qosLegacy" dataType:1 requestOnly:0 fieldNumber:12 protoDataType:0 convertedType:0];
  char v16 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"qosUserInit" dataType:1 requestOnly:0 fieldNumber:13 protoDataType:0 convertedType:0];
  unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"runTime" dataType:1 requestOnly:0 fieldNumber:14 protoDataType:0 convertedType:0];
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"rusageProfSuccess" dataType:0 requestOnly:0 fieldNumber:15 protoDataType:12 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"servicedEnergy" dataType:0 requestOnly:0 fieldNumber:16 protoDataType:2 convertedType:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"sessionProfSuccess" dataType:0 requestOnly:0 fieldNumber:17 protoDataType:12 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"startBatteryTemperature" dataType:0 requestOnly:0 fieldNumber:18 protoDataType:2 convertedType:0];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"startTime" dataType:3 requestOnly:0 fieldNumber:19 protoDataType:0 convertedType:2];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"startedInIdle" dataType:0 requestOnly:0 fieldNumber:20 protoDataType:12 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"startedOnBattery" dataType:0 requestOnly:0 fieldNumber:21 protoDataType:12 convertedType:0];
  double v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"version" dataType:0 requestOnly:0 fieldNumber:22 protoDataType:2 convertedType:0];
  unint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"wifiDown" dataType:0 requestOnly:0 fieldNumber:23 protoDataType:2 convertedType:0];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"wifiUp" dataType:0 requestOnly:0 fieldNumber:24 protoDataType:2 convertedType:0];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"dirtyMemoryDelta" dataType:0 requestOnly:0 fieldNumber:25 protoDataType:2 convertedType:0];
  v29[0] = v28;
  v29[1] = v27;
  v29[2] = v26;
  v29[3] = v25;
  v29[4] = v24;
  v29[5] = v23;
  v29[6] = v22;
  v29[7] = v21;
  v29[8] = v20;
  v29[9] = v19;
  v29[10] = v18;
  v29[11] = v17;
  v29[12] = v16;
  v29[13] = v15;
  v29[14] = v14;
  v29[15] = v2;
  v29[16] = v3;
  v29[17] = v4;
  v29[18] = v13;
  v29[19] = v5;
  v29[20] = v6;
  v29[21] = v7;
  v29[22] = v12;
  v29[23] = v8;
  v29[24] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:25];

  return v11;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    double v7 = (void *)[[v5 alloc] initWithData:v6];

    v8 = [[BMActivitySchedulerActivityProfile alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[20] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end