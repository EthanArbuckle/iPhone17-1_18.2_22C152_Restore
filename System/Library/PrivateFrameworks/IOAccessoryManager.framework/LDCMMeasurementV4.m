@interface LDCMMeasurementV4
- (LDCMMeasurementV4)initWithParams:(void *)a3 :(unint64_t)a4;
- (double)ldcmCalTIAAmp;
- (double)ldcmCalTIASNR;
- (double)ldcmCalVoltageAmp;
- (double)ldcmCalVoltageSNR;
- (double)ldcmCalculatedCap;
- (double)ldcmCalculatedRes;
- (double)ldcmLeakageCurrentAmp;
- (double)ldcmLoadImpMag;
- (double)ldcmLoadImpPhase;
- (double)ldcmMeasureTIASNR;
- (double)ldcmMeasureVoltageSNR;
- (double)ldcmPhaseComp;
- (double)ldcmTIACurrentAmp;
- (double)ldcmTIAGainCorrection;
- (double)ldcmVoltageAmp;
- (double)ldcmVoltageGainCorrection;
- (unsigned)getBits:(unsigned int)a3 shift:(unsigned __int8)a4 mask:(unsigned int)a5;
- (unsigned)ldcmCompletion;
- (unsigned)ldcmFeatureStatus;
- (unsigned)ldcmIncompOVPCnt;
- (unsigned)ldcmIncompSNRAmpCnt;
- (unsigned)ldcmIncompTimeoutCnt;
- (unsigned)ldcmLowImp;
- (unsigned)ldcmMeasurePin;
- (unsigned)ldcmMitigationsStatus;
- (unsigned)ldcmPortStatus;
- (unsigned)ldcmRREFGated;
- (unsigned)ldcmSuccessfulCnt;
- (unsigned)ldcmWet;
- (unsigned)ldcmWetStateDuration;
- (unsigned)ldcmWetStateTooLong;
- (unsigned)ldcmWetTooLongLDCMDisabled;
- (void)parseData:(char *)a3;
@end

@implementation LDCMMeasurementV4

- (double)ldcmVoltageAmp
{
  return self->ldcmVoltageAmp;
}

- (double)ldcmTIACurrentAmp
{
  return self->ldcmTIACurrentAmp;
}

- (double)ldcmLeakageCurrentAmp
{
  return self->ldcmLeakageCurrentAmp;
}

- (unsigned)ldcmIncompTimeoutCnt
{
  return self->ldcmIncompTimeoutCnt;
}

- (unsigned)ldcmIncompSNRAmpCnt
{
  return self->ldcmIncompSNRAmpCnt;
}

- (unsigned)ldcmIncompOVPCnt
{
  return self->ldcmIncompOVPCnt;
}

- (double)ldcmCalVoltageAmp
{
  return self->ldcmCalVoltageAmp;
}

- (double)ldcmCalTIAAmp
{
  return self->ldcmCalTIAAmp;
}

- (unsigned)ldcmWetStateDuration
{
  return self->ldcmWetStateDuration;
}

- (unsigned)ldcmWet
{
  return self->ldcmWet;
}

- (unsigned)ldcmWetStateTooLong
{
  return self->ldcmWetStateTooLong;
}

- (double)ldcmVoltageGainCorrection
{
  return self->ldcmVoltageGainCorrection;
}

- (double)ldcmTIAGainCorrection
{
  return self->ldcmTIAGainCorrection;
}

- (double)ldcmPhaseComp
{
  return self->ldcmPhaseComp;
}

- (unsigned)ldcmMitigationsStatus
{
  return self->ldcmMitigationsStatus;
}

- (double)ldcmMeasureVoltageSNR
{
  return self->ldcmMeasureVoltageSNR;
}

- (double)ldcmMeasureTIASNR
{
  return self->ldcmMeasureTIASNR;
}

- (unsigned)ldcmMeasurePin
{
  return self->ldcmMeasurePin;
}

- (double)ldcmLoadImpPhase
{
  return self->ldcmLoadImpPhase;
}

- (double)ldcmLoadImpMag
{
  return self->ldcmLoadImpMag;
}

- (unsigned)ldcmFeatureStatus
{
  return self->ldcmFeatureStatus;
}

- (double)ldcmCalculatedRes
{
  return self->ldcmCalculatedRes;
}

- (double)ldcmCalculatedCap
{
  return self->ldcmCalculatedCap;
}

- (double)ldcmCalVoltageSNR
{
  return self->ldcmCalVoltageSNR;
}

- (double)ldcmCalTIASNR
{
  return self->ldcmCalTIASNR;
}

- (unsigned)ldcmWetTooLongLDCMDisabled
{
  return self->_ldcmWetTooLongLDCMDisabled;
}

- (unsigned)ldcmRREFGated
{
  return self->ldcmRREFGated;
}

- (unsigned)ldcmCompletion
{
  return self->ldcmCompletion;
}

- (unsigned)ldcmPortStatus
{
  return self->ldcmPortStatus;
}

- (unsigned)ldcmLowImp
{
  return self->ldcmLowImp;
}

- (LDCMMeasurementV4)initWithParams:(void *)a3 :(unint64_t)a4
{
  if (a4 == 55)
  {
    [(LDCMMeasurementV4 *)self parseData:a3];
    v5 = self;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[LDCMMeasurementV4 initWithParams::]();
    }
    v5 = 0;
  }

  return v5;
}

- (void)parseData:(char *)a3
{
  LODWORD(v3) = *(_DWORD *)(a3 + 2);
  self->ldcmLoadImpMag = (double)v3;
  self->ldcmLoadImpPhase = (double)*(int *)(a3 + 6) * 0.000001;
  self->ldcmCalculatedRes = (double)*(int *)(a3 + 10);
  self->ldcmCalculatedCap = (double)*(int *)(a3 + 14) * 0.001;
  self->ldcmTIACurrentAmp = (double)(25 * *((unsigned __int16 *)a3 + 10));
  double v6 = (double)(25 * *((unsigned __int16 *)a3 + 11));
  self->ldcmVoltageAmp = v6;
  LOWORD(v6) = *((_WORD *)a3 + 12);
  double v7 = (double)*(unint64_t *)&v6;
  self->ldcmLeakageCurrentAmp = v7;
  LOWORD(v7) = *((_WORD *)a3 + 13);
  double v8 = (double)*(unint64_t *)&v7 * 0.005;
  self->ldcmMeasureTIASNR = v8;
  LOWORD(v8) = *((_WORD *)a3 + 14);
  self->ldcmMeasureVoltageSNR = (double)*(unint64_t *)&v8 * 0.005;
  self->ldcmCalTIAAmp = (double)(25 * *((unsigned __int16 *)a3 + 15));
  double v9 = (double)(25 * *((unsigned __int16 *)a3 + 16));
  self->ldcmCalVoltageAmp = v9;
  LOWORD(v9) = *((_WORD *)a3 + 17);
  double v10 = (double)*(unint64_t *)&v9 * 0.005;
  self->ldcmCalTIASNR = v10;
  LOWORD(v10) = *((_WORD *)a3 + 18);
  double v11 = (double)*(unint64_t *)&v10 * 0.005;
  self->ldcmCalVoltageSNR = v11;
  LODWORD(v11) = *(_DWORD *)(a3 + 38);
  double v12 = (double)*(unint64_t *)&v11 * 0.0000000023283;
  self->ldcmTIAGainCorrection = v12;
  LODWORD(v12) = *(_DWORD *)(a3 + 42);
  self->ldcmVoltageGainCorrection = (double)*(unint64_t *)&v12 * 0.0000000023283;
  self->ldcmPhaseComp = (double)*(int *)(a3 + 46) * 0.00000025;
  self->ldcmRREFGated = [(LDCMMeasurementV4 *)self getBits:*a3 shift:0 mask:1];
  self->ldcmPortStatus = [(LDCMMeasurementV4 *)self getBits:*a3 shift:2 mask:1];
  self->ldcmMitigationsStatus = [(LDCMMeasurementV4 *)self getBits:*a3 shift:3 mask:1];
  self->ldcmFeatureStatus = [(LDCMMeasurementV4 *)self getBits:*a3 shift:4 mask:7];
  self->ldcmLowImp = [(LDCMMeasurementV4 *)self getBits:a3[1] shift:0 mask:1];
  self->ldcmCompletion = [(LDCMMeasurementV4 *)self getBits:a3[1] shift:1 mask:7];
  self->ldcmWet = [(LDCMMeasurementV4 *)self getBits:a3[1] shift:4 mask:3];
  self->ldcmMeasurePin = [(LDCMMeasurementV4 *)self getBits:a3[1] shift:6 mask:3];
  self->ldcmWetStateDuration = 60
                             * [(LDCMMeasurementV4 *)self getBits:*((unsigned __int16 *)a3 + 9) shift:0 mask:0x3FFFLL];
  self->ldcmWetStateTooLong = [(LDCMMeasurementV4 *)self getBits:*((unsigned __int16 *)a3 + 9) shift:14 mask:1];
  self->ldcmIncompSNRAmpCnt = a3[50];
  self->ldcmIncompOVPCnt = a3[51];
  self->ldcmIncompTimeoutCnt = a3[52];
  self->ldcmSuccessfulCnt = *(_WORD *)(a3 + 53);
}

- (unsigned)getBits:(unsigned int)a3 shift:(unsigned __int8)a4 mask:(unsigned int)a5
{
  return (a3 >> a4) & a5;
}

- (unsigned)ldcmSuccessfulCnt
{
  return self->ldcmSuccessfulCnt;
}

- (void)initWithParams::.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "LDCM - Data size mismatch!", v0, 2u);
}

@end