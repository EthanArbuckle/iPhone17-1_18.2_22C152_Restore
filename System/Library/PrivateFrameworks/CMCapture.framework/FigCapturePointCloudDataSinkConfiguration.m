@interface FigCapturePointCloudDataSinkConfiguration
- (BOOL)discardsLatePointCloudData;
- (BOOL)isEqual:(id)a3;
- (FigCapturePointCloudDataSinkConfiguration)initWithXPCEncoding:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (id)description;
- (int)sinkType;
- (void)setDiscardsLatePointCloudData:(BOOL)a3;
@end

@implementation FigCapturePointCloudDataSinkConfiguration

- (FigCapturePointCloudDataSinkConfiguration)initWithXPCEncoding:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FigCapturePointCloudDataSinkConfiguration;
  v4 = -[FigCaptureSinkConfiguration initWithXPCEncoding:](&v6, sel_initWithXPCEncoding_);
  if (v4) {
    v4->_discardsLatePointCloudData = xpc_dictionary_get_BOOL(a3, "discardsLatePointCloudData");
  }
  return v4;
}

- (id)copyXPCEncoding
{
  v5.receiver = self;
  v5.super_class = (Class)FigCapturePointCloudDataSinkConfiguration;
  id v3 = [(FigCaptureSinkConfiguration *)&v5 copyXPCEncoding];
  xpc_dictionary_set_BOOL(v3, "discardsLatePointCloudData", [(FigCapturePointCloudDataSinkConfiguration *)self discardsLatePointCloudData]);
  return v3;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)FigCapturePointCloudDataSinkConfiguration;
  return (id)[NSString stringWithFormat:@"%@ discards:%d", -[FigCaptureSinkConfiguration description](&v3, sel_description), -[FigCapturePointCloudDataSinkConfiguration discardsLatePointCloudData](self, "discardsLatePointCloudData")];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FigCapturePointCloudDataSinkConfiguration;
  id v4 = [(FigCaptureSinkConfiguration *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setDiscardsLatePointCloudData:", -[FigCapturePointCloudDataSinkConfiguration discardsLatePointCloudData](self, "discardsLatePointCloudData"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)FigCapturePointCloudDataSinkConfiguration;
  unsigned int v5 = -[FigCaptureSinkConfiguration isEqual:](&v8, sel_isEqual_);
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v6 = [(FigCapturePointCloudDataSinkConfiguration *)self discardsLatePointCloudData];
      LOBYTE(v5) = v6 ^ [a3 discardsLatePointCloudData] ^ 1;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (int)sinkType
{
  return 15;
}

- (BOOL)discardsLatePointCloudData
{
  return self->_discardsLatePointCloudData;
}

- (void)setDiscardsLatePointCloudData:(BOOL)a3
{
  self->_discardsLatePointCloudData = a3;
}

@end