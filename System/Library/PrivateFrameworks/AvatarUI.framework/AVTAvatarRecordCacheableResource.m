@interface AVTAvatarRecordCacheableResource
+ (id)persistentIdentifierForRecordData:(id)a3;
+ (id)persistentIdentifierPrefixForRecordWithIdentifier:(id)a3;
- (AVTAvatarRecord)record;
- (AVTAvatarRecordCacheableResource)initWithAvatarRecord:(id)a3 includeAvatarData:(BOOL)a4 environment:(id)a5;
- (AVTUIEnvironment)environment;
- (BOOL)includeAvatarData;
- (BOOL)requiresEncryption;
- (NSString)description;
- (id)identifierForScope:(id)a3;
- (id)persistentDataHashForScope:(id)a3;
- (id)tokenForObservingChangesWithHandler:(id)a3;
- (unint64_t)costForScope:(id)a3;
@end

@implementation AVTAvatarRecordCacheableResource

- (AVTAvatarRecordCacheableResource)initWithAvatarRecord:(id)a3 includeAvatarData:(BOOL)a4 environment:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AVTAvatarRecordCacheableResource;
  v11 = [(AVTAvatarRecordCacheableResource *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_record, a3);
    if (v6)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
    else
    {
      char isKindOfClass = 0;
    }
    v12->_includeAvatarData = isKindOfClass & 1;
    objc_storeStrong((id *)&v12->_environment, a5);
  }

  return v12;
}

+ (id)persistentIdentifierPrefixForRecordWithIdentifier:(id)a3
{
  id v3 = a3;
  return v3;
}

- (id)identifierForScope:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F089D8] string];
  BOOL v6 = objc_opt_class();
  v7 = [(AVTAvatarRecordCacheableResource *)self record];
  v8 = [v7 identifier];
  id v9 = [v6 persistentIdentifierPrefixForRecordWithIdentifier:v8];
  [v5 appendString:v9];

  objc_msgSend(v5, "appendFormat:", @"_AK%lu", AVTAvatarKitSnapshotVersionNumber());
  if ([(AVTAvatarRecordCacheableResource *)self includeAvatarData])
  {
    id v10 = objc_opt_class();
    v11 = [(AVTAvatarRecordCacheableResource *)self record];
    v12 = [v11 avatarData];
    v13 = [v10 persistentIdentifierForRecordData:v12];
    [v5 appendFormat:@"_%@", v13];
  }
  if (v4)
  {
    v14 = [v4 cacheableResourceAssociatedIdentifier];
    [v5 appendString:v14];
  }
  objc_super v15 = (void *)[v5 copy];

  return v15;
}

- (unint64_t)costForScope:(id)a3
{
  return [a3 cacheableResourceAssociatedCost];
}

+ (id)persistentIdentifierForRecordData:(id)a3
{
  return (id)objc_msgSend(a3, "avt_SHA256");
}

- (id)persistentDataHashForScope:(id)a3
{
  id v4 = [(AVTAvatarRecordCacheableResource *)self record];
  int v5 = [v4 isEditable];

  if (v5)
  {
    BOOL v6 = objc_opt_class();
    v7 = [(AVTAvatarRecordCacheableResource *)self record];
    v8 = [v7 avatarData];
    id v9 = [v6 persistentIdentifierForRecordData:v8];
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

- (BOOL)requiresEncryption
{
  v2 = [(AVTAvatarRecordCacheableResource *)self record];
  char v3 = [v2 isEditable];

  return v3;
}

- (id)tokenForObservingChangesWithHandler:(id)a3
{
  id v4 = a3;
  int v5 = [(AVTAvatarRecordCacheableResource *)self record];
  int v6 = [v5 isEditable];

  if (v6)
  {
    v7 = [AVTAvatarRecordCacheableResourceChangeToken alloc];
    v8 = [(AVTAvatarRecordCacheableResource *)self environment];
    id v9 = [(AVTAvatarRecordCacheableResource *)self record];
    id v10 = [v9 identifier];
    v11 = [(AVTAvatarRecordCacheableResourceChangeToken *)v7 initWithEnvironment:v8 recordIdentifier:v10 changeHandler:v4];

    [(AVTAvatarRecordCacheableResourceChangeToken *)v11 startObservingChanges];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSString)description
{
  v11.receiver = self;
  v11.super_class = (Class)AVTAvatarRecordCacheableResource;
  char v3 = [(AVTAvatarRecordCacheableResource *)&v11 description];
  id v4 = (void *)[v3 mutableCopy];

  int v5 = objc_opt_class();
  int v6 = [(AVTAvatarRecordCacheableResource *)self record];
  v7 = [v6 identifier];
  v8 = [v5 persistentIdentifierPrefixForRecordWithIdentifier:v7];
  [v4 appendFormat:@" persistentIDPrefix: %@", v8];

  id v9 = (void *)[v4 copy];
  return (NSString *)v9;
}

- (AVTAvatarRecord)record
{
  return self->_record;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (BOOL)includeAvatarData
{
  return self->_includeAvatarData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_record, 0);
}

@end