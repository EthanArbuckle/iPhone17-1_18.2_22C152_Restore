@interface CPDisplayCloneStateObserver
- (_TtC14CopresenceCore27CPDisplayCloneStateObserver)init;
@end

@implementation CPDisplayCloneStateObserver

- (_TtC14CopresenceCore27CPDisplayCloneStateObserver)init
{
  return (_TtC14CopresenceCore27CPDisplayCloneStateObserver *)CPDisplayCloneStateObserver.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14CopresenceCore27CPDisplayCloneStateObserver_observation));
  v3 = (char *)self + OBJC_IVAR____TtC14CopresenceCore27CPDisplayCloneStateObserver_delegate;
  outlined destroy of weak ActivitySessionManagerProtocol?((uint64_t)v3);
}

@end