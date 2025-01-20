@interface CKContextItem
+ (BOOL)supportsSecureCoding;
- (CKContextItem)initWithCoder:(id)a3;
- (NSString)title;
- (NSString)topicId;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTopicId:(id)a3;
@end

@implementation CKContextItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKContextItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKContextItem;
  v5 = [(CKContextItem *)&v13 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    if (!v6)
    {
      v11 = 0;
      goto LABEL_6;
    }
    title = v5->_title;
    v5->_title = v6;
    v8 = v6;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"topicId"];
    topicId = v5->_topicId;
    v5->_topicId = (NSString *)v9;
  }
  v11 = v5;
LABEL_6:

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"title"];
  [v5 encodeObject:self->_topicId forKey:@"topicId"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  [v4 setTitle:self->_title];
  [v4 setTopicId:self->_topicId];
  return v4;
}

- (unint64_t)hash
{
  v2 = [(CKContextItem *)self title];
  unint64_t v3 = 31 * [v2 hash];

  return v3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)topicId
{
  return self->_topicId;
}

- (void)setTopicId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicId, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end