@interface LPHTMLComponent
+ (id)ruleDictionaryForStyle:(id)a3;
- (DOMElement)element;
- (LPHTMLComponent)initWithTagName:(id)a3 themePath:(id)a4 generator:(id)a5;
- (LPLinkHTMLGenerator)generator;
- (NSString)themePath;
- (id)childThemePathWithName:(id)a3;
- (void)addChild:(id)a3;
@end

@implementation LPHTMLComponent

- (LPHTMLComponent)initWithTagName:(id)a3 themePath:(id)a4 generator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)LPHTMLComponent;
  v11 = [(LPHTMLComponent *)&v17 init];
  if (v11)
  {
    WebThreadLock();
    v12 = [v10 parentDocument];
    uint64_t v13 = [v12 createElement:v8];
    element = v11->_element;
    v11->_element = (DOMElement *)v13;

    objc_storeStrong((id *)&v11->_themePath, a4);
    objc_storeWeak((id *)&v11->_generator, v10);
    v15 = v11;
  }

  return v11;
}

- (void)addChild:(id)a3
{
  id v7 = a3;
  WebThreadLock();
  [(NSMutableArray *)self->_children addObject:v7];
  element = self->_element;
  v5 = [v7 element];
  id v6 = (id)[(DOMElement *)element appendChild:v5];
}

- (id)childThemePathWithName:(id)a3
{
  v3 = [(NSString *)self->_themePath stringByAppendingFormat:@"-%@", a3];

  return v3;
}

+ (id)ruleDictionaryForStyle:(id)a3
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (LPLinkHTMLGenerator)generator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_generator);

  return (LPLinkHTMLGenerator *)WeakRetained;
}

- (DOMElement)element
{
  return self->_element;
}

- (NSString)themePath
{
  return self->_themePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_themePath, 0);
  objc_storeStrong((id *)&self->_element, 0);
  objc_destroyWeak((id *)&self->_generator);

  objc_storeStrong((id *)&self->_children, 0);
}

@end