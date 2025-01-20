@interface EventsFolderItemsSyncContext
- (int)calAlarmChangeId;
- (int)calAttachmentChangeId;
- (int)calAttendeeChangeId;
- (int)calEventChangeId;
- (int)calRecurrenceChangeId;
- (int)highestSequenceNumber;
- (void)setCalAlarmChangeId:(int)a3;
- (void)setCalAttachmentChangeId:(int)a3;
- (void)setCalAttendeeChangeId:(int)a3;
- (void)setCalEventChangeId:(int)a3;
- (void)setCalRecurrenceChangeId:(int)a3;
- (void)setHighestSequenceNumber:(int)a3;
@end

@implementation EventsFolderItemsSyncContext

- (int)calEventChangeId
{
  return self->_calEventChangeId;
}

- (void)setCalEventChangeId:(int)a3
{
  self->_calEventChangeId = a3;
}

- (int)calRecurrenceChangeId
{
  return self->_calRecurrenceChangeId;
}

- (void)setCalRecurrenceChangeId:(int)a3
{
  self->_calRecurrenceChangeId = a3;
}

- (int)calAlarmChangeId
{
  return self->_calAlarmChangeId;
}

- (void)setCalAlarmChangeId:(int)a3
{
  self->_calAlarmChangeId = a3;
}

- (int)calAttendeeChangeId
{
  return self->_calAttendeeChangeId;
}

- (void)setCalAttendeeChangeId:(int)a3
{
  self->_calAttendeeChangeId = a3;
}

- (int)calAttachmentChangeId
{
  return self->_calAttachmentChangeId;
}

- (void)setCalAttachmentChangeId:(int)a3
{
  self->_calAttachmentChangeId = a3;
}

- (int)highestSequenceNumber
{
  return self->_highestSequenceNumber;
}

- (void)setHighestSequenceNumber:(int)a3
{
  self->_highestSequenceNumber = a3;
}

@end