@interface PeoplePickerHostConnection
- (void)checkIn:(id)a3 reply:(id)a4;
- (void)updateActivity:(id)a3;
@end

@implementation PeoplePickerHostConnection

- (void)checkIn:(id)a3 reply:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  specialized PeoplePickerHostConnection.checkIn(_:reply:)((uint64_t)v7, (uint64_t)v8, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)updateActivity:(id)a3
{
  v5 = (char *)self + direct field offset for PeoplePickerHostConnection.delegate;
  swift_beginAccess();
  if (MEMORY[0x1B3EA3B30](v5))
  {
    uint64_t v6 = *((void *)v5 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v8 = *(void (**)(id, uint64_t, uint64_t))(v6 + 24);
    id v9 = a3;
    v10 = self;
    v8(a3, ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

@end