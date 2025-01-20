@interface HFPinCode
+ (id)na_identity;
- (BOOL)hasRestrictions;
- (BOOL)isEqual:(id)a3;
- (HFPinCode)initWithAccessoryAccessCode:(id)a3;
- (HFPinCode)initWithHomeAccessCode:(id)a3;
- (HFPinCode)initWithLabel:(id)a3 accessCodeValue:(id)a4 accessoryAccessCodes:(id)a5;
- (HMAccessCodeUserInformation)userLabel;
- (NSSet)accessories;
- (NSSet)accessoryAccessCodes;
- (NSString)pinCodeValue;
- (NSString)unknownMatterGuestUniqueID;
- (id)copyWithNewPinCodeValue:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)addAccessories:(id)a3;
- (void)addAccessoryAccessCode:(id)a3;
- (void)removeAccessories:(id)a3;
- (void)removeAccessoryAccessCode:(id)a3;
- (void)setUnknownMatterGuestUniqueID:(id)a3;
- (void)setUserLabel:(id)a3;
@end

@implementation HFPinCode

- (HFPinCode)initWithHomeAccessCode:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HFPinCode;
  v5 = [(HFPinCode *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 userInformation];
    userLabel = v5->_userLabel;
    v5->_userLabel = (HMAccessCodeUserInformation *)v6;

    v8 = [v4 accessCodeValue];
    uint64_t v9 = [v8 stringValue];
    pinCodeValue = v5->_pinCodeValue;
    v5->_pinCodeValue = (NSString *)v9;

    uint64_t v11 = [MEMORY[0x263EFF9C0] set];
    accessoryAccessCodes = v5->_accessoryAccessCodes;
    v5->_accessoryAccessCodes = (NSMutableSet *)v11;
  }
  return v5;
}

- (HFPinCode)initWithAccessoryAccessCode:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HFPinCode;
  v5 = [(HFPinCode *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 accessCodeValue];
    uint64_t v7 = [v6 stringValue];
    pinCodeValue = v5->_pinCodeValue;
    v5->_pinCodeValue = (NSString *)v7;

    uint64_t v9 = [MEMORY[0x263EFF9C0] setWithObject:v4];
    accessoryAccessCodes = v5->_accessoryAccessCodes;
    v5->_accessoryAccessCodes = (NSMutableSet *)v9;

    if (![(NSString *)v5->_pinCodeValue length])
    {
      uint64_t v11 = NSString;
      v12 = [v4 accessory];
      v13 = [v12 uniqueIdentifier];
      objc_super v14 = [v4 uniqueIdentifier];
      uint64_t v15 = [v11 stringWithFormat:@"%@-%@", v13, v14];
      unknownMatterGuestUniqueID = v5->_unknownMatterGuestUniqueID;
      v5->_unknownMatterGuestUniqueID = (NSString *)v15;
    }
  }

  return v5;
}

- (HFPinCode)initWithLabel:(id)a3 accessCodeValue:(id)a4 accessoryAccessCodes:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HFPinCode;
  v12 = [(HFPinCode *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_userLabel, a3);
    objc_storeStrong((id *)&v13->_pinCodeValue, a4);
    if (v11)
    {
      uint64_t v14 = [v11 mutableCopy];
    }
    else
    {
      uint64_t v14 = [MEMORY[0x263EFF9C0] set];
    }
    accessoryAccessCodes = v13->_accessoryAccessCodes;
    v13->_accessoryAccessCodes = (NSMutableSet *)v14;
  }
  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [(HFPinCode *)self userLabel];
  uint64_t v6 = (void *)v4[3];
  v4[3] = v5;

  uint64_t v7 = [(HFPinCode *)self pinCodeValue];
  uint64_t v8 = [v7 copy];
  id v9 = (void *)v4[4];
  v4[4] = v8;

  id v10 = [(HFPinCode *)self accessoryAccessCodes];
  uint64_t v11 = [v10 mutableCopy];
  v12 = (void *)v4[1];
  v4[1] = v11;

  v13 = [(HFPinCode *)self unknownMatterGuestUniqueID];
  uint64_t v14 = [v13 copy];
  uint64_t v15 = (void *)v4[5];
  v4[5] = v14;

  return v4;
}

- (id)copyWithNewPinCodeValue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v6 = [(HFPinCode *)self userLabel];
  uint64_t v7 = (void *)v5[3];
  v5[3] = v6;

  uint64_t v8 = [v4 copy];
  id v9 = (void *)v5[4];
  v5[4] = v8;

  id v10 = [(HFPinCode *)self accessoryAccessCodes];
  uint64_t v11 = [v10 mutableCopy];
  v12 = (void *)v5[1];
  v5[1] = v11;

  return v5;
}

+ (id)na_identity
{
  if (_MergedGlobals_312 != -1) {
    dispatch_once(&_MergedGlobals_312, &__block_literal_global_5_4);
  }
  v2 = (void *)qword_26AB2FD00;
  return v2;
}

void __24__HFPinCode_na_identity__block_invoke_2()
{
  v0 = [MEMORY[0x263F58198] builder];
  id v1 = (id)[v0 appendCharacteristic:&__block_literal_global_12_9];
  id v2 = (id)[v0 appendCharacteristic:&__block_literal_global_14_10];
  id v3 = (id)[v0 appendCharacteristic:&__block_literal_global_16_10];
  id v4 = (id)[v0 appendCharacteristic:&__block_literal_global_18_8 withRole:3 comparatorBlock:0 hashBlock:&__block_literal_global_21_6];
  uint64_t v5 = [v0 build];

  uint64_t v6 = (void *)qword_26AB2FD00;
  qword_26AB2FD00 = v5;
}

id __24__HFPinCode_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 userLabel];
  id v4 = [v3 simpleLabel];

  if (!v4)
  {
    uint64_t v5 = [v2 userLabel];
    uint64_t v6 = [v5 user];
    id v4 = [v6 uniqueIdentifier];

    if (!v4)
    {
      uint64_t v7 = [v2 userLabel];
      uint64_t v8 = [v7 removedUserInfo];
      id v4 = [v8 userUUID];
    }
  }

  return v4;
}

uint64_t __24__HFPinCode_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 pinCodeValue];
}

uint64_t __24__HFPinCode_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 unknownMatterGuestUniqueID];
}

uint64_t __24__HFPinCode_na_identity__block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 accessories];
}

uint64_t __24__HFPinCode_na_identity__block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (!v4) {
    goto LABEL_7;
  }
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = v4;
  if (!v5)
  {
    uint64_t v7 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v8 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v7 handleFailureInFunction:v8, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v3, objc_opt_class() file lineNumber description];

LABEL_7:
    uint64_t v6 = 0;
  }

  uint64_t v9 = [v6 computeHashFromContents];
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (unint64_t)hash
{
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x263F58188] builderWithObject:self];
  unint64_t v4 = [(HFPinCode *)self accessories];
  id v5 = (id)[v3 appendObject:v4 withName:@"accessories"];

  uint64_t v6 = [(HFPinCode *)self userLabel];
  uint64_t v7 = [v6 user];
  id v8 = (id)[v3 appendObject:v7 withName:@"user"];

  uint64_t v9 = [(HFPinCode *)self userLabel];
  id v10 = [v9 simpleLabel];
  id v11 = (id)[v3 appendBool:v10 != 0 withName:@"hasSimpleLabel"];

  v12 = [(HFPinCode *)self userLabel];
  v13 = [v12 removedUserInfo];
  uint64_t v14 = [v13 userUUID];
  id v15 = (id)[v3 appendObject:v14 withName:@"removedUserUUID"];

  id v16 = (id)objc_msgSend(v3, "appendBool:withName:", -[HFPinCode hasRestrictions](self, "hasRestrictions"), @"hasRestrictions");
  objc_super v17 = [(HFPinCode *)self unknownMatterGuestUniqueID];
  id v18 = (id)[v3 appendObject:v17 withName:@"unknownMatterGuestUniqueID"];

  v19 = [v3 build];

  return v19;
}

- (NSSet)accessoryAccessCodes
{
  id v2 = (void *)[(NSMutableSet *)self->_accessoryAccessCodes copy];
  return (NSSet *)v2;
}

- (void)addAccessoryAccessCode:(id)a3
{
  accessoryAccessCodes = self->_accessoryAccessCodes;
  id v5 = a3;
  [(NSMutableSet *)accessoryAccessCodes addObject:v5];
  accessories = self->_accessories;
  id v7 = [v5 accessory];

  [(NSMutableSet *)accessories removeObject:v7];
}

- (void)removeAccessoryAccessCode:(id)a3
{
}

- (BOOL)hasRestrictions
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = self->_accessoryAccessCodes;
  uint64_t v3 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "hasRestrictions", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)addAccessories:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_accessories)
  {
    id v5 = [MEMORY[0x263EFF9C0] set];
    accessories = self->_accessories;
    self->_accessories = v5;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * v11);
        accessoryAccessCodes = self->_accessoryAccessCodes;
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __28__HFPinCode_addAccessories___block_invoke;
        v14[3] = &unk_264096D50;
        v14[4] = v12;
        if (([(NSMutableSet *)accessoryAccessCodes na_any:v14] & 1) == 0) {
          [(NSMutableSet *)self->_accessories addObject:v12];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

uint64_t __28__HFPinCode_addAccessories___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 accessory];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (void)removeAccessories:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263EFF9C0] set];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = v3;
  uint64_t v18 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v18)
  {
    uint64_t v16 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        [(NSMutableSet *)self->_accessories removeObject:v6];
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v7 = self->_accessoryAccessCodes;
        uint64_t v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v20;
          do
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v20 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * j);
              v13 = [v12 accessory];
              int v14 = [v13 isEqual:v6];

              if (v14) {
                [v4 addObject:v12];
              }
            }
            uint64_t v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v9);
        }
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v18);
  }

  [(NSMutableSet *)self->_accessoryAccessCodes minusSet:v4];
}

- (NSSet)accessories
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF9C0] set];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(HFPinCode *)self accessoryAccessCodes];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) accessory];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  [v3 unionSet:self->_accessories];
  return (NSSet *)v3;
}

- (HMAccessCodeUserInformation)userLabel
{
  return self->_userLabel;
}

- (void)setUserLabel:(id)a3
{
}

- (NSString)pinCodeValue
{
  return self->_pinCodeValue;
}

- (NSString)unknownMatterGuestUniqueID
{
  return self->_unknownMatterGuestUniqueID;
}

- (void)setUnknownMatterGuestUniqueID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownMatterGuestUniqueID, 0);
  objc_storeStrong((id *)&self->_pinCodeValue, 0);
  objc_storeStrong((id *)&self->_userLabel, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_accessoryAccessCodes, 0);
}

@end