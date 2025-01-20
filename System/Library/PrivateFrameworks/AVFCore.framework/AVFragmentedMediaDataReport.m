@interface AVFragmentedMediaDataReport
- (AVFragmentedMediaDataReport)init;
- (AVFragmentedMediaDataReport)initWithFigFragmentedMediaDataReportDictionary:(id)a3;
- (int64_t)numberOfBytesToEndOfFirstVideoFrame;
- (void)dealloc;
@end

@implementation AVFragmentedMediaDataReport

- (AVFragmentedMediaDataReport)init
{
  return [(AVFragmentedMediaDataReport *)self initWithFigFragmentedMediaDataReportDictionary:0];
}

- (AVFragmentedMediaDataReport)initWithFigFragmentedMediaDataReportDictionary:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)AVFragmentedMediaDataReport;
  v5 = [(AVFragmentedMediaDataReport *)&v16 init];
  v6 = v5;
  if (!a3)
  {
    v9 = v5;
    v15 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v6, a2, @"invalid parameter not satisfying: %s", v10, v11, v12, v13, v14, (uint64_t)"figFragmentedMediaDataReportDict != nil"), 0 reason userInfo];
    objc_exception_throw(v15);
  }
  if (v5)
  {
    v7 = objc_alloc_init(AVFragmentedMediaDataReportInternal);
    v6->_internal = v7;
    if (v7)
    {
      v6->_internal->figFragmentedMediaDataReportDict = (NSDictionary *)[a3 copy];
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  internal = self->_internal;
  if (internal)
  {

    internal = self->_internal;
  }

  v4.receiver = self;
  v4.super_class = (Class)AVFragmentedMediaDataReport;
  [(AVFragmentedMediaDataReport *)&v4 dealloc];
}

- (int64_t)numberOfBytesToEndOfFirstVideoFrame
{
  int64_t result = [(NSDictionary *)self->_internal->figFragmentedMediaDataReportDict valueForKey:*MEMORY[0x1E4F32500]];
  if (result)
  {
    return [(id)result integerValue];
  }
  return result;
}

@end