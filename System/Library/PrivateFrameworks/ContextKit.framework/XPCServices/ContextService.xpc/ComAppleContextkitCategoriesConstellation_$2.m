@interface ComAppleContextkitCategoriesConstellation_$2
- (ComAppleContextkitCategoriesConstellation_$2)initWithJavaUtilMap:(id)a3;
- (void)acceptWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
- (void)dealloc;
@end

@implementation ComAppleContextkitCategoriesConstellation_$2

- (void)acceptWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
{
  v5 = self->val$idsAndHeight_;
  if (!v5 || (id v9 = [(JavaUtilMap *)v5 getWithId:JavaLangInteger_valueOfWithInt_(a3)]) == 0) {
    JreThrowNullPointerException();
  }
  unsigned int v10 = a4 + [v9 intValue];
  if ((int)(v10 + 1) < 8) {
    int v11 = v10 + 1;
  }
  else {
    int v11 = 8;
  }
  v12 = self->val$idsAndHeight_;
  v13 = JavaLangInteger_valueOfWithInt_(a5);
  id v14 = [(JavaUtilMap *)v12 putWithId:v13 withId:JavaLangInteger_valueOfWithInt_(v11)];
  if (v14)
  {
    id v15 = v14;
    if ((int)[v14 intValue] < v11)
    {
      v16 = self->val$idsAndHeight_;
      v17 = JavaLangInteger_valueOfWithInt_(a5);
      [(JavaUtilMap *)v16 putWithId:v17 withId:v15];
    }
  }
}

- (ComAppleContextkitCategoriesConstellation_$2)initWithJavaUtilMap:(id)a3
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ComAppleContextkitCategoriesConstellation__2;
  [(ComAppleContextkitCategoriesConstellation_$2 *)&v3 dealloc];
}

@end