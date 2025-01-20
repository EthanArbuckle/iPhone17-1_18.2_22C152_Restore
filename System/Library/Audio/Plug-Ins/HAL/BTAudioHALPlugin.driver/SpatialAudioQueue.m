@interface SpatialAudioQueue
- ($09AED28DA01A4B4CD63B1271B5E0322A)streamInfo;
- (BOOL)updateStreamInfo:(id)a3;
- (SpatialAudioQueue)initWithStreamInfo:(id)a3;
- (id).cxx_construct;
- (unsigned)audioQueueRef;
- (void)dealloc;
- (void)setStreamInfo:(id)a3;
@end

@implementation SpatialAudioQueue

- (SpatialAudioQueue)initWithStreamInfo:(id)a3
{
  int v3 = *(_DWORD *)&a3.var2;
  uint64_t v4 = *(void *)&a3.var0;
  v11.receiver = self;
  v11.super_class = (Class)SpatialAudioQueue;
  v5 = [(SpatialAudioQueue *)&v11 init];
  v6 = v5;
  if (v5)
  {
    v10[0] = 0;
    v10[1] = 0;
    sub_5CDCC((uint64_t)v10, (uint64_t)&v5->queueMutex);
    *(void *)&v6->_streamInfo.mClientProcessID = v4;
    *(_DWORD *)&v6->_streamInfo.mSpatializationStatus = v3;
    ++v6->_audioQueueRef;
    v7 = qword_A1AD0;
    if (os_log_type_enabled((os_log_t)qword_A1AD0, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = HIBYTE(v4);
      v9[1] = BYTE6(v4);
      v9[2] = BYTE5(v4);
      v9[3] = BYTE4(v4);
      v9[4] = 0;
      *(_DWORD *)buf = 67109634;
      int v13 = v4;
      __int16 v14 = 1024;
      int v15 = BYTE1(v3);
      __int16 v16 = 2080;
      v17 = v9;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "[ %d ]Allocating Audio Queue channels = %d FormatID = %s", buf, 0x18u);
    }
    sub_5CF10(v10);
  }
  return v6;
}

- (void)dealloc
{
  int v3 = qword_A1AD0;
  if (os_log_type_enabled((os_log_t)qword_A1AD0, OS_LOG_TYPE_DEFAULT))
  {
    int mClientProcessID = self->_streamInfo.mClientProcessID;
    int mNumChannels = self->_streamInfo.mNumChannels;
    v4.i32[0] = self->_streamInfo.mFormatID;
    int16x8_t v7 = (int16x8_t)vmovl_u8(v4);
    *(int16x4_t *)v7.i8 = vrev64_s16(*(int16x4_t *)v7.i8);
    unsigned __int32 v9 = vmovn_s16(v7).u32[0];
    char v10 = 0;
    *(_DWORD *)buf = 67109634;
    int v12 = mClientProcessID;
    __int16 v13 = 1024;
    int v14 = mNumChannels;
    __int16 v15 = 2080;
    __int16 v16 = &v9;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "[ %d ]Releasing Audio Queue Number channels = %d FormatID = %s", buf, 0x18u);
  }
  v8.receiver = self;
  v8.super_class = (Class)SpatialAudioQueue;
  [(SpatialAudioQueue *)&v8 dealloc];
}

- (BOOL)updateStreamInfo:(id)a3
{
  int v3 = *(_DWORD *)&a3.var2;
  uint64_t v4 = *(void *)&a3.var0;
  v16[0] = 0;
  v16[1] = 0;
  sub_5CDCC((uint64_t)v16, (uint64_t)&self->queueMutex);
  if ((_BYTE)v3)
  {
    unsigned int v6 = self->_audioQueueRef + 1;
    self->_unsigned int audioQueueRef = v6;
    *(void *)&self->_streamInfo.int mClientProcessID = v4;
    *(_DWORD *)&self->_streamInfo.mSpatializationStatus = v3;
  }
  else
  {
    unsigned int audioQueueRef = self->_audioQueueRef;
    if (audioQueueRef)
    {
      unsigned int v6 = audioQueueRef - 1;
      self->_unsigned int audioQueueRef = audioQueueRef - 1;
    }
    else
    {
      unsigned int v6 = 0;
    }
  }
  objc_super v8 = qword_A1AD0;
  if (os_log_type_enabled((os_log_t)qword_A1AD0, OS_LOG_TYPE_DEFAULT))
  {
    int mClientProcessID = self->_streamInfo.mClientProcessID;
    int mNumChannels = self->_streamInfo.mNumChannels;
    v9.i32[0] = self->_streamInfo.mFormatID;
    int16x8_t v12 = (int16x8_t)vmovl_u8(v9);
    *(int16x4_t *)v12.i8 = vrev64_s16(*(int16x4_t *)v12.i8);
    unsigned __int32 v14 = vmovn_s16(v12).u32[0];
    char v15 = 0;
    *(_DWORD *)buf = 67109890;
    int v18 = mClientProcessID;
    __int16 v19 = 1024;
    int v20 = mNumChannels;
    __int16 v21 = 2080;
    v22 = &v14;
    __int16 v23 = 1024;
    unsigned int v24 = v6;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Update Audio Queue PID= %d Number channels = %d FormatID = %s Ref = %d", buf, 0x1Eu);
    unsigned int v6 = self->_audioQueueRef;
  }
  sub_5CF10(v16);
  return v6 != 0;
}

- ($09AED28DA01A4B4CD63B1271B5E0322A)streamInfo
{
  objc_copyStruct(&v4, &self->_streamInfo, 12, 1, 0);
  uint64_t v2 = v4;
  int v3 = v5;
  result.var0 = v2;
  result.var1 = HIDWORD(v2);
  result.var2 = v3;
  result.var3 = BYTE1(v3);
  result.var4 = BYTE2(v3);
  result.var5 = HIBYTE(v3);
  return result;
}

- (void)setStreamInfo:(id)a3
{
  $09AED28DA01A4B4CD63B1271B5E0322A v3 = a3;
  objc_copyStruct(&self->_streamInfo, &v3, 12, 1, 0);
}

- (unsigned)audioQueueRef
{
  return self->_audioQueueRef;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

@end