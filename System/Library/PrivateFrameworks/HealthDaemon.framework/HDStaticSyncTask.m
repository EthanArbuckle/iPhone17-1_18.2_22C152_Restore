@interface HDStaticSyncTask
- (HDStaticSyncTask)initWithProfile:(id)a3 options:(unint64_t)a4 storeIdentifier:(id)a5;
- (id)runWithCompletion:(id)a3;
@end

@implementation HDStaticSyncTask

- (HDStaticSyncTask)initWithProfile:(id)a3 options:(unint64_t)a4 storeIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HDStaticSyncTask;
  v10 = [(HDStaticSyncTask *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_profile, v8);
    v11->_options = a4;
    uint64_t v12 = HKCreateSerialDispatchQueue();
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v12;

    if (!v9)
    {
      id v9 = [MEMORY[0x1E4F29128] UUID];
    }
    objc_storeStrong((id *)&v11->_storeIdentifier, v9);
  }

  return v11;
}

- (id)runWithCompletion:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  v3 = (void *)MEMORY[0x1E4F28F90];

  return (id)[v3 discreteProgressWithTotalUnitCount:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end