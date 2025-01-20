@interface AXCCTextSizeHelper
- (AXCCTextSizeDelegate)delegate;
- (AXCCTextSizeHelper)init;
- (BOOL)_isHiddenBundleIdentifier:(id)a3;
- (BOOL)canSelectApps;
- (BOOL)isPerAppAvailable;
- (NSArray)appsIdentifiers;
- (NSArray)appsNames;
- (NSString)appName;
- (NSString)categoryName;
- (id)_selectedAppSafely;
- (int)state;
- (int64_t)appsNumber;
- (void)_refreshForegroundAppInfo;
- (void)_refreshPerAppCategoryName;
- (void)_resetAllPerAppCategoryNames;
- (void)_setPerAppCategoryName:(id)a3;
- (void)_updateSavedAppID:(id)a3 categoryName:(id)a4;
- (void)refreshAppInfo;
- (void)refreshCategoryName;
- (void)setCategoryName:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setState:(int)a3;
@end

@implementation AXCCTextSizeHelper

- (AXCCTextSizeHelper)init
{
  v8.receiver = self;
  v8.super_class = (Class)AXCCTextSizeHelper;
  v2 = [(AXCCTextSizeHelper *)&v8 init];
  if (v2)
  {
    uint64_t v3 = _AXSCopyPreferredContentSizeCategoryNameGlobal();
    categoryName = v2->_categoryName;
    v2->_categoryName = (NSString *)v3;

    uint64_t v5 = objc_opt_new();
    apps = v2->_apps;
    v2->_apps = (NSMutableArray *)v5;

    v2->_state = 3;
  }
  return v2;
}

- (NSString)categoryName
{
  if (self->_state == 3
    || (objc_msgSend__selectedAppSafely(self, a2, v2, v3),
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_objectForKey_(v5, v6, @"categoryName", v7),
        objc_super v8 = (NSString *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v8))
  {
    objc_super v8 = self->_categoryName;
  }

  return v8;
}

- (void)setCategoryName:(id)a3
{
  uint64_t v5 = (const char *)a3;
  uint64_t v7 = (char *)v5;
  if (self->_state == 3)
  {
    _AXSSetPreferredContentSizeCategoryName();
    objc_storeStrong((id *)&self->_categoryName, a3);
  }
  else
  {
    objc_msgSend__setPerAppCategoryName_(self, v5, (uint64_t)v5, v6);
  }
}

- (BOOL)isPerAppAvailable
{
  return objc_msgSend_count(self->_apps, a2, v2, v3) != 0;
}

- (void)setState:(int)a3
{
  if (objc_msgSend_isPerAppAvailable(self, a2, *(uint64_t *)&a3, v3) && self->_state != a3)
  {
    self->_state = a3;
    if (a3 == 3) {
      objc_msgSend__resetAllPerAppCategoryNames(self, v6, v7, v8);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend_perAppTextSizeToggled(WeakRetained, v9, v10, v11);
  }
}

- (BOOL)canSelectApps
{
  return (unint64_t)objc_msgSend_count(self->_apps, a2, v2, v3) > 1;
}

- (int64_t)appsNumber
{
  return objc_msgSend_count(self->_apps, a2, v2, v3);
}

- (NSArray)appsNames
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v4 = self->_apps;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v16, (uint64_t)v20, 16);
  if (v6)
  {
    uint64_t v9 = v6;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v4);
        }
        v12 = objc_msgSend_valueForKey_(*(void **)(*((void *)&v16 + 1) + 8 * i), v7, @"name", v8, (void)v16);
        objc_msgSend_addObject_(v3, v13, (uint64_t)v12, v14);
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v16, (uint64_t)v20, 16);
    }
    while (v9);
  }

  return (NSArray *)v3;
}

- (NSArray)appsIdentifiers
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v4 = self->_apps;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v16, (uint64_t)v20, 16);
  if (v6)
  {
    uint64_t v9 = v6;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v4);
        }
        v12 = objc_msgSend_valueForKey_(*(void **)(*((void *)&v16 + 1) + 8 * i), v7, @"appID", v8, (void)v16);
        objc_msgSend_addObject_(v3, v13, (uint64_t)v12, v14);
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v16, (uint64_t)v20, 16);
    }
    while (v9);
  }

  return (NSArray *)v3;
}

- (NSString)appName
{
  v4 = objc_msgSend__selectedAppSafely(self, a2, v2, v3);
  uint64_t v7 = objc_msgSend_objectForKey_(v4, v5, @"name", v6);

  return (NSString *)v7;
}

- (void)refreshAppInfo
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  objc_msgSend__refreshForegroundAppInfo(self, a2, v2, v3);
  objc_msgSend__refreshPerAppCategoryName(self, v5, v6, v7);
  self->_state = 3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v8 = self->_apps;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v19, (uint64_t)v23, 16);
  if (v10)
  {
    uint64_t v13 = v10;
    int v14 = 0;
    uint64_t v15 = *(void *)v20;
    while (2)
    {
      uint64_t v16 = 0;
      int v17 = v14 + v13;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v8);
        }
        long long v18 = objc_msgSend_valueForKey_(*(void **)(*((void *)&v19 + 1) + 8 * v16), v11, @"categoryName", v12, (void)v19);

        if (v18)
        {
          self->_state = v14 + v16;
          goto LABEL_11;
        }
        ++v16;
      }
      while (v13 != v16);
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v19, (uint64_t)v23, 16);
      int v14 = v17;
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)refreshCategoryName
{
  objc_msgSend__refreshPerAppCategoryName(self, a2, v2, v3);
  uint64_t v5 = (NSString *)_AXSCopyPreferredContentSizeCategoryNameGlobal();
  categoryName = self->_categoryName;
  self->_categoryName = v5;

  MEMORY[0x270F9A758](v5, categoryName);
}

- (BOOL)_isHiddenBundleIdentifier:(id)a3
{
  return ((uint64_t (*)(void *, char *, id))MEMORY[0x270F9A6D0])(&unk_26F4BF280, sel_containsObject_, a3);
}

- (void)_refreshForegroundAppInfo
{
  v88[6] = *MEMORY[0x263EF8340];
  objc_msgSend_removeAllObjects(self->_apps, a2, v2, v3);
  uint64_t v81 = 0;
  v82 = &v81;
  uint64_t v83 = 0x2020000000;
  v4 = (void (*)(void))off_268C8B6C0;
  v84 = off_268C8B6C0;
  if (!off_268C8B6C0)
  {
    v88[0] = MEMORY[0x263EF8330];
    v88[1] = 3221225472;
    v88[2] = sub_24060AF78;
    v88[3] = &unk_2650C7768;
    v88[4] = &v81;
    sub_24060AF78((uint64_t)v88);
    v4 = (void (*)(void))v82[3];
  }
  _Block_object_dispose(&v81, 8);
  if (!v4)
  {
    sub_240615170();
    __break(1u);
  }
  v4();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v77, (uint64_t)v87, 16);
  if (v9)
  {
    uint64_t v10 = *(void *)v78;
    v73 = (void *)((char *)v88 + 4);
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v78 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v77 + 1) + 8 * i);
        objc_msgSend_bundleIdentifier(v12, v6, v7, v8, v73);
        id v16 = (id)objc_claimAutoreleasedReturnValue();
        if (v16 && objc_msgSend_isForeground(v12, v13, v14, v15))
        {
          long long v20 = objc_msgSend_bundleIdentifier(v12, v17, v18, v19);
          char isHiddenBundleIdentifier = objc_msgSend__isHiddenBundleIdentifier_(self, v21, (uint64_t)v20, v22);

          if (isHiddenBundleIdentifier) {
            continue;
          }
          id v24 = objc_alloc(MEMORY[0x263F01878]);
          v28 = objc_msgSend_bundleIdentifier(v12, v25, v26, v27);
          id v76 = 0;
          v30 = objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(v24, v29, (uint64_t)v28, 0, &v76);
          id v16 = v76;

          v34 = objc_msgSend_localizedName(v30, v31, v32, v33);
          LODWORD(v28) = v34 == 0;

          if (v28)
          {
            v47 = AXLogCommon();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
              sub_2406151D8((uint8_t *)v88, v16, v73, v47);
            }
          }
          else
          {
            id v35 = objc_alloc(MEMORY[0x263EFF9A0]);
            v39 = objc_msgSend_bundleIdentifier(v12, v36, v37, v38);
            v86[0] = v39;
            v43 = objc_msgSend_localizedName(v30, v40, v41, v42);
            v86[1] = v43;
            v45 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v44, (uint64_t)v86, 2);
            v47 = objc_msgSend_initWithObjects_forKeys_(v35, v46, (uint64_t)v45, (uint64_t)&unk_26F4BF298);

            objc_msgSend_addObject_(self->_apps, v48, (uint64_t)v47, v49);
          }
        }
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v77, (uint64_t)v87, 16);
    }
    while (v9);
  }
  if (!objc_msgSend_count(self->_apps, v6, v7, v8))
  {
    id v53 = objc_alloc(MEMORY[0x263EFF9A0]);
    v85[0] = @"com.apple.springboard";
    v54 = AXCCLocalizedString(@"home.screen");
    v85[1] = v54;
    v56 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v55, (uint64_t)v85, 2);
    v58 = objc_msgSend_initWithObjects_forKeys_(v53, v57, (uint64_t)v56, (uint64_t)&unk_26F4BF2B0);

    objc_msgSend_addObject_(self->_apps, v59, (uint64_t)v58, v60);
  }
  v61 = objc_msgSend_currentDevice(MEMORY[0x263F82670], v50, v51, v52);
  if (objc_msgSend_userInterfaceIdiom(v61, v62, v63, v64))
  {
  }
  else
  {
    BOOL v68 = (unint64_t)objc_msgSend_count(self->_apps, v65, v66, v67) > 1;

    if (v68)
    {
      v69 = AXLogCommon();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
        sub_240615194(v69);
      }

      objc_msgSend_removeAllObjects(self->_apps, v70, v71, v72);
    }
  }
}

- (void)_refreshPerAppCategoryName
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v2 = self->_apps;
  uint64_t v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v3, (uint64_t)&v15, (uint64_t)v19, 16);
  if (v4)
  {
    uint64_t v7 = v4;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v2);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend_objectForKey_(v10, v5, @"appID", v6, (void)v15);
        uint64_t v14 = (void *)_AXSCopyPreferredContentSizeCategoryNameApp();
        if (v14) {
          objc_msgSend_setValue_forKey_(v10, v12, (uint64_t)v14, @"categoryName");
        }
        else {
          objc_msgSend_removeObjectForKey_(v10, v12, @"categoryName", v13);
        }
      }
      uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v5, (uint64_t)&v15, (uint64_t)v19, 16);
    }
    while (v7);
  }
}

- (id)_selectedAppSafely
{
  uint64_t v5 = objc_msgSend_count(self->_apps, a2, v2, v3);
  if (v5)
  {
    unint64_t state = self->_state;
    if (state == 3)
    {
      uint64_t v5 = 0;
    }
    else
    {
      uint64_t v10 = objc_msgSend_count(self->_apps, v6, v7, v8);
      if (v10 - 1 >= state) {
        objc_msgSend_objectAtIndexedSubscript_(self->_apps, v11, state, v12);
      }
      else {
      uint64_t v5 = objc_msgSend_objectAtIndexedSubscript_(self->_apps, v11, v10 - 1, v12);
      }
    }
  }

  return v5;
}

- (void)_setPerAppCategoryName:(id)a3
{
  uint64_t v20 = (char *)a3;
  uint64_t v7 = objc_msgSend__selectedAppSafely(self, v4, v5, v6);
  uint64_t v10 = objc_msgSend_objectForKey_(v7, v8, @"appID", v9);
  _AXSSetPreferredContentSizeCategoryNameApp();
  if (v20) {
    objc_msgSend_setValue_forKey_(v7, v20, (uint64_t)v20, @"categoryName");
  }
  else {
    objc_msgSend_removeObjectForKey_(v7, 0, @"categoryName", v11);
  }
  objc_msgSend__updateSavedAppID_categoryName_(self, v12, (uint64_t)v10, (uint64_t)v20);
  long long v16 = objc_msgSend_sharedInstance(MEMORY[0x263F22938], v13, v14, v15);
  objc_msgSend_aggregatePerAppSettingsStatistics(v16, v17, v18, v19);
}

- (void)_resetAllPerAppCategoryNames
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v3 = self->_apps;
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v23, (uint64_t)v27, 16);
  if (v5)
  {
    uint64_t v8 = v5;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v3);
        }
        uint64_t v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend_objectForKey_(v11, v6, @"appID", v7, (void)v23);
        _AXSSetPreferredContentSizeCategoryNameApp();
        objc_msgSend_removeObjectForKey_(v11, v13, @"categoryName", v14);
        objc_msgSend__updateSavedAppID_categoryName_(self, v15, (uint64_t)v12, 0);
      }
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v23, (uint64_t)v27, 16);
    }
    while (v8);
  }

  uint64_t v19 = objc_msgSend_sharedInstance(MEMORY[0x263F22938], v16, v17, v18);
  objc_msgSend_aggregatePerAppSettingsStatistics(v19, v20, v21, v22);
}

- (void)_updateSavedAppID:(id)a3 categoryName:(id)a4
{
  id v13 = a3;
  id v8 = a4;
  if (v13)
  {
    uint64_t v9 = objc_msgSend_sharedInstance(MEMORY[0x263F22938], v5, v6, v7);
    uint64_t v12 = v9;
    if (v8) {
      objc_msgSend_addCustomizedAppID_(v9, v10, (uint64_t)v13, v11);
    }
    else {
      objc_msgSend_removeCustomizedAppID_(v9, v10, (uint64_t)v13, v11);
    }
  }
}

- (int)state
{
  return self->_state;
}

- (AXCCTextSizeDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXCCTextSizeDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_apps, 0);

  objc_storeStrong((id *)&self->_categoryName, 0);
}

@end