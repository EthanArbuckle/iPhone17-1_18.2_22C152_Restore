@interface DAMailboxFetchSearchResultRequest
- (BOOL)isEqual:(id)a3;
- (NSString)folderID;
- (NSString)longID;
- (NSString)serverID;
- (id)description;
- (id)initRequestForBodyFormat:(int)a3 withFolderID:(id)a4 withServerID:(id)a5 withLongID:(id)a6 withBodySizeLimit:(int)a7;
- (id)initRequestForBodyFormat:(int)a3 withLongID:(id)a4 withBodySizeLimit:(int)a5;
- (int)bodyFormat;
- (int)maxSize;
- (unint64_t)hash;
- (void)setBodyFormat:(int)a3;
- (void)setFolderID:(id)a3;
- (void)setLongID:(id)a3;
- (void)setMaxSize:(int)a3;
- (void)setServerID:(id)a3;
@end

@implementation DAMailboxFetchSearchResultRequest

- (id)initRequestForBodyFormat:(int)a3 withLongID:(id)a4 withBodySizeLimit:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DAMailboxFetchSearchResultRequest;
  v9 = [(DAMailboxFetchSearchResultRequest *)&v12 init];
  if (v9)
  {
    v10 = (void *)[v8 copy];
    [(DAMailboxFetchSearchResultRequest *)v9 setLongID:v10];

    [(DAMailboxFetchSearchResultRequest *)v9 setBodyFormat:v6];
    [(DAMailboxFetchSearchResultRequest *)v9 setMaxSize:v5];
  }

  return v9;
}

- (id)initRequestForBodyFormat:(int)a3 withFolderID:(id)a4 withServerID:(id)a5 withLongID:(id)a6 withBodySizeLimit:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v10 = *(void *)&a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)DAMailboxFetchSearchResultRequest;
  v15 = [(DAMailboxFetchSearchResultRequest *)&v20 init];
  if (v15)
  {
    v16 = (void *)[v12 copy];
    [(DAMailboxFetchSearchResultRequest *)v15 setFolderID:v16];

    v17 = (void *)[v13 copy];
    [(DAMailboxFetchSearchResultRequest *)v15 setServerID:v17];

    v18 = (void *)[v14 copy];
    [(DAMailboxFetchSearchResultRequest *)v15 setLongID:v18];

    [(DAMailboxFetchSearchResultRequest *)v15 setBodyFormat:v10];
    [(DAMailboxFetchSearchResultRequest *)v15 setMaxSize:v7];
  }

  return v15;
}

- (unint64_t)hash
{
  id v3 = [NSString alloc];
  v4 = [(DAMailboxFetchSearchResultRequest *)self longID];
  uint64_t v5 = (void *)[v3 initWithFormat:@"%@\n%d\n%d", v4, -[DAMailboxFetchSearchResultRequest maxSize](self, "maxSize"), -[DAMailboxFetchSearchResultRequest bodyFormat](self, "bodyFormat")];

  unint64_t v6 = [v5 hash];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    id v8 = [(DAMailboxFetchSearchResultRequest *)self longID];
    v9 = [v7 longID];
    if (v8 == v9
      || ([(DAMailboxFetchSearchResultRequest *)self longID],
          id v3 = objc_claimAutoreleasedReturnValue(),
          [v7 longID],
          v4 = objc_claimAutoreleasedReturnValue(),
          [v3 isEqual:v4]))
    {
      int v11 = [v7 maxSize];
      if (v11 == [(DAMailboxFetchSearchResultRequest *)self maxSize])
      {
        int v12 = [v7 bodyFormat];
        BOOL v10 = v12 == [(DAMailboxFetchSearchResultRequest *)self bodyFormat];
      }
      else
      {
        BOOL v10 = 0;
      }
      if (v8 == v9) {
        goto LABEL_11;
      }
    }
    else
    {
      BOOL v10 = 0;
    }

LABEL_11:
    goto LABEL_12;
  }
  BOOL v10 = 0;
LABEL_12:

  return v10;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)DAMailboxFetchSearchResultRequest;
  v4 = [(DAMailboxFetchSearchResultRequest *)&v8 description];
  uint64_t v5 = [(DAMailboxFetchSearchResultRequest *)self longID];
  id v6 = [v3 stringWithFormat:@"%@ longID \"%@\", maxSize %d, bodyFormat %d", v4, v5, -[DAMailboxFetchSearchResultRequest maxSize](self, "maxSize"), -[DAMailboxFetchSearchResultRequest bodyFormat](self, "bodyFormat")];

  return v6;
}

- (NSString)longID
{
  return self->_longID;
}

- (void)setLongID:(id)a3
{
}

- (NSString)folderID
{
  return self->_folderID;
}

- (void)setFolderID:(id)a3
{
}

- (NSString)serverID
{
  return self->_serverID;
}

- (void)setServerID:(id)a3
{
}

- (int)bodyFormat
{
  return self->_bodyFormat;
}

- (void)setBodyFormat:(int)a3
{
  self->_bodyFormat = a3;
}

- (int)maxSize
{
  return self->_maxSize;
}

- (void)setMaxSize:(int)a3
{
  self->_maxSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverID, 0);
  objc_storeStrong((id *)&self->_folderID, 0);
  objc_storeStrong((id *)&self->_longID, 0);
}

@end