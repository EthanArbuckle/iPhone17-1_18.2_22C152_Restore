@interface MCBookmark
- (BOOL)isEqual:(id)a3;
- (MCBookmark)initWithSerializableDictionary:(id)a3;
- (NSString)path;
- (NSString)title;
- (NSURL)URL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)serializableDictionary;
- (void)setPath:(id)a3;
- (void)setTitle:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation MCBookmark

- (MCBookmark)initWithSerializableDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MCBookmark;
  v5 = [(MCBookmark *)&v15 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CB10];
    v7 = [v4 objectForKeyedSubscript:@"address"];
    uint64_t v8 = [v6 URLWithString:v7];
    URL = v5->_URL;
    v5->_URL = (NSURL *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"pageTitle"];
    title = v5->_title;
    v5->_title = (NSString *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"bookmarkPath"];
    path = v5->_path;
    v5->_path = (NSString *)v12;
  }
  return v5;
}

- (id)serializableDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(MCBookmark *)self URL];

  if (v4)
  {
    v5 = [(MCBookmark *)self URL];
    v6 = [v5 absoluteString];
    [v3 setObject:v6 forKeyedSubscript:@"address"];
  }
  v7 = [(MCBookmark *)self title];

  if (v7)
  {
    uint64_t v8 = [(MCBookmark *)self title];
    [v3 setObject:v8 forKeyedSubscript:@"pageTitle"];
  }
  v9 = [(MCBookmark *)self path];

  if (v9)
  {
    uint64_t v10 = [(MCBookmark *)self path];
    [v3 setObject:v10 forKeyedSubscript:@"bookmarkPath"];
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [MCBookmark alloc];
  v5 = [(MCBookmark *)self serializableDictionary];
  v6 = [(MCBookmark *)v4 initWithSerializableDictionary:v5];

  return v6;
}

- (id)description
{
  v12.receiver = self;
  v12.super_class = (Class)MCBookmark;
  v3 = [(MCBookmark *)&v12 description];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(MCBookmark *)self URL];

  if (v5)
  {
    v6 = [(MCBookmark *)self URL];
    [v4 appendFormat:@", URL: %@", v6];
  }
  v7 = [(MCBookmark *)self title];

  if (v7)
  {
    uint64_t v8 = [(MCBookmark *)self title];
    [v4 appendFormat:@", Title: %@", v8];
  }
  v9 = [(MCBookmark *)self path];

  if (v9)
  {
    uint64_t v10 = [(MCBookmark *)self path];
    [v4 appendFormat:@", Path: %@", v10];
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    uint64_t v8 = [(MCBookmark *)self URL];
    v9 = [v7 URL];
    if (v8 != v9)
    {
      v3 = [(MCBookmark *)self URL];
      id v4 = [v7 URL];
      if (![v3 isEqual:v4])
      {
        unsigned __int8 v10 = 0;
        goto LABEL_17;
      }
    }
    v11 = [(MCBookmark *)self title];
    objc_super v12 = [v7 title];
    if (v11 == v12)
    {
      v25 = v11;
    }
    else
    {
      v13 = [(MCBookmark *)self title];
      v26 = [v7 title];
      if (!objc_msgSend(v13, "isEqualToString:"))
      {
        unsigned __int8 v10 = 0;
        goto LABEL_15;
      }
      v24 = v13;
      v25 = v11;
    }
    v14 = [(MCBookmark *)self path];
    uint64_t v15 = [v7 path];
    if (v14 == (void *)v15)
    {

      unsigned __int8 v10 = 1;
    }
    else
    {
      v16 = (void *)v15;
      [(MCBookmark *)self path];
      v17 = v23 = v3;
      [v7 path];
      v22 = v4;
      v18 = v9;
      v20 = v19 = v8;
      unsigned __int8 v10 = [v17 isEqualToString:v20];

      uint64_t v8 = v19;
      v9 = v18;
      id v4 = v22;

      v3 = v23;
    }
    v13 = v24;
    v11 = v25;
    if (v25 == v12)
    {
LABEL_16:

      if (v8 == v9)
      {
LABEL_18:

        goto LABEL_19;
      }
LABEL_17:

      goto LABEL_18;
    }
LABEL_15:

    goto LABEL_16;
  }
  v27.receiver = self;
  v27.super_class = (Class)MCBookmark;
  unsigned __int8 v10 = [(MCBookmark *)&v27 isEqual:v6];
LABEL_19:

  return v10;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end