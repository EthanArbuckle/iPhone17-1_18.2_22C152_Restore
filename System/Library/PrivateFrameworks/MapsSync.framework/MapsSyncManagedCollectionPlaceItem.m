@interface MapsSyncManagedCollectionPlaceItem
- (MapsSyncManagedCollectionPlaceItem)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
@end

@implementation MapsSyncManagedCollectionPlaceItem

- (MapsSyncManagedCollectionPlaceItem)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MapsSyncManagedCollectionPlaceItem();
  return [(MapsSyncManagedCollectionItem *)&v7 initWithEntity:a3 insertIntoManagedObjectContext:a4];
}

@end