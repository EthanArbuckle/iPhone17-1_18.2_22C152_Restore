@interface INArchivedObject
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INArchivedObject)initWithCoder:(id)a3;
- (INArchivedObject)initWithTypeName:(id)a3 messageData:(id)a4;
- (NSData)messageData;
- (NSString)description;
- (NSString)typeName;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INArchivedObject

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageData, 0);

  objc_storeStrong((id *)&self->_typeName, 0);
}

- (NSData)messageData
{
  return self->_messageData;
}

- (NSString)typeName
{
  return self->_typeName;
}

- (id)_dictionaryRepresentation
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"typeName";
  typeName = self->_typeName;
  v4 = typeName;
  if (!typeName)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"messageData";
  v10[0] = v4;
  messageData = self->_messageData;
  v6 = messageData;
  if (!messageData)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (messageData)
  {
    if (typeName) {
      goto LABEL_7;
    }
  }
  else
  {

    if (typeName) {
      goto LABEL_7;
    }
  }

LABEL_7:

  return v7;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INArchivedObject;
  v6 = [(INArchivedObject *)&v11 description];
  v7 = [(INArchivedObject *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INArchivedObject *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_typeName];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"typeName");

  v9 = [v6 encodeObject:self->_messageData];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"messageData");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  typeName = self->_typeName;
  id v5 = a3;
  [v5 encodeObject:typeName forKey:@"typeName"];
  [v5 encodeObject:self->_messageData forKey:@"messageData"];
}

- (INArchivedObject)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"typeName"];

  v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"messageData"];

  v10 = [(INArchivedObject *)self initWithTypeName:v8 messageData:v9];
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (INArchivedObject *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      typeName = self->_typeName;
      BOOL v8 = 0;
      if (typeName == v5->_typeName || -[NSString isEqual:](typeName, "isEqual:"))
      {
        messageData = self->_messageData;
        if (messageData == v5->_messageData || -[NSData isEqual:](messageData, "isEqual:")) {
          BOOL v8 = 1;
        }
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_typeName hash];
  return [(NSData *)self->_messageData hash] ^ v3;
}

- (INArchivedObject)initWithTypeName:(id)a3 messageData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)INArchivedObject;
  BOOL v8 = [(INArchivedObject *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    typeName = v8->_typeName;
    v8->_typeName = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    messageData = v8->_messageData;
    v8->_messageData = (NSData *)v11;
  }
  return v8;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v8 objectForKeyedSubscript:@"typeName"];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = [v8 objectForKeyedSubscript:@"messageData"];
    v12 = [v7 decodeObjectOfClass:v10 from:v11];

    v13 = (void *)[objc_alloc((Class)a1) initWithTypeName:v9 messageData:v12];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end