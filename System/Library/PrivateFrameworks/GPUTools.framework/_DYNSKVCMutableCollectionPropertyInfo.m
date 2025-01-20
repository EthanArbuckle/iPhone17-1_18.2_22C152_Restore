@interface _DYNSKVCMutableCollectionPropertyInfo
+ (id)mutableCollectionPropertyInfoForClass:(Class)a3;
+ (void)initialize;
- (_DYNSKVCMutableCollectionPropertyInfo)initWithClass:(Class)a3;
- (id)_stringWithCapitalizedFirstLetter:(id)a3;
- (id)bindingForProperty:(id)a3;
- (id)bindingForSelector:(SEL)a3;
- (void)dealloc;
- (void)dy_synthesizeMutableArrayProperty:(id)a3 withInstanceVariable:(id)a4;
- (void)dy_synthesizeMutableSetProperty:(id)a3 withInstanceVariable:(id)a4;
@end

@implementation _DYNSKVCMutableCollectionPropertyInfo

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    _DYNSKVCMutableCollectionPropertyClassMap = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:512 valueOptions:0 capacity:16];
  }
}

+ (id)mutableCollectionPropertyInfoForClass:(Class)a3
{
  GPUTools::DYLockUtils::Lock((GPUTools::DYLockUtils *)&_DYNSKVCMutableCollectionPropertyClassMapLock, (volatile int *)a2);
  v5 = (_DYNSKVCMutableCollectionPropertyInfo *)NSMapGet((NSMapTable *)_DYNSKVCMutableCollectionPropertyClassMap, a3);
  if (!v5)
  {
    v5 = [[_DYNSKVCMutableCollectionPropertyInfo alloc] initWithClass:a3];
    NSMapInsertKnownAbsent((NSMapTable *)_DYNSKVCMutableCollectionPropertyClassMap, a3, v5);
  }
  GPUTools::DYLockUtils::Unlock((GPUTools::DYLockUtils *)&_DYNSKVCMutableCollectionPropertyClassMapLock, v4);
  return v5;
}

- (_DYNSKVCMutableCollectionPropertyInfo)initWithClass:(Class)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_DYNSKVCMutableCollectionPropertyInfo;
  v4 = [(_DYNSKVCMutableCollectionPropertyInfo *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_class = a3;
    v4->_selectorBindingsMap = (NSMapTable *)[objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:258 valueOptions:0 capacity:16];
    v5->_propertyBindingsMap = (NSMapTable *)[objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0x10000 valueOptions:0 capacity:16];
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_DYNSKVCMutableCollectionPropertyInfo;
  [(_DYNSKVCMutableCollectionPropertyInfo *)&v3 dealloc];
}

- (id)_stringWithCapitalizedFirstLetter:(id)a3
{
  v4 = objc_msgSend((id)objc_msgSend(a3, "substringToIndex:", 1), "uppercaseString");
  uint64_t v5 = [a3 substringFromIndex:1];
  return (id)[v4 stringByAppendingString:v5];
}

- (void)dy_synthesizeMutableArrayProperty:(id)a3 withInstanceVariable:(id)a4
{
  key = (void *)[a3 copy];
  v6 = [[_DYNSKVCMutableCollectionPropertyBinding alloc] initWithKey:key underlyingIvarName:a4];
  NSMapInsertKnownAbsent(self->_propertyBindingsMap, key, v6);
  id v7 = [(_DYNSKVCMutableCollectionPropertyInfo *)self _stringWithCapitalizedFirstLetter:key];
  SEL name = NSSelectorFromString((NSString *)[NSString stringWithFormat:@"mutable%@", v7]);
  SEL v8 = NSSelectorFromString((NSString *)key);
  SEL v9 = NSSelectorFromString((NSString *)[NSString stringWithFormat:@"set%@:", v7]);
  SEL v10 = NSSelectorFromString((NSString *)[NSString stringWithFormat:@"insertObject:in%@AtIndex:", v7]);
  SEL v16 = NSSelectorFromString((NSString *)[NSString stringWithFormat:@"removeObjectFrom%@AtIndex:", v7]);
  SEL v15 = NSSelectorFromString((NSString *)[NSString stringWithFormat:@"replaceObjectIn%@AtIndex:withObject:", v7]);
  SEL v18 = NSSelectorFromString((NSString *)[NSString stringWithFormat:@"insert%@:atIndexes:", v7]);
  SEL v20 = NSSelectorFromString((NSString *)[NSString stringWithFormat:@"remove%@AtIndexes:", v7]);
  SEL v19 = NSSelectorFromString((NSString *)[NSString stringWithFormat:@"replace%@AtIndexes:withObjects:", v7]);
  SEL v17 = NSSelectorFromString((NSString *)[NSString stringWithFormat:@"countOf%@", v7]);
  SEL v14 = NSSelectorFromString((NSString *)[NSString stringWithFormat:@"objectIn%@AtIndex:", v7]);
  SEL v11 = NSSelectorFromString((NSString *)[NSString stringWithFormat:@"%@AtIndexes:", key]);
  SEL v12 = NSSelectorFromString((NSString *)[NSString stringWithFormat:@"get%@:range:", v7]);
  NSMapInsertKnownAbsent(self->_selectorBindingsMap, name, v6);
  NSMapInsertKnownAbsent(self->_selectorBindingsMap, v8, v6);
  NSMapInsertKnownAbsent(self->_selectorBindingsMap, v9, v6);
  NSMapInsertKnownAbsent(self->_selectorBindingsMap, v10, v6);
  NSMapInsertKnownAbsent(self->_selectorBindingsMap, v16, v6);
  NSMapInsertKnownAbsent(self->_selectorBindingsMap, v15, v6);
  NSMapInsertKnownAbsent(self->_selectorBindingsMap, v18, v6);
  NSMapInsertKnownAbsent(self->_selectorBindingsMap, v20, v6);
  NSMapInsertKnownAbsent(self->_selectorBindingsMap, v19, v6);
  NSMapInsertKnownAbsent(self->_selectorBindingsMap, v17, v6);
  NSMapInsertKnownAbsent(self->_selectorBindingsMap, v14, v6);
  NSMapInsertKnownAbsent(self->_selectorBindingsMap, v11, v6);
  NSMapInsertKnownAbsent(self->_selectorBindingsMap, v12, v6);
  class_addMethod(self->_class, name, (IMP)DYKVCMutableCollections_Array_MutableGetter, "@@:");
  class_addMethod(self->_class, v8, (IMP)DYKVCMutableCollections_Array_Getter, "@@:");
  class_addMethod(self->_class, v9, (IMP)DYKVCMutableCollections_Array_Setter, "v@:@");
  class_addMethod(self->_class, v10, (IMP)DYKVCMutableCollections_Array_InsertObjectAtIndex, "v@:@Q");
  class_addMethod(self->_class, v16, (IMP)DYKVCMutableCollections_Array_RemoveObjectAtIndex, "v@:Q");
  class_addMethod(self->_class, v15, (IMP)DYKVCMutableCollections_Array_ReplaceObjectAtIndexWithObject, "v@:Q@");
  class_addMethod(self->_class, v18, (IMP)DYKVCMutableCollections_Array_InsertObjectsAtIndexes, "v@:@@");
  class_addMethod(self->_class, v20, (IMP)DYKVCMutableCollections_Array_RemoveObjectsAtIndexes, "v@:@");
  class_addMethod(self->_class, v19, (IMP)DYKVCMutableCollections_Array_ReplaceObjectsAtIndexesWithObjects, "v@:@@");
  class_addMethod(self->_class, v17, (IMP)DYKVCMutableCollections_Array_Count, "Q@:");
  class_addMethod(self->_class, v14, (IMP)DYKVCMutableCollections_Array_ObjectAtIndex, "@@:Q");
  class_addMethod(self->_class, v11, (IMP)DYKVCMutableCollections_Array_ObjectsAtIndexes, "Q@:@");
  class_addMethod(self->_class, v12, (IMP)DYKVCMutableCollections_Array_GetObjectsRange, "v@:^@{_NSRange=QQ}");
}

- (void)dy_synthesizeMutableSetProperty:(id)a3 withInstanceVariable:(id)a4
{
  aSelectorName = (NSString *)[a3 copy];
  v6 = [[_DYNSKVCMutableCollectionPropertyBinding alloc] initWithKey:aSelectorName underlyingIvarName:a4];
  id v7 = [(_DYNSKVCMutableCollectionPropertyInfo *)self _stringWithCapitalizedFirstLetter:aSelectorName];
  SEL name = NSSelectorFromString((NSString *)[NSString stringWithFormat:@"mutable%@", v7]);
  SEL v13 = NSSelectorFromString(aSelectorName);
  SEL key = NSSelectorFromString((NSString *)[NSString stringWithFormat:@"set%@:", v7]);
  SEL v16 = NSSelectorFromString((NSString *)[NSString stringWithFormat:@"add%@Object:", v7]);
  SEL v8 = NSSelectorFromString((NSString *)[NSString stringWithFormat:@"remove%@Object:", v7]);
  SEL v9 = NSSelectorFromString((NSString *)[NSString stringWithFormat:@"add%@:", v7]);
  SEL v15 = NSSelectorFromString((NSString *)[NSString stringWithFormat:@"remove%@:", v7]);
  SEL v18 = NSSelectorFromString((NSString *)[NSString stringWithFormat:@"intersect%@:", v7]);
  SEL v14 = NSSelectorFromString((NSString *)[NSString stringWithFormat:@"countOf%@", v7]);
  SEL v10 = NSSelectorFromString((NSString *)[NSString stringWithFormat:@"enumeratorOf%@", v7]);
  SEL v11 = NSSelectorFromString((NSString *)[NSString stringWithFormat:@"memberOf%@:", v7]);
  NSMapInsertKnownAbsent(self->_selectorBindingsMap, name, v6);
  NSMapInsertKnownAbsent(self->_selectorBindingsMap, v13, v6);
  NSMapInsertKnownAbsent(self->_selectorBindingsMap, key, v6);
  NSMapInsertKnownAbsent(self->_selectorBindingsMap, v16, v6);
  NSMapInsertKnownAbsent(self->_selectorBindingsMap, v8, v6);
  NSMapInsertKnownAbsent(self->_selectorBindingsMap, v9, v6);
  NSMapInsertKnownAbsent(self->_selectorBindingsMap, v15, v6);
  NSMapInsertKnownAbsent(self->_selectorBindingsMap, v18, v6);
  NSMapInsertKnownAbsent(self->_selectorBindingsMap, v14, v6);
  NSMapInsertKnownAbsent(self->_selectorBindingsMap, v10, v6);
  NSMapInsertKnownAbsent(self->_selectorBindingsMap, v11, v6);
  class_addMethod(self->_class, name, (IMP)DYKVCMutableCollections_Set_MutableGetter, "@@:");
  class_addMethod(self->_class, v13, (IMP)DYKVCMutableCollections_Set_Getter, "@@:");
  class_addMethod(self->_class, key, (IMP)DYKVCMutableCollections_Set_Setter, "v@:@");
  class_addMethod(self->_class, v16, (IMP)DYKVCMutableCollections_Set_AddObject, "v@:@");
  class_addMethod(self->_class, v8, (IMP)DYKVCMutableCollections_Set_RemoveObject, "v@:@");
  class_addMethod(self->_class, v9, (IMP)DYKVCMutableCollections_Set_AddObjects, "v@:@");
  class_addMethod(self->_class, v15, (IMP)DYKVCMutableCollections_Set_RemoveObjects, "v@:@");
  class_addMethod(self->_class, v18, (IMP)DYKVCMutableCollections_Set_IntersectObjects, "v@:@");
  class_addMethod(self->_class, v14, (IMP)DYKVCMutableCollections_Set_Count, "Q@:");
  class_addMethod(self->_class, v10, (IMP)DYKVCMutableCollections_Set_ObjectEnumerator, "@@:");
  class_addMethod(self->_class, v11, (IMP)DYKVCMutableCollections_Set_Member, "@@:@");
}

- (id)bindingForSelector:(SEL)a3
{
  uint64_t v5 = NSMapGet(self->_selectorBindingsMap, a3);
  if (!v5)
  {
    Class Superclass = class_getSuperclass(self->_class);
    if (Superclass) {
      uint64_t v5 = objc_msgSend(+[_DYNSKVCMutableCollectionPropertyInfo mutableCollectionPropertyInfoForClass:](_DYNSKVCMutableCollectionPropertyInfo, "mutableCollectionPropertyInfoForClass:", Superclass), "bindingForSelector:", a3);
    }
    else {
      uint64_t v5 = 0;
    }
    NSMapInsertKnownAbsent(self->_selectorBindingsMap, a3, v5);
  }
  return v5;
}

- (id)bindingForProperty:(id)a3
{
  uint64_t v5 = NSMapGet(self->_propertyBindingsMap, a3);
  if (!v5)
  {
    Class Superclass = class_getSuperclass(self->_class);
    if (Superclass) {
      uint64_t v5 = objc_msgSend(+[_DYNSKVCMutableCollectionPropertyInfo mutableCollectionPropertyInfoForClass:](_DYNSKVCMutableCollectionPropertyInfo, "mutableCollectionPropertyInfoForClass:", Superclass), "bindingForProperty:", a3);
    }
    else {
      uint64_t v5 = 0;
    }
    NSMapInsertKnownAbsent(self->_propertyBindingsMap, a3, v5);
  }
  return v5;
}

@end