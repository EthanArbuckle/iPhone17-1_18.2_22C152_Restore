@interface IDSAttachmentEncryptionParameter
- (BOOL)isScheduled;
- (NSArray)endpoints;
- (NSData)dataToEncrypt;
- (NSDictionary)attributes;
- (NSDictionary)endpointsToEncryptedData;
- (NSString)fromID;
- (NSString)guid;
- (NSString)service;
- (unint64_t)encryptionType;
- (void)setAttributes:(id)a3;
- (void)setDataToEncrypt:(id)a3;
- (void)setEncryptionType:(unint64_t)a3;
- (void)setEndpoints:(id)a3;
- (void)setEndpointsToEncryptedData:(id)a3;
- (void)setFromID:(id)a3;
- (void)setGuid:(id)a3;
- (void)setIsScheduled:(BOOL)a3;
- (void)setService:(id)a3;
@end

@implementation IDSAttachmentEncryptionParameter

- (unint64_t)encryptionType
{
  return self->_encryptionType;
}

- (void)setEncryptionType:(unint64_t)a3
{
  self->_encryptionType = a3;
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
}

- (NSString)fromID
{
  return self->_fromID;
}

- (void)setFromID:(id)a3
{
}

- (NSData)dataToEncrypt
{
  return self->_dataToEncrypt;
}

- (void)setDataToEncrypt:(id)a3
{
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
}

- (NSArray)endpoints
{
  return self->_endpoints;
}

- (void)setEndpoints:(id)a3
{
}

- (NSDictionary)endpointsToEncryptedData
{
  return self->_endpointsToEncryptedData;
}

- (void)setEndpointsToEncryptedData:(id)a3
{
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (BOOL)isScheduled
{
  return self->_isScheduled;
}

- (void)setIsScheduled:(BOOL)a3
{
  self->_isScheduled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_endpointsToEncryptedData, 0);
  objc_storeStrong((id *)&self->_endpoints, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_dataToEncrypt, 0);
  objc_storeStrong((id *)&self->_fromID, 0);

  objc_storeStrong((id *)&self->_guid, 0);
}

@end