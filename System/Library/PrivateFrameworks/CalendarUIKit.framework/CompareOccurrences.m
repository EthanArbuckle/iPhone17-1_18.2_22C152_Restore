@interface CompareOccurrences
@end

@implementation CompareOccurrences

uint64_t CUIKSingleDayTimelineLayout_CompareOccurrences_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if ([v4 hideTravelTime]) {
    [v4 start];
  }
  else {
  v6 = [v4 startWithTravelTime];
  }
  if ([v5 hideTravelTime]) {
    [v5 start];
  }
  else {
  v7 = [v5 startWithTravelTime];
  }
  [v6 timeIntervalSinceReferenceDate];
  double v9 = v8;
  [v7 timeIntervalSinceReferenceDate];
  double v11 = v10;
  v12 = [v4 end];
  [v12 timeIntervalSinceReferenceDate];
  double v14 = v13;

  v15 = [v5 end];
  [v15 timeIntervalSinceReferenceDate];
  double v17 = v16;

  if (vabdd_f64(v17, v11) >= 2.22044605e-16)
  {
    double v18 = (v14 - v9) / (v17 - v11);
    if (v18 > 0.85 && v18 < 1.2)
    {
      if (v9 >= v11)
      {
        if (v9 <= v11) {
          goto LABEL_17;
        }
        goto LABEL_14;
      }
LABEL_16:
      uint64_t v19 = -1;
      goto LABEL_18;
    }
  }
  if (v14 >= v17)
  {
    if (v14 <= v17)
    {
LABEL_17:
      v20 = [v4 eventIdentifier];
      v21 = [v5 eventIdentifier];
      uint64_t v19 = [v20 compare:v21];

      goto LABEL_18;
    }
    goto LABEL_16;
  }
LABEL_14:
  uint64_t v19 = 1;
LABEL_18:

  return v19;
}

@end