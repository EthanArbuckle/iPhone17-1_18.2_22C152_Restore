@interface NWConcrete
@end

@implementation NWConcrete

uint64_t __74__NWConcrete_nw_parameters_initWithParameters_stripConnected_shallowCopy___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = nw_protocol_transform_copy(a3);
  nw_array_append(*(void *)(*(void *)(a1 + 32) + 160), v4);

  return 1;
}

uint64_t __60__NWConcrete_nw_endpoint_resolver_cancelWithHandler_forced___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return 1;
}

uint64_t __61__NWConcrete_nw_endpoint_transform_cancelWithHandler_forced___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return 1;
}

uint64_t __57__NWConcrete_nw_listener_handleInbound_addProtocolInbox___block_invoke_44(uint64_t a1)
{
  return nw_utilities_execute_block_as_persona_from_parameters(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(void **)(a1 + 32));
}

void __37__NWConcrete_nw_endpoint_description__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (!v2[7])
  {
    v3 = (const char *)v2[8];
    if (v3
      || (*(void *)(*(void *)(a1 + 32) + 64) = [v2 createDescription:0],
          v2 = *(void **)(a1 + 32),
          (v3 = (const char *)v2[8]) != 0))
    {
      CFStringRef v4 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v3, 0x8000100u);
      uint64_t v5 = *(void *)(a1 + 32);
      v6 = *(void **)(v5 + 56);
      *(void *)(v5 + 56) = v4;

      v2 = *(void **)(a1 + 32);
    }
  }
  v7 = (void *)v2[7];
  v8 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v8, v7);
}

void __33__NWConcrete_nw_path_description__block_invoke(uint64_t a1)
{
}

void __33__NWConcrete_nw_path_description__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 256)) {
    objc_storeStrong((id *)(v1 + 256), *(id *)(a1 + 40));
  }
}

uint64_t __74__NWConcrete_nw_parameters_initWithParameters_stripConnected_shallowCopy___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  CFStringRef v4 = nw_protocol_options_copy(a3);
  nw_array_append(*(void *)(*(void *)(a1 + 32) + 168), v4);

  return 1;
}

void __33__NWConcrete_nw_endpoint_dealloc__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 64);
  if (v3)
  {
    free(v3);
    *(void *)(v2 + 64) = 0;
  }
  CFStringRef v4 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = 0;

  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(v5 + 80);
  if (v6)
  {
    free(v6);
    *(void *)(v5 + 80) = 0;
  }
  v7 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = 0;
}

void __33__NWConcrete_nw_endpoint_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 216);
  if (v3)
  {
    nw_array_remove_all_objects((uint64_t)v3);
    uint64_t v2 = *(void *)(a1 + 32);
    v3 = *(void **)(v2 + 216);
  }
  *(void *)(v2 + 216) = 0;
}

void __52__NWConcrete_nw_endpoint_resolver_startWithHandler___block_invoke_2(uint64_t a1, unsigned int a2, void *a3)
{
  id v7 = a3;
  v6 = (id *)nw_endpoint_handler_copy_resolver(*(NWConcrete_nw_endpoint_handler **)(a1 + 32));
  objc_storeStrong(v6 + 12, a3);
  nw_endpoint_resolver_update(*(void **)(a1 + 32), *(void **)(a1 + 40), a2);
}

CFTypeRef __42__NWConcrete_nw_url_endpoint_copyEndpoint__block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 300) = 0;
  uint64_t v2 = *(const char **)(*(void *)(a1 + 40) + 248);
  if (!v2)
  {
    v11 = __nwlog_obj();
    os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    v12 = (void *)_os_log_send_and_compose_impl();

    CFTypeRef result = (CFTypeRef)__nwlog_abort((uint64_t)v12);
    if (result) {
      goto LABEL_28;
    }
    free(v12);
  }
  v3 = strdup(v2);
  if (!v3)
  {
    v13 = __nwlog_obj();
    os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    v14 = (void *)_os_log_send_and_compose_impl();

    CFTypeRef result = (CFTypeRef)__nwlog_abort((uint64_t)v14);
    if (result) {
      goto LABEL_28;
    }
    free(v14);
  }
  *(void *)(*(void *)(a1 + 32) + 248) = v3;
  CFStringRef v4 = *(const char **)(*(void *)(a1 + 40) + 256);
  if (!v4)
  {
    v15 = __nwlog_obj();
    os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    v16 = (void *)_os_log_send_and_compose_impl();

    CFTypeRef result = (CFTypeRef)__nwlog_abort((uint64_t)v16);
    if (result) {
      goto LABEL_28;
    }
    free(v16);
  }
  uint64_t v5 = strdup(v4);
  if (!v5)
  {
    v17 = __nwlog_obj();
    os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    v18 = (void *)_os_log_send_and_compose_impl();

    CFTypeRef result = (CFTypeRef)__nwlog_abort((uint64_t)v18);
    if (result) {
      goto LABEL_28;
    }
    free(v18);
  }
  *(void *)(*(void *)(a1 + 32) + 256) = v5;
  v6 = *(const char **)(*(void *)(a1 + 40) + 264);
  if (!v6)
  {
    v19 = __nwlog_obj();
    os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    v20 = (void *)_os_log_send_and_compose_impl();

    CFTypeRef result = (CFTypeRef)__nwlog_abort((uint64_t)v20);
    if (result) {
      goto LABEL_28;
    }
    free(v20);
  }
  id v7 = strdup(v6);
  if (!v7)
  {
    v21 = __nwlog_obj();
    os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    v22 = (void *)_os_log_send_and_compose_impl();

    CFTypeRef result = (CFTypeRef)__nwlog_abort((uint64_t)v22);
    if (result) {
      goto LABEL_28;
    }
    free(v22);
  }
  *(void *)(*(void *)(a1 + 32) + 264) = v7;
  v8 = *(char **)(*(void *)(a1 + 40) + 272);
  if (v8)
  {
    v8 = strdup(v8);
    if (!v8)
    {
      v23 = __nwlog_obj();
      os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
      v24 = (void *)_os_log_send_and_compose_impl();

      CFTypeRef result = (CFTypeRef)__nwlog_abort((uint64_t)v24);
      if (result) {
        goto LABEL_28;
      }
      free(v24);
      v8 = 0;
    }
  }
  *(void *)(*(void *)(a1 + 32) + 272) = v8;
  v9 = *(char **)(*(void *)(a1 + 40) + 280);
  if (!v9) {
    goto LABEL_11;
  }
  v9 = strdup(v9);
  if (v9) {
    goto LABEL_11;
  }
  v25 = __nwlog_obj();
  os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
  v26 = (void *)_os_log_send_and_compose_impl();

  CFTypeRef result = (CFTypeRef)__nwlog_abort((uint64_t)v26);
  if (!result)
  {
    free(v26);
    v9 = 0;
LABEL_11:
    *(void *)(*(void *)(a1 + 32) + 280) = v9;
    *(_WORD *)(*(void *)(a1 + 32) + 240) = *(_WORD *)(*(void *)(a1 + 40) + 240);
    *(unsigned char *)(*(void *)(a1 + 32) + 297) = *(unsigned char *)(*(void *)(a1 + 32) + 297) & 0xFE | *(unsigned char *)(*(void *)(a1 + 40) + 297) & 1;
    CFTypeRef result = CFRetain(*(CFTypeRef *)(*(void *)(a1 + 40) + 232));
    *(void *)(*(void *)(a1 + 32) + 232) = result;
    return result;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t __37__NWConcrete_nw_activity_description__block_invoke@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  std::ostringstream::basic_ostringstream[abi:nn180100]((uint64_t)v56);
  memset(out, 0, 37);
  if (!uuid_is_null((const unsigned __int8 *)(*(void *)(a1 + 32) + 8))) {
    uuid_unparse((const unsigned __int8 *)(*(void *)(a1 + 32) + 8), out);
  }
  v55 = 0;
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(void *)(v4 + 24))
  {
    asprintf(&v55, " (investigation %llu)", *(void *)(v4 + 24));
    uint64_t v4 = *(void *)(a1 + 32);
  }
  v54 = 0;
  uint64_t v5 = *(const char **)(v4 + 72);
  if (v5)
  {
    asprintf(&v54, " (underlying error \"%s\":%d)", v5, *(_DWORD *)(v4 + 128));
  }
  else
  {
    int v7 = *(_DWORD *)(v4 + 124);
    int v6 = *(_DWORD *)(v4 + 128);
    if (v7 | v6) {
      asprintf(&v54, " (underlying error %d:%d)", v7, v6);
    }
  }
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v56, (uint64_t)"<nw_activity ", 13);
  v8 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v8, (uint64_t)":", 1);
  v9 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v9, (uint64_t)" [", 2);
  if (uuid_is_null((const unsigned __int8 *)(*(void *)(a1 + 32) + 8))) {
    v10 = "No UUID";
  }
  else {
    v10 = out;
  }
  size_t v11 = strlen(v10);
  v12 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v9, (uint64_t)v10, v11);
  v13 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v12, (uint64_t)"]", 1);
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 140) & 2) != 0) {
    v14 = " (lightweight)";
  }
  else {
    v14 = "";
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 140) & 2) != 0) {
    uint64_t v15 = 14;
  }
  else {
    uint64_t v15 = 0;
  }
  v16 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v13, (uint64_t)v14, v15);
  if (*(unsigned char *)(*(void *)(a1 + 32) + 140)) {
    v17 = " (retry)";
  }
  else {
    v17 = "";
  }
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v16, (uint64_t)v17, 8 * (*(unsigned char *)(*(void *)(a1 + 32) + 140) & 1));
  BOOL is_global_parent = nw_activity_is_global_parent(*(void **)(a1 + 32));
  if (is_global_parent) {
    v19 = " (global parent)";
  }
  else {
    v19 = "";
  }
  if (is_global_parent) {
    uint64_t v20 = 16;
  }
  else {
    uint64_t v20 = 0;
  }
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v9, (uint64_t)v19, v20);
  v21 = *(void **)(*(void *)(a1 + 32) + 56);
  if (v21)
  {
    if (nw_activity_is_global_parent(v21)) {
      v22 = " (parent is global)";
    }
    else {
      v22 = "";
    }
  }
  else
  {
    v22 = "";
  }
  size_t v23 = strlen(v22);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v9, (uint64_t)v22, v23);
  int is_selected_for_reporting = nw_activity_is_selected_for_reporting(*(void **)(a1 + 32));
  if (is_selected_for_reporting) {
    v25 = " reported";
  }
  else {
    v25 = "";
  }
  if (is_selected_for_reporting) {
    uint64_t v26 = 9;
  }
  else {
    uint64_t v26 = 0;
  }
  v27 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v9, (uint64_t)v25, v26);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v27, (uint64_t)" (reporting strategy ", 21);
  uint64_t v28 = *(unsigned int *)(*(void *)(a1 + 32) + 132);
  if (v28 > 3) {
    v29 = "invalid";
  }
  else {
    v29 = off_1E52449E8[v28];
  }
  size_t v30 = strlen(v29);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v9, (uint64_t)v29, v30);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v9, (uint64_t)")", 1);
  if (v55) {
    v31 = v55;
  }
  else {
    v31 = "";
  }
  size_t v32 = strlen(v31);
  v33 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v9, (uint64_t)v31, v32);
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 140) & 8) != 0) {
    v34 = " complete (reason ";
  }
  else {
    v34 = "";
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 140) & 8) != 0) {
    uint64_t v35 = 18;
  }
  else {
    uint64_t v35 = 0;
  }
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v33, (uint64_t)v34, v35);
  uint64_t v36 = *(void *)(a1 + 32);
  v37 = "";
  if ((*(unsigned char *)(v36 + 140) & 8) != 0)
  {
    unsigned int v38 = *(_DWORD *)(v36 + 136) - 1;
    if (v38 > 3) {
      v37 = "invalid";
    }
    else {
      v37 = off_1E5246030[v38];
    }
  }
  size_t v39 = strlen(v37);
  v40 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v9, (uint64_t)v37, v39);
  unint64_t v41 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 140);
  if ((v41 & 8) != 0) {
    v42 = ")";
  }
  else {
    v42 = "";
  }
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v40, (uint64_t)v42, (v41 >> 3) & 1);
  if (v54) {
    v43 = v54;
  }
  else {
    v43 = "";
  }
  size_t v44 = strlen(v43);
  v45 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v9, (uint64_t)v43, v44);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v45, (uint64_t)">", 1);
  if (v21) {

  }
  if (v55)
  {
    free(v55);
    v55 = 0;
  }
  if (v54)
  {
    free(v54);
    v54 = 0;
  }
  if ((v63 & 0x10) != 0)
  {
    unint64_t v47 = v62;
    if (v62 < v59)
    {
      unint64_t v62 = v59;
      unint64_t v47 = v59;
    }
    v48 = (const void **)&v58;
  }
  else
  {
    if ((v63 & 8) == 0)
    {
      size_t v46 = 0;
      a2[23] = 0;
      goto LABEL_81;
    }
    v48 = (const void **)v57;
    unint64_t v47 = v57[2];
  }
  v49 = *v48;
  size_t v46 = v47 - (void)*v48;
  if (v46 >= 0x7FFFFFFFFFFFFFF8) {
    abort();
  }
  if (v46 >= 0x17)
  {
    uint64_t v50 = (v46 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v46 | 7) != 0x17) {
      uint64_t v50 = v46 | 7;
    }
    uint64_t v51 = v50 + 1;
    v52 = operator new(v50 + 1);
    *((void *)a2 + 1) = v46;
    *((void *)a2 + 2) = v51 | 0x8000000000000000;
    *(void *)a2 = v52;
    a2 = v52;
    goto LABEL_80;
  }
  a2[23] = v46;
  if (v46) {
LABEL_80:
  }
    memmove(a2, v49, v46);
LABEL_81:
  a2[v46] = 0;
  v56[0] = *MEMORY[0x1E4FBA418];
  *(void *)((char *)v56 + *(void *)(v56[0] - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
  v56[1] = MEMORY[0x1E4FBA470] + 16;
  if (v61 < 0) {
    operator delete(__p);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x185316200](&v64);
}

void __35__NWConcrete_nw_path_copyWithZone___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), *(id *)(*(void *)(a1 + 40) + 16));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(*(void *)(a1 + 40) + 24));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(*(void *)(a1 + 40) + 32));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(*(void *)(a1 + 40) + 40));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), *(id *)(*(void *)(a1 + 40) + 48));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), *(id *)(*(void *)(a1 + 40) + 56));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), *(id *)(*(void *)(a1 + 40) + 64));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 72), *(id *)(*(void *)(a1 + 40) + 72));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 80), *(id *)(*(void *)(a1 + 40) + 80));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 88), *(id *)(*(void *)(a1 + 40) + 88));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 96), *(id *)(*(void *)(a1 + 40) + 96));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 104), *(id *)(*(void *)(a1 + 40) + 104));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 112), *(id *)(*(void *)(a1 + 40) + 112));
  *(_OWORD *)(*(void *)(a1 + 32) + 120) = *(_OWORD *)(*(void *)(a1 + 40) + 120);
  *(_OWORD *)(*(void *)(a1 + 32) + 136) = *(_OWORD *)(*(void *)(a1 + 40) + 136);
  *(_OWORD *)(*(void *)(a1 + 32) + 152) = *(_OWORD *)(*(void *)(a1 + 40) + 152);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 168), *(id *)(*(void *)(a1 + 40) + 168));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 176), *(id *)(*(void *)(a1 + 40) + 176));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 184), *(id *)(*(void *)(a1 + 40) + 184));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 208), *(id *)(*(void *)(a1 + 40) + 208));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 216), *(id *)(*(void *)(a1 + 40) + 216));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 224), *(id *)(*(void *)(a1 + 40) + 224));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 232), *(id *)(*(void *)(a1 + 40) + 232));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 240), *(id *)(*(void *)(a1 + 40) + 240));
  uint64_t v2 = *(char **)(*(void *)(a1 + 40) + 248);
  if (v2)
  {
    uint64_t v2 = strdup(v2);
    if (!v2)
    {
      v25 = __nwlog_obj();
      os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
      uint64_t v26 = (void *)_os_log_send_and_compose_impl();

      if (__nwlog_abort((uint64_t)v26)) {
        goto LABEL_22;
      }
      free(v26);
      uint64_t v2 = 0;
    }
  }
  *(void *)(*(void *)(a1 + 32) + 248) = v2;
  v3 = (_OWORD *)(*(void *)(a1 + 40) + 264);
  uint64_t v4 = (_OWORD *)(*(void *)(a1 + 32) + 264);
  long long v5 = *(_OWORD *)(*(void *)(a1 + 40) + 344);
  long long v7 = *(_OWORD *)(*(void *)(a1 + 40) + 296);
  long long v6 = *(_OWORD *)(*(void *)(a1 + 40) + 312);
  v4[4] = *(_OWORD *)(*(void *)(a1 + 40) + 328);
  v4[5] = v5;
  v4[2] = v7;
  v4[3] = v6;
  long long v8 = v3[1];
  _OWORD *v4 = *v3;
  v4[1] = v8;
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(unsigned int *)(v9 + 348);
  if (v10 && *(void *)(v9 + 296))
  {
    size_t v11 = malloc_type_malloc(20 * v10, 0xF2B69DE5uLL);
    if (!v11)
    {
      v27 = __nwlog_obj();
      os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
      uint64_t v28 = (void *)_os_log_send_and_compose_impl();

      if (__nwlog_abort((uint64_t)v28)) {
        goto LABEL_22;
      }
      free(v28);
    }
    *(void *)(*(void *)(a1 + 32) + 296) = v11;
    memcpy(*(void **)(*(void *)(a1 + 32) + 296), *(const void **)(*(void *)(a1 + 40) + 296), 20 * *(unsigned int *)(*(void *)(a1 + 40) + 348));
    uint64_t v9 = *(void *)(a1 + 40);
  }
  uint64_t v12 = *(unsigned int *)(v9 + 344);
  if (!v12 || !*(void *)(v9 + 304)) {
    goto LABEL_11;
  }
  v13 = malloc_type_malloc(24 * v12, 0xF2B69DE5uLL);
  if (!v13)
  {
    v29 = __nwlog_obj();
    os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    size_t v30 = (void *)_os_log_send_and_compose_impl();

    if (!__nwlog_abort((uint64_t)v30))
    {
      free(v30);
      goto LABEL_10;
    }
LABEL_22:
    __break(1u);
    return;
  }
LABEL_10:
  *(void *)(*(void *)(a1 + 32) + 304) = v13;
  memcpy(*(void **)(*(void *)(a1 + 32) + 304), *(const void **)(*(void *)(a1 + 40) + 304), 24 * *(unsigned int *)(*(void *)(a1 + 40) + 344));
  uint64_t v9 = *(void *)(a1 + 40);
LABEL_11:
  *(_DWORD *)(*(void *)(a1 + 32) + 360) = *(_DWORD *)(v9 + 360);
  *(_DWORD *)(*(void *)(a1 + 32) + 364) = *(_DWORD *)(*(void *)(a1 + 40) + 364);
  *(_DWORD *)(*(void *)(a1 + 32) + 368) = *(_DWORD *)(*(void *)(a1 + 40) + 368);
  *(_DWORD *)(*(void *)(a1 + 32) + 372) = *(_DWORD *)(*(void *)(a1 + 40) + 372);
  *(_DWORD *)(*(void *)(a1 + 32) + 376) = *(_DWORD *)(*(void *)(a1 + 40) + 376);
  *(_DWORD *)(*(void *)(a1 + 32) + 380) = *(_DWORD *)(*(void *)(a1 + 40) + 380);
  *(_WORD *)(*(void *)(a1 + 32) + 384) = *(_WORD *)(*(void *)(a1 + 40) + 384);
  *(unsigned char *)(*(void *)(a1 + 32) + 386) = *(unsigned char *)(*(void *)(a1 + 40) + 386);
  *(_WORD *)(*(void *)(a1 + 32) + 387) = *(_WORD *)(*(void *)(a1 + 40) + 387);
  v14 = (_OWORD *)(*(void *)(a1 + 32) + 392);
  uint64_t v15 = (_OWORD *)(*(void *)(a1 + 40) + 392);
  long long v16 = *(_OWORD *)(*(void *)(a1 + 40) + 456);
  long long v18 = *(_OWORD *)(*(void *)(a1 + 40) + 408);
  long long v17 = *(_OWORD *)(*(void *)(a1 + 40) + 424);
  v14[3] = *(_OWORD *)(*(void *)(a1 + 40) + 440);
  v14[4] = v16;
  v14[1] = v18;
  v14[2] = v17;
  _OWORD *v14 = *v15;
  uint64_t v19 = *(void *)(a1 + 40);
  uint64_t v20 = *(void *)(v19 + 200);
  if (v20)
  {
    uint64_t v21 = nw_array_create();
    if (v21 != v20)
    {
      uint64_t v22 = v21;
      std::vector<nw_object_wrapper_t>::__assign_with_size[abi:nn180100]<nw_object_wrapper_t*,nw_object_wrapper_t*>(v21 + 16, *(void ***)(v20 + 16), *(void ***)(v20 + 24), (uint64_t)(*(void *)(v20 + 24) - *(void *)(v20 + 16)) >> 3);
      uint64_t v20 = v22;
    }
    uint64_t v23 = *(void *)(a1 + 32);
    v24 = *(void **)(v23 + 200);
    *(void *)(v23 + 200) = v20;

    uint64_t v19 = *(void *)(a1 + 40);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 472) = *(unsigned char *)(v19 + 472);
  *(unsigned char *)(*(void *)(a1 + 32) + 473) = *(unsigned char *)(*(void *)(a1 + 32) + 473) & 0xFE | *(unsigned char *)(*(void *)(a1 + 40) + 473) & 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 473) = *(unsigned char *)(*(void *)(a1 + 32) + 473) & 0xFD | *(unsigned char *)(*(void *)(a1 + 40) + 473) & 2;
  *(unsigned char *)(*(void *)(a1 + 32) + 473) = *(unsigned char *)(*(void *)(a1 + 32) + 473) & 0xFB | *(unsigned char *)(*(void *)(a1 + 40) + 473) & 4;
  *(unsigned char *)(*(void *)(a1 + 32) + 473) = *(unsigned char *)(*(void *)(a1 + 32) + 473) & 0xF7 | *(unsigned char *)(*(void *)(a1 + 40) + 473) & 8;
  *(unsigned char *)(*(void *)(a1 + 32) + 473) = *(unsigned char *)(*(void *)(a1 + 32) + 473) & 0xEF | *(unsigned char *)(*(void *)(a1 + 40) + 473) & 0x10;
  *(unsigned char *)(*(void *)(a1 + 32) + 473) = *(unsigned char *)(*(void *)(a1 + 32) + 473) & 0xDF | *(unsigned char *)(*(void *)(a1 + 40) + 473) & 0x20;
  *(unsigned char *)(*(void *)(a1 + 32) + 473) = *(unsigned char *)(*(void *)(a1 + 32) + 473) & 0xBF | *(unsigned char *)(*(void *)(a1 + 40) + 473) & 0x40;
  *(unsigned char *)(*(void *)(a1 + 32) + 473) = *(unsigned char *)(*(void *)(a1 + 40) + 473) & 0x80 | *(unsigned char *)(*(void *)(a1 + 32) + 473) & 0x7F;
  *(unsigned char *)(*(void *)(a1 + 32) + 474) = *(unsigned char *)(*(void *)(a1 + 32) + 474) & 0xFE | *(unsigned char *)(*(void *)(a1 + 40) + 474) & 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 474) = *(unsigned char *)(*(void *)(a1 + 32) + 474) & 0xFD | *(unsigned char *)(*(void *)(a1 + 40) + 474) & 2;
  *(unsigned char *)(*(void *)(a1 + 32) + 474) = *(unsigned char *)(*(void *)(a1 + 32) + 474) & 0xFB | *(unsigned char *)(*(void *)(a1 + 40) + 474) & 4;
  *(unsigned char *)(*(void *)(a1 + 32) + 474) = *(unsigned char *)(*(void *)(a1 + 32) + 474) & 0xF7 | *(unsigned char *)(*(void *)(a1 + 40) + 474) & 8;
  *(unsigned char *)(*(void *)(a1 + 32) + 474) = *(unsigned char *)(*(void *)(a1 + 32) + 474) & 0xEF | *(unsigned char *)(*(void *)(a1 + 40) + 474) & 0x10;
  *(unsigned char *)(*(void *)(a1 + 32) + 474) = *(unsigned char *)(*(void *)(a1 + 32) + 474) & 0xDF | *(unsigned char *)(*(void *)(a1 + 40) + 474) & 0x20;
  *(unsigned char *)(*(void *)(a1 + 32) + 474) = *(unsigned char *)(*(void *)(a1 + 32) + 474) & 0xBF | *(unsigned char *)(*(void *)(a1 + 40) + 474) & 0x40;
  *(unsigned char *)(*(void *)(a1 + 32) + 474) = *(unsigned char *)(*(void *)(a1 + 40) + 474) & 0x80 | *(unsigned char *)(*(void *)(a1 + 32) + 474) & 0x7F;
  *(unsigned char *)(*(void *)(a1 + 32) + 475) = *(unsigned char *)(*(void *)(a1 + 32) + 475) & 0xFE | *(unsigned char *)(*(void *)(a1 + 40) + 475) & 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 475) = *(unsigned char *)(*(void *)(a1 + 32) + 475) & 0xFD | *(unsigned char *)(*(void *)(a1 + 40) + 475) & 2;
  *(unsigned char *)(*(void *)(a1 + 32) + 475) = *(unsigned char *)(*(void *)(a1 + 32) + 475) & 0xFB | *(unsigned char *)(*(void *)(a1 + 40) + 475) & 4;
  *(unsigned char *)(*(void *)(a1 + 32) + 475) = *(unsigned char *)(*(void *)(a1 + 32) + 475) & 0xF7 | *(unsigned char *)(*(void *)(a1 + 40) + 475) & 8;
  *(unsigned char *)(*(void *)(a1 + 32) + 475) = *(unsigned char *)(*(void *)(a1 + 32) + 475) & 0xEF | *(unsigned char *)(*(void *)(a1 + 40) + 475) & 0x10;
  *(unsigned char *)(*(void *)(a1 + 32) + 475) = *(unsigned char *)(*(void *)(a1 + 32) + 475) & 0xDF | *(unsigned char *)(*(void *)(a1 + 40) + 475) & 0x20;
  *(unsigned char *)(*(void *)(a1 + 32) + 475) = *(unsigned char *)(*(void *)(a1 + 32) + 475) & 0xBF | *(unsigned char *)(*(void *)(a1 + 40) + 475) & 0x40;
  *(unsigned char *)(*(void *)(a1 + 32) + 475) = *(unsigned char *)(*(void *)(a1 + 40) + 475) & 0x80 | *(unsigned char *)(*(void *)(a1 + 32) + 475) & 0x7F;
  *(unsigned char *)(*(void *)(a1 + 32) + 476) = *(unsigned char *)(*(void *)(a1 + 32) + 476) & 0xFE | *(unsigned char *)(*(void *)(a1 + 40) + 476) & 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 476) = *(unsigned char *)(*(void *)(a1 + 32) + 476) & 0xFD | *(unsigned char *)(*(void *)(a1 + 40) + 476) & 2;
  *(unsigned char *)(*(void *)(a1 + 32) + 476) = *(unsigned char *)(*(void *)(a1 + 32) + 476) & 0xFB | *(unsigned char *)(*(void *)(a1 + 40) + 476) & 4;
  *(unsigned char *)(*(void *)(a1 + 32) + 476) = *(unsigned char *)(*(void *)(a1 + 32) + 476) & 0xF7 | *(unsigned char *)(*(void *)(a1 + 40) + 476) & 8;
  *(unsigned char *)(*(void *)(a1 + 32) + 476) = *(unsigned char *)(*(void *)(a1 + 32) + 476) & 0xEF | *(unsigned char *)(*(void *)(a1 + 40) + 476) & 0x10;
  *(unsigned char *)(*(void *)(a1 + 32) + 476) = *(unsigned char *)(*(void *)(a1 + 32) + 476) & 0xDF | *(unsigned char *)(*(void *)(a1 + 40) + 476) & 0x20;
  *(unsigned char *)(*(void *)(a1 + 32) + 476) = *(unsigned char *)(*(void *)(a1 + 32) + 476) & 0xBF | *(unsigned char *)(*(void *)(a1 + 40) + 476) & 0x40;
}

void __45__NWConcrete_nw_endpoint_redactedDescription__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (!v2[9])
  {
    v3 = (const char *)v2[10];
    if (v3
      || (*(void *)(*(void *)(a1 + 32) + 80) = [v2 createDescription:1],
          uint64_t v2 = *(void **)(a1 + 32),
          (v3 = (const char *)v2[10]) != 0))
    {
      CFStringRef v4 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v3, 0x8000100u);
      uint64_t v5 = *(void *)(a1 + 32);
      long long v6 = *(void **)(v5 + 72);
      *(void *)(v5 + 72) = v4;

      uint64_t v2 = *(void **)(a1 + 32);
    }
  }
  long long v7 = (void *)v2[9];
  long long v8 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v8, v7);
}

void __41__NWConcrete_nw_listener_getPeerDeviceID__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(const char **)(*(void *)(a1 + 32) + 232);
  if (v2)
  {
    v3 = strdup(v2);
    if (!v3)
    {
      CFStringRef v4 = __nwlog_obj();
      os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
      uint64_t v5 = (void *)_os_log_send_and_compose_impl();

      if (__nwlog_abort((uint64_t)v5))
      {
        __break(1u);
        return;
      }
      free(v5);
    }
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  }
}

void __36__NWConcrete_nw_association_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(char **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__NWConcrete_nw_association_dealloc__block_invoke_2;
  v6[3] = &unk_1E524AEB8;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v7 = v3;
  uint64_t v8 = v4;
  nw_hash_table_apply(v2, (uint64_t)v6);
  uint64_t v5 = *(os_unfair_lock_s **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v5)
  {
    _nw_hash_table_release(v5);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

uint64_t __49__NWConcrete_nw_listener_canHandleNewConnection___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 104) == 0;
  return result;
}

void __59__NWConcrete_nw_listener_updateParametersForNewConnection___block_invoke(uint64_t a1)
{
}

uint64_t __67__NWConcrete_nw_resolver_initWithEndpoint_parameters_path_log_str___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  int v5 = nw_resolver_config_get_class(v4);
  if (v5)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    int v7 = *(_DWORD *)(v6 + 24);
    if (v7) {
      BOOL v8 = v5 < v7;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      *(_DWORD *)(v6 + 24) = v5;
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    }
  }

  return 1;
}

void __57__NWConcrete_nw_listener_handleInbound_addProtocolInbox___block_invoke_43(void *a1)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = (*(unsigned char *)(a1[4] + 302) & 4) != 0;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), *(id *)(a1[4] + 64));
  uint64_t v2 = _Block_copy(*(const void **)(a1[4] + 88));
  uint64_t v3 = *(void *)(a1[7] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  int v5 = _Block_copy(*(const void **)(a1[4] + 96));
  uint64_t v6 = *(void *)(a1[8] + 8);
  int v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  id v8 = *(id *)(a1[4] + 16);
  BOOL v9 = -[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]((id *)[NWConcrete_nw_parameters alloc], v8, 0, 0);

  uint64_t v10 = *(void *)(a1[9] + 8);
  size_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

void __57__NWConcrete_nw_listener_handleInbound_addProtocolInbox___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(_DWORD *)(v1 + 104);
  if (v2 != -1)
  {
    if (v2)
    {
      *(_DWORD *)(v1 + 104) = v2 - 1;
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 16);
      if (v11 && !nw_path_parameters_get_logging_disabled(*(void *)(v11 + 104)))
      {
        if (__nwlog_listener_log::onceToken != -1) {
          dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_40_44887);
        }
        int v5 = (id)glistenerLogObj;
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
          goto LABEL_16;
        }
        id_string = nw_listener_get_id_string(*(void **)(a1 + 32));
        int v13 = *(_DWORD *)(*(void *)(a1 + 32) + 104);
        int v14 = 136446722;
        uint64_t v15 = "-[NWConcrete_nw_listener handleInbound:addProtocolInbox:]_block_invoke";
        __int16 v16 = 2082;
        long long v17 = id_string;
        __int16 v18 = 1024;
        int v19 = v13;
        int v7 = "%{public}s [%{public}s] New connection limit is %u";
        id v8 = v5;
        os_log_type_t v9 = OS_LOG_TYPE_INFO;
        uint32_t v10 = 28;
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v4 = *(void *)(v1 + 16);
      if (v4 && !nw_path_parameters_get_logging_disabled(*(void *)(v4 + 104)))
      {
        if (__nwlog_listener_log::onceToken != -1) {
          dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_40_44887);
        }
        int v5 = (id)glistenerLogObj;
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          goto LABEL_16;
        }
        uint64_t v6 = nw_listener_get_id_string(*(void **)(a1 + 32));
        int v14 = 136446466;
        uint64_t v15 = "-[NWConcrete_nw_listener handleInbound:addProtocolInbox:]_block_invoke";
        __int16 v16 = 2082;
        long long v17 = v6;
        int v7 = "%{public}s [%{public}s] Unexpected connection notification";
        id v8 = v5;
        os_log_type_t v9 = OS_LOG_TYPE_ERROR;
        uint32_t v10 = 22;
LABEL_15:
        _os_log_impl(&dword_1830D4000, v8, v9, v7, (uint8_t *)&v14, v10);
LABEL_16:
      }
    }
  }
}

uint64_t __57__NWConcrete_nw_listener_handleInbound_addProtocolInbox___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 16))();
}

void __52__NWConcrete_nw_endpoint_resolver_startWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v164 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = nw_endpoint_handler_copy_resolver(*(NWConcrete_nw_endpoint_handler **)(a1 + 32));
  id v8 = *(void **)(a1 + 32);
  os_log_type_t v9 = (void *)*((void *)v7 + 1);
  id v10 = v8;
  id v141 = v9;
  id v142 = v5;
  id v143 = v6;
  v139 = v7;
  v140 = v10;
  if (!v10)
  {
    v99 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v147 = "nw_endpoint_resolver_handle_alternative";
    v100 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v144 = 0;
    if (__nwlog_fault(v100, &type, &v144))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        v101 = __nwlog_obj();
        os_log_type_t v102 = type;
        if (os_log_type_enabled(v101, type))
        {
          *(_DWORD *)buf = 136446210;
          v147 = "nw_endpoint_resolver_handle_alternative";
          _os_log_impl(&dword_1830D4000, v101, v102, "%{public}s called with null handler", buf, 0xCu);
        }
      }
      else if (v144)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        v101 = __nwlog_obj();
        os_log_type_t v104 = type;
        BOOL v105 = os_log_type_enabled(v101, type);
        if (backtrace_string)
        {
          if (v105)
          {
            *(_DWORD *)buf = 136446466;
            v147 = "nw_endpoint_resolver_handle_alternative";
            __int16 v148 = 2082;
            id_str = backtrace_string;
            _os_log_impl(&dword_1830D4000, v101, v104, "%{public}s called with null handler, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_133;
        }
        if (v105)
        {
          *(_DWORD *)buf = 136446210;
          v147 = "nw_endpoint_resolver_handle_alternative";
          _os_log_impl(&dword_1830D4000, v101, v104, "%{public}s called with null handler, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        v101 = __nwlog_obj();
        os_log_type_t v127 = type;
        if (os_log_type_enabled(v101, type))
        {
          *(_DWORD *)buf = 136446210;
          v147 = "nw_endpoint_resolver_handle_alternative";
          _os_log_impl(&dword_1830D4000, v101, v127, "%{public}s called with null handler, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_133:
    if (v100) {
      free(v100);
    }
    goto LABEL_95;
  }
  uint64_t v11 = (unsigned int *)v10;
  uint64_t v12 = v11[29];

  if (v12 != 1)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v27 = (id)gLogObj;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      if (v12 > 5) {
        uint64_t v28 = "unknown-mode";
      }
      else {
        uint64_t v28 = off_1E523FB08[v12];
      }
      *(_DWORD *)buf = 136446722;
      v147 = "nw_endpoint_resolver_handle_alternative";
      __int16 v148 = 2082;
      id_str = (char *)v28;
      __int16 v150 = 2082;
      v151 = "resolver";
      _os_log_impl(&dword_1830D4000, v27, OS_LOG_TYPE_DEFAULT, "%{public}s Handler is in mode %{public}s, expected %{public}s", buf, 0x20u);
    }

    goto LABEL_95;
  }
  int minimize_logging = nw_endpoint_handler_get_minimize_logging(v11);
  if (v143)
  {
    if (!minimize_logging)
    {
      int v14 = v11;
      char v15 = *((unsigned char *)v14 + 268);

      if ((v15 & 0x20) != 0) {
        goto LABEL_49;
      }
      if (__nwlog_connection_log::onceToken != -1) {
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
      }
      __int16 v16 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        log = v16;
        long long v17 = v14;

        __int16 v18 = v17;
        char v19 = *((unsigned char *)v14 + 268);

        if (v19) {
          uint64_t v20 = "dry-run ";
        }
        else {
          uint64_t v20 = "";
        }
        nw_endpoint_t v21 = nw_endpoint_handler_copy_endpoint(v18);
        logging_description = nw_endpoint_get_logging_description(v21);
        uint64_t v23 = v18;
        v24 = v23;
        uint64_t v25 = v23[30];
        if (v25 > 5) {
          uint64_t v26 = "unknown-state";
        }
        else {
          uint64_t v26 = off_1E523FB38[v25];
        }

        v40 = v24;
        unint64_t v41 = v40;
        v42 = "path";
        switch(v11[29])
        {
          case 0u:
            break;
          case 1u:
            v42 = "resolver";
            break;
          case 2u:
            v42 = nw_endpoint_flow_mode_string(v40[31]);
            break;
          case 3u:
            v42 = "proxy";
            break;
          case 4u:
            v42 = "fallback";
            break;
          case 5u:
            v42 = "transform";
            break;
          default:
            v42 = "unknown-mode";
            break;
        }

        size_t v46 = v41;
        os_unfair_lock_lock((os_unfair_lock_t)v46 + 28);
        id v47 = v46[8];
        os_unfair_lock_unlock((os_unfair_lock_t)v46 + 28);

        id v48 = v47;
        *(_DWORD *)buf = 136448258;
        v147 = "nw_endpoint_resolver_handle_alternative";
        __int16 v148 = 2082;
        id_str = (char *)(v17 + 42);
        __int16 v150 = 2082;
        v151 = v20;
        __int16 v152 = 2082;
        v153 = logging_description;
        __int16 v154 = 2082;
        v155 = v26;
        __int16 v156 = 2082;
        v157 = v42;
        __int16 v158 = 2114;
        id v159 = v48;
        __int16 v160 = 2082;
        v161 = nw_endpoint_get_logging_description(v142);
        __int16 v162 = 2112;
        id v163 = v143;
        __int16 v16 = log;
        _os_log_impl(&dword_1830D4000, log, OS_LOG_TYPE_INFO, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Discovered alternative %{public}s using %@", buf, 0x5Cu);
      }
      goto LABEL_48;
    }
    if ((nw_endpoint_handler_get_logging_disabled(v11) & 1) == 0)
    {
      if (__nwlog_connection_log::onceToken != -1) {
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
      }
      __int16 v16 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        id_string = nw_endpoint_handler_get_id_string(v11);
        v107 = nw_endpoint_handler_dry_run_string(v11);
        nw_endpoint_t v108 = nw_endpoint_handler_copy_endpoint(v11);
        v109 = nw_endpoint_get_logging_description(v108);
        v110 = nw_endpoint_handler_state_string(v11);
        v111 = nw_endpoint_handler_mode_string(v11);
        id v112 = nw_endpoint_handler_copy_current_path(v11);
        *(_DWORD *)buf = 136448258;
        v147 = "nw_endpoint_resolver_handle_alternative";
        __int16 v148 = 2082;
        id_str = (char *)id_string;
        __int16 v150 = 2082;
        v151 = v107;
        __int16 v152 = 2082;
        v153 = v109;
        __int16 v154 = 2082;
        v155 = v110;
        __int16 v156 = 2082;
        v157 = v111;
        __int16 v158 = 2114;
        id v159 = v112;
        __int16 v160 = 2082;
        v161 = nw_endpoint_get_logging_description(v142);
        __int16 v162 = 2112;
        id v163 = v143;
        _os_log_impl(&dword_1830D4000, v16, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Discovered alternative %{public}s using %@", buf, 0x5Cu);
      }
LABEL_48:
    }
  }
  else
  {
    if (!minimize_logging)
    {
      v29 = v11;
      char v30 = *((unsigned char *)v29 + 268);

      if ((v30 & 0x20) != 0) {
        goto LABEL_49;
      }
      if (__nwlog_connection_log::onceToken != -1) {
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
      }
      __int16 v16 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v31 = v29;

        size_t v32 = v31;
        char v33 = *((unsigned char *)v29 + 268);

        if (v33) {
          v34 = "dry-run ";
        }
        else {
          v34 = "";
        }
        os_log_t loga = nw_endpoint_handler_copy_endpoint(v32);
        uint64_t v35 = nw_endpoint_get_logging_description(loga);
        uint64_t v36 = v32;
        v37 = v36;
        uint64_t v38 = v36[30];
        if (v38 > 5) {
          size_t v39 = "unknown-state";
        }
        else {
          size_t v39 = off_1E523FB38[v38];
        }

        v43 = v37;
        size_t v44 = v43;
        v45 = "path";
        switch(v11[29])
        {
          case 0u:
            break;
          case 1u:
            v45 = "resolver";
            break;
          case 2u:
            v45 = nw_endpoint_flow_mode_string(v43[31]);
            break;
          case 3u:
            v45 = "proxy";
            break;
          case 4u:
            v45 = "fallback";
            break;
          case 5u:
            v45 = "transform";
            break;
          default:
            v45 = "unknown-mode";
            break;
        }

        v49 = v44;
        os_unfair_lock_lock((os_unfair_lock_t)v49 + 28);
        id v50 = v49[8];
        os_unfair_lock_unlock((os_unfair_lock_t)v49 + 28);

        id v51 = v50;
        *(_DWORD *)buf = 136448002;
        v147 = "nw_endpoint_resolver_handle_alternative";
        __int16 v148 = 2082;
        id_str = (char *)(v31 + 42);
        __int16 v150 = 2082;
        v151 = v34;
        __int16 v152 = 2082;
        v153 = v35;
        __int16 v154 = 2082;
        v155 = v39;
        __int16 v156 = 2082;
        v157 = v45;
        __int16 v158 = 2114;
        id v159 = v51;
        __int16 v160 = 2082;
        v161 = nw_endpoint_get_logging_description(v142);
        _os_log_impl(&dword_1830D4000, v16, OS_LOG_TYPE_INFO, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Discovered alternative %{public}s", buf, 0x52u);
      }
      goto LABEL_48;
    }
    if ((nw_endpoint_handler_get_logging_disabled(v11) & 1) == 0)
    {
      if (__nwlog_connection_log::onceToken != -1) {
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
      }
      __int16 v16 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v120 = nw_endpoint_handler_get_id_string(v11);
        v121 = nw_endpoint_handler_dry_run_string(v11);
        nw_endpoint_t v122 = nw_endpoint_handler_copy_endpoint(v11);
        v123 = nw_endpoint_get_logging_description(v122);
        v124 = nw_endpoint_handler_state_string(v11);
        v125 = nw_endpoint_handler_mode_string(v11);
        id v126 = nw_endpoint_handler_copy_current_path(v11);
        *(_DWORD *)buf = 136448002;
        v147 = "nw_endpoint_resolver_handle_alternative";
        __int16 v148 = 2082;
        id_str = (char *)v120;
        __int16 v150 = 2082;
        v151 = v121;
        __int16 v152 = 2082;
        v153 = v123;
        __int16 v154 = 2082;
        v155 = v124;
        __int16 v156 = 2082;
        v157 = v125;
        __int16 v158 = 2114;
        id v159 = v126;
        __int16 v160 = 2082;
        v161 = nw_endpoint_get_logging_description(v142);
        _os_log_impl(&dword_1830D4000, v16, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Discovered alternative %{public}s", buf, 0x52u);
      }
      goto LABEL_48;
    }
  }
LABEL_49:
  v52 = v11;
  int state = v52->state;

  if ((state & 0xFFFFFFFE) != 4)
  {
    v67 = nw_endpoint_handler_copy_resolver(v52);
    v68 = v67;
    if (*((id *)v67 + 1) == v141)
    {
      v81 = (void *)*((void *)v67 + 13);
      if (!v81)
      {
        nw_endpoint_t v82 = nw_endpoint_handler_copy_endpoint(v52);
        v83 = nw_endpoint_copy(v82);
        v84 = (void *)*((void *)v68 + 13);
        *((void *)v68 + 13) = v83;

        v81 = (void *)*((void *)v68 + 13);
      }
      nw_endpoint_add_alternative(v81, v142, v143);
      v52->event = (nw_endpoint_handler_event_s)524290;
      nw_endpoint_handler_report(v52, 0, &v52->event.domain, 0);
      goto LABEL_94;
    }
    if (nw_endpoint_handler_get_minimize_logging(v52))
    {
      if (nw_endpoint_handler_get_logging_disabled(v52)) {
        goto LABEL_94;
      }
      if (__nwlog_connection_log::onceToken != -1) {
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
      }
      v71 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
      {
        v128 = nw_endpoint_handler_get_id_string(v52);
        v129 = nw_endpoint_handler_dry_run_string(v52);
        nw_endpoint_t v130 = nw_endpoint_handler_copy_endpoint(v52);
        v131 = nw_endpoint_get_logging_description(v130);
        v132 = nw_endpoint_handler_state_string(v52);
        v133 = nw_endpoint_handler_mode_string(v52);
        id v134 = nw_endpoint_handler_copy_current_path(v52);
        v135 = (const char *)*((void *)v68 + 1);
        *(_DWORD *)buf = 136448258;
        v147 = "nw_endpoint_resolver_handle_alternative";
        __int16 v148 = 2082;
        id_str = (char *)v128;
        __int16 v150 = 2082;
        v151 = v129;
        __int16 v152 = 2082;
        v153 = v131;
        __int16 v154 = 2082;
        v155 = v132;
        __int16 v156 = 2082;
        v157 = v133;
        __int16 v158 = 2114;
        id v159 = v134;
        __int16 v160 = 2048;
        v161 = v135;
        __int16 v162 = 2048;
        id v163 = v141;
        _os_log_impl(&dword_1830D4000, v71, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] ignoring update from old resolver object (%p != %p)", buf, 0x5Cu);
      }
    }
    else
    {
      v69 = v52;
      BOOL v70 = (*((unsigned char *)v69 + 268) & 0x20) == 0;

      if (!v70)
      {
LABEL_94:

        goto LABEL_95;
      }
      if (__nwlog_connection_log::onceToken != -1) {
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
      }
      v71 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        v72 = v69;

        v73 = v72;
        BOOL v74 = (*((unsigned char *)v69 + 268) & 1) == 0;

        if (v74) {
          v75 = "";
        }
        else {
          v75 = "dry-run ";
        }
        nw_endpoint_t v76 = nw_endpoint_handler_copy_endpoint(v73);
        v138 = nw_endpoint_get_logging_description(v76);
        v77 = v73;
        v78 = v77;
        uint64_t v79 = v52->state;
        if (v79 > 5) {
          v80 = "unknown-state";
        }
        else {
          v80 = off_1E523FB38[v79];
        }

        v89 = v78;
        v90 = v89;
        unsigned int v91 = v11[29];
        v92 = "path";
        switch(v91)
        {
          case 0u:
            break;
          case 1u:
            v92 = "resolver";
            break;
          case 2u:
            v92 = nw_endpoint_flow_mode_string(v89[31]);
            break;
          case 3u:
            v92 = "proxy";
            break;
          case 4u:
            v92 = "fallback";
            break;
          case 5u:
            v92 = "transform";
            break;
          default:
            v92 = "unknown-mode";
            break;
        }

        nw_endpoint_t v95 = v76;
        v96 = v90;
        os_unfair_lock_lock((os_unfair_lock_t)v96 + 28);
        id v97 = v96[8];
        os_unfair_lock_unlock((os_unfair_lock_t)v96 + 28);

        v98 = (const char *)*((void *)v68 + 1);
        *(_DWORD *)buf = 136448258;
        v147 = "nw_endpoint_resolver_handle_alternative";
        __int16 v148 = 2082;
        id_str = v72->id_str;
        __int16 v150 = 2082;
        v151 = v75;
        __int16 v152 = 2082;
        v153 = v138;
        __int16 v154 = 2082;
        v155 = v80;
        __int16 v156 = 2082;
        v157 = v92;
        __int16 v158 = 2114;
        id v159 = v97;
        __int16 v160 = 2048;
        v161 = v98;
        __int16 v162 = 2048;
        id v163 = v141;
        _os_log_impl(&dword_1830D4000, v71, OS_LOG_TYPE_DEFAULT, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] ignoring update from old resolver object (%p != %p)", buf, 0x5Cu);
      }
    }

    goto LABEL_94;
  }
  if (nw_endpoint_handler_get_minimize_logging(v52))
  {
    if (nw_endpoint_handler_get_logging_disabled(v52)) {
      goto LABEL_95;
    }
    if (__nwlog_connection_log::onceToken != -1) {
      dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
    }
    v56 = (id)gconnectionLogObj;
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    {
      v113 = nw_endpoint_handler_get_id_string(v52);
      v114 = nw_endpoint_handler_dry_run_string(v52);
      nw_endpoint_t v115 = nw_endpoint_handler_copy_endpoint(v52);
      v116 = nw_endpoint_get_logging_description(v115);
      v117 = nw_endpoint_handler_state_string(v52);
      v118 = nw_endpoint_handler_mode_string(v52);
      id v119 = nw_endpoint_handler_copy_current_path(v52);
      *(_DWORD *)buf = 136447746;
      v147 = "nw_endpoint_resolver_handle_alternative";
      __int16 v148 = 2082;
      id_str = (char *)v113;
      __int16 v150 = 2082;
      v151 = v114;
      __int16 v152 = 2082;
      v153 = v116;
      __int16 v154 = 2082;
      v155 = v117;
      __int16 v156 = 2082;
      v157 = v118;
      __int16 v158 = 2114;
      id v159 = v119;
      _os_log_impl(&dword_1830D4000, v56, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Ignoring resolver alternative", buf, 0x48u);
    }
    goto LABEL_86;
  }
  v54 = v52;
  BOOL v55 = (*((unsigned char *)v54 + 268) & 0x20) == 0;

  if (v55)
  {
    if (__nwlog_connection_log::onceToken != -1) {
      dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
    }
    v56 = (id)gconnectionLogObj;
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      v57 = v54;

      uint64_t v58 = v57;
      BOOL v59 = (*((unsigned char *)v54 + 268) & 1) == 0;

      if (v59) {
        v60 = "";
      }
      else {
        v60 = "dry-run ";
      }
      nw_endpoint_t v61 = nw_endpoint_handler_copy_endpoint(v58);
      unint64_t v62 = nw_endpoint_get_logging_description(v61);
      int v63 = v58;
      uint64_t v64 = v63;
      uint64_t v65 = v52->state;
      if (v65 > 5) {
        uint64_t v66 = "unknown-state";
      }
      else {
        uint64_t v66 = off_1E523FB38[v65];
      }

      v85 = v64;
      v86 = v85;
      unsigned int v87 = v11[29];
      v88 = "path";
      switch(v87)
      {
        case 0u:
          break;
        case 1u:
          v88 = "resolver";
          break;
        case 2u:
          v88 = nw_endpoint_flow_mode_string(v85[31]);
          break;
        case 3u:
          v88 = "proxy";
          break;
        case 4u:
          v88 = "fallback";
          break;
        case 5u:
          v88 = "transform";
          break;
        default:
          v88 = "unknown-mode";
          break;
      }

      v93 = v86;
      os_unfair_lock_lock((os_unfair_lock_t)v93 + 28);
      id v94 = v93[8];
      os_unfair_lock_unlock((os_unfair_lock_t)v93 + 28);

      *(_DWORD *)buf = 136447746;
      v147 = "nw_endpoint_resolver_handle_alternative";
      __int16 v148 = 2082;
      id_str = v57->id_str;
      __int16 v150 = 2082;
      v151 = v60;
      __int16 v152 = 2082;
      v153 = v62;
      __int16 v154 = 2082;
      v155 = v66;
      __int16 v156 = 2082;
      v157 = v88;
      __int16 v158 = 2114;
      id v159 = v94;
      _os_log_impl(&dword_1830D4000, v56, OS_LOG_TYPE_INFO, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Ignoring resolver alternative", buf, 0x48u);
    }
LABEL_86:
  }
LABEL_95:
}

void __49__NWConcrete_nw_endpoint_proxy_startWithHandler___block_invoke_4(uint64_t a1, _OWORD *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)long long v17 = *a2;
  id v3 = nw_path_copy_proxy_config_for_agent_uuid(v17, *(_DWORD *)(a1 + 56), *(void **)(a1 + 32));
  if (v3)
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 0;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __49__NWConcrete_nw_endpoint_proxy_startWithHandler___block_invoke_5;
    v6[3] = &unk_1E523E120;
    id v8 = &v9;
    id v7 = *(id *)(a1 + 40);
    nw_proxy_config_enumerate_preferred_domains(v3, v6);
    if (*((unsigned char *)v10 + 24))
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      uint64_t v4 = (id)gLogObj;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v5 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 136446466;
        int v14 = "-[NWConcrete_nw_endpoint_proxy startWithHandler:]_block_invoke_4";
        __int16 v15 = 2112;
        uint64_t v16 = v5;
        _os_log_impl(&dword_1830D4000, v4, OS_LOG_TYPE_DEBUG, "%{public}s Endpoint %@ matches preferred domain of alternate proxy", buf, 0x16u);
      }

      nw_array_append(*(void *)(a1 + 48), v3);
    }

    _Block_object_dispose(&v9, 8);
  }
}

uint64_t __58__NWConcrete_nw_ethernet_channel_updateClientState_error___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned int *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

void __47__NWConcrete_nw_ethernet_channel_createChannel__block_invoke(uint64_t a1)
{
  uint64_t v162 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && *(void *)(v2 + 152))
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v3 = (id)gLogObj;
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_8;
    }
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(char **)(v4 + 24);
    uint64_t v6 = v4 + 115;
    LODWORD(v4) = *(_DWORD *)(v4 + 168);
    *(_DWORD *)buf = 136447234;
    __int16 v148 = "-[NWConcrete_nw_ethernet_channel createChannel]_block_invoke";
    __int16 v149 = 2080;
    __int16 v150 = v5;
    __int16 v151 = 1042;
    LODWORD(v152) = 16;
    WORD2(v152) = 2098;
    *(void *)((char *)&v152 + 6) = v6;
    HIWORD(v152) = 1024;
    LODWORD(v153) = v4;
    id v7 = "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>] INPUT SOURCE: READ EVENT";
    id v8 = v3;
    uint32_t v9 = 44;
  }
  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v3 = (id)gLogObj;
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_8;
    }
    id v10 = *(char **)(a1 + 32);
    *(_DWORD *)buf = 136446466;
    __int16 v148 = "-[NWConcrete_nw_ethernet_channel createChannel]_block_invoke";
    __int16 v149 = 2114;
    __int16 v150 = v10;
    id v7 = "%{public}s [%{public}@] INPUT SOURCE: READ EVENT";
    id v8 = v3;
    uint32_t v9 = 22;
  }
  _os_log_impl(&dword_1830D4000, v8, OS_LOG_TYPE_DEBUG, v7, buf, v9);
LABEL_8:

  uint64_t v11 = *(unsigned char **)(a1 + 32);
  if (v11[112])
  {
    char v12 = v11;
    goto LABEL_11;
  }
  v11[112] = 1;
  nw_queue_suspend_source(*(void *)(*(void *)(a1 + 32) + 104));
  char v12 = (os_unfair_lock_s *)*(id *)(a1 + 32);
  if (!v12)
  {
    v56 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    __int16 v148 = "receiveFramesfromRings";
    v57 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    char v142 = 0;
    if (__nwlog_fault(v57, type, &v142))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        uint64_t v58 = __nwlog_obj();
        os_log_type_t v59 = type[0];
        if (os_log_type_enabled(v58, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          __int16 v148 = "receiveFramesfromRings";
          _os_log_impl(&dword_1830D4000, v58, v59, "%{public}s called with null ethernet_channel", buf, 0xCu);
        }
      }
      else if (v142)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        uint64_t v58 = __nwlog_obj();
        os_log_type_t v61 = type[0];
        BOOL v62 = os_log_type_enabled(v58, type[0]);
        if (backtrace_string)
        {
          if (v62)
          {
            *(_DWORD *)buf = 136446466;
            __int16 v148 = "receiveFramesfromRings";
            __int16 v149 = 2082;
            __int16 v150 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v58, v61, "%{public}s called with null ethernet_channel, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_90;
        }
        if (v62)
        {
          *(_DWORD *)buf = 136446210;
          __int16 v148 = "receiveFramesfromRings";
          _os_log_impl(&dword_1830D4000, v58, v61, "%{public}s called with null ethernet_channel, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        uint64_t v58 = __nwlog_obj();
        os_log_type_t v63 = type[0];
        if (os_log_type_enabled(v58, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          __int16 v148 = "receiveFramesfromRings";
          _os_log_impl(&dword_1830D4000, v58, v63, "%{public}s called with null ethernet_channel, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_90:
    if (v57) {
      free(v57);
    }
    goto LABEL_66;
  }
LABEL_11:
  os_unfair_lock_lock(v12 + 2);
  if (*(void *)&v12[14]._os_unfair_lock_opaque)
  {
    if (*(void *)&v12[38]._os_unfair_lock_opaque)
    {
      if (*(void *)&v12[44]._os_unfair_lock_opaque)
      {
        int v13 = os_channel_available_slot_count();
        if (v13)
        {
          uint64_t v14 = *(void *)&v12[38]._os_unfair_lock_opaque;
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          __int16 v15 = (id)gLogObj;
          BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
          if (v14)
          {
            if (v16)
            {
              long long v17 = *(char **)&v12[6]._os_unfair_lock_opaque;
              uint32_t os_unfair_lock_opaque = v12[42]._os_unfair_lock_opaque;
              *(_DWORD *)buf = 136447490;
              __int16 v148 = "receiveFramesfromRings";
              __int16 v149 = 2080;
              __int16 v150 = v17;
              __int16 v151 = 1042;
              LODWORD(v152) = 16;
              WORD2(v152) = 2098;
              *(void *)((char *)&v152 + 6) = (char *)v12 + 115;
              HIWORD(v152) = 1024;
              LODWORD(v153) = os_unfair_lock_opaque;
              WORD2(v153) = 1024;
              *(_DWORD *)((char *)&v153 + 6) = v13;
              char v19 = "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>] receiveDatafromRing: avail slots %d";
              uint64_t v20 = v15;
              uint32_t v21 = 50;
LABEL_23:
              _os_log_impl(&dword_1830D4000, v20, OS_LOG_TYPE_DEBUG, v19, buf, v21);
            }
          }
          else if (v16)
          {
            *(_DWORD *)buf = 136446722;
            __int16 v148 = "receiveFramesfromRings";
            __int16 v149 = 2114;
            __int16 v150 = (char *)v12;
            __int16 v151 = 1024;
            LODWORD(v152) = v13;
            char v19 = "%{public}s [%{public}@] receiveDatafromRing: avail slots %d";
            uint64_t v20 = v15;
            uint32_t v21 = 28;
            goto LABEL_23;
          }

          for (int i = 1; i; int i = os_channel_available_slot_count())
          {
            id v141 = v12;
            long long v145 = 0u;
            long long v146 = 0u;
            *(_OWORD *)os_log_type_t type = 0u;
            long long v144 = 0u;
            if (!os_channel_get_next_slot())
            {
              uint64_t v45 = *(void *)&v12[38]._os_unfair_lock_opaque;
              pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
              networkd_settings_init();
              size_t v46 = (id)gLogObj;
              BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);
              if (v45)
              {
                if (v47)
                {
                  id v48 = *(char **)&v12[6]._os_unfair_lock_opaque;
                  uint32_t v49 = v12[42]._os_unfair_lock_opaque;
                  *(_DWORD *)buf = 136447490;
                  __int16 v148 = "receiveOneFramefromRing_locked";
                  __int16 v149 = 2080;
                  __int16 v150 = v48;
                  __int16 v151 = 1042;
                  LODWORD(v152) = 16;
                  WORD2(v152) = 2098;
                  *(void *)((char *)&v152 + 6) = (char *)v12 + 115;
                  HIWORD(v152) = 1024;
                  LODWORD(v153) = v49;
                  WORD2(v153) = 2112;
                  *(void *)((char *)&v153 + 6) = @"NULL RX next slot";
                  id v50 = "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>]  %@";
                  id v51 = v46;
                  uint32_t v52 = 54;
                  goto LABEL_59;
                }
              }
              else if (v47)
              {
                *(_DWORD *)buf = 136446722;
                __int16 v148 = "receiveOneFramefromRing_locked";
                __int16 v149 = 2114;
                __int16 v150 = (char *)v12;
                __int16 v151 = 2112;
                *(void *)&long long v152 = @"NULL RX next slot";
                id v50 = "%{public}s [%{public}@]  %@";
                id v51 = v46;
                uint32_t v52 = 32;
LABEL_59:
                _os_log_impl(&dword_1830D4000, v51, OS_LOG_TYPE_ERROR, v50, buf, v52);
              }

              v53 = v141;
              if (*(void *)&v12[38]._os_unfair_lock_opaque) {
                goto LABEL_61;
              }
              goto LABEL_64;
            }
            if (!(void)v144)
            {
              uint64_t v64 = *(void *)&v12[38]._os_unfair_lock_opaque;
              uint64_t v65 = __nwlog_obj();
              BOOL v66 = os_log_type_enabled(v65, OS_LOG_TYPE_ERROR);
              if (v64)
              {
                if (v66)
                {
                  v67 = *(char **)&v12[6]._os_unfair_lock_opaque;
                  uint32_t v68 = v12[42]._os_unfair_lock_opaque;
                  *(_DWORD *)buf = 136447490;
                  __int16 v148 = "receiveOneFramefromRing_locked";
                  __int16 v149 = 2080;
                  __int16 v150 = v67;
                  __int16 v151 = 1042;
                  LODWORD(v152) = 16;
                  WORD2(v152) = 2098;
                  *(void *)((char *)&v152 + 6) = (char *)v12 + 115;
                  HIWORD(v152) = 1024;
                  LODWORD(v153) = v68;
                  WORD2(v153) = 2112;
                  *(void *)((char *)&v153 + 6) = @"NULL RX prop buf";
                  v69 = "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>]  %@";
                  BOOL v70 = v65;
                  uint32_t v71 = 54;
                  goto LABEL_94;
                }
              }
              else if (v66)
              {
                *(_DWORD *)buf = 136446722;
                __int16 v148 = "receiveOneFramefromRing_locked";
                __int16 v149 = 2114;
                __int16 v150 = (char *)v12;
                __int16 v151 = 2112;
                *(void *)&long long v152 = @"NULL RX prop buf";
                v69 = "%{public}s [%{public}@]  %@";
                BOOL v70 = v65;
                uint32_t v71 = 32;
LABEL_94:
                _os_log_impl(&dword_1830D4000, v70, OS_LOG_TYPE_ERROR, v69, buf, v71);
              }

              v53 = v141;
              if (*(void *)&v12[38]._os_unfair_lock_opaque) {
                goto LABEL_61;
              }
              goto LABEL_64;
            }
            if (!os_channel_slot_get_packet())
            {
              uint64_t v72 = *(void *)&v12[38]._os_unfair_lock_opaque;
              v73 = __nwlog_obj();
              BOOL v74 = os_log_type_enabled(v73, OS_LOG_TYPE_ERROR);
              if (v72)
              {
                if (v74)
                {
                  v75 = *(char **)&v12[6]._os_unfair_lock_opaque;
                  uint32_t v76 = v12[42]._os_unfair_lock_opaque;
                  *(_DWORD *)buf = 136447490;
                  __int16 v148 = "receiveOneFramefromRing_locked";
                  __int16 v149 = 2080;
                  __int16 v150 = v75;
                  __int16 v151 = 1042;
                  LODWORD(v152) = 16;
                  WORD2(v152) = 2098;
                  *(void *)((char *)&v152 + 6) = (char *)v12 + 115;
                  HIWORD(v152) = 1024;
                  LODWORD(v153) = v76;
                  WORD2(v153) = 2112;
                  *(void *)((char *)&v153 + 6) = @"Bad RX pkt";
                  v77 = "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>]  %@";
                  v78 = v73;
                  uint32_t v79 = 54;
                  goto LABEL_102;
                }
              }
              else if (v74)
              {
                *(_DWORD *)buf = 136446722;
                __int16 v148 = "receiveOneFramefromRing_locked";
                __int16 v149 = 2114;
                __int16 v150 = (char *)v12;
                __int16 v151 = 2112;
                *(void *)&long long v152 = @"Bad RX pkt";
                v77 = "%{public}s [%{public}@]  %@";
                v78 = v73;
                uint32_t v79 = 32;
LABEL_102:
                _os_log_impl(&dword_1830D4000, v78, OS_LOG_TYPE_ERROR, v77, buf, v79);
              }

              v53 = v141;
              if (*(void *)&v12[38]._os_unfair_lock_opaque)
              {
LABEL_61:
                int is_defunct = os_channel_is_defunct();
                goto LABEL_62;
              }
LABEL_64:

              break;
            }
            if (os_channel_slot_detach_packet())
            {
              uint64_t v80 = *(void *)&v12[38]._os_unfair_lock_opaque;
              v81 = __nwlog_obj();
              BOOL v82 = os_log_type_enabled(v81, OS_LOG_TYPE_ERROR);
              if (v80)
              {
                if (v82)
                {
                  v83 = *(char **)&v12[6]._os_unfair_lock_opaque;
                  uint32_t v84 = v12[42]._os_unfair_lock_opaque;
                  *(_DWORD *)buf = 136447490;
                  __int16 v148 = "receiveOneFramefromRing_locked";
                  __int16 v149 = 2080;
                  __int16 v150 = v83;
                  __int16 v151 = 1042;
                  LODWORD(v152) = 16;
                  WORD2(v152) = 2098;
                  *(void *)((char *)&v152 + 6) = (char *)v12 + 115;
                  HIWORD(v152) = 1024;
                  LODWORD(v153) = v84;
                  WORD2(v153) = 2112;
                  *(void *)((char *)&v153 + 6) = @"Bad RX detach";
                  v85 = "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>]  %@";
                  v86 = v81;
                  uint32_t v87 = 54;
                  goto LABEL_129;
                }
              }
              else if (v82)
              {
                *(_DWORD *)buf = 136446722;
                __int16 v148 = "receiveOneFramefromRing_locked";
                __int16 v149 = 2114;
                __int16 v150 = (char *)v12;
                __int16 v151 = 2112;
                *(void *)&long long v152 = @"Bad RX detach";
                v85 = "%{public}s [%{public}@]  %@";
                v86 = v81;
                uint32_t v87 = 32;
LABEL_129:
                _os_log_impl(&dword_1830D4000, v86, OS_LOG_TYPE_ERROR, v85, buf, v87);
              }

              v53 = v141;
              if (!*(void *)&v12[38]._os_unfair_lock_opaque) {
                goto LABEL_64;
              }
              goto LABEL_161;
            }
            if (!os_packet_get_next_buflet())
            {
              uint64_t v125 = *(void *)&v12[38]._os_unfair_lock_opaque;
              id v126 = __nwlog_obj();
              BOOL v127 = os_log_type_enabled(v126, OS_LOG_TYPE_ERROR);
              if (v125)
              {
                if (v127)
                {
                  v128 = *(char **)&v12[6]._os_unfair_lock_opaque;
                  uint32_t v129 = v12[42]._os_unfair_lock_opaque;
                  *(_DWORD *)buf = 136447490;
                  __int16 v148 = "receiveOneFramefromRing_locked";
                  __int16 v149 = 2080;
                  __int16 v150 = v128;
                  __int16 v151 = 1042;
                  LODWORD(v152) = 16;
                  WORD2(v152) = 2098;
                  *(void *)((char *)&v152 + 6) = (char *)v12 + 115;
                  HIWORD(v152) = 1024;
                  LODWORD(v153) = v129;
                  WORD2(v153) = 2112;
                  *(void *)((char *)&v153 + 6) = @"Bad RX buflet";
                  nw_endpoint_t v130 = "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>]  %@";
                  v131 = v126;
                  uint32_t v132 = 54;
                  goto LABEL_159;
                }
              }
              else if (v127)
              {
                *(_DWORD *)buf = 136446722;
                __int16 v148 = "receiveOneFramefromRing_locked";
                __int16 v149 = 2114;
                __int16 v150 = (char *)v12;
                __int16 v151 = 2112;
                *(void *)&long long v152 = @"Bad RX buflet";
                nw_endpoint_t v130 = "%{public}s [%{public}@]  %@";
                v131 = v126;
                uint32_t v132 = 32;
LABEL_159:
                _os_log_impl(&dword_1830D4000, v131, OS_LOG_TYPE_ERROR, v130, buf, v132);
              }

              v53 = v141;
              if (!*(void *)&v12[38]._os_unfair_lock_opaque) {
                goto LABEL_64;
              }
              goto LABEL_161;
            }
            unsigned int log = os_buflet_get_data_offset();
            uint64_t object_address = os_buflet_get_object_address();
            if (!object_address)
            {
              uint64_t v117 = *(void *)&v12[38]._os_unfair_lock_opaque;
              v118 = __nwlog_obj();
              BOOL v119 = os_log_type_enabled(v118, OS_LOG_TYPE_ERROR);
              if (v117)
              {
                if (v119)
                {
                  v120 = *(char **)&v12[6]._os_unfair_lock_opaque;
                  uint32_t v121 = v12[42]._os_unfair_lock_opaque;
                  *(_DWORD *)buf = 136447490;
                  __int16 v148 = "receiveOneFramefromRing_locked";
                  __int16 v149 = 2080;
                  __int16 v150 = v120;
                  __int16 v151 = 1042;
                  LODWORD(v152) = 16;
                  WORD2(v152) = 2098;
                  *(void *)((char *)&v152 + 6) = (char *)v12 + 115;
                  HIWORD(v152) = 1024;
                  LODWORD(v153) = v121;
                  WORD2(v153) = 2112;
                  *(void *)((char *)&v153 + 6) = @"Bad RX address";
                  nw_endpoint_t v122 = "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>]  %@";
                  v123 = v118;
                  uint32_t v124 = 54;
                  goto LABEL_154;
                }
              }
              else if (v119)
              {
                *(_DWORD *)buf = 136446722;
                __int16 v148 = "receiveOneFramefromRing_locked";
                __int16 v149 = 2114;
                __int16 v150 = (char *)v12;
                __int16 v151 = 2112;
                *(void *)&long long v152 = @"Bad RX address";
                nw_endpoint_t v122 = "%{public}s [%{public}@]  %@";
                v123 = v118;
                uint32_t v124 = 32;
LABEL_154:
                _os_log_impl(&dword_1830D4000, v123, OS_LOG_TYPE_ERROR, v122, buf, v124);
              }

              v53 = v141;
              if (!*(void *)&v12[38]._os_unfair_lock_opaque) {
                goto LABEL_64;
              }
              goto LABEL_161;
            }
            int data_length = (unsigned __int16)os_packet_get_data_length();
            if (!data_length)
            {
              uint64_t v101 = *(void *)&v12[38]._os_unfair_lock_opaque;
              os_log_type_t v102 = __nwlog_obj();
              BOOL v103 = os_log_type_enabled(v102, OS_LOG_TYPE_ERROR);
              if (v101)
              {
                if (v103)
                {
                  os_log_type_t v104 = *(char **)&v12[6]._os_unfair_lock_opaque;
                  uint32_t v105 = v12[42]._os_unfair_lock_opaque;
                  *(_DWORD *)buf = 136447490;
                  __int16 v148 = "receiveOneFramefromRing_locked";
                  __int16 v149 = 2080;
                  __int16 v150 = v104;
                  __int16 v151 = 1042;
                  LODWORD(v152) = 16;
                  WORD2(v152) = 2098;
                  *(void *)((char *)&v152 + 6) = (char *)v12 + 115;
                  HIWORD(v152) = 1024;
                  LODWORD(v153) = v105;
                  WORD2(v153) = 2112;
                  *(void *)((char *)&v153 + 6) = @"Bad RX frame length";
                  v106 = "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>]  %@";
                  v107 = v102;
                  uint32_t v108 = 54;
                  goto LABEL_144;
                }
              }
              else if (v103)
              {
                *(_DWORD *)buf = 136446722;
                __int16 v148 = "receiveOneFramefromRing_locked";
                __int16 v149 = 2114;
                __int16 v150 = (char *)v12;
                __int16 v151 = 2112;
                *(void *)&long long v152 = @"Bad RX frame length";
                v106 = "%{public}s [%{public}@]  %@";
                v107 = v102;
                uint32_t v108 = 32;
LABEL_144:
                _os_log_impl(&dword_1830D4000, v107, OS_LOG_TYPE_ERROR, v106, buf, v108);
              }

              v53 = v141;
              if (!*(void *)&v12[38]._os_unfair_lock_opaque) {
                goto LABEL_64;
              }
              goto LABEL_161;
            }
            int v23 = os_channel_advance_slot();
            uint64_t v24 = *(void *)&v12[38]._os_unfair_lock_opaque;
            if (v23)
            {
              v88 = __nwlog_obj();
              BOOL v89 = os_log_type_enabled(v88, OS_LOG_TYPE_ERROR);
              if (v24)
              {
                if (v89)
                {
                  v90 = *(char **)&v12[6]._os_unfair_lock_opaque;
                  uint32_t v91 = v12[42]._os_unfair_lock_opaque;
                  *(_DWORD *)buf = 136447490;
                  __int16 v148 = "receiveOneFramefromRing_locked";
                  __int16 v149 = 2080;
                  __int16 v150 = v90;
                  __int16 v151 = 1042;
                  LODWORD(v152) = 16;
                  WORD2(v152) = 2098;
                  *(void *)((char *)&v152 + 6) = (char *)v12 + 115;
                  HIWORD(v152) = 1024;
                  LODWORD(v153) = v91;
                  WORD2(v153) = 2112;
                  *(void *)((char *)&v153 + 6) = @"Failed to advance RX slot";
                  v92 = "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>]  %@";
                  v93 = v88;
                  uint32_t v94 = 54;
                  goto LABEL_134;
                }
              }
              else if (v89)
              {
                *(_DWORD *)buf = 136446722;
                __int16 v148 = "receiveOneFramefromRing_locked";
                __int16 v149 = 2114;
                __int16 v150 = (char *)v12;
                __int16 v151 = 2112;
                *(void *)&long long v152 = @"Failed to advance RX slot";
                v92 = "%{public}s [%{public}@]  %@";
                v93 = v88;
                uint32_t v94 = 32;
LABEL_134:
                _os_log_impl(&dword_1830D4000, v93, OS_LOG_TYPE_ERROR, v92, buf, v94);
              }

              v53 = v141;
              if (!*(void *)&v12[38]._os_unfair_lock_opaque) {
                goto LABEL_64;
              }
              goto LABEL_161;
            }
            int v25 = os_channel_sync();
            uint64_t v26 = *(void *)&v12[38]._os_unfair_lock_opaque;
            osunsigned int log = __nwlog_obj();
            if (v25)
            {
              BOOL v95 = os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR);
              if (v26)
              {
                if (v95)
                {
                  v96 = *(char **)&v12[6]._os_unfair_lock_opaque;
                  uint32_t v97 = v12[42]._os_unfair_lock_opaque;
                  *(_DWORD *)buf = 136447490;
                  __int16 v148 = "receiveOneFramefromRing_locked";
                  __int16 v149 = 2080;
                  __int16 v150 = v96;
                  __int16 v151 = 1042;
                  LODWORD(v152) = 16;
                  WORD2(v152) = 2098;
                  *(void *)((char *)&v152 + 6) = (char *)v12 + 115;
                  HIWORD(v152) = 1024;
                  LODWORD(v153) = v97;
                  WORD2(v153) = 2112;
                  *(void *)((char *)&v153 + 6) = @"Failed to sync RX";
                  v98 = "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>]  %@";
                  v99 = oslog;
                  uint32_t v100 = 54;
                  goto LABEL_139;
                }
              }
              else if (v95)
              {
                *(_DWORD *)buf = 136446722;
                __int16 v148 = "receiveOneFramefromRing_locked";
                __int16 v149 = 2114;
                __int16 v150 = (char *)v12;
                __int16 v151 = 2112;
                *(void *)&long long v152 = @"Failed to sync RX";
                v98 = "%{public}s [%{public}@]  %@";
                v99 = oslog;
                uint32_t v100 = 32;
LABEL_139:
                _os_log_impl(&dword_1830D4000, v99, OS_LOG_TYPE_ERROR, v98, buf, v100);
              }

              v53 = v141;
              if (!*(void *)&v12[38]._os_unfair_lock_opaque) {
                goto LABEL_64;
              }
              goto LABEL_161;
            }
            BOOL v27 = os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG);
            if (v26)
            {
              if (!v27) {
                goto LABEL_41;
              }
              uint64_t v28 = *(char **)&v12[6]._os_unfair_lock_opaque;
              uint32_t v29 = v12[42]._os_unfair_lock_opaque;
              *(_DWORD *)buf = 136447490;
              __int16 v148 = "receiveOneFramefromRing_locked";
              __int16 v149 = 2080;
              __int16 v150 = v28;
              __int16 v151 = 1042;
              LODWORD(v152) = 16;
              WORD2(v152) = 2098;
              *(void *)((char *)&v152 + 6) = (char *)v12 + 115;
              HIWORD(v152) = 1024;
              LODWORD(v153) = v29;
              WORD2(v153) = 1024;
              *(_DWORD *)((char *)&v153 + 6) = data_length;
              char v30 = oslog;
              v31 = "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>] receiveDatafromRing: frame len %d";
              uint32_t v32 = 50;
            }
            else
            {
              if (!v27) {
                goto LABEL_41;
              }
              *(_DWORD *)buf = 136446722;
              __int16 v148 = "receiveOneFramefromRing_locked";
              __int16 v149 = 2114;
              __int16 v150 = (char *)v12;
              __int16 v151 = 1024;
              LODWORD(v152) = data_length;
              char v30 = oslog;
              v31 = "%{public}s [%{public}@] receiveDatafromRing: frame len %d";
              uint32_t v32 = 28;
            }
            _os_log_impl(&dword_1830D4000, v30, OS_LOG_TYPE_DEBUG, v31, buf, v32);
LABEL_41:

            if ((data_length - 1519) <= 0xFFFFFA4C)
            {
              uint64_t v109 = *(void *)&v12[38]._os_unfair_lock_opaque;
              v110 = __nwlog_obj();
              BOOL v111 = os_log_type_enabled(v110, OS_LOG_TYPE_ERROR);
              if (v109)
              {
                if (v111)
                {
                  id v112 = *(char **)&v12[6]._os_unfair_lock_opaque;
                  uint32_t v113 = v12[42]._os_unfair_lock_opaque;
                  *(_DWORD *)buf = 136447490;
                  __int16 v148 = "receiveOneFramefromRing_locked";
                  __int16 v149 = 2080;
                  __int16 v150 = v112;
                  __int16 v151 = 1042;
                  LODWORD(v152) = 16;
                  WORD2(v152) = 2098;
                  *(void *)((char *)&v152 + 6) = (char *)v12 + 115;
                  HIWORD(v152) = 1024;
                  LODWORD(v153) = v113;
                  WORD2(v153) = 2112;
                  *(void *)((char *)&v153 + 6) = @"frame size len is invalid";
                  v114 = "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>]  %@";
                  nw_endpoint_t v115 = v110;
                  uint32_t v116 = 54;
                  goto LABEL_149;
                }
              }
              else if (v111)
              {
                *(_DWORD *)buf = 136446722;
                __int16 v148 = "receiveOneFramefromRing_locked";
                __int16 v149 = 2114;
                __int16 v150 = (char *)v12;
                __int16 v151 = 2112;
                *(void *)&long long v152 = @"frame size len is invalid";
                v114 = "%{public}s [%{public}@]  %@";
                nw_endpoint_t v115 = v110;
                uint32_t v116 = 32;
LABEL_149:
                _os_log_impl(&dword_1830D4000, v115, OS_LOG_TYPE_ERROR, v114, buf, v116);
              }

              v53 = v141;
              if (!*(void *)&v12[38]._os_unfair_lock_opaque) {
                goto LABEL_64;
              }
LABEL_161:
              os_channel_packet_free();
              int is_defunct = os_channel_is_defunct();
LABEL_62:
              if (is_defunct) {
                -[NWConcrete_nw_ethernet_channel closeChannel:]((uint64_t)v53, 0);
              }
              goto LABEL_64;
            }
            char v33 = (unsigned __int16 *)(object_address + log);
            osos_log_t loga = (data_length - 14);
            unsigned int v34 = v33[6];
            if (v34 == 129)
            {
              unsigned int v138 = bswap32(v33[7]) >> 16;
              unsigned int v134 = bswap32(v33[8]) >> 16;
              uint64_t v35 = v33 + 9;
              osloga -= 4;
            }
            else
            {
              unsigned int v138 = 0;
              uint64_t v35 = v33 + 7;
              unsigned int v134 = __rev16(v34);
            }
            dispatch_data_t v36 = dispatch_data_create(v35, osloga, 0, 0);
            uint64_t v37 = *(void *)&v12[38]._os_unfair_lock_opaque;
            dispatch_data_t v38 = v36;
            if (v36)
            {
              os_log_t loga = __nwlog_obj();
              BOOL v39 = os_log_type_enabled(loga, OS_LOG_TYPE_DEBUG);
              if (v37)
              {
                if (v39)
                {
                  v40 = *(char **)&v12[6]._os_unfair_lock_opaque;
                  uint32_t v41 = v12[42]._os_unfair_lock_opaque;
                  *(_DWORD *)buf = 136449026;
                  __int16 v148 = "receiveOneFramefromRing_locked";
                  __int16 v149 = 2080;
                  __int16 v150 = v40;
                  __int16 v151 = 1042;
                  LODWORD(v152) = 16;
                  WORD2(v152) = 2098;
                  *(void *)((char *)&v152 + 6) = (char *)v12 + 115;
                  HIWORD(v152) = 1024;
                  LODWORD(v153) = v41;
                  WORD2(v153) = 1024;
                  *(_DWORD *)((char *)&v153 + 6) = v134;
                  WORD5(v153) = 1024;
                  HIDWORD(v153) = v138;
                  __int16 v154 = 1042;
                  *(_DWORD *)v155 = 6;
                  *(_WORD *)&v155[4] = 2098;
                  *(void *)&v155[6] = v33;
                  __int16 v156 = 1042;
                  int v157 = 6;
                  __int16 v158 = 2098;
                  id v159 = v33 + 3;
                  __int16 v160 = 1024;
                  int v161 = osloga;
                  v42 = loga;
                  v43 = "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>] receiveDatafromRing: ethertype %X v"
                        "lantag %X local %{public,nw_ethernet_address_t}.6P remote %{public,nw_ethernet_address_t}.6P data size %d";
                  uint32_t v44 = 94;
                  goto LABEL_51;
                }
              }
              else if (v39)
              {
                *(_DWORD *)buf = 136448258;
                __int16 v148 = "receiveOneFramefromRing_locked";
                __int16 v149 = 2114;
                __int16 v150 = (char *)v12;
                __int16 v151 = 1024;
                LODWORD(v152) = v134;
                WORD2(v152) = 1024;
                *(_DWORD *)((char *)&v152 + 6) = v138;
                WORD5(v152) = 1042;
                HIDWORD(v152) = 6;
                LOWORD(v153) = 2098;
                *(void *)((char *)&v153 + 2) = v33;
                WORD5(v153) = 1042;
                HIDWORD(v153) = 6;
                __int16 v154 = 2098;
                *(void *)v155 = v33 + 3;
                *(_WORD *)&v155[8] = 1024;
                *(_DWORD *)&v155[10] = osloga;
                v42 = loga;
                v43 = "%{public}s [%{public}@] receiveDatafromRing: ethertype %X vlantag %X local %{public,nw_ethernet_ad"
                      "dress_t}.6P remote %{public,nw_ethernet_address_t}.6P data size %d";
                uint32_t v44 = 72;
LABEL_51:
                _os_log_impl(&dword_1830D4000, v42, OS_LOG_TYPE_DEBUG, v43, buf, v44);
              }

              os_unfair_lock_unlock(v12 + 2);
              (*(void (**)(void))(*(void *)&v12[14]._os_unfair_lock_opaque + 16))();
              os_unfair_lock_lock(v12 + 2);
              if (!*(void *)&v12[38]._os_unfair_lock_opaque)
              {

                v53 = v141;
                goto LABEL_64;
              }
            }
            os_channel_packet_free();
          }
        }
      }
    }
  }
  os_unfair_lock_unlock(v12 + 2);

LABEL_66:
  uint64_t v55 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v55 + 112))
  {
    *(unsigned char *)(v55 + 112) = 0;
    nw_queue_resume_source(*(void *)(*(void *)(a1 + 32) + 104));
    uint64_t v55 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v55 + 114)) {
    nw_ethernet_channel_cancel((nw_ethernet_channel_t)v55);
  }
}

void __33__NWConcrete_nw_resolver_dealloc__block_invoke(uint64_t a1)
{
}

uint64_t __49__NWConcrete_nw_establishment_report_description__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return 1;
}

uint64_t __49__NWConcrete_nw_establishment_report_description__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return 1;
}

uint64_t __49__NWConcrete_nw_establishment_report_description__block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3 = *(__CFString **)(a1 + 40);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    uint64_t v4 = ", ";
  }
  else {
    uint64_t v4 = "";
  }
  CFStringAppendFormat(v3, 0, @"%s%@", v4, a2);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  return 1;
}

BOOL __75__NWConcrete_nw_connection_group_initWithDescriptor_connection_parameters___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (nw_endpoint_get_type(v3) == nw_endpoint_type_address)
  {
    *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = nw_endpoint_get_port(v3);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = nw_endpoint_copy_port_string(v3);
  }
  BOOL v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == 0;

  return v4;
}

void __75__NWConcrete_nw_connection_group_initWithDescriptor_connection_parameters___block_invoke_12(uint64_t a1)
{
}

uint64_t __42__NWConcrete_nw_protocol_instance_destroy__block_invoke_57(uint64_t a1, uint64_t a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t extra = nw_hash_node_get_extra(a2);
  if (!*(void *)(extra + 32)) {
    goto LABEL_9;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v4 = (id)gLogObj;
  uint64_t v5 = *(void *)(extra + 32);
  uint64_t v6 = *(void *)(a1 + 32);
  *(_DWORD *)buf = 136446978;
  uint64_t v26 = "-[NWConcrete_nw_protocol_instance destroy]_block_invoke";
  __int16 v27 = 2048;
  uint64_t v28 = extra;
  __int16 v29 = 2048;
  uint64_t v30 = v5;
  __int16 v31 = 2048;
  uint64_t v32 = v6;
  id v7 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v23 = 0;
  if (__nwlog_fault(v7, &type, &v23))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v8 = (id)gLogObj;
      os_log_type_t v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        uint64_t v10 = *(void *)(extra + 32);
        uint64_t v11 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 136446978;
        uint64_t v26 = "-[NWConcrete_nw_protocol_instance destroy]_block_invoke";
        __int16 v27 = 2048;
        uint64_t v28 = extra;
        __int16 v29 = 2048;
        uint64_t v30 = v10;
        __int16 v31 = 2048;
        uint64_t v32 = v11;
        _os_log_impl(&dword_1830D4000, v8, v9, "%{public}s Path state %p has an output handler %p when protocol instance %p is deallocated", buf, 0x2Au);
      }
    }
    else if (v23)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v8 = (id)gLogObj;
      os_log_type_t v14 = type;
      BOOL v15 = os_log_type_enabled(v8, type);
      if (backtrace_string)
      {
        if (v15)
        {
          uint64_t v16 = *(void *)(extra + 32);
          uint64_t v17 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 136447234;
          uint64_t v26 = "-[NWConcrete_nw_protocol_instance destroy]_block_invoke";
          __int16 v27 = 2048;
          uint64_t v28 = extra;
          __int16 v29 = 2048;
          uint64_t v30 = v16;
          __int16 v31 = 2048;
          uint64_t v32 = v17;
          __int16 v33 = 2082;
          unsigned int v34 = backtrace_string;
          _os_log_impl(&dword_1830D4000, v8, v14, "%{public}s Path state %p has an output handler %p when protocol instance %p is deallocated, dumping backtrace:%{public}s", buf, 0x34u);
        }

        free(backtrace_string);
        if (v7) {
          goto LABEL_8;
        }
        goto LABEL_9;
      }
      if (v15)
      {
        uint64_t v21 = *(void *)(extra + 32);
        uint64_t v22 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 136446978;
        uint64_t v26 = "-[NWConcrete_nw_protocol_instance destroy]_block_invoke";
        __int16 v27 = 2048;
        uint64_t v28 = extra;
        __int16 v29 = 2048;
        uint64_t v30 = v21;
        __int16 v31 = 2048;
        uint64_t v32 = v22;
        _os_log_impl(&dword_1830D4000, v8, v14, "%{public}s Path state %p has an output handler %p when protocol instance %p is deallocated, no backtrace", buf, 0x2Au);
      }
    }
    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v8 = (id)gLogObj;
      os_log_type_t v18 = type;
      if (os_log_type_enabled(v8, type))
      {
        uint64_t v19 = *(void *)(extra + 32);
        uint64_t v20 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 136446978;
        uint64_t v26 = "-[NWConcrete_nw_protocol_instance destroy]_block_invoke";
        __int16 v27 = 2048;
        uint64_t v28 = extra;
        __int16 v29 = 2048;
        uint64_t v30 = v19;
        __int16 v31 = 2048;
        uint64_t v32 = v20;
        _os_log_impl(&dword_1830D4000, v8, v18, "%{public}s Path state %p has an output handler %p when protocol instance %p is deallocated, backtrace limit exceeded", buf, 0x2Au);
      }
    }
  }
  if (v7) {
LABEL_8:
  }
    free(v7);
LABEL_9:
  nw_protocol_path_state_dispose(*(void **)(a1 + 32), extra);
  return 1;
}

uint64_t __42__NWConcrete_nw_protocol_instance_destroy__block_invoke(uint64_t a1, void *a2)
{
  return 1;
}

uint64_t __44__NWConcrete_nw_protocol_data_array_dealloc__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  nw_frame_finalize((uint64_t)v3);
  uint64_t v4 = v3[4];
  uint64_t v5 = (void *)v3[5];
  if (v4)
  {
    *(void *)(v4 + 40) = v5;
    uint64_t v5 = (void *)v3[5];
  }
  else
  {
    *(void *)(*(void *)(a1 + 32) + 16) = v5;
  }
  *uint64_t v5 = v4;
  v3[4] = 0;
  v3[5] = 0;

  return 1;
}

void __43__NWConcrete_nw_listener_getIDSInformation__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 224);
  uint64_t v3 = nw_array_create();
  uint64_t v4 = v3;
  if (v2)
  {
    if (v3 == v2) {
      uint64_t v4 = v2;
    }
    else {
      std::vector<nw_object_wrapper_t>::__assign_with_size[abi:nn180100]<nw_object_wrapper_t*,nw_object_wrapper_t*>(v3 + 16, *(void ***)(v2 + 16), *(void ***)(v2 + 24), (uint64_t)(*(void *)(v2 + 24) - *(void *)(v2 + 16)) >> 3);
    }
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __59__NWConcrete_nw_listener_updateParametersForNewConnection___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  if (nw_protocol_options_is_quic(v3))
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 16);
    if (v4 && !nw_path_parameters_get_logging_disabled(*(void *)(v4 + 104)))
    {
      if (__nwlog_listener_log::onceToken != -1) {
        dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_40_44887);
      }
      uint64_t v5 = (id)glistenerLogObj;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        id_string = nw_listener_get_id_string(*(void **)(a1 + 32));
        uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        int v11 = 136446722;
        char v12 = "-[NWConcrete_nw_listener updateParametersForNewConnection:]_block_invoke_2";
        __int16 v13 = 2082;
        os_log_type_t v14 = id_string;
        __int16 v15 = 2114;
        uint64_t v16 = v7;
        _os_log_impl(&dword_1830D4000, v5, OS_LOG_TYPE_DEBUG, "%{public}s [%{public}s] Setting trusted_peer_keys: %{public}@ for new connection", (uint8_t *)&v11, 0x20u);
      }
    }
    id v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v9 = nw_parameters_copy_context(*(void **)(*(void *)(a1 + 32) + 16));
    BOOL v10 = nw_context_copy_workloop(v9);
    nw_quic_connection_set_trusted_peer_keys(v3, v8, (void *)v10);
  }
}

void __78__NWConcrete_nw_listener_handleInboundPacket_length_from_to_interface_socket___block_invoke(void *a1)
{
  uint64_t v2 = _Block_copy(*(const void **)(a1[4] + 112));
  uint64_t v3 = *(void *)(a1[5] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void **)(a1[4] + 64);
  uint64_t v6 = (id *)(*(void *)(a1[6] + 8) + 40);

  objc_storeStrong(v6, v5);
}

uint64_t __78__NWConcrete_nw_listener_handleInboundPacket_length_from_to_interface_socket___block_invoke_45(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, void))(*(void *)(*(void *)(a1[9] + 8)
                                                                                               + 40)
                                                                                   + 16))(*(void *)(*(void *)(a1[9] + 8) + 40), a1[4], a1[5], a1[6], a1[7], a1[8]);
}

void __57__NWConcrete_nw_listener_handleInbound_addProtocolInbox___block_invoke_41(uint64_t a1, int a2, int a3, void *a4, void *a5)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  BOOL v10 = a5;
  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 16);
  if (v11 && !nw_path_parameters_get_logging_disabled(*(void *)(v11 + 104)))
  {
    if (__nwlog_listener_log::onceToken != -1) {
      dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_40_44887);
    }
    char v12 = (id)glistenerLogObj;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id_string = nw_listener_get_id_string(*(void **)(a1 + 32));
      uint64_t v14 = *(void *)(a1 + 40);
      __int16 v15 = v9 + 104;
      if (!v9) {
        __int16 v15 = 0;
      }
      int v25 = 136447746;
      uint64_t v26 = "-[NWConcrete_nw_listener handleInbound:addProtocolInbox:]_block_invoke";
      uint64_t v16 = v10 + 104;
      __int16 v27 = 2082;
      if (!v10) {
        uint64_t v16 = 0;
      }
      uint64_t v28 = id_string;
      __int16 v29 = 2112;
      uint64_t v30 = v14;
      __int16 v31 = 1024;
      int v32 = a2;
      __int16 v33 = 1024;
      int v34 = a3;
      __int16 v35 = 2080;
      dispatch_data_t v36 = v15;
      __int16 v37 = 2080;
      dispatch_data_t v38 = v16;
      _os_log_impl(&dword_1830D4000, v12, OS_LOG_TYPE_INFO, "%{public}s [%{public}s] Connection %@ initial:%{BOOL}d cancelling:%{BOOL}d (%s) -> (%s)", (uint8_t *)&v25, 0x40u);
    }
  }
  if (v9 || (a2 & 1) != 0)
  {
    if (!v10 && (a3 & 1) == 0)
    {
      nw_listener_adjust_awdl_usage_on_queue(*(NWConcrete_nw_listener **)(a1 + 32), 1);
      uint64_t v22 = *(void *)(*(void *)(a1 + 32) + 16);
      if (v22)
      {
        if (!nw_path_parameters_get_logging_disabled(*(void *)(v22 + 104)))
        {
          if (__nwlog_listener_log::onceToken != -1) {
            dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_40_44887);
          }
          os_log_type_t v18 = (id)glistenerLogObj;
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
            goto LABEL_29;
          }
          char v23 = nw_listener_get_id_string(*(void **)(a1 + 32));
          int v24 = *(unsigned __int16 *)(*(void *)(a1 + 32) + 240);
          int v25 = 136446722;
          uint64_t v26 = "-[NWConcrete_nw_listener handleInbound:addProtocolInbox:]_block_invoke";
          __int16 v27 = 2082;
          uint64_t v28 = v23;
          __int16 v29 = 1024;
          LODWORD(v30) = v24;
          uint64_t v21 = "%{public}s [%{public}s] Connection now needs AWDL, updated AWDL usage count=%u";
          goto LABEL_28;
        }
      }
    }
  }
  else
  {
    nw_listener_adjust_awdl_usage_on_queue(*(NWConcrete_nw_listener **)(a1 + 32), 0);
    uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 16);
    if (v17 && !nw_path_parameters_get_logging_disabled(*(void *)(v17 + 104)))
    {
      if (__nwlog_listener_log::onceToken != -1) {
        dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_40_44887);
      }
      os_log_type_t v18 = (id)glistenerLogObj;
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
        goto LABEL_29;
      }
      uint64_t v19 = nw_listener_get_id_string(*(void **)(a1 + 32));
      int v20 = *(unsigned __int16 *)(*(void *)(a1 + 32) + 240);
      int v25 = 136446722;
      uint64_t v26 = "-[NWConcrete_nw_listener handleInbound:addProtocolInbox:]_block_invoke";
      __int16 v27 = 2082;
      uint64_t v28 = v19;
      __int16 v29 = 1024;
      LODWORD(v30) = v20;
      uint64_t v21 = "%{public}s [%{public}s] Connection no longer needs AWDL, updated AWDL usage count=%u";
LABEL_28:
      _os_log_impl(&dword_1830D4000, v18, OS_LOG_TYPE_INFO, v21, (uint8_t *)&v25, 0x1Cu);
LABEL_29:
    }
  }
}

uint64_t __57__NWConcrete_nw_listener_handleInbound_addProtocolInbox___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 16))();
}

uint64_t __40__NWConcrete_nw_custom_endpoint_getHash__block_invoke(uint64_t a1, int a2, int a3, void *data, CC_LONG len)
{
  return 1;
}

uint64_t __60__NWConcrete_nw_endpoint_proxy_applyWithHandler_toChildren___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __57__NWConcrete_nw_endpoint_proxy_cancelWithHandler_forced___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return 1;
}

uint64_t __49__NWConcrete_nw_endpoint_proxy_startWithHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (nw_proxy_config_has_fallback_proxy_agent(v4) || nw_proxy_config_has_fallback_proxy_config(v4))
  {
    uint64_t v5 = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  else
  {
    uint64_t v5 = 1;
  }

  return v5;
}

uint64_t __49__NWConcrete_nw_endpoint_proxy_startWithHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  nw_array_append(*(void *)(a1 + 32), v4);
  unsigned int generation = nw_proxy_config_get_generation(v4);
  *(_OWORD *)char v12 = 0uLL;
  nw_proxy_config_copy_fallback_proxy_agent(v4, v12);
  id v6 = nw_proxy_config_copy_fallback_proxy_config(v4);
  unsigned int v7 = 0;
  while (v6)
  {
    if (v7 >= 8) {
      goto LABEL_11;
    }
LABEL_9:
    uuid_clear(v12);
    if (v6)
    {
      id v8 = v6;
      v8[171] |= 0x20u;

      nw_array_append(*(void *)(a1 + 32), v8);
      id v9 = v8;
      *(_OWORD *)char v12 = *(_OWORD *)(v9 + 72);

      BOOL v10 = v9;
      id v6 = v10[11];
    }
    ++v7;
  }
  id v6 = 0;
  if (!uuid_is_null(v12) && v7 < 8)
  {
    id v6 = nw_path_copy_proxy_config_for_agent_uuid(v12, generation, *(void **)(a1 + 40));
    goto LABEL_9;
  }
LABEL_11:

  return 1;
}

uint64_t __49__NWConcrete_nw_endpoint_proxy_startWithHandler___block_invoke_3(id *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  int generation = nw_proxy_config_get_generation(v4);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__NWConcrete_nw_endpoint_proxy_startWithHandler___block_invoke_4;
  v7[3] = &unk_1E523E148;
  int v11 = generation;
  id v8 = a1[4];
  id v9 = a1[5];
  id v10 = a1[6];
  nw_proxy_config_enumerate_alternate_agents(v4, v7);
  nw_array_append((uint64_t)a1[6], v4);

  return 1;
}

void __49__NWConcrete_nw_endpoint_proxy_startWithHandler___block_invoke_5(uint64_t a1, const char *a2)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = nw_endpoint_proxy_match_pattern_to_endpoint(*(void **)(a1 + 32), a2);
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      id v4 = nw_endpoint_copy_cname_array(*(void **)(a1 + 32));
      uint64_t v5 = v4;
      if (v4)
      {
        if (*((void *)v4 + 3) != *((void *)v4 + 2))
        {
          v6[0] = MEMORY[0x1E4F143A8];
          v6[1] = 3221225472;
          v6[2] = __49__NWConcrete_nw_endpoint_proxy_startWithHandler___block_invoke_6;
          v6[3] = &unk_1E524BAD0;
          void v6[4] = *(void *)(a1 + 40);
          v6[5] = a2;
          nw_array_apply((atomic_uchar *)v4, (uint64_t)v6);
        }
      }
    }
  }
}

BOOL __49__NWConcrete_nw_endpoint_proxy_startWithHandler___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = nw_endpoint_proxy_match_pattern_to_endpoint(v4, *(const char **)(a1 + 40));
  BOOL v5 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == 0;

  return v5;
}

uint64_t __47__NWConcrete_nw_masque_connection_pair_dealloc__block_invoke(int a1, int a2, nw_connection_t connection)
{
  return 1;
}

uint64_t __45__NWConcrete_nw_masque_listener_pair_dealloc__block_invoke(int a1, int a2, nw_connection_t connection)
{
  return 1;
}

uint64_t __63__NWConcrete_nw_endpoint_resolver_applyWithHandler_toChildren___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

NWConcrete_nw_protocol_definition *__nw_protocol_copy_ethernet_definition_block_invoke()
{
  if (nw_protocol_ethernet_identifier::onceToken != -1) {
    dispatch_once(&nw_protocol_ethernet_identifier::onceToken, &__block_literal_global_31936);
  }
  uint64_t result = nw_protocol_definition_create_with_identifier((long long *)&g_ethernet_protocol_identifier);
  nw_protocol_copy_ethernet_definition::ethernet_definition = (uint64_t)result;
  return result;
}

uint64_t __41__NWConcrete_nw_proxy_config_description__block_invoke(uint64_t a1, int a2, nw_protocol_stack_t stack)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__NWConcrete_nw_proxy_config_description__block_invoke_2;
  v5[3] = &unk_1E5240D38;
  long long v3 = *(_OWORD *)(a1 + 48);
  long long v6 = *(_OWORD *)(a1 + 32);
  long long v7 = v3;
  nw_protocol_stack_iterate_application_protocols(stack, v5);
  return 0;
}

void __41__NWConcrete_nw_proxy_config_description__block_invoke_2(uint64_t a1, void *a2)
{
  long long v3 = a2;
  id v8 = v3;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    nw_protocol_definition_t v4 = nw_protocol_options_copy_definition(v3);
    if ((*(unsigned char *)(*(void *)(a1 + 32) + 171) & 0x20) != 0) {
      BOOL v5 = "Fallback ";
    }
    else {
      BOOL v5 = "";
    }
    CFStringAppendFormat(*(CFMutableStringRef *)(a1 + 56), 0, @"%@ %sProxy: ", v4, v5);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;

    long long v3 = v8;
  }
  id v6 = nw_protocol_options_copy_proxy_endpoint(v3);
  if (v6)
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      long long v7 = ", ";
    }
    else {
      long long v7 = "";
    }
    CFStringAppendFormat(*(CFMutableStringRef *)(a1 + 56), 0, @"%s%@", v7, v6);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

uint64_t __29__NWConcrete_nw_storage_init__block_invoke()
{
  uint64_t result = atexit(nw_storage_flush_all_storages_atexit);
  storages = 0;
  qword_1E8F684C0 = (uint64_t)&storages;
  return result;
}

uint64_t __44__NWConcrete_nw_resolver_config_description__block_invoke(uint64_t a1, char *__s)
{
  long long v3 = (void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48);
  size_t v4 = strlen(__s);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v3, (uint64_t)__s, v4);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v3, (uint64_t)" ", 1);
  return 1;
}

uint64_t __44__NWConcrete_nw_resolver_config_description__block_invoke_2(uint64_t a1, char *__s)
{
  long long v3 = (void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48);
  size_t v4 = strlen(__s);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v3, (uint64_t)__s, v4);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v3, (uint64_t)" ", 1);
  return 1;
}

void __48__NWConcrete_nw_nat64_prefixes_resolver_dealloc__block_invoke(uint64_t a1)
{
}

uint64_t __42__NWConcrete_nw_address_endpoint_hostname__block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  char v3 = *(unsigned char *)(result + 390);
  if ((v3 & 1) == 0)
  {
    unsigned int v4 = *(unsigned __int8 *)(result + 233);
    BOOL v5 = v4 > 0x1E;
    int v6 = (1 << v4) & 0x40040004;
    if (!v5 && v6 != 0)
    {
      *(void *)(*(void *)(a1 + 32) + 376) = nw_endpoint_copy_address_string((nw_endpoint_t)result);
      uint64_t result = *(void *)(a1 + 32);
      char v3 = *(unsigned char *)(result + 390);
    }
    *(unsigned char *)(result + 390) = v3 | 1;
  }
  return result;
}

uint64_t __64__NWConcrete_nw_endpoint_transform_applyWithHandler_toChildren___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __37__NWConcrete_nw_agent_client_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = *(void *)(v2 + 24);
    if (v3)
    {
      unsigned int v4 = *(void (**)(void))(v3 + 8);
      if (v4)
      {
        v4();
        return;
      }
    }
  }
  BOOL v5 = __nwlog_obj();
  uint64_t v6 = *(void *)(a1 + 32);
  long long v7 = "invalid";
  if (v6)
  {
    id v8 = *(const char **)(v6 + 16);
    if (v8) {
      long long v7 = v8;
    }
  }
  *(_DWORD *)buf = 136446466;
  __int16 v31 = "-[NWConcrete_nw_agent_client dealloc]_block_invoke";
  __int16 v32 = 2082;
  __int16 v33 = v7;
  id v9 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v28 = 0;
  if (__nwlog_fault(v9, &type, &v28))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      id v10 = __nwlog_obj();
      os_log_type_t v11 = type;
      if (os_log_type_enabled(v10, type))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        uint64_t v13 = "invalid";
        if (v12)
        {
          uint64_t v14 = *(const char **)(v12 + 16);
          if (v14) {
            uint64_t v13 = v14;
          }
        }
        *(_DWORD *)buf = 136446466;
        __int16 v31 = "-[NWConcrete_nw_agent_client dealloc]_block_invoke";
        __int16 v32 = 2082;
        __int16 v33 = v13;
        _os_log_impl(&dword_1830D4000, v10, v11, "%{public}s protocol %{public}s has invalid remove_input_handler callback", buf, 0x16u);
      }
    }
    else if (v28)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      id v10 = __nwlog_obj();
      os_log_type_t v16 = type;
      BOOL v17 = os_log_type_enabled(v10, type);
      if (backtrace_string)
      {
        if (v17)
        {
          uint64_t v18 = *(void *)(a1 + 32);
          uint64_t v19 = "invalid";
          if (v18)
          {
            int v20 = *(const char **)(v18 + 16);
            if (v20) {
              uint64_t v19 = v20;
            }
          }
          *(_DWORD *)buf = 136446722;
          __int16 v31 = "-[NWConcrete_nw_agent_client dealloc]_block_invoke";
          __int16 v32 = 2082;
          __int16 v33 = v19;
          __int16 v34 = 2082;
          __int16 v35 = backtrace_string;
          _os_log_impl(&dword_1830D4000, v10, v16, "%{public}s protocol %{public}s has invalid remove_input_handler callback, dumping backtrace:%{public}s", buf, 0x20u);
        }

        free(backtrace_string);
        goto LABEL_38;
      }
      if (v17)
      {
        uint64_t v25 = *(void *)(a1 + 32);
        uint64_t v26 = "invalid";
        if (v25)
        {
          __int16 v27 = *(const char **)(v25 + 16);
          if (v27) {
            uint64_t v26 = v27;
          }
        }
        *(_DWORD *)buf = 136446466;
        __int16 v31 = "-[NWConcrete_nw_agent_client dealloc]_block_invoke";
        __int16 v32 = 2082;
        __int16 v33 = v26;
        _os_log_impl(&dword_1830D4000, v10, v16, "%{public}s protocol %{public}s has invalid remove_input_handler callback, no backtrace", buf, 0x16u);
      }
    }
    else
    {
      id v10 = __nwlog_obj();
      os_log_type_t v21 = type;
      if (os_log_type_enabled(v10, type))
      {
        uint64_t v22 = *(void *)(a1 + 32);
        char v23 = "invalid";
        if (v22)
        {
          int v24 = *(const char **)(v22 + 16);
          if (v24) {
            char v23 = v24;
          }
        }
        *(_DWORD *)buf = 136446466;
        __int16 v31 = "-[NWConcrete_nw_agent_client dealloc]_block_invoke";
        __int16 v32 = 2082;
        __int16 v33 = v23;
        _os_log_impl(&dword_1830D4000, v10, v21, "%{public}s protocol %{public}s has invalid remove_input_handler callback, backtrace limit exceeded", buf, 0x16u);
      }
    }
  }
LABEL_38:
  if (v9) {
    free(v9);
  }
}

void __53__NWConcrete_nw_endpoint_flow_updatePathWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1)
  {
    uint64_t v3 = v1;
    uint64_t v4 = v3[29];

    if (v4 == 2)
    {
      BOOL v5 = *(void **)(a1 + 32);
      nw_endpoint_flow_failed_with_error(v5, 1, 0);
    }
    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      uint64_t v6 = (id)gLogObj;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        if (v4 > 5) {
          long long v7 = "unknown-mode";
        }
        else {
          long long v7 = off_1E523FB08[v4];
        }
        *(_DWORD *)buf = 136446722;
        uint64_t v19 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]_block_invoke";
        __int16 v20 = 2082;
        os_log_type_t v21 = (void *)v7;
        __int16 v22 = 2082;
        char v23 = "flow";
        _os_log_impl(&dword_1830D4000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s Handler is in mode %{public}s, expected %{public}s", buf, 0x20u);
      }
    }
    return;
  }
  id v8 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  uint64_t v19 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]_block_invoke";
  id v9 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v16 = 0;
  if (__nwlog_fault(v9, &type, &v16))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      id v10 = __nwlog_obj();
      os_log_type_t v11 = type;
      if (os_log_type_enabled(v10, type))
      {
        *(_DWORD *)buf = 136446210;
        uint64_t v19 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]_block_invoke";
        _os_log_impl(&dword_1830D4000, v10, v11, "%{public}s called with null handler", buf, 0xCu);
      }
    }
    else if (v16)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      id v10 = __nwlog_obj();
      os_log_type_t v13 = type;
      BOOL v14 = os_log_type_enabled(v10, type);
      if (backtrace_string)
      {
        if (v14)
        {
          *(_DWORD *)buf = 136446466;
          uint64_t v19 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]_block_invoke";
          __int16 v20 = 2082;
          os_log_type_t v21 = backtrace_string;
          _os_log_impl(&dword_1830D4000, v10, v13, "%{public}s called with null handler, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_29;
      }
      if (v14)
      {
        *(_DWORD *)buf = 136446210;
        uint64_t v19 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]_block_invoke";
        _os_log_impl(&dword_1830D4000, v10, v13, "%{public}s called with null handler, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      id v10 = __nwlog_obj();
      os_log_type_t v15 = type;
      if (os_log_type_enabled(v10, type))
      {
        *(_DWORD *)buf = 136446210;
        uint64_t v19 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]_block_invoke";
        _os_log_impl(&dword_1830D4000, v10, v15, "%{public}s called with null handler, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }
LABEL_29:
  if (v9) {
    free(v9);
  }
}

void __53__NWConcrete_nw_endpoint_flow_updatePathWithHandler___block_invoke_7(uint64_t a1)
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void **)(a1 + 32);
  if (!v1)
  {
    __int16 v35 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v67 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]_block_invoke";
    uint64_t v36 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v64 = 0;
    if (__nwlog_fault(v36, &type, &v64))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __int16 v37 = __nwlog_obj();
        os_log_type_t v38 = type;
        if (os_log_type_enabled(v37, type))
        {
          *(_DWORD *)buf = 136446210;
          v67 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]_block_invoke";
          _os_log_impl(&dword_1830D4000, v37, v38, "%{public}s called with null handler", buf, 0xCu);
        }
      }
      else if (v64)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __int16 v37 = __nwlog_obj();
        os_log_type_t v40 = type;
        BOOL v41 = os_log_type_enabled(v37, type);
        if (backtrace_string)
        {
          if (v41)
          {
            *(_DWORD *)buf = 136446466;
            v67 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]_block_invoke";
            __int16 v68 = 2082;
            v69 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v37, v40, "%{public}s called with null handler, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_57;
        }
        if (v41)
        {
          *(_DWORD *)buf = 136446210;
          v67 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]_block_invoke";
          _os_log_impl(&dword_1830D4000, v37, v40, "%{public}s called with null handler, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __int16 v37 = __nwlog_obj();
        os_log_type_t v49 = type;
        if (os_log_type_enabled(v37, type))
        {
          *(_DWORD *)buf = 136446210;
          v67 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]_block_invoke";
          _os_log_impl(&dword_1830D4000, v37, v49, "%{public}s called with null handler, backtrace limit exceeded", buf, 0xCu);
        }
      }
    }
LABEL_57:
    if (v36) {
      free(v36);
    }
    return;
  }
  uint64_t v3 = v1;
  uint64_t v4 = v3[29];

  if (v4 != 2)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    char v16 = (id)gLogObj;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      if (v4 > 5) {
        BOOL v17 = "unknown-mode";
      }
      else {
        BOOL v17 = off_1E523FB08[v4];
      }
      *(_DWORD *)buf = 136446722;
      v67 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]_block_invoke";
      __int16 v68 = 2082;
      v69 = (void *)v17;
      __int16 v70 = 2082;
      uint32_t v71 = "flow";
      _os_log_impl(&dword_1830D4000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s Handler is in mode %{public}s, expected %{public}s", buf, 0x20u);
    }
    goto LABEL_26;
  }
  if (nw_endpoint_handler_get_state(*(void **)(a1 + 32)) != 2
    || (*(unsigned char *)(*(void *)(a1 + 40) + 33) & 4) != 0)
  {
    int minimize_logging = nw_endpoint_handler_get_minimize_logging(*(void **)(a1 + 32));
    char logging_disabled = nw_endpoint_handler_get_logging_disabled(*(void **)(a1 + 32));
    if (minimize_logging)
    {
      if (logging_disabled) {
        return;
      }
      if (__nwlog_connection_log::onceToken != -1) {
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
      }
      __int16 v20 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        id_string = nw_endpoint_handler_get_id_string(*(void **)(a1 + 32));
        v43 = nw_endpoint_handler_dry_run_string(*(void **)(a1 + 32));
        nw_endpoint_t v44 = nw_endpoint_handler_copy_endpoint(*(void **)(a1 + 32));
        logging_description = nw_endpoint_get_logging_description(v44);
        size_t v46 = nw_endpoint_handler_state_string(*(void **)(a1 + 32));
        BOOL v47 = nw_endpoint_handler_mode_string(*(void **)(a1 + 32));
        id v48 = nw_endpoint_handler_copy_current_path(*(void **)(a1 + 32));
        *(_DWORD *)buf = 136447746;
        v67 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]_block_invoke";
        __int16 v68 = 2082;
        v69 = (void *)id_string;
        __int16 v70 = 2082;
        uint32_t v71 = v43;
        __int16 v72 = 2082;
        v73 = logging_description;
        __int16 v74 = 2082;
        v75 = v46;
        __int16 v76 = 2082;
        v77 = v47;
        __int16 v78 = 2114;
        id v79 = v48;
        _os_log_impl(&dword_1830D4000, v20, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] flow is no longer in progress, not resetting for better path", buf, 0x48u);
      }
    }
    else
    {
      if (logging_disabled) {
        return;
      }
      if (__nwlog_connection_log::onceToken != -1) {
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
      }
      __int16 v20 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        os_log_type_t v21 = nw_endpoint_handler_get_id_string(*(void **)(a1 + 32));
        __int16 v22 = nw_endpoint_handler_dry_run_string(*(void **)(a1 + 32));
        nw_endpoint_t v23 = nw_endpoint_handler_copy_endpoint(*(void **)(a1 + 32));
        uint64_t v24 = nw_endpoint_get_logging_description(v23);
        uint64_t v25 = nw_endpoint_handler_state_string(*(void **)(a1 + 32));
        uint64_t v26 = nw_endpoint_handler_mode_string(*(void **)(a1 + 32));
        id v27 = nw_endpoint_handler_copy_current_path(*(void **)(a1 + 32));
        *(_DWORD *)buf = 136447746;
        v67 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]_block_invoke";
        __int16 v68 = 2082;
        v69 = (void *)v21;
        __int16 v70 = 2082;
        uint32_t v71 = v22;
        __int16 v72 = 2082;
        v73 = v24;
        __int16 v74 = 2082;
        v75 = v25;
        __int16 v76 = 2082;
        v77 = v26;
        __int16 v78 = 2114;
        id v79 = v27;
        _os_log_impl(&dword_1830D4000, v20, OS_LOG_TYPE_INFO, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] flow is no longer in progress, not resetting for better path", buf, 0x48u);
      }
    }
    goto LABEL_69;
  }
  int has_better_path = nw_endpoint_handler_get_has_better_path(*(NWConcrete_nw_endpoint_handler **)(a1 + 32), 1);
  int v6 = nw_endpoint_handler_get_minimize_logging(*(void **)(a1 + 32));
  char v7 = nw_endpoint_handler_get_logging_disabled(*(void **)(a1 + 32));
  if (has_better_path)
  {
    if (v6)
    {
      if (v7) {
        goto LABEL_13;
      }
      if (__nwlog_connection_log::onceToken != -1) {
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
      }
      id v8 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        id v50 = nw_endpoint_handler_get_id_string(*(void **)(a1 + 32));
        id v51 = nw_endpoint_handler_dry_run_string(*(void **)(a1 + 32));
        nw_endpoint_t v52 = nw_endpoint_handler_copy_endpoint(*(void **)(a1 + 32));
        v53 = nw_endpoint_get_logging_description(v52);
        v54 = nw_endpoint_handler_state_string(*(void **)(a1 + 32));
        uint64_t v55 = nw_endpoint_handler_mode_string(*(void **)(a1 + 32));
        id v56 = nw_endpoint_handler_copy_current_path(*(void **)(a1 + 32));
        *(_DWORD *)buf = 136447746;
        v67 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]_block_invoke";
        __int16 v68 = 2082;
        v69 = (void *)v50;
        __int16 v70 = 2082;
        uint32_t v71 = v51;
        __int16 v72 = 2082;
        v73 = v53;
        __int16 v74 = 2082;
        v75 = v54;
        __int16 v76 = 2082;
        v77 = v55;
        __int16 v78 = 2114;
        id v79 = v56;
        _os_log_impl(&dword_1830D4000, v8, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] better path detected during establishment, resetting", buf, 0x48u);
      }
    }
    else
    {
      if (v7)
      {
LABEL_13:
        nw_endpoint_flow_failed_with_error(*(void **)(a1 + 32), 1, 0);
        return;
      }
      if (__nwlog_connection_log::onceToken != -1) {
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
      }
      id v8 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = nw_endpoint_handler_get_id_string(*(void **)(a1 + 32));
        id v10 = nw_endpoint_handler_dry_run_string(*(void **)(a1 + 32));
        nw_endpoint_t v11 = nw_endpoint_handler_copy_endpoint(*(void **)(a1 + 32));
        uint64_t v12 = nw_endpoint_get_logging_description(v11);
        os_log_type_t v13 = nw_endpoint_handler_state_string(*(void **)(a1 + 32));
        BOOL v14 = nw_endpoint_handler_mode_string(*(void **)(a1 + 32));
        id v15 = nw_endpoint_handler_copy_current_path(*(void **)(a1 + 32));
        *(_DWORD *)buf = 136447746;
        v67 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]_block_invoke";
        __int16 v68 = 2082;
        v69 = (void *)v9;
        __int16 v70 = 2082;
        uint32_t v71 = v10;
        __int16 v72 = 2082;
        v73 = v12;
        __int16 v74 = 2082;
        v75 = v13;
        __int16 v76 = 2082;
        v77 = v14;
        __int16 v78 = 2114;
        id v79 = v15;
        _os_log_impl(&dword_1830D4000, v8, OS_LOG_TYPE_INFO, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] better path detected during establishment, resetting", buf, 0x48u);
      }
    }

    goto LABEL_13;
  }
  if (v6)
  {
    if (v7) {
      return;
    }
    if (__nwlog_connection_log::onceToken != -1) {
      dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
    }
    __int16 v20 = (id)gconnectionLogObj;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v57 = nw_endpoint_handler_get_id_string(*(void **)(a1 + 32));
      uint64_t v58 = nw_endpoint_handler_dry_run_string(*(void **)(a1 + 32));
      nw_endpoint_t v59 = nw_endpoint_handler_copy_endpoint(*(void **)(a1 + 32));
      v60 = nw_endpoint_get_logging_description(v59);
      os_log_type_t v61 = nw_endpoint_handler_state_string(*(void **)(a1 + 32));
      BOOL v62 = nw_endpoint_handler_mode_string(*(void **)(a1 + 32));
      id v63 = nw_endpoint_handler_copy_current_path(*(void **)(a1 + 32));
      *(_DWORD *)buf = 136447746;
      v67 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]_block_invoke";
      __int16 v68 = 2082;
      v69 = (void *)v57;
      __int16 v70 = 2082;
      uint32_t v71 = v58;
      __int16 v72 = 2082;
      v73 = v60;
      __int16 v74 = 2082;
      v75 = v61;
      __int16 v76 = 2082;
      v77 = v62;
      __int16 v78 = 2114;
      id v79 = v63;
      _os_log_impl(&dword_1830D4000, v20, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] parent does not have better path, not resetting", buf, 0x48u);
    }
LABEL_69:

    return;
  }
  if ((v7 & 1) == 0)
  {
    if (__nwlog_connection_log::onceToken != -1) {
      dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_28);
    }
    char v16 = (id)gconnectionLogObj;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      char v28 = nw_endpoint_handler_get_id_string(*(void **)(a1 + 32));
      __int16 v29 = nw_endpoint_handler_dry_run_string(*(void **)(a1 + 32));
      nw_endpoint_t v30 = nw_endpoint_handler_copy_endpoint(*(void **)(a1 + 32));
      __int16 v31 = nw_endpoint_get_logging_description(v30);
      __int16 v32 = nw_endpoint_handler_state_string(*(void **)(a1 + 32));
      __int16 v33 = nw_endpoint_handler_mode_string(*(void **)(a1 + 32));
      id v34 = nw_endpoint_handler_copy_current_path(*(void **)(a1 + 32));
      *(_DWORD *)buf = 136447746;
      v67 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]_block_invoke";
      __int16 v68 = 2082;
      v69 = (void *)v28;
      __int16 v70 = 2082;
      uint32_t v71 = v29;
      __int16 v72 = 2082;
      v73 = v31;
      __int16 v74 = 2082;
      v75 = v32;
      __int16 v76 = 2082;
      v77 = v33;
      __int16 v78 = 2114;
      id v79 = v34;
      _os_log_impl(&dword_1830D4000, v16, OS_LOG_TYPE_INFO, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] parent does not have better path, not resetting", buf, 0x48u);
    }
LABEL_26:
  }
}

uint64_t __36__NWConcrete_nw_association_dealloc__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = nw_hash_node_get_object(a2);
  uint64_t extra = (uint64_t *)nw_hash_node_get_extra(a2);
  uint64_t v6 = extra[5];
  if (v6) {
    nw_protocol_definition_deallocate_cache_entry(v4, v6);
  }
  nw_context_remove_cache_entry(*(void **)(a1 + 32), extra);
  if (nw_hash_table_remove_node(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), a2)) {
    goto LABEL_11;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  id v7 = (id)gLogObj;
  *(_DWORD *)buf = 136446466;
  uint64_t v19 = "-[NWConcrete_nw_association dealloc]_block_invoke_2";
  __int16 v20 = 2048;
  uint64_t v21 = a2;
  id v8 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v16 = 0;
  if (__nwlog_fault(v8, &type, &v16))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v9 = (id)gLogObj;
      os_log_type_t v10 = type;
      if (os_log_type_enabled(v9, type))
      {
        *(_DWORD *)buf = 136446466;
        uint64_t v19 = "-[NWConcrete_nw_association dealloc]_block_invoke";
        __int16 v20 = 2048;
        uint64_t v21 = a2;
        _os_log_impl(&dword_1830D4000, v9, v10, "%{public}s Association failed to remove cache entry for node %p", buf, 0x16u);
      }
    }
    else if (v16)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v9 = (id)gLogObj;
      os_log_type_t v13 = type;
      BOOL v14 = os_log_type_enabled(v9, type);
      if (backtrace_string)
      {
        if (v14)
        {
          *(_DWORD *)buf = 136446722;
          uint64_t v19 = "-[NWConcrete_nw_association dealloc]_block_invoke";
          __int16 v20 = 2048;
          uint64_t v21 = a2;
          __int16 v22 = 2082;
          nw_endpoint_t v23 = backtrace_string;
          _os_log_impl(&dword_1830D4000, v9, v13, "%{public}s Association failed to remove cache entry for node %p, dumping backtrace:%{public}s", buf, 0x20u);
        }

        free(backtrace_string);
        if (v8) {
          goto LABEL_10;
        }
        goto LABEL_11;
      }
      if (v14)
      {
        *(_DWORD *)buf = 136446466;
        uint64_t v19 = "-[NWConcrete_nw_association dealloc]_block_invoke";
        __int16 v20 = 2048;
        uint64_t v21 = a2;
        _os_log_impl(&dword_1830D4000, v9, v13, "%{public}s Association failed to remove cache entry for node %p, no backtrace", buf, 0x16u);
      }
    }
    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      id v9 = (id)gLogObj;
      os_log_type_t v15 = type;
      if (os_log_type_enabled(v9, type))
      {
        *(_DWORD *)buf = 136446466;
        uint64_t v19 = "-[NWConcrete_nw_association dealloc]_block_invoke";
        __int16 v20 = 2048;
        uint64_t v21 = a2;
        _os_log_impl(&dword_1830D4000, v9, v15, "%{public}s Association failed to remove cache entry for node %p, backtrace limit exceeded", buf, 0x16u);
      }
    }
  }
  if (v8) {
LABEL_10:
  }
    free(v8);
LABEL_11:

  return 1;
}

@end