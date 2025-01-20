@interface IDSOffGridServiceUpdateMessage
+ (BOOL)supportsSecureCoding;
- (IDSOffGridServiceUpdateMessage)initWithCoder:(id)a3;
- (IDSOffGridServiceUpdateMessage)initWithDictionaryMessage:(id)a3;
- (IDSOffGridServiceUpdateMessage)initWithPreferredServiceType:(int64_t)a3 senderURI:(id)a4 recipientURI:(id)a5;
- (IDSURI)recipientURI;
- (IDSURI)senderURI;
- (NSDate)expirationDate;
- (id)dictionaryRepresentation;
- (int64_t)preferredServiceType;
- (void)encodeWithCoder:(id)a3;
- (void)setExpirationDate:(id)a3;
@end

@implementation IDSOffGridServiceUpdateMessage

- (IDSOffGridServiceUpdateMessage)initWithPreferredServiceType:(int64_t)a3 senderURI:(id)a4 recipientURI:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  v12 = 0;
  if (v9 && v10)
  {
    v16.receiver = self;
    v16.super_class = (Class)IDSOffGridServiceUpdateMessage;
    v13 = [(IDSOffGridServiceUpdateMessage *)&v16 init];
    p_isa = (id *)&v13->super.isa;
    if (v13)
    {
      v13->_preferredServiceType = a3;
      objc_storeStrong((id *)&v13->_senderURI, a4);
      objc_storeStrong(p_isa + 2, a5);
    }
    self = p_isa;
    v12 = self;
  }

  return v12;
}

- (IDSOffGridServiceUpdateMessage)initWithDictionaryMessage:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v19.receiver = self;
    v19.super_class = (Class)IDSOffGridServiceUpdateMessage;
    v5 = [(IDSOffGridServiceUpdateMessage *)&v19 init];
    if (v5)
    {
      v6 = [v4 objectForKeyedSubscript:@"preferredService"];
      v5->_preferredServiceType = (int)[v6 intValue];

      v7 = (void *)MEMORY[0x1E4F6B5C8];
      v8 = [v4 objectForKeyedSubscript:@"senderURI"];
      uint64_t v9 = [v7 URIWithPrefixedURI:v8];
      senderURI = v5->_senderURI;
      v5->_senderURI = (IDSURI *)v9;

      v11 = (void *)MEMORY[0x1E4F6B5C8];
      v12 = [v4 objectForKeyedSubscript:@"recipientURI"];
      uint64_t v13 = [v11 URIWithPrefixedURI:v12];
      recipientURI = v5->_recipientURI;
      v5->_recipientURI = (IDSURI *)v13;

      uint64_t v15 = [v4 objectForKeyedSubscript:@"expirationDate"];
      expirationDate = v5->_expirationDate;
      v5->_expirationDate = (NSDate *)v15;
    }
    self = v5;
    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)dictionaryRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [NSNumber numberWithInteger:self->_preferredServiceType];
  if (v4) {
    CFDictionarySetValue(v3, @"preferredService", v4);
  }

  v5 = [(IDSURI *)self->_senderURI prefixedURI];
  if (v5) {
    CFDictionarySetValue(v3, @"senderURI", v5);
  }

  v6 = [(IDSURI *)self->_recipientURI prefixedURI];
  if (v6) {
    CFDictionarySetValue(v3, @"recipientURI", v6);
  }

  expirationDate = self->_expirationDate;
  if (expirationDate) {
    CFDictionarySetValue(v3, @"expirationDate", expirationDate);
  }
  v8 = (void *)[(__CFDictionary *)v3 copy];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSOffGridServiceUpdateMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preferredService"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"senderURI"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recipientURI"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];

  uint64_t v9 = -[IDSOffGridServiceUpdateMessage initWithPreferredServiceType:senderURI:recipientURI:]([IDSOffGridServiceUpdateMessage alloc], "initWithPreferredServiceType:senderURI:recipientURI:", (int)[v5 intValue], v6, v7);
  [(IDSOffGridServiceUpdateMessage *)v9 setExpirationDate:v8];

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  int64_t preferredServiceType = self->_preferredServiceType;
  id v7 = a3;
  v6 = [v4 numberWithInteger:preferredServiceType];
  [v7 encodeObject:v6 forKey:@"preferredService"];

  [v7 encodeObject:self->_senderURI forKey:@"senderURI"];
  [v7 encodeObject:self->_recipientURI forKey:@"recipientURI"];
  [v7 encodeObject:self->_expirationDate forKey:@"expirationDate"];
}

- (IDSURI)senderURI
{
  return self->_senderURI;
}

- (IDSURI)recipientURI
{
  return self->_recipientURI;
}

- (int64_t)preferredServiceType
{
  return self->_preferredServiceType;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_recipientURI, 0);

  objc_storeStrong((id *)&self->_senderURI, 0);
}

@end