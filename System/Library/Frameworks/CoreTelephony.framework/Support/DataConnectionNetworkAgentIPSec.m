@interface DataConnectionNetworkAgentIPSec
+ (id)agentDomain;
+ (id)agentFromData:(id)a3;
+ (id)agentType;
- (BOOL)isActive;
- (BOOL)isKernelActivated;
- (BOOL)isNetworkProvider;
- (BOOL)isSpecificUseOnly;
- (BOOL)isUserActivated;
- (BOOL)isVoluntary;
- (BOOL)requiresAssert;
- (BOOL)startAgentWithOptions:(id)a3;
- (BOOL)updateClientsImmediately;
- (DataConnectionNetworkAgentIPSec)init;
- (NSString)agentDescription;
- (NSUUID)agentUUID;
- (id)copyAgentData;
- (void)setActive:(BOOL)a3;
- (void)setAgentDescription:(id)a3;
- (void)setAgentUUID:(id)a3;
- (void)setKernelActivated:(BOOL)a3;
- (void)setNetworkProvider:(BOOL)a3;
- (void)setSpecificUseOnly:(BOOL)a3;
- (void)setUpdateClientsImmediately:(BOOL)a3;
- (void)setUserActivated:(BOOL)a3;
- (void)setVoluntary:(BOOL)a3;
@end

@implementation DataConnectionNetworkAgentIPSec

- (DataConnectionNetworkAgentIPSec)init
{
  v7.receiver = self;
  v7.super_class = (Class)DataConnectionNetworkAgentIPSec;
  v2 = [(DataConnectionNetworkAgentIPSec *)&v7 init];
  if (v2)
  {
    v3 = [(id)objc_opt_class() agentType];
    v4 = +[NSString stringWithFormat:@"%@: %@", @"CommCenter", v3];
    [(DataConnectionNetworkAgentIPSec *)v2 setAgentDescription:v4];

    [(DataConnectionNetworkAgentIPSec *)v2 setActive:1];
    [(DataConnectionNetworkAgentIPSec *)v2 setVoluntary:0];
    [(DataConnectionNetworkAgentIPSec *)v2 setNetworkProvider:0];
    [(DataConnectionNetworkAgentIPSec *)v2 setUserActivated:0];
    [(DataConnectionNetworkAgentIPSec *)v2 setKernelActivated:0];
    v5 = +[NSUUID UUID];
    [(DataConnectionNetworkAgentIPSec *)v2 setAgentUUID:v5];

    [(DataConnectionNetworkAgentIPSec *)v2 setSpecificUseOnly:0];
  }
  return v2;
}

+ (id)agentDomain
{
  return @"TelephonyIPSec";
}

+ (id)agentType
{
  return @"TelephonyIPSec";
}

- (BOOL)requiresAssert
{
  return 0;
}

- (BOOL)startAgentWithOptions:(id)a3
{
  return 1;
}

+ (id)agentFromData:(id)a3
{
  v3 = objc_opt_new();

  return v3;
}

- (id)copyAgentData
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSUUID)agentUUID
{
  return self->agentUUID;
}

- (void)setAgentUUID:(id)a3
{
}

- (NSString)agentDescription
{
  return self->agentDescription;
}

- (void)setAgentDescription:(id)a3
{
}

- (BOOL)isActive
{
  return self->active;
}

- (void)setActive:(BOOL)a3
{
  self->active = a3;
}

- (BOOL)isKernelActivated
{
  return self->kernelActivated;
}

- (void)setKernelActivated:(BOOL)a3
{
  self->kernelActivated = a3;
}

- (BOOL)isUserActivated
{
  return self->userActivated;
}

- (void)setUserActivated:(BOOL)a3
{
  self->userActivated = a3;
}

- (BOOL)isVoluntary
{
  return self->voluntary;
}

- (void)setVoluntary:(BOOL)a3
{
  self->voluntary = a3;
}

- (BOOL)isNetworkProvider
{
  return self->networkProvider;
}

- (void)setNetworkProvider:(BOOL)a3
{
  self->networkProvider = a3;
}

- (BOOL)isSpecificUseOnly
{
  return self->specificUseOnly;
}

- (void)setSpecificUseOnly:(BOOL)a3
{
  self->specificUseOnly = a3;
}

- (BOOL)updateClientsImmediately
{
  return self->updateClientsImmediately;
}

- (void)setUpdateClientsImmediately:(BOOL)a3
{
  self->updateClientsImmediately = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->agentDescription, 0);

  objc_storeStrong((id *)&self->agentUUID, 0);
}

@end