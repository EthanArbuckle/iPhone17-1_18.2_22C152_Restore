@interface HSPreferenceStage
- (HSPreferenceStage)initWithUserDefaults:(id)a3 domain:(id)a4;
- (id).cxx_construct;
- (uint64_t)_loadPreferences;
- (void)_loadPreferences;
- (void)_savePreferences;
- (void)_updatePrefStages;
- (void)restorePreferences;
- (void)stage:(id)a3 postedNotification:(id)a4;
@end

@implementation HSPreferenceStage

- (HSPreferenceStage)initWithUserDefaults:(id)a3 domain:(id)a4
{
  id v14 = self;
  SEL v13 = a2;
  id location = 0;
  objc_storeStrong(&location, a3);
  id v11 = 0;
  objc_storeStrong(&v11, a4);
  if (!location)
  {
    v8 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v8 handleFailureInMethod:v13, v14, @"HSPreferenceStage.mm", 26, @"Invalid parameter not satisfying: %@", @"defaults" object file lineNumber description];
  }
  if (!v11)
  {
    v7 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v7 handleFailureInMethod:v13, v14, @"HSPreferenceStage.mm", 27, @"Invalid parameter not satisfying: %@", @"domain" object file lineNumber description];
  }
  id v4 = v14;
  id v14 = 0;
  v10.receiver = v4;
  v10.super_class = (Class)HSPreferenceStage;
  v6 = [(HSStage *)&v10 init];
  id v14 = v6;
  objc_storeStrong(&v14, v6);
  if (v6)
  {
    objc_storeStrong((id *)v14 + 15, location);
    objc_storeStrong((id *)v14 + 16, v11);
    v15 = (HSPreferenceStage *)v14;
  }
  else
  {
    v15 = 0;
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v14, 0);
  return v15;
}

- (void)stage:(id)a3 postedNotification:(id)a4
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  HSUtil::ObjectLock::ObjectLock((uint64_t)v5, v8);
  if (!v8->_state.ignoreNotifications
    && ([v6 isEqual:HSPreferenceChangedNotification] & 1) != 0)
  {
    [(HSPreferenceStage *)v8 _savePreferences];
  }
  HSUtil::ObjectLock::~ObjectLock(v5);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)restorePreferences
{
  v3 = self;
  v2[2] = (id)a2;
  HSUtil::ObjectLock::ObjectLock((uint64_t)v2, self);
  [(HSPreferenceStage *)v3 _loadPreferences];
  HSUtil::ObjectLock::~ObjectLock(v2);
}

- (void)_updatePrefStages
{
  id v14 = self;
  SEL v13 = a2;
  p_prefStages = &self->_state.prefStages;
  id v11 = (void *)std::unordered_set<objc_object  {objcproto15HSStageObserver}* {__weak},HSUtil::ObjectHasher,std::equal_to<objc_object  {objcproto15HSStageObserver}*>,std::allocator<objc_object  {objcproto15HSStageObserver}*>>::begin[abi:ne180100]((uint64_t)&self->_state.prefStages);
  uint64_t v10 = std::unordered_set<HSStage * {__strong},HSUtil::ObjectHasher,std::equal_to<HSStage * {__strong}>,std::allocator<HSStage * {__strong}>>::end[abi:ne180100]((uint64_t)p_prefStages);
  while (std::operator!=[abi:ne180100](&v11, &v10))
  {
    v2 = (id *)std::__hash_const_iterator<std::__hash_node<objc_object  {objcproto15HSStageObserver}* {__weak},void *> *>::operator*[abi:ne180100]();
    id location = objc_loadWeakRetained(v2);
    [location removeStageObserver:v14];
    objc_storeStrong(&location, 0);
    std::__hash_const_iterator<std::__hash_node<objc_object  {objcproto15HSStageObserver}* {__weak},void *> *>::operator++[abi:ne180100](&v11);
  }
  std::unordered_set<HSStage  {objcproto15HSPreferencable}* {__weak},HSUtil::ObjectHasher,std::equal_to<HSStage  {objcproto15HSPreferencable}* {__weak}>,std::allocator<HSStage  {objcproto15HSPreferencable}* {__weak}>>::clear[abi:ne180100]((uint64_t)&v14->_state.prefStages);
  std::unordered_set<HSStage * {__strong},HSUtil::ObjectHasher,std::equal_to<HSStage * {__strong}>,std::allocator<HSStage * {__strong}>>::unordered_set[abi:ne180100]((uint64_t)v8);
  collectStages((uint64_t)v8, v14);
  v7[1] = v8;
  v7[0] = (void *)std::unordered_set<objc_object  {objcproto15HSStageObserver}* {__weak},HSUtil::ObjectHasher,std::equal_to<objc_object  {objcproto15HSStageObserver}*>,std::allocator<objc_object  {objcproto15HSStageObserver}*>>::begin[abi:ne180100]((uint64_t)v8);
  uint64_t v6 = std::unordered_set<HSStage * {__strong},HSUtil::ObjectHasher,std::equal_to<HSStage * {__strong}>,std::allocator<HSStage * {__strong}>>::end[abi:ne180100]((uint64_t)v8);
  while (std::operator!=[abi:ne180100](v7, &v6))
  {
    id val = *(id *)std::__hash_const_iterator<std::__hash_node<objc_object  {objcproto15HSStageObserver}* {__weak},void *> *>::operator*[abi:ne180100]();
    if ([val conformsToProtocol:&OBJC_PROTOCOL___HSPreferencable])
    {
      [val addStageObserver:v14];
      v3 = &v14->_state.prefStages;
      objc_initWeak(&v4, val);
      std::unordered_set<HSStage  {objcproto15HSPreferencable}* {__weak},HSUtil::ObjectHasher,std::equal_to<HSStage  {objcproto15HSPreferencable}* {__weak}>,std::allocator<HSStage  {objcproto15HSPreferencable}* {__weak}>>::insert[abi:ne180100]((uint64_t)v3, &v4);
      objc_destroyWeak(&v4);
    }
    objc_storeStrong(&val, 0);
    std::__hash_const_iterator<std::__hash_node<objc_object  {objcproto15HSStageObserver}* {__weak},void *> *>::operator++[abi:ne180100](v7);
  }
  std::unordered_set<HSStage * {__strong},HSUtil::ObjectHasher,std::equal_to<HSStage * {__strong}>,std::allocator<HSStage * {__strong}>>::~unordered_set[abi:ne180100]((uint64_t)v8);
}

- (void)_savePreferences
{
  v44 = self;
  v43[2] = a2;
  [(HSPreferenceStage *)self _updatePrefStages];
  v43[1] = &v44->_state.prefStages.__table_.__bucket_list_.__ptr_.__value_;
  v43[0] = (void *)std::unordered_set<objc_object  {objcproto15HSStageObserver}* {__weak},HSUtil::ObjectHasher,std::equal_to<objc_object  {objcproto15HSStageObserver}*>,std::allocator<objc_object  {objcproto15HSStageObserver}*>>::begin[abi:ne180100]((uint64_t)&v44->_state.prefStages);
  uint64_t v42 = std::unordered_set<HSStage * {__strong},HSUtil::ObjectHasher,std::equal_to<HSStage * {__strong}>,std::allocator<HSStage * {__strong}>>::end[abi:ne180100]((uint64_t)&v44->_state.prefStages);
  while (std::operator!=[abi:ne180100](v43, &v42))
  {
    v2 = (id *)std::__hash_const_iterator<std::__hash_node<objc_object  {objcproto15HSStageObserver}* {__weak},void *> *>::operator*[abi:ne180100]();
    id WeakRetained = objc_loadWeakRetained(v2);
    id v40 = [WeakRetained preferences];
    BOOL v39 = v40 != 0;
    if (v40)
    {
      id v34 = [WeakRetained name];
      BOOL v33 = v34 != 0;
      if (v34)
      {
        v15 = [(NSUserDefaults *)v44->_defaults dictionaryForKey:v44->_domain];
        id v29 = [(NSDictionary *)v15 mutableCopy];

        if (!v29)
        {
          id v14 = objc_opt_new();
          id v3 = v29;
          id v29 = v14;
        }
        id v28 = [v29 objectForKeyedSubscript:v34];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          objc_storeStrong(&v28, 0);
        }
        id v27 = [v28 mutableCopy];
        if (!v27)
        {
          SEL v13 = objc_opt_new();
          id v4 = v27;
          id v27 = v13;
        }
        memset(__b, 0, sizeof(__b));
        id obj = v40;
        id v12 = [obj countByEnumeratingWithState:__b objects:v47 count:16];
        if (v12)
        {
          uint64_t v8 = *(void *)__b[2];
          uint64_t v9 = 0;
          id v10 = v12;
          while (1)
          {
            uint64_t v7 = v9;
            if (*(void *)__b[2] != v8) {
              objc_enumerationMutation(obj);
            }
            id v26 = *(id *)(__b[1] + 8 * v9);
            id v24 = *((id *)v26 + 1);
            BOOL v23 = v24 != 0;
            if (v24)
            {
              id v5 = [WeakRetained preferenceValueForKey:*((void *)v26 + 1)];
              objc_msgSend(v27, "setObject:forKeyedSubscript:");

              int v35 = 0;
            }
            else
            {
              v22 = 0;
              v22 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSPreferenceStage.mm", v46);
              os_log_t oslog = &_os_log_default;
              if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
              {
                uint64_t v6 = oslog;
                __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v45, (uint64_t)"-[HSPreferenceStage _savePreferences]", (uint64_t)v22, 97, (uint64_t)"key");
                _os_log_error_impl(&def_411C8, v6, OS_LOG_TYPE_ERROR, "Assertion failed (%s @ %s:%ju): %s", v45, 0x2Au);
              }
              objc_storeStrong((id *)&oslog, 0);
              int v35 = 5;
            }
            objc_storeStrong(&v24, 0);
            if (!v35) {
              int v35 = 0;
            }
            objc_storeStrong(&v26, 0);
            ++v9;
            if (v7 + 1 >= (unint64_t)v10)
            {
              uint64_t v9 = 0;
              id v10 = [obj countByEnumeratingWithState:__b objects:v47 count:16];
              if (!v10) {
                break;
              }
            }
          }
        }

        [v29 setObject:v27 forKeyedSubscript:v34];
        [(NSUserDefaults *)v44->_defaults setObject:v29 forKey:v44->_domain];
        objc_storeStrong(&v27, 0);
        objc_storeStrong(&v28, 0);
        objc_storeStrong(&v29, 0);
        int v35 = 0;
      }
      else
      {
        v32 = 0;
        v32 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSPreferenceStage.mm", v49);
        id v31 = &_os_log_default;
        os_log_type_t v30 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_ERROR))
        {
          v16 = v31;
          os_log_type_t v17 = v30;
          __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v48, (uint64_t)"-[HSPreferenceStage _savePreferences]", (uint64_t)v32, 85, (uint64_t)"stageName");
          _os_log_error_impl(&def_411C8, v16, v17, "Assertion failed (%s @ %s:%ju): %s", v48, 0x2Au);
        }
        objc_storeStrong(&v31, 0);
        int v35 = 3;
      }
      objc_storeStrong(&v34, 0);
    }
    else
    {
      v38 = 0;
      v38 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSPreferenceStage.mm", v51);
      id location = &_os_log_default;
      os_log_type_t type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
      {
        log = location;
        os_log_type_t v19 = type;
        __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v50, (uint64_t)"-[HSPreferenceStage _savePreferences]", (uint64_t)v38, 82, (uint64_t)"prefs");
        _os_log_error_impl(&def_411C8, log, v19, "Assertion failed (%s @ %s:%ju): %s", v50, 0x2Au);
      }
      objc_storeStrong(&location, 0);
      int v35 = 3;
    }
    objc_storeStrong(&v40, 0);
    if (!v35) {
      int v35 = 0;
    }
    objc_storeStrong(&WeakRetained, 0);
    std::__hash_const_iterator<std::__hash_node<objc_object  {objcproto15HSStageObserver}* {__weak},void *> *>::operator++[abi:ne180100](v43);
  }
}

- (void)_loadPreferences
{
  uint64_t v42 = self;
  v41[1] = a2;
  ++self->_state.ignoreNotifications;
  id v40 = &v42;
  HSUtil::Defer<HSUtil::Connection::_readThread(void)::{lambda(void)#1}>(&v40, v41);
  [(HSPreferenceStage *)v42 _updatePrefStages];
  p_prefStages = &v42->_state.prefStages;
  v38 = (void *)std::unordered_set<objc_object  {objcproto15HSStageObserver}* {__weak},HSUtil::ObjectHasher,std::equal_to<objc_object  {objcproto15HSStageObserver}*>,std::allocator<objc_object  {objcproto15HSStageObserver}*>>::begin[abi:ne180100]((uint64_t)&v42->_state.prefStages);
  uint64_t v37 = std::unordered_set<HSStage * {__strong},HSUtil::ObjectHasher,std::equal_to<HSStage * {__strong}>,std::allocator<HSStage * {__strong}>>::end[abi:ne180100]((uint64_t)p_prefStages);
  while (std::operator!=[abi:ne180100](&v38, &v37))
  {
    id location = (id *)std::__hash_const_iterator<std::__hash_node<objc_object  {objcproto15HSStageObserver}* {__weak},void *> *>::operator*[abi:ne180100]();
    id WeakRetained = objc_loadWeakRetained(location);
    id v35 = [WeakRetained preferences];
    BOOL v34 = v35 != 0;
    if (v35)
    {
      id v29 = [WeakRetained name];
      BOOL v28 = v29 != 0;
      if (v29)
      {
        id v24 = [(NSUserDefaults *)v42->_defaults dictionaryForKey:v42->_domain];
        id v23 = [v24 objectForKeyedSubscript:v29];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          objc_storeStrong(&v23, 0);
        }
        memset(__b, 0, sizeof(__b));
        id obj = v35;
        id v10 = [obj countByEnumeratingWithState:__b objects:v45 count:16];
        if (v10)
        {
          uint64_t v6 = *(void *)__b[2];
          uint64_t v7 = 0;
          id v8 = v10;
          while (1)
          {
            uint64_t v5 = v7;
            if (*(void *)__b[2] != v6) {
              objc_enumerationMutation(obj);
            }
            id v22 = *(id *)(__b[1] + 8 * v7);
            id v20 = *((id *)v22 + 1);
            BOOL v19 = v20 != 0;
            if (v20)
            {
              id v3 = WeakRetained;
              id v2 = [v23 objectForKeyedSubscript:v20];
              objc_msgSend(v3, "setPreferenceValue:forKey:");

              int v30 = 0;
            }
            else
            {
              v18 = 0;
              v18 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSPreferenceStage.mm", v44);
              os_log_t oslog = &_os_log_default;
              if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
              {
                id v4 = oslog;
                __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v43, (uint64_t)"-[HSPreferenceStage _loadPreferences]", (uint64_t)v18, 126, (uint64_t)"key");
                _os_log_error_impl(&def_411C8, v4, OS_LOG_TYPE_ERROR, "Assertion failed (%s @ %s:%ju): %s", v43, 0x2Au);
              }
              objc_storeStrong((id *)&oslog, 0);
              int v30 = 5;
            }
            objc_storeStrong(&v20, 0);
            if (!v30) {
              int v30 = 0;
            }
            objc_storeStrong(&v22, 0);
            ++v7;
            if (v5 + 1 >= (unint64_t)v8)
            {
              uint64_t v7 = 0;
              id v8 = [obj countByEnumeratingWithState:__b objects:v45 count:16];
              if (!v8) {
                break;
              }
            }
          }
        }

        objc_storeStrong(&v23, 0);
        objc_storeStrong(&v24, 0);
        int v30 = 0;
      }
      else
      {
        id v27 = 0;
        id v27 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSPreferenceStage.mm", v47);
        id v26 = &_os_log_default;
        os_log_type_t v25 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR))
        {
          id v11 = v26;
          os_log_type_t v12 = v25;
          __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v46, (uint64_t)"-[HSPreferenceStage _loadPreferences]", (uint64_t)v27, 119, (uint64_t)"stageName");
          _os_log_error_impl(&def_411C8, v11, v12, "Assertion failed (%s @ %s:%ju): %s", v46, 0x2Au);
        }
        objc_storeStrong(&v26, 0);
        int v30 = 3;
      }
      objc_storeStrong(&v29, 0);
    }
    else
    {
      BOOL v33 = 0;
      BOOL v33 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSPreferenceStage.mm", v49);
      id v32 = &_os_log_default;
      os_log_type_t type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
      {
        log = v32;
        os_log_type_t v14 = type;
        __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v48, (uint64_t)"-[HSPreferenceStage _loadPreferences]", (uint64_t)v33, 116, (uint64_t)"prefs");
        _os_log_error_impl(&def_411C8, log, v14, "Assertion failed (%s @ %s:%ju): %s", v48, 0x2Au);
      }
      objc_storeStrong(&v32, 0);
      int v30 = 3;
    }
    objc_storeStrong(&v35, 0);
    if (!v30) {
      int v30 = 0;
    }
    objc_storeStrong(&WeakRetained, 0);
    std::__hash_const_iterator<std::__hash_node<objc_object  {objcproto15HSStageObserver}* {__weak},void *> *>::operator++[abi:ne180100](&v38);
  }
  HSUtil::DeferredFn<-[HSPreferenceStage _loadPreferences]::$_0>::~DeferredFn((uint64_t)v41);
}

- (uint64_t)_loadPreferences
{
  return result;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

@end