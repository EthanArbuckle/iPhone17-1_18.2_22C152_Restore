@interface FBSystemShellInitializationContext
- (BOOL)wasBootedDark;
- (FBSystemShellInitializationOptions)options;
- (id)_initWithOptions:(id)a3;
- (unint64_t)lastExitReason;
@end

@implementation FBSystemShellInitializationContext

- (id)_initWithOptions:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FBSystemShellInitializationContext;
  v6 = [(FBSystemShellInitializationContext *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_options, a3);
    v8 = objc_alloc_init(_FBDarkBootHelper);
    v7->_bootedDark = [(_FBDarkBootHelper *)v8 isBootingDark];
  }
  return v7;
}

- (unint64_t)lastExitReason
{
  v2 = [MEMORY[0x1E4F963E8] currentProcess];
  v3 = [v2 lastExitContext];

  if (v3)
  {
    v4 = [[FBProcessExitContext alloc] initWithUnderlyingContext:v3];
    unint64_t v5 = [(FBProcessExitContext *)v4 exitReason];
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)wasBootedDark
{
  return self->_bootedDark;
}

- (FBSystemShellInitializationOptions)options
{
  return self->_options;
}

- (void).cxx_destruct
{
}

@end