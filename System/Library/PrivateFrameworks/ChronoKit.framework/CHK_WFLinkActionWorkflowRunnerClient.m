@interface CHK_WFLinkActionWorkflowRunnerClient
+ (id)newClientWithLinkAction:(id)a3 appBundleIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 runSource:(int64_t)a6 launchOriginOverride:(id)a7 authenticationPolicy:(int64_t)a8;
@end

@implementation CHK_WFLinkActionWorkflowRunnerClient

+ (id)newClientWithLinkAction:(id)a3 appBundleIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 runSource:(int64_t)a6 launchOriginOverride:(id)a7 authenticationPolicy:(int64_t)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2050000000;
  v17 = (void *)getWFLinkActionWorkflowRunnerClientClass_softClass;
  uint64_t v25 = getWFLinkActionWorkflowRunnerClientClass_softClass;
  if (!getWFLinkActionWorkflowRunnerClientClass_softClass)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __getWFLinkActionWorkflowRunnerClientClass_block_invoke;
    v21[3] = &unk_1E6BDA940;
    v21[4] = &v22;
    __getWFLinkActionWorkflowRunnerClientClass_block_invoke((uint64_t)v21);
    v17 = (void *)v23[3];
  }
  v18 = v17;
  _Block_object_dispose(&v22, 8);
  v19 = (void *)[[v18 alloc] initWithLinkAction:v13 appBundleIdentifier:v14 extensionBundleIdentifier:v15 runSource:a6 runSourceOverride:v16 authenticationPolicy:a8];

  return v19;
}

@end