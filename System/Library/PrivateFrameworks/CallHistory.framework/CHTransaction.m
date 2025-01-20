@interface CHTransaction
+ (BOOL)supportsSecureCoding;
+ (id)toString:(unint64_t)a3;
+ (id)unarchivedObjectClasses;
+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTransaction:(id)a3;
- (CHTransaction)init;
- (CHTransaction)initWithCoder:(id)a3;
- (CHTransaction)initWithString:(id)a3 andRecord:(id)a4;
- (CHTransaction)initWithType:(unint64_t)a3 andRecord:(id)a4;
- (NSData)record;
- (id)archivedDataWithError:(id *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)transactionType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHTransaction

- (id)archivedDataWithError:(id *)a3
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:a3];
}

+ (id)unarchivedObjectClasses
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
}

+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4
{
  v6 = (void *)MEMORY[0x1E4F28DC0];
  id v7 = a3;
  v8 = [a1 unarchivedObjectClasses];
  v9 = [v6 unarchivedObjectOfClasses:v8 fromData:v7 error:a4];

  return v9;
}

- (CHTransaction)init
{
  return 0;
}

- (CHTransaction)initWithType:(unint64_t)a3 andRecord:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CHTransaction;
  v8 = [(CHTransaction *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_transactionType = a3;
    objc_storeStrong((id *)&v8->_record, a4);
  }

  return v9;
}

- (CHTransaction)initWithString:(id)a3 andRecord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"Insert"])
  {
    uint64_t v8 = 0;
LABEL_9:
    self = [(CHTransaction *)self initWithType:v8 andRecord:v7];
    goto LABEL_10;
  }
  if ([v6 isEqualToString:@"Update"])
  {
    uint64_t v8 = 1;
    goto LABEL_9;
  }
  if ([v6 isEqualToString:@"Delete"])
  {
    uint64_t v8 = 2;
    goto LABEL_9;
  }
  if ([v6 isEqualToString:@"BatchDeleteAll"])
  {
    uint64_t v8 = 3;
    goto LABEL_9;
  }
LABEL_10:

  return self;
}

+ (id)toString:(unint64_t)a3
{
  if (a3 > 3) {
    return 0;
  }
  else {
    return off_1E61C7C68[a3];
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[CHTransaction transactionType](self, "transactionType"), @"type");
  id v5 = [(CHTransaction *)self record];
  [v4 encodeObject:v5 forKey:@"record"];
}

- (CHTransaction)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHTransaction;
  id v5 = [(CHTransaction *)&v9 init];
  if (v5)
  {
    v5->_transactionType = [v4 decodeIntegerForKey:@"type"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"record"];
    record = v5->_record;
    v5->_record = (NSData *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@ %p ", objc_opt_class(), self];
  id v4 = NSStringFromSelector(sel_transactionType);
  id v5 = objc_msgSend(NSString, "ch_stringWithCHTransactionType:", -[CHTransaction transactionType](self, "transactionType"));
  [v3 appendFormat:@"%@=%@", v4, v5];

  [v3 appendFormat:@">"];
  uint64_t v6 = (void *)[v3 copy];

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(CHTransaction *)self transactionType];
  id v4 = [(CHTransaction *)self record];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CHTransaction *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(CHTransaction *)self isEqualToTransaction:v4];
  }

  return v5;
}

- (BOOL)isEqualToTransaction:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CHTransaction *)self transactionType];
  if (v5 == [v4 transactionType])
  {
    uint64_t v6 = [(CHTransaction *)self record];
    uint64_t v7 = [v4 record];
    char v8 = (v6 | v7) == 0;
    if (v7) {
      char v8 = [(id)v6 isEqual:v7];
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)transactionType
{
  return self->_transactionType;
}

- (NSData)record
{
  return self->_record;
}

- (void).cxx_destruct
{
}

@end