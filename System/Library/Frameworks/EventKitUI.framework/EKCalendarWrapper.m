@interface EKCalendarWrapper
+ (BOOL)supportsSecureCoding;
- (EKCalendarWrapper)initWithCalendar:(id)a3;
- (EKCalendarWrapper)initWithCoder:(id)a3;
- (id)calendarInEventStore:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EKCalendarWrapper

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  calendarObjectID = self->_calendarObjectID;
  id v8 = v4;
  if (calendarObjectID)
  {
    [v4 encodeObject:calendarObjectID forKey:@"objectID"];
    id v4 = v8;
  }
  calendarIdentifier = self->_calendarIdentifier;
  if (calendarIdentifier)
  {
    [v8 encodeObject:calendarIdentifier forKey:@"calendarIdentifier"];
    id v4 = v8;
  }
  constraints = self->_constraints;
  if (constraints)
  {
    [v8 encodeObject:constraints forKey:@"constraints"];
    id v4 = v8;
  }
}

- (EKCalendarWrapper)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EKCalendarWrapper;
  v5 = [(EKCalendarWrapper *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"objectID"];
    calendarObjectID = v5->_calendarObjectID;
    v5->_calendarObjectID = (EKObjectID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"calendarIdentifier"];
    calendarIdentifier = v5->_calendarIdentifier;
    v5->_calendarIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"constraints"];
    constraints = v5->_constraints;
    v5->_constraints = (EKSourceConstraints *)v10;
  }
  return v5;
}

- (EKCalendarWrapper)initWithCalendar:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EKCalendarWrapper;
  v5 = [(EKCalendarWrapper *)&v12 init];
  if (v5)
  {
    if ([v4 allowEvents])
    {
      uint64_t v6 = [v4 objectID];
      calendarObjectID = v5->_calendarObjectID;
      v5->_calendarObjectID = (EKObjectID *)v6;

      uint64_t v8 = [v4 constraints];
      constraints = v5->_constraints;
      v5->_constraints = (EKSourceConstraints *)v8;
    }
    else
    {
      uint64_t v10 = [v4 calendarIdentifier];
      constraints = v5->_calendarIdentifier;
      v5->_calendarIdentifier = (NSString *)v10;
    }
  }
  return v5;
}

- (id)calendarInEventStore:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_calendarObjectID)
  {
    uint64_t v6 = objc_msgSend(v4, "publicObjectWithObjectID:");
    v7 = v6;
    if (v6)
    {
      constraints = self->_constraints;
      if (constraints)
      {
        v9 = [v6 CADObjectID];
        [v5 cacheConstraints:constraints forObjectWithCADObjectID:v9];
      }
      id v10 = v7;
    }
  }
  else
  {
    v7 = [v4 calendarWithIdentifier:self->_calendarIdentifier];
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_calendarObjectID, 0);

  objc_storeStrong((id *)&self->_calendarIdentifier, 0);
}

@end