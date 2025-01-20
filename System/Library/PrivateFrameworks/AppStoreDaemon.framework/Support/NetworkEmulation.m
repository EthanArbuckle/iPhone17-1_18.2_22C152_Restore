@interface NetworkEmulation
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation NetworkEmulation

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [+[NetworkEmulation allocWithZone:a3] init];
  *((void *)result + 2) = self->_interfaceType;
  *((unsigned char *)result + 8) = self->_isConstrained;
  *((unsigned char *)result + 9) = self->_isExpensive;
  *((unsigned char *)result + 10) = self->_isRoaming;
  return result;
}

- (id)description
{
  BOOL isConstrained = self->_isConstrained;
  BOOL isExpensive = self->_isExpensive;
  BOOL isRoaming = self->_isRoaming;
  unint64_t interfaceType = self->_interfaceType;
  if (interfaceType >= 5) {
    v6 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"unknown (%ld)", interfaceType);
  }
  else {
    v6 = off_100526130[interfaceType];
  }
  v7 = +[NSString stringWithFormat:@"{constrained = %d, expensive = %d, roaming = %d, interface = %@}", isConstrained, isExpensive, isRoaming, v6];

  return v7;
}

@end