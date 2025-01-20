@interface DASignalData
- (DASignalData)initWithSourceSignal:(float *)a3 receivedSignal:(float *)a4 minimumDelay:(unint64_t)a5 maximumDelay:(unint64_t)a6 fileTimeInFrames:(float)a7 outputID:(unint64_t)a8 inputID:(unint64_t)a9 fileName:(id)a10;
- (NSString)fileName;
- (float)fileTimeInFrames;
- (float)receivedSignal;
- (float)sourceSignal;
- (unint64_t)inputID;
- (unint64_t)maximumDelay;
- (unint64_t)minimumDelay;
- (unint64_t)outputID;
- (void)freeReceivedData;
- (void)freeSourceData;
- (void)setFileName:(id)a3;
- (void)setFileTimeInFrames:(float)a3;
- (void)setInputID:(unint64_t)a3;
- (void)setMaximumDelay:(unint64_t)a3;
- (void)setMinimumDelay:(unint64_t)a3;
- (void)setOutputID:(unint64_t)a3;
- (void)setReceivedSignal:(float *)a3;
- (void)setSourceSignal:(float *)a3;
@end

@implementation DASignalData

- (DASignalData)initWithSourceSignal:(float *)a3 receivedSignal:(float *)a4 minimumDelay:(unint64_t)a5 maximumDelay:(unint64_t)a6 fileTimeInFrames:(float)a7 outputID:(unint64_t)a8 inputID:(unint64_t)a9 fileName:(id)a10
{
  id v18 = a10;
  v23.receiver = self;
  v23.super_class = (Class)DASignalData;
  v19 = [(DASignalData *)&v23 init];
  v20 = v19;
  if (v19)
  {
    [(DASignalData *)v19 setMinimumDelay:a5];
    [(DASignalData *)v20 setMaximumDelay:a6];
    *(float *)&double v21 = a7;
    [(DASignalData *)v20 setFileTimeInFrames:v21];
    [(DASignalData *)v20 setSourceSignal:a3];
    [(DASignalData *)v20 setReceivedSignal:a4];
    [(DASignalData *)v20 setInputID:a9];
    [(DASignalData *)v20 setOutputID:a8];
    [(DASignalData *)v20 setFileName:v18];
  }

  return v20;
}

- (void)freeSourceData
{
  v2 = [(DASignalData *)self sourceSignal];

  free(v2);
}

- (void)freeReceivedData
{
  v2 = [(DASignalData *)self receivedSignal];

  free(v2);
}

- (unint64_t)minimumDelay
{
  return self->_minimumDelay;
}

- (void)setMinimumDelay:(unint64_t)a3
{
  self->_minimumDelay = a3;
}

- (unint64_t)maximumDelay
{
  return self->_maximumDelay;
}

- (void)setMaximumDelay:(unint64_t)a3
{
  self->_maximumDelay = a3;
}

- (float)fileTimeInFrames
{
  return self->_fileTimeInFrames;
}

- (void)setFileTimeInFrames:(float)a3
{
  self->_fileTimeInFrames = a3;
}

- (float)sourceSignal
{
  return self->_sourceSignal;
}

- (void)setSourceSignal:(float *)a3
{
  self->_sourceSignal = a3;
}

- (float)receivedSignal
{
  return self->_receivedSignal;
}

- (void)setReceivedSignal:(float *)a3
{
  self->_receivedSignal = a3;
}

- (unint64_t)outputID
{
  return self->_outputID;
}

- (void)setOutputID:(unint64_t)a3
{
  self->_outputID = a3;
}

- (unint64_t)inputID
{
  return self->_inputID;
}

- (void)setInputID:(unint64_t)a3
{
  self->_inputID = a3;
}

- (NSString)fileName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFileName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end