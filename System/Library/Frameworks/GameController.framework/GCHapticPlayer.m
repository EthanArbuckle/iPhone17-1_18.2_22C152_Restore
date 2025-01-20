@interface GCHapticPlayer
@end

@implementation GCHapticPlayer

uint64_t __35___GCHapticPlayer_scheduleCommand___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 time];
  double v7 = v6;
  [v5 time];
  if (v7 >= v8)
  {
    [v4 time];
    double v11 = v10;
    [v5 time];
    if (v11 <= v12) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = -1;
    }
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

@end