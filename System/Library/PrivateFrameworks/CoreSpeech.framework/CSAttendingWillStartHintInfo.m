@interface CSAttendingWillStartHintInfo
- (CSAttendingWillStartHintInfo)initWithOrigin:(unint64_t)a3 rootRequestId:(id)a4;
- (NSString)rootRequestId;
- (id)description;
@end

@implementation CSAttendingWillStartHintInfo

- (void).cxx_destruct
{
}

- (NSString)rootRequestId
{
  return self->_rootRequestId;
}

- (id)description
{
  v3 = +[NSMutableString string];
  v6.receiver = self;
  v6.super_class = (Class)CSAttendingWillStartHintInfo;
  v4 = [(CSAttendingHintInfo *)&v6 description];
  [v3 appendFormat:@"%@", v4];
  [v3 appendFormat:@"[rootRequestId: %@]", self->_rootRequestId];

  return v3;
}

- (CSAttendingWillStartHintInfo)initWithOrigin:(unint64_t)a3 rootRequestId:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CSAttendingWillStartHintInfo;
  v8 = [(CSAttendingHintInfo *)&v11 initWithOrigin:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_rootRequestId, a4);
  }

  return v9;
}

@end