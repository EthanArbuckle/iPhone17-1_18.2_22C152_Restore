@interface CLSEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasMeetingRoom;
- (BOOL)isAccepted;
- (BOOL)isOrganizedByMe;
- (CLLocation)location;
- (CLSEvent)initWithCoder:(id)a3;
- (NSArray)attendees;
- (NSArray)performers;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)title;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAccepted:(BOOL)a3;
- (void)setAttendees:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setLocation:(id)a3;
- (void)setMeetingRoom:(BOOL)a3;
- (void)setOrganizedByMe:(BOOL)a3;
- (void)setPerformers:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation CLSEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_performers, 0);
  objc_storeStrong((id *)&self->_attendees, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setAccepted:(BOOL)a3
{
  self->_accepted = a3;
}

- (BOOL)isAccepted
{
  return self->_accepted;
}

- (void)setOrganizedByMe:(BOOL)a3
{
  self->_organizedByMe = a3;
}

- (BOOL)isOrganizedByMe
{
  return self->_organizedByMe;
}

- (void)setMeetingRoom:(BOOL)a3
{
  self->_meetingRoom = a3;
}

- (BOOL)hasMeetingRoom
{
  return self->_meetingRoom;
}

- (void)setEndDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setPerformers:(id)a3
{
}

- (NSArray)performers
{
  return self->_performers;
}

- (void)setAttendees:(id)a3
{
}

- (NSArray)attendees
{
  return self->_attendees;
}

- (void)setLocation:(id)a3
{
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (CLSEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CLSEvent;
  v5 = [(CLSEvent *)&v27 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"location"];
    location = v5->_location;
    v5->_location = (CLLocation *)v8;

    v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v10, "setWithObjects:", v11, v12, v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"attendees"];
    attendees = v5->_attendees;
    v5->_attendees = (NSArray *)v15;

    v17 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v18 = objc_opt_class();
    v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"performers"];
    performers = v5->_performers;
    v5->_performers = (NSArray *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v24;

    v5->_meetingRoom = [v4 decodeBoolForKey:@"meetingRoom"];
    v5->_organizedByMe = [v4 decodeBoolForKey:@"organizedByMe"];
    v5->_accepted = [v4 decodeBoolForKey:@"accepted"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"title"];
  [v5 encodeObject:self->_location forKey:@"location"];
  [v5 encodeObject:self->_attendees forKey:@"attendees"];
  [v5 encodeObject:self->_performers forKey:@"performers"];
  [v5 encodeObject:self->_startDate forKey:@"startDate"];
  [v5 encodeObject:self->_endDate forKey:@"endDate"];
  [v5 encodeBool:self->_meetingRoom forKey:@"meetingRoom"];
  [v5 encodeBool:self->_organizedByMe forKey:@"organizedByMe"];
  [v5 encodeBool:self->_accepted forKey:@"accepted"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  [v3 appendString:@"<CLSEvent>"];
  if (self->_title) {
    [v3 appendFormat:@" title:[%@]", self->_title];
  }
  if (self->_startDate) {
    [v3 appendFormat:@" dates:[%@", self->_startDate];
  }
  if (self->_endDate) {
    [v3 appendFormat:@"- %@]", self->_endDate];
  }
  if ([(NSArray *)self->_attendees count])
  {
    id v4 = [(NSArray *)self->_attendees valueForKeyPath:@"name"];
    id v5 = [v4 componentsJoinedByString:@", "];
    [v3 appendFormat:@"\n\t\tpeople:[%@]", v5];
  }
  if ([(NSArray *)self->_performers count])
  {
    uint64_t v6 = [(NSArray *)self->_performers componentsJoinedByString:@", "];
    [v3 appendFormat:@"\n\t\tpeople:[%@]", v6];
  }
  if (self->_location)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [(CLLocation *)self->_location name];
      [v3 appendFormat:@"\n\t\tlocation:[%@]", v7];
    }
    else
    {
      [v3 appendFormat:@"\n\t\tlocation:[%@]", self->_location];
    }
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end