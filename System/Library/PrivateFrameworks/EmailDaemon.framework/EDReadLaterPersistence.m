@interface EDReadLaterPersistence
- (EDPersistenceDatabase)database;
- (EDPersistenceHookRegistry)hookRegistry;
- (EDReadLaterCloudStorage)cloudStorage;
- (EDReadLaterPersistence)initWithDatabase:(id)a3 hookRegistry:(id)a4;
- (id)cloudStorageReadLaterDateForMessage:(id)a3 displayDate:(id *)a4;
- (void)_persistDisplayDate:(id)a3 message:(id)a4 connection:(id)a5;
- (void)_persistReadLater:(id)a3 date:(id)a4 displayDate:(id)a5;
- (void)persistReadLaterForMessage:(id)a3 date:(id)a4 displayDate:(id)a5;
- (void)removeReadLaterForMessage:(id)a3;
- (void)scheduleRecurringActivity;
- (void)setCloudStorage:(id)a3;
- (void)setDatabase:(id)a3;
- (void)setHookRegistry:(id)a3;
@end

@implementation EDReadLaterPersistence

- (EDReadLaterPersistence)initWithDatabase:(id)a3 hookRegistry:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EDReadLaterPersistence;
  v9 = [(EDReadLaterPersistence *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_database, a3);
    objc_storeStrong((id *)&v10->_hookRegistry, a4);
  }

  return v10;
}

- (void)scheduleRecurringActivity
{
  v3 = [EDReadLaterCloudStorage alloc];
  id v6 = [(EDReadLaterPersistence *)self hookRegistry];
  v4 = -[EDReadLaterCloudStorage initWithHookRegistry:](v3, "initWithHookRegistry:");
  cloudStorage = self->_cloudStorage;
  self->_cloudStorage = v4;
}

- (void)persistReadLaterForMessage:(id)a3 date:(id)a4 displayDate:(id)a5
{
  id v15 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v14 = [MEMORY[0x1E4F28B00] currentHandler];
  [v14 handleFailureInMethod:a2 object:self file:@"EDReadLaterPersistence.m" lineNumber:48 description:@"Expect a non-nil date"];

  if (!v11)
  {
LABEL_3:
    v11 = [v15 dateReceived];
  }
LABEL_4:
  objc_super v12 = objc_msgSend(v9, "ec_integerDate");
  v13 = objc_msgSend(v11, "ec_integerDate");
  [(EDReadLaterPersistence *)self _persistReadLater:v15 date:v12 displayDate:v13];
}

- (void)removeReadLaterForMessage:(id)a3
{
  id v6 = a3;
  v4 = [v6 dateReceived];
  v5 = objc_msgSend(v4, "ec_integerDate");
  [(EDReadLaterPersistence *)self _persistReadLater:v6 date:0 displayDate:v5];
}

- (void)_persistReadLater:(id)a3 date:(id)a4 displayDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(EDReadLaterPersistence *)self database];
  objc_super v12 = [NSString stringWithUTF8String:"-[EDReadLaterPersistence _persistReadLater:date:displayDate:]"];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __61__EDReadLaterPersistence__persistReadLater_date_displayDate___block_invoke;
  v16[3] = &unk_1E6C027D0;
  id v13 = v9;
  id v17 = v13;
  id v14 = v8;
  id v18 = v14;
  id v15 = v10;
  id v19 = v15;
  v20 = self;
  objc_msgSend(v11, "__performWriteWithCaller:usingBlock:", v12, v16);
}

uint64_t __61__EDReadLaterPersistence__persistReadLater_date_displayDate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F60F10]) initWithTable:@"message_global_data" conflictResolution:1];
  v5 = *(void **)(a1 + 32);
  id v6 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
  }
  [v4 setObject:v6 forKeyedSubscript:@"read_later_date"];
  if (!v5) {

  }
  id v7 = [MEMORY[0x1E4F60E78] column:*MEMORY[0x1E4F60D08]];
  id v8 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "globalMessageID"));
  id v9 = [v7 equalTo:v8];
  [v4 setWhereClause:v9];

  id v18 = 0;
  uint64_t v10 = [v3 executeUpdateStatement:v4 error:&v18];
  id v11 = v18;
  if (v10)
  {
    uint64_t v12 = *(void *)(a1 + 32);
    if (v12) {
      id v13 = (void *)[objc_alloc(MEMORY[0x1E4F60420]) initWithDate:*(void *)(a1 + 32)];
    }
    else {
      id v13 = 0;
    }
    [*(id *)(a1 + 40) setReadLater:v13];
    if (v12) {

    }
    id v14 = *(void **)(a1 + 48);
    if (v14)
    {
      id v15 = [*(id *)(a1 + 40) displayDate];
      char v16 = [v14 isEqualToDate:v15];

      if ((v16 & 1) == 0) {
        [*(id *)(a1 + 56) _persistDisplayDate:*(void *)(a1 + 48) message:*(void *)(a1 + 40) connection:v3];
      }
    }
  }
  else
  {
    [v3 handleError:v11 message:@"Updating read later date"];
  }

  return v10;
}

- (void)_persistDisplayDate:(id)a3 message:(id)a4 connection:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"EDReadLaterPersistence.m", 79, @"Invalid parameter not satisfying: %@", @"displayDate" object file lineNumber description];
  }
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F60F10]) initWithTable:@"messages"];
  [v12 setObject:v9 forKeyedSubscript:@"display_date"];
  id v13 = [MEMORY[0x1E4F60E78] column:@"global_message_id"];
  id v14 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v10, "globalMessageID"));
  id v15 = [v13 equalTo:v14];
  [v12 setWhereClause:v15];

  id v18 = 0;
  LODWORD(v15) = [v11 executeUpdateStatement:v12 error:&v18];
  id v16 = v18;
  if (v15) {
    [v10 setDisplayDate:v9];
  }
  else {
    [v11 handleError:v16 message:@"Resetting display date after updating read later"];
  }
}

- (id)cloudStorageReadLaterDateForMessage:(id)a3 displayDate:(id *)a4
{
  id v6 = a3;
  id v7 = [(EDReadLaterPersistence *)self cloudStorage];
  id v8 = [v7 cloudStorageReadLaterDateForMessage:v6 displayDate:a4];

  return v8;
}

- (EDReadLaterCloudStorage)cloudStorage
{
  return self->_cloudStorage;
}

- (void)setCloudStorage:(id)a3
{
}

- (EDPersistenceDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
}

- (EDPersistenceHookRegistry)hookRegistry
{
  return self->_hookRegistry;
}

- (void)setHookRegistry:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hookRegistry, 0);
  objc_storeStrong((id *)&self->_database, 0);

  objc_storeStrong((id *)&self->_cloudStorage, 0);
}

@end