@interface PHImportAssetNameDescription
- (PHImportAssetNameDescription)initWithFileName:(id)a3 uuid:(id)a4;
- (id)description;
- (id)redactedDescription;
@end

@implementation PHImportAssetNameDescription

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_filename, 0);
}

- (id)redactedDescription
{
  v2 = NSString;
  uuid = self->_uuid;
  v4 = [(NSString *)self->_filename pathExtension];
  v5 = [v2 stringWithFormat:@"%@.%@", uuid, v4];

  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@ (%@)", self->_filename, self->_uuid];
}

- (PHImportAssetNameDescription)initWithFileName:(id)a3 uuid:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PHImportAssetNameDescription;
  v9 = [(PHImportAssetNameDescription *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_filename, a3);
    objc_storeStrong((id *)&v10->_uuid, a4);
  }

  return v10;
}

@end