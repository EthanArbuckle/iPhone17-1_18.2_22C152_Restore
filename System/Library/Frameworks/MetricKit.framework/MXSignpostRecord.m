@interface MXSignpostRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)isInterval;
- (MXSignpostRecord)initWithCoder:(id)a3;
- (MXSignpostRecord)initWithSubSystem:(id)a3 category:(id)a4 name:(id)a5 beginTimeStamp:(id)a6 endTimeStamp:(id)a7 duration:(id)a8 isInterval:(BOOL)a9;
- (NSData)JSONRepresentation;
- (NSDate)beginTimeStamp;
- (NSDate)endTimeStamp;
- (NSMeasurement)duration;
- (NSString)category;
- (NSString)name;
- (NSString)subsystem;
- (id)toDictionary;
- (void)encodeWithCoder:(id)a3;
- (void)setBeginTimeStamp:(id)a3;
- (void)setCategory:(id)a3;
- (void)setDuration:(id)a3;
- (void)setEndTimeStamp:(id)a3;
- (void)setIsInterval:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setSubsystem:(id)a3;
@end

@implementation MXSignpostRecord

- (MXSignpostRecord)initWithSubSystem:(id)a3 category:(id)a4 name:(id)a5 beginTimeStamp:(id)a6 endTimeStamp:(id)a7 duration:(id)a8 isInterval:(BOOL)a9
{
  id v25 = a3;
  id v24 = a4;
  id v16 = a5;
  id v17 = a6;
  id v23 = a7;
  id v22 = a8;
  v26.receiver = self;
  v26.super_class = (Class)MXSignpostRecord;
  v18 = [(MXSignpostRecord *)&v26 init];
  v19 = v18;
  if (!v18) {
    goto LABEL_7;
  }
  v20 = 0;
  if (v25 && v24 && v16 && v17)
  {
    objc_storeStrong((id *)&v18->_subsystem, a3);
    objc_storeStrong((id *)&v19->_category, a4);
    objc_storeStrong((id *)&v19->_name, a5);
    objc_storeStrong((id *)&v19->_beginTimeStamp, a6);
    objc_storeStrong((id *)&v19->_endTimeStamp, a7);
    objc_storeStrong((id *)&v19->_duration, a8);
    v19->_isInterval = a9;
LABEL_7:
    v20 = v19;
  }

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  subsystem = self->_subsystem;
  id v5 = a3;
  [v5 encodeObject:subsystem forKey:@"subsystem"];
  [v5 encodeObject:self->_category forKey:@"category"];
  [v5 encodeObject:self->_name forKey:@"name"];
  [v5 encodeObject:self->_beginTimeStamp forKey:@"beginTimeStamp"];
  [v5 encodeObject:self->_endTimeStamp forKey:@"endTimeStamp"];
  [v5 encodeObject:self->_duration forKey:@"duration"];
  [v5 encodeBool:self->_isInterval forKey:@"isInterval"];
}

- (MXSignpostRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MXSignpostRecord;
  id v5 = [(MXSignpostRecord *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subsystem"];
    subsystem = v5->_subsystem;
    v5->_subsystem = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"category"];
    category = v5->_category;
    v5->_category = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"beginTimeStamp"];
    beginTimeStamp = v5->_beginTimeStamp;
    v5->_beginTimeStamp = (NSDate *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endTimeStamp"];
    endTimeStamp = v5->_endTimeStamp;
    v5->_endTimeStamp = (NSDate *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"duration"];
    duration = v5->_duration;
    v5->_duration = (NSMeasurement *)v16;

    v5->_isInterval = [v4 decodeBoolForKey:@"isInterval"];
  }

  return v5;
}

- (id)toDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = objc_alloc_init(MEMORY[0x263F08790]);
  id v5 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
  [v4 setLocale:v5];
  [v4 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
  id v6 = objc_alloc_init(MEMORY[0x263F08988]);
  [v6 setUnitOptions:1];
  v7 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
  [v6 setLocale:v7];

  [v6 setUnitStyle:2];
  subsystem = self->_subsystem;
  if (subsystem) {
    [v3 setObject:subsystem forKey:@"subsystem"];
  }
  category = self->_category;
  if (category) {
    [v3 setObject:category forKey:@"category"];
  }
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  if (self->_beginTimeStamp)
  {
    v11 = objc_msgSend(v4, "stringFromDate:");
    [v3 setObject:v11 forKey:@"beginTimeStamp"];
  }
  if (self->_endTimeStamp)
  {
    uint64_t v12 = objc_msgSend(v4, "stringFromDate:");
    [v3 setObject:v12 forKey:@"endTimeStamp"];
  }
  if (self->_duration)
  {
    v13 = objc_msgSend(v6, "stringFromMeasurement:");
    [v3 setObject:v13 forKey:@"duration"];
  }
  uint64_t v14 = [NSNumber numberWithBool:self->_isInterval];
  [v3 setObject:v14 forKey:@"isInterval"];

  return v3;
}

- (NSData)JSONRepresentation
{
  v2 = [(MXSignpostRecord *)self toDictionary];
  if ([MEMORY[0x263F08900] isValidJSONObject:v2])
  {
    id v5 = 0;
    id v3 = [MEMORY[0x263F08900] dataWithJSONObject:v2 options:1 error:&v5];
  }
  else
  {
    id v3 = 0;
  }

  return (NSData *)v3;
}

- (NSString)subsystem
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSubsystem:(id)a3
{
}

- (NSString)category
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCategory:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setName:(id)a3
{
}

- (NSDate)beginTimeStamp
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBeginTimeStamp:(id)a3
{
}

- (NSDate)endTimeStamp
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEndTimeStamp:(id)a3
{
}

- (NSMeasurement)duration
{
  return (NSMeasurement *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDuration:(id)a3
{
}

- (BOOL)isInterval
{
  return self->_isInterval;
}

- (void)setIsInterval:(BOOL)a3
{
  self->_isInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_endTimeStamp, 0);
  objc_storeStrong((id *)&self->_beginTimeStamp, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_category, 0);

  objc_storeStrong((id *)&self->_subsystem, 0);
}

@end