@interface HTBeginNonResponsiveAssertionAtStartTime
@end

@implementation HTBeginNonResponsiveAssertionAtStartTime

id ___HTBeginNonResponsiveAssertionAtStartTime_block_invoke(uint64_t a1)
{
  v9[4] = *MEMORY[0x1E4F143B8];
  v8[0] = @"requestedTimeoutSecs";
  v2 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  v9[0] = v2;
  v8[1] = @"timeoutOverMaximum";
  v3 = [NSNumber numberWithInt:*(double *)(a1 + 32) > 120.0];
  v9[1] = v3;
  v8[2] = @"appliedTimeoutSecs";
  v4 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  v9[2] = v4;
  v8[3] = @"assertionName";
  v5 = [NSString stringWithUTF8String:*(void *)(a1 + 48)];
  v9[3] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

@end