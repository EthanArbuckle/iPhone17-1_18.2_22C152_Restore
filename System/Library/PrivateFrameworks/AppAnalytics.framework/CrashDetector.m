@interface CrashDetector
- (void)willTerminate;
@end

@implementation CrashDetector

- (void)willTerminate
{
  uint64_t v3 = qword_1EB68ACE8;
  swift_retain();
  if (v3 != -1) {
    swift_once();
  }
  id v4 = (id)qword_1EB689AA0;
  sub_1A916B3D0();
  sub_1A916AD30();

  v5 = *(void **)self->userDefaults;
  id v6 = (id)sub_1A916AF60();
  objc_msgSend(v5, sel_setBool_forKey_, 1, v6);
  swift_release();
}

@end