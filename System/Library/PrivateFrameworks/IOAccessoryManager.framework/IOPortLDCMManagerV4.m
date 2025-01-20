@interface IOPortLDCMManagerV4
- (BOOL)behaviorOverrideDisableMitigations;
- (BOOL)behaviorOverrideDisableUI;
- (BOOL)checkIsReceptacleEmpty;
- (BOOL)isReceptacleEmpty;
- (BOOL)mitigationsEnabled;
- (BOOL)overrideEnabled;
- (BOOL)uiActive;
- (BOOL)waveformExtractionDisabled;
- (IOPortLDCMManagerV4)initWithParams:(unint64_t)a3 withDryPollingInterval:(unint64_t)a4 withService:(unsigned int)a5 withNotificationPort:(IONotificationPort *)a6 withServerRunloop:(__CFRunLoop *)a7;
- (LDCMNotificationUIManagerV4)notificationUIManager;
- (NSDate)portAttachedTime;
- (NSString)measurementInfoOutputString;
- (OS_dispatch_queue)ldcmV4DispatchQueue;
- (OS_dispatch_source)timer;
- (id)buildMeasurementHeaderString;
- (id)buildMeasurementOutputString:(id)a3 withMeasurementReason:(int)a4 withMeasurementEvent:(id)a5;
- (id)extractData:(unsigned int *)a3 :(unint64_t)a4;
- (id)publishAnalytics:(id)a3 withMeasurementReason:(int)a4 withWaveformRawData:(char *)a5 withWaveformDataLen:(unint64_t)a6;
- (int)buildType;
- (int)currentMitigationsStatus;
- (int)deviceClass;
- (int)getData:(char *)outputStruct :(unint64_t *)outputStructCnt;
- (int)getWaveform:(char *)a3 :(unint64_t *)a4;
- (int)setLDCMMeasurementStatus:(int)a3;
- (int)setLDCMState:(int)a3;
- (int)setLiquidDetected:(unsigned __int8)a3;
- (int)setMitigations:(unsigned __int8)a3;
- (int)setUserOverride:(unsigned __int8)a3;
- (int)setWaveformExtractionEnabled:(unsigned __int8)a3;
- (unint64_t)dryPollingInterval;
- (unint64_t)wetPollingInterval;
- (unsigned)isWet;
- (unsigned)ldcmFeatureConnect;
- (unsigned)notification;
- (unsigned)previousLDCMPortStatus;
- (void)dealloc;
- (void)generateLDCMCSVData;
- (void)handleAttachEvent;
- (void)handleDetachEvent;
- (void)handleLDCMInterrupt;
- (void)handleLDCMMitigationsStatusChange:(int)a3;
- (void)handleMeasurementResults:(int)a3;
- (void)hideUI;
- (void)logInfo:(id)a3;
- (void)measureOccupiedWetPortDuration;
- (void)performLDCMMeasurement:(int)a3;
- (void)processBehaviorDictionary:(id)a3;
- (void)setBehaviorOverrideDisableMitigations:(BOOL)a3;
- (void)setBehaviorOverrideDisableUI:(BOOL)a3;
- (void)setBuildType:(int)a3;
- (void)setCurrentMitigationsStatus:(int)a3;
- (void)setDeviceClass:(int)a3;
- (void)setDryPollingInterval:(unint64_t)a3;
- (void)setIsReceptacleEmpty:(BOOL)a3;
- (void)setIsWet:(unsigned __int8)a3;
- (void)setLdcmFeatureConnect:(unsigned int)a3;
- (void)setLdcmV4DispatchQueue:(id)a3;
- (void)setMeasurementInfoOutputString:(id)a3;
- (void)setMitigationsEnabled:(BOOL)a3;
- (void)setNotification:(unsigned int)a3;
- (void)setNotificationUIManager:(id)a3;
- (void)setOverrideEnabled:(BOOL)a3;
- (void)setPortAttachedTime:(id)a3;
- (void)setPreviousLDCMPortStatus:(unsigned __int8)a3;
- (void)setTimer:(id)a3;
- (void)setUiActive:(BOOL)a3;
- (void)setWaveformExtractionDisabled:(BOOL)a3;
- (void)setWetPollingInterval:(unint64_t)a3;
- (void)showUI;
- (void)storeWaveform:(char *)a3 withWaveformDataLen:(unint64_t)a4;
@end

@implementation IOPortLDCMManagerV4

uint64_t __112__IOPortLDCMManagerV4_initWithParams_withDryPollingInterval_withService_withNotificationPort_withServerRunloop___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performLDCMMeasurement:2];
}

- (id)buildMeasurementOutputString:(id)a3 withMeasurementReason:(int)a4 withMeasurementEvent:(id)a5
{
  v7 = (objc_class *)MEMORY[0x1E4F28C10];
  id v61 = a5;
  id v8 = a3;
  id v9 = objc_alloc_init(v7);
  [v9 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
  if (a4 > 3) {
    v10 = @"None";
  }
  else {
    v10 = off_1E6B6D6F8[a4];
  }
  v60 = v10;
  v59 = (void *)MEMORY[0x1E4F28E78];
  v11 = [MEMORY[0x1E4F1C9C8] date];
  v12 = [v9 stringFromDate:v11];
  unsigned int v58 = [v8 ldcmPortStatus];
  unsigned int v57 = [v8 ldcmMitigationsStatus];
  unsigned int v56 = [v8 ldcmFeatureStatus];
  unsigned int v55 = [v8 ldcmMeasurePin];
  unsigned int v54 = [v8 ldcmCompletion];
  unsigned int v53 = [v8 ldcmWet];
  unsigned int v13 = [v8 ldcmLowImp];
  [v8 ldcmLoadImpMag];
  uint64_t v52 = v14;
  [v8 ldcmLoadImpPhase];
  uint64_t v51 = v15;
  [v8 ldcmCalculatedRes];
  uint64_t v50 = v16;
  [v8 ldcmCalculatedCap];
  uint64_t v49 = v17;
  [v8 ldcmTIACurrentAmp];
  uint64_t v48 = v18;
  [v8 ldcmVoltageAmp];
  uint64_t v47 = v19;
  [v8 ldcmLeakageCurrentAmp];
  uint64_t v46 = v20;
  [v8 ldcmMeasureTIASNR];
  uint64_t v45 = v21;
  [v8 ldcmMeasureVoltageSNR];
  uint64_t v23 = v22;
  [v8 ldcmCalTIAAmp];
  uint64_t v25 = v24;
  [v8 ldcmCalVoltageAmp];
  uint64_t v27 = v26;
  [v8 ldcmCalTIASNR];
  uint64_t v29 = v28;
  [v8 ldcmCalVoltageSNR];
  uint64_t v31 = v30;
  [v8 ldcmTIAGainCorrection];
  uint64_t v33 = v32;
  [v8 ldcmVoltageGainCorrection];
  uint64_t v35 = v34;
  [v8 ldcmPhaseComp];
  uint64_t v37 = v36;
  uint64_t v38 = [v8 ldcmWetStateDuration];
  unsigned int v39 = [v8 ldcmWetStateTooLong];
  unsigned int v40 = [v8 ldcmIncompSNRAmpCnt];
  unsigned int v41 = [v8 ldcmIncompOVPCnt];
  unsigned int v42 = [v8 ldcmIncompTimeoutCnt];

  objc_msgSend(v59, "stringWithFormat:", @"%@,%@,%@,%.12d,%.12d,%.12d,%.12d,%.12d,%.12d,%.12d,%.12f,%.12f,%.12f,%.12f,%.12f,%.12f,%.12f,%.12f,%.12f,%.12f,%.12f,%.12f,%.12f,%.12f,%.12f,%.12f,%.12d,%.12d,%.12d,%.12d,%.12d\n", v12, v60, v61, v58, v57, v56, v55, v54, v53, v13, v52, v51, v50, v49, v48, v47,
    v46,
    v45,
    v23,
    v25,
    v27,
    v29,
    v31,
    v33,
    v35,
    v37,
    v38,
    v39,
    v40,
    v41,
  v43 = v42);

  return v43;
}

- (void)logInfo:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = [v4 ldcmFeatureStatus];
    int v6 = [v4 ldcmMitigationsStatus];
    BOOL mitigationsEnabled = self->_mitigationsEnabled;
    BOOL overrideEnabled = self->_overrideEnabled;
    int v36 = 67111168;
    *(_DWORD *)uint64_t v37 = v5;
    *(_WORD *)&v37[4] = 1024;
    *(_DWORD *)&v37[6] = v6;
    LOWORD(v38) = 1024;
    *(_DWORD *)((char *)&v38 + 2) = mitigationsEnabled;
    HIWORD(v38) = 1024;
    *(_DWORD *)unsigned int v39 = overrideEnabled;
    *(_WORD *)&v39[4] = 1024;
    *(_DWORD *)&v39[6] = [v4 ldcmPortStatus];
    __int16 v40 = 1024;
    *(_DWORD *)unsigned int v41 = [v4 ldcmWet];
    *(_WORD *)&v41[4] = 1024;
    *(_DWORD *)&v41[6] = [v4 ldcmWetStateDuration];
    __int16 v42 = 1024;
    BOOL v43 = [(IOPortLDCMManagerV4 *)self checkIsReceptacleEmpty];
    __int16 v44 = 1024;
    int v45 = [v4 ldcmRREFGated];
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - Feature Status: %x, Mitigations Status: %d, Mitigations Framework State: %d, Override Framework State: %d, Wet Declared %d, Wet Measured: %d, Wet State Duration: %d, Receptacle Empty: %d, RREF Gated: %d", (uint8_t *)&v36, 0x38u);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int previousLDCMPortStatus = self->_previousLDCMPortStatus;
    int v10 = [v4 ldcmPortStatus];
    int v11 = [v4 ldcmMeasurePin];
    int v12 = [v4 ldcmCompletion];
    int v13 = [v4 ldcmLowImp];
    int v36 = 67110144;
    *(_DWORD *)uint64_t v37 = previousLDCMPortStatus;
    *(_WORD *)&v37[4] = 1024;
    *(_DWORD *)&v37[6] = v10;
    LOWORD(v38) = 1024;
    *(_DWORD *)((char *)&v38 + 2) = v11;
    HIWORD(v38) = 1024;
    *(_DWORD *)unsigned int v39 = v12;
    *(_WORD *)&v39[4] = 1024;
    *(_DWORD *)&v39[6] = v13;
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - Analytics bitfields - _previousLDCMPortStatus %d, ldcmPortStatus %d, ldcmMeasurePin %d, ldcmCompletion %d, ldcmLowImp %d", (uint8_t *)&v36, 0x20u);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    [v4 ldcmLoadImpMag];
    uint64_t v15 = v14;
    [v4 ldcmLoadImpPhase];
    uint64_t v17 = v16;
    [v4 ldcmCalculatedRes];
    uint64_t v19 = v18;
    [v4 ldcmCalculatedCap];
    int v36 = 134218752;
    *(void *)uint64_t v37 = v15;
    *(_WORD *)&v37[8] = 2048;
    uint64_t v38 = v17;
    *(_WORD *)unsigned int v39 = 2048;
    *(void *)&v39[2] = v19;
    __int16 v40 = 2048;
    *(void *)unsigned int v41 = v20;
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - Measurement Data - loadImpMag: %f, loadImpPhase: %f, calculatedRes: %f, calculatedCap: %f", (uint8_t *)&v36, 0x2Au);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v21 = [v4 ldcmWetStateDuration];
    int v22 = [v4 ldcmWetStateTooLong];
    int v23 = [v4 ldcmWetTooLongLDCMDisabled];
    int v36 = 67109632;
    *(_DWORD *)uint64_t v37 = v21;
    *(_WORD *)&v37[4] = 1024;
    *(_DWORD *)&v37[6] = v22;
    LOWORD(v38) = 1024;
    *(_DWORD *)((char *)&v38 + 2) = v23;
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - Measurement Data - wetStateDuration: %d, wetStateTooLong: %d, wetTooLongLDCMDisabled: %d", (uint8_t *)&v36, 0x14u);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    [v4 ldcmMeasureTIASNR];
    uint64_t v25 = v24;
    [v4 ldcmMeasureVoltageSNR];
    uint64_t v27 = v26;
    [v4 ldcmCalTIASNR];
    uint64_t v29 = v28;
    [v4 ldcmCalVoltageSNR];
    int v36 = 134218752;
    *(void *)uint64_t v37 = v25;
    *(_WORD *)&v37[8] = 2048;
    uint64_t v38 = v27;
    *(_WORD *)unsigned int v39 = 2048;
    *(void *)&v39[2] = v29;
    __int16 v40 = 2048;
    *(void *)unsigned int v41 = v30;
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - Measurement Data - MeasureTIASNR: %f, MeasureVoltageSNR: %f, CalTIASNR: %f, CalVoltageSNR: %f", (uint8_t *)&v36, 0x2Au);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    [v4 ldcmTIAGainCorrection];
    uint64_t v32 = v31;
    [v4 ldcmVoltageGainCorrection];
    uint64_t v34 = v33;
    [v4 ldcmPhaseComp];
    int v36 = 134218496;
    *(void *)uint64_t v37 = v32;
    *(_WORD *)&v37[8] = 2048;
    uint64_t v38 = v34;
    *(_WORD *)unsigned int v39 = 2048;
    *(void *)&v39[2] = v35;
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - Measurement Data - TIAGainCorrection: %f, VoltageGainCorrection: %f, PhaseComp: %f", (uint8_t *)&v36, 0x20u);
  }
}

- (id)publishAnalytics:(id)a3 withMeasurementReason:(int)a4 withWaveformRawData:(char *)a5 withWaveformDataLen:(unint64_t)a6
{
  uint64_t v224 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  int v11 = v10;
  if (!self->_previousLDCMPortStatus
    && [v10 ldcmPortStatus] == 1
    && (![v11 ldcmMeasurePin] || objc_msgSend(v11, "ldcmMeasurePin") == 1)
    && ![v11 ldcmCompletion]
    && ![v11 ldcmLowImp])
  {
    [(IOPortLDCMManagerV4 *)self storeWaveform:a5 withWaveformDataLen:a6];
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v137 = NSNumber;
    [v11 ldcmCalculatedCap];
    v138 = objc_msgSend(v137, "numberWithDouble:");
    [v12 setObject:v138 forKey:@"capacitance"];

    v139 = NSNumber;
    [v11 ldcmLoadImpMag];
    v140 = objc_msgSend(v139, "numberWithDouble:");
    [v12 setObject:v140 forKey:@"impedance"];

    v141 = NSNumber;
    [v11 ldcmLoadImpPhase];
    v142 = objc_msgSend(v141, "numberWithDouble:");
    [v12 setObject:v142 forKey:@"impedancePhase"];

    v143 = NSNumber;
    [v11 ldcmCalculatedRes];
    v144 = objc_msgSend(v143, "numberWithDouble:");
    [v12 setObject:v144 forKey:@"resistance"];

    v145 = NSNumber;
    [v11 ldcmMeasureTIASNR];
    v146 = objc_msgSend(v145, "numberWithDouble:");
    [v12 setObject:v146 forKey:@"measurementCurrentSNR"];

    v147 = NSNumber;
    [v11 ldcmMeasureVoltageSNR];
    v148 = objc_msgSend(v147, "numberWithDouble:");
    [v12 setObject:v148 forKey:@"measurementVoltageSNR"];

    int v149 = [v11 ldcmWet];
    if (!a4 || v149 == 1)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v223 = 0;
        _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - wetOnConnect!!!", v223, 2u);
      }
      int v45 = @"com.apple.ioaccessorymanager.ldcm.usbc.wetOnConnect";
    }
    else
    {
      int v150 = [v11 ldcmWet];
      if (a4 == 1 || v150 == 2)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v223 = 0;
          _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - wetOnDisconnect!!!", v223, 2u);
        }
        int v45 = @"com.apple.ioaccessorymanager.ldcm.usbc.wetOnDisconnect";
      }
      else
      {
        BOOL v151 = [(IOPortLDCMManagerV4 *)self checkIsReceptacleEmpty];
        BOOL v152 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
        if (v151)
        {
          if (v152)
          {
            *(_WORD *)v223 = 0;
            _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - dryToWetTransition!!!", v223, 2u);
          }
          int v45 = @"com.apple.ioaccessorymanager.ldcm.usbc.dryToWetTransition";
        }
        else
        {
          if (v152)
          {
            *(_WORD *)v223 = 0;
            _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - dryToWetTransitionPortNotEmpty!!!", v223, 2u);
          }
          int v45 = @"com.apple.ioaccessorymanager.ldcm.usbc.dryToWetTransitionPortNotEmpty";
        }
      }
    }
    AnalyticsSendEvent();
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      [v11 ldcmLoadImpMag];
      uint64_t v193 = v192;
      [v11 ldcmLoadImpPhase];
      uint64_t v195 = v194;
      [v11 ldcmCalculatedRes];
      uint64_t v197 = v196;
      [v11 ldcmCalculatedCap];
      *(_DWORD *)v223 = 134218752;
      *(void *)&v223[4] = v193;
      *(_WORD *)&v223[12] = 2048;
      *(void *)&v223[14] = v195;
      *(_WORD *)&v223[22] = 2048;
      *(void *)&v223[24] = v197;
      *(_WORD *)&v223[32] = 2048;
      *(void *)&v223[34] = v198;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - dryToWetTransition - loadImpMag: %f, loadImpPhase: %f, calculatedRes: %f, calculatedCap: %f", v223, 0x2Au);
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      [v11 ldcmTIACurrentAmp];
      uint64_t v200 = v199;
      [v11 ldcmVoltageAmp];
      uint64_t v202 = v201;
      [v11 ldcmLeakageCurrentAmp];
      *(_DWORD *)v223 = 134218496;
      *(void *)&v223[4] = v200;
      *(_WORD *)&v223[12] = 2048;
      *(void *)&v223[14] = v202;
      *(_WORD *)&v223[22] = 2048;
      *(void *)&v223[24] = v203;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - dryToWetTransition - TIACurrentAmp: %f, VoltageAmp: %f, LeakageCurrentAmp: %f", v223, 0x20u);
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      [v11 ldcmMeasureTIASNR];
      uint64_t v205 = v204;
      [v11 ldcmMeasureVoltageSNR];
      uint64_t v207 = v206;
      [v11 ldcmLeakageCurrentAmp];
      *(_DWORD *)v223 = 134218496;
      *(void *)&v223[4] = v205;
      *(_WORD *)&v223[12] = 2048;
      *(void *)&v223[14] = v207;
      *(_WORD *)&v223[22] = 2048;
      *(void *)&v223[24] = v208;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - dryToWetTransition - MeasureTIASNR: %f, MeasureVoltageSNR: %f, LeakageCurrentAmp: %f", v223, 0x20u);
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      [v11 ldcmCalTIAAmp];
      uint64_t v210 = v209;
      [v11 ldcmCalVoltageAmp];
      uint64_t v212 = v211;
      [v11 ldcmCalTIASNR];
      uint64_t v214 = v213;
      [v11 ldcmCalVoltageSNR];
      *(_DWORD *)v223 = 134218752;
      *(void *)&v223[4] = v210;
      *(_WORD *)&v223[12] = 2048;
      *(void *)&v223[14] = v212;
      *(_WORD *)&v223[22] = 2048;
      *(void *)&v223[24] = v214;
      *(_WORD *)&v223[32] = 2048;
      *(void *)&v223[34] = v215;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - dryToWetTransition - CalTIAAmp: %f, CalVoltageAmp: %f, CalTIASNR: %f, CalVoltageSNR: %f", v223, 0x2Au);
    }
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_127;
    }
    [v11 ldcmTIAGainCorrection];
    uint64_t v217 = v216;
    [v11 ldcmVoltageGainCorrection];
    uint64_t v219 = v218;
    [v11 ldcmPhaseComp];
    *(_DWORD *)v223 = 134218496;
    *(void *)&v223[4] = v217;
    *(_WORD *)&v223[12] = 2048;
    *(void *)&v223[14] = v219;
    *(_WORD *)&v223[22] = 2048;
    *(void *)&v223[24] = v220;
    uint64_t v48 = MEMORY[0x1E4F14500];
    uint64_t v49 = "LDCM - dryToWetTransition - TIAGainCorrection: %f, VoltageGainCorrection: %f, PhaseComp: %f";
    uint32_t v52 = 32;
    goto LABEL_32;
  }
  if ([(IOPortLDCMManagerV4 *)self previousLDCMPortStatus] == 1
    && ![v11 ldcmPortStatus]
    && (![v11 ldcmMeasurePin] || objc_msgSend(v11, "ldcmMeasurePin") == 1)
    && ![v11 ldcmCompletion]
    && ![v11 ldcmLowImp])
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v153 = NSNumber;
    [v11 ldcmLoadImpMag];
    v154 = objc_msgSend(v153, "numberWithDouble:");
    [v12 setObject:v154 forKey:@"initialImpedance"];

    v155 = NSNumber;
    [v11 ldcmCalculatedRes];
    v156 = objc_msgSend(v155, "numberWithDouble:");
    [v12 setObject:v156 forKey:@"initialResistance"];

    v157 = NSNumber;
    [v11 ldcmCalculatedCap];
    v158 = objc_msgSend(v157, "numberWithDouble:");
    [v12 setObject:v158 forKey:@"initialCapacitance"];

    v159 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v11, "ldcmWetStateDuration"));
    [v12 setObject:v159 forKey:@"wetDuration"];

    LODWORD(v159) = [(IOPortLDCMManagerV4 *)self checkIsReceptacleEmpty];
    BOOL v160 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    if (v159)
    {
      if (v160)
      {
        *(_WORD *)v223 = 0;
        _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - wetToDryTransition!!!", v223, 2u);
      }
      int v45 = @"com.apple.ioaccessorymanager.ldcm.usbc.wetToDryTransition";
    }
    else
    {
      if (v160)
      {
        *(_WORD *)v223 = 0;
        _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - wetToDryTransitionPortNotEmpty!!!", v223, 2u);
      }
      int v45 = @"com.apple.ioaccessorymanager.ldcm.usbc.wetToDryTransitionPortNotEmpty";
    }
    AnalyticsSendEvent();
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v223 = 0;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - wetToDryTransition!!!", v223, 2u);
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      [v11 ldcmLoadImpMag];
      uint64_t v162 = v161;
      [v11 ldcmLoadImpPhase];
      uint64_t v164 = v163;
      [v11 ldcmCalculatedRes];
      uint64_t v166 = v165;
      [v11 ldcmCalculatedCap];
      *(_DWORD *)v223 = 134218752;
      *(void *)&v223[4] = v162;
      *(_WORD *)&v223[12] = 2048;
      *(void *)&v223[14] = v164;
      *(_WORD *)&v223[22] = 2048;
      *(void *)&v223[24] = v166;
      *(_WORD *)&v223[32] = 2048;
      *(void *)&v223[34] = v167;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - wetToDryTransition - loadImpMag: %f, loadImpPhase: %f, calculatedRes: %f, calculatedCap: %f", v223, 0x2Au);
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      [v11 ldcmTIACurrentAmp];
      uint64_t v169 = v168;
      [v11 ldcmVoltageAmp];
      uint64_t v171 = v170;
      [v11 ldcmLeakageCurrentAmp];
      *(_DWORD *)v223 = 134218496;
      *(void *)&v223[4] = v169;
      *(_WORD *)&v223[12] = 2048;
      *(void *)&v223[14] = v171;
      *(_WORD *)&v223[22] = 2048;
      *(void *)&v223[24] = v172;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - wetToDryTransition - TIACurrentAmp: %f, VoltageAmp: %f, LeakageCurrentAmp: %f", v223, 0x20u);
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      [v11 ldcmMeasureTIASNR];
      uint64_t v174 = v173;
      [v11 ldcmMeasureVoltageSNR];
      uint64_t v176 = v175;
      [v11 ldcmLeakageCurrentAmp];
      *(_DWORD *)v223 = 134218496;
      *(void *)&v223[4] = v174;
      *(_WORD *)&v223[12] = 2048;
      *(void *)&v223[14] = v176;
      *(_WORD *)&v223[22] = 2048;
      *(void *)&v223[24] = v177;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - wetToDryTransition - MeasureTIASNR: %f, MeasureVoltageSNR: %f, LeakageCurrentAmp: %f", v223, 0x20u);
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      [v11 ldcmCalTIAAmp];
      uint64_t v179 = v178;
      [v11 ldcmCalVoltageAmp];
      uint64_t v181 = v180;
      [v11 ldcmCalTIASNR];
      uint64_t v183 = v182;
      [v11 ldcmCalVoltageSNR];
      *(_DWORD *)v223 = 134218752;
      *(void *)&v223[4] = v179;
      *(_WORD *)&v223[12] = 2048;
      *(void *)&v223[14] = v181;
      *(_WORD *)&v223[22] = 2048;
      *(void *)&v223[24] = v183;
      *(_WORD *)&v223[32] = 2048;
      *(void *)&v223[34] = v184;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - wetToDryTransition - CalTIAAmp: %f, CalVoltageAmp: %f, CalTIASNR: %f, CalVoltageSNR: %f", v223, 0x2Au);
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      [v11 ldcmTIAGainCorrection];
      uint64_t v186 = v185;
      [v11 ldcmVoltageGainCorrection];
      uint64_t v188 = v187;
      [v11 ldcmPhaseComp];
      *(_DWORD *)v223 = 134218496;
      *(void *)&v223[4] = v186;
      *(_WORD *)&v223[12] = 2048;
      *(void *)&v223[14] = v188;
      *(_WORD *)&v223[22] = 2048;
      *(void *)&v223[24] = v189;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - wetToDryTransition - TIAGainCorrection: %f, VoltageGainCorrection: %f, PhaseComp: %f", v223, 0x20u);
    }
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_127;
    }
    int v190 = [v11 ldcmWetStateDuration];
    int v191 = [v11 ldcmWetStateTooLong];
    *(_DWORD *)v223 = 67109376;
    *(_DWORD *)&v223[4] = v190;
    *(_WORD *)&v223[8] = 1024;
    *(_DWORD *)&v223[10] = v191;
    uint64_t v48 = MEMORY[0x1E4F14500];
    uint64_t v49 = "LDCM - wetToDryTransition - WetStateDuration: %d, WetStateTooLong: %d";
    uint32_t v52 = 14;
    goto LABEL_32;
  }
  if ([v11 ldcmCompletion] == 1)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v223 = 0;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - badMeasurement!!!", v223, 2u);
    }
    int v13 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v11, "ldcmIncompSNRAmpCnt"));
    [v12 setObject:v13 forKey:@"count"];

    uint64_t v14 = NSNumber;
    [v11 ldcmTIACurrentAmp];
    uint64_t v15 = objc_msgSend(v14, "numberWithDouble:");
    [v12 setObject:v15 forKey:@"badMeasurementCurrentAmp"];

    uint64_t v16 = NSNumber;
    [v11 ldcmVoltageAmp];
    uint64_t v17 = objc_msgSend(v16, "numberWithDouble:");
    [v12 setObject:v17 forKey:@"badMeasurementVoltageAmp"];

    uint64_t v18 = NSNumber;
    [v11 ldcmCalVoltageAmp];
    uint64_t v19 = objc_msgSend(v18, "numberWithDouble:");
    [v12 setObject:v19 forKey:@"badCalVoltageAmp"];

    uint64_t v20 = NSNumber;
    [v11 ldcmCalTIAAmp];
    int v21 = objc_msgSend(v20, "numberWithDouble:");
    [v12 setObject:v21 forKey:@"badCalCurrentAmp"];

    int v22 = NSNumber;
    [v11 ldcmMeasureTIASNR];
    int v23 = objc_msgSend(v22, "numberWithDouble:");
    [v12 setObject:v23 forKey:@"badMeasurementCurrentSNR"];

    uint64_t v24 = NSNumber;
    [v11 ldcmMeasureVoltageSNR];
    uint64_t v25 = objc_msgSend(v24, "numberWithDouble:");
    [v12 setObject:v25 forKey:@"badMeasurementVoltageSNR"];

    uint64_t v26 = NSNumber;
    [v11 ldcmCalVoltageSNR];
    uint64_t v27 = objc_msgSend(v26, "numberWithDouble:");
    [v12 setObject:v27 forKey:@"badCalVoltageSNR"];

    uint64_t v28 = NSNumber;
    [v11 ldcmCalTIASNR];
    uint64_t v29 = objc_msgSend(v28, "numberWithDouble:");
    [v12 setObject:v29 forKey:@"badCalCurrentSNR"];

    AnalyticsSendEvent();
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v30 = [v11 ldcmIncompSNRAmpCnt];
      [v11 ldcmTIACurrentAmp];
      uint64_t v32 = v31;
      [v11 ldcmVoltageAmp];
      uint64_t v34 = v33;
      [v11 ldcmCalTIAAmp];
      uint64_t v36 = v35;
      [v11 ldcmCalVoltageAmp];
      *(_DWORD *)v223 = 67110144;
      *(_DWORD *)&v223[4] = v30;
      *(_WORD *)&v223[8] = 2048;
      *(void *)&v223[10] = v32;
      *(_WORD *)&v223[18] = 2048;
      *(void *)&v223[20] = v34;
      *(_WORD *)&v223[28] = 2048;
      *(void *)&v223[30] = v36;
      *(_WORD *)&v223[38] = 2048;
      *(void *)&v223[40] = v37;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - IncompSNRAmpCnt: %d, TIACurrentAmp: %f, VoltageAmp: %f, CalTIAAmp: %f, CalVoltageAmp: %f", v223, 0x30u);
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      [v11 ldcmMeasureTIASNR];
      uint64_t v39 = v38;
      [v11 ldcmMeasureVoltageSNR];
      uint64_t v41 = v40;
      [v11 ldcmCalTIASNR];
      uint64_t v43 = v42;
      [v11 ldcmCalVoltageSNR];
      *(_DWORD *)v223 = 134218752;
      *(void *)&v223[4] = v39;
      *(_WORD *)&v223[12] = 2048;
      *(void *)&v223[14] = v41;
      *(_WORD *)&v223[22] = 2048;
      *(void *)&v223[24] = v43;
      *(_WORD *)&v223[32] = 2048;
      *(void *)&v223[34] = v44;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - TIACurrentSNR: %f, VoltageSNR: %f, CalTIASNR: %f, CalVoltageSNR: %f", v223, 0x2Au);
    }
    int v45 = @"com.apple.ioaccessorymanager.ldcm.usbc.badMeasurement";
    goto LABEL_127;
  }
  if ([v11 ldcmCompletion] == 2)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v223 = 0;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - ovpError!!!", v223, 2u);
    }
    uint64_t v46 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v11, "ldcmIncompOVPCnt"));
    [v12 setObject:v46 forKey:@"count"];

    int v45 = @"com.apple.ioaccessorymanager.ldcm.usbc.ovpError";
    AnalyticsSendEvent();
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_127;
    }
    int v47 = [v11 ldcmIncompOVPCnt];
    *(_DWORD *)v223 = 67109120;
    *(_DWORD *)&v223[4] = v47;
    uint64_t v48 = MEMORY[0x1E4F14500];
    uint64_t v49 = "LDCM - IncompOVPCnt: %d";
    goto LABEL_31;
  }
  if ([v11 ldcmCompletion] == 3)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v223 = 0;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - ldcmPreempted!!!", v223, 2u);
    }
    uint64_t v50 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v11, "ldcmIncompTimeoutCnt"));
    [v12 setObject:v50 forKey:@"count"];

    int v45 = @"com.apple.ioaccessorymanager.ldcm.usbc.ldcmPreempted";
    AnalyticsSendEvent();
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_127;
    }
    int v51 = [v11 ldcmIncompTimeoutCnt];
    *(_DWORD *)v223 = 67109120;
    *(_DWORD *)&v223[4] = v51;
    uint64_t v48 = MEMORY[0x1E4F14500];
    uint64_t v49 = "LDCM - IncompTimeoutCnt: %d";
LABEL_31:
    uint32_t v52 = 8;
LABEL_32:
    _os_log_impl(&dword_1D9622000, v48, OS_LOG_TYPE_DEFAULT, v49, v223, v52);
LABEL_127:

    goto LABEL_128;
  }
  if ([v11 ldcmCompletion] == 4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v223 = 0;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - ldcmDisabled!!!", v223, 2u);
    }
    id v53 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    unsigned int v54 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v11, "ldcmFeatureStatus"));
    [v53 setObject:v54 forKey:@"disable_reason"];

    AnalyticsSendEvent();
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v55 = [v11 ldcmFeatureStatus];
      *(_DWORD *)v223 = 67109120;
      *(_DWORD *)&v223[4] = v55;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - ldcmDisabled - FeatureStatus: %d", v223, 8u);
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v223 = 0;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - selfTestFailure!!!", v223, 2u);
    }
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);

    unsigned int v56 = NSNumber;
    [v11 ldcmCalculatedRes];
    unsigned int v57 = objc_msgSend(v56, "numberWithDouble:");
    [v12 setObject:v57 forKey:@"resistance"];

    unsigned int v58 = NSNumber;
    [v11 ldcmCalculatedCap];
    v59 = objc_msgSend(v58, "numberWithDouble:");
    [v12 setObject:v59 forKey:@"capacitance"];

    AnalyticsSendEvent();
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      [v11 ldcmLoadImpMag];
      uint64_t v61 = v60;
      [v11 ldcmLoadImpPhase];
      uint64_t v63 = v62;
      [v11 ldcmCalculatedRes];
      uint64_t v65 = v64;
      [v11 ldcmCalculatedCap];
      *(_DWORD *)v223 = 134218752;
      *(void *)&v223[4] = v61;
      *(_WORD *)&v223[12] = 2048;
      *(void *)&v223[14] = v63;
      *(_WORD *)&v223[22] = 2048;
      *(void *)&v223[24] = v65;
      *(_WORD *)&v223[32] = 2048;
      *(void *)&v223[34] = v66;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - selfTestFailure - loadImpMag: %f, loadImpPhase: %f, calculatedRes: %f, calculatedCap: %f", v223, 0x2Au);
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      [v11 ldcmTIACurrentAmp];
      uint64_t v68 = v67;
      [v11 ldcmVoltageAmp];
      uint64_t v70 = v69;
      [v11 ldcmLeakageCurrentAmp];
      *(_DWORD *)v223 = 134218496;
      *(void *)&v223[4] = v68;
      *(_WORD *)&v223[12] = 2048;
      *(void *)&v223[14] = v70;
      *(_WORD *)&v223[22] = 2048;
      *(void *)&v223[24] = v71;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - selfTestFailure - TIACurrentAmp: %f, VoltageAmp: %f, LeakageCurrentAmp: %f", v223, 0x20u);
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      [v11 ldcmMeasureTIASNR];
      uint64_t v73 = v72;
      [v11 ldcmMeasureVoltageSNR];
      uint64_t v75 = v74;
      [v11 ldcmLeakageCurrentAmp];
      *(_DWORD *)v223 = 134218496;
      *(void *)&v223[4] = v73;
      *(_WORD *)&v223[12] = 2048;
      *(void *)&v223[14] = v75;
      *(_WORD *)&v223[22] = 2048;
      *(void *)&v223[24] = v76;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - selfTestFailure - MeasureTIASNR: %f, MeasureVoltageSNR: %f, LeakageCurrentAmp: %f", v223, 0x20u);
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      [v11 ldcmCalTIAAmp];
      uint64_t v78 = v77;
      [v11 ldcmCalVoltageAmp];
      uint64_t v80 = v79;
      [v11 ldcmCalTIASNR];
      uint64_t v82 = v81;
      [v11 ldcmCalVoltageSNR];
      *(_DWORD *)v223 = 134218752;
      *(void *)&v223[4] = v78;
      *(_WORD *)&v223[12] = 2048;
      *(void *)&v223[14] = v80;
      *(_WORD *)&v223[22] = 2048;
      *(void *)&v223[24] = v82;
      *(_WORD *)&v223[32] = 2048;
      *(void *)&v223[34] = v83;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - selfTestFailure - CalTIAAmp: %f, CalVoltageAmp: %f, CalTIASNR: %f, CalVoltageSNR: %f", v223, 0x2Au);
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      [v11 ldcmTIAGainCorrection];
      uint64_t v85 = v84;
      [v11 ldcmVoltageGainCorrection];
      uint64_t v87 = v86;
      [v11 ldcmPhaseComp];
      *(_DWORD *)v223 = 134218496;
      *(void *)&v223[4] = v85;
      *(_WORD *)&v223[12] = 2048;
      *(void *)&v223[14] = v87;
      *(_WORD *)&v223[22] = 2048;
      *(void *)&v223[24] = v88;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - selfTestFailure - TIAGainCorrection: %f, VoltageGainCorrection: %f, PhaseComp: %f", v223, 0x20u);
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v89 = [v11 ldcmWetStateDuration];
      int v90 = [v11 ldcmWetStateTooLong];
      *(_DWORD *)v223 = 67109376;
      *(_DWORD *)&v223[4] = v89;
      *(_WORD *)&v223[8] = 1024;
      *(_DWORD *)&v223[10] = v90;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - selfTestFailure - WetStateDuration: %d, WetStateTooLong: %d", v223, 0xEu);
    }
    int v45 = @"com.apple.ioaccessorymanager.ldcm.usbc.selfTestFailure";
    goto LABEL_127;
  }
  if ([v11 ldcmCompletion] == 5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v223 = 0;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - ldcmDisabled!!!", v223, 2u);
    }
    id v91 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v92 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v11, "ldcmFeatureStatus"));
    [v91 setObject:v92 forKey:@"disable_reason"];

    AnalyticsSendEvent();
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v93 = [v11 ldcmFeatureStatus];
      *(_DWORD *)v223 = 67109120;
      *(_DWORD *)&v223[4] = v93;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - ldcmDisabled - FeatureStatus: %d", v223, 8u);
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v223 = 0;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - referenceMeasurementFailure!!!", v223, 2u);
    }
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);

    v94 = NSNumber;
    [v11 ldcmCalculatedRes];
    v95 = objc_msgSend(v94, "numberWithDouble:");
    [v12 setObject:v95 forKey:@"resistance"];

    v96 = NSNumber;
    [v11 ldcmCalculatedCap];
    v97 = objc_msgSend(v96, "numberWithDouble:");
    [v12 setObject:v97 forKey:@"capacitance"];

    AnalyticsSendEvent();
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      [v11 ldcmLoadImpMag];
      uint64_t v99 = v98;
      [v11 ldcmLoadImpPhase];
      uint64_t v101 = v100;
      [v11 ldcmCalculatedRes];
      uint64_t v103 = v102;
      [v11 ldcmCalculatedCap];
      *(_DWORD *)v223 = 134218752;
      *(void *)&v223[4] = v99;
      *(_WORD *)&v223[12] = 2048;
      *(void *)&v223[14] = v101;
      *(_WORD *)&v223[22] = 2048;
      *(void *)&v223[24] = v103;
      *(_WORD *)&v223[32] = 2048;
      *(void *)&v223[34] = v104;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - referenceMeasurementFailure - loadImpMag: %f, loadImpPhase: %f, calculatedRes: %f, calculatedCap: %f", v223, 0x2Au);
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      [v11 ldcmTIACurrentAmp];
      uint64_t v106 = v105;
      [v11 ldcmVoltageAmp];
      uint64_t v108 = v107;
      [v11 ldcmLeakageCurrentAmp];
      *(_DWORD *)v223 = 134218496;
      *(void *)&v223[4] = v106;
      *(_WORD *)&v223[12] = 2048;
      *(void *)&v223[14] = v108;
      *(_WORD *)&v223[22] = 2048;
      *(void *)&v223[24] = v109;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - referenceMeasurementFailure - TIACurrentAmp: %f, VoltageAmp: %f, LeakageCurrentAmp: %f", v223, 0x20u);
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      [v11 ldcmMeasureTIASNR];
      uint64_t v111 = v110;
      [v11 ldcmMeasureVoltageSNR];
      uint64_t v113 = v112;
      [v11 ldcmLeakageCurrentAmp];
      *(_DWORD *)v223 = 134218496;
      *(void *)&v223[4] = v111;
      *(_WORD *)&v223[12] = 2048;
      *(void *)&v223[14] = v113;
      *(_WORD *)&v223[22] = 2048;
      *(void *)&v223[24] = v114;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - referenceMeasurementFailure - MeasureTIASNR: %f, MeasureVoltageSNR: %f, LeakageCurrentAmp: %f", v223, 0x20u);
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      [v11 ldcmCalTIAAmp];
      uint64_t v116 = v115;
      [v11 ldcmCalVoltageAmp];
      uint64_t v118 = v117;
      [v11 ldcmCalTIASNR];
      uint64_t v120 = v119;
      [v11 ldcmCalVoltageSNR];
      *(_DWORD *)v223 = 134218752;
      *(void *)&v223[4] = v116;
      *(_WORD *)&v223[12] = 2048;
      *(void *)&v223[14] = v118;
      *(_WORD *)&v223[22] = 2048;
      *(void *)&v223[24] = v120;
      *(_WORD *)&v223[32] = 2048;
      *(void *)&v223[34] = v121;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - referenceMeasurementFailure - CalTIAAmp: %f, CalVoltageAmp: %f, CalTIASNR: %f, CalVoltageSNR: %f", v223, 0x2Au);
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      [v11 ldcmTIAGainCorrection];
      uint64_t v123 = v122;
      [v11 ldcmVoltageGainCorrection];
      uint64_t v125 = v124;
      [v11 ldcmPhaseComp];
      *(_DWORD *)v223 = 134218496;
      *(void *)&v223[4] = v123;
      *(_WORD *)&v223[12] = 2048;
      *(void *)&v223[14] = v125;
      *(_WORD *)&v223[22] = 2048;
      *(void *)&v223[24] = v126;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - referenceMeasurementFailure - TIAGainCorrection: %f, VoltageGainCorrection: %f, PhaseComp: %f", v223, 0x20u);
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v127 = [v11 ldcmWetStateDuration];
      int v128 = [v11 ldcmWetStateTooLong];
      *(_DWORD *)v223 = 67109376;
      *(_DWORD *)&v223[4] = v127;
      *(_WORD *)&v223[8] = 1024;
      *(_DWORD *)&v223[10] = v128;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - referenceMeasurementFailure - WetStateDuration: %d, WetStateTooLong: %d", v223, 0xEu);
    }
    int v45 = @"com.apple.ioaccessorymanager.ldcm.usbc.referenceMeasurementFailure";
    goto LABEL_127;
  }
  if ([v11 ldcmLowImp] == 1)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v223 = 0;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - impedanceTooLow!!!", v223, 2u);
    }
    v129 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v11, "ldcmIncompTimeoutCnt"));
    [v12 setObject:v129 forKey:@"count"];

    int v45 = @"com.apple.ioaccessorymanager.ldcm.usbc.impedanceTooLow";
    AnalyticsSendEvent();
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_127;
    }
    [v11 ldcmLoadImpMag];
    uint64_t v131 = v130;
    [v11 ldcmLoadImpPhase];
    uint64_t v133 = v132;
    [v11 ldcmCalculatedRes];
    uint64_t v135 = v134;
    [v11 ldcmCalculatedCap];
    *(_DWORD *)v223 = 134218752;
    *(void *)&v223[4] = v131;
    *(_WORD *)&v223[12] = 2048;
    *(void *)&v223[14] = v133;
    *(_WORD *)&v223[22] = 2048;
    *(void *)&v223[24] = v135;
    *(_WORD *)&v223[32] = 2048;
    *(void *)&v223[34] = v136;
    uint64_t v48 = MEMORY[0x1E4F14500];
    uint64_t v49 = "LDCM - impedanceTooLow - loadImpMag: %f, loadImpPhase: %f, calculatedRes: %f, calculatedCap: %f";
    uint32_t v52 = 42;
    goto LABEL_32;
  }
  int v45 = @"None";
LABEL_128:
  if (self->_previousLDCMPortStatus == 1)
  {
    int v221 = [v11 ldcmPortStatus];
    if (!a4 && v221 == 1)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v223 = 0;
        _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - WetReplug", v223, 2u);
      }
      AnalyticsSendEvent();
    }
  }
  self->_int previousLDCMPortStatus = objc_msgSend(v11, "ldcmPortStatus", *(_OWORD *)v223, *(_OWORD *)&v223[16], *(void *)&v223[32], *(void *)&v223[40]);

  return v45;
}

- (unsigned)previousLDCMPortStatus
{
  return self->_previousLDCMPortStatus;
}

- (void)performLDCMMeasurement:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v34 = v3;
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - Beginning LDCM measurement. Reason: %d", buf, 8u);
  }
  uint64_t v32 = 55;
  memset(v35, 0, sizeof(v35));
  uint64_t v31 = 1152;
  bzero(buf, 0x480uLL);
  if (!self->_waveformExtractionDisabled)
  {
    int v5 = [(IOPortLDCMManagerV4 *)self getWaveform:buf :&v31];
    if (v5)
    {
      int v23 = v5;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[IOPortLDCMManagerV4 performLDCMMeasurement:].cold.4(v23);
      }
    }
    if (v31 != 1152 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[IOPortLDCMManagerV4 performLDCMMeasurement:]((uint64_t)&v31, v24, v25, v26, v27, v28, v29, v30);
    }
  }
  int v6 = -[IOPortLDCMManagerV4 getData::](self, "getData::", v35, &v32, v31);
  if (v6)
  {
    int v15 = v6;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[IOPortLDCMManagerV4 performLDCMMeasurement:](v15);
    }
    goto LABEL_27;
  }
  if (v32 != 55)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[IOPortLDCMManagerV4 performLDCMMeasurement:]((uint64_t)&v32, v16, v17, v18, v19, v20, v21, v22);
    }
LABEL_27:
    id v9 = 0;
    id v10 = @"None";
    goto LABEL_20;
  }
  v7 = [LDCMMeasurementV4 alloc];
  id v8 = [(LDCMMeasurementV4 *)v7 initWithParams:v35 :v32];
  id v9 = v8;
  if (v3 != 2) {
    [(IOPortLDCMManagerV4 *)self handleMeasurementResults:[(LDCMMeasurementV4 *)v8 ldcmPortStatus]];
  }
  id v10 = [(IOPortLDCMManagerV4 *)self publishAnalytics:v9 withMeasurementReason:v3 withWaveformRawData:buf withWaveformDataLen:v31];
  self->_measurementInfoOutputString = (NSString *)[(IOPortLDCMManagerV4 *)self buildMeasurementOutputString:v9 withMeasurementReason:v3 withMeasurementEvent:v10];
  if (self->_buildType != 2)
  {
    [(IOPortLDCMManagerV4 *)self logInfo:v9];
    [(IOPortLDCMManagerV4 *)self generateLDCMCSVData];
  }
  if ([(LDCMMeasurementV4 *)v9 ldcmPortStatus] == 1)
  {
    self->_isWet = 1;
    [(IOPortLDCMManagerV4 *)self setMitigations:1];
    if (!self->_isReceptacleEmpty) {
      [(IOPortLDCMManagerV4 *)self measureOccupiedWetPortDuration];
    }
  }
  else
  {
    if ([(IOPortLDCMManagerV4 *)self checkIsReceptacleEmpty])
    {
      [(IOPortLDCMManagerV4 *)self setUserOverride:0];
      [(IOPortLDCMManagerV4 *)self setMitigations:0];
    }
    self->_isWet = 0;
  }
  if (v3 == 1) {
    [(IOPortLDCMManagerV4 *)self measureOccupiedWetPortDuration];
  }
LABEL_20:
  uint64_t v11 = 64;
  if (!self->_isWet) {
    uint64_t v11 = 72;
  }
  int64_t v12 = *(int64_t *)((char *)&self->super.isa + v11);
  timer = self->_timer;
  dispatch_time_t v14 = dispatch_walltime(0, v12);
  dispatch_source_set_timer(timer, v14, 0xFFFFFFFFFFFFFFFFLL, 0);
}

- (BOOL)checkIsReceptacleEmpty
{
  kern_return_t MatchingServices;
  io_object_t v5;
  BOOL v6;
  BOOL v7;
  io_object_t v8;
  io_registry_entry_t v9;
  CFAllocatorRef v10;
  CFNumberRef CFProperty;
  CFNumberRef v12;
  CFBooleanRef v13;
  CFBooleanRef v14;
  int valuePtr;
  io_iterator_t existing;

  existing = 0;
  mach_port_t v2 = *MEMORY[0x1E4F2EEF0];
  CFDictionaryRef v3 = IOServiceMatching("IOPort");
  MatchingServices = IOServiceGetMatchingServices(v2, v3, &existing);
  int v5 = existing;
  if (MatchingServices) {
    int v6 = 1;
  }
  else {
    int v6 = existing == 0;
  }
  if (v6)
  {
    v7 = 1;
    if (!existing) {
      return !v7;
    }
    goto LABEL_22;
  }
  id v8 = IOIteratorNext(existing);
  if (v8)
  {
    id v9 = v8;
    id v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    do
    {
      valuePtr = 0;
      CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v9, @"PortType", v10, 0);
      int64_t v12 = CFProperty;
      if (CFProperty)
      {
        CFNumberGetValue(CFProperty, kCFNumberIntType, &valuePtr);
        if (valuePtr == 2)
        {
          int v13 = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v9, @"ConnectionActive", v10, 0);
          if (v13)
          {
            dispatch_time_t v14 = v13;
            v7 = CFBooleanGetValue(v13) != 0;
            CFRelease(v14);
          }
          else
          {
            v7 = 1;
          }
          IOObjectRelease(v9);
          goto LABEL_20;
        }
      }
      id v9 = IOIteratorNext(existing);
    }
    while (v9);
    v7 = 1;
    if (!v12) {
      goto LABEL_21;
    }
LABEL_20:
    CFRelease(v12);
  }
  else
  {
    v7 = 1;
  }
LABEL_21:
  int v5 = existing;
  if (existing) {
LABEL_22:
  }
    IOObjectRelease(v5);
  return !v7;
}

- (int)getWaveform:(char *)a3 :(unint64_t *)a4
{
  return IOConnectCallStructMethod(self->_ldcmFeatureConnect, 0x3F0u, 0, 0, a3, a4);
}

- (int)getData:(char *)outputStruct :(unint64_t *)outputStructCnt
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t ldcmFeatureConnect = self->_ldcmFeatureConnect;
  input[0] = 1;
  return IOConnectCallMethod(ldcmFeatureConnect, 0x3EDu, input, 1u, 0, 0, 0, 0, outputStruct, outputStructCnt);
}

- (void)generateLDCMCSVData
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v3 = [(IOPortLDCMManagerV4 *)self getMeasurementOutputString];
  id v4 = [(IOPortLDCMManagerV4 *)self buildMeasurementHeaderString];
  if (v3 && [v3 length])
  {
    char v55 = 0;
    int v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v6 = [v5 fileExistsAtPath:@"/var/logs/ldcm/" isDirectory:&v55];

    if (v6)
    {
      id v7 = 0;
    }
    else
    {
      id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v54 = 0;
      [v8 createDirectoryAtPath:@"/var/logs/ldcm/" withIntermediateDirectories:1 attributes:0 error:&v54];
      id v9 = v54;

      id v7 = 0;
      if (v9)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          unsigned int v57 = "-[IOPortLDCMManagerV4 generateLDCMCSVData]";
          __int16 v58 = 2112;
          id v59 = v9;
          _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s Error in creating directory. %@\n", buf, 0x16u);
        }
        id v7 = v9;
      }
    }
    int v45 = v7;
    id v10 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v11 = [v10 UUIDString];

    uint64_t v46 = (void *)v11;
    int64_t v12 = [MEMORY[0x1E4F28E78] stringWithFormat:@"%@%@%@.csv", @"/var/logs/ldcm/", @"internalMeasurementData", v11];
    int v13 = [MEMORY[0x1E4F28CB8] defaultManager];
    dispatch_time_t v14 = [v13 contentsOfDirectoryAtPath:@"/var/logs/ldcm/" error:0];

    int v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self BEGINSWITH[cd] 'internalMeasurementData'"];
    uint64_t v16 = [v14 filteredArrayUsingPredicate:v15];

    if (![v16 count])
    {
      uint64_t v30 = v45;
LABEL_14:
      uint64_t v32 = [MEMORY[0x1E4F28CB0] fileHandleForWritingAtPath:v12];
      if (v32)
      {
        uint64_t v33 = (void *)v32;
      }
      else
      {
        int v34 = [MEMORY[0x1E4F28CB8] defaultManager];
        [v34 createFileAtPath:v12 contents:0 attributes:0];

        uint64_t v33 = [MEMORY[0x1E4F28CB0] fileHandleForWritingAtPath:v12];
        if (v33)
        {
          uint64_t v35 = [v4 dataUsingEncoding:4];
          id v50 = 0;
          [v33 writeData:v35 error:&v50];
          id v36 = v50;

          uint64_t v30 = v36;
        }
      }
      id v49 = 0;
      int v37 = [v33 seekToEndReturningOffset:0 error:&v49];
      id v38 = v49;

      if (v37)
      {
        uint64_t v39 = [v3 dataUsingEncoding:4];
        id v48 = 0;
        [v33 writeData:v39 error:&v48];
        id v40 = v48;

        id v38 = v40;
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        unsigned int v57 = "-[IOPortLDCMManagerV4 generateLDCMCSVData]";
        __int16 v58 = 2112;
        id v59 = v38;
        _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s LDCM - Error in seeking to end of file. %@\n", buf, 0x16u);
      }
      id v47 = 0;
      char v41 = [v33 closeAndReturnError:&v47];
      id v42 = v47;

      if ((v41 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        unsigned int v57 = "-[IOPortLDCMManagerV4 generateLDCMCSVData]";
        __int16 v58 = 2112;
        id v59 = v42;
        _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s LDCM - Error in closing file. %@\n", buf, 0x16u);
      }

      goto LABEL_26;
    }
    uint64_t v43 = v4;
    uint64_t v44 = v3;
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __42__IOPortLDCMManagerV4_generateLDCMCSVData__block_invoke;
    v52[3] = &unk_1E6B6D6D8;
    id v53 = @"/var/logs/ldcm/";
    uint64_t v17 = [v16 sortedArrayUsingComparator:v52];
    uint64_t v18 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v19 = NSString;
    uint64_t v20 = [v17 lastObject];
    uint64_t v21 = [v19 stringWithFormat:@"%@%@", @"/var/logs/ldcm/", v20];
    uint64_t v22 = [v18 attributesOfItemAtPath:v21 error:0];

    int v23 = [v22 valueForKey:*MEMORY[0x1E4F28390]];
    uint64_t v24 = [NSNumber numberWithUnsignedLongLong:10485760];
    unint64_t v25 = [v23 unsignedLongLongValue];
    if (v25 <= [v24 unsignedLongLongValue])
    {
      uint64_t v31 = (void *)MEMORY[0x1E4F28E78];
      uint64_t v28 = [v17 lastObject];
      [v31 stringWithFormat:@"%@%@", @"/var/logs/ldcm/", v28];
      v12 = uint64_t v29 = v12;
    }
    else
    {
      if ((unint64_t)[v16 count] < 0xA)
      {
LABEL_13:
        uint64_t v30 = v45;

        id v4 = v43;
        CFDictionaryRef v3 = v44;
        goto LABEL_14;
      }
      uint64_t v26 = NSString;
      uint64_t v27 = [v17 firstObject];
      uint64_t v28 = [v26 stringWithFormat:@"%@%@", @"/var/logs/ldcm/", v27];

      uint64_t v29 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v51 = 0;
      [v29 removeItemAtPath:v28 error:&v51];
    }

    goto LABEL_13;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Nothing to write to csv file.\n", buf, 2u);
  }
LABEL_26:
}

- (NSString)measurementInfoOutputString
{
  return self->_measurementInfoOutputString;
}

- (id)buildMeasurementHeaderString
{
  return (id)[MEMORY[0x1E4F28E78] stringWithFormat:@"date,measurementReason,measurementEvent,ldcmPortStatus,ldcmMitigationsStatus,ldcmFeatureStatus,ldcmMeasurePin,ldcmCompletion,ldcmWet,ldcmLowImp,ldcmLoadImpMag,ldcmLoadImpPhase,ldcmCalculatedRes,ldcmCalculatedCap,ldcmTIACurrentAmp,ldcmVoltageAmp,ldcmLeakageCurrentAmp,ldcmMeasureTIASNR,ldcmMeasureVoltageSNR,ldcmCalTIAAmp,ldcmCalVoltageAmp,ldcmCalTIASNR,ldcmCalVoltageSNR,ldcmTIAGainCorrection,ldcmVoltageGainCorrection,ldcmPhaseComp,ldcmWetStateDuration,ldcmWetStateTooLong,ldcmIncompSNRAmpCnt,ldcmIncompOVPCnt,ldcmIncompTimeoutCnt\n"];
}

- (IOPortLDCMManagerV4)initWithParams:(unint64_t)a3 withDryPollingInterval:(unint64_t)a4 withService:(unsigned int)a5 withNotificationPort:(IONotificationPort *)a6 withServerRunloop:(__CFRunLoop *)a7
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  io_registry_entry_t parent = 0;
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __112__IOPortLDCMManagerV4_initWithParams_withDryPollingInterval_withService_withNotificationPort_withServerRunloop___block_invoke;
  v42[3] = &unk_1E6B6D688;
  int64_t v12 = self;
  uint64_t v43 = v12;
  int v13 = (void *)MEMORY[0x1E01663B0](v42);
  dispatch_time_t v14 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v41.receiver = v12;
  v41.super_class = (Class)IOPortLDCMManagerV4;
  int v15 = [(IOPortLDCMManagerV4 *)&v41 init];
  uint64_t v16 = (unsigned __int8 *)v15;
  if (!v15)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v46 = "-[IOPortLDCMManagerV4 initWithParams:withDryPollingInterval:withService:withNotificationPort:withServerRunloop:]";
    uint64_t v35 = MEMORY[0x1E4F14500];
    id v36 = "%s Failed to initialize IOPortLDCMManagerV4 super\n";
    goto LABEL_67;
  }
  *((_DWORD *)v15 + 5) = 0;
  *((_WORD *)v15 + 4) = 0;
  *((void *)v15 + 8) = a3;
  *((void *)v15 + 9) = a4;
  *(_WORD *)(v15 + 11) = 0;
  v15[15] = [v14 BOOLForKey:@"LDCMV4DisableMitigations"];
  v16[16] = [v14 BOOLForKey:@"LDCMV4DisableUI"];
  v16[14] = [v14 BOOLForKey:@"LDCMWaveformExtractionDisabled"];
  *((_DWORD *)v16 + 9) = 0;
  v16[10] = [v16 checkIsReceptacleEmpty];
  uint64_t v17 = [[LDCMNotificationUIManagerV4 alloc] initWithParams:a7 :v16];
  uint64_t v18 = (void *)*((void *)v16 + 7);
  *((void *)v16 + 7) = v17;

  if (IOServiceOpen(a5, *MEMORY[0x1E4F14960], 0, (io_connect_t *)v16 + 6))
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v46 = "-[IOPortLDCMManagerV4 initWithParams:withDryPollingInterval:withService:withNotificationPort:withServerRunloop:]";
    uint64_t v35 = MEMORY[0x1E4F14500];
    id v36 = "%s Failed to open LDCM kernel service\n";
    goto LABEL_67;
  }
  if (IOServiceAddInterestNotification(a6, a5, "IOGeneralInterest", (IOServiceInterestCallback)IOPortLDCMFeatureInterestCallback, v16, (io_object_t *)v16 + 5))
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v46 = "-[IOPortLDCMManagerV4 initWithParams:withDryPollingInterval:withService:withNotificationPort:withServerRunloop:]";
    uint64_t v35 = MEMORY[0x1E4F14500];
    id v36 = "%s Failed to set up LDCM interrupts interest notification\n";
    goto LABEL_67;
  }
  if (IORegistryEntryGetParentEntry(a5, "IOService", &parent))
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v46 = "-[IOPortLDCMManagerV4 initWithParams:withDryPollingInterval:withService:withNotificationPort:withServerRunloop:]";
    uint64_t v35 = MEMORY[0x1E4F14500];
    id v36 = "%s Failed to get IOPort kernel service\n";
    goto LABEL_67;
  }
  if (!parent)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v46 = "-[IOPortLDCMManagerV4 initWithParams:withDryPollingInterval:withService:withNotificationPort:withServerRunloop:]";
    uint64_t v35 = MEMORY[0x1E4F14500];
    id v36 = "%s Failed to get IOPort kernel service\n";
    goto LABEL_67;
  }
  if (!IOObjectConformsTo(parent, "IOPort"))
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v46 = "-[IOPortLDCMManagerV4 initWithParams:withDryPollingInterval:withService:withNotificationPort:withServerRunloop:]";
    uint64_t v35 = MEMORY[0x1E4F14500];
    id v36 = "%s Failed to get IOPort kernel service\n";
    goto LABEL_67;
  }
  if (IOServiceAddInterestNotification(a6, parent, "IOGeneralInterest", (IOServiceInterestCallback)IOPortLDCMPortInterestCallback, v16, (io_object_t *)v16 + 5))
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v46 = "-[IOPortLDCMManagerV4 initWithParams:withDryPollingInterval:withService:withNotificationPort:withServerRunloop:]";
    uint64_t v35 = MEMORY[0x1E4F14500];
    id v36 = "%s Failed to set up LDCM attach/detach interest notification\n";
    goto LABEL_67;
  }
  uint64_t v19 = (const void *)MGCopyAnswer();
  if (v19)
  {
    uint64_t v20 = v19;
    if (CFEqual(v19, @"Internal"))
    {
      *((_DWORD *)v16 + 7) = 0;
    }
    else
    {
      if (CFEqual(v20, @"NonUI")) {
        int v21 = 1;
      }
      else {
        int v21 = 2;
      }
      *((_DWORD *)v16 + 7) = v21;
    }
    CFRelease(v20);
  }
  else
  {
    *((_DWORD *)v16 + 7) = 2;
  }
  uint64_t v22 = (const void *)MGCopyAnswer();
  if (v22)
  {
    int v23 = v22;
    if (CFEqual(v22, @"iPhone"))
    {
      *((_DWORD *)v16 + 8) = 0;
    }
    else
    {
      if (CFEqual(v23, @"iPad")) {
        int v24 = 1;
      }
      else {
        int v24 = 2;
      }
      *((_DWORD *)v16 + 8) = v24;
    }
    CFRelease(v23);
  }
  else
  {
    *((_DWORD *)v16 + 8) = 2;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v25 = v16[14];
    *(_DWORD *)buf = 67109120;
    LODWORD(v46) = v25;
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - Waveform extraction default setting: %d", buf, 8u);
  }
  int v26 = *((_DWORD *)v16 + 7);
  if (!v16[14])
  {
    if (v26 != 2)
    {
      if ([v16 setWaveformExtractionEnabled:1])
      {
        v16[14] = 1;
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_36;
        }
        *(_WORD *)buf = 0;
        uint64_t v27 = MEMORY[0x1E4F14500];
        uint64_t v28 = "LDCM - Failed to enable waveform extraction!";
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_36;
        }
        *(_WORD *)buf = 0;
        uint64_t v27 = MEMORY[0x1E4F14500];
        uint64_t v28 = "LDCM - Successfully enabled waveform extraction.";
      }
LABEL_35:
      _os_log_impl(&dword_1D9622000, v27, OS_LOG_TYPE_DEFAULT, v28, buf, 2u);
      goto LABEL_36;
    }
LABEL_33:
    v16[14] = 1;
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_36;
    }
    *(_WORD *)buf = 0;
    uint64_t v27 = MEMORY[0x1E4F14500];
    uint64_t v28 = "LDCM - Waveform extraction not enabled due to build type.";
    goto LABEL_35;
  }
  if (v26 == 2) {
    goto LABEL_33;
  }
LABEL_36:
  dispatch_queue_t v29 = dispatch_queue_create("ldcmV4DispatchQueue", 0);
  uint64_t v30 = (void *)*((void *)v16 + 5);
  *((void *)v16 + 5) = v29;

  uint64_t v31 = *((void *)v16 + 5);
  if (!v31)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v46 = "-[IOPortLDCMManagerV4 initWithParams:withDryPollingInterval:withService:withNotificationPort:withServerRunloop:]";
    uint64_t v35 = MEMORY[0x1E4F14500];
    id v36 = "%s Failed to create ldcmV4DispatchQueue\n";
LABEL_67:
    uint32_t v37 = 12;
LABEL_40:
    _os_log_impl(&dword_1D9622000, v35, OS_LOG_TYPE_DEFAULT, v36, buf, v37);
    goto LABEL_41;
  }
  dispatch_source_t v32 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v31);
  uint64_t v33 = (void *)*((void *)v16 + 6);
  *((void *)v16 + 6) = v32;

  int v34 = *((void *)v16 + 6);
  if (v34)
  {
    dispatch_source_set_event_handler(v34, v13);
    dispatch_source_set_timer(*((dispatch_source_t *)v16 + 6), 0, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume(*((dispatch_object_t *)v16 + 6));
    [v16 setOverride:0];
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    *(_WORD *)buf = 0;
    uint64_t v35 = MEMORY[0x1E4F14500];
    id v36 = "LDCM - IOPortLDCMManagerV4 successfully initialized!";
    uint32_t v37 = 2;
    goto LABEL_40;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v46 = "-[IOPortLDCMManagerV4 initWithParams:withDryPollingInterval:withService:withNotificationPort:withServerRunloop:]";
    uint64_t v35 = MEMORY[0x1E4F14500];
    id v36 = "%s Failed to create LDCM V4 Timer\n";
    goto LABEL_67;
  }
LABEL_41:
  if (parent) {
    IOObjectRelease(parent);
  }
  id v38 = v16;

  return v38;
}

- (void)dealloc
{
  io_connect_t ldcmFeatureConnect = self->_ldcmFeatureConnect;
  if (ldcmFeatureConnect) {
    IOServiceClose(ldcmFeatureConnect);
  }
  io_object_t notification = self->_notification;
  if (notification) {
    IOObjectRelease(notification);
  }
  v5.receiver = self;
  v5.super_class = (Class)IOPortLDCMManagerV4;
  [(IOPortLDCMManagerV4 *)&v5 dealloc];
}

- (void)handleAttachEvent
{
  ldcmV4DispatchQueue = self->_ldcmV4DispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__IOPortLDCMManagerV4_handleAttachEvent__block_invoke;
  block[3] = &unk_1E6B6D688;
  block[4] = self;
  dispatch_async(ldcmV4DispatchQueue, block);
}

uint64_t __40__IOPortLDCMManagerV4_handleAttachEvent__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 10) = 0;
  return [*(id *)(a1 + 32) performLDCMMeasurement:0];
}

- (void)handleDetachEvent
{
  ldcmV4DispatchQueue = self->_ldcmV4DispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__IOPortLDCMManagerV4_handleDetachEvent__block_invoke;
  block[3] = &unk_1E6B6D688;
  block[4] = self;
  dispatch_async(ldcmV4DispatchQueue, block);
}

uint64_t __40__IOPortLDCMManagerV4_handleDetachEvent__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 10) = 1;
  [*(id *)(a1 + 32) hideUI];
  mach_port_t v2 = *(void **)(a1 + 32);
  return [v2 performLDCMMeasurement:1];
}

- (void)handleLDCMInterrupt
{
  ldcmV4DispatchQueue = self->_ldcmV4DispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__IOPortLDCMManagerV4_handleLDCMInterrupt__block_invoke;
  block[3] = &unk_1E6B6D688;
  block[4] = self;
  dispatch_async(ldcmV4DispatchQueue, block);
}

uint64_t __42__IOPortLDCMManagerV4_handleLDCMInterrupt__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performLDCMMeasurement:3];
}

- (void)handleLDCMMitigationsStatusChange:(int)a3
{
  ldcmV4DispatchQueue = self->_ldcmV4DispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__IOPortLDCMManagerV4_handleLDCMMitigationsStatusChange___block_invoke;
  v4[3] = &unk_1E6B6D6B0;
  v4[4] = self;
  int v5 = a3;
  dispatch_async(ldcmV4DispatchQueue, v4);
}

uint64_t __57__IOPortLDCMManagerV4_handleLDCMMitigationsStatusChange___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 36) = *(_DWORD *)(result + 40);
  uint64_t v1 = result;
  switch(*(_DWORD *)(result + 40))
  {
    case 0:
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      __int16 v7 = 0;
      mach_port_t v2 = MEMORY[0x1E4F14500];
      CFDictionaryRef v3 = "LDCM - Mitigations no longer active.";
      id v4 = (uint8_t *)&v7;
      goto LABEL_10;
    case 1:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v9 = 0;
        _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - Mitigations successful. Showing UI", v9, 2u);
      }
      result = [*(id *)(v1 + 32) showUI];
      break;
    case 2:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - WARNING: Mitigations failed!!!", buf, 2u);
      }
      int v5 = *(_DWORD **)(v1 + 32);
      if (v5[8] == 1) {
        [v5 showUI];
      }
      else {
        [v5 hideUI];
      }
      result = AnalyticsSendEvent();
      break;
    case 3:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v6) = 0;
        mach_port_t v2 = MEMORY[0x1E4F14500];
        CFDictionaryRef v3 = "LDCM - Mitigations triggered... Waiting for attach and/or mitigations success.";
        id v4 = (uint8_t *)&v6;
LABEL_10:
        _os_log_impl(&dword_1D9622000, v2, OS_LOG_TYPE_DEFAULT, v3, v4, 2u);
      }
LABEL_11:
      result = objc_msgSend(*(id *)(v1 + 32), "hideUI", v6);
      break;
    default:
      return result;
  }
  return result;
}

- (void)handleMeasurementResults:(int)a3
{
  CFDictionaryRef v3 = self;
  if (a3 == 1)
  {
    self->_isWet = 1;
LABEL_8:
    [(IOPortLDCMManagerV4 *)self setMitigations:*(void *)&a3];
    return;
  }
  self->_isWet = 0;
  if ([(IOPortLDCMManagerV4 *)self checkIsReceptacleEmpty])
  {
    if (v3->_overrideEnabled) {
      [(IOPortLDCMManagerV4 *)v3 setUserOverride:0];
    }
    if (v3->_mitigationsEnabled)
    {
      self = v3;
      *(void *)&a3 = 0;
      goto LABEL_8;
    }
  }
}

- (void)storeWaveform:(char *)a3 withWaveformDataLen:(unint64_t)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (a4 == 1152)
  {
    if (self->_waveformExtractionDisabled)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[IOPortLDCMManagerV4 storeWaveform:withWaveformDataLen:]();
      }
    }
    else
    {
      uint64_t v35 = [MEMORY[0x1E4F1C9B8] dataWithBytes:a3 length:1152];
      id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
      int v5 = [v4 contentsOfDirectoryAtPath:@"/var/logs/ldcm/" error:0];

      uint64_t v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self BEGINSWITH[cd] 'internalWaveformData'"];
      int v34 = v5;
      __int16 v7 = [v5 filteredArrayUsingPredicate:v6];

      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v8 = v7;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v40 objects:v48 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v41 != v11) {
              objc_enumerationMutation(v8);
            }
            int v13 = [NSString stringWithFormat:@"%@%@", @"/var/logs/ldcm/", *(void *)(*((void *)&v40 + 1) + 8 * i)];
            dispatch_time_t v14 = [MEMORY[0x1E4F28CB8] defaultManager];
            uint64_t v39 = 0;
            [v14 removeItemAtPath:v13 error:&v39];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v40 objects:v48 count:16];
        }
        while (v10);
      }

      int v15 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v16 = [v15 UUIDString];

      uint64_t v17 = [MEMORY[0x1E4F28E78] stringWithFormat:@"%@%@%@.bin", @"/var/logs/ldcm/", @"internalWaveformData", v16];
      uint64_t v18 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v18 createFileAtPath:v17 contents:0 attributes:0];

      uint64_t v19 = [MEMORY[0x1E4F28CB0] fileHandleForWritingAtPath:v17];
      id v38 = 0;
      int v20 = [v19 seekToEndReturningOffset:0 error:&v38];
      id v21 = v38;
      if (v20)
      {
        id v37 = 0;
        uint64_t v22 = (void *)v35;
        [v19 writeData:v35 error:&v37];
        id v23 = v37;

        id v21 = v23;
      }
      else
      {
        uint64_t v22 = (void *)v35;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          int v45 = "-[IOPortLDCMManagerV4 storeWaveform:withWaveformDataLen:]";
          __int16 v46 = 2112;
          id v47 = v21;
          _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s LDCM - Error in seeking to end of file. %@\n", buf, 0x16u);
        }
      }
      id v36 = 0;
      char v24 = [v19 closeAndReturnError:&v36];
      id v25 = v36;

      if ((v24 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        int v45 = "-[IOPortLDCMManagerV4 storeWaveform:withWaveformDataLen:]";
        __int16 v46 = 2112;
        id v47 = v25;
        _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s LDCM - Error in closing file. %@\n", buf, 0x16u);
      }
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[IOPortLDCMManagerV4 storeWaveform:withWaveformDataLen:](a4, v27, v28, v29, v30, v31, v32, v33);
  }
}

- (void)measureOccupiedWetPortDuration
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_isReceptacleEmpty)
  {
    if (measureOccupiedWetPortDuration_currentlyMeasuring)
    {
      [(NSDate *)self->_portAttachedTime timeIntervalSinceNow];
      unint64_t v4 = llround(-v3);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315394;
        uint64_t v9 = "-[IOPortLDCMManagerV4 measureOccupiedWetPortDuration]";
        __int16 v10 = 2048;
        unint64_t v11 = v4;
        _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s LDCM - Duration of port attached: %ld\n", (uint8_t *)&v8, 0x16u);
      }
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v6 = [NSNumber numberWithLong:v4];
      [v5 setObject:v6 forKey:@"attachDuration"];

      __int16 v7 = [NSNumber numberWithUnsignedInt:self->_currentMitigationsStatus];
      [v5 setObject:v7 forKey:@"mitigationStatus"];

      AnalyticsSendEvent();
      measureOccupiedWetPortDuration_currentlyMeasuring = 0;
    }
  }
  else if ((measureOccupiedWetPortDuration_currentlyMeasuring & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      uint64_t v9 = "-[IOPortLDCMManagerV4 measureOccupiedWetPortDuration]";
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s Starting measurement of occupied port\n", (uint8_t *)&v8, 0xCu);
    }
    self->_portAttachedTime = (NSDate *)(id)[MEMORY[0x1E4F1C9C8] now];
    measureOccupiedWetPortDuration_currentlyMeasuring = 1;
  }
}

- (id)extractData:(unsigned int *)a3 :(unint64_t)a4
{
  unint64_t v4 = [[LDCMMeasurementV4 alloc] initWithParams:a3 :a4];
  return v4;
}

- (int)setLiquidDetected:(unsigned __int8)a3
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t ldcmFeatureConnect = self->_ldcmFeatureConnect;
  input[0] = a3;
  return IOConnectCallMethod(ldcmFeatureConnect, 0x3E8u, input, 1u, 0, 0, 0, 0, 0, 0);
}

- (int)setMitigations:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a3 && self->_behaviorOverrideDisableMitigations)
  {
    BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    int result = 0;
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - Skipping mitigations due to behavior override!", buf, 2u);
      return 0;
    }
  }
  else
  {
    *(void *)buf = a3;
    self->_BOOL mitigationsEnabled = a3 != 0;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v7 = 67109120;
      int v8 = v3;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - Setting Mitigations in Port Manager: %d!!!", v7, 8u);
    }
    return IOConnectCallMethod(self->_ldcmFeatureConnect, 0x3E9u, (const uint64_t *)buf, 1u, 0, 0, 0, 0, 0, 0);
  }
  return result;
}

- (int)setUserOverride:(unsigned __int8)a3
{
  int v3 = a3;
  input[1] = *MEMORY[0x1E4F143B8];
  input[0] = a3;
  if (a3 && self->_overrideEnabled == a3)
  {
    BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    int result = 0;
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - Override already enabled, no action taken", buf, 2u);
      return 0;
    }
  }
  else
  {
    if (a3) {
      AnalyticsSendEvent();
    }
    self->_BOOL overrideEnabled = v3 != 0;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v8 = v3;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "LDCM - Setting Override in Port Manager: %d!!!", buf, 8u);
    }
    return IOConnectCallMethod(self->_ldcmFeatureConnect, 0x3EAu, input, 1u, 0, 0, 0, 0, 0, 0);
  }
  return result;
}

- (int)setLDCMState:(int)a3
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t ldcmFeatureConnect = self->_ldcmFeatureConnect;
  input[0] = a3;
  return IOConnectCallMethod(ldcmFeatureConnect, 0x3EBu, input, 1u, 0, 0, 0, 0, 0, 0);
}

- (int)setLDCMMeasurementStatus:(int)a3
{
  input[1] = *MEMORY[0x1E4F143B8];
  mach_port_t ldcmFeatureConnect = self->_ldcmFeatureConnect;
  input[0] = a3;
  return IOConnectCallMethod(ldcmFeatureConnect, 0x3ECu, input, 1u, 0, 0, 0, 0, 0, 0);
}

- (int)setWaveformExtractionEnabled:(unsigned __int8)a3
{
  int v3 = a3;
  input[1] = *MEMORY[0x1E4F143B8];
  input[0] = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v7 = v3;
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "LDCM - Setting waveform extraction: %d...", buf, 8u);
  }
  return IOConnectCallMethod(self->_ldcmFeatureConnect, 0x3F1u, input, 1u, 0, 0, 0, 0, 0, 0);
}

- (void)showUI
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    LOWORD(v6[0]) = 0;
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "LDCM - Showing UI, if applicable", (uint8_t *)v6, 2u);
  }
  if (self->_buildType == 1 || self->_behaviorOverrideDisableUI || self->_overrideEnabled)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int buildType = self->_buildType;
      BOOL behaviorOverrideDisableUI = self->_behaviorOverrideDisableUI;
      BOOL overrideEnabled = self->_overrideEnabled;
      v6[0] = 67109632;
      v6[1] = buildType;
      __int16 v7 = 1024;
      BOOL v8 = behaviorOverrideDisableUI;
      __int16 v9 = 1024;
      BOOL v10 = overrideEnabled;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "LDCM - Not showing UI (buildtype: %d override: %d userOverride: %d)", (uint8_t *)v6, 0x14u);
    }
  }
  else
  {
    if (self->_uiActive)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        LOWORD(v6[0]) = 0;
        _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "LDCM - UI already active, not showing UI", (uint8_t *)v6, 2u);
      }
    }
    else
    {
      AnalyticsSendEvent();
      [(LDCMNotificationUIManagerV4 *)self->_notificationUIManager showUI:1 :self->_buildType == 0];
    }
    self->_uiActive = 1;
  }
}

- (void)hideUI
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v3 = 0;
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "LDCM - Hiding UI, if applicable", v3, 2u);
  }
  if (self->_uiActive) {
    IOAccessoryNotifyWetCancel();
  }
  self->_uiActive = 0;
}

uint64_t __42__IOPortLDCMManagerV4_generateLDCMCSVData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  __int16 v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  BOOL v8 = [NSString stringWithFormat:@"%@%@", *(void *)(a1 + 32), v5];
  id v23 = 0;
  __int16 v9 = [v7 attributesOfItemAtPath:v8 error:&v23];
  id v10 = v23;

  if (v10)
  {
    uint64_t v11 = [v10 localizedDescription];
    NSLog(&cfstr_ErrorFetchingF.isa, v11, v5);
  }
  uint64_t v12 = *MEMORY[0x1E4F282C0];
  int v13 = [v9 objectForKey:*MEMORY[0x1E4F282C0]];
  dispatch_time_t v14 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v15 = [NSString stringWithFormat:@"%@%@", *(void *)(a1 + 32), v6];
  id v22 = 0;
  uint64_t v16 = [v14 attributesOfItemAtPath:v15 error:&v22];
  id v17 = v22;

  if (v17)
  {
    uint64_t v18 = [v17 localizedDescription];
    NSLog(&cfstr_ErrorFetchingF_0.isa, v18, v6);
  }
  uint64_t v19 = [v16 objectForKey:v12];
  uint64_t v20 = [v13 compare:v19];

  return v20;
}

- (void)processBehaviorDictionary:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v6 = [v4 objectForKeyedSubscript:@"DisableMitigations"];
    if (v6)
    {
      __int16 v7 = (void *)v6;
      BOOL v8 = [v4 objectForKeyedSubscript:@"DisableMitigations"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v10 = [v4 objectForKeyedSubscript:@"DisableMitigations"];
        self->_BOOL behaviorOverrideDisableMitigations = [v10 BOOLValue];

        [v5 setBool:self->_behaviorOverrideDisableMitigations forKey:@"LDCMV4DisableMitigations"];
      }
    }
    uint64_t v11 = [v4 objectForKeyedSubscript:@"DisableUI"];
    if (v11)
    {
      uint64_t v12 = (void *)v11;
      int v13 = [v4 objectForKeyedSubscript:@"DisableUI"];
      objc_opt_class();
      char v14 = objc_opt_isKindOfClass();

      if (v14)
      {
        int v15 = [v4 objectForKeyedSubscript:@"DisableUI"];
        self->_BOOL behaviorOverrideDisableUI = [v15 BOOLValue];

        [v5 setBool:self->_behaviorOverrideDisableUI forKey:@"LDCMV4DisableUI"];
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      BOOL behaviorOverrideDisableMitigations = self->_behaviorOverrideDisableMitigations;
      BOOL behaviorOverrideDisableUI = self->_behaviorOverrideDisableUI;
      int v18 = 136315650;
      uint64_t v19 = "-[IOPortLDCMManagerV4 processBehaviorDictionary:]";
      __int16 v20 = 1024;
      BOOL v21 = behaviorOverrideDisableMitigations;
      __int16 v22 = 1024;
      BOOL v23 = behaviorOverrideDisableUI;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s behavior overrides - mitigations: %d ui: %d", (uint8_t *)&v18, 0x18u);
    }
  }
}

- (OS_dispatch_queue)ldcmV4DispatchQueue
{
  return self->_ldcmV4DispatchQueue;
}

- (void)setLdcmV4DispatchQueue:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (LDCMNotificationUIManagerV4)notificationUIManager
{
  return self->_notificationUIManager;
}

- (void)setNotificationUIManager:(id)a3
{
}

- (unsigned)notification
{
  return self->_notification;
}

- (void)setNotification:(unsigned int)a3
{
  self->_io_object_t notification = a3;
}

- (unsigned)ldcmFeatureConnect
{
  return self->_ldcmFeatureConnect;
}

- (void)setLdcmFeatureConnect:(unsigned int)a3
{
  self->_mach_port_t ldcmFeatureConnect = a3;
}

- (unint64_t)wetPollingInterval
{
  return self->_wetPollingInterval;
}

- (void)setWetPollingInterval:(unint64_t)a3
{
  self->_wetPollingInterval = a3;
}

- (unint64_t)dryPollingInterval
{
  return self->_dryPollingInterval;
}

- (void)setDryPollingInterval:(unint64_t)a3
{
  self->_dryPollingInterval = a3;
}

- (unsigned)isWet
{
  return self->_isWet;
}

- (void)setIsWet:(unsigned __int8)a3
{
  self->_isWet = a3;
}

- (int)buildType
{
  return self->_buildType;
}

- (void)setBuildType:(int)a3
{
  self->_int buildType = a3;
}

- (int)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(int)a3
{
  self->_deviceClass = a3;
}

- (void)setPreviousLDCMPortStatus:(unsigned __int8)a3
{
  self->_int previousLDCMPortStatus = a3;
}

- (BOOL)isReceptacleEmpty
{
  return self->_isReceptacleEmpty;
}

- (void)setIsReceptacleEmpty:(BOOL)a3
{
  self->_isReceptacleEmpty = a3;
}

- (BOOL)mitigationsEnabled
{
  return self->_mitigationsEnabled;
}

- (void)setMitigationsEnabled:(BOOL)a3
{
  self->_BOOL mitigationsEnabled = a3;
}

- (BOOL)overrideEnabled
{
  return self->_overrideEnabled;
}

- (void)setOverrideEnabled:(BOOL)a3
{
  self->_BOOL overrideEnabled = a3;
}

- (void)setMeasurementInfoOutputString:(id)a3
{
  self->_measurementInfoOutputString = (NSString *)a3;
}

- (BOOL)uiActive
{
  return self->_uiActive;
}

- (void)setUiActive:(BOOL)a3
{
  self->_uiActive = a3;
}

- (BOOL)waveformExtractionDisabled
{
  return self->_waveformExtractionDisabled;
}

- (void)setWaveformExtractionDisabled:(BOOL)a3
{
  self->_waveformExtractionDisabled = a3;
}

- (BOOL)behaviorOverrideDisableMitigations
{
  return self->_behaviorOverrideDisableMitigations;
}

- (void)setBehaviorOverrideDisableMitigations:(BOOL)a3
{
  self->_BOOL behaviorOverrideDisableMitigations = a3;
}

- (BOOL)behaviorOverrideDisableUI
{
  return self->_behaviorOverrideDisableUI;
}

- (void)setBehaviorOverrideDisableUI:(BOOL)a3
{
  self->_BOOL behaviorOverrideDisableUI = a3;
}

- (int)currentMitigationsStatus
{
  return self->_currentMitigationsStatus;
}

- (void)setCurrentMitigationsStatus:(int)a3
{
  self->_currentMitigationsStatus = a3;
}

- (NSDate)portAttachedTime
{
  return self->_portAttachedTime;
}

- (void)setPortAttachedTime:(id)a3
{
  self->_portAttachedTime = (NSDate *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationUIManager, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_ldcmV4DispatchQueue, 0);
}

- (void)performLDCMMeasurement:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D9622000, MEMORY[0x1E4F14500], a3, "LDCM - Data size mismatch!!! Size returned: %zu", a5, a6, a7, a8, 0);
}

- (void)performLDCMMeasurement:(int)a1 .cold.2(int a1)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "LDCM - Failed to copy data!!! Error: %d", (uint8_t *)v1, 8u);
}

- (void)performLDCMMeasurement:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D9622000, MEMORY[0x1E4F14500], a3, "LDCM - WARNING: Waveform data size mismatch! Size returned: %zu", a5, a6, a7, a8, 0);
}

- (void)performLDCMMeasurement:(int)a1 .cold.4(int a1)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "LDCM - WARNING: Failed to copy waveform! Error: %d", (uint8_t *)v1, 8u);
}

- (void)storeWaveform:withWaveformDataLen:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "LDCM - Skipping waveform storage due to waveform extraction default setting.", v0, 2u);
}

- (void)storeWaveform:(uint64_t)a3 withWaveformDataLen:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D9622000, MEMORY[0x1E4F14500], a3, "LDCM - Skipping waveform storage due to data size mismatch!!! Size returned: %zu", a5, a6, a7, a8, 0);
}

@end