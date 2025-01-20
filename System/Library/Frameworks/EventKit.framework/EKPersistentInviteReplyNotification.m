@interface EKPersistentInviteReplyNotification
+ (Class)meltedClass;
+ (id)defaultPropertiesToLoad;
+ (id)relations;
- (BOOL)alerted;
- (id)creationDate;
- (id)inReplyTo;
- (id)inviteReplyCalendar;
- (id)shareeDisplayName;
- (id)shareeFirstName;
- (id)shareeLastName;
- (id)shareeURLString;
- (id)summary;
- (int)entityType;
- (unint64_t)shareeStatus;
- (void)setCreationDate:(id)a3;
- (void)setInReplyTo:(id)a3;
- (void)setInviteReplyCalendar:(id)a3;
- (void)setShareeDisplayName:(id)a3;
- (void)setShareeFirstName:(id)a3;
- (void)setShareeLastName:(id)a3;
- (void)setShareeStatus:(unint64_t)a3;
- (void)setShareeURLString:(id)a3;
- (void)setSummary:(id)a3;
@end

@implementation EKPersistentInviteReplyNotification

+ (id)defaultPropertiesToLoad
{
  if (defaultPropertiesToLoad_onceToken_8 != -1) {
    dispatch_once(&defaultPropertiesToLoad_onceToken_8, &__block_literal_global_50);
  }
  v2 = (void *)defaultPropertiesToLoad_defaultPropertiesToLoad_7;

  return v2;
}

void __62__EKPersistentInviteReplyNotification_defaultPropertiesToLoad__block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F57120];
  v3[0] = *MEMORY[0x1E4F57148];
  v3[1] = v0;
  v3[2] = *MEMORY[0x1E4F570D8];
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:3];
  v2 = (void *)defaultPropertiesToLoad_defaultPropertiesToLoad_7;
  defaultPropertiesToLoad_defaultPropertiesToLoad_7 = v1;
}

+ (id)relations
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__EKPersistentInviteReplyNotification_relations__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (relations_onceToken_12 != -1) {
    dispatch_once(&relations_onceToken_12, block);
  }
  v2 = (void *)relations_relations_12;

  return v2;
}

void __48__EKPersistentInviteReplyNotification_relations__block_invoke(uint64_t a1)
{
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)&OBJC_METACLASS___EKPersistentInviteReplyNotification;
  uint64_t v1 = objc_msgSendSuper2(&v6, sel_relations);
  uint64_t v2 = [v1 mutableCopy];
  v3 = (void *)relations_relations_12;
  relations_relations_12 = v2;

  v4 = (void *)relations_relations_12;
  v5 = +[EKRelation relationWithEntityName:@"Calendar" toMany:0 inversePropertyNames:0 ownsRelated:0];
  [v4 setObject:v5 forKey:*MEMORY[0x1E4F57108]];
}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

- (int)entityType
{
  return 16;
}

- (id)inReplyTo
{
  return [(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F57100]];
}

- (void)setInReplyTo:(id)a3
{
}

- (id)shareeDisplayName
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F57120]];
}

- (void)setShareeDisplayName:(id)a3
{
}

- (id)shareeFirstName
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F57128]];
}

- (void)setShareeFirstName:(id)a3
{
}

- (id)shareeLastName
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F57130]];
}

- (void)setShareeLastName:(id)a3
{
}

- (id)shareeURLString
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F57140]];
}

- (void)setShareeURLString:(id)a3
{
}

- (unint64_t)shareeStatus
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F57138]];
}

- (void)setShareeStatus:(unint64_t)a3
{
}

- (id)creationDate
{
  return [(EKPersistentObject *)self primitiveDateValueForKey:*MEMORY[0x1E4F570E8]];
}

- (void)setCreationDate:(id)a3
{
}

- (id)summary
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F57148]];
}

- (void)setSummary:(id)a3
{
}

- (BOOL)alerted
{
  return [(EKPersistentObject *)self primitiveBoolValueForKey:*MEMORY[0x1E4F570D8]];
}

- (id)inviteReplyCalendar
{
  return [(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F57108]];
}

- (void)setInviteReplyCalendar:(id)a3
{
}

@end