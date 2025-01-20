@interface IDSStewieSMSConfig
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (IDSStewieSMSConfig)initWithCoder:(id)a3;
- (IDSStewieSMSConfig)initWithConfig:(id)a3 withID:(id)a4;
- (NSData)config;
- (NSUUID)configID;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IDSStewieSMSConfig

- (IDSStewieSMSConfig)initWithConfig:(id)a3 withID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  v10 = 0;
  if (v7 && v8)
  {
    v14.receiver = self;
    v14.super_class = (Class)IDSStewieSMSConfig;
    v11 = [(IDSStewieSMSConfig *)&v14 init];
    p_isa = (id *)&v11->super.isa;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_config, a3);
      objc_storeStrong(p_isa + 1, a4);
    }
    self = p_isa;
    v10 = self;
  }

  return v10;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(IDSStewieSMSConfig *)self configID];
  v5 = [(IDSStewieSMSConfig *)self config];
  v6 = +[NSString stringWithFormat:@"<%@: %p { configID: %@, config: %@}>", v3, self, v4, v5];

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSData *)self->_config hash];
  return (unint64_t)[(NSUUID *)self->_configID hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (IDSStewieSMSConfig *)a3;
  if (v5 == self)
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = v5;
      config = self->_config;
      id v8 = [(IDSStewieSMSConfig *)v6 config];
      if (config == v8
        || (v9 = self->_config,
            [(IDSStewieSMSConfig *)v6 config],
            unint64_t v3 = objc_claimAutoreleasedReturnValue(),
            [(NSData *)v9 isEqual:v3]))
      {
        configID = self->_configID;
        v12 = [(IDSStewieSMSConfig *)v6 configID];
        if (configID == v12)
        {
          unsigned __int8 v10 = 1;
        }
        else
        {
          v13 = self->_configID;
          objc_super v14 = [(IDSStewieSMSConfig *)v6 configID];
          unsigned __int8 v10 = [(NSUUID *)v13 isEqual:v14];
        }
        if (config == v8) {
          goto LABEL_13;
        }
      }
      else
      {
        unsigned __int8 v10 = 0;
      }

LABEL_13:
      goto LABEL_14;
    }
    unsigned __int8 v10 = 0;
  }
LABEL_14:

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSStewieSMSConfig)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IDSStewieSMSConfig;
  v5 = [(IDSStewieSMSConfig *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"config"];
    config = v5->_config;
    v5->_config = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"configID"];
    configID = v5->_configID;
    v5->_configID = (NSUUID *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  config = self->_config;
  id v5 = a3;
  [v5 encodeObject:config forKey:@"config"];
  [v5 encodeObject:self->_configID forKey:@"configID"];
}

- (NSUUID)configID
{
  return self->_configID;
}

- (NSData)config
{
  return self->_config;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);

  objc_storeStrong((id *)&self->_configID, 0);
}

@end