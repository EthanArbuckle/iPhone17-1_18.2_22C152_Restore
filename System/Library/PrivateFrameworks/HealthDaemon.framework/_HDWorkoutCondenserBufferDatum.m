@interface _HDWorkoutCondenserBufferDatum
- (_HDWorkoutCondenserBufferDatum)init;
- (id)description;
@end

@implementation _HDWorkoutCondenserBufferDatum

- (_HDWorkoutCondenserBufferDatum)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_HDWorkoutCondenserBufferDatum;
  uint64_t v4 = [(_HDWorkoutCondenserBufferDatum *)&v8 description];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:self->_UUIDBytes];
  v6 = [v3 stringWithFormat:@"<%@: %@, %f, %f, %f, %d>", v4, v5, *(void *)&self->_startTime, *(void *)&self->_endTime, *(void *)&self->_value, self->_isSeries];

  return v6;
}

@end