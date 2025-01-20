@interface IDSDictionaryInvitationContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (IDSDictionaryInvitationContext)initWithCoder:(id)a3;
- (IDSDictionaryInvitationContext)initWithDictionary:(id)a3 schema:(id)a4;
- (IDSDictionaryInvitationContext)initWithPayload:(id)a3;
- (NSDictionary)dictionary;
- (NSString)description;
- (NSString)schemaIdentifier;
- (id)payload;
- (int64_t)contextType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IDSDictionaryInvitationContext

- (IDSDictionaryInvitationContext)initWithDictionary:(id)a3 schema:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSDictionaryInvitationContext;
  v9 = [(IDSDictionaryInvitationContext *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_schemaIdentifier, a4);
    v10->_contextType = 1;
    objc_storeStrong((id *)&v10->_dictionary, a3);
  }

  return v10;
}

- (IDSDictionaryInvitationContext)initWithPayload:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IDSDictionaryInvitationContext;
  v5 = [(IDSDictionaryInvitationContext *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:*MEMORY[0x1E4F6AC90]];
    schemaIdentifier = v5->_schemaIdentifier;
    v5->_schemaIdentifier = (NSString *)v6;

    id v8 = [v4 objectForKey:*MEMORY[0x1E4F6AC98]];
    v5->_contextType = (int)[v8 intValue];

    uint64_t v9 = [v4 objectForKey:*MEMORY[0x1E4F6AC80]];
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v9;
  }
  return v5;
}

- (id)payload
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_schemaIdentifier forKey:*MEMORY[0x1E4F6AC90]];
  id v4 = [NSNumber numberWithInteger:self->_contextType];
  [v3 setObject:v4 forKey:*MEMORY[0x1E4F6AC98]];

  [v3 setObject:self->_dictionary forKey:*MEMORY[0x1E4F6AC80]];
  v5 = (void *)[v3 copy];

  return v5;
}

- (NSString)description
{
  id v3 = NSString;
  id v4 = [(IDSDictionaryInvitationContext *)self schemaIdentifier];
  int64_t v5 = [(IDSDictionaryInvitationContext *)self contextType];
  uint64_t v6 = [(IDSDictionaryInvitationContext *)self payload];
  id v7 = [v3 stringWithFormat:@"<IDSDictionaryInvitationContext %p>: schemaIdentifier %@ contextType %ld payload %@", self, v4, v5, v6];

  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int64_t v6 = [(IDSDictionaryInvitationContext *)self contextType];
    if (v6 == [v5 contextType]
      && ([(IDSDictionaryInvitationContext *)self schemaIdentifier],
          id v7 = objc_claimAutoreleasedReturnValue(),
          [v5 schemaIdentifier],
          id v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = [v7 isEqual:v8],
          v8,
          v7,
          v9))
    {
      v10 = [(IDSDictionaryInvitationContext *)self dictionary];
      v11 = [v5 dictionary];
      char v12 = [v10 isEqual:v11];
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSDictionaryInvitationContext *)self payload];
  [v4 encodeObject:v5 forKey:@"contextPayload"];
}

- (IDSDictionaryInvitationContext)initWithCoder:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  id v22 = [v3 alloc];
  uint64_t v21 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  v14 = objc_msgSend(v22, "initWithObjects:", v21, v20, v19, v18, v5, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
  v15 = [v4 decodeObjectOfClasses:v14 forKey:@"contextPayload"];

  v16 = [(IDSDictionaryInvitationContext *)self initWithPayload:v15];
  return v16;
}

- (NSString)schemaIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)contextType
{
  return self->_contextType;
}

- (NSDictionary)dictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);

  objc_storeStrong((id *)&self->_schemaIdentifier, 0);
}

@end