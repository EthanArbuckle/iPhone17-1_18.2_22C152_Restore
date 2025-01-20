@interface FBKFilePredicateCondition
+ (id)entityName;
- (id)description;
- (void)setPropertiesFromJSONObject:(id)a3;
@end

@implementation FBKFilePredicateCondition

+ (id)entityName
{
  return @"FilePredicateCondition";
}

- (void)setPropertiesFromJSONObject:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"question_tat"];
  v6 = FBKNilIfNSNull(v5);
  [(FBKFilePredicateCondition *)self setQuestionTat:v6];

  id v8 = [v4 objectForKeyedSubscript:@"question_value"];

  v7 = FBKNilIfNSNull(v8);
  [(FBKFilePredicateCondition *)self setQuestionValue:v7];
}

- (id)description
{
  v3 = NSString;
  id v4 = [(FBKFilePredicateCondition *)self questionTat];
  v5 = [(FBKFilePredicateCondition *)self questionValue];
  v6 = [v3 stringWithFormat:@"%@ = %@", v4, v5];

  return v6;
}

@end