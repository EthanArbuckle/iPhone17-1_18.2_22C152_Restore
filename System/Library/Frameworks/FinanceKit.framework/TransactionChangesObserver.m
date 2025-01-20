@interface TransactionChangesObserver
- (void)contextDidMergeChangesObjectIDsNotificationWithNotification:(id)a3;
@end

@implementation TransactionChangesObserver

- (void)contextDidMergeChangesObjectIDsNotificationWithNotification:(id)a3
{
  id v4 = a3;
  swift_retain();
  if ((sub_243684460(v4) & 1) != 0 && MEMORY[0x245680210](self->delegate))
  {
    uint64_t v5 = *(void *)&self->delegate[8];
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(ObjectType, v5);

    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {

    swift_release();
  }
}

@end