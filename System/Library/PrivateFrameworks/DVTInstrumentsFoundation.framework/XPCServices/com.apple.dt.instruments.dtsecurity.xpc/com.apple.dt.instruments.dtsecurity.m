int main(int argc, const char **argv, const char **envp)
{
  NSObject *v3;
  uint8_t v4[16];

  if (qword_100019610 != -1) {
    dispatch_once(&qword_100019610, &stru_100014920);
  }
  v3 = qword_100019618;
  if (os_log_type_enabled((os_log_t)qword_100019618, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "dtsecurity started.", v4, 2u);
  }
  xpc_main((xpc_connection_handler_t)sub_100001D78);
}

id sub_100001D24()
{
  if (qword_100019610 != -1) {
    dispatch_once(&qword_100019610, &stru_100014920);
  }
  v0 = (void *)qword_100019618;
  return v0;
}

void sub_100001D78(void *a1)
{
  v1 = a1;
  if (qword_100019610 != -1) {
    dispatch_once(&qword_100019610, &stru_100014920);
  }
  v2 = (void *)qword_100019618;
  if (os_log_type_enabled((os_log_t)qword_100019618, OS_LOG_TYPE_INFO))
  {
    v3 = v2;
    *(_DWORD *)buf = 67109376;
    pid_t pid = xpc_connection_get_pid(v1);
    __int16 v12 = 2048;
    v13 = v1;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Peer connected (%d : %p)", buf, 0x12u);
  }
  v4 = (void *)xpc_connection_copy_entitlement_value();
  v5 = v4;
  if (v4 && xpc_get_type(v4) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v5))
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100001FB0;
    handler[3] = &unk_100014948;
    v6 = v1;
    v9 = v6;
    xpc_connection_set_event_handler(v6, handler);
    xpc_connection_activate(v6);
  }
  else
  {
    if (qword_100019610 != -1) {
      dispatch_once(&qword_100019610, &stru_100014920);
    }
    v7 = (void *)qword_100019618;
    if (os_log_type_enabled((os_log_t)qword_100019618, OS_LOG_TYPE_ERROR)) {
      sub_10000DCD0(v7, v1);
    }
    xpc_connection_cancel(v1);
  }
}

void sub_100001F6C(id a1)
{
  qword_100019618 = (uint64_t)os_log_create("com.apple.dt.Instruments", "dtsecurity");
  _objc_release_x1();
}

void sub_100001FB0(uint64_t a1, void *a2)
{
  kern_return_t v47;
  NSObject *v48;
  int v49;
  int v50;
  int v51;
  int v52;
  void *v53;
  const char *v54;
  const char *v55;
  NSObject *v56;
  unsigned int v57;
  const char *v58;
  const char *v59;
  mach_port_name_t v60;
  int v61;
  const uint8_t *uuid;
  unsigned char *v63;
  unsigned int v64;
  unsigned int v65;
  unsigned int v66;
  unsigned int v67;
  void *v68;
  uint64_t v69;
  DTCPUClusterInfo *v70;
  void *v71;
  id v72;
  NSObject *v73;
  NSObject *v74;
  pid_t pid;
  unsigned int v76;
  const void *data;
  NSObject *v78;
  uint64_t v79;
  const void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  NSObject *v85;
  unsigned __int8 v86;
  NSObject *v87;
  int v88;
  int v89;
  uint64_t v90;
  DTCPUClusterInfo *v91;
  DTCPUClusterInfo *v92;
  DTCPUClusterInfo *v93;
  _xpc_connection_s *v94;
  void *v95;
  id v96;
  void *v97;
  NSObject *v98;
  void *v99;
  id v100;
  const void *stackshot_buffer;
  unsigned int stackshot_size;
  const char *v103;
  _xpc_connection_s *v104;
  _xpc_connection_s *v105;
  int v106;
  int v107;
  xpc_object_t v108;
  xpc_object_t v109;
  id v110;
  mach_port_name_t name[2];
  __int16 v112;
  _xpc_connection_s *v113;
  __int16 v114;
  int v115;
  unsigned char buf[46];
  __int16 v117;
  const char *v118;
  __int16 v119;
  const char *v120;

  id v3 = a2;
  v4 = &selRef_targetWithPid_;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary)
  {
    __int16 v12 = (_xpc_connection_s *)*(id *)(a1 + 32);
    id v13 = v3;
    xpc_object_t reply = xpc_dictionary_create_reply(v13);
    string = xpc_dictionary_get_string(v13, "Message");
    if (!string)
    {
      if (qword_100019610 != -1) {
        dispatch_once(&qword_100019610, &stru_100014920);
      }
      v34 = qword_100019618;
      if (os_log_type_enabled((os_log_t)qword_100019618, OS_LOG_TYPE_ERROR)) {
        sub_10000DD78(v34);
      }
      goto LABEL_106;
    }
    v16 = string;
    if (qword_100019610 != -1) {
      dispatch_once(&qword_100019610, &stru_100014920);
    }
    v17 = &selRef_targetWithPid_;
    v18 = (void *)qword_100019618;
    if (os_log_type_enabled((os_log_t)qword_100019618, OS_LOG_TYPE_INFO))
    {
      v19 = v18;
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&uint8_t buf[4] = xpc_connection_get_pid(v12);
      *(_WORD *)&buf[8] = 2048;
      *(void *)&buf[10] = v12;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = v16;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Event from peer (%d : %p): %s", buf, 0x1Cu);
    }
    if (strcmp(v16, "task_for_pid"))
    {
      if (!strcmp(v16, "debug_xpc_process") && xpc_message_has_privileges(v12))
      {
        v20 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v13, "name")];
        uint64_t v21 = objc_opt_class();
        v22 = xpc_dictionary_get_archived_object(v13, "archived_dictionary", v21);
        uint64_t v23 = objc_opt_class();
        v24 = xpc_dictionary_get_archived_object(v13, "archived_array", v23);
        uint64_t v25 = objc_opt_class();
        v26 = xpc_dictionary_get_archived_object(v13, "archived_options", v25);
        v27 = +[DTXPCServiceController sharedInstance];
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = sub_10000329C;
        *(void *)&buf[24] = &unk_100014970;
        *(void *)&buf[32] = v12;
        [v27 registerClient:*(void *)&buf[32] forXPCService:v20 environment:v22 arguments:v24 options:v26 handler:buf];

        v17 = &selRef_targetWithPid_;
        int v28 = 0;
LABEL_100:
        if (v4[194] != (char *)-1) {
          dispatch_once(&qword_100019610, &stru_100014920);
        }
        v73 = v17[195];
        if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
        {
          v74 = v73;
          pid_t pid = xpc_connection_get_pid(v12);
          name[0] = 67109632;
          name[1] = pid;
          v112 = 2048;
          v113 = v12;
          v114 = 1024;
          v115 = v28;
          _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_INFO, "Operation status (%d : %p): %d", (uint8_t *)name, 0x18u);
        }
        if (reply)
        {
          xpc_dictionary_set_int64(reply, "status", v28);
          xpc_connection_send_message(v12, reply);
        }
LABEL_106:

        goto LABEL_107;
      }
      if (!strcmp(v16, "process_watcher_connect") && xpc_message_has_privileges(v12))
      {
        char v35 = xpc_dictionary_get_BOOL(v13, "track_expired");
        if (xpc_dictionary_get_BOOL(v13, "send_updates"))
        {
          *(void *)buf = _NSConcreteStackBlock;
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = sub_100003384;
          *(void *)&buf[24] = &unk_100014998;
          *(void *)&buf[32] = v12;
          v36 = objc_retainBlock(buf);
        }
        else
        {
          v36 = 0;
        }
        int v28 = sub_1000069D8((uint64_t)v12, v35, (uint64_t)v36);
        goto LABEL_99;
      }
      if (!strcmp(v16, "symbolicate_pid"))
      {
        int int64 = xpc_dictionary_get_int64(v13, "pid");
        char v45 = xpc_dictionary_get_BOOL(v13, "enable_dyld_notifications");
        v46 = (unsigned char *)sub_1000068A4((uint64_t)v12, int64, v45);
      }
      else
      {
        if (strcmp(v16, "deep_symbol_owner"))
        {
          if (!strcmp(v16, "process_watcher_copy_signatures"))
          {
            *(void *)buf = 0;
            name[0] = 0;
            int v28 = sub_100006B44((uint64_t)v12, (uint64_t)buf, (uint64_t)name);
            if (!v28)
            {
              xpc_dictionary_set_data(reply, "signatures_data", *(const void **)buf, name[0]);
              if (*(void *)buf) {
                vm_deallocate(mach_task_self_, *(vm_address_t *)buf, name[0]);
              }
            }
            goto LABEL_100;
          }
          if (!strcmp(v16, "vfs_trace_paths") && xpc_message_has_privileges(v12))
          {
            if (sysctlbyname("vfs.generic.trace_paths", 0, 0, 0, 0))
            {
LABEL_39:
              int64_t v37 = *__error();
              int v28 = 5;
              goto LABEL_138;
            }
LABEL_137:
            int64_t v37 = 0;
            int v28 = 0;
LABEL_138:
            if (reply) {
              xpc_dictionary_set_int64(reply, "errno_status", v37);
            }
            goto LABEL_100;
          }
          if (!strcmp(v16, "ktrace_bless") && xpc_message_has_privileges(v12))
          {
            if (xpc_dictionary_get_BOOL(v13, "bless")) {
              xpc_connection_get_pid(v12);
            }
            if (kperf_bless_set()) {
              goto LABEL_39;
            }
            goto LABEL_137;
          }
          if (!strcmp(v16, "ktrace_machine_core_info") && xpc_message_has_privileges(v12))
          {
            if (!ktrace_machine_create_current())
            {
              v72 = 0;
              goto LABEL_181;
            }
            if ((ktrace_machine_cpu_type() & 0xFFFFFF) == 7)
            {
              v64 = ktrace_machine_physical_cpus();
              v65 = ktrace_machine_max_cpus();
              if (v65 <= v64)
              {
                v68 = objc_opt_new();
                v72 = 0;
LABEL_177:

                goto LABEL_178;
              }
              v66 = v65;
              v67 = v65 / v64;
              v68 = objc_opt_new();
              if (v67 < 2)
              {
                v72 = 0;
                v4 = &selRef_targetWithPid_;
                goto LABEL_177;
              }
              v105 = v12;
              v69 = 0;
              do
              {
                v70 = [[DTCPUClusterInfo alloc] initWithClusterID:v69 / v67 flags:(unint64_t)(v69 % v67 != 0) << 14];
                v71 = +[NSNumber numberWithUnsignedInt:v69];
                [v68 setObject:v70 forKeyedSubscript:v71];

                v69 = (v69 + 1);
              }
              while (v69 != v66);
              v72 = [v68 copy];
              __int16 v12 = v105;
            }
            else
            {
              if (!&ktrace_machine_max_clusters)
              {
                v72 = 0;
                v4 = &selRef_targetWithPid_;
LABEL_178:
                ktrace_machine_destroy();
                if (v72)
                {
                  v99 = +[NSKeyedArchiver archivedDataWithRootObject:v72 requiringSecureCoding:1 error:0];
                  if (v99)
                  {
                    v100 = v99;
                    xpc_dictionary_set_data(reply, "ktrace_machine_cores_data", [v100 bytes], (size_t)[v100 length]);

                    int v28 = 0;
LABEL_182:

                    goto LABEL_100;
                  }
                }
LABEL_181:
                int v28 = 46;
                goto LABEL_182;
              }
              v68 = objc_opt_new();
              v88 = ktrace_machine_max_cpus();
              if (v88)
              {
                v89 = v88;
                v90 = 0;
                v109 = reply;
                do
                {
                  if (&ktrace_machine_max_clusters)
                  {
                    name[0] = 0;
                    *(void *)buf = 0;
                    if (!ktrace_machine_cpu_cluster() && !ktrace_machine_cluster_flags())
                    {
                      v91 = [DTCPUClusterInfo alloc];
                      v92 = [(DTCPUClusterInfo *)v91 initWithClusterID:name[0] flags:buf[0] & 3];
                      if (v92)
                      {
                        v93 = v92;
                        +[NSNumber numberWithUnsignedInt:v90];
                        v95 = v94 = v12;
                        [v68 setObject:v93 forKeyedSubscript:v95];

                        __int16 v12 = v94;
                        xpc_object_t reply = v109;
                      }
                    }
                  }
                  v90 = (v90 + 1);
                }
                while (v89 != v90);
              }
              v72 = [v68 copy];
            }
            v4 = &selRef_targetWithPid_;
            v17 = &selRef_targetWithPid_;
            goto LABEL_177;
          }
          if (!strcmp(v16, "ktrace_file_message") && xpc_message_has_privileges(v12))
          {
            if (ktrace_file_create_memory())
            {
              if (ktrace_config_create_current())
              {
                if (ktrace_config_append()
                  && (*(void *)buf = 0, *(void *)name = 0, !ktrace_file_get_memory()))
                {
                  xpc_dictionary_set_data(reply, "ktrace_config_data", *(const void **)buf, *(size_t *)name);
                  int v28 = 0;
                }
                else
                {
                  int v28 = 5;
                }
                ktrace_config_destroy();
              }
              else
              {
                int v28 = 5;
              }
              ktrace_file_close();
            }
            else
            {
              int v28 = 5;
            }
            goto LABEL_100;
          }
          if (!strcmp(v16, "coreprofile_core_control") && xpc_message_has_privileges(v12))
          {
            v76 = xpc_dictionary_get_int64(v13, "coreCount");
            *(void *)buf = 0;
            data = xpc_dictionary_get_data(v13, "coreEnableArray", (size_t *)buf);
            int v28 = coresSetEnabled((uint64_t)data, v76);
            goto LABEL_100;
          }
          if (!strcmp(v16, "stackshot") && xpc_message_has_privileges(v12))
          {
            if (stackshot_config_create())
            {
              if (stackshot_config_set_flags())
              {
                v78 = sub_100001D24();
                if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
                  sub_10000DE80();
                }

                int v28 = 4;
                goto LABEL_188;
              }
              if (stackshot_capture_with_config())
              {
                v98 = sub_100001D24();
                if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR)) {
                  sub_10000DDFC();
                }
              }
              else
              {
                stackshot_buffer = (const void *)stackshot_config_get_stackshot_buffer();
                stackshot_size = stackshot_config_get_stackshot_size();
                if (stackshot_buffer)
                {
                  xpc_dictionary_set_data(reply, "stackshot", stackshot_buffer, stackshot_size);
                  int v28 = 0;
                  goto LABEL_188;
                }
              }
              int v28 = 5;
LABEL_188:
              stackshot_config_dealloc();
              goto LABEL_100;
            }
LABEL_129:
            int v28 = 8;
            goto LABEL_100;
          }
          if (strcmp(v16, "ktrace_start_file") || !xpc_message_has_privileges(v12))
          {
            if (!strcmp(v16, "ktrace_stop_file"))
            {
              int v28 = 8;
              if (!xpc_message_has_privileges(v12) || !ktrace_current_session) {
                goto LABEL_100;
              }
              *(void *)buf = 0;
              v86 = [(id)ktrace_current_session stopWithError:buf];
              v72 = *(id *)buf;
              if (dword_100019480 == -1)
              {
                int v28 = 0;
              }
              else if (kperf_bless_set())
              {
                int v28 = 5;
              }
              else
              {
                int v28 = 0;
              }
              if ((v86 & 1) == 0)
              {
                if (v72)
                {
                  v96 = +[NSKeyedArchiver archivedDataWithRootObject:v72 requiringSecureCoding:1 error:0];
                  xpc_dictionary_set_data(reply, "ns_error", [v96 bytes], (size_t)[v96 length]);
                }
                int v28 = 5;
              }
              v97 = (void *)ktrace_current_session;
              ktrace_current_session = 0;

              dword_100019480 = -1;
              goto LABEL_182;
            }
            goto LABEL_129;
          }
          v79 = xpc_dictionary_dup_fd(v13, "ktrace_file_fd");
          *(void *)buf = 0;
          v80 = xpc_dictionary_get_data(v13, "ktrace_session_config", (size_t *)buf);
          name[0] = -1;
          if (v80)
          {
            v81 = +[NSData dataWithBytesNoCopy:v80 length:*(void *)buf freeWhenDone:0];
            v82 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
            v110 = 0;
            v83 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v82 fromData:v81 error:&v110];
            v84 = v110;

            if (v84)
            {
              v85 = sub_100001D24();
              if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR)) {
                sub_10000DF48(v84);
              }
            }
            v17 = &selRef_targetWithPid_;
            if (v83)
            {
              if (sub_100003478(v83, v79, (int *)name))
              {
                int v28 = 0;
LABEL_150:

                goto LABEL_100;
              }
              int v28 = 5;
              if (name[0] == -1 || !reply) {
                goto LABEL_150;
              }
              xpc_dictionary_set_int64(reply, "errno_status", (int)name[0]);
LABEL_149:
              int v28 = 5;
              goto LABEL_150;
            }
          }
          else
          {
            v87 = sub_100001D24();
            if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR)) {
              sub_10000DF04(v87);
            }
          }
          xpc_dictionary_set_int64(reply, "errno_status", -1);
          v83 = 0;
          goto LABEL_149;
        }
        v61 = xpc_dictionary_get_int64(v13, "pid");
        uuid = xpc_dictionary_get_uuid(v13, "uuid");
        v46 = (unsigned char *)sub_100006774((uint64_t)v12, v61, (uint64_t)uuid);
      }
      v36 = v46;
      if (v46)
      {
        v63 = v46;
        xpc_dictionary_set_data(reply, "signatures_data", [v63 bytes], (size_t)[v63 length]);
        int v28 = 0;
      }
      else
      {
        int v28 = 8;
      }
LABEL_99:

      goto LABEL_100;
    }
    v108 = reply;
    v38 = v12;
    id v39 = v13;
    int v40 = xpc_dictionary_get_int64(v39, "pid");
    v107 = DVTIUUidForPid(v40);
    pid_t v41 = xpc_connection_get_pid(v38);
    int v42 = DVTIUUidForPid(v41);
    if (v42) {
      unsigned int v43 = xpc_message_has_privileges(v38);
    }
    else {
      unsigned int v43 = 1;
    }
    name[0] = 0;
    v47 = task_for_pid(mach_task_self_, v40, name);
    if (v47)
    {
      int v28 = v47;
      if (qword_100019610 != -1) {
        dispatch_once(&qword_100019610, &stru_100014920);
      }
      v48 = qword_100019618;
      if (os_log_type_enabled((os_log_t)qword_100019618, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)&uint8_t buf[4] = v41;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = v42;
        *(_WORD *)&buf[14] = 1024;
        *(_DWORD *)&buf[16] = v107;
        _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "Caller: {%u:%u} failed to get task_control_t for Target: %u", buf, 0x14u);
      }
    }
    else
    {
      v104 = v12;
      v49 = DVTIsProcessDebuggable(name[0]);
      v50 = DVTIsSimulatorProcess();
      v51 = v50;
      if (v107 == v42) {
        v52 = 1;
      }
      else {
        v52 = v43;
      }
      v106 = v52 & (v49 | v50);
      if (qword_100019610 != -1) {
        dispatch_once(&qword_100019610, &stru_100014920);
      }
      v53 = (void *)qword_100019618;
      if (os_log_type_enabled((os_log_t)qword_100019618, OS_LOG_TYPE_INFO))
      {
        v54 = "non-debuggable";
        if (v49) {
          v54 = "debuggable";
        }
        v103 = v54;
        if (v51) {
          v55 = ", simulated";
        }
        else {
          v55 = (const char *)&unk_10001189D;
        }
        v56 = v53;
        v57 = xpc_message_has_privileges(v38);
        *(_DWORD *)buf = 67110914;
        v58 = "UserProcess";
        *(_DWORD *)&uint8_t buf[4] = v41;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = v42;
        if (v57) {
          v58 = "AnyProcess";
        }
        *(_WORD *)&buf[14] = 1024;
        v59 = "success";
        *(_DWORD *)&buf[16] = v40;
        if (!v106) {
          v59 = "fail";
        }
        *(_WORD *)&buf[20] = 1024;
        *(_DWORD *)&buf[22] = v107;
        *(_WORD *)&buf[26] = 2080;
        *(void *)&buf[28] = v103;
        *(_WORD *)&buf[36] = 2080;
        *(void *)&buf[38] = v55;
        v117 = 2080;
        v118 = v58;
        v119 = 2080;
        v120 = v59;
        _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "Caller: {%u:%u} requesting task_control_t for Target: {%u:%u} (%s%s) [Authorization: %s] - %s", buf, 0x42u);
      }
      if (v106)
      {
        v60 = name[0];

        xpc_object_t reply = v108;
        xpc_dictionary_set_mach_send();
        mach_port_deallocate(mach_task_self_, v60);
        int v28 = 0;
        __int16 v12 = v104;
        v4 = &selRef_targetWithPid_;
LABEL_77:
        v17 = &selRef_targetWithPid_;
        goto LABEL_100;
      }
      mach_port_deallocate(mach_task_self_, name[0]);
      int v28 = 8;
      __int16 v12 = v104;
    }
    xpc_object_t reply = v108;
    v4 = &selRef_targetWithPid_;

    goto LABEL_77;
  }
  if (v3 == &_xpc_error_connection_interrupted || v3 == &_xpc_error_connection_invalid)
  {
    if (qword_100019610 != -1) {
      dispatch_once(&qword_100019610, &stru_100014920);
    }
    v6 = (void *)qword_100019618;
    if (os_log_type_enabled((os_log_t)qword_100019618, OS_LOG_TYPE_INFO))
    {
      v7 = *(_xpc_connection_s **)(a1 + 32);
      v8 = v6;
      pid_t v9 = xpc_connection_get_pid(v7);
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[8] = 2048;
      *(void *)&buf[10] = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Peer disconnected (%d : %p)", buf, 0x12u);
    }
    v11 = +[DTXPCServiceController sharedInstance];
    [v11 unregisterClient:*(void *)(a1 + 32) withIdentifier:0 parent:0];

    sub_100006C74(*(void *)(a1 + 32));
  }
  else
  {
    if (qword_100019610 != -1) {
      dispatch_once(&qword_100019610, &stru_100014920);
    }
    v29 = (void *)qword_100019618;
    if (os_log_type_enabled((os_log_t)qword_100019618, OS_LOG_TYPE_INFO))
    {
      v30 = *(_xpc_connection_s **)(a1 + 32);
      v31 = v29;
      pid_t v32 = xpc_connection_get_pid(v30);
      uint64_t v33 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v3;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v32;
      *(_WORD *)&buf[18] = 2048;
      *(void *)&buf[20] = v33;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Unexpected event %@ (%d : %p)", buf, 0x1Cu);
    }
  }
LABEL_107:
}

void sub_10000329C(uint64_t a1, void *a2, int a3, int a4, int a5)
{
  id v9 = a2;
  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  id v10 = v9;
  v11 = (const char *)[v10 UTF8String];

  xpc_dictionary_set_string(xdict, "name", v11);
  xpc_dictionary_set_int64(xdict, "pid", a3);
  xpc_dictionary_set_int64(xdict, "host_pid", a4);
  xpc_dictionary_set_fd(xdict, "outputfd", a5);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), xdict);
}

void sub_100003384(uint64_t a1, int a2, int a3, const __CFData *a4)
{
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t xdict = v8;
  if (a3 == 256) {
    id v9 = "dyld_load";
  }
  else {
    id v9 = "dyld_unload";
  }
  xpc_dictionary_set_string(v8, "Message", v9);
  xpc_dictionary_set_int64(xdict, "pid", a2);
  BytePtr = CFDataGetBytePtr(a4);
  size_t Length = CFDataGetLength(a4);
  xpc_dictionary_set_data(xdict, "signatures_data", BytePtr, Length);
}

void *__cdecl sub_10000345C(id a1, void *a2, unint64_t a3, unint64_t a4)
{
  return malloc_type_realloc(a2, a4, 0x20A2AF9DuLL);
}

void sub_100003470(id a1, void *a2, unint64_t a3)
{
}

BOOL sub_100003478(void *a1, uint64_t a2, int *a3)
{
  id v5 = a1;
  int v14 = -1;
  kperf_bless_get();
  getpid();
  if (kperf_bless_set())
  {
    BOOL v6 = 0;
    if (a3) {
      *a3 = *__error();
    }
  }
  else
  {
    id v13 = 0;
    v7 = [[DTKTraceSessionCreator alloc] initWithFD:a2 configuration:v5 error:&v13];
    id v8 = v13;
    id v9 = v8;
    BOOL v6 = v7 != 0;
    if (v7)
    {
      unsigned int v10 = [v5 useExisting];
      int v11 = v14;
      if (v10)
      {
        kperf_bless_set();
      }
      else
      {
        objc_storeStrong((id *)&ktrace_current_session, v7);
        dword_100019480 = v11;
      }
    }
    else if (a3)
    {
      *a3 = [v8 code];
    }
  }
  return v6;
}

void sub_10000358C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_100003718(uint64_t a1, uint64_t a2, dispatch_object_t object)
{
  *(void *)a1 = a2;
  *(unsigned char *)(a1 + 8) = 0;
  *(void *)(a1 + 24) = object;
  dispatch_retain(object);
  return a1;
}

uint64_t sub_100003750(uint64_t a1)
{
  return a1;
}

void sub_10000377C(uint64_t a1, int a2)
{
  v4 = (mach_port_name_t *)sub_100005F98();
  if (qword_100019620 != -1) {
    dispatch_once(&qword_100019620, &stru_100014A78);
  }
  id v5 = qword_100019628;
  if (os_log_type_enabled((os_log_t)qword_100019628, OS_LOG_TYPE_INFO))
  {
    int v6 = *(unsigned __int8 *)(a1 + 8);
    *(_DWORD *)buf = 67109376;
    int v12 = v6;
    __int16 v13 = 1024;
    int v14 = a2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Changing tracking state: %d->%d", buf, 0xEu);
  }
  if (!*(unsigned char *)(a1 + 8) || (a2 & 1) != 0)
  {
    if (!*(unsigned char *)(a1 + 8) && a2)
    {
      *(_DWORD *)buf = 0;
      *(unsigned char *)(a1 + 8) = a2;
      sub_100006014(v4, (mach_port_name_t *)buf);
      if ((*(_DWORD *)buf - 1) > 0xFFFFFFFD)
      {
        *(void *)(a1 + 16) = 0;
        if (qword_100019620 != -1) {
          dispatch_once(&qword_100019620, &stru_100014A78);
        }
        id v8 = qword_100019628;
        if (os_log_type_enabled((os_log_t)qword_100019628, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)id v9 = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to connect to host port", v9, 2u);
        }
        *(unsigned char *)(a1 + 8) = 0;
      }
      else
      {
        mach_port_set_context(mach_task_self_, *(mach_port_name_t *)buf, *(void *)a1);
        v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_mach_recv, *(unsigned int *)buf, 0, *(dispatch_queue_t *)(a1 + 24));
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 0x40000000;
        handler[2] = sub_1000039C0;
        handler[3] = &unk_100014A38;
        void handler[4] = v4;
        dispatch_source_set_event_handler(v7, handler);
        *(void *)(a1 + 16) = v7;
        dispatch_resume(v7);
      }
    }
  }
  else
  {
    *(unsigned char *)(a1 + 8) = a2;
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 16));
    dispatch_release(*(dispatch_object_t *)(a1 + 16));
    sub_1000062A8((uint64_t)v4);
  }
}

void sub_1000039C0(uint64_t a1)
{
}

void sub_1000039C8(id a1)
{
  qword_100019628 = (uint64_t)os_log_create("com.apple.dt.dtsecurity.xpc", "ProcessTracking");
}

void sub_1000046E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100004710(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100004720(uint64_t a1)
{
}

void sub_100004728(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = [[DVTProviderLogger alloc] initWithProviderName:v7];
  [*(id *)(a1 + 32) addObject:v9];
  id v10 = v7;
  [v10 UTF8String];
  int v11 = ktrace_session_provide();

  if (v11)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v10);
    if (qword_100019638 != -1) {
      dispatch_once(&qword_100019638, &stru_100014B48);
    }
    int v12 = qword_100019630;
    if (os_log_type_enabled((os_log_t)qword_100019630, OS_LOG_TYPE_ERROR)) {
      sub_10000E048((uint64_t)v10, v12);
    }
    *a4 = 1;
  }
}

intptr_t sub_100004844(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100004D84(id a1)
{
  qword_100019630 = (uint64_t)os_log_create("com.apple.dt.Instruments", "dtktracehelpers");
  _objc_release_x1();
}

uint64_t sub_100004DC8(uint64_t a1, id a2, int a3)
{
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_DWORD *)(a1 + 40) = 1065353216;
  *(_DWORD *)(a1 + 48) = a3;
  *(void *)(a1 + 56) = objc_retainBlock(a2);
  *(void *)a1 = CFDictionaryCreateMutable(0, 0, 0, &kCSTypeDictionaryValueCallBacks);
  return a1;
}

void sub_100004E38(_Unwind_Exception *a1)
{
  sub_10000581C(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100004E58(uint64_t a1)
{
  sub_10000581C(a1 + 8);
  return a1;
}

void sub_100004E98(void *a1)
{
}

uint64_t *sub_100004EB0(uint64_t *result, int a2)
{
  int v6 = a2;
  if (*((_DWORD *)result + 12))
  {
    uint64_t v2 = (uint64_t)(result + 1);
    result = sub_100005868(result + 1, &v6);
    if (!result)
    {
      CSSymbolicatorCreateWithPid();
      if (qword_100019640 != -1) {
        dispatch_once(&qword_100019640, &stru_100014B88);
      }
      id v3 = (id)qword_100019648;
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        CSSymbolicatorGetAOutSymbolOwner();
        uint64_t Name = CSSymbolOwnerGetName();
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = Name;
        __int16 v8 = 1024;
        int v9 = v6;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Created symbolicator for %s[%u]\n", buf, 0x12u);
      }

      uint64_t Signature = CSSymbolicatorCreateSignature();
      if (Signature)
      {
        *(void *)buf = &v6;
        sub_10000591C(v2, &v6, (uint64_t)&unk_100010620, (_DWORD **)buf)[3] = Signature;
      }
      return (uint64_t *)CSRelease();
    }
  }
  return result;
}

void sub_100005020(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100005038(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t Signature = CSSymbolOwnerCreateSignature();
  if (Signature)
  {
    int v9 = (const void *)Signature;
    uint64_t v10 = *(void *)(a1 + 56);
    if (v10) {
      (*(void (**)(uint64_t, uint64_t, uint64_t, const void *))(v10 + 16))(v10, a4, a5, v9);
    }
    CFRelease(v9);
  }
  else
  {
    if (qword_100019640 != -1) {
      dispatch_once(&qword_100019640, &stru_100014B88);
    }
    int v11 = qword_100019648;
    if (os_log_type_enabled((os_log_t)qword_100019648, OS_LOG_TYPE_ERROR))
    {
      v12[0] = 67109120;
      v12[1] = a4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "failed to create signature for %d\n", (uint8_t *)v12, 8u);
    }
  }
}

uint64_t sub_100005188(CFDictionaryRef *a1, int a2, uint64_t a3)
{
  Value = CFDictionaryGetValue(*a1, (const void *)a2);
  if (!a3) {
    return 0;
  }
  if (!Value) {
    return 0;
  }
  CSSymbolicatorGetSymbolOwnerWithCFUUIDBytesAtTime();
  if (CSIsNull()) {
    return 0;
  }
  return CSSymbolOwnerCreateSignature();
}

uint64_t sub_10000520C(CFMutableDictionaryRef *a1, int a2, int a3)
{
  int v6 = (const void *)a2;
  if (CFDictionaryGetValue(*a1, (const void *)a2))
  {
    if (qword_100019640 != -1) {
      dispatch_once(&qword_100019640, &stru_100014B88);
    }
    id v7 = (id)qword_100019648;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      CSSymbolicatorGetAOutSymbolOwner();
      *(_DWORD *)buf = 136315394;
      uint64_t Name = CSSymbolOwnerGetName();
      __int16 v17 = 1024;
      LODWORD(v18) = a2;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Returning cached live symbolicator for %s[%u]", buf, 0x12u);
    }

    return CSSymbolicatorCreateSignature();
  }
  else
  {
    if (getpid() == a2) {
      int v9 = 0;
    }
    else {
      int v9 = a3;
    }
    value[0] = CSSymbolicatorCreateWithPidFlagsAndNotification();
    value[1] = v10;
    uint64_t Signature = CSSymbolicatorCreateSignature();
    if (qword_100019640 != -1) {
      dispatch_once(&qword_100019640, &stru_100014B88);
    }
    int v11 = (id)qword_100019648;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      if (v9) {
        int v12 = "tracking ";
      }
      else {
        int v12 = (const char *)&unk_10001189D;
      }
      CSSymbolicatorGetAOutSymbolOwner();
      *(_DWORD *)buf = 136315650;
      uint64_t Name = (uint64_t)v12;
      __int16 v17 = 2080;
      uint64_t v18 = CSSymbolOwnerGetName();
      __int16 v19 = 1024;
      int v20 = a2;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Created live %ssymbolicator for %s[%u]", buf, 0x1Cu);
    }

    CFDictionarySetValue(*a1, v6, value);
    CSRelease();
  }
  return Signature;
}

void sub_1000054B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000054D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((a2 & 0xFFFFFFFE) == 0x100)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a3 + 16);
    uint64_t v7 = *(void *)(a3 + 24);
    if (qword_100019640 != -1) {
      dispatch_once(&qword_100019640, &stru_100014B88);
    }
    __int16 v8 = (id)qword_100019648;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = "unload";
      if (a2 == 256) {
        int v9 = "load";
      }
      v15 = v9;
      CSSymbolicatorGetAOutSymbolOwner();
      uint64_t Name = CSSymbolOwnerGetName();
      int v11 = *(_DWORD *)(a1 + 40);
      uint64_t BaseAddress = CSSymbolOwnerGetBaseAddress();
      uint64_t v13 = CSSymbolOwnerGetName();
      if (a2 == 256) {
        uint64_t LoadTimestamp = CSSymbolOwnerGetLoadTimestamp();
      }
      else {
        uint64_t LoadTimestamp = CSSymbolOwnerGetUnloadTimestamp();
      }
      *(_DWORD *)buf = 136316418;
      __int16 v17 = v15;
      __int16 v18 = 2080;
      uint64_t v19 = Name;
      __int16 v20 = 1024;
      int v21 = v11;
      __int16 v22 = 2048;
      uint64_t v23 = BaseAddress;
      __int16 v24 = 2080;
      uint64_t v25 = v13;
      __int16 v26 = 2048;
      uint64_t v27 = LoadTimestamp;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Sending %s notification for %s[%u]: %#llx %s at time %llu", buf, 0x3Au);
    }

    sub_100005038(v5, v6, v7, *(unsigned int *)(a1 + 40), a2);
  }
}

void sub_1000056A4(_Unwind_Exception *exception_object)
{
}

__CFArray *sub_1000056BC(void *a1)
{
  if (qword_100019640 != -1) {
    dispatch_once(&qword_100019640, &stru_100014B88);
  }
  uint64_t v2 = qword_100019648;
  if (os_log_type_enabled((os_log_t)qword_100019648, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = a1[4];
    int v7 = 134217984;
    uint64_t v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Returning %lu symbolicator signatures", (uint8_t *)&v7, 0xCu);
  }
  Mutable = CFArrayCreateMutable(0, a1[4], &kCFTypeArrayCallBacks);
  for (i = (uint64_t **)a1[3]; i; i = (uint64_t **)*i)
  {
    CFArrayAppendValue(Mutable, i[3]);
    CFRelease(i[3]);
  }
  sub_100005DC0(a1 + 1);
  return Mutable;
}

void sub_1000057D8(id a1)
{
  qword_100019648 = (uint64_t)os_log_create("com.apple.dt.dtsecurity.xpc", "ProcessTracking");
  _objc_release_x1();
}

uint64_t sub_10000581C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      uint64_t v3 = (void *)*v2;
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

uint64_t *sub_100005868(void *a1, int *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2;
    if (*(void *)&v2 <= v3) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v5 = (*(void *)&v2 - 1) & v3;
  }
  uint64_t v6 = *(uint64_t ***)(*a1 + 8 * v5);
  if (!v6) {
    return 0;
  }
  for (result = *v6; result; result = (uint64_t *)*result)
  {
    unint64_t v8 = result[1];
    if (v8 == v3)
    {
      if (*((_DWORD *)result + 4) == v3) {
        return result;
      }
    }
    else
    {
      if (v4.u32[0] > 1uLL)
      {
        if (v8 >= *(void *)&v2) {
          v8 %= *(void *)&v2;
        }
      }
      else
      {
        v8 &= *(void *)&v2 - 1;
      }
      if (v8 != v5) {
        return 0;
      }
    }
  }
  return result;
}

void *sub_10000591C(uint64_t a1, int *a2, uint64_t a3, _DWORD **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    uint64_t v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      int v11 = *v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (*((_DWORD *)v11 + 4) == v7) {
              return v11;
            }
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4) {
              break;
            }
          }
          int v11 = (void *)*v11;
        }
        while (v11);
      }
    }
  }
  int v11 = operator new(0x20uLL);
  void *v11 = 0;
  v11[1] = v7;
  *((_DWORD *)v11 + 4) = **a4;
  v11[3] = 0;
  float v13 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    BOOL v15 = 1;
    if (v8 >= 3) {
      BOOL v15 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v16 = v15 | (2 * v8);
    unint64_t v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17) {
      size_t v18 = v17;
    }
    else {
      size_t v18 = v16;
    }
    sub_100005B74(a1, v18);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }
  uint64_t v19 = *(void *)a1;
  __int16 v20 = *(void **)(*(void *)a1 + 8 * v4);
  if (v20)
  {
    void *v11 = *v20;
LABEL_38:
    void *v20 = v11;
    goto LABEL_39;
  }
  void *v11 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v11;
  *(void *)(v19 + 8 * v4) = a1 + 16;
  if (*v11)
  {
    unint64_t v21 = *(void *)(*v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8) {
        v21 %= v8;
      }
    }
    else
    {
      v21 &= v8 - 1;
    }
    __int16 v20 = (void *)(*(void *)a1 + 8 * v21);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v11;
}

void sub_100005B2C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_100005B40()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void sub_100005B74(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      sub_100005C64(a1, prime);
    }
  }
}

void sub_100005C64(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      sub_100005B40();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      int v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            void *v7 = *v11;
            void *v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            int v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          int v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    uint64_t v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

void *sub_100005DC0(void *result)
{
  if (result[3])
  {
    uint64_t v1 = result;
    result = (void *)result[2];
    if (result)
    {
      do
      {
        int8x8_t v2 = (void *)*result;
        operator delete(result);
        result = v2;
      }
      while (v2);
    }
    v1[2] = 0;
    uint64_t v3 = v1[1];
    if (v3)
    {
      for (uint64_t i = 0; i != v3; ++i)
        *(void *)(*v1 + 8 * i) = 0;
    }
    v1[3] = 0;
  }
  return result;
}

uint64_t coresSetEnabled(uint64_t a1, unsigned int a2)
{
  uint64_t result = 4;
  if (a1 && a2)
  {
    mach_port_t v5 = mach_host_self();
    mach_msg_type_number_t host_info_outCnt = 12;
    long long v11 = 0u;
    long long v12 = 0u;
    *(_OWORD *)host_info_out = 0u;
    if (host_info(v5, 1, host_info_out, &host_info_outCnt)) {
      return 5;
    }
    if (host_info_out[0] >= a2)
    {
      processor_array_t out_processor_list = 0;
      mach_msg_type_number_t out_processor_listCnt = 0;
      if (host_processors(v5, &out_processor_list, &out_processor_listCnt)) {
        return 5;
      }
      if (a2 >= 2)
      {
        uint64_t v6 = 1;
        do
        {
          processor_t v7 = out_processor_list[v6];
          if (*(unsigned char *)(a1 + v6)) {
            processor_start(v7);
          }
          else {
            processor_exit(v7);
          }
          ++v6;
        }
        while (a2 != v6);
      }
      return 0;
    }
    else
    {
      return 4;
    }
  }
  return result;
}

BOOL DTProcessShouldCaptureOutputWithOptions(void *a1)
{
  id v1 = a1;
  int8x8_t v2 = [v1 objectForKeyedSubscript:DTProcessControlServiceOption_CaptureOutputKey[0]];
  unsigned __int8 v3 = [v2 BOOLValue];

  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    mach_port_t v5 = [v1 objectForKeyedSubscript:@"iODestinationKey"];
    unsigned int v6 = [v5 intValue];

    BOOL v4 = v6 == 0;
  }

  return v4;
}

uint64_t sub_100005F98()
{
  if (qword_100019650 != -1) {
    dispatch_once(&qword_100019650, &stru_100014BC8);
  }
  return qword_100019658;
}

void sub_100005FDC(id a1)
{
}

void sub_100006014(mach_port_name_t *name, mach_port_name_t *a2)
{
  kern_return_t inserted;
  mach_port_t v8;
  NSObject *v9;
  mach_port_name_t v10;
  _DWORD *exception;
  uint8_t buf[4];
  mach_port_name_t v13;

  mach_port_t v4 = mach_task_self_;
  unsigned int v6 = name + 41;
  mach_port_name_t v5 = name[41];
  if (v5 + 1 >= 2)
  {
    mach_port_mod_refs(mach_task_self_, v5, 1u, -1);
    mach_port_name_t *v6 = 0;
  }
  inserted = mach_port_allocate(v4, 1u, v6);
  if (inserted
    || (inserted = mach_port_insert_right(v4, *v6, *v6, 0x14u)) != 0
    || (unint64_t v8 = mach_host_self(),
        name[40] = 10,
        (inserted = host_swap_exception_ports(v8, 0x200u, name[41], -2147483644, 5, name, name + 40, name + 10, (exception_behavior_array_t)name + 20, (exception_flavor_array_t)name + 30)) != 0))
  {
    exception = __cxa_allocate_exception(4uLL);
    std::bad_array_new_length *exception = inserted;
  }
  if (qword_100019660 != -1) {
    dispatch_once(&qword_100019660, &stru_100014C08);
  }
  uint8x8_t v9 = qword_100019668;
  if (os_log_type_enabled((os_log_t)qword_100019668, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = *v6;
    *(_DWORD *)buf = 67174657;
    float v13 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Connected to host exception port, listening on %{private}#x", buf, 8u);
  }
  *a2 = *v6;
}

uint64_t sub_1000062A8(uint64_t result)
{
  unsigned int v1 = *(_DWORD *)(result + 160);
  if (v1)
  {
    if (v1 >= 0xB) {
      sub_10000E0EC();
    }
    uint64_t v2 = result;
    mach_port_t v3 = mach_task_self_;
    mach_port_t v4 = mach_host_self();
    if (*(_DWORD *)(v2 + 160))
    {
      host_priv_t v5 = v4;
      for (unint64_t i = 0; i < *(unsigned int *)(v2 + 160); ++i)
      {
        uint64_t v7 = v2 + 4 * i;
        if (host_set_exception_ports(v5, *(_DWORD *)v7, *(_DWORD *)(v7 + 40), *(_DWORD *)(v7 + 80), *(_DWORD *)(v7 + 120)))
        {
          if (qword_100019660 != -1) {
            dispatch_once(&qword_100019660, &stru_100014C08);
          }
          uint64_t v8 = qword_100019668;
          if (!os_log_type_enabled((os_log_t)qword_100019668, OS_LOG_TYPE_ERROR)) {
            goto LABEL_15;
          }
          int v9 = *(_DWORD *)(v2 + 4 * i);
          *(_DWORD *)buf = 67109120;
          int v16 = v9;
          uint64_t v10 = v8;
          os_log_type_t v11 = OS_LOG_TYPE_ERROR;
          long long v12 = "Failed to restore a host port exception handler: 0x%x";
          uint32_t v13 = 8;
        }
        else
        {
          if (qword_100019660 != -1) {
            dispatch_once(&qword_100019660, &stru_100014C08);
          }
          uint64_t v14 = qword_100019668;
          if (!os_log_type_enabled((os_log_t)qword_100019668, OS_LOG_TYPE_INFO)) {
            goto LABEL_15;
          }
          *(_WORD *)buf = 0;
          uint64_t v10 = v14;
          os_log_type_t v11 = OS_LOG_TYPE_INFO;
          long long v12 = "Restored previous host exception port";
          uint32_t v13 = 2;
        }
        _os_log_impl((void *)&_mh_execute_header, v10, v11, v12, buf, v13);
LABEL_15:
        mach_port_deallocate(v3, *(_DWORD *)(v7 + 40));
      }
    }
    *(_DWORD *)(v2 + 160) = 0;
    uint64_t result = mach_port_mod_refs(v3, *(_DWORD *)(v2 + 164), 1u, -1);
    *(_DWORD *)(v2 + 164) = 0;
  }
  return result;
}

uint64_t sub_100006488(mach_port_name_t a1, uint64_t a2, mach_port_name_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = *(unsigned int *)(a5 + 8);
  if (qword_100019660 != -1) {
    dispatch_once(&qword_100019660, &stru_100014C08);
  }
  uint64_t v8 = qword_100019668;
  if (os_log_type_enabled((os_log_t)qword_100019668, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Observed process termination for pid: %u", buf, 8u);
  }
  *(void *)buf = 0;
  if (!mach_port_get_context(mach_task_self_, a1, (mach_port_context_t *)buf)) {
    (***(void (****)(void, uint64_t))buf)(*(void *)buf, v7);
  }
  if (qword_100019660 != -1) {
    dispatch_once(&qword_100019660, &stru_100014C08);
  }
  int v9 = qword_100019668;
  if (os_log_type_enabled((os_log_t)qword_100019668, OS_LOG_TYPE_INFO))
  {
    v11[0] = 67109120;
    v11[1] = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Handled process termination for pid: %u", (uint8_t *)v11, 8u);
  }
  mach_port_deallocate(mach_task_self_, a3);
  return 0;
}

void sub_100006634()
{
}

void sub_100006644(uint64_t a1)
{
  mach_msg_return_t v1;
  mach_error_t v2;
  NSObject *v3;
  int v4;
  char *v5;
  __int16 v6;
  mach_error_t v7;

  unsigned int v1 = mach_msg_server_once((BOOLean_t (__cdecl *)(mach_msg_header_t *, mach_msg_header_t *))mach_exc_server, 0x40000u, *(_DWORD *)(a1 + 164), 0);
  if (v1)
  {
    uint64_t v2 = v1;
    if (qword_100019660 != -1) {
      dispatch_once(&qword_100019660, &stru_100014C08);
    }
    mach_port_t v3 = qword_100019668;
    if (os_log_type_enabled((os_log_t)qword_100019668, OS_LOG_TYPE_ERROR))
    {
      mach_port_t v4 = 136315394;
      host_priv_t v5 = mach_error_string(v2);
      unsigned int v6 = 1024;
      uint64_t v7 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Failure processing exception: %s (%#x)", (uint8_t *)&v4, 0x12u);
    }
  }
}

void sub_100006744(id a1)
{
  qword_100019668 = (uint64_t)os_log_create("com.apple.dt.dtsecurity.xpc", "ProcessTracking");
}

uint64_t sub_100006774(uint64_t a1, int a2, uint64_t a3)
{
  if (qword_100019600 != -1) {
    dispatch_once(&qword_100019600, &stru_100014C48);
  }
  unsigned int v6 = off_1000195F8;
  return sub_1000067F0((uint64_t)v6, a1, a2, a3);
}

uint64_t sub_1000067F0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2000000000;
  uint64_t v12 = 0;
  mach_port_t v4 = *(NSObject **)(a1 + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_1000070AC;
  block[3] = &unk_100014CE0;
  block[4] = &v9;
  block[5] = a1;
  int v8 = a3;
  block[6] = a2;
  block[7] = a4;
  dispatch_sync(v4, block);
  uint64_t v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t sub_1000068A4(uint64_t a1, int a2, char a3)
{
  if (qword_100019600 != -1) {
    dispatch_once(&qword_100019600, &stru_100014C48);
  }
  unsigned int v6 = off_1000195F8;
  return sub_100006920((uint64_t)v6, a1, a2, a3);
}

uint64_t sub_100006920(uint64_t a1, uint64_t a2, int a3, char a4)
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2000000000;
  uint64_t v13 = 0;
  mach_port_t v4 = *(NSObject **)(a1 + 8);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 0x40000000;
  v7[2] = sub_100007428;
  v7[3] = &unk_100014D48;
  v7[4] = &v10;
  v7[5] = a1;
  v7[6] = a2;
  int v8 = a3;
  char v9 = a4;
  dispatch_sync(v4, v7);
  uint64_t v5 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v5;
}

uint64_t sub_1000069D8(uint64_t a1, char a2, uint64_t a3)
{
  if (qword_100019600 != -1) {
    dispatch_once(&qword_100019600, &stru_100014C48);
  }
  unsigned int v6 = off_1000195F8;
  return sub_100006A54((uint64_t)v6, a1, a2, a3);
}

uint64_t sub_100006A54(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  int v8 = *(NSObject **)(a1 + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_100007E18;
  block[3] = &unk_100014E08;
  block[4] = a1;
  block[5] = a2;
  dispatch_sync(v8, block);
  char v9 = *(NSObject **)(a1 + 8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 0x40000000;
  v11[2] = sub_100007504;
  v11[3] = &unk_100014D70;
  v11[5] = a1;
  v11[6] = a2;
  _DWORD v11[4] = a4;
  char v12 = a3;
  dispatch_sync(v9, v11);
  return 0;
}

uint64_t sub_100006B44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (qword_100019600 != -1) {
    dispatch_once(&qword_100019600, &stru_100014C48);
  }
  unsigned int v6 = off_1000195F8;
  return sub_100006BC0((uint64_t)v6, a1, a2, a3);
}

uint64_t sub_100006BC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = 0;
  char v9 = &v8;
  uint64_t v10 = 0x2000000000;
  int v11 = 0;
  mach_port_t v4 = *(NSObject **)(a1 + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_100007AD0;
  block[3] = &unk_100014DE8;
  block[4] = &v8;
  block[5] = a1;
  void block[6] = a2;
  block[7] = a3;
  void block[8] = a4;
  dispatch_sync(v4, block);
  uint64_t v5 = *((unsigned int *)v9 + 6);
  _Block_object_dispose(&v8, 8);
  return v5;
}

void sub_100006C74(uint64_t a1)
{
  if (qword_100019600 != -1) {
    dispatch_once(&qword_100019600, &stru_100014C48);
  }
  uint64_t v2 = *((void *)off_1000195F8 + 1);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 0x40000000;
  v3[2] = sub_100007E18;
  v3[3] = &unk_100014E08;
  v3[4] = off_1000195F8;
  v3[5] = a1;
  dispatch_sync(v2, v3);
}

void sub_100006D20(id a1)
{
}

void sub_100006D64()
{
}

uint64_t sub_100006D88(uint64_t a1)
{
  *(void *)a1 = off_100014C78;
  uint64_t v2 = dispatch_queue_create("pid_tracking_service", 0);
  *(void *)(a1 + 8) = v2;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_DWORD *)(a1 + 56) = 1065353216;
  *(void *)(a1 + 64) = 0;
  *(_DWORD *)(a1 + 72) = 0;
  sub_100003718(a1 + 80, a1, v2);
  signal(15, (void (__cdecl *)(int))1);
  mach_port_t v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, *(dispatch_queue_t *)(a1 + 8));
  *(void *)(a1 + 16) = v3;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000;
  handler[2] = sub_100006EC4;
  handler[3] = &unk_100014C90;
  void handler[4] = a1;
  dispatch_source_set_event_handler(v3, handler);
  dispatch_resume(*(dispatch_object_t *)(a1 + 16));
  return a1;
}

void sub_100006EA0(_Unwind_Exception *a1)
{
  sub_100003750(v2);
  sub_100006F54(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100006EC4(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 64) = 0;
  return result;
}

void sub_100006ED0(uint64_t a1, int a2)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  for (unint64_t i = *(uint64_t ***)(a1 + 40); i; unint64_t i = (uint64_t **)*i)
    sub_100004EB0(i[3], a2);
}

void sub_100006F1C(uint64_t a1)
{
  sub_10000704C(a1);
  operator delete();
}

uint64_t sub_100006F54(uint64_t a1)
{
  sub_100006F90(a1, *(void **)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void sub_100006F90(int a1, void *__p)
{
  if (__p)
  {
    uint64_t v2 = __p;
    do
    {
      mach_port_t v3 = (void *)*v2;
      mach_port_t v4 = (std::__shared_weak_count *)v2[4];
      if (v4) {
        sub_100006FD8(v4);
      }
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

void sub_100006FD8(std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

uint64_t sub_10000704C(uint64_t a1)
{
  *(void *)a1 = off_100014C78;
  dispatch_release(*(dispatch_object_t *)(a1 + 8));
  dispatch_release(*(dispatch_object_t *)(a1 + 16));
  sub_100003750(a1 + 80);
  sub_100006F54(a1 + 24);
  return a1;
}

uint64_t sub_1000070AC(uint64_t a1)
{
  uint64_t result = sub_1000070E8(*(void *)(a1 + 40), *(void *)(a1 + 48), *(_DWORD *)(a1 + 64), *(void *)(a1 + 56));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t sub_1000070E8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  sub_100007184(a1, a2, &v10);
  if (v10) {
    uint64_t v8 = sub_100005188(v10, a3, a4);
  }
  else {
    uint64_t v8 = 0;
  }
  if (v11) {
    sub_100006FD8(v11);
  }
  return v8;
}

void sub_10000716C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_100006FD8(a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_100007184(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v10 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  uint64_t v5 = sub_10000730C((void *)(a1 + 24), &v10);
  if (v5)
  {
    unsigned int v6 = v5;
    if (qword_100019670 != -1) {
      dispatch_once(&qword_100019670, &stru_100014D20);
    }
    uint64_t v7 = qword_100019678;
    if (os_log_type_enabled((os_log_t)qword_100019678, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v12 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Found client %p", buf, 0xCu);
    }
    uint64_t v8 = v6[4];
    *a3 = v6[3];
    a3[1] = v8;
    if (v8) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
    }
  }
  else
  {
    if (qword_100019670 != -1) {
      dispatch_once(&qword_100019670, &stru_100014D20);
    }
    char v9 = qword_100019678;
    if (os_log_type_enabled((os_log_t)qword_100019678, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v12 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to find client %p", buf, 0xCu);
    }
    *a3 = 0;
    a3[1] = 0;
  }
}

void *sub_10000730C(void *a1, void *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = 0x9DDFEA08EB382D69 * ((8 * *a2 + 8) ^ HIDWORD(*a2));
  unint64_t v4 = 0x9DDFEA08EB382D69 * (HIDWORD(*a2) ^ (v3 >> 47) ^ v3);
  unint64_t v5 = 0x9DDFEA08EB382D69 * (v4 ^ (v4 >> 47));
  uint8x8_t v6 = (uint8x8_t)vcnt_s8(v2);
  v6.i16[0] = vaddlv_u8(v6);
  if (v6.u32[0] > 1uLL)
  {
    unint64_t v7 = v5;
    if (v5 >= *(void *)&v2) {
      unint64_t v7 = v5 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v7 = v5 & (*(void *)&v2 - 1);
  }
  uint64_t v8 = *(void **)(*a1 + 8 * v7);
  if (!v8) {
    return 0;
  }
  uint64_t result = (void *)*v8;
  if (*v8)
  {
    do
    {
      unint64_t v10 = result[1];
      if (v10 == v5)
      {
        if (result[2] == *a2) {
          return result;
        }
      }
      else
      {
        if (v6.u32[0] > 1uLL)
        {
          if (v10 >= *(void *)&v2) {
            v10 %= *(void *)&v2;
          }
        }
        else
        {
          v10 &= *(void *)&v2 - 1;
        }
        if (v10 != v7) {
          return 0;
        }
      }
      uint64_t result = (void *)*result;
    }
    while (result);
  }
  return result;
}

void sub_1000073F8(id a1)
{
  qword_100019678 = (uint64_t)os_log_create("com.apple.dt.dtsecurity.xpc", "ProcessTracking");
}

uint64_t sub_100007428(uint64_t a1)
{
  uint64_t result = sub_100007468(*(void *)(a1 + 40), *(void *)(a1 + 48), *(_DWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 60));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t sub_100007468(uint64_t a1, uint64_t a2, int a3, int a4)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  sub_100007184(a1, a2, &v10);
  if (v10) {
    uint64_t v8 = sub_10000520C(v10, a3, a4);
  }
  else {
    uint64_t v8 = 0;
  }
  if (v11) {
    sub_100006FD8(v11);
  }
  return v8;
}

void sub_1000074EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_100006FD8(a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_100007504(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (qword_100019670 != -1) {
    dispatch_once(&qword_100019670, &stru_100014D20);
  }
  unint64_t v3 = qword_100019678;
  if (os_log_type_enabled((os_log_t)qword_100019678, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Added client %p", buf, 0xCu);
  }
  sub_1000076A4((id *)(a1 + 32), buf);
  if (!*(void *)(v2 + 48)) {
    *(void *)(v2 + 64) = os_transaction_create();
  }
  if (*(unsigned char *)(a1 + 56))
  {
    int v5 = *(_DWORD *)(v2 + 72);
    *(_DWORD *)(v2 + 72) = v5 + 1;
    if (!v5) {
      sub_10000377C(v2 + 80, 1);
    }
  }
  char v9 = (uint64_t *)(a1 + 48);
  uint8x8_t v6 = sub_1000077EC(v2 + 24, (void *)(a1 + 48), (uint64_t)&unk_1000106B9, &v9);
  long long v7 = *(_OWORD *)buf;
  if (*(void *)&buf[8]) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&buf[8] + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v8 = (std::__shared_weak_count *)v6[4];
  *(_OWORD *)(v6 + 3) = v7;
  if (v8) {
    sub_100006FD8(v8);
  }
  if (*(void *)&buf[8]) {
    sub_100006FD8(*(std::__shared_weak_count **)&buf[8]);
  }
}

void sub_100007684(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
}

void *sub_1000076A4@<X0>(id *a1@<X1>, void *a2@<X8>)
{
  uint64_t v4 = operator new(0x58uLL);
  uint64_t result = sub_100007708(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_1000076F4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_100007708(void *a1, id *a2)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = off_100014DA0;
  sub_100004E54(a1 + 24, *a2);
  return a1;
}

void sub_100007758(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void sub_10000776C(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_100014DA0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_10000778C(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_100014DA0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete();
}

uint64_t sub_1000077E0(uint64_t a1)
{
  return sub_100004EAC(a1 + 24);
}

void *sub_1000077EC(uint64_t a1, void *a2, uint64_t a3, uint64_t **a4)
{
  unint64_t v7 = 0x9DDFEA08EB382D69 * ((8 * *a2 + 8) ^ HIDWORD(*a2));
  unint64_t v8 = 0x9DDFEA08EB382D69 * (HIDWORD(*a2) ^ (v7 >> 47) ^ v7);
  unint64_t v9 = 0x9DDFEA08EB382D69 * (v8 ^ (v8 >> 47));
  unint64_t v10 = *(void *)(a1 + 8);
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v4 = 0x9DDFEA08EB382D69 * (v8 ^ (v8 >> 47));
      if (v9 >= v10) {
        unint64_t v4 = v9 % v10;
      }
    }
    else
    {
      unint64_t v4 = v9 & (v10 - 1);
    }
    uint64_t v12 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v12)
    {
      for (unint64_t i = *v12; i; unint64_t i = (void *)*i)
      {
        unint64_t v14 = i[1];
        if (v14 == v9)
        {
          if (i[2] == *a2) {
            return i;
          }
        }
        else
        {
          if (v11.u32[0] > 1uLL)
          {
            if (v14 >= v10) {
              v14 %= v10;
            }
          }
          else
          {
            v14 &= v10 - 1;
          }
          if (v14 != v4) {
            break;
          }
        }
      }
    }
  }
  BOOL v15 = (void *)(a1 + 16);
  unint64_t i = operator new(0x28uLL);
  *unint64_t i = 0;
  i[1] = v9;
  uint64_t v16 = **a4;
  i[3] = 0;
  i[4] = 0;
  i[2] = v16;
  float v17 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v18 = *(float *)(a1 + 32);
  if (!v10 || (float)(v18 * (float)v10) < v17)
  {
    BOOL v19 = 1;
    if (v10 >= 3) {
      BOOL v19 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v10);
    unint64_t v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21) {
      size_t v22 = v21;
    }
    else {
      size_t v22 = v20;
    }
    sub_100005B74(a1, v22);
    unint64_t v10 = *(void *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10) {
        unint64_t v4 = v9 % v10;
      }
      else {
        unint64_t v4 = v9;
      }
    }
    else
    {
      unint64_t v4 = (v10 - 1) & v9;
    }
  }
  uint64_t v23 = *(void *)a1;
  __int16 v24 = *(void **)(*(void *)a1 + 8 * v4);
  if (v24)
  {
    *unint64_t i = *v24;
LABEL_38:
    void *v24 = i;
    goto LABEL_39;
  }
  *unint64_t i = *v15;
  void *v15 = i;
  *(void *)(v23 + 8 * v4) = v15;
  if (*i)
  {
    unint64_t v25 = *(void *)(*i + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v25 >= v10) {
        v25 %= v10;
      }
    }
    else
    {
      v25 &= v10 - 1;
    }
    __int16 v24 = (void *)(*(void *)a1 + 8 * v25);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_100007A58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  sub_100007A74(v11, v10);
  _Unwind_Resume(a1);
}

void sub_100007A74(uint64_t a1, void *__p)
{
  if (*(unsigned char *)(a1 + 8))
  {
    unint64_t v3 = (std::__shared_weak_count *)__p[4];
    if (v3) {
      sub_100006FD8(v3);
    }
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

uint64_t sub_100007AD0(uint64_t a1)
{
  uint64_t result = sub_100007B0C(*(void *)(a1 + 40), *(void *)(a1 + 48), *(vm_address_t **)(a1 + 56), *(unsigned int **)(a1 + 64));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t sub_100007B0C(uint64_t a1, uint64_t a2, vm_address_t *a3, unsigned int *a4)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  sub_100007184(a1, a2, &v23);
  if (!v23)
  {
    uint64_t v12 = 5;
    goto LABEL_28;
  }
  vm_address_t dest_address = 0;
  CFErrorRef error = 0;
  unint64_t v8 = sub_1000056BC(v23);
  CFDataRef v9 = CFPropertyListCreateData(0, v8, kCFPropertyListBinaryFormat_v1_0, 0, &error);
  CFDataRef v10 = v9;
  if (!v9 || !v8)
  {
    if (qword_100019670 != -1) {
      dispatch_once(&qword_100019670, &stru_100014D20);
    }
    uint64_t v16 = qword_100019678;
    if (os_log_type_enabled((os_log_t)qword_100019678, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to create a plist to return to client", buf, 2u);
    }
    if (error)
    {
      CFShow(error);
      CFRelease(error);
    }
    uint64_t v12 = 5;
    if (!v10) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  unsigned int Length = CFDataGetLength(v9);
  uint64_t v12 = vm_allocate(mach_task_self_, &dest_address, Length, 1);
  if (v12)
  {
    if (qword_100019670 != -1) {
      dispatch_once(&qword_100019670, &stru_100014D20);
    }
    uint64_t v13 = qword_100019678;
    if (!os_log_type_enabled((os_log_t)qword_100019678, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    unint64_t v14 = mach_error_string(v12);
    *(_DWORD *)buf = 136315138;
    __int16 v26 = v14;
    BOOL v15 = "Failed to allocate: %s";
  }
  else
  {
    vm_map_t v17 = mach_task_self_;
    BytePtr = CFDataGetBytePtr(v10);
    uint64_t v12 = vm_copy(v17, (vm_address_t)BytePtr, Length, dest_address);
    if (!v12)
    {
      *a3 = dest_address;
      *a4 = Length;
      goto LABEL_25;
    }
    vm_deallocate(mach_task_self_, dest_address, Length);
    if (qword_100019670 != -1) {
      dispatch_once(&qword_100019670, &stru_100014D20);
    }
    uint64_t v13 = qword_100019678;
    if (!os_log_type_enabled((os_log_t)qword_100019678, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    BOOL v19 = mach_error_string(v12);
    *(_DWORD *)buf = 136315138;
    __int16 v26 = v19;
    BOOL v15 = "Failed to copy: %s";
  }
  _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v15, buf, 0xCu);
LABEL_25:
  CFRelease(v10);
LABEL_26:
  if (v8) {
    CFRelease(v8);
  }
LABEL_28:
  if (v24) {
    sub_100006FD8(v24);
  }
  return v12;
}

void sub_100007DEC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12)
{
  if (a12) {
    sub_100006FD8(a12);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100007E18(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = (uint64_t *)(a1 + 40);
  uint64_t result = (uint64_t)sub_10000730C((void *)(v1 + 24), (void *)(a1 + 40));
  if (result)
  {
    unint64_t v4 = (uint64_t *)result;
    if (qword_100019670 != -1) {
      dispatch_once(&qword_100019670, &stru_100014D20);
    }
    int v5 = qword_100019678;
    if (os_log_type_enabled((os_log_t)qword_100019678, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *v2;
      int v8 = 134217984;
      uint64_t v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Removed client %p", (uint8_t *)&v8, 0xCu);
    }
    if (*(_DWORD *)(v4[3] + 48))
    {
      int v7 = *(_DWORD *)(v1 + 72) - 1;
      *(_DWORD *)(v1 + 72) = v7;
      if (!v7) {
        sub_10000377C(v1 + 80, 0);
      }
    }
    uint64_t result = sub_100007F50((void *)(v1 + 24), v4);
  }
  if (!*(void *)(v1 + 48)) {
    *(void *)(v1 + 64) = 0;
  }
  return result;
}

uint64_t sub_100007F50(void *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  sub_100007F9C(a1, a2, (uint64_t)&__p);
  unint64_t v3 = __p;
  __p = 0;
  if (v3) {
    sub_100007A74((uint64_t)&v6, v3);
  }
  return v2;
}

void *sub_100007F9C@<X0>(void *result@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  int8x8_t v3 = (int8x8_t)result[1];
  unint64_t v4 = a2[1];
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(void *)&v3) {
      v4 %= *(void *)&v3;
    }
  }
  else
  {
    v4 &= *(void *)&v3 - 1;
  }
  uint64_t v6 = *(void **)(*result + 8 * v4);
  do
  {
    int v7 = v6;
    uint64_t v6 = (void *)*v6;
  }
  while (v6 != a2);
  if (v7 == result + 2) {
    goto LABEL_18;
  }
  unint64_t v8 = v7[1];
  if (v5.u32[0] > 1uLL)
  {
    if (v8 >= *(void *)&v3) {
      v8 %= *(void *)&v3;
    }
  }
  else
  {
    v8 &= *(void *)&v3 - 1;
  }
  if (v8 != v4)
  {
LABEL_18:
    if (!*a2) {
      goto LABEL_19;
    }
    unint64_t v9 = *(void *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v9 >= *(void *)&v3) {
        v9 %= *(void *)&v3;
      }
    }
    else
    {
      v9 &= *(void *)&v3 - 1;
    }
    if (v9 != v4) {
LABEL_19:
    }
      *(void *)(*result + 8 * v4) = 0;
  }
  uint64_t v10 = *a2;
  if (*a2)
  {
    unint64_t v11 = *(void *)(v10 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v11 >= *(void *)&v3) {
        v11 %= *(void *)&v3;
      }
    }
    else
    {
      v11 &= *(void *)&v3 - 1;
    }
    if (v11 != v4)
    {
      *(void *)(*result + 8 * v11) = v7;
      uint64_t v10 = *a2;
    }
  }
  void *v7 = v10;
  *a2 = 0;
  --result[3];
  *(void *)a3 = a2;
  *(void *)(a3 + 8) = result + 2;
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

uint64_t DVTIUIsAppleInternalOSEnvironment()
{
  if (qword_100019688 != -1) {
    dispatch_once(&qword_100019688, &stru_100014E28);
  }
  return byte_100019680;
}

void sub_100008114(id a1)
{
  byte_100019680 = os_variant_has_internal_ui();
}

uint64_t DVTIUUidForPid(int a1)
{
  *(void *)uint64_t v12 = 0xE00000001;
  int v13 = 1;
  int v14 = a1;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  memset(v5, 0, sizeof(v5));
  size_t v4 = 648;
  int v1 = sysctl(v12, 4u, v5, &v4, 0, 0);
  if (v4) {
    BOOL v2 = v1 == 0;
  }
  else {
    BOOL v2 = 0;
  }
  if (v2) {
    return DWORD1(v6);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t sub_100008220(task_name_t a1)
{
  kern_return_t v6;
  int v7;
  int v8;
  int v9;
  int buffer;
  int x;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  long long v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  if (a1 - 1 > 0xFFFFFFFD) {
    return 0;
  }
  uint64_t v16 = v1;
  vm_map_t v17 = v2;
  if (!csr_check()) {
    return 3;
  }
  int has_internal_content = os_variant_has_internal_content();
  BOOL v15 = 2048;
  *(_OWORD *)task_info_out = 0u;
  int v14 = 0u;
  task_info_outCnt = 8;
  if (task_info(a1, 0xFu, task_info_out, &task_info_outCnt)) {
    return 0;
  }
  x = 0;
  long long v6 = pid_for_task(a1, &x);
  uint64_t result = 0;
  if (!v6)
  {
    buffer = 0;
    long long v7 = proc_pidinfo(x, 30, 0, &buffer, 4);
    uint64_t result = 0;
    if (v7 == 4)
    {
      long long v8 = csops_audittoken();
      uint64_t result = 0;
      if (!v8)
      {
        if ((v15 & 4) == 0)
        {
          if ((v15 & 0x800) != 0)
          {
            if (!has_internal_content) {
              return 0;
            }
            return geteuid() == 0;
          }
          else
          {
            if ((v15 & 0x20000000) != 0) {
              long long v9 = has_internal_content;
            }
            else {
              long long v9 = 1;
            }
            if (v9) {
              return 3;
            }
            else {
              return 2;
            }
          }
        }
        return 3;
      }
    }
  }
  return result;
}

uint64_t DVTIsProcessDebuggable(task_name_t a1)
{
  return sub_100008220(a1) & 1;
}

uint64_t DVTIsSimulatorProcess()
{
  return 0;
}

void sub_100008498(id a1)
{
  qword_100019698 = objc_opt_new();
  _objc_release_x1();
}

id sub_100008668()
{
  v0 = +[NSUserDefaults standardUserDefaults];
  id v1 = [v0 BOOLForKey:@"DTXPCServiceControllerLog"];

  return v1;
}

void sub_100009D44(_Unwind_Exception *a1)
{
}

uint64_t sub_100009D94(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100009DA4(uint64_t a1)
{
}

void sub_100009DAC(uint64_t a1)
{
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10000A200;
  v23[3] = &unk_100014E70;
  uint64_t v2 = *(void **)(a1 + 32);
  id v24 = *(id *)(a1 + 40);
  int v27 = *(_DWORD *)(a1 + 96);
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 72);
  id v25 = v3;
  uint64_t v26 = v4;
  [v2 _matchRemove:v23];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    uint8x8_t v5 = *(void **)(*(void *)(a1 + 32) + 8);
    long long v6 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 96)];
    long long v7 = [v5 objectForKeyedSubscript:v6];

    if (!v7)
    {
      long long v7 = objc_opt_new();
      long long v8 = *(void **)(*(void *)(a1 + 32) + 8);
      long long v9 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 96)];
      [v8 setObject:v7 forKeyedSubscript:v9];
    }
    if (*(unsigned char *)(a1 + 104))
    {
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      *(_OWORD *)__str = 0u;
      long long v31 = 0u;
      if (*(unsigned char *)(a1 + 105) || *(unsigned char *)(a1 + 106))
      {
        if ((+[NSProcessInfo isAppleInternal] & 1) == 0)
        {
          uint64_t v11 = *(void *)(a1 + 64);
          uint64_t v12 = *(void *)(a1 + 40);
          uint64_t v13 = *(unsigned int *)(a1 + 96);
          NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
          int v14 = +[NSString stringWithFormat:@"Launching a Daemon or Agent is not supported on iOS devices."];
          v29 = v14;
          BOOL v15 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
          uint64_t v16 = +[NSError errorWithDomain:@"DTXPCServiceController" code:1 userInfo:v15];
          (*(void (**)(uint64_t, uint64_t, void, uint64_t, uint64_t, void *))(v11 + 16))(v11, v12, 0, v13, 0xFFFFFFFFLL, v16);

LABEL_28:
          goto LABEL_29;
        }
        snprintf(__str, 0x200uLL, "system/%s", (const char *)[*(id *)(a1 + 56) UTF8String]);
        uint64_t v10 = xpc_service_create_from_specifier();
      }
      else
      {
        [*(id *)(a1 + 40) UTF8String];
        uint64_t v10 = xpc_service_create();
      }
      uint64_t v17 = *(void *)(*(void *)(a1 + 80) + 8);
      float v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v10;
    }
    if (sub_100008668())
    {
      if (*(unsigned char *)(a1 + 104)) {
        goto LABEL_17;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__str = 136315138;
        *(void *)&__str[4] = "com.apple.dt.instruments.dtsecurity.xpc";
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "DTXPCServiceController: calling xpc_connection_create: serviceName=%s", (uint8_t *)__str, 0xCu);
      }
    }
    if (!*(unsigned char *)(a1 + 104))
    {
      xpc_connection_t v20 = xpc_connection_create("com.apple.dt.instruments.dtsecurity.xpc", 0);
      int v19 = 1;
      goto LABEL_19;
    }
LABEL_17:
    int v19 = 0;
    xpc_connection_t v20 = 0;
LABEL_19:
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), v20);
    if (v19) {

    }
    if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)
      || *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40))
    {
      unint64_t v21 = objc_opt_new();
      [v21 setServiceIdentifier:*(void *)(a1 + 40)];
      [v21 setClient:*(void *)(a1 + 48)];
      uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
      if (!v22) {
        uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
      }
      [v21 setXpcObject:v22];
      if (*(unsigned char *)(a1 + 107)) {
        [v21 setOneshotHandler:*(void *)(a1 + 64)];
      }
      [v7 addObject:v21];
    }
    goto LABEL_28;
  }
LABEL_29:
}

uint64_t sub_10000A200(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7 = a4;
  if (!sub_10000A278(*(void **)(a1 + 32), a2, *(_DWORD *)(a1 + 56), a3)) {
    goto LABEL_4;
  }
  uint64_t v8 = 1;
  if (*(id *)(a1 + 40) != v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
LABEL_4:
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t sub_10000A278(void *a1, void *a2, int a3, int a4)
{
  id v7 = a1;
  id v8 = a2;
  if ([v7 length]
    && [v8 length]
    && ![v7 isEqualToString:v8])
  {
    uint64_t v11 = 0;
  }
  else
  {
    if (a3) {
      BOOL v9 = a4 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    uint64_t v11 = v9 || a3 == a4;
  }

  return v11;
}

void sub_10000A304(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000A3BC;
  v3[3] = &unk_100014EC0;
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  int v6 = *(_DWORD *)(a1 + 64);
  [v2 _matchRemove:v3];
}

uint64_t sub_10000A3BC(uint64_t a1, void *a2, int a3, uint64_t a4)
{
  if (*(void *)(a1 + 32) == a4) {
    return sub_10000A278(*(void **)(a1 + 40), a2, *(_DWORD *)(a1 + 48), a3);
  }
  else {
    return 0;
  }
}

void sub_10000A3E8(uint64_t a1, pid_t pid)
{
  if (proc_pidpath(pid, buffer, 0x400u) >= 1)
  {
    id v4 = +[NSString stringWithUTF8String:buffer];
    id v5 = [v4 stringByDeletingLastPathComponent];
    int v6 = [v5 stringByAppendingPathComponent:@"Info.plist"];

    id v7 = +[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v6, 0);
    if (v7)
    {
      id v8 = +[NSPropertyListSerialization propertyListWithData:v7 options:0 format:&v11 error:0];
    }
    else
    {
      id v8 = 0;
    }
    if (*(void *)(a1 + 32) && [v4 isEqualToString:] != NO
      || *(void *)(a1 + 40)
      && ([v8 objectForKeyedSubscript:@"CFBundleIdentifier"],
          BOOL v9 = objc_claimAutoreleasedReturnValue(),
          unsigned int v10 = [v9 isEqual:*(void *)(a1 + 40)],
          v9,
          v10))
    {
      kill(pid, 9);
    }
  }
}

void sub_10000A55C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 92) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "DTXPCServiceController: xpc attach handler entered", buf, 2u);
  }
  uint64_t pid = xpc_service_instance_get_pid();
  if (*(unsigned char *)(a1 + 92))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)long long v39 = pid;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "DTXPCServiceController: xpc attach handler, uint64_t pid = %d", buf, 8u);
    }
    if (*(unsigned char *)(a1 + 92) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      if (xpc_service_instance_is_configurable()) {
        id v5 = (const char *)&unk_10001189D;
      }
      else {
        id v5 = "non-";
      }
      id v6 = [*(id *)(a1 + 32) UTF8String];
      *(_DWORD *)buf = 136315650;
      *(void *)long long v39 = v5;
      *(_WORD *)&v39[8] = 2080;
      *(void *)&v39[10] = v6;
      __int16 v40 = 1024;
      int v41 = pid;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "invoked for %sconfigurable service: %s pid: %d\n", buf, 0x1Cu);
    }
  }
  if (pid)
  {
    id v7 = [*(id *)(a1 + 40) mutableCopy];
    id v8 = v7;
    if (!*(unsigned char *)(a1 + 93)) {
      [v7 setObject:&__kCFBooleanTrue forKeyedSubscript:DTAssertionManagerOptions_DontRemoveMemoryLimitsKey];
    }
    [v8 removeObjectForKey:DTProcessControlServiceOption_DisableMemoryLimitsKey[0]];
    dispatch_source_t v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_proc, (int)pid, 0x80000000uLL, 0);
    if (v9)
    {
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10000ABB0;
      handler[3] = &unk_100014F38;
      char v35 = *(unsigned char *)(a1 + 92);
      int v34 = pid;
      id v32 = *(id *)(a1 + 48);
      unsigned int v10 = v9;
      long long v33 = v10;
      dispatch_source_set_event_handler(v10, handler);
      dispatch_resume(v10);
    }
    else if (*(unsigned char *)(a1 + 92) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)long long v39 = pid;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "DTXPCServiceController: Failed to start observing process with pid %i", buf, 8u);
    }
    if (xpc_service_instance_is_configurable())
    {
      unsigned int v11 = [*(id *)(a1 + 56) _configureInstance:v3 identifier:*(void *)(a1 + 32) servicePid:pid environment:*(void *)(a1 + 64) arguments:*(void *)(a1 + 72) options:*(void *)(a1 + 40)];
      if (*(unsigned char *)(a1 + 92) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        id v12 = [*(id *)(a1 + 32) UTF8String];
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)long long v39 = pid;
        *(_WORD *)&v39[4] = 2080;
        *(void *)&v39[6] = v12;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Watching pid %d '%s' for exec", buf, 0x12u);
      }
      dispatch_source_t v13 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_proc, (int)pid, 0xA0000000uLL, *(dispatch_queue_t *)(*(void *)(a1 + 56) + 24));
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10000AC98;
      v21[3] = &unk_100014F60;
      int v14 = v13;
      uint64_t v22 = v14;
      char v30 = *(unsigned char *)(a1 + 92);
      int v27 = pid;
      id v23 = *(id *)(a1 + 32);
      id v24 = *(id *)(a1 + 48);
      id v25 = v8;
      id v26 = *(id *)(a1 + 80);
      int v28 = *(_DWORD *)(a1 + 88);
      unsigned int v29 = v11;
      dispatch_source_set_event_handler(v14, v21);
      dispatch_activate(v14);
      if (*(unsigned char *)(a1 + 92) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Calling xpc_service_instance_run", buf, 2u);
      }
      xpc_service_instance_run();
    }
    else
    {
      if (*(unsigned char *)(a1 + 92) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "xpc_service_instance_is_configurable(): false, existing service", buf, 2u);
      }
      if (*(unsigned char *)(a1 + 94) && (int)pid >= 1)
      {
        if (*(unsigned char *)(a1 + 92) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "killing service because we were instructed to kill existing services", buf, 2u);
        }
        kill(pid, 9);
      }
      else
      {
        uint64_t v15 = *(void *)(a1 + 80);
        uint64_t v16 = *(void *)(a1 + 32);
        uint64_t v17 = *(unsigned int *)(a1 + 88);
        NSErrorUserInfoKey v36 = NSLocalizedDescriptionKey;
        float v18 = +[NSString stringWithFormat:@"attempted to attach to an existing process (pid=%d) for XPC service '%@' using DTXPCServiceController - should use generic attach instead", pid, v16];
        long long v37 = v18;
        int v19 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
        xpc_connection_t v20 = +[NSError errorWithDomain:@"DTXPCServiceController" code:2 userInfo:v19];
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *))(v15 + 16))(v15, v16, pid, v17, 0xFFFFFFFFLL, v20);
      }
    }
  }
}

void sub_10000ABB0(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 52) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v2 = *(_DWORD *)(a1 + 48);
    uint64_t v3 = *(void *)(a1 + 32);
    v5[0] = 67109378;
    v5[1] = v2;
    __int16 v6 = 2112;
    uint64_t v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "DTXPCServiceController: pid %d died, releasing claims on assertions taken on behalf of client %@", (uint8_t *)v5, 0x12u);
  }
  id v4 = +[DTAssertionManager sharedInstance];
  [v4 removeAssertionsForPid:*(unsigned int *)(a1 + 48) onBehalfOfClient:*(void *)(a1 + 32)];

  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
}

void sub_10000AC98(uint64_t a1)
{
  int v2 = *(NSObject **)(a1 + 32);
  int data = dispatch_source_get_data(v2);
  dispatch_source_cancel(v2);
  if ((data & 0x20000000) != 0)
  {
    if (*(unsigned char *)(a1 + 84) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      int v14 = *(_DWORD *)(a1 + 72);
      id v15 = [*(id *)(a1 + 40) UTF8String];
      *(_DWORD *)buf = 67109378;
      int v20 = v14;
      __int16 v21 = 2080;
      id v22 = v15;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Service pid %d '%s' exec-ed", buf, 0x12u);
    }
    uint64_t v16 = +[DTAssertionManager sharedInstance];
    [v16 takeAssertionsForPid:*(unsigned int *)(a1 + 72) onBehalfOfClient:*(void *)(a1 + 48) withOptions:*(void *)(a1 + 56)];

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else if (data < 0)
  {
    if (*(unsigned char *)(a1 + 84))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        int v4 = *(_DWORD *)(a1 + 72);
        id v5 = [*(id *)(a1 + 40) UTF8String];
        *(_DWORD *)buf = 67109378;
        int v20 = v4;
        __int16 v21 = 2080;
        id v22 = v5;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Service pid %d '%s'  exited before exec", buf, 0x12u);
      }
    }
    uint64_t v6 = *(void *)(a1 + 64);
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(unsigned int *)(a1 + 72);
    uint64_t v9 = *(unsigned int *)(a1 + 76);
    uint64_t v10 = *(unsigned int *)(a1 + 80);
    unsigned int v11 = +[NSString stringWithFormat:@"Service exited before exec %d '%@'. ", v8, v7, NSLocalizedDescriptionKey];
    float v18 = v11;
    id v12 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    dispatch_source_t v13 = +[NSError errorWithDomain:@"DTXPCServiceController" code:2 userInfo:v12];
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *))(v6 + 16))(v6, v7, v8, v9, v10, v13);
  }
}

void sub_10000AF08(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [v5 count];
  if (!a3 && v6)
  {
    if ((unint64_t)[v5 count] >= 2
      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v7 = [*(id *)(a1 + 32) UTF8String];
      id v8 = [v5 description];
      *(_DWORD *)buf = 136315394;
      id v21 = v7;
      __int16 v22 = 2080;
      id v23 = [v8 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "warning: multiple plugins discovered for identifier '%s': { %s }\n", buf, 0x16u);
    }
    [v5 count];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = v5;
    id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (unint64_t i = 0; i != v11; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          if (*(unsigned char *)(a1 + 40))
          {
            int v14 = *(void **)(*((void *)&v15 + 1) + 8 * i);
            if ([v14 userElection:v15] == NO) {
              [v14 setUserElection:257];
            }
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }
}

void sub_10000B0D4(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [v7 pkHandle];
  int v4 = (void *)v3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (!v3 || (v6 = v3 == v5, uint64_t v5 = v3, v6)) {
    [v7 setPkHandle:v5];
  }
}

void sub_10000B42C(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (const char *)[v5 UTF8String];
  id v8 = [v6 description];

  id v9 = v8;
  id v10 = (const char *)[v9 UTF8String];

  if (v7 && v10)
  {
    id v11 = *(void **)(a1 + 32);
    xpc_dictionary_set_string(v11, v7, v10);
  }
}

void sub_10000B738(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 88) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    LOWORD(v6) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "DTXPCServiceController: daemon launch xpc attach handler entered", (uint8_t *)&v6, 2u);
  }
  if (xpc_service_instance_is_configurable())
  {
    uint64_t pid = xpc_service_instance_get_pid();
    if (*(unsigned char *)(a1 + 88) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      int v6 = 67109120;
      int v7 = pid;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "DTXPCServiceController: daemon launch xpc attach handler, uint64_t pid = %d", (uint8_t *)&v6, 8u);
    }
    unsigned int v5 = [*(id *)(a1 + 32) _configureInstance:v3 identifier:*(void *)(a1 + 40) servicePid:pid environment:*(void *)(a1 + 48) arguments:*(void *)(a1 + 56) options:&__NSDictionary0__struct];
    if (*(unsigned char *)(a1 + 88) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      int v6 = 67109120;
      int v7 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "DTXPCServiceController: daemon launch outputFD = %d", (uint8_t *)&v6, 8u);
    }
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
    [*(id *)(a1 + 64) UTF8String];
    xpc_service_instance_set_path();
    xpc_service_instance_run();
    xpc_service_set_attach_handler();
  }
}

void sub_10000BA48(uint64_t a1)
{
  int v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000BB0C;
  v3[3] = &unk_100015050;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  int v7 = *(_DWORD *)(a1 + 64);
  id v6 = *(id *)(a1 + 56);
  [v2 enumerateKeysAndObjectsUsingBlock:v3];
}

void sub_10000BB0C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v10);
        if (!*(void *)(a1 + 32)
          || ([*(id *)(*((void *)&v16 + 1) + 8 * (void)v10) client],
              uint64_t v12 = objc_claimAutoreleasedReturnValue(),
              dispatch_source_t v13 = *(void **)(a1 + 32),
              v12,
              v12 == v13))
        {
          int v14 = [v11 serviceIdentifier];
          int v15 = sub_10000A278(v14, *(void **)(a1 + 40), (int)[v5 intValue], *(_DWORD *)(a1 + 56));

          if (v15) {
            (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
          }
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
}

void sub_10000BD28(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = +[NSMutableIndexSet indexSet];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000BE24;
  v11[3] = &unk_1000150A0;
  id v8 = *(id *)(a1 + 32);
  id v13 = v7;
  id v14 = v8;
  id v12 = v5;
  id v9 = v7;
  id v10 = v5;
  [v6 enumerateObjectsUsingBlock:v11];
  [v6 removeObjectsAtIndexes:v9];
}

void sub_10000BE24(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = [v5 serviceIdentifier];
  id v8 = [*(id *)(a1 + 32) intValue];
  id v9 = [v5 client];
  LODWORD(v6) = (*(uint64_t (**)(uint64_t, void *, id, void *))(v6 + 16))(v6, v7, v8, v9);

  if (v6)
  {
    [*(id *)(a1 + 40) addIndex:a3];
    id v10 = [v5 pkHandle];
    if (v10)
    {
      id v11 = +[PKHost defaultHost];
      [v11 cancelPlugInDiscovery:v10];
    }
    id v12 = [v5 oneshotHandler];
    if (v12)
    {
      NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
      id v13 = +[NSString stringWithFormat:@"XPC Service observer canceled or superceded."];
      long long v17 = v13;
      id v14 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      int v15 = +[NSError errorWithDomain:@"DTXPCServiceController" code:1 userInfo:v14];
      ((void (**)(void, void, void, void, uint64_t, void *))v12)[2](v12, 0, 0, 0, 0xFFFFFFFFLL, v15);
    }
  }
}

void sub_10000C0C8(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000C170;
  v3[3] = &unk_100014EC0;
  int v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  int v6 = *(_DWORD *)(a1 + 56);
  [v2 _matchRemove:v3];
}

uint64_t sub_10000C170(uint64_t a1, void *a2, int a3, uint64_t a4)
{
  if (*(void *)(a1 + 32) == a4) {
    return sub_10000A278(*(void **)(a1 + 40), a2, *(_DWORD *)(a1 + 48), a3);
  }
  else {
    return 0;
  }
}

id sub_10000C418()
{
  if (qword_1000196A8 != -1) {
    dispatch_once(&qword_1000196A8, &stru_100015138);
  }
  v0 = (void *)qword_1000196A0;
  return v0;
}

id sub_10000C46C(uint64_t a1)
{
  int v2 = sub_10000C418();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = *(_DWORD *)(a1 + 40);
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "releasing assertion for pid %d", (uint8_t *)v5, 8u);
  }

  return [*(id *)(a1 + 32) invalidate];
}

void sub_10000C51C(id a1)
{
  qword_1000196A0 = (uint64_t)os_log_create("com.apple.dt.Instruments", "RBSAssertion");
  _objc_release_x1();
}

void sub_10000C930(uint64_t a1, void *a2)
{
  int v2 = a2;
  v2[2]();
}

void sub_10000CB58(id a1)
{
  uint64_t v1 = objc_opt_new();
  int v2 = (void *)qword_1000196B8;
  qword_1000196B8 = v1;

  uint64_t v3 = objc_opt_new();
  id v4 = (void *)qword_1000196C0;
  qword_1000196C0 = v3;

  id v5 = (void *)qword_1000196B8;
  int v6 = objc_opt_new();
  [v5 addObject:v6];

  [(id)qword_1000196C0 addObject:DTProcessControlServiceOption_DisableWatchdogAssertionKey[0]];
  id v7 = (void *)qword_1000196B8;
  id v8 = objc_opt_new();
  [v7 addObject:v8];

  id v9 = (void *)qword_1000196C0;
  id v10 = DTAssertionManagerOptions_DontRemoveMemoryLimitsKey;
  [v9 addObject:v10];
}

void sub_10000CC7C(id a1)
{
  qword_1000196D0 = objc_opt_new();
  _objc_release_x1();
}

void sub_10000CEE0(uint64_t a1)
{
  int v2 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:v2];
  id v4 = v3;
  if (v3)
  {
    [v3 addClaimForClient:*(void *)(a1 + 40)];
  }
  else
  {
    id v5 = objc_opt_new();
    int v6 = *(void **)(*(void *)(a1 + 32) + 8);
    id v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    id v14 = sub_10000D03C;
    int v15 = &unk_1000151C8;
    id v7 = *(id *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 32);
    id v16 = v7;
    uint64_t v17 = v8;
    int v19 = *(_DWORD *)(a1 + 56);
    id v18 = v5;
    id v9 = v5;
    [v6 enumerateObjectsUsingBlock:&v12];
    id v10 = [DTAssertionPidInfo alloc];
    id v11 = -[DTAssertionPidInfo initForPid:withRemoveBlocks:onBehalfOfClient:](v10, "initForPid:withRemoveBlocks:onBehalfOfClient:", *(unsigned int *)(a1 + 56), v9, *(void *)(a1 + 40), v12, v13, v14, v15);
    [*(id *)(*(void *)(a1 + 32) + 32) setObject:v11 forKeyedSubscript:v2];
  }
}

void sub_10000D03C(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  int v6 = *(void **)(a1 + 32);
  if (!v6) {
    goto LABEL_17;
  }
  id v7 = *(void **)(*(void *)(a1 + 40) + 16);
  if (!v7) {
    goto LABEL_17;
  }
  id v8 = v7;
  id v9 = v6;
  if ((unint64_t)[v8 count] <= a3) {
    goto LABEL_16;
  }
  id v10 = [v8 objectAtIndexedSubscript:a3];
  id v11 = [v9 objectForKey:v10];
  if (!v11)
  {
LABEL_15:

LABEL_16:
    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned __int8 v12 = [v11 BOOLValue];
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int16 v22 = 138412546;
      *(void *)&v22[4] = objc_opt_class();
      *(_WORD *)&v22[12] = 2112;
      *(void *)&v22[14] = v11;
      id v17 = *(id *)&v22[4];
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "DTAssertionManager: options dictionary specified item of class %@ (%@) as disable value, don't know how to interpret so leaving enabled", v22, 0x16u);
    }
    goto LABEL_15;
  }
  unsigned __int8 v12 = [v11 integerValue] != 0;
LABEL_9:

  if (v12)
  {
    uint64_t v13 = +[NSUserDefaults standardUserDefaults];
    unsigned int v14 = [v13 BOOLForKey:@"DTAssertionManagerLog"];

    if (v14 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      int v15 = *(_DWORD *)(a1 + 56);
      id v16 = [*(id *)(*(void *)(a1 + 40) + 16) objectAtIndex:a3];
      *(_DWORD *)__int16 v22 = 67109378;
      *(_DWORD *)&v22[4] = v15;
      *(_WORD *)&v22[8] = 2112;
      *(void *)&v22[10] = v16;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "DTAssertionManager: skipping taking of assertion for pid %d due to option %@ being set", v22, 0x12u);
    }
    goto LABEL_20;
  }
LABEL_17:
  id v18 = [v5 assertionForPid:*(unsigned int *)(a1 + 56) assertionInfo:*(void *)&v22[16]];
  int v19 = v18;
  if (v18)
  {
    int v20 = *(void **)(a1 + 48);
    id v21 = objc_retainBlock(v18);
    [v20 addObject:v21];
  }
LABEL_20:
}

void sub_10000D394(uint64_t a1)
{
  id v4 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  int v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:];
  uint64_t v3 = v2;
  if (v2
    && [v2 removeClaimFromClient:*(void *)(a1 + 40)]
    && [v3 hasNoMoreClients])
  {
    [v3 removeAssertions];
    [*(id *)(*(void *)(a1 + 32) + 32) removeObjectForKey:v4];
  }
}

void sub_10000D4E4(uint64_t a1)
{
  int v2 = objc_opt_new();
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 32);
  id v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  id v7 = sub_10000D5B4;
  id v8 = &unk_100015218;
  id v9 = *(id *)(a1 + 40);
  id v10 = v2;
  id v4 = v2;
  [v3 enumerateKeysAndObjectsUsingBlock:&v5];
  [*(id *)(*(void *)(a1 + 32) + 32) removeObjectsForKeys:v4, v5, v6, v7, v8];
}

void sub_10000D5B4(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([v5 removeClaimFromClient:*(void *)(a1 + 32)]
    && [v5 hasNoMoreClients])
  {
    [v5 removeAssertions];
    [*(id *)(a1 + 40) addObject:v6];
  }
}

_xpc_connection_s *xpc_message_has_privileges(_xpc_connection_s *result)
{
  if (result) {
    return (_xpc_connection_s *)(xpc_connection_get_euid(result) == 0);
  }
  return result;
}

id xpc_dictionary_get_archived_object(void *a1, const char *a2, uint64_t a3)
{
  id v5 = a1;
  if (xpc_get_type(v5) == (xpc_type_t)&_xpc_type_dictionary)
  {
    id v7 = xpc_dictionary_get_value(v5, a2);
    bytes_ptr = xpc_data_get_bytes_ptr(v7);
    id v9 = +[NSData dataWithBytesNoCopy:bytes_ptr length:xpc_data_get_length(v7) freeWhenDone:0];
    id v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", a3, objc_opt_class(), 0);
    id v6 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v10 fromData:v9 error:0];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

uint64_t mach_exc_server_routine(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 2411) >= 0xFFFFFFFA) {
    return (uint64_t)*(&catch_mach_exc_subsystem + 5 * (v1 - 2405) + 5);
  }
  else {
    return 0;
  }
}

uint64_t sub_10000D824(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0)
  {
LABEL_2:
    int v2 = -304;
    goto LABEL_3;
  }
  int v2 = -304;
  if (*(_DWORD *)(result + 24) == 2)
  {
    unsigned int v3 = *(_DWORD *)(result + 4);
    if (v3 >= 0x44 && v3 <= 0x54)
    {
      if (*(unsigned __int16 *)(result + 38) << 16 != 1114112 || *(unsigned __int16 *)(result + 50) << 16 != 1114112)
      {
        int v2 = -300;
        goto LABEL_3;
      }
      unsigned int v4 = *(_DWORD *)(result + 64);
      if (v4 <= 2 && v4 <= (v3 - 68) >> 3 && v3 == 8 * v4 + 68) {
        sub_100006634();
      }
      goto LABEL_2;
    }
  }
LABEL_3:
  *(_DWORD *)(a2 + 32) = v2;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_10000D8F8(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) == 0)
  {
    unsigned int v2 = result[1];
    if (v2 >= 0x30 && v2 <= 0x1480)
    {
      unsigned int v4 = result[9];
      if (v4 <= 2)
      {
        unsigned int v5 = 2 * v4;
        if (v4 <= (v2 - 48) >> 3 && v2 >= 8 * v4 + 48)
        {
          unsigned int v7 = result[v5 + 11];
          if (v7 <= 0x510)
          {
            unsigned int v8 = v2 - v5 * 4;
            if (v7 <= (v8 - 48) >> 2 && v8 == 4 * v7 + 48)
            {
              *(_DWORD *)(a2 + 40) = 1296;
              sub_100006634();
            }
          }
        }
      }
    }
  }
  *(_DWORD *)(a2 + 32) = -304;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

void sub_10000D9E0(int a1)
{
  *(_DWORD *)(v3 - _Block_object_dispose(&STACK[0x350], 8) = a1;
  if (!a1)
  {
    *(NDR_record_t *)(v1 + 24) = NDR_record;
    *(_DWORD *)(v1 + 36) = *v2;
    *(_DWORD *)(v1 + 4) = 4 * *(_DWORD *)(v1 + 40) + 44;
    JUMPOUT(0x10000D994);
  }
  JUMPOUT(0x10000D990);
}

uint64_t sub_10000DA14(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0)
  {
LABEL_2:
    int v2 = -304;
    goto LABEL_3;
  }
  int v2 = -304;
  if (*(_DWORD *)(result + 24) == 2)
  {
    unsigned int v3 = *(_DWORD *)(result + 4);
    if (v3 >= 0x4C && v3 <= 0x149C)
    {
      if (*(unsigned __int16 *)(result + 38) << 16 != 1114112 || *(unsigned __int16 *)(result + 50) << 16 != 1114112)
      {
        int v2 = -300;
        goto LABEL_3;
      }
      unsigned int v5 = *(_DWORD *)(result + 64);
      if (v5 > 2) {
        goto LABEL_2;
      }
      int v2 = -304;
      if (v5 <= (v3 - 76) >> 3)
      {
        unsigned int v6 = 8 * v5;
        if (v3 >= 8 * v5 + 76)
        {
          unsigned int v7 = *(_DWORD *)(result + v6 + 72);
          if (v7 <= 0x510)
          {
            unsigned int v8 = v3 - v6;
            if (v7 <= (v8 - 76) >> 2 && v8 == 4 * v7 + 76)
            {
              *(_DWORD *)(a2 + 40) = 1296;
              sub_100006634();
            }
          }
          goto LABEL_2;
        }
      }
    }
  }
LABEL_3:
  *(_DWORD *)(a2 + 32) = v2;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10000DB80(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0)
  {
    int v3 = -304;
    if (*(_DWORD *)(result + 24) != 1) {
      goto LABEL_3;
    }
    unsigned int v4 = *(_DWORD *)(result + 4);
    if (v4 < 0x40 || v4 > 0x50) {
      goto LABEL_3;
    }
    if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
    {
      int v3 = -300;
      goto LABEL_3;
    }
    unsigned int v5 = *(_DWORD *)(result + 60);
    if (v5 <= 2 && v5 <= (v4 - 64) >> 3 && v4 == 8 * v5 + 64)
    {
      uint64_t result = sub_100006488(*(_DWORD *)(result + 12), *(void *)(result + 48), *(_DWORD *)(result + 28), *(unsigned int *)(result + 56), result + 64);
      *(_DWORD *)(a2 + 32) = result;
      goto LABEL_4;
    }
  }
  int v3 = -304;
LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
LABEL_4:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t mach_exc_server(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(_DWORD *)(a2 + _Block_object_dispose(&STACK[0x350], 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  int v4 = a1[5];
  if ((v4 - 2411) >= 0xFFFFFFFA
    && (unsigned int v5 = (void (*)(void))*(&catch_mach_exc_subsystem + 5 * (v4 - 2405) + 5)) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    uint64_t result = 0;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

void sub_10000DCD0(void *a1, _xpc_connection_s *a2)
{
  int v3 = a1;
  v4[0] = 67109376;
  v4[1] = xpc_connection_get_pid(a2);
  __int16 v5 = 2048;
  unsigned int v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Denying connection from process (%d : %p) because it is missing an entitlement.", (uint8_t *)v4, 0x12u);
}

void sub_10000DD78(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "Message";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "xpc caller did not provide a value for the required %s key", (uint8_t *)&v1, 0xCu);
}

void sub_10000DDFC()
{
  v0 = __error();
  strerror(*v0);
  sub_10000358C((void *)&_mh_execute_header, v1, v2, "stackshot failed (%s)", v3, v4, v5, v6, 2u);
}

void sub_10000DE80()
{
  v0 = __error();
  strerror(*v0);
  sub_10000358C((void *)&_mh_execute_header, v1, v2, "failed to set flags on stackshot config (%s)", v3, v4, v5, v6, 2u);
}

void sub_10000DF04(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Missing configuration data for starting session", v1, 2u);
}

void sub_10000DF48(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_10000358C((void *)&_mh_execute_header, v2, v3, "Failed to unarchive config data: %@", v4, v5, v6, v7, 2u);
}

void sub_10000DFD0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Provider failed: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10000E048(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to append provider '%@', to a session", (uint8_t *)&v2, 0xCu);
}

void sub_10000E0C0()
{
  __assert_rtn("-[DTKTraceSessionCreator stopWithError:]", "DTKTraceHelpers.m", 243, "_stoppingSemaphore != NULL");
}

void sub_10000E0EC()
{
  __assert_rtn("restorePort", "XRProcessWatcherExceptionPort.cp", 128, "_oldHandlerCount <= XRHOST_EXCEPTION_COUNT");
}

void sub_10000E118(uint64_t a1, int a2, os_log_t log)
{
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "failed to acquire assertion for pid %d: %{public}@", (uint8_t *)v3, 0x12u);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return _CFPropertyListCreateData(allocator, propertyList, format, options, error);
}

void CFRelease(CFTypeRef cf)
{
}

void CFShow(CFTypeRef obj)
{
}

uint64_t CSIsNull()
{
  return _CSIsNull();
}

uint64_t CSRelease()
{
  return _CSRelease();
}

uint64_t CSSymbolOwnerCreateSignature()
{
  return _CSSymbolOwnerCreateSignature();
}

uint64_t CSSymbolOwnerGetBaseAddress()
{
  return _CSSymbolOwnerGetBaseAddress();
}

uint64_t CSSymbolOwnerGetLoadTimestamp()
{
  return _CSSymbolOwnerGetLoadTimestamp();
}

uint64_t CSSymbolOwnerGetName()
{
  return _CSSymbolOwnerGetName();
}

uint64_t CSSymbolOwnerGetUnloadTimestamp()
{
  return _CSSymbolOwnerGetUnloadTimestamp();
}

uint64_t CSSymbolicatorCreateSignature()
{
  return _CSSymbolicatorCreateSignature();
}

uint64_t CSSymbolicatorCreateWithPid()
{
  return _CSSymbolicatorCreateWithPid();
}

uint64_t CSSymbolicatorCreateWithPidFlagsAndNotification()
{
  return _CSSymbolicatorCreateWithPidFlagsAndNotification();
}

uint64_t CSSymbolicatorGetAOutSymbolOwner()
{
  return _CSSymbolicatorGetAOutSymbolOwner();
}

uint64_t CSSymbolicatorGetSymbolOwnerWithCFUUIDBytesAtTime()
{
  return _CSSymbolicatorGetSymbolOwnerWithCFUUIDBytesAtTime();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

size_t std::__next_prime(size_t __n)
{
  return std::__next_prime(__n);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return ___error();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

int close(int a1)
{
  return _close(a1);
}

uint64_t csops_audittoken()
{
  return _csops_audittoken();
}

uint64_t csr_check()
{
  return _csr_check();
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return _dispatch_source_get_data(source);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

void free(void *a1)
{
}

uid_t geteuid(void)
{
  return _geteuid();
}

pid_t getpid(void)
{
  return _getpid();
}

kern_return_t host_info(host_t host, host_flavor_t flavor, host_info_t host_info_out, mach_msg_type_number_t *host_info_outCnt)
{
  return _host_info(host, flavor, host_info_out, host_info_outCnt);
}

kern_return_t host_processors(host_priv_t host_priv, processor_array_t *out_processor_list, mach_msg_type_number_t *out_processor_listCnt)
{
  return _host_processors(host_priv, out_processor_list, out_processor_listCnt);
}

kern_return_t host_set_exception_ports(host_priv_t host_priv, exception_mask_t exception_mask, mach_port_t new_port, exception_behavior_t behavior, thread_state_flavor_t new_flavor)
{
  return _host_set_exception_ports(host_priv, exception_mask, new_port, behavior, new_flavor);
}

kern_return_t host_swap_exception_ports(host_priv_t host_priv, exception_mask_t exception_mask, mach_port_t new_port, exception_behavior_t behavior, thread_state_flavor_t new_flavor, exception_mask_array_t masks, mach_msg_type_number_t *masksCnt, exception_handler_array_t old_handlerss, exception_behavior_array_t old_behaviors, exception_flavor_array_t old_flavors)
{
  return _host_swap_exception_ports(host_priv, exception_mask, new_port, behavior, new_flavor, masks, masksCnt, old_handlerss, old_behaviors, old_flavors);
}

int kill(pid_t a1, int a2)
{
  return _kill(a1, a2);
}

uint64_t kperf_bless_get()
{
  return _kperf_bless_get();
}

uint64_t kperf_bless_set()
{
  return _kperf_bless_set();
}

uint64_t ktrace_config_append()
{
  return _ktrace_config_append();
}

uint64_t ktrace_config_create_current()
{
  return _ktrace_config_create_current();
}

uint64_t ktrace_config_destroy()
{
  return _ktrace_config_destroy();
}

uint64_t ktrace_end()
{
  return _ktrace_end();
}

uint64_t ktrace_events_all()
{
  return _ktrace_events_all();
}

uint64_t ktrace_events_filter_bitmap()
{
  return _ktrace_events_filter_bitmap();
}

uint64_t ktrace_file_close()
{
  return _ktrace_file_close();
}

uint64_t ktrace_file_create_memory()
{
  return _ktrace_file_create_memory();
}

uint64_t ktrace_file_get_memory()
{
  return _ktrace_file_get_memory();
}

uint64_t ktrace_machine_cluster_flags()
{
  return _ktrace_machine_cluster_flags();
}

uint64_t ktrace_machine_cpu_cluster()
{
  return _ktrace_machine_cpu_cluster();
}

uint64_t ktrace_machine_cpu_type()
{
  return _ktrace_machine_cpu_type();
}

uint64_t ktrace_machine_create_current()
{
  return _ktrace_machine_create_current();
}

uint64_t ktrace_machine_destroy()
{
  return _ktrace_machine_destroy();
}

uint64_t ktrace_machine_max_cpus()
{
  return _ktrace_machine_max_cpus();
}

uint64_t ktrace_machine_physical_cpus()
{
  return _ktrace_machine_physical_cpus();
}

uint64_t ktrace_session_create()
{
  return _ktrace_session_create();
}

uint64_t ktrace_session_destroy()
{
  return _ktrace_session_destroy();
}

uint64_t ktrace_session_provide()
{
  return _ktrace_session_provide();
}

uint64_t ktrace_session_set_default_event_names_enabled()
{
  return _ktrace_session_set_default_event_names_enabled();
}

uint64_t ktrace_session_set_event_names_enabled()
{
  return _ktrace_session_set_event_names_enabled();
}

uint64_t ktrace_set_collection_interval()
{
  return _ktrace_set_collection_interval();
}

uint64_t ktrace_set_completion_handler()
{
  return _ktrace_set_completion_handler();
}

uint64_t ktrace_set_only_do_time_sensitive_postprocess()
{
  return _ktrace_set_only_do_time_sensitive_postprocess();
}

uint64_t ktrace_set_use_existing()
{
  return _ktrace_set_use_existing();
}

uint64_t ktrace_start_writing_fd()
{
  return _ktrace_start_writing_fd();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return _mach_error_string(error_value);
}

mach_port_t mach_host_self(void)
{
  return _mach_host_self();
}

mach_msg_return_t mach_msg_server_once(BOOLean_t (__cdecl *a1)(mach_msg_header_t *, mach_msg_header_t *), mach_msg_size_t a2, mach_port_t a3, mach_msg_options_t a4)
{
  return _mach_msg_server_once(a1, a2, a3, a4);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return _mach_port_allocate(task, right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return _mach_port_deallocate(task, name);
}

kern_return_t mach_port_get_context(ipc_space_read_t task, mach_port_name_t name, mach_port_context_t *context)
{
  return _mach_port_get_context(task, name, context);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return _mach_port_insert_right(task, name, poly, polyPoly);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return _mach_port_mod_refs(task, name, right, delta);
}

kern_return_t mach_port_set_context(ipc_space_t task, mach_port_name_t name, mach_port_context_t context)
{
  return _mach_port_set_context(task, name, context);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_realloc(ptr, size, type_id);
}

uint64_t memorystatus_control()
{
  return _memorystatus_control();
}

int mkstemps(char *a1, int a2)
{
  return _mkstemps(a1, a2);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

[super a2];
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

void objc_terminate(void)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

uint64_t os_variant_has_internal_ui()
{
  return _os_variant_has_internal_ui();
}

void perror(const char *a1)
{
}

kern_return_t pid_for_task(mach_port_name_t t, int *x)
{
  return _pid_for_task(t, x);
}

int pipe(int a1[2])
{
  return _pipe(a1);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return _proc_pidinfo(pid, flavor, arg, buffer, buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath(pid, buffer, buffersize);
}

kern_return_t processor_exit(processor_t processor)
{
  return _processor_exit(processor);
}

kern_return_t processor_start(processor_t processor)
{
  return _processor_start(processor);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

uint64_t stackshot_capture_with_config()
{
  return _stackshot_capture_with_config();
}

uint64_t stackshot_config_create()
{
  return _stackshot_config_create();
}

uint64_t stackshot_config_dealloc()
{
  return _stackshot_config_dealloc();
}

uint64_t stackshot_config_get_stackshot_buffer()
{
  return _stackshot_config_get_stackshot_buffer();
}

uint64_t stackshot_config_get_stackshot_size()
{
  return _stackshot_config_get_stackshot_size();
}

uint64_t stackshot_config_set_flags()
{
  return _stackshot_config_set_flags();
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

kern_return_t task_for_pid(mach_port_name_t target_tport, int pid, mach_port_name_t *t)
{
  return _task_for_pid(target_tport, pid, t);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return _task_info(target_task, flavor, task_info_out, task_info_outCnt);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return _vm_allocate(target_task, address, size, flags);
}

kern_return_t vm_copy(vm_map_t target_task, vm_address_t source_address, vm_size_t size, vm_address_t dest_address)
{
  return _vm_copy(target_task, source_address, size, dest_address);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return _vm_deallocate(target_task, address, size);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return _xpc_connection_copy_entitlement_value();
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return _xpc_connection_create(name, targetq);
}

uid_t xpc_connection_get_euid(xpc_connection_t connection)
{
  return _xpc_connection_get_euid(connection);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return _xpc_connection_get_pid(connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return _xpc_connection_send_message_with_reply_sync(connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return _xpc_data_get_bytes_ptr(xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return _xpc_data_get_length(xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_dup_fd(xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return _xpc_dictionary_get_data(xdict, key, length);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

const uint8_t *__cdecl xpc_dictionary_get_uuid(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uuid(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_fd(xpc_object_t xdict, const char *key, int fd)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

uint64_t xpc_dictionary_set_mach_send()
{
  return _xpc_dictionary_set_mach_send();
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_main(xpc_connection_handler_t handler)
{
}

uint64_t xpc_service_create()
{
  return _xpc_service_create();
}

uint64_t xpc_service_create_from_specifier()
{
  return _xpc_service_create_from_specifier();
}

uint64_t xpc_service_instance_dup2()
{
  return _xpc_service_instance_dup2();
}

uint64_t xpc_service_instance_get_pid()
{
  return _xpc_service_instance_get_pid();
}

uint64_t xpc_service_instance_is_configurable()
{
  return _xpc_service_instance_is_configurable();
}

uint64_t xpc_service_instance_run()
{
  return _xpc_service_instance_run();
}

uint64_t xpc_service_instance_set_environment()
{
  return _xpc_service_instance_set_environment();
}

uint64_t xpc_service_instance_set_jetsam_properties()
{
  return _xpc_service_instance_set_jetsam_properties();
}

uint64_t xpc_service_instance_set_path()
{
  return _xpc_service_instance_set_path();
}

uint64_t xpc_service_instance_set_start_suspended()
{
  return _xpc_service_instance_set_start_suspended();
}

uint64_t xpc_service_kickstart_with_flags()
{
  return _xpc_service_kickstart_with_flags();
}

uint64_t xpc_service_set_attach_handler()
{
  return _xpc_service_set_attach_handler();
}

uint64_t xpc_strerror()
{
  return _xpc_strerror();
}

[objc_msgSend_URL(a1, a2, ...);
{
  return [a1 URL];
}

[objc_msgSend_UTF8String:a1 UTF8String:a2];
{
  return [a1 UTF8String];
}

[objc_msgSend__providerTopErrors:a1, a2, ...];
{
  return [a1 _providerTopErrors];
}

[NSArray array];
{
  return [a1 allObjects];
}

id objc_msgSend_allowsKeyedCoding(id a1, SEL a2, ...)
{
  return [a1 allowsKeyedCoding];
}

[objc_msgSend_anyObject(a1, a2, ...)]
{
  return [a1 anyObject];
}

id objc_msgSend(void *a1, const char *a2, ...)
{
  return [a1 bitmap];
}

BOOL objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

[objc_msgSend_builtInPlugInsURL];
{
  return [a1 builtInPlugInsURL];
}

[objc_msgSend_bundleIdentifier bundleIdentifier];
{
  return [a1 bundleIdentifier];
}

[objc_msgSend_bytes(a1, a2, ...);
{
  return [a1 bytes];
}

id objc_msgSend_client(id a1, SEL a2, ...)
{
  return [a1 client];
}

id objc_msgSend(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id _collectionInterval(void *a1, const char *a2, ...)
{
  return [a1 collectionInterval];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

[objc_msgSend_defaultHost a1 a2];
{
  return [a1 defaultHost];
}

[objc_msgSend_defaultManager]
{
  return [a1 defaultManager];
}

[objc_msgSend_description description];
{
  return [a1 description];
}

id objc_msgSend_errors(void *a1, const char *a2, ...)
{
  return [a1 errors];
}

[objc_msgSend_fileSystemRepresentation:a1 fileSystemRepresentation:a2];
{
  return [a1 fileSystemRepresentation];
}

[objc_msgSend_firstObject firstObject];
{
  return [a1 firstObject];
}

id objc_msgSend(void *a1, const char *a2, ...)
{
  return [a1 hasNoMoreClients];
}

[objc_msgSend_indexSet(a1, a2, ...)]
{
  return [a1 indexSet];
}

[objc_msgSend_intValue:intValue];
{
  return [a1 intValue];
}

[objc_msgSend_integerValue integerValue];
{
  return [a1 integerValue];
}

[objc_msgSend_invalidate];
{
  return [a1 invalidate];
}

[objc_msgSend_isAppleInternal:a1, a2, ...];
{
  return [a1 isAppleInternal];
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return [a1 length];
}

[objc_msgSend_localizedDescription localizedDescription];
{
  return [a1 localizedDescription];
}

[objc_msgSend_mutableBytes:a1, a2, ...];
{
  return [a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_oneshotHandler(void *a1, const char *a2, ...)
{
  return [a1 oneshotHandler];
}

[objc_msgSend_pathExtension:a1 pathExtension:a2];
{
  return [a1 pathExtension];
}

[objc_msgSend_pkHandle(a1, a2, ...);
{
  return [a1 pkHandle];
}

id objc_msgSend_providers(void *a1, const char *a2, ...)
{
  return [a1 providers];
}

id objc_msgSend_relativePath(void *a1, const char *a2, ...)
{
  return [a1 relativePath];
}

id objc_msgSend(void *a1, const char *a2, ...)
{
  return [a1 removeAssertions];
}

[objc_msgSend_serviceIdentifier(a1, a2, ...);
{
  return [a1 serviceIdentifier];
}

[objc_msgSend_sharedInstance]
{
  return [a1 sharedInstance];
}

[objc_msgSend_standardUserDefaults(a1, a2, ...)]
{
  return [a1 standardUserDefaults];
}

[objc_msgSend_stringByDeletingLastPathComponent(a1, a2, ...)]
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend(void *a1, const char *a2, ...)
{
  return [a1 useExisting];
}

[objc_msgSend_userElection(a1, a2, ...)]
{
  return [a1 userElection];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}