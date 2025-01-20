@interface IKJSApplication
- (BOOL)requestDocumentWithContext:(id)a3 response:(id)a4;
- (NSDictionary)traitCollection;
- (id)asPrivateIKJSApplication;
- (void)dispatchErrorWithMessage:(id)a3 sourceURL:(id)a4 line:(id)a5;
- (void)exitAppWithOptions:(id)a3;
- (void)launchAppWithOptions:(id)a3;
- (void)openURLWithOptions:(id)a3;
- (void)reload:(id)a3 :(id)a4;
- (void)resumeAppWithOptions:(id)a3;
- (void)suspendAppWithOptions:(id)a3;
- (void)traitCollectionChanged:(id)a3;
- (void)update;
- (void)updatedAppWithOptions:(id)a3;
@end

@implementation IKJSApplication

- (id)asPrivateIKJSApplication
{
  if ([(IKJSApplication *)self conformsToProtocol:&unk_1F3E3F938]) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return v3;
}

- (void)launchAppWithOptions:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:&v8 count:1];

  id v7 = [(IKJSObject *)self invokeMethod:@"onLaunch", v6, v8, v9 withArguments];
  kdebug_trace();
}

- (void)suspendAppWithOptions:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:&v8 count:1];

  id v7 = [(IKJSObject *)self invokeMethod:@"onSuspend", v6, v8, v9 withArguments];
}

- (void)resumeAppWithOptions:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:&v8 count:1];

  id v7 = [(IKJSObject *)self invokeMethod:@"onResume", v6, v8, v9 withArguments];
}

- (void)openURLWithOptions:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:&v8 count:1];

  id v7 = [(IKJSObject *)self invokeMethod:@"onOpenURL", v6, v8, v9 withArguments];
}

- (void)exitAppWithOptions:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:&v8 count:1];

  id v7 = [(IKJSObject *)self invokeMethod:@"onExit", v6, v8, v9 withArguments];
}

- (void)updatedAppWithOptions:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:&v8 count:1];

  id v7 = [(IKJSObject *)self invokeMethod:@"onUpdate", v6, v8, v9 withArguments];
}

- (void)traitCollectionChanged:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:&v8 count:1];

  id v7 = [(IKJSObject *)self invokeMethod:@"onTraitCollectionChange", v6, v8, v9 withArguments];
}

- (BOOL)requestDocumentWithContext:(id)a3 response:(id)a4
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F30938];
  uint64_t v9 = [(IKJSObject *)self appContext];
  v10 = [v9 jsContext];
  v11 = [v8 valueWithObject:self inContext:v10];

  int v12 = [v11 hasProperty:@"onDocumentRequest"];
  if (v12)
  {
    v13 = v6;
    if (!v6)
    {
      v13 = [MEMORY[0x1E4F1CA98] null];
    }
    v17[0] = v13;
    v17[1] = v7;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    id v15 = [(IKJSObject *)self invokeMethod:@"onDocumentRequest" withArguments:v14];

    if (!v6) {
  }
    }

  return v12;
}

- (void)dispatchErrorWithMessage:(id)a3 sourceURL:(id)a4 line:(id)a5
{
  id v15 = a4;
  id v8 = a5;
  uint64_t v9 = (void *)MEMORY[0x1E4F1CA48];
  id v10 = a3;
  v11 = [v9 arrayWithCapacity:3];
  [v11 addObject:v10];

  uint64_t v12 = [v15 length];
  if (v8 && v12)
  {
    [v11 addObject:v15];
    [v11 addObject:v8];
  }
  v13 = (void *)[v11 copy];
  id v14 = [(IKJSObject *)self invokeMethod:@"onError" withArguments:v13];
}

- (void)reload:(id)a3 :(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v13 = [v7 objectForKeyedSubscript:@"when"];
  unsigned int v8 = [v13 isEqualToString:@"onResume"];
  uint64_t v9 = [v7 objectForKeyedSubscript:@"minSuspensionTime"];

  if ([v9 length])
  {
    [v9 doubleValue];
    double v11 = v10;
  }
  else
  {
    double v11 = 0.0;
  }
  uint64_t v12 = [(IKJSObject *)self appContext];
  [v12 handleReloadWithUrgencyType:v8 minInterval:v6 data:v11];
}

- (void)update
{
  id v2 = [(IKJSObject *)self appContext];
  [v2 handleCacheUpdate];
}

- (NSDictionary)traitCollection
{
  uint64_t v7 = 0;
  unsigned int v8 = &v7;
  uint64_t v9 = 0x3032000000;
  double v10 = __Block_byref_object_copy_;
  double v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  v3 = [(IKJSObject *)self appContext];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__IKJSApplication_traitCollection__block_invoke;
  v6[3] = &unk_1E6DE3860;
  v6[4] = self;
  v6[5] = &v7;
  [v3 evaluateDelegateBlockSync:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

void __34__IKJSApplication_traitCollection__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) appContext];
  uint64_t v2 = [v5 _appTraitCollection];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

@end