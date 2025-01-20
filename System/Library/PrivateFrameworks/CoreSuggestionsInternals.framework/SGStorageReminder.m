@interface SGStorageReminder
+ (SGStorageReminder)storageReminderWithPrimaryKey:(int64_t)a3 store:(id)a4;
+ (id)storageReminderFromDuplicateKey:(id)a3 store:(id)a4;
+ (id)storageReminderFromEntity:(id)a3 origin:(id)a4;
+ (id)storageReminderFromEntity:(id)a3 store:(id)a4;
+ (id)storageReminderFromRecordId:(id)a3 store:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToStorageReminder:(id)a3;
- (NSString)sourceKey;
- (SGDuplicateKey)duplicateKey;
- (SGStorageLocation)dueStorageLocation;
- (SGStorageReminder)initWithRecordId:(id)a3 duplicateKey:(id)a4 sourceKey:(id)a5 origin:(id)a6 dueDate:(id)a7 dueLocationType:(unsigned __int8)a8 dueLocation:(id)a9 dueLocationTrigger:(unsigned __int8)a10 title:(id)a11 reminderStatus:(unsigned __int8)a12 contactIdentifier:(id)a13 creationDate:(id)a14;
- (id)description;
- (id)loggingIdentifier;
- (id)toReminder;
- (int64_t)commitWithStore:(id)a3;
- (unint64_t)hash;
@end

@implementation SGStorageReminder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceKey, 0);
  objc_storeStrong((id *)&self->_dueStorageLocation, 0);
  objc_storeStrong((id *)&self->_duplicateKey, 0);
}

- (NSString)sourceKey
{
  return self->_sourceKey;
}

- (SGStorageLocation)dueStorageLocation
{
  return self->_dueStorageLocation;
}

- (SGDuplicateKey)duplicateKey
{
  return self->_duplicateKey;
}

- (id)loggingIdentifier
{
  if (self->_duplicateKey) {
    v2 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"%tu", -[SGDuplicateKey hash](self->_duplicateKey, "hash"));
  }
  else {
    v2 = &stru_1F24EEF20;
  }
  if ((unint64_t)[(__CFString *)v2 length] > 0xC)
  {
    -[__CFString substringWithRange:](v2, "substringWithRange:", 0, 12);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = v2;
  }
  v4 = v3;

  return v4;
}

- (int64_t)commitWithStore:(id)a3
{
  return [a3 commitStorageReminder:self];
}

- (id)toReminder
{
  id v3 = objc_alloc(MEMORY[0x1E4F5DB28]);
  v4 = [(SGObject *)self recordId];
  v21 = [(SGObject *)self origin];
  v20 = [(SGReminder *)self title];
  v19 = [(SGReminder *)self dueDateComponents];
  unsigned int v17 = [(SGReminder *)self dueLocationType];
  v16 = [(SGReminder *)self dueLocation];
  unsigned __int8 v5 = [(SGReminder *)self dueLocationTrigger];
  v15 = [(SGReminder *)self sourceURL];
  unsigned __int8 v6 = [(SGReminder *)self reminderStatus];
  v7 = [(SGReminder *)self opaqueKey];
  v8 = [(SGStorageReminder *)self duplicateKey];
  v9 = [v8 serialize];
  v10 = [(SGReminder *)self contactIdentifier];
  v11 = [(SGReminder *)self creationDate];
  LOBYTE(v14) = v6;
  LOBYTE(v13) = v5;
  id v18 = (id)[v3 initWithRecordId:v4 origin:v21 title:v20 dueDateComponents:v19 dueLocationType:v17 dueLocation:v16 dueLocationTrigger:v13 sourceURL:v15 reminderStatus:v14 opaqueKey:v7 uniqueKey:v9 contactIdentifier:v10 creationDate:v11];

  return v18;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = [(SGReminder *)self title];
  duplicateKey = self->_duplicateKey;
  unsigned __int8 v6 = [(SGReminder *)self dueDateComponents];
  v7 = [(SGReminder *)self dueLocation];
  v8 = objc_msgSend(MEMORY[0x1E4F5DB28], "describeReminderStatus:", -[SGReminder reminderStatus](self, "reminderStatus"));
  v9 = (void *)[v3 initWithFormat:@"<SGStorageReminder title:%@ dupKey:%@ dueDate:%@ dueLocation: %@ reminderStatus: %@>", v4, duplicateKey, v6, v7, v8];

  return v9;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)SGStorageReminder;
  unint64_t v3 = [(SGReminder *)&v6 hash];
  unint64_t v4 = [(SGDuplicateKey *)self->_duplicateKey hash] - v3 + 32 * v3;
  return [(NSString *)self->_sourceKey hash] - v4 + 32 * v4;
}

- (BOOL)isEqualToStorageReminder:(id)a3
{
  unint64_t v4 = (id *)a3;
  v19.receiver = self;
  v19.super_class = (Class)SGStorageReminder;
  if (![(SGReminder *)&v19 isEqual:v4]) {
    goto LABEL_8;
  }
  duplicateKey = self->_duplicateKey;
  objc_super v6 = (SGDuplicateKey *)v4[12];
  if (duplicateKey == v6)
  {
  }
  else
  {
    v7 = v6;
    v8 = duplicateKey;
    BOOL v9 = [(SGDuplicateKey *)v8 isEqual:v7];

    if (!v9) {
      goto LABEL_8;
    }
  }
  sourceKey = self->_sourceKey;
  v11 = (NSString *)v4[14];
  if (sourceKey == v11)
  {
  }
  else
  {
    v12 = v11;
    uint64_t v13 = sourceKey;
    char v14 = [(NSString *)v13 isEqual:v12];

    if ((v14 & 1) == 0)
    {
LABEL_8:
      char v15 = 0;
      goto LABEL_14;
    }
  }
  v16 = self->_dueStorageLocation;
  unsigned int v17 = v16;
  if (v16 == v4[13]) {
    char v15 = 1;
  }
  else {
    char v15 = -[SGStorageLocation isEqual:](v16, "isEqual:");
  }

LABEL_14:
  return v15;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (SGStorageReminder *)a3;
  unsigned __int8 v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGStorageReminder *)self isEqualToStorageReminder:v5];

  return v6;
}

- (SGStorageReminder)initWithRecordId:(id)a3 duplicateKey:(id)a4 sourceKey:(id)a5 origin:(id)a6 dueDate:(id)a7 dueLocationType:(unsigned __int8)a8 dueLocation:(id)a9 dueLocationTrigger:(unsigned __int8)a10 title:(id)a11 reminderStatus:(unsigned __int8)a12 contactIdentifier:(id)a13 creationDate:(id)a14
{
  unsigned int v37 = a8;
  id v43 = a3;
  id obj = a4;
  id v42 = a4;
  id v35 = a5;
  id v39 = a5;
  id v20 = a6;
  id v38 = a7;
  id v21 = a9;
  id v22 = a11;
  id v41 = a13;
  id v40 = a14;
  v36 = v22;
  if (!v22)
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"SGStorageReminder.m", 45, @"Invalid parameter not satisfying: %@", @"title" object file lineNumber description];
  }
  v23 = [v20 universalURL];
  if (!v23)
  {
    v23 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:&stru_1F24EEF20];
    if (!v23)
    {
      v31 = [MEMORY[0x1E4F28B00] currentHandler];
      v32 = [v20 externalKey];
      [v31 handleFailureInMethod:a2, self, @"SGStorageReminder.m", 47, @"SGStorageReminder failed to create sourceURL from %@", v32 object file lineNumber description];

      v23 = 0;
    }
  }
  v24 = [v21 convertToLocationWithId:v43 origin:v20];
  v25 = [v42 pseudoReminderKey];
  v26 = [v25 serialize];
  v27 = [v42 serialize];
  v44.receiver = self;
  v44.super_class = (Class)SGStorageReminder;
  LOBYTE(v33) = a10;
  v28 = [(SGReminder *)&v44 initWithRecordId:v43 origin:v20 title:v36 dueDateComponents:v38 dueLocationType:v37 dueLocation:v24 dueLocationTrigger:v33 sourceURL:v23 reminderStatus:a12 opaqueKey:v26 uniqueKey:v27 contactIdentifier:v41 creationDate:v40];

  if (v28)
  {
    objc_storeStrong((id *)&v28->_duplicateKey, obj);
    objc_storeStrong((id *)&v28->_sourceKey, v35);
    objc_storeStrong((id *)&v28->_dueStorageLocation, a9);
  }

  return v28;
}

+ (SGStorageReminder)storageReminderWithPrimaryKey:(int64_t)a3 store:(id)a4
{
  return (SGStorageReminder *)[a4 getReminder:a3];
}

+ (id)storageReminderFromEntity:(id)a3 origin:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v46 = a4;
  v47 = v5;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id obj = [v5 tags];
  uint64_t v6 = [obj countByEnumeratingWithState:&v57 objects:v61 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    unsigned __int8 v8 = 0;
    v56 = 0;
    char v9 = 0;
    char v10 = 0;
    char v52 = 0;
    uint64_t v11 = *(void *)v58;
    uint64_t v50 = *MEMORY[0x1E4F5DEB0];
    uint64_t v48 = *MEMORY[0x1E4F5DEA0];
    uint64_t v12 = *MEMORY[0x1E4F5DEA8];
    uint64_t v13 = *MEMORY[0x1E4F5DE98];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v58 != v11) {
          objc_enumerationMutation(obj);
        }
        char v15 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        if ([v15 isReminderMetadata])
        {
          v16 = [v15 reminderMetadata];
          unsigned int v17 = [v16 objectForKeyedSubscript:v50];
          char v52 = [v17 unsignedIntegerValue];

          id v18 = [v16 objectForKeyedSubscript:v48];
          char v10 = [v18 unsignedIntegerValue];

          objc_super v19 = [v16 objectForKeyedSubscript:v12];
          unsigned __int8 v8 = [v19 unsignedIntegerValue];

          uint64_t v20 = [v16 objectForKeyedSubscript:v13];

          v56 = (void *)v20;
        }
        else
        {
          id v21 = [MEMORY[0x1E4F5D9F0] allDay];
          char v22 = [v15 isEqualToEntityTag:v21];

          v9 |= v22;
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v57 objects:v61 count:16];
    }
    while (v7);
  }
  else
  {
    unsigned __int8 v8 = 0;
    v56 = 0;
    char v9 = 0;
    char v10 = 0;
    char v52 = 0;
  }

  v23 = [v47 timeRange];
  v24 = [v23 startDateComponents];

  if (v9)
  {
    v25 = objc_opt_new();

    v26 = [v47 timeRange];
    v27 = [v26 startDateComponents];
    v28 = [v27 calendar];
    [v25 setCalendar:v28];

    v29 = [v47 timeRange];
    v30 = [v29 startDateComponents];
    objc_msgSend(v25, "setYear:", objc_msgSend(v30, "year"));

    v31 = [v47 timeRange];
    v32 = [v31 startDateComponents];
    objc_msgSend(v25, "setMonth:", objc_msgSend(v32, "month"));

    uint64_t v33 = [v47 timeRange];
    v34 = [v33 startDateComponents];
    objc_msgSend(v25, "setDay:", objc_msgSend(v34, "day"));

    id obja = v25;
  }
  else
  {
    id obja = v24;
  }
  v49 = [SGStorageReminder alloc];
  v45 = [v47 recordId];
  id v35 = [v47 duplicateKey];
  v36 = [v47 sourceKey];
  v51 = [v47 locations];
  objc_super v44 = [v51 allObjects];
  unsigned int v37 = [v44 firstObject];
  id v38 = [v47 title];
  id v39 = (void *)MEMORY[0x1E4F1C9C8];
  [v47 creationTimestamp];
  id v40 = objc_msgSend(v39, "dateWithTimeIntervalSince1970:");
  LOBYTE(v43) = v52;
  LOBYTE(v42) = v10;
  v53 = [(SGStorageReminder *)v49 initWithRecordId:v45 duplicateKey:v35 sourceKey:v36 origin:v46 dueDate:obja dueLocationType:v8 dueLocation:v37 dueLocationTrigger:v42 title:v38 reminderStatus:v43 contactIdentifier:v56 creationDate:v40];

  return v53;
}

+ (id)storageReminderFromDuplicateKey:(id)a3 store:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  char v9 = [v8 getReminderWithDuplicateKey:v7];
  v51 = [v9 recordId];
  [v9 sourceKey];
  uint64_t v50 = v52 = v7;
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F5DAC8], "originForDuplicateKey:sourceKey:store:", v7);

  v49 = (void *)v10;
  if (!v10)
  {
    id v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2, a1, @"SGStorageReminder.m", 90, @"Invalid parameter not satisfying: %@", @"origin" object file lineNumber description];
  }
  uint64_t v11 = [v9 dueLocation];

  if (v11)
  {
    uint64_t v12 = [v9 dueLocation];
    uint64_t v43 = [v12 locationType];

    uint64_t v42 = [SGStorageLocation alloc];
    id v46 = [v9 dueLocation];
    id v41 = [v46 label];
    v45 = [v9 dueLocation];
    uint64_t v13 = [v45 address];
    objc_super v44 = [v9 dueLocation];
    char v14 = [v44 airportCode];
    char v15 = [v9 dueLocation];
    [v15 latitude];
    double v17 = v16;
    id v18 = [v9 dueLocation];
    [v18 longitude];
    double v20 = v19;
    id v21 = [v9 dueLocation];
    [v21 accuracy];
    double v23 = v22;
    v24 = [v9 dueLocation];
    [v24 quality];
    double v26 = v25;
    v27 = [v9 dueLocation];
    v28 = [v27 handle];
    v29 = [(SGStorageLocation *)v42 initWithType:v43 label:v41 address:v13 airportCode:v14 latitude:v28 longitude:v17 accuracy:v20 quality:v23 handle:v26];
  }
  else
  {
    v29 = 0;
  }
  v30 = [SGStorageReminder alloc];
  v31 = [v9 dueDateComponents];
  unsigned int v47 = [v9 dueLocationType];
  char v32 = [v9 dueLocationTrigger];
  uint64_t v33 = [v9 title];
  char v34 = [v9 reminderStatus];
  id v35 = [v9 contactIdentifier];
  v36 = [v9 creationDate];
  LOBYTE(v40) = v34;
  LOBYTE(v39) = v32;
  uint64_t v48 = [(SGStorageReminder *)v30 initWithRecordId:v51 duplicateKey:v52 sourceKey:v50 origin:v49 dueDate:v31 dueLocationType:v47 dueLocation:v29 dueLocationTrigger:v39 title:v33 reminderStatus:v40 contactIdentifier:v35 creationDate:v36];

  return v48;
}

+ (id)storageReminderFromEntity:(id)a3 store:(id)a4
{
  id v7 = a3;
  id v8 = (void *)MEMORY[0x1E4F5DAC8];
  id v9 = a4;
  uint64_t v10 = [v7 duplicateKey];
  uint64_t v11 = [v7 sourceKey];
  uint64_t v12 = [v8 originForDuplicateKey:v10 sourceKey:v11 store:v9];

  if (!v12)
  {
    char v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"SGStorageReminder.m", 79, @"Invalid parameter not satisfying: %@", @"origin" object file lineNumber description];
  }
  uint64_t v13 = [a1 storageReminderFromEntity:v7 origin:v12];

  return v13;
}

+ (id)storageReminderFromRecordId:(id)a3 store:(id)a4
{
  return (id)[a4 getReminderWithRecordId:a3];
}

@end