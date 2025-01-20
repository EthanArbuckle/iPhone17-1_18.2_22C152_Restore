@interface DDObjcCompatibility
+ (BOOL)swiftUpdateLocalUsersAndGroupsAndReturnError:(id *)a3 perform:(id)a4;
+ (void)swiftInitializeLocalUsersAndGroupsAndPerform:(id)a3;
- (DDObjcCompatibility)init;
@end

@implementation DDObjcCompatibility

+ (void)swiftInitializeLocalUsersAndGroupsAndPerform:(id)a3
{
  v3 = _Block_copy(a3);
  v4 = _Block_copy(v3);
  v5[2] = v4;
  if (qword_2697F8F00 != -1) {
    swift_once();
  }
  sub_24C8B2DF4((void (*)(unint64_t *, unint64_t *))sub_24C8B3A84, (unint64_t)v5, (uint64_t)qword_2697F9228);
  _Block_release(v4);
  _Block_release(v3);
}

+ (BOOL)swiftUpdateLocalUsersAndGroupsAndReturnError:(id *)a3 perform:(id)a4
{
  v4 = _Block_copy(a4);
  v5 = _Block_copy(v4);
  _Block_copy(v5);
  if (qword_2697F8F00 != -1) {
    swift_once();
  }
  v7[3] = &type metadata for ProviderSideEffects;
  v7[4] = &off_26FEFB548;
  v7[0] = swift_allocObject();
  sub_24C8B37CC((uint64_t)qword_2697F9228, v7[0] + 16);
  sub_24C8DA2D0(v7, v5);
  _Block_release(v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  _Block_release(v5);
  _Block_release(v4);
  return 1;
}

- (DDObjcCompatibility)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(DDObjcCompatibility *)&v3 init];
}

@end