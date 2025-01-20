@interface MSFlagTriageAction
- (BOOL)_isFlagged;
- (BOOL)flagState;
- (NSNumber)flagColor;
- (unint64_t)cachedFlagState;
- (void)_toggleCachedFlagState;
- (void)_toggleFlagWithBuilder:(id)a3;
- (void)setCachedFlagState:(unint64_t)a3;
- (void)setFlagColor:(id)a3;
@end

@implementation MSFlagTriageAction

- (BOOL)flagState
{
  if (![(MSFlagTriageAction *)self cachedFlagState])
  {
    v3 = [(MSTriageAction *)self delegate];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (objc_opt_respondsToSelector() & 1) != 0
      && [v3 shouldOverrideFlageStateForTriageAction:self])
    {
      if (![v3 overrideFlagStateForTriageAction:self])
      {
LABEL_10:
        uint64_t v9 = 2;
        goto LABEL_11;
      }
    }
    else
    {
      v4 = [(MSTriageAction *)self messageListItemSelection];
      char v5 = [v4 isSelectAll];

      if (v5) {
        goto LABEL_10;
      }
      v6 = [(MSTriageAction *)self messageListItemSelection];
      v7 = [v6 messageListItems];
      char v8 = objc_msgSend(v7, "ef_any:", &__block_literal_global_4);

      if ((v8 & 1) == 0) {
        goto LABEL_10;
      }
    }
    uint64_t v9 = 1;
LABEL_11:
    [(MSFlagTriageAction *)self setCachedFlagState:v9];
  }
  return [(MSFlagTriageAction *)self cachedFlagState] == 2;
}

uint64_t __31__MSFlagTriageAction_flagState__block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasUnflagged];
}

- (NSNumber)flagColor
{
  if (!self->_flagColor && ![(MSFlagTriageAction *)self flagState])
  {
    v3 = [(MSTriageAction *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v3, "defaultFlagColorForTriageAction:", self));
      v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
  }
  v4 = self->_flagColor;
LABEL_7:
  return v4;
}

- (BOOL)_isFlagged
{
  v2 = [(MSFlagTriageAction *)self flagColor];
  v3 = v2;
  if (v2)
  {
    [v2 unsignedIntegerValue];
    BOOL v4 = (unint64_t)[v3 unsignedIntegerValue] < 7;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)_toggleCachedFlagState
{
  if ([(MSFlagTriageAction *)self cachedFlagState] == 2)
  {
    uint64_t v3 = 1;
  }
  else
  {
    if ([(MSFlagTriageAction *)self cachedFlagState] != 1) {
      return;
    }
    uint64_t v3 = 2;
  }
  [(MSFlagTriageAction *)self setCachedFlagState:v3];
}

- (void)_toggleFlagWithBuilder:(id)a3
{
  id v6 = a3;
  BOOL v4 = [(MSFlagTriageAction *)self _isFlagged];
  [v6 changesFlaggedTo:v4];
  if (v4)
  {
    char v5 = [(MSFlagTriageAction *)self flagColor];
    objc_msgSend(v6, "changesFlagColorTo:", objc_msgSend(v5, "unsignedIntegerValue"));
  }
  [(MSFlagTriageAction *)self _toggleCachedFlagState];
}

- (void)setFlagColor:(id)a3
{
}

- (unint64_t)cachedFlagState
{
  return self->_cachedFlagState;
}

- (void)setCachedFlagState:(unint64_t)a3
{
  self->_cachedFlagState = a3;
}

- (void).cxx_destruct
{
}

@end