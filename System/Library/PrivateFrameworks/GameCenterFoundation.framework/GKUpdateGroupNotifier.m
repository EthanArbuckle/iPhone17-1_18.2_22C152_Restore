@interface GKUpdateGroupNotifier
- (GKUpdateGroup)group;
- (GKUpdateGroupNotifier)init;
- (GKUpdateGroupNotifier)retain;
- (NSError)error;
- (NSLock)lock;
- (NSMutableArray)updateQueue;
- (void)addUpdate:(id)a3 error:(id)a4;
- (void)addUpdatesFromGroup:(id)a3;
- (void)dealloc;
- (void)release;
- (void)setError:(id)a3;
- (void)setGroup:(id)a3;
- (void)setLock:(id)a3;
- (void)setUpdateQueue:(id)a3;
- (void)updateError:(id)a3;
@end

@implementation GKUpdateGroupNotifier

- (GKUpdateGroupNotifier)init
{
  v4.receiver = self;
  v4.super_class = (Class)GKUpdateGroupNotifier;
  v2 = [(GKUpdateGroupNotifier *)&v4 init];
  if (v2)
  {
    v2->_lock = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    v2->_updateQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  return v2;
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_group, 0);

  v3.receiver = self;
  v3.super_class = (Class)GKUpdateGroupNotifier;
  [(GKUpdateGroupNotifier *)&v3 dealloc];
}

- (GKUpdateGroupNotifier)retain
{
  [(NSLock *)self->_lock lock];
  v5.receiver = self;
  v5.super_class = (Class)GKUpdateGroupNotifier;
  [(GKUpdateGroupNotifier *)&v5 retain];
  if (objc_loadWeak((id *)&self->_group)
    && (unint64_t)[(GKUpdateGroupNotifier *)self retainCount] >= 2)
  {
    Weak = (dispatch_group_t *)objc_loadWeak((id *)&self->_group);
    dispatch_group_enter(Weak[3]);
  }
  [(NSLock *)self->_lock unlock];
  return self;
}

- (void)release
{
  objc_super v3 = self->_lock;
  [(NSLock *)v3 lock];
  if (objc_loadWeak((id *)&self->_group)
    && (unint64_t)[(GKUpdateGroupNotifier *)self retainCount] >= 2)
  {
    Weak = (dispatch_group_t *)objc_loadWeak((id *)&self->_group);
    dispatch_group_leave(Weak[3]);
  }
  v5.receiver = self;
  v5.super_class = (Class)GKUpdateGroupNotifier;
  [(GKUpdateGroupNotifier *)&v5 release];
  [(NSLock *)v3 unlock];
}

- (void)updateError:(id)a3
{
  if (a3)
  {
    if (!self->_error)
    {
      -[GKUpdateGroupNotifier setError:](self, "setError:");
      p_group = &self->_group;
      if (![objc_loadWeak((id *)p_group) error])
      {
        id Weak = objc_loadWeak((id *)p_group);
        [Weak setError:a3];
      }
    }
  }
}

- (void)addUpdate:(id)a3 error:(id)a4
{
  if (!a4 || self->_error)
  {
    [(NSLock *)self->_lock lock];
    uint64_t v6 = [(GKUpdateGroupNotifier *)self retainCount];
    id v11 = _Block_copy(a3);
    -[NSMutableArray addObject:](self->_updateQueue, "addObject:");
    uint64_t v7 = [(GKUpdateGroupNotifier *)self retainCount];
    [(NSLock *)self->_lock unlock];
    if (v6 != v7)
    {
      v8 = NSString;
      uint64_t v9 = [NSString stringWithFormat:@"update block is not allowed to reference notifier"];
      uint64_t v10 = [v8 stringWithFormat:@"%@ (retainCount == afterRetainCount)\n[%s (%s:%d)]", v9, "-[GKUpdateGroupNotifier addUpdate:error:]", objc_msgSend((id)objc_msgSend((id)objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKUpdateGroup+NoARC.m"), "lastPathComponent"), "UTF8String"), 118];
      [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v10 format];
    }
  }
  else
  {
    [(GKUpdateGroupNotifier *)self updateError:a4];
  }
}

- (void)addUpdatesFromGroup:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__GKUpdateGroupNotifier_addUpdatesFromGroup___block_invoke;
  v3[3] = &unk_1E646E238;
  v3[4] = a3;
  v3[5] = self;
  [a3 join:v3];
}

uint64_t __45__GKUpdateGroupNotifier_addUpdatesFromGroup___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) updateCount];
  if (result >= 1)
  {
    objc_super v3 = *(void **)(a1 + 32);
    objc_super v4 = *(void **)(a1 + 40);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __45__GKUpdateGroupNotifier_addUpdatesFromGroup___block_invoke_2;
    v5[3] = &unk_1E646E210;
    v5[4] = v3;
    return objc_msgSend(v4, "addUpdate:error:", v5, objc_msgSend(v3, "error"));
  }
  return result;
}

uint64_t __45__GKUpdateGroupNotifier_addUpdatesFromGroup___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) applyUpdates];
}

- (NSLock)lock
{
  return (NSLock *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLock:(id)a3
{
}

- (NSMutableArray)updateQueue
{
  return self->_updateQueue;
}

- (void)setUpdateQueue:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 32, 1);
}

- (void)setError:(id)a3
{
}

- (GKUpdateGroup)group
{
  return (GKUpdateGroup *)objc_loadWeak((id *)&self->_group);
}

- (void)setGroup:(id)a3
{
}

- (void).cxx_destruct
{
}

@end