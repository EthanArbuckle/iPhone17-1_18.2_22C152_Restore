@interface MapsSyncManagedHistoryPlaceItem
- (MapsSyncManagedHistoryPlaceItem)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
@end

@implementation MapsSyncManagedHistoryPlaceItem

- (MapsSyncManagedHistoryPlaceItem)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MapsSyncManagedHistoryPlaceItem();
  return [(MapsSyncManagedHistoryItem *)&v7 initWithEntity:a3 insertIntoManagedObjectContext:a4];
}

@end