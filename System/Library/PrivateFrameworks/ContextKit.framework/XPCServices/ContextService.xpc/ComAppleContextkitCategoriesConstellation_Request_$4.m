@interface ComAppleContextkitCategoriesConstellation_Request_$4
- (ComAppleContextkitCategoriesConstellation_Request_$4)initWithComAppleContextkitCategoriesConstellation_Request:(id)a3 withJavaUtilMap:(id)a4 withJavaUtilMap:(id)a5 withNSString:(id)a6;
- (void)acceptWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
- (void)dealloc;
@end

@implementation ComAppleContextkitCategoriesConstellation_Request_$4

- (void)acceptWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
{
  v5 = self->val$categoryIdToRank_;
  if (!v5) {
    JreThrowNullPointerException();
  }
  if ([(JavaUtilMap *)v5 containsKeyWithId:JavaLangInteger_valueOfWithInt_(a5)])
  {
    v8 = self->val$qidToRankedCategoryIds_;
    v9 = self->val$qid_;
    sub_1000C767C(v8, (uint64_t)v9, a5);
  }
}

- (ComAppleContextkitCategoriesConstellation_Request_$4)initWithComAppleContextkitCategoriesConstellation_Request:(id)a3 withJavaUtilMap:(id)a4 withJavaUtilMap:(id)a5 withNSString:(id)a6
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ComAppleContextkitCategoriesConstellation_Request__4;
  [(ComAppleContextkitCategoriesConstellation_Request_$4 *)&v3 dealloc];
}

@end