@interface StoredPayload
- (StoredPayload)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
@end

@implementation StoredPayload

- (StoredPayload)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for StoredPayload();
  return [(StoredPayload *)&v7 initWithEntity:a3 insertIntoManagedObjectContext:a4];
}

@end