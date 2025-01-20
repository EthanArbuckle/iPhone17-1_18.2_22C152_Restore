@interface DESInternalDodMLTask
+ (BOOL)supportsSecureCoding;
- (DESInternalDodMLTask)initWithCoder:(id)a3;
- (DESInternalDodMLTask)initWithRecipe:(id)a3 matchingRecordSet:(id)a4 baseURL:(id)a5 localIdentifier:(id)a6 recipePath:(id)a7 uploadTransport:(id)a8;
- (DESRecipe)recipe;
- (DESRecordSet)matchingRecordSet;
- (DESUploadTransport)uploadTransport;
- (NSString)localeIdentifier;
- (NSString)testingRecipePath;
- (NSURL)baseURL;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DESInternalDodMLTask

- (DESInternalDodMLTask)initWithRecipe:(id)a3 matchingRecordSet:(id)a4 baseURL:(id)a5 localIdentifier:(id)a6 recipePath:(id)a7 uploadTransport:(id)a8
{
  id v25 = a3;
  id v24 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v26.receiver = self;
  v26.super_class = (Class)DESInternalDodMLTask;
  v19 = [(DESInternalDodMLTask *)&v26 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_recipe, a3);
    objc_storeStrong((id *)&v20->_matchingRecordSet, a4);
    objc_storeStrong((id *)&v20->_baseURL, a5);
    if (v16)
    {
      v21 = (NSString *)v16;
    }
    else
    {
      DESGetDeviceLocale();
      v21 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    localeIdentifier = v20->_localeIdentifier;
    v20->_localeIdentifier = v21;

    objc_storeStrong((id *)&v20->_testingRecipePath, a7);
    objc_storeStrong((id *)&v20->_uploadTransport, a8);
  }

  return v20;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(DESInternalDodMLTask *)self recipe];
  v7 = [(DESInternalDodMLTask *)self matchingRecordSet];
  v8 = [(DESInternalDodMLTask *)self baseURL];
  v9 = [(DESInternalDodMLTask *)self localeIdentifier];
  v10 = [(DESInternalDodMLTask *)self testingRecipePath];
  v11 = [(DESInternalDodMLTask *)self uploadTransport];
  v12 = [v3 stringWithFormat:@"%@(%@, %@, %@, %@, %@, %@)", v5, v6, v7, v8, v9, v10, v11];

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeObject:self->_recipe forKey:@"recipe"];
  matchingRecordSet = self->_matchingRecordSet;
  if (matchingRecordSet) {
    [v6 encodeObject:matchingRecordSet forKey:@"matchingRecordSet"];
  }
  uploadTransport = self->_uploadTransport;
  if (uploadTransport) {
    [v6 encodeObject:uploadTransport forKey:@"uploadTransport"];
  }
}

- (DESInternalDodMLTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recipe"];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uploadTransport"];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"matchingRecordSet"];
    v8 = DESGetDeviceLocale();
    self = [(DESInternalDodMLTask *)self initWithRecipe:v5 matchingRecordSet:v7 baseURL:0 localIdentifier:v8 recipePath:0 uploadTransport:v6];

    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (DESRecipe)recipe
{
  return self->_recipe;
}

- (DESRecordSet)matchingRecordSet
{
  return self->_matchingRecordSet;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (NSString)testingRecipePath
{
  return self->_testingRecipePath;
}

- (DESUploadTransport)uploadTransport
{
  return self->_uploadTransport;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadTransport, 0);
  objc_storeStrong((id *)&self->_testingRecipePath, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_matchingRecordSet, 0);

  objc_storeStrong((id *)&self->_recipe, 0);
}

@end