@interface AVAudioChannelGroupSemantics
+ (BOOL)supportsSecureCoding;
- (AVAudioChannelGroupSemantics)init;
- (AVAudioChannelGroupSemantics)initWithAudioChannelGroupSemantics:(const AudioChannelGroupSemantics *)a3;
- (AVAudioChannelGroupSemantics)initWithChannelCount:(unsigned int)a3 semantics:(unsigned int)a4 terminalType:(unsigned int)a5 layout:(id)a6;
- (AVAudioChannelGroupSemantics)initWithCoder:(id)a3;
- (AVAudioChannelLayout)layout;
- (AudioChannelGroupSemantics)createAudioChannelGroupSemantics;
- (uint64_t)createAudioChannelGroupSemantics;
- (unsigned)channelCount;
- (unsigned)semantics;
- (unsigned)terminalType;
- (void)encodeWithCoder:(id)a3;
- (void)setChannelCount:(unsigned int)a3;
- (void)setLayout:(id)a3;
- (void)setSemantics:(unsigned int)a3;
- (void)setTerminalType:(unsigned int)a3;
@end

@implementation AVAudioChannelGroupSemantics

- (void).cxx_destruct
{
}

- (void)setChannelCount:(unsigned int)a3
{
  self->_channelCount = a3;
}

- (unsigned)channelCount
{
  return self->_channelCount;
}

- (void)setTerminalType:(unsigned int)a3
{
  self->_terminalType = a3;
}

- (unsigned)terminalType
{
  return self->_terminalType;
}

- (void)setSemantics:(unsigned int)a3
{
  self->_semantics = a3;
}

- (unsigned)semantics
{
  return self->_semantics;
}

- (void)setLayout:(id)a3
{
  id v6 = a3;
  v4 = (AVAudioChannelLayout *)objc_msgSend(objc_alloc((Class)getAVAudioChannelLayoutClass()), "initWithLayout:", objc_msgSend(v6, "layout"));
  layout = self->_layout;
  self->_layout = v4;
}

- (AVAudioChannelLayout)layout
{
  v2 = objc_msgSend(objc_alloc((Class)getAVAudioChannelLayoutClass()), "initWithLayout:", -[AVAudioChannelLayout layout](self->_layout, "layout"));
  return (AVAudioChannelLayout *)v2;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt:self->_channelCount forKey:@"channelCount"];
  [v4 encodeInt:self->_semantics forKey:@"semantics"];
  [v4 encodeInt:self->_terminalType forKey:@"terminalType"];
  [v4 encodeObject:self->_layout forKey:@"layout"];
}

- (AVAudioChannelGroupSemantics)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntForKey:@"channelCount"];
  uint64_t v6 = [v4 decodeIntForKey:@"semantics"];
  uint64_t v7 = [v4 decodeIntForKey:@"terminalType"];
  v8 = [v4 decodeObjectForKey:@"layout"];
  v9 = [(AVAudioChannelGroupSemantics *)self initWithChannelCount:v5 semantics:v6 terminalType:v7 layout:v8];

  return v9;
}

- (AudioChannelGroupSemantics)createAudioChannelGroupSemantics
{
  if ([(AVAudioChannelLayout *)self->_layout layout][8]) {
    uint64_t v3 = 20 * ([(AVAudioChannelLayout *)self->_layout layout][8] - 1);
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (AudioChannelGroupSemantics *)malloc_type_malloc(v3 + 44, 0xAAD716A5uLL);
  v9 = v4;
  int v7 = MEMORY[0x192FC88F0]();
  v8 = &v9;
  v4->var0 = self->_channelCount;
  v4->var1 = self->_semantics;
  v4->var2 = self->_terminalType;
  memcpy(&v4->var3, [(AVAudioChannelLayout *)self->_layout layout], v3 + 12);
  uint64_t v5 = v9;
  applesauce::raii::v1::detail::ScopeGuard<-[AVAudioChannelGroupSemantics createAudioChannelGroupSemantics]::$_0,applesauce::raii::v1::detail::StackFailPolicy>::~ScopeGuard((uint64_t)&v7);
  return v5;
}

- (uint64_t)createAudioChannelGroupSemantics
{
  if ((int)MEMORY[0x192FC88F0]() > *(_DWORD *)a1)
  {
    free(**(void ***)(a1 + 8));
    **(void **)(a1 + 8) = 0;
  }
  return a1;
}

- (AVAudioChannelGroupSemantics)initWithAudioChannelGroupSemantics:(const AudioChannelGroupSemantics *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AVAudioChannelGroupSemantics;
  id v4 = [(AVAudioChannelGroupSemantics *)&v9 init];
  uint64_t v5 = v4;
  if (v4)
  {
    v4->_channelCount = a3->var0;
    v4->_semantics = a3->var1;
    v4->_terminalType = a3->var2;
    uint64_t v6 = [objc_alloc((Class)getAVAudioChannelLayoutClass()) initWithLayout:&a3->var3];
    layout = v5->_layout;
    v5->_layout = (AVAudioChannelLayout *)v6;
  }
  return v5;
}

- (AVAudioChannelGroupSemantics)initWithChannelCount:(unsigned int)a3 semantics:(unsigned int)a4 terminalType:(unsigned int)a5 layout:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)AVAudioChannelGroupSemantics;
  v12 = [(AVAudioChannelGroupSemantics *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_terminalType = a5;
    v12->_channelCount = a3;
    v12->_semantics = a4;
    objc_storeStrong((id *)&v12->_layout, a6);
  }

  return v13;
}

- (AVAudioChannelGroupSemantics)init
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end