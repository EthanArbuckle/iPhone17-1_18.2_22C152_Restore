@interface CALNNotificationRecordsDiff
+ (id)diffWithAddedRecords:(id)a3 removedRecords:(id)a4 modifiedRecords:(id)a5;
+ (id)emptyDiff;
- (CALNNotificationRecordsDiff)initWithAddedRecords:(id)a3 removedRecords:(id)a4 modifiedRecords:(id)a5;
- (NSArray)addedRecords;
- (NSArray)modifiedRecords;
- (NSArray)removedRecords;
- (id)description;
@end

@implementation CALNNotificationRecordsDiff

- (CALNNotificationRecordsDiff)initWithAddedRecords:(id)a3 removedRecords:(id)a4 modifiedRecords:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CALNNotificationRecordsDiff;
  v11 = [(CALNNotificationRecordsDiff *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    addedRecords = v11->_addedRecords;
    v11->_addedRecords = (NSArray *)v12;

    uint64_t v14 = [v9 copy];
    removedRecords = v11->_removedRecords;
    v11->_removedRecords = (NSArray *)v14;

    uint64_t v16 = [v10 copy];
    modifiedRecords = v11->_modifiedRecords;
    v11->_modifiedRecords = (NSArray *)v16;
  }
  return v11;
}

+ (id)diffWithAddedRecords:(id)a3 removedRecords:(id)a4 modifiedRecords:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 count] || objc_msgSend(v8, "count") || objc_msgSend(v9, "count"))
  {
    id v10 = [[CALNNotificationRecordsDiff alloc] initWithAddedRecords:v7 removedRecords:v8 modifiedRecords:v9];
  }
  else
  {
    id v10 = [(id)objc_opt_class() emptyDiff];
  }
  v11 = v10;

  return v11;
}

+ (id)emptyDiff
{
  if (emptyDiff_onceToken != -1) {
    dispatch_once(&emptyDiff_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)emptyDiff_emptyDiff;
  return v2;
}

uint64_t __40__CALNNotificationRecordsDiff_emptyDiff__block_invoke()
{
  v0 = [CALNNotificationRecordsDiff alloc];
  emptyDiff_emptyDiff = [(CALNNotificationRecordsDiff *)v0 initWithAddedRecords:MEMORY[0x263EFFA68] removedRecords:MEMORY[0x263EFFA68] modifiedRecords:MEMORY[0x263EFFA68]];
  return MEMORY[0x270F9A758]();
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CALNNotificationRecordsDiff *)self addedRecords];
  v6 = [(CALNNotificationRecordsDiff *)self removedRecords];
  id v7 = [(CALNNotificationRecordsDiff *)self modifiedRecords];
  id v8 = [v3 stringWithFormat:@"<%@: %p>(\naddedRecords = %@\nremovedRecords = %@\nmodifiedRecords = %@\n)", v4, self, v5, v6, v7];

  return v8;
}

- (NSArray)addedRecords
{
  return self->_addedRecords;
}

- (NSArray)removedRecords
{
  return self->_removedRecords;
}

- (NSArray)modifiedRecords
{
  return self->_modifiedRecords;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifiedRecords, 0);
  objc_storeStrong((id *)&self->_removedRecords, 0);
  objc_storeStrong((id *)&self->_addedRecords, 0);
}

@end