@interface InAppTransaction
+ (Class)databaseEntityClass;
+ (id)defaultProperties;
- (BOOL)isFinished;
- (NSString)receipt;
@end

@implementation InAppTransaction

- (BOOL)isFinished
{
  return [(SQLiteMemoryEntity *)self BOOLValueForProperty:@"is_finished"];
}

- (NSString)receipt
{
  return (NSString *)[(SQLiteMemoryEntity *)self stringValueForProperty:@"receipt"];
}

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class();
}

+ (id)defaultProperties
{
  v4[0] = @"bundle_id";
  v4[1] = @"is_finished";
  v4[2] = @"is_upgraded";
  v4[3] = @"product_id";
  v4[4] = @"product_type";
  v4[5] = @"receipt";
  v4[6] = @"revocation_date";
  v4[7] = @"transaction_date";
  v4[8] = @"transaction_id";
  v2 = +[NSArray arrayWithObjects:v4 count:9];

  return v2;
}

@end