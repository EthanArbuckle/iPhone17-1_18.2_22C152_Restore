@interface MPServerObjectDatabaseAsset
- (MPServerObjectDatabaseAsset)initWithIdentifier:(id)a3 hashedPersonID:(id)a4 flavor:(int64_t)a5 url:(id)a6 miniSINF:(id)a7;
- (MPServerObjectDatabaseAsset)initWithIdentifier:(id)a3 hashedPersonID:(id)a4 flavor:(int64_t)a5 url:(id)a6 sinfs:(id)a7;
- (MPServerObjectDatabaseAsset)initWithSQLRowResult:(id)a3;
- (NSArray)sinfs;
- (NSData)miniSINF;
- (NSString)hashedPersonID;
- (NSString)identifier;
- (NSURL)url;
- (id)_initWithIdentifier:(id)a3 hashedPersonID:(id)a4 flavor:(int64_t)a5 url:(id)a6 miniSINF:(id)a7 sinfs:(id)a8;
- (id)description;
- (int64_t)flavor;
@end

@implementation MPServerObjectDatabaseAsset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sinfs, 0);
  objc_storeStrong((id *)&self->_miniSINF, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_hashedPersonID, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSArray)sinfs
{
  return self->_sinfs;
}

- (NSData)miniSINF
{
  return self->_miniSINF;
}

- (NSURL)url
{
  return self->_url;
}

- (int64_t)flavor
{
  return self->_flavor;
}

- (NSString)hashedPersonID
{
  return self->_hashedPersonID;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)description
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v3 = self->_sinfs;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = [*(id *)(*((void *)&v19 + 1) + 8 * v7) objectForKeyedSubscript:@"sinf2"];
        if (_NSIsNSString())
        {
          uint64_t v9 = [v8 length];

          goto LABEL_11;
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v9 = 0;
LABEL_11:

  v10 = NSString;
  uint64_t v11 = objc_opt_class();
  identifier = self->_identifier;
  hashedPersonID = self->_hashedPersonID;
  unint64_t v14 = self->_flavor - 1;
  if (v14 > 3) {
    v15 = @"unknown";
  }
  else {
    v15 = off_1E57F54B0[v14];
  }
  NSUInteger v16 = [(NSData *)self->_miniSINF length];
  v17 = [v10 stringWithFormat:@"<%@: %p hashedPersonID=%@ identifier=%@ flavor=%@ miniSinf=%lld bytes sinf2=%lld bytes url=%@", v11, self, hashedPersonID, identifier, v15, v16, v9, self->_url, (void)v19];

  return v17;
}

- (MPServerObjectDatabaseAsset)initWithSQLRowResult:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 stringValueAtColumnIndex:0];
  uint64_t v6 = 1;
  uint64_t v7 = [v4 stringValueAtColumnIndex:1];
  id v8 = [v4 stringValueAtColumnIndex:2];
  if (([&unk_1EE6EDFD0 containsObject:v8] & 1) == 0)
  {
    if ([&unk_1EE6EDFE8 containsObject:v8])
    {
      uint64_t v6 = 2;
    }
    else if ([&unk_1EE6EE000 containsObject:v8])
    {
      uint64_t v6 = 3;
    }
    else if ([&unk_1EE6EE018 containsObject:v8])
    {
      uint64_t v6 = 4;
    }
    else
    {
      uint64_t v6 = 0;
    }
  }

  uint64_t v9 = [v4 stringValueAtColumnIndex:3];
  v10 = [MEMORY[0x1E4F1CB10] URLWithString:v9];
  uint64_t v11 = [v4 dataValueAtColumnIndex:4];
  if ([v11 length] == 1)
  {

    uint64_t v11 = 0;
  }
  v12 = [v4 jsonValueAtColumnIndex:5 error:0];
  v13 = [(MPServerObjectDatabaseAsset *)self _initWithIdentifier:v5 hashedPersonID:v7 flavor:v6 url:v10 miniSINF:v11 sinfs:v12];

  return v13;
}

- (id)_initWithIdentifier:(id)a3 hashedPersonID:(id)a4 flavor:(int64_t)a5 url:(id)a6 miniSINF:(id)a7 sinfs:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v31.receiver = self;
  v31.super_class = (Class)MPServerObjectDatabaseAsset;
  long long v19 = [(MPServerObjectDatabaseAsset *)&v31 init];
  if (v19)
  {
    uint64_t v20 = [v14 copy];
    identifier = v19->_identifier;
    v19->_identifier = (NSString *)v20;

    uint64_t v22 = [v15 copy];
    hashedPersonID = v19->_hashedPersonID;
    v19->_hashedPersonID = (NSString *)v22;

    v19->_flavor = a5;
    uint64_t v24 = [v16 copy];
    url = v19->_url;
    v19->_url = (NSURL *)v24;

    uint64_t v26 = [v18 copy];
    sinfs = v19->_sinfs;
    v19->_sinfs = (NSArray *)v26;

    uint64_t v28 = [v17 copy];
    miniSINF = v19->_miniSINF;
    v19->_miniSINF = (NSData *)v28;
  }
  return v19;
}

- (MPServerObjectDatabaseAsset)initWithIdentifier:(id)a3 hashedPersonID:(id)a4 flavor:(int64_t)a5 url:(id)a6 sinfs:(id)a7
{
  return (MPServerObjectDatabaseAsset *)[(MPServerObjectDatabaseAsset *)self _initWithIdentifier:a3 hashedPersonID:a4 flavor:a5 url:a6 miniSINF:0 sinfs:a7];
}

- (MPServerObjectDatabaseAsset)initWithIdentifier:(id)a3 hashedPersonID:(id)a4 flavor:(int64_t)a5 url:(id)a6 miniSINF:(id)a7
{
  return (MPServerObjectDatabaseAsset *)[(MPServerObjectDatabaseAsset *)self _initWithIdentifier:a3 hashedPersonID:a4 flavor:a5 url:a6 miniSINF:a7 sinfs:0];
}

@end