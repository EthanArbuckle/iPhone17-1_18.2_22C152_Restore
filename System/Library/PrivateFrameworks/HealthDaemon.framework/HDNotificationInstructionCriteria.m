@interface HDNotificationInstructionCriteria
+ (BOOL)supportsSecureCoding;
+ (NSString)criteriaIdentifier;
- (BOOL)isEqual:(id)a3;
- (HDNotificationInstructionCriteria)initWithCodableNotificationInstructionCriteria:(id)a3;
- (HDNotificationInstructionCriteria)initWithCoder:(id)a3;
- (HDNotificationInstructionCriteria)initWithMessageDictionary:(id)a3;
- (id)codableCriteria;
- (id)messageDictionary;
- (int64_t)isValidWithDatabaseTransaction:(id)a3 error:(id *)a4;
- (unint64_t)hash;
@end

@implementation HDNotificationInstructionCriteria

+ (NSString)criteriaIdentifier
{
  return (NSString *)&stru_1F1728D60;
}

- (int64_t)isValidWithDatabaseTransaction:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  id v3 = a3;
  char v4 = [v3 isMemberOfClass:objc_opt_class()];

  return v4;
}

- (unint64_t)hash
{
  v2 = [(id)objc_opt_class() criteriaIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDNotificationInstructionCriteria)initWithCoder:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();

  return [(HDNotificationInstructionCriteria *)self init];
}

- (HDNotificationInstructionCriteria)initWithMessageDictionary:(id)a3
{
  return 0;
}

- (id)messageDictionary
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (HDNotificationInstructionCriteria)initWithCodableNotificationInstructionCriteria:(id)a3
{
  return 0;
}

- (id)codableCriteria
{
  v2 = objc_alloc_init(HDCodableNotificationInstructionCriteria);
  unint64_t v3 = [(id)objc_opt_class() criteriaIdentifier];
  [(HDCodableNotificationInstructionCriteria *)v2 setIdentifier:v3];

  return v2;
}

@end