@interface HMHAPMetadataCharacteristic
- (NSString)chrDescription;
- (NSString)uuidStr;
- (void)setChrDescription:(id)a3;
- (void)setUuidStr:(id)a3;
@end

@implementation HMHAPMetadataCharacteristic

- (NSString)uuidStr
{
  return self->_uuidStr;
}

- (void)setUuidStr:(id)a3
{
}

- (void)setChrDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chrDescription, 0);

  objc_storeStrong((id *)&self->_uuidStr, 0);
}

- (NSString)chrDescription
{
  return self->_chrDescription;
}

@end