@interface NSUndoManager
+ (void)_endTopLevelGroupings;
+ (void)_setEndsTopLevelGroupingsAfterRunLoopIterations:(BOOL)a3;
+ (void)initialize;
- (BOOL)_endUndoGroupRemovingIfEmpty:(BOOL)a3;
- (BOOL)_shouldCoalesceTypingForText:(id)a3 :(id)a4;
- (BOOL)canRedo;
- (BOOL)canUndo;
- (BOOL)groupsByEvent;
- (BOOL)isRedoing;
- (BOOL)isUndoRegistrationEnabled;
- (BOOL)isUndoing;
- (BOOL)redoActionIsDiscardable;
- (BOOL)undoActionIsDiscardable;
- (NSArray)runLoopModes;
- (NSInteger)groupingLevel;
- (NSString)redoActionName;
- (NSString)redoMenuItemTitle;
- (NSString)redoMenuTitleForUndoActionName:(NSString *)actionName;
- (NSString)undoActionName;
- (NSString)undoMenuItemTitle;
- (NSString)undoMenuTitleForUndoActionName:(NSString *)actionName;
- (NSUInteger)levelsOfUndo;
- (NSUndoManager)init;
- (id)_methodSignatureForTargetSelector:(SEL)a3;
- (id)_undoStack;
- (id)prepareWithInvocationTarget:(id)target;
- (id)redoActionUserInfoValueForKey:(id)a3;
- (id)undoActionUserInfoValueForKey:(id)a3;
- (unint64_t)redoCount;
- (unint64_t)undoCount;
- (void)__redoCommonDoSingle:(BOOL)a3;
- (void)__redoSingle;
- (void)_cancelAutomaticTopLevelGroupEnding;
- (void)_commitUndoGrouping;
- (void)_forwardTargetInvocation:(id)a3;
- (void)_postCheckpointNotification;
- (void)_prepareEventGrouping;
- (void)_processEndOfEventNotification:(id)a3;
- (void)_registerUndoObject:(id)a3;
- (void)_rollbackUndoGrouping;
- (void)_scheduleAutomaticTopLevelGroupEnding;
- (void)_setGroupIdentifier:(id)a3;
- (void)beginUndoGrouping;
- (void)dealloc;
- (void)disableUndoRegistration;
- (void)enableUndoRegistration;
- (void)endUndoGrouping;
- (void)redo;
- (void)registerUndoWithTarget:(id)target handler:(void *)undoHandler;
- (void)registerUndoWithTarget:(id)target selector:(SEL)selector object:(id)anObject;
- (void)removeAllActions;
- (void)removeAllActionsWithTarget:(id)target;
- (void)setActionIsDiscardable:(BOOL)discardable;
- (void)setActionUserInfoValue:(id)a3 forKey:(id)a4;
- (void)setGroupsByEvent:(BOOL)groupsByEvent;
- (void)setLevelsOfUndo:(NSUInteger)levelsOfUndo;
- (void)setRunLoopModes:(NSArray *)runLoopModes;
- (void)undo;
- (void)undoNestedGroup;
@end

@implementation NSUndoManager

- (void)removeAllActions
{
  [(_NSUndoStack *)self->_undoStack removeAllObjects];
  [(_NSUndoStack *)self->_redoStack removeAllObjects];
  unint64_t flags = self->_flags;
  self->_unint64_t flags = flags & 0xFCFFFFFFFFLL;
  self->_target = 0;
  if ((flags & 0x1000000000) != 0) {
    [(NSUndoManager *)self _cancelAutomaticTopLevelGroupEnding];
  }

  [(NSUndoManager *)self _delayAutomaticTermination:-1.0];
}

+ (void)initialize
{
  if (NSUndoManager == a1)
  {
    uint64_t v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "integerForKey:", @"NSUndoManagerDefaultLevelsOfUndo");
    if (v2) {
      defaultLevelsOfUndo = v2;
    }
  }
}

- (NSUndoManager)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)NSUndoManager;
  uint64_t v2 = [(NSUndoManager *)&v4 init];
  v2->_undoStack = [+[_NSUndoStack allocWithZone:[(NSUndoManager *)v2 zone]] init];
  v2->_redoStack = [+[_NSUndoStack allocWithZone:[(NSUndoManager *)v2 zone]] init];
  v2->_unint64_t flags = 0x4000000000;
  v2->_target = 0;
  v2->_runLoopModes = (NSArray *)(id)[MEMORY[0x1E4F1C978] arrayWithObject:*MEMORY[0x1E4F1C3A0]];
  [(_NSUndoStack *)v2->_undoStack setMax:defaultLevelsOfUndo];
  return v2;
}

- (NSInteger)groupingLevel
{
  uint64_t v2 = 16;
  if ((self->_flags & 0x100000000) == 0) {
    uint64_t v2 = 8;
  }
  return [*(id *)((char *)&self->super.isa + v2) nestingLevel];
}

- (BOOL)canRedo
{
  return [(_NSUndoStack *)self->_redoStack count] != 0;
}

- (BOOL)canUndo
{
  return [(_NSUndoStack *)self->_undoStack count] != 0;
}

- (void)_postCheckpointNotification
{
  unint64_t flags = self->_flags;
  if ((flags & 0x2000000000) == 0)
  {
    self->_unint64_t flags = flags | 0x2000000000;
    [+[NSNotificationCenter defaultCenter] postNotificationName:@"NSUndoManagerCheckpointNotification" object:self];
    self->_flags &= ~0x2000000000uLL;
  }
}

- (void)setGroupsByEvent:(BOOL)groupsByEvent
{
  uint64_t v3 = 0x4000000000;
  if (!groupsByEvent) {
    uint64_t v3 = 0;
  }
  self->_unint64_t flags = self->_flags & 0xFFFFFFBFFFFFFFFFLL | v3;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_5_1);
  [(id)qword_1EB1ECB90 removeObject:self];
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_5_1);
  [self->_proxy superRelease];

  [(NSUndoManager *)self _delayAutomaticTermination:-1.0];
  v3.receiver = self;
  v3.super_class = (Class)NSUndoManager;
  [(NSUndoManager *)&v3 dealloc];
}

- (void)_scheduleAutomaticTopLevelGroupEnding
{
  if (NSUndoManagerEndsTopLevelGroupingsAfterRunLoopIterations)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CAC0], "currentRunLoop"), "performSelector:target:argument:order:modes:", sel__processEndOfEventNotification_, self, 0, 350000, -[NSUndoManager runLoopModes](self, "runLoopModes"));
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_5_1);
    objc_super v3 = (NSHashTable *)qword_1EB1ECB90;
    if (!qword_1EB1ECB90)
    {
      objc_super v3 = [[NSHashTable alloc] initWithOptions:5 capacity:0];
      qword_1EB1ECB90 = (uint64_t)v3;
    }
    [(NSHashTable *)v3 addObject:self];
    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_5_1);
  }
  self->_flags |= 0x1000000000uLL;
}

- (void)_cancelAutomaticTopLevelGroupEnding
{
  if (NSUndoManagerEndsTopLevelGroupingsAfterRunLoopIterations)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CAC0], "currentRunLoop"), "cancelPerformSelector:target:argument:", sel__processEndOfEventNotification_, self, 0);
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_5_1);
    [(id)qword_1EB1ECB90 removeObject:self];
    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_5_1);
  }
  self->_flags &= ~0x1000000000uLL;
}

- (void)_prepareEventGrouping
{
  unint64_t flags = self->_flags;
  if ((flags & 0x5000000000) == 0x4000000000)
  {
    BOOL v4 = (flags & 0x100000000) == 0;
    uint64_t v5 = 16;
    if (v4) {
      uint64_t v5 = 8;
    }
    if (![*(id *)((char *)&self->super.isa + v5) nestingLevel])
    {
      [(NSUndoManager *)self _scheduleAutomaticTopLevelGroupEnding];
      [(NSUndoManager *)self beginUndoGrouping];
    }
  }
}

- (void)beginUndoGrouping
{
  unint64_t flags = self->_flags;
  if (!(flags >> 40))
  {
    if ((flags & 0x300000000) == 0)
    {
      [(NSUndoManager *)self _prepareEventGrouping];
      unint64_t flags = self->_flags;
    }
    uint64_t v4 = 16;
    if ((flags & 0x100000000) == 0) {
      uint64_t v4 = 8;
    }
    uint64_t v5 = *(Class *)((char *)&self->super.isa + v4);
    if ((flags & 0x4000000000) == 0 || [*(id *)((char *)&self->super.isa + v4) nestingLevel]) {
      [(NSUndoManager *)self _postCheckpointNotification];
    }
    [v5 markBegin];
    if ((self->_flags & 0x300000000) == 0)
    {
      v6 = +[NSNotificationCenter defaultCenter];
      [(NSNotificationCenter *)v6 postNotificationName:@"NSUndoManagerDidOpenUndoGroupNotification" object:self];
    }
  }
}

- (BOOL)_endUndoGroupRemovingIfEmpty:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v6 = 16;
  if ((self->_flags & 0x100000000) == 0) {
    uint64_t v6 = 8;
  }
  v7 = *(Class *)((char *)&self->super.isa + v6);
  [(NSUndoManager *)self _postCheckpointNotification];
  if (![v7 nestingLevel])
  {
    v14 = NSStringFromSelector(a2);
    v15 = (objc_class *)objc_opt_class();
    v16 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %@ %p is in invalid state, endUndoGrouping called with no matching begin\n", v14, NSStringFromClass(v15), self), 0 reason userInfo];
    objc_exception_throw(v16);
  }
  uint64_t v8 = objc_msgSend((id)objc_msgSend(v7, "topUndoObject"), "isBeginMark");
  if ((self->_flags & 0x300000000) == 0)
  {
    if (v3) {
      uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v8), @"NSUndoManagerGroupIsEmpty");
    }
    else {
      uint64_t v9 = 0;
    }
    [+[NSNotificationCenter defaultCenter] postNotificationName:@"NSUndoManagerWillCloseUndoGroupNotification" object:self userInfo:v9];
  }
  int v10 = [v7 isDiscardable];
  if ((v8 & v3) == 1)
  {
    [v7 popUndoObject];
  }
  else
  {
    int v11 = v10;
    if (v8 && (self->_flags & 0x300000000) == 0) {
      [(_NSUndoStack *)self->_redoStack removeAllObjects];
    }
    [v7 markEnd];
    if ((self->_flags & 0x300000000) == 0)
    {
      if (v11) {
        uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), @"NSUndoManagerGroupIsDiscardableKey");
      }
      else {
        uint64_t v12 = 0;
      }
      [+[NSNotificationCenter defaultCenter] postNotificationName:@"NSUndoManagerDidCloseUndoGroupNotification" object:self userInfo:v12];
    }
  }
  return v8 ^ 1;
}

- (void)endUndoGrouping
{
  if (!(self->_flags >> 40)) {
    [(NSUndoManager *)self _endUndoGroupRemovingIfEmpty:0];
  }
}

- (void)disableUndoRegistration
{
  self->_flags += 0x10000000000;
}

- (void)enableUndoRegistration
{
  unint64_t flags = self->_flags;
  if (!(flags >> 40))
  {
    uint64_t v4 = NSStringFromSelector(a2);
    uint64_t v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %@ %p is in invalid state, enableUndoRegistration may only be invoked with matching call to disableUndoRegistration\n", v4, NSStringFromClass(v5), self), 0 reason userInfo];
    objc_exception_throw(v6);
  }
  self->_unint64_t flags = flags - 0x10000000000;
}

- (BOOL)isUndoRegistrationEnabled
{
  return self->_flags >> 40 == 0;
}

- (BOOL)groupsByEvent
{
  return (BYTE4(self->_flags) >> 6) & 1;
}

- (void)setLevelsOfUndo:(NSUInteger)levelsOfUndo
{
}

- (NSUInteger)levelsOfUndo
{
  return [(_NSUndoStack *)self->_undoStack max];
}

- (void)setRunLoopModes:(NSArray *)runLoopModes
{
  BOOL v3 = self->_runLoopModes;
  self->_runLoopModes = (NSArray *)[(NSArray *)runLoopModes copyWithZone:[(NSUndoManager *)self zone]];
}

- (NSArray)runLoopModes
{
  uint64_t v2 = self->_runLoopModes;

  return v2;
}

- (void)undo
{
  [(NSUndoManager *)self _postCheckpointNotification];
  if ((self->_flags & 0x1000000000) != 0 && [(_NSUndoStack *)self->_undoStack nestingLevel] == 1)
  {
    [(NSUndoManager *)self endUndoGrouping];
    [(NSUndoManager *)self _cancelAutomaticTopLevelGroupEnding];
  }
  if ([(_NSUndoStack *)self->_undoStack nestingLevel])
  {
    uint64_t v4 = NSStringFromSelector(a2);
    uint64_t v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %@ %p is in invalid state, undo was called with too many nested undo groups", v4, NSStringFromClass(v5), self), 0 reason userInfo];
    objc_exception_throw(v6);
  }

  [(NSUndoManager *)self undoNestedGroup];
}

- (void)undoNestedGroup
{
  v11[1] = *MEMORY[0x1E4F143B8];
  [(NSUndoManager *)self _postCheckpointNotification];
  self->_flags |= 0x100000000uLL;
  id v4 = [(_NSUndoStack *)self->_undoStack topUndoObject];
  if (v4)
  {
    if (([v4 isEndMark] & 1) == 0)
    {
      self->_flags &= ~0x100000000uLL;
      v7 = NSStringFromSelector(a2);
      uint64_t v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %@ %p is in invalid state, call endUndoGrouping before calling this method\n", v7, NSStringFromClass(v8), self), 0 reason userInfo];
      objc_exception_throw(v9);
    }
    [+[NSNotificationCenter defaultCenter] postNotificationName:@"NSUndoManagerWillUndoChangeNotification" object:self];
    [(NSUndoManager *)self beginUndoGrouping];
    BOOL v5 = [(_NSUndoStack *)self->_undoStack isDiscardable];
    if (!(self->_flags >> 40))
    {
      [(_NSUndoStack *)self->_redoStack setGroupIdentifier:[(_NSUndoStack *)self->_undoStack groupIdentifier]];
      if (!(self->_flags >> 40))
      {
        [(_NSUndoStack *)self->_redoStack setUserInfo:[(_NSUndoStack *)self->_undoStack userInfo]];
        if (!(self->_flags >> 40)) {
          [(_NSUndoStack *)self->_redoStack setDiscardable:v5];
        }
      }
    }
    [(_NSUndoStack *)self->_undoStack popAndInvoke];
    if (!(self->_flags >> 40)) {
      [(NSUndoManager *)self _endUndoGroupRemovingIfEmpty:1];
    }
    if (v5)
    {
      int v10 = @"NSUndoManagerGroupIsDiscardableKey";
      v11[0] = MEMORY[0x1E4F1CC38];
      uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    }
    else
    {
      uint64_t v6 = 0;
    }
    [+[NSNotificationCenter defaultCenter] postNotificationName:@"NSUndoManagerDidUndoChangeNotification" object:self userInfo:v6];
  }
  self->_flags &= ~0x100000000uLL;
}

- (void)redo
{
}

- (void)__redoSingle
{
}

- (void)__redoCommonDoSingle:(BOOL)a3
{
  if ([(NSUndoManager *)self canRedo])
  {
    self->_flags |= 0x200000000uLL;
    id v5 = [(_NSUndoStack *)self->_redoStack topUndoObject];
    if (v5)
    {
      if (([v5 isEndMark] & 1) == 0)
      {
        self->_flags &= ~0x200000000uLL;
        uint64_t v8 = NSStringFromSelector(a2);
        uint64_t v9 = (objc_class *)objc_opt_class();
        int v10 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %@ %p is in invalid state, do not invoke this method while undoing\n", v8, NSStringFromClass(v9), self), 0 reason userInfo];
        objc_exception_throw(v10);
      }
      [+[NSNotificationCenter defaultCenter] postNotificationName:@"NSUndoManagerWillRedoChangeNotification" object:self];
      [(NSUndoManager *)self beginUndoGrouping];
      BOOL v6 = [(_NSUndoStack *)self->_redoStack isDiscardable];
      if (!(self->_flags >> 40))
      {
        [(_NSUndoStack *)self->_undoStack setGroupIdentifier:[(_NSUndoStack *)self->_redoStack groupIdentifier]];
        if (!(self->_flags >> 40))
        {
          [(_NSUndoStack *)self->_undoStack setUserInfo:[(_NSUndoStack *)self->_redoStack userInfo]];
          if (!(self->_flags >> 40)) {
            [(_NSUndoStack *)self->_undoStack setDiscardable:v6];
          }
        }
      }
      [(_NSUndoStack *)self->_redoStack popAndInvoke];
      [(NSUndoManager *)self _postCheckpointNotification];
      [(NSUndoManager *)self endUndoGrouping];
      if (v6) {
        uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), @"NSUndoManagerGroupIsDiscardableKey");
      }
      else {
        uint64_t v7 = 0;
      }
      [+[NSNotificationCenter defaultCenter] postNotificationName:@"NSUndoManagerDidRedoChangeNotification" object:self userInfo:v7];
    }
    self->_flags &= ~0x200000000uLL;
  }
}

- (unint64_t)undoCount
{
  return [(_NSUndoStack *)self->_undoStack topLevelGroupCount];
}

- (unint64_t)redoCount
{
  return [(_NSUndoStack *)self->_redoStack topLevelGroupCount];
}

- (BOOL)isUndoing
{
  return BYTE4(self->_flags) & 1;
}

- (BOOL)isRedoing
{
  return (BYTE4(self->_flags) >> 1) & 1;
}

- (void)removeAllActionsWithTarget:(id)target
{
  -[_NSUndoStack removeAllObjectsWithTarget:](self->_undoStack, "removeAllObjectsWithTarget:");
  redoStack = self->_redoStack;

  [(_NSUndoStack *)redoStack removeAllObjectsWithTarget:target];
}

- (id)prepareWithInvocationTarget:(id)target
{
  self->_target = target;
  proxy = (NSUndoManagerProxy *)self->_proxy;
  if (!proxy)
  {
    proxy = [[NSUndoManagerProxy alloc] initWithManager:self];
    self->_proxy = proxy;
  }
  [(NSUndoManagerProxy *)proxy setTargetClass:objc_opt_class()];
  return self->_proxy;
}

- (id)_methodSignatureForTargetSelector:(SEL)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)NSUndoManager;
  id result = -[NSUndoManager methodSignatureForSelector:](&v6, sel_methodSignatureForSelector_);
  if (!result)
  {
    id result = self->_target;
    if (result) {
      return (id)[result methodSignatureForSelector:a3];
    }
  }
  return result;
}

- (void)_registerUndoObject:(id)a3
{
  unint64_t flags = self->_flags;
  if (flags >> 40)
  {
  }
  else
  {
    if ((flags & 0x300000000) == 0) {
      [(_NSUndoStack *)self->_redoStack removeAllObjects];
    }
    [(NSUndoManager *)self _prepareEventGrouping];
    uint64_t v6 = 16;
    if ((self->_flags & 0x100000000) == 0) {
      uint64_t v6 = 8;
    }
    uint64_t v7 = *(Class *)((char *)&self->super.isa + v6);
    if (![v7 nestingLevel])
    {
      uint64_t v8 = NSStringFromSelector(a2);
      uint64_t v9 = (objc_class *)objc_opt_class();
      int v10 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %@ %p is in invalid state, must begin a group before registering undo\n", v8, NSStringFromClass(v9), self), 0 reason userInfo];
      objc_exception_throw(v10);
    }
    [v7 push:a3];
    if ([(NSUndoManager *)self groupsByEvent])
    {
      [(NSUndoManager *)self _delayAutomaticTermination:28800.0];
    }
  }
}

- (void)_forwardTargetInvocation:(id)a3
{
  if (!self->_target)
  {
    id v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    uint64_t v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %@ %p received forwarded invocation while invocation target is nil. Call prepareWithInvocationTarget: before invoking %@", @"forwardInvocation:", v6, self, NSStringFromSelector((SEL)objc_msgSend(a3, "selector"))), 0 reason userInfo];
    objc_exception_throw(v7);
  }
  [a3 setTarget:0];
  -[NSUndoManager _registerUndoObject:](self, "_registerUndoObject:", [objc_allocWithZone((Class)_NSUndoInvocation) initWithTarget:self->_target invocation:a3]);
  self->_target = 0;
}

- (void)registerUndoWithTarget:(id)target selector:(SEL)selector object:(id)anObject
{
  uint64_t v6 = [objc_allocWithZone((Class)_NSUndoLightInvocation) initWithTarget:target selector:selector object:anObject];

  [(NSUndoManager *)self _registerUndoObject:v6];
}

- (void)registerUndoWithTarget:(id)target handler:(void *)undoHandler
{
  if (!target)
  {
    uint64_t v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** %s: targetcannot be nil", undoHandler, "-[NSUndoManager registerUndoWithTarget:handler:]");
    goto LABEL_10;
  }
  if (!undoHandler)
  {
    uint64_t v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** %s: handlercannot be nil", 0, "-[NSUndoManager registerUndoWithTarget:handler:]");
LABEL_10:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v6 userInfo:0]);
  }
  id v5 = [[_NSUndoBlockInvocation alloc] initWithTarget:target handler:undoHandler];
  if (v5)
  {
    [(NSUndoManager *)self _registerUndoObject:v5];
  }
}

- (NSString)undoActionName
{
  id result = [(_NSUndoStack *)self->_undoStack groupIdentifier];
  if (!result) {
    return (NSString *)&stru_1ECA5C228;
  }
  return result;
}

- (NSString)redoActionName
{
  id result = [(_NSUndoStack *)self->_redoStack groupIdentifier];
  if (!result) {
    return (NSString *)&stru_1ECA5C228;
  }
  return result;
}

- (void)_setGroupIdentifier:(id)a3
{
  if (a3 && !(self->_flags >> 40))
  {
    [(NSUndoManager *)self _prepareEventGrouping];
    uint64_t v6 = 16;
    if ((self->_flags & 0x100000000) == 0) {
      uint64_t v6 = 8;
    }
    uint64_t v7 = *(Class *)((char *)&self->super.isa + v6);
    if (![v7 nestingLevel])
    {
      uint64_t v8 = NSStringFromSelector(a2);
      uint64_t v9 = (objc_class *)objc_opt_class();
      int v10 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %@ %p is in invalid state, must begin a group before registering undo\n", v8, NSStringFromClass(v9), self), 0 reason userInfo];
      objc_exception_throw(v10);
    }
    [v7 setGroupIdentifier:a3];
  }
}

- (void)setActionIsDiscardable:(BOOL)discardable
{
  if (!(self->_flags >> 40))
  {
    BOOL v3 = discardable;
    [(NSUndoManager *)self _prepareEventGrouping];
    uint64_t v6 = 16;
    if ((self->_flags & 0x100000000) == 0) {
      uint64_t v6 = 8;
    }
    uint64_t v7 = *(Class *)((char *)&self->super.isa + v6);
    if (![v7 nestingLevel])
    {
      uint64_t v8 = NSStringFromSelector(a2);
      uint64_t v9 = (objc_class *)objc_opt_class();
      int v10 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %@ %p is in invalid state, must begin a group before setting undo action discardability\n", v8, NSStringFromClass(v9), self), 0 reason userInfo];
      objc_exception_throw(v10);
    }
    [v7 setDiscardable:v3];
  }
}

- (BOOL)undoActionIsDiscardable
{
  return [(_NSUndoStack *)self->_undoStack isDiscardable];
}

- (BOOL)redoActionIsDiscardable
{
  return [(_NSUndoStack *)self->_redoStack isDiscardable];
}

- (void)setActionUserInfoValue:(id)a3 forKey:(id)a4
{
  if (!(self->_flags >> 40))
  {
    [(NSUndoManager *)self _prepareEventGrouping];
    uint64_t v8 = 16;
    if ((self->_flags & 0x100000000) == 0) {
      uint64_t v8 = 8;
    }
    uint64_t v9 = *(Class *)((char *)&self->super.isa + v8);
    if (![v9 nestingLevel])
    {
      uint64_t v12 = NSStringFromSelector(a2);
      v13 = (objc_class *)objc_opt_class();
      v14 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %@ %p is in invalid state, must begin a group before setting undo action user info\n", v12, NSStringFromClass(v13), self), 0 reason userInfo];
      objc_exception_throw(v14);
    }
    if ([v9 userInfo])
    {
      int v10 = (void *)[v9 userInfo];
      [v10 setObject:a3 forKey:a4];
    }
    else
    {
      uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", a3, a4, 0);
      [v9 setUserInfo:v11];
    }
  }
}

- (id)undoActionUserInfoValueForKey:(id)a3
{
  id v4 = [(_NSUndoStack *)self->_undoStack userInfo];

  return (id)[v4 objectForKey:a3];
}

- (id)redoActionUserInfoValueForKey:(id)a3
{
  id v4 = [(_NSUndoStack *)self->_redoStack userInfo];

  return (id)[v4 objectForKey:a3];
}

- (NSString)undoMenuItemTitle
{
  if ([(NSUndoManager *)self canUndo]
    && (BOOL v3 = [(NSUndoManager *)self undoActionName],
        ![(NSString *)v3 isEqual:&stru_1ECA5C228]))
  {
    return [(NSUndoManager *)self undoMenuTitleForUndoActionName:v3];
  }
  else
  {
    id v4 = (void *)_NSFoundationBundle();
    return (NSString *)[v4 localizedStringForKey:@"Undo" value:&stru_1ECA5C228 table:@"Undo"];
  }
}

- (NSString)redoMenuItemTitle
{
  if ([(NSUndoManager *)self canRedo]
    && (BOOL v3 = [(NSUndoManager *)self redoActionName],
        ![(NSString *)v3 isEqual:&stru_1ECA5C228]))
  {
    return [(NSUndoManager *)self redoMenuTitleForUndoActionName:v3];
  }
  else
  {
    id v4 = (void *)_NSFoundationBundle();
    return (NSString *)[v4 localizedStringForKey:@"Redo" value:&stru_1ECA5C228 table:@"Undo"];
  }
}

- (NSString)undoMenuTitleForUndoActionName:(NSString *)actionName
{
  CFStringRef v4 = (const __CFString *)[(id)_NSFoundationBundle() localizedStringForKey:@"Undo %@" value:&stru_1ECA5C228 table:@"Undo"];
  id v5 = (__CFString *)CFStringCreateWithFormat(0, 0, v4, actionName);

  return (NSString *)v5;
}

- (NSString)redoMenuTitleForUndoActionName:(NSString *)actionName
{
  CFStringRef v4 = (const __CFString *)[(id)_NSFoundationBundle() localizedStringForKey:@"Redo %@" value:&stru_1ECA5C228 table:@"Undo"];
  id v5 = (__CFString *)CFStringCreateWithFormat(0, 0, v4, actionName);

  return (NSString *)v5;
}

- (id)_undoStack
{
  return self->_undoStack;
}

- (BOOL)_shouldCoalesceTypingForText:(id)a3 :(id)a4
{
  uint64_t v6 = objc_msgSend(-[NSUndoManager _undoStack](self, "_undoStack"), "topUndoObject");
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    while ((id)[v7 target] != a4
         || object_getClass(v7) != (Class)_NSUndoLightInvocation
         || (id)[v7 _argument] != a3)
    {
      LODWORD(v6) = [v7 isEndMark];
      if (!v6) {
        return v6;
      }
      uint64_t v7 = (void *)v7[1];
      if (!v7)
      {
        LOBYTE(v6) = 0;
        return v6;
      }
    }
    LOBYTE(v6) = 1;
  }
  return v6;
}

+ (void)_setEndsTopLevelGroupingsAfterRunLoopIterations:(BOOL)a3
{
  NSUndoManagerEndsTopLevelGroupingsAfterRunLoopIterations = a3;
}

- (void)_processEndOfEventNotification:(id)a3
{
  unint64_t flags = self->_flags;
  if ((~flags & 0x5000000000) == 0)
  {
    self->_unint64_t flags = flags & 0xFFFFFFEFFFFFFFFFLL;
    [(NSUndoManager *)self endUndoGrouping];
  }
}

+ (void)_endTopLevelGroupings
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!+[NSThread isMainThread]) {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInMethod:a2 object:a1 file:@"NSUndoManager.m" lineNumber:1158 description:@"+[NSUndoManager(NSInternal) _endTopLevelGroupings] is only safe to invoke on the main thread."];
  }
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_5_1);
  CFStringRef v4 = (void *)qword_1EB1ECB90;
  qword_1EB1ECB90 = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_5_1);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v9 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v8++) _processEndOfEventNotification:0];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v9 count:16];
    }
    while (v6);
  }
}

- (void)_commitUndoGrouping
{
  if (!(self->_flags >> 40)) {
    [(NSUndoManager *)self _endUndoGroupRemovingIfEmpty:1];
  }
}

- (void)_rollbackUndoGrouping
{
  if (!(self->_flags >> 40)
    && [(NSUndoManager *)self _endUndoGroupRemovingIfEmpty:1])
  {
    [(NSUndoManager *)self disableUndoRegistration];
    [(NSUndoManager *)self undoNestedGroup];
    [(NSUndoManager *)self enableUndoRegistration];
  }
}

@end