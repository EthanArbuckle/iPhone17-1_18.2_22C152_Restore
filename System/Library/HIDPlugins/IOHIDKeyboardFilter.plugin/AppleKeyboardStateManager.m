@interface AppleKeyboardStateManager
+ (id)sharedManager;
- (AppleKeyboardStateManager)init;
- (BOOL)isCapsLockEnabled:(id)a3;
- (NSMutableSet)capsLockStateTable;
- (void)setCapsLockEnabled:(BOOL)a3 locationID:(id)a4;
- (void)setCapsLockStateTable:(id)a3;
@end

@implementation AppleKeyboardStateManager

+ (id)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2407A5318;
  block[3] = &unk_2650D5FC8;
  block[4] = a1;
  if (qword_268C8F798 != -1) {
    dispatch_once(&qword_268C8F798, block);
  }
  v2 = (void *)qword_268C8F790;

  return v2;
}

- (AppleKeyboardStateManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)AppleKeyboardStateManager;
  v2 = [(AppleKeyboardStateManager *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    capsLockStateTable = v2->_capsLockStateTable;
    v2->_capsLockStateTable = (NSMutableSet *)v3;

    v5 = v2;
  }

  return v2;
}

- (BOOL)isCapsLockEnabled:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    char v6 = [(NSMutableSet *)v5->_capsLockStateTable containsObject:v4];
    objc_sync_exit(v5);
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)setCapsLockEnabled:(BOOL)a3 locationID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v6)
  {
    id v9 = v6;
    objc_super v7 = self;
    objc_sync_enter(v7);
    capsLockStateTable = v7->_capsLockStateTable;
    if (v4) {
      [(NSMutableSet *)capsLockStateTable addObject:v9];
    }
    else {
      [(NSMutableSet *)capsLockStateTable removeObject:v9];
    }
    objc_sync_exit(v7);

    id v6 = v9;
  }
}

- (NSMutableSet)capsLockStateTable
{
  return self->_capsLockStateTable;
}

- (void)setCapsLockStateTable:(id)a3
{
}

- (void).cxx_destruct
{
}

@end