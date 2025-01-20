@interface HMMediaGroupProtoMediaDestination
- (BOOL)hasAudioGroupIdentifier;
- (BOOL)hasIdentifier;
- (BOOL)hasParentIdentifier;
- (BOOL)hasSupportedOptions;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)audioGroupIdentifier;
- (NSString)identifier;
- (NSString)parentIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)supportedOptions;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAudioGroupIdentifier:(id)a3;
- (void)setHasSupportedOptions:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setParentIdentifier:(id)a3;
- (void)setSupportedOptions:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMMediaGroupProtoMediaDestination

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_audioGroupIdentifier, 0);
}

- (void)setAudioGroupIdentifier:(id)a3
{
}

- (NSString)audioGroupIdentifier
{
  return self->_audioGroupIdentifier;
}

- (unint64_t)supportedOptions
{
  return self->_supportedOptions;
}

- (void)setParentIdentifier:(id)a3
{
}

- (NSString)parentIdentifier
{
  return self->_parentIdentifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)mergeFrom:(id)a3
{
  v4 = (unint64_t *)a3;
  v5 = v4;
  if (v4[3])
  {
    -[HMMediaGroupProtoMediaDestination setIdentifier:](self, "setIdentifier:");
    v4 = v5;
  }
  if (v4[4])
  {
    -[HMMediaGroupProtoMediaDestination setParentIdentifier:](self, "setParentIdentifier:");
    v4 = v5;
  }
  if (v4[5])
  {
    self->_supportedOptions = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (v4[2])
  {
    -[HMMediaGroupProtoMediaDestination setAudioGroupIdentifier:](self, "setAudioGroupIdentifier:");
    v4 = v5;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  NSUInteger v4 = [(NSString *)self->_parentIdentifier hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v5 = 2654435761u * self->_supportedOptions;
  }
  else {
    unint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(NSString *)self->_audioGroupIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_13;
    }
  }
  parentIdentifier = self->_parentIdentifier;
  if ((unint64_t)parentIdentifier | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](parentIdentifier, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_supportedOptions != *((void *)v4 + 1)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  audioGroupIdentifier = self->_audioGroupIdentifier;
  if ((unint64_t)audioGroupIdentifier | *((void *)v4 + 2)) {
    char v8 = -[NSString isEqual:](audioGroupIdentifier, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_parentIdentifier copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_supportedOptions;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  uint64_t v10 = [(NSString *)self->_audioGroupIdentifier copyWithZone:a3];
  v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    id v4 = v5;
  }
  if (self->_parentIdentifier)
  {
    objc_msgSend(v5, "setParentIdentifier:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_supportedOptions;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  if (self->_audioGroupIdentifier)
  {
    objc_msgSend(v5, "setAudioGroupIdentifier:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_parentIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
  if (self->_audioGroupIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return HMMediaGroupProtoMediaDestinationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  parentIdentifier = self->_parentIdentifier;
  if (parentIdentifier) {
    [v4 setObject:parentIdentifier forKey:@"parentIdentifier"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithUnsignedLongLong:self->_supportedOptions];
    [v4 setObject:v7 forKey:@"supportedOptions"];
  }
  audioGroupIdentifier = self->_audioGroupIdentifier;
  if (audioGroupIdentifier) {
    [v4 setObject:audioGroupIdentifier forKey:@"audioGroupIdentifier"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMMediaGroupProtoMediaDestination;
  id v4 = [(HMMediaGroupProtoMediaDestination *)&v8 description];
  id v5 = [(HMMediaGroupProtoMediaDestination *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasAudioGroupIdentifier
{
  return self->_audioGroupIdentifier != 0;
}

- (BOOL)hasSupportedOptions
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasSupportedOptions:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setSupportedOptions:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_supportedOptions = a3;
}

- (BOOL)hasParentIdentifier
{
  return self->_parentIdentifier != 0;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

@end