@interface IKJSLegacyPlayer
- (IKDOMElement)currentAVMediaElement;
- (IKJSPlayerAppBridge)appBridge;
- (id)asPrivateIKJSLegacyPlayer;
- (void)setAppBridge:(id)a3;
@end

@implementation IKJSLegacyPlayer

- (id)asPrivateIKJSLegacyPlayer
{
  if ([(IKJSLegacyPlayer *)self conformsToProtocol:&unk_1F3E50538]) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return v3;
}

- (IKDOMElement)currentAVMediaElement
{
  v3 = [(IKJSLegacyPlayer *)self appBridge];
  v4 = [v3 currentAVMediaElementForPlayer:self];

  return (IKDOMElement *)v4;
}

- (IKJSPlayerAppBridge)appBridge
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appBridge);
  return (IKJSPlayerAppBridge *)WeakRetained;
}

- (void)setAppBridge:(id)a3
{
}

- (void).cxx_destruct
{
}

@end