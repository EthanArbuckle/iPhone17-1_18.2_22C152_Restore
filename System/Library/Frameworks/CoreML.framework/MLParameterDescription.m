@interface MLParameterDescription
+ (BOOL)supportsSecureCoding;
+ (id)parameterDescriptionForKey:(id)a3 BOOLParameterSpec:(const void *)a4;
+ (id)parameterDescriptionForKey:(id)a3 defaultValue:(id)a4 numericConstraint:(id)a5;
+ (id)parameterDescriptionForKey:(id)a3 doubleParameterSpec:(const void *)a4;
+ (id)parameterDescriptionForKey:(id)a3 int64ParameterSpec:(const void *)a4;
+ (id)parameterDescriptionForKey:(id)a3 stringParameterSpec:(const void *)a4;
- (MLNumericConstraint)numericConstraint;
- (MLParameterDescription)initWithCoder:(id)a3;
- (MLParameterKey)key;
- (id)defaultValue;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDefaultValue:(id)a3;
- (void)setKey:(id)a3;
- (void)setNumericConstraint:(id)a3;
@end

@implementation MLParameterDescription

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numericConstraint, 0);
  objc_storeStrong(&self->_defaultValue, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setNumericConstraint:(id)a3
{
}

- (MLNumericConstraint)numericConstraint
{
  return self->_numericConstraint;
}

- (void)setDefaultValue:(id)a3
{
}

- (id)defaultValue
{
  return self->_defaultValue;
}

- (void)setKey:(id)a3
{
}

- (MLParameterKey)key
{
  return self->_key;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  v4 = NSString;
  v5 = [(MLParameterDescription *)self key];
  v6 = [v4 stringWithFormat:@"\nparameterKey: %@", v5];
  [v3 appendString:v6];

  v7 = NSString;
  v8 = [(MLParameterDescription *)self defaultValue];
  v9 = [v7 stringWithFormat:@"\ndefaultValue: %@", v8];
  [v3 appendString:v9];

  v10 = [(MLParameterDescription *)self numericConstraint];

  if (v10)
  {
    v11 = NSString;
    v12 = [(MLParameterDescription *)self numericConstraint];
    v13 = [v11 stringWithFormat:@"\nnumericConstraint: %@", v12];
    [v3 appendString:v13];
  }

  return v3;
}

- (MLParameterDescription)initWithCoder:(id)a3
{
  v20[15] = *MEMORY[0x1E4F143B8];
  v4 = (objc_class *)MEMORY[0x1E4F1CA80];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v20[0] = objc_opt_class();
  v20[1] = objc_opt_class();
  v20[2] = objc_opt_class();
  v20[3] = objc_opt_class();
  v20[4] = objc_opt_class();
  v20[5] = objc_opt_class();
  v20[6] = objc_opt_class();
  v20[7] = objc_opt_class();
  v20[8] = objc_opt_class();
  v20[9] = objc_opt_class();
  v20[10] = objc_opt_class();
  v20[11] = objc_opt_class();
  v20[12] = objc_opt_class();
  v20[13] = objc_opt_class();
  v20[14] = objc_opt_class();
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:15];
  [v6 addObjectsFromArray:v7];

  v8 = [v5 allowedClasses];
  [v6 unionSet:v8];

  id v19 = 0;
  v9 = [v5 decodeTopLevelObjectOfClasses:v6 forKey:@"key" error:&v19];
  id v10 = v19;
  id v18 = v10;
  v11 = [v5 decodeTopLevelObjectOfClasses:v6 forKey:@"defaultValue" error:&v18];
  id v12 = v18;

  id v17 = v12;
  v13 = [v5 decodeTopLevelObjectOfClasses:v6 forKey:@"numericConstraint" error:&v17];

  id v14 = v17;
  v15 = +[MLParameterDescription parameterDescriptionForKey:v9 defaultValue:v11 numericConstraint:v13];

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(MLParameterDescription *)self key];
  [v4 encodeObject:v5 forKey:@"key"];

  id v6 = [(MLParameterDescription *)self defaultValue];
  [v4 encodeObject:v6 forKey:@"defaultValue"];

  id v7 = [(MLParameterDescription *)self numericConstraint];
  [v4 encodeObject:v7 forKey:@"numericConstraint"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)parameterDescriptionForKey:(id)a3 defaultValue:(id)a4 numericConstraint:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init(MLParameterDescription);
  [(MLParameterDescription *)v10 setKey:v9];

  [(MLParameterDescription *)v10 setDefaultValue:v8];
  [(MLParameterDescription *)v10 setNumericConstraint:v7];

  return v10;
}

+ (id)parameterDescriptionForKey:(id)a3 BOOLParameterSpec:(const void *)a4
{
  id v5 = a3;
  id v6 = [NSNumber numberWithBool:*((unsigned __int8 *)a4 + 16)];
  id v7 = +[MLParameterDescription parameterDescriptionForKey:v5 defaultValue:v6 numericConstraint:0];

  return v7;
}

+ (id)parameterDescriptionForKey:(id)a3 stringParameterSpec:(const void *)a4
{
  id v5 = a3;
  id v6 = (uint64_t *)*((void *)a4 + 2);
  if (*((char *)v6 + 23) < 0) {
    id v6 = (uint64_t *)*v6;
  }
  id v7 = [NSString stringWithUTF8String:v6];
  id v8 = +[MLParameterDescription parameterDescriptionForKey:v5 defaultValue:v7 numericConstraint:0];

  return v8;
}

+ (id)parameterDescriptionForKey:(id)a3 doubleParameterSpec:(const void *)a4
{
  id v5 = a3;
  if (*((_DWORD *)a4 + 9) == 10)
  {
    id v6 = [NSNumber numberWithDouble:*(double *)(*((void *)a4 + 3) + 16)];
    if (*((_DWORD *)a4 + 9) == 10)
    {
      id v7 = [NSNumber numberWithDouble:*(double *)(*((void *)a4 + 3) + 24)];
    }
    else
    {
      id v7 = &unk_1EF119EE0;
    }
  }
  else
  {
    id v7 = &unk_1EF119EE0;
    id v6 = &unk_1EF119ED0;
  }
  id v8 = +[MLNumericConstraint numericConstraintWithMinNumber:v6 maxNumber:v7];
  id v9 = [NSNumber numberWithDouble:*((double *)a4 + 2)];
  id v10 = +[MLParameterDescription parameterDescriptionForKey:v5 defaultValue:v9 numericConstraint:v8];

  return v10;
}

+ (id)parameterDescriptionForKey:(id)a3 int64ParameterSpec:(const void *)a4
{
  id v5 = a3;
  int v6 = *((_DWORD *)a4 + 9);
  if (v6 == 10)
  {
    id v8 = [NSNumber numberWithLongLong:*(void *)(*((void *)a4 + 3) + 16)];
    if (*((_DWORD *)a4 + 9) == 10)
    {
      id v14 = [NSNumber numberWithLongLong:*(void *)(*((void *)a4 + 3) + 24)];
    }
    else
    {
      id v14 = &unk_1EF11A778;
    }
  }
  else
  {
    if (v6 == 11 && *(int *)(*((void *)a4 + 3) + 16) >= 1)
    {
      inited = [MEMORY[0x1E4F1CA80] set];
      id v8 = inited;
      for (uint64_t i = 0; ; ++i)
      {
        if (*((_DWORD *)a4 + 9) == 11)
        {
          id v10 = (uint64_t *)*((void *)a4 + 3);
        }
        else
        {
          inited = (CoreML::Specification::protobuf_DataStructures_2eproto *)CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults(inited);
          id v10 = &CoreML::Specification::_Int64Set_default_instance_;
        }
        if (i >= *((int *)v10 + 4)) {
          break;
        }
        v11 = NSNumber;
        if (*((_DWORD *)a4 + 9) == 11)
        {
          id v12 = (uint64_t *)*((void *)a4 + 3);
        }
        else
        {
          CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults(inited);
          id v12 = &CoreML::Specification::_Int64Set_default_instance_;
        }
        v13 = [v11 numberWithLongLong:*(void *)(v12[3] + 8 * i + 8)];
        [v8 addObject:v13];
      }
      v15 = +[MLNumericConstraint numericConstraintWithEnumeratedNumbers:v8];
      goto LABEL_19;
    }
    id v14 = &unk_1EF11A778;
    id v8 = &unk_1EF11A760;
  }
  v15 = +[MLNumericConstraint numericConstraintWithMinNumber:v8 maxNumber:v14];

LABEL_19:
  v16 = [NSNumber numberWithLongLong:*((void *)a4 + 2)];
  id v17 = +[MLParameterDescription parameterDescriptionForKey:v5 defaultValue:v16 numericConstraint:v15];

  return v17;
}

@end