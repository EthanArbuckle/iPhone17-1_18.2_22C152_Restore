@interface EMMessageFlagChangeAction
+ (BOOL)supportsSecureCoding;
- (ECMessageFlagChange)flagChange;
- (EMMessageFlagChangeAction)initWithCoder:(id)a3;
- (EMMessageFlagChangeAction)initWithMessageListItems:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 flagChange:(id)a6;
- (EMMessageFlagChangeAction)initWithObjectIDs:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 flagChange:(id)a6;
- (EMMessageFlagChangeAction)initWithQuery:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 flagChange:(id)a6;
- (int64_t)signpostType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EMMessageFlagChangeAction

- (EMMessageFlagChangeAction)initWithMessageListItems:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 flagChange:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)EMMessageFlagChangeAction;
  v12 = [(EMMessageChangeAction *)&v15 initWithMessageListItems:a3 origin:a4 actor:a5];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_flagChange, a6);
  }

  return v13;
}

- (EMMessageFlagChangeAction)initWithQuery:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 flagChange:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)EMMessageFlagChangeAction;
  v12 = [(EMMessageChangeAction *)&v15 initWithQuery:a3 origin:a4 actor:a5];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_flagChange, a6);
  }

  return v13;
}

- (EMMessageFlagChangeAction)initWithObjectIDs:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 flagChange:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)EMMessageFlagChangeAction;
  v12 = [(EMMessageChangeAction *)&v15 initWithObjectIDs:a3 origin:a4 actor:a5];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_flagChange, a6);
  }

  return v13;
}

- (int64_t)signpostType
{
  return 6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMMessageFlagChangeAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMMessageFlagChangeAction;
  v5 = [(EMMessageChangeAction *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_flagChange"];
    flagChange = v5->_flagChange;
    v5->_flagChange = (ECMessageFlagChange *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)EMMessageFlagChangeAction;
  [(EMMessageChangeAction *)&v6 encodeWithCoder:v4];
  v5 = [(EMMessageFlagChangeAction *)self flagChange];
  [v4 encodeObject:v5 forKey:@"EFPropertyKey_flagChange"];
}

- (ECMessageFlagChange)flagChange
{
  return self->_flagChange;
}

- (void).cxx_destruct
{
}

@end