@interface WFRecordAudioAction
+ (BOOL)outputIsExemptFromTaintTrackingInheritance;
+ (id)datedFilenameForFormat:(int64_t)a3;
+ (id)fileTypeForFormat:(int64_t)a3;
+ (id)userInterfaceProtocol;
+ (id)userInterfaceXPCInterface;
- (BOOL)startImmediately;
- (double)recordingDuration;
- (id)contentDestinationWithError:(id *)a3;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (int64_t)outputFormat;
- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4;
@end

@implementation WFRecordAudioAction

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

+ (id)datedFilenameForFormat:(int64_t)a3
{
  v3 = [a1 fileTypeForFormat:a3];
  v4 = NSString;
  v5 = WFLocalizedString(@"Audio Recording");
  v6 = [v3 fileExtension];
  v7 = objc_msgSend(v4, "wf_datedFilenameWithTypeString:fileExtension:", v5, v6);

  return v7;
}

+ (id)fileTypeForFormat:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      v4 = (void *)MEMORY[0x263F852B8];
      v5 = (void *)MEMORY[0x263F1D950];
LABEL_7:
      v3 = [v4 typeWithUTType:*v5];
      break;
    case 2:
      v4 = (void *)MEMORY[0x263F852B8];
      v5 = (void *)MEMORY[0x263F1DD68];
      goto LABEL_7;
    case 1:
      v3 = [MEMORY[0x263F852B8] typeWithString:*MEMORY[0x263F856A8]];
      break;
    default:
      v3 = 0;
      break;
  }
  return v3;
}

+ (id)userInterfaceXPCInterface
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___WFRecordAudioAction;
  v2 = objc_msgSendSuper2(&v5, sel_userInterfaceXPCInterface);
  v3 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v2 setClasses:v3 forSelector:sel_showWithOutputFormat_startImmediately_recordingDuration_completionHandler_ argumentIndex:0 ofReply:1];

  return v2;
}

+ (id)userInterfaceProtocol
{
  return &unk_26F0E1AA0;
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  v6 = NSString;
  id v7 = a5;
  id v8 = a3;
  v9 = WFLocalizedString(@"Allow “%1$@” to access the Microphone?");
  v10 = objc_msgSend(v6, "localizedStringWithFormat:", v9, v7, v8);

  return v10;
}

- (id)contentDestinationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x263F337E8], "microphoneLocation", a3);
}

- (double)recordingDuration
{
  v3 = [(WFRecordAudioAction *)self parameterValueForKey:@"WFRecordingEnd" ofClass:objc_opt_class()];
  int v4 = [v3 isEqualToString:@"After Time"];

  if (!v4) {
    return 0.0;
  }
  objc_super v5 = [(WFRecordAudioAction *)self parameterValueForKey:@"WFRecordingTimeInterval" ofClass:objc_opt_class()];
  v6 = (void *)MEMORY[0x263F86AD8];
  id v7 = [v5 unitString];
  uint64_t v8 = [v6 calendarUnitFromUnitString:v7];

  v9 = [MEMORY[0x263EFF8F0] currentCalendar];
  v10 = [v5 magnitude];
  uint64_t v11 = [v10 integerValue];
  v12 = [MEMORY[0x263EFF910] date];
  v13 = [v9 dateByAddingUnit:v8 value:v11 toDate:v12 options:0];

  [v13 timeIntervalSinceNow];
  double v15 = v14;

  return v15;
}

- (BOOL)startImmediately
{
  v2 = [(WFRecordAudioAction *)self parameterValueForKey:@"WFRecordingStart" ofClass:objc_opt_class()];
  char v3 = [v2 isEqualToString:@"Immediately"];

  return v3;
}

- (int64_t)outputFormat
{
  v2 = [(WFRecordAudioAction *)self parameterValueForKey:@"WFRecordingCompression" ofClass:objc_opt_class()];
  if ([v2 isEqualToString:@"Normal"]) {
    int64_t v3 = 1;
  }
  else {
    int64_t v3 = 2;
  }

  return v3;
}

- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4
{
  id v5 = a3;
  int64_t v6 = [(WFRecordAudioAction *)self outputFormat];
  BOOL v7 = [(WFRecordAudioAction *)self startImmediately];
  [(WFRecordAudioAction *)self recordingDuration];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__WFRecordAudioAction_runWithRemoteUserInterface_input___block_invoke;
  v8[3] = &unk_264E5D390;
  v8[4] = self;
  objc_msgSend(v5, "showWithOutputFormat:startImmediately:recordingDuration:completionHandler:", v6, v7, v8);
}

void __56__WFRecordAudioAction_runWithRemoteUserInterface_input___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a3;
  if (a2)
  {
    id v5 = (void *)MEMORY[0x263F337C8];
    int64_t v6 = (void *)MEMORY[0x263F337E8];
    id v7 = a2;
    uint64_t v8 = [v6 microphoneLocation];
    v9 = [v5 itemWithFile:v7 origin:v8 disclosureLevel:1];

    v10 = [*(id *)(a1 + 32) output];
    [v10 addItem:v9];
  }
  [*(id *)(a1 + 32) finishRunningWithError:v11];
}

@end