@interface CSSystemShellStartMonitorFactory
+ (id)defaultShellStartMonitor;
@end

@implementation CSSystemShellStartMonitorFactory

+ (id)defaultShellStartMonitor
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2050000000;
  v2 = (void *)getCLFSystemShellSwitcherClass_softClass;
  uint64_t v13 = getCLFSystemShellSwitcherClass_softClass;
  if (!getCLFSystemShellSwitcherClass_softClass)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __getCLFSystemShellSwitcherClass_block_invoke;
    v9[3] = &unk_1E62010B0;
    v9[4] = &v10;
    __getCLFSystemShellSwitcherClass_block_invoke((uint64_t)v9);
    v2 = (void *)v11[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v10, 8);
  v4 = objc_opt_new();
  int v5 = [v4 isClarityBoardEnabled];

  v6 = off_1E61FEAA0;
  if (v5) {
    v6 = off_1E61FE820;
  }
  v7 = [(__objc2_class *)*v6 sharedInstance];
  return v7;
}

@end