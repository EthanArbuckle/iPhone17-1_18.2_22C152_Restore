@interface ANSectionSubtypeDescriptor
+ (BOOL)supportsSecureCoding;
- (ANSectionSubtypeDescriptor)init;
- (ANSectionSubtypeDescriptor)initWithCoder:(id)a3;
- (BOOL)allowsAddingToLockScreenWhenUnlocked;
- (NSString)accountTypeID;
- (NSString)fullUnlockActionLabel;
- (id)initForAccountWithType:(id)a3;
- (int64_t)subtype;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowsAddingToLockScreenWhenUnlocked:(BOOL)a3;
- (void)setFullUnlockActionLabel:(id)a3;
- (void)setSubtype:(int64_t)a3;
@end

@implementation ANSectionSubtypeDescriptor

- (ANSectionSubtypeDescriptor)init
{
  return 0;
}

- (id)initForAccountWithType:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ANSectionSubtypeDescriptor;
  v5 = [(ANSectionSubtypeDescriptor *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 identifier];
    accountTypeID = v5->_accountTypeID;
    v5->_accountTypeID = (NSString *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  accountTypeID = self->_accountTypeID;
  id v5 = a3;
  [v5 encodeObject:accountTypeID forKey:@"_accountTypeID"];
  [v5 encodeInteger:self->_subtype forKey:@"_subtype"];
  [v5 encodeBool:self->_allowsAddingToLockScreenWhenUnlocked forKey:@"_allowsAddingToLockScreenWhenUnlocked"];
  [v5 encodeObject:self->_fullUnlockActionLabel forKey:@"_fullUnlockActionLabel"];
}

- (ANSectionSubtypeDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ANSectionSubtypeDescriptor;
  id v5 = [(ANSectionSubtypeDescriptor *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_accountTypeID"];
    accountTypeID = v5->_accountTypeID;
    v5->_accountTypeID = (NSString *)v6;

    v5->_subtype = [v4 decodeIntegerForKey:@"_subtype"];
    v5->_allowsAddingToLockScreenWhenUnlocked = [v4 decodeBoolForKey:@"_allowsAddingToLockScreenWhenUnlocked"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_fullUnlockActionLabel"];
    fullUnlockActionLabel = v5->_fullUnlockActionLabel;
    v5->_fullUnlockActionLabel = (NSString *)v8;
  }
  return v5;
}

- (NSString)accountTypeID
{
  return self->_accountTypeID;
}

- (int64_t)subtype
{
  return self->_subtype;
}

- (void)setSubtype:(int64_t)a3
{
  self->_subtype = a3;
}

- (BOOL)allowsAddingToLockScreenWhenUnlocked
{
  return self->_allowsAddingToLockScreenWhenUnlocked;
}

- (void)setAllowsAddingToLockScreenWhenUnlocked:(BOOL)a3
{
  self->_allowsAddingToLockScreenWhenUnlocked = a3;
}

- (NSString)fullUnlockActionLabel
{
  return self->_fullUnlockActionLabel;
}

- (void)setFullUnlockActionLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullUnlockActionLabel, 0);
  objc_storeStrong((id *)&self->_accountTypeID, 0);
}

@end