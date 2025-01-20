@interface AVAudioSessionCallbackDispatcher
- (void)IOControllerEvent:(unint64_t)a3 sessions:(id)a4 isDecoupledInput:(BOOL)a5;
- (void)pingClient:(unsigned int)a3;
@end

@implementation AVAudioSessionCallbackDispatcher

- (void)pingClient:(unsigned int)a3
{
}

- (void)IOControllerEvent:(unint64_t)a3 sessions:(id)a4 isDecoupledInput:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  v8 = (const void *)[v7 bytes];
  uint64_t v9 = [v7 length];
  __p = 0;
  v11 = 0;
  uint64_t v12 = 0;
  std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(&__p, v8, (uint64_t)v8 + (v9 & 0xFFFFFFFFFFFFFFFCLL), v9 >> 2);
  AVAudioSessionDispatchIOControllerEvent(a3, (unsigned int **)&__p, v5);
  if (__p)
  {
    v11 = __p;
    operator delete(__p);
  }
}

@end