@interface WKRBSAssertionDelegate
- (id)invalidationCallback;
- (id)prepareForInvalidationCallback;
- (uint64_t)assertion:(id *)a1 didInvalidateWithError:;
- (uint64_t)assertion:(uint64_t)a1 didInvalidateWithError:;
- (uint64_t)assertionWillInvalidate:(id *)a1;
- (uint64_t)assertionWillInvalidate:(uint64_t)a1;
- (void)assertion:(id)a3 didInvalidateWithError:(id)a4;
- (void)assertion:(uint64_t)a1 didInvalidateWithError:;
- (void)assertionWillInvalidate:(id)a3;
- (void)assertionWillInvalidate:(uint64_t)a1;
- (void)dealloc;
- (void)setInvalidationCallback:(id)a3;
- (void)setPrepareForInvalidationCallback:(id)a3;
@end

@implementation WKRBSAssertionDelegate

- (void)setPrepareForInvalidationCallback:(id)a3
{
}

- (void)setInvalidationCallback:(id)a3
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)WKRBSAssertionDelegate;
  [(WKRBSAssertionDelegate *)&v3 dealloc];
}

- (void)assertionWillInvalidate:(id)a3
{
  buf[3] = *MEMORY[0x1E4F143B8];
  v4 = qword_1EB358348;
  BOOL v5 = os_log_type_enabled((os_log_t)qword_1EB358348, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    LODWORD(buf[0]) = 134217984;
    *(void *)((char *)buf + 4) = self;
    _os_log_impl(&dword_1985F2000, v4, OS_LOG_TYPE_DEFAULT, "%p - WKRBSAssertionDelegate: assertionWillInvalidate", (uint8_t *)buf, 0xCu);
  }
  WTF::RunLoop::main((WTF::RunLoop *)v5);
  id location = 0;
  objc_initWeak(&location, self);
  uint64_t v6 = WTF::fastMalloc((WTF *)0x10);
  *(void *)uint64_t v6 = &unk_1EE9D0070;
  *(void *)(v6 + 8) = 0;
  objc_moveWeak((id *)(v6 + 8), &location);
  buf[0] = v6;
  WTF::RunLoop::dispatch();
  uint64_t v7 = buf[0];
  buf[0] = 0;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
  }
  objc_destroyWeak(&location);
}

- (void)assertion:(id)a3 didInvalidateWithError:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = qword_1EB358348;
  BOOL v7 = os_log_type_enabled((os_log_t)qword_1EB358348, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    *(_DWORD *)buf = 134218242;
    *(void *)&void buf[4] = self;
    __int16 v12 = 2114;
    id v13 = a4;
    _os_log_impl(&dword_1985F2000, v6, OS_LOG_TYPE_DEFAULT, "%p - WKRBSAssertionDelegate: assertion was invalidated, error: %{public}@", buf, 0x16u);
  }
  WTF::RunLoop::main((WTF::RunLoop *)v7);
  id location = 0;
  objc_initWeak(&location, self);
  uint64_t v8 = WTF::fastMalloc((WTF *)0x10);
  *(void *)uint64_t v8 = &unk_1EE9D0098;
  *(void *)(v8 + 8) = 0;
  objc_moveWeak((id *)(v8 + 8), &location);
  *(void *)buf = v8;
  WTF::RunLoop::dispatch();
  uint64_t v9 = *(void *)buf;
  *(void *)buf = 0;
  if (v9) {
    (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
  }
  objc_destroyWeak(&location);
}

- (id)prepareForInvalidationCallback
{
  return objc_getProperty(self, a2, 8, 1);
}

- (id)invalidationCallback
{
  return objc_getProperty(self, a2, 16, 1);
}

- (uint64_t)assertionWillInvalidate:(uint64_t)a1
{
  *(void *)a1 = &unk_1EE9D0070;
  objc_destroyWeak((id *)(a1 + 8));
  return a1;
}

- (uint64_t)assertionWillInvalidate:(id *)a1
{
  *a1 = &unk_1EE9D0070;
  objc_destroyWeak(a1 + 1);

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)assertionWillInvalidate:(uint64_t)a1
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    if ([WeakRetained prepareForInvalidationCallback]) {
      (*(void (**)(void))([v2 prepareForInvalidationCallback] + 16))();
    }
    CFRelease(v2);
  }
}

- (uint64_t)assertion:(uint64_t)a1 didInvalidateWithError:
{
  *(void *)a1 = &unk_1EE9D0098;
  objc_destroyWeak((id *)(a1 + 8));
  return a1;
}

- (uint64_t)assertion:(id *)a1 didInvalidateWithError:
{
  *a1 = &unk_1EE9D0098;
  objc_destroyWeak(a1 + 1);

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)assertion:(uint64_t)a1 didInvalidateWithError:
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    if ([WeakRetained invalidationCallback]) {
      (*(void (**)(void))([v2 invalidationCallback] + 16))();
    }
    CFRelease(v2);
  }
}

@end