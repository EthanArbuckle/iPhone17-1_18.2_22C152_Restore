@interface DTSysmonCoalitionRecord
- (NSArray)attributes;
- (unint64_t)cid;
- (void)setAttributes:(id)a3;
- (void)setCid:(unint64_t)a3;
@end

@implementation DTSysmonCoalitionRecord

- (unint64_t)cid
{
  return self->_cid;
}

- (void)setCid:(unint64_t)a3
{
  self->_cid = a3;
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