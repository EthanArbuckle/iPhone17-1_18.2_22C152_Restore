@interface ANSender
+ (ANSender)senderWithID:(id)a3 type:(unint64_t)a4;
+ (BOOL)supportsSecureCoding;
- (ANSender)initWithCoder:(id)a3;
- (ANSender)initWithID:(id)a3 type:(unint64_t)a4;
- (NSString)identifier;
- (id)description;
- (id)stringForSenderIdentifierType:(unint64_t)a3;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ANSender

- (ANSender)initWithID:(id)a3 type:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ANSender;
  v8 = [(ANSender *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_type = a4;
  }

  return v9;
}

+ (ANSender)senderWithID:(id)a3 type:(unint64_t)a4
{
  id v5 = a3;
  v6 = [[ANSender alloc] initWithID:v5 type:a4];

  return v6;
}

- (id)stringForSenderIdentifierType:(unint64_t)a3
{
  v3 = @"Unknown";
  if (a3 == 2) {
    v3 = @"Rapport";
  }
  if (a3 == 1) {
    return @"IDS";
  }
  else {
    return v3;
  }
}

- (id)description
{
  v3 = NSString;
  v4 = [(ANSender *)self identifier];
  id v5 = [(ANSender *)self stringForSenderIdentifierType:[(ANSender *)self type]];
  v6 = [v3 stringWithFormat:@"ID = %@, Type = %@", v4, v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ANSender *)self identifier];
  [v4 encodeObject:v5 forKey:@"Identifier"];

  objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ANSender type](self, "type"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"IdentifierType"];
}

- (ANSender)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ANSender *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IdentifierType"];
    v5->_type = [v8 unsignedIntegerValue];
  }
  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
}

@end