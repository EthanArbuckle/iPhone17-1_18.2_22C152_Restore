@interface MTLMotionKeyframeData
+ (MTLMotionKeyframeData)data;
- (BOOL)isEqual:(id)a3;
- (MTLMotionKeyframeData)init;
- (NSUInteger)offset;
- (id)buffer;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)setBuffer:(id)buffer;
- (void)setOffset:(NSUInteger)offset;
@end

@implementation MTLMotionKeyframeData

+ (MTLMotionKeyframeData)data
{
  v2 = objc_alloc_init(MTLMotionKeyframeData);

  return v2;
}

- (MTLMotionKeyframeData)init
{
  v3.receiver = self;
  v3.super_class = (Class)MTLMotionKeyframeData;
  result = [(MTLMotionKeyframeData *)&v3 init];
  if (result)
  {
    result->_buffer = 0;
    result->_offset = 0;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLMotionKeyframeData;
  [(MTLMotionKeyframeData *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setBuffer:self->_buffer];
  [v4 setOffset:self->_offset];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  Class = object_getClass(self);
  if (Class != object_getClass(a3)) {
    return 0;
  }
  id v6 = [(MTLMotionKeyframeData *)self buffer];
  if (v6 != (id)[a3 buffer]) {
    return 0;
  }
  NSUInteger v8 = [(MTLMotionKeyframeData *)self offset];
  return v8 == [a3 offset];
}

- (unint64_t)hash
{
  bzero(v4, 0x10uLL);
  v4[1] = -[MTLMotionKeyframeData offset](self, "offset", objc_msgSend(-[MTLMotionKeyframeData buffer](self, "buffer"), "hash"));
  return _MTLHashState((int *)v4, 0x10uLL);
}

- (id)buffer
{
  return self->_buffer;
}

- (void)setBuffer:(id)buffer
{
}

- (NSUInteger)offset
{
  return self->_offset;
}

- (void)setOffset:(NSUInteger)offset
{
  self->_offset = offset;
}

@end