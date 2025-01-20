@interface GTMTLFXTracingDelegate
- (GTMTLFXTracingDelegate)init;
- (NSData)mtlfxTracingInfo;
- (unint64_t)functionIndex;
- (void)_addEncoderInfo:(unsigned int)a3;
- (void)scaler:(id)a3 didCreateBlitCommandEncoder:(id)a4 forEncode:(unint64_t)a5;
- (void)scaler:(id)a3 didCreateComputeCommandEncoder:(id)a4 forEncode:(unint64_t)a5;
- (void)scaler:(id)a3 didCreateRenderCommandEncoder:(id)a4 forEncode:(unint64_t)a5;
- (void)setFunctionIndex:(unint64_t)a3;
@end

@implementation GTMTLFXTracingDelegate

- (void).cxx_destruct
{
}

- (void)setFunctionIndex:(unint64_t)a3
{
  self->functionIndex = a3;
}

- (unint64_t)functionIndex
{
  return self->functionIndex;
}

- (void)scaler:(id)a3 didCreateComputeCommandEncoder:(id)a4 forEncode:(unint64_t)a5
{
  id v6 = a4;
  -[GTMTLFXTracingDelegate _addEncoderInfo:](self, "_addEncoderInfo:", [v6 globalTraceObjectID]);
}

- (void)scaler:(id)a3 didCreateBlitCommandEncoder:(id)a4 forEncode:(unint64_t)a5
{
  id v6 = a4;
  -[GTMTLFXTracingDelegate _addEncoderInfo:](self, "_addEncoderInfo:", [v6 globalTraceObjectID]);
}

- (void)scaler:(id)a3 didCreateRenderCommandEncoder:(id)a4 forEncode:(unint64_t)a5
{
  id v6 = a4;
  -[GTMTLFXTracingDelegate _addEncoderInfo:](self, "_addEncoderInfo:", [v6 globalTraceObjectID]);
}

- (void)_addEncoderInfo:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  mtlfxTracingDictionary = self->_mtlfxTracingDictionary;
  id v6 = +[NSNumber numberWithUnsignedLongLong:self->functionIndex];
  id v12 = [(NSMutableDictionary *)mtlfxTracingDictionary objectForKeyedSubscript:v6];

  id v7 = v12;
  if (!v12)
  {
    uint64_t v8 = objc_opt_new();
    v9 = self->_mtlfxTracingDictionary;
    v10 = +[NSNumber numberWithUnsignedLongLong:self->functionIndex];
    [(NSMutableDictionary *)v9 setObject:v8 forKeyedSubscript:v10];

    id v7 = (id)v8;
  }
  id v13 = v7;
  v11 = +[NSNumber numberWithUnsignedInt:v3];
  [v13 addObject:v11];
}

- (NSData)mtlfxTracingInfo
{
  mtlfxTracingDictionary = self->_mtlfxTracingDictionary;
  uint64_t v5 = 0;
  uint64_t v3 = +[NSKeyedArchiver archivedDataWithRootObject:mtlfxTracingDictionary requiringSecureCoding:1 error:&v5];

  return (NSData *)v3;
}

- (GTMTLFXTracingDelegate)init
{
  v6.receiver = self;
  v6.super_class = (Class)GTMTLFXTracingDelegate;
  v2 = [(GTMTLFXTracingDelegate *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    mtlfxTracingDictionary = v2->_mtlfxTracingDictionary;
    v2->_mtlfxTracingDictionary = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end