@interface HMHearingTestSDKInstanceConstructor
+ (id)makeStandardViewControllerAudioGramImportFlowProvider:(id)a3;
+ (id)makeStandardViewControllerWithHealthStore:(id)a3 entryPoint:(int64_t)a4;
+ (id)makeTestResultsControllerWithSample:(id)a3 bluetoothAddress:(id)a4;
@end

@implementation HMHearingTestSDKInstanceConstructor

+ (id)makeStandardViewControllerWithHealthStore:(id)a3 entryPoint:(int64_t)a4
{
  id v5 = a3;
  if (dlopen("/System/Library/PrivateFrameworks/HearingTestUI.framework/HearingTestUI", 1))
  {
    Class v6 = NSClassFromString(&cfstr_HearingtestuiH.isa);
    v7 = [NSClassFromString(&cfstr_HearingtestuiH_0.isa) none];
    v8 = [(objc_class *)v6 makeStandardViewControllerWithHealthStore:v5 entryPoint:a4 options:v7 articleProvider:0 importFlowProvider:0];
  }
  else
  {
    v9 = hearing_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[HMHearingTestSDKInstanceConstructor makeStandardViewControllerWithHealthStore:entryPoint:](v9, v10, v11, v12, v13, v14, v15, v16);
    }

    v8 = 0;
  }

  return v8;
}

+ (id)makeStandardViewControllerAudioGramImportFlowProvider:(id)a3
{
  id v3 = a3;
  if (dlopen("/System/Library/PrivateFrameworks/HearingTestUI.framework/HearingTestUI", 1))
  {
    Class v4 = NSClassFromString(&cfstr_HearingtestuiH.isa);
    id v5 = [NSClassFromString(&cfstr_HearingtestuiH_0.isa) showAudiogramImport];
    id v6 = objc_alloc_init(MEMORY[0x263F0A410]);
    v7 = [(objc_class *)v4 makeStandardViewControllerWithHealthStore:v6 entryPoint:2 options:v5 articleProvider:0 importFlowProvider:v3];
  }
  else
  {
    v8 = hearing_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[HMHearingTestSDKInstanceConstructor makeStandardViewControllerWithHealthStore:entryPoint:](v8, v9, v10, v11, v12, v13, v14, v15);
    }

    v7 = 0;
  }

  return v7;
}

+ (id)makeTestResultsControllerWithSample:(id)a3 bluetoothAddress:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (dlopen("/System/Library/PrivateFrameworks/HearingTestUI.framework/HearingTestUI", 1))
  {
    id v7 = objc_alloc(NSClassFromString(&cfstr_HearingtestuiH_1.isa));
    id v8 = objc_alloc_init(MEMORY[0x263F0A410]);
    uint64_t v9 = [MEMORY[0x263F82438] sharedApplication];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __92__HMHearingTestSDKInstanceConstructor_makeTestResultsControllerWithSample_bluetoothAddress___block_invoke;
    v20[3] = &unk_265364260;
    v21 = v6;
    uint64_t v10 = (void *)[v7 initWithAudiogram:v5 healthStore:v8 isHearingAssistAvailable:1 application:v9 deviceBluetoothUUID:v20];

    uint64_t v11 = v21;
  }
  else
  {
    uint64_t v11 = hearing_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[HMHearingTestSDKInstanceConstructor makeTestResultsControllerWithSample:bluetoothAddress:](v11, v12, v13, v14, v15, v16, v17, v18);
    }
    uint64_t v10 = 0;
  }

  return v10;
}

id __92__HMHearingTestSDKInstanceConstructor_makeTestResultsControllerWithSample_bluetoothAddress___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (void)makeStandardViewControllerWithHealthStore:(uint64_t)a3 entryPoint:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)makeTestResultsControllerWithSample:(uint64_t)a3 bluetoothAddress:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end