@interface ASDRestoreApplicationsRequestResponse
+ (BOOL)supportsSecureCoding;
- (ASDRestoreApplicationsRequestResponse)initWithCoder:(id)a3;
- (ASDRestoreApplicationsRequestResponse)initWithResults:(id)a3;
- (NSArray)results;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASDRestoreApplicationsRequestResponse

- (ASDRestoreApplicationsRequestResponse)initWithResults:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v4 copyItems:1];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 1;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__ASDRestoreApplicationsRequestResponse_initWithResults___block_invoke;
  v11[3] = &unk_1E58B3F88;
  v11[4] = &v12;
  [v5 enumerateObjectsUsingBlock:v11];
  if (!*((unsigned char *)v13 + 24))
  {
    v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ASDErrorDomain" code:928 userInfo:0];
    v9.receiver = self;
    v9.super_class = (Class)ASDRestoreApplicationsRequestResponse;
    v6 = [(ASDRequestResponse *)&v9 initWithError:v8];

    if (!v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v10.receiver = self;
  v10.super_class = (Class)ASDRestoreApplicationsRequestResponse;
  v6 = [(ASDRequestResponse *)&v10 init];
  if (v6) {
LABEL_3:
  }
    objc_storeStrong((id *)&v6->_results, v5);
LABEL_4:
  _Block_object_dispose(&v12, 8);

  return v6;
}

uint64_t __57__ASDRestoreApplicationsRequestResponse_initWithResults___block_invoke(uint64_t result, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v5 = result;
  uint64_t v6 = *(void *)(*(void *)(result + 32) + 8);
  char v7 = *(unsigned char *)(v6 + 24);
  if (v7)
  {
    result = [a2 status];
    char v7 = result == 2;
    uint64_t v6 = *(void *)(*(void *)(v5 + 32) + 8);
  }
  *(unsigned char *)(v6 + 24) = v7;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) ^ 1;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[ASDRestoreApplicationsRequestResponse allocWithZone:a3];
  results = self->_results;
  return [(ASDRestoreApplicationsRequestResponse *)v4 initWithResults:results];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDRestoreApplicationsRequestResponse)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  char v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"results"];

  objc_super v9 = [(ASDRestoreApplicationsRequestResponse *)self initWithResults:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSArray)results
{
  return self->_results;
}

- (void).cxx_destruct
{
}

@end