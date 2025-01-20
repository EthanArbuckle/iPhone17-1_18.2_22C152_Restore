@interface FBKXMLNode
- (FBKXMLNode)initWithXMLNodePtr:(_xmlNode *)a3;
- (NSArray)children;
- (NSDictionary)attributes;
- (NSString)content;
- (NSString)name;
- (void)setAttributes:(id)a3;
- (void)setChildren:(id)a3;
- (void)setContent:(id)a3;
- (void)setName:(id)a3;
@end

@implementation FBKXMLNode

- (FBKXMLNode)initWithXMLNodePtr:(_xmlNode *)a3
{
  v22.receiver = self;
  v22.super_class = (Class)FBKXMLNode;
  v4 = [(FBKXMLNode *)&v22 init];
  if (v4)
  {
    if (a3->name)
    {
      uint64_t v5 = [[NSString alloc] initWithCString:a3->name encoding:4];
      name = v4->_name;
      v4->_name = (NSString *)v5;
    }
    if (a3->content)
    {
      uint64_t v7 = [[NSString alloc] initWithCString:a3->content encoding:4];
      content = v4->_content;
      v4->_content = (NSString *)v7;
    }
    children = a3->children;
    for (id i = objc_alloc_init(MEMORY[0x263EFF980]); children; children = children->next)
    {
      v11 = [[FBKXMLNode alloc] initWithXMLNodePtr:children];
      [i addObject:v11];
    }
    uint64_t v12 = [i copy];
    v13 = v4->_children;
    v4->_children = (NSArray *)v12;

    properties = a3->properties;
    id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    while (properties)
    {
      v16 = (void *)[[NSString alloc] initWithCString:properties->name encoding:4];
      if (!properties->children
        || (v17 = [[FBKXMLNode alloc] initWithXMLNodePtr:properties->children]) == 0)
      {
        v17 = [MEMORY[0x263EFF9D0] null];
      }
      v18 = v17;
      [v15 setObject:v17 forKey:v16];

      properties = properties->next;
    }
    uint64_t v19 = [v15 copy];
    attributes = v4->_attributes;
    v4->_attributes = (NSDictionary *)v19;
  }
  return v4;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setName:(id)a3
{
}

- (NSString)content
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContent:(id)a3
{
}

- (NSDictionary)attributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAttributes:(id)a3
{
}

- (NSArray)children
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setChildren:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_content, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end