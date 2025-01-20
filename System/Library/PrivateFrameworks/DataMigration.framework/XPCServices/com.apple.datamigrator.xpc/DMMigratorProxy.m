@interface DMMigratorProxy
- (DMMigratorProxy)initWithConnection:(id)a3;
- (void)handleMessage:(id)a3;
@end

@implementation DMMigratorProxy

- (DMMigratorProxy)initWithConnection:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DMMigratorProxy;
  v3 = [(DMMigratorProxy *)&v7 initWithConnection:a3];
  if (v3)
  {
    v4 = objc_alloc_init(DMMigrator);
    migrator = v3->_migrator;
    v3->_migrator = v4;
  }
  return v3;
}

- (void)handleMessage:(id)a3
{
  id v4 = a3;
  int64_t int64 = xpc_dictionary_get_int64(v4, "msgID");
  uint64_t v6 = OBJC_IVAR___DMXPCConnection__connection;
  uint64_t pid = xpc_connection_get_pid(*(xpc_connection_t *)&self->DMXPCConnection_opaque[OBJC_IVAR___DMXPCConnection__connection]);
  v8 = +[NSNumber numberWithLongLong:int64];
  +[NSNumber numberWithInt:pid];
  v87 = v85 = v8;
  id v82 = v4;
  _DMLogFunc();

  uint64_t v119 = 0;
  v120 = &v119;
  uint64_t v121 = 0x3032000000;
  v122 = sub_100005350;
  v123 = sub_10000EAC0;
  id v124 = 0;
  dispatch_time_t v9 = dispatch_time(0, 10500000000);
  v112[0] = _NSConcreteStackBlock;
  v112[1] = 3221225472;
  v112[2] = sub_100006C20;
  v112[3] = &unk_1000249D0;
  id v10 = v4;
  int v118 = pid;
  int64_t v116 = int64;
  dispatch_time_t v117 = v9;
  id v113 = v10;
  v114 = self;
  v115 = &v119;
  v11 = objc_retainBlock(v112);
  switch(int64)
  {
    case 0:
      BOOL v12 = xpc_dictionary_get_BOOL(v10, "checkNecessity");
      string = xpc_dictionary_get_string(v10, "lastRelevantPlugin");
      if (string)
      {
        +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string, v82, v85, v87);
        id v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v14 = 0;
      }
      BOOL v76 = xpc_dictionary_get_BOOL(v10, "testMigrationInfrastructureOnly");
      v86 = string;
      _DMLogFunc();
      uint64_t v77 = os_transaction_create();
      v78 = (void *)v120[5];
      v120[5] = v77;

      migrator = self->_migrator;
      uint64_t v80 = *(void *)&self->DMXPCConnection_opaque[v6];
      v108[0] = _NSConcreteStackBlock;
      v108[1] = 3221225472;
      v108[2] = sub_10000ECD8;
      v108[3] = &unk_1000249F8;
      int v111 = pid;
      id v109 = v10;
      v110 = self;
      -[DMMigrator migrateCheckingNecessity:lastRelevantPlugin:testMigrationInfrastructureOnly:connection:migrationResultHandler:](migrator, "migrateCheckingNecessity:lastRelevantPlugin:testMigrationInfrastructureOnly:connection:migrationResultHandler:", v12, v14, v76, v80, v108, v14, v86);
      v106[0] = 0;
      v106[1] = v106;
      v106[2] = 0x3032000000;
      v106[3] = sub_100005350;
      v106[4] = sub_10000EAC0;
      id v107 = (id)os_transaction_create();
      dispatch_time_t v81 = dispatch_time(0, 3000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000EDBC;
      block[3] = &unk_100024790;
      block[4] = v106;
      dispatch_after(v81, (dispatch_queue_t)&_dispatch_main_q, block);
      ((void (*)(void *))v11[2])(v11);
      _Block_object_dispose(v106, 8);

      xpc_object_t v18 = v109;
      goto LABEL_40;
    case 1:
      uint64_t v15 = os_transaction_create();
      v16 = (void *)v120[5];
      v120[5] = v15;

      v17 = [(DMMigrator *)self->_migrator orderedPluginIdentifiers];
      xpc_object_t v18 = xpc_array_create(0, 0);
      long long v103 = 0u;
      long long v104 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      id v14 = v17;
      id v19 = [v14 countByEnumeratingWithState:&v101 objects:v127 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v102;
        do
        {
          for (i = 0; i != v19; i = (char *)i + 1)
          {
            if (*(void *)v102 != v20) {
              objc_enumerationMutation(v14);
            }
            xpc_array_set_string(v18, 0xFFFFFFFFFFFFFFFFLL, (const char *)[*(id *)(*((void *)&v101 + 1) + 8 * i) UTF8String]);
          }
          id v19 = [v14 countByEnumeratingWithState:&v101 objects:v127 count:16];
        }
        while (v19);
      }

      xpc_object_t reply = xpc_dictionary_create_reply(v10);
      xpc_dictionary_set_value(reply, "results", v18);
      xpc_dictionary_get_remote_connection(v10);
      v23 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      xpc_connection_send_message(v23, reply);
      ((void (*)(void *))v11[2])(v11);

      goto LABEL_40;
    case 2:
      BOOL v24 = xpc_dictionary_get_BOOL(v10, "invert");
      BOOL v25 = xpc_dictionary_get_BOOL(v10, "progress");
      uint64_t v26 = os_transaction_create();
      v27 = (void *)v120[5];
      v120[5] = v26;

      -[DMMigrator testMigrationUIWithProgress:forceInvert:completion:](self->_migrator, "testMigrationUIWithProgress:forceInvert:completion:", v25, v24, v11, v82, v85, v87);
      break;
    case 3:
      BOOL v28 = xpc_dictionary_get_BOOL(v10, "visible");
      uint64_t v29 = os_transaction_create();
      v30 = (void *)v120[5];
      v120[5] = v29;

      v31 = +[NSNotificationCenter defaultCenter];
      v32 = kDMMigratorChangeProgressWindowVisibilityNotification;
      v125 = kDMMigratorProgressWindowVisibility;
      v33 = +[NSNumber numberWithBool:v28];
      v126 = v33;
      v34 = +[NSDictionary dictionaryWithObjects:&v126 forKeys:&v125 count:1];
      [v31 postNotificationName:v32 object:0 userInfo:v34];

      id v14 = xpc_dictionary_create_reply(v10);
      xpc_dictionary_set_BOOL(v14, "success", 1);
      xpc_connection_send_message(*(xpc_connection_t *)&self->DMXPCConnection_opaque[v6], v14);
      v35 = +[NSNumber numberWithLongLong:3];
      v88 = +[NSNumber numberWithInt:pid];
      _DMLogFunc();

      ((void (*)(void *))v11[2])(v11);
      goto LABEL_41;
    case 4:
      uint64_t v36 = os_transaction_create();
      v37 = (void *)v120[5];
      v120[5] = v36;

      -[DMMigrator forceMigrationOnNextRebootWithUserDataDisposition:](self->_migrator, "forceMigrationOnNextRebootWithUserDataDisposition:", xpc_dictionary_get_uint64(v10, "disposition"), v82, v85, v87);
      id v14 = xpc_dictionary_create_reply(v10);
      xpc_connection_send_message(*(xpc_connection_t *)&self->DMXPCConnection_opaque[v6], v14);
      ((void (*)(void *))v11[2])(v11);
      goto LABEL_41;
    case 5:
      uint64_t v54 = os_transaction_create();
      v55 = (void *)v120[5];
      v120[5] = v54;

      BOOL v56 = -[DMMigrator isMigrationNeeded:](self->_migrator, "isMigrationNeeded:", pid, v82, v85, v87);
      id v14 = xpc_dictionary_create_reply(v10);
      xpc_dictionary_set_BOOL(v14, "isMigrationNeeded", v56);
      xpc_connection_send_message(*(xpc_connection_t *)&self->DMXPCConnection_opaque[v6], v14);
      v57 = +[NSNumber numberWithLongLong:5];
      v58 = +[NSNumber numberWithInt:pid];
      _DMLogFunc();

      ((void (*)(void *))v11[2])(v11);
      goto LABEL_41;
    case 6:
      uint64_t v59 = os_transaction_create();
      v60 = (void *)v120[5];
      v120[5] = v59;

      unsigned int v61 = [(DMMigrator *)self->_migrator userDataDisposition];
      id v14 = xpc_dictionary_create_reply(v10);
      xpc_dictionary_set_uint64(v14, "disposition", v61);
      xpc_connection_send_message(*(xpc_connection_t *)&self->DMXPCConnection_opaque[v6], v14);
      v62 = +[NSNumber numberWithLongLong:6];
      v93 = +[NSNumber numberWithInt:pid];
      _DMLogFunc();

      ((void (*)(void *))v11[2])(v11);
      goto LABEL_41;
    case 7:
      uint64_t v38 = os_transaction_create();
      v39 = (void *)v120[5];
      v120[5] = v38;

      id v14 = [(DMMigrator *)self->_migrator previousBuildVersion];
      xpc_object_t v18 = xpc_dictionary_create_reply(v10);
      if (v14) {
        xpc_dictionary_set_string(v18, "previousBuildVersion", (const char *)[v14 UTF8String]);
      }
      xpc_connection_send_message(*(xpc_connection_t *)&self->DMXPCConnection_opaque[v6], v18);
      v40 = +[NSNumber numberWithLongLong:7];
      v89 = +[NSNumber numberWithInt:pid];
      _DMLogFunc();

      ((void (*)(void *))v11[2])(v11);
      goto LABEL_40;
    case 8:
      uint64_t v63 = os_transaction_create();
      v64 = (void *)v120[5];
      v120[5] = v63;

      [(DMMigrator *)self->_migrator reportMigrationFailure];
      id v14 = xpc_dictionary_create_reply(v10);
      xpc_connection_send_message(*(xpc_connection_t *)&self->DMXPCConnection_opaque[v6], v14);
      v65 = +[NSNumber numberWithLongLong:8];
      v94 = +[NSNumber numberWithInt:pid];
      _DMLogFunc();

      ((void (*)(void *))v11[2])(v11);
      goto LABEL_41;
    case 9:
      uint64_t v41 = os_transaction_create();
      v42 = (void *)v120[5];
      v120[5] = v41;

      id v14 = [(DMMigrator *)self->_migrator migrationPhaseDescription];
      xpc_object_t v18 = xpc_dictionary_create_reply(v10);
      if (v14) {
        xpc_dictionary_set_string(v18, "description", (const char *)[v14 UTF8String]);
      }
      xpc_connection_send_message(*(xpc_connection_t *)&self->DMXPCConnection_opaque[v6], v18);
      v43 = +[NSNumber numberWithLongLong:9];
      v90 = +[NSNumber numberWithInt:pid];
      _DMLogFunc();

      ((void (*)(void *))v11[2])(v11);
      goto LABEL_40;
    case 10:
      uint64_t v66 = os_transaction_create();
      v67 = (void *)v120[5];
      v120[5] = v66;

      id v14 = [(DMMigrator *)self->_migrator migrationPluginResults];
      xpc_object_t v18 = xpc_dictionary_create_reply(v10);
      if (v14)
      {
        id v99 = 0;
        v68 = +[NSKeyedArchiver archivedDataWithRootObject:v14 requiringSecureCoding:1 error:&v99];
        id v97 = v99;
        id v83 = [v68 length];
        _DMLogFunc();
        if (objc_msgSend(v68, "length", v83, v97))
        {
          id v69 = v68;
          xpc_dictionary_set_data(v18, "results", [v69 bytes], (size_t)objc_msgSend(v69, "length"));
        }
      }
      xpc_connection_send_message(*(xpc_connection_t *)&self->DMXPCConnection_opaque[v6], v18);
      v70 = +[NSNumber numberWithLongLong:10];
      v95 = +[NSNumber numberWithInt:pid];
      _DMLogFunc();

      ((void (*)(void *))v11[2])(v11);
      goto LABEL_40;
    case 11:
      uint64_t v44 = os_transaction_create();
      v45 = (void *)v120[5];
      v120[5] = v44;

      id v46 = objc_alloc_init((Class)DMMigrationDeferredExitManager);
      objc_msgSend(v46, "deferExitWithConnection:", self, v82, v85, v87);

      id v14 = xpc_dictionary_create_reply(v10);
      xpc_connection_send_message(*(xpc_connection_t *)&self->DMXPCConnection_opaque[v6], v14);
      v47 = +[NSNumber numberWithLongLong:11];
      v91 = +[NSNumber numberWithInt:pid];
      _DMLogFunc();

      ((void (*)(void *))v11[2])(v11);
      goto LABEL_41;
    case 12:
      uint64_t v48 = os_transaction_create();
      v49 = (void *)v120[5];
      v120[5] = v48;

      id v50 = objc_alloc_init((Class)DMMigrationDeferredExitManager);
      objc_msgSend(v50, "cancelDeferredExitWithConnection:", self, v82, v85, v87);

      id v14 = xpc_dictionary_create_reply(v10);
      xpc_connection_send_message(*(xpc_connection_t *)&self->DMXPCConnection_opaque[v6], v14);
      v51 = +[NSNumber numberWithLongLong:12];
      v92 = +[NSNumber numberWithInt:pid];
      _DMLogFunc();

      ((void (*)(void *))v11[2])(v11);
      goto LABEL_41;
    case 13:
      uint64_t v71 = os_transaction_create();
      v72 = (void *)v120[5];
      v120[5] = v71;

      id v14 = [(DMMigrator *)self->_migrator userDataDispositionAuxiliaryData];
      xpc_object_t v18 = xpc_dictionary_create_reply(v10);
      if (v14)
      {
        id v100 = 0;
        v73 = +[NSKeyedArchiver archivedDataWithRootObject:v14 requiringSecureCoding:1 error:&v100];
        id v98 = v100;
        id v84 = [v73 length];
        _DMLogFunc();
        if (objc_msgSend(v73, "length", v84, v98))
        {
          id v74 = v73;
          xpc_dictionary_set_data(v18, "dispositionAuxiliaryData", [v74 bytes], (size_t)objc_msgSend(v74, "length"));
        }
      }
      xpc_connection_send_message(*(xpc_connection_t *)&self->DMXPCConnection_opaque[v6], v18);
      v75 = +[NSNumber numberWithLongLong:13];
      v96 = +[NSNumber numberWithInt:pid];
      _DMLogFunc();

      ((void (*)(void *))v11[2])(v11);
LABEL_40:

      goto LABEL_41;
    case 14:
      uint64_t v52 = os_transaction_create();
      v53 = (void *)v120[5];
      v120[5] = v52;

      [(DMMigrator *)self->_migrator progressHostIsReady];
      id v14 = xpc_dictionary_create_reply(v10);
      xpc_connection_send_message(*(xpc_connection_t *)&self->DMXPCConnection_opaque[v6], v14);
      ((void (*)(void *))v11[2])(v11);
LABEL_41:

      break;
    default:
      _DMLogFunc();
      break;
  }

  _Block_object_dispose(&v119, 8);
}

- (void).cxx_destruct
{
}

@end