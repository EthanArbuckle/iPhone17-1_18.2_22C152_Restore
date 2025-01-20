@interface RWIProtocolDOMStorageDomainEventDispatcher(IKJSDependency)
- (void)safe_domStorageItemAddedWithStorageId:()IKJSDependency key:newValue:;
- (void)safe_domStorageItemRemovedWithStorageId:()IKJSDependency key:;
- (void)safe_domStorageItemUpdatedWithStorageId:()IKJSDependency key:oldValue:newValue:;
- (void)safe_domStorageItemsClearedWithStorageId:()IKJSDependency;
@end

@implementation RWIProtocolDOMStorageDomainEventDispatcher(IKJSDependency)

- (void)safe_domStorageItemsClearedWithStorageId:()IKJSDependency
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8[0] = &v7;
  v4 = objc_opt_class();
  v5 = [MEMORY[0x1E4F29238] valueWithPointer:v8];
  v6 = objc_msgSend(v4, "ik_invocationforSelectorString:argumentsPointerValue:", @"domStorageItemsClearedWithStorageId:", v5);

  [v6 retainArguments];
  [v6 invokeWithTarget:a1];
}

- (void)safe_domStorageItemUpdatedWithStorageId:()IKJSDependency key:oldValue:newValue:
{
  v17[4] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v15 = a4;
  id v14 = a5;
  id v13 = a6;
  v17[0] = &v16;
  v17[1] = &v15;
  v17[2] = &v14;
  v17[3] = &v13;
  v10 = objc_opt_class();
  v11 = [MEMORY[0x1E4F29238] valueWithPointer:v17];
  v12 = objc_msgSend(v10, "ik_invocationforSelectorString:argumentsPointerValue:", @"domStorageItemUpdatedWithStorageId:key:oldValue:newValue:", v11);

  [v12 retainArguments];
  [v12 invokeWithTarget:a1];
}

- (void)safe_domStorageItemRemovedWithStorageId:()IKJSDependency key:
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v9 = a4;
  v11[0] = &v10;
  v11[1] = &v9;
  v6 = objc_opt_class();
  id v7 = [MEMORY[0x1E4F29238] valueWithPointer:v11];
  v8 = objc_msgSend(v6, "ik_invocationforSelectorString:argumentsPointerValue:", @"domStorageItemRemovedWithStorageId:key:", v7);

  [v8 retainArguments];
  [v8 invokeWithTarget:a1];
}

- (void)safe_domStorageItemAddedWithStorageId:()IKJSDependency key:newValue:
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v12 = a4;
  id v11 = a5;
  v14[0] = &v13;
  v14[1] = &v12;
  v14[2] = &v11;
  v8 = objc_opt_class();
  id v9 = [MEMORY[0x1E4F29238] valueWithPointer:v14];
  id v10 = objc_msgSend(v8, "ik_invocationforSelectorString:argumentsPointerValue:", @"domStorageItemAddedWithStorageId:key:newValue:", v9);

  [v10 retainArguments];
  [v10 invokeWithTarget:a1];
}

@end