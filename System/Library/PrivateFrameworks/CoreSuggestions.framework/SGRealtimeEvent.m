@interface SGRealtimeEvent
+ (BOOL)supportsSecureCoding;
+ (id)realtimeEventForCanceledEvent:(id)a3 eventIdentifier:(id)a4;
+ (id)realtimeEventForCanceledEvent:(id)a3 eventIdentifier:(id)a4 harvested:(BOOL)a5;
+ (id)realtimeEventForDuplicateEvent:(id)a3 eventIdentifier:(id)a4;
+ (id)realtimeEventForDuplicateEvent:(id)a3 eventIdentifier:(id)a4 harvested:(BOOL)a5;
+ (id)realtimeEventForExtractionExceptionWithSourceMessageId:(id)a3;
+ (id)realtimeEventForNearDuplicateEvent:(id)a3;
+ (id)realtimeEventForNearDuplicateEvent:(id)a3 harvested:(BOOL)a4;
+ (id)realtimeEventForNewEvent:(id)a3;
+ (id)realtimeEventForNewEvent:(id)a3 harvested:(BOOL)a4;
+ (id)realtimeEventUpdateToEvent:(id)a3 withNewValues:(id)a4;
+ (id)realtimeEventUpdateToEvent:(id)a3 withNewValues:(id)a4 harvested:(BOOL)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRealtimeEvent:(id)a3;
- (BOOL)isHarvested;
- (NSString)description;
- (NSString)eventIdentifier;
- (NSString)sourceMessageId;
- (SGEvent)event;
- (SGRealtimeEvent)initWithCoder:(id)a3;
- (SGRealtimeEvent)initWithState:(int)a3 event:(id)a4 eventIdentifier:(id)a5 harvested:(BOOL)a6;
- (SGRealtimeEvent)initWithState:(int)a3 event:(id)a4 eventIdentifier:(id)a5 harvested:(BOOL)a6 sourceMessageId:(id)a7;
- (int)state;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SGRealtimeEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceMessageId, 0);
  objc_storeStrong((id *)&self->_eventIdentifier, 0);

  objc_storeStrong((id *)&self->_event, 0);
}

- (BOOL)isHarvested
{
  return self->_isHarvested;
}

- (NSString)sourceMessageId
{
  return self->_sourceMessageId;
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (SGEvent)event
{
  return self->_event;
}

- (int)state
{
  return self->_state;
}

- (NSString)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<SGRealtimeEvent state=%i eventId='%@'\nevent = %@\n>", self->_state, self->_eventIdentifier, self->_event];

  return (NSString *)v2;
}

- (unint64_t)hash
{
  return [(NSString *)self->_eventIdentifier hash];
}

- (BOOL)isEqualToRealtimeEvent:(id)a3
{
  v4 = (id *)a3;
  int state = self->_state;
  if (state != [v4 state]) {
    goto LABEL_13;
  }
  eventIdentifier = self->_eventIdentifier;
  v7 = (NSString *)v4[3];
  if (eventIdentifier == v7)
  {
  }
  else
  {
    v8 = v7;
    v9 = eventIdentifier;
    char v10 = [(NSString *)v9 isEqual:v8];

    if ((v10 & 1) == 0) {
      goto LABEL_13;
    }
  }
  event = self->_event;
  v12 = (SGEvent *)v4[2];
  if (event == v12)
  {
  }
  else
  {
    v13 = v12;
    v14 = event;
    BOOL v15 = [(SGEvent *)v14 isEqual:v13];

    if (!v15) {
      goto LABEL_13;
    }
  }
  int isHarvested = self->_isHarvested;
  if (isHarvested != [v4 isHarvested])
  {
LABEL_13:
    char v19 = 0;
    goto LABEL_14;
  }
  v17 = self->_sourceMessageId;
  v18 = v17;
  if (v17 == v4[4]) {
    char v19 = 1;
  }
  else {
    char v19 = -[NSString isEqual:](v17, "isEqual:");
  }

LABEL_14:
  return v19;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SGRealtimeEvent *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGRealtimeEvent *)self isEqualToRealtimeEvent:v5];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t state = self->_state;
  id v5 = a3;
  [v5 encodeInt32:state forKey:@"state"];
  [v5 encodeObject:self->_event forKey:@"event"];
  [v5 encodeObject:self->_eventIdentifier forKey:@"eventIdentifier"];
  [v5 encodeBool:self->_isHarvested forKey:@"isHarvested"];
  [v5 encodeObject:self->_sourceMessageId forKey:@"sourceMessageId"];
}

- (SGRealtimeEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SGRealtimeEvent;
  id v5 = [(SGRealtimeEvent *)&v16 init];
  if (v5)
  {
    v5->_uint64_t state = [v4 decodeInt32ForKey:@"state"];
    BOOL v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"event"];
    event = v5->_event;
    v5->_event = (SGEvent *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"eventIdentifier"];
    eventIdentifier = v5->_eventIdentifier;
    v5->_eventIdentifier = (NSString *)v10;

    v5->_int isHarvested = [v4 decodeBoolForKey:@"isHarvested"];
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"sourceMessageId"];
    sourceMessageId = v5->_sourceMessageId;
    v5->_sourceMessageId = (NSString *)v13;
  }
  return v5;
}

- (SGRealtimeEvent)initWithState:(int)a3 event:(id)a4 eventIdentifier:(id)a5 harvested:(BOOL)a6 sourceMessageId:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)SGRealtimeEvent;
  objc_super v16 = [(SGRealtimeEvent *)&v19 init];
  v17 = v16;
  if (v16)
  {
    v16->_uint64_t state = a3;
    objc_storeStrong((id *)&v16->_event, a4);
    objc_storeStrong((id *)&v17->_eventIdentifier, a5);
    v17->_int isHarvested = a6;
    objc_storeStrong((id *)&v17->_sourceMessageId, a7);
  }

  return v17;
}

- (SGRealtimeEvent)initWithState:(int)a3 event:(id)a4 eventIdentifier:(id)a5 harvested:(BOOL)a6
{
  return [(SGRealtimeEvent *)self initWithState:*(void *)&a3 event:a4 eventIdentifier:a5 harvested:a6 sourceMessageId:0];
}

+ (id)realtimeEventForExtractionExceptionWithSourceMessageId:(id)a3
{
  id v3 = a3;
  id v4 = [[SGRealtimeEvent alloc] initWithState:6 event:0 eventIdentifier:0 harvested:0 sourceMessageId:v3];

  return v4;
}

+ (id)realtimeEventForNearDuplicateEvent:(id)a3 harvested:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  BOOL v6 = [[SGRealtimeEvent alloc] initWithState:5 event:0 eventIdentifier:v5 harvested:v4];

  return v6;
}

+ (id)realtimeEventForNearDuplicateEvent:(id)a3
{
  return +[SGRealtimeEvent realtimeEventForNearDuplicateEvent:a3 harvested:0];
}

+ (id)realtimeEventForDuplicateEvent:(id)a3 eventIdentifier:(id)a4 harvested:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  v9 = [[SGRealtimeEvent alloc] initWithState:4 event:v8 eventIdentifier:v7 harvested:v5];

  return v9;
}

+ (id)realtimeEventForDuplicateEvent:(id)a3 eventIdentifier:(id)a4
{
  return +[SGRealtimeEvent realtimeEventForDuplicateEvent:a3 eventIdentifier:a4 harvested:0];
}

+ (id)realtimeEventUpdateToEvent:(id)a3 withNewValues:(id)a4 harvested:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  v9 = [[SGRealtimeEvent alloc] initWithState:2 event:v7 eventIdentifier:v8 harvested:v5];

  return v9;
}

+ (id)realtimeEventUpdateToEvent:(id)a3 withNewValues:(id)a4
{
  return +[SGRealtimeEvent realtimeEventUpdateToEvent:a3 withNewValues:a4 harvested:0];
}

+ (id)realtimeEventForCanceledEvent:(id)a3 eventIdentifier:(id)a4 harvested:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  v9 = [[SGRealtimeEvent alloc] initWithState:3 event:v8 eventIdentifier:v7 harvested:v5];

  return v9;
}

+ (id)realtimeEventForCanceledEvent:(id)a3 eventIdentifier:(id)a4
{
  return +[SGRealtimeEvent realtimeEventForCanceledEvent:a3 eventIdentifier:a4 harvested:0];
}

+ (id)realtimeEventForNewEvent:(id)a3 harvested:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  BOOL v6 = [[SGRealtimeEvent alloc] initWithState:1 event:v5 eventIdentifier:0 harvested:v4];

  return v6;
}

+ (id)realtimeEventForNewEvent:(id)a3
{
  return +[SGRealtimeEvent realtimeEventForNewEvent:a3 harvested:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end