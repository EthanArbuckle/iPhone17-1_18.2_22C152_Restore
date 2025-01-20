@interface DIDocUploadSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)base64EncodingEnabled;
- (DIDocUploadSettings)initWithCertificateChain:(id)a3 container:(int64_t)a4 recipient:(id)a5 encryptionVersion:(id)a6;
- (DIDocUploadSettings)initWithCertificateChain:(id)a3 container:(int64_t)a4 recipient:(id)a5 encryptionVersion:(id)a6 base64EncodingEnabled:(BOOL)a7;
- (DIDocUploadSettings)initWithCertificateChain:(id)a3 recipient:(id)a4 encryptionVersion:(id)a5;
- (DIDocUploadSettings)initWithCertificateChain:(id)a3 recipient:(id)a4 encryptionVersion:(id)a5 base64EncodingEnabled:(BOOL)a6;
- (DIDocUploadSettings)initWithCoder:(id)a3;
- (DIDocUploadSettings)initWithContainer:(int64_t)a3;
- (NSArray)certificateChain;
- (NSString)encryptionVersion;
- (NSString)recipient;
- (id)description;
- (int64_t)container;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DIDocUploadSettings

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  v4 = [(DIDocUploadSettings *)self certificateChain];
  [v7 encodeObject:v4 forKey:@"certificateChain"];

  v5 = [(DIDocUploadSettings *)self encryptionVersion];
  [v7 encodeObject:v5 forKey:@"encryptionVersion"];

  v6 = [(DIDocUploadSettings *)self recipient];
  [v7 encodeObject:v6 forKey:@"recipient"];

  objc_msgSend(v7, "encodeBool:forKey:", -[DIDocUploadSettings base64EncodingEnabled](self, "base64EncodingEnabled"), @"base64EncodingEnabled");
  objc_msgSend(v7, "encodeInteger:forKey:", -[DIDocUploadSettings container](self, "container"), @"container");
}

- (DIDocUploadSettings)initWithCoder:(id)a3
{
  v15[2] = *MEMORY[0x263EF8340];
  v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  v15[0] = objc_opt_class();
  v15[1] = objc_opt_class();
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  id v7 = [v4 setWithArray:v6];
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"certificateChain"];

  v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"encryptionVersion"];
  v10 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"recipient"];
  uint64_t v11 = [v5 decodeBoolForKey:@"base64EncodingEnabled"];
  uint64_t v12 = [v5 decodeIntegerForKey:@"container"];

  v13 = 0;
  if (v8 && v10)
  {
    self = [(DIDocUploadSettings *)self initWithCertificateChain:v8 container:v12 recipient:v10 encryptionVersion:v9 base64EncodingEnabled:v11];
    v13 = self;
  }

  return v13;
}

- (DIDocUploadSettings)initWithCertificateChain:(id)a3 container:(int64_t)a4 recipient:(id)a5 encryptionVersion:(id)a6 base64EncodingEnabled:(BOOL)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)DIDocUploadSettings;
  v16 = [(DIDocUploadSettings *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_certificateChain, a3);
    v17->_container = a4;
    objc_storeStrong((id *)&v17->_recipient, a5);
    objc_storeStrong((id *)&v17->_encryptionVersion, a6);
    v17->_base64EncodingEnabled = a7;
  }

  return v17;
}

- (DIDocUploadSettings)initWithCertificateChain:(id)a3 recipient:(id)a4 encryptionVersion:(id)a5 base64EncodingEnabled:(BOOL)a6
{
  return [(DIDocUploadSettings *)self initWithCertificateChain:a3 container:0 recipient:a4 encryptionVersion:a5 base64EncodingEnabled:a6];
}

- (DIDocUploadSettings)initWithCertificateChain:(id)a3 container:(int64_t)a4 recipient:(id)a5 encryptionVersion:(id)a6
{
  return [(DIDocUploadSettings *)self initWithCertificateChain:a3 container:a4 recipient:a5 encryptionVersion:a6 base64EncodingEnabled:0];
}

- (DIDocUploadSettings)initWithCertificateChain:(id)a3 recipient:(id)a4 encryptionVersion:(id)a5
{
  return [(DIDocUploadSettings *)self initWithCertificateChain:a3 recipient:a4 encryptionVersion:a5 base64EncodingEnabled:0];
}

- (DIDocUploadSettings)initWithContainer:(int64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263EFF8C0]);
  v6 = [(DIDocUploadSettings *)self initWithCertificateChain:v5 container:a3 recipient:&stru_26C5761E0 encryptionVersion:&stru_26C5761E0 base64EncodingEnabled:1];

  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(DIDocUploadSettings *)self encryptionVersion];
  id v5 = (void *)v4;
  if (v4) {
    v6 = (__CFString *)v4;
  }
  else {
    v6 = @"nil";
  }
  id v7 = [(DIDocUploadSettings *)self recipient];
  if ([(DIDocUploadSettings *)self base64EncodingEnabled]) {
    v8 = @"true";
  }
  else {
    v8 = @"false";
  }
  v9 = [(DIDocUploadSettings *)self certificateChain];
  v10 = [v9 description];
  uint64_t v11 = [v3 stringWithFormat:@"DIDocUploadSettings: encryptionVersion=%@, recipient=%@, base64EncodingEnabled=%@, certificateChain=%@, container=%lu", v6, v7, v8, v10, -[DIDocUploadSettings container](self, "container")];

  return v11;
}

- (NSArray)certificateChain
{
  return self->_certificateChain;
}

- (NSString)recipient
{
  return self->_recipient;
}

- (NSString)encryptionVersion
{
  return self->_encryptionVersion;
}

- (int64_t)container
{
  return self->_container;
}

- (BOOL)base64EncodingEnabled
{
  return self->_base64EncodingEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionVersion, 0);
  objc_storeStrong((id *)&self->_recipient, 0);
  objc_storeStrong((id *)&self->_certificateChain, 0);
}

@end