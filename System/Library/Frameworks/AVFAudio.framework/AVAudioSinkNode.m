@interface AVAudioSinkNode
+ (id)pullInputBlockFromReceiverBlock:(id)a3;
- (AVAudioSinkNode)initWithReceiverBlock:(AVAudioSinkNodeReceiverBlock)block;
@end

@implementation AVAudioSinkNode

- (AVAudioSinkNode)initWithReceiverBlock:(AVAudioSinkNodeReceiverBlock)block
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  +[AVAudioSinkNode pullInputBlockFromReceiverBlock:block];
  operator new();
}

+ (id)pullInputBlockFromReceiverBlock:(id)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__AVAudioSinkNode_pullInputBlockFromReceiverBlock___block_invoke;
  aBlock[3] = &unk_1E5964E58;
  aBlock[4] = a3;
  return _Block_copy(aBlock);
}

uint64_t __51__AVAudioSinkNode_pullInputBlockFromReceiverBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end