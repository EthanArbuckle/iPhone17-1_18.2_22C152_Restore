void sub_100002624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100002648(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100002658(uint64_t a1)
{
}

void sub_100002660(uint64_t a1, void *a2, void *a3)
{
  id v37 = a2;
  id v5 = a3;
  if (v37)
  {
    if (!v5)
    {
      uint64_t v6 = [v37 image];
      uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
      v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      v9 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      if (v9)
      {
        if (*(unsigned char *)(a1 + 72))
        {
          [v9 size];
          CGFloat v11 = v10;
          CGFloat v13 = v12;
          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) scale];
          CGFloat v15 = v14;
          v39.width = v11;
          v39.height = v13;
          UIGraphicsBeginImageContextWithOptions(v39, 1, v15);
          CurrentContext = UIGraphicsGetCurrentContext();
          CGContextSaveGState(CurrentContext);
          objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "drawAtPoint:", CGPointZero.x, CGPointZero.y);
          objc_msgSend(v37, "pointForCoordinate:", *(double *)(a1 + 56), *(double *)(a1 + 64));
          double v18 = v17;
          double v20 = v19;
          double v21 = MKMetersPerMapPointAtLatitude(*(CLLocationDegrees *)(a1 + 56));
          [*(id *)(a1 + 32) radius];
          double v23 = v22 / v21;
          MKMapPoint v24 = MKMapPointForCoordinate(*(CLLocationCoordinate2D *)(a1 + 56));
          v40.x = v24.x;
          v40.y = v24.y - v23;
          CLLocationCoordinate2D v25 = MKCoordinateForMapPoint(v40);
          objc_msgSend(v37, "pointForCoordinate:", v25.latitude, v25.longitude);
          double v27 = vabdd_f64(v20, v26);
          CGFloat v28 = v18 - v27;
          CGFloat v29 = v20 - v27;
          CGFloat v30 = v27 + v27;
          v31 = +[UIColor systemBlueColor];
          id v32 = [v31 colorWithAlphaComponent:0.28];
          CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v32 CGColor]);

          v41.origin.x = v28;
          v41.origin.y = v29;
          v41.size.width = v30;
          v41.size.height = v30;
          CGContextFillEllipseInRect(CurrentContext, v41);
          id v33 = +[UIColor systemBlueColor];
          CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)[v33 CGColor]);

          v42.origin.x = v28;
          v42.origin.y = v29;
          v42.size.width = v30;
          v42.size.height = v30;
          CGContextStrokeEllipseInRect(CurrentContext, v42);
          uint64_t v34 = UIGraphicsGetImageFromCurrentImageContext();
          uint64_t v35 = *(void *)(*(void *)(a1 + 48) + 8);
          v36 = *(void **)(v35 + 40);
          *(void *)(v35 + 40) = v34;

          CGContextRestoreGState(CurrentContext);
          UIGraphicsEndImageContext();
        }
      }
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100002918(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not get entity ID. request identifier = %{public}@, request = %@", (uint8_t *)&v3, 0x16u);
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextStrokeEllipseInRect(CGContextRef c, CGRect rect)
{
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CLLocationCoordinate2D MKCoordinateForMapPoint(MKMapPoint mapPoint)
{
  CLLocationCoordinate2D v3 = _MKCoordinateForMapPoint(mapPoint);
  double longitude = v3.longitude;
  double latitude = v3.latitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

MKCoordinateRegion MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D centerCoordinate, CLLocationDistance latitudinalMeters, CLLocationDistance longitudinalMeters)
{
  return _MKCoordinateRegionMakeWithDistance(centerCoordinate, latitudinalMeters, longitudinalMeters);
}

MKMapPoint MKMapPointForCoordinate(CLLocationCoordinate2D coordinate)
{
  MKMapPoint v3 = _MKMapPointForCoordinate(coordinate);
  double y = v3.y;
  double x = v3.x;
  result.double y = y;
  result.double x = x;
  return result;
}

CLLocationDistance MKMetersPerMapPointAtLatitude(CLLocationDegrees latitude)
{
  return _MKMetersPerMapPointAtLatitude(latitude);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return _UIGraphicsGetCurrentContext();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
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

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_calendar(void *a1, const char *a2, ...)
{
  return [a1 calendar];
}

id objc_msgSend_categoryIdentifier(void *a1, const char *a2, ...)
{
  return [a1 categoryIdentifier];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return [a1 content];
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return [a1 coordinate];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return [a1 endDate];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_geoLocation(void *a1, const char *a2, ...)
{
  return [a1 geoLocation];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_isImprecise(void *a1, const char *a2, ...)
{
  return [a1 isImprecise];
}

id objc_msgSend_preferredContentSize(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSize];
}

id objc_msgSend_radius(void *a1, const char *a2, ...)
{
  return [a1 radius];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_structuredLocation(void *a1, const char *a2, ...)
{
  return [a1 structuredLocation];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return [a1 systemBlueColor];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewForLocation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewForLocation:");
}