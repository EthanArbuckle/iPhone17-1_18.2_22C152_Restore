@interface HDSummarySharingEntryUpdateNotificationStatusOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5;
- (HDSummarySharingEntryUpdateNotificationStatusOperation)init;
- (HDSummarySharingEntryUpdateNotificationStatusOperation)initWithCoder:(id)a3;
- (HDSummarySharingEntryUpdateNotificationStatusOperation)initWithInvitationUUID:(id)a3 notificationStatus:(int64_t)a4 dateModified:(id)a5;
- (HKSummarySharingEntry)sharingEntry;
- (NSDate)dateModified;
- (NSUUID)invitationUUID;
- (int64_t)notificationStatus;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDSummarySharingEntryUpdateNotificationStatusOperation

- (HDSummarySharingEntryUpdateNotificationStatusOperation)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDSummarySharingEntryUpdateNotificationStatusOperation)initWithInvitationUUID:(id)a3 notificationStatus:(int64_t)a4 dateModified:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HDSummarySharingEntryUpdateNotificationStatusOperation;
  v10 = [(HDSummarySharingEntryUpdateNotificationStatusOperation *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    invitationUUID = v10->_invitationUUID;
    v10->_invitationUUID = (NSUUID *)v11;

    v10->_notificationStatus = a4;
    uint64_t v13 = [v9 copy];
    dateModified = v10->_dateModified;
    v10->_dateModified = (NSDate *)v13;
  }
  return v10;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = +[HDSummarySharingEntryEntity updateNotificationStatusForInvitiationWithUUID:self->_invitationUUID newNotificationStatus:self->_notificationStatus dateModified:self->_dateModified profile:v8 error:a5];
  if (v10)
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__209;
    v20 = __Block_byref_object_dispose__209;
    id v21 = 0;
    uint64_t v11 = HDSummarySharingEntryPredicateForInvitationUUID((uint64_t)self->_invitationUUID);
    v12 = [v8 sharingEntryManager];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __95__HDSummarySharingEntryUpdateNotificationStatusOperation_performWithProfile_transaction_error___block_invoke;
    v15[3] = &unk_1E62FD088;
    v15[4] = &v16;
    int v13 = [v12 enumerateCodableEntriesWithPredicate:v11 error:a5 handler:v15];

    if (v13) {
      objc_storeStrong((id *)&self->_sharingEntry, (id)v17[5]);
    }

    _Block_object_dispose(&v16, 8);
  }

  return v10;
}

uint64_t __95__HDSummarySharingEntryUpdateNotificationStatusOperation_performWithProfile_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 sharingEntry];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDSummarySharingEntryUpdateNotificationStatusOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"InvitationUUID"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"NotificationStatus"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DateModified"];

  id v8 = [(HDSummarySharingEntryUpdateNotificationStatusOperation *)self initWithInvitationUUID:v5 notificationStatus:v6 dateModified:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  invitationUUID = self->_invitationUUID;
  id v5 = a3;
  [v5 encodeObject:invitationUUID forKey:@"InvitationUUID"];
  [v5 encodeInteger:self->_notificationStatus forKey:@"NotificationStatus"];
  [v5 encodeObject:self->_dateModified forKey:@"DateModified"];
}

- (NSUUID)invitationUUID
{
  return self->_invitationUUID;
}

- (int64_t)notificationStatus
{
  return self->_notificationStatus;
}

- (NSDate)dateModified
{
  return self->_dateModified;
}

- (HKSummarySharingEntry)sharingEntry
{
  return self->_sharingEntry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingEntry, 0);
  objc_storeStrong((id *)&self->_dateModified, 0);

  objc_storeStrong((id *)&self->_invitationUUID, 0);
}

@end