@interface RestoreApplicationsRequestTask
- (void)main;
@end

@implementation RestoreApplicationsRequestTask

- (void)main
{
  v3 = objc_alloc_init(_TtC9appstored6LogKey);
  if (self) {
    options = self->super._options;
  }
  else {
    options = 0;
  }
  v5 = options;
  v6 = [(ASDRequestOptions *)v5 items];

  v7 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 count];
    if (self) {
      client = self->super._client;
    }
    else {
      client = 0;
    }
    v10 = client;
    v11 = [(XPCClient *)v10 clientID];
    *(_DWORD *)buf = 138412802;
    v47 = v3;
    __int16 v48 = 2048;
    id v49 = v8;
    __int16 v50 = 2114;
    v51 = v11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%@] Restoring %ld app(s) for client: %{public}@", buf, 0x20u);
  }
  if (self) {
    v12 = self->super._options;
  }
  else {
    v12 = 0;
  }
  v13 = v12;
  unsigned int v14 = [(ASDRequestOptions *)v13 createsPlaceholders];

  if (v14)
  {
    if ([v6 count])
    {
      v15 = [objc_alloc((Class)ASDCreatePlaceholdersRequestOptions) initWithApplicationMetadata:v6];
      if (self) {
        v16 = self->super._options;
      }
      else {
        v16 = 0;
      }
      v17 = v16;
      [v15 setCompleteDataPromise:[(ASDRequestOptions *)v17 completeDataPromise]];

      if (os_variant_has_internal_content())
      {
        if (self) {
          v18 = self->super._options;
        }
        else {
          v18 = 0;
        }
        v19 = v18;
        [v15 setCreateAsMobileBackup:[(ASDRequestOptions *)v19 createAsMobileBackup]];
      }
      v20 = [CreatePlaceholdersRequestTask alloc];
      if (self) {
        v21 = self->super._client;
      }
      else {
        v21 = 0;
      }
      v22 = v21;
      id v23 = [(CreatePlaceholdersRequestTask *)v20 initForClient:v22 withOptions:v15];

      id v45 = 0;
      [(Task *)self runSubTask:v23 returningError:&v45];
      v24 = (_TtC9appstored6LogKey *)v45;
      if (v24)
      {
        v25 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v47 = v24;
          _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Error creating coordinators error: %{public}@", buf, 0xCu);
        }
      }
    }
    else
    {
      v15 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "No items to restore", buf, 2u);
      }
      v24 = 0;
    }
  }
  else
  {
    v24 = 0;
  }
  if (self) {
    v26 = self->super._options;
  }
  else {
    v26 = 0;
  }
  v27 = v26;
  unsigned int v28 = [(ASDRequestOptions *)v27 skipCoordinatorCompletion];

  if (v28)
  {
    ASDLogHandleForCategory();
    v29 = (CompleteRestoreCoordinatorsTask *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v29->super.super.super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, &v29->super.super.super, OS_LOG_TYPE_DEFAULT, "Skipping coordinator completion", buf, 2u);
    }
  }
  else
  {
    v29 = objc_alloc_init(CompleteRestoreCoordinatorsTask);
    if (self) {
      v30 = self->super._client;
    }
    else {
      v30 = 0;
    }
    v31 = v30;
    v32 = [(XPCClient *)v31 clientID];
    v34 = v32;
    if (v29)
    {
      objc_setProperty_nonatomic_copy(v29, v33, v32, 40);

      objc_setProperty_nonatomic_copy(v29, v35, v3, 48);
    }
    else
    {
    }
    if (self) {
      v36 = self->super._client;
    }
    else {
      v36 = 0;
    }
    v37 = v36;
    v38 = [(XPCClient *)v37 clientID];
    v40 = +[NSString stringWithFormat:@"Restore applications request for client %@", v38];
    if (v29) {
      objc_setProperty_nonatomic_copy(v29, v39, v40, 56);
    }

    uint64_t v41 = sub_1002B2A3C();
    v42 = (void *)v41;
    if (v41) {
      [*(id *)(v41 + 8) addOperation:v29];
    }
  }
  id v43 = [objc_alloc((Class)ASDRestoreApplicationsRequestResponse) initWithResults:&__NSArray0__struct];
  sub_1000079C8(self, v43);

  if (self)
  {
    self->super.super._success = v24 == 0;
    objc_setProperty_atomic_copy(self, v44, v24, 32);
  }
}

@end