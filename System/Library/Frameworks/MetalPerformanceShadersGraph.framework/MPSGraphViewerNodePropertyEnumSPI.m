@interface MPSGraphViewerNodePropertyEnumSPI
+ (id)type;
- (BOOL)isEnum;
- (BOOL)isSplat;
- (MPSGraphViewerNodePropertyEnumSPI)initWithJSONDictionary:(id)a3;
- (MPSGraphViewerNodePropertyEnumSPI)initWithName:(id)a3 type:(id)a4 cases:(id)a5 value:(unint64_t)a6;
- (NSArray)enumCases;
- (NSString)enumType;
- (NSString)name;
- (id)dataWithRange:(_NSRange)a3;
- (id)jsonDictionary;
- (id)shape;
- (unint64_t)dataLength;
- (unint64_t)enumValue;
- (unsigned)dataType;
@end

@implementation MPSGraphViewerNodePropertyEnumSPI

+ (id)type
{
  return @"enum";
}

- (MPSGraphViewerNodePropertyEnumSPI)initWithName:(id)a3 type:(id)a4 cases:(id)a5 value:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MPSGraphViewerNodePropertyEnumSPI;
  v14 = [(MPSGraphViewerNodePropertyEnumSPI *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_name, a3);
    objc_storeStrong((id *)&v15->_enumCases, a5);
    objc_storeStrong((id *)&v15->_enumType, a4);
    v15->_enumValue = a6;
  }

  return v15;
}

- (BOOL)isEnum
{
  return 1;
}

- (BOOL)isSplat
{
  return 0;
}

- (id)shape
{
  return &unk_1EC9F1C40;
}

- (unsigned)dataType
{
  return 64;
}

- (unint64_t)dataLength
{
  return 8;
}

- (id)dataWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v5 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&self->_enumValue length:8];
  v6 = objc_msgSend(v5, "subdataWithRange:", location, length);

  return v6;
}

- (MPSGraphViewerNodePropertyEnumSPI)initWithJSONDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MPSGraphViewerNodePropertyEnumSPI;
  v5 = [(MPSGraphViewerNodePropertyEnumSPI *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 objectForKey:@"enumCases"];
    enumCases = v5->_enumCases;
    v5->_enumCases = (NSArray *)v8;

    uint64_t v10 = [v4 objectForKey:@"enumType"];
    enumType = v5->_enumType;
    v5->_enumType = (NSString *)v10;

    id v12 = [v4 objectForKey:@"enumValue"];
    v5->_enumValue = [v12 unsignedIntegerValue];
  }
  return v5;
}

- (id)jsonDictionary
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = +[MPSGraphViewerNodePropertyEnumSPI type];
  [v3 setObject:v4 forKey:@"type"];

  v5 = [(MPSGraphViewerNodePropertyEnumSPI *)self name];
  [v3 setObject:v5 forKey:@"name"];

  if (self->_enumCases)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v7 = self->_enumCases;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "jsonDictionary", (void)v16);
          [v6 addObject:v11];
        }
        uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }

    [v3 setObject:v6 forKey:@"enumCases"];
  }
  enumType = self->_enumType;
  if (enumType) {
    [v3 setObject:enumType forKey:@"enumType"];
  }
  id v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", self->_enumValue, (void)v16);
  [v3 setObject:v13 forKey:@"enumValue"];

  objc_super v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v3];

  return v14;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)enumType
{
  return self->_enumType;
}

- (NSArray)enumCases
{
  return self->_enumCases;
}

- (unint64_t)enumValue
{
  return self->_enumValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enumCases, 0);
  objc_storeStrong((id *)&self->_enumType, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end