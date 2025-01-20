@interface _DKChangeSet
+ (id)_createFromData:(id)a3 deviceIdentifier:(id)a4 sequenceNumber:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7;
+ (id)additionChangeSetEntityName;
+ (id)createFromData:(id)a3 deviceIdentifier:(id)a4 sequenceNumber:(unint64_t)a5;
+ (id)dataFromCompressedChangeSet:(id)a3;
+ (id)deletionChangeSetEntityName;
+ (id)fromPBCodable:(id)a3;
- (NSArray)eventIDsToDelete;
- (NSArray)eventsToAdd;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)description;
- (NSString)type;
- (NSUUID)deviceIdentifier;
- (_DKChangeSet)initWithEventIDsToDelete:(id)a3 deviceIdentifier:(id)a4 sequenceNumber:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7;
- (_DKChangeSet)initWithEventsToAdd:(id)a3 deviceIdentifier:(id)a4 sequenceNumber:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7;
- (_DKChangeSet)initWithEventsToAdd:(id)a3 eventIDsToDelete:(id)a4 deviceIdentifier:(id)a5 sequenceNumber:(unint64_t)a6;
- (_DKChangeSet)initWithEventsToAdd:(id)a3 eventIDsToDelete:(id)a4 deviceIdentifier:(id)a5 sequenceNumber:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8 type:(id)a9;
- (_DKChangeSet)initWithManagedObject:(id)a3;
- (id)asData;
- (id)insertInManagedObjectContext:(id)a3;
- (id)toPBCodable;
- (unint64_t)sequenceNumber;
- (void)setDeviceIdentifier:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setEventIDsToDelete:(id)a3;
- (void)setEventsToAdd:(id)a3;
- (void)setSequenceNumber:(unint64_t)a3;
- (void)setStartDate:(id)a3;
- (void)setType:(id)a3;
@end

@implementation _DKChangeSet

- (_DKChangeSet)initWithEventsToAdd:(id)a3 deviceIdentifier:(id)a4 sequenceNumber:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7
{
  return [(_DKChangeSet *)self initWithEventsToAdd:a3 eventIDsToDelete:0 deviceIdentifier:a4 sequenceNumber:a5 startDate:a6 endDate:a7 type:@"addition"];
}

- (_DKChangeSet)initWithEventIDsToDelete:(id)a3 deviceIdentifier:(id)a4 sequenceNumber:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7
{
  return [(_DKChangeSet *)self initWithEventsToAdd:0 eventIDsToDelete:a3 deviceIdentifier:a4 sequenceNumber:a5 startDate:a6 endDate:a7 type:@"deletion"];
}

- (_DKChangeSet)initWithEventsToAdd:(id)a3 eventIDsToDelete:(id)a4 deviceIdentifier:(id)a5 sequenceNumber:(unint64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [v11 count];
  v14 = @"deletion";
  if (!v13) {
    v14 = @"addition";
  }
  v15 = [(_DKChangeSet *)self initWithEventsToAdd:v12 eventIDsToDelete:v11 deviceIdentifier:v10 sequenceNumber:a6 startDate:0 endDate:0 type:v14];

  return v15;
}

- (_DKChangeSet)initWithEventsToAdd:(id)a3 eventIDsToDelete:(id)a4 deviceIdentifier:(id)a5 sequenceNumber:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8 type:(id)a9
{
  id v24 = a3;
  id v23 = a4;
  id v22 = a5;
  id v15 = a7;
  id v16 = a8;
  id v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)_DKChangeSet;
  v18 = [(_DKChangeSet *)&v25 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_eventsToAdd, a3);
    objc_storeStrong((id *)&v19->_eventIDsToDelete, a4);
    objc_storeStrong((id *)&v19->_deviceIdentifier, a5);
    v19->_sequenceNumber = a6;
    objc_storeStrong((id *)&v19->_startDate, a7);
    objc_storeStrong((id *)&v19->_endDate, a8);
    objc_storeStrong((id *)&v19->_type, a9);
  }

  return v19;
}

+ (id)_createFromData:(id)a3 deviceIdentifier:(id)a4 sequenceNumber:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  id v15 = [[_DKPRChangeSet alloc] initWithData:v14];

  id v16 = +[_DKChangeSet fromPBCodable:v15];
  [v16 setDeviceIdentifier:v13];

  [v16 setSequenceNumber:a5];
  [v16 setStartDate:v12];

  [v16 setEndDate:v11];
  id v17 = [v16 eventIDsToDelete];
  if ([v17 count]) {
    v18 = @"deletion";
  }
  else {
    v18 = @"addition";
  }
  [v16 setType:v18];

  return v16;
}

+ (id)createFromData:(id)a3 deviceIdentifier:(id)a4 sequenceNumber:(unint64_t)a5
{
  return (id)[a1 _createFromData:a3 deviceIdentifier:a4 sequenceNumber:a5 startDate:0 endDate:0];
}

- (id)asData
{
  v2 = [(_DKChangeSet *)self toPBCodable];
  v3 = [v2 data];

  return v3;
}

- (NSString)description
{
  if ([(NSString *)self->_type isEqualToString:@"addition"])
  {
    v3 = NSString;
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    v6 = [NSNumber numberWithUnsignedInteger:self->_sequenceNumber];
    deviceIdentifier = self->_deviceIdentifier;
    startDate = self->_startDate;
    endDate = self->_endDate;
    id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSArray count](self->_eventsToAdd, "count"));
    objc_msgSend(v3, "stringWithFormat:", @"%@:{ sequenceNumber=%@; deviceIdentifier=%@; startDate=%@; endDate=%@; eventsToAdd.count=%@; eventsToAdd=%@; }",
      v5,
      v6,
      deviceIdentifier,
      startDate,
      endDate,
      v10,
      self->_eventsToAdd);
    v18 = LABEL_5:;

    goto LABEL_7;
  }
  BOOL v11 = [(NSString *)self->_type isEqualToString:@"deletion"];
  id v12 = NSString;
  id v13 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v13);
  uint64_t v14 = [NSNumber numberWithUnsignedInteger:self->_sequenceNumber];
  v6 = (void *)v14;
  id v15 = self->_deviceIdentifier;
  id v16 = self->_startDate;
  id v17 = self->_endDate;
  if (v11)
  {
    id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSArray count](self->_eventIDsToDelete, "count"));
    objc_msgSend(v12, "stringWithFormat:", @"%@:{ sequenceNumber=%@; deviceIdentifier=%@; startDate=%@; endDate=%@; eventIDsToDelete.count=%@; eventIDsToDelete=%@; }",
      v5,
      v6,
      v15,
      v16,
      v17,
      v10,
      self->_eventIDsToDelete);
    goto LABEL_5;
  }
  objc_msgSend(v12, "stringWithFormat:", @"%@:{ sequenceNumber=%@; deviceIdentifier=%@; startDate=%@; endDate=%@; type=%@; }",
    v5,
    v14,
    v15,
    v16,
    self->_endDate,
  v18 = self->_type);
LABEL_7:

  return (NSString *)v18;
}

- (NSArray)eventsToAdd
{
  return self->_eventsToAdd;
}

- (void)setEventsToAdd:(id)a3
{
}

- (NSArray)eventIDsToDelete
{
  return self->_eventIDsToDelete;
}

- (void)setEventIDsToDelete:(id)a3
{
}

- (NSUUID)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (unint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(unint64_t)a3
{
  self->_sequenceNumber = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_eventIDsToDelete, 0);
  objc_storeStrong((id *)&self->_eventsToAdd, 0);
}

- (id)toPBCodable
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v3 = [(_DKChangeSet *)self eventsToAdd];
  if ([v3 count])
  {
  }
  else
  {
    v4 = [(_DKChangeSet *)self eventIDsToDelete];
    uint64_t v5 = [v4 count];

    if (!v5)
    {
      v8 = 0;
      goto LABEL_22;
    }
  }
  v6 = [(_DKChangeSet *)self eventIDsToDelete];
  uint64_t v7 = [v6 count];

  v8 = objc_alloc_init(_DKPRChangeSet);
  v9 = (void *)MEMORY[0x1E4F1CA48];
  if (v7)
  {
    id v10 = [(_DKChangeSet *)self eventIDsToDelete];
    BOOL v11 = objc_msgSend(v9, "arrayWithCapacity:", objc_msgSend(v10, "count"));

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v12 = [(_DKChangeSet *)self eventIDsToDelete];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = [*(id *)(*((void *)&v26 + 1) + 8 * i) UUIDString];
          [v11 addObject:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v14);
    }

    -[_DKPRChangeSet setDeleteEventIDs:]((uint64_t)v8, v11);
  }
  else
  {
    v18 = [(_DKChangeSet *)self eventsToAdd];
    BOOL v11 = objc_msgSend(v9, "arrayWithCapacity:", objc_msgSend(v18, "count"));

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v19 = [(_DKChangeSet *)self eventsToAdd];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v31 != v22) {
            objc_enumerationMutation(v19);
          }
          id v24 = [*(id *)(*((void *)&v30 + 1) + 8 * j) toPBCodable];
          [v11 addObject:v24];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v21);
    }

    -[_DKPRChangeSet setEvents:]((uint64_t)v8, v11);
  }

LABEL_22:
  return v8;
}

+ (id)fromPBCodable:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = 0;
    goto LABEL_25;
  }
  id v4 = v3;
  uint64_t v5 = -[_DKPRChangeSet events]((uint64_t)v4);
  if ([v5 count])
  {

LABEL_6:
    v9 = -[_DKPRChangeSet deleteEventIDs]((uint64_t)v4);
    uint64_t v10 = [v9 count];

    BOOL v11 = (void *)MEMORY[0x1E4F1CA48];
    if (v10)
    {
      id v12 = [MEMORY[0x1E4F1CA48] array];
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      uint64_t v13 = -[_DKPRChangeSet deleteEventIDs]((uint64_t)v4);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v37 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v30 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v29 + 1) + 8 * i);
            id v19 = objc_alloc(MEMORY[0x1E4F29128]);
            uint64_t v20 = objc_msgSend(v19, "initWithUUIDString:", v18, (void)v29);
            [v12 addObject:v20];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v37 count:16];
        }
        while (v15);
      }

      v6 = objc_opt_new();
      [v6 setEventIDsToDelete:v12];
    }
    else
    {
      uint64_t v21 = -[_DKPRChangeSet events]((uint64_t)v4);
      id v12 = objc_msgSend(v11, "arrayWithCapacity:", objc_msgSend(v21, "count"));

      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      uint64_t v22 = -[_DKPRChangeSet events]((uint64_t)v4);
      uint64_t v23 = [v22 countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v34;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v34 != v25) {
              objc_enumerationMutation(v22);
            }
            long long v27 = +[_DKEvent fromPBCodable:*(void *)(*((void *)&v33 + 1) + 8 * j)];
            [v12 addObject:v27];
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v33 objects:v38 count:16];
        }
        while (v24);
      }

      v6 = objc_opt_new();
      [v6 setEventsToAdd:v12];
    }

    goto LABEL_24;
  }
  uint64_t v7 = -[_DKPRChangeSet deleteEventIDs]((uint64_t)v4);
  uint64_t v8 = [v7 count];

  if (v8) {
    goto LABEL_6;
  }
  v6 = 0;
LABEL_24:

LABEL_25:
  return v6;
}

- (_DKChangeSet)initWithManagedObject:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F29128]);
  v6 = [v4 deviceIdentifier];
  uint64_t v7 = (void *)[v5 initWithUUIDString:v6];

  uint64_t v8 = [v4 version];
  char v9 = [v8 isEqualToNumber:&unk_1EDE1E0F0];

  if ((v9 & 1) == 0)
  {
    id v12 = [v4 version];
    int v13 = [v12 isEqualToNumber:&unk_1EDE1E108];

    if (v13)
    {
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = [v4 changeSet];
      uint64_t v10 = [v14 dataFromCompressedChangeSet:v15];

      if (v10) {
        goto LABEL_6;
      }
      uint64_t v10 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[_DKChangeSet(CoreData) initWithManagedObject:](v10);
      }
    }
    else
    {
      uint64_t v10 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[_DKChangeSet(CoreData) initWithManagedObject:](v4, v10);
      }
    }
    BOOL v11 = 0;
    goto LABEL_12;
  }
  uint64_t v10 = [v4 changeSet];
  if (v10)
  {
LABEL_6:
    uint64_t v16 = objc_opt_class();
    id v17 = [v4 sequenceNumber];
    uint64_t v18 = [v17 unsignedIntegerValue];
    id v19 = [v4 startDate];
    uint64_t v20 = [v4 endDate];
    BOOL v11 = [v16 createFromData:v10 deviceIdentifier:v7 sequenceNumber:v18 startDate:v19 endDate:v20];

LABEL_12:
    goto LABEL_13;
  }
  BOOL v11 = 0;
LABEL_13:

  return v11;
}

+ (id)dataFromCompressedChangeSet:(id)a3
{
  id v3 = a3;
  id v4 = [[_DKPRCompressedChangeSet alloc] initWithData:v3];

  if (!-[_DKPRCompressedChangeSet uncompressedLength]((uint64_t)v4)) {
    goto LABEL_6;
  }
  uint64_t v5 = -[_DKPRCompressedChangeSet compressedData]((uint64_t)v4);
  if (!v5) {
    goto LABEL_6;
  }
  v6 = (void *)v5;
  uint64_t v7 = -[_DKPRCompressedChangeSet compressedData]((uint64_t)v4);
  uint64_t v8 = [v7 length];

  if (v8)
  {
    size_t v9 = -[_DKPRCompressedChangeSet uncompressedLength]((uint64_t)v4) + 32;
    uint64_t v10 = (uint8_t *)malloc_type_malloc(v9, 0xB9AB5C42uLL);
    -[_DKPRCompressedChangeSet compressedData]((uint64_t)v4);
    id v11 = objc_claimAutoreleasedReturnValue();
    id v12 = (const uint8_t *)[v11 bytes];
    int v13 = -[_DKPRCompressedChangeSet compressedData]((uint64_t)v4);
    size_t v14 = compression_decode_buffer(v10, v9, v12, [v13 length], 0, COMPRESSION_LZFSE);

    if (v14 == -[_DKPRCompressedChangeSet uncompressedLength]((uint64_t)v4))
    {
      uint64_t v15 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v10 length:v14 freeWhenDone:1];
      goto LABEL_10;
    }
    uint64_t v18 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      +[_DKChangeSet(CoreData) dataFromCompressedChangeSet:v18];
    }

    free(v10);
  }
  else
  {
LABEL_6:
    uint64_t v16 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[_DKChangeSet(CoreData) dataFromCompressedChangeSet:](v16);
    }
  }
  uint64_t v15 = 0;
LABEL_10:

  return v15;
}

+ (id)additionChangeSetEntityName
{
  return @"AdditionChangeSet";
}

+ (id)deletionChangeSetEntityName
{
  return @"DeletionChangeSet";
}

- (id)insertInManagedObjectContext:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_DKChangeSet *)self asData];
  if (!v5) {
    goto LABEL_14;
  }
  v6 = [(_DKChangeSet *)self eventsToAdd];
  if ([v6 count] && (unint64_t)objc_msgSend(v5, "length") >= 0x401)
  {
  }
  else
  {
    uint64_t v7 = [(_DKChangeSet *)self eventIDsToDelete];
    if (![v7 count])
    {

      goto LABEL_14;
    }
    unint64_t v8 = [v5 length];

    if (v8 < 0x801)
    {
LABEL_14:
      uint64_t v16 = 0;
      goto LABEL_15;
    }
  }
  size_t v9 = [v5 length];
  uint64_t v10 = (uint8_t *)malloc_type_malloc(v9, 0xCE4F8FAuLL);
  id v11 = v5;
  size_t v12 = compression_encode_buffer(v10, v9, (const uint8_t *)[v11 bytes], objc_msgSend(v11, "length"), 0, COMPRESSION_LZFSE);
  if (!v12 || (size_t v13 = v12, v12 >= [v11 length]))
  {
    free(v10);
    goto LABEL_14;
  }
  size_t v14 = objc_alloc_init(_DKPRCompressedChangeSet);
  -[_DKPRCompressedChangeSet setUncompressedLength:]((uint64_t)v14, [v11 length]);
  uint64_t v15 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v10 length:v13 freeWhenDone:1];
  -[_DKPRCompressedChangeSet setCompressedData:]((uint64_t)v14, v15);

  uint64_t v16 = [(_DKPRCompressedChangeSet *)v14 data];

  if (v16)
  {
    id v17 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      long long v33 = [(_DKChangeSet *)self eventIDsToDelete];
      if ([v33 count]) {
        long long v30 = @"Deletion";
      }
      else {
        long long v30 = @"Addition";
      }
      long long v31 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "length"));
      long long v32 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "length"));
      *(_DWORD *)buf = 138412802;
      long long v35 = v30;
      __int16 v36 = 2112;
      v37 = v31;
      __int16 v38 = 2112;
      uint64_t v39 = v32;
      _os_log_debug_impl(&dword_18ECEB000, v17, OS_LOG_TYPE_DEBUG, "%@ change set compressed to %@ (from %@)", buf, 0x20u);
    }
  }
LABEL_15:
  uint64_t v18 = [(_DKChangeSet *)self eventIDsToDelete];
  if ([v18 count]) {
    +[_DKChangeSet deletionChangeSetEntityName];
  }
  else {
  id v19 = +[_DKChangeSet additionChangeSetEntityName];
  }

  uint64_t v20 = [MEMORY[0x1E4F1C0A8] insertNewObjectForEntityForName:v19 inManagedObjectContext:v4];
  uint64_t v21 = v20;
  if (v16) {
    uint64_t v22 = v16;
  }
  else {
    uint64_t v22 = v5;
  }
  if (v16) {
    uint64_t v23 = &unk_1EDE1E108;
  }
  else {
    uint64_t v23 = &unk_1EDE1E0F0;
  }
  [v20 setChangeSet:v22];
  uint64_t v24 = [(_DKChangeSet *)self deviceIdentifier];
  uint64_t v25 = [v24 UUIDString];
  [v21 setDeviceIdentifier:v25];

  long long v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_DKChangeSet sequenceNumber](self, "sequenceNumber"));
  [v21 setSequenceNumber:v26];

  long long v27 = [(_DKChangeSet *)self startDate];
  [v21 setStartDate:v27];

  long long v28 = [(_DKChangeSet *)self endDate];
  [v21 setEndDate:v28];

  [v21 setVersion:v23];
  [v4 insertObject:v21];

  return v21;
}

@end