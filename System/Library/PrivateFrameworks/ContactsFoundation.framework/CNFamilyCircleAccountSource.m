@interface CNFamilyCircleAccountSource
- (CNFamilyCircleAccountSource)initWithFamilyCircle:(id)a3;
- (FAFamilyCircle)familyCircle;
- (NSString)description;
- (id)delegateAccounts;
- (id)myFamilyMemberRecord;
- (id)primaryAccount;
@end

@implementation CNFamilyCircleAccountSource

- (CNFamilyCircleAccountSource)initWithFamilyCircle:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNFamilyCircleAccountSource;
  v6 = [(CNFamilyCircleAccountSource *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_familyCircle, a3);
    v8 = v7;
  }

  return v7;
}

- (NSString)description
{
  v3 = +[CNDescriptionBuilder descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"familyCircle" object:self->_familyCircle];
  id v5 = [v3 build];

  return (NSString *)v5;
}

- (id)myFamilyMemberRecord
{
  v2 = [(FAFamilyCircle *)self->_familyCircle members];
  v3 = objc_msgSend(v2, "_cn_firstObjectPassingTest:", &__block_literal_global_61);

  return v3;
}

uint64_t __51__CNFamilyCircleAccountSource_myFamilyMemberRecord__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isMe];
}

- (id)primaryAccount
{
  v2 = [(CNFamilyCircleAccountSource *)self myFamilyMemberRecord];
  if (v2)
  {
    v3 = (*((void (**)(uint64_t, void *))CNCoreDelegateInfoFromFamilyMember + 2))((uint64_t)CNCoreDelegateInfoFromFamilyMember, v2);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)delegateAccounts
{
  v3 = [(CNFamilyCircleAccountSource *)self myFamilyMemberRecord];
  if (+[CNFamilyMember isAdministrativeGuardianFamilyMember:v3])
  {
    id v4 = [(FAFamilyCircle *)self->_familyCircle members];
    id v5 = objc_msgSend(v4, "_cn_filter:", CNFamilyMemberIsDelegateChild);
    v6 = objc_msgSend(v5, "_cn_map:", CNCoreDelegateInfoFromFamilyMember);
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

- (FAFamilyCircle)familyCircle
{
  return self->_familyCircle;
}

- (void).cxx_destruct
{
}

@end