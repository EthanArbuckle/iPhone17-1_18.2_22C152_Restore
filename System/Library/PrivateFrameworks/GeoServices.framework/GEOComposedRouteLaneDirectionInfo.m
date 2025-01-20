@interface GEOComposedRouteLaneDirectionInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (GEOComposedRouteLaneDirectionInfo)initWithCoder:(id)a3;
- (GEOComposedRouteLaneDirectionInfo)initWithLaneArrowHead:(id)a3;
- (float)angle;
- (int)direction;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEOComposedRouteLaneDirectionInfo

- (GEOComposedRouteLaneDirectionInfo)initWithLaneArrowHead:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GEOComposedRouteLaneDirectionInfo;
  v5 = [(GEOComposedRouteLaneDirectionInfo *)&v7 init];
  if (v5)
  {
    v5->_direction = [v4 category];
    v5->_angle = (float)(int)[v4 angle];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedRouteLaneDirectionInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOComposedRouteLaneDirectionInfo;
  v5 = [(GEOComposedRouteLaneDirectionInfo *)&v12 init];
  if (v5)
  {
    unint64_t v11 = 0;
    id v6 = v4;
    objc_super v7 = (const void *)[v6 decodeBytesForKey:@"_direction" returnedLength:&v11];
    if (v11 && v7)
    {
      if (v11 >= 4) {
        size_t v8 = 4;
      }
      else {
        size_t v8 = v11;
      }
      memcpy(&v5->_direction, v7, v8);
    }
    [v6 decodeDoubleForKey:@"_angle"];
    *(float *)&double v9 = v9;
    v5->_angle = *(float *)&v9;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeBytes:&self->_direction length:4 forKey:@"_direction"];
  [v4 encodeDouble:@"_angle" forKey:self->_angle];
}

- (int)direction
{
  return self->_direction;
}

- (float)angle
{
  return self->_angle;
}

- (unint64_t)hash
{
  return [(GEOComposedRouteLaneDirectionInfo *)self direction];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (GEOComposedRouteLaneDirectionInfo *)a3;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int v6 = [(GEOComposedRouteLaneDirectionInfo *)v5 direction];
      if (v6 == [(GEOComposedRouteLaneDirectionInfo *)self direction])
      {
        [(GEOComposedRouteLaneDirectionInfo *)v5 angle];
        float v8 = v7;
        [(GEOComposedRouteLaneDirectionInfo *)self angle];
        BOOL v10 = vabds_f32(v8, v9) <= 0.00000011921;
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

@end