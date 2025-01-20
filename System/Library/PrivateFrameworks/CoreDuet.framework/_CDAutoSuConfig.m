@interface _CDAutoSuConfig
- (BOOL)allowUnlockBeforeNow;
- (BOOL)alwaysFallBackToDefault;
- (BOOL)alwaysReturnUnlockNow;
- (BOOL)validParam;
- (double)endThreshold;
- (double)startThreshold;
- (double)unlockThreshold;
- (int)readConfig;
- (int)restrictionEndInSlot;
- (int)restrictionStartInSlot;
- (int)suEndDefaultTimeOffsetFromSuStart;
- (int)suStartDefaultTime;
- (int)unlockMarginInSlot;
- (void)readConfig;
- (void)setAllowUnlockBeforeNow:(BOOL)a3;
- (void)setAlwaysFallBackToDefault:(BOOL)a3;
- (void)setAlwaysReturnUnlockNow:(BOOL)a3;
- (void)setEndThreshold:(double)a3;
- (void)setParam;
- (void)setRestrictionEndInSlot:(int)a3;
- (void)setRestrictionStartInSlot:(int)a3;
- (void)setStartThreshold:(double)a3;
- (void)setSuEndDefaultTimeOffsetFromSuStart:(int)a3;
- (void)setSuStartDefaultTime:(int)a3;
- (void)setUnlockMarginInSlot:(int)a3;
- (void)setUnlockThreshold:(double)a3;
@end

@implementation _CDAutoSuConfig

- (int)readConfig
{
  uint64_t v144 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28B50];
  v4 = +[_CDPaths otaSleepPath];
  v5 = [v3 bundleWithPath:v4];

  v6 = +[_CDLogging autoSUChannel];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      LOWORD(v123[0]) = 0;
      _os_log_impl(&dword_18ECEB000, v6, OS_LOG_TYPE_INFO, "Successfully retrieved the bundle from the OTA path", (uint8_t *)v123, 2u);
    }
    goto LABEL_10;
  }
  if (v7)
  {
    LOWORD(v123[0]) = 0;
    _os_log_impl(&dword_18ECEB000, v6, OS_LOG_TYPE_INFO, "Failed to retrieve the bundle from OTA path", (uint8_t *)v123, 2u);
  }

  v8 = (void *)MEMORY[0x1E4F28B50];
  v9 = +[_CDPaths defaultSleepPath];
  uint64_t v10 = [v8 bundleWithPath:v9];

  v11 = +[_CDLogging autoSUChannel];
  v5 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v123[0]) = 0;
      _os_log_impl(&dword_18ECEB000, v5, OS_LOG_TYPE_INFO, "Successfully retrieved the bundle from the default path", (uint8_t *)v123, 2u);
    }
    v6 = v5;
    v5 = v10;
LABEL_10:

    v12 = [v5 objectForInfoDictionaryKey:@"SleepForAutoSu"];
    v13 = v12;
    if (v12)
    {
      v14 = [v12 objectForKeyedSubscript:@"RestrictionStartInSlot"];

      if (v14)
      {
        v15 = [v13 objectForKeyedSubscript:@"RestrictionEndInSlot"];

        if (v15)
        {
          v16 = [v13 objectForKeyedSubscript:@"SuStartDefaultTime"];

          if (v16)
          {
            v17 = [v13 objectForKeyedSubscript:@"SuEndDefaultTimeFromSuStart"];

            if (v17)
            {
              v18 = [v13 objectForKeyedSubscript:@"AlwaysFallBackToDefault"];

              if (v18)
              {
                v19 = [v13 objectForKeyedSubscript:@"AlwaysReturnUnlockNow"];

                if (v19)
                {
                  v20 = [v13 objectForKeyedSubscript:@"LastUnlockThreshold"];

                  if (v20)
                  {
                    v21 = [v13 objectForKeyedSubscript:@"SuStartThreshold"];

                    if (v21)
                    {
                      v22 = [v13 objectForKeyedSubscript:@"SuEndThreshold"];

                      if (v22)
                      {
                        v23 = [v13 objectForKeyedSubscript:@"UnlockMarginInSlot"];

                        if (v23)
                        {
                          v24 = [v13 objectForKeyedSubscript:@"RestrictionStartInSlot"];
                          self->_int restrictionStartInSlot = [v24 intValue];

                          v25 = [v13 objectForKeyedSubscript:@"RestrictionEndInSlot"];
                          self->_int restrictionEndInSlot = [v25 intValue];

                          v26 = [v13 objectForKeyedSubscript:@"SuStartDefaultTime"];
                          self->_int suStartDefaultTime = [v26 intValue];

                          v27 = [v13 objectForKeyedSubscript:@"SuEndDefaultTimeFromSuStart"];
                          self->_int suEndDefaultTimeOffsetFromSuStart = [v27 intValue];

                          v28 = [v13 objectForKeyedSubscript:@"AlwaysFallBackToDefault"];
                          BOOL v29 = [v28 intValue] == 1;

                          self->_BOOL alwaysFallBackToDefault = v29;
                          v30 = [v13 objectForKeyedSubscript:@"AlwaysReturnUnlockNow"];
                          BOOL v31 = [v30 intValue] == 1;

                          self->_BOOL alwaysReturnUnlockNow = v31;
                          v32 = [v13 objectForKeyedSubscript:@"LastUnlockThreshold"];
                          [v32 doubleValue];
                          self->_double unlockThreshold = v33;

                          v34 = [v13 objectForKeyedSubscript:@"SuStartThreshold"];
                          [v34 doubleValue];
                          self->_double startThreshold = v35;

                          v36 = [v13 objectForKeyedSubscript:@"SuEndThreshold"];
                          [v36 doubleValue];
                          self->_double endThreshold = v37;

                          v38 = [v13 objectForKeyedSubscript:@"UnlockMarginInSlot"];
                          self->_int unlockMarginInSlot = [v38 intValue];

                          self->_BOOL allowUnlockBeforeNow = 0;
                          v39 = +[_CDLogging autoSUChannel];
                          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
                          {
                            int restrictionStartInSlot = self->_restrictionStartInSlot;
                            int restrictionEndInSlot = self->_restrictionEndInSlot;
                            int suStartDefaultTime = self->_suStartDefaultTime;
                            int suEndDefaultTimeOffsetFromSuStart = self->_suEndDefaultTimeOffsetFromSuStart;
                            BOOL alwaysFallBackToDefault = self->_alwaysFallBackToDefault;
                            BOOL alwaysReturnUnlockNow = self->_alwaysReturnUnlockNow;
                            BOOL allowUnlockBeforeNow = self->_allowUnlockBeforeNow;
                            double unlockThreshold = self->_unlockThreshold;
                            double startThreshold = self->_startThreshold;
                            double endThreshold = self->_endThreshold;
                            int unlockMarginInSlot = self->_unlockMarginInSlot;
                            v123[0] = 67111680;
                            v123[1] = restrictionStartInSlot;
                            __int16 v124 = 1024;
                            int v125 = restrictionEndInSlot;
                            __int16 v126 = 1024;
                            int v127 = suStartDefaultTime;
                            __int16 v128 = 1024;
                            int v129 = suEndDefaultTimeOffsetFromSuStart;
                            __int16 v130 = 1024;
                            BOOL v131 = alwaysFallBackToDefault;
                            __int16 v132 = 1024;
                            BOOL v133 = alwaysReturnUnlockNow;
                            __int16 v134 = 1024;
                            BOOL v135 = allowUnlockBeforeNow;
                            __int16 v136 = 2048;
                            double v137 = unlockThreshold;
                            __int16 v138 = 2048;
                            double v139 = startThreshold;
                            __int16 v140 = 2048;
                            double v141 = endThreshold;
                            __int16 v142 = 1024;
                            int v143 = unlockMarginInSlot;
                            _os_log_impl(&dword_18ECEB000, v39, OS_LOG_TYPE_INFO, "Config parameters: %d, %d, %d, %d, %d, %d, %d, %f, %f, %f, %d", (uint8_t *)v123, 0x50u);
                          }
                          int v51 = 0;
                          goto LABEL_50;
                        }
                        v39 = +[_CDLogging autoSUChannel];
                        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
                          [(_CDAutoSuConfig *)v39 readConfig];
                        }
                      }
                      else
                      {
                        v39 = +[_CDLogging autoSUChannel];
                        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
                          [(_CDAutoSuConfig *)v39 readConfig];
                        }
                      }
                    }
                    else
                    {
                      v39 = +[_CDLogging autoSUChannel];
                      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
                        [(_CDAutoSuConfig *)v39 readConfig];
                      }
                    }
                  }
                  else
                  {
                    v39 = +[_CDLogging autoSUChannel];
                    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
                      [(_CDAutoSuConfig *)v39 readConfig];
                    }
                  }
                }
                else
                {
                  v39 = +[_CDLogging autoSUChannel];
                  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
                    [(_CDAutoSuConfig *)v39 readConfig];
                  }
                }
              }
              else
              {
                v39 = +[_CDLogging autoSUChannel];
                if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
                  [(_CDAutoSuConfig *)v39 readConfig];
                }
              }
            }
            else
            {
              v39 = +[_CDLogging autoSUChannel];
              if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
                [(_CDAutoSuConfig *)v39 readConfig];
              }
            }
          }
          else
          {
            v39 = +[_CDLogging autoSUChannel];
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
              [(_CDAutoSuConfig *)v39 readConfig];
            }
          }
        }
        else
        {
          v39 = +[_CDLogging autoSUChannel];
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
            [(_CDAutoSuConfig *)v39 readConfig];
          }
        }
      }
      else
      {
        v39 = +[_CDLogging autoSUChannel];
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
          [(_CDAutoSuConfig *)v39 readConfig];
        }
      }
    }
    else
    {
      v39 = +[_CDLogging autoSUChannel];
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        LOWORD(v123[0]) = 0;
        _os_log_impl(&dword_18ECEB000, v39, OS_LOG_TYPE_INFO, "Failed to get config info from device", (uint8_t *)v123, 2u);
      }
    }
    int v51 = -1;
LABEL_50:

    goto LABEL_51;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[_CDAutoSuConfig readConfig]();
  }
  int v51 = -1;
LABEL_51:

  return v51;
}

- (BOOL)validParam
{
  BOOL v2 = 0;
  int restrictionEndInSlot = self->_restrictionEndInSlot;
  if (restrictionEndInSlot <= 95)
  {
    int restrictionStartInSlot = self->_restrictionStartInSlot;
    if ((restrictionStartInSlot & 0x80000000) == 0 && restrictionStartInSlot < restrictionEndInSlot)
    {
      if (self->_suStartDefaultTime >> 7 <= 0x2A2
        && self->_suEndDefaultTimeOffsetFromSuStart <= 0x1517Fu
        && ((double unlockThreshold = self->_unlockThreshold, unlockThreshold >= 0.0)
          ? (BOOL v6 = unlockThreshold <= 1.0)
          : (BOOL v6 = 0),
            v6
         && ((double startThreshold = self->_startThreshold, startThreshold >= 0.0) ? (v8 = startThreshold <= 1.0) : (v8 = 0),
             v8)))
      {
        BOOL v2 = 0;
        double endThreshold = self->_endThreshold;
        if (endThreshold >= 0.0 && endThreshold <= 1.0) {
          return self->_unlockMarginInSlot < 0x60u;
        }
      }
      else
      {
        return 0;
      }
    }
  }
  return v2;
}

- (void)setParam
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if ([(_CDAutoSuConfig *)self readConfig])
  {
    v3 = +[_CDLogging autoSUChannel];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      v4 = "failed to read configuration file; fall back to hard-coded params";
LABEL_7:
      _os_log_impl(&dword_18ECEB000, v3, OS_LOG_TYPE_INFO, v4, (uint8_t *)&v16, 2u);
    }
  }
  else
  {
    if ([(_CDAutoSuConfig *)self validParam]) {
      goto LABEL_9;
    }
    v3 = +[_CDLogging autoSUChannel];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      v4 = "invalid params from configuration file; fall back to hard-coded params";
      goto LABEL_7;
    }
  }

  *(_OWORD *)&self->_int restrictionStartInSlot = xmmword_18EEAC210;
  *(_WORD *)&self->_BOOL alwaysFallBackToDefault = 0;
  self->_BOOL allowUnlockBeforeNow = 0;
  *(int64x2_t *)&self->_double unlockThreshold = vdupq_n_s64(0x3FECCCCCCCCCCCCDuLL);
  self->_double endThreshold = 0.9;
  self->_int unlockMarginInSlot = 4;
LABEL_9:
  v5 = +[_CDLogging autoSUChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int restrictionStartInSlot = self->_restrictionStartInSlot;
    int restrictionEndInSlot = self->_restrictionEndInSlot;
    int suStartDefaultTime = self->_suStartDefaultTime;
    int suEndDefaultTimeOffsetFromSuStart = self->_suEndDefaultTimeOffsetFromSuStart;
    BOOL alwaysFallBackToDefault = self->_alwaysFallBackToDefault;
    BOOL alwaysReturnUnlockNow = self->_alwaysReturnUnlockNow;
    double unlockThreshold = self->_unlockThreshold;
    double startThreshold = self->_startThreshold;
    double endThreshold = self->_endThreshold;
    int unlockMarginInSlot = self->_unlockMarginInSlot;
    LODWORD(v16) = 67111424;
    HIDWORD(v16) = restrictionStartInSlot;
    __int16 v17 = 1024;
    int v18 = restrictionEndInSlot;
    __int16 v19 = 1024;
    int v20 = suStartDefaultTime;
    __int16 v21 = 1024;
    int v22 = suEndDefaultTimeOffsetFromSuStart;
    __int16 v23 = 1024;
    BOOL v24 = alwaysFallBackToDefault;
    __int16 v25 = 1024;
    BOOL v26 = alwaysReturnUnlockNow;
    __int16 v27 = 2048;
    double v28 = unlockThreshold;
    __int16 v29 = 2048;
    double v30 = startThreshold;
    __int16 v31 = 2048;
    double v32 = endThreshold;
    __int16 v33 = 1024;
    int v34 = unlockMarginInSlot;
    _os_log_impl(&dword_18ECEB000, v5, OS_LOG_TYPE_INFO, "Config params: %d, %d, %d, %d, %d, %d, %f, %f, %f, %d", (uint8_t *)&v16, 0x4Au);
  }
}

- (int)restrictionStartInSlot
{
  return self->_restrictionStartInSlot;
}

- (void)setRestrictionStartInSlot:(int)a3
{
  self->_int restrictionStartInSlot = a3;
}

- (int)restrictionEndInSlot
{
  return self->_restrictionEndInSlot;
}

- (void)setRestrictionEndInSlot:(int)a3
{
  self->_int restrictionEndInSlot = a3;
}

- (int)suStartDefaultTime
{
  return self->_suStartDefaultTime;
}

- (void)setSuStartDefaultTime:(int)a3
{
  self->_int suStartDefaultTime = a3;
}

- (int)suEndDefaultTimeOffsetFromSuStart
{
  return self->_suEndDefaultTimeOffsetFromSuStart;
}

- (void)setSuEndDefaultTimeOffsetFromSuStart:(int)a3
{
  self->_int suEndDefaultTimeOffsetFromSuStart = a3;
}

- (BOOL)alwaysFallBackToDefault
{
  return self->_alwaysFallBackToDefault;
}

- (void)setAlwaysFallBackToDefault:(BOOL)a3
{
  self->_BOOL alwaysFallBackToDefault = a3;
}

- (BOOL)alwaysReturnUnlockNow
{
  return self->_alwaysReturnUnlockNow;
}

- (void)setAlwaysReturnUnlockNow:(BOOL)a3
{
  self->_BOOL alwaysReturnUnlockNow = a3;
}

- (BOOL)allowUnlockBeforeNow
{
  return self->_allowUnlockBeforeNow;
}

- (void)setAllowUnlockBeforeNow:(BOOL)a3
{
  self->_BOOL allowUnlockBeforeNow = a3;
}

- (double)unlockThreshold
{
  return self->_unlockThreshold;
}

- (void)setUnlockThreshold:(double)a3
{
  self->_double unlockThreshold = a3;
}

- (double)startThreshold
{
  return self->_startThreshold;
}

- (void)setStartThreshold:(double)a3
{
  self->_double startThreshold = a3;
}

- (double)endThreshold
{
  return self->_endThreshold;
}

- (void)setEndThreshold:(double)a3
{
  self->_double endThreshold = a3;
}

- (int)unlockMarginInSlot
{
  return self->_unlockMarginInSlot;
}

- (void)setUnlockMarginInSlot:(int)a3
{
  self->_int unlockMarginInSlot = a3;
}

- (void)readConfig
{
}

@end