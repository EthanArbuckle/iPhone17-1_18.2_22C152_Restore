@interface IKTextFieldElement
+ (id)supportedFeatures;
- (IKAppKeyboard)keyboard;
- (IKTextFieldElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
@end

@implementation IKTextFieldElement

+ (id)supportedFeatures
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"Keyboard";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (IKTextFieldElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)IKTextFieldElement;
  v5 = [(IKTextElement *)&v11 initWithDOMElement:a3 parent:a4 elementFactory:a5];
  v6 = v5;
  if (v5)
  {
    v7 = [(IKViewElement *)v5 features];
    uint64_t v8 = [v7 firstObject];
    keyboard = v6->_keyboard;
    v6->_keyboard = (IKAppKeyboard *)v8;
  }
  return v6;
}

- (IKAppKeyboard)keyboard
{
  return self->_keyboard;
}

- (void).cxx_destruct
{
}

@end