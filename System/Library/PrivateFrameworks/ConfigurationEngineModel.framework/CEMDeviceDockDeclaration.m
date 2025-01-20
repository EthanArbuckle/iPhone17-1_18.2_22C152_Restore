@interface CEMDeviceDockDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 withOrientation:(id)a4 withPositionImmutable:(id)a5 withAutohide:(id)a6 withAutohideImmutable:(id)a7 withMinimizeToApplication:(id)a8 withMinimizeToApplicationImmutable:(id)a9 withMagnification:(id)a10 withMagnifyImmutable:(id)a11 withLargesize:(id)a12 withMagsizeImmutable:(id)a13 withShowProcessIndicators:(id)a14 withLaunchanim:(id)a15 withLaunchanimImmutable:(id)a16 withMineffect:(id)a17 withMineffectImmutable:(id)a18 withTilesize:(id)a19 withSizeImmutable:(id)a20 withMCXDockSpecialFolders:(id)a21 withAllowDockFixupOverride:(id)a22 withStaticOnly:(id)a23 withStaticOthers:(id)a24 withStaticApps:(id)a25 withContentsImmutable:(id)a26 withWindowtabbingImmutable:(id)a27 withDblclickbehaviorImmutable:(id)a28 withShowindicatorsImmutable:(id)a29 withShowRecents:(id)a30;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSArray)payloadMCXDockSpecialFolders;
- (NSArray)payloadStaticApps;
- (NSArray)payloadStaticOthers;
- (NSNumber)payloadAllowDockFixupOverride;
- (NSNumber)payloadAutohide;
- (NSNumber)payloadAutohideImmutable;
- (NSNumber)payloadContentsImmutable;
- (NSNumber)payloadDblclickbehaviorImmutable;
- (NSNumber)payloadLargesize;
- (NSNumber)payloadLaunchanim;
- (NSNumber)payloadLaunchanimImmutable;
- (NSNumber)payloadMagnification;
- (NSNumber)payloadMagnifyImmutable;
- (NSNumber)payloadMagsizeImmutable;
- (NSNumber)payloadMineffectImmutable;
- (NSNumber)payloadMinimizeToApplication;
- (NSNumber)payloadMinimizeToApplicationImmutable;
- (NSNumber)payloadPositionImmutable;
- (NSNumber)payloadShowProcessIndicators;
- (NSNumber)payloadShowRecents;
- (NSNumber)payloadShowindicatorsImmutable;
- (NSNumber)payloadSizeImmutable;
- (NSNumber)payloadStaticOnly;
- (NSNumber)payloadTilesize;
- (NSNumber)payloadWindowtabbingImmutable;
- (NSString)payloadMineffect;
- (NSString)payloadOrientation;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadAllowDockFixupOverride:(id)a3;
- (void)setPayloadAutohide:(id)a3;
- (void)setPayloadAutohideImmutable:(id)a3;
- (void)setPayloadContentsImmutable:(id)a3;
- (void)setPayloadDblclickbehaviorImmutable:(id)a3;
- (void)setPayloadLargesize:(id)a3;
- (void)setPayloadLaunchanim:(id)a3;
- (void)setPayloadLaunchanimImmutable:(id)a3;
- (void)setPayloadMCXDockSpecialFolders:(id)a3;
- (void)setPayloadMagnification:(id)a3;
- (void)setPayloadMagnifyImmutable:(id)a3;
- (void)setPayloadMagsizeImmutable:(id)a3;
- (void)setPayloadMineffect:(id)a3;
- (void)setPayloadMineffectImmutable:(id)a3;
- (void)setPayloadMinimizeToApplication:(id)a3;
- (void)setPayloadMinimizeToApplicationImmutable:(id)a3;
- (void)setPayloadOrientation:(id)a3;
- (void)setPayloadPositionImmutable:(id)a3;
- (void)setPayloadShowProcessIndicators:(id)a3;
- (void)setPayloadShowRecents:(id)a3;
- (void)setPayloadShowindicatorsImmutable:(id)a3;
- (void)setPayloadSizeImmutable:(id)a3;
- (void)setPayloadStaticApps:(id)a3;
- (void)setPayloadStaticOnly:(id)a3;
- (void)setPayloadStaticOthers:(id)a3;
- (void)setPayloadTilesize:(id)a3;
- (void)setPayloadWindowtabbingImmutable:(id)a3;
@end

@implementation CEMDeviceDockDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.device.dock";
}

+ (id)profileType
{
  return @"com.apple.dock";
}

+ (NSSet)allowedPayloadKeys
{
  v6[27] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"orientation";
  v6[1] = @"position-immutable";
  v6[2] = @"autohide";
  v6[3] = @"autohide-immutable";
  v6[4] = @"minimize-to-application";
  v6[5] = @"minimize-to-application-immutable";
  v6[6] = @"magnification";
  v6[7] = @"magnify-immutable";
  v6[8] = @"largesize";
  v6[9] = @"magsize-immutable";
  v6[10] = @"show-process-indicators";
  v6[11] = @"launchanim";
  v6[12] = @"launchanim-immutable";
  v6[13] = @"mineffect";
  v6[14] = @"mineffect-immutable";
  v6[15] = @"tilesize";
  v6[16] = @"size-immutable";
  v6[17] = @"MCXDockSpecialFolders";
  v6[18] = @"AllowDockFixupOverride";
  v6[19] = @"static-only";
  v6[20] = @"static-others";
  v6[21] = @"static-apps";
  v6[22] = @"contents-immutable";
  v6[23] = @"windowtabbing-immutable";
  v6[24] = @"dblclickbehavior-immutable";
  v6[25] = @"showindicators-immutable";
  v6[26] = @"show-recents";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:27];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  return (id)[MEMORY[0x263EFFA08] setWithArray:MEMORY[0x263EFFA68]];
}

- (BOOL)multipleAllowed
{
  return 0;
}

- (BOOL)mustBeSupervised
{
  return 0;
}

- (int)activationLevel
{
  return 2;
}

- (id)assetReferences
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)buildWithIdentifier:(id)a3 withOrientation:(id)a4 withPositionImmutable:(id)a5 withAutohide:(id)a6 withAutohideImmutable:(id)a7 withMinimizeToApplication:(id)a8 withMinimizeToApplicationImmutable:(id)a9 withMagnification:(id)a10 withMagnifyImmutable:(id)a11 withLargesize:(id)a12 withMagsizeImmutable:(id)a13 withShowProcessIndicators:(id)a14 withLaunchanim:(id)a15 withLaunchanimImmutable:(id)a16 withMineffect:(id)a17 withMineffectImmutable:(id)a18 withTilesize:(id)a19 withSizeImmutable:(id)a20 withMCXDockSpecialFolders:(id)a21 withAllowDockFixupOverride:(id)a22 withStaticOnly:(id)a23 withStaticOthers:(id)a24 withStaticApps:(id)a25 withContentsImmutable:(id)a26 withWindowtabbingImmutable:(id)a27 withDblclickbehaviorImmutable:(id)a28 withShowindicatorsImmutable:(id)a29 withShowRecents:(id)a30
{
  id v30 = a3;
  id v87 = a30;
  id v86 = a29;
  id v85 = a28;
  id v31 = a27;
  id v84 = a26;
  id v83 = a25;
  id v82 = a24;
  id v81 = a23;
  id v80 = a22;
  id v79 = a21;
  id v78 = a20;
  id v77 = a19;
  id v76 = a18;
  id v75 = a17;
  id v74 = a16;
  id v73 = a15;
  id v72 = a14;
  id v71 = a13;
  id v70 = a12;
  id v66 = a11;
  id v63 = a10;
  id v32 = a9;
  id v33 = a8;
  id v34 = a7;
  id v35 = a6;
  id v36 = a5;
  id v37 = a4;
  v38 = objc_opt_new();
  [v38 setDeclarationType:@"com.apple.configuration.device.dock"];
  if (v30)
  {
    [v38 setDeclarationIdentifier:v30];
  }
  else
  {
    v39 = [MEMORY[0x263F08C38] UUID];
    v40 = [v39 UUIDString];
    [v38 setDeclarationIdentifier:v40];

    id v30 = 0;
  }
  objc_msgSend(v38, "setPayloadOrientation:", v37, a9);

  v41 = (void *)MEMORY[0x263EFFA80];
  if (v36) {
    id v42 = v36;
  }
  else {
    id v42 = (id)MEMORY[0x263EFFA80];
  }
  [v38 setPayloadPositionImmutable:v42];

  if (v35) {
    id v43 = v35;
  }
  else {
    id v43 = v41;
  }
  [v38 setPayloadAutohide:v43];

  if (v34) {
    id v44 = v34;
  }
  else {
    id v44 = v41;
  }
  [v38 setPayloadAutohideImmutable:v44];

  if (v33) {
    id v45 = v33;
  }
  else {
    id v45 = v41;
  }
  [v38 setPayloadMinimizeToApplication:v45];

  if (v32) {
    id v46 = v32;
  }
  else {
    id v46 = v41;
  }
  [v38 setPayloadMinimizeToApplicationImmutable:v46];

  if (v63) {
    id v47 = v63;
  }
  else {
    id v47 = v41;
  }
  [v38 setPayloadMagnification:v47];

  if (v66) {
    id v48 = v66;
  }
  else {
    id v48 = v41;
  }
  [v38 setPayloadMagnifyImmutable:v48];

  [v38 setPayloadLargesize:v70];
  if (v71) {
    id v49 = v71;
  }
  else {
    id v49 = v41;
  }
  [v38 setPayloadMagsizeImmutable:v49];

  if (v72) {
    id v50 = v72;
  }
  else {
    id v50 = v41;
  }
  [v38 setPayloadShowProcessIndicators:v50];

  if (v73) {
    id v51 = v73;
  }
  else {
    id v51 = v41;
  }
  [v38 setPayloadLaunchanim:v51];

  if (v74) {
    id v52 = v74;
  }
  else {
    id v52 = v41;
  }
  [v38 setPayloadLaunchanimImmutable:v52];

  [v38 setPayloadMineffect:v75];
  if (v76) {
    id v53 = v76;
  }
  else {
    id v53 = v41;
  }
  [v38 setPayloadMineffectImmutable:v53];

  [v38 setPayloadTilesize:v77];
  if (v78) {
    id v54 = v78;
  }
  else {
    id v54 = v41;
  }
  [v38 setPayloadSizeImmutable:v54];

  [v38 setPayloadMCXDockSpecialFolders:v79];
  if (v80) {
    id v55 = v80;
  }
  else {
    id v55 = v41;
  }
  [v38 setPayloadAllowDockFixupOverride:v55];

  if (v81) {
    id v56 = v81;
  }
  else {
    id v56 = v41;
  }
  [v38 setPayloadStaticOnly:v56];

  [v38 setPayloadStaticOthers:v82];
  [v38 setPayloadStaticApps:v83];

  if (v84) {
    id v57 = v84;
  }
  else {
    id v57 = v41;
  }
  [v38 setPayloadContentsImmutable:v57];

  if (v31) {
    id v58 = v31;
  }
  else {
    id v58 = v41;
  }
  [v38 setPayloadWindowtabbingImmutable:v58];

  if (v85) {
    id v59 = v85;
  }
  else {
    id v59 = v41;
  }
  [v38 setPayloadDblclickbehaviorImmutable:v59];

  if (v86) {
    id v60 = v86;
  }
  else {
    id v60 = v41;
  }
  [v38 setPayloadShowindicatorsImmutable:v60];

  if (v87) {
    id v61 = v87;
  }
  else {
    id v61 = v41;
  }
  [v38 setPayloadShowRecents:v61];

  [v38 updateServerHash];

  return v38;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDeclarationType:@"com.apple.configuration.device.dock"];
  if (v3)
  {
    [v4 setDeclarationIdentifier:v3];
  }
  else
  {
    v5 = [MEMORY[0x263F08C38] UUID];
    v6 = [v5 UUIDString];
    [v4 setDeclarationIdentifier:v6];
  }
  [v4 updateServerHash];

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMDeviceDockDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v95 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"orientation" isRequired:0 defaultValue:0 error:&v95];
  id v14 = v95;
  payloadOrientation = self->_payloadOrientation;
  self->_payloadOrientation = v13;

  if (!v14)
  {
    id v94 = 0;
    v16 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"position-immutable" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v94];
    id v14 = v94;
    payloadPositionImmutable = self->_payloadPositionImmutable;
    self->_payloadPositionImmutable = v16;

    if (!v14)
    {
      id v93 = 0;
      v18 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"autohide" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v93];
      id v14 = v93;
      payloadAutohide = self->_payloadAutohide;
      self->_payloadAutohide = v18;

      if (!v14)
      {
        id v92 = 0;
        v20 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"autohide-immutable" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v92];
        id v14 = v92;
        payloadAutohideImmutable = self->_payloadAutohideImmutable;
        self->_payloadAutohideImmutable = v20;

        if (!v14)
        {
          id v91 = 0;
          v22 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"minimize-to-application" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v91];
          id v14 = v91;
          payloadMinimizeToApplication = self->_payloadMinimizeToApplication;
          self->_payloadMinimizeToApplication = v22;

          if (!v14)
          {
            id v90 = 0;
            v24 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"minimize-to-application-immutable" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v90];
            id v14 = v90;
            payloadMinimizeToApplicationImmutable = self->_payloadMinimizeToApplicationImmutable;
            self->_payloadMinimizeToApplicationImmutable = v24;

            if (!v14)
            {
              id v89 = 0;
              v26 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"magnification" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v89];
              id v14 = v89;
              payloadMagnification = self->_payloadMagnification;
              self->_payloadMagnification = v26;

              if (!v14)
              {
                id v88 = 0;
                v28 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"magnify-immutable" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v88];
                id v14 = v88;
                payloadMagnifyImmutable = self->_payloadMagnifyImmutable;
                self->_payloadMagnifyImmutable = v28;

                if (!v14)
                {
                  id v87 = 0;
                  id v30 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"largesize" isRequired:0 defaultValue:0 error:&v87];
                  id v14 = v87;
                  payloadLargesize = self->_payloadLargesize;
                  self->_payloadLargesize = v30;

                  if (!v14)
                  {
                    id v86 = 0;
                    id v32 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"magsize-immutable" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v86];
                    id v14 = v86;
                    payloadMagsizeImmutable = self->_payloadMagsizeImmutable;
                    self->_payloadMagsizeImmutable = v32;

                    if (!v14)
                    {
                      id v85 = 0;
                      id v34 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"show-process-indicators" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v85];
                      id v14 = v85;
                      payloadShowProcessIndicators = self->_payloadShowProcessIndicators;
                      self->_payloadShowProcessIndicators = v34;

                      if (!v14)
                      {
                        id v84 = 0;
                        id v36 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"launchanim" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v84];
                        id v14 = v84;
                        payloadLaunchanim = self->_payloadLaunchanim;
                        self->_payloadLaunchanim = v36;

                        if (!v14)
                        {
                          id v83 = 0;
                          v38 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"launchanim-immutable" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v83];
                          id v14 = v83;
                          payloadLaunchanimImmutable = self->_payloadLaunchanimImmutable;
                          self->_payloadLaunchanimImmutable = v38;

                          if (!v14)
                          {
                            id v82 = 0;
                            v40 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"mineffect" isRequired:0 defaultValue:0 error:&v82];
                            id v14 = v82;
                            payloadMineffect = self->_payloadMineffect;
                            self->_payloadMineffect = v40;

                            if (!v14)
                            {
                              id v81 = 0;
                              id v42 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"mineffect-immutable" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v81];
                              id v14 = v81;
                              payloadMineffectImmutable = self->_payloadMineffectImmutable;
                              self->_payloadMineffectImmutable = v42;

                              if (!v14)
                              {
                                id v80 = 0;
                                id v44 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"tilesize" isRequired:0 defaultValue:0 error:&v80];
                                id v14 = v80;
                                payloadTilesize = self->_payloadTilesize;
                                self->_payloadTilesize = v44;

                                if (!v14)
                                {
                                  id v79 = 0;
                                  id v46 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"size-immutable" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v79];
                                  id v14 = v79;
                                  payloadSizeImmutable = self->_payloadSizeImmutable;
                                  self->_payloadSizeImmutable = v46;

                                  if (!v14)
                                  {
                                    id v78 = 0;
                                    id v48 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"MCXDockSpecialFolders" validator:&__block_literal_global_11 isRequired:0 defaultValue:0 error:&v78];
                                    id v14 = v78;
                                    payloadMCXDockSpecialFolders = self->_payloadMCXDockSpecialFolders;
                                    self->_payloadMCXDockSpecialFolders = v48;

                                    if (!v14)
                                    {
                                      id v77 = 0;
                                      id v50 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"AllowDockFixupOverride" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v77];
                                      id v14 = v77;
                                      payloadAllowDockFixupOverride = self->_payloadAllowDockFixupOverride;
                                      self->_payloadAllowDockFixupOverride = v50;

                                      if (!v14)
                                      {
                                        id v76 = 0;
                                        id v52 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"static-only" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v76];
                                        id v14 = v76;
                                        payloadStaticOnly = self->_payloadStaticOnly;
                                        self->_payloadStaticOnly = v52;

                                        if (!v14)
                                        {
                                          id v75 = 0;
                                          id v54 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"static-others" classType:objc_opt_class() nested:0 isRequired:0 defaultValue:0 error:&v75];
                                          id v14 = v75;
                                          payloadStaticOthers = self->_payloadStaticOthers;
                                          self->_payloadStaticOthers = v54;

                                          if (!v14)
                                          {
                                            id v74 = 0;
                                            id v56 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"static-apps" classType:objc_opt_class() nested:0 isRequired:0 defaultValue:0 error:&v74];
                                            id v14 = v74;
                                            payloadStaticApps = self->_payloadStaticApps;
                                            self->_payloadStaticApps = v56;

                                            if (!v14)
                                            {
                                              id v73 = 0;
                                              id v58 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"contents-immutable" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v73];
                                              id v14 = v73;
                                              payloadContentsImmutable = self->_payloadContentsImmutable;
                                              self->_payloadContentsImmutable = v58;

                                              if (!v14)
                                              {
                                                id v72 = 0;
                                                id v60 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"windowtabbing-immutable" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v72];
                                                id v14 = v72;
                                                payloadWindowtabbingImmutable = self->_payloadWindowtabbingImmutable;
                                                self->_payloadWindowtabbingImmutable = v60;

                                                if (!v14)
                                                {
                                                  id v71 = 0;
                                                  v62 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"dblclickbehavior-immutable" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v71];
                                                  id v14 = v71;
                                                  payloadDblclickbehaviorImmutable = self->_payloadDblclickbehaviorImmutable;
                                                  self->_payloadDblclickbehaviorImmutable = v62;

                                                  if (!v14)
                                                  {
                                                    id v70 = 0;
                                                    v64 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"showindicators-immutable" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v70];
                                                    id v14 = v70;
                                                    payloadShowindicatorsImmutable = self->_payloadShowindicatorsImmutable;
                                                    self->_payloadShowindicatorsImmutable = v64;

                                                    if (!v14)
                                                    {
                                                      id v69 = 0;
                                                      id v66 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"show-recents" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v69];
                                                      id v14 = v69;
                                                      payloadShowRecents = self->_payloadShowRecents;
                                                      self->_payloadShowRecents = v66;
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

uint64_t __46__CEMDeviceDockDeclaration_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263EFF9A0] dictionary];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"orientation" withValue:self->_payloadOrientation isRequired:0 defaultValue:0];
  uint64_t v6 = MEMORY[0x263EFFA80];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"position-immutable" withValue:self->_payloadPositionImmutable isRequired:0 defaultValue:MEMORY[0x263EFFA80]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"autohide" withValue:self->_payloadAutohide isRequired:0 defaultValue:v6];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"autohide-immutable" withValue:self->_payloadAutohideImmutable isRequired:0 defaultValue:v6];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"minimize-to-application" withValue:self->_payloadMinimizeToApplication isRequired:0 defaultValue:v6];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"minimize-to-application-immutable" withValue:self->_payloadMinimizeToApplicationImmutable isRequired:0 defaultValue:v6];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"magnification" withValue:self->_payloadMagnification isRequired:0 defaultValue:v6];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"magnify-immutable" withValue:self->_payloadMagnifyImmutable isRequired:0 defaultValue:v6];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v5 withKey:@"largesize" withValue:self->_payloadLargesize isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"magsize-immutable" withValue:self->_payloadMagsizeImmutable isRequired:0 defaultValue:v6];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"show-process-indicators" withValue:self->_payloadShowProcessIndicators isRequired:0 defaultValue:v6];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"launchanim" withValue:self->_payloadLaunchanim isRequired:0 defaultValue:v6];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"launchanim-immutable" withValue:self->_payloadLaunchanimImmutable isRequired:0 defaultValue:v6];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"mineffect" withValue:self->_payloadMineffect isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"mineffect-immutable" withValue:self->_payloadMineffectImmutable isRequired:0 defaultValue:v6];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v5 withKey:@"tilesize" withValue:self->_payloadTilesize isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"size-immutable" withValue:self->_payloadSizeImmutable isRequired:0 defaultValue:v6];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"MCXDockSpecialFolders" withValue:self->_payloadMCXDockSpecialFolders itemSerializer:&__block_literal_global_113 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"AllowDockFixupOverride" withValue:self->_payloadAllowDockFixupOverride isRequired:0 defaultValue:v6];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"static-only" withValue:self->_payloadStaticOnly isRequired:0 defaultValue:v6];
  payloadStaticOthers = self->_payloadStaticOthers;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __63__CEMDeviceDockDeclaration_serializePayloadWithAssetProviders___block_invoke_2;
  v18[3] = &unk_2642C8BD8;
  id v8 = v4;
  id v19 = v8;
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"static-others" withValue:payloadStaticOthers itemSerializer:v18 isRequired:0 defaultValue:0];
  payloadStaticApps = self->_payloadStaticApps;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  v15 = __63__CEMDeviceDockDeclaration_serializePayloadWithAssetProviders___block_invoke_3;
  v16 = &unk_2642C8BD8;
  id v17 = v8;
  id v10 = v8;
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"static-apps" withValue:payloadStaticApps itemSerializer:&v13 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5, @"contents-immutable", self->_payloadContentsImmutable, 0, v6, v13, v14, v15, v16 withKey withValue isRequired defaultValue];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"windowtabbing-immutable" withValue:self->_payloadWindowtabbingImmutable isRequired:0 defaultValue:v6];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"dblclickbehavior-immutable" withValue:self->_payloadDblclickbehaviorImmutable isRequired:0 defaultValue:v6];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"showindicators-immutable" withValue:self->_payloadShowindicatorsImmutable isRequired:0 defaultValue:v6];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"show-recents" withValue:self->_payloadShowRecents isRequired:0 defaultValue:v6];
  v11 = (void *)[v5 copy];

  return v11;
}

id __63__CEMDeviceDockDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

uint64_t __63__CEMDeviceDockDeclaration_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

uint64_t __63__CEMDeviceDockDeclaration_serializePayloadWithAssetProviders___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v60.receiver = self;
  v60.super_class = (Class)CEMDeviceDockDeclaration;
  id v4 = [(CEMDeclarationBase *)&v60 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadOrientation copy];
  uint64_t v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadPositionImmutable copy];
  id v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadAutohide copy];
  id v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(NSNumber *)self->_payloadAutohideImmutable copy];
  v12 = (void *)v4[12];
  v4[12] = v11;

  uint64_t v13 = [(NSNumber *)self->_payloadMinimizeToApplication copy];
  uint64_t v14 = (void *)v4[13];
  v4[13] = v13;

  uint64_t v15 = [(NSNumber *)self->_payloadMinimizeToApplicationImmutable copy];
  v16 = (void *)v4[14];
  v4[14] = v15;

  uint64_t v17 = [(NSNumber *)self->_payloadMagnification copy];
  v18 = (void *)v4[15];
  v4[15] = v17;

  uint64_t v19 = [(NSNumber *)self->_payloadMagnifyImmutable copy];
  v20 = (void *)v4[16];
  v4[16] = v19;

  uint64_t v21 = [(NSNumber *)self->_payloadLargesize copy];
  v22 = (void *)v4[17];
  v4[17] = v21;

  uint64_t v23 = [(NSNumber *)self->_payloadMagsizeImmutable copy];
  v24 = (void *)v4[18];
  v4[18] = v23;

  uint64_t v25 = [(NSNumber *)self->_payloadShowProcessIndicators copy];
  v26 = (void *)v4[19];
  v4[19] = v25;

  uint64_t v27 = [(NSNumber *)self->_payloadLaunchanim copy];
  v28 = (void *)v4[20];
  v4[20] = v27;

  uint64_t v29 = [(NSNumber *)self->_payloadLaunchanimImmutable copy];
  id v30 = (void *)v4[21];
  v4[21] = v29;

  uint64_t v31 = [(NSString *)self->_payloadMineffect copy];
  id v32 = (void *)v4[22];
  v4[22] = v31;

  uint64_t v33 = [(NSNumber *)self->_payloadMineffectImmutable copy];
  id v34 = (void *)v4[23];
  v4[23] = v33;

  uint64_t v35 = [(NSNumber *)self->_payloadTilesize copy];
  id v36 = (void *)v4[24];
  v4[24] = v35;

  uint64_t v37 = [(NSNumber *)self->_payloadSizeImmutable copy];
  v38 = (void *)v4[25];
  v4[25] = v37;

  uint64_t v39 = [(NSArray *)self->_payloadMCXDockSpecialFolders copy];
  v40 = (void *)v4[26];
  v4[26] = v39;

  uint64_t v41 = [(NSNumber *)self->_payloadAllowDockFixupOverride copy];
  id v42 = (void *)v4[27];
  v4[27] = v41;

  uint64_t v43 = [(NSNumber *)self->_payloadStaticOnly copy];
  id v44 = (void *)v4[28];
  v4[28] = v43;

  uint64_t v45 = [(NSArray *)self->_payloadStaticOthers copy];
  id v46 = (void *)v4[29];
  v4[29] = v45;

  uint64_t v47 = [(NSArray *)self->_payloadStaticApps copy];
  id v48 = (void *)v4[30];
  v4[30] = v47;

  uint64_t v49 = [(NSNumber *)self->_payloadContentsImmutable copy];
  id v50 = (void *)v4[31];
  v4[31] = v49;

  uint64_t v51 = [(NSNumber *)self->_payloadWindowtabbingImmutable copy];
  id v52 = (void *)v4[32];
  v4[32] = v51;

  uint64_t v53 = [(NSNumber *)self->_payloadDblclickbehaviorImmutable copy];
  id v54 = (void *)v4[33];
  v4[33] = v53;

  uint64_t v55 = [(NSNumber *)self->_payloadShowindicatorsImmutable copy];
  id v56 = (void *)v4[34];
  v4[34] = v55;

  uint64_t v57 = [(NSNumber *)self->_payloadShowRecents copy];
  id v58 = (void *)v4[35];
  v4[35] = v57;

  return v4;
}

- (NSString)payloadOrientation
{
  return self->_payloadOrientation;
}

- (void)setPayloadOrientation:(id)a3
{
}

- (NSNumber)payloadPositionImmutable
{
  return self->_payloadPositionImmutable;
}

- (void)setPayloadPositionImmutable:(id)a3
{
}

- (NSNumber)payloadAutohide
{
  return self->_payloadAutohide;
}

- (void)setPayloadAutohide:(id)a3
{
}

- (NSNumber)payloadAutohideImmutable
{
  return self->_payloadAutohideImmutable;
}

- (void)setPayloadAutohideImmutable:(id)a3
{
}

- (NSNumber)payloadMinimizeToApplication
{
  return self->_payloadMinimizeToApplication;
}

- (void)setPayloadMinimizeToApplication:(id)a3
{
}

- (NSNumber)payloadMinimizeToApplicationImmutable
{
  return self->_payloadMinimizeToApplicationImmutable;
}

- (void)setPayloadMinimizeToApplicationImmutable:(id)a3
{
}

- (NSNumber)payloadMagnification
{
  return self->_payloadMagnification;
}

- (void)setPayloadMagnification:(id)a3
{
}

- (NSNumber)payloadMagnifyImmutable
{
  return self->_payloadMagnifyImmutable;
}

- (void)setPayloadMagnifyImmutable:(id)a3
{
}

- (NSNumber)payloadLargesize
{
  return self->_payloadLargesize;
}

- (void)setPayloadLargesize:(id)a3
{
}

- (NSNumber)payloadMagsizeImmutable
{
  return self->_payloadMagsizeImmutable;
}

- (void)setPayloadMagsizeImmutable:(id)a3
{
}

- (NSNumber)payloadShowProcessIndicators
{
  return self->_payloadShowProcessIndicators;
}

- (void)setPayloadShowProcessIndicators:(id)a3
{
}

- (NSNumber)payloadLaunchanim
{
  return self->_payloadLaunchanim;
}

- (void)setPayloadLaunchanim:(id)a3
{
}

- (NSNumber)payloadLaunchanimImmutable
{
  return self->_payloadLaunchanimImmutable;
}

- (void)setPayloadLaunchanimImmutable:(id)a3
{
}

- (NSString)payloadMineffect
{
  return self->_payloadMineffect;
}

- (void)setPayloadMineffect:(id)a3
{
}

- (NSNumber)payloadMineffectImmutable
{
  return self->_payloadMineffectImmutable;
}

- (void)setPayloadMineffectImmutable:(id)a3
{
}

- (NSNumber)payloadTilesize
{
  return self->_payloadTilesize;
}

- (void)setPayloadTilesize:(id)a3
{
}

- (NSNumber)payloadSizeImmutable
{
  return self->_payloadSizeImmutable;
}

- (void)setPayloadSizeImmutable:(id)a3
{
}

- (NSArray)payloadMCXDockSpecialFolders
{
  return self->_payloadMCXDockSpecialFolders;
}

- (void)setPayloadMCXDockSpecialFolders:(id)a3
{
}

- (NSNumber)payloadAllowDockFixupOverride
{
  return self->_payloadAllowDockFixupOverride;
}

- (void)setPayloadAllowDockFixupOverride:(id)a3
{
}

- (NSNumber)payloadStaticOnly
{
  return self->_payloadStaticOnly;
}

- (void)setPayloadStaticOnly:(id)a3
{
}

- (NSArray)payloadStaticOthers
{
  return self->_payloadStaticOthers;
}

- (void)setPayloadStaticOthers:(id)a3
{
}

- (NSArray)payloadStaticApps
{
  return self->_payloadStaticApps;
}

- (void)setPayloadStaticApps:(id)a3
{
}

- (NSNumber)payloadContentsImmutable
{
  return self->_payloadContentsImmutable;
}

- (void)setPayloadContentsImmutable:(id)a3
{
}

- (NSNumber)payloadWindowtabbingImmutable
{
  return self->_payloadWindowtabbingImmutable;
}

- (void)setPayloadWindowtabbingImmutable:(id)a3
{
}

- (NSNumber)payloadDblclickbehaviorImmutable
{
  return self->_payloadDblclickbehaviorImmutable;
}

- (void)setPayloadDblclickbehaviorImmutable:(id)a3
{
}

- (NSNumber)payloadShowindicatorsImmutable
{
  return self->_payloadShowindicatorsImmutable;
}

- (void)setPayloadShowindicatorsImmutable:(id)a3
{
}

- (NSNumber)payloadShowRecents
{
  return self->_payloadShowRecents;
}

- (void)setPayloadShowRecents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadShowRecents, 0);
  objc_storeStrong((id *)&self->_payloadShowindicatorsImmutable, 0);
  objc_storeStrong((id *)&self->_payloadDblclickbehaviorImmutable, 0);
  objc_storeStrong((id *)&self->_payloadWindowtabbingImmutable, 0);
  objc_storeStrong((id *)&self->_payloadContentsImmutable, 0);
  objc_storeStrong((id *)&self->_payloadStaticApps, 0);
  objc_storeStrong((id *)&self->_payloadStaticOthers, 0);
  objc_storeStrong((id *)&self->_payloadStaticOnly, 0);
  objc_storeStrong((id *)&self->_payloadAllowDockFixupOverride, 0);
  objc_storeStrong((id *)&self->_payloadMCXDockSpecialFolders, 0);
  objc_storeStrong((id *)&self->_payloadSizeImmutable, 0);
  objc_storeStrong((id *)&self->_payloadTilesize, 0);
  objc_storeStrong((id *)&self->_payloadMineffectImmutable, 0);
  objc_storeStrong((id *)&self->_payloadMineffect, 0);
  objc_storeStrong((id *)&self->_payloadLaunchanimImmutable, 0);
  objc_storeStrong((id *)&self->_payloadLaunchanim, 0);
  objc_storeStrong((id *)&self->_payloadShowProcessIndicators, 0);
  objc_storeStrong((id *)&self->_payloadMagsizeImmutable, 0);
  objc_storeStrong((id *)&self->_payloadLargesize, 0);
  objc_storeStrong((id *)&self->_payloadMagnifyImmutable, 0);
  objc_storeStrong((id *)&self->_payloadMagnification, 0);
  objc_storeStrong((id *)&self->_payloadMinimizeToApplicationImmutable, 0);
  objc_storeStrong((id *)&self->_payloadMinimizeToApplication, 0);
  objc_storeStrong((id *)&self->_payloadAutohideImmutable, 0);
  objc_storeStrong((id *)&self->_payloadAutohide, 0);
  objc_storeStrong((id *)&self->_payloadPositionImmutable, 0);

  objc_storeStrong((id *)&self->_payloadOrientation, 0);
}

uint64_t __74__CEMDeviceDockDeclaration_StaticItem_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

uint64_t __82__CEMDeviceDockDeclaration_StaticItemTileData_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializePayload];
}

@end