@interface ECIMAPCopyInfo
- (NSDictionary)sourceUIDsToDestinationUIDs;
- (unsigned)uidValidity;
- (void)setSourceUIDsToDestinationUIDs:(id)a3;
- (void)setUidValidity:(unsigned int)a3;
@end

@implementation ECIMAPCopyInfo

- (unsigned)uidValidity
{
  return self->_uidValidity;
}

- (void)setUidValidity:(unsigned int)a3
{
  self->_uidValidity = a3;
}

- (NSDictionary)sourceUIDsToDestinationUIDs
{
  return self->_sourceUIDsToDestinationUIDs;
}

- (void)setSourceUIDsToDestinationUIDs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end