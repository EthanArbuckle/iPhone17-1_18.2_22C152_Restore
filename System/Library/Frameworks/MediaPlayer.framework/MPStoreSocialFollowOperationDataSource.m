@interface MPStoreSocialFollowOperationDataSource
- (MPModelSocialPerson)person;
- (id)bagKey;
- (id)httpBody;
- (id)queryItems;
- (int64_t)httpBodyType;
- (int64_t)httpMethod;
- (void)setPerson:(id)a3;
@end

@implementation MPStoreSocialFollowOperationDataSource

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
  v10[1] = *MEMORY[0x1E4F143B8];
  v2 = [(MPModelObject *)self->_person identifiers];
  v3 = [v2 universalStore];
  v4 = [v3 socialProfileID];

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E4F28D90];
    v9 = @"id";
    v10[0] = v4;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    v7 = [v5 dataWithJSONObject:v6 options:0 error:0];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)bagKey
{
  return @"followProfile";
}

@end