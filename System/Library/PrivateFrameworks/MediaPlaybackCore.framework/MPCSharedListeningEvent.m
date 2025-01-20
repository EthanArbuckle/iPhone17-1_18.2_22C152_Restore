@interface MPCSharedListeningEvent
+ (id)eventWithCustomEvent:(id)a3 participant:(id)a4;
+ (id)eventWithPlaybackEvent:(id)a3 participant:(id)a4;
+ (id)eventWithQueueEvent:(id)a3 participant:(id)a4;
+ (id)eventWithReactionEvent:(id)a3 participant:(id)a4;
+ (id)eventWithSessionEvent:(id)a3 participant:(id)a4;
- (MPCSharedListeningCustomEvent)customEvent;
- (MPCSharedListeningEventParticipant)participant;
- (MPCSharedListeningPlaybackEvent)playbackEvent;
- (MPCSharedListeningQueueEvent)queueEvent;
- (MPCSharedListeningReactionEvent)reactionEvent;
- (MPCSharedListeningSessionEvent)sessionEvent;
- (id)_initWithType:(int64_t)a3 participant:(id)a4;
- (id)description;
- (int64_t)type;
@end

@implementation MPCSharedListeningEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customEvent, 0);
  objc_storeStrong((id *)&self->_reactionEvent, 0);
  objc_storeStrong((id *)&self->_queueEvent, 0);
  objc_storeStrong((id *)&self->_playbackEvent, 0);
  objc_storeStrong((id *)&self->_sessionEvent, 0);

  objc_storeStrong((id *)&self->_participant, 0);
}

- (MPCSharedListeningCustomEvent)customEvent
{
  return self->_customEvent;
}

- (MPCSharedListeningReactionEvent)reactionEvent
{
  return self->_reactionEvent;
}

- (MPCSharedListeningQueueEvent)queueEvent
{
  return self->_queueEvent;
}

- (MPCSharedListeningPlaybackEvent)playbackEvent
{
  return self->_playbackEvent;
}

- (MPCSharedListeningSessionEvent)sessionEvent
{
  return self->_sessionEvent;
}

- (int64_t)type
{
  return self->_type;
}

- (MPCSharedListeningEventParticipant)participant
{
  return self->_participant;
}

- (id)description
{
  int64_t type = self->_type;
  switch(type)
  {
    case 0:
      objc_msgSend(NSString, "stringWithFormat:", @"<MPCSharedListeningEvent: %p unknown/invalid>", self, v5, v6);
      break;
    case 1:
      [NSString stringWithFormat:@"<MPCSharedListeningEvent: %p participant=%@ sessionEvent=%@>", self, self->_participant, self->_sessionEvent];
      break;
    case 2:
      [NSString stringWithFormat:@"<MPCSharedListeningEvent: %p participant=%@ playbackEvent=%@>", self, self->_participant, self->_playbackEvent];
      break;
    case 3:
      [NSString stringWithFormat:@"<MPCSharedListeningEvent: %p participant=%@ queueEvent=%@>", self, self->_participant, self->_queueEvent];
      break;
    case 4:
      [NSString stringWithFormat:@"<MPCSharedListeningEvent: %p participant=%@ reactionEvent=%@>", self, self->_participant, self->_reactionEvent];
      break;
    case 5:
      [NSString stringWithFormat:@"<MPCSharedListeningEvent: %p participant=%@ customEvent=%@>", self, self->_participant, self->_customEvent];
      break;
    default:
      objc_msgSend(NSString, "stringWithFormat:", @"<MPCSharedListeningEvent: %p unknown/eventType=%ld>", self, type, v6);
      break;
  v3 = };

  return v3;
}

- (id)_initWithType:(int64_t)a3 participant:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MPCSharedListeningEvent;
  v7 = [(MPCSharedListeningEvent *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_int64_t type = a3;
    uint64_t v9 = [v6 copy];
    participant = v8->_participant;
    v8->_participant = (MPCSharedListeningEventParticipant *)v9;
  }
  return v8;
}

+ (id)eventWithCustomEvent:(id)a3 participant:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [[MPCSharedListeningEvent alloc] _initWithType:5 participant:v6];

  v8 = (void *)v7[7];
  v7[7] = v5;

  return v7;
}

+ (id)eventWithReactionEvent:(id)a3 participant:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [[MPCSharedListeningEvent alloc] _initWithType:4 participant:v6];

  v8 = (void *)v7[6];
  v7[6] = v5;

  return v7;
}

+ (id)eventWithQueueEvent:(id)a3 participant:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [[MPCSharedListeningEvent alloc] _initWithType:3 participant:v6];

  v8 = (void *)v7[5];
  v7[5] = v5;

  return v7;
}

+ (id)eventWithPlaybackEvent:(id)a3 participant:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [[MPCSharedListeningEvent alloc] _initWithType:2 participant:v6];

  v8 = (void *)v7[4];
  v7[4] = v5;

  return v7;
}

+ (id)eventWithSessionEvent:(id)a3 participant:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [[MPCSharedListeningEvent alloc] _initWithType:1 participant:v6];

  v8 = (void *)v7[3];
  v7[3] = v5;

  return v7;
}

@end