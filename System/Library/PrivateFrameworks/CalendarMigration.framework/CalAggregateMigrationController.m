@interface CalAggregateMigrationController
- (BOOL)shouldPerformMigration;
- (CalAggregateMigrationController)initWithControllers:(id)a3;
- (NSArray)controllers;
- (void)migrationDidFinishWithResult:(unint64_t)a3;
@end

@implementation CalAggregateMigrationController

- (CalAggregateMigrationController)initWithControllers:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CalAggregateMigrationController;
  v5 = [(CalAggregateMigrationController *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    controllers = v5->_controllers;
    v5->_controllers = (NSArray *)v6;
  }
  return v5;
}

- (BOOL)shouldPerformMigration
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(CalAggregateMigrationController *)self controllers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) shouldPerformMigration])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)migrationDidFinishWithResult:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [(CalAggregateMigrationController *)self controllers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) migrationDidFinishWithResult:a3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (NSArray)controllers
{
  return self->_controllers;
}

- (void).cxx_destruct
{
}

@end