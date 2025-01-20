@interface NPHServiceSubscriptionInfo
- (BOOL)shouldOfferRemotePlan;
- (BOOL)shouldOfferSignupCompletion;
- (BOOL)shouldOfferTrialPlan;
- (BOOL)shouldShowAddNewRemotePlan;
- (CTXPCServiceSubscriptionContext)serviceSubscriptionContext;
- (NSError)persistentError;
- (NSString)SIMStatus;
- (NSString)trialPlanType;
- (id)description;
- (unint64_t)planFlows;
- (void)setPersistentError:(id)a3;
- (void)setPlanFlows:(unint64_t)a3;
- (void)setSIMStatus:(id)a3;
- (void)setServiceSubscriptionContext:(id)a3;
- (void)setShouldOfferRemotePlan:(BOOL)a3;
- (void)setShouldOfferSignupCompletion:(BOOL)a3;
- (void)setShouldOfferTrialPlan:(BOOL)a3;
- (void)setShouldShowAddNewRemotePlan:(BOOL)a3;
- (void)setTrialPlanType:(id)a3;
@end

@implementation NPHServiceSubscriptionInfo

- (NSString)SIMStatus
{
  return self->_SIMStatus;
}

- (void)setSIMStatus:(id)a3
{
}

- (void)setShouldOfferRemotePlan:(BOOL)a3
{
  self->_shouldOfferRemotePlan = a3;
}

- (void)setServiceSubscriptionContext:(id)a3
{
}

- (id)description
{
  v15 = NSString;
  v16.receiver = self;
  v16.super_class = (Class)NPHServiceSubscriptionInfo;
  v3 = [(NPHServiceSubscriptionInfo *)&v16 description];
  v4 = [(NPHServiceSubscriptionInfo *)self serviceSubscriptionContext];
  BOOL v5 = [(NPHServiceSubscriptionInfo *)self shouldShowAddNewRemotePlan];
  BOOL v6 = [(NPHServiceSubscriptionInfo *)self shouldOfferRemotePlan];
  BOOL v7 = [(NPHServiceSubscriptionInfo *)self shouldOfferTrialPlan];
  BOOL v8 = [(NPHServiceSubscriptionInfo *)self shouldOfferSignupCompletion];
  v9 = [(NPHServiceSubscriptionInfo *)self trialPlanType];
  v10 = [(NPHServiceSubscriptionInfo *)self SIMStatus];
  unint64_t v11 = [(NPHServiceSubscriptionInfo *)self planFlows];
  v12 = [(NPHServiceSubscriptionInfo *)self persistentError];
  v13 = [v15 stringWithFormat:@"%@ serviceSubscriptionContext: %@ shouldShowAddNewRemotePlan: %d shouldOfferRemotePlan: %d shouldOfferTrialPlan: %d shouldOfferSignupCompletion: %d trialPlanType: %@ SIMStatus: %@ planFlows: %lx persistentError: %@", v3, v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return v13;
}

- (CTXPCServiceSubscriptionContext)serviceSubscriptionContext
{
  return self->_serviceSubscriptionContext;
}

- (BOOL)shouldShowAddNewRemotePlan
{
  return self->_shouldShowAddNewRemotePlan;
}

- (void)setShouldShowAddNewRemotePlan:(BOOL)a3
{
  self->_shouldShowAddNewRemotePlan = a3;
}

- (BOOL)shouldOfferRemotePlan
{
  return self->_shouldOfferRemotePlan;
}

- (BOOL)shouldOfferTrialPlan
{
  return self->_shouldOfferTrialPlan;
}

- (void)setShouldOfferTrialPlan:(BOOL)a3
{
  self->_shouldOfferTrialPlan = a3;
}

- (BOOL)shouldOfferSignupCompletion
{
  return self->_shouldOfferSignupCompletion;
}

- (void)setShouldOfferSignupCompletion:(BOOL)a3
{
  self->_shouldOfferSignupCompletion = a3;
}

- (NSString)trialPlanType
{
  return self->_trialPlanType;
}

- (void)setTrialPlanType:(id)a3
{
}

- (unint64_t)planFlows
{
  return self->_planFlows;
}

- (void)setPlanFlows:(unint64_t)a3
{
  self->_planFlows = a3;
}

- (NSError)persistentError
{
  return self->_persistentError;
}

- (void)setPersistentError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentError, 0);
  objc_storeStrong((id *)&self->_SIMStatus, 0);
  objc_storeStrong((id *)&self->_trialPlanType, 0);
  objc_storeStrong((id *)&self->_serviceSubscriptionContext, 0);
}

@end