@interface CSAudioChunk
+ (BOOL)supportsSecureCoding;
- (BOOL)isFloat;
- (BOOL)remoteVADAvailable;
- (BOOL)wasBuffered;
- (CSAudioChunk)initWithCoder:(id)a3;
- (CSAudioChunk)initWithData:(id)a3 numChannels:(unint64_t)a4 numSamples:(unint64_t)a5 sampleByteDepth:(unint64_t)a6 startSampleCount:(unint64_t)a7 hostTime:(unint64_t)a8 arrivalHostTimeToAudioRecorder:(unint64_t)a9 wasBuffered:(BOOL)a10 remoteVAD:(id)a11 isFloat:(BOOL)a12;
- (CSAudioChunk)initWithData:(id)a3 numChannels:(unint64_t)a4 numSamples:(unint64_t)a5 sampleByteDepth:(unint64_t)a6 startSampleCount:(unint64_t)a7 hostTime:(unint64_t)a8 remoteVAD:(id)a9 isFloat:(BOOL)a10;
- (CSAudioChunk)initWithXPCObject:(id)a3;
- (NSData)data;
- (NSData)remoteVAD;
- (OS_xpc_object)xpcObject;
- (id)chunkForChannel:(unint64_t)a3;
- (id)dataForChannel:(unint64_t)a3;
- (id)dataWithRemoteVADWithScaleFactor:(float)a3 numAudioSamplesPerRemoteVAD:(unint64_t)a4;
- (id)gainCompensatedChunk;
- (id)remoteVADSubChunkFrom:(unint64_t)a3 numSamples:(unint64_t)a4 numAudioSamplesPerRemoteVAD:(unint64_t)a5;
- (id)subChunkFrom:(unint64_t)a3 numSamples:(unint64_t)a4;
- (id)subChunkFrom:(unint64_t)a3 numSamples:(unint64_t)a4 forChannel:(unint64_t)a5;
- (unint64_t)arrivalHostTimeToAudioRecorder;
- (unint64_t)copySubAudioChunkFrom:(unint64_t)a3 numSamples:(unint64_t)a4 to:(void *)a5 dstBufferSize:(unint64_t)a6;
- (unint64_t)hostTime;
- (unint64_t)numChannels;
- (unint64_t)numSamples;
- (unint64_t)sampleByteDepth;
- (unint64_t)startSampleCount;
- (void)encodeWithCoder:(id)a3;
- (void)setRemoteVAD:(id)a3;
- (void)skipSamplesAtStartSuchThatNumSamplesReceivedSoFar:(unint64_t)a3 reachesACountOf:(unint64_t)a4 completionHandler:(id)a5;
- (void)splitAudioChunkSuchThatNumSamplesReceivedSoFar:(unint64_t)a3 reachesACountOf:(unint64_t)a4 completionHandler:(id)a5;
@end

@implementation CSAudioChunk

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteVAD, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (BOOL)isFloat
{
  return self->_isFloat;
}

- (void)setRemoteVAD:(id)a3
{
}

- (NSData)remoteVAD
{
  return self->_remoteVAD;
}

- (BOOL)wasBuffered
{
  return self->_wasBuffered;
}

- (unint64_t)arrivalHostTimeToAudioRecorder
{
  return self->_arrivalHostTimeToAudioRecorder;
}

- (unint64_t)hostTime
{
  return self->_hostTime;
}

- (unint64_t)startSampleCount
{
  return self->_startSampleCount;
}

- (unint64_t)sampleByteDepth
{
  return self->_sampleByteDepth;
}

- (unint64_t)numSamples
{
  return self->_numSamples;
}

- (unint64_t)numChannels
{
  return self->_numChannels;
}

- (NSData)data
{
  return self->_data;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = (objc_class *)NSNumber;
  id v5 = a3;
  id v21 = (id)[[v4 alloc] initWithUnsignedInteger:self->_numChannels];
  v20 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:self->_numSamples];
  v6 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:self->_sampleByteDepth];
  v7 = (void *)[objc_alloc(NSNumber) initWithUnsignedLongLong:self->_startSampleCount];
  v8 = (void *)[objc_alloc(NSNumber) initWithUnsignedLongLong:self->_hostTime];
  v9 = (void *)[objc_alloc(NSNumber) initWithUnsignedLongLong:self->_arrivalHostTimeToAudioRecorder];
  v10 = [NSString stringWithUTF8String:"numChannels"];
  [v5 encodeObject:v21 forKey:v10];

  v11 = [NSString stringWithUTF8String:"numSamples"];
  [v5 encodeObject:v20 forKey:v11];

  v12 = [NSString stringWithUTF8String:"sampleByteDepth"];
  [v5 encodeObject:v6 forKey:v12];

  v13 = [NSString stringWithUTF8String:"startSampleCount"];
  [v5 encodeObject:v7 forKey:v13];

  v14 = [NSString stringWithUTF8String:"hostTime"];
  [v5 encodeObject:v8 forKey:v14];

  v15 = [NSString stringWithUTF8String:"arrivalHostTimeToAudioRecorder"];
  [v5 encodeObject:v9 forKey:v15];

  data = self->_data;
  v17 = [NSString stringWithUTF8String:"data"];
  [v5 encodeObject:data forKey:v17];

  v18 = [NSNumber numberWithBool:self->_isFloat];
  v19 = [NSString stringWithUTF8String:"isFloat"];
  [v5 encodeObject:v18 forKey:v19];
}

- (CSAudioChunk)initWithCoder:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  id v5 = [NSString stringWithUTF8String:"data"];
  v37 = [v3 decodeObjectOfClass:v4 forKey:v5];

  uint64_t v6 = objc_opt_class();
  v7 = [NSString stringWithUTF8String:"numChannels"];
  v8 = [v3 decodeObjectOfClass:v6 forKey:v7];
  uint64_t v36 = [v8 unsignedIntegerValue];

  uint64_t v9 = objc_opt_class();
  v10 = [NSString stringWithUTF8String:"numSamples"];
  v11 = [v3 decodeObjectOfClass:v9 forKey:v10];
  uint64_t v12 = [v11 unsignedIntegerValue];

  uint64_t v13 = objc_opt_class();
  v14 = [NSString stringWithUTF8String:"sampleByteDepth"];
  v15 = [v3 decodeObjectOfClass:v13 forKey:v14];
  uint64_t v16 = [v15 unsignedIntegerValue];

  uint64_t v17 = objc_opt_class();
  v18 = [NSString stringWithUTF8String:"startSampleCount"];
  v19 = [v3 decodeObjectOfClass:v17 forKey:v18];
  uint64_t v20 = [v19 unsignedLongLongValue];

  uint64_t v21 = objc_opt_class();
  v22 = [NSString stringWithUTF8String:"hostTime"];
  v23 = [v3 decodeObjectOfClass:v21 forKey:v22];
  uint64_t v24 = [v23 unsignedLongLongValue];

  uint64_t v25 = objc_opt_class();
  v26 = [NSString stringWithUTF8String:"arrivalHostTimeToAudioRecorder"];
  v27 = [v3 decodeObjectOfClass:v25 forKey:v26];
  uint64_t v28 = [v27 unsignedLongLongValue];

  uint64_t v29 = objc_opt_class();
  v30 = [NSString stringWithUTF8String:"isFloat"];
  v31 = [v3 decodeObjectOfClass:v29 forKey:v30];

  LOBYTE(v3) = [v31 BOOLValue];
  LOBYTE(v35) = (_BYTE)v3;
  LOBYTE(v34) = 0;
  v32 = [(CSAudioChunk *)self initWithData:v37 numChannels:v36 numSamples:v12 sampleByteDepth:v16 startSampleCount:v20 hostTime:v24 arrivalHostTimeToAudioRecorder:v28 wasBuffered:v34 remoteVAD:0 isFloat:v35];

  return v32;
}

- (void)splitAudioChunkSuchThatNumSamplesReceivedSoFar:(unint64_t)a3 reachesACountOf:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v8 = (void (**)(id, CSAudioChunk *, void, uint64_t))a5;
  if ((uint64_t)(a4 - a3) <= 0)
  {
    v11 = CSLogCategorySpkrId;
    if (os_log_type_enabled((os_log_t)CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315650;
      v15 = "-[CSAudioChunk splitAudioChunkSuchThatNumSamplesReceivedSoFar:reachesACountOf:completionHandler:]";
      __int16 v16 = 2048;
      unint64_t v17 = a3;
      __int16 v18 = 2048;
      unint64_t v19 = a4;
      _os_log_impl(&dword_1BA1A5000, v11, OS_LOG_TYPE_DEFAULT, "%s Processing ended at: numSamplesProcessed=%lu, totalSampleCountToReach=%lu", (uint8_t *)&v14, 0x20u);
    }
    v8[2](v8, self, 0, 1);
  }
  else
  {
    unint64_t v9 = [(CSAudioChunk *)self numSamples];
    if (v9 >= a4 - a3) {
      unint64_t v10 = a4 - a3;
    }
    else {
      unint64_t v10 = v9;
    }
    if (v10 == [(CSAudioChunk *)self numSamples])
    {
      v8[2](v8, self, 0, 0);
    }
    else
    {
      uint64_t v12 = [(CSAudioChunk *)self subChunkFrom:0 numSamples:v10];
      uint64_t v13 = [(CSAudioChunk *)self subChunkFrom:v10 numSamples:[(CSAudioChunk *)self numSamples] - v10];
      ((void (**)(id, CSAudioChunk *, void *, uint64_t))v8)[2](v8, v12, v13, 0);
    }
  }
}

- (void)skipSamplesAtStartSuchThatNumSamplesReceivedSoFar:(unint64_t)a3 reachesACountOf:(unint64_t)a4 completionHandler:(id)a5
{
  unint64_t v6 = a4 - a3;
  if (a4 <= a3)
  {
    unint64_t v9 = (void (*)(void))*((void *)a5 + 2);
    id v10 = a5;
    v9();
  }
  else
  {
    v7 = (void (**)(void))a5;
    unint64_t v8 = [(CSAudioChunk *)self numSamples];
    if (v6 >= v8) {
      unint64_t v6 = v8;
    }
    id v10 = [(CSAudioChunk *)self subChunkFrom:v6 numSamples:[(CSAudioChunk *)self numSamples] - v6];
    v7[2](v7);
  }
}

- (id)gainCompensatedChunk
{
  id v3 = (void *)[(NSData *)self->_data mutableCopy];
  if (+[CSConfig inputRecordingIsFloat]) {
    +[CSFLPCMTypeConverter apply12dBGainToFloatBuffer:v3];
  }
  else {
    +[CSFLPCMTypeConverter apply12dBGainToShortBuffer:v3];
  }
  uint64_t v4 = [CSAudioChunk alloc];
  LOBYTE(v8) = self->_isFloat;
  LOBYTE(v7) = self->_wasBuffered;
  id v5 = [(CSAudioChunk *)v4 initWithData:v3 numChannels:self->_numChannels numSamples:self->_numSamples sampleByteDepth:self->_sampleByteDepth startSampleCount:self->_startSampleCount hostTime:self->_hostTime arrivalHostTimeToAudioRecorder:self->_arrivalHostTimeToAudioRecorder wasBuffered:v7 remoteVAD:self->_remoteVAD isFloat:v8];

  return v5;
}

- (id)remoteVADSubChunkFrom:(unint64_t)a3 numSamples:(unint64_t)a4 numAudioSamplesPerRemoteVAD:(unint64_t)a5
{
  if (self->_remoteVAD)
  {
    unint64_t v9 = a4 / a5;
    id v10 = [MEMORY[0x1E4F1CA58] dataWithLength:a4 / a5];
    v11 = (unsigned char *)[v10 bytes];
    uint64_t v12 = [(NSData *)self->_remoteVAD bytes];
    if (a5 <= a4)
    {
      uint64_t v13 = v12;
      uint64_t v14 = 0;
      if (v9 <= 1) {
        unint64_t v9 = 1;
      }
      unint64_t v15 = a3 / a5;
      do
      {
        if (v15 + v14 >= [(NSData *)self->_remoteVAD length]) {
          char v16 = 0;
        }
        else {
          char v16 = v13[v15 + v14];
        }
        *v11++ = v16;
        ++v14;
        --v9;
      }
      while (v9);
    }
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

- (unint64_t)copySubAudioChunkFrom:(unint64_t)a3 numSamples:(unint64_t)a4 to:(void *)a5 dstBufferSize:(unint64_t)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = self->_sampleByteDepth * a4 * self->_numChannels;
  if (v6 <= a6)
  {
    unint64_t v9 = a4;
    uint64_t v13 = [(NSData *)self->_data bytes];
    if (self->_numChannels)
    {
      uint64_t v14 = v13;
      unint64_t v15 = 0;
      unint64_t sampleByteDepth = self->_sampleByteDepth;
      unint64_t v17 = sampleByteDepth * a3;
      do
      {
        memcpy(a5, &v14[v17], sampleByteDepth * v9);
        unint64_t sampleByteDepth = self->_sampleByteDepth;
        v14 += sampleByteDepth * self->_numSamples;
        a5 = (char *)a5 + sampleByteDepth * v9;
        ++v15;
      }
      while (v15 < self->_numChannels);
    }
  }
  else
  {
    int v7 = a6;
    uint64_t v8 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136315650;
      uint64_t v20 = "-[CSAudioChunk copySubAudioChunkFrom:numSamples:to:dstBufferSize:]";
      __int16 v21 = 1024;
      int v22 = v7;
      __int16 v23 = 1024;
      int v24 = v6;
      _os_log_error_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_ERROR, "%s Unable to write subChunk into dstBufferSize(%d) : required buffer size (%d)", (uint8_t *)&v19, 0x18u);
    }
    return 0;
  }
  return v9;
}

- (id)subChunkFrom:(unint64_t)a3 numSamples:(unint64_t)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  unint64_t numSamples = self->_numSamples;
  if (!a3 && numSamples == a4)
  {
    uint64_t v8 = self;
LABEL_10:
    id v10 = v8;
    goto LABEL_11;
  }
  if (a4 + a3 <= numSamples)
  {
    unint64_t numChannels = self->_numChannels;
    if (numChannels == 1)
    {
      uint64_t v8 = [(CSAudioChunk *)self subChunkFrom:a3 numSamples:a4 forChannel:0];
      goto LABEL_10;
    }
    unint64_t v13 = self->_sampleByteDepth * a4;
    uint64_t v14 = [MEMORY[0x1E4F1CA58] dataWithCapacity:v13 * numChannels];
    if (self->_numChannels)
    {
      unint64_t v15 = 0;
      unint64_t sampleByteDepth = self->_sampleByteDepth;
      unint64_t v17 = sampleByteDepth * a3;
      unint64_t v18 = self->_numSamples * sampleByteDepth;
      do
      {
        int v19 = -[NSData subdataWithRange:](self->_data, "subdataWithRange:", v17, v13);
        [v14 appendData:v19];

        ++v15;
        v17 += v18;
      }
      while (v15 < self->_numChannels);
    }
    unint64_t startSampleCount = self->_startSampleCount;
    unint64_t hostTime = self->_hostTime;
    unint64_t v22 = startSampleCount + a3;
    +[CSConfig inputRecordingSampleRate];
    unint64_t v23 = +[CSFTimeUtils hostTimeFromSampleCount:anchorHostTime:anchorSampleCount:sampleRate:](CSFTimeUtils, "hostTimeFromSampleCount:anchorHostTime:anchorSampleCount:sampleRate:", v22, hostTime, startSampleCount);
    unint64_t arrivalHostTimeToAudioRecorder = self->_arrivalHostTimeToAudioRecorder;
    unint64_t v25 = self->_startSampleCount;
    +[CSConfig inputRecordingSampleRate];
    unint64_t v26 = +[CSFTimeUtils hostTimeFromSampleCount:anchorHostTime:anchorSampleCount:sampleRate:](CSFTimeUtils, "hostTimeFromSampleCount:anchorHostTime:anchorSampleCount:sampleRate:", v22, arrivalHostTimeToAudioRecorder, v25);
    v27 = [CSAudioChunk alloc];
    LOBYTE(v29) = self->_isFloat;
    LOBYTE(v28) = self->_wasBuffered;
    id v10 = [(CSAudioChunk *)v27 initWithData:v14 numChannels:self->_numChannels numSamples:a4 sampleByteDepth:self->_sampleByteDepth startSampleCount:v22 hostTime:v23 arrivalHostTimeToAudioRecorder:v26 wasBuffered:v28 remoteVAD:0 isFloat:v29];
  }
  else
  {
    unint64_t v9 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v31 = "-[CSAudioChunk subChunkFrom:numSamples:]";
      __int16 v32 = 2050;
      unint64_t v33 = a3;
      __int16 v34 = 2050;
      unint64_t v35 = a4;
      __int16 v36 = 2050;
      unint64_t v37 = numSamples;
      _os_log_error_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_ERROR, "%s Cannot generate subChunk if it reuqest more than it has : %{public}tu %{public}tu %{public}tu", buf, 0x2Au);
    }
    id v10 = 0;
  }
LABEL_11:
  return v10;
}

- (id)subChunkFrom:(unint64_t)a3 numSamples:(unint64_t)a4 forChannel:(unint64_t)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (!a3 && !a5 && self->_numSamples == a4 && self->_numChannels == 1)
  {
    char v16 = self;
    goto LABEL_13;
  }
  unint64_t numChannels = self->_numChannels;
  if (numChannels <= a5)
  {
    uint64_t v15 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v34 = "-[CSAudioChunk subChunkFrom:numSamples:forChannel:]";
      __int16 v35 = 2050;
      unint64_t v36 = a5;
      __int16 v37 = 2050;
      unint64_t v38 = numChannels;
      uint64_t v12 = "%s Cannot generate subChunk since channel(%{public}tu) is larger than number of channels(%{public}tu)";
      unint64_t v13 = v15;
      uint32_t v14 = 32;
      goto LABEL_17;
    }
LABEL_7:
    char v16 = 0;
    goto LABEL_13;
  }
  unint64_t numSamples = self->_numSamples;
  if (a4 + a3 > numSamples)
  {
    uint64_t v11 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      __int16 v34 = "-[CSAudioChunk subChunkFrom:numSamples:forChannel:]";
      __int16 v35 = 2050;
      unint64_t v36 = a3;
      __int16 v37 = 2050;
      unint64_t v38 = a4;
      __int16 v39 = 2050;
      unint64_t v40 = numSamples;
      uint64_t v12 = "%s Cannot generate subChunk if it reuqest more than it has : %{public}tu %{public}tu %{public}tu";
      unint64_t v13 = v11;
      uint32_t v14 = 42;
LABEL_17:
      _os_log_error_impl(&dword_1BA1A5000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
  unint64_t sampleByteDepth = self->_sampleByteDepth;
  unint64_t v18 = sampleByteDepth * a4;
  unint64_t v19 = sampleByteDepth * (a3 + numSamples * a5);
  uint64_t v20 = [MEMORY[0x1E4F1CA58] dataWithCapacity:sampleByteDepth * a4];
  __int16 v21 = -[NSData subdataWithRange:](self->_data, "subdataWithRange:", v19, v18);
  [v20 appendData:v21];

  unint64_t startSampleCount = self->_startSampleCount;
  unint64_t hostTime = self->_hostTime;
  unint64_t v24 = startSampleCount + a3;
  +[CSConfig inputRecordingSampleRate];
  unint64_t v25 = +[CSFTimeUtils hostTimeFromSampleCount:anchorHostTime:anchorSampleCount:sampleRate:](CSFTimeUtils, "hostTimeFromSampleCount:anchorHostTime:anchorSampleCount:sampleRate:", v24, hostTime, startSampleCount);
  unint64_t arrivalHostTimeToAudioRecorder = self->_arrivalHostTimeToAudioRecorder;
  unint64_t v27 = self->_startSampleCount;
  +[CSConfig inputRecordingSampleRate];
  unint64_t v28 = +[CSFTimeUtils hostTimeFromSampleCount:anchorHostTime:anchorSampleCount:sampleRate:](CSFTimeUtils, "hostTimeFromSampleCount:anchorHostTime:anchorSampleCount:sampleRate:", v24, arrivalHostTimeToAudioRecorder, v27);
  uint64_t v29 = [CSAudioChunk alloc];
  LOBYTE(v32) = self->_isFloat;
  LOBYTE(v31) = self->_wasBuffered;
  char v16 = [(CSAudioChunk *)v29 initWithData:v20 numChannels:1 numSamples:a4 sampleByteDepth:self->_sampleByteDepth startSampleCount:v24 hostTime:v25 arrivalHostTimeToAudioRecorder:v28 wasBuffered:v31 remoteVAD:0 isFloat:v32];

LABEL_13:
  return v16;
}

- (BOOL)remoteVADAvailable
{
  return self->_remoteVAD != 0;
}

- (id)dataWithRemoteVADWithScaleFactor:(float)a3 numAudioSamplesPerRemoteVAD:(unint64_t)a4
{
  id v7 = [MEMORY[0x1E4F1CA58] dataWithLength:(self->_numSamples + self->_numSamples * self->_numChannels) * self->_sampleByteDepth];
  memcpy((void *)[v7 bytes], -[NSData bytes](self->_data, "bytes"), self->_numSamples * self->_sampleByteDepth * self->_numChannels);
  uint64_t v8 = [(NSData *)self->_remoteVAD bytes];
  id v9 = v7;
  uint64_t v10 = [v9 bytes];
  if (self->_numSamples)
  {
    uint64_t v11 = v10;
    unint64_t v12 = 0;
    do
    {
      if (v12 / a4 >= [(NSData *)self->_remoteVAD length])
      {
        LOWORD(v14) = 0;
      }
      else
      {
        LOBYTE(v13) = v8[v12 / a4];
        int v14 = (int)(float)((float)v13 * a3);
      }
      unint64_t numSamples = self->_numSamples;
      *(_WORD *)(v11 + 2 * (v12 + self->_numChannels * numSamples)) = v14;
      ++v12;
    }
    while (v12 < numSamples);
  }
  return v9;
}

- (id)dataForChannel:(unint64_t)a3
{
  if (a3 || self->_numChannels != 1)
  {
    unint64_t numSamples = self->_numSamples;
    unint64_t sampleByteDepth = self->_sampleByteDepth;
    v8[0] = 0;
    v8[1] = v8;
    v8[2] = 0x3032000000;
    v8[3] = __Block_byref_object_copy__5348;
    v8[4] = __Block_byref_object_dispose__5349;
    id v9 = self;
    uint64_t v4 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9B8]), "initWithBytesNoCopy:length:deallocator:", -[NSData bytes](v9->_data, "bytes") + numSamples * sampleByteDepth * a3);
    _Block_object_dispose(v8, 8);
  }
  else
  {
    uint64_t v4 = self->_data;
  }
  return v4;
}

void __31__CSAudioChunk_dataForChannel___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

- (id)chunkForChannel:(unint64_t)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  unint64_t numChannels = self->_numChannels;
  if (numChannels <= a3)
  {
    char v16 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v21 = "-[CSAudioChunk chunkForChannel:]";
      __int16 v22 = 1024;
      int v23 = a3;
      __int16 v24 = 1024;
      int v25 = numChannels;
      _os_log_error_impl(&dword_1BA1A5000, v16, OS_LOG_TYPE_ERROR, "%s channelId %d out of bound %d", buf, 0x18u);
    }
    uint64_t v15 = 0;
  }
  else
  {
    unint64_t v6 = [CSAudioChunk alloc];
    id v7 = [(CSAudioChunk *)self dataForChannel:a3];
    unint64_t numSamples = self->_numSamples;
    unint64_t sampleByteDepth = self->_sampleByteDepth;
    unint64_t startSampleCount = self->_startSampleCount;
    unint64_t hostTime = self->_hostTime;
    BOOL wasBuffered = self->_wasBuffered;
    unint64_t arrivalHostTimeToAudioRecorder = self->_arrivalHostTimeToAudioRecorder;
    int v14 = (void *)[(NSData *)self->_remoteVAD copy];
    LOBYTE(v19) = self->_isFloat;
    LOBYTE(v18) = wasBuffered;
    uint64_t v15 = [(CSAudioChunk *)v6 initWithData:v7 numChannels:1 numSamples:numSamples sampleByteDepth:sampleByteDepth startSampleCount:startSampleCount hostTime:hostTime arrivalHostTimeToAudioRecorder:arrivalHostTimeToAudioRecorder wasBuffered:v18 remoteVAD:v14 isFloat:v19];
  }
  return v15;
}

- (OS_xpc_object)xpcObject
{
  keys[8] = *(char **)MEMORY[0x1E4F143B8];
  keys[0] = "numChannels";
  keys[1] = "numSamples";
  keys[2] = "sampleByteDepth";
  keys[3] = "startSampleCount";
  keys[4] = "hostTime";
  keys[5] = "arrivalHostTimeToAudioRecorder";
  keys[6] = "wasBufferedAudio";
  keys[7] = "isFloat";
  values[0] = xpc_uint64_create(self->_numChannels);
  values[1] = xpc_uint64_create(self->_numSamples);
  values[2] = xpc_uint64_create(self->_sampleByteDepth);
  values[3] = xpc_uint64_create(self->_startSampleCount);
  values[4] = xpc_uint64_create(self->_hostTime);
  values[5] = xpc_uint64_create(self->_arrivalHostTimeToAudioRecorder);
  values[6] = xpc_BOOL_create(self->_wasBuffered);
  values[7] = xpc_BOOL_create(self->_isFloat);
  xpc_object_t v3 = xpc_dictionary_create((const char *const *)keys, values, 8uLL);
  data = self->_data;
  if (data && [(NSData *)data length]) {
    xpc_dictionary_set_data(v3, "data", [(NSData *)self->_data bytes], [(NSData *)self->_data length]);
  }
  remoteVAD = self->_remoteVAD;
  if (remoteVAD && [(NSData *)remoteVAD length]) {
    xpc_dictionary_set_data(v3, "remoteVAD", [(NSData *)self->_remoteVAD bytes], [(NSData *)self->_remoteVAD length]);
  }
  for (uint64_t i = 7; i != -1; --i)

  return (OS_xpc_object *)v3;
}

- (CSAudioChunk)initWithXPCObject:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CSAudioChunk;
  id v5 = [(CSAudioChunk *)&v19 init];
  if (v5)
  {
    v5->_unint64_t numChannels = xpc_dictionary_get_uint64(v4, "numChannels");
    v5->_unint64_t numSamples = xpc_dictionary_get_uint64(v4, "numSamples");
    v5->_unint64_t sampleByteDepth = xpc_dictionary_get_uint64(v4, "sampleByteDepth");
    v5->_unint64_t startSampleCount = xpc_dictionary_get_uint64(v4, "startSampleCount");
    v5->_unint64_t hostTime = xpc_dictionary_get_uint64(v4, "hostTime");
    v5->_unint64_t arrivalHostTimeToAudioRecorder = xpc_dictionary_get_uint64(v4, "arrivalHostTimeToAudioRecorder");
    v5->_BOOL wasBuffered = xpc_dictionary_get_BOOL(v4, "wasBufferedAudio");
    v5->_isFloat = xpc_dictionary_get_BOOL(v4, "isFloat");
    size_t length = 0;
    data = xpc_dictionary_get_data(v4, "data", &length);
    if (data && length)
    {
      id v7 = data;
      id v8 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      uint64_t v9 = [v8 initWithBytes:v7 length:length];
      uint64_t v10 = v5->_data;
      v5->_data = (NSData *)v9;
    }
    size_t v17 = 0;
    uint64_t v11 = xpc_dictionary_get_data(v4, "remoteVAD", &v17);
    if (v11 && v17)
    {
      unint64_t v12 = v11;
      id v13 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      uint64_t v14 = [v13 initWithBytes:v12 length:v17];
      remoteVAD = v5->_remoteVAD;
      v5->_remoteVAD = (NSData *)v14;
    }
  }

  return v5;
}

- (CSAudioChunk)initWithData:(id)a3 numChannels:(unint64_t)a4 numSamples:(unint64_t)a5 sampleByteDepth:(unint64_t)a6 startSampleCount:(unint64_t)a7 hostTime:(unint64_t)a8 remoteVAD:(id)a9 isFloat:(BOOL)a10
{
  LOBYTE(v12) = a10;
  LOBYTE(v11) = 0;
  return [(CSAudioChunk *)self initWithData:a3 numChannels:a4 numSamples:a5 sampleByteDepth:a6 startSampleCount:a7 hostTime:a8 arrivalHostTimeToAudioRecorder:0 wasBuffered:v11 remoteVAD:a9 isFloat:v12];
}

- (CSAudioChunk)initWithData:(id)a3 numChannels:(unint64_t)a4 numSamples:(unint64_t)a5 sampleByteDepth:(unint64_t)a6 startSampleCount:(unint64_t)a7 hostTime:(unint64_t)a8 arrivalHostTimeToAudioRecorder:(unint64_t)a9 wasBuffered:(BOOL)a10 remoteVAD:(id)a11 isFloat:(BOOL)a12
{
  id v18 = a3;
  id v19 = a11;
  v25.receiver = self;
  v25.super_class = (Class)CSAudioChunk;
  uint64_t v20 = [(CSAudioChunk *)&v25 init];
  __int16 v21 = v20;
  if (v20)
  {
    unint64_t v22 = a9;
    objc_storeStrong((id *)&v20->_data, a3);
    v21->_unint64_t numChannels = a4;
    v21->_unint64_t numSamples = a5;
    v21->_unint64_t sampleByteDepth = a6;
    v21->_unint64_t startSampleCount = a7;
    v21->_unint64_t hostTime = a8;
    objc_storeStrong((id *)&v21->_remoteVAD, a11);
    v21->_BOOL wasBuffered = a10;
    v21->_isFloat = a12;
    if (!a9) {
      unint64_t v22 = mach_absolute_time();
    }
    v21->_unint64_t arrivalHostTimeToAudioRecorder = v22;
  }

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end