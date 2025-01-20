@interface IAMWebProcessJSO
+ (id)eventStringForEvent:(int64_t)a3;
+ (id)stateStringForState:(int64_t)a3;
- (BOOL)hasFiredReadyEvent;
- (IAMWebProcessJSO)init;
- (IAMWebProcessJSODelegate)delegate;
- (NSArray)contentPages;
- (NSMutableDictionary)listenersDictionary;
- (id)getContentPages;
- (id)getState;
- (id)getVersion;
- (int64_t)state;
- (void)_callListenersOfEvent:(int64_t)a3 withArguments:(id)a4;
- (void)addEventListener:(id)a3 listener:(id)a4;
- (void)close;
- (void)initializeInContext:(id)a3;
- (void)open:(id)a3 options:(id)a4;
- (void)performAction:(id)a3 options:(id)a4;
- (void)removeEventListener:(id)a3 listener:(id)a4;
- (void)reportEvent:(id)a3;
- (void)setContentPages:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHasFiredReadyEvent:(BOOL)a3;
- (void)setListenersDictionary:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation IAMWebProcessJSO

- (IAMWebProcessJSO)init
{
  v7.receiver = self;
  v7.super_class = (Class)IAMWebProcessJSO;
  v2 = [(IAMWebProcessJSO *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_state = 0;
    v2->_hasFiredReadyEvent = 0;
    uint64_t v4 = +[NSMutableDictionary dictionary];
    listenersDictionary = v3->_listenersDictionary;
    v3->_listenersDictionary = (NSMutableDictionary *)v4;
  }
  return v3;
}

+ (id)eventStringForEvent:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return &stru_8290;
  }
  else {
    return *(&off_8180 + a3);
  }
}

+ (id)stateStringForState:(int64_t)a3
{
  CFStringRef v3 = &stru_8290;
  if (a3 == 1) {
    CFStringRef v3 = @"default";
  }
  if (a3) {
    return (id)v3;
  }
  else {
    return @"loading";
  }
}

- (void)initializeInContext:(id)a3
{
  id v3 = a3;
  id v7 = +[JSValue valueWithNewObjectInContext:v3];
  objc_msgSend(v7, "_IAM_setConstantValue:forProperty:", @"IAMWebProcessShouldDismissPresentationBeforeOpen", @"IAMOpenURLOptionsDismissBeforeOpenKey");
  uint64_t v4 = [v3 globalObject];
  objc_msgSend(v4, "_IAM_setConstantValue:forProperty:", v7, @"IAMOpenURLOptions");

  v5 = +[JSValue valueWithNewObjectInContext:v3];
  objc_msgSend(v5, "_IAM_setConstantValue:forProperty:", @"IAMWebProcessShouldDismissPresentationBeforePerformingAction", @"IAMPerformActionOptionsDismissBeforeActionKey");
  v6 = [v3 globalObject];

  objc_msgSend(v6, "_IAM_setConstantValue:forProperty:", v5, @"IAMPerformActionOptions");
}

- (void)setContentPages:(id)a3
{
  v5 = (NSArray *)a3;
  p_contentPages = &self->_contentPages;
  if (self->_contentPages != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_contentPages, a3);
    v5 = v7;
    if (self->_state != 1)
    {
      p_contentPages = (NSArray **)[(IAMWebProcessJSO *)self setState:1];
      v5 = v7;
    }
  }

  _objc_release_x1(p_contentPages, v5);
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    v5 = [(IAMWebProcessJSO *)self getState];
    id v7 = v5;
    v6 = +[NSArray arrayWithObjects:&v7 count:1];
    [(IAMWebProcessJSO *)self _callListenersOfEvent:3 withArguments:v6];

    if (a3 == 1 && ![(IAMWebProcessJSO *)self hasFiredReadyEvent])
    {
      [(IAMWebProcessJSO *)self _callListenersOfEvent:1 withArguments:0];
      [(IAMWebProcessJSO *)self setHasFiredReadyEvent:1];
    }
  }
}

- (void)_callListenersOfEvent:(int64_t)a3 withArguments:(id)a4
{
  id v6 = a4;
  id v7 = +[IAMWebProcessJSO eventStringForEvent:a3];
  v8 = [(IAMWebProcessJSO *)self listenersDictionary];
  v9 = [v8 objectForKeyedSubscript:v7];

  if (v9 && [v9 count])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = v9;
    id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v14);
          id v16 = objc_msgSend(v6, "copy", (void)v18);
          id v17 = [v15 callWithArguments:v16];

          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }
  }
}

- (void)addEventListener:(id)a3 listener:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(IAMWebProcessJSO *)self listenersDictionary];
  v8 = [v7 objectForKeyedSubscript:v10];

  if (!v8)
  {
    v8 = +[NSMutableArray array];
    v9 = [(IAMWebProcessJSO *)self listenersDictionary];
    [v9 setObject:v8 forKey:v10];
  }
  if (([v8 containsObject:v6] & 1) == 0) {
    [v8 addObject:v6];
  }
}

- (void)removeEventListener:(id)a3 listener:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = [(IAMWebProcessJSO *)self listenersDictionary];
  uint64_t v8 = [v7 objectForKeyedSubscript:v14];
  if (v8)
  {
    v9 = (void *)v8;
    id v10 = [(IAMWebProcessJSO *)self listenersDictionary];
    id v11 = [v10 objectForKeyedSubscript:v14];
    unsigned int v12 = [v11 containsObject:v6];

    if (!v12) {
      goto LABEL_5;
    }
    id v7 = [(IAMWebProcessJSO *)self listenersDictionary];
    uint64_t v13 = [v7 objectForKeyedSubscript:v14];
    [v13 removeObject:v6];
  }
LABEL_5:
}

- (id)getState
{
  int64_t v2 = [(IAMWebProcessJSO *)self state];

  return +[IAMWebProcessJSO stateStringForState:v2];
}

- (id)getVersion
{
  return @"1.2";
}

- (id)getContentPages
{
  return [(IAMWebProcessJSO *)self contentPages];
}

- (void)reportEvent:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(IAMWebProcessJSO *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(IAMWebProcessJSO *)self delegate];
    [v6 webProcessJSODidReportEvent:v7];
  }
}

- (void)performAction:(id)a3 options:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [(IAMWebProcessJSO *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v6)
  {
    if (v8)
    {
      v9 = [v6 objectForKey:@"IAMWebProcessShouldDismissPresentationBeforePerformingAction"];

      if (v9)
      {
        id v10 = [(IAMWebProcessJSO *)self delegate];
        [v10 webProcessJSODidCallPerformAction:v11 options:v6];
      }
    }
  }
}

- (void)open:(id)a3 options:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [(IAMWebProcessJSO *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v6)
  {
    if (v8)
    {
      v9 = [v6 objectForKey:@"IAMWebProcessShouldDismissPresentationBeforeOpen"];

      if (v9)
      {
        id v10 = [(IAMWebProcessJSO *)self delegate];
        [v10 webProcessJSODidCallOpen:v11 options:v6];
      }
    }
  }
}

- (void)close
{
  id v3 = [(IAMWebProcessJSO *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(IAMWebProcessJSO *)self delegate];
    [v5 webProcessJSODidCallClose];
  }
}

- (IAMWebProcessJSODelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IAMWebProcessJSODelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)contentPages
{
  return self->_contentPages;
}

- (int64_t)state
{
  return self->_state;
}

- (BOOL)hasFiredReadyEvent
{
  return self->_hasFiredReadyEvent;
}

- (void)setHasFiredReadyEvent:(BOOL)a3
{
  self->_hasFiredReadyEvent = a3;
}

- (NSMutableDictionary)listenersDictionary
{
  return self->_listenersDictionary;
}

- (void)setListenersDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listenersDictionary, 0);
  objc_storeStrong((id *)&self->_contentPages, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end