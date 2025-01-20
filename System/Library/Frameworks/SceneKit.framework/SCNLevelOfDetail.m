@interface SCNLevelOfDetail
+ (BOOL)supportsSecureCoding;
+ (SCNLevelOfDetail)levelOfDetailWithGeometry:(SCNGeometry *)geometry screenSpaceRadius:(CGFloat)radius;
+ (SCNLevelOfDetail)levelOfDetailWithGeometry:(SCNGeometry *)geometry worldSpaceDistance:(CGFloat)distance;
- (CGFloat)screenSpaceRadius;
- (CGFloat)worldSpaceDistance;
- (SCNGeometry)geometry;
- (SCNLevelOfDetail)initWithCoder:(id)a3;
- (SCNLevelOfDetail)initWithGeometry:(id)a3 thresholdMode:(int64_t)a4 lod:(__C3DLOD *)a5;
- (SCNLevelOfDetail)initWithGeometry:(id)a3 thresholdMode:(int64_t)a4 thresholdValue:(id)a5;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)thresholdValue;
- (int64_t)thresholdMode;
- (void)__CFObject;
- (void)_customEncodingOfSCNLevelOfDetail:(id)a3;
- (void)_didDecodeSCNLevelOfDetail:(id)a3;
- (void)_setupWithGeometry:(id)a3 thresholdMode:(int64_t)a4 value:(double)a5;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SCNLevelOfDetail

- (void)dealloc
{
  lod = self->_lod;
  if (lod)
  {
    CFRelease(lod);
    self->_lod = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)SCNLevelOfDetail;
  [(SCNLevelOfDetail *)&v4 dealloc];
}

- (void)_setupWithGeometry:(id)a3 thresholdMode:(int64_t)a4 value:(double)a5
{
  geometry = self->_geometry;
  if (geometry != a3)
  {

    self->_geometry = (SCNGeometry *)a3;
  }
  self->_mode = a4;
  v10 = (const void *)objc_msgSend(a3, "__CFObject");
  float v11 = a5;
  self->_lod = (__C3DLOD *)C3DLODCreate(v10, a4, v11);
}

- (SCNLevelOfDetail)initWithGeometry:(id)a3 thresholdMode:(int64_t)a4 lod:(__C3DLOD *)a5
{
  v10.receiver = self;
  v10.super_class = (Class)SCNLevelOfDetail;
  v7 = [(SCNLevelOfDetail *)&v10 init];
  v8 = v7;
  if (v7)
  {
    v7->_mode = a4;
    if (a5) {
      v7->_lod = (__C3DLOD *)CFRetain(a5);
    }
    v8->_mode = a4;
  }
  return v8;
}

- (SCNLevelOfDetail)initWithGeometry:(id)a3 thresholdMode:(int64_t)a4 thresholdValue:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)SCNLevelOfDetail;
  v8 = [(SCNLevelOfDetail *)&v10 init];
  if (v8)
  {
    [a5 doubleValue];
    -[SCNLevelOfDetail _setupWithGeometry:thresholdMode:value:](v8, "_setupWithGeometry:thresholdMode:value:", a3, a4);
  }
  return v8;
}

+ (SCNLevelOfDetail)levelOfDetailWithGeometry:(SCNGeometry *)geometry screenSpaceRadius:(CGFloat)radius
{
  v6 = objc_alloc_init(SCNLevelOfDetail);
  [(SCNLevelOfDetail *)v6 _setupWithGeometry:geometry thresholdMode:1 value:radius];

  return v6;
}

+ (SCNLevelOfDetail)levelOfDetailWithGeometry:(SCNGeometry *)geometry worldSpaceDistance:(CGFloat)distance
{
  v6 = objc_alloc_init(SCNLevelOfDetail);
  [(SCNLevelOfDetail *)v6 _setupWithGeometry:geometry thresholdMode:0 value:distance];

  return v6;
}

- (void)__CFObject
{
  return self->_lod;
}

- (SCNGeometry)geometry
{
  return self->_geometry;
}

- (int64_t)thresholdMode
{
  return self->_mode;
}

- (id)thresholdValue
{
  double v2 = C3DLODGetThreshold((uint64_t)self->_lod);
  v3 = NSNumber;

  return (id)[v3 numberWithDouble:v2];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  int64_t mode = self->_mode;
  geometry = self->_geometry;
  lod = self->_lod;

  return (id)[v4 initWithGeometry:geometry thresholdMode:mode lod:lod];
}

- (id)copy
{
  return [(SCNLevelOfDetail *)self copyWithZone:0];
}

- (CGFloat)screenSpaceRadius
{
  CGFloat result = 0.0;
  if (self->_mode == 1) {
    return C3DLODGetThreshold((uint64_t)self->_lod);
  }
  return result;
}

- (CGFloat)worldSpaceDistance
{
  CGFloat result = 0.0;
  if (!self->_mode) {
    return C3DLODGetThreshold((uint64_t)self->_lod);
  }
  return result;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"levelOfDetail <%p>: geometry:%@ threshold:%f useDistance:%d", self, -[SCNLevelOfDetail geometry](self, "geometry"), C3DLODGetThreshold((uint64_t)self->_lod), self->_mode == 0];
}

- (void)_customEncodingOfSCNLevelOfDetail:(id)a3
{
  uint64_t v4 = [NSNumber numberWithDouble:C3DLODGetThreshold((uint64_t)self->_lod)];

  [a3 encodeObject:v4 forKey:@"threshold"];
}

- (void)_didDecodeSCNLevelOfDetail:(id)a3
{
  objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"threshold"), "doubleValue");
  int64_t mode = self->_mode;
  geometry = self->_geometry;

  -[SCNLevelOfDetail _setupWithGeometry:thresholdMode:value:](self, "_setupWithGeometry:thresholdMode:value:", geometry, mode);
}

- (void)encodeWithCoder:(id)a3
{
  -[SCNLevelOfDetail _customEncodingOfSCNLevelOfDetail:](self, "_customEncodingOfSCNLevelOfDetail:");
  [a3 encodeInteger:self->_mode forKey:@"mode"];
  if (self->_geometry)
  {
    objc_msgSend(a3, "encodeObject:forKey:");
  }
}

- (SCNLevelOfDetail)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNLevelOfDetail;
  uint64_t v4 = [(SCNLevelOfDetail *)&v7 init];
  if (v4)
  {
    BOOL v5 = +[SCNTransaction immediateMode];
    +[SCNTransaction setImmediateMode:1];
    v4->_int64_t mode = [a3 decodeIntegerForKey:@"mode"];
    v4->_geometry = (SCNGeometry *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"geometry"];
    [(SCNLevelOfDetail *)v4 _didDecodeSCNLevelOfDetail:a3];
    +[SCNTransaction setImmediateMode:v5];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end