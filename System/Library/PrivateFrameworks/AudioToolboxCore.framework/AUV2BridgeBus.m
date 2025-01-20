@interface AUV2BridgeBus
- (AUV2BridgeBus)initWithOwner:(id)a3 au:(OpaqueAudioComponentInstance *)a4 scope:(unsigned int)a5 element:(unsigned int)a6;
- (BOOL)setFormat:(id)a3 error:(id *)a4;
- (id)format;
- (void)setEnabled:(BOOL)a3;
@end

@implementation AUV2BridgeBus

- (void).cxx_destruct
{
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  int v6 = [WeakRetained enableBus:self->_element scope:self->_scope enable:v3];

  if (!v6)
  {
    v7.receiver = self;
    v7.super_class = (Class)AUV2BridgeBus;
    [(AUAudioUnitBus *)&v7 setEnabled:v3];
  }
}

- (BOOL)setFormat:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [(AUV2BridgeBus *)self willChangeValueForKey:@"format"];
  OSStatus v7 = AudioUnitSetProperty(self->_audioUnit, 8u, self->_scope, self->_element, (const void *)[v6 streamDescription], 0x28u);
  if (!v7)
  {
    v8 = [v6 channelLayout];
    v9 = v8;
    if (v8)
    {
      audioUnit = self->_audioUnit;
      AudioUnitScope scope = self->_scope;
      AudioUnitElement element = self->_element;
      uint64_t v13 = [v8 layout];
      id v14 = v9;
      inData = (void *)v13;
      if ([v14 layout])
      {
        v15 = audioUnit;
        if (*(_DWORD *)[v14 layout]) {
          UInt32 v16 = 12;
        }
        else {
          UInt32 v16 = 20 * *(_DWORD *)([v14 layout] + 8) + 12;
        }
      }
      else
      {
        v15 = audioUnit;
        UInt32 v16 = 0;
      }

      AudioUnitSetProperty(v15, 0x13u, scope, element, inData, v16);
    }
  }
  [(AUV2BridgeBus *)self didChangeValueForKey:@"format"];
  if (a4)
  {
    if (v7)
    {
      id v17 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v7 userInfo:0];
      *a4 = v17;
    }
    else
    {
      *a4 = 0;
    }
  }

  return v7 == 0;
}

- (id)format
{
  BOOL v3 = 0;
  int v4 = 50;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  UInt32 ioDataSize = 0;
  int v5 = 4;
  p_vtable = &OBJC_METACLASS___CarbonComponentScannerXPCClient.vtable;
  unint64_t v7 = 0x1E9273000uLL;
  while (1)
  {

    if (v5 != 4)
    {
      usleep(1000 * v4);
      v4 *= 2;
    }
    UInt32 ioDataSize = 40;
    if (AudioUnitGetProperty(self->_audioUnit, 8u, self->_scope, self->_element, outData, &ioDataSize))
    {
      BOOL v3 = 0;
      v23 = 0;
      goto LABEL_56;
    }
    UInt32 ioDataSize = 0;
    if (AudioUnitGetPropertyInfo(self->_audioUnit, 0x13u, self->_scope, self->_element, &ioDataSize, 0)) {
      break;
    }
    std::vector<unsigned char>::vector(&__p, ioDataSize);
    if (AudioUnitGetProperty(self->_audioUnit, 0x13u, self->_scope, self->_element, __p, &ioDataSize))
    {
      BOOL v3 = 0;
    }
    else
    {
      BOOL v3 = [getAVAudioChannelLayoutClass() layoutWithLayout:__p];
      int v8 = [v3 channelCount];
      if (v8 != v50)
      {
        v11 = (id *)p_vtable[472];
        if (v11)
        {
          id v12 = *v11;
          if (!v12)
          {
LABEL_29:
            char v9 = 0;
            goto LABEL_10;
          }
        }
        else
        {
          uint64_t v13 = (void *)MEMORY[0x1E4F14500];
          id v14 = MEMORY[0x1E4F14500];
          id v12 = v13;
        }
        v15 = v12;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          audioUnit = self->_audioUnit;
          id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.isa + *(int *)(v7 + 888)));
          int v43 = v4;
          v44 = WeakRetained;
          log = v15;
          v42 = audioUnit;
          if (WeakRetained) {
            [WeakRetained componentDescription];
          }
          else {
            memset(&v46, 0, sizeof(v46));
          }
          CAFormatter::CAFormatter((CAFormatter *)&v47, &v46);
          v18 = v47;
          unsigned int element = self->_element;
          unsigned int scope = self->_scope;
          unsigned int v21 = v50;
          int v22 = [v3 channelCount];
          *(_DWORD *)buf = 136316930;
          *(void *)&buf[4] = "AUAudioUnitV2Bridge.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 397;
          *(_WORD *)&buf[18] = 2048;
          *(void *)&buf[20] = v42;
          *(_WORD *)&buf[28] = 2080;
          *(void *)&buf[30] = v18;
          *(_WORD *)&buf[38] = 1024;
          unsigned int v56 = element;
          __int16 v57 = 1024;
          unsigned int v58 = scope;
          __int16 v59 = 1024;
          unsigned int v60 = v21;
          __int16 v61 = 1024;
          int v62 = v22;
          v15 = log;
          _os_log_impl(&dword_18FEC0000, log, OS_LOG_TYPE_DEBUG, "%25s:%-5d au@%p {%s} (bus %d, scope %d): inconsistent #channels in asbd %d, layout %d.. retrying", buf, 0x3Eu);
          if (v47) {
            free(v47);
          }

          unint64_t v7 = 0x1E9273000;
          p_vtable = (void **)(&OBJC_METACLASS___CarbonComponentScannerXPCClient + 24);
          int v4 = v43;
        }

        goto LABEL_29;
      }
    }
    char v9 = 1;
LABEL_10:
    if (__p)
    {
      p_p = __p;
      operator delete(__p);
    }
    if (v5) {
      char v10 = v9;
    }
    else {
      char v10 = 1;
    }
    --v5;
    if (v10) {
      goto LABEL_32;
    }
  }
  BOOL v3 = 0;
LABEL_32:
  if (!v3 && v50 >= 3)
  {
    BOOL v3 = [getAVAudioChannelLayoutClass() layoutWithLayoutTag:v50 | 0x930000];
  }
  if (v3)
  {
    int v24 = [v3 channelCount];
    unsigned int v25 = v50;
    if (v24 != v50)
    {
      v26 = (id *)p_vtable[472];
      if (v26)
      {
        id v27 = *v26;
        if (!v27) {
          goto LABEL_49;
        }
      }
      else
      {
        id v27 = (id)MEMORY[0x1E4F14500];
        id v28 = MEMORY[0x1E4F14500];
      }
      v29 = v27;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = self->_audioUnit;
        id v31 = objc_loadWeakRetained((id *)((char *)&self->super.super.isa + *(int *)(v7 + 888)));
        v32 = v31;
        if (v31)
        {
          [v31 componentDescription];
        }
        else
        {
          __p = 0;
          p_p = 0;
          LODWORD(v53) = 0;
        }
        CAFormatter::CAFormatter((CAFormatter *)&v46, (const AudioComponentDescription *)&__p);
        uint64_t v33 = *(void *)&v46.componentType;
        unsigned int v34 = self->_element;
        unsigned int v35 = self->_scope;
        unsigned int v36 = v50;
        int v37 = [v3 channelCount];
        *(_DWORD *)buf = 136316930;
        *(void *)&buf[4] = "AUAudioUnitV2Bridge.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 415;
        *(_WORD *)&buf[18] = 2048;
        *(void *)&buf[20] = v30;
        *(_WORD *)&buf[28] = 2080;
        *(void *)&buf[30] = v33;
        *(_WORD *)&buf[38] = 1024;
        unsigned int v56 = v34;
        __int16 v57 = 1024;
        unsigned int v58 = v35;
        __int16 v59 = 1024;
        unsigned int v60 = v36;
        __int16 v61 = 1024;
        int v62 = v37;
        _os_log_impl(&dword_18FEC0000, v29, OS_LOG_TYPE_DEFAULT, "%25s:%-5d au@%p {%s} (bus %d, scope %d): inconsistent #channels in asbd %d, layout %d, faking a format", buf, 0x3Eu);
        if (*(void *)&v46.componentType) {
          free(*(void **)&v46.componentType);
        }
      }
      unsigned int v25 = v50;
LABEL_49:
      if (v25 < 3)
      {
        uint64_t v38 = 0;
      }
      else
      {
        uint64_t v38 = [getAVAudioChannelLayoutClass() layoutWithLayoutTag:v50 | 0x930000];
      }

      BOOL v3 = (void *)v38;
    }
  }
  __p = 0;
  p_p = &__p;
  uint64_t v53 = 0x2050000000;
  v39 = (void *)getAVAudioFormatClass(void)::softClass;
  uint64_t v54 = getAVAudioFormatClass(void)::softClass;
  if (!getAVAudioFormatClass(void)::softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = ___ZL21getAVAudioFormatClassv_block_invoke_9222;
    *(void *)&buf[24] = &unk_1E5688B80;
    *(void *)&buf[32] = &__p;
    ___ZL21getAVAudioFormatClassv_block_invoke_9222((uint64_t)buf);
    v39 = (void *)p_p[3];
  }
  v40 = v39;
  _Block_object_dispose(&__p, 8);
  v23 = (void *)[[v40 alloc] initWithStreamDescription:outData channelLayout:v3];
LABEL_56:

  return v23;
}

- (AUV2BridgeBus)initWithOwner:(id)a3 au:(OpaqueAudioComponentInstance *)a4 scope:(unsigned int)a5 element:(unsigned int)a6
{
  id v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AUV2BridgeBus;
  v11 = [(AUV2BridgeBus *)&v14 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_owner, v10);
    v12->_audioUnit = a4;
    v12->_unsigned int scope = a5;
    v12->_unsigned int element = a6;
  }

  return v12;
}

@end