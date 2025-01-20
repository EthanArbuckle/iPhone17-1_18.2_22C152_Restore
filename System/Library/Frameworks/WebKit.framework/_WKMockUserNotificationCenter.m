@interface _WKMockUserNotificationCenter
- (_WKMockUserNotificationCenter)initWithBundleIdentifier:(id)a3;
- (id).cxx_construct;
- (id)_internalInitWithBundleIdentifier:(id)a3;
- (id)getAppBadgeForTesting;
- (id)notificationSettings;
- (void)addNotificationRequest:(id)a3 withCompletionHandler:(id)a4;
- (void)getDeliveredNotificationsWithCompletionHandler:(id)a3;
- (void)getNotificationSettingsWithCompletionHandler:(id)a3;
- (void)removePendingNotificationRequestsWithIdentifiers:(id)a3;
- (void)requestAuthorizationWithOptions:(unint64_t)a3 completionHandler:(id)a4;
@end

@implementation _WKMockUserNotificationCenter

- (id)_internalInitWithBundleIdentifier:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_WKMockUserNotificationCenter;
  v4 = [(_WKMockUserNotificationCenter *)&v10 init];
  if (v4)
  {
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4->m_queue = (OS_dispatch_queue *)dispatch_queue_create(0, v5);
    if (a3) {
      CFRetain(a3);
    }
    m_ptr = v4->m_bundleIdentifier.m_ptr;
    v4->m_bundleIdentifier.m_ptr = a3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v8 = v4->m_notifications.m_ptr;
    v4->m_notifications.m_ptr = v7;
    if (v8) {
      CFRelease(v8);
    }
  }
  return v4;
}

- (_WKMockUserNotificationCenter)initWithBundleIdentifier:(id)a3
{
  if (_MergedGlobals_35 == 1)
  {
    v4 = (void *)qword_1EB358998;
  }
  else
  {
    v4 = objc_opt_new();
    qword_1EB358998 = (uint64_t)v4;
    _MergedGlobals_35 = 1;
  }
  if (![v4 objectForKeyedSubscript:a3])
  {
    id v5 = [[_WKMockUserNotificationCenter alloc] _internalInitWithBundleIdentifier:a3];
    [(id)qword_1EB358998 setObject:v5 forKeyedSubscript:a3];
  }
  v6 = (void *)[(id)qword_1EB358998 objectForKeyedSubscript:a3];

  return (_WKMockUserNotificationCenter *)v6;
}

- (void)addNotificationRequest:(id)a3 withCompletionHandler:(id)a4
{
  objc_msgSend(self->m_notifications.m_ptr, "addObject:", objc_msgSend(MEMORY[0x1E4F445C8], "notificationWithRequest:date:", a3, objc_msgSend(MEMORY[0x1E4F1C9C8], "now")));
  if (!objc_msgSend((id)objc_msgSend(a3, "content"), "targetContentIdentifier"))
  {
    id v7 = objc_msgSend((id)objc_msgSend(a3, "content"), "badge");
    v8 = v7;
    if (v7) {
      CFRetain(v7);
    }
    m_ptr = self->m_appBadge.m_ptr;
    self->m_appBadge.m_ptr = v8;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
  }
  m_queue = self->m_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78___WKMockUserNotificationCenter_addNotificationRequest_withCompletionHandler___block_invoke;
  block[3] = &unk_1E5810EF8;
  block[4] = a4;
  dispatch_async(m_queue, block);
}

- (id)getAppBadgeForTesting
{
  return self->m_appBadge.m_ptr;
}

- (void)getDeliveredNotificationsWithCompletionHandler:(id)a3
{
  id v5 = (const void *)[self->m_notifications.m_ptr copy];
  v6 = v5;
  m_queue = self->m_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3321888768;
  v9[2] = __80___WKMockUserNotificationCenter_getDeliveredNotificationsWithCompletionHandler___block_invoke;
  v9[3] = &unk_1EE9B2538;
  v9[4] = a3;
  CFTypeRef cf = v5;
  if (v5) {
    CFRetain(v5);
  }
  dispatch_async(m_queue, v9);
  CFTypeRef v8 = cf;
  CFTypeRef cf = 0;
  if (!v8)
  {
    if (!v6) {
      return;
    }
LABEL_7:
    CFRelease(v6);
    return;
  }
  CFRelease(v8);
  if (v6) {
    goto LABEL_7;
  }
}

- (void)removePendingNotificationRequestsWithIdentifiers:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  m_ptr = self->m_notifications.m_ptr;
  uint64_t v7 = [m_ptr countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(m_ptr);
        }
        objc_super v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(a3, "containsObject:", objc_msgSend((id)objc_msgSend(v10, "request"), "identifier")))objc_msgSend(v5, "addObject:", v10); {
      }
        }
      uint64_t v7 = [m_ptr countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  [self->m_notifications.m_ptr removeObjectsInArray:v5];
  if (v5) {
    CFRelease(v5);
  }
}

- (void)getNotificationSettingsWithCompletionHandler:(id)a3
{
  BOOL m_hasPermission = self->m_hasPermission;
  m_queue = self->m_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __78___WKMockUserNotificationCenter_getNotificationSettingsWithCompletionHandler___block_invoke;
  v5[3] = &unk_1E5810F20;
  BOOL v6 = m_hasPermission;
  v5[4] = a3;
  dispatch_async(m_queue, v5);
}

- (void)requestAuthorizationWithOptions:(unint64_t)a3 completionHandler:(id)a4
{
  self->BOOL m_hasPermission = 1;
  m_queue = self->m_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83___WKMockUserNotificationCenter_requestAuthorizationWithOptions_completionHandler___block_invoke;
  block[3] = &unk_1E5810EF8;
  block[4] = a4;
  dispatch_async(m_queue, block);
}

- (id)notificationSettings
{
  v3 = (void *)[MEMORY[0x1E4F445B8] emptySettings];
  v4 = v3;
  if (v3) {
    CFRetain(v3);
  }
  [v4 setAuthorizationStatus:2 * self->m_hasPermission];
  if (v4) {
    CFRelease(v4);
  }
  return v4;
}

- (void).cxx_destruct
{
  m_ptr = self->m_appBadge.m_ptr;
  self->m_appBadge.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  v4 = self->m_notifications.m_ptr;
  self->m_notifications.m_ptr = 0;
  if (v4) {
    CFRelease(v4);
  }
  id v5 = self->m_bundleIdentifier.m_ptr;
  self->m_bundleIdentifier.m_ptr = 0;
  if (v5)
  {
    CFRelease(v5);
  }
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  return self;
}

@end