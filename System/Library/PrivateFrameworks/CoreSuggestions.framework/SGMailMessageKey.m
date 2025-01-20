@interface SGMailMessageKey
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMailMessageKey:(id)a3;
- (NSString)messageId;
- (NSString)source;
- (SGMailMessageKey)initWithCoder:(id)a3;
- (SGMailMessageKey)initWithSource:(id)a3 messageId:(id)a4;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SGMailMessageKey

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageId, 0);

  objc_storeStrong((id *)&self->_source, 0);
}

- (NSString)messageId
{
  return self->_messageId;
}

- (NSString)source
{
  return self->_source;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"'%@'/'%@'", self->_source, self->_messageId];

  return v2;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_source hash];
  return [(NSString *)self->_messageId hash] - v3 + 32 * v3;
}

- (BOOL)isEqualToMailMessageKey:(id)a3
{
  v4 = (id *)a3;
  source = self->_source;
  v6 = (NSString *)v4[1];
  if (source == v6)
  {
  }
  else
  {
    v7 = v6;
    v8 = source;
    char v9 = [(NSString *)v8 isEqual:v7];

    if ((v9 & 1) == 0)
    {
      char v10 = 0;
      goto LABEL_9;
    }
  }
  v11 = self->_messageId;
  v12 = v11;
  if (v11 == v4[2]) {
    char v10 = 1;
  }
  else {
    char v10 = -[NSString isEqual:](v11, "isEqual:");
  }

LABEL_9:
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SGMailMessageKey *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGMailMessageKey *)self isEqualToMailMessageKey:v5];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  source = self->_source;
  id v5 = a3;
  [v5 encodeObject:source forKey:@"source"];
  [v5 encodeObject:self->_messageId forKey:@"messageId"];
}

- (SGMailMessageKey)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SGMailMessageKey;
  id v5 = [(SGMailMessageKey *)&v13 init];
  if (v5)
  {
    BOOL v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"source"];
    source = v5->_source;
    v5->_source = (NSString *)v7;

    char v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"messageId"];
    messageId = v5->_messageId;
    v5->_messageId = (NSString *)v10;
  }
  return v5;
}

- (SGMailMessageKey)initWithSource:(id)a3 messageId:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SGMailMessageKey;
  char v9 = [(SGMailMessageKey *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_source, a3);
    objc_storeStrong((id *)&v10->_messageId, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end