@interface NSManagedObjectContext
- (id)addObjectsDidChangeNotificationObserver:(id)a3;
@end

@implementation NSManagedObjectContext

- (id)addObjectsDidChangeNotificationObserver:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  id v7 = sub_100098754((uint64_t)sub_1000767C4, v5);

  swift_release();

  return v7;
}

@end