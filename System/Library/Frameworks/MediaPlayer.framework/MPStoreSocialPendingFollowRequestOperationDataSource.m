@interface MPStoreSocialPendingFollowRequestOperationDataSource
- (MPModelSocialPerson)person;
- (MPStoreSocialPendingFollowRequestOperationDataSource)initWithAction:(int64_t)a3;
- (id)_actionTypeString;
- (id)bagKey;
- (id)fallbackBagKeys;
- (id)httpBody;
- (id)queryItems;
- (int64_t)action;
- (int64_t)httpBodyType;
- (int64_t)httpMethod;
- (void)setPerson:(id)a3;
@end

@implementation MPStoreSocialPendingFollowRequestOperationDataSource

- (void).cxx_destruct
{
}

- (void)setPerson:(id)a3
{
}

- (MPModelSocialPerson)person
{
  return self->_person;
}

- (int64_t)action
{
  return self->_action;
}

- (id)queryItems
{
  return 0;
}

- (int64_t)httpMethod
{
  return 1;
}

- (int64_t)httpBodyType
{
  return 1;
}

- (id)httpBody
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(MPStoreSocialPendingFollowRequestOperationDataSource *)self _actionTypeString];
  [v3 setObject:v4 forKey:@"actionType"];

  v5 = [(MPModelObject *)self->_person identifiers];
  v6 = [v5 universalStore];
  v7 = [v6 socialProfileID];

  if (v7) {
    [v3 setObject:v7 forKey:@"id"];
  }
  v8 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v3 options:0 error:0];

  return v8;
}

- (id)fallbackBagKeys
{
  return &unk_1EE6EDFB8;
}

- (id)bagKey
{
  return @"followRequest";
}

- (id)_actionTypeString
{
  unint64_t action = self->_action;
  if (action > 3) {
    return 0;
  }
  else {
    return off_1E57F3F40[action];
  }
}

- (MPStoreSocialPendingFollowRequestOperationDataSource)initWithAction:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MPStoreSocialPendingFollowRequestOperationDataSource;
  result = [(MPStoreSocialPendingFollowRequestOperationDataSource *)&v5 init];
  if (result) {
    result->_unint64_t action = a3;
  }
  return result;
}

@end