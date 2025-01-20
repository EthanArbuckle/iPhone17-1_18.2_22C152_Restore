@interface SKANGhostback
+ (Class)databaseEntityClass;
+ (id)defaultProperties;
- (BOOL)isLocked;
- (BOOL)isRegistered;
- (NSNumber)appAdamId;
- (NSNumber)fetchTimestamp;
- (NSNumber)originTimestamp;
- (NSNumber)restrictedUpdateTimestamp;
- (NSNumber)updateTimestamp;
- (NSString)appBundleId;
- (NSString)coarseConversionValue;
- (NSString)environment;
- (int64_t)freeConversionValue;
- (int64_t)restrictedConversionValue;
- (void)setCoarseConversionValue:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setFetchTimestamp:(id)a3;
- (void)setFreeConversionValue:(int64_t)a3;
- (void)setIsLocked:(BOOL)a3;
- (void)setIsRegistered:(BOOL)a3;
- (void)setOriginTimestamp:(id)a3;
- (void)setRestrictedConversionValue:(int64_t)a3;
- (void)setRestrictedUpdateTimestamp:(id)a3;
- (void)setUpdateTimestamp:(id)a3;
@end

@implementation SKANGhostback

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class();
}

+ (id)defaultProperties
{
  v4[0] = @"app_adam_id";
  v4[1] = @"app_bundle_id";
  v4[2] = @"restricted_conversion_value";
  v4[3] = @"free_conversion_value";
  v4[4] = @"coarse_conversion_value";
  v4[5] = @"is_registered";
  v4[6] = @"origin_timestamp";
  v4[7] = @"update_timestamp";
  v4[8] = @"restricted_update_timestamp";
  v4[9] = @"fetch_timestamp";
  v4[10] = @"is_locked";
  v2 = +[NSArray arrayWithObjects:v4 count:11];
  return v2;
}

- (NSNumber)appAdamId
{
  return (NSNumber *)[(SQLiteMemoryEntity *)self valueForProperty:@"app_adam_id"];
}

- (NSString)appBundleId
{
  return (NSString *)[(SQLiteMemoryEntity *)self valueForProperty:@"app_bundle_id"];
}

- (int64_t)restrictedConversionValue
{
  return (int64_t)sub_10026E91C(self, @"restricted_conversion_value");
}

- (int64_t)freeConversionValue
{
  return (int64_t)sub_10026E91C(self, @"free_conversion_value");
}

- (NSString)coarseConversionValue
{
  return (NSString *)[(SQLiteMemoryEntity *)self valueForProperty:@"coarse_conversion_value"];
}

- (BOOL)isRegistered
{
  return sub_10026E7EC(self, @"is_registered");
}

- (NSNumber)originTimestamp
{
  return (NSNumber *)[(SQLiteMemoryEntity *)self valueForProperty:@"origin_timestamp"];
}

- (NSNumber)updateTimestamp
{
  return (NSNumber *)[(SQLiteMemoryEntity *)self valueForProperty:@"update_timestamp"];
}

- (NSNumber)restrictedUpdateTimestamp
{
  return (NSNumber *)[(SQLiteMemoryEntity *)self valueForProperty:@"restricted_update_timestamp"];
}

- (NSNumber)fetchTimestamp
{
  return (NSNumber *)[(SQLiteMemoryEntity *)self valueForProperty:@"fetch_timestamp"];
}

- (BOOL)isLocked
{
  return sub_10026E7EC(self, @"is_locked");
}

- (NSString)environment
{
  return (NSString *)sub_10026E95C(self, @"environment");
}

- (void)setRestrictedConversionValue:(int64_t)a3
{
  id v4 = +[NSNumber numberWithInteger:a3];
  [(SQLiteMemoryEntity *)self setValue:v4 forProperty:@"restricted_conversion_value"];
}

- (void)setFreeConversionValue:(int64_t)a3
{
  id v4 = +[NSNumber numberWithInteger:a3];
  [(SQLiteMemoryEntity *)self setValue:v4 forProperty:@"free_conversion_value"];
}

- (void)setCoarseConversionValue:(id)a3
{
}

- (void)setIsRegistered:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  [(SQLiteMemoryEntity *)self setValue:v4 forProperty:@"is_registered"];
}

- (void)setOriginTimestamp:(id)a3
{
}

- (void)setUpdateTimestamp:(id)a3
{
}

- (void)setRestrictedUpdateTimestamp:(id)a3
{
}

- (void)setFetchTimestamp:(id)a3
{
}

- (void)setIsLocked:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  [(SQLiteMemoryEntity *)self setValue:v4 forProperty:@"is_locked"];
}

- (void)setEnvironment:(id)a3
{
}

@end