@interface NSObject(AXTrmpoline)
- (AXTrampoline)axSuperTrampoline;
- (AXTrampoline)axTrampolineForClass:()AXTrmpoline;
@end

@implementation NSObject(AXTrmpoline)

- (AXTrampoline)axSuperTrampoline
{
  Class = object_getClass(a1);
  BOOL isMetaClass = class_isMetaClass(Class);
  v4 = (objc_class *)a1;
  if (!isMetaClass) {
    v4 = object_getClass(a1);
  }
  Class Superclass = class_getSuperclass(v4);
  return +[AXTrampoline trampolineWithCaller:a1 targetClass:Superclass];
}

- (AXTrampoline)axTrampolineForClass:()AXTrmpoline
{
  return +[AXTrampoline trampolineWithCaller:a1 targetClass:a3];
}

@end