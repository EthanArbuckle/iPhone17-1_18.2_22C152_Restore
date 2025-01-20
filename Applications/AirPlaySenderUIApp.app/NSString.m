@interface NSString
- (BOOL)isValidIPv4Address;
- (BOOL)isValidIPv4AddressWithSubnetMask:(id)a3;
- (BOOL)isValidIPv6Address;
- (BOOL)isValidSubnetMask;
@end

@implementation NSString

- (BOOL)isValidSubnetMask
{
  int v3 = 0;
  return inet_pton(2, [(NSString *)self cStringUsingEncoding:4], &v3) == 1;
}

- (BOOL)isValidIPv4Address
{
  int v4 = 0;
  return inet_pton(2, [(NSString *)self cStringUsingEncoding:4], &v4) == 1&& (v4 - 1) < 0xFFFFFFFE;
}

- (BOOL)isValidIPv4AddressWithSubnetMask:(id)a3
{
  id v4 = a3;
  if (-[NSString isValidIPv4Address](self, "isValidIPv4Address") && [v4 isValidSubnetMask])
  {
    if ([(NSString *)self hasPrefix:@"169.254."]) {
      unsigned int v5 = [v4 isEqualToString:@"255.255.0.0"] ^ 1;
    }
    else {
      LOBYTE(v5) = 1;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)isValidIPv6Address
{
  v3[0] = 0;
  int v4 = 0;
  v3[1] = 0;
  if (inet_pton(30, -[NSString cStringUsingEncoding:](self, "cStringUsingEncoding:", 1, 0), v3) != 1|| LOBYTE(v3[0]) == 254 && (BYTE1(v3[0]) & 0xC0) == 0x80)
  {
    return 0;
  }
  BOOL result = 1;
  if (LOBYTE(v3[0]) == 255 && (BYTE1(v3[0]) & 0xF0) != 0x30) {
    return (BYTE1(v3[0]) & 0xF) != 2;
  }
  return result;
}

@end