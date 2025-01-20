@interface _NSXPCStoreObjectIDArrayConstantValueExpression
+ (BOOL)supportsSecureCoding;
- (_NSXPCStoreObjectIDArrayConstantValueExpression)initWithCoder:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _NSXPCStoreObjectIDArrayConstantValueExpression

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_NSXPCStoreObjectIDArrayConstantValueExpression)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"NSPredicates and NSExpressions cannot be decoded by non-keyed archivers"];
  }
  v14.receiver = self;
  v14.super_class = (Class)_NSXPCStoreObjectIDArrayConstantValueExpression;
  v5 = [(_NSXPCStoreObjectIDArrayConstantValueExpression *)&v14 init];
  if (v5)
  {
    v6 = (void *)[a3 allowedClasses];
    v7 = (void *)[NSClassFromString((NSString *)@"_NSPredicateUtilities") _constantValueClassesForSecureCoding];
    id v8 = (id)[v7 setByAddingObject:objc_opt_class()];
    if (v6 && [v6 count])
    {
      id v8 = (id)[v8 mutableCopy];
      [v8 unionSet:v6];
    }
    v9 = (void *)[a3 decodeObjectOfClasses:v8 forKey:@"NSConstantValue_XPCStoreObjectIDs"];
    if (v9)
    {
      uint64_t v10 = +[NSManagedObjectID unarchivedScalarObjectIDsFromData:withCoordinator:]((uint64_t)NSManagedObjectID, v9, objc_msgSend((id)objc_msgSend(a3, "delegate"), "persistentStoreCoordinator"));
      if (v10) {
        uint64_t v11 = v10;
      }
      else {
        uint64_t v11 = NSArray_EmptyArray;
      }
    }
    else
    {
      uint64_t v11 = [a3 decodeObjectOfClasses:v8 forKey:@"NSConstantValue"];
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  v12 = (_NSXPCStoreObjectIDArrayConstantValueExpression *)[objc_alloc(MEMORY[0x1E4F28BC0]) initWithObject:v11];
  NSDeallocateObject(v5);
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"NSPredicates and NSExpressions cannot be encoded by non-keyed archivers"];
  }
  v5 = (objc_class *)objc_opt_class();
  InstanceVariable = class_getInstanceVariable(v5, "constantValue");
  id Ivar = object_getIvar(self, InstanceVariable);
  if ((([Ivar isNSArray] & 1) != 0 || objc_msgSend(Ivar, "isNSSet"))
    && (id v8 = +[NSManagedObjectID _newArchiveForScalarObjectIDs:]((uint64_t)NSManagedObjectID, Ivar)) != 0)
  {
    id v9 = v8;
    [a3 encodeObject:v8 forKey:@"NSConstantValue_XPCStoreObjectIDs"];
  }
  else
  {
    [a3 encodeObject:Ivar forKey:@"NSConstantValue"];
  }
}

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  InstanceVariable = class_getInstanceVariable(v3, "constantValue");

  v5.receiver = self;
  v5.super_class = (Class)_NSXPCStoreObjectIDArrayConstantValueExpression;
  [(_NSXPCStoreObjectIDArrayConstantValueExpression *)&v5 dealloc];
}

@end