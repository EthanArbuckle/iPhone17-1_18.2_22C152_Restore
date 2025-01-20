@interface AXNamedReplayableGesture
@end

@implementation AXNamedReplayableGesture

void __96__AXNamedReplayableGesture_AXPIAdditions___tapGestureAtPoint_isDoubleTap_numberOfFingers_force___block_invoke(uint64_t a1, NSString *string, uint64_t a3)
{
  v5 = (void *)MEMORY[0x263F08D40];
  CGPoint v6 = CGPointFromString(string);
  v7 = objc_msgSend(v5, "valueWithCGPoint:", v6.x, v6.y);
  v8 = *(void **)(a1 + 32);
  v9 = [NSNumber numberWithUnsignedInteger:a3];
  [v8 setObject:v7 forKeyedSubscript:v9];

  id v12 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  v10 = *(void **)(a1 + 40);
  v11 = [NSNumber numberWithUnsignedInteger:a3];
  [v10 setObject:v12 forKeyedSubscript:v11];
}

void __91__AXNamedReplayableGesture_AXPIAdditions__holdGestureAtPoint_withDuration_numberOfFingers___block_invoke(uint64_t a1, NSString *string, uint64_t a3)
{
  v5 = (void *)MEMORY[0x263F08D40];
  CGPoint v6 = CGPointFromString(string);
  v7 = objc_msgSend(v5, "valueWithCGPoint:", v6.x, v6.y);
  v8 = *(void **)(a1 + 32);
  v9 = [NSNumber numberWithUnsignedInteger:a3];
  [v8 setObject:v7 forKeyedSubscript:v9];

  v10 = *(void **)(a1 + 40);
  id v11 = [NSNumber numberWithUnsignedInteger:a3];
  [v10 setObject:&unk_26EC8F100 forKeyedSubscript:v11];
}

@end