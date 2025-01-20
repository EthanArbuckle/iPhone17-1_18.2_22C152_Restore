@interface HMPBHomeReference
+ (HMPBHomeReference)homeReferenceWithData:(id)a3;
+ (HMPBHomeReference)homeReferenceWithHome:(id)a3;
- (BOOL)hasUniqueIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)uniqueIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMPBHomeReference

+ (HMPBHomeReference)homeReferenceWithHome:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(HMPBHomeReference);
  v5 = [v3 uniqueIdentifier];

  v6 = objc_msgSend(v5, "hm_convertToData");
  [(HMPBHomeReference *)v4 setUniqueIdentifier:v6];

  return v4;
}

+ (HMPBHomeReference)homeReferenceWithData:(id)a3
{
  id v3 = a3;
  v4 = [[HMPBHomeReference alloc] initWithData:v3];

  return v4;
}

- (void).cxx_destruct
{
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (NSData)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[HMPBHomeReference setUniqueIdentifier:](self, "setUniqueIdentifier:");
  }
}

- (unint64_t)hash
{
  return [(NSData *)self->_uniqueIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    uniqueIdentifier = self->_uniqueIdentifier;
    if ((unint64_t)uniqueIdentifier | v4[1]) {
      char v6 = -[NSData isEqual:](uniqueIdentifier, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_uniqueIdentifier copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (void)copyTo:(id)a3
{
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier) {
    [a3 setUniqueIdentifier:uniqueIdentifier];
  }
}

- (void)writeTo:(id)a3
{
  if (self->_uniqueIdentifier) {
    PBDataWriterWriteDataField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return HMPBHomeReferenceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier) {
    [v3 setObject:uniqueIdentifier forKey:@"uniqueIdentifier"];
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMPBHomeReference;
  v4 = [(HMPBHomeReference *)&v8 description];
  v5 = [(HMPBHomeReference *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasUniqueIdentifier
{
  return self->_uniqueIdentifier != 0;
}

@end