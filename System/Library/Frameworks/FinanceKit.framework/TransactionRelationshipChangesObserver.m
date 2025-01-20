@interface TransactionRelationshipChangesObserver
- (void)contextDidChangeNotificationWithNotification:(id)a3;
- (void)contextWillSaveNotificationWithNotification:(id)a3;
@end

@implementation TransactionRelationshipChangesObserver

- (void)contextDidChangeNotificationWithNotification:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_2437D4018(v3);

  swift_release();
}

- (void)contextWillSaveNotificationWithNotification:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_2437D7F78();

  swift_release();
}

@end