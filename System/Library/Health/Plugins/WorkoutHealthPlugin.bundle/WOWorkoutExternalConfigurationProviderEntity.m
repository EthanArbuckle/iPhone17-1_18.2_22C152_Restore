@interface WOWorkoutExternalConfigurationProviderEntity
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)dataProperties;
+ (id)dateProperties;
+ (id)integerProperties;
+ (id)propertyForProviderIdentifier;
+ (id)stringProperties;
+ (id)tableName;
+ (unint64_t)persistenceType;
+ (void)preparePersistenceForDelete:(id)a3;
@end

@implementation WOWorkoutExternalConfigurationProviderEntity

+ (id)propertyForProviderIdentifier
{
  return @"bundleId";
}

+ (id)stringProperties
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___WOWorkoutExternalConfigurationProviderEntity;
  v2 = objc_msgSendSuper2(&v6, "stringProperties");
  v7[0] = @"name";
  v7[1] = @"bundleId";
  v3 = +[NSArray arrayWithObjects:v7 count:2];
  v4 = [v2 arrayByAddingObjectsFromArray:v3];

  return v4;
}

+ (id)integerProperties
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___WOWorkoutExternalConfigurationProviderEntity;
  v2 = objc_msgSendSuper2(&v6, "integerProperties");
  CFStringRef v7 = @"syncPermission";
  v3 = +[NSArray arrayWithObjects:&v7 count:1];
  v4 = [v2 arrayByAddingObjectsFromArray:v3];

  return v4;
}

+ (id)dateProperties
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___WOWorkoutExternalConfigurationProviderEntity;
  v2 = objc_msgSendSuper2(&v6, "dateProperties");
  CFStringRef v7 = @"syncStartDate";
  v3 = +[NSArray arrayWithObjects:&v7 count:1];
  v4 = [v2 arrayByAddingObjectsFromArray:v3];

  return v4;
}

+ (id)dataProperties
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___WOWorkoutExternalConfigurationProviderEntity;
  v2 = objc_msgSendSuper2(&v6, "dataProperties");
  CFStringRef v7 = @"imageData";
  v3 = +[NSArray arrayWithObjects:&v7 count:1];
  v4 = [v2 arrayByAddingObjectsFromArray:v3];

  return v4;
}

+ (id)tableName
{
  return @"workout_external_configuration_providers";
}

+ (unint64_t)persistenceType
{
  return 4;
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 14;
  return (const $626EC8B4BFAC9ABCADBBA632C3E03ACD *)off_14E00;
}

+ (void)preparePersistenceForDelete:(id)a3
{
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___WOWorkoutExternalConfigurationProviderEntity;
  id v3 = a3;
  objc_msgSendSuper2(&v9, "preparePersistenceForDelete:", v3);
  v4 = objc_msgSend(v3, "keyedDatas", v9.receiver, v9.super_class);
  v5 = +[NSMutableDictionary dictionaryWithDictionary:v4];

  objc_super v6 = [@" " dataUsingEncoding:4];
  [v5 setObject:v6 forKeyedSubscript:@"imageData"];

  [v3 setKeyedDatas:v5];
  CFStringRef v7 = [v3 keyedNumbers];
  v8 = +[NSMutableDictionary dictionaryWithDictionary:v7];

  [v8 setObject:&off_15A10 forKeyedSubscript:@"syncPermission"];
  [v3 setKeyedNumbers:v8];
}

@end