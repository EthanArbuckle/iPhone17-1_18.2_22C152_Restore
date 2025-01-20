@interface MPMediaKitContentReport
- (NSString)commentText;
- (NSString)concernItemID;
- (NSString)concernTypeID;
- (NSString)displayText;
- (NSString)parentConcernType;
- (NSString)parentContentID;
- (NSString)userID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)concernItemType;
- (void)setCommentText:(id)a3;
- (void)setConcernItemID:(id)a3;
- (void)setConcernItemType:(int64_t)a3;
- (void)setConcernTypeID:(id)a3;
- (void)setDisplayText:(id)a3;
- (void)setParentConcernType:(id)a3;
- (void)setParentContentID:(id)a3;
- (void)setUserID:(id)a3;
@end

@implementation MPMediaKitContentReport

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayText, 0);
  objc_storeStrong((id *)&self->_parentConcernType, 0);
  objc_storeStrong((id *)&self->_parentContentID, 0);
  objc_storeStrong((id *)&self->_concernTypeID, 0);
  objc_storeStrong((id *)&self->_commentText, 0);
  objc_storeStrong((id *)&self->_concernItemID, 0);

  objc_storeStrong((id *)&self->_userID, 0);
}

- (void)setDisplayText:(id)a3
{
}

- (NSString)displayText
{
  return self->_displayText;
}

- (void)setParentConcernType:(id)a3
{
}

- (NSString)parentConcernType
{
  return self->_parentConcernType;
}

- (void)setParentContentID:(id)a3
{
}

- (NSString)parentContentID
{
  return self->_parentContentID;
}

- (void)setConcernTypeID:(id)a3
{
}

- (NSString)concernTypeID
{
  return self->_concernTypeID;
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

- (void)setConcernItemID:(id)a3
{
}

- (NSString)concernItemID
{
  return self->_concernItemID;
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
  v6 = [(MPMediaKitContentReport *)self concernItemID];
  v7 = [(MPMediaKitContentReport *)self concernTypeID];
  v8 = [v3 stringWithFormat:@"<%@: %p %@:'%@'>", v5, self, v6, v7];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = [(MPMediaKitContentReport *)self userID];
  v6 = (void *)[v5 copy];
  [v4 setUserID:v6];

  v7 = [(MPMediaKitContentReport *)self concernItemID];
  v8 = (void *)[v7 copy];
  [v4 setConcernItemID:v8];

  v9 = [(MPMediaKitContentReport *)self concernTypeID];
  v10 = (void *)[v9 copy];
  [v4 setConcernTypeID:v10];

  objc_msgSend(v4, "setConcernItemType:", -[MPMediaKitContentReport concernItemType](self, "concernItemType"));
  v11 = [(MPMediaKitContentReport *)self commentText];
  v12 = (void *)[v11 copy];
  [v4 setCommentText:v12];

  v13 = [(MPMediaKitContentReport *)self displayText];
  v14 = (void *)[v13 copy];
  [v4 setDisplayText:v14];

  v15 = [(MPMediaKitContentReport *)self parentContentID];
  v16 = (void *)[v15 copy];
  [v4 setParentContentID:v16];

  v17 = [(MPMediaKitContentReport *)self parentConcernType];
  v18 = (void *)[v17 copy];
  [v4 setParentConcernType:v18];

  return v4;
}

@end