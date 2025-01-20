@interface APCDefaults
+ (BOOL)BOOLForDefault:(unint64_t)a3;
+ (float)floatForDefault:(unint64_t)a3;
+ (id)sharedDefaults;
+ (int64_t)integerForDefault:(unint64_t)a3;
@end

@implementation APCDefaults

+ (id)sharedDefaults
{
  if (+[APCDefaults sharedDefaults]::onceToken != -1) {
    dispatch_once(&+[APCDefaults sharedDefaults]::onceToken, &__block_literal_global);
  }
  v2 = (void *)_defaults;

  return v2;
}

uint64_t __29__APCDefaults_sharedDefaults__block_invoke()
{
  _defaults = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.audiopasscode"];

  return MEMORY[0x270F9A758]();
}

+ (BOOL)BOOLForDefault:(unint64_t)a3
{
  v4 = [a1 sharedDefaults];
  if (a3)
  {
    char v5 = 0;
  }
  else
  {
    v6 = [NSString stringWithUTF8String:"volume"];
    v7 = [v4 objectForKey:v6];

    if (v7)
    {
      v8 = [NSString stringWithUTF8String:"volume"];
      char v5 = [v4 BOOLForKey:v8];
    }
    else
    {
      char v5 = 1;
    }
  }

  return v5;
}

+ (int64_t)integerForDefault:(unint64_t)a3
{
  v4 = [a1 sharedDefaults];
  if (a3)
  {
    char v5 = 0;
  }
  else
  {
    v6 = [NSString stringWithUTF8String:"volume"];
    char v5 = [v4 objectForKey:v6];

    if (v5)
    {
      v7 = [NSString stringWithUTF8String:"volume"];
      char v5 = (void *)[v4 integerForKey:v7];
    }
  }

  return (int64_t)v5;
}

+ (float)floatForDefault:(unint64_t)a3
{
  v4 = [a1 sharedDefaults];
  float v5 = 0.0;
  if (!a3)
  {
    v6 = [NSString stringWithUTF8String:"volume"];
    v7 = [v4 objectForKey:v6];

    if (v7)
    {
      v8 = [NSString stringWithUTF8String:"volume"];
      [v4 floatForKey:v8];
      float v5 = v9;
    }
    else
    {
      uint64_t v10 = MGGetProductType();
      float v11 = 0.56;
      if (v10 == 2903084588) {
        float v11 = 1.0;
      }
      if (v10 == 3348380076) {
        float v5 = 0.75;
      }
      else {
        float v5 = v11;
      }
    }
  }

  return v5;
}

@end