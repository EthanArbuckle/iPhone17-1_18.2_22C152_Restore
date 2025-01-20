@interface CLKComplicationWidgetMigrationConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CLKComplicationWidgetMigrationConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initPrivate;
@end

@implementation CLKComplicationWidgetMigrationConfiguration

- (id)initPrivate
{
  v3.receiver = self;
  v3.super_class = (Class)CLKComplicationWidgetMigrationConfiguration;
  return [(CLKComplicationWidgetMigrationConfiguration *)&v3 init];
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();

  return [v4 isEqual:v5];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = (void *)[(id)objc_opt_class() allocWithZone:a3];

  return (id)[v3 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLKComplicationWidgetMigrationConfiguration)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CLKComplicationWidgetMigrationConfiguration;
  return [(CLKComplicationWidgetMigrationConfiguration *)&v4 init];
}

@end