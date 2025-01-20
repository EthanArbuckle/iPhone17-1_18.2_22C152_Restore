@interface CKPredicateValidator
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)sharedValidator;
- (BOOL)validate:(id)a3 error:(id *)a4;
@end

@implementation CKPredicateValidator

+ (id)sharedValidator
{
  if (qword_1EB279F28 != -1) {
    dispatch_once(&qword_1EB279F28, &unk_1ED7EF658);
  }
  v2 = (void *)qword_1EB279F20;

  return v2;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    v6 = [CKException alloc];
    id v8 = (id)objc_msgSend_initWithCode_format_(v6, v7, 12, @"This is an abstract class. Use +sharedValidator instead");
    objc_exception_throw(v8);
  }
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___CKPredicateValidator;
  return objc_msgSendSuper2(&v9, sel_allocWithZone_, a3);
}

- (BOOL)validate:(id)a3 error:(id *)a4
{
  id v4 = a3;
  v5 = [CKException alloc];
  id v7 = (id)objc_msgSend_initWithCode_format_(v5, v6, 12, @"This method must be overridden");
  objc_exception_throw(v7);
}

@end