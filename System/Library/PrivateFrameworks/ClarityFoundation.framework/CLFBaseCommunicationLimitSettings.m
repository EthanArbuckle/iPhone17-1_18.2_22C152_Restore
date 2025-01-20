@interface CLFBaseCommunicationLimitSettings
- (BOOL)requiresMoreRestrictiveOutgoingCommunicationLimit;
- (NSString)legacyIncomingCommunicationLimit;
- (NSString)legacyOutgoingCommunicationLimit;
- (id)outgoingCommunicationLimit;
- (void)migrateCommunicationLimitsIfNecessary;
- (void)setIncomingCommunicationLimit:(id)a3;
- (void)setLegacyIncomingCommunicationLimit:(id)a3;
- (void)setOutgoingCommunicationLimit:(id)a3;
@end

@implementation CLFBaseCommunicationLimitSettings

- (void)setIncomingCommunicationLimit:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLFBaseCommunicationLimitSettings;
  [(CLFBaseCommunicationLimitSettings_GeneratedCode *)&v9 setIncomingCommunicationLimit:v4];
  if ([(CLFBaseCommunicationLimitSettings *)self requiresMoreRestrictiveOutgoingCommunicationLimit])
  {
    v5 = [(CLFBaseCommunicationLimitSettings *)self outgoingCommunicationLimit];
    int v6 = [v5 isLessRestrictiveThanCommunicationLimit:v4];

    if (v6)
    {
      v7 = +[CLFLog commonLog];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = [(CLFBaseCommunicationLimitSettings *)self outgoingCommunicationLimit];
        *(_DWORD *)buf = 138412546;
        v11 = v8;
        __int16 v12 = 2112;
        id v13 = v4;
        _os_log_impl(&dword_217F54000, v7, OS_LOG_TYPE_DEFAULT, "Updating outgoing communication limit \"%@\" to be at least as restrictive as incoming communication limit \"%@\".", buf, 0x16u);
      }
      [(CLFBaseCommunicationLimitSettings *)self setOutgoingCommunicationLimit:v4];
    }
  }
}

- (id)outgoingCommunicationLimit
{
  [(CLFBaseCommunicationLimitSettings *)self migrateCommunicationLimitsIfNecessary];
  v5.receiver = self;
  v5.super_class = (Class)CLFBaseCommunicationLimitSettings;
  v3 = [(CLFBaseCommunicationLimitSettings_GeneratedCode *)&v5 outgoingCommunicationLimit];
  return v3;
}

- (void)setOutgoingCommunicationLimit:(id)a3
{
  id v4 = a3;
  if (-[CLFBaseCommunicationLimitSettings requiresMoreRestrictiveOutgoingCommunicationLimit](self, "requiresMoreRestrictiveOutgoingCommunicationLimit")&& (-[CLFBaseCommunicationLimitSettings_GeneratedCode incomingCommunicationLimit](self, "incomingCommunicationLimit"), v5 = objc_claimAutoreleasedReturnValue(), int v6 = [v4 isLessRestrictiveThanCommunicationLimit:v5], v5, v6))
  {
    v7 = +[CLFLog commonLog];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      [(CLFBaseCommunicationLimitSettings(Additions) *)(uint64_t)v4 setOutgoingCommunicationLimit:v7];
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CLFBaseCommunicationLimitSettings;
    [(CLFBaseCommunicationLimitSettings_GeneratedCode *)&v8 setOutgoingCommunicationLimit:v4];
  }
}

- (NSString)legacyIncomingCommunicationLimit
{
  v4.receiver = self;
  v4.super_class = (Class)CLFBaseCommunicationLimitSettings;
  v2 = [(CLFBaseCommunicationLimitSettings_GeneratedCode *)&v4 incomingCommunicationLimit];
  return (NSString *)v2;
}

- (void)setLegacyIncomingCommunicationLimit:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CLFBaseCommunicationLimitSettings;
  [(CLFBaseCommunicationLimitSettings_GeneratedCode *)&v3 setIncomingCommunicationLimit:a3];
}

- (void)migrateCommunicationLimitsIfNecessary
{
  if ([(CLFBaseCommunicationLimitSettings_GeneratedCode *)self needsMigrationFor117558856])
  {
    id v3 = [(CLFBaseCommunicationLimitSettings *)self legacyOutgoingCommunicationLimit];
    [(CLFBaseCommunicationLimitSettings *)self setOutgoingCommunicationLimit:v3];
    [(CLFBaseCommunicationLimitSettings_GeneratedCode *)self setNeedsMigrationFor117558856:0];
  }
}

- (BOOL)requiresMoreRestrictiveOutgoingCommunicationLimit
{
  return 1;
}

- (NSString)legacyOutgoingCommunicationLimit
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return (NSString *)@"selectedContacts";
}

@end