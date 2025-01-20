@interface SiriStateObserver
- (_TtC18SiriLinkFlowPlugin17SiriStateObserver)init;
- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5;
@end

@implementation SiriStateObserver

- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5
{
  char v5 = a5;
  char v6 = a4;
  id v8 = a3;
  v9 = self;
  SiriStateObserver.notifyObserver(_:didChangeStateFrom:to:)((uint64_t)v9, v6, v5);
}

- (_TtC18SiriLinkFlowPlugin17SiriStateObserver)init
{
}

- (void).cxx_destruct
{
}

@end