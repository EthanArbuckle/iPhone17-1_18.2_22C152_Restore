@interface VCMediaControlInfo
- (BOOL)hasInfoType:(unsigned int)a3;
- (VCMediaControlInfo)init;
- (VCMediaControlInfo)initWithBuffer:(const char *)a3 length:(unint64_t)a4 optionalControlInfo:(id *)a5 version:(unsigned __int8)a6;
- (int)configureWithBuffer:(const char *)a3 length:(unint64_t)a4 optionalControlInfo:(id *)a5;
- (int)getInfo:(void *)a3 bufferLength:(unint64_t)a4 infoSize:(unint64_t *)a5 type:(unsigned int)a6;
- (int)getInfoUnserialized:(id *)a3 type:(unsigned int)a4;
- (int)serializeToBuffer:(char *)a3 bufferLength:(unint64_t)a4 blobLength:(unint64_t *)a5;
- (int)setInfo:(void *)a3 size:(unint64_t)a4 type:(unsigned int)a5;
- (int)setInfoUnserialized:(id *)a3 type:(unsigned int)a4;
- (unint64_t)serializedSize;
- (unsigned)fecFeedbackVersion;
- (unsigned)version;
- (void)setFecFeedbackVersion:(unsigned __int8)a3;
- (void)setVersion:(unsigned __int8)a3;
@end

@implementation VCMediaControlInfo

- (VCMediaControlInfo)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaControlInfo;
  result = [(VCMediaControlInfo *)&v3 init];
  if (result)
  {
    result->_vtableC.serializedSize = VCMediaControlInfo_SerializedSize;
    result->_vtableC.serialize = VCMediaControlInfo_SerializeBuffer;
  }
  return result;
}

- (VCMediaControlInfo)initWithBuffer:(const char *)a3 length:(unint64_t)a4 optionalControlInfo:(id *)a5 version:(unsigned __int8)a6
{
  v10 = [(VCMediaControlInfo *)self init];
  v11 = v10;
  if (v10)
  {
    v10->_version = a6;
    if ([(VCMediaControlInfo *)v10 configureWithBuffer:a3 length:a4 optionalControlInfo:a5] < 0)
    {

      return 0;
    }
  }
  return v11;
}

- (int)configureWithBuffer:(const char *)a3 length:(unint64_t)a4 optionalControlInfo:(id *)a5
{
}

- (int)setInfo:(void *)a3 size:(unint64_t)a4 type:(unsigned int)a5
{
}

- (int)setInfoUnserialized:(id *)a3 type:(unsigned int)a4
{
  return 0;
}

- (BOOL)hasInfoType:(unsigned int)a3
{
}

- (int)getInfo:(void *)a3 bufferLength:(unint64_t)a4 infoSize:(unint64_t *)a5 type:(unsigned int)a6
{
}

- (int)getInfoUnserialized:(id *)a3 type:(unsigned int)a4
{
  return 0;
}

- (int)serializeToBuffer:(char *)a3 bufferLength:(unint64_t)a4 blobLength:(unint64_t *)a5
{
}

- (unint64_t)serializedSize
{
  return self->_serializedSize;
}

- (unsigned)fecFeedbackVersion
{
  return self->_fecFeedbackVersion;
}

- (void)setFecFeedbackVersion:(unsigned __int8)a3
{
  self->_fecFeedbackVersion = a3;
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned __int8)a3
{
  self->_version = a3;
}

@end