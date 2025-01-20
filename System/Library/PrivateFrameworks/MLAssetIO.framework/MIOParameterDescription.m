@interface MIOParameterDescription
- (BOOL)isEqual:(id)a3;
- (MIONumericConstraint)numericConstraint;
- (MIOParameterDescription)initWithKey:(id)a3 BOOLParameter:(const void *)a4;
- (MIOParameterDescription)initWithKey:(id)a3 defaultValue:(id)a4 numericConstraint:(id)a5;
- (MIOParameterDescription)initWithKey:(id)a3 doubleParameter:(const void *)a4;
- (MIOParameterDescription)initWithKey:(id)a3 int64Parameter:(const void *)a4;
- (MIOParameterDescription)initWithKey:(id)a3 stringParameter:(const void *)a4;
- (NSString)key;
- (id)defaultValue;
- (id)description;
- (unint64_t)hash;
@end

@implementation MIOParameterDescription

- (MIOParameterDescription)initWithKey:(id)a3 defaultValue:(id)a4 numericConstraint:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MIOParameterDescription;
  v11 = [(MIOParameterDescription *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    key = v11->_key;
    v11->_key = (NSString *)v12;

    objc_storeStrong(&v11->_defaultValue, a4);
    uint64_t v14 = [v10 copy];
    numericConstraint = v11->_numericConstraint;
    v11->_numericConstraint = (MIONumericConstraint *)v14;
  }
  return v11;
}

- (MIOParameterDescription)initWithKey:(id)a3 doubleParameter:(const void *)a4
{
  id v6 = a3;
  v7 = [NSNumber numberWithDouble:*((double *)a4 + 2)];
  if (*((_DWORD *)a4 + 9) == 10)
  {
    id v8 = [NSNumber numberWithDouble:*(double *)(*((void *)a4 + 3) + 16)];
    id v9 = v8;
    id v10 = NSNumber;
    if (*((_DWORD *)a4 + 9) == 10) {
      v11 = (uint64_t *)*((void *)a4 + 3);
    }
    else {
      v11 = CoreML::Specification::DoubleRange::default_instance(v8);
    }
    v13 = [v10 numberWithDouble:*((double *)v11 + 3)];
    uint64_t v12 = [[MIONumericConstraint alloc] initWithMinimum:v9 maximum:v13];
  }
  else
  {
    uint64_t v12 = 0;
  }
  uint64_t v14 = [(MIOParameterDescription *)self initWithKey:v6 defaultValue:v7 numericConstraint:v12];

  return v14;
}

- (MIOParameterDescription)initWithKey:(id)a3 int64Parameter:(const void *)a4
{
  id v6 = a3;
  v7 = [NSNumber numberWithLongLong:*((void *)a4 + 2)];
  int v8 = *((_DWORD *)a4 + 9);
  if (v8 == 11)
  {
    v13 = (CoreML::Specification::Int64Set *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v10 = v13;
    if (*((_DWORD *)a4 + 9) == 11) {
      uint64_t v14 = (uint64_t *)*((void *)a4 + 3);
    }
    else {
      uint64_t v14 = CoreML::Specification::Int64Set::default_instance(v13);
    }
    uint64_t v17 = v14[3];
    if (v17) {
      v18 = (void *)(v17 + 8);
    }
    else {
      v18 = 0;
    }
    if (v17) {
      uint64_t v19 = v17 + 8 + 8 * *((int *)v14 + 4);
    }
    else {
      uint64_t v19 = 0;
    }
    while (v18 != (void *)v19)
    {
      v20 = [NSNumber numberWithLongLong:*v18];
      [(CoreML::Specification::Int64Set *)v10 addObject:v20];

      ++v18;
    }
    v15 = [[MIONumericConstraint alloc] initWithEnumeratedNumbers:v10];
    goto LABEL_20;
  }
  if (v8 == 10)
  {
    id v9 = [NSNumber numberWithLongLong:*(void *)(*((void *)a4 + 3) + 16)];
    id v10 = v9;
    v11 = NSNumber;
    if (*((_DWORD *)a4 + 9) == 10) {
      uint64_t v12 = (uint64_t *)*((void *)a4 + 3);
    }
    else {
      uint64_t v12 = CoreML::Specification::Int64Range::default_instance(v9);
    }
    v16 = [v11 numberWithLongLong:v12[3]];
    v15 = [[MIONumericConstraint alloc] initWithMinimum:v10 maximum:v16];

LABEL_20:
    goto LABEL_21;
  }
  v15 = 0;
LABEL_21:
  v21 = [(MIOParameterDescription *)self initWithKey:v6 defaultValue:v7 numericConstraint:v15];

  return v21;
}

- (MIOParameterDescription)initWithKey:(id)a3 BOOLParameter:(const void *)a4
{
  id v6 = a3;
  v7 = [NSNumber numberWithBool:*((unsigned __int8 *)a4 + 16)];
  int v8 = [(MIOParameterDescription *)self initWithKey:v6 defaultValue:v7 numericConstraint:0];

  return v8;
}

- (MIOParameterDescription)initWithKey:(id)a3 stringParameter:(const void *)a4
{
  id v6 = a3;
  v7 = (uint64_t *)*((void *)a4 + 2);
  if (*((char *)v7 + 23) < 0) {
    v7 = (uint64_t *)*v7;
  }
  int v8 = [NSString stringWithUTF8String:v7];
  id v9 = [(MIOParameterDescription *)self initWithKey:v6 defaultValue:v8 numericConstraint:0];

  return v9;
}

- (id)description
{
  v3 = NSString;
  v4 = [(MIOParameterDescription *)self key];
  v5 = [(MIOParameterDescription *)self defaultValue];
  id v6 = [(MIOParameterDescription *)self numericConstraint];
  v7 = [v3 stringWithFormat:@"MIOParameterDescription { key: %@, defaultValue: %@, numericConstraint: %@ }", v4, v5, v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MIOParameterDescription *)a3;
  if (self == v4)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [(MIOParameterDescription *)self key];
      v7 = [(MIOParameterDescription *)v5 key];
      char v8 = [v6 isEqual:v7];

      if (v8)
      {
        id v9 = [(MIOParameterDescription *)self defaultValue];
        id v10 = [(MIOParameterDescription *)v5 defaultValue];
        char v11 = [v9 isEqual:v10];

        if (v11)
        {
          uint64_t v12 = [(MIOParameterDescription *)self numericConstraint];
          if (v12)
          {
          }
          else
          {
            uint64_t v14 = [(MIOParameterDescription *)v5 numericConstraint];

            if (!v14)
            {
LABEL_11:
              BOOL v13 = 1;
LABEL_13:

              goto LABEL_14;
            }
          }
          v15 = [(MIOParameterDescription *)self numericConstraint];
          v16 = [(MIOParameterDescription *)v5 numericConstraint];
          char v17 = [v15 isEqual:v16];

          if (v17) {
            goto LABEL_11;
          }
        }
      }
      BOOL v13 = 0;
      goto LABEL_13;
    }
    BOOL v13 = 0;
  }
LABEL_14:

  return v13;
}

- (unint64_t)hash
{
  v3 = [(MIOParameterDescription *)self defaultValue];
  int v4 = [v3 conformsToProtocol:&unk_1F362E580];

  if (v4)
  {
    v5 = [(MIOParameterDescription *)self defaultValue];
    uint64_t v6 = [v5 hash];
  }
  else
  {
    uint64_t v6 = 0;
  }
  v7 = [(MIOParameterDescription *)self key];
  uint64_t v8 = [v7 hash];
  id v9 = [(MIOParameterDescription *)self numericConstraint];
  unint64_t v10 = v8 ^ v6 ^ [v9 hash];

  return v10;
}

- (NSString)key
{
  return self->_key;
}

- (id)defaultValue
{
  return self->_defaultValue;
}

- (MIONumericConstraint)numericConstraint
{
  return self->_numericConstraint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numericConstraint, 0);
  objc_storeStrong(&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end