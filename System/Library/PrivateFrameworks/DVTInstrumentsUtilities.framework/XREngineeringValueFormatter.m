@interface XREngineeringValueFormatter
+ (id)networkAddressStringFromSockaddr:(const void *)a3 length:(unint64_t)a4 resolveHostName:(id)a5;
- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5;
- (BOOL)getTitleAndSubtitleForCoreEngineeringValue:(id)a3 title:(id *)a4 subtitle:(id *)a5;
- (BOOL)getTitleAndSubtitleForEngineeringValue:(id)a3 title:(id *)a4 subtitle:(id *)a5;
- (BOOL)getTitleAndSubtitleForProcessEngineeringValue:(id)a3 title:(id *)a4 subtitle:(id *)a5;
- (BOOL)getTitleAndSubtitleForSwiftActorEngineeringValue:(id)a3 title:(id *)a4 subtitle:(id *)a5;
- (BOOL)getTitleAndSubtitleForSwiftTaskEngineeringValue:(id)a3 title:(id *)a4 subtitle:(id *)a5;
- (BOOL)getTitleAndSubtitleForSwiftTaskPriorityEngineeringValue:(id)a3 title:(id *)a4 subtitle:(id *)a5;
- (BOOL)getTitleAndSubtitleForThreadEngineeringValue:(id)a3 title:(id *)a4 subtitle:(id *)a5;
- (BOOL)getTitleAndSubtitleForURLSessionEngineeringValue:(id)a3 title:(id *)a4 subtitle:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHighestResolutionTimeEnabled;
- (BOOL)isMultiline;
- (BOOL)useSimplifiedPlaceholder;
- (BOOL)withinNarrative;
- (NSDate)offsetForRelativeTimes;
- (NSTimeZone)timeOfDayTimeZone;
- (XREngineeringValueFormatter)init;
- (id)stringForBacktraceEngineeringValue:(id)a3;
- (id)stringForCallSiteEngineeringValue:(id)a3;
- (id)stringForCoreProfileBacktraceEngineeringValue:(id)a3;
- (id)stringForEngineeringValue:(id)a3;
- (id)stringForInstrumentTypeEngineeringValue:(id)a3;
- (id)stringForLibraryAddressEngineeringValue:(id)a3;
- (id)stringForObjectValue:(id)a3;
- (id)stringForSocketAddrEngineeringValue:(id)a3;
- (id)stringForSwiftTaskNameUsingTextSymbolEngineeringValue:(id)a3 andTextSymbolBacktrace:(id)a4;
- (id)stringForTextSymbolEngineeringValue:(id)a3 shouldIncludeLibrary:(BOOL)a4;
- (id)stringForUserIDEngineeringValue:(id)a3;
- (id)typeStringForEngineeringValue:(id)a3;
- (unint64_t)hash;
- (void)setDisplaysFullBacktrace:(BOOL)a3;
- (void)setHighestResolutionTimeEnabled:(BOOL)a3;
- (void)setMultiline:(BOOL)a3;
- (void)setOffsetForRelativeTimes:(id)a3;
- (void)setTimeOfDayTimeZone:(id)a3;
- (void)setUseSimplifiedPlaceholder:(BOOL)a3;
@end

@implementation XREngineeringValueFormatter

- (void)setDisplaysFullBacktrace:(BOOL)a3
{
}

- (id)stringForEngineeringValue:(id)a3
{
  return sub_234583438(self, a3, 0);
}

- (BOOL)getTitleAndSubtitleForEngineeringValue:(id)a3 title:(id *)a4 subtitle:(id *)a5
{
  id v8 = a3;
  v13 = v8;
  if (a4)
  {
    if (a5)
    {
      int v14 = [v8 engineeringType:v9, v10, v11, v12];
      if (v14 <= 208)
      {
        switch(v14)
        {
          case 8:
            char TitleAndSubtitleForThreadEngineeringValue_title_subtitle = [self TitleAndSubtitleForThreadEngineeringValue_title_subtitle:v15:v13:v13:v13];
            goto LABEL_22;
          case 23:
            char TitleAndSubtitleForThreadEngineeringValue_title_subtitle = [self TitleAndSubtitleForProcessEngineeringValue:v15 title:v13 subtitle:a4];
            goto LABEL_22;
          case 31:
            char TitleAndSubtitleForThreadEngineeringValue_title_subtitle = [self TitleAndSubtitleForCoreEngineeringValue_title_subtitle:v15 withValue:(uint64_t)v13 withValue:(uint64_t)a4 withValue:(uint64_t)a5];
            goto LABEL_22;
        }
      }
      else if (v14 > 232)
      {
        if (v14 == 233)
        {
          char TitleAndSubtitleForThreadEngineeringValue_title_subtitle = [self TitleAndSubtitleForSwiftActorEngineeringValue:v15 title:v13 subtitle:a4];
          goto LABEL_22;
        }
        if (v14 == 242)
        {
          id v18 = *a4;
          *a4 = @"Commutator";

          v19 = sub_234583438(self, v13, 0);
          id v20 = *a5;
          *a5 = v19;

          id v21 = *a5;
LABEL_17:
          BOOL v17 = v21 != 0;
          goto LABEL_23;
        }
      }
      else
      {
        if (v14 == 209)
        {
          char TitleAndSubtitleForThreadEngineeringValue_title_subtitle = [self TitleAndSubtitleForURLSessionEngineeringValue_title_subtitle:v15 withURLSessionEngineeringValue:v13 withURLSessionTaskEngineeringValue:a4 withURLSessionTaskEngineeringValue:a5];
          goto LABEL_22;
        }
        if (v14 == 225)
        {
          char TitleAndSubtitleForThreadEngineeringValue_title_subtitle = [self TitleAndSubtitleForSwiftTaskEngineeringValue:v15 title:v13 subtitle:a4];
LABEL_22:
          BOOL v17 = TitleAndSubtitleForThreadEngineeringValue_title_subtitle;
          goto LABEL_23;
        }
      }
    }
    v22 = sub_234583438(self, v13, 0);
    id v23 = *a4;
    *a4 = v22;

    id v21 = *a4;
    goto LABEL_17;
  }
  BOOL v17 = 0;
LABEL_23:

  return v17;
}

- (id)typeStringForEngineeringValue:(id)a3
{
  id v3 = a3;
  int v8 = [v3 engineeringType:v4, v5, v6, v7];
  if (v8 == 209)
  {
    v9 = @"URLSession";
    char v16 = 0;
    [v3 _getURLSessionName:v10 internalSessionID:0 backgroundIdentifier:0 isShared:0 isEphemeral:0];
    if (v16)
    {
      uint64_t v14 = [@"Ephemeral " stringByAppendingString:v11];

      v9 = (__CFString *)v14;
    }
  }
  else
  {
    v9 = XR_ENGINEERING_TITLE_BY_ETYPE[v8];
  }

  return v9;
}

- (BOOL)useSimplifiedPlaceholder
{
  return !self->_withinNarrative && self->_useSimplifiedPlaceholder;
}

- (XREngineeringValueFormatter)init
{
  v16.receiver = self;
  v16.super_class = (Class)XREngineeringValueFormatter;
  v2 = [(XREngineeringValueFormatter *)&v16 init];
  if (v2)
  {
    if (qword_2687AA128 != -1) {
      dispatch_once(&qword_2687AA128, &unk_26E752530);
    }
    objc_storeStrong((id *)&v2->_countFormatter, (id)qword_2687AA120);
    id v3 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x263F08A30]);
    intIDFormatter = v2->_intIDFormatter;
    v2->_intIDFormatter = v3;

    if (qword_2687AA138 != -1) {
      dispatch_once(&qword_2687AA138, &unk_26E752850);
    }
    objc_storeStrong((id *)&v2->_fpsFormatter, (id)qword_2687AA130);
    if (qword_2687AA148 != -1) {
      dispatch_once(&qword_2687AA148, &unk_26E752870);
    }
    objc_storeStrong((id *)&v2->_fixedDecimalFormatter, (id)qword_2687AA140);
    if (qword_2687AA158 != -1) {
      dispatch_once(&qword_2687AA158, &unk_26E752890);
    }
    objc_storeStrong((id *)&v2->_countersFormulaResultFormatter, (id)qword_2687AA150);
    uint64_t v5 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x263F08790]);
    [v5 setDateStyle:v6];
    [v5 setTimeStyle:2];
    timeOfDayFormatter = v2->_timeOfDayFormatter;
    v2->_timeOfDayFormatter = v5;

    uint64_t v13 = (NSMeasurementFormatter *)objc_alloc_init(MEMORY[0x263F08988]);
    measurementFormatter = v2->_measurementFormatter;
    v2->_measurementFormatter = v13;
  }
  return v2;
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  *a5 = @"Unsupported feature of the engineering type formatter";
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (unsigned __int8 *)a3;
  v7.receiver = self;
  v7.super_class = (Class)XREngineeringValueFormatter;
  BOOL v5 = 1;
  if (![(XREngineeringValueFormatter *)&v7 isEqual:v4])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (self->_multiline != v4[64] || self->_highestResolutionTimeEnabled != v4[65]))
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2 = 0x304545234;
  if (!self->_multiline) {
    uint64_t v2 = 0x234098509;
  }
  uint64_t v3 = 0x2348975685;
  if (!self->_highestResolutionTimeEnabled) {
    uint64_t v3 = 0x8875639026;
  }
  return v3 ^ v2;
}

- (id)stringForObjectValue:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:v5 withProtocols:v6, v7])
  {
    uint64_t v11 = [self stringForEngineeringValue:v8 value:v4 unit:v9 unitName:v10];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (NSTimeZone)timeOfDayTimeZone
{
  return (NSTimeZone *)((uint64_t (*)(NSDateFormatter *, char *))MEMORY[0x270F9A6D0])(self->_timeOfDayFormatter, sel_timeZone);
}

- (void)setTimeOfDayTimeZone:(id)a3
{
}

+ (id)networkAddressStringFromSockaddr:(const void *)a3 length:(unint64_t)a4 resolveHostName:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a5;
  uint64_t v11 = v7;
  if (v7)
  {
    id v12 = v7;
    BOOL v17 = [v12 UTF8String];
  }
  else
  {
    BOOL v17 = "???";
  }
  if (a4 >= 2 && (unint64_t v18 = *(unsigned __int8 *)a3, v18 <= a4))
  {
    int v22 = *((unsigned __int8 *)a3 + 1);
    HIDWORD(v23) = v22 - 2;
    LODWORD(v23) = v22 - 2;
    v19 = &stru_26E758AB0;
    v24 = "route";
    switch((v23 >> 2))
    {
      case 0u:
        if (v18 < 0x10) {
          goto LABEL_7;
        }
        uint64_t v8 = (char *)a3 + 4;
        int v25 = *((_DWORD *)a3 + 1);
        if (v25) {
          v24 = v17;
        }
        else {
          v24 = "*";
        }
        if (!v11 && v25) {
          v24 = inet_ntop(v22, v8, v26, 0xFFu);
        }
        if (*((_WORD *)a3 + 1))
        {
          [NSString stringWithFormat:@":%hu", v9, v10, __rev16(*((unsigned __int16 *)a3 + 1))];
          v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v19 = @":*";
        }
        break;
      case 2u:
        v24 = "ccitt";
        break;
      case 4u:
        break;
      case 7u:
        if (v18 < 0x1C) {
          goto LABEL_7;
        }
        if (!v11) {
          BOOL v17 = inet_ntop(v22, (char *)a3 + 8, v26, 0xFFu);
        }
        if (*((_WORD *)a3 + 1))
        {
          [NSString stringWithFormat:@".%hu", v9, v10, __rev16(*((unsigned __int16 *)a3 + 1))];
          v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v19 = @".*";
        }
        v24 = v17;
        break;
      default:
        v19 = &stru_26E758AB0;
        v24 = "???";
        break;
    }
    if (v24) {
      [NSString stringWithFormat:@"%s%@%@", v9, v10, v24, v19];
    }
    else {
      [NSString stringWithFormat:@"%s%@???%@", v9, v10, v19];
    }
    id v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = &stru_26E758AB0;
LABEL_7:
    id v20 = @"<error>";
  }

  return v20;
}

- (BOOL)isMultiline
{
  return self->_multiline;
}

- (void)setMultiline:(BOOL)a3
{
  self->_multiline = a3;
}

- (BOOL)isHighestResolutionTimeEnabled
{
  return self->_highestResolutionTimeEnabled;
}

- (void)setHighestResolutionTimeEnabled:(BOOL)a3
{
  self->_highestResolutionTimeEnabled = a3;
}

- (NSDate)offsetForRelativeTimes
{
  return self->_offsetForRelativeTimes;
}

- (void)setOffsetForRelativeTimes:(id)a3
{
}

- (BOOL)withinNarrative
{
  return self->_withinNarrative;
}

- (void)setUseSimplifiedPlaceholder:(BOOL)a3
{
  self->_useSimplifiedPlaceholder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offsetForRelativeTimes, 0);
  objc_storeStrong((id *)&self->_measurementFormatter, 0);
  objc_storeStrong((id *)&self->_timeOfDayFormatter, 0);
  objc_storeStrong((id *)&self->_countersFormulaResultFormatter, 0);
  objc_storeStrong((id *)&self->_fixedDecimalFormatter, 0);
  objc_storeStrong((id *)&self->_fpsFormatter, 0);
  objc_storeStrong((id *)&self->_intIDFormatter, 0);

  objc_storeStrong((id *)&self->_countFormatter, 0);
}

- (BOOL)getTitleAndSubtitleForCoreEngineeringValue:(id)a3 title:(id *)a4 subtitle:(id *)a5
{
  id v6 = a3;
  uint64_t v11 = v6;
  if (a4)
  {
    if ([v6 v7:v8:v9:v10] == 100000)
    {
      uint64_t v16 = @"-";
    }
    else
    {
      BOOL v17 = NSString;
      uint64_t v18 = [v11 v12:v13:v14:v15];
      [v17 stringWithFormat:v19, v20, v21, v18];
      uint64_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    id v22 = *a4;
    *a4 = v16;
  }
  return a4 != 0;
}

- (BOOL)getTitleAndSubtitleForProcessEngineeringValue:(id)a3 title:(id *)a4 subtitle:(id *)a5
{
  if (a4)
  {
    BOOL v17 = 0;
    if ([a3 getValue:a2 fieldIndex:0])
    {
      uint64_t v10 = [v17 v6:v7:v8:v9];
      if ((int)v10 < 1)
      {
        if (v10) {
          uint64_t v14 = @"Unknown";
        }
        else {
          uint64_t v14 = @"kernel_task";
        }
      }
      else
      {
        [NSString stringWithFormat:@"Process %d", v12, v13, v10];
        uint64_t v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      uint64_t v14 = @"<error>";
    }
    id v15 = *a4;
    *a4 = v14;
  }
  return a4 != 0;
}

- (BOOL)getTitleAndSubtitleForThreadEngineeringValue:(id)a3 title:(id *)a4 subtitle:(id *)a5
{
  if (a4)
  {
    uint64_t v10 = 0;
    if ([a3 getValue:a2 fieldIndex:0])
    {
      sub_234583438(self, v10, 0);
      uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v7 = @"unknown";
    }
    id v8 = *a4;
    *a4 = v7;
  }
  return a4 != 0;
}

- (BOOL)getTitleAndSubtitleForURLSessionEngineeringValue:(id)a3 title:(id *)a4 subtitle:(id *)a5
{
  if (a4)
  {
    id v19 = 0;
    id v20 = 0;
    [a3 _getURLSessionName_internalSessionID_backgroundIdentifier_isShared_isEphemeral_:&v20 internalSessionID:0 backgroundIdentifier:&v19 isShared:0 isEphemeral:0];
    uint64_t v7 = (__CFString *)v20;
    id v8 = v19;
    if (a5)
    {
      if (v7) {
        uint64_t v9 = v7;
      }
      else {
        uint64_t v9 = &stru_26E758AB0;
      }
      objc_storeStrong(a4, v9);
      id v10 = v8;
      id v11 = *a5;
      *a5 = v10;
    }
    else
    {
      uint64_t v12 = v7;
      uint64_t v16 = v12;
      if (v8)
      {
        uint64_t v17 = [v12 stringByAppendingFormat:@" (%@)", v14, v15, v8];

        uint64_t v16 = (void *)v17;
      }
      id v11 = *a4;
      *a4 = v16;
    }
  }
  return a4 != 0;
}

- (BOOL)getTitleAndSubtitleForSwiftTaskEngineeringValue:(id)a3 title:(id *)a4 subtitle:(id *)a5
{
  id v8 = a3;
  id v11 = v8;
  if (a4)
  {
    v30 = 0;
    id v31 = 0;
    id v29 = 0;
    int Value_fieldIndex = [v8 getValue:v9 fieldIndex:2];
    if ([v11 getValue:v13 fieldIndex:1])
    {
      BOOL v19 = 0;
      if ([v11 getValue:v15 fieldIndex:0])
      {
        if (Value_fieldIndex) {
          [self stringForSwiftTaskNameUsingTextSymbolEngineeringValue:v17 engineeringValue:(uint64_t)v31 backtrace:(uint64_t)v29];
        }
        else {
        id v20 = [self stringForTextSymbolEngineeringValue:v17 shouldIncludeLibrary:v31];
        }
        v24 = sub_234583438(self, v30, 0);
        if (a5)
        {
          objc_storeStrong(a4, v20);
          id v25 = v24;
          id v26 = *a5;
          *a5 = v25;
        }
        else
        {
          uint64_t v27 = [NSString stringWithFormat:@"%@ (%@)", v22, v23, v20, v24];
          id v26 = *a4;
          *a4 = v27;
        }

        BOOL v19 = 1;
      }
    }
    else
    {
      BOOL v19 = 0;
    }
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (id)stringForSwiftTaskNameUsingTextSymbolEngineeringValue:(id)a3 andTextSymbolBacktrace:(id)a4
{
  return [self stringForTextSymbolEngineeringValue:(uint64_t)a3 shouldIncludeLibrary:v4];
}

- (BOOL)getTitleAndSubtitleForSwiftActorEngineeringValue:(id)a3 title:(id *)a4 subtitle:(id *)a5
{
  id v8 = a3;
  id v11 = v8;
  if (a4)
  {
    v24 = 0;
    id v25 = 0;
    if ([v8 getValue:v9 fieldIndex:1])
    {
      BOOL v14 = 0;
      if ([v11 getValue:v12 fieldIndex:0])
      {
        uint64_t v15 = sub_234583438(self, v25, 0);
        BOOL v19 = sub_234583438(self, v24, 0);
        if (a5)
        {
          objc_storeStrong(a4, v15);
          id v20 = v19;
          id v21 = *a5;
          *a5 = v20;
        }
        else
        {
          uint64_t v22 = [NSString stringWithFormat:@"%@ (%@)", v17, v18, v15, v19];
          id v21 = *a4;
          *a4 = v22;
        }

        BOOL v14 = 1;
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)getTitleAndSubtitleForSwiftTaskPriorityEngineeringValue:(id)a3 title:(id *)a4 subtitle:(id *)a5
{
  id v8 = a3;
  id v11 = v8;
  if (a4)
  {
    id v25 = 0;
    id v26 = 0;
    if ([v8 getValue:v9 fieldIndex:1])
    {
      BOOL v14 = 0;
      if ([v11 getValue:v12 fieldIndex:0])
      {
        uint64_t v15 = sub_234583438(self, v26, 0);
        uint64_t v16 = sub_234583438(self, v25, 0);
        id v20 = v16;
        if (a5)
        {
          if (v15)
          {
            objc_storeStrong(a4, v15);
            id v21 = v20;
            id v22 = *a5;
            *a5 = v21;
LABEL_15:

            BOOL v14 = 1;
            goto LABEL_16;
          }
          id v23 = v16;
        }
        else
        {
          if (v15) {
            [NSString stringWithFormat:@"%@ (%@)", v18, v19, v15, v16];
          }
          else {
            [NSString stringWithFormat:@"%@%@%@", v18, v19, v16];
          }
          id v23 = (id)objc_claimAutoreleasedReturnValue();
        }
        id v22 = *a4;
        *a4 = v23;
        goto LABEL_15;
      }
    }
    else
    {
      BOOL v14 = 0;
    }
LABEL_16:

    goto LABEL_17;
  }
  BOOL v14 = 0;
LABEL_17:

  return v14;
}

- (id)stringForLibraryAddressEngineeringValue:(id)a3
{
  uint64_t v7 = 0;
  if ([a3 getValue:a2 fieldIndex:1] == v3)
  {
    sub_234583438(self, v7, 0);
    BOOL v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v5 = @"unknown";
  }

  return v5;
}

- (id)stringForTextSymbolEngineeringValue:(id)a3 shouldIncludeLibrary:(BOOL)a4
{
  id v8 = 0;
  if ([a3 getValue:a2 fieldIndex:1])
  {
    sub_234583438(self, v8, 0);
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = @"unknown";
  }

  return v6;
}

- (id)stringForBacktraceEngineeringValue:(id)a3
{
  return @"backtrace";
}

- (id)stringForCallSiteEngineeringValue:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  if ([v4 getValue:v5 fieldIndex:0] == v6)
    && [v4 getValue:v7 fieldIndex:1]
  {
    BOOL withinNarrative = self->_withinNarrative;
    uint64_t v10 = NSString;
    id v11 = sub_234583438(self, v19, withinNarrative);
    uint64_t v12 = sub_234583438(self, v18, withinNarrative);
    [v10 stringWithFormat:@"%@ + %@", v14, v15, v11, v12];
    uint64_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v16 = @"bad call site";
  }

  return v16;
}

- (id)stringForCoreProfileBacktraceEngineeringValue:(id)a3
{
  return @"kperf backtrace";
}

- (id)stringForUserIDEngineeringValue:(id)a3
{
  BOOL v5 = NSString;
  uint64_t v6 = [a3 a2:(uint64_t)a3 v3:v4];
  return [NSString stringWithFormat:@"%u", v8, v9, v6];
}

- (id)stringForInstrumentTypeEngineeringValue:(id)a3
{
  return [a3 a2:(uint64_t)a3 v3:v4];
}

- (id)stringForSocketAddrEngineeringValue:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v14 = 0;
  if ([v3 getLengthOfUint64Representation:v4 :&v14 :v5 :v6])
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = sub_2345866E4;
    v13[3] = &unk_264BF1DE8;
    v13[4] = v15;
    [v3 enumerateUint64Values:v7 usingBlock:^(uint64_t v13, BOOL *v8, BOOL *v9) {
    [XREngineeringValueFormatter networkAddressStringFromSockaddr:v10 length:v15 resolveHostName:0];
    id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = @"<error>";
  }

  return v11;
}

@end