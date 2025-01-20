@interface MPSGraphViewerNodePortSPI
- (MPSGraphViewerNodePortSPI)initWithJSONDictionary:(id)a3;
- (MPSGraphViewerNodePortSPI)initWithName:(id)a3 dataType:(unsigned int)a4 shape:(id)a5 valueRef:(unint64_t)a6;
- (NSArray)shape;
- (NSString)name;
- (id)jsonDictionary;
- (unint64_t)valueRef;
- (unsigned)dataType;
@end

@implementation MPSGraphViewerNodePortSPI

- (MPSGraphViewerNodePortSPI)initWithName:(id)a3 dataType:(unsigned int)a4 shape:(id)a5 valueRef:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MPSGraphViewerNodePortSPI;
  v13 = [(MPSGraphViewerNodePortSPI *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_name, a3);
    v14->_dataType = a4;
    objc_storeStrong((id *)&v14->_shape, a5);
    v14->_valueRef = a6;
  }

  return v14;
}

- (MPSGraphViewerNodePortSPI)initWithJSONDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MPSGraphViewerNodePortSPI;
  v5 = [(MPSGraphViewerNodePortSPI *)&v13 init];
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

    id v11 = [v4 objectForKey:@"valueRef"];
    v5->_valueRef = [v11 unsignedIntValue];
  }
  return v5;
}

- (id)jsonDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(MPSGraphViewerNodePortSPI *)self name];

  if (v4)
  {
    v5 = [(MPSGraphViewerNodePortSPI *)self name];
    [v3 setObject:v5 forKey:@"name"];
  }
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MPSGraphViewerNodePortSPI dataType](self, "dataType"));
  [v3 setObject:v6 forKey:@"dataType"];

  v7 = [(MPSGraphViewerNodePortSPI *)self shape];

  if (v7)
  {
    v8 = [(MPSGraphViewerNodePortSPI *)self shape];
    [v3 setObject:v8 forKey:@"shape"];
  }
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MPSGraphViewerNodePortSPI valueRef](self, "valueRef"));
  [v3 setObject:v9 forKey:@"valueRef"];

  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v3];

  return v10;
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

- (unint64_t)valueRef
{
  return self->_valueRef;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shape, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end