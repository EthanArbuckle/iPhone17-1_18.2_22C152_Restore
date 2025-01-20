@interface AXLogWithThreshold
@end

@implementation AXLogWithThreshold

uint64_t ___AXLogWithThreshold_block_invoke()
{
  return [(id)_AXLogThresholdMap removeAllObjects];
}

void ___AXLogWithThreshold_block_invoke_2(uint64_t a1)
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v3 = v2;
  v4 = [(id)_AXLogThresholdMap objectForKey:*(void *)(a1 + 32)];
  id v14 = v4;
  if (v4)
  {
    v5 = [v4 objectForKeyedSubscript:@"repeatCount"];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v5 unsignedIntegerValue] + 1;

    v6 = [v14 objectForKeyedSubscript:@"time"];
    [v6 doubleValue];
    double v8 = v7;

    double v9 = v3 - v8;
    if (v3 - v8 >= *(double *)(a1 + 56))
    {
      objc_msgSend(v14, "setObject:forKeyedSubscript:", &unk_1EDF6B040, @"repeatCount", v9);
      v13 = [NSNumber numberWithDouble:v3];
      [v14 setObject:v13 forKeyedSubscript:@"time"];

      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
    else
    {
      v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), v9);
      [v14 setObject:v10 forKeyedSubscript:@"repeatCount"];
    }
  }
  else
  {
    v11 = [MEMORY[0x1E4F1CA60] dictionary];
    [v11 setObject:&unk_1EDF6B040 forKeyedSubscript:@"repeatCount"];
    v12 = [NSNumber numberWithDouble:v3];
    [v11 setObject:v12 forKeyedSubscript:@"time"];

    [(id)_AXLogThresholdMap setObject:v11 forKey:*(void *)(a1 + 32)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

@end