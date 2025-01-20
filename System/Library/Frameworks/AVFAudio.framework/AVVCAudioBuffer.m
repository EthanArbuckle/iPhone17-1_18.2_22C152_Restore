@interface AVVCAudioBuffer
- (AVVCAudioBuffer)initWithAudioQueueBuffer:(MyAudioQueueBuffer *)a3 channels:(int)a4 timeStamp:(unint64_t)a5;
- (AudioStreamBasicDescription)streamDescription;
- (AudioStreamPacketDescription)packetDescriptions;
- (BOOL)remoteVoiceActivityAvailable;
- (BOOL)upsamplingSourceAudio;
- (int)bytesCapacity;
- (int)bytesDataSize;
- (int)channels;
- (int)packetDescriptionCapacity;
- (int)packetDescriptionCount;
- (unint64_t)timeStamp;
- (unsigned)remoteVoiceActivityRMS;
- (unsigned)remoteVoiceActivityVAD;
- (void)data;
- (void)dealloc;
- (void)finalize;
- (void)setBytesDataSize:(int)a3;
- (void)setPacketDescriptions:(const AudioStreamPacketDescription *)a3 count:(int)a4;
- (void)setTimeStamp:(unint64_t)a3;
@end

@implementation AVVCAudioBuffer

- (BOOL)upsamplingSourceAudio
{
  return *(unsigned char *)(*(void *)self->_impl + 99);
}

- (BOOL)remoteVoiceActivityAvailable
{
  return *(unsigned char *)(*(void *)self->_impl + 96);
}

- (unsigned)remoteVoiceActivityVAD
{
  return *(unsigned char *)(*(void *)self->_impl + 98);
}

- (unsigned)remoteVoiceActivityRMS
{
  return *(unsigned char *)(*(void *)self->_impl + 97);
}

- (AudioStreamBasicDescription)streamDescription
{
  return (AudioStreamBasicDescription *)(*(void *)self->_impl + 56);
}

- (void)setTimeStamp:(unint64_t)a3
{
  *((void *)self->_impl + 2) = a3;
}

- (unint64_t)timeStamp
{
  return *((void *)self->_impl + 2);
}

- (void)setPacketDescriptions:(const AudioStreamPacketDescription *)a3 count:(int)a4
{
  if (a3)
  {
    uint64_t v4 = *(void *)self->_impl;
    int v5 = *(_DWORD *)(v4 + 32);
    if (v5 >= a4) {
      int v5 = a4;
    }
    memcpy(*(void **)(v4 + 40), a3, 16 * v5);
  }
}

- (AudioStreamPacketDescription)packetDescriptions
{
  return *(AudioStreamPacketDescription **)(*(void *)self->_impl + 40);
}

- (int)packetDescriptionCount
{
  return *(_DWORD *)(*(void *)self->_impl + 48);
}

- (int)packetDescriptionCapacity
{
  return *(_DWORD *)(*(void *)self->_impl + 32);
}

- (void)data
{
  return *(void **)(*(void *)self->_impl + 8);
}

- (void)setBytesDataSize:(int)a3
{
  v3 = *(int **)self->_impl;
  int v4 = *v3;
  if (*v3 >= a3) {
    int v4 = a3;
  }
  v3[4] = v4;
}

- (int)bytesDataSize
{
  return *(_DWORD *)(*(void *)self->_impl + 16);
}

- (int)bytesCapacity
{
  return **(_DWORD **)self->_impl;
}

- (int)channels
{
  return *((_DWORD *)self->_impl + 2);
}

- (AVVCAudioBuffer)initWithAudioQueueBuffer:(MyAudioQueueBuffer *)a3 channels:(int)a4 timeStamp:(unint64_t)a5
{
}

- (void)dealloc
{
  impl = (MyAudioQueueBuffer **)self->_impl;
  if (*impl)
  {
    MyAudioQueueBuffer::~MyAudioQueueBuffer(*impl);
    MEMORY[0x19F3ABB30]();
  }
  MEMORY[0x19F3ABB30](impl, 0x1020C40A122CEF7);
  v4.receiver = self;
  v4.super_class = (Class)AVVCAudioBuffer;
  [(AVVCAudioBuffer *)&v4 dealloc];
}

- (void)finalize
{
  impl = (MyAudioQueueBuffer **)self->_impl;
  if (*impl)
  {
    MyAudioQueueBuffer::~MyAudioQueueBuffer(*impl);
    MEMORY[0x19F3ABB30]();
  }
  MEMORY[0x19F3ABB30](impl, 0x1020C40A122CEF7);
  v4.receiver = self;
  v4.super_class = (Class)AVVCAudioBuffer;
  [(AVVCAudioBuffer *)&v4 finalize];
}

@end