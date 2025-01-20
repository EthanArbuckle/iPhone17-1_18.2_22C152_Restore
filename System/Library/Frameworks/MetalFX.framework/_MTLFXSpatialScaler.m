@interface _MTLFXSpatialScaler
- (void)_emitTelemetry:(id)a3 forDevice:(id)a4;
@end

@implementation _MTLFXSpatialScaler

- (void)_emitTelemetry:(id)a3 forDevice:(id)a4
{
  id v5 = a3;
  id v9 = a4;
  [v5 colorTextureFormat];
  [v5 outputTextureFormat];
  [v5 inputWidth];
  [v5 inputHeight];
  [v5 outputWidth];
  [v5 outputHeight];
  v6 = [v9 name];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [v5 version];
  id v10 = v8;
  id v11 = v6;
  AnalyticsSendEventLazy();
}

@end