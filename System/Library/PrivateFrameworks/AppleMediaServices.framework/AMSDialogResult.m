@interface AMSDialogResult
+ (BOOL)supportsSecureCoding;
- (AMSDialogRequest)originalRequest;
- (AMSDialogResult)initWithCoder:(id)a3;
- (AMSDialogResult)initWithOriginalRequest:(id)a3 selectedActionIdentifier:(id)a4;
- (NSArray)textfieldValues;
- (NSMutableDictionary)userInfo;
- (NSString)selectedActionIdentifier;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setSelectedActionIdentifier:(id)a3;
- (void)setTextfieldValues:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation AMSDialogResult

- (AMSDialogResult)initWithOriginalRequest:(id)a3 selectedActionIdentifier:(id)a4
{
  id v7 = a3;
  v8 = (__CFString *)a4;
  v15.receiver = self;
  v15.super_class = (Class)AMSDialogResult;
  v9 = [(AMSDialogResult *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_originalRequest, a3);
    if (v8) {
      v11 = v8;
    }
    else {
      v11 = @"AMSDialogResultDismissIdentifier";
    }
    objc_storeStrong((id *)&v10->_selectedActionIdentifier, v11);
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    userInfo = v10->_userInfo;
    v10->_userInfo = v12;
  }
  return v10;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(AMSDialogResult *)self selectedActionIdentifier];
  v6 = [v3 stringWithFormat:@"<%@:%p selected:%@>", v4, self, v5];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  uint64_t v4 = [(AMSDialogResult *)self originalRequest];

  if (v4)
  {
    v5 = [(AMSDialogResult *)self originalRequest];
    [v12 encodeObject:v5 forKey:@"kCodingKeyOriginalRequest"];
  }
  v6 = [(AMSDialogResult *)self selectedActionIdentifier];

  if (v6)
  {
    id v7 = [(AMSDialogResult *)self selectedActionIdentifier];
    [v12 encodeObject:v7 forKey:@"kCodingKeySelectionActionId"];
  }
  v8 = [(AMSDialogResult *)self textfieldValues];

  if (v8)
  {
    v9 = [(AMSDialogResult *)self textfieldValues];
    [v12 encodeObject:v9 forKey:@"kCodingKeyTextfieldValues"];
  }
  v10 = [(AMSDialogResult *)self userInfo];

  if (v10)
  {
    v11 = [(AMSDialogResult *)self userInfo];
    [v12 encodeObject:v11 forKey:@"kCodingKeyUserInfo"];
  }
}

- (AMSDialogResult)initWithCoder:(id)a3
{
  v23[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)AMSDialogResult;
  v5 = [(AMSDialogResult *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyOriginalRequest"];
    originalRequest = v5->_originalRequest;
    v5->_originalRequest = (AMSDialogRequest *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeySelectionActionId"];
    selectedActionIdentifier = v5->_selectedActionIdentifier;
    v5->_selectedActionIdentifier = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E4F1CAD0];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    v23[2] = objc_opt_class();
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];
    id v12 = [v10 setWithArray:v11];

    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"kCodingKeyTextfieldValues"];
    textfieldValues = v5->_textfieldValues;
    v5->_textfieldValues = (NSArray *)v13;

    objc_super v15 = objc_msgSend(MEMORY[0x1E4F1CAD0], "ams_JSONClasses");
    v16 = [v4 decodeObjectOfClasses:v15 forKey:@"kCodingKeyUserInfo"];
    v17 = (void *)[v16 mutableCopy];
    v18 = v17;
    if (v17) {
      v19 = v17;
    }
    else {
      v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    userInfo = v5->_userInfo;
    v5->_userInfo = v19;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AMSDialogRequest)originalRequest
{
  return self->_originalRequest;
}

- (NSString)selectedActionIdentifier
{
  return self->_selectedActionIdentifier;
}

- (void)setSelectedActionIdentifier:(id)a3
{
}

- (NSArray)textfieldValues
{
  return self->_textfieldValues;
}

- (void)setTextfieldValues:(id)a3
{
}

- (NSMutableDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_textfieldValues, 0);
  objc_storeStrong((id *)&self->_selectedActionIdentifier, 0);
  objc_storeStrong((id *)&self->_originalRequest, 0);
}

@end