@interface HMHAPMetadataService
- (NSString)svcDescription;
- (NSString)uuidStr;
- (void)setSvcDescription:(id)a3;
- (void)setUuidStr:(id)a3;
@end

@implementation HMHAPMetadataService

- (NSString)uuidStr
{
  return self->_uuidStr;
}

- (void)setUuidStr:(id)a3
{
}

- (void)setSvcDescription:(id)a3
{
}

- (NSString)svcDescription
{
  return self->_svcDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_svcDescription, 0);

  objc_storeStrong((id *)&self->_uuidStr, 0);
}

@end