@interface MPStoreContentReport
- (NSString)aucType;
- (NSString)commentText;
- (NSString)concernTypeID;
- (NSString)contentID;
- (NSString)displayText;
- (NSString)userID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)concernItemType;
- (void)setAucType:(id)a3;
- (void)setCommentText:(id)a3;
- (void)setConcernItemType:(int64_t)a3;
- (void)setConcernTypeID:(id)a3;
- (void)setContentID:(id)a3;
- (void)setDisplayText:(id)a3;
- (void)setUserID:(id)a3;
@end

@implementation MPStoreContentReport

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayText, 0);
  objc_storeStrong((id *)&self->_concernTypeID, 0);
  objc_storeStrong((id *)&self->_aucType, 0);
  objc_storeStrong((id *)&self->_commentText, 0);
  objc_storeStrong((id *)&self->_contentID, 0);

  objc_storeStrong((id *)&self->_userID, 0);
}

- (void)setDisplayText:(id)a3
{
}

- (NSString)displayText
{
  return self->_displayText;
}

- (void)setConcernTypeID:(id)a3
{
}

- (NSString)concernTypeID
{
  return self->_concernTypeID;
}

- (void)setAucType:(id)a3
{
}

- (NSString)aucType
{
  return self->_aucType;
}

- (void)setCommentText:(id)a3
{
}

- (NSString)commentText
{
  return self->_commentText;
}

- (void)setConcernItemType:(int64_t)a3
{
  self->_concernItemType = a3;
}

- (int64_t)concernItemType
{
  return self->_concernItemType;
}

- (void)setContentID:(id)a3
{
}

- (NSString)contentID
{
  return self->_contentID;
}

- (void)setUserID:(id)a3
{
}

- (NSString)userID
{
  return self->_userID;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(MPStoreContentReport *)self contentID];
  v7 = [(MPStoreContentReport *)self concernTypeID];
  v8 = [v3 stringWithFormat:@"<%@: %p %@:'%@'>", v5, self, v6, v7];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = [(MPStoreContentReport *)self userID];
  v6 = (void *)[v5 copy];
  [v4 setUserID:v6];

  v7 = [(MPStoreContentReport *)self contentID];
  v8 = (void *)[v7 copy];
  [v4 setContentID:v8];

  v9 = [(MPStoreContentReport *)self concernTypeID];
  v10 = (void *)[v9 copy];
  [v4 setConcernTypeID:v10];

  objc_msgSend(v4, "setConcernItemType:", -[MPStoreContentReport concernItemType](self, "concernItemType"));
  v11 = [(MPStoreContentReport *)self commentText];
  v12 = (void *)[v11 copy];
  [v4 setCommentText:v12];

  v13 = [(MPStoreContentReport *)self displayText];
  v14 = (void *)[v13 copy];
  [v4 setDisplayText:v14];

  return v4;
}

@end