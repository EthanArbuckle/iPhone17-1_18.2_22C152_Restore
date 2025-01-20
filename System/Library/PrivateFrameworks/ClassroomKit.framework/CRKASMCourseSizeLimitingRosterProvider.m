@interface CRKASMCourseSizeLimitingRosterProvider
- (BOOL)isLegalToUpdateCourse:(id)a3 withProperties:(id)a4 error:(id *)a5;
- (CRKASMCourseSizeLimitingRosterProvider)initWithRosterProvider:(id)a3 maxUserCount:(int64_t)a4 maxTrustedUserCount:(int64_t)a5;
- (id)courseForIdentifier:(id)a3;
- (int64_t)maxTrustedUserCount;
- (int64_t)maxUserCount;
- (void)createCourseWithProperties:(id)a3 completion:(id)a4;
- (void)updateCourseWithIdentifier:(id)a3 properties:(id)a4 completion:(id)a5;
@end

@implementation CRKASMCourseSizeLimitingRosterProvider

- (CRKASMCourseSizeLimitingRosterProvider)initWithRosterProvider:(id)a3 maxUserCount:(int64_t)a4 maxTrustedUserCount:(int64_t)a5
{
  v8.receiver = self;
  v8.super_class = (Class)CRKASMCourseSizeLimitingRosterProvider;
  result = [(CRKASMRosterProviderDecoratorBase *)&v8 initWithRosterProvider:a3];
  if (result)
  {
    result->_maxUserCount = a4;
    result->_maxTrustedUserCount = a5;
  }
  return result;
}

- (void)createCourseWithProperties:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  objc_super v8 = [v6 updateProperties];
  id v12 = 0;
  BOOL v9 = [(CRKASMCourseSizeLimitingRosterProvider *)self isLegalToUpdateCourse:0 withProperties:v8 error:&v12];
  id v10 = v12;

  if (v9)
  {
    v11 = [(CRKASMRosterProviderDecoratorBase *)self underlyingRosterProvider];
    [v11 createCourseWithProperties:v6 completion:v7];
  }
  else
  {
    v7[2](v7, v10);
  }
}

- (void)updateCourseWithIdentifier:(id)a3 properties:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id))a5;
  v11 = [(CRKASMCourseSizeLimitingRosterProvider *)self courseForIdentifier:v8];
  id v15 = 0;
  BOOL v12 = [(CRKASMCourseSizeLimitingRosterProvider *)self isLegalToUpdateCourse:v11 withProperties:v9 error:&v15];
  id v13 = v15;
  if (v12)
  {
    v14 = [(CRKASMRosterProviderDecoratorBase *)self underlyingRosterProvider];
    [v14 updateCourseWithIdentifier:v8 properties:v9 completion:v10];
  }
  else
  {
    v10[2](v10, v13);
  }
}

- (BOOL)isLegalToUpdateCourse:(id)a3 withProperties:(id)a4 error:(id *)a5
{
  id v8 = (void *)MEMORY[0x263EFF9C0];
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [v10 users];
  BOOL v12 = (void *)v11;
  id v13 = (void *)MEMORY[0x263EFFA68];
  if (v11) {
    uint64_t v14 = v11;
  }
  else {
    uint64_t v14 = MEMORY[0x263EFFA68];
  }
  id v15 = [v8 setWithArray:v14];

  v16 = [v9 usersToAdd];
  [v15 unionSet:v16];

  v17 = [v9 usersToRemove];
  [v15 minusSet:v17];

  v18 = (void *)MEMORY[0x263EFF9C0];
  v19 = [v10 trustedUsers];

  if (v19) {
    v20 = v19;
  }
  else {
    v20 = v13;
  }
  v21 = [v18 setWithArray:v20];

  v22 = [v9 trustedUsersToAdd];
  [v21 unionSet:v22];

  v23 = [v9 trustedUsersToRemove];

  [v21 minusSet:v23];
  unint64_t v24 = [v15 count];
  if (v24 <= [(CRKASMCourseSizeLimitingRosterProvider *)self maxUserCount]
    && (unint64_t v25 = [v21 count],
        v25 <= [(CRKASMCourseSizeLimitingRosterProvider *)self maxTrustedUserCount]))
  {
    BOOL v26 = 1;
  }
  else if (a5)
  {
    CRKErrorWithCodeAndUserInfo(155, 0);
    BOOL v26 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v26 = 0;
  }

  return v26;
}

- (id)courseForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CRKASMRosterProviderDecoratorBase *)self underlyingRosterProvider];
  id v6 = [v5 roster];
  v7 = [v6 courses];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __62__CRKASMCourseSizeLimitingRosterProvider_courseForIdentifier___block_invoke;
  v11[3] = &unk_2646F4100;
  id v12 = v4;
  id v8 = v4;
  id v9 = objc_msgSend(v7, "crk_firstMatching:", v11);

  return v9;
}

uint64_t __62__CRKASMCourseSizeLimitingRosterProvider_courseForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (int64_t)maxUserCount
{
  return self->_maxUserCount;
}

- (int64_t)maxTrustedUserCount
{
  return self->_maxTrustedUserCount;
}

@end