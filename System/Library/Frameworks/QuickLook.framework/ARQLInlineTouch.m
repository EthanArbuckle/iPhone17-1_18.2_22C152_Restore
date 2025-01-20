@interface ARQLInlineTouch
+ (BOOL)supportsSecureCoding;
+ (id)touchToUUIDMapping;
+ (void)removeUIDForUITouch:(id)a3;
- (ARQLInlineTouch)initWithCoder:(id)a3;
- (ARQLInlineTouch)initWithUITouch:(id)a3;
- (CGPoint)cgLocation;
- (CGPoint)cgPreviousLocation;
- (NSString)uid;
- (double)timestamp;
- (id)description;
- (id)uuidForTouch:(id)a3;
- (int64_t)phase;
- (void)encodeWithCoder:(id)a3;
- (void)setCgLocation:(CGPoint)a3;
- (void)setCgPreviousLocation:(CGPoint)a3;
- (void)setPhase:(int64_t)a3;
- (void)setTimestamp:(double)a3;
- (void)setUid:(id)a3;
@end

@implementation ARQLInlineTouch

+ (id)touchToUUIDMapping
{
  if (touchToUUIDMapping_onceToken != -1) {
    dispatch_once(&touchToUUIDMapping_onceToken, &__block_literal_global_17);
  }
  v2 = (void *)touchToUUIDMapping__touchToUUIDMapping;

  return v2;
}

uint64_t __37__ARQLInlineTouch_touchToUUIDMapping__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
  uint64_t v1 = touchToUUIDMapping__touchToUUIDMapping;
  touchToUUIDMapping__touchToUUIDMapping = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

- (id)uuidForTouch:(id)a3
{
  id v3 = a3;
  v4 = +[ARQLInlineTouch touchToUUIDMapping];
  v5 = [v4 objectForKey:v3];
  if (!v5)
  {
    v6 = [MEMORY[0x263F08C38] UUID];
    v5 = [v6 UUIDString];

    [v4 setObject:v5 forKey:v3];
  }
  id v7 = v5;

  return v7;
}

+ (void)removeUIDForUITouch:(id)a3
{
  id v3 = a3;
  id v4 = +[ARQLInlineTouch touchToUUIDMapping];
  [v4 removeObjectForKey:v3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ARQLInlineTouch)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ARQLInlineTouch;
  v5 = [(ARQLInlineTouch *)&v14 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"kTimestampKey"];
    v5->_timestamp = v6;
    [v4 decodeCGPointForKey:@"kCGLocationKey"];
    v5->_cgLocation.x = v7;
    v5->_cgLocation.y = v8;
    [v4 decodeCGPointForKey:@"kCGPreviousLocationKey"];
    v5->_cgPreviousLocation.x = v9;
    v5->_cgPreviousLocation.y = v10;
    v5->_phase = [v4 decodeIntegerForKey:@"kPhaseKey"];
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kUidKey"];
    uid = v5->_uid;
    v5->_uid = (NSString *)v11;
  }
  return v5;
}

- (ARQLInlineTouch)initWithUITouch:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ARQLInlineTouch;
  v5 = [(ARQLInlineTouch *)&v14 init];
  if (v5)
  {
    [v4 timestamp];
    v5->_timestamp = v6;
    [v4 locationInView:0];
    v5->_cgLocation.x = v7;
    v5->_cgLocation.y = v8;
    [v4 previousLocationInView:0];
    v5->_cgPreviousLocation.x = v9;
    v5->_cgPreviousLocation.y = v10;
    v5->_phase = [v4 phase];
    uint64_t v11 = [(ARQLInlineTouch *)v5 uuidForTouch:v4];
    uid = v5->_uid;
    v5->_uid = (NSString *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double timestamp = self->_timestamp;
  id v5 = a3;
  [v5 encodeDouble:@"kTimestampKey" forKey:timestamp];
  objc_msgSend(v5, "encodeCGPoint:forKey:", @"kCGLocationKey", self->_cgLocation.x, self->_cgLocation.y);
  objc_msgSend(v5, "encodeCGPoint:forKey:", @"kCGPreviousLocationKey", self->_cgPreviousLocation.x, self->_cgPreviousLocation.y);
  [v5 encodeInteger:self->_phase forKey:@"kPhaseKey"];
  [v5 encodeObject:self->_uid forKey:@"kUidKey"];
}

- (id)description
{
  id v3 = NSString;
  uid = self->_uid;
  double timestamp = self->_timestamp;
  double v6 = NSStringFromCGPoint(self->_cgLocation);
  CGFloat v7 = NSStringFromCGPoint(self->_cgPreviousLocation);
  CGFloat v8 = [v3 stringWithFormat:@"ARQLInlineTouch %@, %.11g, location: %@, previousLocation: %@", uid, *(void *)&timestamp, v6, v7];

  return v8;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_double timestamp = a3;
}

- (CGPoint)cgLocation
{
  double x = self->_cgLocation.x;
  double y = self->_cgLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCgLocation:(CGPoint)a3
{
  self->_cgLocation = a3;
}

- (CGPoint)cgPreviousLocation
{
  double x = self->_cgPreviousLocation.x;
  double y = self->_cgPreviousLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCgPreviousLocation:(CGPoint)a3
{
  self->_cgPreviousLocation = a3;
}

- (int64_t)phase
{
  return self->_phase;
}

- (void)setPhase:(int64_t)a3
{
  self->_phase = a3;
}

- (NSString)uid
{
  return self->_uid;
}

- (void)setUid:(id)a3
{
}

- (void).cxx_destruct
{
}

@end