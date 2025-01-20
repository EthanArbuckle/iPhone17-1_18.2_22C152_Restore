@interface SGConversationTurn
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConversationTurn:(id)a3;
- (NSDate)timestamp;
- (NSString)senderID;
- (NSString)text;
- (SGConversationTurn)initWithCoder:(id)a3;
- (SGConversationTurn)initWithText:(id)a3 senderID:(id)a4 timestamp:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SGConversationTurn

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_senderID, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (NSString)senderID
{
  return self->_senderID;
}

- (NSString)text
{
  return self->_text;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<SGConversationTurn txt_sz:%tu sid_sz:%tu tsp:%@>", -[NSString length](self->_text, "length"), -[NSString length](self->_senderID, "length"), self->_timestamp];

  return v2;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_text hash];
  NSUInteger v4 = [(NSString *)self->_senderID hash] - v3 + 32 * v3;
  return [(NSDate *)self->_timestamp hash] - v4 + 32 * v4;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (SGConversationTurn *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGConversationTurn *)self isEqualToConversationTurn:v5];

  return v6;
}

- (BOOL)isEqualToConversationTurn:(id)a3
{
  id v5 = a3;
  BOOL v6 = v5;
  if (v5)
  {
    v7 = (id *)v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:a2, self, @"SGConversationTurn.m", 96, @"Invalid parameter not satisfying: %@", @"[otherTurn isKindOfClass:[SGConversationTurn class]]" object file lineNumber description];
    }
    text = self->_text;
    v9 = (NSString *)v7[1];
    if (text == v9)
    {
    }
    else
    {
      v10 = v9;
      v11 = text;
      char v12 = [(NSString *)v11 isEqual:v10];

      if ((v12 & 1) == 0) {
        goto LABEL_11;
      }
    }
    senderID = self->_senderID;
    v15 = (NSString *)v7[2];
    if (senderID == v15)
    {
    }
    else
    {
      v16 = v15;
      v17 = senderID;
      char v18 = [(NSString *)v17 isEqual:v16];

      if ((v18 & 1) == 0)
      {
LABEL_11:
        char v13 = 0;
LABEL_17:

        goto LABEL_18;
      }
    }
    v19 = self->_timestamp;
    v20 = v19;
    if (v19 == v7[3]) {
      char v13 = 1;
    }
    else {
      char v13 = -[NSDate isEqual:](v19, "isEqual:");
    }

    goto LABEL_17;
  }
  char v13 = 0;
LABEL_18:

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  id v5 = objc_opt_new();
  if (v5)
  {
    uint64_t v6 = [(NSString *)self->_text copyWithZone:a3];
    v7 = (void *)v5[1];
    v5[1] = v6;

    uint64_t v8 = [(NSString *)self->_senderID copyWithZone:a3];
    v9 = (void *)v5[2];
    v5[2] = v8;

    uint64_t v10 = [(NSDate *)self->_timestamp copyWithZone:a3];
    v11 = (void *)v5[3];
    v5[3] = v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  text = self->_text;
  id v5 = a3;
  [v5 encodeObject:text forKey:@"txt"];
  [v5 encodeObject:self->_senderID forKey:@"sid"];
  [v5 encodeObject:self->_timestamp forKey:@"tsp"];
}

- (SGConversationTurn)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = (void *)MEMORY[0x1E4F93B90];
  v7 = sgLogHandle();
  uint64_t v8 = [v6 robustDecodeObjectOfClass:v5 forKey:@"txt" withCoder:v4 expectNonNull:0 errorDomain:@"SGErrorDomain" errorCode:11 logHandle:v7];

  v9 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v10 = sgLogHandle();
  v11 = [v9 robustDecodeObjectOfClass:v5 forKey:@"sid" withCoder:v4 expectNonNull:0 errorDomain:@"SGErrorDomain" errorCode:11 logHandle:v10];

  char v12 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v13 = objc_opt_class();
  v14 = sgLogHandle();
  v15 = [v12 robustDecodeObjectOfClass:v13 forKey:@"tsp" withCoder:v4 expectNonNull:0 errorDomain:@"SGErrorDomain" errorCode:11 logHandle:v14];

  if (v8 && ([v4 error], v16 = objc_claimAutoreleasedReturnValue(), v16, !v16))
  {
    self = [(SGConversationTurn *)self initWithText:v8 senderID:v11 timestamp:v15];
    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (SGConversationTurn)initWithText:(id)a3 senderID:(id)a4 timestamp:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SGConversationTurn.m", 20, @"Invalid parameter not satisfying: %@", @"text" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)SGConversationTurn;
  uint64_t v13 = [(SGConversationTurn *)&v17 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_text, a3);
    objc_storeStrong((id *)&v14->_senderID, a4);
    objc_storeStrong((id *)&v14->_timestamp, a5);
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end