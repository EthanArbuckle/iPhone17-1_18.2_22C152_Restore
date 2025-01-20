@interface AVCoordinatedPlaybackParticipant
- (AVCoordinatedPlaybackParticipant)initWithParticipantIdentifier:(id)a3 readyToPlay:(BOOL)a4 suspensionReasons:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReadyToPlay;
- (NSArray)suspensionReasons;
- (NSUUID)identifier;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation AVCoordinatedPlaybackParticipant

- (AVCoordinatedPlaybackParticipant)initWithParticipantIdentifier:(id)a3 readyToPlay:(BOOL)a4 suspensionReasons:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)AVCoordinatedPlaybackParticipant;
  v8 = [(AVCoordinatedPlaybackParticipant *)&v10 init];
  if (v8)
  {
    v8->_identifier = (NSUUID *)[a3 copy];
    v8->_suspensionReasons = (NSArray *)[a5 copy];
    v8->_readyToPlay = a4;
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCoordinatedPlaybackParticipant;
  [(AVCoordinatedPlaybackParticipant *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v5) = 1;
    return v5;
  }
  if (!a3) {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_6;
  }
  int v5 = -[NSUUID isEqual:](-[AVCoordinatedPlaybackParticipant identifier](self, "identifier"), "isEqual:", [a3 identifier]);
  if (!v5) {
    return v5;
  }
  int v6 = [(AVCoordinatedPlaybackParticipant *)self isReadyToPlay];
  if (v6 == [a3 isReadyToPlay])
  {
    v7 = [(AVCoordinatedPlaybackParticipant *)self suspensionReasons];
    uint64_t v8 = [a3 suspensionReasons];
    LOBYTE(v5) = AVPlaybackCoordinatorArrayContainsSameElementsAsArray((uint64_t)v7, v8);
  }
  else
  {
LABEL_6:
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (unint64_t)hash
{
  v2 = [(AVCoordinatedPlaybackParticipant *)self identifier];
  return [(NSUUID *)v2 hash];
}

- (NSArray)suspensionReasons
{
  return self->_suspensionReasons;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (BOOL)isReadyToPlay
{
  return self->_readyToPlay;
}

@end