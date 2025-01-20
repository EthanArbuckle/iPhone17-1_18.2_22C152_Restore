@interface IDSFeatureToggler
- (IDSFeatureToggler)initWithService:(id)a3 queue:(id)a4;
- (NSString)service;
- (OS_dispatch_queue)queue;
- (void)retrieveFeatureToggleStateForOptions:(id)a3 completion:(id)a4;
- (void)setQueue:(id)a3;
- (void)setService:(id)a3;
- (void)updateFeatureToggleStateWithOptions:(id)a3 completion:(id)a4;
@end

@implementation IDSFeatureToggler

- (IDSFeatureToggler)initWithService:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7 && v8)
  {
    v15.receiver = self;
    v15.super_class = (Class)IDSFeatureToggler;
    v10 = [(IDSFeatureToggler *)&v15 init];
    p_isa = (id *)&v10->super.isa;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_service, a3);
      objc_storeStrong(p_isa + 2, a4);
    }
    self = p_isa;
    v12 = self;
  }
  else
  {
    v13 = [MEMORY[0x1E4F6B460] FeatureToggler];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      sub_191A42778();
    }

    v12 = 0;
  }

  return v12;
}

- (void)retrieveFeatureToggleStateForOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = sub_191A12B80;
    v17[3] = &unk_1E572D508;
    v17[4] = self;
    id v18 = v7;
    v9 = (void (**)(void, void))MEMORY[0x192FE03B0](v17);
    if (v6
      && ([v6 featureID], v10 = objc_claimAutoreleasedReturnValue(), v10, v10))
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = sub_191A12C58;
      v14[3] = &unk_1E572A8F0;
      v14[4] = self;
      v16 = v9;
      id v15 = v6;
      +[IDSXPCDaemonController performDaemonControllerTask:v14];
    }
    else
    {
      v11 = [MEMORY[0x1E4F6B460] FeatureToggler];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_191A427EC();
      }

      v12 = +[IDSFeatureToggleRetrievalResult resultWithError:1];
      ((void (**)(void, void *))v9)[2](v9, v12);
    }
  }
  else
  {
    v13 = [MEMORY[0x1E4F6B460] FeatureToggler];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_191A427B8();
    }
  }
}

- (void)updateFeatureToggleStateWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = sub_191A1305C;
    v17[3] = &unk_1E572D530;
    v17[4] = self;
    id v18 = v7;
    v9 = (void (**)(void, void))MEMORY[0x192FE03B0](v17);
    if (v6
      && ([v6 featureID], v10 = objc_claimAutoreleasedReturnValue(), v10, v10))
    {
      if ([v6 state] == 1 || objc_msgSend(v6, "state") == 2)
      {
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = sub_191A13134;
        v14[3] = &unk_1E572A8F0;
        v14[4] = self;
        v16 = v9;
        id v15 = v6;
        +[IDSXPCDaemonController performDaemonControllerTask:v14];

LABEL_10:
        goto LABEL_14;
      }
      v11 = [MEMORY[0x1E4F6B460] FeatureToggler];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_191A42900(v6, v11);
      }
    }
    else
    {
      v11 = [MEMORY[0x1E4F6B460] FeatureToggler];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_191A428CC();
      }
    }

    v12 = +[IDSFeatureToggleUpdateResult resultWithError:1];
    ((void (**)(void, void *))v9)[2](v9, v12);

    goto LABEL_10;
  }
  v13 = [MEMORY[0x1E4F6B460] FeatureToggler];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_191A42898();
  }

LABEL_14:
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_service, 0);
}

@end