@interface GKPolygonObstacle
+ (BOOL)supportsSecureCoding;
+ (GKPolygonObstacle)obstacleWithPoints:(vector_float2 *)points count:(size_t)numPoints;
- (GKPolygonObstacle)init;
- (GKPolygonObstacle)initWithCoder:(id)a3;
- (GKPolygonObstacle)initWithPoints:(vector_float2 *)points count:(size_t)numPoints;
- (NSUInteger)vertexCount;
- (Obstacle)obstacle;
- (vector_float2)vertexAtIndex:(NSUInteger)index;
- (void)cPolygonObstacle;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setCPolygonObstacle:(void *)a3;
@end

@implementation GKPolygonObstacle

- (void)setCPolygonObstacle:(void *)a3
{
  self->_cPolygonObstacle = a3;
}

- (void)cPolygonObstacle
{
  return self->_cPolygonObstacle;
}

- (GKPolygonObstacle)init
{
  return [(GKPolygonObstacle *)self initWithPoints:0 count:0];
}

+ (GKPolygonObstacle)obstacleWithPoints:(vector_float2 *)points count:(size_t)numPoints
{
  v4 = [[GKPolygonObstacle alloc] initWithPoints:points count:numPoints];

  return v4;
}

- (GKPolygonObstacle)initWithPoints:(vector_float2 *)points count:(size_t)numPoints
{
  v5.receiver = self;
  v5.super_class = (Class)GKPolygonObstacle;
  if ([(GKPolygonObstacle *)&v5 init]) {
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  cPolygonObstacle = self->_cPolygonObstacle;
  if (cPolygonObstacle) {
    (*(void (**)(void *, SEL))(*(void *)cPolygonObstacle + 8))(cPolygonObstacle, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)GKPolygonObstacle;
  [(GKPolygonObstacle *)&v4 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (vector_float2)vertexAtIndex:(NSUInteger)index
{
  return *(vector_float2 *)(*((void *)self->_cPolygonObstacle + 1) + 8 * index);
}

- (NSUInteger)vertexCount
{
  return (uint64_t)(*((void *)self->_cPolygonObstacle + 2) - *((void *)self->_cPolygonObstacle + 1)) >> 3;
}

- (Obstacle)obstacle
{
  return (Obstacle *)((char *)self->_cPolygonObstacle + 32);
}

- (GKPolygonObstacle)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntForKey:@"numVertices"];
  if ((v5 & 0x80000000) != 0)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Serialization error!  Value (%i) for key 'numVertices' can not be negative.", v5);
    id v10 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v10);
  }
  unint64_t v12 = 0;
  id v6 = v4;
  uint64_t v7 = [v6 decodeBytesForKey:@"vertices" returnedLength:&v12];
  if (v12 < 8 * (unint64_t)v5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Serialization error!  Expected to decode %zu bytes for key 'vertices'.  Got %zu.", 8 * v5, v12);
    id v11 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v11);
  }
  v8 = [(GKPolygonObstacle *)self initWithPoints:v7 count:v5];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:(uint64_t)(*((void *)self->_cPolygonObstacle + 2) - *((void *)self->_cPolygonObstacle + 1)) >> 3 forKey:@"numVertices"];
  [v4 encodeBytes:*((void *)self->_cPolygonObstacle + 1) length:*((void *)self->_cPolygonObstacle + 2) - *((void *)self->_cPolygonObstacle + 1) forKey:@"vertices"];
}

@end