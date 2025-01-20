@interface MPSGraphViewerNodePropertyEnumCaseSPI
- (MPSGraphViewerNodePropertyEnumCaseSPI)initWithJSONDictionary:(id)a3;
- (MPSGraphViewerNodePropertyEnumCaseSPI)initWithName:(id)a3 value:(unint64_t)a4;
- (NSString)name;
- (id)jsonDictionary;
- (unint64_t)value;
@end

@implementation MPSGraphViewerNodePropertyEnumCaseSPI

- (MPSGraphViewerNodePropertyEnumCaseSPI)initWithName:(id)a3 value:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPSGraphViewerNodePropertyEnumCaseSPI;
  v8 = [(MPSGraphViewerNodePropertyEnumCaseSPI *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_name, a3);
    v9->_value = a4;
  }

  return v9;
}

- (MPSGraphViewerNodePropertyEnumCaseSPI)initWithJSONDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MPSGraphViewerNodePropertyEnumCaseSPI;
  v5 = [(MPSGraphViewerNodePropertyEnumCaseSPI *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = [v4 objectForKey:@"value"];
    v5->_value = [v8 unsignedIntValue];
  }
  return v5;
}

- (id)jsonDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(MPSGraphViewerNodePropertyEnumCaseSPI *)self name];

  if (v4)
  {
    v5 = [(MPSGraphViewerNodePropertyEnumCaseSPI *)self name];
    [v3 setObject:v5 forKey:@"name"];
  }
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MPSGraphViewerNodePropertyEnumCaseSPI value](self, "value"));
  [v3 setObject:v6 forKey:@"value"];

  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v3];

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)value
{
  return self->_value;
}

- (void).cxx_destruct
{
}

@end