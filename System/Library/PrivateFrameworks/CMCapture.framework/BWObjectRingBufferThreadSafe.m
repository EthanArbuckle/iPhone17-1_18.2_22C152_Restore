@interface BWObjectRingBufferThreadSafe
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)firstTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastTime;
- (BWObjectRingBufferThreadSafe)initWithCapacity:(int)a3;
- (id)description;
- (id)firstObject;
- (id)lastObject;
- (void)appendObject:(id)a3 forTime:(id *)a4;
- (void)clear;
- (void)dealloc;
- (void)enumerateObjectsStartingAt:(id *)a3 usingBlock:(id)a4;
- (void)extractTimeRangeFrom:(id *)a3 until:(id *)a4 into:(id)a5 times:(id)a6;
- (void)flushEntriesEarlierThan:(id *)a3;
- (void)reverseEnumerateObjectsStartingAt:(id *)a3 usingBlock:(id)a4;
- (void)setCapacity:(int)a3;
@end

@implementation BWObjectRingBufferThreadSafe

- (BWObjectRingBufferThreadSafe)initWithCapacity:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  self->_lock = (OpaqueFigReentrantMutex *)FigReentrantMutexCreate();
  v6.receiver = self;
  v6.super_class = (Class)BWObjectRingBufferThreadSafe;
  return [(BWObjectRingBuffer *)&v6 initWithCapacity:v3];
}

- (void)dealloc
{
  FigSimpleMutexDestroy();
  v3.receiver = self;
  v3.super_class = (Class)BWObjectRingBufferThreadSafe;
  [(BWObjectRingBuffer *)&v3 dealloc];
}

- (void)setCapacity:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  pthread_mutex_lock((pthread_mutex_t *)self->_lock);
  v5.receiver = self;
  v5.super_class = (Class)BWObjectRingBufferThreadSafe;
  [(BWObjectRingBuffer *)&v5 setCapacity:v3];
  pthread_mutex_unlock((pthread_mutex_t *)self->_lock);
}

- (void)appendObject:(id)a3 forTime:(id *)a4
{
  pthread_mutex_lock((pthread_mutex_t *)self->_lock);
  v8.receiver = self;
  v8.super_class = (Class)BWObjectRingBufferThreadSafe;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a4;
  [(BWObjectRingBuffer *)&v8 appendObject:a3 forTime:&v7];
  pthread_mutex_unlock((pthread_mutex_t *)self->_lock);
}

- (id)firstObject
{
  pthread_mutex_lock((pthread_mutex_t *)self->_lock);
  v5.receiver = self;
  v5.super_class = (Class)BWObjectRingBufferThreadSafe;
  id v3 = [(BWObjectRingBuffer *)&v5 firstObject];
  pthread_mutex_unlock((pthread_mutex_t *)self->_lock);
  return v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)firstTime
{
  pthread_mutex_lock((pthread_mutex_t *)self->_lock);
  *(void *)&retstr->var1 = 0;
  retstr->var3 = 0;
  retstr->var0 = 0;
  v6.receiver = self;
  v6.super_class = (Class)BWObjectRingBufferThreadSafe;
  [($3CC8671D27C23BF42ADDB32F2B5E48AE *)&v6 firstTime];
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)pthread_mutex_unlock((pthread_mutex_t *)self->_lock);
}

- (id)lastObject
{
  pthread_mutex_lock((pthread_mutex_t *)self->_lock);
  v5.receiver = self;
  v5.super_class = (Class)BWObjectRingBufferThreadSafe;
  id v3 = [(BWObjectRingBuffer *)&v5 lastObject];
  pthread_mutex_unlock((pthread_mutex_t *)self->_lock);
  return v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastTime
{
  pthread_mutex_lock((pthread_mutex_t *)self->_lock);
  *(void *)&retstr->var1 = 0;
  retstr->var3 = 0;
  retstr->var0 = 0;
  v6.receiver = self;
  v6.super_class = (Class)BWObjectRingBufferThreadSafe;
  [($3CC8671D27C23BF42ADDB32F2B5E48AE *)&v6 lastTime];
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)pthread_mutex_unlock((pthread_mutex_t *)self->_lock);
}

- (void)enumerateObjectsStartingAt:(id *)a3 usingBlock:(id)a4
{
  pthread_mutex_lock((pthread_mutex_t *)self->_lock);
  v8.receiver = self;
  v8.super_class = (Class)BWObjectRingBufferThreadSafe;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a3;
  [(BWObjectRingBuffer *)&v8 enumerateObjectsStartingAt:&v7 usingBlock:a4];
  pthread_mutex_unlock((pthread_mutex_t *)self->_lock);
}

- (void)reverseEnumerateObjectsStartingAt:(id *)a3 usingBlock:(id)a4
{
  pthread_mutex_lock((pthread_mutex_t *)self->_lock);
  v8.receiver = self;
  v8.super_class = (Class)BWObjectRingBufferThreadSafe;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a3;
  [(BWObjectRingBuffer *)&v8 reverseEnumerateObjectsStartingAt:&v7 usingBlock:a4];
  pthread_mutex_unlock((pthread_mutex_t *)self->_lock);
}

- (void)extractTimeRangeFrom:(id *)a3 until:(id *)a4 into:(id)a5 times:(id)a6
{
  pthread_mutex_lock((pthread_mutex_t *)self->_lock);
  v13.receiver = self;
  v13.super_class = (Class)BWObjectRingBufferThreadSafe;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = *a3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *a4;
  [(BWObjectRingBuffer *)&v13 extractTimeRangeFrom:&v12 until:&v11 into:a5 times:a6];
  pthread_mutex_unlock((pthread_mutex_t *)self->_lock);
}

- (void)clear
{
  pthread_mutex_lock((pthread_mutex_t *)self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)BWObjectRingBufferThreadSafe;
  [(BWObjectRingBuffer *)&v3 clear];
  pthread_mutex_unlock((pthread_mutex_t *)self->_lock);
}

- (void)flushEntriesEarlierThan:(id *)a3
{
  pthread_mutex_lock((pthread_mutex_t *)self->_lock);
  v6.receiver = self;
  v6.super_class = (Class)BWObjectRingBufferThreadSafe;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a3;
  [(BWObjectRingBuffer *)&v6 flushEntriesEarlierThan:&v5];
  pthread_mutex_unlock((pthread_mutex_t *)self->_lock);
}

- (id)description
{
  pthread_mutex_lock((pthread_mutex_t *)self->_lock);
  v5.receiver = self;
  v5.super_class = (Class)BWObjectRingBufferThreadSafe;
  id v3 = [(BWObjectRingBuffer *)&v5 description];
  pthread_mutex_unlock((pthread_mutex_t *)self->_lock);
  return v3;
}

@end