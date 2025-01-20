@interface _FIMutableProxyNode
- (FINodeObserver)subjectObserver;
- (_FIMutableProxyNode)initWithSubject:(id)a3;
- (id)nodesToObserve;
- (void)dispatchNodeEvent:(id)a3;
- (void)setSubjectNode:(id)a3;
- (void)setSubjectObserver:(id)a3;
- (void)startObservingSubject;
- (void)stopObservingSubject;
@end

@implementation _FIMutableProxyNode

- (_FIMutableProxyNode)initWithSubject:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_FIMutableProxyNode;
  v5 = [(FIProxyNode *)&v7 initWithSubject:v4];
  [(_FIMutableProxyNode *)v5 startObservingSubject];

  return v5;
}

- (id)nodesToObserve
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (void)setSubjectNode:(id)a3
{
  id v4 = a3;
  [(_FIMutableProxyNode *)self stopObservingSubject];
  v5.receiver = self;
  v5.super_class = (Class)_FIMutableProxyNode;
  [(FIProxyNode *)&v5 setSubjectNode:v4];
  [(_FIMutableProxyNode *)self startObservingSubject];
}

- (void)startObservingSubject
{
  v3 = [(FIProxyNode *)self subjectNode];
  id v4 = +[FINodeObserver observerForProxy:self subjectNode:v3];

  [(_FIMutableProxyNode *)self setSubjectObserver:v4];
  [v4 startObserving:19];
}

- (void)stopObservingSubject
{
  v3 = [(_FIMutableProxyNode *)self subjectObserver];
  [v3 stopObserving:19];

  [(_FIMutableProxyNode *)self setSubjectObserver:0];
}

- (void)dispatchNodeEvent:(id)a3
{
  NodeEventFromNodeEventRef((FINodeEvent *)a3, &v12);
  uint64_t v4 = *(unsigned int *)TNodeEventPtr::operator->(&v12);
  uint64_t v5 = *(unsigned int *)(TNodeEventPtr::operator->(&v12) + 16);
  v6 = self;
  objc_super v7 = v6;
  BOOL v8 = v4 > 0x32 || ((1 << v4) & 0x4000000000058) == 0;
  v9 = v6;
  if (!v8)
  {
    v9 = (_FIMutableProxyNode *)*(id *)(TNodeEventPtr::operator->(&v12) + 8);
  }
  v10 = [(FIProxyNode *)v7 subjectNode];

  if (v9 == v10)
  {
    v11 = v7;

    v9 = v11;
  }
  [(FIDSNode *)v7 _sendNotification:v4 node:v9 property:v5];

  TNodeEventPtr::~TNodeEventPtr((id *)&v12);
}

- (FINodeObserver)subjectObserver
{
  return self->_subjectObserver;
}

- (void)setSubjectObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end