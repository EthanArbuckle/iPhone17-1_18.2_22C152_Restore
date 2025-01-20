@interface PFUBLogEventID
+ (void)initialize;
- (PFUBLogEventID)initWithCustomKey:(id)a3;
- (PFUBLogEventID)initWithEventType:(int)a3;
- (int64_t)hash;
@end

@implementation PFUBLogEventID

+ (void)initialize
{
}

- (PFUBLogEventID)initWithEventType:(int)a3
{
  int64_t v4 = a3;
  char v5 = 0;
  v6 = @"PFUbiquitySetup";
  switch(a3)
  {
    case 0:
      break;
    case 1:
      char v5 = 0;
      v6 = @"PFUbiquityTransactionExport";
      break;
    case 2:
      char v5 = 0;
      v6 = @"PFUbiquityTransactionImport";
      break;
    case 3:
      char v5 = 0;
      v6 = @"PFUbiquityTransactionConflict";
      break;
    case 4:
      char v5 = 0;
      v6 = @"PFUbiquityBaselineRoll";
      break;
    default:
      NSLog((NSString *)@"Invalid EventType %u", a2, a3);
      v6 = 0;
      char v5 = 1;
      break;
  }
  v12.receiver = self;
  v12.super_class = (Class)PFUBLogEventID;
  v7 = [(PFUBLogEventID *)&v12 init];
  v8 = v7;
  if (v7)
  {
    if (v5)
    {

      return 0;
    }
    else
    {
      uint64_t v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
      v8->_eventType = v4;
      v10 = (NSString *)[[NSString alloc] initWithFormat:@"%@:%@", v6, v9];
      v8->_idString = v10;
      v8->_hash = +[_PFRoutines _generateUbiquityHashForPath:]((uint64_t)_PFRoutines, v10);
    }
  }
  return v8;
}

- (PFUBLogEventID)initWithCustomKey:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PFUBLogEventID;
  int64_t v4 = [(PFUBLogEventID *)&v9 init];
  char v5 = v4;
  if (v4)
  {
    if (a3)
    {
      uint64_t v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
      v5->_eventType = 5;
      v7 = (NSString *)[[NSString alloc] initWithFormat:@"%@:%@", a3, v6];
      v5->_idString = v7;
      v5->_hash = +[_PFRoutines _generateUbiquityHashForPath:]((uint64_t)_PFRoutines, v7);
    }
    else
    {

      return 0;
    }
  }
  return v5;
}

- (int64_t)hash
{
  return self->_hash;
}

@end