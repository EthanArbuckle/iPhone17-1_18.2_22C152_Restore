@interface IMDOffGridAvailabilityTrackerRecord
- (IMDHandle)handle;
- (NSDate)expirationDate;
- (void)setExpirationDate:(id)a3;
- (void)setHandle:(id)a3;
@end

@implementation IMDOffGridAvailabilityTrackerRecord

- (IMDHandle)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);

  objc_storeStrong((id *)&self->_handle, 0);
}

@end