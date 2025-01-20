@interface _MPCPlaybackEngineEventStreamInitializationParameters
- (NSString)engineID;
- (NSString)originID;
- (NSString)playerID;
- (_MPCPlaybackEngineEventStreamInitializationParameters)initWithPlaybackEngineParameters:(id)a3 engineID:(id)a4;
@end

@implementation _MPCPlaybackEngineEventStreamInitializationParameters

- (_MPCPlaybackEngineEventStreamInitializationParameters)initWithPlaybackEngineParameters:(id)a3 engineID:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)_MPCPlaybackEngineEventStreamInitializationParameters;
  v8 = [(_MPCPlaybackEngineEventStreamInitializationParameters *)&v25 init];
  if (v8)
  {
    v9 = [v6 remoteCommandCenter];
    v10 = [v9 playerPath];
    v11 = [v10 origin];
    uint64_t quot = [v11 identifier];
    int v13 = quot;
    v14 = (char *)&v26 + 1;
    do
    {
      uint64_t quot = div(quot, 10).quot;
      unint64_t v15 = HIDWORD(quot);
      if (quot < 0) {
        LODWORD(v15) = -HIDWORD(quot);
      }
      *(v14 - 2) = v15 + 48;
      v16 = (const UInt8 *)(v14 - 2);
      --v14;
    }
    while (quot);
    if (v13 < 0)
    {
      *(v14 - 2) = 45;
      v16 = (const UInt8 *)(v14 - 2);
    }
    CFStringRef v17 = CFStringCreateWithBytes(0, v16, (char *)&v26 - (char *)v16, 0x8000100u, 0);
    originID = v8->_originID;
    v8->_originID = &v17->isa;

    v19 = [v6 playerID];
    uint64_t v20 = [v19 copy];
    playerID = v8->_playerID;
    v8->_playerID = (NSString *)v20;

    uint64_t v22 = [v7 copy];
    engineID = v8->_engineID;
    v8->_engineID = (NSString *)v22;
  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engineID, 0);
  objc_storeStrong((id *)&self->_playerID, 0);

  objc_storeStrong((id *)&self->_originID, 0);
}

- (NSString)engineID
{
  return self->_engineID;
}

- (NSString)playerID
{
  return self->_playerID;
}

- (NSString)originID
{
  return self->_originID;
}

@end