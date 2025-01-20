@interface ICDocCamImageSequenceFrame
- (NSDictionary)frameOptions;
- (__CVBuffer)pb;
- (void)setFrameOptions:(id)a3;
- (void)setPb:(__CVBuffer *)a3;
@end

@implementation ICDocCamImageSequenceFrame

- (__CVBuffer)pb
{
  return self->_pb;
}

- (void)setPb:(__CVBuffer *)a3
{
  self->_pb = a3;
}

- (NSDictionary)frameOptions
{
  return self->_frameOptions;
}

- (void)setFrameOptions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end