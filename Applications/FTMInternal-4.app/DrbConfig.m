@interface DrbConfig
+ (Class)perDrbConfigType;
- (BOOL)hasCipheringAlgo;
- (BOOL)hasIntegrityAlgo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)perDrbConfigs;
- (id)cipheringAlgoAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)integrityAlgoAsString:(int)a3;
- (id)perDrbConfigAtIndex:(unint64_t)a3;
- (int)StringAsCipheringAlgo:(id)a3;
- (int)StringAsIntegrityAlgo:(id)a3;
- (int)cipheringAlgo;
- (int)integrityAlgo;
- (unint64_t)hash;
- (unint64_t)perDrbConfigsCount;
- (void)addPerDrbConfig:(id)a3;
- (void)clearPerDrbConfigs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCipheringAlgo:(int)a3;
- (void)setHasCipheringAlgo:(BOOL)a3;
- (void)setHasIntegrityAlgo:(BOOL)a3;
- (void)setIntegrityAlgo:(int)a3;
- (void)setPerDrbConfigs:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation DrbConfig

- (int)integrityAlgo
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_integrityAlgo;
  }
  else {
    return 0;
  }
}

- (void)setIntegrityAlgo:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_integrityAlgo = a3;
}

- (void)setHasIntegrityAlgo:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIntegrityAlgo
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)integrityAlgoAsString:(int)a3
{
  if (a3 >= 5)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = *(&off_1002871F0 + a3);
  }

  return v3;
}

- (int)StringAsIntegrityAlgo:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ALGO_NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ALGO_SNOW3G"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ALGO_AES"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ALGO_ZUC"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ALGO_MAX"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)cipheringAlgo
{
  if (*(unsigned char *)&self->_has) {
    return self->_cipheringAlgo;
  }
  else {
    return 0;
  }
}

- (void)setCipheringAlgo:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_cipheringAlgo = a3;
}

- (void)setHasCipheringAlgo:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCipheringAlgo
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)cipheringAlgoAsString:(int)a3
{
  if (a3 >= 5)
  {
    id v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    id v3 = *(&off_1002871F0 + a3);
  }

  return v3;
}

- (int)StringAsCipheringAlgo:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ALGO_NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ALGO_SNOW3G"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ALGO_AES"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ALGO_ZUC"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ALGO_MAX"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearPerDrbConfigs
{
}

- (void)addPerDrbConfig:(id)a3
{
  id v4 = a3;
  perDrbConfigs = self->_perDrbConfigs;
  id v8 = v4;
  if (!perDrbConfigs)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_perDrbConfigs;
    self->_perDrbConfigs = v6;

    id v4 = v8;
    perDrbConfigs = self->_perDrbConfigs;
  }
  [(NSMutableArray *)perDrbConfigs addObject:v4];
}

- (unint64_t)perDrbConfigsCount
{
  return (unint64_t)[(NSMutableArray *)self->_perDrbConfigs count];
}

- (id)perDrbConfigAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_perDrbConfigs objectAtIndex:a3];
}

+ (Class)perDrbConfigType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)DrbConfig;
  id v3 = [(DrbConfig *)&v7 description];
  id v4 = [(DrbConfig *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t integrityAlgo = self->_integrityAlgo;
    if (integrityAlgo >= 5)
    {
      v6 = +[NSString stringWithFormat:@"(unknown: %i)", self->_integrityAlgo];
    }
    else
    {
      v6 = *(&off_1002871F0 + integrityAlgo);
    }
    [v3 setObject:v6 forKey:@"integrity_algo"];

    char has = (char)self->_has;
  }
  if (has)
  {
    uint64_t cipheringAlgo = self->_cipheringAlgo;
    if (cipheringAlgo >= 5)
    {
      id v8 = +[NSString stringWithFormat:@"(unknown: %i)", self->_cipheringAlgo];
    }
    else
    {
      id v8 = *(&off_1002871F0 + cipheringAlgo);
    }
    [v3 setObject:v8 forKey:@"ciphering_algo"];
  }
  if ([(NSMutableArray *)self->_perDrbConfigs count])
  {
    id v9 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_perDrbConfigs, "count")];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v10 = self->_perDrbConfigs;
    id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = [*(id *)(*((void *)&v17 + 1) + 8 * i) dictionaryRepresentation];
          [v9 addObject:v15];
        }
        id v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }

    [v3 setObject:v9 forKey:@"per_drb_config"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100043158(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteInt32Field();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_perDrbConfigs;
  objc_super v7 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      id v8 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[3] = self->_integrityAlgo;
    *((unsigned char *)v4 + 24) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[2] = self->_cipheringAlgo;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  id v10 = v4;
  if ([(DrbConfig *)self perDrbConfigsCount])
  {
    [v10 clearPerDrbConfigs];
    unint64_t v6 = [(DrbConfig *)self perDrbConfigsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(DrbConfig *)self perDrbConfigAtIndex:i];
        [v10 addPerDrbConfig:v9];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 3) = self->_integrityAlgo;
    *((unsigned char *)v5 + 24) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v5 + 2) = self->_cipheringAlgo;
    *((unsigned char *)v5 + 24) |= 1u;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_perDrbConfigs;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v15 + 1) + 8 * i) copyWithZone:a3];
        [v6 addPerDrbConfig:v13];
      }
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_integrityAlgo != *((_DWORD *)v4 + 3)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
LABEL_14:
    unsigned __int8 v6 = 0;
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_cipheringAlgo != *((_DWORD *)v4 + 2)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
    goto LABEL_14;
  }
  perDrbConfigs = self->_perDrbConfigs;
  if ((unint64_t)perDrbConfigs | *((void *)v4 + 2)) {
    unsigned __int8 v6 = -[NSMutableArray isEqual:](perDrbConfigs, "isEqual:");
  }
  else {
    unsigned __int8 v6 = 1;
  }
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_integrityAlgo;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2 ^ (unint64_t)[(NSMutableArray *)self->_perDrbConfigs hash];
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_cipheringAlgo;
  return v3 ^ v2 ^ (unint64_t)[(NSMutableArray *)self->_perDrbConfigs hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  char v6 = *((unsigned char *)v4 + 24);
  if ((v6 & 2) != 0)
  {
    self->_uint64_t integrityAlgo = *((_DWORD *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
    char v6 = *((unsigned char *)v4 + 24);
  }
  if (v6)
  {
    self->_uint64_t cipheringAlgo = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 2);
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[DrbConfig addPerDrbConfig:](self, "addPerDrbConfig:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (NSMutableArray)perDrbConfigs
{
  return self->_perDrbConfigs;
}

- (void)setPerDrbConfigs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end