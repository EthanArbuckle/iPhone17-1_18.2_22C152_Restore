@interface SwappableViewControllerImplementationFactory
+ (BOOL)shouldUseOutOfProcessUI;
+ (BOOL)showModernViewControllers;
+ (id)calendarChooserImplWithRemoteUI:(BOOL)a3 selectionStyle:(int64_t)a4 displayStyle:(int64_t)a5 entityType:(unint64_t)a6 forEvent:(id)a7 eventStore:(id)a8 limitedToSource:(id)a9 showIdentityChooser:(BOOL)a10 showDelegateSetupCell:(BOOL)a11 showAccountStatus:(BOOL)a12;
+ (id)calendarChooserImplWithSelectionStyle:(int64_t)a3 displayStyle:(int64_t)a4 entityType:(unint64_t)a5 forEvent:(id)a6 eventStore:(id)a7 limitedToSource:(id)a8 showIdentityChooser:(BOOL)a9 showDelegateSetupCell:(BOOL)a10 showAccountStatus:(BOOL)a11;
+ (id)eventEditViewControllerImpl;
+ (id)eventEditViewControllerImplWithRemoteUI:(BOOL)a3;
+ (id)eventViewControllerImpl;
+ (id)eventViewControllerImplWithRemoteUI:(BOOL)a3;
+ (id)proposedTimeEventViewControllerImpl;
@end

@implementation SwappableViewControllerImplementationFactory

+ (BOOL)shouldUseOutOfProcessUI
{
  return [MEMORY[0x1E4F57700] currentProcessIsFirstPartyCalendarApp] ^ 1;
}

+ (id)eventViewControllerImpl
{
  uint64_t v3 = [a1 shouldUseOutOfProcessUI];

  return (id)[a1 eventViewControllerImplWithRemoteUI:v3];
}

+ (id)eventViewControllerImplWithRemoteUI:(BOOL)a3
{
  if (a3)
  {
    uint64_t v3 = off_1E6086540;
  }
  else
  {
    int v4 = [a1 showModernViewControllers];
    uint64_t v3 = off_1E6086530;
    if (v4) {
      uint64_t v3 = off_1E6086538;
    }
  }
  id v5 = objc_alloc_init(*v3);

  return v5;
}

+ (id)eventEditViewControllerImpl
{
  uint64_t v3 = [a1 shouldUseOutOfProcessUI];

  return (id)[a1 eventEditViewControllerImplWithRemoteUI:v3];
}

+ (id)eventEditViewControllerImplWithRemoteUI:(BOOL)a3
{
  if (a3)
  {
    uint64_t v3 = off_1E6086488;
  }
  else
  {
    int v4 = [a1 showModernViewControllers];
    uint64_t v3 = off_1E6086478;
    if (v4) {
      uint64_t v3 = off_1E6086480;
    }
  }
  id v5 = objc_alloc_init(*v3);

  return v5;
}

+ (id)calendarChooserImplWithSelectionStyle:(int64_t)a3 displayStyle:(int64_t)a4 entityType:(unint64_t)a5 forEvent:(id)a6 eventStore:(id)a7 limitedToSource:(id)a8 showIdentityChooser:(BOOL)a9 showDelegateSetupCell:(BOOL)a10 showAccountStatus:(BOOL)a11
{
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  BYTE2(v22) = a11;
  LOWORD(v22) = __PAIR16__(a10, a9);
  v20 = objc_msgSend(a1, "calendarChooserImplWithRemoteUI:selectionStyle:displayStyle:entityType:forEvent:eventStore:limitedToSource:showIdentityChooser:showDelegateSetupCell:showAccountStatus:", objc_msgSend(a1, "shouldUseOutOfProcessUI"), a3, a4, a5, v19, v18, v17, v22);

  return v20;
}

+ (id)calendarChooserImplWithRemoteUI:(BOOL)a3 selectionStyle:(int64_t)a4 displayStyle:(int64_t)a5 entityType:(unint64_t)a6 forEvent:(id)a7 eventStore:(id)a8 limitedToSource:(id)a9 showIdentityChooser:(BOOL)a10 showDelegateSetupCell:(BOOL)a11 showAccountStatus:(BOOL)a12
{
  id v17 = off_1E6086248;
  if (!a3) {
    id v17 = off_1E6086240;
  }
  id v18 = (objc_class *)*v17;
  id v19 = a9;
  id v20 = a8;
  id v21 = a7;
  BYTE2(v24) = a12;
  LOWORD(v24) = __PAIR16__(a11, a10);
  uint64_t v22 = objc_msgSend([v18 alloc], "initWithSelectionStyle:displayStyle:entityType:forEvent:eventStore:limitedToSource:showIdentityChooser:showDelegateSetupCell:showAccountStatus:", a4, a5, a6, v21, v20, v19, v24);

  return v22;
}

+ (id)proposedTimeEventViewControllerImpl
{
  int v2 = [a1 showModernViewControllers];
  uint64_t v3 = off_1E6086A40;
  if (!v2) {
    uint64_t v3 = off_1E6086A38;
  }
  id v4 = objc_alloc_init(*v3);

  return v4;
}

+ (BOOL)showModernViewControllers
{
  if ((_os_feature_enabled_impl() & 1) != 0 || (int v2 = _os_feature_enabled_impl()) != 0)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F57780]);
    id v4 = (void *)[v3 initWithDomain:*MEMORY[0x1E4F57900]];
    char v5 = [v4 getBooleanPreference:*MEMORY[0x1E4F578E8] defaultValue:0];

    LOBYTE(v2) = v5;
  }
  return v2;
}

@end