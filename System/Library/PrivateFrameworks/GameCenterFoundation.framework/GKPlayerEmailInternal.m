@interface GKPlayerEmailInternal
+ (BOOL)supportsSecureCoding;
+ (id)secureCodedPropertyKeys;
- (BOOL)isEqual:(id)a3;
- (BOOL)verified;
- (NSString)address;
- (NSString)addressPrefix;
- (NSString)addressSHA1;
- (unint64_t)hash;
- (void)setAddress:(id)a3;
- (void)setAddressPrefix:(id)a3;
- (void)setAddressSHA1:(id)a3;
- (void)setVerified:(BOOL)a3;
@end

@implementation GKPlayerEmailInternal

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_565 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_565, &__block_literal_global_567);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_564;

  return v2;
}

void __48__GKPlayerEmailInternal_secureCodedPropertyKeys__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"address";
  v2[1] = @"verified";
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_564;
  secureCodedPropertyKeys_sSecureCodedKeys_564 = v0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(GKPlayerEmailInternal *)self address];
    if (v6)
    {
      v7 = [v5 address];
      char v8 = [v6 isEqualToString:v7];
    }
    else
    {
      v7 = [(GKPlayerEmailInternal *)self addressSHA1];
      v9 = [v5 addressSHA1];
      char v8 = [v7 isEqualToString:v9];
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v3 = [(GKPlayerEmailInternal *)self address];
  if (v3) {
    [(GKPlayerEmailInternal *)self address];
  }
  else {
  id v4 = [(GKPlayerEmailInternal *)self addressSHA1];
  }
  unint64_t v5 = [v4 hash];

  return v5;
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
}

- (NSString)addressSHA1
{
  return self->_addressSHA1;
}

- (void)setAddressSHA1:(id)a3
{
}

- (NSString)addressPrefix
{
  return self->_addressPrefix;
}

- (void)setAddressPrefix:(id)a3
{
}

- (BOOL)verified
{
  return self->_verified;
}

- (void)setVerified:(BOOL)a3
{
  self->_verified = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressPrefix, 0);
  objc_storeStrong((id *)&self->_addressSHA1, 0);

  objc_storeStrong((id *)&self->_address, 0);
}

@end