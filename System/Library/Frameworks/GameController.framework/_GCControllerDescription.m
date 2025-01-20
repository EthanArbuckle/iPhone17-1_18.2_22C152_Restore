@interface _GCControllerDescription
+ (BOOL)supportsSecureCoding;
+ (Class)controllerClass;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDescription:(id)a3;
- (BOOL)update:(id)a3 withContext:(id)a4;
- (NSCopying)identifier;
- (NSString)debugDescription;
- (NSString)description;
- (_GCControllerDescription)init;
- (_GCControllerDescription)initWithCoder:(id)a3;
- (_GCControllerDescription)initWithIdentifier:(id)a3 components:(id)a4;
- (id)materializeWithContext:(id)a3;
- (id)redactedDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _GCControllerDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)controllerClass
{
  return (Class)objc_opt_class();
}

- (_GCControllerDescription)initWithIdentifier:(id)a3 components:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_GCControllerDescription;
  v8 = [(_GCControllerDescription *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copyWithZone:0];
    identifier = v8->_identifier;
    v8->_identifier = (NSCopying *)v9;

    uint64_t v11 = [v7 copy];
    componentDescriptions = v8->_componentDescriptions;
    v8->_componentDescriptions = (NSArray *)v11;
  }
  return v8;
}

- (_GCControllerDescription)init
{
  return 0;
}

- (_GCControllerDescription)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_GCControllerDescription;
  v5 = [(_GCControllerDescription *)&v14 init];
  if (v5)
  {
    id v6 = GCIPCObjectIdentifier_Classes();
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSCopying *)v7;

    uint64_t v9 = _GCControllerComponentDescription_Classes();
    v10 = [v9 setByAddingObject:objc_opt_class()];
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"components"];
    componentDescriptions = v5->_componentDescriptions;
    v5->_componentDescriptions = (NSArray *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  componentDescriptions = self->_componentDescriptions;
  id v5 = a3;
  [v5 encodeObject:componentDescriptions forKey:@"components"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
}

- (unint64_t)hash
{
  return [(NSCopying *)self->_identifier hash];
}

- (BOOL)isEqualToDescription:(id)a3
{
  id v4 = a3;
  if ([(NSCopying *)self->_identifier isEqual:v4[1]]) {
    BOOL v5 = [(NSArray *)self->_componentDescriptions isEqualToArray:v4[2]];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v5 = [(_GCControllerDescription *)self isEqualToDescription:v4];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v6 = 0;
      goto LABEL_7;
    }
    char v5 = [(NSCopying *)self->_identifier isEqual:v4];
  }
  BOOL v6 = v5;
LABEL_7:

  return v6;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  char v5 = +[NSString stringWithFormat:@"<%@ '%@'>", v4, self->_identifier];

  return (NSString *)v5;
}

- (id)redactedDescription
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  char v5 = +[NSString stringWithFormat:@"<%@ '#%llx'>", v4, [(NSCopying *)self->_identifier hash]];

  return v5;
}

- (NSString)debugDescription
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  char v5 = +[NSString stringWithFormat:@"<%@ %p '%@'> %@", v4, self, self->_identifier, self->_componentDescriptions];

  return (NSString *)v5;
}

- (id)materializeWithContext:(id)a3
{
  id v4 = a3;
  materializedController = self->_materializedController;
  if (!materializedController)
  {
    BOOL v6 = self->_identifier;
    uint64_t v7 = objc_msgSend(objc_alloc((Class)&off_26D2B4AE0), "initWithCapacity:", -[NSArray count](self->_componentDescriptions, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v8 = self->_componentDescriptions;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v12), "materializeWithContext:", v4, (void)v19);
        if (!v13) {
          break;
        }
        objc_super v14 = (void *)v13;
        [v7 addObject:v13];

        if (v10 == ++v12)
        {
          uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v10) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:

      v15 = (GCController *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "controllerClass")), "initWithIdentifier:components:", v6, v7);
      v16 = self->_materializedController;
      self->_materializedController = v15;

      if (!self->_materializedController || ![v4 conformsToProtocol:&unk_26D289AB0]) {
        goto LABEL_14;
      }
      v8 = [v4 IPCObjectRegistry];
      [(NSArray *)v8 registerIPCObject:self->_materializedController];
    }

LABEL_14:
    materializedController = self->_materializedController;
  }
  v17 = materializedController;

  return v17;
}

- (BOOL)update:(id)a3 withContext:(id)a4
{
  id v7 = a3;
  id v41 = a4;
  v8 = [v7 identifier];
  v46 = self;
  char v9 = [v8 isEqual:self->_identifier];

  if ((v9 & 1) == 0)
  {
    v39 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    [v39 handleFailureInMethod:a2 object:self file:@"GCController.m" lineNumber:983 description:&stru_26D27BBB8];
  }
  uint64_t v10 = objc_msgSend(v7, "components", v7);
  v42 = (void *)[v10 mutableCopy];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  obuint64_t j = v10;
  uint64_t v11 = [obj countByEnumeratingWithState:&v56 objects:v62 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    id v44 = *(id *)v57;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(id *)v57 != v44) {
          objc_enumerationMutation(obj);
        }
        objc_super v14 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        v15 = [v14 identifier];
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        v16 = v46->_componentDescriptions;
        uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v52 objects:v61 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v53;
          while (2)
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v53 != v19) {
                objc_enumerationMutation(v16);
              }
              long long v21 = [*(id *)(*((void *)&v52 + 1) + 8 * j) identifier];
              char v22 = [v15 isEqual:v21];

              if (v22)
              {

                goto LABEL_18;
              }
            }
            uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v52 objects:v61 count:16];
            if (v18) {
              continue;
            }
            break;
          }
        }

        [v42 removeObject:v14];
LABEL_18:
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v56 objects:v62 count:16];
    }
    while (v12);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v45 = v46->_componentDescriptions;
  uint64_t v23 = [(NSArray *)v45 countByEnumeratingWithState:&v48 objects:v60 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v47 = *(void *)v49;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v49 != v47) {
          objc_enumerationMutation(v45);
        }
        v26 = *(void **)(*((void *)&v48 + 1) + 8 * v25);
        v27 = [v26 identifier];
        if (![v42 count]) {
          goto LABEL_34;
        }
        uint64_t v28 = 0;
        while (1)
        {
          v29 = [obj objectAtIndexedSubscript:v28];
          v30 = [v29 identifier];
          char v31 = [v27 isEqual:v30];

          if (v31) {
            break;
          }

          if (++v28 >= (unint64_t)[v42 count]) {
            goto LABEL_34;
          }
        }
        if (!v29)
        {
LABEL_34:
          uint64_t v32 = [v26 materializeWithContext:v41];
          if (!v32) {
            goto LABEL_44;
          }
          v33 = (void *)v32;
          [v42 addObject:v32];
          v29 = 0;
LABEL_36:

          goto LABEL_37;
        }
        if (![v26 conformsToProtocol:&unk_26D294B30])
        {
          uint64_t v34 = [v26 materializeWithContext:v41];
          if (!v34)
          {
LABEL_43:

LABEL_44:
            BOOL v37 = 0;
            v36 = v40;
            goto LABEL_45;
          }
          v33 = (void *)v34;
          [v42 replaceObjectAtIndex:v28 withObject:v34];
          goto LABEL_36;
        }
        if (([v26 update:v29 withContext:v41] & 1) == 0) {
          goto LABEL_43;
        }
LABEL_37:

        ++v25;
      }
      while (v25 != v24);
      uint64_t v35 = [(NSArray *)v45 countByEnumeratingWithState:&v48 objects:v60 count:16];
      uint64_t v24 = v35;
    }
    while (v35);
  }

  v36 = v40;
  [v40 setComponents:v42];
  BOOL v37 = 1;
LABEL_45:

  return v37;
}

- (NSCopying)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_materializedController, 0);
  objc_storeStrong((id *)&self->_componentDescriptions, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end