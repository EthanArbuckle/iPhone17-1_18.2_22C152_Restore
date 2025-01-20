@interface HealthSampleUpdate
+ (BOOL)supportsSecureCoding;
- (HealthSample)lastHealthSample;
- (HealthSampleUpdate)init;
- (HealthSampleUpdate)initWithCoder:(id)a3;
- (HealthSampleUpdate)initWithDictionary:(id)a3;
- (NSDate)lastHealthSampleTimestamp;
- (id)metricsDict;
- (id)recordForType:(unint64_t)a3;
- (id)updatedValueWithHealthSample:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HealthSampleUpdate

- (HealthSampleUpdate)init
{
  id v3 = objc_alloc_init((Class)NSDictionary);
  v4 = [(HealthSampleUpdate *)self initWithDictionary:v3];

  return v4;
}

- (HealthSampleUpdate)initWithDictionary:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HealthSampleUpdate;
  v6 = [(HealthSampleUpdate *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_storage, a3);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000093D4;
    v9[3] = &unk_100010780;
    v10 = v7;
    [v5 enumerateKeysAndObjectsUsingBlock:v9];
  }
  return v7;
}

- (id)recordForType:(unint64_t)a3
{
  if (a3 - 3 > 2) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = (uint64_t)*(&off_1000107A0 + a3 - 3);
  }
  return [(NSDictionary *)self->_storage objectForKey:v3];
}

- (NSDate)lastHealthSampleTimestamp
{
  v2 = [(HealthSampleUpdate *)self lastHealthSample];
  uint64_t v3 = [v2 timestamp];

  return (NSDate *)v3;
}

- (id)updatedValueWithHealthSample:(id)a3
{
  id v4 = a3;
  id v5 = [(HealthSampleUpdate *)self lastHealthSample];
  unsigned __int8 v6 = [v4 isNewerThanHealthSample:v5];

  if (v6)
  {
    id v7 = objc_alloc_init((Class)NSMutableDictionary);
    for (unint64_t i = 0; i != 3; ++i)
    {
      if (i > 2) {
        uint64_t v9 = 0;
      }
      else {
        uint64_t v9 = (uint64_t)*(&off_1000107A0 + i);
      }
      v10 = [(NSDictionary *)self->_storage objectForKey:v9];
      objc_super v11 = v10;
      if (v10) {
        v12 = v10;
      }
      else {
        v12 = [[HealthSampleUpdateRecord alloc] initWithRecordType:i + 3 initialSample:v4];
      }
      v13 = v12;

      v14 = [(HealthSampleUpdateRecord *)v13 updatedRecordWithHealthSample:v4];
      [v7 setValue:v14 forKey:v9];
    }
    v15 = [[HealthSampleUpdate alloc] initWithDictionary:v7];
  }
  else
  {
    v15 = self;
  }

  return v15;
}

- (id)metricsDict
{
  v2 = [(HealthSampleUpdate *)self lastHealthSample];
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [v2 timestamp];
  [v4 timeIntervalSince1970];
  id v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v3 setObject:v5 forKeyedSubscript:@"timestamp"];

  if ([v2 internal]) {
    unsigned __int8 v6 = &off_100011640;
  }
  else {
    unsigned __int8 v6 = &off_100011658;
  }
  [v3 setObject:v6 forKeyedSubscript:@"internal"];
  id v7 = [v2 build];
  [v3 setObject:v7 forKeyedSubscript:@"build"];

  v8 = v3;
  uint64_t v9 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v2 accountSecurityLevel]);
  [v3 setObject:v9 forKeyedSubscript:@"accountSecurityLevel"];

  if ([v2 testAccount]) {
    v10 = &off_100011640;
  }
  else {
    v10 = &off_100011658;
  }
  [v3 setObject:v10 forKeyedSubscript:@"testAccount"];
  if ([v2 iCDPEnabledForDSID]) {
    objc_super v11 = &off_100011640;
  }
  else {
    objc_super v11 = &off_100011658;
  }
  [v3 setObject:v11 forKeyedSubscript:@"iCDPEnabledForDSID"];
  v43 = v2;
  if ([v2 passcodeEnabled]) {
    v12 = &off_100011640;
  }
  else {
    v12 = &off_100011658;
  }
  [v3 setObject:v12 forKeyedSubscript:@"passcodeEnabled"];
  unint64_t v13 = 0;
  do
  {
    v14 = [(HealthSampleUpdate *)self recordForType:v13 + 3];
    unint64_t v47 = v13;
    if (v13 > 2) {
      v15 = 0;
    }
    else {
      v15 = *(&off_1000107A0 + v13);
    }
    v16 = [v15 stringByAppendingString:@"Timestamp"];
    v17 = [v15 stringByAppendingString:@"ErrorCode"];
    v49 = [v15 stringByAppendingString:@"ErrorCode"];
    v18 = [v15 stringByAppendingString:@"ErrorDomainHash"];
    v19 = [v14 currentState];
    [v8 setObject:v19 forKeyedSubscript:v15];

    v20 = [v14 currentStateFirstSample];
    v21 = [v20 timestamp];
    [v21 timeIntervalSince1970];
    v22 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v8 setObject:v22 forKeyedSubscript:v16];

    v23 = [v14 currentStateError];
    v24 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v23 code]);
    [v8 setObject:v24 forKeyedSubscript:v17];

    v25 = [v14 currentStateError];
    v26 = [v25 domain];
    v27 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v26 hash]);
    v48 = v18;
    [v8 setObject:v27 forKeyedSubscript:v18];

    v28 = [v14 previousState];

    if (v28)
    {
      v45 = v17;
      v29 = [v15 stringByAppendingString:@"_prev"];
      v30 = [v16 stringByAppendingString:@"_prev"];
      v31 = [v49 stringByAppendingString:@"_prev"];
      v32 = [v18 stringByAppendingString:@"_prev"];
      v33 = [v14 previousState];
      [v8 setObject:v33 forKeyedSubscript:v29];

      [v14 previousStateFirstSample];
      v34 = v46 = v16;
      v35 = [v34 timestamp];
      [v35 timeIntervalSince1970];
      v36 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v8 setObject:v36 forKeyedSubscript:v30];

      v37 = [v14 previousStateError];
      v38 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v37 code]);
      [v8 setObject:v38 forKeyedSubscript:v31];

      v39 = [v14 previousStateError];
      v40 = [v39 domain];
      v41 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v40 hash]);
      [v8 setObject:v41 forKeyedSubscript:v32];

      v17 = v45;
      v16 = v46;
    }
    unint64_t v13 = v47 + 1;
  }
  while (v47 != 2);

  return v8;
}

- (HealthSample)lastHealthSample
{
  return self->_lastHealthSample;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastHealthSample, 0);

  objc_storeStrong((id *)&self->_storage, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HealthSampleUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  id v5 = +[NSArray arrayWithObjects:&v10 count:3];
  unsigned __int8 v6 = +[NSSet setWithArray:](NSSet, "setWithArray:", v5, v10, v11);
  id v7 = [v4 decodeObjectOfClasses:v6 forKey:@"_storage"];

  v8 = [(HealthSampleUpdate *)self initWithDictionary:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
}

@end