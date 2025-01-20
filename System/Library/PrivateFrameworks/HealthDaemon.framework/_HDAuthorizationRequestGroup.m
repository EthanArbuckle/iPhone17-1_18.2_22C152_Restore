@interface _HDAuthorizationRequestGroup
- (BOOL)promptIfNecessaryWithTimeout:(double)a3 completion:;
- (id)bundleIdentifier;
- (id)description;
- (void)cancelRequestsWithIdentifiers:(void *)a3 error:;
@end

@implementation _HDAuthorizationRequestGroup

- (void)cancelRequestsWithIdentifiers:(void *)a3 error:
{
  id v11 = a2;
  id v5 = a3;
  if (a1)
  {
    uint64_t v6 = [*(id *)(a1 + 32) count];
    if (v6)
    {
      uint64_t v7 = v6 - 1;
      do
      {
        uint64_t v8 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v7];
        v9 = (void *)v8;
        if (v8) {
          uint64_t v10 = *(void *)(v8 + 16);
        }
        else {
          uint64_t v10 = 0;
        }
        if ([v11 containsObject:v10])
        {
          [*(id *)(a1 + 32) removeObjectAtIndex:v7];
          -[_HDAuthorizationRequest invokeCompletionHandlerWithSuccess:error:]((uint64_t)v9, 0, v5);
        }

        --v7;
      }
      while (v7 != -1);
    }
  }
}

- (id)bundleIdentifier
{
  if (a1)
  {
    a1 = [a1[7] bundleIdentifier];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (BOOL)promptIfNecessaryWithTimeout:(double)a3 completion:
{
  id v5 = a2;
  if (!v5)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:sel_promptIfNecessaryWithTimeout_completion_, a1, @"HDAuthorizationManager.m", 1760, @"Invalid parameter not satisfying: %@", @"completion != NULL" object file lineNumber description];
  }
  uint64_t v6 = (void (**)(id, void *, id))*(id *)(a1 + 72);
  if (v6 && !*(void *)(a1 + 64))
  {
    uint64_t v7 = dispatch_get_global_queue(21, 0);
    dispatch_source_t v8 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v7);
    v9 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = v8;

    uint64_t v10 = *(NSObject **)(a1 + 48);
    dispatch_time_t v11 = dispatch_time(0, (unint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0);
    v12 = *(NSObject **)(a1 + 48);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __72___HDAuthorizationRequestGroup_promptIfNecessaryWithTimeout_completion___block_invoke;
    handler[3] = &unk_1E62F2F20;
    id v13 = v5;
    id v26 = v13;
    dispatch_source_set_event_handler(v12, handler);
    dispatch_resume(*(dispatch_object_t *)(a1 + 48));
    uint64_t v14 = [MEMORY[0x1E4F29128] UUID];
    v15 = *(void **)(a1 + 64);
    *(void *)(a1 + 64) = v14;

    id v16 = objc_alloc(MEMORY[0x1E4F2AC60]);
    uint64_t v17 = *(void *)(a1 + 56);
    uint64_t v18 = *(void *)(a1 + 64);
    uint64_t v19 = *(void *)(a1 + 8);
    id v20 = *(id *)(a1 + 16);
    v21 = (void *)[v16 initWithSource:v17 session:v18 readTypes:v20 writeTypes:v19];

    v6[2](v6, v21, v13);
  }
  uint64_t v22 = *(void *)(a1 + 64);

  return v22 != 0;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(HKSource *)self->_source bundleIdentifier];
  uint64_t v6 = [(NSMutableArray *)self->_requests count];
  uint64_t v7 = [(NSUUID *)self->_promptSessionIdentifier UUIDString];
  dispatch_source_t v8 = (void *)v7;
  if (self->_inTransaction) {
    v9 = "YES";
  }
  else {
    v9 = "NO";
  }
  uint64_t v10 = [v3 stringWithFormat:@"<%@:%p source:\"%@\" requests:%lu prompt:%@ transaction:%s>", v4, self, v5, v6, v7, v9, 0];

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_promptHandler, 0);
  objc_storeStrong((id *)&self->_promptSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_sessionTimeoutSource, 0);
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_typesToRead, 0);

  objc_storeStrong((id *)&self->_typesToWrite, 0);
}

@end