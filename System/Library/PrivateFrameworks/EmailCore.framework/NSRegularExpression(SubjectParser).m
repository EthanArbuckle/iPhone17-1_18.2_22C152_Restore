@interface NSRegularExpression(SubjectParser)
+ (id)ec_regularExpressionForList;
@end

@implementation NSRegularExpression(SubjectParser)

+ (id)ec_regularExpressionForList
{
  if (ec_regularExpressionForList_predicate != -1) {
    dispatch_once(&ec_regularExpressionForList_predicate, &__block_literal_global_12_0);
  }
  v0 = (void *)ec_regularExpressionForList_listRegex;
  return v0;
}

@end