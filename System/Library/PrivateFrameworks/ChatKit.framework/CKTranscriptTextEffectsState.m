@interface CKTranscriptTextEffectsState
- (BOOL)hasAttention;
- (BOOL)inTransition;
- (BOOL)isPaused;
- (BOOL)isReady;
- (CKTranscriptTextEffectsState)init;
- (void)setHasAttention:(BOOL)a3;
- (void)setInTransition:(BOOL)a3;
- (void)setIsReady:(BOOL)a3;
@end

@implementation CKTranscriptTextEffectsState

- (CKTranscriptTextEffectsState)init
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___CKTranscriptTextEffectsState_inTransition) = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___CKTranscriptTextEffectsState_isReady) = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___CKTranscriptTextEffectsState_hasAttention) = 1;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TranscriptTextEffectsState();
  return [(CKTranscriptTextEffectsState *)&v3 init];
}

- (BOOL)inTransition
{
  v2 = (BOOL *)self + OBJC_IVAR___CKTranscriptTextEffectsState_inTransition;
  swift_beginAccess();
  return *v2;
}

- (void)setInTransition:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___CKTranscriptTextEffectsState_inTransition;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)isReady
{
  v2 = (BOOL *)self + OBJC_IVAR___CKTranscriptTextEffectsState_isReady;
  swift_beginAccess();
  return *v2;
}

- (void)setIsReady:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___CKTranscriptTextEffectsState_isReady;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)hasAttention
{
  v2 = (BOOL *)self + OBJC_IVAR___CKTranscriptTextEffectsState_hasAttention;
  swift_beginAccess();
  return *v2;
}

- (void)setHasAttention:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___CKTranscriptTextEffectsState_hasAttention;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)isPaused
{
  objc_super v3 = (char *)self + OBJC_IVAR___CKTranscriptTextEffectsState_isReady;
  swift_beginAccess();
  if (*v3 == 1
    && (v4 = (char *)self + OBJC_IVAR___CKTranscriptTextEffectsState_inTransition, swift_beginAccess(), (*v4 & 1) == 0))
  {
    v6 = (char *)self + OBJC_IVAR___CKTranscriptTextEffectsState_hasAttention;
    swift_beginAccess();
    char v5 = *v6 ^ 1;
  }
  else
  {
    char v5 = 1;
  }
  return v5 & 1;
}

@end