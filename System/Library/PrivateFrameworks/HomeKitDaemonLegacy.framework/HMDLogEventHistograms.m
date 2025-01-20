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
    v4 = (void *)MEMORY[0x1E4F6A270];
    v5 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", &unk_1F2DC91A8, &unk_1F2DC91C0, &unk_1F2DC91D8, &unk_1F2DC91F0, &unk_1F2DC9208, &unk_1F2DC9220, &unk_1F2DC9238, &unk_1F2DC9250, &unk_1F2DC9268, &unk_1F2DC9280, &unk_1F2DC9298, &unk_1F2DC92B0, 0);
    uint64_t v6 = [v4 unsignedClosedOpenFixedIntervalMapper:v5];
    v7 = (void *)_memoryHistogram;
    _memoryHistogram = v6;

    v8 = (void *)MEMORY[0x1E4F6A270];
    v9 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", &unk_1F2DC92C8, &unk_1F2DC9298, &unk_1F2DC92E0, &unk_1F2DC92F8, &unk_1F2DC9310, &unk_1F2DC9328, &unk_1F2DC9340, &unk_1F2DC9358, &unk_1F2DC9370, &unk_1F2DC9388, &unk_1F2DC93A0, &unk_1F2DC93B8, &unk_1F2DC93D0, 0);
    uint64_t v10 = [v8 unsignedClosedOpenFixedIntervalMapper:v9];
    v11 = (void *)_latencyHistogram;
    _latencyHistogram = v10;

    v12 = (void *)MEMORY[0x1E4F6A270];
    v13 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", &unk_1F2DC91A8, &unk_1F2DC91C0, &unk_1F2DC91D8, &unk_1F2DC91F0, &unk_1F2DC93E8, &unk_1F2DC9208, &unk_1F2DC9400, &unk_1F2DC9418, &unk_1F2DC9430, &unk_1F2DC9220, 0);
    uint64_t v14 = [v12 unsignedClosedOpenFixedIntervalMapper:v13];
    v15 = (void *)_successRateHistogram;
    _successRateHistogram = v14;

    v16 = (void *)MEMORY[0x1E4F6A270];
    objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", &unk_1F2DC9448, &unk_1F2DC9460, &unk_1F2DC9478, &unk_1F2DC9490, &unk_1F2DC94A8, &unk_1F2DC91A8, &unk_1F2DC94C0, &unk_1F2DC94D8, &unk_1F2DC94F0, &unk_1F2DC9220, &unk_1F2DC92C8, &unk_1F2DC9298, &unk_1F2DC92B0, &unk_1F2DC9508, &unk_1F2DC9520, &unk_1F2DC9538, &unk_1F2DC9550,
      &unk_1F2DC9568,
    v17 = 0);
    uint64_t v18 = [v16 unsignedClosedOpenFixedIntervalMapper:v17];
    v19 = (void *)_lowVolumeHistogram;
    _lowVolumeHistogram = v18;

    v20 = (void *)MEMORY[0x1E4F6A270];
    v21 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", &unk_1F2DC9448, &unk_1F2DC91A8, &unk_1F2DC94F0, &unk_1F2DC9220, &unk_1F2DC92C8, &unk_1F2DC9298, &unk_1F2DC92B0, &unk_1F2DC9520, &unk_1F2DC9538, &unk_1F2DC9550, &unk_1F2DC9568, &unk_1F2DC9580, &unk_1F2DC9598, &unk_1F2DC95B0, &unk_1F2DC95C8, &unk_1F2DC95E0, 0);
    uint64_t v22 = [v20 unsignedClosedOpenFixedIntervalMapper:v21];
    v23 = (void *)_highVolumeHistogram;
    _highVolumeHistogram = v22;

    v24 = (void *)MEMORY[0x1E4F6A270];
    v25 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", &unk_1F2DC9448, &unk_1F2DC9460, &unk_1F2DC9478, &unk_1F2DC9490, &unk_1F2DC94A8, &unk_1F2DC91A8, &unk_1F2DC91C0, 0);
    uint64_t v26 = [v24 unsignedClosedOpenFixedIntervalMapper:v25];
    v27 = (void *)_configurationDataHistogram;
    _configurationDataHistogram = v26;

    v28 = (void *)MEMORY[0x1E4F6A270];
    v31 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", &unk_1F2DC95F8, &unk_1F2DC9538, &unk_1F2DC9550, &unk_1F2DC9568, &unk_1F2DC9580, &unk_1F2DC9598, &unk_1F2DC95B0, &unk_1F2DC95E0, &unk_1F2DC9610, &unk_1F2DC9628, &unk_1F2DC9640, &unk_1F2DC9658, &unk_1F2DC9670, &unk_1F2DC9688, 0);
    uint64_t v29 = [v28 unsignedOpenClosedFixedIntervalMapper:v31];
    v30 = (void *)_fileSizeHistogram;
    _fileSizeHistogram = v29;
  }
}

@end