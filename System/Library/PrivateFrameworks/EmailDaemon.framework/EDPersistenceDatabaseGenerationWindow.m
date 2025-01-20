@interface EDPersistenceDatabaseGenerationWindow
- (EDPersistenceDatabaseGenerationWindow)init;
- (int64_t)earliestGeneration;
- (int64_t)latestGeneration;
- (void)insertGeneration:(int64_t)a3;
@end

@implementation EDPersistenceDatabaseGenerationWindow

- (void)insertGeneration:(int64_t)a3
{
  if (self->_earliestGeneration > a3) {
    self->_earliestGeneration = a3;
  }
  if (self->_latestGeneration < a3) {
    self->_latestGeneration = a3;
  }
}

- (EDPersistenceDatabaseGenerationWindow)init
{
  v3.receiver = self;
  v3.super_class = (Class)EDPersistenceDatabaseGenerationWindow;
  result = [(EDPersistenceDatabaseGenerationWindow *)&v3 init];
  if (result) {
    *(_OWORD *)&result->_earliestGeneration = xmmword_1DB640560;
  }
  return result;
}

- (int64_t)earliestGeneration
{
  return self->_earliestGeneration;
}

- (int64_t)latestGeneration
{
  return self->_latestGeneration;
}

@end