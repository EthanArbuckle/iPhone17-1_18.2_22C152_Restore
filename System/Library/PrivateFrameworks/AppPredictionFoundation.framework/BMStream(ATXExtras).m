@interface BMStream(ATXExtras)
- (id)atx_DSLPublisher;
- (id)atx_dateOfLastEvent;
- (id)atx_publisherFromStartTime:()ATXExtras;
- (id)atx_publisherWithStartDate:()ATXExtras endDate:maxEvents:lastN:reversed:;
- (id)atx_publisherWithStartTime:()ATXExtras endTime:maxEvents:lastN:reversed:;
- (uint64_t)atx_publisherFromStartDate:()ATXExtras;
@end

@implementation BMStream(ATXExtras)

- (id)atx_publisherWithStartDate:()ATXExtras endDate:maxEvents:lastN:reversed:
{
  v12 = (void *)MEMORY[0x1E4F28F80];
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = [v12 processInfo];
  v18 = [v17 processName];
  int v19 = [v18 isEqualToString:@"SpringBoard"];

  if (v19)
  {
    id v20 = objc_alloc(MEMORY[0x1E4F503E8]);
    uint64_t v21 = [v14 integerValue];

    uint64_t v22 = [v13 integerValue];
    v23 = (void *)[v20 initWithStartDate:v16 endDate:v15 maxEvents:v21 lastN:v22 reversed:a7];

    [a1 publisherWithOptions:v23];
  }
  else
  {
    id v24 = objc_alloc(MEMORY[0x1E4F503E8]);
    uint64_t v25 = [v14 integerValue];

    uint64_t v26 = [v13 integerValue];
    v23 = (void *)[v24 initWithStartDate:v16 endDate:v15 maxEvents:v25 lastN:v26 reversed:a7];

    [a1 publisherWithUseCase:@"ProactiveAppPrediction" options:v23];
  v27 = };

  return v27;
}

- (id)atx_DSLPublisher
{
  v2 = [MEMORY[0x1E4F28F80] processInfo];
  v3 = [v2 processName];
  int v4 = [v3 isEqualToString:@"SpringBoard"];

  if (v4) {
    [a1 DSLPublisher];
  }
  else {
  v5 = [a1 DSLPublisherWithUseCase:@"ProactiveAppPrediction"];
  }
  return v5;
}

- (id)atx_publisherFromStartTime:()ATXExtras
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [v4 doubleValue];
    v6 = objc_msgSend(v5, "initWithTimeIntervalSinceReferenceDate:");
    v7 = objc_msgSend(a1, "atx_publisherFromStartDate:", v6);
  }
  else
  {
    v7 = objc_msgSend(a1, "atx_publisherFromStartDate:", 0);
  }

  return v7;
}

- (id)atx_publisherWithStartTime:()ATXExtras endTime:maxEvents:lastN:reversed:
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v12)
  {
    id v16 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [v12 doubleValue];
    v17 = objc_msgSend(v16, "initWithTimeIntervalSinceReferenceDate:");
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    v17 = 0;
    if (v13)
    {
LABEL_3:
      id v18 = objc_alloc(MEMORY[0x1E4F1C9C8]);
      [v13 doubleValue];
      int v19 = objc_msgSend(v18, "initWithTimeIntervalSinceReferenceDate:");
      id v20 = objc_msgSend(a1, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", v17, v19, v14, v15, a7);

      if (!v12) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  id v20 = objc_msgSend(a1, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", v17, 0, v14, v15, a7);
  if (v12) {
LABEL_4:
  }

LABEL_5:
  return v20;
}

- (uint64_t)atx_publisherFromStartDate:()ATXExtras
{
  return objc_msgSend(a1, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", a3, 0, 0, 0, 0);
}

- (id)atx_dateOfLastEvent
{
  v2 = (void *)MEMORY[0x1D25F3B80]();
  v3 = objc_msgSend(a1, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", 0, 0, &unk_1F2718F28, &unk_1F2718F28, 0);
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__0;
  id v13 = __Block_byref_object_dispose__0;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__BMStream_ATXExtras__atx_dateOfLastEvent__block_invoke;
  v8[3] = &unk_1E68A3808;
  v8[4] = a1;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__BMStream_ATXExtras__atx_dateOfLastEvent__block_invoke_5;
  v7[3] = &unk_1E68A3830;
  v7[4] = &v9;
  id v4 = (id)[v3 sinkWithCompletion:v8 shouldContinue:v7];
  id v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

@end