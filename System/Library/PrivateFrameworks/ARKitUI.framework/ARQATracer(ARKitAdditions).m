@interface ARQATracer(ARKitAdditions)
- (void)_startScreenRecording;
- (void)_stopScreenRecording;
@end

@implementation ARQATracer(ARKitAdditions)

- (void)_startScreenRecording
{
  if ([a1 recordScreen])
  {
    v2 = objc_alloc_init(ARScreenRecording);
    [a1 setScreenRecorder:v2];

    v3 = [a1 screenRecorder];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __51__ARQATracer_ARKitAdditions___startScreenRecording__block_invoke;
    v4[3] = &unk_264000B08;
    v4[4] = a1;
    [v3 startRecordingWithHandler:v4];
  }
}

- (void)_stopScreenRecording
{
  if ([a1 recordScreen])
  {
    v2 = [a1 screenRecorder];
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __50__ARQATracer_ARKitAdditions___stopScreenRecording__block_invoke;
    v3[3] = &unk_264000B08;
    v3[4] = a1;
    [v2 stopRecordingWithHandler:v3];
  }
}

@end