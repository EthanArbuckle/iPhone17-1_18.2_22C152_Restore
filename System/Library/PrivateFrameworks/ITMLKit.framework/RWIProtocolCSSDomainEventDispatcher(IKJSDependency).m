@interface RWIProtocolCSSDomainEventDispatcher(IKJSDependency)
- (void)safe_mediaQueryResultChanged;
- (void)safe_nodeLayoutFlagsChangedWithNodeId:()IKJSDependency layoutFlags:;
- (void)safe_styleSheetAddedWithHeader:()IKJSDependency;
- (void)safe_styleSheetChangedWithStyleSheetId:()IKJSDependency;
- (void)safe_styleSheetRemovedWithStyleSheetId:()IKJSDependency;
@end

@implementation RWIProtocolCSSDomainEventDispatcher(IKJSDependency)

- (void)safe_styleSheetChangedWithStyleSheetId:()IKJSDependency
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8[0] = &v7;
  v4 = objc_opt_class();
  v5 = [MEMORY[0x1E4F29238] valueWithPointer:v8];
  v6 = objc_msgSend(v4, "ik_invocationforSelectorString:argumentsPointerValue:", @"styleSheetChangedWithStyleSheetId:", v5);

  [v6 retainArguments];
  [v6 invokeWithTarget:a1];
}

- (void)safe_nodeLayoutFlagsChangedWithNodeId:()IKJSDependency layoutFlags:
{
  v10[2] = *MEMORY[0x1E4F143B8];
  int v9 = a3;
  uint64_t v8 = a4;
  v10[0] = &v9;
  v10[1] = &v8;
  v5 = objc_opt_class();
  v6 = [MEMORY[0x1E4F29238] valueWithPointer:v10];
  id v7 = objc_msgSend(v5, "ik_invocationforSelectorString:argumentsPointerValue:", @"nodeLayoutFlagsChangedWithNodeId:layoutFlags:", v6);

  [v7 retainArguments];
  [v7 invokeWithTarget:a1];
}

- (void)safe_mediaQueryResultChanged
{
  v2 = objc_opt_class();
  v3 = [MEMORY[0x1E4F29238] valueWithPointer:v5];
  v4 = objc_msgSend(v2, "ik_invocationforSelectorString:argumentsPointerValue:", @"mediaQueryResultChanged", v3);

  [v4 retainArguments];
  [v4 invokeWithTarget:a1];
}

- (void)safe_styleSheetAddedWithHeader:()IKJSDependency
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8[0] = &v7;
  v4 = objc_opt_class();
  v5 = [MEMORY[0x1E4F29238] valueWithPointer:v8];
  v6 = objc_msgSend(v4, "ik_invocationforSelectorString:argumentsPointerValue:", @"styleSheetAddedWithHeader:", v5);

  [v6 retainArguments];
  [v6 invokeWithTarget:a1];
}

- (void)safe_styleSheetRemovedWithStyleSheetId:()IKJSDependency
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8[0] = &v7;
  v4 = objc_opt_class();
  v5 = [MEMORY[0x1E4F29238] valueWithPointer:v8];
  v6 = objc_msgSend(v4, "ik_invocationforSelectorString:argumentsPointerValue:", @"styleSheetRemovedWithStyleSheetId:", v5);

  [v6 retainArguments];
  [v6 invokeWithTarget:a1];
}

@end