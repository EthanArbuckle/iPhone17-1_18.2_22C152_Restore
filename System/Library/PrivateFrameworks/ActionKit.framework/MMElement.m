@interface MMElement
- (MMElement)init;
- (MMElement)parent;
- (NSArray)children;
- (NSArray)innerRanges;
- (NSString)href;
- (NSString)identifier;
- (NSString)language;
- (NSString)stringValue;
- (NSString)title;
- (_NSRange)range;
- (id)description;
- (id)removeLastChild;
- (int)type;
- (int64_t)alignment;
- (unint64_t)level;
- (void)addChild:(id)a3;
- (void)addInnerRange:(_NSRange)a3;
- (void)dealloc;
- (void)removeChild:(id)a3;
- (void)removeLastInnerRange;
- (void)setAlignment:(int64_t)a3;
- (void)setChildren:(id)a3;
- (void)setHref:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInnerRanges:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setLevel:(unint64_t)a3;
- (void)setParent:(id)a3;
- (void)setRange:(_NSRange)a3;
- (void)setStringValue:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(int)a3;
@end

@implementation MMElement

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_href, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_innerRanges, 0);
}

- (void)setLanguage:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

- (NSArray)children
{
  return &self->_children->super;
}

- (void)setParent:(id)a3
{
}

- (MMElement)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  return (MMElement *)WeakRetained;
}

- (void)setStringValue:(id)a3
{
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setHref:(id)a3
{
}

- (NSString)href
{
  return self->_href;
}

- (void)setLevel:(unint64_t)a3
{
  self->_level = a3;
}

- (unint64_t)level
{
  return self->_level;
}

- (void)setAlignment:(int64_t)a3
{
  self->_alignment = a3;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (NSArray)innerRanges
{
  return &self->_innerRanges->super;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (int)type
{
  return self->_type;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setChildren:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v5 = self->_children;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * v9++) setParent:0];
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  v10 = (NSMutableArray *)[v4 mutableCopy];
  children = self->_children;
  self->_children = v10;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v12 = self->_children;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v16++), "setParent:", self, (void)v17);
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (void)setInnerRanges:(id)a3
{
  id v4 = (NSMutableArray *)[a3 mutableCopy];
  innerRanges = self->_innerRanges;
  self->_innerRanges = v4;
}

- (id)removeLastChild
{
  v3 = [(MMElement *)self children];
  id v4 = [v3 lastObject];

  [(NSMutableArray *)self->_children removeLastObject];
  return v4;
}

- (void)removeChild:(id)a3
{
  id v4 = a3;
  [(MMElement *)self willChangeValueForKey:@"children"];
  [(NSMutableArray *)self->_children removeObjectIdenticalTo:v4];
  [v4 setParent:0];

  [(MMElement *)self didChangeValueForKey:@"children"];
}

- (void)addChild:(id)a3
{
  id v4 = a3;
  [(MMElement *)self willChangeValueForKey:@"children"];
  [(NSMutableArray *)self->_children addObject:v4];
  [v4 setParent:self];

  [(MMElement *)self didChangeValueForKey:@"children"];
}

- (void)removeLastInnerRange
{
  [(MMElement *)self willChangeValueForKey:@"innerRanges"];
  [(NSMutableArray *)self->_innerRanges removeLastObject];
  [(MMElement *)self didChangeValueForKey:@"innerRanges"];
}

- (void)addInnerRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  [(MMElement *)self willChangeValueForKey:@"innerRanges"];
  innerRanges = self->_innerRanges;
  uint64_t v7 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", location, length);
  [(NSMutableArray *)innerRanges addObject:v7];

  [(MMElement *)self didChangeValueForKey:@"innerRanges"];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unsigned int v6 = [(MMElement *)self type];
  if (v6 > 0x13) {
    uint64_t v7 = @"unknown";
  }
  else {
    uint64_t v7 = off_264E5D4C0[v6];
  }
  v12.NSUInteger location = [(MMElement *)self range];
  uint64_t v8 = NSStringFromRange(v12);
  uint64_t v9 = [v3 stringWithFormat:@"<%@: %p type=%@; range=%@>", v5, self, v7, v8];;

  return v9;
}

- (void)dealloc
{
  v3 = [(MMElement *)self children];
  [v3 makeObjectsPerformSelector:sel_setParent_ withObject:0];

  v4.receiver = self;
  v4.super_class = (Class)MMElement;
  [(MMElement *)&v4 dealloc];
}

- (MMElement)init
{
  v8.receiver = self;
  v8.super_class = (Class)MMElement;
  v2 = [(MMElement *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    innerRanges = v2->_innerRanges;
    v2->_innerRanges = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    children = v2->_children;
    v2->_children = (NSMutableArray *)v5;
  }
  return v2;
}

@end