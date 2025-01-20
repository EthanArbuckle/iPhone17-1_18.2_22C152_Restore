@interface WFHandoffAction
- (void)runWithInput:(id)a3 error:(id *)a4;
@end

@implementation WFHandoffAction

- (void)runWithInput:(id)a3 error:(id *)a4
{
  v6 = [(WFHandoffAction *)self runningDelegate];
  char v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0
    || ([(WFHandoffAction *)self runningDelegate],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [(id)v8 currentRunningContextForAction:self],
        v9 = objc_claimAutoreleasedReturnValue(),
        (id)v8,
        LOBYTE(v8) = [v9 isShortcutsApp],
        v9,
        (v8 & 1) == 0))
  {
    v10 = [(WFHandoffAction *)self userInterface];
    int v11 = [v10 isRunningWithSiriUI];

    if (v11)
    {
      *a4 = [MEMORY[0x263F087E8] wfUnsupportedUserInterfaceError];
    }
  }
}

@end