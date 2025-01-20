@interface IKPlayerRequestSeekToDateEventUserInfo
- (BOOL)shouldSeek;
- (IKPlayerRequestSeekToDateEventUserInfo)initWithRequestDate:(id)a3 currentDate:(id)a4;
- (NSDate)currentDate;
- (NSDate)proposedDate;
- (NSDate)requestedDate;
- (NSDictionary)properties;
- (void)processReturnJSValue:(id)a3 inContext:(id)a4;
@end

@implementation IKPlayerRequestSeekToDateEventUserInfo

- (IKPlayerRequestSeekToDateEventUserInfo)initWithRequestDate:(id)a3 currentDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IKPlayerRequestSeekToDateEventUserInfo;
  v9 = [(IKPlayerRequestSeekToDateEventUserInfo *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_requestedDate, a3);
    objc_storeStrong((id *)&v10->_currentDate, a4);
    v10->_shouldSeek = 1;
    objc_storeStrong((id *)&v10->_proposedDate, a3);
  }

  return v10;
}

- (NSDictionary)properties
{
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  [v3 setObject:self->_requestedDate forKeyedSubscript:@"requestedDate"];
  [v3 setObject:self->_currentDate forKeyedSubscript:@"currentDate"];
  v4 = (void *)[v3 copy];

  return (NSDictionary *)v4;
}

- (void)processReturnJSValue:(id)a3 inContext:(id)a4
{
  id v7 = a3;
  if ([v7 isNull])
  {
    self->_shouldSeek = 0;
  }
  else if ([v7 isBoolean])
  {
    self->_shouldSeek = [v7 toBool];
  }
  else if ([v7 isDate])
  {
    v5 = [v7 toDate];
    proposedDate = self->_proposedDate;
    self->_proposedDate = v5;
  }
}

- (NSDate)requestedDate
{
  return self->_requestedDate;
}

- (NSDate)currentDate
{
  return self->_currentDate;
}

- (BOOL)shouldSeek
{
  return self->_shouldSeek;
}

- (NSDate)proposedDate
{
  return self->_proposedDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proposedDate, 0);
  objc_storeStrong((id *)&self->_currentDate, 0);
  objc_storeStrong((id *)&self->_requestedDate, 0);
}

@end