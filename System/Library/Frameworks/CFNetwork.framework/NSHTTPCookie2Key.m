@interface NSHTTPCookie2Key
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
- (void)initWithHTTPCookie2:(void *)a1;
@end

@implementation NSHTTPCookie2Key

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partition, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_domain, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  NSUInteger v4 = [(NSString *)self->_partition hash] - v3 + 32 * v3;
  NSUInteger v5 = [(NSString *)self->_path hash] - v4 + 32 * v4;
  return [(NSString *)self->_domain hash] - v5 + 32 * v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v6 = v4;
  name = self->_name;
  if (v4) {
    id Property = objc_getProperty(v4, v5, 8, 1);
  }
  else {
    id Property = 0;
  }
  if ([(NSString *)name isEqualToString:Property])
  {
    path = self->_path;
    id v11 = v6 ? objc_getProperty(v6, v9, 24, 1) : 0;
    if ([(NSString *)path isEqualToString:v11])
    {
      domain = self->_domain;
      id v14 = v6 ? objc_getProperty(v6, v12, 16, 1) : 0;
      if ([(NSString *)domain isEqualToString:v14])
      {
        partition = self->_partition;
        if (v6)
        {
          v17 = (NSString *)objc_getProperty(v6, v15, 32, 1);
          if (partition == v17)
          {
            char v21 = 1;
            v19 = partition;
            goto LABEL_17;
          }
          v19 = v17;
          partition = self->_partition;
          id v20 = objc_getProperty(v6, v18, 32, 1);
        }
        else
        {
          v19 = 0;
          if (!partition)
          {
            char v21 = 1;
            goto LABEL_17;
          }
          id v20 = 0;
        }
        char v21 = [(NSString *)partition isEqualToString:v20];
LABEL_17:

        goto LABEL_15;
      }
    }
  }
  char v21 = 0;
LABEL_15:

  return v21;
}

- (void)initWithHTTPCookie2:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)NSHTTPCookie2Key;
    a1 = objc_msgSendSuper2(&v13, sel_init);
    if (a1)
    {
      uint64_t v4 = [v3 name];
      NSUInteger v5 = (void *)a1[1];
      a1[1] = v4;

      uint64_t v6 = [v3 partition];
      v7 = (void *)a1[4];
      a1[4] = v6;

      uint64_t v8 = [v3 path];
      v9 = (void *)a1[3];
      a1[3] = v8;

      uint64_t v10 = [v3 domain];
      id v11 = (void *)a1[2];
      a1[2] = v10;
    }
  }

  return a1;
}

@end