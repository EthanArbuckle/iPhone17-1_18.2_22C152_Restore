@interface MSReadTriageAction
- (BOOL)flagState;
- (id)messageFlags;
- (void)_toggleFlagWithBuilder:(id)a3;
@end

@implementation MSReadTriageAction

- (BOOL)flagState
{
  v3 = [(MSTriageAction *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && [v3 shouldOverrideFlageStateForTriageAction:self])
  {
    char v4 = [v3 overrideFlagStateForTriageAction:self];
  }
  else
  {
    v5 = [(MSReadTriageAction *)self messageFlags];
    char v4 = [v5 read];
  }
  return v4;
}

- (id)messageFlags
{
  v2 = (void *)MEMORY[0x1E4F60320];
  v3 = [(MSTriageAction *)self messageListItemSelection];
  char v4 = [v3 messageListItems];
  v5 = [v2 combinedFlagsForMessageListItems:v4 forDisplay:0];

  return v5;
}

- (void)_toggleFlagWithBuilder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "changesReadTo:", -[MSReadTriageAction flagState](self, "flagState") ^ 1);
}

@end