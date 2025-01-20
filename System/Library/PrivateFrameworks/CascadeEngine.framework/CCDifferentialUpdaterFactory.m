@interface CCDifferentialUpdaterFactory
- (CCDifferentialUpdaterFactory)initWithWriteAccess:(id)a3 changeNotifier:(id)a4 timeout:(double)a5;
- (id)updaterForSet:(id)a3 withRequest:(id)a4;
@end

@implementation CCDifferentialUpdaterFactory

- (id)updaterForSet:(id)a3 withRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  writeAccess = self->_writeAccess;
  v9 = [v7 accessAssertion];
  v10 = [(CCDataResourceWriteAccess *)writeAccess setWriterForSet:v6 accessAssertion:v9];

  if (v10)
  {
    v11 = +[CCDifferentialUpdater updaterForSet:v6 withRequest:v7 setWriter:v10 changeNotifier:self->_changeNotifier timeout:self->_timeout];
  }
  else
  {
    v12 = __biome_log_for_category();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CCDifferentialUpdaterFactory updaterForSet:withRequest:]();
    }

    v11 = 0;
  }

  return v11;
}

- (CCDifferentialUpdaterFactory)initWithWriteAccess:(id)a3 changeNotifier:(id)a4 timeout:(double)a5
{
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CCDifferentialUpdaterFactory;
  v11 = [(CCDifferentialUpdaterFactory *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_writeAccess, a3);
    if (!v12->_writeAccess)
    {
      v13 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v12->_changeNotifier, a4);
    v12->_timeout = a5;
  }
  v13 = v12;
LABEL_6:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localDevice, 0);
  objc_storeStrong((id *)&self->_changeNotifier, 0);
  objc_storeStrong((id *)&self->_writeAccess, 0);
}

- (void)updaterForSet:withRequest:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_8_0(&dword_249B69000, v0, v1, "Failed to obtain data resource writer for set: %@, request: %@");
}

@end