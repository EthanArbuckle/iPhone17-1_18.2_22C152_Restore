@interface TURoute
+ (id)speakerAudioRouteGlyph;
- (id)audioRouteGlyphForDisplayStyle:(int64_t)a3;
- (id)audioRouteGlyphForRoutePicker;
- (id)audioRouteGlyphForRoutePickerWithColor:(id)a3;
- (id)avSystemControllerQueryQueue;
- (void)fetchAudioControlsGlyphWithCompletion:(id)a3;
@end

@implementation TURoute

+ (id)speakerAudioRouteGlyph
{
  v2 = +[UIImage speakerRouteGlyphForDisplayStyle:1];
  v3 = [v2 imageFlippedForRightToLeftLayoutDirection];

  return v3;
}

- (id)audioRouteGlyphForDisplayStyle:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) < 3)
  {
    id v5 = +[UIImage routeGlyphForDeviceType:[(TURoute *)self deviceType] displayStyle:a3];
    if (v5) {
      goto LABEL_17;
    }
    if (![(TURoute *)self isSpeaker])
    {
      if (([(TURoute *)self isSpeaker] & 1) == 0
        && ([(TURoute *)self isReceiver] & 1) == 0
        && ([(TURoute *)self isDefaultRoute] & 1) == 0)
      {
        uint64_t v7 = +[UIImage bluetoothAudioRouteGlyphForDisplayStyle:a3];
        goto LABEL_14;
      }
      v6 = PHDefaultLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[TURoute(UI) audioRouteGlyphForDisplayStyle:](self, v6);
      }
    }
    uint64_t v7 = +[UIImage speakerRouteGlyphForDisplayStyle:a3];
LABEL_14:
    id v5 = (id)v7;
    goto LABEL_17;
  }
  if (a3 == 1)
  {
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__7;
    v18 = __Block_byref_object_dispose__7;
    id v19 = 0;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __46__TURoute_UI__audioRouteGlyphForDisplayStyle___block_invoke;
    v11[3] = &unk_10027E3D0;
    v13 = &v14;
    v8 = dispatch_semaphore_create(0);
    v12 = v8;
    [(TURoute *)self fetchAudioControlsGlyphWithCompletion:v11];
    dispatch_time_t v9 = dispatch_time(0, 3000000000);
    dispatch_semaphore_wait(v8, v9);
    id v5 = (id)v15[5];

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    if (!a3)
    {
      uint64_t v7 = [(TURoute *)self audioRouteGlyphForRoutePicker];
      goto LABEL_14;
    }
    id v5 = 0;
  }
LABEL_17:

  return v5;
}

void __46__TURoute_UI__audioRouteGlyphForDisplayStyle___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)audioRouteGlyphForRoutePickerWithColor:(id)a3
{
  id v4 = a3;
  id v5 = +[UIImage routeGlyphForDeviceType:[(TURoute *)self deviceType] displayStyle:0 color:v4];

  if (v5)
  {
    id v6 = v5;
LABEL_9:
    uint64_t v7 = v6;
    goto LABEL_10;
  }
  if ([(TURoute *)self isCarAudio])
  {
    id v6 = +[UIImage carplayRouteGlyphForDisplayStyle:0];
    goto LABEL_9;
  }
  if ([(TURoute *)self isPreferred])
  {
    id v6 = +[UIImage routeGlyphForDeviceType:1 displayStyle:0];
    goto LABEL_9;
  }
  if ([(TURoute *)self isBluetooth])
  {
    id v6 = +[UIImage bluetoothAudioRouteGlyphForDisplayStyle:0];
    goto LABEL_9;
  }
  if ([(TURoute *)self isReceiver])
  {
    v10 = +[PHDevice currentDevice];
    uint64_t v7 = [v10 audioRouteGlyphImage];

    goto LABEL_10;
  }
  if ([(TURoute *)self isSpeaker])
  {
    id v6 = +[UIImage speakerRouteGlyphForDisplayStyle:0];
    goto LABEL_9;
  }
  v11 = +[AVSystemController sharedAVSystemController];
  v12 = [v11 attributeForKey:AVSystemController_HeadphoneJackIsConnectedAttribute];
  if ([v12 BOOLValue])
  {

LABEL_20:
    id v6 = +[UIImage headphonesRouteGlyphForDisplayStyle:0];
    goto LABEL_9;
  }
  unsigned __int8 v13 = [(TURoute *)self isBluetoothLE];

  if (v13) {
    goto LABEL_20;
  }
  uint64_t v7 = 0;
LABEL_10:
  v8 = [v7 _imageThatSuppressesAccessibilityHairlineThickening];

  return v8;
}

- (id)audioRouteGlyphForRoutePicker
{
  v3 = +[UIColor labelColor];
  id v4 = [(TURoute *)self audioRouteGlyphForRoutePickerWithColor:v3];

  return v4;
}

- (id)avSystemControllerQueryQueue
{
  if (avSystemControllerQueryQueue_onceToken != -1) {
    dispatch_once(&avSystemControllerQueryQueue_onceToken, &__block_literal_global_29);
  }
  v2 = (void *)avSystemControllerQueryQueue_avSystemControllerQueryQueue;

  return v2;
}

void __43__TURoute_UI__avSystemControllerQueryQueue__block_invoke(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.mobilephone.tuRouteUI", 0);
  uint64_t v2 = avSystemControllerQueryQueue_avSystemControllerQueryQueue;
  avSystemControllerQueryQueue_avSystemControllerQueryQueue = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

- (void)fetchAudioControlsGlyphWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = +[UIImage routeGlyphForDeviceType:[(TURoute *)self deviceType] displayStyle:1];
  if (v5)
  {
    v4[2](v4, v5);
  }
  else if ([(TURoute *)self isSpeaker])
  {
    id v6 = [(id)objc_opt_class() speakerAudioRouteGlyph];
    v4[2](v4, v6);
  }
  else
  {
    objc_initWeak(&location, self);
    uint64_t v7 = [(TURoute *)self avSystemControllerQueryQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __53__TURoute_UI__fetchAudioControlsGlyphWithCompletion___block_invoke;
    block[3] = &unk_10027CE60;
    objc_copyWeak(&v10, &location);
    dispatch_time_t v9 = v4;
    dispatch_async(v7, block);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __53__TURoute_UI__fetchAudioControlsGlyphWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = +[AVSystemController sharedAVSystemController];
  v3 = [v2 attributeForKey:AVSystemController_HeadphoneJackIsConnectedAttribute];
  unsigned __int8 v4 = [v3 BOOLValue];

  if ((v4 & 1) != 0 || [WeakRetained isBluetoothLE])
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = +[UIImage headphonesRouteGlyphForDisplayStyle:1];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
LABEL_4:

    goto LABEL_5;
  }
  unsigned int v7 = [WeakRetained isAuxiliary];
  uint64_t v8 = *(void *)(a1 + 32);
  if (v7)
  {
    id v6 = +[UIImage bluetoothAudioRouteGlyphForDisplayStyle:1];
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v6);
    goto LABEL_4;
  }
  (*(void (**)(uint64_t, void))(v8 + 16))(v8, 0);
LABEL_5:
}

@end