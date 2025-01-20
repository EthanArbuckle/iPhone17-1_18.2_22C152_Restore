@interface _BTNotificationLocationTimestamp
- (BOOL)isEqual:(id)a3;
- (CLLocation)location;
- (NSDate)timestamp;
- (_BTNotificationLocationTimestamp)initWithLocation:(id)a3 timestamp:(id)a4;
- (void)setLocation:(id)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation _BTNotificationLocationTimestamp

- (_BTNotificationLocationTimestamp)initWithLocation:(id)a3 timestamp:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_BTNotificationLocationTimestamp;
  v8 = [(_BTNotificationLocationTimestamp *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(_BTNotificationLocationTimestamp *)v8 setLocation:v6];
    [(_BTNotificationLocationTimestamp *)v9 setTimestamp:v7];
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 location];
    id v6 = [(_BTNotificationLocationTimestamp *)self location];
    char v7 = MapsSuggestionsAlmostSameLocation();
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);

  objc_storeStrong((id *)&self->_location, 0);
}

@end