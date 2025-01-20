@interface MPSGraphViewerNodePropertyDataSPI
+ (id)type;
- (BOOL)isEnum;
- (BOOL)isSplat;
- (MPSGraphViewerNodePropertyDataSPI)initWithJSONDictionary:(id)a3;
- (MPSGraphViewerNodePropertyDataSPI)initWithName:(id)a3 dataType:(unsigned int)a4 shape:(id)a5;
- (NSArray)shape;
- (NSString)name;
- (id)dataWithRange:(_NSRange)a3;
- (id)enumCases;
- (id)jsonDictionary;
- (unint64_t)dataLength;
- (unsigned)dataType;
- (void)setSplatValue:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation MPSGraphViewerNodePropertyDataSPI

+ (id)type
{
  return @"data";
}

- (MPSGraphViewerNodePropertyDataSPI)initWithName:(id)a3 dataType:(unsigned int)a4 shape:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MPSGraphViewerNodePropertyDataSPI;
  v11 = [(MPSGraphViewerNodePropertyDataSPI *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_name, a3);
    v12->_dataType = a4;
    objc_storeStrong((id *)&v12->_shape, a5);
    v12->_isSplat = 0;
  }

  return v12;
}

- (MPSGraphViewerNodePropertyDataSPI)initWithJSONDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MPSGraphViewerNodePropertyDataSPI;
  v5 = [(MPSGraphViewerNodePropertyDataSPI *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = [v4 objectForKey:@"dataType"];
    v5->_dataType = [v8 unsignedIntValue];

    uint64_t v9 = [v4 objectForKey:@"shape"];
    shape = v5->_shape;
    v5->_shape = (NSArray *)v9;

    v11 = [v4 objectForKey:@"isSplat"];
    v5->_isSplat = [v11 BOOLValue];
  }
  return v5;
}

- (id)jsonDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = +[MPSGraphViewerNodePropertyDataSPI type];
  [v3 setObject:v4 forKey:@"type"];

  v5 = [(MPSGraphViewerNodePropertyDataSPI *)self name];
  [v3 setObject:v5 forKey:@"name"];

  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MPSGraphViewerNodePropertyDataSPI dataType](self, "dataType"));
  [v3 setObject:v6 forKey:@"dataType"];

  v7 = [(MPSGraphViewerNodePropertyDataSPI *)self shape];
  [v3 setObject:v7 forKey:@"shape"];

  v8 = [NSNumber numberWithBool:self->_isSplat];
  [v3 setObject:v8 forKey:@"isSplat"];

  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v3];

  return v9;
}

- (BOOL)isSplat
{
  return self->_isSplat;
}

- (void)setSplatValue:(id)a3
{
  self->_isSplat = 1;
  objc_storeStrong((id *)&self->_raw, a3);
}

- (void)setValue:(id)a3
{
  self->_isSplat = 0;
  objc_storeStrong((id *)&self->_raw, a3);
}

- (unint64_t)dataLength
{
  return [(NSData *)self->_raw length];
}

- (id)dataWithRange:(_NSRange)a3
{
  return -[NSData subdataWithRange:](self->_raw, "subdataWithRange:", a3.location, a3.length);
}

- (BOOL)isEnum
{
  return 0;
}

- (id)enumCases
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (NSString)name
{
  return self->_name;
}

- (unsigned)dataType
{
  return self->_dataType;
}

- (NSArray)shape
{
  return self->_shape;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shape, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_raw, 0);
}

@end