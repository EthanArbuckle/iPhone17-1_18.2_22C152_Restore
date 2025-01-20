@interface CAMFocusAtCenterForVideoRecordingCommand
- (void)executeWithContext:(id)a3;
@end

@implementation CAMFocusAtCenterForVideoRecordingCommand

- (void)executeWithContext:(id)a3
{
  id v7 = [a3 currentVideoDevice];
  v4 = [v7 activeFormat];
  if ([v4 autoFocusSystem] == 2) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 2;
  }
  v6 = -[CAMFocusCommand initWithFocusMode:atPointOfInterest:smooth:]([CAMFocusCommand alloc], "initWithFocusMode:atPointOfInterest:smooth:", v5, 1, 0.5, 0.5);
  if (v6) {
    [(CAMCaptureCommand *)self addSubcommand:v6];
  }
}

@end