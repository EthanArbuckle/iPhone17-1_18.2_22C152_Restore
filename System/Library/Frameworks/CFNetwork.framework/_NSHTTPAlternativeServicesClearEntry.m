@interface _NSHTTPAlternativeServicesClearEntry
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
@end

@implementation _NSHTTPAlternativeServicesClearEntry

- (void).cxx_destruct
{
}

- (unint64_t)hash
{
  if (self)
  {
    uint64_t v3 = [(NSString *)self->_host hash];
    int64_t port = self->_port;
  }
  else
  {
    uint64_t v3 = [0 hash];
    int64_t port = 0;
  }
  return port ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_NSHTTPAlternativeServicesClearEntry *)a3;
  if (v4 == self)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if (self) {
        host = self->_host;
      }
      else {
        host = 0;
      }
      v7 = host;
      v8 = v7;
      if (v5) {
        v9 = v5->_host;
      }
      else {
        v9 = 0;
      }
      if (![(NSString *)v7 isEqualToString:v9])
      {
        BOOL v12 = 0;
        goto LABEL_15;
      }
      if (self)
      {
        int64_t port = self->_port;
        if (v5)
        {
LABEL_10:
          int64_t v11 = v5->_port;
LABEL_11:
          BOOL v12 = port == v11;
LABEL_15:

          goto LABEL_16;
        }
      }
      else
      {
        int64_t port = 0;
        if (v5) {
          goto LABEL_10;
        }
      }
      int64_t v11 = 0;
      goto LABEL_11;
    }
    BOOL v12 = 0;
  }
LABEL_16:

  return v12;
}

@end