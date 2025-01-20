@interface MetricsIdStore
- (void)storeAccountDidChange;
@end

@implementation MetricsIdStore

- (void)storeAccountDidChange
{
  uint64_t v2 = qword_1EBF31E70;
  swift_retain();
  if (v2 != -1) {
    swift_once();
  }
  unint64_t v3 = sub_1E188DD5C(MEMORY[0x1E4FBC860]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBF327B8);
  swift_allocObject();
  off_1EBF31E60 = (_UNKNOWN *)sub_1E15D6F10(v3);
  swift_release();
  swift_release();
}

@end