@interface _CNObservableFailureEvent
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (_CNObservableFailureEvent)initWithError:(id)a3;
- (id)error;
- (id)value;
- (unint64_t)eventType;
- (unint64_t)hash;
- (void)dematerializeWithObserver:(id)a3;
@end

@implementation _CNObservableFailureEvent

- (_CNObservableFailureEvent)initWithError:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNObservableFailureEvent;
  v5 = [(_CNObservableFailureEvent *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    error = v5->_error;
    v5->_error = (NSError *)v6;

    v8 = v5;
  }

  return v5;
}

- (unint64_t)eventType
{
  return 2;
}

- (BOOL)hasValue
{
  return 0;
}

- (id)value
{
  return 0;
}

- (id)error
{
  return self->_error;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37___CNObservableFailureEvent_isEqual___block_invoke;
  v7[3] = &unk_1E56A0218;
  v7[4] = self;
  id v8 = v4;
  id v5 = v4;
  LOBYTE(self) = +[CNEqualsBuilder isObject:memberOfSameClassAndEqualTo:withBlocks:](CNEqualsBuilder, "isObject:memberOfSameClassAndEqualTo:withBlocks:", v5, self, v7, 0);

  return (char)self;
}

- (unint64_t)hash
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __33___CNObservableFailureEvent_hash__block_invoke;
  v3[3] = &unk_1E56A0070;
  v3[4] = self;
  return +[CNHashBuilder hashWithBlocks:](CNHashBuilder, "hashWithBlocks:", v3, 0);
}

- (void)dematerializeWithObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(_CNObservableFailureEvent *)self error];
  [v4 observerDidFailWithError:v5];
}

- (void).cxx_destruct
{
}

@end