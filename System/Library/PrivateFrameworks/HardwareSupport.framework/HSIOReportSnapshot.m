@interface HSIOReportSnapshot
+ (id)report:(id *)a3;
+ (id)reportWithOnlySimpleChannels:(id *)a3;
+ (id)snapshotReport:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSnapshot:(id)a3;
- (HSIOReportSnapshot)snapshotWithBaseline:(id)a3 error:(id *)a4;
- (NSArray)samples;
- (id)reportWithOnlySimpleChannels;
- (id)snapshotByFilteringSamples:(id)a3;
- (unint64_t)hash;
- (void)setSamples:(id)a3;
@end

@implementation HSIOReportSnapshot

+ (id)snapshotReport:(id)a3 error:(id *)a4
{
  v6 = objc_msgSend(a3, "reportDictionary", 0);
  Subscription = (const void *)IOReportCreateSubscription();

  if (Subscription)
  {
    id Samples = (id)IOReportCreateSamples();
    CFRelease(Subscription);
    if (Samples)
    {
      id v9 = objc_alloc((Class)a1);
      id v10 = (id)[Samples copy];
      v11 = (void *)[v9 initWithReportDictionary:v10];
    }
    else
    {
      id v10 = 0;
      if (a4)
      {
        id v10 = 0;
        v11 = 0;
        *a4 = v10;
      }
      else
      {
        v11 = 0;
      }
    }
  }
  else
  {
    id Samples = 0;
    if (a4)
    {
      id Samples = 0;
      v11 = 0;
      *a4 = Samples;
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

+ (id)report:(id *)a3
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___HSIOReportSnapshot;
  v4 = objc_msgSendSuper2(&v7, sel_report_);
  if (v4)
  {
    v5 = [(id)objc_opt_class() snapshotReport:v4 error:a3];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  v2 = [(HSIOReportSnapshot *)self samples];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HSIOReportSnapshot *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(HSIOReportSnapshot *)self isEqualToSnapshot:v4];
  }

  return v5;
}

- (BOOL)isEqualToSnapshot:(id)a3
{
  v4 = [a3 samples];
  BOOL v5 = [(HSIOReportSnapshot *)self samples];
  char v6 = [v4 isEqualToArray:v5];

  return v6;
}

- (HSIOReportSnapshot)snapshotWithBaseline:(id)a3 error:(id *)a4
{
  char v6 = [a3 reportDictionary];
  objc_super v7 = [(HSIOReport *)self reportDictionary];
  SamplesDelta = (void *)IOReportCreateSamplesDelta();

  if (SamplesDelta)
  {
    id v9 = objc_alloc((Class)objc_opt_class());
    id v10 = (id)[SamplesDelta copy];
    v11 = (void *)[v9 initWithReportDictionary:v10];
  }
  else
  {
    id v10 = 0;
    if (a4)
    {
      id v10 = 0;
      v11 = 0;
      *a4 = v10;
    }
    else
    {
      v11 = 0;
    }
  }

  return (HSIOReportSnapshot *)v11;
}

- (NSArray)samples
{
  samples = self->_samples;
  if (!samples)
  {
    v4 = [MEMORY[0x263EFF980] array];
    BOOL v5 = [(HSIOReport *)self reportDictionary];
    id v10 = v4;
    id v6 = v4;
    IOReportIterate();

    objc_super v7 = [v6 sortedArrayUsingComparator:&__block_literal_global_177];
    v8 = self->_samples;
    self->_samples = v7;

    samples = self->_samples;
  }

  return samples;
}

uint64_t __29__HSIOReportSnapshot_samples__block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = [[HSIORSample alloc] initWithIOReportSampleRef:a2];
  [*(id *)(a1 + 32) addObject:v3];

  return 0;
}

uint64_t __29__HSIOReportSnapshot_samples__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  BOOL v5 = [a2 channelDescription];
  id v6 = [v5 name];
  objc_super v7 = [v4 channelDescription];

  v8 = [v7 name];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

- (id)snapshotByFilteringSamples:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)[(HSIOReportSnapshot *)self copy];
  id v6 = [v5 reportDictionary];
  objc_super v7 = (void *)[v6 mutableCopy];

  v8 = [(HSIOReport *)self reportDictionary];
  v14 = v4;
  id v9 = v4;
  IOReportPrune();

  id v10 = objc_alloc((Class)objc_opt_class());
  v11 = (void *)[v7 copy];
  v12 = (void *)[v10 initWithReportDictionary:v11];

  return v12;
}

uint64_t __49__HSIOReportSnapshot_snapshotByFilteringSamples___block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = [[HSIORSample alloc] initWithIOReportSampleRef:a2];
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))()) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = 16;
  }

  return v4;
}

- (void)setSamples:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)reportWithOnlySimpleChannels:(id *)a3
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___HSIOReportSnapshot;
  uint64_t v4 = objc_msgSendSuper2(&v7, sel_reportWithOnlySimpleChannels_);
  if (v4)
  {
    BOOL v5 = [(id)objc_opt_class() snapshotReport:v4 error:a3];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)reportWithOnlySimpleChannels
{
  v4.receiver = self;
  v4.super_class = (Class)HSIOReportSnapshot;
  v2 = [(HSIOReport *)&v4 reportWithOnlySimpleChannels];

  return v2;
}

@end