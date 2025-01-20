@interface RTPolygon
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPolygon:(id)a3;
- (NSArray)vertices;
- (RTCoordinate)centroid;
- (RTPolygon)init;
- (RTPolygon)initWithCentroid:(id)a3 vertices:(id)a4;
- (RTPolygon)initWithCoder:(id)a3;
- (RTPolygon)initWithVertices:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTPolygon

- (RTPolygon)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithCentroid_vertices_);
}

- (RTPolygon)initWithVertices:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
      double v9 = 0.0;
      double v10 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v5);
          }
          v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          objc_msgSend(v12, "latitude", (void)v18);
          double v9 = v9 + v13;
          [v12 longitude];
          double v10 = v10 + v14;
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v7);
    }
    else
    {
      double v9 = 0.0;
      double v10 = 0.0;
    }

    v15 = -[RTCoordinate initWithLatitude:longitude:]([RTCoordinate alloc], "initWithLatitude:longitude:", v9 / (double)(unint64_t)[v5 count], v10 / (double)(unint64_t)objc_msgSend(v5, "count"));
    self = [(RTPolygon *)self initWithCentroid:v15 vertices:v5];
    v16 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = (RTCoordinate *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v15->super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A8FEF000, &v15->super, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: vertices.count > 0", buf, 2u);
    }
    v16 = 0;
  }

  return v16;
}

- (RTPolygon)initWithCentroid:(id)a3 vertices:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v8 count])
  {
    v16.receiver = self;
    v16.super_class = (Class)RTPolygon;
    double v9 = [(RTPolygon *)&v16 init];
    double v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_centroid, a3);
      uint64_t v11 = [v8 copy];
      vertices = v10->_vertices;
      v10->_vertices = (NSArray *)v11;
    }
    self = v10;
    double v13 = self;
  }
  else
  {
    double v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A8FEF000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: vertices.count > 0", buf, 2u);
    }

    double v13 = 0;
  }

  return v13;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"centroid, %@, number of vertices, %lu", self->_centroid, -[NSArray count](self->_vertices, "count")];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  centroid = self->_centroid;
  id v5 = a3;
  [v5 encodeObject:centroid forKey:@"centroid"];
  [v5 encodeObject:self->_vertices forKey:@"vertices"];
}

- (RTPolygon)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"centroid"];
  uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  double v9 = [v4 decodeObjectOfClasses:v8 forKey:@"vertices"];

  double v10 = [(RTPolygon *)self initWithCentroid:v5 vertices:v9];
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  centroid = self->_centroid;
  vertices = self->_vertices;
  return (id)[v4 initWithCentroid:centroid vertices:vertices];
}

- (BOOL)isEqualToPolygon:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(NSArray *)self->_vertices count];
  uint64_t v6 = [v4 vertices];
  uint64_t v7 = [v6 count];

  if (v5 == v7 && (NSUInteger v8 = [(NSArray *)self->_vertices count]) != 0)
  {
    uint64_t v9 = 0;
    while (1)
    {
      double v10 = [(NSArray *)self->_vertices objectAtIndexedSubscript:0];
      uint64_t v11 = [v4 vertices];
      v12 = [v11 objectAtIndexedSubscript:v9];
      int v13 = [v10 isEqual:v12];

      if (v13) {
        break;
      }
      if (++v9 >= [(NSArray *)self->_vertices count]) {
        goto LABEL_6;
      }
    }
    if ([(NSArray *)self->_vertices count])
    {
      unint64_t v16 = 0;
      do
      {
        v17 = [(NSArray *)self->_vertices objectAtIndexedSubscript:v16];
        long long v18 = [v4 vertices];
        long long v19 = [v18 objectAtIndexedSubscript:(v9 + v16) % v8];
        char v14 = [v17 isEqual:v19];

        if ((v14 & 1) == 0) {
          break;
        }
        ++v16;
      }
      while (v16 < [(NSArray *)self->_vertices count]);
    }
    else
    {
      char v14 = 1;
    }
  }
  else
  {
LABEL_6:
    char v14 = 0;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RTPolygon *)a3;
  NSUInteger v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(RTPolygon *)self isEqualToPolygon:v5];

  return v6;
}

- (unint64_t)hash
{
  v3 = [(NSArray *)self->_vertices objectAtIndexedSubscript:0];
  unint64_t v4 = [v3 hash];

  if ([(NSArray *)self->_vertices count] >= 2)
  {
    unint64_t v5 = 1;
    do
    {
      BOOL v6 = [(NSArray *)self->_vertices objectAtIndexedSubscript:v5];
      v4 ^= [v6 hash];

      ++v5;
    }
    while (v5 < [(NSArray *)self->_vertices count]);
  }
  return v4;
}

- (RTCoordinate)centroid
{
  return self->_centroid;
}

- (NSArray)vertices
{
  return self->_vertices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vertices, 0);
  objc_storeStrong((id *)&self->_centroid, 0);
}

@end