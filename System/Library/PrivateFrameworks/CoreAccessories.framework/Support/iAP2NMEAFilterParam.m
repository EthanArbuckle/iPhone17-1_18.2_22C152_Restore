@interface iAP2NMEAFilterParam
- (BOOL)isEqual:(id)a3;
- (iAP2NMEAFilterParam)initWithTypeParamID:(unsigned int)a3 andIntervalParamID:(unsigned int)a4 andIntervalMinMs:(unsigned int)a5;
- (unsigned)nmeaIntervalMinMs;
- (unsigned)nmeaIntervalParamID;
- (unsigned)nmeaTypeParamID;
- (void)setNmeaIntervalMinMs:(unsigned int)a3;
- (void)setNmeaIntervalParamID:(unsigned int)a3;
- (void)setNmeaTypeParamID:(unsigned int)a3;
@end

@implementation iAP2NMEAFilterParam

- (iAP2NMEAFilterParam)initWithTypeParamID:(unsigned int)a3 andIntervalParamID:(unsigned int)a4 andIntervalMinMs:(unsigned int)a5
{
  v9.receiver = self;
  v9.super_class = (Class)iAP2NMEAFilterParam;
  result = [(iAP2NMEAFilterParam *)&v9 init];
  if (result)
  {
    result->_nmeaTypeParamID = a3;
    result->_nmeaIntervalParamID = a4;
    result->_nmeaIntervalMinMs = a5;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (unsigned int v5 = [(iAP2NMEAFilterParam *)self nmeaTypeParamID],
        v5 == [v4 nmeaTypeParamID])
    && (unsigned int v6 = [(iAP2NMEAFilterParam *)self nmeaIntervalParamID],
        v6 == [v4 nmeaIntervalParamID]))
  {
    unsigned int v7 = [(iAP2NMEAFilterParam *)self nmeaIntervalMinMs];
    BOOL v8 = v7 == [v4 nmeaIntervalMinMs];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unsigned)nmeaTypeParamID
{
  return self->_nmeaTypeParamID;
}

- (void)setNmeaTypeParamID:(unsigned int)a3
{
  self->_nmeaTypeParamID = a3;
}

- (unsigned)nmeaIntervalParamID
{
  return self->_nmeaIntervalParamID;
}

- (void)setNmeaIntervalParamID:(unsigned int)a3
{
  self->_nmeaIntervalParamID = a3;
}

- (unsigned)nmeaIntervalMinMs
{
  return self->_nmeaIntervalMinMs;
}

- (void)setNmeaIntervalMinMs:(unsigned int)a3
{
  self->_nmeaIntervalMinMs = a3;
}

@end