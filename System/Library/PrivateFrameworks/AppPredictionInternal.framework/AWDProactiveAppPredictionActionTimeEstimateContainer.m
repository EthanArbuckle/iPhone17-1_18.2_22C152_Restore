@interface AWDProactiveAppPredictionActionTimeEstimateContainer
+ (Class)parameterType;
- (BOOL)hasActionType;
- (BOOL)hasNoMatchCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)parameters;
- (NSString)actionKey;
- (id)actionTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)launchReasonsAsString:(int)a3;
- (id)parameterAtIndex:(unint64_t)a3;
- (int)StringAsActionType:(id)a3;
- (int)StringAsLaunchReasons:(id)a3;
- (int)actionType;
- (int)launchReasonAtIndex:(unint64_t)a3;
- (int)launchReasons;
- (int)noMatchCount;
- (int)sessionIndexAtIndex:(unint64_t)a3;
- (int)sessionIndexs;
- (int)sessionLengthAtIndex:(unint64_t)a3;
- (int)sessionLengths;
- (int)timeEstimateAtIndex:(unint64_t)a3;
- (int)timeEstimates;
- (unint64_t)hash;
- (unint64_t)launchReasonsCount;
- (unint64_t)parametersCount;
- (unint64_t)sessionIndexsCount;
- (unint64_t)sessionLengthsCount;
- (unint64_t)timeEstimatesCount;
- (void)addLaunchReason:(int)a3;
- (void)addParameter:(id)a3;
- (void)addSessionIndex:(int)a3;
- (void)addSessionLength:(int)a3;
- (void)addTimeEstimate:(int)a3;
- (void)clearLaunchReasons;
- (void)clearParameters;
- (void)clearSessionIndexs;
- (void)clearSessionLengths;
- (void)clearTimeEstimates;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setActionKey:(id)a3;
- (void)setActionType:(int)a3;
- (void)setHasActionType:(BOOL)a3;
- (void)setHasNoMatchCount:(BOOL)a3;
- (void)setLaunchReasons:(int *)a3 count:(unint64_t)a4;
- (void)setNoMatchCount:(int)a3;
- (void)setParameters:(id)a3;
- (void)setSessionIndexs:(int *)a3 count:(unint64_t)a4;
- (void)setSessionLengths:(int *)a3 count:(unint64_t)a4;
- (void)setTimeEstimates:(int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation AWDProactiveAppPredictionActionTimeEstimateContainer

- (void)dealloc
{
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDProactiveAppPredictionActionTimeEstimateContainer;
  [(AWDProactiveAppPredictionActionTimeEstimateContainer *)&v3 dealloc];
}

- (int)actionType
{
  if (*(unsigned char *)&self->_has) {
    return self->_actionType;
  }
  else {
    return 0;
  }
}

- (void)setActionType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_actionType = a3;
}

- (void)setHasActionType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasActionType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)actionTypeAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    objc_super v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v3 = off_1E68AC448[a3];
  }
  return v3;
}

- (int)StringAsActionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ATXActionTypeIntent"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ATXActionTypeNSUserActivity"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ATXActionTypeOFA"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ATXActionTypeMax"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ATXActionTypeUnknown"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ATXActionTypeUAUserActivityProxy"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearParameters
{
}

- (void)addParameter:(id)a3
{
  id v4 = a3;
  parameters = self->_parameters;
  id v8 = v4;
  if (!parameters)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_parameters;
    self->_parameters = v6;

    id v4 = v8;
    parameters = self->_parameters;
  }
  [(NSMutableArray *)parameters addObject:v4];
}

- (unint64_t)parametersCount
{
  return [(NSMutableArray *)self->_parameters count];
}

- (id)parameterAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_parameters objectAtIndex:a3];
}

+ (Class)parameterType
{
  return (Class)objc_opt_class();
}

- (unint64_t)timeEstimatesCount
{
  return self->_timeEstimates.count;
}

- (int)timeEstimates
{
  return self->_timeEstimates.list;
}

- (void)clearTimeEstimates
{
}

- (void)addTimeEstimate:(int)a3
{
}

- (int)timeEstimateAtIndex:(unint64_t)a3
{
  p_timeEstimates = &self->_timeEstimates;
  unint64_t count = self->_timeEstimates.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_timeEstimates->list[a3];
}

- (void)setTimeEstimates:(int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)sessionLengthsCount
{
  return self->_sessionLengths.count;
}

- (int)sessionLengths
{
  return self->_sessionLengths.list;
}

- (void)clearSessionLengths
{
}

- (void)addSessionLength:(int)a3
{
}

- (int)sessionLengthAtIndex:(unint64_t)a3
{
  p_sessionLengths = &self->_sessionLengths;
  unint64_t count = self->_sessionLengths.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_sessionLengths->list[a3];
}

- (void)setSessionLengths:(int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)sessionIndexsCount
{
  return self->_sessionIndexs.count;
}

- (int)sessionIndexs
{
  return self->_sessionIndexs.list;
}

- (void)clearSessionIndexs
{
}

- (void)addSessionIndex:(int)a3
{
}

- (int)sessionIndexAtIndex:(unint64_t)a3
{
  p_sessionIndexs = &self->_sessionIndexs;
  unint64_t count = self->_sessionIndexs.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_sessionIndexs->list[a3];
}

- (void)setSessionIndexs:(int *)a3 count:(unint64_t)a4
{
}

- (void)setNoMatchCount:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_noMatchCount = a3;
}

- (void)setHasNoMatchCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNoMatchCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (unint64_t)launchReasonsCount
{
  return self->_launchReasons.count;
}

- (int)launchReasons
{
  return self->_launchReasons.list;
}

- (void)clearLaunchReasons
{
}

- (void)addLaunchReason:(int)a3
{
}

- (int)launchReasonAtIndex:(unint64_t)a3
{
  p_launchReasons = &self->_launchReasons;
  unint64_t count = self->_launchReasons.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_launchReasons->list[a3];
}

- (void)setLaunchReasons:(int *)a3 count:(unint64_t)a4
{
}

- (id)launchReasonsAsString:(int)a3
{
  if (a3 >= 0x35)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E68AC478[a3];
  }
  return v3;
}

- (int)StringAsLaunchReasons:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ATXLaunchReasonUnknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonPrefix"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonHomeScreen"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonSpotlight"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonAppSwitcher"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonSideAppSwitcher"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonNotificationCenter"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonControlCenter"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonNotification"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonLockScreen"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonSiri"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonCarPlay"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonSystemGesture"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonExternalRequest"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonBreadcrumb"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonCommandTab"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonAccessibility"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonWidget"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonFloatingDock"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonFloatingDockRecents"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonFloatingApplication"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonFloatingDockAppSuggestion"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonBacklightPrefix"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonBacklightProgrammatic"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonBacklightHomeButton"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonBacklightLockButton"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonBacklightVolumeButton"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonBacklightOtherButton"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonBacklightKeyboard"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonBacklightSmartCover"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonBacklightIdleTimer"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonBacklightTouch"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonBacklightPlugin"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonBacklightCar"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonBacklightNotification"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonBacklightProx"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonBacklightSiri"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonBacklightBoot"])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonBacklightPocketState"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonBacklightExternalRequest"])
  {
    int v4 = 39;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonBacklightExternalAppRequest"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonBacklightSpringBoardRequest"])
  {
    int v4 = 41;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonBacklightLiftToWake"])
  {
    int v4 = 42;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonBacklightLogout"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonBacklightNotificationCenter"])
  {
    int v4 = 44;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonBacklightACPowerChange"])
  {
    int v4 = 45;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonBacklightChargingAccessoryChange"])
  {
    int v4 = 46;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonBacklightRestoring"])
  {
    int v4 = 47;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonBacklightAlert"])
  {
    int v4 = 48;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonBacklightLanguageChange"])
  {
    int v4 = 49;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonBacklightUnknownUserEvent"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonBacklightCoverSheet"])
  {
    int v4 = 51;
  }
  else if ([v3 isEqualToString:@"ATXLaunchReasonBacklightSOSDismiss"])
  {
    int v4 = 52;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AWDProactiveAppPredictionActionTimeEstimateContainer;
  int v4 = [(AWDProactiveAppPredictionActionTimeEstimateContainer *)&v8 description];
  v5 = [(AWDProactiveAppPredictionActionTimeEstimateContainer *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = v3;
  actionKey = self->_actionKey;
  if (actionKey) {
    [v3 setObject:actionKey forKey:@"actionKey"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t actionType = self->_actionType;
    if (actionType >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_actionType);
      uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v7 = off_1E68AC448[actionType];
    }
    [v4 setObject:v7 forKey:@"actionType"];
  }
  parameters = self->_parameters;
  if (parameters) {
    [v4 setObject:parameters forKey:@"parameter"];
  }
  v9 = PBRepeatedInt32NSArray();
  [v4 setObject:v9 forKey:@"timeEstimate"];

  v10 = PBRepeatedInt32NSArray();
  [v4 setObject:v10 forKey:@"sessionLength"];

  v11 = PBRepeatedInt32NSArray();
  [v4 setObject:v11 forKey:@"sessionIndex"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v12 = [NSNumber numberWithInt:self->_noMatchCount];
    [v4 setObject:v12 forKey:@"noMatchCount"];
  }
  p_launchReasons = &self->_launchReasons;
  if (self->_launchReasons.count)
  {
    v14 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    if (p_launchReasons->count)
    {
      unint64_t v15 = 0;
      do
      {
        uint64_t v16 = p_launchReasons->list[v15];
        if (v16 >= 0x35)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", p_launchReasons->list[v15]);
          v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v17 = off_1E68AC478[v16];
        }
        [v14 addObject:v17];

        ++v15;
      }
      while (v15 < p_launchReasons->count);
    }
    [v4 setObject:v14 forKey:@"launchReason"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDProactiveAppPredictionActionTimeEstimateContainerReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_actionKey) {
    -[AWDProactiveAppPredictionActionTimeEstimateContainer writeTo:]();
  }
  v5 = v4;
  PBDataWriterWriteStringField();
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = self->_parameters;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  if (self->_timeEstimates.count)
  {
    unint64_t v11 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v11;
    }
    while (v11 < self->_timeEstimates.count);
  }
  if (self->_sessionLengths.count)
  {
    unint64_t v12 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v12;
    }
    while (v12 < self->_sessionLengths.count);
  }
  if (self->_sessionIndexs.count)
  {
    unint64_t v13 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v13;
    }
    while (v13 < self->_sessionIndexs.count);
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  p_launchReasons = &self->_launchReasons;
  if (p_launchReasons->count)
  {
    unint64_t v15 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v15;
    }
    while (v15 < p_launchReasons->count);
  }
}

- (void)copyTo:(id)a3
{
  id v20 = a3;
  [v20 setActionKey:self->_actionKey];
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v20 + 28) = self->_actionType;
    *((unsigned char *)v20 + 128) |= 1u;
  }
  if ([(AWDProactiveAppPredictionActionTimeEstimateContainer *)self parametersCount])
  {
    [v20 clearParameters];
    unint64_t v4 = [(AWDProactiveAppPredictionActionTimeEstimateContainer *)self parametersCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(AWDProactiveAppPredictionActionTimeEstimateContainer *)self parameterAtIndex:i];
        [v20 addParameter:v7];
      }
    }
  }
  if ([(AWDProactiveAppPredictionActionTimeEstimateContainer *)self timeEstimatesCount])
  {
    [v20 clearTimeEstimates];
    unint64_t v8 = [(AWDProactiveAppPredictionActionTimeEstimateContainer *)self timeEstimatesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
        objc_msgSend(v20, "addTimeEstimate:", -[AWDProactiveAppPredictionActionTimeEstimateContainer timeEstimateAtIndex:](self, "timeEstimateAtIndex:", j));
    }
  }
  if ([(AWDProactiveAppPredictionActionTimeEstimateContainer *)self sessionLengthsCount])
  {
    [v20 clearSessionLengths];
    unint64_t v11 = [(AWDProactiveAppPredictionActionTimeEstimateContainer *)self sessionLengthsCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t k = 0; k != v12; ++k)
        objc_msgSend(v20, "addSessionLength:", -[AWDProactiveAppPredictionActionTimeEstimateContainer sessionLengthAtIndex:](self, "sessionLengthAtIndex:", k));
    }
  }
  if ([(AWDProactiveAppPredictionActionTimeEstimateContainer *)self sessionIndexsCount])
  {
    [v20 clearSessionIndexs];
    unint64_t v14 = [(AWDProactiveAppPredictionActionTimeEstimateContainer *)self sessionIndexsCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t m = 0; m != v15; ++m)
        objc_msgSend(v20, "addSessionIndex:", -[AWDProactiveAppPredictionActionTimeEstimateContainer sessionIndexAtIndex:](self, "sessionIndexAtIndex:", m));
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v20 + 29) = self->_noMatchCount;
    *((unsigned char *)v20 + 128) |= 2u;
  }
  if ([(AWDProactiveAppPredictionActionTimeEstimateContainer *)self launchReasonsCount])
  {
    [v20 clearLaunchReasons];
    unint64_t v17 = [(AWDProactiveAppPredictionActionTimeEstimateContainer *)self launchReasonsCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t n = 0; n != v18; ++n)
        objc_msgSend(v20, "addLaunchReason:", -[AWDProactiveAppPredictionActionTimeEstimateContainer launchReasonAtIndex:](self, "launchReasonAtIndex:", n));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_actionKey copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 112) = self->_actionType;
    *(unsigned char *)(v5 + 128) |= 1u;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unint64_t v8 = self->_parameters;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        unint64_t v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "copyWithZone:", a3, (void)v15);
        [(id)v5 addParameter:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 116) = self->_noMatchCount;
    *(unsigned char *)(v5 + 128) |= 2u;
  }
  PBRepeatedInt32Copy();
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  actionKey = self->_actionKey;
  if ((unint64_t)actionKey | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](actionKey, "isEqual:")) {
      goto LABEL_20;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 128) & 1) == 0 || self->_actionType != *((_DWORD *)v4 + 28)) {
      goto LABEL_20;
    }
  }
  else if (*((unsigned char *)v4 + 128))
  {
LABEL_20:
    char IsEqual = 0;
    goto LABEL_21;
  }
  parameters = self->_parameters;
  if ((unint64_t)parameters | *((void *)v4 + 15)
    && !-[NSMutableArray isEqual:](parameters, "isEqual:")
    || !PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual())
  {
    goto LABEL_20;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 128) & 2) == 0 || self->_noMatchCount != *((_DWORD *)v4 + 29)) {
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)v4 + 128) & 2) != 0)
  {
    goto LABEL_20;
  }
  char IsEqual = PBRepeatedInt32IsEqual();
LABEL_21:

  return IsEqual;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_actionKey hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_actionType;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = [(NSMutableArray *)self->_parameters hash];
  uint64_t v6 = PBRepeatedInt32Hash();
  uint64_t v7 = PBRepeatedInt32Hash();
  uint64_t v8 = PBRepeatedInt32Hash();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v9 = 2654435761 * self->_noMatchCount;
  }
  else {
    uint64_t v9 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ PBRepeatedInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 13)) {
    -[AWDProactiveAppPredictionActionTimeEstimateContainer setActionKey:](self, "setActionKey:");
  }
  if (*((unsigned char *)v4 + 128))
  {
    self->_uint64_t actionType = *((_DWORD *)v4 + 28);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = *((id *)v4 + 15);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        -[AWDProactiveAppPredictionActionTimeEstimateContainer addParameter:](self, "addParameter:", *(void *)(*((void *)&v22 + 1) + 8 * i), (void)v22);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [v4 timeEstimatesCount];
  if (v10)
  {
    uint64_t v11 = v10;
    for (uint64_t j = 0; j != v11; ++j)
      -[AWDProactiveAppPredictionActionTimeEstimateContainer addTimeEstimate:](self, "addTimeEstimate:", objc_msgSend(v4, "timeEstimateAtIndex:", j, (void)v22));
  }
  uint64_t v13 = objc_msgSend(v4, "sessionLengthsCount", (void)v22);
  if (v13)
  {
    uint64_t v14 = v13;
    for (uint64_t k = 0; k != v14; ++k)
      -[AWDProactiveAppPredictionActionTimeEstimateContainer addSessionLength:](self, "addSessionLength:", [v4 sessionLengthAtIndex:k]);
  }
  uint64_t v16 = [v4 sessionIndexsCount];
  if (v16)
  {
    uint64_t v17 = v16;
    for (uint64_t m = 0; m != v17; ++m)
      -[AWDProactiveAppPredictionActionTimeEstimateContainer addSessionIndex:](self, "addSessionIndex:", [v4 sessionIndexAtIndex:m]);
  }
  if ((*((unsigned char *)v4 + 128) & 2) != 0)
  {
    self->_noMatchCount = *((_DWORD *)v4 + 29);
    *(unsigned char *)&self->_has |= 2u;
  }
  uint64_t v19 = [v4 launchReasonsCount];
  if (v19)
  {
    uint64_t v20 = v19;
    for (uint64_t n = 0; n != v20; ++n)
      -[AWDProactiveAppPredictionActionTimeEstimateContainer addLaunchReason:](self, "addLaunchReason:", [v4 launchReasonAtIndex:n]);
  }
}

- (NSString)actionKey
{
  return self->_actionKey;
}

- (void)setActionKey:(id)a3
{
}

- (NSMutableArray)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
}

- (int)noMatchCount
{
  return self->_noMatchCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_actionKey, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[AWDProactiveAppPredictionActionTimeEstimateContainer writeTo:]", "AWDProactiveAppPredictionActionTimeEstimateContainer.m", 402, "nil != self->_actionKey");
}

@end