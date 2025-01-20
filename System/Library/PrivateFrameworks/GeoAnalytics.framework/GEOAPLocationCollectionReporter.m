@interface GEOAPLocationCollectionReporter
+ (BOOL)_fuzzCNProbes:(id)a3;
+ (BOOL)_fuzzINProbes:(id)a3;
+ (BOOL)_fuzzROWProbes:(id)a3;
+ (uint64_t)_fuzzProbes:(uint64_t)a1;
+ (unint64_t)_geoShifterObfuscationSeed;
+ (void)_withCollectionRequest:(id)a3 fuzzBaseline:(BOOL)a4 fuzzCourseAccuracy:(BOOL)a5 fuzzSpeedAccuracy:(BOOL)a6 fuzzHorizAccuracy:(BOOL)a7 fuzzVertAccuracy:(BOOL)a8 useOneSecondPrecision:(BOOL)a9;
+ (void)reportBatchLocationCollection:(id)a3;
+ (void)reportCalibratedPressureCollection:(id)a3;
+ (void)reportRealtimeLocationCollection:(id)a3;
+ (void)reportReferencePressureCollection:(id)a3;
@end

@implementation GEOAPLocationCollectionReporter

+ (void)reportRealtimeLocationCollection:(id)a3
{
  id v3 = a3;
  if (+[GEOAPLocationCollectionReporter _fuzzProbes:]((uint64_t)GEOAPLocationCollectionReporter, v3))
  {
    v4 = GEOConfigGetDate();
    v5 = [MEMORY[0x263EFF910] date];
    v6 = [v4 earlierDate:v5];
    int v7 = [v6 isEqualToDate:v4];

    if (v7)
    {
      GEOConfigGetDouble();
      uint64_t v9 = [v5 dateByAddingTimeInterval:v8 * 60.0];

      GEOConfigSetDate();
      unint64_t v10 = 1;
      v4 = v9;
    }
    else
    {
      unint64_t v10 = GEOConfigGetUInteger() + 1;
    }
    if (v10 <= GEOConfigGetUInteger())
    {
      GEOConfigSetUInteger();
      v12 = [v3 data];
      +[GEOAPPortal captureRealTrafficWithLocationCollection:v12];
    }
    else
    {
      v11 = GEOGetTrafficProbeAnalyticsLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_24FE56000, v11, OS_LOG_TYPE_INFO, "dropping realtime traffic probe - over budget", v13, 2u);
      }
    }
  }
  else
  {
    v4 = GEOGetTrafficProbeAnalyticsLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24FE56000, v4, OS_LOG_TYPE_INFO, "dropping realtime collection; no obfuscation ", buf, 2u);
    }
  }
}

+ (uint64_t)_fuzzProbes:(uint64_t)a1
{
  id v2 = a2;
  id v3 = self;
  v4 = [MEMORY[0x263F41770] sharedConfiguration];
  v5 = [v4 countryCode];

  if ([v5 isEqualToString:@"CN"])
  {
    v6 = GEOGetTrafficProbeAnalyticsLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24FE56000, v6, OS_LOG_TYPE_DEBUG, "blurring CN traffic data", buf, 2u);
    }

    uint64_t v7 = [v3 _fuzzCNProbes:v2];
  }
  else
  {
    int v8 = [v5 isEqualToString:@"IN"];
    uint64_t v9 = GEOGetTrafficProbeAnalyticsLog();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    if (v8)
    {
      if (v10)
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_24FE56000, v9, OS_LOG_TYPE_DEBUG, "blurring IN traffic data", v14, 2u);
      }

      uint64_t v7 = [v3 _fuzzINProbes:v2];
    }
    else
    {
      if (v10)
      {
        v13[0] = 0;
        _os_log_impl(&dword_24FE56000, v9, OS_LOG_TYPE_DEBUG, "blurring ROW traffic data", (uint8_t *)v13, 2u);
      }

      uint64_t v7 = [v3 _fuzzROWProbes:v2];
    }
  }
  uint64_t v11 = v7;

  return v11;
}

+ (void)reportBatchLocationCollection:(id)a3
{
  id v3 = a3;
  if (+[GEOAPLocationCollectionReporter _fuzzProbes:]((uint64_t)GEOAPLocationCollectionReporter, v3))
  {
    v4 = [v3 data];
    +[GEOAPPortal captureBatchTrafficWithLocationCollection:v4];
  }
  else
  {
    v5 = GEOGetTrafficProbeAnalyticsLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_24FE56000, v5, OS_LOG_TYPE_INFO, "dropping batch collection; no obfuscation ", v6, 2u);
    }
  }
}

+ (void)reportReferencePressureCollection:(id)a3
{
}

+ (void)reportCalibratedPressureCollection:(id)a3
{
  id v3 = [a3 data];
  +[GEOAPPortal capturePressureDataWithPressureData:v3];
}

+ (void)_withCollectionRequest:(id)a3 fuzzBaseline:(BOOL)a4 fuzzCourseAccuracy:(BOOL)a5 fuzzSpeedAccuracy:(BOOL)a6 fuzzHorizAccuracy:(BOOL)a7 fuzzVertAccuracy:(BOOL)a8 useOneSecondPrecision:(BOOL)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  BOOL v11 = a6;
  BOOL v12 = a5;
  BOOL v13 = a4;
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (a4 || a5 || a6 || a7 || a8 || a9)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id obj = [a3 locations];
    uint64_t v14 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (!v14) {
      goto LABEL_34;
    }
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v24;
    while (1)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (v13)
        {
          [*(id *)(*((void *)&v23 + 1) + 8 * i) clearAppBundleIdIndices];
          [v18 setHasProvider:0];
          [v18 setHasFloor:0];
          [v18 setHasMotionVehicleConnectedStateChanged:0];
          [v18 setHasMotionVehicleConnected:0];
          [v18 setRawMotionActivity:0];
          [v18 setMotionActivity:0];
          [v18 setHasModeIndicator:0];
          [v18 setHasHorzUncSemiMaj:0];
          [v18 setHasHorzUncSemiMin:0];
          [v18 setHasHorzUncSemiMajAz:0];
          if (!a9)
          {
LABEL_14:
            if (!v12) {
              goto LABEL_15;
            }
            goto LABEL_21;
          }
        }
        else if (!a9)
        {
          goto LABEL_14;
        }
        [v18 timestamp];
        [v18 setTimestamp:rint(v19)];
        if (!v12)
        {
LABEL_15:
          if (!v11) {
            goto LABEL_16;
          }
          goto LABEL_22;
        }
LABEL_21:
        [v18 setHasCourseAccuracy:0];
        if (!v11)
        {
LABEL_16:
          if (v10) {
            goto LABEL_23;
          }
          goto LABEL_17;
        }
LABEL_22:
        [v18 setHasSpeedAccuracy:0];
        if (v10)
        {
LABEL_23:
          [v18 horizontalAccuracy];
          if (*(float *)&v20 <= 10.0) {
            *(float *)&double v20 = 1111.0;
          }
          else {
            LODWORD(v20) = dword_24FEFA848[*(float *)&v20 > 50.0];
          }
          [v18 setHorizontalAccuracy:v20];
          if (!v9) {
            continue;
          }
          goto LABEL_27;
        }
LABEL_17:
        if (!v9) {
          continue;
        }
LABEL_27:
        if ([v18 hasVerticalAccuracy])
        {
          [v18 verticalAccuracy];
          if (*(float *)&v21 <= 10.0) {
            *(float *)&double v21 = 1111.0;
          }
          else {
            LODWORD(v21) = dword_24FEFA848[*(float *)&v21 > 50.0];
          }
          [v18 setVerticalAccuracy:v21];
        }
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (!v15)
      {
LABEL_34:

        return;
      }
    }
  }
}

+ (BOOL)_fuzzCNProbes:(id)a3
{
  LOBYTE(v4) = 1;
  [a1 _withCollectionRequest:a3 fuzzBaseline:1 fuzzCourseAccuracy:1 fuzzSpeedAccuracy:1 fuzzHorizAccuracy:1 fuzzVertAccuracy:1 useOneSecondPrecision:v4];
  return 1;
}

+ (unint64_t)_geoShifterObfuscationSeed
{
  return MEMORY[0x270F300E8](GeoAnalyticsConfig_GeoShifterObfuscationSeedIN, off_269A96428);
}

+ (BOOL)_fuzzINProbes:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (GEOConfigGetBOOL())
  {
    id v28 = v4;
    uint64_t v5 = [a1 _geoShifterObfuscationSeed];
    BOOL v29 = v5 != 0;
    if (v5)
    {
      uint64_t v6 = v5;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id obj = [v4 locations];
      uint64_t v7 = [obj countByEnumeratingWithState:&v34 objects:v49 count:16];
      if (!v7) {
        goto LABEL_19;
      }
      uint64_t v8 = *(void *)v35;
      while (1)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v35 != v8) {
            objc_enumerationMutation(obj);
          }
          BOOL v10 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          double v32 = 0.0;
          double v33 = 0.0;
          double v31 = 0.0;
          [v10 latitude];
          double v12 = v11;
          [v10 longitude];
          double v14 = v13;
          [v10 altitude];
          float v16 = v15;
          uint64_t v38 = 0;
          v39 = &v38;
          uint64_t v40 = 0x2020000000;
          v17 = (void (*)(uint64_t, double *, double *, double *, double, double, double))getGeoShifter_obfuscateSymbolLoc_ptr;
          v41 = getGeoShifter_obfuscateSymbolLoc_ptr;
          if (!getGeoShifter_obfuscateSymbolLoc_ptr)
          {
            *(void *)buf = MEMORY[0x263EF8330];
            *(void *)&buf[8] = 3221225472;
            *(void *)&uint8_t buf[16] = __getGeoShifter_obfuscateSymbolLoc_block_invoke;
            double v43 = COERCE_DOUBLE(&unk_265345620);
            *(void *)v44 = &v38;
            v18 = (void *)GeoShifterLibrary();
            double v19 = dlsym(v18, "GeoShifter_obfuscate");
            *(void *)(*(void *)(*(void *)v44 + 8) + 24) = v19;
            getGeoShifter_obfuscateSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)v44 + 8) + 24);
            v17 = (void (*)(uint64_t, double *, double *, double *, double, double, double))v39[3];
          }
          _Block_object_dispose(&v38, 8);
          if (!v17)
          {
            dlerror();
            abort_report_np();
            __break(1u);
          }
          double v20 = v16;
          v17(v6, &v33, &v32, &v31, v12, v14, v20);
          [v10 setLatitude:v33];
          [v10 setLongitude:v32];
          if ([v10 hasAltitude])
          {
            HIDWORD(v21) = HIDWORD(v31);
            *(float *)&double v21 = v31;
            [v10 setAltitude:v21];
            v22 = GEOGetTrafficProbeAnalyticsLog();
            if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_17;
            }
            *(_DWORD *)buf = 134546945;
            *(double *)&buf[4] = v12;
            *(_WORD *)&buf[12] = 2053;
            *(double *)&buf[14] = v14;
            *(_WORD *)&buf[22] = 2053;
            double v43 = v20;
            *(_WORD *)v44 = 2053;
            *(double *)&v44[2] = v33;
            __int16 v45 = 2053;
            double v46 = v32;
            __int16 v47 = 2053;
            double v48 = v31;
            long long v23 = v22;
            long long v24 = "blurring result (%{sensitive}f, %{sensitive}f, %{sensitive}f) --> (%{sensitive}f, %{sensitive}f, %{sensitive}f)";
            uint32_t v25 = 62;
          }
          else
          {
            v22 = GEOGetTrafficProbeAnalyticsLog();
            if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_17;
            }
            *(_DWORD *)buf = 134546433;
            *(double *)&buf[4] = v12;
            *(_WORD *)&buf[12] = 2053;
            *(double *)&buf[14] = v14;
            *(_WORD *)&buf[22] = 2053;
            double v43 = v33;
            *(_WORD *)v44 = 2053;
            *(double *)&v44[2] = v32;
            long long v23 = v22;
            long long v24 = "blurring result (%{sensitive}f, %{sensitive}f) --> (%{sensitive}f, %{sensitive}f)";
            uint32_t v25 = 42;
          }
          _os_log_impl(&dword_24FE56000, v23, OS_LOG_TYPE_DEBUG, v24, buf, v25);
LABEL_17:
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v34 objects:v49 count:16];
        if (!v7)
        {
LABEL_19:
          long long v26 = obj;
          goto LABEL_23;
        }
      }
    }
    long long v26 = GEOGetTrafficProbeAnalyticsLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24FE56000, v26, OS_LOG_TYPE_INFO, "shifting seed not available; must drop", buf, 2u);
    }
LABEL_23:

    id v4 = v28;
  }
  else
  {
    BOOL v29 = 1;
  }

  return v29;
}

+ (BOOL)_fuzzROWProbes:(id)a3
{
  id v4 = a3;
  uint64_t BOOL = GEOConfigGetBOOL();
  uint64_t v6 = GEOConfigGetBOOL();
  uint64_t v7 = GEOConfigGetBOOL();
  uint64_t v8 = GEOConfigGetBOOL();
  uint64_t v9 = GEOConfigGetBOOL();
  LOBYTE(v11) = GEOConfigGetBOOL();
  [a1 _withCollectionRequest:v4 fuzzBaseline:BOOL fuzzCourseAccuracy:v6 fuzzSpeedAccuracy:v7 fuzzHorizAccuracy:v8 fuzzVertAccuracy:v9 useOneSecondPrecision:v11];

  return 1;
}

@end