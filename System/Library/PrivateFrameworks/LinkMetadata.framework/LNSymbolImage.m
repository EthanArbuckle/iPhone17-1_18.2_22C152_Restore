@interface LNSymbolImage
+ (BOOL)supportsSecureCoding;
- (LNSymbolConfiguration)platformAgnosticSymbolConfiguration;
- (LNSymbolImage)initWithCoder:(id)a3;
- (LNSymbolImage)initWithSymbolSystemName:(id)a3;
- (LNSymbolImage)initWithSymbolSystemName:(id)a3 tintColorData:(id)a4 configurationData:(id)a5 platform:(id)a6;
- (LNSymbolImage)initWithSymbolSystemName:(id)a3 tintColorData:(id)a4 platformAgnosticConfiguration:(id)a5 platform:(id)a6;
- (NSData)configurationData;
- (NSData)tintColorData;
- (NSString)platform;
- (NSString)systemName;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNSymbolImage

- (LNSymbolImage)initWithSymbolSystemName:(id)a3
{
  return [(LNSymbolImage *)self initWithSymbolSystemName:a3 tintColorData:0 configurationData:0 platform:0];
}

- (void)encodeWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)LNSymbolImage;
  id v4 = a3;
  [(LNImage *)&v10 encodeWithCoder:v4];
  v5 = [(LNSymbolImage *)self tintColorData];
  [v4 encodeObject:v5 forKey:@"tintColorData"];

  v6 = [(LNSymbolImage *)self systemName];
  [v4 encodeObject:v6 forKey:@"systemName"];

  v7 = [(LNSymbolImage *)self platform];
  [v4 encodeObject:v7 forKey:@"platform"];

  v8 = [(LNSymbolImage *)self configurationData];
  [v4 encodeObject:v8 forKey:@"configurationData"];

  v9 = [(LNSymbolImage *)self platformAgnosticSymbolConfiguration];
  [v4 encodeObject:v9 forKey:@"platformAgnosticSymbolConfiguration"];
}

- (NSString)systemName
{
  return self->_systemName;
}

- (NSString)platform
{
  return self->_platform;
}

- (NSData)tintColorData
{
  return self->_tintColorData;
}

- (NSData)configurationData
{
  return self->_configurationData;
}

- (LNSymbolConfiguration)platformAgnosticSymbolConfiguration
{
  return self->_platformAgnosticSymbolConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platformAgnosticSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_configurationData, 0);
  objc_storeStrong((id *)&self->_tintColorData, 0);
  objc_storeStrong((id *)&self->_systemName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LNSymbolImage)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"systemName"];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tintColorData"];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"configurationData"];
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"platform"];
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"platformAgnosticSymbolConfiguration"];
    if (v9) {
      objc_super v10 = [(LNSymbolImage *)self initWithSymbolSystemName:v5 tintColorData:v6 platformAgnosticConfiguration:v9 platform:v8];
    }
    else {
      objc_super v10 = [(LNSymbolImage *)self initWithSymbolSystemName:v5 tintColorData:v6 configurationData:v7 platform:v8];
    }
    self = v10;

    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (LNSymbolImage)initWithSymbolSystemName:(id)a3 tintColorData:(id)a4 configurationData:(id)a5 platform:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11
    && (v18.receiver = self,
        v18.super_class = (Class)LNSymbolImage,
        v15 = [(LNImage *)&v18 initWithSystemImageNamed:v11],
        (self = v15) != 0))
  {
    objc_storeStrong((id *)&v15->_systemName, a3);
    objc_storeStrong((id *)&self->_tintColorData, a4);
    objc_storeStrong((id *)&self->_configurationData, a5);
    objc_storeStrong((id *)&self->_platform, a6);
    self = self;
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(LNSymbolImage *)self systemName];
  v7 = [(LNSymbolImage *)self platform];
  v8 = [(LNSymbolImage *)self tintColorData];
  BOOL v9 = v8 != 0;
  objc_super v10 = [(LNSymbolImage *)self configurationData];
  if (v10)
  {
    id v11 = [v3 stringWithFormat:@"<%@: %p, systemName: %@, platform: %@, hasTintColorData: %d, hasConfigurationData: %d>", v5, self, v6, v7, v9, 1];
  }
  else
  {
    id v12 = [(LNSymbolImage *)self platformAgnosticSymbolConfiguration];
    id v11 = [v3 stringWithFormat:@"<%@: %p, systemName: %@, platform: %@, hasTintColorData: %d, hasConfigurationData: %d>", v5, self, v6, v7, v9, v12 != 0];
  }
  return v11;
}

- (LNSymbolImage)initWithSymbolSystemName:(id)a3 tintColorData:(id)a4 platformAgnosticConfiguration:(id)a5 platform:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)LNSymbolImage;
  v15 = [(LNImage *)&v19 initWithSystemImageNamed:v11];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_systemName, a3);
    objc_storeStrong((id *)&v16->_tintColorData, a4);
    objc_storeStrong((id *)&v16->_platformAgnosticSymbolConfiguration, a5);
    objc_storeStrong((id *)&v16->_platform, a6);
    v17 = v16;
  }

  return v16;
}

@end