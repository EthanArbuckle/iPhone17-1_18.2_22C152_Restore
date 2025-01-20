@interface ComposerShader
+ (id)createShaderWithName:(id)a3 dolby84:(BOOL)a4 forLLDovi:(BOOL)a5;
+ (id)createShaderWithNameAndInputOutput:(id)a3 dolby84:(BOOL)a4 forLLDovi:(BOOL)a5 input:(int)a6 output:(int)a7;
- (id)getComputePipeLineStateForDevice:(id)a3 Library:(id)a4;
- (id)getComputePipeLineStateForDevice:(id)a3 Library:(id)a4 input:(int)a5 output:(int)a6;
- (id)initShaderWithName:(id)a3 dolby84:(BOOL)a4 forLLDovi:(BOOL)a5 input:(int)a6 output:(int)a7;
@end

@implementation ComposerShader

+ (id)createShaderWithName:(id)a3 dolby84:(BOOL)a4 forLLDovi:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v9 = (void *)[objc_alloc((Class)a1) initShaderWithName:v8 dolby84:v6 forLLDovi:v5 input:38 output:6];

  return v9;
}

+ (id)createShaderWithNameAndInputOutput:(id)a3 dolby84:(BOOL)a4 forLLDovi:(BOOL)a5 input:(int)a6 output:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v8 = *(void *)&a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v12 = a3;
  v13 = (void *)[objc_alloc((Class)a1) initShaderWithName:v12 dolby84:v10 forLLDovi:v9 input:v8 output:v7];

  return v13;
}

- (id)initShaderWithName:(id)a3 dolby84:(BOOL)a4 forLLDovi:(BOOL)a5 input:(int)a6 output:(int)a7
{
  v12.receiver = self;
  v12.super_class = (Class)ComposerShader;
  id result = [(ForwardDmShader *)&v12 initShaderWithName:a3];
  if (result)
  {
    *((unsigned char *)result + 32) = a4;
    *((unsigned char *)result + 33) = a5;
    *((_DWORD *)result + 9) = a6;
    *((_DWORD *)result + 10) = a7;
  }
  return result;
}

- (id)getComputePipeLineStateForDevice:(id)a3 Library:(id)a4
{
  v4 = [(ComposerShader *)self getComputePipeLineStateForDevice:a3 Library:a4 input:38 output:6];
  return v4;
}

- (id)getComputePipeLineStateForDevice:(id)a3 Library:(id)a4 input:(int)a5 output:(int)a6
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v17[0] = self->_dolby84;
  v17[1] = self->_forLLDovi;
  v16.receiver = self;
  v16.super_class = (Class)ComposerShader;
  BOOL v9 = [(ForwardDmShader *)&v16 getComputePipeLineStateForDevice:a3 Library:a4 Constants:v17 ConstantNumber:2 input:(char)a5 output:(char)a6];
  if (!v9)
  {
    if (enableLogInstance)
    {
      if (logInstanceID) {
        uint64_t v10 = logInstanceID;
      }
      else {
        uint64_t v10 = prevLogInstanceID;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        BOOL dolby84 = self->_dolby84;
        BOOL forLLDovi = self->_forLLDovi;
        *(_DWORD *)buf = 134219266;
        v19 = (const char *)WORD1(v10);
        __int16 v20 = 2080;
        *(void *)v21 = "-[ComposerShader getComputePipeLineStateForDevice:Library:input:output:]";
        *(_WORD *)&v21[8] = 1024;
        *(_DWORD *)v22 = dolby84;
        *(_WORD *)&v22[4] = 1024;
        *(_DWORD *)v23 = forLLDovi;
        *(_WORD *)&v23[4] = 1024;
        int v24 = a5;
        __int16 v25 = 1024;
        int v26 = a6;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx %s : ERROR: Failed creating a new function with dolby84=%d, forLLDoVi=%d input=%d output=%d", buf, 0x2Eu);
      }
      prevLogInstanceID = v10;
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v13 = self->_dolby84;
      BOOL v14 = self->_forLLDovi;
      *(_DWORD *)buf = 136316162;
      v19 = "-[ComposerShader getComputePipeLineStateForDevice:Library:input:output:]";
      __int16 v20 = 1024;
      *(_DWORD *)v21 = v13;
      *(_WORD *)&v21[4] = 1024;
      *(_DWORD *)&v21[6] = v14;
      *(_WORD *)v22 = 1024;
      *(_DWORD *)&v22[2] = a5;
      *(_WORD *)v23 = 1024;
      *(_DWORD *)&v23[2] = a6;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] %s : ERROR: Failed creating a new function with dolby84=%d, forLLDoVi=%d input=%d output=%d", buf, 0x24u);
    }
  }
  return v9;
}

@end