uint64_t start(int a1, char **a2)
{
  void *v4;

  UIApplicationMain(a1, a2, @"DemoApplication", @"DemoApplication");
  return 0;
}

id sub_1000017F0(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 8);
  long long v3 = *(_OWORD *)&kCMTimeZero.value;
  CMTimeEpoch epoch = kCMTimeZero.epoch;
  return [v1 seekToTime:&v3];
}

void sub_1000019D8(int8x16_t *a1)
{
  v2 = (void *)a1[2].i64[0];
  id v14 = 0;
  id v3 = [v2 statusOfValueForKey:@"duration" error:&v14];
  id v4 = v14;
  v5 = v4;
  if (v3 != (id)2) {
    sub_100001E38(v4);
  }
  v6 = (void *)a1[2].i64[0];
  id v13 = v5;
  id v7 = [v6 statusOfValueForKey:@"tracks" error:&v13];
  id v8 = v13;

  if (v7 != (id)2) {
    sub_100001E00(v8);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100001AF8;
  block[3] = &unk_100004190;
  int8x16_t v10 = a1[2];
  id v9 = (id)v10.i64[0];
  int8x16_t v12 = vextq_s8(v10, v10, 8uLL);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100001AF8(uint64_t a1)
{
  v2 = *(void **)(a1 + 40);
  if (v2) {
    [v2 duration];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  *(Float64 *)(*(void *)(a1 + 32) + 32) = CMTimeGetSeconds(&time);
  id v3 = +[AVPlayerItem playerItemWithAsset:*(void *)(a1 + 40)];
  [v3 addObserver:*(void *)(a1 + 32) forKeyPath:@"status" options:4 context:&unk_100009038];
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:*(void *)(a1 + 32) selector:"_playerItemDidPlayToEndTime:" name:AVPlayerItemDidPlayToEndTimeNotification object:v3];

  uint64_t v5 = +[AVPlayer playerWithPlayerItem:v3];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v5;

  [*(id *)(*(void *)(a1 + 32) + 8) setActionAtItemEnd:2];
  [*(id *)(*(void *)(a1 + 32) + 16) setPlayer:*(void *)(*(void *)(a1 + 32) + 8)];
}

void sub_100001E00(void *a1)
{
  v1 = [a1 localizedDescription];
  NSLog(@"error loading movie tracks: %@", v1);

  abort();
}

void sub_100001E38(void *a1)
{
  v1 = [a1 localizedDescription];
  NSLog(@"error loading movie duration: %@", v1);

  abort();
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  return _CMTimeGetSeconds(time);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return _CMTimeMakeWithSeconds(retstr, seconds, preferredTimescale);
}

NSString *NSHomeDirectory(void)
{
  return _NSHomeDirectory();
}

void NSLog(NSString *format, ...)
{
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

void abort(void)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

long double fmod(long double __x, long double __y)
{
  return _fmod(__x, __y);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_msgSend__prepareMovie(void *a1, const char *a2, ...)
{
  return [a1 _prepareMovie];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_currentItem(void *a1, const char *a2, ...)
{
  return [a1 currentItem];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return [a1 duration];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_player(void *a1, const char *a2, ...)
{
  return [a1 player];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_suspend(void *a1, const char *a2, ...)
{
  return [a1 suspend];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}