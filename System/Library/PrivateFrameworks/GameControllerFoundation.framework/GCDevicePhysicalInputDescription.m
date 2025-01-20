@interface GCDevicePhysicalInputDescription
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)validate:(id *)a3;
- (GCDevicePhysicalInputDescription)initWithCoder:(id)a3;
- (NSArray)elements;
- (NSSet)attributes;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAttributes:(id)a3;
- (void)setElements:(id)a3;
@end

@implementation GCDevicePhysicalInputDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCDevicePhysicalInputDescription)initWithCoder:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)GCDevicePhysicalInputDescription;
  id v3 = a3;
  v4 = [(GCDevicePhysicalInputDescription *)&v14 init];
  uint64_t v5 = objc_opt_class();
  v6 = +[NSSet setWithObjects:](&off_26BEEB310, "setWithObjects:", v5, objc_opt_class(), 0, v14.receiver, v14.super_class);
  uint64_t v7 = [v3 decodeObjectOfClasses:v6 forKey:@"elements"];
  elements = v4->_elements;
  v4->_elements = (NSArray *)v7;

  uint64_t v9 = objc_opt_class();
  v10 = +[NSSet setWithObjects:](&off_26BEEB310, "setWithObjects:", v9, objc_opt_class(), 0);
  uint64_t v11 = [v3 decodeObjectOfClasses:v10 forKey:@"attributes"];

  attributes = v4->_attributes;
  v4->_attributes = (NSSet *)v11;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  elements = self->_elements;
  id v5 = a3;
  [v5 encodeObject:elements forKey:@"elements"];
  [v5 encodeObject:self->_attributes forKey:@"attributes"];
}

- (BOOL)validate:(id *)a3
{
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__1;
  v27 = __Block_byref_object_dispose__1;
  id v28 = 0;
  elements = self->_elements;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = __45__GCDevicePhysicalInputDescription_validate___block_invoke;
  v22[3] = &unk_26BEC3C58;
  v22[4] = &v23;
  [(NSArray *)elements enumerateObjectsUsingBlock:v22];
  v6 = (void *)v24[5];
  if (a3 && v6) {
    *a3 = v6;
  }
  _Block_object_dispose(&v23, 8);

  if (v6) {
    return 0;
  }
  v8 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v9 = self->_elements;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v18 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = [*(id *)(*((void *)&v18 + 1) + 8 * i) identifier];
        objc_super v14 = [v8 member:v13];

        if (v14)
        {
          if (a3)
          {
            NSErrorUserInfoKey v29 = NSLocalizedFailureReasonErrorKey;
            v15 = +[NSString stringWithFormat:@"Multiple elements with identifier '%@'.", v13];
            v30 = v15;
            v16 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
            *a3 = +[NSError errorWithDomain:@"GCDevicePhysicalInputError" code:0 userInfo:v16];
          }
          BOOL v7 = 0;
          goto LABEL_18;
        }
        [v8 addObject:v13];
      }
      uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v18 objects:v31 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_18:

  return v7;
}

void __45__GCDevicePhysicalInputDescription_validate___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  BOOL v7 = (id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id obj = 0;
  char v8 = [a2 validate:&obj];
  objc_storeStrong(v7, obj);
  if ((v8 & 1) == 0)
  {
    v20[0] = NSLocalizedFailureReasonErrorKey;
    uint64_t v9 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) localizedFailureReason];
    v20[1] = @"GCFailingKeyPathErrorKey";
    v21[0] = v9;
    uint64_t v10 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "gc_failingKeyPath");
    uint64_t v11 = (void *)v10;
    if (v10) {
      v12 = (void *)v10;
    }
    else {
      v12 = &__NSArray0__struct;
    }
    v13 = +[NSString stringWithFormat:@"[%zd]", a3];
    objc_super v14 = [v12 arrayByAddingObject:v13];
    v21[1] = v14;
    v15 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
    uint64_t v16 = +[NSError errorWithDomain:@"GCDevicePhysicalInputError" code:0 userInfo:v15];
    uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 8);
    long long v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    *a4 = 1;
  }
}

- (unint64_t)hash
{
  return [(NSArray *)self->_elements hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ((attributes = self->_attributes, attributes == (NSSet *)v4[2])
     || -[NSSet isEqual:](attributes, "isEqual:")))
  {
    elements = self->_elements;
    if (elements == (NSArray *)v4[1]) {
      char v7 = 1;
    }
    else {
      char v7 = -[NSArray isEqual:](elements, "isEqual:");
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)description
{
  id v3 = [(NSSet *)self->_attributes allObjects];
  v4 = [v3 componentsJoinedByString:@", "];
  id v5 = +[NSMutableString stringWithFormat:@"Physical Input [%@] {", v4];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = self->_elements;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) description];
        [v5 appendFormat:@"\n\t%@", v11];
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  if ([(NSArray *)self->_elements count]) {
    [v5 appendString:@"\n"];
  }
  [v5 appendString:@"}"];

  return v5;
}

- (NSArray)elements
{
  return self->_elements;
}

- (void)setElements:(id)a3
{
}

- (NSSet)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);

  objc_storeStrong((id *)&self->_elements, 0);
}

@end