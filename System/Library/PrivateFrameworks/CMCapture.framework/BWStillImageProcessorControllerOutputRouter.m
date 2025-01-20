@interface BWStillImageProcessorControllerOutputRouter
- (BWStillImageProcessorControllerOutputRouter)initWithOutputSampleBufferRouter:(id)a3;
- (NSArray)bypassedProcessorsTypes;
- (id)outputSampleBufferRouter;
- (void)addBypassedProcessorType:(unint64_t)a3;
- (void)dealloc;
@end

@implementation BWStillImageProcessorControllerOutputRouter

- (BWStillImageProcessorControllerOutputRouter)initWithOutputSampleBufferRouter:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BWStillImageProcessorControllerOutputRouter;
  v4 = [(BWStillImageProcessorControllerOutputRouter *)&v6 init];
  if (v4) {
    v4->_outputSampleBufferRouter = (id)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWStillImageProcessorControllerOutputRouter;
  [(BWStillImageProcessorControllerOutputRouter *)&v3 dealloc];
}

- (void)addBypassedProcessorType:(unint64_t)a3
{
  bypassedProcessorTypes = self->_bypassedProcessorTypes;
  if (!bypassedProcessorTypes)
  {
    bypassedProcessorTypes = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    self->_bypassedProcessorTypes = bypassedProcessorTypes;
  }
  uint64_t v6 = [NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableArray *)bypassedProcessorTypes addObject:v6];
}

- (NSArray)bypassedProcessorsTypes
{
  v2 = (void *)[(NSMutableArray *)self->_bypassedProcessorTypes copy];
  return (NSArray *)v2;
}

- (id)outputSampleBufferRouter
{
  return self->_outputSampleBufferRouter;
}

@end