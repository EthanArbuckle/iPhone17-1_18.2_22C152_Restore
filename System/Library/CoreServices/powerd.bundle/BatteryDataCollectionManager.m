@interface BatteryDataCollectionManager
- (BatteryDataCollectionManager)init;
- (void)dealloc;
- (void)start;
- (void)stop;
- (void)systemTimeChanged;
@end

@implementation BatteryDataCollectionManager

- (BatteryDataCollectionManager)init
{
  v79.receiver = self;
  v79.super_class = (Class)BatteryDataCollectionManager;
  v2 = [(BatteryDataCollectionManager *)&v79 init];
  if (!v2)
  {
    v28 = qword_1000A3508;
    if (os_log_type_enabled((os_log_t)qword_1000A3508, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Super init failed", buf, 2u);
    }
    return 0;
  }
  v71 = v2;
  qword_1000A4808 = (uint64_t)objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", &off_10009AAF0, @"ChemID", &off_10009AB08, @"AlgoChemID", &off_10009AB20, @"Serial", &off_10009AB38, @"WeightedRa", &off_10009AB50, @"Qmax", &off_10009AB68, @"CycleCount", &off_10009AB80, @"ISS", &off_10009AB98, @"RaTableRaw", &off_10009ABB0,
                               @"CellVoltage",
                               &off_10009ABC8,
                               @"PresentDOD",
                               &off_10009ABE0,
                               @"Voltage",
                               &off_10009ABF8,
                               @"StateOfCharge",
                               &off_10009AC10,
                               @"ChargeAccum",
                               &off_10009AC28,
                               @"ResScale",
                               &off_10009AC40,
                               @"RSS",
                               &off_10009AC58,
                               @"ITMiscStatus",
                               &off_10009AC70,
                               @"MiscStatus",
                               &off_10009AC88,
                               @"TimeAtHighSoc",
                               &off_10009ACA0,
                               @"LowVoltageResidencyCounters",
                               &off_10009ACB8,
                               @"TotalOperatingTime",
                               &off_10009ACD0,
                               @"ChargingVoltage",
                               &off_10009ACE8,
                               @"VacVoltageLimit",
                               &off_10009AD00,
                               @"NotChargingReason",
                               &off_10009AD18,
                               @"AccumulatedSystemPowerIn",
                               &off_10009AD30,
                               @"AccumulatedSystemLoad",
                               &off_10009AD48,
                               @"SystemVoltageIn",
                               &off_10009AD60,
                               @"SystemCurrentIn",
                               &off_10009AD78,
                               @"FamilyCode",
                               &off_10009AD90,
                               @"Watts",
                               &__NSArray0__struct,
                               @"Temperature",
                               &__NSArray0__struct);
  qword_1000A4810 = (uint64_t)objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", @"Qmax", @"PresentDOD", @"CellVoltage", @"RaTableRaw", 0);
  id v69 = objc_alloc((Class)NSDictionary);
  v140[0] = +[NSNull null];
  v140[1] = +[NSNull null];
  *(void *)v141 = +[NSArray arrayWithObjects:v140 count:2];
  v139[0] = +[NSNull null];
  v139[1] = +[NSNull null];
  v142 = +[NSArray arrayWithObjects:v139 count:2];
  v138[0] = +[NSNull null];
  v138[1] = +[NSNull null];
  v143 = +[NSArray arrayWithObjects:v138 count:2];
  v68 = +[NSArray arrayWithObjects:v141 count:3];
  v136[0] = @"DailyCollectionPeriodOverride_ms";
  v136[1] = &off_10009A5D8;
  v137[0] = +[NSArray arrayWithObjects:v136 count:2];
  v135[0] = @"DailyRetentionPeriodOverride_s";
  v135[1] = &off_10009A5F0;
  v137[1] = +[NSArray arrayWithObjects:v135 count:2];
  v134[0] = @"DailyCollationPeriodOverride_s";
  v134[1] = &off_10009A608;
  v137[2] = +[NSArray arrayWithObjects:v134 count:2];
  v3 = +[NSArray arrayWithObjects:v137 count:3];
  v132[0] = @"WeeklyCollectionPeriodOverride_ms";
  v132[1] = &off_10009A620;
  v133[0] = +[NSArray arrayWithObjects:v132 count:2];
  v131[0] = @"WeeklyRetentionPeriodOverride_s";
  v131[1] = &off_10009A5F0;
  v133[1] = +[NSArray arrayWithObjects:v131 count:2];
  v130[0] = @"WeeklyCollationPeriodOverride_s";
  v130[1] = &off_10009A608;
  v133[2] = +[NSArray arrayWithObjects:v130 count:2];
  v4 = +[NSArray arrayWithObjects:v133 count:3];
  v128[0] = @"SBCCollectionPeriodOverride_ms";
  v128[1] = &off_10009A638;
  v129[0] = +[NSArray arrayWithObjects:v128 count:2];
  v127[0] = @"SBCRetentionPeriodOverride_s";
  v127[1] = &off_10009A650;
  v129[1] = +[NSArray arrayWithObjects:v127 count:2];
  v126[0] = @"SBCCollationPeriodOverride_s";
  v126[1] = &off_10009A668;
  v129[2] = +[NSArray arrayWithObjects:v126 count:2];
  v5 = +[NSArray arrayWithObjects:v129 count:3];
  v124[0] = +[NSNull null];
  v124[1] = +[NSNull null];
  v125[0] = +[NSArray arrayWithObjects:v124 count:2];
  v123[0] = @"OBCRetentionPeriodOverride_s";
  v123[1] = &off_10009A650;
  v125[1] = +[NSArray arrayWithObjects:v123 count:2];
  v122[0] = @"OBCCollationPeriodOverride_s";
  v122[1] = &off_10009A608;
  v125[2] = +[NSArray arrayWithObjects:v122 count:2];
  v6 = +[NSArray arrayWithObjects:v125 count:3];
  v120[0] = @"AMACollectionPeriodOverride_ms";
  v120[1] = &off_10009A638;
  v121[0] = +[NSArray arrayWithObjects:v120 count:2];
  v119[0] = +[NSNull null];
  v119[1] = +[NSNull null];
  v121[1] = +[NSArray arrayWithObjects:v119 count:2];
  v118[0] = +[NSNull null];
  v118[1] = +[NSNull null];
  v121[2] = +[NSArray arrayWithObjects:v118 count:2];
  v7 = +[NSArray arrayWithObjects:v121 count:3];
  v116[0] = +[NSNull null];
  v116[1] = +[NSNull null];
  v117[0] = +[NSArray arrayWithObjects:v116 count:2];
  v115[0] = @"SmartChargingRetentionPeriodOverride_s";
  v115[1] = &off_10009A650;
  v117[1] = +[NSArray arrayWithObjects:v115 count:2];
  v114[0] = @"SmartChargingCollationPeriodOverride_s";
  v114[1] = &off_10009A608;
  v117[2] = +[NSArray arrayWithObjects:v114 count:2];
  qword_1000A4818 = (uint64_t)objc_msgSend(v69, "initWithObjectsAndKeys:", v68, @"BDC_Once", v3, @"BDC_Daily", v4, @"BDC_Weekly", v5, @"BDC_SBC", v6, @"BDC_OBC", v7, @"BDC_AMA", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v117, 3),
                               @"BDC_SmartCharging",
                               0);
  id v8 = objc_alloc((Class)NSDictionary);
  v113[0] = @"PruningPeriodOverride_s";
  v113[1] = &off_10009A680;
  v9 = +[NSArray arrayWithObjects:v113 count:2];
  v112[0] = @"FormatVersionOverride";
  v112[1] = @"2.9";
  v10 = +[NSArray arrayWithObjects:v112 count:2];
  v111[0] = @"DataStoragePathOverride";
  v111[1] = @"/var/db/Battery/BDC";
  v11 = +[NSArray arrayWithObjects:v111 count:2];
  v110[0] = @"TotalDataSizeUpperBoundOverride_kB";
  v110[1] = &off_10009A698;
  qword_1000A4820 = (uint64_t)objc_msgSend(v8, "initWithObjectsAndKeys:", v9, @"BDC_Pruning_Period", v10, @"BDC_Data_Format_Version", v11, @"BDC_Data_Storage_Path", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v110, 2), @"TotalDataSizeUpperBound", 0);
  qword_1000A47E8 = (uint64_t)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.powerd.bdc"];
  v13 = dlopen("/System/Library/PrivateFrameworks/CoreTime.framework/CoreTime", 2);
  qword_1000A47F8 = (uint64_t)v13;
  if (v13)
  {
    off_1000A4800 = dlsym(v13, "TMGetKernelMonotonicClock");
    if (off_1000A4800)
    {
      [(id)qword_1000A47E8 doubleForKey:@"ReferenceRTCTicks"];
      double v15 = v14;
      id v16 = [(id)qword_1000A47E8 objectForKey:@"ReferenceWalltime"];
      if (v15 == 0.0 || !v16)
      {
        v29 = qword_1000A3508;
        if (os_log_type_enabled((os_log_t)qword_1000A3508, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Reference clock unavailable. Creating new reference", buf, 2u);
        }
        sub_1000255B8();
        double v31 = v30;
        v32 = +[NSDate now];
        [(id)qword_1000A47E8 setDouble:@"ReferenceRTCTicks" forKey:v31];
        [(id)qword_1000A47E8 setDouble:@"LastKnownRTCTicks" forKey:v31];
        [(id)qword_1000A47E8 setObject:v32 forKey:@"ReferenceWalltime"];
        [(id)qword_1000A47E8 setObject:v32 forKey:@"LastKnownWalltime"];
        [(id)qword_1000A47E8 setDouble:@"RTCTicksDelta" forKey:0.0];
      }
      else
      {
        sub_1000255B8();
        double v18 = v17;
        [(id)qword_1000A47E8 doubleForKey:@"LastKnownRTCTicks"];
        double v20 = v19;
        id v21 = [(id)qword_1000A47E8 objectForKey:@"LastKnownWalltime"];
        v22 = +[NSDate now];
        if (v20 <= 0.0) {
          [(id)qword_1000A47E8 setDouble:@"LastKnownRTCTicks" forKey:v18];
        }
        if (v18 < v20)
        {
          [(id)qword_1000A47E8 doubleForKey:@"RTCTicksDelta"];
          double v24 = v23;
          double v25 = v20 - v18 + v23;
          [v21 timeIntervalSinceDate:v22];
          double v27 = v26;
          if (v26 <= 0.0)
          {
            if (v26 < 0.0) {
              double v25 = v25 - v26;
            }
          }
          else
          {
            if (os_log_type_enabled((os_log_t)qword_1000A3508, OS_LOG_TYPE_ERROR)) {
              sub_100066854();
            }
            [(id)qword_1000A47E8 setBool:1 forKey:@"NeedSystemTimeUpdate"];
          }
          [(id)qword_1000A47E8 setDouble:@"RTCTicksDelta" forKey:v25];
          [(id)qword_1000A47E8 setDouble:@"LastKnownRTCTicks" forKey:v18];
          v33 = qword_1000A3508;
          if (os_log_type_enabled((os_log_t)qword_1000A3508, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134219264;
            *(double *)&buf[4] = v18;
            *(_WORD *)&buf[12] = 2048;
            *(double *)&buf[14] = v15;
            *(_WORD *)&buf[22] = 2048;
            double v104 = v20;
            *(_WORD *)v105 = 2048;
            *(double *)&v105[2] = v24;
            __int16 v106 = 2048;
            double v107 = v25;
            __int16 v108 = 2048;
            double v109 = v27;
            _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "RTC reset detected. Current ticks %lf < saved ticks %lf. Last known ticks %lf, old delta %lf, new delta %lf, seconds lost since power off %lf", buf, 0x3Eu);
          }
        }
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1000A3508, OS_LOG_TYPE_ERROR))
    {
      sub_100066820();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000A3508, OS_LOG_TYPE_ERROR))
  {
    sub_1000667EC();
  }
  if ([(id)qword_1000A47E8 objectForKey:@"bdcEnableOverride"])
  {
    unsigned int v34 = [(id)qword_1000A47E8 BOOLForKey:@"bdcEnableOverride"];
    v35 = qword_1000A3508;
    if (os_log_type_enabled((os_log_t)qword_1000A3508, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v34;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "bdcEnable override %d", buf, 8u);
      if ((v34 & 1) == 0)
      {
        v35 = qword_1000A3508;
        goto LABEL_78;
      }
    }
    else if ((v34 & 1) == 0)
    {
LABEL_78:
      v38 = v71;
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v67 = "Feature disabled";
        goto LABEL_80;
      }
      goto LABEL_46;
    }
  }
  v36 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v37 = dispatch_queue_create("BDCManagerQueue", v36);
  v38 = v71;
  v71->_managerQueue = (OS_dispatch_queue *)v37;
  if (!v37)
  {
    v35 = qword_1000A3508;
    if (os_log_type_enabled((os_log_t)qword_1000A3508, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v67 = "Manager queue alloc failed";
LABEL_80:
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, v67, buf, 2u);
    }
LABEL_46:

    return 0;
  }
  if ((objc_msgSend(objc_msgSend((id)qword_1000A47E8, "stringForKey:"), "isEqualToString:", @"2.9") & 1) == 0) {
    [(id)qword_1000A47E8 setObject:@"2.9" forKey:@"DataFormatVersion"];
  }
  v40 = (void *)sub_10002E9B8();
  if (!v40 || (v41 = v40, ![v40 length]))
  {
    v45 = qword_1000A3508;
    if (!os_log_type_enabled((os_log_t)qword_1000A3508, OS_LOG_TYPE_DEFAULT))
    {
LABEL_45:
      goto LABEL_46;
    }
    *(_WORD *)buf = 0;
    v46 = "NULL serial number returned by BTR";
LABEL_44:
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, v46, buf, 2u);
    goto LABEL_45;
  }
  id v42 = [(id)qword_1000A47E8 stringForKey:@"BatterySerialNumber"];
  if (v42)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)qword_1000A3508, OS_LOG_TYPE_ERROR)) {
        sub_1000667B8();
      }
      goto LABEL_50;
    }
  }
  if ([v42 isEqualToString:v41])
  {
LABEL_50:
    uint64_t v44 = 0;
    goto LABEL_51;
  }
  [(id)qword_1000A47E8 setObject:v41 forKey:@"BatterySerialNumber"];
  v43 = qword_1000A3508;
  if (os_log_type_enabled((os_log_t)qword_1000A3508, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Battery change detected", buf, 2u);
  }
  uint64_t v44 = 1;
LABEL_51:
  uint64_t v47 = objc_opt_new();
  v71->_agents = (NSMutableArray *)v47;
  if (!v47)
  {
    v45 = qword_1000A3508;
    if (!os_log_type_enabled((os_log_t)qword_1000A3508, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_45;
    }
    *(_WORD *)buf = 0;
    v46 = "Agent alloc failed";
    goto LABEL_44;
  }
  v70 = v39;
  v101[0] = @"BDC_Once";
  v100[0] = @"DataGroupName";
  v100[1] = @"DataFilePath";
  v101[1] = sub_100023DD4(@"BDC_Data_Storage_Path", 3u);
  v100[2] = @"DataFormatVersion";
  v101[2] = sub_100023DD4(@"BDC_Data_Format_Version", 3u);
  v100[3] = @"DataCollectionPeriod";
  v101[3] = sub_100023DD4(@"BDC_Once", 0);
  v100[4] = @"DataRetentionPeriod";
  v101[4] = sub_100023DD4(@"BDC_Once", 1u);
  v100[5] = @"DataCollationPeriod";
  v101[5] = sub_100023DD4(@"BDC_Once", 2u);
  v100[6] = @"BatteryChanged";
  v101[6] = +[NSNumber numberWithBool:v44];
  v101[7] = &__kCFBooleanTrue;
  v100[7] = @"DataCollectionOnce";
  v100[8] = @"DataNeverPrune";
  v101[8] = &__kCFBooleanTrue;
  v99[0] = @"ChemID";
  v99[1] = @"AlgoChemID";
  v100[9] = @"DataColumnNames";
  v99[2] = @"EEEE";
  v99[3] = @"YWW";
  v99[4] = @"DesignCapacity";
  v99[5] = @"GasGaugeFirmwareVersion";
  v101[9] = +[NSArray arrayWithObjects:v99 count:6];
  v102[0] = +[NSDictionary dictionaryWithObjects:v101 forKeys:v100 count:10];
  v98[0] = @"BDC_Daily";
  v97[0] = @"DataGroupName";
  v97[1] = @"DataFilePath";
  v98[1] = sub_100023DD4(@"BDC_Data_Storage_Path", 3u);
  v97[2] = @"DataFormatVersion";
  v98[2] = sub_100023DD4(@"BDC_Data_Format_Version", 3u);
  v97[3] = @"DataCollectionPeriod";
  v98[3] = sub_100023DD4(@"BDC_Daily", 0);
  v97[4] = @"DataRetentionPeriod";
  v98[4] = sub_100023DD4(@"BDC_Daily", 1u);
  v97[5] = @"DataCollationPeriod";
  v98[5] = sub_100023DD4(@"BDC_Daily", 2u);
  v97[6] = @"BatteryChanged";
  v98[6] = +[NSNumber numberWithBool:v44];
  v97[7] = @"DataColumnNames";
  v96[0] = @"WeightedRa";
  v96[1] = @"Qmax";
  v96[2] = @"CycleCount";
  v96[3] = @"NominalChargeCapacity";
  v96[4] = @"TimeAtHighSoc";
  v96[5] = @"ChargingVoltage";
  v96[6] = @"BHServiceFlags";
  v96[7] = @"BHCalibrationFlags";
  v96[8] = @"MaxCapacityPercent";
  v98[7] = +[NSArray arrayWithObjects:v96 count:9];
  v102[1] = +[NSDictionary dictionaryWithObjects:v98 forKeys:v97 count:8];
  v95[0] = @"BDC_Weekly";
  v94[0] = @"DataGroupName";
  v94[1] = @"DataFilePath";
  v95[1] = sub_100023DD4(@"BDC_Data_Storage_Path", 3u);
  v94[2] = @"DataFormatVersion";
  v95[2] = sub_100023DD4(@"BDC_Data_Format_Version", 3u);
  v94[3] = @"DataCollectionPeriod";
  v95[3] = sub_100023DD4(@"BDC_Weekly", 0);
  v94[4] = @"DataRetentionPeriod";
  v95[4] = sub_100023DD4(@"BDC_Weekly", 1u);
  v94[5] = @"DataCollationPeriod";
  v95[5] = sub_100023DD4(@"BDC_Weekly", 2u);
  v94[6] = @"BatteryChanged";
  v95[6] = +[NSNumber numberWithBool:v44];
  v94[7] = @"DataColumnNames";
  v93[0] = @"RaTableRaw";
  v93[1] = @"TotalOperatingTime";
  v93[2] = @"GasGaugeFirmwareVersion";
  v93[3] = @"LowVoltageResidencyCounters";
  v93[4] = @"BatteryAuth";
  v95[7] = +[NSArray arrayWithObjects:v93 count:5];
  v102[2] = +[NSDictionary dictionaryWithObjects:v95 forKeys:v94 count:8];
  v92[0] = @"BDC_SBC";
  v91[0] = @"DataGroupName";
  v91[1] = @"DataFilePath";
  v92[1] = sub_100023DD4(@"BDC_Data_Storage_Path", 3u);
  v91[2] = @"DataFormatVersion";
  v92[2] = sub_100023DD4(@"BDC_Data_Format_Version", 3u);
  v91[3] = @"DataCollectionPeriod";
  v92[3] = sub_100023DD4(@"BDC_SBC", 0);
  v91[4] = @"DataRetentionPeriod";
  v92[4] = sub_100023DD4(@"BDC_SBC", 1u);
  v91[5] = @"DataCollationPeriod";
  v92[5] = sub_100023DD4(@"BDC_SBC", 2u);
  v91[6] = @"BatteryChanged";
  v92[6] = +[NSNumber numberWithBool:v44];
  v92[7] = &__kCFBooleanTrue;
  v91[7] = @"DataCollectionAtSBC";
  v91[8] = @"DataColumnNames";
  v90[0] = @"PresentDOD";
  v90[1] = @"CurrentCapacity";
  v90[2] = @"IsCharging";
  v90[3] = @"Temperature";
  v90[4] = @"Amperage";
  v90[5] = @"InstantAmperage";
  v90[6] = @"Voltage";
  v90[7] = @"StateOfCharge";
  v90[8] = @"ChargeAccum";
  v90[9] = @"ResScale";
  v90[10] = @"RSS";
  v90[11] = @"ITMiscStatus";
  v90[12] = @"AccumulatedSystemLoad";
  v90[13] = @"AccumulatedSystemPowerIn";
  v90[14] = @"VirtualTemperature";
  v90[15] = @"SystemVoltageIn";
  v90[16] = @"SystemCurrentIn";
  v90[17] = @"Watts";
  v92[8] = +[NSArray arrayWithObjects:v90 count:18];
  v102[3] = +[NSDictionary dictionaryWithObjects:v92 forKeys:v91 count:9];
  v89[0] = @"BDC_OBC";
  v88[0] = @"DataGroupName";
  v88[1] = @"DataFilePath";
  v89[1] = sub_100023DD4(@"BDC_Data_Storage_Path", 3u);
  v88[2] = @"DataFormatVersion";
  v89[2] = sub_100023DD4(@"BDC_Data_Format_Version", 3u);
  v88[3] = @"DataCollectionPeriod";
  v89[3] = sub_100023DD4(@"BDC_OBC", 0);
  v88[4] = @"DataRetentionPeriod";
  v89[4] = sub_100023DD4(@"BDC_OBC", 1u);
  v88[5] = @"DataCollationPeriod";
  v89[5] = sub_100023DD4(@"BDC_OBC", 2u);
  v88[6] = @"BatteryChanged";
  v89[6] = +[NSNumber numberWithBool:v44];
  v89[7] = &__kCFBooleanTrue;
  v88[7] = @"DataCollectAtPowerSourceChange";
  v88[8] = @"DataColumnNames";
  v87[0] = @"FamilyCode";
  v87[1] = @"ExternalConnected";
  v87[2] = @"AppleRawExternalConnected";
  v87[3] = @"ChargingOverride";
  v87[4] = @"NotChargingReason";
  v87[5] = @"VacVoltageLimit";
  v89[8] = +[NSArray arrayWithObjects:v87 count:6];
  v102[4] = +[NSDictionary dictionaryWithObjects:v89 forKeys:v88 count:9];
  v86[0] = @"BDC_AMA";
  v85[0] = @"DataGroupName";
  v85[1] = @"DataFilePath";
  v86[1] = sub_100023DD4(@"BDC_Data_Storage_Path", 3u);
  v85[2] = @"DataFormatVersion";
  v86[2] = sub_100023DD4(@"BDC_Data_Format_Version", 3u);
  v85[3] = @"DataCollectionPeriod";
  v86[3] = sub_100023DD4(@"BDC_AMA", 0);
  v85[4] = @"DataRetentionPeriod";
  v86[4] = sub_100023DD4(@"BDC_AMA", 1u);
  v85[5] = @"DataCollationPeriod";
  v86[5] = sub_100023DD4(@"BDC_AMA", 2u);
  v85[6] = @"BatteryChanged";
  v86[6] = +[NSNumber numberWithBool:v44];
  v86[7] = &__kCFBooleanTrue;
  v85[7] = @"SkipCSVUsePowerlog";
  v85[8] = @"useBTM";
  v86[8] = &__kCFBooleanTrue;
  v85[9] = @"DataColumnNames";
  v84[0] = @"Voltage";
  v84[1] = @"InstantAmperage";
  v84[2] = @"ChargeAccum";
  v84[3] = @"PresentDOD";
  v84[4] = @"AlgoTemperature";
  v84[5] = @"VirtualTemperature";
  v86[9] = +[NSArray arrayWithObjects:v84 count:6];
  v102[5] = +[NSDictionary dictionaryWithObjects:v86 forKeys:v85 count:10];
  v83[0] = @"BDC_SmartCharging";
  v82[0] = @"DataGroupName";
  v82[1] = @"DataFilePath";
  v83[1] = sub_100023DD4(@"BDC_Data_Storage_Path", 3u);
  v82[2] = @"DataFormatVersion";
  v83[2] = sub_100023DD4(@"BDC_Data_Format_Version", 3u);
  v82[3] = @"DataCollectionPeriod";
  v83[3] = sub_100023DD4(@"BDC_SmartCharging", 0);
  v82[4] = @"DataRetentionPeriod";
  v83[4] = sub_100023DD4(@"BDC_SmartCharging", 1u);
  v82[5] = @"DataCollationPeriod";
  v83[5] = sub_100023DD4(@"BDC_SmartCharging", 2u);
  v82[6] = @"BatteryChanged";
  v83[6] = +[NSNumber numberWithBool:v44];
  v83[7] = &__kCFBooleanTrue;
  v82[7] = @"useSC";
  v82[8] = @"DataColumnNames";
  v81[0] = @"ChargingState";
  v81[1] = @"InflowState";
  v81[2] = @"ChargeLimit";
  v81[3] = @"CheckPoint";
  v81[4] = @"DecisionMaker";
  v81[5] = @"ModeOfOperation";
  v83[8] = +[NSArray arrayWithObjects:v81 count:6];
  v102[6] = +[NSDictionary dictionaryWithObjects:v83 forKeys:v82 count:9];
  v48 = +[NSArray arrayWithObjects:v102 count:7];
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v49 = [(NSArray *)v48 countByEnumeratingWithState:&v75 objects:v80 count:16];
  if (v49)
  {
    id v50 = v49;
    uint64_t v51 = *(void *)v76;
    do
    {
      for (i = 0; i != v50; i = (char *)i + 1)
      {
        if (*(void *)v76 != v51) {
          objc_enumerationMutation(v48);
        }
        v53 = *(void **)(*((void *)&v75 + 1) + 8 * i);
        v54 = &stru_100091F28;
        if ((objc_msgSend(objc_msgSend(v53, "objectForKeyedSubscript:", @"useBTM"), "BOOLValue") & 1) == 0)
        {
          if (objc_msgSend(objc_msgSend(v53, "objectForKeyedSubscript:", @"useSC"), "BOOLValue")) {
            v54 = &stru_100091F48;
          }
          else {
            v54 = &stru_100091F90;
          }
        }
        v55 = [[BatteryDataCollectionAgent alloc] initWithParams:v53 collectionBlock:v54];
        if (v55)
        {
          v56 = v55;
          [(NSMutableArray *)v71->_agents addObject:v55];
        }
      }
      id v50 = [(NSArray *)v48 countByEnumeratingWithState:&v75 objects:v80 count:16];
    }
    while (v50);
  }
  +[NSError _setFileNameLocalizationEnabled:0];
  v38 = v71;
  dispatch_async((dispatch_queue_t)v71->_managerQueue, &stru_100091D18);
  int out_token = 0;
  notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &out_token, (dispatch_queue_t)v71->_managerQueue, &stru_100091D38);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000241AC;
  handler[3] = &unk_100091DC8;
  handler[4] = v71;
  uint64_t v72 = 0;
  v57 = sub_100023DD4(@"BDC_Data_Storage_Path", 3u);
  unsigned __int8 v58 = [+[NSFileManager defaultManager] createDirectoryAtPath:v57 withIntermediateDirectories:1 attributes:0 error:&v72];
  v59 = qword_1000A3508;
  if ((v58 & 1) == 0)
  {
    v39 = v70;
    if (os_log_type_enabled((os_log_t)qword_1000A3508, OS_LOG_TYPE_ERROR)) {
      sub_100066750();
    }
    goto LABEL_45;
  }
  v39 = v70;
  if (os_log_type_enabled((os_log_t)qword_1000A3508, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v57;
    _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "BDC data path %@", buf, 0xCu);
  }
  dispatch_source_t v60 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)v71->_managerQueue);
  v71->_pruningTimer = (OS_dispatch_source *)v60;
  if (!v60)
  {
    if (os_log_type_enabled((os_log_t)qword_1000A3508, OS_LOG_TYPE_ERROR)) {
      sub_1000666B4();
    }
    goto LABEL_45;
  }
  signed int v61 = [(NSNull *)sub_100023DD4(@"BDC_Pruning_Period", 3u) intValue];
  dispatch_source_set_event_handler((dispatch_source_t)v71->_pruningTimer, handler);
  pruningTimer = v71->_pruningTimer;
  dispatch_time_t v63 = dispatch_time(0x8000000000000000, 1000);
  dispatch_source_set_timer(pruningTimer, v63, 1000000000 * v61, 0xF4240uLL);
  v64 = qword_1000A3508;
  if (os_log_type_enabled((os_log_t)qword_1000A3508, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v61;
    _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "Pruning timer %d s", buf, 8u);
  }
  [+[NSNotificationCenter defaultCenter] addObserver:v71 selector:"systemTimeChanged" name:NSSystemClockDidChangeNotification object:0];
  managerQueue = v71->_managerQueue;
  v141[0] = -1;
  *(void *)buf = _NSConcreteStackBlock;
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = sub_100029270;
  double v104 = COERCE_DOUBLE(&unk_100091FB0);
  *(_DWORD *)v105 = 0;
  if (notify_register_dispatch("com.apple.powerd.bdc.get_current_time", v141, managerQueue, buf)
    && os_log_type_enabled((os_log_t)qword_1000A3508, OS_LOG_TYPE_ERROR))
  {
    sub_1000666E8();
  }
  return v38;
}

- (void)dealloc
{
  managerQueue = self->_managerQueue;
  if (managerQueue) {
    dispatch_release((dispatch_object_t)managerQueue);
  }
  pruningTimer = self->_pruningTimer;
  if (pruningTimer)
  {
    dispatch_source_cancel(pruningTimer);
    dispatch_release((dispatch_object_t)self->_pruningTimer);
  }

  if (qword_1000A47F8) {
    dlclose((void *)qword_1000A47F8);
  }
  qword_1000A47F8 = 0;

  qword_1000A47E8 = 0;
  qword_1000A4820 = 0;

  qword_1000A4818 = 0;
  qword_1000A4808 = 0;

  qword_1000A4810 = 0;
  v5.receiver = self;
  v5.super_class = (Class)BatteryDataCollectionManager;
  [(BatteryDataCollectionManager *)&v5 dealloc];
}

- (void)start
{
  managerQueue = self->_managerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100024EA4;
  block[3] = &unk_100091DC8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)managerQueue, block);
}

- (void)stop
{
  managerQueue = self->_managerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025050;
  block[3] = &unk_100091DC8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)managerQueue, block);
}

- (void)systemTimeChanged
{
  v2 = +[NSDate now];
  sub_1000255B8();
  double v4 = v3;
  [(id)qword_1000A47E8 doubleForKey:@"ReferenceRTCTicks"];
  double v6 = v5;
  id v7 = [(id)qword_1000A47E8 objectForKey:@"ReferenceWalltime"];
  id v8 = qword_1000A3508;
  if (os_log_type_enabled((os_log_t)qword_1000A3508, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v2;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Current time %@", buf, 0xCu);
  }
  if (v6 == 0.0 || v7 == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_1000A3508, OS_LOG_TYPE_ERROR)) {
      sub_100066D90();
    }
  }
  else
  {
    [(NSDate *)v2 timeIntervalSinceDate:v7];
    if (v10 < 0.0) {
      return;
    }
    v11 = (void *)qword_1000A47E8;
    objc_sync_enter((id)qword_1000A47E8);
    if (![(id)qword_1000A47E8 BOOLForKey:@"NeedSystemTimeUpdate"])
    {
      objc_sync_exit(v11);
      return;
    }
    [(id)qword_1000A47E8 doubleForKey:@"RTCTicksDelta"];
    double v13 = v12;
    [(NSDate *)v2 timeIntervalSinceDate:sub_100021BA0()];
    double v15 = v14;
    if (v14 <= 0.0)
    {
      if (os_log_type_enabled((os_log_t)qword_1000A3508, OS_LOG_TYPE_ERROR)) {
        sub_100066D28();
      }
    }
    else
    {
      [(id)qword_1000A47E8 setDouble:@"RTCTicksDelta" forKey:v13 + v14];
      [(id)qword_1000A47E8 setObject:v2 forKey:@"LastKnownWalltime"];
      [(id)qword_1000A47E8 setDouble:@"LastKnownRTCTicks" forKey:v4];
      [(id)qword_1000A47E8 setBool:0 forKey:@"NeedSystemTimeUpdate"];
      id v16 = qword_1000A3508;
      if (os_log_type_enabled((os_log_t)qword_1000A3508, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413314;
        *(void *)&buf[4] = v2;
        __int16 v21 = 2048;
        double v22 = v13;
        __int16 v23 = 2048;
        double v24 = v13 + v15;
        __int16 v25 = 2048;
        double v26 = v15;
        __int16 v27 = 2048;
        double v28 = v4;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Updating last known wall time to %@, old delta to %lf, new delta %lf, seconds lost %lf, last known rtc ticks %lf", buf, 0x34u);
      }
    }
    objc_sync_exit(v11);
    *(void *)buf = 0;
    double v17 = sub_100023DD4(@"BDC_Data_Storage_Path", 3u);
    id v18 = [(NSNull *)v17 stringByAppendingFormat:@"/%@_version%@.csv", @"BDC_Timestamps", @"1.0"];
    if ([+[NSFileManager defaultManager] fileExistsAtPath:v18])
    {
      goto LABEL_22;
    }
    if ([+[NSFileManager defaultManager] createDirectoryAtPath:v17 withIntermediateDirectories:1 attributes:0 error:buf])
    {
      if ([+[NSFileManager defaultManager] createFileAtPath:v18 contents:0 attributes:0])
      {
        [@"reference_rtc_ticks,reference_system_time,current_rtc_ticks,set_system_time\n" writeToFile:v18 atomically:1 encoding:4 error:0];
LABEL_22:
        double v19 = +[NSFileHandle fileHandleForWritingAtPath:v18];
        [(NSFileHandle *)v19 seekToEndOfFile];
        -[NSFileHandle writeData:error:](v19, "writeData:error:", -[NSString dataUsingEncoding:](+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%f,%@,%f,%@\n", *(void *)&v6, [v7 description], *(void *)&v4, -[NSDate description](v2, "description")), "dataUsingEncoding:", 4), 0);
        [(NSFileHandle *)v19 closeFile];
        return;
      }
      if (os_log_type_enabled((os_log_t)qword_1000A3508, OS_LOG_TYPE_ERROR)) {
        sub_100066C58();
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1000A3508, OS_LOG_TYPE_ERROR))
    {
      sub_100066CC0();
    }
  }
}

@end