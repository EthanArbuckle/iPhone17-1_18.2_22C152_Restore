@interface GKMatchEventQueue
- (BOOL)connected;
- (BOOL)counted;
- (BOOL)hasInitRelayInfo;
- (BOOL)hasUpdateRelayInfo;
- (BOOL)invitedByLocalPlayer;
- (BOOL)okToSend;
- (BOOL)relayInitiated;
- (GKMatchEventQueue)init;
- (GKPlayer)hostPlayer;
- (GKPlayer)player;
- (NSMutableArray)events;
- (NSMutableDictionary)connectionInfo;
- (int64_t)deferedPlayerState;
- (int64_t)playerState;
- (unsigned)sequenceNumber;
- (void)setConnectionInfo:(id)a3;
- (void)setCounted:(BOOL)a3;
- (void)setDeferedPlayerState:(int64_t)a3;
- (void)setEvents:(id)a3;
- (void)setHasInitRelayInfo:(BOOL)a3;
- (void)setHasUpdateRelayInfo:(BOOL)a3;
- (void)setHostPlayer:(id)a3;
- (void)setInvitedByLocalPlayer:(BOOL)a3;
- (void)setOkToSend:(BOOL)a3;
- (void)setPlayer:(id)a3;
- (void)setPlayerState:(int64_t)a3;
- (void)setRelayInitiated:(BOOL)a3;
- (void)setSequenceNumber:(unsigned int)a3;
@end

@implementation GKMatchEventQueue

- (GKMatchEventQueue)init
{
  v6.receiver = self;
  v6.super_class = (Class)GKMatchEventQueue;
  v2 = [(GKMatchEventQueue *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    events = v2->_events;
    v2->_events = (NSMutableArray *)v3;
  }
  return v2;
}

- (BOOL)connected
{
  return [(GKMatchEventQueue *)self playerState] == 1;
}

- (GKPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (GKPlayer)hostPlayer
{
  return self->_hostPlayer;
}

- (void)setHostPlayer:(id)a3
{
}

- (int64_t)playerState
{
  return self->_playerState;
}

- (void)setPlayerState:(int64_t)a3
{
  self->_playerState = a3;
}

- (BOOL)counted
{
  return self->_counted;
}

- (void)setCounted:(BOOL)a3
{
  self->_counted = a3;
}

- (int64_t)deferedPlayerState
{
  return self->_deferedPlayerState;
}

- (void)setDeferedPlayerState:(int64_t)a3
{
  self->_deferedPlayerState = a3;
}

- (NSMutableArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
}

- (BOOL)okToSend
{
  return self->_okToSend;
}

- (void)setOkToSend:(BOOL)a3
{
  self->_okToSend = a3;
}

- (NSMutableDictionary)connectionInfo
{
  return self->_connectionInfo;
}

- (void)setConnectionInfo:(id)a3
{
}

- (BOOL)relayInitiated
{
  return self->_relayInitiated;
}

- (void)setRelayInitiated:(BOOL)a3
{
  self->_relayInitiated = a3;
}

- (BOOL)hasInitRelayInfo
{
  return self->_hasInitRelayInfo;
}

- (void)setHasInitRelayInfo:(BOOL)a3
{
  self->_hasInitRelayInfo = a3;
}

- (BOOL)hasUpdateRelayInfo
{
  return self->_hasUpdateRelayInfo;
}

- (void)setHasUpdateRelayInfo:(BOOL)a3
{
  self->_hasUpdateRelayInfo = a3;
}

- (BOOL)invitedByLocalPlayer
{
  return self->_invitedByLocalPlayer;
}

- (void)setInvitedByLocalPlayer:(BOOL)a3
{
  self->_invitedByLocalPlayer = a3;
}

- (unsigned)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(unsigned int)a3
{
  self->_sequenceNumber = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionInfo, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_hostPlayer, 0);

  objc_storeStrong((id *)&self->_player, 0);
}

@end