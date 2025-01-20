@interface MPRadioStationEvent
+ (BOOL)supportsSecureCoding;
- (MPRadioStationEvent)initWithBlock:(id)a3;
- (MPRadioStationEvent)initWithCoder:(id)a3;
- (NSDate)endTime;
- (NSDate)startTime;
- (NSString)descriptionText;
- (NSString)title;
- (void)encodeWithCoder:(id)a3;
- (void)setDescriptionText:(id)a3;
- (void)setEndTime:(id)a3;
- (void)setStartTime:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation MPRadioStationEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setEndTime:(id)a3
{
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (void)setStartTime:(id)a3
{
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setDescriptionText:(id)a3
{
}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"title"];
  [v5 encodeObject:self->_descriptionText forKey:@"descriptionText"];
  [v5 encodeObject:self->_startTime forKey:@"startTime"];
  [v5 encodeObject:self->_endTime forKey:@"endTime"];
}

- (MPRadioStationEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(MPRadioStationEvent *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"descriptionText"];
    descriptionText = v5->_descriptionText;
    v5->_descriptionText = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startTime"];
    startTime = v5->_startTime;
    v5->_startTime = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endTime"];
    endTime = v5->_endTime;
    v5->_endTime = (NSDate *)v12;
  }
  return v5;
}

- (MPRadioStationEvent)initWithBlock:(id)a3
{
  id v4 = (void (**)(id, MPRadioStationEvent *))a3;
  v7.receiver = self;
  v7.super_class = (Class)MPRadioStationEvent;
  id v5 = [(MPRadioStationEvent *)&v7 init];
  if (v5) {
    v4[2](v4, v5);
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end