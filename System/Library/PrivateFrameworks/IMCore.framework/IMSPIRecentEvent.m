@interface IMSPIRecentEvent
- (IMSPIRecentEvent)initWithHandle:(id)a3 date:(id)a4;
- (IMSPIRecentEvent)initWithLabelID:(id)a3 date:(id)a4;
- (NSDate)date;
- (NSString)handle;
- (NSString)labelID;
- (id)description;
- (void)setDate:(id)a3;
- (void)setHandle:(id)a3;
- (void)setLabelID:(id)a3;
@end

@implementation IMSPIRecentEvent

- (IMSPIRecentEvent)initWithHandle:(id)a3 date:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)IMSPIRecentEvent;
  v11 = [(IMSPIRecentEvent *)&v15 init];
  if (v11)
  {
    uint64_t v12 = objc_msgSend_copy(v6, v8, v9, v10);
    handle = v11->_handle;
    v11->_handle = (NSString *)v12;

    objc_storeStrong((id *)&v11->_date, a4);
  }

  return v11;
}

- (IMSPIRecentEvent)initWithLabelID:(id)a3 date:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)IMSPIRecentEvent;
  v11 = [(IMSPIRecentEvent *)&v15 init];
  if (v11)
  {
    uint64_t v12 = objc_msgSend_copy(v6, v8, v9, v10);
    labelID = v11->_labelID;
    v11->_labelID = (NSString *)v12;

    objc_storeStrong((id *)&v11->_date, a4);
  }

  return v11;
}

- (id)description
{
  v5 = NSString;
  id v6 = objc_msgSend_handle(self, a2, v2, v3);
  uint64_t v10 = objc_msgSend_labelID(self, v7, v8, v9);
  v14 = objc_msgSend_date(self, v11, v12, v13);
  v17 = objc_msgSend_stringWithFormat_(v5, v15, @"IMSPIRecentEvent: %p [Handle: %@  LabelID: %@ Date: %@]", v16, self, v6, v10, v14);

  return v17;
}

- (NSString)handle
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setHandle:(id)a3
{
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDate:(id)a3
{
}

- (NSString)labelID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLabelID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelID, 0);
  objc_storeStrong((id *)&self->_date, 0);

  objc_storeStrong((id *)&self->_handle, 0);
}

@end