@interface DYEAGLFunctionPlayerOverride
- (DYEAGLFunctionPlayerOverride)init;
- (DYEAGLFunctionPlayerOverride)initWithFunctionPlayer:(id)a3 overrideKey:(id)a4;
- (DYGLFunctionPlayer)strongFunctionPlayer;
- (void)dealloc;
- (void)onPlatformFunctionEnd;
@end

@implementation DYEAGLFunctionPlayerOverride

- (DYGLFunctionPlayer)strongFunctionPlayer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_functionPlayer);

  return (DYGLFunctionPlayer *)WeakRetained;
}

- (DYEAGLFunctionPlayerOverride)init
{
  return 0;
}

- (DYEAGLFunctionPlayerOverride)initWithFunctionPlayer:(id)a3 overrideKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DYEAGLFunctionPlayerOverride;
  v8 = [(DYEAGLFunctionPlayerOverride *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_functionPlayer, v6);
    objc_storeStrong((id *)&v9->_overrideKey, a4);
    v10 = v9;
  }

  return v9;
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_functionPlayer, 0);
  v3.receiver = self;
  v3.super_class = (Class)DYEAGLFunctionPlayerOverride;
  [(DYEAGLFunctionPlayerOverride *)&v3 dealloc];
}

- (void)onPlatformFunctionEnd
{
  objc_super v3 = [(DYEAGLFunctionPlayerOverride *)self strongFunctionPlayer];
  if (*(_DWORD *)[v3 function] != -8188)
  {
    v4 = [(DYEAGLFunctionPlayerOverride *)self strongFunctionPlayer];
    if (*(_DWORD *)[v4 function] != -8192)
    {
      id v7 = [(DYEAGLFunctionPlayerOverride *)self strongFunctionPlayer];
      int v8 = *(_DWORD *)[v7 function];

      if (v8 != -8191) {
        return;
      }
      goto LABEL_5;
    }
  }
LABEL_5:
  if ([(NSString *)self->_overrideKey isEqualToString:kDYFunctionPlayerOverrideDisableColorWritesKey])
  {
    int v11 = 1;
    v5 = [(DYEAGLFunctionPlayerOverride *)self strongFunctionPlayer];
    id v6 = [v5 context];
    [v6 setParameter:602 to:&v11];
  }
  else if ([(NSString *)self->_overrideKey isEqualToString:kDYFunctionPlayerOverrideDisableAllKey])
  {
    int v10 = 3;
    v5 = [(DYEAGLFunctionPlayerOverride *)self strongFunctionPlayer];
    id v6 = [v5 context];
    [v6 setParameter:602 to:&v10];
  }
  else
  {
    if (![(NSString *)self->_overrideKey isEqualToString:kDYFunctionPlayerOverrideDisableRenderingKey])return; {
    int v9 = 2;
    }
    v5 = [(DYEAGLFunctionPlayerOverride *)self strongFunctionPlayer];
    id v6 = [v5 context];
    [v6 setParameter:602 to:&v9];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideKey, 0);

  objc_destroyWeak((id *)&self->_functionPlayer);
}

@end