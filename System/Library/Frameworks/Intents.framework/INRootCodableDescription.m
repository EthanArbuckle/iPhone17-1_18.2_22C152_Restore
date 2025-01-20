@interface INRootCodableDescription
+ (BOOL)supportsSecureCoding;
+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4;
+ (void)recursivelyAssignCodableDescriptionsFor:(id)a3 referencedCodableDescriptions:(id)a4 visitedCodableDescriptions:(id)a5;
- (INRootCodableDescription)init;
- (INRootCodableDescription)initWithCoder:(id)a3;
- (NSArray)referencedCodableDescriptions;
- (NSDictionary)_referencedCodableDescriptionsByClassName;
- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4;
- (int64_t)codableDescriptionType;
- (void)_establishReferencedCodableDescriptionsUsingTypes:(id)a3;
- (void)_reestablishReferencedCodableDescriptionsUsingTypes:(id)a3;
- (void)_setReferencedCodableDescriptions:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INRootCodableDescription

- (INRootCodableDescription)init
{
  v3.receiver = self;
  v3.super_class = (Class)INRootCodableDescription;
  result = [(INCodableDescription *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (INRootCodableDescription)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)INRootCodableDescription;
  v5 = [(INCodableDescription *)&v12 initWithCoder:v4];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v10 = [v4 decodeObjectOfClasses:v9 forKey:@"referencedCodableDescriptions"];
    [(INRootCodableDescription *)v6 _setReferencedCodableDescriptions:v10];
  }
  return v6;
}

- (void)_establishReferencedCodableDescriptionsUsingTypes:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  id v8 = [(INCodableDescription *)self attributes];
  v6 = [v8 allValues];
  v7 = [v5 _calculateReferencedCodableDescriptionsFromAttributes:v6 usingTypes:v4];

  [(INRootCodableDescription *)self _setReferencedCodableDescriptions:v7];
}

- (void)_setReferencedCodableDescriptions:(id)a3
{
  id v4 = (NSArray *)a3;
  os_unfair_lock_lock(&self->_lock);
  referencedCodableDescriptions = self->_referencedCodableDescriptions;
  self->_referencedCodableDescriptions = v4;
  v6 = v4;

  referencedCodableDescriptionsByClassName = self->_referencedCodableDescriptionsByClassName;
  self->_referencedCodableDescriptionsByClassName = 0;

  os_unfair_lock_unlock(&self->_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referencedCodableDescriptions, 0);

  objc_storeStrong((id *)&self->_referencedCodableDescriptionsByClassName, 0);
}

- (void)_reestablishReferencedCodableDescriptionsUsingTypes:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v13 = [MEMORY[0x1E4F1CA70] orderedSetWithArray:self->_referencedCodableDescriptions];
  v6 = objc_opt_class();
  v7 = [(INCodableDescription *)self attributes];
  id v8 = [v7 allValues];
  v9 = [v6 _calculateReferencedCodableDescriptionsFromAttributes:v8 usingTypes:v5];

  [v13 addObjectsFromArray:v9];
  v10 = [v13 array];
  referencedCodableDescriptions = self->_referencedCodableDescriptions;
  self->_referencedCodableDescriptions = v10;

  referencedCodableDescriptionsByClassName = self->_referencedCodableDescriptionsByClassName;
  self->_referencedCodableDescriptionsByClassName = 0;

  os_unfair_lock_unlock(p_lock);
}

- (NSDictionary)_referencedCodableDescriptionsByClassName
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_referencedCodableDescriptionsByClassName)
  {
    objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSArray count](self->_referencedCodableDescriptions, "count"));
    id v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v5 = self->_referencedCodableDescriptions;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          v11 = objc_msgSend(v10, "className", (void)v15);
          [(NSDictionary *)v4 setObject:v10 forKey:v11];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }

    referencedCodableDescriptionsByClassName = self->_referencedCodableDescriptionsByClassName;
    self->_referencedCodableDescriptionsByClassName = v4;
  }
  os_unfair_lock_unlock(p_lock);
  id v13 = self->_referencedCodableDescriptionsByClassName;

  return v13;
}

- (NSArray)referencedCodableDescriptions
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)[(NSArray *)self->_referencedCodableDescriptions copy];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)INRootCodableDescription;
  id v4 = a3;
  [(INCodableDescription *)&v6 encodeWithCoder:v4];
  id v5 = [(INRootCodableDescription *)self referencedCodableDescriptions];
  [v4 encodeObject:v5 forKey:@"referencedCodableDescriptions"];
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__49870;
  v23 = __Block_byref_object_dispose__49871;
  id v24 = 0;
  v17.receiver = self;
  v17.super_class = (Class)INRootCodableDescription;
  id obj = 0;
  uint64_t v7 = [(INCodableDescription *)&v17 widgetPlistableRepresentationWithParameters:v6 error:&obj];
  objc_storeStrong(&v24, obj);
  uint64_t v8 = (void *)v20[5];
  if (v8)
  {
    id v9 = 0;
    if (a4) {
      *a4 = v8;
    }
  }
  else
  {
    v10 = [(INRootCodableDescription *)self referencedCodableDescriptions];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __78__INRootCodableDescription_widgetPlistableRepresentationWithParameters_error___block_invoke;
    v14[3] = &unk_1E5519698;
    id v15 = v6;
    long long v16 = &v19;
    v11 = objc_msgSend(v10, "if_compactMap:", v14);

    objc_super v12 = (void *)v20[5];
    if (v12)
    {
      id v9 = 0;
      if (a4) {
        *a4 = v12;
      }
    }
    else
    {
      objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v11, @"referencedCodableDescriptions");
      id v9 = v7;
    }
  }
  _Block_object_dispose(&v19, 8);

  return v9;
}

id __78__INRootCodableDescription_widgetPlistableRepresentationWithParameters_error___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a2;
  id v5 = [v3 array];
  id v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "codableDescriptionType"));
  [v5 addObject:v6];

  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v8 + 40);
  id v9 = [v4 widgetPlistableRepresentationWithParameters:v7 error:&obj];

  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    [v5 addObject:v9];
    v10 = v5;
  }
  else
  {
    v10 = 0;
  }
  id v11 = v10;

  return v11;
}

- (int64_t)codableDescriptionType
{
  return 2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)recursivelyAssignCodableDescriptionsFor:(id)a3 referencedCodableDescriptions:(id)a4 visitedCodableDescriptions:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __125__INRootCodableDescription_recursivelyAssignCodableDescriptionsFor_referencedCodableDescriptions_visitedCodableDescriptions___block_invoke;
  v14[3] = &unk_1E5519710;
  id v15 = v8;
  id v16 = v10;
  id v17 = v9;
  id v18 = a1;
  id v11 = v9;
  id v12 = v10;
  id v13 = v8;
  [v11 enumerateObjectsUsingBlock:v14];
}

void __125__INRootCodableDescription_recursivelyAssignCodableDescriptionsFor_referencedCodableDescriptions_visitedCodableDescriptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) objectTypeName];
  id v5 = [v3 typeName];
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    objc_storeWeak((id *)(*(void *)(a1 + 32) + 168), v3);
    uint64_t v7 = [*(id *)(a1 + 40) objectForKey:v3];
    char v8 = [v7 BOOLValue];

    if ((v8 & 1) == 0)
    {
      [*(id *)(a1 + 40) setObject:MEMORY[0x1E4F1CC38] forKey:v3];
      id v9 = [v3 attributes];
      id v10 = [v9 allValues];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __125__INRootCodableDescription_recursivelyAssignCodableDescriptionsFor_referencedCodableDescriptions_visitedCodableDescriptions___block_invoke_2;
      v14[3] = &unk_1E55196E8;
      id v11 = v3;
      id v13 = *(void **)(a1 + 48);
      uint64_t v12 = *(void *)(a1 + 56);
      id v15 = v11;
      uint64_t v18 = v12;
      id v16 = v13;
      id v17 = *(id *)(a1 + 40);
      [v10 enumerateObjectsUsingBlock:v14];
    }
  }
}

void __125__INRootCodableDescription_recursivelyAssignCodableDescriptionsFor_referencedCodableDescriptions_visitedCodableDescriptions___block_invoke_2(uint64_t a1, void *a2)
{
  int v6 = a2;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v3 = [v6 objectTypeName];
      id v4 = [*(id *)(a1 + 32) typeName];
      int v5 = [v3 isEqualToString:v4];

      if (v5) {
        objc_storeWeak(v6 + 21, *(id *)(a1 + 32));
      }
      [*(id *)(a1 + 56) recursivelyAssignCodableDescriptionsFor:v6 referencedCodableDescriptions:*(void *)(a1 + 40) visitedCodableDescriptions:*(void *)(a1 + 48)];
    }
  }
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v47.receiver = a1;
  v47.super_class = (Class)&OBJC_METACLASS___INRootCodableDescription;
  id v48 = 0;
  uint64_t v7 = objc_msgSendSuper2(&v47, sel_makeFromWidgetPlistableRepresentation_error_, v6, &v48);
  id v8 = v48;
  if (v8)
  {
    id v9 = v8;
    if (a4)
    {
      id v9 = v8;
      id v10 = 0;
      *a4 = v9;
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    v34 = a4;
    v35 = v7;
    id v32 = a1;
    v37 = [MEMORY[0x1E4F1CA48] array];
    unint64_t v11 = 0x1E4F1C000uLL;
    id v36 = v6;
    objc_msgSend(v6, "intents_safeObjectForKey:ofType:", @"referencedCodableDescriptions", objc_opt_class());
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v12 countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v44;
      id v33 = v12;
LABEL_6:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v44 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v43 + 1) + 8 * v16);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || [v17 count] != 2) {
          goto LABEL_21;
        }
        unint64_t v18 = v11;
        id v19 = v17;
        uint64_t v20 = [v19 objectAtIndexedSubscript:0];
        int v21 = 1;
        v22 = [v19 objectAtIndexedSubscript:1];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && (id v23 = INCodableDescriptionClassFromType([v20 integerValue])) != 0)
          {
            id v42 = 0;
            id v24 = [v23 makeFromWidgetPlistableRepresentation:v22 error:&v42];
            id v25 = v42;
            if (v25)
            {
              id v9 = v25;
              if (v34) {
                id *v34 = v25;
              }

              id v10 = 0;
              v30 = v33;
              id v12 = v33;
              goto LABEL_30;
            }
            if (v24)
            {
              [v37 addObject:v24];
              int v21 = 0;
            }
            else
            {
              int v21 = 1;
            }

            id v12 = v33;
          }
          else
          {
            int v21 = 1;
          }
        }

        unint64_t v11 = v18;
        if (v21)
        {
LABEL_21:
          v26 = [NSString stringWithFormat:@"Wrong types found for relationship codable description"];
          INIntentError(8001, v26, 0);
          id v9 = (id)objc_claimAutoreleasedReturnValue();

          if (v9)
          {
            if (v34)
            {
              id v9 = v9;
              id v10 = 0;
              id *v34 = v9;
            }
            else
            {
              id v10 = 0;
            }
            v30 = v12;
LABEL_30:
            uint64_t v7 = v35;
            id v6 = v36;
            v27 = v37;
            goto LABEL_31;
          }
        }
        if (v14 == ++v16)
        {
          uint64_t v14 = [v12 countByEnumeratingWithState:&v43 objects:v49 count:16];
          if (v14) {
            goto LABEL_6;
          }
          break;
        }
      }
    }

    uint64_t v7 = v35;
    v27 = v37;
    [v35 _setReferencedCodableDescriptions:v37];
    v28 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    v29 = [v35 attributes];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __72__INRootCodableDescription_makeFromWidgetPlistableRepresentation_error___block_invoke;
    v38[3] = &unk_1E55196C0;
    id v41 = v32;
    id v39 = v37;
    id v40 = v28;
    v30 = v12;
    id v12 = v28;
    [v29 enumerateKeysAndObjectsUsingBlock:v38];

    id v10 = v35;
    id v9 = 0;
    id v6 = v36;
LABEL_31:
  }

  return v10;
}

void __72__INRootCodableDescription_makeFromWidgetPlistableRepresentation_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [*(id *)(a1 + 48) recursivelyAssignCodableDescriptionsFor:v5 referencedCodableDescriptions:*(void *)(a1 + 32) visitedCodableDescriptions:*(void *)(a1 + 40)];
    }
  }
}

@end