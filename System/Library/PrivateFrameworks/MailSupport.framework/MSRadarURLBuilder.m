@interface MSRadarURLBuilder
+ (BOOL)canOpenRadar;
+ (id)_URLFromQueryItems:(id)a3 builder:(id)a4;
+ (id)_blackPearlComponentInfo;
+ (id)_componentInfoDictionaryFromComponent:(int64_t)a3;
+ (id)componentIDFromRadarComponent:(int64_t)a3;
+ (id)componentNameFromRadarComponent:(int64_t)a3;
+ (id)radarURLWithBuilder:(id)a3;
+ (id)stringFromRadarClassification:(int64_t)a3;
+ (id)stringFromRadarReproducibility:(int64_t)a3;
- (BOOL)appendStandardDisclaimerToDescription;
- (BOOL)appendSysdiagnoseHowTo;
- (BOOL)customFooter;
- (BOOL)prependSystemVersionToTitle;
- (MSRadarURLBuilder)init;
- (NSArray)extensionIdentifiers;
- (NSString)attachmentPath;
- (NSString)radarDescription;
- (NSString)title;
- (id)autoDiagnosticsString;
- (int64_t)autoDiagnostics;
- (int64_t)classification;
- (int64_t)component;
- (int64_t)reproducibility;
- (void)setAppendStandardDisclaimerToDescription:(BOOL)a3;
- (void)setAppendSysdiagnoseHowTo:(BOOL)a3;
- (void)setAttachmentPath:(id)a3;
- (void)setAutoDiagnostics:(int64_t)a3;
- (void)setClassification:(int64_t)a3;
- (void)setComponent:(int64_t)a3;
- (void)setCustomFooter:(BOOL)a3;
- (void)setExtensionIdentifiers:(id)a3;
- (void)setPrependSystemVersionToTitle:(BOOL)a3;
- (void)setRadarDescription:(id)a3;
- (void)setReproducibility:(int64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation MSRadarURLBuilder

- (MSRadarURLBuilder)init
{
  v6.receiver = self;
  v6.super_class = (Class)MSRadarURLBuilder;
  v2 = [(MSRadarURLBuilder *)&v6 init];
  v3 = v2;
  if (v2)
  {
    extensionIdentifiers = v2->_extensionIdentifiers;
    v2->_extensionIdentifiers = (NSArray *)&unk_1F1AA90E0;

    v3->_appendSysdiagnoseHowTo = 0;
    *(_WORD *)&v3->_prependSystemVersionToTitle = 257;
  }
  return v3;
}

+ (BOOL)canOpenRadar
{
  v2 = objc_opt_new();
  [v2 setScheme:@"tap-to-radar"];
  [v2 setHost:@"new"];
  v3 = [v2 URL];
  v4 = [(objc_class *)getUIApplicationClass_0() sharedApplication];
  char v5 = [v4 canOpenURL:v3];

  return v5;
}

+ (id)stringFromRadarClassification:(int64_t)a3
{
  if ((unint64_t)a3 > 9) {
    return &stru_1F1AA2F90;
  }
  else {
    return off_1E63FEEE0[a3];
  }
}

+ (id)stringFromRadarReproducibility:(int64_t)a3
{
  if ((unint64_t)a3 > 5) {
    return &stru_1F1AA2F90;
  }
  else {
    return off_1E63FEF30[a3];
  }
}

+ (id)_componentInfoDictionaryFromComponent:(int64_t)a3
{
  v8[3] = *MEMORY[0x1E4F143B8];
  if (a3 == 27)
  {
    v7[0] = @"sRadarComponentIDKey";
    v7[1] = @"sRadarComponentNameKey";
    v8[0] = @"462765";
    v8[1] = @"Mail MIME";
    v7[2] = @"sRadarComponentVersionKey";
    v8[2] = @"iOS";
    v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];
  }
  else if (a3 == 28)
  {
    v3 = [a1 _blackPearlComponentInfo];
  }
  else
  {
    v5[0] = @"sRadarComponentNameKey";
    v5[1] = @"sRadarComponentIDKey";
    v6[0] = @"Mail (New Bugs)";
    v6[1] = @"224209";
    v5[2] = @"sRadarComponentVersionKey";
    v6[2] = @"iOS";
    v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:3];
  }
  return v3;
}

+ (id)_blackPearlComponentInfo
{
  void v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"sRadarComponentNameKey";
  v4[1] = @"sRadarComponentIDKey";
  v5[0] = @"Black Pearl";
  v5[1] = @"1596667";
  v4[2] = @"sRadarComponentVersionKey";
  v5[2] = @"Feedback";
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
  return v2;
}

+ (id)componentNameFromRadarComponent:(int64_t)a3
{
  v3 = [a1 _componentInfoDictionaryFromComponent:a3];
  v4 = [v3 objectForKeyedSubscript:@"sRadarComponentNameKey"];

  return v4;
}

+ (id)componentIDFromRadarComponent:(int64_t)a3
{
  v3 = [a1 _componentInfoDictionaryFromComponent:a3];
  v4 = [v3 objectForKeyedSubscript:@"sRadarComponentIDKey"];

  return v4;
}

- (id)autoDiagnosticsString
{
  int64_t v2 = [(MSRadarURLBuilder *)self autoDiagnostics];
  if ((unint64_t)(v2 - 1) > 5) {
    return 0;
  }
  else {
    return off_1E63FEF60[v2 - 1];
  }
}

+ (id)radarURLWithBuilder:(id)a3
{
  v46[7] = *MEMORY[0x1E4F143B8];
  v45 = (void (**)(id, void *))a3;
  if (!v45)
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, a1, @"MSRadarURLBuilder.m", 239, @"Invalid parameter not satisfying: %@", @"builderBlock" object file lineNumber description];
  }
  char v5 = objc_opt_new();
  v45[2](v45, v5);
  if ([v5 appendStandardDisclaimerToDescription])
  {
    objc_super v6 = [v5 radarDescription];
    if ([v5 appendSysdiagnoseHowTo])
    {
      uint64_t v7 = [v6 stringByAppendingString:@"\n\n*** REQUIRED DIAGNOSTICS\nPlease attach Mail-targeted sysdiagnose (run \"sudo sysdiagnose Mail\" in Terminal).\n"];

      objc_super v6 = (void *)v7;
    }
    if (([v5 customFooter] & 1) == 0)
    {
      uint64_t v8 = [v6 stringByAppendingString:@"\n\n*** Note: If you have allowed Mail to collect privacy sensitive logs in Tap-to-Radar, Mail will attach the content of the email currently displayed to this radar. This is the EML file inside the \"Mail Logs\" folder, you can remove this attachment using the Tap-To-Radar app. ***"];

      objc_super v6 = (void *)v8;
    }
    [v5 setRadarDescription:v6];
  }
  v44 = objc_msgSend(a1, "stringFromRadarClassification:", objc_msgSend(v5, "classification"));
  v42 = objc_msgSend(a1, "stringFromRadarReproducibility:", objc_msgSend(v5, "reproducibility"));
  v34 = objc_msgSend(a1, "_componentInfoDictionaryFromComponent:", objc_msgSend(v5, "component"));
  v40 = [v34 objectForKeyedSubscript:@"sRadarComponentNameKey"];
  v43 = [v34 objectForKeyedSubscript:@"sRadarComponentIDKey"];
  id v35 = a1;
  v41 = [v34 objectForKeyedSubscript:@"sRadarComponentVersionKey"];
  v9 = (void *)MEMORY[0x1E4F1CA48];
  v10 = (void *)MEMORY[0x1E4F290C8];
  v39 = [v5 title];
  v37 = objc_msgSend(v10, "queryItemWithName:value:", @"Title");
  v46[0] = v37;
  v11 = (void *)MEMORY[0x1E4F290C8];
  v36 = [v5 radarDescription];
  v38 = objc_msgSend(v11, "queryItemWithName:value:", @"Description");
  v46[1] = v38;
  v12 = [MEMORY[0x1E4F290C8] queryItemWithName:@"ComponentID" value:v43];
  v46[2] = v12;
  v13 = [MEMORY[0x1E4F290C8] queryItemWithName:@"Classification" value:v44];
  v46[3] = v13;
  v14 = [MEMORY[0x1E4F290C8] queryItemWithName:@"Reproducibility" value:v42];
  v46[4] = v14;
  v15 = [MEMORY[0x1E4F290C8] queryItemWithName:@"ComponentName" value:v40];
  v46[5] = v15;
  v16 = [MEMORY[0x1E4F290C8] queryItemWithName:@"ComponentVersion" value:v41];
  v46[6] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:7];
  v18 = [v9 arrayWithArray:v17];

  v19 = [v5 attachmentPath];

  if (v19)
  {
    v20 = (void *)MEMORY[0x1E4F290C8];
    v21 = [v5 attachmentPath];
    v22 = [v20 queryItemWithName:@"attachments" value:v21];
    [v18 addObject:v22];
  }
  v23 = [v5 extensionIdentifiers];
  v24 = [v23 componentsJoinedByString:@","];

  if (v24)
  {
    v25 = [MEMORY[0x1E4F290C8] queryItemWithName:@"ExtensionIdentifiers" value:v24];
    [v18 addObject:v25];
  }
  v26 = [v5 autoDiagnosticsString];
  if (v26)
  {
    v27 = [MEMORY[0x1E4F290C8] queryItemWithName:@"AutoDiagnostics" value:v26];
    [v18 addObject:v27];
  }
  v28 = (void *)MEMORY[0x1E4F290C8];
  if ([v5 prependSystemVersionToTitle]) {
    v29 = @"1";
  }
  else {
    v29 = @"0";
  }
  v30 = [v28 queryItemWithName:@"IncludeDevicePrefixInTitle" value:v29];
  [v18 addObject:v30];

  v31 = [v35 _URLFromQueryItems:v18 builder:v5];

  return v31;
}

+ (id)_URLFromQueryItems:(id)a3 builder:(id)a4
{
  id v4 = a3;
  char v5 = objc_opt_new();
  [v5 setQueryItems:v4];
  [v5 setScheme:@"tap-to-radar"];
  [v5 setHost:@"new"];
  objc_super v6 = [v5 URL];

  return v6;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (BOOL)prependSystemVersionToTitle
{
  return self->_prependSystemVersionToTitle;
}

- (void)setPrependSystemVersionToTitle:(BOOL)a3
{
  self->_prependSystemVersionToTitle = a3;
}

- (NSString)radarDescription
{
  return self->_radarDescription;
}

- (void)setRadarDescription:(id)a3
{
}

- (BOOL)appendStandardDisclaimerToDescription
{
  return self->_appendStandardDisclaimerToDescription;
}

- (void)setAppendStandardDisclaimerToDescription:(BOOL)a3
{
  self->_appendStandardDisclaimerToDescription = a3;
}

- (BOOL)appendSysdiagnoseHowTo
{
  return self->_appendSysdiagnoseHowTo;
}

- (void)setAppendSysdiagnoseHowTo:(BOOL)a3
{
  self->_appendSysdiagnoseHowTo = a3;
}

- (BOOL)customFooter
{
  return self->_customFooter;
}

- (void)setCustomFooter:(BOOL)a3
{
  self->_customFooter = a3;
}

- (int64_t)component
{
  return self->_component;
}

- (void)setComponent:(int64_t)a3
{
  self->_component = a3;
}

- (int64_t)reproducibility
{
  return self->_reproducibility;
}

- (void)setReproducibility:(int64_t)a3
{
  self->_reproducibility = a3;
}

- (int64_t)classification
{
  return self->_classification;
}

- (void)setClassification:(int64_t)a3
{
  self->_classification = a3;
}

- (NSString)attachmentPath
{
  return self->_attachmentPath;
}

- (void)setAttachmentPath:(id)a3
{
}

- (NSArray)extensionIdentifiers
{
  return self->_extensionIdentifiers;
}

- (void)setExtensionIdentifiers:(id)a3
{
}

- (int64_t)autoDiagnostics
{
  return self->_autoDiagnostics;
}

- (void)setAutoDiagnostics:(int64_t)a3
{
  self->_autoDiagnostics = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionIdentifiers, 0);
  objc_storeStrong((id *)&self->_attachmentPath, 0);
  objc_storeStrong((id *)&self->_radarDescription, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end