void sub_14B4(void *a1, void *a2)
{
  UIImage *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  UIImage *v8;
  uint64_t vars8;

  v3 = a2;
  v8 = v3;
  if (v3)
  {
    v4 = UIImagePNGRepresentation(v3);
    v5 = (void *)a1[4];
    if (v5)
    {
      [v5 _setImageData:v4];
    }
    else
    {
      v6 = [objc_alloc((Class)INImage) _initWithIdentifier:a1[5]];
      [v6 _setImageData:v4];
      v7 = +[INCache sharedCache];
      [v7 addCacheableObject:v6];
    }
  }
  (*(void (**)(void))(a1[6] + 16))();
}

uint64_t sub_1588(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1598(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_29BC(id a1, SiriUITemplateViewController *a2, BOOL *a3)
{
  v4 = a2;
  [(SiriUITemplateViewController *)v4 didMoveToParentViewController:0];
  v3 = [(SiriUITemplateViewController *)v4 view];
  [v3 removeFromTemplatedSuperview];

  [(SiriUITemplateViewController *)v4 removeFromParentViewController];
}

void sub_2A24(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2B14;
  block[3] = &unk_8400;
  id v10 = *(id *)(a1 + 32);
  id v11 = v5;
  id v12 = *(id *)(a1 + 40);
  id v13 = v6;
  uint64_t v14 = *(void *)(a1 + 48);
  id v7 = v6;
  id v8 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_2B14(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  v2 = +[NSString hexStringFromData:*(void *)(a1 + 40)];
  if (v2)
  {
    v3 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315394;
      id v13 = "-[SiriIntentsSnippetViewController setSnippet:]_block_invoke_3";
      __int16 v14 = 2112;
      v15 = v2;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "%s Set facade intent identifier = %@", (uint8_t *)&v12, 0x16u);
    }
    [*(id *)(a1 + 48) setIdentifier:v2];
  }
  else
  {
    v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      id v5 = *(void **)(a1 + 56);
      int v12 = 136315394;
      id v13 = "-[SiriIntentsSnippetViewController setSnippet:]_block_invoke";
      __int16 v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "%s Unable to generate facade intent ID due to %@", (uint8_t *)&v12, 0x16u);
    }
  }
  id v6 = [*(id *)(*(void *)(a1 + 64) + 8) intentResponse];
  id v7 = [v6 typeName];
  id v8 = [*(id *)(*(void *)(a1 + 64) + 8) intentResponse];
  v9 = [v8 data];
  id v10 = INIntentResponseCreate();

  id v11 = [objc_alloc((Class)INInteraction) initWithIntent:*(void *)(a1 + 48) response:v10];
  [*(id *)(a1 + 64) _connectToWidgetForInteraction:v11];
}

void sub_2E8C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v11 = AFSiriLogContextConnection;
    if (v6)
    {
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
        sub_4100();
      }
    }
    else if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v18 = "-[SiriIntentsSnippetViewController _connectToWidgetForInteraction:]_block_invoke";
      __int16 v19 = 2112;
      uint64_t v20 = v12;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "%s No remote view controller for interaction: %@", buf, 0x16u);
    }
    [*(id *)(a1 + 40) _finishLoadingViewIfNecessary];
  }
  else
  {
    id v8 = *(void **)(a1 + 32);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_302C;
    v13[3] = &unk_8478;
    id v9 = v8;
    uint64_t v10 = *(void *)(a1 + 40);
    id v14 = v9;
    uint64_t v15 = v10;
    id v16 = v5;
    [v16 configureForParameters:0 ofInteraction:v9 interactiveBehavior:0 context:0 completion:v13];
  }
}

void sub_302C(uint64_t a1, double a2, double a3, uint64_t a4, void *a5, void *a6)
{
  id v9 = a5;
  id v10 = a6;
  if (v10)
  {
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_4178();
    }
    [*(id *)(a1 + 40) _finishLoadingViewIfNecessary];
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 16), *(id *)(a1 + 48));
    [*(id *)(*(void *)(a1 + 40) + 16) setInheritsSecurity:1];
    [*(id *)(a1 + 40) addChildViewController:*(void *)(*(void *)(a1 + 40) + 16)];
    id v11 = [*(id *)(a1 + 40) view];
    uint64_t v12 = [*(id *)(*(void *)(a1 + 40) + 16) view];
    id v13 = [*(id *)(*(void *)(a1 + 40) + 8) widgetIndex];
    objc_msgSend(v11, "setAuxiliaryView:atIndex:initialHeight:animated:completion:", v12, objc_msgSend(v13, "unsignedIntegerValue"), 0, 0, a3);

    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 16), "didMoveToParentViewController:");
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v15 = *(void **)(v14 + 16);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_31D4;
    v16[3] = &unk_8450;
    v16[4] = v14;
    [v15 _queryRepresentedPropertiesWithCompletion:v16];
  }
}

id sub_31D4(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _redactTemplateViewControllersForRepresentedKeyPaths:a2];
  v3 = *(void **)(a1 + 32);

  return [v3 _finishLoadingViewIfNecessary];
}

void sub_3B74(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (*(void *)(a1 + 40) != a3)
  {
    id v12 = v7;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v12;
      [v8 setSelected:0];
      id v9 = *(void **)(*(void *)(a1 + 32) + 56);
      id v10 = [v8 templateModelPrivate];

      id v11 = [v10 modelIdentifier];
      [v9 removeObjectForKey:v11];
    }
    else
    {
      *a4 = 1;
    }
    id v7 = v12;
  }
}

void sub_4028(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void sub_4100()
{
  int v2 = 136315650;
  sub_4008();
  sub_4028(&dword_0, v0, v1, "%s Failed to instantiate remote view controller with error: %{public}@ for interaction: %@", v2);
}

void sub_4178()
{
  int v2 = 136315650;
  sub_4008();
  sub_4028(&dword_0, v0, v1, "%s Failed to configure remote view controller with error: %{public}@ for interaction: %@", v2);
}

uint64_t AceObjectSetAceObjectForProperty()
{
  return _AceObjectSetAceObjectForProperty();
}

uint64_t INIntentCreate()
{
  return _INIntentCreate();
}

uint64_t INIntentResponseCreate()
{
  return _INIntentResponseCreate();
}

uint64_t INIntentSlotValueTransformToLocation()
{
  return _INIntentSlotValueTransformToLocation();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return _UIImagePNGRepresentation(image);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__finishLoadingViewIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _finishLoadingViewIfNecessary];
}

id objc_msgSend__imageData(void *a1, const char *a2, ...)
{
  return [a1 _imageData];
}

id objc_msgSend__updateTemplateViewControllerCompression(void *a1, const char *a2, ...)
{
  return [a1 _updateTemplateViewControllerCompression];
}

id objc_msgSend__uri(void *a1, const char *a2, ...)
{
  return [a1 _uri];
}

id objc_msgSend_aceId(void *a1, const char *a2, ...)
{
  return [a1 aceId];
}

id objc_msgSend_alignment(void *a1, const char *a2, ...)
{
  return [a1 alignment];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_alpha(void *a1, const char *a2, ...)
{
  return [a1 alpha];
}

id objc_msgSend_appId(void *a1, const char *a2, ...)
{
  return [a1 appId];
}

id objc_msgSend_auxiliaryView(void *a1, const char *a2, ...)
{
  return [a1 auxiliaryView];
}

id objc_msgSend_blueValue(void *a1, const char *a2, ...)
{
  return [a1 blueValue];
}

id objc_msgSend_childViewControllers(void *a1, const char *a2, ...)
{
  return [a1 childViewControllers];
}

id objc_msgSend_color(void *a1, const char *a2, ...)
{
  return [a1 color];
}

id objc_msgSend_commandIdentifier(void *a1, const char *a2, ...)
{
  return [a1 commandIdentifier];
}

id objc_msgSend_commands(void *a1, const char *a2, ...)
{
  return [a1 commands];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_desiredHeight(void *a1, const char *a2, ...)
{
  return [a1 desiredHeight];
}

id objc_msgSend_detailIdentifier(void *a1, const char *a2, ...)
{
  return [a1 detailIdentifier];
}

id objc_msgSend_detailLabelComponent(void *a1, const char *a2, ...)
{
  return [a1 detailLabelComponent];
}

id objc_msgSend_detailSnippet(void *a1, const char *a2, ...)
{
  return [a1 detailSnippet];
}

id objc_msgSend_detailText(void *a1, const char *a2, ...)
{
  return [a1 detailText];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_disconnect(void *a1, const char *a2, ...)
{
  return [a1 disconnect];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_greenValue(void *a1, const char *a2, ...)
{
  return [a1 greenValue];
}

id objc_msgSend_imageStyle(void *a1, const char *a2, ...)
{
  return [a1 imageStyle];
}

id objc_msgSend_imageURI(void *a1, const char *a2, ...)
{
  return [a1 imageURI];
}

id objc_msgSend_intent(void *a1, const char *a2, ...)
{
  return [a1 intent];
}

id objc_msgSend_intentId(void *a1, const char *a2, ...)
{
  return [a1 intentId];
}

id objc_msgSend_intentResponse(void *a1, const char *a2, ...)
{
  return [a1 intentResponse];
}

id objc_msgSend_intentSlotKeyPaths(void *a1, const char *a2, ...)
{
  return [a1 intentSlotKeyPaths];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_isLoading(void *a1, const char *a2, ...)
{
  return [a1 isLoading];
}

id objc_msgSend_labelTemplateComponentStyle(void *a1, const char *a2, ...)
{
  return [a1 labelTemplateComponentStyle];
}

id objc_msgSend_latitude(void *a1, const char *a2, ...)
{
  return [a1 latitude];
}

id objc_msgSend_launchId(void *a1, const char *a2, ...)
{
  return [a1 launchId];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return [a1 location];
}

id objc_msgSend_longitude(void *a1, const char *a2, ...)
{
  return [a1 longitude];
}

id objc_msgSend_mapSize(void *a1, const char *a2, ...)
{
  return [a1 mapSize];
}

id objc_msgSend_modelIdentifier(void *a1, const char *a2, ...)
{
  return [a1 modelIdentifier];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_prepareForDismissal(void *a1, const char *a2, ...)
{
  return [a1 prepareForDismissal];
}

id objc_msgSend_processSynapseFlowCommand(void *a1, const char *a2, ...)
{
  return [a1 processSynapseFlowCommand];
}

id objc_msgSend_redValue(void *a1, const char *a2, ...)
{
  return [a1 redValue];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return [a1 reloadData];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return [a1 removeFromParentViewController];
}

id objc_msgSend_removeFromTemplatedSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromTemplatedSuperview];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_sharedCache(void *a1, const char *a2, ...)
{
  return [a1 sharedCache];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedURLSession(void *a1, const char *a2, ...)
{
  return [a1 sharedURLSession];
}

id objc_msgSend_snippetTemplates(void *a1, const char *a2, ...)
{
  return [a1 snippetTemplates];
}

id objc_msgSend_templateModelPrivate(void *a1, const char *a2, ...)
{
  return [a1 templateModelPrivate];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_typeName(void *a1, const char *a2, ...)
{
  return [a1 typeName];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_updateLocationCommand(void *a1, const char *a2, ...)
{
  return [a1 updateLocationCommand];
}

id objc_msgSend_updateSlotCommand(void *a1, const char *a2, ...)
{
  return [a1 updateSlotCommand];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_widgetAllowed(void *a1, const char *a2, ...)
{
  return [a1 widgetAllowed];
}

id objc_msgSend_widgetIndex(void *a1, const char *a2, ...)
{
  return [a1 widgetIndex];
}