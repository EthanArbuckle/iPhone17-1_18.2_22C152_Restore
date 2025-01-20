@interface AXMVisionFeatureComparator
- (int64_t)compareInitialResult:(id)a3 withFinalResult:(id)a4 indexOfUnequalItem:(int64_t *)a5 sortInitialResult:(BOOL)a6 sortFinalResult:(BOOL)a7;
@end

@implementation AXMVisionFeatureComparator

- (int64_t)compareInitialResult:(id)a3 withFinalResult:(id)a4 indexOfUnequalItem:(int64_t *)a5 sortInitialResult:(BOOL)a6 sortFinalResult:(BOOL)a7
{
  id v10 = a3;
  id v11 = a4;
  if (a6)
  {
    v12 = [v10 sortedFeatures];
    [v11 sortedFeatures];
  }
  else
  {
    v12 = [v10 features];
    [v11 features];
  v13 = };
  uint64_t v14 = [v12 count];
  uint64_t v15 = [v13 count];
  if (v14 < v15)
  {
    int64_t v16 = -1;
    int64_t v17 = 1;
    if (!a5) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (v14 > v15)
  {
    int64_t v16 = -1;
    int64_t v17 = 2;
    if (!a5) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (v14 < 1)
  {
    int64_t v17 = 0;
    int64_t v16 = -1;
    if (!a5) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  v22 = a5;
  int64_t v16 = 0;
  int64_t v17 = 3;
  while (1)
  {
    v18 = [v12 objectAtIndex:v16];
    v19 = [v13 objectAtIndex:v16];
    int v20 = [v18 isEqual:v19];

    if (!v20) {
      break;
    }
    if (v14 == ++v16)
    {
      int64_t v17 = 0;
      int64_t v16 = -1;
      break;
    }
  }
  a5 = v22;
  if (v22) {
LABEL_16:
  }
    *a5 = v16;
LABEL_17:

  return v17;
}

@end