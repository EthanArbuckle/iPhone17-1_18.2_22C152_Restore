@interface _NSFaultingMutableSetMutationMethods
+ (id)_createMutationMethodsForClass:(Class)a3 forKey:(id)a4;
@end

@implementation _NSFaultingMutableSetMutationMethods

+ (id)_createMutationMethodsForClass:(Class)a3 forKey:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v6 = objc_alloc_init(_NSFaultingMutableSetMutationMethods);
  uint64_t v7 = [a4 length];
  MEMORY[0x1F4188790](v7);
  v9 = (char *)v14 - v8;
  CFStringGetCString((CFStringRef)a4, (char *)v14 - v8, v10, 0x8000100u);
  if (v7) {
    char *v9 = __toupper(*v9);
  }
  v6->_addObjectMethod = _PFKeyValueMethodForPattern(a3, "add%sObject:", v9);
  Method v11 = _PFKeyValueMethodForPattern(a3, "add%s:", v9);
  v6->_addMethod = v11;
  if ((unint64_t)v6->_addObjectMethod | (unint64_t)v11
    && (v6->_removeObjectMethod = _PFKeyValueMethodForPattern(a3, "remove%sObject:", v9),
        Method v12 = _PFKeyValueMethodForPattern(a3, "remove%s:", v9),
        v6->_removeMethod = v12,
        (unint64_t)v6->_removeObjectMethod | (unint64_t)v12))
  {
    v6->_intersectMethod = _PFKeyValueMethodForPattern(a3, "intersect%s:", v9);
    v6->_setMethod = _PFKeyValueMethodForPattern(a3, "set%s:", v9);
  }
  else
  {

    return 0;
  }
  return v6;
}

@end