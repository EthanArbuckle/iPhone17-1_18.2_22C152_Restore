@interface SGEmailKey
+ (BOOL)isSupportedEntityType:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEmailKey:(id)a3;
- (NSString)description;
- (SGEmailKey)initWithMailMessageKey:(id)a3;
- (id)toMailMessageKey;
@end

@implementation SGEmailKey

- (NSString)description
{
  id v3 = [NSString alloc];
  v4 = [(SGMessageKey *)self source];
  v5 = [(SGEmailKey *)self messageId];
  v6 = (void *)[v3 initWithFormat:@"<SGEmailKey source:%@ messageId:%@>", v4, v5];

  return (NSString *)v6;
}

- (BOOL)isEqualToEmailKey:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SGEmailKey;
  return [(SGMessageKey *)&v4 isEqualToMessageKey:a3];
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = (SGEmailKey *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGEmailKey *)self isEqualToEmailKey:v5];

  return v6;
}

- (id)toMailMessageKey
{
  id v3 = objc_alloc(MEMORY[0x1E4F5DAA0]);
  objc_super v4 = [(SGMessageKey *)self source];
  v5 = [(SGMessageKey *)self uniqueIdentifier];
  BOOL v6 = (void *)[v3 initWithSource:v4 messageId:v5];

  return v6;
}

- (SGEmailKey)initWithMailMessageKey:(id)a3
{
  id v4 = a3;
  v5 = [v4 source];
  BOOL v6 = [v4 messageId];

  v7 = [(SGMessageKey *)self initWithSource:v5 uniqueIdentifier:v6];
  return v7;
}

+ (BOOL)isSupportedEntityType:(int64_t)a3
{
  if ((unint64_t)a3 < 0x1C) {
    return (a3 & 0xFFFFFFF) == 5;
  }
  v7 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"SGEmailKey.m", 67, @"Unknown entity type: %lu", a3);

  return 0;
}

@end