@interface BWInferenceSchedulerFramebuffer
- (BWInferenceSchedulerFramebuffer)initWithGraph:(id)a3 jobList:(id)a4;
- (BWInferenceSchedulerGraph)graph;
- (BWInferenceSchedulerJobList)jobs;
- (void)dealloc;
- (void)resetJobStatesWithPreventionBlock:(id)a3;
@end

@implementation BWInferenceSchedulerFramebuffer

- (BWInferenceSchedulerJobList)jobs
{
  return self->_jobs;
}

- (BWInferenceSchedulerGraph)graph
{
  return self->_graph;
}

- (void)resetJobStatesWithPreventionBlock:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  atomic_store(0, (unsigned int *)&self->failedJobStatus);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  jobs = self->_jobs;
  uint64_t v5 = [(BWInferenceSchedulerJobList *)jobs countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(jobs);
        }
        v9 = *(unsigned char **)(*((void *)&v12 + 1) + 8 * i);
        unsigned __int8 v10 = v9[21];
        if ((*((unsigned int (**)(id, unsigned char *))a3 + 2))(a3, v9)) {
          unsigned __int8 v11 = 4;
        }
        else {
          unsigned __int8 v11 = v10 == 0;
        }
        atomic_store(v11, v9 + 22);
        atomic_store(v10, v9 + 23);
      }
      uint64_t v6 = [(BWInferenceSchedulerJobList *)jobs countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (BWInferenceSchedulerFramebuffer)initWithGraph:(id)a3 jobList:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)BWInferenceSchedulerFramebuffer;
  uint64_t v6 = [(BWInferenceSchedulerFramebuffer *)&v9 init];
  uint64_t v7 = v6;
  if (v6)
  {
    v6->framebufferLock._os_unfair_lock_opaque = 0;
    v6->_jobs = (BWInferenceSchedulerJobList *)a4;
    v7->_graph = (BWInferenceSchedulerGraph *)a3;
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWInferenceSchedulerFramebuffer;
  [(BWInferenceSchedulerFramebuffer *)&v3 dealloc];
}

@end