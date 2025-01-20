@interface ATXExecutableReferencePair
- (ATXExecutableIdentifier)executable;
- (ATXExecutableReference)reference;
- (ATXExecutableReferencePair)initWithReference:(id)a3 executable:(id)a4;
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
@end

@implementation ATXExecutableReferencePair

- (ATXExecutableReferencePair)initWithReference:(id)a3 executable:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ATXExecutableReferencePair;
  v9 = [(ATXExecutableReferencePair *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_reference, a3);
    objc_storeStrong((id *)&v10->_executable, a4);
    v11 = v10;
  }

  return v10;
}

- (unint64_t)hash
{
  v2 = [(ATXExecutableReferencePair *)self executable];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXExecutableReferencePair *)a3;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      executable = self->_executable;
      id v7 = v5->_executable;
      if (executable == v7)
      {
      }
      else
      {
        id v8 = v7;
        v9 = executable;
        BOOL v10 = [(ATXExecutableIdentifier *)v9 isEqual:v8];

        if (!v10)
        {
          char v11 = 0;
LABEL_13:

          goto LABEL_14;
        }
      }
      v12 = self->_reference;
      objc_super v13 = v12;
      if (v12 == v5->_reference) {
        char v11 = 1;
      }
      else {
        char v11 = -[ATXExecutableReference isEqual:](v12, "isEqual:");
      }

      goto LABEL_13;
    }
    char v11 = 0;
  }
LABEL_14:

  return v11;
}

- (ATXExecutableReference)reference
{
  return self->_reference;
}

- (ATXExecutableIdentifier)executable
{
  return self->_executable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executable, 0);

  objc_storeStrong((id *)&self->_reference, 0);
}

@end