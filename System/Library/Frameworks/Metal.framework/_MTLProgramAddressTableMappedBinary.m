@interface _MTLProgramAddressTableMappedBinary
- (NSString)type;
- (_MTLProgramAddressTableMappedBinary)initWithMappedAddress:(unint64_t)a3 mappedSize:(unint64_t)a4 binaryUniqueId:(unint64_t)a5;
- (_MTLProgramAddressTableMappedBinary)initWithMappedAddress:(unint64_t)a3 mappedSize:(unint64_t)a4 binaryUniqueId:(unint64_t)a5 type:(id)a6;
- (unint64_t)binaryUniqueId;
- (unint64_t)mappedAddress;
- (unint64_t)mappedSize;
@end

@implementation _MTLProgramAddressTableMappedBinary

- (_MTLProgramAddressTableMappedBinary)initWithMappedAddress:(unint64_t)a3 mappedSize:(unint64_t)a4 binaryUniqueId:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)_MTLProgramAddressTableMappedBinary;
  result = [(_MTLProgramAddressTableMappedBinary *)&v9 init];
  if (result)
  {
    result->_mappedAddress = a3;
    result->_mappedSize = a4;
    result->_binaryUniqueId = a5;
    result->_type = (NSString *)&stru_1ECAC84A8;
  }
  return result;
}

- (_MTLProgramAddressTableMappedBinary)initWithMappedAddress:(unint64_t)a3 mappedSize:(unint64_t)a4 binaryUniqueId:(unint64_t)a5 type:(id)a6
{
  v11.receiver = self;
  v11.super_class = (Class)_MTLProgramAddressTableMappedBinary;
  result = [(_MTLProgramAddressTableMappedBinary *)&v11 init];
  if (result)
  {
    result->_mappedAddress = a3;
    result->_mappedSize = a4;
    result->_binaryUniqueId = a5;
    result->_type = (NSString *)a6;
  }
  return result;
}

- (unint64_t)mappedAddress
{
  return self->_mappedAddress;
}

- (unint64_t)mappedSize
{
  return self->_mappedSize;
}

- (unint64_t)binaryUniqueId
{
  return self->_binaryUniqueId;
}

- (NSString)type
{
  return self->_type;
}

@end