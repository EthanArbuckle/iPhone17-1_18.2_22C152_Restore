@interface CRKClassroomLockScreenMonitor_iOS
- (BOOL)isClassroomLockScreenVisible;
- (CRKClassroomLockScreenMonitor_iOS)init;
- (void)dealloc;
- (void)dismissClassroomLockScreen;
- (void)displayClassroomLockScreenWithLabel:(id)a3 passcode:(id)a4;
- (void)endObserving;
- (void)setClassroomLockScreenVisible:(BOOL)a3;
- (void)startObserving;
@end

@implementation CRKClassroomLockScreenMonitor_iOS

- (void)dealloc
{
  [(CRKClassroomLockScreenMonitor_iOS *)self endObserving];
  v3.receiver = self;
  v3.super_class = (Class)CRKClassroomLockScreenMonitor_iOS;
  [(CRKClassroomLockScreenMonitor_iOS *)&v3 dealloc];
}

- (CRKClassroomLockScreenMonitor_iOS)init
{
  v5.receiver = self;
  v5.super_class = (Class)CRKClassroomLockScreenMonitor_iOS;
  v2 = [(CRKClassroomLockScreenMonitor_iOS *)&v5 init];
  objc_super v3 = v2;
  if (v2) {
    [(CRKClassroomLockScreenMonitor_iOS *)v2 startObserving];
  }
  return v3;
}

- (void)displayClassroomLockScreenWithLabel:(id)a3 passcode:(id)a4
{
  id v12 = a3;
  id v5 = a4;
  v6 = objc_opt_new();
  v7 = NSNumber;
  v8 = [MEMORY[0x263F08AB0] processInfo];
  v9 = objc_msgSend(v7, "numberWithInt:", objc_msgSend(v8, "processIdentifier"));
  [v6 setObject:v9 forKeyedSubscript:@"studentdPID"];

  if ([v12 length]) {
    [v6 setObject:v12 forKeyedSubscript:@"lockedByLabel"];
  }
  if ([v5 length]) {
    [v6 setObject:v5 forKeyedSubscript:@"passcode"];
  }
  v10 = objc_opt_new();
  [v10 enableLockScreenBundle:@"ClassroomLockScreen" withContext:v6];

  uint64_t v11 = SBSSpringBoardServerPort();
  MEMORY[0x22A620200](v11, 1);
  SBSUndimScreen();
}

- (void)dismissClassroomLockScreen
{
  id v2 = (id)objc_opt_new();
  [v2 disableLockScreenBundle:@"ClassroomLockScreen" withContext:0];
}

- (void)startObserving
{
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __51__CRKClassroomLockScreenMonitor_iOS_startObserving__block_invoke;
  handler[3] = &unk_2646F43C8;
  handler[4] = self;
  objc_super v3 = MEMORY[0x263EF83A0];
  notify_register_dispatch("com.apple.studentd.lockScreenPluginDidAppear", &self->mDidAppearObserver, MEMORY[0x263EF83A0], handler);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__CRKClassroomLockScreenMonitor_iOS_startObserving__block_invoke_2;
  v4[3] = &unk_2646F43C8;
  v4[4] = self;
  notify_register_dispatch("com.apple.studentd.lockScreenPluginWantsDismissal", &self->mDidDismissObserver, v3, v4);
}

- (void)endObserving
{
  notify_cancel(self->mDidAppearObserver);
  int mDidDismissObserver = self->mDidDismissObserver;

  notify_cancel(mDidDismissObserver);
}

- (BOOL)isClassroomLockScreenVisible
{
  return self->_classroomLockScreenVisible;
}

- (void)setClassroomLockScreenVisible:(BOOL)a3
{
  self->_classroomLockScreenVisible = a3;
}

@end