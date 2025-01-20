@interface HMDLogEventWeekBasedFilter
- (BOOL)isEventInSample:(id)a3;
- (HMDLogEventWeekBasedFilter)initWithDateProvider:(id)a3;
- (HMMDateProvider)dateProvider;
- (unint64_t)resultHashWithEvent:(id)a3;
@end

@implementation HMDLogEventWeekBasedFilter

- (void).cxx_destruct
{
}

- (HMMDateProvider)dateProvider
{
  return self->_dateProvider;
}

- (BOOL)isEventInSample:(id)a3
{
  id v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v4 enableEventFilterSpecifying])
  {
    id v5 = v4;
    if ([v5 conformsToProtocol:&unk_1F2DE0D18]) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
    id v7 = v6;

    if (v7)
    {
      unint64_t v8 = [(HMDLogEventWeekBasedFilter *)self resultHashWithEvent:v7] % 7 + 1;
      v9 = [(HMDLogEventWeekBasedFilter *)self dateProvider];
      uint64_t v10 = [v9 currentDayNumberOfWeek];

      BOOL v11 = v8 == v10;
    }
    else
    {
      BOOL v11 = 1;
    }
  }
  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

- (unint64_t)resultHashWithEvent:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA58];
  id v5 = a3;
  v6 = [v5 sampledUUID];
  id v7 = objc_msgSend(v6, "hm_convertToData");
  unint64_t v8 = [v4 dataWithData:v7];

  v9 = [(HMDLogEventWeekBasedFilter *)self dateProvider];
  uint64_t v10 = [v9 startOfCurrentWeek];
  uint64_t v11 = [v10 hash];

  uint64_t v19 = v11;
  [v8 appendBytes:&v19 length:8];
  v12 = [v5 sampledCategory];
  v13 = [v12 dataUsingEncoding:4];
  [v8 appendData:v13];

  v14 = [v5 sampledData];

  [v8 appendData:v14];
  v15 = objc_msgSend(v8, "hm_generateSHA256");
  unint64_t v18 = 0;
  [v15 getBytes:&v18 length:8];
  unint64_t v16 = v18;

  return v16;
}

- (HMDLogEventWeekBasedFilter)initWithDateProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDLogEventWeekBasedFilter;
  v6 = [(HMDLogEventWeekBasedFilter *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dateProvider, a3);
  }

  return v7;
}

@end