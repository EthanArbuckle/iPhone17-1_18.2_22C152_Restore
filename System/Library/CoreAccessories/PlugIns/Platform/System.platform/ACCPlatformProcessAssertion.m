@interface ACCPlatformProcessAssertion
- (ACCPlatformProcessAssertion)initWithBundleIdentifier:(id)a3 processAssertionName:(id)a4 rbsAttributes:(id)a5 pid:(int)a6;
- (OS_dispatch_source)processAssertionTimer;
- (unint64_t)startTime;
- (void)dealloc;
- (void)setProcessAssertionTimer:(id)a3;
- (void)setStartTime:(unint64_t)a3;
@end

@implementation ACCPlatformProcessAssertion

- (ACCPlatformProcessAssertion)initWithBundleIdentifier:(id)a3 processAssertionName:(id)a4 rbsAttributes:(id)a5 pid:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v10 = a3;
  v11 = (void *)MEMORY[0x263F64630];
  id v12 = a5;
  id v13 = a4;
  v14 = [v11 targetWithPid:v6];
  v28.receiver = self;
  v28.super_class = (Class)ACCPlatformProcessAssertion;
  id v15 = [(ACCPlatformProcessAssertion *)&v28 initWithExplanation:v13 target:v14 attributes:v12];

  id v27 = 0;
  int v16 = [v15 acquireWithError:&v27];
  id v17 = v27;
  if (gLogObjects) {
    BOOL v18 = gNumLogObjects <= 0;
  }
  else {
    BOOL v18 = 1;
  }
  int v19 = !v18;
  if (v16)
  {
    if (v19)
    {
      v20 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:]();
      }
      v20 = MEMORY[0x263EF8438];
      id v22 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v30 = v15;
      __int16 v31 = 2112;
      id v32 = v10;
      _os_log_impl(&dword_2249D5000, v20, OS_LOG_TYPE_DEFAULT, "Acquired EA application assertion: %@ for: %@", buf, 0x16u);
    }

    *((void *)v15 + 8) = time(0);
    dispatch_source_t v23 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
    v24 = (void *)*((void *)v15 + 9);
    *((void *)v15 + 9) = v23;

    dispatch_source_set_event_handler(*((dispatch_source_t *)v15 + 9), &__block_literal_global);
    dispatch_source_set_timer(*((dispatch_source_t *)v15 + 9), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume(*((dispatch_object_t *)v15 + 9));
  }
  else
  {
    if (v19)
    {
      v21 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:]();
      }
      v21 = MEMORY[0x263EF8438];
      id v25 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:]();
    }

    id v15 = 0;
  }

  return (ACCPlatformProcessAssertion *)v15;
}

- (void)dealloc
{
  [(ACCPlatformProcessAssertion *)self setStartTime:0];
  [(ACCPlatformProcessAssertion *)self invalidate];
  v3 = [(ACCPlatformProcessAssertion *)self processAssertionTimer];
  dispatch_source_cancel(v3);

  [(ACCPlatformProcessAssertion *)self setProcessAssertionTimer:0];
  v4.receiver = self;
  v4.super_class = (Class)ACCPlatformProcessAssertion;
  [(ACCPlatformProcessAssertion *)&v4 dealloc];
}

- (unint64_t)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(unint64_t)a3
{
  self->_startTime = a3;
}

- (OS_dispatch_source)processAssertionTimer
{
  return self->_processAssertionTimer;
}

- (void)setProcessAssertionTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2249D5000, MEMORY[0x263EF8438], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
}

- (void)initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_2249D5000, v0, v1, "Error acquiring app on wake jetsam assertion: %@", v2, v3, v4, v5, v6);
}

@end