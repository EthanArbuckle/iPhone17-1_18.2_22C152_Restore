@interface LNAsyncIterator
- (BOOL)isEqual:(id)a3;
- (LNAsyncIterator)initWithReference:(id)a3 connection:(id)a4;
- (LNAsyncIteratorReference)reference;
- (LNConnection)connection;
- (id)description;
- (unint64_t)hash;
- (void)nextResultsWithCompletionHandler:(id)a3;
@end

@implementation LNAsyncIterator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_reference, 0);
}

- (LNConnection)connection
{
  return self->_connection;
}

- (LNAsyncIteratorReference)reference
{
  return self->_reference;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNAsyncIterator *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_20:

      goto LABEL_21;
    }
    v7 = [(LNAsyncIterator *)self connection];
    v8 = [(LNAsyncIterator *)v6 connection];
    id v9 = v7;
    id v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      id v14 = v9;
      if (!v9 || !v10)
      {
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      int v12 = [v9 isEqual:v10];

      if (!v12) {
        goto LABEL_19;
      }
    }
    v15 = [(LNAsyncIterator *)self reference];
    v16 = [(LNAsyncIterator *)v6 reference];
    id v14 = v15;
    id v17 = v16;
    v13 = v17;
    if (v14 == v17)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v14 && v17) {
        LOBYTE(v12) = [v14 isEqual:v17];
      }
    }

    goto LABEL_18;
  }
  LOBYTE(v12) = 1;
LABEL_21:

  return v12;
}

- (unint64_t)hash
{
  v3 = [(LNAsyncIterator *)self connection];
  uint64_t v4 = [v3 hash];
  v5 = [(LNAsyncIterator *)self reference];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = [(LNAsyncIterator *)self connection];
  v7 = [(LNAsyncIterator *)self reference];
  v8 = [v3 stringWithFormat:@"<%@: %p, connection: %@, reference: %@>", v5, self, v6, v7];

  return v8;
}

- (void)nextResultsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v6 = [(LNAsyncIterator *)self connection];
  v5 = [(LNAsyncIterator *)self reference];
  [v6 nextAsyncIteratorResults:v5 completionHandler:v4];
}

- (LNAsyncIterator)initWithReference:(id)a3 connection:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"LNAsyncIterator.m", 95, @"Invalid parameter not satisfying: %@", @"connection" object file lineNumber description];

    if (v8) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"LNAsyncIterator.m", 96, @"Invalid parameter not satisfying: %@", @"reference" object file lineNumber description];

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)LNAsyncIterator;
  id v10 = [(LNAsyncIterator *)&v16 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_connection, a4);
    objc_storeStrong((id *)&v11->_reference, a3);
    int v12 = v11;
  }

  return v11;
}

@end