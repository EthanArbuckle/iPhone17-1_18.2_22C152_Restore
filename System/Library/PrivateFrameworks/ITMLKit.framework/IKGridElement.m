@interface IKGridElement
- (BOOL)isPaged;
- (IKGridElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (NSString)rowHeight;
- (unint64_t)columnCount;
- (unint64_t)rowCount;
@end

@implementation IKGridElement

- (IKGridElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IKGridElement;
  v9 = [(IKCollectionElement *)&v12 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  if (v9)
  {
    v10 = [v8 getAttribute:@"paged"];
    v9->_paged = objc_msgSend(v10, "ik_attributeBoolValue");
  }
  return v9;
}

- (unint64_t)columnCount
{
  v2 = [(IKViewElement *)self style];
  uint64_t v3 = [v2 columnCount];

  return v3 & ~(v3 >> 63);
}

- (NSString)rowHeight
{
  v2 = [(IKViewElement *)self style];
  uint64_t v3 = [v2 rowHeight];

  return (NSString *)v3;
}

- (unint64_t)rowCount
{
  return 0;
}

- (BOOL)isPaged
{
  return self->_paged;
}

@end