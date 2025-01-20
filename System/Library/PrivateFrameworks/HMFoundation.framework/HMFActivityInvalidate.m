@interface HMFActivityInvalidate
@end

@implementation HMFActivityInvalidate

void ____HMFActivityInvalidate_block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = mach_continuous_time();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    uint64_t v4 = *(void *)(v3 + 96);
  }
  else {
    uint64_t v4 = 0;
  }
  *(void *)info = 0;
  uint64_t v5 = mach_timebase_info((mach_timebase_info_t)info);
  uint64_t v6 = *(unsigned int *)info;
  unint64_t v7 = *(unsigned int *)&info[4];
  v8 = (void *)MEMORY[0x19F3A87A0](v5);
  id v9 = *(id *)(a1 + 32);
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    double v11 = (double)((v2 - v4) * v6 / v7) / 1000000000.0;
    v12 = HMFGetLogIdentifier(v9);
    *(_DWORD *)info = 138543618;
    *(void *)&info[4] = v12;
    __int16 v28 = 2048;
    double v29 = v11;
    _os_log_impl(&dword_19D57B000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Invalidated after %fs", info, 0x16u);
  }
  uint64_t v13 = *(void *)(a1 + 32);
  if ((*(unsigned char *)(v13 + 80) & 4) != 0)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
  }
  else
  {
    v14 = [(id)v13 parent];
    v15 = [*(id *)(a1 + 32) shortDescription];
    [v14 markWithFormat:@"Stopped child activity: %@", v15];

    uint64_t v13 = *(void *)(a1 + 32);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    if (!v13)
    {
      v16 = 0;
      goto LABEL_10;
    }
  }
  v16 = *(void **)(v13 + 88);
LABEL_10:
  id v17 = v16;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v23;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(v17);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * v21++) invalidate];
      }
      while (v19 != v21);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v19);
  }
}

@end