@interface EKAttendee
+ (Class)frozenClass;
+ (id)attendeeWithEmailAddress:(id)a3 name:(id)a4;
+ (id)attendeeWithName:(id)a3 emailAddress:(id)a4;
+ (id)attendeeWithName:(id)a3 emailAddress:(id)a4 address:(id)a5;
+ (id)attendeeWithName:(id)a3 phoneNumber:(id)a4;
+ (id)attendeeWithName:(id)a3 url:(id)a4;
+ (id)knownSingleValueKeysForComparison;
+ (int)_calAttendeeStatusFromEKParticipantStatus:(int64_t)a3;
+ (int64_t)_ekParticipantStatusFromCalAttendeeStatus:(int)a3;
- (BOOL)_isParticipantStatusDirty;
- (BOOL)_valueForFlag:(unsigned int)a3;
- (BOOL)commentChanged;
- (BOOL)hasProposedStartDate;
- (BOOL)isCurrentUser;
- (BOOL)proposedStartDateChanged;
- (BOOL)rsvpRequested;
- (BOOL)statusChanged;
- (NSDate)lastModifiedParticipationStatus;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)owner;
- (id)proposedStartDate;
- (id)proposedStartDateForEvent:(id)a3;
- (int)pendingStatusRaw;
- (int)proposedStartDateStatus;
- (int)statusRaw;
- (int64_t)participantRole;
- (int64_t)participantStatus;
- (int64_t)participantType;
- (int64_t)pendingStatus;
- (unsigned)flags;
- (void)_setFlag:(unsigned int)a3 value:(BOOL)a4;
- (void)markAsForward;
- (void)setCommentChanged:(BOOL)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setParticipantRole:(int64_t)a3;
- (void)setParticipantStatus:(int64_t)a3;
- (void)setParticipantType:(int64_t)a3;
- (void)setPendingStatus:(int64_t)a3;
- (void)setPendingStatusRaw:(int)a3;
- (void)setProposedStartDate:(id)a3;
- (void)setProposedStartDate:(id)a3 forEvent:(id)a4;
- (void)setProposedStartDateChanged:(BOOL)a3;
- (void)setProposedStartDateStatus:(int)a3;
- (void)setStatusChanged:(BOOL)a3;
- (void)setStatusRaw:(int)a3;
@end

@implementation EKAttendee

+ (int64_t)_ekParticipantStatusFromCalAttendeeStatus:(int)a3
{
  if (*MEMORY[0x1E4F56A68] == a3) {
    return -1;
  }
  if (a3 < 8) {
    return qword_1A4F90070[a3];
  }
  v5 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
    +[EKAttendee _ekParticipantStatusFromCalAttendeeStatus:](a3, v5);
  }
  return 0;
}

- (int64_t)participantStatus
{
  uint64_t v2 = [(EKAttendee *)self statusRaw];
  v3 = objc_opt_class();

  return [v3 _ekParticipantStatusFromCalAttendeeStatus:v2];
}

- (int)statusRaw
{
  uint64_t v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56B78]];
  int v3 = [v2 integerValue];

  return v3;
}

+ (Class)frozenClass
{
  return (Class)objc_opt_class();
}

+ (id)knownSingleValueKeysForComparison
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__EKAttendee_knownSingleValueKeysForComparison__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (knownSingleValueKeysForComparison_onceToken_5 != -1) {
    dispatch_once(&knownSingleValueKeysForComparison_onceToken_5, block);
  }
  uint64_t v2 = (void *)knownSingleValueKeysForComparison_keys_5;

  return v2;
}

void __47__EKAttendee_knownSingleValueKeysForComparison__block_invoke(uint64_t a1)
{
  v13[10] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F56B60];
  v13[0] = *MEMORY[0x1E4F56B48];
  v13[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F56B58];
  v13[2] = *MEMORY[0x1E4F56B68];
  v13[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4F56B78];
  v13[4] = *MEMORY[0x1E4F56B70];
  v13[5] = v4;
  uint64_t v5 = *MEMORY[0x1E4F571D0];
  v13[6] = *MEMORY[0x1E4F571C8];
  v13[7] = v5;
  uint64_t v6 = *MEMORY[0x1E4F571E0];
  v13[8] = *MEMORY[0x1E4F571B0];
  v13[9] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:10];
  v8 = (void *)knownSingleValueKeysForComparison_keys_5;
  knownSingleValueKeysForComparison_keys_5 = v7;

  v12.receiver = *(id *)(a1 + 32);
  v12.super_class = (Class)&OBJC_METACLASS___EKAttendee;
  v9 = objc_msgSendSuper2(&v12, sel_knownSingleValueKeysForComparison);
  uint64_t v10 = [v9 arrayByAddingObjectsFromArray:knownSingleValueKeysForComparison_keys_5];
  v11 = (void *)knownSingleValueKeysForComparison_keys_5;
  knownSingleValueKeysForComparison_keys_5 = v10;
}

+ (id)attendeeWithEmailAddress:(id)a3 name:(id)a4
{
  return (id)[a1 participantWithName:a4 emailAddress:a3 phoneNumber:0 url:0];
}

+ (id)attendeeWithName:(id)a3 url:(id)a4
{
  return (id)[a1 participantWithName:a3 emailAddress:0 phoneNumber:0 url:a4];
}

+ (id)attendeeWithName:(id)a3 emailAddress:(id)a4
{
  return (id)[a1 participantWithName:a3 emailAddress:a4 phoneNumber:0 url:0];
}

+ (id)attendeeWithName:(id)a3 phoneNumber:(id)a4
{
  return (id)[a1 participantWithName:a3 emailAddress:0 phoneNumber:a4 url:0];
}

+ (id)attendeeWithName:(id)a3 emailAddress:(id)a4 address:(id)a5
{
  return (id)[a1 participantWithName:a3 emailAddress:a4 phoneNumber:0 url:a5];
}

- (id)copyWithZone:(_NSZone *)a3
{
  if ([MEMORY[0x1E4F57690] isProgramSDKAtLeast:0x7E30901FFFFFFFFLL])
  {
    v11.receiver = self;
    v11.super_class = (Class)EKAttendee;
    return [(EKObject *)&v11 copyWithZone:a3];
  }
  else
  {
    uint64_t v6 = [(EKParticipant *)self name];
    uint64_t v7 = [(EKParticipant *)self emailAddress];
    v8 = [(EKParticipant *)self phoneNumber];
    v9 = [(EKParticipant *)self URL];
    uint64_t v5 = +[EKAttendee attendeeWithName:v6 emailAddress:v7 phoneNumber:v8 url:v9];

    if (v5)
    {
      objc_msgSend(v5, "setParticipantStatus:", -[EKAttendee participantStatus](self, "participantStatus"));
      objc_msgSend(v5, "setParticipantRole:", -[EKAttendee participantRole](self, "participantRole"));
      objc_msgSend(v5, "setParticipantType:", -[EKAttendee participantType](self, "participantType"));
      objc_msgSend(v5, "setPendingStatus:", -[EKAttendee pendingStatus](self, "pendingStatus"));
    }
  }
  return v5;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(EKParticipant *)self UUID];
  uint64_t v6 = [(EKParticipant *)self name];
  uint64_t v7 = [(EKParticipant *)self emailAddress];
  v8 = [(EKParticipant *)self phoneNumber];
  objc_msgSend(v3, "stringWithFormat:", @"%@ <%p> {UUID = %@; name = %@; email = %@; phone = %@; status = %ld; role = %ld; type = %ld}",
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    [(EKAttendee *)self participantStatus],
    [(EKAttendee *)self participantRole],
  v9 = [(EKAttendee *)self participantType]);

  return v9;
}

- (id)owner
{
  return [(EKObject *)self meltedAndCachedSingleRelationObjectForKey:@"owner"];
}

+ (int)_calAttendeeStatusFromEKParticipantStatus:(int64_t)a3
{
  int result = 7;
  switch(a3)
  {
    case -1:
      int result = *MEMORY[0x1E4F56A68];
      break;
    case 0:
      return result;
    case 1:
      int result = 0;
      break;
    case 2:
      int result = 1;
      break;
    case 3:
      int result = 2;
      break;
    case 4:
      int result = 3;
      break;
    case 5:
      int result = 4;
      break;
    case 6:
      int result = 5;
      break;
    case 7:
      int result = 6;
      break;
    default:
      int v4 = a3;
      uint64_t v5 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
        +[EKAttendee _calAttendeeStatusFromEKParticipantStatus:](v4, v5);
      }
      int result = 7;
      break;
  }
  return result;
}

- (void)setStatusRaw:(int)a3
{
  id v4 = [NSNumber numberWithInt:*(void *)&a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F56B78]];
}

- (void)setParticipantStatus:(int64_t)a3
{
  uint64_t v4 = [(id)objc_opt_class() _calAttendeeStatusFromEKParticipantStatus:a3];
  [(EKAttendee *)self setStatusRaw:v4];

  [(EKAttendee *)self setPendingStatusRaw:v4];
}

- (BOOL)_isParticipantStatusDirty
{
  return [(EKObject *)self _hasChangesForKey:*MEMORY[0x1E4F56B78]];
}

- (int64_t)participantRole
{
  uint64_t v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56B60]];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setParticipantRole:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F56B60]];
}

- (int)pendingStatusRaw
{
  uint64_t v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56B70]];
  int v3 = [v2 integerValue];

  return v3;
}

- (void)setPendingStatusRaw:(int)a3
{
  id v4 = [NSNumber numberWithInt:*(void *)&a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F56B70]];
}

- (int64_t)pendingStatus
{
  uint64_t v2 = [(EKAttendee *)self pendingStatusRaw];
  int v3 = objc_opt_class();

  return [v3 _ekParticipantStatusFromCalAttendeeStatus:v2];
}

- (void)setPendingStatus:(int64_t)a3
{
  uint64_t v4 = [(id)objc_opt_class() _calAttendeeStatusFromEKParticipantStatus:a3];

  [(EKAttendee *)self setPendingStatusRaw:v4];
}

- (int64_t)participantType
{
  uint64_t v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56B68]];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setParticipantType:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F56B68]];
}

- (NSDate)lastModifiedParticipationStatus
{
  return (NSDate *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56B58]];
}

- (BOOL)isCurrentUser
{
  if ([(EKObject *)self isNew]) {
    return 0;
  }
  id v4 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56B50]];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (unsigned)flags
{
  uint64_t v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F56B48]];
  unsigned int v3 = [v2 intValue];

  return v3;
}

- (void)setFlags:(unsigned int)a3
{
  id v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F56B48]];
}

- (void)_setFlag:(unsigned int)a3 value:(BOOL)a4
{
  BOOL v4 = a4;
  unsigned int v7 = [(EKAttendee *)self flags];
  if (v4) {
    uint64_t v8 = v7 | a3;
  }
  else {
    uint64_t v8 = v7 & ~a3;
  }

  [(EKAttendee *)self setFlags:v8];
}

- (BOOL)_valueForFlag:(unsigned int)a3
{
  return ([(EKAttendee *)self flags] & a3) != 0;
}

- (BOOL)commentChanged
{
  return [(EKAttendee *)self _valueForFlag:2];
}

- (void)setCommentChanged:(BOOL)a3
{
}

- (BOOL)statusChanged
{
  return [(EKAttendee *)self _valueForFlag:4];
}

- (void)setStatusChanged:(BOOL)a3
{
}

- (id)proposedStartDate
{
  uint64_t v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F571C8]];
  [v2 timeIntervalSinceReferenceDate];
  if (fabs(v3) >= 2.22044605e-16) {
    id v4 = v2;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (void)setProposedStartDate:(id)a3
{
}

- (BOOL)hasProposedStartDate
{
  uint64_t v2 = [(EKAttendee *)self proposedStartDate];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)proposedStartDateForEvent:(id)a3
{
  id v4 = a3;
  char v5 = [(EKAttendee *)self proposedStartDate];
  id v10 = 0;
  id v6 = (id)[v4 adjustedPersistedDateForDate:v5 withAdjustmentMode:1 pinMode:0 clientCalendarDate:&v10];
  id v7 = v10;

  uint64_t v8 = [v7 date];

  return v8;
}

- (void)setProposedStartDate:(id)a3 forEvent:(id)a4
{
  id v8 = [a4 adjustedPersistedDateForDate:a3 withAdjustmentMode:0 pinMode:0 clientCalendarDate:0];
  id v6 = [(EKAttendee *)self proposedStartDate];
  char v7 = [v8 isEqualToDate:v6];

  if ((v7 & 1) == 0)
  {
    [(EKAttendee *)self setProposedStartDate:v8];
    [(EKAttendee *)self setProposedStartDateStatus:0];
    if (a3)
    {
      if ([(EKAttendee *)self participantStatus] == 2
        || [(EKParticipant *)self needsResponse])
      {
        [(EKAttendee *)self setParticipantStatus:4];
      }
    }
  }
}

- (int)proposedStartDateStatus
{
  uint64_t v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F571D0]];
  int v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)setProposedStartDateStatus:(int)a3
{
  id v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F571D0]];
}

- (BOOL)proposedStartDateChanged
{
  return [(EKAttendee *)self _valueForFlag:8];
}

- (void)setProposedStartDateChanged:(BOOL)a3
{
}

- (void)markAsForward
{
}

- (BOOL)rsvpRequested
{
  return [(EKAttendee *)self _valueForFlag:1];
}

+ (void)_ekParticipantStatusFromCalAttendeeStatus:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A4E47000, a2, OS_LOG_TYPE_ERROR, "Unexpected CalAttendeeStatus: %d", (uint8_t *)v2, 8u);
}

+ (void)_calAttendeeStatusFromEKParticipantStatus:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A4E47000, a2, OS_LOG_TYPE_ERROR, "Unexpected EKParticipantStatus: %d", (uint8_t *)v2, 8u);
}

@end