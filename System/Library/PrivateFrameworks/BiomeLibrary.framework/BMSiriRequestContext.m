@interface BMSiriRequestContext
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriRequestContext)initWithJSONDictionary:(id)a3 error:(id *)p_isa;
- (BMSiriRequestContext)initWithSessionID:(id)a3 requestID:(id)a4 inputOrigin:(id)a5 responseMode:(id)a6 isEyesFree:(id)a7 isMultiUser:(id)a8 isVoiceTriggerEnabled:(id)a9 isTextToSpeechEnabled:(id)a10 isTriggerlessFollowup:(id)a11 deviceRestrictions:(id)a12 bargeInModes:(id)a13 identifiedUser:(id)a14 encodedLocation:(id)a15 countryCode:(id)a16 siriLocale:(id)a17 contentRestrictions:(id)a18 uiScale:(id)a19 temperatureUnit:(id)a20 allowUserGeneratedContent:(id)a21 censorSpeech:(id)a22 meCard:(id)a23;
- (BMSiriRequestContext)initWithSessionID:(id)a3 requestID:(id)a4 inputOrigin:(id)a5 responseMode:(id)a6 isEyesFree:(id)a7 isMultiUser:(id)a8 isVoiceTriggerEnabled:(id)a9 isTextToSpeechEnabled:(id)a10 isTriggerlessFollowup:(id)a11 deviceRestrictions:(id)a12 bargeInModes:(id)a13 identifiedUser:(id)a14 encodedLocation:(id)a15 countryCode:(id)a16 siriLocale:(id)a17 contentRestrictions:(id)a18 uiScale:(id)a19 temperatureUnit:(id)a20 allowUserGeneratedContent:(id)a21 censorSpeech:(id)a22 meCard:(id)a23 deviceIdiom:(int)a24 didPSCFire:(id)a25;
- (BMSiriRequestContextContentRestriction)contentRestrictions;
- (BMSiriRequestContextMeCard)meCard;
- (BMSiriRequestContextUser)identifiedUser;
- (BOOL)allowUserGeneratedContent;
- (BOOL)censorSpeech;
- (BOOL)didPSCFire;
- (BOOL)hasAllowUserGeneratedContent;
- (BOOL)hasCensorSpeech;
- (BOOL)hasDidPSCFire;
- (BOOL)hasIsEyesFree;
- (BOOL)hasIsMultiUser;
- (BOOL)hasIsTextToSpeechEnabled;
- (BOOL)hasIsTriggerlessFollowup;
- (BOOL)hasIsVoiceTriggerEnabled;
- (BOOL)hasUiScale;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEyesFree;
- (BOOL)isMultiUser;
- (BOOL)isTextToSpeechEnabled;
- (BOOL)isTriggerlessFollowup;
- (BOOL)isVoiceTriggerEnabled;
- (NSArray)bargeInModes;
- (NSArray)deviceRestrictions;
- (NSData)encodedLocation;
- (NSString)countryCode;
- (NSString)description;
- (NSString)inputOrigin;
- (NSString)requestID;
- (NSString)responseMode;
- (NSString)sessionID;
- (NSString)siriLocale;
- (NSString)temperatureUnit;
- (double)uiScale;
- (id)_bargeInModesJSONArray;
- (id)_deviceRestrictionsJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)deviceIdiom;
- (unsigned)dataVersion;
- (void)setHasAllowUserGeneratedContent:(BOOL)a3;
- (void)setHasCensorSpeech:(BOOL)a3;
- (void)setHasDidPSCFire:(BOOL)a3;
- (void)setHasIsEyesFree:(BOOL)a3;
- (void)setHasIsMultiUser:(BOOL)a3;
- (void)setHasIsTextToSpeechEnabled:(BOOL)a3;
- (void)setHasIsTriggerlessFollowup:(BOOL)a3;
- (void)setHasIsVoiceTriggerEnabled:(BOOL)a3;
- (void)setHasUiScale:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriRequestContext

+ (id)columns
{
  v27[23] = *MEMORY[0x1E4F143B8];
  v26 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"sessionID" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  v25 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"requestID" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  v24 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"inputOrigin" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  v23 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"responseMode" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  v22 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isEyesFree" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:12 convertedType:0];
  v21 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isMultiUser" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:12 convertedType:0];
  v20 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isVoiceTriggerEnabled" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:12 convertedType:0];
  v19 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isTextToSpeechEnabled" dataType:0 requestOnly:0 fieldNumber:8 protoDataType:12 convertedType:0];
  v18 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isTriggerlessFollowup" dataType:0 requestOnly:0 fieldNumber:9 protoDataType:12 convertedType:0];
  v17 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"deviceRestrictions_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_451_42312];
  v16 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"bargeInModes_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_453_42313];
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"identifiedUser_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_455_42314];
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"encodedLocation" dataType:4 requestOnly:0 fieldNumber:13 protoDataType:14 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"countryCode" dataType:2 requestOnly:0 fieldNumber:14 protoDataType:13 convertedType:0];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"siriLocale" dataType:2 requestOnly:0 fieldNumber:15 protoDataType:13 convertedType:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"contentRestrictions_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_457];
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"uiScale" dataType:1 requestOnly:0 fieldNumber:17 protoDataType:0 convertedType:0];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"temperatureUnit" dataType:2 requestOnly:0 fieldNumber:18 protoDataType:13 convertedType:0];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"allowUserGeneratedContent" dataType:0 requestOnly:0 fieldNumber:19 protoDataType:12 convertedType:0];
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"censorSpeech" dataType:0 requestOnly:0 fieldNumber:20 protoDataType:12 convertedType:0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"meCard_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_459];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"deviceIdiom" dataType:0 requestOnly:0 fieldNumber:22 protoDataType:4 convertedType:0];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"didPSCFire" dataType:0 requestOnly:0 fieldNumber:23 protoDataType:12 convertedType:0];
  v27[0] = v26;
  v27[1] = v25;
  v27[2] = v24;
  v27[3] = v23;
  v27[4] = v22;
  v27[5] = v21;
  v27[6] = v20;
  v27[7] = v19;
  v27[8] = v18;
  v27[9] = v17;
  v27[10] = v16;
  v27[11] = v15;
  v27[12] = v14;
  v27[13] = v2;
  v27[14] = v13;
  v27[15] = v3;
  v27[16] = v12;
  v27[17] = v4;
  v27[18] = v5;
  v27[19] = v11;
  v27[20] = v6;
  v27[21] = v7;
  v27[22] = v8;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:23];

  return v10;
}

- (BMSiriRequestContext)initWithSessionID:(id)a3 requestID:(id)a4 inputOrigin:(id)a5 responseMode:(id)a6 isEyesFree:(id)a7 isMultiUser:(id)a8 isVoiceTriggerEnabled:(id)a9 isTextToSpeechEnabled:(id)a10 isTriggerlessFollowup:(id)a11 deviceRestrictions:(id)a12 bargeInModes:(id)a13 identifiedUser:(id)a14 encodedLocation:(id)a15 countryCode:(id)a16 siriLocale:(id)a17 contentRestrictions:(id)a18 uiScale:(id)a19 temperatureUnit:(id)a20 allowUserGeneratedContent:(id)a21 censorSpeech:(id)a22 meCard:(id)a23
{
  LODWORD(v24) = 0;
  return -[BMSiriRequestContext initWithSessionID:requestID:inputOrigin:responseMode:isEyesFree:isMultiUser:isVoiceTriggerEnabled:isTextToSpeechEnabled:isTriggerlessFollowup:deviceRestrictions:bargeInModes:identifiedUser:encodedLocation:countryCode:siriLocale:contentRestrictions:uiScale:temperatureUnit:allowUserGeneratedContent:censorSpeech:meCard:deviceIdiom:didPSCFire:](self, "initWithSessionID:requestID:inputOrigin:responseMode:isEyesFree:isMultiUser:isVoiceTriggerEnabled:isTextToSpeechEnabled:isTriggerlessFollowup:deviceRestrictions:bargeInModes:identifiedUser:encodedLocation:countryCode:siriLocale:contentRestrictions:uiScale:temperatureUnit:allowUserGeneratedContent:censorSpeech:meCard:deviceIdiom:didPSCFire:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           v24,
           0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meCard, 0);
  objc_storeStrong((id *)&self->_temperatureUnit, 0);
  objc_storeStrong((id *)&self->_contentRestrictions, 0);
  objc_storeStrong((id *)&self->_siriLocale, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_encodedLocation, 0);
  objc_storeStrong((id *)&self->_identifiedUser, 0);
  objc_storeStrong((id *)&self->_bargeInModes, 0);
  objc_storeStrong((id *)&self->_deviceRestrictions, 0);
  objc_storeStrong((id *)&self->_responseMode, 0);
  objc_storeStrong((id *)&self->_inputOrigin, 0);
  objc_storeStrong((id *)&self->_requestID, 0);

  objc_storeStrong((id *)&self->_sessionID, 0);
}

- (void)setHasDidPSCFire:(BOOL)a3
{
  self->_hasDidPSCFire = a3;
}

- (BOOL)hasDidPSCFire
{
  return self->_hasDidPSCFire;
}

- (BOOL)didPSCFire
{
  return self->_didPSCFire;
}

- (int)deviceIdiom
{
  return self->_deviceIdiom;
}

- (BMSiriRequestContextMeCard)meCard
{
  return self->_meCard;
}

- (void)setHasCensorSpeech:(BOOL)a3
{
  self->_hasCensorSpeech = a3;
}

- (BOOL)hasCensorSpeech
{
  return self->_hasCensorSpeech;
}

- (BOOL)censorSpeech
{
  return self->_censorSpeech;
}

- (void)setHasAllowUserGeneratedContent:(BOOL)a3
{
  self->_hasAllowUserGeneratedContent = a3;
}

- (BOOL)hasAllowUserGeneratedContent
{
  return self->_hasAllowUserGeneratedContent;
}

- (BOOL)allowUserGeneratedContent
{
  return self->_allowUserGeneratedContent;
}

- (NSString)temperatureUnit
{
  return self->_temperatureUnit;
}

- (void)setHasUiScale:(BOOL)a3
{
  self->_hasUiScale = a3;
}

- (BOOL)hasUiScale
{
  return self->_hasUiScale;
}

- (double)uiScale
{
  return self->_uiScale;
}

- (BMSiriRequestContextContentRestriction)contentRestrictions
{
  return self->_contentRestrictions;
}

- (NSString)siriLocale
{
  return self->_siriLocale;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (NSData)encodedLocation
{
  return self->_encodedLocation;
}

- (BMSiriRequestContextUser)identifiedUser
{
  return self->_identifiedUser;
}

- (NSArray)bargeInModes
{
  return self->_bargeInModes;
}

- (NSArray)deviceRestrictions
{
  return self->_deviceRestrictions;
}

- (void)setHasIsTriggerlessFollowup:(BOOL)a3
{
  self->_hasIsTriggerlessFollowup = a3;
}

- (BOOL)hasIsTriggerlessFollowup
{
  return self->_hasIsTriggerlessFollowup;
}

- (BOOL)isTriggerlessFollowup
{
  return self->_isTriggerlessFollowup;
}

- (void)setHasIsTextToSpeechEnabled:(BOOL)a3
{
  self->_hasIsTextToSpeechEnabled = a3;
}

- (BOOL)hasIsTextToSpeechEnabled
{
  return self->_hasIsTextToSpeechEnabled;
}

- (BOOL)isTextToSpeechEnabled
{
  return self->_isTextToSpeechEnabled;
}

- (void)setHasIsVoiceTriggerEnabled:(BOOL)a3
{
  self->_hasIsVoiceTriggerEnabled = a3;
}

- (BOOL)hasIsVoiceTriggerEnabled
{
  return self->_hasIsVoiceTriggerEnabled;
}

- (BOOL)isVoiceTriggerEnabled
{
  return self->_isVoiceTriggerEnabled;
}

- (void)setHasIsMultiUser:(BOOL)a3
{
  self->_hasIsMultiUser = a3;
}

- (BOOL)hasIsMultiUser
{
  return self->_hasIsMultiUser;
}

- (BOOL)isMultiUser
{
  return self->_isMultiUser;
}

- (void)setHasIsEyesFree:(BOOL)a3
{
  self->_hasIsEyesFree = a3;
}

- (BOOL)hasIsEyesFree
{
  return self->_hasIsEyesFree;
}

- (BOOL)isEyesFree
{
  return self->_isEyesFree;
}

- (NSString)responseMode
{
  return self->_responseMode;
}

- (NSString)inputOrigin
{
  return self->_inputOrigin;
}

- (NSString)requestID
{
  return self->_requestID;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(BMSiriRequestContext *)self sessionID];
    uint64_t v7 = [v5 sessionID];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSiriRequestContext *)self sessionID];
      id v10 = [v5 sessionID];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_101;
      }
    }
    v13 = [(BMSiriRequestContext *)self requestID];
    uint64_t v14 = [v5 requestID];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMSiriRequestContext *)self requestID];
      v17 = [v5 requestID];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_101;
      }
    }
    v19 = [(BMSiriRequestContext *)self inputOrigin];
    uint64_t v20 = [v5 inputOrigin];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMSiriRequestContext *)self inputOrigin];
      v23 = [v5 inputOrigin];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_101;
      }
    }
    v25 = [(BMSiriRequestContext *)self responseMode];
    uint64_t v26 = [v5 responseMode];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMSiriRequestContext *)self responseMode];
      v29 = [v5 responseMode];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_101;
      }
    }
    if (-[BMSiriRequestContext hasIsEyesFree](self, "hasIsEyesFree") || [v5 hasIsEyesFree])
    {
      if (![(BMSiriRequestContext *)self hasIsEyesFree]) {
        goto LABEL_101;
      }
      if (![v5 hasIsEyesFree]) {
        goto LABEL_101;
      }
      int v31 = [(BMSiriRequestContext *)self isEyesFree];
      if (v31 != [v5 isEyesFree]) {
        goto LABEL_101;
      }
    }
    if ([(BMSiriRequestContext *)self hasIsMultiUser]
      || [v5 hasIsMultiUser])
    {
      if (![(BMSiriRequestContext *)self hasIsMultiUser]) {
        goto LABEL_101;
      }
      if (![v5 hasIsMultiUser]) {
        goto LABEL_101;
      }
      int v32 = [(BMSiriRequestContext *)self isMultiUser];
      if (v32 != [v5 isMultiUser]) {
        goto LABEL_101;
      }
    }
    if ([(BMSiriRequestContext *)self hasIsVoiceTriggerEnabled]
      || [v5 hasIsVoiceTriggerEnabled])
    {
      if (![(BMSiriRequestContext *)self hasIsVoiceTriggerEnabled]) {
        goto LABEL_101;
      }
      if (![v5 hasIsVoiceTriggerEnabled]) {
        goto LABEL_101;
      }
      int v33 = [(BMSiriRequestContext *)self isVoiceTriggerEnabled];
      if (v33 != [v5 isVoiceTriggerEnabled]) {
        goto LABEL_101;
      }
    }
    if ([(BMSiriRequestContext *)self hasIsTextToSpeechEnabled]
      || [v5 hasIsTextToSpeechEnabled])
    {
      if (![(BMSiriRequestContext *)self hasIsTextToSpeechEnabled]) {
        goto LABEL_101;
      }
      if (![v5 hasIsTextToSpeechEnabled]) {
        goto LABEL_101;
      }
      int v34 = [(BMSiriRequestContext *)self isTextToSpeechEnabled];
      if (v34 != [v5 isTextToSpeechEnabled]) {
        goto LABEL_101;
      }
    }
    if ([(BMSiriRequestContext *)self hasIsTriggerlessFollowup]
      || [v5 hasIsTriggerlessFollowup])
    {
      if (![(BMSiriRequestContext *)self hasIsTriggerlessFollowup]) {
        goto LABEL_101;
      }
      if (![v5 hasIsTriggerlessFollowup]) {
        goto LABEL_101;
      }
      int v35 = [(BMSiriRequestContext *)self isTriggerlessFollowup];
      if (v35 != [v5 isTriggerlessFollowup]) {
        goto LABEL_101;
      }
    }
    v36 = [(BMSiriRequestContext *)self deviceRestrictions];
    uint64_t v37 = [v5 deviceRestrictions];
    if (v36 == (void *)v37)
    {
    }
    else
    {
      v38 = (void *)v37;
      v39 = [(BMSiriRequestContext *)self deviceRestrictions];
      v40 = [v5 deviceRestrictions];
      int v41 = [v39 isEqual:v40];

      if (!v41) {
        goto LABEL_101;
      }
    }
    v42 = [(BMSiriRequestContext *)self bargeInModes];
    uint64_t v43 = [v5 bargeInModes];
    if (v42 == (void *)v43)
    {
    }
    else
    {
      v44 = (void *)v43;
      v45 = [(BMSiriRequestContext *)self bargeInModes];
      v46 = [v5 bargeInModes];
      int v47 = [v45 isEqual:v46];

      if (!v47) {
        goto LABEL_101;
      }
    }
    v48 = [(BMSiriRequestContext *)self identifiedUser];
    uint64_t v49 = [v5 identifiedUser];
    if (v48 == (void *)v49)
    {
    }
    else
    {
      v50 = (void *)v49;
      v51 = [(BMSiriRequestContext *)self identifiedUser];
      v52 = [v5 identifiedUser];
      int v53 = [v51 isEqual:v52];

      if (!v53) {
        goto LABEL_101;
      }
    }
    v54 = [(BMSiriRequestContext *)self encodedLocation];
    uint64_t v55 = [v5 encodedLocation];
    if (v54 == (void *)v55)
    {
    }
    else
    {
      v56 = (void *)v55;
      v57 = [(BMSiriRequestContext *)self encodedLocation];
      v58 = [v5 encodedLocation];
      int v59 = [v57 isEqual:v58];

      if (!v59) {
        goto LABEL_101;
      }
    }
    v60 = [(BMSiriRequestContext *)self countryCode];
    uint64_t v61 = [v5 countryCode];
    if (v60 == (void *)v61)
    {
    }
    else
    {
      v62 = (void *)v61;
      v63 = [(BMSiriRequestContext *)self countryCode];
      v64 = [v5 countryCode];
      int v65 = [v63 isEqual:v64];

      if (!v65) {
        goto LABEL_101;
      }
    }
    v66 = [(BMSiriRequestContext *)self siriLocale];
    uint64_t v67 = [v5 siriLocale];
    if (v66 == (void *)v67)
    {
    }
    else
    {
      v68 = (void *)v67;
      v69 = [(BMSiriRequestContext *)self siriLocale];
      v70 = [v5 siriLocale];
      int v71 = [v69 isEqual:v70];

      if (!v71) {
        goto LABEL_101;
      }
    }
    v72 = [(BMSiriRequestContext *)self contentRestrictions];
    uint64_t v73 = [v5 contentRestrictions];
    if (v72 == (void *)v73)
    {
    }
    else
    {
      v74 = (void *)v73;
      v75 = [(BMSiriRequestContext *)self contentRestrictions];
      v76 = [v5 contentRestrictions];
      int v77 = [v75 isEqual:v76];

      if (!v77) {
        goto LABEL_101;
      }
    }
    if (-[BMSiriRequestContext hasUiScale](self, "hasUiScale") || [v5 hasUiScale])
    {
      if (![(BMSiriRequestContext *)self hasUiScale]) {
        goto LABEL_101;
      }
      if (![v5 hasUiScale]) {
        goto LABEL_101;
      }
      [(BMSiriRequestContext *)self uiScale];
      double v79 = v78;
      [v5 uiScale];
      if (v79 != v80) {
        goto LABEL_101;
      }
    }
    v81 = [(BMSiriRequestContext *)self temperatureUnit];
    uint64_t v82 = [v5 temperatureUnit];
    if (v81 == (void *)v82)
    {
    }
    else
    {
      v83 = (void *)v82;
      v84 = [(BMSiriRequestContext *)self temperatureUnit];
      v85 = [v5 temperatureUnit];
      int v86 = [v84 isEqual:v85];

      if (!v86) {
        goto LABEL_101;
      }
    }
    if ([(BMSiriRequestContext *)self hasAllowUserGeneratedContent]
      || [v5 hasAllowUserGeneratedContent])
    {
      if (![(BMSiriRequestContext *)self hasAllowUserGeneratedContent]) {
        goto LABEL_101;
      }
      if (![v5 hasAllowUserGeneratedContent]) {
        goto LABEL_101;
      }
      int v87 = [(BMSiriRequestContext *)self allowUserGeneratedContent];
      if (v87 != [v5 allowUserGeneratedContent]) {
        goto LABEL_101;
      }
    }
    if ([(BMSiriRequestContext *)self hasCensorSpeech]
      || [v5 hasCensorSpeech])
    {
      if (![(BMSiriRequestContext *)self hasCensorSpeech]) {
        goto LABEL_101;
      }
      if (![v5 hasCensorSpeech]) {
        goto LABEL_101;
      }
      int v88 = [(BMSiriRequestContext *)self censorSpeech];
      if (v88 != [v5 censorSpeech]) {
        goto LABEL_101;
      }
    }
    v89 = [(BMSiriRequestContext *)self meCard];
    uint64_t v90 = [v5 meCard];
    if (v89 == (void *)v90)
    {
    }
    else
    {
      v91 = (void *)v90;
      v92 = [(BMSiriRequestContext *)self meCard];
      v93 = [v5 meCard];
      int v94 = [v92 isEqual:v93];

      if (!v94) {
        goto LABEL_101;
      }
    }
    int v95 = [(BMSiriRequestContext *)self deviceIdiom];
    if (v95 == [v5 deviceIdiom])
    {
      if (![(BMSiriRequestContext *)self hasDidPSCFire]
        && ![v5 hasDidPSCFire])
      {
        LOBYTE(v12) = 1;
        goto LABEL_102;
      }
      if ([(BMSiriRequestContext *)self hasDidPSCFire]
        && [v5 hasDidPSCFire])
      {
        BOOL v96 = [(BMSiriRequestContext *)self didPSCFire];
        int v12 = v96 ^ [v5 didPSCFire] ^ 1;
LABEL_102:

        goto LABEL_103;
      }
    }
LABEL_101:
    LOBYTE(v12) = 0;
    goto LABEL_102;
  }
  LOBYTE(v12) = 0;
LABEL_103:

  return v12;
}

- (id)jsonDictionary
{
  v81[23] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMSiriRequestContext *)self sessionID];
  uint64_t v4 = [(BMSiriRequestContext *)self requestID];
  uint64_t v5 = [(BMSiriRequestContext *)self inputOrigin];
  v6 = [(BMSiriRequestContext *)self responseMode];
  if ([(BMSiriRequestContext *)self hasIsEyesFree])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriRequestContext isEyesFree](self, "isEyesFree"));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = 0;
  }
  if ([(BMSiriRequestContext *)self hasIsMultiUser])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriRequestContext isMultiUser](self, "isMultiUser"));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = 0;
  }
  if ([(BMSiriRequestContext *)self hasIsVoiceTriggerEnabled])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriRequestContext isVoiceTriggerEnabled](self, "isVoiceTriggerEnabled"));
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = 0;
  }
  if ([(BMSiriRequestContext *)self hasIsTextToSpeechEnabled])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriRequestContext isTextToSpeechEnabled](self, "isTextToSpeechEnabled"));
    id v78 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v78 = 0;
  }
  if ([(BMSiriRequestContext *)self hasIsTriggerlessFollowup])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriRequestContext isTriggerlessFollowup](self, "isTriggerlessFollowup"));
    id v77 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v77 = 0;
  }
  v76 = [(BMSiriRequestContext *)self _deviceRestrictionsJSONArray];
  v75 = [(BMSiriRequestContext *)self _bargeInModesJSONArray];
  id v10 = [(BMSiriRequestContext *)self identifiedUser];
  v74 = [v10 jsonDictionary];

  int v11 = [(BMSiriRequestContext *)self encodedLocation];
  uint64_t v73 = [v11 base64EncodedStringWithOptions:0];

  v72 = [(BMSiriRequestContext *)self countryCode];
  int v71 = [(BMSiriRequestContext *)self siriLocale];
  int v12 = [(BMSiriRequestContext *)self contentRestrictions];
  v70 = [v12 jsonDictionary];

  id v79 = 0;
  if ([(BMSiriRequestContext *)self hasUiScale])
  {
    [(BMSiriRequestContext *)self uiScale];
    if (fabs(v13) == INFINITY)
    {
      id v79 = 0;
    }
    else
    {
      [(BMSiriRequestContext *)self uiScale];
      uint64_t v14 = NSNumber;
      [(BMSiriRequestContext *)self uiScale];
      objc_msgSend(v14, "numberWithDouble:");
      id v79 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v69 = [(BMSiriRequestContext *)self temperatureUnit];
  if ([(BMSiriRequestContext *)self hasAllowUserGeneratedContent])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriRequestContext allowUserGeneratedContent](self, "allowUserGeneratedContent"));
    id v68 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v68 = 0;
  }
  if ([(BMSiriRequestContext *)self hasCensorSpeech])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriRequestContext censorSpeech](self, "censorSpeech"));
    id v67 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v67 = 0;
  }
  v15 = [(BMSiriRequestContext *)self meCard];
  v66 = [v15 jsonDictionary];

  int v65 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriRequestContext deviceIdiom](self, "deviceIdiom"));
  if ([(BMSiriRequestContext *)self hasDidPSCFire])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriRequestContext didPSCFire](self, "didPSCFire"));
    id v64 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v64 = 0;
  }
  v80[0] = @"sessionID";
  uint64_t v16 = v3;
  if (!v3)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v56 = (void *)v16;
  v81[0] = v16;
  v80[1] = @"requestID";
  uint64_t v17 = v4;
  if (!v4)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v55 = (void *)v17;
  v81[1] = v17;
  v80[2] = @"inputOrigin";
  uint64_t v18 = v5;
  if (!v5)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v54 = (void *)v18;
  v81[2] = v18;
  v80[3] = @"responseMode";
  uint64_t v19 = (uint64_t)v6;
  if (!v6)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  int v53 = (void *)v19;
  v81[3] = v19;
  v80[4] = @"isEyesFree";
  uint64_t v20 = (uint64_t)v7;
  if (!v7)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v52 = (void *)v20;
  v81[4] = v20;
  v80[5] = @"isMultiUser";
  uint64_t v21 = (uint64_t)v8;
  if (!v8)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v51 = (void *)v21;
  v81[5] = v21;
  v80[6] = @"isVoiceTriggerEnabled";
  uint64_t v22 = (uint64_t)v9;
  if (!v9)
  {
    uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v50 = (void *)v22;
  v81[6] = v22;
  v80[7] = @"isTextToSpeechEnabled";
  uint64_t v23 = (uint64_t)v78;
  if (!v78)
  {
    uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v81[7] = v23;
  v80[8] = @"isTriggerlessFollowup";
  uint64_t v24 = (uint64_t)v77;
  if (!v77)
  {
    uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v81[8] = v24;
  v80[9] = @"deviceRestrictions";
  uint64_t v25 = (uint64_t)v76;
  if (!v76)
  {
    uint64_t v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v81[9] = v25;
  v80[10] = @"bargeInModes";
  uint64_t v26 = (uint64_t)v75;
  if (!v75)
  {
    uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
  }
  v58 = (void *)v5;
  v60 = (void *)v26;
  v81[10] = v26;
  v80[11] = @"identifiedUser";
  uint64_t v27 = (uint64_t)v74;
  if (!v74)
  {
    uint64_t v27 = [MEMORY[0x1E4F1CA98] null];
  }
  v28 = (void *)v4;
  int v59 = (void *)v27;
  v81[11] = v27;
  v80[12] = @"encodedLocation";
  uint64_t v29 = (uint64_t)v73;
  if (!v73)
  {
    uint64_t v29 = [MEMORY[0x1E4F1CA98] null];
  }
  int v30 = (void *)v29;
  v81[12] = v29;
  v80[13] = @"countryCode";
  uint64_t v31 = (uint64_t)v72;
  if (!v72)
  {
    uint64_t v31 = [MEMORY[0x1E4F1CA98] null];
  }
  v46 = (void *)v31;
  v81[13] = v31;
  v80[14] = @"siriLocale";
  uint64_t v32 = (uint64_t)v71;
  if (!v71)
  {
    uint64_t v32 = [MEMORY[0x1E4F1CA98] null];
  }
  v45 = (void *)v32;
  v81[14] = v32;
  v80[15] = @"contentRestrictions";
  uint64_t v33 = (uint64_t)v70;
  if (!v70)
  {
    uint64_t v33 = [MEMORY[0x1E4F1CA98] null];
  }
  v63 = (void *)v3;
  v44 = (void *)v33;
  v81[15] = v33;
  v80[16] = @"uiScale";
  uint64_t v34 = (uint64_t)v79;
  if (!v79)
  {
    uint64_t v34 = [MEMORY[0x1E4F1CA98] null];
  }
  v62 = v8;
  uint64_t v43 = (void *)v34;
  v81[16] = v34;
  v80[17] = @"temperatureUnit";
  int v35 = v69;
  if (!v69)
  {
    int v35 = [MEMORY[0x1E4F1CA98] null];
  }
  v48 = (void *)v24;
  v81[17] = v35;
  v80[18] = @"allowUserGeneratedContent";
  v36 = v68;
  if (!v68)
  {
    v36 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v61 = v9;
  v81[18] = v36;
  v80[19] = @"censorSpeech";
  uint64_t v37 = v67;
  if (!v67)
  {
    uint64_t v37 = [MEMORY[0x1E4F1CA98] null];
  }
  int v47 = (void *)v25;
  v81[19] = v37;
  v80[20] = @"meCard";
  v38 = v66;
  if (!v66)
  {
    v38 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v49 = (void *)v23;
  v81[20] = v38;
  v80[21] = @"deviceIdiom";
  v39 = v65;
  if (!v65)
  {
    v39 = [MEMORY[0x1E4F1CA98] null];
  }
  v81[21] = v39;
  v80[22] = @"didPSCFire";
  v40 = v64;
  if (!v64)
  {
    v40 = [MEMORY[0x1E4F1CA98] null];
  }
  v81[22] = v40;
  id v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v81 forKeys:v80 count:23];
  if (!v64) {

  }
  int v41 = v30;
  if (!v65)
  {

    int v41 = v30;
  }
  if (!v66)
  {

    int v41 = v30;
  }
  if (!v67)
  {

    int v41 = v30;
  }
  if (!v68)
  {

    int v41 = v30;
  }
  if (!v69)
  {

    int v41 = v30;
  }
  if (!v79)
  {

    int v41 = v30;
  }
  if (!v70)
  {

    int v41 = v30;
  }
  if (!v71)
  {

    int v41 = v30;
  }
  if (!v72)
  {

    int v41 = v30;
  }
  if (!v73) {

  }
  if (!v74) {
  if (!v75)
  }

  if (!v76) {
  if (!v77)
  }

  if (v78)
  {
    if (v61) {
      goto LABEL_107;
    }
  }
  else
  {

    if (v61)
    {
LABEL_107:
      if (v62) {
        goto LABEL_108;
      }
      goto LABEL_118;
    }
  }

  if (v62)
  {
LABEL_108:
    if (v7) {
      goto LABEL_109;
    }
    goto LABEL_119;
  }
LABEL_118:

  if (v7)
  {
LABEL_109:
    if (v6) {
      goto LABEL_110;
    }
    goto LABEL_120;
  }
LABEL_119:

  if (v6)
  {
LABEL_110:
    if (v58) {
      goto LABEL_111;
    }
    goto LABEL_121;
  }
LABEL_120:

  if (v58)
  {
LABEL_111:
    if (v28) {
      goto LABEL_112;
    }
LABEL_122:

    if (v63) {
      goto LABEL_113;
    }
    goto LABEL_123;
  }
LABEL_121:

  if (!v28) {
    goto LABEL_122;
  }
LABEL_112:
  if (v63) {
    goto LABEL_113;
  }
LABEL_123:

LABEL_113:

  return v57;
}

- (id)_bargeInModesJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [(BMSiriRequestContext *)self bargeInModes];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObject:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_deviceRestrictionsJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [(BMSiriRequestContext *)self deviceRestrictions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObject:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BMSiriRequestContext)initWithJSONDictionary:(id)a3 error:(id *)p_isa
{
  v409[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"sessionID"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
LABEL_4:
    id v9 = [v6 objectForKeyedSubscript:@"requestID"];
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v335 = 0;
      v336 = self;
      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v336 = self;
      id v335 = v9;
LABEL_7:
      uint64_t v10 = [v6 objectForKeyedSubscript:@"inputOrigin"];
      v338 = (void *)v10;
      if (!v10 || (long long v11 = (void *)v10, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v332 = 0;
        v333 = p_isa;
        goto LABEL_10;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v333 = p_isa;
        id v332 = v11;
LABEL_10:
        uint64_t v12 = [v6 objectForKeyedSubscript:@"responseMode"];
        v331 = v7;
        v334 = (void *)v12;
        if (!v12 || (long long v13 = (void *)v12, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v14 = 0;
          goto LABEL_13;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v14 = v13;
LABEL_13:
          uint64_t v15 = [v6 objectForKeyedSubscript:@"isEyesFree"];
          v329 = (void *)v15;
          if (!v15 || (uint64_t v16 = (void *)v15, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            id v330 = 0;
            goto LABEL_16;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v330 = v16;
LABEL_16:
            uint64_t v17 = [v6 objectForKeyedSubscript:@"isMultiUser"];
            v327 = (void *)v17;
            if (!v17 || (uint64_t v18 = (void *)v17, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              id v19 = 0;
LABEL_19:
              id v20 = [v6 objectForKeyedSubscript:@"isVoiceTriggerEnabled"];
              id v325 = v20;
              id v323 = v14;
              if (!v20)
              {
LABEL_40:
                uint64_t v39 = [v6 objectForKeyedSubscript:@"isTextToSpeechEnabled"];
                v326 = v20;
                v320 = v9;
                v321 = (void *)v39;
                if (v39 && (v40 = (void *)v39, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    if (!v333)
                    {
                      id v322 = 0;
                      p_isa = 0;
                      uint64_t v26 = v335;
                      self = v336;
                      int v35 = v332;
                      id v67 = v325;
                      goto LABEL_245;
                    }
                    id v110 = v8;
                    id v111 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v112 = *MEMORY[0x1E4F502C8];
                    uint64_t v394 = *MEMORY[0x1E4F28568];
                    v109 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isTextToSpeechEnabled"];
                    v395 = v109;
                    v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v395 forKeys:&v394 count:1];
                    v113 = v111;
                    id v8 = v110;
                    id v114 = (id)[v113 initWithDomain:v112 code:2 userInfo:v42];
                    id v322 = 0;
                    p_isa = 0;
                    id *v333 = v114;
                    goto LABEL_120;
                  }
                  id v322 = v40;
                }
                else
                {
                  id v322 = 0;
                }
                uint64_t v41 = [v6 objectForKeyedSubscript:@"isTriggerlessFollowup"];
                v324 = (void *)v41;
                if (!v41 || (v42 = (void *)v41, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  id v308 = 0;
                  id v310 = v8;
                  goto LABEL_46;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v310 = v8;
                  id v308 = v42;
LABEL_46:
                  uint64_t v43 = [v6 objectForKeyedSubscript:@"deviceRestrictions"];
                  v44 = [MEMORY[0x1E4F1CA98] null];
                  int v45 = [v43 isEqual:v44];

                  if (v45)
                  {

                    uint64_t v43 = 0;
                  }
                  else
                  {
                    id v8 = v310;
                    if (v43)
                    {
                      objc_opt_class();
                      id obj = v43;
                      v42 = v324;
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        if (v333)
                        {
                          id v132 = objc_alloc(MEMORY[0x1E4F28C58]);
                          uint64_t v133 = *MEMORY[0x1E4F502C8];
                          uint64_t v390 = *MEMORY[0x1E4F28568];
                          v341 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"deviceRestrictions"];
                          v391 = v341;
                          id v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v391 forKeys:&v390 count:1];
                          v134 = v132;
                          v42 = v324;
                          uint64_t v135 = v133;
                          self = v336;
                          p_isa = 0;
                          id *v333 = (id)[v134 initWithDomain:v135 code:2 userInfo:v64];
                          int v35 = v332;
                          id v67 = v325;
                          v109 = v308;
                          goto LABEL_242;
                        }
                        p_isa = 0;
                        uint64_t v26 = v335;
                        self = v336;
                        int v35 = v332;
                        id v67 = v325;
                        v109 = v308;
                        goto LABEL_243;
                      }
LABEL_54:
                      v341 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v43, "count"));
                      long long v350 = 0u;
                      long long v351 = 0u;
                      long long v352 = 0u;
                      long long v353 = 0u;
                      id obj = v43;
                      uint64_t v58 = [obj countByEnumeratingWithState:&v350 objects:v389 count:16];
                      if (v58)
                      {
                        uint64_t v59 = v58;
                        uint64_t v60 = *(void *)v351;
                        do
                        {
                          for (uint64_t i = 0; i != v59; ++i)
                          {
                            if (*(void *)v351 != v60) {
                              objc_enumerationMutation(obj);
                            }
                            v62 = *(void **)(*((void *)&v350 + 1) + 8 * i);
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              if (v333)
                              {
                                id v93 = objc_alloc(MEMORY[0x1E4F28C58]);
                                uint64_t v94 = *MEMORY[0x1E4F502C8];
                                uint64_t v387 = *MEMORY[0x1E4F28568];
                                v328 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"deviceRestrictions"];
                                v388 = v328;
                                uint64_t v95 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v388 forKeys:&v387 count:1];
                                BOOL v96 = v93;
                                uint64_t v97 = v94;
                                goto LABEL_82;
                              }
LABEL_87:
                              p_isa = 0;
                              id v64 = obj;
                              self = v336;
                              v109 = v308;
                              id v8 = v310;
                              int v35 = v332;
                              v42 = v324;
                              id v67 = v325;
                              goto LABEL_242;
                            }
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) == 0)
                            {
                              if (!v333) {
                                goto LABEL_87;
                              }
                              id v107 = objc_alloc(MEMORY[0x1E4F28C58]);
                              uint64_t v108 = *MEMORY[0x1E4F502C8];
                              uint64_t v385 = *MEMORY[0x1E4F28568];
                              v328 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"deviceRestrictions"];
                              v386 = v328;
                              uint64_t v95 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v386 forKeys:&v385 count:1];
                              BOOL v96 = v107;
                              uint64_t v97 = v108;
LABEL_82:
                              v307 = (void *)v95;
                              id v8 = v310;
                              int v35 = v332;
                              p_isa = 0;
                              id *v333 = (id)objc_msgSend(v96, "initWithDomain:code:userInfo:", v97, 2);
                              id v64 = obj;
                              self = v336;
LABEL_83:
                              v42 = v324;
                              id v67 = v325;
                              v109 = v308;
                              goto LABEL_241;
                            }
                            id v63 = v62;
                            [v341 addObject:v63];
                          }
                          uint64_t v59 = [obj countByEnumeratingWithState:&v350 objects:v389 count:16];
                          v42 = v324;
                        }
                        while (v59);
                      }

                      id v64 = [v6 objectForKeyedSubscript:@"bargeInModes"];
                      int v65 = [MEMORY[0x1E4F1CA98] null];
                      int v66 = [v64 isEqual:v65];

                      id v67 = v325;
                      if (v66)
                      {
                        id v306 = v19;

                        id v64 = 0;
                      }
                      else
                      {
                        self = v336;
                        v109 = v308;
                        if (v64)
                        {
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                          {
                            id v304 = v64;
                            if (!v333)
                            {
                              p_isa = 0;
                              id v8 = v310;
                              int v35 = v332;
                              goto LABEL_242;
                            }
                            id v144 = objc_alloc(MEMORY[0x1E4F28C58]);
                            uint64_t v145 = *MEMORY[0x1E4F502C8];
                            uint64_t v383 = *MEMORY[0x1E4F28568];
                            v328 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"bargeInModes"];
                            v384 = v328;
                            uint64_t v146 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v384 forKeys:&v383 count:1];
                            v147 = v144;
                            self = v336;
                            v307 = (void *)v146;
                            p_isa = 0;
                            id *v333 = (id)objc_msgSend(v147, "initWithDomain:code:userInfo:", v145, 2);
                            id v8 = v310;
                            int v35 = v332;
                            goto LABEL_125;
                          }
                        }
                        id v306 = v19;
                      }
                      v328 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v64, "count"));
                      long long v346 = 0u;
                      long long v347 = 0u;
                      long long v348 = 0u;
                      long long v349 = 0u;
                      id v64 = v64;
                      uint64_t v123 = [v64 countByEnumeratingWithState:&v346 objects:v382 count:16];
                      if (!v123) {
                        goto LABEL_104;
                      }
                      uint64_t v124 = v123;
                      uint64_t v125 = *(void *)v347;
LABEL_97:
                      v126 = v64;
                      uint64_t v127 = 0;
                      while (1)
                      {
                        if (*(void *)v347 != v125) {
                          objc_enumerationMutation(v126);
                        }
                        v128 = *(void **)(*((void *)&v346 + 1) + 8 * v127);
                        objc_opt_class();
                        if (objc_opt_isKindOfClass()) {
                          break;
                        }
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                        {
                          if (v333)
                          {
                            id v136 = objc_alloc(MEMORY[0x1E4F28C58]);
                            uint64_t v137 = *MEMORY[0x1E4F502C8];
                            uint64_t v378 = *MEMORY[0x1E4F28568];
                            v305 = (BMSiriRequestContextUser *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"bargeInModes"];
                            v379 = v305;
                            v138 = (void *)MEMORY[0x1E4F1C9E8];
                            v139 = &v379;
                            v140 = &v378;
                            goto LABEL_117;
                          }
                          goto LABEL_121;
                        }
                        id v129 = v128;
                        [v328 addObject:v129];

                        if (v124 == ++v127)
                        {
                          id v64 = v126;
                          uint64_t v124 = [v126 countByEnumeratingWithState:&v346 objects:v382 count:16];
                          v42 = v324;
                          id v67 = v325;
                          if (v124) {
                            goto LABEL_97;
                          }
LABEL_104:

                          uint64_t v130 = [v6 objectForKeyedSubscript:@"identifiedUser"];
                          id v304 = v64;
                          v307 = (void *)v130;
                          if (!v130)
                          {
                            v305 = 0;
                            self = v336;
                            v109 = v308;
                            id v8 = v310;
                            goto LABEL_127;
                          }
                          v131 = (void *)v130;
                          objc_opt_class();
                          self = v336;
                          v109 = v308;
                          id v8 = v310;
                          if (objc_opt_isKindOfClass())
                          {
                            v305 = 0;
LABEL_127:
                            uint64_t v148 = [v6 objectForKeyedSubscript:@"encodedLocation"];
                            v337 = self;
                            v302 = (void *)v148;
                            if (v148)
                            {
                              v149 = (void *)v148;
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) == 0)
                              {
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  id v303 = v149;
                                  goto LABEL_130;
                                }
                                if (v333)
                                {
                                  id v181 = objc_alloc(MEMORY[0x1E4F28C58]);
                                  id v311 = v8;
                                  uint64_t v182 = *MEMORY[0x1E4F502C8];
                                  uint64_t v374 = *MEMORY[0x1E4F28568];
                                  id v183 = [NSString alloc];
                                  uint64_t v272 = objc_opt_class();
                                  v184 = v183;
                                  v42 = v324;
                                  id v67 = v325;
                                  id v301 = (id)[v184 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSData", v272, @"encodedLocation"];
                                  id v375 = v301;
                                  uint64_t v185 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v375 forKeys:&v374 count:1];
                                  v186 = v181;
                                  self = v337;
                                  uint64_t v187 = v182;
                                  id v8 = v311;
                                  id v64 = v304;
                                  v300 = (void *)v185;
                                  id v303 = 0;
                                  p_isa = 0;
                                  id *v333 = (id)objc_msgSend(v186, "initWithDomain:code:userInfo:", v187, 2);
                                  int v35 = v332;
                                  goto LABEL_238;
                                }
                                id v143 = v109;
                                id v303 = 0;
                                p_isa = 0;
                                int v35 = v332;
                                goto LABEL_239;
                              }
                            }
                            id v303 = 0;
LABEL_130:
                            uint64_t v150 = [v6 objectForKeyedSubscript:@"countryCode"];
                            v300 = (void *)v150;
                            if (v150 && (v151 = (void *)v150, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                            {
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                id v301 = v151;
                                id v64 = v304;
                                goto LABEL_133;
                              }
                              if (!v333)
                              {
                                id v301 = 0;
                                p_isa = 0;
                                int v35 = v332;
                                id v64 = v304;
                                goto LABEL_238;
                              }
                              id v188 = objc_alloc(MEMORY[0x1E4F28C58]);
                              id v312 = v8;
                              uint64_t v189 = *MEMORY[0x1E4F502C8];
                              uint64_t v372 = *MEMORY[0x1E4F28568];
                              id v190 = [NSString alloc];
                              uint64_t v273 = objc_opt_class();
                              v191 = v190;
                              v42 = v324;
                              id v67 = v325;
                              v192 = (void *)[v191 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v273, @"countryCode"];
                              v373 = v192;
                              uint64_t v193 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v373 forKeys:&v372 count:1];
                              uint64_t v194 = v189;
                              id v8 = v312;
                              v299 = (void *)v193;
                              id v301 = 0;
                              p_isa = 0;
                              id *v333 = (id)objc_msgSend(v188, "initWithDomain:code:userInfo:", v194, 2);
                            }
                            else
                            {
                              id v301 = 0;
LABEL_133:
                              uint64_t v152 = [v6 objectForKeyedSubscript:@"siriLocale"];
                              v299 = (void *)v152;
                              if (!v152 || (v153 = (void *)v152, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                              {
                                id v298 = 0;
LABEL_136:
                                v154 = [v6 objectForKeyedSubscript:@"contentRestrictions"];
                                if (!v154 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                {
                                  v294 = v154;
                                  uint64_t v297 = 0;
LABEL_139:
                                  uint64_t v155 = [v6 objectForKeyedSubscript:@"uiScale"];
                                  v295 = (void *)v155;
                                  if (v155)
                                  {
                                    v156 = (void *)v155;
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) == 0)
                                    {
                                      objc_opt_class();
                                      if (objc_opt_isKindOfClass())
                                      {
                                        id v293 = v156;
                                        goto LABEL_142;
                                      }
                                      if (v333)
                                      {
                                        id v210 = objc_alloc(MEMORY[0x1E4F28C58]);
                                        id v315 = v8;
                                        uint64_t v211 = *MEMORY[0x1E4F502C8];
                                        uint64_t v366 = *MEMORY[0x1E4F28568];
                                        id v212 = [NSString alloc];
                                        uint64_t v275 = objc_opt_class();
                                        v213 = v212;
                                        v42 = v324;
                                        id v67 = v325;
                                        id v296 = (id)[v213 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v275, @"uiScale"];
                                        id v367 = v296;
                                        uint64_t v214 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v367 forKeys:&v366 count:1];
                                        v215 = v210;
                                        self = v337;
                                        uint64_t v216 = v211;
                                        id v8 = v315;
                                        id v64 = v304;
                                        v292 = (void *)v214;
                                        v217 = 0;
                                        p_isa = 0;
                                        id *v333 = (id)objc_msgSend(v215, "initWithDomain:code:userInfo:", v216, 2);
                                        int v35 = v332;
                                        goto LABEL_232;
                                      }
                                      v217 = 0;
                                      p_isa = 0;
                                      int v35 = v332;
                                      goto LABEL_233;
                                    }
                                  }
                                  id v293 = 0;
LABEL_142:
                                  uint64_t v157 = [v6 objectForKeyedSubscript:@"temperatureUnit"];
                                  v292 = (void *)v157;
                                  if (v157
                                    && (v158 = (void *)v157, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                  {
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      id v296 = v158;
                                      self = v337;
                                      id v64 = v304;
                                      goto LABEL_145;
                                    }
                                    if (!v333)
                                    {
                                      id v296 = 0;
                                      p_isa = 0;
                                      int v35 = v332;
                                      self = v337;
                                      id v64 = v304;
                                      v217 = v293;
                                      goto LABEL_232;
                                    }
                                    id v218 = objc_alloc(MEMORY[0x1E4F28C58]);
                                    id v316 = v8;
                                    uint64_t v219 = *MEMORY[0x1E4F502C8];
                                    uint64_t v364 = *MEMORY[0x1E4F28568];
                                    id v220 = [NSString alloc];
                                    uint64_t v276 = objc_opt_class();
                                    v221 = v220;
                                    v42 = v324;
                                    id v67 = v325;
                                    id v291 = (id)[v221 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v276, @"temperatureUnit"];
                                    id v365 = v291;
                                    uint64_t v222 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v365 forKeys:&v364 count:1];
                                    uint64_t v223 = v219;
                                    id v8 = v316;
                                    v290 = (void *)v222;
                                    id v296 = 0;
                                    p_isa = 0;
                                    id *v333 = (id)objc_msgSend(v218, "initWithDomain:code:userInfo:", v223, 2);
                                    int v35 = v332;
                                    self = v337;
                                    id v64 = v304;
                                  }
                                  else
                                  {
                                    id v296 = 0;
LABEL_145:
                                    uint64_t v159 = [v6 objectForKeyedSubscript:@"allowUserGeneratedContent"];
                                    v290 = (void *)v159;
                                    if (!v159
                                      || (v160 = (void *)v159, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                    {
                                      id v291 = 0;
LABEL_148:
                                      uint64_t v161 = [v6 objectForKeyedSubscript:@"censorSpeech"];
                                      v288 = (void *)v161;
                                      if (!v161
                                        || (v162 = (void *)v161, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                      {
                                        id v289 = 0;
LABEL_151:
                                        v163 = [v6 objectForKeyedSubscript:@"meCard"];
                                        if (!v163 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                        {
                                          v281 = v163;
                                          v285 = 0;
LABEL_154:
                                          uint64_t v164 = [v6 objectForKeyedSubscript:@"deviceIdiom"];
                                          v282 = (void *)v164;
                                          if (!v164
                                            || (v165 = (void *)v164,
                                                objc_opt_class(),
                                                (objc_opt_isKindOfClass() & 1) != 0))
                                          {
                                            id v284 = 0;
LABEL_222:
                                            uint64_t v246 = [v6 objectForKeyedSubscript:@"didPSCFire"];
                                            v283 = (void *)v246;
                                            if (!v246
                                              || (v247 = (void *)v246,
                                                  objc_opt_class(),
                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                            {
                                              id v248 = 0;
                                              int v35 = v332;
                                              goto LABEL_225;
                                            }
                                            objc_opt_class();
                                            int v35 = v332;
                                            if (objc_opt_isKindOfClass())
                                            {
                                              id v248 = v247;
LABEL_225:
                                              v249 = v248;
                                              LODWORD(v280) = [v284 intValue];
                                              self = objc_retain(-[BMSiriRequestContext initWithSessionID:requestID:inputOrigin:responseMode:isEyesFree:isMultiUser:isVoiceTriggerEnabled:isTextToSpeechEnabled:isTriggerlessFollowup:deviceRestrictions:bargeInModes:identifiedUser:encodedLocation:countryCode:siriLocale:contentRestrictions:uiScale:temperatureUnit:allowUserGeneratedContent:censorSpeech:meCard:deviceIdiom:didPSCFire:](self, "initWithSessionID:requestID:inputOrigin:responseMode:isEyesFree:isMultiUser:isVoiceTriggerEnabled:isTextToSpeechEnabled:isTriggerlessFollowup:deviceRestrictions:bargeInModes:identifiedUser:encodedLocation:countryCode:siriLocale:contentRestrictions:uiScale:temperatureUnit:allowUserGeneratedContent:censorSpeech:meCard:deviceIdiom:didPSCFire:", v8, v335, v35, v323, v330, v306, v326, v322, v109, v341, v328,
                                                         v305,
                                                         v303,
                                                         v301,
                                                         v298,
                                                         v297,
                                                         v293,
                                                         v296,
                                                         v291,
                                                         v289,
                                                         v285,
                                                         v280,
                                                         v248));
                                              p_isa = (id *)&self->super.super.isa;
LABEL_226:

LABEL_227:
                                              v163 = v281;
LABEL_228:

                                              goto LABEL_229;
                                            }
                                            if (v333)
                                            {
                                              id v251 = objc_alloc(MEMORY[0x1E4F28C58]);
                                              id v252 = v8;
                                              uint64_t v253 = *MEMORY[0x1E4F502C8];
                                              uint64_t v354 = *MEMORY[0x1E4F28568];
                                              v254 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"didPSCFire"];
                                              v355 = v254;
                                              v255 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v355 forKeys:&v354 count:1];
                                              v256 = v251;
                                              self = v337;
                                              uint64_t v257 = v253;
                                              id v8 = v252;
                                              id v67 = v325;
                                              id *v333 = (id)[v256 initWithDomain:v257 code:2 userInfo:v255];

                                              v42 = v324;
                                            }
                                            v249 = 0;
                                            p_isa = 0;
LABEL_269:
                                            id v64 = v304;
                                            goto LABEL_226;
                                          }
                                          objc_opt_class();
                                          if (objc_opt_isKindOfClass())
                                          {
                                            id v284 = v165;
                                          }
                                          else
                                          {
                                            objc_opt_class();
                                            if ((objc_opt_isKindOfClass() & 1) == 0)
                                            {
                                              if (!v333)
                                              {
                                                id v284 = 0;
                                                p_isa = 0;
                                                v109 = v308;
                                                int v35 = v332;
                                                id v67 = v325;
                                                id v64 = v304;
                                                goto LABEL_227;
                                              }
                                              id v258 = objc_alloc(MEMORY[0x1E4F28C58]);
                                              uint64_t v259 = *MEMORY[0x1E4F502C8];
                                              uint64_t v356 = *MEMORY[0x1E4F28568];
                                              id v260 = [NSString alloc];
                                              uint64_t v279 = objc_opt_class();
                                              v261 = v260;
                                              v42 = v324;
                                              v249 = (void *)[v261 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", v279, @"deviceIdiom"];
                                              v357 = v249;
                                              uint64_t v262 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v357 forKeys:&v356 count:1];
                                              v263 = v258;
                                              self = v337;
                                              v283 = (void *)v262;
                                              id v284 = 0;
                                              p_isa = 0;
                                              id *v333 = (id)objc_msgSend(v263, "initWithDomain:code:userInfo:", v259, 2);
                                              v109 = v308;
                                              int v35 = v332;
                                              id v67 = v325;
                                              goto LABEL_269;
                                            }
                                            id v242 = v165;
                                            v243 = NSNumber;
                                            v244 = BMSiriRequestContextDeviceIdiomFromString(v242);
                                            v245 = v243;
                                            self = v337;
                                            id v284 = [v245 numberWithInt:v244];

                                            v109 = v308;
                                          }

                                          id v67 = v325;
                                          id v64 = v304;
                                          goto LABEL_222;
                                        }
                                        objc_opt_class();
                                        if (objc_opt_isKindOfClass())
                                        {
                                          id v206 = v163;
                                          v207 = [BMSiriRequestContextMeCard alloc];
                                          id v343 = 0;
                                          v285 = [(BMSiriRequestContextMeCard *)v207 initWithJSONDictionary:v206 error:&v343];
                                          id v208 = v343;
                                          if (!v208)
                                          {
                                            v281 = v163;

                                            self = v337;
                                            v42 = v324;
                                            id v67 = v325;
                                            id v64 = v304;
                                            goto LABEL_154;
                                          }
                                          v209 = v208;
                                          id v64 = v304;
                                          if (v333) {
                                            id *v333 = v208;
                                          }

                                          v163 = v206;
                                          p_isa = 0;
                                          int v35 = v332;
                                          self = v337;
                                          v42 = v324;
                                          id v67 = v325;
                                          goto LABEL_228;
                                        }
                                        if (v333)
                                        {
                                          id v238 = objc_alloc(MEMORY[0x1E4F28C58]);
                                          id v319 = v8;
                                          uint64_t v239 = *MEMORY[0x1E4F502C8];
                                          uint64_t v358 = *MEMORY[0x1E4F28568];
                                          v287 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"meCard"];
                                          v359 = v287;
                                          v240 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v359 forKeys:&v358 count:1];
                                          uint64_t v241 = v239;
                                          id v8 = v319;
                                          id *v333 = (id)[v238 initWithDomain:v241 code:2 userInfo:v240];

                                          p_isa = 0;
                                          int v35 = v332;
                                          self = v337;
                                          v42 = v324;
                                          id v67 = v325;
                                          id v64 = v304;
                                        }
                                        else
                                        {
                                          p_isa = 0;
                                          int v35 = v332;
                                          self = v337;
                                          v42 = v324;
                                          id v67 = v325;
                                          id v64 = v304;
                                        }
LABEL_229:

LABEL_230:
                                        v217 = v293;

LABEL_231:
LABEL_232:

LABEL_233:
                                        v154 = v294;
LABEL_234:
                                        v201 = (void *)v297;
LABEL_235:

LABEL_236:
                                        v192 = v298;
LABEL_237:

LABEL_238:
                                        id v143 = v109;

LABEL_239:
                                        v141 = v303;
LABEL_240:

                                        v109 = v143;
                                        id v19 = v306;
LABEL_241:

LABEL_242:
                                        uint64_t v26 = v335;

LABEL_243:
LABEL_244:

                                        id v9 = v320;
LABEL_245:
                                        id v14 = v323;
LABEL_246:

                                        goto LABEL_247;
                                      }
                                      objc_opt_class();
                                      if (objc_opt_isKindOfClass())
                                      {
                                        id v289 = v162;
                                        goto LABEL_151;
                                      }
                                      if (v333)
                                      {
                                        id v231 = objc_alloc(MEMORY[0x1E4F28C58]);
                                        id v318 = v8;
                                        uint64_t v232 = *MEMORY[0x1E4F502C8];
                                        uint64_t v360 = *MEMORY[0x1E4F28568];
                                        id v233 = [NSString alloc];
                                        uint64_t v278 = objc_opt_class();
                                        v234 = v233;
                                        v42 = v324;
                                        id v67 = v325;
                                        v163 = (void *)[v234 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v278, @"censorSpeech"];
                                        v361 = v163;
                                        uint64_t v235 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v361 forKeys:&v360 count:1];
                                        v236 = v231;
                                        self = v337;
                                        uint64_t v237 = v232;
                                        id v8 = v318;
                                        id v64 = v304;
                                        v286 = (void *)v235;
                                        id v289 = 0;
                                        p_isa = 0;
                                        id *v333 = (id)objc_msgSend(v236, "initWithDomain:code:userInfo:", v237, 2);
                                        int v35 = v332;

                                        goto LABEL_229;
                                      }
                                      id v289 = 0;
                                      p_isa = 0;
LABEL_264:
                                      int v35 = v332;
                                      goto LABEL_230;
                                    }
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      id v291 = v160;
                                      goto LABEL_148;
                                    }
                                    if (v333)
                                    {
                                      id v224 = objc_alloc(MEMORY[0x1E4F28C58]);
                                      id v317 = v8;
                                      uint64_t v225 = *MEMORY[0x1E4F502C8];
                                      uint64_t v362 = *MEMORY[0x1E4F28568];
                                      id v226 = [NSString alloc];
                                      uint64_t v277 = objc_opt_class();
                                      v227 = v226;
                                      v42 = v324;
                                      id v67 = v325;
                                      id v289 = (id)[v227 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v277, @"allowUserGeneratedContent"];
                                      id v363 = v289;
                                      uint64_t v228 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v363 forKeys:&v362 count:1];
                                      v229 = v224;
                                      self = v337;
                                      uint64_t v230 = v225;
                                      id v8 = v317;
                                      id v64 = v304;
                                      v288 = (void *)v228;
                                      id v291 = 0;
                                      p_isa = 0;
                                      id *v333 = (id)objc_msgSend(v229, "initWithDomain:code:userInfo:", v230, 2);
                                      goto LABEL_264;
                                    }
                                    id v291 = 0;
                                    p_isa = 0;
                                    int v35 = v332;
                                  }
                                  v217 = v293;
                                  goto LABEL_231;
                                }
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  id v177 = v154;
                                  v178 = [BMSiriRequestContextContentRestriction alloc];
                                  id v344 = 0;
                                  uint64_t v297 = [(BMSiriRequestContextContentRestriction *)v178 initWithJSONDictionary:v177 error:&v344];
                                  id v179 = v344;
                                  if (!v179)
                                  {
                                    v294 = v154;

                                    self = v337;
                                    v42 = v324;
                                    id v67 = v325;
                                    id v64 = v304;
                                    goto LABEL_139;
                                  }
                                  v180 = v179;
                                  id v64 = v304;
                                  if (v333) {
                                    id *v333 = v179;
                                  }

                                  p_isa = 0;
                                  int v35 = v332;
                                  v154 = v177;
                                  self = v337;
                                  v42 = v324;
                                  id v67 = v325;
                                  goto LABEL_234;
                                }
                                if (!v333)
                                {
                                  p_isa = 0;
                                  int v35 = v332;
                                  v42 = v324;
                                  id v67 = v325;
                                  id v64 = v304;
                                  goto LABEL_236;
                                }
                                id v309 = objc_alloc(MEMORY[0x1E4F28C58]);
                                id v314 = v8;
                                uint64_t v202 = *MEMORY[0x1E4F502C8];
                                uint64_t v368 = *MEMORY[0x1E4F28568];
                                uint64_t v203 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"contentRestrictions"];
                                uint64_t v369 = v203;
                                v204 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v369 forKeys:&v368 count:1];
                                uint64_t v205 = v202;
                                id v8 = v314;
                                id *v333 = (id)[v309 initWithDomain:v205 code:2 userInfo:v204];

                                v201 = (void *)v203;
                                p_isa = 0;
                                int v35 = v332;
                                self = v337;
                                v42 = v324;
                                id v67 = v325;
LABEL_191:
                                id v64 = v304;
                                goto LABEL_235;
                              }
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                id v298 = v153;
                                id v64 = v304;
                                goto LABEL_136;
                              }
                              if (v333)
                              {
                                id v195 = objc_alloc(MEMORY[0x1E4F28C58]);
                                id v313 = v8;
                                uint64_t v196 = *MEMORY[0x1E4F502C8];
                                uint64_t v370 = *MEMORY[0x1E4F28568];
                                id v197 = [NSString alloc];
                                uint64_t v274 = objc_opt_class();
                                v198 = v197;
                                v42 = v324;
                                id v67 = v325;
                                v154 = (void *)[v198 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v274, @"siriLocale"];
                                v371 = v154;
                                uint64_t v199 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v371 forKeys:&v370 count:1];
                                uint64_t v200 = v196;
                                id v8 = v313;
                                id v298 = 0;
                                p_isa = 0;
                                id *v333 = (id)[v195 initWithDomain:v200 code:2 userInfo:v199];
                                v201 = (void *)v199;
                                int v35 = v332;
                                self = v337;
                                goto LABEL_191;
                              }
                              v192 = 0;
                              p_isa = 0;
                            }
                            int v35 = v332;
                            self = v337;
                            id v64 = v304;
                            goto LABEL_237;
                          }
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            id v166 = v131;
                            v167 = [BMSiriRequestContextUser alloc];
                            id v345 = 0;
                            v305 = [(BMSiriRequestContextUser *)v167 initWithJSONDictionary:v166 error:&v345];
                            id v168 = v345;
                            if (!v168)
                            {

                              id v64 = v304;
                              goto LABEL_127;
                            }
                            v169 = v168;
                            id v143 = v308;
                            v141 = v166;
                            if (v333) {
                              id *v333 = v168;
                            }

                            p_isa = 0;
                            v307 = v166;
                            goto LABEL_171;
                          }
                          if (v333)
                          {
                            id v170 = objc_alloc(MEMORY[0x1E4F28C58]);
                            uint64_t v171 = *MEMORY[0x1E4F502C8];
                            uint64_t v376 = *MEMORY[0x1E4F28568];
                            id v172 = [NSString alloc];
                            uint64_t v271 = objc_opt_class();
                            v173 = v172;
                            v42 = v324;
                            id v67 = v325;
                            v305 = (BMSiriRequestContextUser *)[v173 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", v271, @"identifiedUser"];
                            v377 = v305;
                            uint64_t v174 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v377 forKeys:&v376 count:1];
                            v175 = v170;
                            self = v336;
                            uint64_t v176 = v171;
                            id v143 = v308;
                            id v8 = v310;
                            p_isa = 0;
                            id *v333 = (id)[v175 initWithDomain:v176 code:2 userInfo:v174];
                            v141 = (void *)v174;
LABEL_171:
                            int v35 = v332;
                            id v64 = v304;
                            goto LABEL_240;
                          }
                          p_isa = 0;
                          int v35 = v332;
                          id v19 = v306;
LABEL_125:
                          id v64 = v304;
                          goto LABEL_241;
                        }
                      }
                      if (v333)
                      {
                        id v136 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v137 = *MEMORY[0x1E4F502C8];
                        uint64_t v380 = *MEMORY[0x1E4F28568];
                        v305 = (BMSiriRequestContextUser *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"bargeInModes"];
                        v381 = v305;
                        v138 = (void *)MEMORY[0x1E4F1C9E8];
                        v139 = &v381;
                        v140 = &v380;
LABEL_117:
                        v141 = [v138 dictionaryWithObjects:v139 forKeys:v140 count:1];
                        v142 = objc_msgSend(v136, "initWithDomain:code:userInfo:", v137, 2);
                        self = v336;
                        int v35 = v332;
                        v42 = v324;
                        id v143 = v308;
                        id v64 = v126;
                        p_isa = 0;
                        id *v333 = v142;
                        v307 = v126;
                        id v8 = v310;
                        id v67 = v325;
                        goto LABEL_240;
                      }
LABEL_121:
                      p_isa = 0;
                      id v64 = v126;
                      v307 = v126;
                      self = v336;
                      id v8 = v310;
                      int v35 = v332;
                      id v19 = v306;
                      goto LABEL_83;
                    }
                  }
                  v42 = v324;
                  goto LABEL_54;
                }
                if (v333)
                {
                  id v115 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v116 = *MEMORY[0x1E4F502C8];
                  uint64_t v392 = *MEMORY[0x1E4F28568];
                  id v117 = v8;
                  id v118 = [NSString alloc];
                  uint64_t v270 = objc_opt_class();
                  v119 = v118;
                  id v8 = v117;
                  id obj = (id)[v119 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v270, @"isTriggerlessFollowup"];
                  id v393 = obj;
                  uint64_t v120 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v393 forKeys:&v392 count:1];
                  uint64_t v121 = v116;
                  v42 = v324;
                  v342 = (void *)v120;
                  id v122 = (id)objc_msgSend(v115, "initWithDomain:code:userInfo:", v121, 2);
                  v109 = 0;
                  p_isa = 0;
                  id *v333 = v122;
                  uint64_t v26 = v335;
                  self = v336;
                  int v35 = v332;
                  id v67 = v325;

                  goto LABEL_243;
                }
                v109 = 0;
                p_isa = 0;
LABEL_120:
                uint64_t v26 = v335;
                self = v336;
                int v35 = v332;
                id v67 = v325;
                goto LABEL_244;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v20 = 0;
                goto LABEL_40;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v20 = v20;
                goto LABEL_40;
              }
              if (v333)
              {
                id v98 = v8;
                id v99 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v100 = *MEMORY[0x1E4F502C8];
                uint64_t v396 = *MEMORY[0x1E4F28568];
                v101 = v9;
                id v102 = [NSString alloc];
                uint64_t v269 = objc_opt_class();
                id v67 = v20;
                v103 = v102;
                id v9 = v101;
                id v322 = (id)[v103 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v269, @"isVoiceTriggerEnabled"];
                id v397 = v322;
                uint64_t v104 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v397 forKeys:&v396 count:1];
                v105 = v99;
                id v8 = v98;
                v321 = (void *)v104;
                id v106 = (id)objc_msgSend(v105, "initWithDomain:code:userInfo:", v100, 2);
                v326 = 0;
                p_isa = 0;
                id *v333 = v106;
                uint64_t v26 = v335;
                self = v336;
                int v35 = v332;
                goto LABEL_246;
              }
              v326 = 0;
              p_isa = 0;
              uint64_t v26 = v335;
              self = v336;
              int v35 = v332;
              id v67 = v325;
LABEL_247:

              uint64_t v82 = v327;
              goto LABEL_248;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v19 = v18;
              goto LABEL_19;
            }
            if (v333)
            {
              id v85 = v8;
              id v86 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v87 = *MEMORY[0x1E4F502C8];
              uint64_t v398 = *MEMORY[0x1E4F28568];
              int v88 = v9;
              id v89 = [NSString alloc];
              uint64_t v268 = objc_opt_class();
              uint64_t v90 = v89;
              id v9 = v88;
              v326 = (void *)[v90 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v268, @"isMultiUser"];
              v399 = v326;
              id v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v399 forKeys:&v398 count:1];
              v91 = v86;
              id v8 = v85;
              id v92 = (id)[v91 initWithDomain:v87 code:2 userInfo:v67];
              id v19 = 0;
              p_isa = 0;
              id *v333 = v92;
              uint64_t v26 = v335;
              self = v336;
              int v35 = v332;
              goto LABEL_247;
            }
            id v19 = 0;
            p_isa = 0;
            self = v336;
            int v35 = v332;
            uint64_t v82 = v18;
            uint64_t v26 = v335;
LABEL_248:

            uint64_t v16 = v329;
            goto LABEL_249;
          }
          if (v333)
          {
            id v76 = v8;
            id v77 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v78 = *MEMORY[0x1E4F502C8];
            uint64_t v400 = *MEMORY[0x1E4F28568];
            id v79 = v9;
            id v80 = [NSString alloc];
            uint64_t v267 = objc_opt_class();
            v81 = v80;
            id v9 = v79;
            id v19 = (id)[v81 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v267, @"isEyesFree"];
            id v401 = v19;
            uint64_t v82 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v401 forKeys:&v400 count:1];
            v83 = v77;
            id v8 = v76;
            id v84 = (id)[v83 initWithDomain:v78 code:2 userInfo:v82];
            id v330 = 0;
            p_isa = 0;
            id *v333 = v84;
            uint64_t v26 = v335;
            self = v336;
            int v35 = v332;
            goto LABEL_248;
          }
          id v330 = 0;
          p_isa = 0;
LABEL_110:
          uint64_t v26 = v335;
          self = v336;
          int v35 = v332;
LABEL_249:

          uint64_t v7 = v331;
          goto LABEL_250;
        }
        if (v333)
        {
          id v68 = v8;
          id v69 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v70 = *MEMORY[0x1E4F502C8];
          uint64_t v402 = *MEMORY[0x1E4F28568];
          int v71 = v9;
          id v72 = [NSString alloc];
          uint64_t v266 = objc_opt_class();
          uint64_t v73 = v72;
          id v9 = v71;
          id v330 = (id)[v73 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v266, @"responseMode"];
          id v403 = v330;
          uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v403 forKeys:&v402 count:1];
          v74 = v69;
          id v8 = v68;
          id v75 = (id)[v74 initWithDomain:v70 code:2 userInfo:v16];
          id v14 = 0;
          p_isa = 0;
          id *v333 = v75;
          goto LABEL_110;
        }
        id v14 = 0;
        p_isa = 0;
        uint64_t v26 = v335;
        self = v336;
        int v35 = v332;
LABEL_250:

        goto LABEL_251;
      }
      if (p_isa)
      {
        id v46 = v8;
        id v47 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v48 = v6;
        uint64_t v49 = p_isa;
        uint64_t v50 = *MEMORY[0x1E4F502C8];
        uint64_t v404 = *MEMORY[0x1E4F28568];
        v51 = v9;
        id v52 = [NSString alloc];
        uint64_t v265 = objc_opt_class();
        int v53 = v52;
        id v9 = v51;
        uint64_t v54 = [v53 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v265, @"inputOrigin"];
        uint64_t v405 = v54;
        uint64_t v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v405 forKeys:&v404 count:1];
        v56 = v47;
        id v8 = v46;
        v334 = (void *)v55;
        id v57 = (id)objc_msgSend(v56, "initWithDomain:code:userInfo:", v50, 2);
        int v35 = 0;
        p_isa = 0;
        *uint64_t v49 = v57;
        id v6 = v48;
        id v14 = (id)v54;
        uint64_t v26 = v335;
        self = v336;
        goto LABEL_250;
      }
      int v35 = 0;
      uint64_t v26 = v335;
      self = v336;
LABEL_251:

      goto LABEL_252;
    }
    if (p_isa)
    {
      uint64_t v29 = v7;
      int v30 = self;
      id v31 = v8;
      id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
      id v340 = v6;
      uint64_t v33 = p_isa;
      uint64_t v34 = *MEMORY[0x1E4F502C8];
      uint64_t v406 = *MEMORY[0x1E4F28568];
      int v35 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"requestID"];
      v407 = v35;
      uint64_t v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v407 forKeys:&v406 count:1];
      uint64_t v37 = v32;
      id v8 = v31;
      self = v30;
      uint64_t v7 = v29;
      v338 = (void *)v36;
      id v38 = (id)objc_msgSend(v37, "initWithDomain:code:userInfo:", v34, 2);
      uint64_t v26 = 0;
      p_isa = 0;
      *uint64_t v33 = v38;
      id v6 = v340;
      goto LABEL_251;
    }
    uint64_t v26 = 0;
LABEL_252:

    goto LABEL_253;
  }
  if (p_isa)
  {
    id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v22 = *MEMORY[0x1E4F502C8];
    uint64_t v408 = *MEMORY[0x1E4F28568];
    uint64_t v23 = v7;
    id v24 = [NSString alloc];
    uint64_t v264 = objc_opt_class();
    uint64_t v25 = v24;
    uint64_t v7 = v23;
    uint64_t v26 = (void *)[v25 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v264, @"sessionID"];
    v409[0] = v26;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v409 forKeys:&v408 count:1];
    id v27 = (id)[v21 initWithDomain:v22 code:2 userInfo:v9];
    id v8 = 0;
    v28 = p_isa;
    p_isa = 0;
    id *v28 = v27;
    goto LABEL_252;
  }
  id v8 = 0;
LABEL_253:

  return (BMSiriRequestContext *)p_isa;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMSiriRequestContext *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_sessionID) {
    PBDataWriterWriteStringField();
  }
  if (self->_requestID) {
    PBDataWriterWriteStringField();
  }
  if (self->_inputOrigin) {
    PBDataWriterWriteStringField();
  }
  if (self->_responseMode) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasIsEyesFree) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsMultiUser) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsVoiceTriggerEnabled) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsTextToSpeechEnabled) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsTriggerlessFollowup) {
    PBDataWriterWriteBOOLField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = self->_deviceRestrictions;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v10 = self->_bargeInModes;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  if (self->_identifiedUser)
  {
    PBDataWriterPlaceMark();
    [(BMSiriRequestContextUser *)self->_identifiedUser writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_encodedLocation) {
    PBDataWriterWriteDataField();
  }
  if (self->_countryCode) {
    PBDataWriterWriteStringField();
  }
  if (self->_siriLocale) {
    PBDataWriterWriteStringField();
  }
  if (self->_contentRestrictions)
  {
    PBDataWriterPlaceMark();
    [(BMSiriRequestContextContentRestriction *)self->_contentRestrictions writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_hasUiScale) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_temperatureUnit) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasAllowUserGeneratedContent) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasCensorSpeech) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_meCard)
  {
    PBDataWriterPlaceMark();
    [(BMSiriRequestContextMeCard *)self->_meCard writeTo:v4];
    PBDataWriterRecallMark();
  }
  PBDataWriterWriteUint32Field();
  if (self->_hasDidPSCFire) {
    PBDataWriterWriteBOOLField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v107.receiver = self;
  v107.super_class = (Class)BMSiriRequestContext;
  uint64_t v5 = [(BMEventBase *)&v107 init];
  if (!v5) {
    goto LABEL_157;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = (int *)MEMORY[0x1E4F940E8];
  id v9 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v10 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    uint64_t v11 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v10]) {
        break;
      }
      char v12 = 0;
      unsigned int v13 = 0;
      unint64_t v14 = 0;
      while (1)
      {
        uint64_t v15 = *v8;
        uint64_t v16 = *(void *)&v4[v15];
        unint64_t v17 = v16 + 1;
        if (v16 == -1 || v17 > *(void *)&v4[*v9]) {
          break;
        }
        char v18 = *(unsigned char *)(*(void *)&v4[*v11] + v16);
        *(void *)&v4[v15] = v17;
        v14 |= (unint64_t)(v18 & 0x7F) << v12;
        if ((v18 & 0x80) == 0) {
          goto LABEL_13;
        }
        v12 += 7;
        BOOL v19 = v13++ >= 9;
        if (v19)
        {
          unint64_t v14 = 0;
          int v20 = v4[*v10];
          goto LABEL_15;
        }
      }
      v4[*v10] = 1;
LABEL_13:
      int v20 = v4[*v10];
      if (v4[*v10]) {
        unint64_t v14 = 0;
      }
LABEL_15:
      if (v20 || (v14 & 7) == 4) {
        break;
      }
      switch((v14 >> 3))
      {
        case 1u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 48;
          goto LABEL_79;
        case 2u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 56;
          goto LABEL_79;
        case 3u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 64;
          goto LABEL_79;
        case 4u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 72;
          goto LABEL_79;
        case 5u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v26 = 0;
          v5->_hasIsEyesFree = 1;
          while (2)
          {
            uint64_t v27 = *v8;
            uint64_t v28 = *(void *)&v4[v27];
            unint64_t v29 = v28 + 1;
            if (v28 == -1 || v29 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v30 = *(unsigned char *)(*(void *)&v4[*v11] + v28);
              *(void *)&v4[v27] = v29;
              v26 |= (unint64_t)(v30 & 0x7F) << v24;
              if (v30 < 0)
              {
                v24 += 7;
                BOOL v19 = v25++ >= 9;
                if (v19)
                {
                  uint64_t v26 = 0;
                  goto LABEL_115;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            uint64_t v26 = 0;
          }
LABEL_115:
          BOOL v98 = v26 != 0;
          uint64_t v99 = 16;
          goto LABEL_150;
        case 6u:
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v33 = 0;
          v5->_hasIsMultiUser = 1;
          while (2)
          {
            uint64_t v34 = *v8;
            uint64_t v35 = *(void *)&v4[v34];
            unint64_t v36 = v35 + 1;
            if (v35 == -1 || v36 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v37 = *(unsigned char *)(*(void *)&v4[*v11] + v35);
              *(void *)&v4[v34] = v36;
              v33 |= (unint64_t)(v37 & 0x7F) << v31;
              if (v37 < 0)
              {
                v31 += 7;
                BOOL v19 = v32++ >= 9;
                if (v19)
                {
                  uint64_t v33 = 0;
                  goto LABEL_119;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            uint64_t v33 = 0;
          }
LABEL_119:
          BOOL v98 = v33 != 0;
          uint64_t v99 = 18;
          goto LABEL_150;
        case 7u:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v40 = 0;
          v5->_hasIsVoiceTriggerEnabled = 1;
          while (2)
          {
            uint64_t v41 = *v8;
            uint64_t v42 = *(void *)&v4[v41];
            unint64_t v43 = v42 + 1;
            if (v42 == -1 || v43 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v44 = *(unsigned char *)(*(void *)&v4[*v11] + v42);
              *(void *)&v4[v41] = v43;
              v40 |= (unint64_t)(v44 & 0x7F) << v38;
              if (v44 < 0)
              {
                v38 += 7;
                BOOL v19 = v39++ >= 9;
                if (v19)
                {
                  uint64_t v40 = 0;
                  goto LABEL_123;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            uint64_t v40 = 0;
          }
LABEL_123:
          BOOL v98 = v40 != 0;
          uint64_t v99 = 20;
          goto LABEL_150;
        case 8u:
          char v45 = 0;
          unsigned int v46 = 0;
          uint64_t v47 = 0;
          v5->_hasIsTextToSpeechEnabled = 1;
          while (2)
          {
            uint64_t v48 = *v8;
            uint64_t v49 = *(void *)&v4[v48];
            unint64_t v50 = v49 + 1;
            if (v49 == -1 || v50 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v51 = *(unsigned char *)(*(void *)&v4[*v11] + v49);
              *(void *)&v4[v48] = v50;
              v47 |= (unint64_t)(v51 & 0x7F) << v45;
              if (v51 < 0)
              {
                v45 += 7;
                BOOL v19 = v46++ >= 9;
                if (v19)
                {
                  uint64_t v47 = 0;
                  goto LABEL_127;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            uint64_t v47 = 0;
          }
LABEL_127:
          BOOL v98 = v47 != 0;
          uint64_t v99 = 22;
          goto LABEL_150;
        case 9u:
          char v52 = 0;
          unsigned int v53 = 0;
          uint64_t v54 = 0;
          v5->_hasIsTriggerlessFollowup = 1;
          while (2)
          {
            uint64_t v55 = *v8;
            uint64_t v56 = *(void *)&v4[v55];
            unint64_t v57 = v56 + 1;
            if (v56 == -1 || v57 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v58 = *(unsigned char *)(*(void *)&v4[*v11] + v56);
              *(void *)&v4[v55] = v57;
              v54 |= (unint64_t)(v58 & 0x7F) << v52;
              if (v58 < 0)
              {
                v52 += 7;
                BOOL v19 = v53++ >= 9;
                if (v19)
                {
                  uint64_t v54 = 0;
                  goto LABEL_131;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            uint64_t v54 = 0;
          }
LABEL_131:
          BOOL v98 = v54 != 0;
          uint64_t v99 = 24;
          goto LABEL_150;
        case 0xAu:
          uint64_t v59 = PBReaderReadString();
          if (!v59) {
            goto LABEL_159;
          }
          uint64_t v60 = (void *)v59;
          uint64_t v61 = v6;
          goto LABEL_65;
        case 0xBu:
          uint64_t v62 = PBReaderReadString();
          if (!v62) {
            goto LABEL_159;
          }
          uint64_t v60 = (void *)v62;
          uint64_t v61 = v7;
LABEL_65:
          [v61 addObject:v60];

          continue;
        case 0xCu:
          uint64_t v108 = 0;
          uint64_t v109 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_159;
          }
          id v63 = [[BMSiriRequestContextUser alloc] initByReadFrom:v4];
          if (!v63) {
            goto LABEL_159;
          }
          uint64_t v64 = 96;
          goto LABEL_97;
        case 0xDu:
          uint64_t v22 = PBReaderReadData();
          uint64_t v23 = 104;
          goto LABEL_79;
        case 0xEu:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 112;
          goto LABEL_79;
        case 0xFu:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 120;
          goto LABEL_79;
        case 0x10u:
          uint64_t v108 = 0;
          uint64_t v109 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_159;
          }
          id v63 = [[BMSiriRequestContextContentRestriction alloc] initByReadFrom:v4];
          if (!v63) {
            goto LABEL_159;
          }
          uint64_t v64 = 128;
          goto LABEL_97;
        case 0x11u:
          v5->_hasUiScale = 1;
          uint64_t v65 = *v8;
          unint64_t v66 = *(void *)&v4[v65];
          if (v66 <= 0xFFFFFFFFFFFFFFF7 && v66 + 8 <= *(void *)&v4[*v9])
          {
            double v67 = *(double *)(*(void *)&v4[*v11] + v66);
            *(void *)&v4[v65] = v66 + 8;
          }
          else
          {
            v4[*v10] = 1;
            double v67 = 0.0;
          }
          v5->_uiScale = v67;
          continue;
        case 0x12u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 144;
LABEL_79:
          id v68 = *(Class *)((char *)&v5->super.super.isa + v23);
          *(Class *)((char *)&v5->super.super.isa + v23) = (Class)v22;

          continue;
        case 0x13u:
          char v69 = 0;
          unsigned int v70 = 0;
          uint64_t v71 = 0;
          v5->_hasAllowUserGeneratedContent = 1;
          while (2)
          {
            uint64_t v72 = *v8;
            uint64_t v73 = *(void *)&v4[v72];
            unint64_t v74 = v73 + 1;
            if (v73 == -1 || v74 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v75 = *(unsigned char *)(*(void *)&v4[*v11] + v73);
              *(void *)&v4[v72] = v74;
              v71 |= (unint64_t)(v75 & 0x7F) << v69;
              if (v75 < 0)
              {
                v69 += 7;
                BOOL v19 = v70++ >= 9;
                if (v19)
                {
                  uint64_t v71 = 0;
                  goto LABEL_135;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            uint64_t v71 = 0;
          }
LABEL_135:
          BOOL v98 = v71 != 0;
          uint64_t v99 = 27;
          goto LABEL_150;
        case 0x14u:
          char v76 = 0;
          unsigned int v77 = 0;
          uint64_t v78 = 0;
          v5->_hasCensorSpeech = 1;
          while (2)
          {
            uint64_t v79 = *v8;
            uint64_t v80 = *(void *)&v4[v79];
            unint64_t v81 = v80 + 1;
            if (v80 == -1 || v81 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v82 = *(unsigned char *)(*(void *)&v4[*v11] + v80);
              *(void *)&v4[v79] = v81;
              v78 |= (unint64_t)(v82 & 0x7F) << v76;
              if (v82 < 0)
              {
                v76 += 7;
                BOOL v19 = v77++ >= 9;
                if (v19)
                {
                  uint64_t v78 = 0;
                  goto LABEL_139;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            uint64_t v78 = 0;
          }
LABEL_139:
          BOOL v98 = v78 != 0;
          uint64_t v99 = 29;
          goto LABEL_150;
        case 0x15u:
          uint64_t v108 = 0;
          uint64_t v109 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_159;
          }
          id v63 = [[BMSiriRequestContextMeCard alloc] initByReadFrom:v4];
          if (!v63) {
            goto LABEL_159;
          }
          uint64_t v64 = 152;
LABEL_97:
          v83 = *(Class *)((char *)&v5->super.super.isa + v64);
          *(Class *)((char *)&v5->super.super.isa + v64) = v63;

          PBReaderRecallMark();
          continue;
        case 0x16u:
          char v84 = 0;
          unsigned int v85 = 0;
          uint64_t v86 = 0;
          while (2)
          {
            uint64_t v87 = *v8;
            uint64_t v88 = *(void *)&v4[v87];
            unint64_t v89 = v88 + 1;
            if (v88 == -1 || v89 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v90 = *(unsigned char *)(*(void *)&v4[*v11] + v88);
              *(void *)&v4[v87] = v89;
              v86 |= (unint64_t)(v90 & 0x7F) << v84;
              if (v90 < 0)
              {
                v84 += 7;
                BOOL v19 = v85++ >= 9;
                if (v19)
                {
                  LODWORD(v86) = 0;
                  goto LABEL_143;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            LODWORD(v86) = 0;
          }
LABEL_143:
          if (v86 >= 0xB) {
            LODWORD(v86) = 0;
          }
          v5->_deviceIdiom = v86;
          continue;
        case 0x17u:
          char v91 = 0;
          unsigned int v92 = 0;
          uint64_t v93 = 0;
          v5->_hasDidPSCFire = 1;
          break;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_159:

          goto LABEL_156;
      }
      while (1)
      {
        uint64_t v94 = *v8;
        uint64_t v95 = *(void *)&v4[v94];
        unint64_t v96 = v95 + 1;
        if (v95 == -1 || v96 > *(void *)&v4[*v9]) {
          break;
        }
        char v97 = *(unsigned char *)(*(void *)&v4[*v11] + v95);
        *(void *)&v4[v94] = v96;
        v93 |= (unint64_t)(v97 & 0x7F) << v91;
        if ((v97 & 0x80) == 0) {
          goto LABEL_147;
        }
        v91 += 7;
        BOOL v19 = v92++ >= 9;
        if (v19)
        {
          uint64_t v93 = 0;
          goto LABEL_149;
        }
      }
      v4[*v10] = 1;
LABEL_147:
      if (v4[*v10]) {
        uint64_t v93 = 0;
      }
LABEL_149:
      BOOL v98 = v93 != 0;
      uint64_t v99 = 31;
LABEL_150:
      *((unsigned char *)&v5->super.super.isa + v99) = v98;
    }
    while (*(void *)&v4[*v8] < *(void *)&v4[*v9]);
  }
  uint64_t v100 = [v6 copy];
  deviceRestrictions = v5->_deviceRestrictions;
  v5->_deviceRestrictions = (NSArray *)v100;

  uint64_t v102 = [v7 copy];
  bargeInModes = v5->_bargeInModes;
  v5->_bargeInModes = (NSArray *)v102;

  int v104 = v4[*v10];
  if (v104) {
LABEL_156:
  }
    v105 = 0;
  else {
LABEL_157:
  }
    v105 = v5;

  return v105;
}

- (NSString)description
{
  id v18 = [NSString alloc];
  unint64_t v29 = [(BMSiriRequestContext *)self sessionID];
  uint64_t v28 = [(BMSiriRequestContext *)self requestID];
  uint64_t v26 = [(BMSiriRequestContext *)self inputOrigin];
  uint64_t v27 = [(BMSiriRequestContext *)self responseMode];
  unsigned int v25 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriRequestContext isEyesFree](self, "isEyesFree"));
  char v24 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriRequestContext isMultiUser](self, "isMultiUser"));
  uint64_t v23 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriRequestContext isVoiceTriggerEnabled](self, "isVoiceTriggerEnabled"));
  unint64_t v17 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriRequestContext isTextToSpeechEnabled](self, "isTextToSpeechEnabled"));
  uint64_t v22 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriRequestContext isTriggerlessFollowup](self, "isTriggerlessFollowup"));
  long long v21 = [(BMSiriRequestContext *)self deviceRestrictions];
  int v20 = [(BMSiriRequestContext *)self bargeInModes];
  uint64_t v16 = [(BMSiriRequestContext *)self identifiedUser];
  uint64_t v15 = [(BMSiriRequestContext *)self encodedLocation];
  unsigned int v13 = [(BMSiriRequestContext *)self countryCode];
  char v12 = [(BMSiriRequestContext *)self siriLocale];
  unint64_t v14 = [(BMSiriRequestContext *)self contentRestrictions];
  uint64_t v3 = NSNumber;
  [(BMSiriRequestContext *)self uiScale];
  uint64_t v11 = objc_msgSend(v3, "numberWithDouble:");
  id v4 = [(BMSiriRequestContext *)self temperatureUnit];
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriRequestContext allowUserGeneratedContent](self, "allowUserGeneratedContent"));
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriRequestContext censorSpeech](self, "censorSpeech"));
  uint64_t v7 = [(BMSiriRequestContext *)self meCard];
  uint64_t v8 = BMSiriRequestContextDeviceIdiomAsString([(BMSiriRequestContext *)self deviceIdiom]);
  id v9 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriRequestContext didPSCFire](self, "didPSCFire"));
  BOOL v19 = objc_msgSend(v18, "initWithFormat:", @"BMSiriRequestContext with sessionID: %@, requestID: %@, inputOrigin: %@, responseMode: %@, isEyesFree: %@, isMultiUser: %@, isVoiceTriggerEnabled: %@, isTextToSpeechEnabled: %@, isTriggerlessFollowup: %@, deviceRestrictions: %@, bargeInModes: %@, identifiedUser: %@, encodedLocation: %@, countryCode: %@, siriLocale: %@, contentRestrictions: %@, uiScale: %@, temperatureUnit: %@, allowUserGeneratedContent: %@, censorSpeech: %@, meCard: %@, deviceIdiom: %@, didPSCFire: %@", v29, v28, v26, v27, v25, v24, v23, v17, v22, v21, v20, v16, v15, v13, v12, v14,
                  v11,
                  v4,
                  v5,
                  v6,
                  v7,
                  v8,
                  v9);

  return (NSString *)v19;
}

- (BMSiriRequestContext)initWithSessionID:(id)a3 requestID:(id)a4 inputOrigin:(id)a5 responseMode:(id)a6 isEyesFree:(id)a7 isMultiUser:(id)a8 isVoiceTriggerEnabled:(id)a9 isTextToSpeechEnabled:(id)a10 isTriggerlessFollowup:(id)a11 deviceRestrictions:(id)a12 bargeInModes:(id)a13 identifiedUser:(id)a14 encodedLocation:(id)a15 countryCode:(id)a16 siriLocale:(id)a17 contentRestrictions:(id)a18 uiScale:(id)a19 temperatureUnit:(id)a20 allowUserGeneratedContent:(id)a21 censorSpeech:(id)a22 meCard:(id)a23 deviceIdiom:(int)a24 didPSCFire:(id)a25
{
  id v55 = a3;
  id v54 = a4;
  id v42 = a5;
  id v53 = a5;
  id v43 = a6;
  id v52 = a6;
  id v29 = a7;
  id v30 = a8;
  id v56 = a9;
  id v59 = a10;
  id v57 = a11;
  id v51 = a12;
  id v50 = a13;
  id v49 = a14;
  id v48 = a15;
  id v47 = a16;
  id v46 = a17;
  id v45 = a18;
  char v31 = v30;
  id v32 = a19;
  id v33 = a20;
  id v34 = a21;
  id v35 = a22;
  id v36 = a23;
  id v37 = a25;
  v60.receiver = self;
  v60.super_class = (Class)BMSiriRequestContext;
  char v38 = [(BMEventBase *)&v60 init];
  if (v38)
  {
    v38->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v38->_sessionID, a3);
    objc_storeStrong((id *)&v38->_requestID, a4);
    objc_storeStrong((id *)&v38->_inputOrigin, v42);
    objc_storeStrong((id *)&v38->_responseMode, v43);
    if (v29)
    {
      v38->_hasIsEyesFree = 1;
      v38->_isEyesFree = [v29 BOOLValue];
    }
    else
    {
      v38->_hasIsEyesFree = 0;
      v38->_isEyesFree = 0;
    }
    if (v31)
    {
      v38->_hasIsMultiUser = 1;
      v38->_isMultiUser = [v31 BOOLValue];
    }
    else
    {
      v38->_hasIsMultiUser = 0;
      v38->_isMultiUser = 0;
    }
    if (v56)
    {
      v38->_hasIsVoiceTriggerEnabled = 1;
      v38->_isVoiceTriggerEnabled = [v56 BOOLValue];
    }
    else
    {
      v38->_hasIsVoiceTriggerEnabled = 0;
      v38->_isVoiceTriggerEnabled = 0;
    }
    if (v59)
    {
      v38->_hasIsTextToSpeechEnabled = 1;
      v38->_isTextToSpeechEnabled = [v59 BOOLValue];
    }
    else
    {
      v38->_hasIsTextToSpeechEnabled = 0;
      v38->_isTextToSpeechEnabled = 0;
    }
    if (v57)
    {
      v38->_hasIsTriggerlessFollowup = 1;
      v38->_isTriggerlessFollowup = [v57 BOOLValue];
    }
    else
    {
      v38->_hasIsTriggerlessFollowup = 0;
      v38->_isTriggerlessFollowup = 0;
    }
    objc_storeStrong((id *)&v38->_deviceRestrictions, a12);
    objc_storeStrong((id *)&v38->_bargeInModes, a13);
    objc_storeStrong((id *)&v38->_identifiedUser, a14);
    objc_storeStrong((id *)&v38->_encodedLocation, a15);
    objc_storeStrong((id *)&v38->_countryCode, a16);
    objc_storeStrong((id *)&v38->_siriLocale, a17);
    objc_storeStrong((id *)&v38->_contentRestrictions, a18);
    if (v32)
    {
      v38->_hasUiScale = 1;
      [v32 doubleValue];
    }
    else
    {
      v38->_hasUiScale = 0;
      double v39 = -1.0;
    }
    v38->_uiScale = v39;
    objc_storeStrong((id *)&v38->_temperatureUnit, a20);
    if (v34)
    {
      v38->_hasAllowUserGeneratedContent = 1;
      v38->_allowUserGeneratedContent = [v34 BOOLValue];
    }
    else
    {
      v38->_hasAllowUserGeneratedContent = 0;
      v38->_allowUserGeneratedContent = 0;
    }
    if (v35)
    {
      v38->_hasCensorSpeech = 1;
      v38->_censorSpeech = [v35 BOOLValue];
    }
    else
    {
      v38->_hasCensorSpeech = 0;
      v38->_censorSpeech = 0;
    }
    objc_storeStrong((id *)&v38->_meCard, a23);
    v38->_deviceIdiom = a24;
    if (v37)
    {
      v38->_hasDidPSCFire = 1;
      v38->_didPSCFire = [v37 BOOLValue];
    }
    else
    {
      v38->_hasDidPSCFire = 0;
      v38->_didPSCFire = 0;
    }
  }

  return v38;
}

+ (id)protoFields
{
  v27[23] = *MEMORY[0x1E4F143B8];
  uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"sessionID" number:1 type:13 subMessageClass:0];
  v27[0] = v26;
  unsigned int v25 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"requestID" number:2 type:13 subMessageClass:0];
  v27[1] = v25;
  char v24 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"inputOrigin" number:3 type:13 subMessageClass:0];
  v27[2] = v24;
  uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"responseMode" number:4 type:13 subMessageClass:0];
  v27[3] = v23;
  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isEyesFree" number:5 type:12 subMessageClass:0];
  v27[4] = v22;
  long long v21 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isMultiUser" number:6 type:12 subMessageClass:0];
  v27[5] = v21;
  int v20 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isVoiceTriggerEnabled" number:7 type:12 subMessageClass:0];
  v27[6] = v20;
  BOOL v19 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isTextToSpeechEnabled" number:8 type:12 subMessageClass:0];
  v27[7] = v19;
  id v18 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isTriggerlessFollowup" number:9 type:12 subMessageClass:0];
  v27[8] = v18;
  unint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"deviceRestrictions" number:10 type:13 subMessageClass:0];
  v27[9] = v17;
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bargeInModes" number:11 type:13 subMessageClass:0];
  v27[10] = v16;
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"identifiedUser" number:12 type:14 subMessageClass:objc_opt_class()];
  v27[11] = v15;
  unint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"encodedLocation" number:13 type:14 subMessageClass:0];
  v27[12] = v14;
  unsigned int v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"countryCode" number:14 type:13 subMessageClass:0];
  v27[13] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"siriLocale" number:15 type:13 subMessageClass:0];
  v27[14] = v2;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"contentRestrictions" number:16 type:14 subMessageClass:objc_opt_class()];
  v27[15] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"uiScale" number:17 type:0 subMessageClass:0];
  v27[16] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"temperatureUnit" number:18 type:13 subMessageClass:0];
  v27[17] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"allowUserGeneratedContent" number:19 type:12 subMessageClass:0];
  v27[18] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"censorSpeech" number:20 type:12 subMessageClass:0];
  v27[19] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"meCard" number:21 type:14 subMessageClass:objc_opt_class()];
  v27[20] = v8;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"deviceIdiom" number:22 type:4 subMessageClass:0];
  v27[21] = v9;
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"didPSCFire" number:23 type:12 subMessageClass:0];
  v27[22] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:23];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF51D8;
}

id __31__BMSiriRequestContext_columns__block_invoke_5(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 meCard];
  id v4 = [v3 jsonDictionary];
  uint64_t v5 = BMConvertObjectToJSONString();

  return v5;
}

id __31__BMSiriRequestContext_columns__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 contentRestrictions];
  id v4 = [v3 jsonDictionary];
  uint64_t v5 = BMConvertObjectToJSONString();

  return v5;
}

id __31__BMSiriRequestContext_columns__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 identifiedUser];
  id v4 = [v3 jsonDictionary];
  uint64_t v5 = BMConvertObjectToJSONString();

  return v5;
}

id __31__BMSiriRequestContext_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _bargeInModesJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __31__BMSiriRequestContext_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _deviceRestrictionsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    uint64_t v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMSiriRequestContext alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[9] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end