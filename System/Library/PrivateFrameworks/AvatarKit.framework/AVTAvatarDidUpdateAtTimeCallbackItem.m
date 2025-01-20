@interface AVTAvatarDidUpdateAtTimeCallbackItem
- (BOOL)firstExecutionHasCompleted;
- (double)firstExecutionTime;
- (uint64_t)setFirstExecutionHasCompleted:(uint64_t)result;
- (uint64_t)setFirstExecutionTime:(uint64_t)result;
- (void)setKey:(void *)a1;
@end

@implementation AVTAvatarDidUpdateAtTimeCallbackItem

- (BOOL)firstExecutionHasCompleted
{
  if (result) {
    return *(unsigned char *)(result + 8) != 0;
  }
  return result;
}

- (uint64_t)setFirstExecutionHasCompleted:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 8) = a2;
  }
  return result;
}

- (double)firstExecutionTime
{
  if (a1) {
    return *(double *)(a1 + 16);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)setFirstExecutionTime:(uint64_t)result
{
  if (result) {
    *(double *)(result + 16) = a2;
  }
  return result;
}

- (void)setKey:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 24);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

@end