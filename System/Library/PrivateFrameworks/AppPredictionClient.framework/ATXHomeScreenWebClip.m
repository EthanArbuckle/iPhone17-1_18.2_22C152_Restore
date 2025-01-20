@interface ATXHomeScreenWebClip
+ (BOOL)supportsSecureCoding;
- (ATXHomeScreenWebClip)initWithCoder:(id)a3;
- (ATXHomeScreenWebClip)initWithUUID:(id)a3 name:(id)a4 url:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXHomeScreenWebClip:(id)a3;
- (NSString)name;
- (NSString)uuid;
- (NSURL)url;
- (id)dictionaryRepresentationForIntrospection;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXHomeScreenWebClip

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXHomeScreenWebClip)initWithUUID:(id)a3 name:(id)a4 url:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ATXHomeScreenWebClip;
  v11 = [(ATXHomeScreenWebClip *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    uuid = v11->_uuid;
    v11->_uuid = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    name = v11->_name;
    v11->_name = (NSString *)v14;

    objc_storeStrong((id *)&v11->_url, a5);
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"name"];
  [v5 encodeObject:self->_url forKey:@"url"];
  [v5 encodeObject:self->_uuid forKey:@"uuid"];
}

- (ATXHomeScreenWebClip)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXHomeScreenWebClip;
  id v5 = [(ATXHomeScreenWebClip *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    url = v5->_url;
    v5->_url = (NSURL *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v10;
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSURL *)self->_url hash];
  return [(NSString *)self->_uuid hash] - v3 + 32 * v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXHomeScreenWebClip *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXHomeScreenWebClip *)self isEqualToATXHomeScreenWebClip:v5];

  return v6;
}

- (BOOL)isEqualToATXHomeScreenWebClip:(id)a3
{
  id v4 = (id *)a3;
  uuid = self->_uuid;
  BOOL v6 = (NSString *)v4[1];
  if (uuid == v6)
  {
  }
  else
  {
    v7 = v6;
    uint64_t v8 = uuid;
    char v9 = [(NSString *)v8 isEqual:v7];

    if ((v9 & 1) == 0)
    {
      char v10 = 0;
      goto LABEL_9;
    }
  }
  v11 = self->_url;
  uint64_t v12 = v11;
  if (v11 == v4[3]) {
    char v10 = 1;
  }
  else {
    char v10 = -[NSURL isEqual:](v11, "isEqual:");
  }

LABEL_9:
  return v10;
}

- (id)dictionaryRepresentationForIntrospection
{
  v12[3] = *MEMORY[0x1E4F143B8];
  name = (__CFString *)self->_name;
  url = self->_url;
  if (!name) {
    name = @"<nil>";
  }
  v12[0] = name;
  v11[0] = @"name";
  v11[1] = @"url";
  uint64_t v5 = [(NSURL *)url absoluteString];
  BOOL v6 = (void *)v5;
  if (v5) {
    v7 = (__CFString *)v5;
  }
  else {
    v7 = @"<nil>";
  }
  v11[2] = @"uuid";
  uuid = (__CFString *)self->_uuid;
  if (!uuid) {
    uuid = @"<nil>";
  }
  v12[1] = v7;
  v12[2] = uuid;
  char v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  return v9;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (NSString)name
{
  return self->_name;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

@end