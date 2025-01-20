@interface MSPSharingRestorationStorage
+ (Class)mapsIdentifierType;
+ (Class)messagesIdentifierType;
- (BOOL)hasCreatedTimestamp;
- (BOOL)hasGroupIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)mapsIdentifiers;
- (NSMutableArray)messagesIdentifiers;
- (NSString)groupIdentifier;
- (PBUnknownFields)unknownFields;
- (double)createdTimestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)mapsIdentifierAtIndex:(unint64_t)a3;
- (id)messagesIdentifierAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)mapsIdentifiersCount;
- (unint64_t)messagesIdentifiersCount;
- (void)addMapsIdentifier:(id)a3;
- (void)addMessagesIdentifier:(id)a3;
- (void)clearMapsIdentifiers;
- (void)clearMessagesIdentifiers;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCreatedTimestamp:(double)a3;
- (void)setGroupIdentifier:(id)a3;
- (void)setHasCreatedTimestamp:(BOOL)a3;
- (void)setMapsIdentifiers:(id)a3;
- (void)setMessagesIdentifiers:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MSPSharingRestorationStorage

- (void)setCreatedTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_createdTimestamp = a3;
}

- (void)setHasCreatedTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCreatedTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasGroupIdentifier
{
  return self->_groupIdentifier != 0;
}

- (void)clearMapsIdentifiers
{
}

- (void)addMapsIdentifier:(id)a3
{
  id v4 = a3;
  mapsIdentifiers = self->_mapsIdentifiers;
  id v8 = v4;
  if (!mapsIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_mapsIdentifiers;
    self->_mapsIdentifiers = v6;

    id v4 = v8;
    mapsIdentifiers = self->_mapsIdentifiers;
  }
  [(NSMutableArray *)mapsIdentifiers addObject:v4];
}

- (unint64_t)mapsIdentifiersCount
{
  return [(NSMutableArray *)self->_mapsIdentifiers count];
}

- (id)mapsIdentifierAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_mapsIdentifiers objectAtIndex:a3];
}

+ (Class)mapsIdentifierType
{
  return (Class)objc_opt_class();
}

- (void)clearMessagesIdentifiers
{
}

- (void)addMessagesIdentifier:(id)a3
{
  id v4 = a3;
  messagesIdentifiers = self->_messagesIdentifiers;
  id v8 = v4;
  if (!messagesIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_messagesIdentifiers;
    self->_messagesIdentifiers = v6;

    id v4 = v8;
    messagesIdentifiers = self->_messagesIdentifiers;
  }
  [(NSMutableArray *)messagesIdentifiers addObject:v4];
}

- (unint64_t)messagesIdentifiersCount
{
  return [(NSMutableArray *)self->_messagesIdentifiers count];
}

- (id)messagesIdentifierAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_messagesIdentifiers objectAtIndex:a3];
}

+ (Class)messagesIdentifierType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MSPSharingRestorationStorage;
  id v4 = [(MSPSharingRestorationStorage *)&v8 description];
  v5 = [(MSPSharingRestorationStorage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithDouble:self->_createdTimestamp];
    [v3 setObject:v4 forKey:@"created_timestamp"];
  }
  groupIdentifier = self->_groupIdentifier;
  if (groupIdentifier) {
    [v3 setObject:groupIdentifier forKey:@"group_identifier"];
  }
  mapsIdentifiers = self->_mapsIdentifiers;
  if (mapsIdentifiers) {
    [v3 setObject:mapsIdentifiers forKey:@"maps_identifier"];
  }
  messagesIdentifiers = self->_messagesIdentifiers;
  if (messagesIdentifiers) {
    [v3 setObject:messagesIdentifiers forKey:@"messages_identifier"];
  }
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    v9 = [(PBUnknownFields *)unknownFields dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"Unknown Fields"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MSPSharingRestorationStorageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_groupIdentifier) {
    PBDataWriterWriteStringField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = self->_mapsIdentifiers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_messagesIdentifiers;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v15);
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[2] = *(void *)&self->_createdTimestamp;
    *((unsigned char *)v4 + 48) |= 1u;
  }
  id v13 = v4;
  if (self->_groupIdentifier) {
    objc_msgSend(v4, "setGroupIdentifier:");
  }
  if ([(MSPSharingRestorationStorage *)self mapsIdentifiersCount])
  {
    [v13 clearMapsIdentifiers];
    unint64_t v5 = [(MSPSharingRestorationStorage *)self mapsIdentifiersCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(MSPSharingRestorationStorage *)self mapsIdentifierAtIndex:i];
        [v13 addMapsIdentifier:v8];
      }
    }
  }
  if ([(MSPSharingRestorationStorage *)self messagesIdentifiersCount])
  {
    [v13 clearMessagesIdentifiers];
    unint64_t v9 = [(MSPSharingRestorationStorage *)self messagesIdentifiersCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(MSPSharingRestorationStorage *)self messagesIdentifierAtIndex:j];
        [v13 addMessagesIdentifier:v12];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 16) = self->_createdTimestamp;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_groupIdentifier copyWithZone:a3];
  uint64_t v8 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v7;

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  unint64_t v9 = self->_mapsIdentifiers;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = (void *)[*(id *)(*((void *)&v26 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addMapsIdentifier:v14];
      }
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v11);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v15 = self->_messagesIdentifiers;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v15);
        }
        long long v20 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * j), "copyWithZone:", a3, (void)v22);
        [(id)v6 addMessagesIdentifier:v20];
      }
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v17);
  }

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_createdTimestamp != *((double *)v4 + 2)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  groupIdentifier = self->_groupIdentifier;
  if ((unint64_t)groupIdentifier | *((void *)v4 + 3)
    && !-[NSString isEqual:](groupIdentifier, "isEqual:"))
  {
    goto LABEL_13;
  }
  mapsIdentifiers = self->_mapsIdentifiers;
  if ((unint64_t)mapsIdentifiers | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](mapsIdentifiers, "isEqual:")) {
      goto LABEL_13;
    }
  }
  messagesIdentifiers = self->_messagesIdentifiers;
  if ((unint64_t)messagesIdentifiers | *((void *)v4 + 5)) {
    char v8 = -[NSMutableArray isEqual:](messagesIdentifiers, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    double createdTimestamp = self->_createdTimestamp;
    double v5 = -createdTimestamp;
    if (createdTimestamp >= 0.0) {
      double v5 = self->_createdTimestamp;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  NSUInteger v8 = [(NSString *)self->_groupIdentifier hash] ^ v3;
  uint64_t v9 = [(NSMutableArray *)self->_mapsIdentifiers hash];
  return v8 ^ v9 ^ [(NSMutableArray *)self->_messagesIdentifiers hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = (id *)v4;
  if (*((unsigned char *)v4 + 48))
  {
    self->_double createdTimestamp = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 3)) {
    -[MSPSharingRestorationStorage setGroupIdentifier:](self, "setGroupIdentifier:");
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v5[4];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        [(MSPSharingRestorationStorage *)self addMapsIdentifier:*(void *)(*((void *)&v20 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = v5[5];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        -[MSPSharingRestorationStorage addMessagesIdentifier:](self, "addMessagesIdentifier:", *(void *)(*((void *)&v16 + 1) + 8 * j), (void)v16);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (double)createdTimestamp
{
  return self->_createdTimestamp;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
}

- (NSMutableArray)mapsIdentifiers
{
  return self->_mapsIdentifiers;
}

- (void)setMapsIdentifiers:(id)a3
{
}

- (NSMutableArray)messagesIdentifiers
{
  return self->_messagesIdentifiers;
}

- (void)setMessagesIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagesIdentifiers, 0);
  objc_storeStrong((id *)&self->_mapsIdentifiers, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end