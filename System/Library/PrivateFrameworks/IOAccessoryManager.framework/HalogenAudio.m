@interface HalogenAudio
- (BOOL)startAudioUnit;
- (BOOL)stopAudioUnit;
- (HalogenAudioDelegate)halogenUnitDelegate;
- (OpaqueAudioComponentInstance)audioComponentInst;
- (OpaqueAudioComponentInstance)getAudioComponentInstance;
- (id)initAudioWithParameters:(id)a3 nInputChannels:(int)a4 nOutputChannels:(int)a5 sampleRate:(int)a6 bitDepth:(int)a7 inputFrameSizeInBytes:(int)a8 outputFrameSizeInBytes:(int)a9;
- (int)bitDepth;
- (int)inputFrameSizeInBytes;
- (int)nInputChannels;
- (int)nOutputChannels;
- (int)outputFrameSizeInBytes;
- (int)sampleRate;
- (void)_deinitAudioInstance;
- (void)dealloc;
- (void)setAudioComponentInst:(OpaqueAudioComponentInstance *)a3;
- (void)setBitDepth:(int)a3;
- (void)setHalogenUnitDelegate:(id)a3;
- (void)setInputFrameSizeInBytes:(int)a3;
- (void)setNInputChannels:(int)a3;
- (void)setNOutputChannels:(int)a3;
- (void)setOutputFrameSizeInBytes:(int)a3;
- (void)setSampleRate:(int)a3;
@end

@implementation HalogenAudio

- (id)initAudioWithParameters:(id)a3 nInputChannels:(int)a4 nOutputChannels:(int)a5 sampleRate:(int)a6 bitDepth:(int)a7 inputFrameSizeInBytes:(int)a8 outputFrameSizeInBytes:(int)a9
{
  v19.receiver = self;
  v19.super_class = (Class)HalogenAudio;
  v15 = [(HalogenAudio *)&v19 init];
  v16 = v15;
  if (v15)
  {
    v15->_nInputChannels = a4;
    v15->_nOutputChannels = a5;
    v15->_sampleRate = a6;
    v15->_bitDepth = a7;
    v15->_inputFrameSizeInBytes = a8;
    v15->_outputFrameSizeInBytes = a9;
    if (a3)
    {
      [(HalogenAudio *)v15 setHalogenUnitDelegate:a3];
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "HalogenAudio:initAudioPath did not receive a valid halogenUnit.", v18, 2u);
      }

      return 0;
    }
  }
  return v16;
}

- (void)dealloc
{
  [(HalogenAudio *)self _deinitAudioInstance];
  v3.receiver = self;
  v3.super_class = (Class)HalogenAudio;
  [(HalogenAudio *)&v3 dealloc];
}

- (void)_deinitAudioInstance
{
  audioComponentInst = self->_audioComponentInst;
  if (audioComponentInst)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "HalogenAudio:Uninitializing AudioUnit instance.", v4, 2u);
      audioComponentInst = self->_audioComponentInst;
    }
    AudioUnitUninitialize(audioComponentInst);
    AudioComponentInstanceDispose(self->_audioComponentInst);
    self->_audioComponentInst = 0;
  }
}

- (BOOL)startAudioUnit
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  v60 = (uint64_t (*)(void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))0xAAAAAAAAAAAAAAAALL;
  v61 = (HalogenAudio *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v59 = 0;
  unsigned int bitDepth = self->_bitDepth;
  double sampleRate = (double)self->_sampleRate;
  int nOutputChannels = self->_nOutputChannels;
  int inputFrameSizeInBytes = self->_inputFrameSizeInBytes;
  int outputFrameSizeInBytes = self->_outputFrameSizeInBytes;
  int nInputChannels = self->_nInputChannels;
  LODWORD(v59) = bitDepth;
  int v52 = nOutputChannels;
  uint64_t v53 = bitDepth;
  int v55 = inputFrameSizeInBytes;
  int v56 = 1;
  int v57 = inputFrameSizeInBytes;
  *(double *)v54 = sampleRate;
  v54[1] = 0x96C70636DLL;
  int v50 = 1;
  int v51 = outputFrameSizeInBytes;
  int v49 = outputFrameSizeInBytes;
  *(double *)v48 = sampleRate;
  v48[1] = 0x96C70636DLL;
  *(_OWORD *)&inDesc.componentType = xmmword_1D964CE50;
  inDesc.componentFlagsMask = 0;
  Next = AudioComponentFindNext(0, &inDesc);
  if (!Next)
  {
    BOOL v25 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (v25)
    {
      *(_WORD *)buf = 0;
      v23 = MEMORY[0x1E4F14500];
      v24 = "HalogenAudio:AudioComponentFindNext() failed to find kAudioUnitSubType_LDCMIO";
      uint32_t v26 = 2;
LABEL_38:
      _os_log_impl(&dword_1D9622000, v23, OS_LOG_TYPE_DEFAULT, v24, buf, v26);
      return 0;
    }
    return result;
  }
  p_audioComponentInst = &self->_audioComponentInst;
  OSStatus v10 = AudioComponentInstanceNew(Next, &self->_audioComponentInst);
  if (v10 || (v11 = *p_audioComponentInst) == 0)
  {
    BOOL v22 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v22) {
      return result;
    }
    *(_DWORD *)buf = 67109120;
    OSStatus v63 = v10;
    v23 = MEMORY[0x1E4F14500];
    v24 = "HalogenAudio:AudioComponentInstanceNew() failed (status = 0x%x) ";
    goto LABEL_37;
  }
  int inData = 1;
  OSStatus v12 = AudioUnitSetProperty(v11, 0x7D3u, 1u, 1u, &inData, 4u);
  if (v12)
  {
    OSStatus v27 = v12;
    BOOL v28 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v28) {
      return result;
    }
    *(_DWORD *)buf = 67109120;
    OSStatus v63 = v27;
    v23 = MEMORY[0x1E4F14500];
    v24 = "HalogenAudio:AudioUnitSetProperty() failed to set kAudioOutputUnitProperty_EnableIO/1 (status = 0x%x)";
    goto LABEL_37;
  }
  OSStatus v13 = AudioUnitSetProperty(*p_audioComponentInst, 0x7D3u, 2u, 0, &inData, 4u);
  if (v13)
  {
    OSStatus v29 = v13;
    BOOL v30 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v30) {
      return result;
    }
    *(_DWORD *)buf = 67109120;
    OSStatus v63 = v29;
    v23 = MEMORY[0x1E4F14500];
    v24 = "HalogenAudio:AudioUnitSetProperty() failed to set kAudioOutputUnitProperty_EnableIO/0 (status = 0x%x)";
    goto LABEL_37;
  }
  OSStatus v14 = AudioUnitSetProperty(*p_audioComponentInst, 8u, 1u, 0, v48, 0x28u);
  if (v14)
  {
    OSStatus v31 = v14;
    BOOL v32 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v32) {
      return result;
    }
    *(_DWORD *)buf = 67109120;
    OSStatus v63 = v31;
    v23 = MEMORY[0x1E4F14500];
    v24 = "HalogenAudio:AudioUnitSetProperty() failed to set kAudioUnitProperty_StreamFormat/kAudioUnitScope_Input (status = 0x%x)";
    goto LABEL_37;
  }
  int v45 = 0;
  OSStatus v15 = AudioUnitSetProperty(*p_audioComponentInst, 0x33u, 2u, 1u, &v45, 4u);
  if (v15)
  {
    OSStatus v33 = v15;
    BOOL v34 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v34) {
      return result;
    }
    *(_DWORD *)buf = 67109120;
    OSStatus v63 = v33;
    v23 = MEMORY[0x1E4F14500];
    v24 = "HalogenAudio:AudioUnitSetProperty() failed to set kAudioUnitProperty_ShouldAllocateBuffer (status = 0x%x)";
    goto LABEL_37;
  }
  OSStatus v16 = AudioUnitSetProperty(*p_audioComponentInst, 8u, 2u, 1u, v54, 0x28u);
  if (v16)
  {
    OSStatus v35 = v16;
    BOOL v36 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v36) {
      return result;
    }
    *(_DWORD *)buf = 67109120;
    OSStatus v63 = v35;
    v23 = MEMORY[0x1E4F14500];
    v24 = "HalogenAudio:AudioUnitSetProperty() failed to set kAudioUnitProperty_StreamFormat/kAudioUnitScope_Output (status = 0x%x)";
    goto LABEL_37;
  }
  v60 = recordCallback;
  v61 = self;
  OSStatus v17 = AudioUnitSetProperty(self->_audioComponentInst, 0x7D5u, 0, 1u, &v60, 0x10u);
  if (v17)
  {
    OSStatus v37 = v17;
    BOOL v38 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v38) {
      return result;
    }
    *(_DWORD *)buf = 67109120;
    OSStatus v63 = v37;
    v23 = MEMORY[0x1E4F14500];
    v24 = "HalogenAudio:AudioUnitSetProperty() failed to set kAudioOutputUnitProperty_SetInputCallback (status = 0x%x)";
    goto LABEL_37;
  }
  v60 = playbackCallback;
  v61 = self;
  OSStatus v18 = AudioUnitSetProperty(self->_audioComponentInst, 0x17u, 0, 0, &v60, 0x10u);
  if (v18)
  {
    OSStatus v39 = v18;
    BOOL v40 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v40) {
      return result;
    }
    *(_DWORD *)buf = 67109120;
    OSStatus v63 = v39;
    v23 = MEMORY[0x1E4F14500];
    v24 = "HalogenAudio:AudioUnitSetProperty() failed to set kAudioOutputUnitProperty_SetRenderCallback (status = 0x%x)";
    goto LABEL_37;
  }
  OSStatus v19 = AudioUnitInitialize(*p_audioComponentInst);
  if (v19)
  {
    OSStatus v41 = v19;
    BOOL v42 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v42) {
      return result;
    }
    *(_DWORD *)buf = 67109120;
    OSStatus v63 = v41;
    v23 = MEMORY[0x1E4F14500];
    v24 = "HalogenAudio:AudioUnitInitialize() failed (status = 0x%x)";
LABEL_37:
    uint32_t v26 = 8;
    goto LABEL_38;
  }
  OSStatus v20 = AudioOutputUnitStart(*p_audioComponentInst);
  if (!v20) {
    return 1;
  }
  OSStatus v43 = v20;
  BOOL v44 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v44)
  {
    *(_DWORD *)buf = 67109120;
    OSStatus v63 = v43;
    v23 = MEMORY[0x1E4F14500];
    v24 = "HalogenAudio:AudioUnitStart() failed (status = 0x%x)";
    goto LABEL_37;
  }
  return result;
}

- (BOOL)stopAudioUnit
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OSStatus v2 = AudioOutputUnitStop(self->_audioComponentInst);
  if (v2 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = v2;
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "HalogenAudio:AudioUnitStop() failed (status = 0x%x)", (uint8_t *)v4, 8u);
  }
  return v2 == 0;
}

- (OpaqueAudioComponentInstance)getAudioComponentInstance
{
  return self->_audioComponentInst;
}

- (HalogenAudioDelegate)halogenUnitDelegate
{
  return self->_halogenUnitDelegate;
}

- (void)setHalogenUnitDelegate:(id)a3
{
}

- (OpaqueAudioComponentInstance)audioComponentInst
{
  return self->_audioComponentInst;
}

- (void)setAudioComponentInst:(OpaqueAudioComponentInstance *)a3
{
  self->_audioComponentInst = a3;
}

- (int)nInputChannels
{
  return self->_nInputChannels;
}

- (void)setNInputChannels:(int)a3
{
  self->_int nInputChannels = a3;
}

- (int)nOutputChannels
{
  return self->_nOutputChannels;
}

- (void)setNOutputChannels:(int)a3
{
  self->_int nOutputChannels = a3;
}

- (int)sampleRate
{
  return self->_sampleRate;
}

- (void)setSampleRate:(int)a3
{
  self->_double sampleRate = a3;
}

- (int)bitDepth
{
  return self->_bitDepth;
}

- (void)setBitDepth:(int)a3
{
  self->_unsigned int bitDepth = a3;
}

- (int)inputFrameSizeInBytes
{
  return self->_inputFrameSizeInBytes;
}

- (void)setInputFrameSizeInBytes:(int)a3
{
  self->_int inputFrameSizeInBytes = a3;
}

- (int)outputFrameSizeInBytes
{
  return self->_outputFrameSizeInBytes;
}

- (void)setOutputFrameSizeInBytes:(int)a3
{
  self->_int outputFrameSizeInBytes = a3;
}

@end