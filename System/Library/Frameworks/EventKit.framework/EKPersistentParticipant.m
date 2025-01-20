@interface EKPersistentParticipant
+ (id)defaultPropertiesToLoad;
+ (id)propertyKeyForUniqueIdentifier;
- (BOOL)scheduleForceSend;
- (id)URLString;
- (id)UUID;
- (id)comment;
- (id)commentLastModifiedDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)displayNameRaw;
- (id)emailAddress;
- (id)firstName;
- (id)inviterNameString;
- (id)lastName;
- (id)owner;
- (id)phoneNumber;
- (id)proposedStartDate;
- (id)semanticIdentifier;
- (id)url;
- (int)proposedStartDateStatus;
- (int)scheduleStatus;
- (void)setComment:(id)a3;
- (void)setCommentLastModifiedDate:(id)a3;
- (void)setDisplayNameRaw:(id)a3;
- (void)setEmailAddress:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setInviterNameString:(id)a3;
- (void)setLastName:(id)a3;
- (void)setOwner:(id)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setProposedStartDate:(id)a3;
- (void)setProposedStartDateStatus:(int)a3;
- (void)setScheduleForceSend:(BOOL)a3;
- (void)setScheduleStatus:(int)a3;
- (void)setURLString:(id)a3;
- (void)setUUID:(id)a3;
@end

@implementation EKPersistentParticipant

- (id)displayNameRaw
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F57198]];
}

- (id)phoneNumber
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F571C0]];
}

- (id)lastName
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F571B8]];
}

- (id)firstName
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F571A8]];
}

- (id)emailAddress
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F571A0]];
}

- (id)inviterNameString
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F571B0]];
}

- (id)comment
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F57188]];
}

- (id)URLString
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F57180]];
}

void __50__EKPersistentParticipant_defaultPropertiesToLoad__block_invoke()
{
  v5[7] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F571A8];
  v5[0] = *MEMORY[0x1E4F57198];
  v5[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F57150];
  v5[2] = *MEMORY[0x1E4F571B8];
  v5[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F571C0];
  v5[4] = *MEMORY[0x1E4F571A0];
  v5[5] = v2;
  v5[6] = *MEMORY[0x1E4F57180];
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:7];
  v4 = (void *)defaultPropertiesToLoad_defaultPropertiesToLoad_10;
  defaultPropertiesToLoad_defaultPropertiesToLoad_10 = v3;
}

+ (id)defaultPropertiesToLoad
{
  if (defaultPropertiesToLoad_onceToken_11 != -1) {
    dispatch_once(&defaultPropertiesToLoad_onceToken_11, &__block_literal_global_69);
  }
  uint64_t v2 = (void *)defaultPropertiesToLoad_defaultPropertiesToLoad_10;

  return v2;
}

+ (id)propertyKeyForUniqueIdentifier
{
  return (id)*MEMORY[0x1E4F57150];
}

- (id)UUID
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F57150]];
}

- (void)setUUID:(id)a3
{
}

- (void)setDisplayNameRaw:(id)a3
{
}

- (void)setEmailAddress:(id)a3
{
}

- (void)setPhoneNumber:(id)a3
{
}

- (void)setFirstName:(id)a3
{
}

- (void)setLastName:(id)a3
{
}

- (void)setURLString:(id)a3
{
}

- (void)setComment:(id)a3
{
}

- (id)commentLastModifiedDate
{
  return [(EKPersistentObject *)self primitiveDateValueForKey:*MEMORY[0x1E4F57190]];
}

- (void)setCommentLastModifiedDate:(id)a3
{
}

- (id)owner
{
  return [(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F57160]];
}

- (void)setOwner:(id)a3
{
}

- (id)proposedStartDate
{
  return [(EKPersistentObject *)self primitiveDateValueForKey:*MEMORY[0x1E4F571C8]];
}

- (void)setProposedStartDate:(id)a3
{
}

- (void)setInviterNameString:(id)a3
{
}

- (int)proposedStartDateStatus
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F571D0]];
}

- (void)setProposedStartDateStatus:(int)a3
{
}

- (int)scheduleStatus
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F571E0]];
}

- (void)setScheduleStatus:(int)a3
{
}

- (BOOL)scheduleForceSend
{
  return [(EKPersistentObject *)self primitiveBoolValueForKey:*MEMORY[0x1E4F571D8]];
}

- (void)setScheduleForceSend:(BOOL)a3
{
}

- (id)url
{
  uint64_t v3 = [(EKPersistentParticipant *)self URLString];
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E4F1CB10];
    v5 = [(EKPersistentParticipant *)self URLString];
    v6 = [v4 URLWithString:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)semanticIdentifier
{
  uint64_t v3 = [(EKPersistentParticipant *)self emailAddress];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = [(EKPersistentParticipant *)self phoneNumber];
    v7 = v6;
    if (v6)
    {
      id v5 = v6;
    }
    else
    {
      v8 = [(EKPersistentParticipant *)self URLString];
      v9 = v8;
      if (v8)
      {
        id v5 = v8;
      }
      else
      {
        v10 = [(EKPersistentParticipant *)self displayNameRaw];
        v11 = v10;
        if (v10)
        {
          id v5 = v10;
        }
        else
        {
          uint64_t v12 = [(EKPersistentParticipant *)self firstName];
          uint64_t v13 = [(EKPersistentParticipant *)self lastName];
          if (v12 | v13)
          {
            v14 = [MEMORY[0x1E4F28E78] string];
            v15 = v14;
            if (v12) {
              [v14 appendFormat:@"FIRST=%@;", v12];
            }
            if (v13) {
              [v15 appendFormat:@"LAST=%@;", v13];
            }
            id v5 = (id)[v15 copy];
          }
          else
          {
            id v5 = 0;
          }
        }
      }
    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();

  return self;
}

@end