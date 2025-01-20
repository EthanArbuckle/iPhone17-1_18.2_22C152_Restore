@interface _NBPhoneMetaData
- (BOOL)leadingZeroPossible;
- (BOOL)mainCountryForCode;
- (BOOL)sameMobileAndFixedLinePattern;
- (NSArray)intlNumberFormats;
- (NSArray)numberFormats;
- (NSNumber)countryCode;
- (NSString)codeID;
- (NSString)internationalPrefix;
- (NSString)leadingDigits;
- (NSString)nationalPrefix;
- (NSString)nationalPrefixForParsing;
- (NSString)nationalPrefixTransformRule;
- (NSString)preferredExtnPrefix;
- (NSString)preferredInternationalPrefix;
- (_NBPhoneMetaData)init;
- (_NBPhoneMetaData)initWithEntry:(id)a3;
- (_NBPhoneNumberDesc)emergency;
- (_NBPhoneNumberDesc)fixedLine;
- (_NBPhoneNumberDesc)generalDesc;
- (_NBPhoneNumberDesc)mobile;
- (_NBPhoneNumberDesc)noInternationalDialling;
- (_NBPhoneNumberDesc)pager;
- (_NBPhoneNumberDesc)personalNumber;
- (_NBPhoneNumberDesc)premiumRate;
- (_NBPhoneNumberDesc)sharedCost;
- (_NBPhoneNumberDesc)tollFree;
- (_NBPhoneNumberDesc)uan;
- (_NBPhoneNumberDesc)voicemail;
- (_NBPhoneNumberDesc)voip;
- (id)description;
- (id)numberFormatsFromEntry:(id)a3;
- (void)setCodeID:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setEmergency:(id)a3;
- (void)setFixedLine:(id)a3;
- (void)setGeneralDesc:(id)a3;
- (void)setInternationalPrefix:(id)a3;
- (void)setIntlNumberFormats:(id)a3;
- (void)setLeadingDigits:(id)a3;
- (void)setLeadingZeroPossible:(BOOL)a3;
- (void)setMainCountryForCode:(BOOL)a3;
- (void)setMobile:(id)a3;
- (void)setNationalPrefix:(id)a3;
- (void)setNationalPrefixForParsing:(id)a3;
- (void)setNationalPrefixTransformRule:(id)a3;
- (void)setNoInternationalDialling:(id)a3;
- (void)setNumberFormats:(id)a3;
- (void)setPager:(id)a3;
- (void)setPersonalNumber:(id)a3;
- (void)setPreferredExtnPrefix:(id)a3;
- (void)setPreferredInternationalPrefix:(id)a3;
- (void)setPremiumRate:(id)a3;
- (void)setSameMobileAndFixedLinePattern:(BOOL)a3;
- (void)setSharedCost:(id)a3;
- (void)setTollFree:(id)a3;
- (void)setUan:(id)a3;
- (void)setVoicemail:(id)a3;
- (void)setVoip:(id)a3;
@end

@implementation _NBPhoneMetaData

- (_NBPhoneMetaData)init
{
  v9.receiver = self;
  v9.super_class = (Class)_NBPhoneMetaData;
  v2 = [(_NBPhoneMetaData *)&v9 init];
  if (v2)
  {
    v3 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    numberFormats = v2->_numberFormats;
    v2->_numberFormats = v3;

    v5 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    intlNumberFormats = v2->_intlNumberFormats;
    v2->_intlNumberFormats = v5;

    v2->_leadingZeroPossible = 0;
    *(_WORD *)&v2->_sameMobileAndFixedLinePattern = 0;
    internationalPrefix = v2->_internationalPrefix;
    v2->_internationalPrefix = (NSString *)@"NA";
  }
  return v2;
}

- (_NBPhoneMetaData)initWithEntry:(id)a3
{
  id v4 = a3;
  v87.receiver = self;
  v87.super_class = (Class)_NBPhoneMetaData;
  v5 = [(_NBPhoneMetaData *)&v87 init];
  v6 = v5;
  if (v4 && v5)
  {
    v7 = [_NBPhoneNumberDesc alloc];
    v8 = objc_msgSend(v4, "nb_safeArrayAtIndex:", 1);
    uint64_t v9 = [(_NBPhoneNumberDesc *)v7 initWithEntry:v8];
    generalDesc = v6->_generalDesc;
    v6->_generalDesc = (_NBPhoneNumberDesc *)v9;

    v11 = [_NBPhoneNumberDesc alloc];
    v12 = objc_msgSend(v4, "nb_safeArrayAtIndex:", 2);
    uint64_t v13 = [(_NBPhoneNumberDesc *)v11 initWithEntry:v12];
    fixedLine = v6->_fixedLine;
    v6->_fixedLine = (_NBPhoneNumberDesc *)v13;

    v15 = [_NBPhoneNumberDesc alloc];
    v16 = objc_msgSend(v4, "nb_safeArrayAtIndex:", 3);
    uint64_t v17 = [(_NBPhoneNumberDesc *)v15 initWithEntry:v16];
    mobile = v6->_mobile;
    v6->_mobile = (_NBPhoneNumberDesc *)v17;

    v19 = [_NBPhoneNumberDesc alloc];
    v20 = objc_msgSend(v4, "nb_safeArrayAtIndex:", 4);
    uint64_t v21 = [(_NBPhoneNumberDesc *)v19 initWithEntry:v20];
    tollFree = v6->_tollFree;
    v6->_tollFree = (_NBPhoneNumberDesc *)v21;

    v23 = [_NBPhoneNumberDesc alloc];
    v24 = objc_msgSend(v4, "nb_safeArrayAtIndex:", 5);
    uint64_t v25 = [(_NBPhoneNumberDesc *)v23 initWithEntry:v24];
    premiumRate = v6->_premiumRate;
    v6->_premiumRate = (_NBPhoneNumberDesc *)v25;

    v27 = [_NBPhoneNumberDesc alloc];
    v28 = objc_msgSend(v4, "nb_safeArrayAtIndex:", 6);
    uint64_t v29 = [(_NBPhoneNumberDesc *)v27 initWithEntry:v28];
    sharedCost = v6->_sharedCost;
    v6->_sharedCost = (_NBPhoneNumberDesc *)v29;

    v31 = [_NBPhoneNumberDesc alloc];
    v32 = objc_msgSend(v4, "nb_safeArrayAtIndex:", 7);
    uint64_t v33 = [(_NBPhoneNumberDesc *)v31 initWithEntry:v32];
    personalNumber = v6->_personalNumber;
    v6->_personalNumber = (_NBPhoneNumberDesc *)v33;

    v35 = [_NBPhoneNumberDesc alloc];
    v36 = objc_msgSend(v4, "nb_safeArrayAtIndex:", 8);
    uint64_t v37 = [(_NBPhoneNumberDesc *)v35 initWithEntry:v36];
    voip = v6->_voip;
    v6->_voip = (_NBPhoneNumberDesc *)v37;

    v39 = [_NBPhoneNumberDesc alloc];
    v40 = objc_msgSend(v4, "nb_safeArrayAtIndex:", 21);
    uint64_t v41 = [(_NBPhoneNumberDesc *)v39 initWithEntry:v40];
    pager = v6->_pager;
    v6->_pager = (_NBPhoneNumberDesc *)v41;

    v43 = [_NBPhoneNumberDesc alloc];
    v44 = objc_msgSend(v4, "nb_safeArrayAtIndex:", 25);
    uint64_t v45 = [(_NBPhoneNumberDesc *)v43 initWithEntry:v44];
    uan = v6->_uan;
    v6->_uan = (_NBPhoneNumberDesc *)v45;

    v47 = [_NBPhoneNumberDesc alloc];
    v48 = objc_msgSend(v4, "nb_safeArrayAtIndex:", 27);
    uint64_t v49 = [(_NBPhoneNumberDesc *)v47 initWithEntry:v48];
    emergency = v6->_emergency;
    v6->_emergency = (_NBPhoneNumberDesc *)v49;

    v51 = [_NBPhoneNumberDesc alloc];
    v52 = objc_msgSend(v4, "nb_safeArrayAtIndex:", 28);
    uint64_t v53 = [(_NBPhoneNumberDesc *)v51 initWithEntry:v52];
    voicemail = v6->_voicemail;
    v6->_voicemail = (_NBPhoneNumberDesc *)v53;

    v55 = [_NBPhoneNumberDesc alloc];
    v56 = objc_msgSend(v4, "nb_safeArrayAtIndex:", 24);
    uint64_t v57 = [(_NBPhoneNumberDesc *)v55 initWithEntry:v56];
    noInternationalDialling = v6->_noInternationalDialling;
    v6->_noInternationalDialling = (_NBPhoneNumberDesc *)v57;

    uint64_t v59 = objc_msgSend(v4, "nb_safeStringAtIndex:", 9);
    codeID = v6->_codeID;
    v6->_codeID = (NSString *)v59;

    uint64_t v61 = objc_msgSend(v4, "nb_safeNumberAtIndex:", 10);
    countryCode = v6->_countryCode;
    v6->_countryCode = (NSNumber *)v61;

    uint64_t v63 = objc_msgSend(v4, "nb_safeStringAtIndex:", 11);
    internationalPrefix = v6->_internationalPrefix;
    v6->_internationalPrefix = (NSString *)v63;

    uint64_t v65 = objc_msgSend(v4, "nb_safeStringAtIndex:", 17);
    preferredInternationalPrefix = v6->_preferredInternationalPrefix;
    v6->_preferredInternationalPrefix = (NSString *)v65;

    uint64_t v67 = objc_msgSend(v4, "nb_safeStringAtIndex:", 12);
    nationalPrefix = v6->_nationalPrefix;
    v6->_nationalPrefix = (NSString *)v67;

    uint64_t v69 = objc_msgSend(v4, "nb_safeStringAtIndex:", 13);
    preferredExtnPrefix = v6->_preferredExtnPrefix;
    v6->_preferredExtnPrefix = (NSString *)v69;

    uint64_t v71 = objc_msgSend(v4, "nb_safeStringAtIndex:", 15);
    nationalPrefixForParsing = v6->_nationalPrefixForParsing;
    v6->_nationalPrefixForParsing = (NSString *)v71;

    uint64_t v73 = objc_msgSend(v4, "nb_safeStringAtIndex:", 16);
    nationalPrefixTransformRule = v6->_nationalPrefixTransformRule;
    v6->_nationalPrefixTransformRule = (NSString *)v73;

    v75 = objc_msgSend(v4, "nb_safeNumberAtIndex:", 18);
    v6->_sameMobileAndFixedLinePattern = [v75 BOOLValue];

    v76 = objc_msgSend(v4, "nb_safeArrayAtIndex:", 19);
    uint64_t v77 = [(_NBPhoneMetaData *)v6 numberFormatsFromEntry:v76];
    numberFormats = v6->_numberFormats;
    v6->_numberFormats = (NSArray *)v77;

    v79 = objc_msgSend(v4, "nb_safeArrayAtIndex:", 20);
    uint64_t v80 = [(_NBPhoneMetaData *)v6 numberFormatsFromEntry:v79];
    intlNumberFormats = v6->_intlNumberFormats;
    v6->_intlNumberFormats = (NSArray *)v80;

    v82 = objc_msgSend(v4, "nb_safeNumberAtIndex:", 22);
    v6->_mainCountryForCode = [v82 BOOLValue];

    uint64_t v83 = objc_msgSend(v4, "nb_safeStringAtIndex:", 23);
    leadingDigits = v6->_leadingDigits;
    v6->_leadingDigits = (NSString *)v83;

    v85 = objc_msgSend(v4, "nb_safeNumberAtIndex:", 26);
    v6->_leadingZeroPossible = [v85 BOOLValue];
  }
  return v6;
}

- (id)numberFormatsFromEntry:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v11 = [_NBNumberFormat alloc];
        v12 = -[_NBNumberFormat initWithEntry:](v11, "initWithEntry:", v10, (void)v14);
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)description
{
  v2 = @"Y";
  if (self->_sameMobileAndFixedLinePattern) {
    id v3 = @"Y";
  }
  else {
    id v3 = @"N";
  }
  if (self->_mainCountryForCode) {
    id v4 = @"Y";
  }
  else {
    id v4 = @"N";
  }
  if (!self->_leadingZeroPossible) {
    v2 = @"N";
  }
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"* codeID[%@] countryCode[%@] generalDesc[%@] fixedLine[%@] mobile[%@] tollFree[%@] premiumRate[%@] sharedCost[%@] personalNumber[%@] voip[%@] pager[%@] uan[%@] emergency[%@] voicemail[%@] noInternationalDialling[%@] internationalPrefix[%@] preferredInternationalPrefix[%@] nationalPrefix[%@] preferredExtnPrefix[%@] nationalPrefixForParsing[%@] nationalPrefixTransformRule[%@] sameMobileAndFixedLinePattern[%@] numberFormats[%@] intlNumberFormats[%@] mainCountryForCode[%@] leadingDigits[%@] leadingZeroPossible[%@]", *(_OWORD *)&self->_codeID, *(_OWORD *)&self->_generalDesc, *(_OWORD *)&self->_mobile, *(_OWORD *)&self->_premiumRate, *(_OWORD *)&self->_personalNumber, *(_OWORD *)&self->_pager, *(_OWORD *)&self->_emergency, self->_noInternationalDialling, self->_internationalPrefix, self->_preferredInternationalPrefix, self->_nationalPrefix, self->_preferredExtnPrefix, self->_nationalPrefixForParsing, self->_nationalPrefixTransformRule, v3, self->_numberFormats,
               self->_intlNumberFormats,
               v4,
               self->_leadingDigits,
               v2);
}

- (_NBPhoneNumberDesc)generalDesc
{
  return self->_generalDesc;
}

- (void)setGeneralDesc:(id)a3
{
}

- (_NBPhoneNumberDesc)fixedLine
{
  return self->_fixedLine;
}

- (void)setFixedLine:(id)a3
{
}

- (_NBPhoneNumberDesc)mobile
{
  return self->_mobile;
}

- (void)setMobile:(id)a3
{
}

- (_NBPhoneNumberDesc)tollFree
{
  return self->_tollFree;
}

- (void)setTollFree:(id)a3
{
}

- (_NBPhoneNumberDesc)premiumRate
{
  return self->_premiumRate;
}

- (void)setPremiumRate:(id)a3
{
}

- (_NBPhoneNumberDesc)sharedCost
{
  return self->_sharedCost;
}

- (void)setSharedCost:(id)a3
{
}

- (_NBPhoneNumberDesc)personalNumber
{
  return self->_personalNumber;
}

- (void)setPersonalNumber:(id)a3
{
}

- (_NBPhoneNumberDesc)voip
{
  return self->_voip;
}

- (void)setVoip:(id)a3
{
}

- (_NBPhoneNumberDesc)pager
{
  return self->_pager;
}

- (void)setPager:(id)a3
{
}

- (_NBPhoneNumberDesc)uan
{
  return self->_uan;
}

- (void)setUan:(id)a3
{
}

- (_NBPhoneNumberDesc)emergency
{
  return self->_emergency;
}

- (void)setEmergency:(id)a3
{
}

- (_NBPhoneNumberDesc)voicemail
{
  return self->_voicemail;
}

- (void)setVoicemail:(id)a3
{
}

- (_NBPhoneNumberDesc)noInternationalDialling
{
  return self->_noInternationalDialling;
}

- (void)setNoInternationalDialling:(id)a3
{
}

- (NSString)codeID
{
  return self->_codeID;
}

- (void)setCodeID:(id)a3
{
}

- (NSNumber)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (NSString)internationalPrefix
{
  return self->_internationalPrefix;
}

- (void)setInternationalPrefix:(id)a3
{
}

- (NSString)preferredInternationalPrefix
{
  return self->_preferredInternationalPrefix;
}

- (void)setPreferredInternationalPrefix:(id)a3
{
}

- (NSString)nationalPrefix
{
  return self->_nationalPrefix;
}

- (void)setNationalPrefix:(id)a3
{
}

- (NSString)preferredExtnPrefix
{
  return self->_preferredExtnPrefix;
}

- (void)setPreferredExtnPrefix:(id)a3
{
}

- (NSString)nationalPrefixForParsing
{
  return self->_nationalPrefixForParsing;
}

- (void)setNationalPrefixForParsing:(id)a3
{
}

- (NSString)nationalPrefixTransformRule
{
  return self->_nationalPrefixTransformRule;
}

- (void)setNationalPrefixTransformRule:(id)a3
{
}

- (BOOL)sameMobileAndFixedLinePattern
{
  return self->_sameMobileAndFixedLinePattern;
}

- (void)setSameMobileAndFixedLinePattern:(BOOL)a3
{
  self->_sameMobileAndFixedLinePattern = a3;
}

- (NSArray)numberFormats
{
  return self->_numberFormats;
}

- (void)setNumberFormats:(id)a3
{
}

- (NSArray)intlNumberFormats
{
  return self->_intlNumberFormats;
}

- (void)setIntlNumberFormats:(id)a3
{
}

- (BOOL)mainCountryForCode
{
  return self->_mainCountryForCode;
}

- (void)setMainCountryForCode:(BOOL)a3
{
  self->_mainCountryForCode = a3;
}

- (NSString)leadingDigits
{
  return self->_leadingDigits;
}

- (void)setLeadingDigits:(id)a3
{
}

- (BOOL)leadingZeroPossible
{
  return self->_leadingZeroPossible;
}

- (void)setLeadingZeroPossible:(BOOL)a3
{
  self->_leadingZeroPossible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leadingDigits, 0);
  objc_storeStrong((id *)&self->_intlNumberFormats, 0);
  objc_storeStrong((id *)&self->_numberFormats, 0);
  objc_storeStrong((id *)&self->_nationalPrefixTransformRule, 0);
  objc_storeStrong((id *)&self->_nationalPrefixForParsing, 0);
  objc_storeStrong((id *)&self->_preferredExtnPrefix, 0);
  objc_storeStrong((id *)&self->_nationalPrefix, 0);
  objc_storeStrong((id *)&self->_preferredInternationalPrefix, 0);
  objc_storeStrong((id *)&self->_internationalPrefix, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_codeID, 0);
  objc_storeStrong((id *)&self->_noInternationalDialling, 0);
  objc_storeStrong((id *)&self->_voicemail, 0);
  objc_storeStrong((id *)&self->_emergency, 0);
  objc_storeStrong((id *)&self->_uan, 0);
  objc_storeStrong((id *)&self->_pager, 0);
  objc_storeStrong((id *)&self->_voip, 0);
  objc_storeStrong((id *)&self->_personalNumber, 0);
  objc_storeStrong((id *)&self->_sharedCost, 0);
  objc_storeStrong((id *)&self->_premiumRate, 0);
  objc_storeStrong((id *)&self->_tollFree, 0);
  objc_storeStrong((id *)&self->_mobile, 0);
  objc_storeStrong((id *)&self->_fixedLine, 0);

  objc_storeStrong((id *)&self->_generalDesc, 0);
}

@end