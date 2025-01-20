@interface MPCSharedListeningEventParticipant
+ (MPCSharedListeningEventParticipant)participantWithSharedListeningIdentifier:(id)a3 externalIdentifier:(id)a4;
- (NSString)externalIdentifier;
- (NSUUID)sharedListeningIdentifier;
- (id)description;
@end

@implementation MPCSharedListeningEventParticipant

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalIdentifier, 0);

  objc_storeStrong((id *)&self->_sharedListeningIdentifier, 0);
}

- (NSString)externalIdentifier
{
  return self->_externalIdentifier;
}

- (NSUUID)sharedListeningIdentifier
{
  return self->_sharedListeningIdentifier;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<MPCSharedListeningEventParticipant: %p id=%@ externalID=%@>", self, self->_sharedListeningIdentifier, self->_externalIdentifier];
}

+ (MPCSharedListeningEventParticipant)participantWithSharedListeningIdentifier:(id)a3 externalIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(MPCSharedListeningEventParticipant);
  uint64_t v8 = [v6 copy];

  sharedListeningIdentifier = v7->_sharedListeningIdentifier;
  v7->_sharedListeningIdentifier = (NSUUID *)v8;

  uint64_t v10 = [v5 copy];
  externalIdentifier = v7->_externalIdentifier;
  v7->_externalIdentifier = (NSString *)v10;

  return v7;
}

@end