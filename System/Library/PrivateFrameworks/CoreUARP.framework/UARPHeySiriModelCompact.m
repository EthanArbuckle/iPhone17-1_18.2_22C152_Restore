@interface UARPHeySiriModelCompact
+ (id)tag;
- (BOOL)processDynamicAsset:(id *)a3;
- (UARPHeySiriModelCompact)init;
- (id)generateAsset:(id *)a3;
- (void)currentHeySiriModel:(id)a3 fallbackModel:(id)a4 error:(id)a5;
@end

@implementation UARPHeySiriModelCompact

- (UARPHeySiriModelCompact)init
{
  return 0;
}

- (BOOL)processDynamicAsset:(id *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)UARPHeySiriModelCompact;
  BOOL v4 = [(UARPHeySiriModelBase *)&v11 processDynamicAsset:a3];
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)UARPHeySiriModelCompact;
    [(UARPHeySiriModelBase *)&v10 setDelegate:self];
    if (([(UARPHeySiriModelBase *)self engineType] & 2) != 0)
    {
      v9.receiver = self;
      v5 = &selRef_checkCurrentJustSiriModel;
      v6 = &v9;
    }
    else
    {
      v8 = self;
      v5 = &selRef_checkCurrentHeySiriModel;
      v6 = (objc_super *)&v8;
    }
    v6->super_class = (Class)UARPHeySiriModelCompact;
    objc_msgSendSuper2(v6, *v5, v8);
  }
  return v4;
}

- (void)currentHeySiriModel:(id)a3 fallbackModel:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  objc_super v11 = +[UARPHeySiriModelCompact tag];
  v12 = [[UARPAssetVersion alloc] initWithMajorVersion:0 minorVersion:0 releaseVersion:0 buildVersion:0];
  v13.receiver = self;
  v13.super_class = (Class)UARPHeySiriModelCompact;
  [(UARPHeySiriModelBase *)&v13 offerDownloadModel:v10 fallbackModel:v9 tag:v11 assetVersion:v12 error:v8];
}

- (id)generateAsset:(id *)a3
{
  return 0;
}

+ (id)tag
{
  v2 = (char *)uarpAssetTagStructHeySiriModel();
  v3 = [[UARPAssetTag alloc] initWithChar1:*v2 char2:v2[1] char3:v2[2] char4:v2[3]];
  return v3;
}

@end