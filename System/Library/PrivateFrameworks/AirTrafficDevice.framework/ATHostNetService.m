@interface ATHostNetService
- (ATHostNetService)initWithNetService:(id)a3;
- (NSNetService)netService;
- (NSString)libraryIdentifier;
@end

@implementation ATHostNetService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryIdentifier, 0);

  objc_storeStrong((id *)&self->_netService, 0);
}

- (NSString)libraryIdentifier
{
  return self->_libraryIdentifier;
}

- (NSNetService)netService
{
  return self->_netService;
}

- (ATHostNetService)initWithNetService:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ATHostNetService;
  v6 = [(ATHostNetService *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_netService, a3);
    v8 = [v5 TXTRecordData];
    if (v8)
    {
      v9 = [MEMORY[0x1E4F28E90] dictionaryFromTXTRecordData:v8];
    }
    else
    {
      v9 = 0;
    }
    v10 = NSString;
    v11 = [NSString stringWithCString:"libid" encoding:1];
    id v12 = [v9 objectForKey:v11];
    uint64_t v13 = objc_msgSend(v10, "stringWithCString:encoding:", objc_msgSend(v12, "bytes"), 4);
    libraryIdentifier = v7->_libraryIdentifier;
    v7->_libraryIdentifier = (NSString *)v13;
  }
  return v7;
}

@end