@interface EspressoDataFrameStorageExecutorMatchingBufferSet
- ($FD4688982923A924290ECB669CAF1EC2)computed_buffer;
- ($FD4688982923A924290ECB669CAF1EC2)groundtruth_buffer;
- ($FD4688982923A924290ECB669CAF1EC2)reference_buffer;
- (NSString)name;
- (__CVBuffer)computed_pb;
- (unint64_t)index;
- (void)setComputed_buffer:(id *)a3;
- (void)setComputed_pb:(__CVBuffer *)a3;
- (void)setGroundtruth_buffer:(id *)a3;
- (void)setIndex:(unint64_t)a3;
- (void)setName:(id)a3;
- (void)setReference_buffer:(id *)a3;
@end

@implementation EspressoDataFrameStorageExecutorMatchingBufferSet

- (void).cxx_destruct
{
}

- (void)setGroundtruth_buffer:(id *)a3
{
}

- ($FD4688982923A924290ECB669CAF1EC2)groundtruth_buffer
{
  objc_copyStruct(retstr, &self->_groundtruth_buffer, 168, 1, 0);
  return result;
}

- (void)setComputed_pb:(__CVBuffer *)a3
{
  self->_computed_pb = a3;
}

- (__CVBuffer)computed_pb
{
  return self->_computed_pb;
}

- (void)setComputed_buffer:(id *)a3
{
}

- ($FD4688982923A924290ECB669CAF1EC2)computed_buffer
{
  objc_copyStruct(retstr, &self->_computed_buffer, 168, 1, 0);
  return result;
}

- (void)setReference_buffer:(id *)a3
{
}

- ($FD4688982923A924290ECB669CAF1EC2)reference_buffer
{
  objc_copyStruct(retstr, &self->_reference_buffer, 168, 1, 0);
  return result;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (unint64_t)index
{
  return self->_index;
}

@end