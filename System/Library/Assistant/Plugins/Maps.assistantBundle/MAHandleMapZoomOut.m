@interface MAHandleMapZoomOut
- (id)_performWithServiceHelper:(id)a3;
- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4;
@end

@implementation MAHandleMapZoomOut

- (id)_performWithServiceHelper:(id)a3
{
  id v3 = a3;
  v4 = +[MKMapService sharedService];
  [v4 captureUserAction:1003 onTarget:802 eventValue:0];

  uint64_t v10 = MKLaunchOptionsCameraAltitudeMultiplierKey;
  v11 = &off_49D58;
  v5 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v6 = +[MKMapItem urlForMapItem:0 options:v5];

  LODWORD(v5) = [v3 openSensitiveURL:v6];
  id v7 = objc_alloc_init((Class)SACommandFailed);
  if (v5)
  {
    id v8 = objc_alloc_init((Class)SACommandSucceeded);

    id v7 = v8;
  }

  return v7;
}

- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4
{
  id v8 = (void (**)(id, void *))a3;
  v6 = [(MAHandleMapZoomOut *)self _performWithServiceHelper:a4];
  if (v8)
  {
    id v7 = [v6 dictionary];
    v8[2](v8, v7);
  }
}

@end