@interface CSUDetectionPrintShape
- (CSUDetectionPrintShape)initWithHeight:(unint64_t)a3 width:(unint64_t)a4 channels:(unint64_t)a5;
- (unint64_t)channels;
- (unint64_t)height;
- (unint64_t)width;
- (void)setChannels:(unint64_t)a3;
- (void)setHeight:(unint64_t)a3;
- (void)setWidth:(unint64_t)a3;
@end

@implementation CSUDetectionPrintShape

- (CSUDetectionPrintShape)initWithHeight:(unint64_t)a3 width:(unint64_t)a4 channels:(unint64_t)a5
{
  v12.receiver = self;
  v12.super_class = (Class)CSUDetectionPrintShape;
  v8 = [(CSUDetectionPrintShape *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_width = a4;
    v8->_height = a3;
    v8->_channels = a5;
    v10 = v8;
  }

  return v9;
}

- (unint64_t)width
{
  return self->_width;
}

- (void)setWidth:(unint64_t)a3
{
  self->_width = a3;
}

- (unint64_t)height
{
  return self->_height;
}

- (void)setHeight:(unint64_t)a3
{
  self->_height = a3;
}

- (unint64_t)channels
{
  return self->_channels;
}

- (void)setChannels:(unint64_t)a3
{
  self->_channels = a3;
}

@end