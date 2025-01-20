@interface BDSDistributedPriceTrackingConfig
+ (BDSDistributedPriceTrackingConfig)disabledConfig;
+ (BOOL)supportsSecureCoding;
- (BDSDistributedPriceTrackingConfig)initWithCoder:(id)a3;
- (BDSDistributedPriceTrackingConfig)initWithItemIDs:(id)a3 updateScheduleSteps:(id)a4 dealAbsoluteThreshold:(id)a5 dealRelativeThreshold:(id)a6 notification:(id)a7 cardLimit:(id)a8;
- (BDSDistributedPriceTrackingConfigNotification)notification;
- (NSArray)itemIDs;
- (NSArray)updateScheduleSteps;
- (NSNumber)cardLimit;
- (NSNumber)dealAbsoluteThreshold;
- (NSNumber)dealRelativeThreshold;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BDSDistributedPriceTrackingConfig

+ (BDSDistributedPriceTrackingConfig)disabledConfig
{
  id v2 = [objc_alloc((Class)a1) initWithItemIDs:&__NSArray0__struct updateScheduleSteps:&__NSArray0__struct dealAbsoluteThreshold:&off_1002705E8 dealRelativeThreshold:&off_1002705E8 notification:0 cardLimit:&off_1002705E8];
  return (BDSDistributedPriceTrackingConfig *)v2;
}

- (BDSDistributedPriceTrackingConfig)initWithItemIDs:(id)a3 updateScheduleSteps:(id)a4 dealAbsoluteThreshold:(id)a5 dealRelativeThreshold:(id)a6 notification:(id)a7 cardLimit:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v37.receiver = self;
  v37.super_class = (Class)BDSDistributedPriceTrackingConfig;
  v20 = [(BDSDistributedPriceTrackingConfig *)&v37 init];
  if (v20)
  {
    id v21 = [v14 copy];
    v22 = v21;
    if (v21) {
      v23 = v21;
    }
    else {
      v23 = &__NSArray0__struct;
    }
    objc_storeStrong((id *)&v20->_itemIDs, v23);

    id v24 = [v15 copy];
    v25 = v24;
    if (v24) {
      v26 = v24;
    }
    else {
      v26 = &__NSArray0__struct;
    }
    objc_storeStrong((id *)&v20->_updateScheduleSteps, v26);

    id v27 = [v16 copy];
    v28 = v27;
    if (v27) {
      v29 = (_UNKNOWN **)v27;
    }
    else {
      v29 = &off_1002705E8;
    }
    objc_storeStrong((id *)&v20->_dealAbsoluteThreshold, v29);

    id v30 = [v17 copy];
    v31 = v30;
    if (v30) {
      v32 = (_UNKNOWN **)v30;
    }
    else {
      v32 = &off_1002705E8;
    }
    objc_storeStrong((id *)&v20->_dealRelativeThreshold, v32);

    objc_storeStrong((id *)&v20->_notification, a7);
    id v33 = [v19 copy];
    v34 = v33;
    if (v33) {
      v35 = (_UNKNOWN **)v33;
    }
    else {
      v35 = &off_1002705E8;
    }
    objc_storeStrong((id *)&v20->_cardLimit, v35);
  }
  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(BDSDistributedPriceTrackingConfig *)self itemIDs];
  [v4 encodeObject:v5 forKey:@"itemIDs"];

  v6 = [(BDSDistributedPriceTrackingConfig *)self updateScheduleSteps];
  [v4 encodeObject:v6 forKey:@"updateScheduleSteps"];

  v7 = [(BDSDistributedPriceTrackingConfig *)self dealAbsoluteThreshold];
  [v4 encodeObject:v7 forKey:@"dealAbsoluteThreshold"];

  v8 = [(BDSDistributedPriceTrackingConfig *)self dealRelativeThreshold];
  [v4 encodeObject:v8 forKey:@"dealRelativeThreshold"];

  v9 = [(BDSDistributedPriceTrackingConfig *)self notification];
  [v4 encodeObject:v9 forKey:@"notification"];

  id v10 = [(BDSDistributedPriceTrackingConfig *)self cardLimit];
  [v4 encodeObject:v10 forKey:@"cardLimit"];
}

- (BDSDistributedPriceTrackingConfig)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "bds_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), @"itemIDs");
  v6 = objc_msgSend(v4, "bds_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), @"updateScheduleSteps");
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dealAbsoluteThreshold"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dealRelativeThreshold"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"notification"];
  id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cardLimit"];

  v11 = [(BDSDistributedPriceTrackingConfig *)self initWithItemIDs:v5 updateScheduleSteps:v6 dealAbsoluteThreshold:v7 dealRelativeThreshold:v8 notification:v9 cardLimit:v10];
  return v11;
}

- (NSArray)itemIDs
{
  return self->_itemIDs;
}

- (NSArray)updateScheduleSteps
{
  return self->_updateScheduleSteps;
}

- (NSNumber)dealAbsoluteThreshold
{
  return self->_dealAbsoluteThreshold;
}

- (NSNumber)dealRelativeThreshold
{
  return self->_dealRelativeThreshold;
}

- (BDSDistributedPriceTrackingConfigNotification)notification
{
  return self->_notification;
}

- (NSNumber)cardLimit
{
  return self->_cardLimit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardLimit, 0);
  objc_storeStrong((id *)&self->_notification, 0);
  objc_storeStrong((id *)&self->_dealRelativeThreshold, 0);
  objc_storeStrong((id *)&self->_dealAbsoluteThreshold, 0);
  objc_storeStrong((id *)&self->_updateScheduleSteps, 0);
  objc_storeStrong((id *)&self->_itemIDs, 0);
}

@end