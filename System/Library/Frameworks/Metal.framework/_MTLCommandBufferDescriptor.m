@interface _MTLCommandBufferDescriptor
- (BOOL)captureProgramAddressTable;
- (BOOL)cloneIntersectionFunctionTablesPerDispatch;
- (BOOL)disableFineGrainedComputePreemption;
- (BOOL)retainedReferences;
- (MTLDeadlineProfile)deadlineProfile;
- (_MTLCommandBufferDescriptor)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)logState;
- (unint64_t)errorOptions;
- (void)dealloc;
- (void)setCaptureProgramAddressTable:(BOOL)a3;
- (void)setCloneIntersectionFunctionTablesPerDispatch:(BOOL)a3;
- (void)setDeadlineProfile:(id)a3;
- (void)setDisableFineGrainedComputePreemption:(BOOL)a3;
- (void)setErrorOptions:(unint64_t)a3;
- (void)setLogState:(id)a3;
- (void)setRetainedReferences:(BOOL)a3;
@end

@implementation _MTLCommandBufferDescriptor

- (id)logState
{
  return self->_logState;
}

- (BOOL)retainedReferences
{
  return self->_retainedReferences;
}

- (unint64_t)errorOptions
{
  return self->_errorOptions;
}

- (BOOL)disableFineGrainedComputePreemption
{
  return self->_disableFineGrainedComputePreemption;
}

- (MTLDeadlineProfile)deadlineProfile
{
  return self->_deadlineProfile;
}

- (BOOL)cloneIntersectionFunctionTablesPerDispatch
{
  return self->_cloneIntersectionFunctionTablesPerDispatch;
}

- (BOOL)captureProgramAddressTable
{
  return self->_captureProgramAddressTable;
}

- (void)setRetainedReferences:(BOOL)a3
{
  self->_retainedReferences = a3;
}

- (void)setErrorOptions:(unint64_t)a3
{
  self->_errorOptions = a3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_MTLCommandBufferDescriptor;
  [(_MTLCommandBufferDescriptor *)&v3 dealloc];
}

- (_MTLCommandBufferDescriptor)init
{
  v3.receiver = self;
  v3.super_class = (Class)_MTLCommandBufferDescriptor;
  result = [(_MTLCommandBufferDescriptor *)&v3 init];
  if (result)
  {
    result->_errorOptions = 0;
    result->_retainedReferences = 1;
    result->_captureProgramAddressTable = 0;
    result->_cloneIntersectionFunctionTablesPerDispatch = 0;
    result->_disableFineGrainedComputePreemption = 0;
    result->_deadlineProfile = 0;
    result->_logState = 0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    [v4 setRetainedReferences:self->_retainedReferences];
    [v5 setErrorOptions:self->_errorOptions];
    [v5 setCaptureProgramAddressTable:self->_captureProgramAddressTable];
    [v5 setCloneIntersectionFunctionTablesPerDispatch:self->_cloneIntersectionFunctionTablesPerDispatch];
    [v5 setDisableFineGrainedComputePreemption:self->_disableFineGrainedComputePreemption];
    [v5 setDeadlineProfile:self->_deadlineProfile];
    [v5 setLogState:self->_logState];
  }
  return v5;
}

- (void)setCaptureProgramAddressTable:(BOOL)a3
{
  self->_captureProgramAddressTable = a3;
}

- (void)setCloneIntersectionFunctionTablesPerDispatch:(BOOL)a3
{
  self->_cloneIntersectionFunctionTablesPerDispatch = a3;
}

- (void)setDeadlineProfile:(id)a3
{
  self->_deadlineProfile = (MTLDeadlineProfile *)a3;
}

- (void)setDisableFineGrainedComputePreemption:(BOOL)a3
{
  self->_disableFineGrainedComputePreemption = a3;
}

- (void)setLogState:(id)a3
{
}

@end