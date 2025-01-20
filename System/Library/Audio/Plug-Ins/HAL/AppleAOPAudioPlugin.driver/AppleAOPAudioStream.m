@interface AppleAOPAudioStream
- (AppleAOPAudioStream)initWithDirection:(unsigned int)a3 owningDevice:(id)a4 plugin:(id)a5 formats:(id)a6;
- (BOOL)changePhysicalFormat:(id)a3;
- (basic_string<char,)dumpToString;
- (double)getSampleRateHz;
- (unsigned)getBytesPerFrame;
- (unsigned)getBytesPerPacket;
- (unsigned)getBytesPerSample;
- (unsigned)getChannelsPerFrame;
- (unsigned)getFramesPerPacket;
- (void)notifyStreamPropertiesChanged;
- (void)setBytesPerSample:(unsigned int)a3;
- (void)setChannelsPerFrame:(unsigned int)a3;
- (void)setFramesPerPacket:(unsigned int)a3;
- (void)setSampleRateHz:(double)a3;
- (void)startStream;
- (void)stopStream;
@end

@implementation AppleAOPAudioStream

- (AppleAOPAudioStream)initWithDirection:(unsigned int)a3 owningDevice:(id)a4 plugin:(id)a5 formats:(id)a6
{
  uint64_t v7 = *(void *)&a3;
  id v9 = a5;
  id v10 = a6;
  v20.receiver = self;
  v20.super_class = (Class)AppleAOPAudioStream;
  v11 = [(AppleAOPAudioStream *)&v20 initWithDirection:v7 withPlugin:v9];
  if (v11)
  {
    v12 = [v10 objectAtIndexedSubscript:0];
    [(AppleAOPAudioStream *)v11 setPhysicalFormat:v12];

    [(AppleAOPAudioStream *)v11 setPhysicalFormats:v10];
    v13 = [v10 objectAtIndexedSubscript:0];
    id v14 = [v13 bytesPerFrame];
    v15 = [(AppleAOPAudioStream *)v11 physicalFormat];
    [v15 setBytesPerFrame:v14];

    v16 = [v10 objectAtIndexedSubscript:0];
    id v17 = [v16 bytesPerPacket];
    v18 = [(AppleAOPAudioStream *)v11 physicalFormat];
    [v18 setBytesPerPacket:v17];

    [(AppleAOPAudioStream *)v11 setStartingChannel:1];
  }

  return v11;
}

- (BOOL)changePhysicalFormat:(id)a3
{
  id v4 = a3;
  [(AppleAOPAudioStream *)self setPhysicalFormat:v4];
  id v5 = [v4 bytesPerFrame];
  v6 = [(AppleAOPAudioStream *)self physicalFormat];
  [v6 setBytesPerFrame:v5];

  id v7 = [v4 bytesPerPacket];
  v8 = [(AppleAOPAudioStream *)self physicalFormat];
  [v8 setBytesPerPacket:v7];

  return 1;
}

- (void)notifyStreamPropertiesChanged
{
  id v11 = [(AppleAOPAudioStream *)self physicalFormat];
  v3 = +[NSMutableArray array];
  id v4 = [(AppleAOPAudioStream *)self physicalFormat];
  objc_msgSend(v11, "setBytesPerFrame:", objc_msgSend(v4, "bytesPerFrame"));

  id v5 = [(AppleAOPAudioStream *)self physicalFormat];
  objc_msgSend(v11, "setBytesPerPacket:", objc_msgSend(v5, "bytesPerPacket"));

  [v3 addObject:v11];
  v6 = [v3 objectAtIndexedSubscript:0];
  [(AppleAOPAudioStream *)self setPhysicalFormat:v6];

  [(AppleAOPAudioStream *)self setPhysicalFormats:v3];
  id v7 = [v11 bytesPerFrame];
  v8 = [(AppleAOPAudioStream *)self physicalFormat];
  [v8 setBytesPerFrame:v7];

  id v9 = [v11 bytesPerPacket];
  id v10 = [(AppleAOPAudioStream *)self physicalFormat];
  [v10 setBytesPerPacket:v9];
}

- (double)getSampleRateHz
{
  v2 = [(AppleAOPAudioStream *)self physicalFormat];
  [v2 sampleRate];
  double v4 = v3;

  return v4;
}

- (unsigned)getBytesPerPacket
{
  v2 = [(AppleAOPAudioStream *)self physicalFormat];
  unsigned int v3 = [v2 bytesPerPacket];

  return v3;
}

- (unsigned)getBytesPerSample
{
  unsigned int v3 = [(AppleAOPAudioStream *)self physicalFormat];
  if (([v3 formatFlags] & 8) != 0)
  {

    goto LABEL_5;
  }
  double v4 = [(AppleAOPAudioStream *)self physicalFormat];
  unsigned int v5 = [v4 bitsPerChannel];

  if (v5 <= 0x17)
  {
LABEL_5:
    id v7 = [(AppleAOPAudioStream *)self physicalFormat];
    unsigned int v6 = [v7 bitsPerChannel] >> 3;

    return v6;
  }
  return 4;
}

- (unsigned)getChannelsPerFrame
{
  v2 = [(AppleAOPAudioStream *)self physicalFormat];
  unsigned int v3 = [v2 channelsPerFrame];

  return v3;
}

- (unsigned)getFramesPerPacket
{
  v2 = [(AppleAOPAudioStream *)self physicalFormat];
  unsigned int v3 = [v2 framesPerPacket];

  return v3;
}

- (unsigned)getBytesPerFrame
{
  v2 = [(AppleAOPAudioStream *)self physicalFormat];
  unsigned int v3 = [v2 bytesPerFrame];

  return v3;
}

- (void)setSampleRateHz:(double)a3
{
  id v4 = [(AppleAOPAudioStream *)self physicalFormat];
  [v4 setSampleRate:a3];
}

- (void)setBytesPerSample:(unsigned int)a3
{
  if (a3 == 4)
  {
    id v7 = [(AppleAOPAudioStream *)self physicalFormat];
    [v7 setFormatFlags:20];

    id v8 = [(AppleAOPAudioStream *)self physicalFormat];
    [v8 setBitsPerChannel:24];
  }
  else
  {
    id v8 = [(AppleAOPAudioStream *)self physicalFormat];
    [v8 setBitsPerChannel:8 * a3];
  }

  uint64_t v5 = [(AppleAOPAudioStream *)self getChannelsPerFrame] * a3;
  id v9 = [(AppleAOPAudioStream *)self physicalFormat];
  [v9 setBytesPerFrame:v5];

  LODWORD(v5) = [(AppleAOPAudioStream *)self getBytesPerFrame];
  uint64_t v6 = [(AppleAOPAudioStream *)self getFramesPerPacket] * v5;
  id v10 = [(AppleAOPAudioStream *)self physicalFormat];
  [v10 setBytesPerPacket:v6];
}

- (void)setChannelsPerFrame:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  unsigned int v5 = [(AppleAOPAudioStream *)self getBytesPerSample];
  unsigned int v6 = [(AppleAOPAudioStream *)self getFramesPerPacket];
  id v9 = [(AppleAOPAudioStream *)self physicalFormat];
  [v9 setChannelsPerFrame:v3];

  uint64_t v7 = [(AppleAOPAudioStream *)self getChannelsPerFrame] * v5;
  id v10 = [(AppleAOPAudioStream *)self physicalFormat];
  [v10 setBytesPerFrame:v7];

  uint64_t v8 = [(AppleAOPAudioStream *)self getBytesPerFrame] * v6;
  id v11 = [(AppleAOPAudioStream *)self physicalFormat];
  [v11 setBytesPerPacket:v8];
}

- (void)setFramesPerPacket:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v6 = [(AppleAOPAudioStream *)self physicalFormat];
  [v6 setFramesPerPacket:v3];

  LODWORD(v3) = [(AppleAOPAudioStream *)self getBytesPerFrame];
  uint64_t v5 = [(AppleAOPAudioStream *)self getFramesPerPacket] * v3;
  id v7 = [(AppleAOPAudioStream *)self physicalFormat];
  [v7 setBytesPerPacket:v5];
}

- (void)startStream
{
  v2.receiver = self;
  v2.super_class = (Class)AppleAOPAudioStream;
  [(AppleAOPAudioStream *)&v2 startStream];
}

- (void)stopStream
{
  v2.receiver = self;
  v2.super_class = (Class)AppleAOPAudioStream;
  [(AppleAOPAudioStream *)&v2 stopStream];
}

- (basic_string<char,)dumpToString
{
  objc_super v2 = v1;
  sub_AA0C((uint64_t)v20);
  sub_B390(v20, (uint64_t)"  Sample Rate:        ", 22);
  uint64_t v3 = [v2 physicalFormat];
  [v3 sampleRate];
  id v4 = (void *)std::ostream::operator<<();
  sub_B390(v4, (uint64_t)"\n", 1);

  sub_B390(v20, (uint64_t)"  Format ID:          ", 22);
  uint64_t v5 = [v2 physicalFormat];
  [v5 formatID];
  id v6 = (void *)std::ostream::operator<<();
  sub_B390(v6, (uint64_t)"\n", 1);

  sub_B390(v20, (uint64_t)"  Format Flags:       ", 22);
  id v7 = [v2 physicalFormat];
  [v7 formatFlags];
  uint64_t v8 = (void *)std::ostream::operator<<();
  sub_B390(v8, (uint64_t)"\n", 1);

  sub_B390(v20, (uint64_t)"  Bytes per Packet:   ", 22);
  id v9 = [v2 physicalFormat];
  [v9 bytesPerPacket];
  id v10 = (void *)std::ostream::operator<<();
  sub_B390(v10, (uint64_t)"\n", 1);

  sub_B390(v20, (uint64_t)"  Frames per Packet:  ", 22);
  id v11 = [v2 physicalFormat];
  [v11 framesPerPacket];
  v12 = (void *)std::ostream::operator<<();
  sub_B390(v12, (uint64_t)"\n", 1);

  sub_B390(v20, (uint64_t)"  Bytes per Frame:    ", 22);
  v13 = [v2 physicalFormat];
  [v13 bytesPerFrame];
  id v14 = (void *)std::ostream::operator<<();
  sub_B390(v14, (uint64_t)"\n", 1);

  sub_B390(v20, (uint64_t)"  Channels per Frame: ", 22);
  v15 = [v2 physicalFormat];
  [v15 channelsPerFrame];
  v16 = (void *)std::ostream::operator<<();
  sub_B390(v16, (uint64_t)"\n", 1);

  sub_B390(v20, (uint64_t)"  Bits per Channel:   ", 22);
  id v17 = [v2 physicalFormat];
  [v17 bitsPerChannel];
  v18 = (void *)std::ostream::operator<<();
  sub_B390(v18, (uint64_t)"\n", 1);

  std::stringbuf::str();
  if (v21 < 0) {
    operator delete((void *)v20[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)std::ios::~ios();
}

@end