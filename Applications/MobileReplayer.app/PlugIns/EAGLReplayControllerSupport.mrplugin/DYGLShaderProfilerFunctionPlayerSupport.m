@interface DYGLShaderProfilerFunctionPlayerSupport
- (BOOL)_getFramebufferWidth:(int *)a3 height:(int *)a4 numSamples:(int *)a5;
- (BOOL)_uscSamplingEnded;
- (BOOL)shouldCallSuper;
- (BOOL)shouldExecuteGraphicsFunction;
- (BOOL)shouldPerformPlaybackLoopIteration:(unsigned int)a3;
- (BOOL)shouldReturn;
- (DYEAGLDebugFunctionPlayer)strongFunctionPlayer;
- (DYEAGLDebugPlaybackEngine)strongPlaybackEngine;
- (DYGLShaderProfilerFunctionPlayerSupport)initWithDebugEAGLPlaybackEngine:(id)a3 payLoad:(id)a4;
- (id).cxx_construct;
- (id)_queryShaderResult;
- (id)_valueFromKey:(id)a3;
- (id)queryShaderStart;
- (void)_backupAndSetupStates;
- (void)_endUSCSampling;
- (void)_harvestShaderBinaries;
- (void)_replaceColorAttachment;
- (void)_restoreColorAttachment;
- (void)_restoreStates;
- (void)_saveColorAttachmentFramebuffer:(unsigned int)a3;
- (void)_shouldEndUSCSampling;
- (void)_startUSCSampling;
- (void)dealloc;
- (void)executePlatformFunction;
- (void)performPlaybackLoopIterationPostCaptureActions:(unsigned int)a3;
- (void)performPlaybackLoopIterationPreCaptureActions:(unsigned int)a3;
- (void)performPostGraphicsFunctionDispatchActions:(BOOL)a3;
- (void)setShouldCallSuper:(BOOL)a3;
- (void)setShouldReturn:(BOOL)a3;
@end

@implementation DYGLShaderProfilerFunctionPlayerSupport

- (DYEAGLDebugFunctionPlayer)strongFunctionPlayer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_functionPlayer);

  return (DYEAGLDebugFunctionPlayer *)WeakRetained;
}

- (DYEAGLDebugPlaybackEngine)strongPlaybackEngine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);

  return (DYEAGLDebugPlaybackEngine *)WeakRetained;
}

- (DYGLShaderProfilerFunctionPlayerSupport)initWithDebugEAGLPlaybackEngine:(id)a3 payLoad:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)DYGLShaderProfilerFunctionPlayerSupport;
  v8 = [(DYGLShaderProfilerFunctionPlayerSupport *)&v23 init];
  v9 = v8;
  v10 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_playbackEngine, v6);
    v11 = [v6 player];
    objc_storeWeak((id *)&v9->_functionPlayer, v11);

    p_payLoad = (id *)&v9->_payLoad;
    objc_storeStrong((id *)&v9->_payLoad, a4);
    uint64_t v13 = [(NSDictionary *)v10->_payLoad objectForKeyedSubscript:@"function flag"];
    functionFlag = v10->_functionFlag;
    v10->_functionFlag = (NSArray *)v13;

    if ([(NSArray *)v10->_functionFlag count])
    {
      v15 = [*p_payLoad objectForKeyedSubscript:@"harvest draw call footprint"];
      v10->_harvestDrawCallFootprint = [v15 BOOLValue];

      v16 = [(NSDictionary *)v10->_payLoad objectForKeyedSubscript:@"usc sampling period"];
      v10->_uscSampling_Period = [v16 unsignedIntValue];

      if (v10->_uscSampling_Period)
      {
        v17 = [*p_payLoad objectForKeyedSubscript:@"draw call num"];
        unsigned int v18 = [v17 unsignedIntValue];

        v10->_uscSampling_SampleBufferSize = 0x2000000;
        unsigned int v19 = 60 * v18 * v10->_uscSampling_Period;
        if (v19 <= 0x6666) {
          unint64_t v20 = 26214;
        }
        else {
          unint64_t v20 = v19;
        }
        v10->_uscSampling_AddressBufferSize = 40 * v20;
        if (vm_allocate(mach_task_self_, (vm_address_t *)&v9->_uscSampling_SampleBuffer, 0x2000000uLL, 1)) {
          goto LABEL_8;
        }
        sub_11E60((uint64_t)&v9->_uscSampling_AddressBuffer, v20);
        memset(v10->_uscSampling_SampleBuffer, 255, v10->_uscSampling_SampleBufferSize);
        memset(v10->_uscSampling_AddressBuffer.__begin_, 255, v10->_uscSampling_AddressBufferSize);
      }
      CFDictionaryRef v21 = IOServiceMatching("IOAcceleratorES");
      dword_2EC74 = IOServiceGetMatchingService(kIOMasterPortDefault, v21);
      v9 = v10;
      goto LABEL_11;
    }
LABEL_8:
    v9 = 0;
  }
LABEL_11:

  return v9;
}

- (void)dealloc
{
  v3 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongPlaybackEngine];
  [v3 setDelegate:0];

  payLoad = self->_payLoad;
  self->_payLoad = 0;

  uscSampling_SampleBuffer = self->_uscSampling_SampleBuffer;
  if (uscSampling_SampleBuffer) {
    vm_deallocate(mach_task_self_, (vm_address_t)uscSampling_SampleBuffer, self->_uscSampling_SampleBufferSize);
  }
  frameTiming_PerformanceStatisticsArray = self->_frameTiming_PerformanceStatisticsArray;
  self->_frameTiming_PerformanceStatisticsArray = 0;

  if (dword_2EC74)
  {
    IOObjectRelease(dword_2EC74);
    dword_2EC74 = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)DYGLShaderProfilerFunctionPlayerSupport;
  [(DYGLShaderProfilerFunctionPlayerSupport *)&v7 dealloc];
}

- (id)queryShaderStart
{
  v3 = +[DYFuture future];
  self->_queryShaderState = 1;
  v4 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongPlaybackEngine];
  [v4 setDelegate:self];

  v5 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongPlaybackEngine];
  id v6 = [v5 loopCount];

  objc_super v7 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongPlaybackEngine];
  [v7 setLoopCount:0xFFFFFFFFLL];

  v8 = +[NSString stringWithUTF8String:object_getClassName(self)];
  id v9 = +[NSString stringWithFormat:@"gputools.%@.%p", v8, self];
  dispatch_queue_t v10 = dispatch_queue_create((const char *)[v9 UTF8String], 0);

  v11 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongPlaybackEngine];
  v12 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongPlaybackEngine];
  uint64_t v13 = [v11 playbackToFunction:[v12 targetFunctionIndex]];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_121F8;
  v19[3] = &unk_287B0;
  v19[4] = self;
  id v14 = v3;
  id v20 = v14;
  [v13 notifyOnQueue:v10 handler:v19];
  v15 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongPlaybackEngine];
  [v15 setLoopCount:v6];

  v16 = v20;
  id v17 = v14;

  return v17;
}

- (id)_valueFromKey:(id)a3
{
  v3 = (__CFString *)a3;
  if (dword_2EC74
    && (CFProperty = (void *)IORegistryEntryCreateCFProperty(dword_2EC74, v3, kCFAllocatorDefault, 0)) != 0)
  {
    v5 = +[NSString stringWithString:CFProperty];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_queryShaderResult
{
  id v22 = +[NSMutableDictionary dictionary];
  id v25 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_drawCallInfo, "count")];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obj = self->_drawCallInfo;
  id v2 = [(NSMutableArray *)obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v27;
    do
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(void *)v27 != v3) {
          objc_enumerationMutation(obj);
        }
        v5 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v6 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v5 footprint]);
        objc_super v7 = [v5 vertexShaderKey];
        v8 = [v5 fragmentShaderKey];
        id v9 = +[NSDictionary dictionaryWithObjectsAndKeys:v6, @"footprint", v7, @"vertex shader key", v8, @"fragment shader key", 0];
        [v25 addObject:v9];
      }
      id v2 = [(NSMutableArray *)obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v2);
  }

  [v22 setObject:v25 forKey:@"draw call info"];
  dispatch_queue_t v10 = self;
  [v22 setObject:self->_vertexShaderInfo forKey:@"vertex shader info"];
  [v22 setObject:self->_fragmentShaderInfo forKey:@"fragment shader info"];
  uscSampling_SampleBuffer = self->_uscSampling_SampleBuffer;
  if (uscSampling_SampleBuffer)
  {
    v12 = +[NSData dataWithBytes:uscSampling_SampleBuffer length:self->_uscSampling_SampleBufferSize];
    [v22 setObject:v12 forKey:@"usc sampling sample data"];

    uint64_t v13 = +[NSData dataWithBytes:self->_uscSampling_AddressBuffer.__begin_ length:self->_uscSampling_AddressBufferSize];
    [v22 setObject:v13 forKey:@"usc sampling address data"];

    dispatch_queue_t v10 = self;
  }
  if (v10->_frameTiming_FrameTimeStatistics.__ptr_.__value_)
  {
    id v14 = [objc_alloc((Class)NSMutableArray) initWithCapacity:*((unsigned int *)v10->_frameTiming_FrameTimeStatistics.__ptr_.__value_ + 56)];
    value = v10->_frameTiming_FrameTimeStatistics.__ptr_.__value_;
    if (value[56])
    {
      int v16 = 0;
      unsigned int v17 = 0;
      do
      {
        unsigned int v18 = +[NSNumber numberWithUnsignedLongLong:*(void *)(*(void *)value + 8 * ((v16 + value[57] + value[6]) % value[6]))];
        [v14 addObject:v18];

        ++v17;
        value = self->_frameTiming_FrameTimeStatistics.__ptr_.__value_;
        --v16;
      }
      while (v17 < value[56]);
    }
    [v22 setObject:v14 forKey:@"frametime"];

    dispatch_queue_t v10 = self;
  }
  frameTiming_PerformanceStatisticsArray = v10->_frameTiming_PerformanceStatisticsArray;
  if (frameTiming_PerformanceStatisticsArray) {
    [v22 setObject:frameTiming_PerformanceStatisticsArray forKey:@"performance statistics"];
  }
  id v20 = [(DYGLShaderProfilerFunctionPlayerSupport *)v10 _valueFromKey:@"MetalPluginName"];
  if (v20) {
    [v22 setObject:v20 forKeyedSubscript:@"MetalPluginName"];
  }

  return v22;
}

- (BOOL)shouldExecuteGraphicsFunction
{
  [(DYGLShaderProfilerFunctionPlayerSupport *)self setShouldReturn:1];
  [(DYGLShaderProfilerFunctionPlayerSupport *)self setShouldCallSuper:0];
  uint64_t v3 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
  v4 = (unint64_t *)[v3 function];

  v5 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
  id v6 = (void (**)(id, uint64_t, unint64_t *))[v5 gliDispatch];

  objc_super v7 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
  id v8 = [v7 gliContext];

  if (self->_queryShaderState == 4) {
    [(DYGLShaderProfilerFunctionPlayerSupport *)self _restoreColorAttachment];
  }
  int v9 = *(_DWORD *)v4;
  if (*(int *)v4 > 822)
  {
    unsigned int v10 = v9 - 823;
    if (v10 > 0x1F) {
      goto LABEL_13;
    }
    int v11 = 1 << v10;
    if ((v11 & 0xF0004000) == 0 && (v11 & 3) == 0) {
      goto LABEL_13;
    }
LABEL_12:
    LODWORD(v63) = 0;
    v6[104](v8, 36006, &v63);
    int v12 = v63;
    v64 = v4 + 2;
    *((_DWORD *)sub_15F34((uint64_t)&self->_lastUpdatedFramebuffer, v4 + 2, (uint64_t)&unk_27801, &v64) + 6) = v12;
    goto LABEL_13;
  }
  if ((v9 - 139) <= 7 && ((1 << (v9 + 117)) & 0x91) != 0 || v9 == 28 || v9 == 36) {
    goto LABEL_12;
  }
LABEL_13:
  uint64_t v13 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
  if (![v13 mainExecutionMode] || self->_queryShaderState != 3)
  {

    goto LABEL_21;
  }
  id v14 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
  unsigned int v15 = [v14 currentExecutionModeFunctionIndex];
  unint64_t v16 = [(NSArray *)self->_functionFlag count];

  if (v16 <= v15) {
    goto LABEL_21;
  }
  functionFlag = self->_functionFlag;
  unsigned int v18 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
  unsigned int v19 = -[NSArray objectAtIndexedSubscript:](functionFlag, "objectAtIndexedSubscript:", [v18 currentExecutionModeFunctionIndex]);
  id v20 = [v19 objectForKeyedSubscript:@"flag"];
  unsigned __int8 v21 = [v20 unsignedIntValue];

  if ((v21 & 1) == 0)
  {
    if ((v21 & 4) == 0) {
      goto LABEL_18;
    }
LABEL_41:
    [(DYGLShaderProfilerFunctionPlayerSupport *)self _replaceColorAttachment];
    if ((v21 & 2) == 0) {
      goto LABEL_21;
    }
    goto LABEL_42;
  }
  v64 = v4 + 2;
  [(DYGLShaderProfilerFunctionPlayerSupport *)self _saveColorAttachmentFramebuffer:*((unsigned int *)sub_15F34((uint64_t)&self->_lastUpdatedFramebuffer, v4 + 2, (uint64_t)&unk_27801, &v64) + 6)];
  if ((v21 & 4) != 0) {
    goto LABEL_41;
  }
LABEL_18:
  if ((v21 & 2) == 0) {
    goto LABEL_21;
  }
LABEL_42:
  ((void (*)(id, uint64_t))v6[10])(v8, 0x4000);
LABEL_21:
  id v22 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
  unsigned __int8 v23 = [v22 isFunctionEnabled];

  if ((v23 & 1) == 0) {
    return 0;
  }
  v24 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
  unsigned __int8 v25 = [v24 mainExecutionMode];

  if ((v25 & 1) == 0) {
    goto LABEL_38;
  }
  long long v26 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
  unsigned int v27 = [v26 currentExecutionModeFunctionIndex];
  unint64_t v28 = [(NSArray *)self->_functionFlag count];

  if (v28 <= v27)
  {
LABEL_29:
    int v31 = *(_DWORD *)v4;
    if (*(int *)v4 <= 822)
    {
      if (((v31 - 139) > 7 || ((1 << (v31 + 117)) & 0x91) == 0) && v31 != 382 && v31 != 384) {
        goto LABEL_38;
      }
    }
    else
    {
      unsigned int v32 = v31 - 823;
      if (v32 > 0x16 || ((1 << v32) & 0x780003) == 0) {
        goto LABEL_38;
      }
    }
    v33 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
    unsigned int v34 = [v33 currentExecutionModeFunctionIndex];
    v35 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongPlaybackEngine];
    unsigned int v36 = [v35 targetFunctionIndex];

    if (v34 < v36) {
      goto LABEL_38;
    }
    return 0;
  }
  BOOL result = 1;
  switch(self->_queryShaderState)
  {
    case 2:
      if (((*(_DWORD *)v4 - 139) > 7 || ((1 << (*(unsigned char *)v4 + 117)) & 0x91) == 0)
        && (*(_DWORD *)v4 - 823) >= 2)
      {
        return result;
      }
      v30 = objc_opt_new();
      [(NSMutableArray *)self->_drawCallInfo addObject:v30];
      self->_drawCallIndex = [(NSMutableArray *)self->_drawCallInfo count];

      return 1;
    case 3:
      BOOL result = 0;
      int v37 = *(_DWORD *)v4;
      if (*(int *)v4 <= 133)
      {
        uint64_t v40 = (v37 - 24);
        if (v40 > 0x36) {
          goto LABEL_38;
        }
        if (((1 << v40) & 0x4000000000401FLL) != 0) {
          return result;
        }
        if (v40 != 12) {
          goto LABEL_38;
        }
        int v41 = *(_DWORD *)v4[9];
        if (v41 != 0x4000) {
          ((void (*)(id, void))v6[10])(v8, v41 & 0xFFFFBFFF);
        }
        return 0;
      }
      if (v37 <= 836)
      {
        if ((v37 - 134) <= 0x11)
        {
          int v38 = 1 << (v37 + 122);
          if ((v38 & 0x1220) != 0)
          {
LABEL_74:
            v44 = self->_functionFlag;
            v45 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
            v46 = -[NSArray objectAtIndexedSubscript:](v44, "objectAtIndexedSubscript:", [v45 currentExecutionModeFunctionIndex]);
            v47 = [v46 objectForKeyedSubscript:@"flag"];
            unsigned __int8 v48 = [v47 unsignedIntValue];

            unint64_t v63 = v4[2];
            if ((v48 & 0x30) != 0)
            {
              if (!sub_8CB4(&self->_drawCallIndexMap.__table_.__bucket_list_.__ptr_.__value_, &v63))
              {
                v64 = &v63;
                v49 = sub_16158((uint64_t)&self->_drawCallIndexMap, &v63, (uint64_t)&unk_27801, (uint64_t **)&v64);
                v51 = v49 + 3;
                v50 = (void *)v49[3];
                if (v50)
                {
                  v49[4] = v50;
                  operator delete(v50);
                  void *v51 = 0;
                  v51[1] = 0;
                  v51[2] = 0;
                }
                void *v51 = 0;
                v51[1] = 0;
                v51[2] = 0;
              }
              v64 = &v63;
              v52 = (void **)sub_16158((uint64_t)&self->_drawCallIndexMap, &v63, (uint64_t)&unk_27801, (uint64_t **)&v64);
              v53 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
              LODWORD(v64) = [v53 currentExecutionModeFunctionIndex];
              sub_13130(v52 + 3, &v64, &self->_drawCallIndex);
            }
            ++self->_drawCallIndex;
            if ((v48 & 0x10) != 0)
            {
              ((void (*)(id, uint64_t, void, uint64_t, void))v6[336])(v8, 32769, 0, 32771, 0);
              ((void (*)(id, float, float, float, float))v6[337])(v8, (float)self->_drawCallIndex / 255.0, (float)BYTE1(self->_drawCallIndex) / 255.0, (float)BYTE2(self->_drawCallIndex) / 255.0, (float)HIBYTE(self->_drawCallIndex) / 255.0);
            }
            else if ((v48 & 0x20) != 0)
            {
              v54 = self->_functionFlag;
              v55 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
              v56 = -[NSArray objectAtIndexedSubscript:](v54, "objectAtIndexedSubscript:", [v55 currentExecutionModeFunctionIndex]);
              v57 = [v56 objectForKeyedSubscript:@"parameters"];

              ((void (*)(id, uint64_t, uint64_t, uint64_t, uint64_t))v6[336])(v8, 32769, 1, 32771, 1);
              v58 = [v57 objectForKeyedSubscript:@"blending draw call scale"];

              if (v58)
              {
                v59 = [v57 objectForKeyedSubscript:@"blending draw call scale"];
                unsigned __int8 v60 = [v59 unsignedIntValue];

                ((void (*)(id, float, float, float, float))v6[337])(v8, 0.0039216, 1.0 / (float)((float)(1 << v60) * 255.0), 1.0 / (float)((float)(1 << (2 * v60)) * 255.0), 1.0 / (float)((float)(1 << (3 * v60)) * 255.0));
              }
              else
              {
                v61 = [v57 objectForKeyedSubscript:@"blending draw call bit start"];
                uint64_t v62 = [v61 unsignedIntValue];

                ((void (*)(id, float, float, float, float))v6[337])(v8, (float)(1 << v62) / 255.0, (float)((unsigned __int16)(1 << v62) >> 8) / 255.0, (float)((1 << v62) >> 16) / 255.0, (float)((1 << v62) >> 24) / 255.0);
              }
            }
            else
            {
              ((void (*)(id, void, void, void, void))v6[336])(v8, 0, 0, 0, 0);
            }
            return 1;
          }
          if ((v38 & 0x20001) != 0)
          {
            BOOL result = 0;
            int v39 = *(_DWORD *)v4[9];
            if (v39 == 3024 || v39 == 3042) {
              return result;
            }
            goto LABEL_38;
          }
        }
        if ((v37 - 823) >= 2) {
          goto LABEL_38;
        }
        goto LABEL_74;
      }
      if ((v37 - 851) < 4)
      {
        int v42 = *(_DWORD *)v4[9];
        return v42 == 34041 || (v42 - 6145) < 2;
      }
      if (v37 == 837) {
        return result;
      }
LABEL_38:
      [(DYGLShaderProfilerFunctionPlayerSupport *)self setShouldReturn:0];
      return 1;
    case 5:
      if (((*(_DWORD *)v4 - 139) > 7 || ((1 << (*(unsigned char *)v4 + 117)) & 0x91) == 0)
        && (*(_DWORD *)v4 - 823) >= 2)
      {
        return result;
      }
      if (!self->_uscSampling_Enabled)
      {
        [(DYGLShaderProfilerFunctionPlayerSupport *)self _startUSCSampling];
        return 1;
      }
      if (self->_shouldStopUSCSampling && !self->_uscSamplingEnded)
      {
        [(DYGLShaderProfilerFunctionPlayerSupport *)self _endUSCSampling];
        return 1;
      }
      return result;
    case 6:
      return result;
    default:
      goto LABEL_29;
  }
}

- (void)performPostGraphicsFunctionDispatchActions:(BOOL)a3
{
  id v16 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
  v4 = (int *)[v16 function];

  [(DYGLShaderProfilerFunctionPlayerSupport *)self setShouldReturn:1];
  [(DYGLShaderProfilerFunctionPlayerSupport *)self setShouldCallSuper:0];
  int v5 = *v4;
  if (*v4 <= 381)
  {
    BOOL v8 = (v5 - 139) <= 7 && ((1 << (v5 + 117)) & 0x91) != 0 || v5 == 28;
    if (!v8 && v5 != 36) {
      return;
    }
  }
  else
  {
    BOOL v6 = (v5 - 823) > 0x1F || ((1 << (v5 - 55)) & 0xF0784003) == 0;
    if (v6 && v5 != 382 && v5 != 384) {
      return;
    }
  }
  if (self->_queryShaderState == 2)
  {
    id v17 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
    if ([v17 mainExecutionMode])
    {
      int v9 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
      unsigned int v10 = [v9 currentExecutionModeFunctionIndex];
      unint64_t v11 = [(NSArray *)self->_functionFlag count];

      if (v11 > v10)
      {
        functionFlag = self->_functionFlag;
        id v18 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
        uint64_t v13 = -[NSArray objectAtIndexedSubscript:](functionFlag, "objectAtIndexedSubscript:", [v18 currentExecutionModeFunctionIndex]);
        id v14 = [v13 objectForKeyedSubscript:@"flag"];
        unsigned __int8 v15 = [v14 unsignedIntValue];

        if ((v15 & 8) != 0)
        {
          [(DYGLShaderProfilerFunctionPlayerSupport *)self _harvestShaderBinaries];
        }
      }
    }
    else
    {
    }
  }
}

- (void)executePlatformFunction
{
  uint64_t v3 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
  v4 = (unint64_t *)[v3 function];

  int v5 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
  BOOL v6 = (void (**)(id, uint64_t))[v5 gliDispatch];

  objc_super v7 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
  id v8 = [v7 gliContext];

  int v9 = *(_DWORD *)v4;
  [(DYGLShaderProfilerFunctionPlayerSupport *)self setShouldReturn:0];
  [(DYGLShaderProfilerFunctionPlayerSupport *)self setShouldCallSuper:0];
  if (self->_queryShaderState == 3)
  {
    unsigned int v10 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
    if ([v10 mainExecutionMode])
    {
      unint64_t v11 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
      unsigned int v12 = [v11 currentExecutionModeFunctionIndex];
      unint64_t v13 = [(NSArray *)self->_functionFlag count];

      if (v13 > v12)
      {
        functionFlag = self->_functionFlag;
        unsigned __int8 v15 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
        id v16 = -[NSArray objectAtIndexedSubscript:](functionFlag, "objectAtIndexedSubscript:", [v15 currentExecutionModeFunctionIndex]);
        id v17 = [v16 objectForKeyedSubscript:@"flag"];
        unsigned __int8 v18 = [v17 unsignedIntValue];

        if (v18)
        {
          long long v26 = v4 + 2;
          [(DYGLShaderProfilerFunctionPlayerSupport *)self _saveColorAttachmentFramebuffer:*((unsigned int *)sub_15F34((uint64_t)&self->_lastUpdatedFramebuffer, v4 + 2, (uint64_t)&unk_27801, &v26) + 6)];
          if ((v18 & 4) == 0)
          {
LABEL_6:
            if ((v18 & 2) == 0) {
              goto LABEL_22;
            }
            goto LABEL_21;
          }
        }
        else if ((v18 & 4) == 0)
        {
          goto LABEL_6;
        }
        [(DYGLShaderProfilerFunctionPlayerSupport *)self _replaceColorAttachment];
        if ((v18 & 2) != 0)
        {
LABEL_21:
          v6[10](v8, 0x4000);
          goto LABEL_22;
        }
        goto LABEL_22;
      }
    }
    else
    {
    }
  }
  if ((self->_queryShaderState - 5) > 1) {
    goto LABEL_22;
  }
  unsigned int v19 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
  if (([v19 mainExecutionMode] & 1) == 0)
  {

    goto LABEL_22;
  }
  id v20 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
  unsigned int v21 = [v20 currentExecutionModeFunctionIndex];
  unint64_t v22 = [(NSArray *)self->_functionFlag count];

  if (v22 <= v21 || (v9 + 8190) > 0xC || ((1 << (v9 - 2)) & 0x1801) == 0)
  {
LABEL_22:
    unsigned __int8 v23 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
    unsigned int v24 = [v23 isFunctionEnabled];
    if (v9 == -8188) {
      unsigned int v25 = v24;
    }
    else {
      unsigned int v25 = 0;
    }

    if (v25 == 1)
    {
      long long v26 = v4 + 2;
      *((_DWORD *)sub_15F34((uint64_t)&self->_lastUpdatedFramebuffer, v4 + 2, (uint64_t)&unk_27801, &v26) + 6) = 0;
    }
    return;
  }
  if (self->_queryShaderState == 6)
  {
    [(DYGLShaderProfilerFunctionPlayerSupport *)self setShouldReturn:1];
    [(DYGLShaderProfilerFunctionPlayerSupport *)self setShouldCallSuper:1];
  }
  else
  {
    ((void (*)(id))v6[90])(v8);
    [(DYGLShaderProfilerFunctionPlayerSupport *)self setShouldReturn:1];
  }
}

- (BOOL)shouldPerformPlaybackLoopIteration:(unsigned int)a3
{
  return self->_queryShaderState != 0;
}

- (void)performPlaybackLoopIterationPreCaptureActions:(unsigned int)a3
{
  [(DYGLShaderProfilerFunctionPlayerSupport *)self setShouldReturn:1];
  [(DYGLShaderProfilerFunctionPlayerSupport *)self setShouldCallSuper:0];
  switch(self->_queryShaderState)
  {
    case 1:
      int v5 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongPlaybackEngine];
      self->_BOOL backup_enableWireframePresent = [v5 enableWireframePresent];

      BOOL v6 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongPlaybackEngine];
      [v6 setEnableWireframePresent:0];

      objc_super v7 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSArray count](self->_functionFlag, "count") >> 2];
      drawCallInfo = self->_drawCallInfo;
      self->_drawCallInfo = v7;

      int v9 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:-[NSArray count](self->_functionFlag, "count") >> 2];
      vertexShaderInfo = self->_vertexShaderInfo;
      self->_vertexShaderInfo = v9;

      unint64_t v11 = [(NSMutableDictionary *)objc_alloc((Class)NSMutableDictionary) initWithCapacity:-[NSArray count](self->_functionFlag, "count") >> 2];
      fragmentShaderInfo = self->_fragmentShaderInfo;
      self->_fragmentShaderInfo = v11;

      self->_drawCallIndex = 0;
      int v13 = 2;
      goto LABEL_22;
    case 2:
      if (!self->_harvestDrawCallFootprint) {
        goto LABEL_6;
      }
      [(DYGLShaderProfilerFunctionPlayerSupport *)self _backupAndSetupStates];
      self->_drawCallIndex = 0;
      sub_163E0((uint64_t)&self->_colorAttachmentMap);
      sub_1647C((uint64_t)&self->_drawCallIndexMap);
      int v13 = 3;
      goto LABEL_22;
    case 3:
      [(DYGLShaderProfilerFunctionPlayerSupport *)self _restoreStates];
LABEL_6:
      int v13 = 4;
      goto LABEL_22;
    case 4:
      self->_uscSampling_FrameIndexStart = a3;
      self->_uscSampling_TimeStart = mach_absolute_time();
      int v13 = 5;
      goto LABEL_22;
    case 5:
      if ([(DYGLShaderProfilerFunctionPlayerSupport *)self _uscSamplingEnded])
      {
        value = (uint64_t *)self->_frameTiming_FrameTimeStatistics.__ptr_.__value_;
        if (!value) {
          operator new();
        }
        sub_13B70(value);
        frameTiming_PerformanceStatisticsArray = self->_frameTiming_PerformanceStatisticsArray;
        if (frameTiming_PerformanceStatisticsArray)
        {
          [(NSMutableArray *)frameTiming_PerformanceStatisticsArray removeAllObjects];
        }
        else
        {
          id v20 = objc_alloc((Class)NSMutableArray);
          unsigned int v21 = (NSMutableArray *)[v20 initWithCapacity:kDYExperimentFrameTimeArraySizeDefault];
          unint64_t v22 = self->_frameTiming_PerformanceStatisticsArray;
          self->_frameTiming_PerformanceStatisticsArray = v21;
        }
        self->_frameTiming_FrameIndexStart = a3;
        uint64_t v23 = mach_absolute_time();
        self->_frameTiming_GlobalTimeStart = v23;
        self->_frameTiming_FrameTimeStart = v23;
        self->_frameTiming_Done = 0;
        int v27 = 0;
        unsigned int v24 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
        unsigned int v25 = [v24 context];
        [v25 setParameter:1414 to:&v27];

        int v13 = 6;
LABEL_22:
        self->_queryShaderState = v13;
      }
      else
      {
        [(DYGLShaderProfilerFunctionPlayerSupport *)self _shouldEndUSCSampling];
      }
      return;
    case 6:
      self->_frameTiming_FrameTimeStart = mach_absolute_time();
      if (!self->_frameTiming_Done) {
        return;
      }
      int v26 = 0;
      unsigned __int8 v15 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
      id v16 = [v15 context];
      [v16 setParameter:1414 to:&v26];

      BOOL backup_enableWireframePresent = self->_backup_enableWireframePresent;
      unsigned __int8 v18 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongPlaybackEngine];
      [v18 setEnableWireframePresent:backup_enableWireframePresent];

      int v13 = 7;
      goto LABEL_22;
    case 7:
      self->_queryShaderState = 0;
      return;
    default:
      return;
  }
}

- (void)_startUSCSampling
{
  if (self->_uscSampling_SampleBuffer)
  {
    uint64_t v3 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
    v4 = (void (*)(id))*((void *)[v3 gliDispatch] + 89);
    int v5 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
    v4([v5 gliContext]);

    unint64_t v6 = self->_uscSampling_AddressBufferSize / 0x28uLL;
    v13[0] = self->_uscSampling_AddressBuffer.__begin_;
    v13[1] = v6;
    uint64_t uscSampling_SampleBufferSize = self->_uscSampling_SampleBufferSize;
    v13[2] = self->_uscSampling_SampleBuffer;
    v13[3] = uscSampling_SampleBufferSize / 0xCuLL;
    v13[4] = uscSampling_SampleBufferSize;
    id v8 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
    int v9 = [v8 context];
    [v9 setParameter:1411 to:v13];

    int v12 = 0;
    unsigned int v10 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
    unint64_t v11 = [v10 context];
    [v11 setParameter:1412 to:&v12];

    self->_uscSampling_Enabled = 1;
  }
}

- (BOOL)_uscSamplingEnded
{
  return !self->_uscSampling_SampleBuffer || !self->_uscSampling_Enabled || self->_uscSamplingEnded;
}

- (void)_shouldEndUSCSampling
{
  uint64_t v3 = mach_absolute_time();
  self->_uscSampling_TimeEnd = v3;
  unint64_t v4 = v3 - self->_uscSampling_TimeStart;
  if (g_DYTimebaseInfo != *((_DWORD *)&g_DYTimebaseInfo + 1)) {
    unint64_t v4 = __udivti3();
  }
  if (v4 >= 1000000000 * (unint64_t)self->_uscSampling_Period) {
    self->_shouldStopUSCSampling = 1;
  }
}

- (void)_endUSCSampling
{
  int v11 = 0;
  uint64_t v3 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
  unint64_t v4 = [v3 context];
  [v4 setParameter:1413 to:&v11];

  int v5 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
  unint64_t v6 = (void (*)(id))*((void *)[v5 gliDispatch] + 89);
  objc_super v7 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
  v6([v7 gliContext]);

  id v8 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
  int v9 = [v8 context];
  [v9 setParameter:1411 to:&v10];

  self->_uscSamplingEnded = 1;
}

- (void)performPlaybackLoopIterationPostCaptureActions:(unsigned int)a3
{
  [(DYGLShaderProfilerFunctionPlayerSupport *)self setShouldReturn:1];
  [(DYGLShaderProfilerFunctionPlayerSupport *)self setShouldCallSuper:0];
  if (self->_queryShaderState == 6)
  {
    uint64_t v5 = mach_absolute_time();
    value = self->_frameTiming_FrameTimeStatistics.__ptr_.__value_;
    uint64_t v7 = v5 - self->_frameTiming_FrameTimeStart;
    if (g_DYTimebaseInfo != *((_DWORD *)&g_DYTimebaseInfo + 1)) {
      uint64_t v7 = __udivti3();
    }
    double v18 = *(double *)&v7;
    sub_14138((uint64_t)value, &v18);
    id v8 = [(NSMutableArray *)self->_frameTiming_PerformanceStatisticsArray count];
    if (v8 == (id)kDYExperimentFrameTimeArraySizeDefault) {
      [(NSMutableArray *)self->_frameTiming_PerformanceStatisticsArray removeObjectAtIndex:0];
    }
    if (dword_2EC74
      && (CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(dword_2EC74, @"PerformanceStatistics", kCFAllocatorDefault, 0)) != 0)
    {
      long long v10 = (void *)CFProperty;
      [(NSMutableArray *)self->_frameTiming_PerformanceStatisticsArray addObject:CFProperty];
    }
    else
    {
      frameTiming_PerformanceStatisticsArray = self->_frameTiming_PerformanceStatisticsArray;
      long long v10 = +[NSNull null];
      [(NSMutableArray *)frameTiming_PerformanceStatisticsArray addObject:v10];
    }

    int v12 = self->_frameTiming_FrameTimeStatistics.__ptr_.__value_;
    unsigned int v13 = v12[56];
    unsigned int v14 = v12[6];
    if (v13 >= v14)
    {
      if (a3 - self->_frameTiming_FrameIndexStart > 0x7F) {
        goto LABEL_16;
      }
      unint64_t v15 = v5 - self->_frameTiming_GlobalTimeStart;
      if (g_DYTimebaseInfo != *((_DWORD *)&g_DYTimebaseInfo + 1))
      {
        id v16 = self->_frameTiming_FrameTimeStatistics.__ptr_.__value_;
        unint64_t v15 = __udivti3();
        int v12 = v16;
      }
      if (v15 >= 0x3B9ACA01
        || (double)(unint64_t)(*(void *)(*((void *)v12 + 19) + 8 * ((v12[57] + v14) % v14))
                                    - *(void *)(*((void *)v12 + 13) + 8 * ((v12[57] + v14) % v14)))
         / (double)*(unint64_t *)(*((void *)v12 + 7) + 8 * ((v12[57] + v14) % v14)) < kDYExperimentFrameTimeVariationLimit1
        || v13 >= kDYExperimentFrameTimeVariationArraySizeDefault
        && (double v17 = 0.0,
            double v18 = 0.0,
            sub_143D8((uint64_t)v12, kDYExperimentFrameTimeVariationArraySizeDefault, &v18, &v17))
        && v17 < kDYExperimentFrameTimeVariationLimit2
        && v17 - v18 < kDYExperimentFrameTimeVariationRangeMax)
      {
LABEL_16:
        self->_frameTiming_Done = 1;
      }
    }
  }
}

- (void)_replaceColorAttachment
{
  uint64_t v3 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
  unint64_t v4 = (unint64_t *)[v3 function];

  uint64_t v5 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
  unint64_t v6 = (void (**)(id, uint64_t, char *))[v5 gliDispatch];

  uint64_t v7 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
  id v8 = [v7 gliContext];

  uint64_t v54 = 0;
  v6[104](v8, 36006, (char *)&v54 + 4);
  v6[104](v8, 36007, (char *)&v54);
  uint64_t v53 = 0;
  int v52 = 0;
  if (![(DYGLShaderProfilerFunctionPlayerSupport *)self _getFramebufferWidth:(char *)&v53 + 4 height:&v53 numSamples:&v52])self->_error = 1; {
  unsigned int v9 = kDYReservedGLNameFootprintRenderbuffer;
  }
  v6[666](v8, 36161, (char *)kDYReservedGLNameFootprintRenderbuffer);
  int v42 = v4;
  if (v52) {
    ((void (*)(id, uint64_t))v6[756])(v8, 36161);
  }
  else {
    ((void (*)(id, uint64_t, uint64_t, void, void))v6[669])(v8, 36161, 32856, HIDWORD(v53), v53);
  }
  long long v10 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
  int v11 = [v10 context];
  sub_7E98(v51, v11);

  int v12 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
  v49 = v51;
  id v50 = [v12 gliDispatch];

  unsigned int v13 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
  unsigned int v14 = [v13 captureSessionInfo];
  unint64_t v15 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
  id v16 = [v14 contextInfoForContext:[v15 ctxID]];
  [v16 api];

  int v48 = 1;
  int v41 = self;
  double v17 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
  unint64_t v18 = *((void *)[v17 currentContextInfo] + 13);

  if (v18 >= 3) {
    v6[104](v8, 36063, (char *)&v48);
  }
  __p[0] = 0;
  __p[1] = 0;
  v47 = 0;
  if (v48 >= 1)
  {
    for (int i = 0; i < v48; ++i)
    {
      GPUTools::GL::GetFramebufferAttachmentInfo();
      id v20 = (char *)__p[1];
      if (__p[1] >= v47)
      {
        uint64_t v23 = (char *)__p[0];
        int64_t v24 = ((char *)__p[1] - (char *)__p[0]) >> 5;
        unint64_t v25 = v24 + 1;
        if ((unint64_t)(v24 + 1) >> 59) {
          sub_5BBC();
        }
        uint64_t v26 = v47 - (char *)__p[0];
        if ((v47 - (char *)__p[0]) >> 4 > v25) {
          unint64_t v25 = v26 >> 4;
        }
        if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFE0) {
          unint64_t v27 = 0x7FFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v27 = v25;
        }
        if (v27)
        {
          unint64_t v28 = (char *)sub_169CC((uint64_t)&v47, v27);
          uint64_t v23 = (char *)__p[0];
          id v20 = (char *)__p[1];
        }
        else
        {
          unint64_t v28 = 0;
        }
        long long v29 = v44;
        v30 = &v28[32 * v24];
        *(_OWORD *)v30 = v43;
        *((_OWORD *)v30 + 1) = v29;
        if (v20 == v23)
        {
          v33 = &v28[32 * v24];
        }
        else
        {
          int v31 = &v28[32 * v24];
          do
          {
            long long v32 = *((_OWORD *)v20 - 1);
            v33 = v31 - 32;
            *((_OWORD *)v31 - 2) = *((_OWORD *)v20 - 2);
            *((_OWORD *)v31 - 1) = v32;
            v20 -= 32;
            v31 -= 32;
          }
          while (v20 != v23);
        }
        unint64_t v22 = v30 + 32;
        __p[0] = v33;
        __p[1] = v30 + 32;
        v47 = &v28[32 * v27];
        if (v23) {
          operator delete(v23);
        }
      }
      else
      {
        long long v21 = v44;
        *(_OWORD *)__p[1] = v43;
        *((_OWORD *)v20 + 1) = v21;
        unint64_t v22 = v20 + 32;
      }
      __p[1] = v22;
      if (i) {
        uint64_t v34 = 0;
      }
      else {
        uint64_t v34 = v9;
      }
      ((void (*)(id, uint64_t, void, uint64_t, uint64_t))v6[679])(v8, 36009, (i + 36064), 36161, v34);
    }
  }
  uint64_t p_colorAttachmentMap = (uint64_t)&v41->_colorAttachmentMap;
  unsigned int v36 = v42 + 2;
  if (!sub_8CB4(&v41->_colorAttachmentMap.__table_.__bucket_list_.__ptr_.__value_, v42 + 2))
  {
    long long v43 = 0u;
    long long v44 = 0u;
    int v45 = 1065353216;
    *(void *)v55 = v42 + 2;
    int v37 = sub_16A04(p_colorAttachmentMap, v36, (uint64_t)&unk_27801, (void **)v55);
    sub_16CCC((uint64_t)(v37 + 3), (uint64_t *)&v43);
    sub_7F0C((uint64_t)&v43);
  }
  *(void *)&long long v43 = v42 + 2;
  int v38 = sub_16A04(p_colorAttachmentMap, v36, (uint64_t)&unk_27801, (void **)&v43);
  v55[0] = HIDWORD(v54);
  *(void *)&long long v43 = v55;
  int v39 = sub_16D70((uint64_t)(v38 + 3), v55, (uint64_t)&unk_27801, (_DWORD **)&v43);
  uint64_t v40 = (void *)v39[3];
  if (v40)
  {
    v39[4] = v40;
    operator delete(v40);
    v39[3] = 0;
    v39[4] = 0;
    v39[5] = 0;
  }
  *(_OWORD *)(v39 + 3) = *(_OWORD *)__p;
  v39[5] = v47;
  __p[1] = 0;
  v47 = 0;
  __p[0] = 0;
  ((void (*)(id, double, double, double, double))v6[12])(v8, 0.0, 0.0, 0.0, 0.0);
  ((void (*)(id, uint64_t))v6[10])(v8, 0x4000);
  v6[666](v8, 36161, (char *)v54);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)_saveColorAttachmentFramebuffer:(unsigned int)a3
{
  if (a3)
  {
    uint64_t v3 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
    [v3 function];
    DYHarvestRenderbufferInfo();
  }
}

- (void)_harvestShaderBinaries
{
  uint64_t v3 = objc_opt_new();
  unint64_t v4 = objc_opt_new();
  uint64_t v5 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
  unint64_t v6 = *((void *)[v5 currentContextInfo] + 13);

  if (v6 >= 2)
  {
    long long v25 = 0u;
    *(_OWORD *)uint64_t v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    *(_OWORD *)__src = 0u;
    uint64_t v7 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
    id v8 = [v7 context];
    [v8 getParameter:1407 to:__src];

    if (__src[0])
    {
      if (*(_DWORD *)__src[0] == -17958193)
      {
        size_t v9 = LODWORD(__src[1]);
        if (LODWORD(__src[1]))
        {
          [v3 setLength:LODWORD(__src[1])];
          id v10 = [v3 mutableBytes];
          memcpy(v10, __src[0], v9);
        }
      }
    }
    if (v26[0])
    {
      if (*(_DWORD *)v26[0] == -17958193)
      {
        size_t v11 = LODWORD(v26[1]);
        if (LODWORD(v26[1]))
        {
          [v4 setLength:LODWORD(v26[1])];
          id v12 = [v4 mutableBytes];
          memcpy(v12, v26[0], v11);
        }
      }
    }
  }
  unsigned int v13 = +[NSString stringWithFormat:@"%u" dy_crc32:[v3 crc32]];
  unsigned int v14 = +[NSString stringWithFormat:@"%u" dy_crc32];
  unint64_t v15 = [(NSMutableArray *)self->_drawCallInfo objectAtIndexedSubscript:self->_drawCallIndex - 1];
  [v15 setVertexShaderKey:v13];
  [v15 setFragmentShaderKey:v14];
  id v16 = [(NSMutableDictionary *)self->_vertexShaderInfo objectForKey:v13];

  if (!v16)
  {
    vertexShaderInfo = self->_vertexShaderInfo;
    unint64_t v18 = +[NSDictionary dictionaryWithObjectsAndKeys:v3, @"binary", 0];
    [(NSMutableDictionary *)vertexShaderInfo setObject:v18 forKey:v13];
  }
  unsigned int v19 = [(NSMutableDictionary *)self->_fragmentShaderInfo objectForKey:v14];

  if (!v19)
  {
    fragmentShaderInfo = self->_fragmentShaderInfo;
    long long v21 = +[NSDictionary dictionaryWithObjectsAndKeys:v4, @"binary", 0];
    [(NSMutableDictionary *)fragmentShaderInfo setObject:v21 forKey:v14];
  }
}

- (BOOL)_getFramebufferWidth:(int *)a3 height:(int *)a4 numSamples:(int *)a5
{
  size_t v9 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
  id v10 = (void (**)(id, uint64_t, int *))[v9 gliDispatch];

  size_t v11 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
  id v12 = [v11 gliContext];

  v36[0] = 1;
  unsigned int v13 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
  unsigned int v14 = [v13 context];
  sub_7E98(v35, v14);

  unint64_t v15 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
  long long v32 = a3;
  [v15 gliDispatch];

  id v16 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
  double v17 = [v16 captureSessionInfo];
  unint64_t v18 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
  unsigned int v19 = [v17 contextInfoForContext:[v18 ctxID]];
  [v19 api];

  id v20 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
  unint64_t v21 = *((void *)[v20 currentContextInfo] + 13);

  if (v21 >= 3)
  {
    v10[104](v12, 36063, v36);
    if (v36[0] < -1) {
      goto LABEL_11;
    }
  }
  v30 = a4;
  int v31 = a5;
  int v23 = 0;
  char v24 = 0;
  *(void *)&long long v22 = 0x8000000080000000;
  long long v33 = v22;
  int v25 = 0x7FFFFFFF;
  do
  {
    int v26 = v23 + 36064;
    GPUTools::GL::GetFramebufferAttachmentInfo();
    if (v34)
    {
      GPUTools::GL::GetImageInfo();
      *((void *)&v27 + 1) = *((void *)&v33 + 1);
      *(int32x2_t *)&long long v27 = vmin_s32((int32x2_t)0x100000000, *(int32x2_t *)&v33);
      long long v33 = v27;
      if (v25 > 0) {
        int v25 = 0;
      }
      char v24 = 1;
    }
    int v23 = v26 - 36063;
  }
  while (v26 - 36064 <= v36[0]);
  if (v24)
  {
    *long long v32 = v33;
    int *v30 = DWORD1(v33);
    BOOL v28 = 1;
    *int v31 = v25;
  }
  else
  {
LABEL_11:
    BOOL v28 = 0;
  }

  return v28;
}

- (void)_backupAndSetupStates
{
  id v5 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
  uint64_t v3 = (void (**)(id, uint64_t, float *))[v5 gliDispatch];

  id v6 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
  id v4 = [v6 gliContext];

  v3[103](v4, 3106, self->_backup_color_clear_value);
  v3[99](v4, 3107, (float *)self->_backup_color_writemask);
  v3[104](v4, 3042, (float *)&self->_backup_blend);
  v3[103](v4, 32773, self->_backup_blend_color);
  v3[104](v4, 32970, (float *)&self->_backup_blend_dst_alpha);
  v3[104](v4, 32968, (float *)&self->_backup_blend_dst_rgb);
  v3[104](v4, 34877, (float *)&self->_backup_blend_equation_alpha);
  v3[104](v4, 32777, (float *)&self->_backup_blend_equation_rgb);
  v3[104](v4, 32971, (float *)&self->_backup_blend_src_alpha);
  v3[104](v4, 32969, (float *)&self->_backup_blend_src_rgb);
  v3[104](v4, 3024, (float *)&self->_backup_dither);
  ((void (*)(id, uint64_t))v3[72])(v4, 3042);
  v3[458](v4, 35445, (float *)((char *)&loc_8A74 + 1));
  ((void (*)(id, uint64_t))v3[63])(v4, 3024);
  ((void (*)(id, uint64_t, uint64_t, uint64_t, uint64_t))v3[49])(v4, 1, 1, 1, 1);
  ((void (*)(id, double, double, double, double))v3[12])(v4, 0.0, 0.0, 0.0, 0.0);
  id v7 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongPlaybackEngine];
  self->_BOOL backup_enableWireframePresent = [v7 enableWireframePresent];
}

- (void)_restoreStates
{
  id v8 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
  uint64_t v3 = (void (**)(id, float, float, float, float))[v8 gliDispatch];

  id v9 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
  id v4 = [v9 gliContext];

  v3[12](v4, self->_backup_color_clear_value[0], self->_backup_color_clear_value[1], self->_backup_color_clear_value[2], self->_backup_color_clear_value[3]);
  ((void (*)(id, void, void, void, void))v3[49])(v4, self->_backup_color_writemask[0], self->_backup_color_writemask[1], self->_backup_color_writemask[2], self->_backup_color_writemask[3]);
  if (self->_backup_blend) {
    uint64_t v5 = 72;
  }
  else {
    uint64_t v5 = 63;
  }
  ((void (*)(id, uint64_t))v3[v5])(v4, 3042);
  v3[337](v4, self->_backup_blend_color[0], self->_backup_blend_color[1], self->_backup_blend_color[2], self->_backup_blend_color[3]);
  ((void (*)(id, void, void, void, void))v3[336])(v4, self->_backup_blend_src_rgb, self->_backup_blend_dst_rgb, self->_backup_blend_src_alpha, self->_backup_blend_dst_alpha);
  ((void (*)(id, void, void))v3[458])(v4, self->_backup_blend_equation_rgb, self->_backup_blend_equation_alpha);
  if (self->_backup_dither) {
    uint64_t v6 = 72;
  }
  else {
    uint64_t v6 = 63;
  }
  ((void (*)(id, uint64_t))v3[v6])(v4, 3024);
  BOOL backup_enableWireframePresent = self->_backup_enableWireframePresent;
  id v10 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongPlaybackEngine];
  [v10 setEnableWireframePresent:backup_enableWireframePresent];
}

- (void)_restoreColorAttachment
{
  uint64_t v3 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
  id v4 = (unint64_t *)[v3 function];

  uint64_t v5 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
  uint64_t v6 = (void (**)(id, uint64_t, _DWORD *))[v5 gliDispatch];

  id v7 = [(DYGLShaderProfilerFunctionPlayerSupport *)self strongFunctionPlayer];
  id v8 = [v7 gliContext];

  uint64_t p_colorAttachmentMap = &self->_colorAttachmentMap;
  id v10 = sub_8CB4(&self->_colorAttachmentMap.__table_.__bucket_list_.__ptr_.__value_, v4 + 2);
  if (v10)
  {
    size_t v11 = v10;
    int v26 = p_colorAttachmentMap;
    unsigned int v27 = 0;
    v6[104](v8, 36006, &v27);
    int v25 = v11;
    id v12 = (uint64_t **)v11[5];
    if (v12)
    {
      while (1)
      {
        if (((unsigned int (*)(id, void))v6[671])(v8, *((unsigned int *)v12 + 4)))
        {
          v6[672](v8, 36009, (_DWORD *)*((unsigned int *)v12 + 4));
          unsigned int v13 = (unsigned int *)v12[3];
          unsigned int v14 = (unsigned int *)v12[4];
          if (v13 != v14) {
            break;
          }
        }
LABEL_23:
        id v12 = (uint64_t **)*v12;
        if (!v12) {
          goto LABEL_24;
        }
      }
      uint64_t v15 = 36064;
      while (1)
      {
        unsigned int v16 = v13[2];
        if (v16 != 5890)
        {
          if (v16 == 36161) {
            ((void (*)(id, uint64_t, uint64_t, uint64_t, void))v6[679])(v8, 36009, v15, 36161, v13[1]);
          }
          else {
            ((void (*)(id, uint64_t, uint64_t, uint64_t, void))v6[679])(v8, 36009, v15, 36161, 0);
          }
          goto LABEL_20;
        }
        unsigned int v17 = v13[3];
        if (v17 == 35866 || v17 == 32879)
        {
          unsigned int v19 = (void (*)(id, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v6[691];
          uint64_t v20 = v13[1];
          uint64_t v21 = v13[5];
          uint64_t v22 = v13[6];
        }
        else
        {
          unsigned int v19 = (void (*)(id, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v6[677];
          uint64_t v21 = v13[1];
          uint64_t v20 = v13[4];
          uint64_t v22 = v13[5];
          if (!v20)
          {
            id v23 = v8;
            uint64_t v24 = v15;
            uint64_t v20 = 3553;
            goto LABEL_19;
          }
        }
        id v23 = v8;
        uint64_t v24 = v15;
LABEL_19:
        v19(v23, 36009, v24, v20, v21, v22);
LABEL_20:
        v13 += 8;
        uint64_t v15 = (v15 + 1);
        if (v13 == v14) {
          goto LABEL_23;
        }
      }
    }
LABEL_24:
    v6[672](v8, 36009, (_DWORD *)v27);
    sub_9E20(v26, v25, (uint64_t)v28);
    sub_16C74((uint64_t)v28, 0);
  }
}

- (BOOL)shouldReturn
{
  return self->_shouldReturn;
}

- (void)setShouldReturn:(BOOL)a3
{
  self->_shouldReturn = a3;
}

- (BOOL)shouldCallSuper
{
  return self->_shouldCallSuper;
}

- (void)setShouldCallSuper:(BOOL)a3
{
  self->_shouldCallSuper = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameTiming_PerformanceStatisticsArray, 0);
  value = self->_frameTiming_FrameTimeStatistics.__ptr_.__value_;
  self->_frameTiming_FrameTimeStatistics.__ptr_.__value_ = 0;
  if (value) {
    sub_168F4((uint64_t)&self->_frameTiming_FrameTimeStatistics, (uint64_t)value);
  }
  begin = self->_uscSampling_AddressBuffer.__begin_;
  if (begin)
  {
    self->_uscSampling_AddressBuffer.__end_ = begin;
    operator delete(begin);
  }
  sub_7F0C((uint64_t)&self->_drawCallIndexMap);
  sub_1704C((uint64_t)&self->_colorAttachmentMap);
  objc_storeStrong((id *)&self->_fragmentShaderInfo, 0);
  objc_storeStrong((id *)&self->_vertexShaderInfo, 0);
  objc_storeStrong((id *)&self->_drawCallInfo, 0);
  uint64_t v5 = self->_funcFlag.__begin_;
  if (v5)
  {
    self->_funcFlag.__end_ = v5;
    operator delete(v5);
  }
  sub_8014((uint64_t)&self->_lastUpdatedFramebuffer);
  objc_storeStrong((id *)&self->_functionFlag, 0);
  objc_storeStrong((id *)&self->_payLoad, 0);
  objc_destroyWeak((id *)&self->_functionPlayer);

  objc_destroyWeak((id *)&self->_playbackEngine);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_DWORD *)self + 20) = 1065353216;
  *((void *)self + 12) = 0;
  *((void *)self + 13) = 0;
  *((void *)self + 11) = 0;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_DWORD *)self + 44) = 1065353216;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *((_DWORD *)self + 54) = 1065353216;
  *((void *)self + 43) = 0;
  *((void *)self + 44) = 0;
  *((void *)self + 42) = 0;
  *((void *)self + 50) = 0;
  return self;
}

@end