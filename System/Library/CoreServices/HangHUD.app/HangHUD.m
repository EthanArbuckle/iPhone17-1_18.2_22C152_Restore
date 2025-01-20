id sub_100004C14(double a1)
{
  void *v2;
  id v3;
  double v4;
  void *v5;
  uint64_t vars8;

  if (sub_10001B19C()) {
    +[HUDConfiguration sharedInstance];
  }
  else {
  v2 = +[HTPrefs sharedPrefs];
  }
  v3 = [v2 runloopHangTimeoutDurationMSec];

  v4 = (double)(unint64_t)v3;
  if ((double)(unint64_t)v3 <= a1) {
    +[NSString stringWithFormat:@"%.f+ ms", v4, (double)(unint64_t)v3];
  }
  else {
  v5 = +[NSString stringWithFormat:@"%.f ms", v4, *(void *)&a1];
  }

  return v5;
}

void sub_100004FF8(uint64_t a1, double a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100005078;
  v4[3] = &unk_100030618;
  v4[4] = v2;
  *(double *)&v4[5] = a2;
  dispatch_sync(v3, v4);
}

void sub_100005078(uint64_t a1)
{
  +[CATransaction setDisableActions:1];
  uint64_t v2 = sub_100004C14(*(double *)(a1 + 40));
  v4 = *(void **)(a1 + 32);
  v3 = (id *)(a1 + 32);
  [v4 setString:v2];

  v5 = sub_100006A20();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10001BD28(v3, v5);
  }
}

void sub_1000050F4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 40);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005170;
  block[3] = &unk_100030668;
  block[4] = v1;
  dispatch_sync(v2, block);
}

void sub_100005170(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = 0;
}

void sub_100005240(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id sub_10000525C()
{
  if (qword_10003E908 != -1) {
    dispatch_once(&qword_10003E908, &stru_1000306B0);
  }
  v0 = (void *)qword_10003E910;

  return v0;
}

void sub_1000052B0(id a1)
{
  id v6 = +[NSMutableArray array];
  unint64_t v1 = 2;
  do
  {
    uint64_t v2 = +[NSNumber numberWithUnsignedLongLong:v1];
    [v6 addObject:v2];

    unint64_t v3 = v1 >> 41;
    v1 *= 2;
  }
  while (!v3);
  id v4 = [v6 copy];
  v5 = (void *)qword_10003E910;
  qword_10003E910 = (uint64_t)v4;
}

void sub_100005450(id a1)
{
  qword_10003E918 = objc_alloc_init(HUDAnimator);

  _objc_release_x1();
}

void sub_1000055BC(uint64_t a1)
{
  unint64_t v3 = objc_alloc_init(HUDAnimation);
  [(HUDAnimation *)v3 setFromValue:*(double *)(a1 + 64)];
  [(HUDAnimation *)v3 setToValue:*(double *)(a1 + 72)];
  [(HUDAnimation *)v3 setStartTime:CACurrentMediaTime()];
  [(HUDAnimation *)v3 startTime];
  [(HUDAnimation *)v3 setEndTime:v2 + *(double *)(a1 + 80)];
  [(HUDAnimation *)v3 setUpdateBlock:*(void *)(a1 + 48)];
  [(HUDAnimation *)v3 setCompletionBlock:*(void *)(a1 + 56)];
  [(HUDAnimation *)v3 setIdentifier:*(void *)(a1 + 32)];
  [*(id *)(*(void *)(a1 + 40) + 8) addObject:v3];
}

void sub_100005730(uint64_t a1)
{
  double v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000058C8;
  v10[3] = &unk_100030720;
  id v11 = *(id *)(a1 + 40);
  id v3 = [v2 indexOfObjectPassingTest:v10];
  if (v3 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = v3;
    v5 = [*(id *)(*(void *)(a1 + 32) + 8) objectAtIndexedSubscript:v3];
    id v6 = objc_alloc_init(HUDAnimation);
    double v7 = CACurrentMediaTime();
    objc_msgSend(v5, "valueAtTime:");
    -[HUDAnimation setFromValue:](v6, "setFromValue:");
    [(HUDAnimation *)v6 setToValue:*(double *)(a1 + 48)];
    [(HUDAnimation *)v6 setStartTime:v7];
    [(HUDAnimation *)v6 setEndTime:v7 + *(double *)(a1 + 56)];
    v8 = [v5 updateBlock];
    [(HUDAnimation *)v6 setUpdateBlock:v8];

    uint64_t v9 = [v5 completionBlock];
    [(HUDAnimation *)v6 setCompletionBlock:v9];

    [(HUDAnimation *)v6 setRetargeted:1];
    [(HUDAnimation *)v6 setIdentifier:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 8) replaceObjectAtIndex:v4 withObject:v6];
  }
}

id sub_1000058C8(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  id v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void sub_1000059A4(uint64_t a1)
{
  double v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100005B34;
  v9[3] = &unk_100030720;
  id v10 = *(id *)(a1 + 40);
  id v3 = [v2 indexOfObjectPassingTest:v9];
  if (v3 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = v3;
    v5 = [*(id *)(*(void *)(a1 + 32) + 8) objectAtIndexedSubscript:v3];
    id v6 = objc_alloc_init(HUDAnimation);
    [v5 fromValue];
    -[HUDAnimation setFromValue:](v6, "setFromValue:");
    [v5 toValue];
    -[HUDAnimation setToValue:](v6, "setToValue:");
    [v5 startTime];
    -[HUDAnimation setStartTime:](v6, "setStartTime:");
    [v5 endTime];
    -[HUDAnimation setEndTime:](v6, "setEndTime:");
    double v7 = [v5 updateBlock];
    [(HUDAnimation *)v6 setUpdateBlock:v7];

    v8 = [v5 completionBlock];
    [(HUDAnimation *)v6 setCompletionBlock:v8];

    [(HUDAnimation *)v6 setCanceled:1];
    [(HUDAnimation *)v6 setIdentifier:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 8) replaceObjectAtIndex:v4 withObject:v6];
  }
}

id sub_100005B34(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  id v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void sub_100005BEC(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 8) count])
  {
    if (!*(void *)(*(void *)(a1 + 32) + 24))
    {
      uint64_t v2 = +[CADisplayLink displayLinkWithTarget:selector:](CADisplayLink, "displayLinkWithTarget:selector:");
      uint64_t v3 = *(void *)(a1 + 32);
      id v4 = *(void **)(v3 + 24);
      *(void *)(v3 + 24) = v2;

      id v5 = objc_alloc((Class)NSThread);
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_100005D00;
      v7[3] = &unk_100030668;
      v7[4] = *(void *)(a1 + 32);
      id v6 = [v5 initWithBlock:v7];
      CAFrameRateRange v8 = CAFrameRateRangeMake(30.0, 30.0, 30.0);
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "setPreferredFrameRateRange:", *(double *)&v8.minimum, *(double *)&v8.maximum, *(double *)&v8.preferred);
      [v6 setQualityOfService:33];
      [v6 setName:@"com.apple.hangtracerd.HUDAnimator"];
      [v6 start];
    }
  }
}

void sub_100005D00(uint64_t a1)
{
  unint64_t v1 = *(void **)(*(void *)(a1 + 32) + 24);
  uint64_t v2 = +[NSRunLoop currentRunLoop];
  [v1 addToRunLoop:v2 forMode:NSDefaultRunLoopMode];

  id v3 = +[NSRunLoop currentRunLoop];
  [v3 run];
}

void sub_100005FA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 160), 8);
  _Block_object_dispose((const void *)(v31 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100005FD0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100005FE0(uint64_t a1)
{
}

void sub_100005FE8(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 8) indexesOfObjectsPassingTest:&stru_1000307B0];
  uint64_t v3 = [*(id *)(a1[4] + 8) objectsAtIndexes:v2];
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = *(void **)(a1[4] + 8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100006148;
  v11[3] = &unk_1000307D0;
  v11[4] = a1[8];
  double v7 = [v6 indexesOfObjectsPassingTest:v11];
  if ([v7 count])
  {
    uint64_t v8 = [*(id *)(a1[4] + 8) objectsAtIndexes:v7];
    uint64_t v9 = *(void *)(a1[6] + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    [*(id *)(a1[4] + 8) removeObjectsAtIndexes:v7];
    if (![*(id *)(a1[4] + 8) count]) {
      *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
    }
  }
}

BOOL sub_100006128(id a1, HUDAnimation *a2, unint64_t a3, BOOL *a4)
{
  return ![(HUDAnimation *)a2 canceled];
}

uint64_t sub_100006148(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 endTime];
  if (v4 <= *(double *)(a1 + 32)) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = (uint64_t)[v3 canceled];
  }

  return v5;
}

void sub_10000619C(uint64_t a1)
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = [v2 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v22;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(v2);
        }
        double v7 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v8 = [v7 updateBlock];
        [v7 valueAtTime:*(double *)(a1 + 48)];
        v8[2](v8);
      }
      id v4 = [v2 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v4);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (j = 0; j != v11; j = (char *)j + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v17 + 1) + 8 * (void)j);
        v15 = objc_msgSend(v14, "completionBlock", (void)v17);

        if (v15)
        {
          v16 = [v14 completionBlock];
          ((void (**)(void, void, id))v16)[2](v16, [v14 canceled] ^ 1, objc_msgSend(v14, "retargeted"));
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v11);
  }
}

void sub_1000063B0(uint64_t a1)
{
  if (![*(id *)(*(void *)(a1 + 32) + 8) count])
  {
    [*(id *)(*(void *)(a1 + 32) + 24) invalidate];
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(void **)(v2 + 24);
    *(void *)(v2 + 24) = 0;
  }
}

id sub_100006584(uint64_t a1, void *a2, unint64_t a3)
{
  [a2 timeIntervalSinceReferenceDate];
  double v6 = sub_10001B47C((unint64_t)(v5 * 1000.0));
  double v7 = sub_10001B418((unint64_t)(v6 - (double)a3) + a1);

  return +[NSDate dateWithTimeIntervalSinceReferenceDate:v7];
}

uint64_t sub_100006710(uint64_t a1)
{
  qword_10003E928 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

id sub_100006A20()
{
  if (qword_10003E940 != -1) {
    dispatch_once(&qword_10003E940, &stru_100030860);
  }
  v0 = (void *)qword_10003E938;

  return v0;
}

void sub_100006A74(id a1)
{
  qword_10003E938 = (uint64_t)os_log_create("com.apple.hangtracer", "");

  _objc_release_x1();
}

void sub_100006B9C()
{
  v0 = sub_100006A20();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "marking hangreporter as clean to exit", v2, 2u);
  }

  unint64_t v1 = [(id)qword_10003E950 transaction];

  if (v1) {
    [(id)qword_10003E950 setTransaction:0];
  }
}

void sub_100007560(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1000075B4(id a1)
{
  unint64_t v1 = [[HTFixedSizeQueue alloc] initWithSize:128];
  uint64_t v2 = (void *)qword_10003E950;
  qword_10003E950 = (uint64_t)v1;

  if (!qword_10003E950)
  {
    id v3 = sub_100006A20();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Unable to instantiate queue to hold process launch and exit records, exiting", v4, 2u);
    }

    exit(12);
  }
}

void sub_100007D54(id a1)
{
  qword_10003E958 = [[HUDRenderServer alloc] _init];

  _objc_release_x1();
}

void sub_10000800C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10000E760();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10001BEB4(v3);
  }

  if ([v3 count])
  {
    double v5 = [*(id *)(*(void *)(a1 + 32) + 24) acquireKeepAliveAssertion];

    if (v5)
    {
      id v6 = [v3 mutableCopy];
      double v7 = [v3 objectForKeyedSubscript:off_10003E638];

      if ([v3 count] == (id)1 && v7) {
        [v6 removeAllObjects];
      }
      [v6 enumerateKeysAndObjectsUsingBlock:&stru_1000308E0];
      uint64_t v8 = sub_100008200();
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100008254;
      v10[3] = &unk_100030770;
      id v11 = v6;
      id v12 = *(id *)(a1 + 32);
      id v9 = v6;
      dispatch_sync(v8, v10);
    }
  }
}

void sub_10000817C(id a1, NSString *a2, HUDContentProtocol *a3, BOOL *a4)
{
  double v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v5;
    if (![(HUDContentProtocol *)v4 requestedToRenderTimestamp]) {
      [(HUDContentProtocol *)v4 setRequestedToRenderTimestamp:mach_absolute_time()];
    }
  }

  _objc_release_x1();
}

id sub_100008200()
{
  if (qword_10003E988 != -1) {
    dispatch_once(&qword_10003E988, &stru_100030A48);
  }
  v0 = (void *)qword_10003E980;

  return v0;
}

void sub_100008254(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count] || (uint64_t v2 = *(unsigned char **)(a1 + 40), v2[32]))
  {
    id v3 = &stru_100030900;
  }
  else
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100008320;
    v5[3] = &unk_100030668;
    id v6 = v2;
    id v3 = objc_retainBlock(v5);
  }
  id v4 = *(void **)(*(void *)(a1 + 40) + 16);
  if (v4) {
    [v4 updateHUD:*(void *)(a1 + 32) withCompletion:v3];
  }
}

id sub_100008320(uint64_t a1)
{
  return _[*(id *)(*(void *)(a1 + 32) + 24) invalidateKeepAliveAssertion];
}

void sub_10000832C(id a1, NSArray *a2)
{
  uint64_t v2 = a2;
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v4 = v2;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v25;
    *(void *)&long long v6 = 138412546;
    long long v23 = v6;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v9);
        id v11 = sub_10000E760();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          long long v20 = [v10 processName];
          id v21 = [v10 exitTimestamp];
          *(_DWORD *)buf = v23;
          v29 = v20;
          __int16 v30 = 2048;
          id v31 = v21;
          _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Adding proc exit record to the HUD update list: processName: %@, exitTimestamp:%llu", buf, 0x16u);
        }
        id v12 = [v10 processName];
        v13 = [v3 objectForKeyedSubscript:v12];

        if (v13)
        {
          v14 = [v10 processName];
          v15 = [v3 objectForKeyedSubscript:v14];

          v16 = sub_10000E760();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            long long v17 = [v15 processName];
            id v18 = [v15 exitTimestamp];
            *(_DWORD *)buf = v23;
            v29 = v17;
            __int16 v30 = 2048;
            id v31 = v18;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, " Overwriting the exiting proc exit item sharing the same process name %@ with exitTimestamp: %llu", buf, 0x16u);
          }
        }
        long long v19 = objc_msgSend(v10, "processName", v23, (void)v24);
        [v3 setObject:v10 forKeyedSubscript:v19];

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSArray *)v4 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v7);
  }

  if ([v3 count])
  {
    long long v22 = +[HUDContextUpdater sharedInstance];
    [v22 addHUDContents:v3];
  }
}

void sub_1000085E8(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = +[HangHUDServiceSpecification domainName];
  [v5 setDomain:v3];

  id v4 = +[HangHUDServiceSpecification identifier];
  [v5 setService:v4];

  [v5 setDelegate:*(void *)(a1 + 32)];
}

id sub_100008738(uint64_t a1)
{
  uint64_t v2 = sub_10000E760();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10001BF2C(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  id v10 = [HUDContext alloc];
  id v11 = sub_100008200();
  id v12 = [(HUDContext *)v10 initWithQueue:v11];
  uint64_t v13 = *(void *)(a1 + 32);
  v14 = *(void **)(v13 + 16);
  *(void *)(v13 + 16) = v12;

  return [*(id *)(*(void *)(a1 + 32) + 16) setHangHUDUpdaterLatencyInMS:50.0];
}

void sub_1000089C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (*(void *)(a1 + 32)) {
    objc_msgSend(v3, "setUserInfo:");
  }
  uint64_t v5 = +[HangHUDServiceSpecification interface];
  [v4 setInterface:v5];

  [v4 setInterfaceTarget:*(void *)(a1 + 40)];
  uint64_t v6 = +[HangHUDServiceSpecification serviceQuality];
  [v4 setServiceQuality:v6];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100008AB8;
  v7[3] = &unk_1000309B8;
  v7[4] = *(void *)(a1 + 40);
  [v4 setInvalidationHandler:v7];
}

void sub_100008AB8(uint64_t a1)
{
  uint64_t v2 = sub_100008200();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008B44;
  block[3] = &unk_100030668;
  block[4] = *(void *)(a1 + 32);
  dispatch_sync(v2, block);
}

id sub_100008B44(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) clearHUDLinesAnimated:1];
}

id sub_100009448(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) clearHUDLinesAnimated:1];
}

void sub_100009B98(id a1)
{
  qword_10003E968 = objc_alloc_init(HUDContextUpdater);

  _objc_release_x1();
}

id sub_100009CAC(uint64_t a1)
{
  uint64_t v2 = sub_10000E760();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10001C464(a1);
  }

  return [*(id *)(a1 + 32) HandleUpdateAndClear];
}

void sub_10000A344(id a1)
{
  qword_10003E980 = (uint64_t)dispatch_queue_create("com.apple.HangHUD.HUDUpdateQueue", 0);

  _objc_release_x1();
}

void sub_10000A384(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_10000A3A4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_10000A3C0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

id sub_10000A400(uint64_t a1)
{
  if (a1 == 2) {
    +[HUDTheme darkModeTheme];
  }
  else {
  unint64_t v1 = +[HUDTheme lightModeTheme];
  }

  return v1;
}

void sub_10000A820(id a1)
{
  id v1 = objc_alloc_init((Class)NSCache);
  uint64_t v2 = (void *)qword_10003E998;
  qword_10003E998 = (uint64_t)v1;

  id v3 = (void *)qword_10003E998;

  [v3 setCountLimit:20];
}

void sub_10000ADE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000AE10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadThemeColors];
}

void sub_10000AE50(uint64_t a1)
{
  [*(id *)(a1 + 32) updateHUDLineWithId:@"some-id" content:*(void *)(a1 + 40) options:0];
  uint64_t v2 = [*(id *)(a1 + 48) valueLayer];
  [v2 preferredFrameSize];
  objc_msgSend(*(id *)(a1 + 32), "setMinimumValueLayerWidth:");

  id v3 = *(void **)(a1 + 32);
  id v5 = [v3 hudLines];
  uint64_t v4 = [v5 objectForKeyedSubscript:@"some-id"];
  [v3 updateCornerRadiusAndSidePaddingIfNecessary:v4];
}

id sub_10000B240(uint64_t a1)
{
  uint64_t v2 = sub_100006A20();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:NSKeyValueChangeOldKey];
    uint64_t v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:NSKeyValueChangeNewKey];
    *(_DWORD *)buf = 138412546;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "HangTracer HUD new orientation %@ → %@", buf, 0x16u);
  }
  sub_10001ACF4();
  id v5 = *(void **)(a1 + 40);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000B390;
  v7[3] = &unk_100030668;
  v7[4] = v5;
  return [v5 performHUDUpdate:v7];
}

void sub_10000B390(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) hudLines];
  id v5 = [v2 allKeys];

  objc_msgSend(*(id *)(a1 + 32), "layoutHUDLines:ids:", objc_msgSend(v5, "count"), v5);
  objc_msgSend(*(id *)(a1 + 32), "determineNewFrameForRootLayer:numberOfLines:", objc_msgSend(v5, "count"), v3, v4);
}

id sub_10000B438(uint64_t a1)
{
  uint64_t v2 = sub_100006A20();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    double v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:NSKeyValueChangeOldKey];
    double v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:NSKeyValueChangeNewKey];
    *(_DWORD *)buf = 138412546;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "HangTracer HUD new bounds %@ → %@", buf, 0x16u);
  }
  sub_10001AD10();
  [*(id *)(a1 + 40) setDisplayScaleDependentPropertiesOnLayers];
  id v5 = *(void **)(a1 + 40);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000B590;
  v7[3] = &unk_100030668;
  v7[4] = v5;
  return [v5 performHUDUpdate:v7];
}

void sub_10000B590(uint64_t a1)
{
  [*(id *)(a1 + 32) setSidePadding:0.0];
  [*(id *)(a1 + 32) setLastKnownMaxKeyLayerWidth:0.0];
  uint64_t v2 = [*(id *)(a1 + 32) hudLines];
  double v3 = [v2 allKeys];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v8);
        __int16 v10 = objc_msgSend(*(id *)(a1 + 32), "hudLines", (void)v14);
        id v11 = [v10 objectForKeyedSubscript:v9];
        sub_10001A688();
        objc_msgSend(v11, "setFontSize:");

        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  objc_msgSend(*(id *)(a1 + 32), "layoutHUDLines:ids:", objc_msgSend(v4, "count"), v4);
  objc_msgSend(*(id *)(a1 + 32), "determineNewFrameForRootLayer:numberOfLines:", objc_msgSend(v4, "count"), v12, v13);
}

void sub_10000B980(uint64_t a1)
{
  double v2 = -[HUDLine contentScaleForTexts]_0();
  CATransform3DMakeScale(&v7, v2, v2, v2);
  double v3 = [*(id *)(a1 + 32) rootLayer];
  CATransform3D v6 = v7;
  [v3 setTransform:&v6];

  id v4 = [*(id *)(a1 + 32) containerLayer];
  objc_msgSend(v4, "setShadowOffset:", 0.0, 10.0 / v2);

  id v5 = [*(id *)(a1 + 32) containerLayer];
  [v5 setShadowRadius:25.0 / v2];
}

void sub_10000BDCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v7);
  _Unwind_Resume(a1);
}

void sub_10000BDF8(id a1, NSString *a2, HUDLine *a3, BOOL *a4)
{
  id v4 = a3;
  [(HUDLine *)v4 removeFromSuperlayer];
  [(HUDLine *)v4 nilifyCALayers];
}

void sub_10000BE3C(uint64_t a1, uint64_t a2)
{
}

void sub_10000BE48(uint64_t a1)
{
}

void sub_10000BE50(uint64_t a1)
{
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  double v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained[1];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10000BEEC;
    v6[3] = &unk_100030770;
    uint64_t v5 = *(void *)(a1 + 32);
    v6[4] = v3;
    v6[5] = v5;
    dispatch_async(v4, v6);
  }
}

void sub_10000BEEC(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) containerLayer];

  if (v2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 16));
    double v3 = [*(id *)(a1 + 32) hudLines];
    [v3 enumerateKeysAndObjectsUsingBlock:&stru_100030B18];

    id v4 = [*(id *)(a1 + 32) hudLines];
    [v4 removeAllObjects];

    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    uint64_t v8 = [*(id *)(a1 + 32) containerLayer];
    objc_msgSend(v8, "setFrame:", CGRectZero.origin.x, y, width, height);

    uint64_t v9 = [*(id *)(a1 + 32) rootLayer];
    [v9 setHidden:1];

    [*(id *)(a1 + 32) invalidate];
    __int16 v10 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 16);
    os_unfair_lock_unlock(v10);
  }
  else
  {
    id v11 = sub_100006A20();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_10001C6DC(v11);
    }
  }
}

void sub_10000C028(id a1, NSString *a2, HUDLine *a3, BOOL *a4)
{
  id v4 = a3;
  [(HUDLine *)v4 removeFromSuperlayer];
  [(HUDLine *)v4 nilifyCALayers];
}

void sub_10000C2B4(uint64_t a1)
{
  double v2 = +[NSMutableArray array];
  double v3 = [*(id *)(a1 + 32) hudLines];
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_10000C644;
  v41[3] = &unk_100030B68;
  id v42 = *(id *)(a1 + 40);
  id v43 = *(id *)(a1 + 48);
  id v4 = v2;
  id v44 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v41];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v38;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        id v11 = objc_msgSend(*(id *)(a1 + 32), "hudLines", (void)v37);
        double v12 = [v11 objectForKeyedSubscript:v10];
        [v12 removeFromSuperlayer];

        double v13 = [*(id *)(a1 + 32) hudLines];
        [v13 removeObjectForKey:v10];

        long long v14 = [*(id *)(a1 + 32) hudContentWithPendingAnimations];
        [v14 removeObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v7);
  }

  long long v15 = sub_100006A20();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_10001C720(a1, v15, v16, v17, v18, v19, v20, v21);
  }

  long long v22 = [*(id *)(a1 + 32) containerLayer];
  [v22 removeAllAnimations];

  if (*(void *)(a1 + 56))
  {
    unint64_t v23 = 0;
    do
    {
      long long v24 = objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", v23, (void)v37);
      long long v25 = [*(id *)(a1 + 40) objectForKeyedSubscript:v24];
      objc_msgSend(*(id *)(a1 + 32), "HangHUD_updater_latency_in_ms");
      uint64_t v27 = sub_10001AD54(v25, *(void *)(a1 + 64), v26 + 50.0);
      if ([v25 timedOut]) {
        uint64_t v28 = v27 | 2;
      }
      else {
        uint64_t v28 = v27;
      }
      [*(id *)(a1 + 32) updateHUDLineWithId:v24 content:v25 options:v28];

      ++v23;
      unint64_t v29 = *(void *)(a1 + 56);
    }
    while (v23 < v29);
  }
  else
  {
    unint64_t v29 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "layoutHUDLines:ids:", v29, *(void *)(a1 + 48), (void)v37);
  objc_msgSend(*(id *)(a1 + 32), "determineNewFrameForRootLayer:numberOfLines:", *(int *)(a1 + 56));
  __int16 v30 = [*(id *)(a1 + 32) containerLayer];
  id v31 = [v30 sublayers];
  id v32 = [v31 count];

  if (v32)
  {
    v33 = [*(id *)(a1 + 32) rootLayer];
    [v33 setHidden:0];

    v34 = [*(id *)(a1 + 32) containerLayer];
    [v34 setHidden:0];

    v35 = [*(id *)(a1 + 32) containerLayer];
    LODWORD(v36) = 1.0;
    [v35 setOpacity:v36];
  }
}

void sub_10000C644(id *a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = objc_msgSend(a1[4], "objectForKeyedSubscript:");
  if (!v3
    || (id v4 = (void *)v3, v5 = [a1[5] indexOfObject:v6],
                         v4,
                         v5 == (id)0x7FFFFFFFFFFFFFFFLL))
  {
    [a1[6] addObject:v6];
  }
}

uint64_t sub_10000C6D4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000C8BC(uint64_t a1)
{
  double v2 = +[NSMutableArray array];
  uint64_t v3 = [*(id *)(a1 + 32) hudLines];
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_10000CCEC;
  v48[3] = &unk_100030B68;
  id v49 = *(id *)(a1 + 40);
  id v50 = *(id *)(a1 + 48);
  id v4 = v2;
  id v51 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v48];

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v44 objects:v54 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v45;
    *(void *)&long long v7 = 138412290;
    long long v43 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v45 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v44 + 1) + 8 * i);
        double v12 = objc_msgSend(*(id *)(a1 + 32), "hudLines", v43, (void)v44);
        double v13 = [v12 objectForKeyedSubscript:v11];
        [v13 removeFromSuperlayer];

        long long v14 = [*(id *)(a1 + 32) hudLines];
        long long v15 = [v14 objectForKeyedSubscript:v11];
        [v15 nilifyCALayers];

        uint64_t v16 = [*(id *)(a1 + 32) hudLines];
        [v16 removeObjectForKey:v11];

        uint64_t v17 = sub_100006A20();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v43;
          uint64_t v53 = v11;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Removed hudLines item %@", buf, 0xCu);
        }

        uint64_t v18 = [*(id *)(a1 + 32) hudContentWithPendingAnimations];
        [v18 removeObject:v11];
      }
      id v8 = [v5 countByEnumeratingWithState:&v44 objects:v54 count:16];
    }
    while (v8);
  }

  uint64_t v19 = sub_100006A20();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    sub_10001C790(a1, v19, v20, v21, v22, v23, v24, v25);
  }

  double v26 = [*(id *)(a1 + 32) containerLayer];
  [v26 removeAllAnimations];

  if (*(void *)(a1 + 56))
  {
    unint64_t v27 = 0;
    do
    {
      uint64_t v28 = [*(id *)(a1 + 48) objectAtIndexedSubscript:v27];
      unint64_t v29 = [*(id *)(a1 + 40) objectForKeyedSubscript:v28];
      objc_msgSend(*(id *)(a1 + 32), "HangHUD_updater_latency_in_ms");
      uint64_t v31 = [v29 isCurrent:*(void *)(a1 + 64) withHUDUpdateInterval:v30 + 50.0];
      if ([v29 isTimedOut]) {
        uint64_t v32 = v31 | 2;
      }
      else {
        uint64_t v32 = v31;
      }
      [*(id *)(a1 + 32) updateHUDLineWithId:v28 content:v29 options:v32];

      ++v27;
      unint64_t v33 = *(void *)(a1 + 56);
    }
    while (v27 < v33);
  }
  else
  {
    unint64_t v33 = 0;
  }
  [*(id *)(a1 + 32) layoutHUDLines:v33 ids:*(void *)(a1 + 48)];
  objc_msgSend(*(id *)(a1 + 32), "determineNewFrameForRootLayer:numberOfLines:", *(int *)(a1 + 56));
  v34 = [*(id *)(a1 + 32) containerLayer];
  v35 = [v34 sublayers];
  id v36 = [v35 count];

  if (v36)
  {
    long long v37 = [*(id *)(a1 + 32) rootLayer];
    [v37 setHidden:0];

    long long v38 = [*(id *)(a1 + 32) containerLayer];
    [v38 setHidden:0];

    objc_msgSend(*(id *)(a1 + 32), "HUD_background_opacity");
    float v40 = v39;
    v41 = [*(id *)(a1 + 32) containerLayer];
    *(float *)&double v42 = v40;
    [v41 setOpacity:v42];
  }
}

void sub_10000CCEC(id *a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = objc_msgSend(a1[4], "objectForKeyedSubscript:");
  if (!v3
    || (id v4 = (void *)v3, v5 = [a1[5] indexOfObject:v6],
                         v4,
                         v5 == (id)0x7FFFFFFFFFFFFFFFLL))
  {
    [a1[6] addObject:v6];
  }
}

uint64_t sub_10000CD7C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000D5B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10000D5F0(uint64_t a1, uint64_t a2, void *a3)
{
  id v20 = a3;
  uint64_t v4 = [v20 keyLayer];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = [v20 keyLayer];
    [v6 preferredFrameSize];
    double v8 = v7;
    double v9 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);

    if (v8 > v9)
    {
      uint64_t v10 = [v20 keyLayer];
      [v10 preferredFrameSize];
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v11;
    }
  }
  uint64_t v12 = [v20 valueLayer];
  if (v12)
  {
    double v13 = (void *)v12;
    long long v14 = [v20 valueLayer];
    [v14 preferredFrameSize];
    double v16 = v15;
    double v17 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);

    if (v16 > v17)
    {
      uint64_t v18 = [v20 valueLayer];
      [v18 preferredFrameSize];
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v19;
    }
  }
}

void sub_10000D93C(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) currentTheme];
  id v3 = [v2 backgroundColor];
  uint64_t v4 = [*(id *)(a1 + 32) containerLayer];
  [v4 setBackgroundColor:v3];

  id v5 = [*(id *)(a1 + 32) hudLines];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000DA50;
  v9[3] = &unk_100030C08;
  void v9[4] = *(void *)(a1 + 32);
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  id v6 = [*(id *)(a1 + 32) lastKnownHangs];

  if (v6)
  {
    double v7 = *(void **)(a1 + 32);
    double v8 = [v7 lastKnownHangs];
    [v7 updateHangs:v8 withCompletion:&stru_100030C28];
  }
}

void sub_10000DA50(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [*(id *)(a1 + 32) currentTheme];
    [v5 setCurrentTheme:v4];
  }
}

void sub_10000DD0C(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) getKeyForLine:*(void *)(a1 + 40)];
  if (v2)
  {
    id v3 = sub_100006A20();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_10001C800((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
    }

    uint64_t v10 = [*(id *)(a1 + 32) hudContentWithPendingAnimations];
    [v10 removeObject:v2];
  }
}

void sub_10000DE30(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) getKeyForLine:*(void *)(a1 + 40)];
  if (v2)
  {
    id v3 = sub_100006A20();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_10001C86C((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
    }

    uint64_t v10 = [*(id *)(a1 + 32) hudContentWithPendingAnimations];
    [v10 addObject:v2];
  }
}

void sub_10000E108(id a1)
{
  qword_10003E9A0 = objc_alloc_init(ProcessExitScreener);

  _objc_release_x1();
}

void sub_10000E720(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void sub_10000E740(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x1Cu);
}

id sub_10000E760()
{
  if (qword_10003E9B8 != -1) {
    dispatch_once(&qword_10003E9B8, &stru_100030C68);
  }
  v0 = (void *)qword_10003E9B0;

  return v0;
}

void sub_10000E7B4(id a1)
{
  qword_10003E9B0 = (uint64_t)os_log_create("com.apple.HangHUD", "");

  _objc_release_x1();
}

void sub_10000EE34(id a1)
{
  UIFontForLanguage = CTFontCreateUIFontForLanguage((CTFontUIFontType)0x6Au, 0.0, 0);
  double v2 = CTFontCopyFontDescriptor(UIFontForLanguage);
  CFStringRef v6 = kCTFontOpticalSizeAttribute;
  id v3 = +[NSNumber numberWithDouble:sub_10001A3E0()];
  uint64_t v7 = v3;
  CFDictionaryRef v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  CopyWithAttributes = CTFontDescriptorCreateCopyWithAttributes(v2, v4);

  qword_10003E9C8 = (uint64_t)CTFontCreateWithFontDescriptor(CopyWithAttributes, 0.0, 0);
  CFRelease(UIFontForLanguage);
  CFRelease(v2);
  CFRelease(CopyWithAttributes);
}

void sub_10000EF48(id a1)
{
  UIFontForLanguage = CTFontCreateUIFontForLanguage((CTFontUIFontType)0x6Au, 0.0, 0);
  double v2 = CTFontCopyFontDescriptor(UIFontForLanguage);
  CopyWithFeature = CTFontDescriptorCreateCopyWithFeature(v2, (CFNumberRef)&off_100035B10, (CFNumberRef)&off_100035B28);
  CFStringRef v7 = kCTFontOpticalSizeAttribute;
  CFDictionaryRef v4 = +[NSNumber numberWithDouble:sub_10001A3E0()];
  uint64_t v8 = v4;
  CFDictionaryRef v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  CopyWithAttributes = CTFontDescriptorCreateCopyWithAttributes(CopyWithFeature, v5);

  qword_10003E9D8 = (uint64_t)CTFontCreateWithFontDescriptor(CopyWithAttributes, 0.0, 0);
  CFRelease(UIFontForLanguage);
  CFRelease(v2);
  CFRelease(CopyWithFeature);
  CFRelease(CopyWithAttributes);
}

void sub_10000F07C(id a1)
{
  qword_10003E9E8 = (uint64_t)CTFontCreateUIFontForLanguage((CTFontUIFontType)0x6Au, 0.0, 0);
}

void sub_10000FDA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000FDC0(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  [v9 preferredFrameSize];
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = v5
                                                              + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 32);
  double v6 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  [v9 preferredFrameSize];
  if (v6 < v7)
  {
    [v9 preferredFrameSize];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v8;
  }
  if (a3) {
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = *(double *)(*(void *)(a1 + 32) + 8)
  }
                                                                + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 32);
}

void sub_100010870(uint64_t a1)
{
  double v2 = +[NSProcessInfo processInfo];
  id v3 = [v2 processName];
  id v6 = +[NSString stringWithFormat:@"%@ (%i) : %p", v3, getpid(), *(void *)(a1 + 32)];

  id v4 = [objc_alloc(*(Class *)(a1 + 32)) initWithIdentifier:v6];
  double v5 = (void *)qword_10003E9F0;
  qword_10003E9F0 = (uint64_t)v4;
}

void sub_100010B88(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v4 = +[HangHUDServiceSpecification clientContextIdentifierKey];
  [v3 encodeObject:v2 forKey:v4];
}

void sub_100010C00(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[HangHUDServiceSpecification interface];
  [v3 setInterface:v4];

  double v5 = +[HangHUDServiceSpecification serviceQuality];
  [v3 setServiceQuality:v5];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100010D98;
  v10[3] = &unk_1000309B8;
  id v11 = *(id *)(a1 + 32);
  [v3 setActivationHandler:v10];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100010DEC;
  v8[3] = &unk_1000309B8;
  id v9 = *(id *)(a1 + 32);
  [v3 setInterruptionHandler:v8];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100010E58;
  v6[3] = &unk_1000309B8;
  id v7 = *(id *)(a1 + 32);
  [v3 setInvalidationHandler:v6];
}

void sub_100010D98(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  [WeakRetained serverRunningDidChange:*(void *)(a1 + 32)];
}

void sub_100010DEC(uint64_t a1, void *a2)
{
  id v3 = (id *)(*(void *)(a1 + 32) + 24);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained serverRunningDidChange:*(void *)(a1 + 32)];

  [v5 activate];
}

void sub_100010E58(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  [WeakRetained serverRunningDidChange:*(void *)(a1 + 32)];
}

id sub_1000117FC(unsigned int a1)
{
  if (a1 >= 0x2A)
  {
    id v1 = +[NSString stringWithFormat:@"%d", a1];
  }
  else
  {
    id v1 = *(&off_100030D60 + (char)a1);
  }

  return v1;
}

id sub_100011868(unsigned int a1)
{
  char v1 = a1 - 4;
  if (a1 - 4 < 0x26 && ((0x3789044BDDuLL >> v1) & 1) != 0)
  {
    id v3 = *(&off_100030EB0 + v1);
  }
  else
  {
    uint64_t v2 = sub_1000117FC(a1);
    id v3 = [v2 capitalizedString];
  }

  return v3;
}

id sub_1000118E8(uint64_t a1)
{
  if ((a1 - 1) >= 0x1F)
  {
    char v1 = +[NSString stringWithFormat:@"SIG%d", a1];
  }
  else
  {
    char v1 = *(&off_100030FE0 + (int)a1 - 1);
  }

  return v1;
}

id sub_100011950(uint64_t a1)
{
  if (a1 >= 0x10)
  {
    char v1 = +[NSString stringWithFormat:@"%d", a1];
  }
  else
  {
    char v1 = *(&off_1000310D8 + (int)a1);
  }

  return v1;
}

id sub_1000119B4(uint64_t a1)
{
  int v1 = a1 - 2;
  if (a1 - 2) < 0xE && ((0x2655u >> v1))
  {
    id v3 = *(&off_100031158 + v1);
  }
  else
  {
    uint64_t v2 = sub_100011950(a1);
    id v3 = [v2 capitalizedString];
  }

  return v3;
}

__CFString *sub_100011A28(uint64_t a1)
{
  if (a1 > 3221229822)
  {
    if (a1 <= 3306925314)
    {
      switch(a1)
      {
        case 3221229823:
          uint64_t v2 = @"thermal pressure";
          return v2;
        case 3306925313:
          uint64_t v2 = @"cpu violation";
          return v2;
        case 3306925314:
          uint64_t v2 = @"walltime violation";
          return v2;
      }
    }
    else if (a1 > 3735943696)
    {
      if (a1 == 3735943697)
      {
        uint64_t v2 = @"user quit";
        return v2;
      }
      if (a1 == 4227595259)
      {
        uint64_t v2 = @"force quit";
        return v2;
      }
    }
    else
    {
      if (a1 == 3306925315)
      {
        uint64_t v2 = @"system busy";
        return v2;
      }
      if (a1 == 3735883980)
      {
        uint64_t v2 = @"resource exclusion";
        return v2;
      }
    }
LABEL_62:
    uint64_t v2 = +[NSString stringWithFormat:@"%#llx", a1];
    return v2;
  }
  if (a1 <= 1539435072)
  {
    switch(a1)
    {
      case 95805101:
        uint64_t v2 = @"application assertion";
        return v2;
      case 439025681:
        uint64_t v2 = @"input ui scene";
        return v2;
      case 732775916:
        uint64_t v2 = @"secure draw violation";
        return v2;
    }
    goto LABEL_62;
  }
  if (a1 > 1539435076)
  {
    if (a1 == 1539435077)
    {
      uint64_t v2 = @"legacy clear the board";
      return v2;
    }
    if (a1 == 2343432205)
    {
      uint64_t v2 = @"watchdog";
      return v2;
    }
    goto LABEL_62;
  }
  if (a1 != 1539435073)
  {
    if (a1 == 1539435076)
    {
      uint64_t v2 = @"clear the board";
      return v2;
    }
    goto LABEL_62;
  }
  uint64_t v2 = @"languages changed";
  return v2;
}

__CFString *sub_100011CF0(uint64_t a1)
{
  if (a1 > 1539435076)
  {
    if (a1 != 1539435077)
    {
      if (a1 == 3306925313)
      {
        uint64_t v1 = @"CPU Violation";
        goto LABEL_11;
      }
      goto LABEL_8;
    }
    uint64_t v1 = @"Legacy Clear the Board";
  }
  else
  {
    if (a1 != 439025681)
    {
      if (a1 == 1539435076)
      {
        uint64_t v1 = @"Clear the Board";
        goto LABEL_11;
      }
LABEL_8:
      uint64_t v2 = sub_100011A28(a1);
      uint64_t v1 = [v2 capitalizedString];

      goto LABEL_11;
    }
    uint64_t v1 = @"InputUI Scene";
  }
LABEL_11:

  return v1;
}

id sub_100011DBC(uint64_t a1)
{
  if ((a1 - 1) >= 4)
  {
    uint64_t v1 = +[NSString stringWithFormat:@"%d", a1];
  }
  else
  {
    uint64_t v1 = *(&off_1000311C8 + (int)a1 - 1);
  }

  return v1;
}

id sub_100011E24(uint64_t a1)
{
  uint64_t v1 = sub_100011DBC(a1);
  uint64_t v2 = [v1 capitalizedString];

  return v2;
}

id sub_100011E70(uint64_t a1)
{
  if ((a1 - 1) >= 0x13)
  {
    uint64_t v1 = +[NSString stringWithFormat:@"%d", a1];
  }
  else
  {
    uint64_t v1 = *(&off_1000311E8 + (int)a1 - 1);
  }

  return v1;
}

id sub_100011ED8(uint64_t a1)
{
  int v1 = a1 - 1;
  if (a1 - 1) < 0x13 && ((0x55F7Fu >> v1))
  {
    id v3 = *(&off_100031280 + v1);
  }
  else
  {
    uint64_t v2 = sub_100011E70(a1);
    id v3 = [v2 capitalizedString];
  }

  return v3;
}

id sub_100011F50(uint64_t a1)
{
  if ((a1 - 1) >= 5)
  {
    int v1 = +[NSString stringWithFormat:@"%d", a1];
  }
  else
  {
    int v1 = *(&off_100031318 + (int)a1 - 1);
  }

  return v1;
}

__CFString *sub_100011FB8(uint64_t a1)
{
  if (a1 == 5)
  {
    int v1 = @"JIT";
  }
  else
  {
    uint64_t v2 = sub_100011F50(a1);
    int v1 = [v2 capitalizedString];
  }

  return v1;
}

id sub_100012018(uint64_t a1)
{
  if ((a1 - 1) >= 9)
  {
    int v1 = +[NSString stringWithFormat:@"%u", a1];
  }
  else
  {
    int v1 = *(&off_100031340 + (int)a1 - 1);
  }

  return v1;
}

__CFString *sub_100012080(uint64_t a1)
{
  switch(a1)
  {
    case 2:
      int v1 = @"Unknown IPC";
      break;
    case 6:
      int v1 = @"Sandbox Filtered IPC";
      break;
    case 4:
      int v1 = @"SIGTERM Timeout";
      break;
    default:
      uint64_t v2 = sub_100012018(a1);
      int v1 = [v2 capitalizedString];

      break;
  }

  return v1;
}

id sub_100012108(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  if (unint64_t)(a1 - 1) < 9 && ((0x17Fu >> v1))
  {
    uint64_t v2 = *(&off_100031388 + v1);
  }
  else
  {
    uint64_t v2 = +[NSString stringWithFormat:@"%llu", a1];
  }

  return v2;
}

id sub_10001217C(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  if (unint64_t)(a1 - 1) < 7 && ((0x47u >> v1))
  {
    id v3 = *(&off_1000313D0 + v1);
  }
  else
  {
    uint64_t v2 = sub_100012108(a1);
    id v3 = [v2 capitalizedString];
  }

  return v3;
}

__CFString *sub_1000121F0(uint64_t a1)
{
  if (a1 <= 2343432204)
  {
    if (a1 <= 562215633)
    {
      switch(a1)
      {
        case 0:
          uint64_t v2 = @"none";
          return v2;
        case 97132013:
          uint64_t v2 = @"conditions changed";
          return v2;
        case 562215597:
          uint64_t v2 = @"assertion timeout";
          return v2;
      }
    }
    else
    {
      if (a1 <= 562215635)
      {
        if (a1 == 562215634)
        {
          uint64_t v2 = @"background task assertion timeout";
        }
        else
        {
          uint64_t v2 = @"background url session completion timeout";
        }
        return v2;
      }
      if (a1 == 562215636)
      {
        uint64_t v2 = @"background fetch completion timeout";
        return v2;
      }
      if (a1 == 732775916)
      {
        uint64_t v2 = @"security violation";
        return v2;
      }
    }
LABEL_66:
    uint64_t v2 = +[NSString stringWithFormat:@"%#llx", a1];
    return v2;
  }
  if (a1 > 3490524076)
  {
    if (a1 > 3735905537)
    {
      if (a1 == 3735905538)
      {
        uint64_t v2 = @"termination assertion";
        return v2;
      }
      if (a1 == 3735943697)
      {
        uint64_t v2 = @"user initiated quit";
        return v2;
      }
    }
    else
    {
      if (a1 == 3490524077)
      {
        uint64_t v2 = @"max assertions violation";
        return v2;
      }
      if (a1 == 3735883980)
      {
        uint64_t v2 = @"resource exclusion";
        return v2;
      }
    }
    goto LABEL_66;
  }
  if (a1 > 2970726672)
  {
    if (a1 == 2970726673)
    {
      uint64_t v2 = @"process exited";
      return v2;
    }
    if (a1 == 3221229823)
    {
      uint64_t v2 = @"thermal pressure";
      return v2;
    }
    goto LABEL_66;
  }
  if (a1 != 2343432205)
  {
    if (a1 == 2970405393)
    {
      uint64_t v2 = @"max states violation";
      return v2;
    }
    goto LABEL_66;
  }
  uint64_t v2 = @"watchdog violation";
  return v2;
}

__CFString *sub_1000124E8(uint64_t a1)
{
  if (a1 <= 2970405392)
  {
    if (!a1)
    {
      uint64_t v1 = @"None Provided";
      goto LABEL_13;
    }
    if (a1 == 562215635)
    {
      uint64_t v1 = @"Background URL Session Completion Timeout";
      goto LABEL_13;
    }
  }
  else
  {
    switch(a1)
    {
      case 2970405393:
        uint64_t v1 = @"Maximum States Violation";
        goto LABEL_13;
      case 3490524077:
        uint64_t v1 = @"Maximum Assertions Violation";
        goto LABEL_13;
      case 3735943697:
        uint64_t v1 = @"User-Initiated Quit";
        goto LABEL_13;
    }
  }
  uint64_t v2 = sub_1000121F0(a1);
  uint64_t v1 = [v2 capitalizedString];

LABEL_13:

  return v1;
}

id sub_1000125C4(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 5)
  {
    uint64_t v1 = +[NSString stringWithFormat:@"%llu", a1];
  }
  else
  {
    uint64_t v1 = *(&off_100031408 + a1 - 1);
  }

  return v1;
}

id sub_10001262C(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  if (unint64_t)(a1 - 1) < 5 && ((0x1Du >> v1))
  {
    id v3 = *(&off_100031430 + v1);
  }
  else
  {
    uint64_t v2 = sub_1000125C4(a1);
    id v3 = [v2 capitalizedString];
  }

  return v3;
}

id sub_1000126A0(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 3)
  {
    uint64_t v1 = +[NSString stringWithFormat:@"%llu", a1];
  }
  else
  {
    uint64_t v1 = *(&off_100031458 + a1 - 1);
  }

  return v1;
}

id sub_100012708(uint64_t a1)
{
  uint64_t v1 = sub_1000126A0(a1);
  uint64_t v2 = [v1 capitalizedString];

  return v2;
}

__CFString *sub_100012754(uint64_t a1)
{
  switch(a1)
  {
    case 1:
      uint64_t v2 = @"service timeout";
      break;
    case 1001:
      uint64_t v2 = @"chronokit";
      break;
    case 2:
      uint64_t v2 = @"timeout no diags";
      break;
    default:
      uint64_t v2 = +[NSString stringWithFormat:@"%llu", a1];
      break;
  }
  return v2;
}

__CFString *sub_100012800(uint64_t a1)
{
  if (a1 == 2)
  {
    uint64_t v1 = @"Service Timeout Diagnostics Unavailable";
  }
  else if (a1 == 1001)
  {
    uint64_t v1 = @"ChronoKit";
  }
  else
  {
    uint64_t v2 = sub_100012754(a1);
    uint64_t v1 = [v2 capitalizedString];
  }

  return v1;
}

__CFString *sub_100012874(uint64_t a1)
{
  if (a1 == 1)
  {
    uint64_t v2 = @"api violation";
  }
  else if (a1 == 2)
  {
    uint64_t v2 = @"internal error";
  }
  else
  {
    uint64_t v2 = +[NSString stringWithFormat:@"%llu", a1];
  }
  return v2;
}

__CFString *sub_100012900(uint64_t a1)
{
  if (a1 == 1)
  {
    uint64_t v1 = @"API Violation";
  }
  else
  {
    uint64_t v2 = sub_100012874(a1);
    uint64_t v1 = [v2 capitalizedString];
  }

  return v1;
}

id sub_100012960(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  if (unint64_t)(a1 - 1) < 0x15 && ((0x183FFFu >> v1))
  {
    uint64_t v2 = *(&off_100031470 + v1);
  }
  else
  {
    uint64_t v2 = +[NSString stringWithFormat:@"%llu", a1];
  }

  return v2;
}

id sub_1000129D8(uint64_t a1)
{
  uint64_t v1 = a1 - 11;
  if (unint64_t)(a1 - 11) < 0xB && ((0x60Fu >> v1))
  {
    id v3 = *(&off_100031518 + v1);
  }
  else
  {
    uint64_t v2 = sub_100012960(a1);
    id v3 = [v2 capitalizedString];
  }

  return v3;
}

id sub_100012A4C(int a1, uint64_t a2)
{
  switch(a1)
  {
    case 1:
      uint64_t v2 = sub_100011950(a2);
      break;
    case 2:
      uint64_t v2 = sub_1000118E8(a2);
      break;
    case 3:
      uint64_t v2 = sub_100011DBC(a2);
      break;
    case 6:
      uint64_t v2 = sub_100012108(a2);
      break;
    case 7:
      uint64_t v2 = sub_100012018(a2);
      break;
    case 9:
      uint64_t v2 = sub_100011E70(a2);
      break;
    case 10:
      uint64_t v2 = sub_100011A28(a2);
      break;
    case 15:
      uint64_t v2 = sub_1000121F0(a2);
      break;
    case 18:
      uint64_t v2 = sub_10001262C(a2);
      break;
    case 20:
      uint64_t v2 = sub_100012754(a2);
      break;
    case 22:
      uint64_t v2 = sub_100012874(a2);
      break;
    case 23:
      uint64_t v2 = sub_100011F50(a2);
      break;
    case 27:
      uint64_t v2 = sub_1000126A0(a2);
      break;
    case 32:
      uint64_t v2 = sub_100012960(a2);
      break;
    default:
      uint64_t v2 = +[NSString stringWithFormat:@"%llu", a2];
      break;
  }

  return v2;
}

id sub_100012C20(int a1, uint64_t a2)
{
  switch(a1)
  {
    case 1:
      uint64_t v2 = sub_1000119B4(a2);
      break;
    case 2:
      uint64_t v2 = sub_1000118E8(a2);
      break;
    case 3:
      uint64_t v2 = sub_100011E24(a2);
      break;
    case 6:
      uint64_t v2 = sub_10001217C(a2);
      break;
    case 7:
      uint64_t v2 = sub_100012080(a2);
      break;
    case 9:
      uint64_t v2 = sub_100011ED8(a2);
      break;
    case 10:
      uint64_t v2 = sub_100011CF0(a2);
      break;
    case 15:
      uint64_t v2 = sub_1000124E8(a2);
      break;
    case 18:
      uint64_t v2 = sub_10001262C(a2);
      break;
    case 20:
      uint64_t v2 = sub_100012800(a2);
      break;
    case 22:
      uint64_t v2 = sub_100012900(a2);
      break;
    case 23:
      uint64_t v2 = sub_100011FB8(a2);
      break;
    case 27:
      uint64_t v2 = sub_100012708(a2);
      break;
    case 32:
      uint64_t v2 = sub_1000129D8(a2);
      break;
    default:
      uint64_t v2 = +[NSString stringWithFormat:@"%#llx", a2];
      break;
  }

  return v2;
}

uint64_t sub_100012E94(uint64_t a1)
{
  qword_10003EA00 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

uint64_t sub_100013040(uint64_t a1)
{
  qword_10003EA10 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_10001349C(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) identifier];
  id v5 = +[BSMutableServiceInterface interfaceWithIdentifier:v1];

  uint64_t v2 = +[BSObjCProtocol protocolForProtocol:&OBJC_PROTOCOL___HangHUDServerProtocol];
  [v5 setServer:v2];

  id v3 = [v5 copy];
  id v4 = (void *)qword_10003EA20;
  qword_10003EA20 = (uint64_t)v3;
}

uint64_t sub_100013A9C(uint64_t a1)
{
  if (a1 == 2) {
    return 2;
  }
  else {
    return 1;
  }
}

id sub_100013AAC(const mach_header_64 *a1)
{
  id v1 = &__NSArray0__struct;
  if ((uint64_t)a1 >= 0x8000)
  {
    if ((uint64_t)a1 < 0x400000)
    {
      if (a1 == (const mach_header_64 *)0x8000)
      {
        uint64_t v2 = +[NSMutableArray array];
        unint64_t v26 = 2;
        do
        {
          unint64_t v27 = +[NSNumber numberWithUnsignedLongLong:v26];
          [v2 addObject:v27];

          BOOL v15 = v26 > 0x4000;
          v26 *= 2;
        }
        while (!v15);
        goto LABEL_76;
      }
      if (a1 == (const mach_header_64 *)0x40000)
      {
        uint64_t v2 = +[NSMutableArray array];
        unint64_t v28 = 2;
        do
        {
          unint64_t v29 = +[NSNumber numberWithUnsignedLongLong:v28];
          [v2 addObject:v29];

          BOOL v5 = v28 >= 0x11;
          v28 *= 2;
        }
        while (!v5);
        goto LABEL_76;
      }
      if (a1 != (const mach_header_64 *)0x100000) {
        goto LABEL_77;
      }
      uint64_t v2 = +[NSMutableArray array];
      unint64_t v10 = 2;
      do
      {
        id v11 = +[NSNumber numberWithUnsignedLongLong:v10];
        [v2 addObject:v11];

        BOOL v5 = v10 >= 3;
        v10 *= 2;
      }
      while (!v5);
      uint64_t v12 = &off_100035B70;
    }
    else
    {
      if ((uint64_t)a1 <= 0x7FFFFFF)
      {
        if (a1 == (const mach_header_64 *)0x400000)
        {
          uint64_t v2 = +[NSMutableArray array];
          unint64_t v20 = 2;
          do
          {
            uint64_t v21 = +[NSNumber numberWithUnsignedLongLong:v20];
            [v2 addObject:v21];

            BOOL v5 = v20 >= 3;
            v20 *= 2;
          }
          while (!v5);
        }
        else
        {
          if (a1 != (const mach_header_64 *)0x800000) {
            goto LABEL_77;
          }
          uint64_t v2 = +[NSMutableArray array];
          unint64_t v6 = 2;
          do
          {
            id v7 = +[NSNumber numberWithUnsignedLongLong:v6];
            [v2 addObject:v7];

            BOOL v5 = v6 >= 0x11;
            v6 *= 2;
          }
          while (!v5);
        }
        goto LABEL_76;
      }
      if (a1 == (const mach_header_64 *)0x8000000)
      {
        uint64_t v2 = +[NSMutableArray array];
        unint64_t v32 = 2;
        do
        {
          unint64_t v33 = +[NSNumber numberWithUnsignedLongLong:v32];
          [v2 addObject:v33];

          BOOL v5 = v32 >= 5;
          v32 *= 2;
        }
        while (!v5);
        goto LABEL_76;
      }
      if (a1 != &_mh_execute_header) {
        goto LABEL_77;
      }
      uint64_t v2 = +[NSMutableArray array];
      unint64_t v16 = 2;
      do
      {
        double v17 = +[NSNumber numberWithUnsignedLongLong:v16];
        [v2 addObject:v17];

        BOOL v15 = v16 > 0x2000;
        v16 *= 2;
      }
      while (!v15);
      [v2 addObject:&off_100035B70];
      uint64_t v12 = &off_100035B88;
    }
  }
  else
  {
    if ((uint64_t)a1 <= 63)
    {
      if (a1 == (const mach_header_64 *)2)
      {
        uint64_t v2 = +[NSMutableArray array];
        unint64_t v22 = 2;
        do
        {
          uint64_t v23 = +[NSNumber numberWithUnsignedLongLong:v22];
          [v2 addObject:v23];

          BOOL v15 = v22 > 0x8000;
          v22 *= 2;
        }
        while (!v15);
      }
      else if (a1 == (const mach_header_64 *)4)
      {
        uint64_t v2 = +[NSMutableArray array];
        unint64_t v24 = 2;
        do
        {
          uint64_t v25 = +[NSNumber numberWithUnsignedLongLong:v24];
          [v2 addObject:v25];

          BOOL v5 = v24 >= 0x40000001;
          v24 *= 2;
        }
        while (!v5);
      }
      else
      {
        if (a1 != (const mach_header_64 *)8) {
          goto LABEL_77;
        }
        uint64_t v2 = +[NSMutableArray array];
        unint64_t v8 = 2;
        do
        {
          id v9 = +[NSNumber numberWithUnsignedLongLong:v8];
          [v2 addObject:v9];

          BOOL v5 = v8 >= 9;
          v8 *= 2;
        }
        while (!v5);
      }
      goto LABEL_76;
    }
    if ((uint64_t)a1 > 511)
    {
      if (a1 == (const mach_header_64 *)512)
      {
        uint64_t v2 = +[NSMutableArray array];
        unint64_t v30 = 2;
        do
        {
          uint64_t v31 = +[NSNumber numberWithUnsignedLongLong:v30];
          [v2 addObject:v31];

          BOOL v15 = v30 > 0x40000;
          v30 *= 2;
        }
        while (!v15);
      }
      else
      {
        if (a1 != (const mach_header_64 *)1024) {
          goto LABEL_77;
        }
        uint64_t v2 = +[NSMutableArray array];
        unint64_t v13 = 2;
        do
        {
          long long v14 = +[NSNumber numberWithUnsignedLongLong:v13];
          [v2 addObject:v14];

          BOOL v15 = v13 > 0x2000;
          v13 *= 2;
        }
        while (!v15);
      }
      goto LABEL_76;
    }
    if (a1 != (const mach_header_64 *)64)
    {
      if (a1 != (const mach_header_64 *)128) {
        goto LABEL_77;
      }
      uint64_t v2 = +[NSMutableArray array];
      unint64_t v3 = 2;
      do
      {
        id v4 = +[NSNumber numberWithUnsignedLongLong:v3];
        [v2 addObject:v4];

        BOOL v5 = v3 >= 0x101;
        v3 *= 2;
      }
      while (!v5);
      goto LABEL_76;
    }
    uint64_t v2 = +[NSMutableArray array];
    unint64_t v18 = 2;
    do
    {
      uint64_t v19 = +[NSNumber numberWithUnsignedLongLong:v18];
      [v2 addObject:v19];

      BOOL v5 = v18 >= 0x41;
      v18 *= 2;
    }
    while (!v5);
    uint64_t v12 = &off_100035B58;
  }
  [v2 addObject:v12];
LABEL_76:
  id v1 = [v2 copy];

LABEL_77:

  return v1;
}

uint64_t start()
{
  v0 = sub_10000E760();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    sub_10001D2AC(v0);
  }

  uint64_t v2 = +[HUDRenderServer sharedInstance];
  [v2 start];

  unint64_t v3 = +[HangHUDServiceSpecification domainName];
  id v4 = +[BSServicesConfiguration activateManualDomain:v3];

  BOOL v5 = +[NSRunLoop mainRunLoop];
  [v5 run];

  return 0;
}

void sub_100014194(id a1)
{
  qword_10003EA30 = [[ProcessExitFetcher alloc] initWithMonitorID:@"com.apple.HangHUD" fetchIntervalMs:250.0];

  _objc_release_x1();
}

void sub_100014344(id a1)
{
  qword_10003EA40 = (uint64_t)dispatch_queue_create("com.apple.HangHUD.ProcExitFetchQueue", 0);

  _objc_release_x1();
}

void sub_1000147A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_100014B44(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 32) copy];
  [*(id *)(a1 + 32) fetchProcessExitInfo];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 24);
  if (v2) {
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

void sub_100014D5C(id a1)
{
  v3[0] = @"HTProfile";
  v3[1] = @"HTEPL";
  v3[2] = @"HTThirdPartyDevSupport";
  v3[3] = @"PLTasking";
  v3[4] = &stru_100031C30;
  v3[5] = @"PDSEHangTracer";
  v3[6] = @"PDSEHTBadDay";
  v3[7] = @"PDSEHTThirdParty";
  v3[8] = @"PDSEWorkflowResponsiveness";
  v3[9] = @"PDSEHTRateOnly";
  v3[10] = @"PDSESentry";
  v3[11] = @"PDSEAppLaunch";
  uint64_t v1 = +[NSArray arrayWithObjects:v3 count:12];
  uint64_t v2 = (void *)qword_10003EA58;
  qword_10003EA58 = v1;
}

void sub_100016EAC(id a1)
{
  qword_10003EA60 = objc_alloc_init(HTPrefs);

  _objc_release_x1();
}

void sub_1000192A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  objc_destroyWeak(v33);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v34 - 208), 8);
  _Block_object_dispose((const void *)(v34 - 176), 8);
  _Block_object_dispose((const void *)(v34 - 144), 8);
  objc_destroyWeak((id *)(v34 - 104));
  _Unwind_Resume(a1);
}

void sub_100019304(uint64_t a1, int a2)
{
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == a2)
  {
    id v3 = sub_100006A20();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v4 = "HTPrefs: Tasking Changed";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, v4, buf, 2u);
    }
  }
  else if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == a2)
  {
    id v3 = sub_100006A20();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v4 = "HTPrefs: Telemetry Changed";
      goto LABEL_16;
    }
  }
  else if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == a2)
  {
    id v3 = sub_100006A20();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v4 = "HTPrefs: Profile List Changed";
      goto LABEL_16;
    }
  }
  else if (*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) == a2)
  {
    id v3 = sub_100006A20();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v4 = "HTPrefs: EPL State Changed";
      goto LABEL_16;
    }
  }
  else
  {
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) != a2) {
      goto LABEL_18;
    }
    id v3 = sub_100006A20();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v4 = "HTPrefs: HT Self-Enablement State Changed Triggered Refresh";
      goto LABEL_16;
    }
  }

LABEL_18:
  BOOL v5 = (id *)(a1 + 80);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  unsigned int v7 = [WeakRetained hangtracerDaemonEnabled];

  [*(id *)(a1 + 32) refreshHTPrefs];
  id v8 = objc_loadWeakRetained((id *)(a1 + 80));
  LODWORD(WeakRetained) = [v8 hangtracerDaemonEnabled];

  if (v7 != WeakRetained)
  {
    id v9 = sub_100006A20();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      if (v7) {
        CFStringRef v10 = @"ON";
      }
      else {
        CFStringRef v10 = @"OFF";
      }
      id v11 = objc_loadWeakRetained(v5);
      if ([v11 hangtracerDaemonEnabled]) {
        CFStringRef v12 = @"ON";
      }
      else {
        CFStringRef v12 = @"OFF";
      }
      *(_DWORD *)buf = 138412546;
      CFStringRef v21 = v10;
      __int16 v22 = 2112;
      CFStringRef v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "HTPrefs: HangTracer Enabled State Changed: %@ -> %@", buf, 0x16u);
    }
    id v13 = objc_loadWeakRetained(v5);
    long long v14 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v13, "hangtracerDaemonEnabled", @"Enabled"));
    uint64_t v19 = v14;
    BOOL v15 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];

    unint64_t v16 = +[NSNotificationCenter defaultCenter];
    id v17 = objc_loadWeakRetained(v5);
    [v16 postNotificationName:@"com.apple.hangtracer.daemonstate" object:v17 userInfo:v15];
  }
}

void sub_100019658(uint64_t a1, int a2)
{
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == a2)
  {
    uint64_t v2 = sub_100006A20();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "HTPrefs: Test Reset Log Limits", v3, 2u);
    }
  }
}

void sub_10001A2AC(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x20u);
}

void sub_10001A2E8(id a1)
{
  byte_10003EA78 = MGGetBoolAnswer();
}

void sub_10001A310(id a1)
{
  byte_10003EA88 = MGGetSInt32Answer() == 3;
}

void sub_10001A344(id a1)
{
  byte_10003EA98 = MGGetSInt32Answer() == 6;
}

void sub_10001A378(id a1)
{
  byte_10003EAA8 = MGGetSInt32Answer() == 4;
}

void sub_10001A3AC(id a1)
{
  byte_10003EAB8 = MGGetSInt32Answer() == 11;
}

double sub_10001A3E0()
{
  if (qword_10003EAA0 != -1) {
    dispatch_once(&qword_10003EAA0, &stru_100031A60);
  }
  if (byte_10003EAA8)
  {
    v0 = +[CADisplay mainDisplay];
    [v0 bounds];
    if (v1 <= 1920.0) {
      double v2 = 28.0;
    }
    else {
      double v2 = 42.0;
    }
  }
  else
  {
    if (qword_10003EA90 != -1) {
      dispatch_once(&qword_10003EA90, &stru_100031A40);
    }
    if (byte_10003EA98)
    {
      double v3 = sub_10001A528();
      if (v3 > 170.0 || v3 < 1.0) {
        return 24.0;
      }
      else {
        return 22.0;
      }
    }
    else
    {
      if (qword_10003EAB0 != -1) {
        dispatch_once(&qword_10003EAB0, &stru_100031A80);
      }
      double v2 = 22.0;
      if (!byte_10003EAB8)
      {
        if (-[HUDLine contentScaleForTexts]_0() == 3.0) {
          return 40.0;
        }
        else {
          return 28.0;
        }
      }
    }
  }
  return v2;
}

double sub_10001A528()
{
  double result = *(double *)&qword_10003EAE0;
  if (*(double *)&qword_10003EAE0 <= 0.0)
  {
    if (qword_10003EAA0 != -1) {
      dispatch_once(&qword_10003EAA0, &stru_100031A60);
    }
    int v1 = byte_10003EAA8;
    double v2 = +[CADisplay mainDisplay];
    [v2 bounds];
    double v4 = fmax(v3, 1920.0);
    if (!v1) {
      double v4 = v3;
    }
    qword_10003EAE0 = *(void *)&v4;

    double result = *(double *)&qword_10003EAE0 / -[HUDLine contentScaleForTexts]_0();
    qword_10003EAE0 = *(void *)&result;
  }
  return result;
}

void sub_10001A688()
{
  if (*(double *)&qword_10003EAC0 <= 0.0)
  {
    double v0 = sub_10001A3E0();
    *(double *)&qword_10003EAC0 = v0 / -[HUDLine contentScaleForTexts]_0();
  }
}

double sub_10001A6D0()
{
  double v0 = *(double *)&qword_10003EAC8;
  if (*(double *)&qword_10003EAC8 > 0.0) {
    return v0;
  }
  int v1 = +[CADisplay mainDisplay];
  double v2 = [v1 currentOrientation];

  if (qword_10003EA90 != -1) {
    dispatch_once(&qword_10003EA90, &stru_100031A40);
  }
  double v3 = 20.0;
  if (!byte_10003EA98)
  {
    if (qword_10003EA80 != -1) {
      dispatch_once(&qword_10003EA80, &stru_100031A20);
    }
    double v3 = 50.0;
    if (!byte_10003EA88
      && v2 != (void *)kCADisplayOrientationRotation270
      && v2 != (void *)kCADisplayOrientationRotation90)
    {
      if (qword_10003EB30 != -1) {
        dispatch_once(&qword_10003EB30, &stru_100031B90);
      }
      if (byte_10003EB38)
      {
        *(double *)&uint64_t v6 = 168.0;
LABEL_18:
        double v3 = *(double *)&v6;
        goto LABEL_5;
      }
      if (qword_10003EA70 != -1) {
        dispatch_once(&qword_10003EA70, &stru_100031A00);
      }
      if (byte_10003EA78)
      {
        if (-[HUDLine contentScaleForTexts]_0() == 2.0)
        {
          *(double *)&uint64_t v6 = 100.0;
          goto LABEL_18;
        }
        if (qword_10003EA70 != -1) {
          dispatch_once(&qword_10003EA70, &stru_100031A00);
        }
      }
      if (byte_10003EA78 && -[HUDLine contentScaleForTexts]_0() == 3.0)
      {
        double v3 = 150.0;
      }
      else
      {
        if (qword_10003EAA0 != -1) {
          dispatch_once(&qword_10003EAA0, &stru_100031A60);
        }
        int v7 = byte_10003EAA8;
        double v8 = -[HUDLine contentScaleForTexts]_0();
        if (v7) {
          double v3 = dbl_100023370[v8 > 1.0];
        }
        else {
          double v3 = v8 * 25.0;
        }
      }
    }
  }
LABEL_5:
  qword_10003EAC8 = *(void *)&v3;
  *(double *)&qword_10003EAC8 = v3 / -[HUDLine contentScaleForTexts]_0();
  double v4 = sub_100006A20();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10001D968((uint64_t)v2, v4);
  }

  double v0 = *(double *)&qword_10003EAC8;
  return v0;
}

void sub_10001A94C()
{
  if (*(double *)&qword_10003EAD0 <= 0.0)
  {
    if (qword_10003EA70 != -1) {
      dispatch_once(&qword_10003EA70, &stru_100031A00);
    }
    double v0 = 25.0;
    if (!byte_10003EA78) {
      double v0 = sub_10001A6D0();
    }
    qword_10003EAD0 = *(void *)&v0;
  }
}

double sub_10001A9B8()
{
  double result = *(double *)&qword_10003EAD8;
  if (*(double *)&qword_10003EAD8 <= 0.0)
  {
    if (qword_10003EA90 != -1) {
      dispatch_once(&qword_10003EA90, &stru_100031A40);
    }
    double v1 = 5.0;
    if (!byte_10003EA98)
    {
      double v2 = -[HUDLine contentScaleForTexts]_0();
      if (qword_10003EA80 != -1)
      {
        double v4 = v2;
        dispatch_once(&qword_10003EA80, &stru_100031A20);
        double v2 = v4;
      }
      double v3 = 10.0;
      if (!byte_10003EA88) {
        double v3 = 8.0;
      }
      double v1 = v2 * v3;
    }
    qword_10003EAD8 = *(void *)&v1;
    double result = v1 / -[HUDLine contentScaleForTexts]_0();
    qword_10003EAD8 = *(void *)&result;
  }
  return result;
}

double sub_10001AA88()
{
  double result = *(double *)&qword_10003EAE8;
  if (*(double *)&qword_10003EAE8 <= 0.0)
  {
    if (qword_10003EAA0 != -1) {
      dispatch_once(&qword_10003EAA0, &stru_100031A60);
    }
    int v1 = byte_10003EAA8;
    double v2 = +[CADisplay mainDisplay];
    [v2 bounds];
    double v4 = fmax(v3, 1080.0);
    if (!v1) {
      double v4 = v3;
    }
    qword_10003EAE8 = *(void *)&v4;

    double result = *(double *)&qword_10003EAE8 / -[HUDLine contentScaleForTexts]_0();
    qword_10003EAE8 = *(void *)&result;
  }
  return result;
}

void sub_10001AB30()
{
  if (*(double *)&qword_10003EAF8 <= 0.0)
  {
    double v0 = sub_10001A528();
    double v1 = fmin(v0, sub_10001AA88());
    sub_10001A94C();
    *(double *)&qword_10003EAF8 = v1 + v2 * -2.0;
  }
}

double sub_10001AB84()
{
  if (qword_10003EB00 != -1) {
    dispatch_once(&qword_10003EB00, &stru_100031AA0);
  }
  return *(double *)&qword_10003EB08;
}

void sub_10001ABC8(id a1)
{
  if (qword_10003EA90 != -1) {
    dispatch_once(&qword_10003EA90, &stru_100031A40);
  }
  double v1 = 2.0;
  if (!byte_10003EA98) {
    double v1 = 20.0;
  }
  qword_10003EB08 = *(void *)&v1;
  *(double *)&qword_10003EB08 = v1 / -[HUDLine contentScaleForTexts]_0();
}

double sub_10001AC3C()
{
  if (qword_10003EB10 != -1) {
    dispatch_once(&qword_10003EB10, &stru_100031AC0);
  }
  return *(double *)&qword_10003EB18;
}

void sub_10001AC80(id a1)
{
  if (qword_10003EA90 != -1) {
    dispatch_once(&qword_10003EA90, &stru_100031A40);
  }
  double v1 = 2.0;
  if (!byte_10003EA98) {
    double v1 = 20.0;
  }
  qword_10003EB18 = *(void *)&v1;
  *(double *)&qword_10003EB18 = v1 / -[HUDLine contentScaleForTexts]_0();
}

void sub_10001ACF4()
{
  qword_10003EAC8 = 0;
  qword_10003EAD0 = 0;
  qword_10003EAF8 = 0;
}

void sub_10001AD10()
{
  qword_10003EAC0 = 0;
  qword_10003EAC8 = 0;
  qword_10003EAD0 = 0;
  qword_10003EAD8 = 0;
  qword_10003EAE0 = 0;
  qword_10003EAE8 = 0;
  qword_10003EAF0 = 0;
  qword_10003EAF8 = 0;
}

uint64_t sub_10001AD54(void *a1, uint64_t a2, double a3)
{
  id v5 = a1;
  double v6 = sub_10001B3C0(a2 - (void)[v5 receivedTimestamp]);
  int v7 = sub_100006A20();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v11 = 134217984;
    double v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "durationSinceLastUpdateMs: %f", (uint8_t *)&v11, 0xCu);
  }

  if ([v5 hangEndTime] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if (v6 <= a3)
    {
      uint64_t v8 = 1;
      goto LABEL_9;
    }
LABEL_8:
    uint64_t v8 = 0;
    goto LABEL_9;
  }
  double v9 = sub_10001B3C0(a2 - (void)[v5 hangEndTime]);
  uint64_t v8 = 1;
  if (v9 >= 200.0 && v6 > a3) {
    goto LABEL_8;
  }
LABEL_9:

  return v8;
}

id sub_10001AE80(void *a1, unsigned int a2)
{
  double v3 = [a1 keysSortedByValueWithOptions:0 usingComparator:&stru_100031B00];
  double v4 = 0;
  if ((unint64_t)[v3 count] >= a2) {
    double v4 = (char *)[v3 count] - a2;
  }
  id v5 = [v3 count];
  if ((unint64_t)v5 >= a2) {
    unint64_t v6 = a2;
  }
  else {
    unint64_t v6 = (unint64_t)v5;
  }
  int v7 = objc_msgSend(v3, "subarrayWithRange:", v4, v6);

  return v7;
}

int64_t sub_10001AF1C(id a1, HTHangHUDInfo *a2, HTHangHUDInfo *a3)
{
  double v4 = a2;
  id v5 = a3;
  id v6 = [(HTHangHUDInfo *)v4 hangStartTime];
  if (v6 == (id)[(HTHangHUDInfo *)v5 hangStartTime])
  {
    int64_t v7 = 0;
  }
  else
  {
    id v8 = [(HTHangHUDInfo *)v4 hangStartTime];
    if (v8 > (id)[(HTHangHUDInfo *)v5 hangStartTime]) {
      int64_t v7 = 1;
    }
    else {
      int64_t v7 = -1;
    }
  }

  return v7;
}

id sub_10001AFA4(void *a1, unsigned int a2)
{
  id v3 = a1;
  if ([v3 count])
  {
    double v4 = [v3 keysSortedByValueUsingComparator:&stru_100031B40];
    unint64_t v5 = a2;
    if ((unint64_t)[v4 count] >= a2) {
      id v6 = (char *)[v4 count] - a2;
    }
    else {
      id v6 = 0;
    }
    id v8 = [v4 count];
    if ((unint64_t)v8 >= v5) {
      id v9 = (id)v5;
    }
    else {
      id v9 = v8;
    }
    objc_msgSend(v4, "subarrayWithRange:", v6, v9);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = objc_alloc_init((Class)NSArray);
  }

  return v7;
}

int64_t sub_10001B06C(id a1, HUDContentProtocol *a2, HUDContentProtocol *a3)
{
  double v4 = a3;
  id v5 = [(HUDContentProtocol *)a2 compareValue];
  id v6 = [(HUDContentProtocol *)v4 compareValue];

  int64_t v7 = 1;
  if (v5 <= v6) {
    int64_t v7 = -1;
  }
  if (v5 == v6) {
    return 0;
  }
  else {
    return v7;
  }
}

uint64_t sub_10001B0C8(void *a1, unsigned char *a2)
{
  id v3 = a1;
  double v4 = +[NSUserDefaults standardUserDefaults];
  id v5 = [v4 persistentDomainForName:@"com.apple.HangHUD"];
  id v6 = v5;
  if (v5)
  {
    int64_t v7 = [v5 objectForKey:v3];
    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      *a2 = [v7 isEqualToString:@"YES"];
      uint64_t v8 = 1;
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t sub_10001B19C()
{
  char v2 = 0;
  double v0 = &v2;
  if ((sub_10001B0C8(@"UseHangHUD", &v2) & 1) == 0)
  {
    if (qword_10003EB20 != -1) {
      dispatch_once(&qword_10003EB20, &stru_100031B70);
    }
    double v0 = &byte_10003EB28;
  }
  return *v0;
}

void sub_10001B210(id a1)
{
  byte_10003EB28 = _os_feature_enabled_impl();
}

uint64_t sub_10001B240()
{
  char v1 = 0;
  LODWORD(result) = sub_10001B0C8(@"IgnoreHangInfoFromHangHUDClients", &v1);
  if (v1) {
    return result;
  }
  else {
    return 0;
  }
}

void sub_10001B27C(id a1)
{
  byte_10003EB38 = SBSIsSystemApertureAvailable();
  char v1 = sub_100006A20();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    v2[0] = 67109120;
    v2[1] = byte_10003EB38;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "New API was available, retrieved aperture available %{BOOL}i", (uint8_t *)v2, 8u);
  }
}

double sub_10001B32C()
{
  if (qword_10003EB48 != -1) {
    dispatch_once(&qword_10003EB48, &stru_100031BB0);
  }
  return *(double *)&qword_10003EB40;
}

void sub_10001B370(id a1)
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  *(double *)&qword_10003EB40 = (float)((float)((float)info.numer * 0.000001) / (float)info.denom);
}

double sub_10001B3C0(unint64_t a1)
{
  if (qword_10003EB48 != -1) {
    dispatch_once(&qword_10003EB48, &stru_100031BB0);
  }
  return *(double *)&qword_10003EB40 * (double)a1;
}

double sub_10001B418(unint64_t a1)
{
  if (qword_10003EB48 != -1) {
    dispatch_once(&qword_10003EB48, &stru_100031BB0);
  }
  return *(double *)&qword_10003EB40 * (double)a1 / 1000.0;
}

double sub_10001B47C(unint64_t a1)
{
  if (qword_10003EB48 != -1) {
    dispatch_once(&qword_10003EB48, &stru_100031BB0);
  }
  return (double)a1 / *(double *)&qword_10003EB40;
}

void sub_10001B6AC(id a1)
{
  CGColorRef SRGB = CGColorCreateSRGB(1.0, 1.0, 1.0, 1.0);
  CGColorRef v2 = CGColorCreateSRGB(0.0, 0.0, 0.0, 1.0);
  CGColorRef v3 = CGColorCreateSRGB(0.556862745, 0.556862745, 0.576470588, 1.0);
  double v4 = CGColorCreateSRGB(0.921568627, 0.537254902, 0.0, 1.0);
  CGColorRef CopyWithAlpha = CGColorCreateCopyWithAlpha(v4, 0.67);
  id v6 = CGColorCreateSRGB(0.949019608, 0.219607843, 0.180392157, 1.0);
  CGColorRef v7 = CGColorCreateCopyWithAlpha(v6, 0.67);
  CGColorRef v8 = CGColorCreateSRGB(0.0, 0.0, 0.0, 1.0);
  CGColorRef v9 = CGColorCreateSRGB(0.396078431, 0.396078431, 0.396078431, 1.0);
  CFStringRef v10 = [[HUDTheme alloc] initWithPreviousHangTextColor:v3 currentHangTextColor:v2 currentHangSevereTextColor:v4 previousHangSevereTextColor:CopyWithAlpha currentHangCriticalTextColor:v6 previousHangCriticalTextColor:v7 backgroundColor:SRGB currentProcessExitTextColor:v8 processExitReasonNamespaceTextColor:v9];
  int v11 = (void *)qword_10003EB58;
  qword_10003EB58 = (uint64_t)v10;

  CFRelease(SRGB);
  CFRelease(v2);
  CFRelease(v4);
  CFRelease(CopyWithAlpha);
  CFRelease(v3);
  CFRelease(v6);
  CFRelease(v7);
  CFRelease(v8);

  CFRelease(v9);
}

void sub_10001B8C8(id a1)
{
  CGColorRef SRGB = CGColorCreateSRGB(0.141176471, 0.141176471, 0.156862745, 1.0);
  CGColorRef v2 = CGColorCreateSRGB(1.0, 1.0, 1.0, 1.0);
  CGColorRef v3 = CGColorCreateSRGB(0.556862745, 0.556862745, 0.576470588, 1.0);
  double v4 = CGColorCreateSRGB(1.0, 0.584313725, 0.0392156863, 1.0);
  CGColorRef CopyWithAlpha = CGColorCreateCopyWithAlpha(v4, 0.67);
  id v6 = CGColorCreateSRGB(1.0, 0.270588235, 0.22745098, 1.0);
  CGColorRef v7 = CGColorCreateCopyWithAlpha(v6, 0.67);
  CGColorRef v8 = CGColorCreateSRGB(1.0, 1.0, 1.0, 1.0);
  CGColorRef v9 = CGColorCreateSRGB(0.556862745, 0.556862745, 0.576470588, 1.0);
  CFStringRef v10 = [[HUDTheme alloc] initWithPreviousHangTextColor:v3 currentHangTextColor:v2 currentHangSevereTextColor:v4 previousHangSevereTextColor:CopyWithAlpha currentHangCriticalTextColor:v6 previousHangCriticalTextColor:v7 backgroundColor:SRGB currentProcessExitTextColor:v8 processExitReasonNamespaceTextColor:v9];
  int v11 = (void *)qword_10003EB68;
  qword_10003EB68 = (uint64_t)v10;

  CFRelease(SRGB);
  CFRelease(v2);
  CFRelease(v4);
  CFRelease(CopyWithAlpha);
  CFRelease(v3);
  CFRelease(v6);
  CFRelease(v7);
  CFRelease(v8);

  CFRelease(v9);
}

void sub_10001BB28(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001BB98(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005240((void *)&_mh_execute_header, a1, a3, "TextAnimation: duration layer's animation object updated with toValue = %f", a5, a6, a7, a8, 0);
}

void sub_10001BC08(void *a1, NSObject *a2, double a3)
{
  id v5 = [a1 string];
  int v6 = 138412546;
  CGColorRef v7 = v5;
  __int16 v8 = 2048;
  double v9 = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "TextAnimation: duration layer's animation object initialized: text set as %@ for a given duration %f", (uint8_t *)&v6, 0x16u);
}

void sub_10001BCB8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001BD28(id *a1, NSObject *a2)
{
  CGColorRef v3 = [*a1 string];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "TextAnimation:  duration layer's text set as %@", (uint8_t *)&v4, 0xCu);
}

void sub_10001BDC4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, " 🔚 A hang with ID %@ has ended!", (uint8_t *)&v2, 0xCu);
}

void sub_10001BE3C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "    A hang with ID %@ has not ended yet!", (uint8_t *)&v2, 0xCu);
}

void sub_10001BEB4(void *a1)
{
  [a1 count];
  sub_10000A3E0();
  sub_10000A384((void *)&_mh_execute_header, v1, v2, "Incoming HUD content dictionary size @ ContexUpdater : %lu", v3, v4, v5, v6, v7);
}

void sub_10001BF2C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001BF64()
{
  sub_10000A3E0();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Process %@ does not have the required entitlement.", v1, 0xCu);
}

void sub_10001BFD8(os_log_t log)
{
  int v1 = 138412546;
  CFStringRef v2 = @"IgnoreHangInfoFromHangHUDClients";
  __int16 v3 = 2112;
  CFStringRef v4 = @"com.apple.HangHUD";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "HangHUD is ignoring hang data from its client. This happens only when the user defaults %@ under %@ domain is set, and it's used for testing purpose.", (uint8_t *)&v1, 0x16u);
}

void sub_10001C078(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001C0B0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001C128(void *a1)
{
  [a1 count];
  sub_10000A3EC();
  sub_10000A3C0((void *)&_mh_execute_header, v1, v2, "%s called at Angel server with a dictionary with %lu elements", v3, v4, v5, v6, 2u);
}

void sub_10001C1AC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001C1E4(void *a1)
{
  [a1 count];
  sub_10000A3EC();
  sub_10000A3C0((void *)&_mh_execute_header, v1, v2, "%s called at Angel server with a dictionary with %lu elements", v3, v4, v5, v6, 2u);
}

void sub_10001C268(void *a1)
{
  [a1 areProcessTerminationsMonitored];
  sub_10000A384((void *)&_mh_execute_header, v1, v2, " Process Terminations: monitoring %@", v3, v4, v5, v6, 2u);
}

void sub_10001C2FC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001C374(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001C3EC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001C464(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) count];
  sub_10000A3E0();
  sub_10000A384((void *)&_mh_execute_header, v1, v2, " ====== updater called in Timer ====== dict.count:%lu", v3, v4, v5, v6, v7);
}

void sub_10001C4E4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001C55C(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [*a1 target];
  sub_10000A3E0();
  __int16 v7 = 2114;
  uint64_t v8 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Failed to acquire render HUD assertion for target %@: %{public}@", v6, 0x16u);
}

void sub_10001C60C(void *a1, NSObject *a2)
{
  objc_msgSend(a1, "HUD_background_opacity");
  int v4 = 134217984;
  uint64_t v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "HUD_background_opacity set to %f", (uint8_t *)&v4, 0xCu);
}

void sub_10001C698(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Deallocating HUDContext…", v1, 2u);
}

void sub_10001C6DC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, " Avoided redundant hud line clear and render context invalidation.", v1, 2u);
}

void sub_10001C720(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001C790(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001C800(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001C86C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001C8D8()
{
  sub_10000A3E0();
  sub_100005240((void *)&_mh_execute_header, v0, v1, "Skipping process exit %@: no configuration", v2, v3, v4, v5, v6);
}

void sub_10001C940()
{
  sub_10000A3E0();
  sub_100005240((void *)&_mh_execute_header, v0, v1, "Skipping process exit %@: OS_REASON_INVALID", v2, v3, v4, v5, v6);
}

void sub_10001C9A8()
{
  sub_10000A3E0();
  sub_100005240((void *)&_mh_execute_header, v0, v1, "Considering process exit %@: all processes allowed", v2, v3, v4, v5, v6);
}

void sub_10001CA10()
{
  sub_10000A3E0();
  sub_100005240((void *)&_mh_execute_header, v0, v1, "Considering process exit %@: critical processes allowed", v2, v3, v4, v5, v6);
}

void sub_10001CA78()
{
  sub_10000A3E0();
  sub_100005240((void *)&_mh_execute_header, v0, v1, "Skipping process exit %@: no processes allowed", v2, v3, v4, v5, v6);
}

void sub_10001CAE0()
{
  sub_10000A3E0();
  sub_100005240((void *)&_mh_execute_header, v0, v1, "Considering process exit %@: no processes allowed", v2, v3, v4, v5, v6);
}

void sub_10001CB48()
{
  sub_10000A3E0();
  sub_100005240((void *)&_mh_execute_header, v0, v1, "Skipping process exit %@: not in allowed processes", v2, v3, v4, v5, v6);
}

void sub_10001CBB0(uint64_t a1, void *a2)
{
  [a2 exitReasonNamespace];
  sub_10000E6E4();
  sub_10000E720((void *)&_mh_execute_header, v2, v3, "Adding process exit %@: reason %hhu allowed with no sub-reasons", v4, v5, v6, v7, v8);
}

void sub_10001CC30(uint64_t a1, void *a2)
{
  [a2 exitReasonNamespace];
  sub_10000E6E4();
  sub_10000E720((void *)&_mh_execute_header, v2, v3, "Adding process exit %@: reason %hhu allowed with sub-reasons all set", v4, v5, v6, v7, v8);
}

void sub_10001CCB0(uint64_t a1, void *a2)
{
  [a2 exitReasonNamespace];
  [a2 exitReasonCode];
  sub_10000E6FC();
  sub_10000E740((void *)&_mh_execute_header, v3, v4, "Adding process exit %@: reason %hhu and sub-reason %llu allowed", v5, v6, v7, v8, v9);
}

void sub_10001CD48(uint64_t a1, void *a2)
{
  [a2 exitReasonNamespace];
  [a2 exitReasonCode];
  sub_10000E6FC();
  sub_10000E740((void *)&_mh_execute_header, v3, v4, "Skipping process exit %@: reason %hhu allowed but sub-reason %llu not allowed", v5, v6, v7, v8, v9);
}

void sub_10001CDE0(uint64_t a1, void *a2)
{
  [a2 exitReasonNamespace];
  sub_10000E6E4();
  sub_10000E720((void *)&_mh_execute_header, v2, v3, "Skipping process exit %@: reason %hhu not allowed", v4, v5, v6, v7, v8);
}

void sub_10001CE60(void *a1)
{
  [a1 exitTimestamp];
  sub_10000A384((void *)&_mh_execute_header, v1, v2, " * ProcExitHUDLine finishedUpdates! - exitTimestamp:%llu", v3, v4, v5, v6, 0);
}

void sub_10001CEDC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "No more update happens as it's completed for %@ @ HangHUDLine::update:", (uint8_t *)&v2, 0xCu);
}

void sub_10001CF54(void *a1)
{
  [a1 hangDurationMS];
  sub_10000A384((void *)&_mh_execute_header, v1, v2, " * HangHUDLine finishedUpdates! hangDurationMS: %f", v3, v4, v5, v6, 0);
}

void sub_10001CFD0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001D048(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001D0C0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001D138(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001D1B0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001D228(uint64_t a1, NSObject *a2, double a3)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Checking if hang is current with hangID %@: durationSinceLastUpdateMs:%f", (uint8_t *)&v3, 0x16u);
}

void sub_10001D2AC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "\n ================================ HangHUD started! =================================== \n", v1, 2u);
}

void sub_10001D2F0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Process exit frequency per process : %@", (uint8_t *)&v2, 0xCu);
}

void sub_10001D368(int *a1, NSObject *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%i Processes are exited", (uint8_t *)v3, 8u);
}

void sub_10001D3E4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001D41C(uint64_t a1, uint8_t *buf, int a3, os_log_t log)
{
  *(_DWORD *)buf = 67109378;
  *((_DWORD *)buf + 1) = a3;
  *((_WORD *)buf + 4) = 2080;
  *(void *)(buf + 10) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to fetch launch_service_stats(%d):%s", buf, 0x12u);
}

void sub_10001D474(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001D4AC(int a1, NSObject *a2)
{
  int v2 = "already enabled";
  if (!a1) {
    int v2 = "enabled";
  }
  int v3 = 136315138;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "launch_service_stats has %s.", (uint8_t *)&v3, 0xCu);
}

void sub_10001D53C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001D574(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "HTPrefs: %@ was not found in the %@ domain, a profile, by EPL, by PowerLog Tasking domain, by HT Self Enablement or by HT Sentry Enablement", (uint8_t *)&v3, 0x16u);
}

void sub_10001D5FC(uint64_t a1, void *a2, NSObject *a3)
{
  *(_DWORD *)int v3 = 138412802;
  *(void *)&v3[4] = @"enablementPrefix";
  *(_WORD *)&void v3[12] = 2112;
  *(void *)&v3[14] = a1;
  *(_WORD *)&v3[22] = 2112;
  sub_10001A2AC((void *)&_mh_execute_header, (uint64_t)a2, a3, "HTPrefs: %@: %@ -> %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *a2);
}

void sub_10001D688()
{
  sub_10001A2CC();
  sub_10001A2DC();
  sub_10001A2AC((void *)&_mh_execute_header, v0, v1, "HTPrefs: %@: %@ -> %@");
}

void sub_10001D724()
{
  sub_10001A2CC();
  sub_10001A2DC();
  sub_10001A2AC((void *)&_mh_execute_header, v0, v1, "HTPrefs: %@: %@ -> %@");
}

void sub_10001D7C0()
{
  sub_10001A2CC();
  sub_10001A2DC();
  sub_10001A2AC((void *)&_mh_execute_header, v0, v1, "HTPrefs: %@: %@ -> %@");
}

void sub_10001D85C()
{
  sub_10001A2CC();
  sub_10001A2DC();
  sub_10001A2AC((void *)&_mh_execute_header, v0, v1, "HTPrefs: %@: %@ -> %@");
}

void sub_10001D8F8(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Preparing prefInitList", v1, 2u);
}

void sub_10001D93C()
{
  __assert_rtn("-[HTPrefs setupPrefsWithQueue:]", "HTPrefs.m", 1486, "prefsQueue != NULL");
}

void sub_10001D968(uint64_t a1, NSObject *a2)
{
  int v4 = 134218498;
  uint64_t v5 = qword_10003EAC8;
  __int16 v6 = 2048;
  double v7 = -[HUDLine contentScaleForTexts]_0();
  __int16 v8 = 2112;
  uint64_t v9 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "cachedTopMargin is set to %f where DisplayScale is %f. The orientation is %@", (uint8_t *)&v4, 0x20u);
}

CFTimeInterval CACurrentMediaTime(void)
{
  return _CACurrentMediaTime();
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  return _CAFrameRateRangeMake(minimum, maximum, preferred);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return _CATransform3DMakeScale(retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return _CATransform3DMakeTranslation(retstr, tx, ty, tz);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return _CGAffineTransformMakeRotation(retstr, angle);
}

CGColorRef CGColorCreateCopyWithAlpha(CGColorRef color, CGFloat alpha)
{
  return _CGColorCreateCopyWithAlpha(color, alpha);
}

CGColorRef CGColorCreateSRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return _CGColorCreateSRGB(red, green, blue, alpha);
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return _CGColorRetain(color);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CTFontDescriptorRef CTFontCopyFontDescriptor(CTFontRef font)
{
  return _CTFontCopyFontDescriptor(font);
}

CTFontRef CTFontCreateUIFontForLanguage(CTFontUIFontType uiType, CGFloat size, CFStringRef language)
{
  return _CTFontCreateUIFontForLanguage(uiType, size, language);
}

CTFontRef CTFontCreateWithFontDescriptor(CTFontDescriptorRef descriptor, CGFloat size, const CGAffineTransform *matrix)
{
  return _CTFontCreateWithFontDescriptor(descriptor, size, matrix);
}

CTFontDescriptorRef CTFontDescriptorCreateCopyWithAttributes(CTFontDescriptorRef original, CFDictionaryRef attributes)
{
  return _CTFontDescriptorCreateCopyWithAttributes(original, attributes);
}

CTFontDescriptorRef CTFontDescriptorCreateCopyWithFeature(CTFontDescriptorRef original, CFNumberRef featureTypeIdentifier, CFNumberRef featureSelectorIdentifier)
{
  return _CTFontDescriptorCreateCopyWithFeature(original, featureTypeIdentifier, featureSelectorIdentifier);
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MGGetFloat32Answer()
{
  return _MGGetFloat32Answer();
}

uint64_t MGGetSInt32Answer()
{
  return _MGGetSInt32Answer();
}

uint64_t SBSIsSystemApertureAvailable()
{
  return _SBSIsSystemApertureAvailable();
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

uint64_t _launch_service_stats_copy_impl()
{
  return __launch_service_stats_copy_impl();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return _dispatch_queue_create_with_target_V2(label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return _getpid();
}

uint64_t launch_service_stats_disable()
{
  return _launch_service_stats_disable();
}

uint64_t launch_service_stats_enable()
{
  return _launch_service_stats_enable();
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
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

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

void objc_moveWeak(id *to, id *from)
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_string(xarray, index);
}

id objc_msgSend_HUD_background_opacity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "HUD_background_opacity");
}

id objc_msgSend_HandleUpdateAndClear(void *a1, const char *a2, ...)
{
  return _[a1 HandleUpdateAndClear];
}

id objc_msgSend_HangHUD_updater_latency_in_ms(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "HangHUD_updater_latency_in_ms");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend___createInternalSettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__createInternalSettings");
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return _[a1 _init];
}

id objc_msgSend_acquireKeepAliveAssertion(void *a1, const char *a2, ...)
{
  return _[a1 acquireKeepAliveAssertion];
}

id objc_msgSend_acquireWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acquireWithError:");
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return _[a1 activate];
}

id objc_msgSend_activateManualDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateManualDomain:");
}

id objc_msgSend_addAnimation_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAnimation:forKey:");
}

id objc_msgSend_addCommitHandler_forPhase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCommitHandler:forPhase:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addHUDContents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addHUDContents:");
}

id objc_msgSend_addIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addIndex:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_addSublayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSublayer:");
}

id objc_msgSend_addTimer_forMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTimer:forMode:");
}

id objc_msgSend_addToRunLoop_forMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addToRunLoop:forMode:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allKeysForObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allKeysForObject:");
}

id objc_msgSend_allowedExitReasonsMatchRecordReasons_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowedExitReasonsMatchRecordReasons:");
}

id objc_msgSend_allowedProcessNames(void *a1, const char *a2, ...)
{
  return _[a1 allowedProcessNames];
}

id objc_msgSend_allowedReasons(void *a1, const char *a2, ...)
{
  return _[a1 allowedReasons];
}

id objc_msgSend_allowedSubReasons(void *a1, const char *a2, ...)
{
  return _[a1 allowedSubReasons];
}

id objc_msgSend_allowsAllProcesses(void *a1, const char *a2, ...)
{
  return _[a1 allowsAllProcesses];
}

id objc_msgSend_allowsCriticalProcesses(void *a1, const char *a2, ...)
{
  return _[a1 allowsCriticalProcesses];
}

id objc_msgSend_animationDidStartOnLine_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animationDidStartOnLine:");
}

id objc_msgSend_animationDidStopOnLine_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animationDidStopOnLine:");
}

id objc_msgSend_animationForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animationForKey:");
}

id objc_msgSend_animationWithKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animationWithKeyPath:");
}

id objc_msgSend_areAllProcessTerminationsMonitored(void *a1, const char *a2, ...)
{
  return _[a1 areAllProcessTerminationsMonitored];
}

id objc_msgSend_areCriticalProcessTerminationsMonitored(void *a1, const char *a2, ...)
{
  return _[a1 areCriticalProcessTerminationsMonitored];
}

id objc_msgSend_areProcessTerminationsMonitored(void *a1, const char *a2, ...)
{
  return _[a1 areProcessTerminationsMonitored];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attributeWithDomain_name_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributeWithDomain:name:");
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 backgroundColor];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return _[a1 begin];
}

id objc_msgSend_beginAnimationFromValue_toValue_duration_updateBlock_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginAnimationFromValue:toValue:duration:updateBlock:completionBlock:");
}

id objc_msgSend_BOOLProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLProperty:contextPrefixOut:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_bundleId(void *a1, const char *a2, ...)
{
  return _[a1 bundleId];
}

id objc_msgSend_bundleIdToAppNameCache(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdToAppNameCache];
}

id objc_msgSend_canceled(void *a1, const char *a2, ...)
{
  return _[a1 canceled];
}

id objc_msgSend_capitalizedString(void *a1, const char *a2, ...)
{
  return _[a1 capitalizedString];
}

id objc_msgSend_characterSetWithCharactersInString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterSetWithCharactersInString:");
}

id objc_msgSend_cleanUpExpiredHUDContents(void *a1, const char *a2, ...)
{
  return _[a1 cleanUpExpiredHUDContents];
}

id objc_msgSend_clearHUDLinesAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearHUDLinesAnimated:");
}

id objc_msgSend_clearHUDLinesAnimated_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearHUDLinesAnimated:withCompletion:");
}

id objc_msgSend_clearHUDWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearHUDWithCompletion:");
}

id objc_msgSend_clientContextIdentifierKey(void *a1, const char *a2, ...)
{
  return _[a1 clientContextIdentifierKey];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return _[a1 commit];
}

id objc_msgSend_compareValue(void *a1, const char *a2, ...)
{
  return _[a1 compareValue];
}

id objc_msgSend_completionBlock(void *a1, const char *a2, ...)
{
  return _[a1 completionBlock];
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_configurationAllowingAllProcesses_criticalProcesses_processNames_reasons_subReasons_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationAllowingAllProcesses:criticalProcesses:processNames:reasons:subReasons:");
}

id objc_msgSend_configurationFromPrefs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationFromPrefs:");
}

id objc_msgSend_configureConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureConnection:");
}

id objc_msgSend_connectionWithEndpoint_clientContextBuilder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectionWithEndpoint:clientContextBuilder:");
}

id objc_msgSend_containerLayer(void *a1, const char *a2, ...)
{
  return _[a1 containerLayer];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentScaleForTexts(void *a1, const char *a2, ...)
{
  return _[a1 contentScaleForTexts];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countsOfMeetingEndingConditions(void *a1, const char *a2, ...)
{
  return _[a1 countsOfMeetingEndingConditions];
}

id objc_msgSend_createContainerLayer(void *a1, const char *a2, ...)
{
  return _[a1 createContainerLayer];
}

id objc_msgSend_createInstance(void *a1, const char *a2, ...)
{
  return _[a1 createInstance];
}

id objc_msgSend_currentHangTextColorForStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentHangTextColorForStatus:");
}

id objc_msgSend_currentOrientation(void *a1, const char *a2, ...)
{
  return _[a1 currentOrientation];
}

id objc_msgSend_currentProcessExitTextColor(void *a1, const char *a2, ...)
{
  return _[a1 currentProcessExitTextColor];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 currentRunLoop];
}

id objc_msgSend_currentTheme(void *a1, const char *a2, ...)
{
  return _[a1 currentTheme];
}

id objc_msgSend_darkModeTheme(void *a1, const char *a2, ...)
{
  return _[a1 darkModeTheme];
}

id objc_msgSend_dateFormatter(void *a1, const char *a2, ...)
{
  return _[a1 dateFormatter];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return _[a1 debugDescription];
}

id objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeArrayOfObjectsOfClass:forKey:");
}

id objc_msgSend_decodeBoolForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeBoolForKey:");
}

id objc_msgSend_decodeDictionaryWithKeysOfClass_objectsOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:");
}

id objc_msgSend_decodeDoubleForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeDoubleForKey:");
}

id objc_msgSend_decodeInt64ForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeInt64ForKey:");
}

id objc_msgSend_decodeIntForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeIntForKey:");
}

id objc_msgSend_decodeIntegerForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeIntegerForKey:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_decodeStringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeStringForKey:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_determineNewFrameForRootLayer_numberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "determineNewFrameForRootLayer:numberOfLines:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithContentsOfFile:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_displayId(void *a1, const char *a2, ...)
{
  return _[a1 displayId];
}

id objc_msgSend_displayLinkWithTarget_selector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayLinkWithTarget:selector:");
}

id objc_msgSend_displayNameForHangInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayNameForHangInfo:");
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return _[a1 distantFuture];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_domainName(void *a1, const char *a2, ...)
{
  return _[a1 domainName];
}

id objc_msgSend_doubleProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleProperty:contextPrefixOut:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_earlyInitNecessaryPrefs(void *a1, const char *a2, ...)
{
  return _[a1 earlyInitNecessaryPrefs];
}

id objc_msgSend_encodeBool_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeBool:forKey:");
}

id objc_msgSend_encodeDouble_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeDouble:forKey:");
}

id objc_msgSend_encodeInt64_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeInt64:forKey:");
}

id objc_msgSend_encodeInt_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeInt:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_endAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endAnimation:");
}

id objc_msgSend_endTime(void *a1, const char *a2, ...)
{
  return _[a1 endTime];
}

id objc_msgSend_endpointForMachName_service_instance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endpointForMachName:service:instance:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_exitReasonCode(void *a1, const char *a2, ...)
{
  return _[a1 exitReasonCode];
}

id objc_msgSend_exitReasonCodeTextLayer(void *a1, const char *a2, ...)
{
  return _[a1 exitReasonCodeTextLayer];
}

id objc_msgSend_exitReasonNamespace(void *a1, const char *a2, ...)
{
  return _[a1 exitReasonNamespace];
}

id objc_msgSend_exitReasonNamespaceTextLayer(void *a1, const char *a2, ...)
{
  return _[a1 exitReasonNamespaceTextLayer];
}

id objc_msgSend_exitTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 exitTimestamp];
}

id objc_msgSend_extractProcessNameToDisplayFromBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extractProcessNameToDisplayFromBundleID:");
}

id objc_msgSend_fetchProcessExitInfo(void *a1, const char *a2, ...)
{
  return _[a1 fetchProcessExitInfo];
}

id objc_msgSend_fetchProcessRecords(void *a1, const char *a2, ...)
{
  return _[a1 fetchProcessRecords];
}

id objc_msgSend_fire(void *a1, const char *a2, ...)
{
  return _[a1 fire];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_flush(void *a1, const char *a2, ...)
{
  return _[a1 flush];
}

id objc_msgSend_forceUpdate(void *a1, const char *a2, ...)
{
  return _[a1 forceUpdate];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_fromValue(void *a1, const char *a2, ...)
{
  return _[a1 fromValue];
}

id objc_msgSend_getDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getDescription:");
}

id objc_msgSend_getHangHUDInfoKey(void *a1, const char *a2, ...)
{
  return _[a1 getHangHUDInfoKey];
}

id objc_msgSend_getKeyForLine_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getKeyForLine:");
}

id objc_msgSend_hangDuration(void *a1, const char *a2, ...)
{
  return _[a1 hangDuration];
}

id objc_msgSend_hangDurationMS(void *a1, const char *a2, ...)
{
  return _[a1 hangDurationMS];
}

id objc_msgSend_hangEndTime(void *a1, const char *a2, ...)
{
  return _[a1 hangEndTime];
}

id objc_msgSend_hangHasPendingAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hangHasPendingAnimation:");
}

id objc_msgSend_hangStartTime(void *a1, const char *a2, ...)
{
  return _[a1 hangStartTime];
}

id objc_msgSend_hangtracerDaemonEnabled(void *a1, const char *a2, ...)
{
  return _[a1 hangtracerDaemonEnabled];
}

id objc_msgSend_hasEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasEntitlement:");
}

id objc_msgSend_hasHudRenderContextInvalidated(void *a1, const char *a2, ...)
{
  return _[a1 hasHudRenderContextInvalidated];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_hudContentWithPendingAnimations(void *a1, const char *a2, ...)
{
  return _[a1 hudContentWithPendingAnimations];
}

id objc_msgSend_hudEnabled(void *a1, const char *a2, ...)
{
  return _[a1 hudEnabled];
}

id objc_msgSend_hudLine(void *a1, const char *a2, ...)
{
  return _[a1 hudLine];
}

id objc_msgSend_hudLines(void *a1, const char *a2, ...)
{
  return _[a1 hudLines];
}

id objc_msgSend_hudRenderContext(void *a1, const char *a2, ...)
{
  return _[a1 hudRenderContext];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_identityForAngelJobLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identityForAngelJobLabel:");
}

id objc_msgSend_identityOfCurrentProcess(void *a1, const char *a2, ...)
{
  return _[a1 identityOfCurrentProcess];
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObjectPassingTest:");
}

id objc_msgSend_indexSet(void *a1, const char *a2, ...)
{
  return _[a1 indexSet];
}

id objc_msgSend_indexesOfObjectsPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexesOfObjectsPassingTest:");
}

id objc_msgSend_initPropertyProcessTerminationSubReasonsMonitored_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initPropertyProcessTerminationSubReasonsMonitored:");
}

id objc_msgSend_initStatus(void *a1, const char *a2, ...)
{
  return _[a1 initStatus];
}

id objc_msgSend_initWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBlock:");
}

id objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_initWithChangesDeliveredOnQueue_toBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithChangesDeliveredOnQueue:toBlock:");
}

id objc_msgSend_initWithExplanation_target_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExplanation:target:attributes:");
}

id objc_msgSend_initWithHangStartTime_hangEndTime_receivedTimestamp_hangDurationMS_hudString_shortenedBundle_bundleId_timedOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHangStartTime:hangEndTime:receivedTimestamp:hangDurationMS:hudString:shortenedBundle:bundleId:timedOut:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithInfo_pid_spawnTimestamp_exitTimestamp_exitReasonCode_exitReasonNamespace_jetsam_priority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInfo:pid:spawnTimestamp:exitTimestamp:exitReasonCode:exitReasonNamespace:jetsam_priority:");
}

id objc_msgSend_initWithMonitorID_fetchIntervalMs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMonitorID:fetchIntervalMs:");
}

id objc_msgSend_initWithNamespaceLayer_codeLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNamespaceLayer:codeLayer:");
}

id objc_msgSend_initWithPreviousHangTextColor_currentHangTextColor_currentHangSevereTextColor_previousHangSevereTextColor_currentHangCriticalTextColor_previousHangCriticalTextColor_backgroundColor_currentProcessExitTextColor_processExitReasonNamespaceTextColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPreviousHangTextColor:currentHangTextColor:currentHangSevereTextColor:previousHangSevereTextColor:currentHangCriticalTextColor:previousHangCriticalTextColor:backgroundColor:currentProcessExitTextColor:processExitReasonNamespaceTextColor:");
}

id objc_msgSend_initWithProcExitRecord_theme_lineDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProcExitRecord:theme:lineDelegate:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_initWithQueue_processName_theme_fontSize_lineDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:processName:theme:fontSize:lineDelegate:");
}

id objc_msgSend_initWithRenderContext_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRenderContext:queue:");
}

id objc_msgSend_initWithRunloopHangTimeoutDurationMSec_thirdPartyDevPreferredLanguages_areProcessTerminationsMonitored_processTerminationsFiltering_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRunloopHangTimeoutDurationMSec:thirdPartyDevPreferredLanguages:areProcessTerminationsMonitored:processTerminationsFiltering:");
}

id objc_msgSend_initWithSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSize:");
}

id objc_msgSend_initializeStatus(void *a1, const char *a2, ...)
{
  return _[a1 initializeStatus];
}

id objc_msgSend_insert_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insert:");
}

id objc_msgSend_intProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intProperty:contextPrefixOut:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_interface(void *a1, const char *a2, ...)
{
  return _[a1 interface];
}

id objc_msgSend_interfaceWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithIdentifier:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_isCurrent_withHUDUpdateInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCurrent:withHUDUpdateInterval:");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToArray:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isHangEndedWithDuration_updateInterval_hangID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isHangEndedWithDuration:updateInterval:hangID:");
}

id objc_msgSend_isImmersionLevelControllerPresentOnScreen(void *a1, const char *a2, ...)
{
  return _[a1 isImmersionLevelControllerPresentOnScreen];
}

id objc_msgSend_isInternal(void *a1, const char *a2, ...)
{
  return _[a1 isInternal];
}

id objc_msgSend_isNoTaskPending(void *a1, const char *a2, ...)
{
  return _[a1 isNoTaskPending];
}

id objc_msgSend_isProcessExitRecordAllowed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isProcessExitRecordAllowed:");
}

id objc_msgSend_isTimedOut(void *a1, const char *a2, ...)
{
  return _[a1 isTimedOut];
}

id objc_msgSend_jetsam_priority(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "jetsam_priority");
}

id objc_msgSend_keyLayer(void *a1, const char *a2, ...)
{
  return _[a1 keyLayer];
}

id objc_msgSend_keysSortedByValueUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keysSortedByValueUsingComparator:");
}

id objc_msgSend_keysSortedByValueWithOptions_usingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keysSortedByValueWithOptions:usingComparator:");
}

id objc_msgSend_kickOffFetchTimer(void *a1, const char *a2, ...)
{
  return _[a1 kickOffFetchTimer];
}

id objc_msgSend_kickOffUpdater(void *a1, const char *a2, ...)
{
  return _[a1 kickOffUpdater];
}

id objc_msgSend_lastKnownHangs(void *a1, const char *a2, ...)
{
  return _[a1 lastKnownHangs];
}

id objc_msgSend_lastKnownMaxKeyLayerWidth(void *a1, const char *a2, ...)
{
  return _[a1 lastKnownMaxKeyLayerWidth];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _[a1 layer];
}

id objc_msgSend_layoutHUDLines_ids_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutHUDLines:ids:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_lightModeTheme(void *a1, const char *a2, ...)
{
  return _[a1 lightModeTheme];
}

id objc_msgSend_lineDelegate(void *a1, const char *a2, ...)
{
  return _[a1 lineDelegate];
}

id objc_msgSend_listenerWithConfigurator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "listenerWithConfigurator:");
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return _[a1 localizedName];
}

id objc_msgSend_localizedNameWithPreferredLocalizations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedNameWithPreferredLocalizations:");
}

id objc_msgSend_machName(void *a1, const char *a2, ...)
{
  return _[a1 machName];
}

id objc_msgSend_mainDisplay(void *a1, const char *a2, ...)
{
  return _[a1 mainDisplay];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 mainRunLoop];
}

id objc_msgSend_minimumValueLayerWidth(void *a1, const char *a2, ...)
{
  return _[a1 minimumValueLayerWidth];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_nilifyCALayers(void *a1, const char *a2, ...)
{
  return _[a1 nilifyCALayers];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _[a1 now];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedChar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedChar:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_numberWithUnsignedShort_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedShort:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectProperty_matchingSelector_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectProperty:matchingSelector:contextPrefixOut:");
}

id objc_msgSend_objectsAtIndexes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectsAtIndexes:");
}

id objc_msgSend_performHUDUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performHUDUpdate:");
}

id objc_msgSend_performHUDUpdate_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performHUDUpdate:withCompletion:");
}

id objc_msgSend_persistentDomainForName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persistentDomainForName:");
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return _[a1 pid];
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_prefContextPrefixPriorityOrder(void *a1, const char *a2, ...)
{
  return _[a1 prefContextPrefixPriorityOrder];
}

id objc_msgSend_prefInitList(void *a1, const char *a2, ...)
{
  return _[a1 prefInitList];
}

id objc_msgSend_prefNamed_domain_profile_matchingSelector_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prefNamed:domain:profile:matchingSelector:contextPrefixOut:");
}

id objc_msgSend_preferredFrameSize(void *a1, const char *a2, ...)
{
  return _[a1 preferredFrameSize];
}

id objc_msgSend_preferredKeyLayerWidth(void *a1, const char *a2, ...)
{
  return _[a1 preferredKeyLayerWidth];
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return _[a1 preferredLanguages];
}

id objc_msgSend_preferredValueLayerWidth(void *a1, const char *a2, ...)
{
  return _[a1 preferredValueLayerWidth];
}

id objc_msgSend_prepareHUDContextIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 prepareHUDContextIfNeeded];
}

id objc_msgSend_previousDurationSinceLastUpdateMs(void *a1, const char *a2, ...)
{
  return _[a1 previousDurationSinceLastUpdateMs];
}

id objc_msgSend_previousHangTextColorForStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "previousHangTextColorForStatus:");
}

id objc_msgSend_processExitReasonNamespaceTextColor(void *a1, const char *a2, ...)
{
  return _[a1 processExitReasonNamespaceTextColor];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return _[a1 processName];
}

id objc_msgSend_processNameToDisplayForBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processNameToDisplayForBundleID:");
}

id objc_msgSend_processTerminationNamesMonitored(void *a1, const char *a2, ...)
{
  return _[a1 processTerminationNamesMonitored];
}

id objc_msgSend_processTerminationReasonsMonitored(void *a1, const char *a2, ...)
{
  return _[a1 processTerminationReasonsMonitored];
}

id objc_msgSend_processTerminationSubReasonsMonitored(void *a1, const char *a2, ...)
{
  return _[a1 processTerminationSubReasonsMonitored];
}

id objc_msgSend_processTerminationsFiltering(void *a1, const char *a2, ...)
{
  return _[a1 processTerminationsFiltering];
}

id objc_msgSend_protocolForProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "protocolForProtocol:");
}

id objc_msgSend_rangeOfCharacterFromSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfCharacterFromSet:");
}

id objc_msgSend_receiveHangHUDInfo_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receiveHangHUDInfo:completion:");
}

id objc_msgSend_receiveHudConfiguration_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receiveHudConfiguration:completion:");
}

id objc_msgSend_receiveMonitoredStates_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receiveMonitoredStates:completion:");
}

id objc_msgSend_receiveProcExitRecord_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receiveProcExitRecord:completion:");
}

id objc_msgSend_receivedTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 receivedTimestamp];
}

id objc_msgSend_refreshHTPrefs(void *a1, const char *a2, ...)
{
  return _[a1 refreshHTPrefs];
}

id objc_msgSend_reloadThemeColors(void *a1, const char *a2, ...)
{
  return _[a1 reloadThemeColors];
}

id objc_msgSend_remoteContextWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteContextWithOptions:");
}

id objc_msgSend_remoteProcess(void *a1, const char *a2, ...)
{
  return _[a1 remoteProcess];
}

id objc_msgSend_remoteTargetWithLaunchingAssertionAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteTargetWithLaunchingAssertionAttributes:");
}

id objc_msgSend_removeAllAnimations(void *a1, const char *a2, ...)
{
  return _[a1 removeAllAnimations];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeFromSuperlayer(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperlayer];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsAtIndexes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsAtIndexes:");
}

id objc_msgSend_removeObserver_forKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:forKeyPath:");
}

id objc_msgSend_removeStaleHangData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeStaleHangData:");
}

id objc_msgSend_replaceObjectAtIndex_withObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceObjectAtIndex:withObject:");
}

id objc_msgSend_requestedToRenderTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 requestedToRenderTimestamp];
}

id objc_msgSend_retargeted(void *a1, const char *a2, ...)
{
  return _[a1 retargeted];
}

id objc_msgSend_rootLayer(void *a1, const char *a2, ...)
{
  return _[a1 rootLayer];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _[a1 run];
}

id objc_msgSend_runloopHangTimeoutDurationMSec(void *a1, const char *a2, ...)
{
  return _[a1 runloopHangTimeoutDurationMSec];
}

id objc_msgSend_saveClearHUDRequest(void *a1, const char *a2, ...)
{
  return _[a1 saveClearHUDRequest];
}

id objc_msgSend_serverRunningDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverRunningDidChange:");
}

id objc_msgSend_serviceQuality(void *a1, const char *a2, ...)
{
  return _[a1 serviceQuality];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setActivationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivationHandler:");
}

id objc_msgSend_setAffineTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAffineTransform:");
}

id objc_msgSend_setAlignmentMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlignmentMode:");
}

id objc_msgSend_setAllowedProcessNames_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowedProcessNames:");
}

id objc_msgSend_setAllowedReasons_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowedReasons:");
}

id objc_msgSend_setAllowedSubReasons_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowedSubReasons:");
}

id objc_msgSend_setAllowsAllProcesses_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsAllProcesses:");
}

id objc_msgSend_setAllowsCriticalProcesses_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsCriticalProcesses:");
}

id objc_msgSend_setAllowsGroupOpacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsGroupOpacity:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setCanceled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCanceled:");
}

id objc_msgSend_setCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletionBlock:");
}

id objc_msgSend_setContainerLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContainerLayer:");
}

id objc_msgSend_setContentsScale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentsScale:");
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCornerRadius:");
}

id objc_msgSend_setCountLimit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountLimit:");
}

id objc_msgSend_setCountsOfMeetingEndingConditions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountsOfMeetingEndingConditions:");
}

id objc_msgSend_setCurrentTheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentTheme:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDisableActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisableActions:");
}

id objc_msgSend_setDisplayScaleDependentPropertiesOnLayers(void *a1, const char *a2, ...)
{
  return _[a1 setDisplayScaleDependentPropertiesOnLayers];
}

id objc_msgSend_setDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDomain:");
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDuration:");
}

id objc_msgSend_setEndTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndTime:");
}

id objc_msgSend_setFillMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFillMode:");
}

id objc_msgSend_setFilteringConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFilteringConfiguration:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFontSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFontSize:");
}

id objc_msgSend_setForegroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setForegroundColor:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setFromValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFromValue:");
}

id objc_msgSend_setHUD_background_opacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHUD_background_opacity:");
}

id objc_msgSend_setHangDuration_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHangDuration:animated:");
}

id objc_msgSend_setHangHUDUpdaterLatencyInMS_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHangHUDUpdaterLatencyInMS:");
}

id objc_msgSend_setHangHUD_updater_latency_in_ms_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHangHUD_updater_latency_in_ms:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setHudLine_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHudLine:");
}

id objc_msgSend_setHudRenderContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHudRenderContext:");
}

id objc_msgSend_setHudUpdateHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHudUpdateHandler:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterface:");
}

id objc_msgSend_setInterfaceTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterfaceTarget:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setKeyLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyLayer:");
}

id objc_msgSend_setLastKnownHangs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastKnownHangs:");
}

id objc_msgSend_setLastKnownMaxKeyLayerWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastKnownMaxKeyLayerWidth:");
}

id objc_msgSend_setLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLayer:");
}

id objc_msgSend_setLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLevel:");
}

id objc_msgSend_setLineDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineDelegate:");
}

id objc_msgSend_setMemoryLoggingIntervalSec_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMemoryLoggingIntervalSec:");
}

id objc_msgSend_setMinimumValueLayerWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumValueLayerWidth:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOpacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOpacity:");
}

id objc_msgSend_setPreferredFrameRateRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredFrameRateRange:");
}

id objc_msgSend_setPreferredKeyLayerWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredKeyLayerWidth:");
}

id objc_msgSend_setPreferredValueLayerWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredValueLayerWidth:");
}

id objc_msgSend_setPreviousDurationSinceLastUpdateMs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreviousDurationSinceLastUpdateMs:");
}

id objc_msgSend_setProcessExitHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProcessExitHandler:");
}

id objc_msgSend_setQualityOfService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQualityOfService:");
}

id objc_msgSend_setQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueue:");
}

id objc_msgSend_setRemovedOnCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemovedOnCompletion:");
}

id objc_msgSend_setRenderParametersFromMonitoredStates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRenderParametersFromMonitoredStates:");
}

id objc_msgSend_setRequestedToRenderTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestedToRenderTimestamp:");
}

id objc_msgSend_setRetargeted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRetargeted:");
}

id objc_msgSend_setSecure_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSecure:");
}

id objc_msgSend_setServer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServer:");
}

id objc_msgSend_setService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setService:");
}

id objc_msgSend_setServiceQuality_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServiceQuality:");
}

id objc_msgSend_setShadowOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowOffset:");
}

id objc_msgSend_setShadowOpacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowOpacity:");
}

id objc_msgSend_setShadowPathIsBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowPathIsBounds:");
}

id objc_msgSend_setShadowRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowRadius:");
}

id objc_msgSend_setShouldPostHTPrefsChangedNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldPostHTPrefsChangedNotification:");
}

id objc_msgSend_setSidePadding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSidePadding:");
}

id objc_msgSend_setSpacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpacing:");
}

id objc_msgSend_setStartTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartTime:");
}

id objc_msgSend_setString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setString:");
}

id objc_msgSend_setSublayerTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSublayerTransform:");
}

id objc_msgSend_setToValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setToValue:");
}

id objc_msgSend_setTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransaction:");
}

id objc_msgSend_setTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransform:");
}

id objc_msgSend_setTruncationMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTruncationMode:");
}

id objc_msgSend_setUpdateBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdateBlock:");
}

id objc_msgSend_setUpdatesComplete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdatesComplete:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setValueLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValueLayer:");
}

id objc_msgSend_setVibrancyFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVibrancyFilter:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setupPrefsWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupPrefsWithQueue:");
}

id objc_msgSend_setupPrefsWithQueue_profilePath_taskingDomainName_hangtracerDomain_setupInternalPrefs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupPrefsWithQueue:profilePath:taskingDomainName:hangtracerDomain:setupInternalPrefs:");
}

id objc_msgSend_sharedAnimator(void *a1, const char *a2, ...)
{
  return _[a1 sharedAnimator];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedPrefs(void *a1, const char *a2, ...)
{
  return _[a1 sharedPrefs];
}

id objc_msgSend_shortenedBundle(void *a1, const char *a2, ...)
{
  return _[a1 shortenedBundle];
}

id objc_msgSend_shouldPostHTPrefsChangedNotification(void *a1, const char *a2, ...)
{
  return _[a1 shouldPostHTPrefsChangedNotification];
}

id objc_msgSend_spawnTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 spawnTimestamp];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_startTime(void *a1, const char *a2, ...)
{
  return _[a1 startTime];
}

id objc_msgSend_statusForHangWithDuration_timedOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusForHangWithDuration:timedOut:");
}

id objc_msgSend_stopFetchTimer(void *a1, const char *a2, ...)
{
  return _[a1 stopFetchTimer];
}

id objc_msgSend_stopUpdater(void *a1, const char *a2, ...)
{
  return _[a1 stopUpdater];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringProperty:contextPrefixOut:");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_sublayers(void *a1, const char *a2, ...)
{
  return _[a1 sublayers];
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_target(void *a1, const char *a2, ...)
{
  return _[a1 target];
}

id objc_msgSend_targetWithProcessIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "targetWithProcessIdentity:");
}

id objc_msgSend_thirdPartyDevPreferredLanguages(void *a1, const char *a2, ...)
{
  return _[a1 thirdPartyDevPreferredLanguages];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timedOut(void *a1, const char *a2, ...)
{
  return _[a1 timedOut];
}

id objc_msgSend_timer(void *a1, const char *a2, ...)
{
  return _[a1 timer];
}

id objc_msgSend_timerWithTimeInterval_repeats_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timerWithTimeInterval:repeats:block:");
}

id objc_msgSend_toValue(void *a1, const char *a2, ...)
{
  return _[a1 toValue];
}

id objc_msgSend_transaction(void *a1, const char *a2, ...)
{
  return _[a1 transaction];
}

id objc_msgSend_turnOffProcessTerminationMonitoring(void *a1, const char *a2, ...)
{
  return _[a1 turnOffProcessTerminationMonitoring];
}

id objc_msgSend_turnOnProcessTerminationMonitoring(void *a1, const char *a2, ...)
{
  return _[a1 turnOnProcessTerminationMonitoring];
}

id objc_msgSend_unsignedIntProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntProperty:contextPrefixOut:");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedLongProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedLongProperty:contextPrefixOut:");
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongValue];
}

id objc_msgSend_update_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "update:options:");
}

id objc_msgSend_updateAnimation_toValue_duration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAnimation:toValue:duration:");
}

id objc_msgSend_updateBlock(void *a1, const char *a2, ...)
{
  return _[a1 updateBlock];
}

id objc_msgSend_updateCornerRadiusAndSidePaddingIfNecessary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCornerRadiusAndSidePaddingIfNecessary:");
}

id objc_msgSend_updateCurrentTheme(void *a1, const char *a2, ...)
{
  return _[a1 updateCurrentTheme];
}

id objc_msgSend_updateDisplayLink(void *a1, const char *a2, ...)
{
  return _[a1 updateDisplayLink];
}

id objc_msgSend_updateHUD_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateHUD:withCompletion:");
}

id objc_msgSend_updateHUDLineWithId_content_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateHUDLineWithId:content:options:");
}

id objc_msgSend_updateHangs_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateHangs:withCompletion:");
}

id objc_msgSend_updateWithHUDConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithHUDConfiguration:");
}

id objc_msgSend_updatesComplete(void *a1, const char *a2, ...)
{
  return _[a1 updatesComplete];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceStyle];
}

id objc_msgSend_valid(void *a1, const char *a2, ...)
{
  return _[a1 valid];
}

id objc_msgSend_valueAtTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueAtTime:");
}

id objc_msgSend_valueLayer(void *a1, const char *a2, ...)
{
  return _[a1 valueLayer];
}