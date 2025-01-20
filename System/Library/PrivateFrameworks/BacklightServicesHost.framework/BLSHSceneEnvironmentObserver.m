@interface BLSHSceneEnvironmentObserver
+ (id)observerWithObserver:(id)a3;
- (BLSHSceneEnvironmentObserver)initWithObserver:(id)a3;
- (NSString)description;
- (void)sceneDidInvalidate:(id)a3;
@end

@implementation BLSHSceneEnvironmentObserver

+ (id)observerWithObserver:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithObserver:v4];

  return v5;
}

- (BLSHSceneEnvironmentObserver)initWithObserver:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BLSHSceneEnvironmentObserver;
  v6 = [(BLSHSceneEnvironmentObserver *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_observer, a3);
  }

  return v7;
}

- (NSString)description
{
  v3 = objc_opt_new();
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  objc_super v9 = __43__BLSHSceneEnvironmentObserver_description__block_invoke;
  v10 = &unk_2645322D0;
  id v11 = v3;
  v12 = self;
  id v4 = v3;
  [v4 appendProem:self block:&v7];
  id v5 = objc_msgSend(v4, "description", v7, v8, v9, v10);

  return (NSString *)v5;
}

id __43__BLSHSceneEnvironmentObserver_description__block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"observer"];
}

- (void)sceneDidInvalidate:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identityToken];
  v6 = [v4 backlightSceneHostEnvironment];
  [(BLSHSceneEnvironmentObserving *)self->_observer sceneDidInvalidate:v5 environment:v6];
  [v4 removeObserver:self];

  uint64_t v7 = bls_assertions_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[BLSHSceneEnvironmentObserver sceneDidInvalidate:]();
  }
}

- (void).cxx_destruct
{
}

- (void)sceneDidInvalidate:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_21FCFC000, v0, OS_LOG_TYPE_DEBUG, "OSIP:%p sceneDidInvalidate:%{public}@", v1, 0x16u);
}

@end