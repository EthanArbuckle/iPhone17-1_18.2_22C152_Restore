@interface _XREngineeringTypeDefTopLevel
+ (id)_elementNameToClassMap;
@end

@implementation _XREngineeringTypeDefTopLevel

+ (id)_elementNameToClassMap
{
  if (qword_2687AA1A8 != -1) {
    dispatch_once(&qword_2687AA1A8, &unk_26E7526F0);
  }
  v2 = (void *)qword_2687AA1A0;

  return v2;
}

@end