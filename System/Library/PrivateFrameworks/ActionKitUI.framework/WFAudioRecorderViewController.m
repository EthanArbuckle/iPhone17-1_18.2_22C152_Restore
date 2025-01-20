@interface WFAudioRecorderViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isFinishing;
- (BOOL)startImmediately;
- (UIButton)inputButton;
- (WFAudioRecorder)audioRecorder;
- (WFAudioRecorderViewController)initWithOutputFormat:(int64_t)a3 destinationURL:(id)a4;
- (double)recordingDuration;
- (id)completionHandler;
- (void)audioRecorder:(id)a3 didFinishWithDestinationURL:(id)a4 error:(id)a5;
- (void)audioRecorder:(id)a3 didProgressToTime:(double)a4;
- (void)finishRecording;
- (void)handleTap;
- (void)inputButtonTapped;
- (void)setAudioRecorder:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setInputButton:(id)a3;
- (void)setIsFinishing:(BOOL)a3;
- (void)setRecordingDuration:(double)a3;
- (void)setStartImmediately:(BOOL)a3;
- (void)startRecording;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WFAudioRecorderViewController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_inputButton);
  objc_storeStrong((id *)&self->_audioRecorder, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

- (void)setIsFinishing:(BOOL)a3
{
  self->_isFinishing = a3;
}

- (BOOL)isFinishing
{
  return self->_isFinishing;
}

- (void)setInputButton:(id)a3
{
}

- (UIButton)inputButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputButton);
  return (UIButton *)WeakRetained;
}

- (void)setAudioRecorder:(id)a3
{
}

- (WFAudioRecorder)audioRecorder
{
  return self->_audioRecorder;
}

- (void)setRecordingDuration:(double)a3
{
  self->_recordingDuration = a3;
}

- (double)recordingDuration
{
  return self->_recordingDuration;
}

- (void)setStartImmediately:(BOOL)a3
{
  self->_startImmediately = a3;
}

- (BOOL)startImmediately
{
  return self->_startImmediately;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)audioRecorder:(id)a3 didFinishWithDestinationURL:(id)a4 error:(id)a5
{
  id v10 = a4;
  id v7 = a5;
  v8 = [(WFAudioRecorderViewController *)self completionHandler];

  if (v8)
  {
    v9 = [(WFAudioRecorderViewController *)self completionHandler];
    ((void (**)(void, id, id))v9)[2](v9, v10, v7);
  }
}

- (void)audioRecorder:(id)a3 didProgressToTime:(double)a4
{
  v5 = (void *)MEMORY[0x263F231E8];
  [(WFAudioRecorderViewController *)self recordingDuration];
  objc_msgSend(v5, "formattedStringWithDuration:elapsedTime:");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  v6 = WFLocalizedString(@"Tap to finish recording.");
  id v7 = [NSString localizedStringWithFormat:@"%@\n\n%@", v6, v9];
  v8 = [(WFAudioInputViewController *)self statusLabel];
  [v8 setText:v7];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)inputButtonTapped
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F336E8] alertWithPreferredStyle:1];
  v4 = (void *)MEMORY[0x263F87988];
  v5 = [(WFAudioRecorderViewController *)self inputButton];
  v6 = [v4 sourceWithView:v5];
  v24 = v3;
  [v3 setPresentationSource:v6];

  id v7 = [MEMORY[0x263EF93E0] sharedInstance];
  v8 = [v7 currentRoute];
  id v9 = [v8 inputs];
  id v10 = [v9 firstObject];
  v11 = [v10 portName];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = [v7 availableInputs];
  uint64_t v12 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v17 = [v16 portName];
        uint64_t v18 = [v17 isEqualToString:v11];
        v19 = (void *)MEMORY[0x263F33978];
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __50__WFAudioRecorderViewController_inputButtonTapped__block_invoke;
        v25[3] = &unk_264900E88;
        id v26 = v7;
        v27 = v16;
        v20 = [v19 buttonWithTitle:v17 subtitle:0 selected:v18 style:0 handler:v25];
        [v24 addButton:v20];
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v13);
  }

  v21 = [MEMORY[0x263F336F0] cancelButtonWithHandler:0];
  [v24 addButton:v21];

  v22 = WFUserInterfaceFromViewController();
  [v22 presentAlert:v24];
}

uint64_t __50__WFAudioRecorderViewController_inputButtonTapped__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPreferredInput:*(void *)(a1 + 40) error:0];
}

- (void)finishRecording
{
  id v2 = [(WFAudioRecorderViewController *)self audioRecorder];
  [v2 finishRecording];
}

- (void)startRecording
{
  v3 = WFLocalizedString(@"Tap to finish recording.");
  v4 = [(WFAudioInputViewController *)self statusLabel];
  [v4 setText:v3];

  [(WFAudioRecorderViewController *)self recordingDuration];
  double v6 = v5;
  id v7 = [(WFAudioRecorderViewController *)self audioRecorder];
  if (v6 == 0.0)
  {
    [v7 startRecording];
  }
  else
  {
    [(WFAudioRecorderViewController *)self recordingDuration];
    objc_msgSend(v7, "recordForDuration:");
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WFAudioRecorderViewController;
  [(WFAudioRecorderViewController *)&v4 viewWillAppear:a3];
  if ([(WFAudioRecorderViewController *)self startImmediately]) {
    [(WFAudioRecorderViewController *)self startRecording];
  }
}

- (void)handleTap
{
  v3 = [(WFAudioRecorderViewController *)self audioRecorder];
  int v4 = [v3 isRecording];

  if (v4)
  {
    [(WFAudioRecorderViewController *)self setIsFinishing:1];
    [(WFAudioRecorderViewController *)self finishRecording];
  }
  else if (![(WFAudioRecorderViewController *)self isFinishing])
  {
    [(WFAudioRecorderViewController *)self startRecording];
  }
}

- (void)viewDidLoad
{
  v22[2] = *MEMORY[0x263EF8340];
  v21.receiver = self;
  v21.super_class = (Class)WFAudioRecorderViewController;
  [(WFAudioRecorderViewController *)&v21 viewDidLoad];
  v3 = WFLocalizedString(@"Tap to start recording.");
  int v4 = [(WFAudioInputViewController *)self statusLabel];
  [v4 setText:v3];

  double v5 = [(WFAudioInputViewController *)self contentView];
  double v6 = [MEMORY[0x263F824E8] buttonWithType:1];
  id v7 = [MEMORY[0x263F825C8] whiteColor];
  [v6 setTintColor:v7];

  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  v8 = [MEMORY[0x263F85308] actionKitImageNamed:@"MicrophoneButton"];
  id v9 = [v8 UIImage];
  [v6 setImage:v9 forState:0];

  [v6 addTarget:self action:sel_inputButtonTapped forControlEvents:64];
  [v5 addSubview:v6];
  objc_storeWeak((id *)&self->_inputButton, v6);
  v19 = (void *)MEMORY[0x263F08938];
  id v10 = [v6 bottomAnchor];
  v20 = v5;
  v11 = [v5 safeAreaLayoutGuide];
  uint64_t v12 = [v11 bottomAnchor];
  uint64_t v13 = [v10 constraintEqualToAnchor:v12 constant:-22.0];
  v22[0] = v13;
  uint64_t v14 = [v6 trailingAnchor];
  v15 = [v5 safeAreaLayoutGuide];
  v16 = [v15 trailingAnchor];
  v17 = [v14 constraintEqualToAnchor:v16 constant:-22.0];
  v22[1] = v17;
  uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
  [v19 activateConstraints:v18];
}

- (WFAudioRecorderViewController)initWithOutputFormat:(int64_t)a3 destinationURL:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WFAudioRecorderViewController;
  id v7 = [(WFAudioRecorderViewController *)&v12 init];
  if (v7)
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x263F231E8]) initWithOutputFormat:a3 destinationURL:v6];
    audioRecorder = v7->_audioRecorder;
    v7->_audioRecorder = (WFAudioRecorder *)v8;

    [(WFAudioRecorder *)v7->_audioRecorder setDelegate:v7];
    id v10 = v7;
  }

  return v7;
}

@end