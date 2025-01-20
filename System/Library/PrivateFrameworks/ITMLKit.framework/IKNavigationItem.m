@interface IKNavigationItem
- (IKAppDocument)document;
- (IKNavigationItem)initWithDocument:(id)a3 presentationOptions:(id)a4;
- (NSDictionary)options;
- (void)setDocument:(id)a3;
- (void)setOptions:(id)a3;
@end

@implementation IKNavigationItem

- (IKNavigationItem)initWithDocument:(id)a3 presentationOptions:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IKNavigationItem;
  v9 = [(IKNavigationItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_document, a3);
    objc_storeStrong((id *)&v10->_options, a4);
  }

  return v10;
}

- (IKAppDocument)document
{
  return self->_document;
}

- (void)setDocument:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_document, 0);
}

@end