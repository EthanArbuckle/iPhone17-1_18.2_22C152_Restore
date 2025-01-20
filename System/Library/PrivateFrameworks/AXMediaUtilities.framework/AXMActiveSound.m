@interface AXMActiveSound
- (AVAudioPlayerNode)player;
- (AVAudioUnitTimePitch)timePitch;
- (AXMActiveSound)init;
- (BOOL)beginPlayback:(id)a3 withError:(id *)a4;
- (void)connectToEngine:(id)a3;
- (void)disconnectFromEngine:(id)a3;
- (void)setPlayer:(id)a3;
- (void)setTimePitch:(id)a3;
@end

@implementation AXMActiveSound

- (AXMActiveSound)init
{
  v6.receiver = self;
  v6.super_class = (Class)AXMActiveSound;
  v2 = [(AXMActiveSound *)&v6 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F153D0]);
    [(AXMActiveSound *)v2 setPlayer:v3];

    id v4 = objc_alloc_init(MEMORY[0x1E4F15438]);
    [(AXMActiveSound *)v2 setTimePitch:v4];
  }
  return v2;
}

- (void)connectToEngine:(id)a3
{
  id v4 = a3;
  v5 = [(AXMActiveSound *)self player];
  [v4 attachNode:v5];

  id v11 = [v4 mainMixerNode];
  objc_super v6 = (void *)[objc_alloc(MEMORY[0x1E4F153A0]) initStandardFormatWithSampleRate:2 channels:44100.0];
  v7 = [(AXMActiveSound *)self timePitch];
  [v4 attachNode:v7];

  v8 = [(AXMActiveSound *)self player];
  v9 = [(AXMActiveSound *)self timePitch];
  [v4 connect:v8 to:v9 fromBus:0 toBus:0 format:v6];

  v10 = [(AXMActiveSound *)self timePitch];
  objc_msgSend(v4, "connect:to:fromBus:toBus:format:", v10, v11, 0, objc_msgSend(v11, "nextAvailableInputBus"), v6);
}

- (void)disconnectFromEngine:(id)a3
{
  id v4 = a3;
  v5 = [(AXMActiveSound *)self player];
  [v4 detachNode:v5];

  id v6 = [(AXMActiveSound *)self timePitch];
  [v4 detachNode:v6];
}

- (BOOL)beginPlayback:(id)a3 withError:(id *)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F153B0];
  id v7 = a3;
  id v8 = [v6 alloc];
  v9 = [v7 processingFormat];
  v10 = objc_msgSend(v8, "initWithPCMFormat:frameCapacity:", v9, objc_msgSend(v7, "length"));

  int v11 = [v7 readIntoBuffer:v10 error:a4];
  if (v11)
  {
    v12 = [(AXMActiveSound *)self player];
    [v12 scheduleBuffer:v10 atTime:0 options:1 completionHandler:0];

    v13 = [(AXMActiveSound *)self player];
    [v13 play];
  }
  return v11;
}

- (AVAudioPlayerNode)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (AVAudioUnitTimePitch)timePitch
{
  return self->_timePitch;
}

- (void)setTimePitch:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timePitch, 0);

  objc_storeStrong((id *)&self->_player, 0);
}

@end