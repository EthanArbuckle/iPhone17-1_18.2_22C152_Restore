@interface IKDOMCustomEvent
- (IKDOMCustomEvent)initWithAppContext:(id)a3 type:(id)a4 xmlAttribute:(id)a5 canBubble:(BOOL)a6 isCancelable:(BOOL)a7 detail:(id)a8;
- (IKDOMCustomEvent)initWithType:(id)a3 eventInit:(id)a4;
- (IKJSObject)detail;
- (void)setDetail:(id)a3;
@end

@implementation IKDOMCustomEvent

- (IKDOMCustomEvent)initWithType:(id)a3 eventInit:(id)a4
{
  id v6 = a4;
  v7 = NSString;
  id v8 = a3;
  v9 = [v8 lowercaseString];
  v10 = [v7 stringWithFormat:@"on%@", v9];

  if (v6)
  {
    v11 = [v6 objectForKeyedSubscript:@"bubbles"];
    uint64_t v12 = [v11 BOOLValue];

    v13 = [v6 objectForKeyedSubscript:@"cancelable"];
    uint64_t v14 = [v13 BOOLValue];

    v15 = [v6 objectForKeyedSubscript:@"detail"];
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v14 = 0;
    v15 = 0;
  }
  v16 = +[IKAppContext currentAppContext];
  v17 = [(IKDOMCustomEvent *)self initWithAppContext:v16 type:v8 xmlAttribute:v10 canBubble:v12 isCancelable:v14 detail:v15];

  return v17;
}

- (IKDOMCustomEvent)initWithAppContext:(id)a3 type:(id)a4 xmlAttribute:(id)a5 canBubble:(BOOL)a6 isCancelable:(BOOL)a7 detail:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a8;
  v21.receiver = self;
  v21.super_class = (Class)IKDOMCustomEvent;
  v16 = [(IKDOMEvent *)&v21 initWithAppContext:v14 type:a4 xmlAttribute:a5 canBubble:v10 isCancelable:v9];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_detail, a8);
    v18 = [v14 jsContext];
    v19 = [v18 virtualMachine];

    [v19 addManagedReference:v15 withOwner:v17];
  }

  return v17;
}

- (IKJSObject)detail
{
  return self->_detail;
}

- (void)setDetail:(id)a3
{
}

- (void).cxx_destruct
{
}

@end