@interface LNUndoContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNUndoContext)initWithCoder:(id)a3;
- (LNUndoContext)initWithUndoToken:(id)a3 actionString:(id)a4;
- (NSString)actionString;
- (NSUUID)undoToken;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNUndoContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionString, 0);
  objc_storeStrong((id *)&self->_undoToken, 0);
}

- (NSString)actionString
{
  return self->_actionString;
}

- (NSUUID)undoToken
{
  return self->_undoToken;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(LNUndoContext *)self undoToken];
  v7 = [(LNUndoContext *)self actionString];
  v8 = [v3 stringWithFormat:@"<%@: %p, identifier: %@ action: %@", v5, self, v6, v7];

  return v8;
}

- (LNUndoContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"undoToken"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionString"];

  v7 = [(LNUndoContext *)self initWithUndoToken:v5 actionString:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNUndoContext *)self undoToken];
  [v4 encodeObject:v5 forKey:@"undoToken"];

  id v6 = [(LNUndoContext *)self actionString];
  [v4 encodeObject:v6 forKey:@"actionString"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LNUndoContext *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    id v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = [(LNUndoContext *)self undoToken];
      v8 = [(LNUndoContext *)v6 undoToken];
      id v9 = v7;
      id v10 = v8;
      v11 = v10;
      if (v9 == v10)
      {
        char v12 = 1;
      }
      else
      {
        char v12 = 0;
        if (v9 && v10) {
          char v12 = [v9 isEqual:v10];
        }
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  return v12;
}

- (LNUndoContext)initWithUndoToken:(id)a3 actionString:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"LNUndoContext.m", 16, @"Invalid parameter not satisfying: %@", @"token" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)LNUndoContext;
  id v9 = [(LNUndoContext *)&v17 init];
  if (v9)
  {
    uint64_t v10 = [v7 copy];
    undoToken = v9->_undoToken;
    v9->_undoToken = (NSUUID *)v10;

    uint64_t v12 = [v8 copy];
    actionString = v9->_actionString;
    v9->_actionString = (NSString *)v12;

    v14 = v9;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end