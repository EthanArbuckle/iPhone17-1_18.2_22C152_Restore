@interface EKEventOccurrenceInfo
- (EKEventOccurrenceInfo)initWithObjectID:(id)a3 date:(double)a4;
- (EKObjectID)objectID;
- (double)date;
- (id)description;
- (void)setDate:(double)a3;
- (void)setObjectID:(id)a3;
@end

@implementation EKEventOccurrenceInfo

- (EKEventOccurrenceInfo)initWithObjectID:(id)a3 date:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EKEventOccurrenceInfo;
  v8 = [(EKEventOccurrenceInfo *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_objectID, a3);
    v9->_date = a4;
  }

  return v9;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)EKEventOccurrenceInfo;
  v4 = [(EKEventOccurrenceInfo *)&v7 description];
  v5 = [v3 stringWithFormat:@"[%@] rowID: [%d] date: [%f]", v4, -[EKObjectID rowID](self->_objectID, "rowID"), *(void *)&self->_date];

  return v5;
}

- (EKObjectID)objectID
{
  return self->_objectID;
}

- (void)setObjectID:(id)a3
{
}

- (double)date
{
  return self->_date;
}

- (void)setDate:(double)a3
{
  self->_date = a3;
}

- (void).cxx_destruct
{
}

@end