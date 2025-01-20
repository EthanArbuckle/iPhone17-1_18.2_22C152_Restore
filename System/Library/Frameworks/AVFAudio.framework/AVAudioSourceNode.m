@interface AVAudioSourceNode
+ (id)pullInputBlockFromRenderBlock:(id)a3;
- (AVAudioSourceNode)initWithFormat:(AVAudioFormat *)format renderBlock:(AVAudioSourceNodeRenderBlock)block;
- (AVAudioSourceNode)initWithRenderBlock:(AVAudioSourceNodeRenderBlock)block;
@end

@implementation AVAudioSourceNode

- (AVAudioSourceNode)initWithFormat:(AVAudioFormat *)format renderBlock:(AVAudioSourceNodeRenderBlock)block
{
}

- (AVAudioSourceNode)initWithRenderBlock:(AVAudioSourceNodeRenderBlock)block
{
}

+ (id)pullInputBlockFromRenderBlock:(id)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__AVAudioSourceNode_pullInputBlockFromRenderBlock___block_invoke;
  aBlock[3] = &unk_1E5964E58;
  aBlock[4] = a3;
  return _Block_copy(aBlock);
}

uint64_t __51__AVAudioSourceNode_pullInputBlockFromRenderBlock___block_invoke(uint64_t a1, _DWORD *a2)
{
  char v4 = 0;
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v4) {
    *a2 |= 0x10u;
  }
  return result;
}

@end