@interface DTSysmonProcessRecord
- (NSArray)attributes;
- (int)pid;
- (void)setAttributes:(id)a3;
- (void)setPid:(int)a3;
@end

@implementation DTSysmonProcessRecord

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (NSArray)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end