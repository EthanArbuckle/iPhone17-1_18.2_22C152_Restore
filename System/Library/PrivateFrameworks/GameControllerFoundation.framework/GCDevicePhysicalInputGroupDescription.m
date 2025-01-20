@interface GCDevicePhysicalInputGroupDescription
+ (BOOL)supportsSecureCoding;
- (BOOL)validate:(id *)a3;
- (GCDevicePhysicalInputGroupDescription)initWithCoder:(id)a3;
- (NSArray)physicalInputs;
- (void)encodeWithCoder:(id)a3;
- (void)setPhysicalInputs:(id)a3;
@end

@implementation GCDevicePhysicalInputGroupDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCDevicePhysicalInputGroupDescription)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)GCDevicePhysicalInputGroupDescription;
  id v3 = a3;
  v4 = [(GCDevicePhysicalInputGroupDescription *)&v10 init];
  uint64_t v5 = objc_opt_class();
  v6 = +[NSSet setWithObjects:](&off_26BEEB310, "setWithObjects:", v5, objc_opt_class(), 0, v10.receiver, v10.super_class);
  uint64_t v7 = [v3 decodeObjectOfClasses:v6 forKey:@"physicalInputs"];

  physicalInputs = v4->_physicalInputs;
  v4->_physicalInputs = (NSArray *)v7;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (BOOL)validate:(id *)a3
{
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__1;
  v32 = __Block_byref_object_dispose__1;
  id v33 = 0;
  physicalInputs = self->_physicalInputs;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = __50__GCDevicePhysicalInputGroupDescription_validate___block_invoke;
  v27[3] = &unk_26BEC3C80;
  v27[4] = &v28;
  [(NSArray *)physicalInputs enumerateObjectsUsingBlock:v27];
  v6 = (void *)v29[5];
  if (a3 && v6) {
    *a3 = v6;
  }
  _Block_object_dispose(&v28, 8);

  if (v6) {
    return 0;
  }
  v8 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v9 = self->_physicalInputs;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v23 objects:v38 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = [*(id *)(*((void *)&v23 + 1) + 8 * i) attributes];
        v14 = v13;
        if (v13)
        {
          id v15 = v13;
        }
        else
        {
          id v15 = +[NSSet set];
        }
        v16 = v15;

        v17 = [v8 member:v16];

        if (v17)
        {
          if (a3)
          {
            NSErrorUserInfoKey v36 = NSLocalizedFailureReasonErrorKey;
            v20 = +[NSString stringWithFormat:@"Multiple physical inputs with attributes '%@'.", v16];
            v37 = v20;
            v21 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
            *a3 = +[NSError errorWithDomain:@"GCDevicePhysicalInputError" code:0 userInfo:v21];
          }
          goto LABEL_21;
        }
        [v8 addObject:v16];
      }
      uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v23 objects:v38 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  v18 = +[NSSet set];
  v19 = [v8 member:v18];
  BOOL v7 = v19 != 0;

  if (a3 != 0 && !v7)
  {
    NSErrorUserInfoKey v34 = NSLocalizedFailureReasonErrorKey;
    v9 = +[NSString stringWithFormat:@"Missing physical input with default attributes."];
    v35 = v9;
    v16 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    *a3 = +[NSError errorWithDomain:@"GCDevicePhysicalInputError" code:0 userInfo:v16];
LABEL_21:

    BOOL v7 = 0;
  }

  return v7;
}

void __50__GCDevicePhysicalInputGroupDescription_validate___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  BOOL v7 = (id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id obj = 0;
  char v8 = [a2 validate:&obj];
  objc_storeStrong(v7, obj);
  if ((v8 & 1) == 0)
  {
    v20[0] = NSLocalizedFailureReasonErrorKey;
    v9 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) localizedFailureReason];
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
    v14 = [v12 arrayByAddingObject:v13];
    v21[1] = v14;
    id v15 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
    uint64_t v16 = +[NSError errorWithDomain:@"GCDevicePhysicalInputError" code:0 userInfo:v15];
    uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 8);
    v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    *a4 = 1;
  }
}

- (NSArray)physicalInputs
{
  return self->_physicalInputs;
}

- (void)setPhysicalInputs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end