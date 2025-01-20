@interface HMCharacteristicThresholdRangeEvent(HFAdditions)
- (uint64_t)hf_wouldFireForValue:()HFAdditions;
@end

@implementation HMCharacteristicThresholdRangeEvent(HFAdditions)

- (uint64_t)hf_wouldFireForValue:()HFAdditions
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  v5 = [a1 characteristic];
  v6 = [v5 metadata];

  v7 = objc_msgSend(v6, "hf_valueRoundedToNearestStepValue:", v4);

  v8 = [a1 thresholdRange];
  v9 = [v8 minValue];

  if (v9)
  {
    v10 = [a1 thresholdRange];
    v11 = [v10 minValue];
    v12 = objc_msgSend(v6, "hf_valueRoundedToNearestStepValue:", v11);

    [v7 doubleValue];
    double v14 = v13;
    [v12 doubleValue];
    double v16 = v15 + -0.00000011920929;

    if (v14 < v16) {
      goto LABEL_8;
    }
  }
  v17 = [a1 thresholdRange];
  v18 = [v17 maxValue];

  if (!v18) {
    goto LABEL_6;
  }
  v19 = [a1 thresholdRange];
  v20 = [v19 maxValue];
  v21 = objc_msgSend(v6, "hf_valueRoundedToNearestStepValue:", v20);

  [v7 doubleValue];
  double v23 = v22;
  [v21 doubleValue];
  double v25 = v24 + 0.00000011920929;

  if (v23 > v25) {
LABEL_8:
  }
    uint64_t v26 = 0;
  else {
LABEL_6:
  }
    uint64_t v26 = 1;

  return v26;
}

@end