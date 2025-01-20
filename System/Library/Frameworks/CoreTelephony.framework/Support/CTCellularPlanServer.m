@interface CTCellularPlanServer
+ (id)sharedServerInstance;
+ (void)initializeServerWithRegistry:(const void *)a3;
+ (void)setProfileId:(void *)a3 fromIccid:()basic_string<char;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CTCellularPlanServer)initWithMachServiceName:(id)a3 andQueue:(queue)a4 andRegistry:(const void *)a5;
- (const)getRegistry;
- (const)logger;
- (id).cxx_construct;
- (id)_getErrorFromCellularPlanError:(unsigned __int8)a3;
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
- (void)getPhoneAuthTokenWithMessage:(id)a3 completion:(id)a4;
- (void)getPlansPendingTransferForTestabilityWithCompletion:(id)a3;
- (void)getPlansPendingTransferWithCompletion:(id)a3;
- (void)getPredefinedLabels:(id)a3;
- (void)getRemoteInfo:(id)a3;
- (void)getRoamingSignupOverrideWithCompletion:(id)a3;
- (void)getShortLabelsForLabels:(id)a3 completion:(id)a4;
- (void)getSkipEligibilityCheck:(id)a3;
- (void)getSubscriptionContextUUIDforPlan:(id)a3 completion:(id)a4;
- (void)getSupportedFlowTypes:(id)a3;
- (void)installPendingRemotePlan:(id)a3 completion:(id)a4;
- (void)isRemotePlanCapableWithContext:(id)a3 completion:(id)a4;
- (void)manageAccountForRemotePlan:(id)a3 completion:(id)a4;
- (void)pendingReleaseRemotePlan;
- (void)planItemsWithCompletion:(id)a3;
- (void)remapSimLabel:(id)a3 to:(id)a4 completion:(id)a5;
- (void)remotePlanItemsWithUpdateFetch:(BOOL)a3 completion:(id)a4;
- (void)remoteUserDidProvideResponse:(BOOL)a3 confirmationCode:(id)a4 plan:(id)a5 completion:(id)a6;
- (void)resolveSimLabel:(id)a3 completion:(id)a4;
- (void)resumePlanProvisioning:(BOOL)a3 userConsent:(int64_t)a4 completion:(id)a5;
- (void)selectRemoteProfile:(id)a3;
- (void)sendCarrierInfoDidUpdateNotification;
- (void)sendLocalPlanInfoDidUpdateNotification:(unsigned __int8)a3;
- (void)sendPendingTransferPlanInfoDidUpdateNotification;
- (void)sendPlanInfoDidUpdateNotification;
- (void)sendRemoteProvisioningDidBecomeAvailable;
- (void)setAutoPlanSelection:(BOOL)a3;
- (void)setCellularPlanController:(shared_ptr<CellularPlanController>)a3 andPhoneController:(shared_ptr<CellularPlanControllerInterface>)a4 andDebugController:(shared_ptr<CellularPlanControllerDebugInterface>)a5;
- (void)setLabelForPlan:(id)a3 label:(id)a4 completion:(id)a5;
- (void)setRoamingSignupOverride:(BOOL)a3;
- (void)setSkipEligibilityCheck:(BOOL)a3;
- (void)setUserInPurchaseFlow:(BOOL)a3 withConnection:(id)a4;
- (void)shouldShowAddNewRemotePlanWithContext:(id)a3 completion:(id)a4;
- (void)shouldShowPlanSetup:(id)a3;
- (void)startProvisioningWithCompletion:(id)a3;
- (void)startRemoteProvisioningWithCompletion:(id)a3;
- (void)userDidProvideResponse:(int64_t)a3 confirmationCode:(id)a4 plan:(id)a5 completion:(id)a6;
- (void)userSignupInitiatedOrFailed;
@end

@implementation CTCellularPlanServer

+ (void)initializeServerWithRegistry:(const void *)a3
{
  initially_inactive = dispatch_queue_attr_make_initially_inactive(0);
  v5 = dispatch_queue_create_with_target_V2("com.apple.CellularPlanServer", initially_inactive, 0);
  dispatch_set_qos_class_floor(v5, QOS_CLASS_UTILITY, 0);
  dispatch_activate(v5);
  v6 = qword_101B13F38;
  qword_101B13F38 = (uint64_t)v5;
  if (v6) {
    dispatch_release(v6);
  }
  v7 = [CTCellularPlanServer alloc];
  uint64_t v8 = kCellularPlanDaemonService;
  dispatch_object_t object = (dispatch_object_t)qword_101B13F38;
  if (qword_101B13F38) {
    dispatch_retain((dispatch_object_t)qword_101B13F38);
  }
  qword_101B12EE0 = [(CTCellularPlanServer *)v7 initWithMachServiceName:v8 andQueue:&object andRegistry:a3];
  if (object) {
    dispatch_release(object);
  }
}

+ (id)sharedServerInstance
{
  return (id)qword_101B12EE0;
}

+ (void)setProfileId:(void *)a3 fromIccid:()basic_string<char
{
  unint64_t v4 = 0;
  *(void *)a3 = 0;
  *((void *)a3 + 1) = 0;
  while (1)
  {
    unint64_t v5 = *((unsigned __int8 *)&a4->__r_.__value_.var0.var1 + 23);
    if (*((char *)&a4->__r_.__value_.var0.var1 + 23) < 0) {
      break;
    }
    if (v4 >= v5) {
      return;
    }
LABEL_6:
    data = a4;
    if ((v5 & 0x80) != 0) {
      data = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a4->__r_.__value_.var0.var1.__data_;
    }
    if ((data->__r_.__value_.var0.var0.__data_[v4] - 48) > 9)
    {
      *((unsigned char *)a3 + (v4 >> 1)) = 15;
    }
    else if (v4)
    {
      if ((v5 & 0x80) != 0) {
        unint64_t size = a4->__r_.__value_.var0.var1.__size_;
      }
      else {
        unint64_t size = *((unsigned __int8 *)&a4->__r_.__value_.var0.var1 + 23);
      }
      if (size <= v4) {
LABEL_27:
      }
        sub_1000C14D8();
      v10 = a4;
      if ((v5 & 0x80) != 0) {
        v10 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a4->__r_.__value_.var0.var1.__data_;
      }
      *((unsigned char *)a3 + (v4 >> 1)) = (v10->__r_.__value_.var0.var0.__data_[v4] - 48) | (16 * *((unsigned char *)a3 + (v4 >> 1)));
    }
    else
    {
      if ((v5 & 0x80) != 0) {
        unint64_t v7 = a4->__r_.__value_.var0.var1.__size_;
      }
      else {
        unint64_t v7 = *((unsigned __int8 *)&a4->__r_.__value_.var0.var1 + 23);
      }
      if (v7 <= v4) {
        goto LABEL_27;
      }
      v9 = a4;
      if ((v5 & 0x80) != 0) {
        v9 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a4->__r_.__value_.var0.var1.__data_;
      }
      *((unsigned char *)a3 + (v4 >> 1)) = v9->__r_.__value_.var0.var0.__data_[v4] - 48;
    }
    ++v4;
  }
  if (v4 < a4->__r_.__value_.var0.var1.__size_) {
    goto LABEL_6;
  }
}

- (const)getRegistry
{
  return &self->fRegistry;
}

- (void)setCellularPlanController:(shared_ptr<CellularPlanController>)a3 andPhoneController:(shared_ptr<CellularPlanControllerInterface>)a4 andDebugController:(shared_ptr<CellularPlanControllerDebugInterface>)a5
{
  fObj = self->fQueue.fObj.fObj;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768;
  block[2] = sub_100EF0D0C;
  block[3] = &unk_101A6B3C0;
  unint64_t v7 = (std::__shared_weak_count *)*((void *)a3.var0 + 1);
  block[5] = *(void *)a3.var0;
  v12 = v7;
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v9 = *(void *)a3.var1;
  uint64_t v8 = (std::__shared_weak_count *)*((void *)a3.var1 + 1);
  block[4] = self;
  uint64_t v13 = v9;
  v14 = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v10 = (std::__shared_weak_count *)*((void *)a4.var0 + 1);
  uint64_t v15 = *(void *)a4.var0;
  v16 = v10;
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  dispatch_async(fObj, block);
  if (v16) {
    sub_10004D2C8(v16);
  }
  if (v14) {
    sub_10004D2C8(v14);
  }
  if (v12) {
    sub_10004D2C8(v12);
  }
}

- (CTCellularPlanServer)initWithMachServiceName:(id)a3 andQueue:(queue)a4 andRegistry:(const void *)a5
{
  v10.receiver = self;
  v10.super_class = (Class)CTCellularPlanServer;
  v6 = [(CTCellularPlanServer *)&v10 init];
  if (v6)
  {
    v6->fConnections = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v6->fConnectionsInPurchaseFlow = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    unint64_t v7 = *(NSObject **)a4.fObj.fObj;
    if (v7) {
      dispatch_retain(v7);
    }
    fObj = v6->fQueue.fObj.fObj;
    v6->fQueue.fObj.fObj = (dispatch_object_s *)v7;
    if (fObj) {
      dispatch_release(fObj);
    }
    operator new();
  }
  return 0;
}

- (id)_getErrorFromCellularPlanError:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v4 = 1;
  switch(v3)
  {
    case 0:
      return 0;
    case 2:
      uint64_t v4 = 2;
      return +[CTCellularPlanError errorForCode:v4];
    case 3:
      uint64_t v4 = 3;
      return +[CTCellularPlanError errorForCode:v4];
    case 4:
      uint64_t v4 = 4;
      return +[CTCellularPlanError errorForCode:v4];
    case 5:
      uint64_t v4 = 5;
      return +[CTCellularPlanError errorForCode:v4];
    case 6:
      uint64_t v4 = 6;
      return +[CTCellularPlanError errorForCode:v4];
    case 7:
      uint64_t v4 = 7;
      return +[CTCellularPlanError errorForCode:v4];
    case 8:
      uint64_t v4 = 8;
      return +[CTCellularPlanError errorForCode:v4];
    case 9:
      uint64_t v4 = 9;
      return +[CTCellularPlanError errorForCode:v4];
    case 10:
      uint64_t v4 = 10;
      return +[CTCellularPlanError errorForCode:v4];
    case 11:
      uint64_t v4 = 11;
      return +[CTCellularPlanError errorForCode:v4];
    case 12:
      uint64_t v4 = 12;
      return +[CTCellularPlanError errorForCode:v4];
    case 13:
      uint64_t v4 = 13;
      return +[CTCellularPlanError errorForCode:v4];
    case 14:
      uint64_t v4 = 14;
      return +[CTCellularPlanError errorForCode:v4];
    case 15:
      uint64_t v4 = 15;
      return +[CTCellularPlanError errorForCode:v4];
    case 16:
      uint64_t v4 = 16;
      return +[CTCellularPlanError errorForCode:v4];
    case 17:
      uint64_t v4 = 17;
      return +[CTCellularPlanError errorForCode:v4];
    case 18:
      uint64_t v4 = 18;
      return +[CTCellularPlanError errorForCode:v4];
    case 19:
      uint64_t v4 = 19;
      return +[CTCellularPlanError errorForCode:v4];
    case 20:
      uint64_t v4 = 20;
      return +[CTCellularPlanError errorForCode:v4];
    case 21:
      uint64_t v4 = 21;
      return +[CTCellularPlanError errorForCode:v4];
    case 22:
      uint64_t v4 = 22;
      return +[CTCellularPlanError errorForCode:v4];
    case 23:
      uint64_t v4 = 23;
      return +[CTCellularPlanError errorForCode:v4];
    case 24:
      uint64_t v4 = 24;
      return +[CTCellularPlanError errorForCode:v4];
    case 25:
      uint64_t v4 = 25;
      return +[CTCellularPlanError errorForCode:v4];
    case 26:
      uint64_t v4 = 26;
      return +[CTCellularPlanError errorForCode:v4];
    case 27:
      uint64_t v4 = 27;
      return +[CTCellularPlanError errorForCode:v4];
    case 28:
      uint64_t v4 = 28;
      return +[CTCellularPlanError errorForCode:v4];
    case 29:
      uint64_t v4 = 29;
      return +[CTCellularPlanError errorForCode:v4];
    case 30:
      uint64_t v4 = 30;
      return +[CTCellularPlanError errorForCode:v4];
    case 31:
      uint64_t v4 = 31;
      return +[CTCellularPlanError errorForCode:v4];
    case 32:
      uint64_t v4 = 32;
      return +[CTCellularPlanError errorForCode:v4];
    case 33:
      uint64_t v4 = 33;
      return +[CTCellularPlanError errorForCode:v4];
    case 34:
      uint64_t v4 = 34;
      return +[CTCellularPlanError errorForCode:v4];
    case 35:
      uint64_t v4 = 35;
      return +[CTCellularPlanError errorForCode:v4];
    case 36:
      uint64_t v4 = 36;
      return +[CTCellularPlanError errorForCode:v4];
    case 37:
      uint64_t v4 = 37;
      return +[CTCellularPlanError errorForCode:v4];
    case 38:
      uint64_t v4 = 38;
      return +[CTCellularPlanError errorForCode:v4];
    case 39:
      uint64_t v4 = 39;
      return +[CTCellularPlanError errorForCode:v4];
    case 40:
      uint64_t v4 = 40;
      return +[CTCellularPlanError errorForCode:v4];
    case 41:
      uint64_t v4 = 41;
      return +[CTCellularPlanError errorForCode:v4];
    case 42:
      uint64_t v4 = 42;
      return +[CTCellularPlanError errorForCode:v4];
    case 43:
      uint64_t v4 = 43;
      return +[CTCellularPlanError errorForCode:v4];
    case 44:
      uint64_t v4 = 44;
      return +[CTCellularPlanError errorForCode:v4];
    case 45:
      uint64_t v4 = 45;
      return +[CTCellularPlanError errorForCode:v4];
    case 46:
      uint64_t v4 = 46;
      return +[CTCellularPlanError errorForCode:v4];
    case 47:
      uint64_t v4 = 47;
      return +[CTCellularPlanError errorForCode:v4];
    case 48:
      uint64_t v4 = 48;
      return +[CTCellularPlanError errorForCode:v4];
    case 49:
      uint64_t v4 = 49;
      return +[CTCellularPlanError errorForCode:v4];
    case 50:
      uint64_t v4 = 50;
      return +[CTCellularPlanError errorForCode:v4];
    case 51:
      uint64_t v4 = 51;
      return +[CTCellularPlanError errorForCode:v4];
    case 52:
      uint64_t v4 = 52;
      return +[CTCellularPlanError errorForCode:v4];
    case 53:
      uint64_t v4 = 53;
      return +[CTCellularPlanError errorForCode:v4];
    case 54:
      uint64_t v4 = 54;
      return +[CTCellularPlanError errorForCode:v4];
    case 55:
      uint64_t v4 = 55;
      return +[CTCellularPlanError errorForCode:v4];
    case 56:
      uint64_t v4 = 56;
      return +[CTCellularPlanError errorForCode:v4];
    case 57:
      uint64_t v4 = 57;
      return +[CTCellularPlanError errorForCode:v4];
    case 58:
      uint64_t v4 = 58;
      return +[CTCellularPlanError errorForCode:v4];
    case 59:
      uint64_t v4 = 62;
      return +[CTCellularPlanError errorForCode:v4];
    case 60:
      uint64_t v4 = 63;
      return +[CTCellularPlanError errorForCode:v4];
    case 61:
      uint64_t v4 = 59;
      return +[CTCellularPlanError errorForCode:v4];
    case 62:
      uint64_t v4 = 60;
      return +[CTCellularPlanError errorForCode:v4];
    case 63:
      uint64_t v4 = 61;
      return +[CTCellularPlanError errorForCode:v4];
    case 64:
      uint64_t v4 = 64;
      return +[CTCellularPlanError errorForCode:v4];
    case 65:
      uint64_t v4 = 65;
      return +[CTCellularPlanError errorForCode:v4];
    case 66:
      uint64_t v4 = 66;
      return +[CTCellularPlanError errorForCode:v4];
    case 67:
      uint64_t v4 = 67;
      return +[CTCellularPlanError errorForCode:v4];
    default:
      return +[CTCellularPlanError errorForCode:v4];
  }
}

- (void)shouldShowPlanSetup:(id)a3
{
  cntrl = self->fCellularPlanControlleriPad.__cntrl_;
  if (cntrl)
  {
    v6 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v6)
    {
      ptr = self->fCellularPlanControlleriPad.__ptr_;
      if (ptr)
      {
        uint64_t v8 = *(NSObject **)self->fLogger.__ptr_.__value_;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v12 = "-[CTCellularPlanServer shouldShowPlanSetup:]";
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I %s ", buf, 0xCu);
        }
        if (a3) {
          uint64_t v9 = _Block_copy(a3);
        }
        else {
          uint64_t v9 = 0;
        }
        v10[0] = off_101A6B7C8;
        v10[1] = self;
        v10[2] = v9;
        v10[3] = v10;
        (*(void (**)(CellularPlanController *, void *))(*(void *)ptr + 8))(ptr, v10);
        sub_100060644(v10);
        goto LABEL_13;
      }
    }
  }
  else
  {
    v6 = 0;
  }
  (*((void (**)(id, void))a3 + 2))(a3, 0);
  if (v6) {
LABEL_13:
  }
    sub_10004D2C8(v6);
}

- (void)getSupportedFlowTypes:(id)a3
{
  cntrl = self->fCellularPlanControlleriPad.__cntrl_;
  if (cntrl)
  {
    v6 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v6)
    {
      ptr = self->fCellularPlanControlleriPad.__ptr_;
      if (ptr)
      {
        uint64_t v8 = *(NSObject **)self->fLogger.__ptr_.__value_;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t v13 = "-[CTCellularPlanServer getSupportedFlowTypes:]";
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I %s ", buf, 0xCu);
        }
        v11[0] = 0;
        v11[128] = 0;
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_100EF181C;
        v10[3] = &unk_101A6B3F8;
        void v10[4] = self;
        v10[5] = a3;
        (*(void (**)(CellularPlanController *, unsigned char *, void *))(*(void *)ptr + 40))(ptr, v11, v10);
        sub_10010B788((uint64_t)v11);
LABEL_11:
        sub_10004D2C8(v6);
        return;
      }
    }
  }
  else
  {
    v6 = 0;
  }
  uint64_t v9 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#E no controller", buf, 2u);
  }
  (*((void (**)(id, void, id))a3 + 2))(a3, 0, +[CTCellularPlanError errorForCode:4]);
  if (v6) {
    goto LABEL_11;
  }
}

- (void)startProvisioningWithCompletion:(id)a3
{
  cntrl = self->fCellularPlanControlleriPad.__cntrl_;
  if (cntrl)
  {
    v6 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v6)
    {
      ptr = self->fCellularPlanControlleriPad.__ptr_;
      if (ptr)
      {
        uint64_t v8 = *(NSObject **)self->fLogger.__ptr_.__value_;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v12 = "-[CTCellularPlanServer startProvisioningWithCompletion:]";
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I %s", buf, 0xCu);
        }
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_100EF1A34;
        v10[3] = &unk_101A6B420;
        void v10[4] = a3;
        (*(void (**)(CellularPlanController *, void *))(*(void *)ptr + 216))(ptr, v10);
LABEL_11:
        sub_10004D2C8(v6);
        return;
      }
    }
  }
  else
  {
    v6 = 0;
  }
  uint64_t v9 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#E No controller", buf, 2u);
  }
  (*((void (**)(id, void))a3 + 2))(a3, 0);
  if (v6) {
    goto LABEL_11;
  }
}

- (void)finishProvisioningWithCompletion:(id)a3
{
  cntrl = self->fCellularPlanControlleriPad.__cntrl_;
  if (cntrl)
  {
    v6 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v6)
    {
      ptr = self->fCellularPlanControlleriPad.__ptr_;
      if (ptr)
      {
        uint64_t v8 = *(NSObject **)self->fLogger.__ptr_.__value_;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v12 = "-[CTCellularPlanServer finishProvisioningWithCompletion:]";
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I %s", buf, 0xCu);
        }
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_100EF1C10;
        v10[3] = &unk_101A6B420;
        void v10[4] = a3;
        (*(void (**)(CellularPlanController *, void *))(*(void *)ptr + 224))(ptr, v10);
LABEL_11:
        sub_10004D2C8(v6);
        return;
      }
    }
  }
  else
  {
    v6 = 0;
  }
  uint64_t v9 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#E No controller", buf, 2u);
  }
  (*((void (**)(id, void))a3 + 2))(a3, 0);
  if (v6) {
    goto LABEL_11;
  }
}

- (void)addNewPlanWithFlowType:(unint64_t)a3 completion:(id)a4
{
  cntrl = self->fCellularPlanControlleriPad.__cntrl_;
  if (cntrl)
  {
    uint64_t v8 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v8)
    {
      ptr = self->fCellularPlanControlleriPad.__ptr_;
      if (ptr)
      {
        objc_super v10 = *(NSObject **)self->fLogger.__ptr_.__value_;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v14 = "-[CTCellularPlanServer addNewPlanWithFlowType:completion:]";
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#I %s", buf, 0xCu);
        }
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_100EF1E20;
        v12[3] = &unk_101A6B448;
        v12[4] = self;
        v12[5] = a4;
        (*(void (**)(CellularPlanController *, unint64_t, void *))(*(void *)ptr + 232))(ptr, a3, v12);
LABEL_11:
        sub_10004D2C8(v8);
        return;
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  v11 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[CTCellularPlanServer addNewPlanWithFlowType:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#E %s: No controller", buf, 0xCu);
  }
  (*((void (**)(id, id))a4 + 2))(a4, +[CTCellularPlanError errorForCode:4]);
  if (v8) {
    goto LABEL_11;
  }
}

- (void)addNewPlanWithCardData:(id)a3 confirmationCode:(id)a4 triggerType:(int64_t)a5 userConsent:(int64_t)a6 completion:(id)a7
{
  cntrl = self->fCellularPlanControlleriPad.__cntrl_;
  if (cntrl)
  {
    v14 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v14)
    {
      ptr = self->fCellularPlanControlleriPad.__ptr_;
      if (ptr)
      {
        if (a3)
        {
          v22[0] = 0;
          v22[128] = 0;
          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3321888768;
          v18[2] = sub_100EF20EC;
          v18[3] = &unk_101A6B470;
          v18[7] = a7;
          v18[8] = ptr;
          v18[4] = self;
          v19 = v14;
          atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
          v18[5] = a3;
          v18[6] = a4;
          int64_t v20 = a5;
          int64_t v21 = a6;
          (*(void (**)(CellularPlanController *, unsigned char *, void *))(*(void *)ptr + 40))(ptr, v22, v18);
          sub_10010B788((uint64_t)v22);
          if (v19) {
            sub_10004D2C8(v19);
          }
        }
        else
        {
          v17 = *(NSObject **)self->fLogger.__ptr_.__value_;
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#E missing card data", buf, 2u);
          }
          (*((void (**)(id, id))a7 + 2))(a7, +[CTCellularPlanError errorForCode:6 withDescription:@"missing card data"]);
        }
LABEL_11:
        sub_10004D2C8(v14);
        return;
      }
    }
  }
  else
  {
    v14 = 0;
  }
  v16 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[CTCellularPlanServer addNewPlanWithCardData:confirmationCode:triggerType:userConsent:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#E %s: No controller", buf, 0xCu);
  }
  (*((void (**)(id, id))a7 + 2))(a7, +[CTCellularPlanError errorForCode:4]);
  if (v14) {
    goto LABEL_11;
  }
}

- (void)addNewPlanWithAddress:(id)a3 matchingId:(id)a4 oid:(id)a5 confirmationCode:(id)a6 triggerType:(int64_t)a7 userConsent:(int64_t)a8 completion:(id)a9
{
  cntrl = self->fCellularPlanControlleriPad.__cntrl_;
  if (cntrl)
  {
    v17 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v17)
    {
      ptr = self->fCellularPlanControlleriPad.__ptr_;
      if (ptr)
      {
        if (a3)
        {
          v25[0] = 0;
          v25[128] = 0;
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3321888768;
          v21[2] = sub_100EF268C;
          v21[3] = &unk_101A6B4A8;
          v21[9] = a9;
          v21[10] = ptr;
          v21[4] = self;
          v22 = v17;
          atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
          v21[5] = a3;
          v21[6] = a4;
          v21[7] = a5;
          v21[8] = a6;
          int64_t v23 = a7;
          int64_t v24 = a8;
          (*(void (**)(CellularPlanController *, unsigned char *, void *))(*(void *)ptr + 40))(ptr, v25, v21);
          sub_10010B788((uint64_t)v25);
          if (v22) {
            sub_10004D2C8(v22);
          }
        }
        else
        {
          int64_t v20 = *(NSObject **)self->fLogger.__ptr_.__value_;
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#E missing address", buf, 2u);
          }
          (*((void (**)(id, id))a9 + 2))(a9, +[CTCellularPlanError errorForCode:6 withDescription:@"missing address"]);
        }
LABEL_11:
        sub_10004D2C8(v17);
        return;
      }
    }
  }
  else
  {
    v17 = 0;
  }
  v19 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "-[CTCellularPlanServer addNewPlanWithAddress:matchingId:oid:confirmationCode:triggerType:userConsent:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#E %s: No controller", buf, 0xCu);
  }
  (*((void (**)(id, id))a9 + 2))(a9, +[CTCellularPlanError errorForCode:4]);
  if (v17) {
    goto LABEL_11;
  }
}

- (void)resumePlanProvisioning:(BOOL)a3 userConsent:(int64_t)a4 completion:(id)a5
{
  cntrl = self->fCellularPlanControlleriPad.__cntrl_;
  if (cntrl)
  {
    objc_super v10 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v10)
    {
      ptr = self->fCellularPlanControlleriPad.__ptr_;
      if (ptr)
      {
        v17[0] = 0;
        v17[128] = 0;
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3321888768;
        v13[2] = sub_100EF2C18;
        v13[3] = &unk_101A6B4E0;
        v13[4] = self;
        v13[5] = a5;
        v13[6] = ptr;
        v14 = v10;
        atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
        BOOL v16 = a3;
        int64_t v15 = a4;
        (*(void (**)(CellularPlanController *, unsigned char *, void *))(*(void *)ptr + 40))(ptr, v17, v13);
        sub_10010B788((uint64_t)v17);
        if (v14) {
          sub_10004D2C8(v14);
        }
LABEL_10:
        sub_10004D2C8(v10);
        return;
      }
    }
  }
  else
  {
    objc_super v10 = 0;
  }
  v12 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[CTCellularPlanServer resumePlanProvisioning:userConsent:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#E %s: No controller", buf, 0xCu);
  }
  (*((void (**)(id, id))a5 + 2))(a5, +[CTCellularPlanError errorForCode:4]);
  if (v10) {
    goto LABEL_10;
  }
}

- (void)planItemsWithCompletion:(id)a3
{
  unint64_t v5 = (uint64_t *)__stack_chk_guard;
  cntrl = self->fCellularPlanControlleriPad.__cntrl_;
  if (cntrl)
  {
    unint64_t v7 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v7)
    {
      ptr = self->fCellularPlanControlleriPad.__ptr_;
      if (ptr)
      {
        uint64_t v9 = *(NSObject **)self->fLogger.__ptr_.__value_;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&uint8_t buf[4] = "-[CTCellularPlanServer planItemsWithCompletion:]";
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#I %s ", buf, 0xCu);
        }
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_100EF31DC;
        v22[3] = &unk_101A6B660;
        v22[4] = self;
        v22[5] = a3;
        (*(void (**)(CellularPlanController *, void *))(*(void *)ptr + 72))(ptr, v22);
LABEL_23:
        sub_10004D2C8(v7);
        return;
      }
    }
  }
  else
  {
    unint64_t v7 = 0;
  }
  ServiceMap = (std::mutex *)Registry::getServiceMap(v5, self->fRegistry.__ptr_);
  v11 = ServiceMap;
  v12 = "N8cellplan36CellularPlanControllerWatchInterfaceE";
  if (((unint64_t)"N8cellplan36CellularPlanControllerWatchInterfaceE" & 0x8000000000000000) != 0)
  {
    uint64_t v13 = (unsigned __int8 *)((unint64_t)"N8cellplan36CellularPlanControllerWatchInterfaceE" & 0x7FFFFFFFFFFFFFFFLL);
    uint64_t v14 = 5381;
    do
    {
      v12 = (const char *)v14;
      unsigned int v15 = *v13++;
      uint64_t v14 = (33 * v14) ^ v15;
    }
    while (v15);
  }
  std::mutex::lock(ServiceMap);
  *(void *)buf = v12;
  BOOL v16 = sub_10004D37C(&v11[1].__m_.__sig, (unint64_t *)buf);
  if (!v16)
  {
    uint64_t v18 = 0;
LABEL_16:
    std::mutex::unlock(v11);
    v17 = 0;
    char v19 = 1;
    if (!v18) {
      goto LABEL_14;
    }
    goto LABEL_17;
  }
  uint64_t v18 = v16[3];
  v17 = (std::__shared_weak_count *)v16[4];
  if (!v17) {
    goto LABEL_16;
  }
  atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
  std::mutex::unlock(v11);
  atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
  sub_10004D2C8(v17);
  char v19 = 0;
  if (!v18)
  {
LABEL_14:
    (*((void (**)(id, id, void))a3 + 2))(a3, objc_alloc_init((Class)NSArray), 0);
    goto LABEL_20;
  }
LABEL_17:
  int64_t v20 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[CTCellularPlanServer planItemsWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#I %s ", buf, 0xCu);
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100EF3228;
  v21[3] = &unk_101A6B660;
  v21[4] = self;
  v21[5] = a3;
  (*(void (**)(uint64_t, void *))(*(void *)v18 + 104))(v18, v21);
LABEL_20:
  if ((v19 & 1) == 0) {
    sub_10004D2C8(v17);
  }
  if (v7) {
    goto LABEL_23;
  }
}

- (void)danglingPlanItemsShouldUpdate:(BOOL)a3 completion:(id)a4
{
  cntrl = self->fCellularPlanControlleriPad.__cntrl_;
  if (cntrl)
  {
    unint64_t v7 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v7)
    {
      ptr = self->fCellularPlanControlleriPad.__ptr_;
      if (ptr)
      {
        if (a4) {
          uint64_t v9 = _Block_copy(a4);
        }
        else {
          uint64_t v9 = 0;
        }
        v10[0] = off_101A6B848;
        v10[1] = v9;
        v10[3] = v10;
        (*(void (**)(CellularPlanController *, void *))(*(void *)ptr + 96))(ptr, v10);
        sub_10030B6C4(v10);
        goto LABEL_11;
      }
    }
  }
  else
  {
    unint64_t v7 = 0;
  }
  (*((void (**)(id, void, id))a4 + 2))(a4, 0, [(CTCellularPlanServer *)self _getErrorFromCellularPlanError:4]);
  if (v7) {
LABEL_11:
  }
    sub_10004D2C8(v7);
}

- (void)getPlansPendingTransferWithCompletion:(id)a3
{
  cntrl = self->fCellularPlanControlleriPad.__cntrl_;
  if (cntrl)
  {
    v6 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v6)
    {
      ptr = self->fCellularPlanControlleriPad.__ptr_;
      if (ptr)
      {
        if (a3) {
          uint64_t v8 = _Block_copy(a3);
        }
        else {
          uint64_t v8 = 0;
        }
        v9[0] = off_101A6B8D8;
        v9[1] = self;
        v9[2] = v8;
        v9[3] = v9;
        (*(void (**)(CellularPlanController *, void *))(*(void *)ptr + 160))(ptr, v9);
        sub_100313790(v9);
        goto LABEL_11;
      }
    }
  }
  else
  {
    v6 = 0;
  }
  (*((void (**)(id, void, id))a3 + 2))(a3, 0, [(CTCellularPlanServer *)self _getErrorFromCellularPlanError:4]);
  if (v6) {
LABEL_11:
  }
    sub_10004D2C8(v6);
}

- (void)getPlansPendingTransferForTestabilityWithCompletion:(id)a3
{
  cntrl = self->fCellularPlanControlleriPad.__cntrl_;
  if (cntrl)
  {
    v6 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v6)
    {
      ptr = self->fCellularPlanControlleriPad.__ptr_;
      if (ptr)
      {
        if (a3) {
          uint64_t v8 = _Block_copy(a3);
        }
        else {
          uint64_t v8 = 0;
        }
        v9[0] = off_101A6B958;
        v9[1] = self;
        v9[2] = v8;
        v9[3] = v9;
        (*(void (**)(CellularPlanController *, void *))(*(void *)ptr + 168))(ptr, v9);
        sub_100313790(v9);
        goto LABEL_11;
      }
    }
  }
  else
  {
    v6 = 0;
  }
  (*((void (**)(id, void, id))a3 + 2))(a3, 0, [(CTCellularPlanServer *)self _getErrorFromCellularPlanError:4]);
  if (v6) {
LABEL_11:
  }
    sub_10004D2C8(v6);
}

- (void)activatePlanPendingTransfer:(id)a3 completion:(id)a4
{
  unint64_t v7 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[CTCellularPlanServer activatePlanPendingTransfer:completion:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I client invoking %s, plan: %@", buf, 0x16u);
  }
  if (!a3) {
    goto LABEL_13;
  }
  if (![a3 sourceIccid])
  {
    v12 = *(NSObject **)self->fLogger.__ptr_.__value_;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "plan source Iccid not available", buf, 2u);
    }
LABEL_13:
    (*((void (**)(id, void, void, void, id))a4 + 2))(a4, 0, 0, 0, [(CTCellularPlanServer *)self _getErrorFromCellularPlanError:6]);
    return;
  }
  cntrl = self->fCellularPlanControlleriPad.__cntrl_;
  if (cntrl)
  {
    uint64_t v9 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v9)
    {
      ptr = self->fCellularPlanControlleriPad.__ptr_;
      if (ptr)
      {
        memset(buf, 0, sizeof(buf));
        sub_100058DB0(buf, (char *)objc_msgSend(objc_msgSend(a3, "sourceIccid"), "UTF8String"));
        if (a4) {
          v11 = _Block_copy(a4);
        }
        else {
          v11 = 0;
        }
        v13[0] = off_101A6B9D8;
        v13[1] = self;
        v13[2] = v11;
        v13[3] = v13;
        (*(void (**)(CellularPlanController *, uint8_t *, void *))(*(void *)ptr + 176))(ptr, buf, v13);
        sub_1003135E4(v13);
        if ((char)buf[23] < 0) {
          operator delete(*(void **)buf);
        }
        goto LABEL_20;
      }
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  (*((void (**)(id, void, void, void, id))a4 + 2))(a4, 0, 0, 0, [(CTCellularPlanServer *)self _getErrorFromCellularPlanError:4]);
  if (v9) {
LABEL_20:
  }
    sub_10004D2C8(v9);
}

- (void)cancelPlanActivation:(id)a3 completion:(id)a4
{
  unint64_t v7 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(__p[0]) = 136315394;
    *(void **)((char *)__p + 4) = "-[CTCellularPlanServer cancelPlanActivation:completion:]";
    WORD2(__p[1]) = 2112;
    *(void **)((char *)&__p[1] + 6) = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I client invoking %s, plan: %@", (uint8_t *)__p, 0x16u);
  }
  cntrl = self->fCellularPlanControlleriPad.__cntrl_;
  if (cntrl)
  {
    uint64_t v9 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v9)
    {
      ptr = self->fCellularPlanControlleriPad.__ptr_;
      if (ptr)
      {
        if ([a3 sourceIccid])
        {
          memset(__p, 0, sizeof(__p));
          sub_100058DB0(__p, (char *)objc_msgSend(objc_msgSend(a3, "sourceIccid"), "UTF8String"));
          v11 = (void *)HIBYTE(__p[2]);
          if (SHIBYTE(__p[2]) < 0) {
            v11 = __p[1];
          }
          if (v11)
          {
            (*(void (**)(CellularPlanController *, void **))(*(void *)ptr + 184))(ptr, __p);
            id v12 = 0;
          }
          else
          {
            id v12 = +[CTCellularPlanError errorForCode:6];
          }
          (*((void (**)(id, id))a4 + 2))(a4, v12);
          if (SHIBYTE(__p[2]) < 0) {
            operator delete(__p[0]);
          }
        }
        else
        {
          (*((void (**)(id, id))a4 + 2))(a4, +[CTCellularPlanError errorForCode:6]);
        }
LABEL_15:
        sub_10004D2C8(v9);
        return;
      }
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v13 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(__p[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#E No controller", (uint8_t *)__p, 2u);
  }
  (*((void (**)(id, id))a4 + 2))(a4, +[CTCellularPlanError errorForCode:6]);
  if (v9) {
    goto LABEL_15;
  }
}

- (void)deletePlanPendingTransfer:(id)a3 completion:(id)a4
{
  unint64_t v7 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[CTCellularPlanServer deletePlanPendingTransfer:completion:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I client invoking %s, plan: %@", buf, 0x16u);
  }
  if (!a3) {
    goto LABEL_13;
  }
  if (![a3 sourceIccid])
  {
    id v12 = *(NSObject **)self->fLogger.__ptr_.__value_;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "plan source Iccid not available", buf, 2u);
    }
LABEL_13:
    (*((void (**)(id, id))a4 + 2))(a4, [(CTCellularPlanServer *)self _getErrorFromCellularPlanError:6]);
    return;
  }
  cntrl = self->fCellularPlanControlleriPad.__cntrl_;
  if (cntrl)
  {
    uint64_t v9 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v9)
    {
      ptr = self->fCellularPlanControlleriPad.__ptr_;
      if (ptr)
      {
        memset(buf, 0, sizeof(buf));
        sub_100058DB0(buf, (char *)objc_msgSend(objc_msgSend(a3, "sourceIccid"), "UTF8String"));
        if (a4) {
          v11 = _Block_copy(a4);
        }
        else {
          v11 = 0;
        }
        v13[0] = off_101A6BA58;
        v13[1] = self;
        v13[2] = v11;
        v13[3] = v13;
        (*(void (**)(CellularPlanController *, uint8_t *, void *))(*(void *)ptr + 192))(ptr, buf, v13);
        sub_100313668(v13);
        if ((char)buf[23] < 0) {
          operator delete(*(void **)buf);
        }
        goto LABEL_20;
      }
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  (*((void (**)(id, id))a4 + 2))(a4, [(CTCellularPlanServer *)self _getErrorFromCellularPlanError:4]);
  if (v9) {
LABEL_20:
  }
    sub_10004D2C8(v9);
}

- (void)resolveSimLabel:(id)a3 completion:(id)a4
{
  ServiceMap = (std::mutex *)Registry::getServiceMap(v4, self->fRegistry.__ptr_);
  uint64_t v9 = ServiceMap;
  if (v10 < 0)
  {
    v11 = (unsigned __int8 *)(v10 & 0x7FFFFFFFFFFFFFFFLL);
    uint64_t v12 = 5381;
    do
    {
      uint64_t v10 = v12;
      unsigned int v13 = *v11++;
      uint64_t v12 = (33 * v12) ^ v13;
    }
    while (v13);
  }
  std::mutex::lock(ServiceMap);
  __p[0] = (void *)v10;
  uint64_t v14 = sub_10004D37C(&v9[1].__m_.__sig, (unint64_t *)__p);
  if (!v14)
  {
    uint64_t v16 = 0;
LABEL_9:
    std::mutex::unlock(v9);
    unsigned int v15 = 0;
    char v17 = 1;
    if (!v16) {
      goto LABEL_7;
    }
    goto LABEL_10;
  }
  uint64_t v16 = v14[3];
  unsigned int v15 = (std::__shared_weak_count *)v14[4];
  if (!v15) {
    goto LABEL_9;
  }
  atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
  std::mutex::unlock(v9);
  atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
  sub_10004D2C8(v15);
  char v17 = 0;
  if (!v16)
  {
LABEL_7:
    uint64_t v18 = 4;
LABEL_16:
    id v19 = [(CTCellularPlanServer *)self _getErrorFromCellularPlanError:v18];
    goto LABEL_17;
  }
LABEL_10:
  if (![a3 iccid] || !objc_msgSend(objc_msgSend(a3, "iccid"), "length"))
  {
    uint64_t v18 = 6;
    goto LABEL_16;
  }
  sub_100058DB0(__p, (char *)objc_msgSend(objc_msgSend(a3, "iccid"), "UTF8String"));
  (*(void (**)(uint64_t, void **))(*(void *)v16 + 256))(v16, __p);
  if (v21 < 0) {
    operator delete(__p[0]);
  }
  id v19 = 0;
LABEL_17:
  (*((void (**)(id, id))a4 + 2))(a4, v19);
  if ((v17 & 1) == 0) {
    sub_10004D2C8(v15);
  }
}

- (void)remapSimLabel:(id)a3 to:(id)a4 completion:(id)a5
{
  uint64_t v9 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[CTCellularPlanServer remapSimLabel:to:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#I %s", buf, 0xCu);
  }
  if ([a4 isInstalling])
  {
    cntrl = self->fCellularPlanControlleriPad.__cntrl_;
    if (cntrl)
    {
      uint64_t v12 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
      if (v12)
      {
        ptr = self->fCellularPlanControlleriPad.__ptr_;
        if (ptr)
        {
          if (a4 && [a4 iccid])
          {
            sub_100058DB0(__p, (char *)objc_msgSend(objc_msgSend(a3, "iccid"), "UTF8String"));
            (*(void (**)(CellularPlanController *, void **))(*(void *)ptr + 552))(ptr, __p);
            if (v30 < 0) {
              operator delete(__p[0]);
            }
            id v14 = 0;
          }
          else
          {
            v26 = *(NSObject **)self->fLogger.__ptr_.__value_;
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "#E missing plan item or iccid", buf, 2u);
            }
            id v14 = +[CTCellularPlanError errorForCode:6 withDescription:@"missing plan item"];
          }
          (*((void (**)(id, id))a5 + 2))(a5, v14);
          goto LABEL_37;
        }
      }
    }
    else
    {
      uint64_t v12 = 0;
    }
    v25 = *(NSObject **)self->fLogger.__ptr_.__value_;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[CTCellularPlanServer remapSimLabel:to:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "#E %s: No controller", buf, 0xCu);
    }
    (*((void (**)(id, id))a5 + 2))(a5, +[CTCellularPlanError errorForCode:4]);
    if (v12) {
      goto LABEL_37;
    }
    return;
  }
  ServiceMap = (std::mutex *)Registry::getServiceMap(v10, self->fRegistry.__ptr_);
  uint64_t v16 = ServiceMap;
  if (v17 < 0)
  {
    uint64_t v18 = (unsigned __int8 *)(v17 & 0x7FFFFFFFFFFFFFFFLL);
    uint64_t v19 = 5381;
    do
    {
      uint64_t v17 = v19;
      unsigned int v20 = *v18++;
      uint64_t v19 = (33 * v19) ^ v20;
    }
    while (v20);
  }
  std::mutex::lock(ServiceMap);
  *(void *)buf = v17;
  char v21 = sub_10004D37C(&v16[1].__m_.__sig, (unint64_t *)buf);
  if (!v21)
  {
    uint64_t v22 = 0;
LABEL_25:
    std::mutex::unlock(v16);
    uint64_t v12 = 0;
    char v23 = 1;
    if (!v22) {
      goto LABEL_18;
    }
    goto LABEL_26;
  }
  uint64_t v22 = v21[3];
  uint64_t v12 = (std::__shared_weak_count *)v21[4];
  if (!v12) {
    goto LABEL_25;
  }
  atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
  std::mutex::unlock(v16);
  atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
  sub_10004D2C8(v12);
  char v23 = 0;
  if (!v22)
  {
LABEL_18:
    id v24 = [(CTCellularPlanServer *)self _getErrorFromCellularPlanError:4];
    goto LABEL_31;
  }
LABEL_26:
  sub_100058DB0(buf, (char *)objc_msgSend(objc_msgSend(a3, "iccid"), "UTF8String"));
  sub_100058DB0(v27, (char *)objc_msgSend(objc_msgSend(a4, "iccid"), "UTF8String"));
  (*(void (**)(uint64_t, unsigned char *, void **))(*(void *)v22 + 264))(v22, buf, v27);
  if (v28 < 0) {
    operator delete(v27[0]);
  }
  if (v32 < 0) {
    operator delete(*(void **)buf);
  }
  id v24 = 0;
LABEL_31:
  (*((void (**)(id, id))a5 + 2))(a5, v24);
  if ((v23 & 1) == 0) {
LABEL_37:
  }
    sub_10004D2C8(v12);
}

- (void)carrierItemsShouldUpdate:(BOOL)a3 completion:(id)a4
{
  BOOL v5 = a3;
  id v7 = +[CTLocationManager sharedManager];
  if ([v7 isLocationServiceEnabled])
  {
    if ([v7 isLocationServiceAuthorized])
    {
      [v7 startLocationUpdatesWithReason:"Cellular Plan"];
      cntrl = self->fCellularPlanControlleriPad.__cntrl_;
      if (cntrl)
      {
        uint64_t v9 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
        if (v9)
        {
          ptr = self->fCellularPlanControlleriPad.__ptr_;
          if (ptr)
          {
            v11 = *(NSObject **)self->fLogger.__ptr_.__value_;
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              uint64_t v17 = "-[CTCellularPlanServer carrierItemsShouldUpdate:completion:]";
              _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#I %s", buf, 0xCu);
            }
            if (a4) {
              uint64_t v12 = _Block_copy(a4);
            }
            else {
              uint64_t v12 = 0;
            }
            v15[0] = off_101A6BAD8;
            v15[1] = self;
            v15[2] = v12;
            v15[3] = v15;
            (*(void (**)(CellularPlanController *, BOOL, void *))(*(void *)ptr + 80))(ptr, v5, v15);
            sub_100313790(v15);
            goto LABEL_21;
          }
        }
      }
      else
      {
        uint64_t v9 = 0;
      }
      (*((void (**)(id, void, id))a4 + 2))(a4, 0, +[CTCellularPlanError errorForCode:17]);
      if (v9) {
LABEL_21:
      }
        sub_10004D2C8(v9);
    }
    else
    {
      id v14 = *(NSObject **)self->fLogger.__ptr_.__value_;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v17 = "-[CTCellularPlanServer carrierItemsShouldUpdate:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#E %s: Location service is not authorized", buf, 0xCu);
      }
      (*((void (**)(id, void, id))a4 + 2))(a4, 0, +[CTCellularPlanError errorForCode:11]);
    }
  }
  else
  {
    unsigned int v13 = *(NSObject **)self->fLogger.__ptr_.__value_;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v17 = "-[CTCellularPlanServer carrierItemsShouldUpdate:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#E %s: Location service is disabled", buf, 0xCu);
    }
    (*((void (**)(id, void, id))a4 + 2))(a4, 0, +[CTCellularPlanError errorForCode:9]);
  }
}

- (void)userDidProvideResponse:(int64_t)a3 confirmationCode:(id)a4 plan:(id)a5 completion:(id)a6
{
  cntrl = self->fCellularPlanControlleriPad.__cntrl_;
  if (cntrl)
  {
    uint64_t v12 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v12)
    {
      ptr = self->fCellularPlanControlleriPad.__ptr_;
      if (ptr)
      {
        if (a5)
        {
          if ([a5 iccid])
          {
            if (a3 == 1)
            {
              uint64_t v14 = 0;
            }
            else
            {
              if (a3)
              {
                uint64_t v18 = 0;
                uint64_t v14 = 0;
                goto LABEL_23;
              }
              uint64_t v14 = 256;
            }
            uint64_t v18 = 1;
LABEL_23:
            if (!a4) {
              a4 = &stru_101AC1B28;
            }
            uint64_t v19 = *(NSObject **)self->fLogger.__ptr_.__value_;
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v25 = "-[CTCellularPlanServer userDidProvideResponse:confirmationCode:plan:completion:]";
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#I %s", buf, 0xCu);
            }
            sub_100058DB0(__p, (char *)objc_msgSend(objc_msgSend(a5, "iccid"), "UTF8String"));
            id v21 = a4;
            CFRetain(a4);
            v20[0] = _NSConcreteStackBlock;
            v20[1] = 3221225472;
            v20[2] = sub_100EF4CA8;
            v20[3] = &unk_101A6B518;
            v20[4] = self;
            v20[5] = a6;
            (*(void (**)(CellularPlanController *, void **, uint64_t, id *, void *))(*(void *)ptr + 392))(ptr, __p, v14 | v18, &v21, v20);
            sub_1000558F4((const void **)&v21);
            if (v23 < 0) {
              operator delete(__p[0]);
            }
            goto LABEL_29;
          }
          uint64_t v16 = *(NSObject **)self->fLogger.__ptr_.__value_;
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            uint64_t v17 = "#E Invalid argument. No iccid in plan";
            goto LABEL_18;
          }
        }
        else
        {
          uint64_t v16 = *(NSObject **)self->fLogger.__ptr_.__value_;
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            uint64_t v17 = "#E Invalid argument. No plan";
LABEL_18:
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 2u);
          }
        }
        (*((void (**)(id, void, id))a6 + 2))(a6, 0, +[CTCellularPlanError errorForCode:6]);
LABEL_29:
        sub_10004D2C8(v12);
        return;
      }
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  unsigned int v15 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[CTCellularPlanServer userDidProvideResponse:confirmationCode:plan:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#E %s: No controller", buf, 0xCu);
  }
  (*((void (**)(id, void, id))a6 + 2))(a6, 0, +[CTCellularPlanError errorForCode:4]);
  if (v12) {
    goto LABEL_29;
  }
}

- (void)didSelectPlanItem:(id)a3 enable:(BOOL)a4 completion:(id)a5
{
  uint64_t v8 = (uint64_t *)__stack_chk_guard;
  cntrl = self->fCellularPlanControlleriPad.__cntrl_;
  if (cntrl)
  {
    BOOL v10 = a4;
    v11 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v11)
    {
      ptr = self->fCellularPlanControlleriPad.__ptr_;
      if (ptr)
      {
        if (a3 && [a3 iccid])
        {
          unsigned int v13 = *(NSObject **)self->fLogger.__ptr_.__value_;
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            id v14 = objc_msgSend(objc_msgSend(a3, "iccid"), "UTF8String");
            unsigned int v15 = "NO";
            if (v10) {
              unsigned int v15 = "YES";
            }
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = v14;
            __int16 v34 = 2080;
            v35 = v15;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#I didSelectPlanItem [%s], enable [%s]", buf, 0x16u);
          }
          sub_100058DB0(v28, (char *)objc_msgSend(objc_msgSend(a3, "iccid"), "UTF8String"));
          if (a5) {
            uint64_t v16 = _Block_copy(a5);
          }
          else {
            uint64_t v16 = 0;
          }
          v37[0] = off_101A6BB58;
          v37[1] = self;
          v37[2] = v16;
          v37[3] = v37;
          (*(void (**)(CellularPlanController *, void **, BOOL, void *))(*(void *)ptr + 520))(ptr, v28, v10, v37);
          sub_10023D374(v37);
          if (v29 < 0) {
            operator delete(v28[0]);
          }
          sub_100058DB0(buf, (char *)objc_msgSend(objc_msgSend(a3, "iccid", self), "UTF8String"));
          (*(void (**)(CellularPlanController *, unsigned char *, BOOL))(*(void *)ptr + 880))(ptr, buf, v10);
          if (v36 < 0) {
            operator delete(*(void **)buf);
          }
        }
        else
        {
          v27 = *(NSObject **)self->fLogger.__ptr_.__value_;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "#E missing plan item or iccid", buf, 2u);
          }
          (*((void (**)(id, void, id))a5 + 2))(a5, 0, +[CTCellularPlanError errorForCode:6 withDescription:@"missing plan item or iccid"]);
        }
        goto LABEL_39;
      }
    }
  }
  else
  {
    v11 = 0;
  }
  ServiceMap = (std::mutex *)Registry::getServiceMap(v8, self->fRegistry.__ptr_);
  uint64_t v18 = ServiceMap;
  uint64_t v19 = "N8cellplan36CellularPlanControllerWatchInterfaceE";
  if (((unint64_t)"N8cellplan36CellularPlanControllerWatchInterfaceE" & 0x8000000000000000) != 0)
  {
    unsigned int v20 = (unsigned __int8 *)((unint64_t)"N8cellplan36CellularPlanControllerWatchInterfaceE" & 0x7FFFFFFFFFFFFFFFLL);
    uint64_t v21 = 5381;
    do
    {
      uint64_t v19 = (const char *)v21;
      unsigned int v22 = *v20++;
      uint64_t v21 = (33 * v21) ^ v22;
    }
    while (v22);
  }
  std::mutex::lock(ServiceMap);
  *(void *)buf = v19;
  char v23 = sub_10004D37C(&v18[1].__m_.__sig, (unint64_t *)buf);
  if (!v23)
  {
    std::mutex::unlock(v18);
    goto LABEL_21;
  }
  uint64_t v25 = v23[3];
  id v24 = (std::__shared_weak_count *)v23[4];
  if (v24)
  {
    atomic_fetch_add_explicit(&v24->__shared_owners_, 1uLL, memory_order_relaxed);
    std::mutex::unlock(v18);
    atomic_fetch_add_explicit(&v24->__shared_owners_, 1uLL, memory_order_relaxed);
    sub_10004D2C8(v24);
    if (!v25)
    {
      sub_10004D2C8(v24);
LABEL_21:
      v26 = *(NSObject **)self->fLogger.__ptr_.__value_;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[CTCellularPlanServer didSelectPlanItem:enable:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "#E %s: No controller", buf, 0xCu);
      }
      (*((void (**)(id, void, id))a5 + 2))(a5, 0, +[CTCellularPlanError errorForCode:4]);
      goto LABEL_29;
    }
  }
  else
  {
    std::mutex::unlock(v18);
    if (!v25) {
      goto LABEL_21;
    }
  }
  sub_100058DB0(__p, (char *)objc_msgSend(objc_msgSend(a3, "iccid"), "UTF8String"));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100EF5230;
  v30[3] = &unk_101A6B448;
  v30[4] = self;
  v30[5] = a5;
  (*(void (**)(uint64_t, void **, void *))(*(void *)v25 + 112))(v25, __p, v30);
  if (v32 < 0) {
    operator delete(__p[0]);
  }
  if (v24) {
    sub_10004D2C8(v24);
  }
LABEL_29:
  if (v11) {
LABEL_39:
  }
    sub_10004D2C8(v11);
}

- (void)didSelectPlanForData:(id)a3 completion:(id)a4
{
  cntrl = self->fCellularPlanControlleriPad.__cntrl_;
  if (cntrl)
  {
    uint64_t v8 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v8)
    {
      ptr = self->fCellularPlanControlleriPad.__ptr_;
      if (ptr)
      {
        if (!a3 || ![a3 iccid])
        {
          unsigned int v13 = *(NSObject **)self->fLogger.__ptr_.__value_;
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#E missing plan item or iccid", buf, 2u);
          }
          (*((void (**)(id, void, id))a4 + 2))(a4, 0, +[CTCellularPlanError errorForCode:6 withDescription:@"missing plan item"]);
          goto LABEL_19;
        }
        BOOL v10 = *(NSObject **)self->fLogger.__ptr_.__value_;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&uint8_t buf[4] = objc_msgSend(objc_msgSend(a3, "iccid"), "UTF8String");
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#I didSelectPlanForData [%s]", buf, 0xCu);
        }
        sub_100058DB0(__p, (char *)objc_msgSend(objc_msgSend(a3, "iccid"), "UTF8String"));
        if (a4) {
          v11 = _Block_copy(a4);
        }
        else {
          v11 = 0;
        }
        v29[0] = off_101A6BBD8;
        v29[1] = self;
        v29[2] = v11;
        v29[3] = v29;
        (*(void (**)(CellularPlanController *, void **, uint64_t, void *))(*(void *)ptr + 528))(ptr, __p, 1, v29);
        sub_10023D374(v29);
        id v14 = (uint64_t *)v26;
        if ((v14 & 0x80000000) != 0) {
          operator delete(__p[0]);
        }
        ServiceMap = (std::mutex *)Registry::getServiceMap(v14, self->fRegistry.__ptr_);
        uint64_t v16 = ServiceMap;
        if (v17 < 0)
        {
          uint64_t v18 = (unsigned __int8 *)(v17 & 0x7FFFFFFFFFFFFFFFLL);
          uint64_t v19 = 5381;
          do
          {
            uint64_t v17 = v19;
            unsigned int v20 = *v18++;
            uint64_t v19 = (33 * v19) ^ v20;
          }
          while (v20);
        }
        std::mutex::lock(ServiceMap);
        *(void *)buf = v17;
        uint64_t v21 = sub_10004D37C(&v16[1].__m_.__sig, (unint64_t *)buf);
        if (v21)
        {
          uint64_t v23 = v21[3];
          unsigned int v22 = (std::__shared_weak_count *)v21[4];
          if (v22)
          {
            atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed);
            std::mutex::unlock(v16);
            atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed);
            sub_10004D2C8(v22);
            char v24 = 0;
            if (!v23)
            {
LABEL_34:
              if ((v24 & 1) == 0) {
                sub_10004D2C8(v22);
              }
              goto LABEL_14;
            }
LABEL_32:
            sub_100058DB0(buf, (char *)objc_msgSend(objc_msgSend(a3, "iccid"), "UTF8String"));
            (*(void (**)(uint64_t, unsigned char *))(*(void *)v23 + 24))(v23, buf);
            if (v28 < 0) {
              operator delete(*(void **)buf);
            }
            goto LABEL_34;
          }
        }
        else
        {
          uint64_t v23 = 0;
        }
        std::mutex::unlock(v16);
        unsigned int v22 = 0;
        char v24 = 1;
        if (!v23) {
          goto LABEL_34;
        }
        goto LABEL_32;
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v12 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[CTCellularPlanServer didSelectPlanForData:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#E %s: No controller", buf, 0xCu);
  }
  (*((void (**)(id, void, id))a4 + 2))(a4, 0, +[CTCellularPlanError errorForCode:4]);
LABEL_14:
  if (v8) {
LABEL_19:
  }
    sub_10004D2C8(v8);
}

- (void)setLabelForPlan:(id)a3 label:(id)a4 completion:(id)a5
{
  ServiceMap = (std::mutex *)Registry::getServiceMap(__stack_chk_guard, self->fRegistry.__ptr_);
  BOOL v10 = ServiceMap;
  if (v11 < 0)
  {
    uint64_t v12 = (unsigned __int8 *)(v11 & 0x7FFFFFFFFFFFFFFFLL);
    uint64_t v13 = 5381;
    do
    {
      uint64_t v11 = v13;
      unsigned int v14 = *v12++;
      uint64_t v13 = (33 * v13) ^ v14;
    }
    while (v14);
  }
  std::mutex::lock(ServiceMap);
  *(void *)buf = v11;
  unsigned int v15 = sub_10004D37C(&v10[1].__m_.__sig, (unint64_t *)buf);
  if (!v15)
  {
    uint64_t v17 = 0;
LABEL_11:
    std::mutex::unlock(v10);
    uint64_t v16 = 0;
    char v18 = 1;
    if (!v17) {
      goto LABEL_7;
    }
    goto LABEL_12;
  }
  uint64_t v17 = v15[3];
  uint64_t v16 = (std::__shared_weak_count *)v15[4];
  if (!v16) {
    goto LABEL_11;
  }
  atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
  std::mutex::unlock(v10);
  atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
  sub_10004D2C8(v16);
  char v18 = 0;
  if (!v17)
  {
LABEL_7:
    uint64_t v19 = *(NSObject **)self->fLogger.__ptr_.__value_;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[CTCellularPlanServer setLabelForPlan:label:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#E %s: No PersonalityShop", buf, 0xCu);
    }
    id v20 = +[CTCellularPlanError errorForCode:4];
LABEL_21:
    (*((void (**)(id, void, id))a5 + 2))(a5, 0, v20);
    goto LABEL_22;
  }
LABEL_12:
  if (!a3 || ![a3 iccid])
  {
    uint64_t v25 = *(NSObject **)self->fLogger.__ptr_.__value_;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "#E missing plan item or iccid", buf, 2u);
    }
    id v20 = +[CTCellularPlanError errorForCode:6 withDescription:@"missing plan item"];
    goto LABEL_21;
  }
  uint64_t v21 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    id v22 = objc_msgSend(objc_msgSend(a3, "iccid"), "UTF8String");
    id v23 = objc_msgSend(objc_msgSend(a4, "key"), "UTF8String");
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = v22;
    *(_WORD *)&unsigned char buf[12] = 2080;
    *(void *)&buf[14] = v23;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#I setLabelForPlan [%s] tag: %s", buf, 0x16u);
  }
  if ([a4 key]) {
    unsigned int v24 = objc_msgSend(objc_msgSend(a4, "key"), "isEqualToString:", &stru_101AC1B28);
  }
  else {
    unsigned int v24 = 1;
  }
  __dst = 0;
  uint64_t v54 = 0;
  uint64_t v55 = 0;
  [a3 iccid];
  memset(buf, 0, 24);
  ctu::cf::assign();
  v27 = *(void **)buf;
  uint64_t v26 = *(void *)&buf[8];
  LODWORD(v47[0]) = *(_DWORD *)&buf[16];
  *(_DWORD *)((char *)v47 + 3) = *(_DWORD *)&buf[19];
  if ((char)buf[23] < 0)
  {
    sub_10004FC84(&__dst, *(void **)buf, *(unint64_t *)&buf[8]);
    operator delete(v27);
  }
  else
  {
    __dst = *(void **)buf;
    uint64_t v54 = *(void *)&buf[8];
    LODWORD(v55) = v47[0];
    *(_DWORD *)((char *)&v55 + 3) = *(_DWORD *)((char *)v47 + 3);
    HIBYTE(v55) = buf[23];
  }
  (*(void (**)(uint8_t *__return_ptr, uint64_t, void **, uint64_t))(*(void *)v17 + 176))(buf, v17, &__dst, v26);
  if ((SBYTE7(v59) & 0x80u) == 0) {
    char v28 = (void *)BYTE7(v59);
  }
  else {
    char v28 = v58[1];
  }
  if (SHIBYTE(v61) < 0)
  {
    operator delete(v60[0]);
    if ((BYTE7(v59) & 0x80) == 0) {
      goto LABEL_34;
    }
  }
  else if ((BYTE7(v59) & 0x80) == 0)
  {
    goto LABEL_34;
  }
  operator delete(v58[0]);
LABEL_34:
  if (SHIBYTE(v57) < 0) {
    operator delete(*(void **)&buf[24]);
  }
  if ((char)buf[23] < 0)
  {
    operator delete(*(void **)buf);
    if (v28) {
      goto LABEL_54;
    }
  }
  else if (v28)
  {
    goto LABEL_54;
  }
  (*(void (**)(uint8_t *__return_ptr, uint64_t, void **, uint64_t))(*(void *)v17 + 208))(buf, v17, &__dst, 2);
  char v29 = BYTE7(v59);
  if ((SBYTE7(v59) & 0x80u) == 0) {
    char v30 = (void *)BYTE7(v59);
  }
  else {
    char v30 = v58[1];
  }
  if (SHIBYTE(v61) < 0)
  {
    operator delete(v60[0]);
    char v29 = BYTE7(v59);
  }
  if (v29 < 0) {
    operator delete(v58[0]);
  }
  if (SHIBYTE(v57) < 0) {
    operator delete(*(void **)&buf[24]);
  }
  if ((char)buf[23] < 0) {
    operator delete(*(void **)buf);
  }
  if (v30)
  {
LABEL_54:
    uint64_t v61 = 0;
    long long v59 = 0u;
    *(_OWORD *)v60 = 0u;
    long long v57 = 0u;
    *(_OWORD *)v58 = 0u;
    memset(buf, 0, sizeof(buf));
    if (v24) {
      v31 = (char *)objc_msgSend(objc_msgSend(a4, "label"), "UTF8String");
    }
    else {
      v31 = "";
    }
    sub_100058DB0(v47, v31);
    if (v24) {
      char v32 = "";
    }
    else {
      char v32 = (char *)objc_msgSend(objc_msgSend(a4, "key"), "UTF8String");
    }
    sub_100058DB0(v51, v32);
    (*(void (**)(uint8_t *__return_ptr, uint64_t, void **, void **, void **, uint64_t))(*(void *)v17 + 216))(buf, v17, &__dst, v47, v51, 1);
    if (v52 < 0) {
      operator delete(v51[0]);
    }
    if (v48 < 0) {
      operator delete(v47[0]);
    }
    v33 = (void *)BYTE7(v59);
    if (SBYTE7(v59) < 0) {
      v33 = v58[1];
    }
    if (!v33)
    {
      (*((void (**)(id, void, id))a5 + 2))(a5, 0, +[CTCellularPlanError errorForCode:5 withDescription:@"rename failed"]);
LABEL_88:
      if (SHIBYTE(v61) < 0) {
        operator delete(v60[0]);
      }
      if (SBYTE7(v59) < 0) {
        operator delete(v58[0]);
      }
      if (SHIBYTE(v57) < 0) {
        operator delete(*(void **)&buf[24]);
      }
      if ((char)buf[23] < 0) {
        operator delete(*(void **)buf);
      }
      goto LABEL_97;
    }
    (*((void (**)(id, uint64_t, void))a5 + 2))(a5, 1, 0);
    v35 = (std::mutex *)Registry::getServiceMap(v34, self->fRegistry.__ptr_);
    char v36 = v35;
    if (v37 < 0)
    {
      v38 = (unsigned __int8 *)(v37 & 0x7FFFFFFFFFFFFFFFLL);
      uint64_t v39 = 5381;
      do
      {
        uint64_t v37 = v39;
        unsigned int v40 = *v38++;
        uint64_t v39 = (33 * v39) ^ v40;
      }
      while (v40);
    }
    std::mutex::lock(v35);
    v47[0] = (void *)v37;
    v41 = sub_10004D37C(&v36[1].__m_.__sig, (unint64_t *)v47);
    if (v41)
    {
      uint64_t v43 = v41[3];
      v42 = (std::__shared_weak_count *)v41[4];
      if (v42)
      {
        atomic_fetch_add_explicit(&v42->__shared_owners_, 1uLL, memory_order_relaxed);
        std::mutex::unlock(v36);
        atomic_fetch_add_explicit(&v42->__shared_owners_, 1uLL, memory_order_relaxed);
        sub_10004D2C8(v42);
        char v44 = 0;
        if (!v43)
        {
LABEL_86:
          if ((v44 & 1) == 0) {
            sub_10004D2C8(v42);
          }
          goto LABEL_88;
        }
LABEL_77:
        sub_100058DB0(v51, (char *)objc_msgSend(objc_msgSend(a3, "iccid"), "UTF8String"));
        if (v24)
        {
          v45 = (char *)objc_msgSend(objc_msgSend(a4, "label"), "UTF8String");
          v46 = "";
        }
        else
        {
          v46 = (char *)objc_msgSend(objc_msgSend(a4, "key"), "UTF8String");
          v45 = "";
        }
        sub_100058DB0(v47, v45);
        sub_100058DB0(&v49, v46);
        (*(void (**)(uint64_t, void **, void **))(*(void *)v43 + 16))(v43, v51, v47);
        if (v50 < 0) {
          operator delete(v49);
        }
        if (v48 < 0) {
          operator delete(v47[0]);
        }
        if (v52 < 0) {
          operator delete(v51[0]);
        }
        goto LABEL_86;
      }
    }
    else
    {
      uint64_t v43 = 0;
    }
    std::mutex::unlock(v36);
    v42 = 0;
    char v44 = 1;
    if (!v43) {
      goto LABEL_86;
    }
    goto LABEL_77;
  }
  (*((void (**)(id, void, id))a5 + 2))(a5, 0, +[CTCellularPlanError errorForCode:5 withDescription:@"label create failed"]);
LABEL_97:
  if (SHIBYTE(v55) < 0) {
    operator delete(__dst);
  }
LABEL_22:
  if ((v18 & 1) == 0) {
    sub_10004D2C8(v16);
  }
}

- (void)didSelectPlanForDefaultVoice:(id)a3 completion:(id)a4
{
  cntrl = self->fCellularPlanControlleriPad.__cntrl_;
  if (cntrl)
  {
    uint64_t v8 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v8)
    {
      ptr = self->fCellularPlanControlleriPad.__ptr_;
      if (ptr)
      {
        if (!a3 || ![a3 iccid])
        {
          uint64_t v13 = *(NSObject **)self->fLogger.__ptr_.__value_;
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#E missing plan item or iccid", buf, 2u);
          }
          (*((void (**)(id, void, id))a4 + 2))(a4, 0, +[CTCellularPlanError errorForCode:6 withDescription:@"missing plan item"]);
          goto LABEL_19;
        }
        BOOL v10 = *(NSObject **)self->fLogger.__ptr_.__value_;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&uint8_t buf[4] = objc_msgSend(objc_msgSend(a3, "iccid"), "UTF8String");
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#I didSelectPlanForDefaultVoice [%s]", buf, 0xCu);
        }
        sub_100058DB0(__p, (char *)objc_msgSend(objc_msgSend(a3, "iccid"), "UTF8String"));
        if (a4) {
          uint64_t v11 = _Block_copy(a4);
        }
        else {
          uint64_t v11 = 0;
        }
        v29[0] = off_101A6BC58;
        v29[1] = self;
        v29[2] = v11;
        v29[3] = v29;
        (*(void (**)(CellularPlanController *, void **, void *))(*(void *)ptr + 536))(ptr, __p, v29);
        sub_10023D374(v29);
        unsigned int v14 = (uint64_t *)v26;
        if ((v14 & 0x80000000) != 0) {
          operator delete(__p[0]);
        }
        ServiceMap = (std::mutex *)Registry::getServiceMap(v14, self->fRegistry.__ptr_);
        uint64_t v16 = ServiceMap;
        if (v17 < 0)
        {
          char v18 = (unsigned __int8 *)(v17 & 0x7FFFFFFFFFFFFFFFLL);
          uint64_t v19 = 5381;
          do
          {
            uint64_t v17 = v19;
            unsigned int v20 = *v18++;
            uint64_t v19 = (33 * v19) ^ v20;
          }
          while (v20);
        }
        std::mutex::lock(ServiceMap);
        *(void *)buf = v17;
        uint64_t v21 = sub_10004D37C(&v16[1].__m_.__sig, (unint64_t *)buf);
        if (v21)
        {
          uint64_t v23 = v21[3];
          id v22 = (std::__shared_weak_count *)v21[4];
          if (v22)
          {
            atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed);
            std::mutex::unlock(v16);
            atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed);
            sub_10004D2C8(v22);
            char v24 = 0;
            if (!v23)
            {
LABEL_34:
              if ((v24 & 1) == 0) {
                sub_10004D2C8(v22);
              }
              goto LABEL_14;
            }
LABEL_32:
            sub_100058DB0(buf, (char *)objc_msgSend(objc_msgSend(a3, "iccid"), "UTF8String"));
            (*(void (**)(uint64_t, unsigned char *))(*(void *)v23 + 32))(v23, buf);
            if (v28 < 0) {
              operator delete(*(void **)buf);
            }
            goto LABEL_34;
          }
        }
        else
        {
          uint64_t v23 = 0;
        }
        std::mutex::unlock(v16);
        id v22 = 0;
        char v24 = 1;
        if (!v23) {
          goto LABEL_34;
        }
        goto LABEL_32;
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v12 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[CTCellularPlanServer didSelectPlanForDefaultVoice:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#E %s: No controller", buf, 0xCu);
  }
  (*((void (**)(id, void, id))a4 + 2))(a4, 0, +[CTCellularPlanError errorForCode:4]);
LABEL_14:
  if (v8) {
LABEL_19:
  }
    sub_10004D2C8(v8);
}

- (void)didSelectPlansForIMessage:(id)a3 completion:(id)a4
{
  cntrl = self->fCellularPlanControlleriPad.__cntrl_;
  if (!cntrl || (uint64_t v8 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl)) == 0)
  {
    v31 = 0;
    goto LABEL_27;
  }
  v31 = v8;
  if (!self->fCellularPlanControlleriPad.__ptr_)
  {
LABEL_27:
    uint64_t v17 = *(NSObject **)self->fLogger.__ptr_.__value_;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v43) = 136315138;
      *(void *)((char *)&v43 + 4) = "-[CTCellularPlanServer didSelectPlansForIMessage:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#E %s: No controller", (uint8_t *)&v43, 0xCu);
    }
    (*((void (**)(id, void, id))a4 + 2))(a4, 0, +[CTCellularPlanError errorForCode:4]);
LABEL_30:
    if (!v31) {
      return;
    }
    goto LABEL_31;
  }
  if (a3)
  {
    ptr = self->fCellularPlanControlleriPad.__ptr_;
    *((void *)&v43 + 1) = 0;
    uint64_t v44 = 0;
    *(void *)&long long v43 = (char *)&v43 + 8;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v9 = [a3 countByEnumeratingWithState:&v32 objects:v42 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v33;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v33 != v10) {
            objc_enumerationMutation(a3);
          }
          uint64_t v12 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          if ([v12 iccid] && objc_msgSend(objc_msgSend(v12, "iccid"), "length"))
          {
            buf.__r_.__value_.__r.__words[0] = (std::string::size_type)objc_msgSend(objc_msgSend(v12, "iccid"), "UTF8String");
            sub_100495908((uint64_t **)&v43, &buf.__r_.__value_.__l.__data_);
          }
          else
          {
            uint64_t v13 = *(NSObject **)self->fLogger.__ptr_.__value_;
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(buf.__r_.__value_.__l.__data_) = 134217984;
              *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v12;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#E missing iccid for plan item (%p)", (uint8_t *)&buf, 0xCu);
            }
          }
        }
        id v9 = [a3 countByEnumeratingWithState:&v32 objects:v42 count:16];
      }
      while (v9);
    }
    if (!v44)
    {
      (*((void (**)(id, void, id))a4 + 2))(a4, 0, +[CTCellularPlanError errorForCode:6 withDescription:@"missing iccid"]);
LABEL_50:
      sub_10005CD2C((uint64_t)&v43, *((char **)&v43 + 1));
      goto LABEL_30;
    }
    unsigned int v14 = *(NSObject **)self->fLogger.__ptr_.__value_;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      sub_1000E8F34((std::string *)v43, (std::string *)((char *)&v43 + 8), ",", 1uLL, &buf);
      unsigned int v15 = (buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
          ? &buf
          : (std::string *)buf.__r_.__value_.__r.__words[0];
      *(_DWORD *)v38 = 136315394;
      uint64_t v39 = "-[CTCellularPlanServer didSelectPlansForIMessage:completion:]";
      __int16 v40 = 2080;
      v41 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#I %s, plans: %s", v38, 0x16u);
      if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(buf.__r_.__value_.__l.__data_);
      }
    }
    if (a4) {
      uint64_t v16 = _Block_copy(a4);
    }
    else {
      uint64_t v16 = 0;
    }
    v36[0] = off_101A6BCD8;
    v36[1] = self;
    v36[2] = v16;
    v36[3] = v36;
    (*(void (**)(CellularPlanController *, long long *, void *))(*(void *)ptr + 544))(ptr, &v43, v36);
    sub_10023D374(v36);
    ServiceMap = (std::mutex *)Registry::getServiceMap(v19, self->fRegistry.__ptr_);
    uint64_t v21 = ServiceMap;
    if ((v22 & 0x8000000000000000) != 0)
    {
      uint64_t v23 = (unsigned __int8 *)(v22 & 0x7FFFFFFFFFFFFFFFLL);
      uint64_t v24 = 5381;
      do
      {
        std::string::size_type v22 = v24;
        unsigned int v25 = *v23++;
        uint64_t v24 = (33 * v24) ^ v25;
      }
      while (v25);
    }
    std::mutex::lock(ServiceMap);
    buf.__r_.__value_.__r.__words[0] = v22;
    char v26 = sub_10004D37C(&v21[1].__m_.__sig, (unint64_t *)&buf);
    if (v26)
    {
      uint64_t v28 = v26[3];
      v27 = (std::__shared_weak_count *)v26[4];
      if (v27)
      {
        atomic_fetch_add_explicit(&v27->__shared_owners_, 1uLL, memory_order_relaxed);
        std::mutex::unlock(v21);
        atomic_fetch_add_explicit(&v27->__shared_owners_, 1uLL, memory_order_relaxed);
        sub_10004D2C8(v27);
        char v29 = 0;
        if (!v28)
        {
LABEL_48:
          if ((v29 & 1) == 0) {
            sub_10004D2C8(v27);
          }
          goto LABEL_50;
        }
LABEL_47:
        (*(void (**)(uint64_t, long long *))(*(void *)v28 + 48))(v28, &v43);
        goto LABEL_48;
      }
    }
    else
    {
      uint64_t v28 = 0;
    }
    std::mutex::unlock(v21);
    v27 = 0;
    char v29 = 1;
    if (!v28) {
      goto LABEL_48;
    }
    goto LABEL_47;
  }
  char v18 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v43) = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#E missing plans", (uint8_t *)&v43, 2u);
  }
  (*((void (**)(id, void, id))a4 + 2))(a4, 0, +[CTCellularPlanError errorForCode:6 withDescription:@"missing plans"]);
LABEL_31:
  sub_10004D2C8(v31);
}

- (void)didEnablePlanItems:(id)a3 completion:(id)a4
{
  cntrl = self->fCellularPlanControlleriPad.__cntrl_;
  if (cntrl)
  {
    uint64_t v8 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v8)
    {
      ptr = self->fCellularPlanControlleriPad.__ptr_;
      if (ptr)
      {
        if (a3 && [a3 count])
        {
          *((void *)&v35 + 1) = 0;
          uint64_t v36 = 0;
          *(void *)&long long v35 = (char *)&v35 + 8;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          id v10 = [a3 countByEnumeratingWithState:&v25 objects:v34 count:16];
          std::string::size_type v22 = ptr;
          if (v10)
          {
            uint64_t v11 = *(void *)v26;
            do
            {
              for (i = 0; i != v10; i = (char *)i + 1)
              {
                if (*(void *)v26 != v11) {
                  objc_enumerationMutation(a3);
                }
                uint64_t v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
                if ([v13 iccid] && objc_msgSend(objc_msgSend(v13, "iccid"), "length"))
                {
                  buf.__r_.__value_.__r.__words[0] = (std::string::size_type)objc_msgSend(objc_msgSend(v13, "iccid"), "UTF8String");
                  sub_100495908((uint64_t **)&v35, &buf.__r_.__value_.__l.__data_);
                }
                else
                {
                  unsigned int v14 = *(NSObject **)self->fLogger.__ptr_.__value_;
                  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
                  {
                    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
                    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#E Missing ICCID for an enabled plan", (uint8_t *)&buf, 2u);
                  }
                }
              }
              id v10 = [a3 countByEnumeratingWithState:&v25 objects:v34 count:16];
            }
            while (v10);
          }
          uint64_t v15 = v36;
          uint64_t v16 = *(NSObject **)self->fLogger.__ptr_.__value_;
          BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
          if (v15)
          {
            if (v17)
            {
              sub_1000E8F34((std::string *)v35, (std::string *)((char *)&v35 + 8), ",", 1uLL, &buf);
              char v18 = (buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
                  ? &buf
                  : (std::string *)buf.__r_.__value_.__r.__words[0];
              *(_DWORD *)char v30 = 136315394;
              v31 = "-[CTCellularPlanServer didEnablePlanItems:completion:]";
              __int16 v32 = 2080;
              long long v33 = v18;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#I %s, plans: %s", v30, 0x16u);
              if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(buf.__r_.__value_.__l.__data_);
              }
            }
            sub_1000C6BDC(v23, (uint64_t)&v35);
            if (a4) {
              uint64_t v19 = _Block_copy(a4);
            }
            else {
              uint64_t v19 = 0;
            }
            v29[0] = off_101A6BD58;
            v29[1] = self;
            v29[2] = v19;
            v29[3] = v29;
            (*(void (**)(CellularPlanController *, uint64_t *, void *))(*(void *)v22 + 560))(v22, v23, v29);
            sub_10030C77C(v29);
            sub_10005CD2C((uint64_t)v23, (char *)v23[1]);
          }
          else
          {
            if (v17)
            {
              LOWORD(buf.__r_.__value_.__l.__data_) = 0;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#E Enabled item missing ICCID", (uint8_t *)&buf, 2u);
            }
            (*((void (**)(id, id))a4 + 2))(a4, +[CTCellularPlanError errorForCode:6 withDescription:@"No ICCIDs to enable"]);
          }
          sub_10005CD2C((uint64_t)&v35, *((char **)&v35 + 1));
        }
        else
        {
          uint64_t v21 = *(NSObject **)self->fLogger.__ptr_.__value_;
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v35) = 0;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#E Missing plans to enable", (uint8_t *)&v35, 2u);
          }
          (*((void (**)(id, id))a4 + 2))(a4, +[CTCellularPlanError errorForCode:6 withDescription:@"Empty or nil plans - at least 1 plan required"]);
        }
LABEL_41:
        sub_10004D2C8(v8);
        return;
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  unsigned int v20 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v35) = 136315138;
    *(void *)((char *)&v35 + 4) = "-[CTCellularPlanServer didEnablePlanItems:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#E %s: No controller", (uint8_t *)&v35, 0xCu);
  }
  (*((void (**)(id, id))a4 + 2))(a4, +[CTCellularPlanError errorForCode:4]);
  if (v8) {
    goto LABEL_41;
  }
}

- (void)didDeletePlanItem:(id)a3 completion:(id)a4
{
  cntrl = self->fCellularPlanControlleriPad.__cntrl_;
  if (cntrl)
  {
    uint64_t v8 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v8)
    {
      ptr = self->fCellularPlanControlleriPad.__ptr_;
      if (ptr)
      {
        if (a3 && [a3 iccid])
        {
          id v10 = *(NSObject **)self->fLogger.__ptr_.__value_;
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)std::string buf = 136315138;
            BOOL v17 = "-[CTCellularPlanServer didDeletePlanItem:completion:]";
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#I %s", buf, 0xCu);
          }
          sub_100058DB0(__p, (char *)objc_msgSend(objc_msgSend(a3, "iccid"), "UTF8String"));
          v13[0] = _NSConcreteStackBlock;
          v13[1] = 3221225472;
          v13[2] = sub_100EF71F0;
          v13[3] = &unk_101A6B518;
          void v13[4] = self;
          v13[5] = a4;
          (*(void (**)(CellularPlanController *, void **, void *))(*(void *)ptr + 568))(ptr, __p, v13);
          if (v15 < 0) {
            operator delete(__p[0]);
          }
        }
        else
        {
          uint64_t v12 = *(NSObject **)self->fLogger.__ptr_.__value_;
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)std::string buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#E missing plan item or iccid", buf, 2u);
          }
          (*((void (**)(id, void, id))a4 + 2))(a4, 0, +[CTCellularPlanError errorForCode:6 withDescription:@"missing plan item or iccid"]);
        }
LABEL_18:
        sub_10004D2C8(v8);
        return;
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v11 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::string buf = 136315138;
    BOOL v17 = "-[CTCellularPlanServer didDeletePlanItem:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#E %s: No controller", buf, 0xCu);
  }
  (*((void (**)(id, void, id))a4 + 2))(a4, 0, +[CTCellularPlanError errorForCode:4]);
  if (v8) {
    goto LABEL_18;
  }
}

- (void)eraseAllPlansWithCompletion:(id)a3
{
  BOOL v5 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::string buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[CTCellularPlanServer eraseAllPlansWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s", buf, 0xCu);
  }
  cntrl = self->fCellularPlanControlleriPad.__cntrl_;
  if (cntrl)
  {
    uint64_t v8 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v8)
    {
      ptr = self->fCellularPlanControlleriPad.__ptr_;
      if (ptr)
      {
        void v21[6] = _NSConcreteStackBlock;
        v21[7] = 3221225472;
        v21[8] = sub_100EF7590;
        v21[9] = &unk_101A6B518;
        v21[10] = self;
        void v21[11] = a3;
        (*(void (**)(void))(*(void *)ptr + 576))();
LABEL_23:
        sub_10004D2C8(v8);
        return;
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  ServiceMap = (std::mutex *)Registry::getServiceMap(v6, self->fRegistry.__ptr_);
  uint64_t v11 = ServiceMap;
  uint64_t v12 = "N8cellplan36CellularPlanControllerWatchInterfaceE";
  if (((unint64_t)"N8cellplan36CellularPlanControllerWatchInterfaceE" & 0x8000000000000000) != 0)
  {
    uint64_t v13 = (unsigned __int8 *)((unint64_t)"N8cellplan36CellularPlanControllerWatchInterfaceE" & 0x7FFFFFFFFFFFFFFFLL);
    uint64_t v14 = 5381;
    do
    {
      uint64_t v12 = (const char *)v14;
      unsigned int v15 = *v13++;
      uint64_t v14 = (33 * v14) ^ v15;
    }
    while (v15);
  }
  std::mutex::lock(ServiceMap);
  *(void *)std::string buf = v12;
  uint64_t v16 = sub_10004D37C(&v11[1].__m_.__sig, (unint64_t *)buf);
  if (!v16)
  {
    uint64_t v18 = 0;
LABEL_18:
    std::mutex::unlock(v11);
    BOOL v17 = 0;
    char v19 = 1;
    if (!v18) {
      goto LABEL_14;
    }
LABEL_19:
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100EF75DC;
    v21[3] = &unk_101A6B518;
    v21[4] = self;
    v21[5] = a3;
    (*(void (**)(uint64_t, void *))(*(void *)v18 + 120))(v18, v21);
    goto LABEL_20;
  }
  uint64_t v18 = v16[3];
  BOOL v17 = (std::__shared_weak_count *)v16[4];
  if (!v17) {
    goto LABEL_18;
  }
  atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
  std::mutex::unlock(v11);
  atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
  sub_10004D2C8(v17);
  char v19 = 0;
  if (v18) {
    goto LABEL_19;
  }
LABEL_14:
  unsigned int v20 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::string buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[CTCellularPlanServer eraseAllPlansWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#E %s: No controller", buf, 0xCu);
  }
  (*((void (**)(id, void, id))a3 + 2))(a3, 0, +[CTCellularPlanError errorForCode:4]);
LABEL_20:
  if ((v19 & 1) == 0) {
    sub_10004D2C8(v17);
  }
  if (v8) {
    goto LABEL_23;
  }
}

- (void)didPurchasePlanForCsn:(id)a3 iccid:(id)a4 profileServer:(id)a5 state:(id)a6
{
  uint64_t v11 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::string buf = 136315906;
    uint64_t v21 = "-[CTCellularPlanServer didPurchasePlanForCsn:iccid:profileServer:state:]";
    __int16 v22 = 2080;
    id v23 = objc_msgSend(objc_msgSend(a3, "description"), "UTF8String");
    __int16 v24 = 2080;
    id v25 = [a4 UTF8String];
    __int16 v26 = 2080;
    id v27 = [a6 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#I %s: csn: %s, iccid: %s state: %s", buf, 0x2Au);
  }
  cntrl = self->fCellularPlanControlleriPad.__cntrl_;
  if (cntrl)
  {
    uint64_t v13 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v13)
    {
      ptr = self->fCellularPlanControlleriPad.__ptr_;
      if (ptr)
      {
        id v19 = a3;
        if (a3) {
          CFRetain(a3);
        }
        id v18 = a4;
        if (a4) {
          CFRetain(a4);
        }
        id v17 = a5;
        if (a5) {
          CFRetain(a5);
        }
        id v16 = a6;
        if (a6) {
          CFRetain(a6);
        }
        (*(void (**)(CellularPlanController *, id *, id *, id *, id *))(*(void *)ptr + 584))(ptr, &v19, &v18, &v17, &v16);
        sub_1000558F4((const void **)&v16);
        sub_1000558F4((const void **)&v17);
        sub_1000558F4((const void **)&v18);
        sub_100030068((const void **)&v19);
LABEL_19:
        sub_10004D2C8(v13);
        return;
      }
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  unsigned int v15 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::string buf = 136315138;
    uint64_t v21 = "-[CTCellularPlanServer didPurchasePlanForCsn:iccid:profileServer:state:]";
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#E %s: No controller", buf, 0xCu);
  }
  if (v13) {
    goto LABEL_19;
  }
}

- (void)didPurchasePlanForCarrier:(id)a3 mnc:(id)a4 gid1:(id)a5 gid2:(id)a6 state:(id)a7
{
  uint64_t v13 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v23 = objc_msgSend(objc_msgSend(a3, "description"), "UTF8String");
    id v24 = a3;
    id v14 = [a4 UTF8String];
    id v15 = [a5 UTF8String];
    id v16 = a6;
    id v17 = [a6 UTF8String];
    id v18 = [a7 UTF8String];
    *(_DWORD *)std::string buf = 136316418;
    *(void *)&uint8_t buf[4] = "-[CTCellularPlanServer didPurchasePlanForCarrier:mnc:gid1:gid2:state:]";
    *(_WORD *)&unsigned char buf[12] = 2080;
    *(void *)&buf[14] = v23;
    *(_WORD *)&buf[22] = 2080;
    id v41 = v14;
    a3 = v24;
    __int16 v42 = 2080;
    id v43 = v15;
    __int16 v44 = 2080;
    id v45 = v17;
    a6 = v16;
    __int16 v46 = 2080;
    id v47 = v18;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#I %s: mcc: %s, mnc: %s gid1: %s gid2: %s state: %s", buf, 0x3Eu);
  }
  cntrl = self->fCellularPlanControlleriPad.__cntrl_;
  if (cntrl)
  {
    unsigned int v20 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v20)
    {
      ptr = self->fCellularPlanControlleriPad.__ptr_;
      if (ptr)
      {
        id v39 = a3;
        if (a3) {
          CFRetain(a3);
        }
        id v38 = a4;
        if (a4) {
          CFRetain(a4);
        }
        id v37 = a5;
        if (a5) {
          CFRetain(a5);
        }
        id v36 = a6;
        if (a6) {
          CFRetain(a6);
        }
        id v35 = a7;
        if (a7) {
          CFRetain(a7);
        }
        memset(buf, 0, sizeof(buf));
        ctu::cf::assign();
        *(_OWORD *)long long v33 = *(_OWORD *)buf;
        uint64_t v34 = *(void *)&buf[16];
        memset(buf, 0, sizeof(buf));
        ctu::cf::assign();
        *(_OWORD *)v31 = *(_OWORD *)buf;
        uint64_t v32 = *(void *)&buf[16];
        memset(buf, 0, sizeof(buf));
        ctu::cf::assign();
        *(_OWORD *)char v29 = *(_OWORD *)buf;
        uint64_t v30 = *(void *)&buf[16];
        memset(buf, 0, sizeof(buf));
        ctu::cf::assign();
        *(_OWORD *)id v27 = *(_OWORD *)buf;
        uint64_t v28 = *(void *)&buf[16];
        memset(buf, 0, sizeof(buf));
        ctu::cf::assign();
        *(_OWORD *)__p = *(_OWORD *)buf;
        uint64_t v26 = *(void *)&buf[16];
        (*(void (**)(CellularPlanController *, void **, void **, void **, void **, void **))(*(void *)ptr + 592))(ptr, v33, v31, v29, v27, __p);
        if (SHIBYTE(v26) < 0) {
          operator delete(__p[0]);
        }
        if (SHIBYTE(v28) < 0) {
          operator delete(v27[0]);
        }
        if (SHIBYTE(v30) < 0) {
          operator delete(v29[0]);
        }
        if (SHIBYTE(v32) < 0) {
          operator delete(v31[0]);
        }
        if (SHIBYTE(v34) < 0) {
          operator delete(v33[0]);
        }
        sub_1000558F4((const void **)&v35);
        sub_1000558F4((const void **)&v36);
        sub_1000558F4((const void **)&v37);
        sub_1000558F4((const void **)&v38);
        sub_1000558F4((const void **)&v39);
LABEL_31:
        sub_10004D2C8(v20);
        return;
      }
    }
  }
  else
  {
    unsigned int v20 = 0;
  }
  __int16 v22 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::string buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[CTCellularPlanServer didPurchasePlanForCarrier:mnc:gid1:gid2:state:]";
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#E %s: No controller", buf, 0xCu);
  }
  if (v20) {
    goto LABEL_31;
  }
}

- (void)didTransferPlanForCsn:(id)a3 iccid:(id)a4 srcIccid:(id)a5 profileServer:(id)a6 state:(id)a7
{
  if (a5) {
    uint64_t v12 = (__CFString *)a5;
  }
  else {
    uint64_t v12 = &stru_101AC1B28;
  }
  uint64_t v13 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::string buf = 136315906;
    id v24 = "-[CTCellularPlanServer didTransferPlanForCsn:iccid:srcIccid:profileServer:state:]";
    __int16 v25 = 2080;
    id v26 = objc_msgSend(objc_msgSend(a3, "description"), "UTF8String");
    __int16 v27 = 2080;
    id v28 = [a4 UTF8String];
    __int16 v29 = 2080;
    id v30 = [(__CFString *)v12 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#I %s: csn: %s, iccid: %s srcIccid: %s", buf, 0x2Au);
  }
  cntrl = self->fCellularPlanControlleriPad.__cntrl_;
  if (cntrl)
  {
    id v15 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v15)
    {
      ptr = self->fCellularPlanControlleriPad.__ptr_;
      if (ptr)
      {
        id v22 = a3;
        if (a3) {
          CFRetain(a3);
        }
        id v21 = a4;
        if (a4) {
          CFRetain(a4);
        }
        unsigned int v20 = v12;
        CFRetain(v12);
        id v19 = a6;
        if (a6) {
          CFRetain(a6);
        }
        id v18 = a7;
        if (a7) {
          CFRetain(a7);
        }
        (*(void (**)(CellularPlanController *, id *, id *, __CFString **, id *, id *))(*(void *)ptr + 600))(ptr, &v22, &v21, &v20, &v19, &v18);
        sub_1000558F4((const void **)&v18);
        sub_1000558F4((const void **)&v19);
        sub_1000558F4((const void **)&v20);
        sub_1000558F4((const void **)&v21);
        sub_100030068((const void **)&v22);
LABEL_22:
        sub_10004D2C8(v15);
        return;
      }
    }
  }
  else
  {
    id v15 = 0;
  }
  id v17 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::string buf = 136315138;
    id v24 = "-[CTCellularPlanServer didTransferPlanForCsn:iccid:srcIccid:profileServer:state:]";
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#E %s: No controller", buf, 0xCu);
  }
  if (v15) {
    goto LABEL_22;
  }
}

- (void)sendPlanInfoDidUpdateNotification
{
  fObj = self->fQueue.fObj.fObj;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100EF80C0;
  block[3] = &unk_1019B3470;
  block[4] = self;
  dispatch_async(fObj, block);
}

- (void)sendLocalPlanInfoDidUpdateNotification:(unsigned __int8)a3
{
  fObj = self->fQueue.fObj.fObj;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100EF838C;
  v4[3] = &unk_101A6B568;
  v4[4] = self;
  unsigned __int8 v5 = a3;
  dispatch_async(fObj, v4);
}

- (void)sendPendingTransferPlanInfoDidUpdateNotification
{
  fObj = self->fQueue.fObj.fObj;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100EF8680;
  block[3] = &unk_1019B3470;
  block[4] = self;
  dispatch_async(fObj, block);
}

- (void)sendCarrierInfoDidUpdateNotification
{
  fObj = self->fQueue.fObj.fObj;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100EF8948;
  block[3] = &unk_1019B3470;
  block[4] = self;
  dispatch_async(fObj, block);
}

- (void)sendRemoteProvisioningDidBecomeAvailable
{
  fObj = self->fQueue.fObj.fObj;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100EF8C10;
  block[3] = &unk_1019B3470;
  block[4] = self;
  dispatch_async(fObj, block);
}

- (void)didPurchasePlanWithIccid:(id)a3 downloadProfile:(BOOL)a4
{
  v6 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::string buf = 136315394;
    id v16 = "-[CTCellularPlanServer didPurchasePlanWithIccid:downloadProfile:]";
    __int16 v17 = 2080;
    id v18 = [a3 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I %s: handle purchase for iccid: %s", buf, 0x16u);
  }
  cntrl = self->fCellularPlanControlleriPad.__cntrl_;
  if (cntrl)
  {
    uint64_t v8 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v8)
    {
      ptr = self->fCellularPlanControlleriPad.__ptr_;
      if (ptr)
      {
        id v13 = a3;
        id v14 = 0;
        if (a3) {
          CFRetain(a3);
        }
        uint64_t v11 = 0;
        uint64_t v12 = 0;
        (*(void (**)(CellularPlanController *, const void **, id *, const void **, const void **))(*(void *)ptr + 584))(ptr, &v14, &v13, &v12, &v11);
        sub_1000558F4(&v11);
        sub_1000558F4(&v12);
        sub_1000558F4((const void **)&v13);
        sub_100030068(&v14);
LABEL_13:
        sub_10004D2C8(v8);
        return;
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v10 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::string buf = 136315138;
    id v16 = "-[CTCellularPlanServer didPurchasePlanWithIccid:downloadProfile:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#E %s: No controller", buf, 0xCu);
  }
  if (v8) {
    goto LABEL_13;
  }
}

- (void)setUserInPurchaseFlow:(BOOL)a3 withConnection:(id)a4
{
  BOOL v4 = a3;
  cntrl = self->fCellularPlanControlleriPad.__cntrl_;
  if (cntrl)
  {
    uint64_t v8 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v8)
    {
      id v9 = v8;
      ptr = self->fCellularPlanControlleriPad.__ptr_;
      if (ptr)
      {
        uint64_t v11 = *(NSObject **)self->fLogger.__ptr_.__value_;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v12 = [a4 processIdentifier];
          id v13 = [(NSMutableArray *)self->fConnectionsInPurchaseFlow count];
          int v21 = 136315906;
          id v22 = "-[CTCellularPlanServer setUserInPurchaseFlow:withConnection:]";
          __int16 v23 = 1024;
          BOOL v24 = v4;
          __int16 v25 = 1024;
          unsigned int v26 = v12;
          __int16 v27 = 2048;
          id v28 = v13;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#I %s: %d by %d - cnt:%lu", (uint8_t *)&v21, 0x22u);
        }
        fConnectionsInPurchaseFlow = self->fConnectionsInPurchaseFlow;
        if (v4)
        {
          if (([(NSMutableArray *)fConnectionsInPurchaseFlow containsObject:a4] & 1) == 0)
          {
            if (![(NSMutableArray *)self->fConnectionsInPurchaseFlow count]) {
              (*(void (**)(CellularPlanController *, uint64_t))(*(void *)ptr + 400))(ptr, 1);
            }
            [(NSMutableArray *)self->fConnectionsInPurchaseFlow addObject:a4];
          }
        }
        else if ([(NSMutableArray *)fConnectionsInPurchaseFlow containsObject:a4])
        {
          [(NSMutableArray *)self->fConnectionsInPurchaseFlow removeObject:a4];
          if (![(NSMutableArray *)self->fConnectionsInPurchaseFlow count]) {
            (*(void (**)(CellularPlanController *, void))(*(void *)ptr + 400))(ptr, 0);
          }
        }
      }
      sub_10004D2C8(v9);
    }
  }
  id v15 = self->fCellularPlanControllerPhone.__cntrl_;
  if (v15)
  {
    id v16 = std::__shared_weak_count::lock((std::__shared_weak_count *)v15);
    if (v16)
    {
      __int16 v17 = v16;
      id v18 = self->fCellularPlanControllerPhone.__ptr_;
      if (v18)
      {
        uint64_t v19 = *(void *)v18;
        if (v4) {
          unsigned int v20 = (void (**)(void))(v19 + 232);
        }
        else {
          unsigned int v20 = (void (**)(void))(v19 + 248);
        }
        (*v20)();
      }
      sub_10004D2C8(v17);
    }
  }
}

- (void)expirePlan
{
  if (qword_101B14190)
  {
    v2 = std::__shared_weak_count::lock((std::__shared_weak_count *)qword_101B14190);
    if (v2)
    {
      int v3 = v2;
      if (DataPlanManagerBootstrap::sInstance) {
        (*(void (**)(void))(*(void *)(DataPlanManagerBootstrap::sInstance + 8) + 256))();
      }
      sub_10004D2C8(v3);
    }
  }
}

- (void)isRemotePlanCapableWithContext:(id)a3 completion:(id)a4
{
  cntrl = self->fCellularPlanControllerPhone.__cntrl_;
  if (cntrl)
  {
    uint64_t v8 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v8)
    {
      ptr = self->fCellularPlanControllerPhone.__ptr_;
      if (ptr)
      {
        if (a3)
        {
          id v10 = [a3 slotID];
          if (v10 == (id)2) {
            uint64_t v11 = 2;
          }
          else {
            uint64_t v11 = v10 == (id)1;
          }
        }
        else
        {
          uint64_t v11 = 1;
        }
        id v13 = *(NSObject **)self->fLogger.__ptr_.__value_;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)std::string buf = 136315394;
          id v16 = "-[CTCellularPlanServer isRemotePlanCapableWithContext:completion:]";
          __int16 v17 = 2080;
          uint64_t v18 = subscriber::asString();
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#I %s, %s", buf, 0x16u);
        }
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_100EF959C;
        v14[3] = &unk_101A6B420;
        v14[4] = a4;
        (*(void (**)(CellularPlanControllerInterface *, uint64_t, void *))(*(void *)ptr + 32))(ptr, v11, v14);
LABEL_17:
        sub_10004D2C8(v8);
        return;
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  unsigned int v12 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::string buf = 136315138;
    id v16 = "-[CTCellularPlanServer isRemotePlanCapableWithContext:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#E %s: No controller", buf, 0xCu);
  }
  (*((void (**)(id, void))a4 + 2))(a4, 0);
  if (v8) {
    goto LABEL_17;
  }
}

- (void)shouldShowAddNewRemotePlanWithContext:(id)a3 completion:(id)a4
{
  cntrl = self->fCellularPlanControllerPhone.__cntrl_;
  if (cntrl)
  {
    uint64_t v8 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v8)
    {
      ptr = self->fCellularPlanControllerPhone.__ptr_;
      if (ptr)
      {
        if (a3) {
          [a3 slotID];
        }
        (*(void (**)(CellularPlanControllerInterface *))(*(void *)ptr + 168))(ptr);
LABEL_12:
        sub_10004D2C8(v8);
        return;
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v10 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::string buf = 136315138;
    unsigned int v12 = "-[CTCellularPlanServer shouldShowAddNewRemotePlanWithContext:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#E %s: No controller", buf, 0xCu);
  }
  (*((void (**)(id, void, void, void, id))a4 + 2))(a4, 0, 0, 0, +[CTCellularPlanError errorForCode:17]);
  if (v8) {
    goto LABEL_12;
  }
}

- (void)startRemoteProvisioningWithCompletion:(id)a3
{
  cntrl = self->fCellularPlanControllerPhone.__cntrl_;
  if (cntrl)
  {
    v6 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v6)
    {
      ptr = self->fCellularPlanControllerPhone.__ptr_;
      if (ptr)
      {
        uint64_t v8 = *(NSObject **)self->fLogger.__ptr_.__value_;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)std::string buf = 136315138;
          unsigned int v12 = "-[CTCellularPlanServer startRemoteProvisioningWithCompletion:]";
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I %s", buf, 0xCu);
        }
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_100EF9B04;
        v10[3] = &unk_101A6B420;
        void v10[4] = a3;
        (*(void (**)(CellularPlanControllerInterface *, void *))(*(void *)ptr + 264))(ptr, v10);
LABEL_11:
        sub_10004D2C8(v6);
        return;
      }
    }
  }
  else
  {
    v6 = 0;
  }
  id v9 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::string buf = 136315138;
    unsigned int v12 = "-[CTCellularPlanServer startRemoteProvisioningWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#E %s: No controller", buf, 0xCu);
  }
  (*((void (**)(id, void))a3 + 2))(a3, 0);
  if (v6) {
    goto LABEL_11;
  }
}

- (void)finishRemoteProvisioningWithCompletion:(id)a3
{
  cntrl = self->fCellularPlanControllerPhone.__cntrl_;
  if (cntrl)
  {
    v6 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v6)
    {
      ptr = self->fCellularPlanControllerPhone.__ptr_;
      if (ptr)
      {
        uint64_t v8 = *(NSObject **)self->fLogger.__ptr_.__value_;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)std::string buf = 136315138;
          unsigned int v12 = "-[CTCellularPlanServer finishRemoteProvisioningWithCompletion:]";
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I %s", buf, 0xCu);
        }
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_100EF9D08;
        v10[3] = &unk_101A6B420;
        void v10[4] = a3;
        (*(void (**)(CellularPlanControllerInterface *, void *))(*(void *)ptr + 272))(ptr, v10);
LABEL_11:
        sub_10004D2C8(v6);
        return;
      }
    }
  }
  else
  {
    v6 = 0;
  }
  id v9 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::string buf = 136315138;
    unsigned int v12 = "-[CTCellularPlanServer finishRemoteProvisioningWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#E %s: No controller", buf, 0xCu);
  }
  (*((void (**)(id, void))a3 + 2))(a3, 0);
  if (v6) {
    goto LABEL_11;
  }
}

- (void)manageAccountForRemotePlan:(id)a3 completion:(id)a4
{
  cntrl = self->fCellularPlanControllerPhone.__cntrl_;
  if (cntrl)
  {
    uint64_t v8 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v8)
    {
      ptr = self->fCellularPlanControllerPhone.__ptr_;
      if (ptr)
      {
        if (a3 && [a3 iccid])
        {
          sub_100058DB0(__p, (char *)objc_msgSend(objc_msgSend(a3, "iccid"), "UTF8String"));
          (*(void (**)(CellularPlanControllerInterface *, void **))(*(void *)ptr + 64))(ptr, __p);
          if (v15 < 0) {
            operator delete(__p[0]);
          }
          id v10 = 0;
          uint64_t v11 = 1;
        }
        else
        {
          id v13 = *(NSObject **)self->fLogger.__ptr_.__value_;
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)std::string buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#E missing plan item or iccid", buf, 2u);
          }
          id v10 = +[CTCellularPlanError errorForCode:6 withDescription:@"missing plan item or iccid"];
          uint64_t v11 = 0;
        }
        (*((void (**)(id, uint64_t, id))a4 + 2))(a4, v11, v10);
LABEL_18:
        sub_10004D2C8(v8);
        return;
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  unsigned int v12 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::string buf = 136315138;
    __int16 v17 = "-[CTCellularPlanServer manageAccountForRemotePlan:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#E %s: No controller", buf, 0xCu);
  }
  (*((void (**)(id, void, id))a4 + 2))(a4, 0, +[CTCellularPlanError errorForCode:4]);
  if (v8) {
    goto LABEL_18;
  }
}

- (void)addNewRemotePlan:(BOOL)a3 withCSN:(id)a4 withContext:(id)a5 userConsent:(int64_t)a6 completion:(id)a7
{
  uint64_t v11 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#I trigger new remote data plan flow", buf, 2u);
  }
  cntrl = self->fCellularPlanControllerPhone.__cntrl_;
  if (cntrl)
  {
    id v13 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v13)
    {
      ptr = self->fCellularPlanControllerPhone.__ptr_;
      if (ptr)
      {
        if (a5)
        {
          id v15 = [a5 slotID];
          if (v15 == (id)2) {
            int v16 = 2;
          }
          else {
            int v16 = v15 == (id)1;
          }
        }
        else
        {
          int v16 = 1;
        }
        uint64_t v18 = *(NSObject **)self->fLogger.__ptr_.__value_;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = subscriber::asString();
          *(_DWORD *)std::string buf = 136315394;
          __int16 v25 = "-[CTCellularPlanServer addNewRemotePlan:withCSN:withContext:userConsent:completion:]";
          __int16 v26 = 2080;
          uint64_t v27 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#I %s, %s", buf, 0x16u);
          uint64_t v18 = *(NSObject **)self->fLogger.__ptr_.__value_;
        }
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)std::string buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#I isRemoteCellularPlanSupported", buf, 2u);
        }
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3321888768;
        v20[2] = sub_100EFA24C;
        v20[3] = &unk_101A6B5B8;
        v20[4] = self;
        void v20[6] = ptr;
        int v21 = v13;
        atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
        int v23 = v16;
        int64_t v22 = a6;
        v20[5] = a7;
        (*(void (**)(CellularPlanControllerInterface *, void *))(*(void *)ptr + 160))(ptr, v20);
        if (v21) {
          sub_10004D2C8(v21);
        }
LABEL_22:
        sub_10004D2C8(v13);
        return;
      }
    }
  }
  else
  {
    id v13 = 0;
  }
  __int16 v17 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::string buf = 136315138;
    __int16 v25 = "-[CTCellularPlanServer addNewRemotePlan:withCSN:withContext:userConsent:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#E %s: No controller", buf, 0xCu);
  }
  (*((void (**)(id, id))a7 + 2))(a7, +[CTCellularPlanError errorForCode:4]);
  if (v13) {
    goto LABEL_22;
  }
}

- (void)addNewRemotePlanWithCardData:(id)a3 confirmationCode:(id)a4 isPairing:(BOOL)a5 withCSN:(id)a6 withContext:(id)a7 userConsent:(int64_t)a8 completion:(id)a9
{
  cntrl = self->fCellularPlanControllerPhone.__cntrl_;
  if (cntrl)
  {
    int v16 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v16)
    {
      ptr = self->fCellularPlanControllerPhone.__ptr_;
      if (ptr)
      {
        if (a3)
        {
          if (a7)
          {
            id v18 = [a7 slotID];
            if (v18 == (id)2) {
              int v19 = 2;
            }
            else {
              int v19 = v18 == (id)1;
            }
          }
          else
          {
            int v19 = 1;
          }
          int64_t v22 = *(NSObject **)self->fLogger.__ptr_.__value_;
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)std::string buf = 136315394;
            __int16 v29 = "-[CTCellularPlanServer addNewRemotePlanWithCardData:confirmationCode:isPairing:withCSN:withContext:use"
                  "rConsent:completion:]";
            __int16 v30 = 2080;
            uint64_t v31 = subscriber::asString();
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#I %s, %s", buf, 0x16u);
            int64_t v22 = *(NSObject **)self->fLogger.__ptr_.__value_;
          }
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)std::string buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#I isRemoteCellularPlanSupported", buf, 2u);
          }
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3321888768;
          v23[2] = sub_100EFA774;
          uint64_t v23[3] = &unk_101A6B5F0;
          v23[4] = self;
          v23[8] = ptr;
          BOOL v24 = v16;
          atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
          int v26 = v19;
          BOOL v27 = a5;
          v23[5] = a3;
          v23[6] = a4;
          int64_t v25 = a8;
          v23[7] = a9;
          (*(void (**)(CellularPlanControllerInterface *, void *))(*(void *)ptr + 160))(ptr, v23);
          if (v24) {
            sub_10004D2C8(v24);
          }
        }
        else
        {
          int v21 = *(NSObject **)self->fLogger.__ptr_.__value_;
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)std::string buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#E missing card data", buf, 2u);
          }
          (*((void (**)(id, id))a9 + 2))(a9, +[CTCellularPlanError errorForCode:6 withDescription:@"missing card data"]);
        }
LABEL_13:
        sub_10004D2C8(v16);
        return;
      }
    }
  }
  else
  {
    int v16 = 0;
  }
  unsigned int v20 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::string buf = 136315138;
    __int16 v29 = "-[CTCellularPlanServer addNewRemotePlanWithCardData:confirmationCode:isPairing:withCSN:withContext:userConsent:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#E %s: No controller", buf, 0xCu);
  }
  (*((void (**)(id, id))a9 + 2))(a9, +[CTCellularPlanError errorForCode:4]);
  if (v16) {
    goto LABEL_13;
  }
}

- (void)addNewRemotePlanWithAddress:(id)a3 matchingId:(id)a4 oid:(id)a5 confirmationCode:(id)a6 isPairing:(BOOL)a7 withCSN:(id)a8 withContext:(id)a9 userConsent:(int64_t)a10 completion:(id)a11
{
  cntrl = self->fCellularPlanControllerPhone.__cntrl_;
  if (cntrl)
  {
    id v18 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v18)
    {
      ptr = self->fCellularPlanControllerPhone.__ptr_;
      if (ptr)
      {
        if (a3)
        {
          if (a9)
          {
            id v20 = [a9 slotID];
            int v21 = v20 == (id)1;
            if (v20 == (id)2) {
              int v21 = 2;
            }
          }
          else
          {
            int v21 = 1;
          }
          int v25 = v21;
          BOOL v24 = *(NSObject **)self->fLogger.__ptr_.__value_;
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)std::string buf = 136315394;
            uint64_t v32 = "-[CTCellularPlanServer addNewRemotePlanWithAddress:matchingId:oid:confirmationCode:isPairing:withCSN:w"
                  "ithContext:userConsent:completion:]";
            __int16 v33 = 2080;
            uint64_t v34 = subscriber::asString();
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "#I %s, %s", buf, 0x16u);
          }
          v26[0] = _NSConcreteStackBlock;
          v26[1] = 3321888768;
          v26[2] = sub_100EFACE0;
          v26[3] = &unk_101A6B628;
          v26[4] = self;
          v26[10] = ptr;
          BOOL v27 = v18;
          atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
          int v29 = v25;
          BOOL v30 = a7;
          v26[5] = a3;
          v26[6] = a4;
          v26[7] = a5;
          v26[8] = a6;
          int64_t v28 = a10;
          v26[9] = a11;
          (*(void (**)(CellularPlanControllerInterface *, void *))(*(void *)ptr + 160))(ptr, v26);
          if (v27) {
            sub_10004D2C8(v27);
          }
        }
        else
        {
          int v23 = *(NSObject **)self->fLogger.__ptr_.__value_;
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)std::string buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "#E missing address", buf, 2u);
          }
          (*((void (**)(id, id))a11 + 2))(a11, +[CTCellularPlanError errorForCode:6 withDescription:@"missing address"]);
        }
LABEL_13:
        sub_10004D2C8(v18);
        return;
      }
    }
  }
  else
  {
    id v18 = 0;
  }
  int64_t v22 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::string buf = 136315138;
    uint64_t v32 = "-[CTCellularPlanServer addNewRemotePlanWithAddress:matchingId:oid:confirmationCode:isPairing:withCSN:withConte"
          "xt:userConsent:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#E %s: No controller", buf, 0xCu);
  }
  (*((void (**)(id, id))a11 + 2))(a11, +[CTCellularPlanError errorForCode:4]);
  if (v18) {
    goto LABEL_13;
  }
}

- (void)installPendingRemotePlan:(id)a3 completion:(id)a4
{
  cntrl = self->fCellularPlanControllerPhone.__cntrl_;
  if (cntrl)
  {
    uint64_t v8 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v8)
    {
      ptr = self->fCellularPlanControllerPhone.__ptr_;
      if (ptr)
      {
        if (a3 && [a3 iccid])
        {
          id v10 = *(NSObject **)self->fLogger.__ptr_.__value_;
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)std::string buf = 136315138;
            int v16 = (const char *)objc_msgSend(objc_msgSend(a3, "iccid"), "UTF8String");
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#I installPendingRemotePlan: %s", buf, 0xCu);
          }
          sub_100058DB0(__p, (char *)objc_msgSend(objc_msgSend(a3, "iccid"), "UTF8String"));
          v12[0] = _NSConcreteStackBlock;
          v12[1] = 3221225472;
          v12[2] = sub_100EFB1FC;
          v12[3] = &unk_101A6B448;
          v12[4] = self;
          v12[5] = a4;
          (*(void (**)(CellularPlanControllerInterface *, void **, void *))(*(void *)ptr + 184))(ptr, __p, v12);
          if (v14 < 0) {
            operator delete(__p[0]);
          }
        }
        else
        {
          (*((void (**)(id, id))a4 + 2))(a4, +[CTCellularPlanError errorForCode:6 withDescription:@"missing plan or profile id"]);
        }
LABEL_16:
        sub_10004D2C8(v8);
        return;
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v11 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::string buf = 136315138;
    int v16 = "-[CTCellularPlanServer installPendingRemotePlan:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#E %s: No controller", buf, 0xCu);
  }
  (*((void (**)(id, id))a4 + 2))(a4, +[CTCellularPlanError errorForCode:4]);
  if (v8) {
    goto LABEL_16;
  }
}

- (void)remotePlanItemsWithUpdateFetch:(BOOL)a3 completion:(id)a4
{
  cntrl = self->fCellularPlanControllerPhone.__cntrl_;
  if (cntrl)
  {
    BOOL v7 = a3;
    uint64_t v8 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v8)
    {
      ptr = self->fCellularPlanControllerPhone.__ptr_;
      if (ptr)
      {
        id v10 = *(NSObject **)self->fLogger.__ptr_.__value_;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)std::string buf = 136315394;
          char v14 = "-[CTCellularPlanServer remotePlanItemsWithUpdateFetch:completion:]";
          __int16 v15 = 1024;
          BOOL v16 = v7;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#I %s, shouldFetch %d", buf, 0x12u);
        }
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_100EFB454;
        v12[3] = &unk_101A6B660;
        v12[4] = self;
        v12[5] = a4;
        (*(void (**)(CellularPlanControllerInterface *, BOOL, void *))(*(void *)ptr + 176))(ptr, v7, v12);
LABEL_11:
        sub_10004D2C8(v8);
        return;
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v11 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::string buf = 136315138;
    char v14 = "-[CTCellularPlanServer remotePlanItemsWithUpdateFetch:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#E %s: No controller", buf, 0xCu);
  }
  (*((void (**)(id, void, id))a4 + 2))(a4, 0, +[CTCellularPlanError errorForCode:4]);
  if (v8) {
    goto LABEL_11;
  }
}

- (void)didSelectRemotePlanItem:(id)a3 completion:(id)a4
{
  cntrl = self->fCellularPlanControllerPhone.__cntrl_;
  if (cntrl)
  {
    uint64_t v8 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v8)
    {
      ptr = self->fCellularPlanControllerPhone.__ptr_;
      if (ptr)
      {
        if (a3 && objc_msgSend(objc_msgSend(a3, "plan"), "iccid"))
        {
          id v10 = *(NSObject **)self->fLogger.__ptr_.__value_;
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)std::string buf = 136315138;
            BOOL v16 = "-[CTCellularPlanServer didSelectRemotePlanItem:completion:]";
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#I %s", buf, 0xCu);
          }
          id v11 = objc_msgSend(objc_msgSend(a3, "plan"), "iccid");
          char v14 = v11;
          if (v11) {
            CFRetain(v11);
          }
          v13[0] = _NSConcreteStackBlock;
          v13[1] = 3221225472;
          v13[2] = sub_100EFB7D8;
          v13[3] = &unk_101A6B518;
          void v13[4] = self;
          v13[5] = a4;
          (*(void (**)(CellularPlanControllerInterface *, const void **, void *))(*(void *)ptr + 104))(ptr, &v14, v13);
          sub_1000558F4(&v14);
        }
        else
        {
          (*((void (**)(id, void, id))a4 + 2))(a4, 0, +[CTCellularPlanError errorForCode:6 withDescription:@"missing plan or profile id"]);
        }
LABEL_17:
        sub_10004D2C8(v8);
        return;
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  unsigned int v12 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::string buf = 136315138;
    BOOL v16 = "-[CTCellularPlanServer didSelectRemotePlanItem:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#E %s: No controller", buf, 0xCu);
  }
  (*((void (**)(id, void, id))a4 + 2))(a4, 0, +[CTCellularPlanError errorForCode:4]);
  if (v8) {
    goto LABEL_17;
  }
}

- (void)didDeleteRemotePlanItem:(id)a3 completion:(id)a4
{
  cntrl = self->fCellularPlanControllerPhone.__cntrl_;
  if (cntrl)
  {
    uint64_t v8 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v8)
    {
      ptr = self->fCellularPlanControllerPhone.__ptr_;
      if (ptr)
      {
        if (a3 && objc_msgSend(objc_msgSend(a3, "plan"), "iccid"))
        {
          id v10 = *(NSObject **)self->fLogger.__ptr_.__value_;
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)std::string buf = 136315138;
            BOOL v16 = "-[CTCellularPlanServer didDeleteRemotePlanItem:completion:]";
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#I %s", buf, 0xCu);
          }
          id v11 = objc_msgSend(objc_msgSend(a3, "plan"), "iccid");
          char v14 = v11;
          if (v11) {
            CFRetain(v11);
          }
          v13[0] = _NSConcreteStackBlock;
          v13[1] = 3221225472;
          v13[2] = sub_100EFBAB4;
          v13[3] = &unk_101A6B518;
          void v13[4] = self;
          v13[5] = a4;
          (*(void (**)(CellularPlanControllerInterface *, const void **, void *))(*(void *)ptr + 112))(ptr, &v14, v13);
          sub_1000558F4(&v14);
        }
        else
        {
          (*((void (**)(id, void, id))a4 + 2))(a4, 0, +[CTCellularPlanError errorForCode:6 withDescription:@"missing plan or profile id"]);
        }
LABEL_17:
        sub_10004D2C8(v8);
        return;
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  unsigned int v12 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::string buf = 136315138;
    BOOL v16 = "-[CTCellularPlanServer didDeleteRemotePlanItem:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#E %s: No controller", buf, 0xCu);
  }
  (*((void (**)(id, void, id))a4 + 2))(a4, 0, +[CTCellularPlanError errorForCode:4]);
  if (v8) {
    goto LABEL_17;
  }
}

- (void)didPurchaseRemotePlanForEid:(id)a3 imei:(id)a4 meid:(id)a5 iccid:(id)a6 alternateSmdpFqdn:(id)a7 completion:(id)a8
{
  __int16 v15 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::string buf = 136315394;
    int64_t v28 = (const char *)[a3 UTF8String];
    __int16 v29 = 2080;
    id v30 = [a6 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#I handle remote plan purchase for eid: %s, iccid:%s", buf, 0x16u);
  }
  cntrl = self->fCellularPlanControllerPhone.__cntrl_;
  if (cntrl)
  {
    __int16 v17 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v17)
    {
      ptr = self->fCellularPlanControllerPhone.__ptr_;
      if (ptr)
      {
        int v19 = *(NSObject **)self->fLogger.__ptr_.__value_;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)std::string buf = 136315138;
          int64_t v28 = "-[CTCellularPlanServer didPurchaseRemotePlanForEid:imei:meid:iccid:alternateSmdpFqdn:completion:]";
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#I %s", buf, 0xCu);
        }
        id v26 = a3;
        if (a3) {
          CFRetain(a3);
        }
        id v25 = a4;
        if (a4) {
          CFRetain(a4);
        }
        id v24 = a5;
        if (a5) {
          CFRetain(a5);
        }
        id v23 = a6;
        if (a6) {
          CFRetain(a6);
        }
        id v22 = a7;
        if (a7) {
          CFRetain(a7);
        }
        (*(void (**)(CellularPlanControllerInterface *, id *, id *, id *, id *, id *))(*(void *)ptr + 128))(ptr, &v26, &v25, &v24, &v23, &v22);
        sub_1000558F4((const void **)&v22);
        sub_1000558F4((const void **)&v23);
        sub_1000558F4((const void **)&v24);
        sub_1000558F4((const void **)&v25);
        sub_1000558F4((const void **)&v26);
        uint64_t v20 = 1;
        goto LABEL_23;
      }
    }
  }
  else
  {
    __int16 v17 = 0;
  }
  int v21 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::string buf = 136315138;
    int64_t v28 = "-[CTCellularPlanServer didPurchaseRemotePlanForEid:imei:meid:iccid:alternateSmdpFqdn:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#E %s: No controller", buf, 0xCu);
  }
  uint64_t v20 = 0;
LABEL_23:
  (*((void (**)(id, uint64_t))a8 + 2))(a8, v20);
  if (v17) {
    sub_10004D2C8(v17);
  }
}

- (void)didCancelRemotePlan
{
  cntrl = self->fCellularPlanControllerPhone.__cntrl_;
  if (cntrl)
  {
    BOOL v4 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v4)
    {
      ptr = self->fCellularPlanControllerPhone.__ptr_;
      if (ptr)
      {
        v6 = *(NSObject **)self->fLogger.__ptr_.__value_;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          int v8 = 136315138;
          id v9 = "-[CTCellularPlanServer didCancelRemotePlan]";
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I %s", (uint8_t *)&v8, 0xCu);
        }
        (*(void (**)(CellularPlanControllerInterface *))(*(void *)ptr + 136))(ptr);
LABEL_11:
        sub_10004D2C8(v4);
        return;
      }
    }
  }
  else
  {
    BOOL v4 = 0;
  }
  BOOL v7 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    id v9 = "-[CTCellularPlanServer didCancelRemotePlan]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#E %s: No controller", (uint8_t *)&v8, 0xCu);
  }
  if (v4) {
    goto LABEL_11;
  }
}

- (void)pendingReleaseRemotePlan
{
  cntrl = self->fCellularPlanControllerPhone.__cntrl_;
  if (cntrl)
  {
    BOOL v4 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v4)
    {
      ptr = self->fCellularPlanControllerPhone.__ptr_;
      if (ptr)
      {
        v6 = *(NSObject **)self->fLogger.__ptr_.__value_;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          int v8 = 136315138;
          id v9 = "-[CTCellularPlanServer pendingReleaseRemotePlan]";
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I %s", (uint8_t *)&v8, 0xCu);
        }
        (*(void (**)(CellularPlanControllerInterface *))(*(void *)ptr + 144))(ptr);
LABEL_11:
        sub_10004D2C8(v4);
        return;
      }
    }
  }
  else
  {
    BOOL v4 = 0;
  }
  BOOL v7 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    id v9 = "-[CTCellularPlanServer pendingReleaseRemotePlan]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#E %s: No controller", (uint8_t *)&v8, 0xCu);
  }
  if (v4) {
    goto LABEL_11;
  }
}

- (void)userSignupInitiatedOrFailed
{
  cntrl = self->fCellularPlanControllerPhone.__cntrl_;
  if (cntrl)
  {
    BOOL v4 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v4)
    {
      ptr = self->fCellularPlanControllerPhone.__ptr_;
      if (ptr)
      {
        v6 = *(NSObject **)self->fLogger.__ptr_.__value_;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          int v8 = 136315138;
          id v9 = "-[CTCellularPlanServer userSignupInitiatedOrFailed]";
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I %s", (uint8_t *)&v8, 0xCu);
        }
        (*(void (**)(CellularPlanControllerInterface *))(*(void *)ptr + 152))(ptr);
LABEL_11:
        sub_10004D2C8(v4);
        return;
      }
    }
  }
  else
  {
    BOOL v4 = 0;
  }
  BOOL v7 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    id v9 = "-[CTCellularPlanServer userSignupInitiatedOrFailed]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#E %s: No controller", (uint8_t *)&v8, 0xCu);
  }
  if (v4) {
    goto LABEL_11;
  }
}

- (void)eraseAllRemotePlansWithCompletion:(id)a3
{
  cntrl = self->fCellularPlanControllerPhone.__cntrl_;
  if (cntrl)
  {
    v6 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v6)
    {
      ptr = self->fCellularPlanControllerPhone.__ptr_;
      if (ptr)
      {
        int v8 = *(NSObject **)self->fLogger.__ptr_.__value_;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)std::string buf = 136315138;
          unsigned int v12 = "-[CTCellularPlanServer eraseAllRemotePlansWithCompletion:]";
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I %s", buf, 0xCu);
        }
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_100EFC450;
        v10[3] = &unk_101A6B518;
        void v10[4] = self;
        void v10[5] = a3;
        (*(void (**)(CellularPlanControllerInterface *, void *))(*(void *)ptr + 120))(ptr, v10);
LABEL_11:
        sub_10004D2C8(v6);
        return;
      }
    }
  }
  else
  {
    v6 = 0;
  }
  id v9 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::string buf = 136315138;
    unsigned int v12 = "-[CTCellularPlanServer eraseAllRemotePlansWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#E %s: No controller", buf, 0xCu);
  }
  (*((void (**)(id, void, id))a3 + 2))(a3, 0, +[CTCellularPlanError errorForCode:4]);
  if (v6) {
    goto LABEL_11;
  }
}

- (void)remoteUserDidProvideResponse:(BOOL)a3 confirmationCode:(id)a4 plan:(id)a5 completion:(id)a6
{
  cntrl = self->fCellularPlanControllerPhone.__cntrl_;
  if (!cntrl)
  {
    unsigned int v12 = 0;
    goto LABEL_12;
  }
  BOOL v11 = a3;
  unsigned int v12 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
  if (!v12 || (ptr = self->fCellularPlanControllerPhone.__ptr_) == 0)
  {
LABEL_12:
    (*((void (**)(id, void, id))a6 + 2))(a6, 0, +[CTCellularPlanError errorForCode:4]);
    if (!v12) {
      return;
    }
    goto LABEL_13;
  }
  char v14 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::string buf = 136315138;
    uint64_t v20 = "-[CTCellularPlanServer remoteUserDidProvideResponse:confirmationCode:plan:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#I %s", buf, 0xCu);
  }
  id v15 = objc_msgSend(objc_msgSend(a5, "plan"), "iccid");
  id v18 = v15;
  if (v15) {
    CFRetain(v15);
  }
  id v17 = a4;
  if (a4) {
    CFRetain(a4);
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100EFC6DC;
  v16[3] = &unk_101A6B518;
  v16[4] = self;
  v16[5] = a6;
  (*(void (**)(CellularPlanControllerInterface *, const void **, BOOL, id *, void *))(*(void *)ptr + 256))(ptr, &v18, v11, &v17, v16);
  sub_1000558F4((const void **)&v17);
  sub_1000558F4(&v18);
LABEL_13:
  sub_10004D2C8(v12);
}

- (void)getPredefinedLabels:(id)a3
{
  unsigned __int8 v5 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[CTCellularPlanServer getPredefinedLabels:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s", (uint8_t *)&buf, 0xCu);
  }
  id v6 = objc_alloc_init((Class)NSMutableArray);
  ServiceMap = (std::mutex *)Registry::getServiceMap(v7, self->fRegistry.__ptr_);
  id v9 = ServiceMap;
  if (v10 < 0)
  {
    BOOL v11 = (unsigned __int8 *)(v10 & 0x7FFFFFFFFFFFFFFFLL);
    uint64_t v12 = 5381;
    do
    {
      uint64_t v10 = v12;
      unsigned int v13 = *v11++;
      uint64_t v12 = (33 * v12) ^ v13;
    }
    while (v13);
  }
  std::mutex::lock(ServiceMap);
  *(void *)&long long buf = v10;
  char v14 = sub_10004D37C(&v9[1].__m_.__sig, (unint64_t *)&buf);
  if (v14)
  {
    uint64_t v16 = v14[3];
    id v15 = (std::__shared_weak_count *)v14[4];
    if (v15)
    {
      atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
      std::mutex::unlock(v9);
      atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
      sub_10004D2C8(v15);
      char v17 = 0;
      if (!v16) {
        goto LABEL_15;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v16 = 0;
  }
  std::mutex::unlock(v9);
  id v15 = 0;
  char v17 = 1;
  if (!v16) {
    goto LABEL_15;
  }
LABEL_12:
  long long buf = 0uLL;
  uint64_t v22 = 0;
  (*(void (**)(uint64_t, long long *))(*(void *)v16 + 160))(v16, &buf);
  int v19 = (void *)*((void *)&buf + 1);
  for (i = (void *)buf; i != v19; i += 2)
    objc_msgSend(v6, "addObject:", objc_msgSend(objc_alloc((Class)CTUserLabel), "initWithKey:label:labelId:", *i, i[1], 0));
  p_long long buf = (void **)&buf;
  sub_100CC28AC(&p_buf);
LABEL_15:
  if ((v17 & 1) == 0) {
    sub_10004D2C8(v15);
  }
  if ([v6 count]) {
    (*((void (**)(id, id, void))a3 + 2))(a3, v6, 0);
  }
  else {
    (*((void (**)(id, void, id))a3 + 2))(a3, 0, +[CTCellularPlanError errorForCode:7]);
  }
}

- (void)getSubscriptionContextUUIDforPlan:(id)a3 completion:(id)a4
{
  cntrl = self->fCellularPlanControlleriPad.__cntrl_;
  if (!cntrl)
  {
    int v8 = 0;
    goto LABEL_8;
  }
  int v8 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
  if (!v8 || (ptr = self->fCellularPlanControlleriPad.__ptr_) == 0 || ![a3 length])
  {
LABEL_8:
    (*((void (**)(id, void, id))a4 + 2))(a4, 0, [(CTCellularPlanServer *)self _getErrorFromCellularPlanError:4]);
    if (!v8) {
      return;
    }
    goto LABEL_9;
  }
  sub_100058DB0(__p, (char *)[a3 UTF8String]);
  (**(void (***)(const void **__return_ptr, CellularPlanController *, void **))ptr)(&v12, ptr, __p);
  (*((void (**)(id, const void *, void))a4 + 2))(a4, v12, 0);
  sub_1000558F4(&v12);
  if (v11 < 0) {
    operator delete(__p[0]);
  }
LABEL_9:
  sub_10004D2C8(v8);
}

- (void)getShortLabelsForLabels:(id)a3 completion:(id)a4
{
  id v6 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[CTCellularPlanServer getShortLabelsForLabels:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I %s", buf, 0xCu);
  }
  id aBlock = a4;
  memset(v48, 0, 24);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v8 = [a3 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v45;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v45 != v9) {
          objc_enumerationMutation(a3);
        }
        char v11 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        uint64_t v12 = *(NSObject **)self->fLogger.__ptr_.__value_;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          id v13 = objc_msgSend(objc_msgSend(v11, "label"), "UTF8String");
          id v14 = objc_msgSend(objc_msgSend(v11, "key"), "UTF8String");
          *(_DWORD *)long long buf = 136315650;
          *(void *)&uint8_t buf[4] = "-[CTCellularPlanServer getShortLabelsForLabels:completion:]";
          *(_WORD *)&unsigned char buf[12] = 2080;
          *(void *)&buf[14] = v13;
          *(_WORD *)&buf[22] = 2080;
          *(void *)&uint8_t buf[24] = v14;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#I %s: [%s][%s]", buf, 0x20u);
        }
        id v15 = (char *)objc_msgSend(objc_msgSend(v11, "label"), "UTF8String");
        uint64_t v16 = (char *)objc_msgSend(objc_msgSend(v11, "key"), "UTF8String");
        uint64_t v17 = *((void *)&v48[0] + 1);
        if (*((void *)&v48[0] + 1) >= *(void *)&v48[1])
        {
          unint64_t v19 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&v48[0] + 1) - *(void *)&v48[0]) >> 4);
          unint64_t v20 = v19 + 1;
          if (v19 + 1 > 0x555555555555555) {
            sub_10006A748();
          }
          if (0x5555555555555556 * ((uint64_t)(*(void *)&v48[1] - *(void *)&v48[0]) >> 4) > v20) {
            unint64_t v20 = 0x5555555555555556 * ((uint64_t)(*(void *)&v48[1] - *(void *)&v48[0]) >> 4);
          }
          if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)&v48[1] - *(void *)&v48[0]) >> 4) >= 0x2AAAAAAAAAAAAAALL) {
            unint64_t v21 = 0x555555555555555;
          }
          else {
            unint64_t v21 = v20;
          }
          v51 = &v48[1];
          if (v21) {
            uint64_t v22 = (char *)sub_10019F624((uint64_t)&v48[1], v21);
          }
          else {
            uint64_t v22 = 0;
          }
          *(void *)long long buf = v22;
          *(void *)&buf[8] = &v22[48 * v19];
          *(void *)&buf[16] = *(void *)&buf[8];
          *(void *)&uint8_t buf[24] = &v22[48 * v21];
          sub_100C31D2C(*(void **)&buf[8], v15, v16);
          uint64_t v23 = 0;
          uint64_t v24 = *(void *)&buf[8];
          *(void *)&buf[16] += 48;
          for (long long j = v48[0];
                *((void *)&j + 1) + v23 != (void)j;
                sub_10023C0CC((char *)(v23 + v24), (long long *)(v23 + *((void *)&j + 1))))
          {
            v23 -= 48;
          }
          uint64_t v26 = *(void *)&v48[1];
          uint64_t v43 = *(void *)&buf[16];
          long long v27 = *(_OWORD *)&buf[16];
          long long v28 = v48[0];
          *(void *)&v48[0] = v24 + v23;
          *(_OWORD *)&buf[8] = v28;
          *(_OWORD *)((char *)v48 + 8) = v27;
          *(void *)&uint8_t buf[24] = v26;
          *(void *)long long buf = v28;
          sub_100296F50((uint64_t)buf);
          uint64_t v18 = v43;
        }
        else
        {
          sub_100C31D2C(*((void **)&v48[0] + 1), v15, v16);
          uint64_t v18 = v17 + 48;
        }
        *((void *)&v48[0] + 1) = v18;
      }
      id v8 = [a3 countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v8);
  }
  ServiceMap = (std::mutex *)Registry::getServiceMap(v7, self->fRegistry.__ptr_);
  id v30 = ServiceMap;
  if (v31 < 0)
  {
    uint64_t v32 = (unsigned __int8 *)(v31 & 0x7FFFFFFFFFFFFFFFLL);
    uint64_t v33 = 5381;
    do
    {
      uint64_t v31 = v33;
      unsigned int v34 = *v32++;
      uint64_t v33 = (33 * v33) ^ v34;
    }
    while (v34);
  }
  std::mutex::lock(ServiceMap);
  *(void *)long long buf = v31;
  id v35 = sub_10004D37C(&v30[1].__m_.__sig, (unint64_t *)buf);
  if (v35)
  {
    uint64_t v37 = v35[3];
    id v36 = (std::__shared_weak_count *)v35[4];
    if (v36)
    {
      atomic_fetch_add_explicit(&v36->__shared_owners_, 1uLL, memory_order_relaxed);
      std::mutex::unlock(v30);
      atomic_fetch_add_explicit(&v36->__shared_owners_, 1uLL, memory_order_relaxed);
      sub_10004D2C8(v36);
      char v38 = 0;
      goto LABEL_35;
    }
  }
  else
  {
    uint64_t v37 = 0;
  }
  std::mutex::unlock(v30);
  id v36 = 0;
  char v38 = 1;
LABEL_35:
  if (v37)
  {
    if (aBlock) {
      id v39 = _Block_copy(aBlock);
    }
    else {
      id v39 = 0;
    }
    *(void *)long long buf = off_101A6BDD8;
    *(void *)&buf[8] = self;
    *(void *)&buf[16] = v39;
    *(void *)&uint8_t buf[24] = buf;
    (*(void (**)(uint64_t, _OWORD *, unsigned char *))(*(void *)v37 + 320))(v37, v48, buf);
    sub_100C31D80(buf);
  }
  else
  {
    (*((void (**)(id, void, NSError *))aBlock + 2))(aBlock, 0, +[NSError errorWithDomain:NSPOSIXErrorDomain code:35 userInfo:0]);
  }
  if ((v38 & 1) == 0) {
    sub_10004D2C8(v36);
  }
  *(void *)long long buf = v48;
  sub_100155410((void ***)buf);
}

- (void)fetchRemoteProfiles:(id)a3
{
  cntrl = self->fDebugCellularPlanController.__cntrl_;
  if (cntrl)
  {
    id v6 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v6)
    {
      ptr = self->fDebugCellularPlanController.__ptr_;
      if (ptr)
      {
        id v8 = *(NSObject **)self->fLogger.__ptr_.__value_;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 136315138;
          id v14 = "-[CTCellularPlanServer fetchRemoteProfiles:]";
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I %s", buf, 0xCu);
        }
        if (a3)
        {
          id v12 = a3;
          CFRetain(a3);
          uint64_t v9 = (const void **)&v12;
          (*(void (**)(CellularPlanControllerDebugInterface *, id *))(*(void *)ptr + 16))(ptr, &v12);
        }
        else
        {
          uint64_t v11 = 0;
          uint64_t v9 = (const void **)&v11;
          (*(void (**)(CellularPlanControllerDebugInterface *, uint64_t *))(*(void *)ptr + 16))(ptr, &v11);
        }
        sub_1000558F4(v9);
LABEL_15:
        sub_10004D2C8(v6);
        return;
      }
    }
  }
  else
  {
    id v6 = 0;
  }
  uint64_t v10 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v14 = "-[CTCellularPlanServer fetchRemoteProfiles:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#E %s: No controller", buf, 0xCu);
  }
  if (v6) {
    goto LABEL_15;
  }
}

- (void)getAutoPlanSelectionWithCompletion:(id)a3
{
  if (sub_10004D710())
  {
    char v7 = 1;
    uint64_t v4 = sub_100365D74();
    sub_100058DB0(__p, "EnablePlanSelection");
    sub_1002260B0(v4, __p, (BOOL *)&v7);
    if (v6 < 0) {
      operator delete(__p[0]);
    }
    (*((void (**)(id, void))a3 + 2))(a3, v7);
  }
}

- (void)setAutoPlanSelection:(BOOL)a3
{
  BOOL v3 = a3;
  if (sub_10004D710())
  {
    unsigned __int8 v5 = *(NSObject **)self->fLogger.__ptr_.__value_;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.__r_.__value_.__l.__data_) = 67109120;
      HIDWORD(buf.__r_.__value_.__r.__words[0]) = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I auto plan selection: %d", (uint8_t *)&buf, 8u);
    }
    char v6 = (uint64_t **)sub_100365D74();
    sub_100058DB0(&buf, "EnablePlanSelection");
    BOOL v7 = v3;
    sub_10044B194(v6, &buf, &v7);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(buf.__r_.__value_.__l.__data_);
    }
  }
}

- (void)getRoamingSignupOverrideWithCompletion:(id)a3
{
  if (sub_10004D710())
  {
    BOOL v7 = 0;
    uint64_t v4 = sub_100365D74();
    sub_100058DB0(__p, "RoamingSignupOverride");
    sub_1002260B0(v4, __p, &v7);
    if (v6 < 0) {
      operator delete(__p[0]);
    }
    (*((void (**)(id, BOOL))a3 + 2))(a3, v7);
  }
}

- (void)setRoamingSignupOverride:(BOOL)a3
{
  BOOL v3 = a3;
  if (sub_10004D710())
  {
    unsigned __int8 v5 = *(NSObject **)self->fLogger.__ptr_.__value_;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.__r_.__value_.__l.__data_) = 67109120;
      HIDWORD(buf.__r_.__value_.__r.__words[0]) = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I roaming signup set: %d", (uint8_t *)&buf, 8u);
    }
    char v6 = (uint64_t **)sub_100365D74();
    sub_100058DB0(&buf, "RoamingSignupOverride");
    BOOL v7 = v3;
    sub_10044B194(v6, &buf, &v7);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(buf.__r_.__value_.__l.__data_);
    }
  }
}

- (void)getSkipEligibilityCheck:(id)a3
{
  if (sub_10004D710())
  {
    BOOL v7 = 0;
    uint64_t v4 = sub_100365D74();
    sub_100058DB0(__p, "CellularPlanSkipEligibilityCheck");
    sub_1002260B0(v4, __p, &v7);
    if (v6 < 0) {
      operator delete(__p[0]);
    }
    (*((void (**)(id, BOOL))a3 + 2))(a3, v7);
  }
}

- (void)setSkipEligibilityCheck:(BOOL)a3
{
  BOOL v3 = a3;
  if (sub_10004D710())
  {
    unsigned __int8 v5 = *(NSObject **)self->fLogger.__ptr_.__value_;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.__r_.__value_.__l.__data_) = 67109120;
      HIDWORD(buf.__r_.__value_.__r.__words[0]) = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I skip eligibility check set: %d", (uint8_t *)&buf, 8u);
    }
    char v6 = (uint64_t **)sub_100365D74();
    sub_100058DB0(&buf, "CellularPlanSkipEligibilityCheck");
    BOOL v7 = v3;
    sub_10044B194(v6, &buf, &v7);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(buf.__r_.__value_.__l.__data_);
    }
  }
}

- (void)selectRemoteProfile:(id)a3
{
  cntrl = self->fCellularPlanControllerPhone.__cntrl_;
  if (!cntrl)
  {
    char v6 = 0;
    goto LABEL_5;
  }
  char v6 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
  if (!v6)
  {
LABEL_5:
    ptr = 0;
    goto LABEL_6;
  }
  ptr = self->fCellularPlanControllerPhone.__ptr_;
LABEL_6:
  id v8 = self->fDebugCellularPlanController.__cntrl_;
  if (v8)
  {
    uint64_t v9 = std::__shared_weak_count::lock((std::__shared_weak_count *)v8);
    if (v9)
    {
      if (self->fDebugCellularPlanController.__ptr_)
      {
        sub_10004D2C8(v9);
        if (ptr)
        {
          uint64_t v10 = *(NSObject **)self->fLogger.__ptr_.__value_;
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)std::string buf = 136315138;
            id v14 = "-[CTCellularPlanServer selectRemoteProfile:]";
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#I %s", buf, 0xCu);
          }
          if (a3)
          {
            id v12 = a3;
            CFRetain(a3);
            (*(void (**)(CellularPlanControllerInterface *, id *, Block_layout *))(*(void *)ptr + 104))(ptr, &v12, &stru_101A6B6A0);
            sub_1000558F4((const void **)&v12);
          }
          goto LABEL_17;
        }
      }
      else
      {
        sub_10004D2C8(v9);
      }
    }
  }
  uint64_t v11 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::string buf = 136315138;
    id v14 = "-[CTCellularPlanServer selectRemoteProfile:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#E %s: No controller", buf, 0xCu);
  }
LABEL_17:
  if (v6) {
    sub_10004D2C8(v6);
  }
}

- (void)deleteRemoteProfile:(id)a3
{
  cntrl = self->fCellularPlanControllerPhone.__cntrl_;
  if (!cntrl)
  {
    char v6 = 0;
    goto LABEL_5;
  }
  char v6 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
  if (!v6)
  {
LABEL_5:
    ptr = 0;
    goto LABEL_6;
  }
  ptr = self->fCellularPlanControllerPhone.__ptr_;
LABEL_6:
  id v8 = self->fDebugCellularPlanController.__cntrl_;
  if (v8)
  {
    uint64_t v9 = std::__shared_weak_count::lock((std::__shared_weak_count *)v8);
    if (v9)
    {
      if (self->fDebugCellularPlanController.__ptr_)
      {
        sub_10004D2C8(v9);
        if (ptr)
        {
          uint64_t v10 = *(NSObject **)self->fLogger.__ptr_.__value_;
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)std::string buf = 136315138;
            id v14 = "-[CTCellularPlanServer deleteRemoteProfile:]";
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#I %s", buf, 0xCu);
          }
          if (a3)
          {
            id v12 = a3;
            CFRetain(a3);
            (*(void (**)(CellularPlanControllerInterface *, id *, Block_layout *))(*(void *)ptr + 112))(ptr, &v12, &stru_101A6B6C0);
            sub_1000558F4((const void **)&v12);
          }
          goto LABEL_17;
        }
      }
      else
      {
        sub_10004D2C8(v9);
      }
    }
  }
  uint64_t v11 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::string buf = 136315138;
    id v14 = "-[CTCellularPlanServer deleteRemoteProfile:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#E %s: No controller", buf, 0xCu);
  }
LABEL_17:
  if (v6) {
    sub_10004D2C8(v6);
  }
}

- (void)deleteAllRemoteProfiles
{
  cntrl = self->fCellularPlanControllerPhone.__cntrl_;
  if (cntrl)
  {
    uint64_t v4 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v4) {
      ptr = self->fCellularPlanControllerPhone.__ptr_;
    }
    else {
      ptr = 0;
    }
  }
  else
  {
    ptr = 0;
    uint64_t v4 = 0;
  }
  char v6 = self->fDebugCellularPlanController.__cntrl_;
  if (v6)
  {
    BOOL v7 = std::__shared_weak_count::lock((std::__shared_weak_count *)v6);
    if (v7)
    {
      if (self->fDebugCellularPlanController.__ptr_)
      {
        sub_10004D2C8(v7);
        if (ptr)
        {
          id v8 = *(NSObject **)self->fLogger.__ptr_.__value_;
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            int v10 = 136315138;
            uint64_t v11 = "-[CTCellularPlanServer deleteAllRemoteProfiles]";
            _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I %s", (uint8_t *)&v10, 0xCu);
          }
          (*(void (**)(CellularPlanControllerInterface *, Block_layout *))(*(void *)ptr + 120))(ptr, &stru_101A6B6E0);
          goto LABEL_16;
        }
      }
      else
      {
        sub_10004D2C8(v7);
      }
    }
  }
  uint64_t v9 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    uint64_t v11 = "-[CTCellularPlanServer deleteAllRemoteProfiles]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#E %s: No controller", (uint8_t *)&v10, 0xCu);
  }
LABEL_16:
  if (v4) {
    sub_10004D2C8(v4);
  }
}

- (void)getRemoteInfo:(id)a3
{
  cntrl = self->fDebugCellularPlanController.__cntrl_;
  if (cntrl)
  {
    char v6 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v6)
    {
      ptr = self->fDebugCellularPlanController.__ptr_;
      if (ptr)
      {
        id v8 = *(NSObject **)self->fLogger.__ptr_.__value_;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)std::string buf = 136315138;
          id v12 = "-[CTCellularPlanServer getRemoteInfo:]";
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I %s", buf, 0xCu);
        }
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_100EFDF5C;
        v10[3] = &unk_101A6B708;
        void v10[4] = self;
        void v10[5] = a3;
        (*(void (**)(CellularPlanControllerDebugInterface *, void *))(*(void *)ptr + 24))(ptr, v10);
LABEL_11:
        sub_10004D2C8(v6);
        return;
      }
    }
  }
  else
  {
    char v6 = 0;
  }
  uint64_t v9 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::string buf = 136315138;
    id v12 = "-[CTCellularPlanServer getRemoteInfo:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#E %s: No controller", buf, 0xCu);
  }
  (*((void (**)(id, void, id))a3 + 2))(a3, 0, +[CTCellularPlanError errorForCode:4]);
  if (v6) {
    goto LABEL_11;
  }
}

- (void)getPhoneAuthTokenWithMessage:(id)a3 completion:(id)a4
{
  cntrl = self->fDebugCellularPlanController.__cntrl_;
  if (cntrl)
  {
    id v8 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v8)
    {
      ptr = self->fDebugCellularPlanController.__ptr_;
      if (ptr)
      {
        dispatch_queue_t v10 = dispatch_queue_create("reply", 0);
        id v13 = a3;
        if (a3) {
          CFRetain(a3);
        }
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_100EFE158;
        v12[3] = &unk_101A6B730;
        v12[4] = self;
        v12[5] = a4;
        (*(void (**)(CellularPlanControllerDebugInterface *, dispatch_queue_t, id *, void *))(*(void *)ptr + 32))(ptr, v10, &v13, v12);
        sub_100057D78((const void **)&v13);
LABEL_11:
        sub_10004D2C8(v8);
        return;
      }
    }
  }
  else
  {
    id v8 = 0;
  }
  uint64_t v11 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#E no controller", buf, 2u);
  }
  (*((void (**)(id, void, BOOL))a4 + 2))(a4, 0, +[CTCellularPlanError errorForCode:4] != 0);
  if (v8) {
    goto LABEL_11;
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  BOOL v7 = *(NSObject **)self->fLogger.__ptr_.__value_;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I Someone connected", buf, 2u);
  }
  if (self->fXpcListener != a3) {
    __assert_rtn("-[CTCellularPlanServer listener:shouldAcceptNewConnection:]", "CTCellularPlanServer.m", 3275, "listener == fXpcListener && \"listener does not match\"");
  }
  if (qword_101B12F00 != -1) {
    dispatch_once(&qword_101B12F00, &stru_101A6B778);
  }
  [a4 setExportedInterface:qword_101B12EF8];
  id v8 = [[CTCellularPlanClientDelegate alloc] initWithServer:self andConnection:a4];
  [a4 setExportedObject:v8];
  if (qword_101B12F10 != -1) {
    dispatch_once(&qword_101B12F10, &stru_101A6B798);
  }
  [a4 setRemoteObjectInterface:qword_101B12F08];
  [a4 _setQueue:self->fQueue.fObj.fObj];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100EFE3D0;
  v10[3] = &unk_101A6B758;
  void v10[4] = self;
  void v10[5] = a4;
  void v10[6] = v8;
  [a4 setInvalidationHandler:v10];
  [(NSMutableArray *)self->fConnections addObject:a4];
  [a4 resume];
  return 1;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CTCellularPlanServer;
  [(CTCellularPlanServer *)&v3 dealloc];
}

- (const)logger
{
  return self->fLogger.__ptr_.__value_;
}

- (void).cxx_destruct
{
  cntrl = self->fDebugCellularPlanController.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
  uint64_t v4 = self->fCellularPlanControllerPhone.__cntrl_;
  if (v4) {
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v4);
  }
  unsigned __int8 v5 = self->fCellularPlanControlleriPad.__cntrl_;
  if (v5) {
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v5);
  }
  char v6 = self->fRegistry.__cntrl_;
  if (v6) {
    sub_10004D2C8((std::__shared_weak_count *)v6);
  }
  sub_100119D1C((ctu::OsLogLogger **)&self->fLogger, 0);
  fOblong long j = self->fQueue.fObj.fObj;
  if (fObj)
  {
    dispatch_release(fObj);
  }
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  return self;
}

@end