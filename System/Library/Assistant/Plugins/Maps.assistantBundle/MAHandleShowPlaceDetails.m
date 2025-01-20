@interface MAHandleShowPlaceDetails
- (void)_performWithServiceHelper:(id)a3 completion:(id)a4;
- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4;
@end

@implementation MAHandleShowPlaceDetails

- (void)_performWithServiceHelper:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id, void))a4;
  v8 = +[GEOPlaceActionDetails actionDetailsWithMapItem:0 timestamp:[(MAHandleShowPlaceDetails *)self itemIndex] resultIndex:0.0];
  v9 = +[MKMapService sharedService];
  [v9 captureUserAction:8003 onTarget:802 eventValue:0 placeActionDetails:v8];

  v17[0] = MKLaunchOptionsSelectedIndexKey;
  v10 = +[NSNumber numberWithInteger:[(MAHandleShowPlaceDetails *)self itemIndex]];
  v17[1] = _MKLaunchOptionsPreserveSearchResultsKey;
  v18[0] = v10;
  v18[1] = &__kCFBooleanTrue;
  v11 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];

  v12 = +[MKMapItem urlForMapItem:0 options:v11];
  if (v12)
  {
    if (![v6 openSensitiveURL:v12])
    {
      id v15 = objc_alloc((Class)SACommandFailed);
      v16 = +[NSString stringWithFormat:@"Unable to open maps with URL: %@", v12];
      id v14 = [v15 initWithReason:v16];

      goto LABEL_7;
    }
    id v13 = objc_alloc_init((Class)SACommandSucceeded);
  }
  else
  {
    id v13 = [objc_alloc((Class)SACommandFailed) initWithReason:@"Unable to generate Maps URL."];
  }
  id v14 = v13;
LABEL_7:
  v7[2](v7, v14, 0);
}

- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4
{
  id v6 = a3;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  char v14 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_B370;
  v9[3] = &unk_30948;
  v12 = v13;
  id v7 = a4;
  id v10 = v7;
  id v8 = v6;
  id v11 = v8;
  [(MAHandleShowPlaceDetails *)self _performWithServiceHelper:v7 completion:v9];

  _Block_object_dispose(v13, 8);
}

@end