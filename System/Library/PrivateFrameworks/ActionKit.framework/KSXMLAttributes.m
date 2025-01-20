@interface KSXMLAttributes
- (BOOL)hasAttributes;
- (KSXMLAttributes)init;
- (KSXMLAttributes)initWithXMLAttributes:(id)a3;
- (NSDictionary)attributesAsDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)addAttribute:(id)a3 value:(id)a4;
- (void)close;
- (void)setAttributesAsDictionary:(id)a3;
- (void)writeAttributes:(id)a3;
@end

@implementation KSXMLAttributes

- (void)writeAttributes:(id)a3
{
  id v7 = a3;
  if ([(NSMutableArray *)self->_attributes count])
  {
    unint64_t v4 = 0;
    do
    {
      v5 = [(NSMutableArray *)self->_attributes objectAtIndex:v4];
      v6 = [(NSMutableArray *)self->_attributes objectAtIndex:v4 + 1];
      [v7 writeAttribute:v5 value:v6];

      v4 += 2;
    }
    while (v4 < [(NSMutableArray *)self->_attributes count]);
  }
}

- (void).cxx_destruct
{
}

- (id)description
{
  v3 = (void *)MEMORY[0x263F089D8];
  v9.receiver = self;
  v9.super_class = (Class)KSXMLAttributes;
  unint64_t v4 = [(KSXMLAttributes *)&v9 description];
  v5 = [v3 stringWithString:v4];

  v6 = [[KSXMLWriter alloc] initWithOutputWriter:v5];
  [(KSXMLWriter *)v6 writeString:@" "];
  id v7 = [(KSXMLAttributes *)self attributesAsDictionary];
  [(KSXMLWriter *)v6 startElement:&stru_26F008428 attributes:v7];

  [(KSXMLWriter *)v6 endElement];
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  return (id)[v4 initWithXMLAttributes:self];
}

- (void)close
{
}

- (void)addAttribute:(id)a3 value:(id)a4
{
  id v9 = a3;
  id v7 = a4;
  if (!v7)
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"KSXMLAttributes.m", 66, @"Invalid parameter not satisfying: %@", @"value" object file lineNumber description];
  }
  [(NSMutableArray *)self->_attributes addObject:v9];
  [(NSMutableArray *)self->_attributes addObject:v7];
}

- (BOOL)hasAttributes
{
  return [(NSMutableArray *)self->_attributes count] != 0;
}

- (void)setAttributesAsDictionary:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        v10 = [v4 objectForKey:v9];
        [(KSXMLAttributes *)self addAttribute:v9 value:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (NSDictionary)attributesAsDictionary
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ([(NSMutableArray *)self->_attributes count])
  {
    unint64_t v4 = 0;
    do
    {
      uint64_t v5 = [(NSMutableArray *)self->_attributes objectAtIndex:v4];
      uint64_t v6 = [(NSMutableArray *)self->_attributes objectAtIndex:v4 + 1];
      [v3 setObject:v6 forKey:v5];

      v4 += 2;
    }
    while (v4 < [(NSMutableArray *)self->_attributes count]);
  }
  return (NSDictionary *)v3;
}

- (KSXMLAttributes)initWithXMLAttributes:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)KSXMLAttributes;
  v3 = a3;
  unint64_t v4 = [(KSXMLAttributes *)&v9 init];
  uint64_t v5 = (void *)v3[1];

  uint64_t v6 = objc_msgSend(v5, "mutableCopy", v9.receiver, v9.super_class);
  attributes = v4->_attributes;
  v4->_attributes = (NSMutableArray *)v6;

  return v4;
}

- (KSXMLAttributes)init
{
  v6.receiver = self;
  v6.super_class = (Class)KSXMLAttributes;
  v2 = [(KSXMLAttributes *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:2];
    attributes = v2->_attributes;
    v2->_attributes = (NSMutableArray *)v3;
  }
  return v2;
}

@end