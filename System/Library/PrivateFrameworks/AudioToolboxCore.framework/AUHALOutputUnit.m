@interface AUHALOutputUnit
- (AUHALOutputUnit)initWithAudioUnit:(OpaqueAudioComponentInstance *)a3 description:(AudioComponentDescription *)a4;
- (AUHALOutputUnit)initWithComponentDescription:(AudioComponentDescription *)a3 options:(unsigned int)a4 error:(id *)a5;
- (BOOL)canPerformInput;
- (BOOL)canPerformOutput;
- (BOOL)isInputEnabled;
- (BOOL)isOutputEnabled;
- (BOOL)isRunning;
- (BOOL)startHardwareAndReturnError:(id *)a3;
- (id).cxx_construct;
- (id)_inputHandler;
- (id)outputProvider;
- (int)enableBus:(unsigned int)a3 scope:(unsigned int)a4 enable:(BOOL)a5;
- (int64_t)tokenByAddingRenderObserver:(id)a3;
- (void)addRenderObserver:(void *)a3 userData:(void *)a4;
- (void)dealloc;
- (void)initAUHALOutputUnit;
- (void)removeRenderObserver:(int64_t)a3;
- (void)removeRenderObserver:(void *)a3 userData:(void *)a4;
- (void)setInputEnabled:(BOOL)a3;
- (void)setInputHandler:(id)a3;
- (void)setOutputEnabled:(BOOL)a3;
- (void)setOutputProvider:(id)a3;
- (void)stopHardware;
@end

@implementation AUHALOutputUnit

- (id).cxx_construct
{
  *((_OWORD *)self + 44) = 0u;
  *((_OWORD *)self + 45) = 0u;
  *((_DWORD *)self + 184) = 1065353216;
  return self;
}

- (void).cxx_destruct
{
  v3 = (void **)((char *)self + 704);
  std::__hash_table<std::__hash_value_type<long,void({block_pointer} {__strong})(unsigned int,AudioTimeStamp const*,unsigned int,long)>,std::__unordered_map_hasher<long,std::__hash_value_type<long,void({block_pointer} {__strong})(unsigned int,AudioTimeStamp const*,unsigned int,long)>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,void({block_pointer} {__strong})(unsigned int,AudioTimeStamp const*,unsigned int,long)>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,void({block_pointer} {__strong})(unsigned int,AudioTimeStamp const*,unsigned int,long)>>>::__deallocate_node(*((id **)self + 90));
  v4 = *v3;
  *v3 = 0;
  if (v4) {
    operator delete(v4);
  }
  objc_storeStrong((id *)self + 86, 0);
  objc_storeStrong((id *)self + 85, 0);
}

- (void)stopHardware
{
  v2 = [(AUAudioUnitV2Bridge *)self audioUnit];
  AudioOutputUnitStop(v2);
}

- (BOOL)startHardwareAndReturnError:(id *)a3
{
  OSStatus v4 = AudioOutputUnitStart([(AUAudioUnitV2Bridge *)self audioUnit]);
  OSStatus v5 = v4;
  if (a3)
  {
    if (v4)
    {
      id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v4 userInfo:0];
      *a3 = v6;
    }
    else
    {
      *a3 = 0;
    }
  }
  return v5 == 0;
}

- (BOOL)isRunning
{
  int outData = 0;
  UInt32 ioDataSize = 4;
  if (AudioUnitGetProperty([(AUAudioUnitV2Bridge *)self audioUnit], 0x7D1u, 0, 0, &outData, &ioDataSize)) {
    BOOL v2 = 1;
  }
  else {
    BOOL v2 = outData == 0;
  }
  return !v2;
}

- (void)setOutputEnabled:(BOOL)a3
{
  BOOL inData = a3;
  *((unsigned char *)self + 697) = a3;
  AudioUnitSetProperty([(AUAudioUnitV2Bridge *)self audioUnit], 0x7D3u, 2u, 0, &inData, 4u);
}

- (void)setInputEnabled:(BOOL)a3
{
  BOOL inData = a3;
  *((unsigned char *)self + 696) = a3;
  AudioUnitSetProperty([(AUAudioUnitV2Bridge *)self audioUnit], 0x7D3u, 1u, 1u, &inData, 4u);
}

- (BOOL)isOutputEnabled
{
  int outData = 0;
  UInt32 ioDataSize = 4;
  if (AudioUnitGetProperty([(AUAudioUnitV2Bridge *)self audioUnit], 0x7D3u, 2u, 0, &outData, &ioDataSize)) {
    BOOL v2 = 1;
  }
  else {
    BOOL v2 = outData == 0;
  }
  return !v2;
}

- (BOOL)isInputEnabled
{
  int outData = 0;
  UInt32 ioDataSize = 4;
  if (AudioUnitGetProperty([(AUAudioUnitV2Bridge *)self audioUnit], 0x7D3u, 1u, 1u, &outData, &ioDataSize)) {
    BOOL v2 = 1;
  }
  else {
    BOOL v2 = outData == 0;
  }
  return !v2;
}

- (BOOL)canPerformOutput
{
  int outData = 0;
  UInt32 ioDataSize = 4;
  OSStatus Property = AudioUnitGetProperty([(AUAudioUnitV2Bridge *)self audioUnit], 0x7D6u, 2u, 0, &outData, &ioDataSize);
  if (Property) {
    return Property == -10879;
  }
  else {
    return outData != 0;
  }
}

- (BOOL)canPerformInput
{
  int outData = 0;
  UInt32 ioDataSize = 4;
  OSStatus Property = AudioUnitGetProperty([(AUAudioUnitV2Bridge *)self audioUnit], 0x7D6u, 1u, 1u, &outData, &ioDataSize);
  if (Property) {
    return Property == -10879;
  }
  else {
    return outData != 0;
  }
}

- (void)setInputHandler:(id)a3
{
  id v4 = a3;
  id v5 = (id)*((void *)self + 86);
  if (v5 != v4)
  {
    *((void *)self + 86) = 0;

    if (v4)
    {
      uint64_t v6 = [v4 copy];
      v7 = (void *)*((void *)self + 86);
      *((void *)self + 86) = v6;

      uint64_t v8 = *((void *)self + 86);
      v9 = AUHALOutputUnit_InputAvailableCallback;
      uint64_t v10 = v8;
    }
    else
    {
      v9 = 0;
      uint64_t v10 = 0;
    }
    AudioUnitSetProperty([(AUAudioUnitV2Bridge *)self audioUnit], 0x7D5u, 0, 0, &v9, 0x10u);
  }
}

- (void)setOutputProvider:(id)a3
{
  id v4 = a3;
  id v5 = (id)*((void *)self + 85);
  id v8 = v4;
  if (v5 != v4)
  {
    *((void *)self + 85) = 0;

    if (v8)
    {
      uint64_t v6 = [v8 copy];
      v7 = (void *)*((void *)self + 85);
      *((void *)self + 85) = v6;
    }
    [(AUHALOutputUnit *)self enableBus:0 scope:1 enable:*((void *)self + 85) != 0];
  }
}

- (int)enableBus:(unsigned int)a3 scope:(unsigned int)a4 enable:(BOOL)a5
{
  if (a3 || a4 != 1) {
    return -[AUAudioUnitV2Bridge enableBus:scope:enable:](&v7, sel_enableBus_scope_enable_, *(void *)&a3, *(void *)&a4, a5, self, AUHALOutputUnit, v8.receiver, v8.super_class);
  }
  *((unsigned char *)self + 698) = a5;
  if (!a5) {
    return -[AUAudioUnitV2Bridge enableBus:scope:enable:](&v8, sel_enableBus_scope_enable_, 0, 1, a5, v7.receiver, v7.super_class, self, AUHALOutputUnit);
  }
  uint64_t v5 = *((void *)self + 85);
  if (!v5) {
    return -[AUAudioUnitV2Bridge enableBus:scope:enable:](&v8, sel_enableBus_scope_enable_, 0, 1, a5, v7.receiver, v7.super_class, self, AUHALOutputUnit);
  }
  inData[0] = AUHALOutputUnit_ProvideOutputCallback;
  inData[1] = v5;
  return AudioUnitSetProperty([(AUAudioUnitV2Bridge *)self audioUnit], 0x17u, 1u, 0, inData, 0x10u);
}

- (id)_inputHandler
{
  BOOL v2 = _Block_copy(*((const void **)self + 86));
  return v2;
}

- (id)outputProvider
{
  BOOL v2 = _Block_copy(*((const void **)self + 85));
  return v2;
}

- (void)removeRenderObserver:(void *)a3 userData:(void *)a4
{
  uint64_t v6 = [(AUAudioUnitV2Bridge *)self audioUnit];
  AudioUnitRemoveRenderNotify(v6, (AURenderCallback)a3, a4);
}

- (void)addRenderObserver:(void *)a3 userData:(void *)a4
{
  uint64_t v6 = [(AUAudioUnitV2Bridge *)self audioUnit];
  AudioUnitAddRenderNotify(v6, (AURenderCallback)a3, a4);
}

- (void)removeRenderObserver:(int64_t)a3
{
  v3 = (void *)((char *)self + 704);
  unint64_t v4 = *((void *)self + 89);
  if (v4)
  {
    uint8x8_t v5 = (uint8x8_t)vcnt_s8((int8x8_t)v4);
    v5.i16[0] = vaddlv_u8(v5);
    if (v5.u32[0] > 1uLL)
    {
      unint64_t v6 = a3;
      if (v4 <= a3) {
        unint64_t v6 = a3 % v4;
      }
    }
    else
    {
      unint64_t v6 = (v4 - 1) & a3;
    }
    objc_super v7 = *(void ***)(*v3 + 8 * v6);
    if (v7)
    {
      for (i = *v7; i; i = (void *)*i)
      {
        unint64_t v9 = i[1];
        if (v9 == a3)
        {
          if (i[2] == a3)
          {
            AudioUnitRemoveRenderNotify([(AUAudioUnitV2Bridge *)self audioUnit], (AURenderCallback)AUHALOutputUnit_RenderNotifyCallback, (void *)i[3]);
            int8x8_t v10 = (int8x8_t)v3[1];
            unint64_t v11 = i[1];
            uint8x8_t v12 = (uint8x8_t)vcnt_s8(v10);
            v12.i16[0] = vaddlv_u8(v12);
            if (v12.u32[0] > 1uLL)
            {
              if (v11 >= *(void *)&v10) {
                v11 %= *(void *)&v10;
              }
            }
            else
            {
              v11 &= *(void *)&v10 - 1;
            }
            v13 = *(void **)(*v3 + 8 * v11);
            do
            {
              v14 = v13;
              v13 = (void *)*v13;
            }
            while (v13 != i);
            if (v14 == v3 + 2) {
              goto LABEL_35;
            }
            unint64_t v15 = v14[1];
            if (v12.u32[0] > 1uLL)
            {
              if (v15 >= *(void *)&v10) {
                v15 %= *(void *)&v10;
              }
            }
            else
            {
              v15 &= *(void *)&v10 - 1;
            }
            if (v15 != v11)
            {
LABEL_35:
              if (!*i) {
                goto LABEL_36;
              }
              unint64_t v16 = *(void *)(*i + 8);
              if (v12.u32[0] > 1uLL)
              {
                if (v16 >= *(void *)&v10) {
                  v16 %= *(void *)&v10;
                }
              }
              else
              {
                v16 &= *(void *)&v10 - 1;
              }
              if (v16 != v11) {
LABEL_36:
              }
                *(void *)(*v3 + 8 * v11) = 0;
            }
            uint64_t v17 = *i;
            if (*i)
            {
              unint64_t v18 = *(void *)(v17 + 8);
              if (v12.u32[0] > 1uLL)
              {
                if (v18 >= *(void *)&v10) {
                  v18 %= *(void *)&v10;
                }
              }
              else
              {
                v18 &= *(void *)&v10 - 1;
              }
              if (v18 != v11)
              {
                *(void *)(*v3 + 8 * v18) = v14;
                uint64_t v17 = *i;
              }
            }
            void *v14 = v17;
            void *i = 0;
            --v3[3];

            operator delete(i);
            return;
          }
        }
        else
        {
          if (v5.u32[0] > 1uLL)
          {
            if (v9 >= v4) {
              v9 %= v4;
            }
          }
          else
          {
            v9 &= v4 - 1;
          }
          if (v9 != v6) {
            return;
          }
        }
      }
    }
  }
}

- (int64_t)tokenByAddingRenderObserver:(id)a3
{
  id v5 = a3;
  unint64_t v6 = (void *)[v5 copy];
  AudioUnitAddRenderNotify([(AUAudioUnitV2Bridge *)self audioUnit], (AURenderCallback)AUHALOutputUnit_RenderNotifyCallback, v6);
  unint64_t v7 = (int)(atomic_fetch_add_explicit((atomic_uint *volatile)self + 175, 1u, memory_order_relaxed) + 1);
  objc_super v8 = (char *)self + 704;
  unint64_t v9 = *((void *)self + 89);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v3 = v7;
      if (v9 <= v7) {
        unint64_t v3 = v7 % v9;
      }
    }
    else
    {
      unint64_t v3 = (v9 - 1) & v7;
    }
    unint64_t v11 = *(void **)(*(void *)v8 + 8 * v3);
    if (v11)
    {
      for (i = (void *)*v11; i; i = (void *)*i)
      {
        unint64_t v13 = i[1];
        if (v13 == v7)
        {
          if (i[2] == v7) {
            goto LABEL_74;
          }
        }
        else
        {
          if (v10.u32[0] > 1uLL)
          {
            if (v13 >= v9) {
              v13 %= v9;
            }
          }
          else
          {
            v13 &= v9 - 1;
          }
          if (v13 != v3) {
            break;
          }
        }
      }
    }
  }
  v14 = operator new(0x20uLL);
  unint64_t v15 = v8 + 16;
  void *v14 = 0;
  v14[1] = v7;
  v14[2] = v7;
  v14[3] = _Block_copy(v6);
  float v16 = (float)(unint64_t)(*((void *)v8 + 3) + 1);
  float v17 = *((float *)v8 + 8);
  if (!v9 || (float)(v17 * (float)v9) < v16)
  {
    BOOL v18 = 1;
    if (v9 >= 3) {
      BOOL v18 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v19 = v18 | (2 * v9);
    unint64_t v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20) {
      int8x8_t prime = (int8x8_t)v20;
    }
    else {
      int8x8_t prime = (int8x8_t)v19;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    }
    unint64_t v9 = *((void *)v8 + 1);
    if (*(void *)&prime > v9) {
      goto LABEL_30;
    }
    if (*(void *)&prime < v9)
    {
      unint64_t v28 = vcvtps_u32_f32((float)*((unint64_t *)v8 + 3) / *((float *)v8 + 8));
      if (v9 < 3 || (uint8x8_t v29 = (uint8x8_t)vcnt_s8((int8x8_t)v9), v29.i16[0] = vaddlv_u8(v29), v29.u32[0] > 1uLL))
      {
        unint64_t v28 = std::__next_prime(v28);
      }
      else
      {
        uint64_t v30 = 1 << -(char)__clz(v28 - 1);
        if (v28 >= 2) {
          unint64_t v28 = v30;
        }
      }
      if (*(void *)&prime <= v28) {
        int8x8_t prime = (int8x8_t)v28;
      }
      if (*(void *)&prime >= v9)
      {
        unint64_t v9 = *((void *)v8 + 1);
      }
      else
      {
        if (prime)
        {
LABEL_30:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          v22 = operator new(8 * *(void *)&prime);
          v23 = *(void **)v8;
          *(void *)objc_super v8 = v22;
          if (v23) {
            operator delete(v23);
          }
          uint64_t v24 = 0;
          *((int8x8_t *)v8 + 1) = prime;
          do
            *(void *)(*(void *)v8 + 8 * v24++) = 0;
          while (*(void *)&prime != v24);
          v25 = (void *)*v15;
          if (*v15)
          {
            unint64_t v26 = v25[1];
            uint8x8_t v27 = (uint8x8_t)vcnt_s8(prime);
            v27.i16[0] = vaddlv_u8(v27);
            if (v27.u32[0] > 1uLL)
            {
              if (v26 >= *(void *)&prime) {
                v26 %= *(void *)&prime;
              }
            }
            else
            {
              v26 &= *(void *)&prime - 1;
            }
            *(void *)(*(void *)v8 + 8 * v26) = v15;
            v31 = (void *)*v25;
            if (*v25)
            {
              do
              {
                unint64_t v32 = v31[1];
                if (v27.u32[0] > 1uLL)
                {
                  if (v32 >= *(void *)&prime) {
                    v32 %= *(void *)&prime;
                  }
                }
                else
                {
                  v32 &= *(void *)&prime - 1;
                }
                if (v32 != v26)
                {
                  if (!*(void *)(*(void *)v8 + 8 * v32))
                  {
                    *(void *)(*(void *)v8 + 8 * v32) = v25;
                    goto LABEL_55;
                  }
                  void *v25 = *v31;
                  void *v31 = **(void **)(*(void *)v8 + 8 * v32);
                  **(void **)(*(void *)v8 + 8 * v32) = v31;
                  v31 = v25;
                }
                unint64_t v32 = v26;
LABEL_55:
                v25 = v31;
                v31 = (void *)*v31;
                unint64_t v26 = v32;
              }
              while (v31);
            }
          }
          unint64_t v9 = (unint64_t)prime;
          goto LABEL_59;
        }
        v37 = *(void **)v8;
        *(void *)objc_super v8 = 0;
        if (v37) {
          operator delete(v37);
        }
        unint64_t v9 = 0;
        *((void *)v8 + 1) = 0;
      }
    }
LABEL_59:
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v9 <= v7) {
        unint64_t v3 = v7 % v9;
      }
      else {
        unint64_t v3 = v7;
      }
    }
    else
    {
      unint64_t v3 = (v9 - 1) & v7;
    }
  }
  uint64_t v33 = *(void *)v8;
  v34 = *(void **)(*(void *)v8 + 8 * v3);
  if (v34)
  {
    void *v14 = *v34;
LABEL_72:
    void *v34 = v14;
    goto LABEL_73;
  }
  void *v14 = *v15;
  *unint64_t v15 = v14;
  *(void *)(v33 + 8 * v3) = v15;
  if (*v14)
  {
    unint64_t v35 = *(void *)(*v14 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v35 >= v9) {
        v35 %= v9;
      }
    }
    else
    {
      v35 &= v9 - 1;
    }
    v34 = (void *)(*(void *)v8 + 8 * v35);
    goto LABEL_72;
  }
LABEL_73:
  ++*((void *)v8 + 3);
LABEL_74:

  return v7;
}

- (void)initAUHALOutputUnit
{
  *((unsigned char *)self + 696) = 0;
  *((unsigned char *)self + 697) = 1;
  *((unsigned char *)self + 698) = 0;
  *((_DWORD *)self + 175) = 2000;
}

- (void)dealloc
{
  unint64_t v3 = (void *)*((void *)self + 86);
  *((void *)self + 86) = 0;

  unint64_t v4 = (void *)*((void *)self + 85);
  *((void *)self + 85) = 0;

  if (*((void *)self + 91))
  {
    std::__hash_table<std::__hash_value_type<long,void({block_pointer} {__strong})(unsigned int,AudioTimeStamp const*,unsigned int,long)>,std::__unordered_map_hasher<long,std::__hash_value_type<long,void({block_pointer} {__strong})(unsigned int,AudioTimeStamp const*,unsigned int,long)>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,void({block_pointer} {__strong})(unsigned int,AudioTimeStamp const*,unsigned int,long)>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,void({block_pointer} {__strong})(unsigned int,AudioTimeStamp const*,unsigned int,long)>>>::__deallocate_node(*((id **)self + 90));
    *((void *)self + 90) = 0;
    uint64_t v5 = *((void *)self + 89);
    if (v5)
    {
      for (uint64_t i = 0; i != v5; ++i)
        *(void *)(*((void *)self + 88) + 8 * i) = 0;
    }
    *((void *)self + 91) = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)AUHALOutputUnit;
  [(AUAudioUnitV2Bridge *)&v7 dealloc];
}

- (AUHALOutputUnit)initWithAudioUnit:(OpaqueAudioComponentInstance *)a3 description:(AudioComponentDescription *)a4
{
  AudioComponentDescription v8 = *a4;
  v7.receiver = self;
  v7.super_class = (Class)AUHALOutputUnit;
  unint64_t v4 = [(AUAudioUnitV2Bridge *)&v7 initWithAudioUnit:a3 description:&v8];
  uint64_t v5 = v4;
  if (v4) {
    [(AUHALOutputUnit *)v4 initAUHALOutputUnit];
  }
  return v5;
}

- (AUHALOutputUnit)initWithComponentDescription:(AudioComponentDescription *)a3 options:(unsigned int)a4 error:(id *)a5
{
  AudioComponentDescription v9 = *a3;
  v8.receiver = self;
  v8.super_class = (Class)AUHALOutputUnit;
  uint64_t v5 = [(AUAudioUnitV2Bridge *)&v8 initWithComponentDescription:&v9 options:*(void *)&a4 error:a5];
  unint64_t v6 = v5;
  if (v5) {
    [(AUHALOutputUnit *)v5 initAUHALOutputUnit];
  }
  return v6;
}

@end