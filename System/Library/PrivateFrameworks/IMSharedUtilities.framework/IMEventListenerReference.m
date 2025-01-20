@interface IMEventListenerReference
- (IMEventListener)eventListener;
- (IMEventListenerReference)initWithEventListener:(id)a3;
@end

@implementation IMEventListenerReference

- (IMEventListenerReference)initWithEventListener:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IMEventListenerReference;
  v5 = [(IMEventListenerReference *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_eventListener, v4);
  }

  return v6;
}

- (IMEventListener)eventListener
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_eventListener);

  return (IMEventListener *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end