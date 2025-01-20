@interface MPCScene
- (MPCScene)init;
- (int64_t)endFrame;
- (int64_t)iterations;
- (int64_t)startFrame;
- (void)setEndFrame:(int64_t)a3;
- (void)setIterations:(int64_t)a3;
- (void)setStartFrame:(int64_t)a3;
@end

@implementation MPCScene

- (void)setIterations:(int64_t)a3
{
  self->_iterations = a3;
}

- (int64_t)iterations
{
  return self->_iterations;
}

- (void)setEndFrame:(int64_t)a3
{
  self->_endFrame = a3;
}

- (int64_t)endFrame
{
  return self->_endFrame;
}

- (void)setStartFrame:(int64_t)a3
{
  self->_startFrame = a3;
}

- (int64_t)startFrame
{
  return self->_startFrame;
}

- (MPCScene)init
{
  v3.receiver = self;
  v3.super_class = (Class)MPCScene;
  result = [(MPCScene *)&v3 init];
  if (result) {
    *(_OWORD *)&result->_endFrame = xmmword_21BEF1650;
  }
  return result;
}

@end