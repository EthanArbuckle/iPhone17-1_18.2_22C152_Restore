@interface _NSFaultingMutableOrderedSetMutationMethods
+ (id)_createMutationMethodsForClass:(Class)a3 forKey:(id)a4;
@end

@implementation _NSFaultingMutableOrderedSetMutationMethods

+ (id)_createMutationMethodsForClass:(Class)a3 forKey:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v6 = objc_alloc_init(_NSFaultingMutableOrderedSetMutationMethods);
  uint64_t v7 = [a4 length];
  MEMORY[0x1F4188790](v7);
  v9 = (char *)v14 - v8;
  CFStringGetCString((CFStringRef)a4, (char *)v14 - v8, v10, 0x8000100u);
  if (v7) {
    char *v9 = __toupper(*v9);
  }
  v6->_insertObjectMethod = _PFKeyValueMethodForPattern(a3, "insertObject:in%sAtIndex:", v9);
  Method v11 = _PFKeyValueMethodForPattern(a3, "insert%s:atIndexes:", v9);
  v6->_insertMethod = v11;
  if ((unint64_t)v6->_insertObjectMethod | (unint64_t)v11
    && (v6->_removeObjectMethod = _PFKeyValueMethodForPattern(a3, "removeObjectFrom%sAtIndex:", v9),
        Method v12 = _PFKeyValueMethodForPattern(a3, "remove%sAtIndexes:", v9),
        v6->_removeMethod = v12,
        (unint64_t)v6->_removeObjectMethod | (unint64_t)v12))
  {
    v6->_replaceObjectMethod = _PFKeyValueMethodForPattern(a3, "replaceObjectIn%sAtIndex:withObject:", v9);
    v6->_replaceMethod = _PFKeyValueMethodForPattern(a3, "replace%sAtIndexes:with%s", v9);
  }
  else
  {

    return 0;
  }
  return v6;
}

@end