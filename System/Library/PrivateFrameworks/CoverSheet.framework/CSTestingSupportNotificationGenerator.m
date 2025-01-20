@interface CSTestingSupportNotificationGenerator
- (id)_nextNotificationRequest;
- (void)postNewNotificationToDestination:(id)a3;
@end

@implementation CSTestingSupportNotificationGenerator

- (void)postNewNotificationToDestination:(id)a3
{
  id v4 = a3;
  id v5 = [(CSTestingSupportNotificationGenerator *)self _nextNotificationRequest];
  [v4 postNotificationRequest:v5];
}

- (id)_nextNotificationRequest
{
  v19[3] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1C9C8] date];
  int64_t sequenceNumber = self->_sequenceNumber;
  int64_t v5 = sequenceNumber + 1;
  self->_int64_t sequenceNumber = sequenceNumber + 1;
  if (sequenceNumber >= -1) {
    uint64_t v6 = sequenceNumber + 1;
  }
  else {
    uint64_t v6 = sequenceNumber + 2;
  }
  uint64_t v7 = v6 >> 1;
  id v8 = objc_alloc_init(MEMORY[0x1E4FB37B0]);
  [v8 setCustomHeader:@"Test Notification"];
  v9 = objc_msgSend(NSString, "stringWithFormat:", @"Test Notification %ld", v5);
  [v8 setTitle:v9];

  v10 = objc_msgSend(NSString, "stringWithFormat:", @"This is test notification #%ld", v5);
  [v8 setMessage:v10];

  [v8 setDate:v3];
  id v11 = objc_alloc_init(MEMORY[0x1E4FB37C0]);
  [v11 setSectionIdentifier:@"com.apple.springboard.coversheet.testing"];
  v12 = objc_msgSend(NSString, "stringWithFormat:", @"notification-%ld", v5);
  [v11 setNotificationIdentifier:v12];

  v13 = objc_msgSend(NSString, "stringWithFormat:", @"thread-%ld", v7);
  [v11 setThreadIdentifier:v13];

  [v11 setCategoryIdentifier:@"com.apple.springboard.coversheet.testing.testcategory"];
  [v11 setTimestamp:v3];
  v14 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v15 = *MEMORY[0x1E4FB3858];
  v19[0] = *MEMORY[0x1E4FB3860];
  v19[1] = v15;
  v19[2] = *MEMORY[0x1E4FB3868];
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
  v17 = [v14 setWithArray:v16];
  [v11 setRequestDestinations:v17];

  [v11 setContent:v8];

  return v11;
}

@end