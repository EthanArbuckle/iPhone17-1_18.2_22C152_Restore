@interface HMMBufferingLogEventSubmitter
- (HMMBufferingLogEventSubmitter)init;
- (HMMBufferingLogEventSubmitter)initWithBufferSize:(int64_t)a3;
- (void)processLogEventsWithSubmitter:(id)a3;
- (void)submitLogEvent:(id)a3;
- (void)submitLogEvent:(id)a3 error:(id)a4;
@end

@implementation HMMBufferingLogEventSubmitter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submitter, 0);
  objc_storeStrong((id *)&self->_bufferedLogEvents, 0);
}

- (void)processLogEventsWithSubmitter:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = self->_bufferedLogEvents;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "submitLogEvent:", *(void *)(*((void *)&v11 + 1) + 8 * v8++), (void)v11);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  bufferedLogEvents = self->_bufferedLogEvents;
  self->_bufferedLogEvents = 0;

  submitter = self->_submitter;
  self->_submitter = (HMMLogEventSubmitting *)v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)submitLogEvent:(id)a3 error:(id)a4
{
  id v6 = a3;
  [v6 setError:a4];
  [(HMMBufferingLogEventSubmitter *)self submitLogEvent:v6];
}

- (void)submitLogEvent:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  submitter = self->_submitter;
  if (submitter)
  {
    [(HMMLogEventSubmitting *)submitter submitLogEvent:v4];
  }
  else if ((unint64_t)[(NSMutableArray *)self->_bufferedLogEvents count] >= self->_bufferSize)
  {
    id v6 = (void *)MEMORY[0x1D944E970]();
    uint64_t v7 = self;
    HMFGetOSLogHandle();
    uint64_t v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      int64_t bufferSize = self->_bufferSize;
      int v11 = 138543618;
      long long v12 = v9;
      __int16 v13 = 2048;
      int64_t v14 = bufferSize;
      _os_log_impl(&dword_1D4999000, v8, OS_LOG_TYPE_ERROR, "%{public}@Log event not buffered. Buffer full, size: %ld", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    [(NSMutableArray *)self->_bufferedLogEvents addObject:v4];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (HMMBufferingLogEventSubmitter)initWithBufferSize:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)HMMBufferingLogEventSubmitter;
  id v4 = [(HMMBufferingLogEventSubmitter *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v4->_int64_t bufferSize = a3;
    uint64_t v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a3];
    bufferedLogEvents = v5->_bufferedLogEvents;
    v5->_bufferedLogEvents = (NSMutableArray *)v6;

    submitter = v5->_submitter;
    v5->_submitter = 0;
  }
  return v5;
}

- (HMMBufferingLogEventSubmitter)init
{
  return [(HMMBufferingLogEventSubmitter *)self initWithBufferSize:1000];
}

@end