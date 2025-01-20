@interface GDGraphEventRelationship
- (GDGraphEntityIdentifier)eventId;
- (GDGraphEventRelationship)initWithEventIdField:(id)a3 allEventIdField:(id)a4;
- (NSArray)allEventId;
@end

@implementation GDGraphEventRelationship

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allEventId, 0);

  objc_storeStrong((id *)&self->_eventId, 0);
}

- (NSArray)allEventId
{
  return self->_allEventId;
}

- (GDGraphEntityIdentifier)eventId
{
  return self->_eventId;
}

- (GDGraphEventRelationship)initWithEventIdField:(id)a3 allEventIdField:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GDGraphEventRelationship;
  v9 = [(GDGraphEventRelationship *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_eventId, a3);
    objc_storeStrong((id *)&v10->_allEventId, a4);
  }

  return v10;
}

@end