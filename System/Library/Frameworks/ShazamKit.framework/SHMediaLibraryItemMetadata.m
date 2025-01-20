@interface SHMediaLibraryItemMetadata
- (BOOL)validEncodedSystemData:(id)a3;
- (NSData)encodedSystemData;
- (SHMediaLibraryItemMetadata)initWithEncodedSystemData:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation SHMediaLibraryItemMetadata

- (SHMediaLibraryItemMetadata)initWithEncodedSystemData:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SHMediaLibraryItemMetadata;
  v6 = [(SHMediaLibraryItemMetadata *)&v10 init];
  v7 = v6;
  if (v6)
  {
    if (![(SHMediaLibraryItemMetadata *)v6 validEncodedSystemData:v5])
    {
      id v9 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"You must provide a valid encoded data." userInfo:0];
      objc_exception_throw(v9);
    }
    objc_storeStrong((id *)&v7->_encodedSystemData, a3);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = +[SHMediaLibraryItemMetadata allocWithZone:](SHMediaLibraryItemMetadata, "allocWithZone:");
  v6 = [(SHMediaLibraryItemMetadata *)self encodedSystemData];
  v7 = (void *)[v6 copyWithZone:a3];
  v8 = [(SHMediaLibraryItemMetadata *)v5 initWithEncodedSystemData:v7];

  return v8;
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