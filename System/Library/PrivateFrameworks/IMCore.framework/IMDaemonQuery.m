@interface IMDaemonQuery
- (IMDaemonQuery)initWithID:(id)a3 key:(id)a4 completionHandler:(id)a5;
- (NSDate)startDate;
- (NSString)ID;
- (NSString)key;
- (id)completionHandler;
- (id)description;
@end

@implementation IMDaemonQuery

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_key, 0);

  objc_storeStrong((id *)&self->_ID, 0);
}

- (IMDaemonQuery)initWithID:(id)a3 key:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v33.receiver = self;
  v33.super_class = (Class)IMDaemonQuery;
  v14 = [(IMDaemonQuery *)&v33 init];
  if (v14)
  {
    uint64_t v15 = objc_msgSend_copy(v8, v11, v12, v13);
    ID = v14->_ID;
    v14->_ID = (NSString *)v15;

    uint64_t v20 = objc_msgSend_copy(v9, v17, v18, v19);
    key = v14->_key;
    v14->_key = (NSString *)v20;

    uint64_t v25 = objc_msgSend_copy(v10, v22, v23, v24);
    id completionHandler = v14->_completionHandler;
    v14->_id completionHandler = (id)v25;

    uint64_t v30 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v27, v28, v29);
    startDate = v14->_startDate;
    v14->_startDate = (NSDate *)v30;
  }
  return v14;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (id)description
{
  v5 = NSString;
  v6 = objc_msgSend_ID(self, a2, v2, v3);
  id v10 = objc_msgSend_key(self, v7, v8, v9);
  v14 = objc_msgSend_startDate(self, v11, v12, v13);
  uint64_t v20 = objc_msgSend_completionHandler(self, v15, v16, v17);
  v21 = @"YES";
  if (!v20) {
    v21 = @"NO";
  }
  v22 = objc_msgSend_stringWithFormat_(v5, v18, @"ID: %@ key: %@ startDate: %@ completionHandler: %@", v19, v6, v10, v14, v21);

  return v22;
}

- (NSString)ID
{
  return self->_ID;
}

- (NSString)key
{
  return self->_key;
}

@end