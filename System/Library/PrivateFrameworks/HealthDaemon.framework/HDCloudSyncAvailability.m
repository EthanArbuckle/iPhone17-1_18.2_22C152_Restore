@interface HDCloudSyncAvailability
- (BOOL)shouldPull;
- (BOOL)shouldPush;
- (BOOL)shouldSyncAttachments;
- (BOOL)shouldSyncDeviceContext;
- (BOOL)shouldSyncMedicalID;
- (BOOL)shouldSyncStateEntities;
- (BOOL)shouldSyncSummarySharingPull;
- (BOOL)shouldSyncSummarySharingPush;
- (HDCloudSyncAvailability)initWithProfileType:(int64_t)a3 behavior:(id)a4;
- (void)_setShouldPullWithProfileType:(int64_t)a3;
- (void)_setShouldPushWithProfileType:(int64_t)a3;
- (void)_setShouldSyncAttachmentsWithProfileType:(int64_t)a3;
- (void)_setShouldSyncDeviceContextWithProfileType:(int64_t)a3;
- (void)_setShouldSyncMedicalIDWithProfileType:(int64_t)a3;
- (void)_setShouldSyncStateEntitiesWithProfileType:(int64_t)a3;
- (void)_setShouldSyncSummarySharingPullWithProfileType:(int64_t)a3 behavior:(id)a4;
- (void)_setShouldSyncSummarySharingPushWithProfileType:(int64_t)a3 behavior:(id)a4;
@end

@implementation HDCloudSyncAvailability

- (HDCloudSyncAvailability)initWithProfileType:(int64_t)a3 behavior:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)HDCloudSyncAvailability;
  v7 = [(HDCloudSyncAvailability *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(HDCloudSyncAvailability *)v7 _setShouldPullWithProfileType:a3];
    [(HDCloudSyncAvailability *)v8 _setShouldPushWithProfileType:a3];
    [(HDCloudSyncAvailability *)v8 _setShouldSyncMedicalIDWithProfileType:a3];
    [(HDCloudSyncAvailability *)v8 _setShouldSyncSummarySharingPushWithProfileType:a3 behavior:v6];
    [(HDCloudSyncAvailability *)v8 _setShouldSyncSummarySharingPullWithProfileType:a3 behavior:v6];
    [(HDCloudSyncAvailability *)v8 _setShouldSyncAttachmentsWithProfileType:a3];
    [(HDCloudSyncAvailability *)v8 _setShouldSyncDeviceContextWithProfileType:a3];
    [(HDCloudSyncAvailability *)v8 _setShouldSyncStateEntitiesWithProfileType:a3];
  }

  return v8;
}

- (void)_setShouldPullWithProfileType:(int64_t)a3
{
  BOOL v3 = 1;
  if (a3 <= 2)
  {
    if (a3 != 1)
    {
      if (a3 != 2) {
        return;
      }
      BOOL v3 = 0;
    }
LABEL_8:
    self->_shouldPull = v3;
    return;
  }
  if ((unint64_t)(a3 - 3) < 2 || a3 == 100) {
    goto LABEL_8;
  }
}

- (void)_setShouldPushWithProfileType:(int64_t)a3
{
  BOOL v3 = 1;
  if (a3 <= 2)
  {
    if (a3 != 1)
    {
      if (a3 != 2) {
        return;
      }
      BOOL v3 = 0;
    }
LABEL_8:
    self->_shouldPush = v3;
    return;
  }
  if ((unint64_t)(a3 - 3) < 2 || a3 == 100) {
    goto LABEL_8;
  }
}

- (void)_setShouldSyncMedicalIDWithProfileType:(int64_t)a3
{
  BOOL v3 = 1;
  if (a3 <= 2)
  {
    if (a3 != 1)
    {
      if (a3 != 2) {
        return;
      }
      BOOL v3 = 0;
    }
LABEL_8:
    self->_shouldSyncMedicalID = v3;
    return;
  }
  if ((unint64_t)(a3 - 3) < 2 || a3 == 100) {
    goto LABEL_8;
  }
}

- (void)_setShouldSyncSummarySharingPushWithProfileType:(int64_t)a3 behavior:(id)a4
{
  id v8 = a4;
  if ([v8 isAppleWatch] & 1) != 0 || (objc_msgSend(v8, "isRealityDevice"))
  {
    BOOL v6 = 0;
    v7 = v8;
LABEL_4:
    self->_shouldSyncSummarySharingPush = v6;
    goto LABEL_5;
  }
  v7 = v8;
  if ((unint64_t)(a3 - 2) < 3) {
    goto LABEL_11;
  }
  if (a3 == 1)
  {
    BOOL v6 = 1;
    goto LABEL_4;
  }
  if (a3 == 100)
  {
LABEL_11:
    BOOL v6 = 0;
    goto LABEL_4;
  }
LABEL_5:
}

- (void)_setShouldSyncSummarySharingPullWithProfileType:(int64_t)a3 behavior:(id)a4
{
  id v8 = a4;
  if ([v8 isAppleWatch] & 1) != 0 || (objc_msgSend(v8, "isRealityDevice"))
  {
    BOOL v6 = 0;
LABEL_4:
    v7 = v8;
LABEL_5:
    self->_shouldSyncSummarySharingPull = v6;
    goto LABEL_6;
  }
  if (a3 > 3)
  {
    v7 = v8;
    if (a3 == 100 || a3 == 4) {
      goto LABEL_16;
    }
  }
  else
  {
    if ((unint64_t)(a3 - 2) < 2)
    {
      BOOL v6 = 1;
      goto LABEL_4;
    }
    v7 = v8;
    if (a3 == 1)
    {
LABEL_16:
      BOOL v6 = 0;
      goto LABEL_5;
    }
  }
LABEL_6:
}

- (void)_setShouldSyncAttachmentsWithProfileType:(int64_t)a3
{
  BOOL v3 = 1;
  switch(a3)
  {
    case 1:
    case 3:
      goto LABEL_4;
    case 2:
    case 4:
      BOOL v3 = 0;
      goto LABEL_4;
    default:
      if (a3 == 100) {
LABEL_4:
      }
        self->_shouldSyncAttachments = v3;
      return;
  }
}

- (void)_setShouldSyncDeviceContextWithProfileType:(int64_t)a3
{
  BOOL v3 = 1;
  if (a3 <= 3)
  {
    if ((unint64_t)(a3 - 2) >= 2)
    {
      if (a3 != 1) {
        return;
      }
    }
    else
    {
      BOOL v3 = 0;
    }
    goto LABEL_6;
  }
  if (a3 == 4 || a3 == 100) {
LABEL_6:
  }
    self->_shouldSyncDeviceContext = v3;
}

- (void)_setShouldSyncStateEntitiesWithProfileType:(int64_t)a3
{
  BOOL v3 = 1;
  if (a3 <= 3)
  {
    if ((unint64_t)(a3 - 2) >= 2)
    {
      if (a3 != 1) {
        return;
      }
    }
    else
    {
      BOOL v3 = 0;
    }
    goto LABEL_6;
  }
  if (a3 == 4 || a3 == 100) {
LABEL_6:
  }
    self->_shouldSyncStateEntities = v3;
}

- (BOOL)shouldPull
{
  return self->_shouldPull;
}

- (BOOL)shouldPush
{
  return self->_shouldPush;
}

- (BOOL)shouldSyncMedicalID
{
  return self->_shouldSyncMedicalID;
}

- (BOOL)shouldSyncSummarySharingPush
{
  return self->_shouldSyncSummarySharingPush;
}

- (BOOL)shouldSyncSummarySharingPull
{
  return self->_shouldSyncSummarySharingPull;
}

- (BOOL)shouldSyncAttachments
{
  return self->_shouldSyncAttachments;
}

- (BOOL)shouldSyncDeviceContext
{
  return self->_shouldSyncDeviceContext;
}

- (BOOL)shouldSyncStateEntities
{
  return self->_shouldSyncStateEntities;
}

@end