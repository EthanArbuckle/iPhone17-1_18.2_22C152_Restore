@interface _CNObservableEventStaticArrayBufferingStrategy
- (BOOL)isSequenceTerminated;
- (NSArray)events;
- (_CNObservableEventStaticArrayBufferingStrategy)initWithEvents:(id)a3;
@end

@implementation _CNObservableEventStaticArrayBufferingStrategy

- (_CNObservableEventStaticArrayBufferingStrategy)initWithEvents:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNObservableEventStaticArrayBufferingStrategy;
  v5 = [(_CNObservableEventStaticArrayBufferingStrategy *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    events = v5->_events;
    v5->_events = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (BOOL)isSequenceTerminated
{
  return 1;
}

- (NSArray)events
{
  return self->_events;
}

- (void).cxx_destruct
{
}

@end