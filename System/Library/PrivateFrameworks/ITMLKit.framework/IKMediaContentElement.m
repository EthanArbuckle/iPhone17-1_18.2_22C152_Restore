@interface IKMediaContentElement
+ (id)supportedFeatures;
- (IKAppPlayerBridge)playerBridge;
- (IKMediaContentElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
@end

@implementation IKMediaContentElement

+ (id)supportedFeatures
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"Player";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (IKMediaContentElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)IKMediaContentElement;
  v5 = [(IKViewElement *)&v11 initWithDOMElement:a3 parent:a4 elementFactory:a5];
  v6 = v5;
  if (v5)
  {
    v7 = [(IKViewElement *)v5 features];
    uint64_t v8 = [v7 firstObject];
    playerBridge = v6->_playerBridge;
    v6->_playerBridge = (IKAppPlayerBridge *)v8;
  }
  return v6;
}

- (IKAppPlayerBridge)playerBridge
{
  return self->_playerBridge;
}

- (void).cxx_destruct
{
}

@end