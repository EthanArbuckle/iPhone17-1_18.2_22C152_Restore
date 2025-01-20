@interface INCodableAttributeRelationship
+ (BOOL)supportsSecureCoding;
+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4;
- (BOOL)compareValue:(id)a3;
- (Class)valueClass;
- (INCodableAttribute)codableAttribute;
- (INCodableAttribute)parentCodableAttribute;
- (INCodableAttributeRelationship)initWithCodableAttribute:(id)a3;
- (INCodableAttributeRelationship)initWithCoder:(id)a3;
- (INCodableDescription)_codableDescription;
- (NSArray)values;
- (NSDictionary)_originalDictionary;
- (NSString)description;
- (id)__INCodableDescriptionParentNameKey;
- (id)__INCodableDescriptionPredicateNameKey;
- (id)__INCodableDescriptionPredicateValueKey;
- (id)__INCodableDescriptionPredicateValuesKey;
- (id)__INIntentResponseCodableDescriptionParentNameKey;
- (id)__INIntentResponseCodableDescriptionPredicateNameKey;
- (id)__INIntentResponseCodableDescriptionPredicateValueKey;
- (id)__INIntentResponseCodableDescriptionPredicateValuesKey;
- (id)__INTypeCodableDescriptionParentNameKey;
- (id)__INTypeCodableDescriptionPredicateNameKey;
- (id)__INTypeCodableDescriptionPredicateValueKey;
- (id)__INTypeCodableDescriptionPredicateValuesKey;
- (id)descriptionAtIndent:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)dictionaryRepresentationWithLocalizer:(id)a3;
- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4;
- (unint64_t)relation;
- (void)_establishRelationship;
- (void)_setOriginalDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCodableAttribute:(id)a3;
- (void)setParentCodableAttribute:(id)a3;
- (void)setRelation:(unint64_t)a3;
- (void)setValues:(id)a3;
- (void)updateWithDictionary:(id)a3;
@end

@implementation INCodableAttributeRelationship

- (INCodableAttributeRelationship)initWithCoder:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;
  [v6 _allowDecodingCyclesInSecureMode];

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"codableAttribute"];
  v8 = [(INCodableAttributeRelationship *)self initWithCodableAttribute:v7];

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v9, "setWithObjects:", v10, v11, v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"_originalDictionary"];
    originalDictionary = v8->_originalDictionary;
    v8->_originalDictionary = (NSDictionary *)v14;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_establishRelationship
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (self->_originalDictionary)
  {
    v3 = [(INCodableAttributeRelationship *)self codableAttribute];
    originalDictionary = self->_originalDictionary;
    v5 = [(INCodableAttributeRelationship *)self __INCodableDescriptionParentNameKey];
    id v6 = [(NSDictionary *)originalDictionary objectForKeyedSubscript:v5];

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v7 = [v3 _codableDescription];
    v8 = [v7 attributes];
    v9 = [v8 allValues];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v47;
LABEL_4:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v47 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v46 + 1) + 8 * v13);
        v15 = [v14 propertyName];
        char v16 = [v15 isEqualToString:v6];

        if (v16) {
          break;
        }
        if (v11 == ++v13)
        {
          uint64_t v11 = [v9 countByEnumeratingWithState:&v46 objects:v51 count:16];
          if (v11) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v17 = v14;
      objc_storeWeak((id *)&self->_parentCodableAttribute, v17);

      if (!v17) {
        goto LABEL_49;
      }
      v18 = self->_originalDictionary;
      v19 = [(INCodableAttributeRelationship *)self __INCodableDescriptionPredicateNameKey];
      v20 = [(NSDictionary *)v18 objectForKeyedSubscript:v19];

      v21 = (objc_class *)[v17 _relationshipValueTransformerClass];
      if (v21) {
        v22 = (void *)[[v21 alloc] initWithCodableAttribute:v17];
      }
      else {
        v22 = 0;
      }
      id v23 = v20;
      if ([v23 hasSuffix:@"HasAnyValue"])
      {
        unint64_t v24 = 1;
      }
      else if ([v23 hasSuffix:@"HasExactValue"])
      {
        unint64_t v24 = 2;
      }
      else if ([v23 hasSuffix:@"ValueIsNotEqual"])
      {
        unint64_t v24 = 3;
      }
      else if ([v23 hasSuffix:@"ValueIsGreaterThan"])
      {
        unint64_t v24 = 4;
      }
      else if ([v23 hasSuffix:@"ValueIsGreaterThanOrEqual"])
      {
        unint64_t v24 = 5;
      }
      else if ([v23 hasSuffix:@"ValueIsLessThan"])
      {
        unint64_t v24 = 6;
      }
      else if ([v23 hasSuffix:@"ValueIsLessThanOrEqual"])
      {
        unint64_t v24 = 7;
      }
      else if ([v23 hasSuffix:@"ValueIsWithinRange"])
      {
        unint64_t v24 = 8;
      }
      else if ([v23 hasSuffix:@"ValueContains"])
      {
        unint64_t v24 = 9;
      }
      else if ([v23 hasSuffix:@"ValueDoesNotContain"])
      {
        unint64_t v24 = 10;
      }
      else
      {
        unint64_t v24 = 0;
      }

      self->_relation = v24;
      v25 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v26 = self->_originalDictionary;
      v27 = [(INCodableAttributeRelationship *)self __INCodableDescriptionPredicateValuesKey];
      v28 = [(NSDictionary *)v26 objectForKeyedSubscript:v27];

      if (v28 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v29 = v28;
        uint64_t v30 = [v29 countByEnumeratingWithState:&v42 objects:v50 count:16];
        if (v30)
        {
          uint64_t v31 = v30;
          id v40 = v23;
          v41 = v3;
          uint64_t v32 = *(void *)v43;
          do
          {
            for (uint64_t i = 0; i != v31; ++i)
            {
              if (*(void *)v43 != v32) {
                objc_enumerationMutation(v29);
              }
              v34 = objc_msgSend(v22, "transformedValue:", *(void *)(*((void *)&v42 + 1) + 8 * i), v40, v41, (void)v42);
              [(NSArray *)v25 if_addObjectIfNonNil:v34];
            }
            uint64_t v31 = [v29 countByEnumeratingWithState:&v42 objects:v50 count:16];
          }
          while (v31);
          v35 = v29;
          id v23 = v40;
          v3 = v41;
        }
        else
        {
          v35 = v29;
        }
      }
      else
      {

        v36 = self->_originalDictionary;
        v35 = [(INCodableAttributeRelationship *)self __INCodableDescriptionPredicateValueKey];
        id v29 = [(NSDictionary *)v36 objectForKeyedSubscript:v35];
        [v22 transformedValue:v29];
        v38 = v37 = v3;
        [(NSArray *)v25 if_addObjectIfNonNil:v38];

        v3 = v37;
      }

      values = self->_values;
      self->_values = v25;
    }
    else
    {
LABEL_10:
      id v17 = v9;
    }

LABEL_49:
  }
}

- (INCodableAttributeRelationship)initWithCodableAttribute:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)INCodableAttributeRelationship;
  v5 = [(INCodableAttributeRelationship *)&v8 init];
  id v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_codableAttribute, v4);
  }

  return v6;
}

- (void)updateWithDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_codableAttribute);
  objc_storeStrong((id *)&self->_values, 0);
  objc_destroyWeak((id *)&self->_parentCodableAttribute);

  objc_storeStrong((id *)&self->_originalDictionary, 0);
}

- (void)setCodableAttribute:(id)a3
{
}

- (INCodableAttribute)codableAttribute
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_codableAttribute);

  return (INCodableAttribute *)WeakRetained;
}

- (void)setValues:(id)a3
{
}

- (NSArray)values
{
  return self->_values;
}

- (void)setRelation:(unint64_t)a3
{
  self->_relation = a3;
}

- (unint64_t)relation
{
  return self->_relation;
}

- (void)setParentCodableAttribute:(id)a3
{
}

- (INCodableAttribute)parentCodableAttribute
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentCodableAttribute);

  return (INCodableAttribute *)WeakRetained;
}

- (void)_setOriginalDictionary:(id)a3
{
}

- (NSDictionary)_originalDictionary
{
  return self->_originalDictionary;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  return self->_originalDictionary;
}

- (id)dictionaryRepresentation
{
  v3 = objc_opt_new();
  id v4 = [(INCodableAttributeRelationship *)self dictionaryRepresentationWithLocalizer:v3];

  return v4;
}

- (INCodableDescription)_codableDescription
{
  v2 = [(INCodableAttributeRelationship *)self codableAttribute];
  v3 = [v2 _codableDescription];

  return (INCodableDescription *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  originalDictionary = self->_originalDictionary;
  id v5 = a3;
  [v5 encodeObject:originalDictionary forKey:@"_originalDictionary"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_codableAttribute);
  [v5 encodeConditionalObject:WeakRetained forKey:@"codableAttribute"];
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3, a4);
  objc_msgSend(v5, "intents_setPlistSafeObject:forKey:", self->_originalDictionary, @"_originalDictionary");
  id v6 = (void *)[v5 copy];

  return v6;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  id v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INCodableAttributeRelationship;
  id v6 = [(INCodableAttributeRelationship *)&v11 description];
  v7 = [(INCodableAttributeRelationship *)self dictionaryRepresentation];
  objc_super v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INCodableAttributeRelationship *)self descriptionAtIndent:0];
}

- (Class)valueClass
{
  v2 = [(INCodableAttributeRelationship *)self parentCodableAttribute];
  v3 = objc_msgSend((id)objc_msgSend(v2, "_relationshipValueTransformerClass"), "transformedValueClass");

  return (Class)v3;
}

- (BOOL)compareValue:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(INCodableAttributeRelationship *)self relation];
  unint64_t v6 = v5;
  if (v4 || v5 != 1)
  {
    objc_super v8 = [(INCodableAttributeRelationship *)self parentCodableAttribute];
    v9 = (objc_class *)[v8 _relationshipValueTransformerClass];
    if (v9) {
      uint64_t v10 = (void *)[[v9 alloc] initWithCodableAttribute:v8];
    }
    else {
      uint64_t v10 = 0;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v4;
      if (v4)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v12 = v11;
        }
        else {
          uint64_t v12 = 0;
        }
      }
      else
      {
        uint64_t v12 = 0;
      }
      id v15 = v12;

      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __47__INCodableAttributeRelationship_compareValue___block_invoke;
      v22[3] = &unk_1E551F418;
      id v23 = v10;
      uint64_t v14 = objc_msgSend(v15, "if_flatMap:", v22);
    }
    else
    {
      uint64_t v13 = [v10 transformedValue:v4];
      uint64_t v14 = (void *)v13;
      if (v4 && !v13)
      {
        if ((v6 | 2) == 3)
        {
          char v7 = 1;
LABEL_22:

          goto LABEL_23;
        }
        uint64_t v14 = 0;
      }
    }
    char v16 = [(INCodableAttributeRelationship *)self values];
    unint64_t v17 = [v16 count];
    v18 = [(INCodableAttributeRelationship *)self values];
    v19 = v18;
    if (v17 > 1)
    {
      char v7 = objc_msgSend(v14, "_intents_compareValue:relation:", v18, v6);
    }
    else
    {
      v20 = [v18 firstObject];
      char v7 = objc_msgSend(v14, "_intents_compareValue:relation:", v20, v6);
    }
    goto LABEL_22;
  }
  char v7 = 0;
LABEL_23:

  return v7;
}

id __47__INCodableAttributeRelationship_compareValue___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = (void *)MEMORY[0x1E4F1C978];
  v3 = [*(id *)(a1 + 32) transformedValue:a2];
  id v4 = objc_msgSend(v2, "if_arrayWithObjectIfNonNil:", v3);

  return v4;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v4 = a3;
  unint64_t v5 = objc_alloc_init(INCodableAttributeRelationship);
  uint64_t v6 = objc_msgSend(v4, "intents_safeObjectForKey:ofType:", @"_originalDictionary", objc_opt_class());

  originalDictionary = v5->_originalDictionary;
  v5->_originalDictionary = (NSDictionary *)v6;

  return v5;
}

- (id)__INTypeCodableDescriptionPredicateValuesKey
{
  v2 = [(INCodableAttributeRelationship *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeRelationshipPredicateValuesKey");

  return v3;
}

- (id)__INTypeCodableDescriptionPredicateValueKey
{
  v2 = [(INCodableAttributeRelationship *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeRelationshipPredicateValueKey");

  return v3;
}

- (id)__INTypeCodableDescriptionPredicateNameKey
{
  v2 = [(INCodableAttributeRelationship *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeRelationshipPredicateNameKey");

  return v3;
}

- (id)__INTypeCodableDescriptionParentNameKey
{
  v2 = [(INCodableAttributeRelationship *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeRelationshipParentNameKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionPredicateValuesKey
{
  v2 = [(INCodableAttributeRelationship *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeRelationshipPredicateValuesKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionPredicateValueKey
{
  v2 = [(INCodableAttributeRelationship *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeRelationshipPredicateValueKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionPredicateNameKey
{
  v2 = [(INCodableAttributeRelationship *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeRelationshipPredicateNameKey");

  return v3;
}

- (id)__INIntentResponseCodableDescriptionParentNameKey
{
  v2 = [(INCodableAttributeRelationship *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeRelationshipParentNameKey");

  return v3;
}

- (id)__INCodableDescriptionPredicateValuesKey
{
  v2 = [(INCodableAttributeRelationship *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeRelationshipPredicateValuesKey");

  return v3;
}

- (id)__INCodableDescriptionPredicateValueKey
{
  v2 = [(INCodableAttributeRelationship *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeRelationshipPredicateValueKey");

  return v3;
}

- (id)__INCodableDescriptionPredicateNameKey
{
  v2 = [(INCodableAttributeRelationship *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeRelationshipPredicateNameKey");

  return v3;
}

- (id)__INCodableDescriptionParentNameKey
{
  v2 = [(INCodableAttributeRelationship *)self _codableDescription];
  v3 = objc_msgSend((id)objc_opt_class(), "__INCodableAttributeRelationshipParentNameKey");

  return v3;
}

@end