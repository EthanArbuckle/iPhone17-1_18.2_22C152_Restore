@interface PTPushResult
+ (PTPushResult)leaveChannelPushResult;
+ (PTPushResult)pushResultForActiveRemoteParticipant:(PTParticipant *)participant;
+ (PTPushResult)serviceUpdatePushResult;
- (PTParticipant)participant;
- (id)_initWithResultType:(int64_t)a3 participant:(id)a4;
- (int64_t)type;
- (void)setParticipant:(id)a3;
@end

@implementation PTPushResult

- (id)_initWithResultType:(int64_t)a3 participant:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PTPushResult;
  v8 = [(PTPushResult *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_participant, a4);
  }

  return v9;
}

+ (PTPushResult)leaveChannelPushResult
{
  id v2 = [[PTPushResult alloc] _initWithResultType:1 participant:0];

  return (PTPushResult *)v2;
}

+ (PTPushResult)pushResultForActiveRemoteParticipant:(PTParticipant *)participant
{
  v3 = participant;
  if (!v3) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"%s: parameter '%@' cannot be nil", "+[PTPushResult pushResultForActiveRemoteParticipant:]", @"participant" format];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"participant must be a kind of PTParticipant"];
  }
  id v4 = [[PTPushResult alloc] _initWithResultType:2 participant:v3];

  return (PTPushResult *)v4;
}

+ (PTPushResult)serviceUpdatePushResult
{
  id v2 = [[PTPushResult alloc] _initWithResultType:4 participant:0];

  return (PTPushResult *)v2;
}

- (int64_t)type
{
  return self->_type;
}

- (PTParticipant)participant
{
  return self->_participant;
}

- (void)setParticipant:(id)a3
{
}

- (void).cxx_destruct
{
}

@end