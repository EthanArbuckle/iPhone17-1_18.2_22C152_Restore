@interface CLFBaseCommunicationLimitSettings_GeneratedCode
+ (id)allPreferenceSelectorsAsStrings;
- (BOOL)needsMigrationFor117558856;
- (CLFBaseCommunicationLimitSettings_GeneratedCode)init;
- (NSString)incomingCommunicationLimit;
- (NSString)outgoingCommunicationLimit;
- (void)setIncomingCommunicationLimit:(id)a3;
- (void)setNeedsMigrationFor117558856:(BOOL)a3;
- (void)setOutgoingCommunicationLimit:(id)a3;
@end

@implementation CLFBaseCommunicationLimitSettings_GeneratedCode

- (CLFBaseCommunicationLimitSettings_GeneratedCode)init
{
  v11.receiver = self;
  v11.super_class = (Class)CLFBaseCommunicationLimitSettings_GeneratedCode;
  v2 = [(CLFBaseSettings *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v4 = -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v2);
    v5 = NSStringFromSelector(sel_incomingCommunicationLimit);
    [v4 setObject:@"IncomingCommunicationLimit" forKeyedSubscript:v5];

    v6 = -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v7 = NSStringFromSelector(sel_needsMigrationFor117558856);
    [v6 setObject:@"NeedsMigrationFor117558856" forKeyedSubscript:v7];

    v8 = -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v9 = NSStringFromSelector(sel_outgoingCommunicationLimit);
    [v8 setObject:@"OutgoingCommunicationLimit" forKeyedSubscript:v9];
  }
  return v3;
}

+ (id)allPreferenceSelectorsAsStrings
{
  v10[3] = *MEMORY[0x263EF8340];
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___CLFBaseCommunicationLimitSettings_GeneratedCode;
  v2 = objc_msgSendSuper2(&v9, sel_allPreferenceSelectorsAsStrings);
  v3 = NSStringFromSelector(sel_incomingCommunicationLimit);
  v10[0] = v3;
  v4 = NSStringFromSelector(sel_needsMigrationFor117558856);
  v10[1] = v4;
  v5 = NSStringFromSelector(sel_outgoingCommunicationLimit);
  v10[2] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:3];
  v7 = [v2 arrayByAddingObjectsFromArray:v6];

  return v7;
}

- (NSString)incomingCommunicationLimit
{
  uint64_t v3 = objc_opt_class();
  return (NSString *)[(AXBaseSettings *)self objectValueForPreferenceKey:@"IncomingCommunicationLimit" ofClass:v3 defaultValue:@"contacts"];
}

- (void)setIncomingCommunicationLimit:(id)a3
{
}

- (BOOL)needsMigrationFor117558856
{
  return [(AXBaseSettings *)self BOOLValueForPreferenceKey:@"NeedsMigrationFor117558856" defaultValue:1];
}

- (void)setNeedsMigrationFor117558856:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"NeedsMigrationFor117558856"];
}

- (NSString)outgoingCommunicationLimit
{
  uint64_t v3 = objc_opt_class();
  return (NSString *)[(AXBaseSettings *)self objectValueForPreferenceKey:@"OutgoingCommunicationLimit" ofClass:v3 defaultValue:@"contacts"];
}

- (void)setOutgoingCommunicationLimit:(id)a3
{
}

@end