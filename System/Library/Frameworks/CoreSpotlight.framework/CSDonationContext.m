@interface CSDonationContext
- (CSEventFeedback)feedback;
- (NSNumber)serialNumber;
- (NSString)bundleID;
- (NSString)protectionClass;
- (const)indexTypeName;
- (id)completionHandler;
- (unint64_t)spidHandleDonation;
- (unint64_t)startTime;
- (void)setBundleID:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setFeedback:(id)a3;
- (void)setIndexTypeName:(const char *)a3;
- (void)setProtectionClass:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setSpidHandleDonation:(unint64_t)a3;
- (void)setStartTime:(unint64_t)a3;
@end

@implementation CSDonationContext

- (NSNumber)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)protectionClass
{
  return self->_protectionClass;
}

- (void)setProtectionClass:(id)a3
{
}

- (unint64_t)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(unint64_t)a3
{
  self->_startTime = a3;
}

- (const)indexTypeName
{
  return self->_indexTypeName;
}

- (void)setIndexTypeName:(const char *)a3
{
  self->_indexTypeName = a3;
}

- (CSEventFeedback)feedback
{
  return self->_feedback;
}

- (void)setFeedback:(id)a3
{
}

- (unint64_t)spidHandleDonation
{
  return self->_spidHandleDonation;
}

- (void)setSpidHandleDonation:(unint64_t)a3
{
  self->_spidHandleDonation = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_feedback, 0);
  objc_storeStrong((id *)&self->_protectionClass, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_serialNumber, 0);
}

@end