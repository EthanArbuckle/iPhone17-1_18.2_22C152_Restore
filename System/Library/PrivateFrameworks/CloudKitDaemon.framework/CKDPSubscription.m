@interface CKDPSubscription
+ (Class)filtersType;
+ (Class)recordTypesType;
- (BOOL)fireOnce;
- (BOOL)hasEvaluationType;
- (BOOL)hasFireOnce;
- (BOOL)hasIdentifier;
- (BOOL)hasNotification;
- (BOOL)hasOwner;
- (BOOL)hasZoneIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPIdentifier)identifier;
- (CKDPRecordZoneIdentifier)zoneIdentifier;
- (CKDPSubscriptionNotification)notification;
- (NSMutableArray)filters;
- (NSMutableArray)recordTypes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)evaluationTypeAsString:(int)a3;
- (id)filtersAtIndex:(unint64_t)a3;
- (id)mutationTriggersAsString:(int)a3;
- (id)ownerAsString:(int)a3;
- (id)recordTypesAtIndex:(unint64_t)a3;
- (int)StringAsEvaluationType:(id)a3;
- (int)StringAsMutationTriggers:(id)a3;
- (int)StringAsOwner:(id)a3;
- (int)evaluationType;
- (int)mutationTriggers;
- (int)mutationTriggersAtIndex:(unint64_t)a3;
- (int)owner;
- (unint64_t)filtersCount;
- (unint64_t)hash;
- (unint64_t)mutationTriggersCount;
- (unint64_t)recordTypesCount;
- (void)addFilters:(id)a3;
- (void)addMutationTriggers:(int)a3;
- (void)addRecordTypes:(id)a3;
- (void)clearFilters;
- (void)clearMutationTriggers;
- (void)clearRecordTypes;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setEvaluationType:(int)a3;
- (void)setFilters:(id)a3;
- (void)setFireOnce:(BOOL)a3;
- (void)setHasEvaluationType:(BOOL)a3;
- (void)setHasFireOnce:(BOOL)a3;
- (void)setHasOwner:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setMutationTriggers:(int *)a3 count:(unint64_t)a4;
- (void)setNotification:(id)a3;
- (void)setOwner:(int)a3;
- (void)setRecordTypes:(id)a3;
- (void)setZoneIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPSubscription

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)CKDPSubscription;
  [(CKDPSubscription *)&v3 dealloc];
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (int)evaluationType
{
  if (*(unsigned char *)&self->_has) {
    return self->_evaluationType;
  }
  else {
    return 1;
  }
}

- (void)setEvaluationType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_evaluationType = a3;
}

- (void)setHasEvaluationType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEvaluationType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)evaluationTypeAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    objc_super v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v3 = off_1E64F68C0[a3 - 1];
  }
  return v3;
}

- (int)StringAsEvaluationType:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"trigger"))
  {
    int v6 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v5, @"sync"))
  {
    int v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, @"metasync"))
  {
    int v6 = 3;
  }
  else
  {
    int v6 = 1;
  }

  return v6;
}

- (int)owner
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_owner;
  }
  else {
    return 1;
  }
}

- (void)setOwner:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_owner = a3;
}

- (void)setHasOwner:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOwner
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)ownerAsString:(int)a3
{
  if (a3 == 1)
  {
    v4 = @"user";
  }
  else if (a3 == 2)
  {
    v4 = @"device";
  }
  else
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsOwner:(id)a3
{
  id v3 = a3;
  int v6 = 1;
  if ((objc_msgSend_isEqualToString_(v3, v4, @"user") & 1) == 0)
  {
    if (objc_msgSend_isEqualToString_(v3, v5, @"device")) {
      int v6 = 2;
    }
    else {
      int v6 = 1;
    }
  }

  return v6;
}

- (unint64_t)mutationTriggersCount
{
  return self->_mutationTriggers.count;
}

- (int)mutationTriggers
{
  return self->_mutationTriggers.list;
}

- (void)clearMutationTriggers
{
}

- (void)addMutationTriggers:(int)a3
{
}

- (int)mutationTriggersAtIndex:(unint64_t)a3
{
  p_mutationTriggers = &self->_mutationTriggers;
  unint64_t count = self->_mutationTriggers.count;
  if (count <= a3)
  {
    int v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend_stringWithFormat_(NSString, a2, @"idx (%lu) is out of range (%lu)", a3, count);
    v10 = objc_msgSend_exceptionWithName_reason_userInfo_(v6, v9, v7, v8, 0);
    objc_msgSend_raise(v10, v11, v12);
  }
  return p_mutationTriggers->list[a3];
}

- (void)setMutationTriggers:(int *)a3 count:(unint64_t)a4
{
}

- (id)mutationTriggersAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E64F68D8[a3 - 1];
  }
  return v3;
}

- (int)StringAsMutationTriggers:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"insert"))
  {
    int v6 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v5, @"update"))
  {
    int v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, @"remove"))
  {
    int v6 = 3;
  }
  else
  {
    int v6 = 1;
  }

  return v6;
}

- (BOOL)hasNotification
{
  return self->_notification != 0;
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
    int v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_filters;
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

- (void)clearRecordTypes
{
  objc_msgSend_removeAllObjects(self->_recordTypes, a2, v2);
}

- (void)addRecordTypes:(id)a3
{
  v4 = (const char *)a3;
  recordTypes = self->_recordTypes;
  v8 = (char *)v4;
  if (!recordTypes)
  {
    int v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_recordTypes;
    self->_recordTypes = v6;

    v4 = v8;
    recordTypes = self->_recordTypes;
  }
  objc_msgSend_addObject_(recordTypes, v4, (uint64_t)v4);
}

- (unint64_t)recordTypesCount
{
  return objc_msgSend_count(self->_recordTypes, a2, v2);
}

- (id)recordTypesAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_recordTypes, a2, a3);
}

+ (Class)recordTypesType
{
  return (Class)objc_opt_class();
}

- (void)setFireOnce:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_fireOnce = a3;
}

- (void)setHasFireOnce:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasFireOnce
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasZoneIdentifier
{
  return self->_zoneIdentifier != 0;
}

- (id)description
{
  char v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPSubscription;
  v4 = [(CKDPSubscription *)&v11 description];
  uint64_t v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  identifier = self->_identifier;
  if (identifier)
  {
    v8 = objc_msgSend_dictionaryRepresentation(identifier, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"identifier");
  }
  char has = (char)self->_has;
  if (has)
  {
    unsigned int v11 = self->_evaluationType - 1;
    if (v11 >= 3)
    {
      objc_msgSend_stringWithFormat_(NSString, v4, @"(unknown: %i)", self->_evaluationType);
      uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v12 = off_1E64F68C0[v11];
    }
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)v12, @"evaluationType");

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    int owner = self->_owner;
    if (owner == 1)
    {
      v14 = @"user";
      objc_msgSend_setObject_forKey_(v6, v4, @"user", @"owner");
    }
    else if (owner == 2)
    {
      v14 = @"device";
      objc_msgSend_setObject_forKey_(v6, v4, @"device", @"owner");
    }
    else
    {
      objc_msgSend_stringWithFormat_(NSString, v4, @"(unknown: %i)", self->_owner);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v6, v15, (uint64_t)v14, @"owner");
    }
  }
  p_mutationTriggers = &self->_mutationTriggers;
  unint64_t count = self->_mutationTriggers.count;
  if (count)
  {
    v19 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v4, count);
    if (self->_mutationTriggers.count)
    {
      unint64_t v20 = 0;
      do
      {
        unsigned int v21 = p_mutationTriggers->list[v20] - 1;
        if (v21 >= 3)
        {
          objc_msgSend_stringWithFormat_(NSString, v18, @"(unknown: %i)", p_mutationTriggers->list[v20]);
          v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v22 = off_1E64F68D8[v21];
        }
        objc_msgSend_addObject_(v19, v18, (uint64_t)v22);

        ++v20;
      }
      while (v20 < self->_mutationTriggers.count);
    }
    objc_msgSend_setObject_forKey_(v6, v18, (uint64_t)v19, @"mutationTriggers");
  }
  notification = self->_notification;
  if (notification)
  {
    v24 = objc_msgSend_dictionaryRepresentation(notification, v4, count);
    objc_msgSend_setObject_forKey_(v6, v25, (uint64_t)v24, @"notification");
  }
  if (objc_msgSend_count(self->_filters, v4, count))
  {
    id v28 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v31 = objc_msgSend_count(self->_filters, v29, v30);
    v33 = objc_msgSend_initWithCapacity_(v28, v32, v31);
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    v34 = self->_filters;
    uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v74, v79, 16);
    if (v36)
    {
      uint64_t v39 = v36;
      uint64_t v40 = *(void *)v75;
      do
      {
        for (uint64_t i = 0; i != v39; ++i)
        {
          if (*(void *)v75 != v40) {
            objc_enumerationMutation(v34);
          }
          v42 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v74 + 1) + 8 * i), v37, v38);
          objc_msgSend_addObject_(v33, v43, (uint64_t)v42);
        }
        uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v37, (uint64_t)&v74, v79, 16);
      }
      while (v39);
    }

    objc_msgSend_setObject_forKey_(v6, v44, (uint64_t)v33, @"filters");
  }
  if (objc_msgSend_count(self->_recordTypes, v26, v27))
  {
    id v47 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v50 = objc_msgSend_count(self->_recordTypes, v48, v49);
    v52 = objc_msgSend_initWithCapacity_(v47, v51, v50);
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    v53 = self->_recordTypes;
    uint64_t v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v54, (uint64_t)&v70, v78, 16);
    if (v55)
    {
      uint64_t v58 = v55;
      uint64_t v59 = *(void *)v71;
      do
      {
        for (uint64_t j = 0; j != v58; ++j)
        {
          if (*(void *)v71 != v59) {
            objc_enumerationMutation(v53);
          }
          v61 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v70 + 1) + 8 * j), v56, v57);
          objc_msgSend_addObject_(v52, v62, (uint64_t)v61);
        }
        uint64_t v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v56, (uint64_t)&v70, v78, 16);
      }
      while (v58);
    }

    objc_msgSend_setObject_forKey_(v6, v63, (uint64_t)v52, @"recordTypes");
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v64 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v45, self->_fireOnce);
    objc_msgSend_setObject_forKey_(v6, v65, (uint64_t)v64, @"fireOnce");
  }
  zoneIdentifier = self->_zoneIdentifier;
  if (zoneIdentifier)
  {
    v67 = objc_msgSend_dictionaryRepresentation(zoneIdentifier, v45, v46);
    objc_msgSend_setObject_forKey_(v6, v68, (uint64_t)v67, @"zoneIdentifier");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4F3D120((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_identifier) {
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_mutationTriggers.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v6;
    }
    while (v6 < self->_mutationTriggers.count);
  }
  if (self->_notification) {
    PBDataWriterWriteSubmessage();
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v7 = self->_filters;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v25, v30, 16);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v13, (uint64_t)&v25, v30, 16);
    }
    while (v10);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v14 = self->_recordTypes;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v21, v29, 16);
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v14);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v20, (uint64_t)&v21, v29, 16);
    }
    while (v17);
  }

  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_zoneIdentifier) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  identifier = self->_identifier;
  uint64_t v38 = v4;
  if (identifier)
  {
    objc_msgSend_setIdentifier_(v4, v5, (uint64_t)identifier);
    id v4 = v38;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v4 + 8) = self->_evaluationType;
    v4[92] |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 16) = self->_owner;
    v4[92] |= 2u;
  }
  if (objc_msgSend_mutationTriggersCount(self, v5, (uint64_t)identifier))
  {
    objc_msgSend_clearMutationTriggers(v38, v8, v9);
    uint64_t v12 = objc_msgSend_mutationTriggersCount(self, v10, v11);
    if (v12)
    {
      uint64_t v13 = v12;
      for (uint64_t i = 0; i != v13; ++i)
      {
        uint64_t v15 = objc_msgSend_mutationTriggersAtIndex_(self, v8, i);
        objc_msgSend_addMutationTriggers_(v38, v16, v15);
      }
    }
  }
  notification = self->_notification;
  if (notification) {
    objc_msgSend_setNotification_(v38, v8, (uint64_t)notification);
  }
  if (objc_msgSend_filtersCount(self, v8, (uint64_t)notification))
  {
    objc_msgSend_clearFilters(v38, v18, v19);
    uint64_t v22 = objc_msgSend_filtersCount(self, v20, v21);
    if (v22)
    {
      uint64_t v23 = v22;
      for (uint64_t j = 0; j != v23; ++j)
      {
        long long v25 = objc_msgSend_filtersAtIndex_(self, v18, j);
        objc_msgSend_addFilters_(v38, v26, (uint64_t)v25);
      }
    }
  }
  if (objc_msgSend_recordTypesCount(self, v18, v19))
  {
    objc_msgSend_clearRecordTypes(v38, v27, v28);
    uint64_t v31 = objc_msgSend_recordTypesCount(self, v29, v30);
    if (v31)
    {
      uint64_t v32 = v31;
      for (uint64_t k = 0; k != v32; ++k)
      {
        v34 = objc_msgSend_recordTypesAtIndex_(self, v27, k);
        objc_msgSend_addRecordTypes_(v38, v35, (uint64_t)v34);
      }
    }
  }
  uint64_t v36 = v38;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v38[88] = self->_fireOnce;
    v38[92] |= 4u;
  }
  zoneIdentifier = self->_zoneIdentifier;
  if (zoneIdentifier)
  {
    objc_msgSend_setZoneIdentifier_(v38, v27, (uint64_t)zoneIdentifier);
    uint64_t v36 = v38;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_identifier, v11, (uint64_t)a3);
  uint64_t v13 = *(void **)(v10 + 48);
  *(void *)(v10 + 48) = v12;

  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v10 + 32) = self->_evaluationType;
    *(unsigned char *)(v10 + 92) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v10 + 64) = self->_owner;
    *(unsigned char *)(v10 + 92) |= 2u;
  }
  PBRepeatedInt32Copy();
  uint64_t v16 = objc_msgSend_copyWithZone_(self->_notification, v15, (uint64_t)a3);
  uint64_t v17 = *(void **)(v10 + 56);
  *(void *)(v10 + 56) = v16;

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v18 = self->_filters;
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v44, v49, 16);
  if (v20)
  {
    uint64_t v22 = v20;
    uint64_t v23 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v45 != v23) {
          objc_enumerationMutation(v18);
        }
        long long v25 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v44 + 1) + 8 * i), v21, (uint64_t)a3);
        objc_msgSend_addFilters_((void *)v10, v26, (uint64_t)v25);
      }
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v44, v49, 16);
    }
    while (v22);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v27 = self->_recordTypes;
  uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v40, v48, 16);
  if (v29)
  {
    uint64_t v31 = v29;
    uint64_t v32 = *(void *)v41;
    do
    {
      for (uint64_t j = 0; j != v31; ++j)
      {
        if (*(void *)v41 != v32) {
          objc_enumerationMutation(v27);
        }
        v34 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v40 + 1) + 8 * j), v30, (uint64_t)a3, (void)v40);
        objc_msgSend_addRecordTypes_((void *)v10, v35, (uint64_t)v34);
      }
      uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v30, (uint64_t)&v40, v48, 16);
    }
    while (v31);
  }

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(unsigned char *)(v10 + 88) = self->_fireOnce;
    *(unsigned char *)(v10 + 92) |= 4u;
  }
  uint64_t v37 = objc_msgSend_copyWithZone_(self->_zoneIdentifier, v36, (uint64_t)a3, (void)v40);
  uint64_t v38 = *(void **)(v10 + 80);
  *(void *)(v10 + 80) = v37;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_25;
  }
  identifier = self->_identifier;
  uint64_t v9 = v4[6];
  if ((unint64_t)identifier | v9)
  {
    if (!objc_msgSend_isEqual_(identifier, v7, v9)) {
      goto LABEL_25;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 92) & 1) == 0 || self->_evaluationType != *((_DWORD *)v4 + 8)) {
      goto LABEL_25;
    }
  }
  else if (*((unsigned char *)v4 + 92))
  {
    goto LABEL_25;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 92) & 2) == 0 || self->_owner != *((_DWORD *)v4 + 16)) {
      goto LABEL_25;
    }
  }
  else if ((*((unsigned char *)v4 + 92) & 2) != 0)
  {
    goto LABEL_25;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_25;
  }
  notification = self->_notification;
  uint64_t v12 = v4[7];
  if ((unint64_t)notification | v12)
  {
    if (!objc_msgSend_isEqual_(notification, v10, v12)) {
      goto LABEL_25;
    }
  }
  filters = self->_filters;
  uint64_t v14 = v4[5];
  if ((unint64_t)filters | v14)
  {
    if (!objc_msgSend_isEqual_(filters, v10, v14)) {
      goto LABEL_25;
    }
  }
  recordTypes = self->_recordTypes;
  uint64_t v16 = v4[9];
  if ((unint64_t)recordTypes | v16)
  {
    if (!objc_msgSend_isEqual_(recordTypes, v10, v16)) {
      goto LABEL_25;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    if ((*((unsigned char *)v4 + 92) & 4) == 0) {
      goto LABEL_31;
    }
LABEL_25:
    char isEqual = 0;
    goto LABEL_26;
  }
  if ((*((unsigned char *)v4 + 92) & 4) == 0) {
    goto LABEL_25;
  }
  if (!self->_fireOnce)
  {
    if (!*((unsigned char *)v4 + 88)) {
      goto LABEL_31;
    }
    goto LABEL_25;
  }
  if (!*((unsigned char *)v4 + 88)) {
    goto LABEL_25;
  }
LABEL_31:
  zoneIdentifier = self->_zoneIdentifier;
  uint64_t v20 = v4[10];
  if ((unint64_t)zoneIdentifier | v20) {
    char isEqual = objc_msgSend_isEqual_(zoneIdentifier, v10, v20);
  }
  else {
    char isEqual = 1;
  }
LABEL_26:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_identifier, a2, v2);
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v5 = 2654435761 * self->_evaluationType;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v6 = 2654435761 * self->_owner;
      goto LABEL_6;
    }
  }
  uint64_t v6 = 0;
LABEL_6:
  uint64_t v7 = PBRepeatedInt32Hash();
  uint64_t v10 = objc_msgSend_hash(self->_notification, v8, v9);
  uint64_t v13 = objc_msgSend_hash(self->_filters, v11, v12);
  uint64_t v16 = objc_msgSend_hash(self->_recordTypes, v14, v15);
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v19 = 2654435761 * self->_fireOnce;
  }
  else {
    uint64_t v19 = 0;
  }
  return v5 ^ v4 ^ v6 ^ v7 ^ v10 ^ v13 ^ v16 ^ v19 ^ objc_msgSend_hash(self->_zoneIdentifier, v17, v18);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  identifier = self->_identifier;
  uint64_t v7 = *((void *)v5 + 6);
  if (identifier)
  {
    if (v7) {
      objc_msgSend_mergeFrom_(identifier, v4, v7);
    }
  }
  else if (v7)
  {
    objc_msgSend_setIdentifier_(self, v4, v7);
  }
  char v8 = *((unsigned char *)v5 + 92);
  if (v8)
  {
    self->_evaluationType = *((_DWORD *)v5 + 8);
    *(unsigned char *)&self->_has |= 1u;
    char v8 = *((unsigned char *)v5 + 92);
  }
  if ((v8 & 2) != 0)
  {
    self->_int owner = *((_DWORD *)v5 + 16);
    *(unsigned char *)&self->_has |= 2u;
  }
  uint64_t v9 = objc_msgSend_mutationTriggersCount(v5, v4, v7);
  if (v9)
  {
    uint64_t v11 = v9;
    for (uint64_t i = 0; i != v11; ++i)
    {
      uint64_t v13 = objc_msgSend_mutationTriggersAtIndex_(v5, v10, i);
      objc_msgSend_addMutationTriggers_(self, v14, v13);
    }
  }
  notification = self->_notification;
  uint64_t v16 = *((void *)v5 + 7);
  if (notification)
  {
    if (v16) {
      objc_msgSend_mergeFrom_(notification, v10, v16);
    }
  }
  else if (v16)
  {
    objc_msgSend_setNotification_(self, v10, v16);
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v17 = *((id *)v5 + 5);
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v38, v43, 16);
  if (v19)
  {
    uint64_t v21 = v19;
    uint64_t v22 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v39 != v22) {
          objc_enumerationMutation(v17);
        }
        objc_msgSend_addFilters_(self, v20, *(void *)(*((void *)&v38 + 1) + 8 * j));
      }
      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v38, v43, 16);
    }
    while (v21);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v24 = *((id *)v5 + 9);
  uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v34, v42, 16);
  if (v26)
  {
    uint64_t v28 = v26;
    uint64_t v29 = *(void *)v35;
    do
    {
      for (uint64_t k = 0; k != v28; ++k)
      {
        if (*(void *)v35 != v29) {
          objc_enumerationMutation(v24);
        }
        objc_msgSend_addRecordTypes_(self, v27, *(void *)(*((void *)&v34 + 1) + 8 * k), (void)v34);
      }
      uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v27, (uint64_t)&v34, v42, 16);
    }
    while (v28);
  }

  if ((*((unsigned char *)v5 + 92) & 4) != 0)
  {
    self->_fireOnce = *((unsigned char *)v5 + 88);
    *(unsigned char *)&self->_has |= 4u;
  }
  zoneIdentifier = self->_zoneIdentifier;
  uint64_t v33 = *((void *)v5 + 10);
  if (zoneIdentifier)
  {
    if (v33) {
      objc_msgSend_mergeFrom_(zoneIdentifier, v31, v33);
    }
  }
  else if (v33)
  {
    objc_msgSend_setZoneIdentifier_(self, v31, v33);
  }
}

- (CKDPIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (CKDPSubscriptionNotification)notification
{
  return self->_notification;
}

- (void)setNotification:(id)a3
{
}

- (NSMutableArray)filters
{
  return self->_filters;
}

- (void)setFilters:(id)a3
{
}

- (NSMutableArray)recordTypes
{
  return self->_recordTypes;
}

- (void)setRecordTypes:(id)a3
{
}

- (BOOL)fireOnce
{
  return self->_fireOnce;
}

- (CKDPRecordZoneIdentifier)zoneIdentifier
{
  return self->_zoneIdentifier;
}

- (void)setZoneIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneIdentifier, 0);
  objc_storeStrong((id *)&self->_recordTypes, 0);
  objc_storeStrong((id *)&self->_notification, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_filters, 0);
}

@end