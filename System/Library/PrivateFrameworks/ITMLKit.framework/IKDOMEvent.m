@interface IKDOMEvent
- (BOOL)bubbles;
- (BOOL)cancelable;
- (BOOL)defaultPrevented;
- (BOOL)isImmediatePropagationStopped;
- (BOOL)isInUse;
- (BOOL)isPropagationStopped;
- (IKDOMEvent)initWithAppContext:(id)a3 type:(id)a4 xmlAttribute:(id)a5 canBubble:(BOOL)a6 isCancelable:(BOOL)a7;
- (IKDOMEvent)initWithType:(id)a3 eventInit:(id)a4;
- (IKDOMNode)currentTarget;
- (IKDOMNode)target;
- (NSDate)timeStamp;
- (NSString)type;
- (NSString)xmlAttribute;
- (int64_t)dispatchState;
- (int64_t)eventPhase;
- (void)preventDefault;
- (void)setCurrentTarget:(id)a3;
- (void)setDefaultPrevented:(BOOL)a3;
- (void)setDispatchState:(int64_t)a3;
- (void)setEventPhase:(int64_t)a3;
- (void)setInUse:(BOOL)a3;
- (void)setTarget:(id)a3;
- (void)stopImmediatePropagation;
- (void)stopPropagation;
- (void)updateDispatchStateWithCurrentTarget:(id)a3 phase:(int64_t)a4;
@end

@implementation IKDOMEvent

- (IKDOMEvent)initWithAppContext:(id)a3 type:(id)a4 xmlAttribute:(id)a5 canBubble:(BOOL)a6 isCancelable:(BOOL)a7
{
  id v13 = a4;
  id v14 = a5;
  v18.receiver = self;
  v18.super_class = (Class)IKDOMEvent;
  v15 = [(IKJSObject *)&v18 initWithAppContext:a3];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_type, a4);
    objc_storeStrong((id *)&v16->_xmlAttribute, a5);
    v16->_bubbles = a6;
    v16->_cancelable = a7;
  }

  return v16;
}

- (IKDOMEvent)initWithType:(id)a3 eventInit:(id)a4
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

    id v13 = [v6 objectForKeyedSubscript:@"cancelable"];
    uint64_t v14 = [v13 BOOLValue];
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v14 = 0;
  }
  v15 = +[IKAppContext currentAppContext];
  v16 = [(IKDOMEvent *)self initWithAppContext:v15 type:v8 xmlAttribute:v10 canBubble:v12 isCancelable:v14];

  return v16;
}

- (void)updateDispatchStateWithCurrentTarget:(id)a3 phase:(int64_t)a4
{
  id v6 = a3;
  if (![(IKDOMEvent *)self isPropagationStopped]
    && ![(IKDOMEvent *)self isImmediatePropagationStopped])
  {
    [(IKDOMEvent *)self setCurrentTarget:v6];
    [(IKDOMEvent *)self setEventPhase:a4];
  }
}

- (BOOL)isPropagationStopped
{
  int64_t v3 = [(IKDOMEvent *)self dispatchState];
  if (v3 != 1) {
    LOBYTE(v3) = [(IKDOMEvent *)self dispatchState] == 2;
  }
  return v3;
}

- (BOOL)isImmediatePropagationStopped
{
  return [(IKDOMEvent *)self dispatchState] == 1;
}

- (void)stopPropagation
{
  if (![(IKDOMEvent *)self isPropagationStopped])
  {
    [(IKDOMEvent *)self setDispatchState:2];
  }
}

- (void)preventDefault
{
  if ([(IKDOMEvent *)self cancelable])
  {
    [(IKDOMEvent *)self setDefaultPrevented:1];
  }
}

- (void)stopImmediatePropagation
{
  if (![(IKDOMEvent *)self isImmediatePropagationStopped])
  {
    [(IKDOMEvent *)self setDispatchState:1];
  }
}

- (NSString)type
{
  return self->_type;
}

- (IKDOMNode)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
}

- (BOOL)bubbles
{
  return self->_bubbles;
}

- (BOOL)cancelable
{
  return self->_cancelable;
}

- (NSDate)timeStamp
{
  return self->_timeStamp;
}

- (NSString)xmlAttribute
{
  return self->_xmlAttribute;
}

- (BOOL)isInUse
{
  return self->_inUse;
}

- (void)setInUse:(BOOL)a3
{
  self->_inUse = a3;
}

- (IKDOMNode)currentTarget
{
  return self->_currentTarget;
}

- (void)setCurrentTarget:(id)a3
{
}

- (int64_t)eventPhase
{
  return self->_eventPhase;
}

- (void)setEventPhase:(int64_t)a3
{
  self->_eventPhase = a3;
}

- (int64_t)dispatchState
{
  return self->_dispatchState;
}

- (void)setDispatchState:(int64_t)a3
{
  self->_dispatchState = a3;
}

- (BOOL)defaultPrevented
{
  return self->_defaultPrevented;
}

- (void)setDefaultPrevented:(BOOL)a3
{
  self->_defaultPrevented = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTarget, 0);
  objc_storeStrong((id *)&self->_xmlAttribute, 0);
  objc_storeStrong((id *)&self->_timeStamp, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end