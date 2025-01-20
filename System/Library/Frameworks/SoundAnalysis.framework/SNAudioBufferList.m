@interface SNAudioBufferList
+ (void)unownedViewOfRecentFramesWithSourceBuffer:(id)a3 destinationBuffer:(id)a4 numberOfRecentFrames:(unsigned int)a5;
- (SNAudioBufferList)initWithFormat:(id)a3;
- (const)bufferList;
- (id).cxx_construct;
@end

@implementation SNAudioBufferList

- (SNAudioBufferList)initWithFormat:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SNAudioBufferList;
  v5 = [(SNAudioBufferList *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 streamDescription];
    long long v7 = *(_OWORD *)v6;
    long long v8 = *(_OWORD *)(v6 + 16);
    uint64_t v13 = *(void *)(v6 + 32);
    v12[0] = v7;
    v12[1] = v8;
    v9 = (CABufferList *)sub_1DCB4B2C8((uint64_t)"", (uint64_t)v12);
    value = v5->_ringBufferWriteBufferList.__ptr_.__value_;
    v5->_ringBufferWriteBufferList.__ptr_.__value_ = v9;
    if (value) {
      sub_1DCB4A8D8(v5 + 8, value);
    }
  }

  return v5;
}

- (const)bufferList
{
  return (const AudioBufferList *)((char *)self->_ringBufferWriteBufferList.__ptr_.__value_ + 24);
}

+ (void)unownedViewOfRecentFramesWithSourceBuffer:(id)a3 destinationBuffer:(id)a4 numberOfRecentFrames:(unsigned int)a5
{
  uint64_t v6 = (void *)*((void *)a4 + 1);
  id v18 = a3;
  if ([v18 frameLength] < a5)
  {
    objc_super v14 = "numberOfRecentFrames <= sourceBuffer.frameLength";
    int v15 = 22;
    v16 = "SNAudioBufferList.mm";
    v17 = "unownedViewOfRecentFrames";
    goto LABEL_12;
  }
  long long v7 = (unsigned int *)[v18 audioBufferList];
  if (v6[1])
  {
    objc_super v14 = "mBufferMemory == NULL";
    int v15 = 158;
    v16 = "CABufferList.h";
    v17 = "VerifyNotTrashingOwnedBuffer";
LABEL_12:
    __assert_rtn(v17, v16, v15, v14);
  }
  memcpy(v6 + 3, v7, (16 * *v7) | 8);
  int v8 = [v18 frameLength];
  v9 = [v18 format];
  uint64_t v10 = [v9 streamDescription];
  if (v6[1]) {
    __assert_rtn("VerifyNotTrashingOwnedBuffer", "CABufferList.h", 158, "mBufferMemory == NULL");
  }
  int v11 = *((_DWORD *)v6 + 6);
  if (v11)
  {
    uint64_t v12 = *(_DWORD *)(v10 + 24) * (v8 - a5);
    uint64_t v13 = v6 + 5;
    do
    {
      *v13 += v12;
      *((_DWORD *)v13 - 1) -= v12;
      v13 += 2;
      --v11;
    }
    while (v11);
  }
}

- (void).cxx_destruct
{
  value = self->_ringBufferWriteBufferList.__ptr_.__value_;
  p_ringBufferWriteBufferList = &self->_ringBufferWriteBufferList;
  v3 = value;
  p_ringBufferWriteBufferList->__ptr_.__value_ = 0;
  if (value) {
    sub_1DCB4A8D8((int)p_ringBufferWriteBufferList, v3);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end