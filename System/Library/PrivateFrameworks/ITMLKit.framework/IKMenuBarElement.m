@interface IKMenuBarElement
+ (id)supportedFeatures;
- (IKAppMenuBarDocument)menuBarDocument;
- (IKMenuBarElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
@end

@implementation IKMenuBarElement

+ (id)supportedFeatures
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"MenuBarDocument";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (IKMenuBarElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)IKMenuBarElement;
  v5 = [(IKCollectionElement *)&v11 initWithDOMElement:a3 parent:a4 elementFactory:a5];
  v6 = v5;
  if (v5)
  {
    v7 = [(IKViewElement *)v5 features];
    uint64_t v8 = [v7 firstObject];
    menuBarDocument = v6->_menuBarDocument;
    v6->_menuBarDocument = (IKAppMenuBarDocument *)v8;
  }
  return v6;
}

- (IKAppMenuBarDocument)menuBarDocument
{
  return self->_menuBarDocument;
}

- (void).cxx_destruct
{
}

@end