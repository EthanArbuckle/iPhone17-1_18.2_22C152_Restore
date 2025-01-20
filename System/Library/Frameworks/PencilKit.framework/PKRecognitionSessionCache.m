@interface PKRecognitionSessionCache
+ (id)_recognitionSessions;
+ (id)recognitionSessionForUUID:(uint64_t)a1;
+ (void)addRecognitionSession:(void *)a3 forUUID:;
@end

@implementation PKRecognitionSessionCache

+ (id)recognitionSessionForUUID:(uint64_t)a1
{
  id v2 = a2;
  self;
  self;
  os_unfair_lock_lock((os_unfair_lock_t)&_recognitionSessionsLock);
  v3 = +[PKRecognitionSessionCache _recognitionSessions]();
  v4 = [v3 objectEnumerator];

  uint64_t v5 = [v4 nextObject];
  if (v5)
  {
    v6 = (void *)v5;
    do
    {
      -[PKRecognitionSessionManager cleanupSessionIfNecessary]((uint64_t)v6);
      uint64_t v7 = [v4 nextObject];

      v6 = (void *)v7;
    }
    while (v7);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_recognitionSessionsLock);

  if (v2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_recognitionSessionsLock);
    v8 = +[PKRecognitionSessionCache _recognitionSessions]();
    v9 = [v8 objectForKey:v2];

    os_unfair_lock_unlock((os_unfair_lock_t)&_recognitionSessionsLock);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)_recognitionSessions
{
  self;
  if (qword_1EB3C5F18 != -1) {
    dispatch_once(&qword_1EB3C5F18, &__block_literal_global_29);
  }
  v0 = (void *)_MergedGlobals_127;

  return v0;
}

+ (void)addRecognitionSession:(void *)a3 forUUID:
{
  id v6 = a2;
  id v4 = a3;
  self;
  if (v6 && v4)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_recognitionSessionsLock);
    uint64_t v5 = +[PKRecognitionSessionCache _recognitionSessions]();
    [v5 setObject:v6 forKey:v4];

    os_unfair_lock_unlock((os_unfair_lock_t)&_recognitionSessionsLock);
  }
}

void __49__PKRecognitionSessionCache__recognitionSessions__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
  v1 = (void *)_MergedGlobals_127;
  _MergedGlobals_127 = v0;
}

@end