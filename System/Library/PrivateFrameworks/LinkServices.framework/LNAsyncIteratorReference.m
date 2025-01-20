@interface LNAsyncIteratorReference
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNAsyncIteratorReference)initWithCoder:(id)a3;
- (LNAsyncIteratorReference)initWithSequenceIdentifier:(id)a3 iteratorIdentifier:(id)a4;
- (NSNumber)iteratorIdentifier;
- (NSUUID)sequenceIdentifier;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNAsyncIteratorReference

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sequenceIdentifier, 0);
  objc_storeStrong((id *)&self->_iteratorIdentifier, 0);
}

- (NSUUID)sequenceIdentifier
{
  return self->_sequenceIdentifier;
}

- (NSNumber)iteratorIdentifier
{
  return self->_iteratorIdentifier;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNAsyncIteratorReference *)a3;
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
    v7 = [(LNAsyncIteratorReference *)self iteratorIdentifier];
    v8 = [(LNAsyncIteratorReference *)v6 iteratorIdentifier];
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
    v15 = [(LNAsyncIteratorReference *)self sequenceIdentifier];
    v16 = [(LNAsyncIteratorReference *)v6 sequenceIdentifier];
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
  v3 = [(LNAsyncIteratorReference *)self iteratorIdentifier];
  uint64_t v4 = [v3 hash];
  v5 = [(LNAsyncIteratorReference *)self sequenceIdentifier];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (LNAsyncIteratorReference)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iteratorIdentifier"];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sequenceIdentifier"];

  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    self = [(LNAsyncIteratorReference *)self initWithSequenceIdentifier:v6 iteratorIdentifier:v5];
    v8 = self;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNAsyncIteratorReference *)self iteratorIdentifier];
  [v4 encodeObject:v5 forKey:@"iteratorIdentifier"];

  id v6 = [(LNAsyncIteratorReference *)self sequenceIdentifier];
  [v4 encodeObject:v6 forKey:@"sequenceIdentifier"];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(LNAsyncIteratorReference *)self sequenceIdentifier];
  BOOL v7 = [v6 UUIDString];
  v8 = [(LNAsyncIteratorReference *)self iteratorIdentifier];
  id v9 = [v3 stringWithFormat:@"<%@: %@/%@>", v5, v7, v8];

  return v9;
}

- (LNAsyncIteratorReference)initWithSequenceIdentifier:(id)a3 iteratorIdentifier:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"LNAsyncIterator.m", 19, @"Invalid parameter not satisfying: %@", @"sequenceIdentifier" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"LNAsyncIterator.m", 20, @"Invalid parameter not satisfying: %@", @"iteratorIdentifier" object file lineNumber description];

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)LNAsyncIteratorReference;
  v11 = [(LNAsyncIteratorReference *)&v17 init];
  int v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_sequenceIdentifier, a3);
    objc_storeStrong((id *)&v12->_iteratorIdentifier, a4);
    v13 = v12;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end