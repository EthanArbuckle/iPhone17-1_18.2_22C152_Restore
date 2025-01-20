@interface BLPrivacyInfo
+ (id)sharedPrivacyInfo;
- (BLPrivacyInfo)init;
- (BOOL)isGDPRPrivacyAcknowledgementRequired;
- (void)_startObservingNotifications;
- (void)_stopObservingNotifications;
- (void)account:(unint64_t)a3 didChangeWithReason:(unint64_t)a4;
- (void)clearCachedValue;
- (void)dealloc;
@end

@implementation BLPrivacyInfo

+ (id)sharedPrivacyInfo
{
  if (qword_26AB3FF28 != -1) {
    dispatch_once(&qword_26AB3FF28, &unk_26CED3D50);
  }
  v2 = (void *)qword_26AB3FF30;

  return v2;
}

- (BLPrivacyInfo)init
{
  v9.receiver = self;
  v9.super_class = (Class)BLPrivacyInfo;
  v2 = [(BLPrivacyInfo *)&v9 init];
  v3 = v2;
  if (v2)
  {
    cachedValue = v2->_cachedValue;
    v2->_cachedValue = 0;

    v3->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend__startObservingNotifications(v3, v5, v6, v7);
  }
  return v3;
}

- (void)dealloc
{
  objc_msgSend__stopObservingNotifications(self, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)BLPrivacyInfo;
  [(BLPrivacyInfo *)&v5 dealloc];
}

- (void)_startObservingNotifications
{
  objc_msgSend_sharedProvider(MEMORY[0x263F2BA38], a2, v2, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObserver_accountTypes_(v6, v5, (uint64_t)self, 1);
}

- (void)_stopObservingNotifications
{
  objc_msgSend_sharedProvider(MEMORY[0x263F2BA38], a2, v2, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_accountTypes_(v6, v5, (uint64_t)self, 1);
}

- (BOOL)isGDPRPrivacyAcknowledgementRequired
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  cachedValue = self->_cachedValue;
  if (cachedValue)
  {
    int v8 = objc_msgSend_BOOLValue(cachedValue, v4, v5, v6);
    p_super = BLJaliscoLog();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
    {
      int v17 = 67109120;
      int v18 = v8;
      _os_log_impl(&dword_21DFE3000, p_super, OS_LOG_TYPE_DEBUG, "isGDPRPrivacyAcknowledgementRequired: Got cached value %{BOOL}d", (uint8_t *)&v17, 8u);
    }
    goto LABEL_11;
  }
  v10 = BLJaliscoLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v17) = 0;
    _os_log_impl(&dword_21DFE3000, v10, OS_LOG_TYPE_DEBUG, "isGDPRPrivacyAcknowledgementRequired: No cached value", (uint8_t *)&v17, 2u);
  }

  int v11 = BUIsGDPRAcknowledgementNeededForBooks();
  v12 = BLJaliscoLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 67109120;
    int v18 = v11;
    _os_log_impl(&dword_21DFE3000, v12, OS_LOG_TYPE_DEBUG, "isGDPRPrivacyAcknowledgementRequired: Got %{BOOL}d", (uint8_t *)&v17, 8u);
  }

  if ((v11 & 1) == 0)
  {
    objc_msgSend_numberWithBool_(NSNumber, v13, 0, v14);
    v15 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v8) = 0;
    p_super = &self->_cachedValue->super.super;
    self->_cachedValue = v15;
LABEL_11:

    goto LABEL_12;
  }
  LOBYTE(v8) = 1;
LABEL_12:
  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (void)clearCachedValue
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  cachedValue = self->_cachedValue;
  self->_cachedValue = 0;

  os_unfair_lock_unlock(p_lock);
}

- (void)account:(unint64_t)a3 didChangeWithReason:(unint64_t)a4
{
  if (a4 - 101 <= 1) {
    MEMORY[0x270F9A6D0](self, sel_clearCachedValue, a3, a4);
  }
}

- (void).cxx_destruct
{
}

@end