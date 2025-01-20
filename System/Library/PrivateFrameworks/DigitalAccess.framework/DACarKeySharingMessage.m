@interface DACarKeySharingMessage
+ (BOOL)supportsSecureCoding;
+ (id)decodeWithData:(id)a3 error:(id *)a4;
- (DACarKeyAdditionalCrossPlatformSharingData)additionalData;
- (DACarKeyGenericCrossPlatformSharingData)genericData;
- (DACarKeyPrivateCrossPlatformSharingData)privateData;
- (DACarKeySharingMessage)initWithCoder:(id)a3;
- (DACarKeySharingMessage)initWithGenericCrossPlatformSharingData:(id)a3 additionalData:(id)a4 privateData:(id)a5;
- (DACarKeySharingMessage)initWithGenericCrossPlatformSharingData:(id)a3 additionalDataDictionary:(id)a4;
- (DACarKeySharingMessage)initWithGenericDataDictionary:(id)a3 additionalDataDictionary:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)encodeWithError:(id *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DACarKeySharingMessage

- (DACarKeySharingMessage)initWithGenericCrossPlatformSharingData:(id)a3 additionalData:(id)a4 privateData:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)DACarKeySharingMessage;
  v12 = [(DACarKeySharingMessage *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_genericData, a3);
    objc_storeStrong((id *)&v13->_additionalData, a4);
    objc_storeStrong((id *)&v13->_privateData, a5);
  }

  return v13;
}

- (DACarKeySharingMessage)initWithGenericCrossPlatformSharingData:(id)a3 additionalDataDictionary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)DACarKeySharingMessage;
  id v9 = [(DACarKeySharingMessage *)&v15 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_genericData, a3);
    if (v8)
    {
      id v11 = [[DACarKeyAdditionalCrossPlatformSharingData alloc] initWithDictionary:v8];
      additionalData = v10->_additionalData;
      v10->_additionalData = v11;
    }
    else
    {
      additionalData = v10->_additionalData;
      v10->_additionalData = 0;
    }

    privateData = v10->_privateData;
    v10->_privateData = 0;
  }
  return v10;
}

- (DACarKeySharingMessage)initWithGenericDataDictionary:(id)a3 additionalDataDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)DACarKeySharingMessage;
  id v8 = [(DACarKeySharingMessage *)&v16 init];
  id v9 = v8;
  if (v8)
  {
    if (v6)
    {
      id v10 = [[DACarKeyGenericCrossPlatformSharingData alloc] initWithDictionary:v6];
      genericData = v9->_genericData;
      v9->_genericData = v10;
    }
    else
    {
      genericData = v8->_genericData;
      v8->_genericData = 0;
    }

    if (v7)
    {
      v12 = [[DACarKeyAdditionalCrossPlatformSharingData alloc] initWithDictionary:v7];
      additionalData = v9->_additionalData;
      v9->_additionalData = v12;
    }
    else
    {
      additionalData = v9->_additionalData;
      v9->_additionalData = 0;
    }

    privateData = v9->_privateData;
    v9->_privateData = 0;
  }
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[DACarKeySharingMessage allocWithZone:](DACarKeySharingMessage, "allocWithZone:") init];
  if (v5)
  {
    id v6 = [(DACarKeyGenericCrossPlatformSharingData *)self->_genericData copyWithZone:a3];
    genericData = v5->_genericData;
    v5->_genericData = v6;

    id v8 = [(DACarKeyAdditionalCrossPlatformSharingData *)self->_additionalData copyWithZone:a3];
    additionalData = v5->_additionalData;
    v5->_additionalData = v8;

    id v10 = [(DACarKeyPrivateCrossPlatformSharingData *)self->_privateData copyWithZone:a3];
    privateData = v5->_privateData;
    v5->_privateData = v10;
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
  v5 = [(DACarKeySharingMessage *)self genericData];
  [v4 encodeObject:v5 forKey:@"genericData"];

  id v6 = [(DACarKeySharingMessage *)self additionalData];
  [v4 encodeObject:v6 forKey:@"additionalData"];

  id v7 = [(DACarKeySharingMessage *)self privateData];
  [v4 encodeObject:v7 forKey:@"privateData"];
}

- (DACarKeySharingMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DACarKeySharingMessage;
  v5 = [(DACarKeySharingMessage *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"genericData"];
    genericData = v5->_genericData;
    v5->_genericData = (DACarKeyGenericCrossPlatformSharingData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"additionalData"];
    additionalData = v5->_additionalData;
    v5->_additionalData = (DACarKeyAdditionalCrossPlatformSharingData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"privateData"];
    privateData = v5->_privateData;
    v5->_privateData = (DACarKeyPrivateCrossPlatformSharingData *)v10;
  }
  return v5;
}

- (id)encodeWithError:(id *)a3
{
  return (id)[MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:a3];
}

+ (id)decodeWithData:(id)a3 error:(id *)a4
{
  uint64_t v5 = decodeWithData_error__pred_414;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&decodeWithData_error__pred_414, &__block_literal_global_417);
  }
  id v7 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:decodeWithData_error__allowedClasses_415 fromData:v6 error:a4];

  return v7;
}

uint64_t __47__DACarKeySharingMessage_decodeWithData_error___block_invoke()
{
  decodeWithData_error__allowedClasses_415 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);

  return MEMORY[0x270F9A758]();
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] string];
  id v4 = [NSString stringWithFormat:@"Generic Sharing Data       : %@\n", self->_genericData];
  [v3 appendString:v4];

  uint64_t v5 = [NSString stringWithFormat:@"Additional Sharing Data    : %@\n", self->_additionalData];
  [v3 appendString:v5];

  id v6 = [NSString stringWithFormat:@"Private Sharing Data       : %@\n", self->_privateData];
  [v3 appendString:v6];

  return v3;
}

- (DACarKeyGenericCrossPlatformSharingData)genericData
{
  return self->_genericData;
}

- (DACarKeyAdditionalCrossPlatformSharingData)additionalData
{
  return self->_additionalData;
}

- (DACarKeyPrivateCrossPlatformSharingData)privateData
{
  return self->_privateData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateData, 0);
  objc_storeStrong((id *)&self->_additionalData, 0);

  objc_storeStrong((id *)&self->_genericData, 0);
}

@end