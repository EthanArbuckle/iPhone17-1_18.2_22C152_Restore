@interface UtraReselectionInfo
+ (Class)utraNcellType;
- (BOOL)hasSfHigh;
- (BOOL)hasSfMedium;
- (BOOL)hasTReselection;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)utraNcells;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)utraNcellAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)utraNcellsCount;
- (unsigned)sfHigh;
- (unsigned)sfMedium;
- (unsigned)tReselection;
- (void)addUtraNcell:(id)a3;
- (void)clearUtraNcells;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasSfHigh:(BOOL)a3;
- (void)setHasSfMedium:(BOOL)a3;
- (void)setHasTReselection:(BOOL)a3;
- (void)setSfHigh:(unsigned int)a3;
- (void)setSfMedium:(unsigned int)a3;
- (void)setTReselection:(unsigned int)a3;
- (void)setUtraNcells:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation UtraReselectionInfo

- (void)setTReselection:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_tReselection = a3;
}

- (void)setHasTReselection:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTReselection
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSfMedium:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_sfMedium = a3;
}

- (void)setHasSfMedium:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSfMedium
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSfHigh:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_sfHigh = a3;
}

- (void)setHasSfHigh:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSfHigh
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearUtraNcells
{
}

- (void)addUtraNcell:(id)a3
{
  id v4 = a3;
  utraNcells = self->_utraNcells;
  id v8 = v4;
  if (!utraNcells)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_utraNcells;
    self->_utraNcells = v6;

    id v4 = v8;
    utraNcells = self->_utraNcells;
  }
  [(NSMutableArray *)utraNcells addObject:v4];
}

- (unint64_t)utraNcellsCount
{
  return (unint64_t)[(NSMutableArray *)self->_utraNcells count];
}

- (id)utraNcellAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_utraNcells objectAtIndex:a3];
}

+ (Class)utraNcellType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)UtraReselectionInfo;
  char v3 = [(UtraReselectionInfo *)&v7 description];
  id v4 = [(UtraReselectionInfo *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v14 = +[NSNumber numberWithUnsignedInt:self->_tReselection];
    [v3 setObject:v14 forKey:@"t_reselection"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v15 = +[NSNumber numberWithUnsignedInt:self->_sfMedium];
  [v3 setObject:v15 forKey:@"sf_medium"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    v5 = +[NSNumber numberWithUnsignedInt:self->_sfHigh];
    [v3 setObject:v5 forKey:@"sf_high"];
  }
LABEL_5:
  if ([(NSMutableArray *)self->_utraNcells count])
  {
    id v6 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_utraNcells, "count")];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    objc_super v7 = self->_utraNcells;
    id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v16 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"utra_ncell"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10014D21C(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  if (*(unsigned char *)&self->_has) {
LABEL_4:
  }
    PBDataWriterWriteUint32Field();
LABEL_5:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = self->_utraNcells;
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
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_13:
    v4[3] = self->_sfMedium;
    *((unsigned char *)v4 + 32) |= 2u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  v4[4] = self->_tReselection;
  *((unsigned char *)v4 + 32) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_13;
  }
LABEL_3:
  if (has)
  {
LABEL_4:
    v4[2] = self->_sfHigh;
    *((unsigned char *)v4 + 32) |= 1u;
  }
LABEL_5:
  id v10 = v4;
  if ([(UtraReselectionInfo *)self utraNcellsCount])
  {
    [v10 clearUtraNcells];
    unint64_t v6 = [(UtraReselectionInfo *)self utraNcellsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(UtraReselectionInfo *)self utraNcellAtIndex:i];
        [v10 addUtraNcell:v9];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  unint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v5 + 4) = self->_tReselection;
    *((unsigned char *)v5 + 32) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 3) = self->_sfMedium;
  *((unsigned char *)v5 + 32) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    *((_DWORD *)v5 + 2) = self->_sfHigh;
    *((unsigned char *)v5 + 32) |= 1u;
  }
LABEL_5:
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_utraNcells;
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
        [v6 addUtraNcell:v13];
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
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_tReselection != *((_DWORD *)v4 + 4)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
LABEL_19:
    unsigned __int8 v6 = 0;
    goto LABEL_20;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_sfMedium != *((_DWORD *)v4 + 3)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_sfHigh != *((_DWORD *)v4 + 2)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_19;
  }
  utraNcells = self->_utraNcells;
  if ((unint64_t)utraNcells | *((void *)v4 + 3)) {
    unsigned __int8 v6 = -[NSMutableArray isEqual:](utraNcells, "isEqual:");
  }
  else {
    unsigned __int8 v6 = 1;
  }
LABEL_20:

  return v6;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4 ^ (unint64_t)[(NSMutableArray *)self->_utraNcells hash];
  }
  uint64_t v2 = 2654435761 * self->_tReselection;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_sfMedium;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_sfHigh;
  return v3 ^ v2 ^ v4 ^ (unint64_t)[(NSMutableArray *)self->_utraNcells hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  char v6 = *((unsigned char *)v4 + 32);
  if ((v6 & 4) != 0)
  {
    self->_tReselection = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 4u;
    char v6 = *((unsigned char *)v4 + 32);
    if ((v6 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_sfMedium = *((_DWORD *)v4 + 3);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)v4 + 32))
  {
LABEL_4:
    self->_sfHigh = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_5:
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 3);
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
        -[UtraReselectionInfo addUtraNcell:](self, "addUtraNcell:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (unsigned)tReselection
{
  return self->_tReselection;
}

- (unsigned)sfMedium
{
  return self->_sfMedium;
}

- (unsigned)sfHigh
{
  return self->_sfHigh;
}

- (NSMutableArray)utraNcells
{
  return self->_utraNcells;
}

- (void)setUtraNcells:(id)a3
{
}

- (void).cxx_destruct
{
}

@end