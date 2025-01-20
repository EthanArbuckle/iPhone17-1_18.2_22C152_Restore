@interface GCReplayKitGestureSettings
+ (BOOL)supportsSecureCoding;
- (GCReplayKitGestureSettings)init;
- (GCReplayKitGestureSettings)initWithCoder:(id)a3;
- (NSString)controllerElementMappingKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)doublePressGesture;
- (int64_t)gestureModeForGestureType:(int64_t)a3;
- (int64_t)gestureTypeForGestureMode:(int64_t)a3;
- (int64_t)longPressGesture;
- (int64_t)singlePressGesture;
- (void)encodeWithCoder:(id)a3;
- (void)setControllerElementMappingKey:(id)a3;
- (void)setDoublePressGesture:(int64_t)a3;
- (void)setGestureMode:(int64_t)a3 forGestureType:(int64_t)a4;
- (void)setLongPressGesture:(int64_t)a3;
- (void)setSinglePressGesture:(int64_t)a3;
@end

@implementation GCReplayKitGestureSettings

- (GCReplayKitGestureSettings)init
{
  v3.receiver = self;
  v3.super_class = (Class)GCReplayKitGestureSettings;
  result = [(GCReplayKitGestureSettings *)&v3 init];
  if (result)
  {
    result->_doublePressGesture = -1;
    result->_longPressGesture = -1;
    result->_singlePressGesture = -1;
  }
  return result;
}

- (int64_t)gestureModeForGestureType:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return -1;
  }
  else {
    return *(int64_t *)((char *)&self->super.isa + qword_220A91CA8[a3]);
  }
}

- (void)setGestureMode:(int64_t)a3 forGestureType:(int64_t)a4
{
  if ((unint64_t)a4 <= 2) {
    *(Class *)((char *)&self->super.isa + qword_220A91CA8[a4]) = (Class)a3;
  }
}

- (int64_t)gestureTypeForGestureMode:(int64_t)a3
{
  if (self->_singlePressGesture == a3) {
    return 0;
  }
  if (self->_doublePressGesture == a3) {
    return 2;
  }
  if (self->_longPressGesture == a3) {
    return 1;
  }
  return -1;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<GCReplayKitGestureSettings single=%ld double=%ld long=%ld (%@)", self->_singlePressGesture, self->_doublePressGesture, self->_longPressGesture, self->_controllerElementMappingKey];
}

- (NSString)controllerElementMappingKey
{
  return self->_controllerElementMappingKey;
}

- (void)setControllerElementMappingKey:(id)a3
{
}

- (int64_t)singlePressGesture
{
  return self->_singlePressGesture;
}

- (void)setSinglePressGesture:(int64_t)a3
{
  self->_singlePressGesture = a3;
}

- (int64_t)doublePressGesture
{
  return self->_doublePressGesture;
}

- (void)setDoublePressGesture:(int64_t)a3
{
  self->_doublePressGesture = a3;
}

- (int64_t)longPressGesture
{
  return self->_longPressGesture;
}

- (void)setLongPressGesture:(int64_t)a3
{
  self->_longPressGesture = a3;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCReplayKitGestureSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GCReplayKitGestureSettings;
  v5 = [(GCReplayKitGestureSettings *)&v9 init];
  if (v5)
  {
    v5->_singlePressGesture = [v4 decodeInt64ForKey:@"_singlePressGesture"];
    v5->_doublePressGesture = [v4 decodeInt64ForKey:@"_doublePressGesture"];
    v5->_longPressGesture = [v4 decodeInt64ForKey:@"_longPressGesture"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_controllerElementMappingKey"];
    controllerElementMappingKey = v5->_controllerElementMappingKey;
    v5->_controllerElementMappingKey = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t singlePressGesture = self->_singlePressGesture;
  id v5 = a3;
  [v5 encodeInt64:singlePressGesture forKey:@"_singlePressGesture"];
  [v5 encodeInt64:self->_doublePressGesture forKey:@"_doublePressGesture"];
  [v5 encodeInt64:self->_longPressGesture forKey:@"_longPressGesture"];
  [v5 encodeObject:self->_controllerElementMappingKey forKey:@"_controllerElementMappingKey"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[GCReplayKitGestureSettings allocWithZone:a3] init];
  v4->_int64_t singlePressGesture = self->_singlePressGesture;
  v4->_doublePressGesture = self->_doublePressGesture;
  v4->_longPressGesture = self->_longPressGesture;
  uint64_t v5 = [(NSString *)self->_controllerElementMappingKey copy];
  controllerElementMappingKey = v4->_controllerElementMappingKey;
  v4->_controllerElementMappingKey = (NSString *)v5;

  return v4;
}

@end