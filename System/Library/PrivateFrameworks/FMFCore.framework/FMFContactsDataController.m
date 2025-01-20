@interface FMFContactsDataController
- (void)contactStoreChangedWithNotification:(id)a3;
@end

@implementation FMFContactsDataController

- (void)contactStoreChangedWithNotification:(id)a3
{
  if (MEMORY[0x21D4B6C80](&self->delegate[7], a2))
  {
    uint64_t v5 = *(void *)&self->delegate[15];
    uint64_t ObjectType = swift_getObjectType();
    v7 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
    id v8 = a3;
    swift_retain();
    v7(ObjectType, v5);

    swift_release();
    swift_unknownObjectRelease();
  }
}

@end