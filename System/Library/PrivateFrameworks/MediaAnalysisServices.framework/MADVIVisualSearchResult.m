@interface MADVIVisualSearchResult
+ (BOOL)supportsSecureCoding;
- (MADVIVisualSearchResult)initWithCoder:(id)a3;
- (MADVIVisualSearchResult)initWithResultItems:(id)a3 andUserFeedbackPayload:(id)a4;
- (NSArray)resultItems;
- (NSData)userFeedbackPayload;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADVIVisualSearchResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADVIVisualSearchResult)initWithResultItems:(id)a3 andUserFeedbackPayload:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MADVIVisualSearchResult;
  v9 = [(MADResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_resultItems, a3);
    objc_storeStrong((id *)&v10->_userFeedbackPayload, a4);
  }

  return v10;
}

- (MADVIVisualSearchResult)initWithCoder:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MADVIVisualSearchResult;
  v5 = [(MADResult *)&v14 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    id v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"ResultItems"];
    resultItems = v5->_resultItems;
    v5->_resultItems = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UserFeedbackPayload"];
    userFeedbackPayload = v5->_userFeedbackPayload;
    v5->_userFeedbackPayload = (NSData *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MADVIVisualSearchResult;
  id v4 = a3;
  [(MADResult *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_resultItems, @"ResultItems", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_userFeedbackPayload forKey:@"UserFeedbackPayload"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  v6 = [(NSArray *)self->_resultItems description];
  [v3 appendFormat:@"resultItems: %@ ", v6];

  id v7 = [(NSData *)self->_userFeedbackPayload description];
  [v3 appendFormat:@"userFeedbackPayload: %@>", v7];

  return v3;
}

- (NSArray)resultItems
{
  return self->_resultItems;
}

- (NSData)userFeedbackPayload
{
  return self->_userFeedbackPayload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userFeedbackPayload, 0);
  objc_storeStrong((id *)&self->_resultItems, 0);
}

@end