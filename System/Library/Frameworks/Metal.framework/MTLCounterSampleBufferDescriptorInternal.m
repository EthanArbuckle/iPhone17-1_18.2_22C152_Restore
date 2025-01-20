@interface MTLCounterSampleBufferDescriptorInternal
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)counterSet;
- (id)label;
- (unint64_t)hash;
- (unint64_t)sampleCount;
- (unint64_t)storageMode;
- (void)dealloc;
- (void)setCounterSet:(id)a3;
- (void)setLabel:(id)a3;
- (void)setSampleCount:(unint64_t)a3;
- (void)setStorageMode:(unint64_t)a3;
@end

@implementation MTLCounterSampleBufferDescriptorInternal

- (unint64_t)hash
{
  v6[4] = *MEMORY[0x1E4F143B8];
  v6[0] = [(MTLCounterSet *)self->_counterSet hash];
  NSUInteger v3 = [(NSString *)self->_label hash];
  unint64_t storageMode = self->_storageMode;
  v6[1] = v3;
  v6[2] = storageMode;
  v6[3] = self->_sampleCount;
  return _MTLHashState((int *)v6, 0x20uLL);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLCounterSampleBufferDescriptorInternal;
  [(MTLCounterSampleBufferDescriptorInternal *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[MTLCounterSampleBufferDescriptor allocWithZone:a3] init];
  [(MTLCounterSampleBufferDescriptorInternal *)v4 setCounterSet:self->_counterSet];
  [(MTLCounterSampleBufferDescriptorInternal *)v4 setStorageMode:self->_storageMode];
  [(MTLCounterSampleBufferDescriptorInternal *)v4 setLabel:self->_label];
  [(MTLCounterSampleBufferDescriptorInternal *)v4 setSampleCount:self->_sampleCount];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    uint64_t v18 = v6;
    uint64_t v19 = v5;
    uint64_t v20 = v4;
    uint64_t v21 = v3;
    Class = object_getClass(self);
    if (Class != object_getClass(a3))
    {
LABEL_3:
      LOBYTE(v12) = 0;
      return v12;
    }
    counterSet = self->_counterSet;
    if (counterSet == (MTLCounterSet *)[a3 counterSet]
      || (int v12 = -[MTLCounterSet isEqual:](self->_counterSet, "isEqual:", [a3 counterSet])) != 0)
    {
      unint64_t storageMode = self->_storageMode;
      if (storageMode != objc_msgSend(a3, "storageMode", v18, v19, v20, v21, v7, v8)) {
        goto LABEL_3;
      }
      unint64_t sampleCount = self->_sampleCount;
      if (sampleCount != [a3 sampleCount]) {
        goto LABEL_3;
      }
      label = self->_label;
      if (label == (NSString *)[a3 label]
        || (int v12 = -[NSString isEqual:](self->_label, "isEqual:", [a3 label])) != 0)
      {
        LOBYTE(v12) = 1;
      }
    }
  }
  return v12;
}

- (id)counterSet
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setCounterSet:(id)a3
{
}

- (unint64_t)storageMode
{
  return self->_storageMode;
}

- (void)setStorageMode:(unint64_t)a3
{
  self->_unint64_t storageMode = a3;
}

- (id)label
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setLabel:(id)a3
{
}

- (unint64_t)sampleCount
{
  return self->_sampleCount;
}

- (void)setSampleCount:(unint64_t)a3
{
  self->_unint64_t sampleCount = a3;
}

@end