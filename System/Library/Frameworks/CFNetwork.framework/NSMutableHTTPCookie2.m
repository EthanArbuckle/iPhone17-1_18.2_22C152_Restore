@interface NSMutableHTTPCookie2
- (BOOL)isEqual:(id)a3;
- (NSMutableHTTPCookie2)initWithName:(id)a3 value:(id)a4 domain:(id)a5;
- (void)setDomain:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setHostOnly:(BOOL)a3;
- (void)setHttpOnly:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setPartition:(id)a3;
- (void)setPath:(id)a3;
- (void)setSameSite:(int64_t)a3;
- (void)setSecure:(BOOL)a3;
- (void)setSource:(int64_t)a3;
- (void)setValue:(id)a3;
@end

@implementation NSMutableHTTPCookie2

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  name = self->super._name;
  v6 = [v4 name];
  LOBYTE(name) = [(NSString *)name isEqualToString:v6];

  if ((name & 1) == 0) {
    goto LABEL_12;
  }
  path = self->super._path;
  v8 = [v4 path];
  LOBYTE(path) = [(NSString *)path isEqualToString:v8];

  if ((path & 1) == 0) {
    goto LABEL_12;
  }
  domain = self->super._domain;
  v10 = [v4 domain];
  LOBYTE(domain) = [(NSString *)domain isEqualToString:v10];

  if ((domain & 1) == 0) {
    goto LABEL_12;
  }
  partition = self->super._partition;
  v12 = [v4 partition];
  if (partition == v12)
  {
  }
  else
  {
    v13 = self->super._partition;
    v14 = [v4 partition];
    LOBYTE(v13) = [(NSString *)v13 isEqualToString:v14];

    if ((v13 & 1) == 0)
    {
LABEL_12:
      BOOL v19 = 0;
      goto LABEL_13;
    }
  }
  int hostOnly = self->super._hostOnly;
  if (hostOnly != [v4 hostOnly]) {
    goto LABEL_12;
  }
  int secure = self->super._secure;
  if (secure != [v4 secure]) {
    goto LABEL_12;
  }
  int64_t sameSite = self->super._sameSite;
  if (sameSite != [v4 sameSite]) {
    goto LABEL_12;
  }
  int httpOnly = self->super._httpOnly;
  BOOL v19 = httpOnly == [v4 httpOnly];
LABEL_13:

  return v19;
}

- (void)setSource:(int64_t)a3
{
  self->super._source = a3;
}

- (void)setExpirationDate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    [v4 timeIntervalSince1970];
    BOOL v5 = 0;
    self->super._sExpirationDate = vcvtad_u64_f64(v6);
    id v4 = v7;
  }
  else
  {
    BOOL v5 = 1;
  }
  self->super._session = v5;
}

- (void)setPartition:(id)a3
{
}

- (void)setHttpOnly:(BOOL)a3
{
  self->super._int httpOnly = a3;
}

- (void)setHostOnly:(BOOL)a3
{
  self->super._int hostOnly = a3;
}

- (void)setSecure:(BOOL)a3
{
  self->super._int secure = a3;
}

- (void)setSameSite:(int64_t)a3
{
  self->super._int64_t sameSite = a3;
}

- (void)setPath:(id)a3
{
}

- (void)setDomain:(id)a3
{
  id v10 = a3;
  if ([v10 hasPrefix:@"."])
  {
    id v4 = [v10 lowercaseString];
    domain = self->super._domain;
    self->super._domain = v4;
  }
  else
  {
    domain = [@"." stringByAppendingString:v10];
    double v6 = [domain lowercaseString];
    id v7 = self->super._domain;
    self->super._domain = v6;
  }
  +[NSHTTPCookieStorageUtils getEffectiveTLDPlusOne:]((uint64_t)NSHTTPCookieStorageUtils, self->super._domain);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  etldPlusOne = self->super._etldPlusOne;
  self->super._etldPlusOne = v8;
}

- (void)setValue:(id)a3
{
}

- (void)setName:(id)a3
{
}

- (NSMutableHTTPCookie2)initWithName:(id)a3 value:(id)a4 domain:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)NSMutableHTTPCookie2;
  return [(NSHTTPCookie2 *)&v6 initWithName:a3 value:a4 domain:a5];
}

@end