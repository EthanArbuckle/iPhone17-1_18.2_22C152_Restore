@interface InteractionAnalysisPETInteractionEvent
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (uint64_t)setTimestamp:(uint64_t)result;
- (unint64_t)hash;
- (void)setAssociatedMemberIDs:(uint64_t)a1;
- (void)setBundleID:(uint64_t)a1;
- (void)setDirection:(uint64_t)a1;
- (void)setEventMechanism:(uint64_t)a1;
- (void)setInteractionID:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation InteractionAnalysisPETInteractionEvent

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)InteractionAnalysisPETInteractionEvent;
  v4 = [(InteractionAnalysisPETInteractionEvent *)&v8 description];
  v5 = [(InteractionAnalysisPETInteractionEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [NSNumber numberWithDouble:self->_timestamp];
  [v3 setObject:v4 forKey:@"timestamp"];

  eventMechanism = self->_eventMechanism;
  if (eventMechanism) {
    [v3 setObject:eventMechanism forKey:@"eventMechanism"];
  }
  bundleID = self->_bundleID;
  if (bundleID) {
    [v3 setObject:bundleID forKey:@"bundleID"];
  }
  direction = self->_direction;
  if (direction) {
    [v3 setObject:direction forKey:@"direction"];
  }
  interactionID = self->_interactionID;
  if (interactionID) {
    [v3 setObject:interactionID forKey:@"interactionID"];
  }
  associatedMemberIDs = self->_associatedMemberIDs;
  if (associatedMemberIDs) {
    [v3 setObject:associatedMemberIDs forKey:@"associatedMemberIDs"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return InteractionAnalysisPETInteractionEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteDoubleField();
  if (!self->_eventMechanism) {
    -[InteractionAnalysisPETInteractionEvent writeTo:]();
  }
  PBDataWriterWriteStringField();
  if (!self->_bundleID) {
    -[InteractionAnalysisPETInteractionEvent writeTo:]();
  }
  PBDataWriterWriteStringField();
  if (!self->_direction) {
    -[InteractionAnalysisPETInteractionEvent writeTo:]();
  }
  PBDataWriterWriteStringField();
  if (self->_interactionID) {
    PBDataWriterWriteStringField();
  }
  if (self->_associatedMemberIDs) {
    PBDataWriterWriteStringField();
  }
}

- (void)setEventMechanism:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (void)setBundleID:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)setDirection:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (void)setInteractionID:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

- (void)setAssociatedMemberIDs:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(double *)(v5 + 8) = self->_timestamp;
  uint64_t v6 = [(NSString *)self->_eventMechanism copyWithZone:a3];
  v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  uint64_t v8 = [(NSString *)self->_bundleID copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSString *)self->_direction copyWithZone:a3];
  v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  uint64_t v12 = [(NSString *)self->_interactionID copyWithZone:a3];
  v13 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v12;

  uint64_t v14 = [(NSString *)self->_associatedMemberIDs copyWithZone:a3];
  v15 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v14;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_timestamp == *((double *)v4 + 1)
    && ((eventMechanism = self->_eventMechanism, !((unint64_t)eventMechanism | v4[5]))
     || -[NSString isEqual:](eventMechanism, "isEqual:"))
    && ((bundleID = self->_bundleID, !((unint64_t)bundleID | v4[3]))
     || -[NSString isEqual:](bundleID, "isEqual:"))
    && ((direction = self->_direction, !((unint64_t)direction | v4[4]))
     || -[NSString isEqual:](direction, "isEqual:"))
    && ((interactionID = self->_interactionID, !((unint64_t)interactionID | v4[6]))
     || -[NSString isEqual:](interactionID, "isEqual:")))
  {
    associatedMemberIDs = self->_associatedMemberIDs;
    if ((unint64_t)associatedMemberIDs | v4[2]) {
      char v10 = -[NSString isEqual:](associatedMemberIDs, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  double timestamp = self->_timestamp;
  double v4 = -timestamp;
  if (timestamp >= 0.0) {
    double v4 = self->_timestamp;
  }
  long double v5 = floor(v4 + 0.5);
  double v6 = (v4 - v5) * 1.84467441e19;
  double v7 = fmod(v5, 1.84467441e19);
  unint64_t v8 = 2654435761u * (unint64_t)v7;
  unint64_t v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0) {
    unint64_t v9 = 2654435761u * (unint64_t)v7;
  }
  unint64_t v10 = v8 - (unint64_t)fabs(v6);
  if (v6 < 0.0) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = v9;
  }
  NSUInteger v12 = [(NSString *)self->_eventMechanism hash];
  NSUInteger v13 = v11 ^ [(NSString *)self->_bundleID hash];
  NSUInteger v14 = v12 ^ [(NSString *)self->_direction hash];
  NSUInteger v15 = v14 ^ [(NSString *)self->_interactionID hash];
  return v15 ^ [(NSString *)self->_associatedMemberIDs hash] ^ v13;
}

- (uint64_t)setTimestamp:(uint64_t)result
{
  if (result) {
    *(double *)(result + 8) = a2;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionID, 0);
  objc_storeStrong((id *)&self->_eventMechanism, 0);
  objc_storeStrong((id *)&self->_direction, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_associatedMemberIDs, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[InteractionAnalysisPETInteractionEvent writeTo:]", "InteractionAnalysisPETInteractionEvent.m", 135, "nil != self->_eventMechanism");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[InteractionAnalysisPETInteractionEvent writeTo:]", "InteractionAnalysisPETInteractionEvent.m", 140, "nil != self->_bundleID");
}

- (void)writeTo:.cold.3()
{
  __assert_rtn("-[InteractionAnalysisPETInteractionEvent writeTo:]", "InteractionAnalysisPETInteractionEvent.m", 145, "nil != self->_direction");
}

@end