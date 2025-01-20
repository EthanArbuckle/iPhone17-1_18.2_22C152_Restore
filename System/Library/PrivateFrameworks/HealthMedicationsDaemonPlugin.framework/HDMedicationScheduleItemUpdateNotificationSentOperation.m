@interface HDMedicationScheduleItemUpdateNotificationSentOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5;
- (HDMedicationScheduleItemUpdateNotificationSentOperation)init;
- (HDMedicationScheduleItemUpdateNotificationSentOperation)initWithCoder:(id)a3;
- (HDMedicationScheduleItemUpdateNotificationSentOperation)initWithScheduleItemIdentifier:(id)a3 notificationSent:(BOOL)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDMedicationScheduleItemUpdateNotificationSentOperation

- (HDMedicationScheduleItemUpdateNotificationSentOperation)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDMedicationScheduleItemUpdateNotificationSentOperation)initWithScheduleItemIdentifier:(id)a3 notificationSent:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDMedicationScheduleItemUpdateNotificationSentOperation;
  v8 = [(HDMedicationScheduleItemUpdateNotificationSentOperation *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_itemIdentifier, a3);
    v9->_notificationSent = a4;
  }

  return v9;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  return +[HDMedicationScheduleItemEntity updateNotification:self->_notificationSent itemIdentifier:self->_itemIdentifier transaction:a4 error:a5];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  itemIdentifier = self->_itemIdentifier;
  id v5 = a3;
  [v5 encodeObject:itemIdentifier forKey:@"item_identifier"];
  [v5 encodeBool:self->_notificationSent forKey:@"notification_sent"];
}

- (HDMedicationScheduleItemUpdateNotificationSentOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDMedicationScheduleItemUpdateNotificationSentOperation;
  id v5 = [(HDMedicationScheduleItemUpdateNotificationSentOperation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"item_identifier"];
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v6;

    v5->_notificationSent = [v4 decodeBoolForKey:@"notification_sent"];
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end