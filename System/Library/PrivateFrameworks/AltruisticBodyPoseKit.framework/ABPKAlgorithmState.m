@interface ABPKAlgorithmState
- (ABPKAlgorithmState)init;
- (BOOL)detection2d;
- (BOOL)image_preprocessing;
- (BOOL)lifting3d;
- (BOOL)registration;
- (BOOL)retargeting;
- (id)toDict;
- (void)setDetection2d:(BOOL)a3;
- (void)setImage_preprocessing:(BOOL)a3;
- (void)setLifting3d:(BOOL)a3;
- (void)setRegistration:(BOOL)a3;
- (void)setRetargeting:(BOOL)a3;
@end

@implementation ABPKAlgorithmState

- (ABPKAlgorithmState)init
{
  v3.receiver = self;
  v3.super_class = (Class)ABPKAlgorithmState;
  result = [(ABPKAlgorithmState *)&v3 init];
  *(_DWORD *)&result->_image_preprocessing = 0;
  result->_retargeting = 0;
  return result;
}

- (id)toDict
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = [NSNumber numberWithBool:self->_image_preprocessing];
  [v3 setObject:v4 forKey:@"image_preprocessing"];

  v5 = [NSNumber numberWithBool:self->_detection2d];
  [v3 setObject:v5 forKey:@"detection2d"];

  v6 = [NSNumber numberWithBool:self->_lifting3d];
  [v3 setObject:v6 forKey:@"lifting3d"];

  v7 = [NSNumber numberWithBool:self->_registration];
  [v3 setObject:v7 forKey:@"registration"];

  v8 = [NSNumber numberWithBool:self->_retargeting];
  [v3 setObject:v8 forKey:@"retargeting"];

  return v3;
}

- (BOOL)image_preprocessing
{
  return self->_image_preprocessing;
}

- (void)setImage_preprocessing:(BOOL)a3
{
  self->_image_preprocessing = a3;
}

- (BOOL)detection2d
{
  return self->_detection2d;
}

- (void)setDetection2d:(BOOL)a3
{
  self->_detection2d = a3;
}

- (BOOL)lifting3d
{
  return self->_lifting3d;
}

- (void)setLifting3d:(BOOL)a3
{
  self->_lifting3d = a3;
}

- (BOOL)registration
{
  return self->_registration;
}

- (void)setRegistration:(BOOL)a3
{
  self->_registration = a3;
}

- (BOOL)retargeting
{
  return self->_retargeting;
}

- (void)setRetargeting:(BOOL)a3
{
  self->_retargeting = a3;
}

@end