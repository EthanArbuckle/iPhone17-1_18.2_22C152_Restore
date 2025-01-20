@interface RepairToolURLFactory
- (NSArray)requestItems;
- (NSString)encryptionKey;
- (RepairToolURLFactory)initWithRequestItems:(id)a3;
- (id)urlRequest;
- (int)currentIndex;
- (void)setCurrentIndex:(int)a3;
- (void)setEncryptionKey:(id)a3;
- (void)setRequestItems:(id)a3;
@end

@implementation RepairToolURLFactory

- (RepairToolURLFactory)initWithRequestItems:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RepairToolURLFactory;
  v6 = [(RepairToolURLFactory *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_requestItems, a3);
    v7->_currentIndex = 0;
  }

  return v7;
}

- (id)urlRequest
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v3 = [(RepairToolURLFactory *)self requestItems];
  unint64_t v4 = [v3 count];
  int v5 = [(RepairToolURLFactory *)self currentIndex];

  if (v4 >= v5)
  {
    v7 = [(RepairToolURLFactory *)self requestItems];
    v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", -[RepairToolURLFactory currentIndex](self, "currentIndex"));

    objc_super v9 = NSURL;
    v10 = [v8 destination];
    uint64_t v11 = [v9 URLWithString:v10];

    v23 = (void *)v11;
    v6 = [MEMORY[0x263F089E0] requestWithURL:v11];
    [v6 setHTTPMethod:@"POST"];
    v12 = [v8 token];
    [v6 setValue:v12 forHTTPHeaderField:@"X-Apple-File-Upload-Token"];

    v13 = [v8 encryptionKey];
    [v6 setValue:v13 forHTTPHeaderField:@"X-Apple-Encrypted-key"];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v14 = [v8 extraHeaders];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          v20 = [v8 extraHeaders];
          v21 = [v20 objectForKeyedSubscript:v19];
          [v6 setValue:v21 forHTTPHeaderField:v19];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v16);
    }

    [(RepairToolURLFactory *)self setCurrentIndex:[(RepairToolURLFactory *)self currentIndex] + 1];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)encryptionKey
{
  return self->_encryptionKey;
}

- (void)setEncryptionKey:(id)a3
{
}

- (NSArray)requestItems
{
  return self->_requestItems;
}

- (void)setRequestItems:(id)a3
{
}

- (int)currentIndex
{
  return self->_currentIndex;
}

- (void)setCurrentIndex:(int)a3
{
  self->_currentIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestItems, 0);

  objc_storeStrong((id *)&self->_encryptionKey, 0);
}

@end