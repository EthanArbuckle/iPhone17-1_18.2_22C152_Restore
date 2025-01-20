@interface RWIProtocolPageDomainEventDispatcher(IKJSDependency)
- (void)safe_domContentEventFiredWithTimestamp:()IKJSDependency;
- (void)safe_frameClearedScheduledNavigationWithFrameId:()IKJSDependency;
- (void)safe_frameDetachedWithFrameId:()IKJSDependency;
- (void)safe_frameNavigatedWithFrame:()IKJSDependency;
- (void)safe_frameScheduledNavigationWithFrameId:()IKJSDependency delay:;
- (void)safe_frameStartedLoadingWithFrameId:()IKJSDependency;
- (void)safe_frameStoppedLoadingWithFrameId:()IKJSDependency;
- (void)safe_loadEventFiredWithTimestamp:()IKJSDependency;
@end

@implementation RWIProtocolPageDomainEventDispatcher(IKJSDependency)

- (void)safe_frameNavigatedWithFrame:()IKJSDependency
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8[0] = &v7;
  v4 = objc_opt_class();
  v5 = [MEMORY[0x1E4F29238] valueWithPointer:v8];
  v6 = objc_msgSend(v4, "ik_invocationforSelectorString:argumentsPointerValue:", @"frameNavigatedWithFrame:", v5);

  [v6 retainArguments];
  [v6 invokeWithTarget:a1];
}

- (void)safe_frameScheduledNavigationWithFrameId:()IKJSDependency delay:
{
  v10[2] = *MEMORY[0x1E4F143B8];
  double v8 = a2;
  id v9 = a4;
  v10[0] = &v9;
  v10[1] = &v8;
  v5 = objc_opt_class();
  v6 = [MEMORY[0x1E4F29238] valueWithPointer:v10];
  id v7 = objc_msgSend(v5, "ik_invocationforSelectorString:argumentsPointerValue:", @"frameScheduledNavigationWithFrameId:delay:", v6);

  [v7 retainArguments];
  [v7 invokeWithTarget:a1];
}

- (void)safe_loadEventFiredWithTimestamp:()IKJSDependency
{
  v7[1] = *MEMORY[0x1E4F143B8];
  double v6 = a2;
  v7[0] = &v6;
  v3 = objc_opt_class();
  v4 = [MEMORY[0x1E4F29238] valueWithPointer:v7];
  v5 = objc_msgSend(v3, "ik_invocationforSelectorString:argumentsPointerValue:", @"loadEventFiredWithTimestamp:", v4);

  [v5 retainArguments];
  [v5 invokeWithTarget:a1];
}

- (void)safe_domContentEventFiredWithTimestamp:()IKJSDependency
{
  v7[1] = *MEMORY[0x1E4F143B8];
  double v6 = a2;
  v7[0] = &v6;
  v3 = objc_opt_class();
  v4 = [MEMORY[0x1E4F29238] valueWithPointer:v7];
  v5 = objc_msgSend(v3, "ik_invocationforSelectorString:argumentsPointerValue:", @"domContentEventFiredWithTimestamp:", v4);

  [v5 retainArguments];
  [v5 invokeWithTarget:a1];
}

- (void)safe_frameStartedLoadingWithFrameId:()IKJSDependency
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8[0] = &v7;
  v4 = objc_opt_class();
  v5 = [MEMORY[0x1E4F29238] valueWithPointer:v8];
  double v6 = objc_msgSend(v4, "ik_invocationforSelectorString:argumentsPointerValue:", @"frameStartedLoadingWithFrameId:", v5);

  [v6 retainArguments];
  [v6 invokeWithTarget:a1];
}

- (void)safe_frameDetachedWithFrameId:()IKJSDependency
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8[0] = &v7;
  v4 = objc_opt_class();
  v5 = [MEMORY[0x1E4F29238] valueWithPointer:v8];
  double v6 = objc_msgSend(v4, "ik_invocationforSelectorString:argumentsPointerValue:", @"frameDetachedWithFrameId:", v5);

  [v6 retainArguments];
  [v6 invokeWithTarget:a1];
}

- (void)safe_frameClearedScheduledNavigationWithFrameId:()IKJSDependency
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8[0] = &v7;
  v4 = objc_opt_class();
  v5 = [MEMORY[0x1E4F29238] valueWithPointer:v8];
  double v6 = objc_msgSend(v4, "ik_invocationforSelectorString:argumentsPointerValue:", @"frameClearedScheduledNavigationWithFrameId:", v5);

  [v6 retainArguments];
  [v6 invokeWithTarget:a1];
}

- (void)safe_frameStoppedLoadingWithFrameId:()IKJSDependency
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8[0] = &v7;
  v4 = objc_opt_class();
  v5 = [MEMORY[0x1E4F29238] valueWithPointer:v8];
  double v6 = objc_msgSend(v4, "ik_invocationforSelectorString:argumentsPointerValue:", @"frameStoppedLoadingWithFrameId:", v5);

  [v6 retainArguments];
  [v6 invokeWithTarget:a1];
}

@end