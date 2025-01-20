@interface _ANEOutputSetEnqueue
+ (id)new;
+ (id)outputSetWithProcedureIndex:(unsigned int)a3 setIndex:(unsigned int)a4 signalValue:(unint64_t)a5 signalNotRequired:(BOOL)a6 isOpenLoop:(BOOL)a7;
- (BOOL)isOpenLoop;
- (BOOL)signalNotRequired;
- (_ANEOutputSetEnqueue)init;
- (id)initOutputSetWithProcedureIndex:(unsigned int)a3 setIndex:(unsigned int)a4 signalValue:(unint64_t)a5 signalNotRequired:(BOOL)a6 isOpenLoop:(BOOL)a7;
- (unint64_t)signalValue;
- (unsigned)procedureIndex;
- (unsigned)setIndex;
@end

@implementation _ANEOutputSetEnqueue

+ (id)new
{
  return 0;
}

- (_ANEOutputSetEnqueue)init
{
  return 0;
}

- (id)initOutputSetWithProcedureIndex:(unsigned int)a3 setIndex:(unsigned int)a4 signalValue:(unint64_t)a5 signalNotRequired:(BOOL)a6 isOpenLoop:(BOOL)a7
{
  v13.receiver = self;
  v13.super_class = (Class)_ANEOutputSetEnqueue;
  id result = [(_ANEOutputSetEnqueue *)&v13 init];
  if (result)
  {
    *((_DWORD *)result + 3) = a3;
    *((_DWORD *)result + 4) = a4;
    *((void *)result + 3) = a5;
    *((unsigned char *)result + 8) = a6;
    *((unsigned char *)result + 9) = a7;
  }
  return result;
}

+ (id)outputSetWithProcedureIndex:(unsigned int)a3 setIndex:(unsigned int)a4 signalValue:(unint64_t)a5 signalNotRequired:(BOOL)a6 isOpenLoop:(BOOL)a7
{
  v7 = (void *)[objc_alloc((Class)a1) initOutputSetWithProcedureIndex:*(void *)&a3 setIndex:*(void *)&a4 signalValue:a5 signalNotRequired:a6 isOpenLoop:a7];
  return v7;
}

- (unsigned)procedureIndex
{
  return self->_procedureIndex;
}

- (unsigned)setIndex
{
  return self->_setIndex;
}

- (unint64_t)signalValue
{
  return self->_signalValue;
}

- (BOOL)signalNotRequired
{
  return self->_signalNotRequired;
}

- (BOOL)isOpenLoop
{
  return self->_isOpenLoop;
}

@end