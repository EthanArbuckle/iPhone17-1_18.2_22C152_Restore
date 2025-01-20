@interface HMWeekDayScheduleRule
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (BOOL)validTimes:(id)a3 endTime:(id)a4;
- (HMWeekDayScheduleRule)initWithCoder:(id)a3;
- (HMWeekDayScheduleRule)initWithDictionary:(id)a3;
- (HMWeekDayScheduleRule)initWithStartTime:(id)a3 endTime:(id)a4;
- (HMWeekDayScheduleRule)initWithStartTime:(id)a3 endTime:(id)a4 daysOfTheWeek:(unint64_t)a5;
- (NSArray)attributeDescriptions;
- (NSDateComponents)endTime;
- (NSDateComponents)startTime;
- (NSString)description;
- (NSString)shortDescription;
- (id)dictionaryRepresentation;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)daysOfTheWeek;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDaysOfTheWeek:(unint64_t)a3;
- (void)setEndTime:(id)a3;
- (void)setStartTime:(id)a3;
@end

@implementation HMWeekDayScheduleRule

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);

  objc_storeStrong((id *)&self->_startTime, 0);
}

- (void)setDaysOfTheWeek:(unint64_t)a3
{
  self->_daysOfTheWeek = a3;
}

- (unint64_t)daysOfTheWeek
{
  return self->_daysOfTheWeek;
}

- (void)setEndTime:(id)a3
{
}

- (NSDateComponents)endTime
{
  return (NSDateComponents *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStartTime:(id)a3
{
}

- (NSDateComponents)startTime
{
  return (NSDateComponents *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)attributeDescriptions
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMWeekDayScheduleRule *)self startTime];
  v5 = (void *)[v3 initWithName:@"startTime" value:v4];
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMWeekDayScheduleRule *)self endTime];
  v8 = (void *)[v6 initWithName:@"endTime" value:v7];
  v14[1] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  v10 = HMDaysOfTheWeekToConciseString([(HMWeekDayScheduleRule *)self daysOfTheWeek]);
  v11 = (void *)[v9 initWithName:@"daysOfTheWeek" value:v10];
  v14[2] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];

  return (NSArray *)v12;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (HMWeekDayScheduleRule)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMWeekDayScheduleRuleCodingKeyStartTime"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMWeekDayScheduleRuleCodingKeyEndTime"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMWeekDayScheduleRuleCodingKeyDaysOfTheWeek"];

  v8 = -[HMWeekDayScheduleRule initWithStartTime:endTime:daysOfTheWeek:](self, "initWithStartTime:endTime:daysOfTheWeek:", v5, v6, [v7 unsignedIntegerValue]);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMWeekDayScheduleRule *)self startTime];
  [v4 encodeObject:v5 forKey:@"HMWeekDayScheduleRuleCodingKeyStartTime"];

  id v6 = [(HMWeekDayScheduleRule *)self endTime];
  [v4 encodeObject:v6 forKey:@"HMWeekDayScheduleRuleCodingKeyEndTime"];

  objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMWeekDayScheduleRule daysOfTheWeek](self, "daysOfTheWeek"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:@"HMWeekDayScheduleRuleCodingKeyDaysOfTheWeek"];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[HMMutableWeekDayScheduleRule allocWithZone:a3];
  v5 = [(HMWeekDayScheduleRule *)self startTime];
  id v6 = [(HMWeekDayScheduleRule *)self endTime];
  id v7 = [(HMWeekDayScheduleRule *)v4 initWithStartTime:v5 endTime:v6 daysOfTheWeek:[(HMWeekDayScheduleRule *)self daysOfTheWeek]];

  return v7;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMWeekDayScheduleRule)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "hmf_numberForKey:", @"HMWeekDayScheduleRuleCodingKeyStartTime");
  id v6 = objc_msgSend(v4, "hmf_numberForKey:", @"HMWeekDayScheduleRuleCodingKeyEndTime");
  id v7 = objc_msgSend(v4, "hmf_numberForKey:", @"HMWeekDayScheduleRuleCodingKeyDaysOfTheWeek");

  v8 = HMDateComponentFromSecondsOfDay(v5);
  id v9 = HMDateComponentFromSecondsOfDay(v6);
  v10 = -[HMWeekDayScheduleRule initWithStartTime:endTime:daysOfTheWeek:](self, "initWithStartTime:endTime:daysOfTheWeek:", v8, v9, [v7 unsignedIntegerValue]);

  return v10;
}

- (id)dictionaryRepresentation
{
  v14[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HMWeekDayScheduleRule *)self startTime];
  if (v3
    && (id v4 = (void *)v3,
        [(HMWeekDayScheduleRule *)self endTime],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    v13[0] = @"HMWeekDayScheduleRuleCodingKeyStartTime";
    id v6 = [(HMWeekDayScheduleRule *)self startTime];
    id v7 = HMSecondsFromDateComponent(v6);
    v14[0] = v7;
    v13[1] = @"HMWeekDayScheduleRuleCodingKeyEndTime";
    v8 = [(HMWeekDayScheduleRule *)self endTime];
    id v9 = HMSecondsFromDateComponent(v8);
    v14[1] = v9;
    v13[2] = @"HMWeekDayScheduleRuleCodingKeyDaysOfTheWeek";
    v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMWeekDayScheduleRule daysOfTheWeek](self, "daysOfTheWeek"));
    v14[2] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3 = [(HMWeekDayScheduleRule *)self startTime];
  uint64_t v4 = [v3 hash];
  v5 = [(HMWeekDayScheduleRule *)self endTime];
  uint64_t v6 = [v5 hash] ^ v4;
  unint64_t v7 = v6 ^ [(HMWeekDayScheduleRule *)self daysOfTheWeek];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    unint64_t v7 = [(HMWeekDayScheduleRule *)self startTime];
    uint64_t v8 = [v7 hour];
    id v9 = [v6 startTime];
    if (v8 == [v9 hour])
    {
      v10 = [(HMWeekDayScheduleRule *)self startTime];
      uint64_t v11 = [v10 minute];
      v12 = [v6 startTime];
      if (v11 == [v12 minute])
      {
        v13 = [(HMWeekDayScheduleRule *)self endTime];
        uint64_t v14 = [v13 hour];
        v15 = [v6 endTime];
        if (v14 == [v15 hour])
        {
          v21 = [(HMWeekDayScheduleRule *)self endTime];
          uint64_t v16 = [v21 minute];
          v20 = [v6 endTime];
          if (v16 == [v20 minute])
          {
            unint64_t v17 = [(HMWeekDayScheduleRule *)self daysOfTheWeek];
            BOOL v18 = v17 == [v6 daysOfTheWeek];
          }
          else
          {
            BOOL v18 = 0;
          }
        }
        else
        {
          BOOL v18 = 0;
        }
      }
      else
      {
        BOOL v18 = 0;
      }
    }
    else
    {
      BOOL v18 = 0;
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (HMWeekDayScheduleRule)initWithStartTime:(id)a3 endTime:(id)a4
{
  return [(HMWeekDayScheduleRule *)self initWithStartTime:a3 endTime:a4 daysOfTheWeek:127];
}

- (HMWeekDayScheduleRule)initWithStartTime:(id)a3 endTime:(id)a4 daysOfTheWeek:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HMWeekDayScheduleRule;
  v10 = [(HMWeekDayScheduleRule *)&v18 init];
  uint64_t v11 = v10;
  if (!v10)
  {
LABEL_7:
    v12 = v11;
    goto LABEL_9;
  }
  v12 = 0;
  if (v8 && v9 && a5)
  {
    if (![(HMWeekDayScheduleRule *)v10 validTimes:v8 endTime:v9])
    {
      v12 = 0;
      goto LABEL_9;
    }
    v13 = (NSDateComponents *)objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    startTime = v11->_startTime;
    v11->_startTime = v13;

    -[NSDateComponents setHour:](v11->_startTime, "setHour:", [v8 hour]);
    -[NSDateComponents setMinute:](v11->_startTime, "setMinute:", [v8 minute]);
    v15 = (NSDateComponents *)objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    endTime = v11->_endTime;
    v11->_endTime = v15;

    -[NSDateComponents setHour:](v11->_endTime, "setHour:", [v9 hour]);
    -[NSDateComponents setMinute:](v11->_endTime, "setMinute:", [v9 minute]);
    v11->_daysOfTheWeek = a5;
    goto LABEL_7;
  }
LABEL_9:

  return v12;
}

- (BOOL)validTimes:(id)a3 endTime:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v10 = 0;
  if (([v5 hour] & 0x8000000000000000) == 0
    && [v5 hour] <= 23
    && ([v5 minute] & 0x8000000000000000) == 0
    && [v5 minute] <= 59
    && ([v6 hour] & 0x8000000000000000) == 0
    && [v6 hour] <= 23
    && ([v6 minute] & 0x8000000000000000) == 0
    && [v6 minute] <= 59)
  {
    uint64_t v7 = [v6 hour];
    if (v7 >= [v5 hour])
    {
      uint64_t v8 = [v6 hour];
      if (v8 != [v5 hour] || (uint64_t v9 = objc_msgSend(v6, "minute"), v9 > objc_msgSend(v5, "minute"))) {
        BOOL v10 = 1;
      }
    }
  }

  return v10;
}

@end