@interface ATXScorableTimeDNDModeWrapper
- (ATXScorableTimeDNDModeWrapper)initWithDNDMode:(id)a3;
- (DNDMode)dndMode;
- (NSString)scorableTimeIdentifier;
@end

@implementation ATXScorableTimeDNDModeWrapper

- (ATXScorableTimeDNDModeWrapper)initWithDNDMode:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXScorableTimeDNDModeWrapper;
  v6 = [(ATXScorableTimeDNDModeWrapper *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dndMode, a3);
  }

  return v7;
}

- (NSString)scorableTimeIdentifier
{
  v2 = NSString;
  v3 = [(ATXScorableTimeDNDModeWrapper *)self dndMode];
  v4 = [v3 identifier];
  id v5 = [v4 UUIDString];
  v6 = [v2 stringWithFormat:@"dndModeUUID__%@", v5];

  return (NSString *)v6;
}

- (DNDMode)dndMode
{
  return self->_dndMode;
}

- (void).cxx_destruct
{
}

@end