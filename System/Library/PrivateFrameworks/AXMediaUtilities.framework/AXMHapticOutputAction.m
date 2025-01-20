@interface AXMHapticOutputAction
- (AXMHapticOutputAction)initWithURL:(id)a3;
- (NSURL)hapticFileURL;
- (double)hapticIntensity;
- (id)_initWithURL:(id)a3 handle:(id)a4;
- (void)setHapticIntensity:(double)a3;
@end

@implementation AXMHapticOutputAction

- (AXMHapticOutputAction)initWithURL:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(AXMActiveSoundOutputActionHandle);
  v6 = [(AXMHapticOutputAction *)self _initWithURL:v4 handle:v5];

  return v6;
}

- (id)_initWithURL:(id)a3 handle:(id)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AXMHapticOutputAction;
  v8 = [(AXMOutputAction *)&v13 _initWithHandle:a4];
  if (v8)
  {
    v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    v10 = [v7 path];
    char v11 = [v9 fileExistsAtPath:v10];

    if (v11)
    {
      objc_storeStrong(v8 + 2, a3);
    }
    else
    {

      v8 = 0;
    }
  }
  return v8;
}

- (NSURL)hapticFileURL
{
  return self->_hapticFileURL;
}

- (double)hapticIntensity
{
  return self->_hapticIntensity;
}

- (void)setHapticIntensity:(double)a3
{
  self->_hapticIntensity = a3;
}

- (void).cxx_destruct
{
}

@end