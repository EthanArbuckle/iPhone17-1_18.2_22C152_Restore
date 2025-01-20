@interface CoreDAVErrorItem
+ (id)copyParseRules;
- (CoreDAVErrorItem)init;
- (CoreDAVItemWithNoChildren)ctagOkay;
- (CoreDAVItemWithNoChildren)guardianRestricted;
- (CoreDAVItemWithNoChildren)imageError;
- (CoreDAVItemWithNoChildren)invalidImageType;
- (CoreDAVItemWithNoChildren)maxAttendees;
- (CoreDAVItemWithNoChildren)maxImageSize;
- (CoreDAVItemWithNoChildren)maxResourceSize;
- (CoreDAVItemWithNoChildren)maxResources;
- (CoreDAVItemWithNoChildren)noUIDConflict;
- (CoreDAVItemWithNoChildren)numberOfMatchesWithinLimits;
- (CoreDAVItemWithNoChildren)quotaExceeded;
- (CoreDAVItemWithNoChildren)uid;
- (CoreDAVItemWithNoChildren)validAddressData;
- (CoreDAVItemWithNoChildren)validSplit;
- (CoreDAVItemWithNoChildren)validSyncToken;
- (CoreDAVItemWithNoChildren)validTimezone;
- (CoreDAVLeafItem)status;
- (id)description;
- (void)setCtagOkay:(id)a3;
- (void)setGuardianRestricted:(id)a3;
- (void)setImageError:(id)a3;
- (void)setInvalidImageType:(id)a3;
- (void)setMaxAttendees:(id)a3;
- (void)setMaxImageSize:(id)a3;
- (void)setMaxResourceSize:(id)a3;
- (void)setMaxResources:(id)a3;
- (void)setNoUIDConflict:(id)a3;
- (void)setNumberOfMatchesWithinLimits:(id)a3;
- (void)setQuotaExceeded:(id)a3;
- (void)setStatus:(id)a3;
- (void)setUid:(id)a3;
- (void)setValidAddressData:(id)a3;
- (void)setValidSplit:(id)a3;
- (void)setValidSyncToken:(id)a3;
- (void)setValidTimezone:(id)a3;
@end

@implementation CoreDAVErrorItem

- (CoreDAVErrorItem)init
{
  return [(CoreDAVItem *)self initWithNameSpace:@"DAV:" andName:@"error"];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v44.receiver = self;
  v44.super_class = (Class)CoreDAVErrorItem;
  v4 = [(CoreDAVItem *)&v44 description];
  [v3 appendFormat:@"[%@]", v4];

  v5 = [(CoreDAVErrorItem *)self status];

  if (v5)
  {
    v6 = [(CoreDAVErrorItem *)self status];
    v7 = [v6 payloadAsString];
    [v3 appendFormat:@"\n  Status: [%@]", v7];
  }
  v8 = [(CoreDAVErrorItem *)self numberOfMatchesWithinLimits];

  if (v8)
  {
    v9 = [(CoreDAVErrorItem *)self numberOfMatchesWithinLimits];
    [v3 appendFormat:@"\n  Number of matches within limits: [%@]", v9];
  }
  v10 = [(CoreDAVErrorItem *)self validSyncToken];

  if (v10)
  {
    v11 = [(CoreDAVErrorItem *)self validSyncToken];
    [v3 appendFormat:@"\n  Valid sync token: [%@]", v11];
  }
  v12 = [(CoreDAVErrorItem *)self noUIDConflict];

  if (v12)
  {
    v13 = [(CoreDAVErrorItem *)self noUIDConflict];
    [v3 appendFormat:@"\n  No UID conflict: [%@]", v13];
  }
  v14 = [(CoreDAVErrorItem *)self validAddressData];

  if (v14)
  {
    v15 = [(CoreDAVErrorItem *)self validAddressData];
    [v3 appendFormat:@"\n  Valid Address Data: [%@]", v15];
  }
  v16 = [(CoreDAVErrorItem *)self maxResourceSize];

  if (v16)
  {
    v17 = [(CoreDAVErrorItem *)self maxResourceSize];
    [v3 appendFormat:@"\n  Max resource size: [%@]", v17];
  }
  v18 = [(CoreDAVErrorItem *)self ctagOkay];

  if (v18)
  {
    v19 = [(CoreDAVErrorItem *)self ctagOkay];
    [v3 appendFormat:@"\n  ctag okay: [%@]", v19];
  }
  v20 = [(CoreDAVErrorItem *)self uid];

  if (v20)
  {
    v21 = [(CoreDAVErrorItem *)self uid];
    v22 = [v21 payloadAsString];
    [v3 appendFormat:@"\n  uid: [%@]", v22];
  }
  v23 = [(CoreDAVErrorItem *)self maxImageSize];

  if (v23)
  {
    v24 = [(CoreDAVErrorItem *)self maxImageSize];
    v25 = [v24 payloadAsString];
    [v3 appendFormat:@"\n  Max Image Size: [%@]", v25];
  }
  v26 = [(CoreDAVErrorItem *)self invalidImageType];

  if (v26)
  {
    v27 = [(CoreDAVErrorItem *)self invalidImageType];
    v28 = [v27 payloadAsString];
    [v3 appendFormat:@"\n  Invalid Image Type: [%@]", v28];
  }
  v29 = [(CoreDAVErrorItem *)self imageError];

  if (v29)
  {
    v30 = [(CoreDAVErrorItem *)self imageError];
    v31 = [v30 payloadAsString];
    [v3 appendFormat:@"\n  Image Error: [%@]", v31];
  }
  v32 = [(CoreDAVErrorItem *)self maxAttendees];

  if (v32)
  {
    v33 = [(CoreDAVErrorItem *)self maxAttendees];
    v34 = [v33 payloadAsString];
    [v3 appendFormat:@"\n  Max Attendees Per Instance: [%@]", v34];
  }
  v35 = [(CoreDAVErrorItem *)self quotaExceeded];

  if (v35)
  {
    v36 = [(CoreDAVErrorItem *)self quotaExceeded];
    v37 = [v36 payloadAsString];
    [v3 appendFormat:@"\n  Quota Exceeded: [%@]", v37];
  }
  v38 = [(CoreDAVErrorItem *)self maxResources];

  if (v38)
  {
    v39 = [(CoreDAVErrorItem *)self maxResources];
    v40 = [v39 payloadAsString];
    [v3 appendFormat:@"\n  Max Resources Exceeded: [%@]", v40];
  }
  v41 = [(CoreDAVErrorItem *)self guardianRestricted];

  if (v41)
  {
    v42 = [(CoreDAVErrorItem *)self guardianRestricted];
    [v3 appendFormat:@"\n  Container is guardian restricted: [%@]", v42];
  }
  return v3;
}

+ (id)copyParseRules
{
  id v3 = +[CoreDAVItem parseRuleCache];
  v4 = NSStringFromClass((Class)a1);
  v5 = [v3 objectForKey:v4];

  if (!v5)
  {
    id v22 = objc_alloc(NSDictionary);
    v45 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"DAV:" elementName:@"number-of-matches-within-limits" objectClass:objc_opt_class() setterMethod:sel_setNumberOfMatchesWithinLimits_];
    objc_super v44 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"number-of-matches-within-limits"];
    v43 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"DAV:" elementName:@"valid-sync-token" objectClass:objc_opt_class() setterMethod:sel_setValidSyncToken_];
    v42 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"valid-sync-token"];
    v41 = +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, @"urn:ietf:params:xml:ns:carddav", @"no-uid-conflict", objc_opt_class());
    v40 = [NSString stringWithFormat:@"%@:%@", @"urn:ietf:params:xml:ns:carddav", @"no-uid-conflict"];
    v39 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"urn:ietf:params:xml:ns:carddav" elementName:@"valid-address-data" objectClass:objc_opt_class() setterMethod:sel_setValidAddressData_];
    v38 = [NSString stringWithFormat:@"%@:%@", @"urn:ietf:params:xml:ns:carddav", @"valid-address-data"];
    v37 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"urn:ietf:params:xml:ns:carddav" elementName:@"max-resource-size" objectClass:objc_opt_class() setterMethod:sel_setMaxResourceSize_];
    v36 = [NSString stringWithFormat:@"%@:%@", @"urn:ietf:params:xml:ns:carddav", @"max-resource-size"];
    v35 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"http://calendarserver.org/ns/" elementName:@"uid" objectClass:objc_opt_class() setterMethod:sel_setUid_];
    v34 = [NSString stringWithFormat:@"%@:%@", @"http://calendarserver.org/ns/", @"uid"];
    v33 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"http://me.com/_namespace/" elementName:@"ctag-ok" objectClass:objc_opt_class() setterMethod:sel_setCtagOkay_];
    v32 = [NSString stringWithFormat:@"%@:%@", @"http://me.com/_namespace/", @"ctag-ok"];
    v31 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"http://me.com/_namespace/" elementName:@"max-image-size" objectClass:objc_opt_class() setterMethod:sel_setMaxImageSize_];
    v30 = [NSString stringWithFormat:@"%@:%@", @"http://me.com/_namespace/", @"max-image-size"];
    v29 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"http://me.com/_namespace/" elementName:@"invalid-image-type" objectClass:objc_opt_class() setterMethod:sel_setInvalidImageType_];
    v28 = [NSString stringWithFormat:@"%@:%@", @"http://me.com/_namespace/", @"invalid-image-type"];
    v27 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"http://me.com/_namespace/" elementName:@"image-error" objectClass:objc_opt_class() setterMethod:sel_setImageError_];
    v26 = [NSString stringWithFormat:@"%@:%@", @"http://me.com/_namespace/", @"image-error"];
    v25 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"urn:ietf:params:xml:ns:caldav" elementName:@"max-attendees-per-instance" objectClass:objc_opt_class() setterMethod:sel_setMaxAttendees_];
    v24 = [NSString stringWithFormat:@"%@:%@", @"urn:ietf:params:xml:ns:caldav", @"max-attendees-per-instance"];
    v20 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"DAV:" elementName:@"quota-not-exceeded" objectClass:objc_opt_class() setterMethod:sel_setQuotaExceeded_];
    v19 = [NSString stringWithFormat:@"%@:%@", @"DAV:", @"quota-not-exceeded"];
    v18 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"http://calendarserver.org/ns/" elementName:@"max-resources" objectClass:objc_opt_class() setterMethod:sel_setMaxResources_];
    v17 = [NSString stringWithFormat:@"%@:%@", @"http://calendarserver.org/ns/", @"max-resources"];
    v16 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"urn:ietf:params:xml:ns:caldav" elementName:@"no-uid-conflict" objectClass:objc_opt_class() setterMethod:sel_setNoUIDConflict_];
    v21 = [NSString stringWithFormat:@"%@:%@", @"urn:ietf:params:xml:ns:caldav", @"no-uid-conflict"];
    v15 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"urn:ietf:params:xml:ns:caldav" elementName:@"valid-timezone" objectClass:objc_opt_class() setterMethod:sel_setValidTimezone_];
    v23 = [NSString stringWithFormat:@"%@:%@", @"urn:ietf:params:xml:ns:caldav", @"valid-timezone"];
    v14 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"http://calendarserver.org/ns/" elementName:@"valid-split" objectClass:objc_opt_class() setterMethod:sel_setValidSplit_];
    v13 = [NSString stringWithFormat:@"%@:%@", @"http://calendarserver.org/ns/", @"valid-split"];
    v12 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"http://calendarserver.org/ns/" elementName:@"invalid-split" objectClass:objc_opt_class() setterMethod:sel_setValidSplit_];
    v11 = [NSString stringWithFormat:@"%@:%@", @"http://calendarserver.org/ns/", @"invalid-split"];
    v6 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"http://me.com/_namespace/" elementName:@"guardian-restricted" objectClass:objc_opt_class() setterMethod:sel_setGuardianRestricted_];
    v7 = [NSString stringWithFormat:@"%@:%@", @"http://me.com/_namespace/", @"guardian-restricted"];
    v5 = objc_msgSend(v22, "initWithObjectsAndKeys:", v45, v44, v43, v42, v41, v40, v39, v38, v37, v36, v35, v34, v33, v32, v31, v30, v29,
                   v28,
                   v27,
                   v26,
                   v25,
                   v24,
                   v20,
                   v19,
                   v18,
                   v17,
                   v16,
                   v21,
                   v15,
                   v23,
                   v14,
                   v13,
                   v12,
                   v11,
                   v6,
                   v7,
                   0);

    v8 = +[CoreDAVItem parseRuleCache];
    v9 = NSStringFromClass((Class)a1);
    [v8 setObject:v5 forKey:v9];
  }
  return v5;
}

- (CoreDAVItemWithNoChildren)numberOfMatchesWithinLimits
{
  return self->_numberOfMatchesWithinLimits;
}

- (void)setNumberOfMatchesWithinLimits:(id)a3
{
}

- (CoreDAVItemWithNoChildren)validSyncToken
{
  return self->_validSyncToken;
}

- (void)setValidSyncToken:(id)a3
{
}

- (CoreDAVItemWithNoChildren)noUIDConflict
{
  return self->_noUIDConflict;
}

- (void)setNoUIDConflict:(id)a3
{
}

- (CoreDAVItemWithNoChildren)validAddressData
{
  return self->_validAddressData;
}

- (void)setValidAddressData:(id)a3
{
}

- (CoreDAVItemWithNoChildren)maxResourceSize
{
  return self->_maxResourceSize;
}

- (void)setMaxResourceSize:(id)a3
{
}

- (CoreDAVItemWithNoChildren)uid
{
  return self->_uid;
}

- (void)setUid:(id)a3
{
}

- (CoreDAVItemWithNoChildren)ctagOkay
{
  return self->_ctagOkay;
}

- (void)setCtagOkay:(id)a3
{
}

- (CoreDAVItemWithNoChildren)maxImageSize
{
  return self->_maxImageSize;
}

- (void)setMaxImageSize:(id)a3
{
}

- (CoreDAVItemWithNoChildren)invalidImageType
{
  return self->_invalidImageType;
}

- (void)setInvalidImageType:(id)a3
{
}

- (CoreDAVItemWithNoChildren)imageError
{
  return self->_imageError;
}

- (void)setImageError:(id)a3
{
}

- (CoreDAVItemWithNoChildren)maxAttendees
{
  return self->_maxAttendees;
}

- (void)setMaxAttendees:(id)a3
{
}

- (CoreDAVItemWithNoChildren)quotaExceeded
{
  return self->_quotaExceeded;
}

- (void)setQuotaExceeded:(id)a3
{
}

- (CoreDAVItemWithNoChildren)maxResources
{
  return self->_maxResources;
}

- (void)setMaxResources:(id)a3
{
}

- (CoreDAVItemWithNoChildren)validTimezone
{
  return self->_validTimezone;
}

- (void)setValidTimezone:(id)a3
{
}

- (CoreDAVItemWithNoChildren)validSplit
{
  return self->_validSplit;
}

- (void)setValidSplit:(id)a3
{
}

- (CoreDAVItemWithNoChildren)guardianRestricted
{
  return self->_guardianRestricted;
}

- (void)setGuardianRestricted:(id)a3
{
}

- (CoreDAVLeafItem)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_validSplit, 0);
  objc_storeStrong((id *)&self->_validTimezone, 0);
  objc_storeStrong((id *)&self->_maxResources, 0);
  objc_storeStrong((id *)&self->_quotaExceeded, 0);
  objc_storeStrong((id *)&self->_maxAttendees, 0);
  objc_storeStrong((id *)&self->_guardianRestricted, 0);
  objc_storeStrong((id *)&self->_imageError, 0);
  objc_storeStrong((id *)&self->_invalidImageType, 0);
  objc_storeStrong((id *)&self->_maxImageSize, 0);
  objc_storeStrong((id *)&self->_ctagOkay, 0);
  objc_storeStrong((id *)&self->_uid, 0);
  objc_storeStrong((id *)&self->_maxResourceSize, 0);
  objc_storeStrong((id *)&self->_validAddressData, 0);
  objc_storeStrong((id *)&self->_noUIDConflict, 0);
  objc_storeStrong((id *)&self->_validSyncToken, 0);
  objc_storeStrong((id *)&self->_numberOfMatchesWithinLimits, 0);
}

@end