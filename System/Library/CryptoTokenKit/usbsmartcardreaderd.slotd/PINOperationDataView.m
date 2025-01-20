@interface PINOperationDataView
- (PINOperationDataView)initWithData:(id)a3;
- (PINOperationDataView)initWithLength:(unint64_t)a3;
- (unsigned)bPINOperation;
- (unsigned)bTimeOut;
- (unsigned)bmFormatString;
- (unsigned)bmPINBlockString;
- (unsigned)bmPINLengthFormat;
- (unsigned)lengthByte;
- (unsigned)nodeAddressByte;
- (unsigned)protocolControlByte;
- (void)setBPINOperation:(unsigned __int8)a3;
- (void)setBTimeOut:(unsigned __int8)a3;
- (void)setBmFormatString:(unsigned __int8)a3;
- (void)setBmPINBlockString:(unsigned __int8)a3;
- (void)setBmPINLengthFormat:(unsigned __int8)a3;
- (void)setLengthByte:(unsigned __int8)a3;
- (void)setNodeAddressByte:(unsigned __int8)a3;
- (void)setProtocolControlByte:(unsigned __int8)a3;
@end

@implementation PINOperationDataView

- (PINOperationDataView)initWithLength:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PINOperationDataView;
  return [(TKDataView *)&v4 initWithLength:a3];
}

- (PINOperationDataView)initWithData:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PINOperationDataView;
  return [(TKDataView *)&v4 initWithData:a3];
}

- (unsigned)bPINOperation
{
  return [(TKDataView *)self uint8:0];
}

- (void)setBPINOperation:(unsigned __int8)a3
{
}

- (unsigned)bTimeOut
{
  return [(TKDataView *)self uint8:1];
}

- (void)setBTimeOut:(unsigned __int8)a3
{
}

- (unsigned)bmFormatString
{
  return [(TKDataView *)self uint8:2];
}

- (void)setBmFormatString:(unsigned __int8)a3
{
}

- (unsigned)bmPINBlockString
{
  return [(TKDataView *)self uint8:3];
}

- (void)setBmPINBlockString:(unsigned __int8)a3
{
}

- (unsigned)bmPINLengthFormat
{
  return [(TKDataView *)self uint8:4];
}

- (void)setBmPINLengthFormat:(unsigned __int8)a3
{
}

- (unsigned)nodeAddressByte
{
  objc_super v4 = +[NSAssertionHandler currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"CCIDDefinitions.m" lineNumber:957 description:@"Have to be implement in derived class"];

  return 0;
}

- (void)setNodeAddressByte:(unsigned __int8)a3
{
  id v5 = +[NSAssertionHandler currentHandler];
  [v5 handleFailureInMethod:a2 object:self file:@"CCIDDefinitions.m" lineNumber:962 description:@"Have to be implement in derived class"];
}

- (unsigned)protocolControlByte
{
  objc_super v4 = +[NSAssertionHandler currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"CCIDDefinitions.m" lineNumber:966 description:@"Have to be implement in derived class"];

  return 0;
}

- (void)setProtocolControlByte:(unsigned __int8)a3
{
  id v5 = +[NSAssertionHandler currentHandler];
  [v5 handleFailureInMethod:a2 object:self file:@"CCIDDefinitions.m" lineNumber:971 description:@"Have to be implement in derived class"];
}

- (unsigned)lengthByte
{
  objc_super v4 = +[NSAssertionHandler currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"CCIDDefinitions.m" lineNumber:975 description:@"Have to be implement in derived class"];

  return 0;
}

- (void)setLengthByte:(unsigned __int8)a3
{
  id v5 = +[NSAssertionHandler currentHandler];
  [v5 handleFailureInMethod:a2 object:self file:@"CCIDDefinitions.m" lineNumber:980 description:@"Have to be implement in derived class"];
}

@end