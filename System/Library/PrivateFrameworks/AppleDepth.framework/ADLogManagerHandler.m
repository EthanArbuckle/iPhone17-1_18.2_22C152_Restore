@interface ADLogManagerHandler
- (BOOL)active;
- (BOOL)humanReadableFormat;
- (id)name;
- (int64_t)setHostName:(id)a3;
- (int64_t)setLogFolder:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setHumanReadableFormat:(BOOL)a3;
@end

@implementation ADLogManagerHandler

- (void)setHumanReadableFormat:(BOOL)a3
{
  self->_humanReadableFormat = a3;
}

- (BOOL)active
{
  return self->_active;
}

- (BOOL)humanReadableFormat
{
  return self->_humanReadableFormat;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (int64_t)setHostName:(id)a3
{
  return 0;
}

- (int64_t)setLogFolder:(id)a3
{
  return 0;
}

- (id)name
{
  return 0;
}

@end