@interface CBCentral
- (NSUInteger)maximumUpdateValueLength;
- (id)description;
@end

@implementation CBCentral

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CBPeer *)self identifier];
  v6 = [v5 UUIDString];
  v7 = [v3 stringWithFormat:@"<%@: %p identifier = %@, MTU = %lu>", v4, self, v6, -[CBCentral maximumUpdateValueLength](self, "maximumUpdateValueLength")];

  return v7;
}

- (NSUInteger)maximumUpdateValueLength
{
  unint64_t v2 = [(CBPeer *)self mtuLength];
  if (v2 - 3 >= 0x200) {
    return 512;
  }
  else {
    return v2 - 3;
  }
}

@end