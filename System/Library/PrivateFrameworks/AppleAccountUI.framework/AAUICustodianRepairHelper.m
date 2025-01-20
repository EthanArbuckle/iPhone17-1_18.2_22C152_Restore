@interface AAUICustodianRepairHelper
- (AAUICustodianDataDelegate)dataDelegate;
- (AAUIRepairDelegate)repairDelegate;
- (NSArray)localContacts;
- (void)setDataDelegate:(id)a3;
- (void)setLocalContacts:(id)a3;
- (void)setRepairDelegate:(id)a3;
@end

@implementation AAUICustodianRepairHelper

- (void)setLocalContacts:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_localContacts, a3);
  v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[AAUICustodianRepairHelper setLocalContacts:](v5, v6);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataDelegate);
  [WeakRetained didFinishFetchingCustodians];
}

- (void)setDataDelegate:(id)a3
{
  p_dataDelegate = &self->_dataDelegate;
  objc_storeWeak((id *)&self->_dataDelegate, a3);
  if ([(NSArray *)self->_localContacts count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)p_dataDelegate);
    [WeakRetained didFinishFetchingCustodians];
  }
}

- (NSArray)localContacts
{
  return self->_localContacts;
}

- (AAUICustodianDataDelegate)dataDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataDelegate);
  return (AAUICustodianDataDelegate *)WeakRetained;
}

- (AAUIRepairDelegate)repairDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_repairDelegate);
  return (AAUIRepairDelegate *)WeakRetained;
}

- (void)setRepairDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_repairDelegate);
  objc_destroyWeak((id *)&self->_dataDelegate);
  objc_storeStrong((id *)&self->_localContacts, 0);
}

- (void)setLocalContacts:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 134217984;
  uint64_t v4 = [a1 count];
  _os_log_debug_impl(&dword_209754000, a2, OS_LOG_TYPE_DEBUG, "Setting %lu Local Contacts in Data Fetcher", (uint8_t *)&v3, 0xCu);
}

@end