@interface EKImageKey
- (BOOL)isEqual:(id)a3;
- (EKImageKey)initWithSourceID:(id)a3 identifier:(id)a4;
- (EKObjectID)sourceID;
- (NSString)identifier;
- (unint64_t)hash;
@end

@implementation EKImageKey

- (EKImageKey)initWithSourceID:(id)a3 identifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EKImageKey;
  v9 = [(EKImageKey *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sourceID, a3);
    objc_storeStrong((id *)&v10->_identifier, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    id v7 = (id *)v4;
    if ([v7[1] isEqual:self->_sourceID]) {
      char v6 = [v7[2] isEqualToString:self->_identifier];
    }
    else {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(EKObjectID *)self->_sourceID hash];
  return [(NSString *)self->_identifier hash] ^ v3;
}

- (EKObjectID)sourceID
{
  return self->_sourceID;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_sourceID, 0);
}

@end