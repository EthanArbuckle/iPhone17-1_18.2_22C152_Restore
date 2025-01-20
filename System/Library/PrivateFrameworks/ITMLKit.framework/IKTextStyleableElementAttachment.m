@interface IKTextStyleableElementAttachment
- (IKTextElement)textElement;
- (IKTextStyleableElementAttachment)initWithTextElement:(id)a3;
@end

@implementation IKTextStyleableElementAttachment

- (IKTextStyleableElementAttachment)initWithTextElement:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IKTextStyleableElementAttachment;
  v5 = [(IKTextStyleableElementAttachment *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_textElement, v4);
  }

  return v6;
}

- (IKTextElement)textElement
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textElement);
  return (IKTextElement *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end