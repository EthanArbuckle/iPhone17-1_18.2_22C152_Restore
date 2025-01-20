@interface ASOServiceOverlayContainerConfiguration
- (ASOServiceOverlayContainerConfiguration)initWithPosition:(int64_t)a3 userDismissible:(BOOL)a4 hostIdiom:(int64_t)a5;
- (BOOL)userDismissible;
- (int64_t)hostIdiom;
- (int64_t)position;
- (void)setHostIdiom:(int64_t)a3;
- (void)setPosition:(int64_t)a3;
- (void)setUserDismissible:(BOOL)a3;
@end

@implementation ASOServiceOverlayContainerConfiguration

- (ASOServiceOverlayContainerConfiguration)initWithPosition:(int64_t)a3 userDismissible:(BOOL)a4 hostIdiom:(int64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)ASOServiceOverlayContainerConfiguration;
  result = [(ASOServiceOverlayContainerConfiguration *)&v9 init];
  if (result)
  {
    result->_userDismissible = a4;
    result->_position = a3;
    result->_hostIdiom = a5;
  }
  return result;
}

- (int64_t)position
{
  return self->_position;
}

- (void)setPosition:(int64_t)a3
{
  self->_position = a3;
}

- (BOOL)userDismissible
{
  return self->_userDismissible;
}

- (void)setUserDismissible:(BOOL)a3
{
  self->_userDismissible = a3;
}

- (int64_t)hostIdiom
{
  return self->_hostIdiom;
}

- (void)setHostIdiom:(int64_t)a3
{
  self->_hostIdiom = a3;
}

@end