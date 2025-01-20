@interface BWInferenceSchedulerJobList
- ($B3E1125BAEE9BC7E13D71BCD3C96504F)jobAtIndex:(unint64_t)a3;
- (BWInferenceSchedulerJobList)initWithCapacity:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)dealloc;
@end

@implementation BWInferenceSchedulerJobList

- ($B3E1125BAEE9BC7E13D71BCD3C96504F)jobAtIndex:(unint64_t)a3
{
  if ([(BWInferenceSchedulerJobList *)self count] <= a3) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Job index out of bounds" userInfo:0]);
  }
  return &self->_orderedJobs[a3];
}

- (unint64_t)count
{
  return self->_jobCount;
}

- (BWInferenceSchedulerJobList)initWithCapacity:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BWInferenceSchedulerJobList;
  v4 = [(BWInferenceSchedulerJobList *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_jobCount = a3;
    v6 = ($B3E1125BAEE9BC7E13D71BCD3C96504F *)malloc_type_calloc(a3, 0x18uLL, 0x1080040CC6EE3FDuLL);
    v5->_mutations = v5->_jobCount;
    v5->_orderedJobs = v6;
  }
  return v5;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  a3->var1 = a4;
  a3->var2 = &self->_mutations;
  unint64_t var0 = a3->var0;
  if (a3->var0 >= self->_jobCount || a5 == 0) {
    return 0;
  }
  uint64_t v8 = 0;
  do
  {
    orderedJobs = self->_orderedJobs;
    a3->unint64_t var0 = var0 + 1;
    a4[v8] = &orderedJobs[var0];
    unint64_t v7 = v8 + 1;
    unint64_t var0 = a3->var0;
    BOOL v10 = a3->var0 >= self->_jobCount || v7 >= a5;
    ++v8;
  }
  while (!v10);
  return v7;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  unint64_t v3 = [(BWInferenceSchedulerJobList *)self countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    unint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(self);
        }
        unint64_t v7 = *(id **)(*((void *)&v9 + 1) + 8 * v6);

        ++v6;
      }
      while (v4 != v6);
      unint64_t v4 = [(BWInferenceSchedulerJobList *)self countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  free(self->_orderedJobs);
  v8.receiver = self;
  v8.super_class = (Class)BWInferenceSchedulerJobList;
  [(BWInferenceSchedulerJobList *)&v8 dealloc];
}

@end