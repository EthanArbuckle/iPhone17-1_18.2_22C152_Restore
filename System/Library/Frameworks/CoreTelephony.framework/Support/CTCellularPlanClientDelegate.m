@interface CTCellularPlanClientDelegate
- (BOOL)getValue:(id)a3;
- (BOOL)hasCellularPlanEntitlement;
- (BOOL)hasEntitlement:(id)a3;
- (CTCellularPlanClientDelegate)initWithServer:(id)a3 andConnection:(id)a4;
- (void)activatePlanPendingTransfer:(id)a3 completion:(id)a4;
- (void)addNewPlanWithAddress:(id)a3 matchingId:(id)a4 oid:(id)a5 confirmationCode:(id)a6 triggerType:(int64_t)a7 userConsent:(int64_t)a8 completion:(id)a9;
- (void)addNewPlanWithCardData:(id)a3 confirmationCode:(id)a4 triggerType:(int64_t)a5 userConsent:(int64_t)a6 completion:(id)a7;
- (void)addNewPlanWithFlowType:(unint64_t)a3 completion:(id)a4;
- (void)addNewRemotePlan:(BOOL)a3 withCSN:(id)a4 withContext:(id)a5 userConsent:(int64_t)a6 completion:(id)a7;
- (void)addNewRemotePlanWithAddress:(id)a3 matchingId:(id)a4 oid:(id)a5 confirmationCode:(id)a6 isPairing:(BOOL)a7 withCSN:(id)a8 withContext:(id)a9 userConsent:(int64_t)a10 completion:(id)a11;
- (void)addNewRemotePlanWithCardData:(id)a3 confirmationCode:(id)a4 isPairing:(BOOL)a5 withCSN:(id)a6 withContext:(id)a7 userConsent:(int64_t)a8 completion:(id)a9;
- (void)cancelPlanActivation:(id)a3 completion:(id)a4;
- (void)carrierItemsShouldUpdate:(BOOL)a3 completion:(id)a4;
- (void)danglingPlanItemsShouldUpdate:(BOOL)a3 completion:(id)a4;
- (void)dealloc;
- (void)deleteAllRemoteProfiles;
- (void)deletePlanPendingTransfer:(id)a3 completion:(id)a4;
- (void)deleteRemoteProfile:(id)a3;
- (void)didCancelRemotePlan;
- (void)didDeletePlanItem:(id)a3 completion:(id)a4;
- (void)didDeleteRemotePlanItem:(id)a3 completion:(id)a4;
- (void)didEnablePlanItems:(id)a3 completion:(id)a4;
- (void)didPurchasePlanForCarrier:(id)a3 mnc:(id)a4 gid1:(id)a5 gid2:(id)a6 state:(id)a7;
- (void)didPurchasePlanForCsn:(id)a3 iccid:(id)a4 profileServer:(id)a5 state:(id)a6;
- (void)didPurchasePlanWithIccid:(id)a3 downloadProfile:(BOOL)a4;
- (void)didPurchaseRemotePlanForEid:(id)a3 imei:(id)a4 meid:(id)a5 iccid:(id)a6 alternateSmdpFqdn:(id)a7 completion:(id)a8;
- (void)didSelectPlanForData:(id)a3 completion:(id)a4;
- (void)didSelectPlanForDefaultVoice:(id)a3 completion:(id)a4;
- (void)didSelectPlanItem:(id)a3 enable:(BOOL)a4 completion:(id)a5;
- (void)didSelectPlansForIMessage:(id)a3 completion:(id)a4;
- (void)didSelectRemotePlanItem:(id)a3 completion:(id)a4;
- (void)didTransferPlanForCsn:(id)a3 iccid:(id)a4 srcIccid:(id)a5 profileServer:(id)a6 state:(id)a7;
- (void)eraseAllPlansWithCompletion:(id)a3;
- (void)eraseAllRemotePlansWithCompletion:(id)a3;
- (void)expirePlan;
- (void)fetchRemoteProfiles:(id)a3;
- (void)finishProvisioningWithCompletion:(id)a3;
- (void)finishRemoteProvisioningWithCompletion:(id)a3;
- (void)getAutoPlanSelectionWithCompletion:(id)a3;
- (void)getIMEIPrefix:(id)a3;
- (void)getPhoneAuthTokenWithMessage:(id)a3 completion:(id)a4;
- (void)getPlansPendingTransferForTestabilityWithCompletion:(id)a3;
- (void)getPlansPendingTransferWithCompletion:(id)a3;
- (void)getPredefinedLabels:(id)a3;
- (void)getRemoteInfo:(id)a3;
- (void)getRoamingSignupOverrideWithCompletion:(id)a3;
- (void)getSelectedEnv:(id)a3;
- (void)getSelectedProxy:(id)a3;
- (void)getShortLabelsForLabels:(id)a3 completion:(id)a4;
- (void)getSkipEligibilityCheck:(id)a3;
- (void)getSubscriptionContextUUIDforPlan:(id)a3 completion:(id)a4;
- (void)getSupportedFlowTypes:(id)a3;
- (void)installPendingRemotePlan:(id)a3 completion:(id)a4;
- (void)isRemotePlanCapableWithContext:(id)a3 completion:(id)a4;
- (void)latitudeLongitudeOverride:(id)a3;
- (void)manageAccountForRemotePlan:(id)a3 completion:(id)a4;
- (void)mccMncOverride:(id)a3;
- (void)notifyClient:(id)a3;
- (void)pendingReleaseRemotePlan;
- (void)persistValue:(id)a3 value:(BOOL)a4;
- (void)ping;
- (void)planItemsWithCompletion:(id)a3;
- (void)remapSimLabel:(id)a3 to:(id)a4 completion:(id)a5;
- (void)remotePlanItemsWithUpdateFetch:(BOOL)a3 completion:(id)a4;
- (void)remoteUserDidProvideResponse:(BOOL)a3 confirmationCode:(id)a4 plan:(id)a5 completion:(id)a6;
- (void)resolveSimLabel:(id)a3 completion:(id)a4;
- (void)resumePlanProvisioning:(BOOL)a3 userConsent:(int64_t)a4 completion:(id)a5;
- (void)selectRemoteProfile:(id)a3;
- (void)setAutoPlanSelection:(BOOL)a3;
- (void)setIMEIPrefix:(id)a3;
- (void)setLabelForPlan:(id)a3 label:(id)a4 completion:(id)a5;
- (void)setLatitude:(id)a3 andLongitude:(id)a4;
- (void)setMcc:(int64_t)a3 andMnc:(int64_t)a4;
- (void)setRoamingSignupOverride:(BOOL)a3;
- (void)setSelectedEnv:(int64_t)a3;
- (void)setSelectedProxy:(int64_t)a3;
- (void)setSkipEligibilityCheck:(BOOL)a3;
- (void)setUserInPurchaseFlow:(BOOL)a3;
- (void)shouldShowAddNewRemotePlanWithContext:(id)a3 completion:(id)a4;
- (void)shouldShowPlanSetup:(id)a3;
- (void)showUiIgnoringActivationFlags:(BOOL)a3;
- (void)startProvisioningWithCompletion:(id)a3;
- (void)startRemoteProvisioningWithCompletion:(id)a3;
- (void)userDidProvideResponse:(int64_t)a3 confirmationCode:(id)a4 plan:(id)a5 completion:(id)a6;
- (void)userSignupInitiatedOrFailed;
@end

@implementation CTCellularPlanClientDelegate

- (CTCellularPlanClientDelegate)initWithServer:(id)a3 andConnection:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CTCellularPlanClientDelegate;
  v6 = [(CTCellularPlanClientDelegate *)&v8 init];
  if (v6)
  {
    v6->fConnection = (NSXPCConnection *)a4;
    v6->fServer = (CTCellularPlanServer *)a3;
    v6->fLogHandle = (os_log_s *)os_log_create(kCtLoggingSystemName, "cp.server");
  }
  return v6;
}

- (BOOL)hasEntitlement:(id)a3
{
  BOOL result = 0;
  if (a3 && self->fConnection)
  {
    objc_sync_enter(self);
    if (!self->fEntitlements)
    {
      self->fEntitlements = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      id v6 = [(NSXPCConnection *)self->fConnection valueForEntitlement:@"com.apple.CommCenter.fine-grained"];
      if (v6)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v13 = 0u;
          long long v14 = 0u;
          long long v11 = 0u;
          long long v12 = 0u;
          id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
          if (v7)
          {
            uint64_t v8 = *(void *)v12;
            do
            {
              for (i = 0; i != v7; i = (char *)i + 1)
              {
                if (*(void *)v12 != v8) {
                  objc_enumerationMutation(v6);
                }
                uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8 * i);
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  [(NSMutableSet *)self->fEntitlements addObject:v10];
                }
              }
              id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
            }
            while (v7);
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [(NSMutableSet *)self->fEntitlements addObject:v6];
          }
        }
      }
    }
    objc_sync_exit(self);
    return [(NSMutableSet *)self->fEntitlements containsObject:a3];
  }
  return result;
}

- (BOOL)hasCellularPlanEntitlement
{
  BOOL v3 = [(CTCellularPlanClientDelegate *)self hasEntitlement:@"cellular-plan"];
  if (!v3)
  {
    if ([(CTCellularPlanServer *)self->fServer logger])
    {
      v4 = *(NSObject **)[(CTCellularPlanServer *)self->fServer logger];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136315138;
        id v7 = "-[CTCellularPlanClientDelegate hasCellularPlanEntitlement]";
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#I DEBUG: %s: Missing CellularPlan entitlement. Request dropped", (uint8_t *)&v6, 0xCu);
      }
    }
  }
  return v3;
}

- (void)notifyClient:(id)a3
{
  fConnection = self->fConnection;
  if (fConnection && [(NSXPCConnection *)fConnection _queue])
  {
    int v6 = [(NSXPCConnection *)self->fConnection _queue];
    dispatch_async(v6, a3);
  }
}

- (void)persistValue:(id)a3 value:(BOOL)a4
{
  BOOL v4 = a4;
  CCPreferences::create(v9, (CCPreferences *)self);
  uint64_t v7 = v9[0];
  int v6 = (std::__shared_weak_count *)v9[1];
  uint64_t v8 = &kCFBooleanTrue;
  if (!v4) {
    uint64_t v8 = &kCFBooleanFalse;
  }
  (*(void (**)(uint64_t, id, const CFBooleanRef, const __CFString *, const CFStringRef, const CFStringRef))(*(void *)v9[0] + 16))(v9[0], a3, *v8, @"com.apple.commcenter.device_specific_nobackup", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  (*(void (**)(uint64_t, const __CFString *, const CFStringRef, const CFStringRef))(*(void *)v7 + 48))(v7, @"com.apple.commcenter.device_specific_nobackup", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  if (v6) {
    sub_10004D2C8(v6);
  }
}

- (BOOL)getValue:(id)a3
{
  CCPreferences::create((uint64_t *)cf, (CCPreferences *)self);
  CFTypeRef v3 = cf[0];
  BOOL v4 = (std::__shared_weak_count *)cf[1];
  cf[0] = 0;
  (*(void (**)(CFTypeRef *__return_ptr))(*(void *)v3 + 40))(cf);
  v5 = (BOOL *)cf[0];
  if (cf[0]) {
    int v6 = sub_100080934;
  }
  else {
    int v6 = 0;
  }
  if (v6)
  {
    BOOL v7 = 1;
    char v12 = 1;
    if (cf[0])
    {
      CFTypeID v8 = CFGetTypeID(cf[0]);
      if (v8 == CFBooleanGetTypeID())
      {
        ctu::cf::assign((ctu::cf *)&v12, v5, v9);
        BOOL v7 = v12 != 0;
      }
      else
      {
        BOOL v7 = 1;
      }
    }
  }
  else
  {
    BOOL v7 = 0;
  }
  sub_1000577C4(cf);
  if (v4) {
    sub_10004D2C8(v4);
  }
  return v7;
}

- (void)ping
{
}

- (void)shouldShowPlanSetup:(id)a3
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100EE9C48;
    v6[3] = &unk_101A6B0D8;
    v6[4] = self;
    v6[5] = a3;
    [(CTCellularPlanServer *)fServer shouldShowPlanSetup:v6];
  }
  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100EE9C34;
    v7[3] = &unk_101A6B088;
    v7[4] = a3;
    [(CTCellularPlanClientDelegate *)self notifyClient:v7];
  }
}

- (void)getSupportedFlowTypes:(id)a3
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100EE9E0C;
    v6[3] = &unk_101A6B128;
    v6[4] = self;
    v6[5] = a3;
    [(CTCellularPlanServer *)fServer getSupportedFlowTypes:v6];
  }
  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100EE9DB8;
    v7[3] = &unk_101A6B088;
    v7[4] = a3;
    [(CTCellularPlanClientDelegate *)self notifyClient:v7];
  }
}

- (void)startProvisioningWithCompletion:(id)a3
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100EE9F90;
    v6[3] = &unk_101A6B0D8;
    v6[4] = self;
    v6[5] = a3;
    [(CTCellularPlanServer *)fServer startProvisioningWithCompletion:v6];
  }
  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100EE9F7C;
    v7[3] = &unk_101A6B088;
    v7[4] = a3;
    [(CTCellularPlanClientDelegate *)self notifyClient:v7];
  }
}

- (void)finishProvisioningWithCompletion:(id)a3
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100EEA114;
    v6[3] = &unk_101A6B0D8;
    v6[4] = self;
    v6[5] = a3;
    [(CTCellularPlanServer *)fServer finishProvisioningWithCompletion:v6];
  }
  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100EEA100;
    v7[3] = &unk_101A6B088;
    v7[4] = a3;
    [(CTCellularPlanClientDelegate *)self notifyClient:v7];
  }
}

- (void)addNewPlanWithCardData:(id)a3 confirmationCode:(id)a4 triggerType:(int64_t)a5 userConsent:(int64_t)a6 completion:(id)a7
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100EEA304;
    v14[3] = &unk_101A6B178;
    v14[4] = self;
    v14[5] = a7;
    [(CTCellularPlanServer *)fServer addNewPlanWithCardData:a3 confirmationCode:a4 triggerType:a5 userConsent:a6 completion:v14];
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100EEA2B4;
    v15[3] = &unk_101A6B088;
    v15[4] = a7;
    [(CTCellularPlanClientDelegate *)self notifyClient:v15];
  }
}

- (void)addNewPlanWithAddress:(id)a3 matchingId:(id)a4 oid:(id)a5 confirmationCode:(id)a6 triggerType:(int64_t)a7 userConsent:(int64_t)a8 completion:(id)a9
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100EEA504;
    v17[3] = &unk_101A6B178;
    v17[4] = self;
    v17[5] = a9;
    [(CTCellularPlanServer *)fServer addNewPlanWithAddress:a3 matchingId:a4 oid:a5 confirmationCode:a6 triggerType:a7 userConsent:a8 completion:v17];
  }
  else
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100EEA4B4;
    v18[3] = &unk_101A6B088;
    v18[4] = a9;
    [(CTCellularPlanClientDelegate *)self notifyClient:v18];
  }
}

- (void)addNewPlanWithFlowType:(unint64_t)a3 completion:(id)a4
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100EEA6CC;
    v8[3] = &unk_101A6B178;
    v8[4] = self;
    v8[5] = a4;
    [(CTCellularPlanServer *)fServer addNewPlanWithFlowType:a3 completion:v8];
  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    uint64_t v9[2] = sub_100EEA67C;
    v9[3] = &unk_101A6B088;
    v9[4] = a4;
    [(CTCellularPlanClientDelegate *)self notifyClient:v9];
  }
}

- (void)resumePlanProvisioning:(BOOL)a3 userConsent:(int64_t)a4 completion:(id)a5
{
  BOOL v7 = a3;
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100EEA89C;
    v10[3] = &unk_101A6B178;
    v10[4] = self;
    v10[5] = a5;
    [(CTCellularPlanServer *)fServer resumePlanProvisioning:v7 userConsent:a4 completion:v10];
  }
  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100EEA84C;
    v11[3] = &unk_101A6B088;
    v11[4] = a5;
    [(CTCellularPlanClientDelegate *)self notifyClient:v11];
  }
}

- (void)planItemsWithCompletion:(id)a3
{
  fLogHandle = self->fLogHandle;
  if (os_log_type_enabled(fLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v10 = "-[CTCellularPlanClientDelegate planItemsWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, fLogHandle, OS_LOG_TYPE_DEFAULT, "client invoking %s", buf, 0xCu);
  }
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100EEAAE0;
    v7[3] = &unk_101A6B1C8;
    v7[4] = self;
    void v7[5] = a3;
    [(CTCellularPlanServer *)fServer planItemsWithCompletion:v7];
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100EEAA8C;
    v8[3] = &unk_101A6B088;
    v8[4] = a3;
    [(CTCellularPlanClientDelegate *)self notifyClient:v8];
  }
}

- (void)danglingPlanItemsShouldUpdate:(BOOL)a3 completion:(id)a4
{
  BOOL v5 = a3;
  fLogHandle = self->fLogHandle;
  if (os_log_type_enabled(fLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    char v12 = "-[CTCellularPlanClientDelegate danglingPlanItemsShouldUpdate:completion:]";
    _os_log_impl((void *)&_mh_execute_header, fLogHandle, OS_LOG_TYPE_DEFAULT, "client invoking %s", buf, 0xCu);
  }
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    uint64_t v9[2] = sub_100EEAF10;
    v9[3] = &unk_101A6B1C8;
    v9[4] = self;
    void v9[5] = a4;
    [(CTCellularPlanServer *)fServer danglingPlanItemsShouldUpdate:v5 completion:v9];
  }
  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100EEAEBC;
    v10[3] = &unk_101A6B088;
    v10[4] = a4;
    [(CTCellularPlanClientDelegate *)self notifyClient:v10];
  }
}

- (void)getPlansPendingTransferWithCompletion:(id)a3
{
  fLogHandle = self->fLogHandle;
  if (os_log_type_enabled(fLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v10 = "-[CTCellularPlanClientDelegate getPlansPendingTransferWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, fLogHandle, OS_LOG_TYPE_DEFAULT, "client invoking %s", buf, 0xCu);
  }
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100EEB21C;
    v7[3] = &unk_101A6B1C8;
    v7[4] = self;
    void v7[5] = a3;
    [(CTCellularPlanServer *)fServer getPlansPendingTransferWithCompletion:v7];
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100EEB1C8;
    v8[3] = &unk_101A6B088;
    v8[4] = a3;
    [(CTCellularPlanClientDelegate *)self notifyClient:v8];
  }
}

- (void)getPlansPendingTransferForTestabilityWithCompletion:(id)a3
{
  fLogHandle = self->fLogHandle;
  if (os_log_type_enabled(fLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v10 = "-[CTCellularPlanClientDelegate getPlansPendingTransferForTestabilityWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, fLogHandle, OS_LOG_TYPE_DEFAULT, "client invoking %s", buf, 0xCu);
  }
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100EEB528;
    v7[3] = &unk_101A6B1C8;
    v7[4] = self;
    void v7[5] = a3;
    [(CTCellularPlanServer *)fServer getPlansPendingTransferForTestabilityWithCompletion:v7];
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100EEB4D4;
    v8[3] = &unk_101A6B088;
    v8[4] = a3;
    [(CTCellularPlanClientDelegate *)self notifyClient:v8];
  }
}

- (void)activatePlanPendingTransfer:(id)a3 completion:(id)a4
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100EEB7C4;
    v8[3] = &unk_101A6B218;
    v8[4] = self;
    void v8[5] = a4;
    [(CTCellularPlanServer *)fServer activatePlanPendingTransfer:a3 completion:v8];
  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    uint64_t v9[2] = sub_100EEB768;
    v9[3] = &unk_101A6B088;
    v9[4] = a4;
    [(CTCellularPlanClientDelegate *)self notifyClient:v9];
  }
}

- (void)cancelPlanActivation:(id)a3 completion:(id)a4
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    [(CTCellularPlanServer *)fServer cancelPlanActivation:a3 completion:a4];
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100EEB920;
    v8[3] = &unk_101A6B088;
    v8[4] = a4;
    [(CTCellularPlanClientDelegate *)self notifyClient:v8];
  }
}

- (void)deletePlanPendingTransfer:(id)a3 completion:(id)a4
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100EEBAB0;
    v8[3] = &unk_101A6B178;
    v8[4] = self;
    void v8[5] = a4;
    [(CTCellularPlanServer *)fServer deletePlanPendingTransfer:a3 completion:v8];
  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    uint64_t v9[2] = sub_100EEBA60;
    v9[3] = &unk_101A6B088;
    v9[4] = a4;
    [(CTCellularPlanClientDelegate *)self notifyClient:v9];
  }
}

- (void)resolveSimLabel:(id)a3 completion:(id)a4
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100EEBC78;
    v8[3] = &unk_101A6B178;
    v8[4] = self;
    void v8[5] = a4;
    [(CTCellularPlanServer *)fServer resolveSimLabel:a3 completion:v8];
  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    uint64_t v9[2] = sub_100EEBC28;
    v9[3] = &unk_101A6B088;
    v9[4] = a4;
    [(CTCellularPlanClientDelegate *)self notifyClient:v9];
  }
}

- (void)remapSimLabel:(id)a3 to:(id)a4 completion:(id)a5
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100EEBE48;
    v10[3] = &unk_101A6B178;
    v10[4] = self;
    void v10[5] = a5;
    [(CTCellularPlanServer *)fServer remapSimLabel:a3 to:a4 completion:v10];
  }
  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100EEBDF8;
    v11[3] = &unk_101A6B088;
    v11[4] = a5;
    [(CTCellularPlanClientDelegate *)self notifyClient:v11];
  }
}

- (void)carrierItemsShouldUpdate:(BOOL)a3 completion:(id)a4
{
  BOOL v5 = a3;
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100EEC014;
    v8[3] = &unk_101A6B1C8;
    v8[4] = self;
    void v8[5] = a4;
    [(CTCellularPlanServer *)fServer carrierItemsShouldUpdate:v5 completion:v8];
  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    uint64_t v9[2] = sub_100EEBFC0;
    v9[3] = &unk_101A6B088;
    v9[4] = a4;
    [(CTCellularPlanClientDelegate *)self notifyClient:v9];
  }
}

- (void)userDidProvideResponse:(int64_t)a3 confirmationCode:(id)a4 plan:(id)a5 completion:(id)a6
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100EEC200;
    v12[3] = &unk_101A6B290;
    v12[4] = self;
    v12[5] = a6;
    [(CTCellularPlanServer *)fServer userDidProvideResponse:a3 confirmationCode:a4 plan:a5 completion:v12];
  }
  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100EEC1AC;
    v13[3] = &unk_101A6B088;
    v13[4] = a6;
    [(CTCellularPlanClientDelegate *)self notifyClient:v13];
  }
}

- (void)didSelectPlanItem:(id)a3 enable:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100EEC3DC;
    v10[3] = &unk_101A6B290;
    v10[4] = self;
    void v10[5] = a5;
    [(CTCellularPlanServer *)fServer didSelectPlanItem:a3 enable:v6 completion:v10];
  }
  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100EEC388;
    v11[3] = &unk_101A6B088;
    v11[4] = a5;
    [(CTCellularPlanClientDelegate *)self notifyClient:v11];
  }
}

- (void)didSelectPlanForData:(id)a3 completion:(id)a4
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100EEC5B0;
    v8[3] = &unk_101A6B290;
    v8[4] = self;
    void v8[5] = a4;
    [(CTCellularPlanServer *)fServer didSelectPlanForData:a3 completion:v8];
  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    uint64_t v9[2] = sub_100EEC55C;
    v9[3] = &unk_101A6B088;
    v9[4] = a4;
    [(CTCellularPlanClientDelegate *)self notifyClient:v9];
  }
}

- (void)setLabelForPlan:(id)a3 label:(id)a4 completion:(id)a5
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100EEC78C;
    v10[3] = &unk_101A6B290;
    v10[4] = self;
    void v10[5] = a5;
    [(CTCellularPlanServer *)fServer setLabelForPlan:a3 label:a4 completion:v10];
  }
  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100EEC738;
    v11[3] = &unk_101A6B088;
    v11[4] = a5;
    [(CTCellularPlanClientDelegate *)self notifyClient:v11];
  }
}

- (void)didSelectPlanForDefaultVoice:(id)a3 completion:(id)a4
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100EEC960;
    v8[3] = &unk_101A6B290;
    v8[4] = self;
    void v8[5] = a4;
    [(CTCellularPlanServer *)fServer didSelectPlanForDefaultVoice:a3 completion:v8];
  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    uint64_t v9[2] = sub_100EEC90C;
    v9[3] = &unk_101A6B088;
    v9[4] = a4;
    [(CTCellularPlanClientDelegate *)self notifyClient:v9];
  }
}

- (void)didSelectPlansForIMessage:(id)a3 completion:(id)a4
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100EECB34;
    v8[3] = &unk_101A6B290;
    v8[4] = self;
    void v8[5] = a4;
    [(CTCellularPlanServer *)fServer didSelectPlansForIMessage:a3 completion:v8];
  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    uint64_t v9[2] = sub_100EECAE0;
    v9[3] = &unk_101A6B088;
    v9[4] = a4;
    [(CTCellularPlanClientDelegate *)self notifyClient:v9];
  }
}

- (void)didEnablePlanItems:(id)a3 completion:(id)a4
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100EECD04;
    v8[3] = &unk_101A6B178;
    v8[4] = self;
    void v8[5] = a4;
    [(CTCellularPlanServer *)fServer didEnablePlanItems:a3 completion:v8];
  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    uint64_t v9[2] = sub_100EECCB4;
    v9[3] = &unk_101A6B088;
    v9[4] = a4;
    [(CTCellularPlanClientDelegate *)self notifyClient:v9];
  }
}

- (void)didPurchasePlanWithIccid:(id)a3 downloadProfile:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    [(CTCellularPlanServer *)fServer didPurchasePlanWithIccid:a3 downloadProfile:v4];
  }
}

- (void)didDeletePlanItem:(id)a3 completion:(id)a4
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100EECF34;
    v8[3] = &unk_101A6B290;
    v8[4] = self;
    void v8[5] = a4;
    [(CTCellularPlanServer *)fServer didDeletePlanItem:a3 completion:v8];
  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    uint64_t v9[2] = sub_100EECEE0;
    v9[3] = &unk_101A6B088;
    v9[4] = a4;
    [(CTCellularPlanClientDelegate *)self notifyClient:v9];
  }
}

- (void)eraseAllPlansWithCompletion:(id)a3
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100EED0F8;
    v6[3] = &unk_101A6B290;
    v6[4] = self;
    v6[5] = a3;
    [(CTCellularPlanServer *)fServer eraseAllPlansWithCompletion:v6];
  }
  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100EED0A4;
    v7[3] = &unk_101A6B088;
    v7[4] = a3;
    [(CTCellularPlanClientDelegate *)self notifyClient:v7];
  }
}

- (void)didPurchasePlanForCsn:(id)a3 iccid:(id)a4 profileServer:(id)a5 state:(id)a6
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    [(CTCellularPlanServer *)fServer didPurchasePlanForCsn:a3 iccid:a4 profileServer:a5 state:a6];
  }
}

- (void)didPurchasePlanForCarrier:(id)a3 mnc:(id)a4 gid1:(id)a5 gid2:(id)a6 state:(id)a7
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    [(CTCellularPlanServer *)fServer didPurchasePlanForCarrier:a3 mnc:a4 gid1:a5 gid2:a6 state:a7];
  }
}

- (void)didTransferPlanForCsn:(id)a3 iccid:(id)a4 srcIccid:(id)a5 profileServer:(id)a6 state:(id)a7
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    [(CTCellularPlanServer *)fServer didTransferPlanForCsn:a3 iccid:a4 srcIccid:a5 profileServer:a6 state:a7];
  }
}

- (void)setUserInPurchaseFlow:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fConnection = self->fConnection;
    fServer = self->fServer;
    [(CTCellularPlanServer *)fServer setUserInPurchaseFlow:v3 withConnection:fConnection];
  }
}

- (void)expirePlan
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    [(CTCellularPlanServer *)fServer expirePlan];
  }
}

- (void)isRemotePlanCapableWithContext:(id)a3 completion:(id)a4
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100EED4B4;
    v8[3] = &unk_101A6B0D8;
    v8[4] = self;
    void v8[5] = a4;
    [(CTCellularPlanServer *)fServer isRemotePlanCapableWithContext:a3 completion:v8];
  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    uint64_t v9[2] = sub_100EED4A0;
    v9[3] = &unk_101A6B088;
    v9[4] = a4;
    [(CTCellularPlanClientDelegate *)self notifyClient:v9];
  }
}

- (void)shouldShowAddNewRemotePlanWithContext:(id)a3 completion:(id)a4
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100EED690;
    v8[3] = &unk_101A6B2E0;
    v8[4] = self;
    void v8[5] = a4;
    [(CTCellularPlanServer *)fServer shouldShowAddNewRemotePlanWithContext:a3 completion:v8];
  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    uint64_t v9[2] = sub_100EED634;
    v9[3] = &unk_101A6B088;
    v9[4] = a4;
    [(CTCellularPlanClientDelegate *)self notifyClient:v9];
  }
}

- (void)startRemoteProvisioningWithCompletion:(id)a3
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100EED81C;
    v6[3] = &unk_101A6B0D8;
    v6[4] = self;
    v6[5] = a3;
    [(CTCellularPlanServer *)fServer startRemoteProvisioningWithCompletion:v6];
  }
  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100EED808;
    v7[3] = &unk_101A6B088;
    v7[4] = a3;
    [(CTCellularPlanClientDelegate *)self notifyClient:v7];
  }
}

- (void)finishRemoteProvisioningWithCompletion:(id)a3
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100EED9A0;
    v6[3] = &unk_101A6B0D8;
    v6[4] = self;
    v6[5] = a3;
    [(CTCellularPlanServer *)fServer finishRemoteProvisioningWithCompletion:v6];
  }
  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100EED98C;
    v7[3] = &unk_101A6B088;
    v7[4] = a3;
    [(CTCellularPlanClientDelegate *)self notifyClient:v7];
  }
}

- (void)manageAccountForRemotePlan:(id)a3 completion:(id)a4
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100EEDB74;
    v8[3] = &unk_101A6B290;
    v8[4] = self;
    void v8[5] = a4;
    [(CTCellularPlanServer *)fServer manageAccountForRemotePlan:a3 completion:v8];
  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    uint64_t v9[2] = sub_100EEDB20;
    v9[3] = &unk_101A6B088;
    v9[4] = a4;
    [(CTCellularPlanClientDelegate *)self notifyClient:v9];
  }
}

- (void)addNewRemotePlan:(BOOL)a3 withCSN:(id)a4 withContext:(id)a5 userConsent:(int64_t)a6 completion:(id)a7
{
  BOOL v11 = a3;
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100EEDD64;
    v14[3] = &unk_101A6B178;
    v14[4] = self;
    v14[5] = a7;
    [(CTCellularPlanServer *)fServer addNewRemotePlan:v11 withCSN:a4 withContext:a5 userConsent:a6 completion:v14];
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100EEDD14;
    v15[3] = &unk_101A6B088;
    v15[4] = a7;
    [(CTCellularPlanClientDelegate *)self notifyClient:v15];
  }
}

- (void)addNewRemotePlanWithCardData:(id)a3 confirmationCode:(id)a4 isPairing:(BOOL)a5 withCSN:(id)a6 withContext:(id)a7 userConsent:(int64_t)a8 completion:(id)a9
{
  BOOL v12 = a5;
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100EEDF64;
    v17[3] = &unk_101A6B178;
    v17[4] = self;
    v17[5] = a9;
    [(CTCellularPlanServer *)fServer addNewRemotePlanWithCardData:a3 confirmationCode:a4 isPairing:v12 withCSN:a6 withContext:a7 userConsent:a8 completion:v17];
  }
  else
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100EEDF14;
    v18[3] = &unk_101A6B088;
    v18[4] = a9;
    [(CTCellularPlanClientDelegate *)self notifyClient:v18];
  }
}

- (void)addNewRemotePlanWithAddress:(id)a3 matchingId:(id)a4 oid:(id)a5 confirmationCode:(id)a6 isPairing:(BOOL)a7 withCSN:(id)a8 withContext:(id)a9 userConsent:(int64_t)a10 completion:(id)a11
{
  BOOL v12 = a7;
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100EEE16C;
    v19[3] = &unk_101A6B178;
    v19[4] = self;
    v19[5] = a11;
    [(CTCellularPlanServer *)fServer addNewRemotePlanWithAddress:a3 matchingId:a4 oid:a5 confirmationCode:a6 isPairing:v12 withCSN:a8 withContext:a9 userConsent:a10 completion:v19];
  }
  else
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100EEE11C;
    v20[3] = &unk_101A6B088;
    v20[4] = a11;
    [(CTCellularPlanClientDelegate *)self notifyClient:v20];
  }
}

- (void)installPendingRemotePlan:(id)a3 completion:(id)a4
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100EEE334;
    v8[3] = &unk_101A6B178;
    v8[4] = self;
    void v8[5] = a4;
    [(CTCellularPlanServer *)fServer installPendingRemotePlan:a3 completion:v8];
  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    uint64_t v9[2] = sub_100EEE2E4;
    v9[3] = &unk_101A6B088;
    v9[4] = a4;
    [(CTCellularPlanClientDelegate *)self notifyClient:v9];
  }
}

- (void)remotePlanItemsWithUpdateFetch:(BOOL)a3 completion:(id)a4
{
  BOOL v5 = a3;
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100EEE500;
    v8[3] = &unk_101A6B1C8;
    v8[4] = self;
    void v8[5] = a4;
    [(CTCellularPlanServer *)fServer remotePlanItemsWithUpdateFetch:v5 completion:v8];
  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    uint64_t v9[2] = sub_100EEE4AC;
    v9[3] = &unk_101A6B088;
    v9[4] = a4;
    [(CTCellularPlanClientDelegate *)self notifyClient:v9];
  }
}

- (void)didSelectRemotePlanItem:(id)a3 completion:(id)a4
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100EEE6D4;
    v8[3] = &unk_101A6B290;
    v8[4] = self;
    void v8[5] = a4;
    [(CTCellularPlanServer *)fServer didSelectRemotePlanItem:a3 completion:v8];
  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    uint64_t v9[2] = sub_100EEE680;
    v9[3] = &unk_101A6B088;
    v9[4] = a4;
    [(CTCellularPlanClientDelegate *)self notifyClient:v9];
  }
}

- (void)didDeleteRemotePlanItem:(id)a3 completion:(id)a4
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100EEE8A8;
    v8[3] = &unk_101A6B290;
    v8[4] = self;
    void v8[5] = a4;
    [(CTCellularPlanServer *)fServer didDeleteRemotePlanItem:a3 completion:v8];
  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    uint64_t v9[2] = sub_100EEE854;
    v9[3] = &unk_101A6B088;
    v9[4] = a4;
    [(CTCellularPlanClientDelegate *)self notifyClient:v9];
  }
}

- (void)didPurchaseRemotePlanForEid:(id)a3 imei:(id)a4 meid:(id)a5 iccid:(id)a6 alternateSmdpFqdn:(id)a7 completion:(id)a8
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100EEEA6C;
    v16[3] = &unk_101A6B0D8;
    v16[4] = self;
    v16[5] = a8;
    [(CTCellularPlanServer *)fServer didPurchaseRemotePlanForEid:a3 imei:a4 meid:a5 iccid:a6 alternateSmdpFqdn:a7 completion:v16];
  }
  else
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100EEEA58;
    v17[3] = &unk_101A6B088;
    v17[4] = a8;
    [(CTCellularPlanClientDelegate *)self notifyClient:v17];
  }
}

- (void)didCancelRemotePlan
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    [(CTCellularPlanServer *)fServer didCancelRemotePlan];
  }
}

- (void)pendingReleaseRemotePlan
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    [(CTCellularPlanServer *)fServer pendingReleaseRemotePlan];
  }
}

- (void)userSignupInitiatedOrFailed
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    [(CTCellularPlanServer *)fServer userSignupInitiatedOrFailed];
  }
}

- (void)eraseAllRemotePlansWithCompletion:(id)a3
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100EEED08;
    v6[3] = &unk_101A6B290;
    v6[4] = self;
    v6[5] = a3;
    [(CTCellularPlanServer *)fServer eraseAllRemotePlansWithCompletion:v6];
  }
  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100EEECB4;
    v7[3] = &unk_101A6B088;
    v7[4] = a3;
    [(CTCellularPlanClientDelegate *)self notifyClient:v7];
  }
}

- (void)remoteUserDidProvideResponse:(BOOL)a3 confirmationCode:(id)a4 plan:(id)a5 completion:(id)a6
{
  BOOL v9 = a3;
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100EEEEF4;
    v12[3] = &unk_101A6B290;
    v12[4] = self;
    v12[5] = a6;
    [(CTCellularPlanServer *)fServer remoteUserDidProvideResponse:v9 confirmationCode:a4 plan:a5 completion:v12];
  }
  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100EEEEA0;
    v13[3] = &unk_101A6B088;
    v13[4] = a6;
    [(CTCellularPlanClientDelegate *)self notifyClient:v13];
  }
}

- (void)getPredefinedLabels:(id)a3
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100EEF0B8;
    v6[3] = &unk_101A6B1C8;
    v6[4] = self;
    v6[5] = a3;
    [(CTCellularPlanServer *)fServer getPredefinedLabels:v6];
  }
  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100EEF064;
    v7[3] = &unk_101A6B088;
    v7[4] = a3;
    [(CTCellularPlanClientDelegate *)self notifyClient:v7];
  }
}

- (void)getSubscriptionContextUUIDforPlan:(id)a3 completion:(id)a4
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100EEF28C;
    v8[3] = &unk_101A6B308;
    v8[4] = self;
    void v8[5] = a4;
    [(CTCellularPlanServer *)fServer getSubscriptionContextUUIDforPlan:a3 completion:v8];
  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    uint64_t v9[2] = sub_100EEF238;
    v9[3] = &unk_101A6B088;
    v9[4] = a4;
    [(CTCellularPlanClientDelegate *)self notifyClient:v9];
  }
}

- (void)getShortLabelsForLabels:(id)a3 completion:(id)a4
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100EEF460;
    v8[3] = &unk_101A6B1C8;
    v8[4] = self;
    void v8[5] = a4;
    [(CTCellularPlanServer *)fServer getShortLabelsForLabels:a3 completion:v8];
  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    uint64_t v9[2] = sub_100EEF40C;
    v9[3] = &unk_101A6B088;
    v9[4] = a4;
    [(CTCellularPlanClientDelegate *)self notifyClient:v9];
  }
}

- (void)fetchRemoteProfiles:(id)a3
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    [(CTCellularPlanServer *)fServer fetchRemoteProfiles:a3];
  }
}

- (void)selectRemoteProfile:(id)a3
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    [(CTCellularPlanServer *)fServer selectRemoteProfile:a3];
  }
}

- (void)deleteRemoteProfile:(id)a3
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    [(CTCellularPlanServer *)fServer deleteRemoteProfile:a3];
  }
}

- (void)deleteAllRemoteProfiles
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    [(CTCellularPlanServer *)fServer deleteAllRemoteProfiles];
  }
}

- (void)getRemoteInfo:(id)a3
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100EEF6B0;
    v6[3] = &unk_101A6B330;
    v6[4] = self;
    v6[5] = a3;
    [(CTCellularPlanServer *)fServer getRemoteInfo:v6];
  }
}

- (void)getPhoneAuthTokenWithMessage:(id)a3 completion:(id)a4
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100EEF7D8;
    v8[3] = &unk_101A6B358;
    v8[4] = self;
    void v8[5] = a4;
    [(CTCellularPlanServer *)fServer getPhoneAuthTokenWithMessage:a3 completion:v8];
  }
}

- (void)getAutoPlanSelectionWithCompletion:(id)a3
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100EEF8F0;
    v6[3] = &unk_101A6B0D8;
    v6[4] = self;
    v6[5] = a3;
    [(CTCellularPlanServer *)fServer getAutoPlanSelectionWithCompletion:v6];
  }
}

- (void)setAutoPlanSelection:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    [(CTCellularPlanServer *)fServer setAutoPlanSelection:v3];
  }
}

- (void)getRoamingSignupOverrideWithCompletion:(id)a3
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100EEFA58;
    v6[3] = &unk_101A6B0D8;
    v6[4] = self;
    v6[5] = a3;
    [(CTCellularPlanServer *)fServer getRoamingSignupOverrideWithCompletion:v6];
  }
}

- (void)setRoamingSignupOverride:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    [(CTCellularPlanServer *)fServer setRoamingSignupOverride:v3];
  }
}

- (void)getSkipEligibilityCheck:(id)a3
{
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100EEFBC0;
    v6[3] = &unk_101A6B0D8;
    v6[4] = self;
    v6[5] = a3;
    [(CTCellularPlanServer *)fServer getSkipEligibilityCheck:v6];
  }
}

- (void)setSkipEligibilityCheck:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CTCellularPlanClientDelegate *)self hasCellularPlanEntitlement])
  {
    fServer = self->fServer;
    [(CTCellularPlanServer *)fServer setSkipEligibilityCheck:v3];
  }
}

- (void)getIMEIPrefix:(id)a3
{
  if (sub_10004D710())
  {
    memset(&v10, 0, sizeof(v10));
    uint64_t v4 = sub_100365D74();
    sub_100058DB0(__p, "IMEIPrefixKey");
    sub_100226284(v4, __p, &v10);
    if (v9 < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0)
    {
      if (v10.__r_.__value_.__l.__size_)
      {
        BOOL v5 = (std::string *)v10.__r_.__value_.__r.__words[0];
        goto LABEL_12;
      }
    }
    else if (*((unsigned char *)&v10.__r_.__value_.__s + 23))
    {
      BOOL v5 = &v10;
LABEL_12:
      BOOL v7 = +[NSString stringWithFormat:@"%s", v5];
      goto LABEL_14;
    }
    BOOL v7 = 0;
LABEL_14:
    (*((void (**)(id, NSString *))a3 + 2))(a3, v7);
    if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v10.__r_.__value_.__l.__data_);
    }
    return;
  }
  BOOL v6 = (void (*)(id, void))*((void *)a3 + 2);

  v6(a3, 0);
}

- (void)setIMEIPrefix:(id)a3
{
  if (sub_10004D710())
  {
    if (a3 && [a3 length])
    {
      memset(buf, 0, sizeof(buf));
      sub_100058DB0(buf, (char *)[a3 UTF8String]);
      BOOL v5 = (uint64_t **)sub_100365D74();
      sub_100058DB0(&__p, "IMEIPrefixKey");
      sub_1002266A4(v5, &__p, (uint64_t)buf);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if ((char)buf[23] < 0) {
        operator delete(*(void **)buf);
      }
      char v6 = 0;
    }
    else
    {
      BOOL v7 = (uint64_t **)sub_100365D74();
      sub_100058DB0(buf, "IMEIPrefixKey");
      sub_1003660FC(v7, (void **)buf);
      if ((char)buf[23] < 0) {
        operator delete(*(void **)buf);
      }
      char v6 = 1;
    }
    if ([(CTCellularPlanServer *)self->fServer logger])
    {
      CFTypeID v8 = *(NSObject **)[(CTCellularPlanServer *)self->fServer logger];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        if (v6) {
          CFStringRef v9 = @"cleared";
        }
        else {
          CFStringRef v9 = +[NSString stringWithValidatedFormat:@"%@%@", @"%@%@", 0, @"changed to ", a3 validFormatSpecifiers error];
        }
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "setIMEIPrefix";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I DEBUG: %s: IMEI prefix is %@", buf, 0x16u);
      }
    }
  }
}

- (void)getSelectedEnv:(id)a3
{
  if (sub_10004D710())
  {
    int v8 = -1;
    uint64_t v4 = sub_100365D74();
    sub_100058DB0(__p, "TestEnvIndexKey");
    sub_1004421D8(v4, __p, &v8);
    if (v7 < 0) {
      operator delete(__p[0]);
    }
    (*((void (**)(id, void))a3 + 2))(a3, v8);
  }
  else
  {
    BOOL v5 = (void (*)(id, uint64_t))*((void *)a3 + 2);
    v5(a3, -1);
  }
}

- (void)setSelectedEnv:(int64_t)a3
{
  if (sub_10004D710())
  {
    BOOL v5 = (uint64_t **)sub_100365D74();
    sub_100058DB0(&__p, "TestEnvIndexKey");
    if (a3 < 0)
    {
      sub_1003660FC(v5, (void **)&__p.__r_.__value_.__l.__data_);
    }
    else
    {
      int64_t v8 = a3;
      sub_100226354(v5, &__p, &v8);
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    [(CTCellularPlanServer *)self->fServer carrierItemsShouldUpdate:1 completion:&stru_101A6B378];
    if ([(CTCellularPlanServer *)self->fServer logger])
    {
      char v6 = *(NSObject **)[(CTCellularPlanServer *)self->fServer logger];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        if (a3 < 0) {
          CFStringRef v7 = @"cleared";
        }
        else {
          CFStringRef v7 = +[NSString stringWithValidatedFormat:@"%d", @"%d", 0, a3 validFormatSpecifiers error];
        }
        LODWORD(__p.__r_.__value_.__l.__data_) = 136315394;
        *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = (std::string::size_type)"setSelectedEnv";
        WORD2(__p.__r_.__value_.__r.__words[1]) = 2112;
        *(std::string::size_type *)((char *)&__p.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I DEBUG: %s: Env index is %@", (uint8_t *)&__p, 0x16u);
      }
    }
  }
}

- (void)getSelectedProxy:(id)a3
{
  if (sub_10004D710())
  {
    int v8 = -1;
    uint64_t v4 = sub_100365D74();
    sub_100058DB0(__p, "TestProxyIndexKey");
    sub_1004421D8(v4, __p, &v8);
    if (v7 < 0) {
      operator delete(__p[0]);
    }
    (*((void (**)(id, void))a3 + 2))(a3, v8);
  }
  else
  {
    BOOL v5 = (void (*)(id, uint64_t))*((void *)a3 + 2);
    v5(a3, -1);
  }
}

- (void)setSelectedProxy:(int64_t)a3
{
  if (sub_10004D710())
  {
    BOOL v5 = (uint64_t **)sub_100365D74();
    sub_100058DB0(&__p, "TestProxyIndexKey");
    if (a3 < 0)
    {
      sub_1003660FC(v5, (void **)&__p.__r_.__value_.__l.__data_);
    }
    else
    {
      int64_t v8 = a3;
      sub_100226354(v5, &__p, &v8);
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    [(CTCellularPlanServer *)self->fServer carrierItemsShouldUpdate:1 completion:&stru_101A6B398];
    if ([(CTCellularPlanServer *)self->fServer logger])
    {
      char v6 = *(NSObject **)[(CTCellularPlanServer *)self->fServer logger];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        if (a3 < 0) {
          CFStringRef v7 = @"cleared";
        }
        else {
          CFStringRef v7 = +[NSString stringWithValidatedFormat:@"%d", @"%d", 0, a3 validFormatSpecifiers error];
        }
        LODWORD(__p.__r_.__value_.__l.__data_) = 136315394;
        *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = (std::string::size_type)"setSelectedProxy";
        WORD2(__p.__r_.__value_.__r.__words[1]) = 2112;
        *(std::string::size_type *)((char *)&__p.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I DEBUG: %s: Proxy index is %@", (uint8_t *)&__p, 0x16u);
      }
    }
  }
}

- (void)mccMncOverride:(id)a3
{
  if (sub_10004D710())
  {
    int v10 = -1;
    int v9 = -1;
    uint64_t v4 = sub_100365D74();
    sub_100058DB0(__p, "SequoiaSignIdMap::MccOverride");
    sub_1004421D8(v4, __p, &v10);
    if (v8 < 0) {
      operator delete(__p[0]);
    }
    uint64_t v5 = sub_100365D74();
    sub_100058DB0(__p, "SequoiaSignIdMap::MncOverride");
    sub_1004421D8(v5, __p, &v9);
    if (v8 < 0) {
      operator delete(__p[0]);
    }
    (*((void (**)(id, void, void))a3 + 2))(a3, v10, v9);
  }
  else
  {
    char v6 = (void (*)(id, uint64_t, uint64_t))*((void *)a3 + 2);
    v6(a3, -1, -1);
  }
}

- (void)showUiIgnoringActivationFlags:(BOOL)a3
{
  BOOL v3 = a3;
  if (sub_10004D710())
  {
    [(CTCellularPlanClientDelegate *)self persistValue:@"ignoreEsimActivationState" value:v3];
  }
}

- (void)setMcc:(int64_t)a3 andMnc:(int64_t)a4
{
  if (sub_10004D710())
  {
    char v6 = (uint64_t **)sub_100365D74();
    if ((a4 | a3) < 0)
    {
      sub_100058DB0(&__p, "SequoiaSignIdMap::MccOverride");
      sub_1003660FC(v6, (void **)&__p.__r_.__value_.__l.__data_);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      char v8 = (uint64_t **)sub_100365D74();
      sub_100058DB0(&__p, "SequoiaSignIdMap::MncOverride");
      sub_1003660FC(v8, (void **)&__p.__r_.__value_.__l.__data_);
    }
    else
    {
      sub_100058DB0(&__p, "SequoiaSignIdMap::MccOverride");
      int64_t v9 = a3;
      sub_100226354(v6, &__p, &v9);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      CFStringRef v7 = (uint64_t **)sub_100365D74();
      sub_100058DB0(&__p, "SequoiaSignIdMap::MncOverride");
      int64_t v9 = a4;
      sub_100226354(v7, &__p, &v9);
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
}

- (void)latitudeLongitudeOverride:(id)a3
{
  if (sub_10004D710())
  {
    double v12 = 0.0;
    double v11 = 0.0;
    uint64_t v6 = sub_100365D74();
    sub_100058DB0(__p, "SequoiaSignIdMap::LatitudeOverride");
    sub_1002261A0(v6, __p, &v12);
    if (v10 < 0) {
      operator delete(__p[0]);
    }
    uint64_t v7 = sub_100365D74();
    sub_100058DB0(__p, "SequoiaSignIdMap::LongitureOverride");
    sub_1002261A0(v7, __p, &v11);
    if (v10 < 0) {
      operator delete(__p[0]);
    }
    (*((void (**)(id, double, double))a3 + 2))(a3, v12, v11);
  }
  else
  {
    char v8 = (void (*)(id, __n128, __n128))*((void *)a3 + 2);
    v4.n128_u64[0] = 0;
    v5.n128_u64[0] = 0;
    v8(a3, v4, v5);
  }
}

- (void)setLatitude:(id)a3 andLongitude:(id)a4
{
  if (sub_10004D710())
  {
    uint64_t v6 = (uint64_t **)sub_100365D74();
    if (a3 && a4)
    {
      sub_100058DB0(&__p, "SequoiaSignIdMap::LatitudeOverride");
      [a3 doubleValue];
      uint64_t v11 = v7;
      sub_1002265D0(v6, &__p, (double *)&v11);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      char v8 = (uint64_t **)sub_100365D74();
      sub_100058DB0(&__p, "SequoiaSignIdMap::LongitureOverride");
      [a4 doubleValue];
      uint64_t v11 = v9;
      sub_1002265D0(v8, &__p, (double *)&v11);
    }
    else
    {
      sub_100058DB0(&__p, "SequoiaSignIdMap::LatitudeOverride");
      sub_1003660FC(v6, (void **)&__p.__r_.__value_.__l.__data_);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      char v10 = (uint64_t **)sub_100365D74();
      sub_100058DB0(&__p, "SequoiaSignIdMap::LongitureOverride");
      sub_1003660FC(v10, (void **)&__p.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
}

- (void)dealloc
{
  fLogHandle = self->fLogHandle;
  if (fLogHandle) {
    os_release(fLogHandle);
  }
  v4.receiver = self;
  v4.super_class = (Class)CTCellularPlanClientDelegate;
  [(CTCellularPlanClientDelegate *)&v4 dealloc];
}

@end