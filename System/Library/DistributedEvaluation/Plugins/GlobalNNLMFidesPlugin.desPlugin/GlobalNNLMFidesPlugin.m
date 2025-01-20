void sub_2DA8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_2DE8(uint64_t a1, void *a2)
{
  v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && xpc_activity_should_defer(v3))
  {
    v5 = qword_86E8;
    if (os_log_type_enabled((os_log_t)qword_86E8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "GlobalNNLM: eligibilityHandler deferred", v6, 2u);
    }
    [WeakRetained _invalidate];
  }
}

uint64_t sub_2E8C(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 16) = objc_alloc_init((Class)SpeechModelTrainingClient);

  return _objc_release_x1();
}

void sub_2ED4(id a1, NSError *a2)
{
  v2 = qword_86E8;
  if (os_log_type_enabled((os_log_t)qword_86E8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "Finished training Global NNLM.", v3, 2u);
  }
}

uint64_t sub_3010(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 24);
  return result;
}

void *sub_30BC(void *result)
{
  uint64_t v1 = result[4];
  if (!*(unsigned char *)(v1 + 24))
  {
    v2 = result;
    v3 = qword_86E8;
    if (os_log_type_enabled((os_log_t)qword_86E8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "GlobalNNLM: Invalidating", v4, 2u);
      uint64_t v1 = v2[4];
    }
    *(unsigned char *)(v1 + 24) = 1;
    return [*(id *)(v2[4] + 16) invalidate];
  }
  return result;
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t xpc_activity_add_eligibility_changed_handler()
{
  return _xpc_activity_add_eligibility_changed_handler();
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return _xpc_activity_should_defer(activity);
}

id objc_msgSend__invalidate(void *a1, const char *a2, ...)
{
  return [a1 _invalidate];
}

id objc_msgSend__invalidated(void *a1, const char *a2, ...)
{
  return [a1 _invalidated];
}

id objc_msgSend_activity(void *a1, const char *a2, ...)
{
  return [a1 activity];
}

id objc_msgSend_attachments(void *a1, const char *a2, ...)
{
  return [a1 attachments];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_recipe(void *a1, const char *a2, ...)
{
  return [a1 recipe];
}

id objc_msgSend_recipeUserInfo(void *a1, const char *a2, ...)
{
  return [a1 recipeUserInfo];
}

id objc_msgSend_trainGlobalNNLMwithFidesSessionURL_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trainGlobalNNLMwithFidesSessionURL:completion:");
}
easedReturnValue();

      [v4 completeWithError:v34 completionHandler:0];
      objc_destroyWeak(&v49);
      objc_destroyWeak((id *)buf);
      goto LABEL_28;
    }
    objc_destroyWeak(&v49);
    objc_destroyWeak((id *)buf);
  }
  v35 = +[NSDate dateWithTimeIntervalSinceNow:86400.0];
  v43 = 0;
  v36 = [v4 deferWithDeadline:v35 error:&v43];
  v37 = v43;

  if (v37 || !v36)
  {
    [v4 completeWithError:v37 completionHandler:0];
  }
  else
  {
    v38 = self->_queue;
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_2E8C;
    v42[3] = &unk_4150;
    v42[4] = self;
    dispatch_sync((dispatch_queue_t)v38, v42);
    if ([(GlobalNNLMFidesPlugin *)self _invalidated])
    {
      v39 = qword_86E8;
      if (os_log_type_enabled((os_log_t)qword_86E8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v39, OS_LOG_TYPE_INFO, "GlobalNNLM: Deferred", buf, 2u);
      }
      v50 = NSLocalizedDescriptionKey;
      v51 = @"Deferred";
      v40 = +[NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
      v41 = +[NSError errorWithDomain:@"GlobalNNLMFidesPluginError" code:101 userInfo:v40];

      [v4 completeWithError:v41 completionHandler:0];
    }
    else
    {
      [(SpeechModelTrainingClient *)self->_smtClient trainGlobalNNLMwithFidesSessionURL:v36 completion:&stru_41E0];
    }
  }

LABEL_28:
}

- (BOOL)_invalidated
{
  queue = self->_queue;
  if (!queue) {
    __assert_rtn("-[GlobalNNLMFidesPlugin _invalidated]", "GlobalNNLMFidesPlugin.m", 54, "_queue");
  }
  dispatch_assert_queue_not_V2((dispatch_queue_t)queue);
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v4 = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_3010;
  v7[3] = &unk_4178;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync((dispatch_queue_t)v4, v7);
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)_invalidate
{
  queue = self->_queue;
  if (!queue) {
    __assert_rtn("-[GlobalNNLMFidesPlugin _invalidate]", "GlobalNNLMFidesPlugin.m", 42, "_queue");
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_30BC;
  block[3] = &unk_4150;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    qword_86E8 = (uint64_t)os_log_create("com.apple.speech.fides", "GlobalNNLMFidesPlugin");
    _objc_release_x1();
  }
}

@end