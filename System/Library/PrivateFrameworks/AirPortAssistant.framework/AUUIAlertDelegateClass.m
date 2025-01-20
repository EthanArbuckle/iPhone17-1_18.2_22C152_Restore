@interface AUUIAlertDelegateClass
- (AUUIAlert)uiAlert;
- (BOOL)auUIAlertCancelAction:(id)a3;
- (BOOL)auUIAlertOKAction:(id)a3;
- (void)dealloc;
- (void)setUiAlert:(id)a3;
@end

@implementation AUUIAlertDelegateClass

- (void)dealloc
{
  objc_msgSend_setUiAlert_(self, a2, 0);
  v3.receiver = self;
  v3.super_class = (Class)AUUIAlertDelegateClass;
  [(AUUIAlertDelegateClass *)&v3 dealloc];
}

- (BOOL)auUIAlertOKAction:(id)a3
{
  objc_msgSend_setDelegate_(a3, a2, 0);
  v4 = self;
  qword_268148240 = 0;
  sub_22690A768((uint64_t)v4, v5, v6);
  return 1;
}

- (BOOL)auUIAlertCancelAction:(id)a3
{
  objc_msgSend_setDelegate_(a3, a2, 0);
  v4 = self;
  qword_268148240 = 0;
  return 1;
}

- (AUUIAlert)uiAlert
{
  return self->uiAlert;
}

- (void)setUiAlert:(id)a3
{
}

@end