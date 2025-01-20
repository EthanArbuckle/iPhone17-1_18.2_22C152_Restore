@interface MLModelMetadata
- (MLModelMetadata)initWithName:(id)a3;
- (MLModelMetadata)initWithName:(id)a3 shortDescription:(id)a4 versionString:(id)a5 author:(id)a6 license:(id)a7 creatorDefined:(id)a8;
- (NSDictionary)creatorDefined;
- (NSString)author;
- (NSString)license;
- (NSString)name;
- (NSString)shortDescription;
- (NSString)versionString;
- (id)debugDescription;
@end

@implementation MLModelMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creatorDefined, 0);
  objc_storeStrong((id *)&self->_license, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_versionString, 0);
  objc_storeStrong((id *)&self->_shortDescription, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (NSDictionary)creatorDefined
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)license
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)author
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)versionString
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)shortDescription
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)debugDescription
{
  return (id)[NSString stringWithFormat:@"name: %@, version: %@ author: %@ description: %@ creatorDefined: %@", self->_name, self->_versionString, self->_author, self->_shortDescription, self->_creatorDefined];
}

- (MLModelMetadata)initWithName:(id)a3 shortDescription:(id)a4 versionString:(id)a5 author:(id)a6 license:(id)a7 creatorDefined:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v20 = a6;
  id v15 = a7;
  id v16 = a8;
  v24.receiver = self;
  v24.super_class = (Class)MLModelMetadata;
  v17 = [(MLModelMetadata *)&v24 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_name, a3);
    objc_storeStrong((id *)&v18->_shortDescription, a4);
    objc_storeStrong((id *)&v18->_versionString, a5);
    objc_storeStrong((id *)&v18->_author, a6);
    objc_storeStrong((id *)&v18->_license, a7);
    objc_storeStrong((id *)&v18->_creatorDefined, a8);
    if (!v18->_name) {
      v18->_name = (NSString *)@"model";
    }
  }

  return v18;
}

- (MLModelMetadata)initWithName:(id)a3
{
  return [(MLModelMetadata *)self initWithName:a3 shortDescription:0 versionString:0 author:0 license:0 creatorDefined:0];
}

@end