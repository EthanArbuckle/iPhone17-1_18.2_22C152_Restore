@interface DebugHierarchyAbstractRequestAction
+ (id)actionWithDictionary:(id)a3;
- (DebugHierarchyAbstractRequestAction)initWithDictionary:(id)a3;
- (id)dictionaryRepresentation;
- (id)keysToArchiveViaKVC;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
@end

@implementation DebugHierarchyAbstractRequestAction

+ (id)actionWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithDictionary:v4];

  return v5;
}

- (DebugHierarchyAbstractRequestAction)initWithDictionary:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DebugHierarchyAbstractRequestAction;
  id v5 = [(DebugHierarchyAbstractRequestAction *)&v8 init];
  v6 = v5;
  if (v5) {
    [(DebugHierarchyAbstractRequestAction *)v5 setValuesForKeysWithDictionary:v4];
  }

  return v6;
}

- (id)dictionaryRepresentation
{
  v11 = @"actionClass";
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v12 = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];

  v6 = [(DebugHierarchyAbstractRequestAction *)self keysToArchiveViaKVC];
  if ([v6 count])
  {
    id v7 = [v5 mutableCopy];
    objc_super v8 = [(DebugHierarchyAbstractRequestAction *)self dictionaryWithValuesForKeys:v6];
    [v7 addEntriesFromDictionary:v8];

    id v9 = [v7 copy];
    id v5 = v9;
  }

  return v5;
}

- (id)keysToArchiveViaKVC
{
  return 0;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v7 isEqualToString:@"actionClass"] & 1) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)DebugHierarchyAbstractRequestAction;
    [(DebugHierarchyAbstractRequestAction *)&v8 setValue:v6 forUndefinedKey:v7];
  }
}

@end