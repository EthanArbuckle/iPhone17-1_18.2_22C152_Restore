void sub_1000047D8(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  long long v9;
  long long v10;
  long long v11;
  long long v12;
  unsigned char v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    v4 = v3;
    v5 = *(void *)v10;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        v8 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v7, (void)v9);
        [v7 sendResponse:v8];
      }
      v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

uint64_t sub_100004B70(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v4 setSignificantEventOptions:v3];
  [v4 setSignificantEventTime:BSDispatchTimeWithInterval()];

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

id sub_100004D50(uint64_t a1)
{
  return _[*(id *)(*(void *)(a1 + 32) + 24) noteWillAnimateToInterfaceOrientation:*(void *)(a1 + 40)];
}

void sub_100004D5C(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 24) view];
  uint64_t v3 = *(void *)(a1 + 40);
  switch(v3)
  {
    case 1:
      double v4 = 0.0;
      break;
    case 3:
      double v4 = 1.57079633;
      break;
    case 4:
      double v4 = -1.57079633;
      break;
    default:
      double v4 = 3.14159265;
      if (v3 != 2) {
        double v4 = 0.0;
      }
      break;
  }
  memset(&v8, 0, sizeof(v8));
  CGAffineTransformMakeRotation(&v8, v4);
  CGAffineTransform v7 = v8;
  [v2 setTransform:&v7];
  v5 = [v2 superview];
  v6 = v5;
  if (v5)
  {
    [v5 center];
    objc_msgSend(v2, "setCenter:");
    [v6 bounds];
    CGAffineTransform v7 = v8;
    CGRect v10 = CGRectApplyAffineTransform(v9, &v7);
    objc_msgSend(v2, "setBounds:", 0.0, 0.0, v10.size.width, v10.size.height);
    [v2 layoutIfNeeded];
  }
}

id sub_100004E7C(uint64_t a1)
{
  return _[*(id *)(*(void *)(a1 + 32) + 24) noteDidRotateFromInterfaceOrientation:*(void *)(a1 + 40)];
}

void sub_10000523C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x3Au);
}

uint64_t sub_100005268@<X0>(uint64_t *a1@<X8>)
{
  sub_100005AC0();
  swift_allocObject();
  sub_100005AD0();
  sub_100005A90();
  swift_allocObject();
  swift_retain();
  sub_100005AA0();
  sub_1000056E8(&qword_10000CE90);
  sub_100005A50();
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_100006700;
  sub_10000572C(&qword_10000CE98, (void (*)(uint64_t))&type metadata accessor for PRRenderingConfiguration);
  swift_retain();
  swift_retain();
  sub_100005A40();
  sub_10000572C(&qword_10000CEA0, (void (*)(uint64_t))&type metadata accessor for PREditingConfiguration);
  swift_retain();
  sub_100005A40();
  swift_release_n();
  uint64_t result = swift_release_n();
  *a1 = v2;
  return result;
}

id sub_100005490()
{
  id v0 = objc_allocWithZone((Class)LegacyPoster);

  return [v0 init];
}

uint64_t sub_1000054CC()
{
  return swift_release();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100005604()
{
  unint64_t result = qword_10000CE70;
  if (!qword_10000CE70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000CE70);
  }
  return result;
}

uint64_t sub_100005658(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

ValueMetadata *type metadata accessor for LegacyPosterExtension()
{
  return &type metadata for LegacyPosterExtension;
}

uint64_t sub_1000056B0()
{
  return *(void *)(*(void *)(swift_getOpaqueTypeConformance2() + 8) + 8);
}

uint64_t sub_1000056E8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000572C(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100005774()
{
  return sub_1000057A8(&qword_10000CEA8);
}

uint64_t sub_1000057A8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005658(&qword_10000CE80);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_1000057F4(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  sub_100005204();
  sub_100005258();
  sub_10000522C();
  sub_10000523C((void *)&_mh_execute_header, &_os_log_default, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void sub_1000058B8(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  sub_100005204();
  sub_100005258();
  sub_10000522C();
  sub_10000523C((void *)&_mh_execute_header, &_os_log_default, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void sub_10000597C(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  sub_100005204();
  sub_100005258();
  sub_10000522C();
  sub_10000523C((void *)&_mh_execute_header, &_os_log_default, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

uint64_t sub_100005A40()
{
  return _AnySceneConfiguration.init<A>(erasing:)();
}

uint64_t sub_100005A50()
{
  return type metadata accessor for _AnySceneConfiguration();
}

uint64_t sub_100005A60()
{
  return static _AppExtension<>.main()();
}

uint64_t sub_100005A70()
{
  return _AppExtension.hostAuditToken.getter();
}

uint64_t sub_100005A80()
{
  return static _SceneBuilder.buildBlock<A>(_:)();
}

uint64_t sub_100005A90()
{
  return type metadata accessor for PREditingConfiguration();
}

uint64_t sub_100005AA0()
{
  return PREditingConfiguration.init(_:)();
}

uint64_t sub_100005AB0()
{
  return PRProviderConfiguration.init(content:)();
}

uint64_t sub_100005AC0()
{
  return type metadata accessor for PRRenderingConfiguration();
}

uint64_t sub_100005AD0()
{
  return PRRenderingConfiguration.init(_:)();
}

uint64_t BSDispatchTimeWithInterval()
{
  return _BSDispatchTimeWithInterval();
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return _CGAffineTransformMakeRotation(retstr, angle);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  return _CGRectApplyAffineTransform(rect, t);
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

uint64_t PBUIStringForWallpaperLocations()
{
  return _PBUIStringForWallpaperLocations();
}

uint64_t PBUIStringForWallpaperVariant()
{
  return _PBUIStringForWallpaperVariant();
}

uint64_t PBUIWallpaperVariantIsValid()
{
  return _PBUIWallpaperVariantIsValid();
}

uint64_t PRDynamicRotationIsActive()
{
  return _PRDynamicRotationIsActive();
}

uint64_t _bs_set_crash_log_message()
{
  return __bs_set_crash_log_message();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
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

void objc_enumerationMutation(id obj)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
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

id objc_retainAutorelease(id a1)
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

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend__configureInView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureInView:");
}

id objc_msgSend__renderer_didInitializeWithEnvironment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_renderer:didInitializeWithEnvironment:");
}

id objc_msgSend__scene(void *a1, const char *a2, ...)
{
  return _[a1 _scene];
}

id objc_msgSend__setInterfaceOrientation_animationSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setInterfaceOrientation:animationSettings:");
}

id objc_msgSend__updateWallpaperSceneRequestingRuntime_forEvent_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateWallpaperSceneRequestingRuntime:forEvent:completion:");
}

id objc_msgSend_addObserver_forVariant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:forVariant:");
}

id objc_msgSend_animateWithSettings_actions_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithSettings:actions:completion:");
}

id objc_msgSend_animationSettings(void *a1, const char *a2, ...)
{
  return _[a1 animationSettings];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_bs_addChildViewController_withSuperview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bs_addChildViewController:withSuperview:");
}

id objc_msgSend_canSendResponse(void *a1, const char *a2, ...)
{
  return _[a1 canSendResponse];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return _[a1 center];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_deviceOrientation(void *a1, const char *a2, ...)
{
  return _[a1 deviceOrientation];
}

id objc_msgSend_foregroundView(void *a1, const char *a2, ...)
{
  return _[a1 foregroundView];
}

id objc_msgSend_homeScreenWallpaperConfigurationIncludingValuesForTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "homeScreenWallpaperConfigurationIncludingValuesForTypes:");
}

id objc_msgSend_initWithIdentifier_displayName_initialTimeFontConfiguration_initialTitleColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:displayName:initialTimeFontConfiguration:initialTitleColor:");
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 layoutIfNeeded];
}

id objc_msgSend_locations(void *a1, const char *a2, ...)
{
  return _[a1 locations];
}

id objc_msgSend_lockScreenWallpaperConfigurationIncludingValuesForTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockScreenWallpaperConfigurationIncludingValuesForTypes:");
}

id objc_msgSend_noteContentSignificantlyChanged(void *a1, const char *a2, ...)
{
  return _[a1 noteContentSignificantlyChanged];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_pb_activeVariant(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pb_activeVariant");
}

id objc_msgSend_performWithoutAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performWithoutAnimation:");
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return _[a1 response];
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return _[a1 rootViewController];
}

id objc_msgSend_sendResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendResponse:");
}

id objc_msgSend_setActiveVariant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveVariant:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBounds:");
}

id objc_msgSend_setCachingIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachingIdentifier:");
}

id objc_msgSend_setCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCenter:");
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClipsToBounds:");
}

id objc_msgSend_setColorSamplingDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setColorSamplingDisabled:");
}

id objc_msgSend_setFixedOrientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFixedOrientation:");
}

id objc_msgSend_setInterfaceOrientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterfaceOrientation:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setSignificantEventOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSignificantEventOptions:");
}

id objc_msgSend_setSignificantEventTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSignificantEventTime:");
}

id objc_msgSend_setTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransform:");
}

id objc_msgSend_setWallpaperConfigurationManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWallpaperConfigurationManager:");
}

id objc_msgSend_setWallpaperStyle_forPriority_forVariant_withAnimationFactory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWallpaperStyle:forPriority:forVariant:withAnimationFactory:");
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return _[a1 settings];
}

id objc_msgSend_significantEvent(void *a1, const char *a2, ...)
{
  return _[a1 significantEvent];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_strongToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return _[a1 strongToStrongObjectsMapTable];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return _[a1 superview];
}

id objc_msgSend_updateIrisWallpaperForStaticMode(void *a1, const char *a2, ...)
{
  return _[a1 updateIrisWallpaperForStaticMode];
}

id objc_msgSend_updatePreferences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePreferences:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_wallpaperDidChangeForVariants_shouldNotify_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wallpaperDidChangeForVariants:shouldNotify:");
}

id objc_msgSend_wallpaperType(void *a1, const char *a2, ...)
{
  return _[a1 wallpaperType];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _[a1 window];
}