@interface WOWorkoutQueryServer
+ (id)serverWithClient:(id)a3 profile:(id)a4 error:(id *)a5;
- (BOOL)_validateConfigurations:(id)a3 withPersistenceType:(unint64_t)a4 error:(id *)a5;
- (HDProfile)profile;
- (HDXPCClient)client;
- (NSString)temporaryString;
- (WOWorkoutQueryServer)initWithClient:(id)a3 profile:(id)a4;
- (id)_statePredicateForClass:(Class)a3 state:(unint64_t)a4;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)_delete:(id)a3 ofType:(unint64_t)a4 withCompletion:(id)a5;
- (void)_deleteConfigurations:(id)a3 ofType:(unint64_t)a4 withCompletion:(id)a5;
- (void)_deleteExternalProvidersWithSourceIdentifier:(id)a3 completion:(id)a4;
- (void)_deleteManagedFromSource:(id)a3 withCompletion:(id)a4;
- (void)_fetch:(id)a3 ofType:(unint64_t)a4 state:(unint64_t)a5 withCompletion:(id)a6;
- (void)_fetchAll:(unint64_t)a3 withCompletion:(id)a4;
- (void)_fetchManagedFromSource:(id)a3 withCompletion:(id)a4;
- (void)_fetchProtoAll:(unint64_t)a3 state:(unint64_t)a4 withCompletion:(id)a5;
- (void)_fetchProviderWithSourceIdentifier:(id)a3 withCompletion:(id)a4;
- (void)_save:(id)a3 withCompletion:(id)a4;
- (void)_saveConfigurations:(id)a3 ofType:(unint64_t)a4 withCompletion:(id)a5;
- (void)connectionInvalidated;
- (void)remote_addManagedConfigurations:(id)a3 withCompletion:(id)a4;
- (void)remote_deleteConfiguration:(id)a3 withCompletion:(id)a4;
- (void)remote_deleteExternalProvider:(id)a3 withCompletion:(id)a4;
- (void)remote_deleteManagedConfigurations:(id)a3 withCompletion:(id)a4;
- (void)remote_fetchAllConfigurationsAsSerializedPersistenceWithCompletion:(id)a3;
- (void)remote_fetchAllDeletedConfigurationsAsSerializedPersistenceWithCompletion:(id)a3;
- (void)remote_fetchAllExternalProvidersWithCompletion:(id)a3;
- (void)remote_fetchConfiguration:(id)a3 withCompletion:(id)a4;
- (void)remote_fetchDeletedConfiguration:(id)a3 withCompletion:(id)a4;
- (void)remote_fetchManagedConfigurationsByProviderWithCompletion:(id)a3;
- (void)remote_removeManagedConfigurations:(id)a3 withCompletion:(id)a4;
- (void)remote_saveConfiguration:(id)a3 withCompletion:(id)a4;
- (void)remote_saveConfigurations:(id)a3 withCompletion:(id)a4;
- (void)remote_setManagedConfigurations:(id)a3 withCompletion:(id)a4;
- (void)setClient:(id)a3;
- (void)setProfile:(id)a3;
- (void)setTemporaryString:(id)a3;
@end

@implementation WOWorkoutQueryServer

+ (id)serverWithClient:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 process];
  LODWORD(a5) = [v9 hasRequiredEntitlement:HKPrivateHealthKitEntitlement error:a5];

  if (a5)
  {
    v10 = [[WOWorkoutQueryServer alloc] initWithClient:v7 profile:v8];
  }
  else
  {
    _HKInitializeLogging();
    v11 = HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Failing for client without private health kit entitlement.", v13, 2u);
    }
    v10 = 0;
  }

  return v10;
}

- (WOWorkoutQueryServer)initWithClient:(id)a3 profile:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)WOWorkoutQueryServer;
  id v8 = [(WOWorkoutQueryServer *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(WOWorkoutQueryServer *)v8 setClient:v6];
    [(WOWorkoutQueryServer *)v9 setProfile:v7];
  }

  return v9;
}

- (id)remoteInterface
{
  return 0;
}

- (id)exportedInterface
{
  return (id)_WOWorkoutServerInterface(self, a2);
}

- (void)connectionInvalidated
{
  id v3 = [(WOWorkoutQueryServer *)self client];
  v2 = [v3 connection];
  [v2 invalidate];
}

- (void)_fetchAll:(unint64_t)a3 withCompletion:(id)a4
{
  id v6 = a4;
  Class v7 = +[WOWorkoutEntity classForPersistenceType:a3];
  id v8 = +[NSMutableArray array];
  v9 = [(HDProfile *)self->_profile database];
  id v19 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_78FC;
  v15[3] = &unk_14A20;
  v15[4] = self;
  Class v17 = v7;
  unint64_t v18 = a3;
  id v10 = v8;
  id v16 = v10;
  LOBYTE(v7) = [(objc_class *)v7 performReadTransactionWithHealthDatabase:v9 error:&v19 block:v15];
  id v11 = v19;

  if (v7)
  {
    id v12 = v6;
    v13 = v10;
    id v14 = 0;
  }
  else
  {
    v13 = &__NSArray0__struct;
    id v12 = v6;
    id v14 = v11;
  }
  (*((void (**)(id, void *, id))v6 + 2))(v12, v13, v14);
}

- (void)_fetchProtoAll:(unint64_t)a3 state:(unint64_t)a4 withCompletion:(id)a5
{
  id v8 = (void (**)(id, id, id))a5;
  v9 = +[WOWorkoutEntity classForPersistenceType:a3];
  id v10 = objc_opt_new();
  id v11 = [(HDProfile *)self->_profile database];
  unint64_t v20 = a3;
  id v21 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_7C20;
  v16[3] = &unk_14A48;
  v16[4] = self;
  unint64_t v18 = v9;
  unint64_t v19 = a4;
  id v12 = v10;
  id v17 = v12;
  LOBYTE(self) = [(objc_class *)v9 performReadTransactionWithHealthDatabase:v11 error:&v21 block:v16];
  id v13 = v21;

  if (self)
  {
    id v14 = v12;
    id v15 = 0;
  }
  else
  {
    id v14 = 0;
    id v15 = v13;
  }
  v8[2](v8, v14, v15);
}

- (void)_fetch:(id)a3 ofType:(unint64_t)a4 state:(unint64_t)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = (void (**)(id, void, id))a6;
  id v12 = +[WOWorkoutEntity classForPersistenceType:a4];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_7FA8;
  v30 = sub_7FB8;
  id v31 = 0;
  id v13 = [(HDProfile *)self->_profile database];
  id v25 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_7FC0;
  v18[3] = &unk_14A70;
  v22 = v12;
  id v14 = v10;
  id v19 = v14;
  unint64_t v20 = self;
  unint64_t v23 = a5;
  unint64_t v24 = a4;
  id v21 = &v26;
  LODWORD(a4) = [(objc_class *)v12 performReadTransactionWithHealthDatabase:v13 error:&v25 block:v18];
  id v15 = v25;

  if (a4)
  {
    id v16 = 0;
    uint64_t v17 = v27[5];
  }
  else
  {
    uint64_t v17 = 0;
    id v16 = v15;
  }
  v11[2](v11, v17, v16);

  _Block_object_dispose(&v26, 8);
}

- (void)_fetchManagedFromSource:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_class();
  v9 = +[WOWorkoutManagedConfigurationEntity propertyForManagedSourceIdentifier];
  uint64_t v10 = +[NSMutableArray array];
  id v11 = [(HDProfile *)self->_profile database];
  id v25 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_8380;
  v19[3] = &unk_14AC0;
  id v12 = v9;
  id v20 = v12;
  id v13 = v6;
  id v21 = v13;
  v22 = self;
  unint64_t v24 = v8;
  id v14 = (id)v10;
  id v23 = v14;
  LOBYTE(v10) = [v8 performReadTransactionWithHealthDatabase:v11 error:&v25 block:v19];
  id v15 = v25;

  if (v10)
  {
    id v16 = v7;
    uint64_t v17 = v14;
    id v18 = 0;
  }
  else
  {
    uint64_t v17 = &__NSArray0__struct;
    id v16 = v7;
    id v18 = v15;
  }
  (*((void (**)(id, void *, id))v7 + 2))(v16, v17, v18);
}

- (void)remote_fetchAllConfigurationsAsSerializedPersistenceWithCompletion:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_8634;
  v5[3] = &unk_14AE8;
  id v6 = a3;
  id v4 = v6;
  [(WOWorkoutQueryServer *)self _fetchProtoAll:2 state:0 withCompletion:v5];
}

- (void)remote_fetchAllDeletedConfigurationsAsSerializedPersistenceWithCompletion:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_8770;
  v5[3] = &unk_14AE8;
  id v6 = a3;
  id v4 = v6;
  [(WOWorkoutQueryServer *)self _fetchProtoAll:2 state:1 withCompletion:v5];
}

- (void)remote_fetchConfiguration:(id)a3 withCompletion:(id)a4
{
}

- (void)remote_fetchDeletedConfiguration:(id)a3 withCompletion:(id)a4
{
}

- (void)remote_deleteConfiguration:(id)a3 withCompletion:(id)a4
{
}

- (void)_save:(id)a3 withCompletion:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSArray arrayWithObjects:&v10 count:1];
  id v9 = objc_msgSend(v7, "type", v10);

  [(WOWorkoutQueryServer *)self _saveConfigurations:v8 ofType:v9 withCompletion:v6];
}

- (void)_saveConfigurations:(id)a3 ofType:(unint64_t)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, uint64_t, void))a5;
  id v22 = 0;
  unsigned __int8 v10 = [(WOWorkoutQueryServer *)self _validateConfigurations:v8 withPersistenceType:a4 error:&v22];
  id v11 = v22;
  if (v10)
  {
    Class v12 = +[WOWorkoutEntity classForPersistenceType:a4];
    id v13 = [(HDProfile *)self->_profile database];
    id v21 = v11;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_8A80;
    v17[3] = &unk_14B38;
    id v19 = self;
    Class v20 = v12;
    id v18 = v8;
    LOBYTE(v12) = [(objc_class *)v12 performWriteTransactionWithHealthDatabase:v13 error:&v21 block:v17];
    id v14 = v21;

    if (v12)
    {
      uint64_t v15 = 1;
      id v16 = 0;
    }
    else
    {
      uint64_t v15 = 0;
      id v16 = v14;
    }
    ((void (**)(id, uint64_t, id))v9)[2](v9, v15, v16);
  }
  else
  {
    ((void (**)(id, uint64_t, id))v9)[2](v9, 0, v11);
    id v14 = v11;
  }
}

- (void)remote_saveConfiguration:(id)a3 withCompletion:(id)a4
{
  id v8 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  if ((char *)[v8 type] - 2 > (unsigned char *)&dword_0 + 2)
  {
    id v7 = +[NSError hk_error:3 description:@"Expected a persistable configuration object."];
    v6[2](v6, 0, v7);
  }
  else
  {
    [(WOWorkoutQueryServer *)self _save:v8 withCompletion:v6];
  }
}

- (void)remote_saveConfigurations:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if ([v6 count])
  {
    id v8 = [v6 firstObject];
    id v9 = [v8 type];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v10 = v6;
    id v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v17;
      while (2)
      {
        id v14 = 0;
        do
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          if (objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * (void)v14), "type", (void)v16) != v9)
          {
            uint64_t v15 = +[NSError hk_error:3 description:@"Expected configurations with the same persistence type."];
            v7[2](v7, 0, v15);

            goto LABEL_13;
          }
          id v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    [(WOWorkoutQueryServer *)self _saveConfigurations:v10 ofType:v9 withCompletion:v7];
  }
  else
  {
    v7[2](v7, 1, 0);
  }
LABEL_13:
}

- (void)remote_deleteManagedConfigurations:(id)a3 withCompletion:(id)a4
{
}

- (void)remote_deleteExternalProvider:(id)a3 withCompletion:(id)a4
{
}

- (void)remote_fetchManagedConfigurationsByProviderWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = dispatch_group_create();
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = sub_7FA8;
  v26[4] = sub_7FB8;
  id v27 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = sub_7FA8;
  v24[4] = sub_7FB8;
  id v25 = (id)objc_opt_new();
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = sub_7FA8;
  v22[4] = sub_7FB8;
  id v23 = 0;
  dispatch_group_enter(v5);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_925C;
  v18[3] = &unk_14B60;
  Class v20 = v26;
  id v21 = v22;
  id v6 = v5;
  long long v19 = v6;
  [(WOWorkoutQueryServer *)self _fetchAll:3 withCompletion:v18];
  dispatch_group_enter(v6);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_92F0;
  v14[3] = &unk_14B60;
  long long v16 = v22;
  long long v17 = v24;
  id v7 = v6;
  uint64_t v15 = v7;
  [(WOWorkoutQueryServer *)self _fetchAll:4 withCompletion:v14];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_9498;
  v9[3] = &unk_14B88;
  id v10 = v4;
  id v11 = v22;
  id v12 = v26;
  uint64_t v13 = v24;
  id v8 = v4;
  dispatch_group_notify(v7, (dispatch_queue_t)&_dispatch_main_q, v9);

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);

  _Block_object_dispose(v26, 8);
}

- (void)remote_addManagedConfigurations:(id)a3 withCompletion:(id)a4
{
}

- (void)remote_removeManagedConfigurations:(id)a3 withCompletion:(id)a4
{
}

- (void)remote_setManagedConfigurations:(id)a3 withCompletion:(id)a4
{
}

- (void)remote_fetchAllExternalProvidersWithCompletion:(id)a3
{
}

- (id)_statePredicateForClass:(Class)a3 state:(unint64_t)a4
{
  id v6 = [(objc_class *)a3 propertyForObjectState];
  id v7 = +[NSNumber numberWithUnsignedInteger:a4];
  id v8 = +[HDSQLiteComparisonPredicate predicateWithProperty:v6 equalToValue:v7];

  if ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()])
  {
    id v9 = [(objc_class *)a3 propertyForConfigurationType];
    id v10 = +[HDSQLiteComparisonPredicate predicateWithProperty:v9 notEqualToValue:&off_159F8];

    id v11 = +[HDSQLitePredicate compoundPredicateWithPredicate:v10 otherPredicate:v8];
  }
  else
  {
    id v11 = v8;
  }

  return v11;
}

- (void)_fetchProviderWithSourceIdentifier:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  id v8 = objc_opt_class();
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = sub_7FA8;
  unint64_t v24 = sub_7FB8;
  id v25 = 0;
  id v9 = [(HDProfile *)self->_profile database];
  long long v18 = v8;
  id v19 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_9994;
  v14[3] = &unk_14BD8;
  id v10 = v6;
  id v15 = v10;
  long long v16 = self;
  long long v17 = &v20;
  LODWORD(v8) = [v8 performReadTransactionWithHealthDatabase:v9 error:&v19 block:v14];
  id v11 = v19;

  if (v8)
  {
    id v12 = 0;
    uint64_t v13 = v21[5];
  }
  else
  {
    uint64_t v13 = 0;
    id v12 = v11;
  }
  v7[2](v7, v13, v12);

  _Block_object_dispose(&v20, 8);
}

- (BOOL)_validateConfigurations:(id)a3 withPersistenceType:(unint64_t)a4 error:(id *)a5
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = a3;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        if ([*(id *)(*((void *)&v14 + 1) + 8 * i) type] != (id)a4)
        {
          if (a5)
          {
            id v12 = +[NSString stringWithFormat:@"unexpected persistence type: %lu", a4];
            *a5 = +[NSError hk_error:3 description:v12];

            LOBYTE(a5) = 0;
          }
          goto LABEL_12;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  LOBYTE(a5) = 1;
LABEL_12:

  return (char)a5;
}

- (void)_delete:(id)a3 ofType:(unint64_t)a4 withCompletion:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_9DE8;
  v9[3] = &unk_14C00;
  id v10 = a5;
  unint64_t v11 = a4;
  void v9[4] = self;
  id v8 = v10;
  [(WOWorkoutQueryServer *)self _fetch:a3 ofType:a4 state:0 withCompletion:v9];
}

- (void)_deleteManagedFromSource:(id)a3 withCompletion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_9F94;
  v8[3] = &unk_14C28;
  id v9 = a3;
  id v10 = self;
  id v11 = a4;
  id v6 = v11;
  id v7 = v9;
  [(WOWorkoutQueryServer *)self _fetchManagedFromSource:v7 withCompletion:v8];
}

- (void)_deleteExternalProvidersWithSourceIdentifier:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_A188;
  v8[3] = &unk_14C78;
  id v9 = a3;
  id v10 = self;
  id v11 = a4;
  id v6 = v11;
  id v7 = v9;
  [(WOWorkoutQueryServer *)self _fetchProviderWithSourceIdentifier:v7 withCompletion:v8];
}

- (void)_deleteConfigurations:(id)a3 ofType:(unint64_t)a4 withCompletion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = +[WOWorkoutEntity classForPersistenceType:a4];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        [v15 setObjectState:1];
        long long v16 = +[NSDate date];
        [v15 setObjectModificationDate:v16];

        [(objc_class *)v9 preparePersistenceForDelete:v15];
      }
      id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  [(WOWorkoutQueryServer *)self _saveConfigurations:v10 ofType:a4 withCompletion:v8];
}

- (HDXPCClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (HDProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
}

- (NSString)temporaryString
{
  return self->_temporaryString;
}

- (void)setTemporaryString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporaryString, 0);
  objc_storeStrong((id *)&self->_profile, 0);

  objc_storeStrong((id *)&self->_client, 0);
}

@end