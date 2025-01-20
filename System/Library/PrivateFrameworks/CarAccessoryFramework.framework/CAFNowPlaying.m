@interface CAFNowPlaying
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (BOOL)beginSeekBackwardDisabled;
- (BOOL)beginSeekForwardDisabled;
- (BOOL)hasBeginSeekBackward;
- (BOOL)hasBeginSeekForward;
- (BOOL)hasEndSeek;
- (BOOL)hasJumpBackward;
- (BOOL)hasJumpBackwardInterval;
- (BOOL)hasJumpForward;
- (BOOL)hasJumpForwardInterval;
- (BOOL)hasNextItem;
- (BOOL)hasPause;
- (BOOL)hasPlay;
- (BOOL)hasPlaybackState;
- (BOOL)hasPreviousItem;
- (BOOL)hasSetArtistSongNotification;
- (BOOL)hasStop;
- (BOOL)hasUserVisibleDescription;
- (BOOL)jumpBackwardDisabled;
- (BOOL)jumpForwardDisabled;
- (BOOL)nextItemDisabled;
- (BOOL)pauseDisabled;
- (BOOL)playDisabled;
- (BOOL)previousItemDisabled;
- (BOOL)registeredForAlbum;
- (BOOL)registeredForArtist;
- (BOOL)registeredForArtwork;
- (BOOL)registeredForBeginSeekBackward;
- (BOOL)registeredForBeginSeekForward;
- (BOOL)registeredForChangeMediaSource;
- (BOOL)registeredForCurrentMediaSourceIdentifier;
- (BOOL)registeredForEndSeek;
- (BOOL)registeredForJumpBackward;
- (BOOL)registeredForJumpBackwardInterval;
- (BOOL)registeredForJumpForward;
- (BOOL)registeredForJumpForwardInterval;
- (BOOL)registeredForNextItem;
- (BOOL)registeredForPause;
- (BOOL)registeredForPlay;
- (BOOL)registeredForPlaybackState;
- (BOOL)registeredForPreviousItem;
- (BOOL)registeredForSetArtistSongNotification;
- (BOOL)registeredForStop;
- (BOOL)registeredForTitle;
- (BOOL)registeredForTuneToFrequency;
- (BOOL)registeredForTuneToIdentifier;
- (BOOL)registeredForUserVisibleDescription;
- (BOOL)setArtistSongNotificationDisabled;
- (BOOL)stopDisabled;
- (CAFBeginSeekBackwardControl)beginSeekBackwardControl;
- (CAFBeginSeekForwardControl)beginSeekForwardControl;
- (CAFChangeMediaSourceControl)changeMediaSourceControl;
- (CAFDataCharacteristic)artworkCharacteristic;
- (CAFEndSeekControl)endSeekControl;
- (CAFJumpBackwardControl)jumpBackwardControl;
- (CAFJumpForwardControl)jumpForwardControl;
- (CAFMeasurementCharacteristic)jumpBackwardIntervalCharacteristic;
- (CAFMeasurementCharacteristic)jumpForwardIntervalCharacteristic;
- (CAFNextItemControl)nextItemControl;
- (CAFPauseControl)pauseControl;
- (CAFPlayControl)playControl;
- (CAFPlaybackStateCharacteristic)playbackStateCharacteristic;
- (CAFPreviousItemControl)previousItemControl;
- (CAFSetArtistSongNotificationControl)setArtistSongNotificationControl;
- (CAFStopControl)stopControl;
- (CAFStringCharacteristic)albumCharacteristic;
- (CAFStringCharacteristic)artistCharacteristic;
- (CAFStringCharacteristic)currentMediaSourceIdentifierCharacteristic;
- (CAFStringCharacteristic)titleCharacteristic;
- (CAFStringCharacteristic)userVisibleDescriptionCharacteristic;
- (CAFTuneToFrequencyControl)tuneToFrequencyControl;
- (CAFTuneToIdentifierControl)tuneToIdentifierControl;
- (CAFUInt16Range)jumpBackwardIntervalRange;
- (CAFUInt16Range)jumpForwardIntervalRange;
- (NSData)artwork;
- (NSMeasurement)jumpBackwardInterval;
- (NSMeasurement)jumpForwardInterval;
- (NSString)album;
- (NSString)artist;
- (NSString)currentMediaSourceIdentifier;
- (NSString)title;
- (NSString)userVisibleDescription;
- (unsigned)playbackState;
- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4;
- (void)_controlDidUpdate:(id)a3;
- (void)beginSeekBackwardWithCompletion:(id)a3;
- (void)beginSeekForwardWithCompletion:(id)a3;
- (void)changeMediaSourceWithIdentifier:(id)a3 completion:(id)a4;
- (void)endSeekWithCompletion:(id)a3;
- (void)jumpBackwardWithJumpInterval:(unsigned __int16)a3 completion:(id)a4;
- (void)jumpForwardWithJumpInterval:(unsigned __int16)a3 completion:(id)a4;
- (void)nextItemWithCompletion:(id)a3;
- (void)pauseWithCompletion:(id)a3;
- (void)playWithCompletion:(id)a3;
- (void)previousItemWithCompletion:(id)a3;
- (void)registerObserver:(id)a3;
- (void)setArtistSongNotificationWithCompletion:(id)a3;
- (void)stopWithCompletion:(id)a3;
- (void)tuneToFrequency:(unsigned int)a3 sourceIdentifier:(id)a4 completion:(id)a5;
- (void)tuneToIdentifier:(id)a3 sourceIdentifier:(id)a4 completion:(id)a5;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFNowPlaying

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFNowPlaying;
  objc_msgSendSuper2(&v2, sel_load);
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_26FD96388]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  v6.receiver = self;
  v6.super_class = (Class)CAFNowPlaying;
  [(CAFService *)&v6 registerObserver:v5];
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_26FD96388]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  v6.receiver = self;
  v6.super_class = (Class)CAFNowPlaying;
  [(CAFService *)&v6 unregisterObserver:v5];
}

- (CAFStringCharacteristic)currentMediaSourceIdentifierCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000032000023"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000032000023"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFStringCharacteristic *)v11;
}

- (NSString)currentMediaSourceIdentifier
{
  objc_super v2 = [(CAFNowPlaying *)self currentMediaSourceIdentifierCharacteristic];
  v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (CAFStringCharacteristic)titleCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000032000003"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000032000003"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFStringCharacteristic *)v11;
}

- (NSString)title
{
  objc_super v2 = [(CAFNowPlaying *)self titleCharacteristic];
  v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (CAFStringCharacteristic)artistCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000032000004"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000032000004"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFStringCharacteristic *)v11;
}

- (NSString)artist
{
  objc_super v2 = [(CAFNowPlaying *)self artistCharacteristic];
  v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (CAFStringCharacteristic)albumCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000032000005"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000032000005"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFStringCharacteristic *)v11;
}

- (NSString)album
{
  objc_super v2 = [(CAFNowPlaying *)self albumCharacteristic];
  v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (CAFStringCharacteristic)userVisibleDescriptionCharacteristic
{
  v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000030000005"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000030000005"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFStringCharacteristic *)v11;
}

- (NSString)userVisibleDescription
{
  objc_super v2 = [(CAFNowPlaying *)self userVisibleDescriptionCharacteristic];
  v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (BOOL)hasUserVisibleDescription
{
  objc_super v2 = [(CAFNowPlaying *)self userVisibleDescriptionCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFDataCharacteristic)artworkCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000032000020"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000032000020"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFDataCharacteristic *)v11;
}

- (NSData)artwork
{
  objc_super v2 = [(CAFNowPlaying *)self artworkCharacteristic];
  BOOL v3 = [v2 dataValue];

  return (NSData *)v3;
}

- (CAFMeasurementCharacteristic)jumpBackwardIntervalCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000032000032"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000032000032"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)jumpBackwardInterval
{
  objc_super v2 = [(CAFNowPlaying *)self jumpBackwardIntervalCharacteristic];
  BOOL v3 = [v2 measurementValue];

  return (NSMeasurement *)v3;
}

- (CAFUInt16Range)jumpBackwardIntervalRange
{
  objc_super v2 = [(CAFNowPlaying *)self jumpBackwardIntervalCharacteristic];
  BOOL v3 = [v2 range];
  id v4 = [v3 uInt16Range];

  return (CAFUInt16Range *)v4;
}

- (BOOL)hasJumpBackwardInterval
{
  objc_super v2 = [(CAFNowPlaying *)self jumpBackwardIntervalCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFMeasurementCharacteristic)jumpForwardIntervalCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000032000033"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000032000033"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)jumpForwardInterval
{
  objc_super v2 = [(CAFNowPlaying *)self jumpForwardIntervalCharacteristic];
  BOOL v3 = [v2 measurementValue];

  return (NSMeasurement *)v3;
}

- (CAFUInt16Range)jumpForwardIntervalRange
{
  objc_super v2 = [(CAFNowPlaying *)self jumpForwardIntervalCharacteristic];
  BOOL v3 = [v2 range];
  id v4 = [v3 uInt16Range];

  return (CAFUInt16Range *)v4;
}

- (BOOL)hasJumpForwardInterval
{
  objc_super v2 = [(CAFNowPlaying *)self jumpForwardIntervalCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFPlaybackStateCharacteristic)playbackStateCharacteristic
{
  BOOL v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  objc_super v6 = [v5 registrations];
  v7 = [(CAFService *)self accessory];
  v8 = [(id)objc_opt_class() accessoryIdentifier];
  v9 = [(id)objc_opt_class() serviceIdentifier];
  [v6 validateRegisteredForAccessory:v8 service:v9 characteristic:@"0x0000000032000034"];

  objc_opt_class();
  id v10 = [(CAFService *)self characteristicForType:@"0x0000000032000034"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (CAFPlaybackStateCharacteristic *)v11;
}

- (unsigned)playbackState
{
  objc_super v2 = [(CAFNowPlaying *)self playbackStateCharacteristic];
  unsigned __int8 v3 = [v2 playbackStateValue];

  return v3;
}

- (BOOL)hasPlaybackState
{
  objc_super v2 = [(CAFNowPlaying *)self playbackStateCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFPlayControl)playControl
{
  objc_opt_class();
  id v3 = [(CAFService *)self controlForType:@"0x000000000F000032"];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (CAFPlayControl *)v4;
}

- (void)playWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFNowPlaying *)self playControl];
  objc_super v6 = v5;
  if (v5)
  {
    [v5 playWithCompletion:v4];
  }
  else if (v4)
  {
    v7 = dispatch_get_global_queue(33, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __36__CAFNowPlaying_playWithCompletion___block_invoke;
    block[3] = &unk_265263360;
    id v9 = v4;
    dispatch_async(v7, block);
  }
}

void __36__CAFNowPlaying_playWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:9 userInfo:0];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (BOOL)hasPlay
{
  id v2 = [(CAFNowPlaying *)self playControl];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)playDisabled
{
  id v2 = [(CAFNowPlaying *)self playControl];
  char v3 = [v2 isDisabled];

  return v3;
}

- (CAFPauseControl)pauseControl
{
  objc_opt_class();
  id v3 = [(CAFService *)self controlForType:@"0x000000000F000033"];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (CAFPauseControl *)v4;
}

- (void)pauseWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFNowPlaying *)self pauseControl];
  objc_super v6 = v5;
  if (v5)
  {
    [v5 pauseWithCompletion:v4];
  }
  else if (v4)
  {
    v7 = dispatch_get_global_queue(33, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __37__CAFNowPlaying_pauseWithCompletion___block_invoke;
    block[3] = &unk_265263360;
    id v9 = v4;
    dispatch_async(v7, block);
  }
}

void __37__CAFNowPlaying_pauseWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:9 userInfo:0];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (BOOL)hasPause
{
  id v2 = [(CAFNowPlaying *)self pauseControl];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)pauseDisabled
{
  id v2 = [(CAFNowPlaying *)self pauseControl];
  char v3 = [v2 isDisabled];

  return v3;
}

- (CAFStopControl)stopControl
{
  objc_opt_class();
  id v3 = [(CAFService *)self controlForType:@"0x000000000F000034"];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (CAFStopControl *)v4;
}

- (void)stopWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFNowPlaying *)self stopControl];
  objc_super v6 = v5;
  if (v5)
  {
    [v5 stopWithCompletion:v4];
  }
  else if (v4)
  {
    v7 = dispatch_get_global_queue(33, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __36__CAFNowPlaying_stopWithCompletion___block_invoke;
    block[3] = &unk_265263360;
    id v9 = v4;
    dispatch_async(v7, block);
  }
}

void __36__CAFNowPlaying_stopWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:9 userInfo:0];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (BOOL)hasStop
{
  id v2 = [(CAFNowPlaying *)self stopControl];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)stopDisabled
{
  id v2 = [(CAFNowPlaying *)self stopControl];
  char v3 = [v2 isDisabled];

  return v3;
}

- (CAFNextItemControl)nextItemControl
{
  objc_opt_class();
  id v3 = [(CAFService *)self controlForType:@"0x000000000F000035"];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (CAFNextItemControl *)v4;
}

- (void)nextItemWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFNowPlaying *)self nextItemControl];
  objc_super v6 = v5;
  if (v5)
  {
    [v5 nextItemWithCompletion:v4];
  }
  else if (v4)
  {
    v7 = dispatch_get_global_queue(33, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __40__CAFNowPlaying_nextItemWithCompletion___block_invoke;
    block[3] = &unk_265263360;
    id v9 = v4;
    dispatch_async(v7, block);
  }
}

void __40__CAFNowPlaying_nextItemWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:9 userInfo:0];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (BOOL)hasNextItem
{
  id v2 = [(CAFNowPlaying *)self nextItemControl];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)nextItemDisabled
{
  id v2 = [(CAFNowPlaying *)self nextItemControl];
  char v3 = [v2 isDisabled];

  return v3;
}

- (CAFPreviousItemControl)previousItemControl
{
  objc_opt_class();
  id v3 = [(CAFService *)self controlForType:@"0x000000000F000036"];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (CAFPreviousItemControl *)v4;
}

- (void)previousItemWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFNowPlaying *)self previousItemControl];
  objc_super v6 = v5;
  if (v5)
  {
    [v5 previousItemWithCompletion:v4];
  }
  else if (v4)
  {
    v7 = dispatch_get_global_queue(33, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __44__CAFNowPlaying_previousItemWithCompletion___block_invoke;
    block[3] = &unk_265263360;
    id v9 = v4;
    dispatch_async(v7, block);
  }
}

void __44__CAFNowPlaying_previousItemWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:9 userInfo:0];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (BOOL)hasPreviousItem
{
  id v2 = [(CAFNowPlaying *)self previousItemControl];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)previousItemDisabled
{
  id v2 = [(CAFNowPlaying *)self previousItemControl];
  char v3 = [v2 isDisabled];

  return v3;
}

- (CAFBeginSeekForwardControl)beginSeekForwardControl
{
  objc_opt_class();
  id v3 = [(CAFService *)self controlForType:@"0x000000000F000037"];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (CAFBeginSeekForwardControl *)v4;
}

- (void)beginSeekForwardWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFNowPlaying *)self beginSeekForwardControl];
  objc_super v6 = v5;
  if (v5)
  {
    [v5 beginSeekForwardWithCompletion:v4];
  }
  else if (v4)
  {
    v7 = dispatch_get_global_queue(33, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__CAFNowPlaying_beginSeekForwardWithCompletion___block_invoke;
    block[3] = &unk_265263360;
    id v9 = v4;
    dispatch_async(v7, block);
  }
}

void __48__CAFNowPlaying_beginSeekForwardWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:9 userInfo:0];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (BOOL)hasBeginSeekForward
{
  id v2 = [(CAFNowPlaying *)self beginSeekForwardControl];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)beginSeekForwardDisabled
{
  id v2 = [(CAFNowPlaying *)self beginSeekForwardControl];
  char v3 = [v2 isDisabled];

  return v3;
}

- (CAFBeginSeekBackwardControl)beginSeekBackwardControl
{
  objc_opt_class();
  id v3 = [(CAFService *)self controlForType:@"0x000000000F000038"];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (CAFBeginSeekBackwardControl *)v4;
}

- (void)beginSeekBackwardWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFNowPlaying *)self beginSeekBackwardControl];
  objc_super v6 = v5;
  if (v5)
  {
    [v5 beginSeekBackwardWithCompletion:v4];
  }
  else if (v4)
  {
    v7 = dispatch_get_global_queue(33, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49__CAFNowPlaying_beginSeekBackwardWithCompletion___block_invoke;
    block[3] = &unk_265263360;
    id v9 = v4;
    dispatch_async(v7, block);
  }
}

void __49__CAFNowPlaying_beginSeekBackwardWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:9 userInfo:0];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (BOOL)hasBeginSeekBackward
{
  id v2 = [(CAFNowPlaying *)self beginSeekBackwardControl];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)beginSeekBackwardDisabled
{
  id v2 = [(CAFNowPlaying *)self beginSeekBackwardControl];
  char v3 = [v2 isDisabled];

  return v3;
}

- (CAFEndSeekControl)endSeekControl
{
  objc_opt_class();
  id v3 = [(CAFService *)self controlForType:@"0x000000000F000039"];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (CAFEndSeekControl *)v4;
}

- (void)endSeekWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFNowPlaying *)self endSeekControl];
  objc_super v6 = v5;
  if (v5)
  {
    [v5 endSeekWithCompletion:v4];
  }
  else if (v4)
  {
    v7 = dispatch_get_global_queue(33, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__CAFNowPlaying_endSeekWithCompletion___block_invoke;
    block[3] = &unk_265263360;
    id v9 = v4;
    dispatch_async(v7, block);
  }
}

void __39__CAFNowPlaying_endSeekWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:9 userInfo:0];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (BOOL)hasEndSeek
{
  id v2 = [(CAFNowPlaying *)self endSeekControl];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAFJumpForwardControl)jumpForwardControl
{
  objc_opt_class();
  id v3 = [(CAFService *)self controlForType:@"0x000000000F000040"];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (CAFJumpForwardControl *)v4;
}

- (void)jumpForwardWithJumpInterval:(unsigned __int16)a3 completion:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  v7 = [(CAFNowPlaying *)self jumpForwardControl];
  v8 = v7;
  if (v7)
  {
    [v7 jumpForwardWithJumpInterval:v4 completion:v6];
  }
  else if (v6)
  {
    id v9 = dispatch_get_global_queue(33, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __56__CAFNowPlaying_jumpForwardWithJumpInterval_completion___block_invoke;
    block[3] = &unk_265263360;
    id v11 = v6;
    dispatch_async(v9, block);
  }
}

void __56__CAFNowPlaying_jumpForwardWithJumpInterval_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:9 userInfo:0];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (BOOL)hasJumpForward
{
  id v2 = [(CAFNowPlaying *)self jumpForwardControl];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)jumpForwardDisabled
{
  id v2 = [(CAFNowPlaying *)self jumpForwardControl];
  char v3 = [v2 isDisabled];

  return v3;
}

- (CAFJumpBackwardControl)jumpBackwardControl
{
  objc_opt_class();
  id v3 = [(CAFService *)self controlForType:@"0x000000000F00004A"];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (CAFJumpBackwardControl *)v4;
}

- (void)jumpBackwardWithJumpInterval:(unsigned __int16)a3 completion:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  v7 = [(CAFNowPlaying *)self jumpBackwardControl];
  v8 = v7;
  if (v7)
  {
    [v7 jumpBackwardWithJumpInterval:v4 completion:v6];
  }
  else if (v6)
  {
    id v9 = dispatch_get_global_queue(33, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__CAFNowPlaying_jumpBackwardWithJumpInterval_completion___block_invoke;
    block[3] = &unk_265263360;
    id v11 = v6;
    dispatch_async(v9, block);
  }
}

void __57__CAFNowPlaying_jumpBackwardWithJumpInterval_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:9 userInfo:0];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (BOOL)hasJumpBackward
{
  id v2 = [(CAFNowPlaying *)self jumpBackwardControl];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)jumpBackwardDisabled
{
  id v2 = [(CAFNowPlaying *)self jumpBackwardControl];
  char v3 = [v2 isDisabled];

  return v3;
}

- (CAFTuneToIdentifierControl)tuneToIdentifierControl
{
  objc_opt_class();
  id v3 = [(CAFService *)self controlForType:@"0x000000000F00004B"];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (CAFTuneToIdentifierControl *)v4;
}

- (void)tuneToIdentifier:(id)a3 sourceIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(CAFNowPlaying *)self tuneToIdentifierControl];
  v12 = v11;
  if (v11)
  {
    [v11 tuneToIdentifier:v8 sourceIdentifier:v9 completion:v10];
  }
  else if (v10)
  {
    v13 = dispatch_get_global_queue(33, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__CAFNowPlaying_tuneToIdentifier_sourceIdentifier_completion___block_invoke;
    block[3] = &unk_265263360;
    id v15 = v10;
    dispatch_async(v13, block);
  }
}

void __62__CAFNowPlaying_tuneToIdentifier_sourceIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:9 userInfo:0];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (CAFTuneToFrequencyControl)tuneToFrequencyControl
{
  objc_opt_class();
  id v3 = [(CAFService *)self controlForType:@"0x000000000F00004C"];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (CAFTuneToFrequencyControl *)v4;
}

- (void)tuneToFrequency:(unsigned int)a3 sourceIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(CAFNowPlaying *)self tuneToFrequencyControl];
  id v11 = v10;
  if (v10)
  {
    [v10 tuneToFrequency:v6 sourceIdentifier:v8 completion:v9];
  }
  else if (v9)
  {
    v12 = dispatch_get_global_queue(33, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__CAFNowPlaying_tuneToFrequency_sourceIdentifier_completion___block_invoke;
    block[3] = &unk_265263360;
    id v14 = v9;
    dispatch_async(v12, block);
  }
}

void __61__CAFNowPlaying_tuneToFrequency_sourceIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:9 userInfo:0];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (CAFChangeMediaSourceControl)changeMediaSourceControl
{
  objc_opt_class();
  id v3 = [(CAFService *)self controlForType:@"0x000000000F00004D"];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (CAFChangeMediaSourceControl *)v4;
}

- (void)changeMediaSourceWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CAFNowPlaying *)self changeMediaSourceControl];
  id v9 = v8;
  if (v8)
  {
    [v8 changeMediaSourceWithIdentifier:v6 completion:v7];
  }
  else if (v7)
  {
    id v10 = dispatch_get_global_queue(33, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__CAFNowPlaying_changeMediaSourceWithIdentifier_completion___block_invoke;
    block[3] = &unk_265263360;
    id v12 = v7;
    dispatch_async(v10, block);
  }
}

void __60__CAFNowPlaying_changeMediaSourceWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:9 userInfo:0];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (CAFSetArtistSongNotificationControl)setArtistSongNotificationControl
{
  objc_opt_class();
  id v3 = [(CAFService *)self controlForType:@"0x000000000F00004E"];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (CAFSetArtistSongNotificationControl *)v4;
}

- (void)setArtistSongNotificationWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFNowPlaying *)self setArtistSongNotificationControl];
  id v6 = v5;
  if (v5)
  {
    [v5 setArtistSongNotificationWithCompletion:v4];
  }
  else if (v4)
  {
    id v7 = dispatch_get_global_queue(33, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__CAFNowPlaying_setArtistSongNotificationWithCompletion___block_invoke;
    block[3] = &unk_265263360;
    id v9 = v4;
    dispatch_async(v7, block);
  }
}

void __57__CAFNowPlaying_setArtistSongNotificationWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:9 userInfo:0];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (BOOL)hasSetArtistSongNotification
{
  id v2 = [(CAFNowPlaying *)self setArtistSongNotificationControl];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)setArtistSongNotificationDisabled
{
  id v2 = [(CAFNowPlaying *)self setArtistSongNotificationControl];
  char v3 = [v2 isDisabled];

  return v3;
}

+ (id)serviceIdentifier
{
  return @"0x0000000014000001";
}

+ (id)observerProtocol
{
  return &unk_26FDB0888;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 characteristicType];
  if ([v7 isEqual:@"0x0000000032000023"])
  {
    id v8 = [v6 uniqueIdentifier];
    id v9 = [(CAFNowPlaying *)self currentMediaSourceIdentifierCharacteristic];
    id v10 = [v9 uniqueIdentifier];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      id v12 = [(CAFService *)self observers];
      v13 = [(CAFNowPlaying *)self currentMediaSourceIdentifier];
      [v12 nowPlayingService:self didUpdateCurrentMediaSourceIdentifier:v13];
LABEL_32:

      goto LABEL_33;
    }
  }
  else
  {
  }
  id v14 = [v6 characteristicType];
  if ([v14 isEqual:@"0x0000000032000003"])
  {
    id v15 = [v6 uniqueIdentifier];
    v16 = [(CAFNowPlaying *)self titleCharacteristic];
    v17 = [v16 uniqueIdentifier];
    int v18 = [v15 isEqual:v17];

    if (v18)
    {
      id v12 = [(CAFService *)self observers];
      v13 = [(CAFNowPlaying *)self title];
      [v12 nowPlayingService:self didUpdateTitle:v13];
      goto LABEL_32;
    }
  }
  else
  {
  }
  v19 = [v6 characteristicType];
  if ([v19 isEqual:@"0x0000000032000004"])
  {
    v20 = [v6 uniqueIdentifier];
    v21 = [(CAFNowPlaying *)self artistCharacteristic];
    v22 = [v21 uniqueIdentifier];
    int v23 = [v20 isEqual:v22];

    if (v23)
    {
      id v12 = [(CAFService *)self observers];
      v13 = [(CAFNowPlaying *)self artist];
      [v12 nowPlayingService:self didUpdateArtist:v13];
      goto LABEL_32;
    }
  }
  else
  {
  }
  v24 = [v6 characteristicType];
  if ([v24 isEqual:@"0x0000000032000005"])
  {
    v25 = [v6 uniqueIdentifier];
    v26 = [(CAFNowPlaying *)self albumCharacteristic];
    v27 = [v26 uniqueIdentifier];
    int v28 = [v25 isEqual:v27];

    if (v28)
    {
      id v12 = [(CAFService *)self observers];
      v13 = [(CAFNowPlaying *)self album];
      [v12 nowPlayingService:self didUpdateAlbum:v13];
      goto LABEL_32;
    }
  }
  else
  {
  }
  v29 = [v6 characteristicType];
  if ([v29 isEqual:@"0x0000000030000005"])
  {
    v30 = [v6 uniqueIdentifier];
    v31 = [(CAFNowPlaying *)self userVisibleDescriptionCharacteristic];
    v32 = [v31 uniqueIdentifier];
    int v33 = [v30 isEqual:v32];

    if (v33)
    {
      id v12 = [(CAFService *)self observers];
      v13 = [(CAFNowPlaying *)self userVisibleDescription];
      [v12 nowPlayingService:self didUpdateUserVisibleDescription:v13];
      goto LABEL_32;
    }
  }
  else
  {
  }
  v34 = [v6 characteristicType];
  if ([v34 isEqual:@"0x0000000032000020"])
  {
    v35 = [v6 uniqueIdentifier];
    v36 = [(CAFNowPlaying *)self artworkCharacteristic];
    v37 = [v36 uniqueIdentifier];
    int v38 = [v35 isEqual:v37];

    if (v38)
    {
      id v12 = [(CAFService *)self observers];
      v13 = [(CAFNowPlaying *)self artwork];
      [v12 nowPlayingService:self didUpdateArtwork:v13];
      goto LABEL_32;
    }
  }
  else
  {
  }
  v39 = [v6 characteristicType];
  if ([v39 isEqual:@"0x0000000032000032"])
  {
    v40 = [v6 uniqueIdentifier];
    v41 = [(CAFNowPlaying *)self jumpBackwardIntervalCharacteristic];
    v42 = [v41 uniqueIdentifier];
    int v43 = [v40 isEqual:v42];

    if (v43)
    {
      id v12 = [(CAFService *)self observers];
      v13 = [(CAFNowPlaying *)self jumpBackwardInterval];
      [v12 nowPlayingService:self didUpdateJumpBackwardInterval:v13];
      goto LABEL_32;
    }
  }
  else
  {
  }
  v44 = [v6 characteristicType];
  if ([v44 isEqual:@"0x0000000032000033"])
  {
    v45 = [v6 uniqueIdentifier];
    v46 = [(CAFNowPlaying *)self jumpForwardIntervalCharacteristic];
    v47 = [v46 uniqueIdentifier];
    int v48 = [v45 isEqual:v47];

    if (v48)
    {
      id v12 = [(CAFService *)self observers];
      v13 = [(CAFNowPlaying *)self jumpForwardInterval];
      [v12 nowPlayingService:self didUpdateJumpForwardInterval:v13];
      goto LABEL_32;
    }
  }
  else
  {
  }
  id v12 = [v6 characteristicType];
  if ([v12 isEqual:@"0x0000000032000034"])
  {
    v49 = [v6 uniqueIdentifier];
    v50 = [(CAFNowPlaying *)self playbackStateCharacteristic];
    v51 = [v50 uniqueIdentifier];
    int v52 = [v49 isEqual:v51];

    if (!v52) {
      goto LABEL_34;
    }
    id v12 = [(CAFService *)self observers];
    objc_msgSend(v12, "nowPlayingService:didUpdatePlaybackState:", self, -[CAFNowPlaying playbackState](self, "playbackState"));
  }
LABEL_33:

LABEL_34:
  v53.receiver = self;
  v53.super_class = (Class)CAFNowPlaying;
  [(CAFService *)&v53 _characteristicDidUpdate:v6 fromGroupUpdate:v4];
}

- (void)_controlDidUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [v4 controlType];
  if ([v5 isEqual:@"0x000000000F000032"])
  {
    id v6 = [v4 uniqueIdentifier];
    id v7 = [(CAFNowPlaying *)self playControl];
    id v8 = [v7 uniqueIdentifier];
    int v9 = [v6 isEqual:v8];

    if (v9)
    {
      id v10 = [(CAFService *)self observers];
      [v10 nowPlayingServiceDidUpdatePlay:self];
LABEL_40:

      goto LABEL_41;
    }
  }
  else
  {
  }
  int v11 = [v4 controlType];
  if ([v11 isEqual:@"0x000000000F000033"])
  {
    id v12 = [v4 uniqueIdentifier];
    v13 = [(CAFNowPlaying *)self pauseControl];
    id v14 = [v13 uniqueIdentifier];
    int v15 = [v12 isEqual:v14];

    if (v15)
    {
      id v10 = [(CAFService *)self observers];
      [v10 nowPlayingServiceDidUpdatePause:self];
      goto LABEL_40;
    }
  }
  else
  {
  }
  v16 = [v4 controlType];
  if ([v16 isEqual:@"0x000000000F000034"])
  {
    v17 = [v4 uniqueIdentifier];
    int v18 = [(CAFNowPlaying *)self stopControl];
    v19 = [v18 uniqueIdentifier];
    int v20 = [v17 isEqual:v19];

    if (v20)
    {
      id v10 = [(CAFService *)self observers];
      [v10 nowPlayingServiceDidUpdateStop:self];
      goto LABEL_40;
    }
  }
  else
  {
  }
  v21 = [v4 controlType];
  if ([v21 isEqual:@"0x000000000F000035"])
  {
    v22 = [v4 uniqueIdentifier];
    int v23 = [(CAFNowPlaying *)self nextItemControl];
    v24 = [v23 uniqueIdentifier];
    int v25 = [v22 isEqual:v24];

    if (v25)
    {
      id v10 = [(CAFService *)self observers];
      [v10 nowPlayingServiceDidUpdateNextItem:self];
      goto LABEL_40;
    }
  }
  else
  {
  }
  v26 = [v4 controlType];
  if ([v26 isEqual:@"0x000000000F000036"])
  {
    v27 = [v4 uniqueIdentifier];
    int v28 = [(CAFNowPlaying *)self previousItemControl];
    v29 = [v28 uniqueIdentifier];
    int v30 = [v27 isEqual:v29];

    if (v30)
    {
      id v10 = [(CAFService *)self observers];
      [v10 nowPlayingServiceDidUpdatePreviousItem:self];
      goto LABEL_40;
    }
  }
  else
  {
  }
  v31 = [v4 controlType];
  if ([v31 isEqual:@"0x000000000F000037"])
  {
    v32 = [v4 uniqueIdentifier];
    int v33 = [(CAFNowPlaying *)self beginSeekForwardControl];
    v34 = [v33 uniqueIdentifier];
    int v35 = [v32 isEqual:v34];

    if (v35)
    {
      id v10 = [(CAFService *)self observers];
      [v10 nowPlayingServiceDidUpdateBeginSeekForward:self];
      goto LABEL_40;
    }
  }
  else
  {
  }
  v36 = [v4 controlType];
  if ([v36 isEqual:@"0x000000000F000038"])
  {
    v37 = [v4 uniqueIdentifier];
    int v38 = [(CAFNowPlaying *)self beginSeekBackwardControl];
    v39 = [v38 uniqueIdentifier];
    int v40 = [v37 isEqual:v39];

    if (v40)
    {
      id v10 = [(CAFService *)self observers];
      [v10 nowPlayingServiceDidUpdateBeginSeekBackward:self];
      goto LABEL_40;
    }
  }
  else
  {
  }
  v41 = [v4 controlType];
  if ([v41 isEqual:@"0x000000000F000040"])
  {
    v42 = [v4 uniqueIdentifier];
    int v43 = [(CAFNowPlaying *)self jumpForwardControl];
    v44 = [v43 uniqueIdentifier];
    int v45 = [v42 isEqual:v44];

    if (v45)
    {
      id v10 = [(CAFService *)self observers];
      [v10 nowPlayingServiceDidUpdateJumpForward:self];
      goto LABEL_40;
    }
  }
  else
  {
  }
  v46 = [v4 controlType];
  if ([v46 isEqual:@"0x000000000F00004A"])
  {
    v47 = [v4 uniqueIdentifier];
    int v48 = [(CAFNowPlaying *)self jumpBackwardControl];
    v49 = [v48 uniqueIdentifier];
    int v50 = [v47 isEqual:v49];

    if (v50)
    {
      id v10 = [(CAFService *)self observers];
      [v10 nowPlayingServiceDidUpdateJumpBackward:self];
      goto LABEL_40;
    }
  }
  else
  {
  }
  id v10 = [v4 controlType];
  if (![v10 isEqual:@"0x000000000F00004E"]) {
    goto LABEL_40;
  }
  v51 = [v4 uniqueIdentifier];
  int v52 = [(CAFNowPlaying *)self setArtistSongNotificationControl];
  objc_super v53 = [v52 uniqueIdentifier];
  int v54 = [v51 isEqual:v53];

  if (v54)
  {
    id v10 = [(CAFService *)self observers];
    [v10 nowPlayingServiceDidUpdateSetArtistSongNotification:self];
    goto LABEL_40;
  }
LABEL_41:
  v55.receiver = self;
  v55.super_class = (Class)CAFNowPlaying;
  [(CAFService *)&v55 _controlDidUpdate:v4];
}

- (BOOL)registeredForCurrentMediaSourceIdentifier
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  id v7 = [(CAFService *)self accessory];
  id v8 = [(id)objc_opt_class() accessoryIdentifier];
  int v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000032000023"];

  return v10;
}

- (BOOL)registeredForTitle
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  id v7 = [(CAFService *)self accessory];
  id v8 = [(id)objc_opt_class() accessoryIdentifier];
  int v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000032000003"];

  return v10;
}

- (BOOL)registeredForArtist
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  id v7 = [(CAFService *)self accessory];
  id v8 = [(id)objc_opt_class() accessoryIdentifier];
  int v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000032000004"];

  return v10;
}

- (BOOL)registeredForAlbum
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  id v7 = [(CAFService *)self accessory];
  id v8 = [(id)objc_opt_class() accessoryIdentifier];
  int v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000032000005"];

  return v10;
}

- (BOOL)registeredForUserVisibleDescription
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  id v7 = [(CAFService *)self accessory];
  id v8 = [(id)objc_opt_class() accessoryIdentifier];
  int v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000030000005"];

  return v10;
}

- (BOOL)registeredForArtwork
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  id v7 = [(CAFService *)self accessory];
  id v8 = [(id)objc_opt_class() accessoryIdentifier];
  int v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000032000020"];

  return v10;
}

- (BOOL)registeredForJumpBackwardInterval
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  id v7 = [(CAFService *)self accessory];
  id v8 = [(id)objc_opt_class() accessoryIdentifier];
  int v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000032000032"];

  return v10;
}

- (BOOL)registeredForJumpForwardInterval
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  id v7 = [(CAFService *)self accessory];
  id v8 = [(id)objc_opt_class() accessoryIdentifier];
  int v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000032000033"];

  return v10;
}

- (BOOL)registeredForPlaybackState
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  id v7 = [(CAFService *)self accessory];
  id v8 = [(id)objc_opt_class() accessoryIdentifier];
  int v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 characteristic:@"0x0000000032000034"];

  return v10;
}

- (BOOL)registeredForPlay
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  id v7 = [(CAFService *)self accessory];
  id v8 = [(id)objc_opt_class() accessoryIdentifier];
  int v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 control:@"0x000000000F000032"];

  return v10;
}

- (BOOL)registeredForPause
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  id v7 = [(CAFService *)self accessory];
  id v8 = [(id)objc_opt_class() accessoryIdentifier];
  int v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 control:@"0x000000000F000033"];

  return v10;
}

- (BOOL)registeredForStop
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  id v7 = [(CAFService *)self accessory];
  id v8 = [(id)objc_opt_class() accessoryIdentifier];
  int v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 control:@"0x000000000F000034"];

  return v10;
}

- (BOOL)registeredForNextItem
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  id v7 = [(CAFService *)self accessory];
  id v8 = [(id)objc_opt_class() accessoryIdentifier];
  int v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 control:@"0x000000000F000035"];

  return v10;
}

- (BOOL)registeredForPreviousItem
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  id v7 = [(CAFService *)self accessory];
  id v8 = [(id)objc_opt_class() accessoryIdentifier];
  int v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 control:@"0x000000000F000036"];

  return v10;
}

- (BOOL)registeredForBeginSeekForward
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  id v7 = [(CAFService *)self accessory];
  id v8 = [(id)objc_opt_class() accessoryIdentifier];
  int v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 control:@"0x000000000F000037"];

  return v10;
}

- (BOOL)registeredForBeginSeekBackward
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  id v7 = [(CAFService *)self accessory];
  id v8 = [(id)objc_opt_class() accessoryIdentifier];
  int v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 control:@"0x000000000F000038"];

  return v10;
}

- (BOOL)registeredForEndSeek
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  id v7 = [(CAFService *)self accessory];
  id v8 = [(id)objc_opt_class() accessoryIdentifier];
  int v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 control:@"0x000000000F000039"];

  return v10;
}

- (BOOL)registeredForJumpForward
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  id v7 = [(CAFService *)self accessory];
  id v8 = [(id)objc_opt_class() accessoryIdentifier];
  int v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 control:@"0x000000000F000040"];

  return v10;
}

- (BOOL)registeredForJumpBackward
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  id v7 = [(CAFService *)self accessory];
  id v8 = [(id)objc_opt_class() accessoryIdentifier];
  int v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 control:@"0x000000000F00004A"];

  return v10;
}

- (BOOL)registeredForTuneToIdentifier
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  id v7 = [(CAFService *)self accessory];
  id v8 = [(id)objc_opt_class() accessoryIdentifier];
  int v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 control:@"0x000000000F00004B"];

  return v10;
}

- (BOOL)registeredForTuneToFrequency
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  id v7 = [(CAFService *)self accessory];
  id v8 = [(id)objc_opt_class() accessoryIdentifier];
  int v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 control:@"0x000000000F00004C"];

  return v10;
}

- (BOOL)registeredForChangeMediaSource
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  id v7 = [(CAFService *)self accessory];
  id v8 = [(id)objc_opt_class() accessoryIdentifier];
  int v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 control:@"0x000000000F00004D"];

  return v10;
}

- (BOOL)registeredForSetArtistSongNotification
{
  char v3 = [(CAFService *)self car];
  id v4 = [v3 carManager];
  id v5 = [v4 config];
  id v6 = [v5 registrations];
  id v7 = [(CAFService *)self accessory];
  id v8 = [(id)objc_opt_class() accessoryIdentifier];
  int v9 = [(id)objc_opt_class() serviceIdentifier];
  char v10 = [v6 hasAccessory:v8 service:v9 control:@"0x000000000F00004E"];

  return v10;
}

@end