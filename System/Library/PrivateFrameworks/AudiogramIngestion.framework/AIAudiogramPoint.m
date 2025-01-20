@interface AIAudiogramPoint
- (AIAudiogramPoint)initWithSymbolName:(id)a3 frequency:(double)a4 dbValue:(double)a5 confidence:(double)a6;
- (NSString)symbolName;
- (double)confidence;
- (double)dbValue;
- (double)frequency;
- (void)setConfidence:(double)a3;
- (void)setDbValue:(double)a3;
- (void)setFrequency:(double)a3;
- (void)setSymbolName:(id)a3;
@end

@implementation AIAudiogramPoint

- (AIAudiogramPoint)initWithSymbolName:(id)a3 frequency:(double)a4 dbValue:(double)a5 confidence:(double)a6
{
  id v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AIAudiogramPoint;
  v11 = [(AIAudiogramPoint *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(AIAudiogramPoint *)v11 setSymbolName:v10];
    [(AIAudiogramPoint *)v12 setFrequency:a4];
    [(AIAudiogramPoint *)v12 setDbValue:a5];
    [(AIAudiogramPoint *)v12 setConfidence:a6];
  }

  return v12;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (void)setSymbolName:(id)a3
{
}

- (double)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(double)a3
{
  self->_frequency = a3;
}

- (double)dbValue
{
  return self->_dbValue;
}

- (void)setDbValue:(double)a3
{
  self->_dbValue = a3;
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (void).cxx_destruct
{
}

@end