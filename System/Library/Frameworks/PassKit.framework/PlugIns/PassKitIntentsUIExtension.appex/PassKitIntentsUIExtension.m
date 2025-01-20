uint64_t sub_100004258(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 1, *(void *)(a1 + 32));
}

Class sub_100005884()
{
  if (qword_10000CDC0 != -1) {
    dispatch_once(&qword_10000CDC0, &stru_100008298);
  }
  Class result = objc_getClass("CNBadgingAvatarBadgeStyleSettings");
  qword_10000CDB0 = (uint64_t)result;
  off_10000CDA0 = (uint64_t (*)())sub_1000058E8;
  return result;
}

id sub_1000058E8()
{
  return (id)qword_10000CDB0;
}

void sub_1000058F4(id a1)
{
  qword_10000CDB8 = (uint64_t)dlopen("/System/Library/Frameworks/ContactsUI.framework/ContactsUI", 2);
}

Class sub_100005920()
{
  if (qword_10000CDC0 != -1) {
    dispatch_once(&qword_10000CDC0, &stru_100008298);
  }
  Class result = objc_getClass("CNBadgingAvatarViewController");
  qword_10000CDC8 = (uint64_t)result;
  off_10000CDA8 = (uint64_t (*)())sub_100005984;
  return result;
}

id sub_100005984()
{
  return (id)qword_10000CDC8;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

uint64_t CKBalloonViewForClass()
{
  return _CKBalloonViewForClass();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t PKLogFacilityTypeGetObject()
{
  return _PKLogFacilityTypeGetObject();
}

uint64_t PKPassKitBundle()
{
  return _PKPassKitBundle();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
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

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__desiredSize(void *a1, const char *a2, ...)
{
  return [a1 _desiredSize];
}

id objc_msgSend_amount(void *a1, const char *a2, ...)
{
  return [a1 amount];
}

id objc_msgSend_balloonTextFont(void *a1, const char *a2, ...)
{
  return [a1 balloonTextFont];
}

id objc_msgSend_bigEmojiFont(void *a1, const char *a2, ...)
{
  return [a1 bigEmojiFont];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bubbleView(void *a1, const char *a2, ...)
{
  return [a1 bubbleView];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_color(void *a1, const char *a2, ...)
{
  return [a1 color];
}

id objc_msgSend_contactIdentifier(void *a1, const char *a2, ...)
{
  return [a1 contactIdentifier];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currencyAmount(void *a1, const char *a2, ...)
{
  return [a1 currencyAmount];
}

id objc_msgSend_currencyCode(void *a1, const char *a2, ...)
{
  return [a1 currencyCode];
}

id objc_msgSend_defaultParagraphStyle(void *a1, const char *a2, ...)
{
  return [a1 defaultParagraphStyle];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return [a1 extensionContext];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_hostedViewMaximumAllowedSize(void *a1, const char *a2, ...)
{
  return [a1 hostedViewMaximumAllowedSize];
}

id objc_msgSend_hyphenatesTextContent(void *a1, const char *a2, ...)
{
  return [a1 hyphenatesTextContent];
}

id objc_msgSend_intent(void *a1, const char *a2, ...)
{
  return [a1 intent];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return [a1 labelColor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_note(void *a1, const char *a2, ...)
{
  return [a1 note];
}

id objc_msgSend_payee(void *a1, const char *a2, ...)
{
  return [a1 payee];
}

id objc_msgSend_payer(void *a1, const char *a2, ...)
{
  return [a1 payer];
}

id objc_msgSend_prepareForDisplay(void *a1, const char *a2, ...)
{
  return [a1 prepareForDisplay];
}

id objc_msgSend_prepareForDisplayIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 prepareForDisplayIfNeeded];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_sharedBehaviors(void *a1, const char *a2, ...)
{
  return [a1 sharedBehaviors];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 systemBackgroundColor];
}

id objc_msgSend_theme(void *a1, const char *a2, ...)
{
  return [a1 theme];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}