@interface NSObtainingEndpointState
- (void)addError:(int64_t)a3 description:(const char *)a4 forListenerNamed:(id)a5 fromServiceNamed:(id)a6;
- (void)whileHoldingLock:(id)a3;
@end

@implementation NSObtainingEndpointState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->message, 0);
  objc_storeStrong((id *)&self->listenerName, 0);
  objc_storeStrong((id *)&self->connection, 0);

  objc_storeStrong((id *)&self->errors, 0);
}

- (void)addError:(int64_t)a3 description:(const char *)a4 forListenerNamed:(id)a5 fromServiceNamed:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v16 = +[NSString stringWithUTF8String:a4];
  v12 = sub_1000052EC(a3, v16, v10, v11);

  errors = self->errors;
  if (!errors)
  {
    v14 = +[NSMutableArray arrayWithCapacity:2];
    v15 = self->errors;
    self->errors = v14;

    errors = self->errors;
  }
  [(NSMutableArray *)errors addObject:v12];
}

- (void)whileHoldingLock:(id)a3
{
}

@end