@interface _FEFocusUpdateReport
- (BOOL)shouldLog;
- (_FEFocusSystem)focusSystem;
- (_FEFocusUpdateContext)context;
- (_FEFocusUpdateReport)init;
- (_FEFocusUpdateReport)initWithFocusSystem:(id)a3;
- (void)setContext:(id)a3;
@end

@implementation _FEFocusUpdateReport

- (_FEFocusUpdateReport)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"_FEFocusUpdateReport.m" lineNumber:20 description:@"-init is not a valid initializer for this class."];

  return 0;
}

- (_FEFocusUpdateReport)initWithFocusSystem:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_FEFocusUpdateReport.m", 26, @"Invalid parameter not satisfying: %@", @"focusSystem" object file lineNumber description];
  }
  v10.receiver = self;
  v10.super_class = (Class)_FEFocusUpdateReport;
  v6 = [(_FEFocusUpdateReport *)&v10 init];
  v7 = v6;
  if (v6) {
    objc_storeWeak((id *)&v6->_focusSystem, v5);
  }

  return v7;
}

- (BOOL)shouldLog
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusSystem);
  if (WeakRetained && (context = self->_context) != 0)
  {
    id v5 = context;
    BOOL v6 = [(_FEFocusUpdateContext *)v5 _isValidInFocusSystem:WeakRetained];
    v7 = [(_FEFocusUpdateContext *)v5 _validationReport];
    v8 = [(_FEFocusUpdateContext *)v5 _preferredFocusReport];

    if (v6)
    {
      BOOL v9 = 0;
    }
    else if (v7)
    {
      v11 = [v7 issues];
      if ([v11 count])
      {
        BOOL v9 = 0;
      }
      else if (v8)
      {
        BOOL v9 = [v8 messageCount] == 0;
      }
      else
      {
        BOOL v9 = 1;
      }
    }
    else if (v8)
    {
      BOOL v9 = [v8 messageCount] == 0;
    }
    else
    {
      BOOL v9 = 1;
    }
    BOOL v10 = !v9;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (_FEFocusSystem)focusSystem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusSystem);
  return (_FEFocusSystem *)WeakRetained;
}

- (_FEFocusUpdateContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_focusSystem);
}

@end