@interface THThreadNetworkCredentialsDataSet
+ (BOOL)supportsSecureCoding;
- (NSData)dataSetArray;
- (NSString)userInfo;
- (THThreadNetworkCredentialsDataSet)init;
- (THThreadNetworkCredentialsDataSet)initWithCoder:(id)a3;
- (THThreadNetworkCredentialsDataSet)initWithDataSetArray:(id)a3 userInfo:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setDataSetArray:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation THThreadNetworkCredentialsDataSet

- (THThreadNetworkCredentialsDataSet)init
{
  return [(THThreadNetworkCredentialsDataSet *)self initWithDataSetArray:0 userInfo:0];
}

- (THThreadNetworkCredentialsDataSet)initWithDataSetArray:(id)a3 userInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)THThreadNetworkCredentialsDataSet;
  v9 = [(THThreadNetworkCredentialsDataSet *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataSetArray, a3);
    objc_storeStrong((id *)&v10->_userInfo, a4);
  }

  return v10;
}

- (THThreadNetworkCredentialsDataSet)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ds"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"info"];

  id v7 = [(THThreadNetworkCredentialsDataSet *)self initWithDataSetArray:v5 userInfo:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(THThreadNetworkCredentialsDataSet *)self dataSetArray];
  [v4 encodeObject:v5 forKey:@"ds"];

  id v6 = [(THThreadNetworkCredentialsDataSet *)self userInfo];
  [v4 encodeObject:v6 forKey:@"info"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)dataSetArray
{
  return self->_dataSetArray;
}

- (void)setDataSetArray:(id)a3
{
}

- (NSString)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);

  objc_storeStrong((id *)&self->_dataSetArray, 0);
}

@end