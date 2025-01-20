@interface MPServerObjectDatabaseHLSAsset
- (BOOL)isiTunesStoreStream;
- (MPServerObjectDatabaseHLSAsset)initWithSQLRowResult:(id)a3;
- (NSNumber)keyServerAdamID;
- (NSString)hashedPersonID;
- (NSString)identifier;
- (NSString)keyServerProtocolType;
- (NSURL)keyCertificateURL;
- (NSURL)keyServerURL;
- (NSURL)playlistURL;
- (id)_initWithIdentifier:(id)a3 hashedPersonID:(id)a4 playlistURL:(id)a5 keyCertificateURL:(id)a6 keyServerURL:(id)a7 keyServerAdamID:(id)a8 keyServerProtocolType:(id)a9 isiTunesStoreStream:(BOOL)a10;
@end

@implementation MPServerObjectDatabaseHLSAsset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyServerProtocolType, 0);
  objc_storeStrong((id *)&self->_keyServerAdamID, 0);
  objc_storeStrong((id *)&self->_keyServerURL, 0);
  objc_storeStrong((id *)&self->_keyCertificateURL, 0);
  objc_storeStrong((id *)&self->_playlistURL, 0);
  objc_storeStrong((id *)&self->_hashedPersonID, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BOOL)isiTunesStoreStream
{
  return self->_iTunesStoreStream;
}

- (NSString)keyServerProtocolType
{
  return self->_keyServerProtocolType;
}

- (NSNumber)keyServerAdamID
{
  return self->_keyServerAdamID;
}

- (NSURL)keyServerURL
{
  return self->_keyServerURL;
}

- (NSURL)keyCertificateURL
{
  return self->_keyCertificateURL;
}

- (NSURL)playlistURL
{
  return self->_playlistURL;
}

- (NSString)hashedPersonID
{
  return self->_hashedPersonID;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (MPServerObjectDatabaseHLSAsset)initWithSQLRowResult:(id)a3
{
  id v4 = a3;
  v5 = [v4 stringValueAtColumnIndex:0];
  v6 = [v4 stringValueAtColumnIndex:1];
  v7 = (void *)MEMORY[0x1E4F1CB10];
  v8 = [v4 stringValueAtColumnIndex:2];
  v9 = [v7 URLWithString:v8];

  v10 = [v4 stringValueAtColumnIndex:3];
  if ([v10 length])
  {
    v11 = [MEMORY[0x1E4F1CB10] URLWithString:v10];
  }
  else
  {
    v11 = 0;
  }
  v12 = [v4 stringValueAtColumnIndex:4];

  if ([v12 length])
  {
    v13 = [MEMORY[0x1E4F1CB10] URLWithString:v12];
  }
  else
  {
    v13 = 0;
  }
  uint64_t v14 = [v4 int64ValueAtColumnIndex:5];
  if (v14)
  {
    v15 = [NSNumber numberWithLongLong:v14];
  }
  else
  {
    v15 = 0;
  }
  v16 = [v4 stringValueAtColumnIndex:6];
  LOBYTE(v19) = [v4 BOOLValueAtColumnIndex:7];
  v17 = [(MPServerObjectDatabaseHLSAsset *)self _initWithIdentifier:v5 hashedPersonID:v6 playlistURL:v9 keyCertificateURL:v11 keyServerURL:v13 keyServerAdamID:v15 keyServerProtocolType:v16 isiTunesStoreStream:v19];

  return v17;
}

- (id)_initWithIdentifier:(id)a3 hashedPersonID:(id)a4 playlistURL:(id)a5 keyCertificateURL:(id)a6 keyServerURL:(id)a7 keyServerAdamID:(id)a8 keyServerProtocolType:(id)a9 isiTunesStoreStream:(BOOL)a10
{
  id v28 = a3;
  id v16 = a4;
  id v17 = a5;
  id v27 = a6;
  id v26 = a7;
  id v18 = a8;
  id v19 = a9;
  v29.receiver = self;
  v29.super_class = (Class)MPServerObjectDatabaseHLSAsset;
  v20 = [(MPServerObjectDatabaseHLSAsset *)&v29 init];
  if (v20)
  {
    uint64_t v21 = [v28 copy];
    identifier = v20->_identifier;
    v20->_identifier = (NSString *)v21;

    uint64_t v23 = [v16 copy];
    hashedPersonID = v20->_hashedPersonID;
    v20->_hashedPersonID = (NSString *)v23;

    objc_storeStrong((id *)&v20->_playlistURL, a5);
    objc_storeStrong((id *)&v20->_keyCertificateURL, a6);
    objc_storeStrong((id *)&v20->_keyServerURL, a7);
    objc_storeStrong((id *)&v20->_keyServerAdamID, a8);
    objc_storeStrong((id *)&v20->_keyServerProtocolType, a9);
    v20->_iTunesStoreStream = a10;
  }

  return v20;
}

@end