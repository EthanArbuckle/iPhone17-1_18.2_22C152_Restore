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
      v6 = sub_1000D5130();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1001E922C(self, v6);
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
    v17 = sub_1000110C4;
    v18 = sub_1000110D4;
    id v19 = 0;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000110DC;
    v11[3] = &unk_1002CD7A0;
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
  if (qword_100325D80 != -1) {
    dispatch_once(&qword_100325D80, &stru_1002CD7C0);
  }
  v2 = (void *)qword_100325D78;

  return v2;
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
    block[2] = sub_100011570;
    block[3] = &unk_1002CD7E8;
    objc_copyWeak(&v10, &location);
    dispatch_time_t v9 = v4;
    dispatch_async(v7, block);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

@end