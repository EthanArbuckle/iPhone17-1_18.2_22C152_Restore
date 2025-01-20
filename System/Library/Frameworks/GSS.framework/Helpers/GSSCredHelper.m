@interface GSSCredHelper
+ (void)do_Acquire:(id)a3 request:(id)a4 reply:(id)a5;
+ (void)do_Refresh:(id)a3 request:(id)a4 reply:(id)a5;
@end

@implementation GSSCredHelper

+ (void)do_Acquire:(id)a3 request:(id)a4 reply:(id)a5
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v81 = 0;
  objc_storeStrong(&v81, a4);
  id xdict = 0;
  objc_storeStrong(&xdict, a5);
  os_log_t oslog = (os_log_t)sub_10001AEC8();
  os_log_type_t type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    id v24 = [location[0] bundleIdentifier];
    sub_100006434((uint64_t)v105, (uint64_t)v24);
    _os_log_debug_impl((void *)&_mh_execute_header, oslog, type, "do_Acquire %@", v105, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  krb5_error_code inited = 0;
  krb5_ccache cache = 0;
  uint64_t realm = 0;
  opt = 0;
  CFUUIDBytes v104 = (CFUUIDBytes)0;
  krb5_principal principal = 0;
  krb5_context context = 0;
  uint64_t v71 = 0;
  uint64_t cred_endtime = 0;
  krb5_set_home_dir_access();
  krb5_error_code inited = krb5_init_context(&context);
  if (inited)
  {
    os_log_t v69 = (os_log_t)sub_10001AEC8();
    os_log_type_t v68 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
    {
      sub_100010EA0((uint64_t)v103, inited);
      _os_log_error_impl((void *)&_mh_execute_header, v69, v68, "Failed to initialize context: %d", v103, 8u);
    }
    objc_storeStrong((id *)&v69, 0);
    CFStringRef v101 = @"status";
    v23 = +[NSNumber numberWithInt:inited];
    v102 = v23;
    v67 = +[NSDictionary dictionaryWithObjects:&v102 forKeys:&v101 count:1];

    os_log_t v66 = (os_log_t)sub_10001AEC8();
    os_log_type_t v65 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
    {
      sub_100006434((uint64_t)v100, (uint64_t)v67);
      _os_log_debug_impl((void *)&_mh_execute_header, v66, v65, "do_Acquire results: %@", v100, 0xCu);
    }
    objc_storeStrong((id *)&v66, 0);
    xpc_object_t value = (xpc_object_t)_CFXPCCreateXPCObjectFromCFObject();
    xpc_dictionary_set_value(xdict, "result", value);
    int v63 = 1;
    objc_storeStrong(&value, 0);
    objc_storeStrong((id *)&v67, 0);
  }
  else
  {
    id v62 = 0;
    id v61 = 0;
    id v60 = 0;
    id v59 = xpc_dictionary_get_value(v81, "attributes");
    id v84 = (id)_CFXPCCreateCFObjectFromXPCObject();
    id v58 = v84;
    if (v58)
    {
      id v5 = [v58 mutableCopy];
      id v6 = v62;
      id v62 = v5;

      [v62 removeObjectForKey:@"kHEIMAttrData"];
      os_log_t v55 = (os_log_t)sub_10001AEC8();
      os_log_type_t v54 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
      {
        sub_100006434((uint64_t)v98, (uint64_t)v62);
        _os_log_debug_impl((void *)&_mh_execute_header, v55, v54, "attributes for acquire: %@", v98, 0xCu);
      }
      objc_storeStrong((id *)&v55, 0);
      id v21 = [v58 objectForKeyedSubscript:@"kHEIMAttrParentCredential"];
      id v85 = 0;
      objc_storeStrong(&v85, v21);
      CFUUIDRef v22 = (const __CFUUID *)v85;
      objc_storeStrong(&v85, 0);

      CFUUIDRef uuid = v22;
      if (v22)
      {
        CFUUIDBytes v50 = CFUUIDGetUUIDBytes(uuid);
        CFUUIDBytes v104 = v50;
        os_log_t v49 = (os_log_t)sub_10001AEC8();
        os_log_type_t v48 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        {
          v18 = v49;
          os_log_type_t v19 = v48;
          id v83 = (id)CFUUIDCreateString(0, uuid);
          id v20 = v83;
          id v47 = v20;
          sub_100006434((uint64_t)v96, (uint64_t)v47);
          _os_log_debug_impl((void *)&_mh_execute_header, v18, v19, "using cache: %@", v96, 0xCu);

          objc_storeStrong(&v47, 0);
        }
        objc_storeStrong((id *)&v49, 0);
        CFRelease(uuid);
        id v7 = [v58 objectForKeyedSubscript:@"kHEIMAttrData"];
        id v8 = v61;
        id v61 = v7;

        if (v61)
        {
          id v9 = objc_alloc((Class)NSString);
          id v10 = [v9 initWithData:v61 encoding:4];
          id v11 = v60;
          id v60 = v10;

          krb5_error_code inited = krb5_cc_resolve_by_uuid();
          if (inited)
          {
            os_log_t v44 = (os_log_t)sub_10001AEC8();
            os_log_type_t v43 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            {
              int v12 = [location[0] session];
              sub_10001C170((uint64_t)v94, v12, inited);
              _os_log_error_impl((void *)&_mh_execute_header, v44, v43, "unable to find cache %d, %d", v94, 0xEu);
            }
            objc_storeStrong((id *)&v44, 0);
          }
          else
          {
            krb5_error_code inited = krb5_cc_get_principal(context, cache, &principal);
            if (inited)
            {
              os_log_t v42 = (os_log_t)sub_10001AEC8();
              os_log_type_t v41 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
              {
                int v13 = [location[0] session];
                sub_10001C170((uint64_t)v93, v13, inited);
                _os_log_error_impl((void *)&_mh_execute_header, v42, v41, "unable to retrieve principal %d, %d", v93, 0xEu);
              }
              objc_storeStrong((id *)&v42, 0);
            }
            else
            {
              krb5_error_code inited = krb5_get_init_creds_opt_alloc(context, &opt);
              if (!inited)
              {
                uint64_t realm = krb5_principal_get_realm();
                krb5_get_init_creds_opt_set_default_flags();
                krb5_get_init_creds_opt_set_forwardable(opt, 1);
                krb5_get_init_creds_opt_set_proxiable(opt, 1);
                krb5_get_init_creds_opt_set_canonicalize((krb5_get_init_creds_opt *)context, (int)opt);
                krb5_get_init_creds_opt_set_win2k();
                krb5_error_code inited = krb5_init_creds_init();
                if (inited)
                {
                  os_log_t v40 = (os_log_t)sub_10001AEC8();
                  os_log_type_t v39 = OS_LOG_TYPE_ERROR;
                  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                  {
                    int v14 = [location[0] session];
                    sub_10001C170((uint64_t)v92, v14, inited);
                    _os_log_error_impl((void *)&_mh_execute_header, v40, v39, "unable to init cred context %d, %d", v92, 0xEu);
                  }
                  objc_storeStrong((id *)&v40, 0);
                }
                else
                {
                  [v60 UTF8String];
                  krb5_error_code inited = krb5_init_creds_set_password();
                  objc_storeStrong(&v60, 0);
                  if (inited)
                  {
                    os_log_t v38 = (os_log_t)sub_10001AEC8();
                    os_log_type_t v37 = OS_LOG_TYPE_ERROR;
                    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                    {
                      int v15 = [location[0] session];
                      sub_10001C170((uint64_t)v91, v15, inited);
                      _os_log_error_impl((void *)&_mh_execute_header, v38, v37, "unable to set password %d, %d", v91, 0xEu);
                    }
                    objc_storeStrong((id *)&v38, 0);
                  }
                  else
                  {
                    krb5_error_code inited = krb5_init_creds_get();
                    if (inited)
                    {
                      error_message = (char *)krb5_get_error_message(context, inited);
                      os_log_t v35 = (os_log_t)sub_10001AEC8();
                      os_log_type_t v34 = OS_LOG_TYPE_ERROR;
                      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                      {
                        sub_100015DB8((uint64_t)v90, (uint64_t)error_message);
                        _os_log_error_impl((void *)&_mh_execute_header, v35, v34, "Failed to acquire credentials for cache: %s", v90, 0xCu);
                      }
                      objc_storeStrong((id *)&v35, 0);
                      krb5_free_error_message(context, error_message);
                    }
                    else
                    {
                      krb5_error_code inited = krb5_init_creds_store();
                      if (!inited) {
                        krb5_error_code inited = krb5_init_creds_store_config();
                      }
                      if (inited)
                      {
                        v33 = (char *)krb5_get_error_message(context, inited);
                        os_log_t v32 = (os_log_t)sub_10001AEC8();
                        os_log_type_t v31 = OS_LOG_TYPE_ERROR;
                        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                        {
                          sub_100014CD8((uint64_t)v89, (int)[location[0] session], (uint64_t)v33);
                          _os_log_error_impl((void *)&_mh_execute_header, v32, v31, "Failed to store credentials for cache %d: %s", v89, 0x12u);
                        }
                        objc_storeStrong((id *)&v32, 0);
                        krb5_free_error_message(context, v33);
                      }
                      else
                      {
                        uint64_t cred_endtime = _krb5_init_creds_get_cred_endtime();
                      }
                    }
                  }
                }
              }
            }
          }
        }
        else
        {
          os_log_t v46 = (os_log_t)sub_10001AEC8();
          os_log_type_t v45 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            sub_100010EA0((uint64_t)v95, (int)[location[0] session]);
            _os_log_error_impl((void *)&_mh_execute_header, v46, v45, "unable to acquire credential without password %d", v95, 8u);
          }
          objc_storeStrong((id *)&v46, 0);
          krb5_error_code inited = -1765328188;
        }
      }
      else
      {
        os_log_t v52 = (os_log_t)sub_10001AEC8();
        os_log_type_t v51 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          sub_100010EA0((uint64_t)v97, (int)[location[0] session]);
          _os_log_error_impl((void *)&_mh_execute_header, v52, v51, "unable to acquire credential without cache uuid %d", v97, 8u);
        }
        objc_storeStrong((id *)&v52, 0);
        krb5_error_code inited = -1765328188;
      }
    }
    else
    {
      os_log_t v57 = (os_log_t)sub_10001AEC8();
      os_log_type_t v56 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        sub_100010EA0((uint64_t)v99, (int)[location[0] session]);
        _os_log_error_impl((void *)&_mh_execute_header, v57, v56, "unable to acquire credential without attributes %d", v99, 8u);
      }
      objc_storeStrong((id *)&v57, 0);
      krb5_error_code inited = -1765328188;
    }
    if (v71)
    {
      krb5_init_creds_free();
      uint64_t v71 = 0;
    }
    if (opt)
    {
      krb5_get_init_creds_opt_free(context, opt);
      opt = 0;
    }
    v87[0] = @"status";
    v17 = +[NSNumber numberWithInt:inited];
    v88[0] = v17;
    v87[1] = @"expire";
    v16 = +[NSNumber numberWithLong:cred_endtime];
    v88[1] = v16;
    v30 = +[NSDictionary dictionaryWithObjects:v88 forKeys:v87 count:2];

    os_log_t v29 = (os_log_t)sub_10001AEC8();
    os_log_type_t v28 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      sub_100006434((uint64_t)v86, (uint64_t)v30);
      _os_log_debug_impl((void *)&_mh_execute_header, v29, v28, "do_Acquire results: %@", v86, 0xCu);
    }
    objc_storeStrong((id *)&v29, 0);
    xpc_object_t v27 = (xpc_object_t)_CFXPCCreateXPCObjectFromCFObject();
    xpc_dictionary_set_value(xdict, "result", v27);
    krb5_cc_close(context, cache);
    krb5_free_principal(context, principal);
    krb5_free_context(context);
    objc_storeStrong(&v27, 0);
    objc_storeStrong((id *)&v30, 0);
    objc_storeStrong(&v58, 0);
    objc_storeStrong(&v59, 0);
    objc_storeStrong(&v60, 0);
    objc_storeStrong(&v61, 0);
    objc_storeStrong(&v62, 0);
    int v63 = 0;
  }
  objc_storeStrong(&xdict, 0);
  objc_storeStrong(&v81, 0);
  objc_storeStrong(location, 0);
}

+ (void)do_Refresh:(id)a3 request:(id)a4 reply:(id)a5
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v117 = 0;
  objc_storeStrong(&v117, a4);
  id xdict = 0;
  objc_storeStrong(&xdict, a5);
  os_log_t oslog = (os_log_t)sub_10001AEC8();
  os_log_type_t type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    id v31 = [location[0] bundleIdentifier];
    sub_100006434((uint64_t)v146, (uint64_t)v31);
    _os_log_debug_impl((void *)&_mh_execute_header, oslog, type, "do_Refresh %@", v146, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  unsigned int inited = 0;
  memset(__b, 0, sizeof(__b));
  v111 = 0;
  memset(creds, 0, sizeof(creds));
  unsigned int v109 = 0;
  uint64_t realm = 0;
  CFUUIDBytes v145 = (CFUUIDBytes)0;
  krb5_ccache cache = 0;
  krb5_ccache id = 0;
  krb5_context context = 0;
  opt = 0;
  id v103 = 0;
  id v102 = 0;
  id v101 = 0;
  uint64_t v100 = 0;
  krb5_set_home_dir_access();
  unsigned int inited = krb5_init_context(&context);
  if (inited)
  {
    os_log_t v99 = (os_log_t)sub_10001AEC8();
    os_log_type_t v98 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
    {
      sub_100010EA0((uint64_t)v144, inited);
      _os_log_error_impl((void *)&_mh_execute_header, v99, v98, "Failed to initialize context: %d", v144, 8u);
    }
    objc_storeStrong((id *)&v99, 0);
    CFStringRef v142 = @"status";
    v30 = +[NSNumber numberWithInt:inited];
    v143 = v30;
    v97 = +[NSDictionary dictionaryWithObjects:&v143 forKeys:&v142 count:1];

    os_log_t v96 = (os_log_t)sub_10001AEC8();
    os_log_type_t v95 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG))
    {
      sub_100006434((uint64_t)v141, (uint64_t)v97);
      _os_log_debug_impl((void *)&_mh_execute_header, v96, v95, "do_Refresh results: %@", v141, 0xCu);
    }
    objc_storeStrong((id *)&v96, 0);
    xpc_object_t value = (xpc_object_t)_CFXPCCreateXPCObjectFromCFObject();
    xpc_dictionary_set_value(xdict, "result", value);
    int v93 = 1;
    objc_storeStrong(&value, 0);
    objc_storeStrong((id *)&v97, 0);
    goto LABEL_109;
  }
  memset(__b, 0, sizeof(__b));
  id v92 = xpc_dictionary_get_value(v117, "attributes");
  id v120 = (id)_CFXPCCreateCFObjectFromXPCObject();
  id v91 = v120;
  if (v91)
  {
    id v5 = [v91 mutableCopy];
    id v6 = v101;
    id v101 = v5;

    [v101 removeObjectForKey:@"kHEIMAttrData"];
    os_log_t v88 = (os_log_t)sub_10001AEC8();
    os_log_type_t v87 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
    {
      sub_100006434((uint64_t)v139, (uint64_t)v101);
      _os_log_debug_impl((void *)&_mh_execute_header, v88, v87, "attributes for refresh: %@", v139, 0xCu);
    }
    objc_storeStrong((id *)&v88, 0);
    id v28 = [v91 objectForKeyedSubscript:@"kHEIMAttrParentCredential"];
    id v121 = 0;
    objc_storeStrong(&v121, v28);
    CFUUIDRef v29 = (const __CFUUID *)v121;
    objc_storeStrong(&v121, 0);

    CFUUIDRef uuid = v29;
    if (v29)
    {
      CFUUIDBytes v83 = CFUUIDGetUUIDBytes(uuid);
      CFUUIDBytes v145 = v83;
      os_log_t v82 = (os_log_t)sub_10001AEC8();
      os_log_type_t v81 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
      {
        v25 = v82;
        os_log_type_t v26 = v81;
        id v119 = (id)CFUUIDCreateString(0, uuid);
        id v27 = v119;
        id v80 = v27;
        sub_100006434((uint64_t)v137, (uint64_t)v80);
        _os_log_debug_impl((void *)&_mh_execute_header, v25, v26, "using cache: %@", v137, 0xCu);

        objc_storeStrong(&v80, 0);
      }
      objc_storeStrong((id *)&v82, 0);
      CFRelease(uuid);
      id v7 = [v91 objectForKeyedSubscript:@"kHEIMAttrClientName"];
      id v8 = v103;
      id v103 = v7;

      if (v103)
      {
        os_log_t v77 = (os_log_t)sub_10001AEC8();
        os_log_type_t v76 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
        {
          sub_100006434((uint64_t)v135, (uint64_t)v103);
          _os_log_debug_impl((void *)&_mh_execute_header, v77, v76, "using clientName: %@", v135, 0xCu);
        }
        objc_storeStrong((id *)&v77, 0);
        unsigned int inited = krb5_parse_name(context, (const char *)[v103 UTF8String], (krb5_principal *)__b);
        if (!inited)
        {
          id v9 = [v91 objectForKeyedSubscript:@"kHEIMAttrServerName"];
          id v10 = v102;
          id v102 = v9;

          if (v102)
          {
            os_log_t v72 = (os_log_t)sub_10001AEC8();
            os_log_type_t v71 = OS_LOG_TYPE_DEBUG;
            if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
            {
              sub_100006434((uint64_t)v134, (uint64_t)v102);
              _os_log_debug_impl((void *)&_mh_execute_header, v72, v71, "using serverName: %@", v134, 0xCu);
            }
            objc_storeStrong((id *)&v72, 0);
            unsigned int inited = krb5_parse_name(context, (const char *)[v102 UTF8String], (krb5_principal *)&__b[8]);
            if (inited)
            {
              os_log_t v70 = (os_log_t)sub_10001AEC8();
              os_log_type_t v69 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
              {
                sub_100006434((uint64_t)v133, (uint64_t)v102);
                _os_log_error_impl((void *)&_mh_execute_header, v70, v69, "Failed to copy service principal: %@", v133, 0xCu);
              }
              objc_storeStrong((id *)&v70, 0);
              goto LABEL_98;
            }
          }
          else
          {
            uint64_t realm = krb5_principal_get_realm();
            krb5_free_principal(context, *(krb5_principal *)&__b[8]);
            unsigned int inited = krb5_make_principal();
            if (inited)
            {
              os_log_t v68 = (os_log_t)sub_10001AEC8();
              os_log_type_t v67 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
              {
                sub_100015DB8((uint64_t)v132, realm);
                _os_log_error_impl((void *)&_mh_execute_header, v68, v67, "Failed to make TGS principal for realm: %s", v132, 0xCu);
              }
              objc_storeStrong((id *)&v68, 0);
              goto LABEL_98;
            }
          }
          unsigned int inited = krb5_get_init_creds_opt_alloc(context, &opt);
          if (!inited)
          {
            krb5_get_init_creds_opt_set_default_flags();
            if (opt->flags) {
              *(void *)&__b[56] = time(0) + *(void *)&opt->renew_life;
            }
            if ((opt->flags & 2) != 0) {
              *(void *)&__b[64] = time(0) + *(void *)&opt->proxiable;
            }
            else {
              *(void *)&__b[64] = time(0) + 604800;
            }
            unsigned int v109 = 1073742080;
            unsigned int inited = krb5_cc_resolve_by_uuid();
            if (inited)
            {
              os_log_t v66 = (os_log_t)sub_10001AEC8();
              os_log_type_t v65 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
              {
                id v21 = v66;
                os_log_type_t v22 = v65;
                sub_100003CE0(v64);
                _os_log_error_impl((void *)&_mh_execute_header, v21, v22, "Failed to resolve cache using uuid", v64, 2u);
              }
              objc_storeStrong((id *)&v66, 0);
            }
            else
            {
              krb5_free_principal(context, *(krb5_principal *)__b);
              *(void *)__b = 0;
              unsigned int inited = krb5_cc_get_principal(context, cache, (krb5_principal *)__b);
              if (inited)
              {
                os_log_t v63 = (os_log_t)sub_10001AEC8();
                os_log_type_t v62 = OS_LOG_TYPE_ERROR;
                if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
                {
                  os_log_type_t v19 = v63;
                  os_log_type_t v20 = v62;
                  sub_100003CE0(v61);
                  _os_log_error_impl((void *)&_mh_execute_header, v19, v20, "Failed to retrieve principal from cache", v61, 2u);
                }
                objc_storeStrong((id *)&v63, 0);
              }
              else if (*(void *)__b)
              {
                memset(v57, 0, sizeof(v57));
                krb5_cc_clear_mcred();
                *(void *)&v57[8] = *(void *)&__b[8];
                *(void *)os_log_t v57 = *(void *)__b;
                unsigned int inited = krb5_cc_retrieve_cred(context, cache, 0, (krb5_creds *)v57, (krb5_creds *)creds);
                if (!inited)
                {
                  os_log_t v56 = (os_log_t)sub_10001AEC8();
                  os_log_type_t v55 = OS_LOG_TYPE_DEBUG;
                  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
                  {
                    int v15 = v56;
                    os_log_type_t v16 = v55;
                    sub_100003CE0(v54);
                    _os_log_debug_impl((void *)&_mh_execute_header, v15, v16, "found previous ticket", v54, 2u);
                  }
                  objc_storeStrong((id *)&v56, 0);
                  unsigned int v109 = v109 & 0xFFFFFFFD | (2 * ((creds[136] & 2) != 0));
                  unsigned int v109 = v109 & 0xFFFFFFF7 | (8 * ((creds[136] & 8) != 0));
                  krb5_free_cred_contents(context, (krb5_creds *)creds);
                }
                krb5_cc_clear_mcred();
                unsigned int inited = krb5_get_kdc_cred();
                if (inited)
                {
                  os_log_t v53 = (os_log_t)sub_10001AEC8();
                  os_log_type_t v52 = OS_LOG_TYPE_ERROR;
                  if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
                  {
                    sub_100014D2C((uint64_t)v131, (uint64_t)v103, inited);
                    _os_log_error_impl((void *)&_mh_execute_header, v53, v52, "Failed to renew credentials for cache: %@, %d", v131, 0x12u);
                  }
                  objc_storeStrong((id *)&v53, 0);
                }
                else
                {
                  unsigned int inited = krb5_cc_new_unique(context, "XCTEMP", (const char *)[v103 UTF8String], &id);
                  if (inited)
                  {
                    os_log_t v51 = (os_log_t)sub_10001AEC8();
                    os_log_type_t v50 = OS_LOG_TYPE_ERROR;
                    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
                    {
                      sub_100010EA0((uint64_t)v130, inited);
                      _os_log_error_impl((void *)&_mh_execute_header, v51, v50, "error in krb5_cc_initialize: %d", v130, 8u);
                    }
                    objc_storeStrong((id *)&v51, 0);
                  }
                  else
                  {
                    unsigned int inited = krb5_cc_initialize(context, id, *(krb5_principal *)__b);
                    if (inited)
                    {
                      os_log_t v49 = (os_log_t)sub_10001AEC8();
                      os_log_type_t v48 = OS_LOG_TYPE_ERROR;
                      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                      {
                        sub_100010EA0((uint64_t)v129, inited);
                        _os_log_error_impl((void *)&_mh_execute_header, v49, v48, "error in krb5_cc_initialize: %d", v129, 8u);
                      }
                      objc_storeStrong((id *)&v49, 0);
                    }
                    else
                    {
                      unsigned int inited = krb5_cc_store_cred(context, id, v111);
                      if (inited)
                      {
                        krb5_warn();
                        os_log_t v47 = (os_log_t)sub_10001AEC8();
                        os_log_type_t v46 = OS_LOG_TYPE_ERROR;
                        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
                        {
                          sub_100010EA0((uint64_t)v128, inited);
                          _os_log_error_impl((void *)&_mh_execute_header, v47, v46, "error in krb5_cc_store_cred: %d", v128, 8u);
                        }
                        objc_storeStrong((id *)&v47, 0);
                      }
                      else
                      {
                        krb5_cc_cursor v45 = 0;
                        memset(v44, 0, sizeof(v44));
                        unsigned int inited = krb5_cc_start_seq_get(context, cache, &v45);
                        if (inited)
                        {
                          os_log_t v43 = (os_log_t)sub_10001AEC8();
                          os_log_type_t v42 = OS_LOG_TYPE_ERROR;
                          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                          {
                            sub_100010EA0((uint64_t)v127, inited);
                            _os_log_error_impl((void *)&_mh_execute_header, v43, v42, "error in krb5_cc_start_seq_get: %d", v127, 8u);
                          }
                          objc_storeStrong((id *)&v43, 0);
                        }
                        else
                        {
                          while (1)
                          {
                            unsigned int inited = krb5_cc_next_cred(context, cache, &v45, (krb5_creds *)v44);
                            if (inited) {
                              break;
                            }
                            if (!krb5_is_config_principal(context, *(krb5_const_principal *)&v44[8]))
                            {
                              unsigned int inited = krb5_cc_remove_cred(context, cache, 0, (krb5_creds *)v44);
                              if (inited)
                              {
                                os_log_t v41 = (os_log_t)sub_10001AEC8();
                                os_log_type_t v40 = OS_LOG_TYPE_ERROR;
                                if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                                {
                                  int v14 = v41;
                                  sub_100010EA0((uint64_t)v126, inited);
                                  _os_log_error_impl((void *)&_mh_execute_header, v14, v40, "error in krb5_cc_remove_cred: %d", v126, 8u);
                                }
                                objc_storeStrong((id *)&v41, 0);
                              }
                            }
                            krb5_free_cred_contents(context, (krb5_creds *)v44);
                          }
                          krb5_cc_end_seq_get(context, cache, &v45);
                          unsigned int inited = krb5_cc_store_cred(context, cache, v111);
                          if (inited)
                          {
                            os_log_t v39 = (os_log_t)sub_10001AEC8();
                            os_log_type_t v38 = OS_LOG_TYPE_ERROR;
                            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                            {
                              int v11 = [location[0] session];
                              sub_10001C170((uint64_t)v125, v11, inited);
                              _os_log_error_impl((void *)&_mh_execute_header, v39, v38, "unable to save cred in cache: %d, %d", v125, 0xEu);
                            }
                            objc_storeStrong((id *)&v39, 0);
                          }
                          uint64_t v100 = *(void *)&v111->times.endtime;
                        }
                      }
                    }
                  }
                }
              }
              else
              {
                unsigned int inited = -1765328188;
                os_log_t v60 = (os_log_t)sub_10001AEC8();
                os_log_type_t v59 = OS_LOG_TYPE_ERROR;
                if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
                {
                  v17 = v60;
                  os_log_type_t v18 = v59;
                  sub_100003CE0(v58);
                  _os_log_error_impl((void *)&_mh_execute_header, v17, v18, "Principal can not be NULL", v58, 2u);
                }
                objc_storeStrong((id *)&v60, 0);
              }
            }
          }
          goto LABEL_98;
        }
        os_log_t v75 = (os_log_t)sub_10001AEC8();
        os_log_type_t v74 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
        {
          v23 = v75;
          os_log_type_t v24 = v74;
          sub_100003CE0(v73);
          _os_log_error_impl((void *)&_mh_execute_header, v23, v24, "Failed to parse clientname", v73, 2u);
        }
        objc_storeStrong((id *)&v75, 0);
      }
      else
      {
        os_log_t v79 = (os_log_t)sub_10001AEC8();
        os_log_type_t v78 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
        {
          sub_100010EA0((uint64_t)v136, (int)[location[0] session]);
          _os_log_error_impl((void *)&_mh_execute_header, v79, v78, "unable to acquire credential without principal: %d", v136, 8u);
        }
        objc_storeStrong((id *)&v79, 0);
        unsigned int inited = -1765328188;
      }
    }
    else
    {
      os_log_t v85 = (os_log_t)sub_10001AEC8();
      os_log_type_t v84 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
      {
        sub_100010EA0((uint64_t)v138, (int)[location[0] session]);
        _os_log_error_impl((void *)&_mh_execute_header, v85, v84, "unable to acquire credential without cache uuid %d", v138, 8u);
      }
      objc_storeStrong((id *)&v85, 0);
      unsigned int inited = -1765328188;
    }
  }
  else
  {
    os_log_t v90 = (os_log_t)sub_10001AEC8();
    os_log_type_t v89 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
    {
      sub_100010EA0((uint64_t)v140, (int)[location[0] session]);
      _os_log_error_impl((void *)&_mh_execute_header, v90, v89, "unable to acquire credential without attributes: %d", v140, 8u);
    }
    objc_storeStrong((id *)&v90, 0);
    unsigned int inited = -1765328188;
  }
LABEL_98:
  if (v111) {
    krb5_free_creds(context, v111);
  }
  if (opt) {
    krb5_get_init_creds_opt_free(context, opt);
  }
  if (cache) {
    krb5_cc_close(context, cache);
  }
  if (id) {
    krb5_cc_destroy(context, id);
  }
  krb5_free_cred_contents(context, (krb5_creds *)__b);
  krb5_free_context(context);
  v123[0] = @"status";
  int v13 = +[NSNumber numberWithInt:inited];
  v124[0] = v13;
  v123[1] = @"expire";
  int v12 = +[NSNumber numberWithLong:v100];
  v124[1] = v12;
  os_log_type_t v37 = +[NSDictionary dictionaryWithObjects:v124 forKeys:v123 count:2];

  os_log_t v36 = (os_log_t)sub_10001AEC8();
  os_log_type_t v35 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
  {
    sub_100006434((uint64_t)v122, (uint64_t)v37);
    _os_log_debug_impl((void *)&_mh_execute_header, v36, v35, "do_Refresh results: %@", v122, 0xCu);
  }
  objc_storeStrong((id *)&v36, 0);
  xpc_object_t v34 = (xpc_object_t)_CFXPCCreateXPCObjectFromCFObject();
  xpc_dictionary_set_value(xdict, "result", v34);
  objc_storeStrong(&v34, 0);
  objc_storeStrong((id *)&v37, 0);
  objc_storeStrong(&v91, 0);
  objc_storeStrong(&v92, 0);
  int v93 = 0;
LABEL_109:
  objc_storeStrong(&v101, 0);
  objc_storeStrong(&v102, 0);
  objc_storeStrong(&v103, 0);
  objc_storeStrong(&xdict, 0);
  objc_storeStrong(&v117, 0);
  objc_storeStrong(location, 0);
}

@end