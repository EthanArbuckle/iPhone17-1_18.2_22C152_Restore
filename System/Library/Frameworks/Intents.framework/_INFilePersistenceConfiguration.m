@interface _INFilePersistenceConfiguration
- (NSString)filePath;
- (NSString)identifier;
- (void)setFilePath:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation _INFilePersistenceConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_filePath, 0);
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setFilePath:(id)a3
{
}

- (NSString)filePath
{
  return self->_filePath;
}

@end