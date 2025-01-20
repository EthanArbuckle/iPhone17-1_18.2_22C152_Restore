@interface S3AccessConfig
- (NSString)AWSAccessKeyID;
- (NSString)AWSSecretAccessKey;
- (S3AccessConfig)initWithAWSAccessKeyID:(id)a3 AWSSecretAccessKey:(id)a4;
- (void)setAWSAccessKeyID:(id)a3;
- (void)setAWSSecretAccessKey:(id)a3;
@end

@implementation S3AccessConfig

- (S3AccessConfig)initWithAWSAccessKeyID:(id)a3 AWSSecretAccessKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)S3AccessConfig;
  v9 = [(S3AccessConfig *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_AWSAccessKeyID, a3);
    objc_storeStrong((id *)&v10->_AWSSecretAccessKey, a4);
  }

  return v10;
}

- (NSString)AWSAccessKeyID
{
  return self->_AWSAccessKeyID;
}

- (void)setAWSAccessKeyID:(id)a3
{
}

- (NSString)AWSSecretAccessKey
{
  return self->_AWSSecretAccessKey;
}

- (void)setAWSSecretAccessKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_AWSSecretAccessKey, 0);
  objc_storeStrong((id *)&self->_AWSAccessKeyID, 0);
}

@end