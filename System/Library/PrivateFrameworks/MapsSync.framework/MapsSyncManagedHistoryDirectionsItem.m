@interface MapsSyncManagedHistoryDirectionsItem
- (MapsSyncManagedHistoryDirectionsItem)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
@end

@implementation MapsSyncManagedHistoryDirectionsItem

- (MapsSyncManagedHistoryDirectionsItem)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MapsSyncManagedHistoryDirectionsItem();
  return [(MapsSyncManagedHistoryItem *)&v7 initWithEntity:a3 insertIntoManagedObjectContext:a4];
}

@end