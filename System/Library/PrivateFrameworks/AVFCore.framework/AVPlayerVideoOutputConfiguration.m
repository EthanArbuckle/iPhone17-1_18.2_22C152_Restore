@interface AVPlayerVideoOutputConfiguration
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)activationTime;
- (AVPlayerItem)sourcePlayerItem;
- (AVPlayerVideoOutputConfiguration)initWithSourcePlayerItem:(id)a3 dataChannelDescriptions:(id)a4 transform:(CGAffineTransform *)a5 activationTime:(id *)a6;
- (CGAffineTransform)preferredTransform;
- (NSArray)dataChannelDescriptions;
- (void)dealloc;
- (void)setActivationTime:(id *)a3;
- (void)setDataChannelDescriptions:(id)a3;
- (void)setSourcePlayerItem:(id)a3;
@end

@implementation AVPlayerVideoOutputConfiguration

- (AVPlayerVideoOutputConfiguration)initWithSourcePlayerItem:(id)a3 dataChannelDescriptions:(id)a4 transform:(CGAffineTransform *)a5 activationTime:(id *)a6
{
  v16.receiver = self;
  v16.super_class = (Class)AVPlayerVideoOutputConfiguration;
  v10 = [(AVPlayerVideoOutputConfiguration *)&v16 init];
  v11 = v10;
  if (v10)
  {
    long long v12 = *(_OWORD *)&a6->var0;
    *((void *)v10 + 5) = a6->var3;
    *(_OWORD *)(v10 + 24) = v12;
    *((void *)v10 + 2) = [a4 copy];
    long long v14 = *(_OWORD *)&a5->c;
    long long v13 = *(_OWORD *)&a5->tx;
    *((_OWORD *)v11 + 3) = *(_OWORD *)&a5->a;
    *((_OWORD *)v11 + 4) = v14;
    *((_OWORD *)v11 + 5) = v13;
    objc_storeWeak((id *)v11 + 1, a3);
  }
  return (AVPlayerVideoOutputConfiguration *)v11;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVPlayerVideoOutputConfiguration;
  [(AVPlayerVideoOutputConfiguration *)&v3 dealloc];
}

- (AVPlayerItem)sourcePlayerItem
{
  return (AVPlayerItem *)objc_loadWeak((id *)&self->_sourcePlayerItem);
}

- (void)setSourcePlayerItem:(id)a3
{
}

- (NSArray)dataChannelDescriptions
{
  return self->_dataChannelDescriptions;
}

- (void)setDataChannelDescriptions:(id)a3
{
}

- (CGAffineTransform)preferredTransform
{
  long long v3 = *(_OWORD *)&self[1].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].tx;
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)activationTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[1];
  return self;
}

- (void)setActivationTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_activationTime.epoch = a3->var3;
  *(_OWORD *)&self->_activationTime.value = v3;
}

- (void).cxx_destruct
{
}

@end