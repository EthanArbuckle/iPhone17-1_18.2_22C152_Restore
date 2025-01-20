@interface LNDynamicTerm
- (BOOL)isEqual:(id)a3;
- (LNDynamicTerm)initWithTerm:(id)a3 entityIdentifier:(id)a4;
- (LNDynamicTerm)initWithTerm:(id)a3 entityIdentifierValue:(id)a4 entityTypeName:(id)a5;
- (LNEntityIdentifier)entityIdentifier;
- (NSString)term;
- (id)description;
- (unint64_t)hash;
@end

@implementation LNDynamicTerm

- (LNDynamicTerm)initWithTerm:(id)a3 entityIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"LNDynamicTerm.m", 19, @"Invalid parameter not satisfying: %@", @"term" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"LNDynamicTerm.m", 20, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)LNDynamicTerm;
  v10 = [(LNDynamicTerm *)&v17 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    term = v10->_term;
    v10->_term = (NSString *)v11;

    objc_storeStrong((id *)&v10->_entityIdentifier, a4);
    v13 = v10;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
  objc_storeStrong((id *)&self->_term, 0);
}

- (LNEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (NSString)term
{
  return self->_term;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNDynamicTerm *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_15:

      goto LABEL_16;
    }
    id v7 = [(LNDynamicTerm *)self term];
    id v8 = [(LNDynamicTerm *)v6 term];
    id v9 = v7;
    id v10 = v8;
    uint64_t v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      v14 = v9;
      if (!v9 || !v10) {
        goto LABEL_13;
      }
      int v12 = [v9 isEqualToString:v10];

      if (!v12) {
        goto LABEL_14;
      }
    }
    v14 = [(LNDynamicTerm *)self entityIdentifier];
    v13 = [(LNDynamicTerm *)v6 entityIdentifier];
    LOBYTE(v12) = [v14 isEqual:v13];
LABEL_13:

LABEL_14:
    goto LABEL_15;
  }
  LOBYTE(v12) = 1;
LABEL_16:

  return v12;
}

- (unint64_t)hash
{
  v3 = [(LNDynamicTerm *)self term];
  uint64_t v4 = [v3 hash];
  v5 = [(LNDynamicTerm *)self entityIdentifier];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = [(LNDynamicTerm *)self term];
  id v7 = [(LNDynamicTerm *)self entityIdentifier];
  id v8 = [v3 stringWithFormat:@"<%@: %p, term: %@, entityIdentifier: %@>", v5, self, v6, v7];

  return v8;
}

- (LNDynamicTerm)initWithTerm:(id)a3 entityIdentifierValue:(id)a4 entityTypeName:(id)a5
{
  id v8 = (objc_class *)MEMORY[0x1E4F72640];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  int v12 = (void *)[[v8 alloc] initWithTypeIdentifier:v9 instanceIdentifier:v10];

  v13 = [(LNDynamicTerm *)self initWithTerm:v11 entityIdentifier:v12];
  return v13;
}

@end