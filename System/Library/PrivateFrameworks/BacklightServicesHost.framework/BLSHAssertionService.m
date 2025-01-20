@interface BLSHAssertionService
+ (BLSHAssertionService)serviceWithOSInterfaceProvider:(id)a3 localOnly:(BOOL)a4;
- (BLSHAssertionService)initWithOSInterfaceProvider:(id)a3 localOnly:(BOOL)a4;
- (BLSHLocalAssertionService)localAssertionService;
@end

@implementation BLSHAssertionService

+ (BLSHAssertionService)serviceWithOSInterfaceProvider:(id)a3 localOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithOSInterfaceProvider:v6 localOnly:v4];

  return (BLSHAssertionService *)v7;
}

- (BLSHAssertionService)initWithOSInterfaceProvider:(id)a3 localOnly:(BOOL)a4
{
  id v6 = a3;
  v32.receiver = self;
  v32.super_class = (Class)BLSHAssertionService;
  v7 = [(BLSHAssertionService *)&v32 init];
  if (v7)
  {
    v8 = [[BLSHLocalAssertionService alloc] initWithOSInterfaceProvider:v6];
    [MEMORY[0x263F29960] setDefaultService:v8];
    objc_storeStrong((id *)&v7->_localAssertionService, v8);
    if (!a4)
    {
      uint64_t v9 = +[BLSHXPCAssertionServiceHostServer serverWithLocalAssertionService:v8];
      server = v7->_server;
      v7->_server = (BLSHXPCAssertionServiceHostServer *)v9;
    }
    uint64_t v11 = +[BLSHLocalAssertionAttributeHandler registerHandlerForService:v8];
    if (v11)
    {
      v12 = (void *)v11;
      v13 = +[BLSHLocalAssertionAttributeHandler registerHandlerForService:v8];

      if (!v13)
      {
        v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"handler != nil"];
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[BLSHAssertionService initWithOSInterfaceProvider:localOnly:]();
        }
        [v24 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x21FD75448);
      }
      v14 = +[BLSHLocalAssertionAttributeHandler registerHandlerForService:v8];

      if (!v14)
      {
        v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"handler != nil"];
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[BLSHAssertionService initWithOSInterfaceProvider:localOnly:]();
        }
        [v25 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x21FD754ACLL);
      }
      v15 = +[BLSHLocalAssertionAttributeHandler registerHandlerForService:v8];

      if (!v15)
      {
        v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"handler != nil"];
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[BLSHAssertionService initWithOSInterfaceProvider:localOnly:].cold.4();
        }
        [v26 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x21FD75510);
      }
      v16 = +[BLSHLocalAssertionAttributeHandler registerHandlerForService:v8];

      if (!v16)
      {
        v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"handler != nil"];
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[BLSHAssertionService initWithOSInterfaceProvider:localOnly:].cold.5();
        }
        [v27 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x21FD75574);
      }
      v17 = +[BLSHLocalAssertionAttributeHandler registerHandlerForService:v8];

      if (!v17)
      {
        v28 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"handler != nil"];
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[BLSHAssertionService initWithOSInterfaceProvider:localOnly:].cold.6();
        }
        [v28 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x21FD755D8);
      }
      v18 = +[BLSHLocalAssertionAttributeHandler registerHandlerForService:v8];

      if (!v18)
      {
        v29 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"handler != nil"];
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[BLSHAssertionService initWithOSInterfaceProvider:localOnly:].cold.7();
        }
        [v29 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x21FD7563CLL);
      }
      v19 = +[BLSHLocalAssertionAttributeHandler registerHandlerForService:v8];

      if (!v19)
      {
        v30 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"handler != nil"];
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[BLSHAssertionService initWithOSInterfaceProvider:localOnly:].cold.8();
        }
        [v30 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x21FD756A0);
      }
      v20 = +[BLSHLocalAssertionAttributeHandler registerHandlerForService:v8];

      if (!v20)
      {
        v31 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"handler != nil"];
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[BLSHAssertionService initWithOSInterfaceProvider:localOnly:].cold.9();
        }
        [v31 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x21FD75704);
      }
      v21 = +[BLSHLocalAssertionAttributeHandler registerHandlerForService:v8];

      if (v21)
      {

        goto LABEL_15;
      }
      v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"handler != nil"];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[BLSHAssertionService initWithOSInterfaceProvider:localOnly:]0();
      }
    }
    else
    {
      v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"handler != nil"];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[BLSHAssertionService initWithOSInterfaceProvider:localOnly:]();
      }
    }
    [v23 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21FD753E4);
  }
LABEL_15:

  return v7;
}

- (BLSHLocalAssertionService)localAssertionService
{
  return self->_localAssertionService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localAssertionService, 0);

  objc_storeStrong((id *)&self->_server, 0);
}

- (void)initWithOSInterfaceProvider:localOnly:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithOSInterfaceProvider:localOnly:.cold.2()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithOSInterfaceProvider:localOnly:.cold.3()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithOSInterfaceProvider:localOnly:.cold.4()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithOSInterfaceProvider:localOnly:.cold.5()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithOSInterfaceProvider:localOnly:.cold.6()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithOSInterfaceProvider:localOnly:.cold.7()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithOSInterfaceProvider:localOnly:.cold.8()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithOSInterfaceProvider:localOnly:.cold.9()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithOSInterfaceProvider:localOnly:.cold.10()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end