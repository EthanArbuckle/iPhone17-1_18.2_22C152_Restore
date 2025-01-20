@interface NWURLSessionTaskConfiguration
- (id)URLCredentialStorage;
- (id)activity;
- (id)createRegistrableDomain:(void *)a1;
- (id)initWithConfiguration:(void *)a3 task:(void *)a4 request:;
- (void)configureConnection:(uint64_t)a1;
- (void)configureParameters:(id *)a1;
- (void)configureSecProtocolOptions:(uint64_t)a1;
@end

@implementation NWURLSessionTaskConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalActivity, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_atsState, 0);
}

- (id)initWithConfiguration:(void *)a3 task:(void *)a4 request:
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)NWURLSessionTaskConfiguration;
    v11 = (id *)objc_msgSendSuper2(&v13, sel_init);
    a1 = v11;
    if (v11)
    {
      objc_storeStrong(v11 + 2, a2);
      objc_storeStrong(a1 + 3, a3);
      objc_storeStrong(a1 + 4, a4);
    }
  }

  return a1;
}

- (void)configureParameters:(id *)a1
{
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  v4 = a2;
  if (a1)
  {
    v5 = (id *)a1[3];
    v6 = v5;
    if (v5)
    {
      id v7 = v5[50];
      id v8 = v7;
      if (v7) {
        id v9 = (void *)*((void *)v7 + 20);
      }
      else {
        id v9 = 0;
      }
    }
    else
    {
      id v8 = 0;
      id v9 = 0;
    }
    id v10 = v9;
    nw_parameters_set_context(v4, v10);

    v11 = a1 + 4;
    int v12 = [a1[4] _explicitlySetNetworkServiceType];
    objc_super v13 = a1 + 2;
    uint64_t v14 = 2;
    if (v12) {
      uint64_t v14 = 4;
    }
    unint64_t v15 = [a1[v14] networkServiceType];
    if (v15 > 0xB) {
      int v16 = 0;
    }
    else {
      int v16 = dword_183D5CF20[v15];
    }
    nw_parameters_set_traffic_class(v4, v16);
    if ([*v11 _explicitlySetAllowsCellularAccess]) {
      v17 = a1 + 4;
    }
    else {
      v17 = a1 + 2;
    }
    if (([*v17 allowsCellularAccess] & 1) == 0) {
      nw_parameters_prohibit_interface_type(v4, nw_interface_type_cellular);
    }
    if ([*v11 _explicitlySetAllowsExpensiveNetworkAccess]) {
      v18 = a1 + 4;
    }
    else {
      v18 = a1 + 2;
    }
    if (([*v18 allowsExpensiveNetworkAccess] & 1) == 0) {
      nw_parameters_set_prohibit_expensive(v4, 1);
    }
    if ([*v11 _explicitlySetAllowsConstrainedNetworkAccess]) {
      v19 = a1 + 4;
    }
    else {
      v19 = a1 + 2;
    }
    if (([*v19 allowsConstrainedNetworkAccess] & 1) == 0) {
      nw_parameters_set_prohibit_constrained(v4, 1);
    }
    if ([*v11 _explicitlySetAllowsUCA]) {
      v20 = a1 + 4;
    }
    else {
      v20 = a1 + 2;
    }
    if ([*v20 _allowsUCA]) {
      nw_parameters_set_allow_ultra_constrained(v4, 1);
    }
    if (([*v13 waitsForConnectivity] & 1) == 0) {
      nw_parameters_set_indefinite(v4, 0);
    }
    if (!*v11) {
      goto LABEL_231;
    }
    CFURLRequestGetProxySettings();
    v21 = (char *)objc_claimAutoreleasedReturnValue();
    if (!v21) {
      goto LABEL_231;
    }
    *(void *)objects = _CFXPCCreateXPCObjectFromCFObject();
    xpc_object_t v22 = xpc_array_create((xpc_object_t *)objects, 1uLL);
    v23 = v22;
    id v24 = v22 ? nw_proxy_configs_create_with_schema_array(v22) : 0;

    if (!v24)
    {
LABEL_231:
      v25 = (id *)a1[3];
      if (v25)
      {
        id v26 = v25[50];
        v21 = (char *)v26;
        if (v26)
        {
          v27 = (void *)*((void *)v26 + 10);
          if (!v27)
          {
            v28 = [*((id *)v26 + 12) connectionProxyDictionary];
            if (v28)
            {
              *(void *)objects = _CFXPCCreateXPCObjectFromCFObject();
              xpc_object_t v29 = xpc_array_create((xpc_object_t *)objects, 1uLL);
              v30 = v29;
              if (v29)
              {
                id v31 = nw_proxy_configs_create_with_schema_array(v29);
                v32 = (void *)*((void *)v21 + 10);
                *((void *)v21 + 10) = v31;
              }
            }

            v27 = (void *)*((void *)v21 + 10);
          }
          id v24 = v27;
        }
        else
        {
          id v24 = 0;
        }
      }
      else
      {
        v21 = 0;
        id v24 = 0;
      }

      if (!v24)
      {
        id v126 = 0;
LABEL_52:
        nw_parameters_set_multipath_service(v4, (nw_multipath_service_t)objc_msgSend(*v13, "multipathServiceType", v114, v117));
        v34 = [*v13 _sourceApplicationBundleIdentifier];

        if (v34)
        {
          v35 = [*v13 _sourceApplicationBundleIdentifier];
          id v24 = [*v13 _sourceApplicationAuditTokenData];

          v36 = (const char *)[v35 UTF8String];
          if (v24) {
            nw_parameters_set_effective_bundle_id(v4, v36);
          }
          else {
            nw_parameters_set_source_application_by_bundle_id_internal(v4, v36);
          }
        }
        v37 = [*v13 _sourceApplicationSecondaryIdentifier];

        if (v37)
        {
          v38 = [*v13 _sourceApplicationSecondaryIdentifier];
          nw_parameters_set_account_id(v4, (const char *)[v38 UTF8String]);
        }
        v39 = [*v13 _sourceApplicationAuditTokenData];

        if (v39)
        {
          v40 = [*v13 _sourceApplicationAuditTokenData];
          if ([v40 length] != 32)
          {
            _os_crash();
            __break(1u);
            goto LABEL_87;
          }
          v41 = (_OWORD *)[v40 bytes];
          *(_OWORD *)objects = *v41;
          *(_OWORD *)&objects[16] = v41[1];
          nw_parameters_set_source_application(v4, (long long *)objects);
        }
        v42 = [*v13 _CTDataConnectionServiceType];
        if (v42)
        {
          v43 = [*v11 boundInterfaceIdentifier];
          BOOL v44 = v43 == 0;

          if (v44)
          {
            xpc_object_t v45 = xpc_array_create(0, 0);
            xpc_array_set_string(v45, 0xFFFFFFFFFFFFFFFFLL, "Cellular");
            xpc_object_t v46 = xpc_array_create(0, 0);
            v47 = [*v13 _CTDataConnectionServiceType];
            if ([v47 hasPrefix:@"kCTDataConnectionServiceType"]) {
              uint64_t v48 = [@"kCTDataConnectionServiceType" length];
            }
            else {
              uint64_t v48 = 0;
            }
            xpc_array_set_string(v46, 0xFFFFFFFFFFFFFFFFLL, (const char *)([v47 UTF8String] + v48));
            nw_parameters_set_required_netagent_classes(v4, v45, v46);
          }
        }
        if ([*v13 _requiresSecureHTTPSProxyConnection]) {
          nw_parameters_set_https_proxy_over_tls(v4, 1);
        }
        if (![*v13 _preventsSystemHTTPProxyAuthentication])
        {
LABEL_74:
          v51 = objc_msgSend(*v13, "_attributedBundleIdentifier", v115, v118);
          BOOL v52 = v51 == 0;

          if (!v52)
          {
            v53 = [*v13 _attributedBundleIdentifier];
            nw_parameters_set_attributed_bundle_identifier(v4, (const char *)[v53 UTF8String]);
          }
          nw_parameters_set_skip_stack_trace_capture(v4, 1);
          uint64_t v54 = [a1[3] countOfBytesClientExpectsToSend];
          uint64_t v55 = [a1[3] countOfBytesClientExpectsToReceive];
          nw_parameters_set_expected_workload(v4, (v55 & ~(v55 >> 63)) + (v54 & ~(v54 >> 63)));
          if ([a1[4] attribution] == 1) {
            nw_parameters_set_attribution(v4, nw_parameters_attribution_user);
          }
          v56 = [*v11 mainDocumentURL];
          v21 = [v56 host];

          v40 = -[NWURLSessionTaskConfiguration createRegistrableDomain:](v21);
          id v57 = *v11;
          v58 = [v57 URL];
          id v24 = [v58 host];

          uint64_t v127 = -[NWURLSessionTaskConfiguration createRegistrableDomain:](v24);
          v59 = [*v11 _trackerContext];
          unint64_t v2 = (unint64_t)v59;
          if (v59) {
            goto LABEL_79;
          }
          v60 = [*v11 mainDocumentURL];
          v61 = v60;
          if (v60)
          {
            v62 = [v60 scheme];
            unint64_t v63 = [v62 length] - 2;
            if (v63 >= 4)
            {
            }
            else
            {
              BOOL v64 = [v62 caseInsensitiveCompare:off_1E523C670[v63]] == 0;

              if (v64)
              {
                v59 = (char *)v40;
                if (v40 || (v59 = v21) != 0) {
LABEL_79:
                }
                  nw_parameters_set_attribution_context(v4, (const char *)[v59 UTF8String]);
              }
            }
          }
LABEL_87:
          v65 = [*v11 mainDocumentURL];
          BOOL v66 = v65 == 0;

          if (v66) {
            goto LABEL_100;
          }
          if (v40 && v127) {
            char v67 = [v40 isEqualToString:v127];
          }
          else {
            char v67 = [v21 isEqualToString:v24];
          }
          if ((v67 & 1) == 0) {
            nw_parameters_set_is_third_party_web_content(v4, 1);
          }
          CFURLRef v68 = [*v11 mainDocumentURL];
          v69 = v4;
          v70 = v69;
          if (v69)
          {
            if (v68)
            {
              BOOL v71 = -[NWConcrete_nw_url_endpoint initWithURL:]([NWConcrete_nw_url_endpoint alloc], v68);
              Class isa = v70[26].isa;
              v70[26].Class isa = (Class)v71;
            }
            else
            {
              Class isa = v69[26].isa;
              v69[26].Class isa = 0;
            }

LABEL_99:
LABEL_100:
            v73 = objc_msgSend(*v11, "boundInterfaceIdentifier", v115, v118);
            BOOL v74 = v73 == 0;

            if (!v74)
            {
              v75 = [*v11 boundInterfaceIdentifier];
              v76 = nw_interface_create_with_name((char *)[v75 UTF8String]);
              nw_parameters_require_interface(v4, &v76->super);
            }
            if ([*v11 _prohibitPrivacyProxy]) {
              nw_parameters_set_prohibit_privacy_proxy(v4, 1);
            }
            if ([*v11 _privacyProxyFailClosed]) {
              nw_parameters_set_privacy_proxy_fail_closed(v4, 1);
            }
            if ([*v11 _privacyProxyFailClosedForUnreachableHosts]) {
              nw_parameters_set_privacy_proxy_fail_closed_for_unreachable_hosts(v4, 1);
            }
            int v77 = [*v11 _privacyProxyFailClosedForUnreachableNonMainHosts];
            if (v21) {
              int v78 = v77;
            }
            else {
              int v78 = 0;
            }
            if (v78 == 1 && [v21 caseInsensitiveCompare:v24]) {
              nw_parameters_set_privacy_proxy_fail_closed_for_unreachable_hosts(v4, 1);
            }
            if ([*v11 _needsNetworkTrackingPrevention]) {
              nw_parameters_set_is_known_tracker(v4, 1);
            }
            if ([*v11 _useEnhancedPrivacyMode]) {
              nw_parameters_set_use_enhanced_privacy_mode(v4, 1);
            }
            if ([*v11 _blockTrackers]) {
              nw_parameters_set_block_trackers(v4, 1);
            }
            if ([*v11 _isWebSearchContent]) {
              nw_parameters_set_web_search_content(v4, 1);
            }
            if (![*v11 _allowPrivateAccessTokensForThirdParty])
            {
LABEL_126:
              if (!objc_msgSend(*v13, "_inPrivateBrowsing", v116, v119))
              {
LABEL_130:

                goto LABEL_131;
              }
              v81 = v4;
              v82 = v81;
              if (v81)
              {
                v81[12].Class isa = (Class)((unint64_t)v81[12].isa | 0x40000000000);
LABEL_129:

                goto LABEL_130;
              }
              v96 = __nwlog_obj();
              *(_DWORD *)objects = 136446210;
              *(void *)&objects[4] = "nw_parameters_set_using_ephemeral_configuration";
              v97 = (char *)_os_log_send_and_compose_impl();

              os_log_type_t type = OS_LOG_TYPE_ERROR;
              char v128 = 0;
              if (__nwlog_fault(v97, &type, &v128))
              {
                if (type == OS_LOG_TYPE_FAULT)
                {
                  v98 = __nwlog_obj();
                  os_log_type_t v99 = type;
                  if (os_log_type_enabled(v98, type))
                  {
                    *(_DWORD *)objects = 136446210;
                    *(void *)&objects[4] = "nw_parameters_set_using_ephemeral_configuration";
                    _os_log_impl(&dword_1830D4000, v98, v99, "%{public}s called with null parameters", objects, 0xCu);
                  }
                }
                else if (v128)
                {
                  backtrace_string = (char *)__nw_create_backtrace_string();
                  v98 = __nwlog_obj();
                  os_log_type_t v124 = type;
                  BOOL v110 = os_log_type_enabled(v98, type);
                  if (backtrace_string)
                  {
                    if (v110)
                    {
                      *(_DWORD *)objects = 136446466;
                      *(void *)&objects[4] = "nw_parameters_set_using_ephemeral_configuration";
                      *(_WORD *)&objects[12] = 2082;
                      *(void *)&objects[14] = backtrace_string;
                      _os_log_impl(&dword_1830D4000, v98, v124, "%{public}s called with null parameters, dumping backtrace:%{public}s", objects, 0x16u);
                    }

                    free(backtrace_string);
                    goto LABEL_221;
                  }
                  if (v110)
                  {
                    *(_DWORD *)objects = 136446210;
                    *(void *)&objects[4] = "nw_parameters_set_using_ephemeral_configuration";
                    _os_log_impl(&dword_1830D4000, v98, v124, "%{public}s called with null parameters, no backtrace", objects, 0xCu);
                  }
                }
                else
                {
                  v98 = __nwlog_obj();
                  os_log_type_t v113 = type;
                  if (os_log_type_enabled(v98, type))
                  {
                    *(_DWORD *)objects = 136446210;
                    *(void *)&objects[4] = "nw_parameters_set_using_ephemeral_configuration";
                    _os_log_impl(&dword_1830D4000, v98, v113, "%{public}s called with null parameters, backtrace limit exceeded", objects, 0xCu);
                  }
                }
              }
LABEL_221:
              if (v97) {
                free(v97);
              }
              goto LABEL_129;
            }
            v79 = v4;
            v80 = v79;
            if (v79)
            {
              v79[12].Class isa = (Class)((unint64_t)v79[12].isa | 0x20000000000);
LABEL_125:

              goto LABEL_126;
            }
            v92 = __nwlog_obj();
            *(_DWORD *)objects = 136446210;
            *(void *)&objects[4] = "nw_parameters_set_allow_private_access_tokens_for_third_party";
            LODWORD(v119) = 12;
            v116 = objects;
            v93 = (char *)_os_log_send_and_compose_impl();

            os_log_type_t type = OS_LOG_TYPE_ERROR;
            char v128 = 0;
            if (__nwlog_fault(v93, &type, &v128))
            {
              if (type == OS_LOG_TYPE_FAULT)
              {
                v94 = __nwlog_obj();
                os_log_type_t v95 = type;
                if (os_log_type_enabled(v94, type))
                {
                  *(_DWORD *)objects = 136446210;
                  *(void *)&objects[4] = "nw_parameters_set_allow_private_access_tokens_for_third_party";
                  _os_log_impl(&dword_1830D4000, v94, v95, "%{public}s called with null parameters", objects, 0xCu);
                }
              }
              else if (v128)
              {
                v107 = (char *)__nw_create_backtrace_string();
                v94 = __nwlog_obj();
                os_log_type_t v123 = type;
                BOOL v108 = os_log_type_enabled(v94, type);
                if (v107)
                {
                  if (v108)
                  {
                    *(_DWORD *)objects = 136446466;
                    *(void *)&objects[4] = "nw_parameters_set_allow_private_access_tokens_for_third_party";
                    *(_WORD *)&objects[12] = 2082;
                    *(void *)&objects[14] = v107;
                    _os_log_impl(&dword_1830D4000, v94, v123, "%{public}s called with null parameters, dumping backtrace:%{public}s", objects, 0x16u);
                  }

                  free(v107);
                  goto LABEL_216;
                }
                if (v108)
                {
                  *(_DWORD *)objects = 136446210;
                  *(void *)&objects[4] = "nw_parameters_set_allow_private_access_tokens_for_third_party";
                  _os_log_impl(&dword_1830D4000, v94, v123, "%{public}s called with null parameters, no backtrace", objects, 0xCu);
                }
              }
              else
              {
                v94 = __nwlog_obj();
                os_log_type_t v112 = type;
                if (os_log_type_enabled(v94, type))
                {
                  *(_DWORD *)objects = 136446210;
                  *(void *)&objects[4] = "nw_parameters_set_allow_private_access_tokens_for_third_party";
                  _os_log_impl(&dword_1830D4000, v94, v112, "%{public}s called with null parameters, backtrace limit exceeded", objects, 0xCu);
                }
              }
            }
LABEL_216:
            if (v93) {
              free(v93);
            }
            goto LABEL_125;
          }
          v85 = __nwlog_obj();
          *(_DWORD *)objects = 136446210;
          *(void *)&objects[4] = "nw_parameters_set_main_document_cfurl";
          LODWORD(v118) = 12;
          v115 = objects;
          v125 = (const char *)_os_log_send_and_compose_impl();

          os_log_type_t type = OS_LOG_TYPE_ERROR;
          char v128 = 0;
          v86 = (char *)v125;
          if (!__nwlog_fault(v125, &type, &v128))
          {
LABEL_206:
            if (v86) {
              free(v86);
            }
            goto LABEL_99;
          }
          if (type == OS_LOG_TYPE_FAULT)
          {
            v87 = __nwlog_obj();
            os_log_type_t v120 = type;
            if (os_log_type_enabled(v87, type))
            {
              *(_DWORD *)objects = 136446210;
              *(void *)&objects[4] = "nw_parameters_set_main_document_cfurl";
              _os_log_impl(&dword_1830D4000, v87, v120, "%{public}s called with null parameters", objects, 0xCu);
            }
          }
          else
          {
            if (v128)
            {
              v102 = (char *)__nw_create_backtrace_string();
              v121 = __nwlog_obj();
              HIDWORD(v118) = type;
              BOOL v103 = os_log_type_enabled(v121, type);
              if (v102)
              {
                if (v103)
                {
                  *(_DWORD *)objects = 136446466;
                  *(void *)&objects[4] = "nw_parameters_set_main_document_cfurl";
                  *(_WORD *)&objects[12] = 2082;
                  *(void *)&objects[14] = v102;
                  _os_log_impl(&dword_1830D4000, v121, BYTE4(v118), "%{public}s called with null parameters, dumping backtrace:%{public}s", objects, 0x16u);
                }

                free(v102);
              }
              else
              {
                if (v103)
                {
                  *(_DWORD *)objects = 136446210;
                  *(void *)&objects[4] = "nw_parameters_set_main_document_cfurl";
                  _os_log_impl(&dword_1830D4000, v121, BYTE4(v118), "%{public}s called with null parameters, no backtrace", objects, 0xCu);
                }
              }
              goto LABEL_205;
            }
            v87 = __nwlog_obj();
            os_log_type_t v122 = type;
            if (os_log_type_enabled(v87, type))
            {
              *(_DWORD *)objects = 136446210;
              *(void *)&objects[4] = "nw_parameters_set_main_document_cfurl";
              _os_log_impl(&dword_1830D4000, v87, v122, "%{public}s called with null parameters, backtrace limit exceeded", objects, 0xCu);
            }
          }

LABEL_205:
          v86 = (char *)v125;
          goto LABEL_206;
        }
        v49 = v4;
        v50 = v49;
        if (v49)
        {
          v49[12].Class isa = (Class)((unint64_t)v49[12].isa | 0x80000000000);
LABEL_73:

          goto LABEL_74;
        }
        v88 = __nwlog_obj();
        *(_DWORD *)objects = 136446210;
        *(void *)&objects[4] = "nw_parameters_set_prevents_system_http_proxy_authentication";
        LODWORD(v118) = 12;
        v115 = objects;
        v89 = (char *)_os_log_send_and_compose_impl();

        os_log_type_t type = OS_LOG_TYPE_ERROR;
        char v128 = 0;
        if (__nwlog_fault(v89, &type, &v128))
        {
          if (type == OS_LOG_TYPE_FAULT)
          {
            v90 = __nwlog_obj();
            os_log_type_t v91 = type;
            if (os_log_type_enabled(v90, type))
            {
              *(_DWORD *)objects = 136446210;
              *(void *)&objects[4] = "nw_parameters_set_prevents_system_http_proxy_authentication";
              _os_log_impl(&dword_1830D4000, v90, v91, "%{public}s called with null parameters", objects, 0xCu);
            }
          }
          else if (v128)
          {
            v104 = (char *)__nw_create_backtrace_string();
            v90 = __nwlog_obj();
            os_log_type_t v105 = type;
            BOOL v106 = os_log_type_enabled(v90, type);
            if (v104)
            {
              if (v106)
              {
                *(_DWORD *)objects = 136446466;
                *(void *)&objects[4] = "nw_parameters_set_prevents_system_http_proxy_authentication";
                *(_WORD *)&objects[12] = 2082;
                *(void *)&objects[14] = v104;
                _os_log_impl(&dword_1830D4000, v90, v105, "%{public}s called with null parameters, dumping backtrace:%{public}s", objects, 0x16u);
              }

              free(v104);
              goto LABEL_211;
            }
            if (v106)
            {
              *(_DWORD *)objects = 136446210;
              *(void *)&objects[4] = "nw_parameters_set_prevents_system_http_proxy_authentication";
              _os_log_impl(&dword_1830D4000, v90, v105, "%{public}s called with null parameters, no backtrace", objects, 0xCu);
            }
          }
          else
          {
            v90 = __nwlog_obj();
            os_log_type_t v111 = type;
            if (os_log_type_enabled(v90, type))
            {
              *(_DWORD *)objects = 136446210;
              *(void *)&objects[4] = "nw_parameters_set_prevents_system_http_proxy_authentication";
              _os_log_impl(&dword_1830D4000, v90, v111, "%{public}s called with null parameters, backtrace limit exceeded", objects, 0xCu);
            }
          }
        }
LABEL_211:
        if (v89) {
          free(v89);
        }
        goto LABEL_73;
      }
    }
    v33 = v4;
    id v126 = v24;
    if (v33)
    {
      objc_storeStrong(v33 + 22, v24);
LABEL_50:

      goto LABEL_52;
    }
    v83 = __nwlog_obj();
    uint64_t v127 = 136446210;
    *(_DWORD *)objects = 136446210;
    v21 = "nw_parameters_set_custom_proxy_config_array";
    *(void *)&objects[4] = "nw_parameters_set_custom_proxy_config_array";
    LODWORD(v117) = 12;
    v114 = objects;
    unint64_t v2 = 16;
    id v24 = (id)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v128 = 0;
    if (__nwlog_fault((const char *)v24, &type, &v128))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        v84 = __nwlog_obj();
        unint64_t v2 = type;
        if (os_log_type_enabled(v84, type))
        {
          *(_DWORD *)objects = 136446210;
          *(void *)&objects[4] = "nw_parameters_set_custom_proxy_config_array";
          _os_log_impl(&dword_1830D4000, v84, (os_log_type_t)v2, "%{public}s called with null parameters", objects, 0xCu);
        }
      }
      else if (v128)
      {
        unint64_t v2 = (unint64_t)__nw_create_backtrace_string();
        v84 = __nwlog_obj();
        os_log_type_t v100 = type;
        BOOL v101 = os_log_type_enabled(v84, type);
        if (v2)
        {
          if (v101)
          {
            *(_DWORD *)objects = 136446466;
            *(void *)&objects[4] = "nw_parameters_set_custom_proxy_config_array";
            *(_WORD *)&objects[12] = 2082;
            *(void *)&objects[14] = v2;
            _os_log_impl(&dword_1830D4000, v84, v100, "%{public}s called with null parameters, dumping backtrace:%{public}s", objects, 0x16u);
          }

          free((void *)v2);
          goto LABEL_200;
        }
        if (v101)
        {
          *(_DWORD *)objects = 136446210;
          *(void *)&objects[4] = "nw_parameters_set_custom_proxy_config_array";
          _os_log_impl(&dword_1830D4000, v84, v100, "%{public}s called with null parameters, no backtrace", objects, 0xCu);
        }
      }
      else
      {
        v84 = __nwlog_obj();
        unint64_t v2 = type;
        if (os_log_type_enabled(v84, type))
        {
          *(_DWORD *)objects = 136446210;
          *(void *)&objects[4] = "nw_parameters_set_custom_proxy_config_array";
          _os_log_impl(&dword_1830D4000, v84, (os_log_type_t)v2, "%{public}s called with null parameters, backtrace limit exceeded", objects, 0xCu);
        }
      }
    }
LABEL_200:
    if (v24) {
      free(v24);
    }
    goto LABEL_50;
  }
LABEL_131:
}

- (id)createRegistrableDomain:(void *)a1
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  unint64_t v2 = v1;
  if (v1)
  {
    id v4 = v1;
    unint64_t v5 = [v4 length];
    if (v5 >= 0x101) {
      goto LABEL_22;
    }
    unint64_t v6 = v5;
    if (!v5)
    {
      xpc_object_t v22 = __nwlog_obj();
      os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
      *(_DWORD *)dest = 136446210;
      id v31 = "strict_malloc";
      LODWORD(v27) = 12;
      id v26 = dest;
      v23 = (void *)_os_log_send_and_compose_impl();

      id result = (id)__nwlog_abort((uint64_t)v23);
      if (result) {
        goto LABEL_43;
      }
      free(v23);
    }
    id v7 = (unsigned __int16 *)malloc_type_malloc(2 * v6, 0xF2B69DE5uLL);
    if (v7)
    {
      objc_msgSend(v4, "getCharacters:range:", v7, 0, v6);
      if (!v6)
      {
LABEL_21:
        free(v7);
        goto LABEL_22;
      }
LABEL_7:
      uint64_t v8 = 0;
      char v9 = 0;
      char v10 = 1;
      do
      {
        int v11 = v7[v8];
        if ((v11 - 65) <= 0x19)
        {
          v11 += 32;
          v7[v8] = v11;
          char v9 = 1;
        }
        v10 &= (v11 - 32) < 0x60;
        ++v8;
      }
      while (v6 != v8);
      if (v10)
      {
        if (v9)
        {
          int v12 = NSString;
          objc_super v13 = v7;
          unint64_t v14 = v6;
          goto LABEL_19;
        }
      }
      else
      {
        if (createIDNAEncodedDomain__onceToken != -1) {
          dispatch_once(&createIDNAEncodedDomain__onceToken, &__block_literal_global_15962);
        }
        UErrorCode pErrorCode = U_ZERO_ERROR;
        UIDNAInfo pInfo = (UIDNAInfo)xmmword_183D5CE00;
        int32_t v15 = uidna_nameToASCII((const UIDNA *)createIDNAEncodedDomain__idna, v7, v6, dest, 256, &pInfo, &pErrorCode);
        if (pErrorCode <= U_ZERO_ERROR && pInfo.errors < 0x40)
        {
          unint64_t v14 = v15;
          objc_super v13 = dest;
          int v12 = NSString;
LABEL_19:
          int v16 = objc_msgSend(v12, "stringWithCharacters:length:", v13, v14, v26, v27);
          free(v7);

          if (!v16) {
            goto LABEL_33;
          }
LABEL_23:
          if ([v16 getCString:dest maxLength:256 encoding:1])
          {
            size_t v17 = strlen((const char *)dest);
            if (v17 && *((unsigned char *)dest + v17 - 1) == 46) {
              *((unsigned char *)dest + v17 - 1) = 0;
            }
            unint64_t TopLevelDomain = _CFHostGetTopLevelDomain();
            v3 = 0;
            if (TopLevelDomain && TopLevelDomain > (unint64_t)dest + 1)
            {
              v19 = (UChar *)(TopLevelDomain - 2);
              do
              {
                v20 = v19;
                if (v19 < dest) {
                  break;
                }
                v19 = (UChar *)((char *)v19 - 1);
              }
              while (*(unsigned char *)v20 != 46);
              v3 = [NSString stringWithCString:(char *)v20 + 1 encoding:1];
            }
            goto LABEL_34;
          }
LABEL_33:
          v3 = 0;
LABEL_34:

          goto LABEL_35;
        }
      }
      goto LABEL_21;
    }
    id v24 = __nwlog_obj();
    os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    *(_DWORD *)dest = 136446466;
    id v31 = "strict_malloc";
    __int16 v32 = 2048;
    uint64_t v33 = 2 * v6;
    LODWORD(v27) = 22;
    v25 = (void *)_os_log_send_and_compose_impl();

    id result = (id)__nwlog_abort((uint64_t)v25);
    if (!result)
    {
      free(v25);
      objc_msgSend(v4, "getCharacters:range:", 0, 0, v6, dest, v27);
      if (!v6)
      {
LABEL_22:
        int v16 = objc_msgSend(v4, "copy", v26, v27);

        if (!v16) {
          goto LABEL_33;
        }
        goto LABEL_23;
      }
      goto LABEL_7;
    }
LABEL_43:
    __break(1u);
    return result;
  }
  v3 = 0;
LABEL_35:

  return v3;
}

void __57__NWURLSessionTaskConfiguration_createIDNAEncodedDomain___block_invoke()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  code[0] = U_ZERO_ERROR;
  createIDNAEncodedDomain__idna = MEMORY[0x1853190D0](60, code);
  if (code[0] >= U_ILLEGAL_ARGUMENT_ERROR)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v0 = (id)gLogObj;
    os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
    id v1 = u_errorName(code[0]);
    code[1] = 136446466;
    id v4 = "-[NWURLSessionTaskConfiguration createIDNAEncodedDomain:]_block_invoke";
    __int16 v5 = 2080;
    unint64_t v6 = v1;
    unint64_t v2 = (void *)_os_log_send_and_compose_impl();

    if (__nwlog_abort((uint64_t)v2)) {
      __break(1u);
    }
    else {
      free(v2);
    }
  }
}

- (void)configureSecProtocolOptions:(uint64_t)a1
{
  options = a2;
  if (a1)
  {
    sec_protocol_options_set_min_tls_protocol_version(options, (tls_protocol_version_t)[*(id *)(a1 + 16) TLSMinimumSupportedProtocolVersion]);
    sec_protocol_options_set_max_tls_protocol_version(options, (tls_protocol_version_t)[*(id *)(a1 + 16) TLSMaximumSupportedProtocolVersion]);
    if ([*(id *)(a1 + 16) _allowsTLSSessionTickets]) {
      sec_protocol_options_set_tls_tickets_enabled(options, 1);
    }
  }
}

- (void)configureConnection:(uint64_t)a1
{
  id v6 = a2;
  if (a1)
  {
    v3 = -[NWURLSessionTaskConfiguration activity](a1);
    nw_connection_start_activity(v6, v3);

    uint64_t v4 = [*(id *)(a1 + 24) countOfBytesClientExpectsToSend];
    if (v4 >= 1) {
      nw_connection_increment_estimated_bytes(v6, 0, v4);
    }
    uint64_t v5 = [*(id *)(a1 + 24) countOfBytesClientExpectsToReceive];
    if (v5 >= 1) {
      nw_connection_increment_estimated_bytes(v6, 1, v5);
    }
  }
}

- (id)activity
{
  if (a1)
  {
    unint64_t v2 = (id *)(a1 + 40);
    id v1 = *(void **)(a1 + 40);
    if (v1)
    {
      id v3 = v1;
    }
    else
    {
      id v4 = *(id *)(a1 + 24);
      objc_msgSend(v4, "_nw_activity");
      id v3 = (id)objc_claimAutoreleasedReturnValue();

      if (!v3)
      {
        id v3 = nw_activity_create(12, 2);
        nw_activity_activate(v3);
      }
      objc_storeStrong(v2, v3);
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)URLCredentialStorage
{
  if (!a1) {
    goto LABEL_4;
  }
  uint64_t v1 = *(void *)(a1 + 24);
  if (v1)
  {
    if (*(unsigned char *)(v1 + 21))
    {
LABEL_4:
      id v2 = 0;
      goto LABEL_12;
    }
    id v3 = *(id *)(v1 + 400);
    id v4 = v3;
    if (v3)
    {
      uint64_t v5 = (void *)*((void *)v3 + 7);
      if (!v5)
      {
        id v6 = [*((id *)v3 + 12) URLCredentialStorage];
        uint64_t v7 = v6;
        if (v6)
        {
          uint64_t v8 = v6;
          char v9 = objc_alloc_init(NWConcrete_nw_authentication_credential_storage);
          credentialStorage = v9->credentialStorage;
          v9->credentialStorage = v8;

          int v11 = (void *)v4[7];
          v4[7] = v9;
        }
        uint64_t v5 = (void *)v4[7];
      }
      id v2 = v5;
      goto LABEL_11;
    }
  }
  else
  {
    id v4 = 0;
  }
  id v2 = 0;
LABEL_11:

LABEL_12:

  return v2;
}

@end