@interface EKObjectValidationContext
- (BOOL)reachedMaxDepth;
- (EKObject)rootObject;
- (EKObjectValidationContext)initWithRootObject:(id)a3;
- (unint64_t)depth;
- (void)faultIfNeededForObject:(id)a3;
- (void)setDepth:(unint64_t)a3;
- (void)setReachedMaxDepth:(BOOL)a3;
@end

@implementation EKObjectValidationContext

- (EKObjectValidationContext)initWithRootObject:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKObjectValidationContext;
  v6 = [(EKObjectValidationContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_rootObject, a3);
  }

  return v7;
}

- (void)faultIfNeededForObject:(id)a3
{
  id v4 = a3;
  if ([(EKObjectValidationContext *)self reachedMaxDepth])
  {
    id v5 = [(EKObjectValidationContext *)self rootObject];

    if (v5 == v4)
    {
      v6 = (void *)EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_FAULT)) {
        -[EKObjectValidationContext faultIfNeededForObject:](v6, v4);
      }
    }
  }
}

- (EKObject)rootObject
{
  return self->_rootObject;
}

- (unint64_t)depth
{
  return self->_depth;
}

- (void)setDepth:(unint64_t)a3
{
  self->_depth = a3;
}

- (BOOL)reachedMaxDepth
{
  return self->_reachedMaxDepth;
}

- (void)setReachedMaxDepth:(BOOL)a3
{
  self->_reachedMaxDepth = a3;
}

- (void).cxx_destruct
{
}

- (void)faultIfNeededForObject:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = a1;
  id v4 = [a2 privacyDescription];
  int v5 = 138543362;
  v6 = v4;
  _os_log_fault_impl(&dword_1A4E47000, v3, OS_LOG_TYPE_FAULT, "Reached maximum depth while validating root object %{public}@", (uint8_t *)&v5, 0xCu);
}

@end