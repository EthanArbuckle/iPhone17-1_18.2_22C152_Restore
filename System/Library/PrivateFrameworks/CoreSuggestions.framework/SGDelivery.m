@interface SGDelivery
+ (BOOL)supportsSecureCoding;
+ (id)stringForProvider:(unint64_t)a3;
+ (unint64_t)providerForString:(id)a3;
- (NSString)externalIdentifier;
- (NSString)trackingNumber;
- (NSURL)parentURL;
- (SGDelivery)initWithCoder:(id)a3;
- (SGDelivery)initWithRecordId:(id)a3 origin:(id)a4 parentURL:(id)a5 provider:(unint64_t)a6 trackingNumber:(id)a7;
- (id)description;
- (unint64_t)provider;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SGDelivery

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingNumber, 0);
  objc_storeStrong((id *)&self->_externalIdentifier, 0);

  objc_storeStrong((id *)&self->_parentURL, 0);
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

- (NSURL)parentURL
{
  return self->_parentURL;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SGDelivery;
  id v4 = a3;
  [(SGObject *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_parentURL, @"parentURL", v5.receiver, v5.super_class);
  [v4 encodeInt64:self->_provider forKey:@"provider"];
  [v4 encodeObject:self->_trackingNumber forKey:@"trackingNumber"];
  [v4 encodeObject:self->_externalIdentifier forKey:@"externalIdentifier"];
}

- (SGDelivery)initWithCoder:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SGDelivery;
  v6 = [(SGObject *)&v20 initWithCoder:v5];
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    v8 = [v5 decodeObjectOfClasses:v7 forKey:@"parentURL"];

    if (v8)
    {
      v9 = v8;
      parentURL = v6->_parentURL;
      v6->_parentURL = v9;
    }
    else
    {
      parentURL = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(parentURL, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, @"SGDelivery.m", 50, @"nonnull property %s *%s was null when decoded", "NSURL", "parentURL");
    }

    v6->_provider = [v5 decodeInt64ForKey:@"provider"];
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    v12 = [v5 decodeObjectOfClasses:v11 forKey:@"trackingNumber"];

    if (v12)
    {
      v13 = v12;
      trackingNumber = v6->_trackingNumber;
      v6->_trackingNumber = v13;
    }
    else
    {
      trackingNumber = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(trackingNumber, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, @"SGDelivery.m", 52, @"nonnull property %s *%s was null when decoded", "NSString", "trackingNumber");
    }

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    v16 = [v5 decodeObjectOfClasses:v15 forKey:@"externalIdentifier"];

    if (v16)
    {
      v17 = v16;
      externalIdentifier = v6->_externalIdentifier;
      v6->_externalIdentifier = v17;
    }
    else
    {
      externalIdentifier = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(externalIdentifier, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, @"SGDelivery.m", 53, @"nonnull property %s *%s was null when decoded", "NSString", "externalIdentifier");
    }
  }
  return v6;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"[SGDelivery externalIdentifier:%@]", self->_externalIdentifier];

  return v2;
}

- (SGDelivery)initWithRecordId:(id)a3 origin:(id)a4 parentURL:(id)a5 provider:(unint64_t)a6 trackingNumber:(id)a7
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"SGDelivery.m", 30, @"Invalid parameter not satisfying: %@", @"recordId" object file lineNumber description];

    if (v14)
    {
LABEL_3:
      if (v15) {
        goto LABEL_4;
      }
LABEL_10:
      v26 = [MEMORY[0x1E4F28B00] currentHandler];
      [v26 handleFailureInMethod:a2, self, @"SGDelivery.m", 32, @"Invalid parameter not satisfying: %@", @"parentURL" object file lineNumber description];

      if (v16) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }
  v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"SGDelivery.m", 31, @"Invalid parameter not satisfying: %@", @"origin" object file lineNumber description];

  if (!v15) {
    goto LABEL_10;
  }
LABEL_4:
  if (v16) {
    goto LABEL_5;
  }
LABEL_11:
  v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"SGDelivery.m", 33, @"Invalid parameter not satisfying: %@", @"trackingNumber" object file lineNumber description];

LABEL_5:
  v28.receiver = self;
  v28.super_class = (Class)SGDelivery;
  v17 = [(SGObject *)&v28 initWithRecordId:v13 origin:v14];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_parentURL, a5);
    v18->_provider = a6;
    objc_storeStrong((id *)&v18->_trackingNumber, a7);
    v19 = [(id)objc_opt_class() stringForProvider:v18->_provider];
    v29[0] = v19;
    v29[1] = v18->_trackingNumber;
    objc_super v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
    uint64_t v21 = SGDelimitedStringsSerializeArray(v20);
    externalIdentifier = v18->_externalIdentifier;
    v18->_externalIdentifier = (NSString *)v21;
  }
  return v18;
}

+ (unint64_t)providerForString:(id)a3
{
  v3 = [a3 lowercaseString];
  if ([v3 isEqualToString:@"fedex"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"ups"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"usps"])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"ontrac"])
  {
    unint64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"dhl"])
  {
    unint64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"tnt"])
  {
    unint64_t v4 = 6;
  }
  else if ([v3 isEqualToString:@"ems"])
  {
    unint64_t v4 = 7;
  }
  else if ([v3 isEqualToString:@"canadapost"])
  {
    unint64_t v4 = 8;
  }
  else if ([v3 isEqualToString:@"chronopost"])
  {
    unint64_t v4 = 9;
  }
  else if ([v3 isEqualToString:@"colissimo"])
  {
    unint64_t v4 = 10;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

+ (id)stringForProvider:(unint64_t)a3
{
  if (a3 > 0xA) {
    return @"Unknown";
  }
  else {
    return off_1E5B90390[a3];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end