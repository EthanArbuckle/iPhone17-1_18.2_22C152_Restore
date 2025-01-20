@interface HLPHelpItem
- (HLPHelpItem)initWithDictionary:(id)a3 helpBookURL:(id)a4 serverType:(int64_t)a5;
- (HLPHelpItem)parent;
- (NSString)decodedName;
- (NSString)identifier;
- (NSString)name;
- (NSURL)iconURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (int64_t)level;
- (int64_t)serverType;
- (void)setIconURL:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLevel:(int64_t)a3;
- (void)setName:(id)a3;
- (void)setParent:(id)a3;
- (void)setServerType:(int64_t)a3;
@end

@implementation HLPHelpItem

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(HLPHelpItem *)self name];
  [v4 setName:v5];

  v6 = [(HLPHelpItem *)self identifier];
  [v4 setIdentifier:v6];

  v7 = [(HLPHelpItem *)self parent];
  [v4 setParent:v7];

  objc_msgSend(v4, "setLevel:", -[HLPHelpItem level](self, "level"));
  v8 = [(HLPHelpItem *)self iconURL];
  [v4 setIconURL:v8];

  return v4;
}

- (HLPHelpItem)initWithDictionary:(id)a3 helpBookURL:(id)a4 serverType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HLPHelpItem;
  v10 = [(HLPHelpItem *)&v19 init];
  v11 = v10;
  if (v10)
  {
    v10->_serverType = a5;
    if (a5)
    {
      uint64_t v12 = [v8 objectForKeyedSubscript:@"title"];
      name = v11->_name;
      v11->_name = (NSString *)v12;
    }
    else
    {
      uint64_t v14 = [v8 objectForKeyedSubscript:@"name"];
      v15 = v11->_name;
      v11->_name = (NSString *)v14;

      name = [v8 objectForKeyedSubscript:@"icon"];
      if ([name length])
      {
        uint64_t v16 = [v9 URLByAppendingPathComponent:name];
        iconURL = v11->_iconURL;
        v11->_iconURL = (NSURL *)v16;
      }
    }
  }
  return v11;
}

- (NSString)decodedName
{
  v3 = self->_name;
  if (self->_serverType == 1)
  {
    decodedName = self->_decodedName;
    if (!decodedName)
    {
      v5 = [(NSString *)self->_name htmlDecodedString];
      v6 = self->_decodedName;
      self->_decodedName = v5;

      decodedName = self->_decodedName;
    }
    v7 = decodedName;

    v3 = v7;
  }
  return v3;
}

- (id)debugDescription
{
  v3 = [MEMORY[0x263F089D8] stringWithString:&stru_26D29FC58];
  v4 = [(HLPHelpItem *)self identifier];
  [v3 appendFormat:@"identifier: %@\n", v4];

  v5 = [(HLPHelpItem *)self parent];
  [v3 appendFormat:@"parent: %@\n", v5];

  v6 = [(HLPHelpItem *)self name];
  [v3 appendFormat:@"name: %@\n", v6];

  objc_msgSend(v3, "appendFormat:", @"level: %ld\n", -[HLPHelpItem level](self, "level"));
  return v3;
}

- (HLPHelpItem)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  return (HLPHelpItem *)WeakRetained;
}

- (void)setParent:(id)a3
{
}

- (int64_t)serverType
{
  return self->_serverType;
}

- (void)setServerType:(int64_t)a3
{
  self->_serverType = a3;
}

- (int64_t)level
{
  return self->_level;
}

- (void)setLevel:(int64_t)a3
{
  self->_level = a3;
}

- (NSURL)iconURL
{
  return self->_iconURL;
}

- (void)setIconURL:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_decodedName, 0);
}

@end