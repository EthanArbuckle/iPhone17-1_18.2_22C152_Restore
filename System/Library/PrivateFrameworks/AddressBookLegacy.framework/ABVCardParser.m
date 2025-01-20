@interface ABVCardParser
+ (__CFArray)supportedProperties;
- (ABVCardParser)init;
- (ABVCardParser)initWithData:(id)a3;
- (ABVCardParser)initWithData:(id)a3 watchdogTimer:(id)a4;
- (BOOL)_handleUnknownTag:(id)a3 withValue:(id)a4;
- (BOOL)_setDataValueOrNoteIfNull:(id)a3 forProperty:(unsigned int)a4;
- (BOOL)_setIntValueOrNoteIfNull:(int)a3 forProperty:(int)a4;
- (BOOL)_setMultiValuesOrNoteIfNull:(id)a3 forProperty:(unsigned int)a4 valueComparator:(id)a5;
- (BOOL)_setPersonSounds:(void *)a3 identifier:(int)a4 fromActivity:(id)a5 alert:(id)a6 otherValue:(id)a7;
- (BOOL)_setStringValueOrNoteIfNull:(id)a3 forProperty:(unsigned int)a4;
- (BOOL)_usesArrayForExternalPropKey:(id)a3;
- (BOOL)_usesRemainingLineForExternalPropKey:(id)a3;
- (BOOL)addIMValueTo:(id)a3;
- (BOOL)hasImportErrors;
- (BOOL)importToPerson:(void *)a3 foundProperties:(const __CFArray *)a4;
- (BOOL)importToValueSetter:(id)a3;
- (BOOL)parseABDATE;
- (BOOL)parseABExtensionType:(id)a3;
- (BOOL)parseABMaiden;
- (BOOL)parseABReleatedNames;
- (BOOL)parseABUID;
- (BOOL)parseADD;
- (BOOL)parseADR;
- (BOOL)parseActivityAlerts;
- (BOOL)parseAddressingGrammar;
- (BOOL)parseAlternateBirthday;
- (BOOL)parseBDAY;
- (BOOL)parseEMAIL;
- (BOOL)parseGuardianWhitelisted;
- (BOOL)parseIMAGEHASH;
- (BOOL)parseIMAGETYPE;
- (BOOL)parseIMPP;
- (BOOL)parseItem;
- (BOOL)parseN;
- (BOOL)parseNICKNAME;
- (BOOL)parseORG;
- (BOOL)parsePhoto:(id)a3;
- (BOOL)parseSensitiveContentConfigurationData;
- (BOOL)parseSocialProfiles;
- (BOOL)parseTEL;
- (BOOL)parseUID;
- (BOOL)parseVERSION;
- (BOOL)parseWallpaper:(id)a3;
- (__CFArray)peopleAndProperties:(const __CFArray *)a3;
- (id)_genericLabel;
- (id)_socialProfileBundleIdentifiers;
- (id)_socialProfileDisplayName;
- (id)_socialProfileService;
- (id)_socialProfileTeamIdentifier;
- (id)_socialProfileUserId;
- (id)_socialProfileUsername;
- (id)_valueSetter;
- (id)dateFromISO8601String:(id)a3;
- (id)defaultADRLabel;
- (id)defaultLabel;
- (id)defaultURLLabel;
- (id)genericLabel;
- (id)parseInstantMessengerProfile:(id)a3;
- (id)parseRemainingLine;
- (id)parseSingleValue;
- (id)parseURL;
- (id)parseValueArray;
- (id)phoneLabel;
- (id)sortedPeopleAndProperties:(const __CFArray *)a3;
- (int)_addIMHandles:(id)a3 toService:(__CFString *)a4 multiValue:(void *)a5 uniquenessCheckingMultiValue:(void *)a6;
- (int)_addIMPPProfiles:(id)a3 multiValue:(void *)a4 uniquenessCheckingMultiValue:(void *)a5;
- (void)_setValueFromExtension:(id)a3 forKey:(id)a4 onAddress:(id)a5 toKey:(id)a6;
- (void)addActivityAlertMultiValues;
- (void)addAddressMultiValues;
- (void)addInstantMessageMultiValues;
- (void)addMultiValues:(id)a3 toProperty:(unsigned int)a4 valueComparator:(id)a5;
- (void)addSocialProfileMultiValues;
- (void)cleanUpCardState;
- (void)copyNextPersonWithLength:(int *)a3 foundProperties:(const __CFArray *)a4;
- (void)dealloc;
- (void)parseABShowAs;
- (void)parseSharedPhotoDisplayPreference;
- (void)setSource:(void *)a3;
- (void)source;
@end

@implementation ABVCardParser

+ (__CFArray)supportedProperties
{
  return +[ABVCardPersonValueSetter supportedProperties];
}

- (ABVCardParser)init
{
  return [(ABVCardParser *)self initWithData:0];
}

- (ABVCardParser)initWithData:(id)a3
{
  v5 = +[ABVCardWatchdogTimer timerWithTimeProvider:objc_alloc_init(_ABVCardTimeProvider)];
  return [(ABVCardParser *)self initWithData:a3 watchdogTimer:v5];
}

- (ABVCardParser)initWithData:(id)a3 watchdogTimer:(id)a4
{
  if (a3
    && [a3 length]
    && (v11.receiver = self,
        v11.super_class = (Class)ABVCardParser,
        self = [(ABVCardParser *)&v11 init],
        self->_data = (NSData *)a3,
        self->_timer = (ABVCardWatchdogTimer *)a4,
        v7 = [[ABVCardLexer alloc] initWithData:a3 watchdogTimer:a4], (self->_lexer = v7) != 0))
  {
    v8 = (void *)[[NSString alloc] initWithData:a3 encoding:4];
    if ([v8 hasPrefix:@"BEGIN:VCARD"]
      && [v8 rangeOfString:@"VERSION:3.0"] != 0x7FFFFFFFFFFFFFFFLL)
    {
      self->_defaultEncoding = 4;
    }
    if (!self->_defaultEncoding) {
      self->_defaultEncoding = 1;
    }
  }
  else
  {
    v9 = self;
    return 0;
  }
  return self;
}

- (void)dealloc
{
  [(ABVCardParser *)self cleanUpCardState];
  source = self->_source;
  if (source) {
    CFRelease(source);
  }
  v4.receiver = self;
  v4.super_class = (Class)ABVCardParser;
  [(ABVCardParser *)&v4 dealloc];
}

- (BOOL)hasImportErrors
{
  return self->_hasImportErrors;
}

- (void)cleanUpCardState
{
  self->_imageURI = 0;
  *(_OWORD *)&self->_first = 0u;
  *(_OWORD *)&self->_org = 0u;

  self->_emails = 0;
  self->_urls = 0;

  self->_relatedNames = 0;
  self->_dates = 0;

  self->_phones = 0;
  self->_addresses = 0;

  self->_aims = 0;
  self->_jabbers = 0;

  self->_msns = 0;
  self->_yahoos = 0;

  self->_icqs = 0;
  self->_untypedIMs = 0;

  self->_socialProfiles = 0;
  self->_instantMessengers = 0;

  self->_activityAlerts = 0;
  self->_notes = 0;

  self->_otherNotes = 0;
  self->_extensions = 0;

  self->_imageData = 0;
  self->_uid = 0;
  *(void *)&self->_cropRectX = 0;
  *(void *)&self->_cropRectWidth = 0;
  v3 = self->_cropRectChecksum;
  self->_cropRectChecksum = 0;

  self->_addressingGrammars = 0;
}

- (void)setSource:(void *)a3
{
  source = self->_source;
  if (source != a3)
  {
    if (source) {
      CFRelease(source);
    }
    if (a3) {
      CFRetain(a3);
    }
    self->_source = a3;
  }
}

- (void)source
{
  return self->_source;
}

- (void)addMultiValues:(id)a3 toProperty:(unsigned int)a4 valueComparator:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  if ([(ABVCardValueSetter *)self->_valueSetter propertyIsValidForPerson:*(void *)&a4])
  {
    uint64_t v8 = [a3 count];
    ABPropertyType TypeOfProperty = ABPersonGetTypeOfProperty(v5);
    v10 = [(ABVCardValueSetter *)self->_valueSetter valueForProperty:v5];
    if (v10)
    {
      objc_super v11 = v10;
      CFIndex Count = ABMultiValueGetCount(v10);
      cf = ABMultiValueCreateMutableCopy(v11);
    }
    else
    {
      cf = ABMultiValueCreateMutable(TypeOfProperty);
      CFIndex Count = 0;
    }
    unsigned int v24 = v5;
    uint64_t v12 = 0;
    if (v8)
    {
      uint64_t v13 = 0;
      CFStringRef v14 = (const __CFString *)*MEMORY[0x1E4F1D260];
      do
      {
        v15 = objc_msgSend(a3, "objectAtIndex:", v13, Count);
        uint64_t v16 = [v15 grouping];
        if (!v16
          || (v17 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_extensions, "objectForKey:", v16), "objectForKey:", @"X-ABLabel"), !objc_msgSend(v17, "count"))|| (CFStringRef v18 = (const __CFString *)objc_msgSend(v17, "objectAtIndex:", 0)) == 0)
        {
          CFStringRef v18 = (const __CFString *)[v15 name];
        }
        if (v18) {
          BOOL v19 = v18 == v14;
        }
        else {
          BOOL v19 = 1;
        }
        int v20 = !v19;
        if (v19) {
          CFStringRef v18 = [(ABVCardParser *)self defaultLabel];
        }
        uint64_t v21 = [v15 value];
        if ((const __CFString *)v21 != v14)
        {
          v22 = (void *)v21;
          if (v21)
          {
            if ((objc_opt_respondsToSelector() & 1) == 0 || [v22 length]) {
              v12 += !ABMultiValueAddValueAndLabelIfUnique(cf, v22, v18, v20, (uint64_t (**)(void *, CFTypeRef, const void *, CFTypeRef *))a5);
            }
          }
        }
        ++v13;
      }
      while (v8 != v13);
    }
    if (Count != v12) {
      [(ABVCardParser *)self setLocalRecordHasAdditionalProperties:1];
    }
    if (v8) {
      [(ABVCardValueSetter *)self->_valueSetter setValue:cf forProperty:v24];
    }
    CFRelease(cf);
  }
}

- (void)_setValueFromExtension:(id)a3 forKey:(id)a4 onAddress:(id)a5 toKey:(id)a6
{
  uint64_t v8 = (void *)[a3 objectForKey:a4];
  if ([v8 count])
  {
    uint64_t v9 = [v8 objectAtIndex:0];
    if (v9)
    {
      [a5 setObject:v9 forKey:a6];
    }
  }
}

- (void)addAddressMultiValues
{
  if ([(ABVCardValueSetter *)self->_valueSetter propertyIsValidForPerson:kABPersonAddressProperty])
  {
    uint64_t v3 = [(NSMutableArray *)self->_addresses count];
    objc_super v4 = [(ABVCardValueSetter *)self->_valueSetter valueForProperty:kABPersonAddressProperty];
    if (v4)
    {
      uint64_t v5 = v4;
      CFIndex Count = ABMultiValueGetCount(v4);
      MutableCopy = ABMultiValueCreateMutableCopy(v5);
    }
    else
    {
      MutableCopy = ABMultiValueCreateMutable(0x105u);
      CFIndex Count = 0;
    }
    if (v3 < 1)
    {
      CFIndex v7 = 0;
    }
    else
    {
      CFIndex v7 = 0;
      for (uint64_t i = 0; i != v3; ++i)
      {
        uint64_t v9 = (void *)[(NSMutableArray *)self->_addresses objectAtIndex:i];
        uint64_t v10 = [v9 grouping];
        objc_super v11 = (void *)[v9 value];
        if (v10
          && ((uint64_t v12 = (void *)[(NSMutableDictionary *)self->_extensions objectForKey:v10],
               uint64_t v13 = (void *)[v12 objectForKey:@"X-ABLabel"],
               ![v13 count])
            ? (CFStringRef v14 = 0)
            : (CFStringRef v14 = (const __CFString *)[v13 objectAtIndex:0]),
              -[ABVCardParser _setValueFromExtension:forKey:onAddress:toKey:](self, "_setValueFromExtension:forKey:onAddress:toKey:", v12, @"X-ABADR", v11, @"CountryCode"), -[ABVCardParser _setValueFromExtension:forKey:onAddress:toKey:](self, "_setValueFromExtension:forKey:onAddress:toKey:", v12, @"X-APPLE-SUBLOCALITY", v11, @"SubLocality"), -[ABVCardParser _setValueFromExtension:forKey:onAddress:toKey:](self, "_setValueFromExtension:forKey:onAddress:toKey:", v12, @"X-APPLE-SUBADMINISTRATIVEAREA", v11,
                @"SubAdministrativeArea"),
              v14))
        {
          int v15 = 1;
        }
        else
        {
          CFStringRef v14 = (const __CFString *)[v9 name];
          int v15 = 0;
        }
        if ([v11 count]) {
          v7 += !ABMultiValueAddValueAndLabelIfUnique(MutableCopy, v11, v14, v15, __block_literal_global_9);
        }
      }
    }
    if (Count > v7) {
      [(ABVCardParser *)self setLocalRecordHasAdditionalProperties:1];
    }
    if (v3 >= 1) {
      [(ABVCardValueSetter *)self->_valueSetter setValue:MutableCopy forProperty:kABPersonAddressProperty];
    }
    CFRelease(MutableCopy);
  }
}

- (void)addSocialProfileMultiValues
{
  if ([(ABVCardValueSetter *)self->_valueSetter propertyIsValidForPerson:kABPersonSocialProfileProperty])
  {
    uint64_t v3 = [(ABVCardValueSetter *)self->_valueSetter valueForProperty:kABPersonSocialProfileProperty];
    if (v3)
    {
      objc_super v4 = v3;
      CFIndex Count = ABMultiValueGetCount(v3);
      MutableCopy = ABMultiValueCreateMutableCopy(v4);
    }
    else
    {
      MutableCopy = ABMultiValueCreateMutable(0x105u);
      CFIndex Count = 0;
    }
    uint64_t v6 = [(NSMutableArray *)self->_socialProfiles count];
    CFIndex v7 = 0;
    if (v6)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v9 = (void *)[(NSMutableArray *)self->_socialProfiles objectAtIndex:i];
        uint64_t v10 = (void *)[v9 value];
        CFStringRef v11 = (const __CFString *)[v9 name];
        if ([v9 grouping])
        {
          uint64_t v12 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_extensions, "objectForKey:", objc_msgSend(v9, "grouping")), "objectForKey:", @"X-SOCIALPROFILE-ABUSERID");
          if ([v12 count]) {
            objc_msgSend(v10, "setObject:forKey:", objc_msgSend(v12, "objectAtIndex:", 0), @"identifier");
          }
        }
        v7 += !ABMultiValueAddValueAndLabelIfUnique(MutableCopy, v10, v11, 0, 0);
      }
    }
    if (Count > v7) {
      [(ABVCardParser *)self setLocalRecordHasAdditionalProperties:1];
    }
    if (v6) {
      [(ABVCardValueSetter *)self->_valueSetter setValue:MutableCopy forProperty:kABPersonSocialProfileProperty];
    }
    CFRelease(MutableCopy);
  }
}

- (int)_addIMHandles:(id)a3 toService:(__CFString *)a4 multiValue:(void *)a5 uniquenessCheckingMultiValue:(void *)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    int v32 = 0;
    uint64_t v33 = *(void *)v35;
    CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F1D260];
    while (1)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v35 != v33) {
          objc_enumerationMutation(a3);
        }
        CFStringRef v11 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v12 = [v11 value];
        uint64_t v13 = [v11 grouping];
        if (v13)
        {
          CFStringRef v14 = (void *)[(NSMutableDictionary *)self->_extensions objectForKey:v13];
          int v15 = (void *)[v14 objectForKey:@"X-ABLabel"];
          if ([v15 count]) {
            CFStringRef v16 = (const __CFString *)[v15 objectAtIndex:0];
          }
          else {
            CFStringRef v16 = 0;
          }
          int v20 = (void *)[v14 objectForKey:@"x-teamidentifier"];
          if ([v20 count]) {
            uint64_t v19 = [v20 objectAtIndex:0];
          }
          else {
            uint64_t v19 = 0;
          }
          uint64_t v21 = (void *)[v14 objectForKey:@"x-bundleidentifiers"];
          if ([v21 count]) {
            uint64_t v18 = [v21 objectAtIndex:0];
          }
          else {
            uint64_t v18 = 0;
          }
          v22 = (void *)[v14 objectForKey:@"x-userid"];
          if ([v22 count])
          {
            uint64_t v17 = [v22 objectAtIndex:0];
            if (v16) {
              goto LABEL_21;
            }
          }
          else
          {
            uint64_t v17 = 0;
            if (v16)
            {
LABEL_21:
              if (v16 != v9) {
                goto LABEL_23;
              }
            }
          }
        }
        else
        {
          uint64_t v17 = 0;
          uint64_t v18 = 0;
          uint64_t v19 = 0;
        }
        CFStringRef v16 = (const __CFString *)[v11 name];
LABEL_23:
        if (v16) {
          BOOL v23 = v16 == v9;
        }
        else {
          BOOL v23 = 1;
        }
        int v24 = !v23;
        if (v23) {
          CFStringRef v16 = [(ABVCardParser *)self defaultLabel];
        }
        if (v12)
        {
          v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", v12, @"username", a4, @"service", 0);
          v26 = v25;
          if (v19) {
            [v25 setObject:v19 forKey:@"teamIdentifier"];
          }
          if (v18) {
            [v26 setObject:v18 forKey:@"bundleIdentifiers"];
          }
          if (v17) {
            [v26 setObject:v17 forKey:@"identifier"];
          }
          if (!ABMultiValueAddValueAndLabelIfUnique(a5, v26, v16, v24, 0)) {
            v32 += ABMultiValueAddValueAndLabelIfUnique(a6, v26, v16, v24, 0);
          }
        }
      }
      uint64_t v8 = [a3 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (!v8) {
        return v32;
      }
    }
  }
  return 0;
}

- (int)_addIMPPProfiles:(id)a3 multiValue:(void *)a4 uniquenessCheckingMultiValue:(void *)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  int v7 = 0;
  uint64_t v8 = *(void *)v30;
  do
  {
    uint64_t v9 = 0;
    do
    {
      if (*(void *)v30 != v8) {
        objc_enumerationMutation(a3);
      }
      uint64_t v10 = *(void **)(*((void *)&v29 + 1) + 8 * v9);
      CFStringRef v11 = objc_msgSend((id)objc_msgSend(v10, "value"), "mutableCopy");
      uint64_t v12 = [v10 name];
      uint64_t v13 = [v10 grouping];
      if (v13)
      {
        CFStringRef v14 = (void *)[(NSMutableDictionary *)self->_extensions objectForKey:v13];
        int v15 = (void *)[v14 objectForKey:@"X-ABLabel"];
        if ([v15 count]) {
          uint64_t v12 = [v15 objectAtIndex:0];
        }
        CFStringRef v16 = (void *)[v14 objectForKey:@"x-teamidentifier"];
        if ([v16 count]) {
          uint64_t v17 = [v16 objectAtIndex:0];
        }
        else {
          uint64_t v17 = 0;
        }
        uint64_t v19 = (void *)[v14 objectForKey:@"x-bundleidentifiers"];
        if ([v19 count]) {
          uint64_t v18 = [v19 objectAtIndex:0];
        }
        else {
          uint64_t v18 = 0;
        }
        int v20 = (void *)[v14 objectForKey:@"x-ueserid"];
        if ([v20 count])
        {
          uint64_t v21 = [v20 objectAtIndex:0];
          goto LABEL_19;
        }
      }
      else
      {
        uint64_t v17 = 0;
        uint64_t v18 = 0;
      }
      uint64_t v21 = 0;
LABEL_19:
      CFStringRef v22 = (const __CFString *)v12;
      if (v12)
      {
        if (!v17) {
          goto LABEL_22;
        }
LABEL_21:
        [v11 setObject:v17 forKey:@"teamIdentifier"];
        goto LABEL_22;
      }
      CFStringRef v22 = [(ABVCardParser *)self defaultLabel];
      if (v17) {
        goto LABEL_21;
      }
LABEL_22:
      if (v18) {
        [v11 setObject:v18 forKey:@"bundleIdentifiers"];
      }
      if (v21) {
        [v11 setObject:v21 forKey:@"identifier"];
      }
      if (!ABMultiValueAddValueAndLabelIfUnique(a4, v11, v22, v12 != 0, 0)) {
        v7 += ABMultiValueAddValueAndLabelIfUnique(a5, v11, v22, v12 != 0, 0);
      }

      ++v9;
    }
    while (v6 != v9);
    uint64_t v23 = [a3 countByEnumeratingWithState:&v29 objects:v33 count:16];
    uint64_t v6 = v23;
  }
  while (v23);
  return v7;
}

- (void)addInstantMessageMultiValues
{
  if ([(ABVCardValueSetter *)self->_valueSetter propertyIsValidForPerson:kABPersonInstantMessageProperty])
  {
    uint64_t v3 = [(ABVCardValueSetter *)self->_valueSetter valueForProperty:kABPersonInstantMessageProperty];
    if (v3)
    {
      objc_super v4 = v3;
      CFIndex Count = ABMultiValueGetCount(v3);
      ABMutableMultiValueRef MutableCopy = ABMultiValueCreateMutableCopy(v4);
    }
    else
    {
      ABMutableMultiValueRef MutableCopy = ABMultiValueCreateMutable(0x105u);
      CFIndex Count = 0;
    }
    ABMutableMultiValueRef Mutable = ABMultiValueCreateMutable(0x105u);
    int v8 = [(ABVCardParser *)self _addIMPPProfiles:self->_instantMessengers multiValue:MutableCopy uniquenessCheckingMultiValue:Mutable];
    uint64_t v9 = [(ABVCardParser *)self _addIMHandles:self->_aims toService:@"AIM" multiValue:MutableCopy uniquenessCheckingMultiValue:Mutable]+ (uint64_t)v8;
    uint64_t v10 = v9
        + [(ABVCardParser *)self _addIMHandles:self->_jabbers toService:@"Jabber" multiValue:MutableCopy uniquenessCheckingMultiValue:Mutable];
    uint64_t v11 = v10
        + [(ABVCardParser *)self _addIMHandles:self->_msns toService:@"MSN" multiValue:MutableCopy uniquenessCheckingMultiValue:Mutable];
    uint64_t v12 = v11
        + [(ABVCardParser *)self _addIMHandles:self->_yahoos toService:@"Yahoo" multiValue:MutableCopy uniquenessCheckingMultiValue:Mutable];
    uint64_t v13 = v12
        + [(ABVCardParser *)self _addIMHandles:self->_icqs toService:@"ICQ" multiValue:MutableCopy uniquenessCheckingMultiValue:Mutable];
    if (Count > v13
               + [(ABVCardParser *)self _addIMHandles:self->_untypedIMs toService:0 multiValue:MutableCopy uniquenessCheckingMultiValue:Mutable])[(ABVCardParser *)self setLocalRecordHasAdditionalProperties:1];
    [(ABVCardValueSetter *)self->_valueSetter setValue:MutableCopy forProperty:kABPersonInstantMessageProperty];
    CFRelease(MutableCopy);
    CFRelease(Mutable);
  }
}

- (BOOL)_setPersonSounds:(void *)a3 identifier:(int)a4 fromActivity:(id)a5 alert:(id)a6 otherValue:(id)a7
{
  int v10 = a4;
  int v19 = a4;
  if (a4 != -3 && (!a5 || !a6))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Either identifier must be kABPersonSoundIdentifierOther or alert and activity must be non nil"];
    return 0;
  }
  CFIndex IndexForIdentifier = ABMultiValueGetIndexForIdentifier(a3, a4);
  if (IndexForIdentifier == -1) {
    CFStringRef v14 = 0;
  }
  else {
    CFStringRef v14 = (void *)ABMultiValueCopyValueAtIndex(a3, IndexForIdentifier);
  }
  if (v10 != -3) {
    a7 = (id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_activityAlerts, "objectForKeyedSubscript:", a5), "objectForKeyedSubscript:", a6);
  }
  if (!a7 || v14)
  {
    if (a7)
    {
      if ([v14 caseInsensitiveCompare:a7]) {
        goto LABEL_13;
      }
    }
    else if (IndexForIdentifier != -1)
    {
      ABMultiValueRemoveValueAndLabelAtIndex(a3, IndexForIdentifier);
LABEL_28:
      BOOL v17 = 1;
      goto LABEL_29;
    }
    BOOL v17 = 0;
LABEL_29:

    return v17;
  }
LABEL_13:
  if (IndexForIdentifier == -1)
  {
    CFIndex Count = ABMultiValueGetCount(a3);
    ABMultiValueInsertAndCreateIdentifier((uint64_t)a3, a7, 0, Count, 0, &v19, 0);
    int v10 = v19;
  }
  else
  {
    ABMultiValueReplaceValueAtIndex(a3, a7, IndexForIdentifier);
  }
  if (v10 == -3) {
    goto LABEL_28;
  }
  if (a5 && a6)
  {
    if ((unint64_t)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_activityAlerts, "objectForKeyedSubscript:", a5), "count") < 2)
    {
      [(NSMutableDictionary *)self->_activityAlerts removeObjectForKey:a5];
    }
    else
    {
      CFStringRef v16 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", -[NSMutableDictionary objectForKeyedSubscript:](self->_activityAlerts, "objectForKeyedSubscript:", a5));
      [v16 removeObjectForKey:a6];
      [(NSMutableDictionary *)self->_activityAlerts setObject:v16 forKeyedSubscript:a5];
    }
    goto LABEL_28;
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Either identifier must be kABPersonSoundIdentifierOther or alert and activity must be non nil"];

  return 0;
}

- (void)addActivityAlertMultiValues
{
  uint64_t v3 = kABPersonSoundProperty;
  if ([(ABVCardValueSetter *)self->_valueSetter propertyIsValidForPerson:kABPersonSoundProperty])
  {
    objc_super v4 = [(ABVCardValueSetter *)self->_valueSetter valueForProperty:v3];
    if (v4) {
      ABMutableMultiValueRef MutableCopy = ABMultiValueCreateMutableCopy(v4);
    }
    else {
      ABMutableMultiValueRef MutableCopy = ABMultiValueCreateMutable(0x101u);
    }
    uint64_t v6 = MutableCopy;
    BOOL v7 = [(ABVCardParser *)self _setPersonSounds:MutableCopy identifier:0xFFFFFFFFLL fromActivity:@"com.apple.activityalert.call" alert:@"sound" otherValue:0];
    int v8 = v7 | [(ABVCardParser *)self _setPersonSounds:v6 identifier:4294967195 fromActivity:@"com.apple.activityalert.call" alert:@"vibration" otherValue:0];
    BOOL v9 = [(ABVCardParser *)self _setPersonSounds:v6 identifier:4294967292 fromActivity:@"com.apple.activityalert.call" alert:@"ignoreMute" otherValue:0];
    int v10 = v8 | v9 | [(ABVCardParser *)self _setPersonSounds:v6 identifier:4294967294 fromActivity:@"com.apple.activityalert.text" alert:@"sound" otherValue:0];
    BOOL v11 = [(ABVCardParser *)self _setPersonSounds:v6 identifier:4294967194 fromActivity:@"com.apple.activityalert.text" alert:@"vibration" otherValue:0];
    int v12 = v10 | v11 | [(ABVCardParser *)self _setPersonSounds:v6 identifier:4294967291 fromActivity:@"com.apple.activityalert.text" alert:@"ignoreMute" otherValue:0];
    if ([(NSMutableDictionary *)self->_activityAlerts count])
    {
      uint64_t v13 = [MEMORY[0x1E4F28D90] dataWithJSONObject:self->_activityAlerts options:0 error:0];
      CFStringRef v14 = (void *)[[NSString alloc] initWithData:v13 encoding:4];
    }
    else
    {
      CFStringRef v14 = 0;
    }
    int v15 = v12 | [(ABVCardParser *)self _setPersonSounds:v6 identifier:4294967293 fromActivity:0 alert:0 otherValue:v14];

    if (v15 == 1)
    {
      [(ABVCardParser *)self setLocalRecordHasAdditionalProperties:1];
      [(ABVCardValueSetter *)self->_valueSetter setValue:v6 forProperty:v3];
    }
    CFRelease(v6);
  }
}

- (BOOL)parseVERSION
{
  id v3 = [(ABVCardLexer *)self->_lexer nextStringInEncoding:1 quotedPrintable:0 stopTokens:36864 trim:1];
  id v4 = v3;
  if (v3) {
    self->_30vCard = [v3 compare:@"3.0" options:1] == 0;
  }
  return v4 != 0;
}

- (BOOL)_setIntValueOrNoteIfNull:(int)a3 forProperty:(int)a4
{
  return 1;
}

- (BOOL)_setDataValueOrNoteIfNull:(id)a3 forProperty:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (a3 && [a3 length])
  {
    [(ABVCardValueSetter *)self->_valueSetter setValue:a3 forProperty:v4];
    return 1;
  }
  else
  {
    [(ABVCardParser *)self noteLackOfValueForProperty:v4];
    return 0;
  }
}

- (BOOL)_setStringValueOrNoteIfNull:(id)a3 forProperty:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (a3 && [a3 length])
  {
    [(ABVCardValueSetter *)self->_valueSetter setValue:a3 forProperty:v4];
    return 1;
  }
  else
  {
    [(ABVCardParser *)self noteLackOfValueForProperty:v4];
    return 0;
  }
}

- (BOOL)_setMultiValuesOrNoteIfNull:(id)a3 forProperty:(unsigned int)a4 valueComparator:(id)a5
{
  if (a3) {
    [(ABVCardParser *)self addMultiValues:a3 toProperty:*(void *)&a4 valueComparator:a5];
  }
  else {
    [(ABVCardParser *)self noteLackOfValueForProperty:*(void *)&a4];
  }
  return a3 != 0;
}

- (BOOL)parseN
{
  id v3 = [(ABVCardLexer *)self->_lexer nextStringInEncoding:self->_encoding quotedPrintable:self->_quotedPrintable stopTokens:36864 trim:1];
  self->_last = v3;
  [(ABVCardParser *)self _setStringValueOrNoteIfNull:v3 forProperty:kABPersonLastNameProperty];
  if ([(ABVCardLexer *)self->_lexer nextTokenPeak:1] == 4097)
  {
    [(ABVCardLexer *)self->_lexer advanceToPeakPoint];
    uint64_t v4 = [(ABVCardLexer *)self->_lexer nextStringInEncoding:self->_encoding quotedPrintable:self->_quotedPrintable stopTokens:36864 trim:1];
    self->_first = v4;
    [(ABVCardParser *)self _setStringValueOrNoteIfNull:v4 forProperty:kABPersonFirstNameProperty];
    if ([(ABVCardLexer *)self->_lexer nextTokenPeak:1] == 4097)
    {
      [(ABVCardLexer *)self->_lexer advanceToPeakPoint];
      [(ABVCardParser *)self _setStringValueOrNoteIfNull:[(ABVCardLexer *)self->_lexer nextStringInEncoding:self->_encoding quotedPrintable:self->_quotedPrintable stopTokens:36864 trim:1] forProperty:kABPersonMiddleNameProperty];
      if ([(ABVCardLexer *)self->_lexer nextTokenPeak:1] == 4097)
      {
        [(ABVCardLexer *)self->_lexer advanceToPeakPoint];
        [(ABVCardParser *)self _setStringValueOrNoteIfNull:[(ABVCardLexer *)self->_lexer nextStringInEncoding:self->_encoding quotedPrintable:self->_quotedPrintable stopTokens:36864 trim:1] forProperty:kABPersonPrefixProperty];
        if ([(ABVCardLexer *)self->_lexer nextTokenPeak:1] == 4097)
        {
          [(ABVCardLexer *)self->_lexer advanceToPeakPoint];
          [(ABVCardParser *)self _setStringValueOrNoteIfNull:[(ABVCardLexer *)self->_lexer nextStringInEncoding:self->_encoding quotedPrintable:self->_quotedPrintable stopTokens:36864 trim:1] forProperty:kABPersonSuffixProperty];
          if ([(ABVCardLexer *)self->_lexer nextTokenPeak:1] == 4097) {
            [(ABVCardLexer *)self->_lexer advanceToPeakPoint];
          }
        }
      }
    }
  }
  return 1;
}

- (BOOL)parseNICKNAME
{
  BOOL v3 = [(ABVCardParser *)self _setStringValueOrNoteIfNull:[(ABVCardLexer *)self->_lexer nextStringInEncoding:self->_encoding quotedPrintable:self->_quotedPrintable stopTokens:36864 trim:1] forProperty:kABPersonNicknameProperty];
  if (v3 && [(ABVCardLexer *)self->_lexer nextTokenPeak:1] == 4097) {
    [(ABVCardLexer *)self->_lexer advanceToPeakPoint];
  }
  return v3;
}

- (BOOL)parseABMaiden
{
  id v3 = [(ABVCardLexer *)self->_lexer nextStringInEncoding:self->_encoding quotedPrintable:self->_quotedPrintable stopTokens:36864 trim:1];
  BOOL v4 = [(ABVCardParser *)self _setStringValueOrNoteIfNull:v3 forProperty:kABPersonPreviousFamilyNameProperty];
  if (v4 && [(ABVCardLexer *)self->_lexer nextTokenPeak:1] == 4097) {
    [(ABVCardLexer *)self->_lexer advanceToPeakPoint];
  }
  return v4;
}

- (BOOL)parseAddressingGrammar
{
  if (!self->_addressingGrammars) {
    self->_addressingGrammars = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  while (1)
  {
    id v3 = [(ABVCardLexer *)self->_lexer nextStringInEncoding:self->_encoding quotedPrintable:self->_quotedPrintable stopTokens:36864 trim:1];
    BOOL v4 = [[ABVCardParameter alloc] initWithName:&stru_1EF03E278];
    [(ABVCardParameter *)v4 setValue:v3];
    if (self->_grouping) {
      -[ABVCardParameter setGrouping:](v4, "setGrouping:");
    }
    [(NSMutableArray *)self->_addressingGrammars addObject:v4];

    if ([(ABVCardLexer *)self->_lexer nextTokenPeak:1] != 4097) {
      break;
    }
    [(ABVCardLexer *)self->_lexer advanceToPeakPoint];
  }
  return 1;
}

- (BOOL)parseORG
{
  self->_org = (NSString *)[(ABVCardLexer *)self->_lexer nextStringInEncoding:self->_encoding quotedPrintable:self->_quotedPrintable stopTokens:36864 trim:1];
  if ([(ABVCardLexer *)self->_lexer nextTokenPeak:1] == 4097)
  {
    [(ABVCardLexer *)self->_lexer advanceToPeakPoint];
    [(ABVCardParser *)self _setStringValueOrNoteIfNull:[(ABVCardLexer *)self->_lexer nextStringInEncoding:self->_encoding quotedPrintable:self->_quotedPrintable stopTokens:36864 trim:1] forProperty:kABPersonDepartmentProperty];
    if ([(ABVCardLexer *)self->_lexer nextTokenPeak:1] == 4097) {
      [(ABVCardLexer *)self->_lexer advanceToPeakPoint];
    }
  }
  return 1;
}

- (id)parseSingleValue
{
  id v3 = [(ABVCardLexer *)self->_lexer nextStringInEncoding:self->_encoding quotedPrintable:self->_quotedPrintable stopTokens:36864 trim:1];
  if ([(ABVCardLexer *)self->_lexer nextTokenPeak:1] == 4097) {
    [(ABVCardLexer *)self->_lexer advanceToPeakPoint];
  }
  return v3;
}

- (id)parseRemainingLine
{
  id v3 = [(ABVCardLexer *)self->_lexer nextStringInEncoding:self->_encoding quotedPrintable:self->_quotedPrintable stopTokens:0x8000 trim:1];
  if ([(ABVCardLexer *)self->_lexer nextTokenPeak:1] == 4097) {
    [(ABVCardLexer *)self->_lexer advanceToPeakPoint];
  }
  return v3;
}

- (id)parseValueArray
{
  id v3 = [(ABVCardLexer *)self->_lexer nextArraySeperatedByToken:64 stoppingAt:36864 inEncoding:self->_encoding];
  if ([(ABVCardLexer *)self->_lexer nextTokenPeak:1] == 4097) {
    [(ABVCardLexer *)self->_lexer advanceToPeakPoint];
  }
  return v3;
}

- (id)parseURL
{
  id v3 = [(ABVCardLexer *)self->_lexer nextStringInEncoding:self->_encoding quotedPrintable:self->_quotedPrintable stopTokens:0x8000 trim:1];
  if ([(ABVCardLexer *)self->_lexer nextTokenPeak:1] == 4097) {
    [(ABVCardLexer *)self->_lexer advanceToPeakPoint];
  }
  return v3;
}

- (id)_genericLabel
{
  id result = (id)[(NSMutableArray *)self->_itemParameters count];
  if (result)
  {
    id v4 = result;
    uint64_t v5 = 0;
    while (1)
    {
      uint64_t v6 = objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_itemParameters, "objectAtIndex:", v5), "types");
      uint64_t v7 = [v6 count];
      if (v7) {
        break;
      }
LABEL_9:
      if ((id)++v5 == v4) {
        return 0;
      }
    }
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    while (1)
    {
      int v10 = (void *)[v6 objectAtIndex:v9];
      if (![v10 compare:@"HOME" options:1])
      {
        BOOL v11 = (id *)&kABHomeLabel;
        return *v11;
      }
      if (![v10 compare:@"WORK" options:1])
      {
        BOOL v11 = (id *)&kABWorkLabel;
        return *v11;
      }
      if (![v10 compare:@"OTHER" options:1]) {
        break;
      }
      if (v8 == ++v9) {
        goto LABEL_9;
      }
    }
    BOOL v11 = (id *)&kABOtherLabel;
    return *v11;
  }
  return result;
}

- (id)genericLabel
{
  id result = [(ABVCardParser *)self _genericLabel];
  if (!result) {
    return @"_$!<Work>!$_";
  }
  return result;
}

- (id)defaultLabel
{
  return @"_$!<Other>!$_";
}

- (id)defaultADRLabel
{
  return @"_$!<Home>!$_";
}

- (id)defaultURLLabel
{
  return @"_$!<HomePage>!$_";
}

- (id)phoneLabel
{
  v2 = self;
  id result = (id)[(NSMutableArray *)self->_itemParameters count];
  int v20 = (char *)result;
  if (result)
  {
    id v4 = 0;
    char v21 = 0;
    char v5 = 0;
    char v6 = 0;
    char v7 = 0;
    char v8 = 0;
    uint64_t v9 = 0;
    int v19 = v2;
    do
    {
      int v10 = objc_msgSend((id)-[NSMutableArray objectAtIndex:](v2->_itemParameters, "objectAtIndex:", v9), "types");
      uint64_t v11 = [v10 count];
      if (v11)
      {
        uint64_t v12 = v11;
        for (uint64_t i = 0; v12 != i; ++i)
        {
          CFStringRef v14 = (void *)[v10 objectAtIndex:i];
          int v15 = v14;
          if ((v6 & 1) != 0 || [v14 compare:@"HOME" options:1])
          {
            if ((v7 & 1) != 0 || [v15 compare:@"WORK" options:1])
            {
              if ((v5 & 1) != 0 || [v15 compare:@"OTHER" options:1])
              {
                if ((v8 & 1) != 0 || [v15 compare:@"FAX" options:1])
                {
                  if (![v15 compare:@"MAIN" options:1])
                  {
                    uint64_t v18 = (id *)&kABPersonPhoneMainLabel;
                    return *v18;
                  }
                  if ((v21 & 1) != 0 || [v15 compare:@"CELL" options:1])
                  {
                    if (![v15 compare:@"IPHONE" options:1])
                    {
                      uint64_t v18 = (id *)&kABPersonPhoneIPhoneLabel;
                      return *v18;
                    }
                    if (![v15 compare:@"APPLEWATCH" options:1])
                    {
                      uint64_t v18 = (id *)kABPersonPhoneAppleWatchLabel;
                      return *v18;
                    }
                    if (![v15 compare:@"PAGER" options:1])
                    {
                      uint64_t v18 = (id *)&kABPersonPhonePagerLabel;
                      return *v18;
                    }
                    if ([v15 compare:@"TYPE" options:1])
                    {
                      uint64_t v16 = [v15 compare:@"PREF" options:1];
                      if (v4) {
                        BOOL v17 = 1;
                      }
                      else {
                        BOOL v17 = v16 == 0;
                      }
                      if (!v17) {
                        id v4 = v15;
                      }
                    }
                  }
                  else
                  {
                    char v21 = 1;
                  }
                }
                else
                {
                  char v8 = 1;
                }
              }
              else
              {
                char v5 = 1;
              }
            }
            else
            {
              char v7 = 1;
            }
          }
          else
          {
            char v6 = 1;
          }
        }
      }
      ++v9;
      v2 = v19;
    }
    while (v9 != v20);
    if (v6)
    {
      if (v8) {
        uint64_t v18 = (id *)&kABPersonPhoneHomeFAXLabel;
      }
      else {
        uint64_t v18 = (id *)&kABHomeLabel;
      }
      return *v18;
    }
    if (v7)
    {
      if ((v8 & 1) == 0)
      {
        uint64_t v18 = (id *)&kABWorkLabel;
        return *v18;
      }
LABEL_50:
      uint64_t v18 = (id *)&kABPersonPhoneWorkFAXLabel;
      return *v18;
    }
    if (v5)
    {
      if (v8) {
        uint64_t v18 = (id *)&kABPersonPhoneOtherFAXLabel;
      }
      else {
        uint64_t v18 = (id *)&kABOtherLabel;
      }
      return *v18;
    }
    if (v8) {
      goto LABEL_50;
    }
    if (v21) {
      return @"_$!<Mobile>!$_";
    }
    else {
      return v4;
    }
  }
  return result;
}

- (BOOL)parseABUID
{
  id v3 = [(ABVCardParser *)self parseSingleValue];
  id v4 = v3;
  if (v3) {
    self->_uid = (NSString *)v3;
  }
  return v4 != 0;
}

- (BOOL)parseUID
{
  return 0;
}

- (BOOL)parseEMAIL
{
  if (!self->_emails) {
    self->_emails = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  id v3 = [(ABVCardParser *)self genericLabel];
  while (1)
  {
    id v4 = [(ABVCardLexer *)self->_lexer nextStringInEncoding:self->_encoding quotedPrintable:self->_quotedPrintable stopTokens:36864 trim:1];
    char v5 = [[ABVCardParameter alloc] initWithName:v3];
    [(ABVCardParameter *)v5 setValue:v4];
    if (self->_grouping) {
      -[ABVCardParameter setGrouping:](v5, "setGrouping:");
    }
    [(NSMutableArray *)self->_emails addObject:v5];

    if ([(ABVCardLexer *)self->_lexer nextTokenPeak:1] != 4097) {
      break;
    }
    [(ABVCardLexer *)self->_lexer advanceToPeakPoint];
  }
  return 1;
}

- (BOOL)parseTEL
{
  if (!self->_phones) {
    self->_phones = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  id v3 = [(ABVCardParser *)self phoneLabel];
  while (1)
  {
    id v4 = [(ABVCardLexer *)self->_lexer nextStringInEncoding:self->_encoding quotedPrintable:self->_quotedPrintable stopTokens:36864 trim:1];
    char v5 = [[ABVCardParameter alloc] initWithName:v3];
    [(ABVCardParameter *)v5 setValue:v4];
    if (self->_grouping) {
      -[ABVCardParameter setGrouping:](v5, "setGrouping:");
    }
    [(NSMutableArray *)self->_phones addObject:v5];

    if ([(ABVCardLexer *)self->_lexer nextTokenPeak:1] != 4097) {
      break;
    }
    [(ABVCardLexer *)self->_lexer advanceToPeakPoint];
  }
  return 1;
}

- (BOOL)parseADR
{
  if (!self->_addresses) {
    self->_addresses = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  int v5 = 1;
  id v6 = [(ABVCardLexer *)self->_lexer nextStringInEncoding:self->_encoding quotedPrintable:self->_quotedPrintable stopTokens:36864 trim:1];
  if (v6)
  {
    id v7 = v6;
    if ([v6 length])
    {
      [v4 appendString:v7];
      int v5 = 0;
    }
  }
  if ([(ABVCardLexer *)self->_lexer nextTokenPeak:1] == 4097)
  {
    [(ABVCardLexer *)self->_lexer advanceToPeakPoint];
    id v8 = [(ABVCardLexer *)self->_lexer nextStringInEncoding:self->_encoding quotedPrintable:self->_quotedPrintable stopTokens:36864 trim:1];
    id v9 = v8;
    if (v8)
    {
      uint64_t v10 = [v8 length];
      if (v10) {
        char v11 = v5;
      }
      else {
        char v11 = 1;
      }
      if (v10) {
        id v12 = v9;
      }
      else {
        id v12 = 0;
      }
      if (v11) {
        id v9 = v12;
      }
      else {
        [v4 appendString:@"\n"];
      }
    }
    if ([(ABVCardLexer *)self->_lexer nextTokenPeak:1] == 4097)
    {
      [(ABVCardLexer *)self->_lexer advanceToPeakPoint];
      id v13 = [(ABVCardLexer *)self->_lexer nextStringInEncoding:self->_encoding quotedPrintable:self->_quotedPrintable stopTokens:36864 trim:1];
      if (!v13) {
        goto LABEL_25;
      }
      id v14 = v13;
      if (![v13 length]) {
        goto LABEL_25;
      }
      if (((v9 == 0) & ~v5) != 0)
      {
        id v9 = v14;
      }
      else
      {
        [v4 appendString:v14];
        if (!v9) {
          goto LABEL_25;
        }
      }
      [v4 appendString:@"\n"];
      [v4 appendString:v9];
LABEL_25:
      if ([v4 length]) {
        [v3 setObject:v4 forKey:@"Street"];
      }
      if ([(ABVCardLexer *)self->_lexer nextTokenPeak:1] == 4097)
      {
        [(ABVCardLexer *)self->_lexer advanceToPeakPoint];
        id v15 = [(ABVCardLexer *)self->_lexer nextStringInEncoding:self->_encoding quotedPrintable:self->_quotedPrintable stopTokens:36864 trim:1];
        if (v15)
        {
          id v16 = v15;
          if ([v15 length]) {
            [v3 setObject:v16 forKey:@"City"];
          }
        }
        if ([(ABVCardLexer *)self->_lexer nextTokenPeak:1] == 4097)
        {
          [(ABVCardLexer *)self->_lexer advanceToPeakPoint];
          id v17 = [(ABVCardLexer *)self->_lexer nextStringInEncoding:self->_encoding quotedPrintable:self->_quotedPrintable stopTokens:36864 trim:1];
          if (v17)
          {
            id v18 = v17;
            if ([v17 length]) {
              [v3 setObject:v18 forKey:@"State"];
            }
          }
          if ([(ABVCardLexer *)self->_lexer nextTokenPeak:1] == 4097)
          {
            [(ABVCardLexer *)self->_lexer advanceToPeakPoint];
            id v19 = [(ABVCardLexer *)self->_lexer nextStringInEncoding:self->_encoding quotedPrintable:self->_quotedPrintable stopTokens:36864 trim:1];
            if (v19)
            {
              id v20 = v19;
              if ([v19 length]) {
                [v3 setObject:v20 forKey:@"ZIP"];
              }
            }
            if ([(ABVCardLexer *)self->_lexer nextTokenPeak:1] == 4097)
            {
              [(ABVCardLexer *)self->_lexer advanceToPeakPoint];
              id v21 = [(ABVCardLexer *)self->_lexer nextStringInEncoding:self->_encoding quotedPrintable:self->_quotedPrintable stopTokens:36864 trim:1];
              if (v21)
              {
                id v22 = v21;
                if ([v21 length]) {
                  [v3 setObject:v22 forKey:@"Country"];
                }
              }
              if ([(ABVCardLexer *)self->_lexer nextTokenPeak:1] == 4097) {
                [(ABVCardLexer *)self->_lexer advanceToPeakPoint];
              }
            }
          }
        }
      }
    }
  }
  uint64_t v23 = [[ABVCardParameter alloc] initWithName:[(ABVCardParser *)self genericLabel]];
  [(ABVCardParameter *)v23 setValue:v3];
  if (self->_grouping) {
    -[ABVCardParameter setGrouping:](v23, "setGrouping:");
  }
  [(NSMutableArray *)self->_addresses addObject:v23];

  return 1;
}

- (BOOL)parseADD
{
  if (!self->_addresses) {
    self->_addresses = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v5 = [(ABVCardLexer *)self->_lexer nextStringInEncoding:self->_encoding quotedPrintable:self->_quotedPrintable stopTokens:36864 trim:1];
  if (v5 && (id v6 = v5, [v5 length]))
  {
    [v4 appendString:v6];
    int v7 = 1;
  }
  else
  {
    int v7 = 0;
  }
  if ([(ABVCardLexer *)self->_lexer nextTokenPeak:1] == 4097)
  {
    [(ABVCardLexer *)self->_lexer advanceToPeakPoint];
    id v8 = [(ABVCardLexer *)self->_lexer nextStringInEncoding:self->_encoding quotedPrintable:self->_quotedPrintable stopTokens:36864 trim:1];
    if (v8)
    {
      id v9 = v8;
      if ([v8 length])
      {
        if (v7) {
          [v4 appendString:@"\n"];
        }
        [v4 appendString:v9];
      }
    }
    if ([v4 length]) {
      [v3 setObject:v4 forKey:@"Street"];
    }
    if ([(ABVCardLexer *)self->_lexer nextTokenPeak:1] == 4097)
    {
      [(ABVCardLexer *)self->_lexer advanceToPeakPoint];
      id v10 = [(ABVCardLexer *)self->_lexer nextStringInEncoding:self->_encoding quotedPrintable:self->_quotedPrintable stopTokens:36864 trim:1];
      if (v10)
      {
        id v11 = v10;
        if ([v10 length]) {
          [v3 setObject:v11 forKey:@"City"];
        }
      }
      if ([(ABVCardLexer *)self->_lexer nextTokenPeak:1] == 4097)
      {
        [(ABVCardLexer *)self->_lexer advanceToPeakPoint];
        id v12 = [(ABVCardLexer *)self->_lexer nextStringInEncoding:self->_encoding quotedPrintable:self->_quotedPrintable stopTokens:36864 trim:1];
        if (v12)
        {
          id v13 = v12;
          if ([v12 length]) {
            [v3 setObject:v13 forKey:@"State"];
          }
        }
        if ([(ABVCardLexer *)self->_lexer nextTokenPeak:1] == 4097)
        {
          [(ABVCardLexer *)self->_lexer advanceToPeakPoint];
          id v14 = [(ABVCardLexer *)self->_lexer nextStringInEncoding:self->_encoding quotedPrintable:self->_quotedPrintable stopTokens:36864 trim:1];
          if (v14)
          {
            id v15 = v14;
            if ([v14 length]) {
              [v3 setObject:v15 forKey:@"ZIP"];
            }
          }
          if ([(ABVCardLexer *)self->_lexer nextTokenPeak:1] == 4097)
          {
            [(ABVCardLexer *)self->_lexer advanceToPeakPoint];
            id v16 = [(ABVCardLexer *)self->_lexer nextStringInEncoding:self->_encoding quotedPrintable:self->_quotedPrintable stopTokens:36864 trim:1];
            if (v16)
            {
              id v17 = v16;
              if ([v16 length]) {
                [v3 setObject:v17 forKey:@"Country"];
              }
            }
            if ([(ABVCardLexer *)self->_lexer nextTokenPeak:1] == 4097) {
              [(ABVCardLexer *)self->_lexer advanceToPeakPoint];
            }
          }
        }
      }
    }
  }
  id v18 = [[ABVCardParameter alloc] initWithName:[(ABVCardParser *)self genericLabel]];
  [(ABVCardParameter *)v18 setValue:v3];
  [(NSMutableArray *)self->_addresses addObject:v18];

  return 1;
}

- (BOOL)parseABExtensionType:(id)a3
{
  id v5 = [(ABVCardLexer *)self->_lexer nextArraySeperatedByToken:4096 stoppingAt:0x8000 inEncoding:self->_encoding];
  if (v5 && self->_grouping)
  {
    id v6 = v5;
    id v7 = (id)-[NSMutableDictionary objectForKey:](self->_extensions, "objectForKey:");
    if (!v7)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [(NSMutableDictionary *)self->_extensions setObject:v7 forKey:self->_grouping];
    }
    [v7 setObject:v6 forKey:a3];
  }
  return 1;
}

- (id)_socialProfileUserId
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  itemParameters = self->_itemParameters;
  uint64_t v3 = [(NSMutableArray *)itemParameters countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  id v5 = 0;
  uint64_t v6 = *(void *)v11;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v11 != v6) {
        objc_enumerationMutation(itemParameters);
      }
      id v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
      if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "name"), "lowercaseString"), "isEqualToString:", @"x-userid"))id v5 = objc_msgSend(v8, "value"); {
    }
      }
    uint64_t v4 = [(NSMutableArray *)itemParameters countByEnumeratingWithState:&v10 objects:v14 count:16];
  }
  while (v4);
  return v5;
}

- (id)_socialProfileUsername
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  itemParameters = self->_itemParameters;
  uint64_t v3 = [(NSMutableArray *)itemParameters countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  id v5 = 0;
  uint64_t v6 = *(void *)v11;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v11 != v6) {
        objc_enumerationMutation(itemParameters);
      }
      id v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
      if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "name"), "lowercaseString"), "isEqualToString:", @"x-user"))id v5 = objc_msgSend(v8, "value"); {
    }
      }
    uint64_t v4 = [(NSMutableArray *)itemParameters countByEnumeratingWithState:&v10 objects:v14 count:16];
  }
  while (v4);
  return v5;
}

- (id)_socialProfileDisplayName
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  itemParameters = self->_itemParameters;
  uint64_t v3 = [(NSMutableArray *)itemParameters countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  id v5 = 0;
  uint64_t v6 = *(void *)v11;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v11 != v6) {
        objc_enumerationMutation(itemParameters);
      }
      id v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
      if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "name"), "lowercaseString"), "isEqualToString:", @"x-displayname"))id v5 = objc_msgSend(v8, "value"); {
    }
      }
    uint64_t v4 = [(NSMutableArray *)itemParameters countByEnumeratingWithState:&v10 objects:v14 count:16];
  }
  while (v4);
  return v5;
}

- (id)_socialProfileTeamIdentifier
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  itemParameters = self->_itemParameters;
  uint64_t v3 = [(NSMutableArray *)itemParameters countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  id v5 = 0;
  uint64_t v6 = *(void *)v11;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v11 != v6) {
        objc_enumerationMutation(itemParameters);
      }
      id v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
      if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "name"), "lowercaseString"), "isEqualToString:", @"x-teamidentifier"))id v5 = objc_msgSend(v8, "value"); {
    }
      }
    uint64_t v4 = [(NSMutableArray *)itemParameters countByEnumeratingWithState:&v10 objects:v14 count:16];
  }
  while (v4);
  return v5;
}

- (id)_socialProfileBundleIdentifiers
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  itemParameters = self->_itemParameters;
  uint64_t v3 = [(NSMutableArray *)itemParameters countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  id v5 = 0;
  uint64_t v6 = *(void *)v11;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v11 != v6) {
        objc_enumerationMutation(itemParameters);
      }
      id v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
      if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "name"), "lowercaseString"), "isEqualToString:", @"x-bundleidentifiers"))id v5 = objc_msgSend(v8, "value"); {
    }
      }
    uint64_t v4 = [(NSMutableArray *)itemParameters countByEnumeratingWithState:&v10 objects:v14 count:16];
  }
  while (v4);
  return v5;
}

- (id)_socialProfileService
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  itemParameters = self->_itemParameters;
  uint64_t v3 = [(NSMutableArray *)itemParameters countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  id v5 = 0;
  uint64_t v6 = *(void *)v11;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v11 != v6) {
        objc_enumerationMutation(itemParameters);
      }
      id v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
      if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "name"), "lowercaseString"), "isEqualToString:", @"type"))id v5 = objc_msgSend(v8, "value"); {
    }
      }
    uint64_t v4 = [(NSMutableArray *)itemParameters countByEnumeratingWithState:&v10 objects:v14 count:16];
  }
  while (v4);
  return v5;
}

- (BOOL)parseSocialProfiles
{
  if (!self->_socialProfiles) {
    self->_socialProfiles = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  uint64_t v3 = socialProfileFromURL([(ABVCardLexer *)self->_lexer nextStringInEncoding:self->_encoding quotedPrintable:self->_quotedPrintable stopTokens:36864 trim:1], [(ABVCardParser *)self _socialProfileService], (uint64_t)[(ABVCardParser *)self _socialProfileUsername], (uint64_t)[(ABVCardParser *)self _socialProfileUserId], (uint64_t)[(ABVCardParser *)self _socialProfileDisplayName], (uint64_t)[(ABVCardParser *)self _socialProfileTeamIdentifier], (uint64_t)[(ABVCardParser *)self _socialProfileBundleIdentifiers]);
  if ([v3 count])
  {
    uint64_t v4 = [[ABVCardParameter alloc] initWithName:[(ABVCardParser *)self genericLabel]];
    [(ABVCardParameter *)v4 setValue:v3];
    if (self->_grouping) {
      -[ABVCardParameter setGrouping:](v4, "setGrouping:");
    }
    [(NSMutableArray *)self->_socialProfiles addObject:v4];
  }
  return 1;
}

- (id)parseInstantMessengerProfile:(id)a3
{
  id v3 = a3;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 rangeOfString:@":"];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL) {
    id v3 = (id)[v3 substringFromIndex:v5 + 1];
  }
  uint64_t v6 = [v3 stringByRemovingPercentEncoding];
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = (uint64_t)v3;
  }
  id v29 = (id)v7;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  itemParameters = self->_itemParameters;
  uint64_t v9 = [(NSMutableArray *)itemParameters countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v36;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(itemParameters);
        }
        long long v13 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        if (!objc_msgSend((id)objc_msgSend(v13, "name"), "compare:options:", @"SERVICE-TYPE", 1)
          || !objc_msgSend((id)objc_msgSend(v13, "name"), "compare:options:", @"X-SERVICE-TYPE", 1))
        {
          uint64_t v14 = [v13 value];
          goto LABEL_18;
        }
      }
      uint64_t v10 = [(NSMutableArray *)itemParameters countByEnumeratingWithState:&v35 objects:v40 count:16];
      uint64_t v14 = 0;
      if (v10) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }
LABEL_18:
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v15 = self->_itemParameters;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v31 objects:v39 count:16];
  v28 = (void *)v14;
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    uint64_t v30 = 0;
    uint64_t v20 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v32 != v20) {
          objc_enumerationMutation(v15);
        }
        id v22 = *(void **)(*((void *)&v31 + 1) + 8 * j);
        if (objc_msgSend((id)objc_msgSend(v22, "name", v28), "compare:options:", @"X-TEAMIDENTIFIER", 1))
        {
          if (objc_msgSend((id)objc_msgSend(v22, "name"), "compare:options:", @"X-BUNDLEIDENTIFIERS", 1))
          {
            if (!objc_msgSend((id)objc_msgSend(v22, "name"), "compare:options:", @"X-USERID", 1)) {
              uint64_t v30 = [v22 value];
            }
          }
          else
          {
            uint64_t v19 = [v22 value];
          }
        }
        else
        {
          uint64_t v18 = [v22 value];
        }
      }
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v17);
  }
  else
  {
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    uint64_t v30 = 0;
  }
  uint64_t v23 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithContentsOfFile:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), "pathForResource:ofType:", @"InstantMessageCanonicalNames", @"plist"));
  uint64_t v24 = (uint64_t)v28;
  if (objc_msgSend(v23, "objectForKey:", objc_msgSend(v28, "lowercaseString"))) {
    uint64_t v24 = objc_msgSend(v23, "objectForKey:", objc_msgSend(v28, "lowercaseString"));
  }
  v25 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObject:forKey:", v29, @"username", v28);
  v26 = v25;
  if (v24) {
    [v25 setObject:v24 forKey:@"service"];
  }
  if (v18) {
    [v26 setObject:v18 forKey:@"teamIdentifier"];
  }
  if (v19) {
    [v26 setObject:v19 forKey:@"bundleIdentifiers"];
  }
  if (v30) {
    [v26 setObject:v30 forKey:@"identifier"];
  }
  return v26;
}

- (BOOL)parseIMPP
{
  if (!self->_instantMessengers) {
    self->_instantMessengers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  id v3 = [(ABVCardParser *)self parseInstantMessengerProfile:[(ABVCardLexer *)self->_lexer nextStringInEncoding:self->_encoding quotedPrintable:self->_quotedPrintable stopTokens:36864 trim:1]];
  uint64_t v4 = [[ABVCardParameter alloc] initWithName:[(ABVCardParser *)self genericLabel]];
  [(ABVCardParameter *)v4 setValue:v3];
  if (self->_grouping) {
    -[ABVCardParameter setGrouping:](v4, "setGrouping:");
  }
  [(NSMutableArray *)self->_instantMessengers addObject:v4];

  return 1;
}

- (BOOL)parseGuardianWhitelisted
{
  id v3 = [(ABVCardLexer *)self->_lexer nextStringInEncoding:self->_encoding quotedPrintable:self->_quotedPrintable stopTokens:36864 trim:1];
  if ([v3 isEqualToString:@"false"]) {
    id v4 = 0;
  }
  else {
    id v4 = v3;
  }
  BOOL v5 = [(ABVCardValueSetter *)self->_valueSetter setValue:v4 forProperty:kABPersonDowntimeWhitelistProperty];
  if (v5 && [(ABVCardLexer *)self->_lexer nextTokenPeak:1] == 4097) {
    [(ABVCardLexer *)self->_lexer advanceToPeakPoint];
  }
  return v5;
}

- (BOOL)parseSensitiveContentConfigurationData
{
  v2 = self;
  id v3 = [(ABVCardParser *)self parseSingleValue];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v3 options:0];
  LOBYTE(v2) = [(ABVCardParser *)v2 _setDataValueOrNoteIfNull:v4 forProperty:kABPersonSensitiveContentConfigurationProperty];

  return (char)v2;
}

- (BOOL)parseIMAGETYPE
{
  id v3 = [(ABVCardLexer *)self->_lexer nextStringInEncoding:self->_encoding quotedPrintable:self->_quotedPrintable stopTokens:36864 trim:1];
  BOOL v4 = [(ABVCardParser *)self _setStringValueOrNoteIfNull:v3 forProperty:kABPersonImageTypeProperty];
  if (v4 && [(ABVCardLexer *)self->_lexer nextTokenPeak:1] == 4097) {
    [(ABVCardLexer *)self->_lexer advanceToPeakPoint];
  }
  return v4;
}

- (BOOL)parseIMAGEHASH
{
  id v3 = [(ABVCardLexer *)self->_lexer nextStringInEncoding:self->_encoding quotedPrintable:self->_quotedPrintable stopTokens:36864 trim:1];
  BOOL v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v3 options:0];
  BOOL v5 = [(ABVCardParser *)self _setDataValueOrNoteIfNull:v4 forProperty:kABPersonImageHashProperty];
  if (v5 && [(ABVCardLexer *)self->_lexer nextTokenPeak:1] == 4097) {
    [(ABVCardLexer *)self->_lexer advanceToPeakPoint];
  }

  return v5;
}

- (BOOL)addIMValueTo:(id)a3
{
  id v5 = [(ABVCardParser *)self genericLabel];
  char v6 = 1;
  while (1)
  {
    id v7 = [(ABVCardLexer *)self->_lexer nextStringInEncoding:self->_encoding quotedPrintable:self->_quotedPrintable stopTokens:36864 trim:1];
    uint64_t v8 = [a3 count];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = 0;
      while ((objc_msgSend(v7, "isEqualToString:", objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", v10), "value")) & 1) == 0)
      {
        if (v9 == ++v10) {
          goto LABEL_6;
        }
      }
LABEL_10:
      char v6 = 0;
      goto LABEL_11;
    }
LABEL_6:
    if ((v6 & 1) == 0) {
      goto LABEL_10;
    }
    uint64_t v11 = [[ABVCardParameter alloc] initWithName:v5];
    [(ABVCardParameter *)v11 setValue:v7];
    if (self->_grouping) {
      -[ABVCardParameter setGrouping:](v11, "setGrouping:");
    }
    [a3 addObject:v11];

    char v6 = 1;
LABEL_11:
    if ([(ABVCardLexer *)self->_lexer nextTokenPeak:1] != 4097) {
      return 1;
    }
    [(ABVCardLexer *)self->_lexer advanceToPeakPoint];
  }
}

- (BOOL)parseActivityAlerts
{
  if (!self->_activityAlerts) {
    self->_activityAlerts = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v3 = [(ABVCardParser *)self parseRemainingLine];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__ABVCardParser_parseActivityAlerts__block_invoke;
  v5[3] = &unk_1E5989160;
  v5[4] = self;
  +[ABVCardActivityAlertSerialization parseString:v3 intoTypeAndInfo:v5];
  return 1;
}

uint64_t __36__ABVCardParser_parseActivityAlerts__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t result = [a2 length];
  if (result)
  {
    uint64_t result = [a3 count];
    if (result)
    {
      id v7 = *(void **)(*(void *)(a1 + 32) + 208);
      uint64_t v8 = a2;
      v9[0] = a3;
      return objc_msgSend(v7, "addEntriesFromDictionary:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1));
    }
  }
  return result;
}

- (id)dateFromISO8601String:(id)a3
{
  unint64_t v4 = [a3 length];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  if ([a3 rangeOfString:@"-"] == 0x7FFFFFFFFFFFFFFFLL && v4 == 8)
  {
    objc_msgSend(v5, "setCalendar:", objc_msgSend(MEMORY[0x1E4F1C9A8], "calendarWithIdentifier:", *MEMORY[0x1E4F1C318]));
    objc_msgSend(v5, "setTimeZone:", objc_msgSend(MEMORY[0x1E4F1CAF0], "timeZoneWithName:", @"Zulu"));
    objc_msgSend(v5, "setYear:", (int)objc_msgSend((id)objc_msgSend(a3, "substringWithRange:", 0, 4), "intValue"));
    objc_msgSend(v5, "setMonth:", (int)objc_msgSend((id)objc_msgSend(a3, "substringWithRange:", 4, 2), "intValue"));
    objc_msgSend(v5, "setDay:", (int)objc_msgSend((id)objc_msgSend(a3, "substringWithRange:", 6, 2), "intValue"));
    [v5 setHour:12];
    [v5 setMinute:0];
    uint64_t v9 = v5;
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v14 = 0;
    long long v13 = 0uLL;
    id v7 = (id)[objc_alloc(MEMORY[0x1E4F28FE8]) initWithString:a3];
    [v7 scanInt:(char *)&v14 + 4];
    if ([v7 scanLocation] + 1 >= v4
      || (objc_msgSend(v7, "setScanLocation:"),
          [v7 scanInt:&v14],
          [v7 scanLocation] + 1 >= v4))
    {
      uint64_t v11 = 0;
      goto LABEL_14;
    }
    objc_msgSend(v7, "setScanLocation:");
    [v7 scanInt:(char *)&v13 + 12];
    if ([v7 scanLocation] + 1 >= v4
      || (objc_msgSend(v7, "setScanLocation:"),
          [v7 scanInt:(char *)&v13 + 8],
          [v7 scanLocation] + 1 >= v4)
      || (objc_msgSend(v7, "setScanLocation:"),
          [v7 scanInt:(char *)&v13 + 4],
          [v7 scanLocation] + 1 >= v4))
    {
      BOOL v8 = 1;
    }
    else
    {
      objc_msgSend(v7, "setScanLocation:");
      [v7 scanInt:&v13];
      BOOL v8 = v13 == 0;
    }
    if (!*(void *)((char *)&v13 + 4) && v8) {
      DWORD2(v13) = 12;
    }
    objc_msgSend(v5, "setCalendar:", objc_msgSend(MEMORY[0x1E4F1C9A8], "calendarWithIdentifier:", *MEMORY[0x1E4F1C318]));
    objc_msgSend(v5, "setTimeZone:", objc_msgSend(MEMORY[0x1E4F1CAF0], "timeZoneWithName:", @"Zulu"));
    [v5 setYear:SHIDWORD(v14)];
    [v5 setMonth:(int)v14];
    [v5 setDay:SHIDWORD(v13)];
    [v5 setHour:SDWORD2(v13)];
    [v5 setMinute:SDWORD1(v13)];
    uint64_t v10 = (int)v13;
    uint64_t v9 = v5;
  }
  [v9 setSecond:v10];
  uint64_t v11 = (void *)[v5 date];
LABEL_14:

  return v11;
}

- (BOOL)parseBDAY
{
  id v3 = [(ABVCardLexer *)self->_lexer nextStringInEncoding:self->_encoding quotedPrintable:self->_quotedPrintable stopTokens:36864 trim:1];
  if (v3)
  {
    unint64_t v4 = v3;
    if ([(__CFString *)v3 length])
    {
      if ([(__CFString *)v4 rangeOfString:@","] == 0x7FFFFFFFFFFFFFFFLL)
      {
        id v5 = [(ABVCardParser *)self dateFromISO8601String:v4];
        if (v5) {
          [(ABVCardValueSetter *)self->_valueSetter setValue:v5 forProperty:kABPersonBirthdayProperty];
        }
        else {
          [(ABVCardParser *)self noteLackOfValueForProperty:kABPersonBirthdayProperty];
        }
      }
      else
      {
        CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
        id v7 = CFDateFormatterCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
        if (v7)
        {
          BOOL v8 = v7;
          CFDateFormatterSetFormat(v7, @"%a, %b %e, %Y");
          CFDateRef DateFromString = CFDateFormatterCreateDateFromString(v6, v8, v4, 0);
          if (DateFromString)
          {
            CFDateRef v10 = DateFromString;
            [(ABVCardValueSetter *)self->_valueSetter setValue:DateFromString forProperty:kABPersonBirthdayProperty];
            CFRelease(v10);
          }
          else
          {
            [(ABVCardParser *)self noteLackOfValueForProperty:kABPersonBirthdayProperty];
          }
          CFRelease(v8);
        }
      }
    }
  }
  return 1;
}

- (BOOL)parseAlternateBirthday
{
  id v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_itemParameters count] == 1)
  {
    unint64_t v4 = (void *)[(NSMutableArray *)self->_itemParameters objectAtIndexedSubscript:0];
    if (!objc_msgSend((id)objc_msgSend(v4, "name"), "compare:options:", @"CALSCALE", 1))
    {
      if (objc_msgSend((id)objc_msgSend(v4, "value"), "compare:options:", @"(null)", 1)) {
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v4, "value"), @"calendarIdentifier");
      }
    }
  }
  id v5 = [(ABVCardLexer *)self->_lexer nextStringInEncoding:self->_encoding quotedPrintable:self->_quotedPrintable stopTokens:36864 trim:1];
  if (v5)
  {
    id v6 = v5;
    if ([v5 length])
    {
      id v7 = +[ABVCardDateScanner scannerWithString:v6];
      uint64_t v8 = [(ABVCardDateScanner *)v7 scanCalendarUnit:2];
      if (v8 != 0x7FFFFFFFFFFFFFFFLL) {
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", v8), @"era");
      }
      uint64_t v9 = [(ABVCardDateScanner *)v7 scanCalendarUnit:4];
      if (v9 != 0x7FFFFFFFFFFFFFFFLL) {
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", v9), @"year");
      }
      uint64_t v10 = [(ABVCardDateScanner *)v7 scanCalendarUnit:8];
      if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", v10), @"month");
      }
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", -[ABVCardDateScanner scanLeapMarker](v7, "scanLeapMarker")), @"isLeapMonth");
      uint64_t v11 = [(ABVCardDateScanner *)v7 scanCalendarUnit:16];
      if (v11 != 0x7FFFFFFFFFFFFFFFLL) {
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", v11), @"day");
      }
    }
  }
  int v12 = ABValidateAlternateBirthday(v3);
  if (v12) {
    [(ABVCardValueSetter *)self->_valueSetter setValue:v3 forProperty:kABPersonAlternateBirthdayProperty];
  }
  return v12;
}

- (BOOL)parseABDATE
{
  if (!self->_dates) {
    self->_dates = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  id v3 = [(ABVCardParser *)self defaultLabel];
  id v4 = [(ABVCardLexer *)self->_lexer nextStringInEncoding:self->_encoding quotedPrintable:self->_quotedPrintable stopTokens:36864 trim:1];
  if (v4)
  {
    id v5 = v4;
    if ([v4 length])
    {
      id v6 = [(ABVCardParser *)self dateFromISO8601String:v5];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = [[ABVCardParameter alloc] initWithName:v3];
        [(ABVCardParameter *)v8 setValue:v7];
        if (self->_grouping) {
          -[ABVCardParameter setGrouping:](v8, "setGrouping:");
        }
        [(NSMutableArray *)self->_dates addObject:v8];
      }
    }
  }
  return 1;
}

- (BOOL)parsePhoto:(id)a3
{
  if (a3) {
    self->_imageData = (NSData *)(id)[a3 abDecodeVCardBase64];
  }
  return a3 != 0;
}

- (BOOL)parseWallpaper:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [a3 abDecodeVCardBase64];
    uint64_t v5 = kABPersonWallpaperProperty;
    return [(ABVCardParser *)self _setDataValueOrNoteIfNull:v4 forProperty:v5];
  }
  else
  {
    id v7 = [(ABVCardParser *)self parseSingleValue];
    uint64_t v8 = kABPersonWallpaperURIProperty;
    return [(ABVCardParser *)self _setStringValueOrNoteIfNull:v7 forProperty:v8];
  }
}

- (void)parseABShowAs
{
  id v3 = [(ABVCardLexer *)self->_lexer nextArraySeperatedByToken:4096 stoppingAt:0x8000 inEncoding:self->_encoding];
  if ([v3 count])
  {
    if (objc_msgSend((id)objc_msgSend(v3, "objectAtIndex:", 0), "compare:options:", @"COMPANY", 1))
    {
      [(ABVCardParser *)self noteLackOfValueForProperty:kABPersonKindProperty];
    }
    else
    {
      valueSetter = self->_valueSetter;
      [(ABVCardValueSetter *)valueSetter setValue:kABPersonKindOrganization forProperty:kABPersonKindProperty];
    }
  }
}

- (void)parseSharedPhotoDisplayPreference
{
  id v3 = [(ABVCardLexer *)self->_lexer nextArraySeperatedByToken:4096 stoppingAt:0x8000 inEncoding:self->_encoding];
  uint64_t v4 = kABPersonDisplayFlagsProperty;
  unint64_t v5 = objc_msgSend(-[ABVCardValueSetter valueForProperty:](self->_valueSetter, "valueForProperty:", kABPersonDisplayFlagsProperty), "integerValue") & 0xFFFFFFFFFFFFFF3FLL;
  if ([v3 count])
  {
    id v6 = (void *)[v3 objectAtIndex:0];
    if ([v6 isEqualToString:@"AUTOUPDATE"])
    {
      v5 |= 0x40uLL;
    }
    else if ([v6 isEqualToString:@"ALWAYS_ASK"])
    {
      v5 |= 0x80uLL;
    }
    else
    {
      int v7 = [v6 isEqualToString:@"IMPLICIT_AUTOUPDATE"];
      uint64_t v8 = 192;
      if (!v7) {
        uint64_t v8 = 0;
      }
      v5 |= v8;
    }
  }
  valueSetter = self->_valueSetter;
  uint64_t v10 = [NSNumber numberWithInteger:v5];
  [(ABVCardValueSetter *)valueSetter setValue:v10 forProperty:v4];
}

- (BOOL)parseABReleatedNames
{
  if (!self->_relatedNames) {
    self->_relatedNames = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  id v3 = [(ABVCardParser *)self defaultLabel];
  id v4 = [(ABVCardLexer *)self->_lexer nextStringInEncoding:self->_encoding quotedPrintable:self->_quotedPrintable stopTokens:36864 trim:1];
  if (v4)
  {
    id v5 = v4;
    if ([v4 length])
    {
      id v6 = [[ABVCardParameter alloc] initWithName:v3];
      [(ABVCardParameter *)v6 setValue:v5];
      if (self->_grouping) {
        -[ABVCardParameter setGrouping:](v6, "setGrouping:");
      }
      [(NSMutableArray *)self->_relatedNames addObject:v6];
    }
  }
  return 1;
}

- (BOOL)_handleUnknownTag:(id)a3 withValue:(id)a4
{
  return 0;
}

- (BOOL)_usesArrayForExternalPropKey:(id)a3
{
  return [a3 compare:@"CATEGORIES" options:1] == 0;
}

- (BOOL)_usesRemainingLineForExternalPropKey:(id)a3
{
  if ([a3 hasPrefix:@"X-APPLE-OL"]) {
    return 1;
  }
  BOOL v4 = 1;
  if ([a3 compare:@"X-PHONETIC-COMPANY-NAME" options:1]) {
    return [a3 compare:@"LABEL" options:1] == 0;
  }
  return v4;
}

- (BOOL)parseItem
{
  unint64_t defaultEncoding = self->_defaultEncoding;
  *(_WORD *)&self->_quotedPrintable = 0;
  self->_grouping = 0;
  self->_encoding = defaultEncoding;
  id v4 = [(ABVCardLexer *)self->_lexer nextArraySeperatedByToken:256 stoppingAt:46080 inEncoding:1];
  uint64_t v5 = [v4 count];
  if (v5)
  {
    uint64_t v6 = v5;
    int v7 = (void *)[v4 lastObject];
    if (v6 == 2) {
      self->_grouping = (NSString *)[v4 objectAtIndex:0];
    }
  }
  else
  {
    int v7 = 0;
  }
  uint64_t v8 = [v7 compare:@"END" options:1];
  if (!v8) {
    return v8;
  }
  v63 = v7;
  p_base64 = &self->_base64;
  self->_itemParameters = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int v10 = [(ABVCardLexer *)self->_lexer nextTokenPeak:0];
  if (v10 != 8193)
  {
    int v12 = v10;
    unsigned int v62 = kABPersonMemojiMetadataProperty;
    long long v13 = @"QUOTED-PRINTABLE";
    while (1)
    {
      if ([(ABVCardLexer *)self->_lexer errorCount] >= 10)
      {
LABEL_56:

        goto LABEL_245;
      }
      if (v12 != 4097)
      {
        if (v12 == 65537) {
          goto LABEL_56;
        }
        goto LABEL_43;
      }
      id v14 = [(ABVCardLexer *)self->_lexer nextStringInEncoding:1 quotedPrintable:0 stopTokens:46080 trim:1];
      uint64_t v15 = [v14 compare:v13 options:1];
      p_quotedPrintable = &self->_quotedPrintable;
      if (!v15
        || (uint64_t v17 = [v14 compare:@"BASE64" options:1], p_quotedPrintable = &self->_base64, !v17))
      {
        BOOL *p_quotedPrintable = 1;
      }
      uint64_t v18 = [[ABVCardParameter alloc] initWithName:v14];
      [(NSMutableArray *)self->_itemParameters addObject:v18];
      if ([(ABVCardLexer *)self->_lexer nextTokenPeak:1] == 1025) {
        break;
      }
LABEL_42:

LABEL_43:
      int v12 = [(ABVCardLexer *)self->_lexer nextTokenPeak:0];
      if (v12 == 8193) {
        goto LABEL_7;
      }
    }
    uint64_t v19 = v13;
    [(ABVCardLexer *)self->_lexer advanceToPeakPoint];
    if (self->_quotedPrintable) {
      uint64_t v20 = 46080;
    }
    else {
      uint64_t v20 = 45056;
    }
    id v21 = [(ABVCardLexer *)self->_lexer nextArraySeperatedByToken:128 stoppingAt:v20 inEncoding:4];
    if ([(__CFString *)v21 count]) {
      id v22 = (__CFString *)[(__CFString *)v21 objectAtIndex:0];
    }
    else {
      id v22 = 0;
    }
    if ([v14 compare:@"TYPE" options:1])
    {
      if (![v14 compare:@"CHARSET" options:1])
      {
        if ([(__CFString *)v22 compare:@"UTF-7" options:1])
        {
          CFStringEncoding v26 = CFStringConvertIANACharSetNameToEncoding(v22);
          long long v13 = v19;
          if (v26 == -1)
          {
            self->_encoding = 0;
            ABDiagnosticsEnabled();
            _ABLog2(4, (uint64_t)"-[ABVCardParser parseItem]", 2144, 0, @"%@ is an invalid encoding", v27, v28, v29, (uint64_t)v22);
          }
          else
          {
            self->_encoding = CFStringConvertEncodingToNSStringEncoding(v26);
          }
          goto LABEL_42;
        }
        self->_encoding = 4000100;
        goto LABEL_41;
      }
      if (![v14 compare:@"ENCODING" options:1])
      {
        long long v13 = v19;
        if ([(__CFString *)v22 compare:v19 options:1])
        {
          if (![(__CFString *)v22 compare:@"b" options:1]
            || ![(__CFString *)v22 compare:@"BASE64" options:1])
          {
            BOOL *p_base64 = 1;
          }
        }
        else
        {
          self->_quotedPrintable = 1;
        }
        goto LABEL_42;
      }
      if ([v14 compare:@"X-USER" options:1]
        && [v14 compare:@"X-USERID" options:1]
        && [v14 compare:@"SERVICE-TYPE" options:1]
        && [v14 compare:@"X-SERVICE-TYPE" options:1]
        && [v14 compare:@"X-DISPLAYNAME" options:1]
        && [v14 compare:@"X-TEAMIDENTIFIER" options:1]
        && [v14 compare:@"X-ABCROP-RECTANGLE" options:1]
        && [v14 compare:@"CALSCALE" options:1])
      {
        if ([v14 compare:@"X-BUNDLEIDENTIFIERS" options:1])
        {
          long long v13 = v19;
          if (![v14 compare:@"VND-63-MEMOJI-DETAILS" options:1])
          {
            uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v22 options:0];
            [(ABVCardParser *)self _setDataValueOrNoteIfNull:v23 forProperty:v62];
          }
          goto LABEL_42;
        }
        uint64_t v24 = v18;
        v25 = v21;
        goto LABEL_40;
      }
    }
    else
    {
      [(ABVCardParameter *)v18 addTypes:v21];
    }
    uint64_t v24 = v18;
    v25 = v22;
LABEL_40:
    [(ABVCardParameter *)v24 setValue:v25];
LABEL_41:
    long long v13 = v19;
    goto LABEL_42;
  }
LABEL_7:
  if (*p_base64) {
    id v11 = [(ABVCardLexer *)self->_lexer nextBase64Data];
  }
  else {
    id v11 = 0;
  }
  switch([v63 length])
  {
    case 1:
      if ([v63 compare:@"N" options:1]) {
        goto LABEL_198;
      }
      if (![(ABVCardParser *)self parseN])
      {
        ABDiagnosticsEnabled();
        long long v33 = @"Malformed N";
        uint64_t v34 = 2297;
        goto LABEL_241;
      }
      goto LABEL_242;
    case 2:
      if ([v63 compare:@"FN" options:1]) {
        goto LABEL_198;
      }
      self->_formattedName = (NSString *)[(ABVCardParser *)self parseSingleValue];
      goto LABEL_242;
    case 3:
      if ([v63 compare:@"UID" options:1])
      {
        if ([v63 compare:@"TEL" options:1])
        {
          if ([v63 compare:@"ADR" options:1])
          {
            if ([v63 compare:@"ORG" options:1])
            {
              if ([v63 compare:@"URL" options:1])
              {
                if ([v63 compare:@"ADD" options:1]) {
                  goto LABEL_198;
                }
                if (![(ABVCardParser *)self parseADD])
                {
                  ABDiagnosticsEnabled();
                  long long v33 = @"Malformed ADD";
                  uint64_t v34 = 2233;
                  goto LABEL_241;
                }
              }
              else
              {
                id v55 = [(ABVCardParser *)self parseURL];
                if (v55)
                {
                  id v56 = v55;
                  if ([v55 length])
                  {
                    if (!self->_urls) {
                      self->_urls = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
                    }
                    id v57 = [(ABVCardParser *)self _genericLabel];
                    if (!v57) {
                      id v57 = [(ABVCardParser *)self defaultURLLabel];
                    }
                    v58 = [[ABVCardParameter alloc] initWithName:v57];
                    [(ABVCardParameter *)v58 setValue:v56];
                    if (self->_grouping) {
                      -[ABVCardParameter setGrouping:](v58, "setGrouping:");
                    }
                    [(NSMutableArray *)self->_urls addObject:v58];
                  }
                }
              }
            }
            else if (![(ABVCardParser *)self parseORG])
            {
              ABDiagnosticsEnabled();
              long long v33 = @"Malformed ORG";
              uint64_t v34 = 2201;
              goto LABEL_241;
            }
          }
          else if (![(ABVCardParser *)self parseADR])
          {
            ABDiagnosticsEnabled();
            long long v33 = @"Malformed ADR";
            uint64_t v34 = 2196;
            goto LABEL_241;
          }
        }
        else if (![(ABVCardParser *)self parseTEL])
        {
          ABDiagnosticsEnabled();
          long long v33 = @"Malformed TEL";
          uint64_t v34 = 2191;
          goto LABEL_241;
        }
      }
      else
      {
        [(ABVCardParser *)self parseUID];
      }
      goto LABEL_242;
    case 4:
      if ([v63 compare:@"NOTE" options:1])
      {
        if ([v63 compare:@"BDAY" options:1])
        {
          if ([v63 compare:@"IMPP" options:1]) {
            goto LABEL_198;
          }
          if (![(ABVCardParser *)self parseIMPP])
          {
            ABDiagnosticsEnabled();
            long long v33 = @"Malformed IMPP";
            uint64_t v34 = 2337;
            goto LABEL_241;
          }
        }
        else if (![(ABVCardParser *)self parseBDAY])
        {
          ABDiagnosticsEnabled();
          long long v33 = @"Malformed BDAY";
          uint64_t v34 = 2332;
          goto LABEL_241;
        }
      }
      else
      {
        self->_notes = (NSMutableString *)objc_msgSend(-[ABVCardParser parseSingleValue](self, "parseSingleValue"), "mutableCopy");
      }
      goto LABEL_242;
    case 5:
      if ([v63 compare:@"EMAIL" options:1])
      {
        if (![v63 compare:@"TITLE" options:1])
        {
          id v41 = [(ABVCardParser *)self parseSingleValue];
          v42 = &kABPersonJobTitleProperty;
          goto LABEL_179;
        }
        if ([v63 compare:@"X-AIM" options:1])
        {
          if ([v63 compare:@"X-MSN" options:1])
          {
            if ([v63 compare:@"X-ICQ" options:1])
            {
              if ([v63 compare:@"PHOTO" options:1]) {
                goto LABEL_198;
              }
              if (![(ABVCardParser *)self parsePhoto:v11]) {
                self->_imageURI = (NSString *)[(ABVCardParser *)self parseSingleValue];
              }
              if ([(NSMutableArray *)self->_itemParameters count])
              {
                uint64_t v35 = 0;
                while (1)
                {
                  long long v36 = (void *)[(NSMutableArray *)self->_itemParameters objectAtIndex:v35];
                  if (!objc_msgSend((id)objc_msgSend(v36, "name"), "compare:options:", @"X-ABCROP-RECTANGLE", 1))
                  {
                    long long v37 = (void *)[v36 value];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      long long v38 = (void *)[v37 componentsSeparatedByString:@"&"];
                      if ([v38 count] == 6)
                      {
                        if (objc_msgSend((id)objc_msgSend(v38, "objectAtIndex:", 0), "isEqualToString:", @"ABClipRect_1"))break; {
                      }
                        }
                    }
                  }
                  if (++v35 >= (unint64_t)[(NSMutableArray *)self->_itemParameters count]) {
                    goto LABEL_242;
                  }
                }
                self->_cropRectX = objc_msgSend((id)objc_msgSend(v38, "objectAtIndex:", 1), "intValue");
                self->_cropRectY = objc_msgSend((id)objc_msgSend(v38, "objectAtIndex:", 2), "intValue");
                self->_cropRectWidth = objc_msgSend((id)objc_msgSend(v38, "objectAtIndex:", 3), "intValue");
                self->_cropRectHeight = objc_msgSend((id)objc_msgSend(v38, "objectAtIndex:", 4), "intValue");
                self->_cropRectChecksum = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9B8]), "initWithBase64EncodedString:options:", objc_msgSend(v38, "objectAtIndex:", 5), 0);
              }
            }
            else
            {
              icqs = self->_icqs;
              if (!icqs)
              {
                icqs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
                self->_icqs = icqs;
              }
              if (![(ABVCardParser *)self addIMValueTo:icqs])
              {
                ABDiagnosticsEnabled();
                long long v33 = @"Malformed X-ICQ";
                uint64_t v34 = 2265;
                goto LABEL_241;
              }
            }
          }
          else
          {
            msns = self->_msns;
            if (!msns)
            {
              msns = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
              self->_msns = msns;
            }
            if (![(ABVCardParser *)self addIMValueTo:msns])
            {
              ABDiagnosticsEnabled();
              long long v33 = @"Malformed X-MSN";
              uint64_t v34 = 2258;
              goto LABEL_241;
            }
          }
        }
        else
        {
          aims = self->_aims;
          if (!aims)
          {
            aims = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
            self->_aims = aims;
          }
          if (![(ABVCardParser *)self addIMValueTo:aims])
          {
            ABDiagnosticsEnabled();
            long long v33 = @"Malformed X-AIM";
            uint64_t v34 = 2251;
            goto LABEL_241;
          }
        }
      }
      else if (![(ABVCardParser *)self parseEMAIL])
      {
        ABDiagnosticsEnabled();
        long long v33 = @"Malformed EMAIL";
        uint64_t v34 = 2240;
        goto LABEL_241;
      }
      goto LABEL_242;
    case 7:
      if ([v63 compare:@"VERSION" options:1])
      {
        if ([v63 compare:@"X-ABUID" options:1])
        {
          if (![v63 compare:@"X-ABADR" options:1])
          {
            v43 = @"X-ABADR";
            goto LABEL_196;
          }
          if ([v63 compare:@"X-YAHOO" options:1]) {
            goto LABEL_198;
          }
          yahoos = self->_yahoos;
          if (!yahoos)
          {
            yahoos = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
            self->_yahoos = yahoos;
          }
          if (![(ABVCardParser *)self addIMValueTo:yahoos])
          {
            ABDiagnosticsEnabled();
            long long v33 = @"Malformed X-YAHOO";
            uint64_t v34 = 2322;
            goto LABEL_241;
          }
        }
        else
        {
          [(ABVCardParser *)self parseABUID];
        }
      }
      else if (![(ABVCardParser *)self parseVERSION])
      {
        ABDiagnosticsEnabled();
        long long v33 = @"Malformed VERSION";
        uint64_t v34 = 2309;
        goto LABEL_241;
      }
      goto LABEL_242;
    case 8:
      if ([v63 compare:@"NICKNAME" options:1])
      {
        if ([v63 compare:@"X-JABBER" options:1])
        {
          if ([v63 compare:@"X-ABDATE" options:1]) {
            goto LABEL_198;
          }
          if (![(ABVCardParser *)self parseABDATE])
          {
            ABDiagnosticsEnabled();
            long long v33 = @"Malformed ABDATE";
            uint64_t v34 = 2356;
            goto LABEL_241;
          }
        }
        else
        {
          jabbers = self->_jabbers;
          if (!jabbers)
          {
            jabbers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
            self->_jabbers = jabbers;
          }
          if (![(ABVCardParser *)self addIMValueTo:jabbers])
          {
            ABDiagnosticsEnabled();
            long long v33 = @"Malformed X-JABBER";
            uint64_t v34 = 2351;
            goto LABEL_241;
          }
        }
      }
      else if (![(ABVCardParser *)self parseNICKNAME])
      {
        ABDiagnosticsEnabled();
        long long v33 = @"Malformed NICKNAME";
        uint64_t v34 = 2344;
        goto LABEL_241;
      }
      goto LABEL_242;
    case 9:
      if (![v63 compare:@"X-ABLabel" options:1])
      {
        [(ABVCardParser *)self parseABExtensionType:@"X-ABLabel"];
        goto LABEL_198;
      }
      if (![v63 compare:@"X-ABOrder" options:1])
      {
        [(ABVCardParser *)self parseABOrder];
        goto LABEL_198;
      }
      if (![v63 compare:@"X-ABPhoto" options:1])
      {
        [(ABVCardParser *)self parseABPhoto];
        goto LABEL_198;
      }
      if ([v63 compare:@"X-ALTBDAY" options:1]) {
        goto LABEL_198;
      }
      if (![(ABVCardParser *)self parseAlternateBirthday])
      {
        ABDiagnosticsEnabled();
        long long v33 = @"Malformed X-ALTBDAY";
        uint64_t v34 = 2394;
        goto LABEL_241;
      }
      goto LABEL_242;
    case 10:
      if (![v63 compare:@"X-ABShowAs" options:1]) {
        [(ABVCardParser *)self parseABShowAs];
      }
      goto LABEL_198;
    case 11:
      if ([v63 compare:@"X-IMAGETYPE" options:1])
      {
        if ([v63 compare:@"X-IMAGEHASH" options:1])
        {
          v40 = @"X-WALLPAPER";
          goto LABEL_127;
        }
        [(ABVCardParser *)self parseIMAGEHASH];
      }
      else
      {
        [(ABVCardParser *)self parseIMAGETYPE];
      }
      goto LABEL_198;
    case 12:
      if (![v63 compare:@"X-MAIDENNAME" options:1]) {
        [(ABVCardParser *)self parseABMaiden];
      }
      goto LABEL_198;
    case 14:
      if ([v63 compare:@"X-MS-IMADDRESS" options:1])
      {
        if ([v63 compare:@"X-PHONETIC-ORG" options:1]) {
          goto LABEL_198;
        }
        id v41 = [(ABVCardParser *)self parseSingleValue];
        v42 = &kABPersonOrganizationPhoneticProperty;
        goto LABEL_179;
      }
      if (!self->_untypedIMs)
      {
        v44 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        self->_untypedIMs = v44;
        if (![(ABVCardParser *)self addIMValueTo:v44])
        {
          ABDiagnosticsEnabled();
          long long v33 = @"Malformed X-MS-IMADDRESS";
          uint64_t v34 = 2429;
          goto LABEL_241;
        }
      }
      goto LABEL_242;
    case 15:
      if (![v63 compare:@"X-SOCIALPROFILE" options:1]) {
        [(ABVCardParser *)self parseSocialProfiles];
      }
      goto LABEL_198;
    case 16:
      if (![v63 compare:@"X-ABRELATEDNAMES" options:1])
      {
        [(ABVCardParser *)self parseABReleatedNames];
        goto LABEL_198;
      }
      if (![v63 compare:@"X-ACTIVITY-ALERT" options:1])
      {
        if (![(ABVCardParser *)self parseActivityAlerts])
        {
          ABDiagnosticsEnabled();
          long long v33 = @"Malformed X-ACTIVITY-ALERT";
          uint64_t v34 = 2447;
LABEL_241:
          _ABLog2(4, (uint64_t)"-[ABVCardParser parseItem]", v34, 0, (uint64_t)v33, v30, v31, v32, v61);
        }
        goto LABEL_242;
      }
      v40 = @"VND-63-WALLPAPER";
LABEL_127:
      if (![v63 compare:v40 options:1])
      {
        [(ABVCardParser *)self parseWallpaper:v11];
        goto LABEL_242;
      }
      goto LABEL_198;
    case 17:
      if ([v63 compare:@"X-APPLE-MAPS-DATA" options:1]) {
        goto LABEL_198;
      }
      id v41 = [(ABVCardParser *)self parseRemainingLine];
      v42 = &kABPersonMapsDataProperty;
      goto LABEL_179;
    case 19:
      if (![v63 compare:@"X-PRONUNCIATION-ORG" options:1])
      {
        id v41 = [(ABVCardParser *)self parseSingleValue];
        v42 = &kABPersonOrganizationPronunciationProperty;
        goto LABEL_179;
      }
      if ([v63 compare:@"X-APPLE-SUBLOCALITY" options:1]) {
        goto LABEL_198;
      }
      v43 = @"X-APPLE-SUBLOCALITY";
LABEL_196:
      [(ABVCardParser *)self parseABExtensionType:v43];
      goto LABEL_242;
    case 20:
      if (![v63 compare:@"X-PHONETIC-LAST-NAME" options:1])
      {
        id v41 = [(ABVCardParser *)self parseSingleValue];
        v42 = &kABPersonLastNamePhoneticProperty;
        goto LABEL_179;
      }
      if ([v63 compare:@"X-ADDRESSING-GRAMMAR" options:1]) {
        goto LABEL_198;
      }
      [(ABVCardParser *)self parseAddressingGrammar];
      goto LABEL_242;
    case 21:
      if ([v63 compare:@"X-PHONETIC-FIRST-NAME" options:1]) {
        goto LABEL_198;
      }
      id v41 = [(ABVCardParser *)self parseSingleValue];
      v42 = &kABPersonFirstNamePhoneticProperty;
      goto LABEL_179;
    case 22:
      if ([v63 compare:@"X-PHONETIC-MIDDLE-NAME" options:1]) {
        goto LABEL_198;
      }
      id v41 = [(ABVCardParser *)self parseSingleValue];
      v42 = &kABPersonMiddleNamePhoneticProperty;
      goto LABEL_179;
    case 25:
      if ([v63 compare:@"X-PRONUNCIATION-LAST-NAME" options:1]) {
        goto LABEL_198;
      }
      id v41 = [(ABVCardParser *)self parseSingleValue];
      v42 = &kABPersonLastNamePronunciationProperty;
      goto LABEL_179;
    case 26:
      if ([v63 compare:@"X-PRONUNCIATION-FIRST-NAME" options:1]) {
        goto LABEL_198;
      }
      id v41 = [(ABVCardParser *)self parseSingleValue];
      v42 = &kABPersonFirstNamePronunciationProperty;
      goto LABEL_179;
    case 27:
      if ([v63 compare:@"X-PRONUNCIATION-MIDDLE-NAME" options:1])
      {
        if (![v63 compare:@"X-SHARED-PHOTO-DISPLAY-PREF" options:1])
        {
          [(ABVCardParser *)self parseSharedPhotoDisplayPreference];
          goto LABEL_242;
        }
LABEL_198:
        BOOL v47 = [(ABVCardParser *)self _usesArrayForExternalPropKey:v63];
        if (v47)
        {
          id v48 = [(ABVCardParser *)self parseValueArray];
        }
        else
        {
          if (![(ABVCardParser *)self _usesRemainingLineForExternalPropKey:v63])
          {
            id v49 = [(ABVCardParser *)self parseSingleValue];
            if (![v49 length]) {
              id v49 = 0;
            }
            goto LABEL_205;
          }
          id v48 = [(ABVCardParser *)self parseRemainingLine];
        }
        id v49 = v48;
LABEL_205:
        if ([v63 compare:@"LOGO" options:1]
          && [v63 compare:@"SOUND" options:1]
          && [v63 compare:@"LABEL" options:1]
          && [v63 compare:@"PRODID" options:1]
          && [v63 compare:@"SORT-STRING" options:1]
          && [v63 compare:@"UID" options:1]
          && [v63 compare:@"REV" options:1]
          && v49
          && ![(ABVCardParser *)self _handleUnknownTag:v63 withValue:v49])
        {
          otherNotes = self->_otherNotes;
          if (!otherNotes)
          {
            otherNotes = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
            self->_otherNotes = otherNotes;
          }
          if ([(NSMutableString *)otherNotes length]) {
            [(NSMutableString *)self->_otherNotes appendString:@"\n"];
          }
          [(NSMutableString *)self->_otherNotes appendString:v63];
          [(NSMutableString *)self->_otherNotes appendString:@": "];
          v51 = self->_otherNotes;
          if (v47)
          {
            uint64_t v52 = [v49 componentsJoinedByString:@", "];
            v53 = v51;
          }
          else
          {
            v53 = self->_otherNotes;
            uint64_t v52 = (uint64_t)v49;
          }
          [(NSMutableString *)v53 appendString:v52];
        }
        goto LABEL_242;
      }
      id v41 = [(ABVCardParser *)self parseSingleValue];
      v42 = &kABPersonMiddleNamePronunciationProperty;
LABEL_179:
      [(ABVCardParser *)self _setStringValueOrNoteIfNull:v41 forProperty:*(unsigned int *)v42];
LABEL_242:

      if ([(ABVCardLexer *)self->_lexer advanceToEOL]
        && [(ABVCardLexer *)self->_lexer advancePastEOL])
      {
        LOBYTE(v8) = 1;
      }
      else
      {
LABEL_245:
        LOBYTE(v8) = 0;
      }
      break;
    case 28:
      if ([v63 compare:@"X-APPLE-GUARDIAN-WHITELISTED" options:1]) {
        goto LABEL_198;
      }
      if ([(ABVCardParser *)self parseGuardianWhitelisted]) {
        goto LABEL_242;
      }
      ABDiagnosticsEnabled();
      long long v33 = @"Malformed X-APPLE-GUARDIAN-WHITELISTED";
      uint64_t v34 = 2516;
      goto LABEL_241;
    case 29:
      if ([v63 compare:@"X-APPLE-SUBADMINISTRATIVEAREA" options:1]) {
        goto LABEL_198;
      }
      v43 = @"X-APPLE-SUBADMINISTRATIVEAREA";
      goto LABEL_196;
    case 31:
      if ([v63 compare:@"VND-63-SENSITIVE-CONTENT-CONFIG" options:1]) {
        goto LABEL_198;
      }
      [(ABVCardParser *)self parseSensitiveContentConfigurationData];
      goto LABEL_242;
    case 32:
      if ([v63 compare:@"X-ADDRESSBOOKSERVER-PHONEME-DATA" options:1]) {
        goto LABEL_198;
      }
      id v41 = [(ABVCardParser *)self parseRemainingLine];
      v42 = &kABPersonPhonemeDataProperty;
      goto LABEL_179;
    default:
      goto LABEL_198;
  }
  return v8;
}

- (BOOL)importToPerson:(void *)a3 foundProperties:(const __CFArray *)a4
{
  uint64_t v6 = [[ABVCardPersonValueSetter alloc] initWithPerson:a3];
  BOOL v7 = [(ABVCardParser *)self importToValueSetter:v6];
  if (a4)
  {
    uint64_t v8 = [(ABVCardPersonValueSetter *)v6 foundProperties];
    if (v8)
    {
      CFArrayRef v9 = v8;
      CFRetain(v8);
      *a4 = v9;
    }
  }

  return v7;
}

- (BOOL)importToValueSetter:(id)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F28B28]);

  self->_valueSetter = (ABVCardValueSetter *)a3;
  self->_extensions = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(ABVCardLexer *)self->_lexer advanceToString];
  if ([(ABVCardLexer *)self->_lexer nextTokenPeak:0] != 5)
  {
    ABDiagnosticsEnabled();
    int v10 = @"Malformed BEGIN";
    uint64_t v11 = 2634;
LABEL_20:
    _ABLog2(4, (uint64_t)"-[ABVCardParser importToValueSetter:]", v11, 0, (uint64_t)v10, v7, v8, v9, v27);
    goto LABEL_21;
  }
  if (![(ABVCardLexer *)self->_lexer advanceToToken:8193 throughTypes:0x4000])
  {
    ABDiagnosticsEnabled();
    int v10 = @"Malformed :";
    uint64_t v11 = 2639;
    goto LABEL_20;
  }
  if (![(ABVCardLexer *)self->_lexer advanceToToken:6 throughTypes:0x4000])
  {
    ABDiagnosticsEnabled();
    int v10 = @"Malformed VCARD";
    uint64_t v11 = 2645;
    goto LABEL_20;
  }
  if (![(ABVCardLexer *)self->_lexer advanceToEOL])
  {
    ABDiagnosticsEnabled();
    int v10 = @"Malformed space after EOL";
    uint64_t v11 = 2651;
    goto LABEL_20;
  }
  if (![(ABVCardLexer *)self->_lexer advancePastEOL])
  {
    ABDiagnosticsEnabled();
    int v10 = @"Malformed EOL";
    uint64_t v11 = 2657;
    goto LABEL_20;
  }
  while ([(ABVCardParser *)self parseItem])
    ;
  [(ABVCardParser *)self _setStringValueOrNoteIfNull:self->_org forProperty:kABPersonOrganizationProperty];
  if (!self->_last && !self->_first && !self->_org)
  {
    formattedName = self->_formattedName;
    if (formattedName)
    {
      if ([(NSString *)formattedName length]) {
        [(ABVCardValueSetter *)self->_valueSetter setValue:self->_formattedName forProperty:kABPersonLastNameProperty];
      }
    }
  }
  if ([(NSString *)self->_org length]) {
    objc_msgSend(-[ABVCardValueSetter fullName](self->_valueSetter, "fullName"), "length");
  }
  [(ABVCardParser *)self _setMultiValuesOrNoteIfNull:self->_emails forProperty:kABPersonEmailProperty valueComparator:0];
  [(ABVCardParser *)self _setMultiValuesOrNoteIfNull:self->_phones forProperty:kABPersonPhoneProperty valueComparator:&__block_literal_global_8];
  [(ABVCardParser *)self addAddressMultiValues];
  [(ABVCardParser *)self addSocialProfileMultiValues];
  [(ABVCardParser *)self addInstantMessageMultiValues];
  [(ABVCardParser *)self _setMultiValuesOrNoteIfNull:self->_dates forProperty:kABPersonDateProperty valueComparator:0];
  [(ABVCardParser *)self _setMultiValuesOrNoteIfNull:self->_relatedNames forProperty:kABPersonRelatedNamesProperty valueComparator:0];
  [(ABVCardParser *)self _setMultiValuesOrNoteIfNull:self->_urls forProperty:kABPersonURLProperty valueComparator:0];
  [(ABVCardParser *)self _setMultiValuesOrNoteIfNull:self->_addressingGrammars forProperty:kABPersonAddressingGrammarProperty valueComparator:0];
  [(ABVCardParser *)self addActivityAlertMultiValues];
  if (self->_otherNotes)
  {
    if ([(NSMutableString *)self->_notes length])
    {
      [(NSMutableString *)self->_notes appendString:@"\n"];
      notes = self->_notes;
    }
    else
    {
      notes = (NSMutableString *)objc_msgSend((id)objc_msgSend(NSString, "string"), "mutableCopy");
      self->_notes = notes;
    }
    [(NSMutableString *)notes appendString:self->_otherNotes];
  }
  [(ABVCardParser *)self _setStringValueOrNoteIfNull:self->_notes forProperty:kABPersonNoteProperty];
  if ([(ABVCardValueSetter *)self->_valueSetter valueForProperty:kABPersonImageSyncFailedTimeProperty])
  {
    goto LABEL_43;
  }
  if (![(NSData *)self->_cropRectChecksum length]) {
    goto LABEL_35;
  }
  imageData = self->_imageData;
  if (imageData)
  {
    BOOL v15 = 0;
  }
  else
  {
    imageData = (NSData *)[(ABVCardValueSetter *)self->_valueSetter imageData];
    self->_imageData = imageData;
    BOOL v15 = imageData != 0;
  }
  if (objc_msgSend((id)-[NSData _cn_md5Hash](imageData, "_cn_md5Hash"), "isEqualToData:", self->_cropRectChecksum))
  {
    int cropRectWidth = self->_cropRectWidth;
    if (cropRectWidth) {
      int cropRectWidth = self->_cropRectHeight != 0;
    }
    goto LABEL_36;
  }
  if (v15)
  {

    int cropRectWidth = 0;
    self->_imageData = 0;
  }
  else
  {
LABEL_35:
    int cropRectWidth = 0;
  }
LABEL_36:
  if (self->_imageData)
  {
    valueSetter = self->_valueSetter;
    if (cropRectWidth) {
      -[ABVCardValueSetter setImageData:cropRectX:cropRectY:cropRectWidth:cropRectHeight:](valueSetter, "setImageData:cropRectX:cropRectY:cropRectWidth:cropRectHeight:");
    }
    else {
      -[ABVCardValueSetter setImageData:](valueSetter, "setImageData:");
    }
  }
  else if (!self->_imageURI)
  {
    [(ABVCardParser *)self noteLackOfValueForImageData];
  }
  [(ABVCardParser *)self _setStringValueOrNoteIfNull:self->_imageURI forProperty:kABPersonImageURIProperty];
LABEL_43:
  if ([(ABVCardLexer *)self->_lexer advanceToToken:8193 throughTypes:0x4000]
    && [(ABVCardLexer *)self->_lexer advanceToToken:6 throughTypes:0x4000])
  {
    [(ABVCardLexer *)self->_lexer advancePastEOL];
    [(ABVCardParser *)self cleanUpCardState];
    BOOL v12 = 1;
    goto LABEL_22;
  }
  if ([(NSData *)self->_data length] > 0x3E7)
  {
    ABDiagnosticsEnabled();
    uint64_t v22 = [(NSData *)self->_data length];
    _ABLog2(4, (uint64_t)"-[ABVCardParser importToValueSetter:]", 2804, 0, @"failed to import vcard, file too large to log (actual size %lu)", v23, v24, v25, v22);
  }
  else
  {
    uint64_t v18 = (void *)[[NSString alloc] initWithData:self->_data encoding:4];
    ABDiagnosticsEnabled();
    _ABLog2(4, (uint64_t)"-[ABVCardParser importToValueSetter:]", 2801, 0, @"failed to import vcard:\n%@\n", v19, v20, v21, (uint64_t)v18);
  }
  [(ABVCardParser *)self cleanUpCardState];
LABEL_21:
  BOOL v12 = 0;
LABEL_22:
  [v5 drain];
  return v12;
}

BOOL __37__ABVCardParser_importToValueSetter___block_invoke()
{
  v0 = (const void *)CPPhoneNumberCopyHomeCountryCode();
  v1 = (const void *)CFPhoneNumberCreate();
  v2 = (const void *)CFPhoneNumberCreate();
  id v3 = v2;
  if (v1) {
    BOOL v4 = v2 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    BOOL v7 = CFEqual(v1, v2) != 0;
    goto LABEL_10;
  }
  BOOL v7 = 0;
  BOOL v5 = 0;
  if (v1)
  {
LABEL_10:
    CFRelease(v1);
    BOOL v5 = v7;
    if (!v3) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (v2) {
LABEL_8:
  }
    CFRelease(v3);
LABEL_9:
  CFRelease(v0);
  return v5;
}

- (void)copyNextPersonWithLength:(int *)a3 foundProperties:(const __CFArray *)a4
{
  if (![(ABVCardWatchdogTimer *)self->_timer isStarted]) {
    [(ABVCardWatchdogTimer *)self->_timer start];
  }
  if ([(ABVCardLexer *)self->_lexer atEOF])
  {
    ABRecordRef v7 = 0;
    if (a3)
    {
      int v8 = 0;
LABEL_11:
      *a3 = v8;
    }
  }
  else
  {
    unsigned int v9 = [(ABVCardLexer *)self->_lexer cursor];
    ABRecordRef v7 = ABPersonCreateInSource(self->_source);
    if (v7 && ![(ABVCardParser *)self importToPerson:v7 foundProperties:a4])
    {
      self->_hasImportErrors = 1;
      CFRelease(v7);
      ABRecordRef v7 = 0;
    }
    if (a3)
    {
      int v8 = [(ABVCardLexer *)self->_lexer cursor] - v9;
      goto LABEL_11;
    }
  }
  return (void *)v7;
}

- (__CFArray)peopleAndProperties:(const __CFArray *)a3
{
  if (![(ABVCardWatchdogTimer *)self->_timer isStarted]) {
    [(ABVCardWatchdogTimer *)self->_timer start];
  }
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  uint64_t v6 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];
  ABMutableMultiValueRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  int v8 = CFArrayCreateMutable(v5, 0, v6);
  if (![(ABVCardLexer *)self->_lexer atEOF])
  {
    while (1)
    {
      value = 0;
      unsigned int v9 = [(ABVCardParser *)self copyNextPersonWithLength:0 foundProperties:&value];
      if (v9)
      {
        int v10 = v9;
        CFArrayAppendValue(Mutable, v9);
        CFRelease(v10);
      }
      if (value)
      {
        CFArrayAppendValue(v8, value);
        CFRelease(value);
      }
      if ([(ABVCardParser *)self hasImportErrors]) {
        break;
      }
      if ([(ABVCardLexer *)self->_lexer atEOF]) {
        goto LABEL_10;
      }
    }
    ABDiagnosticsEnabled();
    _ABLog2(4, (uint64_t)"-[ABVCardParser peopleAndProperties:]", 2860, 0, @"Aborting vCard parsing due to import errors.", v11, v12, v13, v15);
    if (!a3) {
      goto LABEL_13;
    }
LABEL_11:
    *a3 = v8;
    goto LABEL_15;
  }
LABEL_10:
  if (a3) {
    goto LABEL_11;
  }
LABEL_13:
  if (v8) {
    CFRelease(v8);
  }
LABEL_15:
  if (Mutable) {
    return (__CFArray *)CFAutorelease(Mutable);
  }
  else {
    return 0;
  }
}

- (id)sortedPeopleAndProperties:(const __CFArray *)a3
{
  CFTypeRef cf = 0;
  CFAllocatorRef v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:", -[ABVCardParser peopleAndProperties:](self, "peopleAndProperties:", &cf));
  if ([(ABVCardParser *)self hasImportErrors])
  {
    ABDiagnosticsEnabled();
    unsigned int v9 = @"Aborting vCard sorting and returning 0 contact due to import errors.";
    uint64_t v10 = 2888;
LABEL_8:
    _ABLog2(4, (uint64_t)"-[ABVCardParser sortedPeopleAndProperties:]", v10, 0, (uint64_t)v9, v6, v7, v8, v13);
    return (id)MEMORY[0x1E4F1CBF0];
  }
  _sortOrdering = ABPersonGetSortOrdering();
  [v5 sortUsingFunction:_SortPeople context:self];
  timer = self->_timer;
  if (timer && ![(ABVCardWatchdogTimer *)timer isValid])
  {
    ABDiagnosticsEnabled();
    unsigned int v9 = @"Aborting vCard sorting and returning 0 contact due to sorting being too long.";
    uint64_t v10 = 2895;
    goto LABEL_8;
  }
  if (a3)
  {
    *a3 = (const __CFArray *)cf;
  }
  else if (cf)
  {
    CFRelease(cf);
  }
  return v5;
}

- (id)_valueSetter
{
  return self->_valueSetter;
}

@end