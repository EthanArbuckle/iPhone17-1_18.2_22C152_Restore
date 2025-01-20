@interface CKNotification
- (id)cplNotificationTypeDescription;
@end

@implementation CKNotification

- (id)cplNotificationTypeDescription
{
  CKNotificationType v3 = [(CKNotification *)self notificationType];
  if ((unint64_t)(v3 - 1) >= 4) {
    id v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%ld (???)", -[CKNotification notificationType](self, "notificationType"));
  }
  else {
    id v4 = *(&off_100275E18 + v3 - 1);
  }
  return v4;
}

@end