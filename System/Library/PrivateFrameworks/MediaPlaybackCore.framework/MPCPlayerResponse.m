@interface MPCPlayerResponse
+ (id)builderProtocol;
- (BOOL)isSharedListeningSession;
- (ICMusicSubscriptionStatus)requestingUserSubscriptionStatus;
- (MPCMediaRemoteController)controller;
- (MPCPlayerPath)playerPath;
- (MPCPlayerResponse)initWithRequest:(id)a3 middleware:(id)a4;
- (MPCPlayerResponseTracklist)tracklist;
- (MPCVideoOutput)videoOutput;
- (MPCVideoView)videoView;
- (NSArray)participants;
- (id)_commandRequestForMediaRemoteCommand:(unsigned int)a3;
- (id)_stateDumpObject;
- (id)createSharedSessionWithIdentity:(id)a3 intentHandler:(id)a4;
- (id)createSharedSessionWithIntentHandler:(id)a3;
- (id)description;
- (id)leaveSession;
- (id)pause;
- (id)play;
- (id)prepare;
- (id)stop;
- (int64_t)state;
- (void)setPlayerPath:(id)a3;
- (void)setVideoOutput:(id)a3;
- (void)setVideoView:(id)a3;
@end

@implementation MPCPlayerResponse

- (MPCVideoOutput)videoOutput
{
  return self->_videoOutput;
}

- (BOOL)isSharedListeningSession
{
  return self->_sharedListeningSession;
}

- (MPCPlayerResponse)initWithRequest:(id)a3 middleware:(id)a4
{
  v30.receiver = self;
  v30.super_class = (Class)MPCPlayerResponse;
  v4 = [(MPResponse *)&v30 initWithRequest:a3 middleware:a4];
  if (v4)
  {
    v5 = [[MPCPlayerResponseTracklist alloc] initWithResponse:v4];
    tracklist = v4->_tracklist;
    v4->_tracklist = v5;

    v7 = [(MPResponse *)v4 builder];
    v8 = [(MPResponse *)v4 chain];
    v4->_state = [v7 playerState:0 chain:v8];

    v9 = [(MPResponse *)v4 builder];
    v10 = [(MPResponse *)v4 chain];
    v4->_sharedListeningSession = [v9 playerIsSharedListeningSession:0 chain:v10];

    v11 = [(MPResponse *)v4 builder];
    v12 = [(MPResponse *)v4 chain];
    uint64_t v13 = [v11 playerVideoView:0 chain:v12];
    videoView = v4->_videoView;
    v4->_videoView = (MPCVideoView *)v13;

    v15 = [(MPResponse *)v4 builder];
    v16 = [(MPResponse *)v4 chain];
    uint64_t v17 = [v15 videoOutput:0 chain:v16];
    videoOutput = v4->_videoOutput;
    v4->_videoOutput = (MPCVideoOutput *)v17;

    v19 = [(MPResponse *)v4 builder];
    v20 = [(MPResponse *)v4 chain];
    uint64_t v21 = [v19 controller:0 chain:v20];
    controller = v4->_controller;
    v4->_controller = (MPCMediaRemoteController *)v21;

    uint64_t v23 = [(MPCMediaRemoteController *)v4->_controller resolvedPlayerPath];
    playerPath = v4->_playerPath;
    v4->_playerPath = (MPCPlayerPath *)v23;

    v25 = [(MPResponse *)v4 builder];
    v26 = [(MPResponse *)v4 chain];
    uint64_t v27 = [v25 requestingUserSubscriptionStatus:0 chain:v26];
    requestingUserSubscriptionStatus = v4->_requestingUserSubscriptionStatus;
    v4->_requestingUserSubscriptionStatus = (ICMusicSubscriptionStatus *)v27;
  }
  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)MPCPlayerResponse;
  v3 = [(MPResponse *)&v7 description];
  v4 = [NSString stringWithFormat:@" playerPath=%@", self->_playerPath];
  v5 = objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", objc_msgSend(v3, "length") - 1, 0, v4);

  return v5;
}

- (id)stop
{
  if ([(MPCPlayerResponse *)self state] == 2
    || ([(MPResponse *)self request],
        v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 disablePlaybackStateValidation],
        v3,
        v4))
  {
    v5 = [(MPCPlayerResponse *)self _commandRequestForMediaRemoteCommand:3];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)pause
{
  v3 = [(MPCPlayerResponse *)self _commandRequestForMediaRemoteCommand:1];
  int v4 = [(MPResponse *)self request];
  int v5 = [v4 disablePlaybackStateValidation];

  if (v5) {
    goto LABEL_4;
  }
  if ([(MPCPlayerResponse *)self state] == 2)
  {
    if (!v3)
    {
      id v6 = [(MPCPlayerResponse *)self _commandRequestForMediaRemoteCommand:2];
      goto LABEL_5;
    }
LABEL_4:
    id v6 = v3;
LABEL_5:
    objc_super v7 = v6;
    goto LABEL_7;
  }
  objc_super v7 = 0;
LABEL_7:

  return v7;
}

- (int64_t)state
{
  return self->_state;
}

- (id)play
{
  v3 = [(MPCPlayerResponse *)self _commandRequestForMediaRemoteCommand:0];
  int v4 = [(MPResponse *)self request];
  int v5 = [v4 disablePlaybackStateValidation];

  if (v5) {
    goto LABEL_5;
  }
  if ([(MPCPlayerResponse *)self state] == 2)
  {
    id v6 = 0;
    goto LABEL_7;
  }
  if (v3)
  {
LABEL_5:
    id v7 = v3;
  }
  else
  {
    id v7 = [(MPCPlayerResponse *)self _commandRequestForMediaRemoteCommand:2];
  }
  id v6 = v7;
LABEL_7:

  return v6;
}

- (id)_commandRequestForMediaRemoteCommand:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = [(MPResponse *)self builder];
  id v6 = [(MPResponse *)self chain];
  int v7 = [v5 playerCommandEnabled:0 command:v3 chain:v6];

  if (v7)
  {
    v8 = [MPCPlayerCommandRequest alloc];
    v9 = [(MPCPlayerResponse *)self controller];
    v10 = [(MPResponse *)self request];
    v11 = [v10 label];
    v12 = [(MPCPlayerCommandRequest *)v8 initWithMediaRemoteCommand:v3 options:0 controller:v9 label:v11];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (MPCPlayerResponseTracklist)tracklist
{
  return self->_tracklist;
}

- (MPCMediaRemoteController)controller
{
  return self->_controller;
}

- (MPCPlayerPath)playerPath
{
  return self->_playerPath;
}

+ (id)builderProtocol
{
  return &unk_26CC266D8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoOutput, 0);
  objc_storeStrong((id *)&self->_videoView, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_requestingUserSubscriptionStatus, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_participants, 0);

  objc_storeStrong((id *)&self->_tracklist, 0);
}

- (void)setVideoOutput:(id)a3
{
}

- (void)setVideoView:(id)a3
{
}

- (MPCVideoView)videoView
{
  return self->_videoView;
}

- (void)setPlayerPath:(id)a3
{
}

- (ICMusicSubscriptionStatus)requestingUserSubscriptionStatus
{
  return self->_requestingUserSubscriptionStatus;
}

- (NSArray)participants
{
  return self->_participants;
}

- (id)_stateDumpObject
{
  v8.receiver = self;
  v8.super_class = (Class)MPCPlayerResponse;
  uint64_t v3 = [(MPResponse *)&v8 _stateDumpObject];
  int v4 = (void *)[v3 mutableCopy];

  unint64_t v5 = self->_state - 1;
  if (v5 > 5) {
    id v6 = @"MPCPlayerStateUnknown";
  }
  else {
    id v6 = off_2643C0888[v5];
  }
  [v4 setObject:v6 forKeyedSubscript:@"state"];
  [v4 setObject:self->_tracklist forKeyedSubscript:@"tracklist"];
  [v4 setObject:self->_playerPath forKeyedSubscript:@"playerPath"];

  return v4;
}

- (id)leaveSession
{
  return [(MPCPlayerResponse *)self _commandRequestForMediaRemoteCommand:139];
}

- (id)createSharedSessionWithIdentity:(id)a3 intentHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(MPCPlayerResponse *)self _commandRequestForMediaRemoteCommand:25020];
  v9 = objc_msgSend(v6, "mpc_jsonValue");
  [v8 setCommandOptionValue:v9 forKey:@"com.apple.music.live-link-identity-json"];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __67__MPCPlayerResponse_createSharedSessionWithIdentity_intentHandler___block_invoke;
  v13[3] = &unk_2643C0868;
  id v14 = v6;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  [v8 setStatusTransformer:v13];

  return v8;
}

id __67__MPCPlayerResponse_createSharedSessionWithIdentity_intentHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 customDataType];
  if (v4 == @"com.apple.music.shared-session-url-components"
    || (unint64_t v5 = v4,
        int v6 = [(__CFString *)v4 isEqual:@"com.apple.music.shared-session-url-components"],
        v5,
        v5,
        v6))
  {
    id v7 = (void *)MEMORY[0x263F08BA0];
    id v8 = [NSString alloc];
    v9 = [v3 customData];
    id v10 = (void *)[v8 initWithData:v9 encoding:4];
    id v11 = [v7 componentsWithString:v10];

    v12 = [v11 queryItems];
    uint64_t v13 = objc_msgSend(v12, "msv_firstWhere:", &__block_literal_global_276);
    id v14 = [v13 value];

    id v15 = [v11 queryItems];
    v16 = objc_msgSend(v15, "msv_firstWhere:", &__block_literal_global_281);
    uint64_t v17 = [v16 value];

    v18 = +[MPCPlaybackSharedListeningProperties propertiesWithSessionIdentifier:v14 sessionKey:v17];
    v19 = +[MPCPlaybackIntent sharedSessionIntentWithProperties:v18 identity:*(void *)(a1 + 32)];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v20 = [MEMORY[0x263F121D0] successStatus];
  }
  else
  {
    id v20 = v3;
  }

  return v20;
}

uint64_t __67__MPCPlayerResponse_createSharedSessionWithIdentity_intentHandler___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 name];
  id v3 = v2;
  if (v2 == @"key") {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = [(__CFString *)v2 isEqual:@"key"];
  }

  return v4;
}

uint64_t __67__MPCPlayerResponse_createSharedSessionWithIdentity_intentHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 name];
  id v3 = v2;
  if (v2 == @"id") {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = [(__CFString *)v2 isEqual:@"id"];
  }

  return v4;
}

- (id)createSharedSessionWithIntentHandler:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x263F89188];
  id v5 = a3;
  int v6 = (void *)[[v4 alloc] initWithBlock:&__block_literal_global_7298];
  id v7 = [(MPCPlayerResponse *)self createSharedSessionWithIdentity:v6 intentHandler:v5];

  return v7;
}

- (id)prepare
{
  unint64_t v4 = [(MPCPlayerResponse *)self state];
  unint64_t v5 = v4;
  if (v4 <= 6 && ((1 << v4) & 0x53) != 0)
  {
    int v6 = 1;
  }
  else
  {
    v2 = [(MPResponse *)self request];
    int v6 = [v2 disablePlaybackStateValidation];
  }
  if (v5 <= 6 && ((1 << v5) & 0x53) != 0)
  {
    if (v6)
    {
LABEL_8:
      id v7 = [MPCPlayerCommandRequest alloc];
      id v8 = [(MPCPlayerResponse *)self controller];
      v9 = [(MPResponse *)self request];
      id v10 = [v9 label];
      id v11 = [(MPCPlayerCommandRequest *)v7 initWithMediaRemoteCommand:132 options:0 controller:v8 label:v10];

      goto LABEL_11;
    }
  }
  else
  {

    if (v6) {
      goto LABEL_8;
    }
  }
  id v11 = 0;
LABEL_11:

  return v11;
}

@end