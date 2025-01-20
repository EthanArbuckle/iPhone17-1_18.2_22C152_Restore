@interface HMMediaGroupProtoMediaDestinationControllerData
+ (Class)availableDestinationsType;
- (BOOL)hasDestinationIdentifier;
- (BOOL)hasIdentifier;
- (BOOL)hasParentIdentifier;
- (BOOL)hasSupportedOptions;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)availableDestinations;
- (NSString)destinationIdentifier;
- (NSString)identifier;
- (NSString)parentIdentifier;
- (id)availableDestinationsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)availableDestinationsCount;
- (unint64_t)hash;
- (unint64_t)supportedOptions;
- (void)addAvailableDestinations:(id)a3;
- (void)clearAvailableDestinations;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAvailableDestinations:(id)a3;
- (void)setDestinationIdentifier:(id)a3;
- (void)setHasSupportedOptions:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setParentIdentifier:(id)a3;
- (void)setSupportedOptions:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMMediaGroupProtoMediaDestinationControllerData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_destinationIdentifier, 0);

  objc_storeStrong((id *)&self->_availableDestinations, 0);
}

- (unint64_t)supportedOptions
{
  return self->_supportedOptions;
}

- (void)setAvailableDestinations:(id)a3
{
}

- (NSMutableArray)availableDestinations
{
  return self->_availableDestinations;
}

- (void)setDestinationIdentifier:(id)a3
{
}

- (NSString)destinationIdentifier
{
  return self->_destinationIdentifier;
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
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 4)) {
    -[HMMediaGroupProtoMediaDestinationControllerData setIdentifier:](self, "setIdentifier:");
  }
  if (*((void *)v4 + 5)) {
    -[HMMediaGroupProtoMediaDestinationControllerData setParentIdentifier:](self, "setParentIdentifier:");
  }
  if (*((void *)v4 + 3)) {
    -[HMMediaGroupProtoMediaDestinationControllerData setDestinationIdentifier:](self, "setDestinationIdentifier:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[HMMediaGroupProtoMediaDestinationControllerData addAvailableDestinations:](self, "addAvailableDestinations:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((unsigned char *)v4 + 48))
  {
    self->_supportedOptions = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  NSUInteger v4 = [(NSString *)self->_parentIdentifier hash];
  NSUInteger v5 = [(NSString *)self->_destinationIdentifier hash];
  uint64_t v6 = [(NSMutableArray *)self->_availableDestinations hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v7 = 2654435761u * self->_supportedOptions;
  }
  else {
    unint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_14;
    }
  }
  parentIdentifier = self->_parentIdentifier;
  if ((unint64_t)parentIdentifier | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](parentIdentifier, "isEqual:")) {
      goto LABEL_14;
    }
  }
  destinationIdentifier = self->_destinationIdentifier;
  if ((unint64_t)destinationIdentifier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](destinationIdentifier, "isEqual:")) {
      goto LABEL_14;
    }
  }
  availableDestinations = self->_availableDestinations;
  if ((unint64_t)availableDestinations | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](availableDestinations, "isEqual:")) {
      goto LABEL_14;
    }
  }
  BOOL v9 = (*((unsigned char *)v4 + 48) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) != 0 && self->_supportedOptions == *((void *)v4 + 1))
    {
      BOOL v9 = 1;
      goto LABEL_15;
    }
LABEL_14:
    BOOL v9 = 0;
  }
LABEL_15:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSString *)self->_parentIdentifier copyWithZone:a3];
  BOOL v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  uint64_t v10 = [(NSString *)self->_destinationIdentifier copyWithZone:a3];
  long long v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v12 = self->_availableDestinations;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v16), "copyWithZone:", a3, (void)v19);
        [(id)v5 addAvailableDestinations:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_supportedOptions;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_identifier) {
    objc_msgSend(v8, "setIdentifier:");
  }
  if (self->_parentIdentifier) {
    objc_msgSend(v8, "setParentIdentifier:");
  }
  if (self->_destinationIdentifier) {
    objc_msgSend(v8, "setDestinationIdentifier:");
  }
  if ([(HMMediaGroupProtoMediaDestinationControllerData *)self availableDestinationsCount])
  {
    [v8 clearAvailableDestinations];
    unint64_t v4 = [(HMMediaGroupProtoMediaDestinationControllerData *)self availableDestinationsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        unint64_t v7 = [(HMMediaGroupProtoMediaDestinationControllerData *)self availableDestinationsAtIndex:i];
        [v8 addAvailableDestinations:v7];
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v8 + 1) = self->_supportedOptions;
    *((unsigned char *)v8 + 48) |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_parentIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_destinationIdentifier) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v5 = self->_availableDestinations;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return HMMediaGroupProtoMediaDestinationControllerDataReadFrom((uint64_t)self, (uint64_t)a3);
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
  destinationIdentifier = self->_destinationIdentifier;
  if (destinationIdentifier) {
    [v4 setObject:destinationIdentifier forKey:@"destinationIdentifier"];
  }
  availableDestinations = self->_availableDestinations;
  if (availableDestinations) {
    [v4 setObject:availableDestinations forKey:@"availableDestinations"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v9 = [NSNumber numberWithUnsignedLongLong:self->_supportedOptions];
    [v4 setObject:v9 forKey:@"supportedOptions"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMMediaGroupProtoMediaDestinationControllerData;
  id v4 = [(HMMediaGroupProtoMediaDestinationControllerData *)&v8 description];
  unint64_t v5 = [(HMMediaGroupProtoMediaDestinationControllerData *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
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

- (id)availableDestinationsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_availableDestinations objectAtIndex:a3];
}

- (unint64_t)availableDestinationsCount
{
  return [(NSMutableArray *)self->_availableDestinations count];
}

- (void)addAvailableDestinations:(id)a3
{
  id v4 = a3;
  availableDestinations = self->_availableDestinations;
  id v8 = v4;
  if (!availableDestinations)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_availableDestinations;
    self->_availableDestinations = v6;

    id v4 = v8;
    availableDestinations = self->_availableDestinations;
  }
  [(NSMutableArray *)availableDestinations addObject:v4];
}

- (void)clearAvailableDestinations
{
}

- (BOOL)hasDestinationIdentifier
{
  return self->_destinationIdentifier != 0;
}

- (BOOL)hasParentIdentifier
{
  return self->_parentIdentifier != 0;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

+ (Class)availableDestinationsType
{
  return (Class)objc_opt_class();
}

@end