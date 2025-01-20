@interface RTPeopleCountEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSUUID)eventID;
- (RTPeopleCountEvent)init;
- (RTPeopleCountEvent)initWithCoder:(id)a3;
- (RTPeopleCountEvent)initWithEventID:(id)a3 startDate:(id)a4 endDate:(id)a5 totalCount:(unint64_t)a6 familyCount:(unint64_t)a7 friendsCount:(unint64_t)a8;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionDictionary;
- (unint64_t)familyCount;
- (unint64_t)friendsCount;
- (unint64_t)totalCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTPeopleCountEvent

- (RTPeopleCountEvent)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithEventID_startDate_endDate_totalCount_familyCount_friendsCount_);
}

- (RTPeopleCountEvent)initWithEventID:(id)a3 startDate:(id)a4 endDate:(id)a5 totalCount:(unint64_t)a6 familyCount:(unint64_t)a7 friendsCount:(unint64_t)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  if (!v15)
  {
    v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v20 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v22 = "Invalid parameter not satisfying: eventID";
LABEL_12:
    _os_log_error_impl(&dword_1A8FEF000, v21, OS_LOG_TYPE_ERROR, v22, buf, 2u);
    goto LABEL_9;
  }
  if (!v16)
  {
    v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    v22 = "Invalid parameter not satisfying: startDate";
    goto LABEL_12;
  }
  v24.receiver = self;
  v24.super_class = (Class)RTPeopleCountEvent;
  v18 = [(RTPeopleCountEvent *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_eventID, a3);
    objc_storeStrong((id *)&v19->_startDate, a4);
    objc_storeStrong((id *)&v19->_endDate, a5);
    v19->_totalCount = a6;
    v19->_familyCount = a7;
    v19->_friendsCount = a8;
  }
  self = v19;
  v20 = self;
LABEL_10:

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RTPeopleCountEvent *)a3;
  if (v4 == self)
  {
    BOOL v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(RTPeopleCountEvent *)self eventID];
      v7 = [(RTPeopleCountEvent *)v5 eventID];
      if ([v6 isEqual:v7])
      {
        v8 = [(RTPeopleCountEvent *)self startDate];
        v9 = [(RTPeopleCountEvent *)v5 startDate];
        if ([v8 isEqualToDate:v9])
        {
          v10 = [(RTPeopleCountEvent *)self endDate];
          v11 = [(RTPeopleCountEvent *)v5 endDate];
          if ([v10 isEqualToDate:v11]
            && (unint64_t v12 = [(RTPeopleCountEvent *)self totalCount],
                v12 == [(RTPeopleCountEvent *)v5 totalCount])
            && (unint64_t v13 = [(RTPeopleCountEvent *)self familyCount],
                v13 == [(RTPeopleCountEvent *)v5 familyCount]))
          {
            unint64_t v14 = [(RTPeopleCountEvent *)self friendsCount];
            BOOL v15 = v14 == [(RTPeopleCountEvent *)v5 friendsCount];
          }
          else
          {
            BOOL v15 = 0;
          }
        }
        else
        {
          BOOL v15 = 0;
        }
      }
      else
      {
        BOOL v15 = 0;
      }
    }
    else
    {
      BOOL v15 = 0;
    }
  }

  return v15;
}

- (id)descriptionDictionary
{
  v14[6] = *MEMORY[0x1E4F143B8];
  v13[0] = @"EventID";
  v3 = [(NSUUID *)self->_eventID UUIDString];
  v14[0] = v3;
  v13[1] = @"StartDate";
  startDate = self->_startDate;
  if (startDate)
  {
    v5 = [(NSDate *)self->_startDate getFormattedDateString];
  }
  else
  {
    v5 = @"-";
  }
  v14[1] = v5;
  v13[2] = @"EndDate";
  endDate = self->_endDate;
  if (endDate)
  {
    v7 = [(NSDate *)self->_endDate getFormattedDateString];
  }
  else
  {
    v7 = @"-";
  }
  v14[2] = v7;
  v13[3] = @"TotalCount";
  v8 = [NSNumber numberWithUnsignedInteger:self->_totalCount];
  v14[3] = v8;
  v13[4] = @"FamilyCount";
  v9 = [NSNumber numberWithUnsignedInteger:self->_familyCount];
  v14[4] = v9;
  v13[5] = @"FriendsCount";
  v10 = [NSNumber numberWithUnsignedInteger:self->_friendsCount];
  v14[5] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:6];

  if (endDate) {
  if (startDate)
  }

  return v11;
}

- (id)description
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(RTPeopleCountEvent *)self descriptionDictionary];
  id v11 = 0;
  v3 = [MEMORY[0x1E4F28D90] JSONStringFromNSDictionary:v2 error:&v11];
  id v4 = v11;
  if (v4)
  {
    v5 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138412546;
      unint64_t v13 = v10;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_error_impl(&dword_1A8FEF000, v5, OS_LOG_TYPE_ERROR, "%@ instance failed to create description:%@", buf, 0x16u);
    }
    id v6 = [NSString string];
  }
  else
  {
    id v6 = v3;
  }
  v7 = v6;

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(RTPeopleCountEvent *)self eventID];
  id v6 = [(RTPeopleCountEvent *)self startDate];
  v7 = [(RTPeopleCountEvent *)self endDate];
  v8 = (void *)[v4 initWithEventID:v5 startDate:v6 endDate:v7 totalCount:self->_totalCount familyCount:self->_familyCount friendsCount:self->_friendsCount];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTPeopleCountEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EventID"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"StartDate"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EndDate"];
  uint64_t v8 = (int)[v4 decodeIntForKey:@"TotalCount"];
  uint64_t v9 = (int)[v4 decodeIntForKey:@"FamilyCount"];
  int v10 = [v4 decodeIntForKey:@"FriendsCount"];

  id v11 = [(RTPeopleCountEvent *)self initWithEventID:v5 startDate:v6 endDate:v7 totalCount:v8 familyCount:v9 friendsCount:v10];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  eventID = self->_eventID;
  id v5 = a3;
  [v5 encodeObject:eventID forKey:@"EventID"];
  [v5 encodeObject:self->_startDate forKey:@"StartDate"];
  [v5 encodeObject:self->_endDate forKey:@"EndDate"];
  [v5 encodeInteger:self->_totalCount forKey:@"TotalCount"];
  [v5 encodeInteger:self->_familyCount forKey:@"FamilyCount"];
  [v5 encodeInteger:self->_friendsCount forKey:@"FriendsCount"];
}

- (NSUUID)eventID
{
  return self->_eventID;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (unint64_t)totalCount
{
  return self->_totalCount;
}

- (unint64_t)familyCount
{
  return self->_familyCount;
}

- (unint64_t)friendsCount
{
  return self->_friendsCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_eventID, 0);
}

@end