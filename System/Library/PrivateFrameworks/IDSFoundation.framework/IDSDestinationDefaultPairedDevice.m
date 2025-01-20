@interface IDSDestinationDefaultPairedDevice
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToIDSDestinationDefaultPairedDevice:(id)a3;
- (id)description;
- (id)destinationURIs;
- (unint64_t)hash;
@end

@implementation IDSDestinationDefaultPairedDevice

- (id)destinationURIs
{
  return (id)objc_msgSend_setWithObject_(MEMORY[0x1E4F1CAD0], a2, @"__IDS_DEFAULT_PAIRED_DEVICE__", v2);
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  return (id)objc_msgSend_stringWithFormat_(v3, v5, @"<%@: %p>", v6, v4, self);
}

- (BOOL)isEqualToIDSDestinationDefaultPairedDevice:(id)a3
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (IDSDestinationDefaultPairedDevice *)a3;
  if (self == v4)
  {
    char isEqualToIDSDestinationDefaultPairedDevice = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char isEqualToIDSDestinationDefaultPairedDevice = objc_msgSend_isEqualToIDSDestinationDefaultPairedDevice_(self, v5, (uint64_t)v4, v6);
    }
    else {
      char isEqualToIDSDestinationDefaultPairedDevice = 0;
    }
  }

  return isEqualToIDSDestinationDefaultPairedDevice;
}

- (unint64_t)hash
{
  return objc_msgSend_hash(@"__IDS_DEFAULT_PAIRED_DEVICE__", a2, v2, v3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end