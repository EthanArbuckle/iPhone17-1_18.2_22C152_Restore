@interface SHLLibraryItemMetadata
- (BOOL)validEncodedSystemData:(id)a3;
- (NSData)encodedSystemData;
- (SHLLibraryItemMetadata)initWithEncodedSystemData:(id)a3;
- (SHLLibraryItemMetadata)initWithMetadata:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation SHLLibraryItemMetadata

- (SHLLibraryItemMetadata)initWithEncodedSystemData:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SHLLibraryItemMetadata;
  v6 = [(SHLLibraryItemMetadata *)&v10 init];
  v7 = v6;
  if (v6)
  {
    if (![(SHLLibraryItemMetadata *)v6 validEncodedSystemData:v5])
    {
      id v9 = +[NSException shl_exceptionWithName:NSInvalidArgumentException reason:@"You must provide a valid encoded data."];
      objc_exception_throw(v9);
    }
    objc_storeStrong((id *)&v7->_encodedSystemData, a3);
  }

  return v7;
}

- (SHLLibraryItemMetadata)initWithMetadata:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SHLLibraryItemMetadata;
  id v5 = [(SHLLibraryItemMetadata *)&v10 init];
  if (v5)
  {
    v6 = [v4 encodedSystemData];
    v7 = (NSData *)[v6 copy];
    encodedSystemData = v5->_encodedSystemData;
    v5->_encodedSystemData = v7;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[SHLLibraryItemMetadata allocWithZone:a3];

  return [(SHLLibraryItemMetadata *)v4 initWithMetadata:self];
}

- (BOOL)validEncodedSystemData:(id)a3
{
  return [a3 length] != 0;
}

- (NSData)encodedSystemData
{
  return self->_encodedSystemData;
}

- (void).cxx_destruct
{
}

@end