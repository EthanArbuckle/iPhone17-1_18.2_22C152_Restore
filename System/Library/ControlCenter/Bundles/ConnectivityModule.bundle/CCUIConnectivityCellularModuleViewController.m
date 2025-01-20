@interface CCUIConnectivityCellularModuleViewController
- (CCUIConnectivityCellularModuleViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)_menuItemForCellularPlan:(id)a3;
- (id)indicatorForMenuItem:(id)a3;
- (id)trailingViewForMenuItem:(id)a3;
- (void)_updateCellularMenuItems;
- (void)activeSubscriptionsDidChange;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CCUIConnectivityCellularModuleViewController

- (CCUIConnectivityCellularModuleViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v34.receiver = self;
  v34.super_class = (Class)CCUIConnectivityCellularModuleViewController;
  v4 = [(CCUIAlwaysExpandedMenuModuleViewController *)&v34 initWithNibName:a3 bundle:a4];
  v6 = v4;
  if (v4)
  {
    objc_msgSend_setExpanded_(v4, v5, 1);
    objc_msgSend_setMinimumMenuItems_(v6, v7, 2);
    objc_msgSend_setShouldProvideOwnPlatter_(v6, v8, 1);
    objc_msgSend_setIndentation_(v6, v9, 2);
    objc_msgSend_setUseTrailingInset_(v6, v10, 1);
    objc_msgSend_setVisibleMenuItems_(v6, v11, v12, 2.0);
    v13 = (void *)MEMORY[0x263F1C6B0];
    v14 = (void *)MEMORY[0x263F086E0];
    uint64_t v15 = objc_opt_class();
    v17 = objc_msgSend_bundleForClass_(v14, v16, v15);
    v19 = objc_msgSend_imageNamed_inBundle_(v13, v18, @"CellularDataGlyph", v17);
    v22 = objc_msgSend_imageFlippedForRightToLeftLayoutDirection(v19, v20, v21);
    objc_msgSend_setGlyphImage_(v6, v23, (uint64_t)v22);

    v24 = (void *)MEMORY[0x263F086E0];
    uint64_t v25 = objc_opt_class();
    v27 = objc_msgSend_bundleForClass_(v24, v26, v25);
    v29 = objc_msgSend_localizedStringForKey_value_table_(v27, v28, @"CONTROL_CENTER_STATUS_CELLULAR_DATA_NAME", &stru_26F4C07A8, 0);
    objc_msgSend_setTitle_(v6, v30, (uint64_t)v29);

    v31 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    simIndicatorCache = v6->_simIndicatorCache;
    v6->_simIndicatorCache = v31;
  }
  return v6;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)CCUIConnectivityCellularModuleViewController;
  [(CCUIMenuModuleViewController *)&v5 viewDidLoad];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_240634F58;
  v4[3] = &unk_2650C9380;
  v4[4] = self;
  objc_msgSend_performWithoutAnimation_(MEMORY[0x263F1CB60], v3, (uint64_t)v4);
}

- (void)viewWillAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CCUIConnectivityCellularModuleViewController;
  [(CCUIAlwaysExpandedMenuModuleViewController *)&v11 viewWillAppear:a3];
  id v4 = objc_alloc(MEMORY[0x263F02D30]);
  v6 = (CoreTelephonyClient *)objc_msgSend_initWithQueue_(v4, v5, MEMORY[0x263EF83A0]);
  coreTelephonyClient = self->_coreTelephonyClient;
  self->_coreTelephonyClient = v6;

  objc_msgSend_setDelegate_(self->_coreTelephonyClient, v8, (uint64_t)self);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_2406351C8;
  v10[3] = &unk_2650C9380;
  v10[4] = self;
  objc_msgSend_performWithoutAnimation_(MEMORY[0x263F1CB60], v9, (uint64_t)v10);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CCUIConnectivityCellularModuleViewController;
  [(CCUIAlwaysExpandedMenuModuleViewController *)&v6 viewWillDisappear:a3];
  objc_msgSend_setDelegate_(self->_coreTelephonyClient, v4, 0);
  coreTelephonyClient = self->_coreTelephonyClient;
  self->_coreTelephonyClient = 0;
}

- (id)indicatorForMenuItem:(id)a3
{
  id v4 = a3;
  v9 = objc_msgSend_shortLabel(v4, v5, v6);
  if (v9)
  {
    v10 = objc_msgSend_objectForKeyedSubscript_(self->_simIndicatorCache, v7, (uint64_t)v9);

    if (!v10)
    {
      objc_super v11 = objc_msgSend_indicatorView(v4, v7, v8);
      objc_msgSend_setObject_forKeyedSubscript_(self->_simIndicatorCache, v12, (uint64_t)v11, v9);
    }
  }
  v13 = objc_msgSend_indicatorView(v4, v7, v8);

  return v13;
}

- (id)trailingViewForMenuItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    v9 = objc_alloc_init(CCUICellularMenuModuleItemTrailingView);
    objc_super v11 = objc_msgSend_indicatorForMenuItem_(self, v10, (uint64_t)v8);
    objc_msgSend_setContentMode_(v11, v12, 1);
    objc_msgSend_addSubview_(v9, v13, (uint64_t)v11);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_updateCellularMenuItems
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend_array(MEMORY[0x263EFF980], a2, v2);
  coreTelephonyClient = self->_coreTelephonyClient;
  id v33 = 0;
  v7 = objc_msgSend_getSubscriptionInfoWithError_(coreTelephonyClient, v6, (uint64_t)&v33);
  id v10 = v33;
  if (v10)
  {
    objc_super v11 = *MEMORY[0x263F33C50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F33C50], OS_LOG_TYPE_ERROR)) {
      sub_240636E88((uint64_t)v10, v11);
    }
  }
  else
  {
    if (v7)
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      uint64_t v12 = objc_msgSend_subscriptionsInUse(v7, v8, v9, 0);
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v29, v34, 16);
      if (v14)
      {
        uint64_t v16 = v14;
        uint64_t v17 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v30 != v17) {
              objc_enumerationMutation(v12);
            }
            v19 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            v20 = objc_msgSend__menuItemForCellularPlan_(self, v15, (uint64_t)v19);
            v23 = objc_msgSend_userDataPreferred(v19, v21, v22);
            uint64_t v26 = objc_msgSend_BOOLValue(v23, v24, v25);
            objc_msgSend_setSelected_(v20, v27, v26);

            if (v20) {
              objc_msgSend_addObject_(v4, v28, (uint64_t)v20);
            }
          }
          uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v29, v34, 16);
        }
        while (v16);
      }
    }
    objc_msgSend_setMenuItems_(self, v8, (uint64_t)v4);
  }
}

- (id)_menuItemForCellularPlan:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v6 = objc_msgSend_getSubscriptionUserFacingName_error_(self->_coreTelephonyClient, v5, (uint64_t)v4, 0);
  uint64_t v9 = objc_msgSend_uuid(v4, v7, v8);
  uint64_t v12 = objc_msgSend_UUIDString(v9, v10, v11);

  v13 = [CCUICellularMenuModuleItem alloc];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = sub_24063574C;
  v21[3] = &unk_2650C9498;
  objc_copyWeak(&v23, &location);
  id v14 = v4;
  id v22 = v14;
  uint64_t v16 = objc_msgSend_initWithTitle_identifier_handler_(v13, v15, (uint64_t)v6, v12, v21);
  v18 = objc_msgSend_getShortLabel_error_(self->_coreTelephonyClient, v17, (uint64_t)v14, 0);
  objc_msgSend_setShortLabel_(v16, v19, (uint64_t)v18);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

  return v16;
}

- (void)activeSubscriptionsDidChange
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = sub_2406358F8;
  v2[3] = &unk_2650C9380;
  v2[4] = self;
  objc_msgSend_performWithoutAnimation_(MEMORY[0x263F1CB60], a2, (uint64_t)v2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simIndicatorCache, 0);

  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
}

@end