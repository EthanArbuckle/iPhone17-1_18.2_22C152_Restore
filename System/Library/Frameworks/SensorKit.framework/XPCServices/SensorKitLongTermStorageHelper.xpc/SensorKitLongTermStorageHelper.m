id sub_100002570(void *a1, void *a2)
{
  id v3;
  CFStringRef v4;
  id v5;
  CFStringRef v6;
  id v7;
  CFStringRef v8;
  id v9;
  CFStringRef v10;
  id v11;
  CFStringRef v12;
  id v13;
  CFStringRef v14;
  id v15;
  CFStringRef v16;
  id v17;
  CFStringRef v18;
  id v19;
  CFStringRef v20;
  id v21;
  CFStringRef v22;
  id v23;
  CFStringRef v24;
  id v25;
  CFStringRef v26;
  int64_t v27;
  id v28;
  CFStringRef v29;
  id v30;
  CFStringRef v31;
  id v32;
  CFStringRef v33;
  int64_t v35;
  objc_super v36;
  void v37[5];
  void v38[5];
  void v39[5];
  void v40[5];
  void v41[56];
  void v42[56];

  if (!a1) {
    return 0;
  }
  v36.receiver = a1;
  v36.super_class = (Class)RDDefaults;
  v3 = objc_msgSendSuper2(&v36, "init");
  if (v3)
  {
    *((void *)v3 + 3) = a2;
    v4 = @"SegmentSizeBytes";
    v41[0] = @"Enabled";
    v41[1] = @"SegmentSizeBytes";
    v42[0] = &off_100011C10;
    v42[1] = &off_100011C28;
    v41[2] = @"MetadataSizeBytes";
    v41[3] = @"MaxAllowedMappedPages";
    v42[2] = &off_100011C40;
    v42[3] = &off_100011C58;
    v41[4] = @"SegmentResizeFactor";
    v41[5] = @"SegmentPaddingFactor";
    v42[4] = &off_100011E20;
    v42[5] = &off_100011E30;
    v41[6] = @"ArchiverBufferSizeBytes";
    v41[7] = @"ArchiveCompressionEnabled";
    v42[6] = &off_100011C70;
    v42[7] = &__kCFBooleanFalse;
    v42[8] = &off_100011C88;
    v41[8] = @"ProtectionClass";
    v41[9] = @"DataProtectionLengthSeconds";
    v42[9] = +[NSNumber numberWithLongLong:XPC_ACTIVITY_INTERVAL_7_DAYS];
    v41[10] = @"TombstoneDataRetentionLengthSeconds";
    v42[10] = +[NSNumber numberWithLongLong:60 * XPC_ACTIVITY_INTERVAL_1_DAY];
    v41[11] = @"KeyProtectionLengthSeconds";
    v35 = 2 * XPC_ACTIVITY_INTERVAL_7_DAYS;
    v42[11] = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:");
    v42[12] = &__kCFBooleanFalse;
    v41[12] = @"Curated";
    v41[13] = @"DatastoreVersion";
    v42[13] = &off_100011CA0;
    v41[14] = @"UpdateCompanionIntervalSeconds";
    v42[14] = +[NSNumber numberWithLongLong:XPC_ACTIVITY_INTERVAL_1_HOUR];
    v41[15] = @"PrepareArchivesIntervalSeconds";
    v42[15] = +[NSNumber numberWithLongLong:XPC_ACTIVITY_INTERVAL_4_HOURS];
    v42[16] = &__kCFBooleanFalse;
    v41[16] = @"PrepareArchivesCPUIntensive";
    v41[17] = @"PrepareArchivesDiskIntensive";
    v42[17] = &__kCFBooleanFalse;
    v41[18] = @"HoldingPeriod";
    v42[18] = +[NSNumber numberWithLongLong:XPC_ACTIVITY_INTERVAL_1_DAY];
    v41[19] = @"SyncCompanionStateToGizmoInterval";
    v42[19] = +[NSNumber numberWithLongLong:XPC_ACTIVITY_INTERVAL_30_MIN];
    v41[20] = @"ResourceSendTimeout";
    v42[20] = +[NSNumber numberWithLongLong:3 * XPC_ACTIVITY_INTERVAL_1_DAY];
    v42[21] = &__kCFBooleanTrue;
    v41[21] = @"AnalyticsEnabled";
    v41[22] = @"ResendArchivesDelay";
    v42[22] = +[NSNumber numberWithLongLong:XPC_ACTIVITY_INTERVAL_15_MIN];
    v41[23] = @"ReminderAlertThresholdSecs";
    v42[23] = +[NSNumber numberWithLongLong:30 * XPC_ACTIVITY_INTERVAL_1_DAY];
    v42[24] = &off_100011CB8;
    v41[24] = @"SendResourcePriority";
    v41[25] = @"FirstReminderAlertThresholdSecs";
    v42[25] = +[NSNumber numberWithLongLong:XPC_ACTIVITY_INTERVAL_1_DAY];
    v41[26] = @"ArchiveResendThresholdSecs";
    v42[26] = +[NSNumber numberWithLongLong:XPC_ACTIVITY_INTERVAL_1_HOUR + 3 * XPC_ACTIVITY_INTERVAL_1_DAY];
    v42[27] = &off_100011EB8;
    v41[27] = @"LegacyResearchStudyBundleIDs";
    v41[28] = @"LegacyResearchStudyEntitlement";
    v42[28] = @"com.apple.SensorAndUsageData";
    v41[29] = @"PreferWifiAssertionDurationSecs";
    v42[29] = +[NSNumber numberWithLongLong:XPC_ACTIVITY_INTERVAL_15_MIN];
    v42[30] = &off_100011E40;
    v41[30] = @"StateCacheSendDebounceIntervalSecs";
    v41[31] = @"AdditionalDiagnosticsEnabled";
    v42[31] = &__kCFBooleanFalse;
    v41[32] = @"TimeSyncSendDebounceIntervalSecs";
    v42[32] = +[NSNumber numberWithLongLong:XPC_ACTIVITY_INTERVAL_1_HOUR];
    v42[33] = &off_100011CD0;
    v41[33] = @"PendingMessageResendLimit";
    v41[34] = @"TimeSyncMessageTimeoutSecs";
    v42[34] = &off_100011E50;
    v42[35] = &off_100011CE8;
    v41[35] = @"MaxArchiveBytes";
    v41[36] = @"CacheDeleteAgeLimit";
    v39[0] = [&off_100011D00 stringValue];
    v40[0] = +[NSNumber numberWithLongLong:XPC_ACTIVITY_INTERVAL_7_DAYS];
    v39[1] = [&off_100011D18 stringValue];
    v40[1] = +[NSNumber numberWithLongLong:6 * XPC_ACTIVITY_INTERVAL_1_DAY];
    v39[2] = [&off_100011D30 stringValue];
    v40[2] = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:");
    v39[3] = [&off_100011D48 stringValue];
    v40[3] = +[NSNumber numberWithLongLong:3 * XPC_ACTIVITY_INTERVAL_1_DAY];
    v39[4] = [&off_100011D60 stringValue];
    v40[4] = +[NSNumber numberWithLongLong:XPC_ACTIVITY_INTERVAL_4_HOURS];
    v42[36] = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:5];
    v41[37] = @"RTCResetTimestampThresholdSecs";
    v42[37] = +[NSNumber numberWithLongLong:XPC_ACTIVITY_INTERVAL_4_HOURS];
    v42[38] = &off_100011D78;
    v41[38] = @"FaceMetricsReminderWeekday";
    v41[39] = @"FaceMetricsReminderHour";
    v41[40] = @"FaceMetricsReminderMinute";
    v42[39] = &off_100011D90;
    v42[40] = &off_100011DA8;
    if ([@"com.apple.SensorKit.motion.gyroscope" length]) {
      v4 = (const __CFString *)[@"com.apple.SensorKit.motion.gyroscope" stringByAppendingFormat:@".%@", @"SegmentSizeBytes"];
    }
    v41[41] = v4;
    v42[41] = &off_100011DC0;
    v5 = [@"com.apple.SensorKit.motion.accelerometer" length];
    v6 = @"SegmentSizeBytes";
    if (v5) {
      v6 = (const __CFString *)[@"com.apple.SensorKit.motion.accelerometer" stringByAppendingFormat:@".%@", @"SegmentSizeBytes"];
    }
    v41[42] = v6;
    v42[42] = &off_100011DC0;
    v7 = [@"com.apple.SensorKit.pedometer.data" length];
    v8 = @"SegmentSizeBytes";
    if (v7) {
      v8 = (const __CFString *)[@"com.apple.SensorKit.pedometer.data" stringByAppendingFormat:@".%@", @"SegmentSizeBytes"];
    }
    v41[43] = v8;
    v42[43] = &off_100011DD8;
    v9 = [@"com.apple.SensorKit.als" length];
    v10 = @"SegmentSizeBytes";
    if (v9) {
      v10 = (const __CFString *)[@"com.apple.SensorKit.als" stringByAppendingFormat:@".%@", @"SegmentSizeBytes"];
    }
    v41[44] = v10;
    v42[44] = &off_100011DF0;
    v11 = [@"com.apple.private.SensorKit.elevation" length];
    v12 = @"SegmentSizeBytes";
    if (v11) {
      v12 = (const __CFString *)[@"com.apple.private.SensorKit.elevation" stringByAppendingFormat:@".%@", @"SegmentSizeBytes"];
    }
    v41[45] = v12;
    v42[45] = &off_100011DF0;
    v13 = [@"com.apple.SensorKit.ambientPressure" length];
    v14 = @"SegmentSizeBytes";
    if (v13) {
      v14 = (const __CFString *)[@"com.apple.SensorKit.ambientPressure" stringByAppendingFormat:@".%@", @"SegmentSizeBytes"];
    }
    v41[46] = v14;
    v42[46] = &off_100011DF0;
    v15 = [@"com.apple.SensorKit.onWristState" length];
    v16 = @"SegmentSizeBytes";
    if (v15) {
      v16 = (const __CFString *)[@"com.apple.SensorKit.onWristState" stringByAppendingFormat:@".%@", @"SegmentSizeBytes"];
    }
    v41[47] = v16;
    v42[47] = &off_100011C70;
    v17 = [@"com.apple.SensorKit.PPG" length];
    v18 = @"SegmentSizeBytes";
    if (v17) {
      v18 = (const __CFString *)[@"com.apple.SensorKit.PPG" stringByAppendingFormat:@".%@", @"SegmentSizeBytes"];
    }
    v41[48] = v18;
    v42[48] = &off_100011DD8;
    v19 = [@"com.apple.SensorKit.visits" length];
    v20 = @"SegmentSizeBytes";
    if (v19) {
      v20 = (const __CFString *)[@"com.apple.SensorKit.visits" stringByAppendingFormat:@".%@", @"SegmentSizeBytes"];
    }
    v41[49] = v20;
    v42[49] = &off_100011C70;
    v21 = [@"com.apple.private.SensorKit.pedometer.stridecalibration" length];
    v22 = @"SegmentSizeBytes";
    if (v21) {
      v22 = (const __CFString *)[@"com.apple.private.SensorKit.pedometer.stridecalibration" stringByAppendingFormat:@".%@", @"SegmentSizeBytes"];
    }
    v41[50] = v22;
    v42[50] = &off_100011C70;
    v23 = [@"com.apple.SensorKit.faceMetrics" length];
    v24 = @"SegmentSizeBytes";
    if (v23) {
      v24 = (const __CFString *)[@"com.apple.SensorKit.faceMetrics" stringByAppendingFormat:@".%@", @"SegmentSizeBytes"];
    }
    v41[51] = v24;
    v42[51] = &off_100011DC0;
    v25 = [@"com.apple.SensorKit.faceMetrics" length];
    v26 = @"HoldingPeriod";
    if (v25) {
      v26 = (const __CFString *)[@"com.apple.SensorKit.faceMetrics" stringByAppendingFormat:@".%@", @"HoldingPeriod"];
    }
    v41[52] = v26;
    if (XPC_ACTIVITY_INTERVAL_1_DAY >= 0) {
      v27 = XPC_ACTIVITY_INTERVAL_1_DAY;
    }
    else {
      v27 = XPC_ACTIVITY_INTERVAL_1_DAY + 1;
    }
    v42[52] = +[NSNumber numberWithLongLong:XPC_ACTIVITY_INTERVAL_7_DAYS + (v27 >> 1)];
    v28 = [@"com.apple.SensorKit.faceMetrics" length];
    v29 = @"DataProtectionLengthSeconds";
    if (v28) {
      v29 = (const __CFString *)[@"com.apple.SensorKit.faceMetrics" stringByAppendingFormat:@".%@", @"DataProtectionLengthSeconds"];
    }
    v41[53] = v29;
    v42[53] = +[NSNumber numberWithLongLong:v35];
    v30 = [@"com.apple.SensorKit.faceMetrics" length];
    v31 = @"CacheDeleteAgeLimit";
    if (v30) {
      v31 = (const __CFString *)[@"com.apple.SensorKit.faceMetrics" stringByAppendingFormat:@".%@", @"CacheDeleteAgeLimit"];
    }
    v41[54] = v31;
    v37[0] = [&off_100011D00 stringValue];
    v38[0] = +[NSNumber numberWithLongLong:v35];
    v37[1] = [&off_100011D18 stringValue];
    v38[1] = +[NSNumber numberWithLongLong:6 * XPC_ACTIVITY_INTERVAL_1_DAY + XPC_ACTIVITY_INTERVAL_7_DAYS];
    v37[2] = [&off_100011D30 stringValue];
    v38[2] = +[NSNumber numberWithLongLong:5 * XPC_ACTIVITY_INTERVAL_1_DAY + XPC_ACTIVITY_INTERVAL_7_DAYS];
    v37[3] = [&off_100011D48 stringValue];
    v38[3] = +[NSNumber numberWithLongLong:3 * XPC_ACTIVITY_INTERVAL_1_DAY + XPC_ACTIVITY_INTERVAL_7_DAYS];
    v37[4] = [&off_100011D60 stringValue];
    v38[4] = +[NSNumber numberWithLongLong:XPC_ACTIVITY_INTERVAL_4_HOURS];
    v42[54] = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:5];
    v32 = [@"com.apple.SensorKit.ECG" length];
    v33 = @"MetadataSizeBytes";
    if (v32) {
      v33 = (const __CFString *)[@"com.apple.SensorKit.ECG" stringByAppendingFormat:@".%@", @"MetadataSizeBytes"];
    }
    v41[55] = v33;
    v42[55] = &off_100011E08;
    objc_msgSend(*((id *)v3 + 3), "registerDefaults:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v42, v41, 56));
  }
  return v3;
}

id sub_100003014(uint64_t a1, void *a2, void *a3)
{
  id v5 = [a3 componentsSeparatedByString:@"."];
  v6 = (char *)[v5 count];
  do
  {
    if (!v6) {
      break;
    }
    id v7 = objc_msgSend(objc_msgSend(v5, "subarrayWithRange:", 0, v6), "componentsJoinedByString:", @".");
    id v8 = a2;
    if ([v7 length]) {
      id v8 = [v7 stringByAppendingFormat:@".%@", a2];
    }
    if ([*(id *)(a1 + 24) objectForKey:v8]) {
      return v8;
    }
    --v6;
  }
  while (!objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", v6), "isEqualToString:", @"tombstones"));
  return a2;
}

uint64_t sub_100003104(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = (unint64_t)objc_msgSend(*(id *)(result + 24), "integerForKey:", sub_100003014(result, @"Enabled", 0));
    return v1 & ~(v1 >> 63) & 1;
  }
  return result;
}

unint64_t sub_100003154(unint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = (uint64_t)objc_msgSend(*(id *)(result + 24), "integerForKey:", sub_100003014(result, @"Enabled", 0));
    if ((v2 & ~(v2 >> 63) & 4) != 0)
    {
      return 1;
    }
    else
    {
      unint64_t v3 = (unint64_t)objc_msgSend(*(id *)(v1 + 24), "integerForKey:", sub_100003014(v1, @"Enabled", 0));
      return ((v3 & ~(v3 >> 62)) >> 1) & 1;
    }
  }
  return result;
}

void *sub_1000031DC(void *result, void *a2)
{
  if (result)
  {
    uint64_t v2 = (void *)result[3];
    id v3 = sub_100003014((uint64_t)result, @"HoldingPeriod", a2);
    return [v2 integerForKey:v3];
  }
  return result;
}

id *sub_10000322C(id *result)
{
  if (result) {
    return (id *)[result[3] BOOLForKey:@"AdditionalDiagnosticsEnabled"];
  }
  return result;
}

id *sub_100003490(id *result)
{
  if (result)
  {
    id v1 = [result[3] objectForKey:@"CursorHMACKey"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      return (id *)v1;
    }
    else {
      return 0;
    }
  }
  return result;
}

id *sub_1000034E8(id *result, uint64_t a2)
{
  if (result) {
    return (id *)[result[3] setObject:a2 forKey:@"CursorHMACKey"];
  }
  return result;
}

void start()
{
  v0 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.SensorKitLongTermStorageHelper.main", v0);
  id v3 = [[SensorKitLongTermStorageHelper alloc] initWithQueue:v1];
  [(SensorKitLongTermStorageHelper *)v3 resume];
  dispatch_main();
}

NSBundle *sub_10000356C(uint64_t a1, _OWORD *a2)
{
  self;
  long long v3 = a2[1];
  v12[0] = *a2;
  v12[1] = v3;
  result = (NSBundle *)sub_100005B84((uint64_t)NSURL, v12);
  if (result)
  {
    id v5 = result;
    id v6 = (id)_CFBundleCopyBundleURLForExecutableURL();
    if (v6)
    {
      id v7 = v6;
      result = +[NSBundle bundleWithURL:v6];
      if (result) {
        return result;
      }
      if (qword_100016FE8 != -1) {
        dispatch_once(&qword_100016FE8, &stru_100010420);
      }
      uint64_t v8 = qword_100016FE0;
      if (!os_log_type_enabled((os_log_t)qword_100016FE0, OS_LOG_TYPE_ERROR)) {
        return 0;
      }
      LODWORD(v12[0]) = 138543362;
      *(void *)((char *)v12 + 4) = v7;
      v9 = "Could not create bundle for bundle URL %{public}@";
      v10 = v8;
    }
    else
    {
      if (qword_100016FE8 != -1) {
        dispatch_once(&qword_100016FE8, &stru_100010420);
      }
      uint64_t v11 = qword_100016FE0;
      if (!os_log_type_enabled((os_log_t)qword_100016FE0, OS_LOG_TYPE_ERROR)) {
        return 0;
      }
      LODWORD(v12[0]) = 138543362;
      *(void *)((char *)v12 + 4) = v5;
      v9 = "Could not get bundle URL for executable URL %{public}@";
      v10 = v11;
    }
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, v9, (uint8_t *)v12, 0xCu);
    return 0;
  }
  return result;
}

void sub_1000036F0(id a1)
{
  qword_100016FE0 = (uint64_t)os_log_create("com.apple.SensorKit", "NSBundleSKInternal");
}

void *sub_1000037D4(void *a1, void *a2, void *a3)
{
  if (!a1) {
    return 0;
  }
  v7.receiver = a1;
  v7.super_class = (Class)SRCursor;
  id v5 = objc_msgSendSuper2(&v7, "init");
  if (v5)
  {
    v5[1] = [a2 copy];
    v5[2] = [a3 copy];
  }
  return v5;
}

uint64_t sub_100004624(uint64_t result, void *a2, id *a3, void *a4, void *a5)
{
  if (result)
  {
    v9 = (void *)result;
    id v10 = [a4 bundleIdForConnection:result];
    if (![a2 bundleIdentifier]) {
      [a2 setBundleIdentifier:v10];
    }
    if ([a2 bundleIdentifier])
    {
      if ((objc_msgSend(objc_msgSend(a2, "bundleIdentifier"), "isEqual:", v10) & 1) != 0
        || (result = sub_1000048A8(v9, @"com.apple.private.sensorkit.auth.request.arbitrary_bundle", 0, 0, 0, a3, a4, a5), result))
      {
        result = sub_1000048A8(v9, @"com.apple.sensorkit.reader.allow", [a2 sensor], objc_msgSend(a2, "bundleIdentifier"), @"com.apple.private.sensorkit.export.allow-all", a3, a4, a5);
        if (result)
        {
          if ([a2 conformsToProtocol:&OBJC_PROTOCOL___SRRequestRecording]
            && objc_msgSend(objc_msgSend(a2, "sensorConfiguration"), "count"))
          {
            id v11 = [a2 sensor];
            return sub_1000048A8(v9, @"com.apple.SensorKit.reader.sensor-configuration.allow", v11, 0, 0, a3, a4, a5);
          }
          else
          {
            return 1;
          }
        }
      }
    }
    else
    {
      if (a5) {
        *a5 = +[SRError authorizationError];
      }
      if (qword_100017000 != -1) {
        dispatch_once(&qword_100017000, &stru_100010440);
      }
      v12 = qword_100017008;
      result = os_log_type_enabled((os_log_t)qword_100017008, OS_LOG_TYPE_ERROR);
      if (result)
      {
        int v13 = 138543874;
        v14 = v9;
        __int16 v15 = 1026;
        unsigned int v16 = [v9 processIdentifier];
        __int16 v17 = 2114;
        v18 = a2;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Connection %{public}@ from pid %{public}d rejected because no bundle identifier could be found for this connection. Request: %{public}@", (uint8_t *)&v13, 0x1Cu);
        return 0;
      }
    }
  }
  return result;
}

BOOL sub_1000048A8(void *a1, void *a2, void *a3, void *a4, uint64_t a5, id *a6, void *a7, void *a8)
{
  if ((sub_100003104((uint64_t)a6) & 1) == 0)
  {
    if (!a8) {
      return 0;
    }
    uint64_t v22 = 4098;
LABEL_20:
    id v21 = +[SRError authorizationErrorWithStatus:v22];
    goto LABEL_21;
  }
  if ((sub_100003154((unint64_t)a6) & 1) == 0)
  {
    if (!a8) {
      return 0;
    }
    uint64_t v22 = 4097;
    goto LABEL_20;
  }
  id v16 = objc_msgSend(a3, "sr_sensorByDeletingDeletionRecord");
  if ((sub_100004C04(a1, a2, (uint64_t)v16, (uint64_t)a7) & 1) == 0)
  {
    if (a8) {
      *a8 = +[SRError invalidEntitlementError];
    }
    if (qword_100017000 != -1) {
      dispatch_once(&qword_100017000, &stru_100010440);
    }
    v24 = qword_100017008;
    BOOL result = os_log_type_enabled((os_log_t)qword_100017008, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    int v26 = 138543874;
    v27 = a1;
    __int16 v28 = 1026;
    LODWORD(v29[0]) = [a1 processIdentifier];
    WORD2(v29[0]) = 2114;
    *(void *)((char *)v29 + 6) = a2;
    _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Connection %{public}@ from pid %{public}d rejected for lacking entitlement for %{public}@", (uint8_t *)&v26, 0x1Cu);
    return 0;
  }
  if ([a2 isEqualToString:@"com.apple.private.sensorkit.diagnostics.allow"]
    && (sub_100004C04(a1, @"com.apple.private.sensorkit.debugging.allow", (uint64_t)v16, (uint64_t)a7) & 1) == 0
    && (sub_10000322C(a6) & 1) == 0)
  {
    if (qword_100017000 != -1) {
      dispatch_once(&qword_100017000, &stru_100010440);
    }
    v25 = qword_100017008;
    if (os_log_type_enabled((os_log_t)qword_100017008, OS_LOG_TYPE_ERROR))
    {
      int v26 = 138543618;
      v27 = a1;
      __int16 v28 = 1026;
      LODWORD(v29[0]) = [a1 processIdentifier];
      _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Connection %{public}@ from pid %{public}d rejected because additional diagnostics are not enabled", (uint8_t *)&v26, 0x12u);
      if (a8) {
        goto LABEL_33;
      }
    }
    else if (a8)
    {
LABEL_33:
      id v21 = +[SRError invalidEntitlementError];
      goto LABEL_21;
    }
    return 0;
  }
  if (!a4) {
    return 1;
  }
  unsigned __int8 v17 = [a7 isAuthorizedForSensor:v16 bundleIdentifier:a4];
  id v18 = [a7 valueForEntitlement:a5 connection:a1];
  BOOL result = 1;
  if ((v17 & 1) == 0 && !v18)
  {
    if (qword_100017000 != -1) {
      dispatch_once(&qword_100017000, &stru_100010440);
    }
    v20 = qword_100017008;
    if (os_log_type_enabled((os_log_t)qword_100017008, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 138543618;
      v27 = a4;
      __int16 v28 = 2114;
      v29[0] = v16;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ isn't authorized for %{public}@", (uint8_t *)&v26, 0x16u);
    }
    if (a8)
    {
      id v21 = +[SRError authorizationError];
LABEL_21:
      id v23 = v21;
      BOOL result = 0;
      *a8 = v23;
      return result;
    }
    return 0;
  }
  return result;
}

uint64_t sub_100004C04(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  unsigned int v8 = [a2 isEqualToString:@"com.apple.sensorkit.reader.allow"];
  if (objc_msgSend(a1, "_sr_hasEntitlement:sensor:valueProvider:", a2, a3, a4)) {
    return 1;
  }
  if (v8) {
    CFStringRef v10 = @"com.apple.developer.sensorkit.reader.allow";
  }
  else {
    CFStringRef v10 = 0;
  }

  return (uint64_t)objc_msgSend(a1, "_sr_hasEntitlement:sensor:valueProvider:", v10, a3, a4);
}

void sub_100004FC8(id a1)
{
  qword_100017008 = (uint64_t)os_log_create("com.apple.SensorKit", "NSXPCConnection+Valdiation");
}

CFStringRef sub_100005058(uint64_t a1)
{
  if (a1 >= 4096)
  {
    if (os_variant_has_internal_content())
    {
      if (a1 >= 12288)
      {
        switch(a1)
        {
          case 12288:
            CFStringRef result = @"Writer Not Monitoring";
            break;
          case 12289:
            CFStringRef result = @"Writer Not Authorized";
            break;
          case 12290:
            CFStringRef result = @"Writer Input was invalid";
            break;
          case 12291:
            CFStringRef result = @"No available memory mapped to write sample";
            break;
          case 12292:
            CFStringRef result = @"Provided sample is out of order from previous samples";
            break;
          case 12293:
            CFStringRef result = @"Provided sample is too large";
            break;
          case 12294:
            CFStringRef result = @"Framework datastore state is invalid";
            break;
          case 12295:
            CFStringRef result = @"Writer does not have explicit authorization";
            break;
          case 12296:
            CFStringRef result = @"Provided sample is from the future";
            break;
          default:
            if ((unint64_t)(a1 - 20480) < 5 || a1 != 0x4000) {
              return 0;
            }
            CFStringRef result = @"Sensor Configuration is invalid";
            break;
        }
        return result;
      }
      if (a1 >= 0x2000)
      {
        switch(a1)
        {
          case 8192:
            CFStringRef result = @"No space available to write samples";
            break;
          case 8193:
            CFStringRef result = @"Connection Not Found";
            break;
          case 8194:
            CFStringRef result = @"Internal Error";
            break;
          case 8195:
            CFStringRef result = @"Prompt Busy";
            break;
          case 8196:
            CFStringRef result = @"Prompt is cancelled";
            break;
          case 8198:
            CFStringRef result = @"No device identifier could be found";
            break;
          case 8199:
            CFStringRef result = @"Time synchronization state is invalid";
            break;
          case 8200:
            CFStringRef result = @"The requested bundle authorization is being requested for could not be found";
            break;
          case 8201:
            CFStringRef result = @"No new authorization groups were requested";
            break;
          default:
            return 0;
        }
        return result;
      }
      switch(a1)
      {
        case 4096:
          return @"Required app is not installed";
        case 4097:
          return @"Required onboarding not completed";
        case 4098:
          return @"Global setting not enabled";
      }
    }
    return 0;
  }
  switch(a1)
  {
    case 0:
      long long v3 = +[NSBundle bundleForClass:objc_opt_class()];
      CFStringRef v4 = @"SRErrorInvalidEntitlement";
      break;
    case 1:
      long long v3 = +[NSBundle bundleForClass:objc_opt_class()];
      CFStringRef v4 = @"SRErrorNoAuthorization";
      break;
    case 2:
      long long v3 = +[NSBundle bundleForClass:objc_opt_class()];
      CFStringRef v4 = @"SRErrorDataInaccessible";
      break;
    case 3:
      long long v3 = +[NSBundle bundleForClass:objc_opt_class()];
      CFStringRef v4 = @"SRErrorFetchRequestInvalid";
      break;
    case 4:
      long long v3 = +[NSBundle bundleForClass:objc_opt_class()];
      CFStringRef v4 = @"SRErrorPromptDeclined";
      break;
    default:
      return 0;
  }

  return (const __CFString *)[(NSBundle *)v3 localizedStringForKey:v4 value:&stru_1000111E8 table:0];
}

NSString *sub_1000053BC(uint64_t a1)
{
  if (a1 == 1)
  {
    CFStringRef v1 = @"SRErrorNoAuthorizationRecovery";
  }
  else
  {
    if (a1 != 2) {
      return 0;
    }
    CFStringRef v1 = @"SRErrorDataInaccessibleRecovery";
  }
  uint64_t v2 = +[NSBundle bundleForClass:objc_opt_class()];

  return [(NSBundle *)v2 localizedStringForKey:v1 value:&stru_1000111E8 table:0];
}

SRAbsoluteTime SRAbsoluteTimeFromContinuousTime(uint64_t cont)
{
  if (qword_100017068 != -1) {
    dispatch_once(&qword_100017068, &stru_1000104C0);
  }
  if (qword_100017070 >= cont) {
    double v2 = -1.0;
  }
  else {
    double v2 = 1.0;
  }
  double v3 = *(double *)&qword_100017078 + 0.0;
  TMConvertTicksToSeconds();
  return v3 + v4 * v2;
}

void sub_100005AC4(id a1)
{
  uint64_t v1 = mach_continuous_time();
  TMGetKernelMonotonicClock();
  qword_100017078 = v2;
  qword_100017070 = v1 + ((mach_continuous_time() - v1) >> 1);
}

CFAbsoluteTime SRAbsoluteTimeToCFAbsoluteTime(SRAbsoluteTime sr)
{
  return (double)0 / 1000000000.0
       + (double)0
       - kCFAbsoluteTimeIntervalSince1970
       - SRAbsoluteTimeFromContinuousTime(0)
       + sr;
}

NSURL *sub_100005B84(uint64_t a1, _OWORD *a2)
{
  self;
  bzero(buffer, 0x400uLL);
  long long v3 = a2[1];
  *(_OWORD *)v10.val = *a2;
  *(_OWORD *)&v10.val[4] = v3;
  if (proc_pidpath_audittoken(&v10, buffer, 0x400u) <= 0)
  {
    if (qword_100017020 != -1) {
      dispatch_once(&qword_100017020, &stru_1000104E0);
    }
    uint64_t v9 = qword_100017018;
    if (!os_log_type_enabled((os_log_t)qword_100017018, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_DWORD *)buf = 68157954;
    LODWORD(v12[0]) = 32;
    WORD2(v12[0]) = 2096;
    *(void *)((char *)v12 + 6) = a2;
    id v6 = "Cannot determine path for audit token %.*P";
    objc_super v7 = v9;
    uint32_t v8 = 18;
    goto LABEL_13;
  }
  CFStringRef result = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", +[NSString stringWithUTF8String:buffer]);
  if (result) {
    return result;
  }
  if (qword_100017020 != -1) {
    dispatch_once(&qword_100017020, &stru_1000104E0);
  }
  uint64_t v5 = qword_100017018;
  if (os_log_type_enabled((os_log_t)qword_100017018, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446210;
    v12[0] = buffer;
    id v6 = "Could not create URL for path %{public}s";
    objc_super v7 = v5;
    uint32_t v8 = 12;
LABEL_13:
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, v6, buf, v8);
  }
  return 0;
}

void sub_100005D3C(id a1)
{
  qword_100017018 = (uint64_t)os_log_create("com.apple.SensorKit", "NSURLSK");
}

SRSensorDescription *sub_100006048(uint64_t a1, void *a2)
{
  if (!a1) {
    return 0;
  }
  double v4 = (NSURL *)objc_msgSend(a2, "sr_sensorByDeletingDeletionRecord");
  unsigned __int8 v5 = [(NSURL *)v4 isEqualToString:a2];
  id v6 = (SRSensorDescription *)[*(id *)(a1 + 8) objectForKey:v4];
  if (!v6)
  {
    unsigned __int8 v26 = v5;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    objc_super v7 = *(void **)(a1 + 16);
    id v8 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v8)
    {
      id v10 = v8;
      uint64_t v11 = *(void *)v28;
      *(void *)&long long v9 = 138543362;
      long long v25 = v9;
LABEL_5:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v27 + 1) + 8 * v12);
        id v14 = [(NSURL *)v4 stringByAppendingPathExtension:@"plist", v25];
        if (!v14) {
          break;
        }
        __int16 v15 = +[NSURL fileURLWithPath:v14 isDirectory:0 relativeToURL:v13];
        v31 = 0;
        id v16 = +[NSDictionary dictionaryWithContentsOfURL:v15 error:&v31];
        if (v16)
        {
          id v6 = [[SRSensorDescription alloc] initWithDictionary:v16];
          unsigned __int8 v17 = [(SRSensorDescription *)v6 name];
          [*(id *)(a1 + 8) setObject:v6 forKey:v17];
          if ([(SRSensorDescription *)v6 legacyName]) {
            objc_msgSend(*(id *)(a1 + 8), "setObject:forKey:", v6, -[SRSensorDescription legacyName](v6, "legacyName"));
          }
          id v18 = qword_100017028;
          if (os_log_type_enabled((os_log_t)qword_100017028, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            v34 = (NSURL *)v17;
            __int16 v35 = 2114;
            v36 = v6;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Cached description for %{public}@, %{public}@", buf, 0x16u);
          }
          if (v6) {
            goto LABEL_27;
          }
        }
        else if (objc_msgSend(-[SRSensorDescription domain](v31, "domain"), "isEqualToString:", NSCocoaErrorDomain)&& -[SRSensorDescription code](v31, "code") == (id)260)
        {
          v19 = qword_100017028;
          if (os_log_type_enabled((os_log_t)qword_100017028, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v25;
            v34 = v15;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%{public}@ not found", buf, 0xCu);
          }
        }
        else
        {
          v20 = qword_100017028;
          if (os_log_type_enabled((os_log_t)qword_100017028, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v34 = v15;
            __int16 v35 = 2114;
            v36 = v31;
            _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to parse %{public}@ because %{public}@", buf, 0x16u);
          }
        }
        if (v10 == (id)++v12)
        {
          id v10 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
          if (v10) {
            goto LABEL_5;
          }
          goto LABEL_24;
        }
      }
    }
    else
    {
LABEL_24:
      id v21 = qword_100017028;
      if (os_log_type_enabled((os_log_t)qword_100017028, OS_LOG_TYPE_ERROR))
      {
        v24 = *(SRSensorDescription **)(a1 + 16);
        *(_DWORD *)buf = 138543618;
        v34 = v4;
        __int16 v35 = 2114;
        v36 = v24;
        _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to find description for %{public}@ in %{public}@", buf, 0x16u);
      }
    }
    id v6 = 0;
LABEL_27:
    unsigned __int8 v5 = v26;
  }
  if (v6) {
    char v22 = v5;
  }
  else {
    char v22 = 1;
  }
  if (v22) {
    return v6;
  }

  return (SRSensorDescription *)+[SRSensorDescription sensorDescriptionForDeletionRecordFromDescription:v6];
}

uint64_t sub_1000064AC()
{
  self;
  uint64_t result = qword_100017030;
  if (!qword_100017030)
  {
    self;
    if (qword_100017040 != -1) {
      dispatch_once(&qword_100017040, &stru_100010500);
    }
    return qword_100017038;
  }
  return result;
}

void sub_100006548(id a1)
{
  qword_100017038 = objc_alloc_init(SRSensorsCache);
}

void *sub_100006830(void *result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = [SRSensorDescriptionEnumerator alloc];
    if (v2)
    {
      v4.receiver = v2;
      v4.super_class = (Class)SRSensorDescriptionEnumerator;
      long long v3 = objc_msgSendSuper2(&v4, "init");
      if (v3) {
        v3[1] = v1;
      }
    }
    else
    {
      long long v3 = 0;
    }
    return v3;
  }
  return result;
}

void sub_100006E94(id a1)
{
  uint64_t v1 = qword_100017048;
  if (os_log_type_enabled((os_log_t)qword_100017048, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Client connection has invalidated.", v2, 2u);
  }
}

id sub_1000078C0(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!a2)
  {
    __int16 v15 = qword_100017048;
    if (os_log_type_enabled((os_log_t)qword_100017048, OS_LOG_TYPE_INFO))
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "No samples returned, marking fetch as complete", (uint8_t *)&v21, 2u);
    }
    uint64_t v16 = a1[6];
    unsigned __int8 v17 = +[SRError sr_errorWithUnderlying:a5];
    goto LABEL_12;
  }
  if (([a2 conformsToProtocol:&OBJC_PROTOCOL___SRSampling] & 1) == 0)
  {
    id v18 = qword_100017048;
    if (os_log_type_enabled((os_log_t)qword_100017048, OS_LOG_TYPE_FAULT))
    {
      v19 = (objc_class *)objc_opt_class();
      int v21 = 138543362;
      char v22 = NSStringFromClass(v19);
      _os_log_fault_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "%{public}@ does not conform to SRSampling", (uint8_t *)&v21, 0xCu);
    }
    uint64_t v16 = a1[6];
    unsigned __int8 v17 = +[SRError errorWithCode:8194];
LABEL_12:
    (*(void (**)(uint64_t, void, uint64_t, void, SRError *, double))(v16 + 16))(v16, 0, 1, 0, v17, NAN);
    return 0;
  }
  uint64_t v10 = mach_continuous_time();
  double v11 = SRAbsoluteTimeFromContinuousTime(v10);
  uint64_t v12 = (void *)a1[4];
  uint64_t v13 = a1[5];
  uint64_t v14 = a1[6];

  return [v12 handleReplyForRequest:v13 withSamples:a2 timestamp:a3 token:a4 state:a5 error:v14 reply:v11];
}

id sub_100007CD0(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!a2)
  {
    __int16 v15 = qword_100017048;
    if (os_log_type_enabled((os_log_t)qword_100017048, OS_LOG_TYPE_INFO))
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "No samples returned, marking fetch as complete", (uint8_t *)&v21, 2u);
    }
    uint64_t v16 = a1[6];
    unsigned __int8 v17 = +[SRError sr_errorWithUnderlying:a5];
    goto LABEL_12;
  }
  if (([a2 conformsToProtocol:&OBJC_PROTOCOL___SRSampling] & 1) == 0)
  {
    id v18 = qword_100017048;
    if (os_log_type_enabled((os_log_t)qword_100017048, OS_LOG_TYPE_FAULT))
    {
      v19 = (objc_class *)objc_opt_class();
      int v21 = 138543362;
      char v22 = NSStringFromClass(v19);
      _os_log_fault_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "%{public}@ does not conform to SRSampling", (uint8_t *)&v21, 0xCu);
    }
    uint64_t v16 = a1[6];
    unsigned __int8 v17 = +[SRError errorWithCode:8194];
LABEL_12:
    (*(void (**)(uint64_t, void, uint64_t, void, SRError *, double))(v16 + 16))(v16, 0, 1, 0, v17, NAN);
    return 0;
  }
  uint64_t v10 = mach_continuous_time();
  double v11 = SRAbsoluteTimeFromContinuousTime(v10);
  uint64_t v12 = (void *)a1[4];
  uint64_t v13 = a1[5];
  uint64_t v14 = a1[6];

  return [v12 handleReplyForRequest:v13 withSamples:a2 timestamp:a3 token:a4 state:a5 error:v14 reply:v11];
}

uint64_t sub_10000840C(uint64_t a1, uint64_t a2)
{
  objc_super v4 = qword_100017050;
  if (os_log_type_enabled((os_log_t)qword_100017050, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    uint64_t v7 = a2;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Unable to connect to daemon because %{public}@", (uint8_t *)&v6, 0xCu);
  }
  return (*(uint64_t (**)(void, void *, SRError *))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), &__NSDictionary0__struct, +[SRError errorWithCode:8193]);
}

uint64_t sub_1000084EC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1000085C8(uint64_t a1, uint64_t a2)
{
  objc_super v4 = qword_100017050;
  if (os_log_type_enabled((os_log_t)qword_100017050, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    uint64_t v7 = a2;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Unable to connect to daemon because %{public}@", (uint8_t *)&v6, 0xCu);
  }
  return (*(uint64_t (**)(void, void, SRError *))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, +[SRError errorWithCode:8193]);
}

uint64_t sub_1000086A4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100008780(uint64_t a1, uint64_t a2)
{
  objc_super v4 = qword_100017050;
  if (os_log_type_enabled((os_log_t)qword_100017050, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    uint64_t v7 = a2;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Unable to connect to daemon because %{public}@", (uint8_t *)&v6, 0xCu);
  }
  return (*(uint64_t (**)(void, void, SRError *))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, +[SRError errorWithCode:8193]);
}

uint64_t sub_10000885C(uint64_t a1, uint64_t a2)
{
  if (a2) {
    +[NSURL fileURLWithPath:a2];
  }
  long long v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

uint64_t sub_100008984(uint64_t a1, uint64_t a2)
{
  objc_super v4 = qword_100017050;
  if (os_log_type_enabled((os_log_t)qword_100017050, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    uint64_t v7 = a2;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Unable to connect to daemon because %{public}@", (uint8_t *)&v6, 0xCu);
  }
  return (*(uint64_t (**)(void, void *, SRError *))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), &__NSDictionary0__struct, +[SRError errorWithCode:8193]);
}

uint64_t sub_100008A64(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100008B40(uint64_t a1, uint64_t a2)
{
  objc_super v4 = qword_100017050;
  if (os_log_type_enabled((os_log_t)qword_100017050, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    uint64_t v7 = a2;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Unable to connect to daemon because %{public}@", (uint8_t *)&v6, 0xCu);
  }
  return (*(uint64_t (**)(void, void *, SRError *))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), &__NSDictionary0__struct, +[SRError errorWithCode:8193]);
}

uint64_t sub_100008C20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100008CCC(uint64_t a1, uint64_t a2)
{
  objc_super v4 = qword_100017050;
  if (os_log_type_enabled((os_log_t)qword_100017050, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    uint64_t v7 = a2;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Unable to connect to daemon because %{public}@", (uint8_t *)&v6, 0xCu);
  }
  return (*(uint64_t (**)(void, void, SRError *))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, +[SRError errorWithCode:8193]);
}

uint64_t sub_100008E34(uint64_t a1, uint64_t a2)
{
  objc_super v4 = qword_100017050;
  if (os_log_type_enabled((os_log_t)qword_100017050, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    uint64_t v7 = a2;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Unable to connect to daemon because %{public}@", (uint8_t *)&v6, 0xCu);
  }
  return (*(uint64_t (**)(void, void *, SRError *))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), &__NSArray0__struct, +[SRError errorWithCode:8193]);
}

NSURL *sub_1000097C0(NSURL *result)
{
  if (result)
  {
    long long v4 = 0u;
    long long v5 = 0u;
    [(NSURL *)result auditToken];
    *(_OWORD *)buf = v4;
    long long v7 = v5;
    uint64_t result = [sub_10000356C((uint64_t)NSBundle, buf) bundleIdentifier];
    if (!result)
    {
      *(_OWORD *)buf = v4;
      long long v7 = v5;
      uint64_t result = sub_100005B84((uint64_t)NSURL, buf);
      if (result)
      {
        uint64_t v1 = result;
        CFDictionaryRef v2 = CFBundleCopyInfoDictionaryForURL((CFURLRef)result);
        if (v2)
        {
          return (NSURL *)[(__CFDictionary *)v2 objectForKeyedSubscript:@"CFBundleIdentifier"];
        }
        else
        {
          if (qword_100017060 != -1) {
            dispatch_once(&qword_100017060, &stru_100010608);
          }
          long long v3 = qword_100017058;
          if (os_log_type_enabled((os_log_t)qword_100017058, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v1;
            _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Could not get embedded info plist for executable %{public}@", buf, 0xCu);
          }
          return 0;
        }
      }
    }
  }
  return result;
}

void sub_100009900(id a1)
{
  qword_100017058 = (uint64_t)os_log_create("com.apple.SensorKit", "NSXPCConnectionSK");
}

void CCHmac(CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
}

CCRNGStatus CCRandomGenerateBytes(void *bytes, size_t count)
{
  return _CCRandomGenerateBytes(bytes, count);
}

CFDictionaryRef CFBundleCopyInfoDictionaryForURL(CFURLRef url)
{
  return _CFBundleCopyInfoDictionaryForURL(url);
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t TCCAccessCheckAuditToken()
{
  return _TCCAccessCheckAuditToken();
}

uint64_t TCCAccessCopyBundleIdentifiersDisabledForService()
{
  return _TCCAccessCopyBundleIdentifiersDisabledForService();
}

uint64_t TCCAccessCopyBundleIdentifiersForService()
{
  return _TCCAccessCopyBundleIdentifiersForService();
}

uint64_t TCCAccessCopyInformationForBundleId()
{
  return _TCCAccessCopyInformationForBundleId();
}

uint64_t TCCAccessGetOverride()
{
  return _TCCAccessGetOverride();
}

uint64_t TCCAccessPreflight()
{
  return _TCCAccessPreflight();
}

uint64_t TCCAccessReset()
{
  return _TCCAccessReset();
}

uint64_t TCCAccessResetForBundleId()
{
  return _TCCAccessResetForBundleId();
}

uint64_t TCCAccessSetForBundleId()
{
  return _TCCAccessSetForBundleId();
}

uint64_t TCCAccessSetOverride()
{
  return _TCCAccessSetOverride();
}

uint64_t TMConvertTicksToSeconds()
{
  return _TMConvertTicksToSeconds();
}

uint64_t TMGetKernelMonotonicClock()
{
  return _TMGetKernelMonotonicClock();
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return __CFBundleCopyBundleURLForExecutableURL();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

uint64_t dyld_program_sdk_at_least()
{
  return _dyld_program_sdk_at_least();
}

uint64_t mach_continuous_time(void)
{
  return _mach_continuous_time();
}

uint64_t mach_get_times()
{
  return _mach_get_times();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

int proc_pidpath_audittoken(audit_token_t *audittoken, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath_audittoken(audittoken, buffer, buffersize);
}

int timingsafe_bcmp(const void *__b1, const void *__b2, size_t __len)
{
  return _timingsafe_bcmp(__b1, __b2, __len);
}

id objc_msgSend_URLByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 URLByDeletingPathExtension];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_authorizationError(void *a1, const char *a2, ...)
{
  return [a1 authorizationError];
}

id objc_msgSend_authorizationService(void *a1, const char *a2, ...)
{
  return [a1 authorizationService];
}

id objc_msgSend_binarySampleRepresentation(void *a1, const char *a2, ...)
{
  return [a1 binarySampleRepresentation];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return [a1 bundleURL];
}

id objc_msgSend_bypassHoldingPeriod(void *a1, const char *a2, ...)
{
  return [a1 bypassHoldingPeriod];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_clientInterface(void *a1, const char *a2, ...)
{
  return [a1 clientInterface];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_connectionToDaemon(void *a1, const char *a2, ...)
{
  return [a1 connectionToDaemon];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_cursor(void *a1, const char *a2, ...)
{
  return [a1 cursor];
}

id objc_msgSend_datastoreBackend(void *a1, const char *a2, ...)
{
  return [a1 datastoreBackend];
}

id objc_msgSend_debugClient(void *a1, const char *a2, ...)
{
  return [a1 debugClient];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_eligibleDaemons(void *a1, const char *a2, ...)
{
  return [a1 eligibleDaemons];
}

id objc_msgSend_from(void *a1, const char *a2, ...)
{
  return [a1 from];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_infoPlistAuthorizationCategory(void *a1, const char *a2, ...)
{
  return [a1 infoPlistAuthorizationCategory];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidEntitlementError(void *a1, const char *a2, ...)
{
  return [a1 invalidEntitlementError];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return [a1 key];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_legacyName(void *a1, const char *a2, ...)
{
  return [a1 legacyName];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return [a1 listener];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_publicEntitlementValue(void *a1, const char *a2, ...)
{
  return [a1 publicEntitlementValue];
}

id objc_msgSend_remoteInterface(void *a1, const char *a2, ...)
{
  return [a1 remoteInterface];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_sensor(void *a1, const char *a2, ...)
{
  return [a1 sensor];
}

id objc_msgSend_sensorConfiguration(void *a1, const char *a2, ...)
{
  return [a1 sensorConfiguration];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return [a1 serviceName];
}

id objc_msgSend_setupConnection(void *a1, const char *a2, ...)
{
  return [a1 setupConnection];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_to(void *a1, const char *a2, ...)
{
  return [a1 to];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_verifyPayloadForCursor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "verifyPayloadForCursor:");
}