@interface BLSHTapToRadarDescriptor
- (BLSHTapToRadarDescriptor)initWithDesignation:(unint64_t)a3 radarTitle:(id)a4 radarDescription:(id)a5;
- (NSDate)timeOfIssue;
- (NSString)attachments;
- (NSString)bundleID;
- (NSString)classification;
- (NSString)componentName;
- (NSString)componentVersion;
- (NSString)keywordIDs;
- (NSString)radarDescription;
- (NSString)radarTitle;
- (NSString)reproducibility;
- (NSString)ttrDisplayReason;
- (NSString)ttrPromptHeader;
- (NSString)ttrPromptMessage;
- (id)toURL;
- (int64_t)componentID;
- (unint64_t)designation;
- (void)setAttachments:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setClassification:(id)a3;
- (void)setComponentID:(int64_t)a3;
- (void)setComponentName:(id)a3;
- (void)setComponentVersion:(id)a3;
- (void)setKeywordIDs:(id)a3;
- (void)setReproducibility:(id)a3;
- (void)setTimeOfIssue:(id)a3;
- (void)setTtrDisplayReason:(id)a3;
- (void)setTtrPromptHeader:(id)a3;
- (void)setTtrPromptMessage:(id)a3;
@end

@implementation BLSHTapToRadarDescriptor

- (BLSHTapToRadarDescriptor)initWithDesignation:(unint64_t)a3 radarTitle:(id)a4 radarDescription:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v22.receiver = self;
  v22.super_class = (Class)BLSHTapToRadarDescriptor;
  v10 = [(BLSHTapToRadarDescriptor *)&v22 init];
  v11 = v10;
  if (v10)
  {
    v10->_designation = a3;
    if ((unint64_t)[v8 length] >= 0xF1)
    {
      uint64_t v12 = [v8 substringToIndex:239];

      id v8 = (id)v12;
    }
    objc_storeStrong((id *)&v11->_radarTitle, v8);
    objc_storeStrong((id *)&v11->_radarDescription, a5);
    v13 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v14 = [v13 bundleIdentifier];
    bundleID = v11->_bundleID;
    v11->_bundleID = (NSString *)v14;

    classification = v11->_classification;
    v11->_classification = (NSString *)@"Serious Bug";

    reproducibility = v11->_reproducibility;
    v11->_reproducibility = (NSString *)@"Sometimes";

    componentName = v11->_componentName;
    v11->_componentName = (NSString *)@"BacklightServices";

    componentVersion = v11->_componentVersion;
    v11->_componentVersion = (NSString *)@"All";

    v11->_componentID = 1331578;
    ttrPromptHeader = v11->_ttrPromptHeader;
    v11->_ttrPromptHeader = (NSString *)@"Internal Only";
  }
  return v11;
}

- (id)toURL
{
  v3 = [MEMORY[0x263F08BA0] componentsWithString:@"tap-to-radar://new"];
  v4 = [MEMORY[0x263EFF980] array];
  v5 = [MEMORY[0x263F08BD0] queryItemWithName:@"Title" value:self->_radarTitle];
  [v4 addObject:v5];

  v6 = [MEMORY[0x263F08BD0] queryItemWithName:@"Description" value:self->_radarDescription];
  [v4 addObject:v6];

  v7 = [MEMORY[0x263F08BD0] queryItemWithName:@"BundleID" value:self->_bundleID];
  [v4 addObject:v7];

  id v8 = [MEMORY[0x263F08BD0] queryItemWithName:@"Classification" value:self->_classification];
  [v4 addObject:v8];

  id v9 = [MEMORY[0x263F08BD0] queryItemWithName:@"Reproducibility" value:self->_reproducibility];
  [v4 addObject:v9];

  v10 = [MEMORY[0x263F08BD0] queryItemWithName:@"ComponentName" value:self->_componentName];
  [v4 addObject:v10];

  v11 = [MEMORY[0x263F08BD0] queryItemWithName:@"ComponentVersion" value:self->_componentVersion];
  [v4 addObject:v11];

  uint64_t v12 = (void *)MEMORY[0x263F08BD0];
  v13 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", self->_componentID);
  uint64_t v14 = [v12 queryItemWithName:@"ComponentID" value:v13];
  [v4 addObject:v14];

  if (self->_keywordIDs)
  {
    v15 = objc_msgSend(MEMORY[0x263F08BD0], "queryItemWithName:value:", @"KeywordIDs");
    [v4 addObject:v15];
  }
  if (self->_attachments)
  {
    v16 = objc_msgSend(MEMORY[0x263F08BD0], "queryItemWithName:value:", @"Attachments");
    [v4 addObject:v16];
  }
  [v3 setQueryItems:v4];
  v17 = [v3 URL];

  return v17;
}

- (void)setTtrDisplayReason:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 length] >= 0x4B)
  {
    v5 = bls_backlight_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[BLSHTapToRadarDescriptor setTtrDisplayReason:]((uint64_t)v4, v5);
    }

    id v4 = 0;
  }
  ttrDisplayReason = self->_ttrDisplayReason;
  self->_ttrDisplayReason = (NSString *)v4;
}

- (unint64_t)designation
{
  return self->_designation;
}

- (NSString)radarTitle
{
  return self->_radarTitle;
}

- (NSString)radarDescription
{
  return self->_radarDescription;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)classification
{
  return self->_classification;
}

- (void)setClassification:(id)a3
{
}

- (NSString)reproducibility
{
  return self->_reproducibility;
}

- (void)setReproducibility:(id)a3
{
}

- (NSString)keywordIDs
{
  return self->_keywordIDs;
}

- (void)setKeywordIDs:(id)a3
{
}

- (NSString)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
}

- (int64_t)componentID
{
  return self->_componentID;
}

- (void)setComponentID:(int64_t)a3
{
  self->_componentID = a3;
}

- (NSString)componentName
{
  return self->_componentName;
}

- (void)setComponentName:(id)a3
{
}

- (NSString)componentVersion
{
  return self->_componentVersion;
}

- (void)setComponentVersion:(id)a3
{
}

- (NSString)ttrPromptHeader
{
  return self->_ttrPromptHeader;
}

- (void)setTtrPromptHeader:(id)a3
{
}

- (NSString)ttrPromptMessage
{
  return self->_ttrPromptMessage;
}

- (void)setTtrPromptMessage:(id)a3
{
}

- (NSString)ttrDisplayReason
{
  return self->_ttrDisplayReason;
}

- (NSDate)timeOfIssue
{
  return self->_timeOfIssue;
}

- (void)setTimeOfIssue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeOfIssue, 0);
  objc_storeStrong((id *)&self->_ttrDisplayReason, 0);
  objc_storeStrong((id *)&self->_ttrPromptMessage, 0);
  objc_storeStrong((id *)&self->_ttrPromptHeader, 0);
  objc_storeStrong((id *)&self->_componentVersion, 0);
  objc_storeStrong((id *)&self->_componentName, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_keywordIDs, 0);
  objc_storeStrong((id *)&self->_reproducibility, 0);
  objc_storeStrong((id *)&self->_classification, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_radarDescription, 0);

  objc_storeStrong((id *)&self->_radarTitle, 0);
}

- (void)setTtrDisplayReason:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21FCFC000, a2, OS_LOG_TYPE_ERROR, "ttrDisplayReason must be < 75 characters: \"%{public}@\"", (uint8_t *)&v2, 0xCu);
}

@end