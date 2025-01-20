@interface MFDataDetectors
+ (BOOL)urlIfyNode:(id)a3;
+ (BOOL)urlIfyNode:(id)a3 phoneNumberTypes:(unint64_t)a4;
+ (Class)_DDURLifierClass;
+ (id)sharedDetectionController;
+ (id)urlMatchesForString:(id)a3;
+ (id)urlMatchesForString:(id)a3 includingTel:(BOOL)a4;
@end

@implementation MFDataDetectors

+ (id)sharedDetectionController
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (sharedDetectionController__DDDetectionControllerClass)
  {
    v2 = [(id)sharedDetectionController__DDDetectionControllerClass sharedController];
  }
  else
  {
    v3 = self;
    uint64_t v4 = objc_sync_enter(v3);
    if ((sharedDetectionController_inited & 1) == 0)
    {
      sharedDetectionController_inited = 1;
      v5 = MEMORY[0x1B3E868F0](v4);
      v6 = [v5 stringByAppendingPathComponent:@"/System/Library/PrivateFrameworks/DataDetectorsUI.framework/DataDetectorsUI"];

      id v7 = v6;
      if (dlopen((const char *)[v7 fileSystemRepresentation], 4))
      {
        sharedDetectionController__DDDetectionControllerClass = (uint64_t)NSClassFromString(&cfstr_Dddetectioncon.isa);
      }
      else
      {
        v8 = MFLogGeneral();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int v10 = 136315138;
          v11 = dlerror();
          _os_log_impl(&dword_1AF945000, v8, OS_LOG_TYPE_DEFAULT, "#Warning Failed to load DataDetectorsUI.framework (%s)", (uint8_t *)&v10, 0xCu);
        }
      }
    }
    objc_sync_exit(v3);

    v2 = [(id)sharedDetectionController__DDDetectionControllerClass sharedController];
  }

  return v2;
}

+ (Class)_DDURLifierClass
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = (void *)_DDURLifierClass__DDURLifierClass;
  if (!_DDURLifierClass__DDURLifierClass)
  {
    v3 = self;
    uint64_t v4 = objc_sync_enter(v3);
    if ((_DDURLifierClass_inited & 1) == 0)
    {
      _DDURLifierClass_inited = 1;
      v5 = MEMORY[0x1B3E868F0](v4);
      v6 = [v5 stringByAppendingPathComponent:@"/System/Library/PrivateFrameworks/DataDetectorsCore.framework/DataDetectorsCore"];

      id v7 = v6;
      if (dlopen((const char *)[v7 fileSystemRepresentation], 4))
      {
        _DDURLifierClass__DDURLifierClass = (uint64_t)NSClassFromString(&cfstr_Ddurlifier.isa);
      }
      else
      {
        v8 = MFLogGeneral();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int v11 = 136315138;
          uint64_t v12 = dlerror();
          _os_log_impl(&dword_1AF945000, v8, OS_LOG_TYPE_DEFAULT, "#Warning Failed to load DataDetectorsCore.framework (%s)", (uint8_t *)&v11, 0xCu);
        }
      }
    }
    objc_sync_exit(v3);

    v2 = (void *)_DDURLifierClass__DDURLifierClass;
  }
  id v9 = v2;

  return (Class)v9;
}

+ (id)urlMatchesForString:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend((id)objc_msgSend(a1, "_DDURLifierClass"), "urlMatchesForString:", v4);

  return v5;
}

+ (id)urlMatchesForString:(id)a3 includingTel:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = objc_msgSend((id)objc_msgSend(a1, "_DDURLifierClass"), "urlMatchesForString:includingTel:", v6, v4);

  return v7;
}

+ (BOOL)urlIfyNode:(id)a3
{
  id v4 = a3;
  LOBYTE(a1) = objc_msgSend((id)objc_msgSend(a1, "_DDURLifierClass"), "urlIfyNode:", v4);

  return (char)a1;
}

+ (BOOL)urlIfyNode:(id)a3 phoneNumberTypes:(unint64_t)a4
{
  id v6 = a3;
  LOBYTE(a4) = objc_msgSend((id)objc_msgSend(a1, "_DDURLifierClass"), "urlIfyNode:phoneNumberTypes:", v6, a4);

  return a4;
}

@end