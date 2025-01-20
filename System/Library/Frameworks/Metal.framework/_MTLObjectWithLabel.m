@interface _MTLObjectWithLabel
- (NSString)label;
- (_MTLObjectWithLabel)init;
- (id)retainedLabel;
- (void)dealloc;
- (void)setLabel:(id)a3;
@end

@implementation _MTLObjectWithLabel

- (_MTLObjectWithLabel)init
{
  v3.receiver = self;
  v3.super_class = (Class)_MTLObjectWithLabel;
  result = [(_MTLObjectWithLabel *)&v3 init];
  if (result)
  {
    result->_label = 0;
    result->_labelLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)setLabel:(id)a3
{
  if (self->_label != a3)
  {
    v4 = (NSString *)[a3 copy];
    os_unfair_lock_lock(&self->_labelLock);
    label = self->_label;
    self->_label = v4;
    os_unfair_lock_unlock(&self->_labelLock);
  }
}

- (NSString)label
{
  id v2 = [(_MTLObjectWithLabel *)self retainedLabel];

  return (NSString *)v2;
}

- (id)retainedLabel
{
  p_labelLock = &self->_labelLock;
  os_unfair_lock_lock(&self->_labelLock);
  v4 = self->_label;
  os_unfair_lock_unlock(p_labelLock);
  return v4;
}

- (void)dealloc
{
  self->_label = 0;
  v3.receiver = self;
  v3.super_class = (Class)_MTLObjectWithLabel;
  [(_MTLObjectWithLabel *)&v3 dealloc];
}

@end