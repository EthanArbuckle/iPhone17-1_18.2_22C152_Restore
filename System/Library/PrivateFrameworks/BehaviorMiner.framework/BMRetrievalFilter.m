@interface BMRetrievalFilter
+ (id)filterWithOperand:(int64_t)a3 inclusionOperator:(int64_t)a4 items:(id)a5;
+ (id)filterWithOperand:(int64_t)a3 inclusionOperator:(int64_t)a4 types:(id)a5;
- (NSSet)items;
- (NSSet)types;
- (id)rulePredicate;
- (int64_t)inclusionOperator;
- (int64_t)operand;
- (void)setInclusionOperator:(int64_t)a3;
- (void)setItems:(id)a3;
- (void)setOperand:(int64_t)a3;
- (void)setTypes:(id)a3;
@end

@implementation BMRetrievalFilter

+ (id)filterWithOperand:(int64_t)a3 inclusionOperator:(int64_t)a4 items:(id)a5
{
  id v7 = a5;
  v8 = objc_alloc_init(BMRetrievalFilter);
  [(BMRetrievalFilter *)v8 setOperand:a3];
  [(BMRetrievalFilter *)v8 setInclusionOperator:a4];
  [(BMRetrievalFilter *)v8 setItems:v7];

  return v8;
}

+ (id)filterWithOperand:(int64_t)a3 inclusionOperator:(int64_t)a4 types:(id)a5
{
  id v7 = a5;
  v8 = objc_alloc_init(BMRetrievalFilter);
  [(BMRetrievalFilter *)v8 setOperand:a3];
  [(BMRetrievalFilter *)v8 setInclusionOperator:a4];
  [(BMRetrievalFilter *)v8 setTypes:v7];

  return v8;
}

- (id)rulePredicate
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v3 = [(BMRetrievalFilter *)self types];

  if (v3)
  {
    v4 = [(BMRetrievalFilter *)self types];
    v5 = NSStringFromSelector(sel_identifier);
    v6 = [v4 valueForKey:v5];
    id v7 = @"typeIdentifier";
  }
  else
  {
    v4 = [(BMRetrievalFilter *)self items];
    v5 = NSStringFromSelector(sel_uniformIdentifier);
    v6 = [v4 valueForKey:v5];
    id v7 = @"uniformIdentifier";
  }

  int64_t v8 = [(BMRetrievalFilter *)self operand];
  int64_t v9 = [(BMRetrievalFilter *)self inclusionOperator];
  id v10 = v6;
  if (v8 == 2)
  {
    v11 = @"consequent";
LABEL_10:
    v35 = v11;
    v36 = v7;
    v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v35 count:2];
    v13 = [v21 componentsJoinedByString:@"."];

    switch(v9)
    {
      case 0:
        [MEMORY[0x263F08A98] predicateWithFormat:@"ANY %K IN %@", v13, v10];
        goto LABEL_18;
      case 1:
        v23 = (void *)MEMORY[0x263F08A98];
        v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
        [v23 predicateWithFormat:@"SUBQUERY(%K, $identifier, $identifier IN %@).@count == %@", v13, v10, v24, v31, v32];
        goto LABEL_16;
      case 2:
        v25 = (void *)MEMORY[0x263F08A98];
        uint64_t v26 = [v10 count];
        v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
        [v25 predicateWithFormat:@"%K.@count == %lu AND SUBQUERY(%K, $identifier, $identifier IN %@).@count == %@", v13, v26, v13, v10, v24];
        v20 = LABEL_16:;

        goto LABEL_28;
      case 3:
        [MEMORY[0x263F08A98] predicateWithFormat:@"SUBQUERY(%K, $identifier, $identifier IN %@).@count == 0", v13, v10];
        uint64_t v22 = LABEL_18:;
        goto LABEL_19;
      default:
        uint64_t v22 = [MEMORY[0x263F08A98] predicateWithValue:0];
LABEL_19:
        v20 = (void *)v22;
        break;
    }
    goto LABEL_28;
  }
  v11 = @"antecedent";
  if (v8 == 1) {
    goto LABEL_10;
  }
  if (v8)
  {
    v20 = 0;
    goto LABEL_29;
  }
  v35 = @"antecedent";
  v36 = v7;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v35 count:2];
  v13 = [v12 componentsJoinedByString:@"."];

  v34[0] = @"consequent";
  v34[1] = v7;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:2];
  v15 = [v14 componentsJoinedByString:@"."];

  switch(v9)
  {
    case 0:
      v16 = [MEMORY[0x263F08A98] predicateWithFormat:@"ANY %K IN %@", v13, v10];
      v17 = [MEMORY[0x263F08A98] predicateWithFormat:@"ANY %K IN %@", v15, v10];
      v18 = (void *)MEMORY[0x263F08730];
      v33[0] = v16;
      v33[1] = v17;
      v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:2];
      v20 = [v18 orPredicateWithSubpredicates:v19];

      goto LABEL_23;
    case 1:
      v28 = (void *)MEMORY[0x263F08A98];
      v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
      v20 = [v28 predicateWithFormat:@"SUBQUERY(%K, $identifier, $identifier IN %@).@count + SUBQUERY(%K, $identifier, $identifier IN %@).@count == %@", v13, v10, v15, v10, v16];
      goto LABEL_24;
    case 2:
      v29 = (void *)MEMORY[0x263F08A98];
      v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
      v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
      v20 = [v29 predicateWithFormat:@"SUBQUERY(%K, $identifier, TRUEPREDICATE).@count + SUBQUERY(%K, $identifier, TRUEPREDICATE).@count == %@ AND SUBQUERY(%K, $identifier, $identifier IN %@).@count + SUBQUERY(%K, $identifier, $identifier IN %@).@count == %@", v13, v15, v16, v13, v10, v15, v10, v17];
LABEL_23:

LABEL_24:
      goto LABEL_27;
    case 3:
      uint64_t v27 = [MEMORY[0x263F08A98] predicateWithFormat:@"SUBQUERY(%K, $identifier, $identifier IN %@).@count + SUBQUERY(%K, $identifier, $identifier IN %@).@count == 0", v13, v10, v15, v10];
      goto LABEL_26;
    default:
      uint64_t v27 = [MEMORY[0x263F08A98] predicateWithValue:0];
LABEL_26:
      v20 = (void *)v27;
LABEL_27:

      break;
  }
LABEL_28:

LABEL_29:

  return v20;
}

- (int64_t)operand
{
  return self->_operand;
}

- (void)setOperand:(int64_t)a3
{
  self->_operand = a3;
}

- (int64_t)inclusionOperator
{
  return self->_inclusionOperator;
}

- (void)setInclusionOperator:(int64_t)a3
{
  self->_inclusionOperator = a3;
}

- (NSSet)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (NSSet)types
{
  return self->_types;
}

- (void)setTypes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_types, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

@end