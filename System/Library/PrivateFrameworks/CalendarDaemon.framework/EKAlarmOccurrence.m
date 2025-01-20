@interface EKAlarmOccurrence
+ (id)alarmOccurrenceWithAlarmID:(id)a3 ownerID:(id)a4 ownerDate:(id)a5 ownerTimeZone:(id)a6 ownerURI:(id)a7 fireDate:(id)a8 externalID:(id)a9 acknowledgedDate:(id)a10;
- (CADObjectID)alarmID;
- (CADObjectID)ownerID;
- (EKAlarmOccurrence)initWithAlarmID:(id)a3 ownerID:(id)a4 ownerDate:(id)a5 ownerTimeZone:(id)a6 ownerURI:(id)a7 fireDate:(id)a8 externalID:(id)a9 acknowledgedDate:(id)a10;
- (EKAlarmOccurrence)initWithCoder:(id)a3;
- (EKAlarmOccurrence)initWithDictionaryRepresentation:(id)a3;
- (NSDate)acknowledgedDate;
- (NSDate)fireDate;
- (NSDate)ownerDate;
- (NSString)externalID;
- (NSTimeZone)ownerTimeZone;
- (NSURL)ownerURI;
- (id)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EKAlarmOccurrence

+ (id)alarmOccurrenceWithAlarmID:(id)a3 ownerID:(id)a4 ownerDate:(id)a5 ownerTimeZone:(id)a6 ownerURI:(id)a7 fireDate:(id)a8 externalID:(id)a9 acknowledgedDate:(id)a10
{
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  v25 = (void *)[objc_alloc((Class)a1) initWithAlarmID:v24 ownerID:v23 ownerDate:v22 ownerTimeZone:v21 ownerURI:v20 fireDate:v19 externalID:v18 acknowledgedDate:v17];

  return v25;
}

- (EKAlarmOccurrence)initWithAlarmID:(id)a3 ownerID:(id)a4 ownerDate:(id)a5 ownerTimeZone:(id)a6 ownerURI:(id)a7 fireDate:(id)a8 externalID:(id)a9 acknowledgedDate:(id)a10
{
  id v39 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  v40.receiver = self;
  v40.super_class = (Class)EKAlarmOccurrence;
  id v24 = [(EKAlarmOccurrence *)&v40 init];
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_alarmID, a3);
    objc_storeStrong((id *)&v25->_ownerID, a4);
    uint64_t v26 = [v18 copy];
    ownerDate = v25->_ownerDate;
    v25->_ownerDate = (NSDate *)v26;

    uint64_t v28 = [v19 copy];
    ownerTimeZone = v25->_ownerTimeZone;
    v25->_ownerTimeZone = (NSTimeZone *)v28;

    uint64_t v30 = [v20 copy];
    ownerURI = v25->_ownerURI;
    v25->_ownerURI = (NSURL *)v30;

    uint64_t v32 = [v21 copy];
    fireDate = v25->_fireDate;
    v25->_fireDate = (NSDate *)v32;

    uint64_t v34 = [v22 copy];
    externalID = v25->_externalID;
    v25->_externalID = (NSString *)v34;

    uint64_t v36 = [v23 copy];
    acknowledgedDate = v25->_acknowledgedDate;
    v25->_acknowledgedDate = (NSDate *)v36;
  }
  return v25;
}

- (EKAlarmOccurrence)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)EKAlarmOccurrence;
  v5 = [(EKAlarmOccurrence *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"alarmID"];
    alarmID = v5->_alarmID;
    v5->_alarmID = (CADObjectID *)v6;

    uint64_t v8 = [v4 decodeObjectForKey:@"ownerID"];
    ownerID = v5->_ownerID;
    v5->_ownerID = (CADObjectID *)v8;

    uint64_t v10 = [v4 decodeObjectForKey:@"ownerDate"];
    ownerDate = v5->_ownerDate;
    v5->_ownerDate = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectForKey:@"ownerTimeZone"];
    ownerTimeZone = v5->_ownerTimeZone;
    v5->_ownerTimeZone = (NSTimeZone *)v12;

    uint64_t v14 = [v4 decodeObjectForKey:@"ownerURI"];
    ownerURI = v5->_ownerURI;
    v5->_ownerURI = (NSURL *)v14;

    uint64_t v16 = [v4 decodeObjectForKey:@"fireDate"];
    fireDate = v5->_fireDate;
    v5->_fireDate = (NSDate *)v16;

    uint64_t v18 = [v4 decodeObjectForKey:@"externalID"];
    externalID = v5->_externalID;
    v5->_externalID = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectForKey:@"acknowledgedDate"];
    acknowledgedDate = v5->_acknowledgedDate;
    v5->_acknowledgedDate = (NSDate *)v20;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  alarmID = self->_alarmID;
  id v5 = a3;
  [v5 encodeObject:alarmID forKey:@"alarmID"];
  [v5 encodeObject:self->_ownerID forKey:@"ownerID"];
  [v5 encodeObject:self->_ownerDate forKey:@"ownerDate"];
  [v5 encodeObject:self->_ownerTimeZone forKey:@"ownerTimeZone"];
  [v5 encodeObject:self->_ownerURI forKey:@"ownerURI"];
  [v5 encodeObject:self->_fireDate forKey:@"fireDate"];
  [v5 encodeObject:self->_externalID forKey:@"externalID"];
  [v5 encodeObject:self->_acknowledgedDate forKey:@"acknowledgedDate"];
}

- (EKAlarmOccurrence)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)EKAlarmOccurrence;
  id v5 = [(EKAlarmOccurrence *)&v34 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"ownerTimeZone"];
    id v7 = objc_alloc(MEMORY[0x1E4F57428]);
    uint64_t v8 = [v4 objectForKeyedSubscript:@"alarmID"];
    uint64_t v9 = [v7 initWithDictionaryRepresentation:v8];
    alarmID = v5->_alarmID;
    v5->_alarmID = (CADObjectID *)v9;

    id v11 = objc_alloc(MEMORY[0x1E4F57428]);
    uint64_t v12 = [v4 objectForKeyedSubscript:@"ownerID"];
    uint64_t v13 = [v11 initWithDictionaryRepresentation:v12];
    ownerID = v5->_ownerID;
    v5->_ownerID = (CADObjectID *)v13;

    v15 = [v4 objectForKeyedSubscript:@"ownerDate"];
    uint64_t v16 = [v15 copy];
    ownerDate = v5->_ownerDate;
    v5->_ownerDate = (NSDate *)v16;

    uint64_t v18 = [v4 objectForKeyedSubscript:@"ownerTimeZone"];
    if (v18)
    {
      uint64_t v19 = [objc_alloc(MEMORY[0x1E4F1CAF0]) initWithName:v6];
      ownerTimeZone = v5->_ownerTimeZone;
      v5->_ownerTimeZone = (NSTimeZone *)v19;
    }
    else
    {
      ownerTimeZone = v5->_ownerTimeZone;
      v5->_ownerTimeZone = 0;
    }

    id v21 = [v4 objectForKeyedSubscript:@"ownerURI"];
    uint64_t v22 = [v21 copy];
    ownerURI = v5->_ownerURI;
    v5->_ownerURI = (NSURL *)v22;

    id v24 = [v4 objectForKeyedSubscript:@"fireDate"];
    uint64_t v25 = [v24 copy];
    fireDate = v5->_fireDate;
    v5->_fireDate = (NSDate *)v25;

    v27 = [v4 objectForKeyedSubscript:@"externalID"];
    uint64_t v28 = [v27 copy];
    externalID = v5->_externalID;
    v5->_externalID = (NSString *)v28;

    uint64_t v30 = [v4 objectForKeyedSubscript:@"acknowledgedDate"];
    uint64_t v31 = [v30 copy];
    acknowledgedDate = v5->_acknowledgedDate;
    v5->_acknowledgedDate = (NSDate *)v31;
  }
  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:7];
  alarmID = self->_alarmID;
  if (alarmID)
  {
    id v5 = [(CADObjectID *)alarmID dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"alarmID"];
  }
  ownerID = self->_ownerID;
  if (ownerID)
  {
    id v7 = [(CADObjectID *)ownerID dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"ownerID"];
  }
  ownerDate = self->_ownerDate;
  if (ownerDate) {
    [v3 setObject:ownerDate forKey:@"ownerDate"];
  }
  ownerTimeZone = self->_ownerTimeZone;
  if (ownerTimeZone)
  {
    uint64_t v10 = [(NSTimeZone *)ownerTimeZone name];
    [v3 setObject:v10 forKey:@"ownerTimeZone"];
  }
  ownerURI = self->_ownerURI;
  if (ownerURI) {
    [v3 setObject:ownerURI forKey:@"ownerURI"];
  }
  fireDate = self->_fireDate;
  if (fireDate) {
    [v3 setObject:fireDate forKey:@"fireDate"];
  }
  externalID = self->_externalID;
  if (externalID) {
    [v3 setObject:externalID forKey:@"externalID"];
  }
  acknowledgedDate = self->_acknowledgedDate;
  if (acknowledgedDate) {
    [v3 setObject:acknowledgedDate forKey:@"acknowledgedDate"];
  }
  return v3;
}

- (CADObjectID)alarmID
{
  return self->_alarmID;
}

- (CADObjectID)ownerID
{
  return self->_ownerID;
}

- (NSDate)ownerDate
{
  return self->_ownerDate;
}

- (NSTimeZone)ownerTimeZone
{
  return self->_ownerTimeZone;
}

- (NSURL)ownerURI
{
  return self->_ownerURI;
}

- (NSDate)fireDate
{
  return self->_fireDate;
}

- (NSString)externalID
{
  return self->_externalID;
}

- (NSDate)acknowledgedDate
{
  return self->_acknowledgedDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acknowledgedDate, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_fireDate, 0);
  objc_storeStrong((id *)&self->_ownerURI, 0);
  objc_storeStrong((id *)&self->_ownerTimeZone, 0);
  objc_storeStrong((id *)&self->_ownerDate, 0);
  objc_storeStrong((id *)&self->_ownerID, 0);
  objc_storeStrong((id *)&self->_alarmID, 0);
}

@end