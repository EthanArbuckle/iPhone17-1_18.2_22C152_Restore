@interface DTORatchetStateParser
- ($50828A08DC8D0425568E958C1030530A)_configFromRatchetState:(SEL)a3;
- ($FADF3C8E36F8E6B09C5F7877D2367156)_statusFromRatchetState:(SEL)a3;
- (double)_durationFromRatchetStatus:(id *)a3 config:(id *)a4;
- (double)_resetDurationFromRatchetStatus:(id *)a3 config:(id *)a4;
- (double)_scaleDuration:(double)result;
- (id)_biometryWatchdogDTOFromConfig:(id *)a3 status:(id *)a4;
- (id)_biometryWatchdogGlobalFromConfig:(id *)a3 status:(id *)a4;
- (id)_gracePeriodStateFromConfig:(id *)a3 status:(id *)a4;
- (id)_ratchetUUIDFromACMRatchetState:(id *)a3;
- (id)gracePeriodStateFromState:(id)a3;
- (id)ratchetStateFromState:(id)a3;
- (id)watchdogPackFromState:(id)a3;
- (int64_t)_ratchetStateFromACMRatchetState:(id *)a3;
@end

@implementation DTORatchetStateParser

- (id)ratchetStateFromState:(id)a3
{
  long long v16 = 0u;
  memset(v17, 0, 26);
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = a3;
  [(DTORatchetStateParser *)self _statusFromRatchetState:v4];
  -[DTORatchetStateParser _configFromRatchetState:](self, "_configFromRatchetState:", v4, 0, 0, 0, 0, 0, 0, v14, v15, v16, *(void *)v17, *(_OWORD *)&v17[8], *(void *)&v17[24]);

  int64_t v5 = [(DTORatchetStateParser *)self _ratchetStateFromACMRatchetState:&v14];
  [(DTORatchetStateParser *)self _durationFromRatchetStatus:&v14 config:&v13];
  -[DTORatchetStateParser _scaleDuration:](self, "_scaleDuration:");
  double v7 = v6;
  [(DTORatchetStateParser *)self _resetDurationFromRatchetStatus:&v14 config:&v13];
  -[DTORatchetStateParser _scaleDuration:](self, "_scaleDuration:");
  double v9 = v8;
  v10 = [(DTORatchetStateParser *)self _ratchetUUIDFromACMRatchetState:&v14];
  id v11 = [objc_alloc((Class)LACDTORatchetState) initWithRawValue:v5 duration:v10 resetDuration:v7 uuid:v9];

  return v11;
}

- (id)watchdogPackFromState:(id)a3
{
  long long v12 = 0u;
  memset(v13, 0, 26);
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = a3;
  [(DTORatchetStateParser *)self _statusFromRatchetState:v4];
  -[DTORatchetStateParser _configFromRatchetState:](self, "_configFromRatchetState:", v4, 0, 0, 0, 0, 0, 0, v10, v11, v12, *(void *)v13, *(_OWORD *)&v13[8], *(void *)&v13[24]);

  int64_t v5 = [(DTORatchetStateParser *)self _biometryWatchdogGlobalFromConfig:&v9 status:&v10];
  double v6 = [(DTORatchetStateParser *)self _biometryWatchdogDTOFromConfig:&v9 status:&v10];
  id v7 = [objc_alloc((Class)LACDTOBiometryWatchdogPack) initWithBiometryWatchdogGlobal:v5 biometryWatchdogDTO:v6];

  return v7;
}

- (id)gracePeriodStateFromState:(id)a3
{
  long long v10 = 0u;
  memset(v11, 0, 26);
  long long v8 = 0u;
  long long v9 = 0u;
  id v4 = a3;
  [(DTORatchetStateParser *)self _statusFromRatchetState:v4];
  -[DTORatchetStateParser _configFromRatchetState:](self, "_configFromRatchetState:", v4, 0, 0, 0, 0, 0, 0, v8, v9, v10, *(void *)v11, *(_OWORD *)&v11[8], *(void *)&v11[24]);

  int64_t v5 = [(DTORatchetStateParser *)self _gracePeriodStateFromConfig:&v7 status:&v8];

  return v5;
}

- ($50828A08DC8D0425568E958C1030530A)_configFromRatchetState:(SEL)a3
{
  result = ($50828A08DC8D0425568E958C1030530A *)[a4 bytes];
  long long v6 = *(_OWORD *)&result->var2;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&result->var0;
  *(_OWORD *)&retstr->var2 = v6;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&result->var4;
  return result;
}

- ($FADF3C8E36F8E6B09C5F7877D2367156)_statusFromRatchetState:(SEL)a3
{
  result = ($FADF3C8E36F8E6B09C5F7877D2367156 *)[a4 bytes];
  long long v6 = *(_OWORD *)&result[3].var4;
  *($0DD201535F598B6025D84F9AACEC468E *)&retstr->var3 = *($0DD201535F598B6025D84F9AACEC468E *)((char *)&result[3].var2
                                                                                             + 8);
  *(_OWORD *)&retstr->var5 = v6;
  $0DD201535F598B6025D84F9AACEC468E v7 = *($0DD201535F598B6025D84F9AACEC468E *)&result[3].var1;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&result[2].var10;
  retstr->var2 = v7;
  *(_OWORD *)((char *)&retstr->var7 + 2) = *(_OWORD *)((char *)&result[3].var5 + 2);
  return result;
}

- (double)_scaleDuration:(double)result
{
  if (LACDTORatchetStateDurationInfinite != result) {
    return result / 1000.0;
  }
  return result;
}

- (double)_durationFromRatchetStatus:(id *)a3 config:(id *)a4
{
  switch(a3->var0)
  {
    case 0:
    case 4:
      return LACDTORatchetStateDurationInfinite;
    case 1:
      unint64_t v5 = *(void *)(&a3->var0 + 1);
      goto LABEL_6;
    case 2:
      unint64_t v5 = *(void *)((char *)&a3->var5 + 2);
      goto LABEL_6;
    case 3:
      unint64_t v5 = *(unint64_t *)((char *)&a3->var7 + 2);
LABEL_6:
      double result = (double)v5;
      break;
    default:
      return result;
  }
  return result;
}

- (double)_resetDurationFromRatchetStatus:(id *)a3 config:(id *)a4
{
  switch(a3->var0)
  {
    case 0:
    case 4:
      double result = LACDTORatchetStateDurationInfinite;
      break;
    case 1:
      double result = (double)(a4->var1 + *(void *)(&a3->var0 + 1));
      break;
    case 2:
      unint64_t v5 = *(void *)((char *)&a3->var5 + 2);
      goto LABEL_6;
    case 3:
      unint64_t v5 = *(unint64_t *)((char *)&a3->var7 + 2);
LABEL_6:
      double result = (double)v5;
      break;
    default:
      return result;
  }
  return result;
}

- (int64_t)_ratchetStateFromACMRatchetState:(id *)a3
{
  uint64_t v3 = (a3->var0 - 1);
  if (v3 < 4) {
    return v3 + 1;
  }
  else {
    return 0;
  }
}

- (id)_ratchetUUIDFromACMRatchetState:(id *)a3
{
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:(char *)&a3->var1 + 4];
  if (v3)
  {
    id v4 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:0];
    unsigned __int8 v5 = [v3 isEqual:v4];

    long long v6 = 0;
    if ((v5 & 1) == 0)
    {
      long long v6 = [v3 UUIDString];
    }
  }
  else
  {
    long long v6 = 0;
  }

  return v6;
}

- (id)_gracePeriodStateFromConfig:(id *)a3 status:(id *)a4
{
  long long v6 = +[LACFlags sharedInstance];
  unsigned int v7 = [v6 featureFlagDimpleKeyGracePeriodEnabled];

  if (v7)
  {
    id v8 = [objc_alloc((Class)LACDTOGracePeriodState) initWithTime:(double)*(unint64_t *)((char *)&a4->var8 + 2) maxThreshold:(double)a3->var5];
  }
  else
  {
    id v8 = +[LACDTOGracePeriodState nullInstance];
  }

  return v8;
}

- (id)_biometryWatchdogGlobalFromConfig:(id *)a3 status:(id *)a4
{
  id v6 = objc_alloc((Class)LACDTOBiometryWatchdog);
  uint64_t v7 = BYTE1(a4->var4);
  double v8 = (double)(*(unint64_t *)((char *)&a4->var4 + 2) / 0x3E8);
  LACDTBiometryWatchdogGlobalFallbackTime();
  id v10 = [v6 initWithIsRunning:v7 time:v8 minThreshold:v9 maxThreshold:(double)(a3->var4 / 0x3E8)];

  return v10;
}

- (id)_biometryWatchdogDTOFromConfig:(id *)a3 status:(id *)a4
{
  id v4 = [objc_alloc((Class)LACDTOBiometryWatchdog) initWithIsRunning:a4->var2.var0[12] time:(double)(*(void *)&a4->var2.var0[13] / 0x3E8uLL) minThreshold:(double)(a3->var3 / 0x3E8) maxThreshold:(double)(a3->var4 / 0x3E8)];

  return v4;
}

@end