@interface AXPageTurningReplayableGesture
+ (BOOL)supportsSecureCoding;
- (AXPageTurningReplayableGesture)initWithCoder:(id)a3;
- (BOOL)arePointsDeviceRelative;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLandscape;
- (BOOL)isLeftToRightSwipe;
- (CGPoint)pointForFingerIdentifier:(id)a3 atEventIndex:(unint64_t)a4;
- (double)forceForFingerIdentifier:(id)a3 atEventIndex:(unint64_t)a4;
- (double)timeAtEventIndex:(unint64_t)a3;
- (id)fingerIdentifiersAtEventIndex:(unint64_t)a3;
- (id)initForLeftToRightSwipe:(BOOL)a3;
- (unint64_t)hash;
- (unint64_t)numberOfEvents;
- (void)encodeWithCoder:(id)a3;
- (void)setIsLandscape:(BOOL)a3;
- (void)setIsLeftToRightSwipe:(BOOL)a3;
@end

@implementation AXPageTurningReplayableGesture

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[AXPageTurningReplayableGesture isLeftToRightSwipe](self, "isLeftToRightSwipe"), @"IsLeftToRightSwipe");
}

- (AXPageTurningReplayableGesture)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeBoolForKey:@"IsLeftToRightSwipe"];

  return (AXPageTurningReplayableGesture *)[(AXPageTurningReplayableGesture *)self initForLeftToRightSwipe:v4];
}

- (id)initForLeftToRightSwipe:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AXPageTurningReplayableGesture;
  uint64_t v4 = [(AXPageTurningReplayableGesture *)&v7 init];
  v5 = v4;
  if (v4) {
    [(AXPageTurningReplayableGesture *)v4 setIsLeftToRightSwipe:v3];
  }
  return v5;
}

- (unint64_t)numberOfEvents
{
  return 10;
}

- (id)fingerIdentifiersAtEventIndex:(unint64_t)a3
{
  return &unk_1EDC632A0;
}

- (double)timeAtEventIndex:(unint64_t)a3
{
  return (double)a3 * 0.0166666667;
}

- (CGPoint)pointForFingerIdentifier:(id)a3 atEventIndex:(unint64_t)a4
{
  double MainScreenBounds = AXDeviceGetMainScreenBounds();
  CGFloat v8 = v7;
  double v10 = v9;
  CGFloat v12 = v11;
  BOOL v13 = [(AXPageTurningReplayableGesture *)self isLandscape];
  if (v13) {
    CGFloat v14 = v12;
  }
  else {
    CGFloat v14 = v10;
  }
  if (v13) {
    CGFloat v12 = v10;
  }
  v20.origin.x = MainScreenBounds;
  v20.origin.y = v8;
  v20.size.width = v14;
  v20.size.height = v12;
  CGFloat MidY = CGRectGetMidY(v20);
  double v16 = (double)a4 * 20.0 + 50.0;
  if (![(AXPageTurningReplayableGesture *)self isLeftToRightSwipe])
  {
    v21.origin.x = MainScreenBounds;
    v21.origin.y = v8;
    v21.size.width = v14;
    v21.size.height = v12;
    double v16 = CGRectGetMaxX(v21) - v16;
  }
  double v17 = v16;
  double v18 = MidY;
  result.y = v18;
  result.x = v17;
  return result;
}

- (double)forceForFingerIdentifier:(id)a3 atEventIndex:(unint64_t)a4
{
  return 0.0;
}

- (BOOL)arePointsDeviceRelative
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if ([v4 isMemberOfClass:objc_opt_class()]) {
    BOOL v5 = *((unsigned __int8 *)&self->super._arePointsDeviceRelative + 1) == v4[17];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return [(id)objc_opt_class() hash] + *((unsigned __int8 *)&self->super._arePointsDeviceRelative + 1);
}

- (BOOL)isLeftToRightSwipe
{
  return *(&self->super._arePointsDeviceRelative + 1);
}

- (void)setIsLeftToRightSwipe:(BOOL)a3
{
  *(&self->super._arePointsDeviceRelative + 1) = a3;
}

- (BOOL)isLandscape
{
  return *(&self->super._arePointsDeviceRelative + 2);
}

- (void)setIsLandscape:(BOOL)a3
{
  *(&self->super._arePointsDeviceRelative + 2) = a3;
}

@end