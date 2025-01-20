@interface NWConcrete_nw_path
- (NSString)description;
- (NWConcrete_nw_path)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
@end

@implementation NWConcrete_nw_path

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->description, 0);
  objc_storeStrong((id *)&self->proxy_settings, 0);
  objc_storeStrong((id *)&self->proxy_configs, 0);
  objc_storeStrong((id *)&self->network_agent_dictionary, 0);
  objc_storeStrong((id *)&self->group_members, 0);
  objc_storeStrong((id *)&self->gateways, 0);
  objc_storeStrong((id *)&self->override_extra_interface_options, 0);
  objc_storeStrong((id *)&self->override_resolver_configs, 0);
  objc_storeStrong((id *)&self->resolver_configs, 0);
  objc_storeStrong((id *)&self->fallback_agent_types, 0);
  objc_storeStrong((id *)&self->fallback_agent_domains, 0);
  objc_storeStrong((id *)&self->fallback_interface, 0);
  objc_storeStrong((id *)&self->delegate, 0);
  objc_storeStrong((id *)&self->direct, 0);
  objc_storeStrong((id *)&self->override_interface, 0);
  objc_storeStrong((id *)&self->override_local_endpoint, 0);
  objc_storeStrong((id *)&self->flows, 0);
  objc_storeStrong((id *)&self->resolved_endpoints, 0);
  objc_storeStrong((id *)&self->discovered_endpoints, 0);
  objc_storeStrong((id *)&self->advertise_descriptor, 0);
  objc_storeStrong((id *)&self->browse_descriptor, 0);
  objc_storeStrong((id *)&self->group_descriptor, 0);
  objc_storeStrong((id *)&self->endpoint, 0);

  objc_storeStrong((id *)&self->parameters, 0);
}

- (NSString)description
{
  uint64_t v202 = *MEMORY[0x1E4F143B8];
  uint64_t v158 = 0;
  v159 = &v158;
  uint64_t v160 = 0x3032000000;
  v161 = __Block_byref_object_copy__68682;
  v162 = __Block_byref_object_dispose__68683;
  id v163 = 0;
  p_description_lock = &self->description_lock;
  v157[0] = MEMORY[0x1E4F143A8];
  v157[1] = 3221225472;
  v157[2] = __33__NWConcrete_nw_path_description__block_invoke;
  v157[3] = &unk_1E524B978;
  v157[4] = self;
  v157[5] = &v158;
  os_unfair_lock_lock(&self->description_lock);
  __33__NWConcrete_nw_path_description__block_invoke((uint64_t)v157);
  os_unfair_lock_unlock(p_description_lock);
  v4 = (void *)v159[5];
  if (v4)
  {
    v5 = v4;
    goto LABEL_199;
  }
  v6 = self;
  v7 = v6;
  if (!v6)
  {
    v135 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    *(void *)&buf[4] = "nw_path_create_description";
    v136 = (char *)_os_log_send_and_compose_impl();

    out[0] = 16;
    applier[0] = 0;
    if (__nwlog_fault(v136, out, applier))
    {
      if (out[0] == 17)
      {
        v137 = __nwlog_obj();
        os_log_type_t v138 = out[0];
        if (os_log_type_enabled(v137, (os_log_type_t)out[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_path_create_description";
          _os_log_impl(&dword_1830D4000, v137, v138, "%{public}s called with null path", buf, 0xCu);
        }
      }
      else if (applier[0])
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        v137 = __nwlog_obj();
        os_log_type_t v140 = out[0];
        BOOL v141 = os_log_type_enabled(v137, (os_log_type_t)out[0]);
        if (backtrace_string)
        {
          if (v141)
          {
            *(_DWORD *)buf = 136446466;
            *(void *)&buf[4] = "nw_path_create_description";
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = backtrace_string;
            _os_log_impl(&dword_1830D4000, v137, v140, "%{public}s called with null path, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_195;
        }
        if (v141)
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_path_create_description";
          _os_log_impl(&dword_1830D4000, v137, v140, "%{public}s called with null path, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        v137 = __nwlog_obj();
        os_log_type_t v142 = out[0];
        if (os_log_type_enabled(v137, (os_log_type_t)out[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = "nw_path_create_description";
          _os_log_impl(&dword_1830D4000, v137, v142, "%{public}s called with null path, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_195:
    if (v136) {
      free(v136);
    }
    goto LABEL_197;
  }
  direct = (char *)v6->direct;
  if (direct)
  {
    v9 = direct;
    int v10 = v9[84];

    if (v10)
    {
      v11 = nw_interface_radio_type_to_string(v10);
    }
    else
    {
      v12 = v7->direct;
      if (v12)
      {
        v13 = v12;
        int v14 = *((_DWORD *)v13 + 24);

        if (v14 == 1) {
          v11 = "802.11";
        }
        else {
          v11 = 0;
        }
      }
      else
      {
        v11 = 0;
      }
    }
    snprintf(__str, 0x28uLL, ", interface: %s", direct + 104);
  }
  else
  {
    v11 = 0;
    __str[0] = 0;
  }
  BOOL is_viable = nw_path_is_viable(v7);
  v16 = ", viable";
  if (!is_viable) {
    v16 = "";
  }
  v154 = v16;
  v17 = v7;
  v18 = v17;
  unsigned int routing_result = v17->policy_result.routing_result;
  if (routing_result == 6 || routing_result == 12)
  {
    unsigned int tunnel_interface_index = v17->policy_result.routing_result_parameter.tunnel_interface_index;

    if (tunnel_interface_index)
    {
      v21 = ", scoped";
      goto LABEL_22;
    }
  }
  else
  {
  }
  v21 = "";
LABEL_22:
  v153 = v21;
  v22 = v18;
  BOOL v23 = (*((unsigned char *)v22 + 473) & 0x40) == 0;

  v24 = ", ipv4";
  if (v23) {
    v24 = "";
  }
  v152 = v24;
  v25 = v22;
  BOOL v26 = *((char *)v22 + 473) < 0;

  if (v26) {
    v27 = ", ipv6";
  }
  else {
    v27 = "";
  }
  v28 = v25;
  nw_path_update_dns(v28);
  v151 = v27;
  resolver_configs = v28->resolver_configs;
  if (resolver_configs)
  {
    BOOL v30 = (Class)(resolver_configs[3].super.super.isa - resolver_configs[2].super.super.isa) < (Class)8;

    if (v30) {
      v31 = "";
    }
    else {
      v31 = ", dns";
    }
  }
  else
  {

    v31 = "";
  }
  if (nw_path_is_expensive(&v28->super)) {
    v32 = ", expensive";
  }
  else {
    v32 = "";
  }
  BOOL is_constrained = nw_path_is_constrained(&v28->super);
  v34 = ", constrained";
  if (!is_constrained) {
    v34 = "";
  }
  v150 = v34;
  int is_ultra_constrained = nw_path_is_ultra_constrained(v28);
  v36 = ", ultra constrained";
  if (!is_ultra_constrained) {
    v36 = "";
  }
  v149 = v36;
  BOOL v37 = nw_path_uses_interface_type(&v28->super, nw_interface_type_wifi);
  v38 = ", uses wifi";
  if (!v37) {
    v38 = "";
  }
  v148 = v38;
  BOOL v39 = nw_path_uses_interface_type(&v28->super, nw_interface_type_cellular);
  v146 = v32;
  v147 = v31;
  v40 = ", uses cell";
  if (!v39) {
    v40 = "";
  }
  v145 = v40;
  v41 = v28;
  v42 = v41;
  if (v41->proxy_settings)
  {

LABEL_46:
    v44 = ", proxy";
    goto LABEL_47;
  }
  BOOL v43 = v41->proxy_configs == 0;

  if (!v43) {
    goto LABEL_46;
  }
  v44 = "";
LABEL_47:
  long long v178 = 0u;
  memset(v179, 0, sizeof(v179));
  long long v176 = 0u;
  long long v177 = 0u;
  long long v174 = 0u;
  long long v175 = 0u;
  long long v173 = 0u;
  memset(buf, 0, sizeof(buf));
  if (!nw_path_should_fallback(v42, 0)) {
    goto LABEL_63;
  }
  v45 = v42;
  *(void *)v198 = 0;
  v199 = v198;
  uint64_t v200 = 0x2020000000;
  v201 = buf;
  *(void *)v194 = 0;
  v195 = v194;
  uint64_t v196 = 0x2020000000;
  uint64_t v197 = 150;
  v168 = 0;
  v169 = &v168;
  uint64_t v170 = 0x2020000000;
  char v171 = 0;
  uint64_t v164 = 0;
  v165 = &v164;
  uint64_t v166 = 0x2020000000;
  char v167 = 1;
  int v46 = snprintf((char *)buf, 0x96uLL, "%sfallback: {", ", ");
  v47 = v195;
  unint64_t v48 = *((void *)v195 + 3);
  BOOL v49 = v48 > v46;
  unint64_t v50 = v48 - v46;
  if (v49)
  {
    if (v46 >= 1)
    {
      *((void *)v199 + 3) += v46;
      *((void *)v47 + 3) = v50;
    }
  }
  else
  {
    **((unsigned char **)v199 + 3) = 0;
    *((unsigned char *)v169 + 24) = 1;
  }
  *((unsigned char *)v165 + 24) = 0;
  if (!*((unsigned char *)v169 + 24))
  {
    fallback_interface = v45->fallback_interface;
    if (!fallback_interface) {
      goto LABEL_204;
    }
    int v76 = snprintf(*((char **)v199 + 3), *((void *)v195 + 3), "%sinterface: %s", "", (const char *)fallback_interface + 104);
    v77 = v195;
    unint64_t v78 = *((void *)v195 + 3);
    BOOL v49 = v78 > v76;
    unint64_t v79 = v78 - v76;
    if (v49)
    {
      if (v76 >= 1)
      {
        *((void *)v199 + 3) += v76;
        *((void *)v77 + 3) = v79;
      }
    }
    else
    {
      **((unsigned char **)v199 + 3) = 0;
      *((unsigned char *)v169 + 24) = 1;
    }
    *((unsigned char *)v165 + 24) = 1;
    if (!*((unsigned char *)v169 + 24))
    {
LABEL_204:
      if (!uuid_is_null(v45->fallback_agent))
      {
        *(_OWORD *)out = 0u;
        memset(v190, 0, 21);
        uuid_unparse(v45->fallback_agent, out);
        v98 = ", ";
        if (!*((unsigned char *)v165 + 24)) {
          v98 = "";
        }
        int v99 = snprintf(*((char **)v199 + 3), *((void *)v195 + 3), "%sagent: %s", v98, out);
        v100 = v195;
        unint64_t v101 = *((void *)v195 + 3);
        BOOL v49 = v101 > v99;
        unint64_t v102 = v101 - v99;
        if (v49)
        {
          if (v99 >= 1)
          {
            *((void *)v199 + 3) += v99;
            *((void *)v100 + 3) = v102;
          }
        }
        else
        {
          **((unsigned char **)v199 + 3) = 0;
          *((unsigned char *)v169 + 24) = 1;
        }
        *((unsigned char *)v165 + 24) = 1;
      }
    }
  }
  if (!*((unsigned char *)v169 + 24))
  {
    fallback_agent_domains = v45->fallback_agent_domains;
    if (fallback_agent_domains)
    {
      if (xpc_array_get_count(fallback_agent_domains) && *xpc_array_get_string(v45->fallback_agent_domains, 0))
      {
        v81 = ", ";
        if (!*((unsigned char *)v165 + 24)) {
          v81 = "";
        }
        int v82 = snprintf(*((char **)v199 + 3), *((void *)v195 + 3), "%sagent_domains: {", v81);
        v83 = v195;
        unint64_t v84 = *((void *)v195 + 3);
        BOOL v49 = v84 > v82;
        unint64_t v85 = v84 - v82;
        if (v49)
        {
          if (v82 >= 1)
          {
            *((void *)v199 + 3) += v82;
            *((void *)v83 + 3) = v85;
          }
        }
        else
        {
          **((unsigned char **)v199 + 3) = 0;
          *((unsigned char *)v169 + 24) = 1;
        }
        *((unsigned char *)v165 + 24) = 0;
        v115 = v45->fallback_agent_domains;
        *(void *)out = MEMORY[0x1E4F143A8];
        *(void *)&out[8] = 3221225472;
        *(void *)v190 = ___ZL28nw_path_fallback_descriptionP18NWConcrete_nw_pathPcm_block_invoke;
        *(void *)&v190[8] = &unk_1E5248410;
        *(void *)&v190[16] = v198;
        v191 = v194;
        v192 = &v164;
        v193 = &v168;
        xpc_array_apply(v115, out);
        *((unsigned char *)v165 + 24) = 0;
        int v116 = snprintf(*((char **)v199 + 3), *((void *)v195 + 3), "%s}", "");
        v117 = v195;
        unint64_t v118 = *((void *)v195 + 3);
        BOOL v49 = v118 > v116;
        unint64_t v119 = v118 - v116;
        if (v49)
        {
          if (v116 >= 1)
          {
            *((void *)v199 + 3) += v116;
            *((void *)v117 + 3) = v119;
          }
        }
        else
        {
          **((unsigned char **)v199 + 3) = 0;
          *((unsigned char *)v169 + 24) = 1;
        }
        *((unsigned char *)v165 + 24) = 1;
      }
    }
  }
  if (!*((unsigned char *)v169 + 24))
  {
    fallback_agent_types = v45->fallback_agent_types;
    if (fallback_agent_types)
    {
      if (xpc_array_get_count(fallback_agent_types) && *xpc_array_get_string(v45->fallback_agent_types, 0))
      {
        v87 = ", ";
        if (!*((unsigned char *)v165 + 24)) {
          v87 = "";
        }
        int v88 = snprintf(*((char **)v199 + 3), *((void *)v195 + 3), "%sagent_types: {", v87);
        v89 = v195;
        unint64_t v90 = *((void *)v195 + 3);
        BOOL v49 = v90 > v88;
        unint64_t v91 = v90 - v88;
        if (v49)
        {
          if (v88 >= 1)
          {
            *((void *)v199 + 3) += v88;
            *((void *)v89 + 3) = v91;
          }
        }
        else
        {
          **((unsigned char **)v199 + 3) = 0;
          *((unsigned char *)v169 + 24) = 1;
        }
        *((unsigned char *)v165 + 24) = 0;
        v120 = v45->fallback_agent_types;
        *(void *)applier = MEMORY[0x1E4F143A8];
        uint64_t v182 = 3221225472;
        v183 = ___ZL28nw_path_fallback_descriptionP18NWConcrete_nw_pathPcm_block_invoke_2;
        v184 = &unk_1E5248410;
        v185 = v198;
        v186 = v194;
        v187 = &v164;
        v188 = &v168;
        xpc_array_apply(v120, applier);
        *((unsigned char *)v165 + 24) = 0;
        int v121 = snprintf(*((char **)v199 + 3), *((void *)v195 + 3), "%s}", "");
        v122 = v195;
        unint64_t v123 = *((void *)v195 + 3);
        BOOL v49 = v123 > v121;
        unint64_t v124 = v123 - v121;
        if (v49)
        {
          if (v121 >= 1)
          {
            *((void *)v199 + 3) += v121;
            *((void *)v122 + 3) = v124;
          }
        }
        else
        {
          **((unsigned char **)v199 + 3) = 0;
          *((unsigned char *)v169 + 24) = 1;
        }
        *((unsigned char *)v165 + 24) = 1;
      }
    }
  }
  if (*((unsigned char *)v169 + 24))
  {
    v51 = v165;
    v52 = v199;
LABEL_57:
    v53 = v195;
    goto LABEL_58;
  }
  char v92 = *((unsigned char *)v22 + 473);
  v51 = v165;
  v52 = v199;
  if (v92)
  {
    v93 = ", ";
    if (!*((unsigned char *)v165 + 24)) {
      v93 = "";
    }
    int v94 = snprintf(*((char **)v199 + 3), *((void *)v195 + 3), "%sweak", v93);
    v95 = v195;
    unint64_t v96 = *((void *)v195 + 3);
    unint64_t v97 = v96 - v94;
    if (v96 <= v94)
    {
      **((unsigned char **)v199 + 3) = 0;
      *((unsigned char *)v169 + 24) = 1;
      v52 = v199;
    }
    else
    {
      v52 = v199;
      if (v94 >= 1)
      {
        *((void *)v199 + 3) += v94;
        *((void *)v95 + 3) = v97;
      }
    }
    v51 = v165;
    *((unsigned char *)v165 + 24) = 1;
    if (*((unsigned char *)v169 + 24)) {
      goto LABEL_57;
    }
    char v92 = *((unsigned char *)v22 + 473);
  }
  if ((v92 & 2) != 0)
  {
    v103 = (char *)*((void *)v52 + 3);
    v104 = ", ";
    if (!*((unsigned char *)v51 + 24)) {
      v104 = "";
    }
    int v105 = snprintf(v103, *((void *)v195 + 3), "%sno fallback timer", v104);
    v106 = v195;
    unint64_t v107 = *((void *)v195 + 3);
    unint64_t v108 = v107 - v105;
    if (v107 <= v105)
    {
      **((unsigned char **)v199 + 3) = 0;
      *((unsigned char *)v169 + 24) = 1;
      v52 = v199;
    }
    else
    {
      v52 = v199;
      if (v105 >= 1)
      {
        *((void *)v199 + 3) += v105;
        *((void *)v106 + 3) = v108;
      }
    }
    v51 = v165;
    *((unsigned char *)v165 + 24) = 1;
    if (*((unsigned char *)v169 + 24)) {
      goto LABEL_57;
    }
    char v92 = *((unsigned char *)v22 + 473);
  }
  if ((v92 & 4) != 0)
  {
    v109 = (char *)*((void *)v52 + 3);
    v110 = ", ";
    if (!*((unsigned char *)v51 + 24)) {
      v110 = "";
    }
    int v111 = snprintf(v109, *((void *)v195 + 3), "%sforced", v110);
    v112 = v195;
    unint64_t v113 = *((void *)v195 + 3);
    unint64_t v114 = v113 - v111;
    if (v113 <= v111)
    {
      **((unsigned char **)v199 + 3) = 0;
      *((unsigned char *)v169 + 24) = 1;
      v52 = v199;
    }
    else
    {
      v52 = v199;
      if (v111 >= 1)
      {
        *((void *)v199 + 3) += v111;
        *((void *)v112 + 3) = v114;
      }
    }
    v51 = v165;
    *((unsigned char *)v165 + 24) = 1;
    if (*((unsigned char *)v169 + 24)) {
      goto LABEL_57;
    }
    char v92 = *((unsigned char *)v22 + 473);
  }
  if ((v92 & 8) != 0)
  {
    v127 = (char *)*((void *)v52 + 3);
    v128 = ", ";
    if (!*((unsigned char *)v51 + 24)) {
      v128 = "";
    }
    int v129 = snprintf(v127, *((void *)v195 + 3), "%spreferred", v128);
    v53 = v195;
    unint64_t v130 = *((void *)v195 + 3);
    unint64_t v131 = v130 - v129;
    if (v130 <= v129)
    {
      **((unsigned char **)v199 + 3) = 0;
      *((unsigned char *)v169 + 24) = 1;
      v52 = v199;
      v53 = v195;
    }
    else
    {
      v52 = v199;
      if (v129 >= 1)
      {
        *((void *)v199 + 3) += v129;
        *((void *)v53 + 3) = v131;
      }
    }
    v51 = v165;
    *((unsigned char *)v165 + 24) = 1;
    if (*((unsigned char *)v169 + 24)) {
      goto LABEL_58;
    }
    v126 = ", ";
  }
  else
  {
    v53 = v195;
    BOOL v125 = *((unsigned char *)v51 + 24) == 0;
    v126 = ", ";
    if (v125) {
      v126 = "";
    }
  }
  int v132 = snprintf(*((char **)v52 + 3), *((void *)v53 + 3), "%sgeneration: %u", v126, v45->fallback_generation);
  v53 = v195;
  unint64_t v133 = *((void *)v195 + 3);
  unint64_t v134 = v133 - v132;
  if (v133 <= v132)
  {
    **((unsigned char **)v199 + 3) = 0;
    *((unsigned char *)v169 + 24) = 1;
    v52 = v199;
    v53 = v195;
  }
  else
  {
    v52 = v199;
    if (v132 >= 1)
    {
      *((void *)v199 + 3) += v132;
      *((void *)v53 + 3) = v134;
    }
  }
  v51 = v165;
  *((unsigned char *)v165 + 24) = 1;
LABEL_58:
  *((unsigned char *)v51 + 24) = 0;
  int v54 = snprintf(*((char **)v52 + 3), *((void *)v53 + 3), "%s}", "");
  v55 = v195;
  unint64_t v56 = *((void *)v195 + 3);
  BOOL v49 = v56 > v54;
  unint64_t v57 = v56 - v54;
  if (v49)
  {
    if (v54 >= 1)
    {
      *((void *)v199 + 3) += v54;
      *((void *)v55 + 3) = v57;
    }
  }
  else
  {
    **((unsigned char **)v199 + 3) = 0;
    *((unsigned char *)v169 + 24) = 1;
  }
  *((unsigned char *)v165 + 24) = 1;
  _Block_object_dispose(&v164, 8);
  _Block_object_dispose(&v168, 8);
  _Block_object_dispose(v194, 8);
  _Block_object_dispose(v198, 8);

LABEL_63:
  v58 = v42;
  v59 = v58;
  if (v18->policy_result.routing_result != 4)
  {

LABEL_68:
    v194[0] = 0;
    int flow_divert_aggregate_unit = v59->policy_result.flow_divert_aggregate_unit;
    if (!flow_divert_aggregate_unit) {
      goto LABEL_66;
    }
    goto LABEL_69;
  }
  int v60 = v58->policy_result.routing_result_parameter.tunnel_interface_index;

  if (!v60) {
    goto LABEL_68;
  }
  snprintf(v194, 0x18uLL, ", flow divert: %u", v60);
  int flow_divert_aggregate_unit = v59->policy_result.flow_divert_aggregate_unit;
  if (!flow_divert_aggregate_unit)
  {
LABEL_66:
    v198[0] = 0;
    goto LABEL_70;
  }
LABEL_69:
  snprintf(v198, 0x1FuLL, ", flow divert agg: %x", flow_divert_aggregate_unit);
LABEL_70:
  unsigned int up = v59->estimates.up;
  uint64_t v63 = 0x8000 << up;
  if (up > 0x30) {
    uint64_t v63 = -1;
  }
  if (v59->estimates.up && v63) {
    snprintf(applier, 0x31uLL, ", estimated upload: %lluBps", v63);
  }
  else {
    applier[0] = 0;
  }
  unsigned int down = v59->estimates.down;
  uint64_t v65 = 0x8000 << down;
  if (down > 0x30) {
    uint64_t v65 = -1;
  }
  if (v59->estimates.down && v65) {
    snprintf(out, 0x33uLL, ", estimated download: %lluBps", v65);
  }
  else {
    out[0] = 0;
  }
  v168 = 0;
  uint64_t status = v59->status;
  if (status > 3) {
    v67 = "unknown";
  }
  else {
    v67 = off_1E5248570[status];
  }
  v68 = v59;
  reason_description = v68->reason_description;

  v70 = "[";
  if (v11)
  {
    v71 = v11;
  }
  else
  {
    v70 = "";
    v71 = "";
  }
  v72 = "]";
  if (!v11) {
    v72 = "";
  }
  asprintf(&v168, "%s (%s)%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s", v67, reason_description, v154, __str, v70, v71, v72, v153, v152, v151, v147, v44, v146, v150, v149, (const char *)buf, v194,
    v198,
    applier,
    out,
    v148,
    v145);
  v73 = v168;

  if (!v73)
  {
LABEL_197:
    v74 = 0;
    goto LABEL_198;
  }
  v74 = (__CFString *)CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v73, 0x8000100u, (CFAllocatorRef)*MEMORY[0x1E4F1CF90]);
LABEL_198:
  v155[0] = MEMORY[0x1E4F143A8];
  v155[1] = 3221225472;
  v155[2] = __33__NWConcrete_nw_path_description__block_invoke_2;
  v155[3] = &unk_1E524B9A0;
  v155[4] = v7;
  v143 = v74;
  v156 = v143;
  os_unfair_lock_lock(p_description_lock);
  __33__NWConcrete_nw_path_description__block_invoke_2((uint64_t)v155);
  os_unfair_lock_unlock(p_description_lock);
  v5 = v143;

LABEL_199:
  _Block_object_dispose(&v158, 8);

  return (NSString *)v5;
}

- (void)dealloc
{
  reason_description = self->reason_description;
  if (reason_description)
  {
    free(reason_description);
    self->reason_description = 0;
  }
  netagents = self->policy_result.netagents;
  if (netagents)
  {
    free(netagents);
    self->policy_result.netagents = 0;
  }
  interface_options = self->policy_result.interface_options;
  if (interface_options)
  {
    free(interface_options);
    self->policy_result.interface_options = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)NWConcrete_nw_path;
  [(NWConcrete_nw_path *)&v6 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(NWConcrete_nw_path);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __35__NWConcrete_nw_path_copyWithZone___block_invoke;
  v9[3] = &unk_1E524B9A0;
  v5 = v4;
  int v10 = v5;
  v11 = self;
  objc_super v6 = self;
  os_unfair_lock_lock(&v6->lock);
  __35__NWConcrete_nw_path_copyWithZone___block_invoke((uint64_t)v9);
  os_unfair_lock_unlock(&v6->lock);

  v7 = v5;
  return v7;
}

- (NWConcrete_nw_path)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)NWConcrete_nw_path;
  v2 = [(NWConcrete_nw_path *)&v16 init];
  v3 = v2;
  if (v2)
  {
    *(void *)&v2->lock._os_unfair_lock_opaque = 0;
    v4 = v2;
    goto LABEL_3;
  }
  objc_super v6 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_path init]";
  v7 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v14 = 0;
  if (__nwlog_fault(v7, &type, &v14))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      v8 = __nwlog_obj();
      os_log_type_t v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_path init]";
        _os_log_impl(&dword_1830D4000, v8, v9, "%{public}s [super init] failed", buf, 0xCu);
      }
    }
    else if (v14)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      v8 = __nwlog_obj();
      os_log_type_t v11 = type;
      BOOL v12 = os_log_type_enabled(v8, type);
      if (backtrace_string)
      {
        if (v12)
        {
          *(_DWORD *)buf = 136446466;
          v18 = "-[NWConcrete_nw_path init]";
          __int16 v19 = 2082;
          v20 = backtrace_string;
          _os_log_impl(&dword_1830D4000, v8, v11, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_20;
      }
      if (v12)
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_path init]";
        _os_log_impl(&dword_1830D4000, v8, v11, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      v8 = __nwlog_obj();
      os_log_type_t v13 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_path init]";
        _os_log_impl(&dword_1830D4000, v8, v13, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }
LABEL_20:
  if (v7) {
    free(v7);
  }
LABEL_3:

  return v3;
}

@end