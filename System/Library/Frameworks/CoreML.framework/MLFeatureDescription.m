@interface MLFeatureDescription
+ (BOOL)supportsSecureCoding;
+ (MLFeatureDescription)featureDescriptionWithName:(id)a3 type:(int64_t)a4 optional:(BOOL)a5 constraints:(id)a6;
- (BOOL)allowsValuesWithDescription:(id)a3;
- (BOOL)isAllowedValue:(MLFeatureValue *)value;
- (BOOL)isAllowedValue:(id)a3 error:(id *)a4;
- (BOOL)isOptional;
- (MLDictionaryConstraint)dictionaryConstraint;
- (MLDictionaryConstraint)dictionaryConstraintCached;
- (MLFeatureDescription)initWithCoder:(id)a3;
- (MLFeatureDescription)initWithName:(id)a3 type:(int64_t)a4 optional:(BOOL)a5 contraints:(id)a6;
- (MLFeatureType)type;
- (MLImageConstraint)imageConstraint;
- (MLImageConstraint)imageConstraintCached;
- (MLMultiArrayConstraint)multiArrayConstraint;
- (MLMultiArrayConstraint)multiArrayConstraintCached;
- (MLSequenceConstraint)sequenceConstraint;
- (MLSequenceConstraint)sequenceConstraintCached;
- (NSDictionary)valueConstraints;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)stateConstraint;
- (void)encodeWithCoder:(id)a3;
- (void)setValueConstraints:(id)a3;
@end

@implementation MLFeatureDescription

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sequenceConstraintCached, 0);
  objc_storeStrong((id *)&self->_dictionaryConstraintCached, 0);
  objc_storeStrong((id *)&self->_imageConstraintCached, 0);
  objc_storeStrong((id *)&self->_multiArrayConstraintCached, 0);
  objc_storeStrong((id *)&self->_valueConstraints, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_stateConstraintCached, 0);
}

- (MLFeatureType)type
{
  return self->_type;
}

- (NSString)name
{
  return self->_name;
}

+ (MLFeatureDescription)featureDescriptionWithName:(id)a3 type:(int64_t)a4 optional:(BOOL)a5 constraints:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a3;
  v12 = (void *)[objc_alloc((Class)a1) initWithName:v11 type:a4 optional:v6 contraints:v10];

  return (MLFeatureDescription *)v12;
}

- (MLFeatureDescription)initWithName:(id)a3 type:(int64_t)a4 optional:(BOOL)a5 contraints:(id)a6
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a6;
  v56.receiver = self;
  v56.super_class = (Class)MLFeatureDescription;
  v13 = [(MLFeatureDescription *)&v56 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_name, a3);
    v14->_type = a4;
    v14->_optional = a5;
    v15 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v16 = v12;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v52 objects:v57 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v53;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v53 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v52 + 1) + 8 * v20);
          v22 = (objc_class *)objc_opt_class();
          v23 = NSStringFromClass(v22);
          -[NSDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v21, v23, (void)v52);

          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v52 objects:v57 count:16];
      }
      while (v18);
    }

    valueConstraints = v14->_valueConstraints;
    v14->_valueConstraints = v15;
    v25 = v15;

    v26 = v14->_valueConstraints;
    v27 = (objc_class *)objc_opt_class();
    v28 = NSStringFromClass(v27);
    uint64_t v29 = [(NSDictionary *)v26 objectForKeyedSubscript:v28];
    multiArrayConstraintCached = v14->_multiArrayConstraintCached;
    v14->_multiArrayConstraintCached = (MLMultiArrayConstraint *)v29;

    v31 = v14->_valueConstraints;
    v32 = (objc_class *)objc_opt_class();
    v33 = NSStringFromClass(v32);
    uint64_t v34 = [(NSDictionary *)v31 objectForKeyedSubscript:v33];
    imageConstraintCached = v14->_imageConstraintCached;
    v14->_imageConstraintCached = (MLImageConstraint *)v34;

    v36 = v14->_valueConstraints;
    v37 = (objc_class *)objc_opt_class();
    v38 = NSStringFromClass(v37);
    uint64_t v39 = [(NSDictionary *)v36 objectForKeyedSubscript:v38];
    dictionaryConstraintCached = v14->_dictionaryConstraintCached;
    v14->_dictionaryConstraintCached = (MLDictionaryConstraint *)v39;

    v41 = v14->_valueConstraints;
    v42 = (objc_class *)objc_opt_class();
    v43 = NSStringFromClass(v42);
    uint64_t v44 = [(NSDictionary *)v41 objectForKeyedSubscript:v43];
    sequenceConstraintCached = v14->_sequenceConstraintCached;
    v14->_sequenceConstraintCached = (MLSequenceConstraint *)v44;

    v46 = v14->_valueConstraints;
    v47 = (objc_class *)objc_opt_class();
    v48 = NSStringFromClass(v47);
    uint64_t v49 = [(NSDictionary *)v46 objectForKeyedSubscript:v48];
    stateConstraintCached = v14->_stateConstraintCached;
    v14->_stateConstraintCached = (MLStateConstraint *)v49;
  }
  return v14;
}

- (BOOL)isOptional
{
  return self->_optional;
}

- (MLMultiArrayConstraint)multiArrayConstraint
{
  return self->_multiArrayConstraintCached;
}

- (MLSequenceConstraint)sequenceConstraintCached
{
  return self->_sequenceConstraintCached;
}

- (MLDictionaryConstraint)dictionaryConstraintCached
{
  return self->_dictionaryConstraintCached;
}

- (MLImageConstraint)imageConstraintCached
{
  return self->_imageConstraintCached;
}

- (MLMultiArrayConstraint)multiArrayConstraintCached
{
  return self->_multiArrayConstraintCached;
}

- (void)setValueConstraints:(id)a3
{
}

- (NSDictionary)valueConstraints
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (MLFeatureDescription)initWithCoder:(id)a3
{
  v39[7] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)MLFeatureDescription;
  v5 = [(MLFeatureDescription *)&v38 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v5->_type = [v4 decodeIntegerForKey:@"type"];
    v5->_optional = [v4 decodeBoolForKey:@"optional"];
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v39[0] = objc_opt_class();
    v39[1] = objc_opt_class();
    v39[2] = objc_opt_class();
    v39[3] = objc_opt_class();
    v39[4] = objc_opt_class();
    v39[5] = objc_opt_class();
    v39[6] = objc_opt_class();
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:7];
    [v8 addObjectsFromArray:v9];

    uint64_t v10 = [v4 decodeObjectOfClasses:v8 forKey:@"constraints"];
    valueConstraints = v5->_valueConstraints;
    v5->_valueConstraints = (NSDictionary *)v10;

    id v12 = v5->_valueConstraints;
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    uint64_t v15 = [(NSDictionary *)v12 objectForKeyedSubscript:v14];
    multiArrayConstraintCached = v5->_multiArrayConstraintCached;
    v5->_multiArrayConstraintCached = (MLMultiArrayConstraint *)v15;

    uint64_t v17 = v5->_valueConstraints;
    uint64_t v18 = (objc_class *)objc_opt_class();
    uint64_t v19 = NSStringFromClass(v18);
    uint64_t v20 = [(NSDictionary *)v17 objectForKeyedSubscript:v19];
    imageConstraintCached = v5->_imageConstraintCached;
    v5->_imageConstraintCached = (MLImageConstraint *)v20;

    v22 = v5->_valueConstraints;
    v23 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v23);
    uint64_t v25 = [(NSDictionary *)v22 objectForKeyedSubscript:v24];
    dictionaryConstraintCached = v5->_dictionaryConstraintCached;
    v5->_dictionaryConstraintCached = (MLDictionaryConstraint *)v25;

    v27 = v5->_valueConstraints;
    v28 = (objc_class *)objc_opt_class();
    uint64_t v29 = NSStringFromClass(v28);
    uint64_t v30 = [(NSDictionary *)v27 objectForKeyedSubscript:v29];
    sequenceConstraintCached = v5->_sequenceConstraintCached;
    v5->_sequenceConstraintCached = (MLSequenceConstraint *)v30;

    v32 = v5->_valueConstraints;
    v33 = (objc_class *)objc_opt_class();
    uint64_t v34 = NSStringFromClass(v33);
    uint64_t v35 = [(NSDictionary *)v32 objectForKeyedSubscript:v34];
    stateConstraintCached = v5->_stateConstraintCached;
    v5->_stateConstraintCached = (MLStateConstraint *)v35;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MLFeatureDescription *)self name];
  [v4 encodeObject:v5 forKey:@"name"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[MLFeatureDescription type](self, "type"), @"type");
  objc_msgSend(v4, "encodeBool:forKey:", -[MLFeatureDescription isOptional](self, "isOptional"), @"optional");
  id v6 = [(MLFeatureDescription *)self valueConstraints];
  [v4 encodeObject:v6 forKey:@"constraints"];
}

- (id)description
{
  switch(self->_type)
  {
    case 4:
      v3 = NSString;
      name = self->_name;
      uint64_t v5 = [(MLFeatureDescription *)self imageConstraint];
      id v6 = (void *)v5;
      if (self->_optional) {
        v7 = @"?";
      }
      else {
        v7 = &stru_1EF0E81D0;
      }
      [v3 stringWithFormat:@"%@ : Image (%@)%@", name, v5, v7];
      break;
    case 5:
      id v12 = NSString;
      v13 = self->_name;
      uint64_t v14 = [(MLFeatureDescription *)self multiArrayConstraint];
      id v6 = (void *)v14;
      if (self->_optional) {
        uint64_t v15 = @"?";
      }
      else {
        uint64_t v15 = &stru_1EF0E81D0;
      }
      [v12 stringWithFormat:@"%@ : MultiArray (%@)%@", v13, v14, v15];
      break;
    case 6:
      id v16 = NSString;
      uint64_t v17 = self->_name;
      uint64_t v18 = [(MLFeatureDescription *)self dictionaryConstraint];
      id v6 = (void *)v18;
      if (self->_optional) {
        uint64_t v19 = @"?";
      }
      else {
        uint64_t v19 = &stru_1EF0E81D0;
      }
      [v16 stringWithFormat:@"%@ : Dictionary (%@)%@", v17, v18, v19];
      break;
    case 7:
      uint64_t v20 = NSString;
      uint64_t v21 = self->_name;
      uint64_t v22 = [(MLFeatureDescription *)self sequenceConstraint];
      id v6 = (void *)v22;
      if (self->_optional) {
        v23 = @"?";
      }
      else {
        v23 = &stru_1EF0E81D0;
      }
      [v20 stringWithFormat:@"%@ : Sequence (%@)%@", v21, v22, v23];
      break;
    case 8:
      v24 = NSString;
      uint64_t v25 = self->_name;
      uint64_t v26 = [(MLFeatureDescription *)self stateConstraint];
      id v6 = (void *)v26;
      if (self->_optional) {
        v27 = @"?";
      }
      else {
        v27 = &stru_1EF0E81D0;
      }
      [v24 stringWithFormat:@"%@ : State (%@)%@", v25, v26, v27];
      break;
    default:
      id v8 = NSString;
      v9 = self->_name;
      uint64_t v10 = +[MLFeatureTypeUtils descriptionForType:](MLFeatureTypeUtils, "descriptionForType:");
      id v6 = (void *)v10;
      if (self->_optional) {
        id v11 = @"?";
      }
      else {
        id v11 = &stru_1EF0E81D0;
      }
      [v8 stringWithFormat:@"%@ : %@%@", v9, v10, v11];
      break;
  v28 = };

  return v28;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(NSDictionary *)self->_valueConstraints allValues];
  id v6 = [+[MLFeatureDescription allocWithZone:a3] initWithName:self->_name type:self->_type optional:self->_optional contraints:v5];

  return v6;
}

- (BOOL)allowsValuesWithDescription:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 type];
  if (v5 != [(MLFeatureDescription *)self type]
    || !-[MLFeatureDescription isOptional](self, "isOptional") && ([v4 isOptional] & 1) != 0)
  {
    goto LABEL_23;
  }
  id v6 = [(MLFeatureDescription *)self multiArrayConstraint];

  if (v6)
  {
    v7 = [v4 multiArrayConstraint];

    if (!v7) {
      goto LABEL_23;
    }
    id v8 = [(MLFeatureDescription *)self multiArrayConstraint];
    v9 = [v8 shape];

    uint64_t v10 = [v4 multiArrayConstraint];
    id v11 = [v10 shape];

    uint64_t v12 = [v9 count];
    if (v12 != [v11 count])
    {
LABEL_22:

      goto LABEL_23;
    }
    if ([v9 count])
    {
      uint64_t v13 = 0;
      do
      {
        uint64_t v14 = [v9 objectAtIndexedSubscript:v13];
        uint64_t v15 = [v14 integerValue];

        if (v15 >= 1)
        {
          id v16 = [v11 objectAtIndexedSubscript:v13];
          uint64_t v17 = [v16 integerValue];

          if (v15 != v17) {
            goto LABEL_22;
          }
        }
      }
      while (++v13 < (unint64_t)[v9 count]);
    }
  }
  uint64_t v18 = [(MLFeatureDescription *)self imageConstraint];

  if (v18)
  {
    uint64_t v19 = [v4 imageConstraint];

    if (v19)
    {
      uint64_t v20 = [(MLFeatureDescription *)self imageConstraint];
      uint64_t v21 = [v20 pixelsWide];

      uint64_t v22 = [(MLFeatureDescription *)self imageConstraint];
      uint64_t v23 = [v22 pixelsHigh];

      v24 = [v4 imageConstraint];
      uint64_t v25 = [v24 pixelsWide];

      uint64_t v26 = [v4 imageConstraint];
      uint64_t v27 = [v26 pixelsHigh];

      BOOL v28 = 0;
      if (v21 != v25 || v23 != v27) {
        goto LABEL_24;
      }
      goto LABEL_17;
    }
LABEL_23:
    BOOL v28 = 0;
    goto LABEL_24;
  }
LABEL_17:
  uint64_t v29 = [(MLFeatureDescription *)self stateConstraint];

  if (v29)
  {
    uint64_t v30 = [v4 stateConstraint];

    if (!v30) {
      goto LABEL_23;
    }
    v31 = [(MLFeatureDescription *)self stateConstraint];
    uint64_t v32 = [v31 dataType];
    v33 = [v4 stateConstraint];
    uint64_t v34 = [v33 dataType];

    if (v32 != v34) {
      goto LABEL_23;
    }
    uint64_t v35 = [(MLFeatureDescription *)self stateConstraint];
    v36 = [v35 bufferShape];

    v37 = [v4 stateConstraint];
    objc_super v38 = [v37 bufferShape];

    LODWORD(v37) = [v36 isEqualToArray:v38];
    if (!v37) {
      goto LABEL_23;
    }
  }
  BOOL v28 = 1;
LABEL_24:

  return v28;
}

- (id)stateConstraint
{
  return self->_stateConstraintCached;
}

- (MLSequenceConstraint)sequenceConstraint
{
  return self->_sequenceConstraintCached;
}

- (MLDictionaryConstraint)dictionaryConstraint
{
  return self->_dictionaryConstraintCached;
}

- (MLImageConstraint)imageConstraint
{
  return self->_imageConstraintCached;
}

- (BOOL)isAllowedValue:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int64_t type = self->_type;
  if (type != [v6 type])
  {
    if (!a4) {
      goto LABEL_18;
    }
    uint64_t v15 = +[MLFeatureTypeUtils descriptionForType:self->_type];
    id v16 = +[MLFeatureTypeUtils descriptionForType:](MLFeatureTypeUtils, "descriptionForType:", [v6 type]);
    *a4 = +[MLModelErrorUtils featureTypeErrorWithFormat:@"Expected feature of type %@ but got %@", v15, v16];

LABEL_15:
    LOBYTE(a4) = 0;
    goto LABEL_18;
  }
  if ([v6 isUndefined] && !self->_optional)
  {
    if (!a4) {
      goto LABEL_18;
    }
    uint64_t v15 = +[MLFeatureTypeUtils descriptionForType:self->_type];
    *a4 = +[MLModelErrorUtils featureTypeErrorWithFormat:@"Feature description does not allow missing %@ values", v15];
    goto LABEL_15;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = self->_valueConstraints;
  uint64_t v9 = [(NSDictionary *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [(NSDictionary *)self->_valueConstraints objectForKeyedSubscript:*(void *)(*((void *)&v18 + 1) + 8 * i)];
        int v14 = [v13 isAllowedValue:v6 error:a4];

        if (!v14)
        {
          LOBYTE(a4) = 0;
          goto LABEL_17;
        }
      }
      uint64_t v10 = [(NSDictionary *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  LOBYTE(a4) = 1;
LABEL_17:

LABEL_18:
  return (char)a4;
}

- (BOOL)isAllowedValue:(MLFeatureValue *)value
{
  return [(MLFeatureDescription *)self isAllowedValue:value error:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end