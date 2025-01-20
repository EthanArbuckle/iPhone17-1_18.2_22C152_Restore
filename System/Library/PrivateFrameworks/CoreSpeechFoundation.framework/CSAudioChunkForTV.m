@interface CSAudioChunkForTV
- (CSAudioChunkForTV)initWithXPCObject:(id)a3;
- (NSArray)packets;
- (float)avgPower;
- (float)peakPower;
- (id)xpcObject;
- (unint64_t)streamHandleID;
- (unint64_t)timeStamp;
- (unsigned)audioFormat;
- (unsigned)numChannels;
- (void)setAudioFormat:(unsigned int)a3;
- (void)setAvgPower:(float)a3;
- (void)setNumChannels:(unsigned int)a3;
- (void)setPackets:(id)a3;
- (void)setPeakPower:(float)a3;
- (void)setStreamHandleID:(unint64_t)a3;
- (void)setTimeStamp:(unint64_t)a3;
@end

@implementation CSAudioChunkForTV

- (void).cxx_destruct
{
}

- (void)setStreamHandleID:(unint64_t)a3
{
  self->_streamHandleID = a3;
}

- (unint64_t)streamHandleID
{
  return self->_streamHandleID;
}

- (void)setAudioFormat:(unsigned int)a3
{
  self->_audioFormat = a3;
}

- (unsigned)audioFormat
{
  return self->_audioFormat;
}

- (void)setNumChannels:(unsigned int)a3
{
  self->_numChannels = a3;
}

- (unsigned)numChannels
{
  return self->_numChannels;
}

- (void)setTimeStamp:(unint64_t)a3
{
  self->_timeStamp = a3;
}

- (unint64_t)timeStamp
{
  return self->_timeStamp;
}

- (void)setPeakPower:(float)a3
{
  self->_peakPower = a3;
}

- (float)peakPower
{
  return self->_peakPower;
}

- (void)setAvgPower:(float)a3
{
  self->_avgPower = a3;
}

- (float)avgPower
{
  return self->_avgPower;
}

- (void)setPackets:(id)a3
{
}

- (NSArray)packets
{
  return self->_packets;
}

- (id)xpcObject
{
  keys[7] = *(char **)MEMORY[0x1E4F143B8];
  keys[0] = "packets";
  keys[1] = "avgPower";
  keys[2] = "peakPower";
  keys[3] = "timeStamp";
  keys[4] = "numChannels";
  keys[5] = "audioFormat";
  keys[6] = "streamHandleID";
  values[0] = [(NSArray *)self->_packets _cs_xpcObject];
  values[1] = xpc_double_create(self->_avgPower);
  values[2] = xpc_double_create(self->_peakPower);
  values[3] = xpc_uint64_create(self->_timeStamp);
  values[4] = xpc_uint64_create(self->_numChannels);
  values[5] = xpc_uint64_create(self->_audioFormat);
  values[6] = xpc_uint64_create(self->_streamHandleID);
  xpc_object_t v3 = xpc_dictionary_create((const char *const *)keys, values, 7uLL);
  for (uint64_t i = 6; i != -1; --i)

  return v3;
}

- (CSAudioChunkForTV)initWithXPCObject:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CSAudioChunkForTV;
  v5 = [(CSAudioChunkForTV *)&v14 init];
  if (v5)
  {
    float v6 = xpc_dictionary_get_double(v4, "avgPower");
    v5->_avgPower = v6;
    float v7 = xpc_dictionary_get_double(v4, "peakPower");
    v5->_peakPower = v7;
    v5->_timeStamp = xpc_dictionary_get_uint64(v4, "timeStamp");
    v5->_numChannels = xpc_dictionary_get_uint64(v4, "numChannels");
    v5->_audioFormat = xpc_dictionary_get_uint64(v4, "audioFormat");
    v5->_streamHandleID = xpc_dictionary_get_uint64(v4, "streamHandleID");
    v8 = xpc_dictionary_get_array(v4, "packets");
    if (v8)
    {
      id v9 = objc_alloc(MEMORY[0x1E4F1C978]);
      uint64_t v10 = objc_msgSend(v9, "_cs_initWithXPCObject:", v8);
      packets = v5->_packets;
      v5->_packets = (NSArray *)v10;
    }
    else
    {
      v12 = CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v16 = "-[CSAudioChunkForTV initWithXPCObject:]";
        _os_log_error_impl(&dword_1BA1A5000, v12, OS_LOG_TYPE_ERROR, "%s invalid packets", buf, 0xCu);
      }
    }
  }
  return v5;
}

@end