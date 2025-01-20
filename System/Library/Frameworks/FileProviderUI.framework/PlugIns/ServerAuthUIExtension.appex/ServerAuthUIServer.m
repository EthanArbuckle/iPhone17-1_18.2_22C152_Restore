@interface ServerAuthUIServer
- (BOOL)isEqual:(id)a3;
- (NSString)displayName;
- (NSString)identifier;
- (NSURL)url;
- (ServerAuthUIServer)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation ServerAuthUIServer

- (ServerAuthUIServer)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ServerAuthUIServer;
  v5 = [(ServerAuthUIServer *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    url = v5->_url;
    v5->_url = (NSURL *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ServerAuthUIServer *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  uint64_t v6 = [(ServerAuthUIServer *)self displayName];
  [v4 encodeObject:v6 forKey:@"displayName"];

  id v7 = [(ServerAuthUIServer *)self url];
  [v4 encodeObject:v7 forKey:@"url"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    identifier = self->_identifier;
    id v7 = [v5 identifier];
    if ([(NSString *)identifier isEqual:v7])
    {
      displayName = self->_displayName;
      v9 = [v5 displayName];
      if ([(NSString *)displayName isEqual:v9])
      {
        url = self->_url;
        v11 = [v5 url];
        unsigned __int8 v12 = [(NSURL *)url isEqual:v11];
      }
      else
      {
        unsigned __int8 v12 = 0;
      }
    }
    else
    {
      unsigned __int8 v12 = 0;
    }
  }
  else
  {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end