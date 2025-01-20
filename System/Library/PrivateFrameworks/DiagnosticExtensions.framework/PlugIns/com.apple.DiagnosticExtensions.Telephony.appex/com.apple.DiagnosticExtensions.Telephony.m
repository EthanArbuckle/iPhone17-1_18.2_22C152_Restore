void logs::convertToTraceProperties(xpc_object_t *a1@<X0>, xpc_object_t *a2@<X8>)
{
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  xpc_object_t v7;
  xpc_object_t value;
  xpc_object_t v9;
  xpc_object_t v10;
  xpc_object_t v11;
  uint64_t v12;
  unsigned int v13;
  capabilities::radio *v14;
  NSObject *v15;
  xpc_object_t v16;
  xpc_object_t v17;
  int v18;
  xpc_object_t v19;
  xpc_object_t v20;
  xpc_object_t v21;
  xpc_object_t v22;
  xpc_object_t v23;
  std::string *p_p;
  xpc_object_t v25;
  xpc_object_t v26;
  xpc_object_t v27;
  uint64_t v28;
  unsigned int v29;
  int v30;
  NSObject *v31;
  xpc_object_t v32;
  int v33;
  char v34;
  capabilities::abs *v35;
  std::string::size_type v36;
  std::string::size_type v37;
  NSObject *v38;
  xpc_object_t v39;
  uint64_t v40;
  int v41;
  int v42;
  NSObject *v43;
  xpc_object_t v44;
  xpc_object_t v45;
  xpc_object_t v46;
  xpc_object_t v47;
  xpc_object_t v48;
  xpc_object_t v49;
  xpc_object_t v50;
  xpc_object_t v51;
  uint64_t v52;
  xpc_object_t v53;
  xpc_object_t v54;
  xpc_object_t v55;
  xpc_object_t v56;
  xpc_object_t v57;
  xpc_object_t v58;
  xpc_object_t v59;
  xpc_object_t v60;
  xpc_object_t v61;
  xpc_object_t v62;
  xpc_object_t v63;
  xpc_object_t v64;
  xpc_object_t v65;
  xpc_object_t v66;
  xpc_object_t v67;
  xpc_object_t v68;
  xpc_object_t v69;
  xpc_object_t v70;
  std::string *v71;
  xpc_object_t v72;
  xpc_object_t v73;
  xpc_object_t v74;
  xpc_object_t v75;
  xpc_object_t v76;
  xpc_object_t v77;
  xpc_object_t v78;
  xpc_object_t v79;
  xpc_object_t v80;
  const char *v81;
  xpc_object_t v82;
  xpc_object_t v83;
  xpc_object_t v84;
  xpc_object_t v85;
  xpc_object_t v86;
  xpc_object_t v87;
  xpc_object_t v88;
  xpc_object_t v89;
  xpc_object_t v90;
  std::string *v91;
  xpc_object_t v92;
  xpc_object_t v93;
  capabilities::diag *v94;
  capabilities::diag *v95;
  xpc_object_t v96;
  xpc_object_t v97;
  xpc_object_t v98;
  xpc_object_t v99;
  xpc_object_t v100;
  xpc_object_t v101;
  xpc_object_t v102;
  std::string *v103;
  xpc_object_t v104;
  xpc_object_t v105;
  xpc_object_t v106;
  xpc_object_t v107;
  xpc_object_t v108;
  xpc_object_t v109;
  xpc_object_t v110;
  xpc_object_t v111;
  std::string *v112;
  xpc_object_t v113;
  xpc_object_t v114;
  xpc_object_t v115;
  xpc_object_t v116;
  xpc_object_t v117;
  xpc_object_t v118;
  xpc_object_t v119;
  const char *v120;
  xpc_object_t v121;
  xpc_object_t v122;
  std::string *v123;
  xpc_object_t v124;
  xpc_object_t v125;
  xpc_object_t v126;
  xpc_object_t v127;
  xpc_object_t v128;
  xpc_object_t v129;
  xpc_object_t v130;
  xpc_object_t v131;
  std::string *v132;
  xpc_object_t v133;
  xpc_object_t v134;
  char *string;
  char *v136;
  char *v137;
  char *key;
  std::string __p;
  std::string object;

  v4 = xpc_null_create();
  *a2 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v5 = xpc_array_create(0, 0);
  v6 = v5;
  if (v5)
  {
    *a2 = v5;
  }
  else
  {
    v6 = xpc_null_create();
    *a2 = v6;
    if (!v6)
    {
      v7 = xpc_null_create();
      v6 = 0;
      goto LABEL_8;
    }
  }
  if (xpc_get_type(v6) == (xpc_type_t)&_xpc_type_array)
  {
    xpc_retain(v6);
    goto LABEL_9;
  }
  v7 = xpc_null_create();
LABEL_8:
  *a2 = v7;
LABEL_9:
  xpc_release(v6);
  value = xpc_dictionary_get_value(*a1, "EnableBasebandLogging");
  v9 = value;
  if (value)
  {
    xpc_retain(value);
    goto LABEL_12;
  }
  v9 = xpc_null_create();
  if (v9)
  {
LABEL_12:
    if (xpc_get_type(v9) == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_retain(v9);
      v10 = v9;
    }
    else
    {
      v10 = xpc_null_create();
    }
    goto LABEL_16;
  }
  v10 = xpc_null_create();
  v9 = 0;
LABEL_16:
  xpc_release(v9);
  if (xpc_get_type(v10) != (xpc_type_t)&_xpc_type_dictionary) {
    goto LABEL_77;
  }
  v11 = xpc_dictionary_get_value(v10, "Exclude");
  object.__r_.__value_.__r.__words[0] = (std::string::size_type)v11;
  if (v11) {
    xpc_retain(v11);
  }
  else {
    object.__r_.__value_.__r.__words[0] = (std::string::size_type)xpc_null_create();
  }
  v13 = xpc::dyn_cast_or_default((xpc *)&object, (const object *)4, v12);
  xpc_release(object.__r_.__value_.__l.__data_);
  if (v13 <= 3
    && ((v13 & 1) != 0
     && (v14 = (capabilities::radio *)capabilities::radio::maverick(v14), (v14 & 1) != 0)
     || (v13 & 2) != 0 && capabilities::radio::ice(v14)))
  {
    v15 = GetOsLogContext()[1];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(object.__r_.__value_.__l.__data_) = 67109120;
      HIDWORD(object.__r_.__value_.__r.__words[0]) = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Not enabling baseband logging for this vendor: %d", (uint8_t *)&object, 8u);
    }
    v16 = xpc_dictionary_create(0, 0, 0);
    if (v16 || (v16 = xpc_null_create()) != 0)
    {
      if (xpc_get_type(v16) == (xpc_type_t)&_xpc_type_dictionary)
      {
        xpc_retain(v16);
        v17 = v16;
      }
      else
      {
        v17 = xpc_null_create();
      }
    }
    else
    {
      v17 = xpc_null_create();
      v16 = 0;
    }
    xpc_release(v16);
    v19 = xpc_null_create();
    xpc_release(v4);
    xpc_release(v19);
    v20 = xpc_string_create(abm::kTraceBaseband);
    if (!v20) {
      v20 = xpc_null_create();
    }
    xpc_dictionary_set_value(v17, abm::kKeyTraceName, v20);
    v21 = xpc_null_create();
    xpc_release(v20);
    xpc_release(v21);
    v22 = xpc_string_create(abm::kKeyEnabled);
    if (!v22) {
      v22 = xpc_null_create();
    }
    xpc_dictionary_set_value(v17, abm::kKeyTracePropertyName, v22);
    v23 = xpc_null_create();
    xpc_release(v22);
    xpc_release(v23);
    std::to_string(&object, 0);
    __p = object;
    if ((object.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    v25 = xpc_string_create((const char *)p_p);
    if (!v25) {
      v25 = xpc_null_create();
    }
    xpc_dictionary_set_value(v17, abm::kKeyTracePropertyValue, v25);
    v26 = xpc_null_create();
    xpc_release(v25);
    xpc_release(v26);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    xpc_array_append_value(*a2, v17);
    v18 = 0;
    v4 = v17;
  }
  else
  {
    v18 = 1;
  }
  v27 = xpc_dictionary_get_value(v10, "Profile");
  object.__r_.__value_.__r.__words[0] = (std::string::size_type)v27;
  if (v27) {
    xpc_retain(v27);
  }
  else {
    object.__r_.__value_.__r.__words[0] = (std::string::size_type)xpc_null_create();
  }
  v29 = xpc::dyn_cast_or_default((xpc *)&object, (const object *)1, v28);
  xpc_release(object.__r_.__value_.__l.__data_);
  if (v29 > 0x11) {
    v30 = v18;
  }
  else {
    v30 = 0;
  }
  if (v30 == 1)
  {
    v31 = GetOsLogContext()[1];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      LODWORD(object.__r_.__value_.__l.__data_) = 67109120;
      HIDWORD(object.__r_.__value_.__r.__words[0]) = v29;
      _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Invalid profile index: %d", (uint8_t *)&object, 8u);
    }
    v18 = 0;
  }
  v32 = xpc_dictionary_get_value(v10, "History");
  object.__r_.__value_.__r.__words[0] = (std::string::size_type)v32;
  if (v32) {
    xpc_retain(v32);
  }
  else {
    object.__r_.__value_.__r.__words[0] = (std::string::size_type)xpc_null_create();
  }
  v34 = xpc::dyn_cast_or_default((xpc *)&object, (const object *)8, v33);
  xpc_release(object.__r_.__value_.__l.__data_);
  v36 = capabilities::abs::profileBasebandHistoryMB(v35);
  v37 = (1 << (v34 + (sub_10001E8C8() ^ 1)));
  if (v36 > v37)
  {
    v38 = GetOsLogContext()[1];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(object.__r_.__value_.__l.__data_) = 134217984;
      *(std::string::size_type *)((char *)object.__r_.__value_.__r.__words + 4) = v36;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Setting to minimum history size %lu", (uint8_t *)&object, 0xCu);
    }
    LODWORD(v37) = v36;
  }
  v39 = xpc_dictionary_get_value(v10, "Sleep");
  object.__r_.__value_.__r.__words[0] = (std::string::size_type)v39;
  if (v39) {
    xpc_retain(v39);
  }
  else {
    object.__r_.__value_.__r.__words[0] = (std::string::size_type)xpc_null_create();
  }
  v41 = xpc::dyn_cast_or_default((xpc *)&object, 0, v40);
  xpc_release(object.__r_.__value_.__l.__data_);
  if (v41 > 2) {
    v42 = v18;
  }
  else {
    v42 = 0;
  }
  if (v42 == 1)
  {
    v43 = GetOsLogContext()[1];
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      LODWORD(object.__r_.__value_.__l.__data_) = 67109120;
      HIDWORD(object.__r_.__value_.__r.__words[0]) = v41;
      _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Invalid sleep index: %d", (uint8_t *)&object, 8u);
    }
    goto LABEL_77;
  }
  if (!v18)
  {
LABEL_77:
    v46 = v4;
    goto LABEL_78;
  }
  v44 = xpc_dictionary_create(0, 0, 0);
  if (v44 || (v44 = xpc_null_create()) != 0)
  {
    if (xpc_get_type(v44) == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_retain(v44);
      v45 = v44;
    }
    else
    {
      v45 = xpc_null_create();
    }
  }
  else
  {
    v45 = xpc_null_create();
    v44 = 0;
  }
  xpc_release(v44);
  v47 = xpc_null_create();
  xpc_release(v4);
  xpc_release(v47);
  string = (char *)abm::kTraceBaseband;
  v48 = xpc_string_create(abm::kTraceBaseband);
  if (!v48) {
    v48 = xpc_null_create();
  }
  key = (char *)abm::kKeyTraceName;
  xpc_dictionary_set_value(v45, abm::kKeyTraceName, v48);
  v49 = xpc_null_create();
  xpc_release(v48);
  xpc_release(v49);
  v50 = xpc_string_create(abm::kKeyTracePrimaryConfigFile);
  if (!v50) {
    v50 = xpc_null_create();
  }
  v137 = (char *)abm::kKeyTracePropertyName;
  xpc_dictionary_set_value(v45, abm::kKeyTracePropertyName, v50);
  v51 = xpc_null_create();
  xpc_release(v50);
  xpc_release(v51);
  v52 = v29;
  v53 = xpc_string_create(off_1000308A8[2 * v29]);
  if (!v53) {
    v53 = xpc_null_create();
  }
  v136 = (char *)abm::kKeyTracePropertyValue;
  xpc_dictionary_set_value(v45, abm::kKeyTracePropertyValue, v53);
  v54 = xpc_null_create();
  xpc_release(v53);
  xpc_release(v54);
  xpc_array_append_value(*a2, v45);
  v55 = xpc_dictionary_create(0, 0, 0);
  if (v55 || (v55 = xpc_null_create()) != 0)
  {
    if (xpc_get_type(v55) == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_retain(v55);
      v56 = v55;
    }
    else
    {
      v56 = xpc_null_create();
    }
  }
  else
  {
    v56 = xpc_null_create();
    v55 = 0;
  }
  xpc_release(v55);
  v57 = xpc_null_create();
  xpc_release(v45);
  xpc_release(v57);
  v58 = xpc_string_create(string);
  if (!v58) {
    v58 = xpc_null_create();
  }
  xpc_dictionary_set_value(v56, key, v58);
  v59 = xpc_null_create();
  xpc_release(v58);
  xpc_release(v59);
  v60 = xpc_string_create(abm::kKeyTraceSecondaryConfigFile);
  if (!v60) {
    v60 = xpc_null_create();
  }
  xpc_dictionary_set_value(v56, v137, v60);
  v61 = xpc_null_create();
  xpc_release(v60);
  xpc_release(v61);
  v62 = xpc_string_create(off_1000308A8[2 * v52 + 1]);
  if (!v62) {
    v62 = xpc_null_create();
  }
  xpc_dictionary_set_value(v56, v136, v62);
  v63 = xpc_null_create();
  xpc_release(v62);
  xpc_release(v63);
  xpc_array_append_value(*a2, v56);
  v64 = xpc_dictionary_create(0, 0, 0);
  if (v64 || (v64 = xpc_null_create()) != 0)
  {
    if (xpc_get_type(v64) == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_retain(v64);
      v65 = v64;
    }
    else
    {
      v65 = xpc_null_create();
    }
  }
  else
  {
    v65 = xpc_null_create();
    v64 = 0;
  }
  xpc_release(v64);
  v66 = xpc_null_create();
  xpc_release(v56);
  xpc_release(v66);
  v67 = xpc_string_create(string);
  if (!v67) {
    v67 = xpc_null_create();
  }
  xpc_dictionary_set_value(v65, key, v67);
  v68 = xpc_null_create();
  xpc_release(v67);
  xpc_release(v68);
  v69 = xpc_string_create(abm::kKeyTraceHistory);
  if (!v69) {
    v69 = xpc_null_create();
  }
  xpc_dictionary_set_value(v65, v137, v69);
  v70 = xpc_null_create();
  xpc_release(v69);
  xpc_release(v70);
  memset(&__p, 0, sizeof(__p));
  std::to_string(&object, v37);
  __p = object;
  if ((object.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v71 = &__p;
  }
  else {
    v71 = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  v72 = xpc_string_create((const char *)v71);
  if (!v72) {
    v72 = xpc_null_create();
  }
  xpc_dictionary_set_value(v65, v136, v72);
  v73 = xpc_null_create();
  xpc_release(v72);
  xpc_release(v73);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  xpc_array_append_value(*a2, v65);
  v74 = xpc_dictionary_create(0, 0, 0);
  if (v74 || (v74 = xpc_null_create()) != 0)
  {
    if (xpc_get_type(v74) == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_retain(v74);
      v75 = v74;
    }
    else
    {
      v75 = xpc_null_create();
    }
  }
  else
  {
    v75 = xpc_null_create();
    v74 = 0;
  }
  xpc_release(v74);
  v76 = xpc_null_create();
  xpc_release(v65);
  xpc_release(v76);
  v77 = xpc_string_create(string);
  if (!v77) {
    v77 = xpc_null_create();
  }
  xpc_dictionary_set_value(v75, key, v77);
  v78 = xpc_null_create();
  xpc_release(v77);
  xpc_release(v78);
  v79 = xpc_string_create(diag::config::kEnabledDuringSleepKey);
  if (!v79) {
    v79 = xpc_null_create();
  }
  xpc_dictionary_set_value(v75, v137, v79);
  v80 = xpc_null_create();
  xpc_release(v79);
  xpc_release(v80);
  v81 = (const char *)diag::config::toString();
  v82 = xpc_string_create(v81);
  if (!v82) {
    v82 = xpc_null_create();
  }
  xpc_dictionary_set_value(v75, v136, v82);
  v83 = xpc_null_create();
  xpc_release(v82);
  xpc_release(v83);
  xpc_array_append_value(*a2, v75);
  v84 = xpc_dictionary_create(0, 0, 0);
  if (v84 || (v84 = xpc_null_create()) != 0)
  {
    if (xpc_get_type(v84) == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_retain(v84);
      v85 = v84;
    }
    else
    {
      v85 = xpc_null_create();
    }
  }
  else
  {
    v85 = xpc_null_create();
    v84 = 0;
  }
  xpc_release(v84);
  v86 = xpc_null_create();
  xpc_release(v75);
  xpc_release(v86);
  v87 = xpc_string_create(string);
  if (!v87) {
    v87 = xpc_null_create();
  }
  xpc_dictionary_set_value(v85, key, v87);
  v88 = xpc_null_create();
  xpc_release(v87);
  xpc_release(v88);
  v89 = xpc_string_create(abm::kKeyEnabled);
  if (!v89) {
    v89 = xpc_null_create();
  }
  xpc_dictionary_set_value(v85, v137, v89);
  v90 = xpc_null_create();
  xpc_release(v89);
  xpc_release(v90);
  memset(&__p, 0, sizeof(__p));
  std::to_string(&object, 1);
  __p = object;
  if ((object.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v91 = &__p;
  }
  else {
    v91 = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  v92 = xpc_string_create((const char *)v91);
  if (!v92) {
    v92 = xpc_null_create();
  }
  xpc_dictionary_set_value(v85, v136, v92);
  v93 = xpc_null_create();
  xpc_release(v92);
  xpc_release(v93);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  xpc_array_append_value(*a2, v85);
  v95 = (capabilities::diag *)capabilities::diag::supportsQDSS(v94);
  if (v95)
  {
    v96 = xpc_dictionary_create(0, 0, 0);
    if (v96 || (v96 = xpc_null_create()) != 0)
    {
      if (xpc_get_type(v96) == (xpc_type_t)&_xpc_type_dictionary)
      {
        xpc_retain(v96);
        v97 = v96;
      }
      else
      {
        v97 = xpc_null_create();
      }
    }
    else
    {
      v97 = xpc_null_create();
      v96 = 0;
    }
    xpc_release(v96);
    v98 = xpc_null_create();
    xpc_release(v85);
    xpc_release(v98);
    v99 = xpc_string_create(string);
    if (!v99) {
      v99 = xpc_null_create();
    }
    xpc_dictionary_set_value(v97, key, v99);
    v100 = xpc_null_create();
    xpc_release(v99);
    xpc_release(v100);
    v101 = xpc_string_create(abm::kKeyTraceHighTput);
    if (!v101) {
      v101 = xpc_null_create();
    }
    xpc_dictionary_set_value(v97, v137, v101);
    v102 = xpc_null_create();
    xpc_release(v101);
    xpc_release(v102);
    memset(&__p, 0, sizeof(__p));
    std::to_string(&object, 1);
    __p = object;
    if ((object.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v103 = &__p;
    }
    else {
      v103 = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    v104 = xpc_string_create((const char *)v103);
    if (!v104) {
      v104 = xpc_null_create();
    }
    xpc_dictionary_set_value(v97, v136, v104);
    v105 = xpc_null_create();
    xpc_release(v104);
    xpc_release(v105);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    xpc_array_append_value(*a2, v97);
  }
  else
  {
    v97 = v85;
  }
  if (capabilities::diag::supportsADPL(v95))
  {
    v106 = xpc_dictionary_create(0, 0, 0);
    if (v106 || (v106 = xpc_null_create()) != 0)
    {
      if (xpc_get_type(v106) == (xpc_type_t)&_xpc_type_dictionary)
      {
        xpc_retain(v106);
        v46 = v106;
      }
      else
      {
        v46 = xpc_null_create();
      }
    }
    else
    {
      v46 = xpc_null_create();
      v106 = 0;
    }
    xpc_release(v106);
    v107 = xpc_null_create();
    xpc_release(v97);
    xpc_release(v107);
    v108 = xpc_string_create(string);
    if (!v108) {
      v108 = xpc_null_create();
    }
    xpc_dictionary_set_value(v46, key, v108);
    v109 = xpc_null_create();
    xpc_release(v108);
    xpc_release(v109);
    v110 = xpc_string_create(abm::kKeyTraceDataLogging);
    if (!v110) {
      v110 = xpc_null_create();
    }
    xpc_dictionary_set_value(v46, v137, v110);
    v111 = xpc_null_create();
    xpc_release(v110);
    xpc_release(v111);
    memset(&__p, 0, sizeof(__p));
    std::to_string(&object, 1);
    __p = object;
    if ((object.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v112 = &__p;
    }
    else {
      v112 = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    v113 = xpc_string_create((const char *)v112);
    if (!v113) {
      v113 = xpc_null_create();
    }
    xpc_dictionary_set_value(v46, v136, v113);
    v114 = xpc_null_create();
    xpc_release(v113);
    xpc_release(v114);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    xpc_array_append_value(*a2, v46);
  }
  else
  {
    v46 = v97;
  }
  if ((TelephonyUtilIsInternalBuild() & 1) == 0 && (TelephonyUtilIsCarrierBuild() & 1) == 0)
  {
    v115 = xpc_dictionary_create(0, 0, 0);
    if (v115 || (v115 = xpc_null_create()) != 0)
    {
      if (xpc_get_type(v115) == (xpc_type_t)&_xpc_type_dictionary)
      {
        xpc_retain(v115);
        v116 = v115;
      }
      else
      {
        v116 = xpc_null_create();
      }
    }
    else
    {
      v116 = xpc_null_create();
      v115 = 0;
    }
    xpc_release(v115);
    v117 = xpc_null_create();
    xpc_release(v46);
    xpc_release(v117);
    v118 = xpc_string_create(abm::kTraceSystemLogs);
    if (!v118) {
      v118 = xpc_null_create();
    }
    xpc_dictionary_set_value(v116, key, v118);
    v119 = xpc_null_create();
    xpc_release(v118);
    xpc_release(v119);
    v120 = (const char *)abm::kKeyTraceMode;
    v121 = xpc_string_create(abm::kKeyTraceMode);
    if (!v121) {
      v121 = xpc_null_create();
    }
    xpc_dictionary_set_value(v116, v137, v121);
    v122 = xpc_null_create();
    xpc_release(v121);
    xpc_release(v122);
    memset(&__p, 0, sizeof(__p));
    std::to_string(&object, 1);
    __p = object;
    if ((object.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v123 = &__p;
    }
    else {
      v123 = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    v124 = xpc_string_create((const char *)v123);
    if (!v124) {
      v124 = xpc_null_create();
    }
    xpc_dictionary_set_value(v116, v136, v124);
    v125 = xpc_null_create();
    xpc_release(v124);
    xpc_release(v125);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    xpc_array_append_value(*a2, v116);
    v126 = xpc_dictionary_create(0, 0, 0);
    if (v126 || (v126 = xpc_null_create()) != 0)
    {
      if (xpc_get_type(v126) == (xpc_type_t)&_xpc_type_dictionary)
      {
        xpc_retain(v126);
        v46 = v126;
      }
      else
      {
        v46 = xpc_null_create();
      }
    }
    else
    {
      v46 = xpc_null_create();
      v126 = 0;
    }
    xpc_release(v126);
    v127 = xpc_null_create();
    xpc_release(v116);
    xpc_release(v127);
    v128 = xpc_string_create(abm::kTraceCompression);
    if (!v128) {
      v128 = xpc_null_create();
    }
    xpc_dictionary_set_value(v46, key, v128);
    v129 = xpc_null_create();
    xpc_release(v128);
    xpc_release(v129);
    v130 = xpc_string_create(v120);
    if (!v130) {
      v130 = xpc_null_create();
    }
    xpc_dictionary_set_value(v46, v137, v130);
    v131 = xpc_null_create();
    xpc_release(v130);
    xpc_release(v131);
    memset(&__p, 0, sizeof(__p));
    std::to_string(&object, 2);
    __p = object;
    if ((object.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v132 = &__p;
    }
    else {
      v132 = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    v133 = xpc_string_create((const char *)v132);
    if (!v133) {
      v133 = xpc_null_create();
    }
    xpc_dictionary_set_value(v46, v136, v133);
    v134 = xpc_null_create();
    xpc_release(v133);
    xpc_release(v134);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
LABEL_78:
  xpc_release(v10);
  xpc_release(v46);
}

void sub_100004900(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, xpc_object_t object)
{
  if (a2) {
    sub_10000628C(exception_object);
  }
  _Unwind_Resume(exception_object);
}

xpc_object_t *sub_100004F84(xpc_object_t *a1)
{
  *a1 = 0;
  return a1;
}

void logs::getDefaultTraceProperties(xpc_object_t *a1@<X8>)
{
  *a1 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v3 = xpc_array_create(0, 0);
  xpc_object_t v4 = v3;
  if (v3)
  {
    *a1 = v3;
  }
  else
  {
    xpc_object_t v4 = xpc_null_create();
    *a1 = v4;
    if (!v4)
    {
      xpc_object_t v5 = xpc_null_create();
      xpc_object_t v4 = 0;
      goto LABEL_8;
    }
  }
  if (xpc_get_type(v4) != (xpc_type_t)&_xpc_type_array)
  {
    xpc_object_t v5 = xpc_null_create();
LABEL_8:
    *a1 = v5;
    goto LABEL_9;
  }
  xpc_retain(v4);
LABEL_9:
  xpc_release(v4);
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  if (v6 || (xpc_object_t v6 = xpc_null_create()) != 0)
  {
    if (xpc_get_type(v6) == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_retain(v6);
      xpc_object_t v7 = v6;
    }
    else
    {
      xpc_object_t v7 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v7 = xpc_null_create();
    xpc_object_t v6 = 0;
  }
  xpc_release(v6);
  v8 = (const char *)abm::kTraceBaseband;
  xpc_object_t v9 = xpc_string_create(abm::kTraceBaseband);
  if (!v9) {
    xpc_object_t v9 = xpc_null_create();
  }
  v10 = (const char *)abm::kKeyTraceName;
  xpc_dictionary_set_value(v7, abm::kKeyTraceName, v9);
  xpc_object_t v11 = xpc_null_create();
  xpc_release(v9);
  xpc_release(v11);
  xpc_object_t v12 = xpc_string_create(abm::kKeyEnabled);
  if (!v12) {
    xpc_object_t v12 = xpc_null_create();
  }
  v13 = (const char *)abm::kKeyTracePropertyName;
  xpc_dictionary_set_value(v7, abm::kKeyTracePropertyName, v12);
  xpc_object_t v14 = xpc_null_create();
  xpc_release(v12);
  xpc_release(v14);
  int v16 = defaults::bbtrace::enabled(v15);
  std::to_string(&v115, v16);
  std::string __p = v115;
  if ((v115.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  xpc_object_t v18 = xpc_string_create((const char *)p_p);
  if (!v18) {
    xpc_object_t v18 = xpc_null_create();
  }
  v19 = (const char *)abm::kKeyTracePropertyValue;
  xpc_dictionary_set_value(v7, abm::kKeyTracePropertyValue, v18);
  xpc_object_t v20 = xpc_null_create();
  xpc_release(v18);
  xpc_release(v20);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  xpc_array_append_value(*a1, v7);
  xpc_object_t v21 = xpc_dictionary_create(0, 0, 0);
  if (v21 || (xpc_object_t v21 = xpc_null_create()) != 0)
  {
    if (xpc_get_type(v21) == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_retain(v21);
      xpc_object_t v22 = v21;
    }
    else
    {
      xpc_object_t v22 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v22 = xpc_null_create();
    xpc_object_t v21 = 0;
  }
  xpc_release(v21);
  xpc_object_t v23 = xpc_null_create();
  xpc_release(v7);
  xpc_release(v23);
  xpc_object_t v24 = xpc_string_create(v8);
  if (!v24) {
    xpc_object_t v24 = xpc_null_create();
  }
  xpc_dictionary_set_value(v22, v10, v24);
  xpc_object_t v25 = xpc_null_create();
  xpc_release(v24);
  xpc_release(v25);
  xpc_object_t v26 = xpc_string_create(abm::kKeyTraceHighTput);
  if (!v26) {
    xpc_object_t v26 = xpc_null_create();
  }
  xpc_dictionary_set_value(v22, v13, v26);
  xpc_object_t v27 = xpc_null_create();
  xpc_release(v26);
  xpc_release(v27);
  int v29 = defaults::bbtrace::high_tput(v28);
  memset(&__p, 0, sizeof(__p));
  std::to_string(&v115, v29);
  std::string __p = v115;
  if ((v115.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v30 = &__p;
  }
  else {
    v30 = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  xpc_object_t v31 = xpc_string_create((const char *)v30);
  if (!v31) {
    xpc_object_t v31 = xpc_null_create();
  }
  xpc_dictionary_set_value(v22, v19, v31);
  xpc_object_t v32 = xpc_null_create();
  xpc_release(v31);
  xpc_release(v32);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  xpc_array_append_value(*a1, v22);
  xpc_object_t v33 = xpc_dictionary_create(0, 0, 0);
  if (v33 || (xpc_object_t v33 = xpc_null_create()) != 0)
  {
    if (xpc_get_type(v33) == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_retain(v33);
      xpc_object_t v34 = v33;
    }
    else
    {
      xpc_object_t v34 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v34 = xpc_null_create();
    xpc_object_t v33 = 0;
  }
  xpc_release(v33);
  xpc_object_t v35 = xpc_null_create();
  xpc_release(v22);
  xpc_release(v35);
  xpc_object_t v36 = xpc_string_create(v8);
  if (!v36) {
    xpc_object_t v36 = xpc_null_create();
  }
  xpc_dictionary_set_value(v34, v10, v36);
  xpc_object_t v37 = xpc_null_create();
  xpc_release(v36);
  xpc_release(v37);
  xpc_object_t v38 = xpc_string_create(abm::kKeyTraceDataLogging);
  if (!v38) {
    xpc_object_t v38 = xpc_null_create();
  }
  xpc_dictionary_set_value(v34, v13, v38);
  xpc_object_t v39 = xpc_null_create();
  xpc_release(v38);
  xpc_release(v39);
  int v41 = defaults::bbtrace::data_logging(v40);
  memset(&__p, 0, sizeof(__p));
  std::to_string(&v115, v41);
  std::string __p = v115;
  if ((v115.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v42 = &__p;
  }
  else {
    v42 = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  xpc_object_t v43 = xpc_string_create((const char *)v42);
  if (!v43) {
    xpc_object_t v43 = xpc_null_create();
  }
  xpc_dictionary_set_value(v34, v19, v43);
  xpc_object_t v44 = xpc_null_create();
  xpc_release(v43);
  xpc_release(v44);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  xpc_array_append_value(*a1, v34);
  xpc_object_t v45 = xpc_dictionary_create(0, 0, 0);
  if (v45 || (xpc_object_t v45 = xpc_null_create()) != 0)
  {
    if (xpc_get_type(v45) == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_retain(v45);
      xpc_object_t v46 = v45;
    }
    else
    {
      xpc_object_t v46 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v46 = xpc_null_create();
    xpc_object_t v45 = 0;
  }
  xpc_release(v45);
  xpc_object_t v47 = xpc_null_create();
  xpc_release(v34);
  xpc_release(v47);
  xpc_object_t v48 = xpc_string_create(v8);
  if (!v48) {
    xpc_object_t v48 = xpc_null_create();
  }
  xpc_dictionary_set_value(v46, v10, v48);
  xpc_object_t v49 = xpc_null_create();
  xpc_release(v48);
  xpc_release(v49);
  xpc_object_t v50 = xpc_string_create(abm::kKeyTracePrimaryConfigFile);
  if (!v50) {
    xpc_object_t v50 = xpc_null_create();
  }
  xpc_dictionary_set_value(v46, v13, v50);
  xpc_object_t v51 = xpc_null_create();
  xpc_release(v50);
  xpc_release(v51);
  v53 = (const char *)defaults::bbtrace::primary_dmc(v52);
  xpc_object_t v54 = xpc_string_create(v53);
  if (!v54) {
    xpc_object_t v54 = xpc_null_create();
  }
  xpc_dictionary_set_value(v46, v19, v54);
  xpc_object_t v55 = xpc_null_create();
  xpc_release(v54);
  xpc_release(v55);
  xpc_array_append_value(*a1, v46);
  xpc_object_t v56 = xpc_dictionary_create(0, 0, 0);
  if (v56 || (xpc_object_t v56 = xpc_null_create()) != 0)
  {
    if (xpc_get_type(v56) == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_retain(v56);
      xpc_object_t v57 = v56;
    }
    else
    {
      xpc_object_t v57 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v57 = xpc_null_create();
    xpc_object_t v56 = 0;
  }
  xpc_release(v56);
  xpc_object_t v58 = xpc_null_create();
  xpc_release(v46);
  xpc_release(v58);
  xpc_object_t v59 = xpc_string_create(v8);
  if (!v59) {
    xpc_object_t v59 = xpc_null_create();
  }
  xpc_dictionary_set_value(v57, v10, v59);
  xpc_object_t v60 = xpc_null_create();
  xpc_release(v59);
  xpc_release(v60);
  xpc_object_t v61 = xpc_string_create(abm::kKeyTraceSecondaryConfigFile);
  if (!v61) {
    xpc_object_t v61 = xpc_null_create();
  }
  xpc_dictionary_set_value(v57, v13, v61);
  xpc_object_t v62 = xpc_null_create();
  xpc_release(v61);
  xpc_release(v62);
  v64 = (const char *)defaults::bbtrace::secondary_dmc(v63);
  xpc_object_t v65 = xpc_string_create(v64);
  if (!v65) {
    xpc_object_t v65 = xpc_null_create();
  }
  xpc_dictionary_set_value(v57, v19, v65);
  xpc_object_t v66 = xpc_null_create();
  xpc_release(v65);
  xpc_release(v66);
  xpc_array_append_value(*a1, v57);
  xpc_object_t v67 = xpc_dictionary_create(0, 0, 0);
  if (v67 || (xpc_object_t v67 = xpc_null_create()) != 0)
  {
    if (xpc_get_type(v67) == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_retain(v67);
      xpc_object_t v68 = v67;
    }
    else
    {
      xpc_object_t v68 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v68 = xpc_null_create();
    xpc_object_t v67 = 0;
  }
  xpc_release(v67);
  xpc_object_t v69 = xpc_null_create();
  xpc_release(v57);
  xpc_release(v69);
  xpc_object_t v70 = xpc_string_create(v8);
  if (!v70) {
    xpc_object_t v70 = xpc_null_create();
  }
  xpc_dictionary_set_value(v68, v10, v70);
  xpc_object_t v71 = xpc_null_create();
  xpc_release(v70);
  xpc_release(v71);
  xpc_object_t v72 = xpc_string_create(abm::kKeyTraceHistory);
  if (!v72) {
    xpc_object_t v72 = xpc_null_create();
  }
  xpc_dictionary_set_value(v68, v13, v72);
  xpc_object_t v73 = xpc_null_create();
  xpc_release(v72);
  xpc_release(v73);
  int v75 = defaults::bbtrace::history(v74);
  std::to_string(&v115, v75);
  if ((v115.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v76 = &v115;
  }
  else {
    v76 = (std::string *)v115.__r_.__value_.__r.__words[0];
  }
  xpc_object_t v77 = xpc_string_create((const char *)v76);
  if (!v77) {
    xpc_object_t v77 = xpc_null_create();
  }
  xpc_dictionary_set_value(v68, v19, v77);
  xpc_object_t v78 = xpc_null_create();
  xpc_release(v77);
  xpc_release(v78);
  if (SHIBYTE(v115.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v115.__r_.__value_.__l.__data_);
  }
  xpc_array_append_value(*a1, v68);
  xpc_object_t v79 = xpc_dictionary_create(0, 0, 0);
  if (v79 || (xpc_object_t v79 = xpc_null_create()) != 0)
  {
    if (xpc_get_type(v79) == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_retain(v79);
      xpc_object_t v80 = v79;
    }
    else
    {
      xpc_object_t v80 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v80 = xpc_null_create();
    xpc_object_t v79 = 0;
  }
  xpc_release(v79);
  xpc_object_t v81 = xpc_null_create();
  xpc_release(v68);
  xpc_release(v81);
  xpc_object_t v82 = xpc_string_create(v8);
  if (!v82) {
    xpc_object_t v82 = xpc_null_create();
  }
  xpc_dictionary_set_value(v80, v10, v82);
  xpc_object_t v83 = xpc_null_create();
  xpc_release(v82);
  xpc_release(v83);
  xpc_object_t v84 = xpc_string_create(diag::config::kEnabledDuringSleepKey);
  if (!v84) {
    xpc_object_t v84 = xpc_null_create();
  }
  xpc_dictionary_set_value(v80, v13, v84);
  xpc_object_t v85 = xpc_null_create();
  xpc_release(v84);
  xpc_release(v85);
  defaults::bbtrace::enabled_during_sleep(v86);
  v87 = (const char *)diag::config::toString();
  xpc_object_t v88 = xpc_string_create(v87);
  if (!v88) {
    xpc_object_t v88 = xpc_null_create();
  }
  xpc_dictionary_set_value(v80, v19, v88);
  xpc_object_t v89 = xpc_null_create();
  xpc_release(v88);
  xpc_release(v89);
  xpc_array_append_value(*a1, v80);
  if ((TelephonyUtilIsInternalBuild() & 1) == 0 && (TelephonyUtilIsCarrierBuild() & 1) == 0)
  {
    xpc_object_t v90 = xpc_dictionary_create(0, 0, 0);
    if (v90 || (xpc_object_t v90 = xpc_null_create()) != 0)
    {
      if (xpc_get_type(v90) == (xpc_type_t)&_xpc_type_dictionary)
      {
        xpc_retain(v90);
        xpc_object_t v91 = v90;
      }
      else
      {
        xpc_object_t v91 = xpc_null_create();
      }
    }
    else
    {
      xpc_object_t v91 = xpc_null_create();
      xpc_object_t v90 = 0;
    }
    xpc_release(v90);
    xpc_object_t v92 = xpc_null_create();
    xpc_release(v80);
    xpc_release(v92);
    xpc_object_t v93 = xpc_string_create(abm::kTraceSystemLogs);
    if (!v93) {
      xpc_object_t v93 = xpc_null_create();
    }
    xpc_dictionary_set_value(v91, v10, v93);
    xpc_object_t v94 = xpc_null_create();
    xpc_release(v93);
    xpc_release(v94);
    v95 = (const char *)abm::kKeyTraceMode;
    xpc_object_t v96 = xpc_string_create(abm::kKeyTraceMode);
    if (!v96) {
      xpc_object_t v96 = xpc_null_create();
    }
    xpc_dictionary_set_value(v91, v13, v96);
    xpc_object_t v97 = xpc_null_create();
    xpc_release(v96);
    xpc_release(v97);
    int v99 = defaults::systemlogs::mode(v98);
    memset(&__p, 0, sizeof(__p));
    std::to_string(&v115, v99);
    std::string __p = v115;
    if ((v115.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v100 = &__p;
    }
    else {
      v100 = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    xpc_object_t v101 = xpc_string_create((const char *)v100);
    if (!v101) {
      xpc_object_t v101 = xpc_null_create();
    }
    xpc_dictionary_set_value(v91, v19, v101);
    xpc_object_t v102 = xpc_null_create();
    xpc_release(v101);
    xpc_release(v102);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    xpc_array_append_value(*a1, v91);
    xpc_object_t v103 = xpc_dictionary_create(0, 0, 0);
    if (v103 || (xpc_object_t v103 = xpc_null_create()) != 0)
    {
      if (xpc_get_type(v103) == (xpc_type_t)&_xpc_type_dictionary)
      {
        xpc_retain(v103);
        xpc_object_t v80 = v103;
      }
      else
      {
        xpc_object_t v80 = xpc_null_create();
      }
    }
    else
    {
      xpc_object_t v80 = xpc_null_create();
      xpc_object_t v103 = 0;
    }
    xpc_release(v103);
    xpc_object_t v104 = xpc_null_create();
    xpc_release(v91);
    xpc_release(v104);
    xpc_object_t v105 = xpc_string_create(abm::kTraceCompression);
    if (!v105) {
      xpc_object_t v105 = xpc_null_create();
    }
    xpc_dictionary_set_value(v80, v10, v105);
    xpc_object_t v106 = xpc_null_create();
    xpc_release(v105);
    xpc_release(v106);
    xpc_object_t v107 = xpc_string_create(v95);
    if (!v107) {
      xpc_object_t v107 = xpc_null_create();
    }
    xpc_dictionary_set_value(v80, v13, v107);
    xpc_object_t v108 = xpc_null_create();
    xpc_release(v107);
    xpc_release(v108);
    int v110 = defaults::compression::mode(v109);
    memset(&__p, 0, sizeof(__p));
    std::to_string(&v115, v110);
    std::string __p = v115;
    if ((v115.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v111 = &__p;
    }
    else {
      v111 = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    xpc_object_t v112 = xpc_string_create((const char *)v111);
    if (!v112) {
      xpc_object_t v112 = xpc_null_create();
    }
    xpc_dictionary_set_value(v80, v19, v112);
    xpc_object_t v113 = xpc_null_create();
    xpc_release(v112);
    xpc_release(v113);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    xpc_array_append_value(*a1, v80);
  }
  xpc_release(v80);
}

void sub_100005E6C(void *a1)
{
}

void sub_100005E78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  xpc_release(v15);
  sub_100004F84(v14);
  _Unwind_Resume(a1);
}

void sub_10000628C(void *a1)
{
}

void **sub_1000062A0(void **a1)
{
  v2 = (void **)*a1;
  if (*a1)
  {
    xpc_object_t v3 = (void **)a1[1];
    xpc_object_t v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        if (*((char *)v3 - 1) < 0) {
          operator delete(*(v3 - 3));
        }
        v3 -= 3;
      }
      while (v3 != v2);
      xpc_object_t v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

void (__cdecl ***sub_100006314(void (__cdecl ***a1)(std::ifstream *__hidden this)))(std::ifstream *__hidden this)
{
  *a1 = v3;
  *(void *)((char *)*(v3 - 3) + (void)a1) = v2;
  a1[1] = 0;
  xpc_object_t v4 = (std::ios_base *)((char *)*(*a1 - 3) + (void)a1);
  std::ios_base::init(v4, a1 + 2);
  v4[1].__vftable = 0;
  v4[1].__fmtflags_ = -1;
  std::filebuf::basic_filebuf();
  if (!std::filebuf::open()) {
    std::ios_base::clear((std::ios_base *)((char *)*(*a1 - 3) + (void)a1), *(_DWORD *)((char *)*(*a1 - 3) + (void)a1 + 32) | 4);
  }
  return a1;
}

void sub_1000064AC(_Unwind_Exception *a1)
{
}

void *sub_1000064F0(void *a1)
{
  std::filebuf::~filebuf();
  std::istream::~istream();
  std::ios::~ios();
  return a1;
}

void sub_1000065BC(std::locale *this)
{
  v1 = this;
  locale = (std::__shared_weak_count *)this[6].__locale_;
  if (locale && !atomic_fetch_add(&locale->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))locale->__on_zero_shared)(locale);
    std::__shared_weak_count::__release_weak(locale);
    this = v1;
  }
  else if (((vars8 ^ (2 * vars8)) & 0x4000000000000000) != 0)
  {
    __break(0xC471u);
  }
  std::locale::~locale(this);
}

BOOL sub_100006658(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *__error() = 0;
  if (a1[23] < 0)
  {
    xpc_object_t v7 = opendir(*(const char **)a1);
    if (v7) {
      goto LABEL_3;
    }
LABEL_78:
    xpc_object_t v45 = GetOsLogContext()[1];
    BOOL result = os_log_type_enabled(v45, OS_LOG_TYPE_ERROR);
    if (result)
    {
      if (a1[23] < 0) {
        a1 = *(const char **)a1;
      }
      xpc_object_t v47 = __error();
      xpc_object_t v48 = strerror(*v47);
      v58.st_dev = 136315394;
      *(void *)&v58.st_mode = a1;
      WORD2(v58.st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&v58.st_ino + 6) = (__darwin_ino64_t)v48;
      _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "Error %s (%s)\n", (uint8_t *)&v58, 0x16u);
      return 0;
    }
    return result;
  }
  xpc_object_t v7 = opendir(a1);
  if (!v7) {
    goto LABEL_78;
  }
LABEL_3:
  v8 = v7;
  xpc_object_t v9 = readdir(v7);
  if (v9)
  {
    xpc_object_t v51 = a1;
    char v49 = 0;
    while (1)
    {
      d_name = v9->d_name;
      memset(__dst, 170, sizeof(__dst));
      size_t v11 = strlen(v9->d_name);
      if (v11 > 0x7FFFFFFFFFFFFFF7) {
        sub_100006DCC();
      }
      size_t v12 = v11;
      if (v11 >= 0x17) {
        break;
      }
      __dst[23] = v11;
      v13 = __dst;
      if (v11) {
        goto LABEL_12;
      }
LABEL_13:
      v13[v12] = 0;
      uint64_t v16 = __dst[23];
      int v17 = __dst[23];
      uint64_t v18 = *(void *)&__dst[8];
      if (__dst[23] >= 0) {
        std::string::size_type v19 = __dst[23];
      }
      else {
        std::string::size_type v19 = *(void *)&__dst[8];
      }
      if (v19 == 2)
      {
        xpc_object_t v21 = *(_WORD **)__dst;
        if (__dst[23] >= 0) {
          xpc_object_t v21 = __dst;
        }
        if (*v21 == 11822) {
          goto LABEL_73;
        }
      }
      else if (v19 == 1)
      {
        xpc_object_t v20 = *(unsigned char **)__dst;
        if (__dst[23] >= 0) {
          xpc_object_t v20 = __dst;
        }
        if (*v20 == 46) {
          goto LABEL_73;
        }
      }
      if (a4) {
        goto LABEL_53;
      }
      xpc_object_t v22 = v8;
      uint64_t v23 = a4;
      uint64_t v24 = a3;
      v25.tv_sec = 0xAAAAAAAAAAAAAAAALL;
      v25.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
      *(timespec *)&v58.st_blksize = v25;
      *(timespec *)v58.st_qspare = v25;
      v58.st_birthtimespec = v25;
      *(timespec *)&v58.st_size = v25;
      v58.st_mtimespec = v25;
      v58.st_ctimespec = v25;
      *(timespec *)&v58.st_uid = v25;
      v58.st_atimespec = v25;
      *(timespec *)&v58.st_dev = v25;
      int v26 = v51[23];
      if (v26 >= 0) {
        size_t v27 = *((unsigned __int8 *)v51 + 23);
      }
      else {
        size_t v27 = *((void *)v51 + 1);
      }
      unint64_t v28 = v27 + 1;
      memset(&v52, 170, sizeof(v52));
      if (v27 + 1 > 0x7FFFFFFFFFFFFFF7) {
        sub_100006DCC();
      }
      if (v28 >= 0x17)
      {
        uint64_t v30 = (v28 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v28 | 7) != 0x17) {
          uint64_t v30 = v28 | 7;
        }
        uint64_t v31 = v30 + 1;
        int v29 = (char *)operator new(v30 + 1);
        v52.__r_.__value_.__l.__size_ = v27 + 1;
        v52.__r_.__value_.__r.__words[2] = v31 | 0x8000000000000000;
        v52.__r_.__value_.__r.__words[0] = (std::string::size_type)v29;
      }
      else
      {
        memset(&v52, 0, sizeof(v52));
        int v29 = (char *)&v52;
        *((unsigned char *)&v52.__r_.__value_.__s + 23) = v27 + 1;
        if (!v27) {
          goto LABEL_40;
        }
      }
      if (v26 >= 0) {
        xpc_object_t v32 = v51;
      }
      else {
        xpc_object_t v32 = *(const char **)v51;
      }
      memmove(v29, v32, v27);
LABEL_40:
      a3 = v24;
      *(_WORD *)&v29[v27] = 47;
      if (v17 >= 0) {
        xpc_object_t v33 = __dst;
      }
      else {
        xpc_object_t v33 = *(const std::string::value_type **)__dst;
      }
      xpc_object_t v34 = std::string::append(&v52, v33, v19);
      a4 = v23;
      long long v35 = *(_OWORD *)&v34->__r_.__value_.__l.__data_;
      v55[0] = *((void *)&v34->__r_.__value_.__l + 2);
      *(_OWORD *)std::string __p = v35;
      v34->__r_.__value_.__l.__size_ = 0;
      v34->__r_.__value_.__r.__words[2] = 0;
      v34->__r_.__value_.__r.__words[0] = 0;
      if (v55[0] >= 0) {
        xpc_object_t v36 = __p;
      }
      else {
        xpc_object_t v36 = (void **)__p[0];
      }
      lstat((const char *)v36, &v58);
      v8 = v22;
      if (SHIBYTE(v55[0]) < 0)
      {
        operator delete(__p[0]);
        if ((SHIBYTE(v52.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        {
LABEL_48:
          if ((v58.st_mode & 0xF000) != 0xA000) {
            goto LABEL_52;
          }
          goto LABEL_73;
        }
      }
      else if ((SHIBYTE(v52.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
        goto LABEL_48;
      }
      operator delete(v52.__r_.__value_.__l.__data_);
      if ((v58.st_mode & 0xF000) != 0xA000)
      {
LABEL_52:
        uint64_t v16 = __dst[23];
        uint64_t v18 = *(void *)&__dst[8];
        LOBYTE(v17) = __dst[23];
LABEL_53:
        if ((v17 & 0x80u) == 0) {
          xpc_object_t v37 = __dst;
        }
        else {
          xpc_object_t v37 = *(unsigned char **)__dst;
        }
        if ((v17 & 0x80u) != 0) {
          uint64_t v16 = v18;
        }
        xpc_object_t v38 = &v37[v16];
        *(void *)&long long v39 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v39 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v56 = v39;
        v55[6] = 0xAAAAAAAAAAAAAA00;
        v55[3] = 0xAAAAAAAAAAAAAAAALL;
        v55[4] = 0;
        v55[5] = 0;
        v55[7] = 0;
        v55[8] = 0;
        LOBYTE(v56) = 0;
        BYTE8(v56) = 0;
        uint64_t v57 = 0;
        *(_OWORD *)std::string __p = 0u;
        memset(v55, 0, 25);
        *(_OWORD *)&v58.st_birthtimespec.tv_nsec = v39;
        v58.st_ctimespec.tv_sec = 0xAAAAAAAAAAAAAAAALL;
        v58.st_atimespec.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
        memset(&v58.st_mtimespec, 0, 17);
        memset(&v58.st_ctimespec.tv_nsec, 0, 17);
        LOBYTE(v58.st_size) = 0;
        v58.st_blocks = 0;
        memset(&v58, 0, 41);
        int v40 = sub_1000125E4(a2, (uint64_t)v37, (uint64_t)&v37[v16], (uint64_t)&v58, 4160);
        sub_1000128F4(__p, (uint64_t)v37, v38, (uint64_t *)&v58.st_dev, 0);
        if (*(void *)&v58.st_dev)
        {
          v58.st_ino = *(void *)&v58.st_dev;
          operator delete(*(void **)&v58.st_dev);
        }
        if ((_BYTE)v56) {
          int v41 = v40 ^ 1;
        }
        else {
          int v41 = 1;
        }
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
        if ((v40 & v41) != 0)
        {
          unint64_t v42 = *(void *)(a3 + 8);
          if (v42 >= *(void *)(a3 + 16))
          {
            xpc_object_t v44 = sub_100006F48((char **)a3, (uint64_t)__dst);
          }
          else
          {
            if ((__dst[23] & 0x80000000) != 0)
            {
              sub_100006EA8(*(unsigned char **)(a3 + 8), *(void **)__dst, *(unint64_t *)&__dst[8]);
            }
            else
            {
              long long v43 = *(_OWORD *)__dst;
              *(void *)(v42 + 16) = *(void *)&__dst[16];
              *(_OWORD *)unint64_t v42 = v43;
            }
            xpc_object_t v44 = (char *)(v42 + 24);
            *(void *)(a3 + 8) = v42 + 24;
          }
          *(void *)(a3 + 8) = v44;
          char v49 = 1;
        }
      }
LABEL_73:
      if ((__dst[23] & 0x80000000) != 0) {
        operator delete(*(void **)__dst);
      }
      xpc_object_t v9 = readdir(v8);
      if (!v9) {
        goto LABEL_83;
      }
    }
    uint64_t v14 = (v11 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v11 | 7) != 0x17) {
      uint64_t v14 = v11 | 7;
    }
    uint64_t v15 = v14 + 1;
    v13 = operator new(v14 + 1);
    *(void *)&__dst[8] = v12;
    *(void *)&__dst[16] = v15 | 0x8000000000000000;
    *(void *)__dst = v13;
LABEL_12:
    memmove(v13, d_name, v12);
    goto LABEL_13;
  }
  char v49 = 0;
LABEL_83:
  closedir(v8);
  return v49 & 1;
}

void sub_100006BCC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30,void *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,void *a48,uint64_t a49)
{
  *(void *)(v49 + 8) = v50;
  if (a30 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void *sub_100006C64@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  std::istream::tellg();
  uint64_t v4 = v10;
  if (v10 >= 2)
  {
    do
    {
      std::istream::seekg();
      if (std::istream::peek() == 10) {
        break;
      }
    }
    while (v4-- > 1);
  }
  std::istream::seekg();
  std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
  xpc_object_t v6 = std::locale::use_facet(v9, &std::ctype<char>::id);
  unsigned __int8 v7 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v6->__vftable[2].~facet_0)(v6, 10);
  std::locale::~locale(v9);
  return sub_100019894(a1, (uint64_t)a2, v7);
}

void sub_100006D90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
}

void sub_100006DA4(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0)
  {
    operator delete(*(void **)v1);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_100006DCC()
{
}

void sub_100006DE4(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_100006E40(exception, a1);
}

void sub_100006E2C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_100006E40(std::logic_error *a1, const char *a2)
{
  BOOL result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_100006E74()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void *sub_100006EA8(unsigned char *__dst, void *__src, unint64_t a3)
{
  xpc_object_t v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8) {
      sub_100006DCC();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    *xpc_object_t v5 = v8;
    xpc_object_t v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }
  return memmove(v5, __src, a3 + 1);
}

char *sub_100006F48(char **a1, uint64_t a2)
{
  xpc_object_t v3 = *a1;
  uint64_t v4 = a1[1];
  unint64_t v5 = 0xAAAAAAAAAAAAAAABLL * ((v4 - *a1) >> 3);
  unint64_t v6 = v5 + 1;
  if (v5 + 1 > 0xAAAAAAAAAAAAAAALL) {
    sub_100007188();
  }
  if (0x5555555555555556 * ((a1[2] - v3) >> 3) > v6) {
    unint64_t v6 = 0x5555555555555556 * ((a1[2] - v3) >> 3);
  }
  if (0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3) >= 0x555555555555555) {
    unint64_t v8 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v8 = v6;
  }
  if (v8)
  {
    if (v8 > 0xAAAAAAAAAAAAAAALL) {
      sub_100006E74();
    }
    xpc_object_t v9 = (char *)operator new(24 * v8);
  }
  else
  {
    xpc_object_t v9 = 0;
  }
  uint64_t v10 = &v9[24 * v5];
  uint64_t v16 = v10;
  int v17 = v10;
  uint64_t v18 = &v9[24 * v8];
  if (*(char *)(a2 + 23) < 0)
  {
    sub_100006EA8(v10, *(void **)a2, *(void *)(a2 + 8));
    xpc_object_t v3 = *a1;
    uint64_t v4 = a1[1];
    uint64_t v10 = v16;
    size_t v11 = v17 + 24;
    if (v4 == *a1)
    {
LABEL_17:
      v13 = v3;
      goto LABEL_18;
    }
  }
  else
  {
    *(_OWORD *)uint64_t v10 = *(_OWORD *)a2;
    *((void *)v10 + 2) = *(void *)(a2 + 16);
    size_t v11 = v10 + 24;
    if (v4 == v3) {
      goto LABEL_17;
    }
  }
  do
  {
    long long v12 = *(_OWORD *)(v4 - 24);
    *((void *)v10 - 1) = *((void *)v4 - 1);
    *(_OWORD *)(v10 - 24) = v12;
    v10 -= 24;
    *((void *)v4 - 2) = 0;
    *((void *)v4 - 1) = 0;
    *((void *)v4 - 3) = 0;
    v4 -= 24;
  }
  while (v4 != v3);
  v13 = *a1;
  xpc_object_t v3 = a1[1];
LABEL_18:
  *a1 = v10;
  a1[1] = v11;
  a1[2] = v18;
  if (v3 != v13)
  {
    uint64_t v14 = (void **)(v3 - 24);
    do
    {
      if (*((char *)v14 + 23) < 0) {
        operator delete(*v14);
      }
      v14 -= 3;
    }
    while (v14 + 3 != (void **)v13);
    xpc_object_t v3 = v13;
  }
  if (v3) {
    operator delete(v3);
  }
  return v11;
}

void sub_10000710C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_100007120((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_100007120(uint64_t a1)
{
  xpc_object_t v3 = *(void ***)(a1 + 8);
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != v3)
  {
    do
    {
      unint64_t v5 = v2 - 3;
      *(void *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        unint64_t v5 = *(void ***)(a1 + 16);
      }
      uint64_t v2 = v5;
    }
    while (v5 != v3);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_100007188()
{
}

void sub_1000071A0()
{
}

void sub_1000071B8(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_100007214(exception, a1);
}

void sub_100007200(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_100007214(std::logic_error *a1, const char *a2)
{
  BOOL result = std::logic_error::logic_error(a1, a2);
  return result;
}

uint64_t sub_100007248(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(std::__shared_weak_count **)(result + 8);
  if (v2)
  {
    if (!atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
      return v1;
    }
  }
  return result;
}

void *sub_1000072C4(void *__dst, void *__src, size_t __len)
{
  if (__len > 0x16)
  {
    if (__len - 0x7FFFFFFFFFFFFFF7 <= 0x800000000000001ELL) {
      sub_100006DCC();
    }
    size_t v7 = 44;
    if (__len > 0x2C) {
      size_t v7 = __len;
    }
    size_t v8 = (v7 | 7) + 1;
    unint64_t v6 = operator new(v8);
    memcpy(v6, __src, __len);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *__dst = v6;
  }
  else
  {
    *((unsigned char *)__dst + 23) = __len;
    unint64_t v6 = __dst;
    if (__len)
    {
      memmove(__dst, __src, __len);
      unint64_t v6 = __dst;
    }
  }
  *((unsigned char *)v6 + __len) = 0;
  return __dst;
}

void **sub_10000738C(void **a1, void *__src, size_t __len)
{
  unint64_t v6 = (unint64_t)a1[2];
  uint64_t v7 = v6 & 0x7FFFFFFFFFFFFFFFLL;
  if ((v6 & 0x7FFFFFFFFFFFFFFFLL) > __len)
  {
    size_t v8 = *a1;
    a1[1] = (void *)__len;
    if (__len) {
      memmove(v8, __src, __len);
    }
    goto LABEL_12;
  }
  size_t v9 = 0x7FFFFFFFFFFFFFF7;
  if (0x7FFFFFFFFFFFFFF7 - v7 < __len - v7 + 1) {
    sub_100006DCC();
  }
  unint64_t v10 = v7 - 1;
  size_t v11 = a1;
  if ((v6 & 0x8000000000000000) == 0)
  {
    if (v10 > 0x3FFFFFFFFFFFFFF2) {
      goto LABEL_7;
    }
LABEL_14:
    unint64_t v13 = 2 * v10;
    if (__len > 2 * v10) {
      unint64_t v13 = __len;
    }
    uint64_t v14 = (v13 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v13 | 7) != 0x17) {
      uint64_t v14 = v13 | 7;
    }
    if (v13 >= 0x17) {
      size_t v9 = v14 + 1;
    }
    else {
      size_t v9 = 23;
    }
    size_t v8 = operator new(v9);
    if (!__len) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  size_t v11 = *a1;
  if (v10 <= 0x3FFFFFFFFFFFFFF2) {
    goto LABEL_14;
  }
LABEL_7:
  size_t v8 = operator new(0x7FFFFFFFFFFFFFF7uLL);
  if (__len) {
LABEL_8:
  }
    memcpy(v8, __src, __len);
LABEL_9:
  if (v10 != 22) {
    operator delete(v11);
  }
  a1[1] = (void *)__len;
  a1[2] = (void *)(v9 | 0x8000000000000000);
  *a1 = v8;
LABEL_12:
  *((unsigned char *)v8 + __len) = 0;
  return a1;
}

uint64_t sub_1000074D4(uint64_t a1, char *a2, int a3)
{
  unint64_t v6 = std::locale::locale((std::locale *)a1);
  *(void *)(a1 + 8) = std::locale::use_facet(v6, &std::ctype<char>::id);
  *(void *)(a1 + 16) = std::locale::use_facet((const std::locale *)a1, &std::collate<char>::id);
  *(_DWORD *)(a1 + 24) = a3;
  *(_OWORD *)(a1 + 28) = 0u;
  *(_OWORD *)(a1 + 44) = 0u;
  *(_DWORD *)(a1 + 60) = 0;
  size_t v7 = strlen(a2);
  if (sub_1000075A4(a1, a2, &a2[v7]) != &a2[v7]) {
    sub_100007A5C();
  }
  return a1;
}

void sub_100007574(_Unwind_Exception *a1)
{
  sub_100007248(v2);
  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

void sub_100007590(_Unwind_Exception *a1)
{
  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

char *sub_1000075A4(uint64_t a1, char *a2, char *a3)
{
  unint64_t v6 = operator new(8uLL);
  *unint64_t v6 = &off_1000309D8;
  size_t v7 = operator new(0x10uLL);
  *size_t v7 = &off_100030A80;
  v7[1] = v6;
  size_t v8 = operator new(0x20uLL);
  void *v8 = &off_100030A30;
  v8[1] = 0;
  v8[2] = 0;
  v8[3] = v7;
  size_t v9 = *(std::__shared_weak_count **)(a1 + 48);
  *(void *)(a1 + 40) = v7;
  *(void *)(a1 + 48) = v8;
  if (v9 && !atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
    uint64_t v10 = *(void *)(a1 + 40);
    *(void *)(a1 + 56) = v10;
    unsigned int v11 = *(_DWORD *)(a1 + 24) & 0x1F0;
    if (v11 <= 0x3F) {
      goto LABEL_4;
    }
LABEL_9:
    if (v11 != 64)
    {
      if (v11 == 128)
      {
        return sub_100008050(a1, a2, a3);
      }
      if (v11 == 256)
      {
        return sub_100008248(a1, a2, a3);
      }
LABEL_31:
      sub_100008440();
    }
LABEL_15:
    return sub_100007EB8(a1, a2, a3);
  }
  uint64_t v10 = *(void *)(a1 + 40);
  *(void *)(a1 + 56) = v10;
  unsigned int v11 = *(_DWORD *)(a1 + 24) & 0x1F0;
  if (v11 > 0x3F) {
    goto LABEL_9;
  }
LABEL_4:
  if (v11)
  {
    if (v11 == 16)
    {
      return sub_100007D24(a1, (unsigned __int8 *)a2, a3);
    }
    if (v11 != 32) {
      goto LABEL_31;
    }
    goto LABEL_15;
  }
  unint64_t v13 = a2;
  while (1)
  {
    uint64_t v14 = v13;
    unint64_t v13 = sub_100008778(a1, v13, a3);
    if (v13 == v14) {
      break;
    }
LABEL_19:
    if (v13 == v14) {
      goto LABEL_29;
    }
  }
  uint64_t v15 = *(void *)(a1 + 56);
  int v16 = *(_DWORD *)(a1 + 28);
  int v17 = sub_100008B04(a1, v14, a3);
  if (v17 != (unsigned __int8 *)v14)
  {
    unint64_t v13 = sub_100008E84(a1, (char *)v17, a3, v15, v16 + 1, *(_DWORD *)(a1 + 28) + 1);
    goto LABEL_19;
  }
LABEL_29:
  if (v14 == a2)
  {
    uint64_t v18 = operator new(0x10uLL);
    uint64_t v19 = *(void *)(a1 + 56);
    uint64_t v20 = *(void *)(v19 + 8);
    *uint64_t v18 = &off_100030A80;
    v18[1] = v20;
    *(void *)(v19 + 8) = v18;
    uint64_t v21 = *(void *)(*(void *)(a1 + 56) + 8);
    goto LABEL_32;
  }
LABEL_33:
  if (v14 != a3)
  {
    if (*v14 == 124)
    {
      uint64_t v22 = *(void *)(a1 + 56);
      uint64_t v23 = v14 + 1;
      uint64_t v24 = v14 + 1;
      while (1)
      {
        uint64_t v14 = v24;
        uint64_t v24 = sub_100008778(a1, v24, a3);
        if (v24 == v14)
        {
          uint64_t v25 = *(void *)(a1 + 56);
          int v26 = *(_DWORD *)(a1 + 28);
          size_t v27 = sub_100008B04(a1, v14, a3);
          if (v27 == (unsigned __int8 *)v14)
          {
LABEL_40:
            if (v14 == v23)
            {
              unint64_t v28 = operator new(0x10uLL);
              uint64_t v29 = *(void *)(a1 + 56);
              uint64_t v30 = *(void *)(v29 + 8);
              void *v28 = &off_100030A80;
              v28[1] = v30;
              *(void *)(v29 + 8) = v28;
              *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
            }
            uint64_t v31 = operator new(0x18uLL);
            uint64_t v32 = *(void *)(v22 + 8);
            v31[1] = *(void *)(v10 + 8);
            v31[2] = v32;
            *uint64_t v31 = &off_100030FF0;
            *(void *)(v10 + 8) = v31;
            *(void *)(v22 + 8) = 0;
            xpc_object_t v33 = operator new(0x10uLL);
            uint64_t v34 = *(void *)(*(void *)(a1 + 56) + 8);
            *xpc_object_t v33 = &off_100030A80;
            v33[1] = v34;
            *(void *)(v22 + 8) = v33;
            *(void *)(*(void *)(a1 + 56) + 8) = 0;
            long long v35 = operator new(0x10uLL);
            uint64_t v36 = *(void *)(v22 + 8);
            *long long v35 = &off_100031038;
            v35[1] = v36;
            *(void *)(*(void *)(a1 + 56) + 8) = v35;
            uint64_t v21 = *(void *)(v22 + 8);
LABEL_32:
            *(void *)(a1 + 56) = v21;
            goto LABEL_33;
          }
          uint64_t v24 = sub_100008E84(a1, (char *)v27, a3, v25, v26 + 1, *(_DWORD *)(a1 + 28) + 1);
        }
        if (v24 == v14) {
          goto LABEL_40;
        }
      }
    }
    return v14;
  }
  return a3;
}

void sub_100007A5C()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, __re_err_parse);
}

void sub_100007AA0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

char *sub_100007AB4(uint64_t a1, char *a2, char *a3)
{
  uint64_t v6 = *(void *)(a1 + 56);
  size_t v7 = a2;
  do
  {
    size_t v8 = v7;
    size_t v7 = sub_100008778(a1, v7, a3);
    if (v7 != v8) {
      continue;
    }
    uint64_t v9 = *(void *)(a1 + 56);
    int v10 = *(_DWORD *)(a1 + 28);
    unsigned int v11 = (char *)sub_100008B04(a1, v8, a3);
    if (v11 == v8) {
      break;
    }
    size_t v7 = sub_100008E84(a1, v11, a3, v9, v10 + 1, *(_DWORD *)(a1 + 28) + 1);
  }
  while (v7 != v8);
  if (v8 == a2)
  {
    long long v12 = operator new(0x10uLL);
    uint64_t v13 = *(void *)(a1 + 56);
    uint64_t v14 = *(void *)(v13 + 8);
    *long long v12 = &off_100030A80;
    v12[1] = v14;
    *(void *)(v13 + 8) = v12;
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
    goto LABEL_8;
  }
LABEL_9:
  if (v8 != a3)
  {
    if (*v8 == 124)
    {
      uint64_t v16 = *(void *)(a1 + 56);
      int v17 = v8 + 1;
      uint64_t v18 = v8 + 1;
      while (1)
      {
        size_t v8 = v18;
        uint64_t v18 = sub_100008778(a1, v18, a3);
        if (v18 == v8)
        {
          uint64_t v19 = *(void *)(a1 + 56);
          int v20 = *(_DWORD *)(a1 + 28);
          uint64_t v21 = (char *)sub_100008B04(a1, v8, a3);
          if (v21 == v8)
          {
LABEL_16:
            if (v8 == v17)
            {
              uint64_t v22 = operator new(0x10uLL);
              uint64_t v23 = *(void *)(a1 + 56);
              uint64_t v24 = *(void *)(v23 + 8);
              *uint64_t v22 = &off_100030A80;
              v22[1] = v24;
              *(void *)(v23 + 8) = v22;
              *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
            }
            uint64_t v25 = operator new(0x18uLL);
            uint64_t v26 = *(void *)(v16 + 8);
            v25[1] = *(void *)(v6 + 8);
            v25[2] = v26;
            *uint64_t v25 = &off_100030FF0;
            *(void *)(v6 + 8) = v25;
            *(void *)(v16 + 8) = 0;
            size_t v27 = operator new(0x10uLL);
            uint64_t v28 = *(void *)(*(void *)(a1 + 56) + 8);
            *size_t v27 = &off_100030A80;
            v27[1] = v28;
            *(void *)(v16 + 8) = v27;
            *(void *)(*(void *)(a1 + 56) + 8) = 0;
            uint64_t v29 = operator new(0x10uLL);
            uint64_t v30 = *(void *)(v16 + 8);
            *uint64_t v29 = &off_100031038;
            v29[1] = v30;
            *(void *)(*(void *)(a1 + 56) + 8) = v29;
            uint64_t v15 = *(void *)(v16 + 8);
LABEL_8:
            *(void *)(a1 + 56) = v15;
            goto LABEL_9;
          }
          uint64_t v18 = sub_100008E84(a1, v21, a3, v19, v20 + 1, *(_DWORD *)(a1 + 28) + 1);
        }
        if (v18 == v8) {
          goto LABEL_16;
        }
      }
    }
    return v8;
  }
  return a3;
}

char *sub_100007D24(uint64_t a1, unsigned __int8 *a2, char *a3)
{
  xpc_object_t v3 = a2;
  if (a2 == (unsigned __int8 *)a3) {
    return (char *)a2;
  }
  if (*a2 == 94)
  {
    uint64_t v6 = operator new(0x18uLL);
    BOOL v7 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(v8 + 8);
    *uint64_t v6 = &off_100030B28;
    v6[1] = v9;
    *((unsigned char *)v6 + 16) = v7;
    *(void *)(v8 + 8) = v6;
    *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
    ++v3;
  }
  if (v3 != (unsigned __int8 *)a3)
  {
    while (v3 != (unsigned __int8 *)a3)
    {
      int v10 = v3;
      uint64_t v11 = *(void *)(a1 + 56);
      int v12 = *(_DWORD *)(a1 + 28);
      uint64_t v13 = (unsigned __int8 *)sub_100011738(a1, (uint64_t)v10, a3);
      if (v13 != v10)
      {
        xpc_object_t v3 = sub_100011978(a1, v13, (unsigned __int8 *)a3, v11, v12 + 1, *(_DWORD *)(a1 + 28) + 1);
        if (v3 != v10) {
          continue;
        }
      }
      if (v10 + 1 != (unsigned __int8 *)a3 || *v10 != 36) {
        sub_1000116E0();
      }
      uint64_t v14 = operator new(0x18uLL);
      BOOL v15 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
      uint64_t v16 = *(void *)(a1 + 56);
      uint64_t v17 = *(void *)(v16 + 8);
      *uint64_t v14 = &off_100030B70;
      v14[1] = v17;
      *((unsigned char *)v14 + 16) = v15;
      *(void *)(v16 + 8) = v14;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
      return a3;
    }
  }
  return a3;
}

char *sub_100007EB8(uint64_t a1, char *a2, char *a3)
{
  uint64_t v6 = *(void *)(a1 + 56);
  BOOL v7 = sub_100011ED4(a1, a2, a3);
  if (v7 == a2) {
    goto LABEL_12;
  }
  do
  {
    uint64_t v8 = v7;
    BOOL v7 = sub_100011ED4(a1, v7, a3);
  }
  while (v7 != v8);
  if (v8 == a2) {
LABEL_12:
  }
    sub_1000116E0();
  if (v8 == a3) {
    return a3;
  }
  while (*v8 == 124)
  {
    uint64_t v9 = *(void *)(a1 + 56);
    int v10 = v8 + 1;
    uint64_t v11 = sub_100011ED4(a1, v8 + 1, a3);
    if (v11 == v8 + 1) {
      goto LABEL_12;
    }
    do
    {
      uint64_t v8 = v11;
      uint64_t v11 = sub_100011ED4(a1, v11, a3);
    }
    while (v11 != v8);
    if (v8 == v10) {
      goto LABEL_12;
    }
    int v12 = operator new(0x18uLL);
    uint64_t v13 = *(void *)(v9 + 8);
    v12[1] = *(void *)(v6 + 8);
    v12[2] = v13;
    *int v12 = &off_100030FF0;
    *(void *)(v6 + 8) = v12;
    *(void *)(v9 + 8) = 0;
    uint64_t v14 = operator new(0x10uLL);
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
    *uint64_t v14 = &off_100030A80;
    v14[1] = v15;
    *(void *)(v9 + 8) = v14;
    *(void *)(*(void *)(a1 + 56) + 8) = 0;
    uint64_t v16 = operator new(0x10uLL);
    uint64_t v17 = *(void *)(v9 + 8);
    *uint64_t v16 = &off_100031038;
    v16[1] = v17;
    *(void *)(*(void *)(a1 + 56) + 8) = v16;
    *(void *)(a1 + 56) = *(void *)(v9 + 8);
    if (v8 == a3) {
      return a3;
    }
  }
  return v8;
}

char *sub_100008050(uint64_t a1, char *__s, char *a3)
{
  uint64_t v6 = *(void *)(a1 + 56);
  BOOL v7 = (char *)memchr(__s, 10, a3 - __s);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = a3;
  }
  if (v8 == __s)
  {
    int v10 = operator new(0x10uLL);
    uint64_t v11 = *(void *)(v6 + 8);
    void *v10 = &off_100030A80;
    v10[1] = v11;
    *(void *)(v6 + 8) = v10;
    *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
    if (v8 == a3) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = v8 + 1;
    }
    if (v9 == a3) {
      return a3;
    }
  }
  else
  {
    sub_100007D24(a1, (unsigned __int8 *)__s, v8);
    if (v8 == a3) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = v8 + 1;
    }
    if (v9 == a3) {
      return a3;
    }
  }
  uint64_t v12 = *(void *)(a1 + 56);
  do
  {
    uint64_t v21 = (char *)memchr(v9, 10, a3 - v9);
    if (v21) {
      uint64_t v22 = v21;
    }
    else {
      uint64_t v22 = a3;
    }
    if (v22 == v9)
    {
      uint64_t v13 = operator new(0x10uLL);
      uint64_t v14 = *(void *)(v12 + 8);
      void *v13 = &off_100030A80;
      v13[1] = v14;
      *(void *)(v12 + 8) = v13;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
    }
    else
    {
      sub_100007D24(a1, (unsigned __int8 *)v9, v22);
    }
    uint64_t v15 = operator new(0x18uLL);
    uint64_t v16 = *(void *)(v12 + 8);
    v15[1] = *(void *)(v6 + 8);
    v15[2] = v16;
    void *v15 = &off_100030FF0;
    *(void *)(v6 + 8) = v15;
    *(void *)(v12 + 8) = 0;
    uint64_t v17 = operator new(0x10uLL);
    uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
    *uint64_t v17 = &off_100030A80;
    v17[1] = v18;
    *(void *)(v12 + 8) = v17;
    *(void *)(*(void *)(a1 + 56) + 8) = 0;
    uint64_t v19 = operator new(0x10uLL);
    uint64_t v20 = *(void *)(v12 + 8);
    void *v19 = &off_100031038;
    v19[1] = v20;
    *(void *)(*(void *)(a1 + 56) + 8) = v19;
    uint64_t v12 = *(void *)(v12 + 8);
    *(void *)(a1 + 56) = v12;
    if (v22 == a3) {
      uint64_t v9 = v22;
    }
    else {
      uint64_t v9 = v22 + 1;
    }
  }
  while (v9 != a3);
  return a3;
}

char *sub_100008248(uint64_t a1, char *__s, char *a3)
{
  uint64_t v6 = *(void *)(a1 + 56);
  BOOL v7 = (char *)memchr(__s, 10, a3 - __s);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = a3;
  }
  if (v8 == __s)
  {
    int v10 = operator new(0x10uLL);
    uint64_t v11 = *(void *)(v6 + 8);
    void *v10 = &off_100030A80;
    v10[1] = v11;
    *(void *)(v6 + 8) = v10;
    *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
    if (v8 == a3) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = v8 + 1;
    }
    if (v9 == a3) {
      return a3;
    }
  }
  else
  {
    sub_100007EB8(a1, __s, v8);
    if (v8 == a3) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = v8 + 1;
    }
    if (v9 == a3) {
      return a3;
    }
  }
  uint64_t v12 = *(void *)(a1 + 56);
  do
  {
    uint64_t v21 = (char *)memchr(v9, 10, a3 - v9);
    if (v21) {
      uint64_t v22 = v21;
    }
    else {
      uint64_t v22 = a3;
    }
    if (v22 == v9)
    {
      uint64_t v13 = operator new(0x10uLL);
      uint64_t v14 = *(void *)(v12 + 8);
      void *v13 = &off_100030A80;
      v13[1] = v14;
      *(void *)(v12 + 8) = v13;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
    }
    else
    {
      sub_100007EB8(a1, v9, v22);
    }
    uint64_t v15 = operator new(0x18uLL);
    uint64_t v16 = *(void *)(v12 + 8);
    v15[1] = *(void *)(v6 + 8);
    v15[2] = v16;
    void *v15 = &off_100030FF0;
    *(void *)(v6 + 8) = v15;
    *(void *)(v12 + 8) = 0;
    uint64_t v17 = operator new(0x10uLL);
    uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
    *uint64_t v17 = &off_100030A80;
    v17[1] = v18;
    *(void *)(v12 + 8) = v17;
    *(void *)(*(void *)(a1 + 56) + 8) = 0;
    uint64_t v19 = operator new(0x10uLL);
    uint64_t v20 = *(void *)(v12 + 8);
    void *v19 = &off_100031038;
    v19[1] = v20;
    *(void *)(*(void *)(a1 + 56) + 8) = v19;
    uint64_t v12 = *(void *)(v12 + 8);
    *(void *)(a1 + 56) = v12;
    if (v22 == a3) {
      uint64_t v9 = v22;
    }
    else {
      uint64_t v9 = v22 + 1;
    }
  }
  while (v9 != a3);
  return a3;
}

void sub_100008440()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, __re_err_grammar);
}

void sub_100008484(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_1000084A0(uint64_t a1, _DWORD *a2)
{
  *a2 = -1000;
}

void sub_1000084B8(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t sub_1000084E0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t sub_100008510(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x800000010002AA31) {
    return a1 + 24;
  }
  if (((v3 & 0x800000010002AA31 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x800000010002AA31)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000010002AA31 & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

void *sub_100008594(void *a1)
{
  *a1 = &off_100030AF8;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_100008600(void *__p)
{
  *std::string __p = &off_100030AF8;
  uint64_t v2 = __p[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  operator delete(__p);
}

uint64_t sub_10000867C(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void *sub_100008690(void *a1)
{
  *a1 = &off_100030AF8;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_1000086FC(void *__p)
{
  *std::string __p = &off_100030AF8;
  uint64_t v2 = __p[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  operator delete(__p);
}

char *sub_100008778(uint64_t a1, char *a2, char *a3)
{
  if (a2 == a3) {
    return a2;
  }
  int v6 = *a2;
  if (v6 > 91)
  {
    if (v6 == 92)
    {
      if (a2 + 1 != a3)
      {
        int v14 = a2[1];
        if (v14 == 66)
        {
          uint64_t v15 = (char *)operator new(0x30uLL);
          uint64_t v23 = *(void *)(*(void *)(a1 + 56) + 8);
          *(void *)uint64_t v15 = off_100030BB8;
          *((void *)v15 + 1) = v23;
          std::locale::locale((std::locale *)v15 + 2, (const std::locale *)a1);
          *(_OWORD *)(v15 + 24) = *(_OWORD *)(a1 + 8);
          v15[40] = 1;
        }
        else
        {
          if (v14 != 98) {
            return a2;
          }
          uint64_t v15 = (char *)operator new(0x30uLL);
          uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
          *(void *)uint64_t v15 = off_100030BB8;
          *((void *)v15 + 1) = v16;
          std::locale::locale((std::locale *)v15 + 2, (const std::locale *)a1);
          *(_OWORD *)(v15 + 24) = *(_OWORD *)(a1 + 8);
          v15[40] = 0;
        }
        *(void *)(*(void *)(a1 + 56) + 8) = v15;
        *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
        return a2 + 2;
      }
      return a2;
    }
    if (v6 != 94) {
      return a2;
    }
    int v10 = operator new(0x18uLL);
    BOOL v11 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    uint64_t v12 = *(void *)(a1 + 56);
    v10[1] = *(void *)(v12 + 8);
    uint64_t v13 = &off_100030B28;
LABEL_14:
    void *v10 = v13;
    *((unsigned char *)v10 + 16) = v11;
    *(void *)(v12 + 8) = v10;
    *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
    return a2 + 1;
  }
  if (v6 == 36)
  {
    int v10 = operator new(0x18uLL);
    BOOL v11 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    uint64_t v12 = *(void *)(a1 + 56);
    v10[1] = *(void *)(v12 + 8);
    uint64_t v13 = &off_100030B70;
    goto LABEL_14;
  }
  BOOL v8 = v6 == 40;
  BOOL v7 = a2 + 1;
  BOOL v8 = !v8 || v7 == a3;
  if (v8) {
    return a2;
  }
  BOOL v8 = *v7 == 63;
  uint64_t v17 = a2 + 2;
  if (!v8 || v17 == a3) {
    return a2;
  }
  int v19 = *v17;
  if (v19 == 33)
  {
    *(void *)&long long v24 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v28 = v24;
    long long v29 = v24;
    long long v26 = v24;
    long long v27 = v24;
    sub_10000927C((uint64_t)&v26);
    DWORD2(v27) = *(_DWORD *)(a1 + 24);
    uint64_t v21 = (char *)sub_1000075A4(&v26, a2 + 3, a3);
    int v25 = HIDWORD(v27);
    sub_1000092EC(a1, (uint64_t)&v26, 1, *(_DWORD *)(a1 + 28));
    *(_DWORD *)(a1 + 28) += v25;
    if (v21 == a3 || *v21 != 41) {
      sub_1000093AC();
    }
    goto LABEL_32;
  }
  if (v19 != 61) {
    return a2;
  }
  *(void *)&long long v20 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v28 = v20;
  long long v29 = v20;
  long long v26 = v20;
  long long v27 = v20;
  sub_10000927C((uint64_t)&v26);
  DWORD2(v27) = *(_DWORD *)(a1 + 24);
  uint64_t v21 = (char *)sub_1000075A4(&v26, a2 + 3, a3);
  int v22 = HIDWORD(v27);
  sub_1000092EC(a1, (uint64_t)&v26, 0, *(_DWORD *)(a1 + 28));
  *(_DWORD *)(a1 + 28) += v22;
  if (v21 == a3 || *v21 != 41) {
    sub_1000093AC();
  }
LABEL_32:
  sub_1000065BC((std::locale *)&v26);
  return v21 + 1;
}

void sub_100008AB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
}

void sub_100008AC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
}

void sub_100008ADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
}

void sub_100008AF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
}

unsigned __int8 *sub_100008B04(uint64_t a1, char *a2, char *a3)
{
  uint64_t v3 = a2;
  if (a2 != a3)
  {
    switch(*a2)
    {
      case '(':
        if (a2 + 1 == a3) {
          goto LABEL_32;
        }
        if (a2 + 2 != a3 && a2[1] == 63 && a2[2] == 58)
        {
          int v6 = (_DWORD *)(a1 + 36);
          ++*(_DWORD *)(a1 + 36);
          BOOL v7 = sub_100007AB4(a1, a2 + 3, a3);
          if (v7 == a3) {
            goto LABEL_32;
          }
          uint64_t v3 = v7;
          if (*v7 != 41) {
            goto LABEL_32;
          }
        }
        else
        {
          if ((*(unsigned char *)(a1 + 24) & 2) != 0)
          {
            int v13 = *(_DWORD *)(a1 + 28);
          }
          else
          {
            uint64_t v12 = operator new(0x18uLL);
            int v13 = *(_DWORD *)(a1 + 28) + 1;
            *(_DWORD *)(a1 + 28) = v13;
            uint64_t v14 = *(void *)(a1 + 56);
            uint64_t v15 = *(void *)(v14 + 8);
            *uint64_t v12 = &off_100030E88;
            v12[1] = v15;
            *((_DWORD *)v12 + 4) = v13;
            *(void *)(v14 + 8) = v12;
            *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
          }
          int v6 = (_DWORD *)(a1 + 36);
          ++*(_DWORD *)(a1 + 36);
          uint64_t v16 = sub_100007AB4(a1, v3 + 1, a3);
          if (v16 == a3 || (uint64_t v3 = v16, *v16 != 41)) {
LABEL_32:
          }
            sub_1000093AC();
          if ((*(unsigned char *)(a1 + 24) & 2) == 0)
          {
            uint64_t v17 = operator new(0x18uLL);
            uint64_t v18 = *(void *)(a1 + 56);
            uint64_t v19 = *(void *)(v18 + 8);
            *uint64_t v17 = &off_100030ED0;
            v17[1] = v19;
            *((_DWORD *)v17 + 4) = v13;
            *(void *)(v18 + 8) = v17;
            *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
          }
        }
        --*v6;
LABEL_29:
        ++v3;
        break;
      case ')':
      case ',':
      case '-':
      case '/':
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
      case ':':
      case ';':
      case '<':
      case '=':
      case '>':
      case '@':
      case 'A':
      case 'B':
      case 'C':
      case 'D':
      case 'E':
      case 'F':
      case 'G':
      case 'H':
      case 'I':
      case 'J':
      case 'K':
      case 'L':
      case 'M':
      case 'N':
      case 'O':
      case 'P':
      case 'Q':
      case 'R':
      case 'S':
      case 'T':
      case 'U':
      case 'V':
      case 'W':
      case 'X':
      case 'Y':
      case 'Z':
        goto LABEL_20;
      case '*':
      case '+':
      case '?':
        goto LABEL_31;
      case '.':
        BOOL v8 = operator new(0x10uLL);
        uint64_t v9 = *(void *)(a1 + 56);
        uint64_t v10 = *(void *)(v9 + 8);
        void *v8 = &off_100030C48;
        v8[1] = v10;
        *(void *)(v9 + 8) = v8;
        *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
        goto LABEL_29;
      case '[':
        return (unsigned __int8 *)sub_10000ACB4(a1, a2, a3);
      case '\\':
        return sub_10000AB38(a1, (unsigned __int8 *)a2, (unsigned __int8 *)a3);
      default:
        if (*a2 == 123) {
LABEL_31:
        }
          sub_10000AE08();
LABEL_20:
        return sub_10000AE60(a1, a2, a3);
    }
  }
  return (unsigned __int8 *)v3;
}

char *sub_100008E84(uint64_t a1, char *a2, char *a3, uint64_t a4, int a5, int a6)
{
  if (a2 == a3) {
    return a2;
  }
  int v6 = *(_DWORD *)(a1 + 24) & 0x1F0;
  int v7 = *a2;
  if (v7 <= 62)
  {
    if (v7 == 42)
    {
      BOOL v8 = a2 + 1;
      if (v6) {
        BOOL v20 = 1;
      }
      else {
        BOOL v20 = v8 == a3;
      }
      if (!v20 && *v8 == 63)
      {
        uint64_t v9 = (unsigned __int8 *)(a2 + 2);
        uint64_t v10 = 0;
        goto LABEL_35;
      }
      uint64_t v24 = 0;
      goto LABEL_44;
    }
    if (v7 == 43)
    {
      BOOL v8 = a2 + 1;
      if (!v6 && v8 != a3 && *v8 == 63)
      {
        uint64_t v9 = (unsigned __int8 *)(a2 + 2);
        uint64_t v10 = 1;
LABEL_35:
        sub_100010D78(a1, v10, -1, a4, a5, a6, 0);
        return (char *)v9;
      }
      uint64_t v24 = 1;
      goto LABEL_44;
    }
    return a2;
  }
  if (v7 == 63)
  {
    uint64_t v21 = a2 + 1;
    if (v6) {
      BOOL v22 = 1;
    }
    else {
      BOOL v22 = v21 == a3;
    }
    if (v22 || *v21 != 63)
    {
      sub_100010D78(a1, 0, 1, a4, a5, a6, 1);
      return v21;
    }
    else
    {
      uint64_t v23 = a2 + 2;
      sub_100010D78(a1, 0, 1, a4, a5, a6, 0);
      return v23;
    }
  }
  else
  {
    if (v7 != 123) {
      return a2;
    }
    BOOL v11 = a2 + 1;
    if (a2 + 1 == a3) {
      goto LABEL_71;
    }
    int v12 = *v11;
    if ((v12 & 0xF8) != 0x30 && (v12 & 0xFE) != 0x38) {
      goto LABEL_71;
    }
    int v13 = v12 - 48;
    uint64_t v14 = a2 + 2;
    if (a2 + 2 == a3)
    {
LABEL_19:
      uint64_t v14 = a3;
    }
    else
    {
      while (1)
      {
        int v15 = *v14;
        if ((v15 & 0xF8) != 0x30 && (v15 & 0xFE) != 0x38) {
          break;
        }
        if (v13 >= 214748364) {
          goto LABEL_71;
        }
        int v13 = v15 + 10 * v13 - 48;
        if (++v14 == a3) {
          goto LABEL_19;
        }
      }
    }
    if (v14 == v11) {
      goto LABEL_71;
    }
    if (v14 == a3) {
      goto LABEL_72;
    }
    int v16 = *v14;
    if (v16 != 44)
    {
      if (v16 == 125)
      {
        uint64_t v17 = v14 + 1;
        if (v6 || v17 == a3 || *v17 != 63)
        {
          sub_100010D78(a1, v13, v13, a4, a5, a6, 1);
          return v17;
        }
        else
        {
          uint64_t v18 = (unsigned __int8 *)(v14 + 2);
          sub_100010D78(a1, v13, v13, a4, a5, a6, 0);
          return (char *)v18;
        }
      }
LABEL_71:
      sub_100010EB4();
    }
    int v25 = v14 + 1;
    if (v14 + 1 == a3) {
      goto LABEL_71;
    }
    int v26 = *v25;
    if (v26 == 125)
    {
      BOOL v8 = v14 + 2;
      if (!v6 && v8 != a3 && *v8 == 63)
      {
        uint64_t v10 = v13;
        uint64_t v9 = (unsigned __int8 *)(v14 + 3);
        goto LABEL_35;
      }
      uint64_t v24 = v13;
LABEL_44:
      sub_100010D78(a1, v24, -1, a4, a5, a6, 1);
      return v8;
    }
    if ((v26 & 0xF8) != 0x30 && (v26 & 0xFE) != 0x38) {
      goto LABEL_72;
    }
    int v27 = v26 - 48;
    long long v28 = v14 + 2;
    if (v28 == a3)
    {
LABEL_60:
      long long v28 = a3;
    }
    else
    {
      while (1)
      {
        int v29 = *v28;
        if ((v29 & 0xF8) != 0x30 && (v29 & 0xFE) != 0x38) {
          break;
        }
        if (v27 >= 214748364) {
          goto LABEL_71;
        }
        int v27 = v29 + 10 * v27 - 48;
        if (++v28 == a3) {
          goto LABEL_60;
        }
      }
    }
    if (v28 == v25 || v28 == a3 || *v28 != 125) {
LABEL_72:
    }
      sub_100010F0C();
    if (v27 < v13) {
      goto LABEL_71;
    }
    uint64_t v30 = v28 + 1;
    if (v6 || v30 == a3 || *v30 != 63)
    {
      sub_100010D78(a1, v13, v27, a4, a5, a6, 1);
      return v30;
    }
    else
    {
      uint64_t v31 = v28 + 2;
      sub_100010D78(a1, v13, v27, a4, a5, a6, 0);
      return v31;
    }
  }
}

uint64_t sub_10000927C(uint64_t a1)
{
  uint64_t v2 = std::locale::locale((std::locale *)a1);
  *(void *)(a1 + 8) = std::locale::use_facet(v2, &std::ctype<char>::id);
  *(void *)(a1 + 16) = std::locale::use_facet((const std::locale *)a1, &std::collate<char>::id);
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(void *)(a1 + 56) = 0;
  return a1;
}

void sub_1000092D8(_Unwind_Exception *a1)
{
  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

std::locale *sub_1000092EC(uint64_t a1, uint64_t a2, char a3, int a4)
{
  BOOL v8 = (char *)operator new(0x58uLL);
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  *(void *)BOOL v8 = off_100030C00;
  *((void *)v8 + 1) = v9;
  uint64_t result = std::locale::locale((std::locale *)v8 + 2, (const std::locale *)a2);
  *(_OWORD *)(v8 + 24) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(v8 + 40) = *(_OWORD *)(a2 + 24);
  uint64_t v11 = *(void *)(a2 + 48);
  *((void *)v8 + 7) = *(void *)(a2 + 40);
  *((void *)v8 + 8) = v11;
  if (v11) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v11 + 8), 1uLL, memory_order_relaxed);
  }
  *((void *)v8 + 9) = *(void *)(a2 + 56);
  *((_DWORD *)v8 + 20) = a4;
  v8[84] = a3;
  *(void *)(*(void *)(a1 + 56) + 8) = v8;
  *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
  return result;
}

void sub_1000093AC()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_paren);
}

void sub_1000093F0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void *sub_100009404(void *a1)
{
  *a1 = &off_100030AF8;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_100009470(void *__p)
{
  *std::string __p = &off_100030AF8;
  uint64_t v2 = __p[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  operator delete(__p);
}

uint64_t sub_1000094EC(uint64_t result, uint64_t a2)
{
  if (!*(unsigned char *)(a2 + 92))
  {
    if (!*(unsigned char *)(result + 16)) {
      goto LABEL_12;
    }
    int v2 = *(unsigned __int8 *)(*(void *)(a2 + 16) - 1);
    if (v2 != 13 && v2 != 10) {
      goto LABEL_12;
    }
LABEL_11:
    *(_DWORD *)a2 = -994;
    *(void *)(a2 + 80) = *(void *)(result + 8);
    return result;
  }
  if (*(void *)(a2 + 16) == *(void *)(a2 + 8) && (*(unsigned char *)(a2 + 88) & 1) == 0) {
    goto LABEL_11;
  }
LABEL_12:
  *(_DWORD *)a2 = -993;
  *(void *)(a2 + 80) = 0;
  return result;
}

void *sub_10000954C(void *a1)
{
  *a1 = &off_100030AF8;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_1000095B8(void *__p)
{
  *std::string __p = &off_100030AF8;
  uint64_t v2 = __p[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  operator delete(__p);
}

uint64_t sub_100009634(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) && (*(unsigned char *)(a2 + 88) & 2) == 0
    || *(unsigned char *)(result + 16) && ((int v3 = *v2, v3 != 13) ? (v4 = v3 == 10) : (v4 = 1), v4))
  {
    *(_DWORD *)a2 = -994;
    *(void *)(a2 + 80) = *(void *)(result + 8);
  }
  else
  {
    *(_DWORD *)a2 = -993;
    *(void *)(a2 + 80) = 0;
  }
  return result;
}

std::locale *sub_100009684(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_100030BB8;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&off_100030AF8;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void sub_100009710(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_100030BB8;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&off_100030AF8;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  operator delete(a1);
}

uint64_t sub_1000097AC(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 **)(a2 + 8);
  int v3 = *(unsigned __int8 **)(a2 + 24);
  if (v2 == v3) {
    goto LABEL_19;
  }
  BOOL v4 = *(unsigned __int8 **)(a2 + 16);
  if (v4 != v3)
  {
    if (v4 == v2)
    {
      int v5 = *(_DWORD *)(a2 + 88);
      if ((v5 & 0x80) == 0)
      {
        if ((v5 & 4) == 0)
        {
          uint64_t v6 = *v2;
          if (v6 == 95) {
            goto LABEL_17;
          }
          goto LABEL_15;
        }
        goto LABEL_19;
      }
    }
    uint64_t v7 = *(v4 - 1);
    uint64_t v8 = *v4;
    if (v7 == 95
      || (v7 & 0x80) == 0 && (*(_DWORD *)(*(void *)(*(void *)(result + 24) + 16) + 4 * v7) & 0x500) != 0)
    {
      int v9 = 1;
      if (v8 == 95) {
        goto LABEL_24;
      }
    }
    else
    {
      int v9 = 0;
      if (v8 == 95) {
        goto LABEL_24;
      }
    }
    if ((v8 & 0x80) != 0 || (*(_DWORD *)(*(void *)(*(void *)(result + 24) + 16) + 4 * v8) & 0x500) == 0)
    {
      if (*(unsigned char *)(result + 40) == (v9 != 0)) {
        goto LABEL_20;
      }
      goto LABEL_27;
    }
LABEL_24:
    if (*(unsigned char *)(result + 40) != (v9 != 1)) {
      goto LABEL_27;
    }
    goto LABEL_20;
  }
  if ((*(unsigned char *)(a2 + 88) & 8) == 0)
  {
    uint64_t v6 = *(v3 - 1);
    if (v6 == 95) {
      goto LABEL_17;
    }
LABEL_15:
    if ((v6 & 0x80) == 0 && (*(_DWORD *)(*(void *)(*(void *)(result + 24) + 16) + 4 * v6) & 0x500) != 0)
    {
LABEL_17:
      if (*(unsigned char *)(result + 40) != 1) {
        goto LABEL_27;
      }
LABEL_20:
      *(_DWORD *)a2 = -993;
      *(void *)(a2 + 80) = 0;
      return result;
    }
  }
LABEL_19:
  if (!*(unsigned char *)(result + 40)) {
    goto LABEL_20;
  }
LABEL_27:
  uint64_t v10 = *(void *)(result + 8);
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 80) = v10;
  return result;
}

std::locale *sub_100009900(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_100030C00;
  uint64_t v2 = a1 + 2;
  locale = (std::__shared_weak_count *)a1[8].__locale_;
  if (locale && !atomic_fetch_add(&locale->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))locale->__on_zero_shared)(locale);
    std::__shared_weak_count::__release_weak(locale);
    std::locale::~locale(v2);
    a1->__locale_ = (std::locale::__imp *)&off_100030AF8;
    BOOL v4 = a1[1].__locale_;
    if (!v4) {
      return a1;
    }
    goto LABEL_4;
  }
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&off_100030AF8;
  BOOL v4 = a1[1].__locale_;
  if (v4) {
LABEL_4:
  }
    (*(void (**)(std::locale::__imp *))(*(void *)v4 + 8))(v4);
  return a1;
}

void sub_100009A14(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_100030C00;
  uint64_t v2 = a1 + 2;
  locale = (std::__shared_weak_count *)a1[8].__locale_;
  if (!locale || atomic_fetch_add(&locale->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    std::locale::~locale(a1 + 2);
    a1->__locale_ = (std::locale::__imp *)&off_100030AF8;
    BOOL v4 = a1[1].__locale_;
    if (!v4) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  ((void (*)(std::__shared_weak_count *))locale->__on_zero_shared)(locale);
  std::__shared_weak_count::__release_weak(locale);
  std::locale::~locale(v2);
  a1->__locale_ = (std::locale::__imp *)&off_100030AF8;
  BOOL v4 = a1[1].__locale_;
  if (v4) {
LABEL_4:
  }
    (*(void (**)(std::locale::__imp *))(*(void *)v4 + 8))(v4);
LABEL_5:
  operator delete(a1);
}

void sub_100009B38(uint64_t a1, uint64_t a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v23 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v25 = 0xAAAAAAAAAAAAAA00;
  long long v27 = v4;
  uint64_t v24 = 0;
  long long v26 = 0uLL;
  LOBYTE(v27) = 0;
  BYTE8(v27) = 0;
  uint64_t v28 = 0;
  std::string __p = 0;
  BOOL v20 = 0;
  unint64_t v5 = (*(_DWORD *)(a1 + 44) + 1);
  uint64_t v7 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v21 = 0;
  *(void *)&long long v22 = v6;
  *((void *)&v22 + 1) = v6;
  LOBYTE(v23) = 0;
  sub_10000A1E4((uint64_t)&__p, v5, &v22);
  *((void *)&v23 + 1) = v7;
  uint64_t v24 = v7;
  LOBYTE(v25) = 0;
  long long v26 = v22;
  LOBYTE(v27) = v23;
  uint64_t v28 = v7;
  BYTE8(v27) = 1;
  uint64_t v8 = *(void *)(a2 + 16);
  if (*(unsigned char *)(a2 + 92)) {
    BOOL v9 = v8 == *(void *)(a2 + 8);
  }
  else {
    BOOL v9 = 0;
  }
  char v10 = v9;
  if (*(unsigned __int8 *)(a1 + 84) == sub_100009CD8(a1 + 16, v8, *(void *)(a2 + 24), (uint64_t *)&__p, *(_DWORD *)(a2 + 88) & 0xFBF | 0x40u, v10))
  {
    *(_DWORD *)a2 = -993;
    *(void *)(a2 + 80) = 0;
    uint64_t v11 = (char *)__p;
    goto LABEL_13;
  }
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 80) = *(void *)(a1 + 8);
  uint64_t v11 = (char *)__p;
  unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((v20 - (unsigned char *)__p) >> 3);
  if (v12 < 2)
  {
LABEL_13:
    if (!v11) {
      return;
    }
    goto LABEL_14;
  }
  int v13 = 0;
  int v14 = *(_DWORD *)(a1 + 80);
  uint64_t v15 = *(void *)(a2 + 32);
  unint64_t v16 = 1;
  do
  {
    uint64_t v17 = &v11[24 * v16];
    uint64_t v18 = v15 + 24 * (v14 + v13);
    *(_OWORD *)uint64_t v18 = *(_OWORD *)v17;
    *(unsigned char *)(v18 + 16) = v17[16];
    unint64_t v16 = (v13 + 2);
    ++v13;
  }
  while (v12 > v16);
LABEL_14:
  BOOL v20 = v11;
  operator delete(v11);
}

void sub_100009CB8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100009CD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  uint64_t v49 = 0;
  uint64_t v50 = 0;
  unint64_t v51 = 0;
  uint64_t v6 = *(void *)(a1 + 40);
  if (!v6) {
    return 0;
  }
  *((void *)&v47 + 1) = a3;
  unint64_t v48 = 0xAAAAAAAAAAAAAA00;
  *(void *)&long long v47 = a3;
  *(_DWORD *)xpc_object_t v46 = 0;
  memset(&v46[8], 0, 85);
  uint64_t v50 = sub_10000A4F8((void **)&v49, (uint64_t)v46);
  if (*(void *)&v46[56])
  {
    *(void *)&v46[64] = *(void *)&v46[56];
    operator delete(*(void **)&v46[56]);
  }
  if (*(void *)&v46[32])
  {
    *(void *)&v46[40] = *(void *)&v46[32];
    operator delete(*(void **)&v46[32]);
  }
  int v13 = v50;
  *((_DWORD *)v50 - 24) = 0;
  *((void *)v13 - 11) = a2;
  *((void *)v13 - 10) = a2;
  *((void *)v13 - 9) = a3;
  uint64_t v14 = *((void *)v13 - 8);
  unint64_t v15 = *(unsigned int *)(a1 + 28);
  unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((*((void *)v13 - 7) - v14) >> 3);
  if (v15 <= v16)
  {
    if (v15 < v16) {
      *((void *)v13 - 7) = v14 + 24 * v15;
    }
  }
  else
  {
    sub_10000A6CC((void **)v13 - 8, v15 - v16, &v47);
    int v13 = v50;
  }
  uint64_t v18 = *((void *)v13 - 5);
  unint64_t v19 = *(unsigned int *)(a1 + 32);
  unint64_t v20 = (*((void *)v13 - 4) - v18) >> 4;
  if (v19 <= v20)
  {
    if (v19 < v20) {
      *((void *)v13 - 4) = v18 + 16 * v19;
    }
  }
  else
  {
    sub_10000A880((char **)v13 - 5, v19 - v20);
    int v13 = v50;
  }
  *((void *)v13 - 2) = v6;
  *((_DWORD *)v13 - 2) = a5;
  *(v13 - 4) = a6;
  unsigned int v21 = 1;
  while (2)
  {
    if ((v21 & 0xFFF) == 0 && (int)(v21 >> 12) >= (int)a3 - (int)a2) {
      sub_10000A3C4();
    }
    uint64_t v23 = *((void *)v13 - 2);
    if (v23) {
      (*(void (**)(uint64_t, char *))(*(void *)v23 + 16))(v23, v13 - 96);
    }
    switch(*((_DWORD *)v13 - 24))
    {
      case 0xFFFFFC18:
        uint64_t v24 = *((void *)v13 - 10);
        if ((a5 & 0x20) != 0 && v24 == a2 || (a5 & 0x1000) != 0 && v24 != a3) {
          goto LABEL_27;
        }
        uint64_t v37 = *a4;
        *(void *)uint64_t v37 = a2;
        *(void *)(v37 + 8) = v24;
        *(unsigned char *)(v37 + 16) = 1;
        uint64_t v38 = *((void *)v13 - 8);
        uint64_t v39 = *((void *)v13 - 7) - v38;
        if (v39)
        {
          unint64_t v40 = 0xAAAAAAAAAAAAAAABLL * (v39 >> 3);
          int v41 = (unsigned char *)(v38 + 16);
          unsigned int v42 = 1;
          do
          {
            uint64_t v43 = v37 + 24 * v42;
            *(_OWORD *)uint64_t v43 = *((_OWORD *)v41 - 1);
            char v44 = *v41;
            v41 += 24;
            *(unsigned char *)(v43 + 16) = v44;
          }
          while (v40 > v42++);
        }
        uint64_t v17 = 1;
        long long v22 = v49;
        if (!v49) {
          return v17;
        }
        goto LABEL_38;
      case 0xFFFFFC1D:
      case 0xFFFFFC1E:
      case 0xFFFFFC21:
        goto LABEL_17;
      case 0xFFFFFC1F:
LABEL_27:
        unint64_t v25 = v50;
        long long v26 = (void *)*((void *)v50 - 5);
        if (v26)
        {
          *((void *)v50 - 4) = v26;
          operator delete(v26);
        }
        long long v27 = (void *)*((void *)v25 - 8);
        if (v27)
        {
          *((void *)v25 - 7) = v27;
          operator delete(v27);
        }
        uint64_t v50 = v25 - 96;
        goto LABEL_17;
      case 0xFFFFFC20:
        *(void *)&long long v28 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v28 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&v46[64] = v28;
        *(_OWORD *)&v46[80] = v28;
        *(_OWORD *)&v46[32] = v28;
        *(_OWORD *)&v46[48] = v28;
        *(_OWORD *)xpc_object_t v46 = v28;
        *(_OWORD *)&v46[16] = v28;
        sub_10000A9BC((uint64_t)v46, (long long *)v13 - 6);
        (*(void (**)(void, uint64_t, char *))(**((void **)v13 - 2) + 24))(*((void *)v13 - 2), 1, v13 - 96);
        (*(void (**)(void, void, unsigned char *))(**(void **)&v46[80] + 24))(*(void *)&v46[80], 0, v46);
        int v29 = v50;
        if ((unint64_t)v50 >= v51)
        {
          uint64_t v50 = sub_10000A4F8((void **)&v49, (uint64_t)v46);
          if (*(void *)&v46[56])
          {
            *(void *)&v46[64] = *(void *)&v46[56];
            operator delete(*(void **)&v46[56]);
          }
        }
        else
        {
          long long v30 = *(_OWORD *)&v46[16];
          *(_OWORD *)uint64_t v50 = *(_OWORD *)v46;
          *((_OWORD *)v29 + 1) = v30;
          *((void *)v29 + 4) = 0;
          *((void *)v29 + 5) = 0;
          *((void *)v29 + 6) = 0;
          *((void *)v29 + 7) = 0;
          *((_OWORD *)v29 + 2) = *(_OWORD *)&v46[32];
          *((void *)v29 + 6) = *(void *)&v46[48];
          memset(&v46[32], 0, 24);
          *((void *)v29 + 8) = 0;
          *((void *)v29 + 9) = 0;
          *(_OWORD *)(v29 + 56) = *(_OWORD *)&v46[56];
          *((void *)v29 + 9) = *(void *)&v46[72];
          memset(&v46[56], 0, 24);
          uint64_t v31 = *(void *)&v46[80];
          *(void *)(v29 + 85) = *(void *)&v46[85];
          *((void *)v29 + 10) = v31;
          uint64_t v50 = v29 + 96;
        }
        if (*(void *)&v46[32])
        {
          *(void *)&v46[40] = *(void *)&v46[32];
          operator delete(*(void **)&v46[32]);
        }
LABEL_17:
        long long v22 = v49;
        int v13 = v50;
        ++v21;
        if (v49 != v50) {
          continue;
        }
        uint64_t v17 = 0;
        if (v49)
        {
LABEL_38:
          uint64_t v32 = v50;
          xpc_object_t v33 = v22;
          if (v50 != v22)
          {
            do
            {
              uint64_t v34 = (void *)*((void *)v32 - 5);
              if (v34)
              {
                *((void *)v32 - 4) = v34;
                operator delete(v34);
              }
              long long v35 = (void *)*((void *)v32 - 8);
              if (v35)
              {
                *((void *)v32 - 7) = v35;
                operator delete(v35);
              }
              v32 -= 96;
            }
            while (v32 != v22);
            xpc_object_t v33 = v49;
          }
          uint64_t v50 = v22;
          operator delete(v33);
        }
        break;
      default:
        sub_10000A41C();
    }
    return v17;
  }
}

void sub_10000A138(_Unwind_Exception *a1)
{
  sub_10000A474((void **)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_10000A14C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_10000A380((uint64_t *)va);
  sub_10000A474((void **)(v3 - 112));
  _Unwind_Resume(a1);
}

void sub_10000A194(_Unwind_Exception *a1)
{
  sub_10000A474((void **)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_10000A1A8(_Unwind_Exception *a1)
{
  sub_10000A474((void **)(v1 - 112));
  _Unwind_Resume(a1);
}

void *sub_10000A1E4(uint64_t a1, unint64_t a2, long long *a3)
{
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t result = *(void **)a1;
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - (uint64_t)result) >> 3) < a2)
  {
    if (result)
    {
      *(void *)(a1 + 8) = result;
      operator delete(result);
      uint64_t v6 = 0;
      *(void *)a1 = 0;
      *(void *)(a1 + 8) = 0;
      *(void *)(a1 + 16) = 0;
    }
    if (a2 > 0xAAAAAAAAAAAAAAALL) {
      goto LABEL_26;
    }
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * (v6 >> 3);
    uint64_t v9 = 2 * v8;
    if (2 * v8 <= a2) {
      uint64_t v9 = a2;
    }
    unint64_t v10 = v8 >= 0x555555555555555 ? 0xAAAAAAAAAAAAAAALL : v9;
    if (v10 > 0xAAAAAAAAAAAAAAALL) {
LABEL_26:
    }
      sub_100007188();
    uint64_t v11 = 3 * v10;
    uint64_t result = operator new(24 * v10);
    *(void *)a1 = result;
    *(void *)(a1 + 8) = result;
    *(void *)(a1 + 16) = &result[v11];
    uint64_t v12 = 24 * a2;
    int v13 = &result[3 * a2];
    do
    {
      *(_OWORD *)uint64_t result = *a3;
      result[2] = *((void *)a3 + 2);
      result += 3;
      v12 -= 24;
    }
    while (v12);
    goto LABEL_25;
  }
  uint64_t v14 = *(void *)(a1 + 8);
  unint64_t v15 = (v14 - (uint64_t)result) / 24;
  if (v15 >= a2) {
    uint64_t v16 = a2;
  }
  else {
    uint64_t v16 = (v14 - (uint64_t)result) / 24;
  }
  if (v16)
  {
    uint64_t v17 = result;
    do
    {
      *(_OWORD *)uint64_t v17 = *a3;
      *((unsigned char *)v17 + 16) = *((unsigned char *)a3 + 16);
      v17 += 3;
      --v16;
    }
    while (v16);
  }
  if (a2 <= v15)
  {
    int v13 = &result[3 * a2];
LABEL_25:
    *(void *)(a1 + 8) = v13;
    return result;
  }
  uint64_t v18 = v14 + 24 * (a2 - v15);
  uint64_t v19 = 24 * a2 - 24 * v15;
  do
  {
    long long v20 = *a3;
    *(void *)(v14 + 16) = *((void *)a3 + 2);
    *(_OWORD *)uint64_t v14 = v20;
    v14 += 24;
    v19 -= 24;
  }
  while (v19);
  *(void *)(a1 + 8) = v18;
  return result;
}

void *sub_10000A380(void *a1)
{
  uint64_t v2 = (void *)a1[7];
  if (v2)
  {
    a1[8] = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)a1[4];
  if (v3)
  {
    a1[5] = v3;
    operator delete(v3);
  }
  return a1;
}

void sub_10000A3C4()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_complexity);
}

void sub_10000A408(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_10000A41C()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, __re_err_unknown);
}

void sub_10000A460(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void **sub_10000A474(void **a1)
{
  uint64_t v2 = (char *)*a1;
  if (*a1)
  {
    uint64_t v3 = (char *)a1[1];
    long long v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        unint64_t v5 = (void *)*((void *)v3 - 5);
        if (v5)
        {
          *((void *)v3 - 4) = v5;
          operator delete(v5);
        }
        uint64_t v6 = (void *)*((void *)v3 - 8);
        if (v6)
        {
          *((void *)v3 - 7) = v6;
          operator delete(v6);
        }
        v3 -= 96;
      }
      while (v3 != v2);
      long long v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

char *sub_10000A4F8(void **a1, uint64_t a2)
{
  unint64_t v3 = 0xAAAAAAAAAAAAAAABLL * (((unsigned char *)a1[1] - (unsigned char *)*a1) >> 5);
  unint64_t v4 = v3 + 1;
  if (v3 + 1 > 0x2AAAAAAAAAAAAAALL) {
    sub_100007188();
  }
  if (0x5555555555555556 * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 5) > v4) {
    unint64_t v4 = 0x5555555555555556 * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 5);
  }
  if (0xAAAAAAAAAAAAAAABLL * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 5) >= 0x155555555555555) {
    unint64_t v6 = 0x2AAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v6 = v4;
  }
  if (v6)
  {
    if (v6 > 0x2AAAAAAAAAAAAAALL) {
      sub_100006E74();
    }
    uint64_t v7 = (char *)operator new(96 * v6);
  }
  else
  {
    uint64_t v7 = 0;
  }
  long long v8 = *(_OWORD *)(a2 + 16);
  uint64_t v9 = &v7[96 * v3];
  *(_OWORD *)uint64_t v9 = *(_OWORD *)a2;
  *((_OWORD *)v9 + 1) = v8;
  unint64_t v10 = &v7[96 * v6];
  *((_OWORD *)v9 + 2) = *(_OWORD *)(a2 + 32);
  *((void *)v9 + 6) = *(void *)(a2 + 48);
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  *(void *)(v9 + 85) = *(void *)(a2 + 85);
  uint64_t v11 = *(void *)(a2 + 72);
  uint64_t v12 = *(void *)(a2 + 80);
  *((void *)v9 + 9) = 0;
  *((void *)v9 + 10) = v12;
  *(_OWORD *)(v9 + 56) = *(_OWORD *)(a2 + 56);
  *((void *)v9 + 9) = v11;
  *(void *)(a2 + 64) = 0;
  *(void *)(a2 + 72) = 0;
  *(void *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = 0;
  int v13 = v9 + 96;
  uint64_t v14 = (char *)*a1;
  unint64_t v15 = (char *)a1[1];
  if (v15 == *a1)
  {
    *a1 = v9;
    a1[1] = v13;
    a1[2] = v10;
  }
  else
  {
    uint64_t v16 = 0;
    do
    {
      uint64_t v17 = &v9[v16];
      uint64_t v18 = &v15[v16];
      long long v19 = *(_OWORD *)&v15[v16 - 80];
      *((_OWORD *)v17 - 6) = *(_OWORD *)&v15[v16 - 96];
      *((_OWORD *)v17 - 5) = v19;
      *((void *)v17 - 7) = 0;
      *((void *)v17 - 6) = 0;
      *((_OWORD *)v17 - 4) = *(_OWORD *)&v15[v16 - 64];
      *((void *)v17 - 6) = *(void *)&v15[v16 - 48];
      *((void *)v18 - 8) = 0;
      *((void *)v18 - 7) = 0;
      *((void *)v18 - 6) = 0;
      *((void *)v17 - 4) = 0;
      *((void *)v17 - 3) = 0;
      *(_OWORD *)(v17 - 40) = *(_OWORD *)&v15[v16 - 40];
      *((void *)v17 - 3) = *(void *)&v15[v16 - 24];
      *((void *)v18 - 5) = 0;
      *((void *)v18 - 4) = 0;
      *((void *)v18 - 3) = 0;
      uint64_t v20 = *(void *)&v15[v16 - 16];
      *(void *)(v17 - 11) = *(void *)&v15[v16 - 11];
      *((void *)v17 - 2) = v20;
      v16 -= 96;
    }
    while (&v15[v16] != v14);
    unint64_t v15 = (char *)*a1;
    unsigned int v21 = (char *)a1[1];
    *a1 = &v9[v16];
    a1[1] = v13;
    a1[2] = v10;
    while (v21 != v15)
    {
      long long v22 = (void *)*((void *)v21 - 5);
      if (v22)
      {
        *((void *)v21 - 4) = v22;
        operator delete(v22);
      }
      uint64_t v23 = (void *)*((void *)v21 - 8);
      if (v23)
      {
        *((void *)v21 - 7) = v23;
        operator delete(v23);
      }
      v21 -= 96;
    }
  }
  if (v15) {
    operator delete(v15);
  }
  return v13;
}

void sub_10000A6CC(void **a1, unint64_t a2, long long *a3)
{
  uint64_t v7 = (char *)a1[1];
  unint64_t v6 = a1[2];
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - v7) >> 3) >= a2)
  {
    if (a2)
    {
      int v13 = &v7[24 * a2];
      uint64_t v14 = 24 * a2;
      do
      {
        long long v15 = *a3;
        *((void *)v7 + 2) = *((void *)a3 + 2);
        *(_OWORD *)uint64_t v7 = v15;
        v7 += 24;
        v14 -= 24;
      }
      while (v14);
      uint64_t v7 = v13;
    }
    a1[1] = v7;
  }
  else
  {
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((v7 - (unsigned char *)*a1) >> 3);
    unint64_t v9 = v8 + a2;
    if (v8 + a2 > 0xAAAAAAAAAAAAAAALL) {
      sub_100007188();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((v6 - (unsigned char *)*a1) >> 3);
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0x555555555555555) {
      unint64_t v11 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v11 = v9;
    }
    if (v11)
    {
      if (v11 > 0xAAAAAAAAAAAAAAALL) {
        sub_100006E74();
      }
      uint64_t v12 = (char *)operator new(24 * v11);
    }
    else
    {
      uint64_t v12 = 0;
    }
    uint64_t v16 = &v12[24 * v8];
    uint64_t v17 = 24 * a2;
    uint64_t v18 = &v16[24 * a2];
    long long v19 = v16;
    do
    {
      long long v20 = *a3;
      *((void *)v19 + 2) = *((void *)a3 + 2);
      *(_OWORD *)long long v19 = v20;
      v19 += 24;
      v17 -= 24;
    }
    while (v17);
    unsigned int v21 = (char *)*a1;
    if (v7 != *a1)
    {
      do
      {
        long long v22 = *(_OWORD *)(v7 - 24);
        *((void *)v16 - 1) = *((void *)v7 - 1);
        *(_OWORD *)(v16 - 24) = v22;
        v16 -= 24;
        v7 -= 24;
      }
      while (v7 != v21);
      uint64_t v7 = (char *)*a1;
    }
    *a1 = v16;
    a1[1] = v18;
    a1[2] = &v12[24 * v11];
    if (v7)
    {
      operator delete(v7);
    }
  }
}

void sub_10000A880(char **a1, unint64_t a2)
{
  unint64_t v5 = a1[1];
  unint64_t v4 = a1[2];
  if (a2 <= (v4 - v5) >> 4)
  {
    if (a2)
    {
      uint64_t v12 = 16 * a2;
      bzero(a1[1], 16 * a2);
      v5 += v12;
    }
    a1[1] = v5;
  }
  else
  {
    unint64_t v6 = *a1;
    uint64_t v7 = (v5 - *a1) >> 4;
    unint64_t v8 = v7 + a2;
    if ((v7 + a2) >> 60) {
      sub_100007188();
    }
    uint64_t v9 = v4 - v6;
    if (v9 >> 3 > v8) {
      unint64_t v8 = v9 >> 3;
    }
    if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v10 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v10 = v8;
    }
    if (v10)
    {
      if (v10 >> 60) {
        sub_100006E74();
      }
      unint64_t v11 = (char *)operator new(16 * v10);
    }
    else
    {
      unint64_t v11 = 0;
    }
    int v13 = &v11[16 * v7];
    size_t v14 = 16 * a2;
    long long v15 = &v11[16 * v10];
    bzero(v13, v14);
    uint64_t v16 = &v13[v14];
    if (v5 != v6)
    {
      do
      {
        *((_OWORD *)v13 - 1) = *((_OWORD *)v5 - 1);
        v13 -= 16;
        v5 -= 16;
      }
      while (v5 != v6);
      unint64_t v5 = *a1;
    }
    *a1 = v13;
    a1[1] = v16;
    a1[2] = v15;
    if (v5)
    {
      operator delete(v5);
    }
  }
}

uint64_t sub_10000A9BC(uint64_t a1, long long *a2)
{
  long long v4 = *a2;
  long long v5 = a2[1];
  *(void *)(a1 + 32) = 0;
  *(_OWORD *)a1 = v4;
  *(_OWORD *)(a1 + 16) = v5;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  uint64_t v7 = (unsigned char *)*((void *)a2 + 4);
  unint64_t v6 = (unsigned char *)*((void *)a2 + 5);
  int64_t v8 = v6 - v7;
  if (v6 != v7)
  {
    if (0xAAAAAAAAAAAAAAABLL * (v8 >> 3) >= 0xAAAAAAAAAAAAAABLL) {
      sub_100007188();
    }
    uint64_t v9 = (char *)operator new(v8);
    *(void *)(a1 + 32) = v9;
    *(void *)(a1 + 40) = v9;
    *(void *)(a1 + 48) = &v9[8 * (v8 >> 3)];
    size_t v10 = 24 * ((v8 - 24) / 0x18uLL) + 24;
    memcpy(v9, v7, v10);
    *(void *)(a1 + 40) = &v9[v10];
  }
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  uint64_t v12 = (unsigned char *)*((void *)a2 + 7);
  unint64_t v11 = (unsigned char *)*((void *)a2 + 8);
  uint64_t v13 = v11 - v12;
  if (v11 != v12)
  {
    if (v13 < 0) {
      sub_100007188();
    }
    size_t v14 = (char *)operator new(v11 - v12);
    *(void *)(a1 + 56) = v14;
    *(void *)(a1 + 64) = v14;
    *(void *)(a1 + 72) = &v14[16 * (v13 >> 4)];
    memcpy(v14, v12, v13 & 0xFFFFFFFFFFFFFFF0);
    *(void *)(a1 + 64) = &v14[v13 & 0xFFFFFFFFFFFFFFF0];
  }
  uint64_t v15 = *((void *)a2 + 10);
  *(void *)(a1 + 85) = *(void *)((char *)a2 + 85);
  *(void *)(a1 + 80) = v15;
  return a1;
}

void sub_10000AB04(_Unwind_Exception *exception_object)
{
  long long v5 = *v3;
  if (*v3)
  {
    *(void *)(v1 + 64) = v5;
    operator delete(v5);
  }
  unint64_t v6 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 40) = v6;
    operator delete(v6);
  }
  _Unwind_Resume(exception_object);
}

unsigned __int8 *sub_10000AB38(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  if (a2 == a3 || *a2 != 92) {
    return a2;
  }
  long long v5 = a2 + 1;
  if (a2 + 1 == a3) {
    sub_10000B12C();
  }
  int v7 = *v5;
  uint64_t v8 = (v7 - 48);
  if (v7 == 48)
  {
    sub_10000BA9C(a1, v8);
    return a2 + 2;
  }
  if ((v7 - 49) > 8) {
    goto LABEL_18;
  }
  size_t v10 = a2 + 2;
  if (a2 + 2 == a3)
  {
    size_t v10 = a3;
  }
  else
  {
    while (1)
    {
      int v11 = *v10;
      if ((v11 - 48) > 9) {
        break;
      }
      if (v8 >= 0x19999999) {
        goto LABEL_23;
      }
      ++v10;
      LODWORD(v8) = v11 + 10 * v8 - 48;
      if (v10 == a3)
      {
        size_t v10 = a3;
        break;
      }
    }
    if (!v8) {
LABEL_23:
    }
      sub_10000BC48();
  }
  if (v8 > *(_DWORD *)(a1 + 28)) {
    goto LABEL_23;
  }
  sub_10000BCA0(a1, v8);
  if (v10 == v5)
  {
LABEL_18:
    size_t v10 = sub_10000B184(a1, a2 + 1, a3);
    if (v10 == v5)
    {
      uint64_t v12 = sub_10000B4A8(a1, a2 + 1, a3, 0);
      if (v12 == v5) {
        return a2;
      }
      else {
        return v12;
      }
    }
  }
  return v10;
}

char *sub_10000ACB4(uint64_t a1, char *a2, char *a3)
{
  if (a2 != a3 && *a2 == 91)
  {
    if (a2 + 1 == a3) {
      goto LABEL_20;
    }
    int v5 = a2[1];
    char v6 = v5 == 94;
    int v7 = v5 == 94 ? a2 + 2 : a2 + 1;
    uint64_t v8 = operator new(0xB0uLL);
    sub_10000CC60((uint64_t)v8, a1, *(void *)(*(void *)(a1 + 56) + 8), v6, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
    *(void *)(*(void *)(a1 + 56) + 8) = v8;
    *(void *)(a1 + 56) = v8;
    if (v7 == a3) {
      goto LABEL_20;
    }
    if ((*(_WORD *)(a1 + 24) & 0x1F0) != 0 && *v7 == 93)
    {
      sub_10000C7CC((uint64_t)v8, 93);
      ++v7;
    }
    if (v7 == a3) {
      goto LABEL_20;
    }
    do
    {
      uint64_t v9 = v7;
      int v7 = sub_10000E134(a1, v7, a3, (uint64_t)v8);
    }
    while (v7 != v9);
    if (v9 == a3) {
      goto LABEL_20;
    }
    if (*v9 == 45)
    {
      sub_10000C7CC((uint64_t)v8, 45);
      ++v9;
    }
    if (v9 == a3 || *v9 != 93) {
LABEL_20:
    }
      sub_10000E0DC();
    return v9 + 1;
  }
  return a2;
}

void sub_10000ADF4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_10000AE08()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_badrepeat);
}

void sub_10000AE4C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned char *sub_10000AE60(uint64_t a1, unsigned char *a2, unsigned char *a3)
{
  if (a2 == a3) {
    return a2;
  }
  switch(*a2)
  {
    case '$':
    case '(':
    case ')':
    case '*':
    case '+':
    case '.':
    case '?':
    case '[':
    case '\\':
    case ']':
    case '^':
    case '{':
    case '|':
    case '}':
      return a2;
    default:
      sub_10000BA9C(a1, (char)*a2);
      uint64_t result = a2 + 1;
      break;
  }
  return result;
}

void *sub_10000B044(void *a1)
{
  *a1 = &off_100030AF8;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_10000B0B0(void *__p)
{
  *std::string __p = &off_100030AF8;
  uint64_t v2 = __p[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  operator delete(__p);
}

void sub_10000B12C()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_escape);
}

void sub_10000B170(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned char *sub_10000B184(uint64_t a1, unsigned char *a2, unsigned char *a3)
{
  unint64_t v3 = a2;
  if (a2 != a3)
  {
    switch(*a2)
    {
      case 'D':
        int v5 = operator new(0xB0uLL);
        sub_10000CC60((uint64_t)v5, a1, *(void *)(*(void *)(a1 + 56) + 8), 1, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
        goto LABEL_7;
      case 'S':
        int v5 = operator new(0xB0uLL);
        sub_10000CC60((uint64_t)v5, a1, *(void *)(*(void *)(a1 + 56) + 8), 1, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
        goto LABEL_11;
      case 'W':
        char v6 = operator new(0xB0uLL);
        sub_10000CC60((uint64_t)v6, a1, *(void *)(*(void *)(a1 + 56) + 8), 1, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
        goto LABEL_9;
      case 'd':
        int v5 = operator new(0xB0uLL);
        sub_10000CC60((uint64_t)v5, a1, *(void *)(*(void *)(a1 + 56) + 8), 0, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
LABEL_7:
        *(void *)(*(void *)(a1 + 56) + 8) = v5;
        *(void *)(a1 + 56) = v5;
        int v7 = v5[40] | 0x400;
        goto LABEL_12;
      case 's':
        int v5 = operator new(0xB0uLL);
        sub_10000CC60((uint64_t)v5, a1, *(void *)(*(void *)(a1 + 56) + 8), 0, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
LABEL_11:
        *(void *)(*(void *)(a1 + 56) + 8) = v5;
        *(void *)(a1 + 56) = v5;
        int v7 = v5[40] | 0x4000;
LABEL_12:
        v5[40] = v7;
        goto LABEL_13;
      case 'w':
        char v6 = operator new(0xB0uLL);
        sub_10000CC60((uint64_t)v6, a1, *(void *)(*(void *)(a1 + 56) + 8), 0, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
LABEL_9:
        *(void *)(*(void *)(a1 + 56) + 8) = v6;
        *(void *)(a1 + 56) = v6;
        v6[40] |= 0x500u;
        sub_10000C7CC((uint64_t)v6, 95);
LABEL_13:
        ++v3;
        break;
      default:
        return v3;
    }
  }
  return v3;
}

void sub_10000B360(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_10000B374(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_10000B388(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_10000B39C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_10000B3B0(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_10000B3C4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_10000B4A8(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t *a4)
{
  long long v4 = a2;
  if (a2 == a3) {
    return v4;
  }
  uint64_t v5 = *a2;
  uint64_t v6 = (char)v5;
  switch((char)v5)
  {
    case '0':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 0;
        return v4 + 1;
      }
      else
      {
        sub_10000BA9C(a1, 0);
        return v4 + 1;
      }
    case 'c':
      if (v4 + 1 == a3 || ((v4[1] & 0xDF) - 65) > 0x19u) {
        goto LABEL_81;
      }
      uint64_t v8 = v4[1] & 0x1F;
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(unsigned char *)a4 = v8;
        *((unsigned char *)a4 + 1) = 0;
        return v4 + 2;
      }
      else
      {
        sub_10000BA9C(a1, v8);
        return v4 + 2;
      }
    case 'f':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 12;
        return v4 + 1;
      }
      else
      {
        sub_10000BA9C(a1, 12);
        return v4 + 1;
      }
    case 'n':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 10;
        return v4 + 1;
      }
      else
      {
        sub_10000BA9C(a1, 10);
        return v4 + 1;
      }
    case 'r':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 13;
        return v4 + 1;
      }
      else
      {
        sub_10000BA9C(a1, 13);
        return v4 + 1;
      }
    case 't':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 9;
        return v4 + 1;
      }
      else
      {
        sub_10000BA9C(a1, 9);
        return v4 + 1;
      }
    case 'u':
      if (v4 + 1 != a3)
      {
        int v9 = v4[1];
        if ((v9 & 0xF8) == 0x30 || (v9 & 0xFE) == 0x38 || (v9 | 0x20u) - 97 < 6)
        {
          v4 += 2;
          if (v4 != a3)
          {
            int v10 = *v4;
            if ((v10 & 0xF8) == 0x30 || (v10 & 0xFE) == 0x38 || (v10 | 0x20u) - 97 < 6) {
              goto LABEL_38;
            }
          }
        }
      }
      goto LABEL_81;
    case 'v':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 11;
        return v4 + 1;
      }
      else
      {
        uint64_t v6 = 11;
LABEL_65:
        sub_10000BA9C(a1, v6);
        return v4 + 1;
      }
    case 'x':
LABEL_38:
      if (v4 + 1 == a3) {
        goto LABEL_81;
      }
      unsigned __int8 v11 = v4[1];
      char v12 = -48;
      if ((v11 & 0xF8) == 0x30 || (v11 & 0xFE) == 0x38) {
        goto LABEL_43;
      }
      v11 |= 0x20u;
      if ((v11 - 97) >= 6u) {
        goto LABEL_81;
      }
      char v12 = -87;
LABEL_43:
      if (v4 + 2 == a3) {
        goto LABEL_81;
      }
      unsigned __int8 v13 = v4[2];
      char v14 = -48;
      if ((v13 & 0xF8) != 0x30 && (v13 & 0xFE) != 0x38)
      {
        v13 |= 0x20u;
        if ((v13 - 97) >= 6u) {
LABEL_81:
        }
          sub_10000B12C();
        char v14 = -87;
      }
      char v15 = v13 + 16 * (v11 + v12) + v14;
      if (!a4)
      {
        sub_10000BA9C(a1, v15);
        v4 += 3;
        return v4;
      }
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((unsigned char *)a4 + 23) = 1;
      }
      *(unsigned char *)a4 = v15;
      *((unsigned char *)a4 + 1) = 0;
      uint64_t result = v4 + 3;
      break;
    default:
      if (v6 == 95
        || (v6 & 0x80000000) == 0 && (*(_DWORD *)(*(void *)(*(void *)(a1 + 8) + 16) + 4 * v5) & 0x500) != 0)
      {
        goto LABEL_81;
      }
      if (!a4) {
        goto LABEL_65;
      }
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((unsigned char *)a4 + 23) = 1;
      }
      *(_WORD *)a4 = v5;
      return v4 + 1;
  }
  return result;
}

void *sub_10000BA9C(uint64_t a1, uint64_t a2)
{
  int v4 = *(_DWORD *)(a1 + 24);
  if (v4)
  {
    uint64_t v8 = (char *)operator new(0x30uLL);
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    *(void *)uint64_t v8 = off_100030C90;
    *((void *)v8 + 1) = v9;
    std::locale::locale((std::locale *)v8 + 2, (const std::locale *)a1);
    *(_OWORD *)(v8 + 24) = *(_OWORD *)(a1 + 8);
    uint64_t result = (void *)(*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 8) + 40))(*(void *)(a1 + 8), a2);
    v8[40] = (char)result;
LABEL_6:
    *(void *)(*(void *)(a1 + 56) + 8) = v8;
    goto LABEL_7;
  }
  if ((v4 & 8) != 0)
  {
    uint64_t v8 = (char *)operator new(0x30uLL);
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    *(void *)uint64_t v8 = off_100030CD8;
    *((void *)v8 + 1) = v10;
    uint64_t result = std::locale::locale((std::locale *)v8 + 2, (const std::locale *)a1);
    *(_OWORD *)(v8 + 24) = *(_OWORD *)(a1 + 8);
    v8[40] = a2;
    goto LABEL_6;
  }
  uint64_t result = operator new(0x18uLL);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(v6 + 8);
  *uint64_t result = &off_100030D20;
  result[1] = v7;
  *((unsigned char *)result + 16) = a2;
  *(void *)(v6 + 8) = result;
LABEL_7:
  *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
  return result;
}

void sub_10000BBE0(_Unwind_Exception *a1)
{
  std::locale::~locale(v2);
  void *v1 = &off_100030AF8;
  uint64_t v4 = v1[1];
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_10000BC48()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_backref);
}

void sub_10000BC8C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void *sub_10000BCA0(uint64_t a1, int a2)
{
  int v4 = *(_DWORD *)(a1 + 24);
  if (v4)
  {
    uint64_t v8 = (std::locale *)operator new(0x30uLL);
    uint64_t v9 = v8;
    v8[1].__locale_ = *(std::locale::__imp **)(*(void *)(a1 + 56) + 8);
    uint64_t v10 = off_100030D68;
LABEL_6:
    v8->__locale_ = (std::locale::__imp *)v10;
    uint64_t result = std::locale::locale(v8 + 2, (const std::locale *)a1);
    *(_OWORD *)&v9[3].__locale_ = *(_OWORD *)(a1 + 8);
    LODWORD(v9[5].__locale_) = a2;
    *(void *)(*(void *)(a1 + 56) + 8) = v9;
    goto LABEL_7;
  }
  if ((v4 & 8) != 0)
  {
    uint64_t v8 = (std::locale *)operator new(0x30uLL);
    uint64_t v9 = v8;
    v8[1].__locale_ = *(std::locale::__imp **)(*(void *)(a1 + 56) + 8);
    uint64_t v10 = off_100030DB0;
    goto LABEL_6;
  }
  uint64_t result = operator new(0x18uLL);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(v6 + 8);
  *uint64_t result = &off_100030DF8;
  result[1] = v7;
  *((_DWORD *)result + 4) = a2;
  *(void *)(v6 + 8) = result;
LABEL_7:
  *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
  return result;
}

std::locale *sub_10000BDA0(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_100030C90;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&off_100030AF8;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void sub_10000BE2C(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_100030C90;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&off_100030AF8;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  operator delete(a1);
}

uint64_t sub_10000BEC8(uint64_t result, uint64_t a2)
{
  unint64_t v3 = *(char **)(a2 + 16);
  if (v3 == *(char **)(a2 + 24)
    || (uint64_t v4 = result,
        uint64_t result = (*(uint64_t (**)(void, void))(**(void **)(result + 24) + 40))(*(void *)(result + 24), *v3), *(unsigned __int8 *)(v4 + 40) != result))
  {
    *(_DWORD *)a2 = -993;
    *(void *)(a2 + 80) = 0;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    ++*(void *)(a2 + 16);
    *(void *)(a2 + 80) = *(void *)(v4 + 8);
  }
  return result;
}

std::locale *sub_10000BF68(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_100030CD8;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&off_100030AF8;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void sub_10000BFF4(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_100030CD8;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&off_100030AF8;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  operator delete(a1);
}

uint64_t sub_10000C090(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 40))
  {
    *(_DWORD *)a2 = -993;
    *(void *)(a2 + 80) = 0;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(void *)(a2 + 16) = v2 + 1;
    *(void *)(a2 + 80) = *(void *)(result + 8);
  }
  return result;
}

void *sub_10000C0D8(void *a1)
{
  *a1 = &off_100030AF8;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_10000C144(void *__p)
{
  *std::string __p = &off_100030AF8;
  uint64_t v2 = __p[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  operator delete(__p);
}

uint64_t sub_10000C1C0(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 16))
  {
    *(_DWORD *)a2 = -993;
    *(void *)(a2 + 80) = 0;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(void *)(a2 + 16) = v2 + 1;
    *(void *)(a2 + 80) = *(void *)(result + 8);
  }
  return result;
}

std::locale *sub_10000C208(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_100030D68;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&off_100030AF8;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void sub_10000C294(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_100030D68;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&off_100030AF8;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  operator delete(a1);
}

uint64_t sub_10000C330(uint64_t result, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 32) + 24 * (*(_DWORD *)(result + 40) - 1);
  if (!*(unsigned char *)(v3 + 16)
    || (uint64_t v4 = *(void *)(v3 + 8) - *(void *)v3, v5 = *(void *)(a2 + 16), *(void *)(a2 + 24) - v5 < v4))
  {
LABEL_3:
    *(_DWORD *)a2 = -993;
    *(void *)(a2 + 80) = 0;
    return result;
  }
  uint64_t v6 = result;
  if (v4 >= 1)
  {
    uint64_t v7 = 0;
    while (1)
    {
      int v8 = (*(uint64_t (**)(void, void))(**(void **)(v6 + 24) + 40))(*(void *)(v6 + 24), *(char *)(*(void *)v3 + v7));
      uint64_t result = (*(uint64_t (**)(void, void))(**(void **)(v6 + 24) + 40))(*(void *)(v6 + 24), *(char *)(*(void *)(a2 + 16) + v7));
      if (v8 != result) {
        goto LABEL_3;
      }
      if (v4 == ++v7)
      {
        uint64_t v5 = *(void *)(a2 + 16);
        break;
      }
    }
  }
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 16) = v5 + v4;
  *(void *)(a2 + 80) = *(void *)(v6 + 8);
  return result;
}

std::locale *sub_10000C45C(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_100030DB0;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&off_100030AF8;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void sub_10000C4E8(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_100030DB0;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&off_100030AF8;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  operator delete(a1);
}

uint64_t sub_10000C584(uint64_t result, uint64_t a2)
{
  unsigned int v2 = *(_DWORD *)(result + 40) - 1;
  uint64_t v3 = *(void *)(a2 + 32);
  if (!*(unsigned char *)(v3 + 24 * v2 + 16)
    || (uint64_t v4 = (unsigned __int8 **)(v3 + 24 * v2),
        uint64_t v5 = *v4,
        uint64_t v6 = v4[1] - *v4,
        uint64_t v7 = *(void *)(a2 + 16),
        *(void *)(a2 + 24) - v7 < v6))
  {
LABEL_3:
    *(_DWORD *)a2 = -993;
    *(void *)(a2 + 80) = 0;
    return result;
  }
  if (v6 >= 1)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(unsigned __int8 **)(a2 + 16);
    do
    {
      int v11 = *v5++;
      int v10 = v11;
      int v12 = *v9++;
      if (v10 != v12) {
        goto LABEL_3;
      }
    }
    while (--v8);
  }
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 16) = v7 + v6;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void *sub_10000C614(void *a1)
{
  *a1 = &off_100030AF8;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_10000C680(void *__p)
{
  *std::string __p = &off_100030AF8;
  uint64_t v2 = __p[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  operator delete(__p);
}

unsigned int *sub_10000C6FC(unsigned int *result, uint64_t a2)
{
  unint64_t v2 = result[4];
  uint64_t v3 = *(void *)(a2 + 32);
  if (0xAAAAAAAAAAAAAAABLL * ((*(void *)(a2 + 40) - v3) >> 3) < v2) {
    sub_10000BC48();
  }
  unsigned int v5 = v2 - 1;
  if (*(unsigned char *)(v3 + 24 * v5 + 16)
    && (uint64_t v6 = result,
        uint64_t v7 = v3 + 24 * v5,
        uint64_t result = *(unsigned int **)v7,
        int64_t v8 = *(void *)(v7 + 8) - *(void *)v7,
        uint64_t v9 = *(void *)(a2 + 16),
        *(void *)(a2 + 24) - v9 >= v8)
    && (uint64_t result = (unsigned int *)memcmp(result, *(const void **)(a2 + 16), v8), !result))
  {
    *(_DWORD *)a2 = -994;
    *(void *)(a2 + 16) = v9 + v8;
    *(void *)(a2 + 80) = *((void *)v6 + 1);
  }
  else
  {
    *(_DWORD *)a2 = -993;
    *(void *)(a2 + 80) = 0;
  }
  return result;
}

void sub_10000C7CC(uint64_t a1, uint64_t a2)
{
  char v2 = a2;
  if (!*(unsigned char *)(a1 + 169))
  {
    uint64_t v6 = (void *)(a1 + 40);
    unsigned int v5 = *(unsigned char **)(a1 + 48);
    unint64_t v16 = *(void *)(a1 + 56);
    if (*(unsigned char *)(a1 + 170))
    {
      if ((unint64_t)v5 < v16) {
        goto LABEL_24;
      }
      uint64_t v17 = (unsigned char *)*v6;
      unint64_t v18 = (unint64_t)&v5[-*v6];
      unint64_t v19 = v18 + 1;
      if ((uint64_t)(v18 + 1) >= 0)
      {
        unint64_t v20 = v16 - (void)v17;
        if (2 * v20 > v19) {
          unint64_t v19 = 2 * v20;
        }
        if (v20 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v21 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v21 = v19;
        }
        if (v21)
        {
          int v12 = operator new(v21);
          unsigned __int8 v13 = &v12[v18];
          char v14 = &v12[v21];
          v12[v18] = v2;
          uint64_t v15 = (uint64_t)&v12[v18 + 1];
          if (v5 == v17) {
            goto LABEL_49;
          }
        }
        else
        {
          int v12 = 0;
          unsigned __int8 v13 = &v5[-*v6];
          char v14 = 0;
          *(unsigned char *)unint64_t v18 = a2;
          uint64_t v15 = v18 + 1;
          if (v5 == v17) {
            goto LABEL_49;
          }
        }
        if (v18 >= 8 && (unint64_t)(v17 - v12) >= 0x20)
        {
          if (v18 >= 0x20)
          {
            unint64_t v28 = v18 & 0xFFFFFFFFFFFFFFE0;
            uint64_t v38 = (long long *)(v5 - 16);
            uint64_t v39 = &v12[v5 - 16 - v17];
            unint64_t v40 = v18 & 0xFFFFFFFFFFFFFFE0;
            do
            {
              long long v41 = *v38;
              *(v39 - 1) = *(v38 - 1);
              *uint64_t v39 = v41;
              v39 -= 2;
              v38 -= 2;
              v40 -= 32;
            }
            while (v40);
            if (v18 == v28) {
              goto LABEL_86;
            }
            if ((v18 & 0x18) == 0)
            {
              v13 -= v28;
              v5 -= v28;
              goto LABEL_80;
            }
          }
          else
          {
            unint64_t v28 = 0;
          }
          v13 -= v18 & 0xFFFFFFFFFFFFFFF8;
          unsigned int v42 = &v5[-v28 - 8];
          uint64_t v43 = &v12[v42 - v17];
          unint64_t v44 = v28 - (v18 & 0xFFFFFFFFFFFFFFF8);
          do
          {
            uint64_t v45 = *(void *)v42;
            v42 -= 8;
            *v43-- = v45;
            v44 += 8;
          }
          while (v44);
          v5 -= v18 & 0xFFFFFFFFFFFFFFF8;
          if (v18 == (v18 & 0xFFFFFFFFFFFFFFF8)) {
            goto LABEL_86;
          }
        }
LABEL_80:
        long long v56 = v13 - 1;
        do
        {
          char v57 = *--v5;
          *v56-- = v57;
        }
        while (v5 != v17);
        goto LABEL_86;
      }
LABEL_89:
      sub_100007188();
    }
    if ((unint64_t)v5 < v16) {
      goto LABEL_24;
    }
    uint64_t v23 = (unsigned char *)*v6;
    unint64_t v24 = (unint64_t)&v5[-*v6];
    unint64_t v25 = v24 + 1;
    if ((uint64_t)(v24 + 1) < 0) {
      goto LABEL_89;
    }
    unint64_t v26 = v16 - (void)v23;
    if (2 * v26 > v25) {
      unint64_t v25 = 2 * v26;
    }
    if (v26 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v27 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v27 = v25;
    }
    if (v27)
    {
      int v12 = operator new(v27);
      unsigned __int8 v13 = &v12[v24];
      char v14 = &v12[v27];
      v12[v24] = v2;
      uint64_t v15 = (uint64_t)&v12[v24 + 1];
      if (v5 == v23)
      {
LABEL_49:
        *(void *)(a1 + 40) = v13;
        *(void *)(a1 + 48) = v15;
        *(void *)(a1 + 56) = v14;
        if (!v5) {
          goto LABEL_88;
        }
        goto LABEL_87;
      }
    }
    else
    {
      int v12 = 0;
      unsigned __int8 v13 = &v5[-*v6];
      char v14 = 0;
      *(unsigned char *)unint64_t v24 = a2;
      uint64_t v15 = v24 + 1;
      if (v5 == v23) {
        goto LABEL_49;
      }
    }
    if (v24 >= 8 && (unint64_t)(v23 - v12) >= 0x20)
    {
      if (v24 >= 0x20)
      {
        unint64_t v29 = v24 & 0xFFFFFFFFFFFFFFE0;
        xpc_object_t v46 = (long long *)(v5 - 16);
        long long v47 = &v12[v5 - 16 - v23];
        unint64_t v48 = v24 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          long long v49 = *v46;
          *(v47 - 1) = *(v46 - 1);
          *long long v47 = v49;
          v47 -= 2;
          v46 -= 2;
          v48 -= 32;
        }
        while (v48);
        if (v24 == v29) {
          goto LABEL_86;
        }
        if ((v24 & 0x18) == 0)
        {
          v13 -= v29;
          v5 -= v29;
          goto LABEL_84;
        }
      }
      else
      {
        unint64_t v29 = 0;
      }
      v13 -= v24 & 0xFFFFFFFFFFFFFFF8;
      uint64_t v50 = &v5[-v29 - 8];
      unint64_t v51 = &v12[v50 - v23];
      unint64_t v52 = v29 - (v24 & 0xFFFFFFFFFFFFFFF8);
      do
      {
        uint64_t v53 = *(void *)v50;
        v50 -= 8;
        *v51-- = v53;
        v52 += 8;
      }
      while (v52);
      v5 -= v24 & 0xFFFFFFFFFFFFFFF8;
      if (v24 == (v24 & 0xFFFFFFFFFFFFFFF8)) {
        goto LABEL_86;
      }
    }
LABEL_84:
    stat v58 = v13 - 1;
    do
    {
      char v59 = *--v5;
      *v58-- = v59;
    }
    while (v5 != v23);
    goto LABEL_86;
  }
  char v2 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), a2);
  unsigned int v5 = *(unsigned char **)(a1 + 48);
  unint64_t v4 = *(void *)(a1 + 56);
  if ((unint64_t)v5 < v4)
  {
LABEL_24:
    *unsigned int v5 = v2;
    uint64_t v15 = (uint64_t)(v5 + 1);
    goto LABEL_88;
  }
  uint64_t v6 = (void *)(a1 + 40);
  uint64_t v7 = *(unsigned char **)(a1 + 40);
  unint64_t v8 = v5 - v7;
  uint64_t v9 = v5 - v7 + 1;
  if (v9 < 0) {
    goto LABEL_89;
  }
  unint64_t v10 = v4 - (void)v7;
  if (2 * v10 > v9) {
    uint64_t v9 = 2 * v10;
  }
  if (v10 >= 0x3FFFFFFFFFFFFFFFLL) {
    size_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    size_t v11 = v9;
  }
  if (v11)
  {
    int v12 = operator new(v11);
    unsigned __int8 v13 = &v12[v8];
    char v14 = &v12[v11];
    v12[v8] = v2;
    uint64_t v15 = (uint64_t)&v12[v8 + 1];
    if (v5 == v7) {
      goto LABEL_49;
    }
  }
  else
  {
    int v12 = 0;
    unsigned __int8 v13 = (char *)(v5 - v7);
    char v14 = 0;
    *(unsigned char *)unint64_t v8 = v2;
    uint64_t v15 = v8 + 1;
    if (v5 == v7) {
      goto LABEL_49;
    }
  }
  if (v8 < 8 || (unint64_t)(v7 - v12) < 0x20) {
    goto LABEL_76;
  }
  if (v8 < 0x20)
  {
    unint64_t v22 = 0;
    goto LABEL_55;
  }
  unint64_t v22 = v8 & 0xFFFFFFFFFFFFFFE0;
  long long v30 = (long long *)(v5 - 16);
  uint64_t v31 = &v12[v5 - 16 - v7];
  unint64_t v32 = v8 & 0xFFFFFFFFFFFFFFE0;
  do
  {
    long long v33 = *v30;
    *(v31 - 1) = *(v30 - 1);
    *uint64_t v31 = v33;
    v31 -= 2;
    v30 -= 2;
    v32 -= 32;
  }
  while (v32);
  if (v8 != v22)
  {
    if ((v8 & 0x18) == 0)
    {
      v13 -= v22;
      v5 -= v22;
      goto LABEL_76;
    }
LABEL_55:
    v13 -= v8 & 0xFFFFFFFFFFFFFFF8;
    uint64_t v34 = &v5[-v22 - 8];
    long long v35 = &v12[v34 - v7];
    unint64_t v36 = v22 - (v8 & 0xFFFFFFFFFFFFFFF8);
    do
    {
      uint64_t v37 = *(void *)v34;
      v34 -= 8;
      *v35-- = v37;
      v36 += 8;
    }
    while (v36);
    v5 -= v8 & 0xFFFFFFFFFFFFFFF8;
    if (v8 == (v8 & 0xFFFFFFFFFFFFFFF8)) {
      goto LABEL_86;
    }
LABEL_76:
    xpc_object_t v54 = v13 - 1;
    do
    {
      char v55 = *--v5;
      *v54-- = v55;
    }
    while (v5 != v7);
  }
LABEL_86:
  unsigned int v5 = (unsigned char *)*v6;
  *(void *)(a1 + 40) = v12;
  *(void *)(a1 + 48) = v15;
  *(void *)(a1 + 56) = v14;
  if (v5) {
LABEL_87:
  }
    operator delete(v5);
LABEL_88:
  *(void *)(a1 + 48) = v15;
}

uint64_t sub_10000CC60(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5, char a6)
{
  *(void *)a1 = off_100030E40;
  *(void *)(a1 + 8) = a3;
  size_t v11 = (const std::locale *)(a1 + 16);
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(unsigned char *)(a1 + 168) = a4;
  *(unsigned char *)(a1 + 169) = a5;
  *(unsigned char *)(a1 + 170) = a6;
  std::locale::locale(&v16, v11);
  std::locale::name(&v17, &v16);
  std::string::size_type size = HIBYTE(v17.__r_.__value_.__r.__words[2]);
  if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = v17.__r_.__value_.__l.__size_;
  }
  if (size == 1)
  {
    unsigned __int8 v13 = (std::string *)v17.__r_.__value_.__r.__words[0];
    if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      unsigned __int8 v13 = &v17;
    }
    BOOL v14 = v13->__r_.__value_.__s.__data_[0] != 67;
    if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
      goto LABEL_9;
    }
  }
  else
  {
    BOOL v14 = 1;
    if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
LABEL_9:
    }
      operator delete(v17.__r_.__value_.__l.__data_);
  }
  std::locale::~locale(&v16);
  *(unsigned char *)(a1 + 171) = v14;
  return a1;
}

void sub_10000CDAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
  std::locale::~locale(&a9);
  sub_1000062A0((void **)(v9 + 136));
  uint64_t v15 = *(void **)(v9 + 112);
  if (v15)
  {
    *(void *)(v9 + 120) = v15;
    operator delete(v15);
    sub_10000CE70(v12);
    std::locale v16 = *(void **)(v9 + 64);
    if (!v16)
    {
LABEL_3:
      std::string v17 = *v13;
      if (!*v13) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  else
  {
    sub_10000CE70(v12);
    std::locale v16 = *(void **)(v9 + 64);
    if (!v16) {
      goto LABEL_3;
    }
  }
  *(void *)(v9 + 72) = v16;
  operator delete(v16);
  std::string v17 = *v13;
  if (!*v13)
  {
LABEL_4:
    std::locale::~locale(v11);
    *(void *)uint64_t v9 = v10;
    uint64_t v18 = *(void *)(v9 + 8);
    if (!v18) {
      goto LABEL_5;
    }
    goto LABEL_9;
  }
LABEL_8:
  *(void *)(v9 + 48) = v17;
  operator delete(v17);
  std::locale::~locale(v11);
  *(void *)uint64_t v9 = v10;
  uint64_t v18 = *(void *)(v9 + 8);
  if (!v18) {
LABEL_5:
  }
    _Unwind_Resume(a1);
LABEL_9:
  (*(void (**)(uint64_t))(*(void *)v18 + 8))(v18);
  _Unwind_Resume(a1);
}

void **sub_10000CE70(void **a1)
{
  char v2 = (void **)*a1;
  if (*a1)
  {
    uint64_t v3 = (void **)a1[1];
    unint64_t v4 = *a1;
    if (v3 == v2)
    {
LABEL_11:
      a1[1] = v2;
      operator delete(v4);
      return a1;
    }
    while (1)
    {
      if (*((char *)v3 - 1) < 0)
      {
        operator delete(*(v3 - 3));
        if (*((char *)v3 - 25) < 0) {
LABEL_9:
        }
          operator delete(*(v3 - 6));
      }
      else if (*((char *)v3 - 25) < 0)
      {
        goto LABEL_9;
      }
      v3 -= 6;
      if (v3 == v2)
      {
        unint64_t v4 = *a1;
        goto LABEL_11;
      }
    }
  }
  return a1;
}

void sub_10000CF04(std::locale *a1)
{
  uint64_t v1 = sub_10000DAE8(a1);
  operator delete(v1);
}

void sub_10000CF2C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  unint64_t v4 = *(char **)(a2 + 16);
  unsigned int v5 = *(char **)(a2 + 24);
  if (v4 == v5)
  {
    uint64_t v25 = 0;
    int v26 = *(unsigned __int8 *)(a1 + 168);
    goto LABEL_245;
  }
  if (!*(unsigned char *)(a1 + 171) || v4 + 1 == v5) {
    goto LABEL_34;
  }
  char v6 = *v4;
  LOBYTE(__src) = *v4;
  char v7 = v4[1];
  HIBYTE(__src) = v7;
  if (*(unsigned char *)(a1 + 169))
  {
    LOBYTE(__src) = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), v6);
    HIBYTE(__src) = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), v7);
  }
  uint64_t v8 = a1 + 16;
  sub_10000DC5C(&__src, a1 + 16, __p, (uint64_t)__p);
  if (SHIBYTE(__p[2]) < 0)
  {
    size_t v27 = __p[1];
    operator delete(__p[0]);
    if (v27) {
      goto LABEL_8;
    }
LABEL_34:
    int v26 = 0;
    uint64_t v25 = 1;
    unsigned __int8 v28 = **(unsigned char **)(v2 + 16);
    LOBYTE(__src) = v28;
    if (!*(unsigned char *)(a1 + 169)) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  if (!HIBYTE(__p[2])) {
    goto LABEL_34;
  }
LABEL_8:
  uint64_t v9 = *(void *)(a1 + 112);
  uint64_t v10 = *(void *)(a1 + 120) - v9;
  if (v10)
  {
    uint64_t v11 = v10 >> 1;
    if ((unint64_t)(v10 >> 1) <= 1) {
      uint64_t v11 = 1;
    }
    int v12 = (unsigned __int8 *)(v9 + 1);
    while (__src != *(v12 - 1) || HIBYTE(__src) != *v12)
    {
      v12 += 2;
      if (!--v11) {
        goto LABEL_17;
      }
    }
    goto LABEL_227;
  }
LABEL_17:
  if (!*(unsigned char *)(a1 + 170) || *(void *)(a1 + 88) == *(void *)(a1 + 96))
  {
    int v26 = 0;
    goto LABEL_167;
  }
  memset(v136, 170, sizeof(v136));
  __p[1] = (void *)0xAAAAAAAAAAAAAAAALL;
  __p[2] = (void *)0x2AAAAAAAAAAAAAALL;
  __p[0] = (void *)0xAAAAAAAAAA00AAAALL;
  LOWORD(__p[0]) = __src;
  (*(void (**)(void **__return_ptr))(**(void **)(a1 + 32) + 32))(v136);
  if (SHIBYTE(__p[2]) < 0) {
    operator delete(__p[0]);
  }
  uint64_t v14 = *(void *)(a1 + 88);
  char v15 = HIBYTE(v136[2]);
  uint64_t v16 = *(void *)(a1 + 96) - v14;
  if (!v16)
  {
    BOOL v24 = 0;
    int v70 = 0;
    int v69 = 0;
    goto LABEL_164;
  }
  uint64_t v128 = v2;
  uint64_t v17 = 0;
  unint64_t v18 = v16 / 48;
  if (SHIBYTE(v136[2]) >= 0) {
    unint64_t v19 = v136;
  }
  else {
    unint64_t v19 = (void **)v136[0];
  }
  char v20 = HIBYTE(v136[2]);
  if (SHIBYTE(v136[2]) >= 0) {
    size_t v21 = (void *)HIBYTE(v136[2]);
  }
  else {
    size_t v21 = v136[1];
  }
  if (v18 <= 1) {
    uint64_t v22 = 1;
  }
  else {
    uint64_t v22 = v16 / 48;
  }
  uint64_t v23 = (unsigned __int8 *)(v14 + 47);
  BOOL v24 = 1;
  do
  {
    int v59 = (char)*(v23 - 24);
    if (v59 >= 0) {
      xpc_object_t v60 = (char *)(v23 - 47);
    }
    else {
      xpc_object_t v60 = *(char **)(v23 - 47);
    }
    if (v59 >= 0) {
      size_t v61 = *(v23 - 24);
    }
    else {
      size_t v61 = *(void *)(v23 - 39);
    }
    if ((unint64_t)v21 >= v61) {
      size_t v62 = v61;
    }
    else {
      size_t v62 = (size_t)v21;
    }
    int v63 = memcmp(v60, v19, v62);
    if (v63)
    {
      if ((v63 & 0x80000000) == 0) {
        goto LABEL_98;
      }
    }
    else if (v61 > (unint64_t)v21)
    {
      goto LABEL_98;
    }
    int v64 = (char)*v23;
    if (v64 >= 0) {
      xpc_object_t v65 = (char *)(v23 - 23);
    }
    else {
      xpc_object_t v65 = *(char **)(v23 - 23);
    }
    if (v64 >= 0) {
      size_t v66 = *v23;
    }
    else {
      size_t v66 = *(void *)(v23 - 15);
    }
    if (v66 >= (unint64_t)v21) {
      size_t v67 = (size_t)v21;
    }
    else {
      size_t v67 = v66;
    }
    int v68 = memcmp(v19, v65, v67);
    if (v68)
    {
      if (v68 < 0)
      {
LABEL_123:
        int v69 = 1;
        int v70 = 5;
        goto LABEL_162;
      }
    }
    else if ((unint64_t)v21 <= v66)
    {
      goto LABEL_123;
    }
LABEL_98:
    BOOL v24 = ++v17 < v18;
    v23 += 48;
  }
  while (v22 != v17);
  int v70 = 0;
  int v69 = 0;
LABEL_162:
  uint64_t v2 = v128;
  uint64_t v8 = a1 + 16;
  char v15 = v20;
LABEL_164:
  if (v15 < 0) {
    operator delete(v136[0]);
  }
  int v26 = v69;
  if (v24) {
    goto LABEL_207;
  }
LABEL_167:
  if (*(void *)(a1 + 136) == *(void *)(a1 + 144)) {
    goto LABEL_209;
  }
  int v133 = v26;
  uint64_t v88 = v2;
  memset(__p, 170, sizeof(__p));
  sub_10000DF14(&__src, v8, __p, __p);
  uint64_t v89 = *(void *)(a1 + 136);
  int v90 = SHIBYTE(__p[2]);
  uint64_t v91 = *(void *)(a1 + 144) - v89;
  if (!v91) {
    goto LABEL_188;
  }
  unint64_t v92 = v91 / 24;
  xpc_object_t v93 = __p[1];
  if (SHIBYTE(__p[2]) >= 0) {
    xpc_object_t v94 = (void *)HIBYTE(__p[2]);
  }
  else {
    xpc_object_t v94 = __p[1];
  }
  if (SHIBYTE(__p[2]) < 0)
  {
    int v135 = SHIBYTE(__p[2]);
    uint64_t v103 = 0;
    xpc_object_t v104 = __p[0];
    if (v92 <= 1) {
      uint64_t v105 = 1;
    }
    else {
      uint64_t v105 = v91 / 24;
    }
    BOOL v97 = 1;
    do
    {
      xpc_object_t v106 = (void *)*(unsigned __int8 *)(v89 + 23);
      int v107 = (char)v106;
      if ((char)v106 < 0) {
        xpc_object_t v106 = *(void **)(v89 + 8);
      }
      if (v94 == v106)
      {
        xpc_object_t v108 = v107 >= 0 ? (const void *)v89 : *(const void **)v89;
        if (!memcmp(v104, v108, (size_t)v93))
        {
          int v133 = 1;
          int v70 = 5;
          goto LABEL_203;
        }
      }
      BOOL v97 = ++v103 < v92;
      v89 += 24;
    }
    while (v105 != v103);
    int v70 = 0;
LABEL_203:
    uint64_t v2 = v88;
    int v90 = v135;
    goto LABEL_204;
  }
  if (!HIBYTE(__p[2]))
  {
    uint64_t v114 = *(unsigned __int8 *)(v89 + 23);
    if ((v114 & 0x80u) != 0) {
      uint64_t v114 = *(void *)(v89 + 8);
    }
    if (v114 != HIBYTE(__p[2]))
    {
      unint64_t v119 = 0;
      if (v92 <= 1) {
        uint64_t v120 = 1;
      }
      else {
        uint64_t v120 = v92;
      }
      uint64_t v121 = v120 - 1;
      v122 = (void **)(v89 + 32);
      uint64_t v2 = v88;
      while (v121 != v119)
      {
        ++v119;
        v123 = (void *)*((unsigned __int8 *)v122 + 15);
        v125 = *v122;
        v122 += 3;
        v124 = v125;
        if ((char)v123 < 0) {
          v123 = v124;
        }
        if (v94 == v123)
        {
          BOOL v97 = v119 < v92;
          int v133 = 1;
          int v70 = 5;
          goto LABEL_204;
        }
      }
      BOOL v97 = 0;
      int v70 = 0;
      goto LABEL_204;
    }
    uint64_t v2 = v88;
    int v26 = 1;
LABEL_208:
    uint64_t v25 = 2;
    goto LABEL_245;
  }
  uint64_t v95 = 0;
  uint64_t v96 = v92 <= 1 ? 1 : v91 / 24;
  BOOL v97 = 1;
  do
  {
    v98 = (unsigned __int8 *)(v89 + 24 * v95);
    int v99 = (void *)v98[23];
    int v100 = (char)v99;
    if ((char)v99 < 0) {
      int v99 = (void *)*((void *)v98 + 1);
    }
    if (v94 == v99)
    {
      if (v100 < 0) {
        v98 = *(unsigned __int8 **)v98;
      }
      xpc_object_t v101 = __p;
      uint64_t v102 = HIBYTE(__p[2]);
      while (*(unsigned __int8 *)v101 == *v98)
      {
        xpc_object_t v101 = (void **)((char *)v101 + 1);
        ++v98;
        if (!--v102)
        {
          int v133 = 1;
          int v70 = 5;
          uint64_t v2 = v88;
          goto LABEL_204;
        }
      }
    }
    BOOL v97 = ++v95 < v92;
  }
  while (v95 != v96);
LABEL_188:
  BOOL v97 = 0;
  int v70 = 0;
  uint64_t v2 = v88;
LABEL_204:
  if (v90 < 0) {
    operator delete(__p[0]);
  }
  int v26 = v133;
  if (!v97)
  {
LABEL_209:
    if ((char)__src < 0)
    {
      int v112 = *(_DWORD *)(a1 + 164);
    }
    else
    {
      int v109 = *(_DWORD *)(a1 + 160);
      uint64_t v110 = *(void *)(*(void *)(a1 + 24) + 16);
      int v111 = *(_DWORD *)(v110 + 4 * __src);
      if (((v111 & v109) != 0 || __src == 95 && (v109 & 0x80) != 0)
        && (SHIBYTE(__src) & 0x80000000) == 0
        && ((*(_DWORD *)(v110 + 4 * HIBYTE(__src)) & v109) != 0 || (v109 & 0x80) != 0 && HIBYTE(__src) == 95))
      {
        goto LABEL_227;
      }
      int v112 = *(_DWORD *)(a1 + 164);
      if ((v112 & v111) != 0 || __src == 95 && (v112 & 0x80) != 0)
      {
LABEL_226:
        int v113 = v26;
LABEL_228:
        int v26 = v113;
        uint64_t v25 = 2;
        goto LABEL_245;
      }
    }
    if ((SHIBYTE(__src) & 0x80000000) == 0)
    {
      if ((*(_DWORD *)(*(void *)(*(void *)(a1 + 24) + 16) + 4 * HIBYTE(__src)) & v112) == 0)
      {
        int v113 = 1;
        if (HIBYTE(__src) != 95 || (v112 & 0x80) == 0) {
          goto LABEL_228;
        }
      }
      goto LABEL_226;
    }
LABEL_227:
    int v113 = 1;
    goto LABEL_228;
  }
LABEL_207:
  if (v70) {
    goto LABEL_208;
  }
  uint64_t v25 = 2;
  unsigned __int8 v28 = **(unsigned char **)(v2 + 16);
  LOBYTE(__src) = v28;
  if (*(unsigned char *)(a1 + 169))
  {
LABEL_35:
    unsigned __int8 v28 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), (char)v28);
    LOBYTE(__src) = v28;
  }
LABEL_36:
  unint64_t v29 = *(unsigned __int8 **)(a1 + 40);
  unint64_t v30 = *(void *)(a1 + 48) - (void)v29;
  if (v30)
  {
    if (v30 <= 1) {
      unint64_t v30 = 1;
    }
    while (1)
    {
      int v31 = *v29++;
      if (v31 == v28) {
        break;
      }
      if (!--v30) {
        goto LABEL_41;
      }
    }
LABEL_244:
    int v26 = 1;
    goto LABEL_245;
  }
LABEL_41:
  unsigned int v32 = *(_DWORD *)(a1 + 164);
  if (v32 || *(void *)(a1 + 64) != *(void *)(a1 + 72))
  {
    if ((v28 & 0x80) != 0 || (*(_DWORD *)(*(void *)(*(void *)(a1 + 24) + 16) + 4 * v28) & v32) == 0)
    {
      int v34 = (v32 >> 7) & 1;
      char v33 = v28 == 95 ? v34 : 0;
    }
    else
    {
      char v33 = 1;
    }
    long long v35 = *(void **)(a1 + 72);
    unint64_t v36 = memchr(*(void **)(a1 + 64), (char)v28, (size_t)v35 - *(void *)(a1 + 64));
    uint64_t v37 = v36 ? v36 : v35;
    if ((v33 & 1) == 0 && v37 == v35) {
      goto LABEL_244;
    }
  }
  uint64_t v38 = *(void *)(a1 + 88);
  uint64_t v39 = *(void *)(a1 + 96);
  if (v38 == v39) {
    goto LABEL_128;
  }
  memset(v136, 170, sizeof(v136));
  if (!*(unsigned char *)(a1 + 170))
  {
    unsigned int v40 = 1;
    HIBYTE(v136[2]) = 1;
    LOWORD(v136[0]) = v28;
    uint64_t v41 = v39 - v38;
    if (v41) {
      goto LABEL_59;
    }
LABEL_155:
    BOOL v48 = 0;
    if ((v40 & 0x80) != 0) {
      goto LABEL_126;
    }
    goto LABEL_127;
  }
  __p[1] = (void *)0xAAAAAAAAAAAAAAAALL;
  __p[2] = (void *)0x1AAAAAAAAAAAAAALL;
  __p[0] = (void *)0xAAAAAAAAAAAAAAAALL;
  LOWORD(__p[0]) = v28;
  (*(void (**)(void **__return_ptr))(**(void **)(a1 + 32) + 32))(v136);
  if (SHIBYTE(__p[2]) < 0) {
    operator delete(__p[0]);
  }
  uint64_t v38 = *(void *)(a1 + 88);
  unsigned int v40 = HIBYTE(v136[2]);
  uint64_t v41 = *(void *)(a1 + 96) - v38;
  if (!v41) {
    goto LABEL_155;
  }
LABEL_59:
  uint64_t v134 = v25;
  int v131 = v26;
  uint64_t v129 = v2;
  uint64_t v42 = 0;
  unint64_t v43 = v41 / 48;
  char v126 = v40;
  if ((v40 & 0x80u) == 0) {
    unint64_t v44 = v136;
  }
  else {
    unint64_t v44 = (void **)v136[0];
  }
  if ((v40 & 0x80u) == 0) {
    uint64_t v45 = (void *)v40;
  }
  else {
    uint64_t v45 = v136[1];
  }
  if (v43 <= 1) {
    uint64_t v46 = 1;
  }
  else {
    uint64_t v46 = v41 / 48;
  }
  long long v47 = (unsigned __int8 *)(v38 + 47);
  BOOL v48 = 1;
  while (2)
  {
    int v49 = (char)*(v47 - 24);
    if (v49 >= 0) {
      uint64_t v50 = (char *)(v47 - 47);
    }
    else {
      uint64_t v50 = *(char **)(v47 - 47);
    }
    if (v49 >= 0) {
      size_t v51 = *(v47 - 24);
    }
    else {
      size_t v51 = *(void *)(v47 - 39);
    }
    if ((unint64_t)v45 >= v51) {
      size_t v52 = v51;
    }
    else {
      size_t v52 = (size_t)v45;
    }
    int v53 = memcmp(v50, v44, v52);
    if (v53)
    {
      if (v53 < 0) {
        goto LABEL_84;
      }
    }
    else if (v51 <= (unint64_t)v45)
    {
LABEL_84:
      int v54 = (char)*v47;
      if (v54 >= 0) {
        char v55 = (char *)(v47 - 23);
      }
      else {
        char v55 = *(char **)(v47 - 23);
      }
      if (v54 >= 0) {
        size_t v56 = *v47;
      }
      else {
        size_t v56 = *(void *)(v47 - 15);
      }
      if (v56 >= (unint64_t)v45) {
        size_t v57 = (size_t)v45;
      }
      else {
        size_t v57 = v56;
      }
      int v58 = memcmp(v44, v55, v57);
      if (v58)
      {
        if (v58 < 0)
        {
LABEL_95:
          int v26 = 1;
          uint64_t v2 = v129;
          uint64_t v25 = v134;
          if ((v126 & 0x80) == 0) {
            goto LABEL_127;
          }
          goto LABEL_126;
        }
      }
      else if ((unint64_t)v45 <= v56)
      {
        goto LABEL_95;
      }
    }
    BOOL v48 = ++v42 < v43;
    v47 += 48;
    if (v46 != v42) {
      continue;
    }
    break;
  }
  uint64_t v2 = v129;
  int v26 = v131;
  uint64_t v25 = v134;
  if ((v126 & 0x80) == 0) {
    goto LABEL_127;
  }
LABEL_126:
  operator delete(v136[0]);
LABEL_127:
  if (v48) {
    goto LABEL_245;
  }
LABEL_128:
  if (*(void *)(a1 + 136) == *(void *)(a1 + 144))
  {
LABEL_239:
    if ((v28 & 0x80) != 0) {
      goto LABEL_245;
    }
    unsigned int v115 = *(_DWORD *)(a1 + 160);
    if ((*(_DWORD *)(*(void *)(*(void *)(a1 + 24) + 16) + 4 * v28) & v115) == 0)
    {
      int v116 = (v115 >> 7) & 1;
      if (v28 != 95) {
        int v116 = 0;
      }
      if (v116 != 1) {
        goto LABEL_245;
      }
    }
    goto LABEL_244;
  }
  memset(__p, 170, sizeof(__p));
  sub_10000DF14(&__src, a1 + 16, (unsigned char *)&__src + 1, __p);
  uint64_t v71 = *(void *)(a1 + 136);
  uint64_t v72 = HIBYTE(__p[2]);
  uint64_t v73 = *(void *)(a1 + 144) - v71;
  if (!v73)
  {
    if ((HIBYTE(__p[2]) & 0x80) != 0) {
      operator delete(__p[0]);
    }
LABEL_238:
    unsigned __int8 v28 = __src;
    goto LABEL_239;
  }
  int v132 = v26;
  uint64_t v130 = v2;
  unint64_t v74 = 0;
  unint64_t v75 = v73 / 24;
  v76 = __p[0];
  xpc_object_t v77 = __p[1];
  if (SHIBYTE(__p[2]) >= 0) {
    xpc_object_t v78 = (unsigned __int8 *)HIBYTE(__p[2]);
  }
  else {
    xpc_object_t v78 = (unsigned __int8 *)__p[1];
  }
  if (v75 <= 1) {
    uint64_t v79 = 1;
  }
  else {
    uint64_t v79 = v73 / 24;
  }
  BOOL v80 = 1;
  while (2)
  {
    xpc_object_t v81 = (unsigned __int8 **)(v71 + 24 * v74);
    xpc_object_t v82 = (unsigned __int8 *)*((unsigned __int8 *)v81 + 23);
    int v83 = (char)v82;
    if ((char)v82 < 0) {
      xpc_object_t v82 = v81[1];
    }
    if (v78 != v82)
    {
LABEL_149:
      if (++v74 == v79)
      {
        if ((v72 & 0x80) != 0) {
LABEL_236:
        }
          operator delete(__p[0]);
        uint64_t v2 = v130;
        int v26 = v132;
        goto LABEL_238;
      }
      goto LABEL_153;
    }
    if (v83 >= 0) {
      xpc_object_t v84 = (unsigned __int8 *)(v71 + 24 * v74);
    }
    else {
      xpc_object_t v84 = *v81;
    }
    if ((v72 & 0x80) == 0)
    {
      if (!v72)
      {
LABEL_157:
        uint64_t v2 = v130;
        int v26 = 1;
        if (!v80) {
          goto LABEL_238;
        }
        goto LABEL_245;
      }
      uint64_t v85 = 0;
      while (*((unsigned __int8 *)__p + v85) == v84[v85])
      {
        if (v72 == ++v85) {
          goto LABEL_157;
        }
      }
      goto LABEL_149;
    }
    BOOL v127 = v80;
    v86 = v76;
    v87 = v77;
    if (memcmp(v76, v84, (size_t)v77))
    {
      ++v74;
      xpc_object_t v77 = v87;
      v76 = v86;
      if (v74 == v79) {
        goto LABEL_236;
      }
LABEL_153:
      BOOL v80 = v74 < v75;
      continue;
    }
    break;
  }
  operator delete(__p[0]);
  uint64_t v2 = v130;
  int v26 = 1;
  if (!v127) {
    goto LABEL_238;
  }
LABEL_245:
  if (v26 == *(unsigned __int8 *)(a1 + 168))
  {
    uint64_t v117 = 0;
    int v118 = -993;
  }
  else
  {
    *(void *)(v2 + 16) += v25;
    uint64_t v117 = *(void *)(a1 + 8);
    int v118 = -995;
  }
  *(_DWORD *)uint64_t v2 = v118;
  *(void *)(v2 + 80) = v117;
}

void sub_10000DA6C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a23 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10000DA8C(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0)
  {
    operator delete(*(void **)(a1 + 24));
    if ((*(char *)(a1 + 23) & 0x80000000) == 0) {
      return a1;
    }
  }
  else if ((*(char *)(a1 + 23) & 0x80000000) == 0)
  {
    return a1;
  }
  operator delete(*(void **)a1);
  return a1;
}

std::locale *sub_10000DAE8(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_100030E40;
  locale = a1[17].__locale_;
  if (locale)
  {
    uint64_t v3 = a1[18].__locale_;
    unint64_t v4 = a1[17].__locale_;
    if (v3 != locale)
    {
      do
      {
        if (*((char *)v3 - 1) < 0) {
          operator delete(*((void **)v3 - 3));
        }
        uint64_t v3 = (std::locale::__imp *)((char *)v3 - 24);
      }
      while (v3 != locale);
      unint64_t v4 = a1[17].__locale_;
    }
    a1[18].__locale_ = locale;
    operator delete(v4);
  }
  unsigned int v5 = a1[14].__locale_;
  if (v5)
  {
    a1[15].__locale_ = v5;
    operator delete(v5);
  }
  char v6 = a1[11].__locale_;
  if (v6)
  {
    char v7 = a1[12].__locale_;
    uint64_t v8 = a1[11].__locale_;
    if (v7 == v6)
    {
LABEL_21:
      a1[12].__locale_ = v6;
      operator delete(v8);
      goto LABEL_22;
    }
    while (1)
    {
      if (*((char *)v7 - 1) < 0)
      {
        operator delete(*((void **)v7 - 3));
        if (*((char *)v7 - 25) < 0) {
LABEL_19:
        }
          operator delete(*((void **)v7 - 6));
      }
      else if (*((char *)v7 - 25) < 0)
      {
        goto LABEL_19;
      }
      char v7 = (std::locale::__imp *)((char *)v7 - 48);
      if (v7 == v6)
      {
        uint64_t v8 = a1[11].__locale_;
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v9 = a1[8].__locale_;
  if (v9)
  {
    a1[9].__locale_ = v9;
    operator delete(v9);
  }
  uint64_t v10 = a1[5].__locale_;
  if (v10)
  {
    a1[6].__locale_ = v10;
    operator delete(v10);
  }
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&off_100030AF8;
  uint64_t v11 = a1[1].__locale_;
  if (v11) {
    (*(void (**)(std::locale::__imp *))(*(void *)v11 + 8))(v11);
  }
  return a1;
}

void sub_10000DC5C(unsigned char *__src@<X1>, uint64_t a2@<X0>, unsigned char *a3@<X2>, uint64_t a4@<X8>)
{
  size_t v5 = a3 - __src;
  memset(__dst, 170, sizeof(__dst));
  if ((unint64_t)(a3 - __src) >= 0x7FFFFFFFFFFFFFF8) {
    sub_100006DCC();
  }
  if (v5 <= 0x16)
  {
    __dst[23] = (_BYTE)a3 - (_BYTE)__src;
    uint64_t v9 = __dst;
    if (__src == a3) {
      goto LABEL_9;
    }
LABEL_8:
    memcpy(v9, __src, v5);
    v9 += v5;
    goto LABEL_9;
  }
  uint64_t v10 = (v5 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v5 | 7) != 0x17) {
    uint64_t v10 = v5 | 7;
  }
  uint64_t v11 = v10 + 1;
  uint64_t v9 = operator new(v10 + 1);
  *(void *)&__dst[8] = v5;
  *(void *)&__dst[16] = v11 | 0x8000000000000000;
  *(void *)__dst = v9;
  if (__src != a3) {
    goto LABEL_8;
  }
LABEL_9:
  *uint64_t v9 = 0;
  *(void *)a4 = 0;
  *(void *)(a4 + 8) = 0;
  *(void *)(a4 + 16) = 0;
  if ((__dst[23] & 0x80000000) != 0)
  {
    int v12 = *(char **)__dst;
    if (!*(void *)&__dst[8]) {
      goto LABEL_18;
    }
  }
  else
  {
    if (!__dst[23]) {
      return;
    }
    int v12 = __dst;
  }
  std::__get_collation_name(&v19, v12);
  *(_OWORD *)a4 = *(_OWORD *)&v19.__r_.__value_.__l.__data_;
  unint64_t v13 = v19.__r_.__value_.__r.__words[2];
  *(void *)(a4 + 16) = *((void *)&v19.__r_.__value_.__l + 2);
  unint64_t v14 = HIBYTE(v13);
  if ((v14 & 0x80u) != 0) {
    unint64_t v14 = *(void *)(a4 + 8);
  }
  if (v14) {
    goto LABEL_16;
  }
  if ((__dst[23] & 0x80000000) != 0)
  {
    int v12 = *(char **)__dst;
    if (*(void *)&__dst[8] < 3uLL)
    {
LABEL_24:
      (*(void (**)(std::string *__return_ptr))(**(void **)(a2 + 16) + 32))(&v19);
      if (*(char *)(a4 + 23) < 0) {
        operator delete(*(void **)a4);
      }
      *(std::string *)a4 = v19;
      if (*(char *)(a4 + 23) < 0)
      {
        uint64_t v16 = *(void *)(a4 + 8);
        if (v16 == 1 || v16 == 12)
        {
          if (__dst != (unsigned char *)a4)
          {
            if (__dst[23] >= 0) {
              uint64_t v17 = __dst;
            }
            else {
              uint64_t v17 = *(unsigned char **)__dst;
            }
            if (__dst[23] >= 0) {
              size_t v18 = __dst[23];
            }
            else {
              size_t v18 = *(void *)&__dst[8];
            }
            sub_10000738C((void **)a4, v17, v18);
          }
        }
        else
        {
          **(unsigned char **)a4 = 0;
          *(void *)(a4 + 8) = 0;
        }
      }
      else
      {
        int v15 = *(unsigned __int8 *)(a4 + 23);
        if (v15 == 1 || v15 == 12)
        {
          if (__dst != (unsigned char *)a4)
          {
            if ((__dst[23] & 0x80000000) != 0)
            {
              sub_1000072C4((void *)a4, *(void **)__dst, *(size_t *)&__dst[8]);
            }
            else
            {
              *(_OWORD *)a4 = *(_OWORD *)__dst;
              *(void *)(a4 + 16) = *(void *)&__dst[16];
            }
          }
        }
        else
        {
          *(unsigned char *)a4 = 0;
          *(unsigned char *)(a4 + 23) = 0;
        }
      }
LABEL_16:
      if ((__dst[23] & 0x80000000) == 0) {
        return;
      }
      int v12 = *(char **)__dst;
    }
LABEL_18:
    operator delete(v12);
    return;
  }
  if (__dst[23] < 3u) {
    goto LABEL_24;
  }
}

void sub_10000DED0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (*(char *)(v17 + 23) < 0)
  {
    operator delete(*(void **)v17);
    if ((a17 & 0x80000000) == 0) {
LABEL_3:
    }
      _Unwind_Resume(exception_object);
  }
  else if ((a17 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_10000DF14(unsigned char *__src@<X1>, uint64_t a2@<X0>, unsigned char *a3@<X2>, void *a4@<X8>)
{
  size_t v5 = a3 - __src;
  memset(__dst, 170, sizeof(__dst));
  if ((unint64_t)(a3 - __src) >= 0x7FFFFFFFFFFFFFF8) {
    sub_100006DCC();
  }
  if (v5 <= 0x16)
  {
    HIBYTE(__dst[2]) = (_BYTE)a3 - (_BYTE)__src;
    uint64_t v9 = __dst;
    if (__src == a3) {
      goto LABEL_9;
    }
LABEL_8:
    memcpy(v9, __src, v5);
    uint64_t v9 = (void **)((char *)v9 + v5);
    goto LABEL_9;
  }
  uint64_t v10 = (v5 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v5 | 7) != 0x17) {
    uint64_t v10 = v5 | 7;
  }
  uint64_t v11 = v10 + 1;
  uint64_t v9 = (void **)operator new(v10 + 1);
  __dst[1] = (void *)v5;
  __dst[2] = (void *)(v11 | 0x8000000000000000);
  __dst[0] = v9;
  if (__src != a3) {
    goto LABEL_8;
  }
LABEL_9:
  *(unsigned char *)uint64_t v9 = 0;
  memset(a4, 170, 24);
  int v12 = (char *)HIBYTE(__dst[2]);
  if (SHIBYTE(__dst[2]) >= 0) {
    unint64_t v13 = __dst;
  }
  else {
    unint64_t v13 = (void **)__dst[0];
  }
  if (SHIBYTE(__dst[2]) < 0) {
    int v12 = (char *)__dst[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a2 + 16) + 32))(*(void *)(a2 + 16), v13, &v12[(void)v13]);
  uint64_t v14 = *((unsigned __int8 *)a4 + 23);
  int v15 = (char)v14;
  if ((v14 & 0x80u) != 0) {
    uint64_t v14 = a4[1];
  }
  if (v14 == 1)
  {
LABEL_25:
    if ((SHIBYTE(__dst[2]) & 0x80000000) == 0) {
      return;
    }
    goto LABEL_26;
  }
  if (v14 == 12)
  {
    if (v15 >= 0) {
      uint64_t v16 = a4;
    }
    else {
      uint64_t v16 = (unsigned char *)*a4;
    }
    v16[11] = v16[3];
    if (SHIBYTE(__dst[2]) < 0) {
      goto LABEL_26;
    }
    return;
  }
  if ((v15 & 0x80000000) == 0)
  {
    *(unsigned char *)a4 = 0;
    *((unsigned char *)a4 + 23) = 0;
    goto LABEL_25;
  }
  *(unsigned char *)*a4 = 0;
  a4[1] = 0;
  if (SHIBYTE(__dst[2]) < 0) {
LABEL_26:
  }
    operator delete(__dst[0]);
}

void sub_10000E0C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10000E0DC()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_brack);
}

void sub_10000E120(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

char *sub_10000E134(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  unint64_t v4 = a2;
  if (a2 == a3) {
    return v4;
  }
  int v5 = *a2;
  if (v5 == 93) {
    return v4;
  }
  char v6 = (char *)a4;
  int v9 = 0;
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v40 = 0;
  if (a2 + 1 == a3 || v5 != 91)
  {
LABEL_38:
    int v24 = *(_DWORD *)(a1 + 24) & 0x1F0;
    goto LABEL_33;
  }
  int v10 = a2[1];
  if (v10 != 46)
  {
    if (v10 != 58)
    {
      if (v10 == 61)
      {
        char v6 = sub_10000E6CC(a1, a2 + 2, a3, a4);
        char v11 = 0;
        if ((SHIBYTE(v40) & 0x80000000) == 0) {
          goto LABEL_64;
        }
        goto LABEL_63;
      }
      int v9 = 0;
      goto LABEL_38;
    }
    int v12 = a2 + 2;
    if (a3 - (v4 + 2) >= 2)
    {
      uint64_t v13 = 0;
      uint64_t v14 = (unsigned __int8 *)v4;
      if (v4[2] == 58) {
        goto LABEL_14;
      }
      do
      {
        do
        {
          if (a3 - v4 - 4 == v13) {
            goto LABEL_89;
          }
          uint64_t v14 = (unsigned __int8 *)&v4[++v13];
        }
        while (v4[v13 + 2] != 58);
LABEL_14:
        ;
      }
      while (v14[3] != 93);
      int v15 = &v4[v13 + 2];
      if (v15 != a3)
      {
        int v16 = sub_10001018C(a1, v12, v15, *(_DWORD *)(a1 + 24) & 1);
        if (!v16) {
          sub_100010134();
        }
        char v11 = 0;
        *((_DWORD *)v6 + 40) |= v16;
        char v6 = &v4[v13 + 4];
        if (SHIBYTE(v40) < 0) {
          goto LABEL_63;
        }
        goto LABEL_64;
      }
    }
LABEL_89:
    sub_10000E0DC();
  }
  uint64_t v17 = a2 + 2;
  if (a3 - (v4 + 2) < 2) {
    goto LABEL_89;
  }
  uint64_t v18 = a3 - v4 - 4;
  std::string v19 = v4 + 2;
  char v20 = v17 + 1;
  if (*v17 == 46) {
    goto LABEL_23;
  }
  do
  {
    do
    {
      if (!v18) {
        goto LABEL_89;
      }
      --v18;
      std::string v19 = v20;
      int v21 = *v20++;
    }
    while (v21 != 46);
LABEL_23:
    ;
  }
  while (*v20 != 93);
  if (v19 == a3) {
    goto LABEL_89;
  }
  sub_10000FC54(v17, a1, v19, (uint64_t)&v41);
  if (SHIBYTE(v40) < 0) {
    operator delete(__p[0]);
  }
  uint64_t v40 = v42;
  *(_OWORD *)std::string __p = v41;
  uint64_t v22 = (char *)HIBYTE(v42);
  int v9 = SHIBYTE(v42);
  uint64_t v23 = *((void *)&v41 + 1);
  if (v42 < 0) {
    uint64_t v22 = (char *)__p[1];
  }
  if ((unint64_t)(v22 - 1) >= 2) {
    sub_10000FBFC();
  }
  unint64_t v4 = v19 + 2;
  int v24 = *(_DWORD *)(a1 + 24) & 0x1F0;
  if (v42 >= 0) {
    uint64_t v23 = HIBYTE(v42);
  }
  if (v23)
  {
    unsigned __int8 v28 = v4;
    if (v4 == a3) {
      goto LABEL_41;
    }
    goto LABEL_40;
  }
LABEL_33:
  if ((v24 | 0x40) != 0x40)
  {
    LOBYTE(v25) = *v4;
LABEL_57:
    if (v9 < 0)
    {
      int v34 = __p[0];
      __p[1] = (void *)1;
      *(unsigned char *)__p[0] = v25;
      v34[1] = 0;
      unsigned __int8 v28 = v4 + 1;
      if (v4 + 1 == a3) {
        goto LABEL_41;
      }
    }
    else
    {
      HIBYTE(v40) = 1;
      LOWORD(__p[0]) = v25;
      unsigned __int8 v28 = v4 + 1;
      if (v4 + 1 == a3) {
        goto LABEL_41;
      }
    }
    goto LABEL_40;
  }
  int v25 = *v4;
  if (v25 != 92) {
    goto LABEL_57;
  }
  int v26 = v4 + 1;
  if (v24) {
    size_t v27 = sub_10000ED0C(a1, v26, a3, (uint64_t *)__p);
  }
  else {
    size_t v27 = (char *)sub_10000EA64(a1, (unsigned __int8 *)v26, (unsigned __int8 *)a3, (uint64_t)__p, (uint64_t)v6);
  }
  unsigned __int8 v28 = v27;
  if (v27 == a3)
  {
LABEL_41:
    if (SHIBYTE(v40) < 0)
    {
      if (!__p[1]) {
        goto LABEL_62;
      }
      if (__p[1] != (void *)1)
      {
        unint64_t v30 = (void **)__p[0];
LABEL_61:
        sub_10000F800((uint64_t)v6, *(char *)v30, *((char *)v30 + 1));
LABEL_62:
        char v11 = 1;
        unint64_t v4 = v28;
        if ((SHIBYTE(v40) & 0x80000000) == 0) {
          goto LABEL_64;
        }
        goto LABEL_63;
      }
      unint64_t v30 = (void **)__p[0];
    }
    else
    {
      if (!HIBYTE(v40)) {
        goto LABEL_62;
      }
      unint64_t v30 = __p;
      if (HIBYTE(v40) != 1) {
        goto LABEL_61;
      }
    }
    sub_10000C7CC((uint64_t)v6, *(char *)v30);
    goto LABEL_62;
  }
LABEL_40:
  int v29 = *v28;
  if (v29 == 93) {
    goto LABEL_41;
  }
  int v31 = v28 + 1;
  if (v28 + 1 == a3 || v29 != 45 || *v31 == 93) {
    goto LABEL_41;
  }
  long long v41 = 0uLL;
  int64_t v42 = 0;
  unint64_t v4 = v28 + 2;
  if (v28 + 2 == a3 || *v31 != 91 || *v4 != 46)
  {
    if ((v24 | 0x40) == 0x40)
    {
      LODWORD(v31) = *v31;
      if (v31 == 92)
      {
        if (v24) {
          unsigned int v32 = sub_10000ED0C(a1, v28 + 2, a3, (uint64_t *)&v41);
        }
        else {
          unsigned int v32 = (char *)sub_10000EA64(a1, (unsigned __int8 *)v28 + 2, (unsigned __int8 *)a3, (uint64_t)&v41, (uint64_t)v6);
        }
        goto LABEL_79;
      }
    }
    else
    {
      LOBYTE(v31) = *v31;
    }
    HIBYTE(v42) = 1;
    LOWORD(v41) = v31;
    goto LABEL_80;
  }
  unsigned int v32 = sub_10000E964(a1, v28 + 3, a3, (uint64_t)&v41);
LABEL_79:
  unint64_t v4 = v32;
LABEL_80:
  *(_OWORD *)uint64_t v37 = *(_OWORD *)__p;
  uint64_t v38 = v40;
  __p[1] = 0;
  uint64_t v40 = 0;
  __p[0] = 0;
  *(_OWORD *)long long v35 = v41;
  uint64_t v36 = v42;
  long long v41 = 0uLL;
  int64_t v42 = 0;
  sub_10000F270((uint64_t)v6, (char *)v37, (uint64_t)v35);
  if (SHIBYTE(v36) < 0)
  {
    operator delete(v35[0]);
    if ((SHIBYTE(v38) & 0x80000000) == 0)
    {
LABEL_82:
      if ((SHIBYTE(v42) & 0x80000000) == 0) {
        goto LABEL_83;
      }
LABEL_87:
      operator delete((void *)v41);
      char v11 = 1;
      if (SHIBYTE(v40) < 0) {
        goto LABEL_63;
      }
      goto LABEL_64;
    }
  }
  else if ((SHIBYTE(v38) & 0x80000000) == 0)
  {
    goto LABEL_82;
  }
  operator delete(v37[0]);
  if (SHIBYTE(v42) < 0) {
    goto LABEL_87;
  }
LABEL_83:
  char v11 = 1;
  if (SHIBYTE(v40) < 0) {
LABEL_63:
  }
    operator delete(__p[0]);
LABEL_64:
  if (v11) {
    return v4;
  }
  return v6;
}

void sub_10000E63C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (*(char *)(v28 - 49) < 0)
  {
    operator delete(*(void **)(v28 - 72));
    if (a28 < 0)
    {
LABEL_5:
      operator delete(__p);
      _Unwind_Resume(a1);
    }
  }
  else if (a28 < 0)
  {
    goto LABEL_5;
  }
  _Unwind_Resume(a1);
}

char *sub_10000E6CC(uint64_t a1, char *__src, char *a3, uint64_t a4)
{
  if (a3 - __src < 2 || a3 - 1 == __src) {
    goto LABEL_39;
  }
  uint64_t v7 = 0;
  uint64_t v8 = __src;
  if (*__src != 61) {
    goto LABEL_5;
  }
LABEL_4:
  if (v8[1] != 93)
  {
LABEL_5:
    while (a3 - __src - 2 != v7)
    {
      uint64_t v8 = &__src[++v7];
      if (__src[v7] == 61) {
        goto LABEL_4;
      }
    }
LABEL_39:
    sub_10000E0DC();
  }
  if (&__src[v7] == a3) {
    goto LABEL_39;
  }
  memset(v18, 170, sizeof(v18));
  sub_10000FC54(__src, a1, &__src[v7], (uint64_t)v18);
  if ((SHIBYTE(v18[2]) & 0x80000000) == 0)
  {
    int v9 = (char *)HIBYTE(v18[2]);
    if (HIBYTE(v18[2]))
    {
      memset(__p, 170, sizeof(__p));
      int v10 = v18;
      goto LABEL_14;
    }
LABEL_40:
    sub_10000FBFC();
  }
  int v9 = (char *)v18[1];
  if (!v18[1]) {
    goto LABEL_40;
  }
  memset(__p, 170, sizeof(__p));
  int v10 = (void **)v18[0];
LABEL_14:
  sub_10000FF0C(a1, (uint64_t)v10, &v9[(void)v10], (unsigned char **)__p);
  if (SHIBYTE(__p[2]) < 0)
  {
    if (__p[1])
    {
LABEL_16:
      unint64_t v11 = *(void *)(a4 + 144);
      if (v11 >= *(void *)(a4 + 152))
      {
        *(void *)(a4 + 144) = sub_100006F48((char **)(a4 + 136), (uint64_t)__p);
        if (SHIBYTE(__p[2]) < 0) {
          goto LABEL_37;
        }
      }
      else
      {
        if ((HIBYTE(__p[2]) & 0x80) != 0)
        {
          sub_100006EA8(*(unsigned char **)(a4 + 144), __p[0], (unint64_t)__p[1]);
        }
        else
        {
          long long v12 = *(_OWORD *)__p;
          *(void **)(v11 + 16) = __p[2];
          *(_OWORD *)unint64_t v11 = v12;
        }
        *(void *)(a4 + 144) = v11 + 24;
        *(void *)(a4 + 144) = v11 + 24;
        if (SHIBYTE(__p[2]) < 0) {
          goto LABEL_37;
        }
      }
      goto LABEL_33;
    }
  }
  else if (HIBYTE(__p[2]))
  {
    goto LABEL_16;
  }
  uint64_t v13 = (void *)HIBYTE(v18[2]);
  if (SHIBYTE(v18[2]) < 0) {
    uint64_t v13 = v18[1];
  }
  if (v13 == (void *)2)
  {
    int v15 = v18;
    if (SHIBYTE(v18[2]) < 0) {
      int v15 = (void **)v18[0];
    }
    sub_10000F800(a4, *(char *)v15, *((char *)v15 + 1));
  }
  else
  {
    if (v13 != (void *)1) {
      sub_10000FBFC();
    }
    uint64_t v14 = v18;
    if (SHIBYTE(v18[2]) < 0) {
      uint64_t v14 = (void **)v18[0];
    }
    sub_10000C7CC(a4, *(char *)v14);
  }
  if (SHIBYTE(__p[2]) < 0)
  {
LABEL_37:
    operator delete(__p[0]);
    if (SHIBYTE(v18[2]) < 0) {
      goto LABEL_38;
    }
    return &__src[v7 + 2];
  }
LABEL_33:
  if (SHIBYTE(v18[2]) < 0) {
LABEL_38:
  }
    operator delete(v18[0]);
  return &__src[v7 + 2];
}

void sub_10000E908(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  *(void *)(v20 + 144) = v21;
  if (a14 < 0)
  {
    operator delete(__p);
    if ((a20 & 0x80000000) == 0) {
LABEL_3:
    }
      _Unwind_Resume(exception_object);
  }
  else if ((a20 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a15);
  _Unwind_Resume(exception_object);
}

char *sub_10000E964(uint64_t a1, char *__src, char *a3, uint64_t a4)
{
  if (a3 - __src < 2 || a3 - 1 == __src) {
    goto LABEL_15;
  }
  uint64_t v6 = 0;
  uint64_t v7 = __src;
  if (*__src != 46) {
    goto LABEL_5;
  }
LABEL_4:
  if (v7[1] != 93)
  {
LABEL_5:
    while (a3 - __src - 2 != v6)
    {
      uint64_t v7 = &__src[++v6];
      if (__src[v6] == 46) {
        goto LABEL_4;
      }
    }
LABEL_15:
    sub_10000E0DC();
  }
  if (&__src[v6] == a3) {
    goto LABEL_15;
  }
  sub_10000FC54(__src, a1, &__src[v6], (uint64_t)&v11);
  if (*(char *)(a4 + 23) < 0) {
    operator delete(*(void **)a4);
  }
  *(_OWORD *)a4 = v11;
  unint64_t v8 = v12;
  *(void *)(a4 + 16) = v12;
  unint64_t v9 = HIBYTE(v8);
  if ((v9 & 0x80u) != 0) {
    unint64_t v9 = *(void *)(a4 + 8);
  }
  if (v9 - 1 >= 2) {
    sub_10000FBFC();
  }
  return &__src[v6 + 2];
}

unsigned __int8 *sub_10000EA64(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t a4, uint64_t a5)
{
  if (a2 == a3) {
    sub_10000B12C();
  }
  switch(*a2)
  {
    case 'D':
      *(_DWORD *)(a5 + 164) |= 0x400u;
      uint64_t result = a2 + 1;
      break;
    case 'E':
    case 'F':
    case 'G':
    case 'H':
    case 'I':
    case 'J':
    case 'K':
    case 'L':
    case 'M':
    case 'N':
    case 'O':
    case 'P':
    case 'Q':
    case 'R':
    case 'T':
    case 'U':
    case 'V':
    case 'X':
    case 'Y':
    case 'Z':
    case '[':
    case '\\':
    case ']':
    case '^':
    case '_':
    case 'a':
    case 'c':
    case 'e':
    case 'f':
    case 'g':
    case 'h':
    case 'i':
    case 'j':
    case 'k':
    case 'l':
    case 'm':
    case 'n':
    case 'o':
    case 'p':
    case 'q':
    case 'r':
    case 't':
    case 'u':
    case 'v':
      goto LABEL_8;
    case 'S':
      *(_DWORD *)(a5 + 164) |= 0x4000u;
      uint64_t result = a2 + 1;
      break;
    case 'W':
      *(_DWORD *)(a5 + 164) |= 0x500u;
      sub_1000102FC(a5, 95);
      uint64_t result = a2 + 1;
      break;
    case 'b':
      if (*(char *)(a4 + 23) < 0)
      {
        *(void *)(a4 + 8) = 1;
        a4 = *(void *)a4;
      }
      else
      {
        *(unsigned char *)(a4 + 23) = 1;
      }
      *(_WORD *)a4 = 8;
      uint64_t result = a2 + 1;
      break;
    case 'd':
      *(_DWORD *)(a5 + 160) |= 0x400u;
      uint64_t result = a2 + 1;
      break;
    case 's':
      *(_DWORD *)(a5 + 160) |= 0x4000u;
      uint64_t result = a2 + 1;
      break;
    case 'w':
      *(_DWORD *)(a5 + 160) |= 0x500u;
      sub_10000C7CC(a5, 95);
      uint64_t result = a2 + 1;
      break;
    default:
      if (*a2)
      {
LABEL_8:
        uint64_t result = sub_10000B4A8(a1, a2, a3, (uint64_t *)a4);
      }
      else
      {
        if (*(char *)(a4 + 23) < 0)
        {
          *(void *)(a4 + 8) = 1;
          a4 = *(void *)a4;
        }
        else
        {
          *(unsigned char *)(a4 + 23) = 1;
        }
        *(unsigned char *)a4 = 0;
        *(unsigned char *)(a4 + 1) = 0;
        uint64_t result = a2 + 1;
      }
      break;
  }
  return result;
}

char *sub_10000ED0C(uint64_t a1, char *a2, char *a3, uint64_t *a4)
{
  if (a2 == a3) {
LABEL_70:
  }
    sub_10000B12C();
  char v5 = *a2;
  switch(*a2)
  {
    case '""':
    case '/':
    case '\\':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(unsigned char *)a4 = v5;
        *((unsigned char *)a4 + 1) = 0;
        return a2 + 1;
      }
      else
      {
        sub_10000BA9C(a1, v5);
        return a2 + 1;
      }
    case 'a':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 7;
        return a2 + 1;
      }
      else
      {
        sub_10000BA9C(a1, 7);
        return a2 + 1;
      }
    case 'b':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 8;
        return a2 + 1;
      }
      else
      {
        sub_10000BA9C(a1, 8);
        return a2 + 1;
      }
    case 'f':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 12;
        return a2 + 1;
      }
      else
      {
        sub_10000BA9C(a1, 12);
        return a2 + 1;
      }
    case 'n':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 10;
        return a2 + 1;
      }
      else
      {
        sub_10000BA9C(a1, 10);
        return a2 + 1;
      }
    case 'r':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 13;
        return a2 + 1;
      }
      else
      {
        sub_10000BA9C(a1, 13);
        return a2 + 1;
      }
    case 't':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 9;
        return a2 + 1;
      }
      else
      {
        sub_10000BA9C(a1, 9);
        return a2 + 1;
      }
    case 'v':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 11;
        return a2 + 1;
      }
      else
      {
        sub_10000BA9C(a1, 11);
        return a2 + 1;
      }
    default:
      if ((v5 & 0xF8) != 0x30) {
        goto LABEL_70;
      }
      char v7 = *a2 - 48;
      unint64_t v8 = a2 + 1;
      if (a2 + 1 == a3)
      {
        unint64_t v8 = a3;
LABEL_42:
        if (a4) {
          goto LABEL_43;
        }
LABEL_69:
        sub_10000BA9C(a1, v7);
        return v8;
      }
      if ((*v8 & 0xF8) != 0x30) {
        goto LABEL_42;
      }
      char v7 = *v8 + 8 * v7 - 48;
      if (a2 + 2 == a3)
      {
        unint64_t v8 = a3;
        if (a4) {
          goto LABEL_43;
        }
        goto LABEL_69;
      }
      char v9 = a2[2];
      int v10 = v9 & 0xF8;
      char v11 = v9 + 8 * v7 - 48;
      if (v10 == 48) {
        unint64_t v8 = a2 + 3;
      }
      else {
        unint64_t v8 = a2 + 2;
      }
      if (v10 == 48) {
        char v7 = v11;
      }
      if (!a4) {
        goto LABEL_69;
      }
LABEL_43:
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((unsigned char *)a4 + 23) = 1;
      }
      *(unsigned char *)a4 = v7;
      *((unsigned char *)a4 + 1) = 0;
      return v8;
  }
}

void sub_10000F270(uint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v3 = a3;
  uint64_t v4 = (uint64_t)a2;
  if (!*(unsigned char *)(a1 + 170))
  {
    uint64_t v16 = a2[23];
    if (a2[23] < 0)
    {
      if (*((void *)a2 + 1) != 1) {
        goto LABEL_74;
      }
    }
    else if (v16 != 1)
    {
LABEL_74:
      sub_100010948();
    }
    if (*(char *)(a3 + 23) < 0)
    {
      if (*(void *)(a3 + 8) != 1) {
        goto LABEL_74;
      }
    }
    else if (*(unsigned char *)(a3 + 23) != 1)
    {
      goto LABEL_74;
    }
    if (!*(unsigned char *)(a1 + 169))
    {
LABEL_67:
      *(_OWORD *)std::string __p = *(_OWORD *)v4;
      uint64_t v49 = *(void *)(v4 + 16);
      *(void *)(v4 + 8) = 0;
      *(void *)(v4 + 16) = 0;
      *(void *)uint64_t v4 = 0;
      *(_OWORD *)uint64_t v50 = *(_OWORD *)v3;
      uint64_t v51 = *(void *)(v3 + 16);
      *(void *)(v3 + 8) = 0;
      *(void *)(v3 + 16) = 0;
      *(void *)uint64_t v3 = 0;
      unint64_t v39 = *(void *)(a1 + 96);
      if (v39 < *(void *)(a1 + 104))
      {
        long long v40 = *(_OWORD *)__p;
        *(void *)(v39 + 16) = v49;
        *(_OWORD *)unint64_t v39 = v40;
        __p[1] = 0;
        uint64_t v49 = 0;
        __p[0] = 0;
        uint64_t v41 = v51;
        *(_OWORD *)(v39 + 24) = *(_OWORD *)v50;
        *(void *)(v39 + 40) = v41;
        v50[1] = 0;
        uint64_t v51 = 0;
        v50[0] = 0;
        *(void *)(a1 + 96) = v39 + 48;
        if (SHIBYTE(v49) < 0) {
          goto LABEL_69;
        }
        return;
      }
      int64_t v42 = sub_1000109A0((void **)(a1 + 88), (uint64_t)__p);
      int v43 = SHIBYTE(v51);
      *(void *)(a1 + 96) = v42;
      if ((v43 & 0x80000000) == 0)
      {
        if (SHIBYTE(v49) < 0) {
          goto LABEL_69;
        }
        return;
      }
      operator delete(v50[0]);
      if ((SHIBYTE(v49) & 0x80000000) == 0) {
        return;
      }
LABEL_69:
      operator delete(__p[0]);
      return;
    }
    int v34 = a2;
    if ((v16 & 0x80) != 0) {
      int v34 = *(char **)a2;
    }
    char v35 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), *v34);
    if (*(char *)(v4 + 23) < 0)
    {
      **(unsigned char **)uint64_t v4 = v35;
      uint64_t v36 = (char *)v3;
      if ((*(char *)(v3 + 23) & 0x80000000) == 0) {
        goto LABEL_64;
      }
    }
    else
    {
      *(unsigned char *)uint64_t v4 = v35;
      uint64_t v36 = (char *)v3;
      if ((*(char *)(v3 + 23) & 0x80000000) == 0)
      {
LABEL_64:
        char v37 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), *v36);
        uint64_t v38 = (unsigned char *)v3;
        if (*(char *)(v3 + 23) < 0) {
          uint64_t v38 = *(unsigned char **)v3;
        }
        *uint64_t v38 = v37;
        goto LABEL_67;
      }
    }
    uint64_t v36 = *(char **)v3;
    goto LABEL_64;
  }
  if (*(unsigned char *)(a1 + 169))
  {
    for (unint64_t i = 0; ; ++i)
    {
      unint64_t v7 = *(unsigned __int8 *)(v4 + 23);
      if (*(char *)(v4 + 23) < 0)
      {
        if (i >= *(void *)(v4 + 8))
        {
LABEL_13:
          for (unint64_t j = 0; ; ++j)
          {
            unint64_t v12 = *(unsigned __int8 *)(v3 + 23);
            if (*(char *)(v3 + 23) < 0)
            {
              if (j >= *(void *)(v3 + 8)) {
                goto LABEL_44;
              }
            }
            else if (j >= v12)
            {
              goto LABEL_44;
            }
            uint64_t v13 = v3;
            if ((v12 & 0x80) != 0) {
              uint64_t v13 = *(void *)v3;
            }
            char v14 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), *(char *)(v13 + j));
            uint64_t v15 = v3;
            if (*(char *)(v3 + 23) < 0) {
              uint64_t v15 = *(void *)v3;
            }
            *(unsigned char *)(v15 + j) = v14;
          }
        }
      }
      else if (i >= v7)
      {
        goto LABEL_13;
      }
      uint64_t v8 = v4;
      if ((v7 & 0x80) != 0) {
        uint64_t v8 = *(void *)v4;
      }
      char v9 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), *(char *)(v8 + i));
      uint64_t v10 = v4;
      if (*(char *)(v4 + 23) < 0) {
        uint64_t v10 = *(void *)v4;
      }
      *(unsigned char *)(v10 + i) = v9;
    }
  }
  for (unint64_t k = 0; ; ++k)
  {
    unint64_t v19 = a2[23];
    if (a2[23] < 0) {
      break;
    }
    if (k >= v19) {
      goto LABEL_35;
    }
LABEL_33:
    uint64_t v18 = a2;
    if ((v19 & 0x80) != 0)
    {
      uint64_t v18 = *(char **)a2;
      uint64_t v20 = *(char **)a2;
    }
    else
    {
      uint64_t v20 = a2;
    }
    v20[k] = v18[k];
  }
  if (k < *((void *)a2 + 1)) {
    goto LABEL_33;
  }
LABEL_35:
  for (unint64_t m = 0; ; ++m)
  {
    unint64_t v23 = *(unsigned __int8 *)(a3 + 23);
    if (*(char *)(a3 + 23) < 0) {
      break;
    }
    if (m >= v23) {
      goto LABEL_44;
    }
LABEL_42:
    uint64_t v22 = a3;
    if ((v23 & 0x80) != 0)
    {
      uint64_t v22 = *(void *)a3;
      uint64_t v24 = *(void *)a3;
    }
    else
    {
      uint64_t v24 = a3;
    }
    *(unsigned char *)(v24 + m) = *(unsigned char *)(v22 + m);
  }
  if (m < *(void *)(a3 + 8)) {
    goto LABEL_42;
  }
LABEL_44:
  if (*(char *)(v4 + 23) < 0)
  {
    uint64_t v26 = v4;
    uint64_t v4 = *(void *)v4;
    uint64_t v25 = *(void *)(v26 + 8);
  }
  else
  {
    uint64_t v25 = *(unsigned __int8 *)(v4 + 23);
  }
  sub_100010790(a1 + 16, v4, (char *)(v4 + v25));
  if (*(char *)(v3 + 23) < 0)
  {
    uint64_t v28 = v3;
    uint64_t v3 = *(void *)v3;
    uint64_t v27 = *(void *)(v28 + 8);
  }
  else
  {
    uint64_t v27 = *(unsigned __int8 *)(v3 + 23);
  }
  sub_100010790(a1 + 16, v3, (char *)(v3 + v27));
  *(_OWORD *)std::string __p = *(_OWORD *)v46;
  uint64_t v49 = v47;
  *(_OWORD *)uint64_t v50 = *(_OWORD *)v44;
  uint64_t v51 = v45;
  unint64_t v29 = *(void *)(a1 + 96);
  if (v29 >= *(void *)(a1 + 104))
  {
    unsigned int v32 = sub_1000109A0((void **)(a1 + 88), (uint64_t)__p);
    int v33 = SHIBYTE(v51);
    *(void *)(a1 + 96) = v32;
    if (v33 < 0)
    {
      operator delete(v50[0]);
      if ((SHIBYTE(v49) & 0x80000000) == 0) {
        return;
      }
    }
    else if ((SHIBYTE(v49) & 0x80000000) == 0)
    {
      return;
    }
    goto LABEL_69;
  }
  long long v30 = *(_OWORD *)__p;
  *(void *)(v29 + 16) = v49;
  *(_OWORD *)unint64_t v29 = v30;
  __p[1] = 0;
  uint64_t v49 = 0;
  __p[0] = 0;
  uint64_t v31 = v51;
  *(_OWORD *)(v29 + 24) = *(_OWORD *)v50;
  *(void *)(v29 + 40) = v31;
  v50[1] = 0;
  uint64_t v51 = 0;
  v50[0] = 0;
  *(void *)(a1 + 96) = v29 + 48;
  if (SHIBYTE(v49) < 0) {
    goto LABEL_69;
  }
}

void sub_10000F7B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  sub_10000DA8C((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_10000F7C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(a1);
}

void sub_10000F800(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)(a1 + 169))
  {
    unsigned __int8 v5 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), a2);
    __int16 v6 = v5 | (unsigned __int16)((*(unsigned __int16 (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), a3) << 8);
    uint64_t v8 = *(char **)(a1 + 120);
    unint64_t v7 = *(void *)(a1 + 128);
    if ((unint64_t)v8 >= v7)
    {
      char v9 = (char **)(a1 + 112);
      uint64_t v10 = *(char **)(a1 + 112);
      uint64_t v11 = v8 - v10;
      if (v8 - v10 > -3)
      {
        uint64_t v12 = v11 >> 1;
        unint64_t v13 = v7 - (void)v10;
        if (v13 <= (v11 >> 1) + 1) {
          unint64_t v14 = v12 + 1;
        }
        else {
          unint64_t v14 = v13;
        }
        if (v13 >= 0x7FFFFFFFFFFFFFFELL) {
          uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v15 = v14;
        }
        if (!v15)
        {
          uint64_t v16 = 0;
          uint64_t v17 = (_WORD *)(2 * v12);
          uint64_t v18 = 0;
          *(_WORD *)(2 * v12) = v6;
          uint64_t v19 = 2 * v12 + 2;
          uint64_t v20 = (char *)(v8 - v10);
          if (v8 == v10) {
            goto LABEL_64;
          }
LABEL_30:
          unint64_t v30 = (unint64_t)(v20 - 2);
          if (v30 < 0x1E) {
            goto LABEL_71;
          }
          if (v8 - v16 - (v11 & 0xFFFFFFFFFFFFFFFELL) < 0x20) {
            goto LABEL_71;
          }
          uint64_t v31 = (v30 >> 1) + 1;
          unint64_t v32 = 2 * (v31 & 0xFFFFFFFFFFFFFFF0);
          int v33 = &v8[-v32];
          uint64_t v17 = (_WORD *)((char *)v17 - v32);
          int v34 = &v16[2 * v12 - 16];
          char v35 = v8 - 16;
          unint64_t v36 = v31 & 0xFFFFFFFFFFFFFFF0;
          do
          {
            long long v37 = *(_OWORD *)v35;
            *(v34 - 1) = *((_OWORD *)v35 - 1);
            *int v34 = v37;
            v34 -= 2;
            v35 -= 32;
            v36 -= 16;
          }
          while (v36);
          uint64_t v8 = v33;
          if (v31 != (v31 & 0xFFFFFFFFFFFFFFF0))
          {
LABEL_71:
            do
            {
              __int16 v38 = *((_WORD *)v8 - 1);
              v8 -= 2;
              *--uint64_t v17 = v38;
            }
            while (v8 != v10);
          }
LABEL_63:
          uint64_t v8 = *v9;
          goto LABEL_64;
        }
        if ((v15 & 0x8000000000000000) == 0)
        {
          uint64_t v16 = operator new(2 * v15);
          uint64_t v17 = &v16[2 * v12];
          uint64_t v18 = &v16[2 * v15];
          *uint64_t v17 = v6;
          uint64_t v19 = (uint64_t)(v17 + 1);
          uint64_t v20 = (char *)(v8 - v10);
          if (v8 == v10) {
            goto LABEL_64;
          }
          goto LABEL_30;
        }
LABEL_68:
        sub_100006E74();
      }
LABEL_67:
      sub_100007188();
    }
LABEL_28:
    *(_WORD *)uint64_t v8 = v6;
    uint64_t v19 = (uint64_t)(v8 + 2);
    goto LABEL_66;
  }
  char v9 = (char **)(a1 + 112);
  __int16 v6 = a2 | (unsigned __int16)((_WORD)a3 << 8);
  uint64_t v8 = *(char **)(a1 + 120);
  unint64_t v21 = *(void *)(a1 + 128);
  if (*(unsigned char *)(a1 + 170))
  {
    if ((unint64_t)v8 < v21) {
      goto LABEL_28;
    }
    uint64_t v22 = *v9;
    uint64_t v23 = v8 - *v9;
    if (v23 <= -3) {
      goto LABEL_67;
    }
    uint64_t v24 = v23 >> 1;
    unint64_t v25 = v21 - (void)v22;
    if (v25 <= (v23 >> 1) + 1) {
      unint64_t v26 = v24 + 1;
    }
    else {
      unint64_t v26 = v25;
    }
    if (v25 >= 0x7FFFFFFFFFFFFFFELL) {
      uint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v27 = v26;
    }
    if (v27)
    {
      if (v27 < 0) {
        goto LABEL_68;
      }
      uint64_t v28 = operator new(2 * v27);
      uint64_t v17 = &v28[2 * v24];
      uint64_t v18 = &v28[2 * v27];
      *uint64_t v17 = v6;
      uint64_t v19 = (uint64_t)(v17 + 1);
      unint64_t v29 = (char *)(v8 - v22);
      if (v8 == v22) {
        goto LABEL_64;
      }
    }
    else
    {
      uint64_t v28 = 0;
      uint64_t v17 = (_WORD *)(2 * v24);
      uint64_t v18 = 0;
      *(_WORD *)(2 * v24) = v6;
      uint64_t v19 = 2 * v24 + 2;
      unint64_t v29 = (char *)(v8 - v22);
      if (v8 == v22) {
        goto LABEL_64;
      }
    }
    unint64_t v47 = (unint64_t)(v29 - 2);
    if (v47 < 0x1E) {
      goto LABEL_72;
    }
    if ((unint64_t)(v8 - &v28[v23 & 0xFFFFFFFFFFFFFFFELL]) < 0x20) {
      goto LABEL_72;
    }
    uint64_t v48 = (v47 >> 1) + 1;
    unint64_t v49 = 2 * (v48 & 0xFFFFFFFFFFFFFFF0);
    uint64_t v50 = &v8[-v49];
    uint64_t v17 = (_WORD *)((char *)v17 - v49);
    uint64_t v51 = &v28[2 * v24 - 16];
    size_t v52 = v8 - 16;
    unint64_t v53 = v48 & 0xFFFFFFFFFFFFFFF0;
    do
    {
      long long v54 = *(_OWORD *)v52;
      *(v51 - 1) = *((_OWORD *)v52 - 1);
      *uint64_t v51 = v54;
      v51 -= 2;
      v52 -= 32;
      v53 -= 16;
    }
    while (v53);
    uint64_t v8 = v50;
    if (v48 != (v48 & 0xFFFFFFFFFFFFFFF0))
    {
LABEL_72:
      do
      {
        __int16 v55 = *((_WORD *)v8 - 1);
        v8 -= 2;
        *--uint64_t v17 = v55;
      }
      while (v8 != v22);
    }
    goto LABEL_63;
  }
  if ((unint64_t)v8 < v21) {
    goto LABEL_28;
  }
  unint64_t v39 = *v9;
  uint64_t v40 = v8 - *v9;
  if (v40 <= -3) {
    goto LABEL_67;
  }
  uint64_t v41 = v40 >> 1;
  unint64_t v42 = v21 - (void)v39;
  if (v42 <= (v40 >> 1) + 1) {
    unint64_t v43 = v41 + 1;
  }
  else {
    unint64_t v43 = v42;
  }
  if (v42 >= 0x7FFFFFFFFFFFFFFELL) {
    uint64_t v44 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v44 = v43;
  }
  if (!v44)
  {
    uint64_t v45 = 0;
    uint64_t v17 = (_WORD *)(2 * v41);
    uint64_t v18 = 0;
    *(_WORD *)(2 * v41) = v6;
    uint64_t v19 = 2 * v41 + 2;
    uint64_t v46 = (char *)(v8 - v39);
    if (v8 == v39) {
      goto LABEL_64;
    }
    goto LABEL_57;
  }
  if (v44 < 0) {
    goto LABEL_68;
  }
  uint64_t v45 = operator new(2 * v44);
  uint64_t v17 = &v45[2 * v41];
  uint64_t v18 = &v45[2 * v44];
  *uint64_t v17 = v6;
  uint64_t v19 = (uint64_t)(v17 + 1);
  uint64_t v46 = (char *)(v8 - v39);
  if (v8 != v39)
  {
LABEL_57:
    unint64_t v56 = (unint64_t)(v46 - 2);
    if (v56 < 0x1E) {
      goto LABEL_73;
    }
    if ((unint64_t)(v8 - &v45[v40 & 0xFFFFFFFFFFFFFFFELL]) < 0x20) {
      goto LABEL_73;
    }
    uint64_t v57 = (v56 >> 1) + 1;
    unint64_t v58 = 2 * (v57 & 0xFFFFFFFFFFFFFFF0);
    int v59 = &v8[-v58];
    uint64_t v17 = (_WORD *)((char *)v17 - v58);
    xpc_object_t v60 = &v45[2 * v41 - 16];
    size_t v61 = v8 - 16;
    unint64_t v62 = v57 & 0xFFFFFFFFFFFFFFF0;
    do
    {
      long long v63 = *(_OWORD *)v61;
      *(v60 - 1) = *((_OWORD *)v61 - 1);
      *xpc_object_t v60 = v63;
      v60 -= 2;
      v61 -= 32;
      v62 -= 16;
    }
    while (v62);
    uint64_t v8 = v59;
    if (v57 != (v57 & 0xFFFFFFFFFFFFFFF0))
    {
LABEL_73:
      do
      {
        __int16 v64 = *((_WORD *)v8 - 1);
        v8 -= 2;
        *--uint64_t v17 = v64;
      }
      while (v8 != v39);
    }
    goto LABEL_63;
  }
LABEL_64:
  *(void *)(a1 + 112) = v17;
  *(void *)(a1 + 120) = v19;
  *(void *)(a1 + 128) = v18;
  if (v8) {
    operator delete(v8);
  }
LABEL_66:
  *(void *)(a1 + 120) = v19;
}

void sub_10000FBFC()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_collate);
}

void sub_10000FC40(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_10000FC54(unsigned char *__src@<X1>, uint64_t a2@<X0>, unsigned char *a3@<X2>, uint64_t a4@<X8>)
{
  size_t v5 = a3 - __src;
  memset(__dst, 170, sizeof(__dst));
  if ((unint64_t)(a3 - __src) >= 0x7FFFFFFFFFFFFFF8) {
    sub_100006DCC();
  }
  if (v5 <= 0x16)
  {
    __dst[23] = (_BYTE)a3 - (_BYTE)__src;
    char v9 = __dst;
    if (__src == a3) {
      goto LABEL_9;
    }
LABEL_8:
    memcpy(v9, __src, v5);
    v9 += v5;
    goto LABEL_9;
  }
  uint64_t v10 = (v5 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v5 | 7) != 0x17) {
    uint64_t v10 = v5 | 7;
  }
  uint64_t v11 = v10 + 1;
  char v9 = operator new(v10 + 1);
  *(void *)&__dst[8] = v5;
  *(void *)&__dst[16] = v11 | 0x8000000000000000;
  *(void *)__dst = v9;
  if (__src != a3) {
    goto LABEL_8;
  }
LABEL_9:
  *char v9 = 0;
  *(void *)a4 = 0;
  *(void *)(a4 + 8) = 0;
  *(void *)(a4 + 16) = 0;
  if ((__dst[23] & 0x80000000) != 0)
  {
    uint64_t v12 = *(char **)__dst;
    if (!*(void *)&__dst[8]) {
      goto LABEL_18;
    }
  }
  else
  {
    if (!__dst[23]) {
      return;
    }
    uint64_t v12 = __dst;
  }
  std::__get_collation_name(&v19, v12);
  *(_OWORD *)a4 = *(_OWORD *)&v19.__r_.__value_.__l.__data_;
  unint64_t v13 = v19.__r_.__value_.__r.__words[2];
  *(void *)(a4 + 16) = *((void *)&v19.__r_.__value_.__l + 2);
  unint64_t v14 = HIBYTE(v13);
  if ((v14 & 0x80u) != 0) {
    unint64_t v14 = *(void *)(a4 + 8);
  }
  if (v14) {
    goto LABEL_16;
  }
  if ((__dst[23] & 0x80000000) != 0)
  {
    uint64_t v12 = *(char **)__dst;
    if (*(void *)&__dst[8] < 3uLL)
    {
LABEL_24:
      (*(void (**)(std::string *__return_ptr))(**(void **)(a2 + 16) + 32))(&v19);
      if (*(char *)(a4 + 23) < 0) {
        operator delete(*(void **)a4);
      }
      *(std::string *)a4 = v19;
      if (*(char *)(a4 + 23) < 0)
      {
        uint64_t v16 = *(void *)(a4 + 8);
        if (v16 == 1 || v16 == 12)
        {
          if (__dst != (unsigned char *)a4)
          {
            if (__dst[23] >= 0) {
              uint64_t v17 = __dst;
            }
            else {
              uint64_t v17 = *(unsigned char **)__dst;
            }
            if (__dst[23] >= 0) {
              size_t v18 = __dst[23];
            }
            else {
              size_t v18 = *(void *)&__dst[8];
            }
            sub_10000738C((void **)a4, v17, v18);
          }
        }
        else
        {
          **(unsigned char **)a4 = 0;
          *(void *)(a4 + 8) = 0;
        }
      }
      else
      {
        int v15 = *(unsigned __int8 *)(a4 + 23);
        if (v15 == 1 || v15 == 12)
        {
          if (__dst != (unsigned char *)a4)
          {
            if ((__dst[23] & 0x80000000) != 0)
            {
              sub_1000072C4((void *)a4, *(void **)__dst, *(size_t *)&__dst[8]);
            }
            else
            {
              *(_OWORD *)a4 = *(_OWORD *)__dst;
              *(void *)(a4 + 16) = *(void *)&__dst[16];
            }
          }
        }
        else
        {
          *(unsigned char *)a4 = 0;
          *(unsigned char *)(a4 + 23) = 0;
        }
      }
LABEL_16:
      if ((__dst[23] & 0x80000000) == 0) {
        return;
      }
      uint64_t v12 = *(char **)__dst;
    }
LABEL_18:
    operator delete(v12);
    return;
  }
  if (__dst[23] < 3u) {
    goto LABEL_24;
  }
}

void sub_10000FEC8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (*(char *)(v17 + 23) < 0)
  {
    operator delete(*(void **)v17);
    if ((a17 & 0x80000000) == 0) {
LABEL_3:
    }
      _Unwind_Resume(exception_object);
  }
  else if ((a17 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_10000FF0C(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, unsigned char **a4@<X8>)
{
  unint64_t v5 = (unint64_t)&a3[-a2];
  memset(__p, 170, sizeof(__p));
  if ((unint64_t)&a3[-a2] >= 0x7FFFFFFFFFFFFFF8) {
    sub_100006DCC();
  }
  if (v5 > 0x16)
  {
    uint64_t v16 = (v5 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v5 | 7) != 0x17) {
      uint64_t v16 = v5 | 7;
    }
    uint64_t v17 = v16 + 1;
    char v9 = operator new(v16 + 1);
    __p[1] = (void *)v5;
    __p[2] = (void *)(v17 | 0x8000000000000000);
    __p[0] = v9;
    if ((char *)a2 != a3) {
      goto LABEL_4;
    }
LABEL_13:
    uint64_t v10 = v9;
    goto LABEL_16;
  }
  HIBYTE(__p[2]) = (_BYTE)a3 - a2;
  char v9 = __p;
  if ((char *)a2 == a3) {
    goto LABEL_13;
  }
LABEL_4:
  if (v5 < 0x20 || (unint64_t)v9 - a2 < 0x20)
  {
    uint64_t v10 = v9;
    uint64_t v11 = (char *)a2;
  }
  else
  {
    uint64_t v10 = (char *)v9 + (v5 & 0xFFFFFFFFFFFFFFE0);
    uint64_t v11 = (char *)(a2 + (v5 & 0xFFFFFFFFFFFFFFE0));
    uint64_t v12 = (long long *)(a2 + 16);
    unint64_t v13 = v9 + 1;
    unint64_t v14 = v5 & 0xFFFFFFFFFFFFFFE0;
    do
    {
      long long v15 = *v12;
      *(v13 - 1) = *(v12 - 1);
      _OWORD *v13 = v15;
      v12 += 2;
      v13 += 2;
      v14 -= 32;
    }
    while (v14);
    if (v5 == (v5 & 0xFFFFFFFFFFFFFFE0)) {
      goto LABEL_16;
    }
  }
  do
  {
    char v18 = *v11++;
    *v10++ = v18;
  }
  while (v11 != a3);
LABEL_16:
  unsigned char *v10 = 0;
  memset(a4, 170, 24);
  std::string v19 = (char *)HIBYTE(__p[2]);
  if (SHIBYTE(__p[2]) >= 0) {
    uint64_t v20 = __p;
  }
  else {
    uint64_t v20 = (void **)__p[0];
  }
  if (SHIBYTE(__p[2]) < 0) {
    std::string v19 = (char *)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a1 + 16) + 32))(*(void *)(a1 + 16), v20, &v19[(void)v20]);
  unint64_t v21 = (unsigned char *)*((unsigned __int8 *)a4 + 23);
  int v22 = (char)v21;
  if ((char)v21 < 0) {
    unint64_t v21 = a4[1];
  }
  if (v21 == (unsigned char *)1) {
    goto LABEL_32;
  }
  if (v21 != (unsigned char *)12)
  {
    if (v22 < 0)
    {
      **a4 = 0;
      a4[1] = 0;
      if ((SHIBYTE(__p[2]) & 0x80000000) == 0) {
        return;
      }
LABEL_35:
      operator delete(__p[0]);
      return;
    }
    *(unsigned char *)a4 = 0;
    *((unsigned char *)a4 + 23) = 0;
LABEL_32:
    if ((SHIBYTE(__p[2]) & 0x80000000) == 0) {
      return;
    }
    goto LABEL_35;
  }
  if (v22 >= 0) {
    uint64_t v23 = a4;
  }
  else {
    uint64_t v23 = *a4;
  }
  v23[11] = v23[3];
  if (SHIBYTE(__p[2]) < 0) {
    goto LABEL_35;
  }
}

void sub_100010118(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100010134()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_ctype);
}

void sub_100010178(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10001018C(uint64_t a1, unsigned char *__src, unsigned char *a3, BOOL a4)
{
  size_t v4 = a3 - __src;
  memset(__dst, 170, sizeof(__dst));
  if ((unint64_t)(a3 - __src) >= 0x7FFFFFFFFFFFFFF8) {
    sub_100006DCC();
  }
  if (v4 <= 0x16)
  {
    HIBYTE(__dst[2]) = (_BYTE)a3 - (_BYTE)__src;
    char v9 = __dst;
    if (__src == a3) {
      goto LABEL_9;
    }
LABEL_8:
    memcpy(v9, __src, v4);
    char v9 = (void **)((char *)v9 + v4);
    goto LABEL_9;
  }
  uint64_t v10 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v4 | 7) != 0x17) {
    uint64_t v10 = v4 | 7;
  }
  uint64_t v11 = v10 + 1;
  char v9 = (void **)operator new(v10 + 1);
  __dst[1] = (void *)v4;
  __dst[2] = (void *)(v11 | 0x8000000000000000);
  __dst[0] = v9;
  if (__src != a3) {
    goto LABEL_8;
  }
LABEL_9:
  *(unsigned char *)char v9 = 0;
  uint64_t v12 = (char *)HIBYTE(__dst[2]);
  if (SHIBYTE(__dst[2]) >= 0) {
    unint64_t v13 = __dst;
  }
  else {
    unint64_t v13 = (void **)__dst[0];
  }
  if (SHIBYTE(__dst[2]) < 0) {
    uint64_t v12 = (char *)__dst[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a1 + 8) + 48))(*(void *)(a1 + 8), v13, &v12[(void)v13]);
  if (SHIBYTE(__dst[2]) >= 0) {
    unint64_t v14 = (const char *)__dst;
  }
  else {
    unint64_t v14 = (const char *)__dst[0];
  }
  uint64_t classname = std::__get_classname(v14, a4);
  if (SHIBYTE(__dst[2]) < 0) {
    operator delete(__dst[0]);
  }
  return classname;
}

void sub_1000102E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000102FC(uint64_t a1, uint64_t a2)
{
  char v2 = a2;
  if (!*(unsigned char *)(a1 + 169))
  {
    __int16 v6 = (void *)(a1 + 64);
    unint64_t v5 = *(unsigned char **)(a1 + 72);
    unint64_t v16 = *(void *)(a1 + 80);
    if (*(unsigned char *)(a1 + 170))
    {
      if ((unint64_t)v5 < v16) {
        goto LABEL_24;
      }
      uint64_t v17 = (unsigned char *)*v6;
      unint64_t v18 = (unint64_t)&v5[-*v6];
      unint64_t v19 = v18 + 1;
      if ((uint64_t)(v18 + 1) >= 0)
      {
        unint64_t v20 = v16 - (void)v17;
        if (2 * v20 > v19) {
          unint64_t v19 = 2 * v20;
        }
        if (v20 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v21 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v21 = v19;
        }
        if (v21)
        {
          uint64_t v12 = operator new(v21);
          unint64_t v13 = &v12[v18];
          unint64_t v14 = &v12[v21];
          v12[v18] = v2;
          uint64_t v15 = (uint64_t)&v12[v18 + 1];
          if (v5 == v17) {
            goto LABEL_49;
          }
        }
        else
        {
          uint64_t v12 = 0;
          unint64_t v13 = &v5[-*v6];
          unint64_t v14 = 0;
          *(unsigned char *)unint64_t v18 = a2;
          uint64_t v15 = v18 + 1;
          if (v5 == v17) {
            goto LABEL_49;
          }
        }
        if (v18 >= 8 && (unint64_t)(v17 - v12) >= 0x20)
        {
          if (v18 >= 0x20)
          {
            unint64_t v28 = v18 & 0xFFFFFFFFFFFFFFE0;
            __int16 v38 = (long long *)(v5 - 16);
            unint64_t v39 = &v12[v5 - 16 - v17];
            unint64_t v40 = v18 & 0xFFFFFFFFFFFFFFE0;
            do
            {
              long long v41 = *v38;
              *(v39 - 1) = *(v38 - 1);
              *unint64_t v39 = v41;
              v39 -= 2;
              v38 -= 2;
              v40 -= 32;
            }
            while (v40);
            if (v18 == v28) {
              goto LABEL_86;
            }
            if ((v18 & 0x18) == 0)
            {
              v13 -= v28;
              v5 -= v28;
              goto LABEL_80;
            }
          }
          else
          {
            unint64_t v28 = 0;
          }
          v13 -= v18 & 0xFFFFFFFFFFFFFFF8;
          unint64_t v42 = &v5[-v28 - 8];
          unint64_t v43 = &v12[v42 - v17];
          unint64_t v44 = v28 - (v18 & 0xFFFFFFFFFFFFFFF8);
          do
          {
            uint64_t v45 = *(void *)v42;
            v42 -= 8;
            *v43-- = v45;
            v44 += 8;
          }
          while (v44);
          v5 -= v18 & 0xFFFFFFFFFFFFFFF8;
          if (v18 == (v18 & 0xFFFFFFFFFFFFFFF8)) {
            goto LABEL_86;
          }
        }
LABEL_80:
        unint64_t v56 = v13 - 1;
        do
        {
          char v57 = *--v5;
          *v56-- = v57;
        }
        while (v5 != v17);
        goto LABEL_86;
      }
LABEL_89:
      sub_100007188();
    }
    if ((unint64_t)v5 < v16) {
      goto LABEL_24;
    }
    uint64_t v23 = (unsigned char *)*v6;
    unint64_t v24 = (unint64_t)&v5[-*v6];
    unint64_t v25 = v24 + 1;
    if ((uint64_t)(v24 + 1) < 0) {
      goto LABEL_89;
    }
    unint64_t v26 = v16 - (void)v23;
    if (2 * v26 > v25) {
      unint64_t v25 = 2 * v26;
    }
    if (v26 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v27 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v27 = v25;
    }
    if (v27)
    {
      uint64_t v12 = operator new(v27);
      unint64_t v13 = &v12[v24];
      unint64_t v14 = &v12[v27];
      v12[v24] = v2;
      uint64_t v15 = (uint64_t)&v12[v24 + 1];
      if (v5 == v23)
      {
LABEL_49:
        *(void *)(a1 + 64) = v13;
        *(void *)(a1 + 72) = v15;
        *(void *)(a1 + 80) = v14;
        if (!v5) {
          goto LABEL_88;
        }
        goto LABEL_87;
      }
    }
    else
    {
      uint64_t v12 = 0;
      unint64_t v13 = &v5[-*v6];
      unint64_t v14 = 0;
      *(unsigned char *)unint64_t v24 = a2;
      uint64_t v15 = v24 + 1;
      if (v5 == v23) {
        goto LABEL_49;
      }
    }
    if (v24 >= 8 && (unint64_t)(v23 - v12) >= 0x20)
    {
      if (v24 >= 0x20)
      {
        unint64_t v29 = v24 & 0xFFFFFFFFFFFFFFE0;
        uint64_t v46 = (long long *)(v5 - 16);
        unint64_t v47 = &v12[v5 - 16 - v23];
        unint64_t v48 = v24 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          long long v49 = *v46;
          *(v47 - 1) = *(v46 - 1);
          *unint64_t v47 = v49;
          v47 -= 2;
          v46 -= 2;
          v48 -= 32;
        }
        while (v48);
        if (v24 == v29) {
          goto LABEL_86;
        }
        if ((v24 & 0x18) == 0)
        {
          v13 -= v29;
          v5 -= v29;
          goto LABEL_84;
        }
      }
      else
      {
        unint64_t v29 = 0;
      }
      v13 -= v24 & 0xFFFFFFFFFFFFFFF8;
      uint64_t v50 = &v5[-v29 - 8];
      uint64_t v51 = &v12[v50 - v23];
      unint64_t v52 = v29 - (v24 & 0xFFFFFFFFFFFFFFF8);
      do
      {
        uint64_t v53 = *(void *)v50;
        v50 -= 8;
        *v51-- = v53;
        v52 += 8;
      }
      while (v52);
      v5 -= v24 & 0xFFFFFFFFFFFFFFF8;
      if (v24 == (v24 & 0xFFFFFFFFFFFFFFF8)) {
        goto LABEL_86;
      }
    }
LABEL_84:
    unint64_t v58 = v13 - 1;
    do
    {
      char v59 = *--v5;
      *v58-- = v59;
    }
    while (v5 != v23);
    goto LABEL_86;
  }
  char v2 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), a2);
  unint64_t v5 = *(unsigned char **)(a1 + 72);
  unint64_t v4 = *(void *)(a1 + 80);
  if ((unint64_t)v5 < v4)
  {
LABEL_24:
    *unint64_t v5 = v2;
    uint64_t v15 = (uint64_t)(v5 + 1);
    goto LABEL_88;
  }
  __int16 v6 = (void *)(a1 + 64);
  unint64_t v7 = *(unsigned char **)(a1 + 64);
  unint64_t v8 = v5 - v7;
  uint64_t v9 = v5 - v7 + 1;
  if (v9 < 0) {
    goto LABEL_89;
  }
  unint64_t v10 = v4 - (void)v7;
  if (2 * v10 > v9) {
    uint64_t v9 = 2 * v10;
  }
  if (v10 >= 0x3FFFFFFFFFFFFFFFLL) {
    size_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    size_t v11 = v9;
  }
  if (v11)
  {
    uint64_t v12 = operator new(v11);
    unint64_t v13 = &v12[v8];
    unint64_t v14 = &v12[v11];
    v12[v8] = v2;
    uint64_t v15 = (uint64_t)&v12[v8 + 1];
    if (v5 == v7) {
      goto LABEL_49;
    }
  }
  else
  {
    uint64_t v12 = 0;
    unint64_t v13 = (char *)(v5 - v7);
    unint64_t v14 = 0;
    *(unsigned char *)unint64_t v8 = v2;
    uint64_t v15 = v8 + 1;
    if (v5 == v7) {
      goto LABEL_49;
    }
  }
  if (v8 < 8 || (unint64_t)(v7 - v12) < 0x20) {
    goto LABEL_76;
  }
  if (v8 < 0x20)
  {
    unint64_t v22 = 0;
    goto LABEL_55;
  }
  unint64_t v22 = v8 & 0xFFFFFFFFFFFFFFE0;
  unint64_t v30 = (long long *)(v5 - 16);
  uint64_t v31 = &v12[v5 - 16 - v7];
  unint64_t v32 = v8 & 0xFFFFFFFFFFFFFFE0;
  do
  {
    long long v33 = *v30;
    *(v31 - 1) = *(v30 - 1);
    *uint64_t v31 = v33;
    v31 -= 2;
    v30 -= 2;
    v32 -= 32;
  }
  while (v32);
  if (v8 != v22)
  {
    if ((v8 & 0x18) == 0)
    {
      v13 -= v22;
      v5 -= v22;
      goto LABEL_76;
    }
LABEL_55:
    v13 -= v8 & 0xFFFFFFFFFFFFFFF8;
    int v34 = &v5[-v22 - 8];
    char v35 = &v12[v34 - v7];
    unint64_t v36 = v22 - (v8 & 0xFFFFFFFFFFFFFFF8);
    do
    {
      uint64_t v37 = *(void *)v34;
      v34 -= 8;
      *v35-- = v37;
      v36 += 8;
    }
    while (v36);
    v5 -= v8 & 0xFFFFFFFFFFFFFFF8;
    if (v8 == (v8 & 0xFFFFFFFFFFFFFFF8)) {
      goto LABEL_86;
    }
LABEL_76:
    long long v54 = v13 - 1;
    do
    {
      char v55 = *--v5;
      *v54-- = v55;
    }
    while (v5 != v7);
  }
LABEL_86:
  unint64_t v5 = (unsigned char *)*v6;
  *(void *)(a1 + 64) = v12;
  *(void *)(a1 + 72) = v15;
  *(void *)(a1 + 80) = v14;
  if (v5) {
LABEL_87:
  }
    operator delete(v5);
LABEL_88:
  *(void *)(a1 + 72) = v15;
}

void sub_100010790(uint64_t a1, uint64_t a2, char *a3)
{
  unint64_t v3 = (unint64_t)&a3[-a2];
  memset(__p, 170, sizeof(__p));
  if ((unint64_t)&a3[-a2] >= 0x7FFFFFFFFFFFFFF8) {
    sub_100006DCC();
  }
  if (v3 > 0x16)
  {
    uint64_t v14 = (v3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v3 | 7) != 0x17) {
      uint64_t v14 = v3 | 7;
    }
    uint64_t v15 = v14 + 1;
    unint64_t v7 = operator new(v14 + 1);
    __p[1] = (void *)v3;
    __p[2] = (void *)(v15 | 0x8000000000000000);
    __p[0] = v7;
    if ((char *)a2 != a3) {
      goto LABEL_4;
    }
LABEL_13:
    unint64_t v8 = v7;
    goto LABEL_16;
  }
  HIBYTE(__p[2]) = (_BYTE)a3 - a2;
  unint64_t v7 = __p;
  if ((char *)a2 == a3) {
    goto LABEL_13;
  }
LABEL_4:
  if (v3 < 0x20 || (unint64_t)v7 - a2 < 0x20)
  {
    unint64_t v8 = v7;
    uint64_t v9 = (char *)a2;
  }
  else
  {
    unint64_t v8 = (char *)v7 + (v3 & 0xFFFFFFFFFFFFFFE0);
    uint64_t v9 = (char *)(a2 + (v3 & 0xFFFFFFFFFFFFFFE0));
    unint64_t v10 = (long long *)(a2 + 16);
    size_t v11 = v7 + 1;
    unint64_t v12 = v3 & 0xFFFFFFFFFFFFFFE0;
    do
    {
      long long v13 = *v10;
      *(v11 - 1) = *(v10 - 1);
      *size_t v11 = v13;
      v10 += 2;
      v11 += 2;
      v12 -= 32;
    }
    while (v12);
    if (v3 == (v3 & 0xFFFFFFFFFFFFFFE0)) {
      goto LABEL_16;
    }
  }
  do
  {
    char v16 = *v9++;
    *v8++ = v16;
  }
  while (v9 != a3);
LABEL_16:
  unsigned char *v8 = 0;
  uint64_t v17 = (char *)HIBYTE(__p[2]);
  if (SHIBYTE(__p[2]) >= 0) {
    unint64_t v18 = __p;
  }
  else {
    unint64_t v18 = (void **)__p[0];
  }
  if (SHIBYTE(__p[2]) < 0) {
    uint64_t v17 = (char *)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a1 + 16) + 32))(*(void *)(a1 + 16), v18, &v17[(void)v18]);
  if (SHIBYTE(__p[2]) < 0) {
    operator delete(__p[0]);
  }
}

void sub_10001092C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100010948()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_range);
}

void sub_10001098C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

char *sub_1000109A0(void **a1, uint64_t a2)
{
  unint64_t v3 = 0xAAAAAAAAAAAAAAABLL * (((unsigned char *)a1[1] - (unsigned char *)*a1) >> 4);
  unint64_t v4 = v3 + 1;
  if (v3 + 1 > 0x555555555555555) {
    sub_100007188();
  }
  if (0x5555555555555556 * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 4) > v4) {
    unint64_t v4 = 0x5555555555555556 * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 4);
  }
  if (0xAAAAAAAAAAAAAAABLL * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 4) >= 0x2AAAAAAAAAAAAAALL) {
    unint64_t v6 = 0x555555555555555;
  }
  else {
    unint64_t v6 = v4;
  }
  if (v6)
  {
    if (v6 > 0x555555555555555) {
      sub_100006E74();
    }
    unint64_t v7 = (char *)operator new(48 * v6);
  }
  else
  {
    unint64_t v7 = 0;
  }
  unint64_t v8 = &v7[48 * v3];
  *((void *)v8 + 2) = *(void *)(a2 + 16);
  *(_OWORD *)unint64_t v8 = *(_OWORD *)a2;
  uint64_t v9 = &v7[48 * v6];
  long long v10 = *(_OWORD *)(a2 + 24);
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(_OWORD *)(v8 + 24) = v10;
  *((void *)v8 + 5) = *(void *)(a2 + 40);
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  size_t v11 = v8 + 48;
  unint64_t v12 = (void **)*a1;
  long long v13 = (void **)a1[1];
  if (v13 != *a1)
  {
    do
    {
      long long v14 = *((_OWORD *)v13 - 3);
      *((void *)v8 - 4) = *(v13 - 4);
      *((_OWORD *)v8 - 3) = v14;
      *(v13 - 5) = 0;
      *(v13 - 4) = 0;
      *(v13 - 6) = 0;
      long long v15 = *(_OWORD *)(v13 - 3);
      *((void *)v8 - 1) = *(v13 - 1);
      *(_OWORD *)(v8 - 24) = v15;
      v8 -= 48;
      *(v13 - 2) = 0;
      *(v13 - 1) = 0;
      *(v13 - 3) = 0;
      v13 -= 6;
    }
    while (v13 != v12);
    long long v13 = (void **)*a1;
    char v16 = (void **)a1[1];
    *a1 = v8;
    a1[1] = v11;
    a1[2] = v9;
    while (1)
    {
      if (v16 == v13) {
        goto LABEL_22;
      }
      if (*((char *)v16 - 1) < 0)
      {
        operator delete(*(v16 - 3));
        if ((*((char *)v16 - 25) & 0x80000000) == 0) {
          goto LABEL_14;
        }
      }
      else if ((*((char *)v16 - 25) & 0x80000000) == 0)
      {
        goto LABEL_14;
      }
      operator delete(*(v16 - 6));
LABEL_14:
      v16 -= 6;
    }
  }
  *a1 = v8;
  a1[1] = v11;
  a1[2] = v9;
LABEL_22:
  if (v13) {
    operator delete(v13);
  }
  return v11;
}

void *sub_100010B40(void *a1)
{
  *a1 = &off_100030AF8;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_100010BAC(void *__p)
{
  *std::string __p = &off_100030AF8;
  uint64_t v2 = __p[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  operator delete(__p);
}

uint64_t sub_100010C28(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(void *)(*(void *)(a2 + 32) + 24 * (*(_DWORD *)(result + 16) - 1)) = *(void *)(a2 + 16);
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void *sub_100010C58(void *a1)
{
  *a1 = &off_100030AF8;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_100010CC4(void *__p)
{
  *std::string __p = &off_100030AF8;
  uint64_t v2 = __p[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  operator delete(__p);
}

uint64_t sub_100010D40(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  uint64_t v2 = *(void *)(a2 + 32) + 24 * (*(_DWORD *)(result + 16) - 1);
  *(void *)(v2 + 8) = *(void *)(a2 + 16);
  *(unsigned char *)(v2 + 16) = 1;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void *sub_100010D78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, char a7)
{
  long long v14 = operator new(0x10uLL);
  uint64_t v15 = *(void *)(a1 + 56);
  uint64_t v16 = *(void *)(v15 + 8);
  *long long v14 = &off_100030A80;
  v14[1] = v16;
  *(void *)(v15 + 8) = 0;
  uint64_t v17 = operator new(0x38uLL);
  int v18 = *(_DWORD *)(a1 + 32);
  v17[1] = *(void *)(a4 + 8);
  v17[2] = v14;
  *uint64_t v17 = &off_100030F18;
  v17[3] = a2;
  v17[4] = a3;
  *((_DWORD *)v17 + 10) = v18;
  *((_DWORD *)v17 + 11) = a5;
  *((_DWORD *)v17 + 12) = a6;
  *((unsigned char *)v17 + 52) = a7;
  *(void *)(a4 + 8) = 0;
  uint64_t result = operator new(0x10uLL);
  *uint64_t result = &off_100030FA8;
  result[1] = v17;
  *(void *)(*(void *)(a1 + 56) + 8) = result;
  *(void *)(a1 + 56) = v17[2];
  *(void *)(a4 + 8) = v17;
  *(_DWORD *)(a1 + 32) = v18 + 1;
  return result;
}

void sub_100010E8C(_Unwind_Exception *a1)
{
  sub_100011018(v1);
  _Unwind_Resume(a1);
}

void sub_100010EA0(_Unwind_Exception *a1)
{
  sub_100008600(v1);
  _Unwind_Resume(a1);
}

void sub_100010EB4()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_badbrace);
}

void sub_100010EF8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_100010F0C()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_brace);
}

void sub_100010F50(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void *sub_100010F64(void *a1)
{
  *a1 = &off_100030F78;
  uint64_t v2 = a1[2];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  *a1 = &off_100030AF8;
  uint64_t v3 = a1[1];
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  return a1;
}

void sub_100011018(void *__p)
{
  *std::string __p = &off_100030F78;
  uint64_t v2 = __p[2];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  *std::string __p = &off_100030AF8;
  uint64_t v3 = __p[1];
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  operator delete(__p);
}

uint64_t sub_1000110DC(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned int *)(result + 40);
  uint64_t v3 = *(void *)(a2 + 56);
  unint64_t v4 = (unint64_t *)(v3 + 16 * v2);
  if (*(_DWORD *)a2 != -991)
  {
    *unint64_t v4 = 0;
    if (!*(void *)(result + 32))
    {
      *(_DWORD *)a2 = -994;
      goto LABEL_28;
    }
    if (*(void *)(result + 24))
    {
      *(_DWORD *)a2 = -994;
      *(void *)(a2 + 80) = *(void *)(result + 8);
      *(void *)(v3 + 16 * v2 + 8) = *(void *)(a2 + 16);
      int v20 = *(_DWORD *)(result + 44);
      int v21 = *(_DWORD *)(result + 48);
      if (v20 == v21) {
        return result;
      }
      uint64_t v22 = (v21 - 1);
      uint64_t v23 = (v20 - 1);
      uint64_t v24 = *(void *)(a2 + 24);
      uint64_t v25 = *(void *)(a2 + 32);
      uint64_t v26 = v22 - v23;
      if ((unint64_t)(v22 - v23) >= 2)
      {
        uint64_t v27 = (v26 & 0xFFFFFFFFFFFFFFFELL) + v23;
        uint64_t v28 = v25 + 24 * v23 + 24;
        unint64_t v29 = v26 & 0xFFFFFFFFFFFFFFFELL;
        do
        {
          *(void *)(v28 - 24) = v24;
          *(void *)(v28 - 16) = v24;
          *(void *)uint64_t v28 = v24;
          *(void *)(v28 + 8) = v24;
          *(unsigned char *)(v28 - 8) = 0;
          *(unsigned char *)(v28 + 16) = 0;
          v28 += 48;
          v29 -= 2;
        }
        while (v29);
        if (v26 == (v26 & 0xFFFFFFFFFFFFFFFELL)) {
          return result;
        }
      }
      else
      {
        uint64_t v27 = v23;
      }
      uint64_t v30 = v22 - v27;
      uint64_t v31 = (unsigned char *)(v25 + 24 * v27 + 16);
      do
      {
        *((void *)v31 - 2) = v24;
        *((void *)v31 - 1) = v24;
        *uint64_t v31 = 0;
        v31 += 24;
        --v30;
      }
      while (v30);
      return result;
    }
LABEL_26:
    *(_DWORD *)a2 = -992;
    return result;
  }
  unint64_t v5 = *v4 + 1;
  *unint64_t v4 = v5;
  unint64_t v6 = *(void *)(result + 24);
  unint64_t v7 = *(void *)(result + 32);
  BOOL v8 = v5 < v7;
  if (v5 < v7 && v5 >= v6) {
    BOOL v8 = v5 < v7 && *(void *)(v3 + 16 * v2 + 8) != *(void *)(a2 + 16);
  }
  if (v8 && v5 >= v6) {
    goto LABEL_26;
  }
  *(_DWORD *)a2 = -994;
  if (!v8)
  {
LABEL_28:
    *(void *)(a2 + 80) = *(void *)(result + 16);
    return result;
  }
  *(void *)(a2 + 80) = *(void *)(result + 8);
  *(void *)(v3 + 16 * v2 + 8) = *(void *)(a2 + 16);
  int v12 = *(_DWORD *)(result + 44);
  int v13 = *(_DWORD *)(result + 48);
  if (v12 == v13) {
    return result;
  }
  uint64_t v14 = (v13 - 1);
  uint64_t v15 = (v12 - 1);
  uint64_t v16 = *(void *)(a2 + 24);
  uint64_t v17 = *(void *)(a2 + 32);
  uint64_t v18 = v14 - v15;
  if ((unint64_t)(v14 - v15) < 2)
  {
    uint64_t v19 = v15;
LABEL_39:
    uint64_t v34 = v14 - v19;
    char v35 = (unsigned char *)(v17 + 24 * v19 + 16);
    do
    {
      *((void *)v35 - 2) = v16;
      *((void *)v35 - 1) = v16;
      *char v35 = 0;
      v35 += 24;
      --v34;
    }
    while (v34);
    return result;
  }
  uint64_t v19 = (v18 & 0xFFFFFFFFFFFFFFFELL) + v15;
  uint64_t v32 = v17 + 24 * v15 + 24;
  unint64_t v33 = v18 & 0xFFFFFFFFFFFFFFFELL;
  do
  {
    *(void *)(v32 - 24) = v16;
    *(void *)(v32 - 16) = v16;
    *(void *)uint64_t v32 = v16;
    *(void *)(v32 + 8) = v16;
    *(unsigned char *)(v32 - 8) = 0;
    *(unsigned char *)(v32 + 16) = 0;
    v32 += 48;
    v33 -= 2;
  }
  while (v33);
  if (v18 != (v18 & 0xFFFFFFFFFFFFFFFELL)) {
    goto LABEL_39;
  }
  return result;
}

uint64_t sub_1000112C0(uint64_t result, int a2, uint64_t a3)
{
  *(_DWORD *)a3 = -994;
  if (*(unsigned __int8 *)(result + 52) == a2)
  {
    *(void *)(a3 + 80) = *(void *)(result + 16);
    return result;
  }
  *(void *)(a3 + 80) = *(void *)(result + 8);
  int v3 = *(_DWORD *)(result + 44);
  *(void *)(*(void *)(a3 + 56) + 16 * *(unsigned int *)(result + 40) + 8) = *(void *)(a3 + 16);
  int v4 = *(_DWORD *)(result + 48);
  if (v3 != v4)
  {
    uint64_t v5 = (v4 - 1);
    uint64_t v6 = (v3 - 1);
    uint64_t v7 = *(void *)(a3 + 24);
    uint64_t v8 = *(void *)(a3 + 32);
    uint64_t v9 = v5 - v6;
    if ((unint64_t)(v5 - v6) < 2)
    {
      uint64_t v10 = v6;
LABEL_9:
      uint64_t v13 = v5 - v10;
      uint64_t v14 = (unsigned char *)(v8 + 24 * v10 + 16);
      do
      {
        *((void *)v14 - 2) = v7;
        *((void *)v14 - 1) = v7;
        *uint64_t v14 = 0;
        v14 += 24;
        --v13;
      }
      while (v13);
      return result;
    }
    uint64_t v10 = (v9 & 0xFFFFFFFFFFFFFFFELL) + v6;
    uint64_t v11 = v8 + 24 * v6 + 24;
    unint64_t v12 = v9 & 0xFFFFFFFFFFFFFFFELL;
    do
    {
      *(void *)(v11 - 24) = v7;
      *(void *)(v11 - 16) = v7;
      *(void *)uint64_t v11 = v7;
      *(void *)(v11 + 8) = v7;
      *(unsigned char *)(v11 - 8) = 0;
      *(unsigned char *)(v11 + 16) = 0;
      v11 += 48;
      v12 -= 2;
    }
    while (v12);
    if (v9 != (v9 & 0xFFFFFFFFFFFFFFFELL)) {
      goto LABEL_9;
    }
  }
  return result;
}

void *sub_100011388(void *a1)
{
  *a1 = &off_100030F78;
  uint64_t v2 = a1[2];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  *a1 = &off_100030AF8;
  uint64_t v3 = a1[1];
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  return a1;
}

void sub_10001143C(void *__p)
{
  *std::string __p = &off_100030F78;
  uint64_t v2 = __p[2];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  *std::string __p = &off_100030AF8;
  uint64_t v3 = __p[1];
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  operator delete(__p);
}

uint64_t sub_100011508(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -991;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void *sub_10001151C(void *a1)
{
  *a1 = &off_100030F78;
  uint64_t v2 = a1[2];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  *a1 = &off_100030AF8;
  uint64_t v3 = a1[1];
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  return a1;
}

void sub_1000115D0(void *__p)
{
  *std::string __p = &off_100030F78;
  uint64_t v2 = __p[2];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  *std::string __p = &off_100030AF8;
  uint64_t v3 = __p[1];
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  operator delete(__p);
}

void sub_100011694(uint64_t a1, _DWORD *a2)
{
  *a2 = -992;
}

uint64_t sub_1000116A0(uint64_t result, int a2, uint64_t a3)
{
  *(_DWORD *)a3 = -994;
  uint64_t v3 = 8;
  if (a2) {
    uint64_t v3 = 16;
  }
  *(void *)(a3 + 80) = *(void *)(result + v3);
  return result;
}

uint64_t sub_1000116CC(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void sub_1000116E0()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, __re_err_empty);
}

void sub_100011724(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

char *sub_100011738(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t v6 = sub_100011BEC(a1, (char *)a2, a3);
  uint64_t v7 = v6;
  if (v6 != (char *)a2 || v6 == a3) {
    return v7;
  }
  if ((char *)(a2 + 1) == a3) {
    return (char *)a2;
  }
  if (*(unsigned char *)a2 != 92) {
    return (char *)a2;
  }
  int v8 = *(unsigned __int8 *)(a2 + 1);
  if (v8 == 40)
  {
    uint64_t v9 = (unsigned __int8 *)(a2 + 2);
    if ((*(unsigned char *)(a1 + 24) & 2) != 0)
    {
      int v11 = *(_DWORD *)(a1 + 28);
    }
    else
    {
      uint64_t v10 = operator new(0x18uLL);
      int v11 = *(_DWORD *)(a1 + 28) + 1;
      *(_DWORD *)(a1 + 28) = v11;
      uint64_t v12 = *(void *)(a1 + 56);
      uint64_t v13 = *(void *)(v12 + 8);
      void *v10 = &off_100030E88;
      v10[1] = v13;
      *((_DWORD *)v10 + 4) = v11;
      *(void *)(v12 + 8) = v10;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
    }
    do
    {
      if (v9 == (unsigned __int8 *)a3) {
        goto LABEL_25;
      }
      uint64_t v15 = v9;
      uint64_t v16 = *(void *)(a1 + 56);
      int v17 = *(_DWORD *)(a1 + 28);
      uint64_t v18 = (unsigned __int8 *)sub_100011738(a1, v15, a3);
      if (v18 == v15) {
        break;
      }
      uint64_t v9 = sub_100011978(a1, v18, (unsigned __int8 *)a3, v16, v17 + 1, *(_DWORD *)(a1 + 28) + 1);
    }
    while (v9 != v15);
    if (v15 + 1 == (unsigned __int8 *)a3 || *v15 != 92 || v15[1] != 41) {
LABEL_25:
    }
      sub_1000093AC();
    uint64_t v7 = (char *)&v15[2 * (v15[1] == 41)];
    if ((*(unsigned char *)(a1 + 24) & 2) == 0)
    {
      uint64_t v19 = operator new(0x18uLL);
      uint64_t v20 = *(void *)(a1 + 56);
      uint64_t v21 = *(void *)(v20 + 8);
      void *v19 = &off_100030ED0;
      v19[1] = v21;
      *((_DWORD *)v19 + 4) = v11;
      *(void *)(v20 + 8) = v19;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
      return v7;
    }
    return v7;
  }
  if ((v8 & 0xF8) != 0x30 && (v8 & 0xFE) != 0x38 || (v8 - 49) > 8) {
    return (char *)a2;
  }
  if ((v8 - 48) > *(_DWORD *)(a1 + 28)) {
    sub_10000BC48();
  }
  sub_10000BCA0(a1, v8 - 48);
  return (char *)(a2 + 2);
}

unsigned __int8 *sub_100011978(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t a4, int a5, int a6)
{
  uint64_t v6 = a2;
  if (a2 == a3) {
    return v6;
  }
  int v7 = *a2;
  if (v7 == 42)
  {
    sub_100010D78(a1, 0, -1, a4, a5, a6, 1);
    return ++v6;
  }
  if (a2 + 1 == a3 || v7 != 92 || a2[1] != 123) {
    return v6;
  }
  uint64_t v9 = &a2[2 * (a2[1] == 123)];
  if (v9 == a3) {
    goto LABEL_43;
  }
  int v10 = *v9;
  if ((v10 & 0xF8) != 0x30 && (v10 & 0xFE) != 0x38) {
    goto LABEL_43;
  }
  int v11 = v10 - 48;
  uint64_t v12 = v9 + 1;
  if (v9 + 1 == a3)
  {
LABEL_16:
    uint64_t v12 = a3;
  }
  else
  {
    while (1)
    {
      int v13 = *v12;
      if ((v13 & 0xF8) != 0x30 && (v13 & 0xFE) != 0x38) {
        break;
      }
      if (v11 >= 214748364) {
        goto LABEL_43;
      }
      int v11 = v13 + 10 * v11 - 48;
      if (++v12 == a3) {
        goto LABEL_16;
      }
    }
  }
  if (v12 == v9) {
    goto LABEL_43;
  }
  if (v12 == a3) {
    goto LABEL_41;
  }
  uint64_t v14 = v12 + 1;
  int v15 = *v12;
  if (v15 != 44)
  {
    if (v14 != a3 && v15 == 92 && *v14 == 125)
    {
      uint64_t v19 = v12 + 2;
      sub_100010D78(a1, v11, v11, a4, a5, a6, 1);
      return v19;
    }
    goto LABEL_41;
  }
  if (v14 == a3) {
    goto LABEL_41;
  }
  int v16 = *v14;
  if ((v16 & 0xF8) == 0x30 || (v16 & 0xFE) == 0x38)
  {
    uint64_t v14 = v12 + 2;
    if (v12 + 2 == a3) {
      goto LABEL_41;
    }
    int v17 = v16 - 48;
    while (1)
    {
      int v16 = *v14;
      if ((v16 & 0xF8) != 0x30 && (v16 & 0xFE) != 0x38) {
        break;
      }
      if (v17 >= 214748364) {
        goto LABEL_43;
      }
      int v17 = v16 + 10 * v17 - 48;
      if (++v14 == a3) {
        goto LABEL_41;
      }
    }
  }
  else
  {
    int v17 = -1;
  }
  if (v14 == a3 || v14 + 1 == a3 || v16 != 92 || v14[1] != 125) {
LABEL_41:
  }
    sub_100010F0C();
  uint64_t v18 = &v14[2 * (v14[1] == 125)];
  if (v17 != -1)
  {
    if (v17 >= v11)
    {
      sub_100010D78(a1, v11, v17, a4, a5, a6, 1);
      return v18;
    }
LABEL_43:
    sub_100010EB4();
  }
  sub_100010D78(a1, v11, -1, a4, a5, a6, 1);
  return v18;
}

char *sub_100011BEC(uint64_t a1, char *a2, char *a3)
{
  if (a2 != a3)
  {
    uint64_t v6 = a2 + 1;
    int v5 = *a2;
    if (a2 + 1 != a3 || v5 != 36)
    {
      if ((v5 - 46) > 0x2E || ((1 << (v5 - 46)) & 0x600000000001) == 0)
      {
        sub_10000BA9C(a1, (char)v5);
        return a2 + 1;
      }
      if (v6 == a3 || v5 != 92)
      {
        if (v5 == 46)
        {
          int v10 = operator new(0x10uLL);
          uint64_t v11 = *(void *)(a1 + 56);
          uint64_t v12 = *(void *)(v11 + 8);
          void *v10 = &off_100031080;
          v10[1] = v12;
          *(void *)(v11 + 8) = v10;
          *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
          return a2 + 1;
        }
      }
      else
      {
        int v9 = *v6;
        if ((v9 - 36) <= 0x3A && ((1 << (v9 - 36)) & 0x580000000000441) != 0)
        {
          sub_10000BA9C(a1, (char)v9);
          return a2 + 2;
        }
      }
    }
  }
  return sub_10000ACB4(a1, a2, a3);
}

void *sub_100011D48(void *a1)
{
  *a1 = &off_100030AF8;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_100011DB4(void *__p)
{
  *std::string __p = &off_100030AF8;
  uint64_t v2 = __p[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  operator delete(__p);
}

uint64_t sub_100011E30(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned char **)(a2 + 16);
  if (v2 == *(unsigned char **)(a2 + 24) || !*v2)
  {
    *(_DWORD *)a2 = -993;
    *(void *)(a2 + 80) = 0;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(void *)(a2 + 16) = v2 + 1;
    *(void *)(a2 + 80) = *(void *)(result + 8);
  }
  return result;
}

uint64_t sub_100011E70(uint64_t a1, unsigned __int8 a2)
{
  if ((a2 & 0xF8) != 0x30 && (a2 & 0xFE) != 0x38 || a2 - 49 > 8) {
    return 0;
  }
  if (a2 - 48 > *(_DWORD *)(a1 + 28)) {
    sub_10000BC48();
  }
  sub_10000BCA0(a1, a2 - 48);
  return 1;
}

char *sub_100011ED4(uint64_t a1, char *a2, char *a3)
{
  uint64_t v6 = *(void *)(a1 + 56);
  int v7 = *(_DWORD *)(a1 + 28);
  int v8 = sub_1000121B8(a1, a2, a3);
  if (v8 != a2 || (int v8 = sub_1000123A0(a1, a2, a3), v8 != a2))
  {
    if (v8 != a2) {
      goto LABEL_25;
    }
LABEL_4:
    if (v8 != a3)
    {
      int v9 = *a2;
      if (v9 == 36)
      {
        int v10 = operator new(0x18uLL);
        BOOL v11 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
        uint64_t v12 = *(void *)(a1 + 56);
        v10[1] = *(void *)(v12 + 8);
        int v13 = &off_100030B70;
        goto LABEL_13;
      }
      if (v9 != 40)
      {
        if (v9 == 94)
        {
          int v10 = operator new(0x18uLL);
          BOOL v11 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
          uint64_t v12 = *(void *)(a1 + 56);
          v10[1] = *(void *)(v12 + 8);
          int v13 = &off_100030B28;
LABEL_13:
          void *v10 = v13;
          *((unsigned char *)v10 + 16) = v11;
          *(void *)(v12 + 8) = v10;
          goto LABEL_14;
        }
        return a2;
      }
      if ((*(unsigned char *)(a1 + 24) & 2) != 0)
      {
        int v18 = *(_DWORD *)(a1 + 28);
      }
      else
      {
        int v17 = operator new(0x18uLL);
        int v18 = *(_DWORD *)(a1 + 28) + 1;
        *(_DWORD *)(a1 + 28) = v18;
        uint64_t v19 = *(void *)(a1 + 56);
        uint64_t v20 = *(void *)(v19 + 8);
        *int v17 = &off_100030E88;
        v17[1] = v20;
        *((_DWORD *)v17 + 4) = v18;
        *(void *)(v19 + 8) = v17;
        *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
      }
      ++*(_DWORD *)(a1 + 36);
      uint64_t v21 = (char *)sub_100007EB8(a1, a2 + 1, a3);
      if (v21 == a3 || (uint64_t v22 = v21, *v21 != 41)) {
        sub_1000093AC();
      }
      if ((*(unsigned char *)(a1 + 24) & 2) == 0)
      {
        uint64_t v23 = operator new(0x18uLL);
        uint64_t v24 = *(void *)(a1 + 56);
        uint64_t v25 = *(void *)(v24 + 8);
        *uint64_t v23 = &off_100030ED0;
        v23[1] = v25;
        *((_DWORD *)v23 + 4) = v18;
        *(void *)(v24 + 8) = v23;
        *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
      }
      --*(_DWORD *)(a1 + 36);
      int v8 = v22 + 1;
    }
LABEL_25:
    if (v8 != a2) {
      goto LABEL_26;
    }
    return a2;
  }
  if (a2 == a3 || *a2 != 46)
  {
    int v8 = sub_10000ACB4(a1, a2, a3);
    if (v8 != a2) {
      goto LABEL_25;
    }
    goto LABEL_4;
  }
  uint64_t v14 = operator new(0x10uLL);
  uint64_t v15 = *(void *)(a1 + 56);
  uint64_t v16 = *(void *)(v15 + 8);
  *uint64_t v14 = &off_100031080;
  v14[1] = v16;
  *(void *)(v15 + 8) = v14;
LABEL_14:
  *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
  int v8 = a2 + 1;
LABEL_26:
  int v26 = *(_DWORD *)(a1 + 28) + 1;
  return sub_100008E84(a1, v8, a3, v6, v7 + 1, v26);
}

unsigned char *sub_1000121B8(uint64_t a1, unsigned char *a2, unsigned char *a3)
{
  if (a2 == a3) {
    return a2;
  }
  switch(*a2)
  {
    case '$':
    case '(':
    case '*':
    case '+':
    case '.':
    case '?':
    case '[':
    case '\\':
    case '^':
    case '{':
    case '|':
      return a2;
    case ')':
      if (*(_DWORD *)(a1 + 36)) {
        return a2;
      }
      break;
    default:
      break;
  }
  sub_10000BA9C(a1, (char)*a2);
  return a2 + 1;
}

char *sub_1000123A0(uint64_t a1, char *a2, char *a3)
{
  uint64_t v3 = a2;
  if (a2 == a3) {
    return v3;
  }
  int v4 = a2 + 1;
  if (v3 + 1 == a3 || *v3 != 92) {
    return v3;
  }
  signed __int8 v5 = *v4;
  switch(*v4)
  {
    case '$':
    case '(':
    case ')':
    case '*':
    case '+':
    case '.':
    case '?':
    case '[':
    case '\\':
    case '^':
    case '{':
    case '|':
    case '}':
      sub_10000BA9C(a1, v5);
      v3 += 2;
      return v3;
    default:
      if ((*(_DWORD *)(a1 + 24) & 0x1F0) == 0x40)
      {
        uint64_t result = sub_10000ED0C(a1, v4, a3, 0);
      }
      else
      {
        int v7 = sub_100011E70(a1, v5);
        uint64_t v8 = 2;
        if (!v7) {
          uint64_t v8 = 0;
        }
        uint64_t result = &v3[v8];
      }
      break;
  }
  return result;
}

uint64_t sub_1000125E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  if ((a5 & 0x80) != 0) {
    int v9 = a5 & 0xFFA;
  }
  else {
    int v9 = a5;
  }
  int v10 = *(_DWORD *)(a1 + 28);
  *(void *)(a4 + 24) = a3;
  BOOL v11 = (long long *)(a4 + 24);
  *(void *)(a4 + 32) = a3;
  *(unsigned char *)(a4 + 40) = 0;
  sub_10000A1E4(a4, (v10 + 1), (long long *)(a4 + 24));
  *(void *)(a4 + 48) = a2;
  *(void *)(a4 + 56) = a2;
  *(unsigned char *)(a4 + 64) = 0;
  *(_OWORD *)(a4 + 72) = *v11;
  *(unsigned char *)(a4 + 88) = *(unsigned char *)(a4 + 40);
  if ((v9 & 0x800) == 0) {
    *(void *)(a4 + 104) = a2;
  }
  *(unsigned char *)(a4 + 96) = 1;
  if ((*(_WORD *)(a1 + 24) & 0x1F0) == 0)
  {
    if (sub_100009CD8(a1, a2, a3, (uint64_t *)a4, v9, (v9 & 0x800) == 0)) {
      goto LABEL_28;
    }
    goto LABEL_13;
  }
  if (*(_DWORD *)(a1 + 28))
  {
    if (sub_100013448(a1, a2, a3, (uint64_t *)a4, v9, (v9 & 0x800) == 0)) {
      goto LABEL_28;
    }
LABEL_13:
    if (a2 != a3 && (v9 & 0x40) == 0)
    {
      int v12 = v9 | 0x80;
      for (uint64_t i = a2 + 1; i != a3; ++i)
      {
        sub_10000A1E4(a4, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a4 + 8) - *(void *)a4) >> 3), v11);
        if ((*(_WORD *)(a1 + 24) & 0x1F0) != 0)
        {
          if (*(_DWORD *)(a1 + 28))
          {
            if (sub_100013448(a1, i, a3, (uint64_t *)a4, v12, 0)) {
              goto LABEL_28;
            }
          }
          else if (sub_100012AB4(a1, i, a3, (uint64_t *)a4, v12, 0))
          {
            goto LABEL_28;
          }
        }
        else if (sub_100009CD8(a1, i, a3, (uint64_t *)a4, v12, 0))
        {
          goto LABEL_28;
        }
        sub_10000A1E4(a4, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a4 + 8) - *(void *)a4) >> 3), v11);
      }
      sub_10000A1E4(a4, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a4 + 8) - *(void *)a4) >> 3), v11);
      if ((*(_WORD *)(a1 + 24) & 0x1F0) != 0)
      {
        if (*(_DWORD *)(a1 + 28))
        {
          if (sub_100013448(a1, a3, a3, (uint64_t *)a4, v12, 0)) {
            goto LABEL_28;
          }
        }
        else if (sub_100012AB4(a1, a3, a3, (uint64_t *)a4, v12, 0))
        {
          goto LABEL_28;
        }
      }
      else if (sub_100009CD8(a1, a3, a3, (uint64_t *)a4, v12, 0))
      {
        goto LABEL_28;
      }
    }
    uint64_t result = 0;
    *(void *)(a4 + 8) = *(void *)a4;
    return result;
  }
  if ((sub_100012AB4(a1, a2, a3, (uint64_t *)a4, v9, (v9 & 0x800) == 0) & 1) == 0) {
    goto LABEL_13;
  }
LABEL_28:
  if (*(void *)(a4 + 8) == *(void *)a4) {
    uint64_t v14 = v11;
  }
  else {
    uint64_t v14 = *(long long **)a4;
  }
  uint64_t v15 = *(void *)v14;
  *(void *)(a4 + 56) = *(void *)v14;
  *(unsigned char *)(a4 + 64) = *(void *)(a4 + 48) != v15;
  uint64_t v16 = *((void *)v14 + 1);
  *(void *)(a4 + 72) = v16;
  *(unsigned char *)(a4 + 88) = v16 != *(void *)(a4 + 80);
  return 1;
}

void sub_1000128F4(void **a1, uint64_t a2, char *a3, uint64_t *a4, char a5)
{
  uint64_t v10 = a4[6];
  unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((a4[1] - *a4) >> 3);
  int v12 = (char *)*a1;
  int v13 = (char *)a1[1];
  unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * ((v13 - (unsigned char *)*a1) >> 3);
  if (v11 <= v14)
  {
    if (v11 < v14)
    {
      int v13 = &v12[8 * ((a4[1] - *a4) >> 3)];
      a1[1] = v13;
    }
  }
  else
  {
    sub_100014DC8(a1, v11 - v14);
    int v12 = (char *)*a1;
    int v13 = (char *)a1[1];
  }
  if (v13 != v12)
  {
    uint64_t v15 = 0;
    unint64_t v16 = 0;
    uint64_t v18 = *a4;
    uint64_t v17 = a4[1];
    do
    {
      unint64_t v19 = 0xAAAAAAAAAAAAAAABLL * ((v17 - v18) >> 3);
      uint64_t v20 = (void *)(v18 + v15);
      if (v19 <= v16) {
        uint64_t v21 = a4 + 3;
      }
      else {
        uint64_t v21 = v20;
      }
      *(void *)&v12[v15] = a2 + *v21 - v10;
      if (0xAAAAAAAAAAAAAAABLL * ((a4[1] - *a4) >> 3) <= v16) {
        uint64_t v22 = a4 + 3;
      }
      else {
        uint64_t v22 = (uint64_t *)(*a4 + v15);
      }
      *(void *)((char *)*a1 + v15 + 8) = a2 + v22[1] - v10;
      uint64_t v18 = *a4;
      uint64_t v17 = a4[1];
      if (0xAAAAAAAAAAAAAAABLL * ((v17 - *a4) >> 3) <= v16) {
        uint64_t v23 = a4 + 3;
      }
      else {
        uint64_t v23 = (uint64_t *)(*a4 + v15);
      }
      char v24 = *((unsigned char *)v23 + 16);
      int v12 = (char *)*a1;
      uint64_t v25 = (char *)a1[1];
      *((unsigned char *)*a1 + v15 + 16) = v24;
      ++v16;
      v15 += 24;
    }
    while (v16 < 0xAAAAAAAAAAAAAAABLL * ((v25 - v12) >> 3));
  }
  a1[3] = a3;
  a1[4] = a3;
  *((unsigned char *)a1 + 40) = 0;
  int v26 = (char *)(a2 + a4[6] - v10);
  a1[6] = v26;
  a1[7] = (void *)(a2 + a4[7] - v10);
  *((unsigned char *)a1 + 64) = *((unsigned char *)a4 + 64);
  a1[9] = (void *)(a2 + a4[9] - v10);
  a1[10] = (void *)(a2 + a4[10] - v10);
  *((unsigned char *)a1 + 88) = *((unsigned char *)a4 + 88);
  if ((a5 & 1) == 0) {
    a1[13] = v26;
  }
  *((unsigned char *)a1 + 96) = *((unsigned char *)a4 + 96);
}

uint64_t sub_100012AB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  long long v100 = 0u;
  long long v101 = 0u;
  long long v99 = 0u;
  uint64_t v6 = *(void *)(a1 + 40);
  if (!v6)
  {
LABEL_79:
    uint64_t v85 = (void **)*((void *)&v99 + 1);
    v86 = (void **)v100;
    *((void *)&v101 + 1) = 0;
    unint64_t v87 = v100 - *((void *)&v99 + 1);
    if ((void)v100 - *((void *)&v99 + 1) < 0x11uLL) {
      goto LABEL_81;
    }
    do
    {
LABEL_80:
      operator delete(*v85);
      v86 = (void **)v100;
      uint64_t v85 = (void **)(*((void *)&v99 + 1) + 8);
      *((void *)&v99 + 1) = v85;
      unint64_t v87 = v100 - (void)v85;
    }
    while ((void)v100 - (void)v85 > 0x10uLL);
    goto LABEL_81;
  }
  *(_DWORD *)v98 = 0;
  memset(&v98[8], 0, 85);
  sub_100013C90((uint64_t)&v99);
  unint64_t v11 = *(void *)(*((void *)&v99 + 1) + 8 * (((void)v101 + *((void *)&v101 + 1)) / 0x2AuLL))
      + 96 * (((void)v101 + *((void *)&v101 + 1)) % 0x2AuLL);
  long long v12 = *(_OWORD *)&v98[16];
  *(_OWORD *)unint64_t v11 = *(_OWORD *)v98;
  *(_OWORD *)(v11 + 16) = v12;
  *(void *)(v11 + 40) = 0;
  *(void *)(v11 + 48) = 0;
  *(void *)(v11 + 32) = 0;
  memset(&v98[32], 0, 24);
  *(void *)(v11 + 56) = 0;
  *(void *)(v11 + 64) = 0;
  *(void *)(v11 + 72) = 0;
  memset(&v98[56], 0, 24);
  uint64_t v13 = *(void *)&v98[80];
  *(void *)(v11 + 85) = *(void *)&v98[85];
  *(void *)(v11 + 80) = v13;
  uint64_t v15 = *((void *)&v101 + 1);
  uint64_t v14 = v101;
  uint64_t v16 = ++*((void *)&v101 + 1);
  uint64_t v17 = *((void *)&v99 + 1);
  unint64_t v18 = *(unsigned int *)(a1 + 32);
  unint64_t v19 = v101 + v15;
  unint64_t v20 = 8 * (v19 / 0x2A);
  unint64_t v21 = 96 * (v19 % 0x2A);
  unint64_t v22 = *(void *)(*((void *)&v99 + 1) + v20) + v21;
  *(_DWORD *)unint64_t v22 = 0;
  *(void *)(v22 + 8) = a2;
  *(void *)(*(void *)(v17 + v20) + v21 + 16) = a2;
  *(void *)(*(void *)(v17 + v20) + v21 + 24) = a3;
  unint64_t v23 = *(void *)(v17 + v20) + v21;
  uint64_t v26 = *(void *)(v23 + 56);
  unint64_t v24 = v23 + 56;
  uint64_t v25 = v26;
  unint64_t v27 = (*(void *)(v24 + 8) - v26) >> 4;
  unint64_t v92 = a4;
  if (v18 <= v27)
  {
    if (v18 < v27) {
      *(void *)(v24 + 8) = v25 + 16 * v18;
    }
  }
  else
  {
    sub_10000A880((char **)v24, v18 - v27);
    uint64_t v16 = *((void *)&v101 + 1);
    uint64_t v14 = v101;
    uint64_t v17 = *((void *)&v99 + 1);
  }
  uint64_t v94 = 0;
  char v95 = 0;
  unsigned int v28 = 0;
  unint64_t v29 = v14 + v16 - 1;
  unint64_t v30 = 8 * (v29 / 0x2A);
  unint64_t v31 = 96 * (v29 % 0x2A);
  *(void *)(*(void *)(v17 + v30) + v31 + 80) = v6;
  uint64_t v93 = a3;
  uint64_t v32 = a3 - a2;
  unint64_t v33 = *(void *)(v17 + v30) + v31;
  *(_DWORD *)(v33 + 88) = a5;
  *(unsigned char *)(v33 + 92) = a6;
  while (2)
  {
    if ((++v28 & 0xFFF) == 0 && (int)(v28 >> 12) >= (int)v32) {
      sub_10000A3C4();
    }
    unint64_t v35 = v16 + v101 - 1;
    uint64_t v36 = *(void *)(*((void *)&v99 + 1) + 8 * (v35 / 0x2A));
    unint64_t v37 = v35 % 0x2A;
    uint64_t v38 = v36 + 96 * (v35 % 0x2A);
    unint64_t v40 = (void *)(v38 + 80);
    uint64_t v39 = *(void *)(v38 + 80);
    if (v39) {
      (*(void (**)(uint64_t, unint64_t))(*(void *)v39 + 16))(v39, v36 + 96 * v37);
    }
    switch(*(_DWORD *)v38)
    {
      case 0xFFFFFC18:
        uint64_t v41 = *(void *)(v36 + 96 * v37 + 16);
        if ((a5 & 0x20) != 0 && v41 == a2 || (a5 & 0x1000) != 0 && v41 != v93) {
          goto LABEL_21;
        }
        uint64_t v65 = v41 - *(void *)(v36 + 96 * v37 + 8);
        uint64_t v66 = v94;
        if ((v95 & (v94 >= v65)) == 0) {
          uint64_t v66 = v65;
        }
        if (v66 == v32)
        {
          size_t v67 = (void **)*((void *)&v99 + 1);
          uint64_t v68 = v100;
          if ((void)v100 == *((void *)&v99 + 1))
          {
            *((void *)&v101 + 1) = 0;
            unint64_t v82 = 0;
          }
          else
          {
            int v69 = (void *)(*((void *)&v99 + 1) + 8 * ((unint64_t)v101 / 0x2A));
            int v70 = (void *)(*v69 + 96 * ((unint64_t)v101 % 0x2A));
            unint64_t v71 = *(void *)(*((void *)&v99 + 1) + 8 * ((*((void *)&v101 + 1) + (void)v101) / 0x2AuLL))
                + 96 * ((*((void *)&v101 + 1) + (void)v101) % 0x2AuLL);
            if (v70 != (void *)v71)
            {
              do
              {
                uint64_t v72 = (void *)v70[7];
                if (v72)
                {
                  v70[8] = v72;
                  operator delete(v72);
                }
                uint64_t v73 = (void *)v70[4];
                if (v73)
                {
                  v70[5] = v73;
                  operator delete(v73);
                }
                v70 += 12;
                if ((void *)((char *)v70 - *v69) == (void *)4032)
                {
                  unint64_t v74 = (void *)v69[1];
                  ++v69;
                  int v70 = v74;
                }
              }
              while (v70 != (void *)v71);
              size_t v67 = (void **)*((void *)&v99 + 1);
              uint64_t v68 = v100;
            }
            *((void *)&v101 + 1) = 0;
            unint64_t v82 = v68 - (void)v67;
            if (v82 >= 0x11)
            {
              do
              {
                operator delete(*v67);
                size_t v67 = (void **)(*((void *)&v99 + 1) + 8);
                *((void *)&v99 + 1) = v67;
                unint64_t v82 = v100 - (void)v67;
              }
              while ((void)v100 - (void)v67 > 0x10uLL);
            }
          }
          if (v82 >> 3 == 1)
          {
            uint64_t v83 = 21;
          }
          else
          {
            if (v82 >> 3 != 2)
            {
LABEL_76:
              char v95 = 1;
              uint64_t v94 = v32;
              goto LABEL_8;
            }
            uint64_t v83 = 42;
          }
          *(void *)&long long v101 = v83;
          goto LABEL_76;
        }
        uint64_t v94 = v66;
        unint64_t v75 = *((void *)&v101 + 1) + v101 - 1;
        uint64_t v76 = *(void *)(*((void *)&v99 + 1) + 8 * (v75 / 0x2A));
        unint64_t v77 = v75 % 0x2A;
        xpc_object_t v78 = *(void **)(v76 + 96 * (v75 % 0x2A) + 56);
        if (v78)
        {
          *(void *)(v76 + 96 * v77 + 64) = v78;
          operator delete(v78);
        }
        uint64_t v79 = *(void **)(v76 + 96 * v77 + 32);
        if (v79)
        {
          *(void *)(v76 + 96 * v77 + 40) = v79;
          operator delete(v79);
        }
        uint64_t v80 = 42 * ((uint64_t)(v100 - *((void *)&v99 + 1)) >> 3) - 1;
        long long v81 = v101;
        --*((void *)&v101 + 1);
        if ((void)v100 == *((void *)&v99 + 1)) {
          uint64_t v80 = 0;
        }
        if ((unint64_t)(v80 - (*((void *)&v81 + 1) + v81) + 1) >= 0x54)
        {
          operator delete(*(void **)(v100 - 8));
          *(void *)&long long v100 = v100 - 8;
        }
        char v95 = 1;
LABEL_8:
        uint64_t v16 = *((void *)&v101 + 1);
        if (*((void *)&v101 + 1)) {
          continue;
        }
        if (v95)
        {
          uint64_t v84 = *v92;
          *(void *)uint64_t v84 = a2;
          *(void *)(v84 + 8) = a2 + v94;
          uint64_t v6 = 1;
          *(unsigned char *)(v84 + 16) = 1;
          goto LABEL_79;
        }
        uint64_t v6 = 0;
        uint64_t v85 = (void **)*((void *)&v99 + 1);
        v86 = (void **)v100;
        *((void *)&v101 + 1) = 0;
        unint64_t v87 = v100 - *((void *)&v99 + 1);
        if ((void)v100 - *((void *)&v99 + 1) >= 0x11uLL) {
          goto LABEL_80;
        }
LABEL_81:
        unint64_t v88 = v87 >> 3;
        if (v88 == 1)
        {
          uint64_t v89 = 21;
LABEL_85:
          *(void *)&long long v101 = v89;
        }
        else if (v88 == 2)
        {
          uint64_t v89 = 42;
          goto LABEL_85;
        }
        if (v85 != v86)
        {
          do
          {
            int v90 = *v85++;
            operator delete(v90);
          }
          while (v85 != v86);
          if ((void)v100 != *((void *)&v99 + 1)) {
            *(void *)&long long v100 = v100 + ((*((void *)&v99 + 1) - v100 + 7) & 0xFFFFFFFFFFFFFFF8);
          }
        }
        if ((void)v99) {
          operator delete((void *)v99);
        }
        return v6;
      case 0xFFFFFC19:
      case 0xFFFFFC1E:
      case 0xFFFFFC21:
        goto LABEL_8;
      case 0xFFFFFC1D:
        unint64_t v49 = v101;
        if (!(void)v101)
        {
          sub_10001454C((uint64_t)&v99);
          unint64_t v49 = v101;
        }
        uint64_t v50 = (void *)(*((void *)&v99 + 1) + 8 * (v49 / 0x2A));
        uint64_t v51 = *v50 + 96 * (v49 % 0x2A);
        if ((void)v100 == *((void *)&v99 + 1)) {
          uint64_t v51 = 0;
        }
        if (v51 == *v50) {
          uint64_t v51 = *(v50 - 1) + 4032;
        }
        long long v52 = *(_OWORD *)(v38 + 16);
        *(_OWORD *)(v51 - 96) = *(_OWORD *)v38;
        *(_OWORD *)(v51 - 80) = v52;
        uint64_t v53 = v36 + 96 * v37;
        *(void *)(v51 - 56) = 0;
        *(void *)(v51 - 48) = 0;
        *(void *)(v51 - 64) = 0;
        *(_OWORD *)(v51 - 64) = *(_OWORD *)(v53 + 32);
        *(void *)(v51 - 48) = *(void *)(v53 + 48);
        *(void *)(v53 + 32) = 0;
        *(void *)(v53 + 40) = 0;
        *(void *)(v53 + 48) = 0;
        *(void *)(v51 - 40) = 0;
        *(void *)(v51 - 32) = 0;
        *(void *)(v51 - 24) = 0;
        *(_OWORD *)(v51 - 40) = *(_OWORD *)(v53 + 56);
        *(void *)(v51 - 24) = *(void *)(v53 + 72);
        *(void *)(v53 + 56) = 0;
        *(void *)(v53 + 64) = 0;
        *(void *)(v53 + 72) = 0;
        uint64_t v54 = *v40;
        *(void *)(v51 - 11) = *(void *)(v38 + 85);
        *(void *)(v51 - 16) = v54;
        uint64_t v55 = *((void *)&v101 + 1);
        *(void *)&long long v101 = v101 - 1;
        ++*((void *)&v101 + 1);
        uint64_t v56 = v55 + v101;
        unint64_t v57 = (v55 + (uint64_t)v101) / 0x2AuLL;
        uint64_t v43 = *(void *)(*((void *)&v99 + 1) + 8 * v57);
        unint64_t v44 = v56 - 42 * v57;
        uint64_t v45 = *(void **)(v43 + 96 * v44 + 56);
        if (!v45) {
          goto LABEL_23;
        }
        goto LABEL_22;
      case 0xFFFFFC1F:
LABEL_21:
        unint64_t v42 = *((void *)&v101 + 1) + v101 - 1;
        uint64_t v43 = *(void *)(*((void *)&v99 + 1) + 8 * (v42 / 0x2A));
        unint64_t v44 = v42 % 0x2A;
        uint64_t v45 = *(void **)(v43 + 96 * (v42 % 0x2A) + 56);
        if (v45)
        {
LABEL_22:
          *(void *)(v43 + 96 * v44 + 64) = v45;
          operator delete(v45);
        }
LABEL_23:
        uint64_t v46 = *(void **)(v43 + 96 * v44 + 32);
        if (v46)
        {
          *(void *)(v43 + 96 * v44 + 40) = v46;
          operator delete(v46);
        }
        uint64_t v47 = 42 * ((uint64_t)(v100 - *((void *)&v99 + 1)) >> 3) - 1;
        long long v48 = v101;
        --*((void *)&v101 + 1);
        if ((void)v100 == *((void *)&v99 + 1)) {
          uint64_t v47 = 0;
        }
        if ((unint64_t)(v47 - (*((void *)&v48 + 1) + v48) + 1) >= 0x54)
        {
          operator delete(*(void **)(v100 - 8));
          *(void *)&long long v100 = v100 - 8;
        }
        goto LABEL_8;
      case 0xFFFFFC20:
        *(void *)&long long v58 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v58 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&v98[64] = v58;
        *(_OWORD *)&v98[80] = v58;
        *(_OWORD *)&v98[32] = v58;
        *(_OWORD *)&v98[48] = v58;
        *(_OWORD *)v98 = v58;
        *(_OWORD *)&v98[16] = v58;
        sub_10000A9BC((uint64_t)v98, (long long *)(v36 + 96 * v37));
        (*(void (**)(void, uint64_t, unint64_t))(*(void *)*v40 + 24))(*v40, 1, v36 + 96 * v37);
        (*(void (**)(void, void, unsigned char *))(**(void **)&v98[80] + 24))(*(void *)&v98[80], 0, v98);
        uint64_t v59 = *((void *)&v99 + 1);
        if ((void)v100 == *((void *)&v99 + 1)) {
          uint64_t v60 = 0;
        }
        else {
          uint64_t v60 = 42 * ((uint64_t)(v100 - *((void *)&v99 + 1)) >> 3) - 1;
        }
        unint64_t v61 = *((void *)&v101 + 1) + v101;
        if (v60 == *((void *)&v101 + 1) + (void)v101)
        {
          sub_100013C90((uint64_t)&v99);
          uint64_t v59 = *((void *)&v99 + 1);
          unint64_t v61 = *((void *)&v101 + 1) + v101;
        }
        unint64_t v62 = *(void *)(v59 + 8 * (v61 / 0x2A)) + 96 * (v61 % 0x2A);
        long long v63 = *(_OWORD *)&v98[16];
        *(_OWORD *)unint64_t v62 = *(_OWORD *)v98;
        *(_OWORD *)(v62 + 16) = v63;
        *(void *)(v62 + 40) = 0;
        *(void *)(v62 + 48) = 0;
        *(void *)(v62 + 32) = 0;
        *(_OWORD *)(v62 + 32) = *(_OWORD *)&v98[32];
        *(void *)(v62 + 48) = *(void *)&v98[48];
        memset(&v98[32], 0, 24);
        *(void *)(v62 + 56) = 0;
        *(void *)(v62 + 64) = 0;
        *(void *)(v62 + 72) = 0;
        *(_OWORD *)(v62 + 56) = *(_OWORD *)&v98[56];
        *(void *)(v62 + 72) = *(void *)&v98[72];
        memset(&v98[56], 0, 24);
        uint64_t v64 = *(void *)&v98[80];
        *(void *)(v62 + 85) = *(void *)&v98[85];
        *(void *)(v62 + 80) = v64;
        ++*((void *)&v101 + 1);
        if (*(void *)&v98[56])
        {
          *(void *)&v98[64] = *(void *)&v98[56];
          operator delete(*(void **)&v98[56]);
        }
        if (*(void *)&v98[32])
        {
          *(void *)&v98[40] = *(void *)&v98[32];
          operator delete(*(void **)&v98[32]);
        }
        goto LABEL_8;
      default:
        sub_10000A41C();
    }
  }
}

void sub_10001339C(_Unwind_Exception *a1)
{
  sub_100013C18((void **)(v1 - 144));
  _Unwind_Resume(a1);
}

void sub_1000133B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  sub_10000A380((uint64_t *)va);
  sub_100013C18((void **)(v9 - 144));
  _Unwind_Resume(a1);
}

void sub_1000133F8(_Unwind_Exception *a1)
{
  sub_100013C18((void **)(v1 - 144));
  _Unwind_Resume(a1);
}

void sub_10001340C(_Unwind_Exception *a1)
{
  sub_100013C18((void **)(v1 - 144));
  _Unwind_Resume(a1);
}

uint64_t sub_100013448(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  uint64_t v68 = 0;
  int v69 = 0;
  unint64_t v70 = 0;
  *(_DWORD *)&v67[36] = -1431655766;
  *(void *)uint64_t v65 = 0xAAAAAAAA00000000;
  memset(&v65[8], 0, 32);
  *(_OWORD *)uint64_t v66 = 0u;
  memset(v67, 0, 36);
  uint64_t v6 = *(void *)(a1 + 40);
  if (!v6) {
    goto LABEL_63;
  }
  *((void *)&v63 + 1) = a3;
  unint64_t v64 = 0xAAAAAAAAAAAAAA00;
  *(void *)&long long v63 = a3;
  *(_DWORD *)unint64_t v62 = 0;
  memset(&v62[8], 0, 85);
  int v69 = sub_10000A4F8((void **)&v68, (uint64_t)v62);
  if (*(void *)&v62[56])
  {
    *(void *)&v62[64] = *(void *)&v62[56];
    operator delete(*(void **)&v62[56]);
  }
  if (*(void *)&v62[32])
  {
    *(void *)&v62[40] = *(void *)&v62[32];
    operator delete(*(void **)&v62[32]);
  }
  uint64_t v13 = v69;
  *((_DWORD *)v69 - 24) = 0;
  *((void *)v13 - 11) = a2;
  *((void *)v13 - 10) = a2;
  *((void *)v13 - 9) = a3;
  uint64_t v14 = *((void *)v13 - 8);
  unint64_t v15 = *(unsigned int *)(a1 + 28);
  unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((*((void *)v13 - 7) - v14) >> 3);
  if (v15 <= v16)
  {
    if (v15 < v16) {
      *((void *)v13 - 7) = v14 + 24 * v15;
    }
  }
  else
  {
    sub_10000A6CC((void **)v13 - 8, v15 - v16, &v63);
    uint64_t v13 = v69;
  }
  uint64_t v17 = *((void *)v13 - 5);
  unint64_t v18 = *(unsigned int *)(a1 + 32);
  unint64_t v19 = (*((void *)v13 - 4) - v17) >> 4;
  long long v58 = a4;
  if (v18 <= v19)
  {
    if (v18 < v19) {
      *((void *)v13 - 4) = v17 + 16 * v18;
    }
  }
  else
  {
    sub_10000A880((char **)v13 - 5, v18 - v19);
    uint64_t v13 = v69;
  }
  char v61 = 0;
  unsigned int v20 = 0;
  uint64_t v21 = a3 - a2;
  *((void *)v13 - 2) = v6;
  *((_DWORD *)v13 - 2) = a5;
  *(v13 - 4) = a6;
  uint64_t v60 = 0;
  uint64_t v59 = a3;
  do
  {
    BOOL v22 = (++v20 & 0xFFF) != 0 || (int)(v20 >> 12) < (int)v21;
    if (!v22) {
      sub_10000A3C4();
    }
    unint64_t v24 = v13 - 16;
    uint64_t v23 = *((void *)v13 - 2);
    uint64_t v25 = v13 - 96;
    if (v23) {
      (*(void (**)(uint64_t, char *))(*(void *)v23 + 16))(v23, v13 - 96);
    }
    switch(*(_DWORD *)v25)
    {
      case 0xFFFFFC18:
        uint64_t v26 = *((void *)v13 - 10);
        if ((a5 & 0x20) != 0 && v26 == a2 || (a5 & 0x1000) != 0 && v26 != v59) {
          goto LABEL_29;
        }
        uint64_t v34 = v26 - *((void *)v13 - 11);
        uint64_t v35 = v60;
        if ((v61 & (v60 >= v34)) == 0)
        {
          long long v36 = *((_OWORD *)v13 - 5);
          *(_OWORD *)uint64_t v65 = *(_OWORD *)v25;
          *(_OWORD *)&v65[16] = v36;
          if (v65 != v25)
          {
            sub_1000148F0((char **)&v65[32], *((char **)v13 - 8), *((char **)v13 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v13 - 7) - *((void *)v13 - 8)) >> 3));
            sub_100014AF0((uint64_t)v67, *((const double **)v13 - 5), *((const double **)v13 - 4), (uint64_t)(*((void *)v13 - 4) - *((void *)v13 - 5)) >> 4);
          }
          uint64_t v37 = *(void *)v24;
          *(void *)&v67[29] = *(void *)(v13 - 11);
          *(void *)&v67[24] = v37;
          uint64_t v35 = v34;
        }
        uint64_t v38 = v69;
        if (v35 == v21)
        {
          uint64_t v39 = v68;
          while (v38 != v39)
          {
            unint64_t v40 = (void *)*((void *)v38 - 5);
            if (v40)
            {
              *((void *)v38 - 4) = v40;
              operator delete(v40);
            }
            uint64_t v41 = (void *)*((void *)v38 - 8);
            if (v41)
            {
              *((void *)v38 - 7) = v41;
              operator delete(v41);
            }
            v38 -= 96;
          }
          int v69 = v39;
          char v61 = 1;
          uint64_t v60 = v21;
        }
        else
        {
          uint64_t v60 = v35;
          unint64_t v42 = (void *)*((void *)v69 - 5);
          if (v42)
          {
            *((void *)v69 - 4) = v42;
            operator delete(v42);
          }
          uint64_t v43 = (void *)*((void *)v38 - 8);
          if (v43)
          {
            *((void *)v38 - 7) = v43;
            operator delete(v43);
          }
          int v69 = v38 - 96;
          char v61 = 1;
        }
        break;
      case 0xFFFFFC1D:
      case 0xFFFFFC1E:
      case 0xFFFFFC21:
        break;
      case 0xFFFFFC1F:
LABEL_29:
        unint64_t v27 = v69;
        unsigned int v28 = (void *)*((void *)v69 - 5);
        if (v28)
        {
          *((void *)v69 - 4) = v28;
          operator delete(v28);
        }
        unint64_t v29 = (void *)*((void *)v27 - 8);
        if (v29)
        {
          *((void *)v27 - 7) = v29;
          operator delete(v29);
        }
        int v69 = v27 - 96;
        break;
      case 0xFFFFFC20:
        *(void *)&long long v30 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&v62[64] = v30;
        *(_OWORD *)&v62[80] = v30;
        *(_OWORD *)&v62[32] = v30;
        *(_OWORD *)&v62[48] = v30;
        *(_OWORD *)unint64_t v62 = v30;
        *(_OWORD *)&v62[16] = v30;
        sub_10000A9BC((uint64_t)v62, (long long *)v13 - 6);
        (*(void (**)(void, uint64_t, char *))(**(void **)v24 + 24))(*(void *)v24, 1, v13 - 96);
        (*(void (**)(void, void, unsigned char *))(**(void **)&v62[80] + 24))(*(void *)&v62[80], 0, v62);
        unint64_t v31 = v69;
        if ((unint64_t)v69 >= v70)
        {
          int v69 = sub_10000A4F8((void **)&v68, (uint64_t)v62);
          if (*(void *)&v62[56])
          {
            *(void *)&v62[64] = *(void *)&v62[56];
            operator delete(*(void **)&v62[56]);
          }
        }
        else
        {
          long long v32 = *(_OWORD *)&v62[16];
          *(_OWORD *)int v69 = *(_OWORD *)v62;
          *((_OWORD *)v31 + 1) = v32;
          *((void *)v31 + 4) = 0;
          *((void *)v31 + 5) = 0;
          *((void *)v31 + 6) = 0;
          *((void *)v31 + 7) = 0;
          *((_OWORD *)v31 + 2) = *(_OWORD *)&v62[32];
          *((void *)v31 + 6) = *(void *)&v62[48];
          memset(&v62[32], 0, 24);
          *((void *)v31 + 8) = 0;
          *((void *)v31 + 9) = 0;
          *(_OWORD *)(v31 + 56) = *(_OWORD *)&v62[56];
          *((void *)v31 + 9) = *(void *)&v62[72];
          memset(&v62[56], 0, 24);
          uint64_t v33 = *(void *)&v62[80];
          *(void *)(v31 + 85) = *(void *)&v62[85];
          *((void *)v31 + 10) = v33;
          int v69 = v31 + 96;
        }
        if (*(void *)&v62[32])
        {
          *(void *)&v62[40] = *(void *)&v62[32];
          operator delete(*(void **)&v62[32]);
        }
        break;
      default:
        sub_10000A41C();
    }
    uint64_t v13 = v69;
  }
  while (v68 != v69);
  if ((v61 & 1) == 0)
  {
LABEL_63:
    uint64_t v50 = 0;
    uint64_t v51 = *(void **)v67;
    if (!*(void *)v67) {
      goto LABEL_65;
    }
    goto LABEL_64;
  }
  uint64_t v44 = *v58;
  *(void *)uint64_t v44 = a2;
  *(void *)(v44 + 8) = a2 + v60;
  *(unsigned char *)(v44 + 16) = 1;
  if (v66[0] != *(void **)&v65[32])
  {
    unint64_t v45 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v66[0] - *(void *)&v65[32]) >> 3);
    uint64_t v46 = (unsigned char *)(*(void *)&v65[32] + 16);
    unsigned int v47 = 1;
    do
    {
      uint64_t v48 = v44 + 24 * v47;
      *(_OWORD *)uint64_t v48 = *((_OWORD *)v46 - 1);
      char v49 = *v46;
      v46 += 24;
      *(unsigned char *)(v48 + 16) = v49;
      BOOL v22 = v45 > v47++;
    }
    while (v22);
  }
  uint64_t v50 = 1;
  uint64_t v51 = *(void **)v67;
  if (*(void *)v67)
  {
LABEL_64:
    *(void *)&v67[8] = v51;
    operator delete(v51);
  }
LABEL_65:
  if (*(void *)&v65[32])
  {
    v66[0] = *(void **)&v65[32];
    operator delete(*(void **)&v65[32]);
  }
  long long v52 = v68;
  if (v68)
  {
    uint64_t v53 = v69;
    uint64_t v54 = v68;
    if (v69 != v68)
    {
      do
      {
        uint64_t v55 = (void *)*((void *)v53 - 5);
        if (v55)
        {
          *((void *)v53 - 4) = v55;
          operator delete(v55);
        }
        uint64_t v56 = (void *)*((void *)v53 - 8);
        if (v56)
        {
          *((void *)v53 - 7) = v56;
          operator delete(v56);
        }
        v53 -= 96;
      }
      while (v53 != v52);
      uint64_t v54 = v68;
    }
    int v69 = v52;
    operator delete(v54);
  }
  return v50;
}

void sub_100013A40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33)
{
  sub_10000A380(&a33);
  sub_10000A474((void **)(v33 - 120));
  _Unwind_Resume(a1);
}

void sub_100013ABC(void *a1)
{
  uint64_t v2 = (void **)a1[1];
  uint64_t v3 = (void **)a1[2];
  if (v3 == v2)
  {
    a1[5] = 0;
    unint64_t v11 = 0;
  }
  else
  {
    unint64_t v4 = a1[4];
    signed __int8 v5 = &v2[v4 / 0x2A];
    uint64_t v6 = (char *)*v5 + 96 * (v4 % 0x2A);
    unint64_t v7 = (unint64_t)v2[(a1[5] + v4) / 0x2A] + 96 * ((a1[5] + v4) % 0x2A);
    if (v6 != (char *)v7)
    {
      do
      {
        uint64_t v8 = (void *)*((void *)v6 + 7);
        if (v8)
        {
          *((void *)v6 + 8) = v8;
          operator delete(v8);
        }
        uint64_t v9 = (void *)*((void *)v6 + 4);
        if (v9)
        {
          *((void *)v6 + 5) = v9;
          operator delete(v9);
        }
        v6 += 96;
        if (v6 - (unsigned char *)*v5 == 4032)
        {
          uint64_t v10 = (char *)v5[1];
          ++v5;
          uint64_t v6 = v10;
        }
      }
      while (v6 != (char *)v7);
      uint64_t v2 = (void **)a1[1];
      uint64_t v3 = (void **)a1[2];
    }
    a1[5] = 0;
    unint64_t v11 = (char *)v3 - (char *)v2;
    if (v11 >= 0x11)
    {
      do
      {
        operator delete(*v2);
        uint64_t v12 = a1[2];
        uint64_t v2 = (void **)(a1[1] + 8);
        a1[1] = v2;
        unint64_t v11 = v12 - (void)v2;
      }
      while (v11 > 0x10);
    }
  }
  if (v11 >> 3 == 1)
  {
    uint64_t v13 = 21;
  }
  else
  {
    if (v11 >> 3 != 2) {
      return;
    }
    uint64_t v13 = 42;
  }
  a1[4] = v13;
}

void **sub_100013C18(void **a1)
{
  sub_100013ABC(a1);
  uint64_t v2 = (void **)a1[1];
  uint64_t v3 = (void **)a1[2];
  if (v2 != v3)
  {
    do
    {
      unint64_t v4 = *v2++;
      operator delete(v4);
    }
    while (v2 != v3);
    uint64_t v6 = a1[1];
    signed __int8 v5 = a1[2];
    if (v5 != v6) {
      a1[2] = &v5[(v6 - v5 + 7) & 0xFFFFFFFFFFFFFFF8];
    }
  }
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void sub_100013C90(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = v2 >= 0x2A;
  unint64_t v4 = v2 - 42;
  if (v3)
  {
    *(void *)(a1 + 32) = v4;
    uint64_t v6 = *(void **)(a1 + 8);
    signed __int8 v5 = *(char **)(a1 + 16);
    unint64_t v7 = (char *)(v6 + 1);
    uint64_t v8 = *v6;
    *(void *)(a1 + 8) = v6 + 1;
    if (v5 != *(char **)(a1 + 24))
    {
LABEL_78:
      *(void *)signed __int8 v5 = v8;
      *(void *)(a1 + 16) += 8;
      return;
    }
    uint64_t v9 = *(char **)a1;
    uint64_t v10 = (uint64_t)&v7[-*(void *)a1];
    if ((unint64_t)v7 <= *(void *)a1)
    {
      unint64_t v32 = (v5 - v9) >> 2;
      if (v5 == v9) {
        unint64_t v32 = 1;
      }
      if (!(v32 >> 61))
      {
        unint64_t v33 = v32 >> 2;
        uint64_t v34 = 8 * v32;
        uint64_t v35 = (char *)operator new(8 * v32);
        long long v36 = &v35[8 * v33];
        uint64_t v37 = &v35[v34];
        int64_t v39 = v5 - v7;
        BOOL v38 = v5 == v7;
        signed __int8 v5 = v36;
        if (!v38)
        {
          signed __int8 v5 = &v36[v39 & 0xFFFFFFFFFFFFFFF8];
          unint64_t v40 = v39 - 8;
          if ((unint64_t)(v39 - 8) >= 0x38)
          {
            uint64_t v73 = &v35[8 * v33];
            uint64_t v41 = v73;
            if ((unint64_t)(v73 - v7) >= 0x20)
            {
              uint64_t v74 = (v40 >> 3) + 1;
              uint64_t v75 = 8 * (v74 & 0x3FFFFFFFFFFFFFFCLL);
              uint64_t v41 = &v36[v75];
              v7 += v75;
              uint64_t v76 = (long long *)(v6 + 3);
              unint64_t v77 = v73 + 16;
              uint64_t v78 = v74 & 0x3FFFFFFFFFFFFFFCLL;
              do
              {
                long long v79 = *v76;
                *(v77 - 1) = *(v76 - 1);
                *unint64_t v77 = v79;
                v76 += 2;
                v77 += 2;
                v78 -= 4;
              }
              while (v78);
              if (v74 == (v74 & 0x3FFFFFFFFFFFFFFCLL)) {
                goto LABEL_76;
              }
            }
          }
          else
          {
            uint64_t v41 = &v35[8 * v33];
          }
          do
          {
            uint64_t v80 = *(void *)v7;
            v7 += 8;
            *(void *)uint64_t v41 = v80;
            v41 += 8;
          }
          while (v41 != v5);
        }
        goto LABEL_76;
      }
LABEL_87:
      sub_100006E74();
    }
LABEL_5:
    uint64_t v11 = v10 >> 3;
    if (v11 >= -1) {
      uint64_t v12 = v11 + 1;
    }
    else {
      uint64_t v12 = v11 + 2;
    }
    uint64_t v13 = v12 >> 1;
    uint64_t v14 = -v13;
    unint64_t v15 = &v7[-8 * v13];
    int64_t v16 = v5 - v7;
    if (v5 != v7)
    {
      memmove(&v7[-8 * v13], v7, v5 - v7);
      unint64_t v7 = *(char **)(a1 + 8);
    }
    signed __int8 v5 = &v15[v16];
    *(void *)(a1 + 8) = &v7[8 * v14];
    *(void *)(a1 + 16) = &v15[v16];
    goto LABEL_78;
  }
  uint64_t v18 = *(void *)(a1 + 16);
  uint64_t v17 = *(void *)(a1 + 24);
  uint64_t v19 = *(void *)(a1 + 8);
  uint64_t v20 = v18 - v19;
  uint64_t v21 = (v18 - v19) >> 3;
  uint64_t v22 = v17 - *(void *)a1;
  if (v21 < (unint64_t)(v22 >> 3))
  {
    if (v17 != v18)
    {
      uint64_t v89 = operator new(0xFC0uLL);
      sub_100014220((char **)a1, &v89);
      return;
    }
    uint64_t v89 = operator new(0xFC0uLL);
    sub_1000143B0((void **)a1, &v89);
    unint64_t v42 = *(void **)(a1 + 8);
    signed __int8 v5 = *(char **)(a1 + 16);
    unint64_t v7 = (char *)(v42 + 1);
    uint64_t v8 = *v42;
    *(void *)(a1 + 8) = v42 + 1;
    if (v5 != *(char **)(a1 + 24)) {
      goto LABEL_78;
    }
    uint64_t v9 = *(char **)a1;
    uint64_t v10 = (uint64_t)&v7[-*(void *)a1];
    if ((unint64_t)v7 <= *(void *)a1)
    {
      unint64_t v43 = (v5 - v9) >> 2;
      if (v5 == v9) {
        unint64_t v43 = 1;
      }
      if (!(v43 >> 61))
      {
        unint64_t v44 = v43 >> 2;
        uint64_t v45 = 8 * v43;
        uint64_t v35 = (char *)operator new(8 * v43);
        long long v36 = &v35[8 * v44];
        uint64_t v37 = &v35[v45];
        int64_t v46 = v5 - v7;
        BOOL v38 = v5 == v7;
        signed __int8 v5 = v36;
        if (!v38)
        {
          signed __int8 v5 = &v36[v46 & 0xFFFFFFFFFFFFFFF8];
          unint64_t v47 = v46 - 8;
          if ((unint64_t)(v46 - 8) >= 0x38)
          {
            long long v81 = &v35[8 * v44];
            uint64_t v48 = v81;
            if ((unint64_t)(v81 - v7) >= 0x20)
            {
              uint64_t v82 = (v47 >> 3) + 1;
              uint64_t v83 = 8 * (v82 & 0x3FFFFFFFFFFFFFFCLL);
              uint64_t v48 = &v36[v83];
              v7 += v83;
              uint64_t v84 = (long long *)(v42 + 3);
              uint64_t v85 = v81 + 16;
              uint64_t v86 = v82 & 0x3FFFFFFFFFFFFFFCLL;
              do
              {
                long long v87 = *v84;
                *(v85 - 1) = *(v84 - 1);
                *uint64_t v85 = v87;
                v84 += 2;
                v85 += 2;
                v86 -= 4;
              }
              while (v86);
              if (v82 == (v82 & 0x3FFFFFFFFFFFFFFCLL)) {
                goto LABEL_76;
              }
            }
          }
          else
          {
            uint64_t v48 = &v35[8 * v44];
          }
          do
          {
            uint64_t v88 = *(void *)v7;
            v7 += 8;
            *(void *)uint64_t v48 = v88;
            v48 += 8;
          }
          while (v48 != v5);
        }
LABEL_76:
        *(void *)a1 = v35;
        *(void *)(a1 + 8) = v36;
        *(void *)(a1 + 16) = v5;
        *(void *)(a1 + 24) = v37;
        if (v9)
        {
          operator delete(v9);
          signed __int8 v5 = *(char **)(a1 + 16);
        }
        goto LABEL_78;
      }
      goto LABEL_87;
    }
    goto LABEL_5;
  }
  uint64_t v23 = v22 >> 2;
  if (v17 == *(void *)a1) {
    unint64_t v24 = 1;
  }
  else {
    unint64_t v24 = v23;
  }
  if (v24 >> 61) {
    goto LABEL_87;
  }
  uint64_t v25 = (char *)operator new(8 * v24);
  uint64_t v26 = operator new(0xFC0uLL);
  unint64_t v27 = &v25[8 * v21];
  unsigned int v28 = &v25[8 * v24];
  if (v21 == v24)
  {
    long long v30 = v26;
    if (v20 < 1)
    {
      if (v18 == v19) {
        unint64_t v49 = 1;
      }
      else {
        unint64_t v49 = v20 >> 2;
      }
      if (v49 >> 61) {
        sub_100006E74();
      }
      unint64_t v27 = (char *)operator new(8 * v49);
      unsigned int v28 = &v27[8 * v49];
      operator delete(v25);
      uint64_t v50 = *(void *)(a1 + 8);
      uint64_t v18 = *(void *)(a1 + 16);
      uint64_t v25 = v27;
      *(void *)unint64_t v27 = v30;
      unint64_t v29 = v27 + 8;
      if (v18 == v50) {
        goto LABEL_45;
      }
    }
    else
    {
      unint64_t v31 = v21 + 2;
      if (v21 >= -1) {
        unint64_t v31 = v21 + 1;
      }
      v27 -= 8 * (v31 >> 1);
      *(void *)unint64_t v27 = v26;
      unint64_t v29 = v27 + 8;
      if (v18 == v19) {
        goto LABEL_45;
      }
    }
    goto LABEL_51;
  }
  *(void *)unint64_t v27 = v26;
  unint64_t v29 = v27 + 8;
  if (v18 != v19)
  {
    do
    {
LABEL_51:
      if (v27 == v25)
      {
        if (v29 >= v28)
        {
          if (v28 == v25) {
            unint64_t v57 = 1;
          }
          else {
            unint64_t v57 = (v28 - v25) >> 2;
          }
          if (v57 >> 61) {
            sub_100006E74();
          }
          long long v58 = (char *)operator new(8 * v57);
          uint64_t v59 = v58;
          unint64_t v60 = (v57 + 3) >> 2;
          unint64_t v27 = &v58[8 * v60];
          int64_t v61 = v29 - v25;
          BOOL v38 = v29 == v25;
          unint64_t v29 = v27;
          if (!v38)
          {
            unint64_t v29 = &v27[v61 & 0xFFFFFFFFFFFFFFF8];
            unint64_t v62 = v61 - 8;
            long long v63 = &v58[8 * v60];
            unint64_t v64 = v25;
            if (v62 < 0x38) {
              goto LABEL_91;
            }
            uint64_t v65 = 8 * v60;
            long long v63 = &v58[8 * v60];
            unint64_t v64 = v25;
            if ((unint64_t)(v63 - v25) < 0x20) {
              goto LABEL_91;
            }
            uint64_t v66 = (v62 >> 3) + 1;
            uint64_t v67 = 8 * (v66 & 0x3FFFFFFFFFFFFFFCLL);
            long long v63 = &v27[v67];
            unint64_t v64 = &v25[v67];
            uint64_t v68 = (long long *)(v25 + 16);
            int v69 = &v58[v65 + 16];
            uint64_t v70 = v66 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              long long v71 = *v68;
              *((_OWORD *)v69 - 1) = *(v68 - 1);
              *(_OWORD *)int v69 = v71;
              v68 += 2;
              v69 += 32;
              v70 -= 4;
            }
            while (v70);
            if (v66 != (v66 & 0x3FFFFFFFFFFFFFFCLL))
            {
LABEL_91:
              do
              {
                uint64_t v72 = *(void *)v64;
                v64 += 8;
                *(void *)long long v63 = v72;
                v63 += 8;
              }
              while (v63 != v29);
            }
          }
          unsigned int v28 = &v58[8 * v57];
          operator delete(v25);
          uint64_t v25 = v59;
        }
        else
        {
          uint64_t v53 = (v28 - v29) >> 3;
          if (v53 >= -1) {
            uint64_t v54 = v53 + 1;
          }
          else {
            uint64_t v54 = v53 + 2;
          }
          uint64_t v55 = v54 >> 1;
          unint64_t v27 = &v25[8 * (v54 >> 1)];
          uint64_t v56 = v25;
          if (v29 != v25)
          {
            memmove(v27, v25, v29 - v25);
            uint64_t v56 = v29;
          }
          unint64_t v29 = (char *)v56 + 8 * v55;
        }
      }
      uint64_t v52 = *(void *)(v18 - 8);
      v18 -= 8;
      *((void *)v27 - 1) = v52;
      v27 -= 8;
    }
    while (v18 != *(void *)(a1 + 8));
  }
LABEL_45:
  uint64_t v51 = *(char **)a1;
  *(void *)a1 = v25;
  *(void *)(a1 + 8) = v27;
  *(void *)(a1 + 16) = v29;
  *(void *)(a1 + 24) = v28;
  if (v51)
  {
    operator delete(v51);
  }
}

void sub_1000141EC(_Unwind_Exception *a1)
{
  operator delete(v2);
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_100014220(char **a1, void *a2)
{
  unint64_t v4 = a1[2];
  if (v4 != a1[3]) {
    goto LABEL_22;
  }
  signed __int8 v5 = *a1;
  uint64_t v6 = a1[1];
  if (v6 > *a1)
  {
    uint64_t v7 = (v6 - *a1) >> 3;
    if (v7 >= -1) {
      uint64_t v8 = v7 + 1;
    }
    else {
      uint64_t v8 = v7 + 2;
    }
    uint64_t v9 = v8 >> 1;
    uint64_t v10 = -v9;
    uint64_t v11 = &v6[-8 * v9];
    int64_t v12 = v4 - v6;
    if (v4 != v6)
    {
      memmove(&v6[-8 * v9], a1[1], v4 - v6);
      unint64_t v4 = a1[1];
    }
    uint64_t v13 = &v4[8 * v10];
    unint64_t v4 = &v11[v12];
    a1[1] = v13;
    a1[2] = &v11[v12];
    goto LABEL_22;
  }
  unint64_t v14 = (v4 - v5) >> 2;
  if (v4 == v5) {
    unint64_t v14 = 1;
  }
  if (v14 >> 61) {
    sub_100006E74();
  }
  unint64_t v15 = v14 >> 2;
  uint64_t v16 = 8 * v14;
  uint64_t v17 = (char *)operator new(8 * v14);
  uint64_t v18 = &v17[8 * v15];
  int64_t v20 = v4 - v6;
  BOOL v19 = v4 == v6;
  unint64_t v4 = v18;
  if (!v19)
  {
    unint64_t v4 = &v18[v20 & 0xFFFFFFFFFFFFFFF8];
    unint64_t v21 = v20 - 8;
    if ((unint64_t)(v20 - 8) < 0x38)
    {
      uint64_t v22 = &v17[8 * v15];
      do
      {
LABEL_19:
        uint64_t v31 = *(void *)v6;
        v6 += 8;
        *(void *)uint64_t v22 = v31;
        v22 += 8;
      }
      while (v22 != v4);
      goto LABEL_20;
    }
    uint64_t v23 = &v17[8 * v15];
    uint64_t v22 = v23;
    if ((unint64_t)(v23 - v6) < 0x20) {
      goto LABEL_19;
    }
    uint64_t v24 = (v21 >> 3) + 1;
    uint64_t v25 = 8 * (v24 & 0x3FFFFFFFFFFFFFFCLL);
    uint64_t v22 = &v18[v25];
    uint64_t v26 = &v6[v25];
    unint64_t v27 = (long long *)(v6 + 16);
    unsigned int v28 = v23 + 16;
    uint64_t v29 = v24 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      long long v30 = *v27;
      *(v28 - 1) = *(v27 - 1);
      _OWORD *v28 = v30;
      v27 += 2;
      v28 += 2;
      v29 -= 4;
    }
    while (v29);
    uint64_t v6 = v26;
    if (v24 != (v24 & 0x3FFFFFFFFFFFFFFCLL)) {
      goto LABEL_19;
    }
  }
LABEL_20:
  *a1 = v17;
  a1[1] = v18;
  a1[2] = v4;
  a1[3] = &v17[v16];
  if (v5)
  {
    operator delete(v5);
    unint64_t v4 = a1[2];
  }
LABEL_22:
  *(void *)unint64_t v4 = *a2;
  a1[2] += 8;
}

void sub_1000143B0(void **a1, void *a2)
{
  unint64_t v4 = (char *)a1[1];
  if (v4 == *a1)
  {
    uint64_t v7 = a1[2];
    uint64_t v6 = a1[3];
    if (v7 >= v6)
    {
      uint64_t v13 = v6 - v4;
      BOOL v12 = v13 == 0;
      unint64_t v14 = v13 >> 2;
      if (v12) {
        unint64_t v14 = 1;
      }
      if (v14 >> 61) {
        sub_100006E74();
      }
      unint64_t v15 = (v14 + 3) >> 2;
      uint64_t v16 = 8 * v14;
      uint64_t v17 = (char *)operator new(8 * v14);
      signed __int8 v5 = &v17[8 * v15];
      uint64_t v18 = v5;
      uint64_t v19 = v7 - v4;
      if (v7 != v4)
      {
        uint64_t v18 = &v5[v19 & 0xFFFFFFFFFFFFFFF8];
        unint64_t v20 = v19 - 8;
        unint64_t v21 = &v17[8 * v15];
        uint64_t v22 = v4;
        if (v20 < 0x38) {
          goto LABEL_27;
        }
        uint64_t v23 = &v17[8 * v15];
        unint64_t v21 = v23;
        uint64_t v22 = v4;
        if ((unint64_t)(v23 - v4) < 0x20) {
          goto LABEL_27;
        }
        uint64_t v24 = (v20 >> 3) + 1;
        uint64_t v25 = 8 * (v24 & 0x3FFFFFFFFFFFFFFCLL);
        unint64_t v21 = &v5[v25];
        uint64_t v22 = &v4[v25];
        uint64_t v26 = (long long *)(v4 + 16);
        unint64_t v27 = v23 + 16;
        uint64_t v28 = v24 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v29 = *v26;
          *(v27 - 1) = *(v26 - 1);
          *unint64_t v27 = v29;
          v26 += 2;
          v27 += 2;
          v28 -= 4;
        }
        while (v28);
        if (v24 != (v24 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_27:
          do
          {
            uint64_t v30 = *(void *)v22;
            v22 += 8;
            *(void *)unint64_t v21 = v30;
            v21 += 8;
          }
          while (v21 != v18);
        }
      }
      *a1 = v17;
      a1[1] = v5;
      a1[2] = v18;
      a1[3] = &v17[v16];
      if (v4)
      {
        operator delete(v4);
        signed __int8 v5 = (char *)a1[1];
      }
    }
    else
    {
      uint64_t v8 = (v6 - v7) >> 3;
      if (v8 >= -1) {
        uint64_t v9 = v8 + 1;
      }
      else {
        uint64_t v9 = v8 + 2;
      }
      uint64_t v10 = v9 >> 1;
      uint64_t v11 = &v7[8 * (v9 >> 1)];
      signed __int8 v5 = &v11[-(v7 - v4)];
      if (v7 != v4)
      {
        memmove(&v11[-(v7 - v4)], v4, v7 - v4);
        unint64_t v4 = (char *)a1[2];
      }
      a1[1] = v5;
      a1[2] = &v4[8 * v10];
    }
  }
  else
  {
    signed __int8 v5 = (char *)a1[1];
  }
  *((void *)v5 - 1) = *a2;
  a1[1] = (char *)a1[1] - 8;
}

void sub_10001454C(uint64_t a1)
{
  BOOL v3 = *(uint64_t **)(a1 + 8);
  unint64_t v2 = *(uint64_t **)(a1 + 16);
  unint64_t v4 = v2 - v3;
  if (v2 == v3) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = 42 * v4 - 1;
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if ((unint64_t)(v5 - (*(void *)(a1 + 40) + v6)) >= 0x2A)
  {
    *(void *)(a1 + 32) = v6 + 42;
    unint64_t v47 = (void *)*(v2 - 1);
    *(void *)(a1 + 16) = v2 - 1;
    sub_1000143B0((void **)a1, &v47);
    return;
  }
  uint64_t v7 = *(uint64_t **)(a1 + 24);
  uint64_t v8 = *(uint64_t **)a1;
  uint64_t v9 = (uint64_t)v7 - *(void *)a1;
  if (v4 < v9 >> 3)
  {
    if (v3 == v8)
    {
      unint64_t v47 = operator new(0xFC0uLL);
      sub_100014220((char **)a1, &v47);
      uint64_t v43 = *(void *)(a1 + 16);
      unint64_t v47 = *(void **)(v43 - 8);
      *(void *)(a1 + 16) = v43 - 8;
      sub_1000143B0((void **)a1, &v47);
      if (*(void *)(a1 + 16) - *(void *)(a1 + 8) == 8) {
        goto LABEL_9;
      }
    }
    else
    {
      unint64_t v47 = operator new(0xFC0uLL);
      sub_1000143B0((void **)a1, &v47);
      if (*(void *)(a1 + 16) - *(void *)(a1 + 8) == 8)
      {
LABEL_9:
        uint64_t v10 = 21;
LABEL_45:
        *(void *)(a1 + 32) = v10;
        return;
      }
    }
    uint64_t v10 = *(void *)(a1 + 32) + 42;
    goto LABEL_45;
  }
  if (v7 == v8) {
    unint64_t v11 = 1;
  }
  else {
    unint64_t v11 = v9 >> 2;
  }
  if (v11 >> 61) {
    sub_100006E74();
  }
  BOOL v12 = (char *)operator new(8 * v11);
  uint64_t v13 = operator new(0xFC0uLL);
  unint64_t v14 = v13;
  if (v11)
  {
    unint64_t v15 = &v12[8 * v11];
    *(void *)BOOL v12 = v13;
    uint64_t v16 = v12 + 8;
    if (v3 != v2)
    {
LABEL_16:
      uint64_t v17 = v12;
      while (1)
      {
        if (v16 == v15)
        {
          if (v17 <= v12)
          {
            if (v16 == v12) {
              unint64_t v26 = 1;
            }
            else {
              unint64_t v26 = (v16 - v12) >> 2;
            }
            if (v26 >> 61) {
              sub_100006E74();
            }
            unint64_t v27 = (char *)operator new(8 * v26);
            uint64_t v28 = v27;
            unint64_t v29 = v26 >> 2;
            uint64_t v18 = &v27[8 * (v26 >> 2)];
            int64_t v31 = v16 - v17;
            BOOL v30 = v16 == v17;
            uint64_t v16 = v18;
            if (!v30)
            {
              uint64_t v16 = &v18[v31 & 0xFFFFFFFFFFFFFFF8];
              unint64_t v32 = v31 - 8;
              if (v32 < 0x38 || (uint64_t v33 = 8 * v29, (unint64_t)(&v27[8 * v29] - v17) < 0x20))
              {
                uint64_t v34 = &v27[8 * (v26 >> 2)];
                uint64_t v35 = v17;
                goto LABEL_35;
              }
              uint64_t v37 = (v32 >> 3) + 1;
              uint64_t v38 = 8 * (v37 & 0x3FFFFFFFFFFFFFFCLL);
              uint64_t v34 = &v18[v38];
              uint64_t v35 = &v17[v38];
              int64_t v39 = (long long *)(v17 + 16);
              unint64_t v40 = &v27[v33 + 16];
              uint64_t v41 = v37 & 0x3FFFFFFFFFFFFFFCLL;
              do
              {
                long long v42 = *v39;
                *((_OWORD *)v40 - 1) = *(v39 - 1);
                *(_OWORD *)unint64_t v40 = v42;
                v39 += 2;
                v40 += 32;
                v41 -= 4;
              }
              while (v41);
              if (v37 != (v37 & 0x3FFFFFFFFFFFFFFCLL))
              {
                do
                {
LABEL_35:
                  uint64_t v36 = *(void *)v35;
                  v35 += 8;
                  *(void *)uint64_t v34 = v36;
                  v34 += 8;
                }
                while (v34 != v16);
              }
            }
            unint64_t v15 = &v27[8 * v26];
            if (v12) {
              operator delete(v12);
            }
            BOOL v12 = v28;
            goto LABEL_18;
          }
          uint64_t v20 = (v17 - v12) >> 3;
          if (v20 >= -1) {
            uint64_t v21 = v20 + 1;
          }
          else {
            uint64_t v21 = v20 + 2;
          }
          uint64_t v22 = v21 >> 1;
          uint64_t v23 = &v17[-8 * (v21 >> 1)];
          uint64_t v24 = v16;
          if (v16 != v17)
          {
            memmove(v23, v17, v16 - v17);
            uint64_t v24 = v17;
          }
          uint64_t v25 = -v22;
          unint64_t v15 = v16;
          uint64_t v16 = &v23[v16 - v17];
          uint64_t v18 = &v24[8 * v25];
        }
        else
        {
          uint64_t v18 = v17;
        }
LABEL_18:
        uint64_t v19 = *v3++;
        *(void *)uint64_t v16 = v19;
        v16 += 8;
        uint64_t v17 = v18;
        if (v3 == *(uint64_t **)(a1 + 16)) {
          goto LABEL_48;
        }
      }
    }
  }
  else
  {
    unint64_t v44 = (char *)operator new(8uLL);
    unint64_t v15 = v44 + 8;
    operator delete(v12);
    BOOL v3 = *(uint64_t **)(a1 + 8);
    uint64_t v45 = *(uint64_t **)(a1 + 16);
    BOOL v12 = v44;
    *(void *)unint64_t v44 = v14;
    uint64_t v16 = v44 + 8;
    if (v3 != v45) {
      goto LABEL_16;
    }
  }
  uint64_t v18 = v12;
LABEL_48:
  int64_t v46 = *(void **)a1;
  *(void *)a1 = v12;
  *(void *)(a1 + 8) = v18;
  *(void *)(a1 + 16) = v16;
  *(void *)(a1 + 24) = v15;
  if (v16 - v18 == 8)
  {
    *(void *)(a1 + 32) = 21;
    if (!v46) {
      return;
    }
  }
  else
  {
    *(void *)(a1 + 32) += 42;
    if (!v46) {
      return;
    }
  }
  operator delete(v46);
}

void sub_1000148BC(_Unwind_Exception *a1)
{
  operator delete(v2);
  operator delete(v1);
  _Unwind_Resume(a1);
}

char *sub_1000148F0(char **a1, char *a2, char *a3, size_t __sz)
{
  uint64_t v6 = a2;
  uint64_t v8 = (uint64_t)a1[2];
  uint64_t result = *a1;
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - (uint64_t)result) >> 3) >= __sz)
  {
    uint64_t v18 = a1[1];
    uint64_t v17 = a1 + 1;
    unint64_t v14 = v18;
    unint64_t v19 = 0xAAAAAAAAAAAAAAABLL * ((v18 - result) >> 3);
    if (v19 >= __sz)
    {
      uint64_t v24 = result;
      if (a2 != a3)
      {
        uint64_t v25 = result;
        do
        {
          *(_OWORD *)uint64_t v25 = *(_OWORD *)v6;
          v25[16] = v6[16];
          v24 += 24;
          v6 += 24;
          v25 += 24;
        }
        while (v6 != a3);
      }
      int64_t v16 = v24 - result;
      unint64_t v14 = result;
    }
    else
    {
      uint64_t v20 = &a2[24 * v19];
      if (v14 != result)
      {
        do
        {
          *(_OWORD *)uint64_t result = *(_OWORD *)v6;
          result[16] = v6[16];
          v6 += 24;
          result += 24;
        }
        while (v6 != v20);
      }
      uint64_t v21 = v14;
      if (v20 != a3)
      {
        uint64_t v22 = v14;
        do
        {
          long long v23 = *(_OWORD *)v20;
          *((void *)v22 + 2) = *((void *)v20 + 2);
          *(_OWORD *)uint64_t v22 = v23;
          v22 += 24;
          v20 += 24;
          v21 += 24;
        }
        while (v20 != a3);
      }
      int64_t v16 = v21 - v14;
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      uint64_t v8 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if (__sz > 0xAAAAAAAAAAAAAAALL) {
      goto LABEL_26;
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (v8 >> 3);
    uint64_t v11 = 2 * v10;
    if (2 * v10 <= __sz) {
      uint64_t v11 = __sz;
    }
    unint64_t v12 = v10 >= 0x555555555555555 ? 0xAAAAAAAAAAAAAAALL : v11;
    if (v12 > 0xAAAAAAAAAAAAAAALL) {
LABEL_26:
    }
      sub_100007188();
    uint64_t v13 = 24 * v12;
    uint64_t result = (char *)operator new(24 * v12);
    unint64_t v14 = result;
    *a1 = result;
    a1[1] = result;
    a1[2] = &result[v13];
    unint64_t v15 = result;
    if (v6 != a3)
    {
      uint64_t result = (char *)memcpy(result, v6, 24 * ((a3 - v6 - 24) / 0x18uLL) + 24);
      unint64_t v15 = &v14[24 * ((a3 - v6 - 24) / 0x18uLL) + 24];
    }
    int64_t v16 = v15 - v14;
    uint64_t v17 = a1 + 1;
  }
  *uint64_t v17 = &v14[v16];
  return result;
}

double *sub_100014AF0(uint64_t a1, const double *a2, const double *a3, size_t __sz)
{
  uint64_t v8 = *(void *)(a1 + 16);
  uint64_t result = *(double **)a1;
  if (__sz > (v8 - (uint64_t)result) >> 4)
  {
    if (result)
    {
      *(void *)(a1 + 8) = result;
      operator delete(result);
      uint64_t v8 = 0;
      *(void *)a1 = 0;
      *(void *)(a1 + 8) = 0;
      *(void *)(a1 + 16) = 0;
    }
    if (__sz >> 60) {
      goto LABEL_62;
    }
    uint64_t v10 = v8 >> 3;
    if (v8 >> 3 <= __sz) {
      uint64_t v10 = __sz;
    }
    BOOL v37 = (unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0;
    unint64_t v11 = 0xFFFFFFFFFFFFFFFLL;
    if (!v37) {
      unint64_t v11 = v10;
    }
    if (v11 >> 60) {
LABEL_62:
    }
      sub_100007188();
    uint64_t v12 = 2 * v11;
    uint64_t result = (double *)operator new(16 * v11);
    uint64_t v13 = result;
    *(void *)a1 = result;
    *(void *)(a1 + 8) = result;
    *(void *)(a1 + 16) = &result[v12];
    unint64_t v14 = result;
    if (a2 != a3)
    {
      uint64_t result = (double *)memcpy(result, a2, ((char *)a3 - (char *)a2) & 0xFFFFFFFFFFFFFFF0);
      unint64_t v14 = (double *)((char *)v13 + (((char *)a3 - (char *)a2) & 0xFFFFFFFFFFFFFFF0));
    }
    int64_t v15 = (char *)v14 - (char *)v13;
    int64_t v16 = (void *)(a1 + 8);
    goto LABEL_29;
  }
  uint64_t v17 = *(double **)(a1 + 8);
  int64_t v16 = (void *)(a1 + 8);
  uint64_t v13 = v17;
  int64_t v18 = (char *)v17 - (char *)result;
  unint64_t v19 = ((char *)v17 - (char *)result) >> 4;
  if (v19 >= __sz)
  {
    if (a2 == a3)
    {
      BOOL v30 = (char *)result;
    }
    else
    {
      unint64_t v29 = (char *)a3 - (char *)a2 - 16;
      if (v29 < 0xF0
        || ((unint64_t v47 = v29 & 0xFFFFFFFFFFFFFFF0 | 8,
             uint64_t v48 = (char *)result + v47,
             unint64_t v49 = (unint64_t)a2 + v47,
             unint64_t v50 = (v29 & 0xFFFFFFFFFFFFFFF0) + 16,
             result + 1 < (const double *)((char *)a2 + v50))
          ? (BOOL v51 = a2 + 1 >= (double *)((char *)result + v50))
          : (BOOL v51 = 1),
            v51 ? (char v52 = 0) : (char v52 = 1),
            v48 > (char *)a2 ? (BOOL v53 = (unint64_t)result >= v49) : (BOOL v53 = 1),
            !v53 || (v52 & 1) != 0))
      {
        BOOL v30 = (char *)result;
        int64_t v31 = a2;
      }
      else
      {
        uint64_t v54 = (v29 >> 4) + 1;
        uint64_t v55 = 2 * (v54 & 0x1FFFFFFFFFFFFFFCLL);
        BOOL v30 = (char *)&result[v55];
        int64_t v31 = &a2[v55];
        uint64_t v56 = a2 + 4;
        unint64_t v57 = result + 4;
        uint64_t v58 = v54 & 0x1FFFFFFFFFFFFFFCLL;
        do
        {
          uint64_t v59 = v56 - 4;
          float64x2x2_t v62 = vld2q_f64(v59);
          float64x2x2_t v64 = vld2q_f64(v56);
          unint64_t v60 = v57 - 4;
          vst2q_f64(v60, v62);
          vst2q_f64(v57, v64);
          v56 += 8;
          v57 += 8;
          v58 -= 4;
        }
        while (v58);
        if (v54 == (v54 & 0x1FFFFFFFFFFFFFFCLL)) {
          goto LABEL_28;
        }
      }
      do
      {
        uint64_t v32 = *(void *)v31;
        uint64_t v33 = *((void *)v31 + 1);
        v31 += 2;
        *(void *)BOOL v30 = v32;
        *((void *)v30 + 1) = v33;
        v30 += 16;
      }
      while (v31 != a3);
    }
LABEL_28:
    int64_t v15 = v30 - (char *)result;
    uint64_t v13 = result;
    goto LABEL_29;
  }
  uint64_t v20 = &a2[2 * v19];
  if (v13 != result)
  {
    unint64_t v21 = v18 - 16;
    if ((unint64_t)(v18 - 16) < 0xF0
      || ((unint64_t v34 = v18 & 0xFFFFFFFFFFFFFFF0,
           uint64_t v35 = (char *)result + v34 - 8,
           unint64_t v36 = (unint64_t)a2 + v34 - 8,
           result + 1 < (const double *)((char *)a2 + v34))
        ? (BOOL v37 = a2 + 1 >= (double *)((char *)result + v34))
        : (BOOL v37 = 1),
          v37 ? (char v38 = 0) : (char v38 = 1),
          v35 > (char *)a2 ? (BOOL v39 = (unint64_t)result >= v36) : (BOOL v39 = 1),
          !v39 || (v38 & 1) != 0))
    {
      uint64_t v22 = result;
      long long v23 = a2;
    }
    else
    {
      uint64_t v40 = (v21 >> 4) + 1;
      uint64_t v41 = 2 * (v40 & 0x1FFFFFFFFFFFFFFCLL);
      uint64_t v22 = &result[v41];
      long long v23 = &a2[v41];
      long long v42 = a2 + 4;
      uint64_t v43 = result + 4;
      uint64_t v44 = v40 & 0x1FFFFFFFFFFFFFFCLL;
      do
      {
        uint64_t v45 = v42 - 4;
        float64x2x2_t v61 = vld2q_f64(v45);
        float64x2x2_t v63 = vld2q_f64(v42);
        int64_t v46 = v43 - 4;
        vst2q_f64(v46, v61);
        vst2q_f64(v43, v63);
        v42 += 8;
        v43 += 8;
        v44 -= 4;
      }
      while (v44);
      if (v40 == (v40 & 0x1FFFFFFFFFFFFFFCLL)) {
        goto LABEL_18;
      }
    }
    do
    {
      uint64_t v24 = *(void *)v23;
      uint64_t v25 = *((void *)v23 + 1);
      v23 += 2;
      *(void *)uint64_t v22 = v24;
      *((void *)v22 + 1) = v25;
      v22 += 2;
    }
    while (v23 != v20);
  }
LABEL_18:
  unint64_t v26 = v13;
  if (v20 != a3)
  {
    unint64_t v27 = v13;
    do
    {
      long long v28 = *(_OWORD *)v20;
      v20 += 2;
      *(_OWORD *)unint64_t v27 = v28;
      v27 += 2;
      v26 += 2;
    }
    while (v20 != a3);
  }
  int64_t v15 = (char *)v26 - (char *)v13;
LABEL_29:
  *int64_t v16 = (char *)v13 + v15;
  return result;
}

void sub_100014DC8(void **a1, unint64_t a2)
{
  uint64_t v5 = a1[1];
  unint64_t v4 = a1[2];
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - (unsigned char *)v5) >> 3) >= a2)
  {
    if (a2)
    {
      unint64_t v11 = (char *)&v5[3 * a2];
      uint64_t v12 = 24 * a2;
      do
      {
        *uint64_t v5 = 0;
        v5[1] = 0;
        *((unsigned char *)v5 + 16) = 0;
        v5 += 3;
        v12 -= 24;
      }
      while (v12);
      uint64_t v5 = v11;
    }
    a1[1] = v5;
  }
  else
  {
    unint64_t v6 = 0xAAAAAAAAAAAAAAABLL * (((char *)v5 - (unsigned char *)*a1) >> 3);
    unint64_t v7 = v6 + a2;
    if (v6 + a2 > 0xAAAAAAAAAAAAAAALL) {
      sub_100007188();
    }
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((v4 - (unsigned char *)*a1) >> 3);
    if (2 * v8 > v7) {
      unint64_t v7 = 2 * v8;
    }
    if (v8 >= 0x555555555555555) {
      unint64_t v9 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v9 = v7;
    }
    if (v9)
    {
      if (v9 > 0xAAAAAAAAAAAAAAALL) {
        sub_100006E74();
      }
      uint64_t v10 = (char *)operator new(24 * v9);
    }
    else
    {
      uint64_t v10 = 0;
    }
    uint64_t v13 = &v10[24 * v6];
    uint64_t v14 = 24 * a2;
    int64_t v15 = &v13[24 * a2];
    int64_t v16 = v13;
    do
    {
      *(void *)int64_t v16 = 0;
      *((void *)v16 + 1) = 0;
      v16[16] = 0;
      v16 += 24;
      v14 -= 24;
    }
    while (v14);
    uint64_t v17 = *a1;
    if (v5 != *a1)
    {
      do
      {
        long long v18 = *(_OWORD *)(v5 - 3);
        *((void *)v13 - 1) = *(v5 - 1);
        *(_OWORD *)(v13 - 24) = v18;
        v13 -= 24;
        v5 -= 3;
      }
      while (v5 != v17);
      uint64_t v5 = *a1;
    }
    *a1 = v13;
    a1[1] = v15;
    a1[2] = &v10[24 * v9];
    if (v5)
    {
      operator delete(v5);
    }
  }
}

uint64_t sub_100014F70(uint64_t a1, uint64_t a2, int a3)
{
  unint64_t v6 = std::locale::locale((std::locale *)a1);
  *(void *)(a1 + 8) = std::locale::use_facet(v6, &std::ctype<char>::id);
  *(void *)(a1 + 16) = std::locale::use_facet((const std::locale *)a1, &std::collate<char>::id);
  *(_DWORD *)(a1 + 24) = a3;
  *(_OWORD *)(a1 + 28) = 0u;
  *(_OWORD *)(a1 + 44) = 0u;
  *(_DWORD *)(a1 + 60) = 0;
  uint64_t v7 = *(unsigned __int8 *)(a2 + 23);
  if ((v7 & 0x80u) == 0) {
    unint64_t v8 = (unsigned __int8 *)a2;
  }
  else {
    unint64_t v8 = *(unsigned __int8 **)a2;
  }
  if ((v7 & 0x80u) != 0) {
    uint64_t v7 = *(void *)(a2 + 8);
  }
  if (&v8[v7] != (unsigned __int8 *)sub_10001504C(a1, v8, (char *)&v8[v7])) {
    sub_100007A5C();
  }
  return a1;
}

void sub_10001501C(_Unwind_Exception *a1)
{
  sub_100007248(v2);
  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

void sub_100015038(_Unwind_Exception *a1)
{
  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

char *sub_10001504C(uint64_t a1, unsigned __int8 *a2, char *a3)
{
  unint64_t v6 = operator new(8uLL);
  *unint64_t v6 = &off_1000309D8;
  uint64_t v7 = operator new(0x10uLL);
  *uint64_t v7 = &off_100030A80;
  v7[1] = v6;
  unint64_t v8 = operator new(0x20uLL);
  void *v8 = &off_100030A30;
  v8[1] = 0;
  v8[2] = 0;
  v8[3] = v7;
  unint64_t v9 = *(std::__shared_weak_count **)(a1 + 48);
  *(void *)(a1 + 40) = v7;
  *(void *)(a1 + 48) = v8;
  if (v9 && !atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
    *(void *)(a1 + 56) = *(void *)(a1 + 40);
    unsigned int v10 = *(_DWORD *)(a1 + 24) & 0x1F0;
    if (v10 <= 0x3F)
    {
LABEL_4:
      if (v10)
      {
        if (v10 != 16)
        {
          if (v10 != 32) {
LABEL_27:
          }
            sub_100008440();
          goto LABEL_15;
        }
        return sub_10001554C(a1, a2, a3);
      }
      else
      {
        return sub_1000152D4(a1, (char *)a2, a3);
      }
    }
  }
  else
  {
    *(void *)(a1 + 56) = *(void *)(a1 + 40);
    unsigned int v10 = *(_DWORD *)(a1 + 24) & 0x1F0;
    if (v10 <= 0x3F) {
      goto LABEL_4;
    }
  }
  switch(v10)
  {
    case 0x40u:
LABEL_15:
      return sub_1000156E0(a1, (char *)a2, a3);
    case 0x80u:
      return sub_100015860(a1, (char *)a2, a3);
    case 0x100u:
      return sub_100015A58(a1, (char *)a2, a3);
    default:
      goto LABEL_27;
  }
}

void sub_10001528C(_Unwind_Exception *a1)
{
  sub_100008600(v2);
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

char *sub_1000152D4(uint64_t a1, char *a2, char *a3)
{
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = a2;
  while (1)
  {
    unint64_t v8 = v7;
    uint64_t v7 = sub_100015C50(a1, v7, a3);
    if (v8 == v7) {
      break;
    }
LABEL_2:
    if (v7 == v8) {
      goto LABEL_6;
    }
  }
  uint64_t v9 = *(void *)(a1 + 56);
  int v10 = *(_DWORD *)(a1 + 28);
  unint64_t v11 = sub_100015FCC(a1, v8, a3);
  if (v8 != (char *)v11)
  {
    uint64_t v7 = sub_100016338(a1, (char *)v11, a3, v9, v10 + 1, *(_DWORD *)(a1 + 28) + 1);
    goto LABEL_2;
  }
LABEL_6:
  if (v8 == a2)
  {
    uint64_t v12 = operator new(0x10uLL);
    uint64_t v13 = *(void *)(a1 + 56);
    uint64_t v14 = *(void *)(v13 + 8);
    *uint64_t v12 = &off_100030A80;
    v12[1] = v14;
    *(void *)(v13 + 8) = v12;
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
    goto LABEL_8;
  }
LABEL_9:
  if (v8 == a3) {
    return a3;
  }
  if (*v8 == 124)
  {
    uint64_t v16 = *(void *)(a1 + 56);
    uint64_t v17 = v8 + 1;
    long long v18 = v8 + 1;
    while (1)
    {
      unint64_t v8 = v18;
      long long v18 = sub_100015C50(a1, v18, a3);
      if (v8 == v18)
      {
        uint64_t v19 = *(void *)(a1 + 56);
        int v20 = *(_DWORD *)(a1 + 28);
        unint64_t v21 = sub_100015FCC(a1, v8, a3);
        if (v8 == (char *)v21)
        {
LABEL_16:
          if (v8 == v17)
          {
            uint64_t v22 = operator new(0x10uLL);
            uint64_t v23 = *(void *)(a1 + 56);
            uint64_t v24 = *(void *)(v23 + 8);
            *uint64_t v22 = &off_100030A80;
            v22[1] = v24;
            *(void *)(v23 + 8) = v22;
            *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
          }
          uint64_t v25 = operator new(0x18uLL);
          uint64_t v26 = *(void *)(v16 + 8);
          v25[1] = *(void *)(v6 + 8);
          v25[2] = v26;
          *uint64_t v25 = &off_100030FF0;
          *(void *)(v6 + 8) = v25;
          *(void *)(v16 + 8) = 0;
          unint64_t v27 = operator new(0x10uLL);
          uint64_t v28 = *(void *)(*(void *)(a1 + 56) + 8);
          *unint64_t v27 = &off_100030A80;
          v27[1] = v28;
          *(void *)(v16 + 8) = v27;
          *(void *)(*(void *)(a1 + 56) + 8) = 0;
          unint64_t v29 = operator new(0x10uLL);
          uint64_t v30 = *(void *)(v16 + 8);
          *unint64_t v29 = &off_100031038;
          v29[1] = v30;
          *(void *)(*(void *)(a1 + 56) + 8) = v29;
          uint64_t v15 = *(void *)(v16 + 8);
LABEL_8:
          *(void *)(a1 + 56) = v15;
          goto LABEL_9;
        }
        long long v18 = sub_100016338(a1, (char *)v21, a3, v19, v20 + 1, *(_DWORD *)(a1 + 28) + 1);
      }
      if (v18 == v8) {
        goto LABEL_16;
      }
    }
  }
  return v8;
}

char *sub_10001554C(uint64_t a1, unsigned __int8 *a2, char *a3)
{
  BOOL v3 = a2;
  if (a2 == (unsigned __int8 *)a3) {
    return (char *)a2;
  }
  if (*a2 == 94)
  {
    uint64_t v6 = operator new(0x18uLL);
    BOOL v7 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(v8 + 8);
    *uint64_t v6 = &off_100030B28;
    v6[1] = v9;
    *((unsigned char *)v6 + 16) = v7;
    *(void *)(v8 + 8) = v6;
    *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
    ++v3;
  }
  if (v3 != (unsigned __int8 *)a3)
  {
    while (v3 != (unsigned __int8 *)a3)
    {
      int v10 = v3;
      uint64_t v11 = *(void *)(a1 + 56);
      int v12 = *(_DWORD *)(a1 + 28);
      uint64_t v13 = (unsigned __int8 *)sub_100018B5C(a1, (uint64_t)v10, a3);
      if (v10 != v13)
      {
        BOOL v3 = sub_100018D7C(a1, v13, (unsigned __int8 *)a3, v11, v12 + 1, *(_DWORD *)(a1 + 28) + 1);
        if (v10 != v3) {
          continue;
        }
      }
      if (v10 + 1 != (unsigned __int8 *)a3 || *v10 != 36) {
        sub_1000116E0();
      }
      uint64_t v14 = operator new(0x18uLL);
      BOOL v15 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
      uint64_t v16 = *(void *)(a1 + 56);
      uint64_t v17 = *(void *)(v16 + 8);
      *uint64_t v14 = &off_100030B70;
      v14[1] = v17;
      *((unsigned char *)v14 + 16) = v15;
      *(void *)(v16 + 8) = v14;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
      return a3;
    }
  }
  return a3;
}

char *sub_1000156E0(uint64_t a1, char *a2, char *a3)
{
  uint64_t v6 = *(void *)(a1 + 56);
  BOOL v7 = sub_10001918C(a1, a2, a3);
  if (v7 == a2) {
    goto LABEL_12;
  }
  do
  {
    uint64_t v8 = v7;
    BOOL v7 = sub_10001918C(a1, v7, a3);
  }
  while (v8 != v7);
  if (v8 == a2) {
LABEL_12:
  }
    sub_1000116E0();
  if (v8 == a3) {
    return a3;
  }
  while (*v8 == 124)
  {
    uint64_t v9 = *(void *)(a1 + 56);
    int v10 = v8 + 1;
    uint64_t v11 = sub_10001918C(a1, v8 + 1, a3);
    if (v8 + 1 == v11) {
      goto LABEL_12;
    }
    do
    {
      uint64_t v8 = v11;
      uint64_t v11 = sub_10001918C(a1, v11, a3);
    }
    while (v8 != v11);
    if (v8 == v10) {
      goto LABEL_12;
    }
    int v12 = operator new(0x18uLL);
    uint64_t v13 = *(void *)(v9 + 8);
    v12[1] = *(void *)(v6 + 8);
    v12[2] = v13;
    *int v12 = &off_100030FF0;
    *(void *)(v6 + 8) = v12;
    *(void *)(v9 + 8) = 0;
    uint64_t v14 = operator new(0x10uLL);
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
    *uint64_t v14 = &off_100030A80;
    v14[1] = v15;
    *(void *)(v9 + 8) = v14;
    *(void *)(*(void *)(a1 + 56) + 8) = 0;
    uint64_t v16 = operator new(0x10uLL);
    uint64_t v17 = *(void *)(v9 + 8);
    *uint64_t v16 = &off_100031038;
    v16[1] = v17;
    *(void *)(*(void *)(a1 + 56) + 8) = v16;
    *(void *)(a1 + 56) = *(void *)(v9 + 8);
    if (v8 == a3) {
      return a3;
    }
  }
  return v8;
}

char *sub_100015860(uint64_t a1, char *__s, char *a3)
{
  uint64_t v6 = *(void *)(a1 + 56);
  BOOL v7 = (char *)memchr(__s, 10, a3 - __s);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = a3;
  }
  if (v8 == __s)
  {
    uint64_t v9 = operator new(0x10uLL);
    uint64_t v10 = *(void *)(v6 + 8);
    *uint64_t v9 = &off_100030A80;
    v9[1] = v10;
    *(void *)(v6 + 8) = v9;
    *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
    if (v8 == a3) {
      uint64_t v11 = v8;
    }
    else {
      uint64_t v11 = v8 + 1;
    }
    if (v11 == a3) {
      return a3;
    }
  }
  else
  {
    sub_10001554C(a1, (unsigned __int8 *)__s, v8);
    if (v8 == a3) {
      uint64_t v11 = v8;
    }
    else {
      uint64_t v11 = v8 + 1;
    }
    if (v11 == a3) {
      return a3;
    }
  }
  uint64_t v12 = *(void *)(a1 + 56);
  do
  {
    unint64_t v21 = (char *)memchr(v11, 10, a3 - v11);
    if (v21) {
      uint64_t v22 = v21;
    }
    else {
      uint64_t v22 = a3;
    }
    if (v22 == v11)
    {
      uint64_t v13 = operator new(0x10uLL);
      uint64_t v14 = *(void *)(v12 + 8);
      void *v13 = &off_100030A80;
      v13[1] = v14;
      *(void *)(v12 + 8) = v13;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
    }
    else
    {
      sub_10001554C(a1, (unsigned __int8 *)v11, v22);
    }
    uint64_t v15 = operator new(0x18uLL);
    uint64_t v16 = *(void *)(v12 + 8);
    v15[1] = *(void *)(v6 + 8);
    v15[2] = v16;
    void *v15 = &off_100030FF0;
    *(void *)(v6 + 8) = v15;
    *(void *)(v12 + 8) = 0;
    uint64_t v17 = operator new(0x10uLL);
    uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
    *uint64_t v17 = &off_100030A80;
    v17[1] = v18;
    *(void *)(v12 + 8) = v17;
    *(void *)(*(void *)(a1 + 56) + 8) = 0;
    uint64_t v19 = operator new(0x10uLL);
    uint64_t v20 = *(void *)(v12 + 8);
    void *v19 = &off_100031038;
    v19[1] = v20;
    *(void *)(*(void *)(a1 + 56) + 8) = v19;
    uint64_t v12 = *(void *)(v12 + 8);
    *(void *)(a1 + 56) = v12;
    if (v22 == a3) {
      uint64_t v11 = v22;
    }
    else {
      uint64_t v11 = v22 + 1;
    }
  }
  while (v11 != a3);
  return a3;
}

char *sub_100015A58(uint64_t a1, char *__s, char *a3)
{
  uint64_t v6 = *(void *)(a1 + 56);
  BOOL v7 = (char *)memchr(__s, 10, a3 - __s);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = a3;
  }
  if (v8 == __s)
  {
    uint64_t v9 = operator new(0x10uLL);
    uint64_t v10 = *(void *)(v6 + 8);
    *uint64_t v9 = &off_100030A80;
    v9[1] = v10;
    *(void *)(v6 + 8) = v9;
    *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
    if (v8 == a3) {
      uint64_t v11 = v8;
    }
    else {
      uint64_t v11 = v8 + 1;
    }
    if (v11 == a3) {
      return a3;
    }
  }
  else
  {
    sub_1000156E0(a1, __s, v8);
    if (v8 == a3) {
      uint64_t v11 = v8;
    }
    else {
      uint64_t v11 = v8 + 1;
    }
    if (v11 == a3) {
      return a3;
    }
  }
  uint64_t v12 = *(void *)(a1 + 56);
  do
  {
    unint64_t v21 = (char *)memchr(v11, 10, a3 - v11);
    if (v21) {
      uint64_t v22 = v21;
    }
    else {
      uint64_t v22 = a3;
    }
    if (v22 == v11)
    {
      uint64_t v13 = operator new(0x10uLL);
      uint64_t v14 = *(void *)(v12 + 8);
      void *v13 = &off_100030A80;
      v13[1] = v14;
      *(void *)(v12 + 8) = v13;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
    }
    else
    {
      sub_1000156E0(a1, v11, v22);
    }
    uint64_t v15 = operator new(0x18uLL);
    uint64_t v16 = *(void *)(v12 + 8);
    v15[1] = *(void *)(v6 + 8);
    v15[2] = v16;
    void *v15 = &off_100030FF0;
    *(void *)(v6 + 8) = v15;
    *(void *)(v12 + 8) = 0;
    uint64_t v17 = operator new(0x10uLL);
    uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
    *uint64_t v17 = &off_100030A80;
    v17[1] = v18;
    *(void *)(v12 + 8) = v17;
    *(void *)(*(void *)(a1 + 56) + 8) = 0;
    uint64_t v19 = operator new(0x10uLL);
    uint64_t v20 = *(void *)(v12 + 8);
    void *v19 = &off_100031038;
    v19[1] = v20;
    *(void *)(*(void *)(a1 + 56) + 8) = v19;
    uint64_t v12 = *(void *)(v12 + 8);
    *(void *)(a1 + 56) = v12;
    if (v22 == a3) {
      uint64_t v11 = v22;
    }
    else {
      uint64_t v11 = v22 + 1;
    }
  }
  while (v11 != a3);
  return a3;
}

char *sub_100015C50(uint64_t a1, char *a2, char *a3)
{
  BOOL v3 = a2;
  if (a2 == a3) {
    return v3;
  }
  int v6 = *a2;
  if (v6 > 91)
  {
    if (v6 == 92)
    {
      if (a2 + 1 != a3)
      {
        int v16 = a2[1];
        if (v16 == 66)
        {
          uint64_t v17 = (char *)operator new(0x30uLL);
          uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
          *(void *)uint64_t v17 = off_100030BB8;
          *((void *)v17 + 1) = v19;
          std::locale::locale((std::locale *)v17 + 2, (const std::locale *)a1);
          *(_OWORD *)(v17 + 24) = *(_OWORD *)(a1 + 8);
          v17[40] = 1;
        }
        else
        {
          if (v16 != 98) {
            return v3;
          }
          uint64_t v17 = (char *)operator new(0x30uLL);
          uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
          *(void *)uint64_t v17 = off_100030BB8;
          *((void *)v17 + 1) = v18;
          std::locale::locale((std::locale *)v17 + 2, (const std::locale *)a1);
          *(_OWORD *)(v17 + 24) = *(_OWORD *)(a1 + 8);
          v17[40] = 0;
        }
        *(void *)(*(void *)(a1 + 56) + 8) = v17;
        *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
        return v3 + 2;
      }
      return v3;
    }
    if (v6 != 94) {
      return v3;
    }
    uint64_t v11 = operator new(0x18uLL);
    BOOL v12 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    uint64_t v13 = *(void *)(a1 + 56);
    v11[1] = *(void *)(v13 + 8);
    uint64_t v14 = &off_100030B28;
LABEL_17:
    *uint64_t v11 = v14;
    *((unsigned char *)v11 + 16) = v12;
    *(void *)(v13 + 8) = v11;
    *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
    return ++v3;
  }
  if (v6 == 36)
  {
    uint64_t v11 = operator new(0x18uLL);
    BOOL v12 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    uint64_t v13 = *(void *)(a1 + 56);
    v11[1] = *(void *)(v13 + 8);
    uint64_t v14 = &off_100030B70;
    goto LABEL_17;
  }
  if (v6 != 40 || a2 + 1 == a3 || a2[1] != 63 || a2 + 2 == a3) {
    return v3;
  }
  int v7 = a2[2];
  if (v7 == 33)
  {
    *(void *)&long long v20 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v24 = v20;
    long long v25 = v20;
    long long v22 = v20;
    long long v23 = v20;
    sub_10000927C((uint64_t)&v22);
    DWORD2(v23) = *(_DWORD *)(a1 + 24);
    uint64_t v9 = (char *)sub_10001504C(&v22, v3 + 3, a3);
    int v21 = HIDWORD(v23);
    sub_1000092EC(a1, (uint64_t)&v22, 1, *(_DWORD *)(a1 + 28));
    *(_DWORD *)(a1 + 28) += v21;
    if (v9 == a3 || *v9 != 41) {
      sub_1000093AC();
    }
    goto LABEL_27;
  }
  if (v7 != 61) {
    return v3;
  }
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v24 = v8;
  long long v25 = v8;
  long long v22 = v8;
  long long v23 = v8;
  sub_10000927C((uint64_t)&v22);
  DWORD2(v23) = *(_DWORD *)(a1 + 24);
  uint64_t v9 = (char *)sub_10001504C(&v22, v3 + 3, a3);
  int v10 = HIDWORD(v23);
  sub_1000092EC(a1, (uint64_t)&v22, 0, *(_DWORD *)(a1 + 28));
  *(_DWORD *)(a1 + 28) += v10;
  if (v9 == a3 || *v9 != 41) {
    sub_1000093AC();
  }
LABEL_27:
  sub_1000065BC((std::locale *)&v22);
  return v9 + 1;
}

void sub_100015F7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
}

void sub_100015F90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
}

void sub_100015FA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
}

void sub_100015FB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
}

unsigned __int8 *sub_100015FCC(uint64_t a1, char *a2, char *a3)
{
  BOOL v3 = a2;
  if (a2 == a3) {
    return (unsigned __int8 *)v3;
  }
  switch(*a2)
  {
    case '(':
      if (a2 + 1 == a3) {
        goto LABEL_26;
      }
      if (a2 + 2 != a3 && a2[1] == 63 && a2[2] == 58)
      {
        ++*(_DWORD *)(a1 + 36);
        int v6 = (char *)sub_1000152D4(a1, a2 + 3, a3);
        if (v6 != a3 && *v6 == 41)
        {
          --*(_DWORD *)(a1 + 36);
          return (unsigned __int8 *)(v6 + 1);
        }
LABEL_26:
        sub_1000093AC();
      }
      if ((*(unsigned char *)(a1 + 24) & 2) != 0)
      {
        int v12 = *(_DWORD *)(a1 + 28);
      }
      else
      {
        uint64_t v11 = operator new(0x18uLL);
        int v12 = *(_DWORD *)(a1 + 28) + 1;
        *(_DWORD *)(a1 + 28) = v12;
        uint64_t v13 = *(void *)(a1 + 56);
        uint64_t v14 = *(void *)(v13 + 8);
        *uint64_t v11 = &off_100030E88;
        v11[1] = v14;
        *((_DWORD *)v11 + 4) = v12;
        *(void *)(v13 + 8) = v11;
        *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
      }
      ++*(_DWORD *)(a1 + 36);
      uint64_t v15 = (char *)sub_1000152D4(a1, v3 + 1, a3);
      if (v15 == a3) {
        goto LABEL_26;
      }
      int v16 = v15;
      if (*v15 != 41) {
        goto LABEL_26;
      }
      if ((*(unsigned char *)(a1 + 24) & 2) == 0)
      {
        uint64_t v17 = operator new(0x18uLL);
        uint64_t v18 = *(void *)(a1 + 56);
        uint64_t v19 = *(void *)(v18 + 8);
        *uint64_t v17 = &off_100030ED0;
        v17[1] = v19;
        *((_DWORD *)v17 + 4) = v12;
        *(void *)(v18 + 8) = v17;
        *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
      }
      --*(_DWORD *)(a1 + 36);
      uint64_t result = (unsigned __int8 *)(v16 + 1);
      break;
    case ')':
    case ',':
    case '-':
    case '/':
    case '0':
    case '1':
    case '2':
    case '3':
    case '4':
    case '5':
    case '6':
    case '7':
    case '8':
    case '9':
    case ':':
    case ';':
    case '<':
    case '=':
    case '>':
    case '@':
    case 'A':
    case 'B':
    case 'C':
    case 'D':
    case 'E':
    case 'F':
    case 'G':
    case 'H':
    case 'I':
    case 'J':
    case 'K':
    case 'L':
    case 'M':
    case 'N':
    case 'O':
    case 'P':
    case 'Q':
    case 'R':
    case 'S':
    case 'T':
    case 'U':
    case 'V':
    case 'W':
    case 'X':
    case 'Y':
    case 'Z':
      return sub_1000169F4(a1, a2, a3);
    case '*':
    case '+':
    case '?':
      goto LABEL_25;
    case '.':
      long long v8 = operator new(0x10uLL);
      uint64_t v9 = *(void *)(a1 + 56);
      uint64_t v10 = *(void *)(v9 + 8);
      void *v8 = &off_100030C48;
      v8[1] = v10;
      *(void *)(v9 + 8) = v8;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
      return (unsigned __int8 *)++v3;
    case '[':
      return (unsigned __int8 *)sub_1000168A0(a1, a2, a3);
    case '\\':
      return sub_100016738(a1, (unsigned __int8 *)a2, (unsigned __int8 *)a3);
    default:
      if (*a2 == 123) {
LABEL_25:
      }
        sub_10000AE08();
      return sub_1000169F4(a1, a2, a3);
  }
  return result;
}

char *sub_100016338(uint64_t a1, char *a2, char *a3, uint64_t a4, int a5, int a6)
{
  if (a2 == a3) {
    return a2;
  }
  int v6 = *(_DWORD *)(a1 + 24) & 0x1F0;
  int v7 = *a2;
  if (v7 <= 62)
  {
    if (v7 == 42)
    {
      uint64_t v9 = a2 + 1;
      if (v6) {
        BOOL v21 = 1;
      }
      else {
        BOOL v21 = v9 == a3;
      }
      if (!v21 && *v9 == 63)
      {
        uint64_t v10 = (unsigned __int8 *)(a2 + 2);
        uint64_t v11 = 0;
        goto LABEL_36;
      }
      uint64_t v25 = 0;
      goto LABEL_45;
    }
    long long v8 = a2;
    if (v7 == 43)
    {
      uint64_t v9 = a2 + 1;
      if (!v6 && v9 != a3 && *v9 == 63)
      {
        uint64_t v10 = (unsigned __int8 *)(a2 + 2);
        uint64_t v11 = 1;
LABEL_36:
        sub_100010D78(a1, v11, -1, a4, a5, a6, 0);
        return (char *)v10;
      }
      uint64_t v25 = 1;
      goto LABEL_45;
    }
    return v8;
  }
  if (v7 == 63)
  {
    long long v22 = a2 + 1;
    if (v6) {
      BOOL v23 = 1;
    }
    else {
      BOOL v23 = v22 == a3;
    }
    if (v23 || *v22 != 63)
    {
      sub_100010D78(a1, 0, 1, a4, a5, a6, 1);
      return v22;
    }
    else
    {
      long long v24 = a2 + 2;
      sub_100010D78(a1, 0, 1, a4, a5, a6, 0);
      return v24;
    }
  }
  else
  {
    long long v8 = a2;
    if (v7 != 123) {
      return v8;
    }
    uint64_t v13 = a2 + 1;
    if (a2 + 1 == a3) {
      goto LABEL_72;
    }
    int v14 = *v13;
    if ((v14 & 0xF8) != 0x30 && (v14 & 0xFE) != 0x38) {
      goto LABEL_72;
    }
    int v15 = v14 - 48;
    int v16 = a2 + 2;
    if (a2 + 2 == a3)
    {
LABEL_21:
      int v16 = a3;
    }
    else
    {
      while (1)
      {
        int v17 = *v16;
        if ((v17 & 0xF8) != 0x30 && (v17 & 0xFE) != 0x38) {
          break;
        }
        if (v15 >= 214748364) {
          goto LABEL_72;
        }
        int v15 = v17 + 10 * v15 - 48;
        if (++v16 == a3) {
          goto LABEL_21;
        }
      }
    }
    if (v16 == v13) {
      goto LABEL_72;
    }
    if (v16 == a3) {
      goto LABEL_73;
    }
    int v18 = *v16;
    if (v18 != 44)
    {
      if (v18 == 125)
      {
        uint64_t v19 = v16 + 1;
        if (v6 || v19 == a3 || *v19 != 63)
        {
          sub_100010D78(a1, v15, v15, a4, a5, a6, 1);
          return v19;
        }
        else
        {
          long long v20 = (unsigned __int8 *)(v16 + 2);
          sub_100010D78(a1, v15, v15, a4, a5, a6, 0);
          return (char *)v20;
        }
      }
LABEL_72:
      sub_100010EB4();
    }
    uint64_t v26 = v16 + 1;
    if (v16 + 1 == a3) {
      goto LABEL_72;
    }
    int v27 = *v26;
    if (v27 == 125)
    {
      uint64_t v9 = v16 + 2;
      if (!v6 && v9 != a3 && *v9 == 63)
      {
        uint64_t v11 = v15;
        uint64_t v10 = (unsigned __int8 *)(v16 + 3);
        goto LABEL_36;
      }
      uint64_t v25 = v15;
LABEL_45:
      sub_100010D78(a1, v25, -1, a4, a5, a6, 1);
      return v9;
    }
    if ((v27 & 0xF8) != 0x30 && (v27 & 0xFE) != 0x38) {
      goto LABEL_73;
    }
    int v28 = v27 - 48;
    unint64_t v29 = v16 + 2;
    if (v29 == a3)
    {
LABEL_61:
      unint64_t v29 = a3;
    }
    else
    {
      while (1)
      {
        int v30 = *v29;
        if ((v30 & 0xF8) != 0x30 && (v30 & 0xFE) != 0x38) {
          break;
        }
        if (v28 >= 214748364) {
          goto LABEL_72;
        }
        int v28 = v30 + 10 * v28 - 48;
        if (++v29 == a3) {
          goto LABEL_61;
        }
      }
    }
    if (v29 == v26 || v29 == a3 || *v29 != 125) {
LABEL_73:
    }
      sub_100010F0C();
    if (v28 < v15) {
      goto LABEL_72;
    }
    int64_t v31 = v29 + 1;
    if (v6 || v31 == a3 || *v31 != 63)
    {
      sub_100010D78(a1, v15, v28, a4, a5, a6, 1);
      return v31;
    }
    else
    {
      uint64_t v32 = v29 + 2;
      sub_100010D78(a1, v15, v28, a4, a5, a6, 0);
      return v32;
    }
  }
}

unsigned __int8 *sub_100016738(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  if (a2 == a3) {
    return a2;
  }
  unint64_t v4 = a2;
  if (*a2 == 92)
  {
    int v6 = a2 + 1;
    if (a2 + 1 == a3) {
      sub_10000B12C();
    }
    int v8 = *v6;
    uint64_t v9 = (v8 - 48);
    if (v8 == 48)
    {
      sub_10000BA9C(a1, v9);
      return a2 + 2;
    }
    if ((v8 - 49) <= 8)
    {
      unint64_t v4 = a2 + 2;
      if (a2 + 2 == a3)
      {
        unint64_t v4 = a3;
      }
      else
      {
        while (1)
        {
          int v11 = *v4;
          if ((v11 - 48) > 9) {
            break;
          }
          if (v9 >= 0x19999999) {
            goto LABEL_24;
          }
          ++v4;
          LODWORD(v9) = v11 + 10 * v9 - 48;
          if (v4 == a3)
          {
            unint64_t v4 = a3;
            break;
          }
        }
        if (!v9) {
LABEL_24:
        }
          sub_10000BC48();
      }
      if (v9 > *(_DWORD *)(a1 + 28)) {
        goto LABEL_24;
      }
      sub_10000BCA0(a1, v9);
      if (v4 != v6) {
        return v4;
      }
    }
    unint64_t v4 = sub_100016BD8(a1, a2 + 1, a3);
    if (v6 == v4)
    {
      int v12 = sub_100016EFC(a1, a2 + 1, a3, 0);
      if (v6 == v12) {
        return a2;
      }
      else {
        return v12;
      }
    }
  }
  return v4;
}

char *sub_1000168A0(uint64_t a1, char *a2, char *a3)
{
  if (a2 != a3 && *a2 == 91)
  {
    if (a2 + 1 == a3) {
      goto LABEL_20;
    }
    int v5 = a2[1];
    char v6 = v5 == 94;
    int v7 = v5 == 94 ? a2 + 2 : a2 + 1;
    int v8 = operator new(0xB0uLL);
    sub_10000CC60((uint64_t)v8, a1, *(void *)(*(void *)(a1 + 56) + 8), v6, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
    *(void *)(*(void *)(a1 + 56) + 8) = v8;
    *(void *)(a1 + 56) = v8;
    if (v7 == a3) {
      goto LABEL_20;
    }
    if ((*(_WORD *)(a1 + 24) & 0x1F0) != 0 && *v7 == 93)
    {
      sub_10000C7CC((uint64_t)v8, 93);
      ++v7;
    }
    if (v7 == a3) {
      goto LABEL_20;
    }
    do
    {
      uint64_t v9 = v7;
      int v7 = sub_1000174FC(a1, v7, a3, (uint64_t)v8);
    }
    while (v9 != v7);
    if (v9 == a3) {
      goto LABEL_20;
    }
    if (*v9 == 45)
    {
      sub_10000C7CC((uint64_t)v8, 45);
      ++v9;
    }
    if (v9 == a3 || *v9 != 93) {
LABEL_20:
    }
      sub_10000E0DC();
    return v9 + 1;
  }
  return a2;
}

void sub_1000169E0(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

unsigned char *sub_1000169F4(uint64_t a1, unsigned char *a2, unsigned char *a3)
{
  if (a2 == a3) {
    return a2;
  }
  switch(*a2)
  {
    case '$':
    case '(':
    case ')':
    case '*':
    case '+':
    case '.':
    case '?':
    case '[':
    case '\\':
    case ']':
    case '^':
    case '{':
    case '|':
    case '}':
      return a2;
    default:
      sub_10000BA9C(a1, (char)*a2);
      uint64_t result = a2 + 1;
      break;
  }
  return result;
}

unsigned char *sub_100016BD8(uint64_t a1, unsigned char *a2, unsigned char *a3)
{
  BOOL v3 = a2;
  if (a2 != a3)
  {
    switch(*a2)
    {
      case 'D':
        int v5 = operator new(0xB0uLL);
        sub_10000CC60((uint64_t)v5, a1, *(void *)(*(void *)(a1 + 56) + 8), 1, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
        goto LABEL_7;
      case 'S':
        int v5 = operator new(0xB0uLL);
        sub_10000CC60((uint64_t)v5, a1, *(void *)(*(void *)(a1 + 56) + 8), 1, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
        goto LABEL_11;
      case 'W':
        char v6 = operator new(0xB0uLL);
        sub_10000CC60((uint64_t)v6, a1, *(void *)(*(void *)(a1 + 56) + 8), 1, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
        goto LABEL_9;
      case 'd':
        int v5 = operator new(0xB0uLL);
        sub_10000CC60((uint64_t)v5, a1, *(void *)(*(void *)(a1 + 56) + 8), 0, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
LABEL_7:
        *(void *)(*(void *)(a1 + 56) + 8) = v5;
        *(void *)(a1 + 56) = v5;
        int v7 = v5[40] | 0x400;
        goto LABEL_12;
      case 's':
        int v5 = operator new(0xB0uLL);
        sub_10000CC60((uint64_t)v5, a1, *(void *)(*(void *)(a1 + 56) + 8), 0, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
LABEL_11:
        *(void *)(*(void *)(a1 + 56) + 8) = v5;
        *(void *)(a1 + 56) = v5;
        int v7 = v5[40] | 0x4000;
LABEL_12:
        v5[40] = v7;
        goto LABEL_13;
      case 'w':
        char v6 = operator new(0xB0uLL);
        sub_10000CC60((uint64_t)v6, a1, *(void *)(*(void *)(a1 + 56) + 8), 0, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
LABEL_9:
        *(void *)(*(void *)(a1 + 56) + 8) = v6;
        *(void *)(a1 + 56) = v6;
        v6[40] |= 0x500u;
        sub_10000C7CC((uint64_t)v6, 95);
LABEL_13:
        ++v3;
        break;
      default:
        return v3;
    }
  }
  return v3;
}

void sub_100016DB4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_100016DC8(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_100016DDC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_100016DF0(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_100016E04(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_100016E18(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_100016EFC(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t *a4)
{
  unint64_t v4 = a2;
  if (a2 == a3) {
    return v4;
  }
  uint64_t v5 = *a2;
  uint64_t v6 = (char)v5;
  switch((char)v5)
  {
    case '0':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 0;
        return v4 + 1;
      }
      else
      {
        sub_10000BA9C(a1, 0);
        return v4 + 1;
      }
    case 'c':
      if (v4 + 1 == a3 || (char)v4[1] < 65) {
        goto LABEL_85;
      }
      unsigned int v8 = v4[1];
      if (v8 >= 0x5B && (v8 - 97) > 0x19u) {
        goto LABEL_85;
      }
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = v8 & 0x1F;
        return v4 + 2;
      }
      else
      {
        sub_10000BA9C(a1, v8 & 0x1F);
        return v4 + 2;
      }
    case 'f':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 12;
        return v4 + 1;
      }
      else
      {
        sub_10000BA9C(a1, 12);
        return v4 + 1;
      }
    case 'n':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 10;
        return v4 + 1;
      }
      else
      {
        sub_10000BA9C(a1, 10);
        return v4 + 1;
      }
    case 'r':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 13;
        return v4 + 1;
      }
      else
      {
        sub_10000BA9C(a1, 13);
        return v4 + 1;
      }
    case 't':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 9;
        return v4 + 1;
      }
      else
      {
        sub_10000BA9C(a1, 9);
        return v4 + 1;
      }
    case 'u':
      if (v4 + 1 != a3)
      {
        int v10 = v4[1];
        if ((v10 & 0xF8) == 0x30 || (v10 & 0xFE) == 0x38 || (v10 | 0x20u) - 97 < 6)
        {
          v4 += 2;
          if (v4 != a3)
          {
            int v11 = *v4;
            if ((v11 & 0xF8) == 0x30 || (v11 & 0xFE) == 0x38 || (v11 | 0x20u) - 97 < 6) {
              goto LABEL_42;
            }
          }
        }
      }
      goto LABEL_85;
    case 'v':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 11;
        return v4 + 1;
      }
      else
      {
        uint64_t v6 = 11;
LABEL_68:
        sub_10000BA9C(a1, v6);
        return v4 + 1;
      }
    case 'x':
LABEL_42:
      if (v4 + 1 == a3) {
        goto LABEL_85;
      }
      unsigned __int8 v12 = v4[1];
      char v13 = -48;
      if ((v12 & 0xF8) == 0x30 || (v12 & 0xFE) == 0x38) {
        goto LABEL_47;
      }
      v12 |= 0x20u;
      if ((v12 - 97) >= 6u) {
        goto LABEL_85;
      }
      char v13 = -87;
LABEL_47:
      if (v4 + 2 == a3) {
        goto LABEL_85;
      }
      unsigned __int8 v14 = v4[2];
      char v15 = -48;
      if ((v14 & 0xF8) != 0x30 && (v14 & 0xFE) != 0x38)
      {
        v14 |= 0x20u;
        if ((v14 - 97) >= 6u) {
LABEL_85:
        }
          sub_10000B12C();
        char v15 = -87;
      }
      char v16 = v14 + 16 * (v12 + v13) + v15;
      if (!a4)
      {
        sub_10000BA9C(a1, v16);
        v4 += 3;
        return v4;
      }
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((unsigned char *)a4 + 23) = 1;
      }
      *(unsigned char *)a4 = v16;
      *((unsigned char *)a4 + 1) = 0;
      uint64_t result = v4 + 3;
      break;
    default:
      if (v6 == 95
        || (v6 & 0x80000000) == 0 && (*(_DWORD *)(*(void *)(*(void *)(a1 + 8) + 16) + 4 * v5) & 0x500) != 0)
      {
        goto LABEL_85;
      }
      if (!a4) {
        goto LABEL_68;
      }
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((unsigned char *)a4 + 23) = 1;
      }
      *(_WORD *)a4 = v5;
      return v4 + 1;
  }
  return result;
}

char *sub_1000174FC(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  unint64_t v4 = a2;
  int64_t v5 = a2 - a3;
  if (a2 == a3) {
    return a2;
  }
  int v6 = *a2;
  int v7 = a2;
  if (v6 == 93) {
    return v7;
  }
  unsigned int v8 = (char *)a4;
  int v11 = 0;
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v42 = 0;
  if (a2 + 1 == a3 || v6 != 91)
  {
LABEL_36:
    int v27 = *(_DWORD *)(a1 + 24) & 0x1F0;
    goto LABEL_39;
  }
  int v12 = a2[1];
  if (v12 != 46)
  {
    if (v12 == 58)
    {
      uint64_t v14 = (uint64_t)(a2 + 2);
      if (a3 - (v4 + 2) < 2) {
        goto LABEL_91;
      }
      uint64_t v15 = 0;
      int64_t v16 = v5 + 4;
      int v17 = (unsigned __int8 *)v4;
      uint64_t v18 = v16;
      if (v4[2] == 58) {
        goto LABEL_15;
      }
      do
      {
        do
        {
          if (!v18) {
            goto LABEL_91;
          }
          int v17 = (unsigned __int8 *)&v4[++v15];
          uint64_t v18 = v16 + v15;
        }
        while (v4[v15 + 2] != 58);
LABEL_15:
        ;
      }
      while (v17[3] != 93);
      uint64_t v19 = &v4[v15 + 2];
      if (v19 == a3) {
LABEL_91:
      }
        sub_10000E0DC();
      int v20 = sub_1000189A0(a1, v14, v19, *(_DWORD *)(a1 + 24) & 1);
      if (!v20) {
        sub_100010134();
      }
      char v13 = 0;
      *((_DWORD *)v8 + 40) |= v20;
      unsigned int v8 = &v4[v15 + 4];
      int v7 = v4;
      if (SHIBYTE(v42) < 0) {
        goto LABEL_70;
      }
      goto LABEL_71;
    }
    if (v12 == 61)
    {
      unsigned int v8 = sub_100017ADC(a1, a2 + 2, a3, a4);
      char v13 = 0;
      int v7 = v4;
      if ((SHIBYTE(v42) & 0x80000000) == 0) {
        goto LABEL_71;
      }
      goto LABEL_70;
    }
    int v11 = 0;
    goto LABEL_36;
  }
  BOOL v21 = a2 + 2;
  if (a3 - (v4 + 2) < 2) {
    goto LABEL_92;
  }
  long long v22 = (unsigned __int8 *)(v4 + 2);
  BOOL v23 = (unsigned __int8 *)(v4 + 3);
  if (*v21 == 46) {
    goto LABEL_24;
  }
  do
  {
    do
    {
      if (a3 - 4 == v4) {
        goto LABEL_92;
      }
      ++v4;
      long long v22 = v23;
      int v24 = *v23++;
    }
    while (v24 != 46);
LABEL_24:
    ;
  }
  while (*v23 != 93);
  if (v22 == (unsigned __int8 *)a3) {
LABEL_92:
  }
    sub_10000E0DC();
  sub_100018684(a1, (uint64_t)v21, v4 + 2, (uint64_t)&v43);
  if (SHIBYTE(v42) < 0) {
    operator delete(__p[0]);
  }
  uint64_t v42 = v44;
  *(_OWORD *)std::string __p = v43;
  uint64_t v25 = (char *)HIBYTE(v44);
  int v11 = SHIBYTE(v44);
  uint64_t v26 = *((void *)&v43 + 1);
  if (v44 < 0) {
    uint64_t v25 = (char *)__p[1];
  }
  if ((unint64_t)(v25 - 1) >= 2) {
    sub_10000FBFC();
  }
  unint64_t v4 = (char *)(v22 + 2);
  int v27 = *(_DWORD *)(a1 + 24) & 0x1F0;
  if (v44 >= 0) {
    uint64_t v26 = HIBYTE(v44);
  }
  if (v26)
  {
    if (v4 == a3) {
      goto LABEL_52;
    }
    goto LABEL_51;
  }
LABEL_39:
  if ((v27 | 0x40) != 0x40)
  {
    LOBYTE(v28) = *v4;
LABEL_44:
    if (v11 < 0)
    {
      int64_t v31 = __p[0];
      __p[1] = (void *)1;
      *(unsigned char *)__p[0] = v28;
      v31[1] = 0;
      if (++v4 == a3) {
        goto LABEL_52;
      }
    }
    else
    {
      HIBYTE(v42) = 1;
      LOWORD(__p[0]) = v28;
      if (++v4 == a3) {
        goto LABEL_52;
      }
    }
    goto LABEL_51;
  }
  int v28 = *v4;
  if (v28 != 92) {
    goto LABEL_44;
  }
  unint64_t v29 = v4 + 1;
  if (v27) {
    int v30 = sub_100018120(a1, v29, a3, (uint64_t *)__p);
  }
  else {
    int v30 = (char *)sub_100017E84(a1, (unsigned __int8 *)v29, (unsigned __int8 *)a3, (uint64_t)__p, (uint64_t)v8);
  }
  unint64_t v4 = v30;
  if (v30 == a3)
  {
LABEL_52:
    if (SHIBYTE(v42) < 0)
    {
      if (!__p[1]) {
        goto LABEL_69;
      }
      if (__p[1] != (void *)1)
      {
        uint64_t v33 = (void **)__p[0];
LABEL_68:
        sub_10000F800((uint64_t)v8, *(char *)v33, *((char *)v33 + 1));
LABEL_69:
        char v13 = 1;
        int v7 = v4;
        if ((SHIBYTE(v42) & 0x80000000) == 0) {
          goto LABEL_71;
        }
        goto LABEL_70;
      }
      uint64_t v33 = (void **)__p[0];
    }
    else
    {
      if (!HIBYTE(v42)) {
        goto LABEL_69;
      }
      uint64_t v33 = __p;
      if (HIBYTE(v42) != 1) {
        goto LABEL_68;
      }
    }
    sub_10000C7CC((uint64_t)v8, *(char *)v33);
    goto LABEL_69;
  }
LABEL_51:
  int v32 = *v4;
  if (v32 == 93) {
    goto LABEL_52;
  }
  unint64_t v34 = v4 + 1;
  if (v4 + 1 == a3 || v32 != 45 || *v34 == 93) {
    goto LABEL_52;
  }
  long long v43 = 0uLL;
  int64_t v44 = 0;
  int v7 = v4 + 2;
  if (v4 + 2 == a3 || *v34 != 91 || *v7 != 46)
  {
    if ((v27 | 0x40) == 0x40)
    {
      LODWORD(v34) = *v34;
      if (v34 == 92)
      {
        if (v27) {
          uint64_t v35 = sub_100018120(a1, v4 + 2, a3, (uint64_t *)&v43);
        }
        else {
          uint64_t v35 = (char *)sub_100017E84(a1, (unsigned __int8 *)v4 + 2, (unsigned __int8 *)a3, (uint64_t)&v43, (uint64_t)v8);
        }
        goto LABEL_81;
      }
    }
    else
    {
      LOBYTE(v34) = *v34;
    }
    HIBYTE(v44) = 1;
    LOWORD(v43) = v34;
    goto LABEL_82;
  }
  uint64_t v35 = sub_100017D90(a1, v4 + 3, a3, (uint64_t)&v43);
LABEL_81:
  int v7 = v35;
LABEL_82:
  *(_OWORD *)BOOL v39 = *(_OWORD *)__p;
  uint64_t v40 = v42;
  __p[1] = 0;
  uint64_t v42 = 0;
  __p[0] = 0;
  *(_OWORD *)BOOL v37 = v43;
  uint64_t v38 = v44;
  long long v43 = 0uLL;
  int64_t v44 = 0;
  sub_10000F270((uint64_t)v8, (char *)v39, (uint64_t)v37);
  if (SHIBYTE(v38) < 0)
  {
    operator delete(v37[0]);
    if ((SHIBYTE(v40) & 0x80000000) == 0)
    {
LABEL_84:
      if ((SHIBYTE(v44) & 0x80000000) == 0) {
        goto LABEL_85;
      }
LABEL_89:
      operator delete((void *)v43);
      char v13 = 1;
      if (SHIBYTE(v42) < 0) {
        goto LABEL_70;
      }
      goto LABEL_71;
    }
  }
  else if ((SHIBYTE(v40) & 0x80000000) == 0)
  {
    goto LABEL_84;
  }
  operator delete(v39[0]);
  if (SHIBYTE(v44) < 0) {
    goto LABEL_89;
  }
LABEL_85:
  char v13 = 1;
  if (SHIBYTE(v42) < 0) {
LABEL_70:
  }
    operator delete(__p[0]);
LABEL_71:
  if (v13) {
    return v7;
  }
  return v8;
}

void sub_100017A20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (*(char *)(v28 - 49) < 0)
  {
    operator delete(*(void **)(v28 - 72));
    if (a28 < 0)
    {
LABEL_5:
      operator delete(__p);
      _Unwind_Resume(a1);
    }
  }
  else if (a28 < 0)
  {
    goto LABEL_5;
  }
  _Unwind_Resume(a1);
}

char *sub_100017ADC(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  if (a3 - a2 < 2 || a3 - 1 == a2) {
    goto LABEL_39;
  }
  int v6 = a3 - 2;
  int v7 = a2;
  unsigned int v8 = a2;
  uint64_t v9 = a2 + 1;
  if (*a2 != 61) {
    goto LABEL_5;
  }
LABEL_4:
  if (*v9 != 93)
  {
LABEL_5:
    while (a2 != v6)
    {
      ++v7;
      --v6;
      unsigned int v8 = v9;
      int v10 = *v9++;
      if (v10 == 61) {
        goto LABEL_4;
      }
    }
LABEL_39:
    sub_10000E0DC();
  }
  if (v8 == a3) {
    goto LABEL_39;
  }
  memset(v20, 170, sizeof(v20));
  sub_100018684(a1, (uint64_t)a2, v7, (uint64_t)v20);
  if ((SHIBYTE(v20[2]) & 0x80000000) == 0)
  {
    int v11 = (char *)HIBYTE(v20[2]);
    if (HIBYTE(v20[2]))
    {
      memset(__p, 170, sizeof(__p));
      int v12 = v20;
      goto LABEL_14;
    }
LABEL_40:
    sub_10000FBFC();
  }
  int v11 = (char *)v20[1];
  if (!v20[1]) {
    goto LABEL_40;
  }
  memset(__p, 170, sizeof(__p));
  int v12 = (void **)v20[0];
LABEL_14:
  sub_10000FF0C(a1, (uint64_t)v12, &v11[(void)v12], (unsigned char **)__p);
  if (SHIBYTE(__p[2]) < 0)
  {
    if (__p[1])
    {
LABEL_16:
      unint64_t v13 = *(void *)(a4 + 144);
      if (v13 >= *(void *)(a4 + 152))
      {
        *(void *)(a4 + 144) = sub_100006F48((char **)(a4 + 136), (uint64_t)__p);
        if (SHIBYTE(__p[2]) < 0) {
          goto LABEL_37;
        }
      }
      else
      {
        if ((HIBYTE(__p[2]) & 0x80) != 0)
        {
          sub_100006EA8(*(unsigned char **)(a4 + 144), __p[0], (unint64_t)__p[1]);
        }
        else
        {
          long long v14 = *(_OWORD *)__p;
          *(void **)(v13 + 16) = __p[2];
          *(_OWORD *)unint64_t v13 = v14;
        }
        *(void *)(a4 + 144) = v13 + 24;
        *(void *)(a4 + 144) = v13 + 24;
        if (SHIBYTE(__p[2]) < 0) {
          goto LABEL_37;
        }
      }
      goto LABEL_33;
    }
  }
  else if (HIBYTE(__p[2]))
  {
    goto LABEL_16;
  }
  uint64_t v15 = (void *)HIBYTE(v20[2]);
  if (SHIBYTE(v20[2]) < 0) {
    uint64_t v15 = v20[1];
  }
  if (v15 == (void *)2)
  {
    int v17 = v20;
    if (SHIBYTE(v20[2]) < 0) {
      int v17 = (void **)v20[0];
    }
    sub_10000F800(a4, *(char *)v17, *((char *)v17 + 1));
  }
  else
  {
    if (v15 != (void *)1) {
      sub_10000FBFC();
    }
    int64_t v16 = v20;
    if (SHIBYTE(v20[2]) < 0) {
      int64_t v16 = (void **)v20[0];
    }
    sub_10000C7CC(a4, *(char *)v16);
  }
  if (SHIBYTE(__p[2]) < 0)
  {
LABEL_37:
    operator delete(__p[0]);
    if (SHIBYTE(v20[2]) < 0) {
      goto LABEL_38;
    }
    return v7 + 2;
  }
LABEL_33:
  if ((SHIBYTE(v20[2]) & 0x80000000) == 0) {
    return v7 + 2;
  }
LABEL_38:
  operator delete(v20[0]);
  return v7 + 2;
}

void sub_100017D28(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  *(void *)(v20 + 144) = v21;
  if (a14 < 0)
  {
    operator delete(__p);
    if ((a20 & 0x80000000) == 0) {
LABEL_3:
    }
      _Unwind_Resume(exception_object);
  }
  else if ((a20 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a15);
  _Unwind_Resume(exception_object);
}

char *sub_100017D90(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  if (a3 - a2 < 2 || a3 - 1 == a2) {
    goto LABEL_15;
  }
  int64_t v5 = a3 - 2;
  int v6 = a2;
  int v7 = a2;
  unsigned int v8 = a2 + 1;
  if (*a2 != 46) {
    goto LABEL_5;
  }
LABEL_4:
  if (*v8 != 93)
  {
LABEL_5:
    while (a2 != v5)
    {
      ++v6;
      --v5;
      int v7 = v8;
      int v9 = *v8++;
      if (v9 == 46) {
        goto LABEL_4;
      }
    }
LABEL_15:
    sub_10000E0DC();
  }
  if (v7 == a3) {
    goto LABEL_15;
  }
  sub_100018684(a1, (uint64_t)a2, v6, (uint64_t)&v13);
  if (*(char *)(a4 + 23) < 0) {
    operator delete(*(void **)a4);
  }
  *(_OWORD *)a4 = v13;
  unint64_t v10 = v14;
  *(void *)(a4 + 16) = v14;
  unint64_t v11 = HIBYTE(v10);
  if ((v11 & 0x80u) != 0) {
    unint64_t v11 = *(void *)(a4 + 8);
  }
  if (v11 - 1 >= 2) {
    sub_10000FBFC();
  }
  return v6 + 2;
}

unsigned __int8 *sub_100017E84(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t a4, uint64_t a5)
{
  if (a2 == a3) {
    sub_10000B12C();
  }
  switch(*a2)
  {
    case 'D':
      *(_DWORD *)(a5 + 164) |= 0x400u;
      uint64_t result = a2 + 1;
      break;
    case 'E':
    case 'F':
    case 'G':
    case 'H':
    case 'I':
    case 'J':
    case 'K':
    case 'L':
    case 'M':
    case 'N':
    case 'O':
    case 'P':
    case 'Q':
    case 'R':
    case 'T':
    case 'U':
    case 'V':
    case 'X':
    case 'Y':
    case 'Z':
    case '[':
    case '\\':
    case ']':
    case '^':
    case '_':
    case 'a':
    case 'c':
    case 'e':
    case 'f':
    case 'g':
    case 'h':
    case 'i':
    case 'j':
    case 'k':
    case 'l':
    case 'm':
    case 'n':
    case 'o':
    case 'p':
    case 'q':
    case 'r':
    case 't':
    case 'u':
    case 'v':
      goto LABEL_8;
    case 'S':
      *(_DWORD *)(a5 + 164) |= 0x4000u;
      uint64_t result = a2 + 1;
      break;
    case 'W':
      *(_DWORD *)(a5 + 164) |= 0x500u;
      sub_1000102FC(a5, 95);
      uint64_t result = a2 + 1;
      break;
    case 'b':
      if (*(char *)(a4 + 23) < 0)
      {
        *(void *)(a4 + 8) = 1;
        a4 = *(void *)a4;
      }
      else
      {
        *(unsigned char *)(a4 + 23) = 1;
      }
      *(_WORD *)a4 = 8;
      uint64_t result = a2 + 1;
      break;
    case 'd':
      *(_DWORD *)(a5 + 160) |= 0x400u;
      uint64_t result = a2 + 1;
      break;
    case 's':
      *(_DWORD *)(a5 + 160) |= 0x4000u;
      uint64_t result = a2 + 1;
      break;
    case 'w':
      *(_DWORD *)(a5 + 160) |= 0x500u;
      sub_10000C7CC(a5, 95);
      uint64_t result = a2 + 1;
      break;
    default:
      if (*a2)
      {
LABEL_8:
        uint64_t result = sub_100016EFC(a1, a2, a3, (uint64_t *)a4);
      }
      else
      {
        if (*(char *)(a4 + 23) < 0)
        {
          *(void *)(a4 + 8) = 1;
          a4 = *(void *)a4;
        }
        else
        {
          *(unsigned char *)(a4 + 23) = 1;
        }
        *(unsigned char *)a4 = 0;
        *(unsigned char *)(a4 + 1) = 0;
        uint64_t result = a2 + 1;
      }
      break;
  }
  return result;
}

char *sub_100018120(uint64_t a1, char *a2, char *a3, uint64_t *a4)
{
  if (a2 == a3) {
LABEL_70:
  }
    sub_10000B12C();
  char v5 = *a2;
  switch(*a2)
  {
    case '""':
    case '/':
    case '\\':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(unsigned char *)a4 = v5;
        *((unsigned char *)a4 + 1) = 0;
        return a2 + 1;
      }
      else
      {
        sub_10000BA9C(a1, v5);
        return a2 + 1;
      }
    case 'a':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 7;
        return a2 + 1;
      }
      else
      {
        sub_10000BA9C(a1, 7);
        return a2 + 1;
      }
    case 'b':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 8;
        return a2 + 1;
      }
      else
      {
        sub_10000BA9C(a1, 8);
        return a2 + 1;
      }
    case 'f':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 12;
        return a2 + 1;
      }
      else
      {
        sub_10000BA9C(a1, 12);
        return a2 + 1;
      }
    case 'n':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 10;
        return a2 + 1;
      }
      else
      {
        sub_10000BA9C(a1, 10);
        return a2 + 1;
      }
    case 'r':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 13;
        return a2 + 1;
      }
      else
      {
        sub_10000BA9C(a1, 13);
        return a2 + 1;
      }
    case 't':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 9;
        return a2 + 1;
      }
      else
      {
        sub_10000BA9C(a1, 9);
        return a2 + 1;
      }
    case 'v':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 11;
        return a2 + 1;
      }
      else
      {
        sub_10000BA9C(a1, 11);
        return a2 + 1;
      }
    default:
      if ((v5 & 0xF8) != 0x30) {
        goto LABEL_70;
      }
      char v7 = *a2 - 48;
      unsigned int v8 = a2 + 1;
      if (a2 + 1 == a3)
      {
        unsigned int v8 = a3;
LABEL_42:
        if (a4) {
          goto LABEL_43;
        }
LABEL_69:
        sub_10000BA9C(a1, v7);
        return v8;
      }
      if ((*v8 & 0xF8) != 0x30) {
        goto LABEL_42;
      }
      char v7 = *v8 + 8 * v7 - 48;
      if (a2 + 2 == a3)
      {
        unsigned int v8 = a3;
        if (a4) {
          goto LABEL_43;
        }
        goto LABEL_69;
      }
      char v9 = a2[2];
      int v10 = v9 & 0xF8;
      char v11 = v9 + 8 * v7 - 48;
      if (v10 == 48) {
        unsigned int v8 = a2 + 3;
      }
      else {
        unsigned int v8 = a2 + 2;
      }
      if (v10 == 48) {
        char v7 = v11;
      }
      if (!a4) {
        goto LABEL_69;
      }
LABEL_43:
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((unsigned char *)a4 + 23) = 1;
      }
      *(unsigned char *)a4 = v7;
      *((unsigned char *)a4 + 1) = 0;
      return v8;
  }
}

void sub_100018684(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v5 = (unint64_t)&a3[-a2];
  memset(__s, 170, sizeof(__s));
  if ((unint64_t)&a3[-a2] >= 0x7FFFFFFFFFFFFFF8) {
    sub_100006DCC();
  }
  if (v5 <= 0x16)
  {
    __s[23] = (_BYTE)a3 - a2;
    char v9 = __s;
    if ((char *)a2 != a3) {
      goto LABEL_4;
    }
LABEL_13:
    int v10 = v9;
    goto LABEL_16;
  }
  uint64_t v16 = (v5 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v5 | 7) != 0x17) {
    uint64_t v16 = v5 | 7;
  }
  uint64_t v17 = v16 + 1;
  char v9 = (char *)operator new(v16 + 1);
  *(void *)&__s[8] = v5;
  *(void *)&__s[16] = v17 | 0x8000000000000000;
  *(void *)__s = v9;
  if ((char *)a2 == a3) {
    goto LABEL_13;
  }
LABEL_4:
  if (v5 < 0x20 || (unint64_t)&v9[-a2] < 0x20)
  {
    int v10 = v9;
    char v11 = (char *)a2;
    do
    {
LABEL_15:
      char v18 = *v11++;
      *v10++ = v18;
    }
    while (v11 != a3);
    goto LABEL_16;
  }
  int v10 = &v9[v5 & 0xFFFFFFFFFFFFFFE0];
  char v11 = (char *)(a2 + (v5 & 0xFFFFFFFFFFFFFFE0));
  int v12 = (long long *)(a2 + 16);
  long long v13 = v9 + 16;
  unint64_t v14 = v5 & 0xFFFFFFFFFFFFFFE0;
  do
  {
    long long v15 = *v12;
    *(v13 - 1) = *(v12 - 1);
    _OWORD *v13 = v15;
    v12 += 2;
    v13 += 2;
    v14 -= 32;
  }
  while (v14);
  if (v5 != (v5 & 0xFFFFFFFFFFFFFFE0)) {
    goto LABEL_15;
  }
LABEL_16:
  char *v10 = 0;
  *(void *)a4 = 0;
  *(void *)(a4 + 8) = 0;
  *(void *)(a4 + 16) = 0;
  if (__s[23] < 0)
  {
    uint64_t v19 = *(char **)__s;
    if (!*(void *)&__s[8]) {
      goto LABEL_29;
    }
  }
  else
  {
    if (!__s[23]) {
      return;
    }
    uint64_t v19 = __s;
  }
  std::__get_collation_name(&v26, v19);
  *(_OWORD *)a4 = *(_OWORD *)&v26.__r_.__value_.__l.__data_;
  unint64_t v20 = v26.__r_.__value_.__r.__words[2];
  *(void *)(a4 + 16) = *((void *)&v26.__r_.__value_.__l + 2);
  unint64_t v21 = HIBYTE(v20);
  if ((v21 & 0x80u) != 0) {
    unint64_t v21 = *(void *)(a4 + 8);
  }
  if (v21)
  {
LABEL_23:
    if ((__s[23] & 0x80000000) == 0) {
      return;
    }
    uint64_t v19 = *(char **)__s;
LABEL_29:
    operator delete(v19);
    return;
  }
  if (__s[23] < 0)
  {
    uint64_t v19 = *(char **)__s;
    if (*(void *)&__s[8] >= 3uLL) {
      goto LABEL_29;
    }
    goto LABEL_31;
  }
  if (__s[23] < 3u)
  {
LABEL_31:
    (*(void (**)(std::string *__return_ptr))(**(void **)(a1 + 16) + 32))(&v26);
    if (*(char *)(a4 + 23) < 0) {
      operator delete(*(void **)a4);
    }
    *(std::string *)a4 = v26;
    if (*(char *)(a4 + 23) < 0)
    {
      uint64_t v23 = *(void *)(a4 + 8);
      if (v23 == 1 || v23 == 12)
      {
        if (__s != (char *)a4)
        {
          if (__s[23] >= 0) {
            int v24 = __s;
          }
          else {
            int v24 = *(char **)__s;
          }
          if (__s[23] >= 0) {
            size_t v25 = __s[23];
          }
          else {
            size_t v25 = *(void *)&__s[8];
          }
          sub_10000738C((void **)a4, v24, v25);
        }
      }
      else
      {
        **(unsigned char **)a4 = 0;
        *(void *)(a4 + 8) = 0;
      }
    }
    else
    {
      int v22 = *(unsigned __int8 *)(a4 + 23);
      if (v22 == 1 || v22 == 12)
      {
        if (__s != (char *)a4)
        {
          if (__s[23] < 0)
          {
            sub_1000072C4((void *)a4, *(void **)__s, *(size_t *)&__s[8]);
          }
          else
          {
            *(_OWORD *)a4 = *(_OWORD *)__s;
            *(void *)(a4 + 16) = *(void *)&__s[16];
          }
        }
      }
      else
      {
        *(unsigned char *)a4 = 0;
        *(unsigned char *)(a4 + 23) = 0;
      }
    }
    goto LABEL_23;
  }
}

void sub_10001895C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (*(char *)(v17 + 23) < 0)
  {
    operator delete(*(void **)v17);
    if ((a17 & 0x80000000) == 0) {
LABEL_3:
    }
      _Unwind_Resume(exception_object);
  }
  else if ((a17 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_1000189A0(uint64_t a1, uint64_t a2, char *a3, BOOL a4)
{
  unint64_t v4 = (unint64_t)&a3[-a2];
  memset(__p, 170, sizeof(__p));
  if ((unint64_t)&a3[-a2] >= 0x7FFFFFFFFFFFFFF8) {
    sub_100006DCC();
  }
  if (v4 > 0x16)
  {
    uint64_t v16 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v16 = v4 | 7;
    }
    uint64_t v17 = v16 + 1;
    char v9 = operator new(v16 + 1);
    __p[1] = (void *)v4;
    __p[2] = (void *)(v17 | 0x8000000000000000);
    __p[0] = v9;
    if ((char *)a2 != a3) {
      goto LABEL_4;
    }
LABEL_13:
    int v10 = v9;
    goto LABEL_16;
  }
  HIBYTE(__p[2]) = (_BYTE)a3 - a2;
  char v9 = __p;
  if ((char *)a2 == a3) {
    goto LABEL_13;
  }
LABEL_4:
  if (v4 < 0x20 || (unint64_t)v9 - a2 < 0x20)
  {
    int v10 = v9;
    char v11 = (char *)a2;
  }
  else
  {
    int v10 = (char *)v9 + (v4 & 0xFFFFFFFFFFFFFFE0);
    char v11 = (char *)(a2 + (v4 & 0xFFFFFFFFFFFFFFE0));
    int v12 = (long long *)(a2 + 16);
    long long v13 = v9 + 1;
    unint64_t v14 = v4 & 0xFFFFFFFFFFFFFFE0;
    do
    {
      long long v15 = *v12;
      *(v13 - 1) = *(v12 - 1);
      _OWORD *v13 = v15;
      v12 += 2;
      v13 += 2;
      v14 -= 32;
    }
    while (v14);
    if (v4 == (v4 & 0xFFFFFFFFFFFFFFE0)) {
      goto LABEL_16;
    }
  }
  do
  {
    char v18 = *v11++;
    *v10++ = v18;
  }
  while (v11 != a3);
LABEL_16:
  unsigned char *v10 = 0;
  uint64_t v19 = (char *)HIBYTE(__p[2]);
  if (SHIBYTE(__p[2]) >= 0) {
    unint64_t v20 = __p;
  }
  else {
    unint64_t v20 = (void **)__p[0];
  }
  if (SHIBYTE(__p[2]) < 0) {
    uint64_t v19 = (char *)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a1 + 8) + 48))(*(void *)(a1 + 8), v20, &v19[(void)v20]);
  if (SHIBYTE(__p[2]) >= 0) {
    unint64_t v21 = __p;
  }
  else {
    unint64_t v21 = (void **)__p[0];
  }
  uint64_t classname = std::__get_classname((const char *)v21, a4);
  if (SHIBYTE(__p[2]) < 0) {
    operator delete(__p[0]);
  }
  return classname;
}

void sub_100018B40(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

char *sub_100018B5C(uint64_t a1, uint64_t a2, char *a3)
{
  int v6 = sub_10001902C(a1, (char *)a2, a3);
  if ((char *)a2 != v6 || (char *)a2 == a3 || (char *)(a2 + 1) == a3 || *(unsigned char *)a2 != 92) {
    return v6;
  }
  int v8 = *(unsigned __int8 *)(a2 + 1);
  if (v8 == 40)
  {
    char v9 = (unsigned __int8 *)(a2 + 2);
    if ((*(unsigned char *)(a1 + 24) & 2) != 0)
    {
      int v11 = *(_DWORD *)(a1 + 28);
    }
    else
    {
      int v10 = operator new(0x18uLL);
      int v11 = *(_DWORD *)(a1 + 28) + 1;
      *(_DWORD *)(a1 + 28) = v11;
      uint64_t v12 = *(void *)(a1 + 56);
      uint64_t v13 = *(void *)(v12 + 8);
      void *v10 = &off_100030E88;
      v10[1] = v13;
      *((_DWORD *)v10 + 4) = v11;
      *(void *)(v12 + 8) = v10;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
    }
    do
    {
      if (v9 == (unsigned __int8 *)a3) {
        goto LABEL_23;
      }
      unint64_t v14 = v9;
      uint64_t v15 = *(void *)(a1 + 56);
      int v16 = *(_DWORD *)(a1 + 28);
      uint64_t v17 = (unsigned __int8 *)sub_100018B5C(a1, v14, a3);
      if (v14 == v17) {
        break;
      }
      char v9 = sub_100018D7C(a1, v17, (unsigned __int8 *)a3, v15, v16 + 1, *(_DWORD *)(a1 + 28) + 1);
    }
    while (v14 != v9);
    if (v14 + 1 == (unsigned __int8 *)a3 || *v14 != 92 || v14[1] != 41) {
LABEL_23:
    }
      sub_1000093AC();
    int v6 = (char *)&v14[2 * (v14[1] == 41)];
    if ((*(unsigned char *)(a1 + 24) & 2) == 0)
    {
      char v18 = operator new(0x18uLL);
      uint64_t v19 = *(void *)(a1 + 56);
      uint64_t v20 = *(void *)(v19 + 8);
      *char v18 = &off_100030ED0;
      v18[1] = v20;
      *((_DWORD *)v18 + 4) = v11;
      *(void *)(v19 + 8) = v18;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
      return v6;
    }
    return v6;
  }
  if ((v8 & 0xF8) != 0x30 && (v8 & 0xFE) != 0x38 || (v8 - 49) > 8) {
    return v6;
  }
  if ((v8 - 48) > *(_DWORD *)(a1 + 28)) {
    sub_10000BC48();
  }
  sub_10000BCA0(a1, v8 - 48);
  return (char *)(a2 + 2);
}

unsigned __int8 *sub_100018D7C(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t a4, int a5, int a6)
{
  if (a2 == a3) {
    return a2;
  }
  int v7 = *a2;
  if (v7 == 42)
  {
    sub_100010D78(a1, 0, -1, a4, a5, a6, 1);
    return a2 + 1;
  }
  char v9 = a3;
  if (a2 + 1 == a3 || v7 != 92 || a2[1] != 123) {
    return a2;
  }
  int v10 = &a2[2 * (a2[1] == 123)];
  if (v10 == a3) {
    goto LABEL_45;
  }
  int v11 = *v10;
  if ((v11 & 0xF8) != 0x30 && (v11 & 0xFE) != 0x38) {
    goto LABEL_45;
  }
  int v12 = v11 - 48;
  uint64_t v13 = v10 + 1;
  if (v10 + 1 == a3)
  {
LABEL_15:
    uint64_t v13 = a3;
  }
  else
  {
    while (1)
    {
      int v14 = *v13;
      if ((v14 & 0xF8) != 0x30 && (v14 & 0xFE) != 0x38) {
        break;
      }
      if (v12 >= 214748364) {
        goto LABEL_45;
      }
      int v12 = v14 + 10 * v12 - 48;
      if (++v13 == a3) {
        goto LABEL_15;
      }
    }
  }
  if (v13 == v10) {
    goto LABEL_45;
  }
  if (v13 == a3) {
LABEL_46:
  }
    sub_100010F0C();
  uint64_t v15 = v13 + 1;
  int v16 = *v13;
  if (v16 != 44)
  {
    if (v15 != a3 && v16 == 92 && *v15 == 125)
    {
      uint64_t v19 = v13 + 2;
      sub_100010D78(a1, v12, v12, a4, a5, a6, 1);
      return v19;
    }
    goto LABEL_46;
  }
  if (v15 == a3) {
    goto LABEL_46;
  }
  int v17 = *v15;
  if ((v17 & 0xF8) == 0x30 || (v17 & 0xFE) == 0x38)
  {
    int v18 = v17 - 48;
    uint64_t v15 = v13 + 2;
    if (v13 + 2 == a3)
    {
LABEL_37:
      uint64_t v15 = a3;
      goto LABEL_40;
    }
    while (1)
    {
      int v17 = *v15;
      if ((v17 & 0xF8) != 0x30 && (v17 & 0xFE) != 0x38) {
        break;
      }
      if (v18 >= 214748364) {
        goto LABEL_45;
      }
      int v18 = v17 + 10 * v18 - 48;
      if (++v15 == a3) {
        goto LABEL_37;
      }
    }
  }
  else
  {
    int v18 = -1;
  }
  if (v15 == a3)
  {
    uint64_t v20 = v15;
    uint64_t v15 = a3;
    char v9 = v20;
  }
  else if (v15 + 1 == a3 || v17 != 92)
  {
    char v9 = v15;
  }
  else
  {
    char v9 = &v15[2 * (v15[1] == 125)];
  }
LABEL_40:
  if (v15 == v9) {
    goto LABEL_46;
  }
  if (v18 != -1)
  {
    if (v18 >= v12)
    {
      sub_100010D78(a1, v12, v18, a4, a5, a6, 1);
      return v9;
    }
LABEL_45:
    sub_100010EB4();
  }
  sub_100010D78(a1, v12, -1, a4, a5, a6, 1);
  return v9;
}

char *sub_10001902C(uint64_t a1, char *a2, char *a3)
{
  if (a2 != a3)
  {
    int v6 = a2 + 1;
    int v5 = *a2;
    if (a2 + 1 != a3 || v5 != 36)
    {
      if ((v5 - 46) > 0x2E || ((1 << (v5 - 46)) & 0x600000000001) == 0)
      {
        sub_10000BA9C(a1, (char)v5);
        return a2 + 1;
      }
      if (v6 != a3 && v5 == 92)
      {
        int v9 = *v6;
        if ((v9 - 36) <= 0x3A && ((1 << (v9 - 36)) & 0x580000000000441) != 0)
        {
          sub_10000BA9C(a1, (char)v9);
          return a2 + 2;
        }
      }
      if (*a2 == 46)
      {
        int v10 = operator new(0x10uLL);
        uint64_t v11 = *(void *)(a1 + 56);
        uint64_t v12 = *(void *)(v11 + 8);
        void *v10 = &off_100031080;
        v10[1] = v12;
        *(void *)(v11 + 8) = v10;
        *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
        return a2 + 1;
      }
    }
  }
  return sub_1000168A0(a1, a2, a3);
}

char *sub_10001918C(uint64_t a1, char *a2, char *a3)
{
  uint64_t v6 = *(void *)(a1 + 56);
  int v7 = *(_DWORD *)(a1 + 28);
  int v8 = sub_100019474(a1, a2, a3);
  if (v8 == a2)
  {
    int v8 = sub_10001965C(a1, a2, a3);
    if (v8 == a2)
    {
      if (a2 == a3 || *a2 != 46)
      {
        int v8 = sub_1000168A0(a1, a2, a3);
      }
      else
      {
        int v9 = operator new(0x10uLL);
        uint64_t v10 = *(void *)(a1 + 56);
        uint64_t v11 = *(void *)(v10 + 8);
        *int v9 = &off_100031080;
        v9[1] = v11;
        *(void *)(v10 + 8) = v9;
        *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
        int v8 = a2 + 1;
      }
    }
  }
  if (v8 != a2 || v8 == a3)
  {
LABEL_23:
    if (v8 != a2) {
      goto LABEL_24;
    }
    return a2;
  }
  int v12 = *a2;
  if (v12 == 36)
  {
    uint64_t v13 = operator new(0x18uLL);
    BOOL v14 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    uint64_t v15 = *(void *)(a1 + 56);
    v13[1] = *(void *)(v15 + 8);
    int v16 = &off_100030B70;
    goto LABEL_14;
  }
  if (v12 == 40)
  {
    if ((*(unsigned char *)(a1 + 24) & 2) != 0)
    {
      int v18 = *(_DWORD *)(a1 + 28);
    }
    else
    {
      int v17 = operator new(0x18uLL);
      int v18 = *(_DWORD *)(a1 + 28) + 1;
      *(_DWORD *)(a1 + 28) = v18;
      uint64_t v19 = *(void *)(a1 + 56);
      uint64_t v20 = *(void *)(v19 + 8);
      *int v17 = &off_100030E88;
      v17[1] = v20;
      *((_DWORD *)v17 + 4) = v18;
      *(void *)(v19 + 8) = v17;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
    }
    ++*(_DWORD *)(a1 + 36);
    unint64_t v21 = (char *)sub_1000156E0(a1, a2 + 1, a3);
    if (v21 == a3 || (int v22 = v21, *v21 != 41)) {
      sub_1000093AC();
    }
    if ((*(unsigned char *)(a1 + 24) & 2) == 0)
    {
      uint64_t v23 = operator new(0x18uLL);
      uint64_t v24 = *(void *)(a1 + 56);
      uint64_t v25 = *(void *)(v24 + 8);
      *uint64_t v23 = &off_100030ED0;
      v23[1] = v25;
      *((_DWORD *)v23 + 4) = v18;
      *(void *)(v24 + 8) = v23;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
    }
    --*(_DWORD *)(a1 + 36);
    int v8 = v22 + 1;
    goto LABEL_23;
  }
  if (v12 != 94) {
    return a2;
  }
  uint64_t v13 = operator new(0x18uLL);
  BOOL v14 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
  uint64_t v15 = *(void *)(a1 + 56);
  v13[1] = *(void *)(v15 + 8);
  int v16 = &off_100030B28;
LABEL_14:
  void *v13 = v16;
  *((unsigned char *)v13 + 16) = v14;
  *(void *)(v15 + 8) = v13;
  *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8);
  int v8 = a2 + 1;
LABEL_24:
  int v26 = *(_DWORD *)(a1 + 28) + 1;
  return sub_100016338(a1, v8, a3, v6, v7 + 1, v26);
}

unsigned char *sub_100019474(uint64_t a1, unsigned char *a2, unsigned char *a3)
{
  if (a2 == a3) {
    return a2;
  }
  switch(*a2)
  {
    case '$':
    case '(':
    case '*':
    case '+':
    case '.':
    case '?':
    case '[':
    case '\\':
    case '^':
    case '{':
    case '|':
      return a2;
    case ')':
      if (*(_DWORD *)(a1 + 36)) {
        return a2;
      }
      break;
    default:
      break;
  }
  sub_10000BA9C(a1, (char)*a2);
  return a2 + 1;
}

char *sub_10001965C(uint64_t a1, char *a2, char *a3)
{
  BOOL v3 = a2;
  if (a2 == a3) {
    return v3;
  }
  unint64_t v4 = a2 + 1;
  if (v3 + 1 == a3 || *v3 != 92) {
    return v3;
  }
  signed __int8 v5 = *v4;
  switch(*v4)
  {
    case '$':
    case '(':
    case ')':
    case '*':
    case '+':
    case '.':
    case '?':
    case '[':
    case '\\':
    case '^':
    case '{':
    case '|':
    case '}':
      sub_10000BA9C(a1, v5);
      v3 += 2;
      return v3;
    default:
      if ((*(_DWORD *)(a1 + 24) & 0x1F0) == 0x40)
      {
        uint64_t result = sub_100018120(a1, v4, a3, 0);
      }
      else
      {
        int v7 = sub_100011E70(a1, v5);
        uint64_t v8 = 2;
        if (!v7) {
          uint64_t v8 = 0;
        }
        uint64_t result = &v3[v8];
      }
      break;
  }
  return result;
}

void *sub_100019894(void *a1, uint64_t a2, unsigned __int8 a3)
{
  std::istream::sentry::sentry();
  if (*(char *)(a2 + 23) < 0)
  {
    **(unsigned char **)a2 = 0;
    *(void *)(a2 + 8) = 0;
  }
  else
  {
    *(unsigned char *)a2 = 0;
    *(unsigned char *)(a2 + 23) = 0;
  }
  uint64_t v6 = 0;
  while (1)
  {
    int v7 = *(void **)((char *)a1 + *(void *)(*a1 - 24) + 40);
    uint64_t v8 = (unsigned char *)v7[3];
    if (v8 != (unsigned char *)v7[4])
    {
      v7[3] = v8 + 1;
      LOBYTE(v7) = *v8;
      goto LABEL_9;
    }
    LODWORD(v7) = (*(uint64_t (**)(void *))(*v7 + 80))(v7);
    if (v7 == -1) {
      break;
    }
LABEL_9:
    if (v7 == a3)
    {
      int v9 = 0;
      goto LABEL_17;
    }
    std::string::push_back((std::string *)a2, (std::string::value_type)v7);
    --v6;
    if (*(char *)(a2 + 23) < 0 && *(void *)(a2 + 8) == 0x7FFFFFFFFFFFFFF7)
    {
      int v9 = 4;
      goto LABEL_17;
    }
  }
  if (v6) {
    int v9 = 2;
  }
  else {
    int v9 = 6;
  }
LABEL_17:
  std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | v9);
  return a1;
}

void sub_1000199FC(void *a1)
{
  __cxa_begin_catch(a1);
  uint64_t v2 = *v1;
  *(_DWORD *)((char *)v1 + *(void *)(*v1 - 24) + 32) |= 1u;
  if ((*((unsigned char *)v1 + *(void *)(v2 - 24) + 36) & 1) == 0)
  {
    __cxa_end_catch();
    JUMPOUT(0x1000199BCLL);
  }
  __cxa_rethrow();
}

void sub_100019A78(_Unwind_Exception *a1)
{
}

const void **sub_100019A8C(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void *sub_100019AC0(void *a1, uint64_t a2, uint64_t a3)
{
  std::ostream::sentry::sentry();
  uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
  uint64_t v7 = *(void *)(v6 + 40);
  int v8 = *(_DWORD *)(v6 + 8);
  int v9 = *(_DWORD *)(v6 + 144);
  if (v9 == -1)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
    uint64_t v10 = std::locale::use_facet(&v13, &std::ctype<char>::id);
    int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
    std::locale::~locale(&v13);
    *(_DWORD *)(v6 + 144) = v9;
  }
  if ((v8 & 0xB0) == 0x20) {
    uint64_t v11 = a2 + a3;
  }
  else {
    uint64_t v11 = a2;
  }
  if (!sub_100019C6C(v7, a2, v11, a2 + a3, v6, (char)v9)) {
    std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
  }
  std::ostream::sentry::~sentry();
  return a1;
}

void sub_100019C04(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  std::ostream::sentry::~sentry();
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x100019BE4);
}

void sub_100019C58(_Unwind_Exception *a1)
{
}

uint64_t sub_100019C6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      size_t v12 = 0;
    }
    else {
      size_t v12 = v11 - (a4 - a2);
    }
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1) != a3 - a2) {
      return 0;
    }
    if ((uint64_t)v12 >= 1)
    {
      memset(__b, 170, sizeof(__b));
      if (v12 >= 0x7FFFFFFFFFFFFFF8) {
        sub_100006DCC();
      }
      if (v12 >= 0x17)
      {
        uint64_t v14 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v12 | 7) != 0x17) {
          uint64_t v14 = v12 | 7;
        }
        uint64_t v15 = v14 + 1;
        std::locale v13 = (void **)operator new(v14 + 1);
        __b[1] = (void *)v12;
        __b[2] = (void *)(v15 | 0x8000000000000000);
        __b[0] = v13;
      }
      else
      {
        HIBYTE(__b[2]) = v12;
        std::locale v13 = __b;
      }
      memset(v13, __c, v12);
      *((unsigned char *)v13 + v12) = 0;
      if (SHIBYTE(__b[2]) >= 0) {
        int v16 = __b;
      }
      else {
        int v16 = (void **)__b[0];
      }
      uint64_t v17 = (*(uint64_t (**)(uint64_t, void **, size_t))(*(void *)v6 + 96))(v6, v16, v12);
      uint64_t v18 = v17;
      if (SHIBYTE(__b[2]) < 0)
      {
        operator delete(__b[0]);
        if (v18 != v12) {
          return 0;
        }
      }
      else if (v17 != v12)
      {
        return 0;
      }
    }
    uint64_t v19 = a4 - a3;
    if (v19 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v6 + 96))(v6, a3, v19) == v19)
    {
      *(void *)(a5 + 24) = 0;
      return v6;
    }
    return 0;
  }
  return v6;
}

void sub_100019E4C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void util::readPlistToCFDictionary(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = (const char *)a1;
  if (*(char *)(a1 + 23) < 0) {
    uint64_t v2 = *(const char **)a1;
  }
  unint64_t v4 = (__CFError *)CFStringCreateWithCString(kCFAllocatorDefault, v2, 0x8000100u);
  error[3] = v4;
  signed __int8 v5 = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, (CFStringRef)v4, kCFURLPOSIXPathStyle, 0);
  error[2] = v5;
  *a2 = 0;
  if (v5) {
    uint64_t v6 = sub_10001A148;
  }
  else {
    uint64_t v6 = 0;
  }
  if (v6)
  {
    uint64_t v7 = CFReadStreamCreateWithFile(kCFAllocatorDefault, v5);
    int v8 = v7;
    error[1] = v7;
    if (v7) {
      int v9 = sub_10001A150;
    }
    else {
      int v9 = 0;
    }
    if (!v9) {
      goto LABEL_16;
    }
    CFReadStreamOpen(v7);
    error[0] = 0;
    CFPropertyListRef v10 = CFPropertyListCreateWithStream(kCFAllocatorDefault, v8, 0, 1uLL, 0, error);
    *a2 = v10;
    CFReadStreamClose(v8);
    if (!error[0]) {
      goto LABEL_16;
    }
    CFErrorGetDomain(error[0]);
    memset(buf, 0, sizeof(buf));
    ctu::cf::assign();
    *(_OWORD *)std::string __p = *(_OWORD *)buf;
    uint64_t v15 = *(void *)&buf[16];
    uint64_t v11 = GetOsLogContext()[1];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      CFIndex Code = CFErrorGetCode(error[0]);
      std::locale v13 = __p;
      if (v15 < 0) {
        std::locale v13 = (void **)__p[0];
      }
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v5;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = Code;
      *(_WORD *)&buf[22] = 2080;
      uint64_t v18 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to create %@ PropertyList: %ld: %s", buf, 0x20u);
    }
    CFRelease(error[0]);
    *a2 = 0;
    if (v10) {
      CFRelease(v10);
    }
    if ((SHIBYTE(v15) & 0x80000000) == 0)
    {
LABEL_16:
      if (!v8) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
    operator delete(__p[0]);
    if (v8) {
LABEL_17:
    }
      CFRelease(v8);
  }
LABEL_18:
  if (v5) {
    CFRelease(v5);
  }
  if (v4) {
    CFRelease(v4);
  }
}

void sub_10001A0AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, char a17, int a18, __int16 a19, char a20,char a21,int a22,__int16 a23,char a24,char a25,int a26,__int16 a27,char a28,char a29,uint64_t a30,int a31,__int16 a32,char a33,char a34)
{
  if (a2) {
    sub_10000628C(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10001A148(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t sub_10001A150(uint64_t a1)
{
  return *(void *)a1;
}

const void **sub_10001A158(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **sub_10001A18C(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **sub_10001A1C0(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

uint64_t sub_10001A1F4(const std::string *a1, _DWORD *a2)
{
  if ((SHIBYTE(a1->__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    uint64_t result = strcasecmp((const char *)a1, "false");
    if (!result) {
      goto LABEL_29;
    }
    uint64_t result = strcasecmp((const char *)a1, "off");
    if (!result) {
      goto LABEL_29;
    }
    uint64_t result = strcasecmp((const char *)a1, "no");
    if (!result) {
      goto LABEL_29;
    }
    if (strcasecmp((const char *)a1, "true")
      && strcasecmp((const char *)a1, "on")
      && strcasecmp((const char *)a1, "yes")
      && strcasecmp((const char *)a1, "full")
      && strcasecmp((const char *)a1, "streaming"))
    {
      signed __int8 v5 = (const char *)a1;
      if (!strcasecmp((const char *)a1, "lite")) {
        goto LABEL_31;
      }
      goto LABEL_21;
    }
LABEL_28:
    uint64_t result = 1;
LABEL_29:
    *a2 = result;
    return result;
  }
  signed __int8 v5 = (const char *)a1->__r_.__value_.__r.__words[0];
  uint64_t result = strcasecmp(a1->__r_.__value_.__l.__data_, "false");
  if (!result) {
    goto LABEL_29;
  }
  uint64_t result = strcasecmp(v5, "off");
  if (!result) {
    goto LABEL_29;
  }
  uint64_t result = strcasecmp(v5, "no");
  if (!result) {
    goto LABEL_29;
  }
  if (!strcasecmp(v5, "true")
    || !strcasecmp(v5, "on")
    || !strcasecmp(v5, "yes")
    || !strcasecmp(v5, "full")
    || !strcasecmp(v5, "streaming"))
  {
    goto LABEL_28;
  }
  if (!strcasecmp(v5, "lite"))
  {
LABEL_31:
    uint64_t result = 2;
    goto LABEL_29;
  }
LABEL_21:
  if (!strcasecmp(v5, "background")) {
    goto LABEL_31;
  }
  size_t __idx = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = std::stol(a1, &__idx, 10);
  std::string::size_type size = HIBYTE(a1->__r_.__value_.__r.__words[2]);
  if ((size & 0x80u) != 0) {
    std::string::size_type size = a1->__r_.__value_.__l.__size_;
  }
  if (__idx == size && result >= (uint64_t)0xFFFFFFFF80000000 && result <= 0x7FFFFFFF) {
    goto LABEL_29;
  }
  return result;
}

void sub_10001A41C(void *a1)
{
}

void util::findLastLogDumpTimestamp(util *this@<X0>, const char *__s@<X1>, const char *a3@<X2>, int a4@<W3>, char *a5@<X4>, void **a6@<X8>)
{
  unsigned int v287 = a3;
  *a6 = 0;
  a6[1] = 0;
  a6[2] = 0;
  v322 = 0;
  v321 = 0;
  uint64_t v323 = 0;
  memset(v320, 170, 24);
  size_t v10 = strlen(__s);
  if (v10 > 0x7FFFFFFFFFFFFFF7) {
    sub_100006DCC();
  }
  __darwin_ino64_t v11 = v10;
  if (v10 >= 0x17)
  {
    uint64_t v13 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17) {
      uint64_t v13 = v10 | 7;
    }
    uint64_t v14 = v13 + 1;
    size_t v12 = (stat *)operator new(v13 + 1);
    *(void *)&__dst[0].st_uid = v14 | 0x8000000000000000;
    *(void *)&__dst[0].st_dev = v12;
    __dst[0].st_ino = v11;
    goto LABEL_8;
  }
  HIBYTE(__dst[0].st_gid) = v10;
  size_t v12 = __dst;
  if (v10) {
LABEL_8:
  }
    memcpy(v12, __s, v11);
  *((unsigned char *)&v12->st_dev + v11) = 0;
  uint64_t v15 = std::string::append((std::string *)__dst, ".*", 2uLL);
  long long v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
  v320[2] = (void *)v15->__r_.__value_.__r.__words[2];
  *(_OWORD *)v320 = v16;
  v15->__r_.__value_.__l.__size_ = 0;
  v15->__r_.__value_.__r.__words[2] = 0;
  v15->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(__dst[0].st_gid) < 0) {
    operator delete(*(void **)&__dst[0].st_dev);
  }
  *(void *)&long long v17 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v318[32] = v17;
  long long v319 = v17;
  *(_OWORD *)v318 = v17;
  *(_OWORD *)&v318[16] = v17;
  sub_100014F70((uint64_t)v318, (uint64_t)v320, 0);
  *(void *)&long long v18 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v316[32] = v18;
  long long v317 = v18;
  *(_OWORD *)v316 = v18;
  *(_OWORD *)&v316[16] = v18;
  sub_1000074D4((uint64_t)v316, "(\\d{4})-(\\d{2})-(\\d{2})-(\\d{2})-(\\d{2})-(\\d{2})-(\\d{3})", 0);
  size_t v19 = strlen((const char *)this);
  if (v19 > 0x7FFFFFFFFFFFFFF7) {
    sub_100006DCC();
  }
  uint64_t v20 = (void *)v19;
  BOOL v292 = a5 == 0;
  if (v19 >= 0x17)
  {
    uint64_t v22 = (v19 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v19 | 7) != 0x17) {
      uint64_t v22 = v19 | 7;
    }
    uint64_t v23 = v22 + 1;
    unint64_t v21 = operator new(v22 + 1);
    v314[1] = v20;
    unint64_t v315 = v23 | 0x8000000000000000;
    v314[0] = v21;
    goto LABEL_18;
  }
  HIBYTE(v315) = v19;
  unint64_t v21 = v314;
  if (v19) {
LABEL_18:
  }
    memcpy(v21, this, (size_t)v20);
  *((unsigned char *)v20 + (void)v21) = 0;
  std::locale::locale(&v308, (const std::locale *)v318);
  long long v309 = *(_OWORD *)&v318[8];
  long long v310 = *(_OWORD *)&v318[24];
  uint64_t v311 = *(void *)&v318[40];
  v312 = (std::__shared_weak_count *)v319;
  if ((void)v319) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v319 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v313 = *((void *)&v319 + 1);
  BOOL v24 = sub_100006658((const char *)v314, (uint64_t)&v308, (uint64_t)&v321, 0);
  uint64_t v25 = v312;
  if (v312 && !atomic_fetch_add(&v312->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
    std::__shared_weak_count::__release_weak(v25);
    std::locale::~locale(&v308);
    if ((SHIBYTE(v315) & 0x80000000) == 0)
    {
LABEL_24:
      if (v24) {
        goto LABEL_25;
      }
LABEL_391:
      v188 = a6;
      if (!v287) {
        goto LABEL_432;
      }
LABEL_392:
      if (*((char *)v188 + 23) < 0)
      {
        sub_100006EA8(v299, *v188, (unint64_t)v188[1]);
      }
      else
      {
        *(_OWORD *)v299 = *(_OWORD *)v188;
        v300 = v188[2];
      }
      std::locale::locale(&v293, (const std::locale *)v316);
      long long v294 = *(_OWORD *)&v316[8];
      long long v295 = *(_OWORD *)&v316[24];
      uint64_t v296 = *(void *)&v316[40];
      v297 = (std::__shared_weak_count *)v317;
      if ((void)v317) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v317 + 8), 1uLL, memory_order_relaxed);
      }
      uint64_t v298 = *((void *)&v317 + 1);
      *(void *)&long long v189 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v189 + 1) = 0xAAAAAAAAAAAAAAAALL;
      unint64_t v349 = 0xAAAAAAAAAAAAAA00;
      v346[3] = 0xAAAAAAAAAAAAAAAALL;
      long long v352 = v189;
      uint64_t v347 = 0;
      uint64_t v348 = 0;
      uint64_t v351 = 0;
      uint64_t v350 = 0;
      LOBYTE(v352) = 0;
      BYTE8(v352) = 0;
      uint64_t v353 = 0;
      *(_OWORD *)v345 = 0u;
      memset(v346, 0, 25);
      v190 = (char *)HIBYTE(v300);
      if (SHIBYTE(v300) >= 0) {
        v191 = v299;
      }
      else {
        v191 = (void **)v299[0];
      }
      if (SHIBYTE(v300) < 0) {
        v190 = (char *)v299[1];
      }
      v192 = &v190[(void)v191];
      __dst[0].st_ctimespec = (timespec)0xAAAAAAAAAAAAAA00;
      __dst[0].st_atimespec.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)&__dst[0].st_birthtimespec.tv_nsec = v189;
      __dst[0].st_mtimespec = 0uLL;
      __dst[0].st_birthtimespec.tv_sec = 0;
      LOBYTE(__dst[0].st_birthtimespec.tv_nsec) = 0;
      LOBYTE(__dst[0].st_size) = 0;
      __dst[0].st_blocks = 0;
      memset(__dst, 0, 41);
      int v193 = sub_1000125E4((uint64_t)&v293, (uint64_t)v191, (uint64_t)&v190[(void)v191], (uint64_t)__dst, 4160);
      sub_1000128F4(v345, (uint64_t)v191, v192, (uint64_t *)&__dst[0].st_dev, 0);
      if (*(void *)&__dst[0].st_dev)
      {
        __dst[0].st_ino = *(void *)&__dst[0].st_dev;
        operator delete(*(void **)&__dst[0].st_dev);
      }
      if ((_BYTE)v352) {
        int v194 = 0;
      }
      else {
        int v194 = v193;
      }
      if (v194 != 1)
      {
        BOOL v206 = 0;
        v207 = v345[0];
        if (!v345[0]) {
          goto LABEL_420;
        }
        goto LABEL_419;
      }
      memset(__dst, 0, 56);
      v195 = v345[0];
      if (!*((unsigned char *)v345[0] + 40))
      {
        memset(v339, 0, 24);
        goto LABEL_458;
      }
      uint64_t v197 = *((void *)v345[0] + 3);
      v196 = (char *)*((void *)v345[0] + 4);
      unint64_t v198 = (unint64_t)&v196[-v197];
      if ((unint64_t)&v196[-v197] > 0x7FFFFFFFFFFFFFF7) {
        sub_100006DCC();
      }
      if (v198 > 0x16)
      {
        uint64_t v214 = (v198 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v198 | 7) != 0x17) {
          uint64_t v214 = v198 | 7;
        }
        uint64_t v215 = v214 + 1;
        v199 = operator new(v214 + 1);
        *(void *)&v339[16] = v215 | 0x8000000000000000;
        *(void *)v339 = v199;
        *(void *)&v339[8] = &v196[-v197];
        if ((char *)v197 != v196)
        {
LABEL_412:
          if (v198 < 0x20 || (unint64_t)&v199[-v197] < 0x20)
          {
            v200 = v199;
            v201 = (char *)v197;
          }
          else
          {
            v200 = &v199[v198 & 0xFFFFFFFFFFFFFFE0];
            v201 = (char *)(v197 + (v198 & 0xFFFFFFFFFFFFFFE0));
            v202 = (long long *)(v197 + 16);
            v203 = v199 + 16;
            unint64_t v204 = v198 & 0xFFFFFFFFFFFFFFE0;
            do
            {
              long long v205 = *v202;
              *(v203 - 1) = *(v202 - 1);
              _OWORD *v203 = v205;
              v202 += 2;
              v203 += 2;
              v204 -= 32;
            }
            while (v204);
            if (v198 == (v198 & 0xFFFFFFFFFFFFFFE0)) {
              goto LABEL_457;
            }
          }
          do
          {
            char v216 = *v201++;
            *v200++ = v216;
          }
          while (v201 != v196);
LABEL_457:
          unsigned char *v200 = 0;
LABEL_458:
          sub_10001A1F4((const std::string *)v339, &__dst[0].st_gid);
          if ((v339[23] & 0x80000000) != 0)
          {
            operator delete(*(void **)v339);
            __dst[0].st_gid -= 1900;
            if (*((unsigned char *)v195 + 64))
            {
LABEL_460:
              uint64_t v218 = v195[6];
              v217 = (char *)v195[7];
              unint64_t v219 = (unint64_t)&v217[-v218];
              if ((unint64_t)&v217[-v218] > 0x7FFFFFFFFFFFFFF7) {
                sub_100006DCC();
              }
              if (v219 > 0x16)
              {
                uint64_t v227 = (v219 & 0xFFFFFFFFFFFFFFF8) + 8;
                if ((v219 | 7) != 0x17) {
                  uint64_t v227 = v219 | 7;
                }
                uint64_t v228 = v227 + 1;
                v220 = operator new(v227 + 1);
                *(void *)&v339[16] = v228 | 0x8000000000000000;
                *(void *)v339 = v220;
                *(void *)&v339[8] = &v217[-v218];
                if ((char *)v218 != v217)
                {
LABEL_463:
                  if (v219 < 0x20 || (unint64_t)&v220[-v218] < 0x20)
                  {
                    v221 = v220;
                    v222 = (char *)v218;
                  }
                  else
                  {
                    v221 = &v220[v219 & 0xFFFFFFFFFFFFFFE0];
                    v222 = (char *)(v218 + (v219 & 0xFFFFFFFFFFFFFFE0));
                    v223 = (long long *)(v218 + 16);
                    v224 = v220 + 16;
                    unint64_t v225 = v219 & 0xFFFFFFFFFFFFFFE0;
                    do
                    {
                      long long v226 = *v223;
                      *(v224 - 1) = *(v223 - 1);
                      _OWORD *v224 = v226;
                      v223 += 2;
                      v224 += 2;
                      v225 -= 32;
                    }
                    while (v225);
                    if (v219 == (v219 & 0xFFFFFFFFFFFFFFE0)) {
                      goto LABEL_477;
                    }
                  }
                  do
                  {
                    char v229 = *v222++;
                    *v221++ = v229;
                  }
                  while (v222 != v217);
LABEL_477:
                  unsigned char *v221 = 0;
LABEL_478:
                  sub_10001A1F4((const std::string *)v339, &__dst[0].st_uid);
                  if ((v339[23] & 0x80000000) != 0)
                  {
                    operator delete(*(void **)v339);
                    --__dst[0].st_uid;
                    if (*((unsigned char *)v195 + 88))
                    {
LABEL_480:
                      uint64_t v231 = v195[9];
                      v230 = (char *)v195[10];
                      unint64_t v232 = (unint64_t)&v230[-v231];
                      if ((unint64_t)&v230[-v231] > 0x7FFFFFFFFFFFFFF7) {
                        sub_100006DCC();
                      }
                      if (v232 > 0x16)
                      {
                        uint64_t v240 = (v232 & 0xFFFFFFFFFFFFFFF8) + 8;
                        if ((v232 | 7) != 0x17) {
                          uint64_t v240 = v232 | 7;
                        }
                        uint64_t v241 = v240 + 1;
                        v233 = operator new(v240 + 1);
                        *(void *)&v339[16] = v241 | 0x8000000000000000;
                        *(void *)v339 = v233;
                        *(void *)&v339[8] = &v230[-v231];
                        if ((char *)v231 != v230)
                        {
LABEL_483:
                          if (v232 < 0x20 || (unint64_t)&v233[-v231] < 0x20)
                          {
                            v234 = v233;
                            v235 = (char *)v231;
                          }
                          else
                          {
                            v234 = &v233[v232 & 0xFFFFFFFFFFFFFFE0];
                            v235 = (char *)(v231 + (v232 & 0xFFFFFFFFFFFFFFE0));
                            v236 = (long long *)(v231 + 16);
                            v237 = v233 + 16;
                            unint64_t v238 = v232 & 0xFFFFFFFFFFFFFFE0;
                            do
                            {
                              long long v239 = *v236;
                              *(v237 - 1) = *(v236 - 1);
                              _OWORD *v237 = v239;
                              v236 += 2;
                              v237 += 2;
                              v238 -= 32;
                            }
                            while (v238);
                            if (v232 == (v232 & 0xFFFFFFFFFFFFFFE0)) {
                              goto LABEL_497;
                            }
                          }
                          do
                          {
                            char v242 = *v235++;
                            *v234++ = v242;
                          }
                          while (v235 != v230);
LABEL_497:
                          unsigned char *v234 = 0;
LABEL_498:
                          sub_10001A1F4((const std::string *)v339, (_DWORD *)((unint64_t)__dst | 0xC));
                          if ((v339[23] & 0x80000000) != 0)
                          {
                            operator delete(*(void **)v339);
                            if (*((unsigned char *)v195 + 112))
                            {
LABEL_500:
                              uint64_t v244 = v195[12];
                              v243 = (char *)v195[13];
                              unint64_t v245 = (unint64_t)&v243[-v244];
                              if ((unint64_t)&v243[-v244] > 0x7FFFFFFFFFFFFFF7) {
                                sub_100006DCC();
                              }
                              if (v245 > 0x16)
                              {
                                uint64_t v253 = (v245 & 0xFFFFFFFFFFFFFFF8) + 8;
                                if ((v245 | 7) != 0x17) {
                                  uint64_t v253 = v245 | 7;
                                }
                                uint64_t v254 = v253 + 1;
                                v246 = operator new(v253 + 1);
                                *(void *)&v339[16] = v254 | 0x8000000000000000;
                                *(void *)v339 = v246;
                                *(void *)&v339[8] = &v243[-v244];
                                if ((char *)v244 != v243)
                                {
LABEL_503:
                                  if (v245 < 0x20 || (unint64_t)&v246[-v244] < 0x20)
                                  {
                                    v247 = v246;
                                    v248 = (char *)v244;
                                  }
                                  else
                                  {
                                    v247 = &v246[v245 & 0xFFFFFFFFFFFFFFE0];
                                    v248 = (char *)(v244 + (v245 & 0xFFFFFFFFFFFFFFE0));
                                    v249 = (long long *)(v244 + 16);
                                    v250 = v246 + 16;
                                    unint64_t v251 = v245 & 0xFFFFFFFFFFFFFFE0;
                                    do
                                    {
                                      long long v252 = *v249;
                                      *(v250 - 1) = *(v249 - 1);
                                      _OWORD *v250 = v252;
                                      v249 += 2;
                                      v250 += 2;
                                      v251 -= 32;
                                    }
                                    while (v251);
                                    if (v245 == (v245 & 0xFFFFFFFFFFFFFFE0)) {
                                      goto LABEL_517;
                                    }
                                  }
                                  do
                                  {
                                    char v255 = *v248++;
                                    *v247++ = v255;
                                  }
                                  while (v248 != v243);
LABEL_517:
                                  unsigned char *v247 = 0;
LABEL_518:
                                  sub_10001A1F4((const std::string *)v339, &__dst[0].st_ino);
                                  if ((v339[23] & 0x80000000) != 0)
                                  {
                                    operator delete(*(void **)v339);
                                    if (*((unsigned char *)v195 + 136))
                                    {
LABEL_520:
                                      uint64_t v257 = v195[15];
                                      v256 = (char *)v195[16];
                                      unint64_t v258 = (unint64_t)&v256[-v257];
                                      if ((unint64_t)&v256[-v257] > 0x7FFFFFFFFFFFFFF7) {
                                        sub_100006DCC();
                                      }
                                      if (v258 > 0x16)
                                      {
                                        uint64_t v266 = (v258 & 0xFFFFFFFFFFFFFFF8) + 8;
                                        if ((v258 | 7) != 0x17) {
                                          uint64_t v266 = v258 | 7;
                                        }
                                        uint64_t v267 = v266 + 1;
                                        v259 = operator new(v266 + 1);
                                        *(void *)&v339[16] = v267 | 0x8000000000000000;
                                        *(void *)v339 = v259;
                                        *(void *)&v339[8] = &v256[-v257];
                                        if ((char *)v257 != v256)
                                        {
LABEL_523:
                                          if (v258 < 0x20 || (unint64_t)&v259[-v257] < 0x20)
                                          {
                                            v260 = v259;
                                            v261 = (char *)v257;
                                          }
                                          else
                                          {
                                            v260 = &v259[v258 & 0xFFFFFFFFFFFFFFE0];
                                            v261 = (char *)(v257 + (v258 & 0xFFFFFFFFFFFFFFE0));
                                            v262 = (long long *)(v257 + 16);
                                            v263 = v259 + 16;
                                            unint64_t v264 = v258 & 0xFFFFFFFFFFFFFFE0;
                                            do
                                            {
                                              long long v265 = *v262;
                                              *(v263 - 1) = *(v262 - 1);
                                              _OWORD *v263 = v265;
                                              v262 += 2;
                                              v263 += 2;
                                              v264 -= 32;
                                            }
                                            while (v264);
                                            if (v258 == (v258 & 0xFFFFFFFFFFFFFFE0)) {
                                              goto LABEL_537;
                                            }
                                          }
                                          do
                                          {
                                            char v268 = *v261++;
                                            *v260++ = v268;
                                          }
                                          while (v261 != v256);
LABEL_537:
                                          unsigned char *v260 = 0;
LABEL_538:
                                          sub_10001A1F4((const std::string *)v339, &__dst[0].st_mode);
                                          if ((v339[23] & 0x80000000) != 0)
                                          {
                                            operator delete(*(void **)v339);
                                            if (*((unsigned char *)v195 + 160))
                                            {
LABEL_540:
                                              uint64_t v270 = v195[18];
                                              v269 = (char *)v195[19];
                                              unint64_t v271 = (unint64_t)&v269[-v270];
                                              if ((unint64_t)&v269[-v270] > 0x7FFFFFFFFFFFFFF7) {
                                                sub_100006DCC();
                                              }
                                              if (v271 > 0x16)
                                              {
                                                uint64_t v279 = (v271 & 0xFFFFFFFFFFFFFFF8) + 8;
                                                if ((v271 | 7) != 0x17) {
                                                  uint64_t v279 = v271 | 7;
                                                }
                                                uint64_t v280 = v279 + 1;
                                                v272 = operator new(v279 + 1);
                                                *(void *)&v339[16] = v280 | 0x8000000000000000;
                                                *(void *)v339 = v272;
                                                *(void *)&v339[8] = &v269[-v270];
                                                if ((char *)v270 != v269)
                                                {
LABEL_543:
                                                  if (v271 < 0x20 || (unint64_t)&v272[-v270] < 0x20)
                                                  {
                                                    v273 = v272;
                                                    v274 = (char *)v270;
                                                  }
                                                  else
                                                  {
                                                    v273 = &v272[v271 & 0xFFFFFFFFFFFFFFE0];
                                                    v274 = (char *)(v270 + (v271 & 0xFFFFFFFFFFFFFFE0));
                                                    v275 = (long long *)(v270 + 16);
                                                    v276 = v272 + 16;
                                                    unint64_t v277 = v271 & 0xFFFFFFFFFFFFFFE0;
                                                    do
                                                    {
                                                      long long v278 = *v275;
                                                      *(v276 - 1) = *(v275 - 1);
                                                      _OWORD *v276 = v278;
                                                      v275 += 2;
                                                      v276 += 2;
                                                      v277 -= 32;
                                                    }
                                                    while (v277);
                                                    if (v271 == (v271 & 0xFFFFFFFFFFFFFFE0)) {
                                                      goto LABEL_557;
                                                    }
                                                  }
                                                  do
                                                  {
                                                    char v281 = *v274++;
                                                    *v273++ = v281;
                                                  }
                                                  while (v274 != v269);
LABEL_557:
                                                  unsigned char *v273 = 0;
LABEL_558:
                                                  sub_10001A1F4((const std::string *)v339, __dst);
                                                  if ((v339[23] & 0x80000000) != 0) {
                                                    operator delete(*(void **)v339);
                                                  }
                                                  LODWORD(__dst[0].st_atimespec.tv_sec) = -1;
                                                  time_t v282 = mktime((tm *)__dst);
                                                  memset(v339, 170, 16);
                                                  Timestamp::now((Timestamp *)v339, v283);
                                                  BOOL v206 = *(void *)v339 - v282 > v287;
                                                  v207 = v345[0];
                                                  if (!v345[0])
                                                  {
LABEL_420:
                                                    v208 = v297;
                                                    if (v297
                                                      && !atomic_fetch_add(&v297->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                                                    {
                                                      ((void (*)(std::__shared_weak_count *))v208->__on_zero_shared)(v208);
                                                      std::__shared_weak_count::__release_weak(v208);
                                                      std::locale::~locale(&v293);
                                                      if ((SHIBYTE(v300) & 0x80000000) == 0)
                                                      {
LABEL_423:
                                                        if (!v206) {
                                                          goto LABEL_432;
                                                        }
LABEL_427:
                                                        if (*((char *)v188 + 23) < 0)
                                                        {
                                                          *(unsigned char *)*v188 = 0;
                                                          v188[1] = 0;
                                                        }
                                                        else
                                                        {
                                                          *(unsigned char *)v188 = 0;
                                                          *((unsigned char *)v188 + 23) = 0;
                                                        }
                                                        goto LABEL_432;
                                                      }
                                                    }
                                                    else
                                                    {
                                                      std::locale::~locale(&v293);
                                                      if ((SHIBYTE(v300) & 0x80000000) == 0) {
                                                        goto LABEL_423;
                                                      }
                                                    }
                                                    operator delete(v299[0]);
                                                    if (!v206) {
                                                      goto LABEL_432;
                                                    }
                                                    goto LABEL_427;
                                                  }
LABEL_419:
                                                  v345[1] = v207;
                                                  operator delete(v207);
                                                  goto LABEL_420;
                                                }
                                              }
                                              else
                                              {
                                                v339[23] = (_BYTE)v269 - v270;
                                                v272 = v339;
                                                if ((char *)v270 != v269) {
                                                  goto LABEL_543;
                                                }
                                              }
                                              unsigned char *v272 = 0;
                                              goto LABEL_558;
                                            }
                                          }
                                          else if (*((unsigned char *)v195 + 160))
                                          {
                                            goto LABEL_540;
                                          }
                                          memset(v339, 0, 24);
                                          goto LABEL_558;
                                        }
                                      }
                                      else
                                      {
                                        v339[23] = (_BYTE)v256 - v257;
                                        v259 = v339;
                                        if ((char *)v257 != v256) {
                                          goto LABEL_523;
                                        }
                                      }
                                      unsigned char *v259 = 0;
                                      goto LABEL_538;
                                    }
                                  }
                                  else if (*((unsigned char *)v195 + 136))
                                  {
                                    goto LABEL_520;
                                  }
                                  memset(v339, 0, 24);
                                  goto LABEL_538;
                                }
                              }
                              else
                              {
                                v339[23] = (_BYTE)v243 - v244;
                                v246 = v339;
                                if ((char *)v244 != v243) {
                                  goto LABEL_503;
                                }
                              }
                              unsigned char *v246 = 0;
                              goto LABEL_518;
                            }
                          }
                          else if (*((unsigned char *)v195 + 112))
                          {
                            goto LABEL_500;
                          }
                          memset(v339, 0, 24);
                          goto LABEL_518;
                        }
                      }
                      else
                      {
                        v339[23] = (_BYTE)v230 - v231;
                        v233 = v339;
                        if ((char *)v231 != v230) {
                          goto LABEL_483;
                        }
                      }
                      unsigned char *v233 = 0;
                      goto LABEL_498;
                    }
                  }
                  else
                  {
                    --__dst[0].st_uid;
                    if (*((unsigned char *)v195 + 88)) {
                      goto LABEL_480;
                    }
                  }
                  memset(v339, 0, 24);
                  goto LABEL_498;
                }
              }
              else
              {
                v339[23] = (_BYTE)v217 - v218;
                v220 = v339;
                if ((char *)v218 != v217) {
                  goto LABEL_463;
                }
              }
              unsigned char *v220 = 0;
              goto LABEL_478;
            }
          }
          else
          {
            __dst[0].st_gid -= 1900;
            if (*((unsigned char *)v195 + 64)) {
              goto LABEL_460;
            }
          }
          memset(v339, 0, 24);
          goto LABEL_478;
        }
      }
      else
      {
        v339[23] = (_BYTE)v196 - v197;
        v199 = v339;
        if ((char *)v197 != v196) {
          goto LABEL_412;
        }
      }
      unsigned char *v199 = 0;
      goto LABEL_458;
    }
  }
  else
  {
    std::locale::~locale(&v308);
    if ((SHIBYTE(v315) & 0x80000000) == 0) {
      goto LABEL_24;
    }
  }
  operator delete(v314[0]);
  if (!v24) {
    goto LABEL_391;
  }
LABEL_25:
  unint64_t v26 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (((char *)v322 - (unsigned char *)v321) >> 3));
  if (v322 == v321) {
    uint64_t v27 = 0;
  }
  else {
    uint64_t v27 = v26;
  }
  sub_10001CA38((uint64_t)v321, v322, (uint64_t)__dst, v27, 1);
  v286 = (char *)this;
  v306[0] = 0;
  v306[1] = 0;
  v307 = 0;
  uint64_t v28 = (const void **)v321;
  v291 = v322;
  if (v321 == v322)
  {
LABEL_387:
    v188 = a6;
    if (!v287) {
      goto LABEL_432;
    }
    goto LABEL_392;
  }
  __sa = a5;
  while (1)
  {
    memset(__p, 170, 24);
    unint64_t v29 = __p;
    if (*((char *)v28 + 23) < 0)
    {
      sub_100006EA8(__p, (void *)*v28, (unint64_t)v28[1]);
    }
    else
    {
      long long v30 = *(_OWORD *)v28;
      __p[2] = (void *)v28[2];
      *(_OWORD *)std::string __p = v30;
    }
    int64_t v31 = SHIBYTE(v307) >= 0 ? (void *)HIBYTE(v307) : v306[1];
    int v32 = (char *)HIBYTE(__p[2]);
    int v33 = SHIBYTE(__p[2]);
    unint64_t v34 = (void **)__p[0];
    if (!v31) {
      break;
    }
    if (SHIBYTE(v307) >= 0) {
      uint64_t v35 = v306;
    }
    else {
      uint64_t v35 = (void **)v306[0];
    }
    if (SHIBYTE(__p[2]) < 0) {
      unint64_t v29 = (void **)__p[0];
    }
    uint64_t v36 = (uint64_t)__p[1];
    if (SHIBYTE(__p[2]) >= 0) {
      uint64_t v36 = HIBYTE(__p[2]);
    }
    if (v36 < (uint64_t)v31) {
      break;
    }
    float64x2x2_t v62 = (char *)v29 + v36;
    int v63 = *(char *)v35;
    float64x2x2_t v64 = v29;
    while (1)
    {
      uint64_t v65 = v36 - (void)v31;
      if (v65 == -1) {
        goto LABEL_46;
      }
      uint64_t v66 = (char *)memchr(v64, v63, v65 + 1);
      if (!v66) {
        goto LABEL_46;
      }
      uint64_t v67 = v66;
      if (!memcmp(v66, v35, (size_t)v31)) {
        break;
      }
      float64x2x2_t v64 = (void **)(v67 + 1);
      uint64_t v36 = v62 - (v67 + 1);
      if (v36 < (uint64_t)v31) {
        goto LABEL_46;
      }
    }
    if (v67 == v62 || v67 - (char *)v29 == -1) {
      break;
    }
    int v60 = 3;
    if ((v33 & 0x80) != 0) {
      goto LABEL_102;
    }
LABEL_359:
    if (v60 != 3) {
      goto LABEL_360;
    }
LABEL_30:
    v28 += 3;
    if (v28 == v291) {
      goto LABEL_386;
    }
  }
LABEL_46:
  *(void *)&long long v37 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v37 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v352 = v37;
  unint64_t v349 = 0xAAAAAAAAAAAAAA00;
  v346[3] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v347 = 0;
  uint64_t v348 = 0;
  uint64_t v350 = 0;
  uint64_t v351 = 0;
  LOBYTE(v352) = 0;
  BYTE8(v352) = 0;
  uint64_t v353 = 0;
  *(_OWORD *)v345 = 0u;
  memset(v346, 0, 25);
  if (v292)
  {
    uint64_t v38 = __p[1];
    *(_OWORD *)&__dst[0].st_birthtimespec.tv_nsec = v37;
    __dst[0].st_ctimespec = (timespec)0xAAAAAAAAAAAAAA00;
    __dst[0].st_atimespec.tv_nsec = v37;
    __dst[0].st_mtimespec = 0uLL;
    __dst[0].st_birthtimespec.tv_sec = 0;
    LOBYTE(__dst[0].st_birthtimespec.tv_nsec) = 0;
    LOBYTE(__dst[0].st_size) = 0;
    __dst[0].st_blocks = 0;
    memset(__dst, 0, 32);
    if (v33 >= 0) {
      BOOL v39 = __p;
    }
    else {
      BOOL v39 = v34;
    }
    if (v33 >= 0) {
      uint64_t v38 = v32;
    }
    *(_OWORD *)((char *)&__dst[0].st_rdev + 1) = 0uLL;
    int v40 = sub_1000125E4((uint64_t)v316, (uint64_t)v39, (uint64_t)v38 + (void)v39, (uint64_t)__dst, 0);
    uint64_t v41 = (char *)HIBYTE(__p[2]);
    if (SHIBYTE(__p[2]) >= 0) {
      uint64_t v42 = __p;
    }
    else {
      uint64_t v42 = (void **)__p[0];
    }
    if (SHIBYTE(__p[2]) < 0) {
      uint64_t v41 = (char *)__p[1];
    }
    sub_1000128F4(v345, (uint64_t)v42, &v41[(void)v42], (uint64_t *)&__dst[0].st_dev, 0);
    if (*(void *)&__dst[0].st_dev)
    {
      __dst[0].st_ino = *(void *)&__dst[0].st_dev;
      operator delete(*(void **)&__dst[0].st_dev);
    }
    if (v40)
    {
      long long v43 = &v346[3];
      if (v345[1] != v345[0]) {
        long long v43 = (char *)v345[0] + 16;
      }
      if (!*v43)
      {
        memset(__dst, 0, 24);
        unint64_t v49 = a6;
        if ((*((char *)a6 + 23) & 0x80000000) == 0) {
          goto LABEL_112;
        }
        goto LABEL_97;
      }
      int64_t v44 = &v346[1];
      if (v345[1] != v345[0]) {
        int64_t v44 = (uint64_t *)v345[0];
      }
      uint64_t v45 = *v44;
      int64_t v46 = (char **)((char *)v345[0] + 8);
      if (v345[1] == v345[0]) {
        int64_t v46 = (char **)&v346[2];
      }
      unint64_t v47 = *v46;
      __darwin_ino64_t v48 = (__darwin_ino64_t)&(*v46)[-v45];
      unint64_t v49 = a6;
      if (v48 > 0x7FFFFFFFFFFFFFF7) {
        sub_100006DCC();
      }
      if (v48 > 0x16)
      {
        uint64_t v74 = (v48 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v48 | 7) != 0x17) {
          uint64_t v74 = v48 | 7;
        }
        uint64_t v75 = v74 + 1;
        unint64_t v50 = (stat *)operator new(v74 + 1);
        *(void *)&__dst[0].st_uid = v75 | 0x8000000000000000;
        *(void *)&__dst[0].st_dev = v50;
        __dst[0].st_ino = v48;
        unint64_t v49 = a6;
        if ((char *)v45 != v47)
        {
LABEL_70:
          if (v48 < 0x20 || (unint64_t)v50 - v45 < 0x20)
          {
            BOOL v51 = v50;
            char v52 = (char *)v45;
          }
          else
          {
            BOOL v51 = (stat *)((char *)v50 + (v48 & 0xFFFFFFFFFFFFFFE0));
            char v52 = (char *)(v45 + (v48 & 0xFFFFFFFFFFFFFFE0));
            BOOL v53 = (long long *)(v45 + 16);
            p_st_uid = &v50->st_uid;
            unint64_t v55 = v48 & 0xFFFFFFFFFFFFFFE0;
            do
            {
              long long v56 = *v53;
              *((_OWORD *)p_st_uid - 1) = *(v53 - 1);
              *(_OWORD *)p_st_uid = v56;
              v53 += 2;
              p_st_uid += 8;
              v55 -= 32;
            }
            while (v55);
            if (v48 == (v48 & 0x7FFFFFFFFFFFFFE0))
            {
LABEL_111:
              LOBYTE(v51->st_dev) = 0;
              if ((*((char *)v49 + 23) & 0x80000000) == 0)
              {
LABEL_112:
                *(_OWORD *)unint64_t v49 = *(_OWORD *)&__dst[0].st_dev;
                v49[2] = *(void **)&__dst[0].st_uid;
                if (a4) {
                  goto LABEL_113;
                }
                goto LABEL_354;
              }
LABEL_97:
              operator delete(*v49);
              *(_OWORD *)unint64_t v49 = *(_OWORD *)&__dst[0].st_dev;
              v49[2] = *(void **)&__dst[0].st_uid;
              if (a4)
              {
LABEL_113:
                size_t v77 = strlen(v286);
                if (v77 > 0x7FFFFFFFFFFFFFF7) {
                  sub_100006DCC();
                }
                size_t v78 = v77;
                if (v77 >= 0x17)
                {
                  uint64_t v81 = (v77 & 0xFFFFFFFFFFFFFFF8) + 8;
                  if ((v77 | 7) != 0x17) {
                    uint64_t v81 = v77 | 7;
                  }
                  uint64_t v82 = v81 + 1;
                  long long v79 = (long long *)operator new(v81 + 1);
                  *((void *)&v303 + 1) = v78;
                  int64_t v304 = v82 | 0x8000000000000000;
                  *(void *)&long long v303 = v79;
                }
                else
                {
                  HIBYTE(v304) = v77;
                  long long v79 = &v303;
                  if (!v77)
                  {
                    LOBYTE(v303) = 0;
                    uint64_t v80 = a6;
                    if ((*((char *)a6 + 23) & 0x80000000) == 0)
                    {
LABEL_117:
                      *(_OWORD *)v301 = *(_OWORD *)v80;
                      v302 = v80[2];
                      goto LABEL_123;
                    }
LABEL_122:
                    sub_100006EA8(v301, *v80, (unint64_t)v80[1]);
LABEL_123:
                    v342 = 0;
                    v341 = 0;
                    uint64_t v343 = 0;
                    *(void *)&long long v83 = 0xAAAAAAAAAAAAAAAALL;
                    *((void *)&v83 + 1) = 0xAAAAAAAAAAAAAAAALL;
                    *(_OWORD *)&v339[32] = v83;
                    long long v340 = v83;
                    *(_OWORD *)v339 = v83;
                    *(_OWORD *)&v339[16] = v83;
                    int v84 = SHIBYTE(v302);
                    if (SHIBYTE(v302) >= 0) {
                      size_t v85 = HIBYTE(v302);
                    }
                    else {
                      size_t v85 = (size_t)v301[1];
                    }
                    unint64_t v86 = v85 + 2;
                    memset(&v355, 170, sizeof(v355));
                    if (v85 + 2 > 0x7FFFFFFFFFFFFFF7) {
                      sub_100006DCC();
                    }
                    if (v86 >= 0x17)
                    {
                      uint64_t v88 = (v86 & 0xFFFFFFFFFFFFFFF8) + 8;
                      if ((v86 | 7) != 0x17) {
                        uint64_t v88 = v86 | 7;
                      }
                      uint64_t v89 = v88 + 1;
                      int v90 = operator new(v88 + 1);
                      v355.__r_.__value_.__l.__size_ = v85 + 2;
                      v355.__r_.__value_.__r.__words[2] = v89 | 0x8000000000000000;
                      v355.__r_.__value_.__r.__words[0] = (std::string::size_type)v90;
                      *int v90 = 10798;
                      long long v87 = (std::string::value_type *)(v90 + 1);
                    }
                    else
                    {
                      v355.__r_.__value_.__r.__words[2] = 0;
                      *(_OWORD *)&v355.__r_.__value_.__l.__data_ = 0x2A2EuLL;
                      *((unsigned char *)&v355.__r_.__value_.__s + 23) = v85 + 2;
                      long long v87 = &v355.__r_.__value_.__s.__data_[2];
                      if (!v85) {
                        goto LABEL_137;
                      }
                    }
                    if (v84 >= 0) {
                      uint64_t v91 = v301;
                    }
                    else {
                      uint64_t v91 = (void **)v301[0];
                    }
                    memmove(v87, v91, v85);
LABEL_137:
                    v87[v85] = 0;
                    unint64_t v92 = std::string::append(&v355, ".*", 2uLL);
                    long long v93 = *(_OWORD *)&v92->__r_.__value_.__l.__data_;
                    *(void *)&__dst[0].st_uid = *((void *)&v92->__r_.__value_.__l + 2);
                    *(_OWORD *)&__dst[0].st_dev = v93;
                    v92->__r_.__value_.__l.__size_ = 0;
                    v92->__r_.__value_.__r.__words[2] = 0;
                    v92->__r_.__value_.__r.__words[0] = 0;
                    sub_100014F70((uint64_t)v339, (uint64_t)__dst, 0);
                    if (SHIBYTE(__dst[0].st_gid) < 0)
                    {
                      operator delete(*(void **)&__dst[0].st_dev);
                      if ((SHIBYTE(v355.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                      {
LABEL_139:
                        if ((SHIBYTE(v304) & 0x80000000) == 0)
                        {
LABEL_140:
                          *(_OWORD *)v337 = v303;
                          int64_t v338 = v304;
                          goto LABEL_144;
                        }
LABEL_143:
                        sub_100006EA8(v337, (void *)v303, *((unint64_t *)&v303 + 1));
LABEL_144:
                        std::locale::locale(&v331, (const std::locale *)v339);
                        long long v332 = *(_OWORD *)&v339[8];
                        long long v333 = *(_OWORD *)&v339[24];
                        uint64_t v334 = *(void *)&v339[40];
                        v335 = (std::__shared_weak_count *)v340;
                        if ((void)v340) {
                          atomic_fetch_add_explicit((atomic_ullong *volatile)(v340 + 8), 1uLL, memory_order_relaxed);
                        }
                        uint64_t v336 = *((void *)&v340 + 1);
                        BOOL v94 = sub_100006658((const char *)v337, (uint64_t)&v331, (uint64_t)&v341, 0);
                        char v95 = v335;
                        if (v335 && !atomic_fetch_add(&v335->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                        {
                          ((void (*)(std::__shared_weak_count *))v95->__on_zero_shared)(v95);
                          std::__shared_weak_count::__release_weak(v95);
                          std::locale::~locale(&v331);
                          if ((SHIBYTE(v338) & 0x80000000) == 0)
                          {
LABEL_149:
                            if (v94) {
                              goto LABEL_150;
                            }
                            goto LABEL_158;
                          }
                        }
                        else
                        {
                          std::locale::~locale(&v331);
                          if ((SHIBYTE(v338) & 0x80000000) == 0) {
                            goto LABEL_149;
                          }
                        }
                        operator delete(v337[0]);
                        if (v94)
                        {
LABEL_150:
                          if (SHIBYTE(v304) < 0)
                          {
                            sub_100006EA8(v327, (void *)v303, *((unint64_t *)&v303 + 1));
                          }
                          else
                          {
                            *(_OWORD *)v327 = v303;
                            int64_t v328 = v304;
                          }
                          v325 = 0;
                          v324 = 0;
                          v326 = 0;
                          v98 = (char *)v341;
                          long long v99 = v342;
                          __dst[0].st_ino = 0xAAAAAAAAAAAAAA00;
                          *(void *)&__dst[0].st_dev = &v324;
                          int64_t v100 = v342 - (unsigned char *)v341;
                          if (v342 != v341)
                          {
                            unint64_t v101 = 0xAAAAAAAAAAAAAAABLL * (v100 >> 3);
                            if (v101 >= 0xAAAAAAAAAAAAAABLL) {
                              sub_100007188();
                            }
                            uint64_t v102 = (char *)operator new(v100);
                            uint64_t v103 = 0;
                            v324 = v102;
                            v325 = v102;
                            v326 = &v102[24 * v101];
                            do
                            {
                              uint64_t v105 = &v102[v103];
                              xpc_object_t v106 = &v98[v103];
                              if (v98[v103 + 23] < 0)
                              {
                                sub_100006EA8(v105, *(void **)v106, *((void *)v106 + 1));
                              }
                              else
                              {
                                long long v104 = *(_OWORD *)v106;
                                *((void *)v105 + 2) = *((void *)v106 + 2);
                                *(_OWORD *)uint64_t v105 = v104;
                              }
                              v103 += 24;
                            }
                            while (&v98[v103] != v99);
                            int v107 = (char *)v324;
                            xpc_object_t v108 = &v102[v103];
                            v325 = v108;
                            uint64_t v330 = 0;
                            v329[0] = 0;
                            v329[1] = 0;
                            while (2)
                            {
                              if (v107 == v108) {
                                goto LABEL_252;
                              }
                              memset(&v355, 170, sizeof(v355));
                              if (v107[23] < 0)
                              {
                                sub_100006EA8(&v355, *(void **)v107, *((void *)v107 + 1));
                              }
                              else
                              {
                                long long v109 = *(_OWORD *)v107;
                                v355.__r_.__value_.__r.__words[2] = *((void *)v107 + 2);
                                *(_OWORD *)&v355.__r_.__value_.__l.__data_ = v109;
                              }
                              int v110 = SHIBYTE(v328);
                              if (v328 >= 0) {
                                size_t v111 = HIBYTE(v328);
                              }
                              else {
                                size_t v111 = (size_t)v327[1];
                              }
                              int v112 = SHIBYTE(v355.__r_.__value_.__r.__words[2]);
                              if ((v355.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                                std::string::size_type size = HIBYTE(v355.__r_.__value_.__r.__words[2]);
                              }
                              else {
                                std::string::size_type size = v355.__r_.__value_.__l.__size_;
                              }
                              unint64_t v114 = size + v111;
                              memset(v344, 170, sizeof(v344));
                              if (size + v111 > 0x7FFFFFFFFFFFFFF7) {
                                sub_100006DCC();
                              }
                              if (v114 > 0x16)
                              {
                                uint64_t v122 = (v114 & 0xFFFFFFFFFFFFFFF8) + 8;
                                if ((v114 | 7) != 0x17) {
                                  uint64_t v122 = v114 | 7;
                                }
                                uint64_t v123 = v122 + 1;
                                unsigned int v115 = (char *)operator new(v122 + 1);
                                v344[2] = (void *)(v123 | 0x8000000000000000);
                                v344[0] = v115;
                                v344[1] = (void *)(size + v111);
                                if (v111)
                                {
LABEL_183:
                                  if (v110 >= 0) {
                                    int v116 = v327;
                                  }
                                  else {
                                    int v116 = (void **)v327[0];
                                  }
                                  memmove(v115, v116, v111);
                                }
                              }
                              else
                              {
                                memset(v344, 0, sizeof(v344));
                                unsigned int v115 = (char *)v344;
                                HIBYTE(v344[2]) = size + v111;
                                if (v111) {
                                  goto LABEL_183;
                                }
                              }
                              uint64_t v117 = &v115[v111];
                              if (size)
                              {
                                if (v112 >= 0) {
                                  int v118 = &v355;
                                }
                                else {
                                  int v118 = (std::string *)v355.__r_.__value_.__r.__words[0];
                                }
                                memmove(v117, v118, size);
                              }
                              v117[size] = 0;
                              v119.tv_sec = 0xAAAAAAAAAAAAAAAALL;
                              v119.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
                              *(timespec *)__dst[0].st_qspare = v119;
                              *(timespec *)&__dst[0].st_blkstd::string::size_type size = v119;
                              *(timespec *)&__dst[0].st_std::string::size_type size = v119;
                              __dst[0].st_birthtimespec = v119;
                              __dst[0].st_ctimespec = v119;
                              __dst[0].st_mtimespec = v119;
                              __dst[0].st_atimespec = v119;
                              *(timespec *)&__dst[0].st_uid = v119;
                              *(timespec *)&__dst[0].st_dev = v119;
                              if (SHIBYTE(v344[2]) >= 0) {
                                uint64_t v120 = v344;
                              }
                              else {
                                uint64_t v120 = (void **)v344[0];
                              }
                              if (stat((const char *)v120, __dst)
                                || (SHIBYTE(v344[2]) >= 0 ? (v124 = v344) : (v124 = (void **)v344[0]),
                                    v125 = opendir((const char *)v124),
                                    (char v126 = v125) == 0))
                              {
                                char v121 = HIBYTE(v344[2]);
                              }
                              else
                              {
                                BOOL v127 = readdir(v125);
                                closedir(v126);
                                char v121 = HIBYTE(v344[2]);
                                if (v127)
                                {
                                  if ((HIBYTE(v344[2]) & 0x80) != 0)
                                  {
                                    int v133 = v344[1];
                                    if (v344[1] < (void *)5) {
                                      goto LABEL_566;
                                    }
                                    int v132 = (void **)v344[0];
                                    uint64_t v134 = (char *)v344[1] + (unint64_t)v344[0] - 5;
                                    BOOL v135 = *v134 == 1885626669
                                        && *((unsigned char *)v344[1] + (unint64_t)v344[0] - 1) == 108;
                                    if (v135
                                      || (*v134 == 1935962413
                                        ? (BOOL v136 = *((unsigned char *)v344[1] + (unint64_t)v344[0] - 1) == 115)
                                        : (BOOL v136 = 0),
                                          v136
                                       || (*v134 == 1634296877
                                         ? (BOOL v137 = *((unsigned char *)v344[1] + (unint64_t)v344[0] - 1) == 103)
                                         : (BOOL v137 = 0),
                                           v137)))
                                    {
LABEL_244:
                                      int v142 = SHIBYTE(v355.__r_.__value_.__r.__words[2]);
                                      if ((v355.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                                        std::string::size_type v143 = HIBYTE(v355.__r_.__value_.__r.__words[2]);
                                      }
                                      else {
                                        std::string::size_type v143 = v355.__r_.__value_.__l.__size_;
                                      }
                                      unint64_t v144 = v143 + 9;
                                      memset(__dst, 170, 24);
                                      if (v143 + 9 > 0x7FFFFFFFFFFFFFF7) {
                                        sub_100006DCC();
                                      }
                                      if (v144 >= 0x17)
                                      {
                                        uint64_t v185 = (v144 & 0xFFFFFFFFFFFFFFF8) + 8;
                                        if ((v144 | 7) != 0x17) {
                                          uint64_t v185 = v144 | 7;
                                        }
                                        uint64_t v186 = v185 + 1;
                                        v145 = (stat *)operator new(v185 + 1);
                                        *(void *)&__dst[0].st_uid = v186 | 0x8000000000000000;
                                        *(void *)&__dst[0].st_dev = v145;
                                        __dst[0].st_ino = v143 + 9;
                                      }
                                      else
                                      {
                                        memset(__dst, 0, 24);
                                        v145 = __dst;
                                        HIBYTE(__dst[0].st_gid) = v143 + 9;
                                        if (!v143)
                                        {
LABEL_382:
                                          strcpy((char *)v145 + v143, "/info.txt");
                                          *(_OWORD *)v329 = *(_OWORD *)&__dst[0].st_dev;
                                          uint64_t v330 = *(void *)&__dst[0].st_uid;
                                          if (v121 < 0)
                                          {
                                            operator delete(v344[0]);
                                            LOBYTE(v142) = *((unsigned char *)&v355.__r_.__value_.__s + 23);
                                          }
                                          if ((v142 & 0x80) != 0) {
                                            operator delete(v355.__r_.__value_.__l.__data_);
                                          }
                                          goto LABEL_252;
                                        }
                                      }
                                      if (v142 >= 0) {
                                        v187 = &v355;
                                      }
                                      else {
                                        v187 = (std::string *)v355.__r_.__value_.__r.__words[0];
                                      }
                                      memmove(v145, v187, v143);
                                      goto LABEL_382;
                                    }
                                    if (v344[1] < (void *)9) {
LABEL_566:
                                    }
                                      sub_1000071A0();
                                  }
                                  else
                                  {
                                    if (HIBYTE(v344[2]) <= 4u) {
                                      goto LABEL_566;
                                    }
                                    uint64_t v128 = (_DWORD *)((char *)v344 + HIBYTE(v344[2]) - 5);
                                    if (*v128 == 1885626669 && *((unsigned char *)v344 + HIBYTE(v344[2]) - 1) == 108) {
                                      goto LABEL_244;
                                    }
                                    if (*v128 == 1935962413 && *((unsigned char *)v344 + HIBYTE(v344[2]) - 1) == 115) {
                                      goto LABEL_244;
                                    }
                                    if (*v128 == 1634296877 && *((unsigned char *)v344 + HIBYTE(v344[2]) - 1) == 103) {
                                      goto LABEL_244;
                                    }
                                    if (HIBYTE(v344[2]) < 9u) {
                                      goto LABEL_566;
                                    }
                                    int v132 = v344;
                                    int v133 = (void *)HIBYTE(v344[2]);
                                  }
                                  v138 = (char *)v132 + (void)v133;
                                  uint64_t v139 = *(void *)(v138 - 9);
                                  int v140 = *(v138 - 1);
                                  if (v139 == 0x636172742D62622DLL && v140 == 101) {
                                    goto LABEL_244;
                                  }
                                }
                              }
                              if (v121 < 0)
                              {
                                operator delete(v344[0]);
                                if (SHIBYTE(v355.__r_.__value_.__r.__words[2]) < 0) {
                                  goto LABEL_199;
                                }
                              }
                              else if (SHIBYTE(v355.__r_.__value_.__r.__words[2]) < 0)
                              {
LABEL_199:
                                operator delete(v355.__r_.__value_.__l.__data_);
                              }
                              v107 += 24;
                              continue;
                            }
                          }
                          uint64_t v330 = 0;
                          v329[0] = 0;
                          v329[1] = 0;
LABEL_252:
                          v146 = (void **)v324;
                          if (v324)
                          {
                            v147 = (void **)v325;
                            v148 = v324;
                            if (v325 != v324)
                            {
                              do
                              {
                                if (*((char *)v147 - 1) < 0) {
                                  operator delete(*(v147 - 3));
                                }
                                v147 -= 3;
                              }
                              while (v147 != v146);
                              v148 = v324;
                            }
                            v325 = (char *)v146;
                            operator delete(v148);
                          }
                          if (SHIBYTE(v328) < 0)
                          {
                            operator delete(v327[0]);
                            int v149 = SHIBYTE(v330);
                            if (v330 >= 0) {
                              size_t v150 = HIBYTE(v330);
                            }
                            else {
                              size_t v150 = (size_t)v329[1];
                            }
                            if (v150)
                            {
LABEL_265:
                              memset(__dst, 170, sizeof(__dst));
                              int v151 = SHIBYTE(v304);
                              if (v304 >= 0) {
                                size_t v152 = HIBYTE(v304);
                              }
                              else {
                                size_t v152 = *((void *)&v303 + 1);
                              }
                              unint64_t v153 = v152 + v150;
                              memset(&v355, 170, sizeof(v355));
                              if (v152 + v150 > 0x7FFFFFFFFFFFFFF7) {
                                sub_100006DCC();
                              }
                              if (v153 > 0x16)
                              {
                                uint64_t v172 = (v153 & 0xFFFFFFFFFFFFFFF8) + 8;
                                if ((v153 | 7) != 0x17) {
                                  uint64_t v172 = v153 | 7;
                                }
                                uint64_t v173 = v172 + 1;
                                v154 = (char *)operator new(v172 + 1);
                                v355.__r_.__value_.__l.__size_ = v152 + v150;
                                v355.__r_.__value_.__r.__words[2] = v173 | 0x8000000000000000;
                                v355.__r_.__value_.__r.__words[0] = (std::string::size_type)v154;
                                if (!v152)
                                {
LABEL_275:
                                  v156 = &v154[v152];
                                  if (v149 >= 0) {
                                    v157 = v329;
                                  }
                                  else {
                                    v157 = (void **)v329[0];
                                  }
                                  memmove(v156, v157, v150);
                                  v156[v150] = 0;
                                  sub_100006314((void (__cdecl ***)(std::ifstream *__hidden))__dst);
                                  if (SHIBYTE(v355.__r_.__value_.__r.__words[2]) < 0)
                                  {
                                    operator delete(v355.__r_.__value_.__l.__data_);
                                    if (__dst[0].st_qspare[1]) {
                                      goto LABEL_280;
                                    }
                                  }
                                  else if (__dst[0].st_qspare[1])
                                  {
LABEL_280:
                                    std::istream::seekg();
                                    memset(&v355, 170, sizeof(v355));
                                    sub_100006C64(__dst, &v355);
                                    int64_t v158 = HIBYTE(v355.__r_.__value_.__r.__words[2]);
                                    int v159 = SHIBYTE(v355.__r_.__value_.__r.__words[2]);
                                    v160 = (void *)v355.__r_.__value_.__r.__words[0];
                                    if ((v355.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                                    {
                                      v161 = &v355;
                                    }
                                    else
                                    {
                                      int64_t v158 = v355.__r_.__value_.__l.__size_;
                                      v161 = (std::string *)v355.__r_.__value_.__r.__words[0];
                                    }
                                    v162 = (char *)v161 + v158;
                                    if (v158 >= 35)
                                    {
                                      v163 = v161;
                                      do
                                      {
                                        v164 = (char *)memchr(v163, 98, v158 - 34);
                                        if (!v164) {
                                          break;
                                        }
                                        if (*(void *)v164 == 0x6320676F6C206262
                                          && *((void *)v164 + 1) == 0x6F697463656C6C6FLL
                                          && *((void *)v164 + 2) == 0x20726F66202D206ELL
                                          && *((void *)v164 + 3) == 0x6E67616964737973
                                          && *(void *)(v164 + 27) == 0x65736F6E67616964)
                                        {
                                          goto LABEL_301;
                                        }
                                        v163 = (std::string *)(v164 + 1);
                                        int64_t v158 = v162 - (char *)v163;
                                      }
                                      while (v162 - (char *)v163 > 34);
                                    }
                                    v164 = v162;
LABEL_301:
                                    BOOL v97 = v164 != v162 && v164 - (char *)v161 != -1;
                                    if (v159 < 0) {
                                      operator delete(v160);
                                    }
LABEL_327:
                                    *(void *)&__dst[0].st_dev = v285;
                                    *(void *)((char *)&__dst[0].st_dev + *(void *)(v285 - 24)) = v284;
                                    std::filebuf::~filebuf();
                                    std::istream::~istream();
                                    std::ios::~ios();
                                    if (v330 < 0) {
LABEL_328:
                                    }
                                      operator delete(v329[0]);
LABEL_329:
                                    v175 = (std::__shared_weak_count *)v340;
                                    if ((void)v340
                                      && !atomic_fetch_add((atomic_ullong *volatile)(v340 + 8), 0xFFFFFFFFFFFFFFFFLL))
                                    {
                                      ((void (*)(std::__shared_weak_count *))v175->__on_zero_shared)(v175);
                                      std::__shared_weak_count::__release_weak(v175);
                                    }
                                    std::locale::~locale((std::locale *)v339);
                                    v176 = (void **)v341;
                                    if (v341)
                                    {
                                      v177 = (void **)v342;
                                      v178 = v341;
                                      if (v342 != v341)
                                      {
                                        do
                                        {
                                          if (*((char *)v177 - 1) < 0) {
                                            operator delete(*(v177 - 3));
                                          }
                                          v177 -= 3;
                                        }
                                        while (v177 != v176);
                                        v178 = v341;
                                      }
                                      v342 = (char *)v176;
                                      operator delete(v178);
                                    }
                                    if (SHIBYTE(v302) < 0)
                                    {
                                      operator delete(v301[0]);
                                      if ((SHIBYTE(v304) & 0x80000000) == 0)
                                      {
LABEL_342:
                                        if (v97) {
                                          goto LABEL_343;
                                        }
                                        goto LABEL_354;
                                      }
                                    }
                                    else if ((SHIBYTE(v304) & 0x80000000) == 0)
                                    {
                                      goto LABEL_342;
                                    }
                                    operator delete((void *)v303);
                                    if (v97)
                                    {
LABEL_343:
                                      v179 = GetOsLogContext()[1];
                                      if (os_log_type_enabled(v179, OS_LOG_TYPE_DEFAULT))
                                      {
                                        if (*((char *)a6 + 23) >= 0) {
                                          v180 = (uint64_t *)a6;
                                        }
                                        else {
                                          v180 = (uint64_t *)*a6;
                                        }
                                        __dst[0].st_dev = 136315138;
                                        *(void *)&__dst[0].st_mode = v180;
                                        _os_log_impl((void *)&_mh_execute_header, v179, OS_LOG_TYPE_DEFAULT, "Ignore dump for sysdiagnose: %s", (uint8_t *)__dst, 0xCu);
                                      }
                                      if (v306 != a6)
                                      {
                                        v181 = a6;
                                        char v182 = *((unsigned char *)a6 + 23);
                                        if (SHIBYTE(v307) < 0)
                                        {
                                          if (v182 >= 0) {
                                            v183 = a6;
                                          }
                                          else {
                                            v183 = *a6;
                                          }
                                          if (v182 >= 0) {
                                            size_t v184 = *((unsigned __int8 *)a6 + 23);
                                          }
                                          else {
                                            size_t v184 = (size_t)a6[1];
                                          }
                                          sub_10000738C(v306, v183, v184);
                                        }
                                        else
                                        {
                                          if ((*((unsigned char *)a6 + 23) & 0x80) == 0)
                                          {
                                            *(_OWORD *)v306 = *(_OWORD *)a6;
                                            v307 = a6[2];
LABEL_373:
                                            int v60 = 0;
                                            *(unsigned char *)v181 = 0;
                                            *((unsigned char *)v181 + 23) = 0;
                                            goto LABEL_355;
                                          }
                                          sub_1000072C4(v306, *a6, (size_t)a6[1]);
                                        }
                                      }
                                      v181 = a6;
                                      if (*((char *)a6 + 23) < 0)
                                      {
                                        int v60 = 0;
                                        *(unsigned char *)*a6 = 0;
                                        a6[1] = 0;
                                        goto LABEL_355;
                                      }
                                      goto LABEL_373;
                                    }
                                    goto LABEL_354;
                                  }
                                  v174 = GetOsLogContext()[1];
                                  if (os_log_type_enabled(v174, OS_LOG_TYPE_ERROR))
                                  {
                                    LODWORD(v355.__r_.__value_.__l.__data_) = 136315138;
                                    *(std::string::size_type *)((char *)v355.__r_.__value_.__r.__words + 4) = (std::string::size_type)v157;
                                    _os_log_error_impl((void *)&_mh_execute_header, v174, OS_LOG_TYPE_ERROR, "Failed to open info file: %s", (uint8_t *)&v355, 0xCu);
                                  }
                                  BOOL v97 = 0;
                                  goto LABEL_327;
                                }
                              }
                              else
                              {
                                memset(&v355, 0, sizeof(v355));
                                v154 = (char *)&v355;
                                *((unsigned char *)&v355.__r_.__value_.__s + 23) = v152 + v150;
                                if (!v152) {
                                  goto LABEL_275;
                                }
                              }
                              if (v151 >= 0) {
                                v155 = &v303;
                              }
                              else {
                                v155 = (long long *)v303;
                              }
                              memmove(v154, v155, v152);
                              goto LABEL_275;
                            }
                          }
                          else
                          {
                            int v149 = SHIBYTE(v330);
                            if (v330 >= 0) {
                              size_t v150 = HIBYTE(v330);
                            }
                            else {
                              size_t v150 = (size_t)v329[1];
                            }
                            if (v150) {
                              goto LABEL_265;
                            }
                          }
                          v170 = GetOsLogContext()[1];
                          if (os_log_type_enabled(v170, OS_LOG_TYPE_DEFAULT))
                          {
                            v171 = v301;
                            if (SHIBYTE(v302) < 0) {
                              v171 = (void **)v301[0];
                            }
                            __dst[0].st_dev = 136315138;
                            *(void *)&__dst[0].st_mode = v171;
                            _os_log_impl((void *)&_mh_execute_header, v170, OS_LOG_TYPE_DEFAULT, "No baseband info file found for %s", (uint8_t *)__dst, 0xCu);
                          }
                          BOOL v97 = 0;
                          if ((v149 & 0x80) != 0) {
                            goto LABEL_328;
                          }
                          goto LABEL_329;
                        }
LABEL_158:
                        BOOL v97 = 0;
                        goto LABEL_329;
                      }
                    }
                    else if ((SHIBYTE(v355.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                    {
                      goto LABEL_139;
                    }
                    operator delete(v355.__r_.__value_.__l.__data_);
                    if ((SHIBYTE(v304) & 0x80000000) == 0) {
                      goto LABEL_140;
                    }
                    goto LABEL_143;
                  }
                }
                memcpy(v79, v286, v78);
                *((unsigned char *)v79 + v78) = 0;
                uint64_t v80 = a6;
                if ((*((char *)a6 + 23) & 0x80000000) == 0) {
                  goto LABEL_117;
                }
                goto LABEL_122;
              }
LABEL_354:
              int v60 = 2;
              goto LABEL_355;
            }
          }
          do
          {
            char v76 = *v52++;
            LOBYTE(v51->st_dev) = v76;
            BOOL v51 = (stat *)((char *)v51 + 1);
          }
          while (v52 != v47);
          goto LABEL_111;
        }
      }
      else
      {
        HIBYTE(__dst[0].st_gid) = *(unsigned char *)v46 - v45;
        unint64_t v50 = __dst;
        if ((char *)v45 != v47) {
          goto LABEL_70;
        }
      }
      LOBYTE(v50->st_dev) = 0;
      if ((*((char *)v49 + 23) & 0x80000000) == 0) {
        goto LABEL_112;
      }
      goto LABEL_97;
    }
  }
  else
  {
    if (v33 >= 0) {
      unint64_t v34 = __p;
    }
    int64_t v57 = strlen(__sa);
    if (v57)
    {
      int64_t v58 = v57;
      uint64_t v59 = (char *)__p[1];
      if (v33 >= 0) {
        uint64_t v59 = v32;
      }
      if ((uint64_t)v59 >= v57)
      {
        uint64_t v68 = &v59[(void)v34];
        int v69 = *__sa;
        uint64_t v70 = v34;
        do
        {
          long long v71 = &v59[-v58];
          if (v71 == (char *)-1) {
            break;
          }
          uint64_t v72 = (char *)memchr(v70, v69, (size_t)(v71 + 1));
          if (!v72) {
            break;
          }
          uint64_t v73 = v72;
          if (!memcmp(v72, __sa, v58))
          {
            char v96 = 0;
            if (v73 != v68)
            {
              int v60 = 0;
              if (v73 - (char *)v34 == -1) {
                goto LABEL_356;
              }
              goto LABEL_154;
            }
            int v60 = 0;
            BOOL v292 = 0;
            float64x2x2_t v61 = v345[0];
            if (v345[0]) {
              goto LABEL_357;
            }
            goto LABEL_358;
          }
          uint64_t v70 = (void **)(v73 + 1);
          uint64_t v59 = (char *)(v68 - (v73 + 1));
        }
        while ((uint64_t)v59 >= v58);
      }
      int v60 = 0;
      BOOL v292 = 0;
      float64x2x2_t v61 = v345[0];
      if (v345[0]) {
        goto LABEL_357;
      }
      goto LABEL_358;
    }
LABEL_154:
    sub_10001E880(v306, __sa);
  }
  int v60 = 0;
LABEL_355:
  char v96 = 1;
LABEL_356:
  BOOL v292 = v96;
  float64x2x2_t v61 = v345[0];
  if (v345[0])
  {
LABEL_357:
    v345[1] = v61;
    operator delete(v61);
  }
LABEL_358:
  if ((HIBYTE(__p[2]) & 0x80) == 0) {
    goto LABEL_359;
  }
LABEL_102:
  operator delete(__p[0]);
  if (v60 == 3) {
    goto LABEL_30;
  }
LABEL_360:
  if (!v60) {
    goto LABEL_30;
  }
LABEL_386:
  if ((SHIBYTE(v307) & 0x80000000) == 0) {
    goto LABEL_387;
  }
  operator delete(v306[0]);
  v188 = a6;
  if (v287) {
    goto LABEL_392;
  }
LABEL_432:
  v209 = (std::__shared_weak_count *)v317;
  if ((void)v317 && !atomic_fetch_add((atomic_ullong *volatile)(v317 + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v209->__on_zero_shared)(v209);
    std::__shared_weak_count::__release_weak(v209);
    std::locale::~locale((std::locale *)v316);
    v210 = (std::__shared_weak_count *)v319;
    if (!(void)v319) {
      goto LABEL_436;
    }
LABEL_435:
    if (atomic_fetch_add(&v210->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
      goto LABEL_436;
    }
    ((void (*)(std::__shared_weak_count *))v210->__on_zero_shared)(v210);
    std::__shared_weak_count::__release_weak(v210);
    std::locale::~locale((std::locale *)v318);
    if (SHIBYTE(v320[2]) < 0) {
LABEL_437:
    }
      operator delete(v320[0]);
  }
  else
  {
    std::locale::~locale((std::locale *)v316);
    v210 = (std::__shared_weak_count *)v319;
    if ((void)v319) {
      goto LABEL_435;
    }
LABEL_436:
    std::locale::~locale((std::locale *)v318);
    if (SHIBYTE(v320[2]) < 0) {
      goto LABEL_437;
    }
  }
  v211 = (const void **)v321;
  if (v321)
  {
    v212 = v322;
    v213 = v321;
    if (v322 != v321)
    {
      do
      {
        if (*((char *)v212 - 1) < 0) {
          operator delete((void *)*(v212 - 3));
        }
        v212 -= 3;
      }
      while (v212 != v211);
      v213 = v321;
    }
    v322 = v211;
    operator delete(v213);
  }
}

void sub_10001C60C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,std::locale a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,void *__p,uint64_t a48,int a49,__int16 a50,char a51,char a52,void *a53,uint64_t a54,int a55,__int16 a56,char a57,char a58,void *a59,uint64_t a60,int a61,__int16 a62,char a63)
{
  if (SLOBYTE(STACK[0x3CF]) < 0) {
    operator delete((void *)STACK[0x3B8]);
  }
  if (*(char *)(v72 - 105) < 0) {
    operator delete(*(void **)(v72 - 128));
  }
  sub_1000062A0((void **)&STACK[0x2A8]);
  if (SLOBYTE(STACK[0x2D7]) < 0) {
    operator delete((void *)STACK[0x2C0]);
  }
  sub_1000065BC((std::locale *)&STACK[0x360]);
  sub_1000062A0((void **)&STACK[0x3A0]);
  if (a52 < 0)
  {
    operator delete(__p);
    if ((a58 & 0x80000000) == 0) {
      goto LABEL_13;
    }
  }
  else if ((a58 & 0x80000000) == 0)
  {
    goto LABEL_13;
  }
  operator delete(a53);
LABEL_13:
  uint64_t v74 = (void *)STACK[0x3D0];
  if (STACK[0x3D0])
  {
    STACK[0x3D8] = (unint64_t)v74;
    operator delete(v74);
    if (a64 < 0)
    {
LABEL_15:
      operator delete(a59);
      if ((a71 & 0x80000000) == 0)
      {
LABEL_20:
        sub_1000065BC(&a72);
        sub_1000065BC((std::locale *)&STACK[0x230]);
        if (SLOBYTE(STACK[0x287]) < 0) {
          operator delete((void *)STACK[0x270]);
        }
        sub_1000062A0((void **)&STACK[0x290]);
        if (*(char *)(a29 + 23) < 0) {
          operator delete(*(void **)a29);
        }
        _Unwind_Resume(a1);
      }
LABEL_19:
      operator delete(a66);
      goto LABEL_20;
    }
  }
  else if (a64 < 0)
  {
    goto LABEL_15;
  }
  if ((a71 & 0x80000000) == 0) {
    goto LABEL_20;
  }
  goto LABEL_19;
}

void ***sub_10001C9A0(void ***result)
{
  uint64_t v1 = result;
  if (!*((unsigned char *)result + 8))
  {
    uint64_t v2 = *result;
    BOOL v3 = (void **)**result;
    if (v3)
    {
      unint64_t v4 = (void **)v2[1];
      signed __int8 v5 = **result;
      if (v4 != v3)
      {
        do
        {
          if (*((char *)v4 - 1) < 0) {
            operator delete(*(v4 - 3));
          }
          v4 -= 3;
        }
        while (v4 != v3);
        signed __int8 v5 = **v1;
      }
      v2[1] = v3;
      operator delete(v5);
      return v1;
    }
  }
  return result;
}

__n128 sub_10001CA38(uint64_t a1, const void **a2, uint64_t a3, uint64_t a4, char a5)
{
LABEL_1:
  unint64_t v11 = a1;
LABEL_2:
  uint64_t v12 = 1 - a4;
  while (1)
  {
    a1 = v11;
    uint64_t v13 = v12;
    uint64_t v14 = (uint64_t)a2 - v11;
    unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * (v14 >> 3);
    if (!(!v6 & v5))
    {
      switch(v15)
      {
        case 0uLL:
        case 1uLL:
          return result;
        case 2uLL:
          uint64_t v36 = (__n128 *)(a2 - 3);
          int v37 = *((char *)a2 - 1);
          if (v37 >= 0) {
            uint64_t v38 = a2 - 3;
          }
          else {
            uint64_t v38 = (const void **)*(a2 - 3);
          }
          if (v37 >= 0) {
            size_t v39 = *((unsigned __int8 *)a2 - 1);
          }
          else {
            size_t v39 = (size_t)*(a2 - 2);
          }
          int v40 = *(char *)(a1 + 23);
          uint64_t v41 = *(void **)a1;
          uint64_t v42 = *(const void **)(a1 + 8);
          if (v40 >= 0) {
            long long v43 = (const void *)a1;
          }
          else {
            long long v43 = *(const void **)a1;
          }
          if (v40 >= 0) {
            size_t v44 = *(unsigned __int8 *)(a1 + 23);
          }
          else {
            size_t v44 = *(void *)(a1 + 8);
          }
          if (v44 >= v39) {
            size_t v45 = v39;
          }
          else {
            size_t v45 = v44;
          }
          int v46 = memcmp(v38, v43, v45);
          if (v46)
          {
            if (v46 < 0) {
              return result;
            }
          }
          else if (v39 <= v44)
          {
            return result;
          }
          char v52 = *(const void **)(a1 + 16);
          uint64_t v53 = (uint64_t)*(a2 - 1);
          __n128 result = *v36;
          *(__n128 *)a1 = *v36;
          *(void *)(a1 + 16) = v53;
          *(a2 - 3) = v41;
          *(a2 - 2) = v42;
          *(a2 - 1) = v52;
          break;
        case 3uLL:
          sub_10001D22C(a1, a1 + 24, a2 - 3);
          return result;
        case 4uLL:
          result.n128_u64[0] = sub_10001DD38(a1, a1 + 24, a1 + 48, a2 - 3).n128_u64[0];
          return result;
        case 5uLL:
          result.n128_u64[0] = sub_10001DEDC(a1, a1 + 24, a1 + 48, a1 + 72, a2 - 3).n128_u64[0];
          return result;
        default:
          JUMPOUT(0);
      }
      return result;
    }
    if (v14 <= 575) {
      break;
    }
    if (v12 == 1)
    {
      if ((const void **)a1 != a2)
      {
        unint64_t v47 = (v15 - 2) >> 1;
        unint64_t v48 = v47 + 1;
        unint64_t v49 = (__n128 *)(a1 + 24 * v47);
        do
        {
          sub_10001E0E4(a1, a3, 0xAAAAAAAAAAAAAAABLL * (v14 >> 3), v49);
          unint64_t v49 = (__n128 *)((char *)v49 - 24);
          --v48;
        }
        while (v48);
        unint64_t v50 = v14 / 0x18uLL;
        do
        {
          sub_10001E3BC((void **)a1, (uint64_t)a2, a3, v50);
          a2 -= 3;
        }
        while (v50-- > 2);
      }
      return result;
    }
    unint64_t v16 = v15 >> 1;
    uint64_t v17 = a1 + 24 * (v15 >> 1);
    if ((unint64_t)v14 < 0xC01)
    {
      sub_10001D22C(v17, a1, a2 - 3);
      if (a5) {
        goto LABEL_30;
      }
    }
    else
    {
      sub_10001D22C(a1, v17, a2 - 3);
      uint64_t v18 = 24 * v16;
      uint64_t v19 = 24 * v16 + a1 - 24;
      sub_10001D22C(a1 + 24, v19, a2 - 6);
      uint64_t v20 = (const void **)(a1 + 24 + v18);
      sub_10001D22C(a1 + 48, (uint64_t)v20, a2 - 9);
      sub_10001D22C(v19, v17, v20);
      unint64_t v21 = *(void **)a1;
      long long v22 = *(_OWORD *)(a1 + 8);
      long long v23 = *(_OWORD *)v17;
      *(void *)(a1 + 16) = *(void *)(v17 + 16);
      *(_OWORD *)a1 = v23;
      *(void *)uint64_t v17 = v21;
      *(_OWORD *)(v17 + 8) = v22;
      if (a5) {
        goto LABEL_30;
      }
    }
    int v24 = *(char *)(a1 - 1);
    if (v24 >= 0) {
      uint64_t v25 = (const void *)(a1 - 24);
    }
    else {
      uint64_t v25 = *(const void **)(a1 - 24);
    }
    if (v24 >= 0) {
      size_t v26 = *(unsigned __int8 *)(a1 - 1);
    }
    else {
      size_t v26 = *(void *)(a1 - 16);
    }
    int v27 = *(char *)(a1 + 23);
    if (v27 >= 0) {
      uint64_t v28 = (const void *)a1;
    }
    else {
      uint64_t v28 = *(const void **)a1;
    }
    if (v27 >= 0) {
      size_t v29 = *(unsigned __int8 *)(a1 + 23);
    }
    else {
      size_t v29 = *(void *)(a1 + 8);
    }
    if (v29 >= v26) {
      size_t v30 = v26;
    }
    else {
      size_t v30 = v29;
    }
    int v31 = memcmp(v25, v28, v30);
    if (v31)
    {
      if (v31 < 0) {
        goto LABEL_34;
      }
    }
    else if (v26 <= v29)
    {
LABEL_34:
      unint64_t v11 = sub_10001D46C((long long *)a1, a2);
      goto LABEL_35;
    }
LABEL_30:
    int v32 = (const void **)sub_10001D750((long long *)a1, a2);
    if ((v33 & 1) == 0) {
      goto LABEL_33;
    }
    BOOL v34 = sub_10001DA20(a1, v32);
    unint64_t v11 = (unint64_t)(v32 + 3);
    if (sub_10001DA20((uint64_t)(v32 + 3), a2))
    {
      a4 = -v13;
      a2 = v32;
      if (v34) {
        return result;
      }
      goto LABEL_1;
    }
    uint64_t v12 = v13 + 1;
    if (!v34)
    {
LABEL_33:
      sub_10001CA38(a1, v32, a3, -v13, a5 & 1);
      unint64_t v11 = (unint64_t)(v32 + 3);
LABEL_35:
      a5 = 0;
      a4 = -v13;
      goto LABEL_2;
    }
  }
  if (a5)
  {
    sub_10001CEF8((const void **)a1, a2);
  }
  else
  {
    sub_10001D0BC((const void **)a1, a2);
  }
  return result;
}

const void **sub_10001CEF8(const void **result, const void **a2)
{
  if (result != a2)
  {
    uint64_t v30 = v2;
    uint64_t v31 = v3;
    unint64_t v4 = a2;
    char v5 = result;
    char v6 = result + 3;
    if (result + 3 != a2)
    {
      uint64_t v7 = 0;
      int v8 = result;
      do
      {
        unint64_t v11 = v8;
        int v8 = v6;
        int v12 = *((char *)v11 + 47);
        if (v12 >= 0) {
          uint64_t v13 = v6;
        }
        else {
          uint64_t v13 = (const void **)v11[3];
        }
        if (v12 >= 0) {
          size_t v14 = *((unsigned __int8 *)v11 + 47);
        }
        else {
          size_t v14 = (size_t)v11[4];
        }
        int v15 = *((char *)v11 + 23);
        if (v15 >= 0) {
          unint64_t v16 = v11;
        }
        else {
          unint64_t v16 = *v11;
        }
        if (v15 >= 0) {
          size_t v17 = *((unsigned __int8 *)v11 + 23);
        }
        else {
          size_t v17 = (size_t)v11[1];
        }
        if (v17 >= v14) {
          size_t v18 = v14;
        }
        else {
          size_t v18 = v17;
        }
        __n128 result = (const void **)memcmp(v13, v16, v18);
        if (result)
        {
          if ((result & 0x80000000) != 0) {
            goto LABEL_7;
          }
        }
        else if (v14 <= v17)
        {
          goto LABEL_7;
        }
        int64_t v29 = (int64_t)v8[2];
        long long v28 = *(_OWORD *)v8;
        if (v29 >= 0) {
          uint64_t v19 = &v28;
        }
        else {
          uint64_t v19 = (long long *)v28;
        }
        if (v29 >= 0) {
          uint64_t v20 = (const void *)HIBYTE(v29);
        }
        else {
          uint64_t v20 = (const void *)*((void *)&v28 + 1);
        }
        *(_OWORD *)int v8 = *(_OWORD *)v11;
        v8[2] = v11[2];
        *((unsigned char *)v11 + 23) = 0;
        *(unsigned char *)unint64_t v11 = 0;
        int v9 = v5;
        if (v11 == v5) {
          goto LABEL_6;
        }
        uint64_t v21 = v7;
        while (1)
        {
          uint64_t v22 = (uint64_t)v5 + v21;
          int v23 = *((char *)v5 + v21 - 1);
          int v24 = v23 >= 0 ? (char *)v5 + v21 - 24 : *(char **)((char *)v5 + v21 - 24);
          uint64_t v25 = v23 >= 0 ? (const void *)*((unsigned __int8 *)v5 + v21 - 1) : *(const void **)((char *)v5 + v21 - 16);
          size_t v26 = (size_t)(v25 >= v20 ? v20 : v25);
          __n128 result = (const void **)memcmp(v19, v24, v26);
          if (!result) {
            break;
          }
          if ((result & 0x80000000) != 0)
          {
            int v9 = v11;
            goto LABEL_5;
          }
LABEL_36:
          v11 -= 3;
          *(_OWORD *)uint64_t v22 = *(_OWORD *)((char *)v5 + v21 - 24);
          *(void *)(v22 + 16) = *(const void **)((char *)v5 + v21 - 8);
          *(unsigned char *)(v22 - 1) = 0;
          *(unsigned char *)(v22 - 24) = 0;
          v21 -= 24;
          if (!v21)
          {
            int v9 = v5;
            goto LABEL_5;
          }
        }
        if (v20 > v25) {
          goto LABEL_36;
        }
        int v9 = (const void **)((char *)v5 + v21);
LABEL_5:
        unint64_t v4 = a2;
LABEL_6:
        long long v10 = v28;
        v9[2] = (const void *)v29;
        *(_OWORD *)int v9 = v10;
LABEL_7:
        char v6 = v8 + 3;
        v7 += 24;
      }
      while (v8 + 3 != v4);
    }
  }
  return result;
}

const void **sub_10001D0BC(const void **result, const void **a2)
{
  if (result != a2)
  {
    uint64_t v26 = v2;
    uint64_t v27 = v3;
    char v5 = result;
    for (uint64_t i = result + 3; v5 + 3 != a2; uint64_t i = v5 + 3)
    {
      uint64_t v7 = v5;
      char v5 = i;
      int v8 = *((char *)v7 + 47);
      if (v8 >= 0) {
        int v9 = i;
      }
      else {
        int v9 = (const void **)v7[3];
      }
      if (v8 >= 0) {
        size_t v10 = *((unsigned __int8 *)v7 + 47);
      }
      else {
        size_t v10 = (size_t)v7[4];
      }
      int v11 = *((char *)v7 + 23);
      if (v11 >= 0) {
        int v12 = v7;
      }
      else {
        int v12 = *v7;
      }
      if (v11 >= 0) {
        size_t v13 = *((unsigned __int8 *)v7 + 23);
      }
      else {
        size_t v13 = (size_t)v7[1];
      }
      if (v13 >= v10) {
        size_t v14 = v10;
      }
      else {
        size_t v14 = v13;
      }
      __n128 result = (const void **)memcmp(v9, v12, v14);
      if (result)
      {
        if ((result & 0x80000000) == 0) {
          goto LABEL_25;
        }
      }
      else if (v10 > v13)
      {
LABEL_25:
        uint64_t v25 = v5[2];
        unint64_t v15 = (unint64_t)v25;
        long long v24 = *(_OWORD *)v5;
        v5[1] = 0;
        v5[2] = 0;
        *char v5 = 0;
        size_t v16 = HIBYTE(v15);
        if ((v16 & 0x80u) == 0) {
          size_t v17 = &v24;
        }
        else {
          size_t v17 = (long long *)v24;
        }
        if ((v16 & 0x80u) == 0) {
          size_t v18 = v16;
        }
        else {
          size_t v18 = *((void *)&v24 + 1);
        }
        for (unint64_t j = v5; ; j -= 3)
        {
          *(_OWORD *)unint64_t j = *(_OWORD *)(j - 3);
          j[2] = *(j - 1);
          *((unsigned char *)j - 1) = 0;
          *((unsigned char *)j - 24) = 0;
          int v20 = *((char *)j - 25);
          if (v20 >= 0) {
            uint64_t v21 = j - 6;
          }
          else {
            uint64_t v21 = (const void **)*(j - 6);
          }
          if (v20 >= 0) {
            size_t v22 = *((unsigned __int8 *)j - 25);
          }
          else {
            size_t v22 = (size_t)*(j - 5);
          }
          if (v22 >= v18) {
            size_t v23 = v18;
          }
          else {
            size_t v23 = v22;
          }
          __n128 result = (const void **)memcmp(v17, v21, v23);
          if (result)
          {
            if ((result & 0x80000000) != 0)
            {
LABEL_4:
              *(_OWORD *)(j - 3) = v24;
              *(j - 1) = v25;
              break;
            }
          }
          else if (v18 <= v22)
          {
            goto LABEL_4;
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_10001D22C(uint64_t a1, uint64_t a2, const void **a3)
{
  int v6 = *(char *)(a2 + 23);
  uint64_t v7 = *(const void **)a2;
  int v8 = *(const void **)(a2 + 8);
  if (v6 >= 0) {
    int v9 = (const void *)a2;
  }
  else {
    int v9 = *(const void **)a2;
  }
  if (v6 >= 0) {
    size_t v10 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    size_t v10 = *(void *)(a2 + 8);
  }
  int v11 = *(char *)(a1 + 23);
  size_t v13 = *(const void **)a1;
  int v12 = *(const void **)(a1 + 8);
  if (v11 >= 0) {
    size_t v14 = (const void *)a1;
  }
  else {
    size_t v14 = *(const void **)a1;
  }
  if (v11 >= 0) {
    size_t v15 = *(unsigned __int8 *)(a1 + 23);
  }
  else {
    size_t v15 = *(void *)(a1 + 8);
  }
  if (v15 >= v10) {
    size_t v16 = v10;
  }
  else {
    size_t v16 = v15;
  }
  int v17 = memcmp(v9, v14, v16);
  if (v17)
  {
    if ((v17 & 0x80000000) == 0)
    {
LABEL_18:
      int v18 = *((char *)a3 + 23);
      if (v18 >= 0) {
        uint64_t v19 = a3;
      }
      else {
        uint64_t v19 = *a3;
      }
      if (v18 >= 0) {
        size_t v20 = *((unsigned __int8 *)a3 + 23);
      }
      else {
        size_t v20 = (size_t)a3[1];
      }
      if (v10 >= v20) {
        size_t v21 = v20;
      }
      else {
        size_t v21 = v10;
      }
      int v22 = memcmp(v19, v9, v21);
      if (v22)
      {
        if ((v22 & 0x80000000) == 0)
        {
LABEL_29:
          size_t v23 = *(const void **)(a1 + 16);
          long long v24 = a3[2];
          *(_OWORD *)a1 = *(_OWORD *)a3;
          *(void *)(a1 + 16) = v24;
          *a3 = v13;
          a3[1] = v12;
          a3[2] = v23;
          return 1;
        }
      }
      else if (v20 > v10)
      {
        goto LABEL_29;
      }
      uint64_t v43 = *(void *)(a1 + 16);
      uint64_t v44 = *(void *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(void *)(a1 + 16) = v44;
      *(void *)a2 = v13;
      *(void *)(a2 + 8) = v12;
      *(void *)(a2 + 16) = v43;
      int v45 = *((char *)a3 + 23);
      if (v45 >= 0) {
        int v46 = a3;
      }
      else {
        int v46 = *a3;
      }
      if (v45 >= 0) {
        size_t v47 = *((unsigned __int8 *)a3 + 23);
      }
      else {
        size_t v47 = (size_t)a3[1];
      }
      if (v43 >= 0) {
        unint64_t v48 = (const void *)a2;
      }
      else {
        unint64_t v48 = v13;
      }
      if (v43 >= 0) {
        size_t v49 = HIBYTE(v43);
      }
      else {
        size_t v49 = (size_t)v12;
      }
      if (v49 >= v47) {
        size_t v50 = v47;
      }
      else {
        size_t v50 = v49;
      }
      int v51 = memcmp(v46, v48, v50);
      if (v51)
      {
        if (v51 < 0) {
          return 1;
        }
      }
      else if (v47 <= v49)
      {
        return 1;
      }
      long long v54 = *(_OWORD *)a3;
      *(void *)(a2 + 16) = a3[2];
      *(_OWORD *)a2 = v54;
      *a3 = v13;
      a3[1] = v12;
      a3[2] = (const void *)v43;
      return 2;
    }
  }
  else if (v10 > v15)
  {
    goto LABEL_18;
  }
  int v26 = *((char *)a3 + 23);
  if (v26 >= 0) {
    uint64_t v27 = a3;
  }
  else {
    uint64_t v27 = *a3;
  }
  if (v26 >= 0) {
    size_t v28 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    size_t v28 = (size_t)a3[1];
  }
  if (v10 >= v28) {
    size_t v29 = v28;
  }
  else {
    size_t v29 = v10;
  }
  int v30 = memcmp(v27, v9, v29);
  if (!v30)
  {
    if (v28 > v10) {
      goto LABEL_43;
    }
    return 0;
  }
  if (v30 < 0) {
    return 0;
  }
LABEL_43:
  uint64_t v31 = *(const void **)(a2 + 16);
  int v32 = a3[2];
  *(_OWORD *)a2 = *(_OWORD *)a3;
  *(void *)(a2 + 16) = v32;
  *a3 = v7;
  a3[1] = v8;
  a3[2] = v31;
  int v33 = *(char *)(a2 + 23);
  if (v33 >= 0) {
    BOOL v34 = (const void *)a2;
  }
  else {
    BOOL v34 = *(const void **)a2;
  }
  if (v33 >= 0) {
    size_t v35 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    size_t v35 = *(void *)(a2 + 8);
  }
  int v36 = *(char *)(a1 + 23);
  int v37 = *(const void **)a1;
  uint64_t v38 = *(void *)(a1 + 8);
  if (v36 >= 0) {
    size_t v39 = (const void *)a1;
  }
  else {
    size_t v39 = *(const void **)a1;
  }
  if (v36 >= 0) {
    size_t v40 = *(unsigned __int8 *)(a1 + 23);
  }
  else {
    size_t v40 = *(void *)(a1 + 8);
  }
  if (v40 >= v35) {
    size_t v41 = v35;
  }
  else {
    size_t v41 = v40;
  }
  int v42 = memcmp(v34, v39, v41);
  if (v42)
  {
    if (v42 < 0) {
      return 1;
    }
  }
  else if (v35 <= v40)
  {
    return 1;
  }
  uint64_t v52 = *(void *)(a1 + 16);
  uint64_t v53 = *(void *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v53;
  *(void *)a2 = v37;
  *(void *)(a2 + 8) = v38;
  *(void *)(a2 + 16) = v52;
  return 2;
}

unint64_t sub_10001D46C(long long *a1, _OWORD *a2)
{
  unint64_t j = a2;
  uint64_t v54 = *((void *)a1 + 2);
  unint64_t v4 = v54;
  long long v53 = *a1;
  *((void *)a1 + 1) = 0;
  *((void *)a1 + 2) = 0;
  *(void *)a1 = 0;
  size_t v5 = HIBYTE(v4);
  if ((v5 & 0x80u) == 0) {
    int v6 = &v53;
  }
  else {
    int v6 = (long long *)v53;
  }
  if ((v5 & 0x80u) == 0) {
    size_t v7 = v5;
  }
  else {
    size_t v7 = *((void *)&v53 + 1);
  }
  int v8 = (const void *)*((void *)a2 - 3);
  size_t v9 = *((unsigned __int8 *)a2 - 1);
  size_t v10 = *((void *)a2 - 2);
  if ((v9 & 0x80u) == 0) {
    int v11 = (char *)a2 - 24;
  }
  else {
    int v11 = (char *)*((void *)a2 - 3);
  }
  if ((v9 & 0x80u) == 0) {
    size_t v12 = v9;
  }
  else {
    size_t v12 = v10;
  }
  if (v12 >= v7) {
    size_t v13 = v7;
  }
  else {
    size_t v13 = v12;
  }
  int v14 = memcmp(v6, v11, v13);
  if (v14)
  {
    if ((v14 & 0x80000000) == 0) {
      goto LABEL_18;
    }
  }
  else if (v7 > v12)
  {
LABEL_18:
    unint64_t v15 = (unint64_t)a1 + 24;
    do
    {
      while (1)
      {
        unint64_t i = v15;
        uint64_t v17 = *(unsigned __int8 *)(v15 + 23);
        int v18 = (v17 & 0x80u) == 0 ? (const void *)i : *(const void **)i;
        size_t v19 = (v17 & 0x80u) == 0 ? v17 : *(void *)(i + 8);
        size_t v20 = v19 >= v7 ? v7 : v19;
        int v21 = memcmp(v6, v18, v20);
        unint64_t v15 = i + 24;
        if (v21) {
          break;
        }
        if (v7 > v19) {
          goto LABEL_31;
        }
      }
    }
    while (v21 < 0);
    goto LABEL_31;
  }
  for (unint64_t i = (unint64_t)a1 + 24; i < (unint64_t)j; i += 24)
  {
    int v46 = *(char *)(i + 23);
    if (v46 >= 0) {
      size_t v47 = (const void *)i;
    }
    else {
      size_t v47 = *(const void **)i;
    }
    if (v46 >= 0) {
      size_t v48 = *(unsigned __int8 *)(i + 23);
    }
    else {
      size_t v48 = *(void *)(i + 8);
    }
    if (v48 >= v7) {
      size_t v49 = v7;
    }
    else {
      size_t v49 = v48;
    }
    int v50 = memcmp(v6, v47, v49);
    if (v50)
    {
      if ((v50 & 0x80000000) == 0) {
        break;
      }
    }
    else if (v7 > v48)
    {
      break;
    }
  }
LABEL_31:
  if (i < (unint64_t)j)
  {
    for (j = (_OWORD *)((char *)j - 24); ; size_t v10 = *((void *)j + 1))
    {
      if ((v9 & 0x80u) == 0) {
        size_t v23 = j;
      }
      else {
        size_t v23 = v8;
      }
      if ((v9 & 0x80u) == 0) {
        size_t v24 = v9;
      }
      else {
        size_t v24 = v10;
      }
      if (v24 >= v7) {
        size_t v25 = v7;
      }
      else {
        size_t v25 = v24;
      }
      int v26 = memcmp(v6, v23, v25);
      if (v26)
      {
        if (v26 < 0) {
          break;
        }
      }
      else if (v7 <= v24)
      {
        break;
      }
      int v22 = (const void *)*((void *)j - 3);
      unint64_t j = (_OWORD *)((char *)j - 24);
      int v8 = v22;
      size_t v9 = *((unsigned __int8 *)j + 23);
    }
  }
  if (i < (unint64_t)j)
  {
    uint64_t v27 = *(const void **)i;
    do
    {
      long long v28 = *(_OWORD *)(i + 8);
      long long v29 = *j;
      *(void *)(i + 16) = *((void *)j + 2);
      *(_OWORD *)unint64_t i = v29;
      *(void *)unint64_t j = v27;
      *(_OWORD *)((char *)j + 8) = v28;
      if (v54 >= 0) {
        int v30 = &v53;
      }
      else {
        int v30 = (long long *)v53;
      }
      if (v54 >= 0) {
        unint64_t v31 = HIBYTE(v54);
      }
      else {
        unint64_t v31 = *((void *)&v53 + 1);
      }
      unint64_t v32 = i + 24;
      do
      {
        while (1)
        {
          unint64_t i = v32;
          uint64_t v33 = *(unsigned __int8 *)(v32 + 23);
          uint64_t v27 = *(const void **)i;
          BOOL v34 = (v33 & 0x80u) == 0 ? (const void *)i : *(const void **)i;
          unint64_t v35 = (v33 & 0x80u) == 0 ? v33 : *(void *)(i + 8);
          size_t v36 = v35 >= v31 ? v31 : v35;
          int v37 = memcmp(v30, v34, v36);
          unint64_t v32 = i + 24;
          if (v37) {
            break;
          }
          if (v31 > v35) {
            goto LABEL_68;
          }
        }
      }
      while (v37 < 0);
LABEL_68:
      uint64_t v38 = (char *)j - 24;
      do
      {
        while (1)
        {
          unint64_t j = v38;
          uint64_t v39 = v38[23];
          size_t v40 = (v39 & 0x80u) == 0 ? j : *(_OWORD **)j;
          unint64_t v41 = (v39 & 0x80u) == 0 ? v39 : *((void *)j + 1);
          size_t v42 = v41 >= v31 ? v31 : v41;
          int v43 = memcmp(v30, v40, v42);
          uint64_t v38 = (char *)j - 24;
          if (v43) {
            break;
          }
          if (v31 <= v41) {
            goto LABEL_48;
          }
        }
      }
      while ((v43 & 0x80000000) == 0);
LABEL_48:
      ;
    }
    while (i < (unint64_t)j);
  }
  uint64_t v44 = (long long *)(i - 24);
  if ((long long *)(i - 24) == a1)
  {
    if (*(char *)(i - 1) < 0) {
      operator delete(*(void **)a1);
    }
  }
  else
  {
    if (*((char *)a1 + 23) < 0) {
      operator delete(*(void **)a1);
    }
    long long v45 = *v44;
    *((void *)a1 + 2) = *(void *)(i - 8);
    *a1 = v45;
    *(unsigned char *)(i - 1) = 0;
    *(unsigned char *)(i - 24) = 0;
  }
  long long v51 = v53;
  *(void *)(i - 8) = v54;
  *uint64_t v44 = v51;
  return i;
}

unint64_t sub_10001D750(long long *a1, void *a2)
{
  uint64_t v4 = 0;
  int64_t v52 = *((void *)a1 + 2);
  long long v51 = *a1;
  unint64_t v5 = HIBYTE(v52);
  unint64_t v6 = *((void *)&v51 + 1);
  BOOL v7 = v52 < 0;
  if (v52 >= 0) {
    int v8 = &v51;
  }
  else {
    int v8 = (long long *)v51;
  }
  *((void *)a1 + 1) = 0;
  *((void *)a1 + 2) = 0;
  *(void *)a1 = 0;
  if (v7) {
    unint64_t v9 = v6;
  }
  else {
    unint64_t v9 = v5;
  }
  while (1)
  {
    uint64_t v10 = *(void *)((char *)a1 + v4 + 24);
    int v11 = *((char *)a1 + v4 + 47);
    size_t v12 = v11 >= 0 ? (char *)a1 + v4 + 24 : *(char **)((char *)a1 + v4 + 24);
    unint64_t v13 = v11 >= 0 ? *((unsigned __int8 *)a1 + v4 + 47) : *(void *)((char *)a1 + v4 + 32);
    size_t v14 = v9 >= v13 ? v13 : v9;
    int v15 = memcmp(v12, v8, v14);
    if (v15) {
      break;
    }
    if (v13 <= v9) {
      goto LABEL_20;
    }
LABEL_8:
    v4 += 24;
  }
  if ((v15 & 0x80000000) == 0) {
    goto LABEL_8;
  }
LABEL_20:
  unint64_t v16 = (unint64_t)a1 + v4 + 24;
  if (v4)
  {
    uint64_t v17 = a2 - 3;
    do
    {
      while (1)
      {
        a2 = v17;
        uint64_t v18 = *((unsigned __int8 *)v17 + 23);
        size_t v19 = (v18 & 0x80u) == 0 ? a2 : (void *)*a2;
        unint64_t v20 = (v18 & 0x80u) == 0 ? v18 : a2[1];
        size_t v21 = v9 >= v20 ? v20 : v9;
        int v22 = memcmp(v19, v8, v21);
        uint64_t v17 = a2 - 3;
        if (v22) {
          break;
        }
        if (v20 > v9) {
          goto LABEL_52;
        }
      }
    }
    while (v22 < 0);
  }
  else if (v16 < (unint64_t)a2)
  {
    size_t v23 = a2 - 3;
    do
    {
      while (1)
      {
        a2 = v23;
        uint64_t v24 = *((unsigned __int8 *)v23 + 23);
        size_t v25 = (v24 & 0x80u) == 0 ? a2 : (void *)*a2;
        unint64_t v26 = (v24 & 0x80u) == 0 ? v24 : a2[1];
        size_t v27 = v9 >= v26 ? v26 : v9;
        int v28 = memcmp(v25, v8, v27);
        size_t v23 = a2 - 3;
        if (!v28) {
          break;
        }
        if (v16 >= (unint64_t)a2 || (v28 & 0x80000000) == 0) {
          goto LABEL_52;
        }
      }
    }
    while (v16 < (unint64_t)a2 && v26 <= v9);
  }
LABEL_52:
  if (v16 >= (unint64_t)a2)
  {
    unint64_t v30 = v16;
  }
  else
  {
    long long v29 = a2;
    unint64_t v30 = v16;
    do
    {
      long long v31 = *(_OWORD *)(v30 + 8);
      long long v32 = *(_OWORD *)v29;
      *(void *)(v30 + 16) = v29[2];
      *(_OWORD *)unint64_t v30 = v32;
      *long long v29 = v10;
      *(_OWORD *)(v29 + 1) = v31;
      if (v52 >= 0) {
        uint64_t v33 = &v51;
      }
      else {
        uint64_t v33 = (long long *)v51;
      }
      if (v52 >= 0) {
        unint64_t v34 = HIBYTE(v52);
      }
      else {
        unint64_t v34 = *((void *)&v51 + 1);
      }
      unint64_t v35 = v30 + 24;
      do
      {
        while (1)
        {
          unint64_t v30 = v35;
          uint64_t v36 = *(unsigned __int8 *)(v35 + 23);
          uint64_t v10 = *(void *)v30;
          int v37 = (v36 & 0x80u) == 0 ? (const void *)v30 : *(const void **)v30;
          unint64_t v38 = (v36 & 0x80u) == 0 ? v36 : *(void *)(v30 + 8);
          size_t v39 = v34 >= v38 ? v38 : v34;
          int v40 = memcmp(v37, v33, v39);
          unint64_t v35 = v30 + 24;
          if (v40) {
            break;
          }
          if (v38 <= v34) {
            goto LABEL_74;
          }
        }
      }
      while ((v40 & 0x80000000) == 0);
LABEL_74:
      unint64_t v41 = v29 - 3;
      do
      {
        while (1)
        {
          long long v29 = v41;
          uint64_t v42 = *((unsigned __int8 *)v41 + 23);
          int v43 = (v42 & 0x80u) == 0 ? v29 : (void *)*v29;
          unint64_t v44 = (v42 & 0x80u) == 0 ? v42 : v29[1];
          size_t v45 = v34 >= v44 ? v44 : v34;
          int v46 = memcmp(v43, v33, v45);
          unint64_t v41 = v29 - 3;
          if (v46) {
            break;
          }
          if (v44 > v34) {
            goto LABEL_54;
          }
        }
      }
      while (v46 < 0);
LABEL_54:
      ;
    }
    while (v30 < (unint64_t)v29);
  }
  size_t v47 = (long long *)(v30 - 24);
  if ((long long *)(v30 - 24) == a1)
  {
    if (*(char *)(v30 - 1) < 0) {
      operator delete(*(void **)a1);
    }
  }
  else
  {
    if (*((char *)a1 + 23) < 0) {
      operator delete(*(void **)a1);
    }
    long long v48 = *v47;
    *((void *)a1 + 2) = *(void *)(v30 - 8);
    *a1 = v48;
    *(unsigned char *)(v30 - 1) = 0;
    *(unsigned char *)(v30 - 24) = 0;
  }
  long long v49 = v51;
  *(void *)(v30 - 8) = v52;
  *size_t v47 = v49;
  return v30 - 24;
}

BOOL sub_10001DA20(uint64_t a1, const void **a2)
{
  uint64_t v2 = a2;
  uint64_t v4 = ((uint64_t)a2 - a1) >> 3;
  BOOL result = 1;
  switch(0xAAAAAAAAAAAAAAABLL * v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      unint64_t v6 = a2 - 3;
      int v7 = *((char *)a2 - 1);
      if (v7 >= 0) {
        int v8 = a2 - 3;
      }
      else {
        int v8 = (const void **)*(a2 - 3);
      }
      if (v7 >= 0) {
        size_t v9 = *((unsigned __int8 *)a2 - 1);
      }
      else {
        size_t v9 = (size_t)*(a2 - 2);
      }
      int v10 = *(char *)(a1 + 23);
      int v11 = *(const void **)a1;
      size_t v12 = *(const void **)(a1 + 8);
      if (v10 >= 0) {
        unint64_t v13 = (const void *)a1;
      }
      else {
        unint64_t v13 = *(const void **)a1;
      }
      if (v10 >= 0) {
        size_t v14 = *(unsigned __int8 *)(a1 + 23);
      }
      else {
        size_t v14 = *(void *)(a1 + 8);
      }
      if (v14 >= v9) {
        size_t v15 = v9;
      }
      else {
        size_t v15 = v14;
      }
      int v16 = memcmp(v8, v13, v15);
      if (v16)
      {
        if (v16 < 0) {
          return 1;
        }
      }
      else if (v9 <= v14)
      {
        return 1;
      }
      unint64_t v41 = *(const void **)(a1 + 16);
      uint64_t v42 = (uint64_t)*(v2 - 1);
      *(_OWORD *)a1 = *(_OWORD *)v6;
      *(void *)(a1 + 16) = v42;
      *(v2 - 3) = v11;
      *(v2 - 2) = v12;
      *(v2 - 1) = v41;
      return 1;
    case 3uLL:
      sub_10001D22C(a1, a1 + 24, a2 - 3);
      return 1;
    case 4uLL:
      sub_10001DD38(a1, a1 + 24, a1 + 48, a2 - 3);
      return 1;
    case 5uLL:
      sub_10001DEDC(a1, a1 + 24, a1 + 48, a1 + 72, a2 - 3);
      return 1;
    default:
      uint64_t v17 = (const void **)(a1 + 48);
      sub_10001D22C(a1, a1 + 24, (const void **)(a1 + 48));
      uint64_t v18 = (const void **)(a1 + 72);
      if ((const void **)(a1 + 72) == v2) {
        return 1;
      }
      uint64_t v19 = 0;
      int v20 = 0;
      int v43 = v2;
      break;
  }
  while (2)
  {
    int v23 = *((char *)v18 + 23);
    if (v23 >= 0) {
      uint64_t v24 = v18;
    }
    else {
      uint64_t v24 = *v18;
    }
    if (v23 >= 0) {
      size_t v25 = *((unsigned __int8 *)v18 + 23);
    }
    else {
      size_t v25 = (size_t)v18[1];
    }
    int v26 = *((char *)v17 + 23);
    if (v26 >= 0) {
      size_t v27 = v17;
    }
    else {
      size_t v27 = *v17;
    }
    if (v26 >= 0) {
      size_t v28 = *((unsigned __int8 *)v17 + 23);
    }
    else {
      size_t v28 = (size_t)v17[1];
    }
    if (v28 >= v25) {
      size_t v29 = v25;
    }
    else {
      size_t v29 = v28;
    }
    int v30 = memcmp(v24, v27, v29);
    if (v30)
    {
      if (v30 < 0) {
        goto LABEL_25;
      }
    }
    else if (v25 <= v28)
    {
      goto LABEL_25;
    }
    long long v44 = *(_OWORD *)v18;
    size_t v45 = v18[2];
    *(_OWORD *)uint64_t v18 = *(_OWORD *)v17;
    v18[2] = v17[2];
    *((unsigned char *)v17 + 23) = 0;
    *(unsigned char *)uint64_t v17 = 0;
    uint64_t v21 = a1;
    if (v17 == (const void **)a1) {
      goto LABEL_24;
    }
    uint64_t v31 = v19;
    while (1)
    {
      uint64_t v32 = a1 + v31;
      uint64_t v33 = (_OWORD *)(a1 + v31 + 24);
      unint64_t v34 = SHIBYTE(v45) >= 0 ? &v44 : (long long *)v44;
      unint64_t v35 = SHIBYTE(v45) >= 0 ? HIBYTE(v45) : *((void *)&v44 + 1);
      int v36 = *(char *)(v32 + 47);
      int v37 = v36 >= 0 ? (const void *)(a1 + v31 + 24) : *(const void **)(a1 + v31 + 24);
      unint64_t v38 = v36 >= 0 ? *(unsigned __int8 *)(v32 + 47) : *(void *)(v32 + 32);
      size_t v39 = v38 >= v35 ? v35 : v38;
      int v40 = memcmp(v34, v37, v39);
      if (!v40) {
        break;
      }
      if (v40 < 0)
      {
        uint64_t v21 = (uint64_t)v17;
        goto LABEL_23;
      }
LABEL_48:
      v17 -= 3;
      *(_OWORD *)(v32 + 48) = *v33;
      *(void *)(v32 + 64) = *(void *)(a1 + v31 + 40);
      *(unsigned char *)(v32 + 47) = 0;
      *(unsigned char *)uint64_t v33 = 0;
      v31 -= 24;
      if (v31 == -48)
      {
        uint64_t v21 = a1;
        goto LABEL_23;
      }
    }
    if (v35 > v38) {
      goto LABEL_48;
    }
    uint64_t v21 = a1 + v31 + 48;
LABEL_23:
    uint64_t v2 = v43;
LABEL_24:
    long long v22 = v44;
    *(void *)(v21 + 16) = v45;
    *(_OWORD *)uint64_t v21 = v22;
    if (++v20 == 8) {
      return v18 + 3 == v2;
    }
LABEL_25:
    uint64_t v17 = v18;
    v19 += 24;
    v18 += 3;
    if (v18 != v2) {
      continue;
    }
    return 1;
  }
}

__n128 sub_10001DD38(uint64_t a1, uint64_t a2, uint64_t a3, const void **a4)
{
  sub_10001D22C(a1, a2, (const void **)a3);
  int v8 = *((char *)a4 + 23);
  if (v8 >= 0) {
    size_t v9 = a4;
  }
  else {
    size_t v9 = *a4;
  }
  if (v8 >= 0) {
    size_t v10 = *((unsigned __int8 *)a4 + 23);
  }
  else {
    size_t v10 = (size_t)a4[1];
  }
  int v11 = *(char *)(a3 + 23);
  size_t v12 = *(const void **)a3;
  unint64_t v13 = *(const void **)(a3 + 8);
  if (v11 >= 0) {
    size_t v14 = (const void *)a3;
  }
  else {
    size_t v14 = *(const void **)a3;
  }
  if (v11 >= 0) {
    size_t v15 = *(unsigned __int8 *)(a3 + 23);
  }
  else {
    size_t v15 = *(void *)(a3 + 8);
  }
  if (v15 >= v10) {
    size_t v16 = v10;
  }
  else {
    size_t v16 = v15;
  }
  int v17 = memcmp(v9, v14, v16);
  if (v17)
  {
    if (v17 < 0) {
      return result;
    }
  }
  else if (v10 <= v15)
  {
    return result;
  }
  uint64_t v19 = *(const void **)(a3 + 16);
  int v20 = a4[2];
  *(_OWORD *)a3 = *(_OWORD *)a4;
  *(void *)(a3 + 16) = v20;
  *a4 = v12;
  a4[1] = v13;
  a4[2] = v19;
  int v21 = *(char *)(a3 + 23);
  if (v21 >= 0) {
    long long v22 = (const void *)a3;
  }
  else {
    long long v22 = *(const void **)a3;
  }
  if (v21 >= 0) {
    size_t v23 = *(unsigned __int8 *)(a3 + 23);
  }
  else {
    size_t v23 = *(void *)(a3 + 8);
  }
  int v24 = *(char *)(a2 + 23);
  size_t v25 = *(const void **)a2;
  uint64_t v26 = *(void *)(a2 + 8);
  if (v24 >= 0) {
    size_t v27 = (const void *)a2;
  }
  else {
    size_t v27 = *(const void **)a2;
  }
  if (v24 >= 0) {
    size_t v28 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    size_t v28 = *(void *)(a2 + 8);
  }
  if (v28 >= v23) {
    size_t v29 = v23;
  }
  else {
    size_t v29 = v28;
  }
  int v30 = memcmp(v22, v27, v29);
  if (v30)
  {
    if (v30 < 0) {
      return result;
    }
  }
  else if (v23 <= v28)
  {
    return result;
  }
  uint64_t v31 = *(void *)(a2 + 16);
  uint64_t v32 = *(void *)(a3 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a3;
  *(void *)(a2 + 16) = v32;
  *(void *)a3 = v25;
  *(void *)(a3 + 8) = v26;
  *(void *)(a3 + 16) = v31;
  int v33 = *(char *)(a2 + 23);
  if (v33 >= 0) {
    unint64_t v34 = (const void *)a2;
  }
  else {
    unint64_t v34 = *(const void **)a2;
  }
  if (v33 >= 0) {
    size_t v35 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    size_t v35 = *(void *)(a2 + 8);
  }
  int v36 = *(char *)(a1 + 23);
  int v37 = *(const void **)a1;
  uint64_t v38 = *(void *)(a1 + 8);
  if (v36 >= 0) {
    size_t v39 = (const void *)a1;
  }
  else {
    size_t v39 = *(const void **)a1;
  }
  if (v36 >= 0) {
    size_t v40 = *(unsigned __int8 *)(a1 + 23);
  }
  else {
    size_t v40 = *(void *)(a1 + 8);
  }
  if (v40 >= v35) {
    size_t v41 = v35;
  }
  else {
    size_t v41 = v40;
  }
  int v42 = memcmp(v34, v39, v41);
  if (!v42)
  {
    if (v35 <= v40) {
      return result;
    }
LABEL_58:
    uint64_t v43 = *(void *)(a1 + 16);
    uint64_t v44 = *(void *)(a2 + 16);
    __n128 result = *(__n128 *)a2;
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(void *)(a1 + 16) = v44;
    *(void *)a2 = v37;
    *(void *)(a2 + 8) = v38;
    *(void *)(a2 + 16) = v43;
    return result;
  }
  if ((v42 & 0x80000000) == 0) {
    goto LABEL_58;
  }
  return result;
}

__n128 sub_10001DEDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const void **a5)
{
  sub_10001DD38(a1, a2, a3, (const void **)a4);
  int v10 = *((char *)a5 + 23);
  if (v10 >= 0) {
    int v11 = a5;
  }
  else {
    int v11 = *a5;
  }
  if (v10 >= 0) {
    size_t v12 = *((unsigned __int8 *)a5 + 23);
  }
  else {
    size_t v12 = (size_t)a5[1];
  }
  int v13 = *(char *)(a4 + 23);
  size_t v14 = *(const void **)a4;
  size_t v15 = *(const void **)(a4 + 8);
  if (v13 >= 0) {
    size_t v16 = (const void *)a4;
  }
  else {
    size_t v16 = *(const void **)a4;
  }
  if (v13 >= 0) {
    size_t v17 = *(unsigned __int8 *)(a4 + 23);
  }
  else {
    size_t v17 = *(void *)(a4 + 8);
  }
  if (v17 >= v12) {
    size_t v18 = v12;
  }
  else {
    size_t v18 = v17;
  }
  int v19 = memcmp(v11, v16, v18);
  if (v19)
  {
    if (v19 < 0) {
      return result;
    }
  }
  else if (v12 <= v17)
  {
    return result;
  }
  int v21 = *(const void **)(a4 + 16);
  long long v22 = a5[2];
  *(_OWORD *)a4 = *(_OWORD *)a5;
  *(void *)(a4 + 16) = v22;
  *a5 = v14;
  a5[1] = v15;
  a5[2] = v21;
  int v23 = *(char *)(a4 + 23);
  if (v23 >= 0) {
    int v24 = (const void *)a4;
  }
  else {
    int v24 = *(const void **)a4;
  }
  if (v23 >= 0) {
    size_t v25 = *(unsigned __int8 *)(a4 + 23);
  }
  else {
    size_t v25 = *(void *)(a4 + 8);
  }
  int v26 = *(char *)(a3 + 23);
  size_t v27 = *(const void **)a3;
  uint64_t v28 = *(void *)(a3 + 8);
  if (v26 >= 0) {
    size_t v29 = (const void *)a3;
  }
  else {
    size_t v29 = *(const void **)a3;
  }
  if (v26 >= 0) {
    size_t v30 = *(unsigned __int8 *)(a3 + 23);
  }
  else {
    size_t v30 = *(void *)(a3 + 8);
  }
  if (v30 >= v25) {
    size_t v31 = v25;
  }
  else {
    size_t v31 = v30;
  }
  int v32 = memcmp(v24, v29, v31);
  if (v32)
  {
    if (v32 < 0) {
      return result;
    }
  }
  else if (v25 <= v30)
  {
    return result;
  }
  uint64_t v33 = *(void *)(a3 + 16);
  uint64_t v34 = *(void *)(a4 + 16);
  *(_OWORD *)a3 = *(_OWORD *)a4;
  *(void *)(a3 + 16) = v34;
  *(void *)a4 = v27;
  *(void *)(a4 + 8) = v28;
  *(void *)(a4 + 16) = v33;
  int v35 = *(char *)(a3 + 23);
  if (v35 >= 0) {
    int v36 = (const void *)a3;
  }
  else {
    int v36 = *(const void **)a3;
  }
  if (v35 >= 0) {
    size_t v37 = *(unsigned __int8 *)(a3 + 23);
  }
  else {
    size_t v37 = *(void *)(a3 + 8);
  }
  int v38 = *(char *)(a2 + 23);
  size_t v39 = *(const void **)a2;
  uint64_t v40 = *(void *)(a2 + 8);
  if (v38 >= 0) {
    size_t v41 = (const void *)a2;
  }
  else {
    size_t v41 = *(const void **)a2;
  }
  if (v38 >= 0) {
    size_t v42 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    size_t v42 = *(void *)(a2 + 8);
  }
  if (v42 >= v37) {
    size_t v43 = v37;
  }
  else {
    size_t v43 = v42;
  }
  int v44 = memcmp(v36, v41, v43);
  if (v44)
  {
    if (v44 < 0) {
      return result;
    }
  }
  else if (v37 <= v42)
  {
    return result;
  }
  uint64_t v45 = *(void *)(a2 + 16);
  uint64_t v46 = *(void *)(a3 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a3;
  *(void *)(a2 + 16) = v46;
  *(void *)a3 = v39;
  *(void *)(a3 + 8) = v40;
  *(void *)(a3 + 16) = v45;
  int v47 = *(char *)(a2 + 23);
  if (v47 >= 0) {
    long long v48 = (const void *)a2;
  }
  else {
    long long v48 = *(const void **)a2;
  }
  if (v47 >= 0) {
    size_t v49 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    size_t v49 = *(void *)(a2 + 8);
  }
  int v50 = *(char *)(a1 + 23);
  long long v51 = *(const void **)a1;
  uint64_t v52 = *(void *)(a1 + 8);
  if (v50 >= 0) {
    long long v53 = (const void *)a1;
  }
  else {
    long long v53 = *(const void **)a1;
  }
  if (v50 >= 0) {
    size_t v54 = *(unsigned __int8 *)(a1 + 23);
  }
  else {
    size_t v54 = *(void *)(a1 + 8);
  }
  if (v54 >= v49) {
    size_t v55 = v49;
  }
  else {
    size_t v55 = v54;
  }
  int v56 = memcmp(v48, v53, v55);
  if (v56)
  {
    if (v56 < 0) {
      return result;
    }
  }
  else if (v49 <= v54)
  {
    return result;
  }
  uint64_t v57 = *(void *)(a1 + 16);
  uint64_t v58 = *(void *)(a2 + 16);
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v58;
  *(void *)a2 = v51;
  *(void *)(a2 + 8) = v52;
  *(void *)(a2 + 16) = v57;
  return result;
}

__n128 sub_10001E0E4(uint64_t a1, uint64_t a2, uint64_t a3, __n128 *a4)
{
  unint64_t v6 = a3 - 2;
  if (a3 < 2) {
    return result;
  }
  uint64_t v59 = v4;
  uint64_t v60 = v5;
  uint64_t v8 = a1;
  uint64_t v9 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) < (uint64_t)(0xAAAAAAAAAAAAAAABLL * (((uint64_t)a4 - a1) >> 3))) {
    return result;
  }
  uint64_t v10 = a3;
  uint64_t v11 = (0x5555555555555556 * (((uint64_t)a4 - a1) >> 3)) | 1;
  uint64_t v12 = a1 + 24 * v11;
  uint64_t v13 = 0x5555555555555556 * (((uint64_t)a4 - a1) >> 3) + 2;
  if (v13 >= a3) {
    goto LABEL_24;
  }
  size_t v14 = (const void **)(v12 + 24);
  int v15 = *(char *)(v12 + 23);
  if (v15 >= 0) {
    size_t v16 = (const void *)(a1 + 24 * v11);
  }
  else {
    size_t v16 = *(const void **)v12;
  }
  if (v15 >= 0) {
    size_t v17 = *(unsigned __int8 *)(v12 + 23);
  }
  else {
    size_t v17 = *(void *)(v12 + 8);
  }
  int v18 = *(char *)(v12 + 47);
  if (v18 >= 0) {
    int v19 = (const void *)(v12 + 24);
  }
  else {
    int v19 = *(const void **)(v12 + 24);
  }
  if (v18 >= 0) {
    size_t v20 = *(unsigned __int8 *)(v12 + 47);
  }
  else {
    size_t v20 = *(void *)(v12 + 32);
  }
  if (v20 >= v17) {
    size_t v21 = v17;
  }
  else {
    size_t v21 = v20;
  }
  int v22 = memcmp(v16, v19, v21);
  if (v22)
  {
    if (v22 < 0)
    {
LABEL_24:
      size_t v14 = (const void **)(v8 + 24 * v11);
      uint64_t v13 = v11;
    }
  }
  else if (v17 == v20 || v17 < v20)
  {
    goto LABEL_24;
  }
  int v23 = *((char *)v14 + 23);
  if (v23 >= 0) {
    int v24 = v14;
  }
  else {
    int v24 = *v14;
  }
  if (v23 >= 0) {
    size_t v25 = *((unsigned __int8 *)v14 + 23);
  }
  else {
    size_t v25 = (size_t)v14[1];
  }
  int v26 = a4[1].n128_i8[7];
  if (v26 >= 0) {
    size_t v27 = a4;
  }
  else {
    size_t v27 = (__n128 *)a4->n128_u64[0];
  }
  if (v26 >= 0) {
    size_t v28 = a4[1].n128_u8[7];
  }
  else {
    size_t v28 = a4->n128_u64[1];
  }
  if (v28 >= v25) {
    size_t v29 = v25;
  }
  else {
    size_t v29 = v28;
  }
  int v30 = memcmp(v24, v27, v29);
  if (v30)
  {
    if ((v30 & 0x80000000) == 0) {
      return result;
    }
  }
  else if (v25 > v28)
  {
    return result;
  }
  __n128 v57 = *a4;
  uint64_t v58 = (const void *)a4[1].n128_u64[0];
  a4->n128_u64[1] = 0;
  a4[1].n128_u64[0] = 0;
  a4->n128_u64[0] = 0;
  int v32 = v14[2];
  *a4 = *(__n128 *)v14;
  a4[1].n128_u64[0] = (unint64_t)v32;
  *((unsigned char *)v14 + 23) = 0;
  *(unsigned char *)size_t v14 = 0;
  if (v9 >= v13)
  {
    uint64_t v33 = &v57;
    if (SHIBYTE(v58) < 0) {
      uint64_t v33 = (__n128 *)v57.n128_u64[0];
    }
    uint64_t v55 = v10;
    __s2 = v33;
    if (SHIBYTE(v58) >= 0) {
      size_t v34 = HIBYTE(v58);
    }
    else {
      size_t v34 = v57.n128_u64[1];
    }
    while (1)
    {
      uint64_t v36 = (2 * v13) | 1;
      uint64_t v37 = v8 + 24 * v36;
      uint64_t v13 = 2 * v13 + 2;
      if (v13 >= v10) {
        goto LABEL_74;
      }
      uint64_t v38 = v8;
      uint64_t v39 = v9;
      uint64_t v40 = (const void **)(v37 + 24);
      int v41 = *(char *)(v37 + 23);
      size_t v42 = v41 >= 0 ? (const void *)v37 : *(const void **)v37;
      unint64_t v43 = v41 >= 0 ? *(unsigned __int8 *)(v37 + 23) : *(void *)(v37 + 8);
      int v44 = *(char *)(v37 + 47);
      uint64_t v45 = v44 >= 0 ? (const void *)(v37 + 24) : *(const void **)(v37 + 24);
      unint64_t v46 = v44 >= 0 ? *(unsigned __int8 *)(v37 + 47) : *(void *)(v37 + 32);
      size_t v47 = v46 >= v43 ? v43 : v46;
      int v48 = memcmp(v42, v45, v47);
      if (v48) {
        break;
      }
      BOOL v49 = v43 >= v46;
      if (v43 == v46)
      {
        uint64_t v40 = (const void **)v37;
        uint64_t v13 = v36;
        uint64_t v9 = v39;
        uint64_t v8 = v38;
        uint64_t v10 = v55;
        goto LABEL_75;
      }
      uint64_t v9 = v39;
      uint64_t v8 = v38;
      uint64_t v10 = v55;
      if (!v49) {
        goto LABEL_74;
      }
LABEL_75:
      int v50 = *((char *)v40 + 23);
      if (v50 >= 0) {
        long long v51 = v40;
      }
      else {
        long long v51 = *v40;
      }
      if (v50 >= 0) {
        size_t v52 = *((unsigned __int8 *)v40 + 23);
      }
      else {
        size_t v52 = (size_t)v40[1];
      }
      if (v34 >= v52) {
        size_t v53 = v52;
      }
      else {
        size_t v53 = v34;
      }
      int v54 = memcmp(v51, __s2, v53);
      if (v54)
      {
        if ((v54 & 0x80000000) == 0) {
          goto LABEL_86;
        }
      }
      else if (v52 > v34)
      {
        goto LABEL_86;
      }
      long long v35 = *(_OWORD *)v40;
      v14[2] = v40[2];
      *(_OWORD *)size_t v14 = v35;
      *((unsigned char *)v40 + 23) = 0;
      *(unsigned char *)uint64_t v40 = 0;
      size_t v14 = v40;
      if (v9 < v13) {
        goto LABEL_87;
      }
    }
    uint64_t v9 = v39;
    uint64_t v8 = v38;
    uint64_t v10 = v55;
    if ((v48 & 0x80000000) == 0) {
      goto LABEL_75;
    }
LABEL_74:
    uint64_t v40 = (const void **)v37;
    uint64_t v13 = v36;
    goto LABEL_75;
  }
LABEL_86:
  uint64_t v40 = v14;
LABEL_87:
  __n128 result = v57;
  v40[2] = v58;
  *(__n128 *)uint64_t v40 = result;
  return result;
}

void sub_10001E3BC(void **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 < 2) {
    return;
  }
  uint64_t v5 = 0;
  size_t v25 = *a1;
  int v24 = a1[1];
  int v23 = a1[2];
  a1[1] = 0;
  a1[2] = 0;
  int64_t v6 = (unint64_t)(a4 - 2) >> 1;
  int v7 = a1;
  *a1 = 0;
  do
  {
    uint64_t v9 = (uint64_t)&v7[3 * v5 + 3];
    uint64_t v10 = (2 * v5) | 1;
    uint64_t v5 = 2 * v5 + 2;
    if (v5 >= a4)
    {
LABEL_26:
      uint64_t v11 = v9;
      uint64_t v5 = v10;
      if ((*((char *)v7 + 23) & 0x80000000) == 0) {
        goto LABEL_3;
      }
      goto LABEL_27;
    }
    uint64_t v11 = v9 + 24;
    int v12 = *(char *)(v9 + 23);
    if (v12 >= 0) {
      uint64_t v13 = (const void *)v9;
    }
    else {
      uint64_t v13 = *(const void **)v9;
    }
    if (v12 >= 0) {
      size_t v14 = *(unsigned __int8 *)(v9 + 23);
    }
    else {
      size_t v14 = *(void *)(v9 + 8);
    }
    int v15 = *(char *)(v9 + 47);
    if (v15 >= 0) {
      size_t v16 = (const void *)(v9 + 24);
    }
    else {
      size_t v16 = *(const void **)(v9 + 24);
    }
    if (v15 >= 0) {
      size_t v17 = *(unsigned __int8 *)(v9 + 47);
    }
    else {
      size_t v17 = *(void *)(v9 + 32);
    }
    if (v17 >= v14) {
      size_t v18 = v14;
    }
    else {
      size_t v18 = v17;
    }
    int v19 = memcmp(v13, v16, v18);
    if (v19)
    {
      if (v19 < 0) {
        goto LABEL_26;
      }
    }
    else if (v14 == v17 || v14 < v17)
    {
      goto LABEL_26;
    }
    if ((*((char *)v7 + 23) & 0x80000000) == 0) {
      goto LABEL_3;
    }
LABEL_27:
    operator delete(*v7);
LABEL_3:
    long long v8 = *(_OWORD *)v11;
    v7[2] = *(void **)(v11 + 16);
    *(_OWORD *)int v7 = v8;
    *(unsigned char *)(v11 + 23) = 0;
    *(unsigned char *)uint64_t v11 = 0;
    int v7 = (void **)v11;
  }
  while (v5 <= v6);
  if (v11 == a2 - 24)
  {
    *(void *)uint64_t v11 = v25;
    *(void *)(v11 + 8) = v24;
    *(void *)(v11 + 16) = v23;
  }
  else
  {
    long long v20 = *(_OWORD *)(a2 - 24);
    *(void *)(v11 + 16) = *(void *)(a2 - 8);
    *(_OWORD *)uint64_t v11 = v20;
    *(void *)(a2 - 24) = v25;
    *(void *)(a2 - 16) = v24;
    *(void *)(a2 - 8) = v23;
    sub_10001E594((uint64_t)a1, v11 + 24, a3, 0xAAAAAAAAAAAAAAABLL * ((v11 + 24 - (uint64_t)a1) >> 3));
  }
}

__n128 sub_10001E594(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4 - 2;
  if (a4 >= 2)
  {
    unint64_t v6 = v4 >> 1;
    int v7 = (__n128 *)(a1 + 24 * (v4 >> 1));
    long long v8 = (__n128 *)(a2 - 24);
    int v9 = v7[1].n128_i8[7];
    if (v9 >= 0) {
      uint64_t v10 = (const void *)(a1 + 24 * (v4 >> 1));
    }
    else {
      uint64_t v10 = (const void *)v7->n128_u64[0];
    }
    if (v9 >= 0) {
      size_t v11 = v7[1].n128_u8[7];
    }
    else {
      size_t v11 = v7->n128_u64[1];
    }
    int v12 = *(char *)(a2 - 1);
    if (v12 >= 0) {
      uint64_t v13 = (const void *)(a2 - 24);
    }
    else {
      uint64_t v13 = *(const void **)(a2 - 24);
    }
    if (v12 >= 0) {
      size_t v14 = v8[1].n128_u8[7];
    }
    else {
      size_t v14 = v8->n128_u64[1];
    }
    if (v14 >= v11) {
      size_t v15 = v11;
    }
    else {
      size_t v15 = v14;
    }
    int v16 = memcmp(v10, v13, v15);
    if (v16)
    {
      if (v16 < 0) {
        return result;
      }
    }
    else if (v11 <= v14)
    {
      return result;
    }
    unint64_t v32 = v8[1].n128_u64[0];
    unint64_t v18 = v32;
    __n128 v31 = *v8;
    v8->n128_u64[1] = 0;
    v8[1].n128_u64[0] = 0;
    v8->n128_u64[0] = 0;
    size_t v19 = HIBYTE(v18);
    if ((v19 & 0x80u) == 0) {
      long long v20 = &v31;
    }
    else {
      long long v20 = (__n128 *)v31.n128_u64[0];
    }
    if ((v19 & 0x80u) == 0) {
      size_t v21 = v19;
    }
    else {
      size_t v21 = v31.n128_u64[1];
    }
    __n128 v22 = *v7;
    v8[1].n128_u64[0] = v7[1].n128_u64[0];
    __n128 *v8 = v22;
    v7[1].n128_u8[7] = 0;
    v7->n128_u8[0] = 0;
    if (v4 >= 2)
    {
      while (1)
      {
        unint64_t v24 = v6 - 1;
        unint64_t v6 = (v6 - 1) >> 1;
        size_t v25 = (__n128 *)(a1 + 24 * v6);
        int v26 = v25[1].n128_i8[7];
        if (v26 >= 0) {
          size_t v27 = (const void *)(a1 + 24 * v6);
        }
        else {
          size_t v27 = (const void *)v25->n128_u64[0];
        }
        if (v26 >= 0) {
          size_t v28 = v25[1].n128_u8[7];
        }
        else {
          size_t v28 = v25->n128_u64[1];
        }
        if (v21 >= v28) {
          size_t v29 = v28;
        }
        else {
          size_t v29 = v21;
        }
        int v30 = memcmp(v27, v20, v29);
        if (v30)
        {
          if (v30 < 0) {
            break;
          }
        }
        else if (v28 <= v21)
        {
          break;
        }
        __n128 v23 = *v25;
        v7[1].n128_u64[0] = v25[1].n128_u64[0];
        *int v7 = v23;
        v25[1].n128_u8[7] = 0;
        v25->n128_u8[0] = 0;
        int v7 = (__n128 *)(a1 + 24 * v6);
        if (v24 <= 1) {
          goto LABEL_43;
        }
      }
    }
    size_t v25 = v7;
LABEL_43:
    __n128 result = v31;
    v25[1].n128_u64[0] = v32;
    *size_t v25 = result;
  }
  return result;
}

void **sub_10001E720(void **__dst, void *__src, size_t __len)
{
  LODWORD(v6) = *((char *)__dst + 23);
  if ((v6 & 0x80000000) != 0)
  {
    unint64_t v10 = (unint64_t)__dst[2];
    unint64_t v8 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (__len > v8)
    {
      size_t v11 = 0x7FFFFFFFFFFFFFF7;
      if (0x7FFFFFFFFFFFFFF7 - (v10 & 0x7FFFFFFFFFFFFFFFLL) >= __len - v8)
      {
        int v9 = *__dst;
        if (v8 > 0x3FFFFFFFFFFFFFF2)
        {
LABEL_15:
          int v7 = operator new(v11);
          memcpy(v7, __src, __len);
          if (v8 != 22) {
            operator delete(v9);
          }
          __dst[2] = (void *)(v11 | 0x8000000000000000);
          *__dst = v7;
LABEL_23:
          __dst[1] = (void *)__len;
          goto LABEL_24;
        }
LABEL_8:
        unint64_t v12 = 2 * v8;
        if (__len > 2 * v8) {
          unint64_t v12 = __len;
        }
        uint64_t v13 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v12 | 7) != 0x17) {
          uint64_t v13 = v12 | 7;
        }
        if (v12 >= 0x17) {
          size_t v11 = v13 + 1;
        }
        else {
          size_t v11 = 23;
        }
        goto LABEL_15;
      }
LABEL_25:
      sub_100006DCC();
    }
    unint64_t v6 = HIBYTE(v10);
    int v7 = *__dst;
  }
  else
  {
    int v7 = __dst;
    if (__len > 0x16)
    {
      if (__len - 0x7FFFFFFFFFFFFFF7 >= 0x800000000000001FLL)
      {
        unint64_t v8 = 22;
        int v9 = __dst;
        goto LABEL_8;
      }
      goto LABEL_25;
    }
  }
  if (__len)
  {
    memmove(v7, __src, __len);
    LOBYTE(v6) = *((unsigned char *)__dst + 23);
  }
  if ((v6 & 0x80) != 0) {
    goto LABEL_23;
  }
  *((unsigned char *)__dst + 23) = __len & 0x7F;
LABEL_24:
  *((unsigned char *)v7 + __len) = 0;
  return __dst;
}

void **sub_10001E880(void **a1, char *__s)
{
  size_t v4 = strlen(__s);
  return sub_10001E720(a1, __s, v4);
}

uint64_t sub_10001E8C8()
{
  v0 = (ctu::Gestalt *)pthread_mutex_lock(&stru_1000345C8);
  uint64_t v1 = off_100034608;
  if (!off_100034608)
  {
    ctu::Gestalt::create_default_global((uint64_t *)&v8, v0);
    long long v2 = v8;
    long long v8 = 0uLL;
    uint64_t v3 = (std::__shared_weak_count *)*(&off_100034608 + 1);
    off_100034608 = v2;
    if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
    size_t v4 = (std::__shared_weak_count *)*((void *)&v8 + 1);
    if (*((void *)&v8 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v8 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
    uint64_t v1 = off_100034608;
  }
  uint64_t v5 = (std::__shared_weak_count *)*(&off_100034608 + 1);
  if (*(&off_100034608 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_100034608 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&stru_1000345C8);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v1 + 144))(v1);
  uint64_t v7 = result;
  if (v5)
  {
    if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
      return v7;
    }
  }
  return result;
}

void sub_10001EA68(_Unwind_Exception *a1)
{
}

void sub_10001EA84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_10001EA9C(uint64_t a1)
{
  pthread_mutex_lock((pthread_mutex_t *)a1);
  long long v2 = *(std::__shared_weak_count **)(a1 + 72);
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  pthread_mutex_unlock((pthread_mutex_t *)a1);
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 72);
  if (!v3 || atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    return a1;
  }
  ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
  std::__shared_weak_count::__release_weak(v3);
  return a1;
}

uint64_t sub_10001EB78()
{
  if ((byte_100034618 & 1) == 0)
  {
    byte_100034618 = 1;
    return __cxa_atexit((void (*)(void *))sub_10001EA9C, &stru_1000345C8, (void *)&_mh_execute_header);
  }
  return result;
}

void sub_10001ED1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001EE0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)TelephonyExtension;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_10001EFB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001F0D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001F324(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001F41C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001F6FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_10001FE78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t *GetOsLogContext(void)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_100034628, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_100034628))
  {
    qword_100034638 = 0;
    qword_100034630 = 0;
    __cxa_atexit((void (*)(void *))&ctu::OsLogContext::~OsLogContext, &qword_100034630, (void *)&_mh_execute_header);
    __cxa_guard_release(&qword_100034628);
  }
  if (qword_100034620 != -1) {
    dispatch_once(&qword_100034620, &stru_1000310D8);
  }
  return &qword_100034630;
}

void sub_1000200C0(id a1)
{
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v1, "com.apple.telephony.abm", "global");
  ctu::OsLogContext::operator=();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v1);
}

void sub_100020340(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
  {
    operator delete(__p);

    _Unwind_Resume(a1);
  }

  _Unwind_Resume(a1);
}

void sub_1000207B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  sub_100007248((uint64_t)&a9);
  objc_destroyWeak(v31);
  objc_destroyWeak(v30);
  objc_destroyWeak((id *)(v32 - 88));
  _Unwind_Resume(a1);
}

void sub_10002086C(uint64_t a1, xpc_object_t a2)
{
  uint64_t v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (!WeakRetained) {
    return;
  }
  uint64_t v5 = (char *)objc_loadWeakRetained(v3);
  if (a2)
  {
    xpc_retain(a2);
    goto LABEL_5;
  }
  a2 = xpc_null_create();
  if (a2)
  {
LABEL_5:
    if (xpc_get_type(a2) == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_retain(a2);
      xpc_object_t v6 = a2;
    }
    else
    {
      xpc_object_t v6 = xpc_null_create();
    }
    goto LABEL_9;
  }
  xpc_object_t v6 = xpc_null_create();
  a2 = 0;
LABEL_9:
  xpc_release(a2);
  memset(__p, 170, sizeof(__p));
  xpc_object_t value = xpc_dictionary_get_value(v6, abm::kKeyTimestampString);
  *(void *)object = value;
  if (value) {
    xpc_retain(value);
  }
  else {
    *(void *)object = xpc_null_create();
  }
  xpc::dyn_cast_or_default((uint64_t *)__p, (xpc *)object, (const object *)"", v8);
  xpc_release(*(xpc_object_t *)object);
  int v9 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v10 = __p;
    if (SHIBYTE(__p[2]) < 0) {
      unint64_t v10 = (void **)__p[0];
    }
    *(_DWORD *)object = 136315138;
    *(void *)&object[4] = v10;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v9, OS_LOG_TYPE_DEFAULT, "Received kEventTracePostProcessingEnd w timestamp [%s]", object, 0xCu);
  }
  size_t v11 = v5 + 64;
  if ((v5[87] & 0x80000000) == 0)
  {
    size_t v12 = v5[87];
    if (!v5[87]) {
      goto LABEL_29;
    }
LABEL_21:
    if (SHIBYTE(__p[2]) >= 0) {
      uint64_t v13 = __p;
    }
    else {
      uint64_t v13 = (void **)__p[0];
    }
    if (!strncasecmp(v11, (const char *)v13, v12))
    {
      size_t v14 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
      if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)object = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v14, OS_LOG_TYPE_DEFAULT, "Telephony log is ready", object, 2u);
      }
      size_t v15 = *((void *)v5 + 6);
      *((void *)v5 + 6) = 0;
      if (v15)
      {
        dispatch_group_leave(v15);
        dispatch_release(v15);
      }
    }
    goto LABEL_29;
  }
  size_t v12 = *((void *)v5 + 9);
  if (v12)
  {
    size_t v11 = *(const char **)v11;
    goto LABEL_21;
  }
LABEL_29:
  if (SHIBYTE(__p[2]) < 0) {
    operator delete(__p[0]);
  }
  xpc_release(v6);
}

void sub_100020AC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, xpc_object_t object)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  xpc_release(v17);

  _Unwind_Resume(a1);
}

void sub_100020B38(uint64_t a1, xpc_object_t a2)
{
  uint64_t v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (!WeakRetained) {
    return;
  }
  uint64_t v5 = (unsigned __int8 *)objc_loadWeakRetained(v3);
  if (a2)
  {
    xpc_retain(a2);
  }
  else
  {
    a2 = xpc_null_create();
    if (!a2)
    {
      xpc_object_t v6 = xpc_null_create();
      a2 = 0;
      goto LABEL_9;
    }
  }
  if (xpc_get_type(a2) == (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_retain(a2);
    xpc_object_t v6 = a2;
  }
  else
  {
    xpc_object_t v6 = xpc_null_create();
  }
LABEL_9:
  xpc_release(a2);
  xpc_object_t value = xpc_dictionary_get_value(v6, abm::kKeyBasebandOperatingMode);
  *(void *)object = value;
  if (value) {
    xpc_retain(value);
  }
  else {
    *(void *)object = xpc_null_create();
  }
  unsigned __int8 v9 = xpc::dyn_cast_or_default((xpc *)object, (const object *)8, v8);
  xpc_release(*(xpc_object_t *)object);
  unint64_t v10 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
  {
    if (v9 > 7u) {
      size_t v11 = "Unknown";
    }
    else {
      size_t v11 = (&off_100031148)[(char)v9];
    }
    *(_DWORD *)object = 136315138;
    *(void *)&object[4] = v11;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v10, OS_LOG_TYPE_DEFAULT, "BB mode event [%s]", object, 0xCu);
  }
  size_t v12 = *((void *)v5 + 7);
  if (v12)
  {
    int v13 = v5[88];
    if (v13 != 8 && v13 == v9)
    {
      *((void *)v5 + 7) = 0;
      dispatch_group_leave(v12);
      dispatch_release(v12);
    }
  }
  xpc_release(v6);
}

void sub_100020D1C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  sub_10000628C(exception_object);
}

void sub_100020E18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_100020F00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)BasebandLogDEHelper;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_100021034(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
  {
    operator delete(__p);

    _Unwind_Resume(a1);
  }

  _Unwind_Resume(a1);
}

void sub_100022070(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t object, uint64_t a12, xpc_object_t a13, char a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,std::locale a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,xpc_object_t a39,uint64_t a40,int a41,__int16 a42,char a43,char a44,std::locale a45,uint64_t a46,int a47,__int16 a48,char a49,char a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,xpc_object_t a56,uint64_t a57,int a58,__int16 a59,char a60,char a61)
{
  if (a2) {
    sub_10000628C(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100022424(unsigned char *a1, uint64_t a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v36 = 0xAAAAAAAAAAAAAAAALL;
  long long v46 = v4;
  long long v45 = v4;
  long long v44 = v4;
  long long v43 = v4;
  long long v42 = v4;
  long long v41 = v4;
  long long v40 = v4;
  long long v39 = v4;
  long long v38 = v4;
  *(_OWORD *)size_t v34 = v4;
  long long v35 = v4;
  long long v32 = v4;
  long long v33 = v4;
  long long v30 = v4;
  long long v31 = v4;
  *(void (__cdecl ***)(std::ostringstream *__hidden))((char *)&v29 + (void)*(v29 - 3)) = v5;
  xpc_object_t v6 = (std::ios_base *)((char *)&v29 + (void)*(v29 - 3));
  std::ios_base::init(v6, &v30);
  v6[1].__vftable = 0;
  v6[1].__fmtflags_ = -1;
  std::streambuf::basic_streambuf();
  *(_OWORD *)size_t v34 = 0u;
  long long v35 = 0u;
  LODWORD(v36) = 16;
  uint64_t v7 = sub_100019AC0(&v29, (uint64_t)"Result:'", 8);
  switch(*(_DWORD *)a2)
  {
    case 0xE020E000:
      uint64_t v8 = 14;
      char v28 = 14;
      strcpy((char *)__p, "kInternalError");
      break;
    case 0xE020E001:
      uint64_t v8 = 12;
      char v28 = 12;
      strcpy((char *)__p, "kServerError");
      break;
    case 0xE020E002:
      uint64_t v8 = 13;
      unint64_t v10 = "kCommandError";
      goto LABEL_10;
    case 0xE020E003:
      uint64_t v8 = 8;
      char v28 = 8;
      uint64_t v9 = 0x74756F656D69546BLL;
      goto LABEL_8;
    case 0xE020E004:
      uint64_t v8 = 13;
      unint64_t v10 = "kNotSupported";
      goto LABEL_10;
    case 0xE020E005:
      uint64_t v8 = 6;
      char v28 = 6;
      strcpy((char *)__p, "kRetry");
      break;
    case 0xE020E006:
      uint64_t v8 = 17;
      char v28 = 17;
      __int16 v27 = 100;
      size_t v11 = "kPermissionDenied";
      goto LABEL_15;
    case 0xE020E007:
      uint64_t v8 = 13;
      unint64_t v10 = "kNotAvailable";
LABEL_10:
      char v28 = 13;
      __p[0] = *(void **)v10;
      *(void **)((char *)__p + 5) = *(void **)(v10 + 5);
      BYTE5(__p[1]) = 0;
      break;
    default:
      if (*(_DWORD *)a2)
      {
        uint64_t v8 = 17;
        char v28 = 17;
        __int16 v27 = 101;
        size_t v11 = "kInvalidErrorCode";
LABEL_15:
        *(_OWORD *)std::string __p = *(_OWORD *)v11;
      }
      else
      {
        uint64_t v8 = 8;
        char v28 = 8;
        uint64_t v9 = 0x737365636375536BLL;
LABEL_8:
        __p[0] = (void *)v9;
        LOBYTE(__p[1]) = 0;
      }
      break;
  }
  size_t v12 = sub_100019AC0(v7, (uint64_t)__p, v8);
  sub_100019AC0(v12, (uint64_t)"'", 1);
  if (v28 < 0)
  {
    operator delete(__p[0]);
    int v13 = *(char *)(a2 + 31);
    if ((v13 & 0x80000000) == 0)
    {
LABEL_18:
      if (!(_BYTE)v13) {
        goto LABEL_29;
      }
      goto LABEL_22;
    }
  }
  else
  {
    int v13 = *(char *)(a2 + 31);
    if ((v13 & 0x80000000) == 0) {
      goto LABEL_18;
    }
  }
  if (!*(void *)(a2 + 16)) {
    goto LABEL_29;
  }
LABEL_22:
  size_t v14 = sub_100019AC0(&v29, (uint64_t)" Info:'", 7);
  int v15 = *(char *)(a2 + 31);
  if (v15 >= 0) {
    uint64_t v16 = a2 + 8;
  }
  else {
    uint64_t v16 = *(void *)(a2 + 8);
  }
  if (v15 >= 0) {
    uint64_t v17 = *(unsigned __int8 *)(a2 + 31);
  }
  else {
    uint64_t v17 = *(void *)(a2 + 16);
  }
  unint64_t v18 = sub_100019AC0(v14, v16, v17);
  sub_100019AC0(v18, (uint64_t)"'", 1);
LABEL_29:
  if ((v36 & 0x10) != 0)
  {
    uint64_t v20 = *((void *)&v35 + 1);
    if (*((void *)&v35 + 1) < (unint64_t)v33)
    {
      *((void *)&v35 + 1) = v33;
      uint64_t v20 = v33;
    }
    size_t v21 = (const void *)*((void *)&v32 + 1);
    size_t v19 = v20 - *((void *)&v32 + 1);
    if ((unint64_t)(v20 - *((void *)&v32 + 1)) >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_46;
    }
  }
  else
  {
    if ((v36 & 8) == 0)
    {
      size_t v19 = 0;
      a1[23] = 0;
      goto LABEL_42;
    }
    size_t v21 = (const void *)v31;
    size_t v19 = v32 - v31;
    if ((void)v32 - (void)v31 >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_46:
    }
      sub_100006DCC();
  }
  if (v19 >= 0x17)
  {
    uint64_t v22 = (v19 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v19 | 7) != 0x17) {
      uint64_t v22 = v19 | 7;
    }
    uint64_t v23 = v22 + 1;
    unint64_t v24 = operator new(v22 + 1);
    *((void *)a1 + 1) = v19;
    *((void *)a1 + 2) = v23 | 0x8000000000000000;
    *(void *)a1 = v24;
    a1 = v24;
    goto LABEL_41;
  }
  a1[23] = v19;
  if (v19) {
LABEL_41:
  }
    memmove(a1, v21, v19);
LABEL_42:
  a1[v19] = 0;
  if (SBYTE7(v35) < 0) {
    operator delete(v34[0]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return std::ios::~ios();
}

void sub_100022988(_Unwind_Exception *a1)
{
}

void sub_1000229A8(_Unwind_Exception *a1)
{
}

void sub_1000229BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  if (a14 < 0)
  {
    operator delete(__p);
    sub_1000294E0((uint64_t)&a15);
    _Unwind_Resume(a1);
  }
  sub_1000294E0((uint64_t)&a15);
  _Unwind_Resume(a1);
}

void sub_100022C58(_Unwind_Exception *exception_object)
{
  if (v1)
  {
    dispatch_group_leave(v1);
    dispatch_release(v1);
    dispatch_release(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_100022F18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  sub_100007248((uint64_t)&a16);
  xpc_release(v16);
  _Unwind_Resume(a1);
}

void sub_100023AB0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, char a10, uint64_t a11, char a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,uint64_t a30,void *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  sub_10000628C(exception_object);
}

void sub_100024774(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t a10, char a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,xpc_object_t object,uint64_t a30,int a31,__int16 a32,char a33,char a34)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  sub_10000628C(exception_object);
}

void sub_100024D80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  xpc_release(object);
  if (a18 < 0) {
    operator delete(__p);
  }
  xpc_release(v29);
  if (a28 < 0) {
    operator delete(a23);
  }
  xpc_release(v28);
  _Unwind_Resume(a1);
}

void sub_100025270(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  xpc_release(object);
  if (a18 < 0) {
    operator delete(__p);
  }
  xpc_release(v29);
  if (a28 < 0) {
    operator delete(a23);
  }
  xpc_release(v28);
  _Unwind_Resume(a1);
}

unint64_t sub_10002536C(const std::string *a1, _DWORD *a2)
{
  if ((SHIBYTE(a1->__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    unint64_t result = strcasecmp((const char *)a1, "false");
    if (!result) {
      goto LABEL_29;
    }
    unint64_t result = strcasecmp((const char *)a1, "off");
    if (!result) {
      goto LABEL_29;
    }
    unint64_t result = strcasecmp((const char *)a1, "no");
    if (!result) {
      goto LABEL_29;
    }
    if (strcasecmp((const char *)a1, "true")
      && strcasecmp((const char *)a1, "on")
      && strcasecmp((const char *)a1, "yes")
      && strcasecmp((const char *)a1, "full")
      && strcasecmp((const char *)a1, "streaming"))
    {
      uint64_t v5 = (const char *)a1;
      if (!strcasecmp((const char *)a1, "lite")) {
        goto LABEL_31;
      }
      goto LABEL_21;
    }
LABEL_28:
    unint64_t result = 1;
LABEL_29:
    *a2 = result;
    return result;
  }
  uint64_t v5 = (const char *)a1->__r_.__value_.__r.__words[0];
  unint64_t result = strcasecmp(a1->__r_.__value_.__l.__data_, "false");
  if (!result) {
    goto LABEL_29;
  }
  unint64_t result = strcasecmp(v5, "off");
  if (!result) {
    goto LABEL_29;
  }
  unint64_t result = strcasecmp(v5, "no");
  if (!result) {
    goto LABEL_29;
  }
  if (!strcasecmp(v5, "true")
    || !strcasecmp(v5, "on")
    || !strcasecmp(v5, "yes")
    || !strcasecmp(v5, "full")
    || !strcasecmp(v5, "streaming"))
  {
    goto LABEL_28;
  }
  if (!strcasecmp(v5, "lite"))
  {
LABEL_31:
    unint64_t result = 2;
    goto LABEL_29;
  }
LABEL_21:
  if (!strcasecmp(v5, "background")) {
    goto LABEL_31;
  }
  size_t __idx = 0xAAAAAAAAAAAAAAAALL;
  unint64_t result = std::stol(a1, &__idx, 0);
  std::string::size_type size = HIBYTE(a1->__r_.__value_.__r.__words[2]);
  if ((size & 0x80u) != 0) {
    std::string::size_type size = a1->__r_.__value_.__l.__size_;
  }
  if (__idx == size && (result & 0x8000000000000000) == 0 && !HIDWORD(result)) {
    goto LABEL_29;
  }
  return result;
}

void sub_100025588(void *a1)
{
}

void sub_100025A04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, xpc_object_t object, char a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (*(char *)(v26 - 57) < 0) {
    operator delete(*(void **)(v26 - 80));
  }
  xpc_release(v25);
  if (a24 < 0) {
    operator delete(__p);
  }
  xpc_release(v24);
  _Unwind_Resume(a1);
}

void sub_1000264F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, id location, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29,uint64_t a30,void *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36)
{
  if (a2) {
    sub_10000628C(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000266C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    uint64_t v5 = (char *)objc_loadWeakRetained(v3);
    if (!*(_DWORD *)a2)
    {
      uint64_t v8 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(__p[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "Dump telephony log and wait for processing", (uint8_t *)__p, 2u);
      }
      goto LABEL_11;
    }
    xpc_object_t v6 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      if (*(char *)(a2 + 31) < 0)
      {
        sub_100006EA8(__p, *(void **)(a2 + 8), *(void *)(a2 + 16));
      }
      else
      {
        *(_OWORD *)std::string __p = *(_OWORD *)(a2 + 8);
        uint64_t v11 = *(void *)(a2 + 24);
      }
      uint64_t v9 = __p;
      if (v11 < 0) {
        uint64_t v9 = (void **)__p[0];
      }
      *(_DWORD *)buf = 136315138;
      int v13 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v6, OS_LOG_TYPE_ERROR, "Dumping telephony log failed w/ error %s", buf, 0xCu);
      if (SHIBYTE(v11) < 0) {
        operator delete(__p[0]);
      }
    }
    if (v5[87] < 0)
    {
      **((unsigned char **)v5 + 8) = 0;
      *((void *)v5 + 9) = 0;
      uint64_t v7 = *((void *)v5 + 6);
      *((void *)v5 + 6) = 0;
      if (!v7)
      {
LABEL_11:

        return;
      }
    }
    else
    {
      v5[64] = 0;
      v5[87] = 0;
      uint64_t v7 = *((void *)v5 + 6);
      *((void *)v5 + 6) = 0;
      if (!v7) {
        goto LABEL_11;
      }
    }
    dispatch_group_leave(v7);
    dispatch_release(v7);
    goto LABEL_11;
  }
}

void sub_100026880(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000270E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, id location, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29,uint64_t a30,void *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36)
{
  objc_destroyWeak(v37);
  objc_destroyWeak(&location);
  if (a29 < 0) {
    operator delete(__p);
  }
  xpc_release(v36);

  _Unwind_Resume(a1);
}

void sub_10002727C(uint64_t a1, _DWORD *a2)
{
  uint64_t v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    uint64_t v5 = (char *)objc_loadWeakRetained(v3);
    if (!*a2)
    {
      uint64_t v8 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "Resetting baseband successful. Waiting for logs.", v9, 2u);
      }
      goto LABEL_12;
    }
    xpc_object_t v6 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v6, OS_LOG_TYPE_ERROR, "Resetting baseband failed", buf, 2u);
      if ((v5[87] & 0x80000000) == 0)
      {
LABEL_5:
        v5[64] = 0;
        v5[87] = 0;
        uint64_t v7 = *((void *)v5 + 6);
        *((void *)v5 + 6) = 0;
        if (!v7) {
          goto LABEL_12;
        }
        goto LABEL_11;
      }
    }
    else if ((v5[87] & 0x80000000) == 0)
    {
      goto LABEL_5;
    }
    **((unsigned char **)v5 + 8) = 0;
    *((void *)v5 + 9) = 0;
    uint64_t v7 = *((void *)v5 + 6);
    *((void *)v5 + 6) = 0;
    if (!v7)
    {
LABEL_12:

      return;
    }
LABEL_11:
    dispatch_group_leave(v7);
    dispatch_release(v7);
    goto LABEL_12;
  }
}

void sub_1000273B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000273C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000279D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (a2)
  {
    __cxa_begin_catch(exception_object);
    __cxa_end_catch();
    JUMPOUT(0x10002795CLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_100027F50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, xpc_object_t object, uint64_t a20,uint64_t a21,char a22,uint64_t a23,xpc_object_t a24)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  xpc_release(object);
  xpc_release(v24);
  sub_100007248((uint64_t)&a22);
  _Unwind_Resume(a1);
}

void sub_10002800C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  sub_100007248((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_100028028(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  sub_10000628C(exception_object);
}

void sub_10002840C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, uint64_t a20,xpc_object_t object)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  xpc_release(object);
  xpc_release(v21);
  sub_100007248(v22 - 80);
  _Unwind_Resume(a1);
}

void sub_1000284BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  sub_100007248((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1000284D8(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  sub_10000628C(exception_object);
}

void sub_100028874(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, uint64_t a20,xpc_object_t object)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  xpc_release(object);
  xpc_release(v21);
  sub_100007248(v22 - 80);
  _Unwind_Resume(a1);
}

void sub_10002890C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  sub_100007248((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_100028928(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  sub_10000628C(exception_object);
}

void sub_100028ED8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, char a20,uint64_t a21,xpc_object_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *__p,uint64_t a27,int a28,__int16 a29,char a30,char a31)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  sub_10000628C(exception_object);
}

void sub_100029234(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t a9, xpc_object_t object, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17, xpc_object_t a18)
{
  if (a2) {
    sub_10000628C(exception_object);
  }
  _Unwind_Resume(exception_object);
}

const void **sub_1000292EC(const void **a1)
{
  long long v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_1000293B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
}

uint64_t sub_1000294E0(uint64_t a1)
{
  if (*(char *)(a1 + 95) < 0) {
    operator delete(*(void **)(a1 + 72));
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  std::ios::~ios();
  return a1;
}

void sub_1000295E4(void *a1)
{
  if (a1)
  {
    sub_1000295E4(*a1);
    sub_1000295E4(a1[1]);
    operator delete(a1);
  }
}

void sub_100029680(id a1)
{
  qword_100034640 = (uint64_t)os_log_create("com.apple.telephony.abm", "diagext");
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return _CFErrorGetCode(err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return _CFErrorGetDomain(err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return _CFPropertyListCreateWithStream(allocator, stream, streamLength, options, format, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return _CFReadStreamCreateWithFile(alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return _CFReadStreamOpen(stream);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return _CFURLCreateWithFileSystemPath(allocator, filePath, pathStyle, isDirectory);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t TelephonyUtilIsCarrierBuild()
{
  return _TelephonyUtilIsCarrierBuild();
}

uint64_t TelephonyUtilIsInternalBuild()
{
  return _TelephonyUtilIsInternalBuild();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t capabilities::abs::profileBasebandHistoryMB(capabilities::abs *this)
{
  return capabilities::abs::profileBasebandHistoryMB(this);
}

uint64_t capabilities::diag::supportsADPL(capabilities::diag *this)
{
  return capabilities::diag::supportsADPL(this);
}

uint64_t capabilities::diag::supportsQDSS(capabilities::diag *this)
{
  return capabilities::diag::supportsQDSS(this);
}

uint64_t capabilities::radio::radioUnknown(capabilities::radio *this)
{
  return capabilities::radio::radioUnknown(this);
}

uint64_t capabilities::radio::ice(capabilities::radio *this)
{
  return capabilities::radio::ice(this);
}

uint64_t capabilities::radio::maverick(capabilities::radio *this)
{
  return capabilities::radio::maverick(this);
}

uint64_t abm::HelperClient::create()
{
  return abm::HelperClient::create();
}

uint64_t abm::HelperClient::perform()
{
  return abm::HelperClient::perform();
}

uint64_t abm::client::CreateManager()
{
  return abm::client::CreateManager();
}

uint64_t abm::client::PerformCommand()
{
  return abm::client::PerformCommand();
}

{
  return abm::client::PerformCommand();
}

uint64_t abm::client::RegisterEventHandler()
{
  return abm::client::RegisterEventHandler();
}

uint64_t abm::client::EventsOn()
{
  return abm::client::EventsOn();
}

uint64_t abm::client::EventsOff()
{
  return abm::client::EventsOff();
}

uint64_t abm::helper::asString()
{
  return abm::helper::asString();
}

uint64_t ctu::OsLogContext::OsLogContext(ctu::OsLogContext *this, const char *a2, const char *a3)
{
  return ctu::OsLogContext::OsLogContext(this, a2, a3);
}

void ctu::OsLogContext::~OsLogContext(ctu::OsLogContext *this)
{
}

uint64_t ctu::OsLogContext::operator=()
{
  return ctu::OsLogContext::operator=();
}

uint64_t ctu::cf::assign()
{
  return ctu::cf::assign();
}

uint64_t ctu::Gestalt::create_default_global(ctu::Gestalt *this)
{
  return ctu::Gestalt::create_default_global(this);
}

uint64_t ctu::cf_to_xpc(ctu *this, const void *a2)
{
  return ctu::cf_to_xpc(this, a2);
}

uint64_t xpc::dyn_cast_or_default(xpc *this, const object *a2, const char *a3)
{
  return xpc::dyn_cast_or_default(this, (const xpc::object *)a2, a3);
}

uint64_t xpc::dyn_cast_or_default()
{
  return xpc::dyn_cast_or_default();
}

uint64_t xpc::dyn_cast_or_default(xpc *this, const object *a2, BOOL a3)
{
  return xpc::dyn_cast_or_default(this, (const xpc::object *)a2, a3);
}

uint64_t xpc::dyn_cast_or_default(xpc *this, const object *a2, int a3)
{
  return xpc::dyn_cast_or_default(this, (const xpc::object *)a2, a3);
}

uint64_t xpc::dyn_cast_or_default(xpc *this, const object *a2, uint64_t a3)
{
  return xpc::dyn_cast_or_default(this, (const xpc::object *)a2, a3);
}

uint64_t diag::config::toString()
{
  return diag::config::toString();
}

uint64_t defaults::systemlogs::mode(defaults::systemlogs *this)
{
  return defaults::systemlogs::mode(this);
}

uint64_t defaults::compression::mode(defaults::compression *this)
{
  return defaults::compression::mode(this);
}

uint64_t defaults::bbtrace::primary_dmc(defaults::bbtrace *this)
{
  return defaults::bbtrace::primary_dmc(this);
}

uint64_t defaults::bbtrace::data_logging(defaults::bbtrace *this)
{
  return defaults::bbtrace::data_logging(this);
}

uint64_t defaults::bbtrace::secondary_dmc(defaults::bbtrace *this)
{
  return defaults::bbtrace::secondary_dmc(this);
}

uint64_t defaults::bbtrace::enabled_during_sleep(defaults::bbtrace *this)
{
  return defaults::bbtrace::enabled_during_sleep(this);
}

uint64_t defaults::bbtrace::enabled(defaults::bbtrace *this)
{
  return defaults::bbtrace::enabled(this);
}

uint64_t defaults::bbtrace::history(defaults::bbtrace *this)
{
  return defaults::bbtrace::history(this);
}

uint64_t defaults::bbtrace::high_tput(defaults::bbtrace *this)
{
  return defaults::bbtrace::high_tput(this);
}

uint64_t Timestamp::now(Timestamp *this, timeval *a2)
{
  return Timestamp::now(this, a2);
}

void Timestamp::Timestamp(Timestamp *this)
{
}

uint64_t xpc::object::to_string(xpc::object *this)
{
  return xpc::object::to_string(this);
}

uint64_t Timestamp::asString()
{
  return Timestamp::asString();
}

std::string *__cdecl std::locale::name(std::string *__return_ptr retstr, const std::locale *this)
{
  return std::locale::name(retstr, this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return std::locale::use_facet(this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return std::ios_base::getloc(this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

std::regex_error *__cdecl std::regex_error::regex_error(std::regex_error *this, std::regex_constants::error_type __ecode)
{
  return std::regex_error::regex_error(this, __ecode);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return std::string::append(this, __s, __n);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

uint64_t std::filebuf::open()
{
  return std::filebuf::open();
}

uint64_t std::filebuf::basic_filebuf()
{
  return std::filebuf::basic_filebuf();
}

uint64_t std::filebuf::~filebuf()
{
  return std::filebuf::~filebuf();
}

uint64_t std::istream::peek()
{
  return std::istream::peek();
}

uint64_t std::istream::seekg()
{
  return std::istream::seekg();
}

uint64_t std::istream::tellg()
{
  return std::istream::tellg();
}

uint64_t std::istream::sentry::sentry()
{
  return std::istream::sentry::sentry();
}

uint64_t std::istream::~istream()
{
  return std::istream::~istream();
}

uint64_t std::ostream::sentry::sentry()
{
  return std::ostream::sentry::sentry();
}

uint64_t std::ostream::sentry::~sentry()
{
  return std::ostream::sentry::~sentry();
}

uint64_t std::ostream::~ostream()
{
  return std::ostream::~ostream();
}

std::regex_traits<char>::char_class_type std::__get_classname(const char *__s, BOOL __icase)
{
  return std::__get_classname(__s, __icase);
}

uint64_t std::streambuf::basic_streambuf()
{
  return std::streambuf::basic_streambuf();
}

uint64_t std::streambuf::~streambuf()
{
  return std::streambuf::~streambuf();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

std::string *__cdecl std::__get_collation_name(std::string *__return_ptr retstr, const char *__s)
{
  return std::__get_collation_name(retstr, __s);
}

uint64_t std::stol(const std::string *__str, size_t *__idx, int __base)
{
  return std::stol(__str, __idx, __base);
}

std::locale *__cdecl std::locale::locale(std::locale *this, const std::locale *a2)
{
  return std::locale::locale(this, a2);
}

std::locale *__cdecl std::locale::locale(std::locale *this)
{
  return std::locale::locale(this);
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return std::ios::~ios();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return std::to_string(retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return std::to_string(retstr, __val);
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return ___cxa_atexit(lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return ___cxa_guard_acquire((uint64_t *)a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return ___error();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

int closedir(DIR *a1)
{
  return _closedir(a1);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

int lstat(const char *a1, stat *a2)
{
  return _lstat(a1, a2);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return _memchr(__s, __c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

time_t mktime(tm *a1)
{
  return _mktime(a1);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

DIR *__cdecl opendir(const char *a1)
{
  return _opendir(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

dirent *__cdecl readdir(DIR *a1)
{
  return _readdir(a1);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return _strcasecmp(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return _strncasecmp(a1, a2, a3);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return _xpc_array_create(objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return _xpc_array_get_count(xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_value(xarray, index);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return _xpc_BOOL_create(value);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return _xpc_int64_create(value);
}

xpc_object_t xpc_null_create(void)
{
  return _xpc_null_create();
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return _xpc_retain(object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_airplaneMode(void *a1, const char *a2, ...)
{
  return [a1 airplaneMode];
}

id objc_msgSend_attachmentList(void *a1, const char *a2, ...)
{
  return [a1 attachmentList];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_checkBasebandBootStateAndReset(void *a1, const char *a2, ...)
{
  return [a1 checkBasebandBootStateAndReset];
}

id objc_msgSend_checkBasebandOperatingModeAndSet(void *a1, const char *a2, ...)
{
  return [a1 checkBasebandOperatingModeAndSet];
}

id objc_msgSend_checkifBasebandTraceEnabled(void *a1, const char *a2, ...)
{
  return [a1 checkifBasebandTraceEnabled];
}

id objc_msgSend_checkifDefaultBasebandProfileInstalled(void *a1, const char *a2, ...)
{
  return [a1 checkifDefaultBasebandProfileInstalled];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_disableBasebandLog(void *a1, const char *a2, ...)
{
  return [a1 disableBasebandLog];
}

id objc_msgSend_getAgeLimitForAttachment(void *a1, const char *a2, ...)
{
  return [a1 getAgeLimitForAttachment];
}

id objc_msgSend_getBasebandLogHistorySize(void *a1, const char *a2, ...)
{
  return [a1 getBasebandLogHistorySize];
}

id objc_msgSend_getOSLogHandler(void *a1, const char *a2, ...)
{
  return [a1 getOSLogHandler];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_isCompressionModeOff(void *a1, const char *a2, ...)
{
  return [a1 isCompressionModeOff];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_triggerBasebandBlindScanning(void *a1, const char *a2, ...)
{
  return [a1 triggerBasebandBlindScanning];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}