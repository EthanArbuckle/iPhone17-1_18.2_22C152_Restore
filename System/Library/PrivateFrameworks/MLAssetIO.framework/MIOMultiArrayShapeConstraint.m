@interface MIOMultiArrayShapeConstraint
- (BOOL)isEqual:(id)a3;
- (MIOMultiArrayShapeConstraint)init;
- (MIOMultiArrayShapeConstraint)initWithEnumeratedShapes:(id)a3;
- (MIOMultiArrayShapeConstraint)initWithSizeRangeForDimension:(id)a3;
- (MIOMultiArrayShapeConstraint)initWithSpecification:(const void *)a3;
- (NSArray)enumeratedShapes;
- (NSArray)sizeRangeForDimension;
- (id)description;
- (int64_t)type;
- (unint64_t)hash;
@end

@implementation MIOMultiArrayShapeConstraint

- (MIOMultiArrayShapeConstraint)init
{
  v9.receiver = self;
  v9.super_class = (Class)MIOMultiArrayShapeConstraint;
  v2 = [(MIOMultiArrayShapeConstraint *)&v9 init];
  v3 = v2;
  if (v2)
  {
    sizeRangeForDimension = v2->_sizeRangeForDimension;
    v5 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v2->_type = 1;
    v2->_sizeRangeForDimension = v5;

    v6 = (NSOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CAA0]);
    shapeSet = v3->_shapeSet;
    v3->_shapeSet = v6;
  }
  return v3;
}

- (MIOMultiArrayShapeConstraint)initWithSizeRangeForDimension:(id)a3
{
  id v4 = a3;
  v5 = [(MIOMultiArrayShapeConstraint *)self init];
  v6 = v5;
  if (v5)
  {
    v5->_type = 3;
    uint64_t v7 = [v4 copy];
    sizeRangeForDimension = v6->_sizeRangeForDimension;
    v6->_sizeRangeForDimension = (NSArray *)v7;

    objc_super v9 = (NSOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CAA0]);
    shapeSet = v6->_shapeSet;
    v6->_shapeSet = v9;
  }
  return v6;
}

- (MIOMultiArrayShapeConstraint)initWithEnumeratedShapes:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(MIOMultiArrayShapeConstraint *)self init];
  v33 = v5;
  if (v4)
  {
    if ([v4 count])
    {
      v6 = [v4 objectAtIndexedSubscript:0];
      uint64_t v7 = [v6 count];

      if (v7)
      {
        if (v5)
        {
          v5->_type = 2;
          uint64_t v8 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v4];
          id v32 = v4;
          shapeSet = v5->_shapeSet;
          v5->_shapeSet = (NSOrderedSet *)v8;

          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          v10 = v5->_shapeSet;
          unint64_t v11 = 0;
          uint64_t v12 = [(NSOrderedSet *)v10 countByEnumeratingWithState:&v39 objects:v44 count:16];
          if (v12)
          {
            uint64_t v13 = *(void *)v40;
            do
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                if (*(void *)v40 != v13) {
                  objc_enumerationMutation(v10);
                }
                v15 = *(void **)(*((void *)&v39 + 1) + 8 * i);
                if (v11 <= objc_msgSend(v15, "count", v32)) {
                  unint64_t v11 = [v15 count];
                }
              }
              uint64_t v12 = [(NSOrderedSet *)v10 countByEnumeratingWithState:&v39 objects:v44 count:16];
            }
            while (v12);
          }

          v16 = malloc_type_malloc(8 * v11, 0x100004000313F17uLL);
          v17 = malloc_type_malloc(8 * v11, 0x100004000313F17uLL);
          v18 = v17;
          if (v11)
          {
            v19 = v16;
            v20 = v17;
            unint64_t v21 = v11;
            do
            {
              *v19++ = -1;
              *v20++ = 0;
              --v21;
            }
            while (v21);
          }
          long long v37 = 0u;
          long long v38 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          v22 = v5->_shapeSet;
          uint64_t v23 = [(NSOrderedSet *)v22 countByEnumeratingWithState:&v35 objects:v43 count:16];
          if (v23)
          {
            uint64_t v24 = *(void *)v36;
            do
            {
              for (uint64_t j = 0; j != v23; ++j)
              {
                if (*(void *)v36 != v24) {
                  objc_enumerationMutation(v22);
                }
                v26 = *(void **)(*((void *)&v35 + 1) + 8 * j);
                v34[0] = MEMORY[0x1E4F143A8];
                v34[1] = 3221225472;
                v34[2] = __57__MIOMultiArrayShapeConstraint_initWithEnumeratedShapes___block_invoke;
                v34[3] = &__block_descriptor_48_e25_v32__0__NSNumber_8Q16_B24l;
                v34[4] = v16;
                v34[5] = v18;
                objc_msgSend(v26, "enumerateObjectsUsingBlock:", v34, v32);
              }
              uint64_t v23 = [(NSOrderedSet *)v22 countByEnumeratingWithState:&v35 objects:v43 count:16];
            }
            while (v23);
          }

          v27 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v11];
          if (v11)
          {
            for (uint64_t k = 0; k != v11; ++k)
            {
              v29 = [MEMORY[0x1E4F29238] valueWithRange:v32];
              [(NSArray *)v27 setObject:v29 atIndexedSubscript:k];
            }
          }
          sizeRangeForDimension = v33->_sizeRangeForDimension;
          v33->_sizeRangeForDimension = v27;

          free(v16);
          free(v18);
          id v4 = v32;
        }
      }
    }
  }

  return v33;
}

void __57__MIOMultiArrayShapeConstraint_initWithEnumeratedShapes___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  unint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8 * a3);
  id v12 = v5;
  if (v6 >= [v5 unsignedIntegerValue])
  {
    uint64_t v8 = [v12 unsignedIntegerValue];
    uint64_t v7 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(v7 + 8 * a3);
  }
  *(void *)(v7 + 8 * a3) = v8;
  unint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8 * a3);
  if (v9 <= [v12 unsignedIntegerValue])
  {
    uint64_t v11 = [v12 unsignedIntegerValue];
    uint64_t v10 = *(void *)(a1 + 40);
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(void *)(v10 + 8 * a3);
  }
  *(void *)(v10 + 8 * a3) = v11;
}

- (MIOMultiArrayShapeConstraint)initWithSpecification:(const void *)a3
{
  int v5 = *((_DWORD *)a3 + 15);
  if (v5 == 31)
  {
    unint64_t v9 = (CoreML::Specification::ArrayFeatureType_ShapeRange *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = v9;
    if (*((_DWORD *)a3 + 15) == 31) {
      uint64_t v10 = (uint64_t *)*((void *)a3 + 5);
    }
    else {
      uint64_t v10 = CoreML::Specification::ArrayFeatureType_ShapeRange::default_instance(v9);
    }
    uint64_t v23 = v10[4];
    if (v23) {
      uint64_t v24 = v23 + 8;
    }
    else {
      uint64_t v24 = 0;
    }
    uint64_t v25 = *((int *)v10 + 6);
    if (v25)
    {
      uint64_t v26 = 8 * v25;
      do
      {
        if (*(uint64_t *)(*(void *)v24 + 24) <= 0) {
          uint64_t v27 = -1;
        }
        else {
          uint64_t v27 = *(void *)(*(void *)v24 + 24);
        }
        uint64_t v28 = MIOMakeRange(*(void *)(*(void *)v24 + 16), v27);
        v30 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithMIORange:", v28, v29);
        [(CoreML::Specification::ArrayFeatureType_ShapeRange *)v7 addObject:v30];

        v24 += 8;
        v26 -= 8;
      }
      while (v26);
    }
    v22 = [(MIOMultiArrayShapeConstraint *)self initWithSizeRangeForDimension:v7];
    goto LABEL_37;
  }
  if (v5 == 21)
  {
    unint64_t v6 = (CoreML::Specification::ArrayFeatureType_EnumeratedShapes *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = v6;
    if (*((_DWORD *)a3 + 15) == 21) {
      uint64_t v8 = (uint64_t *)*((void *)a3 + 5);
    }
    else {
      uint64_t v8 = CoreML::Specification::ArrayFeatureType_EnumeratedShapes::default_instance(v6);
    }
    uint64_t v12 = v8[4];
    if (v12) {
      uint64_t v13 = (uint64_t *)(v12 + 8);
    }
    else {
      uint64_t v13 = 0;
    }
    uint64_t v14 = *((int *)v8 + 6);
    if (v14)
    {
      v15 = &v13[v14];
      do
      {
        uint64_t v16 = *v13;
        id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v18 = *(void *)(v16 + 24);
        if (v18) {
          v19 = (void *)(v18 + 8);
        }
        else {
          v19 = 0;
        }
        if (v18) {
          uint64_t v20 = v18 + 8 + 8 * *(int *)(v16 + 16);
        }
        else {
          uint64_t v20 = 0;
        }
        while (v19 != (void *)v20)
        {
          unint64_t v21 = [NSNumber numberWithLongLong:*v19];
          [v17 addObject:v21];

          ++v19;
        }
        [(CoreML::Specification::ArrayFeatureType_ShapeRange *)v7 addObject:v17];

        ++v13;
      }
      while (v13 != v15);
    }
    v22 = [(MIOMultiArrayShapeConstraint *)self initWithEnumeratedShapes:v7];
LABEL_37:
    v31 = v22;

    return v31;
  }
  return [(MIOMultiArrayShapeConstraint *)self init];
}

- (NSArray)enumeratedShapes
{
  return [(NSOrderedSet *)self->_shapeSet array];
}

- (id)description
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  int64_t v4 = [(MIOMultiArrayShapeConstraint *)self type];
  int v5 = @"unspecified";
  if (v4 == 3) {
    int v5 = @"ranges";
  }
  if (v4 == 2) {
    int v5 = @"enumerated";
  }
  unint64_t v6 = (void *)[v3 initWithFormat:@"MIOMultiArrayShapeConstraint (%@) ", v5];
  if ([(MIOMultiArrayShapeConstraint *)self type] == 2)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v7 = [(MIOMultiArrayShapeConstraint *)self enumeratedShapes];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = [*(id *)(*((void *)&v22 + 1) + 8 * i) componentsJoinedByString:@", "];
          [v6 appendFormat:@"(%@) ", v11];
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v8);
    }
  }
  else
  {
    if ([(MIOMultiArrayShapeConstraint *)self type] != 3) {
      goto LABEL_23;
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v7 = [(MIOMultiArrayShapeConstraint *)self sizeRangeForDimension];
    uint64_t v12 = [v7 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v7);
          }
          uint64_t v15 = [*(id *)(*((void *)&v18 + 1) + 8 * j) MIORangeValue];
          [v6 appendFormat:@"[%zd, %zd] ", v15, v16];
        }
        uint64_t v12 = [v7 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v12);
    }
  }

LABEL_23:
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int64_t v4 = (MIOMultiArrayShapeConstraint *)a3;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v5 = v4;
      int64_t v6 = [(MIOMultiArrayShapeConstraint *)self type];
      if (v6 == [(MIOMultiArrayShapeConstraint *)v5 type])
      {
        if ([(MIOMultiArrayShapeConstraint *)self type] == 2)
        {
          uint64_t v7 = [(MIOMultiArrayShapeConstraint *)self enumeratedShapes];
          uint64_t v8 = [(MIOMultiArrayShapeConstraint *)v5 enumeratedShapes];
          char v9 = [v7 isEqual:v8];
        }
        else
        {
          if ([(MIOMultiArrayShapeConstraint *)self type] != 3)
          {
            BOOL v10 = 1;
            goto LABEL_13;
          }
          uint64_t v7 = [(MIOMultiArrayShapeConstraint *)self sizeRangeForDimension];
          uint64_t v8 = [(MIOMultiArrayShapeConstraint *)v5 sizeRangeForDimension];
          char v9 = [v7 isEqual:v8];
        }
        BOOL v10 = v9;
      }
      else
      {
        BOOL v10 = 0;
      }
LABEL_13:

      goto LABEL_14;
    }
    BOOL v10 = 0;
  }
LABEL_14:

  return v10;
}

- (unint64_t)hash
{
  int64_t v3 = [(MIOMultiArrayShapeConstraint *)self type];
  int64_t v4 = [(MIOMultiArrayShapeConstraint *)self enumeratedShapes];
  uint64_t v5 = [v4 hash];
  int64_t v6 = [(MIOMultiArrayShapeConstraint *)self sizeRangeForDimension];
  unint64_t v7 = v5 ^ v3 ^ [v6 hash];

  return v7;
}

- (int64_t)type
{
  return self->_type;
}

- (NSArray)sizeRangeForDimension
{
  return self->_sizeRangeForDimension;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeRangeForDimension, 0);
  objc_storeStrong((id *)&self->_shapeSet, 0);
}

@end