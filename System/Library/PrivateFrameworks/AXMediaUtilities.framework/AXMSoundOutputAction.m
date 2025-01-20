@interface AXMSoundOutputAction
+ (id)_soundFileURLForSoundID:(id)a3;
- (AXMSoundOutputAction)initWithSoundID:(id)a3;
- (AXMSoundOutputAction)initWithURL:(id)a3;
- (NSString)soundID;
- (NSURL)soundFileURL;
- (id)_initWithSoundID:(id)a3 handle:(id)a4;
- (id)_initWithURL:(id)a3 handle:(id)a4;
@end

@implementation AXMSoundOutputAction

+ (id)_soundFileURLForSoundID:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a3;
  v5 = [v3 bundleForClass:objc_opt_class()];
  v6 = [v5 URLForResource:v4 withExtension:@"aiff" subdirectory:@"sounds"];

  return v6;
}

- (id)_initWithURL:(id)a3 handle:(id)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AXMSoundOutputAction;
  v8 = [(AXMOutputAction *)&v13 _initWithHandle:a4];
  if (v8)
  {
    v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    v10 = [v7 path];
    char v11 = [v9 fileExistsAtPath:v10];

    if (v11)
    {
      objc_storeStrong(v8 + 3, a3);
    }
    else
    {

      v8 = 0;
    }
  }
  return v8;
}

- (id)_initWithSoundID:(id)a3 handle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[AXMSoundOutputAction _soundFileURLForSoundID:v6];
  if (v8)
  {
    v9 = [(AXMSoundOutputAction *)self _initWithURL:v8 handle:v7];
    v10 = (AXMSoundOutputAction *)v6;
    self = v9[2];
    v9[2] = v10;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (AXMSoundOutputAction)initWithURL:(id)a3
{
  return (AXMSoundOutputAction *)[(AXMSoundOutputAction *)self _initWithURL:a3 handle:0];
}

- (AXMSoundOutputAction)initWithSoundID:(id)a3
{
  return (AXMSoundOutputAction *)[(AXMSoundOutputAction *)self _initWithSoundID:a3 handle:0];
}

- (NSURL)soundFileURL
{
  return self->_soundFileURL;
}

- (NSString)soundID
{
  return self->_soundID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_soundFileURL, 0);

  objc_storeStrong((id *)&self->_soundID, 0);
}

@end