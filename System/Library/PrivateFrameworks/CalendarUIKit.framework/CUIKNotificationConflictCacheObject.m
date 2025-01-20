@interface CUIKNotificationConflictCacheObject
+ (id)keyForNotification:(id)a3;
- (EKConflictDetails)conflictInfo;
- (unint64_t)state;
- (void)setConflictInfo:(id)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation CUIKNotificationConflictCacheObject

+ (id)keyForNotification:(id)a3
{
  v15 = NSString;
  id v3 = a3;
  v4 = [v3 title];
  v5 = [v3 event];
  v6 = [v5 calendar];
  v7 = [v6 title];
  v8 = [v3 event];
  v9 = [v8 startDate];
  v10 = [v3 event];
  v11 = [v10 endDateUnadjustedForLegacyClients];
  v12 = [v3 event];

  v13 = [v15 stringWithFormat:@"%@ %@ %@ %@ %i", v4, v7, v9, v11, objc_msgSend(v12, "isDetached")];

  return v13;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (EKConflictDetails)conflictInfo
{
  return (EKConflictDetails *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConflictInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end