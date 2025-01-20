@interface CSUnhousedSearchQuery
- (CSSearchConnection)savedConnection;
- (CSUnhousedSearchQuery)initWithPath:(id)a3 queryString:(id)a4 attributers:(id)a5;
- (CSUnhousedSearchQuery)initWithPath:(id)a3 queryString:(id)a4 context:(id)a5;
- (CSUnhousedSearchQuery)initWithPath:(id)a3 queryString:(id)a4 context:(id)a5 attributes:(id)a6;
- (NSString)indexPath;
- (NSString)resolvedIndexPath;
- (id)connection;
- (id)debugDescriptionWithQueryString:(BOOL)a3;
- (id)initialConnection;
- (void)setIndexPath:(id)a3;
- (void)setSavedConnection:(id)a3;
- (void)start;
@end

@implementation CSUnhousedSearchQuery

- (CSUnhousedSearchQuery)initWithPath:(id)a3 queryString:(id)a4 attributers:(id)a5
{
  return [(CSUnhousedSearchQuery *)self initWithPath:a3 queryString:a4 context:0 attributes:a5];
}

- (CSUnhousedSearchQuery)initWithPath:(id)a3 queryString:(id)a4 context:(id)a5
{
  return [(CSUnhousedSearchQuery *)self initWithPath:a3 queryString:a4 context:a5 attributes:0];
}

- (CSUnhousedSearchQuery)initWithPath:(id)a3 queryString:(id)a4 context:(id)a5 attributes:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v12) {
    v14 = -[CSSearchQuery initWithQueryString:context:](&v18, sel_initWithQueryString_context_, v11, v12, v17.receiver, v17.super_class, self, CSUnhousedSearchQuery);
  }
  else {
    v14 = -[CSSearchQuery initWithQueryString:attributes:](&v17, sel_initWithQueryString_attributes_, v11, v13, self, CSUnhousedSearchQuery, v18.receiver, v18.super_class);
  }
  v15 = v14;
  if (v14) {
    [(CSUnhousedSearchQuery *)v14 setIndexPath:v10];
  }

  return v15;
}

- (id)initialConnection
{
  return 0;
}

- (id)connection
{
  savedConnection = self->_savedConnection;
  if (!savedConnection)
  {
    v4 = [(CSUnhousedSearchQuery *)self initialConnection];
    v5 = self->_savedConnection;
    self->_savedConnection = v4;

    savedConnection = self->_savedConnection;
  }
  v6 = savedConnection;

  return v6;
}

- (NSString)resolvedIndexPath
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  resolvedIndexPath = self->_resolvedIndexPath;
  if (!resolvedIndexPath)
  {
    v4 = self;
    objc_sync_enter(v4);
    if (!self->_resolvedIndexPath)
    {
      int v14 = 0;
      v6 = [(CSUnhousedSearchQuery *)v4 indexPath];
      CSResolveUnhousedIndexPath(v6, &v14);
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      v8 = self->_resolvedIndexPath;
      self->_resolvedIndexPath = v7;

      v9 = [(CSUnhousedSearchQuery *)v4 indexPath];
      if (v9)
      {
        BOOL v10 = self->_resolvedIndexPath == 0;

        if (v10)
        {
          id v11 = logForCSLogCategoryDefault();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            int v12 = v14;
            id v13 = [(CSUnhousedSearchQuery *)v4 indexPath];
            [(CSUnhousedUserQuery *)v13 resolvedIndexPath];
          }
        }
      }
    }
    objc_sync_exit(v4);

    resolvedIndexPath = self->_resolvedIndexPath;
  }

  return resolvedIndexPath;
}

- (void)start
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CSUnhousedSearchQuery *)self indexPath];
  if (v3)
  {
    v4 = (void *)v3;
    v5 = [(CSUnhousedSearchQuery *)self resolvedIndexPath];
    if (v5)
    {
    }
    else
    {
      v6 = [(CSSearchQuery *)self completionHandler];

      if (v6)
      {
        v7 = NSString;
        v8 = [(CSUnhousedSearchQuery *)self indexPath];
        v9 = [v7 stringWithFormat:@"Couldn't resolve index path: \"%@\"", v8];

        BOOL v10 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v14 = *MEMORY[0x1E4F28568];
        v15[0] = v9;
        id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
        int v12 = [v10 errorWithDomain:@"CSSearchQueryErrorDomain" code:-2001 userInfo:v11];
        [(CSSearchQuery *)self handleCompletion:v12];

        return;
      }
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)CSUnhousedSearchQuery;
  [(CSSearchQuery *)&v13 start];
}

- (id)debugDescriptionWithQueryString:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CSUnhousedSearchQuery;
  v4 = [(CSSearchQuery *)&v10 debugDescriptionWithQueryString:a3];
  v5 = (void *)[v4 mutableCopy];

  v6 = NSString;
  v7 = [(CSUnhousedSearchQuery *)self indexPath];
  v8 = [v6 stringWithFormat:@" indexPath=%@", v7];
  objc_msgSend(v5, "insertString:atIndex:", v8, objc_msgSend(v5, "length") - 1);

  return v5;
}

- (NSString)indexPath
{
  return self->_indexPath;
}

- (void)setIndexPath:(id)a3
{
}

- (CSSearchConnection)savedConnection
{
  return self->_savedConnection;
}

- (void)setSavedConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedConnection, 0);
  objc_storeStrong((id *)&self->_indexPath, 0);

  objc_storeStrong((id *)&self->_resolvedIndexPath, 0);
}

@end