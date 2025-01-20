@interface MTRContentLauncherClusterBrandingInformationStruct
- (MTRContentLauncherClusterBrandingInformationStruct)init;
- (MTRContentLauncherClusterStyleInformationStruct)background;
- (MTRContentLauncherClusterStyleInformationStruct)logo;
- (MTRContentLauncherClusterStyleInformationStruct)progressBar;
- (MTRContentLauncherClusterStyleInformationStruct)splash;
- (MTRContentLauncherClusterStyleInformationStruct)waterMark;
- (NSString)providerName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setBackground:(MTRContentLauncherClusterStyleInformationStruct *)background;
- (void)setLogo:(MTRContentLauncherClusterStyleInformationStruct *)logo;
- (void)setProgressBar:(MTRContentLauncherClusterStyleInformationStruct *)progressBar;
- (void)setProviderName:(NSString *)providerName;
- (void)setSplash:(MTRContentLauncherClusterStyleInformationStruct *)splash;
- (void)setWaterMark:(MTRContentLauncherClusterStyleInformationStruct *)waterMark;
@end

@implementation MTRContentLauncherClusterBrandingInformationStruct

- (MTRContentLauncherClusterBrandingInformationStruct)init
{
  v11.receiver = self;
  v11.super_class = (Class)MTRContentLauncherClusterBrandingInformationStruct;
  v2 = [(MTRContentLauncherClusterBrandingInformationStruct *)&v11 init];
  v3 = v2;
  if (v2)
  {
    providerName = v2->_providerName;
    v2->_providerName = (NSString *)&stru_26F969DC8;

    background = v3->_background;
    v3->_background = 0;

    logo = v3->_logo;
    v3->_logo = 0;

    progressBar = v3->_progressBar;
    v3->_progressBar = 0;

    splash = v3->_splash;
    v3->_splash = 0;

    waterMark = v3->_waterMark;
    v3->_waterMark = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRContentLauncherClusterBrandingInformationStruct);
  v7 = objc_msgSend_providerName(self, v5, v6);
  objc_msgSend_setProviderName_(v4, v8, (uint64_t)v7);

  objc_super v11 = objc_msgSend_background(self, v9, v10);
  objc_msgSend_setBackground_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_logo(self, v13, v14);
  objc_msgSend_setLogo_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_progressBar(self, v17, v18);
  objc_msgSend_setProgressBar_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_splash(self, v21, v22);
  objc_msgSend_setSplash_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_waterMark(self, v25, v26);
  objc_msgSend_setWaterMark_(v4, v28, (uint64_t)v27);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: providerName:%@; background:%@; logo:%@; progressBar:%@; splash:%@; waterMark:%@; >",
    v5,
    self->_providerName,
    self->_background,
    self->_logo,
    self->_progressBar,
    self->_splash,
  v7 = self->_waterMark);

  return v7;
}

- (NSString)providerName
{
  return self->_providerName;
}

- (void)setProviderName:(NSString *)providerName
{
}

- (MTRContentLauncherClusterStyleInformationStruct)background
{
  return self->_background;
}

- (void)setBackground:(MTRContentLauncherClusterStyleInformationStruct *)background
{
}

- (MTRContentLauncherClusterStyleInformationStruct)logo
{
  return self->_logo;
}

- (void)setLogo:(MTRContentLauncherClusterStyleInformationStruct *)logo
{
}

- (MTRContentLauncherClusterStyleInformationStruct)progressBar
{
  return self->_progressBar;
}

- (void)setProgressBar:(MTRContentLauncherClusterStyleInformationStruct *)progressBar
{
}

- (MTRContentLauncherClusterStyleInformationStruct)splash
{
  return self->_splash;
}

- (void)setSplash:(MTRContentLauncherClusterStyleInformationStruct *)splash
{
}

- (MTRContentLauncherClusterStyleInformationStruct)waterMark
{
  return self->_waterMark;
}

- (void)setWaterMark:(MTRContentLauncherClusterStyleInformationStruct *)waterMark
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waterMark, 0);
  objc_storeStrong((id *)&self->_splash, 0);
  objc_storeStrong((id *)&self->_progressBar, 0);
  objc_storeStrong((id *)&self->_logo, 0);
  objc_storeStrong((id *)&self->_background, 0);

  objc_storeStrong((id *)&self->_providerName, 0);
}

@end