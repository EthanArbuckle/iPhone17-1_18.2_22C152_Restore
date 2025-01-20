@interface MTLResidencySetDescriptor
- (BOOL)commitsImmediately;
- (BOOL)evictsImmediately;
- (BOOL)isEqual:(id)a3;
- (MTLResidencySetDescriptor)init;
- (NSString)label;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)initialCapacity;
- (void)dealloc;
- (void)setEvictsImmediately:(BOOL)a3;
- (void)setInitialCapacity:(unint64_t)a3;
- (void)setLabel:(id)a3;
@end

@implementation MTLResidencySetDescriptor

- (MTLResidencySetDescriptor)init
{
  v4.receiver = self;
  v4.super_class = (Class)MTLResidencySetDescriptor;
  [(MTLResidencySetDescriptor *)&v4 init];
  return self;
}

- (void)setEvictsImmediately:(BOOL)a3
{
  self->_evictsImmediately = a3;
}

- (BOOL)evictsImmediately
{
  return self->_evictsImmediately;
}

- (BOOL)commitsImmediately
{
  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLResidencySetDescriptor;
  [(MTLResidencySetDescriptor *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = objc_opt_new();
  objc_msgSend(v4, "setLabel:", -[MTLResidencySetDescriptor label](self, "label"));
  objc_msgSend(v4, "setEvictsImmediately:", -[MTLResidencySetDescriptor evictsImmediately](self, "evictsImmediately"));
  objc_msgSend(v4, "setInitialCapacity:", -[MTLResidencySetDescriptor initialCapacity](self, "initialCapacity"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    Class = object_getClass(self);
    if (Class != object_getClass(a3))
    {
LABEL_3:
      LOBYTE(v6) = 0;
      return v6;
    }
    v7 = (NSString *)*((void *)a3 + 1);
    if (v7 == self->_label || (int v6 = -[NSString isEqual:](v7, "isEqual:")) != 0)
    {
      if (*((unsigned __int8 *)a3 + 24) != self->_evictsImmediately) {
        goto LABEL_3;
      }
      LOBYTE(v6) = *((void *)a3 + 2) == self->_initialCapacity;
    }
  }
  return v6;
}

- (unint64_t)hash
{
  bzero(v6, 0x18uLL);
  NSUInteger v3 = [(NSString *)self->_label hash];
  unint64_t initialCapacity = self->_initialCapacity;
  v6[0] = v3;
  v6[1] = initialCapacity;
  BOOL evictsImmediately = self->_evictsImmediately;
  return _MTLHashState((int *)v6, 0x18uLL);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (unint64_t)initialCapacity
{
  return self->_initialCapacity;
}

- (void)setInitialCapacity:(unint64_t)a3
{
  self->_unint64_t initialCapacity = a3;
}

@end