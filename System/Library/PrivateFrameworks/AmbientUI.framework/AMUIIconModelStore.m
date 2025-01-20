@interface AMUIIconModelStore
- (AMUIIconModelStoreDelegate)iconModelStoreDelegate;
- (BOOL)deleteCurrentIconStateWithOptions:(unint64_t)a3 error:(id *)a4;
- (BOOL)deleteDesiredIconStateWithOptions:(unint64_t)a3 error:(id *)a4;
- (BOOL)saveCurrentIconState:(id)a3 error:(id *)a4;
- (BOOL)saveDesiredIconState:(id)a3 error:(id *)a4;
- (PRSPosterConfiguration)posterConfiguration;
- (id)loadCurrentIconState:(id *)a3;
- (id)loadDesiredIconState:(id *)a3;
- (void)setIconModelStoreDelegate:(id)a3;
- (void)setPosterConfiguration:(id)a3;
@end

@implementation AMUIIconModelStore

- (BOOL)saveCurrentIconState:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(AMUIIconModelStore *)self iconModelStoreDelegate];
  id v14 = 0;
  char v8 = [v7 iconModelStore:self saveIconState:v6 toPosterConfigurationWithError:&v14];

  id v9 = v14;
  v10 = v9;
  if ((v8 & 1) == 0)
  {
    id v11 = v9;
    *a4 = v11;
    v12 = AMUILogInfograph();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[AMUIIconModelStore saveCurrentIconState:error:]((uint64_t)v11, v12);
    }
  }
  return v8;
}

- (BOOL)saveDesiredIconState:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)deleteCurrentIconStateWithOptions:(unint64_t)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)deleteDesiredIconStateWithOptions:(unint64_t)a3 error:(id *)a4
{
  return 0;
}

- (id)loadCurrentIconState:(id *)a3
{
  v5 = [(AMUIIconModelStore *)self iconModelStoreDelegate];
  id v10 = 0;
  id v6 = [v5 iconModelStore:self loadIconStateFromPosterConfigurationWithError:&v10];
  id v7 = v10;
  if (!v6)
  {
    char v8 = AMUILogInfograph();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[AMUIIconModelStore loadCurrentIconState:]((uint64_t)v7, v8);
    }

    if (v7) {
      *a3 = v7;
    }
  }

  return v6;
}

- (id)loadDesiredIconState:(id *)a3
{
  return 0;
}

- (AMUIIconModelStoreDelegate)iconModelStoreDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconModelStoreDelegate);

  return (AMUIIconModelStoreDelegate *)WeakRetained;
}

- (void)setIconModelStoreDelegate:(id)a3
{
}

- (PRSPosterConfiguration)posterConfiguration
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_posterConfiguration);

  return (PRSPosterConfiguration *)WeakRetained;
}

- (void)setPosterConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_posterConfiguration);

  objc_destroyWeak((id *)&self->_iconModelStoreDelegate);
}

- (void)saveCurrentIconState:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_247837000, a2, OS_LOG_TYPE_ERROR, "Failed to save icon state in poster configuration withError:%@", (uint8_t *)&v2, 0xCu);
}

- (void)loadCurrentIconState:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_247837000, a2, OS_LOG_TYPE_ERROR, "Received nil icon state from poster configuration with error:%@", (uint8_t *)&v2, 0xCu);
}

@end