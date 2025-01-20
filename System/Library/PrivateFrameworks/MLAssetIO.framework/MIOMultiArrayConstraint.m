@interface MIOMultiArrayConstraint
- (BOOL)isEqual:(id)a3;
- (MIOMultiArrayConstraint)initWithSpecification:(const void *)a3;
- (MIOMultiArrayShapeConstraint)shapeConstraint;
- (NSArray)shape;
- (NSString)description;
- (const)arrayFeatureTypeSpecification;
- (id).cxx_construct;
- (int64_t)dataType;
- (unint64_t)hash;
@end

@implementation MIOMultiArrayConstraint

- (MIOMultiArrayConstraint)initWithSpecification:(const void *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v27.receiver = self;
  v27.super_class = (Class)MIOMultiArrayConstraint;
  id v4 = [(MIOMultiArrayConstraint *)&v27 init];
  v5 = (MIOMultiArrayConstraint *)v4;
  if (v4)
  {
    CoreML::Specification::ArrayFeatureType::CopyFrom((unint64_t *)v4 + 1, (const CoreML::Specification::ArrayFeatureType *)a3);
    v6 = [[MIOMultiArrayShapeConstraint alloc] initWithSpecification:a3];
    shapeConstraint = v5->_shapeConstraint;
    v5->_shapeConstraint = v6;

    v8 = v5->_shapeConstraint;
    v9 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v10 = *((void *)a3 + 3);
    if (v10) {
      v11 = (void *)(v10 + 8);
    }
    else {
      v11 = 0;
    }
    if (v10) {
      uint64_t v12 = v10 + 8 + 8 * *((int *)a3 + 4);
    }
    else {
      uint64_t v12 = 0;
    }
    for (; v11 != (void *)v12; ++v11)
    {
      v13 = [NSNumber numberWithLongLong:*v11];
      [(NSArray *)v9 addObject:v13];
    }
    if ([(MIOMultiArrayShapeConstraint *)v8 type] == 2)
    {
      if ([(NSArray *)v9 count]) {
        goto LABEL_25;
      }
      v14 = [(MIOMultiArrayShapeConstraint *)v8 enumeratedShapes];
      BOOL v15 = [v14 count] == 0;

      if (v15) {
        goto LABEL_25;
      }
      v16 = [(MIOMultiArrayShapeConstraint *)v8 enumeratedShapes];
      v17 = [v16 objectAtIndexedSubscript:0];
      uint64_t v18 = [v17 mutableCopy];

      v9 = (NSArray *)v18;
    }
    else
    {
      if ([(MIOMultiArrayShapeConstraint *)v8 type] != 3) {
        goto LABEL_25;
      }
      if ([(NSArray *)v9 count]) {
        goto LABEL_25;
      }
      v19 = [(MIOMultiArrayShapeConstraint *)v8 sizeRangeForDimension];
      BOOL v20 = [v19 count] == 0;

      if (v20) {
        goto LABEL_25;
      }
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      v16 = [(MIOMultiArrayShapeConstraint *)v8 sizeRangeForDimension];
      uint64_t v21 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v29 != v22) {
              objc_enumerationMutation(v16);
            }
            v24 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "MIORangeValue"));
            [(NSArray *)v9 addObject:v24];
          }
          uint64_t v21 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v21);
      }
    }

LABEL_25:
    shape = v5->_shape;
    v5->_shape = v9;
  }
  return v5;
}

- (const)arrayFeatureTypeSpecification
{
  return &self->_arrayFeatureTypeParams;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = [(MIOMultiArrayConstraint *)self shape];
  v5 = [v4 componentsJoinedByString:@", "];
  uint64_t v6 = [(MIOMultiArrayConstraint *)self dataType];
  v7 = @"unknown";
  v8 = @"Double";
  if (v6 != 65600) {
    v8 = @"unknown";
  }
  if (v6 == 131104) {
    v9 = @"Int32";
  }
  else {
    v9 = v8;
  }
  if (v6 == 65568) {
    v7 = @"Float32";
  }
  if (v6 == 65552) {
    v7 = @"Float16";
  }
  if (v6 <= 65599) {
    uint64_t v10 = v7;
  }
  else {
    uint64_t v10 = v9;
  }
  v11 = [(MIOMultiArrayConstraint *)self shapeConstraint];
  uint64_t v12 = [v3 stringWithFormat:@"MIOMultiArrayConstraint { shape: [%@] dataType: %@ shapeConstraint: %@ }", v5, v10, v11];

  return (NSString *)v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MIOMultiArrayConstraint *)a3;
  if (self == v4)
  {
    BOOL v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(MIOMultiArrayConstraint *)self shape];
      v7 = [(MIOMultiArrayConstraint *)v5 shape];
      char v8 = [v6 isEqual:v7];

      if (v8)
      {
        int64_t v9 = [(MIOMultiArrayConstraint *)self dataType];
        if (v9 == [(MIOMultiArrayConstraint *)v5 dataType])
        {
          uint64_t v10 = [(MIOMultiArrayConstraint *)self shapeConstraint];
          if (v10
            && ([(MIOMultiArrayConstraint *)v5 shapeConstraint],
                v11 = objc_claimAutoreleasedReturnValue(),
                v11,
                v10,
                v11))
          {
            uint64_t v12 = [(MIOMultiArrayConstraint *)self shapeConstraint];
            v13 = [(MIOMultiArrayConstraint *)v5 shapeConstraint];
            char v14 = [v12 isEqual:v13];

            if (v14) {
              goto LABEL_17;
            }
          }
          else
          {
            v16 = [(MIOMultiArrayConstraint *)self shapeConstraint];
            if (v16)
            {
            }
            else
            {
              v17 = [(MIOMultiArrayConstraint *)v5 shapeConstraint];

              if (!v17)
              {
LABEL_17:
                BOOL v15 = 1;
                goto LABEL_15;
              }
            }
          }
        }
      }
      BOOL v15 = 0;
LABEL_15:

      goto LABEL_16;
    }
    BOOL v15 = 0;
  }
LABEL_16:

  return v15;
}

- (unint64_t)hash
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = [(MIOMultiArrayConstraint *)self shape];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v13;
    uint64_t v6 = 1;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v3);
        }
        v6 ^= [*(id *)(*((void *)&v12 + 1) + 8 * i) hash];
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v6 = 1;
  }

  int64_t v8 = [(MIOMultiArrayConstraint *)self dataType];
  int64_t v9 = [(MIOMultiArrayConstraint *)self shapeConstraint];
  uint64_t v10 = [v9 hash];

  return v8 ^ v6 ^ v10;
}

- (int64_t)dataType
{
  int64_t result = 65600;
  int datatype = self->_arrayFeatureTypeParams.datatype_;
  if (datatype > 65599)
  {
    if (datatype == 131104) {
      return 131104;
    }
  }
  else if (datatype == 65552)
  {
    return 65552;
  }
  else if (datatype == 65568)
  {
    return 65568;
  }
  return result;
}

- (NSArray)shape
{
  return self->_shape;
}

- (MIOMultiArrayShapeConstraint)shapeConstraint
{
  return self->_shapeConstraint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shapeConstraint, 0);
  objc_storeStrong((id *)&self->_shape, 0);
  CoreML::Specification::ArrayFeatureType::~ArrayFeatureType((CoreML::Specification::ArrayFeatureType *)&self->_arrayFeatureTypeParams);
}

- (id).cxx_construct
{
  return self;
}

@end