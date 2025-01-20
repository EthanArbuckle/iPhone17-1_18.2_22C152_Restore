@interface HFSelectedUserCollection
+ (HFSelectedUserCollection)collectionWithResolvedUsers:(id)a3 inHome:(id)a4;
+ (HFSelectedUserCollection)collectionWithSpecificUsers:(id)a3;
+ (NAIdentity)na_identity;
+ (id)allUsersCollection;
+ (id)currentUserCollection;
- (BOOL)isEqual:(id)a3;
- (HFSelectedUserCollection)init;
- (HFSelectedUserCollection)initWithType:(unint64_t)a3 specificUsers:(id)a4;
- (NSSet)specificUsers;
- (id)resolveSelectedUsersWithHome:(id)a3;
- (unint64_t)hash;
- (unint64_t)type;
@end

@implementation HFSelectedUserCollection

+ (id)allUsersCollection
{
  id v2 = objc_alloc((Class)a1);
  v3 = [MEMORY[0x263EFFA08] set];
  v4 = (void *)[v2 initWithType:0 specificUsers:v3];

  return v4;
}

+ (id)currentUserCollection
{
  id v2 = objc_alloc((Class)a1);
  v3 = [MEMORY[0x263EFFA08] set];
  v4 = (void *)[v2 initWithType:1 specificUsers:v3];

  return v4;
}

+ (HFSelectedUserCollection)collectionWithSpecificUsers:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithType:2 specificUsers:v4];

  return (HFSelectedUserCollection *)v5;
}

- (HFSelectedUserCollection)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithType_specificUsers_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFSelectedUserCollection.m", 56, @"%s is unavailable; use %@ instead",
    "-[HFSelectedUserCollection init]",
    v5);

  return 0;
}

- (HFSelectedUserCollection)initWithType:(unint64_t)a3 specificUsers:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFSelectedUserCollection;
  v7 = [(HFSelectedUserCollection *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    if (v6)
    {
      v9 = (NSSet *)v6;
    }
    else
    {
      v9 = [MEMORY[0x263EFFA08] set];
    }
    specificUsers = v8->_specificUsers;
    v8->_specificUsers = v9;
  }
  return v8;
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_227 != -1) {
    dispatch_once(&_MergedGlobals_227, &__block_literal_global_17_1);
  }
  id v2 = (void *)qword_26AB2EE08;
  return (NAIdentity *)v2;
}

void __39__HFSelectedUserCollection_na_identity__block_invoke_2()
{
  v0 = [MEMORY[0x263F58198] builder];
  id v1 = (id)[v0 appendUnsignedIntegerCharacteristic:&__block_literal_global_24_0];
  id v2 = (id)[v0 appendCharacteristic:&__block_literal_global_27];
  uint64_t v3 = [v0 build];

  id v4 = (void *)qword_26AB2EE08;
  qword_26AB2EE08 = v3;
}

uint64_t __39__HFSelectedUserCollection_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 type];
}

uint64_t __39__HFSelectedUserCollection_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 specificUsers];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (unint64_t)hash
{
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (id)resolveSelectedUsersWithHome:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(HFSelectedUserCollection *)self type];
  switch(v5)
  {
    case 0uLL:
      v7 = (void *)MEMORY[0x263EFFA08];
      v8 = objc_msgSend(v4, "hf_allUsersIncludingCurrentUser");
      uint64_t v9 = [v7 setWithArray:v8];
LABEL_7:
      id v6 = (void *)v9;

      break;
    case 1uLL:
      v10 = (void *)MEMORY[0x263EFFA08];
      v8 = [v4 currentUser];
      uint64_t v9 = [v10 setWithObject:v8];
      goto LABEL_7;
    case 2uLL:
      id v6 = [(HFSelectedUserCollection *)self specificUsers];
      break;
    default:
      id v6 = 0;
      break;
  }

  return v6;
}

+ (HFSelectedUserCollection)collectionWithResolvedUsers:(id)a3 inHome:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x263EFFA08];
  v8 = objc_msgSend(v6, "hf_allUsersIncludingCurrentUser");
  uint64_t v9 = [v7 setWithArray:v8];
  int v10 = [v5 isEqualToSet:v9];

  if (v10)
  {
    uint64_t v11 = +[HFSelectedUserCollection allUsersCollection];
  }
  else
  {
    objc_super v12 = (void *)MEMORY[0x263EFFA08];
    v13 = [v6 currentUser];
    v14 = [v12 setWithObject:v13];
    int v15 = [v5 isEqualToSet:v14];

    if (v15) {
      +[HFSelectedUserCollection currentUserCollection];
    }
    else {
    uint64_t v11 = +[HFSelectedUserCollection collectionWithSpecificUsers:v5];
    }
  }
  v16 = (void *)v11;

  return (HFSelectedUserCollection *)v16;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSSet)specificUsers
{
  return self->_specificUsers;
}

- (void).cxx_destruct
{
}

@end