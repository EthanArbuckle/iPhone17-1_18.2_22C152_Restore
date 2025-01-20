@interface EXUIKit_Subsystem
+ (id)initForPlugInKit;
+ (id)initForPlugInKitWithOptions:(id)a3;
+ (id)sharedInstance;
- (BOOL)isPlugInKitProcess;
- (NSDictionary)infoDictionary;
- (void)beginUsing:(id)a3 withBundle:(id)a4;
- (void)setInfoDictionary:(id)a3;
- (void)setPlugInKitProcess:(BOOL)a3;
@end

@implementation EXUIKit_Subsystem

- (void)beginUsing:(id)a3 withBundle:(id)a4
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28C70] globalStateQueueForExtension:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__EXUIKit_Subsystem_beginUsing_withBundle___block_invoke;
  v8[3] = &unk_1E573CDD8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__EXUIKit_Subsystem_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_once_0 != -1) {
    dispatch_once(&sharedInstance_once_0, block);
  }
  v2 = (void *)sharedInstance___instance;

  return v2;
}

+ (id)initForPlugInKitWithOptions:(id)a3
{
  return +[EXUIKit_Subsystem initForPlugInKit];
}

+ (id)initForPlugInKit
{
  id result = (id)[a1 sharedInstance];
  *((unsigned char *)result + 9) = 1;
  return result;
}

- (NSDictionary)infoDictionary
{
  return self->_infoDictionary;
}

- (void)setInfoDictionary:(id)a3
{
}

- (BOOL)isPlugInKitProcess
{
  return self->_plugInKitProcess;
}

- (void)setPlugInKitProcess:(BOOL)a3
{
  self->_plugInKitProcess = a3;
}

- (void).cxx_destruct
{
}

@end