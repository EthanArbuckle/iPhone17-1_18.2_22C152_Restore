@interface iAP2KalmanFilter
- (BOOL)updateMeasurementNoiseEstimate:(double)a3;
- (iAP2KalmanFilter)initWithReseedTimeout:(double)a3 AndCountForNoiseTraining:(unint64_t)a4;
- (int)iAP2KalmanFilterUpdateDeviceTime:(double)a3 Offset:(double)a4 FilteredOffset:(double *)a5 OffsetUncertainty:(double *)a6;
- (void)reseedWithInternalTime:(double)a3 RawOffset:(double)a4 FilteredOffset:(double *)a5 OffsetUncertainty:(double *)a6;
- (void)reset;
- (void)resetWithInternalTimeSecs:(double)a3 RawOffset:(double)a4 FilteredOffset:(double *)a5 OffsetUncertainty:(double *)a6;
@end

@implementation iAP2KalmanFilter

- (iAP2KalmanFilter)initWithReseedTimeout:(double)a3 AndCountForNoiseTraining:(unint64_t)a4
{
  v11.receiver = self;
  v11.super_class = (Class)iAP2KalmanFilter;
  v6 = [(iAP2KalmanFilter *)&v11 init];
  v7 = v6;
  if (v6)
  {
    *(_WORD *)&v6->fIsMeasurementNoiseTrained = 0;
    *(_OWORD *)&v6->f_P = xmmword_1001B81B0;
    v6->fLastInternalTime = -1.0;
    v6->fTimeout = a3;
    v6->fMeasurementVar = 0.0;
    v6->fMinCountForMeasNoiseTraining = a4;
    v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    fOffsetHistory = v7->fOffsetHistory;
    v7->fOffsetHistory = v8;
  }
  return v7;
}

- (void)reset
{
  if (_iAP2LogEnableMask)
  {
    if (gLogObjects) {
      BOOL v3 = gNumLogObjects < 20;
    }
    else {
      BOOL v3 = 1;
    }
    if (v3)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v5 = &_os_log_default;
      id v4 = &_os_log_default;
    }
    else
    {
      v5 = *(id *)(gLogObjects + 152);
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ERROR: Resetting Kalman Filter", v6, 2u);
    }
  }
  self->fMeasurementVar = 0.0;
  *(_WORD *)&self->fIsMeasurementNoiseTrained = 0;
  *(_OWORD *)&self->f_P = xmmword_1001B81B0;
  self->fLastInternalTime = -1.0;
}

- (void)resetWithInternalTimeSecs:(double)a3 RawOffset:(double)a4 FilteredOffset:(double *)a5 OffsetUncertainty:(double *)a6
{
  self->fIsMeasurementNoiseTrained = 0;
  [(iAP2KalmanFilter *)self reseedWithInternalTime:a5 RawOffset:a6 FilteredOffset:a3 OffsetUncertainty:a4];
}

- (void)reseedWithInternalTime:(double)a3 RawOffset:(double)a4 FilteredOffset:(double *)a5 OffsetUncertainty:(double *)a6
{
  self->fFilterOffsetEstimate = a4;
  self->f_P = 51840000.0;
  *a6 = 7200.0;
  *a5 = self->fFilterOffsetEstimate;
  self->fIsSeeded = 1;
  self->fLastInternalTime = a3;
}

- (BOOL)updateMeasurementNoiseEstimate:(double)a3
{
  v5 = (char *)[(NSMutableArray *)self->fOffsetHistory count];
  if ((_iAP2LogEnableMask & 4) != 0)
  {
    if (gLogObjects) {
      BOOL v6 = gNumLogObjects < 20;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v8 = &_os_log_default;
      id v7 = &_os_log_default;
    }
    else
    {
      v8 = *(id *)(gLogObjects + 152);
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[iAP2KalmanFilter updateMeasurementNoiseEstimate:].cold.5((uint64_t)v5, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  fOffsetHistory = self->fOffsetHistory;
  v16 = +[NSNumber numberWithDouble:a3];
  [(NSMutableArray *)fOffsetHistory addObject:v16];

  BOOL v18 = (unint64_t)v5 > 1 && (unint64_t)v5 >= self->fMinCountForMeasNoiseTraining;
  if (v18)
  {
    v19 = 0;
    double v20 = 0.0;
    do
    {
      v21 = [(NSMutableArray *)self->fOffsetHistory objectAtIndex:v19];
      [v21 doubleValue];
      double v23 = v22;

      double v20 = v20 + v23;
      ++v19;
    }
    while (v5 != v19);
    if ((_iAP2LogEnableMask & 4) != 0)
    {
      if (gLogObjects && gNumLogObjects >= 20)
      {
        v24 = *(id *)(gLogObjects + 152);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        v24 = &_os_log_default;
        id v25 = &_os_log_default;
      }
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        -[iAP2KalmanFilter updateMeasurementNoiseEstimate:](v24, v26, v27, v28, v29, v30, v31, v32);
      }
    }
    uint64_t v33 = 0;
    double v34 = (double)(unint64_t)v5;
    double v35 = v20 / (double)(unint64_t)v5;
    if ((unint64_t)v5 <= 1) {
      uint64_t v36 = 1;
    }
    else {
      uint64_t v36 = (uint64_t)v5;
    }
    double v37 = 0.0;
    do
    {
      v38 = [(NSMutableArray *)self->fOffsetHistory objectAtIndex:v33];
      [v38 doubleValue];
      double v40 = v39 - v35;

      double v37 = v37 + v40 * v40;
      ++v33;
    }
    while (v36 != v33);
    if ((_iAP2LogEnableMask & 4) != 0)
    {
      if (gLogObjects && gNumLogObjects >= 20)
      {
        v41 = *(id *)(gLogObjects + 152);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        v41 = &_os_log_default;
        id v42 = &_os_log_default;
      }
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
        -[iAP2KalmanFilter updateMeasurementNoiseEstimate:](v41, v43, v44, v45, v46, v47, v48, v49);
      }
    }
    self->fMeasurementVar = v37 / (v34 + -1.0);
    self->fIsMeasurementNoiseTrained = 1;
    [(NSMutableArray *)self->fOffsetHistory removeAllObjects];
  }
  return v18;
}

- (int)iAP2KalmanFilterUpdateDeviceTime:(double)a3 Offset:(double)a4 FilteredOffset:(double *)a5 OffsetUncertainty:(double *)a6
{
  if (self->fIsMeasurementNoiseTrained) {
    goto LABEL_2;
  }
  if ([(iAP2KalmanFilter *)self updateMeasurementNoiseEstimate:a4])
  {
    if ((_iAP2LogEnableMask & 4) != 0)
    {
      if (gLogObjects && gNumLogObjects >= 20)
      {
        uint64_t v13 = *(id *)(gLogObjects + 152);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        uint64_t v13 = &_os_log_default;
        id v25 = &_os_log_default;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[iAP2KalmanFilter iAP2KalmanFilterUpdateDeviceTime:Offset:FilteredOffset:OffsetUncertainty:]3();
      }
    }
    double fMeasurementVar = self->fMeasurementVar;
    if (fMeasurementVar > 0.0 && fMeasurementVar < 0.25)
    {
      if ((_iAP2LogEnableMask & 4) != 0)
      {
        if (gLogObjects && gNumLogObjects >= 20)
        {
          uint64_t v29 = *(id *)(gLogObjects + 152);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            platform_connectionInfo_configStreamCategoryListReady_cold_1();
          }
          uint64_t v29 = &_os_log_default;
          id v38 = &_os_log_default;
        }
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
          -[iAP2KalmanFilter iAP2KalmanFilterUpdateDeviceTime:Offset:FilteredOffset:OffsetUncertainty:].cold.9();
        }
      }
LABEL_2:
      if (!self->fIsSeeded || (double v11 = a3 - self->fLastInternalTime, v11 > self->fTimeout))
      {
        [(iAP2KalmanFilter *)self reseedWithInternalTime:a5 RawOffset:a6 FilteredOffset:a3 OffsetUncertainty:a4];
        return 0;
      }
      p_double fFilterOffsetEstimate = &self->fFilterOffsetEstimate;
      double fFilterOffsetEstimate = self->fFilterOffsetEstimate;
      self->fLastInternalTime = a3;
      double v16 = self->fMeasurementVar;
      double f_P = self->f_P;
      if (v16 + f_P <= 0.0)
      {
        [(iAP2KalmanFilter *)self resetWithInternalTimeSecs:a5 RawOffset:a6 FilteredOffset:a3 OffsetUncertainty:a4];
        if ((_iAP2LogEnableMask & 4) != 0)
        {
          if (gLogObjects && gNumLogObjects >= 20)
          {
            v21 = *(id *)(gLogObjects + 152);
          }
          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              platform_connectionInfo_configStreamCategoryListReady_cold_1();
            }
            v21 = &_os_log_default;
            id v30 = &_os_log_default;
          }
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
            -[iAP2KalmanFilter iAP2KalmanFilterUpdateDeviceTime:Offset:FilteredOffset:OffsetUncertainty:].cold.7(v21);
          }
        }
        return 0;
      }
      double v18 = a4 - fFilterOffsetEstimate;
      double v19 = v18 * v18 / (v16 + f_P);
      if (v19 <= 20.25)
      {
        double v20 = v11 * 0.00005625;
        if (v19 > 9.0) {
          double v16 = v16 + v16;
        }
      }
      else if (v18 <= 7200.0)
      {
        double v20 = v18 * v18;
      }
      else
      {
        double v20 = 51840000.0;
      }
      double v22 = f_P + v20;
      self->double f_P = v22;
      double v23 = v22 / (v16 + v22);
      if ((_iAP2LogEnableMask & 4) != 0)
      {
        if (gLogObjects && gNumLogObjects >= 20)
        {
          v24 = *(id *)(gLogObjects + 152);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            platform_connectionInfo_configStreamCategoryListReady_cold_1();
          }
          v24 = &_os_log_default;
          id v31 = &_os_log_default;
        }
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          int v50 = 134218496;
          double v51 = fFilterOffsetEstimate;
          __int16 v52 = 2048;
          double v53 = v23;
          __int16 v54 = 2048;
          double v55 = a4 - fFilterOffsetEstimate;
          _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "fFilterOffsetPrior = %.3lf K = %.3lf v = %.3lf", (uint8_t *)&v50, 0x20u);
        }

        char v32 = _iAP2LogEnableMask;
        double *p_fFilterOffsetEstimate = fFilterOffsetEstimate + v23 * v18;
        if ((v32 & 4) != 0)
        {
          if (gLogObjects && gNumLogObjects >= 20)
          {
            uint64_t v36 = *(id *)(gLogObjects + 152);
          }
          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              platform_connectionInfo_configStreamCategoryListReady_cold_1();
            }
            uint64_t v36 = &_os_log_default;
            id v39 = &_os_log_default;
          }
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
            -[iAP2KalmanFilter iAP2KalmanFilterUpdateDeviceTime:Offset:FilteredOffset:OffsetUncertainty:].cold.4();
          }

          char v40 = _iAP2LogEnableMask;
          double v41 = (1.0 - v23) * self->f_P;
          self->double f_P = v41;
          double v42 = sqrt(v41);
          if (v41 >= 0.00000225) {
            double v43 = v42;
          }
          else {
            double v43 = 0.00000225;
          }
          *a6 = v43;
          *a5 = self->fFilterOffsetEstimate;
          if ((v40 & 4) != 0)
          {
            if (gLogObjects && gNumLogObjects >= 20)
            {
              uint64_t v44 = *(id *)(gLogObjects + 152);
            }
            else
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                platform_connectionInfo_configStreamCategoryListReady_cold_1();
              }
              uint64_t v44 = &_os_log_default;
              id v45 = &_os_log_default;
            }
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
              -[iAP2KalmanFilter iAP2KalmanFilterUpdateDeviceTime:Offset:FilteredOffset:OffsetUncertainty:]();
            }

            if ((_iAP2LogEnableMask & 4) != 0)
            {
              if (gLogObjects && gNumLogObjects >= 20)
              {
                uint64_t v46 = *(id *)(gLogObjects + 152);
              }
              else
              {
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                  platform_connectionInfo_configStreamCategoryListReady_cold_1();
                }
                uint64_t v46 = &_os_log_default;
                id v47 = &_os_log_default;
              }
              if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
              {
                double v48 = *a5;
                uint64_t v49 = *(void *)a6;
                int v50 = 134219776;
                double v51 = a3;
                __int16 v52 = 2048;
                double v53 = a4;
                __int16 v54 = 2048;
                double v55 = v48;
                __int16 v56 = 2048;
                uint64_t v57 = v49;
                __int16 v58 = 2048;
                double v59 = v16;
                __int16 v60 = 2048;
                double v61 = v20;
                __int16 v62 = 2048;
                double v63 = a4 - fFilterOffsetEstimate;
                __int16 v64 = 2048;
                double v65 = v19;
                _os_log_debug_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEBUG, "internalTimeSecs,%.6lf,rawOffset,%.6lf,filteredOffsetSecs,%.6lf,offsetUncertaintySecs,%.6lf,R,%.6lf,Q,%.6lf,v,%.6lf,vtest2,%.6lf\n", (uint8_t *)&v50, 0x52u);
              }
            }
          }
          return 1;
        }
      }
      else
      {
        double *p_fFilterOffsetEstimate = fFilterOffsetEstimate + v23 * v18;
      }
      double v33 = (1.0 - v23) * self->f_P;
      self->double f_P = v33;
      double v34 = sqrt(v33);
      if (v33 >= 0.00000225) {
        double v35 = v34;
      }
      else {
        double v35 = 0.00000225;
      }
      *a6 = v35;
      *a5 = self->fFilterOffsetEstimate;
      return 1;
    }
    if ((_iAP2LogEnableMask & 4) != 0)
    {
      if (gLogObjects && gNumLogObjects >= 20)
      {
        uint64_t v28 = *(id *)(gLogObjects + 152);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        uint64_t v28 = &_os_log_default;
        id v37 = &_os_log_default;
      }
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
        -[iAP2KalmanFilter iAP2KalmanFilterUpdateDeviceTime:Offset:FilteredOffset:OffsetUncertainty:]1();
      }
    }
    self->fIsMeasurementNoiseTrained = 0;
  }
  int result = 0;
  *a5 = a4;
  *a6 = 7200.0;
  self->fLastInternalTime = a3;
  return result;
}

- (void).cxx_destruct
{
}

- (void)updateMeasurementNoiseEstimate:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, a1, a3, "sumx2 = %.3lf\n", a5, a6, a7, a8, 0);
}

- (void)updateMeasurementNoiseEstimate:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, a1, a3, "sumx = %.3lf\n", a5, a6, a7, a8, 0);
}

- (void)updateMeasurementNoiseEstimate:(uint64_t)a3 .cold.5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, a2, a3, "HistorySize = %lu", a5, a6, a7, a8, 0);
}

- (void)iAP2KalmanFilterUpdateDeviceTime:Offset:FilteredOffset:OffsetUncertainty:.cold.2()
{
  OUTLINED_FUNCTION_4_6(__stack_chk_guard);
  OUTLINED_FUNCTION_3_8();
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, v0, v1, "filteredOffsetSecs = %.3lf", v2, v3, v4, v5, v6);
}

- (void)iAP2KalmanFilterUpdateDeviceTime:Offset:FilteredOffset:OffsetUncertainty:.cold.4()
{
  OUTLINED_FUNCTION_4_6(__stack_chk_guard);
  OUTLINED_FUNCTION_3_8();
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, v0, v1, "double fFilterOffsetEstimate = %.3lf", v2, v3, v4, v5, v6);
}

- (void)iAP2KalmanFilterUpdateDeviceTime:(os_log_t)log Offset:FilteredOffset:OffsetUncertainty:.cold.7(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Unexpected,state plus measurement covariance < 0.\n", v1, 2u);
}

- (void)iAP2KalmanFilterUpdateDeviceTime:Offset:FilteredOffset:OffsetUncertainty:.cold.9()
{
  OUTLINED_FUNCTION_4_6(__stack_chk_guard);
  OUTLINED_FUNCTION_3_8();
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, v0, v1, "Estimated,time offset measurement variance(s^2),%.3lf\n", v2, v3, v4, v5, v6);
}

- (void)iAP2KalmanFilterUpdateDeviceTime:Offset:FilteredOffset:OffsetUncertainty:.cold.11()
{
  OUTLINED_FUNCTION_4_6(__stack_chk_guard);
  OUTLINED_FUNCTION_3_8();
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, v0, v1, "Unacceptable,time offset measurement variance(s^2),%.3lf\n", v2, v3, v4, v5, v6);
}

- (void)iAP2KalmanFilterUpdateDeviceTime:Offset:FilteredOffset:OffsetUncertainty:.cold.13()
{
  OUTLINED_FUNCTION_3_8();
  OUTLINED_FUNCTION_2_3((void *)&_mh_execute_header, v0, v1, "Measurement Variance %.3lf\n", v2, v3, v4, v5, v6);
}

@end