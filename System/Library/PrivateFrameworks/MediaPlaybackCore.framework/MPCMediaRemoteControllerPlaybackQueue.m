@interface MPCMediaRemoteControllerPlaybackQueue
- (MPCMediaRemoteControllerPlaybackQueue)initWithIdentifiers:(id)a3 playingIdentifier:(id)a4 queueIdentifier:(id)a5 queueProperties:(id)a6;
- (NSArray)identifiers;
- (NSDictionary)queueProperties;
- (NSString)playingIdentifier;
- (NSString)queueIdentifier;
@end

@implementation MPCMediaRemoteControllerPlaybackQueue

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (MPCMediaRemoteControllerPlaybackQueue)initWithIdentifiers:(id)a3 playingIdentifier:(id)a4 queueIdentifier:(id)a5 queueProperties:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)MPCMediaRemoteControllerPlaybackQueue;
  v14 = [(MPCMediaRemoteControllerPlaybackQueue *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    identifiers = v14->_identifiers;
    v14->_identifiers = (NSArray *)v15;

    uint64_t v17 = [v11 copy];
    playingIdentifier = v14->_playingIdentifier;
    v14->_playingIdentifier = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    queueIdentifier = v14->_queueIdentifier;
    v14->_queueIdentifier = (NSString *)v19;

    uint64_t v21 = [v13 copy];
    queueProperties = v14->_queueProperties;
    v14->_queueProperties = (NSDictionary *)v21;
  }
  return v14;
}

- (NSDictionary)queueProperties
{
  return self->_queueProperties;
}

- (NSString)queueIdentifier
{
  return self->_queueIdentifier;
}

- (NSString)playingIdentifier
{
  return self->_playingIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queueProperties, 0);
  objc_storeStrong((id *)&self->_queueIdentifier, 0);
  objc_storeStrong((id *)&self->_playingIdentifier, 0);

  objc_storeStrong((id *)&self->_identifiers, 0);
}

@end