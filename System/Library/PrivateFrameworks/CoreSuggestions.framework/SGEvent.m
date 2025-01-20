@interface SGEvent
+ (BOOL)supportsSecureCoding;
+ (SGEvent)eventWithRecordId:(id)a3 origin:(id)a4 uniqueKey:(id)a5 opaqueKey:(id)a6 title:(id)a7 notes:(id)a8 start:(id)a9 startTimeZone:(id)a10 end:(id)a11 endTimeZone:(id)a12 isAllDay:(BOOL)a13 creationDate:(id)a14 lastModifiedDate:(id)a15 locations:(id)a16 tags:(id)a17 URL:(id)a18;
- (BOOL)isAllDay;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEvent:(id)a3;
- (BOOL)isGeocodeCandidate;
- (BOOL)isNaturalLanguageEvent;
- (BOOL)shouldAllowNotificationsInCalendarForBundleId:(id)a3 appIsInForeground:(BOOL)a4;
- (BOOL)shouldAllowNotificationsInCalendarForBundleId:(id)a3 appIsInForeground:(BOOL)a4 allowListOverride:(id)a5;
- (BOOL)shouldAllowNotificationsInCalendarWithAllowListOverride:(id)a3;
- (CSSearchableItemAttributeSet)attributeSetForEvent;
- (NSArray)locations;
- (NSArray)schemaOrg;
- (NSArray)tags;
- (NSDate)creationDate;
- (NSDate)end;
- (NSDate)lastModifiedDate;
- (NSDate)start;
- (NSString)naturalLanguageEventTypeIdentifier;
- (NSString)notes;
- (NSString)opaqueKey;
- (NSString)title;
- (NSString)uniqueKey;
- (NSTimeZone)endTimeZone;
- (NSTimeZone)startTimeZone;
- (NSURL)URL;
- (SGEvent)initWithCoder:(id)a3;
- (SGEvent)initWithRecordId:(id)a3 origin:(id)a4 uniqueKey:(id)a5 opaqueKey:(id)a6 title:(id)a7 notes:(id)a8 start:(id)a9 startTimeZone:(id)a10 end:(id)a11 endTimeZone:(id)a12 isAllDay:(BOOL)a13 creationDate:(id)a14 lastModifiedDate:(id)a15 locations:(id)a16 tagStrings:(id)a17 URL:(id)a18 naturalLanguageEventIdentifier:(id)a19 naturalLanguageEventAttributes:(unint64_t)a20 schemaOrg:(id)a21;
- (SGEvent)initWithRecordId:(id)a3 origin:(id)a4 uniqueKey:(id)a5 opaqueKey:(id)a6 title:(id)a7 notes:(id)a8 start:(id)a9 startTimeZone:(id)a10 end:(id)a11 endTimeZone:(id)a12 isAllDay:(BOOL)a13 creationDate:(id)a14 lastModifiedDate:(id)a15 locations:(id)a16 tags:(id)a17 URL:(id)a18;
- (double)duration;
- (id)_componentsForDate:(id)a3 timeZone:(id)a4 isEnd:(BOOL)a5 calendar:(id)a6;
- (id)_naturalLanguageEventTagsInTags:(id)a3;
- (id)dateForUTCDate:(id)a3 withTimeZone:(id)a4;
- (id)endDateComponents;
- (id)firstLocationForType:(unint64_t)a3;
- (id)geocodedEventWithStartDate:(id)a3 startTimeZone:(id)a4 endDate:(id)a5 endTimeZone:(id)a6 locations:(id)a7;
- (id)loggingIdentifier;
- (id)poiFilters;
- (id)startDateComponents;
- (id)toEKEventWithStore:(id)a3;
- (int64_t)ekEventAvailabilityState;
- (unint64_t)geocodingMode;
- (unint64_t)hash;
- (unint64_t)naturalLanguageEventAttributes;
- (void)_applyTimeRangeToEKEvent:(id)a3 withTZID:(id)a4;
- (void)_mergeTagsIntoEKEvent:(id)a3 withStore:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)geocodeWithCallback:(id)a3;
- (void)mergeIntoEKEvent:(id)a3;
- (void)mergeIntoEKEvent:(id)a3 withStore:(id)a4;
- (void)mergeIntoEKEvent:(id)a3 withStore:(id)a4 preservingValuesDifferentFrom:(id)a5;
- (void)setAttributeSetForEvent:(id)a3;
@end

@implementation SGEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributeSetForEvent, 0);
  objc_storeStrong((id *)&self->_schemaOrg, 0);
  objc_storeStrong((id *)&self->_naturalLanguageEventTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_uniqueKey, 0);
  objc_storeStrong((id *)&self->_opaqueKey, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_endTimeZone, 0);
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_startTimeZone, 0);
  objc_storeStrong((id *)&self->_start, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_geocoded, 0);

  objc_storeStrong((id *)&self->_geocodeQueue, 0);
}

- (CSSearchableItemAttributeSet)attributeSetForEvent
{
  return self->_attributeSetForEvent;
}

- (NSArray)schemaOrg
{
  return self->_schemaOrg;
}

- (unint64_t)naturalLanguageEventAttributes
{
  return self->_naturalLanguageEventAttributes;
}

- (NSString)naturalLanguageEventTypeIdentifier
{
  return self->_naturalLanguageEventTypeIdentifier;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSArray)tags
{
  return self->_tags;
}

- (NSString)uniqueKey
{
  return self->_uniqueKey;
}

- (NSString)opaqueKey
{
  return self->_opaqueKey;
}

- (NSArray)locations
{
  return self->_locations;
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (BOOL)isAllDay
{
  return self->_isAllDay;
}

- (NSTimeZone)endTimeZone
{
  return self->_endTimeZone;
}

- (NSDate)end
{
  return self->_end;
}

- (NSTimeZone)startTimeZone
{
  return self->_startTimeZone;
}

- (NSDate)start
{
  return self->_start;
}

- (NSString)notes
{
  return self->_notes;
}

- (NSString)title
{
  return self->_title;
}

- (void)setAttributeSetForEvent:(id)a3
{
  self->_attributeSetForEvent = (CSSearchableItemAttributeSet *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (id)loggingIdentifier
{
  p_opaqueKey = &self->_opaqueKey;
  if (self->_opaqueKey || (p_opaqueKey = &self->_uniqueKey, self->_uniqueKey)) {
    v3 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"%tu", -[NSString hash](*p_opaqueKey, "hash"));
  }
  else {
    v3 = &stru_1EF915628;
  }
  if ((unint64_t)[(__CFString *)v3 length] > 0xC)
  {
    -[__CFString substringWithRange:](v3, "substringWithRange:", 0, 12);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;

  return v5;
}

- (id)_naturalLanguageEventTagsInTags:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v3);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v10 isNaturalLanguageEventTypeIdentifier])
        {
          uint64_t v11 = [v10 value];

          v6 = (void *)v11;
        }
        if ([v10 isNaturalLanguageEventAttributes])
        {
          v12 = [v10 value];
          uint64_t v7 = [v12 longLongValue];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }
  else
  {
    v6 = 0;
    uint64_t v7 = 0;
  }
  v13 = (void *)MEMORY[0x1E4F93BB8];
  v14 = [NSNumber numberWithUnsignedInteger:v7];
  v15 = [v13 tupleWithFirst:v6 second:v14];

  return v15;
}

- (BOOL)isNaturalLanguageEvent
{
  tags = self->_tags;
  id v3 = +[SGEntityTag naturalLanguageEvent];
  uint64_t v4 = [v3 name];
  LOBYTE(tags) = [(NSArray *)tags containsObject:v4];

  return (char)tags;
}

- (id)geocodedEventWithStartDate:(id)a3 startTimeZone:(id)a4 endDate:(id)a5 endTimeZone:(id)a6 locations:(id)a7
{
  id v31 = a7;
  id v12 = a6;
  id v30 = a5;
  id v29 = a4;
  id v28 = a3;
  v27 = [SGEvent alloc];
  v26 = [(SGObject *)self recordId];
  uint64_t v13 = [(SGObject *)self origin];
  uniqueKey = self->_uniqueKey;
  v25 = (void *)v13;
  opaqueKey = self->_opaqueKey;
  title = self->_title;
  notes = self->_notes;
  LOBYTE(a4) = self->_isAllDay;
  creationDate = self->_creationDate;
  lastModifiedDate = self->_lastModifiedDate;
  tags = self->_tags;
  long long v19 = [(SGEvent *)self URL];
  LOBYTE(v22) = (_BYTE)a4;
  long long v20 = -[SGEvent initWithRecordId:origin:uniqueKey:opaqueKey:title:notes:start:startTimeZone:end:endTimeZone:isAllDay:creationDate:lastModifiedDate:locations:tagStrings:URL:naturalLanguageEventIdentifier:naturalLanguageEventAttributes:schemaOrg:](v27, "initWithRecordId:origin:uniqueKey:opaqueKey:title:notes:start:startTimeZone:end:endTimeZone:isAllDay:creationDate:lastModifiedDate:locations:tagStrings:URL:naturalLanguageEventIdentifier:naturalLanguageEventAttributes:schemaOrg:", v26, v25, uniqueKey, opaqueKey, title, notes, v28, v29, v30, v12, v22, creationDate, lastModifiedDate, v31, tags, v19,
          self->_naturalLanguageEventTypeIdentifier,
          self->_naturalLanguageEventAttributes,
          self->_schemaOrg);

  return v20;
}

- (id)poiFilters
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = self->_tags;
  id v3 = (void *)[(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = +[SGEntityTag resolveName:](SGEntityTag, "resolveName:", *(void *)(*((void *)&v8 + 1) + 8 * i), (void)v8);
        if ([v6 isPOIFilters])
        {
          id v3 = [v6 value];

          goto LABEL_11;
        }
      }
      id v3 = (void *)[(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (unint64_t)geocodingMode
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v2 = self->_tags;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v3)
  {
    unint64_t v14 = 0;
    goto LABEL_17;
  }
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)v17;
  while (2)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v17 != v5) {
        objc_enumerationMutation(v2);
      }
      uint64_t v7 = +[SGEntityTag resolveName:](SGEntityTag, "resolveName:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
      long long v8 = +[SGEntityTag geocodingModeAddressOnly];
      char v9 = [v7 isEqualToEntityTag:v8];

      if (v9)
      {
        unint64_t v14 = 1;
LABEL_15:

        goto LABEL_17;
      }
      long long v10 = +[SGEntityTag geocodingModePOIOnly];
      int v11 = [v7 isEqualToEntityTag:v10];

      if (v11)
      {
        unint64_t v14 = 2;
        goto LABEL_15;
      }
      id v12 = +[SGEntityTag geocodingModeAddressThenPOI];
      int v13 = [v7 isEqualToEntityTag:v12];

      if (v13)
      {
        unint64_t v14 = 3;
        goto LABEL_17;
      }
    }
    uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
    unint64_t v14 = 0;
    if (v4) {
      continue;
    }
    break;
  }
LABEL_17:

  return v14;
}

- (id)firstLocationForType:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = self->_locations;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        char v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "locationType", (void)v12) == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (void)mergeIntoEKEvent:(id)a3 withStore:(id)a4 preservingValuesDifferentFrom:(id)a5
{
  v192[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  long long v12 = [v11 objectForKeyedSubscript:@"summary"];
  if (!v12
    || ([v9 title],
        long long v13 = objc_claimAutoreleasedReturnValue(),
        int v14 = [v12 isEqualToString:v13],
        v13,
        v14))
  {
    [v9 setTitle:self->_title];
  }
  long long v15 = [v11 objectForKeyedSubscript:@"description"];
  if (!v15
    || ([v9 notes],
        long long v16 = objc_claimAutoreleasedReturnValue(),
        int v17 = [v15 isEqual:v16],
        v16,
        v17))
  {
    [v9 setNotes:self->_notes];
  }
  long long v18 = objc_opt_new();
  long long v19 = [MEMORY[0x1E4F1C9C8] date];
  [v18 addObject:v19];

  if (self->_creationDate) {
    objc_msgSend(v18, "addObject:");
  }
  long long v20 = [v18 sortedArrayUsingSelector:sel_compare_];
  uint64_t v21 = [v20 firstObject];

  v174 = (void *)v21;
  [v9 setCreationDate:v21];
  [v9 setLastModifiedDate:self->_lastModifiedDate];
  uint64_t v22 = [(SGObject *)self origin];
  v176 = v15;
  v177 = v12;
  v175 = v18;
  if ([v22 type] == 1) {
    goto LABEL_14;
  }
  v23 = [(SGObject *)self origin];
  if ([v23 type] == 4) {
    goto LABEL_13;
  }
  v24 = [(SGObject *)self origin];
  if ([v24 type] == 6)
  {

LABEL_13:
LABEL_14:

    goto LABEL_15;
  }
  [(SGObject *)self origin];
  v161 = v160 = self;
  if ([v161 type] == 5)
  {

    self = v160;
    goto LABEL_14;
  }
  v162 = [(SGObject *)v160 origin];
  id v171 = v11;
  uint64_t v163 = [v162 type];

  BOOL v164 = v163 == 7;
  id v11 = v171;
  self = v160;
  if (!v164)
  {
    uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, v160, @"SGEvent.m", 524, @"Suggested events can only come from Mail, Messages, Safari, Interactions or schema.org" object file lineNumber description];
    goto LABEL_14;
  }
LABEL_15:
  v25 = [(SGObject *)self origin];
  if ([v25 type] == 1)
  {
  }
  else
  {
    v26 = [(SGObject *)self origin];
    uint64_t v27 = [v26 type];

    if (v27 != 4) {
      goto LABEL_29;
    }
  }
  uint64_t v28 = [(SGEvent *)self URL];
  id v29 = self;
  if (!v28) {
    goto LABEL_21;
  }
  id v30 = (void *)v28;
  id v31 = [(SGEvent *)self tags];
  v32 = +[SGEntityTag fromCalendarAttachment];
  v33 = [v32 name];
  int v34 = [v31 containsObject:v33];

  if (!v34)
  {
LABEL_21:
    v36 = [(SGObject *)v29 origin];
    self = v29;
    if ([v36 type] == 1)
    {
      opaqueKey = v29->_opaqueKey;

      if (opaqueKey)
      {
        v35 = [(SGObject *)v29 origin];
        v38 = [v35 externalKey];
        uint64_t v39 = +[SGEKEventConversions urlForEKEventFromMailMessageWithId:v38 sentAt:v29->_creationDate opaqueKey:v29->_opaqueKey];
LABEL_27:
        v42 = (void *)v39;
        [v9 setURL:v39];

        goto LABEL_28;
      }
    }
    else
    {
    }
    v40 = [(SGObject *)v29 origin];
    uint64_t v41 = [v40 type];

    if (v41 != 4) {
      goto LABEL_29;
    }
    v35 = [(SGObject *)v29 origin];
    v38 = [v35 externalKey];
    uint64_t v39 = +[SGEKEventConversions urlForEKEventFromTextMessageWithUniqueIdentifier:v38];
    goto LABEL_27;
  }
  v35 = [(SGEvent *)v29 URL];
  [v9 setURL:v35];
  self = v29;
LABEL_28:

LABEL_29:
  v43 = [(SGEvent *)self firstLocationForType:0];
  v178 = self;
  if (v43)
  {
    id v44 = v43;
  }
  else
  {
    id v44 = [(SGEvent *)self firstLocationForType:2];

    if (!v44) {
      goto LABEL_49;
    }
  }
  if (([v44 isGeocoded] & 1) == 0)
  {
    v45 = [v44 handle];

    if (!v45)
    {
      uint64_t v149 = [v44 label];
      if (v149)
      {
        v150 = (void *)v149;
        uint64_t v151 = [v44 address];
        if (v151)
        {
          v152 = (void *)v151;
          v153 = [v44 label];
          v154 = [v44 address];
          char v155 = [v153 isEqualToString:v154];

          if ((v155 & 1) == 0)
          {
            v156 = [v44 label];
            v192[0] = v156;
            v157 = [v44 address];
            v192[1] = v157;
            v158 = [MEMORY[0x1E4F1C978] arrayWithObjects:v192 count:2];
            v159 = objc_msgSend(v158, "_pas_componentsJoinedByString:", @"\n");
            [v9 setLocation:v159];

            self = v178;
            goto LABEL_49;
          }
        }
        else
        {
        }
      }
      v165 = [v44 address];
      if ([v165 length])
      {

        self = v178;
      }
      else
      {
        v166 = [v44 label];
        uint64_t v167 = [v166 length];

        self = v178;
        if (!v167) {
          goto LABEL_49;
        }
      }
      v62 = [v44 address];
      if (v62)
      {
        [v9 setLocation:v62];
        goto LABEL_48;
      }
      v63 = [v44 label];
      [v9 setLocation:v63];
LABEL_47:

LABEL_48:
      goto LABEL_49;
    }
  }
  v46 = [v44 label];
  if (v46)
  {
    [v9 setLocation:v46];
  }
  else
  {
    v47 = [v44 address];
    [v9 setLocation:v47];
  }
  id v48 = SGWeakLinkClass(@"EKStructuredLocation", 0);
  v49 = [v44 label];
  v50 = v49;
  if (!v49)
  {
    v50 = [v44 address];
  }
  v51 = [v48 locationWithTitle:v50];
  [v9 setStructuredLocation:v51];

  if (!v49) {
  v52 = [v44 address];
  }

  if (v52)
  {
    v53 = [v44 address];
    v54 = [v9 structuredLocation];
    [v54 setAddress:v53];
  }
  if ([v44 isGeocoded])
  {
    id v55 = objc_alloc(MEMORY[0x1E4F1E5F0]);
    [v44 latitude];
    double v57 = v56;
    [v44 longitude];
    v59 = (void *)[v55 initWithLatitude:v57 longitude:v58];
    v60 = [v9 structuredLocation];
    [v60 setGeoLocation:v59];
  }
  v61 = [v44 handle];

  if (v61)
  {
    v62 = [v44 handle];
    v63 = [v9 structuredLocation];
    [v63 setMapKitHandle:v62];
    goto LABEL_47;
  }
LABEL_49:
  v64 = [(SGEvent *)self firstLocationForType:3];
  v65 = v64;
  if (v64)
  {
    if (([v64 isGeocoded] & 1) != 0
      || ([v65 handle], v66 = objc_claimAutoreleasedReturnValue(), v66, v66))
    {
      id v67 = SGWeakLinkClass(@"EKStructuredLocation", 0);
      v68 = [v65 label];
      v69 = v68;
      if (!v68)
      {
        v69 = [v65 address];
      }
      v70 = [v67 locationWithTitle:v69];
      [v9 setEndLocation:v70];

      if (!v68) {
      v71 = [v65 address];
      }

      if (v71)
      {
        v72 = [v65 address];
        v73 = [v9 endLocation];
        [v73 setAddress:v72];
      }
      if ([v65 isGeocoded])
      {
        id v74 = objc_alloc(MEMORY[0x1E4F1E5F0]);
        [v65 latitude];
        double v76 = v75;
        [v65 longitude];
        v78 = (void *)[v74 initWithLatitude:v76 longitude:v77];
        v79 = [v9 endLocation];
        [v79 setGeoLocation:v78];
      }
      v80 = [v65 handle];

      if (v80)
      {
        v81 = [v65 handle];
        v82 = [v9 endLocation];
        [v82 setMapKitHandle:v81];
      }
    }
  }
  v173 = v44;
  tags = self->_tags;
  v84 = +[SGEntityTag extractedFlight];
  v85 = [v84 name];
  LODWORD(tags) = [(NSArray *)tags containsObject:v85];

  if (tags) {
    [v9 setTravelAdvisoryBehavior:2];
  }
  v86 = self->_tags;
  v87 = +[SGEntityTag fromSync];
  v88 = [v87 name];
  LODWORD(v86) = [(NSArray *)v86 containsObject:v88];

  if (v86) {
    [v9 setLocalCustomObject:MEMORY[0x1E4F1CC38] forKey:@"EKEventSuggestedEventSavedFromSyncKey"];
  }
  int64_t v89 = [(SGEvent *)self ekEventAvailabilityState];
  v90 = sgLogHandle();
  if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v191 = v89;
    _os_log_debug_impl(&dword_1A4D8C000, v90, OS_LOG_TYPE_DEBUG, "EKEvent Availability: \"%ld\"", buf, 0xCu);
  }
  v172 = v65;

  v91 = [NSNumber numberWithInteger:v89];
  [v9 setLocalCustomObject:v91 forKey:@"EKEventAvailabilityState"];

  schemaOrg = self->_schemaOrg;
  if (schemaOrg) {
    [v9 setCustomObject:schemaOrg forKey:@"SuggestionsSchemaOrg"];
  }
  long long v186 = 0u;
  long long v187 = 0u;
  long long v184 = 0u;
  long long v185 = 0u;
  v93 = self->_tags;
  uint64_t v94 = [(NSArray *)v93 countByEnumeratingWithState:&v184 objects:v189 count:16];
  if (v94)
  {
    uint64_t v95 = v94;
    uint64_t v96 = *(void *)v185;
    while (2)
    {
      for (uint64_t i = 0; i != v95; ++i)
      {
        if (*(void *)v185 != v96) {
          objc_enumerationMutation(v93);
        }
        v98 = +[SGEntityTag resolveName:*(void *)(*((void *)&v184 + 1) + 8 * i)];
        if ([v98 isEventMetadata])
        {
          v99 = [v98 eventMetadata];
          if (v99) {
            [v9 setCustomObject:v99 forKey:@"SGEventMetadataKey"];
          }

          self = v178;
          goto LABEL_82;
        }
      }
      uint64_t v95 = [(NSArray *)v93 countByEnumeratingWithState:&v184 objects:v189 count:16];
      self = v178;
      if (v95) {
        continue;
      }
      break;
    }
  }
LABEL_82:

  if ([(SGEvent *)self isNaturalLanguageEvent])
  {
    v169 = v9;
    id v170 = v11;
    id v168 = v10;
    v179 = objc_opt_new();
    v100 = objc_opt_new();
    [v100 setObject:self->_naturalLanguageEventTypeIdentifier forKeyedSubscript:@"SuggestionsNLEventDictionaryEventTypeKey"];
    v101 = [NSNumber numberWithUnsignedInteger:self->_naturalLanguageEventAttributes];
    [v100 setObject:v101 forKeyedSubscript:@"SuggestionsNLEventDictionaryEventAttributesKey"];

    v102 = NSNumber;
    v103 = self->_tags;
    unint64_t v104 = 0x1E5B8D000uLL;
    v105 = +[SGEntityTag significantSender];
    v106 = [v105 name];
    v107 = objc_msgSend(v102, "numberWithBool:", -[NSArray containsObject:](v103, "containsObject:", v106));
    [v100 setObject:v107 forKeyedSubscript:@"SuggestionsNLEventDictionaryEventSignificantSenderKey"];

    v108 = v178->_tags;
    v109 = +[SGEntityTag titleGeneratedFromTemplate];
    v110 = [v109 name];
    LOBYTE(v108) = [(NSArray *)v108 containsObject:v110];

    if (v108)
    {
      v111 = kSuggestionsEkEventNLEventDictionaryEventTitleSourceTemplateValue;
    }
    else
    {
      v112 = v178->_tags;
      v113 = +[SGEntityTag titleGeneratedFromSubject];
      v114 = [v113 name];
      LODWORD(v112) = [(NSArray *)v112 containsObject:v114];

      if (!v112)
      {
LABEL_88:
        long long v182 = 0u;
        long long v183 = 0u;
        long long v180 = 0u;
        long long v181 = 0u;
        v115 = v178->_tags;
        uint64_t v116 = [(NSArray *)v115 countByEnumeratingWithState:&v180 objects:v188 count:16];
        if (!v116) {
          goto LABEL_111;
        }
        uint64_t v117 = v116;
        uint64_t v118 = *(void *)v181;
        while (1)
        {
          for (uint64_t j = 0; j != v117; ++j)
          {
            if (*(void *)v181 != v118) {
              objc_enumerationMutation(v115);
            }
            v120 = objc_msgSend(*(id *)(v104 + 3016), "resolveName:", *(void *)(*((void *)&v180 + 1) + 8 * j), v168);
            if ([v120 isConfidenceScore])
            {
              v121 = NSNumber;
              v122 = [v120 value];
              [v122 doubleValue];
              v123 = objc_msgSend(v121, "numberWithDouble:");
              v124 = v100;
              v125 = v123;
              v126 = @"SuggestionsNLEventDictionaryEventConfidenceScoreKey";
LABEL_107:
              [v124 setObject:v125 forKeyedSubscript:v126];

              unint64_t v104 = 0x1E5B8D000;
              goto LABEL_108;
            }
            if ([v120 isParticipantCount])
            {
              v127 = NSNumber;
              v122 = [v120 value];
              v123 = objc_msgSend(v127, "numberWithInteger:", objc_msgSend(v122, "integerValue"));
              v124 = v100;
              v125 = v123;
              v126 = @"SuggestionsNLEventDictionaryEventParticipantCountKey";
              goto LABEL_107;
            }
            if (![v120 isNaturalLanguageEventLanguageID])
            {
              if ([v120 isCalendarAppUsageLevel])
              {
                v128 = NSNumber;
                v122 = [v120 value];
                [v122 floatValue];
                v123 = objc_msgSend(v128, "numberWithFloat:");
                v124 = v179;
                v125 = v123;
                v126 = @"SuggestionsNLEventDictionaryCalendarAppUsageLevelKey";
              }
              else if ([v120 isMailAppUsageLevel])
              {
                v129 = NSNumber;
                v122 = [v120 value];
                v123 = objc_msgSend(v129, "numberWithInteger:", objc_msgSend(v122, "integerValue"));
                v124 = v179;
                v125 = v123;
                v126 = @"SuggestionsNLEventDictionaryMailAppUsageLevelKey";
              }
              else if ([v120 isMessagesAppUsageLevel])
              {
                v130 = NSNumber;
                v122 = [v120 value];
                v123 = objc_msgSend(v130, "numberWithInteger:", objc_msgSend(v122, "integerValue"));
                v124 = v179;
                v125 = v123;
                v126 = @"SuggestionsNLEventDictionaryMessagesAppUsageLevelKey";
              }
              else
              {
                if (![v120 isUsedBubblesCount]) {
                  goto LABEL_109;
                }
                v131 = NSNumber;
                v122 = [v120 value];
                v123 = objc_msgSend(v131, "numberWithInteger:", objc_msgSend(v122, "integerValue"));
                v124 = v179;
                v125 = v123;
                v126 = @"SuggestionsNLEventDictionaryEventUsedBubblesCountKey";
              }
              goto LABEL_107;
            }
            v122 = [v120 value];
            [v100 setObject:v122 forKeyedSubscript:@"SuggestionsNLEventDictionaryEventLanguageIDKey"];
LABEL_108:

LABEL_109:
          }
          uint64_t v117 = [(NSArray *)v115 countByEnumeratingWithState:&v180 objects:v188 count:16];
          if (!v117)
          {
LABEL_111:

            v132 = (void *)[v179 copy];
            id v9 = v169;
            [v169 setLocalCustomObject:v132 forKey:@"SuggestionsNLEventDictionaryKey"];

            v133 = (void *)[v100 copy];
            [v169 setCustomObject:v133 forKey:@"SuggestionsNLEventDictionaryKey"];

            id v10 = v168;
            id v11 = v170;
            self = v178;
            goto LABEL_112;
          }
        }
      }
      v111 = kSuggestionsEkEventNLEventDictionaryEventTitleSourceSubjectValue;
    }
    objc_msgSend(v100, "setObject:forKeyedSubscript:", *v111, @"SuggestionsNLEventDictionaryEventTitleSourceKey", v10);
    goto LABEL_88;
  }
LABEL_112:
  v134 = [(SGObject *)self origin];
  v135 = [v134 bundleId];
  [v9 setLocalCustomObject:v135 forKey:@"SuggestionsOriginBundleId"];

  v136 = [(SGObject *)self origin];
  v137 = [v136 fromPerson];
  v138 = [v137 displayName];
  [v9 setLocalCustomObject:v138 forKey:@"SuggestionsOriginDisplayName"];

  id v139 = objc_alloc((Class)SGWeakLinkClass(@"EKSuggestedEventInfo", 0));
  v140 = self->_opaqueKey;
  uniqueKey = self->_uniqueKey;
  v142 = [(SGObject *)self origin];
  [v142 externalKey];
  v144 = v143 = self;
  v145 = (void *)[v139 initWithEventStore:v10 opaqueKey:v140 uniqueKey:uniqueKey extractionGroupIdentifier:v144];

  [v9 setSuggestionInfo:v145];
  [(NSDate *)v143->_creationDate timeIntervalSince1970];
  double v147 = v146;
  v148 = [v9 suggestionInfo];
  [v148 setTimestamp:v147];

  [(SGEvent *)v143 _mergeTagsIntoEKEvent:v9 withStore:v10];
}

- (void)_mergeTagsIntoEKEvent:(id)a3 withStore:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v16 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v6 = [(SGEvent *)self tags];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v6);
        }
        long long v12 = +[SGEntityTag resolveName:*(void *)(*((void *)&v18 + 1) + 8 * i)];
        long long v13 = [v12 name];
        int v14 = [v13 hasPrefix:@"TZID"];

        if (v14)
        {
          uint64_t v15 = [v12 value];

          id v9 = (void *)v15;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
  }

  [(SGEvent *)self _applyTimeRangeToEKEvent:v17 withTZID:v9];
}

- (void)_applyTimeRangeToEKEvent:(id)a3 withTZID:(id)a4
{
  id v20 = a4;
  uint64_t v6 = (void *)MEMORY[0x1E4F1C9A8];
  uint64_t v7 = *MEMORY[0x1E4F1C318];
  id v8 = a3;
  id v9 = [v6 calendarWithIdentifier:v7];
  uint64_t v10 = [v20 isEqualToString:@"floating"];
  if (v20 && (v10 & 1) == 0)
  {
    id v11 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:v20];
LABEL_6:
    long long v12 = v11;
    long long v13 = v12;
    endTimeZone = v12;
    goto LABEL_8;
  }
  if (v20)
  {
    id v11 = 0;
    goto LABEL_6;
  }
  long long v12 = self->_startTimeZone;
  long long v13 = 0;
  endTimeZone = self->_endTimeZone;
LABEL_8:
  start = self->_start;
  id v16 = endTimeZone;
  id v17 = [(SGEvent *)self _componentsForDate:start timeZone:v12 isEnd:0 calendar:v9];
  long long v18 = [(SGEvent *)self _componentsForDate:self->_end timeZone:v16 isEnd:1 calendar:v9];

  long long v19 = +[SGSimpleTimeRange rangeWithGregorianStartComponents:v17 endComponents:v18];
  objc_msgSend(v19, "applyToEKEvent:isAllDay:isFloating:", v8, -[SGEvent isAllDay](self, "isAllDay"), v10);
}

- (BOOL)shouldAllowNotificationsInCalendarForBundleId:(id)a3 appIsInForeground:(BOOL)a4 allowListOverride:(id)a5
{
  v53[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if ([(SGEvent *)self isNaturalLanguageEvent])
  {
    uint64_t v10 = sgLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v11 = "SGEvent-shouldAllowNotificationsInCalendarForBundleId: Not allowing notification for NL event.";
LABEL_8:
      _os_log_impl(&dword_1A4D8C000, v10, OS_LOG_TYPE_INFO, v11, buf, 2u);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  if (!v8 || [v8 isEqualToString:&stru_1EF915628])
  {
    uint64_t v10 = sgLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v11 = "SGEvent-shouldAllowNotificationsInCalendarForBundleId: Not allowing notification for event without bundleid";
      goto LABEL_8;
    }
LABEL_9:
    BOOL v12 = 0;
    goto LABEL_10;
  }
  if (!a4)
  {
    uint64_t v10 = sgLogHandle();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    id v11 = "SGEvent-shouldAllowNotificationsInCalendarForBundleId: Not allowing notification for app not in foreground.";
    goto LABEL_8;
  }
  int v14 = [@"com.apple.MobileSMS" lowercaseString];
  v53[0] = v14;
  uint64_t v15 = [@"com.apple.mobilemail" lowercaseString];
  v53[1] = v15;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:2];

  id v39 = v9;
  id v40 = v8;
  if (v9)
  {
    uint64_t v10 = [v16 mutableCopy];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v17 = v9;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v46 objects:v52 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v47 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          uint64_t v23 = [v22 lowercaseString];
          int v24 = [v16 containsObject:v23];

          if (v24)
          {
            v25 = [v22 lowercaseString];
            [v10 removeObject:v25];
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v46 objects:v52 count:16];
      }
      while (v19);
    }

    id v8 = v40;
  }
  else
  {
    uint64_t v10 = v16;
  }
  v26 = [v8 lowercaseString];
  int v27 = [v10 containsObject:v26];

  if (v27)
  {
    uint64_t v28 = sgLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4D8C000, v28, OS_LOG_TYPE_INFO, "SGEvent-shouldAllowNotificationsInCalendarForBundleId: Not allowing notification from excluded bundleId.", buf, 2u);
    }
    BOOL v12 = 0;
    id v9 = v39;
  }
  else
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    obuint64_t j = [(SGEvent *)self tags];
    uint64_t v29 = [obj countByEnumeratingWithState:&v42 objects:v51 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v43;
      while (2)
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v43 != v31) {
            objc_enumerationMutation(obj);
          }
          v33 = +[SGEntityTag resolveName:*(void *)(*((void *)&v42 + 1) + 8 * j)];
          int v34 = [v33 name];
          v35 = +[SGEntityTag fromSync];
          v36 = [v35 name];
          int v37 = [v34 isEqualToString:v36];

          if (v37)
          {
            v38 = sgLogHandle();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A4D8C000, v38, OS_LOG_TYPE_INFO, "SGEvent-shouldAllowNotificationsInCalendarForBundleId: Not allowing notification from synced event.", buf, 2u);
            }

            BOOL v12 = 0;
            id v9 = v39;
            id v8 = v40;
            uint64_t v28 = obj;
            goto LABEL_44;
          }
        }
        uint64_t v30 = [obj countByEnumeratingWithState:&v42 objects:v51 count:16];
        if (v30) {
          continue;
        }
        break;
      }
    }

    uint64_t v28 = sgLogHandle();
    BOOL v12 = 1;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4D8C000, v28, OS_LOG_TYPE_INFO, "SGEvent-shouldAllowNotificationsInCalendarForBundleId: Allowing notification.", buf, 2u);
    }
    id v9 = v39;
    id v8 = v40;
  }
LABEL_44:

LABEL_10:
  return v12;
}

- (BOOL)shouldAllowNotificationsInCalendarForBundleId:(id)a3 appIsInForeground:(BOOL)a4
{
  return [(SGEvent *)self shouldAllowNotificationsInCalendarForBundleId:a3 appIsInForeground:a4 allowListOverride:0];
}

- (BOOL)shouldAllowNotificationsInCalendarWithAllowListOverride:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SGObject *)self origin];
  uint64_t v6 = [v5 bundleId];

  if (v6 && ![v6 isEqualToString:&stru_1EF915628])
  {
    uint64_t v7 = [MEMORY[0x1E4F96430] predicateMatchingBundleIdentifier:v6];
    uint64_t v16 = 0;
    id v9 = [MEMORY[0x1E4F963E8] handleForPredicate:v7 error:&v16];
    uint64_t v10 = v9;
    if (!v9 || v16)
    {
      id v11 = sgLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v15 = 0;
        _os_log_error_impl(&dword_1A4D8C000, v11, OS_LOG_TYPE_ERROR, "SGEvent-shouldAllowNotificationsInCalendar: Could not get handle for app.", v15, 2u);
      }
      uint64_t v13 = 0;
    }
    else
    {
      id v11 = [v9 currentState];
      BOOL v12 = [v11 endowmentNamespaces];
      uint64_t v13 = [v12 containsObject:@"com.apple.frontboard.visibility"];
    }
    BOOL v8 = [(SGEvent *)self shouldAllowNotificationsInCalendarForBundleId:v6 appIsInForeground:v13 allowListOverride:v4];
  }
  else
  {
    uint64_t v7 = sgLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4D8C000, v7, OS_LOG_TYPE_INFO, "SGEvent-shouldAllowNotificationsInCalendar: Not allowing notification for event without bundleid", buf, 2u);
    }
    BOOL v8 = 0;
  }

  return v8;
}

- (void)mergeIntoEKEvent:(id)a3 withStore:(id)a4
{
}

- (void)mergeIntoEKEvent:(id)a3
{
  id v4 = a3;
  SGWeakLinkClass(@"EKEventStore", 0);
  id v5 = (id)objc_opt_new();
  [(SGEvent *)self mergeIntoEKEvent:v4 withStore:v5];
}

- (id)toEKEventWithStore:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(SGWeakLinkClass(@"EKEvent", 0), "eventWithEventStore:", v4);
  [(SGEvent *)self mergeIntoEKEvent:v5 withStore:v4];

  return v5;
}

- (int64_t)ekEventAvailabilityState
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = self->_tags;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v13 != v5) {
        objc_enumerationMutation(v2);
      }
      uint64_t v7 = +[SGEntityTag resolveName:](SGEntityTag, "resolveName:", *(void *)(*((void *)&v12 + 1) + 8 * v6), (void)v12);
      if ([v7 isEKEventAvailabilityState])
      {
        BOOL v8 = [v7 value];
        id v9 = v8;
        if (v8)
        {
          if ([v8 isEqual:@"ekEventAvailabilityStateNotsupported"])
          {
            int64_t v10 = -1;
LABEL_22:

            goto LABEL_23;
          }
          if ([v9 isEqual:@"ekEventAvailabilityStateBusy"])
          {
            int64_t v10 = 0;
            goto LABEL_22;
          }
          if ([v9 isEqual:@"ekEventAvailabilityStateFree"])
          {
            int64_t v10 = 1;
            goto LABEL_22;
          }
          if ([v9 isEqual:@"ekEventAvailabilityStateTentative"])
          {
            int64_t v10 = 2;
            goto LABEL_22;
          }
          if ([v9 isEqual:@"ekEventAvailabilityStateUnavailable"])
          {
            int64_t v10 = 3;
            goto LABEL_22;
          }
        }
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v4) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  int64_t v10 = 3;
LABEL_23:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_title hash];
  return [(NSString *)self->_opaqueKey hash] - v3 + 32 * v3;
}

- (BOOL)isEqualToEvent:(id)a3
{
  uint64_t v4 = (id *)a3;
  v59.receiver = self;
  v59.super_class = (Class)SGEvent;
  if (![(SGObject *)&v59 isEqualToSuggestion:v4]) {
    goto LABEL_41;
  }
  title = self->_title;
  uint64_t v6 = (NSString *)v4[6];
  if (title == v6)
  {
  }
  else
  {
    uint64_t v7 = v6;
    BOOL v8 = title;
    char v9 = [(NSString *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_41;
    }
  }
  notes = self->_notes;
  id v11 = (NSString *)v4[7];
  if (notes == v11)
  {
  }
  else
  {
    long long v12 = v11;
    long long v13 = notes;
    char v14 = [(NSString *)v13 isEqual:v12];

    if ((v14 & 1) == 0) {
      goto LABEL_41;
    }
  }
  start = self->_start;
  uint64_t v16 = (NSDate *)v4[8];
  if (start == v16)
  {
  }
  else
  {
    uint64_t v17 = v16;
    uint64_t v18 = start;
    char v19 = [(NSDate *)v18 isEqual:v17];

    if ((v19 & 1) == 0) {
      goto LABEL_41;
    }
  }
  startTimeZone = self->_startTimeZone;
  long long v21 = (NSTimeZone *)v4[9];
  if (startTimeZone == v21)
  {
  }
  else
  {
    uint64_t v22 = v21;
    uint64_t v23 = startTimeZone;
    char v24 = [(NSTimeZone *)v23 isEqual:v22];

    if ((v24 & 1) == 0) {
      goto LABEL_41;
    }
  }
  end = self->_end;
  v26 = (NSDate *)v4[10];
  if (end == v26)
  {
  }
  else
  {
    int v27 = v26;
    uint64_t v28 = end;
    char v29 = [(NSDate *)v28 isEqual:v27];

    if ((v29 & 1) == 0) {
      goto LABEL_41;
    }
  }
  endTimeZone = self->_endTimeZone;
  uint64_t v31 = (NSTimeZone *)v4[11];
  if (endTimeZone == v31)
  {
  }
  else
  {
    v32 = v31;
    v33 = endTimeZone;
    char v34 = [(NSTimeZone *)v33 isEqual:v32];

    if ((v34 & 1) == 0) {
      goto LABEL_41;
    }
  }
  if (self->_isAllDay != *((unsigned __int8 *)v4 + 40))
  {
LABEL_41:
    char v55 = 0;
    goto LABEL_42;
  }
  creationDate = self->_creationDate;
  v36 = (NSDate *)v4[12];
  if (creationDate == v36)
  {
  }
  else
  {
    int v37 = v36;
    v38 = creationDate;
    char v39 = [(NSDate *)v38 isEqual:v37];

    if ((v39 & 1) == 0) {
      goto LABEL_41;
    }
  }
  lastModifiedDate = self->_lastModifiedDate;
  uint64_t v41 = (NSDate *)v4[13];
  if (lastModifiedDate == v41)
  {
  }
  else
  {
    long long v42 = v41;
    long long v43 = lastModifiedDate;
    char v44 = [(NSDate *)v43 isEqual:v42];

    if ((v44 & 1) == 0) {
      goto LABEL_41;
    }
  }
  locations = self->_locations;
  long long v46 = (NSArray *)v4[14];
  if (locations == v46)
  {
  }
  else
  {
    long long v47 = v46;
    long long v48 = locations;
    char v49 = [(NSArray *)v48 isEqual:v47];

    if ((v49 & 1) == 0) {
      goto LABEL_41;
    }
  }
  opaqueKey = self->_opaqueKey;
  v51 = (NSString *)v4[15];
  if (opaqueKey == v51)
  {
  }
  else
  {
    v52 = v51;
    v53 = opaqueKey;
    char v54 = [(NSString *)v53 isEqual:v52];

    if ((v54 & 1) == 0) {
      goto LABEL_41;
    }
  }
  double v57 = self->_attributeSetForEvent;
  double v58 = v57;
  if (v57 == v4[22]) {
    char v55 = 1;
  }
  else {
    char v55 = -[CSSearchableItemAttributeSet isEqual:](v57, "isEqual:");
  }

LABEL_42:
  return v55;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SGEvent *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGEvent *)self isEqualToEvent:v5];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SGEvent;
  id v4 = a3;
  [(SGObject *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_uniqueKey, @"uniqueKey", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_opaqueKey forKey:@"opaqueKey"];
  [v4 encodeObject:self->_URL forKey:@"URL"];
  [v4 encodeObject:self->_title forKey:@"title"];
  [v4 encodeObject:self->_notes forKey:@"notes"];
  [v4 encodeObject:self->_start forKey:@"start"];
  [v4 encodeObject:self->_startTimeZone forKey:@"startTimeZone"];
  [v4 encodeObject:self->_end forKey:@"end"];
  [v4 encodeObject:self->_endTimeZone forKey:@"endTimeZone"];
  [v4 encodeBool:self->_isAllDay forKey:@"isAllDay"];
  [v4 encodeObject:self->_creationDate forKey:@"creationDate"];
  [v4 encodeObject:self->_lastModifiedDate forKey:@"lastModifiedDate"];
  [v4 encodeObject:self->_locations forKey:@"locations"];
  [v4 encodeObject:self->_tags forKey:@"tags"];
  [v4 encodeObject:self->_naturalLanguageEventTypeIdentifier forKey:@"naturalLanguageEventTypeIdentifier"];
  [v4 encodeInteger:self->_naturalLanguageEventAttributes forKey:@"naturalLanguageEventAttributes"];
  [v4 encodeObject:self->_schemaOrg forKey:@"schemaOrg"];
  [v4 encodeObject:self->_attributeSetForEvent forKey:@"attributeSetForEvent"];
}

- (SGEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v62.receiver = self;
  v62.super_class = (Class)SGEvent;
  objc_super v5 = [(SGObject *)&v62 initWithCoder:v4];
  if (v5)
  {
    BOOL v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"uniqueKey"];
    uniqueKey = v5->_uniqueKey;
    v5->_uniqueKey = (NSString *)v7;

    char v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"opaqueKey"];
    opaqueKey = v5->_opaqueKey;
    v5->_opaqueKey = (NSString *)v10;

    long long v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"URL"];
    URL = v5->_URL;
    v5->_URL = (NSURL *)v13;

    long long v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v16;

    uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"notes"];
    notes = v5->_notes;
    v5->_notes = (NSString *)v19;

    long long v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"start"];
    start = v5->_start;
    v5->_start = (NSDate *)v22;

    char v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"startTimeZone"];
    startTimeZone = v5->_startTimeZone;
    v5->_startTimeZone = (NSTimeZone *)v25;

    int v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v28 = [v4 decodeObjectOfClasses:v27 forKey:@"end"];
    end = v5->_end;
    v5->_end = (NSDate *)v28;

    uint64_t v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v31 = [v4 decodeObjectOfClasses:v30 forKey:@"endTimeZone"];
    endTimeZone = v5->_endTimeZone;
    v5->_endTimeZone = (NSTimeZone *)v31;

    v5->_isAllDay = [v4 decodeBoolForKey:@"isAllDay"];
    v33 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v34 = [v4 decodeObjectOfClasses:v33 forKey:@"creationDate"];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v34;

    v36 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v37 = [v4 decodeObjectOfClasses:v36 forKey:@"lastModifiedDate"];
    lastModifiedDate = v5->_lastModifiedDate;
    v5->_lastModifiedDate = (NSDate *)v37;

    id v39 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v40 = objc_opt_class();
    uint64_t v41 = objc_msgSend(v39, "initWithObjects:", v40, objc_opt_class(), 0);
    uint64_t v42 = [v4 decodeObjectOfClasses:v41 forKey:@"locations"];
    locations = v5->_locations;
    v5->_locations = (NSArray *)v42;

    id v44 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v45 = objc_opt_class();
    long long v46 = objc_msgSend(v44, "initWithObjects:", v45, objc_opt_class(), 0);
    uint64_t v47 = [v4 decodeObjectOfClasses:v46 forKey:@"tags"];
    tags = v5->_tags;
    v5->_tags = (NSArray *)v47;

    char v49 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v50 = [v4 decodeObjectOfClasses:v49 forKey:@"naturalLanguageEventTypeIdentifier"];
    naturalLanguageEventTypeIdentifier = v5->_naturalLanguageEventTypeIdentifier;
    v5->_naturalLanguageEventTypeIdentifier = (NSString *)v50;

    v5->_naturalLanguageEventAttributes = [v4 decodeIntegerForKey:@"naturalLanguageEventAttributes"];
    id v52 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v53 = objc_opt_class();
    uint64_t v54 = objc_opt_class();
    char v55 = objc_msgSend(v52, "initWithObjects:", v53, v54, objc_opt_class(), 0);
    uint64_t v56 = [v4 decodeObjectOfClasses:v55 forKey:@"schemaOrg"];
    schemaOrg = v5->_schemaOrg;
    v5->_schemaOrg = (NSArray *)v56;

    double v58 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v59 = [v4 decodeObjectOfClasses:v58 forKey:@"attributeSetForEvent"];
    attributeSetForEvent = v5->_attributeSetForEvent;
    v5->_attributeSetForEvent = (CSSearchableItemAttributeSet *)v59;
  }
  return v5;
}

- (void)geocodeWithCallback:(id)a3
{
}

- (BOOL)isGeocodeCandidate
{
  return +[SGEventGeocode isGeocodeCandidate:self];
}

- (id)dateForUTCDate:(id)a3 withTimeZone:(id)a4
{
  objc_super v5 = (objc_class *)MEMORY[0x1E4F1C9A8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 alloc];
  char v9 = (void *)[v8 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  uint64_t v10 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v9 setTimeZone:v10];

  id v11 = [v9 components:1048828 fromDate:v7];

  [v11 setTimeZone:v6];
  long long v12 = [v9 dateFromComponents:v11];

  return v12;
}

- (double)duration
{
  NSUInteger v3 = [(SGEvent *)self end];
  id v4 = [(SGEvent *)self start];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  return v6;
}

- (id)endDateComponents
{
  end = self->_end;
  endTimeZone = self->_endTimeZone;
  double v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  double v6 = [(SGEvent *)self _componentsForDate:end timeZone:endTimeZone isEnd:1 calendar:v5];

  return v6;
}

- (id)startDateComponents
{
  start = self->_start;
  startTimeZone = self->_startTimeZone;
  double v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  double v6 = [(SGEvent *)self _componentsForDate:start timeZone:startTimeZone isEnd:0 calendar:v5];

  return v6;
}

- (id)_componentsForDate:(id)a3 timeZone:(id)a4 isEnd:(BOOL)a5 calendar:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  long long v12 = (void *)MEMORY[0x1A6265250]();
  uint64_t v13 = (void *)[a6 copy];
  char v14 = v13;
  if (v11)
  {
    [v13 setTimeZone:v11];
  }
  else
  {
    long long v15 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
    [v14 setTimeZone:v15];
  }
  uint64_t v16 = 1048604;
  if (self->_isAllDay) {
    uint64_t v17 = 1048604;
  }
  else {
    uint64_t v17 = 1048828;
  }
  if (!self->_isAllDay || !v7)
  {
    uint64_t v16 = v17;
  }
  else
  {
    uint64_t v19 = [objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeInterval:v10 sinceDate:-1.0];

    id v10 = (id)v19;
  }
  uint64_t v20 = [v14 components:v16 fromDate:v10];
  [v20 setTimeZone:v11];

  return v20;
}

- (SGEvent)initWithRecordId:(id)a3 origin:(id)a4 uniqueKey:(id)a5 opaqueKey:(id)a6 title:(id)a7 notes:(id)a8 start:(id)a9 startTimeZone:(id)a10 end:(id)a11 endTimeZone:(id)a12 isAllDay:(BOOL)a13 creationDate:(id)a14 lastModifiedDate:(id)a15 locations:(id)a16 tags:(id)a17 URL:(id)a18
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v64 = a3;
  id v48 = a4;
  id v63 = a5;
  id v62 = a6;
  id v61 = a7;
  id v23 = a8;
  id v24 = a9;
  id v25 = a10;
  id v60 = a11;
  id v55 = a12;
  id v54 = a14;
  id v26 = a15;
  id v53 = a16;
  id v27 = a17;
  id v52 = a18;
  v51 = sgMapSelector(v27, (uint64_t)sel_name);
  uint64_t v28 = +[SGEntityTag naturalLanguageEvent];
  int v29 = [v27 containsObject:v28];

  if (v29)
  {
    uint64_t v30 = [(SGEvent *)self _naturalLanguageEventTagsInTags:v27];
    char v49 = [v30 first];
    uint64_t v31 = [v30 second];
    uint64_t v32 = [v31 unsignedIntegerValue];
  }
  else
  {
    char v49 = 0;
    uint64_t v32 = 0;
  }
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v33 = v27;
  id v34 = (id)[v33 countByEnumeratingWithState:&v66 objects:v70 count:16];
  double v58 = v25;
  uint64_t v59 = v24;
  uint64_t v50 = v23;
  if (v34)
  {
    uint64_t v47 = v32;
    uint64_t v35 = *(void *)v67;
    while (2)
    {
      for (uint64_t i = 0; i != v34; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v67 != v35) {
          objc_enumerationMutation(v33);
        }
        uint64_t v37 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        if ([v37 isSchemaOrg])
        {
          v38 = (void *)MEMORY[0x1E4F28D90];
          id v39 = [v37 value];
          uint64_t v40 = [v39 dataUsingEncoding:4];
          uint64_t v65 = 0;
          uint64_t v41 = [v38 JSONObjectWithData:v40 options:0 error:&v65];
          uint64_t v42 = v65;

          id v34 = 0;
          if (!v42) {
            id v34 = v41;
          }

          goto LABEL_16;
        }
      }
      id v34 = (id)[v33 countByEnumeratingWithState:&v66 objects:v70 count:16];
      if (v34) {
        continue;
      }
      break;
    }
LABEL_16:
    id v43 = v64;
    uint64_t v32 = v47;
    id v44 = v48;
  }
  else
  {
    id v43 = v64;
    id v44 = v48;
  }

  LOBYTE(v46) = a13;
  double v57 = -[SGEvent initWithRecordId:origin:uniqueKey:opaqueKey:title:notes:start:startTimeZone:end:endTimeZone:isAllDay:creationDate:lastModifiedDate:locations:tagStrings:URL:naturalLanguageEventIdentifier:naturalLanguageEventAttributes:schemaOrg:](self, "initWithRecordId:origin:uniqueKey:opaqueKey:title:notes:start:startTimeZone:end:endTimeZone:isAllDay:creationDate:lastModifiedDate:locations:tagStrings:URL:naturalLanguageEventIdentifier:naturalLanguageEventAttributes:schemaOrg:", v43, v44, v63, v62, v61, v50, v59, v58, v60, v55, v46, v54, v26, v53, v51, v52,
          v49,
          v32,
          v34);

  return v57;
}

- (SGEvent)initWithRecordId:(id)a3 origin:(id)a4 uniqueKey:(id)a5 opaqueKey:(id)a6 title:(id)a7 notes:(id)a8 start:(id)a9 startTimeZone:(id)a10 end:(id)a11 endTimeZone:(id)a12 isAllDay:(BOOL)a13 creationDate:(id)a14 lastModifiedDate:(id)a15 locations:(id)a16 tagStrings:(id)a17 URL:(id)a18 naturalLanguageEventIdentifier:(id)a19 naturalLanguageEventAttributes:(unint64_t)a20 schemaOrg:(id)a21
{
  id v62 = a5;
  id v63 = a6;
  id v61 = a7;
  id v24 = a8;
  id v65 = a9;
  id v25 = a10;
  id v64 = a11;
  id v60 = a12;
  id v26 = a14;
  id v27 = a15;
  id v28 = a16;
  id v29 = a17;
  id v30 = a18;
  uint64_t v31 = v26;
  id v59 = a19;
  id v32 = a21;
  v66.receiver = self;
  v66.super_class = (Class)SGEvent;
  id v33 = [(SGObject *)&v66 initWithRecordId:a3 origin:a4];
  if (v33)
  {
    uint64_t v34 = [v63 copy];
    opaqueKey = v33->_opaqueKey;
    v33->_opaqueKey = (NSString *)v34;

    uint64_t v36 = [v62 copy];
    uniqueKey = v33->_uniqueKey;
    v33->_uniqueKey = (NSString *)v36;

    uint64_t v38 = [v61 copy];
    title = v33->_title;
    v33->_title = (NSString *)v38;

    uint64_t v40 = [v24 copy];
    notes = v33->_notes;
    v33->_notes = (NSString *)v40;

    uint64_t v42 = [v65 copy];
    start = v33->_start;
    v33->_start = (NSDate *)v42;

    objc_storeStrong((id *)&v33->_startTimeZone, a10);
    uint64_t v44 = [v64 copy];
    end = v33->_end;
    v33->_end = (NSDate *)v44;

    objc_storeStrong((id *)&v33->_endTimeZone, a12);
    v33->_isAllDay = a13;
    uint64_t v46 = [v31 copy];
    creationDate = v33->_creationDate;
    v33->_creationDate = (NSDate *)v46;

    uint64_t v48 = [v27 copy];
    lastModifiedDate = v33->_lastModifiedDate;
    v33->_lastModifiedDate = (NSDate *)v48;

    uint64_t v50 = [v28 sortedArrayWithOptions:16 usingComparator:&__block_literal_global_9930];
    locations = v33->_locations;
    v33->_locations = (NSArray *)v50;

    objc_storeStrong((id *)&v33->_tags, a17);
    uint64_t v52 = [v30 copy];
    URL = v33->_URL;
    v33->_URL = (NSURL *)v52;

    objc_storeStrong((id *)&v33->_naturalLanguageEventTypeIdentifier, a19);
    v33->_naturalLanguageEventAttributes = a20;
    objc_storeStrong((id *)&v33->_schemaOrg, a21);
    attributeSetForEvent = v33->_attributeSetForEvent;
    v33->_attributeSetForEvent = 0;
  }
  return v33;
}

+ (SGEvent)eventWithRecordId:(id)a3 origin:(id)a4 uniqueKey:(id)a5 opaqueKey:(id)a6 title:(id)a7 notes:(id)a8 start:(id)a9 startTimeZone:(id)a10 end:(id)a11 endTimeZone:(id)a12 isAllDay:(BOOL)a13 creationDate:(id)a14 lastModifiedDate:(id)a15 locations:(id)a16 tags:(id)a17 URL:(id)a18
{
  id v36 = a18;
  id v34 = a17;
  id v31 = a16;
  id v28 = a15;
  id v25 = a14;
  id v27 = a12;
  id v41 = a11;
  id v40 = a10;
  id v39 = a9;
  id v26 = a8;
  id v30 = a7;
  id v33 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  LOBYTE(v24) = a13;
  uint64_t v22 = [[SGEvent alloc] initWithRecordId:v21 origin:v20 uniqueKey:v19 opaqueKey:v33 title:v30 notes:v26 start:v39 startTimeZone:v40 end:v41 endTimeZone:v27 isAllDay:v24 creationDate:v25 lastModifiedDate:v28 locations:v31 tags:v34 URL:v36];

  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end