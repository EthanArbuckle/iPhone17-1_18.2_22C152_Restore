@interface ComAppleContextkitCategoriesConstellation_Request_$3
- (ComAppleContextkitCategoriesConstellation_Request_$3)initWithJavaUtilMap:(id)a3;
- (int)compareWithId:(id)a3 withId:(id)a4;
- (void)dealloc;
@end

@implementation ComAppleContextkitCategoriesConstellation_Request_$3

- (int)compareWithId:(id)a3 withId:(id)a4
{
  v5 = self->val$categoryIdToRank_;
  if (!v5
    || (id v7 = [(JavaUtilMap *)v5 getWithId:a3],
        id v8 = [(JavaUtilMap *)self->val$categoryIdToRank_ getWithId:a4],
        !v7))
  {
    JreThrowNullPointerException();
  }
  return [v7 compareToWithId:v8];
}

- (ComAppleContextkitCategoriesConstellation_Request_$3)initWithJavaUtilMap:(id)a3
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ComAppleContextkitCategoriesConstellation_Request__3;
  [(ComAppleContextkitCategoriesConstellation_Request_$3 *)&v3 dealloc];
}

@end