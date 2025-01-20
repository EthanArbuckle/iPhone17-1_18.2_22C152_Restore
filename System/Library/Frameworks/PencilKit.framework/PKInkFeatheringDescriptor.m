@interface PKInkFeatheringDescriptor
+ (id)descriptorWithStartCapTime:(double)a3 startCapFade:(double)a4 endCapTime:(double)a5 endCapFade:(double)a6;
- (PKInkFeatheringDescriptor)initWithStartCapTime:(double)a3 startCapDistance:(double)a4 startCapFade:(double)a5 startCapShrink:(double)a6 endCapTime:(double)a7 endCapDistance:(double)a8 endCapFade:(double)a9 endCapShrink:(double)a10;
- (double)endCapDistance;
- (double)endCapFade;
- (double)endCapShrink;
- (double)endCapTime;
- (double)startCapDistance;
- (double)startCapFade;
- (double)startCapShrink;
- (double)startCapTime;
- (id)mutableCopy;
- (void)setEndCapDistance:(double)a3;
- (void)setEndCapFade:(double)a3;
- (void)setEndCapShrink:(double)a3;
- (void)setEndCapTime:(double)a3;
- (void)setStartCapDistance:(double)a3;
- (void)setStartCapFade:(double)a3;
- (void)setStartCapShrink:(double)a3;
- (void)setStartCapTime:(double)a3;
@end

@implementation PKInkFeatheringDescriptor

+ (id)descriptorWithStartCapTime:(double)a3 startCapFade:(double)a4 endCapTime:(double)a5 endCapFade:(double)a6
{
  v10 = objc_alloc_init(PKInkFeatheringDescriptor);
  [(PKInkFeatheringDescriptor *)v10 setStartCapTime:a3];
  [(PKInkFeatheringDescriptor *)v10 setStartCapFade:a4];
  [(PKInkFeatheringDescriptor *)v10 setEndCapTime:a5];
  [(PKInkFeatheringDescriptor *)v10 setEndCapFade:a6];

  return v10;
}

- (void)setStartCapTime:(double)a3
{
  self->_startCapTime = a3;
}

- (void)setStartCapFade:(double)a3
{
  self->_startCapFade = a3;
}

- (void)setEndCapTime:(double)a3
{
  self->_endCapTime = a3;
}

- (void)setEndCapFade:(double)a3
{
  self->_endCapFade = a3;
}

- (PKInkFeatheringDescriptor)initWithStartCapTime:(double)a3 startCapDistance:(double)a4 startCapFade:(double)a5 startCapShrink:(double)a6 endCapTime:(double)a7 endCapDistance:(double)a8 endCapFade:(double)a9 endCapShrink:(double)a10
{
  v19.receiver = self;
  v19.super_class = (Class)PKInkFeatheringDescriptor;
  result = [(PKInkFeatheringDescriptor *)&v19 init];
  if (result)
  {
    result->_startCapTime = a3;
    result->_startCapDistance = a4;
    result->_startCapFade = a5;
    result->_startCapShrink = a6;
    result->_endCapTime = a7;
    result->_endCapDistance = a8;
    result->_endCapFade = a9;
    result->_endCapShrink = a10;
  }
  return result;
}

- (id)mutableCopy
{
  v3 = [PKInkFeatheringDescriptor alloc];
  double startCapTime = self->_startCapTime;
  double startCapDistance = self->_startCapDistance;
  double startCapFade = self->_startCapFade;
  double startCapShrink = self->_startCapShrink;
  double endCapTime = self->_endCapTime;
  double endCapDistance = self->_endCapDistance;
  double endCapFade = self->_endCapFade;
  double endCapShrink = self->_endCapShrink;

  return [(PKInkFeatheringDescriptor *)v3 initWithStartCapTime:startCapTime startCapDistance:startCapDistance startCapFade:startCapFade startCapShrink:startCapShrink endCapTime:endCapTime endCapDistance:endCapDistance endCapFade:endCapFade endCapShrink:endCapShrink];
}

- (double)startCapTime
{
  return self->_startCapTime;
}

- (double)startCapDistance
{
  return self->_startCapDistance;
}

- (void)setStartCapDistance:(double)a3
{
  self->_double startCapDistance = a3;
}

- (double)startCapFade
{
  return self->_startCapFade;
}

- (double)startCapShrink
{
  return self->_startCapShrink;
}

- (void)setStartCapShrink:(double)a3
{
  self->_double startCapShrink = a3;
}

- (double)endCapTime
{
  return self->_endCapTime;
}

- (double)endCapDistance
{
  return self->_endCapDistance;
}

- (void)setEndCapDistance:(double)a3
{
  self->_double endCapDistance = a3;
}

- (double)endCapFade
{
  return self->_endCapFade;
}

- (double)endCapShrink
{
  return self->_endCapShrink;
}

- (void)setEndCapShrink:(double)a3
{
  self->_double endCapShrink = a3;
}

@end