@interface _CNObservableResultEvent
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (_CNObservableResultEvent)initWithResult:(id)a3;
- (id)description;
- (id)error;
- (id)value;
- (unint64_t)eventType;
- (unint64_t)hash;
- (void)dematerializeWithObserver:(id)a3;
@end

@implementation _CNObservableResultEvent

- (void).cxx_destruct
{
}

- (_CNObservableResultEvent)initWithResult:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNObservableResultEvent;
  v6 = [(_CNObservableResultEvent *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_result, a3);
    v8 = v7;
  }

  return v7;
}

- (void)dematerializeWithObserver:(id)a3
{
  id v5 = a3;
  if ([(_CNObservableResultEvent *)self hasValue])
  {
    v4 = [(_CNObservableResultEvent *)self value];
    [v5 observerDidReceiveResult:v4];
  }
}

- (BOOL)hasValue
{
  v2 = [(_CNObservableResultEvent *)self value];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)value
{
  return self->_result;
}

- (id)description
{
  BOOL v3 = +[CNDescriptionBuilder descriptionBuilderWithObject:self];
  v4 = [(_CNObservableResultEvent *)self value];
  id v5 = (id)[v3 appendName:@"value" object:v4];

  v6 = [v3 build];

  return v6;
}

- (unint64_t)eventType
{
  return 0;
}

- (id)error
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36___CNObservableResultEvent_isEqual___block_invoke;
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
  v3[2] = __32___CNObservableResultEvent_hash__block_invoke;
  v3[3] = &unk_1E56A0070;
  v3[4] = self;
  return +[CNHashBuilder hashWithBlocks:](CNHashBuilder, "hashWithBlocks:", v3, 0);
}

@end