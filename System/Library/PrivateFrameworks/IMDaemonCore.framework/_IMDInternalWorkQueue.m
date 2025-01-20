@interface _IMDInternalWorkQueue
+ (void)enqueueWorkBlock:(id)a3;
- (_IMDInternalWorkQueue)init;
@end

@implementation _IMDInternalWorkQueue

+ (void)enqueueWorkBlock:(id)a3
{
  v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  _s12IMDaemonCore20IMDInternalWorkQueueC07enqueueD5BlockyyyyYbcFZ_0((uint64_t)sub_1D98E33B4, v4);

  swift_release();
}

- (_IMDInternalWorkQueue)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IMDInternalWorkQueue();
  return [(_IMDInternalWorkQueue *)&v3 init];
}

@end