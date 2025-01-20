@interface WGAEltonPhoneBuddyFlowPrincipalClass
+ (BOOL)controllerNeedsToRun;
- (WAGEltonPhoneBuddyFlowFirstViewController)firstController;
- (WGAEltonPhoneBuddyFlowPrincipalClass)init;
- (id)viewController;
- (void)miniFlowStepComplete:(id)a3;
- (void)setFirstController:(id)a3;
@end

@implementation WGAEltonPhoneBuddyFlowPrincipalClass

- (WGAEltonPhoneBuddyFlowPrincipalClass)init
{
  v6.receiver = self;
  v6.super_class = (Class)WGAEltonPhoneBuddyFlowPrincipalClass;
  v2 = [(WGAEltonPhoneBuddyFlowPrincipalClass *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(WAGEltonPhoneBuddyFlowFirstViewController);
    firstController = v2->_firstController;
    v2->_firstController = v3;

    [(WAGEltonPhoneBuddyFlowFirstViewController *)v2->_firstController setMiniFlowDelegate:v2];
  }
  return v2;
}

- (id)viewController
{
  return self->_firstController;
}

- (void)miniFlowStepComplete:(id)a3
{
  id v4 = [(WGAEltonPhoneBuddyFlowPrincipalClass *)self delegate];
  [v4 buddyControllerDone:self];
}

+ (BOOL)controllerNeedsToRun
{
  v2 = +[NRPairedDeviceRegistry sharedInstance];
  uint64_t v3 = +[NRPairedDeviceRegistry activeDeviceSelectorBlock];
  id v4 = [v2 getDevicesMatching:v3];
  v5 = [v4 firstObject];

  id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"0E581E21-36BA-4770-9408-0467585E8495"];
  LOBYTE(v3) = [v5 supportsCapability:v6];

  LOBYTE(v6) = v3 & (BPSDeviceHasCapabilityForString() ^ 1);
  return (char)v6;
}

- (WAGEltonPhoneBuddyFlowFirstViewController)firstController
{
  return self->_firstController;
}

- (void)setFirstController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end