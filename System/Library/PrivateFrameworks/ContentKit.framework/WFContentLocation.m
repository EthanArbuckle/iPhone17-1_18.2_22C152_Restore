@interface WFContentLocation
+ (BOOL)supportsSecureCoding;
+ (WFContentLocation)airdropLocation;
+ (WFContentLocation)appleScriptLocation;
+ (WFContentLocation)cellularDataStatisticsLocation;
+ (WFContentLocation)clipboardLocation;
+ (WFContentLocation)controlOtherAppsLocation;
+ (WFContentLocation)dataRoamingLocation;
+ (WFContentLocation)defaultLineLocation;
+ (WFContentLocation)focusLocation;
+ (WFContentLocation)genericLocation;
+ (WFContentLocation)javaScript;
+ (WFContentLocation)javaScriptForAutomationLocation;
+ (WFContentLocation)locationLocation;
+ (WFContentLocation)locationWithCalendarSource:(id)a3;
+ (WFContentLocation)locationWithNotesAccountIdentifier:(id)a3;
+ (WFContentLocation)microphoneLocation;
+ (WFContentLocation)networkLocation;
+ (WFContentLocation)notificationLocation;
+ (WFContentLocation)onScreenContentLocation;
+ (WFContentLocation)personalHotspotPasswordLocation;
+ (WFContentLocation)printLocation;
+ (WFContentLocation)publicICloud;
+ (WFContentLocation)screenshotLocation;
+ (WFContentLocation)shareExtensionLocation;
+ (WFContentLocation)shellLocation;
+ (WFContentLocation)shortcutsAppLocation;
+ (WFContentLocation)speechRecognitionLocation;
+ (WFContentLocation)toggleLineLocation;
+ (WFContentLocation)wallpaperLocation;
+ (WFContentLocation)webpagesLocation;
+ (WFContentLocation)windowsLocation;
+ (id)allContentLocationClasses;
+ (id)appDescriptorForFileProviderHandlingURL:(id)a3 error:(id *)a4;
+ (id)contentLocationForFile:(id)a3;
+ (id)objectWithWFSerializedRepresentation:(id)a3;
+ (void)getContentLocationFromFile:(id)a3 completionHandler:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)identifier;
- (NSString)localizedTitle;
- (WFContentLocation)initWithCoder:(id)a3;
- (WFContentLocation)initWithIdentifier:(id)a3;
- (WFContentLocation)initWithIdentifier:(id)a3 promptingBehaviour:(unint64_t)a4;
- (id)localizedMDMDescription;
- (id)wfSerializedRepresentation;
- (unint64_t)hash;
- (unint64_t)managedLevel;
- (unint64_t)promptingBehaviour;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFContentLocation

+ (id)appDescriptorForFileProviderHandlingURL:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (!v7)
  {
    v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2, a1, @"WFContentLocation+FileProviders.m", 63, @"Invalid parameter not satisfying: %@", @"URL" object file lineNumber description];
  }
  int v8 = [v7 startAccessingSecurityScopedResource];
  v9 = [MEMORY[0x263F054C0] defaultManager];
  v10 = [v9 itemForURL:v7 error:a4];

  if (a4 && *a4)
  {
    v11 = getWFSecurityLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v12 = *a4;
      *(_DWORD *)buf = 136315394;
      v24 = "+[WFContentLocation(FileProviders) appDescriptorForFileProviderHandlingURL:error:]";
      __int16 v25 = 2112;
      id v26 = v12;
      _os_log_impl(&dword_216505000, v11, OS_LOG_TYPE_DEBUG, "%s Could not create FPItem from URL: %@", buf, 0x16u);
    }
    v13 = 0;
  }
  else
  {
    if (v8) {
      [v7 stopAccessingSecurityScopedResource];
    }
    if (!v10)
    {
      v13 = 0;
      goto LABEL_21;
    }
    id v22 = 0;
    v14 = [MEMORY[0x263F054C8] providerDomainForItem:v10 error:&v22];
    v15 = v22;
    v11 = v15;
    if (v14)
    {
      v16 = [v14 topLevelBundleIdentifier];
      v17 = (void *)[objc_alloc(MEMORY[0x263F0F988]) initWithBundleIdentifier:v16];
      v18 = [MEMORY[0x263F0F9B0] sharedResolver];
      v13 = [v18 resolvedAppMatchingDescriptor:v17];
    }
    else
    {
      if (a4) {
        *a4 = v15;
      }
      v16 = getWFWorkflowExecutionLogObject();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v19 = [v10 providerID];
        *(_DWORD *)buf = 136315650;
        v24 = "+[WFContentLocation(FileProviders) appDescriptorForFileProviderHandlingURL:error:]";
        __int16 v25 = 2112;
        id v26 = v19;
        __int16 v27 = 2112;
        v28 = v11;
        _os_log_impl(&dword_216505000, v16, OS_LOG_TYPE_ERROR, "%s Couldn't resolve file provider with id %@: %@", buf, 0x20u);
      }
      v13 = 0;
    }
  }
LABEL_21:

  return v13;
}

+ (void)getContentLocationFromFile:(id)a3 completionHandler:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 numberOfItems] >= 2)
  {
    int v8 = getWFSecurityLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "+[WFContentLocation(FileProviders) getContentLocationFromFile:completionHandler:]";
      _os_log_impl(&dword_216505000, v8, OS_LOG_TYPE_FAULT, "%s getContentLocationFromFile is being called with multiple input items. The calling action should not allow for multiple input", buf, 0xCu);
    }
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __81__WFContentLocation_FileProviders__getContentLocationFromFile_completionHandler___block_invoke;
  v10[3] = &unk_2642887B0;
  id v11 = v7;
  id v12 = a1;
  id v9 = v7;
  [v6 getFileRepresentation:v10 forType:0];
}

void __81__WFContentLocation_FileProviders__getContentLocationFromFile_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    id v5 = [*(id *)(a1 + 40) contentLocationForFile:a2];
    (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v5, 0);
  }
  else
  {
    v3 = *(void (**)(uint64_t))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 32);
    v3(v4);
  }
}

+ (id)contentLocationForFile:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 representationType])
  {
    id v5 = [v4 fileURL];
    id v14 = 0;
    id v6 = [a1 appDescriptorForFileProviderHandlingURL:v5 error:&v14];
    id v7 = v14;
    if (v7)
    {
      int v8 = getWFSecurityLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        id v9 = [v5 absoluteString];
        *(_DWORD *)buf = 136315651;
        v16 = "+[WFContentLocation(FileProviders) contentLocationForFile:]";
        __int16 v17 = 2113;
        v18 = v9;
        __int16 v19 = 2114;
        id v20 = v7;
        _os_log_impl(&dword_216505000, v8, OS_LOG_TYPE_DEBUG, "%s Could not determine appDescriptor managing path %{private}@: %{public}@", buf, 0x20u);
      }
    }
    if ([v6 isInstalled])
    {
      uint64_t v10 = +[WFAppContentLocation locationWithAppDescriptor:v6];
    }
    else
    {
      id v12 = getWFWorkflowExecutionLogObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v16 = "+[WFContentLocation(FileProviders) contentLocationForFile:]";
        _os_log_impl(&dword_216505000, v12, OS_LOG_TYPE_DEBUG, "%s File provider application is not installed or could not be resolved; defaulting to platform file manager destination",
          buf,
          0xCu);
      }

      uint64_t v10 = +[WFAppContentLocation platformFileManagerLocation];
    }
    id v11 = (void *)v10;
  }
  else
  {
    id v5 = getWFFilesLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "+[WFContentLocation(FileProviders) contentLocationForFile:]";
      _os_log_impl(&dword_216505000, v5, OS_LOG_TYPE_FAULT, "%s Should not get content origin for in-memory data blob", buf, 0xCu);
    }
    id v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

- (unint64_t)promptingBehaviour
{
  return self->_promptingBehaviour;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(WFContentLocation *)self identifier];
  id v7 = [v3 stringWithFormat:@"<%@: %p, identifier: %@, promptingBehaviour: %tu>", v5, self, v6, -[WFContentLocation promptingBehaviour](self, "promptingBehaviour")];

  return (NSString *)v7;
}

- (id)wfSerializedRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [(WFContentLocation *)self identifier];
  [v3 setValue:v4 forKey:@"identifier"];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(WFContentLocation *)self identifier];
  [v5 encodeObject:v4 forKey:@"identifier"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[WFContentLocation promptingBehaviour](self, "promptingBehaviour"), @"promptingBehaviour");
}

- (WFContentLocation)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  if (v5)
  {
    self = -[WFContentLocation initWithIdentifier:promptingBehaviour:](self, "initWithIdentifier:promptingBehaviour:", v5, [v4 decodeIntegerForKey:@"promptingBehaviour"]);
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2 = [(WFContentLocation *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = [(WFContentLocation *)self identifier];
    id v6 = [v4 identifier];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSString)localizedTitle
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  localizedTitle = self->_localizedTitle;
  if (localizedTitle) {
    goto LABEL_4;
  }
  id v4 = [(WFContentLocation *)self identifier];
  id v5 = +[WFContentLocationLocalizations localizedTitleForContentLocationWithIdentifier:v4];

  if (v5)
  {
    id v6 = (NSString *)[v5 copy];
    char v7 = self->_localizedTitle;
    self->_localizedTitle = v6;

    localizedTitle = self->_localizedTitle;
LABEL_4:
    int v8 = localizedTitle;
    goto LABEL_5;
  }
  uint64_t v10 = getWFWorkflowExecutionLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    id v11 = [(WFContentLocation *)self identifier];
    int v12 = 136315394;
    v13 = "-[WFContentLocation localizedTitle]";
    __int16 v14 = 2114;
    uint64_t v15 = v11;
    _os_log_impl(&dword_216505000, v10, OS_LOG_TYPE_FAULT, "%s Missing localization for content destination with identifier %{public}@", (uint8_t *)&v12, 0x16u);
  }
  int v8 = 0;
LABEL_5:
  return v8;
}

- (id)localizedMDMDescription
{
  return 0;
}

- (unint64_t)managedLevel
{
  return 0;
}

- (WFContentLocation)initWithIdentifier:(id)a3 promptingBehaviour:(unint64_t)a4
{
  id v8 = a3;
  if (!v8)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"WFContentLocation.m", 36, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)WFContentLocation;
  id v9 = [(WFContentLocation *)&v14 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    v10->_promptingBehaviour = a4;
    id v11 = v10;
  }

  return v10;
}

- (WFContentLocation)initWithIdentifier:(id)a3
{
  return [(WFContentLocation *)self initWithIdentifier:a3 promptingBehaviour:1];
}

+ (id)allContentLocationClasses
{
  v6[6] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v6[2] = objc_opt_class();
  v6[3] = objc_opt_class();
  v6[4] = objc_opt_class();
  v6[5] = objc_opt_class();
  unint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:6];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

+ (id)objectWithWFSerializedRepresentation:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 wfObjectOfClass:objc_opt_class() forKeyPath:@"identifier"];
  id v6 = v5;
  if (v5)
  {
    if ([v5 isEqualToString:@"com.apple.shortcuts.appdestination"])
    {
      char v7 = WFAppContentLocation;
LABEL_13:
      id v9 = [(__objc2_class *)v7 objectWithWFSerializedRepresentation:v4];
      goto LABEL_14;
    }
    if ([v6 isEqualToString:@"com.apple.shortcuts.accountDestination"])
    {
      char v7 = WFAccountContentLocation;
      goto LABEL_13;
    }
    if ([v6 isEqualToString:@"com.apple.shortcuts.urldestination"])
    {
      char v7 = WFURLContentLocation;
      goto LABEL_13;
    }
    if ([v6 isEqualToString:@"com.apple.shortcuts.publicICloudDestination"])
    {
      char v7 = WFiCloudContentLocation;
      goto LABEL_13;
    }
    id v11 = +[WFContentLocationLocalizations localizedTitleForContentLocationWithIdentifier:v6];
    if (v11)
    {
      uint64_t v12 = [objc_alloc((Class)a1) initWithIdentifier:v6 promptingBehaviour:0];
    }
    else
    {
      v13 = getWFWorkflowExecutionLogObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v14 = 136315394;
        uint64_t v15 = "+[WFContentLocation objectWithWFSerializedRepresentation:]";
        __int16 v16 = 2114;
        __int16 v17 = v6;
        _os_log_impl(&dword_216505000, v13, OS_LOG_TYPE_ERROR, "%s Returning WFUnsupportedContentLocation with identifier %{public}@", (uint8_t *)&v14, 0x16u);
      }

      uint64_t v12 = +[WFUnsupportedContentLocation locationWithIdentifier:v6 serializedRepresentation:v4];
    }
    id v9 = (void *)v12;
  }
  else
  {
    id v8 = getWFWorkflowExecutionLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315138;
      uint64_t v15 = "+[WFContentLocation objectWithWFSerializedRepresentation:]";
      _os_log_impl(&dword_216505000, v8, OS_LOG_TYPE_ERROR, "%s Failed to decode identifier from WFContentLocation", (uint8_t *)&v14, 0xCu);
    }

    id v9 = 0;
  }
LABEL_14:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (WFContentLocation)publicICloud
{
  uint64_t v2 = [(WFContentLocation *)[WFiCloudContentLocation alloc] initWithIdentifier:@"com.apple.shortcuts.publicICloudDestination"];
  return (WFContentLocation *)v2;
}

+ (WFContentLocation)windowsLocation
{
  uint64_t v2 = [[WFContentLocation alloc] initWithIdentifier:@"com.apple.shortcuts.windowsDestination"];
  return v2;
}

+ (WFContentLocation)webpagesLocation
{
  uint64_t v2 = [[WFContentLocation alloc] initWithIdentifier:@"com.apple.shortcuts.webpagesDestination"];
  return v2;
}

+ (WFContentLocation)wallpaperLocation
{
  uint64_t v2 = [[WFContentLocation alloc] initWithIdentifier:@"com.apple.shortcuts.wallpaperDestination" promptingBehaviour:2];
  return v2;
}

+ (WFContentLocation)toggleLineLocation
{
  uint64_t v2 = [[WFContentLocation alloc] initWithIdentifier:@"com.apple.shortcuts.toggleCellularLineDestination" promptingBehaviour:2];
  return v2;
}

+ (WFContentLocation)speechRecognitionLocation
{
  uint64_t v2 = [[WFContentLocation alloc] initWithIdentifier:@"com.apple.shortcuts.speechRecognitionDestination" promptingBehaviour:2];
  return v2;
}

+ (WFContentLocation)screenshotLocation
{
  uint64_t v2 = [[WFContentLocation alloc] initWithIdentifier:@"com.apple.shortcuts.screenshotDestination"];
  return v2;
}

+ (WFContentLocation)shortcutsAppLocation
{
  return (WFContentLocation *)+[WFAppContentLocation locationWithSystemAppBundleIdentifier:*MEMORY[0x263F85610]];
}

+ (WFContentLocation)shellLocation
{
  uint64_t v2 = [[WFContentLocation alloc] initWithIdentifier:@"com.apple.shortcuts.shellDestination"];
  return v2;
}

+ (WFContentLocation)shareExtensionLocation
{
  uint64_t v2 = [[WFContentLocation alloc] initWithIdentifier:@"com.apple.shortcuts.shareExtensionDestination" promptingBehaviour:0];
  return v2;
}

+ (WFContentLocation)printLocation
{
  uint64_t v2 = [[WFContentLocation alloc] initWithIdentifier:@"com.apple.shortcuts.printDestination"];
  return v2;
}

+ (WFContentLocation)personalHotspotPasswordLocation
{
  uint64_t v2 = [[WFContentLocation alloc] initWithIdentifier:@"com.apple.shortcuts.personalHotspotPasswordDestination" promptingBehaviour:2];
  return v2;
}

+ (WFContentLocation)locationLocation
{
  uint64_t v2 = [[WFContentLocation alloc] initWithIdentifier:@"com.apple.shortcuts.locationDestination"];
  return v2;
}

+ (WFContentLocation)onScreenContentLocation
{
  uint64_t v2 = [[WFContentLocation alloc] initWithIdentifier:@"com.apple.shortcuts.onScreenContentDestination" promptingBehaviour:2];
  return v2;
}

+ (WFContentLocation)notificationLocation
{
  uint64_t v2 = [[WFContentLocation alloc] initWithIdentifier:@"com.apple.shortcuts.notificationDestination" promptingBehaviour:2];
  return v2;
}

+ (WFContentLocation)networkLocation
{
  uint64_t v2 = [[WFContentLocation alloc] initWithIdentifier:@"com.apple.shortcuts.networkDestination"];
  return v2;
}

+ (WFContentLocation)microphoneLocation
{
  uint64_t v2 = [[WFContentLocation alloc] initWithIdentifier:@"com.apple.shortcuts.microphoneDestination" promptingBehaviour:2];
  return v2;
}

+ (WFContentLocation)javaScriptForAutomationLocation
{
  uint64_t v2 = [[WFContentLocation alloc] initWithIdentifier:@"com.apple.shortcuts.javaScriptForAutomationDestination"];
  return v2;
}

+ (WFContentLocation)javaScript
{
  uint64_t v2 = [[WFContentLocation alloc] initWithIdentifier:@"com.apple.shortcuts.javaScript" promptingBehaviour:1];
  return v2;
}

+ (WFContentLocation)genericLocation
{
  uint64_t v2 = [[WFContentLocation alloc] initWithIdentifier:@"com.apple.shortcuts.genericDestination"];
  return v2;
}

+ (WFContentLocation)focusLocation
{
  uint64_t v2 = [[WFContentLocation alloc] initWithIdentifier:@"com.apple.shortcuts.focusDestination" promptingBehaviour:2];
  return v2;
}

+ (WFContentLocation)defaultLineLocation
{
  uint64_t v2 = [[WFContentLocation alloc] initWithIdentifier:@"com.apple.shortcuts.defaultLineDestination" promptingBehaviour:2];
  return v2;
}

+ (WFContentLocation)dataRoamingLocation
{
  uint64_t v2 = [[WFContentLocation alloc] initWithIdentifier:@"com.apple.shortcuts.dataRoamingDestination" promptingBehaviour:2];
  return v2;
}

+ (WFContentLocation)controlOtherAppsLocation
{
  uint64_t v2 = [[WFContentLocation alloc] initWithIdentifier:@"com.apple.shortcuts.controlOtherApps"];
  return v2;
}

+ (WFContentLocation)clipboardLocation
{
  uint64_t v2 = [[WFContentLocation alloc] initWithIdentifier:@"com.apple.shortcuts.clipboardDestination"];
  return v2;
}

+ (WFContentLocation)cellularDataStatisticsLocation
{
  uint64_t v2 = [[WFContentLocation alloc] initWithIdentifier:@"com.apple.shortcuts.cellularDataStatisticsDestination" promptingBehaviour:2];
  return v2;
}

+ (WFContentLocation)appleScriptLocation
{
  uint64_t v2 = [[WFContentLocation alloc] initWithIdentifier:@"com.apple.shortcuts.appleScriptDestination"];
  return v2;
}

+ (WFContentLocation)airdropLocation
{
  uint64_t v2 = [[WFContentLocation alloc] initWithIdentifier:@"com.apple.shortcuts.airdropDestination" promptingBehaviour:0];
  return v2;
}

+ (WFContentLocation)locationWithNotesAccountIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x263F0F988]);
  id v5 = (void *)[v4 initWithBundleIdentifier:*MEMORY[0x263F85550]];
  id v6 = [MEMORY[0x263F0F9B0] sharedResolver];
  char v7 = [v6 resolvedAppMatchingDescriptor:v5];

  if (v3 && ![v3 isEqualToString:@"LocalAccount"])
  {
    uint64_t v8 = +[WFAccountContentLocation locationWithAccountIdentifier:v3 appDescriptor:v7];
  }
  else
  {
    uint64_t v8 = +[WFAppContentLocation locationWithAppDescriptor:v7 managedLevel:0];
  }
  id v9 = (void *)v8;

  return (WFContentLocation *)v9;
}

+ (WFContentLocation)locationWithCalendarSource:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x263F0F988]);
  id v5 = (void *)[v4 initWithBundleIdentifier:*MEMORY[0x263F854D0]];
  id v6 = [MEMORY[0x263F0F9B0] sharedResolver];
  char v7 = [v6 resolvedAppMatchingDescriptor:v5];

  uint64_t v8 = [v3 sourceType];
  if (v8 != 5 && v8)
  {
    uint64_t v10 = [v3 sourceIdentifier];
    id v9 = +[WFAccountContentLocation locationWithAccountIdentifier:v10 appDescriptor:v7];
  }
  else
  {
    id v9 = +[WFAppContentLocation locationWithAppDescriptor:v7 managedLevel:0];
  }

  return (WFContentLocation *)v9;
}

@end