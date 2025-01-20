@interface HMDAccountChangeObserver
- (HMDAccountChangeObserver)init;
- (HMDAccountChangeObserverDelegate)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation HMDAccountChangeObserver

- (HMDAccountChangeObserverDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR___HMDAccountChangeObserver_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x230FBE740](v2);
  return (HMDAccountChangeObserverDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  Account.ChangeObserver.delegate.setter();
}

- (HMDAccountChangeObserver)init
{
  id v2 = objc_msgSend(self, sel_sharedSubscriber);
  v3 = (objc_class *)type metadata accessor for Account.ChangeObserver();
  v4 = (char *)objc_allocWithZone(v3);
  swift_unknownObjectWeakInit();
  *(void *)&v4[OBJC_IVAR___HMDAccountChangeObserver_eventSubscriber] = v2;
  v7.receiver = v4;
  v7.super_class = v3;
  v5 = [(HMDAccountChangeObserver *)&v7 init];
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v5;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR___HMDAccountChangeObserver_delegate;
  sub_22F5E65E8((uint64_t)v3);
}

@end