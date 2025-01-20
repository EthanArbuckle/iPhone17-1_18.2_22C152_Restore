@interface CalDAVCalendarItemData
- (CalDAVCalendarServerScheduleChangesItem)scheduleChanges;
- (CalDAVUpdateOwnerItem)createdBy;
- (CalDAVUpdateOwnerItem)updatedBy;
- (NSString)scheduleTag;
- (void)setCreatedBy:(id)a3;
- (void)setScheduleChanges:(id)a3;
- (void)setScheduleTag:(id)a3;
- (void)setUpdatedBy:(id)a3;
@end

@implementation CalDAVCalendarItemData

- (NSString)scheduleTag
{
  return self->_scheduleTag;
}

- (void)setScheduleTag:(id)a3
{
}

- (CalDAVCalendarServerScheduleChangesItem)scheduleChanges
{
  return self->_scheduleChanges;
}

- (void)setScheduleChanges:(id)a3
{
}

- (CalDAVUpdateOwnerItem)createdBy
{
  return self->_createdBy;
}

- (void)setCreatedBy:(id)a3
{
}

- (CalDAVUpdateOwnerItem)updatedBy
{
  return self->_updatedBy;
}

- (void)setUpdatedBy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedBy, 0);
  objc_storeStrong((id *)&self->_createdBy, 0);
  objc_storeStrong((id *)&self->_scheduleChanges, 0);
  objc_storeStrong((id *)&self->_scheduleTag, 0);
}

@end