@interface CKDPQuery
+ (Class)filtersType;
+ (Class)sortsType;
+ (Class)typesType;
- (BOOL)distinct;
- (BOOL)hasDistinct;
- (BOOL)hasQueryOperator;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)filters;
- (NSMutableArray)sorts;
- (NSMutableArray)types;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)filtersAtIndex:(unint64_t)a3;
- (id)queryOperatorAsString:(int)a3;
- (id)sortsAtIndex:(unint64_t)a3;
- (id)typesAtIndex:(unint64_t)a3;
- (int)StringAsQueryOperator:(id)a3;
- (int)queryOperator;
- (unint64_t)filtersCount;
- (unint64_t)hash;
- (unint64_t)sortsCount;
- (unint64_t)typesCount;
- (void)addFilters:(id)a3;
- (void)addSorts:(id)a3;
- (void)addTypes:(id)a3;
- (void)clearFilters;
- (void)clearSorts;
- (void)clearTypes;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDistinct:(BOOL)a3;
- (void)setFilters:(id)a3;
- (void)setHasDistinct:(BOOL)a3;
- (void)setHasQueryOperator:(BOOL)a3;
- (void)setQueryOperator:(int)a3;
- (void)setSorts:(id)a3;
- (void)setTypes:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPQuery

- (void)clearTypes
{
  objc_msgSend_removeAllObjects(self->_types, a2, v2);
}

- (void)addTypes:(id)a3
{
  v4 = (const char *)a3;
  types = self->_types;
  v8 = (char *)v4;
  if (!types)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_types;
    self->_types = v6;

    v4 = v8;
    types = self->_types;
  }
  objc_msgSend_addObject_(types, v4, (uint64_t)v4);
}

- (unint64_t)typesCount
{
  return objc_msgSend_count(self->_types, a2, v2);
}

- (id)typesAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_types, a2, a3);
}

+ (Class)typesType
{
  return (Class)objc_opt_class();
}

- (void)clearFilters
{
  objc_msgSend_removeAllObjects(self->_filters, a2, v2);
}

- (void)addFilters:(id)a3
{
  v4 = (const char *)a3;
  filters = self->_filters;
  v8 = (char *)v4;
  if (!filters)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_filters;
    self->_filters = v6;

    v4 = v8;
    filters = self->_filters;
  }
  objc_msgSend_addObject_(filters, v4, (uint64_t)v4);
}

- (unint64_t)filtersCount
{
  return objc_msgSend_count(self->_filters, a2, v2);
}

- (id)filtersAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_filters, a2, a3);
}

+ (Class)filtersType
{
  return (Class)objc_opt_class();
}

- (void)clearSorts
{
  objc_msgSend_removeAllObjects(self->_sorts, a2, v2);
}

- (void)addSorts:(id)a3
{
  v4 = (const char *)a3;
  sorts = self->_sorts;
  v8 = (char *)v4;
  if (!sorts)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_sorts;
    self->_sorts = v6;

    v4 = v8;
    sorts = self->_sorts;
  }
  objc_msgSend_addObject_(sorts, v4, (uint64_t)v4);
}

- (unint64_t)sortsCount
{
  return objc_msgSend_count(self->_sorts, a2, v2);
}

- (id)sortsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_sorts, a2, a3);
}

+ (Class)sortsType
{
  return (Class)objc_opt_class();
}

- (void)setDistinct:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_distinct = a3;
}

- (void)setHasDistinct:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDistinct
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)queryOperator
{
  if (*(unsigned char *)&self->_has) {
    return self->_queryOperator;
  }
  else {
    return 1;
  }
}

- (void)setQueryOperator:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_queryOperator = a3;
}

- (void)setHasQueryOperator:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasQueryOperator
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)queryOperatorAsString:(int)a3
{
  if (a3 == 1)
  {
    v4 = @"AND";
  }
  else if (a3 == 2)
  {
    v4 = @"OR";
  }
  else
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsQueryOperator:(id)a3
{
  id v3 = a3;
  int v6 = 1;
  if ((objc_msgSend_isEqualToString_(v3, v4, @"AND") & 1) == 0)
  {
    if (objc_msgSend_isEqualToString_(v3, v5, @"OR")) {
      int v6 = 2;
    }
    else {
      int v6 = 1;
    }
  }

  return v6;
}

- (id)description
{
  id v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPQuery;
  v4 = [(CKDPQuery *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  if (objc_msgSend_count(self->_types, v5, v6))
  {
    id v9 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v12 = objc_msgSend_count(self->_types, v10, v11);
    v14 = objc_msgSend_initWithCapacity_(v9, v13, v12);
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    v15 = self->_types;
    uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v78, v84, 16);
    if (v17)
    {
      uint64_t v20 = v17;
      uint64_t v21 = *(void *)v79;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v79 != v21) {
            objc_enumerationMutation(v15);
          }
          v23 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v78 + 1) + 8 * i), v18, v19);
          objc_msgSend_addObject_(v14, v24, (uint64_t)v23);
        }
        uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v78, v84, 16);
      }
      while (v20);
    }

    objc_msgSend_setObject_forKey_(v4, v25, (uint64_t)v14, @"types");
  }
  if (objc_msgSend_count(self->_filters, v7, v8))
  {
    id v28 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v31 = objc_msgSend_count(self->_filters, v29, v30);
    v33 = objc_msgSend_initWithCapacity_(v28, v32, v31);
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    v34 = self->_filters;
    uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v74, v83, 16);
    if (v36)
    {
      uint64_t v39 = v36;
      uint64_t v40 = *(void *)v75;
      do
      {
        for (uint64_t j = 0; j != v39; ++j)
        {
          if (*(void *)v75 != v40) {
            objc_enumerationMutation(v34);
          }
          v42 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v74 + 1) + 8 * j), v37, v38);
          objc_msgSend_addObject_(v33, v43, (uint64_t)v42);
        }
        uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v37, (uint64_t)&v74, v83, 16);
      }
      while (v39);
    }

    objc_msgSend_setObject_forKey_(v4, v44, (uint64_t)v33, @"filters");
  }
  if (objc_msgSend_count(self->_sorts, v26, v27))
  {
    id v46 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v49 = objc_msgSend_count(self->_sorts, v47, v48);
    v51 = objc_msgSend_initWithCapacity_(v46, v50, v49);
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    v52 = self->_sorts;
    uint64_t v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v52, v53, (uint64_t)&v70, v82, 16);
    if (v54)
    {
      uint64_t v57 = v54;
      uint64_t v58 = *(void *)v71;
      do
      {
        for (uint64_t k = 0; k != v57; ++k)
        {
          if (*(void *)v71 != v58) {
            objc_enumerationMutation(v52);
          }
          v60 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v70 + 1) + 8 * k), v55, v56);
          objc_msgSend_addObject_(v51, v61, (uint64_t)v60);
        }
        uint64_t v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(v52, v55, (uint64_t)&v70, v82, 16);
      }
      while (v57);
    }

    objc_msgSend_setObject_forKey_(v4, v62, (uint64_t)v51, @"sorts");
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v64 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v45, self->_distinct);
    objc_msgSend_setObject_forKey_(v4, v65, (uint64_t)v64, @"distinct");

    char has = (char)self->_has;
  }
  if (has)
  {
    int queryOperator = self->_queryOperator;
    if (queryOperator == 1)
    {
      v67 = @"AND";
      objc_msgSend_setObject_forKey_(v4, v45, @"AND", @"queryOperator");
    }
    else if (queryOperator == 2)
    {
      v67 = @"OR";
      objc_msgSend_setObject_forKey_(v4, v45, @"OR", @"queryOperator");
    }
    else
    {
      objc_msgSend_stringWithFormat_(NSString, v45, @"(unknown: %i)", self->_queryOperator);
      v67 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v4, v68, (uint64_t)v67, @"queryOperator");
    }
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4E929BC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v5 = self->_types;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v35, v41, 16);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v35, v41, 16);
    }
    while (v8);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v12 = self->_filters;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v31, v40, 16);
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v32 != v16) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v18, (uint64_t)&v31, v40, 16);
    }
    while (v15);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v19 = self->_sorts;
  uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v27, v39, 16);
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v28;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v28 != v23) {
          objc_enumerationMutation(v19);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v25, (uint64_t)&v27, v39, 16);
    }
    while (v22);
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v35 = a3;
  if (objc_msgSend_typesCount(self, v4, v5))
  {
    objc_msgSend_clearTypes(v35, v6, v7);
    uint64_t v10 = objc_msgSend_typesCount(self, v8, v9);
    if (v10)
    {
      uint64_t v11 = v10;
      for (uint64_t i = 0; i != v11; ++i)
      {
        v13 = objc_msgSend_typesAtIndex_(self, v6, i);
        objc_msgSend_addTypes_(v35, v14, (uint64_t)v13);
      }
    }
  }
  if (objc_msgSend_filtersCount(self, v6, v7))
  {
    objc_msgSend_clearFilters(v35, v15, v16);
    uint64_t v19 = objc_msgSend_filtersCount(self, v17, v18);
    if (v19)
    {
      uint64_t v20 = v19;
      for (uint64_t j = 0; j != v20; ++j)
      {
        uint64_t v22 = objc_msgSend_filtersAtIndex_(self, v15, j);
        objc_msgSend_addFilters_(v35, v23, (uint64_t)v22);
      }
    }
  }
  if (objc_msgSend_sortsCount(self, v15, v16))
  {
    objc_msgSend_clearSorts(v35, v24, v25);
    uint64_t v28 = objc_msgSend_sortsCount(self, v26, v27);
    if (v28)
    {
      uint64_t v30 = v28;
      for (uint64_t k = 0; k != v30; ++k)
      {
        long long v32 = objc_msgSend_sortsAtIndex_(self, v29, k);
        objc_msgSend_addSorts_(v35, v33, (uint64_t)v32);
      }
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((unsigned char *)v35 + 40) = self->_distinct;
    *((unsigned char *)v35 + 44) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v35 + 4) = self->_queryOperator;
    *((unsigned char *)v35 + 44) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v11 = self->_types;
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v48, v54, 16);
  if (v13)
  {
    uint64_t v15 = v13;
    uint64_t v16 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v49 != v16) {
          objc_enumerationMutation(v11);
        }
        uint64_t v18 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v48 + 1) + 8 * i), v14, (uint64_t)a3);
        objc_msgSend_addTypes_((void *)v10, v19, (uint64_t)v18);
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v48, v54, 16);
    }
    while (v15);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v20 = self->_filters;
  uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v44, v53, 16);
  if (v22)
  {
    uint64_t v24 = v22;
    uint64_t v25 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v45 != v25) {
          objc_enumerationMutation(v20);
        }
        uint64_t v27 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v44 + 1) + 8 * j), v23, (uint64_t)a3);
        objc_msgSend_addFilters_((void *)v10, v28, (uint64_t)v27);
      }
      uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v44, v53, 16);
    }
    while (v24);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v29 = self->_sorts;
  uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v40, v52, 16);
  if (v31)
  {
    uint64_t v33 = v31;
    uint64_t v34 = *(void *)v41;
    do
    {
      for (uint64_t k = 0; k != v33; ++k)
      {
        if (*(void *)v41 != v34) {
          objc_enumerationMutation(v29);
        }
        long long v36 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v40 + 1) + 8 * k), v32, (uint64_t)a3, (void)v40);
        objc_msgSend_addSorts_((void *)v10, v37, (uint64_t)v36);
      }
      uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v32, (uint64_t)&v40, v52, 16);
    }
    while (v33);
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v10 + 40) = self->_distinct;
    *(unsigned char *)(v10 + 44) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v10 + 16) = self->_queryOperator;
    *(unsigned char *)(v10 + 44) |= 1u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_20;
  }
  types = self->_types;
  uint64_t v9 = v4[4];
  if ((unint64_t)types | v9)
  {
    if (!objc_msgSend_isEqual_(types, v7, v9)) {
      goto LABEL_20;
    }
  }
  filters = self->_filters;
  uint64_t v11 = v4[1];
  if ((unint64_t)filters | v11)
  {
    if (!objc_msgSend_isEqual_(filters, v7, v11)) {
      goto LABEL_20;
    }
  }
  sorts = self->_sorts;
  uint64_t v13 = v4[3];
  if ((unint64_t)sorts | v13)
  {
    if (!objc_msgSend_isEqual_(sorts, v7, v13)) {
      goto LABEL_20;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) != 0)
    {
      if (self->_distinct)
      {
        if (!*((unsigned char *)v4 + 40)) {
          goto LABEL_20;
        }
        goto LABEL_16;
      }
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_16;
      }
    }
LABEL_20:
    BOOL v14 = 0;
    goto LABEL_21;
  }
  if ((*((unsigned char *)v4 + 44) & 2) != 0) {
    goto LABEL_20;
  }
LABEL_16:
  BOOL v14 = (*((unsigned char *)v4 + 44) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_queryOperator != *((_DWORD *)v4 + 4)) {
      goto LABEL_20;
    }
    BOOL v14 = 1;
  }
LABEL_21:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_types, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_filters, v5, v6);
  uint64_t v10 = objc_msgSend_hash(self->_sorts, v8, v9);
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v11 = 2654435761 * self->_distinct;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v12 = 0;
    return v7 ^ v4 ^ v10 ^ v11 ^ v12;
  }
  uint64_t v11 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v12 = 2654435761 * self->_queryOperator;
  return v7 ^ v4 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v5 = *((id *)v4 + 4);
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v35, v41, 16);
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v36 != v10) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend_addTypes_(self, v8, *(void *)(*((void *)&v35 + 1) + 8 * i));
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v35, v41, 16);
    }
    while (v9);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v12 = *((id *)v4 + 1);
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v31, v40, 16);
  if (v14)
  {
    uint64_t v16 = v14;
    uint64_t v17 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v32 != v17) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend_addFilters_(self, v15, *(void *)(*((void *)&v31 + 1) + 8 * j));
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v31, v40, 16);
    }
    while (v16);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v19 = *((id *)v4 + 3);
  uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v27, v39, 16);
  if (v21)
  {
    uint64_t v23 = v21;
    uint64_t v24 = *(void *)v28;
    do
    {
      for (uint64_t k = 0; k != v23; ++k)
      {
        if (*(void *)v28 != v24) {
          objc_enumerationMutation(v19);
        }
        objc_msgSend_addSorts_(self, v22, *(void *)(*((void *)&v27 + 1) + 8 * k), (void)v27);
      }
      uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v27, v39, 16);
    }
    while (v23);
  }

  char v26 = *((unsigned char *)v4 + 44);
  if ((v26 & 2) != 0)
  {
    self->_distinct = *((unsigned char *)v4 + 40);
    *(unsigned char *)&self->_has |= 2u;
    char v26 = *((unsigned char *)v4 + 44);
  }
  if (v26)
  {
    self->_int queryOperator = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSMutableArray)types
{
  return self->_types;
}

- (void)setTypes:(id)a3
{
}

- (NSMutableArray)filters
{
  return self->_filters;
}

- (void)setFilters:(id)a3
{
}

- (NSMutableArray)sorts
{
  return self->_sorts;
}

- (void)setSorts:(id)a3
{
}

- (BOOL)distinct
{
  return self->_distinct;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_types, 0);
  objc_storeStrong((id *)&self->_sorts, 0);
  objc_storeStrong((id *)&self->_filters, 0);
}

@end