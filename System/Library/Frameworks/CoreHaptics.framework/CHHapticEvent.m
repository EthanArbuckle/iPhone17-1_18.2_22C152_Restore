@interface CHHapticEvent
+ (BOOL)parameterValuesFromLegacyEventType:(unint64_t)a3 sharpness:(float *)a4 fullness:(float *)a5 error:(id *)a6;
- (CHHapticEvent)init;
- (CHHapticEvent)initWithAudioResourceID:(CHHapticAudioResourceID)resID parameters:(NSArray *)eventParams relativeTime:(NSTimeInterval)time;
- (CHHapticEvent)initWithAudioResourceID:(CHHapticAudioResourceID)resID parameters:(NSArray *)eventParams relativeTime:(NSTimeInterval)time duration:(NSTimeInterval)duration;
- (CHHapticEvent)initWithAudioResourceIndex:(unint64_t)a3 parameters:(id)a4 time:(double)a5 duration:(double)a6;
- (CHHapticEvent)initWithEventType:(CHHapticEventType)type parameters:(NSArray *)eventParams relativeTime:(NSTimeInterval)time;
- (CHHapticEvent)initWithEventType:(CHHapticEventType)type parameters:(NSArray *)eventParams relativeTime:(NSTimeInterval)time duration:(NSTimeInterval)duration;
- (CHHapticEventType)type;
- (NSArray)eventParameters;
- (NSArray)events;
- (NSArray)parameterCurves;
- (NSArray)parameters;
- (NSString)audioPowerUsage;
- (NSString)hapticPowerUsage;
- (NSString)locality;
- (NSString)patternID;
- (NSString)priority;
- (NSString)usageCategory;
- (NSTimeInterval)duration;
- (NSTimeInterval)relativeTime;
- (double)fullDuration;
- (id)getType;
- (id)resolveExternalResources:(id)a3 error:(id *)a4;
- (unint64_t)audioResID;
- (void)setDuration:(NSTimeInterval)duration;
- (void)setRelativeTime:(NSTimeInterval)relativeTime;
@end

@implementation CHHapticEvent

- (CHHapticEventType)type
{
  return (CHHapticEventType)objc_getProperty(self, a2, 8, 1);
}

- (NSTimeInterval)relativeTime
{
  return self->_time;
}

- (CHHapticEvent)initWithEventType:(CHHapticEventType)type parameters:(NSArray *)eventParams relativeTime:(NSTimeInterval)time duration:(NSTimeInterval)duration
{
  v11 = type;
  v12 = eventParams;
  v18.receiver = self;
  v18.super_class = (Class)CHHapticEvent;
  v13 = [(CHHapticEvent *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_type, type);
    v14->_audioResID = -1;
    uint64_t v15 = [(NSArray *)v12 copy];
    v16 = v14->_eventParams;
    v14->_eventParams = (NSArray *)v15;

    v14->_time = time;
    v14->_duration = duration;
  }

  return v14;
}

- (CHHapticEvent)initWithEventType:(CHHapticEventType)type parameters:(NSArray *)eventParams relativeTime:(NSTimeInterval)time
{
  return [(CHHapticEvent *)self initWithEventType:type parameters:eventParams relativeTime:time duration:0.0];
}

- (double)fullDuration
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (self->_type == CHHapticEventTypeHapticTransient)
  {
    float v15 = 0.0;
    return self->_duration + v15;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v3 = self->_eventParams;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v4)
  {

    float v6 = 0.0;
LABEL_23:
    float v15 = v6;
    return self->_duration + v15;
  }
  uint64_t v5 = *(void *)v19;
  float v6 = 0.0;
  BOOL v17 = 1;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v19 != v5) {
        objc_enumerationMutation(v3);
      }
      v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      v9 = [v8 parameterID];
      int v10 = [v9 isEqualToString:CHHapticEventParameterIDReleaseTime];

      if (v10)
      {
        if ([(NSString *)self->_type isEqualToString:CHHapticEventTypeHapticContinuous]
          || [(NSString *)self->_type isEqualToString:CHHapticEventTypeAudioContinuous]
          || [(NSString *)self->_type isEqualToString:CHHapticEventTypeAudioResourceIndex]
          || [(NSString *)self->_type isEqualToString:CHHapticEventTypeAudioCustom])
        {
          [v8 value];
          float v6 = exp2(v14 * 8.0) * 0.02;
        }
        float v6 = v6 + -0.04;
      }
      else
      {
        v11 = [v8 parameterID];
        int v12 = [v11 isEqualToString:CHHapticEventParameterIDSustained];

        if (v12)
        {
          [v8 value];
          BOOL v17 = v13 != 0.0;
        }
      }
    }
    uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  }
  while (v4);

  float v15 = 0.0;
  if (v17) {
    goto LABEL_23;
  }
  return self->_duration + v15;
}

- (NSArray)eventParameters
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSTimeInterval)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventParams, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

+ (BOOL)parameterValuesFromLegacyEventType:(unint64_t)a3 sharpness:(float *)a4 fullness:(float *)a5 error:(id *)a6
{
  LODWORD(v6) = -1.0;
  if ((uint64_t)a3 > 20308)
  {
    if ((uint64_t)a3 <= 26452)
    {
      if ((uint64_t)a3 <= 23380)
      {
        if (a3 != 20309)
        {
          if (a3 == 20310)
          {
            LODWORD(v6) = 0;
          }
          else
          {
            if (a3 != 20311) {
              goto LABEL_56;
            }
            LODWORD(v6) = 1.0;
          }
        }
        float v8 = 0.14286;
        goto LABEL_55;
      }
      if (a3 != 23381)
      {
        if (a3 == 23382)
        {
          LODWORD(v6) = 0;
        }
        else
        {
          if (a3 != 23383) {
            goto LABEL_56;
          }
          LODWORD(v6) = 1.0;
        }
      }
      float v8 = 0.42857;
      goto LABEL_55;
    }
    if ((uint64_t)a3 <= 29524)
    {
      if (a3 != 26453)
      {
        if (a3 == 26454)
        {
          LODWORD(v6) = 0;
        }
        else
        {
          if (a3 != 26455) {
            goto LABEL_56;
          }
          LODWORD(v6) = 1.0;
        }
      }
      float v8 = 0.71429;
      goto LABEL_55;
    }
    if (a3 == 29525 || a3 == 29526)
    {
      LODWORD(v6) = 0;
      float v8 = 1.0;
    }
    else
    {
      if (a3 != 29527) {
        goto LABEL_56;
      }
      float v8 = 1.0;
      LODWORD(v6) = 1.0;
    }
LABEL_55:
    *a4 = v8;
    *a5 = *(float *)&v6;
    return 1;
  }
  if ((uint64_t)a3 > 14164)
  {
    if ((uint64_t)a3 <= 17236)
    {
      if (a3 != 14165)
      {
        if (a3 == 14166)
        {
          LODWORD(v6) = 0;
        }
        else
        {
          if (a3 != 14167) {
            goto LABEL_56;
          }
          LODWORD(v6) = 1.0;
        }
      }
      float v8 = -0.42857;
      goto LABEL_55;
    }
    if (a3 != 17237)
    {
      if (a3 == 17238)
      {
        LODWORD(v6) = 0;
      }
      else
      {
        if (a3 != 17239) {
          goto LABEL_56;
        }
        LODWORD(v6) = 1.0;
      }
    }
    float v8 = -0.14286;
    goto LABEL_55;
  }
  if ((uint64_t)a3 > 11092)
  {
    if (a3 != 11093)
    {
      if (a3 == 11094)
      {
        LODWORD(v6) = 0;
      }
      else
      {
        if (a3 != 11095) {
          goto LABEL_56;
        }
        LODWORD(v6) = 1.0;
      }
    }
    float v8 = -0.71429;
    goto LABEL_55;
  }
  switch(a3)
  {
    case 0x1F55uLL:
LABEL_42:
      float v8 = -1.0;
      goto LABEL_55;
    case 0x1F56uLL:
      LODWORD(v6) = 0;
      goto LABEL_42;
    case 0x1F57uLL:
      LODWORD(v6) = 1.0;
      goto LABEL_42;
  }
LABEL_56:
  if (!a6) {
    return 0;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"com.apple.CoreHaptics", -4820, 0, v6);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  BOOL result = 0;
  *a6 = v10;
  return result;
}

- (CHHapticEvent)init
{
  return 0;
}

- (CHHapticEvent)initWithAudioResourceID:(CHHapticAudioResourceID)resID parameters:(NSArray *)eventParams relativeTime:(NSTimeInterval)time
{
  float v8 = eventParams;
  v14.receiver = self;
  v14.super_class = (Class)CHHapticEvent;
  v9 = [(CHHapticEvent *)&v14 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_type, CHHapticEventTypeAudioCustom);
    v10->_audioResID = resID;
    uint64_t v11 = [(NSArray *)v8 copy];
    int v12 = v10->_eventParams;
    v10->_eventParams = (NSArray *)v11;

    v10->_time = time;
    v10->_duration = 0.0;
  }

  return v10;
}

- (CHHapticEvent)initWithAudioResourceID:(CHHapticAudioResourceID)resID parameters:(NSArray *)eventParams relativeTime:(NSTimeInterval)time duration:(NSTimeInterval)duration
{
  id v10 = eventParams;
  v16.receiver = self;
  v16.super_class = (Class)CHHapticEvent;
  uint64_t v11 = [(CHHapticEvent *)&v16 init];
  int v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_type, CHHapticEventTypeAudioCustom);
    v12->_audioResID = resID;
    uint64_t v13 = [(NSArray *)v10 copy];
    objc_super v14 = v12->_eventParams;
    v12->_eventParams = (NSArray *)v13;

    v12->_time = time;
    v12->_duration = duration;
  }

  return v12;
}

- (id)getType
{
  return self->_type;
}

- (NSArray)events
{
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithObject:self];
}

- (NSArray)parameters
{
  return 0;
}

- (NSArray)parameterCurves
{
  return 0;
}

- (NSString)patternID
{
  return 0;
}

- (NSString)locality
{
  return 0;
}

- (NSString)priority
{
  return (NSString *)@"LowPriority";
}

- (NSString)hapticPowerUsage
{
  return (NSString *)@"LowPower";
}

- (NSString)audioPowerUsage
{
  return (NSString *)@"LowPower";
}

- (NSString)usageCategory
{
  return 0;
}

- (id)resolveExternalResources:(id)a3 error:(id *)a4
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v5 = [(CHHapticEvent *)self events];
  double v6 = [v4 arrayWithArray:v5];

  return v6;
}

- (void)setRelativeTime:(NSTimeInterval)relativeTime
{
  self->_time = relativeTime;
}

- (void)setDuration:(NSTimeInterval)duration
{
  self->_duration = duration;
}

- (CHHapticEvent)initWithAudioResourceIndex:(unint64_t)a3 parameters:(id)a4 time:(double)a5 duration:(double)a6
{
  id v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CHHapticEvent;
  int v12 = [(CHHapticEvent *)&v15 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_type, CHHapticEventTypeAudioResourceIndex);
    v13->_audioResID = a3;
    objc_storeStrong((id *)&v13->_eventParams, a4);
    v13->_time = a5;
    v13->_duration = a6;
  }

  return v13;
}

- (unint64_t)audioResID
{
  return self->_audioResID;
}

@end