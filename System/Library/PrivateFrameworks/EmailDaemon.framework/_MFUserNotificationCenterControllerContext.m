@interface _MFUserNotificationCenterControllerContext
- (BOOL)isRemindMe;
- (BOOL)isSummaryDownload;
- (NSDate)remindMeDate;
- (NSString)ef_publicDescription;
- (void)setIsRemindMe:(BOOL)a3;
- (void)setIsSummaryDownload:(BOOL)a3;
- (void)setRemindMeDate:(id)a3;
@end

@implementation _MFUserNotificationCenterControllerContext

- (NSString)ef_publicDescription
{
  uint64_t v3 = objc_opt_class();
  BOOL isSummaryDownload = self->_isSummaryDownload;
  BOOL isRemindMe = self->_isRemindMe;
  v6 = [(NSDate *)self->_remindMeDate description];
  v7 = +[NSString stringWithFormat:@"<%@: %p> isSummaryDownload=%d, isRemindMe=%d, remindMeDate=%@", v3, self, isSummaryDownload, isRemindMe, v6];

  return (NSString *)v7;
}

- (BOOL)isSummaryDownload
{
  return self->_isSummaryDownload;
}

- (void)setIsSummaryDownload:(BOOL)a3
{
  self->_BOOL isSummaryDownload = a3;
}

- (BOOL)isRemindMe
{
  return self->_isRemindMe;
}

- (void)setIsRemindMe:(BOOL)a3
{
  self->_BOOL isRemindMe = a3;
}

- (NSDate)remindMeDate
{
  return self->_remindMeDate;
}

- (void)setRemindMeDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end