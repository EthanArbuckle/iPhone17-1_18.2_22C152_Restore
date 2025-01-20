@interface FigCaptureDepthDataSinkConfiguration
- (BOOL)discardsLateDepthData;
- (BOOL)filteringEnabled;
- (BOOL)isEqual:(id)a3;
- (FigCaptureDepthDataSinkConfiguration)initWithXPCEncoding:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (id)description;
- (int)sinkType;
- (void)setDiscardsLateDepthData:(BOOL)a3;
- (void)setFilteringEnabled:(BOOL)a3;
@end

@implementation FigCaptureDepthDataSinkConfiguration

- (int)sinkType
{
  return 11;
}

- (id)copyXPCEncoding
{
  v5.receiver = self;
  v5.super_class = (Class)FigCaptureDepthDataSinkConfiguration;
  id v3 = [(FigCaptureSinkConfiguration *)&v5 copyXPCEncoding];
  xpc_dictionary_set_BOOL(v3, "discardsLateDepthData", [(FigCaptureDepthDataSinkConfiguration *)self discardsLateDepthData]);
  xpc_dictionary_set_BOOL(v3, "filteringEnabled", [(FigCaptureDepthDataSinkConfiguration *)self filteringEnabled]);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)FigCaptureDepthDataSinkConfiguration;
  unsigned int v5 = -[FigCaptureSinkConfiguration isEqual:](&v9, sel_isEqual_);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (int v6 = [(FigCaptureDepthDataSinkConfiguration *)self discardsLateDepthData],
          v6 == [a3 discardsLateDepthData]))
    {
      BOOL v7 = [(FigCaptureDepthDataSinkConfiguration *)self filteringEnabled];
      LOBYTE(v5) = v7 ^ [a3 filteringEnabled] ^ 1;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FigCaptureDepthDataSinkConfiguration;
  id v4 = [(FigCaptureSinkConfiguration *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setDiscardsLateDepthData:", -[FigCaptureDepthDataSinkConfiguration discardsLateDepthData](self, "discardsLateDepthData"));
  objc_msgSend(v4, "setFilteringEnabled:", -[FigCaptureDepthDataSinkConfiguration filteringEnabled](self, "filteringEnabled"));
  return v4;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureDepthDataSinkConfiguration;
  return (id)[NSString stringWithFormat:@"%@ discards:%d filters:%d", -[FigCaptureSinkConfiguration description](&v3, sel_description), -[FigCaptureDepthDataSinkConfiguration discardsLateDepthData](self, "discardsLateDepthData"), -[FigCaptureDepthDataSinkConfiguration filteringEnabled](self, "filteringEnabled")];
}

- (BOOL)filteringEnabled
{
  return self->_filteringEnabled;
}

- (BOOL)discardsLateDepthData
{
  return self->_discardsLateDepthData;
}

- (void)setFilteringEnabled:(BOOL)a3
{
  self->_filteringEnabled = a3;
}

- (void)setDiscardsLateDepthData:(BOOL)a3
{
  self->_discardsLateDepthData = a3;
}

- (FigCaptureDepthDataSinkConfiguration)initWithXPCEncoding:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FigCaptureDepthDataSinkConfiguration;
  id v4 = -[FigCaptureSinkConfiguration initWithXPCEncoding:](&v6, sel_initWithXPCEncoding_);
  if (v4)
  {
    v4->_discardsLateDepthData = xpc_dictionary_get_BOOL(a3, "discardsLateDepthData");
    v4->_filteringEnabled = xpc_dictionary_get_BOOL(a3, "filteringEnabled");
  }
  return v4;
}

@end