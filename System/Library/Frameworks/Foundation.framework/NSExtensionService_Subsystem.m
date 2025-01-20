@interface NSExtensionService_Subsystem
+ (id)initForPlugInKit;
+ (id)sharedInstance;
- (void)beginUsing:(id)a3 withBundle:(id)a4;
@end

@implementation NSExtensionService_Subsystem

+ (id)sharedInstance
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__NSExtensionService_Subsystem_sharedInstance__block_invoke;
  v3[3] = &unk_1E51F71D0;
  v3[4] = a1;
  if (qword_1EB1EDF08 != -1) {
    dispatch_once(&qword_1EB1EDF08, v3);
  }
  return (id)qword_1EB1EDF00;
}

+ (id)initForPlugInKit
{
  return +[NSExtensionService_Subsystem sharedInstance];
}

- (void)beginUsing:(id)a3 withBundle:(id)a4
{
}

@end