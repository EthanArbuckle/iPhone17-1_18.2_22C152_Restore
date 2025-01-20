@interface IMMockItemInfo
+ (BOOL)supportsSecureCoding;
+ (id)decodedMockItemInfoArray:(id)a3;
+ (id)defaultMockInfoArray;
+ (id)encodedMockItemInfoArray:(id)a3;
- (BOOL)outgoing;
- (IMMockItemInfo)initWithCoder:(id)a3;
- (IMMockItemInfo)initWithMockItemType:(int64_t)a3 outgoing:(BOOL)a4;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IMMockItemInfo

+ (id)defaultMockInfoArray
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:50];
  for (int i = 0; i != 50; ++i)
  {
    v4 = [[IMMockItemInfo alloc] initWithMockItemType:0 outgoing:(i & 1) == 0];
    [v2 addObject:v4];
  }

  return v2;
}

+ (id)encodedMockItemInfoArray:(id)a3
{
  v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
  v4 = [v3 base64EncodedStringWithOptions:32];

  return v4;
}

+ (id)decodedMockItemInfoArray:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x1E4F1C9B8];
    id v4 = a3;
    v5 = (void *)[[v3 alloc] initWithBase64EncodedString:v4 options:1];

    if (v5)
    {
      v6 = (void *)MEMORY[0x1E4F28DC0];
      v7 = (void *)MEMORY[0x1E4F1CAD0];
      v13[0] = objc_opt_class();
      v13[1] = objc_opt_class();
      v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
      v9 = [v7 setWithArray:v8];
      v10 = [v6 unarchivedObjectOfClasses:v9 fromData:v5 error:0];

      objc_opt_class();
      id v11 = 0;
      if (objc_opt_isKindOfClass()) {
        id v11 = v10;
      }
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IMMockItemInfo)initWithMockItemType:(int64_t)a3 outgoing:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)IMMockItemInfo;
  result = [(IMMockItemInfo *)&v7 init];
  if (result)
  {
    result->_type = a3;
    result->_outgoing = a4;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[IMMockItemInfo type](self, "type"), @"type");
  objc_msgSend(v4, "encodeBool:forKey:", -[IMMockItemInfo outgoing](self, "outgoing"), @"outgoing");
}

- (IMMockItemInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"type"];
  uint64_t v6 = [v4 decodeBoolForKey:@"outgoing"];

  return [(IMMockItemInfo *)self initWithMockItemType:v5 outgoing:v6];
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)outgoing
{
  return self->_outgoing;
}

@end