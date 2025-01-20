@interface FBKFeedbackFollowupResponse
+ (id)entityName;
+ (int64_t)sortValueOfFollowupResponseRole:(id)a3;
+ (unint64_t)followupResponseTypeFromString:(id)a3;
- (BOOL)isValidated;
- (BOOL)isValidationResponse;
- (unint64_t)type;
- (void)setPropertiesFromJSONObject:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation FBKFeedbackFollowupResponse

+ (id)entityName
{
  return @"FeedbackFollowupResponse";
}

- (void)setPropertiesFromJSONObject:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"created_at"];
  FBKDateFromServerString(v5);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  v6 = [v4 objectForKeyedSubscript:@"ffr_type"];
  unint64_t v7 = +[FBKFeedbackFollowupResponse followupResponseTypeFromString:v6];

  v8 = [v4 objectForKeyedSubscript:@"tat"];
  v9 = FBKNilIfNSNull(v8);

  v10 = [v4 objectForKeyedSubscript:@"text"];

  v11 = FBKNilIfNSNull(v10);

  [(FBKFeedbackFollowupResponse *)self setType:v7];
  [(FBKFeedbackFollowupResponse *)self setRole:v9];
  [(FBKFeedbackFollowupResponse *)self setText:v11];
  [(FBKFeedbackFollowupResponse *)self setCreatedAt:v12];
}

+ (unint64_t)followupResponseTypeFromString:(id)a3
{
  id v3 = a3;
  if (followupResponseTypeFromString__onceToken[0] != -1) {
    dispatch_once(followupResponseTypeFromString__onceToken, &__block_literal_global_48);
  }
  id v4 = [(id)followupResponseTypeFromString__mapping objectForKeyedSubscript:v3];
  v5 = v4;
  if (v4) {
    unint64_t v6 = [v4 unsignedIntegerValue];
  }
  else {
    unint64_t v6 = -1;
  }

  return v6;
}

void __62__FBKFeedbackFollowupResponse_followupResponseTypeFromString___block_invoke()
{
  v5[2] = *MEMORY[0x263EF8340];
  v4[0] = @"file_name";
  v0 = [NSNumber numberWithUnsignedInteger:0];
  v4[1] = @"text";
  v5[0] = v0;
  v1 = [NSNumber numberWithUnsignedInteger:1];
  v5[1] = v1;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  id v3 = (void *)followupResponseTypeFromString__mapping;
  followupResponseTypeFromString__mapping = v2;
}

+ (int64_t)sortValueOfFollowupResponseRole:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@":request_info"])
  {
    int64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@":additional_info"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@":comments"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@":why_opt_out"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@":is_validated"])
  {
    int64_t v4 = 4;
  }
  else
  {
    int64_t v4 = 100;
  }

  return v4;
}

- (BOOL)isValidated
{
  BOOL v3 = [(FBKFeedbackFollowupResponse *)self isValidationResponse];
  if (v3)
  {
    int64_t v4 = [(FBKFeedbackFollowupResponse *)self text];
    char v5 = [v4 isEqualToString:@"true"];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isValidationResponse
{
  uint64_t v2 = [(FBKFeedbackFollowupResponse *)self role];
  char v3 = [v2 isEqualToString:@":is_validated"];

  return v3;
}

- (unint64_t)type
{
  [(FBKFeedbackFollowupResponse *)self willAccessValueForKey:@"type"];
  char v3 = [(FBKFeedbackFollowupResponse *)self primitiveType];
  unint64_t v4 = [v3 integerValue];

  [(FBKFeedbackFollowupResponse *)self didAccessValueForKey:@"type"];
  return v4;
}

- (void)setType:(unint64_t)a3
{
  [(FBKFeedbackFollowupResponse *)self willChangeValueForKey:@"type"];
  char v5 = [NSNumber numberWithInteger:a3];
  [(FBKFeedbackFollowupResponse *)self setPrimitiveType:v5];

  [(FBKFeedbackFollowupResponse *)self didChangeValueForKey:@"type"];
}

@end