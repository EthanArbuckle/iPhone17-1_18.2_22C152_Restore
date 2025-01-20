@interface _NSProgressWithRemoteParent
- (NSXPCConnection)parentConnection;
- (unint64_t)sequence;
- (void)_sendCancellableOrPausableUpdate:(BOOL)a3 stringKey:(const char *)a4 intKey:(int)a5;
- (void)_setCancellable:(BOOL)a3 fromChild:(BOOL)a4;
- (void)_setPausable:(BOOL)a3 fromChild:(BOOL)a4;
- (void)_setUserInfoValue:(id)a3 forKey:(id)a4 fromChild:(BOOL)a5;
- (void)_updateFractionCompleted:(_NSProgressFractionTuple *)a3;
- (void)dealloc;
- (void)setCancellable:(BOOL)a3;
- (void)setParentConnection:(id)a3;
- (void)setPausable:(BOOL)a3;
- (void)setSequence:(unint64_t)a3;
@end

@implementation _NSProgressWithRemoteParent

- (void)setSequence:(unint64_t)a3
{
  self->_sequence = a3;
}

- (void)setParentConnection:(id)a3
{
}

- (void)_updateFractionCompleted:(_NSProgressFractionTuple *)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)_NSProgressWithRemoteParent;
  long long v5 = *(_OWORD *)&a3->var0.overflowed;
  v9[0] = *(_OWORD *)&a3->var0.completed;
  v9[1] = v5;
  v9[2] = *(_OWORD *)&a3->var1.total;
  [(NSProgress *)&v10 _updateFractionCompleted:v9];
  if ((_NSProgressFractionIsEqual(&a3->var0.completed, &a3->var1.completed) & 1) == 0)
  {
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    uint64_t completed = a3->var1.completed;
    uint64_t total = a3->var1.total;
    xpc_dictionary_set_uint64(v6, "completedCount", completed);
    xpc_dictionary_set_uint64(v6, "totalCount", total);
    -[NSXPCConnection _sendProgressMessage:forSequence:]((uint64_t)self->_parentConnection, v6, self->_sequence);
    xpc_release(v6);
  }
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)_NSProgressWithRemoteParent;
  [(NSProgress *)&v3 dealloc];
}

- (void)_setUserInfoValue:(id)a3 forKey:(id)a4 fromChild:(BOOL)a5
{
  id v6 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)_NSProgressWithRemoteParent;
  [(NSProgress *)&v17 _setUserInfoValue:a3 forKey:a4 fromChild:a5];
  if ([a4 isEqualToString:@"NSProgressThroughputKey"])
  {
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v8, "isUserInfo", 1);
    if (v6)
    {
      if (_NSIsNSNumber()) {
        uint64_t v9 = [v6 unsignedLongLongValue];
      }
      else {
        uint64_t v9 = 0;
      }
      xpc_dictionary_set_uint64(v8, "userInfoVal", v9);
    }
    else
    {
      xpc_dictionary_set_BOOL(v8, "userInfoValNil", 1);
    }
    v12 = v8;
    uint64_t v13 = 1;
  }
  else if ([a4 isEqualToString:@"NSProgressEstimatedTimeRemainingKey"])
  {
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v8, "isUserInfo", 1);
    if (v6)
    {
      if (_NSIsNSNumber()) {
        uint64_t v10 = [v6 unsignedLongLongValue];
      }
      else {
        uint64_t v10 = 0;
      }
      xpc_dictionary_set_uint64(v8, "userInfoVal", v10);
    }
    else
    {
      xpc_dictionary_set_BOOL(v8, "userInfoValNil", 1);
    }
    v12 = v8;
    uint64_t v13 = 2;
  }
  else if ([a4 isEqualToString:@"_NSProgressRemoteLocalizedDescriptionKey"])
  {
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v8, "isUserInfo", 1);
    int v11 = _NSIsNSString();
    if (v6 && v11)
    {
      if ((unint64_t)[v6 length] >= 0x401) {
        id v6 = (id)objc_msgSend(v6, "substringWithRange:", 0, 1024);
      }
      xpc_dictionary_set_string(v8, "userInfoVal", (const char *)[v6 UTF8String]);
    }
    else
    {
      xpc_dictionary_set_BOOL(v8, "userInfoValNil", 1);
    }
    v12 = v8;
    uint64_t v13 = 3;
  }
  else if ([a4 isEqualToString:@"_NSProgressRemoteLocalizedAdditionalDescriptionKey"])
  {
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v8, "isUserInfo", 1);
    int v14 = _NSIsNSString();
    if (v6 && v14)
    {
      if ((unint64_t)[v6 length] >= 0x401) {
        id v6 = (id)objc_msgSend(v6, "substringWithRange:", 0, 1024);
      }
      xpc_dictionary_set_string(v8, "userInfoVal", (const char *)[v6 UTF8String]);
    }
    else
    {
      xpc_dictionary_set_BOOL(v8, "userInfoValNil", 1);
    }
    v12 = v8;
    uint64_t v13 = 4;
  }
  else if ([a4 isEqualToString:@"NSProgressFileCompletedCountKey"])
  {
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v8, "isUserInfo", 1);
    if (v6)
    {
      if (_NSIsNSNumber()) {
        uint64_t v15 = [v6 unsignedLongLongValue];
      }
      else {
        uint64_t v15 = 0;
      }
      xpc_dictionary_set_uint64(v8, "userInfoVal", v15);
    }
    else
    {
      xpc_dictionary_set_BOOL(v8, "userInfoValNil", 1);
    }
    v12 = v8;
    uint64_t v13 = 6;
  }
  else
  {
    if (![a4 isEqualToString:@"NSProgressFileTotalCountKey"]) {
      return;
    }
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v8, "isUserInfo", 1);
    if (v6)
    {
      if (_NSIsNSNumber()) {
        uint64_t v16 = [v6 unsignedLongLongValue];
      }
      else {
        uint64_t v16 = 0;
      }
      xpc_dictionary_set_uint64(v8, "userInfoVal", v16);
    }
    else
    {
      xpc_dictionary_set_BOOL(v8, "userInfoValNil", 1);
    }
    v12 = v8;
    uint64_t v13 = 5;
  }
  xpc_dictionary_set_uint64(v12, "userInfoKey", v13);
  if (v8)
  {
    -[NSXPCConnection _sendProgressMessage:forSequence:]((uint64_t)self->_parentConnection, v8, self->_sequence);
    xpc_release(v8);
  }
}

- (void)setCancellable:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)_NSProgressWithRemoteParent;
  -[NSProgress setCancellable:](&v5, sel_setCancellable_);
  [(_NSProgressWithRemoteParent *)self _sendCancellableOrPausableUpdate:v3 stringKey:"isCancellable" intKey:7];
}

- (void)_setCancellable:(BOOL)a3 fromChild:(BOOL)a4
{
}

- (void)setPausable:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)_NSProgressWithRemoteParent;
  -[NSProgress setPausable:](&v5, sel_setPausable_);
  [(_NSProgressWithRemoteParent *)self _sendCancellableOrPausableUpdate:v3 stringKey:"isPausable" intKey:8];
}

- (void)_setPausable:(BOOL)a3 fromChild:(BOOL)a4
{
}

- (void)_sendCancellableOrPausableUpdate:(BOOL)a3 stringKey:(const char *)a4 intKey:(int)a5
{
  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v9, "isUserInfo", 1);
  xpc_dictionary_set_uint64(v9, "userInfoKey", a5);
  xpc_dictionary_set_BOOL(v9, a4, a3);
  -[NSXPCConnection _sendProgressMessage:forSequence:]((uint64_t)self->_parentConnection, v9, self->_sequence);

  xpc_release(v9);
}

- (NSXPCConnection)parentConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 120, 1);
}

- (unint64_t)sequence
{
  return self->_sequence;
}

@end