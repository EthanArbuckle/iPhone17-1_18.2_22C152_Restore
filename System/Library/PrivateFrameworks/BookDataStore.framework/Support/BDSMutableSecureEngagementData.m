@interface BDSMutableSecureEngagementData
+ (BOOL)supportsSecureCoding;
- (BDSMutableSecureEngagementData)initWithCloudData:(id)a3;
- (BDSMutableSecureEngagementData)initWithCoder:(id)a3;
- (BDSMutableSecureEngagementData)initWithRecord:(id)a3;
- (BDSMutableSecureEngagementData)initWithStartTimestampString:(id)a3 durationInterval:(double)a4;
- (NSData)value;
- (NSString)description;
- (NSString)startTimestampString;
- (double)durationInterval;
- (id)configuredRecordFromAttributes;
- (id)recordType;
- (id)zoneName;
- (void)encodeWithCoder:(id)a3;
- (void)setDurationInterval:(double)a3;
- (void)setStartTimestampString:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation BDSMutableSecureEngagementData

- (BDSMutableSecureEngagementData)initWithStartTimestampString:(id)a3 durationInterval:(double)a4
{
  id v6 = a3;
  if (v6)
  {
    v12.receiver = self;
    v12.super_class = (Class)BDSMutableSecureEngagementData;
    v7 = [(BCMutableCloudData *)&v12 init];
    if (v7)
    {
      v8 = (NSString *)[v6 copy];
      startTimestampString = v7->_startTimestampString;
      v7->_startTimestampString = v8;

      v7->_durationInterval = a4;
    }
  }
  else
  {
    v10 = sub_1000083A0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1001E9A84();
    }

    v7 = 0;
  }

  return v7;
}

- (BDSMutableSecureEngagementData)initWithCloudData:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)BDSMutableSecureEngagementData;
  v5 = [(BCMutableCloudData *)&v16 initWithCloudData:v4];
  if (v5)
  {
    id v6 = BUProtocolCast();
    v7 = v6;
    if (v6)
    {
      v8 = [v6 startTimestampString];
      v9 = (NSString *)[v8 copy];
      startTimestampString = v5->_startTimestampString;
      v5->_startTimestampString = v9;

      [v7 durationInterval];
      v5->_durationInterval = v11;
      objc_super v12 = [v7 value];
      v13 = (NSData *)[v12 copy];
      p_super = &v5->_value->super;
      v5->_value = v13;
    }
    else
    {
      p_super = sub_1000083A0();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
        sub_1001E9908();
      }
      objc_super v12 = v5;
      v5 = 0;
    }
  }
  return v5;
}

- (BDSMutableSecureEngagementData)initWithRecord:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    p_super = sub_1000083A0();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
      sub_1001E9AB8();
    }
    goto LABEL_9;
  }
  v15.receiver = self;
  v15.super_class = (Class)BDSMutableSecureEngagementData;
  v5 = [(BCMutableCloudData *)&v15 initWithRecord:v4];
  if (v5)
  {
    self = [v4 objectForKey:@"value"];
    if (!+[BDSSecureEngagementDataHelper isEngagementTimeSliceDataEmpty:self])
    {
      p_super = +[BCCloudData localIdentifierFromRecord:v4];
      v8 = [p_super copy];
      startTimestampString = v5->_startTimestampString;
      v5->_startTimestampString = v8;

      v10 = [v4 objectForKey:@"durationInterval"];
      [v10 doubleValue];
      v5->_durationInterval = v11;

      objc_super v12 = (NSData *)[(BDSMutableSecureEngagementData *)self copy];
      value = v5->_value;
      v5->_value = v12;

      goto LABEL_11;
    }
    id v6 = sub_1000083A0();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1001E9AEC();
    }

    p_super = &v5->super.super;
LABEL_9:
    v5 = 0;
LABEL_11:
  }
  return v5;
}

- (NSString)description
{
  v3 = [(BDSMutableSecureEngagementData *)self startTimestampString];
  [(BDSMutableSecureEngagementData *)self durationInterval];
  v5 = +[NSString stringWithFormat:@"start timestamp: %@, duration interval: %.1lf", v3, v4];

  return (NSString *)v5;
}

- (id)recordType
{
  return @"SecureEngagement";
}

- (id)zoneName
{
  return @"SecureUserDataZone";
}

- (id)configuredRecordFromAttributes
{
  v7.receiver = self;
  v7.super_class = (Class)BDSMutableSecureEngagementData;
  v3 = [(BCMutableCloudData *)&v7 configuredRecordFromAttributes];
  [(BDSMutableSecureEngagementData *)self durationInterval];
  uint64_t v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v3 setObject:v4 forKey:@"durationInterval"];

  v5 = [(BDSMutableSecureEngagementData *)self value];
  [v3 setObject:v5 forKey:@"value"];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BDSMutableSecureEngagementData;
  id v4 = a3;
  [(BCMutableCloudData *)&v6 encodeWithCoder:v4];
  [(BDSMutableSecureEngagementData *)self durationInterval];
  objc_msgSend(v4, "encodeDouble:forKey:", @"durationInterval");
  v5 = [(BDSMutableSecureEngagementData *)self value];
  [v4 encodeObject:v5 forKey:@"value"];
}

- (BDSMutableSecureEngagementData)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BDSMutableSecureEngagementData;
  v5 = [(BCMutableCloudData *)&v14 initWithCoder:v4];
  objc_super v6 = v5;
  if (v5)
  {
    objc_super v7 = [(BCMutableCloudData *)v5 localRecordID];
    v8 = (NSString *)[v7 copy];
    startTimestampString = v6->_startTimestampString;
    v6->_startTimestampString = v8;

    [v4 decodeDoubleForKey:@"durationInterval"];
    v6->_durationInterval = v10;
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];
    value = v6->_value;
    v6->_value = (NSData *)v11;
  }
  return v6;
}

- (NSString)startTimestampString
{
  return self->_startTimestampString;
}

- (void)setStartTimestampString:(id)a3
{
}

- (double)durationInterval
{
  return self->_durationInterval;
}

- (void)setDurationInterval:(double)a3
{
  self->_durationInterval = a3;
}

- (NSData)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_startTimestampString, 0);
}

@end