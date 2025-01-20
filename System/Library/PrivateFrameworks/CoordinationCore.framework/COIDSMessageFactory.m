@interface COIDSMessageFactory
- (COIDSMessageFactory)init;
- (NSString)idsIdentifier;
- (NSString)meshName;
- (id)decodeDictionary:(id)a3 error:(id *)a4;
- (id)encodeError:(id)a3;
- (id)encodeRequest:(id)a3 withIDSIdentifier:(BOOL)a4;
- (id)encodeResponse:(id)a3;
@end

@implementation COIDSMessageFactory

- (COIDSMessageFactory)init
{
  v6.receiver = self;
  v6.super_class = (Class)COIDSMessageFactory;
  v2 = [(COIDSMessageFactory *)&v6 init];
  if (v2)
  {
    uint64_t v3 = IDSCopyLocalDeviceUniqueID();
    idsIdentifier = v2->_idsIdentifier;
    v2->_idsIdentifier = (NSString *)v3;
  }
  return v2;
}

- (id)encodeRequest:(id)a3 withIDSIdentifier:(BOOL)a4
{
  BOOL v4 = a4;
  v12[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [[COIDSMessage alloc] initWithRequest:v6];

  if (v4)
  {
    idsIdentifier = self->_idsIdentifier;
    v11 = @"IDMK";
    v12[0] = idsIdentifier;
    v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    [(COIDSMessage *)v7 setMetadata:v9];
  }
  return v7;
}

- (id)encodeResponse:(id)a3
{
  id v3 = a3;
  BOOL v4 = [[COIDSMessage alloc] initWithResponse:v3];

  return v4;
}

- (id)encodeError:(id)a3
{
  id v3 = a3;
  BOOL v4 = [[COIDSMessage alloc] initWithError:v3];

  return v4;
}

- (id)decodeDictionary:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [[COIDSMessage alloc] initWithDictionary:v5 error:a4];

  return v6;
}

- (NSString)meshName
{
  return self->_meshName;
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_meshName, 0);
}

@end