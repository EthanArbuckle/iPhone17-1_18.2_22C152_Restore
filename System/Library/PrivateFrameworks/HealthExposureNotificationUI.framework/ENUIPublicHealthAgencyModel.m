@interface ENUIPublicHealthAgencyModel
+ (ENEntity)turndownEntity;
+ (NSArray)allRegions;
+ (NSArray)authorizedRegions;
+ (NSArray)availableRegions;
+ (NSString)dummyRegionCountryCode;
+ (_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel)activeRegion;
+ (id)defaultModelWithBundleId:(id)a3 isAuthorized:(BOOL)a4;
+ (id)regionForRegionCode:(id)a3;
+ (void)refreshRegionsWithCompletion:(id)a3;
+ (void)setActiveRegion:(id)a3;
+ (void)setAuthorizedRegions:(id)a3;
+ (void)setAvailableRegions:(id)a3;
+ (void)setTurndownEntity:(id)a3;
- (BOOL)isAppInstalled;
- (BOOL)isAppInstalledAndRegionYetToBeOnboarded;
- (BOOL)isAssociatedDomainAllowed;
- (BOOL)isAuthorized;
- (BOOL)isPreauthorizationDomainAllowed;
- (BOOL)isRegionUsingApp;
- (BOOL)isSymptomOnsetNeeded;
- (BOOL)isTravelStatusNeeded;
- (BOOL)isVaccinationQuestionNeeded;
- (BOOL)regionIsPlaceholder;
- (BOOL)supportsFeatures:(unsigned int)a3;
- (BOOL)wantsAnalytics;
- (ENRegion)region;
- (ENUserAuthorization)diagnosisKeysPreAuthorization;
- (NSString)analyticsConsentText;
- (NSString)appBundleId;
- (NSString)consentVersion;
- (NSString)installedAppName;
- (NSString)introductoryText;
- (NSString)name;
- (NSString)selfReportIntroductoryText;
- (NSString)vaccinationQuestionText;
- (NSString)verificationIntroductoryText;
- (NSString)verificationSymptomOnsetText;
- (NSString)verificationTravelStatusText;
- (NSURL)regionFAQWebsiteURL;
- (NSURL)regionWebsiteURL;
- (NSURL)verificationCodeHelpURL;
- (NSURL)webReportURL;
- (UIImage)installedAppIcon;
- (_TtC28HealthExposureNotificationUI21ENUIUserConsentStatus)consentStatus;
- (_TtC28HealthExposureNotificationUI22ENUIPublicHealthHeader)header;
- (_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel)init;
- (_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel)initWithRegion:(id)a3 name:(id)a4 appBundleId:(id)a5 introductoryText:(id)a6 header:(id)a7 legalese:(id)a8 consentStatus:(id)a9 consentVersion:(id)a10 diagnosisKeysPreAuthorization:(id)a11 isAssociatedDomainAllowed:(BOOL)a12 isPreauthorizationDomainAllowed:(BOOL)a13 isAuthorized:(BOOL)a14 regionVersion:(int64_t)a15 regionWebsiteURL:(id)a16 regionFAQWebsiteURL:(id)a17 featureFlags:(unsigned int)a18 wantsAnalytics:(BOOL)a19 analyticsConsentStatus:(int64_t)a20 analyticsConsentText:(id)a21 verificationIntroductoryText:(id)a22 selfReportIntroductoryText:(id)a23 verificationCodeHelpURL:(id)a24 verificationSymptomOnsetText:(id)a25 verificationTravelStatusText:(id)a26 vaccinationQuestionText:(id)a27 webReportURL:(id)a28;
- (_TtC28HealthExposureNotificationUI29ENUIPublicHealthLegalDocument)legalese;
- (int64_t)analyticsConsentStatus;
- (int64_t)regionVersion;
- (unsigned)featureFlags;
- (void)setAnalyticsConsentStatus:(int64_t)a3;
@end

@implementation ENUIPublicHealthAgencyModel

- (ENRegion)region
{
  return (ENRegion *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_region));
}

- (NSString)name
{
  return (NSString *)sub_229399C30();
}

- (NSString)appBundleId
{
  return (NSString *)sub_229399A34((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_appBundleId);
}

- (NSString)introductoryText
{
  return (NSString *)sub_229399C30();
}

- (_TtC28HealthExposureNotificationUI22ENUIPublicHealthHeader)header
{
  return (_TtC28HealthExposureNotificationUI22ENUIPublicHealthHeader *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_header);
}

- (_TtC28HealthExposureNotificationUI29ENUIPublicHealthLegalDocument)legalese
{
  return (_TtC28HealthExposureNotificationUI29ENUIPublicHealthLegalDocument *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_legalese);
}

- (_TtC28HealthExposureNotificationUI21ENUIUserConsentStatus)consentStatus
{
  return (_TtC28HealthExposureNotificationUI21ENUIUserConsentStatus *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_consentStatus);
}

- (NSString)consentVersion
{
  return (NSString *)sub_229399C30();
}

- (ENUserAuthorization)diagnosisKeysPreAuthorization
{
  return (ENUserAuthorization *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                        + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_diagnosisKeysPreAuthorization));
}

- (BOOL)isAssociatedDomainAllowed
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_isAssociatedDomainAllowed);
}

- (BOOL)isPreauthorizationDomainAllowed
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_isPreauthorizationDomainAllowed);
}

- (BOOL)isAuthorized
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_isAuthorized);
}

- (int64_t)regionVersion
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_regionVersion);
}

- (NSURL)regionWebsiteURL
{
  return (NSURL *)sub_229399CD4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_regionWebsiteURL);
}

- (NSURL)regionFAQWebsiteURL
{
  return (NSURL *)sub_229399CD4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_regionFAQWebsiteURL);
}

- (unsigned)featureFlags
{
  return *(_DWORD *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_featureFlags);
}

- (BOOL)wantsAnalytics
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_wantsAnalytics);
}

- (int64_t)analyticsConsentStatus
{
  v2 = (int64_t *)((char *)self
                        + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_analyticsConsentStatus);
  swift_beginAccess();
  return *v2;
}

- (void)setAnalyticsConsentStatus:(int64_t)a3
{
  v4 = (int64_t *)((char *)self
                        + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_analyticsConsentStatus);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (NSString)analyticsConsentText
{
  return (NSString *)sub_229399A34((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_analyticsConsentText);
}

- (NSString)verificationIntroductoryText
{
  return (NSString *)sub_229399C30();
}

- (NSString)selfReportIntroductoryText
{
  return (NSString *)sub_229399C30();
}

- (NSURL)verificationCodeHelpURL
{
  return (NSURL *)sub_229399CD4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_verificationCodeHelpURL);
}

- (NSString)verificationSymptomOnsetText
{
  return (NSString *)sub_229399C30();
}

- (NSString)verificationTravelStatusText
{
  return (NSString *)sub_229399C30();
}

- (NSString)vaccinationQuestionText
{
  return (NSString *)sub_229399C30();
}

- (NSURL)webReportURL
{
  return (NSURL *)sub_229399CD4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_webReportURL);
}

- (BOOL)isSymptomOnsetNeeded
{
  return sub_229399E2C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_verificationSymptomOnsetText);
}

- (BOOL)isTravelStatusNeeded
{
  return sub_229399E2C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_verificationTravelStatusText);
}

- (BOOL)isVaccinationQuestionNeeded
{
  v2 = self;
  BOOL v3 = ENUIPublicHealthAgencyModel.isVaccinationQuestionNeeded.getter();

  return v3;
}

- (_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel)initWithRegion:(id)a3 name:(id)a4 appBundleId:(id)a5 introductoryText:(id)a6 header:(id)a7 legalese:(id)a8 consentStatus:(id)a9 consentVersion:(id)a10 diagnosisKeysPreAuthorization:(id)a11 isAssociatedDomainAllowed:(BOOL)a12 isPreauthorizationDomainAllowed:(BOOL)a13 isAuthorized:(BOOL)a14 regionVersion:(int64_t)a15 regionWebsiteURL:(id)a16 regionFAQWebsiteURL:(id)a17 featureFlags:(unsigned int)a18 wantsAnalytics:(BOOL)a19 analyticsConsentStatus:(int64_t)a20 analyticsConsentText:(id)a21 verificationIntroductoryText:(id)a22 selfReportIntroductoryText:(id)a23 verificationCodeHelpURL:(id)a24 verificationSymptomOnsetText:(id)a25 verificationTravelStatusText:(id)a26 vaccinationQuestionText:(id)a27 webReportURL:(id)a28
{
  id v135 = a8;
  id v136 = a7;
  id v134 = a3;
  v130 = self;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0EEB0);
  uint64_t v30 = MEMORY[0x270FA5388](v29 - 8);
  v32 = (char *)&v103 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = MEMORY[0x270FA5388](v30);
  uint64_t v133 = (uint64_t)&v103 - v34;
  uint64_t v35 = MEMORY[0x270FA5388](v33);
  v37 = (char *)&v103 - v36;
  MEMORY[0x270FA5388](v35);
  v39 = (char *)&v103 - v38;
  uint64_t v40 = sub_2294191A8();
  uint64_t v127 = v41;
  uint64_t v128 = v40;
  v126 = v32;
  if (a5)
  {
    uint64_t v42 = sub_2294191A8();
    uint64_t v123 = v43;
    uint64_t v124 = v42;
  }
  else
  {
    uint64_t v123 = 0;
    uint64_t v124 = 0;
  }
  uint64_t v44 = sub_2294191A8();
  uint64_t v121 = v45;
  uint64_t v122 = v44;
  if (a10)
  {
    uint64_t v46 = sub_2294191A8();
    unint64_t v119 = v47;
    uint64_t v120 = v46;
  }
  else
  {
    unint64_t v119 = 0;
    uint64_t v120 = 0;
  }
  id v131 = a25;
  id v132 = a27;
  v125 = v39;
  id v116 = a26;
  id v114 = a23;
  if (a16)
  {
    sub_229418DC8();
    uint64_t v48 = sub_229418DE8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v48 - 8) + 56))(v39, 0, 1, v48);
  }
  else
  {
    uint64_t v49 = sub_229418DE8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v49 - 8) + 56))(v39, 1, 1, v49);
  }
  v129 = v37;
  id v117 = a11;
  id v118 = a9;
  id v115 = a28;
  if (a17)
  {
    sub_229418DC8();
    uint64_t v50 = sub_229418DE8();
    v51 = *(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v50 - 8) + 56);
    id v52 = v134;
    id v53 = v136;
    id v54 = v135;
    id v55 = a9;
    id v56 = a11;
    id v57 = a21;
    id v58 = a22;
    id v59 = v114;
    id v60 = v114;
    id v61 = a24;
    id v62 = v131;
    id v63 = v116;
    id v64 = v116;
    id v65 = v132;
    id v66 = a28;
    v51(v37, 0, 1, v50);
    if (a21)
    {
LABEL_12:
      uint64_t v113 = sub_2294191A8();
      uint64_t v112 = v67;

      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v68 = sub_229418DE8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v68 - 8) + 56))(v37, 1, 1, v68);
    id v69 = v134;
    id v70 = v136;
    id v71 = v135;
    id v72 = a9;
    id v73 = a11;
    id v74 = a21;
    id v75 = a22;
    id v59 = v114;
    id v76 = v114;
    id v77 = a24;
    id v78 = v131;
    id v63 = v116;
    id v79 = v116;
    id v80 = v132;
    id v81 = a28;
    if (a21) {
      goto LABEL_12;
    }
  }
  uint64_t v113 = 0;
  uint64_t v112 = 0;
LABEL_15:
  uint64_t v111 = sub_2294191A8();
  uint64_t v110 = v82;

  uint64_t v109 = sub_2294191A8();
  uint64_t v108 = v83;

  if (a24)
  {
    uint64_t v84 = v133;
    sub_229418DC8();

    uint64_t v85 = sub_229418DE8();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v85 - 8) + 56))(v84, 0, 1, v85);
  }
  else
  {
    uint64_t v86 = sub_229418DE8();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v86 - 8) + 56))(v133, 1, 1, v86);
  }
  uint64_t v104 = a20;
  id v114 = (id)a15;
  BOOL v107 = a14;
  BOOL v106 = a13;
  BOOL v105 = a12;
  id v87 = v131;
  uint64_t v88 = sub_2294191A8();
  uint64_t v90 = v89;

  uint64_t v91 = sub_2294191A8();
  uint64_t v93 = v92;

  id v94 = v132;
  uint64_t v95 = sub_2294191A8();
  uint64_t v97 = v96;

  v98 = v115;
  if (v115)
  {
    uint64_t v99 = (uint64_t)v126;
    sub_229418DC8();

    uint64_t v100 = sub_229418DE8();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v100 - 8) + 56))(v99, 0, 1, v100);
  }
  else
  {
    uint64_t v101 = sub_229418DE8();
    uint64_t v99 = (uint64_t)v126;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v101 - 8) + 56))(v126, 1, 1, v101);
  }
  return (_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel *)ENUIPublicHealthAgencyModel.init(region:name:appBundleId:introductoryText:header:legalese:consentStatus:consentVersion:diagnosisKeysPreAuthorization:isAssociatedDomainAllowed:isPreauthorizationDomainAllowed:isAuthorized:regionVersion:regionWebsiteURL:regionFAQWebsiteURL:featureFlags:wantsAnalytics:analyticsConsentStatus:analyticsConsentText:verificationIntroductoryText:selfReportIntroductoryText:verificationCodeHelpURL:verificationSymptomOnsetText:verificationTravelStatusText:vaccinationQuestionText:webReportURL:)((uint64_t)v134, v128, v127, v124, v123, v122, v121, (uint64_t)v136, (uint64_t)v135, (uint64_t)v118, v120, v119, (uint64_t)v117, v105, v106, v107, (uint64_t)v114, (uint64_t)v125, (uint64_t)v129,
                                                                              a18,
                                                                              a19,
                                                                              v104,
                                                                              v113,
                                                                              v112,
                                                                              v111,
                                                                              v110,
                                                                              v109,
                                                                              v108,
                                                                              v133,
                                                                              v88,
                                                                              v90,
                                                                              v91,
                                                                              v93,
                                                                              v95,
                                                                              v97,
                                                                              v99);
}

- (BOOL)isAppInstalled
{
  v2 = self;
  unsigned __int8 v3 = ENUIPublicHealthAgencyModel.isAppInstalled.getter();

  return v3 & 1;
}

- (BOOL)isRegionUsingApp
{
  v2 = self;
  ENUIPublicHealthAgencyModel.isRegionUsingApp.getter();
  char v4 = v3;

  return v4 & 1;
}

- (BOOL)isAppInstalledAndRegionYetToBeOnboarded
{
  v2 = self;
  if (ENUIPublicHealthAgencyModel.isAppInstalled.getter())
  {
    char v3 = *((unsigned char *)&v2->super.isa
         + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_isAuthorized);

    char v4 = v3 ^ 1;
  }
  else
  {

    char v4 = 0;
  }
  return v4 & 1;
}

- (NSString)installedAppName
{
  v2 = self;
  ENUIPublicHealthAgencyModel.installedAppName.getter();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_229419178();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (UIImage)installedAppIcon
{
  v2 = self;
  ENUIPublicHealthAgencyModel.installedAppIcon.getter();
  uint64_t v4 = v3;

  return (UIImage *)v4;
}

- (BOOL)regionIsPlaceholder
{
  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_region);
  uint64_t v3 = self;
  id v4 = objc_msgSend(v2, sel_regionCode);
  uint64_t v5 = sub_2294191A8();
  uint64_t v7 = v6;

  if (qword_268316670 != -1) {
    swift_once();
  }
  if (v5 == static ENUIPublicHealthAgencyModel.dummyRegionCountryCode && v7 == unk_26831AB00) {
    char v9 = 1;
  }
  else {
    char v9 = sub_2294196A8();
  }

  swift_bridgeObjectRelease();
  return v9 & 1;
}

+ (_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel)activeRegion
{
  return (_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel *)(id)static ENUIPublicHealthAgencyModel.activeRegion;
}

+ (void)setActiveRegion:(id)a3
{
}

+ (NSArray)authorizedRegions
{
  return (NSArray *)sub_22939BB64((uint64_t)a1, (uint64_t)a2, &qword_26AF0EED0);
}

+ (void)setAuthorizedRegions:(id)a3
{
}

+ (NSArray)availableRegions
{
  return (NSArray *)sub_22939BB64((uint64_t)a1, (uint64_t)a2, &qword_268316668);
}

+ (void)setAvailableRegions:(id)a3
{
}

+ (ENEntity)turndownEntity
{
  return (ENEntity *)(id)static ENUIPublicHealthAgencyModel.turndownEntity;
}

+ (void)setTurndownEntity:(id)a3
{
}

+ (NSString)dummyRegionCountryCode
{
  if (qword_268316670 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  v2 = (void *)sub_229419178();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

+ (NSArray)allRegions
{
  _s28HealthExposureNotificationUI010ENUIPublicA11AgencyModelC10allRegionsSayACGvgZ_0();
  type metadata accessor for ENUIPublicHealthAgencyModel(0);
  v2 = (void *)sub_229419228();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

+ (id)regionForRegionCode:(id)a3
{
  uint64_t v3 = sub_2294191A8();
  uint64_t v5 = v4;
  unint64_t v6 = _s28HealthExposureNotificationUI010ENUIPublicA11AgencyModelC10allRegionsSayACGvgZ_0();
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_22939F5D0(v6, v3, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();

  return v7;
}

- (_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel)init
{
  result = (_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_region));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_header));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_legalese));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_consentStatus));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_diagnosisKeysPreAuthorization));
  sub_22939F4B4((uint64_t)self + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_regionWebsiteURL);
  sub_22939F4B4((uint64_t)self + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_regionFAQWebsiteURL);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22939F4B4((uint64_t)self + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_verificationCodeHelpURL);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_webReportURL;

  sub_22939F4B4((uint64_t)v3);
}

+ (void)refreshRegionsWithCompletion:(id)a3
{
  uint64_t v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  swift_getObjCClassMetadata();
  static ENUIPublicHealthAgencyModel.refreshRegions(completion:)((uint64_t)sub_2293A110C, v4);

  swift_release();
}

+ (id)defaultModelWithBundleId:(id)a3 isAuthorized:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = sub_2294191A8();
  id v7 = sub_2293A0B0C(v5, v6, v4);
  swift_bridgeObjectRelease();

  return v7;
}

- (BOOL)supportsFeatures:(unsigned int)a3
{
  return (a3 & ~*(_DWORD *)((char *)&self->super.isa
                          + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_featureFlags)) == 0;
}

@end