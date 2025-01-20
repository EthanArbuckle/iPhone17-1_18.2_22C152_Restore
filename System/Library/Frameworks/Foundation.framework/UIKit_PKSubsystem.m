@interface UIKit_PKSubsystem
+ (id)initForPlugInKit;
+ (id)initForPlugInKitWithOptions:(id)a3;
+ (id)sharedInstance;
- (BOOL)isPlugInKitProcess;
- (NSDictionary)infoDictionary;
- (void)beginUsing:(id)a3 withBundle:(id)a4;
- (void)dealloc;
- (void)setInfoDictionary:(id)a3;
- (void)setPlugInKitProcess:(BOOL)a3;
@end

@implementation UIKit_PKSubsystem

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)UIKit_PKSubsystem;
  [(UIKit_PKSubsystem *)&v3 dealloc];
}

- (void)beginUsing:(id)a3 withBundle:(id)a4
{
  block[6] = *MEMORY[0x1E4F143B8];
  v6 = +[NSExtension globalStateQueueForExtension:](NSExtension, "globalStateQueueForExtension:", 0, a4);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__UIKit_PKSubsystem_beginUsing_withBundle___block_invoke;
  block[3] = &unk_1E51F6678;
  block[4] = self;
  block[5] = a3;
  dispatch_async(v6, block);
}

+ (id)sharedInstance
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __35__UIKit_PKSubsystem_sharedInstance__block_invoke;
  v3[3] = &unk_1E51F71D0;
  v3[4] = a1;
  if (qword_1EB1EDEF8 != -1) {
    dispatch_once(&qword_1EB1EDEF8, v3);
  }
  return (id)_MergedGlobals_154;
}

+ (id)initForPlugInKitWithOptions:(id)a3
{
  return +[UIKit_PKSubsystem initForPlugInKit];
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

@end