@interface IMDiMessageIDSDelegateHandlerRegistry
- (BOOL)canAddCommand:(id)a3;
- (id)noopHandlerForCommand:(id)a3;
@end

@implementation IMDiMessageIDSDelegateHandlerRegistry

- (BOOL)canAddCommand:(id)a3
{
  uint64_t v3 = [a3 integerValue];

  return +[IMBlastdoor _commandReadyForBlastdoor:v3];
}

- (id)noopHandlerForCommand:(id)a3
{
  id v3 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1D982D698;
  aBlock[3] = &unk_1E6B779E8;
  id v8 = v3;
  id v4 = v3;
  v5 = _Block_copy(aBlock);

  return v5;
}

@end