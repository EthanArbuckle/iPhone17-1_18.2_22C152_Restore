@interface CIRenderInfo
+ (CIRenderInfo)renderInfoWithCompletedTask:(id)a3;
- (CIRenderInfo)init;
- (CIRenderInfo)initWithCompletedTask:(id)a3;
- (NSInteger)passCount;
- (NSInteger)pixelsProcessed;
- (NSTimeInterval)kernelCompileTime;
- (NSTimeInterval)kernelExecutionTime;
- (id)_pdfDataRepresentation;
- (id)description;
- (int64_t)kernelExecutionCycles;
- (int64_t)pixelsOverdrawn;
- (void)dealloc;
- (void)init;
@end

@implementation CIRenderInfo

+ (CIRenderInfo)renderInfoWithCompletedTask:(id)a3
{
  v3 = [[CIRenderInfo alloc] initWithCompletedTask:a3];

  return v3;
}

- (CIRenderInfo)initWithCompletedTask:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CIRenderInfo;
  v4 = [(CIRenderInfo *)&v7 init];
  if (v4)
  {
    uint64_t v5 = [a3 internalRepresentation];
    if (v5) {
      uint64_t v5 = CI::Object::ref(v5);
    }
    v4->_priv = (void *)v5;
  }
  return v4;
}

- (void)dealloc
{
  priv = (CI::Object *)self->_priv;
  if (priv)
  {
    CI::Object::unref(priv);
    self->_priv = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CIRenderInfo;
  [(CIRenderInfo *)&v4 dealloc];
}

- (CIRenderInfo)init
{
  v3 = ci_logger_api();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    [(CIRenderInfo *)v3 init];
  }

  return 0;
}

- (NSTimeInterval)kernelExecutionTime
{
  return *((double *)self->_priv + 21);
}

- (NSTimeInterval)kernelCompileTime
{
  return *((double *)self->_priv + 22);
}

- (int64_t)kernelExecutionCycles
{
  return *((void *)self->_priv + 24);
}

- (NSInteger)passCount
{
  return *((void *)self->_priv + 25);
}

- (NSInteger)pixelsProcessed
{
  return *((void *)self->_priv + 26);
}

- (int64_t)pixelsOverdrawn
{
  return *((void *)self->_priv + 27);
}

- (id)description
{
  priv = self->_priv;
  if (priv)
  {
    v3 = (void *)[NSString stringWithFormat:@"<%@: %p> {\n  passCount: %ld \n  pixelsProcessed: %ld \n", objc_msgSend((id)objc_opt_class(), "description"), self, *((void *)priv + 25), *((void *)priv + 26)];
    double v4 = *((double *)priv + 21);
    if (v4 > 0.0) {
      v3 = objc_msgSend(v3, "stringByAppendingFormat:", @"  kernelExecutionTime: %.3fms \n", v4 * 1000.0);
    }
    double v5 = *((double *)priv + 23);
    if (v5 > 0.0) {
      v3 = objc_msgSend(v3, "stringByAppendingFormat:", @"  compileWaitTime: %.3fms \n", v5 * 1000.0);
    }
    double v6 = *((double *)priv + 22);
    if (v6 > 0.0) {
      v3 = objc_msgSend(v3, "stringByAppendingFormat:", @"  compileTime: %.3fms \n", v6 * 1000.0);
    }
    return (id)[v3 stringByAppendingString:@"}\n"];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CIRenderInfo;
    return [(CIRenderInfo *)&v8 description];
  }
}

- (id)_pdfDataRepresentation
{
  v2 = (void *)CI::RenderTask::quicklookDataForRenderInfo((CI::RenderTask *)self->_priv);

  return v2;
}

- (void)init
{
}

@end