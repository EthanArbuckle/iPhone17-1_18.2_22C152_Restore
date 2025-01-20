@interface GKCircleObstacle
+ (GKCircleObstacle)obstacleWithRadius:(float)radius;
- (GKCircleObstacle)init;
- (GKCircleObstacle)initWithRadius:(float)radius;
- (Obstacle)obstacle;
- (float)radius;
- (id).cxx_construct;
- (vector_float2)position;
- (void)setPosition:(vector_float2)position;
- (void)setRadius:(float)radius;
@end

@implementation GKCircleObstacle

- (GKCircleObstacle)init
{
  return [(GKCircleObstacle *)self initWithRadius:0.0];
}

+ (GKCircleObstacle)obstacleWithRadius:(float)radius
{
  v4 = [GKCircleObstacle alloc];
  *(float *)&double v5 = radius;
  v6 = [(GKCircleObstacle *)v4 initWithRadius:v5];

  return v6;
}

- (GKCircleObstacle)initWithRadius:(float)radius
{
  v8.receiver = self;
  v8.super_class = (Class)GKCircleObstacle;
  v4 = [(GKCircleObstacle *)&v8 init];
  v6 = v4;
  if (v4)
  {
    *(float *)&double v5 = radius;
    [(GKCircleObstacle *)v4 setRadius:v5];
    [(GKCircleObstacle *)v6 setPosition:0.0];
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

- (void)setPosition:(vector_float2)position
{
  LODWORD(self->_obstacle.center.x) = position.i32[0];
  self->_obstacle.center.y = 0.0;
  LODWORD(self->_obstacle.center.z) = position.i32[1];
}

- (vector_float2)position
{
  result.i32[0] = LODWORD(self->_obstacle.center.x);
  result.i32[1] = LODWORD(self->_obstacle.center.z);
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