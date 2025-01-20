@interface HDFHIRResourceData
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HDFHIRResourceData)init;
- (HDFHIRResourceData)initWithCoder:(id)a3;
- (HDFHIRResourceData)initWithData:(id)a3 sourceURL:(id)a4 FHIRVersion:(id)a5;
- (HKFHIRVersion)FHIRVersion;
- (NSData)data;
- (NSURL)sourceURL;
- (id)JSONDictionaryWithError:(id *)a3;
- (id)debugDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
- (void)setFHIRVersion:(id)a3;
- (void)setSourceURL:(id)a3;
@end

@implementation HDFHIRResourceData

- (HDFHIRResourceData)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDFHIRResourceData)initWithData:(id)a3 sourceURL:(id)a4 FHIRVersion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HDFHIRResourceData;
  v11 = [(HDFHIRResourceData *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    data = v11->_data;
    v11->_data = (NSData *)v12;

    uint64_t v14 = [v9 copy];
    sourceURL = v11->_sourceURL;
    v11->_sourceURL = (NSURL *)v14;

    uint64_t v16 = [v10 copy];
    FHIRVersion = v11->_FHIRVersion;
    v11->_FHIRVersion = (HKFHIRVersion *)v16;
  }
  return v11;
}

- (id)JSONDictionaryWithError:(id *)a3
{
  data = self->_data;
  if (data)
  {
    v5 = objc_msgSend(MEMORY[0x263F08900], "hk_JSONObjectFromFHIRData:options:error:", data, 0, a3);
  }
  else
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a3, 3, @"nil data provided");
    v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  data = self->_data;
  id v5 = a3;
  [v5 encodeObject:data forKey:@"Data"];
  [v5 encodeObject:self->_sourceURL forKey:@"SourceURL"];
  [v5 encodeObject:self->_FHIRVersion forKey:@"FHIRVersion"];
}

- (HDFHIRResourceData)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Data"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SourceURL"];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FHIRVersion"];
  id v8 = (void *)v7;
  if (v5) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    id v10 = 0;
  }
  else
  {
    self = [(HDFHIRResourceData *)self initWithData:v5 sourceURL:v6 FHIRVersion:v7];
    id v10 = self;
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_data hash];
  uint64_t v4 = [(NSURL *)self->_sourceURL hash] ^ v3;
  return v4 ^ [(HKFHIRVersion *)self->_FHIRVersion hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HDFHIRResourceData *)a3;
  if (v4 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      data = self->_data;
      uint64_t v7 = [(HDFHIRResourceData *)v5 data];
      if (data != v7)
      {
        uint64_t v8 = [(HDFHIRResourceData *)v5 data];
        if (!v8)
        {
          LOBYTE(v12) = 0;
          goto LABEL_30;
        }
        BOOL v9 = (void *)v8;
        id v10 = self->_data;
        v11 = [(HDFHIRResourceData *)v5 data];
        if (![(NSData *)v10 isEqual:v11])
        {
          LOBYTE(v12) = 0;
LABEL_29:

          goto LABEL_30;
        }
        v28 = v9;
        v29 = v11;
      }
      sourceURL = self->_sourceURL;
      uint64_t v14 = [(HDFHIRResourceData *)v5 sourceURL];
      if (sourceURL != v14)
      {
        uint64_t v12 = [(HDFHIRResourceData *)v5 sourceURL];
        if (!v12) {
          goto LABEL_24;
        }
        v15 = self->_sourceURL;
        uint64_t v16 = [(HDFHIRResourceData *)v5 sourceURL];
        if (([(NSURL *)v15 isEqual:v16] & 1) == 0)
        {

          LOBYTE(v12) = 0;
LABEL_27:
          BOOL v23 = data == v7;
          BOOL v9 = v28;
LABEL_28:
          v11 = v29;
          if (!v23) {
            goto LABEL_29;
          }
LABEL_30:

          goto LABEL_31;
        }
        v25 = v16;
        v27 = v12;
      }
      FHIRVersion = self->_FHIRVersion;
      uint64_t v18 = [(HDFHIRResourceData *)v5 FHIRVersion];
      LOBYTE(v12) = FHIRVersion == (HKFHIRVersion *)v18;
      if (FHIRVersion == (HKFHIRVersion *)v18)
      {
      }
      else
      {
        objc_super v19 = (void *)v18;
        uint64_t v20 = [(HDFHIRResourceData *)v5 FHIRVersion];
        if (v20)
        {
          v21 = (void *)v20;
          uint64_t v12 = self->_FHIRVersion;
          v22 = [(HDFHIRResourceData *)v5 FHIRVersion];
          LOBYTE(v12) = [v12 isEqual:v22];

          if (sourceURL == v14)
          {

            goto LABEL_27;
          }

          goto LABEL_25;
        }
      }
      if (sourceURL == v14)
      {
LABEL_25:

        goto LABEL_27;
      }

LABEL_24:
      BOOL v9 = v28;

      BOOL v23 = data == v7;
      goto LABEL_28;
    }
    LOBYTE(v12) = 0;
  }
LABEL_31:

  return (char)v12;
}

- (id)debugDescription
{
  uint64_t v3 = (void *)[[NSString alloc] initWithData:self->_data encoding:4];
  uint64_t v4 = NSString;
  id v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  uint64_t v7 = HKSensitiveLogItem();
  uint64_t v8 = HKSensitiveLogItem();
  BOOL v9 = [v4 stringWithFormat:@"<%@ %p; source URL: \"%@\", string data: \"%@\">", v6, self, v7, v8];

  return v9;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (void)setSourceURL:(id)a3
{
}

- (HKFHIRVersion)FHIRVersion
{
  return self->_FHIRVersion;
}

- (void)setFHIRVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_FHIRVersion, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end