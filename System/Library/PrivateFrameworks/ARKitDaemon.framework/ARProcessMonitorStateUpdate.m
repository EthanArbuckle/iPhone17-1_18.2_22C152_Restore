@interface ARProcessMonitorStateUpdate
- (ARProcessMonitorStateUpdate)initWithARProcessTaskState:(int64_t)a3;
- (ARProcessMonitorStateUpdate)initWithRBSProcessStateUpdate:(id)a3;
- (BOOL)isVisible;
- (NSString)name;
- (id)description;
- (int)pid;
- (int64_t)debugState;
- (int64_t)taskState;
@end

@implementation ARProcessMonitorStateUpdate

- (ARProcessMonitorStateUpdate)initWithRBSProcessStateUpdate:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ARProcessMonitorStateUpdate;
  v6 = [(ARProcessMonitorStateUpdate *)&v22 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_update, a3);
    v8 = [v5 process];
    v7->_pid = [v8 pid];

    v9 = [v5 process];
    v10 = [v9 name];
    uint64_t v11 = [v10 copy];
    name = v7->_name;
    v7->_name = (NSString *)v11;

    v13 = [v5 state];
    v14 = [v13 endowmentNamespaces];
    v7->_BOOL isVisible = [v14 containsObject:@"com.apple.frontboard.visibility"];

    v15 = [v5 state];
    BOOL isVisible = v7->_isVisible;
    switch([v15 taskState])
    {
      case 1u:
        uint64_t v17 = 1;
        break;
      case 2u:
      case 4u:
        uint64_t v17 = 3;
        if (!isVisible) {
          uint64_t v17 = 4;
        }
        break;
      case 3u:
        uint64_t v17 = 2;
        break;
      default:
        uint64_t v17 = 0;
        break;
    }
    v7->_taskState = v17;

    v18 = [v5 state];
    int v19 = [v18 debugState];
    if ((v19 - 1) < 3) {
      uint64_t v20 = (v19 - 1) + 1;
    }
    else {
      uint64_t v20 = 0;
    }
    v7->_debugState = v20;
  }
  return v7;
}

- (ARProcessMonitorStateUpdate)initWithARProcessTaskState:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ARProcessMonitorStateUpdate;
  result = [(ARProcessMonitorStateUpdate *)&v5 init];
  if (result) {
    result->_taskState = a3;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = (void *)v5;
  unint64_t v7 = self->_taskState - 1;
  if (v7 > 3) {
    v8 = @"ARProcessTaskStateUnknown";
  }
  else {
    v8 = off_265206F18[v7];
  }
  unint64_t v9 = self->_debugState - 1;
  if (v9 > 2) {
    v10 = @"ARProcessDebugStateUnknown";
  }
  else {
    v10 = off_265206F38[v9];
  }
  if (self->_isVisible) {
    uint64_t v11 = @"YES";
  }
  else {
    uint64_t v11 = @"NO";
  }
  v12 = [v3 stringWithFormat:@"<%@: %p | %@(%d) visible=%@ taskState=%@ debugState=%@", v5, self, self->_name, self->_pid, v11, v8, v10];

  return v12;
}

- (NSString)name
{
  return self->_name;
}

- (int)pid
{
  return self->_pid;
}

- (int64_t)taskState
{
  return self->_taskState;
}

- (int64_t)debugState
{
  return self->_debugState;
}

- (BOOL)isVisible
{
  return self->_isVisible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_update, 0);
}

@end