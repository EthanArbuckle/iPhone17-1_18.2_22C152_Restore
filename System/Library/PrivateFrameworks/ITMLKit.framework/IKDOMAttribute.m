@interface IKDOMAttribute
- (BOOL)dispatchEvent:(id)a3;
- (BOOL)hasChildNodes;
- (IKDOMAttribute)initWithAppContext:(id)a3 xmlNode:(_xmlNode *)a4;
- (NSString)name;
- (NSString)value;
- (id)appendChild:(id)a3;
- (id)childNodes;
- (id)cloneNode:(BOOL)a3;
- (id)firstChild;
- (id)getFeature:(id)a3 :(id)a4;
- (id)insertBefore:(id)a3 :(id)a4;
- (id)lastChild;
- (id)nextSibling;
- (id)previousSibling;
- (id)removeChild:(id)a3;
- (id)replaceChild:(id)a3 :(id)a4;
- (int64_t)nodeType;
@end

@implementation IKDOMAttribute

- (IKDOMAttribute)initWithAppContext:(id)a3 xmlNode:(_xmlNode *)a4
{
  if (a4->type == XML_ATTRIBUTE_NODE)
  {
    v6.receiver = self;
    v6.super_class = (Class)IKDOMAttribute;
    self = -[IKDOMNode initWithAppContext:xmlNode:](&v6, sel_initWithAppContext_xmlNode_, a3);
    v4 = self;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSString)name
{
  v2 = [(IKDOMNode *)self nodePtr];
  if (v2)
  {
    if (v2->name)
    {
      objc_msgSend(NSString, "stringWithUTF8String:");
      v2 = (_xmlNode *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = 0;
    }
  }
  return (NSString *)v2;
}

- (NSString)value
{
  v2 = [(IKDOMNode *)self nodePtr];
  if (v2)
  {
    children = v2->children;
    if (children && children->content)
    {
      objc_msgSend(NSString, "stringWithUTF8String:");
      v2 = (_xmlNode *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = 0;
    }
  }
  return (NSString *)v2;
}

- (int64_t)nodeType
{
  return 2;
}

- (id)appendChild:(id)a3
{
  return 0;
}

- (id)cloneNode:(BOOL)a3
{
  return 0;
}

- (id)insertBefore:(id)a3 :(id)a4
{
  return 0;
}

- (id)replaceChild:(id)a3 :(id)a4
{
  return 0;
}

- (id)removeChild:(id)a3
{
  return 0;
}

- (id)getFeature:(id)a3 :(id)a4
{
  return 0;
}

- (BOOL)dispatchEvent:(id)a3
{
  return 0;
}

- (id)nextSibling
{
  return 0;
}

- (id)previousSibling
{
  return 0;
}

- (id)firstChild
{
  return 0;
}

- (id)lastChild
{
  return 0;
}

- (id)childNodes
{
  return 0;
}

- (BOOL)hasChildNodes
{
  return 0;
}

@end