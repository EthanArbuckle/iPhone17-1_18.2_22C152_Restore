@interface HMFActivity(HMMTaggedLogging)
+ (id)currentTagProcessorList;
- (id)tagProcessorList;
@end

@implementation HMFActivity(HMMTaggedLogging)

- (id)tagProcessorList
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__1261;
  v8 = __Block_byref_object_dispose__1262;
  id v9 = 0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__HMFActivity_HMMTaggedLogging__tagProcessorList__block_invoke;
  v3[3] = &unk_1E69FD748;
  v3[4] = a1;
  v3[5] = &v4;
  [a1 synchronizeWithActivityLock:v3];
  id v1 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v1;
}

+ (id)currentTagProcessorList
{
  v0 = [MEMORY[0x1E4F653F0] _currentActivity];
  id v1 = [v0 tagProcessorList];

  return v1;
}

@end