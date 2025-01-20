@interface GEOIdealTransportTypeFinder
+ (id)_transportTypePreferenceAsString:(int64_t)a3;
+ (int64_t)idealTransportType;
+ (int64_t)idealTransportTypeForCoordinates:(id *)a3 count:(unint64_t)a4 mapType:(int)a5;
+ (int64_t)idealTransportTypeForMapType:(int)a3;
+ (int64_t)idealTransportTypeForOrigin:(id)a3 destination:(id)a4 mapType:(int)a5;
@end

@implementation GEOIdealTransportTypeFinder

+ (int64_t)idealTransportType
{
  return [a1 idealTransportTypeForMapType:0];
}

+ (int64_t)idealTransportTypeForOrigin:(id)a3 destination:(id)a4 mapType:(int)a5
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6[0] = a3;
  v6[1] = a4;
  return [a1 idealTransportTypeForCoordinates:v6 count:2 mapType:*(void *)&a5];
}

+ (int64_t)idealTransportTypeForCoordinates:(id *)a3 count:(unint64_t)a4 mapType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  GEOFindOrCreateLog("com.apple.GeoServices", "GEOIdealTransportTypeFinder");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    if (v5 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v5);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E53DB3E8[(int)v5];
    }
    *(_DWORD *)buf = 134218242;
    *(void *)&buf[4] = a4;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v10;
    _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_INFO, "Will determine ideal transport type for %lu coordinates (mapType: %{public}@", buf, 0x16u);
  }
  unint64_t v11 = GEOGetUserTransportTypePreference();
  v12 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOIdealTransportTypeFinder");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = [a1 _transportTypePreferenceAsString:v11];
    if (v5 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v5);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_1E53DB3E8[(int)v5];
    }
    *(_DWORD *)buf = 138478083;
    *(void *)&buf[4] = v13;
    *(_WORD *)&buf[12] = 2113;
    *(void *)&buf[14] = v14;
    _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_INFO, "\tUser preference: %{private}@, map type: %{private}@\n", buf, 0x16u);
  }
  if (AVFoundationLibraryCore())
  {
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x2050000000;
    v15 = (void *)getAVExternalDeviceClass_softClass;
    uint64_t v42 = getAVExternalDeviceClass_softClass;
    if (!getAVExternalDeviceClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getAVExternalDeviceClass_block_invoke;
      v44 = &unk_1E53DB3C8;
      v45 = &v39;
      __getAVExternalDeviceClass_block_invoke((uint64_t)buf);
      v15 = (void *)v40[3];
    }
    id v16 = v15;
    _Block_object_dispose(&v39, 8);
    v17 = [v16 currentCarPlayExternalDevice];
    LOBYTE(v16) = v17 == 0;

    if ((v16 & 1) == 0)
    {
      v18 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOIdealTransportTypeFinder");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v19 = "\tReturning [DRIVING] because connected to CarPlay";
        goto LABEL_17;
      }
      goto LABEL_18;
    }
  }
  int BOOL = GEOConfigGetBOOL(GeoServicesConfig_ITTEnableDistanceThresholds, (uint64_t)off_1E91142A8);
  v21 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOIdealTransportTypeFinder");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = @"NO";
    if (BOOL) {
      v22 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v22;
    _os_log_impl(&dword_188D96000, v21, OS_LOG_TYPE_INFO, "\tenableDistanceThresholds: %@", buf, 0xCu);
  }

  if (!BOOL || v11 > 1)
  {
LABEL_52:
    v18 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOIdealTransportTypeFinder");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v36 = [a1 _transportTypePreferenceAsString:v11];
      *(_DWORD *)buf = 138477827;
      *(void *)&buf[4] = v36;
      _os_log_impl(&dword_188D96000, v18, OS_LOG_TYPE_INFO, "\tReturning [%{private}@]", buf, 0xCu);
    }
    goto LABEL_54;
  }
  if (a4 < 2)
  {
LABEL_46:
    if (!v11)
    {
      v18 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOIdealTransportTypeFinder");
      unint64_t v11 = 1;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        unint64_t v11 = 1;
        _os_log_impl(&dword_188D96000, v18, OS_LOG_TYPE_INFO, "\tReturning [WALKING] because distance between waypoints never exceeds minimum for driving", buf, 2u);
      }
      goto LABEL_54;
    }
    goto LABEL_52;
  }
  v23 = a3 + 1;
  uint64_t v24 = 1;
  while (1)
  {
    double var1 = v23[-1].var1;
    if (var1 < -180.0
      || var1 > 180.0
      || (double var0 = v23[-1].var0, var0 < -90.0)
      || var0 > 90.0
      || (double v27 = v23->var1, v27 < -180.0)
      || v27 > 180.0
      || (double v28 = v23->var0, v23->var0 < -90.0)
      || v28 > 90.0)
    {
      v35 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOIdealTransportTypeFinder");
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_188D96000, v35, OS_LOG_TYPE_INFO, "\tInvalid coordinates provided, skipping distance checks entirely", buf, 2u);
      }

      goto LABEL_52;
    }
    double v29 = GEOCalculateDistanceRadius(var0, var1, v28, v27, 6367000.0);
    v30 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOIdealTransportTypeFinder");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218241;
      *(void *)&buf[4] = v24;
      *(_WORD *)&buf[12] = 2049;
      *(double *)&buf[14] = v29;
      _os_log_impl(&dword_188D96000, v30, OS_LOG_TYPE_INFO, "\tDistance to destination %lu is %{private}0.1f meters", buf, 0x16u);
    }

    if (v11 != 1) {
      break;
    }
    double Double = GEOConfigGetDouble(GeoServicesConfig_ITTMaxDistanceForWalking, (uint64_t)off_1E91142B8);
    v32 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOIdealTransportTypeFinder");
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)&buf[4] = Double;
      _os_log_impl(&dword_188D96000, v32, OS_LOG_TYPE_INFO, "\tmaxDistanceForWalking: %g", buf, 0xCu);
    }

    if (v29 > Double)
    {
      v18 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOIdealTransportTypeFinder");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v19 = "\tReturning [DRIVING] because distance is too far to walk";
        goto LABEL_17;
      }
      goto LABEL_18;
    }
LABEL_45:
    ++v24;
    ++v23;
    if (a4 == v24) {
      goto LABEL_46;
    }
  }
  double v33 = GEOConfigGetDouble(GeoServicesConfig_ITTMinDistanceForVehicle, (uint64_t)off_1E91142C8);
  v34 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOIdealTransportTypeFinder");
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    *(double *)&buf[4] = v33;
    _os_log_impl(&dword_188D96000, v34, OS_LOG_TYPE_INFO, "\tminDistanceForVehicle: %g", buf, 0xCu);
  }

  if (v29 < v33) {
    goto LABEL_45;
  }
  v18 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOIdealTransportTypeFinder");
  if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
    goto LABEL_18;
  }
  *(_WORD *)buf = 0;
  v19 = "\tReturning [DRIVING] because distance is above minimum threshold";
LABEL_17:
  _os_log_impl(&dword_188D96000, v18, OS_LOG_TYPE_INFO, v19, buf, 2u);
LABEL_18:
  unint64_t v11 = 0;
LABEL_54:

  return v11;
}

+ (id)_transportTypePreferenceAsString:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return @"UNKNOWN";
  }
  else {
    return off_1E53DB410[a3];
  }
}

+ (int64_t)idealTransportTypeForMapType:(int)a3
{
  return objc_msgSend(a1, "idealTransportTypeForOrigin:destination:mapType:", *(void *)&a3, -180.0, -180.0, -180.0, -180.0);
}

@end