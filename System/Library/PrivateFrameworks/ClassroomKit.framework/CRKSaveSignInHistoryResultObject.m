@interface CRKSaveSignInHistoryResultObject
+ (BOOL)supportsSecureCoding;
- (CRKSaveSignInHistoryResultObject)initWithCoder:(id)a3;
- (NSArray)history;
- (void)encodeWithCoder:(id)a3;
- (void)setHistory:(id)a3;
@end

@implementation CRKSaveSignInHistoryResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKSaveSignInHistoryResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRKSaveSignInHistoryResultObject;
  v5 = [(CATTaskResultObject *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"history"];
    history = v5->_history;
    v5->_history = (NSArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRKSaveSignInHistoryResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v6 encodeWithCoder:v4];
  v5 = [(CRKSaveSignInHistoryResultObject *)self history];
  [v4 encodeObject:v5 forKey:@"history"];
}

- (NSArray)history
{
  return self->_history;
}

- (void)setHistory:(id)a3
{
}

- (void).cxx_destruct
{
}

@end