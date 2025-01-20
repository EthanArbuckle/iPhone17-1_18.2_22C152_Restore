@interface REAudioPayload
+ (BOOL)supportsSecureCoding;
- (AVAudioFormat)format;
- (BOOL)streaming;
- (NSNumber)bufferSize;
- (NSNumber)length;
- (NSString)filePath;
- (NSString)mixGroupName;
- (OS_xpc_object)fileBuffer;
- (OS_xpc_object)pcmBuffer;
- (REAudioPayload)initWithBuffer:(id)a3 format:(id)a4 length:(unsigned int)a5 inputMode:(unsigned __int8)a6 referenceLevel:(float)a7 loopCount:(int)a8 mixGroupName:(id)a9 streaming:(BOOL)a10 normalizationMode:(int)a11 calibrationMode:(int)a12 calibrationLevel:(double)a13 layoutTag:(unsigned int)a14 taskToken:(unsigned int)a15 audioAssetID:(unint64_t)a16;
- (REAudioPayload)initWithCoder:(id)a3;
- (REAudioPayload)initWithFileBuffer:(id)a3 format:(id)a4 length:(unsigned int)a5 bufferSize:(unint64_t)a6 inputMode:(unsigned __int8)a7 referenceLevel:(float)a8 loopCount:(int)a9 mixGroupName:(id)a10 streaming:(BOOL)a11 normalizationMode:(int)a12 calibrationMode:(int)a13 calibrationLevel:(double)a14 layoutTag:(unsigned int)a15 taskToken:(unsigned int)a16 audioAssetID:(unint64_t)a17;
- (REAudioPayload)initWithFilePath:(id)a3 inputMode:(unsigned __int8)a4 referenceLevel:(float)a5 loopCount:(int)a6 mixGroupName:(id)a7 streaming:(BOOL)a8 normalizationMode:(int)a9 calibrationMode:(int)a10 calibrationLevel:(double)a11 layoutTag:(unsigned int)a12 taskToken:(unsigned int)a13 targetLUFS:(double)a14 audioAssetID:(unint64_t)a15;
- (double)calibrationLevel;
- (double)targetLUFS;
- (float)referenceLevel;
- (int)calibrationMode;
- (int)loopCount;
- (int)normalizationMode;
- (unint64_t)audioAssetID;
- (unsigned)inputMode;
- (unsigned)layoutTag;
- (unsigned)taskToken;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REAudioPayload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  mach_port_name_t taskToken = self->_taskToken;
  if (taskToken + 1 >= 2)
  {
    v4 = (re *)mach_port_deallocate(*MEMORY[0x263EF8960], taskToken);
    mach_error_t v5 = (int)v4;
    if (v4)
    {
      v6 = (id)*re::audioLogObjects(v4);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v9 = mach_error_string(v5);
        _os_log_error_impl(&dword_233120000, v6, OS_LOG_TYPE_ERROR, "[CoreRE] [AudioFileAsset] Failed to deallocate mach port, with KERN error code: %s", buf, 0xCu);
      }
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)REAudioPayload;
  [(REAudioPayload *)&v7 dealloc];
}

- (REAudioPayload)initWithBuffer:(id)a3 format:(id)a4 length:(unsigned int)a5 inputMode:(unsigned __int8)a6 referenceLevel:(float)a7 loopCount:(int)a8 mixGroupName:(id)a9 streaming:(BOOL)a10 normalizationMode:(int)a11 calibrationMode:(int)a12 calibrationLevel:(double)a13 layoutTag:(unsigned int)a14 taskToken:(unsigned int)a15 audioAssetID:(unint64_t)a16
{
  id v24 = a3;
  id v25 = a4;
  id v26 = a9;
  v33.receiver = self;
  v33.super_class = (Class)REAudioPayload;
  v27 = [(RESharedResourcePayload *)&v33 init];
  v28 = v27;
  if (v27)
  {
    objc_storeStrong((id *)&v27->_pcmBuffer, a3);
    objc_storeStrong((id *)&v28->_format, a4);
    uint64_t v29 = [NSNumber numberWithLongLong:a5];
    length = v28->_length;
    v28->_length = (NSNumber *)v29;

    v28->_inputMode = a6;
    v28->_referenceLevel = a7;
    v28->_loopCount = a8;
    objc_storeStrong((id *)&v28->_mixGroupName, a9);
    v28->_streaming = a10;
    v28->_normalizationMode = a11;
    v28->_calibrationMode = a12;
    v28->_calibrationLevel = a13;
    v28->_layoutTag = a14;
    v28->_mach_port_name_t taskToken = a15;
    v28->_targetLUFS = -12.0;
    if (a15 + 1 >= 2) {
      mach_port_mod_refs(*MEMORY[0x263EF8960], a15, 0, 1);
    }
    v28->_audioAssetID = a16;
  }

  return v28;
}

- (REAudioPayload)initWithFileBuffer:(id)a3 format:(id)a4 length:(unsigned int)a5 bufferSize:(unint64_t)a6 inputMode:(unsigned __int8)a7 referenceLevel:(float)a8 loopCount:(int)a9 mixGroupName:(id)a10 streaming:(BOOL)a11 normalizationMode:(int)a12 calibrationMode:(int)a13 calibrationLevel:(double)a14 layoutTag:(unsigned int)a15 taskToken:(unsigned int)a16 audioAssetID:(unint64_t)a17
{
  id v25 = a3;
  id v26 = a4;
  id v27 = a10;
  v36.receiver = self;
  v36.super_class = (Class)REAudioPayload;
  v28 = [(RESharedResourcePayload *)&v36 init];
  uint64_t v29 = v28;
  if (v28)
  {
    objc_storeStrong((id *)&v28->_fileBuffer, a3);
    objc_storeStrong((id *)&v29->_format, a4);
    uint64_t v30 = [NSNumber numberWithLongLong:a5];
    length = v29->_length;
    v29->_length = (NSNumber *)v30;

    uint64_t v32 = [NSNumber numberWithUnsignedLongLong:a6];
    bufferSize = v29->_bufferSize;
    v29->_bufferSize = (NSNumber *)v32;

    v29->_inputMode = a7;
    v29->_referenceLevel = a8;
    v29->_loopCount = a9;
    objc_storeStrong((id *)&v29->_mixGroupName, a10);
    v29->_streaming = a11;
    v29->_normalizationMode = a12;
    v29->_calibrationMode = a13;
    v29->_calibrationLevel = a14;
    v29->_layoutTag = a15;
    v29->_mach_port_name_t taskToken = a16;
    v29->_targetLUFS = -12.0;
    if (a16 + 1 >= 2) {
      mach_port_mod_refs(*MEMORY[0x263EF8960], a16, 0, 1);
    }
    v29->_audioAssetID = a17;
  }

  return v29;
}

- (REAudioPayload)initWithFilePath:(id)a3 inputMode:(unsigned __int8)a4 referenceLevel:(float)a5 loopCount:(int)a6 mixGroupName:(id)a7 streaming:(BOOL)a8 normalizationMode:(int)a9 calibrationMode:(int)a10 calibrationLevel:(double)a11 layoutTag:(unsigned int)a12 taskToken:(unsigned int)a13 targetLUFS:(double)a14 audioAssetID:(unint64_t)a15
{
  id v25 = a3;
  id v26 = a7;
  v30.receiver = self;
  v30.super_class = (Class)REAudioPayload;
  id v27 = [(RESharedResourcePayload *)&v30 init];
  v28 = v27;
  if (v27)
  {
    objc_storeStrong((id *)&v27->_filePath, a3);
    v28->_inputMode = a4;
    v28->_referenceLevel = a5;
    v28->_loopCount = a6;
    objc_storeStrong((id *)&v28->_mixGroupName, a7);
    v28->_streaming = a8;
    v28->_normalizationMode = a9;
    v28->_calibrationMode = a10;
    v28->_calibrationLevel = a11;
    v28->_layoutTag = a12;
    v28->_mach_port_name_t taskToken = a13;
    v28->_targetLUFS = a14;
    if (a13 + 1 >= 2) {
      mach_port_mod_refs(*MEMORY[0x263EF8960], a13, 0, 1);
    }
    v28->_audioAssetID = a15;
  }

  return v28;
}

- (REAudioPayload)initWithCoder:(id)a3
{
  v40[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v36.receiver = self;
    v36.super_class = (Class)REAudioPayload;
    mach_error_t v5 = [(RESharedResourcePayload *)&v36 initWithCoder:v4];
    if (v5)
    {
      if ([v4 containsValueForKey:@"pcmBuffer"])
      {
        uint64_t v6 = [v4 decodeXPCObjectForKey:@"pcmBuffer"];
        pcmBuffer = v5->_pcmBuffer;
        v5->_pcmBuffer = (OS_xpc_object *)v6;

        uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"format"];
        format = v5->_format;
        v5->_format = (AVAudioFormat *)v8;

        uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"length"];
        uint64_t v11 = 72;
      }
      else if ([v4 containsValueForKey:@"fileBuffer"])
      {
        uint64_t v16 = [v4 decodeXPCObjectForKey:@"fileBuffer"];
        fileBuffer = v5->_fileBuffer;
        v5->_fileBuffer = (OS_xpc_object *)v16;

        uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"format"];
        v19 = v5->_format;
        v5->_format = (AVAudioFormat *)v18;

        uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"length"];
        length = v5->_length;
        v5->_length = (NSNumber *)v20;

        uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bufferSize"];
        uint64_t v11 = 80;
      }
      else
      {
        if (![v4 containsValueForKey:@"filePath"])
        {
          uint64_t v32 = (void *)MEMORY[0x263F087E8];
          uint64_t v37 = *MEMORY[0x263F07F80];
          v38 = @"REAudioPayload requires either buffer or filePath";
          objc_super v33 = [NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
          v34 = [v32 errorWithDomain:*MEMORY[0x263F07F70] code:4864 userInfo:v33];
          [v4 failWithError:v34];

          v15 = 0;
          self = v5;
          goto LABEL_16;
        }
        uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"filePath"];
        uint64_t v11 = 88;
      }
      v22 = *(Class *)((char *)&v5->super.super.isa + v11);
      *(Class *)((char *)&v5->super.super.isa + v11) = (Class)v10;

      v5->_inputMode = [v4 decodeIntForKey:@"inputMode"];
      [v4 decodeFloatForKey:@"referenceLevel"];
      v5->_referenceLevel = v23;
      v5->_loopCount = [v4 decodeIntForKey:@"loopCount"];
      uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mixGroupName"];
      mixGroupName = v5->_mixGroupName;
      v5->_mixGroupName = (NSString *)v24;

      v5->_streaming = [v4 decodeBoolForKey:@"streaming"];
      v5->_normalizationMode = [v4 decodeIntegerForKey:@"normalizationMode"];
      v5->_calibrationMode = [v4 decodeIntegerForKey:@"calibrationMode"];
      [v4 decodeDoubleForKey:@"calibrationLevel"];
      v5->_calibrationLevel = v26;
      v5->_layoutTag = [v4 decodeIntegerForKey:@"layoutTag"];
      [v4 decodeDoubleForKey:@"targetLUFS"];
      v5->_targetLUFS = v27;
      v5->_audioAssetID = [v4 decodeInt64ForKey:@"audioAssetID"];
      v28 = [v4 decodeXPCObjectOfType:MEMORY[0x263EF8748] forKey:@"taskToken"];
      if (v28)
      {
        unsigned int v29 = xpc_mach_send_copy_right();
      }
      else
      {
        objc_super v30 = *re::audioLogObjects(0);
        unsigned int v29 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
        if (v29)
        {
          __int16 v35 = 0;
          _os_log_error_impl(&dword_233120000, v30, OS_LOG_TYPE_ERROR, "[CoreRE] [REAudioPayload] Failed to decode xpc_object for taskToken. Setting to MACH_PORT_NULL", (uint8_t *)&v35, 2u);
          unsigned int v29 = 0;
        }
      }
      v5->_mach_port_name_t taskToken = v29;
    }
    self = v5;
    v15 = self;
  }
  else
  {
    v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v39 = *MEMORY[0x263F07F80];
    v40[0] = @"REAudioPayload requires an NSXPCCoder";
    v13 = [NSDictionary dictionaryWithObjects:v40 forKeys:&v39 count:1];
    v14 = [v12 errorWithDomain:*MEMORY[0x263F07F70] code:4864 userInfo:v13];
    [v4 failWithError:v14];

    v15 = 0;
  }
LABEL_16:

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = *MEMORY[0x263F07F80];
    v21[0] = @"REAudioPayload requires an NSXPCCoder";
    v9 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
    uint64_t v10 = [v8 errorWithDomain:*MEMORY[0x263F07F70] code:4864 userInfo:v9];
    [v4 failWithError:v10];

    goto LABEL_5;
  }
  pcmBuffer = self->_pcmBuffer;
  if (pcmBuffer)
  {
    [v4 encodeXPCObject:pcmBuffer forKey:@"pcmBuffer"];
    uint64_t v6 = &OBJC_IVAR___REAudioPayload__length;
    [v4 encodeObject:self->_format forKey:@"format"];
    objc_super v7 = @"length";
  }
  else
  {
    fileBuffer = self->_fileBuffer;
    if (!fileBuffer)
    {
      filePath = self->_filePath;
      if (!filePath)
      {
        v15 = (void *)MEMORY[0x263F087E8];
        uint64_t v18 = *MEMORY[0x263F07F80];
        v19 = @"REAudioPayload requires either non-nil buffer of filePath";
        v9 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
        uint64_t v16 = [v15 errorWithDomain:*MEMORY[0x263F07F70] code:4864 userInfo:v9];
        [v4 failWithError:v16];

        goto LABEL_5;
      }
      [v4 encodeObject:filePath forKey:@"filePath"];
      goto LABEL_9;
    }
    [v4 encodeXPCObject:fileBuffer forKey:@"fileBuffer"];
    [v4 encodeObject:self->_format forKey:@"format"];
    uint64_t v6 = &OBJC_IVAR___REAudioPayload__bufferSize;
    [v4 encodeObject:self->_length forKey:@"length"];
    objc_super v7 = @"bufferSize";
  }
  [v4 encodeObject:*(Class *)((char *)&self->super.super.isa + *v6) forKey:v7];
LABEL_9:
  [v4 encodeInt:self->_inputMode forKey:@"inputMode"];
  *(float *)&double v12 = self->_referenceLevel;
  [v4 encodeFloat:@"referenceLevel" forKey:v12];
  [v4 encodeInt:self->_loopCount forKey:@"loopCount"];
  [v4 encodeObject:self->_mixGroupName forKey:@"mixGroupName"];
  [v4 encodeBool:self->_streaming forKey:@"streaming"];
  [v4 encodeInteger:self->_normalizationMode forKey:@"normalizationMode"];
  [v4 encodeInteger:self->_calibrationMode forKey:@"calibrationMode"];
  [v4 encodeDouble:@"calibrationLevel" forKey:self->_calibrationLevel];
  [v4 encodeInteger:self->_layoutTag forKey:@"layoutTag"];
  [v4 encodeDouble:@"targetLUFS" forKey:self->_targetLUFS];
  [v4 encodeInteger:self->_audioAssetID forKey:@"audioAssetID"];
  if (self->_taskToken + 1 < 2) {
    goto LABEL_10;
  }
  v9 = (void *)xpc_mach_send_create();
  if (v9)
  {
    [v4 encodeXPCObject:v9 forKey:@"taskToken"];
  }
  else
  {
    v14 = *re::audioLogObjects(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v17 = 0;
      _os_log_error_impl(&dword_233120000, v14, OS_LOG_TYPE_ERROR, "[CoreRE] [REAudioPayload] Failed to encode xpc_object for taskToken.", v17, 2u);
    }
    v9 = 0;
  }
LABEL_5:

LABEL_10:
}

- (OS_xpc_object)pcmBuffer
{
  return self->_pcmBuffer;
}

- (OS_xpc_object)fileBuffer
{
  return self->_fileBuffer;
}

- (AVAudioFormat)format
{
  return self->_format;
}

- (NSNumber)length
{
  return self->_length;
}

- (NSNumber)bufferSize
{
  return self->_bufferSize;
}

- (NSString)filePath
{
  return self->_filePath;
}

- (unsigned)inputMode
{
  return self->_inputMode;
}

- (float)referenceLevel
{
  return self->_referenceLevel;
}

- (int)loopCount
{
  return self->_loopCount;
}

- (NSString)mixGroupName
{
  return self->_mixGroupName;
}

- (BOOL)streaming
{
  return self->_streaming;
}

- (int)normalizationMode
{
  return self->_normalizationMode;
}

- (int)calibrationMode
{
  return self->_calibrationMode;
}

- (double)calibrationLevel
{
  return self->_calibrationLevel;
}

- (unsigned)layoutTag
{
  return self->_layoutTag;
}

- (unsigned)taskToken
{
  return self->_taskToken;
}

- (double)targetLUFS
{
  return self->_targetLUFS;
}

- (unint64_t)audioAssetID
{
  return self->_audioAssetID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mixGroupName, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_bufferSize, 0);
  objc_storeStrong((id *)&self->_length, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_fileBuffer, 0);
  objc_storeStrong((id *)&self->_pcmBuffer, 0);
}

@end