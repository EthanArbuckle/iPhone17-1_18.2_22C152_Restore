@interface CTBGeoPushLocationWrapper
- (CTBGeoPushLocationWrapper)initWithWrapped:(optional<ctb::GeoPushLocation> *)a3;
- (id).cxx_construct;
- (optional<ctb::GeoPushLocation>)wrapped;
@end

@implementation CTBGeoPushLocationWrapper

- (CTBGeoPushLocationWrapper)initWithWrapped:(optional<ctb::GeoPushLocation> *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CTBGeoPushLocationWrapper;
  result = [(CTBGeoPushLocationWrapper *)&v6 init];
  if (result)
  {
    $BF50F9716EBAD3A72E40AF98920E0E55 var0 = a3->var0;
    result->_wrapped.__engaged_ = a3->__engaged_;
    result->_wrapped.$BF50F9716EBAD3A72E40AF98920E0E55 var0 = var0;
  }
  return result;
}

- (optional<ctb::GeoPushLocation>)wrapped
{
  *retstr = *(optional<ctb::GeoPushLocation> *)((char *)self + 8);
  return self;
}

- (id).cxx_construct
{
  *((unsigned char *)self + 8) = 0;
  *((unsigned char *)self + 24) = 0;
  return self;
}

@end