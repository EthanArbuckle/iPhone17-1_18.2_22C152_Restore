@interface IMHandle
+ (BOOL)notificationsEnabled;
+ (BOOL)supportsSecureCoding;
+ (id)bestIMHandleInArray:(id)a3;
+ (id)cnPhoneticKeys;
+ (id)filterIMHandlesForAccountSiblings:(id)a3 onAccount:(id)a4;
+ (id)filterIMHandlesForBestAccountSiblings:(id)a3;
+ (id)handlesForCNContact:(id)a3;
+ (id)nameOfStatus:(unint64_t)a3;
+ (void)_loadStatusNames;
+ (void)bestHandlesForContacts:(id)a3 completion:(id)a4;
+ (void)bestHandlesForContacts:(id)a3 useExtendedAsyncLookup:(BOOL)a4 completion:(id)a5;
+ (void)handlesForContacts:(id)a3 useBestHandle:(BOOL)a4 useExtendedAsyncLookup:(BOOL)a5 completion:(id)a6;
+ (void)setNotificationsEnabled:(BOOL)a3;
+ (void)validHandlesForContacts:(id)a3 completion:(id)a4;
+ (void)validHandlesForContacts:(id)a3 useExtendedAsyncLookup:(BOOL)a4 completion:(id)a5;
- (BOOL)_allowedByScreenTime;
- (BOOL)_hasABName;
- (BOOL)_hasServiceNameProperties;
- (BOOL)_isChatSiblingOf:(id)a3;
- (BOOL)_isMyIDInList:(id)a3;
- (BOOL)_setCapabilities:(unint64_t)a3;
- (BOOL)areCNContactPropertiesRecent;
- (BOOL)hasAudio;
- (BOOL)hasCapability:(unint64_t)a3;
- (BOOL)hasCheckedForSuggestions;
- (BOOL)hasConferencing;
- (BOOL)hasMultiwayAudio;
- (BOOL)hasMultiwayVideo;
- (BOOL)hasName;
- (BOOL)hasOtherSiblings;
- (BOOL)hasResource;
- (BOOL)hasServer;
- (BOOL)hasSuggestedName;
- (BOOL)hasVideo;
- (BOOL)isAccountSiblingOf:(id)a3;
- (BOOL)isAnonymous;
- (BOOL)isApple;
- (BOOL)isBetterThanIMHandle:(id)a3;
- (BOOL)isBetterThanIMHandle:(id)a3 nonPhoneNumbersPreferred:(BOOL)a4;
- (BOOL)isBlocked;
- (BOOL)isBot;
- (BOOL)isBuddy;
- (BOOL)isBusiness;
- (BOOL)isChatBot;
- (BOOL)isConferenceAvailable;
- (BOOL)isContact;
- (BOOL)isContactButNotMe;
- (BOOL)isKTVerified;
- (BOOL)isLoginIMHandle;
- (BOOL)isLoginIMHandleForAnyAccount;
- (BOOL)isMako;
- (BOOL)isMapKitBusiness;
- (BOOL)isMobile;
- (BOOL)isSiblingOf:(id)a3;
- (BOOL)isStewie;
- (BOOL)isStewieEmergency;
- (BOOL)isStewieEmergencyServices;
- (BOOL)isStewieRoadside;
- (BOOL)isStewieTranscriptSharingHandle;
- (BOOL)isSystemUser;
- (BOOL)isVisiblyBlocked;
- (BOOL)matchesIMHandle:(id)a3;
- (BOOL)matchesLoginHandleForAnyAccount;
- (BOOL)resetCNContact;
- (BOOL)shouldQueueNotifications;
- (BOOL)watchingIMHandle;
- (CNContact)cnContact;
- (DNDContactHandle)dndContactHandle;
- (IMAccount)account;
- (IMBrand)brand;
- (IMBrandManager)brandManager;
- (IMHandle)imHandleWithoutResource;
- (IMHandle)init;
- (IMHandle)initWithAccount:(id)a3 ID:(id)a4 alreadyCanonical:(BOOL)a5;
- (IMHandle)initWithCoder:(id)a3;
- (IMServiceImpl)service;
- (NSArray)accountSiblingsArray;
- (NSArray)emails;
- (NSArray)existingAccountSiblingsArray;
- (NSArray)groupsArray;
- (NSArray)siblingsArray;
- (NSAttributedString)richStatusMessage;
- (NSData)brandSquareLogoImageData;
- (NSData)brandWideLogoImageData;
- (NSData)pictureData;
- (NSDate)availabilityStatusPublishedDate;
- (NSDate)feedUpdatedDate;
- (NSDictionary)extraProperties;
- (NSDictionary)otherServiceIDs;
- (NSSet)groups;
- (NSSet)siblings;
- (NSString)ID;
- (NSString)IDWithoutResource;
- (NSString)_displayNameWithAbbreviation;
- (NSString)accountTypeName;
- (NSString)cachedDisplayNameWithAbbreviation;
- (NSString)cachedName;
- (NSString)countryCode;
- (NSString)displayID;
- (NSString)email;
- (NSString)firstName;
- (NSString)fullName;
- (NSString)guid;
- (NSString)idleString;
- (NSString)lastName;
- (NSString)mobileDeviceName;
- (NSString)name;
- (NSString)nameAndEmail;
- (NSString)nameAndID;
- (NSString)nameOfStatus;
- (NSString)nickname;
- (NSString)normalizedID;
- (NSString)offlineString;
- (NSString)originalID;
- (NSString)personCentricID;
- (NSString)phoneticFirstName;
- (NSString)phoneticFullName;
- (NSString)phoneticLastName;
- (NSString)previousStatusMessage;
- (NSString)resource;
- (NSString)server;
- (NSString)statusMessage;
- (NSString)suggestedName;
- (NSString)uniqueName;
- (__CFPhoneNumber)phoneNumberRef;
- (double)idleTime;
- (double)timeSinceStatusChanged;
- (double)timeSinceWentOffline;
- (id)_IDWithTrimmedServer;
- (id)_bestChatSibling;
- (id)_chatSiblings;
- (id)_contactID;
- (id)_displayNameWithContact:(id)a3;
- (id)_displayNameWithNicknameIfAvailable;
- (id)_formattedPhoneNumber;
- (id)_handleInfo;
- (id)_nameForComparisonPreferFirst:(BOOL)a3;
- (id)_unformattedPhoneNumber;
- (id)beginObservingAvailability;
- (id)bestAccountSibling;
- (id)bestIMHandleForAccount:(id)a3;
- (id)bestIMHandleForAccount:(id)a3 onService:(id)a4 inGroup:(id)a5 otherThan:(id)a6;
- (id)bestIMHandleForService:(id)a3;
- (id)bestSibling;
- (id)chatSiblingsArray;
- (id)cnContactWithKeys:(id)a3;
- (id)dependentIMHandles;
- (id)description;
- (id)displayNameForChat:(id)a3;
- (id)existingChatSiblingsArray;
- (id)existingIMHandleWithoutResource;
- (id)findMyHandle;
- (id)findMySiblingHandles;
- (id)fmfHandle;
- (id)imHandleForOtherAccount:(id)a3;
- (id)immediateNameWithNeedsSuggestedNameFetch:(BOOL *)a3 useSuggestedName:(BOOL)a4;
- (id)publicAPIPropertiesDictionary;
- (int64_t)IDStatus;
- (int64_t)availability;
- (int64_t)compareAccountNames:(id)a3;
- (int64_t)compareFirstNames:(id)a3;
- (int64_t)compareIDs:(id)a3;
- (int64_t)compareLastNames:(id)a3;
- (int64_t)compareNormalizedIDs:(id)a3;
- (int64_t)compareStatus:(id)a3;
- (int64_t)offGridMode;
- (int64_t)priority;
- (unint64_t)capabilities;
- (unint64_t)previousStatus;
- (unint64_t)status;
- (unsigned)authRequestStatus;
- (unsigned)sortOrderInGroup:(id)a3;
- (void)_clearCNContactProperties;
- (void)_createPhoneNumberRefIfNeeded;
- (void)_fetchBrandInfoForBrandWithURI:(id)a3 forType:(unint64_t)a4;
- (void)_fetchBrandInfoForBusiness:(unint64_t)a3;
- (void)_fetchBrandInfoForRoadside;
- (void)_fetchedBrand:(id)a3 withBrandURI:(id)a4;
- (void)_filterStatusMessage;
- (void)_imPersonPictureChanged:(id)a3;
- (void)_postNotification:(id)a3;
- (void)_postNotificationName:(id)a3 userInfo:(id)a4;
- (void)_postOnScreenChangedNotificationForBrandProperty:(id)a3;
- (void)_setBaseFirstName:(id)a3 lastName:(id)a4 fullName:(id)a5;
- (void)_setCountryCode:(id)a3 updateSiblings:(BOOL)a4;
- (void)_setExtraProperties:(id)a3;
- (void)_setIDStatus:(int64_t)a3;
- (void)_setOriginalID:(id)a3;
- (void)_setOriginalID:(id)a3 countryCode:(id)a4 updateSiblings:(BOOL)a5;
- (void)_setOriginalID:(id)a3 updateSiblings:(BOOL)a4;
- (void)_stopRetainingAccount:(id)a3;
- (void)_updateOriginalID:(id)a3;
- (void)_updateStatusBasedOnAuthRequestStatus;
- (void)associatedBusinessIDChanged;
- (void)autoInviteToViewAvailabilityIfNeededFromHandleID:(id)a3;
- (void)autoInviteToViewOffGridModeIfNeededFromHandleID:(id)a3;
- (void)beginNotificationQueue;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)fetchBrandInfoIfNecessary;
- (void)isInvitedToViewMyFocusStatusFromHandleID:(id)a3 completion:(id)a4;
- (void)postNotificationName:(id)a3;
- (void)propertiesChanged:(id)a3;
- (void)releaseNotificationQueue;
- (void)requestValueOfProperty:(id)a3;
- (void)resetCNContactProperties;
- (void)scheduleSuggestedNameFetchIfNecessary;
- (void)setAnonymous:(BOOL)a3;
- (void)setAuthRequestStatus:(unsigned int)a3;
- (void)setBlocked:(BOOL)a3;
- (void)setBrand:(id)a3;
- (void)setBrandManager:(id)a3;
- (void)setBrandSquareLogoImageData:(id)a3;
- (void)setBrandWideLogoImageData:(id)a3;
- (void)setCachedDisplayNameWithAbbreviation:(id)a3;
- (void)setCachedName:(id)a3;
- (void)setCapabilities:(unint64_t)a3;
- (void)setCnContact:(id)a3;
- (void)setCustomPictureData:(id)a3;
- (void)setCustomPictureData:(id)a3 key:(id)a4;
- (void)setDndContactHandle:(id)a3;
- (void)setEmail:(id)a3;
- (void)setEmail:(id)a3 andUpdateABPerson:(BOOL)a4;
- (void)setEmails:(id)a3;
- (void)setFeedUpdatedDate:(id)a3;
- (void)setFirstName:(id)a3 lastName:(id)a4;
- (void)setFirstName:(id)a3 lastName:(id)a4 fullName:(id)a5 andUpdateABPerson:(BOOL)a6;
- (void)setHasCheckedForSuggestions:(BOOL)a3;
- (void)setHasSuggestedName:(BOOL)a3;
- (void)setHasTemporaryWatch:(BOOL)a3;
- (void)setIDStatus:(int64_t)a3;
- (void)setIdleSince:(id)a3;
- (void)setImageData:(id)a3;
- (void)setIsBot:(BOOL)a3;
- (void)setIsMobile:(BOOL)a3;
- (void)setLocalNickname:(id)a3;
- (void)setOtherServiceIDs:(id)a3;
- (void)setPersonCentricID:(id)a3;
- (void)setPersonStatus:(unint64_t)a3;
- (void)setPriority:(int64_t)a3;
- (void)setStatus:(unint64_t)a3 message:(id)a4 richMessage:(id)a5;
- (void)setSuggestedName:(id)a3;
- (void)setValue:(id)a3 ofExtraProperty:(id)a4;
- (void)statusChanged:(unint64_t)a3;
- (void)statusChanged:(unint64_t)a3 message:(id)a4;
- (void)statusMessageChanged:(id)a3;
- (void)updateCNContact:(id)a3;
@end

@implementation IMHandle

- (BOOL)isStewieEmergency
{
  v4 = objc_msgSend_ID(self, a2, v2, v3);
  char v5 = IMIsStringStewieEmergency();

  return v5;
}

- (NSString)_displayNameWithAbbreviation
{
  v8 = objc_msgSend_cnContact(self, a2, v2, v3);
  if (v8)
  {
    if (objc_msgSend_shouldShowNickNames(MEMORY[0x1E4F6E6D8], v5, v6, v7))
    {
      v12 = objc_msgSend_nickname(self, v9, v10, v11);
      uint64_t v16 = objc_msgSend_length(v12, v13, v14, v15);
    }
    else
    {
      v12 = 0;
      uint64_t v16 = objc_msgSend_length(0, v9, v10, v11);
    }
    if (v16)
    {
      id v21 = v12;
    }
    else
    {
      p_cachedDisplayNameWithAbbreviation = (id *)&self->_cachedDisplayNameWithAbbreviation;
      cachedDisplayNameWithAbbreviation = self->_cachedDisplayNameWithAbbreviation;
      if (!cachedDisplayNameWithAbbreviation)
      {
        if (objc_msgSend_shouldShowAbbreviatedNames(MEMORY[0x1E4F6E6D8], v17, v18, v19))
        {
          v27 = objc_msgSend_abbreviatedNameForCNContact_(MEMORY[0x1E4F6E6D8], v24, (uint64_t)v8, v26);
          uint64_t v31 = objc_msgSend_length(v27, v28, v29, v30);
        }
        else
        {
          v27 = 0;
          uint64_t v31 = objc_msgSend_length(0, v24, v25, v26);
        }
        if (v31) {
          objc_storeStrong((id *)&self->_cachedDisplayNameWithAbbreviation, v27);
        }

        cachedDisplayNameWithAbbreviation = (NSString *)*p_cachedDisplayNameWithAbbreviation;
      }
      if (objc_msgSend_length(cachedDisplayNameWithAbbreviation, v17, v18, v19))
      {
        id v21 = *p_cachedDisplayNameWithAbbreviation;
      }
      else
      {
        objc_msgSend_name(self, v32, v33, v34);
        id v21 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    v20 = v21;
  }
  else
  {
    v20 = objc_msgSend_name(self, v5, v6, v7);
  }

  return (NSString *)v20;
}

- (NSString)nickname
{
  v8 = objc_msgSend_cnContact(self, a2, v2, v3);
  if (v8)
  {
    v9 = objc_msgSend_nickNameForCNContact_(MEMORY[0x1E4F6E6D8], v5, (uint64_t)v8, v7);
    uint64_t v13 = objc_msgSend_length(v9, v10, v11, v12);
  }
  else
  {
    v9 = 0;
    uint64_t v13 = objc_msgSend_length(0, v5, v6, v7);
  }
  if (v13)
  {
    v17 = v9;
LABEL_8:
    id v21 = v17;
    goto LABEL_9;
  }
  if (objc_msgSend__hasServiceNameProperties(self, v14, v15, v16))
  {
    v17 = self->_nickname;
    goto LABEL_8;
  }
  if (objc_msgSend_isLoginIMHandle(self, v18, v19, v20))
  {
    uint64_t v26 = objc_msgSend_me(IMMe, v23, v24, v25);
    id v21 = objc_msgSend_nickname(v26, v27, v28, v29);
  }
  else
  {
    id v21 = 0;
  }
LABEL_9:

  return (NSString *)v21;
}

- (void)scheduleSuggestedNameFetchIfNecessary
{
  if ((objc_msgSend_hasCheckedForSuggestions(self, a2, v2, v3) & 1) == 0)
  {
    v8 = objc_msgSend_sharedInstance(IMSuggestionsService, v5, v6, v7);
    objc_msgSend_scheduleFetchIfNecessaryForHandle_(v8, v9, (uint64_t)self, v10);

    MEMORY[0x1F4181798](self, sel_setHasCheckedForSuggestions_, 1, v11);
  }
}

- (BOOL)hasCheckedForSuggestions
{
  return self->_hasCheckedForSuggestions;
}

- (NSString)displayID
{
  displayID = self->_displayID;
  if (displayID)
  {
    char v5 = displayID;
    goto LABEL_9;
  }
  uint64_t v7 = objc_msgSend__formattedPhoneNumber(self, a2, v2, v3);
  if (objc_msgSend_length(v7, v8, v9, v10))
  {
    uint64_t v14 = v7;
  }
  else
  {
    int isBusiness = objc_msgSend_isBusiness(self, v11, v12, v13);
    id = self->_id;
    if (!isBusiness)
    {
      if (objc_msgSend_length(id, v15, v16, v17))
      {
        uint64_t v24 = objc_msgSend_im_stripCategoryLabel(self->_id, v21, v22, v23);
        MEMORY[0x1A62639E0]();
      }
      else
      {
        uint64_t v24 = MEMORY[0x1A62639E0](self->_uncanonicalID);
        objc_msgSend_im_stripCategoryLabel(v24, v25, v26, v27);
      uint64_t v28 = };

      if (objc_msgSend__appearsToBePhoneNumber(v28, v29, v30, v31))
      {
        IMFormattedDisplayStringForNumber();
        v32 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v32 = v28;
      }
      char v5 = v32;

      goto LABEL_8;
    }
    uint64_t v14 = id;
  }
  char v5 = v14;
LABEL_8:

LABEL_9:

  return v5;
}

- (id)_formattedPhoneNumber
{
  formattedNumber = self->_formattedNumber;
  if (formattedNumber)
  {
    char v5 = formattedNumber;
    goto LABEL_20;
  }
  uint64_t v7 = objc_msgSend_length(self->_uncanonicalID, a2, v2, v3);
  uint64_t v8 = 24;
  if (!v7) {
    uint64_t v8 = 16;
  }
  uint64_t v9 = MEMORY[0x1A62639E0](*(Class *)((char *)&self->super.isa + v8));
  uint64_t v13 = v9;
  if (self->_hasCheckedPhoneNumber)
  {
    if (!self->_phoneNumberRef) {
      goto LABEL_18;
    }
  }
  else if (!objc_msgSend__appearsToBePhoneNumber(v9, v10, v11, v12))
  {
LABEL_18:
    char v5 = 0;
    goto LABEL_19;
  }
  if (objc_msgSend__appearsToBePhoneNumber(v13, v10, v11, v12))
  {
    uint64_t v14 = IMFormattedNumberForUnformattedNumber();
    CFStringRef v15 = (const __CFString *)IMCopyStringWithLocalizedNumbers();
    if (v15)
    {
      uint64_t v16 = (__CFString *)v15;
      if (CFStringGetLength(v15) > 0) {
        goto LABEL_15;
      }
      CFRelease(v16);
    }
    uint64_t v16 = v14;
    uint64_t v14 = v16;
  }
  else
  {
    uint64_t v16 = v13;
    uint64_t v14 = 0;
  }
LABEL_15:
  uint64_t v17 = self->_formattedNumber;
  self->_formattedNumber = &v16->isa;

  if (!objc_msgSend_length(v14, v18, v19, v20))
  {

    goto LABEL_18;
  }
  qmemcpy(v31, ", * ", sizeof(v31));
  id v21 = [NSString alloc];
  uint64_t v23 = objc_msgSend_stringWithCharacters_length_(NSString, v22, (uint64_t)&v31[1], 1);
  uint64_t v25 = objc_msgSend_stringWithCharacters_length_(NSString, v24, (uint64_t)v31, 1);
  uint64_t v28 = (NSString *)objc_msgSend_initWithFormat_(v21, v26, @"%@%@%@", v27, v23, v14, v25);
  uint64_t v29 = self->_formattedNumber;
  self->_formattedNumber = v28;

  char v5 = self->_formattedNumber;
LABEL_19:

LABEL_20:

  return v5;
}

- (BOOL)matchesIMHandle:(id)a3
{
  v4 = (IMHandle *)a3;
  uint64_t v8 = v4;
  if (v4 == self)
  {
    BOOL v22 = 1;
  }
  else
  {
    objc_msgSend_account(v4, v5, v6, v7);
    uint64_t v11 = (IMAccount *)objc_claimAutoreleasedReturnValue();
    if (v11 == self->_account)
    {
      BOOL v22 = 0;
    }
    else
    {
      uint64_t v12 = MEMORY[0x1E4F1CBF0];
      uint64_t v13 = objc_msgSend_cnContactWithKeys_(self, v9, MEMORY[0x1E4F1CBF0], v10);
      uint64_t v16 = objc_msgSend_cnContactWithKeys_(v8, v14, v12, v15);
      char isEqualToContact = objc_msgSend__im_isEqualToContact_(v13, v17, (uint64_t)v16, v18);

      if (isEqualToContact)
      {
        BOOL v22 = 1;
      }
      else
      {
        objc_msgSend_imHandleForOtherAccount_(self, v20, (uint64_t)v11, v21);
        uint64_t v26 = (IMHandle *)objc_claimAutoreleasedReturnValue();
        if (v26 == v8)
        {
          BOOL v22 = 1;
        }
        else
        {
          uint64_t v27 = objc_msgSend_account(self, v23, v24, v25);
          objc_msgSend_imHandleForOtherAccount_(v8, v28, (uint64_t)v27, v29);
          uint64_t v30 = (IMHandle *)objc_claimAutoreleasedReturnValue();
          BOOL v22 = v30 == self;
        }
      }
    }
  }
  return v22;
}

- (void)setPersonCentricID:(id)a3
{
}

- (void)_setOriginalID:(id)a3 countryCode:(id)a4 updateSiblings:(BOOL)a5
{
  BOOL v5 = a5;
  id v10 = a3;
  id v9 = a4;
  if (v10 && (IMSharedHelperAreObjectsLogicallySame() & 1) == 0) {
    objc_msgSend__setOriginalID_updateSiblings_(self, v8, (uint64_t)v10, v5);
  }
  objc_msgSend__setCountryCode_updateSiblings_(self, v8, (uint64_t)v9, v5);
}

- (void)_setCountryCode:(id)a3 updateSiblings:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    if ((IMSharedHelperAreObjectsLogicallySame() & 1) == 0)
    {
      id v10 = (NSString *)objc_msgSend_copy(v6, v7, v8, v9);
      countryCode = self->_countryCode;
      self->_countryCode = v10;

      if (v4)
      {
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        uint64_t v15 = objc_msgSend_existingChatSiblingsArray(self, v12, v13, v14, 0);
        uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v23, (uint64_t)v27, 16);
        if (v17)
        {
          uint64_t v19 = v17;
          uint64_t v20 = *(void *)v24;
          do
          {
            uint64_t v21 = 0;
            do
            {
              if (*(void *)v24 != v20) {
                objc_enumerationMutation(v15);
              }
              BOOL v22 = *(IMHandle **)(*((void *)&v23 + 1) + 8 * v21);
              if (v22 != self) {
                objc_msgSend__setCountryCode_updateSiblings_(v22, v18, (uint64_t)v6, 0);
              }
              ++v21;
            }
            while (v19 != v21);
            uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v23, (uint64_t)v27, 16);
          }
          while (v19);
        }
      }
    }
  }
}

- (NSString)guid
{
  return self->_guid;
}

- (BOOL)isBusiness
{
  if (objc_msgSend_isMapKitBusiness(self, a2, v2, v3)) {
    return 1;
  }

  return objc_msgSend_isChatBot(self, v5, v6, v7);
}

- (BOOL)isMapKitBusiness
{
  int isBusiness = self->_isBusiness;
  if (!isBusiness)
  {
    uint64_t v6 = NSNumber;
    uint64_t v7 = objc_msgSend_ID(self, a2, v2, v3);
    uint64_t v8 = MEMORY[0x1A6263990]();
    objc_msgSend_numberWithBool_(v6, v9, v8, v10);
    uint64_t v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = self->_isBusiness;
    self->_int isBusiness = v11;

    int isBusiness = self->_isBusiness;
  }

  return objc_msgSend_BOOLValue(isBusiness, a2, v2, v3);
}

- (IMAccount)account
{
  return self->_account;
}

- (IMHandle)initWithAccount:(id)a3 ID:(id)a4 alreadyCanonical:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  uint64_t v17 = objc_msgSend_init(self, v11, v12, v13);
  if (!v17) {
    goto LABEL_11;
  }
  uint64_t v18 = objc_msgSend_IMCoreSetupTimingCollection(MEMORY[0x1E4F6C3F8], v14, v15, v16);
  objc_msgSend_startTimingForKey_(v18, v19, @"IMCoreSetup: IMHandle init", v20);
  objc_storeStrong((id *)(v17 + 8), a3);
  if (v5)
  {
    uint64_t v24 = objc_msgSend_copy(v10, v21, v22, v23);
    long long v25 = *(void **)(v17 + 16);
    *(void *)(v17 + 16) = v24;
  }
  else
  {
    uint64_t v26 = objc_msgSend_canonicalFormOfID_(v9, v21, (uint64_t)v10, v23);
    uint64_t v27 = *(void **)(v17 + 16);
    *(void *)(v17 + 16) = v26;

    if (objc_msgSend_isEqualToString_(v10, v28, *(void *)(v17 + 16), v29)) {
      goto LABEL_7;
    }
    long long v25 = IMCleanupPhoneNumber();
    uint64_t v36 = objc_msgSend_copy(v25, v33, v34, v35);
    v37 = *(void **)(v17 + 24);
    *(void *)(v17 + 24) = v36;
  }
LABEL_7:
  *(void *)(v17 + 304) = 0x7FFFFFFFFFFFFFFFLL;
  *(void *)(v17 + 288) = objc_msgSend_capabilities(v9, v30, v31, v32);
  if (*(void *)(v17 + 16) && *(void *)(v17 + 8))
  {
    v41 = objc_msgSend_sharedInstance(IMHandleRegistrar, v38, v39, v40);
    objc_msgSend_registerIMHandle_(v41, v42, v17, v43);

    v47 = objc_msgSend_account((void *)v17, v44, v45, v46);
    objc_msgSend_registerIMHandle_(v47, v48, v17, v49);

    objc_msgSend__registerForNotifications((void *)v17, v50, v51, v52);
  }
  objc_msgSend_stopTimingForKey_(v18, v38, @"IMCoreSetup: IMHandle init", v40);
  objc_msgSend_fetchBrandInfoIfNecessary((void *)v17, v53, v54, v55);

LABEL_11:
  return (IMHandle *)v17;
}

- (id)imHandleForOtherAccount:(id)a3
{
  id v7 = a3;
  if (!v7
    || (objc_msgSend_account(self, v4, v5, v6), id v8 = (id)objc_claimAutoreleasedReturnValue(), v8, v8 == v7))
  {
    uint64_t v20 = self;
    goto LABEL_22;
  }
  otherServiceIDs = self->_otherServiceIDs;
  uint64_t v13 = objc_msgSend_internalName(v7, v9, v10, v11);
  uint64_t v16 = objc_msgSend_objectForKey_(otherServiceIDs, v14, (uint64_t)v13, v15);

  if (!v16)
  {
    uint64_t v21 = objc_msgSend_service(self, v17, v18, v19);
    long long v25 = objc_msgSend_service(v7, v22, v23, v24);

    if (v21 == v25)
    {
LABEL_11:
      objc_msgSend_ID(self, v26, v27, v28);
      uint64_t v55 = (IMHandle *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_imHandleWithID_alreadyCanonical_(v7, v56, (uint64_t)v55, 1);
      v57 = (IMHandle *)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
    uint64_t v29 = objc_msgSend_service(self, v26, v27, v28);
    if (objc_msgSend_supportsMessaging(v29, v30, v31, v32))
    {
      uint64_t v36 = objc_msgSend_service(self, v33, v34, v35);
      if (objc_msgSend_supportsCanonicalHandles(v36, v37, v38, v39))
      {
        uint64_t v43 = objc_msgSend_service(v7, v40, v41, v42);
        if (objc_msgSend_supportsMessaging(v43, v44, v45, v46))
        {
          v50 = objc_msgSend_service(v7, v47, v48, v49);
          int v54 = objc_msgSend_supportsCanonicalHandles(v50, v51, v52, v53);

          if (v54) {
            goto LABEL_11;
          }
LABEL_15:
          v58 = objc_msgSend_service(v7, v26, v27, v28);
          objc_msgSend_bestIMHandleForService_(self, v59, (uint64_t)v58, v60);
          uint64_t v55 = (IMHandle *)objc_claimAutoreleasedReturnValue();

          if (v55 == self)
          {
            v57 = self;
          }
          else
          {
            if (!v55)
            {
              uint64_t v20 = 0;
              goto LABEL_20;
            }
            objc_msgSend_imHandleForOtherAccount_(v55, v61, (uint64_t)v7, v62);
            v57 = (IMHandle *)objc_claimAutoreleasedReturnValue();
          }
LABEL_19:
          uint64_t v20 = v57;
LABEL_20:

          goto LABEL_21;
        }
      }
    }

    goto LABEL_15;
  }
  objc_msgSend_imHandleWithID_(v7, v17, (uint64_t)v16, v19);
  uint64_t v20 = (IMHandle *)objc_claimAutoreleasedReturnValue();
LABEL_21:

LABEL_22:

  return v20;
}

- (IMHandle)init
{
  v16.receiver = self;
  v16.super_class = (Class)IMHandle;
  BOOL v4 = [(IMHandle *)&v16 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_copyStringGUIDForObject_(NSString, v2, (uint64_t)v4, v3);
    guid = v4->_guid;
    v4->_guid = (NSString *)v5;

    v4->_isAnonymous = 0;
    *(_WORD *)&v4->_isMobile = 0;
    v4->_status = 0;
    statusMsg = v4->_statusMsg;
    v4->_statusMsg = (NSString *)&stru_1EF8E78C8;

    prevStatusMsg = v4->_prevStatusMsg;
    v4->_prevStatusMsg = (NSString *)&stru_1EF8E78C8;

    id v9 = IMCountryCodeForIncomingTextMessage();
    uint64_t v13 = objc_msgSend_copy(v9, v10, v11, v12);
    countryCode = v4->_countryCode;
    v4->_countryCode = (NSString *)v13;
  }
  return v4;
}

- (void)associatedBusinessIDChanged
{
  if (objc_msgSend_isStewieRoadside(self, a2, v2, v3))
  {
    MEMORY[0x1F4181798](self, sel__fetchBrandInfoForRoadside, v5, v6);
  }
}

- (void)fetchBrandInfoIfNecessary
{
  uint64_t v5 = objc_msgSend_brand(self, a2, v2, v3);

  if (v5) {
    return;
  }
  if (objc_msgSend_isMapKitBusiness(self, v6, v7, v8))
  {
    uint64_t v12 = self;
    uint64_t v13 = 1;
LABEL_5:
    MEMORY[0x1F4181798](v12, sel__fetchBrandInfoForBusiness_, v13, v11);
    return;
  }
  if (!objc_msgSend_isStewieRoadside(self, v9, v10, v11))
  {
    if (!objc_msgSend_isChatBot(self, v14, v15, v16)) {
      return;
    }
    uint64_t v12 = self;
    uint64_t v13 = 2;
    goto LABEL_5;
  }

  MEMORY[0x1F4181798](self, sel__fetchBrandInfoForRoadside, v15, v16);
}

- (BOOL)isStewieRoadside
{
  BOOL v4 = objc_msgSend_ID(self, a2, v2, v3);
  char v5 = IMIsStringStewieRoadside();

  return v5;
}

- (IMBrand)brand
{
  return self->_brand;
}

- (id)displayNameForChat:(id)a3
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v94 = 138412290;
      id v95 = v4;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_DEBUG, "Calculating displayName for chat: %@", (uint8_t *)&v94, 0xCu);
    }
  }
  id v9 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v5, v6, v7);
  int isTranscriptSharingEnabled = objc_msgSend_isTranscriptSharingEnabled(v9, v10, v11, v12);

  if (isTranscriptSharingEnabled && objc_msgSend_isStewieSharingChat(v4, v14, v15, v16))
  {
    uint64_t v17 = objc_msgSend_immediateNameWithNeedsSuggestedNameFetch_useSuggestedName_(self, v14, 0, 0);
    uint64_t v21 = objc_msgSend_controlCharacterSet(MEMORY[0x1E4F28B88], v18, v19, v20);
    uint64_t v24 = objc_msgSend_stringByTrimmingCharactersInSet_(v17, v22, (uint64_t)v21, v23);

    uint64_t v28 = objc_msgSend__unformattedPhoneNumber(self, v25, v26, v27);
    if (objc_msgSend_isEqualToString_(v24, v29, (uint64_t)v28, v30))
    {
      uint64_t v34 = objc_msgSend_stewieSharingSuggestedName(v4, v31, v32, v33);
      BOOL v35 = v34 == 0;

      if (!v35)
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v39 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v43 = objc_msgSend_stewieSharingSuggestedName(v4, v40, v41, v42);
            int v94 = 138412290;
            id v95 = v43;
            _os_log_impl(&dword_1A4AF7000, v39, OS_LOG_TYPE_DEBUG, "Returning transcript sharing suggested name: %@", (uint8_t *)&v94, 0xCu);
          }
        }
        objc_msgSend_stewieSharingSuggestedName(v4, v36, v37, v38);
        id v44 = (id)objc_claimAutoreleasedReturnValue();
LABEL_34:
        v59 = v44;

        goto LABEL_55;
      }
    }
    else
    {
    }
    if (IMOSLoggingEnabled())
    {
      v75 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
      {
        int v94 = 138412290;
        id v95 = v17;
        _os_log_impl(&dword_1A4AF7000, v75, OS_LOG_TYPE_DEBUG, "Found name: %@ for stewie sharing chat", (uint8_t *)&v94, 0xCu);
      }
    }
    id v44 = v17;
    goto LABEL_34;
  }
  if ((objc_msgSend_isBusiness(self, v14, v15, v16) & 1) == 0
    && !objc_msgSend_isStewie(self, v45, v46, v47))
  {
    v63 = objc_msgSend_cnContact(self, v48, v49, v50);
    if (v63)
    {
      if (objc_msgSend_chatStyle(v4, v60, v61, v62) == 45)
      {
        if (IMOSLoggingEnabled())
        {
          v70 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
          {
            v74 = objc_msgSend_name(self, v71, v72, v73);
            int v94 = 138412290;
            id v95 = v74;
            _os_log_impl(&dword_1A4AF7000, v70, OS_LOG_TYPE_DEBUG, "Chat style is instantMessageChatStyle, returning name: %@", (uint8_t *)&v94, 0xCu);
          }
        }
      }
      else
      {
        p_cachedDisplayNameWithAbbreviation = (id *)&self->_cachedDisplayNameWithAbbreviation;
        cachedDisplayNameWithAbbreviation = self->_cachedDisplayNameWithAbbreviation;
        if (!cachedDisplayNameWithAbbreviation)
        {
          if (objc_msgSend_shouldShowAbbreviatedNames(MEMORY[0x1E4F6E6D8], v64, v65, v66))
          {
            v86 = objc_msgSend_abbreviatedNameForCNContact_(MEMORY[0x1E4F6E6D8], v83, (uint64_t)v63, v85);
            uint64_t v90 = objc_msgSend_length(v86, v87, v88, v89);
          }
          else
          {
            v86 = 0;
            uint64_t v90 = objc_msgSend_length(0, v83, v84, v85);
          }
          if (v90)
          {
            if (IMOSLoggingEnabled())
            {
              v91 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
              {
                int v94 = 138412290;
                id v95 = v86;
                _os_log_impl(&dword_1A4AF7000, v91, OS_LOG_TYPE_DEBUG, "Found short name, setting _cachedDisplayNameWithAbbreviation to: %@", (uint8_t *)&v94, 0xCu);
              }
            }
            objc_storeStrong((id *)&self->_cachedDisplayNameWithAbbreviation, v86);
          }

          cachedDisplayNameWithAbbreviation = (NSString *)*p_cachedDisplayNameWithAbbreviation;
        }
        if (objc_msgSend_length(cachedDisplayNameWithAbbreviation, v64, v65, v66))
        {
          id v92 = *p_cachedDisplayNameWithAbbreviation;
LABEL_54:
          v59 = v92;

          goto LABEL_55;
        }
      }
    }
    else if (IMOSLoggingEnabled())
    {
      v76 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
      {
        v80 = objc_msgSend_name(self, v77, v78, v79);
        int v94 = 138412290;
        id v95 = v80;
        _os_log_impl(&dword_1A4AF7000, v76, OS_LOG_TYPE_DEBUG, "No contact found, returning self.name: %@", (uint8_t *)&v94, 0xCu);
      }
    }
    objc_msgSend_name(self, v67, v68, v69);
    id v92 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_54;
  }
  if (IMOSLoggingEnabled())
  {
    int v54 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
    {
      v58 = objc_msgSend_name(self, v55, v56, v57);
      int v94 = 138412290;
      id v95 = v58;
      _os_log_impl(&dword_1A4AF7000, v54, OS_LOG_TYPE_DEBUG, "Found name: %@ for stewie or business chat", (uint8_t *)&v94, 0xCu);
    }
  }
  v59 = objc_msgSend_name(self, v51, v52, v53);
LABEL_55:

  return v59;
}

- (id)cnContactWithKeys:(id)a3
{
  id v4 = a3;
  if ((objc_msgSend_isBusiness(self, v5, v6, v7) & 1) != 0
    || (objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v8, v9, v10),
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        int isTranscriptSharingEnabled = objc_msgSend_isTranscriptSharingEnabled(v12, v13, v14, v15),
        v12,
        isTranscriptSharingEnabled)
    && (objc_msgSend_isStewieTranscriptSharingHandle(self, v17, v18, v19) & 1) != 0)
  {
    uint64_t v11 = 0;
    goto LABEL_12;
  }
  uint64_t v23 = self->_cnContact;
  if (v23)
  {
    uint64_t v24 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E6D8], v20, v21, v22);
    uint64_t v11 = objc_msgSend_completedContact_withKeys_(v24, v25, (uint64_t)v23, (uint64_t)v4);

    if (v11) {
      goto LABEL_9;
    }
  }
  uint64_t v26 = objc_msgSend_im_stripCategoryLabel(self->_id, v20, v21, v22);
  if (!objc_msgSend_length(v26, v27, v28, v29))
  {

    uint64_t v11 = 0;
    goto LABEL_11;
  }
  uint64_t v33 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E6D8], v30, v31, v32);
  uint64_t v11 = objc_msgSend_fetchCNContactForHandleID_withKeys_(v33, v34, (uint64_t)v26, (uint64_t)v4);

  if (v11) {
LABEL_9:
  }
    objc_msgSend_updateCNContact_(self, v20, (uint64_t)v11, v22);
LABEL_11:

LABEL_12:

  return v11;
}

- (BOOL)isChatBot
{
  uint64_t v2 = self;
  unsigned __int8 v3 = sub_1A4B1ED7C();

  return v3 & 1;
}

- (BOOL)isStewieTranscriptSharingHandle
{
  char v5 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], a2, v2, v3);
  int isTranscriptSharingEnabled = objc_msgSend_isTranscriptSharingEnabled(v5, v6, v7, v8);

  if (isTranscriptSharingEnabled)
  {
    uint64_t v13 = objc_msgSend_ID(self, v10, v11, v12);
    if (objc_msgSend_hasPrefix_(v13, v14, *MEMORY[0x1E4F6E4A8], v15))
    {

      return 1;
    }
    uint64_t v19 = objc_msgSend_ID(self, v16, v17, v18);
    char hasSuffix = objc_msgSend_hasSuffix_(v19, v20, *MEMORY[0x1E4F6D2C0], v21);

    if (hasSuffix) {
      return 1;
    }
  }
  return 0;
}

- (void)updateCNContact:(id)a3
{
  uint64_t v6 = (CNContact *)a3;
  if (self->_cnContact != v6)
  {
    objc_msgSend_setCnContact_(self, v4, (uint64_t)v6, v5);
    if (objc_msgSend_isMainThread(MEMORY[0x1E4F29060], v7, v8, v9))
    {
      objc_msgSend_setCachedDisplayNameWithAbbreviation_(self, v10, 0, v11);
      if (objc_msgSend_isBusiness(self, v12, v13, v14))
      {
        uint64_t v18 = (void *)MEMORY[0x1E4F6E628];
        uint64_t v19 = objc_msgSend_ID(self, v15, v16, v17);
        uint64_t v22 = objc_msgSend_placeholderNameForBrandURI_(v18, v20, (uint64_t)v19, v21);
        objc_msgSend_setCachedName_(self, v23, (uint64_t)v22, v24);
      }
      else
      {
        objc_msgSend_setCachedName_(self, v15, 0, v17);
      }
      uint64_t v31 = objc_msgSend_sharedInstance(IMHandleRegistrar, v25, v26, v27);
      objc_msgSend_addHandleToCNIDMap_CNContact_(v31, v32, (uint64_t)self, (uint64_t)v6);
    }
    else
    {
      id location = 0;
      objc_initWeak(&location, self);
      uint64_t v41 = MEMORY[0x1E4F143A8];
      uint64_t v42 = 3221225472;
      uint64_t v43 = sub_1A4BB1198;
      id v44 = &unk_1E5B7CE28;
      objc_copyWeak(&v47, &location);
      uint64_t v45 = self;
      uint64_t v46 = v6;
      dispatch_async(MEMORY[0x1E4F14428], &v41);

      objc_destroyWeak(&v47);
      objc_destroyWeak(&location);
    }
    uint64_t v33 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E6D8], v28, v29, v30, v41, v42, v43, v44, v45);
    int isBatchFetchingForLaunchCompleted = objc_msgSend_isBatchFetchingForLaunchCompleted(v33, v34, v35, v36);

    if (isBatchFetchingForLaunchCompleted) {
      objc_msgSend_sendNotificationABPersonChanged(self, v38, v39, v40);
    }
  }
}

- (BOOL)isContact
{
  uint64_t v5 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E6D8], a2, v2, v3);
  if (objc_msgSend_isBatchFetchingForLaunchCompleted(v5, v6, v7, v8))
  {
  }
  else
  {
    char v11 = IMIsRunningInUnitTesting();

    if ((v11 & 1) == 0)
    {
      uint64_t v14 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E6D8], v9, v12, v10);
      uint64_t v21 = objc_msgSend_ID(self, v18, v19, v20);
      char isIDAKnownContact = objc_msgSend_isIDAKnownContact_(v14, v22, (uint64_t)v21, v23);

      goto LABEL_6;
    }
  }
  uint64_t v13 = (void *)MEMORY[0x1E4F6E6D8];
  uint64_t v14 = objc_msgSend_cnContactWithKeys_(self, v9, MEMORY[0x1E4F1CBF0], v10);
  char isIDAKnownContact = objc_msgSend_isCNContactAKnownContact_(v13, v15, (uint64_t)v14, v16);
LABEL_6:

  return isIDAKnownContact;
}

- (CNContact)cnContact
{
  return (CNContact *)objc_msgSend_cnContactWithKeys_(self, a2, MEMORY[0x1E4F1CBF0], v2);
}

- (BOOL)isStewie
{
  id v4 = objc_msgSend_ID(self, a2, v2, v3);
  char v5 = MEMORY[0x1A62639C0]();

  return v5;
}

- (NSString)ID
{
  return self->_id;
}

- (NSString)personCentricID
{
  return self->_personCentricID;
}

- (NSString)name
{
  p_cachedName = &self->_cachedName;
  cachedName = self->_cachedName;
  if (objc_msgSend_isBusiness(self, a2, v2, v3) && cachedName)
  {
    uint64_t v10 = self->_cachedName;
    char v11 = (void *)MEMORY[0x1E4F6E628];
    uint64_t v12 = objc_msgSend_ID(self, v7, v8, v9);
    uint64_t v15 = objc_msgSend_placeholderNameForBrandURI_(v11, v13, (uint64_t)v12, v14);
    LOBYTE(v10) = objc_msgSend_isEqualToString_(v10, v16, (uint64_t)v15, v17);

    if ((v10 & 1) == 0) {
      goto LABEL_13;
    }
  }
  else if (cachedName)
  {
    goto LABEL_13;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v27 = 0;
      _os_log_impl(&dword_1A4AF7000, v19, OS_LOG_TYPE_DEBUG, "No cached name, fetching", v27, 2u);
    }
  }
  uint64_t v20 = objc_msgSend_immediateNameWithNeedsSuggestedNameFetch_useSuggestedName_(self, v18, 0, 1);
  if (objc_msgSend_length(v20, v21, v22, v23)) {
    objc_storeStrong((id *)p_cachedName, v20);
  }

LABEL_13:
  if (objc_msgSend_length(*p_cachedName, v7, v8, v9))
  {
    long long v25 = *p_cachedName;
  }
  else
  {
    objc_msgSend_immediateNameWithNeedsSuggestedNameFetch_useSuggestedName_(self, v24, 0, 1);
    long long v25 = (NSString *)objc_claimAutoreleasedReturnValue();
  }

  return v25;
}

- (id)immediateNameWithNeedsSuggestedNameFetch:(BOOL *)a3 useSuggestedName:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v208 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = objc_msgSend_cnContact(self, a2, (uint64_t)a3, a4);
  if (!v10)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v18 = objc_msgSend_ID(self, v15, v16, v17);
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v18;
        _os_log_impl(&dword_1A4AF7000, v14, OS_LOG_TYPE_DEBUG, "DisplayName: Refetching Contact for id: %@", buf, 0xCu);
      }
    }
    uint64_t v19 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E6D8], v11, v12, v13);
    uint64_t v23 = objc_msgSend_ID(self, v20, v21, v22);
    uint64_t v10 = objc_msgSend_fetchCNContactForHandleWithID_(v19, v24, (uint64_t)v23, v25);

    if (!v10)
    {
      uint64_t v10 = 0;
      if (objc_msgSend_isAnonymous(self, v26, v27, v28)) {
        goto LABEL_9;
      }
      char v45 = 1;
      uint64_t v32 = 0;
      uint64_t v49 = objc_msgSend_length(0, v29, v30, v31);
      goto LABEL_19;
    }
    objc_msgSend_updateCNContact_(self, v26, (uint64_t)v10, v28);
  }
  if (objc_msgSend_isAnonymous(self, v7, v8, v9))
  {
LABEL_9:
    uint64_t v32 = objc_msgSend_resource(self, v29, v30, v31);
    BOOL v36 = objc_msgSend_length(v32, v33, v34, v35) == 0;
    int v37 = IMOSLoggingEnabled();
    if (v36)
    {
      if (v37)
      {
        int v54 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A4AF7000, v54, OS_LOG_TYPE_DEBUG, "DisplayName: Returning displayID since handle is anonymous", buf, 2u);
        }
      }
      objc_msgSend_displayID(self, v38, v39, v40);
      uint64_t v53 = (NSString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_47;
    }
    if (!v37) {
      goto LABEL_24;
    }
    uint64_t v41 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v41, OS_LOG_TYPE_DEBUG, "DisplayName: Returning resource since handle is anonymous", buf, 2u);
    }
    goto LABEL_23;
  }
  if (IMOSLoggingEnabled())
  {
    id v44 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v44, OS_LOG_TYPE_DEBUG, "DisplayName: Getting display name from Contact", buf, 2u);
    }
  }
  uint64_t v32 = objc_msgSend__displayNameWithContact_(self, v42, (uint64_t)v10, v43);
  char v45 = 0;
  uint64_t v49 = objc_msgSend_length(v32, v46, v47, v48);
LABEL_19:
  if (v49)
  {
    if (!IMOSLoggingEnabled())
    {
LABEL_24:
      uint64_t v53 = v32;
      uint64_t v32 = v53;
LABEL_47:
      id v62 = v53;
      goto LABEL_48;
    }
    uint64_t v41 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v32;
      _os_log_impl(&dword_1A4AF7000, v41, OS_LOG_TYPE_DEBUG, "DisplayName: found displayName: %@", buf, 0xCu);
    }
LABEL_23:

    goto LABEL_24;
  }
  if (!objc_msgSend_isLoginIMHandle(self, v50, v51, v52)) {
    goto LABEL_39;
  }
  v58 = objc_msgSend_me(IMMe, v55, v56, v57);
  objc_msgSend_fullName(v58, v59, v60, v61);
  id v62 = (id)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend_length(v62, v63, v64, v65))
  {

LABEL_39:
    if (objc_msgSend__hasServiceNameProperties(self, v55, v56, v57))
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v73 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A4AF7000, v73, OS_LOG_TYPE_DEBUG, "DisplayName: Using Service name properties", buf, 2u);
        }
      }
      if (objc_msgSend_length(self->_fullName, v70, v71, v72)) {
        goto LABEL_45;
      }
      if (objc_msgSend_length(self->_firstName, v74, v75, v76) && !objc_msgSend_length(self->_lastName, v79, v80, v81))
      {
        firstName = self->_firstName;
        goto LABEL_46;
      }
      if (!objc_msgSend_length(self->_firstName, v79, v80, v81) && objc_msgSend_length(self->_lastName, v82, v83, v84))
      {
        firstName = self->_lastName;
        goto LABEL_46;
      }
      if (!objc_msgSend_length(self->_firstName, v82, v83, v84)
        && !objc_msgSend_length(self->_lastName, v85, v86, v87)
        && objc_msgSend_length(self->_nickname, v85, v86, v87))
      {
        firstName = self->_nickname;
        goto LABEL_46;
      }
      if (objc_msgSend_length(self->_firstName, v85, v86, v87) && objc_msgSend_length(self->_lastName, v88, v89, v90))
      {
        objc_msgSend_stringWithFormat_(NSString, v88, @"%@ %@", v90, self->_firstName, self->_lastName);
        v91 = (NSString *)objc_claimAutoreleasedReturnValue();
        fullName = self->_fullName;
        self->_fullName = v91;
      }
      if (objc_msgSend_length(self->_fullName, v88, v89, v90))
      {
LABEL_45:
        firstName = self->_fullName;
LABEL_46:
        uint64_t v53 = firstName;
        goto LABEL_47;
      }
    }
    v93 = objc_msgSend_suggestedName(self, v67, v68, v69);
    v97 = v93;
    if (v4
      && objc_msgSend_length(v93, v94, v95, v96)
      && objc_msgSend__allowedByScreenTime(self, v94, v95, v96))
    {
      if (IMOSLoggingEnabled())
      {
        v98 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v97;
          _os_log_impl(&dword_1A4AF7000, v98, OS_LOG_TYPE_DEBUG, "DisplayName: Using suggested name %@", buf, 0xCu);
        }
      }
      id v62 = v97;
      goto LABEL_134;
    }
    if (a3 && !v97)
    {
      v202[0] = 0;
      v99 = objc_msgSend_sharedInstance(IMSuggestionsService, v94, v95, v96);
      v103 = objc_msgSend_displayID(self, v100, v101, v102);
      objc_msgSend_suggestedNameFromCache_wasFound_(v99, v104, (uint64_t)v103, (uint64_t)v202);
      id v62 = (id)objc_claimAutoreleasedReturnValue();

      if (v202[0] && objc_msgSend_length(v62, v105, v106, v107))
      {
        objc_msgSend_setSuggestedName_(self, v108, (uint64_t)v62, v109);
        if (v4)
        {
          if (IMOSLoggingEnabled())
          {
            v110 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v110, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&buf[4] = 0;
              _os_log_impl(&dword_1A4AF7000, v110, OS_LOG_TYPE_DEBUG, "DisplayName: Using cached suggested name %@", buf, 0xCu);
            }
          }
          goto LABEL_134;
        }
      }
      else
      {
        *a3 = 1;
      }
    }
    if (objc_msgSend_isBusiness(self, v94, v95, v96))
    {
      v114 = objc_msgSend_displayID(self, v111, v112, v113);
      *(void *)buf = 0;
      objc_initWeak((id *)buf, self);
      v118 = objc_msgSend_sharedInstance(IMHandleRegistrar, v115, v116, v117);
      v203[0] = MEMORY[0x1E4F143A8];
      v203[1] = 3221225472;
      v203[2] = sub_1A4BB02F0;
      v203[3] = &unk_1E5B7CE00;
      objc_copyWeak(&v206, (id *)buf);
      id v119 = v114;
      id v204 = v119;
      v205 = self;
      v121 = objc_msgSend_businessNameForUID_updateHandler_(v118, v120, (uint64_t)v119, (uint64_t)v203);

      if (IMOSLoggingEnabled())
      {
        v125 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v125, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v202 = 0;
          _os_log_impl(&dword_1A4AF7000, v125, OS_LOG_TYPE_DEBUG, "DisplayName: Using biz name", v202, 2u);
        }
      }
      if (v121)
      {
        id v62 = v121;
      }
      else
      {
        v198 = (void *)MEMORY[0x1E4F6E628];
        v199 = objc_msgSend_ID(self, v122, v123, v124);
        objc_msgSend_placeholderNameForBrandURI_(v198, v200, (uint64_t)v199, v201);
        id v62 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_destroyWeak(&v206);
      objc_destroyWeak((id *)buf);

      goto LABEL_134;
    }
    if (v45)
    {
      v126 = objc_msgSend_ID(self, v111, v112, v113);
      int v127 = MEMORY[0x1A62639B0]();

      v131 = objc_msgSend_ID(self, v128, v129, v130);
      if (v127)
      {
        v132 = IMFormattedDisplayStringForNumber();

        uint64_t v136 = objc_msgSend_length(v132, v133, v134, v135);
      }
      else
      {
        int IsEmail = IMStringIsEmail();

        if (IsEmail)
        {
          v164 = objc_msgSend_ID(self, v161, v162, v163);
          v132 = IMFormattedDisplayStringForNumber();

          uint64_t v136 = objc_msgSend_length(v132, v165, v166, v167);
        }
        else
        {
          v132 = 0;
          uint64_t v136 = objc_msgSend_length(0, v161, v162, v163);
        }
      }
    }
    else
    {
      v132 = objc_msgSend_displayNameWithPhoneNumberOrEmailForContact_(MEMORY[0x1E4F6E6D8], v111, (uint64_t)v10, v113);
      uint64_t v136 = objc_msgSend_length(v132, v140, v141, v142);
    }
    if (v136)
    {
      if (IMOSLoggingEnabled())
      {
        v143 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v143, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A4AF7000, v143, OS_LOG_TYPE_DEBUG, "DisplayName: Using formattedDisplayName", buf, 2u);
        }
      }
      id v144 = v132;
LABEL_96:
      id v62 = v144;
LABEL_97:

LABEL_134:
      goto LABEL_48;
    }
    v145 = objc_msgSend_ID(self, v137, v138, v139);
    BOOL v149 = objc_msgSend_length(v145, v146, v147, v148) == 0;

    if (v149)
    {
      if (IMOSLoggingEnabled())
      {
        v168 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v168, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A4AF7000, v168, OS_LOG_TYPE_DEBUG, "DisplayName: Using ID", buf, 2u);
        }
      }
      v169 = sub_1A4C0ACE4();
      objc_msgSend_localizedStringForKey_value_table_(v169, v170, @"Buddy Name", (uint64_t)&stru_1EF8E78C8, @"IMCoreLocalizable");
      id v62 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_97;
    }
    if (objc_msgSend_hasServer(self, v150, v151, v152))
    {
      objc_msgSend__IDWithTrimmedServer(self, v153, v154, v155);
      id v62 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_length(v62, v156, v157, v158))
      {
        if (!IMOSLoggingEnabled()) {
          goto LABEL_97;
        }
        v159 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v159, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A4AF7000, v159, OS_LOG_TYPE_DEBUG, "DisplayName: Using ID from Server", buf, 2u);
        }
LABEL_104:

        goto LABEL_97;
      }
    }
    v171 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v153, v154, v155);
    int v175 = objc_msgSend_stewieEnabled(v171, v172, v173, v174);

    if (v175)
    {
      if (objc_msgSend_isStewieEmergency(self, v176, v177, v178))
      {
        v182 = sub_1A4C0ACE4();
        objc_msgSend_localizedStringForKey_value_table_(v182, v183, @"STEWIE_EMERGENCY_SOS_HANDLE", (uint64_t)&stru_1EF8E78C8, @"IMCoreLocalizable-SOS");
        id v62 = (id)objc_claimAutoreleasedReturnValue();

        if (!IMOSLoggingEnabled()) {
          goto LABEL_97;
        }
        v159 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v159, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A4AF7000, v159, OS_LOG_TYPE_DEBUG, "DisplayName: Using Stewie emergency name", buf, 2u);
        }
        goto LABEL_104;
      }
      if (objc_msgSend_isStewieRoadside(self, v179, v180, v181))
      {
        v187 = objc_msgSend_sharedInstance(IMChorosMonitor, v184, v185, v186);
        v191 = objc_msgSend_ID(self, v188, v189, v190);
        objc_msgSend_roadsideProviderNameForChatIdentifier_(v187, v192, (uint64_t)v191, v193);
        id v62 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_97;
      }
    }
    if (IMOSLoggingEnabled())
    {
      v197 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v197, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AF7000, v197, OS_LOG_TYPE_DEBUG, "DisplayName: Last resort displayID", buf, 2u);
      }
    }
    objc_msgSend_displayID(self, v194, v195, v196);
    id v144 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_96;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v66 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v66, OS_LOG_TYPE_DEBUG, "DisplayName: Using IMMe's FullName", buf, 2u);
    }
  }
LABEL_48:

  return v62;
}

- (BOOL)isAnonymous
{
  return self->_isAnonymous;
}

- (void)setCnContact:(id)a3
{
}

- (void)setCachedName:(id)a3
{
}

- (void)setCachedDisplayNameWithAbbreviation:(id)a3
{
}

- (id)_displayNameWithContact:(id)a3
{
  char v5 = objc_msgSend_displayNameWithCNNickNameOrFullNameOrCompanyNameOrAbbreviatedForContact_(MEMORY[0x1E4F6E6D8], a2, (uint64_t)a3, v3);
  uint64_t v9 = v5;
  if (v5)
  {
    id v10 = v5;
  }
  else
  {
    char v11 = objc_msgSend__displayNameWithNicknameIfAvailable(self, v6, v7, v8);
    id v10 = v11;
    if (v11) {
      id v12 = v11;
    }
  }

  return v10;
}

- (void)_setOriginalID:(id)a3 updateSiblings:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6 && (IMSharedHelperAreObjectsLogicallySame() & 1) == 0)
  {
    id v10 = (NSString *)objc_msgSend_copy(v6, v7, v8, v9);
    uncanonicalID = self->_uncanonicalID;
    self->_uncanonicalID = v10;

    if (v4)
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      uint64_t v15 = objc_msgSend_existingChatSiblingsArray(self, v12, v13, v14, 0);
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v26, (uint64_t)v30, 16);
      if (v17)
      {
        uint64_t v19 = v17;
        uint64_t v20 = *(void *)v27;
        do
        {
          uint64_t v21 = 0;
          do
          {
            if (*(void *)v27 != v20) {
              objc_enumerationMutation(v15);
            }
            uint64_t v22 = *(IMHandle **)(*((void *)&v26 + 1) + 8 * v21);
            if (v22 != self) {
              objc_msgSend__setOriginalID_updateSiblings_(v22, v18, (uint64_t)v6, 0);
            }
            ++v21;
          }
          while (v19 != v21);
          uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v26, (uint64_t)v30, 16);
        }
        while (v19);
      }
    }
    formattedNumber = self->_formattedNumber;
    self->_formattedNumber = 0;

    objc_msgSend_postNotificationName_(self, v24, @"__kIMHandleInfoChangedNotification", v25);
  }
}

- (id)existingChatSiblingsArray
{
  char v5 = objc_msgSend_sharedInstance(IMHandleRegistrar, a2, v2, v3);
  uint64_t v8 = objc_msgSend__existingChatSiblingsForHandle_(v5, v6, (uint64_t)self, v7);

  return v8;
}

- (NSString)originalID
{
  return self->_uncanonicalID;
}

- (NSString)countryCode
{
  countryCode = self->_countryCode;
  if (countryCode)
  {
    uint64_t v3 = countryCode;
  }
  else
  {
    IMCountryCodeForIncomingTextMessage();
    uint64_t v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (void)postNotificationName:(id)a3
{
}

- (void)_postNotificationName:(id)a3 userInfo:(id)a4
{
  if (!self->_blockNotifications && byte_1E965BFF8 != 0)
  {
    id v6 = objc_msgSend_notificationWithName_object_userInfo_(MEMORY[0x1E4F28EA0], a2, (uint64_t)a3, (uint64_t)self, a4);
    id v10 = objc_msgSend_mainThread(MEMORY[0x1E4F29060], v7, v8, v9);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1A4B33C68;
    v14[3] = &unk_1E5B7B130;
    v14[4] = self;
    id v15 = v6;
    id v11 = v6;
    objc_msgSend___im_performBlock_(v10, v12, (uint64_t)v14, v13);
  }
}

- (BOOL)_hasServiceNameProperties
{
  if (objc_msgSend_length(self->_firstName, a2, v2, v3) || objc_msgSend_length(self->_lastName, v5, v6, v7)) {
    return 1;
  }
  if (!objc_msgSend_length(self->_nickname, v8, v9, v10)) {
    return 0;
  }
  uint64_t v16 = objc_msgSend_ID(self, v13, v14, v15);
  BOOL v11 = objc_msgSend_localizedCompare_(v16, v17, (uint64_t)self->_nickname, v18) != 0;

  return v11;
}

- (NSString)suggestedName
{
  return self->_suggestedName;
}

- (BOOL)isLoginIMHandle
{
  BOOL v4 = self;
  objc_msgSend_loginIMHandle(self->_account, a2, v2, v3);
  char v5 = (IMHandle *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = v5 == v4;

  return (char)v4;
}

- (void)_postNotification:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_shouldQueueNotifications(self, v5, v6, v7))
  {
    uint64_t v13 = objc_msgSend_name(v4, v8, v9, v10);
    notificationNameQueue = self->_notificationNameQueue;
    if (!notificationNameQueue)
    {
      uint64_t v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v16 = self->_notificationNameQueue;
      self->_notificationNameQueue = v15;

      uint64_t v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      notificationQueue = self->_notificationQueue;
      self->_notificationQueue = v17;

      notificationNameQueue = self->_notificationNameQueue;
    }
    if ((objc_msgSend_containsObject_(notificationNameQueue, v11, (uint64_t)v13, v12) & 1) == 0)
    {
      objc_msgSend_addObject_(self->_notificationNameQueue, v19, (uint64_t)v13, v20);
      objc_msgSend_addObject_(self->_notificationQueue, v21, (uint64_t)v4, v22);
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      long long v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        int v30 = 138412546;
        uint64_t v31 = self;
        __int16 v32 = 2112;
        id v33 = v4;
        _os_log_impl(&dword_1A4AF7000, v26, OS_LOG_TYPE_DEBUG, "%@ is posting %@", (uint8_t *)&v30, 0x16u);
      }
    }
    long long v27 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v23, v24, v25);
    objc_msgSend___mainThreadPostNotification_(v27, v28, (uint64_t)v4, v29);
  }
}

- (BOOL)shouldQueueNotifications
{
  return self->_notificationQueueCount > 0;
}

- (void)setHasCheckedForSuggestions:(BOOL)a3
{
  self->_hasCheckedForSuggestions = a3;
}

+ (void)setNotificationsEnabled:(BOOL)a3
{
  byte_1E965BFF8 = a3;
}

+ (BOOL)notificationsEnabled
{
  return byte_1E965BFF8;
}

+ (id)cnPhoneticKeys
{
  if (qword_1E965DD60 != -1) {
    dispatch_once(&qword_1E965DD60, &unk_1EF8E5378);
  }
  uint64_t v2 = (void *)qword_1E965DD78;

  return v2;
}

+ (void)_loadStatusNames
{
  byte_1E965E8F8 = 1;
  uint64_t v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = _IMFrameworkBundle();
  char v5 = objc_msgSend_pathForResource_ofType_(v3, v4, @"OnlineStatuses", @"plist");
  objc_msgSend_dictionaryWithContentsOfFile_(v2, v6, (uint64_t)v5, v7);
  id v32 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v10 = objc_msgSend_objectForKey_(v32, v8, @"StatusList", v9);
  int v14 = objc_msgSend_count(v10, v11, v12, v13);
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v16 = (void *)qword_1E965E8F0;
  qword_1E965E8F0 = (uint64_t)v15;

  if (v14 >= 1)
  {
    uint64_t v18 = 0;
    do
    {
      uint64_t v19 = IMPersonStatusFromFZPersonStatus(v18, v17);
      uint64_t v22 = objc_msgSend_objectAtIndex_(v10, v20, v19, v21);
      uint64_t v25 = objc_msgSend_objectForKey_(v22, v23, @"_LOCALIZABLE_", v24);
      long long v26 = (void *)qword_1E965E8F0;
      uint64_t v29 = objc_msgSend_objectForKey_(v25, v27, @"StatusName", v28);
      objc_msgSend_addObject_(v26, v30, (uint64_t)v29, v31);

      uint64_t v18 = (v18 + 1);
    }
    while (v14 != v18);
  }
}

+ (id)nameOfStatus:(unint64_t)a3
{
  if ((byte_1E965E8F8 & 1) == 0) {
    objc_msgSend__loadStatusNames(a1, a2, a3, v3);
  }
  char v5 = (void *)qword_1E965E8F0;

  return (id)objc_msgSend_objectAtIndex_(v5, a2, a3, v3);
}

- (void)dealloc
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      account = self->_account;
      id = self->_id;
      *(_DWORD *)buf = 138412546;
      uint64_t v21 = id;
      __int16 v22 = 2112;
      uint64_t v23 = account;
      _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_DEBUG, "Dealloc ID: %@    Account: %@", buf, 0x16u);
    }
  }
  if (objc_msgSend_watchingIMHandle(self, v3, v4, v5)) {
    objc_msgSend_stopWatchingIMHandle_(self->_account, v9, (uint64_t)self, v10);
  }
  objc_msgSend_unregisterIMHandleWithID_(self->_account, v9, (uint64_t)self->_id, v10);
  int v14 = objc_msgSend_sharedInstance(IMHandleRegistrar, v11, v12, v13);
  objc_msgSend_unregisterIMHandle_(v14, v15, (uint64_t)self, v16);

  phoneNumberRef = self->_phoneNumberRef;
  if (phoneNumberRef) {
    CFRelease(phoneNumberRef);
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v18, OS_LOG_TYPE_DEBUG, " => done", buf, 2u);
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)IMHandle;
  [(IMHandle *)&v19 dealloc];
}

- (id)_handleInfo
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v5 = *MEMORY[0x1E4F6C5C8];
  id = self->_id;
  uncanonicalID = self->_uncanonicalID;
  uint64_t v8 = *MEMORY[0x1E4F6C648];
  uint64_t v9 = objc_msgSend_countryCode(self, a2, v2, v3);
  uint64_t v12 = objc_msgSend_dictionaryWithObjectsAndKeys_(v4, v10, (uint64_t)id, v11, v5, uncanonicalID, v8, v9, *MEMORY[0x1E4F6C5A0], 0);

  return v12;
}

- (void)_setOriginalID:(id)a3
{
  IMCleanupPhoneNumber();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setOriginalID_updateSiblings_(self, v4, (uint64_t)v5, 1);
}

- (BOOL)isMako
{
  isMako = self->_isMako;
  if (!isMako)
  {
    uint64_t v6 = NSNumber;
    uint64_t v7 = objc_msgSend_ID(self, a2, v2, v3);
    uint64_t IsMakoURI = IMSharedHelperIsMakoURI();
    objc_msgSend_numberWithBool_(v6, v9, IsMakoURI, v10);
    uint64_t v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = self->_isMako;
    self->_isMako = v11;

    isMako = self->_isMako;
  }

  return objc_msgSend_BOOLValue(isMako, a2, v2, v3);
}

- (BOOL)isApple
{
  isApple = self->_isApple;
  if (!isApple)
  {
    uint64_t v6 = NSNumber;
    uint64_t v7 = objc_msgSend_ID(self, a2, v2, v3);
    if (IMSharedHelperIsAppleURI())
    {
      objc_msgSend_numberWithInt_(v6, v8, 1, v10);
    }
    else
    {
      uint64_t isMako = objc_msgSend_isMako(self, v8, v9, v10);
      objc_msgSend_numberWithInt_(v6, v12, isMako, v13);
    }
    int v14 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    id v15 = self->_isApple;
    self->_isApple = v14;

    isApple = self->_isApple;
  }

  return objc_msgSend_BOOLValue(isApple, a2, v2, v3);
}

- (BOOL)isStewieEmergencyServices
{
  id v5 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], a2, v2, v3);
  int isTranscriptSharingEnabled = objc_msgSend_isTranscriptSharingEnabled(v5, v6, v7, v8);

  BOOL result = 0;
  if (isTranscriptSharingEnabled)
  {
    uint64_t v13 = objc_msgSend_ID(self, v10, v11, v12);
    char hasSuffix = objc_msgSend_hasSuffix_(v13, v14, *MEMORY[0x1E4F6D2C0], v15);

    if (hasSuffix) {
      return 1;
    }
  }
  return result;
}

- (IMHandle)initWithCoder:(id)a3
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, @"ID");
  uint64_t v8 = objc_opt_class();
  uint64_t v10 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v9, v8, @"AccountID");
  int v14 = objc_msgSend_sharedInstance(IMAccountController, v11, v12, v13);
  objc_msgSend_accountForUniqueID_(v14, v15, (uint64_t)v10, v16);
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
LABEL_2:
    if (objc_msgSend_length(v7, v18, v19, v20, v81, v82, v83, v84))
    {
      objc_msgSend_imHandleWithID_(v17, v21, (uint64_t)v7, v22);
      uint64_t v23 = (IMHandle *)objc_claimAutoreleasedReturnValue();
      uint64_t v26 = objc_msgSend_decodeBoolForKey_(v4, v24, @"AnonymousKey", v25);
      objc_msgSend_setAnonymous_(v23, v27, v26, v28);
LABEL_23:

      self = 0;
      goto LABEL_24;
    }
LABEL_22:
    uint64_t v23 = 0;
    goto LABEL_23;
  }
  uint64_t v29 = objc_opt_class();
  uint64_t v31 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v30, v29, @"ServiceName");
  uint64_t v32 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v33, v32, @"ServiceLoginID");
  v86 = uint64_t v85 = (void *)v31;
  BOOL v36 = objc_msgSend_serviceWithInternalName_(IMServiceImpl, v34, v31, v35);
  uint64_t v40 = objc_msgSend_sharedInstance(IMAccountController, v37, v38, v39);
  uint64_t v43 = objc_msgSend_accountsForService_(v40, v41, (uint64_t)v36, v42);

  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id v44 = v43;
  uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v44, v45, (uint64_t)&v87, (uint64_t)v91, 16);
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v81 = v10;
    v82 = v7;
    id v83 = v4;
    uint64_t v84 = self;
    id v48 = 0;
    uint64_t v49 = *(void *)v88;
LABEL_6:
    uint64_t v50 = 0;
    uint64_t v51 = v48;
    while (1)
    {
      if (*(void *)v88 != v49) {
        objc_enumerationMutation(v44);
      }
      id v48 = *(id *)(*((void *)&v87 + 1) + 8 * v50);

      int v54 = objc_msgSend_canonicalFormOfID_(v36, v52, (uint64_t)v86, v53);
      v58 = objc_msgSend_login(v48, v55, v56, v57);
      uint64_t v61 = objc_msgSend_canonicalFormOfID_(v36, v59, (uint64_t)v58, v60);
      char v63 = objc_msgSend_equalID_andID_(v36, v62, (uint64_t)v54, (uint64_t)v61);

      if (v63) {
        break;
      }
      ++v50;
      uint64_t v51 = v48;
      if (v47 == v50)
      {
        uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v44, v64, (uint64_t)&v87, (uint64_t)v91, 16);
        if (v47) {
          goto LABEL_6;
        }

        id v4 = v83;
        self = v84;
        uint64_t v10 = v81;
        uint64_t v7 = v82;
        goto LABEL_13;
      }
    }
    id v17 = v48;

    id v4 = v83;
    self = v84;
    uint64_t v10 = v81;
    uint64_t v7 = v82;
    if (!v17) {
      goto LABEL_16;
    }
    char v68 = 0;
    uint64_t v69 = v17;
    v70 = v85;
  }
  else
  {
LABEL_13:

LABEL_16:
    uint64_t v71 = objc_msgSend_sharedInstance(IMAccountController, v65, v66, v67, v81, v82, v83, v84);
    objc_msgSend_bestAccountForService_(v71, v72, (uint64_t)v36, v73);
    id v17 = (id)objc_claimAutoreleasedReturnValue();

    v70 = v85;
    if (v17
      || (objc_msgSend_sharedInstance(IMAccountController, v74, v75, v76),
          v77 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend_bestAccountForService_(v77, v78, 0, v79),
          id v17 = (id)objc_claimAutoreleasedReturnValue(),
          v77,
          v17))
    {
      char v68 = 0;
      uint64_t v69 = 0;
    }
    else
    {

      uint64_t v69 = 0;
      self = 0;
      char v68 = 1;
    }
  }

  if ((v68 & 1) == 0)
  {
    if (!v17) {
      goto LABEL_22;
    }
    goto LABEL_2;
  }
  uint64_t v23 = 0;
LABEL_24:

  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v35 = a3;
  uint64_t v7 = objc_msgSend_account(self, v4, v5, v6);
  uint64_t v11 = objc_msgSend_uniqueID(v7, v8, v9, v10);
  objc_msgSend_encodeObject_forKey_(v35, v12, (uint64_t)v11, @"AccountID");

  uint64_t v16 = objc_msgSend_account(self, v13, v14, v15);
  uint64_t v20 = objc_msgSend_login(v16, v17, v18, v19);

  if (objc_msgSend_length(v20, v21, v22, v23)) {
    objc_msgSend_encodeObject_forKey_(v35, v24, (uint64_t)v20, @"ServiceLoginID");
  }
  long long v27 = objc_msgSend_account(self, v24, v25, v26);
  uint64_t v31 = objc_msgSend_internalName(v27, v28, v29, v30);
  objc_msgSend_encodeObject_forKey_(v35, v32, (uint64_t)v31, @"ServiceName");

  objc_msgSend_encodeObject_forKey_(v35, v33, (uint64_t)self->_id, @"ID");
  objc_msgSend_encodeBool_forKey_(v35, v34, self->_isAnonymous, @"AnonymousKey");
}

+ (id)handlesForCNContact:(id)a3
{
  id v3 = a3;
  uint64_t v7 = objc_msgSend_sharedInstance(IMHandleRegistrar, v4, v5, v6);
  uint64_t v11 = objc_msgSend_identifier(v3, v8, v9, v10);

  uint64_t v14 = objc_msgSend_handlesForCNIdentifier_(v7, v12, (uint64_t)v11, v13);
  uint64_t v18 = objc_msgSend_allObjects(v14, v15, v16, v17);

  return v18;
}

- (NSArray)groupsArray
{
  uint64_t v5 = objc_msgSend_account(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_ID(self, v6, v7, v8);
  uint64_t v12 = objc_msgSend_memberGroups_(v5, v10, (uint64_t)v9, v11);

  return (NSArray *)v12;
}

- (NSSet)groups
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_msgSend_groupsArray(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_setWithArray_(v4, v6, (uint64_t)v5, v7);

  return (NSSet *)v8;
}

- (void)setAnonymous:(BOOL)a3
{
  self->_isAnonymous = a3;
}

- (NSString)nameAndEmail
{
  uint64_t v5 = objc_msgSend_email(self, a2, v2, v3);
  if (objc_msgSend_length(v5, v6, v7, v8))
  {
    uint64_t v12 = objc_msgSend_name(self, v9, v10, v11);
    if (objc_msgSend_length(v12, v13, v14, v15))
    {
      objc_msgSend_stringWithFormat_(NSString, v16, @"%@ \u202A<%@>\u202C", v17, v12, v5);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v18 = v5;
    }
    uint64_t v19 = v18;
  }
  else
  {
    uint64_t v19 = 0;
  }

  return (NSString *)v19;
}

- (IMServiceImpl)service
{
  return (IMServiceImpl *)objc_msgSend_service(self->_account, a2, v2, v3);
}

- (BOOL)isContactButNotMe
{
  uint64_t v5 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E6D8], a2, v2, v3);
  uint64_t v8 = objc_msgSend_fetchMeContactWithKeys_(v5, v6, 0, v7);
  uint64_t v12 = objc_msgSend_identifier(v8, v9, v10, v11);

  uint64_t v16 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E6D8], v13, v14, v15);
  if (objc_msgSend_isBatchFetchingForLaunchCompleted(v16, v17, v18, v19))
  {
  }
  else
  {
    char v22 = IMIsRunningInUnitTesting();

    if ((v22 & 1) == 0)
    {
      uint64_t v34 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E6D8], v20, v23, v21);
      uint64_t v38 = objc_msgSend_ID(self, v35, v36, v37);
      uint64_t v24 = objc_msgSend_cnContactIdentifierForID_(v34, v39, (uint64_t)v38, v40);

      if (v24)
      {
        int v33 = objc_msgSend_isEqualToString_(v24, v41, (uint64_t)v12, v42) ^ 1;
        goto LABEL_9;
      }
LABEL_8:
      LOBYTE(v33) = 0;
      goto LABEL_9;
    }
  }
  uint64_t v24 = objc_msgSend_cnContactWithKeys_(self, v20, MEMORY[0x1E4F1CBF0], v21);
  if (!objc_msgSend_isCNContactAKnownContact_(MEMORY[0x1E4F6E6D8], v25, (uint64_t)v24, v26)) {
    goto LABEL_8;
  }
  uint64_t v30 = objc_msgSend_identifier(v24, v27, v28, v29);
  int v33 = objc_msgSend_isEqualToString_(v30, v31, (uint64_t)v12, v32) ^ 1;

LABEL_9:
  return v33;
}

- (BOOL)resetCNContact
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)objc_msgSend_length(self->_id, a2, v2, v3) >= 2
    && objc_msgSend_characterAtIndex_(self->_id, v5, 1, v6) == 58)
  {
    return 0;
  }
  uint64_t v8 = self->_cnContact;
  uint64_t v12 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E6D8], v9, v10, v11);
  uint64_t v16 = objc_msgSend_ID(self, v13, v14, v15);
  uint64_t v19 = objc_msgSend_fetchCNContactForHandleWithID_(v12, v17, (uint64_t)v16, v18);

  objc_msgSend_updateCNContact_(self, v20, v19, v21);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v25 = objc_msgSend_existingChatSiblingsArray(self, v22, v23, v24, 0);
  uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v43, (uint64_t)v47, 16);
  if (v27)
  {
    uint64_t v30 = v27;
    uint64_t v31 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v44 != v31) {
          objc_enumerationMutation(v25);
        }
        int v33 = *(IMHandle **)(*((void *)&v43 + 1) + 8 * i);
        if (v33 != self) {
          objc_msgSend_updateCNContact_(v33, v28, v19, v29);
        }
      }
      uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v28, (uint64_t)&v43, (uint64_t)v47, 16);
    }
    while (v30);
  }

  if ((objc_msgSend_areCNContactPropertiesRecent(self, v34, v35, v36) & 1) == 0)
  {
    objc_msgSend_resetCNContactProperties(self, v37, v38, v39);
    objc_msgSend_postNotificationName_(self, v40, @"__kIMHandleInfoChangedNotification", v41);
  }
  if (v19 | v8) {
    char isEqualToContact = objc_msgSend__im_isEqualToContact_((void *)v19, v37, v8, v39);
  }
  else {
    char isEqualToContact = 0;
  }

  return isEqualToContact;
}

- (BOOL)areCNContactPropertiesRecent
{
  uint64_t v5 = objc_msgSend_nickname(self, a2, v2, v3);
  uint64_t v8 = v5;
  uint64_t cnNickname = (uint64_t)self->_cnNickname;
  if (cnNickname | v5 && !objc_msgSend_isEqualToString_((void *)v5, v6, cnNickname, v7)) {
    goto LABEL_10;
  }
  uint64_t v10 = objc_msgSend_firstName(self, v6, cnNickname, v7);

  uint64_t cnFirstName = (uint64_t)self->_cnFirstName;
  if (cnFirstName | v10 && !objc_msgSend_isEqualToString_((void *)v10, v11, cnFirstName, v12))
  {
    BOOL v21 = 0;
    uint64_t v8 = v10;
    goto LABEL_13;
  }
  uint64_t v14 = objc_msgSend_lastName(self, v11, cnFirstName, v12);

  uint64_t cnLastName = (uint64_t)self->_cnLastName;
  if (cnLastName | v14 && !objc_msgSend_isEqualToString_((void *)v14, v15, cnLastName, v16))
  {
    BOOL v21 = 0;
    uint64_t v8 = v14;
    goto LABEL_13;
  }
  uint64_t v8 = objc_msgSend_fullName(self, v15, cnLastName, v16);

  uint64_t cnFullName = (uint64_t)self->_cnFullName;
  if (cnFullName | v8 && !objc_msgSend_isEqualToString_((void *)v8, v18, cnFullName, v19)) {
LABEL_10:
  }
    BOOL v21 = 0;
  else {
    BOOL v21 = 1;
  }
LABEL_13:

  return v21;
}

- (void)_clearCNContactProperties
{
  objc_msgSend_nickname(self, a2, v2, v3);
  uint64_t v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t cnNickname = self->_cnNickname;
  self->_uint64_t cnNickname = v5;

  objc_msgSend_fullName(self, v7, v8, v9);
  uint64_t v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t cnFullName = self->_cnFullName;
  self->_uint64_t cnFullName = v10;

  objc_msgSend_firstName(self, v12, v13, v14);
  uint64_t v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t cnFirstName = self->_cnFirstName;
  self->_uint64_t cnFirstName = v15;

  objc_msgSend_lastName(self, v17, v18, v19);
  uint64_t v20 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t cnLastName = self->_cnLastName;
  self->_uint64_t cnLastName = v20;

  MEMORY[0x1F41817F8](v20, cnLastName);
}

- (void)resetCNContactProperties
{
  if (self->_cnContact && (objc_msgSend_areCNContactPropertiesRecent(self, a2, v2, v3) & 1) == 0)
  {
    MEMORY[0x1F4181798](self, sel__clearCNContactProperties, v5, v6);
  }
}

- (id)_IDWithTrimmedServer
{
  IDWithTrimmedServer = self->_IDWithTrimmedServer;
  if (IDWithTrimmedServer)
  {
    uint64_t v5 = IDWithTrimmedServer;
  }
  else
  {
    uint64_t v7 = objc_msgSend_login(self->_account, a2, v2, v3);
    uint64_t v10 = objc_msgSend_rangeOfString_(v7, v8, @"@", v9);
    uint64_t v17 = objc_msgSend_ID(self, v11, v12, v13);
    if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_12;
    }
    uint64_t v20 = objc_msgSend_substringFromIndex_(v7, v14, v10 + 1, v16);
    if (v20 && objc_msgSend_hasSuffix_(v17, v18, (uint64_t)v20, v19))
    {
      uint64_t v22 = objc_msgSend_rangeOfString_options_(v17, v21, (uint64_t)v20, 4);
      uint64_t v25 = objc_msgSend_substringToIndex_(v17, v23, v22, v24);
      if (objc_msgSend_hasSuffix_(v25, v26, @"@", v27))
      {
        uint64_t v31 = objc_msgSend_length(v25, v28, v29, v30);
        objc_msgSend_substringToIndex_(v25, v32, v31 - 1, v33);
        uint64_t v34 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v34 = v25;
      }
      uint64_t v35 = self->_IDWithTrimmedServer;
      self->_IDWithTrimmedServer = v34;
    }
    uint64_t v36 = self->_IDWithTrimmedServer;
    if (!v36)
    {
LABEL_12:
      objc_msgSend_ID(self, v14, v15, v16);
      uint64_t v37 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v37 = v36;
    }
    uint64_t v5 = v37;
  }

  return v5;
}

- (BOOL)_hasABName
{
  return objc_msgSend_length(self->_cnFirstName, a2, v2, v3)
      || objc_msgSend_length(self->_cnLastName, v5, v6, v7)
      || objc_msgSend_length(self->_cnFullName, v8, v9, v10)
      || objc_msgSend_length(self->_cnNickname, v11, v12, v13) != 0;
}

- (void)setSuggestedName:(id)a3
{
  id v19 = a3;
  if ((objc_msgSend_isEqualToString_(self->_suggestedName, v4, (uint64_t)v19, v5) & 1) == 0)
  {
    uint64_t v9 = (NSString *)objc_msgSend_copy(v19, v6, v7, v8);
    suggestedName = self->_suggestedName;
    self->_suggestedName = v9;

    BOOL v14 = objc_msgSend_length(self->_suggestedName, v11, v12, v13) != 0;
    objc_msgSend_setHasSuggestedName_(self, v15, v14, v16);
    objc_msgSend_postNotificationName_(self, v17, @"__kIMHandleInfoChangedNotification", v18);
  }
}

- (BOOL)_allowedByScreenTime
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_ID(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_sharedInstance(IMDowntimeController, v5, v6, v7);
  v14[0] = v4;
  uint64_t v10 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v9, (uint64_t)v14, 1);
  char v12 = objc_msgSend_allowedToShowConversationWithHandleIDs_sync_context_(v8, v11, (uint64_t)v10, 0, 0);

  return v12;
}

- (id)_displayNameWithNicknameIfAvailable
{
  if (objc_msgSend__allowedByScreenTime(self, a2, v2, v3))
  {
    uint64_t v8 = objc_msgSend_sharedInstance(IMNicknameController, v5, v6, v7);
    uint64_t v11 = objc_msgSend_nicknameForHandle_(v8, v9, (uint64_t)self, v10);

    if (v11)
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
      uint64_t v16 = objc_msgSend_firstName(v11, v13, v14, v15);
      objc_msgSend_setGivenName_(v12, v17, (uint64_t)v16, v18);

      uint64_t v22 = objc_msgSend_lastName(v11, v19, v20, v21);
      objc_msgSend_setFamilyName_(v12, v23, (uint64_t)v22, v24);

      uint64_t v26 = objc_msgSend_stringFromContact_style_(MEMORY[0x1E4F1B910], v25, (uint64_t)v12, 0);
      if (objc_msgSend_length(v26, v27, v28, v29))
      {
        uint64_t v30 = NSString;
        uint64_t v31 = IMCoreLocalizedString(@"Maybe: %@", @"Maybe: %@");
        uint64_t v34 = objc_msgSend_stringWithFormat_(v30, v32, (uint64_t)v31, v33, v26);
      }
      else
      {
        uint64_t v34 = 0;
      }
    }
    else
    {
      uint64_t v34 = 0;
    }
  }
  else
  {
    uint64_t v34 = 0;
  }

  return v34;
}

- (NSString)normalizedID
{
  normalizedFormOfID = self->_normalizedFormOfID;
  if (normalizedFormOfID) {
    goto LABEL_6;
  }
  uint64_t v6 = objc_msgSend_service(self, a2, v2, v3);
  int v10 = objc_msgSend_supportsPhoneNumberMapping(v6, v7, v8, v9);

  if (v10)
  {
    uint64_t v14 = objc_msgSend_service(self, v11, v12, v13);
    objc_msgSend_normalizedFormOfID_(v14, v15, (uint64_t)self->_id, v16);
    uint64_t v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = self->_normalizedFormOfID;
    self->_normalizedFormOfID = v17;

    normalizedFormOfID = self->_normalizedFormOfID;
    if (normalizedFormOfID)
    {
LABEL_6:
      uint64_t v21 = normalizedFormOfID;
      goto LABEL_7;
    }
    MEMORY[0x1A62639E0](self->_id);
    id v19 = (NSString *)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = self->_normalizedFormOfID;
    self->_normalizedFormOfID = v19;
  }
  normalizedFormOfID = self->_normalizedFormOfID;
  if (normalizedFormOfID) {
    goto LABEL_6;
  }
  MEMORY[0x1A62639E0](self->_id);
  uint64_t v21 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v21;
}

- (NSString)fullName
{
  uint64_t v5 = objc_msgSend_cnContact(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_fullNameForCNContact_(MEMORY[0x1E4F6E6D8], v6, (uint64_t)v5, v7);
  if (objc_msgSend_length(v8, v9, v10, v11))
  {
    uint64_t v15 = v8;
  }
  else if (objc_msgSend__hasServiceNameProperties(self, v12, v13, v14) {
         && (fullName = self->_fullName) != 0)
  }
  {
    uint64_t v15 = fullName;
  }
  else
  {
    if (objc_msgSend_isLoginIMHandle(self, v16, v17, v18))
    {
      uint64_t v23 = objc_msgSend_me(IMMe, v20, v21, v22);
      uint64_t v27 = objc_msgSend_fullName(v23, v24, v25, v26);
      uint64_t v31 = objc_msgSend_trimmedString(v27, v28, v29, v30);

      if (objc_msgSend_length(v31, v32, v33, v34)) {
        goto LABEL_11;
      }
    }
    objc_msgSend_name(self, v20, v21, v22);
    uint64_t v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v31 = v15;
LABEL_11:

  return (NSString *)v31;
}

- (NSString)nameAndID
{
  if (objc_msgSend_hasName(self, a2, v2, v3))
  {
    uint64_t v8 = objc_msgSend_name(self, v5, v6, v7);
    uint64_t v12 = objc_msgSend_displayID(self, v9, v10, v11);
    if (objc_msgSend_equalID_andID_(self->_account, v13, (uint64_t)v8, (uint64_t)v12)) {
      objc_msgSend_stringWithFormat_(NSString, v14, @"%@", v15, v8);
    }
    else {
    id v19 = objc_msgSend_stringWithFormat_(NSString, v14, @"%@ \u202A<%@>\u202C", v15, v8, v12);
    }
  }
  else
  {
    uint64_t v16 = NSString;
    uint64_t v8 = objc_msgSend_displayID(self, v5, v6, v7);
    id v19 = objc_msgSend_stringWithFormat_(v16, v17, @"%@", v18, v8);
  }

  return (NSString *)v19;
}

- (BOOL)hasName
{
  if (objc_msgSend__hasABName(self, a2, v2, v3)) {
    return 1;
  }

  return objc_msgSend__hasServiceNameProperties(self, v5, v6, v7);
}

- (NSString)firstName
{
  uint64_t v5 = objc_msgSend_cnContact(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_firstNameForCNContact_(MEMORY[0x1E4F6E6D8], v6, (uint64_t)v5, v7);
  if (objc_msgSend_length(v8, v9, v10, v11))
  {
    uint64_t v15 = v8;
LABEL_3:
    uint64_t v16 = v15;
    goto LABEL_4;
  }
  if (objc_msgSend__hasServiceNameProperties(self, v12, v13, v14))
  {
    firstName = self->_firstName;
    if (firstName)
    {
      uint64_t v15 = firstName;
      goto LABEL_3;
    }
  }
  if (objc_msgSend_isLoginIMHandle(self, v18, v19, v20))
  {
    uint64_t v25 = objc_msgSend_me(IMMe, v22, v23, v24);
    uint64_t v16 = objc_msgSend_firstName(v25, v26, v27, v28);
  }
  else
  {
    uint64_t v16 = 0;
  }
LABEL_4:

  return (NSString *)v16;
}

- (NSString)lastName
{
  uint64_t v5 = objc_msgSend_cnContact(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_lastNameForCNContact_(MEMORY[0x1E4F6E6D8], v6, (uint64_t)v5, v7);
  if (objc_msgSend_length(v8, v9, v10, v11))
  {
    uint64_t v15 = v8;
LABEL_3:
    uint64_t v16 = v15;
    goto LABEL_4;
  }
  if (objc_msgSend__hasServiceNameProperties(self, v12, v13, v14))
  {
    if (objc_msgSend_length(self->_lastName, v18, v19, v20))
    {
      uint64_t v15 = self->_lastName;
      goto LABEL_3;
    }
  }
  else if (objc_msgSend_isLoginIMHandle(self, v18, v19, v20))
  {
    uint64_t v24 = objc_msgSend_me(IMMe, v21, v22, v23);
    uint64_t v16 = objc_msgSend_lastName(v24, v25, v26, v27);

    goto LABEL_4;
  }
  uint64_t v16 = 0;
LABEL_4:

  return (NSString *)v16;
}

- (NSString)phoneticFirstName
{
  uint64_t v3 = objc_opt_class();
  uint64_t v7 = objc_msgSend_cnPhoneticKeys(v3, v4, v5, v6);
  uint64_t v10 = objc_msgSend_cnContactWithKeys_(self, v8, (uint64_t)v7, v9);

  uint64_t v13 = objc_msgSend_phoneticFirstNameForCNContact_(MEMORY[0x1E4F6E6D8], v11, (uint64_t)v10, v12);
  if (objc_msgSend_length(v13, v14, v15, v16)) {
    id v17 = v13;
  }
  else {
    id v17 = 0;
  }

  return (NSString *)v17;
}

- (NSString)phoneticLastName
{
  uint64_t v3 = objc_opt_class();
  uint64_t v7 = objc_msgSend_cnPhoneticKeys(v3, v4, v5, v6);
  uint64_t v10 = objc_msgSend_cnContactWithKeys_(self, v8, (uint64_t)v7, v9);

  uint64_t v13 = objc_msgSend_phoneticLastNameForCNContact_(MEMORY[0x1E4F6E6D8], v11, (uint64_t)v10, v12);
  if (objc_msgSend_length(v13, v14, v15, v16)) {
    id v17 = v13;
  }
  else {
    id v17 = 0;
  }

  return (NSString *)v17;
}

- (NSString)phoneticFullName
{
  uint64_t v3 = objc_opt_class();
  uint64_t v7 = objc_msgSend_cnPhoneticKeys(v3, v4, v5, v6);
  uint64_t v10 = objc_msgSend_cnContactWithKeys_(self, v8, (uint64_t)v7, v9);

  uint64_t v13 = objc_msgSend_phoneticFullNameForCNContact_(MEMORY[0x1E4F6E6D8], v11, (uint64_t)v10, v12);
  if (objc_msgSend_length(v13, v14, v15, v16)) {
    id v17 = v13;
  }
  else {
    id v17 = 0;
  }

  return (NSString *)v17;
}

- (void)_setBaseFirstName:(id)a3 lastName:(id)a4 fullName:(id)a5
{
  uint64_t v34 = (NSString *)a3;
  uint64_t v8 = (NSString *)a4;
  uint64_t v11 = (NSString *)a5;
  firstName = self->_firstName;
  if (firstName == v34) {
    int v13 = 0;
  }
  else {
    int v13 = objc_msgSend_isEqualToString_(v34, v9, (uint64_t)firstName, v10) ^ 1;
  }
  lastName = self->_lastName;
  if (lastName == v8) {
    int v15 = 0;
  }
  else {
    int v15 = objc_msgSend_isEqualToString_(v8, v9, (uint64_t)lastName, v10) ^ 1;
  }
  fullName = self->_fullName;
  if (fullName == v11)
  {
    if ((v13 | v15) != 1) {
      goto LABEL_13;
    }
  }
  else if (((objc_msgSend_isEqualToString_(v11, v9, (uint64_t)fullName, v10) ^ 1 | v13 | v15) & 1) == 0)
  {
    goto LABEL_13;
  }
  id v17 = (NSString *)objc_msgSend_copy(v11, v9, (uint64_t)fullName, v10);
  uint64_t v18 = self->_fullName;
  self->_fullName = v17;

  uint64_t v22 = (NSString *)objc_msgSend_copy(v34, v19, v20, v21);
  uint64_t v23 = self->_firstName;
  self->_firstName = v22;

  uint64_t v27 = (NSString *)objc_msgSend_copy(v8, v24, v25, v26);
  uint64_t v28 = self->_lastName;
  self->_lastName = v27;

  if ((objc_msgSend__hasABName(self, v29, v30, v31) & 1) == 0) {
    objc_msgSend_postNotificationName_(self, v32, @"__kIMHandleInfoChangedNotification", v33);
  }
LABEL_13:
}

- (void)setImageData:(id)a3
{
  _WORD v31[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x1E4F1AF98];
  v31[0] = *MEMORY[0x1E4F1AE28];
  v31[1] = v5;
  uint64_t v7 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v6, (uint64_t)v31, 2);
  uint64_t v10 = objc_msgSend_cnContactWithKeys_(self, v8, (uint64_t)v7, v9);

  objc_msgSend_imageData(v10, v11, v12, v13);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  if (v16 != v4 && (objc_msgSend_isEqualToData_(v4, v14, (uint64_t)v16, v15) & 1) == 0)
  {
    uint64_t v20 = objc_msgSend_mutableCopy(v10, v17, v18, v19);
    objc_msgSend_setImageData_(v20, v21, (uint64_t)v4, v22);
    uint64_t v26 = objc_msgSend_copy(v20, v23, v24, v25);
    objc_msgSend_updateCNContact_(self, v27, (uint64_t)v26, v28);

    objc_msgSend_postNotificationName_(self, v29, @"__kIMHandleInfoChangedNotification", v30);
  }
}

- (void)setLocalNickname:(id)a3
{
  id v4 = (const char *)a3;
  uint64_t nickname = (uint64_t)self->_nickname;
  if ((const char *)nickname != v4)
  {
    id v17 = (char *)v4;
    uint64_t nickname = objc_msgSend_isEqualToString_((void *)nickname, v4, (uint64_t)v4, v5);
    id v4 = v17;
    if ((nickname & 1) == 0)
    {
      fullName = self->_fullName;
      self->_fullName = 0;

      uint64_t v11 = (NSString *)objc_msgSend_copy(v17, v8, v9, v10);
      uint64_t v12 = self->_nickname;
      self->_uint64_t nickname = v11;

      uint64_t nickname = objc_msgSend__hasABName(self, v13, v14, v15);
      id v4 = v17;
      if ((nickname & 1) == 0)
      {
        uint64_t nickname = objc_msgSend_postNotificationName_(self, v17, @"__kIMHandleInfoChangedNotification", v16);
        id v4 = v17;
      }
    }
  }

  MEMORY[0x1F41817F8](nickname, v4);
}

- (void)setFirstName:(id)a3 lastName:(id)a4 fullName:(id)a5 andUpdateABPerson:(BOOL)a6
{
  if (!a6) {
    MEMORY[0x1F4181798](self, sel__setBaseFirstName_lastName_fullName_, a3, a4);
  }
}

- (void)setEmail:(id)a3 andUpdateABPerson:(BOOL)a4
{
  BOOL v4 = a4;
  IMSingleObjectArray();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEmails_andUpdateABPerson_(self, v6, (uint64_t)v7, v4);
}

- (NSString)email
{
  BOOL v4 = objc_msgSend_emails(self, a2, v2, v3);
  if (objc_msgSend_count(v4, v5, v6, v7))
  {
    uint64_t v11 = objc_msgSend___imFirstObject(v4, v8, v9, v10);
  }
  else
  {
    uint64_t v11 = 0;
  }

  return (NSString *)v11;
}

- (NSArray)emails
{
  BOOL v4 = (void *)MEMORY[0x1E4F6E6D8];
  uint64_t v5 = objc_msgSend_cnContactWithKeys_(self, a2, MEMORY[0x1E4F1CBF0], v2);
  uint64_t v8 = objc_msgSend_emailsForCNContact_(v4, v6, (uint64_t)v5, v7);

  if (objc_msgSend_count(v8, v9, v10, v11))
  {
    uint64_t v15 = v8;
LABEL_5:
    uint64_t v19 = v15;
    goto LABEL_6;
  }
  if (objc_msgSend_count(self->_emails, v12, v13, v14))
  {
    uint64_t v15 = self->_emails;
    goto LABEL_5;
  }
  if (objc_msgSend_isLoginIMHandle(self, v16, v17, v18))
  {
    uint64_t v24 = objc_msgSend_me(IMMe, v21, v22, v23);
    uint64_t v19 = objc_msgSend_emails(v24, v25, v26, v27);
  }
  else
  {
    uint64_t v19 = 0;
  }
LABEL_6:

  return (NSArray *)v19;
}

- (void)setFirstName:(id)a3 lastName:(id)a4
{
}

- (void)setEmail:(id)a3
{
}

- (void)setEmails:(id)a3
{
}

- (BOOL)isSystemUser
{
  uint64_t v5 = objc_msgSend_ID(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_service(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_serviceProperties(v9, v10, v11, v12);
  uint64_t v16 = objc_msgSend_objectForKey_(v13, v14, *MEMORY[0x1E4F6C0E8], v15);
  char isEqualToString = objc_msgSend_isEqualToString_(v5, v17, (uint64_t)v16, v18);

  if (isEqualToString) {
    return 1;
  }
  uint64_t v23 = objc_msgSend_objectForKey_(self->_extraProps, v20, *MEMORY[0x1E4F6C5D8], v21);
  char v27 = objc_msgSend_BOOLValue(v23, v24, v25, v26);

  return v27;
}

- (BOOL)isKTVerified
{
  uint64_t v5 = objc_msgSend_sharedController(IMKeyTransparencyController, a2, v2, v3);
  uint64_t v9 = objc_msgSend_ID(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend__stripFZIDPrefix(v9, v10, v11, v12);
  uint64_t v16 = objc_msgSend_ktVerifierResultForHandleID_(v5, v14, (uint64_t)v13, v15);

  BOOL v23 = objc_msgSend_staticAccountKeyEnforced(v16, v17, v18, v19)
     && (objc_msgSend_optedIn(v16, v20, v21, v22) & 1) != 0;

  return v23;
}

- (void)setIsMobile:(BOOL)a3
{
  if (self->_isMobile != a3)
  {
    self->_isMobile = a3;
    objc_msgSend_postNotificationName_(self, a2, @"__kIMHandleIsMobileChangedNotification", v3);
  }
}

- (void)setIsBot:(BOOL)a3
{
  if (self->_isBot != a3)
  {
    self->_isBot = a3;
    objc_msgSend_postNotificationName_(self, a2, @"__kIMHandleIsBotChangedNotification", v3);
  }
}

- (NSString)mobileDeviceName
{
  BOOL v4 = objc_msgSend_extraProperties(self, a2, v2, v3);
  uint64_t v7 = objc_msgSend_objectForKey_(v4, v5, *MEMORY[0x1E4F6C5E8], v6);

  return (NSString *)v7;
}

- (BOOL)hasServer
{
  BOOL v4 = objc_msgSend_account(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_service(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_jabberService(IMServiceImpl, v9, v10, v11);
  BOOL v13 = v8 == v12;

  return v13;
}

- (BOOL)hasResource
{
  return self->_resourceIndex != 0x7FFFFFFFFFFFFFFFLL;
}

- (NSString)server
{
  if (objc_msgSend_hasServer(self, a2, v2, v3))
  {
    uint64_t v8 = objc_msgSend_IDWithoutResource(self, v5, v6, v7);
    uint64_t v11 = objc_msgSend_rangeOfString_(v8, v9, @"@", v10);
    if (v11 == 0x7FFFFFFFFFFFFFFFLL
      || (uint64_t v15 = v11, (unint64_t)&v12[v11] >= objc_msgSend_length(self->_id, v12, v13, v14)))
    {
      uint64_t v18 = 0;
    }
    else
    {
      uint64_t v18 = objc_msgSend_substringFromIndex_(v8, v16, v15 + 1, v17);
    }
  }
  else
  {
    uint64_t v18 = 0;
  }

  return (NSString *)v18;
}

- (BOOL)isBuddy
{
  uint64_t v5 = objc_msgSend_account(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_ID(self, v6, v7, v8);
  uint64_t v12 = objc_msgSend_memberGroups_(v5, v10, (uint64_t)v9, v11);
  BOOL v13 = v12 != 0;

  return v13;
}

- (BOOL)isLoginIMHandleForAnyAccount
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_isLoginIMHandle(self, a2, v2, v3))
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v9 = objc_msgSend_accountSiblingsArray(self, v5, v6, v7, 0);
    uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v17, (uint64_t)v21, 16);
    if (v8)
    {
      uint64_t v14 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v9);
          }
          if (objc_msgSend_isLoginIMHandle(*(void **)(*((void *)&v17 + 1) + 8 * i), v11, v12, v13))
          {
            LOBYTE(v8) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v11, (uint64_t)&v17, (uint64_t)v21, 16);
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v8;
}

- (BOOL)matchesLoginHandleForAnyAccount
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_accountSiblingsArray(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_normalizedID(self, v6, v7, v8);
  uint64_t v10 = MEMORY[0x1A62639E0]();

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v11 = v5;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v33, (uint64_t)v37, 16);
  if (v16)
  {
    uint64_t v17 = *(void *)v34;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v34 != v17) {
          objc_enumerationMutation(v11);
        }
        long long v19 = objc_msgSend_account(*(void **)(*((void *)&v33 + 1) + 8 * i), v13, v14, v15, (void)v33);
        BOOL v23 = objc_msgSend_loginIMHandle(v19, v20, v21, v22);
        char v27 = objc_msgSend_normalizedID(v23, v24, v25, v26);
        uint64_t v28 = MEMORY[0x1A62639E0]();

        uint64_t v31 = objc_msgSend_caseInsensitiveCompare_(v10, v29, (uint64_t)v28, v30);
        if (!v31)
        {
          LOBYTE(v16) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v13, (uint64_t)&v33, (uint64_t)v37, 16);
      if (v16) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v16;
}

- (void)_createPhoneNumberRefIfNeeded
{
  if (!self->_hasCheckedPhoneNumber && !self->_phoneNumberRef)
  {
    self->_hasCheckedPhoneNumber = 1;
    MEMORY[0x1A62639E0](self->_id, a2);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend__appearsToBePhoneNumber(v6, v3, v4, v5)) {
      self->_phoneNumberRef = (__CFPhoneNumber *)IMPhoneNumberRefCopyForPhoneNumber();
    }
  }
}

- (__CFPhoneNumber)phoneNumberRef
{
  objc_msgSend__createPhoneNumberRefIfNeeded(self, a2, v2, v3);
  return self->_phoneNumberRef;
}

- (void)_updateOriginalID:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((objc_msgSend_hasPrefix_(v4, v5, @"+", v6) & 1) == 0)
  {
    if (objc_msgSend_length(v4, v7, v8, v9))
    {
      if ((objc_msgSend__appearsToBeEmail(v4, v10, v11, v12) & 1) == 0)
      {
        uint64_t v16 = objc_msgSend_originalID(self, v13, v14, v15);
        char isEqualToIgnoringCase = objc_msgSend_isEqualToIgnoringCase_(v4, v17, (uint64_t)v16, v18);

        if ((isEqualToIgnoringCase & 1) == 0)
        {
          BOOL v23 = objc_msgSend_sharedInstance(IMDaemonController, v20, v21, v22);
          int v26 = *MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v23, v24, 0, v25);

          if (v26)
          {
            if (IMOSLoggingEnabled())
            {
              uint64_t v30 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
              {
                long long v34 = objc_msgSend_originalID(self, v31, v32, v33);
                int v49 = 138412802;
                uint64_t v50 = v34;
                __int16 v51 = 2112;
                id v52 = v4;
                __int16 v53 = 2112;
                int v54 = self;
                _os_log_impl(&dword_1A4AF7000, v30, OS_LOG_TYPE_DEBUG, "Updating unformatted ID from %@ to %@ (%@)", (uint8_t *)&v49, 0x20u);
              }
            }
            long long v35 = objc_msgSend_sharedInstance(IMDaemonController, v27, v28, v29);
            uint64_t v39 = objc_msgSend_ID(self, v36, v37, v38);
            long long v43 = objc_msgSend_service(self, v40, v41, v42);
            uint64_t v47 = objc_msgSend_internalName(v43, v44, v45, v46);
            objc_msgSend_updateUnformattedID_forBuddyID_onService_(v35, v48, (uint64_t)v4, (uint64_t)v39, v47);
          }
        }
      }
    }
  }
}

- (id)_unformattedPhoneNumber
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend__formattedPhoneNumber(self, a2, v2, v3);
  if (objc_msgSend_length(v4, v5, v6, v7))
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        int v17 = 138412290;
        uint64_t v18 = v4;
        _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_DEBUG, "Unformatted phone number: %@", (uint8_t *)&v17, 0xCu);
      }
    }
    uint64_t v12 = objc_msgSend_controlCharacterSet(MEMORY[0x1E4F28B88], v8, v9, v10);
    uint64_t v15 = objc_msgSend_stringByTrimmingCharactersInSet_(v4, v13, (uint64_t)v12, v14);

    id v4 = (void *)v15;
  }

  return v4;
}

- (void)requestValueOfProperty:(id)a3
{
}

- (void)setValue:(id)a3 ofExtraProperty:(id)a4
{
}

- (BOOL)watchingIMHandle
{
  return (objc_msgSend_isBuddy(self, a2, v2, v3) & 1) != 0 || self->_hasTemporaryWatch;
}

- (void)setHasTemporaryWatch:(BOOL)a3
{
  self->_hasTemporaryWatch = a3;
}

- (BOOL)isBetterThanIMHandle:(id)a3
{
  return objc_msgSend_isBetterThanIMHandle_nonPhoneNumbersPreferred_(self, a2, (uint64_t)a3, 1);
}

- (BOOL)isBetterThanIMHandle:(id)a3 nonPhoneNumbersPreferred:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = (IMHandle *)a3;
  uint64_t v10 = v6;
  if (v6)
  {
    if (v6 != self)
    {
      unint64_t v186 = objc_msgSend_status(self, v7, v8, v9);
      unint64_t v185 = objc_msgSend_status(v10, v11, v12, v13);
      int v17 = objc_msgSend_account(self, v14, v15, v16);
      uint64_t v21 = objc_msgSend_account(v10, v18, v19, v20);
      uint64_t v25 = objc_msgSend_sharedInstance(IMAccountController, v22, v23, v24);
      uint64_t v29 = objc_msgSend_accounts(v25, v26, v27, v28);
      uint64_t v33 = objc_msgSend_account(self, v30, v31, v32);
      int isMobile = objc_msgSend_containsObjectIdenticalTo_(v29, v34, (uint64_t)v33, v35);

      uint64_t v40 = objc_msgSend_sharedInstance(IMAccountController, v37, v38, v39);
      long long v44 = objc_msgSend_accounts(v40, v41, v42, v43);
      uint64_t v48 = objc_msgSend_account(v10, v45, v46, v47);
      int v51 = objc_msgSend_containsObjectIdenticalTo_(v44, v49, (uint64_t)v48, v50);

      id v52 = v17;
      if (isMobile != v51)
      {
LABEL_13:

        goto LABEL_14;
      }
      int isOperational = objc_msgSend_isOperational(v17, v53, v54, v55);
      if (isOperational != objc_msgSend_isOperational(v21, v57, v58, v59))
      {
        char v63 = objc_msgSend_isOperational(v17, v60, v61, v62);
LABEL_12:
        LOBYTE(isMobile) = v63;
        goto LABEL_13;
      }
      int isActive = objc_msgSend_isActive(v17, v60, v61, v62);
      if (isActive != objc_msgSend_isActive(v21, v65, v66, v67))
      {
        char v63 = objc_msgSend_isActive(v17, v68, v69, v70);
        goto LABEL_12;
      }
      int isConnected = objc_msgSend_isConnected(v17, v68, v69, v70);
      if (isConnected != objc_msgSend_isConnected(v21, v72, v73, v74))
      {
        char v63 = objc_msgSend_isConnected(v17, v75, v76, v77);
        goto LABEL_12;
      }
      int isLoginIMHandle = objc_msgSend_isLoginIMHandle(self, v75, v76, v77);
      int v83 = objc_msgSend_isLoginIMHandle(v10, v80, v81, v82);
      if (isLoginIMHandle && !v83)
      {
LABEL_17:
        LOBYTE(isMobile) = 0;
        goto LABEL_13;
      }
      if ((isLoginIMHandle | v83 ^ 1) == 1)
      {
        if (v186 <= 1) {
          unint64_t v86 = 1;
        }
        else {
          unint64_t v86 = v186;
        }
        if (v185 <= 1) {
          IMPersonStatus v87 = 1;
        }
        else {
          IMPersonStatus v87 = v185;
        }
        if (v86 == v87)
        {
          if (v4)
          {
            int isMobile = objc_msgSend_isMobile(self, (const char *)v87, v84, v85);
            if (isMobile != objc_msgSend_isMobile(v10, v88, v89, v90)) {
              goto LABEL_29;
            }
            int v94 = objc_msgSend_ID(self, v91, v92, v93);
            int isMobile = objc_msgSend__appearsToBePhoneNumber(v94, v95, v96, v97);

            uint64_t v101 = objc_msgSend_ID(v10, v98, v99, v100);
            int v105 = objc_msgSend__appearsToBePhoneNumber(v101, v102, v103, v104);

            if (isMobile != v105)
            {
LABEL_29:
              LOBYTE(isMobile) = isMobile ^ 1;
              goto LABEL_13;
            }
          }
          uint64_t v106 = objc_msgSend_capabilities(self, (const char *)v87, v84, v85);
          uint64_t v110 = objc_msgSend_capabilities(v10, v107, v108, v109);
          if (v106 != v110)
          {
            uint64_t v114 = 0x20000;
            uint64_t v115 = 8u;
            do
            {
              uint64_t v116 = v114 & v110;
              LOBYTE(isMobile) = (v114 & v106) == v114;
              if ((v114 & v106) == v114)
              {
                if (v116 != v114) {
                  goto LABEL_13;
                }
              }
              else if (v116 == v114)
              {
                goto LABEL_13;
              }
              uint64_t v114 = *(void *)((char *)&unk_1A4CD0BC0 + v115);
              v115 += 8;
            }
            while (v115 != 64);
          }
          int isBuddy = objc_msgSend_isBuddy(self, v111, v112, v113);
          if (isBuddy != objc_msgSend_isBuddy(v10, v118, v119, v120))
          {
            char v63 = objc_msgSend_isBuddy(self, v121, v122, v123);
            goto LABEL_12;
          }
          if (objc_msgSend_hasResource(v10, v121, v122, v123)
            && objc_msgSend_hasResource(self, v124, v125, v126))
          {
            uint64_t v130 = objc_msgSend_account(self, v127, v128, v129);
            uint64_t v134 = objc_msgSend_loginIMHandle(v130, v131, v132, v133);
            uint64_t v138 = objc_msgSend_server(v134, v135, v136, v137);

            if (objc_msgSend_length(v138, v139, v140, v141))
            {
              v145 = objc_msgSend_server(self, v142, v143, v144);
              int isMobile = objc_msgSend_isEqualToString_(v145, v146, (uint64_t)v138, v147);

              uint64_t v151 = objc_msgSend_server(v10, v148, v149, v150);
              int isEqualToString = objc_msgSend_isEqualToString_(v151, v152, (uint64_t)v138, v153);

              if (isMobile != isEqualToString)
              {

                goto LABEL_13;
              }
            }
          }
          if (IMPersonStatusIsOnline(v86) && IMPersonStatusIsOnline(v86))
          {
            uint64_t v158 = objc_msgSend_priority(v10, v155, v156, v157);
            int64_t priority = self->_priority;
            LOBYTE(isMobile) = priority > v158;
            if (priority != v158) {
              goto LABEL_13;
            }
          }
          v160 = objc_msgSend_account(self, v155, v156, v157);
          int isMobile = objc_msgSend_isConnected(v160, v161, v162, v163);

          uint64_t v167 = objc_msgSend_account(v10, v164, v165, v166);
          int v171 = objc_msgSend_isConnected(v167, v168, v169, v170);

          if (isMobile != v171) {
            goto LABEL_13;
          }
          objc_msgSend_timeSinceWentOffline(self, v172, v173, v174);
          double v176 = v175;
          objc_msgSend_timeSinceWentOffline(v10, v177, v178, v179);
          if (v176 != v182)
          {
            if (v176 >= 0.0 || v182 < 0.0)
            {
              BOOL v183 = v176 >= 0.0;
              if (v182 >= 0.0) {
                BOOL v183 = 0;
              }
              LOBYTE(isMobile) = v176 < v182 || v183;
              goto LABEL_13;
            }
            goto LABEL_17;
          }
          uint64_t v184 = objc_msgSend_compareIDs_(self, v180, (uint64_t)v10, v181);
          if (v184 != -1)
          {
            if (v184 != 1)
            {
              LOBYTE(isMobile) = v10 > self;
              goto LABEL_13;
            }
            goto LABEL_17;
          }
        }
        else if (v86 != 2 || v87 != 3)
        {
          LOBYTE(isMobile) = IMComparePersonStatus(v86, v87) == NSOrderedDescending;
          goto LABEL_13;
        }
      }
      LOBYTE(isMobile) = 1;
      goto LABEL_13;
    }
    LOBYTE(isMobile) = 0;
  }
  else
  {
    LOBYTE(isMobile) = 1;
  }
LABEL_14:

  return isMobile;
}

- (id)bestIMHandleForService:(id)a3
{
  return (id)objc_msgSend_bestIMHandleForAccount_onService_inGroup_otherThan_(self, a2, 0, (uint64_t)a3, 0, 0);
}

- (id)bestIMHandleForAccount:(id)a3
{
  return (id)objc_msgSend_bestIMHandleForAccount_onService_inGroup_otherThan_(self, a2, (uint64_t)a3, 0, 0, 0);
}

- (id)bestAccountSibling
{
  BOOL v4 = objc_msgSend_existingAccountSiblingsArray(self, a2, v2, v3);
  uint64_t v7 = objc_msgSend_bestIMHandleInArray_(IMHandle, v5, (uint64_t)v4, v6);

  return v7;
}

+ (id)bestIMHandleInArray:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v15, (uint64_t)v19, 16);
  if (v5)
  {
    uint64_t v8 = v5;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v3);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (!v9
          || objc_msgSend_isBetterThanIMHandle_(*(void **)(*((void *)&v15 + 1) + 8 * i), v6, (uint64_t)v9, v7))
        {
          id v13 = v12;

          uint64_t v9 = v13;
        }
      }
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v15, (uint64_t)v19, 16);
    }
    while (v8);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)bestIMHandleForAccount:(id)a3 onService:(id)a4 inGroup:(id)a5 otherThan:(id)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v49 = a6;
  if (v12 && !objc_msgSend_length(v12, v13, v14, v15))
  {

    id v12 = 0;
  }
  id v16 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v20 = objc_msgSend_siblings(self, v17, v18, v19);
  uint64_t v23 = objc_msgSend_initWithSet_(v16, v21, (uint64_t)v20, v22);

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v24 = v23;
  uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v50, (uint64_t)v54, 16);
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v48 = 0;
    id v28 = 0;
    uint64_t v29 = *(void *)v51;
    while (1)
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        uint64_t v31 = v28;
        if (*(void *)v51 != v29) {
          objc_enumerationMutation(v24);
        }
        id v28 = *(id *)(*((void *)&v50 + 1) + 8 * i);

        if (v11)
        {
          objc_msgSend_service(v28, v32, v33, v34);
          id v35 = (id)objc_claimAutoreleasedReturnValue();

          if (v35 != v11) {
            continue;
          }
        }
        if (v10)
        {
          objc_msgSend_account(v28, v32, v33, v34);
          id v36 = (id)objc_claimAutoreleasedReturnValue();

          if (v36 != v10) {
            continue;
          }
        }
        if (!v12)
        {
          if (v49 && v28 == v49) {
            continue;
          }
LABEL_25:
          if ((objc_msgSend_isLoginIMHandle(v28, v32, v33, v34, v48) & 1) == 0
            && objc_msgSend_isBetterThanIMHandle_(v28, v32, (uint64_t)v48, v44))
          {
            id v45 = v28;

            uint64_t v48 = v45;
          }
          continue;
        }
        uint64_t v37 = objc_msgSend_groupsArray(v28, v32, v33, v34);
        id v38 = v12;
        int v41 = objc_msgSend_containsObject_(v37, v39, (uint64_t)v12, v40);

        if (v49) {
          BOOL v42 = v28 == v49;
        }
        else {
          BOOL v42 = 0;
        }
        char v43 = v42;
        if (!v41)
        {
          id v12 = v38;
          continue;
        }
        id v12 = v38;
        if ((v43 & 1) == 0) {
          goto LABEL_25;
        }
      }
      uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v32, (uint64_t)&v50, (uint64_t)v54, 16);
      if (!v27)
      {

        uint64_t v46 = v48;
        goto LABEL_33;
      }
    }
  }
  uint64_t v46 = 0;
LABEL_33:

  return v46;
}

- (id)bestSibling
{
  if (self->_account
    && (objc_msgSend_sharedInstance(IMAccountController, a2, v2, v3),
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_accounts(v5, v6, v7, v8),
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        int v12 = objc_msgSend_containsObjectIdenticalTo_(v9, v10, (uint64_t)self->_account, v11),
        v9,
        v5,
        v12))
  {
    id v13 = objc_msgSend_bestIMHandleForAccount_onService_inGroup_otherThan_(self, a2, (uint64_t)self->_account, 0, 0, 0);
  }
  else
  {
    uint64_t v14 = objc_msgSend_service(self, a2, v2, v3);
    id v16 = objc_msgSend_bestIMHandleForAccount_onService_inGroup_otherThan_(self, v15, 0, (uint64_t)v14, 0, 0);

    if (v16)
    {
      id v18 = v16;
    }
    else
    {
      objc_msgSend_bestIMHandleForAccount_onService_inGroup_otherThan_(self, v17, 0, 0, 0, 0);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v13 = v18;
  }

  return v13;
}

- (void)_setExtraProperties:(id)a3
{
  uint64_t isEqual = (uint64_t)a3;
  uint64_t v6 = isEqual;
  extraProps = self->_extraProps;
  if (extraProps != (NSDictionary *)isEqual)
  {
    id v18 = (const char *)isEqual;
    uint64_t isEqual = objc_msgSend_isEqual_((void *)isEqual, (const char *)isEqual, (uint64_t)extraProps, v5);
    uint64_t v6 = (uint64_t)v18;
    if ((isEqual & 1) == 0)
    {
      id v10 = self->_extraProps;
      if (v10) {
        uint64_t v11 = (NSDictionary *)objc_msgSend_mutableCopy(v10, v18, v8, v9);
      }
      else {
        uint64_t v11 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      uint64_t v14 = v11;
      objc_msgSend_addEntriesFromDictionary_(v11, v12, (uint64_t)v18, v13);
      uint64_t v15 = self->_extraProps;
      self->_extraProps = v14;

      uint64_t isEqual = objc_msgSend_postNotificationName_(self, v16, @"__kIMHandleExtraPropertiesChangedNotification", v17);
      uint64_t v6 = (uint64_t)v18;
    }
  }

  MEMORY[0x1F41817F8](isEqual, v6);
}

- (void)propertiesChanged:(id)a3
{
  id v47 = a3;
  BOOL v7 = objc_msgSend_count(v47, v4, v5, v6) == 1;
  uint64_t v11 = v47;
  if (!v7
    || (objc_msgSend_objectForKey_(v47, v8, *MEMORY[0x1E4F6C5C8], v10),
        int v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        uint64_t v11 = v47,
        !v12))
  {
    if (!self->_blockNotifications)
    {
      objc_msgSend_beginNotificationQueue(self, v8, v9, v10);
      uint64_t v11 = v47;
    }
    uint64_t v13 = *MEMORY[0x1E4F6C598];
    uint64_t v14 = objc_msgSend_objectForKey_(v11, v8, *MEMORY[0x1E4F6C598], v10);

    if (v14)
    {
      id v18 = objc_msgSend_objectForKey_(v47, v15, v13, v17);
      uint64_t v22 = objc_msgSend_unsignedLongLongValue(v18, v19, v20, v21);
      objc_msgSend_setCapabilities_(self, v23, v22, v24);
    }
    if (!qword_1E965E900)
    {
      id v25 = objc_alloc(MEMORY[0x1E4F1C978]);
      uint64_t v26 = objc_msgSend_initWithObjects_(v25, (const char *)*MEMORY[0x1E4F6C588], *MEMORY[0x1E4F6C5C8], *MEMORY[0x1E4F6C5F0], *MEMORY[0x1E4F6C638], *MEMORY[0x1E4F6C628], *MEMORY[0x1E4F6C630], *MEMORY[0x1E4F6C5C0], *MEMORY[0x1E4F6C5E0], *MEMORY[0x1E4F6C5A8], v13, *MEMORY[0x1E4F6C600], *MEMORY[0x1E4F6C590], *MEMORY[0x1E4F6C5B0], *MEMORY[0x1E4F6C5B8], *MEMORY[0x1E4F6C588], *MEMORY[0x1E4F6C5F0], *MEMORY[0x1E4F6C618], *MEMORY[0x1E4F6C640],
              0);
      uint64_t v27 = (void *)qword_1E965E900;
      qword_1E965E900 = v26;
    }
    id v28 = objc_msgSend_mutableCopy(v47, v15, v16, v17);
    objc_msgSend_removeObjectsForKeys_(v28, v29, qword_1E965E900, v30);
    objc_msgSend__setExtraProperties_(self, v31, (uint64_t)v28, v32);
    id v35 = objc_msgSend_objectForKey_(v47, v33, *MEMORY[0x1E4F6C5D0], v34);
    self->_isAnonymous = objc_msgSend_intValue(v35, v36, v37, v38) != 0;

    if (!self->_blockNotifications)
    {
      objc_msgSend_releaseNotificationQueue(self, v39, v40, v41);
      if (!self->_notificationQueueCount)
      {
        id v45 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v42, v43, v44);
        objc_msgSend___mainThreadPostNotificationName_object_(v45, v46, @"__kIMBuddyPropertiesChangedDoneNotification", (uint64_t)self);
      }
    }

    uint64_t v11 = v47;
  }
}

- (BOOL)_isMyIDInList:(id)a3
{
  id v4 = a3;
  uint64_t v10 = objc_msgSend_count(v4, v5, v6, v7) - 1;
  do
  {
    uint64_t v11 = v10;
    if (v10 < 0) {
      break;
    }
    account = self->_account;
    id = self->_id;
    uint64_t v14 = objc_msgSend_objectAtIndex_(v4, v8, v10, v9);
    LODWORD(account) = objc_msgSend_equalID_andID_(account, v15, (uint64_t)id, (uint64_t)v14);

    uint64_t v10 = v11 - 1;
  }
  while (!account);

  return v11 >= 0;
}

- (BOOL)isVisiblyBlocked
{
  unint64_t v5 = objc_msgSend_status(self, a2, v2, v3);
  if (IMPersonStatusIsOnline(v5)) {
    return 0;
  }

  return objc_msgSend_isBlocked(self, v6, v7, v8);
}

- (BOOL)isBlocked
{
  id v4 = self;
  switch(objc_msgSend_blockingMode(self->_account, a2, v2, v3))
  {
    case 1u:
      LODWORD(v4) = objc_msgSend_isBuddy(v4, v5, v6, v7) ^ 1;
      break;
    case 2u:
      uint64_t v8 = objc_msgSend_allowList(v4->_account, v5, v6, v7);
      LODWORD(v4) = objc_msgSend__isMyIDInList_(v4, v9, (uint64_t)v8, v10) ^ 1;
      goto LABEL_6;
    case 3u:
      uint64_t v8 = objc_msgSend_blockList(v4->_account, v5, v6, v7);
      LOBYTE(v4) = objc_msgSend__isMyIDInList_(v4, v11, (uint64_t)v8, v12);
LABEL_6:

      break;
    case 4u:
      LOBYTE(v4) = 1;
      break;
    default:
      LOBYTE(v4) = 0;
      break;
  }
  return (char)v4;
}

- (void)setBlocked:(BOOL)a3
{
  BOOL v4 = a3;
  if (objc_msgSend_isBlocked(self, a2, a3, v3) != a3)
  {
    account = self->_account;
    objc_msgSend_ID(self, v6, v7, v8);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_blockMessages_fromID_(account, v10, v4, (uint64_t)v11);
  }
}

- (unsigned)sortOrderInGroup:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_length(v4, v5, v6, v7))
  {
    id v11 = objc_msgSend_account(self, v8, v9, v10);
    unsigned int v13 = objc_msgSend_sortOrderForIMHandle_inGroup_(v11, v12, (uint64_t)self, (uint64_t)v4);
  }
  else
  {
    unsigned int v13 = 0;
  }

  return v13;
}

- (NSString)accountTypeName
{
  id v4 = objc_msgSend_account(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_shortName(v4, v5, v6, v7);

  return (NSString *)v8;
}

- (NSString)resource
{
  unint64_t resourceIndex = self->_resourceIndex;
  if (resourceIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = objc_msgSend_substringFromIndex_(self->_id, a2, resourceIndex, v2);
  }

  return (NSString *)v4;
}

- (NSString)IDWithoutResource
{
  IDWithoutResource = self->_IDWithoutResource;
  if (!IDWithoutResource)
  {
    unint64_t resourceIndex = self->_resourceIndex;
    if (resourceIndex) {
      BOOL v6 = resourceIndex == 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      uint64_t v7 = self->_id;
    }
    else
    {
      objc_msgSend_substringToIndex_(self->_id, a2, resourceIndex - 1, v2);
      uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v8 = self->_IDWithoutResource;
    self->_IDWithoutResource = v7;

    IDWithoutResource = self->_IDWithoutResource;
  }
  uint64_t v9 = IDWithoutResource;

  return v9;
}

- (IMHandle)imHandleWithoutResource
{
  if (self->_resourceIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v5 = self;
  }
  else
  {
    BOOL v6 = objc_msgSend_account(self, a2, v2, v3);
    uint64_t v10 = objc_msgSend_IDWithoutResource(self, v7, v8, v9);
    objc_msgSend_imHandleWithID_(v6, v11, (uint64_t)v10, v12);
    unint64_t v5 = (IMHandle *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)existingIMHandleWithoutResource
{
  if (self->_resourceIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v5 = self;
  }
  else
  {
    BOOL v6 = objc_msgSend_account(self, a2, v2, v3);
    uint64_t v10 = objc_msgSend_IDWithoutResource(self, v7, v8, v9);
    objc_msgSend_existingIMHandleWithID_(v6, v11, (uint64_t)v10, v12);
    unint64_t v5 = (IMHandle *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)dependentIMHandles
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (self->_resourceIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v5 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, v2, v3);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v9 = objc_msgSend_arrayOfAllIMHandles(self->_account, v6, v7, v8, 0);
    uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v21, (uint64_t)v25, 16);
    if (v11)
    {
      uint64_t v15 = v11;
      uint64_t v16 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v9);
          }
          id v18 = *(IMHandle **)(*((void *)&v21 + 1) + 8 * i);
          if (v18 != self)
          {
            objc_msgSend_imHandleWithoutResource(*(void **)(*((void *)&v21 + 1) + 8 * i), v12, v13, v14);
            uint64_t v19 = (IMHandle *)objc_claimAutoreleasedReturnValue();

            if (v19 == self) {
              objc_msgSend_addObject_(v5, v12, (uint64_t)v18, v14);
            }
          }
        }
        uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v21, (uint64_t)v25, 16);
      }
      while (v15);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (void)_stopRetainingAccount:(id)a3
{
  self->_account = 0;
  MEMORY[0x1F41817F8]();
}

- (void)_updateStatusBasedOnAuthRequestStatus
{
  if (objc_msgSend_isLoginIMHandle(self, a2, v2, v3)) {
    return;
  }
  unint64_t v5 = sub_1A4C0ACE4();
  unsigned int authRequestStatus = self->_authRequestStatus;
  if (authRequestStatus == 2)
  {
    uint64_t v8 = @"Not authorized";
    goto LABEL_6;
  }
  if (authRequestStatus == 1)
  {
    uint64_t v8 = @"Waiting for authorization";
LABEL_6:
    id v11 = v5;
    uint64_t v9 = objc_msgSend_localizedStringForKey_value_table_(v5, v6, (uint64_t)v8, (uint64_t)&stru_1EF8E78C8, @"IMCoreLocalizable");
    objc_msgSend_setStatus_message_richMessage_(self, v10, 0, (uint64_t)v9, 0);

    unint64_t v5 = v11;
  }
}

- (void)setAuthRequestStatus:(unsigned int)a3
{
  if (self->_authRequestStatus != a3)
  {
    self->_unsigned int authRequestStatus = a3;
    objc_msgSend_postNotificationName_(self, a2, @"__kIMHandleInfoChangedNotification", v3);
  }

  MEMORY[0x1F4181798](self, sel__updateStatusBasedOnAuthRequestStatus, *(void *)&a3, v3);
}

- (unint64_t)status
{
  id v4 = objc_msgSend_account(self, a2, v2, v3);
  int isConnected = objc_msgSend_isConnected(v4, v5, v6, v7);

  if (isConnected) {
    return 5;
  }
  else {
    return 1;
  }
}

- (void)setPersonStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (void)statusChanged:(unint64_t)a3 message:(id)a4
{
}

- (void)statusMessageChanged:(id)a3
{
  id v9 = a3;
  uint64_t v7 = objc_msgSend_status(self, v4, v5, v6);
  objc_msgSend_setStatus_message_richMessage_(self, v8, v7, (uint64_t)v9, 0);
}

- (void)statusChanged:(unint64_t)a3
{
}

- (NSString)nameOfStatus
{
  id v4 = objc_msgSend_nameOfStatus_(IMHandle, a2, self->_status, v2);
  if (!objc_msgSend_status(self, v5, v6, v7))
  {
    id v11 = objc_msgSend_account(self, v8, v9, v10);
    uint64_t v15 = objc_msgSend_loginStatus(v11, v12, v13, v14);

    if (v15 != 4)
    {
      uint64_t v16 = sub_1A4C0ACE4();
      id v18 = objc_msgSend_localizedStringForKey_value_table_(v16, v17, @" (You are offline)", (uint64_t)&stru_1EF8E78C8, @"IMCoreLocalizable");
      uint64_t v21 = objc_msgSend_stringByAppendingString_(v4, v19, (uint64_t)v18, v20);

      id v4 = (void *)v21;
    }
  }

  return (NSString *)v4;
}

- (double)idleTime
{
  idleSince = self->_idleSince;
  if (!idleSince) {
    return 0.0;
  }
  objc_msgSend_timeIntervalSinceNow(idleSince, a2, v2, v3);
  return -v5;
}

- (int64_t)IDStatus
{
  return 0;
}

- (void)_setIDStatus:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_IDStatus != a3)
  {
    if (IMOSLoggingEnabled())
    {
      double v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        int64_t IDStatus = self->_IDStatus;
        int v7 = 138412802;
        uint64_t v8 = self;
        __int16 v9 = 1024;
        int v10 = IDStatus;
        __int16 v11 = 1024;
        int v12 = a3;
        _os_log_impl(&dword_1A4AF7000, v5, OS_LOG_TYPE_DEBUG, "Posting ID status change for: %@   from %d to %d", (uint8_t *)&v7, 0x18u);
      }
    }
    self->_int64_t IDStatus = a3;
  }
}

- (void)setIdleSince:(id)a3
{
  id v9 = a3;
  if ((IMSharedHelperAreObjectsLogicallySame() & 1) == 0)
  {
    int v7 = (NSDate *)objc_msgSend_copy(v9, v4, v5, v6);
    idleSince = self->_idleSince;
    self->_idleSince = v7;
  }
}

- (void)setFeedUpdatedDate:(id)a3
{
  id v13 = a3;
  if ((objc_msgSend_isEqualToDate_(v13, v4, (uint64_t)self->_feedUpdatedDate, v5) & 1) == 0)
  {
    id v9 = (NSDate *)objc_msgSend_copy(v13, v6, v7, v8);
    feedUpdatedDate = self->_feedUpdatedDate;
    self->_feedUpdatedDate = v9;

    objc_msgSend_postNotificationName_(self, v11, @"__kIMHandleFeedUpdatedDateChangedNotification", v12);
  }
}

- (NSString)offlineString
{
  if (objc_msgSend_status(self, a2, v2, v3) != 1 || (objc_msgSend_timeSinceWentOffline(self, v5, v6, v7), v8 < 0.0))
  {
    id v9 = 0;
    goto LABEL_23;
  }
  int v10 = sub_1A4C0ACE4();
  objc_msgSend_timeSinceStatusChanged(self, v11, v12, v13);
  int v16 = (int)(v15 / 60.0);
  uint64_t v17 = (v16 % 60);
  uint64_t v18 = (v16 / 60 % 24);
  if (v16 < 1440)
  {
    if (v18 == 1)
    {
      if ((int)v17 >= 2)
      {
        long long v52 = NSString;
        objc_msgSend_localizedStringForKey_value_table_(v10, v14, @"Logged out 1 hour %@ minutes ago", (uint64_t)&stru_1EF8E78C8, @"IMCoreLocalizable");
        goto LABEL_12;
      }
      objc_msgSend_localizedStringForKey_value_table_(v10, v14, @"Logged out 1 hour 1 minute ago", (uint64_t)&stru_1EF8E78C8, @"IMCoreLocalizable");
    }
    else
    {
      if (v18)
      {
        char v63 = NSString;
        if (v17 == 1)
        {
          uint64_t v64 = objc_msgSend_localizedStringForKey_value_table_(v10, v14, @"Logged out %@ hours 1 minute ago", (uint64_t)&stru_1EF8E78C8, @"IMCoreLocalizable");
          uint64_t v67 = objc_msgSend_numberWithInt_(NSNumber, v65, v18, v66);
          uint64_t v71 = objc_msgSend_localizedString(v67, v68, v69, v70);
          id v9 = objc_msgSend_stringWithFormat_(v63, v72, (uint64_t)v64, v73, v71);
        }
        else
        {
          uint64_t v64 = objc_msgSend_localizedStringForKey_value_table_(v10, v14, @"Logged out %@ hours %@ minutes ago", (uint64_t)&stru_1EF8E78C8, @"IMCoreLocalizable");
          uint64_t v67 = objc_msgSend_numberWithInt_(NSNumber, v74, v18, v75);
          uint64_t v71 = objc_msgSend_localizedString(v67, v76, v77, v78);
          uint64_t v81 = objc_msgSend_numberWithInt_(NSNumber, v79, v17, v80);
          uint64_t v85 = objc_msgSend_localizedString(v81, v82, v83, v84);
          id v9 = objc_msgSend_stringWithFormat_(v63, v86, (uint64_t)v64, v87, v71, v85);
        }
        goto LABEL_22;
      }
      if ((int)v17 >= 2)
      {
        long long v52 = NSString;
        objc_msgSend_localizedStringForKey_value_table_(v10, v14, @"Logged out %@ minutes ago", (uint64_t)&stru_1EF8E78C8, @"IMCoreLocalizable");
        long long v53 = LABEL_12:;
        uint64_t v56 = objc_msgSend_numberWithInt_(NSNumber, v54, v17, v55);
        uint64_t v60 = objc_msgSend_localizedString(v56, v57, v58, v59);
        id v9 = objc_msgSend_stringWithFormat_(v52, v61, (uint64_t)v53, v62, v60);

        goto LABEL_22;
      }
      if (v17 == 1) {
        objc_msgSend_localizedStringForKey_value_table_(v10, v14, @"Logged out 1 minute ago", (uint64_t)&stru_1EF8E78C8, @"IMCoreLocalizable");
      }
      else {
        objc_msgSend_localizedStringForKey_value_table_(v10, v14, @"Logged out under a minute ago", (uint64_t)&stru_1EF8E78C8, @"IMCoreLocalizable");
      }
    id v9 = };
    goto LABEL_22;
  }
  signed int v19 = -(v16 / 0x5A0u);
  id v20 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  objc_msgSend_setDay_(v20, v21, v19, v22);
  objc_msgSend_setHour_(v20, v23, -(int)v18, v24);
  objc_msgSend_setMinute_(v20, v25, -(int)v17, v26);
  uint64_t v30 = objc_msgSend_currentCalendar(MEMORY[0x1E4F1C9A8], v27, v28, v29);
  uint64_t v34 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v31, v32, v33);
  id v36 = objc_msgSend_dateByAddingComponents_toDate_options_(v30, v35, (uint64_t)v20, (uint64_t)v34, 0);

  id v37 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  objc_msgSend_setFormatterBehavior_(v37, v38, 1040, v39);
  objc_msgSend_setDateStyle_(v37, v40, 2, v41);
  objc_msgSend_setTimeStyle_(v37, v42, 1, v43);
  uint64_t v46 = objc_msgSend_stringFromDate_(v37, v44, (uint64_t)v36, v45);
  id v47 = NSString;
  id v49 = objc_msgSend_localizedStringForKey_value_table_(v10, v48, @"Logged out %@", (uint64_t)&stru_1EF8E78C8, @"IMCoreLocalizable");
  id v9 = objc_msgSend_stringWithFormat_(v47, v50, (uint64_t)v49, v51, v46);

LABEL_22:
LABEL_23:

  return (NSString *)v9;
}

- (NSString)idleString
{
  uint64_t v5 = objc_msgSend_status(self, a2, v2, v3);
  objc_msgSend_idleTime(self, v6, v7, v8);
  if (v9 <= 0.0 && v5 != 2)
  {
    id v21 = 0;
    goto LABEL_10;
  }
  double v11 = v9;
  uint64_t v12 = sub_1A4C0ACE4();
  double v15 = objc_msgSend_nameOfStatus_(IMHandle, v13, 2, v14);
  uint64_t v17 = v15;
  if (v11 > 0.0
    && (int v18 = (int)(v11 / 60.0), v19 = (v18 % 60), v20 = v18 / 60 % 24, v20 | v19))
  {
    if (v18 >= 1440)
    {
      id v23 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
      objc_msgSend_setDay_(v23, v24, (int)(((int)(((unint64_t)(1240768329 * v18) >> 32) - v18) >> 10)+ ((((unint64_t)(1240768329 * v18) >> 32) - v18) >> 31)), v25);
      objc_msgSend_setHour_(v23, v26, -v20, v27);
      objc_msgSend_setMinute_(v23, v28, -(int)v19, v29);
      uint64_t v33 = objc_msgSend_currentCalendar(MEMORY[0x1E4F1C9A8], v30, v31, v32);
      id v37 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v34, v35, v36);
      uint64_t v39 = objc_msgSend_dateByAddingComponents_toDate_options_(v33, v38, (uint64_t)v23, (uint64_t)v37, 0);

      if (v18 >> 5 < 0x13B)
      {
        if (!qword_1E965E910)
        {
          id v71 = objc_alloc_init(MEMORY[0x1E4F28C10]);
          uint64_t v72 = (void *)qword_1E965E910;
          qword_1E965E910 = (uint64_t)v71;

          objc_msgSend_setFormatterBehavior_((void *)qword_1E965E910, v73, 1040, v74);
          objc_msgSend_setDateStyle_((void *)qword_1E965E910, v75, 0, v76);
          objc_msgSend_setTimeStyle_((void *)qword_1E965E910, v77, 1, v78);
        }
        if (!qword_1E965E918)
        {
          id v79 = objc_alloc_init(MEMORY[0x1E4F28C10]);
          uint64_t v80 = (void *)qword_1E965E918;
          qword_1E965E918 = (uint64_t)v79;

          objc_msgSend_setFormatterBehavior_((void *)qword_1E965E918, v81, 1040, v82);
          objc_msgSend_setDateStyle_((void *)qword_1E965E918, v83, 0, v84);
          objc_msgSend_setTimeStyle_((void *)qword_1E965E918, v85, 1, v86);
          objc_msgSend_setDateFormat_((void *)qword_1E965E918, v87, @"EEE", v88);
        }
        uint64_t v89 = objc_msgSend_stringFromDate_((void *)qword_1E965E910, v40, (uint64_t)v39, v41);
        uint64_t v92 = objc_msgSend_stringFromDate_((void *)qword_1E965E918, v90, (uint64_t)v39, v91);
        long long v52 = objc_msgSend_stringWithFormat_(NSString, v93, @"%@ %@", v94, v92, v89);
      }
      else
      {
        BOOL v42 = (void *)qword_1E965E908;
        if (!qword_1E965E908)
        {
          id v43 = objc_alloc_init(MEMORY[0x1E4F28C10]);
          uint64_t v44 = (void *)qword_1E965E908;
          qword_1E965E908 = (uint64_t)v43;

          objc_msgSend_setFormatterBehavior_((void *)qword_1E965E908, v45, 1040, v46);
          objc_msgSend_setDateStyle_((void *)qword_1E965E908, v47, 2, v48);
          objc_msgSend_setTimeStyle_((void *)qword_1E965E908, v49, 1, v50);
          BOOL v42 = (void *)qword_1E965E908;
        }
        long long v52 = objc_msgSend_stringFromDate_(v42, v40, (uint64_t)v39, v41);
      }
      uint64_t v95 = NSString;
      uint64_t v96 = objc_msgSend_localizedStringForKey_value_table_(v12, v51, @"%@ (Since %@)", (uint64_t)&stru_1EF8E78C8, @"IMCoreLocalizable");
      objc_msgSend_stringWithFormat_(v95, v97, (uint64_t)v96, v98, v17, v52);
      id v21 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
    long long v53 = NSString;
    if (v20)
    {
      if (!v19)
      {
        uint64_t v108 = objc_msgSend_localizedStringForKey_value_table_(v12, v16, @"%@ (%@ h)", (uint64_t)&stru_1EF8E78C8, @"IMCoreLocalizable");
        v111 = objc_msgSend_numberWithInt_(NSNumber, v109, (v18 / 60 % 24), v110);
        uint64_t v115 = objc_msgSend_localizedString(v111, v112, v113, v114);
        objc_msgSend_stringWithFormat_(v53, v116, (uint64_t)v108, v117, v17, v115);
        id v21 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
      uint64_t v54 = objc_msgSend_localizedStringForKey_value_table_(v12, v16, @"%@ (%@ h %@ min)", (uint64_t)&stru_1EF8E78C8, @"IMCoreLocalizable");
      uint64_t v57 = objc_msgSend_numberWithInt_(NSNumber, v55, (v18 / 60 % 24), v56);
      uint64_t v61 = objc_msgSend_localizedString(v57, v58, v59, v60);
      uint64_t v64 = objc_msgSend_numberWithInt_(NSNumber, v62, v19, v63);
      char v68 = objc_msgSend_localizedString(v64, v65, v66, v67);
      objc_msgSend_stringWithFormat_(v53, v69, (uint64_t)v54, v70, v17, v61, v68);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v54 = objc_msgSend_localizedStringForKey_value_table_(v12, v16, @"%@ (%@ min)", (uint64_t)&stru_1EF8E78C8, @"IMCoreLocalizable");
      uint64_t v101 = objc_msgSend_numberWithInt_(NSNumber, v99, (v18 % 60), v100);
      int v105 = objc_msgSend_localizedString(v101, v102, v103, v104);
      objc_msgSend_stringWithFormat_(v53, v106, (uint64_t)v54, v107, v17, v105);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v21 = v15;
  }
LABEL_9:

LABEL_10:

  return (NSString *)v21;
}

- (void)_filterStatusMessage
{
  if (!self->_processedStatusMsg)
  {
    statusMsg = self->_statusMsg;
    if (statusMsg)
    {
      if (objc_msgSend_rangeOfString_(statusMsg, a2, @"%n", v2) == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v8 = (NSString *)objc_msgSend_copy(self->_statusMsg, v5, v6, v7);
        processedStatusMsg = self->_processedStatusMsg;
        self->_processedStatusMsg = v8;
      }
      else
      {
        id v10 = objc_alloc(MEMORY[0x1E4F28E78]);
        uint64_t v31 = objc_msgSend_initWithString_(v10, v11, (uint64_t)self->_statusMsg, v12);
        int v16 = objc_msgSend_me(IMMe, v13, v14, v15);
        int v20 = objc_msgSend_fullName(v16, v17, v18, v19);
        uint64_t v24 = objc_msgSend_length(v31, v21, v22, v23);
        objc_msgSend_replaceOccurrencesOfString_withString_options_range_(v31, v25, @"%n", (uint64_t)v20, 2, 0, v24);

        uint64_t v29 = (NSString *)objc_msgSend_copy(v31, v26, v27, v28);
        uint64_t v30 = self->_processedStatusMsg;
        self->_processedStatusMsg = v29;

        processedStatusMsg = (NSString *)v31;
      }
      MEMORY[0x1F41817F8](v8, processedStatusMsg);
    }
  }
}

- (NSString)statusMessage
{
  processedStatusMsg = self->_processedStatusMsg;
  if (!processedStatusMsg)
  {
    objc_msgSend__filterStatusMessage(self, a2, v2, v3);
    processedStatusMsg = self->_processedStatusMsg;
  }

  return processedStatusMsg;
}

- (void)setStatus:(unint64_t)a3 message:(id)a4 richMessage:(id)a5
{
  id v59 = a4;
  id v10 = a5;
  if (v59 && (v10 || (objc_msgSend_isEqualToString_(v59, v8, (uint64_t)self->_statusMsg, v9) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_prevStatusMsg, self->_statusMsg);
    uint64_t v33 = (NSString *)objc_msgSend_copy(v59, v30, v31, v32);
    statusMsg = self->_statusMsg;
    self->_statusMsg = v33;

    processedStatusMsg = self->_processedStatusMsg;
    self->_processedStatusMsg = 0;

    uint64_t v39 = (NSAttributedString *)objc_msgSend_copy(v10, v36, v37, v38);
    richStatusMsg = self->_richStatusMsg;
    self->_richStatusMsg = v39;

    if (a3 == 3)
    {
      uint64_t v41 = objc_msgSend_trimmedString(self->_statusMsg, v18, v19, v20);
      uint64_t v45 = objc_msgSend_length(v41, v42, v43, v44);

      if (!v45)
      {
        uint64_t v26 = sub_1A4C0ACE4();
        uint64_t v29 = objc_msgSend_localizedStringForKey_value_table_(v26, v46, @"Away", (uint64_t)&stru_1EF8E78C8, @"IMCoreLocalizable");
        uint64_t v50 = (NSString *)objc_msgSend_copy(v29, v47, v48, v49);
        uint64_t v51 = self->_statusMsg;
        self->_statusMsg = v50;

        goto LABEL_11;
      }
    }
  }
  else
  {
    if (self->_status == a3) {
      goto LABEL_22;
    }
    double v11 = self->_processedStatusMsg;
    self->_processedStatusMsg = 0;

    uint64_t v12 = self->_richStatusMsg;
    self->_richStatusMsg = 0;

    int v16 = (NSString *)objc_msgSend_copy(self->_statusMsg, v13, v14, v15);
    prevStatusMsg = self->_prevStatusMsg;
    self->_prevStatusMsg = v16;

    if (a3 == 3)
    {
      id v21 = objc_msgSend_trimmedString(self->_statusMsg, v18, v19, v20);
      uint64_t v25 = objc_msgSend_length(v21, v22, v23, v24);

      if (!v25)
      {
        uint64_t v26 = sub_1A4C0ACE4();
        objc_msgSend_localizedStringForKey_value_table_(v26, v27, @"Away", (uint64_t)&stru_1EF8E78C8, @"IMCoreLocalizable");
        uint64_t v28 = (NSString *)objc_claimAutoreleasedReturnValue();
        uint64_t v29 = self->_statusMsg;
        self->_statusMsg = v28;
LABEL_11:
      }
    }
  }
  objc_msgSend__clearStatusMessageURLCache(self, v18, v19, v20);
  unint64_t status = self->_status;
  if (status != a3)
  {
    self->_unint64_t status = a3;
    self->_prevStatus = status;
  }
  long long v53 = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  whenStatusChanged = self->_whenStatusChanged;
  self->_whenStatusChanged = v53;

  if (IMPersonStatusIsOnline(self->_prevStatus) && !IMPersonStatusIsOnline(self->_status))
  {
    uint64_t v58 = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    whenWentOffline = self->_whenWentOffline;
    self->_whenWentOffline = v58;
  }
  else
  {
    if (!IMPersonStatusIsOnline(self->_status)) {
      goto LABEL_21;
    }
    whenWentOffline = self->_whenWentOffline;
    if (!whenWentOffline) {
      goto LABEL_21;
    }
    self->_whenWentOffline = 0;
  }

LABEL_21:
  objc_msgSend_postNotificationName_(self, v55, @"__kIMHandleStatusChangedNotification", v56);
LABEL_22:
}

- (double)timeSinceWentOffline
{
  whenWentOffline = self->_whenWentOffline;
  if (!whenWentOffline) {
    return -1.0;
  }
  objc_msgSend_timeIntervalSinceNow(whenWentOffline, a2, v2, v3);
  return -v5;
}

- (double)timeSinceStatusChanged
{
  whenStatusChanged = self->_whenStatusChanged;
  if (!whenStatusChanged) {
    return 99999.0;
  }
  objc_msgSend_timeIntervalSinceNow(whenStatusChanged, a2, v2, v3);
  return -v5;
}

- (int64_t)offGridMode
{
  double v5 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E7B0], a2, v2, v3);
  int64_t v8 = objc_msgSend_offGridModeForHandle_(v5, v6, (uint64_t)self, v7);

  return v8;
}

- (void)autoInviteToViewOffGridModeIfNeededFromHandleID:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v8 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v5, v6, v7);
  int isCarrierPigeonEnabled = objc_msgSend_isCarrierPigeonEnabled(v8, v9, v10, v11);

  if (isCarrierPigeonEnabled)
  {
    if (objc_msgSend_matchesLoginHandleForAnyAccount(self, v13, v14, v15))
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A4AF7000, v19, OS_LOG_TYPE_DEBUG, "Not auto sharing off grid mode with myself", buf, 2u);
        }
LABEL_16:
      }
    }
    else if (objc_msgSend_isContact(self, v16, v17, v18))
    {
      uint64_t v23 = objc_msgSend_normalizedID(self, v20, v21, v22);
      if (IMOSLoggingEnabled())
      {
        uint64_t v27 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v33 = v23;
          __int16 v34 = 2112;
          id v35 = v4;
          _os_log_impl(&dword_1A4AF7000, v27, OS_LOG_TYPE_DEBUG, "Requesting to share personal off grid mode with handle: %@ fromHandle: %@", buf, 0x16u);
        }
      }
      uint64_t v28 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E8D0], v24, v25, v26);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = sub_1A4BB459C;
      v30[3] = &unk_1E5B7CE50;
      v30[4] = self;
      id v31 = v4;
      objc_msgSend_attemptIfNecessaryToAutomaticallyShareOffGridModeWithHandleID_fromHandleID_completion_(v28, v29, (uint64_t)v23, (uint64_t)v31, v30);
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AF7000, v19, OS_LOG_TYPE_DEBUG, "Not auto sharing off grid mode with non contact", buf, 2u);
      }
      goto LABEL_16;
    }
  }
}

- (int64_t)availability
{
  double v5 = objc_msgSend_sharedInstance(IMHandleAvailabilityManager, a2, v2, v3);
  int64_t v8 = objc_msgSend_availabilityForHandle_(v5, v6, (uint64_t)self, v7);

  return v8;
}

- (NSDate)availabilityStatusPublishedDate
{
  double v5 = objc_msgSend_sharedInstance(IMHandleAvailabilityManager, a2, v2, v3);
  int64_t v8 = objc_msgSend_availabilityStatusPublishedDateForHandle_(v5, v6, (uint64_t)self, v7);

  return (NSDate *)v8;
}

- (id)beginObservingAvailability
{
  double v5 = objc_msgSend_sharedInstance(IMHandleStatusManager, a2, v2, v3);
  int64_t v8 = objc_msgSend_acquireObservationAssertionForHandle_(v5, v6, (uint64_t)self, v7);

  return v8;
}

- (void)isInvitedToViewMyFocusStatusFromHandleID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend_normalizedID(self, v8, v9, v10);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E600], v11, v12, v13);
  objc_msgSend_isFocusStatusSharedWithHandleID_fromHandleID_completion_(v14, v15, (uint64_t)v16, (uint64_t)v7, v6);
}

- (void)autoInviteToViewAvailabilityIfNeededFromHandleID:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_matchesLoginHandleForAnyAccount(self, v5, v6, v7))
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_DEBUG, "Not auto sharing availability with myself", buf, 2u);
      }
LABEL_15:
    }
  }
  else if (objc_msgSend_isContact(self, v8, v9, v10))
  {
    uint64_t v15 = objc_msgSend_normalizedID(self, v12, v13, v14);
    if (IMOSLoggingEnabled())
    {
      uint64_t v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v25 = v15;
        __int16 v26 = 2112;
        id v27 = v4;
        _os_log_impl(&dword_1A4AF7000, v19, OS_LOG_TYPE_DEBUG, "Requesting to share personal availability with handle: %@ fromHandle: %@", buf, 0x16u);
      }
    }
    uint64_t v20 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E600], v16, v17, v18);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_1A4BB4B1C;
    v22[3] = &unk_1E5B7CE78;
    v22[4] = self;
    id v23 = v4;
    objc_msgSend_attemptIfNeccessaryToAutomaticallyShareFocusStatusWithHandleID_fromHandleID_completion_(v20, v21, (uint64_t)v15, (uint64_t)v23, v22);
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_DEBUG, "Not auto sharing availability with non contact", buf, 2u);
    }
    goto LABEL_15;
  }
}

- (id)_nameForComparisonPreferFirst:(BOOL)a3
{
  BOOL v4 = a3;
  uint64_t v6 = objc_msgSend_uniqueName(self, a2, a3, v3);
  if (objc_msgSend_length(v6, v7, v8, v9))
  {
    id v13 = v6;
    goto LABEL_13;
  }
  if (!v4)
  {
    uint64_t v14 = objc_msgSend_lastName(self, v10, v11, v12);
    if (!objc_msgSend_length(v14, v22, v23, v24))
    {
      uint64_t v21 = objc_msgSend_firstName(self, v25, v26, v27);
      goto LABEL_9;
    }
LABEL_7:
    id v28 = v14;
    goto LABEL_11;
  }
  uint64_t v14 = objc_msgSend_firstName(self, v10, v11, v12);
  if (objc_msgSend_length(v14, v15, v16, v17)) {
    goto LABEL_7;
  }
  uint64_t v21 = objc_msgSend_lastName(self, v18, v19, v20);
LABEL_9:
  uint64_t v29 = (void *)v21;

  if (!objc_msgSend_length(v29, v30, v31, v32))
  {
    objc_msgSend_name(self, v33, v34, v35);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  id v28 = v29;
LABEL_11:
  id v13 = v28;
  uint64_t v29 = v28;
LABEL_12:

LABEL_13:

  return v13;
}

- (int64_t)compareFirstNames:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend__nameForComparisonPreferFirst_(self, v5, 1, v6);
  uint64_t v10 = objc_msgSend__nameForComparisonPreferFirst_(v4, v8, 1, v9);

  int64_t v13 = objc_msgSend_localizedCompareToString_(v7, v11, (uint64_t)v10, v12);
  return v13;
}

- (int64_t)compareLastNames:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend__nameForComparisonPreferFirst_(self, v5, 0, v6);
  uint64_t v10 = objc_msgSend__nameForComparisonPreferFirst_(v4, v8, 0, v9);

  int64_t v13 = objc_msgSend_localizedCompareToString_(v7, v11, (uint64_t)v10, v12);
  return v13;
}

- (int64_t)compareStatus:(id)a3
{
  id v4 = a3;
  IMPersonStatus v8 = objc_msgSend_status(self, v5, v6, v7);
  IMPersonStatus v12 = objc_msgSend_status(v4, v9, v10, v11);
  int64_t v15 = IMComparePersonStatus(v8, v12);
  if (!v15) {
    int64_t v15 = objc_msgSend_compareIDs_(self, v13, (uint64_t)v4, v14);
  }

  return v15;
}

- (int64_t)compareIDs:(id)a3
{
  id v4 = a3;
  IMPersonStatus v8 = objc_msgSend_ID(self, v5, v6, v7);
  IMPersonStatus v12 = objc_msgSend_ID(v4, v9, v10, v11);
  if (objc_msgSend__appearsToBePhoneNumber(v8, v13, v14, v15)
    && objc_msgSend__appearsToBePhoneNumber(v12, v16, v17, v18))
  {
    uint64_t v20 = objc_msgSend_service(v4, v16, v19, v18);
    if (objc_msgSend__wantsInternationizedNumbers(v20, v21, v22, v23))
    {
      uint64_t v27 = objc_msgSend_service(self, v24, v25, v26);
      char v31 = objc_msgSend__wantsInternationizedNumbers(v27, v28, v29, v30);

      if (v31) {
        goto LABEL_8;
      }
    }
    else
    {
    }
    uint64_t v33 = objc_msgSend_countryCode(self, v16, v32, v18);
    uint64_t v34 = IMInternationalForPhoneNumberWithOptions();

    uint64_t v38 = objc_msgSend_countryCode(self, v35, v36, v37);
    uint64_t v39 = IMInternationalForPhoneNumberWithOptions();

    IMPersonStatus v8 = (void *)v34;
    IMPersonStatus v12 = (void *)v39;
  }
LABEL_8:
  int64_t v40 = objc_msgSend_caseInsensitiveCompare_(v8, v16, (uint64_t)v12, v18);

  return v40;
}

- (int64_t)compareNormalizedIDs:(id)a3
{
  id v4 = a3;
  IMPersonStatus v8 = objc_msgSend_normalizedID(self, v5, v6, v7);
  IMPersonStatus v12 = objc_msgSend_normalizedID(v4, v9, v10, v11);

  int64_t v15 = objc_msgSend_localizedCaseInsensitiveCompare_(v8, v13, (uint64_t)v12, v14);
  return v15;
}

- (int64_t)compareAccountNames:(id)a3
{
  id v4 = a3;
  IMPersonStatus v8 = objc_msgSend_account(self, v5, v6, v7);
  IMPersonStatus v12 = objc_msgSend_accountDescription(v8, v9, v10, v11);
  uint64_t v16 = objc_msgSend_account(v4, v13, v14, v15);

  uint64_t v20 = objc_msgSend_accountDescription(v16, v17, v18, v19);
  int64_t v23 = objc_msgSend_localizedCompareToString_(v12, v21, (uint64_t)v20, v22);

  return v23;
}

- (BOOL)hasOtherSiblings
{
  id v4 = objc_msgSend_siblings(self, a2, v2, v3);
  BOOL v8 = (unint64_t)objc_msgSend_count(v4, v5, v6, v7) > 1;

  return v8;
}

- (NSArray)siblingsArray
{
  id v4 = objc_msgSend_siblings(self, a2, v2, v3);
  BOOL v8 = objc_msgSend_allObjects(v4, v5, v6, v7);

  return (NSArray *)v8;
}

+ (id)filterIMHandlesForAccountSiblings:(id)a3 onAccount:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v8 = a4;
  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v10 = v5;
    uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v37, (uint64_t)v41, 16);
    if (v12)
    {
      uint64_t v13 = v12;
      id v14 = 0;
      uint64_t v15 = *(void *)v38;
      do
      {
        uint64_t v16 = 0;
        uint64_t v17 = v14;
        do
        {
          if (*(void *)v38 != v15) {
            objc_enumerationMutation(v10);
          }
          id v14 = *(id *)(*((void *)&v37 + 1) + 8 * v16);

          uint64_t v21 = objc_msgSend_service(v14, v18, v19, v20, (void)v37);
          uint64_t v25 = objc_msgSend_service(v8, v22, v23, v24);

          if (v21 == v25)
          {
            uint64_t v29 = objc_msgSend_ID(v14, v26, v27, v28);
            char v31 = objc_msgSend_imHandleWithID_alreadyCanonical_(v8, v30, (uint64_t)v29, 1);

            if (v31 && (objc_msgSend_containsObjectIdenticalTo_(v9, v32, (uint64_t)v31, v33) & 1) == 0) {
              objc_msgSend_addObject_(v9, v34, (uint64_t)v31, v35);
            }
          }
          ++v16;
          uint64_t v17 = v14;
        }
        while (v13 != v16);
        uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v26, (uint64_t)&v37, (uint64_t)v41, 16);
      }
      while (v13);
    }
  }
  else
  {
    objc_msgSend_filterIMHandlesForBestAccountSiblings_(IMHandle, v6, (uint64_t)v5, v7);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (id)filterIMHandlesForBestAccountSiblings:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = v3;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v20, (uint64_t)v24, 16);
  if (v7)
  {
    uint64_t v11 = v7;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v5);
        }
        id v14 = objc_msgSend_bestAccountSibling(*(void **)(*((void *)&v20 + 1) + 8 * i), v8, v9, v10, (void)v20);
        if ((objc_msgSend_containsObjectIdenticalTo_(v4, v15, (uint64_t)v14, v16) & 1) == 0) {
          objc_msgSend_addObject_(v4, v17, (uint64_t)v14, v18);
        }
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v20, (uint64_t)v24, 16);
    }
    while (v11);
  }

  return v4;
}

- (NSArray)existingAccountSiblingsArray
{
  id v5 = objc_msgSend_sharedInstance(IMHandleRegistrar, a2, v2, v3);
  id v8 = objc_msgSend__existingAccountSiblingsForHandle_(v5, v6, (uint64_t)self, v7);

  return (NSArray *)v8;
}

- (NSArray)accountSiblingsArray
{
  id v5 = objc_msgSend_sharedInstance(IMHandleRegistrar, a2, v2, v3);
  id v8 = objc_msgSend__accountSiblingsForHandle_(v5, v6, (uint64_t)self, v7);

  return (NSArray *)v8;
}

- (id)chatSiblingsArray
{
  id v5 = objc_msgSend_sharedInstance(IMHandleRegistrar, a2, v2, v3);
  id v8 = objc_msgSend__chatSiblingsForHandle_(v5, v6, (uint64_t)self, v7);

  return v8;
}

- (NSSet)siblings
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v7 = objc_msgSend_sharedInstance(IMHandleRegistrar, v4, v5, v6);
  uint64_t v10 = objc_msgSend_siblingsForIMHandle_(v7, v8, (uint64_t)self, v9);

  if (objc_msgSend_count(v10, v11, v12, v13)) {
    objc_msgSend_unionSet_(v3, v14, (uint64_t)v10, v16);
  }
  uint64_t v17 = objc_msgSend_accountSiblingsArray(self, v14, v15, v16);
  if (objc_msgSend_count(v17, v18, v19, v20)) {
    objc_msgSend_addObjectsFromArray_(v3, v21, (uint64_t)v17, v23);
  }
  uint64_t v24 = objc_msgSend_chatSiblingsArray(self, v21, v22, v23);
  if (objc_msgSend_count(v24, v25, v26, v27)) {
    objc_msgSend_addObjectsFromArray_(v3, v28, (uint64_t)v24, v29);
  }

  return (NSSet *)v3;
}

- (BOOL)isAccountSiblingOf:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_accountSiblingsArray(self, v5, v6, v7);
  char v11 = objc_msgSend_containsObjectIdenticalTo_(v8, v9, (uint64_t)v4, v10);

  return v11;
}

- (BOOL)isSiblingOf:(id)a3
{
  uint64_t v7 = (IMHandle *)a3;
  if (v7 == self)
  {
    BOOL v15 = 1;
  }
  else
  {
    id v8 = objc_msgSend_siblings(self, v4, v5, v6);
    if (objc_msgSend_count(v8, v9, v10, v11) == 1)
    {
      BOOL v15 = 0;
    }
    else
    {
      uint64_t v16 = objc_msgSend_service(v7, v12, v13, v14);
      uint64_t v20 = objc_msgSend_service(self, v17, v18, v19);

      if (v16 == v20
        && (objc_msgSend_ID(v7, v21, v22, v23),
            uint64_t v24 = objc_claimAutoreleasedReturnValue(),
            objc_msgSend_ID(self, v25, v26, v27),
            uint64_t v28 = objc_claimAutoreleasedReturnValue(),
            char isEqualToString = objc_msgSend_isEqualToString_(v24, v29, (uint64_t)v28, v30),
            v28,
            v24,
            (isEqualToString & 1) != 0))
      {
        BOOL v15 = 1;
      }
      else
      {
        uint64_t v32 = objc_msgSend_member_(v8, v21, (uint64_t)v7, v23);
        BOOL v15 = v32 != 0;
      }
    }
  }
  return v15;
}

- (BOOL)_isChatSiblingOf:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_ID(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_ID(self, v9, v10, v11);
  if (objc_msgSend_isEqualToString_(v8, v13, (uint64_t)v12, v14))
  {
    char isEqualToString = 1;
  }
  else
  {
    uint64_t v19 = objc_msgSend__contactID(v4, v15, v16, v17);
    uint64_t v23 = objc_msgSend__contactID(self, v20, v21, v22);
    char isEqualToString = objc_msgSend_isEqualToString_(v19, v24, (uint64_t)v23, v25);
  }
  return isEqualToString;
}

- (id)_contactID
{
  id v3 = objc_msgSend_cnContactWithKeys_(self, a2, MEMORY[0x1E4F1CBF0], v2);
  uint64_t v7 = objc_msgSend_identifier(v3, v4, v5, v6);

  return v7;
}

- (id)_chatSiblings
{
  id v4 = objc_msgSend_chatSiblingsArray(self, a2, v2, v3);
  if (objc_msgSend_count(v4, v5, v6, v7))
  {
    uint64_t v10 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v8, (uint64_t)v4, v9);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)_bestChatSibling
{
  id v4 = objc_msgSend__chatSiblingsArray(self, a2, v2, v3);
  uint64_t v7 = objc_msgSend_bestIMHandleInArray_(IMHandle, v5, (uint64_t)v4, v6);

  return v7;
}

- (unint64_t)capabilities
{
  uint64_t v5 = objc_msgSend_loginIMHandle(self->_account, a2, v2, v3);
  objc_msgSend_isConnected(self->_account, v6, v7, v8);
  unint64_t capabilities = self->_capabilities;
  objc_msgSend_defaultHandleCapabilities(self->_account, v10, v11, v12);

  return capabilities;
}

- (void)setCapabilities:(unint64_t)a3
{
  unint64_t capabilities = self->_capabilities;
  if (objc_msgSend__setCapabilities_(self, a2, a3, v3))
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
    objc_msgSend_numberWithLongLong_(NSNumber, v6, capabilities, v7);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = objc_msgSend_dictionaryWithObject_forKey_(v8, v9, (uint64_t)v12, @"__kIMHandleCapabilitiesUserInfoOldCapsKey");
    objc_msgSend__postNotificationName_userInfo_(self, v11, @"__kIMHandleCapabilitiesChangedNotification", (uint64_t)v10);
  }
}

- (BOOL)_setCapabilities:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unint64_t capabilities = self->_capabilities;
  if (capabilities != a3)
  {
    self->_unint64_t capabilities = a3;
    if (IMOSLoggingEnabled())
    {
      uint64_t v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v7 = _IMStringFromFZCapabilities();
        int v9 = 138412546;
        uint64_t v10 = self;
        __int16 v11 = 2112;
        id v12 = v7;
        _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_DEBUG, "%@ capabilities changed: %@", (uint8_t *)&v9, 0x16u);
      }
    }
  }
  return capabilities != a3;
}

- (BOOL)hasCapability:(unint64_t)a3
{
  uint64_t v6 = objc_msgSend_ID(self, a2, a3, v3);
  int v10 = objc_msgSend__appearsToBePhoneNumber(v6, v7, v8, v9);

  if (!v10) {
    return (a3 & ~objc_msgSend_capabilities(self, v11, v12, v13)) == 0;
  }
  BOOL result = 0;
  if (a3 != 0x100000 && a3 != 0x400000) {
    return (a3 & ~objc_msgSend_capabilities(self, v11, v12, v13)) == 0;
  }
  return result;
}

- (BOOL)hasConferencing
{
  return (objc_msgSend_capabilities(self, a2, v2, v3) & 0x620000) != 0;
}

- (BOOL)isConferenceAvailable
{
  return objc_msgSend_hasCapability_(self, a2, 0x100000, v2);
}

- (BOOL)hasVideo
{
  return objc_msgSend_hasCapability_(self, a2, 0x40000, v2);
}

- (BOOL)hasMultiwayVideo
{
  int hasVideo = objc_msgSend_hasVideo(self, a2, v2, v3);
  if (hasVideo)
  {
    LOBYTE(hasVideo) = objc_msgSend_hasCapability_(self, v6, 0x1000000, v7);
  }
  return hasVideo;
}

- (BOOL)hasAudio
{
  uint64_t v5 = objc_msgSend_ID(self, a2, v2, v3);
  char v9 = objc_msgSend__appearsToBePhoneNumber(v5, v6, v7, v8);

  if (v9) {
    return 0;
  }
  if (objc_msgSend_hasCapability_(self, v10, 655360, v11)) {
    return 1;
  }

  return objc_msgSend_hasCapability_(self, v13, 0x400000, v14);
}

- (BOOL)hasMultiwayAudio
{
  int hasAudio = objc_msgSend_hasAudio(self, a2, v2, v3);
  if (hasAudio)
  {
    LOBYTE(hasAudio) = objc_msgSend_hasCapability_(self, v6, 0x800000, v7);
  }
  return hasAudio;
}

- (void)_imPersonPictureChanged:(id)a3
{
  objc_msgSend_postNotificationName_(self, a2, @"__kIMHandlePictureChangedNotification", v3);
}

- (void)setCustomPictureData:(id)a3
{
  id v8 = a3;
  if ((IMSharedHelperAreObjectsLogicallySame() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_pictureData, a3);
    objc_msgSend_customPictureDataChanged_key_(self, v5, (uint64_t)v8, 0);
    objc_msgSend_postNotificationName_(self, v6, @"__kIMHandlePictureChangedNotification", v7);
  }
}

- (void)setCustomPictureData:(id)a3 key:(id)a4
{
  id v11 = a3;
  id v7 = a4;
  if ((IMSharedHelperAreObjectsLogicallySame() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_pictureData, a3);
    objc_msgSend_postNotificationName_(self, v8, @"__kIMHandlePictureChangedNotification", v9);
    objc_msgSend_customPictureDataChanged_key_(self, v10, (uint64_t)v11, (uint64_t)v7);
  }
}

- (id)description
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v4);
  id = self->_id;
  int v10 = @"<None>";
  if (self->_uncanonicalID) {
    uncanonicalID = (__CFString *)self->_uncanonicalID;
  }
  else {
    uncanonicalID = @"<None>";
  }
  BOOL v15 = objc_msgSend_countryCode(self, v5, v6, v7);
  if (v15)
  {
    objc_msgSend_countryCode(self, v12, v13, v14);
    int v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  cnContact = self->_cnContact;
  if (cnContact)
  {
    objc_msgSend_descriptionForCNContact_(MEMORY[0x1E4F6E6D8], v12, (uint64_t)self->_cnContact, v14);
    uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v17 = @"<No CNStore Match>";
  }
  uint64_t v18 = objc_msgSend_accountDescription(self->_account, v12, v13, v14);
  uint64_t v21 = objc_msgSend_arrayWithObjects_(v3, v19, @"[", v20, v8, @": <", id, @":", uncanonicalID, @":", v10, @"> (CNContact: "), v17, CFSTR(") (Account: "), v18, CFSTR("]"), 0;
  uint64_t v22 = (void *)IMCreateSimpleComponentString();

  if (cnContact) {
  if (v15)
  }

  return v22;
}

- (DNDContactHandle)dndContactHandle
{
  dndContactHandle = self->_dndContactHandle;
  if (!dndContactHandle)
  {
    uint64_t v6 = objc_msgSend_ID(self, a2, v2, v3);
    if (objc_msgSend__appearsToBeEmail(v6, v7, v8, v9)) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = 2;
    }
    id v11 = objc_alloc_init((Class)MEMORY[0x1A6263B40](@"DNDMutableContactHandle", @"DoNotDisturb"));
    objc_msgSend_setValue_(v11, v12, (uint64_t)v6, v13);
    objc_msgSend_setType_(v11, v14, v10, v15);
    uint64_t v19 = (DNDContactHandle *)objc_msgSend_copy(v11, v16, v17, v18);
    uint64_t v20 = self->_dndContactHandle;
    self->_dndContactHandle = v19;

    dndContactHandle = self->_dndContactHandle;
  }

  return dndContactHandle;
}

- (IMBrandManager)brandManager
{
  brandManager = self->_brandManager;
  if (brandManager)
  {
    uint64_t v3 = brandManager;
  }
  else if (IMIsRunningInUnitTesting())
  {
    uint64_t v3 = 0;
  }
  else
  {
    objc_msgSend_sharedInstance(MEMORY[0x1E4F6E630], v4, v5, v6);
    uint64_t v3 = (IMBrandManager *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (void)_fetchBrandInfoForBrandWithURI:(id)a3 forType:(unint64_t)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if ((IMIsRunningInMessagesComposeViewService() & 1) == 0)
  {
    if (v7)
    {
      if ((objc_msgSend_isEqualToString_(self->_brandURI, v8, (uint64_t)v7, v9) & 1) == 0)
      {
        objc_storeStrong((id *)&self->_brandURI, a3);
        if (IMOSLoggingEnabled())
        {
          uint64_t v10 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v7;
            _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_DEBUG, "Fetching business info for business with brandURI: %@", buf, 0xCu);
          }
        }
        *(void *)buf = 0;
        objc_initWeak((id *)buf, self);
        uint64_t v14 = objc_msgSend_brandManager(self, v11, v12, v13);
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = sub_1A4BB63F0;
        v17[3] = &unk_1E5B7CEA0;
        objc_copyWeak(&v19, (id *)buf);
        id v18 = v7;
        objc_msgSend_brandWithURI_forType_completion_(v14, v15, (uint64_t)v18, a4, v17);

        objc_destroyWeak(&v19);
        objc_destroyWeak((id *)buf);
      }
    }
    else
    {
      uint64_t v16 = IMLogHandleForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1A4CB7FC4(v16);
      }
    }
  }
}

- (void)_fetchBrandInfoForBusiness:(unint64_t)a3
{
  objc_msgSend_ID(self, a2, a3, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__fetchBrandInfoForBrandWithURI_forType_(self, v6, (uint64_t)v7, a3);
}

- (void)_fetchBrandInfoForRoadside
{
  id location = 0;
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_1A4BB668C;
  v2[3] = &unk_1E5B7ADC8;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E4F14428], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)_fetchedBrand:(id)a3 withBrandURI:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v9 = a4;
  if (v6)
  {
    if (objc_msgSend_isEqualToString_(self->_brandURI, v7, (uint64_t)v9, v8))
    {
      objc_msgSend_setBrand_(self, v10, (uint64_t)v6, v11);
      objc_msgSend__postOnScreenChangedNotificationForBrandProperty_(self, v12, *MEMORY[0x1E4F6CA68], v13);
      if ((sub_1A4C0AC10() & 1) == 0)
      {
        id location = 0;
        id v14 = objc_initWeak(&location, self);
        int isChatBot = objc_msgSend_isChatBot(self, v15, v16, v17);

        if (isChatBot)
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v22 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              id v45 = v9;
              _os_log_impl(&dword_1A4AF7000, v22, OS_LOG_TYPE_DEBUG, "Fetching logo image data for brandURI: %@", buf, 0xCu);
            }
          }
          uint64_t v23 = objc_msgSend_logoFingerprint(v6, v19, v20, v21);
          v40[0] = MEMORY[0x1E4F143A8];
          v40[1] = 3221225472;
          v40[2] = sub_1A4BB6B38;
          v40[3] = &unk_1E5B7CEC8;
          uint64_t v24 = &v42;
          objc_copyWeak(&v42, &location);
          id v41 = v9;
          objc_msgSend_logoDataOfType_desiredSize_fingerprint_completion_(v6, v25, 2, (uint64_t)v23, v40, 172.0, 172.0);

          uint64_t v26 = &v41;
        }
        else
        {
          v37[0] = MEMORY[0x1E4F143A8];
          v37[1] = 3221225472;
          v37[2] = sub_1A4BB6CE0;
          v37[3] = &unk_1E5B7CEC8;
          uint64_t v24 = &v39;
          objc_copyWeak(&v39, &location);
          id v29 = v9;
          id v38 = v29;
          objc_msgSend_squareLogoDataForDesiredSize_completion_(v6, v30, (uint64_t)v37, v31, 172.0, 172.0);
          v34[0] = MEMORY[0x1E4F143A8];
          v34[1] = 3221225472;
          v34[2] = sub_1A4BB6E88;
          v34[3] = &unk_1E5B7CEC8;
          objc_copyWeak(&v36, &location);
          id v35 = v29;
          objc_msgSend_wideLogoDataForDesiredSize_completion_(v6, v32, (uint64_t)v34, v33, 540.0, 81.0);

          objc_destroyWeak(&v36);
          uint64_t v26 = &v38;
        }

        objc_destroyWeak(v24);
        objc_destroyWeak(&location);
      }
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v27 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        brandURI = self->_brandURI;
        *(_DWORD *)buf = 138412546;
        id v45 = v9;
        __int16 v46 = 2112;
        id v47 = brandURI;
        _os_log_impl(&dword_1A4AF7000, v27, OS_LOG_TYPE_INFO, "Ignoring fetched brand for brandURI: %@, as it doesn't match current brandURI: %@", buf, 0x16u);
      }
    }
  }
}

- (void)_postOnScreenChangedNotificationForBrandProperty:(id)a3
{
  v24[2] = *MEMORY[0x1E4F143B8];
  v23[0] = *MEMORY[0x1E4F6CA90];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_ID(self, v5, v6, v7);
  uint64_t v10 = (void *)v8;
  uint64_t v11 = &stru_1EF8E78C8;
  if (v8) {
    uint64_t v11 = (__CFString *)v8;
  }
  v23[1] = *MEMORY[0x1E4F6CA80];
  v24[0] = v11;
  v24[1] = v4;
  uint64_t v12 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v9, (uint64_t)v24, (uint64_t)v23, 2);

  uint64_t v16 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v13, v14, v15);
  objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v16, v17, *MEMORY[0x1E4F6CA98], (uint64_t)self, v12);

  uint64_t v21 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v18, v19, v20);

  objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v21, v22, *MEMORY[0x1E4F6CA60], (uint64_t)self, v12);
}

- (NSDictionary)extraProperties
{
  return self->_extraProps;
}

- (unint64_t)previousStatus
{
  return self->_prevStatus;
}

- (NSString)previousStatusMessage
{
  return self->_prevStatusMsg;
}

- (NSAttributedString)richStatusMessage
{
  return self->_richStatusMsg;
}

- (NSString)uniqueName
{
  return self->_uniqueName;
}

- (BOOL)hasSuggestedName
{
  return self->_hasSuggestedName;
}

- (void)setHasSuggestedName:(BOOL)a3
{
  self->_hasSuggestedName = a3;
}

- (void)setIDStatus:(int64_t)a3
{
  self->_int64_t IDStatus = a3;
}

- (unsigned)authRequestStatus
{
  return self->_authRequestStatus;
}

- (NSDate)feedUpdatedDate
{
  return self->_feedUpdatedDate;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_int64_t priority = a3;
}

- (BOOL)isBot
{
  return self->_isBot;
}

- (BOOL)isMobile
{
  return self->_isMobile;
}

- (NSData)pictureData
{
  return self->_pictureData;
}

- (NSDictionary)otherServiceIDs
{
  return self->_otherServiceIDs;
}

- (void)setOtherServiceIDs:(id)a3
{
}

- (void)setBrand:(id)a3
{
}

- (NSData)brandSquareLogoImageData
{
  return self->_brandSquareLogoImageData;
}

- (void)setBrandSquareLogoImageData:(id)a3
{
}

- (NSData)brandWideLogoImageData
{
  return self->_brandWideLogoImageData;
}

- (void)setBrandWideLogoImageData:(id)a3
{
}

- (void)setDndContactHandle:(id)a3
{
}

- (void)setBrandManager:(id)a3
{
}

- (NSString)cachedDisplayNameWithAbbreviation
{
  return self->_cachedDisplayNameWithAbbreviation;
}

- (NSString)cachedName
{
  return self->_cachedName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedName, 0);
  objc_storeStrong((id *)&self->_cachedDisplayNameWithAbbreviation, 0);
  objc_storeStrong((id *)&self->_suggestedName, 0);
  objc_storeStrong((id *)&self->_brandManager, 0);
  objc_storeStrong((id *)&self->_dndContactHandle, 0);
  objc_storeStrong((id *)&self->_brandWideLogoImageData, 0);
  objc_storeStrong((id *)&self->_brandSquareLogoImageData, 0);
  objc_storeStrong((id *)&self->_brand, 0);
  objc_storeStrong((id *)&self->_guid, 0);
  objc_storeStrong((id *)&self->_cnContact, 0);
  objc_storeStrong((id *)&self->_personCentricID, 0);
  objc_storeStrong((id *)&self->_brandURI, 0);
  objc_storeStrong((id *)&self->_isApple, 0);
  objc_storeStrong((id *)&self->_isMako, 0);
  objc_storeStrong((id *)&self->_isBusiness, 0);
  objc_storeStrong((id *)&self->_formattedNumber, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_notificationNameQueue, 0);
  objc_storeStrong((id *)&self->_prevStatusMsg, 0);
  objc_storeStrong((id *)&self->_whenStatusChanged, 0);
  objc_storeStrong((id *)&self->_whenWentOffline, 0);
  objc_storeStrong((id *)&self->_richStatusMsg, 0);
  objc_storeStrong((id *)&self->_processedStatusMsg, 0);
  objc_storeStrong((id *)&self->_statusMsg, 0);
  objc_storeStrong((id *)&self->_pictureData, 0);
  objc_storeStrong((id *)&self->_uniqueName, 0);
  objc_storeStrong((id *)&self->_IDWithTrimmedServer, 0);
  objc_storeStrong((id *)&self->_IDWithoutResource, 0);
  objc_storeStrong((id *)&self->_normalizedFormOfID, 0);
  objc_storeStrong((id *)&self->_emails, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_displayID, 0);
  objc_storeStrong((id *)&self->_cnNickname, 0);
  objc_storeStrong((id *)&self->_cnFullName, 0);
  objc_storeStrong((id *)&self->_cnLastName, 0);
  objc_storeStrong((id *)&self->_cnFirstName, 0);
  objc_storeStrong((id *)&self->_extraProps, 0);
  objc_storeStrong((id *)&self->_feedUpdatedDate, 0);
  objc_storeStrong((id *)&self->_idleSince, 0);
  objc_storeStrong((id *)&self->_otherServiceIDs, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_uncanonicalID, 0);
  objc_storeStrong((id *)&self->_id, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

- (void)beginNotificationQueue
{
}

- (void)releaseNotificationQueue
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int notificationQueueCount = self->_notificationQueueCount;
  if (notificationQueueCount <= 0)
  {
    uint64_t v20 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v2, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v20, v21, (uint64_t)a2, (uint64_t)self, @"IMHandle.m", 3221, @"%@ unmatched notification queue release", self);

    int notificationQueueCount = self->_notificationQueueCount;
  }
  self->_int notificationQueueCount = notificationQueueCount - 1;
  if ((objc_msgSend_shouldQueueNotifications(self, a2, v2, v3) & 1) == 0)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v9 = objc_msgSend_copy(self->_notificationQueue, v6, v7, v8);
    uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v22, (uint64_t)v26, 16);
    if (v11)
    {
      uint64_t v14 = v11;
      uint64_t v15 = *(void *)v23;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend__postNotification_(self, v12, *(void *)(*((void *)&v22 + 1) + 8 * v16++), v13);
        }
        while (v14 != v16);
        uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v22, (uint64_t)v26, 16);
      }
      while (v14);
    }

    notificationNameQueue = self->_notificationNameQueue;
    self->_notificationNameQueue = 0;

    notificationQueue = self->_notificationQueue;
    self->_notificationQueue = 0;
  }
}

- (id)publicAPIPropertiesDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v7 = objc_msgSend_service(self, v4, v5, v6);
  uint64_t v11 = objc_msgSend_internalName(v7, v8, v9, v10);

  if (objc_msgSend_isEqualToString_(v11, v12, @"SubNet", v13))
  {
    uint64_t v17 = @"Bonjour";

    uint64_t v11 = v17;
  }
  if (v11) {
    objc_msgSend_setObject_forKey_(v3, v14, (uint64_t)v11, @"__kIMPersonServiceNameKey");
  }
  id v18 = objc_msgSend_ID(self, v14, v15, v16);

  if (v18)
  {
    long long v22 = objc_msgSend_ID(self, v19, v20, v21);
    objc_msgSend_setObject_forKey_(v3, v23, (uint64_t)v22, @"__kIMPersonScreenNameKey");
  }
  char isBuddy = objc_msgSend_isBuddy(self, v19, v20, v21);
  uint64_t v28 = NSNumber;
  if (isBuddy)
  {
    uint64_t v29 = objc_msgSend_status(self, v25, v26, v27);
    uint64_t v32 = objc_msgSend_numberWithInteger_(v28, v30, v29, v31);
    objc_msgSend_setObject_forKey_(v3, v33, (uint64_t)v32, @"__kIMPersonStatusKey");

    long long v37 = objc_msgSend_statusMessage(self, v34, v35, v36);

    if (v37)
    {
      id v41 = objc_msgSend_statusMessage(self, v38, v39, v40);
      objc_msgSend_setObject_forKey_(v3, v42, (uint64_t)v41, @"__kIMPersonStatusMessageKey");
    }
    idleSince = self->_idleSince;
    if (idleSince) {
      objc_msgSend_setObject_forKey_(v3, v38, (uint64_t)idleSince, @"__kIMPersonIdleSinceKey");
    }
    uint64_t v44 = objc_msgSend_firstName(self, v38, (uint64_t)idleSince, v40);
    if (objc_msgSend_length(v44, v45, v46, v47)) {
      objc_msgSend_setObject_forKey_(v3, v48, (uint64_t)v44, @"__kIMPersonFirstNameKey");
    }
    uint64_t v51 = objc_msgSend_lastName(self, v48, v49, v50);
    if (objc_msgSend_length(v51, v52, v53, v54)) {
      objc_msgSend_setObject_forKey_(v3, v55, (uint64_t)v51, @"__kIMPersonLastNameKey");
    }
    uint64_t v58 = objc_msgSend_email(self, v55, v56, v57);

    if (v58)
    {
      uint64_t v62 = objc_msgSend_email(self, v59, v60, v61);
      objc_msgSend_setObject_forKey_(v3, v63, (uint64_t)v62, @"__kIMPersonEmailKey");
    }
    uint64_t v64 = objc_msgSend_pictureData(self, v59, v60, v61);

    if (v64)
    {
      char v68 = objc_msgSend_pictureData(self, v65, v66, v67);
      objc_msgSend_setObject_forKey_(v3, v69, (uint64_t)v68, @"__kIMPersonPictureDataKey");
    }
    uint64_t v70 = NSNumber;
    int hasCapability = objc_msgSend_hasCapability_(self, v65, 0x100000, v67);
    uint64_t v74 = objc_msgSend_numberWithBool_(v70, v72, hasCapability ^ 1u, v73);
    objc_msgSend_setObject_forKey_(v3, v75, (uint64_t)v74, @"__kIMPersonAVBusyKey");

    id v76 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (objc_msgSend_hasCapability_(self, v77, 1024, v78)) {
      objc_msgSend_addObject_(v76, v79, @"__kIMCapabilityText", v80);
    }
    if (objc_msgSend_hasCapability_(self, v79, 32, v80)) {
      objc_msgSend_addObject_(v76, v81, @"__kIMCapabilityFileTransfer", v82);
    }
    if ((objc_msgSend_hasCapability_(self, v81, 655360, v82) & 1) != 0
      || objc_msgSend_hasCapability_(self, v83, 4718592, v84))
    {
      objc_msgSend_addObject_(v76, v83, @"__kIMCapabilityAudioConference", v84);
    }
    if ((objc_msgSend_hasCapability_(self, v83, 393216, v84) & 1) != 0
      || objc_msgSend_hasCapability_(self, v85, 2359296, v86))
    {
      objc_msgSend_addObject_(v76, v85, @"__kIMCapabilityVideoConference", v86);
    }
    uint64_t v88 = objc_msgSend_sharedInstance(IMDaemonController, v85, v87, v86);
    uint64_t v92 = objc_msgSend_listener(v88, v89, v90, v91);
    int v96 = objc_msgSend_vcCapabilities(v92, v93, v94, v95);

    if ((~v96 & 0xA0000) != 0
      || (objc_msgSend_containsObject_(v76, v97, @"__kIMCapabilityAudioConference", v98) & 1) == 0)
    {
      objc_msgSend_removeObject_(v76, v97, @"__kIMCapabilityAudioConference", v98);
    }
    if ((v96 & 0x40000) == 0
      || (*(void *)&v96 & 0x220000) == 0
      || (objc_msgSend_containsObject_(v76, v97, @"__kIMCapabilityVideoConference", v98) & 1) == 0)
    {
      objc_msgSend_removeObject_(v76, v97, @"__kIMCapabilityVideoConference", v98);
    }
    objc_msgSend_setObject_forKey_(v3, v97, (uint64_t)v76, @"__kIMPersonCapabilitiesKey");
    objc_msgSend_setObject_forKey_(v3, v99, (uint64_t)v76, @"__kIMPersonAllowedCapabilitiesKey");
  }
  else
  {
    uint64_t v44 = objc_msgSend_numberWithInt_(NSNumber, v25, 1, v27);
    objc_msgSend_setObject_forKey_(v3, v100, (uint64_t)v44, @"__kIMPersonStatusKey");
  }

  return v3;
}

+ (void)bestHandlesForContacts:(id)a3 completion:(id)a4
{
}

+ (void)bestHandlesForContacts:(id)a3 useExtendedAsyncLookup:(BOOL)a4 completion:(id)a5
{
}

+ (void)validHandlesForContacts:(id)a3 completion:(id)a4
{
}

+ (void)validHandlesForContacts:(id)a3 useExtendedAsyncLookup:(BOOL)a4 completion:(id)a5
{
}

+ (void)handlesForContacts:(id)a3 useBestHandle:(BOOL)a4 useExtendedAsyncLookup:(BOOL)a5 completion:(id)a6
{
  LODWORD(v232) = a4;
  HIDWORD(v232) = a5;
  uint64_t v282 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v235 = a6;
  v247 = v7;
  uint64_t v11 = objc_msgSend_count(v7, v8, v9, v10);
  int v12 = IMOSLoggingEnabled();
  if (!v11)
  {
    if (v12)
    {
      v161 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v161, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AF7000, v161, OS_LOG_TYPE_INFO, "[handlesForContacts] Received empty array of contacts", buf, 2u);
      }
    }
    (*((void (**)(id, void, void, void))v235 + 2))(v235, 0, 0, 0);
    goto LABEL_96;
  }
  if (v12)
  {
    uint64_t v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = @"NO";
      if (v232) {
        id v18 = @"YES";
      }
      else {
        id v18 = @"NO";
      }
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v7;
      *(void *)&buf[14] = v18;
      *(_WORD *)&buf[12] = 2112;
      if (HIDWORD(v232)) {
        uint64_t v17 = @"YES";
      }
      *(_WORD *)&buf[22] = 2112;
      v280 = v17;
      _os_log_impl(&dword_1A4AF7000, v16, OS_LOG_TYPE_INFO, "[handlesForContacts] Attempting to identify best handles for contacts: %@ with conditions [useBestHandle:%@, useExtendedAsyncLookup:%@]", buf, 0x20u);
    }
  }
  uint64_t v19 = objc_msgSend_sharedRegistry(IMChatRegistry, v13, v14, v15, v232);
  long long v23 = objc_msgSend_cachedChats(v19, v20, v21, v22);
  uint64_t v26 = objc_msgSend___imArrayByFilteringWithBlock_(v23, v24, (uint64_t)&unk_1EF8E5618, v25);

  uint64_t v29 = objc_msgSend_sortedArrayUsingComparator_(v26, v27, (uint64_t)&unk_1EF8E40F0, v28);

  v240 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v30, v31, v32);
  v239 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v33, v34, v35);
  long long v270 = 0u;
  long long v271 = 0u;
  long long v268 = 0u;
  long long v269 = 0u;
  obuint64_t j = v29;
  uint64_t v238 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v36, (uint64_t)&v268, (uint64_t)v278, 16);
  if (v238)
  {
    uint64_t v237 = *(void *)v269;
    while (2)
    {
      for (uint64_t i = 0; i != v238; ++i)
      {
        if (*(void *)v269 != v237) {
          objc_enumerationMutation(obj);
        }
        v244 = *(__CFString **)(*((void *)&v268 + 1) + 8 * i);
        v242 = objc_msgSend_contacts(v244, v37, v38, v39);
        if (objc_msgSend_intersectsSet_(v247, v40, (uint64_t)v242, v41))
        {
          if (objc_msgSend_isEqualToSet_(v247, v42, (uint64_t)v242, v43))
          {
            uint64_t v47 = objc_msgSend_count(v242, v44, v45, v46);
            uint64_t v51 = objc_msgSend_participants(v244, v48, v49, v50);
            LODWORD(v47) = v47 == objc_msgSend_count(v51, v52, v53, v54);

            if (v47)
            {
              v172 = sub_1A4C08E34(v247, v244);
              if (IMOSLoggingEnabled())
              {
                double v176 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v176, OS_LOG_TYPE_INFO))
                {
                  uint64_t v180 = objc_msgSend_account(v244, v177, v178, v179);
                  *(_DWORD *)buf = 138412802;
                  *(void *)&uint8_t buf[4] = v172;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v180;
                  *(_WORD *)&buf[22] = 2112;
                  v280 = v244;
                  _os_log_impl(&dword_1A4AF7000, v176, OS_LOG_TYPE_INFO, "[handlesForContacts] Attempt 1: Found handles: %@, account: %@, for union match chat: %@", buf, 0x20u);
                }
              }
              uint64_t v181 = objc_msgSend_account(v244, v173, v174, v175);
              (*((void (**)(id, void *, void *, __CFString *))v235 + 2))(v235, v172, v181, v244);

              id v124 = obj;
              goto LABEL_95;
            }
          }
          uint64_t v55 = objc_msgSend_chatIdentifier(v244, v44, v45, v46);
          objc_msgSend_setObject_forKeyedSubscript_(v240, v56, (uint64_t)v242, (uint64_t)v55);

          v243 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v57, v58, v59);
          long long v266 = 0u;
          long long v267 = 0u;
          long long v264 = 0u;
          long long v265 = 0u;
          id v245 = v242;
          uint64_t v248 = objc_msgSend_countByEnumeratingWithState_objects_count_(v245, v60, (uint64_t)&v264, (uint64_t)v277, 16);
          if (v248)
          {
            uint64_t v246 = *(void *)v265;
            do
            {
              uint64_t v63 = 0;
              do
              {
                if (*(void *)v265 != v246)
                {
                  uint64_t v64 = v63;
                  objc_enumerationMutation(v245);
                  uint64_t v63 = v64;
                }
                uint64_t v250 = v63;
                uint64_t v65 = *(void **)(*((void *)&v264 + 1) + 8 * v63);
                if (objc_msgSend_containsObject_(v247, v61, (uint64_t)v65, v62))
                {
                  id v251 = v65;
                  v249 = v244;
                  uint64_t v69 = objc_msgSend_account(v249, v66, v67, v68);
                  long long v274 = 0u;
                  long long v275 = 0u;
                  long long v272 = 0u;
                  long long v273 = 0u;
                  uint64_t v73 = objc_msgSend_participants(v249, v70, v71, v72);
                  uint64_t v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(v73, v74, (uint64_t)&v272, (uint64_t)buf, 16);
                  if (v78)
                  {
                    uint64_t v79 = *(void *)v273;
                    while (2)
                    {
                      for (uint64_t j = 0; j != v78; ++j)
                      {
                        if (*(void *)v273 != v79) {
                          objc_enumerationMutation(v73);
                        }
                        uint64_t v81 = objc_msgSend_ID(*(void **)(*((void *)&v272 + 1) + 8 * j), v75, v76, v77);
                        uint64_t v84 = objc_msgSend_imHandleWithID_(v69, v82, (uint64_t)v81, v83);

                        uint64_t v87 = objc_msgSend_cnContactWithKeys_(v84, v85, MEMORY[0x1E4F1CBF0], v86);
                        uint64_t v91 = v87;
                        if (v87)
                        {
                          uint64_t v92 = objc_msgSend_identifier(v87, v88, v89, v90);
                          int v96 = objc_msgSend_identifier(v251, v93, v94, v95);
                          char isEqualToString = objc_msgSend_isEqualToString_(v92, v97, (uint64_t)v96, v98);

                          if (isEqualToString)
                          {

                            goto LABEL_36;
                          }
                        }
                      }
                      uint64_t v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(v73, v75, (uint64_t)&v272, (uint64_t)buf, 16);
                      if (v78) {
                        continue;
                      }
                      break;
                    }
                  }
                  uint64_t v84 = 0;
LABEL_36:

                  uint64_t v103 = objc_msgSend_identifier(v251, v100, v101, v102);
                  objc_msgSend_setObject_forKeyedSubscript_(v243, v104, (uint64_t)v84, (uint64_t)v103);
                }
                uint64_t v63 = v250 + 1;
              }
              while (v250 + 1 != v248);
              uint64_t v248 = objc_msgSend_countByEnumeratingWithState_objects_count_(v245, v61, (uint64_t)&v264, (uint64_t)v277, 16);
            }
            while (v248);
          }

          uint64_t v108 = objc_msgSend_account(v244, v105, v106, v107);
          uint64_t v112 = objc_msgSend_uniqueID(v108, v109, v110, v111);

          uint64_t v115 = objc_msgSend_objectForKeyedSubscript_(v239, v113, (uint64_t)v112, v114);
          LODWORD(v108) = v115 == 0;

          if (v108)
          {
            uint64_t v119 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v116, v117, v118);
            objc_msgSend_setObject_forKeyedSubscript_(v239, v120, (uint64_t)v119, (uint64_t)v112);
          }
          v121 = objc_msgSend_objectForKeyedSubscript_(v239, v116, (uint64_t)v112, v118);
          objc_msgSend_addEntriesFromDictionary_(v121, v122, (uint64_t)v243, v123);
        }
      }
      uint64_t v238 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v37, (uint64_t)&v268, (uint64_t)v278, 16);
      if (v238) {
        continue;
      }
      break;
    }
  }

  long long v262 = 0u;
  long long v263 = 0u;
  long long v260 = 0u;
  long long v261 = 0u;
  id v124 = obj;
  uint64_t v129 = objc_msgSend_countByEnumeratingWithState_objects_count_(v124, v125, (uint64_t)&v260, (uint64_t)v276, 16);
  if (v129)
  {
    uint64_t v130 = *(void *)v261;
    while (2)
    {
      for (uint64_t k = 0; k != v129; ++k)
      {
        if (*(void *)v261 != v130) {
          objc_enumerationMutation(v124);
        }
        uint64_t v132 = *(__CFString **)(*((void *)&v260 + 1) + 8 * k);
        uint64_t v133 = objc_msgSend_chatIdentifier(v132, v126, v127, v128);
        uint64_t v136 = objc_msgSend_objectForKeyedSubscript_(v240, v134, (uint64_t)v133, v135);

        if (v136 && objc_msgSend_isSubsetOfSet_(v247, v137, (uint64_t)v136, v138))
        {
          uint64_t v162 = sub_1A4C08E34(v247, v132);
          if (IMOSLoggingEnabled())
          {
            uint64_t v166 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v166, OS_LOG_TYPE_INFO))
            {
              uint64_t v170 = objc_msgSend_account(v132, v167, v168, v169);
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = v162;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v170;
              *(_WORD *)&buf[22] = 2112;
              v280 = v132;
              _os_log_impl(&dword_1A4AF7000, v166, OS_LOG_TYPE_INFO, "[handlesForContacts] Attempt 2: Found handles: %@, account: %@, for subset match chat: %@", buf, 0x20u);
            }
          }
          int v171 = objc_msgSend_account(v132, v163, v164, v165);
          (*((void (**)(id, void *, void *, void))v235 + 2))(v235, v162, v171, 0);

          goto LABEL_95;
        }
      }
      uint64_t v129 = objc_msgSend_countByEnumeratingWithState_objects_count_(v124, v126, (uint64_t)&v260, (uint64_t)v276, 16);
      if (v129) {
        continue;
      }
      break;
    }
  }

  v258[0] = MEMORY[0x1E4F143A8];
  v258[1] = 3221225472;
  v258[2] = sub_1A4C09024;
  v258[3] = &unk_1E5B7E220;
  id v139 = v247;
  id v259 = v139;
  uint64_t v142 = objc_msgSend_keysOfEntriesPassingTest_(v239, v140, (uint64_t)v258, v141);
  if (objc_msgSend_count(v142, v143, v144, v145) == 1)
  {
    uint64_t v149 = objc_msgSend_anyObject(v142, v146, v147, v148);
    uint64_t v152 = objc_msgSend_objectForKeyedSubscript_(v239, v150, (uint64_t)v149, v151);
    if (IMOSLoggingEnabled())
    {
      uint64_t v156 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v156, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v152;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v149;
        _os_log_impl(&dword_1A4AF7000, v156, OS_LOG_TYPE_INFO, "[handlesForContacts] Attempt 3: Found handles: %@ for account: %@ that contacted all recipients", buf, 0x16u);
      }
    }
    uint64_t v157 = objc_msgSend_sharedInstance(IMAccountController, v153, v154, v155);
    v160 = objc_msgSend_accountForUniqueID_(v157, v158, (uint64_t)v149, v159);
    (*((void (**)(id, void *, void *, void))v235 + 2))(v235, v152, v160, 0);

    goto LABEL_94;
  }
  if ((unint64_t)objc_msgSend_count(v142, v146, v147, v148) < 2) {
    goto LABEL_87;
  }
  id v182 = v142;
  unint64_t v186 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v183, v184, v185);
  if (objc_msgSend_iMessageEnabledForSenderLastAddressedHandle_simID_(IMServiceImpl, v187, 0, 0))
  {
    v191 = objc_msgSend_iMessageService(IMService, v188, v189, v190);
    uint64_t v195 = objc_msgSend_name(v191, v192, v193, v194);
    objc_msgSend_setObject_forKeyedSubscript_(v186, v196, (uint64_t)&unk_1EF9145A8, (uint64_t)v195);
LABEL_79:

    goto LABEL_80;
  }
  if (objc_msgSend_smsEnabled(IMServiceImpl, v188, v189, v190))
  {
    v191 = objc_msgSend_smsService(IMService, v197, v198, v199);
    uint64_t v195 = objc_msgSend_name(v191, v200, v201, v202);
    objc_msgSend_setObject_forKeyedSubscript_(v186, v203, (uint64_t)&unk_1EF9145C0, (uint64_t)v195);
    goto LABEL_79;
  }
LABEL_80:
  id v204 = objc_msgSend_allObjects(v182, v197, v198, v199);
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = sub_1A4C0A00C;
  v280 = (__CFString *)&unk_1E5B7B470;
  id v281 = v186;
  id v205 = v186;
  uint64_t v208 = objc_msgSend_sortedArrayUsingComparator_(v204, v206, (uint64_t)buf, v207);
  v211 = objc_msgSend_objectAtIndexedSubscript_(v208, v209, 0, v210);

  if (objc_msgSend_length(v211, v212, v213, v214))
  {
    v217 = objc_msgSend_objectForKeyedSubscript_(v239, v215, (uint64_t)v211, v216);
    if (IMOSLoggingEnabled())
    {
      v221 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v221, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v211;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v217;
        _os_log_impl(&dword_1A4AF7000, v221, OS_LOG_TYPE_INFO, "[handlesForContacts] Attempt 3: Selected best account: %@ that messaged all handles: %@", buf, 0x16u);
      }
    }
    v222 = objc_msgSend_sharedInstance(IMAccountController, v218, v219, v220);
    v225 = objc_msgSend_accountForUniqueID_(v222, v223, (uint64_t)v211, v224);
    (*((void (**)(id, void *, void *, void))v235 + 2))(v235, v217, v225, 0);

    goto LABEL_94;
  }

LABEL_87:
  if (v234)
  {
    v226 = sub_1A4C09060(v139);
    v227 = sub_1A4C0921C(v139);
    v228 = (void *)*MEMORY[0x1E4F6AA78];
    v252[0] = MEMORY[0x1E4F143A8];
    v252[1] = 3221225472;
    v252[2] = sub_1A4C09488;
    v252[3] = &unk_1E5B7E270;
    char v257 = v233;
    id v253 = v227;
    id v254 = v139;
    id v255 = v226;
    id v256 = v235;
    id v229 = v226;
    id v230 = v227;
    sub_1A4C093D0(v229, v228, v252);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v231 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v231, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AF7000, v231, OS_LOG_TYPE_INFO, "[handlesForContacts] Failed to find handles for contacts", buf, 2u);
      }
    }
    (*((void (**)(id, void, void, void))v235 + 2))(v235, 0, 0, 0);
  }
LABEL_94:

  id v124 = v259;
LABEL_95:

LABEL_96:
}

- (id)fmfHandle
{
  uint64_t v3 = MEMORY[0x1A6263B40](@"FMFHandle", @"FMF");
  if (v3)
  {
    id v7 = (void *)v3;
    uint64_t v8 = objc_msgSend_ID(self, v4, v5, v6);
    uint64_t v11 = objc_msgSend_handleWithId_(v7, v9, (uint64_t)v8, v10);
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)findMyHandle
{
  id v4 = objc_msgSend_ID(self, a2, v2, v3);
  id v7 = objc_msgSend_handleWithIdentifier_(IMFindMyHandle, v5, (uint64_t)v4, v6);

  return v7;
}

- (id)findMySiblingHandles
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_set(MEMORY[0x1E4F1CA80], a2, v2, v3);
  uint64_t v11 = objc_msgSend_cnContactWithKeys_(self, v6, MEMORY[0x1E4F1CBF0], v7);
  if (v11)
  {
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    int v12 = objc_msgSend_phoneNumbersForCNContact_(MEMORY[0x1E4F6E6D8], v8, (uint64_t)v11, v10);
    uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v56, (uint64_t)v61, 16);
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v57 != v16) {
            objc_enumerationMutation(v12);
          }
          id v18 = IMInternationalForPhoneNumberWithOptions();
          uint64_t v21 = objc_msgSend_handleWithIdentifier_(IMFindMyHandle, v19, (uint64_t)v18, v20);
          objc_msgSend_addObject_(v5, v22, (uint64_t)v21, v23);
        }
        uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v24, (uint64_t)&v56, (uint64_t)v61, 16);
      }
      while (v15);
    }

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    uint64_t v27 = objc_msgSend_emailsForCNContact_(MEMORY[0x1E4F6E6D8], v25, (uint64_t)v11, v26, 0);
    uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v52, (uint64_t)v60, 16);
    if (v29)
    {
      uint64_t v33 = v29;
      uint64_t v34 = *(void *)v53;
      do
      {
        for (uint64_t j = 0; j != v33; ++j)
        {
          if (*(void *)v53 != v34) {
            objc_enumerationMutation(v27);
          }
          uint64_t v36 = objc_msgSend_lowercaseString(*(void **)(*((void *)&v52 + 1) + 8 * j), v30, v31, v32);
          uint64_t v39 = objc_msgSend_handleWithIdentifier_(IMFindMyHandle, v37, (uint64_t)v36, v38);
          objc_msgSend_addObject_(v5, v40, (uint64_t)v39, v41);
        }
        uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v30, (uint64_t)&v52, (uint64_t)v60, 16);
      }
      while (v33);
    }
  }
  else
  {
    uint64_t v44 = objc_msgSend_ID(self, v8, v9, v10);
    uint64_t v47 = objc_msgSend_handleWithIdentifier_(IMFindMyHandle, v45, (uint64_t)v44, v46);

    objc_msgSend_addObject_(v5, v48, (uint64_t)v47, v49);
  }
  uint64_t v50 = objc_msgSend_setWithSet_(MEMORY[0x1E4F1CAD0], v42, (uint64_t)v5, v43);

  return v50;
}

@end