@interface HMHearingAidInternalViewController
- (id)hearingAidEnrolled;
- (id)specifiers;
- (void)faultCheckCancelled:(id)a3;
- (void)faultCheckCompleted:(id)a3;
- (void)faultCheckCompleted:(id)a3 status:(unint64_t)a4;
- (void)fitNoiseCheckCancelled:(id)a3;
- (void)fitNoiseCheckCompleted:(id)a3 status:(unint64_t)a4;
- (void)hearingAidEnrollmentCancelled:(id)a3;
- (void)hearingAidEnrollmentCompleted:(id)a3 status:(unint64_t)a4;
- (void)presentFitTestAnimationViewTester;
- (void)pushEnrollmentViewControllerWithDevice;
- (void)pushEnrollmentViewControllerWithDeviceAndAudiogramSample;
- (void)pushFaultCheckViewController;
- (void)pushFaultCheckViewControllerForFailedResult;
- (void)pushFaultCheckViewControllerForUnknownResult;
- (void)pushFitNoiseCheckViewController;
- (void)pushMediaAssistEnrollmentViewControllerWithDeviceAndAudiogramSample;
- (void)resetOcclusionData;
- (void)setHearingAidEnrolled:(id)a3;
- (void)viewDidLoad;
@end

@implementation HMHearingAidInternalViewController

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)HMHearingAidInternalViewController;
  [(HMHearingAidInternalViewController *)&v2 viewDidLoad];
}

- (id)specifiers
{
  v31[1] = *MEMORY[0x263EF8340];
  v3 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]) userInfo];
  v4 = [v3 objectForKeyedSubscript:@"bt-address"];
  address = self->_address;
  self->_address = v4;

  v6 = [MEMORY[0x263F2B998] sharedInstance];
  v7 = [v6 deviceFromAddressString:self->_address];
  device = self->_device;
  self->_device = v7;

  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  v29 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Hearing Aid Enrollment" target:self set:0 get:0 detail:0 cell:0 edit:0];
  [v9 addObject:v29];
  v28 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Hearing Aid Enrolled" target:self set:sel_setHearingAidEnrolled_ get:sel_hearingAidEnrolled detail:0 cell:6 edit:0];
  [v9 addObject:v28];
  v27 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Enroll with Device" target:self set:0 get:0 detail:0 cell:13 edit:0];
  [v27 setButtonAction:sel_pushEnrollmentViewControllerWithDevice];
  [v9 addObject:v27];
  v26 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Enroll with Device & Audiogram Sample" target:self set:0 get:0 detail:0 cell:13 edit:0];
  [v26 setButtonAction:sel_pushEnrollmentViewControllerWithDeviceAndAudiogramSample];
  [v9 addObject:v26];
  v25 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Enroll Media Assist with Device & Audiogram Sample" target:self set:0 get:0 detail:0 cell:13 edit:0];
  [v25 setButtonAction:sel_pushMediaAssistEnrollmentViewControllerWithDeviceAndAudiogramSample];
  [v9 addObject:v25];
  v24 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Fit Noise Check" target:self set:0 get:0 detail:0 cell:0 edit:0];
  [v9 addObject:v24];
  v10 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Fit Noise Check" target:self set:0 get:0 detail:0 cell:13 edit:0];
  [v10 setButtonAction:sel_pushFitNoiseCheckViewController];
  [v9 addObject:v10];
  v23 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Fault Check" target:self set:0 get:0 detail:0 cell:0 edit:0];
  [v9 addObject:v23];
  v11 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Fault Check" target:self set:0 get:0 detail:0 cell:13 edit:0];
  [v11 setButtonAction:sel_pushFaultCheckViewController];
  [v9 addObject:v11];
  v12 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Fit Test Animation Tester" target:self set:0 get:0 detail:0 cell:13 edit:0];
  [v12 setButtonAction:sel_presentFitTestAnimationViewTester];
  [v9 addObject:v12];
  v13 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Occlusion" target:self set:0 get:0 detail:0 cell:0 edit:0];
  [v9 addObject:v13];
  v14 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Occlusion Test" target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
  v15 = self->_address;
  v30 = @"bt-address";
  v31[0] = v15;
  v16 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
  [v14 setUserInfo:v16];

  [v9 addObject:v14];
  v17 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Reset history" target:self set:0 get:0 detail:0 cell:13 edit:0];
  [v17 setButtonAction:sel_resetOcclusionData];
  [v9 addObject:v17];
  uint64_t v18 = (int)*MEMORY[0x263F5FDB8];
  v19 = *(Class *)((char *)&self->super.super.super.super.super.isa + v18);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v18) = (Class)v9;
  id v20 = v9;

  id v21 = *(id *)((char *)&self->super.super.super.super.super.isa + v18);
  return v21;
}

- (id)hearingAidEnrolled
{
  objc_super v2 = NSNumber;
  uint64_t v3 = [(BluetoothDevice *)self->_device hearingAidEnrolled];
  return (id)[v2 numberWithBool:v3];
}

- (void)setHearingAidEnrolled:(id)a3
{
  uint64_t v4 = [a3 BOOLValue];
  device = self->_device;
  [(BluetoothDevice *)device setHearingAidEnrolled:v4];
}

- (void)pushEnrollmentViewControllerWithDevice
{
  id v5 = (id)[objc_alloc(MEMORY[0x263F47328]) initWithDeviceAddress:self->_address withAudiogramSample:0];
  [v5 setHearingAidEnrollmentDelegate:self];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263F5B8E0]) initWithRootViewController:v5];
  NSLog(&cfstr_HearingAidEnro_2.isa, v3);
  uint64_t v4 = [(HMHearingAidInternalViewController *)self navigationController];
  [v4 presentViewController:v3 animated:1 completion:0];
}

- (void)pushEnrollmentViewControllerWithDeviceAndAudiogramSample
{
  uint64_t v3 = (HMEnrollmentService *)[objc_alloc(MEMORY[0x263F472F0]) initWithDeviceAddress:self->_address];
  hearingModeService = self->_hearingModeService;
  self->_hearingModeService = v3;

  objc_initWeak(&location, self);
  uint64_t v5 = MEMORY[0x263EF8330];
  uint64_t v6 = 3221225472;
  v7 = __94__HMHearingAidInternalViewController_pushEnrollmentViewControllerWithDeviceAndAudiogramSample__block_invoke;
  v8 = &unk_2653642B0;
  objc_copyWeak(&v9, &location);
  [(HMEnrollmentService *)self->_hearingModeService setAudiogramsAvailableHandler:&v5];
  [(HMEnrollmentService *)self->_hearingModeService activate];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __94__HMHearingAidInternalViewController_pushEnrollmentViewControllerWithDeviceAndAudiogramSample__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a2;
  v7 = v6;
  if (a4)
  {
    NSLog(&cfstr_HearingAidCann.isa);
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v23;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v22 + 1) + 8 * v11) description];
          NSLog(&cfstr_HearingAidVali_0.isa, v12);

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v9);
    }
    if (v7 && [v7 count])
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      id v14 = objc_alloc(MEMORY[0x263F47328]);
      uint64_t v15 = WeakRetained[173];
      v16 = [v7 objectAtIndexedSubscript:0];
      v17 = (void *)[v14 initWithDeviceAddress:v15 withAudiogramSample:v16];

      [v17 setHearingAidEnrollmentDelegate:WeakRetained];
      uint64_t v18 = (void *)[objc_alloc(MEMORY[0x263F5B8E0]) initWithRootViewController:v17];
      NSLog(&cfstr_HearingAidEnro_2.isa, v18);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __94__HMHearingAidInternalViewController_pushEnrollmentViewControllerWithDeviceAndAudiogramSample__block_invoke_2;
      block[3] = &unk_265364288;
      block[4] = WeakRetained;
      id v21 = v18;
      id v19 = v18;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
    else
    {
      NSLog(&cfstr_HearingAidNoVa_0.isa);
    }
  }
}

void __94__HMHearingAidInternalViewController_pushEnrollmentViewControllerWithDeviceAndAudiogramSample__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  [v2 presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (void)pushMediaAssistEnrollmentViewControllerWithDeviceAndAudiogramSample
{
  uint64_t v3 = (HMEnrollmentService *)[objc_alloc(MEMORY[0x263F472F0]) initWithDeviceAddress:self->_address];
  hearingModeService = self->_hearingModeService;
  self->_hearingModeService = v3;

  objc_initWeak(&location, self);
  uint64_t v5 = MEMORY[0x263EF8330];
  uint64_t v6 = 3221225472;
  v7 = __105__HMHearingAidInternalViewController_pushMediaAssistEnrollmentViewControllerWithDeviceAndAudiogramSample__block_invoke;
  uint64_t v8 = &unk_2653642B0;
  objc_copyWeak(&v9, &location);
  [(HMEnrollmentService *)self->_hearingModeService setAudiogramsAvailableHandler:&v5];
  [(HMEnrollmentService *)self->_hearingModeService activate];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __105__HMHearingAidInternalViewController_pushMediaAssistEnrollmentViewControllerWithDeviceAndAudiogramSample__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a2;
  v7 = v6;
  if (a4)
  {
    NSLog(&cfstr_MediaAssistCan.isa);
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v23;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v22 + 1) + 8 * v11) description];
          NSLog(&cfstr_MediaAssistVal.isa, v12);

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v9);
    }
    if (v7 && [v7 count])
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      id v14 = objc_alloc_init(_TtC21HearingModeSettingsUI33_HearingAidInternalViewController);
      uint64_t v15 = WeakRetained[173];
      v16 = [v7 objectAtIndexedSubscript:0];
      v17 = [(_HearingAidInternalViewController *)v14 makeMediaAssistViewControllerWithAddress:v15 audiogramSample:v16];

      if (v17)
      {
        uint64_t v18 = (void *)[objc_alloc(MEMORY[0x263F5B8E0]) initWithRootViewController:v17];
        NSLog(&cfstr_MediaAssistPre.isa, v18);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __105__HMHearingAidInternalViewController_pushMediaAssistEnrollmentViewControllerWithDeviceAndAudiogramSample__block_invoke_2;
        block[3] = &unk_265364288;
        block[4] = WeakRetained;
        id v21 = v18;
        id v19 = v18;
        dispatch_async(MEMORY[0x263EF83A0], block);
      }
      else
      {
        NSLog(&cfstr_MediaAssistInv.isa);
      }
    }
    else
    {
      NSLog(&cfstr_MediaAssistNoV.isa);
    }
  }
}

void __105__HMHearingAidInternalViewController_pushMediaAssistEnrollmentViewControllerWithDeviceAndAudiogramSample__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  [v2 presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (void)pushFitNoiseCheckViewController
{
  [MEMORY[0x263F47318] prepareFitTest];
  dispatch_time_t v3 = dispatch_time(0, 3000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__HMHearingAidInternalViewController_pushFitNoiseCheckViewController__block_invoke;
  block[3] = &unk_265364210;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x263EF83A0], block);
}

void __69__HMHearingAidInternalViewController_pushFitNoiseCheckViewController__block_invoke(uint64_t a1)
{
  id v5 = (id)[objc_alloc(MEMORY[0x263F47318]) initWithDeviceAddress:*(void *)(*(void *)(a1 + 32) + 1384)];
  id v2 = (void *)[objc_alloc(MEMORY[0x263F5B8E0]) initWithRootViewController:v5];
  [v2 setModalPresentationStyle:2];
  [v5 setFitNoiseCheckDelegate:*(void *)(a1 + 32)];
  dispatch_time_t v3 = [*(id *)(a1 + 32) navigationController];
  NSLog(&cfstr_FitNoiseCheckP.isa, v5, v3);

  uint64_t v4 = [*(id *)(a1 + 32) navigationController];
  [v4 presentViewController:v2 animated:1 completion:0];
}

- (void)presentFitTestAnimationViewTester
{
  id v5 = objc_alloc_init(HMTestFitNoiseCheckTopViewController);
  dispatch_time_t v3 = (void *)[objc_alloc(MEMORY[0x263F5B8E0]) initWithRootViewController:v5];
  [v3 setModalPresentationStyle:2];
  uint64_t v4 = [(HMHearingAidInternalViewController *)self navigationController];
  [v4 presentViewController:v3 animated:1 completion:0];
}

- (void)pushFaultCheckViewController
{
  id v4 = (id)[objc_alloc(MEMORY[0x263F47308]) initWithDeviceAddress:self->_address];
  [v4 setFaultCheckDelegate:self];
  NSLog(&cfstr_FaultCheckForF.isa, v4);
  dispatch_time_t v3 = [(HMHearingAidInternalViewController *)self navigationController];
  [v3 pushViewController:v4 animated:1];
}

- (void)pushFaultCheckViewControllerForFailedResult
{
  id v4 = (id)[objc_alloc(MEMORY[0x263F47308]) initWithDeviceAddress:self->_address withResult:0];
  [v4 setFaultCheckDelegate:self];
  NSLog(&cfstr_FaultCheckForF.isa, v4);
  dispatch_time_t v3 = [(HMHearingAidInternalViewController *)self navigationController];
  [v3 pushViewController:v4 animated:1];
}

- (void)pushFaultCheckViewControllerForUnknownResult
{
  id v4 = (id)[objc_alloc(MEMORY[0x263F47308]) initWithDeviceAddress:self->_address withResult:1];
  [v4 setFaultCheckDelegate:self];
  NSLog(&cfstr_FaultCheckForU.isa, v4);
  dispatch_time_t v3 = [(HMHearingAidInternalViewController *)self navigationController];
  [v3 pushViewController:v4 animated:1];
}

- (void)hearingAidEnrollmentCompleted:(id)a3 status:(unint64_t)a4
{
  NSLog(&cfstr_HearingAidEnro_3.isa, a2, a4, a3);
  id v5 = [(HMHearingAidInternalViewController *)self navigationController];
  [v5 dismissViewControllerAnimated:1 completion:0];
}

- (void)hearingAidEnrollmentCancelled:(id)a3
{
  NSLog(&cfstr_HearingAidEnro_4.isa, a2, a3);
  id v4 = [(HMHearingAidInternalViewController *)self navigationController];
  [v4 dismissViewControllerAnimated:1 completion:0];
}

- (void)fitNoiseCheckCompleted:(id)a3 status:(unint64_t)a4
{
  NSLog(&cfstr_FitNoiseCheckC.isa, a2, a4, a3);
  id v5 = [(HMHearingAidInternalViewController *)self navigationController];
  [v5 dismissViewControllerAnimated:1 completion:0];
}

- (void)fitNoiseCheckCancelled:(id)a3
{
  NSLog(&cfstr_FitNoiseCheckC_0.isa, a2, a3);
  id v4 = [(HMHearingAidInternalViewController *)self navigationController];
  [v4 dismissViewControllerAnimated:1 completion:0];
}

- (void)faultCheckCompleted:(id)a3 status:(unint64_t)a4
{
  NSLog(&cfstr_FaultCheckComp.isa, a2, a4, a3);
  id v5 = [(HMHearingAidInternalViewController *)self navigationController];
  [v5 dismissViewControllerAnimated:1 completion:0];
}

- (void)faultCheckCompleted:(id)a3
{
  NSLog(&cfstr_FaultCheckComp_0.isa, a2, a3);
  id v4 = [(HMHearingAidInternalViewController *)self navigationController];
  [v4 dismissViewControllerAnimated:1 completion:0];
}

- (void)faultCheckCancelled:(id)a3
{
  NSLog(&cfstr_FaultCheckCanc.isa, a2, a3);
  id v4 = [(HMHearingAidInternalViewController *)self navigationController];
  [v4 dismissViewControllerAnimated:1 completion:0];
}

- (void)resetOcclusionData
{
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v8 setObject:@"reset-occlusion-counts" forKeyedSubscript:@"msg-identifier"];
  [v8 setObject:self->_address forKeyedSubscript:@"bt-address"];
  dispatch_time_t v3 = [MEMORY[0x263F087C8] defaultCenter];
  [v3 postNotificationName:@"com.apple.HearingModeService" object:0 userInfo:v8 options:2];

  id v4 = (void *)MEMORY[0x263F82418];
  id v5 = [NSString stringWithFormat:@"Reset occlusion history!"];
  id v6 = [v4 alertControllerWithTitle:@"Reset Occlusion History" message:v5 preferredStyle:0];

  v7 = [MEMORY[0x263F82400] actionWithTitle:@"Done" style:1 handler:0];
  [v6 addAction:v7];
  [(HMHearingAidInternalViewController *)self presentViewController:v6 animated:1 completion:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hearingModeService, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end