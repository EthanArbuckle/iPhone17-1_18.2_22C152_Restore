@interface _CNObservableCompletionEvent
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (id)error;
- (id)value;
- (unint64_t)eventType;
- (void)dematerializeWithObserver:(id)a3;
@end

@implementation _CNObservableCompletionEvent

- (unint64_t)eventType
{
  return 1;
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
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  return +[CNEqualsBuilder isObject:memberOfSameClassAndEqualTo:withBlocks:](CNEqualsBuilder, "isObject:memberOfSameClassAndEqualTo:withBlocks:", a3, self, 0, 0);
}

- (void)dematerializeWithObserver:(id)a3
{
}

@end