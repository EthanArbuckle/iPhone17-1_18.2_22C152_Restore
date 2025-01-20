@interface FBKIssueDefinition
+ (id)entityName;
- (void)setPropertiesFromJSONObject:(id)a3;
@end

@implementation FBKIssueDefinition

+ (id)entityName
{
  return @"IssueDefinition";
}

- (void)setPropertiesFromJSONObject:(id)a3
{
  id v17 = a3;
  v4 = [v17 objectForKeyedSubscript:@"issue_type_id"];
  char IsNil = FBKJSONObjectIsNil(v4);

  if (IsNil)
  {
    v6 = 0;
  }
  else
  {
    v7 = NSNumber;
    v8 = [v17 objectForKeyedSubscript:@"issue_type_id"];
    v6 = objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v8, "unsignedIntegerValue"));
  }
  v9 = [v17 objectForKeyedSubscript:@"radar_keyword_id"];
  char v10 = FBKJSONObjectIsNil(v9);

  if (v10)
  {
    v11 = 0;
  }
  else
  {
    v12 = NSNumber;
    v13 = [v17 objectForKeyedSubscript:@"radar_keyword_id"];
    v11 = objc_msgSend(v12, "numberWithInteger:", objc_msgSend(v13, "unsignedIntegerValue"));
  }
  [(FBKIssueDefinition *)self setIssueTypeID:v6];
  [(FBKIssueDefinition *)self setIssueAreaID:v11];
  v14 = [v17 objectForKeyedSubscript:@"issue_file_matchers"];
  v15 = [(FBKIssueDefinition *)self managedObjectContext];
  v16 = +[FBKManagedFeedbackObject importFromJSONArray:v14 intoContext:v15];
  [(FBKIssueDefinition *)self setFileMatchers:v16];
}

@end