@interface NSKnownKeysMappingStrategy2
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (NSKnownKeysMappingStrategy2)init;
- (NSKnownKeysMappingStrategy2)retain;
- (id)_setupForKeys:(id *)a3 count:(unint64_t)a4 table:(void *)a5 inData:(id)a6;
- (unint64_t)retainCount;
- (void)release;
@end

@implementation NSKnownKeysMappingStrategy2

- (NSKnownKeysMappingStrategy2)retain
{
  id v3 = *(id *)&self->super._cd_rc;
  return self;
}

- (void)release
{
}

- (id)_setupForKeys:(id *)a3 count:(unint64_t)a4 table:(void *)a5 inData:(id)a6
{
  self->super._length = a4;
  self->super._keys = a3;
  self->super._table = a5;
  *(void *)&self->super._cd_rc = a6;
  return self;
}

- (NSKnownKeysMappingStrategy2)init
{
  objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:@"You're doing it wrong" reason:@"Skanky class can only be used skankily." userInfo:0]);
}

- (unint64_t)retainCount
{
  return [*(id *)&self->super._cd_rc retainCount];
}

- (BOOL)_isDeallocating
{
  return [*(id *)&self->super._cd_rc _isDeallocating];
}

- (BOOL)_tryRetain
{
  return [*(id *)&self->super._cd_rc _tryRetain];
}

@end