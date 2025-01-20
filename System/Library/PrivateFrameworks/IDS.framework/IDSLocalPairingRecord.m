@interface IDSLocalPairingRecord
+ (BOOL)supportsSecureCoding;
- (IDSLocalPairingRecord)initWithCoder:(id)a3;
- (IDSLocalPairingRecord)initWithIdentityDataClassA:(id)a3 classC:(id)a4 classD:(id)a5;
- (NSDictionary)protectionClassIdentityDataMap;
- (id)identityDataForDataProtectionClass:(unsigned int)a3 error:(id *)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setProtectionClassIdentityDataMap:(id)a3;
@end

@implementation IDSLocalPairingRecord

- (id)identityDataForDataProtectionClass:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  v21[1] = *MEMORY[0x1E4F143B8];
  v6 = [(IDSLocalPairingRecord *)self protectionClassIdentityDataMap];
  v7 = [NSNumber numberWithUnsignedInt:v5];
  v8 = [v6 objectForKeyedSubscript:v7];

  if (v8)
  {
    v9 = [v8 identityData];
    if (v9)
    {

      goto LABEL_5;
    }
    v10 = [v8 error];

    if (v10)
    {
LABEL_5:
      v11 = [v8 error];
      if (!a4) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  v14 = NSString;
  v15 = IDSDataProtectionClassStringFromDataProtectionClass();
  v16 = [v14 stringWithFormat:@"Missing identity for class-%@", v15];

  v17 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v18 = *MEMORY[0x1E4F6AF18];
  uint64_t v20 = *MEMORY[0x1E4F28228];
  v21[0] = v16;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
  v11 = [v17 errorWithDomain:v18 code:7 userInfo:v19];

  if (a4) {
LABEL_6:
  }
    *a4 = v11;
LABEL_7:
  v12 = [v8 identityData];

  return v12;
}

- (IDSLocalPairingRecord)initWithIdentityDataClassA:(id)a3 classC:(id)a4 classD:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IDSLocalPairingRecord;
  v11 = [(IDSLocalPairingRecord *)&v15 init];
  if (v11)
  {
    v12 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(NSDictionary *)v12 setObject:v8 forKeyedSubscript:&unk_1EE28B2F8];
    [(NSDictionary *)v12 setObject:v9 forKeyedSubscript:&unk_1EE28B310];
    [(NSDictionary *)v12 setObject:v10 forKeyedSubscript:&unk_1EE28B328];
    protectionClassIdentityDataMap = v11->_protectionClassIdentityDataMap;
    v11->_protectionClassIdentityDataMap = v12;
  }
  return v11;
}

- (IDSLocalPairingRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IDSLocalPairingRecord;
  uint64_t v5 = [(IDSLocalPairingRecord *)&v13 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    id v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"kIdentityDataMap"];
    protectionClassIdentityDataMap = v5->_protectionClassIdentityDataMap;
    v5->_protectionClassIdentityDataMap = (NSDictionary *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSLocalPairingRecord *)self protectionClassIdentityDataMap];
  [v4 encodeObject:v5 forKey:@"kIdentityDataMap"];
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

- (NSDictionary)protectionClassIdentityDataMap
{
  return self->_protectionClassIdentityDataMap;
}

- (void)setProtectionClassIdentityDataMap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end