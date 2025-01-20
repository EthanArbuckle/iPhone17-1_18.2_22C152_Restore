@interface HMDLogEventHistograms
+ (HMMIntervalMapper)configurationDataHistogram;
+ (HMMIntervalMapper)fileSizeHistogram;
+ (HMMIntervalMapper)highVolumeHistogram;
+ (HMMIntervalMapper)latencyHistogram;
+ (HMMIntervalMapper)lowVolumeHistogram;
+ (HMMIntervalMapper)memoryHistogram;
+ (HMMIntervalMapper)successRateHistogram;
+ (void)initialize;
@end

@implementation HMDLogEventHistograms

+ (HMMIntervalMapper)fileSizeHistogram
{
  return (HMMIntervalMapper *)(id)_fileSizeHistogram;
}

+ (HMMIntervalMapper)configurationDataHistogram
{
  return (HMMIntervalMapper *)(id)_configurationDataHistogram;
}

+ (HMMIntervalMapper)highVolumeHistogram
{
  return (HMMIntervalMapper *)(id)_highVolumeHistogram;
}

+ (HMMIntervalMapper)lowVolumeHistogram
{
  return (HMMIntervalMapper *)(id)_lowVolumeHistogram;
}

+ (HMMIntervalMapper)successRateHistogram
{
  return (HMMIntervalMapper *)(id)_successRateHistogram;
}

+ (HMMIntervalMapper)latencyHistogram
{
  return (HMMIntervalMapper *)(id)_latencyHistogram;
}

+ (HMMIntervalMapper)memoryHistogram
{
  return (HMMIntervalMapper *)(id)_memoryHistogram;
}

+ (void)initialize
{
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    v4 = (void *)MEMORY[0x263F499B0];
    v5 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", &unk_26E472B98, &unk_26E472BB0, &unk_26E472BC8, &unk_26E472BE0, &unk_26E472BF8, &unk_26E472C10, &unk_26E472C28, &unk_26E472C40, &unk_26E472C58, &unk_26E472C70, &unk_26E472C88, &unk_26E472CA0, 0);
    uint64_t v6 = [v4 unsignedClosedOpenFixedIntervalMapper:v5];
    v7 = (void *)_memoryHistogram;
    _memoryHistogram = v6;

    v8 = (void *)MEMORY[0x263F499B0];
    v9 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", &unk_26E472CB8, &unk_26E472C88, &unk_26E472CD0, &unk_26E472CE8, &unk_26E472D00, &unk_26E472D18, &unk_26E472D30, &unk_26E472D48, &unk_26E472D60, &unk_26E472D78, &unk_26E472D90, &unk_26E472DA8, &unk_26E472DC0, 0);
    uint64_t v10 = [v8 unsignedClosedOpenFixedIntervalMapper:v9];
    v11 = (void *)_latencyHistogram;
    _latencyHistogram = v10;

    v12 = (void *)MEMORY[0x263F499B0];
    v13 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", &unk_26E472B98, &unk_26E472BB0, &unk_26E472BC8, &unk_26E472BE0, &unk_26E472DD8, &unk_26E472BF8, &unk_26E472DF0, &unk_26E472E08, &unk_26E472E20, &unk_26E472C10, 0);
    uint64_t v14 = [v12 unsignedClosedOpenFixedIntervalMapper:v13];
    v15 = (void *)_successRateHistogram;
    _successRateHistogram = v14;

    v16 = (void *)MEMORY[0x263F499B0];
    objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", &unk_26E472E38, &unk_26E472E50, &unk_26E472E68, &unk_26E472E80, &unk_26E472E98, &unk_26E472B98, &unk_26E472EB0, &unk_26E472EC8, &unk_26E472EE0, &unk_26E472C10, &unk_26E472CB8, &unk_26E472C88, &unk_26E472CA0, &unk_26E472EF8, &unk_26E472F10, &unk_26E472F28, &unk_26E472F40,
      &unk_26E472F58,
    v17 = 0);
    uint64_t v18 = [v16 unsignedClosedOpenFixedIntervalMapper:v17];
    v19 = (void *)_lowVolumeHistogram;
    _lowVolumeHistogram = v18;

    v20 = (void *)MEMORY[0x263F499B0];
    v21 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", &unk_26E472E38, &unk_26E472B98, &unk_26E472EE0, &unk_26E472C10, &unk_26E472CB8, &unk_26E472C88, &unk_26E472CA0, &unk_26E472F10, &unk_26E472F28, &unk_26E472F40, &unk_26E472F58, &unk_26E472F70, &unk_26E472F88, &unk_26E472FA0, &unk_26E472FB8, &unk_26E472FD0, 0);
    uint64_t v22 = [v20 unsignedClosedOpenFixedIntervalMapper:v21];
    v23 = (void *)_highVolumeHistogram;
    _highVolumeHistogram = v22;

    v24 = (void *)MEMORY[0x263F499B0];
    v25 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", &unk_26E472E38, &unk_26E472E50, &unk_26E472E68, &unk_26E472E80, &unk_26E472E98, &unk_26E472B98, &unk_26E472BB0, 0);
    uint64_t v26 = [v24 unsignedClosedOpenFixedIntervalMapper:v25];
    v27 = (void *)_configurationDataHistogram;
    _configurationDataHistogram = v26;

    v28 = (void *)MEMORY[0x263F499B0];
    v31 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", &unk_26E472FE8, &unk_26E472F28, &unk_26E472F40, &unk_26E472F58, &unk_26E472F70, &unk_26E472F88, &unk_26E472FA0, &unk_26E472FD0, 0x26E473000, &unk_26E473018, &unk_26E473030, &unk_26E473048, &unk_26E473060, &unk_26E473078, 0);
    uint64_t v29 = [v28 unsignedOpenClosedFixedIntervalMapper:v31];
    v30 = (void *)_fileSizeHistogram;
    _fileSizeHistogram = v29;
  }
}

@end