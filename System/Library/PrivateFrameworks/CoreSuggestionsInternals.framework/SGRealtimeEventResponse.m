@interface SGRealtimeEventResponse
- (NSString)templateShortName;
- (SGCuratedEventKey)duplicateEventKey;
- (SGEntity)entity;
- (SGRealtimeEventResponse)initWithEntity:(id)a3 state:(int)a4 duplicateEventKey:(id)a5 templateShortName:(id)a6;
- (id)initCancellationOfCuratedEvent:(id)a3 templateShortName:(id)a4 entity:(id)a5;
- (id)initDuplicateOfCuratedEvent:(id)a3 withEntity:(id)a4;
- (id)initExtractionExceptionWithEntity:(id)a3;
- (id)initNewEventWithEntity:(id)a3;
- (id)initUpdatedEventWithEntity:(id)a3 curatedEventKey:(id)a4;
- (int)state;
@end

@implementation SGRealtimeEventResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateShortName, 0);
  objc_storeStrong((id *)&self->_duplicateEventKey, 0);
  objc_storeStrong((id *)&self->_entity, 0);
}

- (NSString)templateShortName
{
  return self->_templateShortName;
}

- (SGCuratedEventKey)duplicateEventKey
{
  return self->_duplicateEventKey;
}

- (SGEntity)entity
{
  return self->_entity;
}

- (int)state
{
  return self->_state;
}

- (id)initExtractionExceptionWithEntity:(id)a3
{
  id v4 = a3;
  v5 = [v4 templateShortName];
  v6 = [(SGRealtimeEventResponse *)self initWithEntity:v4 state:6 duplicateEventKey:0 templateShortName:v5];

  return v6;
}

- (id)initCancellationOfCuratedEvent:(id)a3 templateShortName:(id)a4 entity:(id)a5
{
  return [(SGRealtimeEventResponse *)self initWithEntity:a5 state:3 duplicateEventKey:a3 templateShortName:a4];
}

- (id)initUpdatedEventWithEntity:(id)a3 curatedEventKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 templateShortName];
  v9 = [(SGRealtimeEventResponse *)self initWithEntity:v7 state:2 duplicateEventKey:v6 templateShortName:v8];

  return v9;
}

- (id)initDuplicateOfCuratedEvent:(id)a3 withEntity:(id)a4
{
  return [(SGRealtimeEventResponse *)self initWithEntity:a4 state:4 duplicateEventKey:a3 templateShortName:0];
}

- (id)initNewEventWithEntity:(id)a3
{
  id v4 = a3;
  v5 = [v4 templateShortName];
  id v6 = [(SGRealtimeEventResponse *)self initWithEntity:v4 state:1 duplicateEventKey:0 templateShortName:v5];

  return v6;
}

- (SGRealtimeEventResponse)initWithEntity:(id)a3 state:(int)a4 duplicateEventKey:(id)a5 templateShortName:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SGRealtimeEventResponse;
  v14 = [(SGRealtimeEventResponse *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_entity, a3);
    v15->_state = a4;
    objc_storeStrong((id *)&v15->_duplicateEventKey, a5);
    objc_storeStrong((id *)&v15->_templateShortName, a6);
  }

  return v15;
}

@end