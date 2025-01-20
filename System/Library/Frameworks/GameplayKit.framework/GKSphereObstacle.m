@interface GKSphereObstacle
+ (GKSphereObstacle)obstacleWithRadius:(float)radius;
- (GKSphereObstacle)init;
- (GKSphereObstacle)initWithRadius:(float)radius;
- (Obstacle)obstacle;
- (float)radius;
- (id).cxx_construct;
- (vector_float3)position;
- (void)setPosition:(vector_float3)position;
- (void)setRadius:(float)radius;
@end

@implementation GKSphereObstacle

- (GKSphereObstacle)init
{
  return [(GKSphereObstacle *)self initWithRadius:0.0];
}

+ (GKSphereObstacle)obstacleWithRadius:(float)radius
{
  v4 = [GKSphereObstacle alloc];
  *(float *)&double v5 = radius;
  v6 = [(GKSphereObstacle *)v4 initWithRadius:v5];

  return v6;
}

- (GKSphereObstacle)initWithRadius:(float)radius
{
  v8.receiver = self;
  v8.super_class = (Class)GKSphereObstacle;
  v4 = [(GKSphereObstacle *)&v8 init];
  v6 = v4;
  if (v4)
  {
    *(float *)&double v5 = radius;
    [(GKSphereObstacle *)v4 setRadius:v5];
    [(GKSphereObstacle *)v6 setPosition:0.0];
  }
  return v6;
}

- (void)setRadius:(float)radius
{
  self->_obstacle.radius = radius;
}

- (float)radius
{
  return self->_obstacle.radius;
}

- (void)setPosition:(vector_float3)position
{
  *(void *)&self->_obstacle.center.x = v3;
  self->_obstacle.center.z = *((float *)&v3 + 2);
}

- (vector_float3)position
{
  result.i64[1] = (uint64_t)a2;
  result.i64[0] = (uint64_t)self;
  return result;
}

- (Obstacle)obstacle
{
  return (Obstacle *)&self->_obstacle;
}

- (id).cxx_construct
{
  *((void *)self + 1) = &unk_26E942DD8;
  *((_DWORD *)self + 4) = 1065353216;
  int v2 = dword_26884D848;
  *(void *)((char *)self + 20) = _static_vec3_zero;
  *((_DWORD *)self + 7) = v2;
  return self;
}

@end