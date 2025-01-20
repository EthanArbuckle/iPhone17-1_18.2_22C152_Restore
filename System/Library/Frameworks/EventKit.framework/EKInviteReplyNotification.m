@interface EKInviteReplyNotification
+ (Class)frozenClass;
+ (id)knownRelationshipSingleValueKeys;
+ (id)sourceForInviteReplyNotification:(id)a3;
- (BOOL)alerted;
- (BOOL)validate:(id *)a3;
- (EKCalendar)inviteReplyCalendar;
- (EKInviteReplyNotification)initWithInviteReplyCalendar:(id)a3;
- (NSDate)creationDate;
- (NSString)inReplyTo;
- (NSString)shareeDisplayName;
- (NSString)shareeEmailAddress;
- (NSString)shareeFirstName;
- (NSString)shareeLastName;
- (NSString)shareePhoneNumber;
- (NSString)summary;
- (NSURL)shareeURL;
- (id)shareeURLString;
- (unint64_t)shareeStatus;
- (void)_setInviteReplyCalendar:(id)a3;
- (void)clearAlertedStatus;
- (void)setCreationDate:(id)a3;
- (void)setInReplyTo:(id)a3;
- (void)setShareeDisplayName:(id)a3;
- (void)setShareeFirstName:(id)a3;
- (void)setShareeLastName:(id)a3;
- (void)setShareeStatus:(unint64_t)a3;
- (void)setShareeURL:(id)a3;
- (void)setShareeURLString:(id)a3;
- (void)setSummary:(id)a3;
@end

@implementation EKInviteReplyNotification

+ (Class)frozenClass
{
  return (Class)objc_opt_class();
}

+ (id)knownRelationshipSingleValueKeys
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__EKInviteReplyNotification_knownRelationshipSingleValueKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (knownRelationshipSingleValueKeys_onceToken_0 != -1) {
    dispatch_once(&knownRelationshipSingleValueKeys_onceToken_0, block);
  }
  v2 = (void *)knownRelationshipSingleValueKeys_keys_0;

  return v2;
}

void __61__EKInviteReplyNotification_knownRelationshipSingleValueKeys__block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v9[0] = *MEMORY[0x1E4F57108];
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  v3 = (void *)knownRelationshipSingleValueKeys_keys_0;
  knownRelationshipSingleValueKeys_keys_0 = v2;

  v4 = (void *)knownRelationshipSingleValueKeys_keys_0;
  v8.receiver = *(id *)(a1 + 32);
  v8.super_class = (Class)&OBJC_METACLASS___EKInviteReplyNotification;
  v5 = objc_msgSendSuper2(&v8, sel_knownRelationshipSingleValueKeys);
  uint64_t v6 = [v4 arrayByAddingObjectsFromArray:v5];
  v7 = (void *)knownRelationshipSingleValueKeys_keys_0;
  knownRelationshipSingleValueKeys_keys_0 = v6;
}

+ (id)sourceForInviteReplyNotification:(id)a3
{
  v3 = [a3 calendar];
  v4 = [v3 source];

  return v4;
}

- (EKInviteReplyNotification)initWithInviteReplyCalendar:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EKInviteReplyNotification;
  v5 = [(EKObject *)&v8 init];
  uint64_t v6 = v5;
  if (v5) {
    [(EKInviteReplyNotification *)v5 _setInviteReplyCalendar:v4];
  }

  return v6;
}

- (EKCalendar)inviteReplyCalendar
{
  return (EKCalendar *)[(EKObject *)self meltedAndCachedSingleRelationObjectForKey:*MEMORY[0x1E4F57108]];
}

- (void)_setInviteReplyCalendar:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F57108];
  id v5 = a3;
  [(EKObject *)self updateMeltedAndCachedSingleRelationObject:v5 forKey:v4 frozenClass:+[EKCalendar frozenClass]];
}

- (NSString)inReplyTo
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57100]];
}

- (void)setInReplyTo:(id)a3
{
}

- (NSString)shareeDisplayName
{
  v3 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57120]];
  if (!v3)
  {
    uint64_t v4 = [(EKInviteReplyNotification *)self shareeFirstName];
    id v5 = [(EKInviteReplyNotification *)self shareeLastName];
    v3 = DisplayNameStringForIdentityWithProperties();
  }

  return (NSString *)v3;
}

- (void)setShareeDisplayName:(id)a3
{
}

- (NSString)shareeFirstName
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57128]];
}

- (void)setShareeFirstName:(id)a3
{
}

- (NSString)shareeLastName
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57130]];
}

- (void)setShareeLastName:(id)a3
{
}

- (id)shareeURLString
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57140]];
}

- (void)setShareeURLString:(id)a3
{
}

- (NSURL)shareeURL
{
  uint64_t v2 = [(EKInviteReplyNotification *)self shareeURLString];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
  }
  else
  {
    v3 = 0;
  }

  return (NSURL *)v3;
}

- (void)setShareeURL:(id)a3
{
  id v4 = [a3 absoluteString];
  [(EKInviteReplyNotification *)self setShareeURLString:v4];
}

- (unint64_t)shareeStatus
{
  uint64_t v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57138]];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)setShareeStatus:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F57138]];
}

- (NSDate)creationDate
{
  return (NSDate *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F570E8]];
}

- (void)setCreationDate:(id)a3
{
}

- (NSString)summary
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57148]];
}

- (void)setSummary:(id)a3
{
}

- (NSString)shareeEmailAddress
{
  uint64_t v2 = [(EKInviteReplyNotification *)self shareeURL];
  unint64_t v3 = objc_msgSend(v2, "cal_emailAddressString");

  return (NSString *)v3;
}

- (NSString)shareePhoneNumber
{
  uint64_t v2 = [(EKInviteReplyNotification *)self shareeURL];
  unint64_t v3 = objc_msgSend(v2, "cal_phoneNumberString");

  return (NSString *)v3;
}

- (BOOL)alerted
{
  uint64_t v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F570D8]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)clearAlertedStatus
{
  id v2 = [(EKObject *)self persistentObject];
  [v2 unloadPropertyForKey:*MEMORY[0x1E4F570D8]];
}

- (BOOL)validate:(id *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)EKInviteReplyNotification;
  BOOL v5 = -[EKObject validate:](&v9, sel_validate_);
  if (v5)
  {
    uint64_t v6 = [(EKInviteReplyNotification *)self inviteReplyCalendar];

    if (v6)
    {
      LOBYTE(v5) = 1;
    }
    else if (a3)
    {
      id v7 = [MEMORY[0x1E4F28C58] errorWithEKErrorCode:31];
      LOBYTE(v5) = 0;
      *a3 = v7;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

@end