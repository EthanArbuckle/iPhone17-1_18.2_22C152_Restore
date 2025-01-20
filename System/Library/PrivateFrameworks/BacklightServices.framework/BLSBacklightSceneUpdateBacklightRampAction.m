@interface BLSBacklightSceneUpdateBacklightRampAction
- (BLSBacklightSceneUpdateBacklightRampAction)initWithCompletion:(id)a3;
@end

@implementation BLSBacklightSceneUpdateBacklightRampAction

- (BLSBacklightSceneUpdateBacklightRampAction)initWithCompletion:(id)a3
{
  v4 = [MEMORY[0x1E4F4F670] responderWithHandler:a3];
  [v4 setQueue:MEMORY[0x1E4F14428]];
  objc_msgSend(v4, "setTimeout:", dispatch_time(0, 2500000000));
  v7.receiver = self;
  v7.super_class = (Class)BLSBacklightSceneUpdateBacklightRampAction;
  v5 = [(BLSBacklightSceneUpdateBacklightRampAction *)&v7 initWithInfo:0 responder:v4];

  return v5;
}

@end