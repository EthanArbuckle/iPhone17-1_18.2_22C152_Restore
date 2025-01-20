@interface MPPMediaQuery
+ (Class)filterPredicatesType;
+ (Class)staticEntityIdentifiersType;
- (BOOL)filteringDisabled;
- (BOOL)hasEntityOrder;
- (BOOL)hasFilteringDisabled;
- (BOOL)hasGroupingType;
- (BOOL)hasIncludeNonLibraryEntities;
- (BOOL)hasStaticEntityType;
- (BOOL)includeNonLibraryEntities;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)filterPredicates;
- (NSMutableArray)staticEntityIdentifiers;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)entityOrderAsString:(int)a3;
- (id)filterPredicatesAtIndex:(unint64_t)a3;
- (id)groupingTypeAsString:(int)a3;
- (id)staticEntityIdentifiersAtIndex:(unint64_t)a3;
- (id)staticEntityTypeAsString:(int)a3;
- (int)StringAsEntityOrder:(id)a3;
- (int)StringAsGroupingType:(id)a3;
- (int)StringAsStaticEntityType:(id)a3;
- (int)entityOrder;
- (int)groupingType;
- (int)staticEntityType;
- (unint64_t)filterPredicatesCount;
- (unint64_t)hash;
- (unint64_t)staticEntityIdentifiersCount;
- (void)addFilterPredicates:(id)a3;
- (void)addStaticEntityIdentifiers:(id)a3;
- (void)clearFilterPredicates;
- (void)clearStaticEntityIdentifiers;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEntityOrder:(int)a3;
- (void)setFilterPredicates:(id)a3;
- (void)setFilteringDisabled:(BOOL)a3;
- (void)setGroupingType:(int)a3;
- (void)setHasEntityOrder:(BOOL)a3;
- (void)setHasFilteringDisabled:(BOOL)a3;
- (void)setHasGroupingType:(BOOL)a3;
- (void)setHasIncludeNonLibraryEntities:(BOOL)a3;
- (void)setHasStaticEntityType:(BOOL)a3;
- (void)setIncludeNonLibraryEntities:(BOOL)a3;
- (void)setStaticEntityIdentifiers:(id)a3;
- (void)setStaticEntityType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation MPPMediaQuery

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticEntityIdentifiers, 0);

  objc_storeStrong((id *)&self->_filterPredicates, 0);
}

- (BOOL)includeNonLibraryEntities
{
  return self->_includeNonLibraryEntities;
}

- (void)setStaticEntityIdentifiers:(id)a3
{
}

- (NSMutableArray)staticEntityIdentifiers
{
  return self->_staticEntityIdentifiers;
}

- (BOOL)filteringDisabled
{
  return self->_filteringDisabled;
}

- (void)setFilterPredicates:(id)a3
{
}

- (NSMutableArray)filterPredicates
{
  return self->_filterPredicates;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        [(MPPMediaQuery *)self addFilterPredicates:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  char v10 = *((unsigned char *)v4 + 48);
  if ((v10 & 2) != 0)
  {
    self->_groupingType = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 2u;
    char v10 = *((unsigned char *)v4 + 48);
    if ((v10 & 8) == 0)
    {
LABEL_10:
      if ((v10 & 1) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 8) == 0)
  {
    goto LABEL_10;
  }
  self->_filteringDisabled = *((unsigned char *)v4 + 44);
  *(unsigned char *)&self->_has |= 8u;
  if (*((unsigned char *)v4 + 48))
  {
LABEL_11:
    self->_entityOrder = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_12:
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = *((id *)v4 + 4);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        -[MPPMediaQuery addStaticEntityIdentifiers:](self, "addStaticEntityIdentifiers:", *(void *)(*((void *)&v17 + 1) + 8 * j), (void)v17);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }

  char v16 = *((unsigned char *)v4 + 48);
  if ((v16 & 4) != 0)
  {
    self->_staticEntityType = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 4u;
    char v16 = *((unsigned char *)v4 + 48);
  }
  if ((v16 & 0x10) != 0)
  {
    self->_includeNonLibraryEntities = *((unsigned char *)v4 + 45);
    *(unsigned char *)&self->_has |= 0x10u;
  }
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_filterPredicates hash];
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v4 = 2654435761 * self->_groupingType;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_filteringDisabled;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_entityOrder;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v6 = 0;
LABEL_8:
  uint64_t v7 = [(NSMutableArray *)self->_staticEntityIdentifiers hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v8 = 2654435761 * self->_staticEntityType;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_10;
    }
LABEL_12:
    uint64_t v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_12;
  }
LABEL_10:
  uint64_t v9 = 2654435761 * self->_includeNonLibraryEntities;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  filterPredicates = self->_filterPredicates;
  if ((unint64_t)filterPredicates | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](filterPredicates, "isEqual:")) {
      goto LABEL_32;
    }
  }
  char has = (char)self->_has;
  char v7 = *((unsigned char *)v4 + 48);
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_groupingType != *((_DWORD *)v4 + 6)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_32;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 8) == 0) {
      goto LABEL_32;
    }
    if (self->_filteringDisabled)
    {
      if (!*((unsigned char *)v4 + 44)) {
        goto LABEL_32;
      }
    }
    else if (*((unsigned char *)v4 + 44))
    {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 8) != 0)
  {
    goto LABEL_32;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_entityOrder != *((_DWORD *)v4 + 2)) {
      goto LABEL_32;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
    goto LABEL_32;
  }
  staticEntityIdentifiers = self->_staticEntityIdentifiers;
  if ((unint64_t)staticEntityIdentifiers | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](staticEntityIdentifiers, "isEqual:")) {
      goto LABEL_32;
    }
    char has = (char)self->_has;
    char v7 = *((unsigned char *)v4 + 48);
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_staticEntityType != *((_DWORD *)v4 + 10)) {
      goto LABEL_32;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_32;
  }
  BOOL v9 = (v7 & 0x10) == 0;
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) != 0)
    {
      if (self->_includeNonLibraryEntities)
      {
        if (!*((unsigned char *)v4 + 45)) {
          goto LABEL_32;
        }
      }
      else if (*((unsigned char *)v4 + 45))
      {
        goto LABEL_32;
      }
      BOOL v9 = 1;
      goto LABEL_33;
    }
LABEL_32:
    BOOL v9 = 0;
  }
LABEL_33:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v6 = self->_filterPredicates;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = (void *)[*(id *)(*((void *)&v25 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addFilterPredicates:v11];
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v8);
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_groupingType;
    *(unsigned char *)(v5 + 48) |= 2u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_10:
      if ((has & 1) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_10;
  }
  *(unsigned char *)(v5 + 44) = self->_filteringDisabled;
  *(unsigned char *)(v5 + 48) |= 8u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_11:
    *(_DWORD *)(v5 + 8) = self->_entityOrder;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
LABEL_12:
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v13 = self->_staticEntityIdentifiers;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * j), "copyWithZone:", a3, (void)v21);
        [(id)v5 addStaticEntityIdentifiers:v18];
      }
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v15);
  }

  char v19 = (char)self->_has;
  if ((v19 & 4) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_staticEntityType;
    *(unsigned char *)(v5 + 48) |= 4u;
    char v19 = (char)self->_has;
  }
  if ((v19 & 0x10) != 0)
  {
    *(unsigned char *)(v5 + 45) = self->_includeNonLibraryEntities;
    *(unsigned char *)(v5 + 48) |= 0x10u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v14 = a3;
  if ([(MPPMediaQuery *)self filterPredicatesCount])
  {
    [v14 clearFilterPredicates];
    unint64_t v4 = [(MPPMediaQuery *)self filterPredicatesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(MPPMediaQuery *)self filterPredicatesAtIndex:i];
        [v14 addFilterPredicates:v7];
      }
    }
  }
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_7;
    }
LABEL_21:
    *((unsigned char *)v14 + 44) = self->_filteringDisabled;
    *((unsigned char *)v14 + 48) |= 8u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  *((_DWORD *)v14 + 6) = self->_groupingType;
  *((unsigned char *)v14 + 48) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_21;
  }
LABEL_7:
  if (has)
  {
LABEL_8:
    *((_DWORD *)v14 + 2) = self->_entityOrder;
    *((unsigned char *)v14 + 48) |= 1u;
  }
LABEL_9:
  if ([(MPPMediaQuery *)self staticEntityIdentifiersCount])
  {
    [v14 clearStaticEntityIdentifiers];
    unint64_t v9 = [(MPPMediaQuery *)self staticEntityIdentifiersCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(MPPMediaQuery *)self staticEntityIdentifiersAtIndex:j];
        [v14 addStaticEntityIdentifiers:v12];
      }
    }
  }
  char v13 = (char)self->_has;
  if ((v13 & 4) != 0)
  {
    *((_DWORD *)v14 + 10) = self->_staticEntityType;
    *((unsigned char *)v14 + 48) |= 4u;
    char v13 = (char)self->_has;
  }
  if ((v13 & 0x10) != 0)
  {
    *((unsigned char *)v14 + 45) = self->_includeNonLibraryEntities;
    *((unsigned char *)v14 + 48) |= 0x10u;
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  unint64_t v5 = self->_filterPredicates;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_10:
      if ((has & 1) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_10;
  }
  PBDataWriterWriteBOOLField();
  if (*(unsigned char *)&self->_has) {
LABEL_11:
  }
    PBDataWriterWriteInt32Field();
LABEL_12:
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = self->_staticEntityIdentifiers;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }

  char v16 = (char)self->_has;
  if ((v16 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char v16 = (char)self->_has;
  }
  if ((v16 & 0x10) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  id v4 = (int *)MEMORY[0x1E4F940E8];
  unint64_t v5 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v6 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E8]) < *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v8 = (int *)MEMORY[0x1E4F940B8];
    while (!*((unsigned char *)a3 + *v6))
    {
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        uint64_t v12 = *v4;
        unint64_t v13 = *(void *)((char *)a3 + v12);
        if (v13 == -1 || v13 >= *(void *)((char *)a3 + *v5)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v13);
        *(void *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v9 += 7;
        BOOL v15 = v10++ >= 9;
        if (v15)
        {
          unint64_t v11 = 0;
          int v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
      int v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((unsigned char *)a3 + *v6)) {
        unint64_t v11 = 0;
      }
LABEL_14:
      if (v16 || (v11 & 7) == 4) {
        break;
      }
      switch((v11 >> 3))
      {
        case 1u:
          long long v18 = objc_alloc_init(MPPMediaPredicate);
          [(MPPMediaQuery *)self addFilterPredicates:v18];
          if (PBReaderPlaceMark() && MPPMediaPredicateReadFrom(v18, a3)) {
            goto LABEL_47;
          }
          goto LABEL_86;
        case 2u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)&self->_has |= 2u;
          while (2)
          {
            uint64_t v23 = *v4;
            unint64_t v24 = *(void *)((char *)a3 + v23);
            if (v24 == -1 || v24 >= *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v25 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v24);
              *(void *)((char *)a3 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                BOOL v15 = v21++ >= 9;
                if (v15)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_65;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            LODWORD(v22) = 0;
          }
LABEL_65:
          uint64_t v48 = 24;
          goto LABEL_78;
        case 3u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          *(unsigned char *)&self->_has |= 8u;
          while (2)
          {
            uint64_t v29 = *v4;
            unint64_t v30 = *(void *)((char *)a3 + v29);
            if (v30 == -1 || v30 >= *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v31 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v30);
              *(void *)((char *)a3 + v29) = v30 + 1;
              v28 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                BOOL v15 = v27++ >= 9;
                if (v15)
                {
                  uint64_t v28 = 0;
                  goto LABEL_69;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            uint64_t v28 = 0;
          }
LABEL_69:
          BOOL v49 = v28 != 0;
          uint64_t v50 = 44;
          goto LABEL_83;
        case 4u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)&self->_has |= 1u;
          while (2)
          {
            uint64_t v34 = *v4;
            unint64_t v35 = *(void *)((char *)a3 + v34);
            if (v35 == -1 || v35 >= *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v36 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v35);
              *(void *)((char *)a3 + v34) = v35 + 1;
              v22 |= (unint64_t)(v36 & 0x7F) << v32;
              if (v36 < 0)
              {
                v32 += 7;
                BOOL v15 = v33++ >= 9;
                if (v15)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_73;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            LODWORD(v22) = 0;
          }
LABEL_73:
          uint64_t v48 = 8;
          goto LABEL_78;
        case 5u:
          long long v18 = (MPPMediaPredicate *)objc_alloc_init(MEMORY[0x1E4F79A48]);
          [(MPPMediaQuery *)self addStaticEntityIdentifiers:v18];
          if (!PBReaderPlaceMark() || (MIPMultiverseIdentifierReadFrom() & 1) == 0)
          {
LABEL_86:

            LOBYTE(v19) = 0;
            return v19;
          }
LABEL_47:
          PBReaderRecallMark();

LABEL_84:
          if (*(void *)((char *)a3 + *v4) >= *(void *)((char *)a3 + *v5)) {
            goto LABEL_85;
          }
          break;
        case 6u:
          char v37 = 0;
          unsigned int v38 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)&self->_has |= 4u;
          while (2)
          {
            uint64_t v39 = *v4;
            unint64_t v40 = *(void *)((char *)a3 + v39);
            if (v40 == -1 || v40 >= *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v41 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v40);
              *(void *)((char *)a3 + v39) = v40 + 1;
              v22 |= (unint64_t)(v41 & 0x7F) << v37;
              if (v41 < 0)
              {
                v37 += 7;
                BOOL v15 = v38++ >= 9;
                if (v15)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_77;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            LODWORD(v22) = 0;
          }
LABEL_77:
          uint64_t v48 = 40;
LABEL_78:
          *(_DWORD *)((char *)&self->super.super.isa + v48) = v22;
          goto LABEL_84;
        case 7u:
          char v42 = 0;
          unsigned int v43 = 0;
          uint64_t v44 = 0;
          *(unsigned char *)&self->_has |= 0x10u;
          while (2)
          {
            uint64_t v45 = *v4;
            unint64_t v46 = *(void *)((char *)a3 + v45);
            if (v46 == -1 || v46 >= *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v47 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v46);
              *(void *)((char *)a3 + v45) = v46 + 1;
              v44 |= (unint64_t)(v47 & 0x7F) << v42;
              if (v47 < 0)
              {
                v42 += 7;
                BOOL v15 = v43++ >= 9;
                if (v15)
                {
                  uint64_t v44 = 0;
                  goto LABEL_82;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            uint64_t v44 = 0;
          }
LABEL_82:
          BOOL v49 = v44 != 0;
          uint64_t v50 = 45;
LABEL_83:
          *((unsigned char *)&self->super.super.isa + v50) = v49;
          goto LABEL_84;
        default:
          int v19 = PBReaderSkipValueWithTag();
          if (!v19) {
            return v19;
          }
          goto LABEL_84;
      }
    }
  }
LABEL_85:
  LOBYTE(v19) = *((unsigned char *)a3 + *v6) == 0;
  return v19;
}

- (id)dictionaryRepresentation
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_filterPredicates count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_filterPredicates, "count"));
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    unint64_t v5 = self->_filterPredicates;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v34 != v8) {
            objc_enumerationMutation(v5);
          }
          unsigned int v10 = [*(id *)(*((void *)&v33 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"filterPredicates"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    int groupingType = self->_groupingType;
    unint64_t v13 = @"Title";
    switch(groupingType)
    {
      case 1:
        break;
      case 2:
        unint64_t v13 = @"Album";
        break;
      case 3:
        unint64_t v13 = @"Artist";
        break;
      case 4:
        unint64_t v13 = @"AlbumArtist";
        break;
      case 5:
        unint64_t v13 = @"Composer";
        break;
      case 6:
        unint64_t v13 = @"Genre";
        break;
      case 7:
        unint64_t v13 = @"Playlist";
        break;
      case 8:
        unint64_t v13 = @"PodcastTitle";
        break;
      default:
        switch(groupingType)
        {
          case 'd':
            unint64_t v13 = @"SeriesName";
            break;
          case 'e':
            unint64_t v13 = @"SeasonName";
            break;
          case 'f':
            unint64_t v13 = @"AudioBookTitle";
            break;
          case 'g':
            unint64_t v13 = @"AlbumPersistentID";
            break;
          case 'h':
            unint64_t v13 = @"AlbumByArtist";
            break;
          default:
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_groupingType);
            unint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            break;
        }
        break;
    }
    [v3 setObject:v13 forKey:@"groupingType"];

    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    char v14 = [NSNumber numberWithBool:self->_filteringDisabled];
    [v3 setObject:v14 forKey:@"filteringDisabled"];

    char has = (char)self->_has;
  }
  if (has)
  {
    unsigned int v15 = self->_entityOrder - 1;
    if (v15 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_entityOrder);
      int v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int v16 = off_1E57F3EA8[v15];
    }
    [v3 setObject:v16 forKey:@"entityOrder"];
  }
  if ([(NSMutableArray *)self->_staticEntityIdentifiers count])
  {
    long long v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_staticEntityIdentifiers, "count"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v18 = self->_staticEntityIdentifiers;
    uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v30 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = [*(id *)(*((void *)&v29 + 1) + 8 * j) dictionaryRepresentation];
          [v17 addObject:v23];
        }
        uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v20);
    }

    [v3 setObject:v17 forKey:@"staticEntityIdentifiers"];
  }
  char v24 = (char)self->_has;
  if ((v24 & 4) != 0)
  {
    int staticEntityType = self->_staticEntityType;
    if (staticEntityType == 1)
    {
      char v26 = @"Item";
    }
    else if (staticEntityType == 2)
    {
      char v26 = @"Collection";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_staticEntityType);
      char v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v26 forKey:@"staticEntityType"];

    char v24 = (char)self->_has;
  }
  if ((v24 & 0x10) != 0)
  {
    unsigned int v27 = [NSNumber numberWithBool:self->_includeNonLibraryEntities];
    [v3 setObject:v27 forKey:@"includeNonLibraryEntities"];
  }

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MPPMediaQuery;
  id v4 = [(MPPMediaQuery *)&v8 description];
  unint64_t v5 = [(MPPMediaQuery *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasIncludeNonLibraryEntities
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasIncludeNonLibraryEntities:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setIncludeNonLibraryEntities:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_includeNonLibraryEntities = a3;
}

- (int)StringAsStaticEntityType:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"Item"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"Collection"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)staticEntityTypeAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"Item";
  }
  else if (a3 == 2)
  {
    int v4 = @"Collection";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (BOOL)hasStaticEntityType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasStaticEntityType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setStaticEntityType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int staticEntityType = a3;
}

- (int)staticEntityType
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_staticEntityType;
  }
  else {
    return 1;
  }
}

- (id)staticEntityIdentifiersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_staticEntityIdentifiers objectAtIndex:a3];
}

- (unint64_t)staticEntityIdentifiersCount
{
  return [(NSMutableArray *)self->_staticEntityIdentifiers count];
}

- (void)addStaticEntityIdentifiers:(id)a3
{
  id v4 = a3;
  staticEntityIdentifiers = self->_staticEntityIdentifiers;
  id v8 = v4;
  if (!staticEntityIdentifiers)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_staticEntityIdentifiers;
    self->_staticEntityIdentifiers = v6;

    id v4 = v8;
    staticEntityIdentifiers = self->_staticEntityIdentifiers;
  }
  [(NSMutableArray *)staticEntityIdentifiers addObject:v4];
}

- (void)clearStaticEntityIdentifiers
{
}

- (int)StringAsEntityOrder:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Physical"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Sorted"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)entityOrderAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E57F3EA8[a3 - 1];
  }

  return v3;
}

- (BOOL)hasEntityOrder
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasEntityOrder:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setEntityOrder:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_entityOrder = a3;
}

- (int)entityOrder
{
  if (*(unsigned char *)&self->_has) {
    return self->_entityOrder;
  }
  else {
    return 1;
  }
}

- (BOOL)hasFilteringDisabled
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasFilteringDisabled:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setFilteringDisabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_filteringDisabled = a3;
}

- (int)StringAsGroupingType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Title"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Album"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Artist"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"AlbumArtist"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Composer"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"Genre"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"Playlist"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"PodcastTitle"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"SeriesName"])
  {
    int v4 = 100;
  }
  else if ([v3 isEqualToString:@"SeasonName"])
  {
    int v4 = 101;
  }
  else if ([v3 isEqualToString:@"AudioBookTitle"])
  {
    int v4 = 102;
  }
  else if ([v3 isEqualToString:@"AlbumPersistentID"])
  {
    int v4 = 103;
  }
  else if ([v3 isEqualToString:@"AlbumByArtist"])
  {
    int v4 = 104;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)groupingTypeAsString:(int)a3
{
  int v4 = @"Title";
  switch(a3)
  {
    case 1:
LABEL_28:
      break;
    case 2:
      int v4 = @"Album";
      break;
    case 3:
      int v4 = @"Artist";
      break;
    case 4:
      int v4 = @"AlbumArtist";
      break;
    case 5:
      int v4 = @"Composer";
      break;
    case 6:
      int v4 = @"Genre";
      break;
    case 7:
      int v4 = @"Playlist";
      break;
    case 8:
      int v4 = @"PodcastTitle";
      break;
    default:
      switch(a3)
      {
        case 'd':
          int v4 = @"SeriesName";
          break;
        case 'e':
          int v4 = @"SeasonName";
          break;
        case 'f':
          int v4 = @"AudioBookTitle";
          break;
        case 'g':
          int v4 = @"AlbumPersistentID";
          break;
        case 'h':
          int v4 = @"AlbumByArtist";
          break;
        default:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
          int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_28;
      }
      break;
  }
  return v4;
}

- (BOOL)hasGroupingType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasGroupingType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setGroupingType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int groupingType = a3;
}

- (int)groupingType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_groupingType;
  }
  else {
    return 1;
  }
}

- (id)filterPredicatesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_filterPredicates objectAtIndex:a3];
}

- (unint64_t)filterPredicatesCount
{
  return [(NSMutableArray *)self->_filterPredicates count];
}

- (void)addFilterPredicates:(id)a3
{
  id v4 = a3;
  filterPredicates = self->_filterPredicates;
  id v8 = v4;
  if (!filterPredicates)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_filterPredicates;
    self->_filterPredicates = v6;

    id v4 = v8;
    filterPredicates = self->_filterPredicates;
  }
  [(NSMutableArray *)filterPredicates addObject:v4];
}

- (void)clearFilterPredicates
{
}

+ (Class)staticEntityIdentifiersType
{
  return (Class)objc_opt_class();
}

+ (Class)filterPredicatesType
{
  return (Class)objc_opt_class();
}

@end