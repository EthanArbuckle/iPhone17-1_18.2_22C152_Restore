@interface ATXMagicalMomentsTypes
+ (id)consumerMapping;
+ (id)mmConsumerMapping;
+ (id)mmEventTypeMapping;
+ (id)predictionReasonMapping;
+ (id)stringForConsumerType:(unint64_t)a3;
+ (id)stringForMMConsumerType:(unint64_t)a3;
+ (id)stringForMMEventType:(unint64_t)a3;
+ (id)stringForPredictionReason:(int64_t)a3;
+ (int64_t)selectSingleReason:(int64_t)a3;
+ (unint64_t)mmConsumerTypeOfConsumerType:(unint64_t)a3 consumerSubType:(unsigned __int8)a4;
@end

@implementation ATXMagicalMomentsTypes

+ (id)stringForConsumerType:(unint64_t)a3
{
  if ((uint64_t)a3 > 15)
  {
    if ((uint64_t)a3 > 63)
    {
      if (a3 == 64) {
        return @"AppConnectionExpert";
      }
      if (a3 == 127) {
        return @"All";
      }
    }
    else
    {
      if (a3 == 16) {
        return @"Maps";
      }
      if (a3 == 32) {
        return @"Widget";
      }
    }
LABEL_16:
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"ATXMagicalMomentsTypes.m", 41, @"stringForConsumerType called with invalid ATXMagicalMomentsConsumerType value of %lu", a3);

    return @"Error";
  }
  else
  {
    id result = @"Spotlight";
    switch(a3)
    {
      case 0uLL:
        id result = @"Unknown";
        break;
      case 1uLL:
        id result = @"SpringBoard";
        break;
      case 2uLL:
        return result;
      case 4uLL:
        id result = @"CarPlay";
        break;
      case 8uLL:
        id result = @"Phone";
        break;
      default:
        goto LABEL_16;
    }
  }
  return result;
}

+ (id)predictionReasonMapping
{
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:12];
  v4 = [a1 stringForPredictionReason:0];
  [v3 setObject:v4 forKeyedSubscript:&unk_1EFDF4020];

  for (int i = 0; i != 12; ++i)
  {
    v6 = [a1 stringForPredictionReason:(1 << i)];
    v7 = [NSNumber numberWithInteger:(1 << i)];
    [v3 setObject:v6 forKeyedSubscript:v7];
  }

  return v3;
}

+ (id)mmEventTypeMapping
{
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:6];
  for (uint64_t i = 0; i != 6; ++i)
  {
    v5 = [a1 stringForMMEventType:i];
    v6 = [NSNumber numberWithInt:i];
    [v3 setObject:v5 forKeyedSubscript:v6];
  }

  return v3;
}

+ (id)consumerMapping
{
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:7];
  v4 = [a1 stringForConsumerType:0];
  [v3 setObject:v4 forKeyedSubscript:&unk_1EFDF4038];

  for (int i = 0; i != 7; ++i)
  {
    v6 = [a1 stringForConsumerType:(1 << i)];
    v7 = [NSNumber numberWithUnsignedInteger:(1 << i)];
    [v3 setObject:v6 forKeyedSubscript:v7];
  }

  return v3;
}

+ (int64_t)selectSingleReason:(int64_t)a3
{
  int64_t v3 = 1;
  uint64_t v4 = 32;
  int64_t v5 = a3 & 0x400;
  if ((a3 & 0x10) != 0) {
    int64_t v5 = 16;
  }
  if ((a3 & 0x20) == 0) {
    uint64_t v4 = v5;
  }
  if ((a3 & 1) == 0) {
    int64_t v3 = v4;
  }
  if ((a3 & 2) != 0) {
    return 2;
  }
  else {
    return v3;
  }
}

+ (id)stringForPredictionReason:(int64_t)a3
{
  if (a3)
  {
    __int16 v3 = a3;
    uint64_t v4 = objc_opt_new();
    int64_t v5 = v4;
    if ((v3 & 0x40) != 0)
    {
      [v4 appendString:@"Application_"];
      if ((v3 & 0x10) == 0)
      {
LABEL_4:
        if ((v3 & 8) == 0) {
          goto LABEL_5;
        }
        goto LABEL_18;
      }
    }
    else if ((v3 & 0x10) == 0)
    {
      goto LABEL_4;
    }
    [v5 appendString:@"Location_"];
    if ((v3 & 8) == 0)
    {
LABEL_5:
      if ((v3 & 0x200) == 0) {
        goto LABEL_6;
      }
      goto LABEL_19;
    }
LABEL_18:
    [v5 appendString:@"Motion_"];
    if ((v3 & 0x200) == 0)
    {
LABEL_6:
      if ((v3 & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_20;
    }
LABEL_19:
    [v5 appendString:@"Other_"];
    if ((v3 & 1) == 0)
    {
LABEL_7:
      if ((v3 & 2) == 0) {
        goto LABEL_8;
      }
      goto LABEL_21;
    }
LABEL_20:
    [v5 appendString:@"Headphones_"];
    if ((v3 & 2) == 0)
    {
LABEL_8:
      if ((v3 & 4) == 0) {
        goto LABEL_9;
      }
      goto LABEL_22;
    }
LABEL_21:
    [v5 appendString:@"Bluetooth_"];
    if ((v3 & 4) == 0)
    {
LABEL_9:
      if ((v3 & 0x20) == 0) {
        goto LABEL_10;
      }
      goto LABEL_23;
    }
LABEL_22:
    [v5 appendString:@"CarPlay_"];
    if ((v3 & 0x20) == 0)
    {
LABEL_10:
      if ((v3 & 0x400) == 0) {
        goto LABEL_11;
      }
      goto LABEL_24;
    }
LABEL_23:
    [v5 appendString:@"FirstWakeup_"];
    if ((v3 & 0x400) == 0)
    {
LABEL_11:
      if ((v3 & 0x800) == 0)
      {
LABEL_13:
        if ([v5 length]) {
          v6 = v5;
        }
        else {
          v6 = @"Unknown_";
        }

        goto LABEL_28;
      }
LABEL_12:
      [v5 appendString:@"HeroApp_"];
      goto LABEL_13;
    }
LABEL_24:
    [v5 appendString:@"MicroLocation_"];
    if ((v3 & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  v6 = @"Unknown";
LABEL_28:

  return v6;
}

+ (id)stringForMMEventType:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      id result = @"suppressed";
      break;
    case 2uLL:
      id result = @"served";
      break;
    case 3uLL:
      id result = @"shown";
      break;
    case 4uLL:
      id result = @"converted";
      break;
    case 5uLL:
      id result = @"abandoned";
      break;
    case 6uLL:
      uint64_t v4 = __atxlog_handle_pmm();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
        +[ATXMagicalMomentsTypes stringForMMEventType:](v4);
      }

      id result = @"max";
      break;
    default:
      id result = @"suggested";
      break;
  }
  return result;
}

+ (id)mmConsumerMapping
{
  __int16 v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:7];
  uint64_t v4 = [a1 stringForMMConsumerType:0];
  [v3 setObject:v4 forKeyedSubscript:&unk_1EFDF4038];

  for (int i = 0; i != 7; ++i)
  {
    v6 = [a1 stringForMMConsumerType:(1 << i)];
    v7 = [NSNumber numberWithUnsignedInteger:(1 << i)];
    [v3 setObject:v6 forKeyedSubscript:v7];
  }
  uint64_t v8 = [(id)objc_opt_class() mmConsumerTypeOfConsumerType:1 consumerSubType:2];
  v9 = [a1 stringForMMConsumerType:v8];
  v10 = [NSNumber numberWithUnsignedInteger:v8];
  [v3 setObject:v9 forKeyedSubscript:v10];

  return v3;
}

+ (id)stringForMMConsumerType:(unint64_t)a3
{
  unint64_t v5 = a3 & 0x7F;
  if (v5 > 0xF)
  {
    if ((a3 & 0x7F) > 0x3F)
    {
      if (v5 == 64) {
        return @"AppConnectionExpert";
      }
      if (v5 == 127) {
        return @"All";
      }
    }
    else
    {
      if (v5 == 16) {
        return @"Maps";
      }
      if (v5 == 32) {
        return @"Widget";
      }
    }
LABEL_18:
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"ATXMagicalMomentsTypes.m", 206, @"stringForMMConsumerType called with invalid ATXMagicalMomentsConsumerType value of %lu", v5);

    return @"Error";
  }
  else
  {
    id result = @"Spotlight";
    switch(a3 & 0x7F)
    {
      case 0uLL:
        id result = @"Unknown";
        break;
      case 1uLL:
        if ((a3 & 0x80) != 0) {
          id result = @"SpringBoardAppSwitcher";
        }
        else {
          id result = @"SpringBoardLock";
        }
        break;
      case 2uLL:
        return result;
      case 4uLL:
        id result = @"CarPlay";
        break;
      case 8uLL:
        id result = @"Phone";
        break;
      default:
        goto LABEL_18;
    }
  }
  return result;
}

+ (unint64_t)mmConsumerTypeOfConsumerType:(unint64_t)a3 consumerSubType:(unsigned __int8)a4
{
  if (a4 == 2 && a3 == 1) {
    return 129;
  }
  else {
    return a3;
  }
}

+ (void)stringForMMEventType:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A790D000, log, OS_LOG_TYPE_FAULT, "ATXMagicalMomentsTypes stringForMMEventType invoked with ATXMagicalMomentsEventTypeMax", v1, 2u);
}

@end