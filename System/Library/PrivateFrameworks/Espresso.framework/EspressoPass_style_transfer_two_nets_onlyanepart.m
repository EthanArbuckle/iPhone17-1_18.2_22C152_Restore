@interface EspressoPass_style_transfer_two_nets_onlyanepart
- (BOOL)runOnNetwork:(void *)a3;
@end

@implementation EspressoPass_style_transfer_two_nets_onlyanepart

- (BOOL)runOnNetwork:(void *)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v4 = (Espresso *)operator new(0x30uLL);
  *((void *)v4 + 1) = 0;
  *((void *)v4 + 2) = 0;
  *(void *)v4 = &unk_1EE3896F0;
  v5 = (void *)((char *)v4 + 24);
  *((void *)v4 + 4) = 0;
  *((void *)v4 + 5) = 0;
  *((void *)v4 + 3) = &unk_1EE36BA88;
  v7 = Espresso::espresso_os_log_subsystem(v4, v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    unint64_t v12 = (unint64_t)"N8Espresso40pass_style_transfer_two_nets_onlyanepartE" & 0x7FFFFFFFFFFFFFFFLL;
    _os_log_debug_impl(&dword_1920CB000, v7, OS_LOG_TYPE_DEBUG, "run_pass_on_network %s", buf, 0xCu);
  }

  (*(void (**)(uint8_t *__return_ptr, void *, void *))(*v5 + 24))(buf, v5, a3);
  char v10 = 0;
  (*(void (**)(void *, char *))(*v5 + 16))(v5, &v10);
  if (v10)
  {
    if (buf[0]) {
      Espresso::net::set_analysis<Espresso::analysis_result>((uint64_t)a3, (unint64_t *)((char *)&v12 + 4));
    }
    else {
      std::__hash_table<std::__hash_value_type<std::type_index,std::shared_ptr<Espresso::analysis_result>>,std::__unordered_map_hasher<std::type_index,std::__hash_value_type<std::type_index,std::shared_ptr<Espresso::analysis_result>>,std::hash<std::type_index>,std::equal_to<std::type_index>,true>,std::__unordered_map_equal<std::type_index,std::__hash_value_type<std::type_index,std::shared_ptr<Espresso::analysis_result>>,std::equal_to<std::type_index>,std::hash<std::type_index>,true>,std::allocator<std::__hash_value_type<std::type_index,std::shared_ptr<Espresso::analysis_result>>>>::__erase_unique<std::type_index>((uint64_t *)a3 + 140, (uint64_t)"N8Espresso32analysis_style_transfer_two_netsE");
    }
  }
  int v8 = buf[0];
  if (v13) {
    nitro::nitro_function::nitro_function(v13);
  }
  nitro::nitro_function::nitro_function((std::__shared_weak_count *)v4);
  return v8 != 0;
}

@end