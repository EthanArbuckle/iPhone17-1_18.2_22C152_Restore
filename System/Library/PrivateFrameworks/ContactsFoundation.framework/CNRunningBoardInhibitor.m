@interface CNRunningBoardInhibitor
@end

@implementation CNRunningBoardInhibitor

uint64_t __34___CNRunningBoardInhibitor_os_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts", "running-board-inhibitor");
  uint64_t v1 = os_log_cn_once_object_1_16;
  os_log_cn_once_object_1_16 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

void __33___CNRunningBoardInhibitor_start__block_invoke()
{
  v18[2] = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2050000000;
  os_log_t v0 = (void *)getRBSDomainAttributeClass_softClass;
  uint64_t v17 = getRBSDomainAttributeClass_softClass;
  if (!getRBSDomainAttributeClass_softClass)
  {
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __getRBSDomainAttributeClass_block_invoke;
    v12 = &unk_1E569FC28;
    v13 = &v14;
    __getRBSDomainAttributeClass_block_invoke((uint64_t)&v9);
    os_log_t v0 = (void *)v15[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v14, 8);
  v2 = [v1 attributeWithDomain:@"com.apple.common" name:@"FinishTaskUninterruptable"];
  v18[0] = v2;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2050000000;
  v3 = (void *)getRBSAcquisitionCompletionAttributeClass_softClass;
  uint64_t v17 = getRBSAcquisitionCompletionAttributeClass_softClass;
  if (!getRBSAcquisitionCompletionAttributeClass_softClass)
  {
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __getRBSAcquisitionCompletionAttributeClass_block_invoke;
    v12 = &unk_1E569FC28;
    v13 = &v14;
    __getRBSAcquisitionCompletionAttributeClass_block_invoke((uint64_t)&v9);
    v3 = (void *)v15[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v14, 8);
  v5 = [v4 attributeWithCompletionPolicy:1];
  v18[1] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  uint64_t v7 = [v6 copy];
  v8 = (void *)start_cn_once_object_3;
  start_cn_once_object_3 = v7;
}

void __46___CNRunningBoardInhibitor_runningBoardTarget__block_invoke()
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2050000000;
  os_log_t v0 = (void *)getRBSTargetClass_softClass;
  uint64_t v8 = getRBSTargetClass_softClass;
  if (!getRBSTargetClass_softClass)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __getRBSTargetClass_block_invoke;
    v4[3] = &unk_1E569FC28;
    v4[4] = &v5;
    __getRBSTargetClass_block_invoke((uint64_t)v4);
    os_log_t v0 = (void *)v6[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v5, 8);
  uint64_t v2 = [v1 currentProcess];
  v3 = (void *)runningBoardTarget_cn_once_object_5;
  runningBoardTarget_cn_once_object_5 = v2;
}

@end