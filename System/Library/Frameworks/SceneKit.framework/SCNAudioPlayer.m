@interface SCNAudioPlayer
+ (SCNAudioPlayer)audioPlayerWithAVAudioNode:(AVAudioNode *)audioNode;
+ (SCNAudioPlayer)audioPlayerWithSource:(SCNAudioSource *)source;
- (AVAudioNode)audioNode;
- (AVAudioPlayerNode)audioPlayer;
- (BOOL)completed;
- (BOOL)customAudioNode;
- (SCNAudioPlayer)initWithAVAudioNode:(AVAudioNode *)audioNode;
- (SCNAudioPlayer)initWithSource:(SCNAudioSource *)source;
- (SCNAudioSource)audioSource;
- (__C3DNode)nodeRef;
- (__C3DScene)scene;
- (id)audioBufferFormat;
- (void)dealloc;
- (void)didFinishPlayback;
- (void)play;
- (void)recycle;
- (void)reset;
- (void)setCompleted:(BOOL)a3;
- (void)setDidFinishPlayback:(void *)didFinishPlayback;
- (void)setNodeRef:(__C3DNode *)a3;
- (void)setWillStartPlayback:(void *)willStartPlayback;
- (void)willStartPlayback;
@end

@implementation SCNAudioPlayer

- (SCNAudioPlayer)initWithSource:(SCNAudioSource *)source
{
  v8.receiver = self;
  v8.super_class = (Class)SCNAudioPlayer;
  v4 = [(SCNAudioPlayer *)&v8 init];
  if (v4)
  {
    v5 = (AVAudioPlayerNode *)objc_alloc_init(MEMORY[0x263EF93C8]);
    v4->_audioNode = &v5->super;
    v4->_audioPlayer = v5;
    v4->_customAudioNode = 0;
    v6 = source;
    v4->_audioSource = v6;
    [(AVAudioPlayerNode *)v4->_audioPlayer setRenderingAlgorithm:[(SCNAudioSource *)v6 renderingAlgorithm]];
    [(SCNAudioSource *)v4->_audioSource rate];
    -[AVAudioPlayerNode setRate:](v4->_audioPlayer, "setRate:");
    [(SCNAudioSource *)v4->_audioSource volume];
    -[AVAudioPlayerNode setVolume:](v4->_audioPlayer, "setVolume:");
    [(SCNAudioSource *)v4->_audioSource reverbBlend];
    -[AVAudioPlayerNode setReverbBlend:](v4->_audioPlayer, "setReverbBlend:");
  }
  return v4;
}

- (SCNAudioPlayer)initWithAVAudioNode:(AVAudioNode *)audioNode
{
  v7.receiver = self;
  v7.super_class = (Class)SCNAudioPlayer;
  v4 = [(SCNAudioPlayer *)&v7 init];
  if (v4)
  {
    v5 = audioNode;
    v4->_customAudioNode = 1;
    v4->_audioPlayer = 0;
    v4->_audioSource = 0;
    v4->_audioNode = v5;
  }
  return v4;
}

+ (SCNAudioPlayer)audioPlayerWithAVAudioNode:(AVAudioNode *)audioNode
{
  result = [[SCNAudioPlayer alloc] initWithAVAudioNode:audioNode];
  result->_shouldRecycle = 1;
  return result;
}

- (void)reset
{
  self->_nodeRef = 0;
  self->_scene = 0;

  self->_audioSource = 0;
}

+ (SCNAudioPlayer)audioPlayerWithSource:(SCNAudioSource *)source
{
  if (gAudioPlayers && [(id)gAudioPlayers count])
  {
    v4 = (id *)[(id)gAudioPlayers anyObject];
    v5 = v4;
    [(id)gAudioPlayers removeObject:v4];
    v6 = source;
    v4[3] = v6;
    objc_msgSend(v4[2], "setRenderingAlgorithm:", -[SCNAudioSource renderingAlgorithm](v6, "renderingAlgorithm"));
    [v4[3] rate];
    objc_msgSend(v4[2], "setRate:");
    [v4[3] volume];
    objc_msgSend(v4[2], "setVolume:");
    [v4[3] reverbBlend];
    objc_msgSend(v4[2], "setReverbBlend:");
    return (SCNAudioPlayer *)v4;
  }
  else
  {
    result = [[SCNAudioPlayer alloc] initWithSource:source];
    result->_shouldRecycle = 1;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNAudioPlayer;
  [(SCNAudioPlayer *)&v3 dealloc];
}

- (void)setNodeRef:(__C3DNode *)a3
{
  self->_nodeRef = a3;
  if (a3) {
    self->_scene = (__C3DScene *)C3DGetScene(a3);
  }
}

- (__C3DNode)nodeRef
{
  return self->_nodeRef;
}

- (void)play
{
  audioSource = self->_audioSource;
  if (!audioSource || self->_customAudioNode) {
    return;
  }
  audioPlayer = self->_audioPlayer;
  uint64_t v5 = [(SCNAudioSource *)audioSource audioBuffer];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __22__SCNAudioPlayer_play__block_invoke;
  block[3] = &unk_264004DF8;
  block[4] = self;
  [(SCNAudioPlayer *)self setCompleted:0];
  BOOL v6 = [(SCNAudioSource *)self->_audioSource shouldStream];
  nodeRef = self->_nodeRef;
  if (nodeRef) {
    CFRetain(self->_nodeRef);
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __22__SCNAudioPlayer_play__block_invoke_2;
  v13[3] = &unk_264004E48;
  v13[6] = block;
  v13[7] = nodeRef;
  v13[4] = self;
  v13[5] = audioPlayer;
  if (v5)
  {
    [(AVAudioPlayerNode *)audioPlayer scheduleBuffer:v5 atTime:0 options:[(SCNAudioSource *)self->_audioSource loops] completionHandler:v13];
LABEL_9:
    char v9 = 1;
    goto LABEL_11;
  }
  if (v6)
  {
    id v8 = [(SCNAudioSource *)self->_audioSource audioFile];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __22__SCNAudioPlayer_play__block_invoke_4;
    v12[3] = &unk_264004E70;
    v12[4] = self;
    v12[5] = audioPlayer;
    v12[6] = v13;
    v12[7] = nodeRef;
    [(AVAudioPlayerNode *)audioPlayer scheduleFile:v8 atTime:0 completionHandler:v12];
    goto LABEL_9;
  }
  char v9 = 0;
LABEL_11:
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __22__SCNAudioPlayer_play__block_invoke_7;
  v11[3] = &unk_264004DF8;
  v11[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], v11);
  if ((v9 & 1) == 0)
  {
    v10 = self->_nodeRef;
    if (v10) {
      CFRelease(v10);
    }
    dispatch_async(MEMORY[0x263EF83A0], block);
    [(SCNAudioPlayer *)self setCompleted:1];
  }
}

uint64_t __22__SCNAudioPlayer_play__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) didFinishPlayback];
  if (result)
  {
    objc_super v3 = *(uint64_t (**)(void))([*(id *)(a1 + 32) didFinishPlayback] + 16);
    return v3();
  }
  return result;
}

uint64_t __22__SCNAudioPlayer_play__block_invoke_2(uint64_t a1)
{
  dispatch_async(MEMORY[0x263EF83A0], *(dispatch_block_t *)(a1 + 48));
  [*(id *)(a1 + 32) setCompleted:1];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __22__SCNAudioPlayer_play__block_invoke_3;
  v4[3] = &unk_264004E20;
  uint64_t v6 = *(void *)(a1 + 56);
  int8x16_t v2 = *(int8x16_t *)(a1 + 32);
  int8x16_t v5 = vextq_s8(v2, v2, 8uLL);
  return +[SCNTransaction postCommandWithContext:0 object:v2.i64[0] applyBlock:v4];
}

uint64_t __22__SCNAudioPlayer_play__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2)
  {
    C3DNodeRemoveAudioPlayer(v2, *(const void **)(a1 + 32), 1);
    objc_super v3 = *(const void **)(a1 + 48);
    if (v3) {
      CFRelease(v3);
    }
  }
  v4 = *(unsigned char **)(a1 + 40);
  if (v4[50])
  {
    return [v4 recycle];
  }
  else
  {
    return [v4 reset];
  }
}

uint64_t __22__SCNAudioPlayer_play__block_invoke_4(int8x16_t *a1)
{
  if ([*(id *)(a1[2].i64[0] + 24) loops] && (uint64_t v2 = a1[3].i64[1]) != 0)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __22__SCNAudioPlayer_play__block_invoke_5;
    v6[3] = &unk_264004E20;
    uint64_t v8 = v2;
    int8x16_t v3 = a1[2];
    int8x16_t v7 = vextq_s8(v3, v3, 8uLL);
    return +[SCNTransaction postCommandWithContext:0 object:v3.i64[0] applyBlock:v6];
  }
  else
  {
    int8x16_t v5 = *(uint64_t (**)(void))(a1[3].i64[0] + 16);
    return v5();
  }
}

void __22__SCNAudioPlayer_play__block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2)
  {
    C3DNodeRemoveAudioPlayer(v2, *(const void **)(a1 + 32), 1);
    int8x16_t v3 = *(const void **)(a1 + 48);
    if (v3) {
      CFRelease(v3);
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __22__SCNAudioPlayer_play__block_invoke_6;
  block[3] = &unk_264004DF8;
  block[4] = *(void *)(a1 + 40);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __22__SCNAudioPlayer_play__block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) play];
}

uint64_t __22__SCNAudioPlayer_play__block_invoke_7(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) willStartPlayback];
  if (result)
  {
    int8x16_t v3 = *(uint64_t (**)(void))([*(id *)(a1 + 32) willStartPlayback] + 16);
    return v3();
  }
  return result;
}

- (void)recycle
{
  objc_sync_enter(self);
  [(SCNAudioPlayer *)self reset];
  int8x16_t v3 = (void *)gAudioPlayers;
  if (!gAudioPlayers)
  {
    gAudioPlayers = [MEMORY[0x263EFF9C0] set];
    id v4 = (id)gAudioPlayers;
    int8x16_t v3 = (void *)gAudioPlayers;
  }
  [v3 addObject:self];

  objc_sync_exit(self);
}

- (id)audioBufferFormat
{
  return [(SCNAudioSource *)self->_audioSource audioBufferFormat];
}

- (void)willStartPlayback
{
  return self->willStartPlayback;
}

- (void)setWillStartPlayback:(void *)willStartPlayback
{
}

- (void)didFinishPlayback
{
  return self->didFinishPlayback;
}

- (void)setDidFinishPlayback:(void *)didFinishPlayback
{
}

- (AVAudioNode)audioNode
{
  return self->_audioNode;
}

- (AVAudioPlayerNode)audioPlayer
{
  return self->_audioPlayer;
}

- (SCNAudioSource)audioSource
{
  return self->_audioSource;
}

- (__C3DScene)scene
{
  return self->_scene;
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (BOOL)customAudioNode
{
  return self->_customAudioNode;
}

@end