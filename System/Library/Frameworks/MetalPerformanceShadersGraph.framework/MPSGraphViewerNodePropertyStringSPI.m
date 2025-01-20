@interface MPSGraphViewerNodePropertyStringSPI
+ (id)type;
- (BOOL)isEnum;
- (BOOL)isSplat;
- (MPSGraphViewerNodePropertyStringSPI)initWithJSONDictionary:(id)a3;
- (MPSGraphViewerNodePropertyStringSPI)initWithName:(id)a3 value:(id)a4;
- (NSString)name;
- (NSString)stringValue;
- (id)dataWithRange:(_NSRange)a3;
- (id)enumCases;
- (id)jsonDictionary;
- (id)shape;
- (unint64_t)dataLength;
- (unsigned)dataType;
@end

@implementation MPSGraphViewerNodePropertyStringSPI

+ (id)type
{
  return @"string";
}

- (MPSGraphViewerNodePropertyStringSPI)initWithName:(id)a3 value:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MPSGraphViewerNodePropertyStringSPI;
  v9 = [(MPSGraphViewerNodePropertyStringSPI *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_stringValue, a4);
    uint64_t v11 = [(NSString *)v10->_stringValue dataUsingEncoding:4];
    stringUTF8Data = v10->_stringUTF8Data;
    v10->_stringUTF8Data = (NSData *)v11;
  }
  return v10;
}

- (BOOL)isSplat
{
  return 0;
}

- (BOOL)isEnum
{
  return 0;
}

- (id)enumCases
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)shape
{
  v6[1] = *MEMORY[0x1E4F143B8];
  stringUTF8Data = self->_stringUTF8Data;
  if (stringUTF8Data)
  {
    v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSData length](stringUTF8Data, "length"));
    v6[0] = v3;
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

- (unsigned)dataType
{
  return 8;
}

- (unint64_t)dataLength
{
  unint64_t result = (unint64_t)self->_stringUTF8Data;
  if (result) {
    return [(id)result length];
  }
  return result;
}

- (id)dataWithRange:(_NSRange)a3
{
  stringUTF8Data = self->_stringUTF8Data;
  if (stringUTF8Data)
  {
    stringUTF8Data = objc_msgSend(stringUTF8Data, "subdataWithRange:", a3.location, a3.length);
  }

  return stringUTF8Data;
}

- (MPSGraphViewerNodePropertyStringSPI)initWithJSONDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MPSGraphViewerNodePropertyStringSPI;
  v5 = [(MPSGraphViewerNodePropertyStringSPI *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 objectForKey:@"value"];
    stringValue = v5->_stringValue;
    v5->_stringValue = (NSString *)v8;

    uint64_t v10 = [(NSString *)v5->_stringValue dataUsingEncoding:4];
    stringUTF8Data = v5->_stringUTF8Data;
    v5->_stringUTF8Data = (NSData *)v10;
  }
  return v5;
}

- (id)jsonDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = +[MPSGraphViewerNodePropertyStringSPI type];
  [v3 setObject:v4 forKey:@"type"];

  v5 = [(MPSGraphViewerNodePropertyStringSPI *)self name];
  [v3 setObject:v5 forKey:@"name"];

  stringValue = self->_stringValue;
  if (stringValue) {
    [v3 setObject:stringValue forKey:@"value"];
  }
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v3];

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_stringUTF8Data, 0);
}

@end