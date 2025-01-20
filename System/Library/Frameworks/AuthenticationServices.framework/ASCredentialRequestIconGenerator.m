@interface ASCredentialRequestIconGenerator
+ (UIImage)alternativeSecurityKeysIcon;
+ (UIImage)passwordManagerIcon;
+ (UIImage)systemPasskeyIcon;
+ (UIImage)systemPasswordIcon;
+ (UIImage)systemSecurityKeysIcon;
+ (id)_iconForPasswordProviderBundleIdentifier:(id)a3;
+ (id)_iconForPresentationContext:(id)a3 size:(CGSize)a4 outIconStyle:(int64_t *)a5;
+ (id)_imageForIcon:(id)a3 size:(CGSize)a4;
+ (id)_keychainIcon;
+ (id)_providerIconForPasswordLoginChoice:(id)a3;
+ (id)_systemBiometricsIconForPresentationContext:(id)a3;
+ (id)_systemImageNamed:(id)a3;
+ (id)headerIconForPresentationContext:(id)a3;
+ (id)headerIconForPresentationContext:(id)a3 outIconStyle:(int64_t *)a4;
+ (id)iconForApplicationIdentifier:(id)a3 size:(CGSize)a4;
+ (id)iconForData:(id)a3 scale:(double)a4 size:(CGSize)a5;
+ (id)iconForPasswordLoginChoice:(id)a3 presentationContext:(id)a4;
+ (id)iconForPublicKeyCredentialLoginChoiceWithPresentationContext:(id)a3;
+ (id)passwordManagerIconWithSize:(CGSize)a3;
@end

@implementation ASCredentialRequestIconGenerator

+ (id)headerIconForPresentationContext:(id)a3
{
  return (id)[a1 headerIconForPresentationContext:a3 outIconStyle:0];
}

+ (id)headerIconForPresentationContext:(id)a3 outIconStyle:(int64_t *)a4
{
  if (a4) {
    *a4 = 0;
  }
  id v6 = a3;
  +[ASViewServiceInterfaceUtilities headerIconSize];
  v7 = objc_msgSend(a1, "_iconForPresentationContext:size:outIconStyle:", v6, a4);

  return v7;
}

+ (id)iconForPasswordLoginChoice:(id)a3 presentationContext:(id)a4
{
  id v5 = a3;
  if ([v5 isExternal]) {
    [a1 _providerIconForPasswordLoginChoice:v5];
  }
  else {
  id v6 = [a1 systemPasswordIcon];
  }

  return v6;
}

+ (UIImage)passwordManagerIcon
{
  if (![MEMORY[0x263F662A0] isPasswordsAppInstalled]
    || (objc_msgSend(a1, "iconForApplicationIdentifier:size:", *MEMORY[0x263F664C8], 128.0, 128.0),
        (v3 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v3 = [a1 _keychainIcon];
  }

  return (UIImage *)v3;
}

+ (id)iconForPublicKeyCredentialLoginChoiceWithPresentationContext:(id)a3
{
  id v4 = a3;
  id v5 = [v4 proxiedIconData];
  id v6 = [v4 proxiedIconScale];
  v7 = v6;
  if (v5 && v6)
  {
    [v6 doubleValue];
    double v9 = v8;
    +[ASViewServiceInterfaceUtilities cellIconSize];
    v12 = objc_msgSend(a1, "iconForData:scale:size:", v5, v9, v10, v11);
  }
  else
  {
    v13 = [v4 appIdentifier];

    if (v13)
    {
      v14 = [v4 appIdentifier];
      +[ASViewServiceInterfaceUtilities cellIconSize];
      v12 = objc_msgSend(a1, "iconForApplicationIdentifier:size:", v14);
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

+ (UIImage)systemPasskeyIcon
{
  v2 = [a1 _systemImageNamed:@"person.badge.key.fill"];
  v3 = objc_msgSend(v2, "imageWithAlignmentRectInsets:", *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));

  return (UIImage *)v3;
}

+ (UIImage)systemPasswordIcon
{
  v2 = [MEMORY[0x263F827E8] systemImageNamed:@"key.fill"];
  v3 = objc_msgSend(v2, "imageWithAlignmentRectInsets:", *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));

  return (UIImage *)v3;
}

+ (UIImage)systemSecurityKeysIcon
{
  v2 = [a1 _systemImageNamed:@"security.key"];
  v3 = objc_msgSend(v2, "imageWithAlignmentRectInsets:", *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));

  return (UIImage *)v3;
}

+ (UIImage)alternativeSecurityKeysIcon
{
  v2 = (void *)MEMORY[0x263F827E8];
  v3 = objc_msgSend(MEMORY[0x263F086E0], "as_authenticationServicesBundle");
  id v4 = [v2 imageNamed:@"SecurityKeysIcon" inBundle:v3];

  return (UIImage *)v4;
}

+ (id)_systemBiometricsIconForPresentationContext:(id)a3
{
  id v5 = a3;
  switch([MEMORY[0x263F29440] biometryType])
  {
    case 0:
      if ([v5 hasPlatformCredentialRequest]) {
        [a1 systemPasskeyIcon];
      }
      else {
      v3 = [a1 passwordManagerIcon];
      }
      break;
    case 1:
      id v6 = @"touchid";
      goto LABEL_7;
    case 2:
      id v6 = @"faceid";
      goto LABEL_7;
    case 4:
      id v6 = @"opticid";
LABEL_7:
      v7 = [a1 _systemImageNamed:v6];
      v3 = objc_msgSend(v7, "imageWithAlignmentRectInsets:", *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));

      break;
    default:
      break;
  }

  return v3;
}

+ (id)iconForApplicationIdentifier:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v15 = 0;
  v7 = [MEMORY[0x263F01890] bundleRecordWithApplicationIdentifier:a3 error:&v15];
  id v8 = v15;
  if (v7)
  {
    id v9 = objc_alloc(MEMORY[0x263F4B540]);
    double v10 = [v7 bundleIdentifier];
    double v11 = (void *)[v9 initWithBundleIdentifier:v10];

    v12 = objc_msgSend(a1, "_imageForIcon:size:", v11, width, height);
  }
  else
  {
    v13 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[ASCredentialRequestIconGenerator iconForApplicationIdentifier:size:](v13, v8);
    }
    v12 = 0;
  }

  return v12;
}

+ (id)passwordManagerIconWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [a1 passwordManagerIcon];
  id v6 = objc_msgSend(v5, "imageByPreparingThumbnailOfSize:", width, height);

  return v6;
}

+ (id)_iconForPresentationContext:(id)a3 size:(CGSize)a4 outIconStyle:(int64_t *)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  if ([v9 requestTypes] == 64) {
    goto LABEL_2;
  }
  if (([v9 isCABLEAuthenticatorRequest] & 1) == 0)
  {
    double v11 = [v9 appIdentifier];
    if (v11)
    {
    }
    else
    {
      uint64_t v20 = [v9 proxiedIconData];
      if (!v20
        || (v21 = (void *)v20,
            [v9 proxiedIconScale],
            v22 = objc_claimAutoreleasedReturnValue(),
            v22,
            v21,
            !v22))
      {
LABEL_2:
        double v10 = 0;
        goto LABEL_54;
      }
    }
  }
  v12 = [v9 proxiedIconData];
  v13 = [v9 proxiedIconScale];
  v14 = v13;
  if (v12 && v13)
  {
    if (a5) {
      *a5 = 0;
    }
    [v13 doubleValue];
    uint64_t v15 = objc_msgSend(a1, "iconForData:scale:size:", v12);
    goto LABEL_34;
  }
  if (![v9 hasPlatformCredentialRequest])
  {
    if (([v9 requestTypes] & 2) == 0)
    {
      if (a5) {
        *a5 = 0;
      }
      v19 = objc_opt_class();
      goto LABEL_33;
    }
    if (a5) {
      *a5 = 0;
    }
    v32 = [v9 appIdentifier];
    uint64_t v33 = objc_msgSend(a1, "iconForApplicationIdentifier:size:", v32, width, height);
    goto LABEL_47;
  }
  v16 = [MEMORY[0x263F662C8] sharedMonitor];
  int v17 = [v16 isKeychainSyncEnabled];

  if (v17) {
    uint64_t v18 = [v9 iCloudKeychainPasskeyLoginChoiceCount];
  }
  else {
    uint64_t v18 = 0;
  }
  uint64_t v23 = [v9 externalPasskeyLoginChoiceCount];
  uint64_t v24 = v23;
  if (!v18)
  {
    if (v23)
    {
      [v9 loginChoices];
      v25 = uint64_t v36 = v24;
      v26 = [v25 firstObject];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      uint64_t v24 = v36;
      if (isKindOfClass)
      {
        v28 = [v9 loginChoices];
        v29 = [v28 firstObject];

        v30 = [v29 externalCredentialProviderBundleID];
        double v10 = objc_msgSend(a1, "iconForApplicationIdentifier:size:", v30, width, height);

        if (a5) {
          *a5 = 0;
        }

        goto LABEL_53;
      }
    }
  }
  if ((([v9 isRegistrationRequest] ^ 1 | v17) & 1) != 0
    || !isUserVerificationConfigured())
  {
    if (v18 && v24)
    {
      if (a5) {
        *a5 = 2;
      }
      uint64_t v31 = [(id)objc_opt_class() systemPasskeyIcon];
LABEL_51:
      v32 = (void *)v31;
      v34 = [MEMORY[0x263F82818] configurationWithPointSize:50.0];
      double v10 = [v32 imageWithSymbolConfiguration:v34];

      goto LABEL_52;
    }
    if ([MEMORY[0x263F29440] biometryType] != 1)
    {
      if (a5) {
        *a5 = 2;
      }
      uint64_t v31 = [(id)objc_opt_class() _systemBiometricsIconForPresentationContext:v9];
      goto LABEL_51;
    }
    if (a5) {
      *a5 = 0;
    }
    v32 = [(id)objc_opt_class() passwordManagerIcon];
    uint64_t v33 = objc_msgSend(v32, "imageByPreparingThumbnailOfSize:", width, height);
LABEL_47:
    double v10 = (void *)v33;
LABEL_52:

    goto LABEL_53;
  }
  if (a5) {
    *a5 = 0;
  }
  v19 = a1;
LABEL_33:
  uint64_t v15 = [v19 passwordManagerIcon];
LABEL_34:
  double v10 = (void *)v15;
LABEL_53:

LABEL_54:

  return v10;
}

+ (id)iconForData:(id)a3 scale:(double)a4 size:(CGSize)a5
{
  double height = a5.height;
  v21[1] = *MEMORY[0x263EF8340];
  objc_msgSend(MEMORY[0x263F827E8], "imageWithData:scale:", a3, a4, a5.width);
  id v7 = objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 CGImage];
  [v7 scale];
  double v10 = (void *)[objc_alloc(MEMORY[0x263F4B500]) initWithCGImage:v8 scale:v9];
  id v11 = objc_alloc(MEMORY[0x263F4B540]);
  v21[0] = v10;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
  v13 = (void *)[v11 initWithImages:v12];

  [v7 size];
  double v14 = 1.0;
  if (v15 != 0.0)
  {
    objc_msgSend(v7, "size", 1.0);
    double v17 = v16;
    [v7 size];
    double v14 = v17 / v18;
  }
  v19 = objc_msgSend(a1, "_imageForIcon:size:", v13, height * v14, height);

  return v19;
}

+ (id)_imageForIcon:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  v19[1] = *MEMORY[0x263EF8340];
  id v6 = (void *)MEMORY[0x263F82B60];
  id v7 = a3;
  uint64_t v8 = [v6 mainScreen];
  [v8 scale];
  double v10 = v9;

  id v11 = objc_msgSend(objc_alloc(MEMORY[0x263F4B558]), "initWithSize:scale:", width, height, v10);
  v12 = [MEMORY[0x263F82DA0] currentTraitCollection];
  objc_msgSend(v11, "setAppearance:", objc_msgSend(v12, "userInterfaceStyle") == 2);

  [v11 setShouldApplyMask:1];
  [v11 setShape:1];
  v19[0] = v11;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
  [v7 prepareImagesForImageDescriptors:v13];

  double v14 = [v7 imageForImageDescriptor:v11];

  double v15 = (void *)MEMORY[0x263F827E8];
  uint64_t v16 = [v14 CGImage];
  [v14 scale];
  double v17 = objc_msgSend(v15, "imageWithCGImage:scale:orientation:", v16, 0);

  return v17;
}

+ (id)_providerIconForPasswordLoginChoice:(id)a3
{
  id v4 = a3;
  if ([v4 isExternal])
  {
    id v5 = [v4 providerBundleIdentifier];
    id v6 = [a1 _iconForPasswordProviderBundleIdentifier:v5];
  }
  else
  {
    id v6 = [a1 _keychainIcon];
  }

  return v6;
}

+ (id)_keychainIcon
{
  return (id)objc_msgSend(MEMORY[0x263F827E8], "as_imageNamed:", @"KeyIcon-60");
}

+ (id)_iconForPasswordProviderBundleIdentifier:(id)a3
{
  v3 = (void *)MEMORY[0x263F827E8];
  id v4 = (void *)MEMORY[0x263F82B60];
  id v5 = a3;
  id v6 = [v4 mainScreen];
  [v6 scale];
  id v7 = objc_msgSend(v3, "_applicationIconImageForBundleIdentifier:format:scale:", v5, 0);

  if (!v7)
  {
    uint64_t v8 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[ASCredentialRequestIconGenerator _iconForPasswordProviderBundleIdentifier:](v8);
    }
  }

  return v7;
}

+ (id)_systemImageNamed:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F827E8] _systemImageNamed:v3];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = (void *)MEMORY[0x263F827E8];
    uint64_t v8 = objc_msgSend(MEMORY[0x263F086E0], "as_authenticationServicesBundle");
    id v6 = [v7 imageNamed:v3 inBundle:v8];
  }

  return v6;
}

+ (void)iconForApplicationIdentifier:(void *)a1 size:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_21918F000, v3, OS_LOG_TYPE_ERROR, "Could not get bundle record to get icon for credential with error: %{public}@.", (uint8_t *)&v5, 0xCu);
}

+ (void)_iconForPasswordProviderBundleIdentifier:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21918F000, log, OS_LOG_TYPE_ERROR, "Could not get icon for password provider", v1, 2u);
}

@end