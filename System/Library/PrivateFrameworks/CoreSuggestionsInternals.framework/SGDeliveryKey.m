@interface SGDeliveryKey
+ (BOOL)isSupportedEntityType:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDeliveryKey:(id)a3;
- (NSString)description;
- (NSString)externalIdentifier;
- (NSString)trackingNumber;
- (SGDeliveryKey)initWithProvider:(unint64_t)a3 trackingNumber:(id)a4;
- (SGDeliveryKey)initWithSerialized:(id)a3;
- (id)serialize;
- (unint64_t)hash;
- (unint64_t)provider;
@end

@implementation SGDeliveryKey

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingNumber, 0);
  objc_storeStrong((id *)&self->_externalIdentifier, 0);
}

- (NSString)trackingNumber
{
  return self->_trackingNumber;
}

- (unint64_t)provider
{
  return self->_provider;
}

- (NSString)externalIdentifier
{
  return self->_externalIdentifier;
}

- (SGDeliveryKey)initWithSerialized:(id)a3
{
  v4 = SGDelimitedStringsDeserialize();
  v5 = [v4 objectAtIndexedSubscript:0];
  v6 = [v4 objectAtIndexedSubscript:1];
  v7 = -[SGDeliveryKey initWithProvider:trackingNumber:](self, "initWithProvider:trackingNumber:", [(id)objc_opt_class() providerForString:v5], v6);

  return v7;
}

- (NSString)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"[SGDeliveryKey externalIdentifier: %@]", self->_externalIdentifier];
  return (NSString *)v2;
}

- (id)serialize
{
  return self->_externalIdentifier;
}

- (unint64_t)hash
{
  return [(NSString *)self->_externalIdentifier hash];
}

- (BOOL)isEqualToDeliveryKey:(id)a3
{
  v4 = (SGDeliveryKey *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    v5 = self->_externalIdentifier;
    v6 = v5;
    if (v5 == v4->_externalIdentifier) {
      char v7 = 1;
    }
    else {
      char v7 = -[NSString isEqual:](v5, "isEqual:");
    }
  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SGDeliveryKey *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGDeliveryKey *)self isEqualToDeliveryKey:v5];

  return v6;
}

- (SGDeliveryKey)initWithProvider:(unint64_t)a3 trackingNumber:(id)a4
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (!v8)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SGDeliveryKey.m", 21, @"Invalid parameter not satisfying: %@", @"trackingNumber" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)SGDeliveryKey;
  v9 = [(SGDeliveryKey *)&v18 init];
  v10 = v9;
  if (v9)
  {
    v9->_provider = a3;
    objc_storeStrong((id *)&v9->_trackingNumber, a4);
    v11 = [(id)objc_opt_class() stringForProvider:v10->_provider];
    trackingNumber = v10->_trackingNumber;
    v19[0] = v11;
    v19[1] = trackingNumber;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    uint64_t v14 = SGDelimitedStringsSerializeArray();
    externalIdentifier = v10->_externalIdentifier;
    v10->_externalIdentifier = (NSString *)v14;
  }
  return v10;
}

+ (BOOL)isSupportedEntityType:(int64_t)a3
{
  return a3 == 24;
}

@end