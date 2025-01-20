@interface IKDOMHTMLCollection
- (IKDOMHTMLCollection)initWithAppContext:(id)a3 node:(id)a4;
- (IKDOMNode)parentNode;
- (id)item:(unint64_t)a3;
- (unint64_t)length;
- (void)setParentNode:(id)a3;
@end

@implementation IKDOMHTMLCollection

- (IKDOMHTMLCollection)initWithAppContext:(id)a3 node:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)IKDOMHTMLCollection;
  v8 = [(IKJSObject *)&v13 initWithAppContext:v6];
  if (v8)
  {
    v9 = [v6 jsContext];
    v10 = [v9 virtualMachine];
    v11 = [v7 managedSelf];
    [v10 addManagedReference:v11 withOwner:v8];

    objc_storeWeak((id *)&v8->_parentNode, v7);
  }

  return v8;
}

- (unint64_t)length
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentNode);
  unint64_t v3 = [WeakRetained childElementCount];

  return v3;
}

- (id)item:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentNode);
  uint64_t v6 = [WeakRetained nodePtr];

  if (!v6 || (uint64_t v7 = *(void *)(v6 + 24)) == 0)
  {
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
  uint64_t v8 = 0;
  while (*(_DWORD *)(v7 + 8) != 1)
  {
LABEL_7:
    uint64_t v7 = *(void *)(v7 + 48);
    if (!v7) {
      goto LABEL_8;
    }
  }
  if (v8 != a3)
  {
    ++v8;
    goto LABEL_7;
  }
  v11 = [(IKJSObject *)self appContext];
  v9 = +[IKDOMNode nodeWithAppContext:v11 nodePtr:v7];

LABEL_9:
  return v9;
}

- (IKDOMNode)parentNode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentNode);
  return (IKDOMNode *)WeakRetained;
}

- (void)setParentNode:(id)a3
{
}

- (void).cxx_destruct
{
}

@end