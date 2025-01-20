@interface IDSOffGridEncryptionProperties
+ (BOOL)supportsSecureCoding;
- (IDSOffGridEncryptionProperties)init;
- (IDSOffGridEncryptionProperties)initWithCoder:(id)a3;
- (IDSOffGridEncryptionProperties)initWithDictionary:(id)a3;
- (NSData)authTag;
- (NSData)encryptionKeyID;
- (NSNumber)ratchetCounter;
- (NSNumber)segmentNumber;
- (NSNumber)totalSegments;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int64_t)compare:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthTag:(id)a3;
- (void)setEncryptionKeyID:(id)a3;
- (void)setRatchetCounter:(id)a3;
- (void)setSegmentNumber:(id)a3;
- (void)setTotalSegments:(id)a3;
@end

@implementation IDSOffGridEncryptionProperties

- (IDSOffGridEncryptionProperties)init
{
  v3.receiver = self;
  v3.super_class = (Class)IDSOffGridEncryptionProperties;
  return [(IDSOffGridEncryptionProperties *)&v3 init];
}

- (IDSOffGridEncryptionProperties)initWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)IDSOffGridEncryptionProperties;
  v5 = [(IDSOffGridEncryptionProperties *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"rc"];
    ratchetCounter = v5->_ratchetCounter;
    v5->_ratchetCounter = (NSNumber *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"e-id"];
    encryptionKeyID = v5->_encryptionKeyID;
    v5->_encryptionKeyID = (NSData *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"at"];
    authTag = v5->_authTag;
    v5->_authTag = (NSData *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"segment-number"];
    segmentNumber = v5->_segmentNumber;
    v5->_segmentNumber = (NSNumber *)v12;

    uint64_t v14 = [v4 objectForKeyedSubscript:@"segment-count"];
    totalSegments = v5->_totalSegments;
    v5->_totalSegments = (NSNumber *)v14;
  }
  return v5;
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = v3;
  ratchetCounter = self->_ratchetCounter;
  if (ratchetCounter) {
    CFDictionarySetValue(v3, @"rc", ratchetCounter);
  }
  encryptionKeyID = self->_encryptionKeyID;
  if (encryptionKeyID) {
    CFDictionarySetValue(v4, @"e-id", encryptionKeyID);
  }
  authTag = self->_authTag;
  if (authTag) {
    CFDictionarySetValue(v4, @"at", authTag);
  }
  segmentNumber = self->_segmentNumber;
  if (segmentNumber) {
    CFDictionarySetValue(v4, @"segment-number", segmentNumber);
  }
  totalSegments = self->_totalSegments;
  if (totalSegments) {
    CFDictionarySetValue(v4, @"segment-count", totalSegments);
  }
  uint64_t v10 = (void *)[(__CFDictionary *)v4 copy];

  return v10;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  v5 = [(IDSOffGridEncryptionProperties *)self segmentNumber];
  uint64_t v6 = [v4 segmentNumber];

  int64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(IDSOffGridEncryptionProperties *)self dictionaryRepresentation];
  uint64_t v6 = (void *)[v4 initWithDictionary:v5];

  return v6;
}

- (NSData)authTag
{
  NSInteger v3 = [(NSNumber *)self->_segmentNumber integerValue];
  if (v3 == [(NSNumber *)self->_totalSegments integerValue]) {
    id v4 = self->_authTag;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSOffGridEncryptionProperties)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rc"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"e-id"];
  int64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"at"];
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"segment-number"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"segment-count"];

  uint64_t v10 = objc_alloc_init(IDSOffGridEncryptionProperties);
  [(IDSOffGridEncryptionProperties *)v10 setRatchetCounter:v5];
  [(IDSOffGridEncryptionProperties *)v10 setEncryptionKeyID:v6];
  [(IDSOffGridEncryptionProperties *)v10 setAuthTag:v7];
  [(IDSOffGridEncryptionProperties *)v10 setSegmentNumber:v8];
  [(IDSOffGridEncryptionProperties *)v10 setTotalSegments:v9];

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  ratchetCounter = self->_ratchetCounter;
  id v5 = a3;
  [v5 encodeObject:ratchetCounter forKey:@"rc"];
  [v5 encodeObject:self->_encryptionKeyID forKey:@"e-id"];
  [v5 encodeObject:self->_authTag forKey:@"at"];
  [v5 encodeObject:self->_segmentNumber forKey:@"segment-number"];
  [v5 encodeObject:self->_totalSegments forKey:@"segment-count"];
}

- (NSNumber)ratchetCounter
{
  return self->_ratchetCounter;
}

- (void)setRatchetCounter:(id)a3
{
}

- (NSData)encryptionKeyID
{
  return self->_encryptionKeyID;
}

- (void)setEncryptionKeyID:(id)a3
{
}

- (void)setAuthTag:(id)a3
{
}

- (NSNumber)segmentNumber
{
  return self->_segmentNumber;
}

- (void)setSegmentNumber:(id)a3
{
}

- (NSNumber)totalSegments
{
  return self->_totalSegments;
}

- (void)setTotalSegments:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalSegments, 0);
  objc_storeStrong((id *)&self->_segmentNumber, 0);
  objc_storeStrong((id *)&self->_authTag, 0);
  objc_storeStrong((id *)&self->_encryptionKeyID, 0);

  objc_storeStrong((id *)&self->_ratchetCounter, 0);
}

@end