@interface AXMSpeechOutputAction
- (AXMSpeechOutputAction)initWithText:(id)a3;
- (NSString)text;
@end

@implementation AXMSpeechOutputAction

- (AXMSpeechOutputAction)initWithText:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXMSpeechOutputAction;
  v6 = [(AXMOutputAction *)&v9 _initWithHandle:0];
  v7 = (AXMSpeechOutputAction *)v6;
  if (v6) {
    objc_storeStrong(v6 + 2, a3);
  }

  return v7;
}

- (NSString)text
{
  return self->_text;
}

- (void).cxx_destruct
{
}

@end