@interface DIIOIterator
- (BOOL)startedOver;
- (DIIOIterator)initWithIOIterator:(unsigned int)a3 retain:(BOOL)a4;
- (unsigned)copyNextObject;
- (void)setStartedOver:(BOOL)a3;
@end

@implementation DIIOIterator

- (DIIOIterator)initWithIOIterator:(unsigned int)a3 retain:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)DIIOIterator;
  return [(DIIOObject *)&v5 initWithIOObject:*(void *)&a3 retain:a4];
}

- (unsigned)copyNextObject
{
  for (i = self; ; self = i)
  {
    unsigned int result = IOIteratorNext([(DIIOObject *)self ioObj]);
    if (result) {
      break;
    }
    if (IOIteratorIsValid([(DIIOObject *)i ioObj])) {
      return 0;
    }
    IOIteratorReset([(DIIOObject *)i ioObj]);
    [(DIIOIterator *)i setStartedOver:1];
  }
  return result;
}

- (BOOL)startedOver
{
  return *((unsigned char *)&self->super._ioObj + 4);
}

- (void)setStartedOver:(BOOL)a3
{
  *((unsigned char *)&self->super._ioObj + 4) = a3;
}

@end