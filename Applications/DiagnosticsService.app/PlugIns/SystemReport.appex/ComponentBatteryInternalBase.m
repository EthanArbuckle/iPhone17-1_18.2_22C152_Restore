@interface ComponentBatteryInternalBase
- (BOOL)authPassed;
- (BOOL)hasSMC;
- (BOOL)isPresent;
- (BOOL)isTrusted;
- (id)_chargerNodeProperties;
- (id)_encodeDataInArray:(id)a3;
- (id)_encodeDataInDictionary:(id)a3;
- (id)_encodeDataInObject:(id)a3;
- (id)_nodePropertiesForServiceMatching:(id)a3 extraKey:(id)a4;
- (id)_pmuNodeProperties;
- (id)_powerSourceNodeProperties;
- (id)_stringToSInt16Array:(id)a3 separatedByString:(id)a4;
- (id)batteryLevel;
- (id)fbsn;
- (id)fdrValidationStatus;
- (id)generateBatteryConfig;
- (id)generateMaxMinAvgCapacity;
- (id)generateMitigationState;
- (id)generateTemperatureData;
- (id)generateUPOStepper;
- (id)getGasGaugeData;
- (id)integerNumberWithNumber:(id)a3;
- (id)isBatteryCharging;
- (id)isPowerConnected;
- (id)kioskMode;
- (id)serialNumber;
- (id)upoCount;
- (void)addCycleCountHistoryToDictionary:(id)a3;
- (void)addDateOfManufactureAndFirstUseToDictionary:(id)a3;
- (void)addHeatMapToDictionary:(id)a3;
- (void)addInductiveChargingParametersToDictionary:(id)a3;
- (void)addRawRaDataToDictionary:(id)a3;
- (void)addWirelessChargingModeToDictionary:(id)a3;
- (void)populateAttributes:(id)a3;
@end

@implementation ComponentBatteryInternalBase

- (BOOL)isPresent
{
  v2 = [(ComponentBatteryInternalBase *)self serialNumber];
  BOOL valid = isValidSerialNumber(v2);

  return valid;
}

- (void)populateAttributes:(id)a3
{
  id v4 = a3;
  v5 = [(ComponentBatteryInternalBase *)self serialNumber];
  [v4 setObject:v5 forKeyedSubscript:@"serialNumber"];

  v6 = [(ComponentBatteryInternalBase *)self getGasGaugeData];
  [v4 addEntriesFromDictionary:v6];

  [(ComponentBatteryInternalBase *)self addRawRaDataToDictionary:v4];
  if ([(ComponentBatteryInternalBase *)self hasSMC])
  {
    [(ComponentBatteryInternalBase *)self addCycleCountHistoryToDictionary:v4];
    [(ComponentBatteryInternalBase *)self addHeatMapToDictionary:v4];
  }
  else
  {
    v7 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "SMC not found, skipping heat map and cycle count history.", v15, 2u);
    }
  }
  [(ComponentBatteryInternalBase *)self addInductiveChargingParametersToDictionary:v4];
  [(ComponentBatteryInternalBase *)self addDateOfManufactureAndFirstUseToDictionary:v4];
  v8 = [(ComponentBatteryInternalBase *)self isBatteryCharging];
  unsigned int v9 = [v8 BOOLValue];

  if (v9) {
    [(ComponentBatteryInternalBase *)self addWirelessChargingModeToDictionary:v4];
  }
  v10 = [(ComponentBatteryInternalBase *)self isBatteryCharging];
  [v4 setObject:v10 forKeyedSubscript:@"isBatteryCharging"];

  v11 = [(ComponentBatteryInternalBase *)self batteryLevel];
  [v4 setObject:v11 forKeyedSubscript:@"currentBatteryLevel"];

  v12 = [(ComponentBatteryInternalBase *)self isPowerConnected];
  [v4 setObject:v12 forKeyedSubscript:@"isExternalPowerConnected"];

  v13 = [(ComponentBatteryInternalBase *)self upoCount];
  [v4 setObject:v13 forKeyedSubscript:@"upoCount"];

  v14 = [(ComponentBatteryInternalBase *)self kioskMode];
  [v4 setObject:v14 forKeyedSubscript:@"kioskMode"];
}

- (void)addWirelessChargingModeToDictionary:(id)a3
{
  id v8 = a3;
  CFDictionaryRef v3 = IOPSCopyExternalPowerAdapterDetails();
  CFDictionaryRef v4 = v3;
  if (v3)
  {
    v5 = [(__CFDictionary *)v3 objectForKeyedSubscript:@"IsWireless"];
    v6 = v5;
    if (v5)
    {
      v7 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 BOOLValue]);
      [v8 setObject:v7 forKey:@"isChargingWireless"];
    }
  }
}

- (id)batteryLevel
{
  v2 = (void *)MGCopyAnswer();
  CFDictionaryRef v3 = [v2 stringValue];
  CFDictionaryRef v4 = stringOrNull(v3);

  return v4;
}

- (id)isBatteryCharging
{
  v2 = (void *)MGCopyAnswer();
  CFDictionaryRef v3 = numberOrNull(v2);

  return v3;
}

- (id)isPowerConnected
{
  v2 = (void *)MGCopyAnswer();
  CFDictionaryRef v3 = numberOrNull(v2);

  return v3;
}

- (void)addDateOfManufactureAndFirstUseToDictionary:(id)a3
{
  id v3 = a3;
  CFTypeRef blob = 0;
  if (!IOPSCopyPowerSourcesByTypePrecise())
  {
    CFDictionaryRef v4 = DiagnosticLogHandleForCategory();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)v6 = 0;
    v5 = "Power sources info is empty.";
    goto LABEL_4;
  }
  CFDictionaryRef v4 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    v5 = "Failed to retrieve power sources info.";
LABEL_4:
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
  }
LABEL_7:
}

- (id)upoCount
{
  v2 = [(ComponentBatteryInternalBase *)self _pmuNodeProperties];
  id v3 = v2;
  if (v2)
  {
    CFDictionaryRef v4 = [v2 objectForKeyedSubscript:@"IOPMUBootUPOCounter"];
  }
  else
  {
    CFDictionaryRef v4 = 0;
  }
  v5 = numberOrNull(v4);

  return v5;
}

- (id)fbsn
{
  v2 = [(ComponentBatteryInternalBase *)self _chargerNodeProperties];
  id v3 = v2;
  if (v2)
  {
    CFDictionaryRef v4 = [v2 objectForKeyedSubscript:@"battery-factory-id"];
    if (v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && (id v5 = v4,
          size_t v6 = strnlen((const char *)[v5 bytes], (size_t)objc_msgSend(v5, "length")),
          v6 < (unint64_t)[v5 length]))
    {
      v7 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", [v5 bytes], 1);
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  id v8 = stringOrNull(v7);

  return v8;
}

- (id)serialNumber
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000225DC;
  block[3] = &unk_100084A38;
  block[4] = self;
  if (qword_1000BE0A8 != -1) {
    dispatch_once(&qword_1000BE0A8, block);
  }
  v2 = stringOrNull((void *)qword_1000BE0A0);

  return v2;
}

- (id)kioskMode
{
  v2 = [(ComponentBatteryInternalBase *)self _powerSourceNodeProperties];
  id v3 = v2;
  if (v2)
  {
    CFDictionaryRef v4 = [v2 objectForKeyedSubscript:@"KioskMode"];
    id v5 = v4;
    if (v4)
    {
      size_t v6 = [v4 objectForKeyedSubscript:@"KioskModeMode"];
    }
    else
    {
      size_t v6 = 0;
    }
  }
  else
  {
    size_t v6 = 0;
  }
  v7 = stringOrNull(v6);

  return v7;
}

- (void)addRawRaDataToDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(ComponentBatteryInternalBase *)self _powerSourceNodeProperties];
  size_t v6 = v5;
  if (v5
    && ([v5 objectForKeyedSubscript:@"BatteryData"],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    id v8 = [v6 objectForKeyedSubscript:@"BatteryData"];
    unsigned int v9 = [v8 objectForKeyedSubscript:@"LifetimeData"];

    if (v9)
    {
      v10 = [v8 objectForKeyedSubscript:@"LifetimeData"];
      v11 = [v10 objectForKeyedSubscript:@"Raw"];

      if (v11)
      {
        v12 = [v10 objectForKeyedSubscript:@"Raw"];
        v13 = [v12 base64EncodedStringWithOptions:0];
      }
      else
      {
        v13 = &stru_1000A3028;
      }
    }
    else
    {
      v13 = &stru_1000A3028;
    }
    v15 = [v8 objectForKeyedSubscript:@"RaTableRaw"];

    if (v15)
    {
      v14 = objc_opt_new();
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      v16 = [v8 objectForKeyedSubscript:@"RaTableRaw"];
      id v17 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v23;
        do
        {
          v20 = 0;
          do
          {
            if (*(void *)v23 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = [*(id *)(*((void *)&v22 + 1) + 8 * (void)v20) base64EncodedStringWithOptions:0];
            if (v21) {
              [v14 addObject:v21];
            }

            v20 = (char *)v20 + 1;
          }
          while (v18 != v20);
          id v18 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v18);
      }
    }
    else
    {
      v14 = &__NSArray0__struct;
    }
  }
  else
  {
    v13 = &stru_1000A3028;
    v14 = &__NSArray0__struct;
  }
  [v4 setObject:v13 forKeyedSubscript:@"lifetimeDataRaw"];
  [v4 setObject:v14 forKeyedSubscript:@"rawRaData"];
}

- (id)getGasGaugeData
{
  id v3 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:5];
  id v4 = [(ComponentBatteryInternalBase *)self _powerSourceNodeProperties];
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"NominalChargeCapacity"];
    if (v6) {
      [v3 setObject:v6 forKeyedSubscript:@"nominalChargeCapacity"];
    }
    uint64_t v19 = v5;
    v7 = [v5 objectForKeyedSubscript:@"BatteryData" v6];
    id v8 = v7;
    if (v7)
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v21;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v21 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            CFStringRef v14 = @"fullChargeCapacity";
            if (([v13 isEqualToString:@"MaxCapacity"] & 1) == 0)
            {
              CFStringRef v14 = @"cycleCount";
              if (([v13 isEqualToString:@"CycleCount"] & 1) == 0)
              {
                CFStringRef v14 = @"designCapacity";
                if (![v13 isEqualToString:@"DesignCapacity"]) {
                  continue;
                }
              }
            }
            v15 = [v8 objectForKey:v13];
            [v3 setValue:v15 forKey:v14];
          }
          id v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v10);
      }
    }
    id v16 = [v3 copy];

    id v5 = v19;
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (id)generateMaxMinAvgCapacity
{
  id v3 = PLQueryRegistered();
  id v4 = DiagnosticLogHandleForCategory();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "BatteryQueryForCapacity: %@", buf, 0xCu);
    }

    id v5 = [v3 objectForKeyedSubscript:@"fullChargeCapacityMax"];
    uint64_t v6 = [(ComponentBatteryInternalBase *)self integerNumberWithNumber:v5];
    v14[0] = v6;
    v13[1] = @"fullChargeCapacityMin";
    v7 = [v3 objectForKeyedSubscript:];
    id v8 = [(ComponentBatteryInternalBase *)self integerNumberWithNumber:v7];
    v14[1] = v8;
    v13[2] = @"fullChargeCapacityAvg";
    id v9 = [v3 objectForKeyedSubscript:];
    id v10 = [(ComponentBatteryInternalBase *)self integerNumberWithNumber:v9];
    v14[2] = v10;
    uint64_t v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "[ERROR] BatteryQueryForCapacity returned nil", buf, 2u);
    }
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)generateTemperatureData
{
  v2 = PLQueryRegistered();
  id v3 = DiagnosticLogHandleForCategory();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "BatteryQueryForTemperature: %@", buf, 0xCu);
    }

    id v4 = [v2 objectForKeyedSubscript:@"TemperatureMax" temperatureMax];
    id v5 = numberOrNull(v4);
    v13[0] = v5;
    v12[1] = @"temperatureMin";
    uint64_t v6 = [v2 objectForKeyedSubscript:@"TemperatureMin"];
    v7 = numberOrNull(v6);
    v13[1] = v7;
    v12[2] = @"temperatureAvg";
    id v8 = [v2 objectForKeyedSubscript:@"TemperatureAvg"];
    id v9 = numberOrNull(v8);
    v13[2] = v9;
    id v10 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "[ERROR] BatteryQueryForTemperature returned nil", buf, 2u);
    }
    id v10 = 0;
  }

  return v10;
}

- (id)generateMitigationState
{
  uint64_t state64 = 0;
  int out_token = 0;
  uint32_t v2 = notify_register_check("com.apple.thermalmonitor.ageAwareMitigationState", &out_token);
  if (v2)
  {
    uint32_t v3 = v2;
    id v4 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      uint32_t v16 = v3;
      id v5 = "notify_register_check failed in ComponentBatteryInternalBase: %d";
LABEL_11:
      _os_log_fault_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, v5, buf, 8u);
    }
  }
  else
  {
    uint32_t state = notify_get_state(out_token, &state64);
    if (!state) {
      goto LABEL_7;
    }
    uint32_t v7 = state;
    id v4 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      uint32_t v16 = v7;
      id v5 = "notify_get_state failed in ComponentBatteryInternalBase: %d";
      goto LABEL_11;
    }
  }

LABEL_7:
  CFStringRef v13 = @"perfMitigationState";
  id v8 = +[NSNumber numberWithUnsignedLongLong:state64];
  CFStringRef v14 = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];

  return v9;
}

- (id)generateUPOStepper
{
  uint32_t v2 = PLQueryRegistered();
  uint32_t v3 = DiagnosticLogHandleForCategory();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "BatteryQueryForUPOStepper: %@", buf, 0xCu);
    }

    id v4 = [v2 objectForKeyedSubscript:@"State"];
    if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      id v5 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "[ERROR] BatteryQueryForUPOStepper returned nil or unexpected class for state array", buf, 2u);
      }

      uint64_t v6 = +[NSNull null];

      id v4 = v6;
    }
    uint32_t v7 = [v2 objectForKeyedSubscript:@"Metrics"];
    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (![v7 count])
      {
LABEL_22:
        v22[1] = v7;
        CFStringRef v23 = @"upoStepper";
        v21[0] = @"state";
        v21[1] = @"metrics";
        v22[0] = v4;
        id v18 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
        long long v24 = v18;
        uint64_t v19 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];

        goto LABEL_26;
      }
      id v8 = +[DSDateFormatter sharedFormatter];
      id v9 = [v8 formatterWithType:0];

      id v10 = [v7 mutableCopy];
      if ([v10 count])
      {
        unint64_t v11 = 0;
        do
        {
          v12 = [v10 objectAtIndexedSubscript:v11];
          id v13 = [v12 mutableCopy];

          CFStringRef v14 = [v13 objectForKeyedSubscript:@"BatteryShutdownTimestamp"];

          if (v14)
          {
            v15 = [v13 objectForKeyedSubscript:@"BatteryShutdownTimestamp"];
            uint32_t v16 = [v9 stringFromDate:v15];
            [v13 setObject:v16 forKeyedSubscript:@"BatteryShutdownTimestamp"];
          }
          [v10 setObject:v13 atIndexedSubscript:v11];

          ++v11;
        }
        while ((unint64_t)[v10 count] > v11);
      }

      uint32_t v7 = v9;
    }
    else
    {
      id v17 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "[ERROR] BatteryQueryForUPOStepper returned nil or unexpected class for metrics array", buf, 2u);
      }

      id v10 = +[NSNull null];
    }

    uint32_t v7 = v10;
    goto LABEL_22;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "[ERROR] BatteryQueryForUPOStepper returned nil", buf, 2u);
  }
  uint64_t v19 = 0;
LABEL_26:

  return v19;
}

- (id)generateBatteryConfig
{
  uint32_t v3 = PLQueryRegistered();
  id v4 = DiagnosticLogHandleForCategory();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "BatteryQueryForConfig: %@", buf, 0xCu);
    }

    id v5 = [v3 objectForKeyedSubscript:@"BatteryConfig"];
    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v5 count])
    {
      uint64_t v6 = [v5 lastObject];
      uint32_t v7 = [(ComponentBatteryInternalBase *)self _encodeDataInDictionary:v6];

      if (!+[NSJSONSerialization isValidJSONObject:v7])
      {
        id v8 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Battery config is still not serializable, omitting.", buf, 2u);
        }

        uint64_t v9 = +[NSNull null];

        uint32_t v7 = (void *)v9;
      }
    }
    else
    {
      id v10 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[ERROR] BatteryQueryForConfig returned nil, unexpected class, or zero count for config array", buf, 2u);
      }

      uint32_t v7 = +[NSNull null];
    }
    unint64_t v11 = [v3 objectForKeyedSubscript:@"dataReady" default:@"batteryConfigDataReady"];
    v12 = v11;
    if (!v11)
    {
      v12 = +[NSNull null];
    }
    v15[1] = @"batteryConfig";
    v16[0] = v12;
    v16[1] = v7;
    id v13 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
    if (!v11) {
  }
    }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "[ERROR] BatteryQueryForConfig returned nil", buf, 2u);
    }
    id v13 = 0;
  }

  return v13;
}

- (id)integerNumberWithNumber:(id)a3
{
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 integerValue]);
    id v4 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = &off_1000B71C8;
  }

  return v4;
}

- (id)_stringToSInt16Array:(id)a3 separatedByString:(id)a4
{
  id v4 = [a3 componentsSeparatedByString:a4];
  id v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        unint64_t v11 = +[NSNumber numberWithShort:[*(id *)(*((void *)&v13 + 1) + 8 * i) integerValue]];
        [v5 addObject:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)hasSMC
{
  CFDictionaryRef v2 = IOServiceMatching("AppleSMC");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v2);
  io_service_t v4 = MatchingService;
  if (MatchingService) {
    IOObjectRelease(MatchingService);
  }
  return v4 != 0;
}

- (void)addCycleCountHistoryToDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_100023FF0;
  v30 = sub_100024000;
  id v31 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = dispatch_get_global_queue(21, 0);
  id v7 = v5;
  long long v25 = v7;
  int v8 = IOPMCopyCycleCountData();

  dispatch_time_t v9 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v7, v9))
  {
    id v10 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      unint64_t v11 = "IOPM cycle count history query timed out";
      v12 = v10;
      uint32_t v13 = 2;
LABEL_16:
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
    }
  }
  else if (v8)
  {
    id v10 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v33) = v8;
      unint64_t v11 = "Fetching cycle count data resulted in error: 0x%0x";
      v12 = v10;
      uint32_t v13 = 8;
      goto LABEL_16;
    }
  }
  else
  {
    long long v14 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = v27[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v33 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Cycle count data: %@", buf, 0xCu);
    }

    long long v16 = (void *)v27[5];
    if (!v16) {
      goto LABEL_14;
    }
    id v17 = objc_msgSend(v16, "objectForKeyedSubscript:", @"batteryCycleCountData", _NSConcreteStackBlock, 3221225472, sub_100024008, &unk_100084A60, v7, &v26);
    if (!v17) {
      goto LABEL_14;
    }
    id v18 = [(id)v27[5] objectForKeyedSubscript:@"batteryCycleCountData"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      long long v20 = [(id)v27[5] objectForKeyedSubscript:@"batteryCycleCountData"];
      id v10 = [(ComponentBatteryInternalBase *)self _encodeDataInDictionary:v20];

      if (+[NSJSONSerialization isValidJSONObject:v10])
      {
        [v4 setObject:v10 forKeyedSubscript:@"cycleCountHistory"];
      }
      else
      {
        long long v22 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          uint64_t v24 = v27[5];
          *(_DWORD *)buf = 138412290;
          uint64_t v33 = v24;
          _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Could not serialize cycle count data: %@", buf, 0xCu);
        }

        CFStringRef v23 = +[NSNull null];
        [v4 setObject:v23 forKeyedSubscript:@"cycleCountHistory"];
      }
    }
    else
    {
LABEL_14:
      id v10 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = v27[5];
        *(_DWORD *)buf = 138412290;
        uint64_t v33 = v21;
        unint64_t v11 = "Cycle count data not found or not in the right format: %@.";
        v12 = v10;
        uint32_t v13 = 12;
        goto LABEL_16;
      }
    }
  }

  _Block_object_dispose(&v26, 8);
}

- (void)addHeatMapToDictionary:(id)a3
{
  id v3 = a3;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = sub_100023FF0;
  v39 = sub_100024000;
  id v40 = 0;
  uint64_t v4 = +[NSMutableDictionary dictionaryWithCapacity:3];
  [v3 setObject:v4 forKeyedSubscript:@"heatMap"];
  v30 = (void *)v4;
  v29 = v3;
  v46[0] = &off_1000B71E0;
  v46[1] = &off_1000B71F8;
  v47[0] = @"wired";
  v47[1] = @"wireless";
  v46[2] = &off_1000B7210;
  v47[2] = @"discharging";
  +[NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:3];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 countByEnumeratingWithState:&v31 objects:v45 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v32;
    do
    {
      int v8 = 0;
      do
      {
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(v5);
        }
        dispatch_time_t v9 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v8);
        id v10 = [v5 objectForKeyedSubscript:v9];
        dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
        [v9 integerValue];
        v12 = dispatch_get_global_queue(21, 0);
        uint32_t v13 = v11;
        int v14 = IOPMCopyBatteryHeatMap();

        dispatch_time_t v15 = dispatch_time(0, 10000000000);
        if (dispatch_semaphore_wait(v13, v15))
        {
          long long v16 = DiagnosticLogHandleForCategory();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            goto LABEL_22;
          }
          *(_DWORD *)buf = 138412290;
          v42 = v10;
          id v17 = v16;
          id v18 = "IOPM heat map query timed out for: %@";
LABEL_9:
          uint32_t v19 = 12;
LABEL_13:
          _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, v18, buf, v19);
          goto LABEL_22;
        }
        if (v14)
        {
          long long v16 = DiagnosticLogHandleForCategory();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            goto LABEL_22;
          }
          *(_DWORD *)buf = 138412546;
          v42 = v10;
          __int16 v43 = 1024;
          LODWORD(v44) = v14;
          id v17 = v16;
          id v18 = "Fetching heat map resulted in error [%@]: 0x%0x";
          uint32_t v19 = 18;
          goto LABEL_13;
        }
        long long v20 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v21 = (void *)v36[5];
          *(_DWORD *)buf = 138412290;
          v42 = v21;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Heat map data: %@", buf, 0xCu);
        }

        long long v22 = (void *)v36[5];
        if (!v22) {
          goto LABEL_21;
        }
        CFStringRef v23 = [v22 objectForKeyedSubscript:@"batteryHeatMapData"];
        if (!v23) {
          goto LABEL_21;
        }
        uint64_t v24 = [(id)v36[5] objectForKeyedSubscript:@"batteryHeatMapData"];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          long long v16 = [(id)v36[5] objectForKeyedSubscript:@"batteryHeatMapData"];
          if (+[NSJSONSerialization isValidJSONObject:v16])
          {
            [v30 setObject:v16 forKeyedSubscript:v10];
          }
          else
          {
            uint64_t v26 = DiagnosticLogHandleForCategory();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              uint64_t v27 = v36[5];
              *(_DWORD *)buf = 138412546;
              v42 = v10;
              __int16 v43 = 2112;
              uint64_t v44 = v27;
              _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Could not serialize heat map [%@]: %@", buf, 0x16u);
            }
          }
        }
        else
        {
LABEL_21:
          long long v16 = DiagnosticLogHandleForCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v42 = v10;
            id v17 = v16;
            id v18 = "Heat map not found [%@].";
            goto LABEL_9;
          }
        }
LABEL_22:

        int v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v28 = [v5 countByEnumeratingWithState:&v31 objects:v45 count:16];
      id v6 = v28;
    }
    while (v28);
  }

  _Block_object_dispose(&v35, 8);
}

- (void)addInductiveChargingParametersToDictionary:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(ComponentBatteryInternalBase *)self _powerSourceNodeProperties];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 objectForKeyedSubscript:@"InductiveChargingParameters"];

    if (v6)
    {
      uint64_t v7 = [v5 objectForKeyedSubscript:@"InductiveChargingParameters"];
      [v8 setObject:v7 forKeyedSubscript:@"inductiveChargingParameters"];
    }
  }
}

- (id)_encodeDataInDictionary:(id)a3
{
  id v4 = [a3 mutableCopy];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  [v4 allKeys];
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        dispatch_semaphore_t v11 = [v4 objectForKeyedSubscript:v10];
        v12 = [(ComponentBatteryInternalBase *)self _encodeDataInObject:v11];
        [v4 setObject:v12 forKeyedSubscript:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  id v13 = [v4 copy];

  return v13;
}

- (id)_encodeDataInArray:(id)a3
{
  id v4 = a3;
  id v5 = [v4 mutableCopy];
  if ([v4 count])
  {
    unint64_t v6 = 0;
    do
    {
      id v7 = [v4 objectAtIndexedSubscript:v6];
      uint64_t v8 = [(ComponentBatteryInternalBase *)self _encodeDataInObject:v7];
      [v5 setObject:v8 atIndexedSubscript:v6];

      ++v6;
    }
    while ((unint64_t)[v4 count] > v6);
  }
  id v9 = [v5 copy];

  return v9;
}

- (id)_encodeDataInObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Encoding raw data object: \"%@\"", (uint8_t *)&v9, 0xCu);
    }

    uint64_t v6 = [v4 base64EncodedStringWithOptions:0];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [(ComponentBatteryInternalBase *)self _encodeDataInDictionary:v4];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_10;
      }
      uint64_t v6 = [(ComponentBatteryInternalBase *)self _encodeDataInArray:v4];
    }
  }
  id v7 = (void *)v6;

  id v4 = v7;
LABEL_10:

  return v4;
}

- (id)_powerSourceNodeProperties
{
  CFStringRef v6 = @"IOProviderClass";
  CFStringRef v7 = @"IOPMPowerSource";
  id v3 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  id v4 = [(ComponentBatteryInternalBase *)self _nodePropertiesForServiceMatching:v3 extraKey:@"InductiveChargingParameters"];

  return v4;
}

- (id)_chargerNodeProperties
{
  v10[0] = @"IONameMatch";
  v10[1] = @"IOProviderClass";
  v11[0] = @"charger";
  v11[1] = @"IOPlatformDevice";
  id v3 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  uint64_t v4 = [(ComponentBatteryInternalBase *)self _nodePropertiesForServiceMatching:v3 extraKey:0];
  if (v4)
  {
    id v5 = (void *)v4;
  }
  else
  {
    v8[0] = @"IONameMatch";
    v8[1] = @"IOProviderClass";
    v9[0] = @"smc-charger";
    v9[1] = @"AppleSMCInterface";
    uint64_t v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];

    id v5 = [(ComponentBatteryInternalBase *)self _nodePropertiesForServiceMatching:v6 extraKey:0];
    id v3 = (void *)v6;
  }

  return v5;
}

- (id)_pmuNodeProperties
{
  return [(ComponentBatteryInternalBase *)self _nodePropertiesForServiceMatching:&off_1000B75B0 extraKey:0];
}

- (id)_nodePropertiesForServiceMatching:(id)a3 extraKey:(id)a4
{
  kern_return_t v10;
  void *CFProperty;
  CFTypeID v12;
  char v13;
  NSObject *v14;
  CFMutableDictionaryRef v15;
  NSObject *v16;
  char v17;
  NSObject *v18;
  id v19;
  CFMutableDictionaryRef properties;
  uint8_t buf[4];
  void *v23;
  uint64_t vars8;

  id v5 = a3;
  uint64_t v6 = (__CFString *)a4;
  CFDictionaryRef v7 = (const __CFDictionary *)v5;
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v7);
  if (MatchingService)
  {
    io_registry_entry_t v9 = MatchingService;
    properties = 0;
    id v10 = IORegistryEntryCreateCFProperties(MatchingService, &properties, 0, 0);
    if (v6)
    {
      CFProperty = (void *)IORegistryEntryCreateCFProperty(v9, v6, 0, 0);
      IOObjectRelease(v9);
      if (CFProperty)
      {
        v12 = CFGetTypeID(CFProperty);
        if (v12 != CFDictionaryGetTypeID())
        {
          CFRelease(CFProperty);
          CFProperty = 0;
        }
        id v13 = 1;
        if (!v10) {
          goto LABEL_16;
        }
LABEL_12:
        long long v16 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "[ERROR] Could not create properties", buf, 2u);
        }

        long long v15 = 0;
        goto LABEL_26;
      }
      id v13 = 0;
      if (v10) {
        goto LABEL_12;
      }
    }
    else
    {
      IOObjectRelease(v9);
      id v13 = 0;
      CFProperty = 0;
      if (v10) {
        goto LABEL_12;
      }
    }
LABEL_16:
    long long v15 = properties;
    long long v17 = v13 ^ 1;
    if (!v6) {
      long long v17 = 1;
    }
    if (v17)
    {
      if (!v6) {
        id v13 = 1;
      }
      if ((v13 & 1) == 0)
      {
        long long v18 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v23 = v6;
          _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "[ERROR] Could not get extra property %@", buf, 0xCu);
        }
      }
    }
    else
    {
      [(__CFDictionary *)properties setObject:CFProperty forKeyedSubscript:v6];
    }
LABEL_26:

    goto LABEL_27;
  }
  int v14 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v23 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "[ERROR] Could not find the service matched by: %@", buf, 0xCu);
  }

  long long v15 = 0;
LABEL_27:
  uint32_t v19 = [(__CFDictionary *)v15 copy];

  return v19;
}

- (BOOL)isTrusted
{
  CFDictionaryRef v2 = +[DAComponentUtil getIORegistryClass:@"AppleAuthCPRelay" property:@"isTrusted" optionalKey:0 classValidator:&stru_100084A10];
  char v5 = 0;
  [v2 getBytes:&v5 length:1];
  BOOL v3 = v5 != 0;

  return v3;
}

- (BOOL)authPassed
{
  CFDictionaryRef v2 = +[DAComponentUtil getIORegistryClass:@"AppleAuthCPRelay" property:@"AuthPassed" optionalKey:0 classValidator:&stru_100084A10];
  char v5 = 0;
  [v2 getBytes:&v5 length:1];
  BOOL v3 = v5 != 0;

  return v3;
}

- (id)fdrValidationStatus
{
  CFDictionaryRef v2 = +[DAComponentUtil getIORegistryClass:@"AppleAuthCPRelay" property:@"FdrValidationStatus" optionalKey:0 classValidator:&stru_100084A10];
  if (v2) {
    id v3 = [objc_alloc((Class)NSString) initWithData:v2 encoding:4];
  }
  else {
    id v3 = 0;
  }
  uint64_t v4 = stringOrNull(v3);

  return v4;
}

@end