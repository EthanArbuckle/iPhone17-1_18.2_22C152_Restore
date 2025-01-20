@interface MLMultiArrayShapeConstraint
+ (BOOL)supportsSecureCoding;
- (BOOL)isAllowedShape:(id)a3 error:(id *)a4;
- (MLMultiArrayShapeConstraint)initWithCoder:(id)a3;
- (MLMultiArrayShapeConstraint)initWithEnumeratedShapes:(id)a3;
- (MLMultiArrayShapeConstraint)initWithSizeRangeForDimension:(id)a3;
- (MLMultiArrayShapeConstraintType)type;
- (NSArray)enumeratedShapes;
- (NSArray)sizeRangeForDimension;
- (NSOrderedSet)shapeSet;
- (id)findAvailableShape:(id)a3;
- (id)initUnspecified;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MLMultiArrayShapeConstraint

void __52__MLMultiArrayShapeConstraint_isAllowedShape_error___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  unint64_t v7 = [a2 unsignedIntegerValue];
  v8 = [*(id *)(a1[4] + 16) objectAtIndexedSubscript:a3];
  unint64_t v9 = [v8 rangeValue];
  unint64_t v11 = v10;

  if (v7 < v9 || v7 - v9 >= v11)
  {
    if (a1[7])
    {
      v13 = [NSNumber numberWithUnsignedInteger:v7];
      v14 = [NSNumber numberWithUnsignedInteger:a3];
      v15 = [NSNumber numberWithUnsignedInteger:v9];
      v16 = [NSNumber numberWithUnsignedInteger:v11 + v9 - 1];
      uint64_t v17 = +[MLModelErrorUtils genericErrorWithFormat:@"Size (%@) of dimension (%@) is not in allowed range (%@..%@)", v13, v14, v15, v16];
      uint64_t v18 = *(void *)(a1[5] + 8);
      v19 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = v17;
    }
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (MLMultiArrayShapeConstraintType)type
{
  return self->_type;
}

- (MLMultiArrayShapeConstraint)initWithEnumeratedShapes:(id)a3
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4
    && [v4 count]
    && ([v5 objectAtIndexedSubscript:0],
        v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 count],
        v6,
        v7))
  {
    v84.receiver = self;
    v84.super_class = (Class)MLMultiArrayShapeConstraint;
    v8 = [(MLMultiArrayShapeConstraint *)&v84 init];
    unint64_t v9 = v8;
    if (v8)
    {
      v8->_type = 2;
      uint64_t v10 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v5];
      shapeSet = v9->_shapeSet;
      v9->_shapeSet = (NSOrderedSet *)v10;

      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      v12 = v9->_shapeSet;
      uint64_t v13 = [(NSOrderedSet *)v12 countByEnumeratingWithState:&v80 objects:v85 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        unint64_t v15 = 0;
        uint64_t v16 = *(void *)v81;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v81 != v16) {
              objc_enumerationMutation(v12);
            }
            uint64_t v18 = *(void **)(*((void *)&v80 + 1) + 8 * i);
            if (v15 <= [v18 count]) {
              unint64_t v15 = [v18 count];
            }
          }
          uint64_t v14 = [(NSOrderedSet *)v12 countByEnumeratingWithState:&v80 objects:v85 count:16];
        }
        while (v14);
      }
      else
      {
        unint64_t v15 = 0;
      }

      v22 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v15];
      v23 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v15];
      v24 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v15];
      unint64_t v70 = v15;
      if (v15)
      {
        unint64_t v25 = v15;
        do
        {
          [v22 addObject:&unk_1EF11A160];
          [v23 addObject:&unk_1EF11A160];
          v26 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", 0, 0);
          [(NSArray *)v24 addObject:v26];

          --v25;
        }
        while (v25);
      }
      if (![(NSOrderedSet *)v9->_shapeSet count])
      {
        sizeRangeForDimension = v9->_sizeRangeForDimension;
        v9->_sizeRangeForDimension = v24;

        v20 = v9;
        goto LABEL_17;
      }
      v69 = v5;
      v27 = [(NSOrderedSet *)v9->_shapeSet objectAtIndexedSubscript:0];
      uint64_t v28 = [v27 count];

      if (v28)
      {
        unint64_t v29 = 0;
        do
        {
          v30 = [(NSOrderedSet *)v9->_shapeSet objectAtIndexedSubscript:0];
          v31 = [v30 objectAtIndexedSubscript:v29];
          [v22 setObject:v31 atIndexedSubscript:v29];

          v32 = [v22 objectAtIndexedSubscript:v29];
          [v23 setObject:v32 atIndexedSubscript:v29];

          ++v29;
          v33 = [(NSOrderedSet *)v9->_shapeSet objectAtIndexedSubscript:0];
          unint64_t v34 = [v33 count];
        }
        while (v29 < v34);
      }
      v77 = v22;
      if ([(NSOrderedSet *)v9->_shapeSet count] >= 2)
      {
        uint64_t v35 = 1;
        v79 = v9;
        v76 = v24;
        do
        {
          uint64_t v71 = v35;
          v36 = [(NSOrderedSet *)v9->_shapeSet objectAtIndexedSubscript:0];
          uint64_t v37 = [v36 count];

          if (v37)
          {
            unint64_t v38 = 0;
            do
            {
              v39 = NSNumber;
              [(NSOrderedSet *)v9->_shapeSet objectAtIndexedSubscript:0];
              v41 = v40 = v9;
              v42 = [v41 objectAtIndexedSubscript:v38];
              unint64_t v43 = [v42 unsignedIntegerValue];
              v44 = [v77 objectAtIndexedSubscript:v38];
              unint64_t v45 = [v44 unsignedIntegerValue];
              if (v43 >= v45)
              {
                v46 = [v77 objectAtIndexedSubscript:v38];
                v47 = v46;
              }
              else
              {
                v74 = [(NSOrderedSet *)v40->_shapeSet objectAtIndexedSubscript:0];
                v46 = [v74 objectAtIndexedSubscript:v38];
                v72 = v46;
                v47 = v78;
              }
              v48 = objc_msgSend(v39, "numberWithUnsignedInteger:", objc_msgSend(v46, "unsignedIntegerValue"));
              [v77 setObject:v48 atIndexedSubscript:v38];

              v78 = v47;
              v49 = v47;
              if (v43 < v45)
              {

                v49 = v74;
              }

              v50 = NSNumber;
              v51 = [(NSOrderedSet *)v79->_shapeSet objectAtIndexedSubscript:0];
              v52 = [v51 objectAtIndexedSubscript:v38];
              unint64_t v53 = [v52 unsignedIntegerValue];
              v54 = [v23 objectAtIndexedSubscript:v38];
              unint64_t v55 = [v54 unsignedIntegerValue];
              if (v53 <= v55)
              {
                v56 = [v23 objectAtIndexedSubscript:v38];
                unint64_t v15 = (unint64_t)v56;
              }
              else
              {
                v75 = [(NSOrderedSet *)v79->_shapeSet objectAtIndexedSubscript:0];
                v56 = [v75 objectAtIndexedSubscript:v38];
                v73 = v56;
              }
              v24 = v76;
              v57 = objc_msgSend(v50, "numberWithUnsignedInteger:", objc_msgSend(v56, "unsignedIntegerValue"));
              [v23 setObject:v57 atIndexedSubscript:v38];

              v58 = (void *)v15;
              if (v53 > v55)
              {

                v58 = v75;
              }

              ++v38;
              unint64_t v9 = v79;
              v59 = [(NSOrderedSet *)v79->_shapeSet objectAtIndexedSubscript:0];
              unint64_t v60 = [v59 count];
            }
            while (v38 < v60);
          }
          uint64_t v35 = v71 + 1;
        }
        while (v71 + 1 < [(NSOrderedSet *)v9->_shapeSet count]);
      }
      if (v70)
      {
        for (uint64_t j = 0; j != v70; ++j)
        {
          v62 = [v77 objectAtIndexedSubscript:j];
          uint64_t v63 = [v62 unsignedIntegerValue];

          v64 = [v23 objectAtIndexedSubscript:j];
          uint64_t v65 = [v64 unsignedIntegerValue];

          v66 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v63, v65 - v63 + 1);
          [(NSArray *)v24 setObject:v66 atIndexedSubscript:j];
        }
      }
      v67 = v9->_sizeRangeForDimension;
      v9->_sizeRangeForDimension = v24;

      v5 = v69;
    }
    v19 = v9;
  }
  else
  {
    v19 = (MLMultiArrayShapeConstraint *)[(MLMultiArrayShapeConstraint *)self initUnspecified];
  }
  v20 = v19;
LABEL_17:

  return v20;
}

- (id)initUnspecified
{
  v9.receiver = self;
  v9.super_class = (Class)MLMultiArrayShapeConstraint;
  v2 = [(MLMultiArrayShapeConstraint *)&v9 init];
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

- (MLMultiArrayShapeConstraint)initWithSizeRangeForDimension:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MLMultiArrayShapeConstraint;
  v6 = [(MLMultiArrayShapeConstraint *)&v11 init];
  uint64_t v7 = v6;
  if (v6)
  {
    v6->_type = 3;
    objc_storeStrong((id *)&v6->_sizeRangeForDimension, a3);
    v8 = (NSOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CAA0]);
    shapeSet = v7->_shapeSet;
    v7->_shapeSet = v8;
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shapeSet, 0);

  objc_storeStrong((id *)&self->_sizeRangeForDimension, 0);
}

- (BOOL)isAllowedShape:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 1;
  int64_t type = self->_type;
  if (type == 2)
  {
    if ([(NSOrderedSet *)self->_shapeSet containsObject:v6]) {
      goto LABEL_18;
    }
    if (a4)
    {
      uint64_t v10 = [(MLMultiArrayShapeConstraint *)self enumeratedShapes];
      uint64_t v11 = [v10 count];

      if (v11 != 1)
      {
        v12 = [v7 componentsJoinedByString:@" x "];
        *a4 = +[MLModelErrorUtils genericErrorWithFormat:@"MultiArray Shape (%@) was not in enumerated set of allowed shapes", v12];
        goto LABEL_16;
      }
      v12 = [v7 componentsJoinedByString:@" x "];
      uint64_t v13 = [(MLMultiArrayShapeConstraint *)self enumeratedShapes];
      uint64_t v14 = [v13 objectAtIndexedSubscript:0];
      unint64_t v15 = [v14 componentsJoinedByString:@" x "];
      *a4 = +[MLModelErrorUtils genericErrorWithFormat:@"MultiArray shape (%@) does not match the shape (%@) specified in the model description", v12, v15];

LABEL_14:
LABEL_16:
    }
LABEL_17:
    *((unsigned char *)v26 + 24) = 0;
    goto LABEL_18;
  }
  if (type != 3) {
    goto LABEL_18;
  }
  uint64_t v9 = [v6 count];
  if (v9 != [(NSArray *)self->_sizeRangeForDimension count])
  {
    if (a4)
    {
      v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
      uint64_t v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSArray count](self->_sizeRangeForDimension, "count"));
      *a4 = +[MLModelErrorUtils genericErrorWithFormat:@"MultiArray %@-d shape is not allowed, expected %@-d", v12, v13];
      goto LABEL_14;
    }
    goto LABEL_17;
  }
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__5409;
  v23 = __Block_byref_object_dispose__5410;
  id v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __52__MLMultiArrayShapeConstraint_isAllowedShape_error___block_invoke;
  v18[3] = &unk_1E59A3F40;
  v18[4] = self;
  v18[5] = &v19;
  v18[6] = &v25;
  v18[7] = a4;
  [v7 enumerateObjectsUsingBlock:v18];
  if (a4 && !*((unsigned char *)v26 + 24)) {
    *a4 = (id) v20[5];
  }
  _Block_object_dispose(&v19, 8);

LABEL_18:
  char v16 = *((unsigned char *)v26 + 24);
  _Block_object_dispose(&v25, 8);

  return v16;
}

- (NSOrderedSet)shapeSet
{
  return self->_shapeSet;
}

- (NSArray)sizeRangeForDimension
{
  return self->_sizeRangeForDimension;
}

- (MLMultiArrayShapeConstraint)initWithCoder:(id)a3
{
  v15[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MLMultiArrayShapeConstraint;
  id v5 = [(MLMultiArrayShapeConstraint *)&v14 init];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v15[2] = objc_opt_class();
    v15[3] = objc_opt_class();
    v15[4] = objc_opt_class();
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:5];
    [v6 addObjectsFromArray:v7];

    v8 = [v4 allowedClasses];
    [v6 unionSet:v8];

    uint64_t v9 = [v4 decodeObjectOfClasses:v6 forKey:@"shapeSet"];
    shapeSet = v5->_shapeSet;
    v5->_shapeSet = (NSOrderedSet *)v9;

    v5->_int64_t type = [v4 decodeIntegerForKey:@"type"];
    uint64_t v11 = [v4 decodeObjectOfClasses:v6 forKey:@"sizeRangeForDimension"];
    sizeRangeForDimension = v5->_sizeRangeForDimension;
    v5->_sizeRangeForDimension = (NSArray *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(MLMultiArrayShapeConstraint *)self sizeRangeForDimension];
  [v4 encodeObject:v5 forKey:@"sizeRangeForDimension"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[MLMultiArrayShapeConstraint type](self, "type"), @"type");
  id v6 = [(MLMultiArrayShapeConstraint *)self shapeSet];
  [v4 encodeObject:v6 forKey:@"shapeSet"];
}

- (id)findAvailableShape:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t type = self->_type;
  if (type == 1) {
    goto LABEL_7;
  }
  if (type == 2)
  {
    if (![(NSOrderedSet *)self->_shapeSet containsObject:v4])
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      uint64_t v7 = self->_shapeSet;
      id v6 = (id)[(NSOrderedSet *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6)
      {
        uint64_t v8 = *(void *)v13;
        while (2)
        {
          for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v13 != v8) {
              objc_enumerationMutation(v7);
            }
            uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
            if (+[MLFeatureTypeUtils canShapeArrayBePromotedFrom:to:](MLFeatureTypeUtils, "canShapeArrayBePromotedFrom:to:", v4, v10, (void)v12))
            {
              id v6 = v10;
              goto LABEL_19;
            }
          }
          id v6 = (id)[(NSOrderedSet *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
LABEL_19:

      goto LABEL_20;
    }
LABEL_7:
    id v6 = v4;
    goto LABEL_20;
  }
  if (type != 3)
  {
    id v6 = 0;
    goto LABEL_20;
  }
  id v6 = 0;
  if ([(MLMultiArrayShapeConstraint *)self isAllowedShape:v4 error:0]) {
    goto LABEL_7;
  }
LABEL_20:

  return v6;
}

- (NSArray)enumeratedShapes
{
  return [(NSOrderedSet *)self->_shapeSet array];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end