@interface RWIProtocolDOMDomainEventDispatcher(IKJSDependency)
- (void)safe_attributeModifiedWithNodeId:()IKJSDependency name:value:;
- (void)safe_attributeRemovedWithNodeId:()IKJSDependency name:;
- (void)safe_characterDataModifiedWithNodeId:()IKJSDependency characterData:;
- (void)safe_childNodeCountUpdatedWithNodeId:()IKJSDependency childNodeCount:;
- (void)safe_childNodeInsertedWithParentNodeId:()IKJSDependency previousNodeId:node:;
- (void)safe_childNodeRemovedWithParentNodeId:()IKJSDependency nodeId:;
- (void)safe_customElementStateChangedWithNodeId:()IKJSDependency customElementState:;
- (void)safe_didAddEventListenerWithNodeId:()IKJSDependency;
- (void)safe_didFireEventWithNodeId:()IKJSDependency eventName:timestamp:data:;
- (void)safe_documentUpdated;
- (void)safe_inlineStyleInvalidatedWithNodeIds:()IKJSDependency;
- (void)safe_inspectWithNodeId:()IKJSDependency;
- (void)safe_powerEfficientPlaybackStateChangedWithNodeId:()IKJSDependency timestamp:isPowerEfficient:;
- (void)safe_pseudoElementAddedWithParentId:()IKJSDependency pseudoElement:;
- (void)safe_pseudoElementRemovedWithParentId:()IKJSDependency pseudoElementId:;
- (void)safe_setChildNodesWithParentId:()IKJSDependency nodes:;
- (void)safe_shadowRootPoppedWithHostId:()IKJSDependency rootId:;
- (void)safe_shadowRootPushedWithHostId:()IKJSDependency root:;
- (void)safe_willDestroyDOMNodeWithNodeId:()IKJSDependency;
- (void)safe_willRemoveEventListenerWithNodeId:()IKJSDependency;
@end

@implementation RWIProtocolDOMDomainEventDispatcher(IKJSDependency)

- (void)safe_childNodeInsertedWithParentNodeId:()IKJSDependency previousNodeId:node:
{
  v12[3] = *MEMORY[0x1E4F143B8];
  int v10 = a4;
  int v11 = a3;
  id v9 = a5;
  v12[0] = &v11;
  v12[1] = &v10;
  v12[2] = &v9;
  v6 = objc_opt_class();
  v7 = [MEMORY[0x1E4F29238] valueWithPointer:v12];
  v8 = objc_msgSend(v6, "ik_invocationforSelectorString:argumentsPointerValue:", @"childNodeInsertedWithParentNodeId:previousNodeId:node:", v7);

  [v8 retainArguments];
  [v8 invokeWithTarget:a1];
}

- (void)safe_childNodeRemovedWithParentNodeId:()IKJSDependency nodeId:
{
  v10[2] = *MEMORY[0x1E4F143B8];
  int v8 = a4;
  int v9 = a3;
  v10[0] = &v9;
  v10[1] = &v8;
  v5 = objc_opt_class();
  v6 = [MEMORY[0x1E4F29238] valueWithPointer:v10];
  v7 = objc_msgSend(v5, "ik_invocationforSelectorString:argumentsPointerValue:", @"childNodeRemovedWithParentNodeId:nodeId:", v6);

  [v7 retainArguments];
  [v7 invokeWithTarget:a1];
}

- (void)safe_didFireEventWithNodeId:()IKJSDependency eventName:timestamp:data:
{
  v16[4] = *MEMORY[0x1E4F143B8];
  int v15 = a4;
  id v14 = a5;
  double v13 = a2;
  uint64_t v12 = a6;
  v16[0] = &v15;
  v16[1] = &v14;
  v16[2] = &v13;
  v16[3] = &v12;
  int v9 = objc_opt_class();
  int v10 = [MEMORY[0x1E4F29238] valueWithPointer:v16];
  int v11 = objc_msgSend(v9, "ik_invocationforSelectorString:argumentsPointerValue:", @"didFireEventWithNodeId:eventName:timestamp:data:", v10);

  [v11 retainArguments];
  [v11 invokeWithTarget:a1];
}

- (void)safe_didAddEventListenerWithNodeId:()IKJSDependency
{
  v8[1] = *MEMORY[0x1E4F143B8];
  int v7 = a3;
  v8[0] = &v7;
  v4 = objc_opt_class();
  v5 = [MEMORY[0x1E4F29238] valueWithPointer:v8];
  v6 = objc_msgSend(v4, "ik_invocationforSelectorString:argumentsPointerValue:", @"didAddEventListenerWithNodeId:", v5);

  [v6 retainArguments];
  [v6 invokeWithTarget:a1];
}

- (void)safe_characterDataModifiedWithNodeId:()IKJSDependency characterData:
{
  v10[2] = *MEMORY[0x1E4F143B8];
  int v9 = a3;
  id v8 = a4;
  v10[0] = &v9;
  v10[1] = &v8;
  v5 = objc_opt_class();
  v6 = [MEMORY[0x1E4F29238] valueWithPointer:v10];
  int v7 = objc_msgSend(v5, "ik_invocationforSelectorString:argumentsPointerValue:", @"characterDataModifiedWithNodeId:characterData:", v6);

  [v7 retainArguments];
  [v7 invokeWithTarget:a1];
}

- (void)safe_pseudoElementRemovedWithParentId:()IKJSDependency pseudoElementId:
{
  v10[2] = *MEMORY[0x1E4F143B8];
  int v8 = a4;
  int v9 = a3;
  v10[0] = &v9;
  v10[1] = &v8;
  v5 = objc_opt_class();
  v6 = [MEMORY[0x1E4F29238] valueWithPointer:v10];
  int v7 = objc_msgSend(v5, "ik_invocationforSelectorString:argumentsPointerValue:", @"pseudoElementRemovedWithParentId:pseudoElementId:", v6);

  [v7 retainArguments];
  [v7 invokeWithTarget:a1];
}

- (void)safe_documentUpdated
{
  v2 = objc_opt_class();
  v3 = [MEMORY[0x1E4F29238] valueWithPointer:v5];
  v4 = objc_msgSend(v2, "ik_invocationforSelectorString:argumentsPointerValue:", @"documentUpdated", v3);

  [v4 retainArguments];
  [v4 invokeWithTarget:a1];
}

- (void)safe_powerEfficientPlaybackStateChangedWithNodeId:()IKJSDependency timestamp:isPowerEfficient:
{
  v12[3] = *MEMORY[0x1E4F143B8];
  int v11 = a4;
  double v10 = a2;
  char v9 = a5;
  v12[0] = &v11;
  v12[1] = &v10;
  v12[2] = &v9;
  v6 = objc_opt_class();
  int v7 = [MEMORY[0x1E4F29238] valueWithPointer:v12];
  int v8 = objc_msgSend(v6, "ik_invocationforSelectorString:argumentsPointerValue:", @"powerEfficientPlaybackStateChangedWithNodeId:timestamp:isPowerEfficient:", v7);

  [v8 retainArguments];
  [v8 invokeWithTarget:a1];
}

- (void)safe_inspectWithNodeId:()IKJSDependency
{
  v8[1] = *MEMORY[0x1E4F143B8];
  int v7 = a3;
  v8[0] = &v7;
  v4 = objc_opt_class();
  v5 = [MEMORY[0x1E4F29238] valueWithPointer:v8];
  v6 = objc_msgSend(v4, "ik_invocationforSelectorString:argumentsPointerValue:", @"inspectWithNodeId:", v5);

  [v6 retainArguments];
  [v6 invokeWithTarget:a1];
}

- (void)safe_willDestroyDOMNodeWithNodeId:()IKJSDependency
{
  v8[1] = *MEMORY[0x1E4F143B8];
  int v7 = a3;
  v8[0] = &v7;
  v4 = objc_opt_class();
  v5 = [MEMORY[0x1E4F29238] valueWithPointer:v8];
  v6 = objc_msgSend(v4, "ik_invocationforSelectorString:argumentsPointerValue:", @"willDestroyDOMNodeWithNodeId:", v5);

  [v6 retainArguments];
  [v6 invokeWithTarget:a1];
}

- (void)safe_shadowRootPushedWithHostId:()IKJSDependency root:
{
  v10[2] = *MEMORY[0x1E4F143B8];
  int v9 = a3;
  id v8 = a4;
  v10[0] = &v9;
  v10[1] = &v8;
  v5 = objc_opt_class();
  v6 = [MEMORY[0x1E4F29238] valueWithPointer:v10];
  int v7 = objc_msgSend(v5, "ik_invocationforSelectorString:argumentsPointerValue:", @"shadowRootPushedWithHostId:root:", v6);

  [v7 retainArguments];
  [v7 invokeWithTarget:a1];
}

- (void)safe_willRemoveEventListenerWithNodeId:()IKJSDependency
{
  v8[1] = *MEMORY[0x1E4F143B8];
  int v7 = a3;
  v8[0] = &v7;
  v4 = objc_opt_class();
  v5 = [MEMORY[0x1E4F29238] valueWithPointer:v8];
  v6 = objc_msgSend(v4, "ik_invocationforSelectorString:argumentsPointerValue:", @"willRemoveEventListenerWithNodeId:", v5);

  [v6 retainArguments];
  [v6 invokeWithTarget:a1];
}

- (void)safe_childNodeCountUpdatedWithNodeId:()IKJSDependency childNodeCount:
{
  v10[2] = *MEMORY[0x1E4F143B8];
  int v8 = a4;
  int v9 = a3;
  v10[0] = &v9;
  v10[1] = &v8;
  v5 = objc_opt_class();
  v6 = [MEMORY[0x1E4F29238] valueWithPointer:v10];
  int v7 = objc_msgSend(v5, "ik_invocationforSelectorString:argumentsPointerValue:", @"childNodeCountUpdatedWithNodeId:childNodeCount:", v6);

  [v7 retainArguments];
  [v7 invokeWithTarget:a1];
}

- (void)safe_shadowRootPoppedWithHostId:()IKJSDependency rootId:
{
  v10[2] = *MEMORY[0x1E4F143B8];
  int v8 = a4;
  int v9 = a3;
  v10[0] = &v9;
  v10[1] = &v8;
  v5 = objc_opt_class();
  v6 = [MEMORY[0x1E4F29238] valueWithPointer:v10];
  int v7 = objc_msgSend(v5, "ik_invocationforSelectorString:argumentsPointerValue:", @"shadowRootPoppedWithHostId:rootId:", v6);

  [v7 retainArguments];
  [v7 invokeWithTarget:a1];
}

- (void)safe_attributeRemovedWithNodeId:()IKJSDependency name:
{
  v10[2] = *MEMORY[0x1E4F143B8];
  int v9 = a3;
  id v8 = a4;
  v10[0] = &v9;
  v10[1] = &v8;
  v5 = objc_opt_class();
  v6 = [MEMORY[0x1E4F29238] valueWithPointer:v10];
  int v7 = objc_msgSend(v5, "ik_invocationforSelectorString:argumentsPointerValue:", @"attributeRemovedWithNodeId:name:", v6);

  [v7 retainArguments];
  [v7 invokeWithTarget:a1];
}

- (void)safe_customElementStateChangedWithNodeId:()IKJSDependency customElementState:
{
  v10[2] = *MEMORY[0x1E4F143B8];
  int v9 = a3;
  uint64_t v8 = a4;
  v10[0] = &v9;
  v10[1] = &v8;
  v5 = objc_opt_class();
  v6 = [MEMORY[0x1E4F29238] valueWithPointer:v10];
  int v7 = objc_msgSend(v5, "ik_invocationforSelectorString:argumentsPointerValue:", @"customElementStateChangedWithNodeId:customElementState:", v6);

  [v7 retainArguments];
  [v7 invokeWithTarget:a1];
}

- (void)safe_setChildNodesWithParentId:()IKJSDependency nodes:
{
  v10[2] = *MEMORY[0x1E4F143B8];
  int v9 = a3;
  id v8 = a4;
  v10[0] = &v9;
  v10[1] = &v8;
  v5 = objc_opt_class();
  v6 = [MEMORY[0x1E4F29238] valueWithPointer:v10];
  int v7 = objc_msgSend(v5, "ik_invocationforSelectorString:argumentsPointerValue:", @"setChildNodesWithParentId:nodes:", v6);

  [v7 retainArguments];
  [v7 invokeWithTarget:a1];
}

- (void)safe_inlineStyleInvalidatedWithNodeIds:()IKJSDependency
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8[0] = &v7;
  v4 = objc_opt_class();
  v5 = [MEMORY[0x1E4F29238] valueWithPointer:v8];
  v6 = objc_msgSend(v4, "ik_invocationforSelectorString:argumentsPointerValue:", @"inlineStyleInvalidatedWithNodeIds:", v5);

  [v6 retainArguments];
  [v6 invokeWithTarget:a1];
}

- (void)safe_attributeModifiedWithNodeId:()IKJSDependency name:value:
{
  v13[3] = *MEMORY[0x1E4F143B8];
  int v12 = a3;
  id v11 = a4;
  id v10 = a5;
  v13[0] = &v12;
  v13[1] = &v11;
  v13[2] = &v10;
  id v7 = objc_opt_class();
  id v8 = [MEMORY[0x1E4F29238] valueWithPointer:v13];
  int v9 = objc_msgSend(v7, "ik_invocationforSelectorString:argumentsPointerValue:", @"attributeModifiedWithNodeId:name:value:", v8);

  [v9 retainArguments];
  [v9 invokeWithTarget:a1];
}

- (void)safe_pseudoElementAddedWithParentId:()IKJSDependency pseudoElement:
{
  v10[2] = *MEMORY[0x1E4F143B8];
  int v9 = a3;
  id v8 = a4;
  v10[0] = &v9;
  v10[1] = &v8;
  v5 = objc_opt_class();
  v6 = [MEMORY[0x1E4F29238] valueWithPointer:v10];
  id v7 = objc_msgSend(v5, "ik_invocationforSelectorString:argumentsPointerValue:", @"pseudoElementAddedWithParentId:pseudoElement:", v6);

  [v7 retainArguments];
  [v7 invokeWithTarget:a1];
}

@end