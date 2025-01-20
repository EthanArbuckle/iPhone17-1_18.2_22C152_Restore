void sub_294C(uint64_t a1, void *a2)
{
  id v3;
  void v4[4];
  id v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_29FC;
  v4[3] = &unk_82D0;
  v5 = a2;
  v6 = *(id *)(a1 + 32);
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

void sub_29FC(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    v3 = +[UIColor siriui_maskingColor];
    id v4 = [v1 _flatImageWithColor:v3];

    [*(id *)(a1 + 40) setImage:v4];
  }
}

uint64_t SiriLanguageSemanticContentAttribute()
{
  return _SiriLanguageSemanticContentAttribute();
}

uint64_t SiriUIIsWhitePlatterSnippetBackgroundEnabledForAllSnippets()
{
  return _SiriUIIsWhitePlatterSnippetBackgroundEnabledForAllSnippets();
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return __NSDictionaryOfVariableBindings(commaSeparatedKeysString, firstValue);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_actionButton(void *a1, const char *a2, ...)
{
  return [a1 actionButton];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_card(void *a1, const char *a2, ...)
{
  return [a1 card];
}

id objc_msgSend_cardResults(void *a1, const char *a2, ...)
{
  return [a1 cardResults];
}

id objc_msgSend_centered(void *a1, const char *a2, ...)
{
  return [a1 centered];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_contentAdvisory(void *a1, const char *a2, ...)
{
  return [a1 contentAdvisory];
}

id objc_msgSend_contentRatingText(void *a1, const char *a2, ...)
{
  return [a1 contentRatingText];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_descriptions(void *a1, const char *a2, ...)
{
  return [a1 descriptions];
}

id objc_msgSend_emphasized(void *a1, const char *a2, ...)
{
  return [a1 emphasized];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_footnote(void *a1, const char *a2, ...)
{
  return [a1 footnote];
}

id objc_msgSend_genericResults(void *a1, const char *a2, ...)
{
  return [a1 genericResults];
}

id objc_msgSend_groupIdentifier(void *a1, const char *a2, ...)
{
  return [a1 groupIdentifier];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_imageData(void *a1, const char *a2, ...)
{
  return [a1 imageData];
}

id objc_msgSend_imageIsRightAligned(void *a1, const char *a2, ...)
{
  return [a1 imageIsRightAligned];
}

id objc_msgSend_imageResource(void *a1, const char *a2, ...)
{
  return [a1 imageResource];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_leftText(void *a1, const char *a2, ...)
{
  return [a1 leftText];
}

id objc_msgSend_markupList(void *a1, const char *a2, ...)
{
  return [a1 markupList];
}

id objc_msgSend_moreGlyphs(void *a1, const char *a2, ...)
{
  return [a1 moreGlyphs];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_preferredContentSize(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSize];
}

id objc_msgSend_preferredOpenableURL(void *a1, const char *a2, ...)
{
  return [a1 preferredOpenableURL];
}

id objc_msgSend_punchOut(void *a1, const char *a2, ...)
{
  return [a1 punchOut];
}

id objc_msgSend_punchOutUri(void *a1, const char *a2, ...)
{
  return [a1 punchOutUri];
}

id objc_msgSend_punchout(void *a1, const char *a2, ...)
{
  return [a1 punchout];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return [a1 results];
}

id objc_msgSend_rightText(void *a1, const char *a2, ...)
{
  return [a1 rightText];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_secondaryTitle(void *a1, const char *a2, ...)
{
  return [a1 secondaryTitle];
}

id objc_msgSend_sectionTitle(void *a1, const char *a2, ...)
{
  return [a1 sectionTitle];
}

id objc_msgSend_sections(void *a1, const char *a2, ...)
{
  return [a1 sections];
}

id objc_msgSend_setNeedsUpdateConstraints(void *a1, const char *a2, ...)
{
  return [a1 setNeedsUpdateConstraints];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_subtitle(void *a1, const char *a2, ...)
{
  return [a1 subtitle];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_textMaxlines(void *a1, const char *a2, ...)
{
  return [a1 textMaxlines];
}

id objc_msgSend_thumbnail(void *a1, const char *a2, ...)
{
  return [a1 thumbnail];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_titleImage(void *a1, const char *a2, ...)
{
  return [a1 titleImage];
}

id objc_msgSend_titleMaxLines(void *a1, const char *a2, ...)
{
  return [a1 titleMaxLines];
}

id objc_msgSend_updateConstraintsIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 updateConstraintsIfNeeded];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}