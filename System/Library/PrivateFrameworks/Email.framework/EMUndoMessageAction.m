@interface EMUndoMessageAction
+ (BOOL)supportsSecureCoding;
- (EMUndoMessageAction)initWithCoder:(id)a3;
- (EMUndoMessageAction)initWithIndividualActions:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5;
- (NSArray)individualActions;
- (int64_t)signpostType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EMUndoMessageAction

- (EMUndoMessageAction)initWithIndividualActions:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EMUndoMessageAction;
  v10 = [(EMMessageChangeAction *)&v13 initWithMessageListItems:0 origin:a4 actor:a5];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_individualActions, a3);
  }

  return v11;
}

- (int64_t)signpostType
{
  return 14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMUndoMessageAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EMUndoMessageAction;
  v5 = [(EMMessageChangeAction *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"EFPropertyKey_individualActions"];
    individualActions = v5->_individualActions;
    v5->_individualActions = (NSArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)EMUndoMessageAction;
  [(EMMessageChangeAction *)&v6 encodeWithCoder:v4];
  v5 = [(EMUndoMessageAction *)self individualActions];
  [v4 encodeObject:v5 forKey:@"EFPropertyKey_individualActions"];
}

- (NSArray)individualActions
{
  return self->_individualActions;
}

- (void).cxx_destruct
{
}

@end