@interface AXReplayableGesture
+ (BOOL)supportsSecureCoding;
+ (id)tapGestureForInterfaceOrientedPoint:(CGPoint)a3;
- (AXReplayableGesture)initWithCoder:(id)a3;
- (BOOL)arePointsDeviceRelative;
- (BOOL)isEqual:(id)a3;
- (CGPoint)pointForFingerIdentifier:(id)a3 atEventIndex:(unint64_t)a4;
- (double)forceForFingerIdentifier:(id)a3 atEventIndex:(unint64_t)a4;
- (double)timeAtEventIndex:(unint64_t)a3;
- (id)description;
- (id)fingerIdentifiersAtEventIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)numberOfEvents;
- (void)encodeWithCoder:(id)a3;
- (void)setArePointsDeviceRelative:(BOOL)a3;
@end

@implementation AXReplayableGesture

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)tapGestureForInterfaceOrientedPoint:(CGPoint)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  CGPoint v8 = a3;
  v3 = objc_alloc_init(AXMutableReplayableGesture);
  v4 = [MEMORY[0x1E4F29238] valueWithBytes:&v8 objCType:"{CGPoint=dd}"];
  v11 = &unk_1EDC62C58;
  v12[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  v9 = &unk_1EDC62C58;
  v10 = &unk_1EDC635E8;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  [(AXMutableReplayableGesture *)v3 addPointsByFingerIdentifier:v5 forces:v6 atTime:0.0];

  [(AXMutableReplayableGesture *)v3 addPointsByFingerIdentifier:MEMORY[0x1E4F1CC08] forces:MEMORY[0x1E4F1CC08] atTime:0.1];

  return v3;
}

- (unint64_t)numberOfEvents
{
  return [(NSArray *)self->_allEvents count];
}

- (id)fingerIdentifiersAtEventIndex:(unint64_t)a3
{
  v3 = [(NSArray *)self->_allEvents objectAtIndexedSubscript:a3];
  v4 = [v3 objectForKeyedSubscript:@"Fingers"];
  v5 = [v4 allKeys];

  return v5;
}

- (double)timeAtEventIndex:(unint64_t)a3
{
  v3 = [(NSArray *)self->_allEvents objectAtIndexedSubscript:a3];
  v4 = [v3 objectForKeyedSubscript:@"Time"];
  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

- (CGPoint)pointForFingerIdentifier:(id)a3 atEventIndex:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(NSArray *)self->_allEvents objectAtIndexedSubscript:a4];
  CGPoint v8 = [v7 objectForKeyedSubscript:@"Fingers"];
  v9 = [v8 objectForKeyedSubscript:v6];

  if (!v9)
  {
    id v12 = v6;
    unint64_t v13 = a4;
    _AXAssert();
  }
  double v14 = 0.0;
  double v15 = 0.0;
  objc_msgSend(v9, "getValue:size:", &v14, 16, v12, v13);

  double v10 = v14;
  double v11 = v15;
  result.y = v11;
  result.x = v10;
  return result;
}

- (double)forceForFingerIdentifier:(id)a3 atEventIndex:(unint64_t)a4
{
  allEvents = self->_allEvents;
  id v6 = a3;
  v7 = [(NSArray *)allEvents objectAtIndexedSubscript:a4];
  CGPoint v8 = [v7 objectForKeyedSubscript:@"Forces"];
  v9 = [v8 objectForKeyedSubscript:v6];

  [v9 floatValue];
  double v11 = v10;

  return v11;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)AXReplayableGesture;
  v3 = [(AXReplayableGesture *)&v6 description];
  v4 = [v3 stringByAppendingFormat:@" - device relative: %i, data: %@", -[AXReplayableGesture arePointsDeviceRelative](self, "arePointsDeviceRelative"), self->_allEvents];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    double v5 = v4;
    allEvents = self->_allEvents;
    if (allEvents == (NSArray *)v5[1] || -[NSArray isEqualToArray:](allEvents, "isEqualToArray:"))
    {
      BOOL v7 = [(AXReplayableGesture *)self arePointsDeviceRelative];
      int v8 = v7 ^ [v5 arePointsDeviceRelative] ^ 1;
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_allEvents hash];
  return v3 ^ [(AXReplayableGesture *)self arePointsDeviceRelative];
}

- (void)encodeWithCoder:(id)a3
{
  allEvents = self->_allEvents;
  id v5 = a3;
  [v5 encodeObject:allEvents forKey:@"AllEvents"];
  [v5 encodeObject:&unk_1EDC62C70 forKey:@"Version"];
  objc_msgSend(v5, "encodeBool:forKey:", -[AXReplayableGesture arePointsDeviceRelative](self, "arePointsDeviceRelative"), @"ArePointsDeviceRelative");
}

- (AXReplayableGesture)initWithCoder:(id)a3
{
  v13[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AXReplayableGesture;
  id v5 = [(AXReplayableGesture *)&v12 init];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CAD0];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v13[2] = objc_opt_class();
    v13[3] = objc_opt_class();
    v13[4] = objc_opt_class();
    BOOL v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:5];
    int v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"AllEvents"];
    allEvents = v5->_allEvents;
    v5->_allEvents = (NSArray *)v9;

    -[AXReplayableGesture setArePointsDeviceRelative:](v5, "setArePointsDeviceRelative:", [v4 decodeBoolForKey:@"ArePointsDeviceRelative"]);
  }

  return v5;
}

- (BOOL)arePointsDeviceRelative
{
  return self->_arePointsDeviceRelative;
}

- (void)setArePointsDeviceRelative:(BOOL)a3
{
  self->_arePointsDeviceRelative = a3;
}

- (void).cxx_destruct
{
}

@end