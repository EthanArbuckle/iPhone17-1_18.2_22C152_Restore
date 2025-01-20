@interface WKNSNumber
- (Object)_apiObject;
- (char)charValue;
- (const)objCType;
- (double)doubleValue;
- (int64_t)longLongValue;
- (unint64_t)unsignedLongLongValue;
- (void)dealloc;
- (void)getValue:(void *)a3;
@end

@implementation WKNSNumber

- (void)dealloc
{
  if ((self->_type & 0xFFFFFFFC) == 0x20) {
    (**(void (***)(void))&self->_number._int64.data.__lx[4])();
  }
  v3.receiver = self;
  v3.super_class = (Class)WKNSNumber;
  [(WKNSNumber *)&v3 dealloc];
}

- (const)objCType
{
  unsigned int v2 = self->_type - 32;
  if (v2 > 3) {
    return 0;
  }
  else {
    return off_1E5811E10[v2];
  }
}

- (void)getValue:(void *)a3
{
  switch(self->_type)
  {
    case ' ':
      *(unsigned char *)a3 = self->_number._BOOLean.data.__lx[20];
      break;
    case '!':
      *(void *)a3 = *(void *)&self->_number._int64.data.__lx[20];
      break;
    case '""':
    case '#':
      *(void *)a3 = *(void *)&self->_number._int64.data.__lx[20];
      break;
    default:
      return;
  }
}

- (char)charValue
{
  if (self->_type == 32) {
    return self->_number._BOOLean.data.__lx[20];
  }
  v3.receiver = self;
  v3.super_class = (Class)WKNSNumber;
  return [(WKNSNumber *)&v3 charValue];
}

- (double)doubleValue
{
  if (self->_type == 33) {
    return *(double *)&self->_number._int64.data.__lx[20];
  }
  v3.receiver = self;
  v3.super_class = (Class)WKNSNumber;
  [(WKNSNumber *)&v3 doubleValue];
  return result;
}

- (unint64_t)unsignedLongLongValue
{
  if (self->_type == 34) {
    return *(void *)&self->_number._int64.data.__lx[20];
  }
  v3.receiver = self;
  v3.super_class = (Class)WKNSNumber;
  return [(WKNSNumber *)&v3 unsignedLongLongValue];
}

- (int64_t)longLongValue
{
  if (self->_type == 35) {
    return *(void *)&self->_number._int64.data.__lx[20];
  }
  v3.receiver = self;
  v3.super_class = (Class)WKNSNumber;
  return [(WKNSNumber *)&v3 longLongValue];
}

- (Object)_apiObject
{
  return (Object *)&self->_number._int64.data.__lx[4];
}

@end