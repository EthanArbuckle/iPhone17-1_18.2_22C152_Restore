@interface IOAccessorySystemStateEndpoint
- (IOAccessorySystemStateEndpoint)initWithService:(unsigned int)a3;
- (unsigned)connection;
- (unsigned)service;
- (void)dealloc;
- (void)notifyBootComplete;
- (void)notifyUserActive:(BOOL)a3;
- (void)notifyUserPresent:(BOOL)a3;
@end

@implementation IOAccessorySystemStateEndpoint

- (IOAccessorySystemStateEndpoint)initWithService:(unsigned int)a3
{
  kern_return_t v7;
  mach_error_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)IOAccessorySystemStateEndpoint;
  v4 = [(IOAccessorySystemStateEndpoint *)&v10 init];
  v5 = (io_connect_t *)v4;
  v6 = 0;
  if (a3 && v4)
  {
    v4->_service = a3;
    IOObjectRetain(a3);
    v7 = IOServiceOpen(a3, *MEMORY[0x1E4F14960], 0, v5 + 3);
    if (v7)
    {
      v8 = v7;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[IOAccessorySystemStateEndpoint initWithService:](v8);
      }
      v6 = 0;
    }
    else
    {
      v6 = v5;
    }
  }

  return v6;
}

- (void)dealloc
{
  io_connect_t connection = self->_connection;
  if (connection)
  {
    IOServiceClose(connection);
    self->_io_connect_t connection = 0;
  }
  io_object_t service = self->_service;
  if (service)
  {
    IOObjectRelease(service);
    self->_io_object_t service = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)IOAccessorySystemStateEndpoint;
  [(IOAccessorySystemStateEndpoint *)&v5 dealloc];
}

- (void)notifyBootComplete
{
  mach_error_string(a1);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1D9622000, MEMORY[0x1E4F14500], v1, "%s error %s", v2, v3, v4, v5, 2u);
}

- (void)notifyUserActive:(BOOL)a3
{
  kern_return_t v3;
  mach_error_t v4;
  uint64_t input;

  input = a3;
  uint64_t v3 = IOConnectCallMethod(self->_connection, 1u, &input, 1u, 0, 0, 0, 0, 0, 0);
  if (v3)
  {
    uint64_t v4 = v3;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[IOAccessorySystemStateEndpoint notifyUserActive:](v4);
    }
  }
}

- (void)notifyUserPresent:(BOOL)a3
{
  kern_return_t v3;
  mach_error_t v4;
  uint64_t input;

  input = a3;
  uint64_t v3 = IOConnectCallMethod(self->_connection, 2u, &input, 1u, 0, 0, 0, 0, 0, 0);
  if (v3)
  {
    uint64_t v4 = v3;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[IOAccessorySystemStateEndpoint notifyUserPresent:](v4);
    }
  }
}

- (unsigned)service
{
  return self->_service;
}

- (unsigned)connection
{
  return self->_connection;
}

- (void)initWithService:(mach_error_t)a1 .cold.1(mach_error_t a1)
{
  mach_error_string(a1);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1D9622000, MEMORY[0x1E4F14500], v1, "%s unable to open service (%s)", v2, v3, v4, v5, 2u);
}

- (void)notifyUserActive:(mach_error_t)a1 .cold.1(mach_error_t a1)
{
  mach_error_string(a1);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1D9622000, MEMORY[0x1E4F14500], v1, "%s error %s", v2, v3, v4, v5, 2u);
}

- (void)notifyUserPresent:(mach_error_t)a1 .cold.1(mach_error_t a1)
{
  mach_error_string(a1);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1D9622000, MEMORY[0x1E4F14500], v1, "%s error %s", v2, v3, v4, v5, 2u);
}

@end