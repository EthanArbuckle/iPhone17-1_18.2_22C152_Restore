@interface MMDocument
+ (id)documentWithMarkdown:(id)a3;
- (MMDocument)initWithMarkdown:(id)a3;
- (NSArray)elements;
- (NSString)markdown;
- (void)addElement:(id)a3;
- (void)setElements:(id)a3;
@end

@implementation MMDocument

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_markdown, 0);
  objc_storeStrong((id *)&self->_elements, 0);
}

- (void)setElements:(id)a3
{
}

- (NSArray)elements
{
  return &self->_elements->super;
}

- (NSString)markdown
{
  return self->_markdown;
}

- (void)addElement:(id)a3
{
  id v4 = a3;
  [(MMDocument *)self willChangeValueForKey:@"elements"];
  [(NSMutableArray *)self->_elements addObject:v4];

  [(MMDocument *)self didChangeValueForKey:@"elements"];
}

- (MMDocument)initWithMarkdown:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MMDocument;
  v6 = [(MMDocument *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_markdown, a3);
    uint64_t v8 = objc_opt_new();
    elements = v7->_elements;
    v7->_elements = (NSMutableArray *)v8;
  }
  return v7;
}

+ (id)documentWithMarkdown:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithMarkdown:v3];

  return v4;
}

@end