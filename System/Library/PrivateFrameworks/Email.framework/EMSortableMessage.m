@interface EMSortableMessage
- (EMReadLater)readLater;
- (EMSortableMessage)initWithObjectID:(id)a3 date:(id)a4 displayDate:(id)a5 readLater:(id)a6 sendLaterDate:(id)a7;
- (NSDate)date;
- (NSDate)displayDate;
- (NSDate)sendLaterDate;
@end

@implementation EMSortableMessage

- (EMSortableMessage)initWithObjectID:(id)a3 date:(id)a4 displayDate:(id)a5 readLater:(id)a6 sendLaterDate:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)EMSortableMessage;
  v17 = [(EMObject *)&v20 initWithObjectID:a3];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_date, a4);
    objc_storeStrong((id *)&v18->_displayDate, a5);
    objc_storeStrong((id *)&v18->_readLater, a6);
    objc_storeStrong((id *)&v18->_sendLaterDate, a7);
  }

  return v18;
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (NSDate)displayDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (EMReadLater)readLater
{
  return (EMReadLater *)objc_getProperty(self, a2, 32, 1);
}

- (NSDate)sendLaterDate
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendLaterDate, 0);
  objc_storeStrong((id *)&self->_readLater, 0);
  objc_storeStrong((id *)&self->_displayDate, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end