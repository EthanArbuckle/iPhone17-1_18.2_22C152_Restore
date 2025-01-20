@interface DACarKeyGenericCrossPlatformSharingData
+ (BOOL)supportsSecureCoding;
+ (id)decodeWithData:(id)a3 error:(id *)a4;
- (DACarKeyGenericCrossPlatformSharingData)initWithCoder:(id)a3;
- (DACarKeyGenericCrossPlatformSharingData)initWithDictionary:(id)a3;
- (DACarKeyGenericCrossPlatformSharingData)initWithSharingIdentifier:(id)a3 friendKeyIdentifier:(id)a4 sharingMessageType:(int64_t)a5 message:(id)a6;
- (NSData)message;
- (NSString)friendKeyIdentifier;
- (NSString)sharingIdentifier;
- (id)asDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)encodeWithError:(id *)a3;
- (int64_t)messageType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DACarKeyGenericCrossPlatformSharingData

- (DACarKeyGenericCrossPlatformSharingData)initWithSharingIdentifier:(id)a3 friendKeyIdentifier:(id)a4 sharingMessageType:(int64_t)a5 message:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)DACarKeyGenericCrossPlatformSharingData;
  v14 = [(DACarKeyGenericCrossPlatformSharingData *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_sharingIdentifier, a3);
    objc_storeStrong((id *)&v15->_friendKeyIdentifier, a4);
    v15->_messageType = a5;
    objc_storeStrong((id *)&v15->_message, a6);
  }

  return v15;
}

- (DACarKeyGenericCrossPlatformSharingData)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DACarKeyGenericCrossPlatformSharingData;
  v5 = [(DACarKeyGenericCrossPlatformSharingData *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"sharingId"];
    sharingIdentifier = v5->_sharingIdentifier;
    v5->_sharingIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"friendKeyId"];
    friendKeyIdentifier = v5->_friendKeyIdentifier;
    v5->_friendKeyIdentifier = (NSString *)v8;

    v10 = [v4 objectForKeyedSubscript:@"sharingDataType"];
    v5->_messageType = [v10 integerValue];

    id v11 = [v4 objectForKeyedSubscript:@"sharingData"];
    uint64_t v12 = kmlUtilDataForHexString(v11);
    message = v5->_message;
    v5->_message = (NSData *)v12;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[DACarKeyGenericCrossPlatformSharingData allocWithZone:](DACarKeyGenericCrossPlatformSharingData, "allocWithZone:") init];
  if (v5)
  {
    uint64_t v6 = [(NSString *)self->_sharingIdentifier copyWithZone:a3];
    sharingIdentifier = v5->_sharingIdentifier;
    v5->_sharingIdentifier = (NSString *)v6;

    uint64_t v8 = [(NSString *)self->_friendKeyIdentifier copyWithZone:a3];
    friendKeyIdentifier = v5->_friendKeyIdentifier;
    v5->_friendKeyIdentifier = (NSString *)v8;

    v5->_messageType = self->_messageType;
    uint64_t v10 = [(NSData *)self->_message copyWithZone:a3];
    message = v5->_message;
    v5->_message = (NSData *)v10;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DACarKeyGenericCrossPlatformSharingData *)self sharingIdentifier];
  [v4 encodeObject:v5 forKey:@"sharingId"];

  uint64_t v6 = [(DACarKeyGenericCrossPlatformSharingData *)self friendKeyIdentifier];
  [v4 encodeObject:v6 forKey:@"friendKeyId"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[DACarKeyGenericCrossPlatformSharingData messageType](self, "messageType"), @"sharingDataType");
  id v7 = [(DACarKeyGenericCrossPlatformSharingData *)self message];
  [v4 encodeObject:v7 forKey:@"sharingData"];
}

- (DACarKeyGenericCrossPlatformSharingData)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DACarKeyGenericCrossPlatformSharingData;
  v5 = [(DACarKeyGenericCrossPlatformSharingData *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharingId"];
    sharingIdentifier = v5->_sharingIdentifier;
    v5->_sharingIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"friendKeyId"];
    friendKeyIdentifier = v5->_friendKeyIdentifier;
    v5->_friendKeyIdentifier = (NSString *)v8;

    v5->_messageType = [v4 decodeIntegerForKey:@"sharingDataType"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharingData"];
    message = v5->_message;
    v5->_message = (NSData *)v10;
  }
  return v5;
}

- (id)encodeWithError:(id *)a3
{
  return (id)[MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:a3];
}

+ (id)decodeWithData:(id)a3 error:(id *)a4
{
  uint64_t v5 = decodeWithData_error__pred;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&decodeWithData_error__pred, &__block_literal_global_3);
  }
  id v7 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:decodeWithData_error__allowedClasses fromData:v6 error:a4];

  return v7;
}

uint64_t __64__DACarKeyGenericCrossPlatformSharingData_decodeWithData_error___block_invoke()
{
  decodeWithData_error__allowedClasses = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);

  return MEMORY[0x270F9A758]();
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] string];
  id v4 = [NSString stringWithFormat:@"Sharing ID            : %@\n", self->_sharingIdentifier];
  [v3 appendString:v4];

  uint64_t v5 = [NSString stringWithFormat:@"Friend Key ID         : %@\n", self->_friendKeyIdentifier];
  [v3 appendString:v5];

  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"Message Type          : %ld\n", self->_messageType);
  [v3 appendString:v6];

  id v7 = [NSString stringWithFormat:@"Message               : %@\n", self->_message];
  [v3 appendString:v7];

  return v3;
}

- (id)asDictionary
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  [v3 setObject:self->_sharingIdentifier forKeyedSubscript:@"sharingId"];
  [v3 setObject:self->_friendKeyIdentifier forKeyedSubscript:@"friendKeyId"];
  id v4 = [NSNumber numberWithInteger:self->_messageType];
  [v3 setObject:v4 forKeyedSubscript:@"sharingDataType"];

  uint64_t v5 = kmlUtilHexStringFromData(self->_message);
  [v3 setObject:v5 forKeyedSubscript:@"sharingData"];

  return v3;
}

- (NSString)sharingIdentifier
{
  return self->_sharingIdentifier;
}

- (NSString)friendKeyIdentifier
{
  return self->_friendKeyIdentifier;
}

- (int64_t)messageType
{
  return self->_messageType;
}

- (NSData)message
{
  return self->_message;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_friendKeyIdentifier, 0);

  objc_storeStrong((id *)&self->_sharingIdentifier, 0);
}

@end