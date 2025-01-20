@interface _MTLProgramAddressTable
- (NSArray)binaryMappingsEncoderInternal;
- (NSArray)binaryMappingsPerInvocation;
- (NSDictionary)encoderInternalBinaries;
- (_MTLProgramAddressTable)initWithEncoderMappings:(id)a3 perInvocationMappings:(id)a4 internalMappings:(id)a5;
- (void)dealloc;
@end

@implementation _MTLProgramAddressTable

- (_MTLProgramAddressTable)initWithEncoderMappings:(id)a3 perInvocationMappings:(id)a4 internalMappings:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)_MTLProgramAddressTable;
  v8 = [(_MTLProgramAddressTable *)&v10 init];
  if (v8)
  {
    v8->_binaryMappingsEncoderInternal = (NSArray *)[a3 copy];
    v8->_binaryMappingsPerInvocation = (NSArray *)[a4 copy];
    v8->_encoderInternalBinaries = (NSDictionary *)[a5 copy];
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_MTLProgramAddressTable;
  [(_MTLProgramAddressTable *)&v3 dealloc];
}

- (NSArray)binaryMappingsEncoderInternal
{
  return self->_binaryMappingsEncoderInternal;
}

- (NSArray)binaryMappingsPerInvocation
{
  return self->_binaryMappingsPerInvocation;
}

- (NSDictionary)encoderInternalBinaries
{
  return self->_encoderInternalBinaries;
}

@end