@interface DIUtilities
+ (void)onQueue:(id)a3 block:(id)a4;
@end

@implementation DIUtilities

+ (void)onQueue:(id)a3 block:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  _Block_copy(v5);
  id v7 = a3;
  sub_24D033358(a3, ObjCClassMetadata, (void (**)(void))v5);
  _Block_release(v5);
}

@end