@interface AXCenterTapReplayableGesture
+ (BOOL)supportsSecureCoding;
- (AXCenterTapReplayableGesture)init;
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
@end

@implementation AXCenterTapReplayableGesture

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXCenterTapReplayableGesture)init
{
  v27[2] = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)AXCenterTapReplayableGesture;
  v2 = [(AXCenterTapReplayableGesture *)&v18 init];
  if (v2)
  {
    v28.origin.CGFloat x = AXDeviceGetMainScreenBounds();
    CGFloat x = v28.origin.x;
    CGFloat y = v28.origin.y;
    CGFloat width = v28.size.width;
    CGFloat height = v28.size.height;
    CGFloat MidX = CGRectGetMidX(v28);
    v29.origin.CGFloat x = x;
    v29.origin.CGFloat y = y;
    v29.size.CGFloat width = width;
    v29.size.CGFloat height = height;
    *(CGFloat *)v17 = MidX;
    v17[1] = CGRectGetMidY(v29);
    v8 = [MEMORY[0x1E4F29238] valueWithBytes:v17 objCType:"{CGPoint=dd}"];
    v9 = [NSNumber numberWithFloat:0.0];
    v26[0] = &unk_1EDC635E8;
    v25[0] = @"Time";
    v25[1] = @"Fingers";
    v23 = &unk_1EDC62C58;
    v24 = v8;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    v26[1] = v10;
    v25[2] = @"Forces";
    v21 = &unk_1EDC62C58;
    v22 = v9;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    v26[2] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];
    v27[0] = v12;
    v19[0] = @"Time";
    v19[1] = @"Fingers";
    v20[0] = &unk_1EDC635F8;
    v20[1] = MEMORY[0x1E4F1CC08];
    v19[2] = @"Forces";
    v20[2] = MEMORY[0x1E4F1CC08];
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
    v27[1] = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
    allEvents = v2->super._allEvents;
    v2->super._allEvents = (NSArray *)v14;

    [(AXReplayableGesture *)v2 setArePointsDeviceRelative:1];
  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  char v4 = [v3 isMemberOfClass:objc_opt_class()];

  return v4;
}

- (unint64_t)hash
{
  v2 = objc_opt_class();

  return [v2 hash];
}

@end