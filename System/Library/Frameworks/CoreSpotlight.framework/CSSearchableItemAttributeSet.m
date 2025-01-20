@interface CSSearchableItemAttributeSet
+ (BOOL)supportsSecureCoding;
+ (id)_allKeys;
+ (id)_requiredAttributesForContentType:(id)a3;
+ (id)_sharedAttributeKeySet;
- ($917DE44C1CB612B85CED1B4C2573F471)codedAttributes;
- ($917DE44C1CB612B85CED1B4C2573F471)codedCustomAttributes;
- ($917DE44C1CB612B85CED1B4C2573F471)contentObj;
- (BOOL)attributeIsDelete:(id)a3;
- (BOOL)hasCodedCustomAttributes;
- (BOOL)hasKnownKeysDictionary;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValidAttributeSet;
- (CSDecoder)contentDecoder;
- (CSDecoder)decoder;
- (CSDonatedEvent)donatedEvent;
- (CSPerson)photosContributor;
- (CSSearchableItemAttributeSet)init;
- (CSSearchableItemAttributeSet)initWithAttributeSet:(id)a3;
- (CSSearchableItemAttributeSet)initWithAttributes:(id)a3;
- (CSSearchableItemAttributeSet)initWithCoder:(id)a3;
- (CSSearchableItemAttributeSet)initWithContentType:(UTType *)contentType;
- (CSSearchableItemAttributeSet)initWithDecoder:(id)a3 obj:(id *)a4;
- (CSSearchableItemAttributeSet)initWithItemContentType:(NSString *)itemContentType;
- (CSSearchableItemAttributeSet)initWithKnownKeysDictionary:(id)a3;
- (CSSearchableItemAttributeSet)initWithMutableDictionary:(id)a3;
- (CSSearchableItemAttributeSet)initWithSerializedAttributes:(id)a3;
- (CSSmartRepliesResponse)smartRepliesResponse;
- (NSArray)LPMediaPaths;
- (NSArray)accountHandles;
- (NSArray)actionIdentifiers;
- (NSArray)additionalRecipients;
- (NSArray)addressCategories;
- (NSArray)addresses;
- (NSArray)alternateNames;
- (NSArray)appEntityTypeRepresentationSynonyms;
- (NSArray)audiences;
- (NSArray)authorAddresses;
- (NSArray)authorEmailAddresses;
- (NSArray)authorNames;
- (NSArray)authorPhotosPersonIdentifiers;
- (NSArray)authors;
- (NSArray)autocompleteTriggers;
- (NSArray)businessHours;
- (NSArray)codecs;
- (NSArray)contactKeywords;
- (NSArray)contentSources;
- (NSArray)contentTypeTree;
- (NSArray)contributors;
- (NSArray)coverage;
- (NSArray)detectedEventTypes;
- (NSArray)documentUnderstandingCategories;
- (NSArray)documentUnderstandingTopics;
- (NSArray)editors;
- (NSArray)emailAddresses;
- (NSArray)encodingApplications;
- (NSArray)eventContactPersonNames;
- (NSArray)eventCustomerNames;
- (NSArray)eventRoomNumbers;
- (NSArray)eventSeatNumbers;
- (NSArray)extractedAddresses;
- (NSArray)extractedCurrencies;
- (NSArray)extractedDates;
- (NSArray)extractedEmails;
- (NSArray)extractedFlights;
- (NSArray)extractedLinks;
- (NSArray)extractedLocations;
- (NSArray)extractedPhoneNumbers;
- (NSArray)extractedTrackingNumbers;
- (NSArray)fileProviderUserInfoKeys;
- (NSArray)fileProviderUserInfoValues;
- (NSArray)flightArrivalAirportAddressSynonyms;
- (NSArray)flightArrivalAirportInternationalNames;
- (NSArray)flightDepartureAirportAddressSynonyms;
- (NSArray)flightDepartureAirportInternationalNames;
- (NSArray)flightPassengerNames;
- (NSArray)flightPassengerSeatNumbers;
- (NSArray)fontNames;
- (NSArray)hashtags;
- (NSArray)hiddenAdditionalRecipients;
- (NSArray)homeAddresses;
- (NSArray)hotelReservationForAddressSynonyms;
- (NSArray)importantDates;
- (NSArray)instantMessageAddresses;
- (NSArray)keywords;
- (NSArray)languages;
- (NSArray)layerNames;
- (NSArray)links;
- (NSArray)mailAttachmentKinds;
- (NSArray)mailAttachmentNames;
- (NSArray)mailAttachmentTypes;
- (NSArray)mailGMailLabels;
- (NSArray)mailUsedDates;
- (NSArray)mailboxIdentifiers;
- (NSArray)matchingHints;
- (NSArray)mediaTypes;
- (NSArray)messageMentionedAddresses;
- (NSArray)organizations;
- (NSArray)participants;
- (NSArray)performers;
- (NSArray)phoneNumbers;
- (NSArray)photosBusinessCategories;
- (NSArray)photosBusinessNames;
- (NSArray)photosContentCreationDateMonths;
- (NSArray)photosContentCreationDateYears;
- (NSArray)photosEventCategories;
- (NSArray)photosEventNames;
- (NSArray)photosEventPerformers;
- (NSArray)photosHolidays;
- (NSArray)photosKeywords;
- (NSArray)photosLocationKeywords;
- (NSArray)photosMatchingLSynonymsIndexes;
- (NSArray)photosMatchingLabelsIndexes;
- (NSArray)photosMeanings;
- (NSArray)photosMediaTypes;
- (NSArray)photosPartsOfDay;
- (NSArray)photosPartsOfWeek;
- (NSArray)photosPeople;
- (NSArray)photosSceneClassifications;
- (NSArray)photosSceneIdentifiers;
- (NSArray)photosScenes;
- (NSArray)photosSeasons;
- (NSArray)photosSharedLibraryContributors;
- (NSArray)photosTextContentPieces;
- (NSArray)photosUtilityTypes;
- (NSArray)primaryRecipients;
- (NSArray)projects;
- (NSArray)providerDataTypeIdentifiers;
- (NSArray)providerFileTypeIdentifiers;
- (NSArray)providerInPlaceFileTypeIdentifiers;
- (NSArray)publishers;
- (NSArray)queryResultMatchedFields;
- (NSArray)recipientAddresses;
- (NSArray)recipientEmailAddresses;
- (NSArray)recipientNames;
- (NSArray)recipientPhotosPersonIdentifiers;
- (NSArray)restaurantReservationForAddressSynonyms;
- (NSArray)resultMatchingAttributes;
- (NSArray)resultMatchingSceneIdentifiers;
- (NSArray)summarizedIdentifiers;
- (NSArray)topic;
- (NSArray)userTags;
- (NSArray)workAddresses;
- (NSAttributedString)summarizationContentSynopsis;
- (NSAttributedString)summarizationContentTopLine;
- (NSAttributedString)summarizationContentTopic;
- (NSData)HTMLContentData;
- (NSData)HTMLContentDataNoCopy;
- (NSData)cachedViewData;
- (NSData)extraData;
- (NSData)intentData;
- (NSData)mediaAnalysisTimeRangeData;
- (NSData)mediaAnalysisTimeRangeEmbeddings;
- (NSData)photosL2Signals;
- (NSData)portraitFeatureVector;
- (NSData)thumbnailData;
- (NSDate)GPSDateStamp;
- (NSDate)addedDate;
- (NSDate)birthday;
- (NSDate)cardExpirationDate;
- (NSDate)cardIssueDate;
- (NSDate)completionDate;
- (NSDate)contactSharedDateTime;
- (NSDate)contentCreationDate;
- (NSDate)contentModificationDate;
- (NSDate)downloadedDate;
- (NSDate)dueDate;
- (NSDate)endDate;
- (NSDate)expirationDate;
- (NSDate)flightArrivalDateTime;
- (NSDate)flightBoardingDateTime;
- (NSDate)flightDepartureDateTime;
- (NSDate)hotelCheckinDate;
- (NSDate)hotelCheckinTime;
- (NSDate)hotelCheckoutDate;
- (NSDate)hotelCheckoutTime;
- (NSDate)lastApplicationLaunchedDate;
- (NSDate)lastUsedDate;
- (NSDate)mailDateLastViewed;
- (NSDate)mailDateReceived;
- (NSDate)metadataModificationDate;
- (NSDate)photosContentAddedDate;
- (NSDate)photosContentCreationDate;
- (NSDate)photosDonationTimestamp;
- (NSDate)recordingDate;
- (NSDate)restaurantStartDate;
- (NSDate)restaurantStartTime;
- (NSDate)startDate;
- (NSDate)syndicatedContentServerDate;
- (NSDate)timestamp;
- (NSDictionary)attributes;
- (NSDictionary)emailHeaders;
- (NSDictionary)portraitNamedEntities;
- (NSMutableDictionary)customAttributes;
- (NSMutableDictionary)mutableAttributes;
- (NSNumber)GPSDOP;
- (NSNumber)GPSDestBearing;
- (NSNumber)GPSDestDistance;
- (NSNumber)GPSDestLatitude;
- (NSNumber)GPSDestLongitude;
- (NSNumber)GPSDifferental;
- (NSNumber)GPSTrack;
- (NSNumber)ISOSpeed;
- (NSNumber)aestheticScore;
- (NSNumber)allDay;
- (NSNumber)altitude;
- (NSNumber)aperture;
- (NSNumber)audioBitRate;
- (NSNumber)audioChannelCount;
- (NSNumber)audioSampleRate;
- (NSNumber)audioTrackNumber;
- (NSNumber)backgroundRunnable;
- (NSNumber)bitsPerSample;
- (NSNumber)containerOrder;
- (NSNumber)contentCreationDateDay;
- (NSNumber)contentCreationDateHour;
- (NSNumber)contentCreationDateMonth;
- (NSNumber)contentCreationDateWeekOfMonth;
- (NSNumber)contentCreationDateWeekOfYear;
- (NSNumber)contentCreationDateWeekday;
- (NSNumber)contentCreationDateWeekdayOrdinal;
- (NSNumber)contentCreationDateYear;
- (NSNumber)contentModificationDateDay;
- (NSNumber)contentModificationDateHour;
- (NSNumber)contentModificationDateMonth;
- (NSNumber)contentModificationDateWeekOfMonth;
- (NSNumber)contentModificationDateWeekOfYear;
- (NSNumber)contentModificationDateWeekday;
- (NSNumber)contentModificationDateWeekdayOrdinal;
- (NSNumber)contentModificationDateYear;
- (NSNumber)contentRating;
- (NSNumber)cost;
- (NSNumber)curationScore;
- (NSNumber)dataOwnerType;
- (NSNumber)deletedWithRelatedUniqueIdentifier;
- (NSNumber)deliveryType;
- (NSNumber)disableSearchInSpotlight;
- (NSNumber)documentIdentifier;
- (NSNumber)documentUnderstandingCategoriesVersion;
- (NSNumber)documentUnderstandingTopicsVersion;
- (NSNumber)downloadError;
- (NSNumber)duration;
- (NSNumber)eligibleForPhotosProcessing;
- (NSNumber)emailAutoReplied;
- (NSNumber)emailHasDistributionListInCC;
- (NSNumber)emailHasDistributionListInTo;
- (NSNumber)embeddingVersion;
- (NSNumber)eventIsAllDay;
- (NSNumber)eventNumberOfRooms;
- (NSNumber)eventSourceIsForwarded;
- (NSNumber)exposureMode;
- (NSNumber)exposureTime;
- (NSNumber)extendedContentRating;
- (NSNumber)fNumber;
- (NSNumber)favoriteRank;
- (NSNumber)fileIdentifier;
- (NSNumber)fileProviderOnDiskIdentifier;
- (NSNumber)fileSize;
- (NSNumber)flightArrivalAirportLatitude;
- (NSNumber)flightArrivalAirportLongitude;
- (NSNumber)flightDepartureAirportLatitude;
- (NSNumber)flightDepartureAirportLongitude;
- (NSNumber)focalLength;
- (NSNumber)hasAlphaChannel;
- (NSNumber)hasLPMedia;
- (NSNumber)hasTopMomentScore;
- (NSNumber)imageDirection;
- (NSNumber)isCinematicVideo;
- (NSNumber)isCommunicationNotification;
- (NSNumber)isDownloading;
- (NSNumber)isExistingThread;
- (NSNumber)isFlashOn;
- (NSNumber)isFocalLength35mm;
- (NSNumber)isFromMe;
- (NSNumber)isGeneralMIDISequence;
- (NSNumber)isGroupThread;
- (NSNumber)isLikelyJunk;
- (NSNumber)isLocal;
- (NSNumber)isMessageFromKnownSender;
- (NSNumber)isNew;
- (NSNumber)isPartiallyDownloaded;
- (NSNumber)isPinned;
- (NSNumber)isPlaceholder;
- (NSNumber)isPotentialEventMessage;
- (NSNumber)isProResVideo;
- (NSNumber)isReaderView;
- (NSNumber)isRedEyeOn;
- (NSNumber)isShared;
- (NSNumber)isStreamable;
- (NSNumber)isTrashed;
- (NSNumber)isTwoFactorCode;
- (NSNumber)isUploaded;
- (NSNumber)isUploading;
- (NSNumber)isUrgent;
- (NSNumber)isUserCreated;
- (NSNumber)isUserCurated;
- (NSNumber)isUserOwned;
- (NSNumber)isWebClip;
- (NSNumber)isZombie;
- (NSNumber)lastMotionActivityState;
- (NSNumber)latitude;
- (NSNumber)longitude;
- (NSNumber)mailFlagColor;
- (NSNumber)mailFlagged;
- (NSNumber)mailPriority;
- (NSNumber)mailRead;
- (NSNumber)mailRepliedTo;
- (NSNumber)mailResultScoreL1;
- (NSNumber)mailResultScoreL2;
- (NSNumber)mailUseCount;
- (NSNumber)mailVIP;
- (NSNumber)maxAperture;
- (NSNumber)mediaAnalysisComplete;
- (NSNumber)mediaEmbeddingVersion;
- (NSNumber)messagePinned;
- (NSNumber)messageRead;
- (NSNumber)notificationCritical;
- (NSNumber)notificationTimeSensitive;
- (NSNumber)orientation;
- (NSNumber)pageCount;
- (NSNumber)pageHeight;
- (NSNumber)pageWidth;
- (NSNumber)parentFileIdentifier;
- (NSNumber)photosAestheticScore;
- (NSNumber)photosCharacterRecognitionAnalysisVersion;
- (NSNumber)photosCollectionResultCount;
- (NSNumber)photosContentRating;
- (NSNumber)photosCurationScore;
- (NSNumber)photosDonationState;
- (NSNumber)photosDuration;
- (NSNumber)photosFaceAnalysisVersion;
- (NSNumber)photosFavorited;
- (NSNumber)photosHasTopMomentScore;
- (NSNumber)photosImageEmbeddingVersion;
- (NSNumber)photosInferredTimeZoneOffset;
- (NSNumber)photosIsCinematicVideo;
- (NSNumber)photosIsProResVideo;
- (NSNumber)photosLocationPrivateEncryptedComputeAnalysisVersion;
- (NSNumber)photosMediaAnalysisImageVersion;
- (NSNumber)photosMediaAnalysisVersion;
- (NSNumber)photosPrivateEncryptedComputeAnalysisVersion;
- (NSNumber)photosSceneAnalysisVersion;
- (NSNumber)photosTimeZoneOffset;
- (NSNumber)photosVideoEmbeddingVersion;
- (NSNumber)pixelCount;
- (NSNumber)pixelHeight;
- (NSNumber)pixelWidth;
- (NSNumber)playCount;
- (NSNumber)portraitFeatureVectorVersion;
- (NSNumber)portraitStaticScore;
- (NSNumber)rankingHint;
- (NSNumber)rating;
- (NSNumber)requiresImport;
- (NSNumber)requiresMediaAnalysis;
- (NSNumber)resolutionHeightDPI;
- (NSNumber)resolutionWidthDPI;
- (NSNumber)shortcutAvailability;
- (NSNumber)speed;
- (NSNumber)subItemCount;
- (NSNumber)supportsNavigation;
- (NSNumber)supportsPhoneCall;
- (NSNumber)syndicationStatus;
- (NSNumber)tabStatus;
- (NSNumber)tempo;
- (NSNumber)timeIsUnknown;
- (NSNumber)totalBitRate;
- (NSNumber)uploadError;
- (NSNumber)videoBitRate;
- (NSNumber)visualAssetPriority;
- (NSNumber)whiteBalance;
- (NSString)EXIFGPSVersion;
- (NSString)EXIFVersion;
- (NSString)FPFilename;
- (NSString)GPSAreaInformation;
- (NSString)GPSMapDatum;
- (NSString)GPSMeasureMode;
- (NSString)GPSProcessingMethod;
- (NSString)GPSStatus;
- (NSString)accountIdentifier;
- (NSString)accountType;
- (NSString)acquisitionMake;
- (NSString)acquisitionModel;
- (NSString)adamID;
- (NSString)album;
- (NSString)albumPersistentID;
- (NSString)appEntityInstanceId;
- (NSString)appEntityType;
- (NSString)appEntityTypeRepresentationName;
- (NSString)applicationName;
- (NSString)artist;
- (NSString)audioEncodingApplication;
- (NSString)bundleID;
- (NSString)cameraOwner;
- (NSString)cardAddress;
- (NSString)cardCategory;
- (NSString)cardCountry;
- (NSString)cardEyeColor;
- (NSString)cardGroupNumber;
- (NSString)cardHeight;
- (NSString)cardIssuedBy;
- (NSString)cardNumber;
- (NSString)cardPlaceOfBirth;
- (NSString)cardProvider;
- (NSString)cardRegion;
- (NSString)cardRestrictions;
- (NSString)cardSex;
- (NSString)cardSubType;
- (NSString)cardType;
- (NSString)cardUnderName;
- (NSString)cardWeight;
- (NSString)city;
- (NSString)collaborationIdentifier;
- (NSString)colorSpace;
- (NSString)comment;
- (NSString)composer;
- (NSString)contactName;
- (NSString)contactNickname;
- (NSString)contactRelationship;
- (NSString)contactSharedAppName;
- (NSString)contactSharedBy;
- (NSString)contactType;
- (NSString)containerDisplayName;
- (NSString)containerIdentifier;
- (NSString)containerTitle;
- (NSString)contentDescription;
- (NSString)contentSnippet;
- (NSString)contentType;
- (NSString)copyright;
- (NSString)costCode;
- (NSString)country;
- (NSString)creator;
- (NSString)curator;
- (NSString)director;
- (NSString)displayName;
- (NSString)domainIdentifier;
- (NSString)downloadingStatus;
- (NSString)endDateTimeZone;
- (NSString)episode;
- (NSString)eventEndLocationAddress;
- (NSString)eventEndLocationName;
- (NSString)eventEndLocationTelephone;
- (NSString)eventFallbackGroupIdentifier;
- (NSString)eventGroupIdentifier;
- (NSString)eventMegadomeIdentifier;
- (NSString)eventMessageIdentifier;
- (NSString)eventMetadata;
- (NSString)eventName;
- (NSString)eventProvider;
- (NSString)eventReservationForName;
- (NSString)eventReservationID;
- (NSString)eventSourceBundleIdentifier;
- (NSString)eventSourceMetadata;
- (NSString)eventStartLocationAddress;
- (NSString)eventStartLocationName;
- (NSString)eventStartLocationTelephone;
- (NSString)eventStatus;
- (NSString)eventSubType;
- (NSString)eventTicketType;
- (NSString)eventTotalCost;
- (NSString)eventType;
- (NSString)exposureProgram;
- (NSString)exposureTimeString;
- (NSString)fileItemID;
- (NSString)fileProviderDomainIdentifier;
- (NSString)fileProviderID;
- (NSString)filename;
- (NSString)flightArrivalAirportAddress;
- (NSString)flightArrivalAirportCode;
- (NSString)flightArrivalAirportCountry;
- (NSString)flightArrivalAirportLocality;
- (NSString)flightArrivalAirportName;
- (NSString)flightArrivalAirportPostalCode;
- (NSString)flightArrivalAirportRegion;
- (NSString)flightArrivalAirportStreetAddress;
- (NSString)flightArrivalGate;
- (NSString)flightArrivalTerminal;
- (NSString)flightArrivalTimeZone;
- (NSString)flightBookingInfoUrl;
- (NSString)flightCarrier;
- (NSString)flightCarrierCode;
- (NSString)flightCheckInUrl;
- (NSString)flightConfirmationNumber;
- (NSString)flightDepartureAirportAddress;
- (NSString)flightDepartureAirportCode;
- (NSString)flightDepartureAirportCountry;
- (NSString)flightDepartureAirportLocality;
- (NSString)flightDepartureAirportName;
- (NSString)flightDepartureAirportPostalCode;
- (NSString)flightDepartureAirportRegion;
- (NSString)flightDepartureAirportStreetAddress;
- (NSString)flightDepartureGate;
- (NSString)flightDepartureTerminal;
- (NSString)flightDepartureTimeZone;
- (NSString)flightDesignator;
- (NSString)flightNumber;
- (NSString)flightStatus;
- (NSString)fullyFormattedAddress;
- (NSString)genre;
- (NSString)groupPhotoPath;
- (NSString)headline;
- (NSString)hotelModifyReservationUrl;
- (NSString)hotelProvider;
- (NSString)hotelReservationForAddress;
- (NSString)hotelReservationForAddressCountry;
- (NSString)hotelReservationForAddressLocality;
- (NSString)hotelReservationForAddressPostalCode;
- (NSString)hotelReservationForAddressRegion;
- (NSString)hotelReservationForName;
- (NSString)hotelReservationForStreetAddress;
- (NSString)hotelReservationForTelephone;
- (NSString)hotelReservationId;
- (NSString)hotelTimeZone;
- (NSString)hotelUnderName;
- (NSString)identifier;
- (NSString)importSandboxExtension;
- (NSString)information;
- (NSString)instructions;
- (NSString)keySignature;
- (NSString)kind;
- (NSString)lastEditorIdentifier;
- (NSString)lastEditorName;
- (NSString)lensModel;
- (NSString)linkName;
- (NSString)linkSubType;
- (NSString)linkType;
- (NSString)lyricist;
- (NSString)mailCategory;
- (NSString)mailConversationID;
- (NSString)mailMessageHeader;
- (NSString)mailMessageID;
- (NSString)messageService;
- (NSString)messageSuggestedContactName;
- (NSString)messageSuggestedContactPhotoPath;
- (NSString)messageTapbackStringValue;
- (NSString)messageType;
- (NSString)meteringMode;
- (NSString)musicalGenre;
- (NSString)musicalInstrumentCategory;
- (NSString)musicalInstrumentName;
- (NSString)namedLocation;
- (NSString)originalFormat;
- (NSString)originalSource;
- (NSString)ownerIdentifier;
- (NSString)ownerName;
- (NSString)parentFileItemID;
- (NSString)path;
- (NSString)phoneCallStatus;
- (NSString)phoneCallType;
- (NSString)phoneProvider;
- (NSString)phoneSIM;
- (NSString)photosAcquisitionMake;
- (NSString)photosAcquisitionModel;
- (NSString)photosCollectionKeyAssetUUID;
- (NSString)photosCollectionSubtitle;
- (NSString)photosContainerIdentifier;
- (NSString)photosContentCreationDateMonth;
- (NSString)photosContentCreationDateYear;
- (NSString)photosContentDescription;
- (NSString)photosContentType;
- (NSString)photosDisplayName;
- (NSString)photosEntityTitle;
- (NSString)photosFavorites;
- (NSString)photosFilename;
- (NSString)photosLibraryName;
- (NSString)photosMemoryTitle;
- (NSString)photosResultType;
- (NSString)photosSavedFromAppBundleIdentifier;
- (NSString)photosSavedFromAppName;
- (NSString)photosSavingApplication;
- (NSString)photosSavingApplicationBundleIdentifier;
- (NSString)photosTimeZoneName;
- (NSString)photosTitle;
- (NSString)podcastName;
- (NSString)postalCode;
- (NSString)primaryAccountNumberSuffix;
- (NSString)producer;
- (NSString)profileName;
- (NSString)protectionClass;
- (NSString)punchoutLabel;
- (NSString)queryResultRelevance;
- (NSString)ratingDescription;
- (NSString)relatedAppBundleIdentifier;
- (NSString)relatedUniqueIdentifier;
- (NSString)relationship;
- (NSString)restaurantMealType;
- (NSString)restaurantPartySize;
- (NSString)restaurantReservationForAddress;
- (NSString)restaurantReservationForAddressCountry;
- (NSString)restaurantReservationForAddressLocality;
- (NSString)restaurantReservationForAddressPostalCode;
- (NSString)restaurantReservationForAddressRegion;
- (NSString)restaurantReservationForName;
- (NSString)restaurantReservationForStreetAddress;
- (NSString)restaurantReservationForTelephone;
- (NSString)restaurantReservationId;
- (NSString)restaurantTimeZone;
- (NSString)restaurantUnderName;
- (NSString)richLinkID;
- (NSString)richLinkTitle;
- (NSString)richLinkURL;
- (NSString)rights;
- (NSString)role;
- (NSString)savingApplication;
- (NSString)savingApplicationBundleIdentifier;
- (NSString)securityMethod;
- (NSString)sharedItemCurrentUserRole;
- (NSString)startDateTimeZone;
- (NSString)stateOrProvince;
- (NSString)subThoroughfare;
- (NSString)subject;
- (NSString)subtitle;
- (NSString)suggestedInvocationPhrase;
- (NSString)tapbackAssociatedMessageID;
- (NSString)textContent;
- (NSString)textContentDataSource;
- (NSString)textContentNoCopy;
- (NSString)textSelected;
- (NSString)theme;
- (NSString)thoroughfare;
- (NSString)threadIdentifier;
- (NSString)thumbnailBundleID;
- (NSString)thumbnailContentType;
- (NSString)thumbnailSymbolName;
- (NSString)timeSignature;
- (NSString)title;
- (NSString)uniqueIdentifier;
- (NSString)urlDescription;
- (NSString)userActivityType;
- (NSString)version;
- (NSString)versionIdentifier;
- (NSString)weakRelatedUniqueIdentifier;
- (NSString)xmpCredit;
- (NSString)xmpDigitalSourceType;
- (NSURL)URL;
- (NSURL)cardDetailsActionURL;
- (NSURL)cardNumberActionURL;
- (NSURL)contentURL;
- (NSURL)darkThumbnailURL;
- (NSURL)eventURL;
- (NSURL)payBalanceActionURL;
- (NSURL)phoneCallBackURL;
- (NSURL)thumbnailURL;
- (UTType)sharedItemContentType;
- (_CSEmbedding)photoEmbedding;
- (_CSEmbedding)primaryTextEmbedding;
- (_CSEmbedding)secondaryTextEmbedding;
- (double)eventDuration;
- (id)_getExternalAnalysisTagsForPrimaryAttribute:(id)a3 analysisAttributes:(id)a4 getTagBlock:(id)a5;
- (id)_getNonNullValueForKey:(id)a3;
- (id)_getNumericAnalysisTagsForPrimaryAttribute:(id)a3 analysisAttributes:(id)a4 getTagBlock:(id)a5;
- (id)appleLoopDescriptors;
- (id)appleLoopsKeyFilterType;
- (id)appleLoopsLoopMode;
- (id)appleLoopsRootKey;
- (id)applicationCategories;
- (id)attachmentCaptions;
- (id)attachmentNames;
- (id)attachmentPaths;
- (id)attachmentTypes;
- (id)attributeForKey:(id)a3;
- (id)bundleIdentifier;
- (id)calendarDelegateIdentifier;
- (id)calendarHolidayIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)customAttributeDictionary;
- (id)debugDescription;
- (id)description;
- (id)executableArchitectures;
- (id)executablePlatform;
- (id)finderComment;
- (id)getAllUniqueEventAttributes;
- (id)indexIdentifier;
- (id)instantAnswers;
- (id)isApplicationManaged;
- (id)lastAppEngagementDate;
- (id)lastAppSearchEngagementQuery;
- (id)lastAppSearchEngagementRenderPosition;
- (id)providerDataTypes;
- (id)providerFileTypes;
- (id)requiredAttributes;
- (id)serialNumber;
- (id)serializedAttributes;
- (id)supportFileType;
- (id)textContentPieces;
- (id)userCreatedDate;
- (id)userCreatedUserHandle;
- (id)userDownloadedDate;
- (id)userDownloadedUserHandle;
- (id)userModifiedDate;
- (id)userModifiedUserHandle;
- (id)userPrintedDate;
- (id)userPrintedUserHandle;
- (id)userSharedReceivedDate;
- (id)userSharedReceivedRecipient;
- (id)userSharedReceivedRecipientHandle;
- (id)userSharedReceivedSender;
- (id)userSharedReceivedSenderHandle;
- (id)userSharedReceivedTransport;
- (id)userSharedSentDate;
- (id)userSharedSentRecipient;
- (id)userSharedSentRecipientHandle;
- (id)userSharedSentSender;
- (id)userSharedSentSenderHandle;
- (id)userSharedSentTransport;
- (id)valueForCustomKey:(CSCustomAttributeKey *)key;
- (id)vendorName;
- (int)mailCategories;
- (int)messageEffectType;
- (int)messageTapbackType;
- (int)smartRepliesStatus;
- (int)summarizationStatus;
- (int)urgencyStatus;
- (int64_t)mailCategoryType;
- (int64_t)searchableItemFlags;
- (unint64_t)hash;
- (void)_markAs:(id)a3 userHandle:(id)a4 dateKey:(id)a5 userHandleKey:(id)a6;
- (void)_markAs:(int)a3 date:(id)a4 sender:(id)a5 senderHandle:(id)a6 recipients:(id)a7 recipientHandles:(id)a8 transport:(id)a9;
- (void)_setArrayValue:(id)a3 withItemClass:(Class)a4 forKey:(id)a5;
- (void)_setDataValue:(id)a3 forKey:(id)a4;
- (void)_setDateValue:(id)a3 forKey:(id)a4;
- (void)_setDictionaryValue:(id)a3 withValueClass:(Class)a4 keyClass:(Class)a5 forKey:(id)a6;
- (void)_setNumberValue:(id)a3 forKey:(id)a4;
- (void)_setStringValue:(id)a3 forKey:(id)a4;
- (void)_setURLValue:(id)a3 forKey:(id)a4;
- (void)_setValue:(id)a3 withClass:(Class)a4 forKey:(id)a5;
- (void)_setValue:(id)a3 withClass:(Class)a4 forKey:(id)a5 copy:(BOOL)a6;
- (void)_standardizeMarkAs;
- (void)_standardizeProcessorAttributesForBundle:(id)a3 protectionClass:(id)a4 isUpdate:(BOOL)a5;
- (void)addAttributesFromAttributeSet:(id)a3;
- (void)addAttributesFromDictionary:(id)a3;
- (void)addAttributesFromDictionaryWithOutOverWriting:(id)a3;
- (void)encodeWithCSCoder:(id)a3;
- (void)encodeWithCSCoder:(id)a3 includeText:(BOOL)a4;
- (void)encodeWithCoder:(id)a3;
- (void)incrementAttributeValue:(id)a3 forKey:(id)a4;
- (void)markAsCreated:(id)a3 userHandle:(id)a4;
- (void)markAsDownloaded:(id)a3 userHandle:(id)a4;
- (void)markAsModified:(id)a3 userHandle:(id)a4;
- (void)markAsPrinted:(id)a3 userHandle:(id)a4;
- (void)markAsReceived:(id)a3 sender:(id)a4 senderHandle:(id)a5 recipients:(id)a6 recipientHandles:(id)a7 transport:(id)a8;
- (void)markAsSent:(id)a3 sender:(id)a4 senderHandle:(id)a5 recipients:(id)a6 recipientHandles:(id)a7 transport:(id)a8;
- (void)setAccountHandles:(NSArray *)accountHandles;
- (void)setAccountIdentifier:(NSString *)accountIdentifier;
- (void)setAccountType:(id)a3;
- (void)setAcquisitionMake:(NSString *)acquisitionMake;
- (void)setAcquisitionModel:(NSString *)acquisitionModel;
- (void)setActionIdentifiers:(NSArray *)actionIdentifiers;
- (void)setAdamID:(id)a3;
- (void)setAddedDate:(NSDate *)addedDate;
- (void)setAdditionalRecipients:(NSArray *)additionalRecipients;
- (void)setAddressCategories:(id)a3;
- (void)setAddresses:(id)a3;
- (void)setAestheticScore:(id)a3;
- (void)setAlbum:(NSString *)album;
- (void)setAlbumPersistentID:(id)a3;
- (void)setAllDay:(NSNumber *)allDay;
- (void)setAlternateNames:(NSArray *)alternateNames;
- (void)setAltitude:(NSNumber *)altitude;
- (void)setAperture:(NSNumber *)aperture;
- (void)setAppEntityInstanceId:(id)a3;
- (void)setAppEntityType:(id)a3;
- (void)setAppEntityTypeRepresentationName:(id)a3;
- (void)setAppEntityTypeRepresentationSynonyms:(id)a3;
- (void)setAppleLoopDescriptors:(id)a3;
- (void)setAppleLoopsKeyFilterType:(id)a3;
- (void)setAppleLoopsLoopMode:(id)a3;
- (void)setAppleLoopsRootKey:(id)a3;
- (void)setApplicationCategories:(id)a3;
- (void)setApplicationManaged:(id)a3;
- (void)setApplicationName:(id)a3;
- (void)setArtist:(NSString *)artist;
- (void)setAttachmentCaptions:(id)a3;
- (void)setAttachmentNames:(id)a3;
- (void)setAttachmentPaths:(id)a3;
- (void)setAttachmentTypes:(id)a3;
- (void)setAttribute:(id)a3 forKey:(id)a4;
- (void)setAudiences:(NSArray *)audiences;
- (void)setAudioBitRate:(NSNumber *)audioBitRate;
- (void)setAudioChannelCount:(NSNumber *)audioChannelCount;
- (void)setAudioEncodingApplication:(NSString *)audioEncodingApplication;
- (void)setAudioSampleRate:(NSNumber *)audioSampleRate;
- (void)setAudioTrackNumber:(NSNumber *)audioTrackNumber;
- (void)setAuthorAddresses:(NSArray *)authorAddresses;
- (void)setAuthorEmailAddresses:(NSArray *)authorEmailAddresses;
- (void)setAuthorNames:(NSArray *)authorNames;
- (void)setAuthorPhotosPersonIdentifiers:(id)a3;
- (void)setAuthors:(NSArray *)authors;
- (void)setAutocompleteTriggers:(id)a3;
- (void)setBackgroundRunnable:(id)a3;
- (void)setBirthday:(id)a3;
- (void)setBitsPerSample:(NSNumber *)bitsPerSample;
- (void)setBundleID:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setBusinessHours:(id)a3;
- (void)setCachedViewData:(id)a3;
- (void)setCalendarDelegateIdentifier:(id)a3;
- (void)setCalendarHolidayIdentifier:(id)a3;
- (void)setCameraOwner:(NSString *)cameraOwner;
- (void)setCardAddress:(id)a3;
- (void)setCardCategory:(id)a3;
- (void)setCardCountry:(id)a3;
- (void)setCardDetailsActionURL:(id)a3;
- (void)setCardExpirationDate:(id)a3;
- (void)setCardEyeColor:(id)a3;
- (void)setCardGroupNumber:(id)a3;
- (void)setCardHeight:(id)a3;
- (void)setCardIssueDate:(id)a3;
- (void)setCardIssuedBy:(id)a3;
- (void)setCardNumber:(id)a3;
- (void)setCardNumberActionURL:(id)a3;
- (void)setCardPlaceOfBirth:(id)a3;
- (void)setCardProvider:(id)a3;
- (void)setCardRegion:(id)a3;
- (void)setCardRestrictions:(id)a3;
- (void)setCardSex:(id)a3;
- (void)setCardSubType:(id)a3;
- (void)setCardType:(id)a3;
- (void)setCardUnderName:(id)a3;
- (void)setCardWeight:(id)a3;
- (void)setCity:(NSString *)city;
- (void)setCodecs:(NSArray *)codecs;
- (void)setCollaborationIdentifier:(id)a3;
- (void)setColorSpace:(NSString *)colorSpace;
- (void)setComment:(NSString *)comment;
- (void)setCompletionDate:(NSDate *)completionDate;
- (void)setComposer:(NSString *)composer;
- (void)setContactKeywords:(NSArray *)contactKeywords;
- (void)setContactName:(id)a3;
- (void)setContactNickname:(id)a3;
- (void)setContactRelationship:(id)a3;
- (void)setContactSharedAppName:(id)a3;
- (void)setContactSharedBy:(id)a3;
- (void)setContactSharedDateTime:(id)a3;
- (void)setContactType:(id)a3;
- (void)setContainerDisplayName:(NSString *)containerDisplayName;
- (void)setContainerIdentifier:(NSString *)containerIdentifier;
- (void)setContainerOrder:(NSNumber *)containerOrder;
- (void)setContainerTitle:(NSString *)containerTitle;
- (void)setContentCreationDate:(NSDate *)contentCreationDate;
- (void)setContentDescription:(NSString *)contentDescription;
- (void)setContentModificationDate:(NSDate *)contentModificationDate;
- (void)setContentObj:(id)a3 obj:(id *)a4;
- (void)setContentRating:(NSNumber *)contentRating;
- (void)setContentSources:(NSArray *)contentSources;
- (void)setContentType:(NSString *)contentType;
- (void)setContentTypeTree:(NSArray *)contentTypeTree;
- (void)setContentURL:(NSURL *)contentURL;
- (void)setContributors:(NSArray *)contributors;
- (void)setCopyright:(NSString *)copyright;
- (void)setCost:(id)a3;
- (void)setCostCode:(id)a3;
- (void)setCountry:(NSString *)country;
- (void)setCoverage:(NSArray *)coverage;
- (void)setCreator:(NSString *)creator;
- (void)setCurationScore:(id)a3;
- (void)setCurator:(id)a3;
- (void)setDarkThumbnailURL:(NSURL *)darkThumbnailURL;
- (void)setDataOwnerType:(id)a3;
- (void)setDeletedWithRelatedUniqueIdentifier:(id)a3;
- (void)setDeliveryType:(NSNumber *)deliveryType;
- (void)setDetectedEventTypes:(id)a3;
- (void)setDirector:(NSString *)director;
- (void)setDisableSearchInSpotlight:(id)a3;
- (void)setDisplayName:(NSString *)displayName;
- (void)setDocumentIdentifier:(id)a3;
- (void)setDocumentUnderstandingCategories:(id)a3;
- (void)setDocumentUnderstandingCategoriesVersion:(id)a3;
- (void)setDocumentUnderstandingTopics:(id)a3;
- (void)setDocumentUnderstandingTopicsVersion:(id)a3;
- (void)setDomainIdentifier:(NSString *)domainIdentifier;
- (void)setDonatedEvent:(id)a3;
- (void)setDownloadError:(id)a3;
- (void)setDownloadedDate:(NSDate *)downloadedDate;
- (void)setDownloading:(id)a3;
- (void)setDownloadingStatus:(id)a3;
- (void)setDueDate:(NSDate *)dueDate;
- (void)setDuration:(NSNumber *)duration;
- (void)setEXIFGPSVersion:(NSString *)EXIFGPSVersion;
- (void)setEXIFVersion:(NSString *)EXIFVersion;
- (void)setEditors:(NSArray *)editors;
- (void)setEligibleForPhotosProcessing:(id)a3;
- (void)setEmailAddresses:(NSArray *)emailAddresses;
- (void)setEmailAutoReplied:(id)a3;
- (void)setEmailHasDistributionListInCC:(id)a3;
- (void)setEmailHasDistributionListInTo:(id)a3;
- (void)setEmailHeaders:(NSDictionary *)emailHeaders;
- (void)setEmbeddingVersion:(id)a3;
- (void)setEncodingApplications:(NSArray *)encodingApplications;
- (void)setEndDate:(NSDate *)endDate;
- (void)setEndDateTimeZone:(id)a3;
- (void)setEpisode:(id)a3;
- (void)setEventContactPersonNames:(id)a3;
- (void)setEventCustomerNames:(id)a3;
- (void)setEventDuration:(double)a3;
- (void)setEventEndLocationAddress:(id)a3;
- (void)setEventEndLocationName:(id)a3;
- (void)setEventEndLocationTelephone:(id)a3;
- (void)setEventFallbackGroupIdentifier:(id)a3;
- (void)setEventGroupIdentifier:(id)a3;
- (void)setEventIsAllDay:(id)a3;
- (void)setEventMegadomeIdentifier:(id)a3;
- (void)setEventMessageIdentifier:(id)a3;
- (void)setEventMetadata:(id)a3;
- (void)setEventName:(id)a3;
- (void)setEventNumberOfRooms:(id)a3;
- (void)setEventProvider:(id)a3;
- (void)setEventReservationForName:(id)a3;
- (void)setEventReservationID:(id)a3;
- (void)setEventRoomNumbers:(id)a3;
- (void)setEventSeatNumbers:(id)a3;
- (void)setEventSourceBundleIdentifier:(id)a3;
- (void)setEventSourceIsForwarded:(id)a3;
- (void)setEventSourceMetadata:(id)a3;
- (void)setEventStartLocationAddress:(id)a3;
- (void)setEventStartLocationName:(id)a3;
- (void)setEventStartLocationTelephone:(id)a3;
- (void)setEventStatus:(id)a3;
- (void)setEventSubType:(id)a3;
- (void)setEventTicketType:(id)a3;
- (void)setEventTotalCost:(id)a3;
- (void)setEventType:(id)a3;
- (void)setEventURL:(id)a3;
- (void)setExecutableArchitectures:(id)a3;
- (void)setExecutablePlatform:(id)a3;
- (void)setExistingThread:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setExposureMode:(NSNumber *)exposureMode;
- (void)setExposureProgram:(NSString *)exposureProgram;
- (void)setExposureTime:(NSNumber *)exposureTime;
- (void)setExposureTimeString:(NSString *)exposureTimeString;
- (void)setExtendedContentRating:(id)a3;
- (void)setExtraData:(id)a3;
- (void)setExtractedAddresses:(id)a3;
- (void)setExtractedCurrencies:(id)a3;
- (void)setExtractedDates:(id)a3;
- (void)setExtractedEmails:(id)a3;
- (void)setExtractedFlights:(id)a3;
- (void)setExtractedLinks:(id)a3;
- (void)setExtractedLocations:(id)a3;
- (void)setExtractedPhoneNumbers:(id)a3;
- (void)setExtractedTrackingNumbers:(id)a3;
- (void)setFNumber:(NSNumber *)fNumber;
- (void)setFPFilename:(id)a3;
- (void)setFavoriteRank:(id)a3;
- (void)setFileIdentifier:(id)a3;
- (void)setFileItemID:(id)a3;
- (void)setFileProviderDomainIdentifier:(id)a3;
- (void)setFileProviderID:(id)a3;
- (void)setFileProviderOnDiskIdentifier:(id)a3;
- (void)setFileProviderUserInfoKeys:(id)a3;
- (void)setFileProviderUserInfoValues:(id)a3;
- (void)setFileSize:(NSNumber *)fileSize;
- (void)setFilename:(id)a3;
- (void)setFinderComment:(id)a3;
- (void)setFlashOn:(NSNumber *)flashOn;
- (void)setFlightArrivalAirportAddress:(id)a3;
- (void)setFlightArrivalAirportAddressSynonyms:(id)a3;
- (void)setFlightArrivalAirportCode:(id)a3;
- (void)setFlightArrivalAirportCountry:(id)a3;
- (void)setFlightArrivalAirportInternationalNames:(id)a3;
- (void)setFlightArrivalAirportLatitude:(id)a3;
- (void)setFlightArrivalAirportLocality:(id)a3;
- (void)setFlightArrivalAirportLongitude:(id)a3;
- (void)setFlightArrivalAirportName:(id)a3;
- (void)setFlightArrivalAirportPostalCode:(id)a3;
- (void)setFlightArrivalAirportRegion:(id)a3;
- (void)setFlightArrivalAirportStreetAddress:(id)a3;
- (void)setFlightArrivalDateTime:(id)a3;
- (void)setFlightArrivalGate:(id)a3;
- (void)setFlightArrivalTerminal:(id)a3;
- (void)setFlightArrivalTimeZone:(id)a3;
- (void)setFlightBoardingDateTime:(id)a3;
- (void)setFlightBookingInfoUrl:(id)a3;
- (void)setFlightCarrier:(id)a3;
- (void)setFlightCarrierCode:(id)a3;
- (void)setFlightCheckInUrl:(id)a3;
- (void)setFlightConfirmationNumber:(id)a3;
- (void)setFlightDepartureAirportAddress:(id)a3;
- (void)setFlightDepartureAirportAddressSynonyms:(id)a3;
- (void)setFlightDepartureAirportCode:(id)a3;
- (void)setFlightDepartureAirportCountry:(id)a3;
- (void)setFlightDepartureAirportInternationalNames:(id)a3;
- (void)setFlightDepartureAirportLatitude:(id)a3;
- (void)setFlightDepartureAirportLocality:(id)a3;
- (void)setFlightDepartureAirportLongitude:(id)a3;
- (void)setFlightDepartureAirportName:(id)a3;
- (void)setFlightDepartureAirportPostalCode:(id)a3;
- (void)setFlightDepartureAirportRegion:(id)a3;
- (void)setFlightDepartureAirportStreetAddress:(id)a3;
- (void)setFlightDepartureDateTime:(id)a3;
- (void)setFlightDepartureGate:(id)a3;
- (void)setFlightDepartureTerminal:(id)a3;
- (void)setFlightDepartureTimeZone:(id)a3;
- (void)setFlightDesignator:(id)a3;
- (void)setFlightNumber:(id)a3;
- (void)setFlightPassengerNames:(id)a3;
- (void)setFlightPassengerSeatNumbers:(id)a3;
- (void)setFlightStatus:(id)a3;
- (void)setFocalLength35mm:(NSNumber *)focalLength35mm;
- (void)setFocalLength:(NSNumber *)focalLength;
- (void)setFontNames:(NSArray *)fontNames;
- (void)setFullyFormattedAddress:(NSString *)fullyFormattedAddress;
- (void)setGPSAreaInformation:(NSString *)GPSAreaInformation;
- (void)setGPSDOP:(NSNumber *)GPSDOP;
- (void)setGPSDateStamp:(NSDate *)GPSDateStamp;
- (void)setGPSDestBearing:(NSNumber *)GPSDestBearing;
- (void)setGPSDestDistance:(NSNumber *)GPSDestDistance;
- (void)setGPSDestLatitude:(NSNumber *)GPSDestLatitude;
- (void)setGPSDestLongitude:(NSNumber *)GPSDestLongitude;
- (void)setGPSDifferental:(NSNumber *)GPSDifferental;
- (void)setGPSMapDatum:(NSString *)GPSMapDatum;
- (void)setGPSMeasureMode:(NSString *)GPSMeasureMode;
- (void)setGPSProcessingMethod:(NSString *)GPSProcessingMethod;
- (void)setGPSStatus:(NSString *)GPSStatus;
- (void)setGPSTrack:(NSNumber *)GPSTrack;
- (void)setGeneralMIDISequence:(NSNumber *)generalMIDISequence;
- (void)setGenre:(NSString *)genre;
- (void)setGroupPhotoPath:(id)a3;
- (void)setHTMLContentData:(NSData *)HTMLContentData;
- (void)setHasAlphaChannel:(NSNumber *)hasAlphaChannel;
- (void)setHasLPMedia:(id)a3;
- (void)setHasTopMomentScore:(id)a3;
- (void)setHashtags:(id)a3;
- (void)setHeadline:(NSString *)headline;
- (void)setHiddenAdditionalRecipients:(NSArray *)hiddenAdditionalRecipients;
- (void)setHomeAddresses:(id)a3;
- (void)setHotelCheckinDate:(id)a3;
- (void)setHotelCheckinTime:(id)a3;
- (void)setHotelCheckoutDate:(id)a3;
- (void)setHotelCheckoutTime:(id)a3;
- (void)setHotelModifyReservationUrl:(id)a3;
- (void)setHotelProvider:(id)a3;
- (void)setHotelReservationForAddress:(id)a3;
- (void)setHotelReservationForAddressCountry:(id)a3;
- (void)setHotelReservationForAddressLocality:(id)a3;
- (void)setHotelReservationForAddressPostalCode:(id)a3;
- (void)setHotelReservationForAddressRegion:(id)a3;
- (void)setHotelReservationForAddressSynonyms:(id)a3;
- (void)setHotelReservationForName:(id)a3;
- (void)setHotelReservationForStreetAddress:(id)a3;
- (void)setHotelReservationForTelephone:(id)a3;
- (void)setHotelReservationId:(id)a3;
- (void)setHotelTimeZone:(id)a3;
- (void)setHotelUnderName:(id)a3;
- (void)setISOSpeed:(NSNumber *)ISOSpeed;
- (void)setIdentifier:(NSString *)identifier;
- (void)setImageDirection:(NSNumber *)imageDirection;
- (void)setImportSandboxExtension:(id)a3;
- (void)setImportantDates:(NSArray *)importantDates;
- (void)setIndexIdentifier:(id)a3;
- (void)setInformation:(NSString *)information;
- (void)setInstantAnswers:(id)a3;
- (void)setInstantMessageAddresses:(NSArray *)instantMessageAddresses;
- (void)setInstructions:(NSString *)instructions;
- (void)setIntentData:(id)a3;
- (void)setIsCinematicVideo:(id)a3;
- (void)setIsCommunicationNotification:(id)a3;
- (void)setIsFromMe:(id)a3;
- (void)setIsGroupThread:(id)a3;
- (void)setIsMessageFromKnownSender:(id)a3;
- (void)setIsNew:(id)a3;
- (void)setIsPlaceholder:(id)a3;
- (void)setIsProResVideo:(id)a3;
- (void)setIsTwoFactorCode:(id)a3;
- (void)setIsUrgent:(id)a3;
- (void)setIsWebClip:(id)a3;
- (void)setIsZombie:(id)a3;
- (void)setKeySignature:(NSString *)keySignature;
- (void)setKeywords:(NSArray *)keywords;
- (void)setKind:(NSString *)kind;
- (void)setLPMediaPaths:(id)a3;
- (void)setLanguages:(NSArray *)languages;
- (void)setLastAppEngagementDate:(id)a3;
- (void)setLastAppSearchEngagementQuery:(id)a3;
- (void)setLastAppSearchEngagementRenderPosition:(id)a3;
- (void)setLastApplicationLaunchedDate:(id)a3;
- (void)setLastEditorIdentifier:(id)a3;
- (void)setLastEditorName:(id)a3;
- (void)setLastMotionActivityState:(id)a3;
- (void)setLastUsedDate:(NSDate *)lastUsedDate;
- (void)setLatitude:(NSNumber *)latitude;
- (void)setLayerNames:(NSArray *)layerNames;
- (void)setLensModel:(NSString *)lensModel;
- (void)setLikelyJunk:(NSNumber *)likelyJunk;
- (void)setLinkName:(id)a3;
- (void)setLinkSubType:(id)a3;
- (void)setLinkType:(id)a3;
- (void)setLinks:(id)a3;
- (void)setLocal:(NSNumber *)local;
- (void)setLongitude:(NSNumber *)longitude;
- (void)setLyricist:(NSString *)lyricist;
- (void)setMailAttachmentKinds:(id)a3;
- (void)setMailAttachmentNames:(id)a3;
- (void)setMailAttachmentTypes:(id)a3;
- (void)setMailCategories:(int)a3;
- (void)setMailCategory:(id)a3;
- (void)setMailCategoryType:(int64_t)a3;
- (void)setMailConversationID:(id)a3;
- (void)setMailDateLastViewed:(id)a3;
- (void)setMailDateReceived:(id)a3;
- (void)setMailFlagColor:(id)a3;
- (void)setMailFlagged:(id)a3;
- (void)setMailGMailLabels:(id)a3;
- (void)setMailMessageHeader:(id)a3;
- (void)setMailMessageID:(id)a3;
- (void)setMailPriority:(id)a3;
- (void)setMailRead:(id)a3;
- (void)setMailRepliedTo:(id)a3;
- (void)setMailResultScoreL1:(id)a3;
- (void)setMailResultScoreL2:(id)a3;
- (void)setMailUseCount:(id)a3;
- (void)setMailUsedDates:(id)a3;
- (void)setMailVIP:(id)a3;
- (void)setMailboxIdentifiers:(NSArray *)mailboxIdentifiers;
- (void)setMatchingHints:(id)a3;
- (void)setMaxAperture:(NSNumber *)maxAperture;
- (void)setMediaAnalysisComplete:(id)a3;
- (void)setMediaAnalysisTimeRangeData:(id)a3;
- (void)setMediaAnalysisTimeRangeEmbeddings:(id)a3;
- (void)setMediaEmbeddingVersion:(id)a3;
- (void)setMediaTypes:(NSArray *)mediaTypes;
- (void)setMessageEffectType:(int)a3;
- (void)setMessageMentionedAddresses:(id)a3;
- (void)setMessagePinned:(id)a3;
- (void)setMessageRead:(id)a3;
- (void)setMessageService:(id)a3;
- (void)setMessageSuggestedContactName:(id)a3;
- (void)setMessageSuggestedContactPhotoPath:(id)a3;
- (void)setMessageTapbackStringValue:(id)a3;
- (void)setMessageTapbackType:(int)a3;
- (void)setMessageType:(id)a3;
- (void)setMetadataModificationDate:(NSDate *)metadataModificationDate;
- (void)setMeteringMode:(NSString *)meteringMode;
- (void)setMusicalGenre:(NSString *)musicalGenre;
- (void)setMusicalInstrumentCategory:(NSString *)musicalInstrumentCategory;
- (void)setMusicalInstrumentName:(NSString *)musicalInstrumentName;
- (void)setNamedLocation:(NSString *)namedLocation;
- (void)setNotificationCritical:(id)a3;
- (void)setNotificationTimeSensitive:(id)a3;
- (void)setOrganizations:(NSArray *)organizations;
- (void)setOrientation:(NSNumber *)orientation;
- (void)setOriginalFormat:(NSString *)originalFormat;
- (void)setOriginalSource:(NSString *)originalSource;
- (void)setOwnerIdentifier:(id)a3;
- (void)setOwnerName:(id)a3;
- (void)setPageCount:(NSNumber *)pageCount;
- (void)setPageHeight:(NSNumber *)pageHeight;
- (void)setPageWidth:(NSNumber *)pageWidth;
- (void)setParentFileIdentifier:(id)a3;
- (void)setParentFileItemID:(id)a3;
- (void)setPartiallyDownloaded:(id)a3;
- (void)setParticipants:(NSArray *)participants;
- (void)setPath:(NSString *)path;
- (void)setPayBalanceActionURL:(id)a3;
- (void)setPerformers:(NSArray *)performers;
- (void)setPhoneCallBackURL:(id)a3;
- (void)setPhoneCallStatus:(id)a3;
- (void)setPhoneCallType:(id)a3;
- (void)setPhoneNumbers:(NSArray *)phoneNumbers;
- (void)setPhoneProvider:(id)a3;
- (void)setPhoneSIM:(id)a3;
- (void)setPhotoEmbedding:(id)a3;
- (void)setPhotosAcquisitionMake:(id)a3;
- (void)setPhotosAcquisitionModel:(id)a3;
- (void)setPhotosAestheticScore:(id)a3;
- (void)setPhotosBusinessCategories:(id)a3;
- (void)setPhotosBusinessNames:(id)a3;
- (void)setPhotosCharacterRecognitionAnalysisVersion:(id)a3;
- (void)setPhotosCollectionKeyAssetUUID:(id)a3;
- (void)setPhotosCollectionResultCount:(id)a3;
- (void)setPhotosCollectionSubtitle:(id)a3;
- (void)setPhotosContainerIdentifier:(id)a3;
- (void)setPhotosContentAddedDate:(id)a3;
- (void)setPhotosContentCreationDate:(id)a3;
- (void)setPhotosContentCreationDateMonth:(id)a3;
- (void)setPhotosContentCreationDateMonths:(id)a3;
- (void)setPhotosContentCreationDateYear:(id)a3;
- (void)setPhotosContentCreationDateYears:(id)a3;
- (void)setPhotosContentDescription:(id)a3;
- (void)setPhotosContentRating:(id)a3;
- (void)setPhotosContentType:(id)a3;
- (void)setPhotosContributor:(id)a3;
- (void)setPhotosCurationScore:(id)a3;
- (void)setPhotosDisplayName:(id)a3;
- (void)setPhotosDonationState:(id)a3;
- (void)setPhotosDonationTimestamp:(id)a3;
- (void)setPhotosDuration:(id)a3;
- (void)setPhotosEntityTitle:(id)a3;
- (void)setPhotosEventCategories:(id)a3;
- (void)setPhotosEventNames:(id)a3;
- (void)setPhotosEventPerformers:(id)a3;
- (void)setPhotosFaceAnalysisVersion:(id)a3;
- (void)setPhotosFavorited:(id)a3;
- (void)setPhotosFavorites:(id)a3;
- (void)setPhotosFilename:(id)a3;
- (void)setPhotosHasTopMomentScore:(id)a3;
- (void)setPhotosHolidays:(id)a3;
- (void)setPhotosImageEmbeddingVersion:(id)a3;
- (void)setPhotosInferredTimeZoneOffset:(id)a3;
- (void)setPhotosIsCinematicVideo:(id)a3;
- (void)setPhotosIsProResVideo:(id)a3;
- (void)setPhotosKeywords:(id)a3;
- (void)setPhotosL2Signals:(id)a3;
- (void)setPhotosLibraryName:(id)a3;
- (void)setPhotosLocationKeywords:(id)a3;
- (void)setPhotosLocationPrivateEncryptedComputeAnalysisVersion:(id)a3;
- (void)setPhotosMeanings:(id)a3;
- (void)setPhotosMediaAnalysisImageVersion:(id)a3;
- (void)setPhotosMediaAnalysisVersion:(id)a3;
- (void)setPhotosMediaTypes:(id)a3;
- (void)setPhotosMemoryTitle:(id)a3;
- (void)setPhotosPartsOfDay:(id)a3;
- (void)setPhotosPartsOfWeek:(id)a3;
- (void)setPhotosPeople:(id)a3;
- (void)setPhotosPrivateEncryptedComputeAnalysisVersion:(id)a3;
- (void)setPhotosResultType:(id)a3;
- (void)setPhotosSavedFromAppBundleIdentifier:(id)a3;
- (void)setPhotosSavedFromAppName:(id)a3;
- (void)setPhotosSavingApplication:(id)a3;
- (void)setPhotosSavingApplicationBundleIdentifier:(id)a3;
- (void)setPhotosSceneAnalysisVersion:(id)a3;
- (void)setPhotosSceneClassifications:(id)a3;
- (void)setPhotosSceneIdentifiers:(id)a3;
- (void)setPhotosScenes:(id)a3;
- (void)setPhotosSeasons:(id)a3;
- (void)setPhotosSharedLibraryContributors:(id)a3;
- (void)setPhotosTimeZoneName:(id)a3;
- (void)setPhotosTimeZoneOffset:(id)a3;
- (void)setPhotosTitle:(id)a3;
- (void)setPhotosUtilityTypes:(id)a3;
- (void)setPhotosVideoEmbeddingVersion:(id)a3;
- (void)setPinned:(id)a3;
- (void)setPixelCount:(NSNumber *)pixelCount;
- (void)setPixelHeight:(NSNumber *)pixelHeight;
- (void)setPixelWidth:(NSNumber *)pixelWidth;
- (void)setPlayCount:(NSNumber *)playCount;
- (void)setPodcastName:(id)a3;
- (void)setPortraitFeatureVector:(id)a3;
- (void)setPortraitFeatureVectorVersion:(id)a3;
- (void)setPortraitNamedEntities:(id)a3;
- (void)setPortraitStaticScore:(id)a3;
- (void)setPostalCode:(NSString *)postalCode;
- (void)setPotentialEventMessage:(id)a3;
- (void)setPrimaryAccountNumberSuffix:(id)a3;
- (void)setPrimaryRecipients:(NSArray *)primaryRecipients;
- (void)setPrimaryTextEmbedding:(id)a3;
- (void)setProducer:(NSString *)producer;
- (void)setProfileName:(NSString *)profileName;
- (void)setProjects:(NSArray *)projects;
- (void)setProtectionClass:(id)a3;
- (void)setProviderDataTypeIdentifiers:(NSArray *)providerDataTypeIdentifiers;
- (void)setProviderDataTypes:(id)a3;
- (void)setProviderFileTypeIdentifiers:(NSArray *)providerFileTypeIdentifiers;
- (void)setProviderFileTypes:(id)a3;
- (void)setProviderInPlaceFileTypeIdentifiers:(NSArray *)providerInPlaceFileTypeIdentifiers;
- (void)setPublishers:(NSArray *)publishers;
- (void)setPunchoutLabel:(id)a3;
- (void)setQueryResultMatchedFields:(id)a3;
- (void)setQueryResultRelevance:(id)a3;
- (void)setRankingHint:(NSNumber *)rankingHint;
- (void)setRating:(NSNumber *)rating;
- (void)setRatingDescription:(NSString *)ratingDescription;
- (void)setReaderView:(id)a3;
- (void)setRecipientAddresses:(NSArray *)recipientAddresses;
- (void)setRecipientEmailAddresses:(NSArray *)recipientEmailAddresses;
- (void)setRecipientNames:(NSArray *)recipientNames;
- (void)setRecipientPhotosPersonIdentifiers:(id)a3;
- (void)setRecordingDate:(NSDate *)recordingDate;
- (void)setRedEyeOn:(NSNumber *)redEyeOn;
- (void)setRelatedAppBundleIdentifier:(id)a3;
- (void)setRelatedUniqueIdentifier:(NSString *)relatedUniqueIdentifier;
- (void)setRelationship:(id)a3;
- (void)setRequiresImport:(id)a3;
- (void)setRequiresMediaAnalysis:(id)a3;
- (void)setResolutionHeightDPI:(NSNumber *)resolutionHeightDPI;
- (void)setResolutionWidthDPI:(NSNumber *)resolutionWidthDPI;
- (void)setRestaurantMealType:(id)a3;
- (void)setRestaurantPartySize:(id)a3;
- (void)setRestaurantReservationForAddress:(id)a3;
- (void)setRestaurantReservationForAddressCountry:(id)a3;
- (void)setRestaurantReservationForAddressLocality:(id)a3;
- (void)setRestaurantReservationForAddressPostalCode:(id)a3;
- (void)setRestaurantReservationForAddressRegion:(id)a3;
- (void)setRestaurantReservationForAddressSynonyms:(id)a3;
- (void)setRestaurantReservationForName:(id)a3;
- (void)setRestaurantReservationForStreetAddress:(id)a3;
- (void)setRestaurantReservationForTelephone:(id)a3;
- (void)setRestaurantReservationId:(id)a3;
- (void)setRestaurantStartDate:(id)a3;
- (void)setRestaurantStartTime:(id)a3;
- (void)setRestaurantTimeZone:(id)a3;
- (void)setRestaurantUnderName:(id)a3;
- (void)setRichLinkID:(id)a3;
- (void)setRichLinkTitle:(id)a3;
- (void)setRichLinkURL:(id)a3;
- (void)setRights:(NSString *)rights;
- (void)setRole:(NSString *)role;
- (void)setSavingApplication:(id)a3;
- (void)setSavingApplicationBundleIdentifier:(id)a3;
- (void)setSearchableItemFlags:(int64_t)a3;
- (void)setSecondaryTextEmbedding:(id)a3;
- (void)setSecurityMethod:(NSString *)securityMethod;
- (void)setSerialNumber:(id)a3;
- (void)setShared:(id)a3;
- (void)setSharedItemContentType:(UTType *)sharedItemContentType;
- (void)setSharedItemCurrentUserRole:(id)a3;
- (void)setShortcutAvailability:(id)a3;
- (void)setSmartRepliesResponse:(id)a3;
- (void)setSmartRepliesStatus:(int)a3;
- (void)setSpeed:(NSNumber *)speed;
- (void)setStartDate:(NSDate *)startDate;
- (void)setStartDateTimeZone:(id)a3;
- (void)setStateOrProvince:(NSString *)stateOrProvince;
- (void)setStreamable:(NSNumber *)streamable;
- (void)setSubItemCount:(id)a3;
- (void)setSubThoroughfare:(NSString *)subThoroughfare;
- (void)setSubject:(NSString *)subject;
- (void)setSubtitle:(id)a3;
- (void)setSuggestedInvocationPhrase:(id)a3;
- (void)setSummarizationContentSynopsis:(id)a3;
- (void)setSummarizationContentTopLine:(id)a3;
- (void)setSummarizationContentTopic:(id)a3;
- (void)setSummarizationStatus:(int)a3;
- (void)setSummarizedIdentifiers:(id)a3;
- (void)setSupportFileType:(id)a3;
- (void)setSupportsNavigation:(NSNumber *)supportsNavigation;
- (void)setSupportsPhoneCall:(NSNumber *)supportsPhoneCall;
- (void)setSyndicatedContentServerDate:(id)a3;
- (void)setSyndicationStatus:(id)a3;
- (void)setTabStatus:(id)a3;
- (void)setTapbackAssociatedMessageID:(id)a3;
- (void)setTempo:(NSNumber *)tempo;
- (void)setTextContent:(NSString *)textContent;
- (void)setTextContentDataSource:(id)a3;
- (void)setTextContentPieces:(id)a3;
- (void)setTextSelected:(id)a3;
- (void)setTheme:(NSString *)theme;
- (void)setThoroughfare:(NSString *)thoroughfare;
- (void)setThreadIdentifier:(id)a3;
- (void)setThumbnailBundleID:(id)a3;
- (void)setThumbnailContentType:(id)a3;
- (void)setThumbnailData:(NSData *)thumbnailData;
- (void)setThumbnailSymbolName:(id)a3;
- (void)setThumbnailURL:(NSURL *)thumbnailURL;
- (void)setTimeIsUnknown:(id)a3;
- (void)setTimeSignature:(NSString *)timeSignature;
- (void)setTimestamp:(NSDate *)timestamp;
- (void)setTitle:(NSString *)title;
- (void)setTopic:(id)a3;
- (void)setTotalBitRate:(NSNumber *)totalBitRate;
- (void)setTrashed:(id)a3;
- (void)setURL:(NSURL *)URL;
- (void)setUniqueIdentifier:(id)a3;
- (void)setUploadError:(id)a3;
- (void)setUploaded:(id)a3;
- (void)setUploading:(id)a3;
- (void)setUrgencyStatus:(int)a3;
- (void)setUrlDescription:(id)a3;
- (void)setUserActivityType:(id)a3;
- (void)setUserCreated:(NSNumber *)userCreated;
- (void)setUserCurated:(NSNumber *)userCurated;
- (void)setUserOwned:(NSNumber *)userOwned;
- (void)setUserTags:(id)a3;
- (void)setValue:(id)value forCustomKey:(CSCustomAttributeKey *)key;
- (void)setVendorName:(id)a3;
- (void)setVersion:(NSString *)version;
- (void)setVersionIdentifier:(id)a3;
- (void)setVideoBitRate:(NSNumber *)videoBitRate;
- (void)setVisualAssetPriority:(id)a3;
- (void)setWeakRelatedUniqueIdentifier:(NSString *)weakRelatedUniqueIdentifier;
- (void)setWhiteBalance:(NSNumber *)whiteBalance;
- (void)setWorkAddresses:(id)a3;
- (void)setXmpCredit:(id)a3;
- (void)setXmpDigitalSourceType:(id)a3;
@end

@implementation CSSearchableItemAttributeSet

- (NSString)fileProviderDomainIdentifier
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"FPDomainIdentifier"];
}

- (NSNumber)fileSize
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemFileSize"];
}

- (id)_getNonNullValueForKey:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (id)[(NSMutableDictionary *)self->_mutableAttributes objectForKeyedSubscript:v4];
  v6 = (void *)*MEMORY[0x1E4F1D260];
  if (v5 == (id)*MEMORY[0x1E4F1D260])
  {
    id v7 = 0;
    goto LABEL_15;
  }
  if (v5)
  {
    id v7 = v5;
    goto LABEL_15;
  }
  if (!self->_decoder)
  {
    v9 = 0;
LABEL_13:
    id v7 = v9;
    v6 = v7;
    goto LABEL_14;
  }
  bzero(v15, 0x1000uLL);
  if ([v4 getCString:v15 maxLength:4096 encoding:4]
    && (long long v13 = 0uLL,
        $37FF168C8709F524D812460C59637AB1 v14 = 0,
        long long v11 = *(_OWORD *)&self->_codedAttributes.containerBytes,
        $37FF168C8709F524D812460C59637AB1 reference = self->_codedAttributes.reference,
        _MDPlistDictionaryGetPlistObjectForKey()))
  {
    decoder = self->_decoder;
    long long v11 = v13;
    $37FF168C8709F524D812460C59637AB1 reference = v14;
    v9 = [(CSDecoder *)decoder decodeObject:&v11];
  }
  else
  {
    v9 = 0;
  }
  if (v9 != v6) {
    goto LABEL_13;
  }
  id v7 = 0;
LABEL_14:

LABEL_15:

  return v7;
}

- (id)attributeForKey:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_mutableAttributes objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v5 = [(NSMutableDictionary *)self->_customAttributes objectForKeyedSubscript:v4];
    if (!v5)
    {
      if (self->_decoder)
      {
        bzero(buf, 0x1000uLL);
        if ([v4 getCString:buf maxLength:4096 encoding:4])
        {
          long long v16 = 0uLL;
          $37FF168C8709F524D812460C59637AB1 v17 = 0;
          long long v14 = *(_OWORD *)&self->_codedAttributes.containerBytes;
          $37FF168C8709F524D812460C59637AB1 reference = self->_codedAttributes.reference;
          if (_MDPlistDictionaryGetPlistObjectForKey())
          {
            decoder = self->_decoder;
            long long v14 = v16;
            $37FF168C8709F524D812460C59637AB1 reference = v17;
            id v7 = &v14;
            goto LABEL_7;
          }
          if (self->_hasCodedCustomAttributes)
          {
            long long v14 = *(_OWORD *)&self->_codedCustomAttributes.containerBytes;
            $37FF168C8709F524D812460C59637AB1 reference = self->_codedCustomAttributes.reference;
            if (_MDPlistDictionaryGetPlistObjectForKey())
            {
              long long v14 = v16;
              $37FF168C8709F524D812460C59637AB1 reference = v17;
              if (_MDPlistGetPlistObjectType() == 240)
              {
                long long v14 = v16;
                $37FF168C8709F524D812460C59637AB1 reference = v17;
                if (_MDPlistArrayGetCount() == 2)
                {
                  v8 = self->_decoder;
                  long long v14 = v16;
                  $37FF168C8709F524D812460C59637AB1 reference = v17;
                  _MDPlistArrayGetPlistObjectAtIndex();
                  id v7 = (long long *)&v13;
                  decoder = v8;
LABEL_7:
                  id v5 = [(CSDecoder *)decoder decodeObject:v7];
                  if (v5) {
                    goto LABEL_15;
                  }
                }
              }
            }
          }
        }
      }
      id v5 = [(NSDictionary *)self->_attributes objectForKeyedSubscript:v4];
    }
  }
LABEL_15:
  if (v5 == (void *)*MEMORY[0x1E4F1D260])
  {
    long long v11 = 0;
  }
  else
  {
    int v9 = [v4 isEqual:@"_kMDItemUserTags"];
    if (v5 && v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v20 = v4;
        __int16 v21 = 2112;
        v22 = v5;
        _os_log_impl(&dword_18D0E3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Bad field %@ %@", buf, 0x16u);
      }
      v18 = v5;
      id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
    }
    else
    {
      id v10 = v5;
    }
    long long v11 = v10;
  }

  return v11;
}

- (NSArray)primaryRecipients
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPrimaryRecipientPersons"];
}

- (NSArray)additionalRecipients
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemAdditionalRecipientPersons"];
}

- (NSArray)hiddenAdditionalRecipients
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemHiddenAdditionalRecipientPersons"];
}

- (NSArray)photosSharedLibraryContributors
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosSharedLibraryContributors"];
}

- (NSArray)photosPeople
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosPeople"];
}

- (NSArray)recipientEmailAddresses
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemRecipientEmailAddresses"];
}

- (NSArray)emailAddresses
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEmailAddresses"];
}

- (NSArray)authors
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemAuthorPersons"];
}

- (NSArray)recipientNames
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemRecipients"];
}

- (NSArray)authorNames
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemAuthors"];
}

- (NSDate)contentCreationDate
{
  return (NSDate *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemContentCreationDate"];
}

- (NSNumber)subItemCount
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemSubItemCount"];
}

- (NSString)ownerName
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemOwnerName"];
}

- (NSString)lastEditorName
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemLastEditorName"];
}

- (NSNumber)isUploading
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemIsUploading"];
}

- (NSNumber)isUploaded
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemIsUploaded"];
}

- (NSNumber)isTrashed
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemIsTrashed"];
}

- (NSNumber)isShared
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemIsShared"];
}

- (NSNumber)isDownloading
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemIsDownloading"];
}

- (NSNumber)favoriteRank
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemFavoriteRank"];
}

- (NSDate)lastUsedDate
{
  return (NSDate *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemLastUsedDate"];
}

- (NSString)displayName
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemDisplayName"];
}

- (NSDate)contentModificationDate
{
  return (NSDate *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemContentModificationDate"];
}

- (NSNumber)isUserOwned
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemUserOwned"];
}

- (NSArray)userTags
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemUserTags"];
}

- (void)setSubject:(NSString *)subject
{
}

- (void)setIdentifier:(NSString *)identifier
{
}

- (void)setTheme:(NSString *)theme
{
}

- (void)setContentDescription:(NSString *)contentDescription
{
}

- (void)setRankingHint:(NSNumber *)rankingHint
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchingHints, 0);
  objc_storeStrong((id *)&self->_contentDecoder, 0);
  objc_storeStrong((id *)&self->_decoder, 0);
  objc_storeStrong((id *)&self->_customAttributes, 0);
  objc_storeStrong((id *)&self->_mutableAttributes, 0);

  objc_storeStrong((id *)&self->_attributes, 0);
}

- (void)setKeywords:(NSArray *)keywords
{
  id v4 = keywords;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemKeywords"];
}

- (void)setAttribute:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(CSSearchableItemAttributeSet *)self mutableAttributes];
  [v8 setObject:v7 forKeyedSubscript:v6];

  attributes = self->_attributes;
  self->_attributes = 0;
}

- (CSSearchableItemAttributeSet)initWithKnownKeysDictionary:(id)a3
{
  result = [(CSSearchableItemAttributeSet *)self initWithMutableDictionary:a3];
  if (result) {
    result->_hasKnownKeysDictionary = 1;
  }
  return result;
}

- (CSSearchableItemAttributeSet)initWithMutableDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSSearchableItemAttributeSet;
  id v6 = [(CSSearchableItemAttributeSet *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mutableAttributes, a3);
  }

  return v7;
}

- (void)_setArrayValue:(id)a3 withItemClass:(Class)a4 forKey:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if (!v7) {
    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v7 = v7;
    uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)v20;
      while (2)
      {
        uint64_t v13 = 0;
        uint64_t v14 = v11 + v10;
        do
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v7);
          }
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            long long v16 = logForCSLogCategoryDefault();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              $37FF168C8709F524D812460C59637AB1 v17 = objc_opt_class();
              *(_DWORD *)buf = 138412802;
              v24 = v17;
              __int16 v25 = 2048;
              uint64_t v26 = v11 + v13;
              __int16 v27 = 2112;
              id v28 = v8;
              id v18 = v17;
              _os_log_error_impl(&dword_18D0E3000, v16, OS_LOG_TYPE_ERROR, "Invalid value type:%@ for the item at index %lu in the array value for key:%@", buf, 0x20u);
            }
            goto LABEL_22;
          }
          ++v13;
        }
        while (v10 != v13);
        uint64_t v10 = [v7 countByEnumeratingWithState:&v19 objects:v29 count:16];
        uint64_t v11 = v14;
        if (v10) {
          continue;
        }
        break;
      }

      if (v14) {
        goto LABEL_21;
      }
    }
    else
    {
    }
    id v7 = 0;
LABEL_21:
    -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:](self, "_setValue:withClass:forKey:copy:", v7, 0, v8, 1, v19);
    goto LABEL_22;
  }
  v15 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:]();
  }

LABEL_22:
}

- (void)_setStringValue:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v7 withClass:objc_opt_class() forKey:v6 copy:1];
}

- (void)_setValue:(id)a3 withClass:(Class)a4 forKey:(id)a5 copy:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a5;
  if (self->_hasKnownKeysDictionary && self->_mutableAttributes)
  {
    uint64_t v12 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:self->_mutableAttributes];
    mutableAttributes = self->_mutableAttributes;
    self->_mutableAttributes = v12;

    self->_hasKnownKeysDictionary = 0;
  }
  if (!v10)
  {
    uint64_t v16 = *MEMORY[0x1E4F1D260];
    uint64_t v14 = [(CSSearchableItemAttributeSet *)self mutableAttributes];
    [v14 setObject:v16 forKeyedSubscript:v11];
LABEL_12:

LABEL_13:
    attributes = self->_attributes;
    self->_attributes = 0;

    goto LABEL_14;
  }
  if (!a4 || (objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v14 = v10;
    if (v6) {
      uint64_t v14 = (void *)[v10 copy];
    }
    v15 = [(CSSearchableItemAttributeSet *)self mutableAttributes];
    [v15 setObject:v14 forKeyedSubscript:v11];

    if (!v6) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  id v18 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:]();
  }

LABEL_14:
}

- (NSMutableDictionary)mutableAttributes
{
  mutableAttributes = self->_mutableAttributes;
  if (!mutableAttributes)
  {
    id v4 = self;
    objc_sync_enter(v4);
    if (!self->_mutableAttributes)
    {
      id v5 = (NSMutableDictionary *)objc_opt_new();
      BOOL v6 = self->_mutableAttributes;
      self->_mutableAttributes = v5;
    }
    objc_sync_exit(v4);

    mutableAttributes = self->_mutableAttributes;
  }

  return mutableAttributes;
}

+ (id)_allKeys
{
  if (_allKeys__once != -1) {
    dispatch_once(&_allKeys__once, &__block_literal_global_181);
  }
  v2 = (void *)_allKeys__allKeys;

  return v2;
}

- (void)encodeWithCSCoder:(id)a3 includeText:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [v6 beginType:"CSSearchableItemAttributeSet"];
  objc_msgSend(v6, "encodeInt32:", -[CSSearchableItemAttributeSet searchableItemFlags](self, "searchableItemFlags"));
  if (self->_decoder)
  {
    uint64_t v7 = [(NSMutableDictionary *)self->_mutableAttributes count];
    [v6 beginDictionary];
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    long long v21 = __80__CSSearchableItemAttributeSet_CSCoderAdditions__encodeWithCSCoder_includeText___block_invoke;
    long long v22 = &unk_1E5549870;
    BOOL v25 = v7 != 0;
    uint64_t v23 = self;
    id v8 = v6;
    id v24 = v8;
    long long v17 = *(_OWORD *)&self->_codedAttributes.containerBytes;
    $37FF168C8709F524D812460C59637AB1 reference = self->_codedAttributes.reference;
    _MDPlistDictionaryIterate();
    if (v4 && self->_contentDecoder)
    {
      long long v17 = *(_OWORD *)&self->_contentObj.containerBytes;
      $37FF168C8709F524D812460C59637AB1 reference = self->_contentObj.reference;
      int PlistObjectType = _MDPlistGetPlistObjectType();
      if (PlistObjectType == 246)
      {
        id v10 = MDItemHTMLContentData;
      }
      else
      {
        if ((PlistObjectType & 0xFFFFFFFE) != 0xF4) {
          goto LABEL_13;
        }
        id v10 = MDItemTextContent;
      }
      id v11 = *v10;
      if (v7)
      {
        uint64_t v12 = [(NSMutableDictionary *)self->_mutableAttributes objectForKeyedSubscript:*v10];

        if (v12) {
          goto LABEL_14;
        }
      }
      [v8 encodeObject:v11];
      long long v17 = *(_OWORD *)&self->_contentObj.containerBytes;
      $37FF168C8709F524D812460C59637AB1 reference = self->_contentObj.reference;
      [v8 encodeMDPlistObject:&v17];
    }
LABEL_13:
    if (!v7)
    {
LABEL_15:
      [v8 endDictionary];
      BOOL hasCodedCustomAttributes = self->_hasCodedCustomAttributes;
      uint64_t v14 = [(NSMutableDictionary *)self->_customAttributes count];
      uint64_t v15 = v14;
      if (hasCodedCustomAttributes)
      {
        [v8 beginDictionary];
        id v16 = v8;
        long long v17 = *(_OWORD *)&self->_codedAttributes.containerBytes;
        $37FF168C8709F524D812460C59637AB1 reference = self->_codedAttributes.reference;
        _MDPlistDictionaryIterate();
        if (v15) {
          [(NSMutableDictionary *)self->_customAttributes encodeKeysAndValuesWithCSCoder:v16 filterBlock:0];
        }
        [v16 endDictionary];
      }
      else if (v14)
      {
        [v8 encodeObject:self->_customAttributes];
      }

      goto LABEL_22;
    }
LABEL_14:
    [(NSMutableDictionary *)self->_mutableAttributes encodeKeysAndValuesWithCSCoder:v8 filterBlock:0];
    goto LABEL_15;
  }
  [v6 beginDictionary];
  [(NSMutableDictionary *)self->_mutableAttributes encodeKeysAndValuesWithCSCoder:v6 filterBlock:0];
  [v6 endDictionary];
  if ([(NSMutableDictionary *)self->_customAttributes count]) {
    [v6 encodeObject:self->_customAttributes];
  }
LABEL_22:
  [v6 endType];
}

- (void)encodeWithCSCoder:(id)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v7 = (id)objc_opt_new();
  [(CSSearchableItemAttributeSet *)self encodeWithCSCoder:v7 includeText:1];
  id v5 = [v7 data];
  id v6 = (void *)[v5 copy];
  [v4 encodeObject:v6 forKey:@"container"];
}

- (NSString)fileProviderID
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemFileProviderID"];
}

- (NSString)FPFilename
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"FPFilename"];
}

- (NSURL)contentURL
{
  v2 = [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemContentURL"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
LABEL_5:
    id v4 = v3;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
    goto LABEL_5;
  }
  id v4 = 0;
LABEL_7:

  return (NSURL *)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (id *)v4;
    int64_t searchableItemFlags = self->_searchableItemFlags;
    if (searchableItemFlags != [v5 searchableItemFlags])
    {
      BOOL v11 = 0;
LABEL_22:

      goto LABEL_23;
    }
    id v7 = [(CSSearchableItemAttributeSet *)self attributes];
    id v8 = [v5 attributes];
    if (v7 != v8 && ![v7 isEqualToDictionary:v8])
    {
      BOOL v11 = 0;
LABEL_21:

      goto LABEL_22;
    }
    int v9 = *((unsigned __int8 *)v5 + 8);
    id v10 = v5[4];
    if ([(NSMutableDictionary *)self->_customAttributes count] || self->_hasCodedCustomAttributes)
    {
      if (!v9 && !v10)
      {
        BOOL v11 = 0;
LABEL_20:

        goto LABEL_21;
      }
    }
    else
    {
      uint64_t v12 = [v10 count];
      BOOL v11 = 0;
      if (v9 || v12) {
        goto LABEL_20;
      }
    }
    uint64_t v13 = [(CSSearchableItemAttributeSet *)self customAttributeDictionary];
    uint64_t v14 = [v5 customAttributeDictionary];
    BOOL v11 = 1;
    if (v13 != v14)
    {
      uint64_t v15 = [v13 count];
      if (v15 != [v14 count] && !objc_msgSend(v13, "isEqualToDictionary:", v14)) {
        BOOL v11 = 0;
      }
    }

    goto LABEL_20;
  }
  BOOL v11 = 0;
LABEL_23:

  return v11;
}

- (NSDictionary)attributes
{
  p_attributes = &self->_attributes;
  attributes = self->_attributes;
  if (!attributes)
  {
    mutableAttributes = self->_mutableAttributes;
    if (self->_hasKnownKeysDictionary) {
      id v6 = mutableAttributes;
    }
    else {
      id v6 = (NSMutableDictionary *)[(NSMutableDictionary *)mutableAttributes copy];
    }
    id v7 = v6;
    decoder = self->_decoder;
    if (decoder)
    {
      long long v14 = *(_OWORD *)&self->_codedAttributes.containerBytes;
      $37FF168C8709F524D812460C59637AB1 reference = self->_codedAttributes.reference;
      int v9 = [(CSDecoder *)decoder decodeObject:&v14];
      if ([v9 count])
      {
        if ([(NSMutableDictionary *)v7 count])
        {
          id v10 = (NSMutableDictionary *)[v9 mutableCopy];
          [(NSMutableDictionary *)v10 addEntriesFromDictionary:v7];
          BOOL v11 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v10];

          id v7 = v10;
        }
        else
        {
          BOOL v11 = v9;
        }

        id v7 = v11;
      }
    }
    if (v7) {
      uint64_t v12 = v7;
    }
    else {
      uint64_t v12 = (NSMutableDictionary *)MEMORY[0x1E4F1CC08];
    }
    objc_storeStrong((id *)p_attributes, v12);

    attributes = *p_attributes;
  }

  return attributes;
}

- (void)setBundleID:(id)a3
{
}

- (void)setContentObj:(id)a3 obj:(id *)a4
{
  objc_storeStrong((id *)&self->_contentDecoder, a3);
  long long v6 = *(_OWORD *)&a4->var0;
  self->_contentObj.$37FF168C8709F524D812460C59637AB1 reference = ($37FF168C8709F524D812460C59637AB1)a4->var2;
  *(_OWORD *)&self->_contentObj.containerBytes = v6;
}

- (CSSearchableItemAttributeSet)initWithDecoder:(id)a3 obj:(id *)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CSSearchableItemAttributeSet;
  id v8 = [(CSSearchableItemAttributeSet *)&v14 init];
  if (!v8) {
    goto LABEL_9;
  }
  if (_MDPlistGetPlistObjectType() != 240)
  {
LABEL_8:

    id v8 = 0;
    goto LABEL_9;
  }
  int Count = _MDPlistArrayGetCount();
  if ((Count - 3) > 1)
  {
    objc_storeStrong((id *)v8 + 6, a3);
    goto LABEL_8;
  }
  int v10 = Count;
  long long v12 = *(_OWORD *)&a4->var0;
  $89967B733E8F0E8859294B5D59E7AF0F var2 = a4->var2;
  _MDPlistArrayGetPlistObjectAtIndex();
  [v8 setSearchableItemFlags:_MDPlistNumberGetIntValue()];
  _MDPlistArrayGetPlistObjectAtIndex();
  *(_OWORD *)(v8 + 72) = v12;
  *(($89967B733E8F0E8859294B5D59E7AF0F *)v8 + 11) = var2;
  if (v10 == 4)
  {
    v8[8] = 1;
    _MDPlistArrayGetPlistObjectAtIndex();
    *((_OWORD *)v8 + 6) = v12;
    *(($89967B733E8F0E8859294B5D59E7AF0F *)v8 + 14) = var2;
  }
  objc_storeStrong((id *)v8 + 6, a3);
LABEL_9:

  return (CSSearchableItemAttributeSet *)v8;
}

- (void)setSearchableItemFlags:(int64_t)a3
{
  self->_int64_t searchableItemFlags = a3;
}

- (void)setProtectionClass:(id)a3
{
}

- (NSString)bundleID
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemBundleID"];
}

- (int64_t)searchableItemFlags
{
  return self->_searchableItemFlags;
}

- (NSString)uniqueIdentifier
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemExternalID"];
}

- (NSString)domainIdentifier
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemDomainIdentifier"];
}

- (void)_setDateValue:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v7 withClass:objc_opt_class() forKey:v6 copy:0];
}

- (void)setExpirationDate:(id)a3
{
}

- (void)setUniqueIdentifier:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v5 = [(CSSearchableItemAttributeSet *)self uniqueIdentifier];
    id v6 = v5;
    if (v5)
    {
      id v8 = v5;
    }
    else
    {
      id v7 = [MEMORY[0x1E4F29128] UUID];
      id v8 = [v7 UUIDString];
    }
    id v4 = v8;
  }
  id v9 = v4;
  [(CSSearchableItemAttributeSet *)self _setStringValue:v4 forKey:@"_kMDItemExternalID"];
}

- (NSDate)expirationDate
{
  return (NSDate *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemExpirationDate"];
}

- (void)setDomainIdentifier:(NSString *)domainIdentifier
{
}

- (NSString)weakRelatedUniqueIdentifier
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemWeakRelatedUniqueIdentifier"];
}

- (NSString)title
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemTitle"];
}

- (NSString)appEntityType
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemAppEntityTypeIdentifier"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());

  return (id)[v4 initWithAttributeSet:self];
}

- (NSArray)contentTypeTree
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemContentTypeTree"];
}

- (NSDictionary)portraitNamedEntities
{
  return (NSDictionary *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemPortraitNamedEntities"];
}

- (NSArray)documentUnderstandingTopics
{
  v6[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"kMDItemDocumentUnderstandingTopicsLabels";
  v6[1] = @"kMDItemDocumentUnderstandingTopicsSynonyms";
  v6[2] = @"kMDItemDocumentUnderstandingTopicsSynonymsCounts";
  v6[3] = @"kMDItemDocumentUnderstandingTopicsConfidences";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
  id v4 = [(CSSearchableItemAttributeSet *)self _getExternalAnalysisTagsForPrimaryAttribute:@"kMDItemDocumentUnderstandingTopics" analysisAttributes:v3 getTagBlock:&__block_literal_global_1466];

  return (NSArray *)v4;
}

- (NSDictionary)emailHeaders
{
  return (NSDictionary *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEmailHeadersDictionary"];
}

- (void)setContentTypeTree:(NSArray *)contentTypeTree
{
  id v4 = contentTypeTree;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemContentTypeTree"];
}

- (NSString)contentType
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemContentType"];
}

- (NSNumber)requiresImport
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemRequiresImport"];
}

- (NSArray)extractedPhoneNumbers
{
  v12[4] = *MEMORY[0x1E4F143B8];
  id v3 = [(CSSearchableItemAttributeSet *)self attributeForKey:@"kMDItemExtractedPhoneNumbersCountryCodes"];
  uint64_t v4 = [v3 count];
  v12[0] = @"kMDItemExtractedPhoneNumbersLabels";
  v12[1] = @"kMDItemExtractedPhoneNumbersSynonyms";
  v12[2] = @"kMDItemExtractedPhoneNumbersSynonymsCounts";
  v12[3] = @"kMDItemExtractedPhoneNumbersConfidences";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__CSSearchableItemAttributeSet_CSPhotos_Private__extractedPhoneNumbers__block_invoke;
  v9[3] = &unk_1E5549820;
  id v10 = v3;
  uint64_t v11 = v4;
  id v6 = v3;
  id v7 = [(CSSearchableItemAttributeSet *)self _getExternalAnalysisTagsForPrimaryAttribute:@"kMDItemExtractedPhoneNumbers" analysisAttributes:v5 getTagBlock:v9];

  return (NSArray *)v7;
}

- (NSArray)documentUnderstandingCategories
{
  v6[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"kMDItemDocumentUnderstandingCategoriesLabels";
  v6[1] = @"kMDItemDocumentUnderstandingCategoriesSynonyms";
  v6[2] = @"kMDItemDocumentUnderstandingCategoriesSynonymsCounts";
  v6[3] = @"kMDItemDocumentUnderstandingCategoriesConfidences";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
  uint64_t v4 = [(CSSearchableItemAttributeSet *)self _getExternalAnalysisTagsForPrimaryAttribute:@"kMDItemDocumentUnderstandingCategories" analysisAttributes:v3 getTagBlock:&__block_literal_global_1468];

  return (NSArray *)v4;
}

- (id)_getExternalAnalysisTagsForPrimaryAttribute:(id)a3 analysisAttributes:(id)a4 getTagBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *, void *, double))a5;
  if ([v9 count] != 4) {
    -[CSSearchableItemAttributeSet(CSPhotos_Private) _getExternalAnalysisTagsForPrimaryAttribute:analysisAttributes:getTagBlock:]();
  }
  uint64_t v11 = [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:v8];
  long long v12 = v11;
  if (v11)
  {
    id v13 = v11;
    goto LABEL_31;
  }
  objc_super v14 = [v9 objectAtIndexedSubscript:0];
  uint64_t v15 = [(CSSearchableItemAttributeSet *)self attributeForKey:v14];

  uint64_t v16 = [v15 count];
  if (!v16)
  {
    id v13 = 0;
    goto LABEL_30;
  }
  uint64_t v17 = v16;
  id v40 = v8;
  id v18 = [v9 objectAtIndexedSubscript:1];
  uint64_t v19 = [(CSSearchableItemAttributeSet *)self attributeForKey:v18];

  v41 = v19;
  unint64_t v43 = [v19 count];
  uint64_t v20 = [v9 objectAtIndexedSubscript:2];
  long long v21 = [(CSSearchableItemAttributeSet *)self attributeForKey:v20];

  unint64_t v46 = [v21 count];
  id v39 = v9;
  long long v22 = [v9 objectAtIndexedSubscript:3];
  uint64_t v23 = self;
  id v24 = v21;
  BOOL v25 = [(CSSearchableItemAttributeSet *)v23 attributeForKey:v22];

  unint64_t v45 = [v25 count];
  uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v17];
  unint64_t v27 = 0;
  uint64_t v44 = 0;
  v42 = v10;
  do
  {
    id v28 = [v15 objectAtIndexedSubscript:v27];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_21;
    }
    double v29 = 0.0;
    if (v27 < v45)
    {
      uint64_t v30 = [v25 objectAtIndexedSubscript:v27];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v30 doubleValue];
        double v29 = v31;
      }
    }
    if (v27 < v46)
    {
      v32 = [v24 objectAtIndexedSubscript:v27];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v33 = [v32 unsignedIntegerValue];

        if (v33)
        {
          if (v33 + v44 <= v43)
          {
            v34 = objc_msgSend(v41, "subarrayWithRange:");
          }
          else
          {
            v34 = 0;
          }
          v44 += v33;
          id v10 = v42;
          goto LABEL_18;
        }
      }
      else
      {
      }
    }
    v34 = 0;
LABEL_18:
    v35 = v10[2](v10, v27, v28, v34, v29);
    if (v35) {
      [v26 addObject:v35];
    }

LABEL_21:
    ++v27;
  }
  while (v17 != v27);
  if ([v26 count]) {
    v36 = v26;
  }
  else {
    v36 = 0;
  }
  v37 = v24;
  id v13 = v36;

  id v9 = v39;
  id v8 = v40;
  long long v12 = 0;
LABEL_30:

LABEL_31:

  return v13;
}

- (NSArray)photosSceneClassifications
{
  v34[4] = *MEMORY[0x1E4F143B8];
  id v3 = [(CSSearchableItemAttributeSet *)self attributeForKey:@"kMDItemPhotosSceneClassificationIdentifiers"];
  uint64_t v19 = [v3 count];
  uint64_t v4 = [(CSSearchableItemAttributeSet *)self attributeForKey:@"kMDItemPhotosSceneClassificationAreas"];
  uint64_t v5 = [v4 count];
  id v6 = [(CSSearchableItemAttributeSet *)self attributeForKey:@"kMDItemPhotosSceneClassificationBoundingBoxes"];
  uint64_t v18 = [v6 count];
  id v7 = [(CSSearchableItemAttributeSet *)self attributeForKey:@"kMDItemPhotosSceneClassificationTypes"];
  uint64_t v8 = [v7 count];
  id v9 = [(CSSearchableItemAttributeSet *)self attributeForKey:@"kMDItemPhotosSceneClassificationMediaTypes"];
  uint64_t v10 = [v9 count];
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v33[3] = 0;
  v34[0] = @"kMDItemPhotosSceneClassificationLabels";
  v34[1] = @"kMDItemPhotosSceneClassificationSynonyms";
  v34[2] = @"kMDItemPhotosSceneClassificationSynonymsCounts";
  v34[3] = @"kMDItemPhotosSceneClassificationConfidences";
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:4];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __76__CSSearchableItemAttributeSet_CSPhotos_Private__photosSceneClassifications__block_invoke;
  v21[3] = &unk_1E55497D8;
  uint64_t v28 = v19;
  id v20 = v3;
  id v22 = v20;
  uint64_t v29 = v8;
  id v12 = v7;
  id v23 = v12;
  uint64_t v30 = v10;
  id v13 = v9;
  id v24 = v13;
  uint64_t v31 = v5;
  id v14 = v4;
  uint64_t v32 = v18;
  id v25 = v14;
  unint64_t v27 = v33;
  id v15 = v6;
  id v26 = v15;
  uint64_t v16 = [(CSSearchableItemAttributeSet *)self _getExternalAnalysisTagsForPrimaryAttribute:@"kMDItemPhotosSceneClassification" analysisAttributes:v11 getTagBlock:v21];

  _Block_object_dispose(v33, 8);

  return (NSArray *)v16;
}

- (id)_getNumericAnalysisTagsForPrimaryAttribute:(id)a3 analysisAttributes:(id)a4 getTagBlock:(id)a5
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v8;
  id v47 = v9;
  v48 = (void (**)(id, void, void *, id, double))a5;
  uint64_t v11 = [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:v8];
  if (v11)
  {
    id v12 = v11;
    id v13 = v11;
  }
  else
  {
    v41 = [NSString stringWithFormat:@"_%@Values", v8];
    id v14 = -[CSSearchableItemAttributeSet attributeForKey:](self, "attributeForKey:");
    uint64_t v15 = [v14 count];
    if (v15)
    {
      uint64_t v16 = v15;
      id v40 = v10;
      id v39 = [NSString stringWithFormat:@"_%@Confidences", v10];
      v42 = -[CSSearchableItemAttributeSet attributeForKey:](self, "attributeForKey:");
      unint64_t v44 = [v42 count];
      unint64_t v17 = 0;
      unint64_t v43 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v16];
      uint64_t v45 = v16;
      unint64_t v46 = v14;
      do
      {
        uint64_t v18 = [v14 objectAtIndexedSubscript:v17];
        if (v18)
        {
          uint64_t v19 = [v14 objectAtIndexedSubscript:v17];
          objc_opt_class();
          id v20 = &unk_1EDBD6C38;
          if (objc_opt_isKindOfClass())
          {
            id v20 = [v14 objectAtIndexedSubscript:v17];
          }
        }
        else
        {
          id v20 = &unk_1EDBD6C38;
        }
        v49 = v20;

        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id v21 = v47;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v50 objects:v54 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          id v24 = 0;
          uint64_t v25 = *(void *)v51;
          do
          {
            for (uint64_t i = 0; i != v23; ++i)
            {
              if (*(void *)v51 != v25) {
                objc_enumerationMutation(v21);
              }
              uint64_t v27 = *(void *)(*((void *)&v50 + 1) + 8 * i);
              if (!v24) {
                id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              }
              uint64_t v28 = [(CSSearchableItemAttributeSet *)self attributeForKey:v27];
              uint64_t v29 = [v28 objectAtIndexedSubscript:v17];
              uint64_t v30 = (void *)v29;
              uint64_t v31 = &unk_1EDBD69D0;
              if (v29) {
                uint64_t v31 = (void *)v29;
              }
              id v32 = v31;

              [v24 addObject:v32];
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v50 objects:v54 count:16];
          }
          while (v23);
        }
        else
        {
          id v24 = 0;
        }

        double v33 = 0.0;
        id v14 = v46;
        if (v17 < v44)
        {
          v34 = [v42 objectAtIndexedSubscript:v17];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v34 doubleValue];
            double v33 = v35;
          }
        }
        v36 = v48[2](v48, v17, v49, v24, v33);
        if (v36) {
          [v43 addObject:v36];
        }

        ++v17;
      }
      while (v17 != v45);
      if ([v43 count]) {
        v37 = v43;
      }
      else {
        v37 = 0;
      }
      id v13 = v37;

      uint64_t v10 = v40;
    }
    else
    {
      id v13 = (id)MEMORY[0x1E4F1CBF0];
    }

    id v12 = 0;
  }

  return v13;
}

- (NSArray)extractedCurrencies
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNumericAnalysisTagsForPrimaryAttribute:@"kMDItemExtractedCurrencies" analysisAttributes:&unk_1EDBD6178 getTagBlock:&__block_literal_global_814];
}

- (NSArray)extractedAddresses
{
  v6[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"kMDItemExtractedAddressesLabels";
  v6[1] = @"kMDItemExtractedAddressesSynonyms";
  v6[2] = @"kMDItemExtractedAddressesSynonymsCounts";
  v6[3] = @"kMDItemExtractedAddressesConfidences";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
  uint64_t v4 = [(CSSearchableItemAttributeSet *)self _getExternalAnalysisTagsForPrimaryAttribute:@"kMDItemExtractedAddresses" analysisAttributes:v3 getTagBlock:&__block_literal_global_1472];

  return (NSArray *)v4;
}

- (NSArray)extractedFlights
{
  v6[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"kMDItemExtractedFlightsLabels";
  v6[1] = @"kMDItemExtractedFlightsSynonyms";
  v6[2] = @"kMDItemExtractedFlightsSynonymsCounts";
  v6[3] = @"kMDItemExtractedFlightsConfidences";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
  uint64_t v4 = [(CSSearchableItemAttributeSet *)self _getExternalAnalysisTagsForPrimaryAttribute:@"kMDItemExtractedFlights" analysisAttributes:v3 getTagBlock:&__block_literal_global_1474];

  return (NSArray *)v4;
}

- (void)_standardizeMarkAs
{
  id v31 = [(CSSearchableItemAttributeSet *)self mutableAttributes];
  id v3 = [(CSSearchableItemAttributeSet *)self userSharedSentDate];
  if (v3)
  {
    uint64_t v4 = [(CSSearchableItemAttributeSet *)self userSharedSentSender];
    uint64_t v5 = [(CSSearchableItemAttributeSet *)self userSharedSentSenderHandle];
    id v6 = [(CSSearchableItemAttributeSet *)self userSharedSentTransport];
    id v7 = [(CSSearchableItemAttributeSet *)self userSharedSentRecipient];
    id v8 = [(CSSearchableItemAttributeSet *)self userSharedSentRecipientHandle];
    [v31 setObject:0 forKeyedSubscript:@"kMDItemUserSharedSentDate"];
    [v31 setObject:0 forKeyedSubscript:@"kMDItemUserSharedSentSender"];
    [v31 setObject:0 forKeyedSubscript:@"kMDItemUserSharedSentSenderHandle"];
    [v31 setObject:0 forKeyedSubscript:@"kMDItemUserSharedSentTransport"];
    [v31 setObject:0 forKeyedSubscript:@"kMDItemUserSharedSentRecipient"];
    [v31 setObject:0 forKeyedSubscript:@"kMDItemUserSharedSentRecipientHandle"];
    uint64_t v9 = [v3 count];
    if (v9)
    {
      uint64_t v10 = v9;
      if (v9 == [v4 count]
        && v10 == [v5 count]
        && v10 == [v6 count]
        && v10 == [v5 count]
        && v10 == [v7 count]
        && v10 == [v8 count])
      {
        [v31 setObject:v3 forKeyedSubscript:@":PR::A:kMDItemUserSharedSentDate"];
        [v31 setObject:v4 forKeyedSubscript:@":PR::A:kMDItemUserSharedSentSender"];
        [v31 setObject:v5 forKeyedSubscript:@":PR::A:kMDItemUserSharedSentSenderHandle"];
        [v31 setObject:v6 forKeyedSubscript:@":PR::A:kMDItemUserSharedSentTransport"];
        [v31 setObject:v7 forKeyedSubscript:@":PR::A:kMDItemUserSharedSentRecipientHandle"];
        [v31 setObject:v8 forKeyedSubscript:@":PR::A:kMDItemUserSharedSentRecipient"];
      }
    }
  }
  uint64_t v11 = [(CSSearchableItemAttributeSet *)self userSharedReceivedDate];
  if (v11)
  {
    id v12 = [(CSSearchableItemAttributeSet *)self userSharedReceivedSender];
    id v13 = [(CSSearchableItemAttributeSet *)self userSharedReceivedSenderHandle];
    id v14 = [(CSSearchableItemAttributeSet *)self userSharedReceivedTransport];
    uint64_t v15 = [(CSSearchableItemAttributeSet *)self userSharedReceivedRecipient];
    uint64_t v16 = [(CSSearchableItemAttributeSet *)self userSharedReceivedRecipientHandle];
    [v31 setObject:0 forKeyedSubscript:@"kMDItemUserSharedReceivedDate"];
    [v31 setObject:0 forKeyedSubscript:@"kMDItemUserSharedReceivedSender"];
    [v31 setObject:0 forKeyedSubscript:@"kMDItemUserSharedReceivedSenderHandle"];
    [v31 setObject:0 forKeyedSubscript:@"kMDItemUserSharedReceivedTransport"];
    [v31 setObject:0 forKeyedSubscript:@"kMDItemUserSharedReceivedRecipient"];
    [v31 setObject:0 forKeyedSubscript:@"kMDItemUserSharedReceivedRecipientHandle"];
    uint64_t v17 = [v11 count];
    if (v17)
    {
      uint64_t v18 = v17;
      if (v17 == [v12 count]
        && v18 == [v13 count]
        && v18 == [v14 count]
        && v18 == [v13 count]
        && v18 == [v15 count]
        && v18 == [v16 count])
      {
        [v31 setObject:v11 forKeyedSubscript:@":PR::A:kMDItemUserSharedReceivedDate"];
        [v31 setObject:v12 forKeyedSubscript:@":PR::A:kMDItemUserSharedReceivedSender"];
        [v31 setObject:v13 forKeyedSubscript:@":PR::A:kMDItemUserSharedReceivedSenderHandle"];
        [v31 setObject:v14 forKeyedSubscript:@":PR::A:kMDItemUserSharedReceivedTransport"];
        [v31 setObject:v15 forKeyedSubscript:@":PR::A:kMDItemUserSharedReceivedRecipientHandle"];
        [v31 setObject:v16 forKeyedSubscript:@":PR::A:kMDItemUserSharedReceivedRecipient"];
      }
    }
  }
  uint64_t v19 = [(CSSearchableItemAttributeSet *)self userPrintedDate];
  if (v19)
  {
    id v20 = [(CSSearchableItemAttributeSet *)self userPrintedUserHandle];
    [v31 setObject:0 forKeyedSubscript:@"kMDItemUserPrintedDate"];
    [v31 setObject:0 forKeyedSubscript:@"kMDItemUserPrintedUserHandle"];
    uint64_t v21 = [v19 count];
    if (v21 && v21 == [v20 count])
    {
      [v31 setObject:v19 forKeyedSubscript:@":PR::A:kMDItemUserPrintedDate"];
      [v31 setObject:v20 forKeyedSubscript:@":PR::A:kMDItemUserPrintedUserHandle"];
    }
  }
  uint64_t v22 = [(CSSearchableItemAttributeSet *)self userDownloadedDate];
  if (v22)
  {
    uint64_t v23 = [(CSSearchableItemAttributeSet *)self userDownloadedUserHandle];
    [v31 setObject:0 forKeyedSubscript:@"kMDItemUserDownloadedDate"];
    [v31 setObject:0 forKeyedSubscript:@"kMDItemUserDownloadedUserHandle"];
    uint64_t v24 = [v22 count];
    if (v24 && v24 == [v23 count])
    {
      [v31 setObject:v22 forKeyedSubscript:@":PR::A:kMDItemUserDownloadedDate"];
      [v31 setObject:v23 forKeyedSubscript:@":PR::A:kMDItemUserDownloadedUserHandle"];
    }
  }
  uint64_t v25 = [(CSSearchableItemAttributeSet *)self userModifiedDate];
  if (v25)
  {
    id v26 = [(CSSearchableItemAttributeSet *)self userModifiedUserHandle];
    [v31 setObject:0 forKeyedSubscript:@"kMDItemUserModifiedDate"];
    [v31 setObject:0 forKeyedSubscript:@"kMDItemUserModifiedUserHandle"];
    uint64_t v27 = [v25 count];
    if (v27 && v27 == [v26 count])
    {
      [v31 setObject:v25 forKeyedSubscript:@":PR::A:kMDItemUserModifiedDate"];
      [v31 setObject:v26 forKeyedSubscript:@":PR::A:kMDItemUserModifiedUserHandle"];
    }
  }
  uint64_t v28 = [(CSSearchableItemAttributeSet *)self userCreatedDate];
  if (v28)
  {
    uint64_t v29 = [(CSSearchableItemAttributeSet *)self userCreatedUserHandle];
    [v31 setObject:0 forKeyedSubscript:@"kMDItemUserCreatedDate"];
    [v31 setObject:0 forKeyedSubscript:@"kMDItemUserCreatedUserHandle"];
    uint64_t v30 = [v28 count];
    if (v30 && v30 == [v29 count])
    {
      [v31 setObject:v28 forKeyedSubscript:@":PR::A:kMDItemUserCreatedUserHandle"];
      [v31 setObject:v29 forKeyedSubscript:@":PR::A:kMDItemUserCreatedUserHandle"];
    }
  }
}

- (id)userSharedSentDate
{
  return [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemUserSharedSentDate"];
}

- (id)userSharedReceivedDate
{
  return [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemUserSharedReceivedDate"];
}

- (id)userPrintedDate
{
  return [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemUserPrintedDate"];
}

- (id)userDownloadedDate
{
  return [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemUserDownloadedDate"];
}

- (id)userCreatedDate
{
  return [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemUserCreatedDate"];
}

- (id)userModifiedDate
{
  return [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemUserModifiedDate"];
}

- (NSData)HTMLContentData
{
  id v3 = [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemHTMLContentData"];
  if (!v3)
  {
    if (self->_contentDecoder
      && (long long v6 = *(_OWORD *)&self->_contentObj.containerBytes,
          $37FF168C8709F524D812460C59637AB1 reference = self->_contentObj.reference,
          _MDPlistGetPlistObjectType() == 246))
    {
      contentDecoder = self->_contentDecoder;
      long long v6 = *(_OWORD *)&self->_contentObj.containerBytes;
      $37FF168C8709F524D812460C59637AB1 reference = self->_contentObj.reference;
      id v3 = [(CSDecoder *)contentDecoder decodeObject:&v6];
    }
    else
    {
      id v3 = 0;
    }
  }

  return (NSData *)v3;
}

- (NSString)textContent
{
  id v3 = [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemTextContent"];
  if (!v3)
  {
    if (self->_contentDecoder
      && ((p_contentObj = &self->_contentObj,
           long long v7 = *(_OWORD *)&self->_contentObj.containerBytes,
           $37FF168C8709F524D812460C59637AB1 reference = self->_contentObj.reference,
           _MDPlistGetPlistObjectType() == 244)
       || (long long v7 = *(_OWORD *)&p_contentObj->containerBytes,
           $37FF168C8709F524D812460C59637AB1 reference = self->_contentObj.reference,
           _MDPlistGetPlistObjectType() == 245)))
    {
      contentDecoder = self->_contentDecoder;
      long long v7 = *(_OWORD *)&p_contentObj->containerBytes;
      $37FF168C8709F524D812460C59637AB1 reference = self->_contentObj.reference;
      id v3 = [(CSDecoder *)contentDecoder decodeObject:&v7];
    }
    else
    {
      id v3 = 0;
    }
  }

  return (NSString *)v3;
}

- (NSArray)extractedDates
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNumericAnalysisTagsForPrimaryAttribute:@"kMDItemExtractedDates" analysisAttributes:MEMORY[0x1E4F1CBF0] getTagBlock:&__block_literal_global_798];
}

- (void)setTextContent:(NSString *)textContent
{
  [(CSSearchableItemAttributeSet *)self _setStringValue:textContent forKey:@"kMDItemTextContent"];
  contentDecoder = self->_contentDecoder;
  self->_contentDecoder = 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)mailboxIdentifiers
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemMailboxes"];
}

- (void)setPartiallyDownloaded:(id)a3
{
}

- (void)setExistingThread:(id)a3
{
}

- (void)setDataOwnerType:(id)a3
{
}

- (void)setAccountType:(id)a3
{
}

- (NSString)accountType
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemAccountType"];
}

- (void)setMailRepliedTo:(id)a3
{
}

- (void)setMailRead:(id)a3
{
}

- (void)setMailMessageID:(id)a3
{
}

- (void)setMailFlagged:(id)a3
{
}

- (void)setMailDateReceived:(id)a3
{
}

- (void)setMailConversationID:(id)a3
{
}

- (NSString)mailMessageID
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"com_apple_mail_messageID"];
}

- (void)setContentCreationDate:(NSDate *)contentCreationDate
{
}

- (void)setAccountIdentifier:(NSString *)accountIdentifier
{
}

- (NSString)relatedUniqueIdentifier
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemRelatedUniqueIdentifier"];
}

- (NSString)accountIdentifier
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemAccountIdentifier"];
}

- (NSString)protectionClass
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemProtectionClass"];
}

- (void)_setNumberValue:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v7 withClass:objc_opt_class() forKey:v6 copy:0];
}

- (CSSearchableItemAttributeSet)initWithItemContentType:(NSString *)itemContentType
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = itemContentType;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v9 = @"kMDItemContentType";
    v10[0] = v4;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    id v7 = [(CSSearchableItemAttributeSet *)self initWithAttributes:v6];
  }
  else
  {
    id v7 = [(CSSearchableItemAttributeSet *)self initWithAttributes:0];
  }

  return v7;
}

- (CSSearchableItemAttributeSet)initWithAttributes:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSSearchableItemAttributeSet;
  id v6 = [(CSSearchableItemAttributeSet *)&v11 init];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = 24;
    }
    else
    {
      uint64_t v8 = [v5 mutableCopy];
      mutableAttributes = v6->_mutableAttributes;
      v6->_mutableAttributes = (NSMutableDictionary *)v8;

      uint64_t v7 = 16;
    }
    objc_storeStrong((id *)((char *)&v6->super.isa + v7), a3);
  }

  return v6;
}

- (CSSearchableItemAttributeSet)initWithAttributeSet:(id)a3
{
  uint64_t v4 = (id *)a3;
  v16.receiver = self;
  v16.super_class = (Class)CSSearchableItemAttributeSet;
  id v5 = [(CSSearchableItemAttributeSet *)&v16 init];
  id v6 = v5;
  if (v4 && v5)
  {
    v5->_int64_t searchableItemFlags = [v4 searchableItemFlags];
    uint64_t v7 = [v4[3] mutableCopy];
    mutableAttributes = v6->_mutableAttributes;
    v6->_mutableAttributes = (NSMutableDictionary *)v7;

    uint64_t v9 = [v4[4] mutableCopy];
    customAttributes = v6->_customAttributes;
    v6->_customAttributes = (NSMutableDictionary *)v9;

    uint64_t v11 = [v4 decoder];
    decoder = v6->_decoder;
    v6->_decoder = (CSDecoder *)v11;

    [v4 codedAttributes];
    *(_OWORD *)&v6->_codedAttributes.containerBytes = v14;
    v6->_codedAttributes.$37FF168C8709F524D812460C59637AB1 reference = v15;
    [v4 codedCustomAttributes];
    *(_OWORD *)&v6->_codedCustomAttributes.containerBytes = v14;
    v6->_codedCustomAttributes.$37FF168C8709F524D812460C59637AB1 reference = v15;
    v6->_BOOL hasCodedCustomAttributes = [v4 hasCodedCustomAttributes];
  }

  return v6;
}

- (CSDecoder)decoder
{
  return self->_decoder;
}

- (BOOL)hasCodedCustomAttributes
{
  return self->_hasCodedCustomAttributes;
}

- ($917DE44C1CB612B85CED1B4C2573F471)codedCustomAttributes
{
  *($C7C160116BA828B4EE75DF30F571EBFF *)retstr = ($C7C160116BA828B4EE75DF30F571EBFF)self[4];
  return self;
}

- ($917DE44C1CB612B85CED1B4C2573F471)codedAttributes
{
  *($C7C160116BA828B4EE75DF30F571EBFF *)retstr = ($C7C160116BA828B4EE75DF30F571EBFF)self[3];
  return self;
}

- (NSString)userActivityType
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemUserActivityType"];
}

- (void)setUserActivityType:(id)a3
{
}

- (void)setApplicationName:(id)a3
{
}

- (void)setShortcutAvailability:(id)a3
{
}

- (void)setTitle:(NSString *)title
{
}

- (void)setContentType:(NSString *)contentType
{
}

- (CSSearchableItemAttributeSet)init
{
  return [(CSSearchableItemAttributeSet *)self initWithAttributes:0];
}

- (void)addAttributesFromAttributeSet:(id)a3
{
  uint64_t v4 = (id *)a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 decoder];

    if (v6)
    {
      uint64_t v7 = [v5 decoder];
      [v5 codedAttributes];
      uint64_t v8 = [v7 decodeObject:v15];

      if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v8 count])
      {
        uint64_t v9 = [(CSSearchableItemAttributeSet *)self mutableAttributes];
        [v9 addEntriesFromDictionary:v8];

        int v10 = 1;
      }
      else
      {
        int v10 = 0;
      }
    }
    else
    {
      int v10 = 0;
    }
    if ([v5[3] count])
    {
      uint64_t v11 = [(CSSearchableItemAttributeSet *)self mutableAttributes];
      [v11 addEntriesFromDictionary:v5[3]];

      id v12 = v5 + 4;
      if (![v5[4] count]) {
        goto LABEL_15;
      }
    }
    else
    {
      id v12 = v5 + 4;
      if (![v5[4] count])
      {
        if (!v10) {
          goto LABEL_16;
        }
        goto LABEL_15;
      }
    }
    id v13 = [(CSSearchableItemAttributeSet *)self customAttributes];
    [v13 addEntriesFromDictionary:*v12];

LABEL_15:
    attributes = self->_attributes;
    self->_attributes = 0;
  }
LABEL_16:
}

- (void)setDisplayName:(NSString *)displayName
{
}

- (void)setValue:(id)value forCustomKey:(CSCustomAttributeKey *)key
{
  id v12 = value;
  id v6 = key;
  uint64_t v7 = [(CSCustomAttributeKey *)v6 keyName];

  if (v7)
  {
    if (v12)
    {
      uint64_t v8 = [(CSSearchableItemAttributeSet *)self customAttributes];
      uint64_t v9 = v8;
      id v10 = v12;
    }
    else
    {
      uint64_t v11 = (void *)*MEMORY[0x1E4F1D260];
      uint64_t v8 = [(CSSearchableItemAttributeSet *)self customAttributes];
      uint64_t v9 = v8;
      id v10 = v11;
    }
    [v8 setObject:v10 forKeyedSubscript:v6];
  }
}

- (id)customAttributeDictionary
{
  if (self->_hasCodedCustomAttributes)
  {
    id v3 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v7 = *(_OWORD *)&self->_codedCustomAttributes.containerBytes;
    $37FF168C8709F524D812460C59637AB1 reference = self->_codedCustomAttributes.reference;
    _MDPlistDictionaryIterate();
    if ([(NSMutableDictionary *)self->_customAttributes count]) {
      [v3 addEntriesFromDictionary:self->_customAttributes];
    }
    id v4 = v3;
  }
  else
  {
    id v5 = [(CSSearchableItemAttributeSet *)self customAttributes];
    id v4 = (id)[v5 copy];
  }

  return v4;
}

- (NSMutableDictionary)customAttributes
{
  customAttributes = self->_customAttributes;
  if (!customAttributes)
  {
    id v4 = self;
    objc_sync_enter(v4);
    if (!self->_customAttributes)
    {
      id v5 = (NSMutableDictionary *)objc_opt_new();
      id v6 = self->_customAttributes;
      self->_customAttributes = v5;
    }
    objc_sync_exit(v4);

    customAttributes = self->_customAttributes;
  }

  return customAttributes;
}

- (void)setSubtitle:(id)a3
{
}

- (void)setHTMLContentData:(NSData *)HTMLContentData
{
  [(CSSearchableItemAttributeSet *)self _setDataValue:HTMLContentData forKey:@"kMDItemHTMLContentData"];
  contentDecoder = self->_contentDecoder;
  self->_contentDecoder = 0;
}

- (void)_setDataValue:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v7 withClass:objc_opt_class() forKey:v6 copy:1];
}

- (NSData)HTMLContentDataNoCopy
{
  id v3 = [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemHTMLContentData"];
  if (!v3)
  {
    if (self->_contentDecoder
      && (long long v6 = *(_OWORD *)&self->_contentObj.containerBytes,
          $37FF168C8709F524D812460C59637AB1 reference = self->_contentObj.reference,
          _MDPlistGetPlistObjectType() == 246))
    {
      contentDecoder = self->_contentDecoder;
      long long v6 = *(_OWORD *)&self->_contentObj.containerBytes;
      $37FF168C8709F524D812460C59637AB1 reference = self->_contentObj.reference;
      id v3 = [(CSDecoder *)contentDecoder decodeObjectNoCopy:&v6];
    }
    else
    {
      id v3 = 0;
    }
  }

  return (NSData *)v3;
}

- (void)setMailGMailLabels:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"com_apple_mail_gmailLabels"];
}

- (void)setProviderDataTypeIdentifiers:(NSArray *)providerDataTypeIdentifiers
{
  id v4 = providerDataTypeIdentifiers;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"_kMDItemProviderDataTypes"];
}

- (void)setPrimaryRecipients:(NSArray *)primaryRecipients
{
  id v4 = primaryRecipients;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemPrimaryRecipientPersons"];
}

- (void)setMailboxIdentifiers:(NSArray *)mailboxIdentifiers
{
  id v4 = mailboxIdentifiers;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemMailboxes"];
}

- (void)setHiddenAdditionalRecipients:(NSArray *)hiddenAdditionalRecipients
{
  id v4 = hiddenAdditionalRecipients;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemHiddenAdditionalRecipientPersons"];
}

- (void)setAuthors:(NSArray *)authors
{
  id v4 = authors;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemAuthorPersons"];
}

- (void)setAdditionalRecipients:(NSArray *)additionalRecipients
{
  id v4 = additionalRecipients;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemAdditionalRecipientPersons"];
}

- (void)setAccountHandles:(NSArray *)accountHandles
{
  id v4 = accountHandles;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemAccountHandles"];
}

- (void)setEmailHeaders:(NSDictionary *)emailHeaders
{
  id v4 = emailHeaders;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEmailHeadersDictionary" copy:1];
}

- (void)setMailCategories:(int)a3
{
  id v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"_kMDItemMailCategories" copy:0];
}

void __80__CSSearchableItemAttributeSet_CSCoderAdditions__encodeWithCSCoder_includeText___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, long long *a4)
{
  if (!*(unsigned char *)(a1 + 48)
    || (uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 24),
        [NSString stringWithUTF8String:a2],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        [v8 objectForKeyedSubscript:v9],
        id v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        !v10))
  {
    [*(id *)(a1 + 40) encodeString:a2 length:a3];
    uint64_t v11 = *(void **)(a1 + 40);
    long long v12 = *a4;
    uint64_t v13 = *((void *)a4 + 2);
    [v11 encodeMDPlistObject:&v12];
  }
}

- (void)setMailAttachmentTypes:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"com_apple_mail_attachmentTypes"];
}

- (void)setAttachmentTypes:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemAttachmentTypes"];
}

- (void)setAttachmentPaths:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemAttachmentPaths"];
}

- (void)setAttachmentNames:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemAttachmentNames"];
}

- (id)attachmentPaths
{
  return [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemAttachmentPaths"];
}

- (CSSearchableItemAttributeSet)initWithCoder:(id)a3
{
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)CSSearchableItemAttributeSet;
  id v5 = [(CSSearchableItemAttributeSet *)&v50 init];
  if (v5)
  {
    long long v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"container"];
    if (v6)
    {
      id v7 = [[CSDecoder alloc] initWithData:v6];
      uint64_t v8 = (void *)*((void *)v5 + 6);
      *((void *)v5 + 6) = v7;

      uint64_t v9 = (void *)*((void *)v5 + 6);
      if (v9
        && ([v9 obj], _MDPlistGetPlistObjectType() == 240)
        && (int Count = _MDPlistArrayGetCount(), (Count - 3) <= 1))
      {
        int v11 = Count;
        _MDPlistArrayGetPlistObjectAtIndex();
        [v5 setSearchableItemFlags:_MDPlistNumberGetIntValue()];
        _MDPlistArrayGetPlistObjectAtIndex();
        *(_OWORD *)(v5 + 72) = 0uLL;
        *((void *)v5 + 11) = 0;
        if (v11 == 4)
        {
          v5[8] = 1;
          _MDPlistArrayGetPlistObjectAtIndex();
          *((_OWORD *)v5 + 6) = 0uLL;
          *((void *)v5 + 14) = 0;
        }
      }
      else
      {

        id v5 = 0;
      }
    }
    else
    {
      long long v12 = +[CSContactsWrapper sharedInstance];
      uint64_t v48 = [v12 CNContactPropertyClass];

      v49 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v47 = objc_opt_class();
      uint64_t v46 = objc_opt_class();
      uint64_t v45 = objc_opt_class();
      uint64_t v44 = objc_opt_class();
      uint64_t v43 = objc_opt_class();
      uint64_t v42 = objc_opt_class();
      uint64_t v41 = objc_opt_class();
      uint64_t v40 = objc_opt_class();
      uint64_t v39 = objc_opt_class();
      uint64_t v38 = objc_opt_class();
      uint64_t v37 = objc_opt_class();
      uint64_t v36 = objc_opt_class();
      uint64_t v35 = objc_opt_class();
      uint64_t v34 = objc_opt_class();
      uint64_t v33 = objc_opt_class();
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = objc_opt_class();
      uint64_t v16 = objc_opt_class();
      uint64_t v17 = objc_opt_class();
      uint64_t v18 = objc_opt_class();
      uint64_t v19 = objc_opt_class();
      uint64_t v20 = objc_opt_class();
      objc_msgSend(v49, "setWithObjects:", v47, v46, v45, v44, v43, v42, v41, v40, v39, v38, v48, v37, v36, v35, v34, v33, v13,
        v14,
        v15,
        v16,
        v17,
        v18,
        v19,
        v20,
        objc_opt_class(),
      uint64_t v21 = 0);
      uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"attributes"];
      uint64_t v23 = (void *)*((void *)v5 + 3);
      *((void *)v5 + 3) = v22;

      uint64_t v24 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v25 = objc_opt_class();
      uint64_t v26 = objc_opt_class();
      uint64_t v27 = objc_opt_class();
      uint64_t v32 = v26;
      long long v6 = 0;
      uint64_t v28 = objc_msgSend(v24, "setWithObjects:", v25, v32, v27, objc_opt_class(), 0);
      uint64_t v29 = [v4 decodeObjectOfClasses:v28 forKey:@"customAttributes"];
      uint64_t v30 = (void *)*((void *)v5 + 4);
      *((void *)v5 + 4) = v29;
    }
  }

  return (CSSearchableItemAttributeSet *)v5;
}

- (CSSearchableItemAttributeSet)initWithContentType:(UTType *)contentType
{
  id v4 = [(UTType *)contentType identifier];
  id v5 = [(CSSearchableItemAttributeSet *)self initWithItemContentType:v4];

  return v5;
}

- (void)setUserCreated:(NSNumber *)userCreated
{
}

- (NSNumber)isUserCreated
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemUserCreated"];
}

- (void)setUserOwned:(NSNumber *)userOwned
{
}

- (void)setUserCurated:(NSNumber *)userCurated
{
}

- (NSNumber)isUserCurated
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemUserCurated"];
}

- (NSNumber)rankingHint
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemRankingHint"];
}

- (CSSearchableItemAttributeSet)initWithSerializedAttributes:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  long long v6 = [v4 dictionaryWithDictionary:v5];
  id v7 = [v5 objectForKeyedSubscript:@"kCSCustomAttributes"];

  [v6 removeObjectForKey:@"kCSCustomAttributes"];
  uint64_t v8 = [[CSSearchableItemAttributeSet alloc] initWithAttributes:v6];

  if (v8)
  {
    uint64_t v9 = [v7 mutableCopy];
    customAttributes = v8->_customAttributes;
    v8->_customAttributes = (NSMutableDictionary *)v9;
  }
  return v8;
}

- (id)serializedAttributes
{
  id v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = [(CSSearchableItemAttributeSet *)self attributes];
  id v5 = [v3 dictionaryWithDictionary:v4];

  if ([(NSMutableDictionary *)self->_customAttributes count]) {
    [v5 setObject:self->_customAttributes forKeyedSubscript:@"kCSCustomAttributes"];
  }

  return v5;
}

- (BOOL)isValidAttributeSet
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(CSSearchableItemAttributeSet *)self contentType];
  if (v3)
  {
    id v4 = [(id)objc_opt_class() _requiredAttributesForContentType:v3];
    id v5 = v4;
    if (v4)
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v6 = v4;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v15;
        while (2)
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v15 != v9) {
              objc_enumerationMutation(v6);
            }
            int v11 = -[CSSearchableItemAttributeSet _getNonNullValueForKey:](self, "_getNonNullValueForKey:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);

            if (!v11)
            {
              BOOL v12 = 0;
              goto LABEL_14;
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }
      BOOL v12 = 1;
LABEL_14:
    }
    else
    {
      BOOL v12 = 1;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)requiredAttributes
{
  id v3 = objc_opt_class();
  id v4 = [(CSSearchableItemAttributeSet *)self contentType];
  id v5 = [v3 _requiredAttributesForContentType:v4];

  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CAD0] set];
  }
  uint64_t v7 = v6;

  return v7;
}

+ (id)_requiredAttributesForContentType:(id)a3
{
  uint64_t v3 = _requiredAttributesForContentType__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_requiredAttributesForContentType__onceToken, &__block_literal_global_8);
  }
  id v5 = [(id)_requiredAttributesForContentType__requiredAttributes objectForKeyedSubscript:v4];

  return v5;
}

void __66__CSSearchableItemAttributeSet__requiredAttributesForContentType___block_invoke()
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"kMDItemAccountIdentifier", @"kMDItemAuthorPersons", @"kMDItemAccountHandles", @"kMDItemPrimaryRecipientPersons", 0);
  uint64_t v1 = *MEMORY[0x1E4F225B0];
  v4[0] = *MEMORY[0x1E4F22658];
  v4[1] = v1;
  v5[0] = v0;
  v5[1] = v0;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
  uint64_t v3 = (void *)_requiredAttributesForContentType__requiredAttributes;
  _requiredAttributesForContentType__requiredAttributes = v2;
}

void __57__CSSearchableItemAttributeSet_customAttributeDictionary__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, long long *a4)
{
  long long v14 = *a4;
  uint64_t v15 = *((void *)a4 + 2);
  if (_MDPlistGetPlistObjectType() == 240)
  {
    long long v14 = *a4;
    uint64_t v15 = *((void *)a4 + 2);
    if (_MDPlistArrayGetCount() == 2)
    {
      uint64_t v7 = [NSString stringWithUTF8String:a2];
      long long v14 = *a4;
      uint64_t v15 = *((void *)a4 + 2);
      _MDPlistArrayGetPlistObjectAtIndex();
      unint64_t IntValue = _MDPlistNumberGetIntValue();
      uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 48);
      long long v14 = *a4;
      uint64_t v15 = *((void *)a4 + 2);
      _MDPlistArrayGetPlistObjectAtIndex();
      uint64_t v10 = [v9 decodeObject:&v13];
      int v11 = (void *)v10;
      if (v7)
      {
        if (v10)
        {
          BOOL v12 = [[CSCustomAttributeKey alloc] initWithKeyName:v7 searchable:IntValue & 1 searchableByDefault:(IntValue >> 1) & 1 unique:(IntValue >> 2) & 1 multiValued:(IntValue >> 3) & 1];
          [*(id *)(a1 + 40) setObject:v11 forKey:v12];
        }
      }
    }
  }
}

- (void)_setValue:(id)a3 withClass:(Class)a4 forKey:(id)a5
{
}

- (void)_setURLValue:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v7 withClass:objc_opt_class() forKey:v6 copy:0];
}

- (void)_setDictionaryValue:(id)a3 withValueClass:(Class)a4 keyClass:(Class)a5 forKey:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a6;
  if (!v8)
  {
LABEL_20:
    [(CSSearchableItemAttributeSet *)self _setValue:v8 withClass:0 forKey:v9 copy:1];
    goto LABEL_30;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v10 = [v8 objectEnumerator];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v28;
      while (2)
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v10);
          }
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v21 = logForCSLogCategoryDefault();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              -[CSSearchableItemAttributeSet _setDictionaryValue:withValueClass:keyClass:forKey:]();
            }

            goto LABEL_30;
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    long long v25 = 0u;
    long long v26 = 0u;
    long long v24 = 0u;
    uint64_t v15 = objc_msgSend(v8, "keyEnumerator", 0, 0);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v24;
      while (2)
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v24 != v18) {
            objc_enumerationMutation(v15);
          }
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v22 = logForCSLogCategoryDefault();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
              -[CSSearchableItemAttributeSet _setDictionaryValue:withValueClass:keyClass:forKey:]();
            }

            goto LABEL_30;
          }
          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }

    goto LABEL_20;
  }
  uint64_t v20 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    -[CSSearchableItemAttributeSet _setValue:withClass:forKey:copy:]();
  }

LABEL_30:
}

- (BOOL)attributeIsDelete:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_mutableAttributes objectForKeyedSubscript:v4];
  if (v5) {
    goto LABEL_2;
  }
  customAttributes = self->_customAttributes;
  if (customAttributes)
  {
    id v5 = [(NSMutableDictionary *)customAttributes objectForKeyedSubscript:v4];
    if (v5) {
      goto LABEL_2;
    }
  }
  if (!self->_decoder) {
    goto LABEL_16;
  }
  bzero(v17, 0x1000uLL);
  if (([v4 getCString:v17 maxLength:4096 encoding:4] & 1) == 0) {
    goto LABEL_16;
  }
  long long v15 = 0uLL;
  $37FF168C8709F524D812460C59637AB1 v16 = 0;
  long long v13 = *(_OWORD *)&self->_codedAttributes.containerBytes;
  $37FF168C8709F524D812460C59637AB1 reference = self->_codedAttributes.reference;
  if (!_MDPlistDictionaryGetPlistObjectForKey())
  {
    if (self->_hasCodedCustomAttributes)
    {
      long long v13 = *(_OWORD *)&self->_codedCustomAttributes.containerBytes;
      $37FF168C8709F524D812460C59637AB1 reference = self->_codedCustomAttributes.reference;
      if (_MDPlistDictionaryGetPlistObjectForKey())
      {
        long long v13 = v15;
        $37FF168C8709F524D812460C59637AB1 reference = v16;
        if (_MDPlistGetPlistObjectType() == 240)
        {
          long long v13 = v15;
          $37FF168C8709F524D812460C59637AB1 reference = v16;
          if (_MDPlistArrayGetCount() == 2)
          {
            decoder = self->_decoder;
            long long v13 = v15;
            $37FF168C8709F524D812460C59637AB1 reference = v16;
            _MDPlistArrayGetPlistObjectAtIndex();
            uint64_t v10 = (long long *)&v12;
            id v9 = decoder;
            goto LABEL_10;
          }
        }
      }
    }
LABEL_16:
    BOOL v6 = 0;
    goto LABEL_3;
  }
  id v9 = self->_decoder;
  long long v13 = v15;
  $37FF168C8709F524D812460C59637AB1 reference = v16;
  uint64_t v10 = &v13;
LABEL_10:
  id v5 = [(CSDecoder *)v9 decodeObject:v10];
LABEL_2:
  BOOL v6 = v5 == (void *)*MEMORY[0x1E4F1D260];

LABEL_3:
  return v6;
}

- (void)incrementAttributeValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = [@":INC:" stringByAppendingString:a4];
  [(CSSearchableItemAttributeSet *)self setAttribute:v6 forKey:v7];
}

- (void)addAttributesFromDictionaryWithOutOverWriting:(id)a3
{
  id v4 = a3;
  id v5 = [(CSSearchableItemAttributeSet *)self mutableAttributes];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__CSSearchableItemAttributeSet_addAttributesFromDictionaryWithOutOverWriting___block_invoke;
  v7[3] = &unk_1E5549770;
  id v8 = v5;
  id v6 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];
}

void __78__CSSearchableItemAttributeSet_addAttributesFromDictionaryWithOutOverWriting___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKey:v7];

  if (!v6) {
    [*(id *)(a1 + 32) setObject:v5 forKey:v7];
  }
}

- (void)addAttributesFromDictionary:(id)a3
{
  id v6 = a3;
  if ([v6 count])
  {
    id v4 = [(CSSearchableItemAttributeSet *)self mutableAttributes];
    [v4 addEntriesFromDictionary:v6];

    attributes = self->_attributes;
    self->_attributes = 0;
  }
}

- (unint64_t)hash
{
  uint64_t v3 = [(CSSearchableItemAttributeSet *)self uniqueIdentifier];
  uint64_t v4 = [v3 hash];
  id v5 = [(CSSearchableItemAttributeSet *)self displayName];
  unint64_t v6 = [v5 hash] + v4;

  return v6;
}

- (id)description
{
  uint64_t v2 = (void *)[[NSString alloc] initWithFormat:@"<%@:%p>", objc_opt_class(), self];

  return v2;
}

- (id)debugDescription
{
  if (!self->_decoder
    || ($C7C160116BA828B4EE75DF30F571EBFF codedAttributes = self->_codedAttributes,
        CSDecodeObject((uint64_t)&codedAttributes),
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        [v3 debugDescription],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v4))
  {
    uint64_t v4 = [(NSMutableDictionary *)self->_mutableAttributes debugDescription];
  }
  if ([(NSMutableDictionary *)self->_customAttributes count])
  {
    id v5 = NSString;
    unint64_t v6 = [(NSMutableDictionary *)self->_customAttributes debugDescription];
    id v7 = [v5 stringWithFormat:@"%@\nCustom:\n%@", v4, v6];
  }
  else
  {
    id v7 = v4;
  }

  return v7;
}

void __40__CSSearchableItemAttributeSet__allKeys__block_invoke()
{
  v3[347] = *MEMORY[0x1E4F143B8];
  v3[0] = @"kMDItemAttributeChangeDate";
  v3[1] = @"kMDItemContentType";
  v3[2] = @"kMDItemContentTypeTree";
  v3[3] = @"kMDItemKeywords";
  v3[4] = @"kMDItemTitle";
  v3[5] = @"kMDItemAuthors";
  v3[6] = @"kMDItemEditors";
  v3[7] = @"kMDItemParticipants";
  v3[8] = @"kMDItemProjects";
  v3[9] = @"kMDItemDownloadedDate";
  v3[10] = @"kMDItemWhereFroms";
  v3[11] = @"kMDItemComment";
  v3[12] = @"kMDItemCopyright";
  v3[13] = @"kMDItemLastUsedDate";
  v3[14] = @"kMDItemContentCreationDate";
  v3[15] = @"kMDItemContentModificationDate";
  v3[16] = @"kMDItemDateAdded";
  v3[17] = @"kMDItemDurationSeconds";
  v3[18] = @"kMDItemContactKeywords";
  v3[19] = @"kMDItemVersion";
  v3[20] = @"kMDItemPixelHeight";
  v3[21] = @"kMDItemPixelWidth";
  v3[22] = @"kMDItemPixelCount";
  v3[23] = @"kMDItemColorSpace";
  v3[24] = @"kMDItemBitsPerSample";
  v3[25] = @"kMDItemFlashOnOff";
  v3[26] = @"kMDItemXMPDigitalSourceType";
  v3[27] = @"kMDItemXMPCredit";
  v3[28] = @"kMDItemFocalLength";
  v3[29] = @"kMDItemAcquisitionMake";
  v3[30] = @"kMDItemAcquisitionModel";
  v3[31] = @"kMDItemISOSpeed";
  v3[32] = @"kMDItemOrientation";
  v3[33] = @"kMDItemLayerNames";
  v3[34] = @"kMDItemWhiteBalance";
  v3[35] = @"kMDItemAperture";
  v3[36] = @"kMDItemProfileName";
  v3[37] = @"kMDItemResolutionWidthDPI";
  v3[38] = @"kMDItemResolutionHeightDPI";
  v3[39] = @"kMDItemExposureMode";
  v3[40] = @"kMDItemExposureTimeSeconds";
  v3[41] = @"kMDItemEXIFVersion";
  v3[42] = @"kMDItemCameraOwner";
  v3[43] = @"kMDItemFocalLength35mm";
  v3[44] = @"kMDItemLensModel";
  v3[45] = @"kMDItemEXIFGPSVersion";
  v3[46] = @"kMDItemAltitude";
  v3[47] = @"kMDItemLatitude";
  v3[48] = @"kMDItemLongitude";
  v3[49] = @"kMDItemSpeed";
  v3[50] = @"kMDItemTimestamp";
  v3[51] = @"kMDItemGPSTrack";
  v3[52] = @"kMDItemImageDirection";
  v3[53] = @"kMDItemNamedLocation";
  v3[54] = @"kMDItemGPSStatus";
  v3[55] = @"kMDItemGPSMeasureMode";
  v3[56] = @"kMDItemGPSDOP";
  v3[57] = @"kMDItemGPSMapDatum";
  v3[58] = @"kMDItemGPSDestLatitude";
  v3[59] = @"kMDItemGPSDestLongitude";
  v3[60] = @"kMDItemGPSDestBearing";
  v3[61] = @"kMDItemGPSDestDistance";
  v3[62] = @"kMDItemGPSProcessingMethod";
  v3[63] = @"kMDItemGPSAreaInformation";
  v3[64] = @"kMDItemGPSDateStamp";
  v3[65] = @"kMDItemGPSDifferental";
  v3[66] = @"kMDItemCodecs";
  v3[67] = @"kMDItemMediaTypes";
  v3[68] = @"kMDItemStreamable";
  v3[69] = @"kMDItemTotalBitRate";
  v3[70] = @"kMDItemVideoBitRate";
  v3[71] = @"kMDItemAudioBitRate";
  v3[72] = @"kMDItemDeliveryType";
  v3[73] = @"kMDItemAlbum";
  v3[74] = @"kMDItemHasAlphaChannel";
  v3[75] = @"kMDItemRedEyeOnOff";
  v3[76] = @"kMDItemMeteringMode";
  v3[77] = @"kMDItemMaxAperture";
  v3[78] = @"kMDItemFNumber";
  v3[79] = @"kMDItemExposureProgram";
  v3[80] = @"kMDItemExposureTimeString";
  v3[81] = @"kMDItemHeadline";
  v3[82] = @"kMDItemInstructions";
  v3[83] = @"kMDItemThoroughfare";
  v3[84] = @"kMDItemSubThoroughfare";
  v3[85] = @"kMDItemPostalCode";
  v3[86] = @"kMDItemCity";
  v3[87] = @"kMDItemStateOrProvince";
  v3[88] = @"kMDItemCountry";
  v3[89] = @"kMDItemDisplayName";
  v3[90] = @"kMDItemPath";
  v3[91] = @"kMDItemTextContent";
  v3[92] = @"kMDItemAudioSampleRate";
  v3[93] = @"kMDItemAudioChannelCount";
  v3[94] = @"kMDItemTempo";
  v3[95] = @"kMDItemKeySignature";
  v3[96] = @"kMDItemTimeSignature";
  v3[97] = @"kMDItemAudioEncodingApplication";
  v3[98] = @"kMDItemComposer";
  v3[99] = @"kMDItemLyricist";
  v3[100] = @"kMDItemAudioTrackNumber";
  v3[101] = @"kMDItemRecordingDate";
  v3[102] = @"kMDItemMusicalGenre";
  v3[103] = @"kMDItemIsGeneralMIDISequence";
  v3[104] = @"kMDItemRecordingYear";
  v3[105] = @"kMDItemOrganizations";
  v3[106] = @"kMDItemRole";
  v3[107] = @"kMDItemLanguages";
  v3[108] = @"kMDItemRights";
  v3[109] = @"kMDItemPublishers";
  v3[110] = @"kMDItemContributors";
  v3[111] = @"kMDItemCoverage";
  v3[112] = @"kMDItemSubject";
  v3[113] = @"kMDItemTheme";
  v3[114] = @"kMDItemDescription";
  v3[115] = @"kMDItemIdentifier";
  v3[116] = @"kMDItemAudiences";
  v3[117] = @"kMDItemNumberOfPages";
  v3[118] = @"kMDItemFileSize";
  v3[119] = @"kMDItemPageWidth";
  v3[120] = @"kMDItemPageHeight";
  v3[121] = @"kMDItemSecurityMethod";
  v3[122] = @"kMDItemCreator";
  v3[123] = @"kMDItemEncodingApplications";
  v3[124] = @"kMDItemDueDate";
  v3[125] = @"kMDItemCompletionDate";
  v3[126] = @"kMDItemStartDate";
  v3[127] = @"kMDItemEndDate";
  v3[128] = @"kMDItemImportantDates";
  v3[129] = @"kMDItemStarRating";
  v3[130] = @"kMDItemRatingDescription";
  v3[131] = @"kMDItemPlayCount";
  v3[132] = @"kMDItemIsLocal";
  v3[133] = @"kMDItemContentRating";
  v3[134] = @"kMDItemExtendedContentRating";
  v3[135] = @"kMDItemArtist";
  v3[136] = @"kMDItemPhoneNumbers";
  v3[137] = @"kMDItemEmailAddresses";
  v3[138] = @"kMDItemInstantMessageAddresses";
  v3[139] = @"kMDItemKind";
  v3[140] = @"kMDItemRecipients";
  v3[141] = @"kMDItemFinderComment";
  v3[142] = @"kMDItemFonts";
  v3[143] = @"kMDItemAppleLoopsRootKey";
  v3[144] = @"kMDItemAppleLoopsKeyFilterType";
  v3[145] = @"kMDItemAppleLoopsLoopMode";
  v3[146] = @"kMDItemAppleLoopDescriptors";
  v3[147] = @"kMDItemMusicalInstrumentCategory";
  v3[148] = @"kMDItemMusicalInstrumentName";
  v3[149] = @"kMDItemSupportFileType";
  v3[150] = @"kMDItemInformation";
  v3[151] = @"kMDItemDirector";
  v3[152] = @"kMDItemProducer";
  v3[153] = @"kMDItemGenre";
  v3[154] = @"kMDItemPerformers";
  v3[155] = @"kMDItemOriginalFormat";
  v3[156] = @"kMDItemOriginalSource";
  v3[157] = @"kMDItemAuthorEmailAddresses";
  v3[158] = @"kMDItemRecipientEmailAddresses";
  v3[159] = @"kMDItemAuthorAddresses";
  v3[160] = @"kMDItemAuthorPhotosPersonIdentifiers";
  v3[161] = @"kMDItemRecipientPhotosPersonIdentifiers";
  v3[162] = @"kMDItemRecipientAddresses";
  v3[163] = @"kMDItemURL";
  v3[164] = @"kMDItemIsLikelyJunk";
  v3[165] = @"kMDItemExecutableArchitectures";
  v3[166] = @"kMDItemExecutablePlatform";
  v3[167] = @"kMDItemApplicationCategories";
  v3[168] = @"kMDItemIsApplicationManaged";
  v3[169] = @"kMDItemBundleIdentifier";
  v3[170] = @"kMDItemWeakRelatedUniqueIdentifier";
  v3[171] = @"kMDItemRelatedUniqueIdentifier";
  v3[172] = @"kMDItemAuthorPersons";
  v3[173] = @"kMDItemPrimaryRecipientPersons";
  v3[174] = @"kMDItemAdditionalRecipientPersons";
  v3[175] = @"kMDItemHiddenAdditionalRecipientPersons";
  v3[176] = @"kMDItemEmailHeadersDictionary";
  v3[177] = @"kMDItemAccountIdentifier";
  v3[178] = @"kMDItemAccountHandles";
  v3[179] = @"kMDItemMailboxes";
  v3[180] = @"kMDItemContentURL";
  v3[181] = @"MDItemThumbnailBundleID";
  v3[182] = @"MDItemThumbnailContentType";
  v3[183] = @"kMDItemThumbnailURL";
  v3[184] = @"kMDItemThumbnailData";
  v3[185] = @"kMDItemHTMLContentData";
  v3[186] = @"kMDItemAlternateNames";
  v3[187] = @"kMDQueryResultMatchedFields";
  v3[188] = @"kMDItemHTMLContent";
  v3[189] = @"kMDItemHTMLContent";
  v3[190] = @"kMDItemAuthorsDictionary";
  v3[191] = @"kMDItemPrimaryRecipientsDictionary";
  v3[192] = @"kMDItemAdditionalRecipientsDictionary";
  v3[193] = @"kMDItemHiddenAdditionalRecipientsDictionary";
  v3[194] = @"kMDItemAuthorContactProperties";
  v3[195] = @"kMDItemPrimaryRecipientContactProperties";
  v3[196] = @"kMDItemAdditionalRecipientContactProperties";
  v3[197] = @"kMDItemHiddenAdditionalRecipientContactProperties";
  v3[198] = @"kMDItemAccountType";
  v3[199] = @"kMDItemTextSelected";
  v3[200] = @"kMDItemSubtitle";
  v3[201] = @"kMDItemUserTags";
  v3[202] = @"kMDItemIsExistingThread";
  v3[203] = @"kMDItemIsPartiallyDownloaded";
  v3[204] = @"kMDItemAlbumPersistentID";
  v3[205] = @"kMDItemAdamID";
  v3[206] = @"kMDItemFileIdentifier";
  v3[207] = @"kMDItemFilename";
  v3[208] = @"kMDItemParentFileIdentifier";
  v3[209] = @"kMDItemDocumentIdentifier";
  v3[210] = @"kMDQueryResultMenuRelevance";
  v3[211] = @"kMDQueryResultNewMatchedExtraQueriesField";
  v3[212] = @"_kMDItemExternalID";
  v3[213] = @"_kMDItemDomainIdentifier";
  v3[214] = @"_kMDItemExpirationDate";
  v3[215] = @"_kMDItemUserActivityType";
  v3[216] = @"kMDItemApplicationName";
  v3[217] = @"kMDItemSupportsPhoneCall";
  v3[218] = @"kMDItemSupportsNavigation";
  v3[219] = @"kMDItemRankingHint";
  v3[220] = @"kMDItemUserCurated";
  v3[221] = @"kMDItemUserCreated";
  v3[222] = @"kMDItemUserOwned";
  v3[223] = @"kMDItemPhotosPeople";
  v3[224] = @"kMDItemPhotosPeopleNames";
  v3[225] = @"kMDItemPhotosPeopleAddresses";
  v3[226] = @"kMDItemPhotosPeopleEmailAddresses";
  v3[227] = @"kMDItemPhotosPeoplePhoneNumbers";
  v3[228] = @"kMDItemPhotosPeopleContactIdentifiers";
  v3[229] = @"kMDItemPhotosPeoplePersonIdentifiers";
  v3[230] = @"kMDItemAestheticScore";
  v3[231] = @"kMDItemCurationScore";
  v3[232] = @"_kMDItemIsCinematicVideo";
  v3[233] = @"kMDItemIsProResVideo";
  v3[234] = @"kMDItemSavingApplication";
  v3[235] = @"kMDItemSavingApplicationBundleIdentifier";
  v3[236] = @"kMDItemPhotosBusinessCategories";
  v3[237] = @"kMDItemPhotosBusinessNames";
  v3[238] = @"kMDItemPhotosContentAddedDate";
  v3[239] = @"kMDItemPhotosContentCreationDateMonth";
  v3[240] = @"kMDItemPhotosContentCreationDateMonths";
  v3[241] = @"kMDItemPhotosContentCreationDateYear";
  v3[242] = @"kMDItemPhotosContentCreationDateYears";
  v3[243] = @"kMDItemPhotosEventCategories";
  v3[244] = @"kMDItemPhotosEventNames";
  v3[245] = @"kMDItemPhotosEventPerformers";
  v3[246] = @"kMDItemPhotosFavorited";
  v3[247] = @"kMDItemPhotosFavorites";
  v3[248] = @"kMDItemPhotosImageEmbeddingVersion";
  v3[249] = @"kMDItemPhotosHolidays";
  v3[250] = @"kMDItemPhotosKeywords";
  v3[251] = @"kMDItemPhotosMeanings";
  v3[252] = @"kMDItemPhotosMediaTypes";
  v3[253] = @"kMDItemPhotosMemoryTitle";
  v3[254] = @"kMDItemPhotosPartsOfDay";
  v3[255] = @"kMDItemPhotosPartsOfWeek";
  v3[256] = @"kMDItemPhotosSceneClassification";
  v3[257] = @"kMDItemPhotosSceneClassificationLabels";
  v3[258] = @"kMDItemPhotosSceneClassificationSynonyms";
  v3[259] = @"kMDItemPhotosSceneClassificationConfidences";
  v3[260] = @"kMDItemPhotosSceneClassificationIdentifiers";
  v3[261] = @"kMDItemPhotosSceneClassificationTypes";
  v3[262] = @"kMDItemPhotosSceneClassificationMediaTypes";
  v3[263] = @"kMDItemPhotosLocationKeywords";
  v3[264] = @"kMDItemPhotosEntityTitle";
  v3[265] = @"kMDItemPhotosVideoEmbeddingVersion";
  v3[266] = @"kMDItemDocumentUnderstandingTopics";
  v3[267] = @"kMDItemDocumentUnderstandingTopicsLabels";
  v3[268] = @"kMDItemDocumentUnderstandingTopicsSynonyms";
  v3[269] = @"kMDItemDocumentUnderstandingTopicsConfidences";
  v3[270] = @"kMDItemDocumentUnderstandingTopicsVersion";
  v3[271] = @"kMDItemDocumentUnderstandingCategories";
  v3[272] = @"kMDItemDocumentUnderstandingCategoriesLabels";
  v3[273] = @"kMDItemDocumentUnderstandingCategoriesSynonyms";
  v3[274] = @"kMDItemDocumentUnderstandingCategoriesConfidences";
  v3[275] = @"kMDItemDocumentUnderstandingCategoriesVersion";
  v3[276] = @"kMDItemPhotosTimeZoneName";
  v3[277] = @"kMDItemPhotosTimeZoneOffset";
  v3[278] = @"kMDItemPhotosInferredTimeZoneOffset";
  v3[279] = @"kMDItemPhotosTitle";
  v3[280] = @"kMDItemPhotosDescription";
  v3[281] = @"com_apple_mobilesms_isHighlightedContent";
  v3[282] = @"kMDItemSyndicatedContentServerDate";
  v3[283] = @"kMDItemHashtags";
  v3[284] = @"kMDItemHasLPMedia";
  v3[285] = @"kMDItemLPMediaPaths";
  v3[286] = @"kMDItemGroupPhotoPath";
  v3[287] = @"_kMDItemRequiresImport";
  v3[288] = @"_kMDItemImportSandboxExtension";
  v3[289] = @"_kMDItemHasTopMomentScore";
  v3[290] = @"_kMDItemEligibleForPhotosProcessing";
  v3[291] = @"_MDItemLastMotionActivityState";
  v3[292] = @"kMDQueryResultMatchingHints";
  v3[293] = @"kMDItemAuthorContactDSID";
  v3[294] = @"kMDItemApproverContactDSID";
  v3[295] = @"_kMDItemPotentialEventMessage";
  v3[296] = @"kMDItemPhotosLibraryName";
  v3[297] = @"kMDItemPhotosContributor";
  v3[298] = @"MDItemPhotosContributorName";
  v3[299] = @"kMDItemPhotosContributorContactIdentifier";
  v3[300] = @"kMDItemPhotosDonationState";
  v3[301] = @"kMDItemPhotosCharacterRecognitionAnalysisVersion";
  v3[302] = @"kMDItemPhotosFaceAnalysisVersion";
  v3[303] = @"kMDItemPhotosLocationPrivateEncryptedComputeAnalysisVersion";
  v3[304] = @"kMDItemPhotosMediaAnalysisVersion";
  v3[305] = @"kMDItemPhotosMediaAnalysisImageVersion";
  v3[306] = @"kMDItemPhotosPrivateEncryptedComputeAnalysisVersion";
  v3[307] = @"kMDItemPhotosSceneAnalysisVersion";
  v3[308] = @"kMDItemPhotosUtilityTypes";
  v3[309] = @"MDItemCachedViewData";
  v3[310] = @"_kMDItemSummarizedIdentifiers";
  v3[311] = @"_kMDItemSummarizationContentTopLine";
  v3[312] = @"_kMDItemSummarizationContentSynopsis";
  v3[313] = @"_kMDItemSummarizationContentTopic";
  v3[314] = @"_kMDItemIsNew";
  v3[315] = @"_kMDItemIsTwoFactorCode";
  v3[316] = @"_kMDItemIsFromMe";
  v3[317] = @"_kMDItemIsGroupThread";
  v3[318] = @"kMDItemDisableSearchInSpotlight";
  v3[319] = @"_kMDItemRequiresMediaAnalysis";
  v3[320] = @"_kMDItemMediaAnalysisComplete";
  v3[321] = @"_kMDItemSmartRepliesResponse";
  v3[322] = @"_kMDItemSmartRepliesStatus";
  v3[323] = @"_kMDItemSerialNumber";
  v3[324] = @"_kMDItemIndexIdentifier";
  v3[325] = @"kMDItemDetectedEventTypes";
  v3[326] = @"kMDItemLinks";
  v3[327] = @"kMDItemBirthday";
  v3[328] = @"kMDItemHomeAddresses";
  v3[329] = @"kMDItemWorkAddresses";
  v3[330] = @"kMDItemRelationship";
  v3[331] = @"kMDItemAddresses";
  v3[332] = @"kMDItemAddressCategories";
  v3[333] = @"kMDItemBusinessHours";
  v3[334] = @"kMDItemLinkName";
  v3[335] = @"kMDItemLinkType";
  v3[336] = @"kMDItemLinkSubType";
  v3[337] = @"kMDItemCurator";
  v3[338] = @"kMDItemEpisode";
  v3[339] = @"kMDItemPodcastName";
  v3[340] = @"kMDItemURLDescription";
  v3[341] = @"com_apple_mail_message_id_header";
  v3[342] = @"kMDItemCost";
  v3[343] = @"kMDItemCostCode";
  v3[344] = @"kMDItemTimeIsUnknown";
  v3[345] = @"kMDItemStartDateTimeZone";
  v3[346] = @"kMDItemEndDateTimeZone";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:347];
  uint64_t v1 = [MEMORY[0x1E4F1CAD0] setWithArray:v0];
  uint64_t v2 = (void *)_allKeys__allKeys;
  _allKeys__allKeys = v1;
}

+ (id)_sharedAttributeKeySet
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__CSSearchableItemAttributeSet__sharedAttributeKeySet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_sharedAttributeKeySet__once != -1) {
    dispatch_once(&_sharedAttributeKeySet__once, block);
  }
  uint64_t v2 = (void *)_sharedAttributeKeySet__sharedKeySet;

  return v2;
}

void __54__CSSearchableItemAttributeSet__sharedAttributeKeySet__block_invoke(uint64_t a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = [*(id *)(a1 + 32) _allKeys];
  uint64_t v2 = [v5 allObjects];
  uint64_t v3 = [v1 sharedKeySetForKeys:v2];
  uint64_t v4 = (void *)_sharedAttributeKeySet__sharedKeySet;
  _sharedAttributeKeySet__sharedKeySet = v3;
}

- (CSDecoder)contentDecoder
{
  return self->_contentDecoder;
}

- ($917DE44C1CB612B85CED1B4C2573F471)contentObj
{
  *($C7C160116BA828B4EE75DF30F571EBFF *)retstr = ($C7C160116BA828B4EE75DF30F571EBFF)self[5];
  return self;
}

- (BOOL)hasKnownKeysDictionary
{
  return self->_hasKnownKeysDictionary;
}

- (NSArray)matchingHints
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setMatchingHints:(id)a3
{
}

- (void)setAlternateNames:(NSArray *)alternateNames
{
  uint64_t v4 = alternateNames;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemAlternateNames"];
}

- (NSArray)alternateNames
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemAlternateNames"];
}

- (void)setPath:(NSString *)path
{
}

- (NSString)path
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPath"];
}

- (void)setTextContentPieces:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v23 = (void *)[v4 copy];
      goto LABEL_150;
    }
    goto LABEL_106;
  }
  id v5 = [v4 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    if ([v4 count])
    {
      id v37 = v4;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id obja = v4;
      uint64_t v24 = [obja countByEnumeratingWithState:&v49 objects:v58 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        long long v23 = 0;
        uint64_t v26 = *(void *)v50;
        uint64_t v39 = *(void *)v50;
        do
        {
          uint64_t v27 = 0;
          uint64_t v40 = v25;
          do
          {
            if (*(void *)v50 != v26) {
              objc_enumerationMutation(obja);
            }
            long long v28 = *(void **)(*((void *)&v49 + 1) + 8 * v27);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v44 = v27;
              long long v47 = 0u;
              long long v48 = 0u;
              long long v45 = 0u;
              long long v46 = 0u;
              id v29 = v28;
              uint64_t v30 = [v29 countByEnumeratingWithState:&v45 objects:v57 count:16];
              if (v30)
              {
                uint64_t v31 = v30;
                uint64_t v32 = *(void *)v46;
                do
                {
                  for (uint64_t i = 0; i != v31; ++i)
                  {
                    if (*(void *)v46 != v32) {
                      objc_enumerationMutation(v29);
                    }
                    uint64_t v34 = *(void **)(*((void *)&v45 + 1) + 8 * i);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      if (v23) {
                        [v23 appendString:@"\n"];
                      }
                      else {
                        long long v23 = objc_opt_new();
                      }
                      objc_msgSend(v23, "appendString:", v34, v37);
                    }
                    else
                    {
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        if (v23) {
                          [v23 appendString:@"\n"];
                        }
                        else {
                          long long v23 = objc_opt_new();
                        }
                        objc_msgSend(v34, "appendToString:", v23, v37);
                      }
                    }
                  }
                  uint64_t v31 = [v29 countByEnumeratingWithState:&v45 objects:v57 count:16];
                }
                while (v31);
              }

              uint64_t v26 = v39;
              uint64_t v25 = v40;
              uint64_t v27 = v44;
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                if (v23) {
                  [v23 appendString:@"\n"];
                }
                else {
                  long long v23 = objc_opt_new();
                }
                objc_msgSend(v23, "appendString:", v28, v37);
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  if (v23) {
                    [v23 appendString:@"\n"];
                  }
                  else {
                    long long v23 = objc_opt_new();
                  }
                  objc_msgSend(v28, "appendToString:", v23, v37);
                }
              }
            }
            ++v27;
          }
          while (v27 != v25);
          uint64_t v25 = [obja countByEnumeratingWithState:&v49 objects:v58 count:16];
        }
        while (v25);
      }
      else
      {
        long long v23 = 0;
      }

      id v4 = v37;
      goto LABEL_150;
    }
LABEL_106:
    long long v23 = 0;
    goto LABEL_150;
  }
  id v37 = v4;
  uint64_t v38 = self;
  id v7 = [v4 sortedArrayUsingComparator:&__block_literal_global_313];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v53 objects:v59 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    obuint64_t j = 0;
    uint64_t v43 = 0;
    uint64_t v12 = *(void *)v54;
    while (1)
    {
      for (uint64_t j = 0; j != v9; ++j)
      {
        if (*(void *)v54 != v12) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void *)(*((void *)&v53 + 1) + 8 * j);
        if (*(void *)(v14 + 88))
        {
          if (!*(unsigned char *)(v14 + 96))
          {
            double v15 = *(double *)(v14 + 80);
            double v16 = *(double *)(v14 + 32);
            id v17 = *(id *)(v14 + 8);
            if (v15 >= 0.03)
            {
              if (v16 < 0.7)
              {
                objc_opt_class();
                char v18 = objc_opt_isKindOfClass();
                if (v16 >= 0.5) {
                  goto LABEL_30;
                }
                goto LABEL_23;
              }
            }
            else if (v15 >= 0.02)
            {
              if (v16 < 0.8)
              {
                objc_opt_class();
                char v18 = objc_opt_isKindOfClass();
                if (v16 >= 0.6) {
                  goto LABEL_30;
                }
                goto LABEL_23;
              }
            }
            else if (v16 < 0.9)
            {
              objc_opt_class();
              char v18 = objc_opt_isKindOfClass();
              if (v16 >= 0.7)
              {
LABEL_30:
                if (v18)
                {
                  if (v43)
                  {
                    [v43 appendString:@"\n"];
                    uint64_t v19 = v43;
                  }
                  else
                  {
                    uint64_t v19 = objc_opt_new();
                  }
                  uint64_t v43 = v19;
                  goto LABEL_53;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  if (v43)
                  {
                    [v43 appendString:@"\n"];
                    uint64_t v20 = (uint64_t)v43;
                  }
                  else
                  {
                    uint64_t v20 = objc_opt_new();
                  }
                  uint64_t v21 = v17;
                  uint64_t v43 = (void *)v20;
                  goto LABEL_60;
                }
LABEL_62:

                continue;
              }
LABEL_23:
              if (v18)
              {
                if (obj)
                {
                  [obj appendString:@"\n"];
                  uint64_t v19 = obj;
                }
                else
                {
                  uint64_t v19 = objc_opt_new();
                }
                obuint64_t j = v19;
LABEL_53:
                [v19 appendString:v17];
                goto LABEL_62;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_62;
              }
              if (obj)
              {
                [obj appendString:@"\n"];
                uint64_t v20 = (uint64_t)obj;
              }
              else
              {
                uint64_t v20 = objc_opt_new();
              }
              uint64_t v21 = v17;
              obuint64_t j = (id)v20;
LABEL_60:
              uint64_t v22 = (void *)v20;
              goto LABEL_61;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              if (v11) {
                [v11 appendString:@"\n"];
              }
              else {
                uint64_t v11 = objc_opt_new();
              }
              uint64_t v19 = v11;
              goto LABEL_53;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_62;
            }
            if (v11) {
              [v11 appendString:@"\n"];
            }
            else {
              uint64_t v11 = objc_opt_new();
            }
            uint64_t v21 = v17;
            uint64_t v22 = v11;
LABEL_61:
            [v21 appendToString:v22];
            goto LABEL_62;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (v10) {
              [v10 appendString:@"\n"];
            }
            else {
              uint64_t v10 = objc_opt_new();
            }
            [v10 appendString:*(void *)(v14 + 8)];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              if (v10) {
                [v10 appendString:@"\n"];
              }
              else {
                uint64_t v10 = objc_opt_new();
              }
              [*(id *)(v14 + 8) appendToString:v10];
            }
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v53 objects:v59 count:16];
      if (!v9) {
        goto LABEL_108;
      }
    }
  }
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  obuint64_t j = 0;
  uint64_t v43 = 0;
LABEL_108:
  uint64_t v35 = obj;
  uint64_t v36 = v43;
  if (v10 || v11 || v43 || obj)
  {
    id v4 = v37;
    if (v10)
    {
      [(CSSearchableItemAttributeSet *)v38 _setStringValue:v10 forKey:@"_kMDItemOCRContentTitle"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v23 = objc_opt_new();
        [v23 appendString:v10];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v23 = objc_opt_new();
          [v10 appendToString:v23];
        }
        else
        {
          long long v23 = 0;
        }
      }
      uint64_t v35 = obj;
      uint64_t v36 = v43;
    }
    else
    {
      long long v23 = 0;
    }
    if (v11)
    {
      [(CSSearchableItemAttributeSet *)v38 _setStringValue:v11 forKey:@"_kMDItemOCRContentLevel1"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (v23) {
          [v23 appendString:@"\n"];
        }
        else {
          long long v23 = objc_opt_new();
        }
        [v23 appendString:v11];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (v23) {
            [v23 appendString:@"\n"];
          }
          else {
            long long v23 = objc_opt_new();
          }
          [v11 appendToString:v23];
        }
      }
      uint64_t v35 = obj;
      uint64_t v36 = v43;
    }
    if (v36)
    {
      [(CSSearchableItemAttributeSet *)v38 _setStringValue:v36 forKey:@"_kMDItemOCRContentLevel2"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (v23) {
          [v23 appendString:@"\n"];
        }
        else {
          long long v23 = objc_opt_new();
        }
        [v23 appendString:v43];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (v23) {
            [v23 appendString:@"\n"];
          }
          else {
            long long v23 = objc_opt_new();
          }
          [v43 appendToString:v23];
        }
      }
      uint64_t v35 = obj;
    }
    if (v35)
    {
      [(CSSearchableItemAttributeSet *)v38 _setStringValue:obj forKey:@"_kMDItemOCRContentLevel3"];
      uint64_t v35 = obj;
    }
  }
  else
  {
    long long v23 = 0;
    id v4 = v37;
  }

  self = v38;
LABEL_150:
  -[CSSearchableItemAttributeSet setTextContent:](self, "setTextContent:", v23, v37);
}

uint64_t __67__CSSearchableItemAttributeSet_CSAttributes__setTextContentPieces___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = (double *)v4;
  id v7 = (double *)v5;
  uint64_t v8 = v7;
  double v9 = v6[8];
  double v10 = v7[8];
  if (v9 <= v10) {
    uint64_t v11 = v9 < v10 || v6[7] > v7[7];
  }
  else {
    uint64_t v11 = -1;
  }

  return v11;
}

- (id)textContentPieces
{
  return 0;
}

- (void)setRelatedUniqueIdentifier:(NSString *)relatedUniqueIdentifier
{
}

- (void)setWeakRelatedUniqueIdentifier:(NSString *)weakRelatedUniqueIdentifier
{
}

- (void)setContentURL:(NSURL *)contentURL
{
  id v4 = contentURL;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemContentURL" copy:0];
}

- (void)setThumbnailBundleID:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"MDItemThumbnailBundleID" copy:1];
}

- (NSString)thumbnailBundleID
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"MDItemThumbnailBundleID"];
}

- (void)setThumbnailContentType:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"MDItemThumbnailContentType" copy:1];
}

- (NSString)thumbnailContentType
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"MDItemThumbnailContentType"];
}

- (void)setIsWebClip:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemIsWebClip" copy:0];
}

- (NSNumber)isWebClip
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemIsWebClip"];
}

- (void)setThumbnailURL:(NSURL *)thumbnailURL
{
  id v4 = thumbnailURL;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemThumbnailURL" copy:0];
}

- (NSURL)thumbnailURL
{
  uint64_t v2 = [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemThumbnailURL"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
LABEL_5:
    id v4 = v3;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
    goto LABEL_5;
  }
  id v4 = 0;
LABEL_7:

  return (NSURL *)v4;
}

- (void)setThumbnailData:(NSData *)thumbnailData
{
}

- (NSData)thumbnailData
{
  return (NSData *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemThumbnailData"];
}

- (void)setDarkThumbnailURL:(NSURL *)darkThumbnailURL
{
  id v4 = darkThumbnailURL;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemDarkThumbnailURL" copy:0];
}

- (NSURL)darkThumbnailURL
{
  uint64_t v2 = [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemDarkThumbnailURL"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
LABEL_5:
    id v4 = v3;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
    goto LABEL_5;
  }
  id v4 = 0;
LABEL_7:

  return (NSURL *)v4;
}

- (NSArray)accountHandles
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemAccountHandles"];
}

- (void)setMetadataModificationDate:(NSDate *)metadataModificationDate
{
}

- (NSDate)metadataModificationDate
{
  return (NSDate *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemAttributeChangeDate"];
}

- (NSArray)keywords
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemKeywords"];
}

- (void)setAuthorNames:(NSArray *)authorNames
{
  id v4 = authorNames;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemAuthors"];
}

- (void)setRecipientNames:(NSArray *)recipientNames
{
  id v4 = recipientNames;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemRecipients"];
}

- (void)setEditors:(NSArray *)editors
{
  id v4 = editors;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemEditors"];
}

- (NSArray)editors
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEditors"];
}

- (void)setParticipants:(NSArray *)participants
{
  id v4 = participants;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemParticipants"];
}

- (NSArray)participants
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemParticipants"];
}

- (void)setAuthorEmailAddresses:(NSArray *)authorEmailAddresses
{
  id v4 = authorEmailAddresses;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemAuthorEmailAddresses"];
}

- (NSArray)authorEmailAddresses
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemAuthorEmailAddresses"];
}

- (void)setRecipientEmailAddresses:(NSArray *)recipientEmailAddresses
{
  id v4 = recipientEmailAddresses;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemRecipientEmailAddresses"];
}

- (void)setAuthorAddresses:(NSArray *)authorAddresses
{
  id v4 = authorAddresses;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemAuthorAddresses"];
}

- (NSArray)authorAddresses
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemAuthorAddresses"];
}

- (void)setRecipientAddresses:(NSArray *)recipientAddresses
{
  id v4 = recipientAddresses;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemRecipientAddresses"];
}

- (NSArray)recipientAddresses
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemRecipientAddresses"];
}

- (void)setProjects:(NSArray *)projects
{
  id v4 = projects;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemProjects"];
}

- (NSArray)projects
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemProjects"];
}

- (void)setDownloadedDate:(NSDate *)downloadedDate
{
}

- (NSDate)downloadedDate
{
  return (NSDate *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemDownloadedDate"];
}

- (void)setContentSources:(NSArray *)contentSources
{
  id v4 = contentSources;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemWhereFroms"];
}

- (NSArray)contentSources
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemWhereFroms"];
}

- (void)setComment:(NSString *)comment
{
}

- (NSString)comment
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemComment"];
}

- (void)setCopyright:(NSString *)copyright
{
}

- (NSString)copyright
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemCopyright"];
}

- (void)setLastUsedDate:(NSDate *)lastUsedDate
{
}

- (void)setLastAppEngagementDate:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemLastAppEngagementDate" copy:0];
}

- (id)lastAppEngagementDate
{
  return [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemLastAppEngagementDate"];
}

- (void)setLastAppSearchEngagementQuery:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemLastAppSearchEngagementQuery" copy:1];
}

- (id)lastAppSearchEngagementQuery
{
  return [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemLastAppSearchEngagementQuery"];
}

- (void)setLastAppSearchEngagementRenderPosition:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemLastAppSearchEngagementRenderPosition" copy:0];
}

- (id)lastAppSearchEngagementRenderPosition
{
  return [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemLastAppSearchEngagementRenderPosition"];
}

- (void)setContentModificationDate:(NSDate *)contentModificationDate
{
}

- (void)setAddedDate:(NSDate *)addedDate
{
}

- (NSDate)addedDate
{
  return (NSDate *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemDateAdded"];
}

- (void)setDuration:(NSNumber *)duration
{
}

- (NSNumber)duration
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemDurationSeconds"];
}

- (void)setContactKeywords:(NSArray *)contactKeywords
{
  id v4 = contactKeywords;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemContactKeywords"];
}

- (NSArray)contactKeywords
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemContactKeywords"];
}

- (void)setVersion:(NSString *)version
{
}

- (NSString)version
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemVersion"];
}

- (void)setPixelHeight:(NSNumber *)pixelHeight
{
}

- (NSNumber)pixelHeight
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPixelHeight"];
}

- (void)setPixelWidth:(NSNumber *)pixelWidth
{
}

- (NSNumber)pixelWidth
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPixelWidth"];
}

- (void)setPixelCount:(NSNumber *)pixelCount
{
}

- (NSNumber)pixelCount
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPixelCount"];
}

- (void)setColorSpace:(NSString *)colorSpace
{
}

- (NSString)colorSpace
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemColorSpace"];
}

- (void)setBitsPerSample:(NSNumber *)bitsPerSample
{
}

- (NSNumber)bitsPerSample
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemBitsPerSample"];
}

- (void)setFlashOn:(NSNumber *)flashOn
{
}

- (NSNumber)isFlashOn
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemFlashOnOff"];
}

- (void)setFocalLength:(NSNumber *)focalLength
{
}

- (NSNumber)focalLength
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemFocalLength"];
}

- (void)setFocalLength35mm:(NSNumber *)focalLength35mm
{
}

- (NSNumber)isFocalLength35mm
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemFocalLength35mm"];
}

- (void)setAcquisitionMake:(NSString *)acquisitionMake
{
}

- (NSString)acquisitionMake
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemAcquisitionMake"];
}

- (void)setAcquisitionModel:(NSString *)acquisitionModel
{
}

- (NSString)acquisitionModel
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemAcquisitionModel"];
}

- (void)setCameraOwner:(NSString *)cameraOwner
{
}

- (NSString)cameraOwner
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemCameraOwner"];
}

- (void)setLensModel:(NSString *)lensModel
{
}

- (NSString)lensModel
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemLensModel"];
}

- (void)setISOSpeed:(NSNumber *)ISOSpeed
{
}

- (NSNumber)ISOSpeed
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemISOSpeed"];
}

- (void)setOrientation:(NSNumber *)orientation
{
}

- (NSNumber)orientation
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemOrientation"];
}

- (void)setLayerNames:(NSArray *)layerNames
{
  id v4 = layerNames;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemLayerNames"];
}

- (NSArray)layerNames
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemLayerNames"];
}

- (void)setWhiteBalance:(NSNumber *)whiteBalance
{
}

- (NSNumber)whiteBalance
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemWhiteBalance"];
}

- (void)setAperture:(NSNumber *)aperture
{
}

- (NSNumber)aperture
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemAperture"];
}

- (void)setProfileName:(NSString *)profileName
{
}

- (NSString)profileName
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemProfileName"];
}

- (void)setResolutionWidthDPI:(NSNumber *)resolutionWidthDPI
{
}

- (NSNumber)resolutionWidthDPI
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemResolutionWidthDPI"];
}

- (void)setResolutionHeightDPI:(NSNumber *)resolutionHeightDPI
{
}

- (NSNumber)resolutionHeightDPI
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemResolutionHeightDPI"];
}

- (void)setExposureMode:(NSNumber *)exposureMode
{
}

- (NSNumber)exposureMode
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemExposureMode"];
}

- (void)setExposureTime:(NSNumber *)exposureTime
{
}

- (NSNumber)exposureTime
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemExposureTimeSeconds"];
}

- (void)setEXIFVersion:(NSString *)EXIFVersion
{
}

- (NSString)EXIFVersion
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEXIFVersion"];
}

- (void)setEXIFGPSVersion:(NSString *)EXIFGPSVersion
{
}

- (NSString)EXIFGPSVersion
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEXIFGPSVersion"];
}

- (void)setCodecs:(NSArray *)codecs
{
  id v4 = codecs;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemCodecs"];
}

- (NSArray)codecs
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemCodecs"];
}

- (void)setMediaTypes:(NSArray *)mediaTypes
{
  id v4 = mediaTypes;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemMediaTypes"];
}

- (NSArray)mediaTypes
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemMediaTypes"];
}

- (void)setStreamable:(NSNumber *)streamable
{
}

- (NSNumber)isStreamable
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemStreamable"];
}

- (void)setTotalBitRate:(NSNumber *)totalBitRate
{
}

- (NSNumber)totalBitRate
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemTotalBitRate"];
}

- (void)setVideoBitRate:(NSNumber *)videoBitRate
{
}

- (NSNumber)videoBitRate
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemVideoBitRate"];
}

- (void)setAudioBitRate:(NSNumber *)audioBitRate
{
}

- (NSNumber)audioBitRate
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemAudioBitRate"];
}

- (void)setDeliveryType:(NSNumber *)deliveryType
{
}

- (NSNumber)deliveryType
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemDeliveryType"];
}

- (void)setAlbum:(NSString *)album
{
}

- (NSString)album
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemAlbum"];
}

- (void)setArtist:(NSString *)artist
{
}

- (NSString)artist
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemArtist"];
}

- (void)setHasAlphaChannel:(NSNumber *)hasAlphaChannel
{
}

- (NSNumber)hasAlphaChannel
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemHasAlphaChannel"];
}

- (void)setRedEyeOn:(NSNumber *)redEyeOn
{
}

- (NSNumber)isRedEyeOn
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemRedEyeOnOff"];
}

- (void)setMeteringMode:(NSString *)meteringMode
{
}

- (NSString)meteringMode
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemMeteringMode"];
}

- (void)setMaxAperture:(NSNumber *)maxAperture
{
}

- (NSNumber)maxAperture
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemMaxAperture"];
}

- (void)setFNumber:(NSNumber *)fNumber
{
}

- (NSNumber)fNumber
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemFNumber"];
}

- (void)setExposureProgram:(NSString *)exposureProgram
{
}

- (NSString)exposureProgram
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemExposureProgram"];
}

- (void)setExposureTimeString:(NSString *)exposureTimeString
{
}

- (NSString)exposureTimeString
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemExposureTimeString"];
}

- (void)setHeadline:(NSString *)headline
{
}

- (NSString)headline
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemHeadline"];
}

- (void)setInstructions:(NSString *)instructions
{
}

- (NSString)instructions
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemInstructions"];
}

- (void)setThoroughfare:(NSString *)thoroughfare
{
}

- (NSString)thoroughfare
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemThoroughfare"];
}

- (void)setSubThoroughfare:(NSString *)subThoroughfare
{
}

- (NSString)subThoroughfare
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemSubThoroughfare"];
}

- (void)setPostalCode:(NSString *)postalCode
{
}

- (NSString)postalCode
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPostalCode"];
}

- (void)setCity:(NSString *)city
{
}

- (NSString)city
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemCity"];
}

- (void)setStateOrProvince:(NSString *)stateOrProvince
{
}

- (NSString)stateOrProvince
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemStateOrProvince"];
}

- (void)setCountry:(NSString *)country
{
}

- (NSString)country
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemCountry"];
}

- (void)setFullyFormattedAddress:(NSString *)fullyFormattedAddress
{
}

- (NSString)fullyFormattedAddress
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemFullyFormattedAddress"];
}

- (void)setAltitude:(NSNumber *)altitude
{
}

- (NSNumber)altitude
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemAltitude"];
}

- (void)setLatitude:(NSNumber *)latitude
{
}

- (NSNumber)latitude
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemLatitude"];
}

- (void)setLongitude:(NSNumber *)longitude
{
}

- (NSNumber)longitude
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemLongitude"];
}

- (void)setSupportsNavigation:(NSNumber *)supportsNavigation
{
}

- (NSNumber)supportsNavigation
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemSupportsNavigation"];
}

- (void)setActionIdentifiers:(NSArray *)actionIdentifiers
{
  id v4 = actionIdentifiers;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemActionIdentifiers"];
}

- (NSArray)actionIdentifiers
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemActionIdentifiers"];
}

- (void)setSharedItemContentType:(UTType *)sharedItemContentType
{
  id v4 = [(UTType *)sharedItemContentType identifier];
  [(CSSearchableItemAttributeSet *)self _setStringValue:v4 forKey:@"kMDItemSharedItemContentType"];
}

- (UTType)sharedItemContentType
{
  uint64_t v2 = (void *)MEMORY[0x1E4F442D8];
  id v3 = [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemSharedItemContentType"];
  id v4 = [v2 typeWithIdentifier:v3];

  return (UTType *)v4;
}

- (void)setSpeed:(NSNumber *)speed
{
}

- (NSNumber)speed
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemSpeed"];
}

- (void)setTimestamp:(NSDate *)timestamp
{
}

- (NSDate)timestamp
{
  return (NSDate *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemTimestamp"];
}

- (void)setImageDirection:(NSNumber *)imageDirection
{
}

- (NSNumber)imageDirection
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemImageDirection"];
}

- (void)setNamedLocation:(NSString *)namedLocation
{
}

- (NSString)namedLocation
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemNamedLocation"];
}

- (void)setGPSTrack:(NSNumber *)GPSTrack
{
}

- (NSNumber)GPSTrack
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemGPSTrack"];
}

- (void)setGPSStatus:(NSString *)GPSStatus
{
}

- (NSString)GPSStatus
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemGPSStatus"];
}

- (void)setGPSMeasureMode:(NSString *)GPSMeasureMode
{
}

- (NSString)GPSMeasureMode
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemGPSMeasureMode"];
}

- (void)setGPSDOP:(NSNumber *)GPSDOP
{
}

- (NSNumber)GPSDOP
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemGPSDOP"];
}

- (void)setGPSMapDatum:(NSString *)GPSMapDatum
{
}

- (NSString)GPSMapDatum
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemGPSMapDatum"];
}

- (void)setGPSDestLatitude:(NSNumber *)GPSDestLatitude
{
}

- (NSNumber)GPSDestLatitude
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemGPSDestLatitude"];
}

- (void)setGPSDestLongitude:(NSNumber *)GPSDestLongitude
{
}

- (NSNumber)GPSDestLongitude
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemGPSDestLongitude"];
}

- (void)setGPSDestBearing:(NSNumber *)GPSDestBearing
{
}

- (NSNumber)GPSDestBearing
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemGPSDestBearing"];
}

- (void)setGPSDestDistance:(NSNumber *)GPSDestDistance
{
}

- (NSNumber)GPSDestDistance
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemGPSDestDistance"];
}

- (void)setGPSProcessingMethod:(NSString *)GPSProcessingMethod
{
}

- (NSString)GPSProcessingMethod
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemGPSProcessingMethod"];
}

- (void)setGPSAreaInformation:(NSString *)GPSAreaInformation
{
}

- (NSString)GPSAreaInformation
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemGPSAreaInformation"];
}

- (void)setGPSDateStamp:(NSDate *)GPSDateStamp
{
}

- (NSDate)GPSDateStamp
{
  return (NSDate *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemGPSDateStamp"];
}

- (void)setGPSDifferental:(NSNumber *)GPSDifferental
{
}

- (NSNumber)GPSDifferental
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemGPSDifferental"];
}

- (void)setAudioSampleRate:(NSNumber *)audioSampleRate
{
}

- (NSNumber)audioSampleRate
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemAudioSampleRate"];
}

- (void)setAudioChannelCount:(NSNumber *)audioChannelCount
{
}

- (NSNumber)audioChannelCount
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemAudioChannelCount"];
}

- (void)setTempo:(NSNumber *)tempo
{
}

- (NSNumber)tempo
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemTempo"];
}

- (void)setKeySignature:(NSString *)keySignature
{
}

- (NSString)keySignature
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemKeySignature"];
}

- (void)setTimeSignature:(NSString *)timeSignature
{
}

- (NSString)timeSignature
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemTimeSignature"];
}

- (void)setAudioEncodingApplication:(NSString *)audioEncodingApplication
{
}

- (NSString)audioEncodingApplication
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemAudioEncodingApplication"];
}

- (void)setComposer:(NSString *)composer
{
}

- (NSString)composer
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemComposer"];
}

- (void)setLyricist:(NSString *)lyricist
{
}

- (NSString)lyricist
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemLyricist"];
}

- (void)setAudioTrackNumber:(NSNumber *)audioTrackNumber
{
}

- (NSNumber)audioTrackNumber
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemAudioTrackNumber"];
}

- (void)setRecordingDate:(NSDate *)recordingDate
{
}

- (NSDate)recordingDate
{
  return (NSDate *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemRecordingDate"];
}

- (void)setMusicalGenre:(NSString *)musicalGenre
{
}

- (NSString)musicalGenre
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemMusicalGenre"];
}

- (void)setGeneralMIDISequence:(NSNumber *)generalMIDISequence
{
}

- (NSNumber)isGeneralMIDISequence
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemIsGeneralMIDISequence"];
}

- (void)setOrganizations:(NSArray *)organizations
{
  id v4 = organizations;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemOrganizations"];
}

- (NSArray)organizations
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemOrganizations"];
}

- (void)setRole:(NSString *)role
{
}

- (NSString)role
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemRole"];
}

- (void)setLanguages:(NSArray *)languages
{
  id v4 = languages;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemLanguages"];
}

- (NSArray)languages
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemLanguages"];
}

- (void)setRights:(NSString *)rights
{
}

- (NSString)rights
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemRights"];
}

- (void)setPublishers:(NSArray *)publishers
{
  id v4 = publishers;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemPublishers"];
}

- (NSArray)publishers
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPublishers"];
}

- (void)setContributors:(NSArray *)contributors
{
  id v4 = contributors;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemContributors"];
}

- (NSArray)contributors
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemContributors"];
}

- (void)setCoverage:(NSArray *)coverage
{
  id v4 = coverage;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemCoverage"];
}

- (NSArray)coverage
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemCoverage"];
}

- (NSString)subject
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemSubject"];
}

- (NSString)theme
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemTheme"];
}

- (NSString)contentDescription
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemDescription"];
}

- (NSString)identifier
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemIdentifier"];
}

- (void)setAudiences:(NSArray *)audiences
{
  id v4 = audiences;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemAudiences"];
}

- (NSArray)audiences
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemAudiences"];
}

- (void)setPageCount:(NSNumber *)pageCount
{
}

- (NSNumber)pageCount
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemNumberOfPages"];
}

- (void)setFileSize:(NSNumber *)fileSize
{
}

- (void)setPageWidth:(NSNumber *)pageWidth
{
}

- (NSNumber)pageWidth
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPageWidth"];
}

- (void)setPageHeight:(NSNumber *)pageHeight
{
}

- (NSNumber)pageHeight
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPageHeight"];
}

- (void)setSecurityMethod:(NSString *)securityMethod
{
}

- (NSString)securityMethod
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemSecurityMethod"];
}

- (void)setCreator:(NSString *)creator
{
}

- (NSString)creator
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemCreator"];
}

- (void)setEncodingApplications:(NSArray *)encodingApplications
{
  id v4 = encodingApplications;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemEncodingApplications"];
}

- (NSArray)encodingApplications
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEncodingApplications"];
}

- (void)setDueDate:(NSDate *)dueDate
{
}

- (NSDate)dueDate
{
  return (NSDate *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemDueDate"];
}

- (void)setCompletionDate:(NSDate *)completionDate
{
}

- (NSDate)completionDate
{
  return (NSDate *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemCompletionDate"];
}

- (void)setStartDate:(NSDate *)startDate
{
}

- (NSDate)startDate
{
  return (NSDate *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemStartDate"];
}

- (void)setEndDate:(NSDate *)endDate
{
}

- (NSDate)endDate
{
  return (NSDate *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEndDate"];
}

- (void)setImportantDates:(NSArray *)importantDates
{
  id v4 = importantDates;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemImportantDates"];
}

- (NSArray)importantDates
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemImportantDates"];
}

- (void)setRating:(NSNumber *)rating
{
}

- (NSNumber)rating
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemStarRating"];
}

- (void)setRatingDescription:(NSString *)ratingDescription
{
}

- (NSString)ratingDescription
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemRatingDescription"];
}

- (void)setPlayCount:(NSNumber *)playCount
{
}

- (NSNumber)playCount
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPlayCount"];
}

- (void)setLocal:(NSNumber *)local
{
}

- (NSNumber)isLocal
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemIsLocal"];
}

- (void)setContentRating:(NSNumber *)contentRating
{
}

- (NSNumber)contentRating
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemContentRating"];
}

- (void)setPhoneNumbers:(NSArray *)phoneNumbers
{
  id v4 = phoneNumbers;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemPhoneNumbers"];
}

- (NSArray)phoneNumbers
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhoneNumbers"];
}

- (void)setSupportsPhoneCall:(NSNumber *)supportsPhoneCall
{
}

- (NSNumber)supportsPhoneCall
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemSupportsPhoneCall"];
}

- (void)setEmailAddresses:(NSArray *)emailAddresses
{
  id v4 = emailAddresses;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemEmailAddresses"];
}

- (void)setInstantMessageAddresses:(NSArray *)instantMessageAddresses
{
  id v4 = instantMessageAddresses;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemInstantMessageAddresses"];
}

- (NSArray)instantMessageAddresses
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemInstantMessageAddresses"];
}

- (void)setPotentialEventMessage:(id)a3
{
}

- (NSNumber)isPotentialEventMessage
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemPotentialEventMessage"];
}

- (void)setKind:(NSString *)kind
{
}

- (NSString)kind
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemKind"];
}

- (void)setFinderComment:(id)a3
{
}

- (id)finderComment
{
  return [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemFinderComment"];
}

- (void)setCalendarHolidayIdentifier:(id)a3
{
}

- (id)calendarHolidayIdentifier
{
  return [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemCalendarHolidayIdentifier"];
}

- (void)setFontNames:(NSArray *)fontNames
{
  id v4 = fontNames;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemFonts"];
}

- (NSArray)fontNames
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemFonts"];
}

- (void)setAppleLoopsRootKey:(id)a3
{
}

- (id)appleLoopsRootKey
{
  return [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemAppleLoopsRootKey"];
}

- (void)setAppleLoopsKeyFilterType:(id)a3
{
}

- (id)appleLoopsKeyFilterType
{
  return [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemAppleLoopsKeyFilterType"];
}

- (void)setAppleLoopsLoopMode:(id)a3
{
}

- (id)appleLoopsLoopMode
{
  return [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemAppleLoopsLoopMode"];
}

- (void)setAppleLoopDescriptors:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemAppleLoopDescriptors"];
}

- (id)appleLoopDescriptors
{
  return [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemAppleLoopDescriptors"];
}

- (void)setMusicalInstrumentCategory:(NSString *)musicalInstrumentCategory
{
}

- (NSString)musicalInstrumentCategory
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemMusicalInstrumentCategory"];
}

- (void)setMusicalInstrumentName:(NSString *)musicalInstrumentName
{
}

- (NSString)musicalInstrumentName
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemMusicalInstrumentName"];
}

- (void)setBundleIdentifier:(id)a3
{
}

- (id)bundleIdentifier
{
  return [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemBundleIdentifier"];
}

- (void)setExecutableArchitectures:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemExecutableArchitectures"];
}

- (id)executableArchitectures
{
  return [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemExecutableArchitectures"];
}

- (void)setExecutablePlatform:(id)a3
{
}

- (id)executablePlatform
{
  return [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemExecutablePlatform"];
}

- (void)setVendorName:(id)a3
{
}

- (id)vendorName
{
  return [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemVendorName"];
}

- (void)setApplicationCategories:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemApplicationCategories"];
}

- (id)applicationCategories
{
  return [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemApplicationCategories"];
}

- (void)setApplicationManaged:(id)a3
{
}

- (id)isApplicationManaged
{
  return [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemIsApplicationManaged"];
}

- (void)setSupportFileType:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemSupportFileType"];
}

- (id)supportFileType
{
  return [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemSupportFileType"];
}

- (void)setInformation:(NSString *)information
{
}

- (NSString)information
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemInformation"];
}

- (void)setDirector:(NSString *)director
{
}

- (NSString)director
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemDirector"];
}

- (void)setProducer:(NSString *)producer
{
}

- (NSString)producer
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemProducer"];
}

- (void)setGenre:(NSString *)genre
{
}

- (NSString)genre
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemGenre"];
}

- (void)setPerformers:(NSArray *)performers
{
  id v4 = performers;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemPerformers"];
}

- (NSArray)performers
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPerformers"];
}

- (void)setOriginalFormat:(NSString *)originalFormat
{
}

- (NSString)originalFormat
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemOriginalFormat"];
}

- (void)setOriginalSource:(NSString *)originalSource
{
}

- (NSString)originalSource
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemOriginalSource"];
}

- (void)setURL:(NSURL *)URL
{
}

- (NSURL)URL
{
  uint64_t v2 = [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemURL"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
LABEL_5:
    id v4 = v3;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
    goto LABEL_5;
  }
  id v4 = 0;
LABEL_7:

  return (NSURL *)v4;
}

- (void)setLikelyJunk:(NSNumber *)likelyJunk
{
}

- (NSNumber)isLikelyJunk
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemIsLikelyJunk"];
}

- (void)setProviderDataTypes:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"_kMDItemProviderDataTypes"];
}

- (id)providerDataTypes
{
  return [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemProviderDataTypes"];
}

- (void)setProviderFileTypes:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"_kMDItemProviderFileTypes"];
}

- (id)providerFileTypes
{
  return [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemProviderFileTypes"];
}

- (NSArray)providerDataTypeIdentifiers
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemProviderDataTypes"];
}

- (void)setProviderFileTypeIdentifiers:(NSArray *)providerFileTypeIdentifiers
{
  id v4 = providerFileTypeIdentifiers;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"_kMDItemProviderFileTypes"];
}

- (NSArray)providerFileTypeIdentifiers
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemProviderFileTypes"];
}

- (void)setProviderInPlaceFileTypeIdentifiers:(NSArray *)providerInPlaceFileTypeIdentifiers
{
  id v4 = providerInPlaceFileTypeIdentifiers;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"_MDItemProviderInPlaceFileTypes"];
}

- (NSArray)providerInPlaceFileTypeIdentifiers
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_MDItemProviderInPlaceFileTypes"];
}

- (void)setCalendarDelegateIdentifier:(id)a3
{
}

- (id)calendarDelegateIdentifier
{
  return [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemCalendarDelegateIdentifier"];
}

- (void)setAuthorPhotosPersonIdentifiers:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemAuthorPhotosPersonIdentifiers"];
}

- (NSArray)authorPhotosPersonIdentifiers
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemAuthorPhotosPersonIdentifiers"];
}

- (void)setRecipientPhotosPersonIdentifiers:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemRecipientPhotosPersonIdentifiers"];
}

- (NSArray)recipientPhotosPersonIdentifiers
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemRecipientPhotosPersonIdentifiers"];
}

- (void)setCollaborationIdentifier:(id)a3
{
}

- (NSString)collaborationIdentifier
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemCollaborationIdentifier"];
}

- (void)setRichLinkTitle:(id)a3
{
}

- (NSString)richLinkTitle
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemRichLinkTitle"];
}

- (void)setRichLinkID:(id)a3
{
}

- (NSString)richLinkID
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemRichLinkID"];
}

- (void)setRichLinkURL:(id)a3
{
}

- (NSString)richLinkURL
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemRichLinkURL"];
}

- (void)setThumbnailSymbolName:(id)a3
{
}

- (NSString)thumbnailSymbolName
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemThumbnailSymbolName"];
}

- (NSArray)resultMatchingAttributes
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDQueryResultMatchingAttributes"];
}

- (NSArray)resultMatchingSceneIdentifiers
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDQueryResultMatchingSceneIdentifiers"];
}

- (NSString)textContentNoCopy
{
  id v3 = [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemTextContent"];
  if (!v3)
  {
    if (self->_contentDecoder
      && ((p_contentObuint64_t j = &self->_contentObj,
           long long v7 = *(_OWORD *)&self->_contentObj.containerBytes,
           $37FF168C8709F524D812460C59637AB1 reference = self->_contentObj.reference,
           _MDPlistGetPlistObjectType() == 244)
       || (long long v7 = *(_OWORD *)&p_contentObj->containerBytes,
           $37FF168C8709F524D812460C59637AB1 reference = self->_contentObj.reference,
           _MDPlistGetPlistObjectType() == 245)))
    {
      contentDecoder = self->_contentDecoder;
      long long v7 = *(_OWORD *)&p_contentObj->containerBytes;
      $37FF168C8709F524D812460C59637AB1 reference = self->_contentObj.reference;
      id v3 = [(CSDecoder *)contentDecoder decodeObjectNoCopy:&v7];
    }
    else
    {
      id v3 = 0;
    }
  }

  return (NSString *)v3;
}

- (void)setDeletedWithRelatedUniqueIdentifier:(id)a3
{
}

- (NSNumber)deletedWithRelatedUniqueIdentifier
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_MDItemDeletedWithRelatedUniqueIdentifier"];
}

- (void)setTextSelected:(id)a3
{
}

- (NSString)textSelected
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemTextSelected"];
}

- (NSString)subtitle
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemSubtitle"];
}

- (void)setUserTags:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemUserTags"];
}

- (void)setAlbumPersistentID:(id)a3
{
}

- (NSString)albumPersistentID
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemAlbumPersistentID"];
}

- (void)setAdamID:(id)a3
{
}

- (NSString)adamID
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemAdamID"];
}

- (void)setExtendedContentRating:(id)a3
{
}

- (NSNumber)extendedContentRating
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemExtendedContentRating"];
}

- (void)setFileIdentifier:(id)a3
{
}

- (NSNumber)fileIdentifier
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemFileIdentifier"];
}

- (void)setParentFileIdentifier:(id)a3
{
}

- (NSNumber)parentFileIdentifier
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemParentFileIdentifier"];
}

- (void)setFilename:(id)a3
{
}

- (NSString)filename
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemFilename"];
}

- (void)setDocumentIdentifier:(id)a3
{
}

- (NSNumber)documentIdentifier
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemDocumentIdentifier"];
}

- (NSNumber)dataOwnerType
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemDataOwnerType"];
}

- (NSNumber)isExistingThread
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemIsExistingThread"];
}

- (NSNumber)isPartiallyDownloaded
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemIsPartiallyDownloaded"];
}

- (void)setQueryResultMatchedFields:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDQueryResultMatchedFields"];
}

- (NSArray)queryResultMatchedFields
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDQueryResultMatchedFields"];
}

- (void)setDisableSearchInSpotlight:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemDisableSearchInSpotlight" copy:0];
}

- (NSNumber)disableSearchInSpotlight
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemDisableSearchInSpotlight"];
}

- (NSNumber)contentCreationDateHour
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemContentCreationDateHour"];
}

- (NSNumber)contentCreationDateDay
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemContentCreationDateDay"];
}

- (NSNumber)contentCreationDateMonth
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemContentCreationDateMonth"];
}

- (NSNumber)contentCreationDateYear
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemContentCreationDateYear"];
}

- (NSNumber)contentCreationDateWeekday
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemContentCreationDateWeekday"];
}

- (NSNumber)contentCreationDateWeekdayOrdinal
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemContentCreationDateWeekdayOrdinal"];
}

- (NSNumber)contentCreationDateWeekOfMonth
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemContentCreationDateWeekOfMonth"];
}

- (NSNumber)contentCreationDateWeekOfYear
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemContentCreationDateWeekOfYear"];
}

- (NSNumber)contentModificationDateHour
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemContentModificationDateHour"];
}

- (NSNumber)contentModificationDateDay
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemContentModificationDateDay"];
}

- (NSNumber)contentModificationDateMonth
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemContentModificationDateMonth"];
}

- (NSNumber)contentModificationDateYear
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemContentModificationDateYear"];
}

- (NSNumber)contentModificationDateWeekday
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemContentModificationDateWeekday"];
}

- (NSNumber)contentModificationDateWeekdayOrdinal
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemContentModificationDateWeekdayOrdinal"];
}

- (NSNumber)contentModificationDateWeekOfMonth
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemContentModificationDateWeekOfMonth"];
}

- (NSNumber)contentModificationDateWeekOfYear
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemContentModificationDateWeekOfYear"];
}

- (void)setSummarizedIdentifiers:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"_kMDItemSummarizedIdentifiers"];
}

- (NSArray)summarizedIdentifiers
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemSummarizedIdentifiers"];
}

- (void)setIsNew:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"_kMDItemIsNew" copy:0];
}

- (NSNumber)isNew
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemIsNew"];
}

- (void)setIsTwoFactorCode:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"_kMDItemIsTwoFactorCode" copy:0];
}

- (NSNumber)isTwoFactorCode
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemIsTwoFactorCode"];
}

- (void)setIsFromMe:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"_kMDItemIsFromMe" copy:0];
}

- (NSNumber)isFromMe
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemIsFromMe"];
}

- (void)setIsGroupThread:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"_kMDItemIsGroupThread" copy:0];
}

- (NSNumber)isGroupThread
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemIsGroupThread"];
}

- (void)setRequiresMediaAnalysis:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"_kMDItemRequiresMediaAnalysis" copy:0];
}

- (NSNumber)requiresMediaAnalysis
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemRequiresMediaAnalysis"];
}

- (void)setMediaAnalysisComplete:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"_kMDItemMediaAnalysisComplete" copy:0];
}

- (NSNumber)mediaAnalysisComplete
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemMediaAnalysisComplete"];
}

- (void)setSummarizationContentTopLine:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = (id)v4;
  [(CSSearchableItemAttributeSet *)self _setDataValue:v4 forKey:@"_kMDItemSummarizationContentTopLine"];
}

- (NSAttributedString)summarizationContentTopLine
{
  uint64_t v2 = [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemSummarizationContentTopLine"];
  id v3 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v2 error:0];

  return (NSAttributedString *)v3;
}

- (void)setSummarizationContentSynopsis:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = (id)v4;
  [(CSSearchableItemAttributeSet *)self _setDataValue:v4 forKey:@"_kMDItemSummarizationContentSynopsis"];
}

- (NSAttributedString)summarizationContentSynopsis
{
  uint64_t v2 = [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemSummarizationContentSynopsis"];
  id v3 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v2 error:0];

  return (NSAttributedString *)v3;
}

- (void)setSummarizationContentTopic:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = (id)v4;
  [(CSSearchableItemAttributeSet *)self _setDataValue:v4 forKey:@"_kMDItemSummarizationContentTopic"];
}

- (NSAttributedString)summarizationContentTopic
{
  uint64_t v2 = [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemSummarizationContentTopic"];
  id v3 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v2 error:0];

  return (NSAttributedString *)v3;
}

- (void)setSummarizationStatus:(int)a3
{
  id v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  [(CSSearchableItemAttributeSet *)self _setNumberValue:v4 forKey:@"_kMDItemSummarizationStatus"];
}

- (int)summarizationStatus
{
  uint64_t v2 = [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemSummarizationStatus"];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setUrgencyStatus:(int)a3
{
  id v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  [(CSSearchableItemAttributeSet *)self _setNumberValue:v4 forKey:@"_kMDItemUrgencyStatus"];
}

- (int)urgencyStatus
{
  uint64_t v2 = [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemUrgencyStatus"];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setSmartRepliesResponse:(id)a3
{
  id v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
  [(CSSearchableItemAttributeSet *)self _setDataValue:v4 forKey:@"_kMDItemSmartRepliesResponse"];
}

- (CSSmartRepliesResponse)smartRepliesResponse
{
  uint64_t v2 = [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemSmartRepliesResponse"];
  int v3 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v2 error:0];

  return (CSSmartRepliesResponse *)v3;
}

- (void)setSmartRepliesStatus:(int)a3
{
  id v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  [(CSSearchableItemAttributeSet *)self _setNumberValue:v4 forKey:@"_kMDItemSmartRepliesStatus"];
}

- (int)smartRepliesStatus
{
  uint64_t v2 = [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemSmartRepliesStatus"];
  int v3 = [v2 intValue];

  return v3;
}

- (NSString)applicationName
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemApplicationName"];
}

- (NSString)contentSnippet
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemSnippet"];
}

- (void)setQueryResultRelevance:(id)a3
{
}

- (NSString)queryResultRelevance
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDQueryResultMenuRelevance"];
}

- (void)setRelatedAppBundleIdentifier:(id)a3
{
}

- (NSString)relatedAppBundleIdentifier
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemRelatedAppBundleIdentifier"];
}

- (void)setHashtags:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemHashtags"];
}

- (NSArray)hashtags
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemHashtags"];
}

- (void)setHasLPMedia:(id)a3
{
}

- (NSNumber)hasLPMedia
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemHasLPMedia"];
}

- (void)setLPMediaPaths:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemLPMediaPaths"];
}

- (NSArray)LPMediaPaths
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemLPMediaPaths"];
}

- (void)setGroupPhotoPath:(id)a3
{
}

- (NSString)groupPhotoPath
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemGroupPhotoPath"];
}

- (void)setSyndicationStatus:(id)a3
{
}

- (NSNumber)syndicationStatus
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"com_apple_mobilesms_isHighlightedContent"];
}

- (void)setSyndicatedContentServerDate:(id)a3
{
}

- (NSDate)syndicatedContentServerDate
{
  return (NSDate *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemSyndicatedContentServerDate"];
}

- (void)setRequiresImport:(id)a3
{
}

- (void)setImportSandboxExtension:(id)a3
{
  [(CSSearchableItemAttributeSet *)self _setStringValue:a3 forKey:@"_kMDItemImportSandboxExtension"];
  if (a3) {
    uint64_t v5 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v5 = 0;
  }

  [(CSSearchableItemAttributeSet *)self _setNumberValue:v5 forKey:@"_kMDItemImportHasSandboxExtension"];
}

- (NSString)importSandboxExtension
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemImportSandboxExtension"];
}

- (void)setVisualAssetPriority:(id)a3
{
}

- (NSNumber)visualAssetPriority
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemVisualAssetPriority"];
}

- (void)setDetectedEventTypes:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemDetectedEventTypes"];
}

- (NSArray)detectedEventTypes
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemDetectedEventTypes"];
}

- (void)setLinks:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemLinks"];
}

- (NSArray)links
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemLinks"];
}

- (void)setBirthday:(id)a3
{
}

- (NSDate)birthday
{
  return (NSDate *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemBirthday"];
}

- (void)setCostCode:(id)a3
{
}

- (NSString)costCode
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemCostCode"];
}

- (void)setCost:(id)a3
{
}

- (NSNumber)cost
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemCost"];
}

- (void)setStartDateTimeZone:(id)a3
{
}

- (NSString)startDateTimeZone
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemStartDateTimeZone"];
}

- (void)setEndDateTimeZone:(id)a3
{
}

- (NSString)endDateTimeZone
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEndDateTimeZone"];
}

- (void)setTimeIsUnknown:(id)a3
{
}

- (NSNumber)timeIsUnknown
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemTimeIsUnknown"];
}

- (void)setHomeAddresses:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemHomeAddresses"];
}

- (NSArray)homeAddresses
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemHomeAddresses"];
}

- (void)setWorkAddresses:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemWorkAddresses"];
}

- (NSArray)workAddresses
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemWorkAddresses"];
}

- (void)setRelationship:(id)a3
{
}

- (NSString)relationship
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemRelationship"];
}

- (void)setAddresses:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemAddresses"];
}

- (NSArray)addresses
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemAddresses"];
}

- (void)setAddressCategories:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemAddressCategories"];
}

- (NSArray)addressCategories
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemAddressCategories"];
}

- (void)setBusinessHours:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemBusinessHours"];
}

- (NSArray)businessHours
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemBusinessHours"];
}

- (void)setLinkName:(id)a3
{
}

- (NSString)linkName
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemLinkName"];
}

- (void)setLinkType:(id)a3
{
}

- (NSString)linkType
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemLinkType"];
}

- (void)setLinkSubType:(id)a3
{
}

- (NSString)linkSubType
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemLinkSubType"];
}

- (void)setCurator:(id)a3
{
}

- (NSString)curator
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemCurator"];
}

- (void)setEpisode:(id)a3
{
}

- (NSString)episode
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEpisode"];
}

- (void)setPodcastName:(id)a3
{
}

- (NSString)podcastName
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPodcastName"];
}

- (void)setUrlDescription:(id)a3
{
}

- (NSString)urlDescription
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemURLDescription"];
}

- (void)_standardizeProcessorAttributesForBundle:(id)a3 protectionClass:(id)a4 isUpdate:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2050000000;
  double v10 = (void *)getSKGAttributeProcessorClass_softClass;
  uint64_t v22 = getSKGAttributeProcessorClass_softClass;
  if (!getSKGAttributeProcessorClass_softClass)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __getSKGAttributeProcessorClass_block_invoke;
    v18[3] = &unk_1E5548E88;
    v18[4] = &v19;
    __getSKGAttributeProcessorClass_block_invoke((uint64_t)v18);
    double v10 = (void *)v20[3];
  }
  id v11 = v10;
  _Block_object_dispose(&v19, 8);
  if (v11)
  {
    uint64_t v12 = [v11 sharedProcessor];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      uint64_t v14 = [v11 sharedProcessor];
      double v15 = [(CSSearchableItemAttributeSet *)self attributes];
      double v16 = [v14 processorAttributesForRecord:v15 bundleID:v8 protectionClass:v9 isUpdate:v5];

      if ([v16 count])
      {
        id v17 = [(CSSearchableItemAttributeSet *)self mutableAttributes];
        [v17 addEntriesFromDictionary:v16];
      }
    }
  }
}

CSDateTag *__67__CSSearchableItemAttributeSet_CSPrivateAttributes__extractedDates__block_invoke(double a1, uint64_t a2, uint64_t a3, void *a4)
{
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  [a4 doubleValue];
  CFDateRef v7 = CFDateCreate(v5, v6);
  if (v7)
  {
    CFDateRef v8 = v7;
    id v9 = [[CSDateTag alloc] initWithDate:v7 confidence:a1];
    CFRelease(v8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)setExtractedDates:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemExtractedDates"];
}

- (NSArray)extractedLocations
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNumericAnalysisTagsForPrimaryAttribute:@"kMDItemExtractedLocations" analysisAttributes:&unk_1EDBD6160 getTagBlock:&__block_literal_global_806];
}

CSLocationTag *__71__CSSearchableItemAttributeSet_CSPrivateAttributes__extractedLocations__block_invoke(double a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [[CSLocationTag alloc] initWithPrimaryValue:v8 components:v7 confidence:a1];

  return v9;
}

- (void)setExtractedLocations:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemExtractedLocations"];
}

CSCurrencyTag *__72__CSSearchableItemAttributeSet_CSPrivateAttributes__extractedCurrencies__block_invoke(int a1, int a2, CSCurrencyTag *a3, double a4, void *a5)
{
  CFAllocatorRef v5 = a3;
  if (a3)
  {
    id v7 = a5;
    id v8 = v5;
    CFAllocatorRef v5 = [(CSNumericAnalysisTag *)[CSCurrencyTag alloc] initWithPrimaryValue:v8 components:v7 confidence:a4];
  }

  return v5;
}

- (void)setExtractedCurrencies:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemExtractedCurrencies"];
}

- (void)setEventMessageIdentifier:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventMessageIdentifier" copy:1];
}

- (NSString)eventMessageIdentifier
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventMessageIdentifier"];
}

- (void)setEventGroupIdentifier:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventGroupIdentifier" copy:1];
}

- (NSString)eventGroupIdentifier
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventGroupIdentifier"];
}

- (void)setEventFallbackGroupIdentifier:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventFallbackGroupIdentifier" copy:1];
}

- (NSString)eventFallbackGroupIdentifier
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventFallbackGroupIdentifier"];
}

- (void)setEventMegadomeIdentifier:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventMegadomeIdentifier" copy:1];
}

- (NSString)eventMegadomeIdentifier
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventMegadomeIdentifier"];
}

- (void)setEventType:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventType" copy:1];
}

- (NSString)eventType
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventType"];
}

- (void)setEventSubType:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventSubType" copy:1];
}

- (NSString)eventSubType
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventSubType"];
}

- (void)setEventMetadata:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventMetadata" copy:1];
}

- (NSString)eventMetadata
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventMetadata"];
}

- (void)setEventSourceMetadata:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventSourceMetadata" copy:1];
}

- (NSString)eventSourceMetadata
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventSourceMetadata"];
}

- (void)setEventSourceBundleIdentifier:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventSourceBundleIdentifier" copy:1];
}

- (NSString)eventSourceBundleIdentifier
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventSourceBundleIdentifier"];
}

- (void)setEventIsAllDay:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventIsAllDay" copy:0];
}

- (NSNumber)eventIsAllDay
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventIsAllDay"];
}

- (void)setEventSourceIsForwarded:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventSourceIsForwarded" copy:0];
}

- (NSNumber)eventSourceIsForwarded
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventSourceIsForwarded"];
}

- (void)setSerialNumber:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"_kMDItemSerialNumber" copy:0];
}

- (id)serialNumber
{
  return [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemSerialNumber"];
}

- (void)setIndexIdentifier:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"_kMDItemIndexIdentifier" copy:1];
}

- (id)indexIdentifier
{
  return [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemIndexIdentifier"];
}

- (void)setMediaAnalysisTimeRangeData:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemMediaAnalysTimeRangeData" copy:0];
}

- (NSData)mediaAnalysisTimeRangeData
{
  return (NSData *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemMediaAnalysTimeRangeData"];
}

- (void)setPrimaryAccountNumberSuffix:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemPrimaryAccountNumberSuffix" copy:1];
}

- (NSString)primaryAccountNumberSuffix
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPrimaryAccountNumberSuffix"];
}

- (void)setCardNumberActionURL:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemCardNumberActionURL" copy:0];
}

- (NSURL)cardNumberActionURL
{
  uint64_t v2 = [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemCardNumberActionURL"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
LABEL_5:
    id v4 = v3;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
    goto LABEL_5;
  }
  id v4 = 0;
LABEL_7:

  return (NSURL *)v4;
}

- (void)setPayBalanceActionURL:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemPayBalanceActionURL" copy:0];
}

- (NSURL)payBalanceActionURL
{
  uint64_t v2 = [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPayBalanceActionURL"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
LABEL_5:
    id v4 = v3;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
    goto LABEL_5;
  }
  id v4 = 0;
LABEL_7:

  return (NSURL *)v4;
}

- (void)setCardDetailsActionURL:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemCardDetailsActionURL" copy:0];
}

- (NSURL)cardDetailsActionURL
{
  uint64_t v2 = [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemCardDetailsActionURL"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
LABEL_5:
    id v4 = v3;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
    goto LABEL_5;
  }
  id v4 = 0;
LABEL_7:

  return (NSURL *)v4;
}

- (void)setAttachmentCaptions:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemAttachmentCaptions"];
}

- (id)attachmentCaptions
{
  return [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemAttachmentCaptions"];
}

- (id)attachmentNames
{
  return [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemAttachmentNames"];
}

- (id)attachmentTypes
{
  return [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemAttachmentTypes"];
}

- (void)setMailAttachmentNames:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"com_apple_mail_attachmentNames"];
}

- (NSArray)mailAttachmentNames
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"com_apple_mail_attachmentNames"];
}

- (NSArray)mailAttachmentTypes
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"com_apple_mail_attachmentTypes"];
}

- (void)setMailAttachmentKinds:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"com_apple_mail_attachmentKinds"];
}

- (NSArray)mailAttachmentKinds
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"com_apple_mail_attachmentKinds"];
}

- (NSDate)mailDateReceived
{
  return (NSDate *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"com_apple_mail_dateReceived"];
}

- (void)setMailDateLastViewed:(id)a3
{
}

- (NSDate)mailDateLastViewed
{
  return (NSDate *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"com_apple_mail_dateLastViewed"];
}

- (NSNumber)mailFlagged
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"com_apple_mail_flagged"];
}

- (void)setMailFlagColor:(id)a3
{
}

- (NSNumber)mailFlagColor
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"com_apple_mail_flagColor"];
}

- (NSNumber)mailRead
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"com_apple_mail_read"];
}

- (NSNumber)mailRepliedTo
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"com_apple_mail_repliedTo"];
}

- (void)setMailPriority:(id)a3
{
}

- (NSNumber)mailPriority
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"com_apple_mail_priority"];
}

- (NSArray)mailGMailLabels
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"com_apple_mail_gmailLabels"];
}

- (void)setMailMessageHeader:(id)a3
{
}

- (NSString)mailMessageHeader
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"com_apple_mail_message_id_header"];
}

- (void)setMailCategory:(id)a3
{
}

- (NSString)mailCategory
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEmailCategory"];
}

- (NSString)mailConversationID
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEmailConversationID"];
}

- (void)setMailUseCount:(id)a3
{
}

- (NSNumber)mailUseCount
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemUseCount"];
}

- (void)setMailResultScoreL1:(id)a3
{
}

- (NSNumber)mailResultScoreL1
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDQueryResultScoreL1"];
}

- (void)setMailResultScoreL2:(id)a3
{
}

- (NSNumber)mailResultScoreL2
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDQueryResultScoreL2"];
}

- (void)setMailUsedDates:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemUsedDates"];
}

- (NSArray)mailUsedDates
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemUsedDates"];
}

- (void)setMailVIP:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"_kMDItemMailVIP" copy:0];
}

- (NSNumber)mailVIP
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemMailVIP"];
}

- (void)setMailCategoryType:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"_kMDItemMailCategoryType" copy:0];
}

- (int64_t)mailCategoryType
{
  uint64_t v2 = [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemMailCategoryType"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (int)mailCategories
{
  uint64_t v2 = [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemMailCategories"];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setIsUrgent:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"_kMDItemIsUrgent" copy:0];
}

- (NSNumber)isUrgent
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemIsUrgent"];
}

- (void)setEmailAutoReplied:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (v4 && [v4 BOOLValue])
  {
    [(CSSearchableItemAttributeSet *)self setAttribute:MEMORY[0x1E4F1CC38] forKey:@"kMDMailMessageAutoReplied"];
  }
  else
  {
    CFAllocatorRef v5 = [(CSSearchableItemAttributeSet *)self mutableAttributes];
    [v5 removeObjectForKey:@"kMDMailMessageAutoReplied"];
  }
}

- (NSNumber)emailAutoReplied
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self attributeForKey:@"kMDMailMessageAutoReplied"];
}

- (void)setEmailHasDistributionListInTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (v4 && [v4 BOOLValue])
  {
    [(CSSearchableItemAttributeSet *)self setAttribute:MEMORY[0x1E4F1CC38] forKey:@"kMDMailMessageHasDistributionListInTo"];
  }
  else
  {
    CFAllocatorRef v5 = [(CSSearchableItemAttributeSet *)self mutableAttributes];
    [v5 removeObjectForKey:@"kMDMailMessageHasDistributionListInTo"];
  }
}

- (NSNumber)emailHasDistributionListInTo
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self attributeForKey:@"kMDMailMessageHasDistributionListInTo"];
}

- (void)setEmailHasDistributionListInCC:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (v4 && [v4 BOOLValue])
  {
    [(CSSearchableItemAttributeSet *)self setAttribute:MEMORY[0x1E4F1CC38] forKey:@"kMDMailMessageHasDistributionListInCC"];
  }
  else
  {
    CFAllocatorRef v5 = [(CSSearchableItemAttributeSet *)self mutableAttributes];
    [v5 removeObjectForKey:@"kMDMailMessageHasDistributionListInCC"];
  }
}

- (NSNumber)emailHasDistributionListInCC
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self attributeForKey:@"kMDMailMessageHasDistributionListInCC"];
}

- (void)setReaderView:(id)a3
{
}

- (NSNumber)isReaderView
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemIsReaderView"];
}

- (void)setTextContentDataSource:(id)a3
{
}

- (NSString)textContentDataSource
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemTextContentDataSource"];
}

- (NSArray)autocompleteTriggers
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemAutocompleteTriggers"];
}

- (void)setAutocompleteTriggers:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"_kMDItemAutocompleteTriggers"];
}

- (void)setTabStatus:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemTabStatus" copy:0];
}

- (NSNumber)tabStatus
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemTabStatus"];
}

- (void)setFileProviderID:(id)a3
{
}

- (void)setFileItemID:(id)a3
{
}

- (NSString)fileItemID
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemFileItemID"];
}

- (void)setFPFilename:(id)a3
{
}

- (NSString)parentFileItemID
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemParentFileItemID"];
}

- (void)setParentFileItemID:(id)a3
{
}

- (void)setOwnerName:(id)a3
{
}

- (void)setOwnerIdentifier:(id)a3
{
}

- (NSString)ownerIdentifier
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemOwnerIdentifier"];
}

- (void)setLastEditorName:(id)a3
{
}

- (void)setLastEditorIdentifier:(id)a3
{
}

- (NSString)lastEditorIdentifier
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemOwnerIdentifier"];
}

- (void)setFileProviderDomainIdentifier:(id)a3
{
}

- (void)setFileProviderUserInfoKeys:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"FPUserInfoKeys"];
}

- (NSArray)fileProviderUserInfoKeys
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"FPUserInfoKeys"];
}

- (void)setFileProviderUserInfoValues:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"FPUserInfoValues"];
}

- (NSArray)fileProviderUserInfoValues
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"FPUserInfoValues"];
}

- (void)setFileProviderOnDiskIdentifier:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"FPOnDiskIdentifier" copy:0];
}

- (NSNumber)fileProviderOnDiskIdentifier
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"FPOnDiskIdentifier"];
}

- (void)setTrashed:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemIsTrashed" copy:0];
}

- (void)setShared:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemIsShared" copy:0];
}

- (void)setPinned:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"FPItemIsPinned" copy:0];
}

- (NSNumber)isPinned
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"FPItemIsPinned"];
}

- (void)setUploaded:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemIsUploaded" copy:0];
}

- (void)setUploading:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemIsUploading" copy:0];
}

- (void)setDownloading:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemIsDownloading" copy:0];
}

- (void)setUploadError:(id)a3
{
}

- (NSNumber)uploadError
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemUploadError"];
}

- (void)setDownloadError:(id)a3
{
}

- (NSNumber)downloadError
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemDownloadError"];
}

- (void)setExtraData:(id)a3
{
}

- (NSData)extraData
{
  return (NSData *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemExtraData"];
}

- (void)setFavoriteRank:(id)a3
{
}

- (void)setSubItemCount:(id)a3
{
}

- (void)setSharedItemCurrentUserRole:(id)a3
{
}

- (NSString)sharedItemCurrentUserRole
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemSharedItemCurrentUserRole"];
}

- (void)setDownloadingStatus:(id)a3
{
}

- (NSString)downloadingStatus
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemDownloadingStatus"];
}

- (void)setVersionIdentifier:(id)a3
{
}

- (NSString)versionIdentifier
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemVersionIdentifier"];
}

- (id)userSharedSentSender
{
  return [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemUserSharedSentSender"];
}

- (id)userSharedSentSenderHandle
{
  return [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemUserSharedSentSenderHandle"];
}

- (id)userSharedSentRecipient
{
  return [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemUserSharedSentRecipient"];
}

- (id)userSharedSentRecipientHandle
{
  return [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemUserSharedSentRecipientHandle"];
}

- (id)userSharedSentTransport
{
  return [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemUserSharedSentTransport"];
}

- (id)userSharedReceivedSender
{
  return [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemUserSharedReceivedSender"];
}

- (id)userSharedReceivedSenderHandle
{
  return [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemUserSharedReceivedSenderHandle"];
}

- (id)userSharedReceivedRecipient
{
  return [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemUserSharedReceivedRecipient"];
}

- (id)userSharedReceivedRecipientHandle
{
  return [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemUserSharedReceivedRecipientHandle"];
}

- (id)userSharedReceivedTransport
{
  return [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemUserSharedReceivedTransport"];
}

- (id)userPrintedUserHandle
{
  return [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemUserPrintedUserHandle"];
}

- (id)userDownloadedUserHandle
{
  return [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemUserDownloadedUserHandle"];
}

- (id)userModifiedUserHandle
{
  return [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemUserModifiedUserHandle"];
}

- (id)userCreatedUserHandle
{
  return [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemUserCreatedUserHandle"];
}

- (void)_markAs:(int)a3 date:(id)a4 sender:(id)a5 senderHandle:(id)a6 recipients:(id)a7 recipientHandles:(id)a8 transport:(id)a9
{
  v88[1] = *MEMORY[0x1E4F143B8];
  id v15 = a4;
  double v16 = (__CFString *)a5;
  unint64_t v17 = (unint64_t)a6;
  id v18 = a7;
  id v19 = a8;
  uint64_t v20 = (__CFString *)a9;
  if (v15)
  {
    if (!((unint64_t)v16 | v17))
    {
      unint64_t v17 = 0;
      double v16 = 0;
      goto LABEL_47;
    }
    uint64_t v21 = [v18 count];
    uint64_t v22 = [v19 count];
    if (!v21 || !v22 || v21 == v22)
    {
      v74 = self;
      *(void *)&long long v81 = v21;
      *((void *)&v81 + 1) = v22;
      if (a3)
      {
        if (a3 != 1) {
          goto LABEL_47;
        }
        v82 = v20;
        v77 = v19;
        v79 = MDItemUserSharedReceivedRecipientHandle;
        long long v23 = MDItemUserSharedReceivedRecipient;
        uint64_t v24 = MDItemUserSharedReceivedTransport;
        uint64_t v25 = MDItemUserSharedReceivedSenderHandle;
        uint64_t v26 = MDItemUserSharedReceivedSender;
        uint64_t v27 = MDItemUserSharedReceivedDate;
      }
      else
      {
        v82 = v20;
        v77 = v19;
        v79 = MDItemUserSharedSentRecipientHandle;
        long long v23 = MDItemUserSharedSentRecipient;
        uint64_t v24 = MDItemUserSharedSentTransport;
        uint64_t v25 = MDItemUserSharedSentSenderHandle;
        uint64_t v26 = MDItemUserSharedSentSender;
        uint64_t v27 = MDItemUserSharedSentDate;
      }
      long long v28 = *v27;
      id v29 = *v26;
      v75 = *v25;
      v73 = *v24;
      uint64_t v30 = *v23;
      uint64_t v31 = *v79;
      if (!v16) {
        double v16 = &stru_1EDBB3A50;
      }
      if (!v17) {
        unint64_t v17 = (unint64_t)&stru_1EDBB3A50;
      }
      v80 = (__CFString *)v17;
      uint64_t v20 = v82;
      if (!v82) {
        uint64_t v20 = &stru_1EDBB3A50;
      }
      v72 = v28;
      v66 = [(CSSearchableItemAttributeSet *)v74 _getNonNullValueForKey:v28];
      uint64_t v32 = [v66 count];
      v67 = v29;
      v63 = v31;
      v64 = v30;
      if (v32)
      {
        uint64_t v33 = [(CSSearchableItemAttributeSet *)v74 _getNonNullValueForKey:v29];
        v71 = [(CSSearchableItemAttributeSet *)v74 _getNonNullValueForKey:v75];
        v70 = [(CSSearchableItemAttributeSet *)v74 _getNonNullValueForKey:v73];
        v69 = [(CSSearchableItemAttributeSet *)v74 _getNonNullValueForKey:v30];
        v68 = [(CSSearchableItemAttributeSet *)v74 _getNonNullValueForKey:v31];
        v65 = v33;
        uint64_t v34 = v29;
        if (v32 != [v33 count]
          || v32 != [v71 count]
          || v32 != [v70 count]
          || v32 != [v69 count]
          || v32 != [v68 count])
        {
          uint64_t v32 = 0;
        }
      }
      else
      {
        v65 = 0;
        v70 = 0;
        v71 = 0;
        v68 = 0;
        v69 = 0;
        uint64_t v34 = v29;
      }
      uint64_t v35 = v73;
      if (v81 == 0)
      {
        if (v32)
        {
          uint64_t v43 = [v66 arrayByAddingObject:v15];
          [(CSSearchableItemAttributeSet *)v74 _setArrayValue:v43 withItemClass:objc_opt_class() forKey:v72];

          uint64_t v44 = [v65 arrayByAddingObject:v16];
          [(CSSearchableItemAttributeSet *)v74 _setArrayValue:v44 withItemClass:objc_opt_class() forKey:v34];

          long long v45 = [v71 arrayByAddingObject:v16];
          [(CSSearchableItemAttributeSet *)v74 _setArrayValue:v45 withItemClass:objc_opt_class() forKey:v75];

          long long v46 = [v70 arrayByAddingObject:v16];
          [(CSSearchableItemAttributeSet *)v74 _setArrayValue:v46 withItemClass:objc_opt_class() forKey:v73];

          long long v47 = [v69 arrayByAddingObject:v16];
          long long v48 = v64;
          [(CSSearchableItemAttributeSet *)v74 _setArrayValue:v47 withItemClass:objc_opt_class() forKey:v64];

          long long v49 = [v68 arrayByAddingObject:v16];
          long long v50 = v63;
          [(CSSearchableItemAttributeSet *)v74 _setArrayValue:v49 withItemClass:objc_opt_class() forKey:v63];
        }
        else
        {
          v88[0] = v15;
          v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:1];
          [(CSSearchableItemAttributeSet *)v74 _setArrayValue:v57 withItemClass:objc_opt_class() forKey:v72];

          v87 = v16;
          v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v87 count:1];
          [(CSSearchableItemAttributeSet *)v74 _setArrayValue:v58 withItemClass:objc_opt_class() forKey:v34];

          unint64_t v86 = v17;
          v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v86 count:1];
          [(CSSearchableItemAttributeSet *)v74 _setArrayValue:v59 withItemClass:objc_opt_class() forKey:v75];

          v85 = v20;
          uint64_t v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v85 count:1];
          [(CSSearchableItemAttributeSet *)v74 _setArrayValue:v60 withItemClass:objc_opt_class() forKey:v73];

          long long v48 = v64;
          [(CSSearchableItemAttributeSet *)v74 _setArrayValue:&unk_1EDBD6190 withItemClass:objc_opt_class() forKey:v64];
          v84 = v16;
          v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v84 count:1];
          uint64_t v35 = v73;
          long long v50 = v63;
          [(CSSearchableItemAttributeSet *)v74 _setArrayValue:v61 withItemClass:objc_opt_class() forKey:v63];
        }
        long long v51 = v65;
      }
      else
      {
        v78 = v16;
        v83 = v20;
        v76 = v18;
        if ((void)v81) {
          uint64_t v36 = v81;
        }
        else {
          uint64_t v36 = *((void *)&v81 + 1);
        }
        if (v32)
        {
          id v37 = (void *)[v66 mutableCopy];
          uint64_t v38 = (void *)[v65 mutableCopy];
          uint64_t v39 = (void *)[v71 mutableCopy];
          uint64_t v40 = (void *)[v70 mutableCopy];
          uint64_t v41 = (void *)[v69 mutableCopy];
          uint64_t v42 = [v68 mutableCopy];
        }
        else
        {
          id v37 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v36];
          uint64_t v38 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v36];
          uint64_t v39 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v36];
          uint64_t v40 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v36];
          uint64_t v41 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v36];
          uint64_t v42 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v36];
        }
        long long v52 = (void *)v42;
        if (v36)
        {
          for (uint64_t i = 0; i != v36; ++i)
          {
            id v54 = v15;
            [v37 addObject:v15];
            [v38 addObject:v78];
            [v39 addObject:v80];
            [v40 addObject:v83];
            if ((void)v81)
            {
              long long v55 = [v76 objectAtIndexedSubscript:i];
              [v41 addObject:v55];
            }
            else
            {
              [v41 addObject:&stru_1EDBB3A50];
            }
            if (*((void *)&v81 + 1))
            {
              long long v56 = [v77 objectAtIndexedSubscript:i];
              [v52 addObject:v56];
            }
            else
            {
              [v52 addObject:&stru_1EDBB3A50];
            }
            id v15 = v54;
          }
        }
        v62 = v37;
        [(CSSearchableItemAttributeSet *)v74 _setArrayValue:v37 withItemClass:objc_opt_class() forKey:v72];
        [(CSSearchableItemAttributeSet *)v74 _setArrayValue:v38 withItemClass:objc_opt_class() forKey:v67];
        [(CSSearchableItemAttributeSet *)v74 _setArrayValue:v39 withItemClass:objc_opt_class() forKey:v75];
        [(CSSearchableItemAttributeSet *)v74 _setArrayValue:v40 withItemClass:objc_opt_class() forKey:v73];
        long long v48 = v64;
        [(CSSearchableItemAttributeSet *)v74 _setArrayValue:v41 withItemClass:objc_opt_class() forKey:v64];
        long long v50 = v63;
        [(CSSearchableItemAttributeSet *)v74 _setArrayValue:v52 withItemClass:objc_opt_class() forKey:v63];

        uint64_t v35 = v73;
        uint64_t v34 = v67;

        id v18 = v76;
        uint64_t v20 = v83;
        long long v51 = v65;
        double v16 = v78;
        unint64_t v17 = (unint64_t)v80;
      }

      id v19 = v77;
    }
  }
LABEL_47:
}

- (void)markAsSent:(id)a3 sender:(id)a4 senderHandle:(id)a5 recipients:(id)a6 recipientHandles:(id)a7 transport:(id)a8
{
}

- (void)markAsReceived:(id)a3 sender:(id)a4 senderHandle:(id)a5 recipients:(id)a6 recipientHandles:(id)a7 transport:(id)a8
{
}

- (void)_markAs:(id)a3 userHandle:(id)a4 dateKey:(id)a5 userHandleKey:(id)a6
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = (__CFString *)a4;
  id v12 = a5;
  id v13 = a6;
  if (v10)
  {
    if (!v11) {
      id v11 = &stru_1EDBB3A50;
    }
    uint64_t v14 = [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:v12];
    uint64_t v15 = [v14 count];
    if (v15)
    {
      uint64_t v16 = v15;
      unint64_t v17 = [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:v13];
      if (v16 == [v17 count])
      {
        id v18 = [v14 arrayByAddingObject:v10];
        [(CSSearchableItemAttributeSet *)self _setArrayValue:v18 withItemClass:objc_opt_class() forKey:v12];

        uint64_t v19 = [v17 arrayByAddingObject:v11];
LABEL_9:
        uint64_t v21 = (void *)v19;
        [(CSSearchableItemAttributeSet *)self _setArrayValue:v19 withItemClass:objc_opt_class() forKey:v13];

        goto LABEL_10;
      }
    }
    else
    {
      unint64_t v17 = 0;
    }
    v23[0] = v10;
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    [(CSSearchableItemAttributeSet *)self _setArrayValue:v20 withItemClass:objc_opt_class() forKey:v12];

    uint64_t v22 = v11;
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
    goto LABEL_9;
  }
LABEL_10:
}

- (void)markAsPrinted:(id)a3 userHandle:(id)a4
{
}

- (void)markAsDownloaded:(id)a3 userHandle:(id)a4
{
}

- (void)markAsModified:(id)a3 userHandle:(id)a4
{
}

- (void)markAsCreated:(id)a3 userHandle:(id)a4
{
}

- (void)setIntentData:(id)a3
{
}

- (NSData)intentData
{
  return (NSData *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemIntentData"];
}

- (void)setSuggestedInvocationPhrase:(id)a3
{
}

- (NSString)suggestedInvocationPhrase
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemSuggestedInvocationPhrase"];
}

- (NSNumber)backgroundRunnable
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_MDItemBackgroundRunnable"];
}

- (void)setBackgroundRunnable:(id)a3
{
}

- (void)setPunchoutLabel:(id)a3
{
}

- (NSString)punchoutLabel
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_MDItemPunchoutLabel"];
}

- (NSNumber)shortcutAvailability
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemShortcutAvailability"];
}

- (NSDate)lastApplicationLaunchedDate
{
  return (NSDate *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemApplicationLastLaunchedDate"];
}

- (void)setLastApplicationLaunchedDate:(id)a3
{
}

- (NSNumber)isPlaceholder
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemIsPlaceholder"];
}

- (void)setIsPlaceholder:(id)a3
{
}

- (NSArray)topic
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemTopic"];
}

- (void)setTopic:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemTopic"];
}

- (NSNumber)portraitStaticScore
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemPortraitStaticScore"];
}

- (void)setPortraitStaticScore:(id)a3
{
}

- (NSData)portraitFeatureVector
{
  return (NSData *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemPortraitFeatureVector"];
}

- (void)setPortraitFeatureVector:(id)a3
{
}

- (NSNumber)portraitFeatureVectorVersion
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemPortraitFeatureVectorVersion"];
}

- (void)setPortraitFeatureVectorVersion:(id)a3
{
}

- (void)setPortraitNamedEntities:(id)a3
{
  id v5 = a3;
  uint64_t v4 = objc_opt_class();
  [(CSSearchableItemAttributeSet *)self _setDictionaryValue:v5 withValueClass:v4 keyClass:objc_opt_class() forKey:@"_kMDItemPortraitNamedEntities"];
}

- (void)setPhoneCallStatus:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"com_apple_mobilephone_callStatus" copy:1];
}

- (NSString)phoneCallStatus
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"com_apple_mobilephone_callStatus"];
}

- (void)setPhoneProvider:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"com_apple_mobilephone_provider" copy:1];
}

- (NSString)phoneProvider
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"com_apple_mobilephone_provider"];
}

- (void)setPhoneSIM:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"com_apple_mobilephone_SIM" copy:1];
}

- (NSString)phoneSIM
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"com_apple_mobilephone_SIM"];
}

- (void)setPhoneCallType:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"com_apple_mobilephone_callType" copy:1];
}

- (NSString)phoneCallType
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"com_apple_mobilephone_callType"];
}

- (void)setPhoneCallBackURL:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"com_apple_mobilephone_callbackURL" copy:0];
}

- (NSURL)phoneCallBackURL
{
  uint64_t v2 = [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"com_apple_mobilephone_callbackURL"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
LABEL_5:
    id v4 = v3;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
    goto LABEL_5;
  }
  id v4 = 0;
LABEL_7:

  return (NSURL *)v4;
}

- (void)setPhotosResultType:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemPhotosResultType" copy:1];
}

- (NSString)photosResultType
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosResultType"];
}

- (void)setPhotosCollectionSubtitle:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemPhotosCollectionSubtitle" copy:1];
}

- (NSString)photosCollectionSubtitle
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosCollectionSubtitle"];
}

- (void)setPhotosCollectionResultCount:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemPhotosCollectionResultCount" copy:0];
}

- (NSNumber)photosCollectionResultCount
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosCollectionResultCount"];
}

- (void)setPhotosCollectionKeyAssetUUID:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemPhotosCollectionKeyAssetUUID" copy:1];
}

- (NSString)photosCollectionKeyAssetUUID
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosCollectionKeyAssetUUID"];
}

- (void)setPhotosFavorited:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemPhotosFavorited" copy:0];
}

- (NSNumber)photosFavorited
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosFavorited"];
}

- (void)setPhotosFavorites:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemPhotosFavorites" copy:1];
}

- (NSString)photosFavorites
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosFavorites"];
}

- (void)setPhotosMemoryTitle:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemPhotosMemoryTitle" copy:1];
}

- (NSString)photosMemoryTitle
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosMemoryTitle"];
}

- (void)setPhotosBusinessNames:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemPhotosBusinessNames"];
}

- (NSArray)photosBusinessNames
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosBusinessNames"];
}

- (void)setPhotosBusinessCategories:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemPhotosBusinessCategories"];
}

- (NSArray)photosBusinessCategories
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosBusinessCategories"];
}

- (void)setPhotosMediaTypes:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemPhotosMediaTypes"];
}

- (NSArray)photosMediaTypes
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosMediaTypes"];
}

- (void)setPhotosLocationKeywords:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemPhotosLocationKeywords"];
}

- (NSArray)photosLocationKeywords
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosLocationKeywords"];
}

- (void)setPhotosPeople:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemPhotosPeople"];
}

- (void)setPhotosEventNames:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemPhotosEventNames"];
}

- (NSArray)photosEventNames
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosEventNames"];
}

- (void)setPhotosSeasons:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemPhotosSeasons"];
}

- (NSArray)photosSeasons
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosSeasons"];
}

- (void)setPhotosHolidays:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemPhotosHolidays"];
}

- (NSArray)photosHolidays
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosHolidays"];
}

- (void)setPhotosSceneIdentifiers:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemPhotosSceneIdentifiers"];
}

- (NSArray)photosSceneIdentifiers
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosSceneIdentifiers"];
}

- (void)setPhotosScenes:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemPhotosScenes"];
}

- (NSArray)photosScenes
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosScenes"];
}

- (void)setPhotosMeanings:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemPhotosMeanings"];
}

- (NSArray)photosMeanings
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosMeanings"];
}

- (void)setPhotosEventCategories:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemPhotosEventCategories"];
}

- (NSArray)photosEventCategories
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosEventCategories"];
}

- (void)setPhotosEventPerformers:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemPhotosEventPerformers"];
}

- (NSArray)photosEventPerformers
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosEventPerformers"];
}

- (void)setPhotosEntityTitle:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemPhotosEntityTitle" copy:1];
}

- (NSString)photosEntityTitle
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosEntityTitle"];
}

- (void)setPhotosSavedFromAppBundleIdentifier:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemPhotosSavedFromAppBundleIdentifier" copy:1];
}

- (NSString)photosSavedFromAppBundleIdentifier
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosSavedFromAppBundleIdentifier"];
}

- (void)setPhotosSavedFromAppName:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemPhotosSavedFromAppName" copy:1];
}

- (NSString)photosSavedFromAppName
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosSavedFromAppName"];
}

- (void)setPhotosDonationTimestamp:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemPhotosDonationTimestamp" copy:0];
}

- (NSDate)photosDonationTimestamp
{
  return (NSDate *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosDonationTimestamp"];
}

- (void)setPhotosSharedLibraryContributors:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemPhotosSharedLibraryContributors"];
}

- (void)setPhotosUtilityTypes:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemPhotosUtilityTypes"];
}

- (NSArray)photosUtilityTypes
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosUtilityTypes"];
}

- (void)setPhotosL2Signals:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"_kMDItemPhotosL2Signals" copy:0];
}

- (NSData)photosL2Signals
{
  return (NSData *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemPhotosL2Signals"];
}

- (void)setPhotosPartsOfDay:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemPhotosPartsOfDay"];
}

- (NSArray)photosPartsOfDay
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosPartsOfDay"];
}

- (void)setPhotosPartsOfWeek:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemPhotosPartsOfWeek"];
}

- (NSArray)photosPartsOfWeek
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosPartsOfWeek"];
}

- (void)setPhotosImageEmbeddingVersion:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemPhotosImageEmbeddingVersion" copy:0];
}

- (NSNumber)photosImageEmbeddingVersion
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosImageEmbeddingVersion"];
}

- (void)setPhotosVideoEmbeddingVersion:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemPhotosVideoEmbeddingVersion" copy:0];
}

- (NSNumber)photosVideoEmbeddingVersion
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosVideoEmbeddingVersion"];
}

- (void)setPhotosContentAddedDate:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemPhotosContentAddedDate" copy:0];
}

- (NSDate)photosContentAddedDate
{
  return (NSDate *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosContentAddedDate"];
}

CSSceneClassification *__76__CSSearchableItemAttributeSet_CSPhotos_Private__photosSceneClassifications__block_invoke(uint64_t a1, unint64_t a2, void *a3, void *a4, double a5)
{
  id v9 = a3;
  id v10 = a4;
  if (*(void *)(a1 + 80) <= a2)
  {
    uint64_t v12 = 0;
  }
  else
  {
    id v11 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v12 = [v11 unsignedLongValue];
    }
    else {
      uint64_t v12 = 0;
    }
  }
  if (*(void *)(a1 + 88) <= a2)
  {
    unsigned int v14 = 0;
  }
  else
  {
    id v13 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unsigned int v14 = [v13 unsignedShortValue];
    }
    else {
      unsigned int v14 = 0;
    }
  }
  if (*(void *)(a1 + 96) <= a2)
  {
    unsigned int v16 = 0;
  }
  else
  {
    uint64_t v15 = [*(id *)(a1 + 48) objectAtIndexedSubscript:a2];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unsigned int v16 = [v15 unsignedShortValue];
    }
    else {
      unsigned int v16 = 0;
    }
  }
  float v17 = 0.0;
  if (*(void *)(a1 + 104) > a2)
  {
    id v18 = [*(id *)(a1 + 56) objectAtIndexedSubscript:a2];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v18 floatValue];
      float v17 = v19;
    }
  }
  uint64_t v20 = [[CSSceneClassification alloc] initWithLabel:v9 synonyms:v10 confidence:v12 sceneIdentifier:a5];
  if (*(void *)(a1 + 112))
  {
    uint64_t v22 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v23 = *(void *)(v22 + 24);
    *(void *)(v22 + 24) = v23 + 4;
    if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) <= *(void *)(a1 + 112))
    {
      uint64_t v24 = [*(id *)(a1 + 64) objectAtIndexedSubscript:v23];
      objc_opt_class();
      double v25 = 0.0;
      double v26 = 0.0;
      if (objc_opt_isKindOfClass())
      {
        [v24 doubleValue];
        double v26 = v27;
      }
      uint64_t v28 = v23 + 2;
      id v29 = [*(id *)(a1 + 64) objectAtIndexedSubscript:v23 + 1];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v29 doubleValue];
        double v25 = v30;
      }
      uint64_t v31 = v23 + 3;
      uint64_t v32 = [*(id *)(a1 + 64) objectAtIndexedSubscript:v28];

      objc_opt_class();
      double v33 = 0.0;
      double v34 = 0.0;
      if (objc_opt_isKindOfClass())
      {
        [v32 doubleValue];
        double v34 = v35;
      }
      uint64_t v36 = [*(id *)(a1 + 64) objectAtIndexedSubscript:v31];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v36 doubleValue];
        double v33 = v37;
      }
      -[CSSceneClassification setBoundingBox:](v20, "setBoundingBox:", v26, v25, v34, v33);
    }
  }
  if (v14) {
    [(CSSceneClassification *)v20 setSceneType:v14];
  }
  if (v16) {
    [(CSSceneClassification *)v20 setMediaType:v16];
  }
  if (v17 != 0.0)
  {
    *(float *)&double v21 = v17;
    [(CSSceneClassification *)v20 setSceneArea:v21];
  }

  return v20;
}

- (void)setPhotosSceneClassifications:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemPhotosSceneClassification"];
}

CSDocumentUnderstandingTopic *__77__CSSearchableItemAttributeSet_CSPhotos_Private__documentUnderstandingTopics__block_invoke(double a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [[CSDocumentUnderstandingTopic alloc] initWithLabel:v8 synonyms:v7 confidence:a1];

  return v9;
}

- (void)setDocumentUnderstandingTopics:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemDocumentUnderstandingTopics"];
}

- (void)setDocumentUnderstandingTopicsVersion:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemDocumentUnderstandingTopicsVersion" copy:0];
}

- (NSNumber)documentUnderstandingTopicsVersion
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemDocumentUnderstandingTopicsVersion"];
}

CSDocumentUnderstandingCategory *__81__CSSearchableItemAttributeSet_CSPhotos_Private__documentUnderstandingCategories__block_invoke(double a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [[CSDocumentUnderstandingCategory alloc] initWithLabel:v8 synonyms:v7 confidence:a1];

  return v9;
}

- (void)setDocumentUnderstandingCategories:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemDocumentUnderstandingCategories"];
}

- (void)setDocumentUnderstandingCategoriesVersion:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemDocumentUnderstandingCategoriesVersion" copy:0];
}

- (NSNumber)documentUnderstandingCategoriesVersion
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemDocumentUnderstandingCategoriesVersion"];
}

- (NSArray)extractedEmails
{
  v6[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"kMDItemExtractedEmailsLabels";
  v6[1] = @"kMDItemExtractedEmailsSynonyms";
  v6[2] = @"kMDItemExtractedEmailsSynonymsCounts";
  v6[3] = @"kMDItemExtractedEmailsConfidences";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
  id v4 = [(CSSearchableItemAttributeSet *)self _getExternalAnalysisTagsForPrimaryAttribute:@"kMDItemExtractedEmails" analysisAttributes:v3 getTagBlock:&__block_literal_global_1470];

  return (NSArray *)v4;
}

CSEmailAddressTag *__65__CSSearchableItemAttributeSet_CSPhotos_Private__extractedEmails__block_invoke(double a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [[CSEmailAddressTag alloc] initWithEmailAddress:v8 synonyms:v7 confidence:a1];

  return v9;
}

- (void)setExtractedEmails:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemExtractedEmails"];
}

CSPhoneNumberTag *__71__CSSearchableItemAttributeSet_CSPhotos_Private__extractedPhoneNumbers__block_invoke(uint64_t a1, unint64_t a2, void *a3, void *a4, double a5)
{
  id v9 = a3;
  id v10 = a4;
  if (*(void *)(a1 + 40) <= a2)
  {
    uint64_t v12 = -1;
  }
  else
  {
    id v11 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v12 = [v11 integerValue];
    }
    else {
      uint64_t v12 = -1;
    }
  }
  id v13 = [[CSPhoneNumberTag alloc] initWithPhoneNumber:v9 synonyms:v10 countryCode:v12 confidence:a5];

  return v13;
}

- (void)setExtractedPhoneNumbers:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemExtractedPhoneNumbers"];
}

CSAddressTag *__68__CSSearchableItemAttributeSet_CSPhotos_Private__extractedAddresses__block_invoke(double a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [[CSAddressTag alloc] initWithAddress:v8 synonyms:v7 confidence:a1];

  return v9;
}

- (void)setExtractedAddresses:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemExtractedAddresses"];
}

CSFlightTag *__66__CSSearchableItemAttributeSet_CSPhotos_Private__extractedFlights__block_invoke(double a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [[CSFlightTag alloc] initWithFlight:v8 synonyms:v7 confidence:a1];

  return v9;
}

- (void)setExtractedFlights:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemExtractedFlights"];
}

- (NSArray)extractedLinks
{
  v6[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"kMDItemExtractedLinksLabels";
  v6[1] = @"kMDItemExtractedLinksSynonyms";
  v6[2] = @"kMDItemExtractedLinksSynonymsCounts";
  v6[3] = @"kMDItemExtractedLinksConfidences";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
  id v4 = [(CSSearchableItemAttributeSet *)self _getExternalAnalysisTagsForPrimaryAttribute:@"kMDItemExtractedLinks" analysisAttributes:v3 getTagBlock:&__block_literal_global_1476];

  return (NSArray *)v4;
}

CSLinkTag *__64__CSSearchableItemAttributeSet_CSPhotos_Private__extractedLinks__block_invoke(double a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [[CSLinkTag alloc] initWithLink:v8 synonyms:v7 confidence:a1];

  return v9;
}

- (void)setExtractedLinks:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemExtractedLinks"];
}

- (NSArray)extractedTrackingNumbers
{
  v6[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"kMDItemExtractedTrackingNumbersLabels";
  v6[1] = @"kMDItemExtractedTrackingNumbersSynonyms";
  v6[2] = @"kMDItemExtractedTrackingNumbersSynonymsCounts";
  v6[3] = @"kMDItemExtractedTrackingNumbersConfidences";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
  id v4 = [(CSSearchableItemAttributeSet *)self _getExternalAnalysisTagsForPrimaryAttribute:@"kMDItemExtractedTrackingNumbers" analysisAttributes:v3 getTagBlock:&__block_literal_global_1478];

  return (NSArray *)v4;
}

CSTrackingNumberTag *__74__CSSearchableItemAttributeSet_CSPhotos_Private__extractedTrackingNumbers__block_invoke(double a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(CSExternalAnalysisTag *)[CSTrackingNumberTag alloc] initWithLabel:v8 synonyms:v7 confidence:a1];

  return v9;
}

- (void)setExtractedTrackingNumbers:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemExtractedTrackingNumbers"];
}

- (void)setAestheticScore:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemAestheticScore" copy:0];
}

- (NSNumber)aestheticScore
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemAestheticScore"];
}

- (void)setCurationScore:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemCurationScore" copy:0];
}

- (NSNumber)curationScore
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemCurationScore"];
}

- (void)setIsProResVideo:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemIsProResVideo" copy:0];
}

- (NSNumber)isProResVideo
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemIsProResVideo"];
}

- (void)setSavingApplication:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemSavingApplication" copy:1];
}

- (NSString)savingApplication
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemSavingApplication"];
}

- (void)setSavingApplicationBundleIdentifier:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemSavingApplicationBundleIdentifier" copy:1];
}

- (NSString)savingApplicationBundleIdentifier
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemSavingApplicationBundleIdentifier"];
}

- (void)setHasTopMomentScore:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"_kMDItemHasTopMomentScore" copy:0];
}

- (NSNumber)hasTopMomentScore
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemHasTopMomentScore"];
}

- (void)setIsCinematicVideo:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"_kMDItemIsCinematicVideo" copy:0];
}

- (NSNumber)isCinematicVideo
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemIsCinematicVideo"];
}

- (void)setEligibleForPhotosProcessing:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"_kMDItemEligibleForPhotosProcessing" copy:0];
}

- (NSNumber)eligibleForPhotosProcessing
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemEligibleForPhotosProcessing"];
}

- (void)setPhotosLibraryName:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemPhotosLibraryName" copy:1];
}

- (NSString)photosLibraryName
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosLibraryName"];
}

- (void)setPhotosContributor:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemPhotosContributor" copy:1];
}

- (CSPerson)photosContributor
{
  return (CSPerson *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosContributor"];
}

- (void)setPhotosAcquisitionMake:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemAcquisitionMake" copy:1];
}

- (NSString)photosAcquisitionMake
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemAcquisitionMake"];
}

- (void)setPhotosAcquisitionModel:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemAcquisitionModel" copy:1];
}

- (NSString)photosAcquisitionModel
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemAcquisitionModel"];
}

- (void)setPhotosDuration:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemDurationSeconds" copy:0];
}

- (NSNumber)photosDuration
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemDurationSeconds"];
}

- (void)setPhotosContentCreationDate:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemContentCreationDate" copy:0];
}

- (NSDate)photosContentCreationDate
{
  return (NSDate *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemContentCreationDate"];
}

- (void)setPhotosContentCreationDateMonth:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemPhotosContentCreationDateMonth" copy:1];
}

- (NSString)photosContentCreationDateMonth
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosContentCreationDateMonth"];
}

- (void)setPhotosContentCreationDateMonths:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemPhotosContentCreationDateMonths"];
}

- (NSArray)photosContentCreationDateMonths
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosContentCreationDateMonths"];
}

- (void)setPhotosContentCreationDateYear:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemPhotosContentCreationDateYear" copy:1];
}

- (NSString)photosContentCreationDateYear
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosContentCreationDateYear"];
}

- (void)setPhotosContentCreationDateYears:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemPhotosContentCreationDateYears"];
}

- (NSArray)photosContentCreationDateYears
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosContentCreationDateYears"];
}

- (void)setPhotosContentType:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemContentType" copy:1];
}

- (NSString)photosContentType
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemContentType"];
}

- (void)setPhotosTitle:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemPhotosTitle" copy:1];
}

- (NSString)photosTitle
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosTitle"];
}

- (void)setPhotosContentDescription:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemPhotosDescription" copy:1];
}

- (NSString)photosContentDescription
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosDescription"];
}

- (void)setPhotosDisplayName:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemDisplayName" copy:1];
}

- (NSString)photosDisplayName
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemDisplayName"];
}

- (void)setPhotosFilename:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemFilename" copy:1];
}

- (NSString)photosFilename
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemFilename"];
}

- (void)setPhotosKeywords:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemPhotosKeywords"];
}

- (NSArray)photosKeywords
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosKeywords"];
}

- (void)setPhotosContainerIdentifier:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemContainerIdentifier" copy:1];
}

- (NSString)photosContainerIdentifier
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemContainerIdentifier"];
}

- (void)setPhotosContentRating:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemContentRating" copy:0];
}

- (NSNumber)photosContentRating
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemContentRating"];
}

- (void)setPhotosAestheticScore:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemAestheticScore" copy:0];
}

- (NSNumber)photosAestheticScore
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemAestheticScore"];
}

- (void)setPhotosCurationScore:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemCurationScore" copy:0];
}

- (NSNumber)photosCurationScore
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemCurationScore"];
}

- (void)setPhotosSavingApplication:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemSavingApplication" copy:1];
}

- (NSString)photosSavingApplication
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemSavingApplication"];
}

- (void)setPhotosSavingApplicationBundleIdentifier:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemSavingApplicationBundleIdentifier" copy:1];
}

- (NSString)photosSavingApplicationBundleIdentifier
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemSavingApplicationBundleIdentifier"];
}

- (void)setPhotosHasTopMomentScore:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"_kMDItemHasTopMomentScore" copy:0];
}

- (NSNumber)photosHasTopMomentScore
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemHasTopMomentScore"];
}

- (void)setPhotosIsProResVideo:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemIsProResVideo" copy:0];
}

- (NSNumber)photosIsProResVideo
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemIsProResVideo"];
}

- (void)setPhotosTimeZoneName:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemPhotosTimeZoneName" copy:1];
}

- (NSString)photosTimeZoneName
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosTimeZoneName"];
}

- (void)setPhotosTimeZoneOffset:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemPhotosTimeZoneOffset" copy:0];
}

- (NSNumber)photosTimeZoneOffset
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosTimeZoneOffset"];
}

- (void)setPhotosInferredTimeZoneOffset:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemPhotosInferredTimeZoneOffset" copy:0];
}

- (NSNumber)photosInferredTimeZoneOffset
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosInferredTimeZoneOffset"];
}

- (void)setPhotosDonationState:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemPhotosDonationState" copy:0];
}

- (NSNumber)photosDonationState
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosDonationState"];
}

- (void)setPhotosCharacterRecognitionAnalysisVersion:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemPhotosCharacterRecognitionAnalysisVersion" copy:0];
}

- (NSNumber)photosCharacterRecognitionAnalysisVersion
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosCharacterRecognitionAnalysisVersion"];
}

- (void)setPhotosFaceAnalysisVersion:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemPhotosFaceAnalysisVersion" copy:0];
}

- (NSNumber)photosFaceAnalysisVersion
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosFaceAnalysisVersion"];
}

- (void)setPhotosLocationPrivateEncryptedComputeAnalysisVersion:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemPhotosLocationPrivateEncryptedComputeAnalysisVersion" copy:0];
}

- (NSNumber)photosLocationPrivateEncryptedComputeAnalysisVersion
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosLocationPrivateEncryptedComputeAnalysisVersion"];
}

- (void)setPhotosMediaAnalysisVersion:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemPhotosMediaAnalysisVersion" copy:0];
}

- (NSNumber)photosMediaAnalysisVersion
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosMediaAnalysisVersion"];
}

- (void)setPhotosMediaAnalysisImageVersion:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemPhotosMediaAnalysisImageVersion" copy:0];
}

- (NSNumber)photosMediaAnalysisImageVersion
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosMediaAnalysisImageVersion"];
}

- (void)setPhotosPrivateEncryptedComputeAnalysisVersion:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemPhotosPrivateEncryptedComputeAnalysisVersion" copy:0];
}

- (NSNumber)photosPrivateEncryptedComputeAnalysisVersion
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosPrivateEncryptedComputeAnalysisVersion"];
}

- (void)setPhotosSceneAnalysisVersion:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemPhotosSceneAnalysisVersion" copy:0];
}

- (NSNumber)photosSceneAnalysisVersion
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemPhotosSceneAnalysisVersion"];
}

- (void)setPhotosIsCinematicVideo:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"_kMDItemIsCinematicVideo" copy:0];
}

- (NSNumber)photosIsCinematicVideo
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemIsCinematicVideo"];
}

- (NSArray)photosTextContentPieces
{
  return 0;
}

- (NSArray)photosMatchingLabelsIndexes
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDQueryResultMatchingArrayIndexes.kMDItemPhotosSceneClassificationLabels"];
}

- (NSArray)photosMatchingLSynonymsIndexes
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDQueryResultMatchingArrayIndexes.kMDItemPhotosSceneClassificationSynonyms"];
}

- (void)setXmpCredit:(id)a3
{
}

- (NSString)xmpCredit
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemXMPCredit"];
}

- (void)setXmpDigitalSourceType:(id)a3
{
}

- (NSString)xmpDigitalSourceType
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemXMPDigitalSourceType"];
}

- (NSNumber)lastMotionActivityState
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_MDItemLastMotionActivityState"];
}

- (void)setLastMotionActivityState:(id)a3
{
}

- (NSString)messageSuggestedContactPhotoPath
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"com_apple_mobilesms_suggested_contact_photo"];
}

- (void)setMessageSuggestedContactPhotoPath:(id)a3
{
}

- (NSString)messageSuggestedContactName
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"com_apple_mobilesms_suggested_contact_name"];
}

- (void)setMessageSuggestedContactName:(id)a3
{
}

- (void)setMessagePinned:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"_kMDItemMessagePinned" copy:0];
}

- (NSNumber)messagePinned
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemMessagePinned"];
}

- (void)setTapbackAssociatedMessageID:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"_kMDItemTapbackAssociatedMessageID" copy:1];
}

- (NSString)tapbackAssociatedMessageID
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemTapbackAssociatedMessageID"];
}

- (void)setMessageTapbackStringValue:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"_kMDItemMessageTapbackStringValue" copy:1];
}

- (NSString)messageTapbackStringValue
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemMessageTapbackStringValue"];
}

- (void)setMessageType:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"_kMDItemMessageType" copy:1];
}

- (NSString)messageType
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemMessageType"];
}

- (void)setMessageService:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"_kMDItemMessageService" copy:1];
}

- (NSString)messageService
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemMessageService"];
}

- (void)setMessageMentionedAddresses:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"_kMDItemMessageMentionedAddresses"];
}

- (NSArray)messageMentionedAddresses
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemMessageMentionedAddresses"];
}

- (void)setMessageRead:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"_kMDItemMessageRead" copy:0];
}

- (NSNumber)messageRead
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemMessageRead"];
}

- (void)setIsMessageFromKnownSender:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"_kMDItemMessageFromKnownSender" copy:0];
}

- (NSNumber)isMessageFromKnownSender
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemMessageFromKnownSender"];
}

- (void)setMessageTapbackType:(int)a3
{
  id v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"_kMDItemMessageTapbackType" copy:0];
}

- (int)messageTapbackType
{
  uint64_t v2 = [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemMessageTapbackType"];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setMessageEffectType:(int)a3
{
  id v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"_kMDItemMessageEffectType" copy:0];
}

- (int)messageEffectType
{
  uint64_t v2 = [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemMessageEffectType"];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setThreadIdentifier:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"_kMDItemThreadIdentifier" copy:1];
}

- (NSString)threadIdentifier
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemThreadIdentifier"];
}

- (void)setIsCommunicationNotification:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"_kMDItemIsCommunicationNotification" copy:0];
}

- (NSNumber)isCommunicationNotification
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemIsCommunicationNotification"];
}

- (void)setNotificationTimeSensitive:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"_kMDItemNotificationTimeSensitive" copy:0];
}

- (NSNumber)notificationTimeSensitive
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemNotificationTimeSensitive"];
}

- (void)setNotificationCritical:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"_kMDItemNotificationCritical" copy:0];
}

- (NSNumber)notificationCritical
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemNotificationCritical"];
}

- (NSNumber)isZombie
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemIsZombie"];
}

- (void)setIsZombie:(id)a3
{
}

- (void)setContainerTitle:(NSString *)containerTitle
{
}

- (NSString)containerTitle
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemContainerTitle"];
}

- (void)setContainerDisplayName:(NSString *)containerDisplayName
{
}

- (NSString)containerDisplayName
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemContainerDisplayName"];
}

- (void)setContainerIdentifier:(NSString *)containerIdentifier
{
}

- (NSString)containerIdentifier
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemContainerIdentifier"];
}

- (void)setContainerOrder:(NSNumber *)containerOrder
{
}

- (NSNumber)containerOrder
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemContainerOrder"];
}

- (void)setAllDay:(NSNumber *)allDay
{
}

- (NSNumber)allDay
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemIsAllDay"];
}

- (id)valueForCustomKey:(CSCustomAttributeKey *)key
{
  id v4 = [(CSCustomAttributeKey *)key keyName];
  if (v4)
  {
    id v5 = [(CSSearchableItemAttributeSet *)self attributeForKey:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void __80__CSSearchableItemAttributeSet_CSCoderAdditions__encodeWithCSCoder_includeText___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, long long *a4)
{
  int v8 = *(unsigned __int8 *)(a1 + 48);
  if (*(unsigned char *)(a1 + 48)
    && (id v9 = *(void **)(*(void *)(a1 + 32) + 32),
        [NSString stringWithUTF8String:a2],
        id v13 = (id)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "objectForKeyedSubscript:"),
        (id v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else
  {
    long long v15 = *a4;
    uint64_t v16 = *((void *)a4 + 2);
    int PlistObjectType = _MDPlistGetPlistObjectType();
    if (v8) {

    }
    if (PlistObjectType == 240)
    {
      long long v15 = *a4;
      uint64_t v16 = *((void *)a4 + 2);
      if (_MDPlistArrayGetCount() == 2)
      {
        [*(id *)(a1 + 40) encodeString:a2 length:a3];
        uint64_t v12 = *(void **)(a1 + 40);
        long long v15 = *a4;
        uint64_t v16 = *((void *)a4 + 2);
        _MDPlistArrayGetPlistObjectAtIndex();
        [v12 encodeMDPlistObject:v14];
      }
    }
  }
}

- (void)setInstantAnswers:(id)a3
{
  id v4 = +[CSInstantAnswer dataFromInstantAnswers:a3];
  [(CSSearchableItemAttributeSet *)self _setDataValue:v4 forKey:@"kMDQueryResultInstantAnswers"];
}

- (id)instantAnswers
{
  uint64_t v2 = [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDQueryResultInstantAnswers"];
  if (v2)
  {
    int v3 = +[CSInstantAnswer instantAnswersFromData:v2];
  }
  else
  {
    int v3 = 0;
  }

  return v3;
}

- (void)setDonatedEvent:(id)a3
{
  id v4 = a3;
  id v14 = [v4 data];
  [(CSSearchableItemAttributeSet *)self _setDataValue:v14 forKey:@"kMDItemDonatedEvent"];
  id v5 = [v4 type];
  [(CSSearchableItemAttributeSet *)self _setStringValue:v5 forKey:@"kMDItemDonatedEventType"];

  id v6 = [v4 flightNumber];
  [(CSSearchableItemAttributeSet *)self _setStringValue:v6 forKey:@"kMDItemDonatedEventFlightNumber"];

  id v7 = [v4 flightCarrier];
  [(CSSearchableItemAttributeSet *)self _setStringValue:v7 forKey:@"kMDItemDonatedEventFlightCarrier"];

  int v8 = [v4 arrivalAirportCode];
  [(CSSearchableItemAttributeSet *)self _setStringValue:v8 forKey:@"kMDItemDonatedEventArrivalAirportCode"];

  id v9 = [v4 arrivalAirportName];
  [(CSSearchableItemAttributeSet *)self _setStringValue:v9 forKey:@"kMDItemDonatedEventArrivalAirportName"];

  id v10 = [v4 departureAirportCode];
  [(CSSearchableItemAttributeSet *)self _setStringValue:v10 forKey:@"kMDItemDonatedEventDepartureAirportCode"];

  id v11 = [v4 departureAirportName];
  [(CSSearchableItemAttributeSet *)self _setStringValue:v11 forKey:@"kMDItemDonatedEventDepartureAirportName"];

  uint64_t v12 = [v4 courierName];
  [(CSSearchableItemAttributeSet *)self _setStringValue:v12 forKey:@"kMDItemDonatedEventCourierName"];

  id v13 = [v4 merchantName];

  [(CSSearchableItemAttributeSet *)self _setStringValue:v13 forKey:@"kMDItemDonatedEventMerchantName"];
}

- (CSDonatedEvent)donatedEvent
{
  uint64_t v2 = [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemDonatedEvent"];
  if (v2)
  {
    int v3 = +[CSDonatedEvent eventFromData:v2];
  }
  else
  {
    int v3 = 0;
  }

  return (CSDonatedEvent *)v3;
}

- (void)setFlightNumber:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventFlightNumber" copy:1];
}

- (NSString)flightNumber
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventFlightNumber"];
}

- (void)setFlightCheckInUrl:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventFlightCheckInUrl" copy:1];
}

- (NSString)flightCheckInUrl
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventFlightCheckInUrl"];
}

- (void)setFlightBookingInfoUrl:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventFlightBookingInfoUrl" copy:1];
}

- (NSString)flightBookingInfoUrl
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventFlightBookingInfoUrl"];
}

- (void)setFlightStatus:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventFlightStatus" copy:1];
}

- (NSString)flightStatus
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventFlightStatus"];
}

- (void)setFlightCarrier:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventFlightCarrier" copy:1];
}

- (NSString)flightCarrier
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventFlightCarrier"];
}

- (void)setFlightCarrierCode:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventFlightCarrierCode" copy:1];
}

- (NSString)flightCarrierCode
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventFlightCarrierCode"];
}

- (void)setFlightArrivalTimeZone:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventFlightArrivalTimeZone" copy:1];
}

- (NSString)flightArrivalTimeZone
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventFlightArrivalTimeZone"];
}

- (void)setFlightDepartureTimeZone:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventFlightDepartureTimeZone" copy:1];
}

- (NSString)flightDepartureTimeZone
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventFlightDepartureTimeZone"];
}

- (void)setFlightArrivalAirportCode:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventFlightArrivalAirportCode" copy:1];
}

- (NSString)flightArrivalAirportCode
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventFlightArrivalAirportCode"];
}

- (void)setFlightArrivalAirportName:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventFlightArrivalAirportName" copy:1];
}

- (NSString)flightArrivalAirportName
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventFlightArrivalAirportName"];
}

- (void)setFlightDepartureAirportCode:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventFlightDepartureAirportCode" copy:1];
}

- (NSString)flightDepartureAirportCode
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventFlightDepartureAirportCode"];
}

- (void)setFlightDepartureAirportName:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventFlightDepartureAirportName" copy:1];
}

- (NSString)flightDepartureAirportName
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventFlightDepartureAirportName"];
}

- (void)setFlightArrivalAirportLatitude:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventFlightArrivalAirportLatitude" copy:0];
}

- (NSNumber)flightArrivalAirportLatitude
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventFlightArrivalAirportLatitude"];
}

- (void)setFlightDepartureAirportLatitude:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventFlightDepartureAirportLatitude" copy:0];
}

- (NSNumber)flightDepartureAirportLatitude
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventFlightDepartureAirportLatitude"];
}

- (void)setFlightArrivalAirportLongitude:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventFlightArrivalAirportLongitude" copy:0];
}

- (NSNumber)flightArrivalAirportLongitude
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventFlightArrivalAirportLongitude"];
}

- (void)setFlightDepartureAirportLongitude:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventFlightDepartureAirportLongitude" copy:0];
}

- (NSNumber)flightDepartureAirportLongitude
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventFlightDepartureAirportLongitude"];
}

- (void)setFlightArrivalAirportInternationalNames:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemEventFlightArrivalAirportInternationalNames"];
}

- (NSArray)flightArrivalAirportInternationalNames
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventFlightArrivalAirportInternationalNames"];
}

- (void)setFlightDepartureAirportInternationalNames:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemEventFlightDepartureAirportInternationalNames"];
}

- (NSArray)flightDepartureAirportInternationalNames
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventFlightDepartureAirportInternationalNames"];
}

- (void)setFlightPassengerNames:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemEventFlightPassengerNames"];
}

- (NSArray)flightPassengerNames
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventFlightPassengerNames"];
}

- (void)setFlightPassengerSeatNumbers:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemEventFlightPassengerSeatNumbers"];
}

- (NSArray)flightPassengerSeatNumbers
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventFlightPassengerSeatNumbers"];
}

- (void)setFlightArrivalTerminal:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventFlightArrivalTerminal" copy:1];
}

- (NSString)flightArrivalTerminal
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventFlightArrivalTerminal"];
}

- (void)setFlightDepartureTerminal:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventFlightDepartureTerminal" copy:1];
}

- (NSString)flightDepartureTerminal
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventFlightDepartureTerminal"];
}

- (void)setFlightConfirmationNumber:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventFlightConfirmationNumber" copy:1];
}

- (NSString)flightConfirmationNumber
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventFlightConfirmationNumber"];
}

- (void)setFlightArrivalAirportAddress:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventFlightArrivalAirportAddress" copy:1];
}

- (NSString)flightArrivalAirportAddress
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventFlightArrivalAirportAddress"];
}

- (void)setFlightArrivalAirportStreetAddress:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventFlightArrivalAirportStreetAddress" copy:1];
}

- (NSString)flightArrivalAirportStreetAddress
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventFlightArrivalAirportStreetAddress"];
}

- (void)setFlightArrivalAirportLocality:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventFlightArrivalAirportLocality" copy:1];
}

- (NSString)flightArrivalAirportLocality
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventFlightArrivalAirportLocality"];
}

- (void)setFlightArrivalAirportRegion:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventFlightArrivalAirportRegion" copy:1];
}

- (NSString)flightArrivalAirportRegion
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventFlightArrivalAirportRegion"];
}

- (void)setFlightArrivalAirportPostalCode:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventFlightArrivalAirportPostalCode" copy:1];
}

- (NSString)flightArrivalAirportPostalCode
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventFlightArrivalAirportPostalCode"];
}

- (void)setFlightArrivalAirportCountry:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventFlightArrivalAirportCountry" copy:1];
}

- (NSString)flightArrivalAirportCountry
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventFlightArrivalAirportCountry"];
}

- (void)setFlightDepartureAirportAddress:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventFlightDepartureAirportAddress" copy:1];
}

- (NSString)flightDepartureAirportAddress
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventFlightDepartureAirportAddress"];
}

- (void)setFlightDepartureAirportStreetAddress:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventFlightDepartureAirportStreetAddress" copy:1];
}

- (NSString)flightDepartureAirportStreetAddress
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventFlightDepartureAirportStreetAddress"];
}

- (void)setFlightDepartureAirportLocality:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventFlightDepartureAirportLocality" copy:1];
}

- (NSString)flightDepartureAirportLocality
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventFlightDepartureAirportLocality"];
}

- (void)setFlightDepartureAirportRegion:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventFlightDepartureAirportRegion" copy:1];
}

- (NSString)flightDepartureAirportRegion
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventFlightDepartureAirportRegion"];
}

- (void)setFlightDepartureAirportPostalCode:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventFlightDepartureAirportPostalCode" copy:1];
}

- (NSString)flightDepartureAirportPostalCode
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventFlightDepartureAirportPostalCode"];
}

- (void)setFlightDepartureAirportCountry:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventFlightDepartureAirportCountry" copy:1];
}

- (NSString)flightDepartureAirportCountry
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventFlightDepartureAirportCountry"];
}

- (void)setFlightArrivalAirportAddressSynonyms:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemEventFlightArrivalAirportAddressSynonyms"];
}

- (NSArray)flightArrivalAirportAddressSynonyms
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventFlightArrivalAirportAddressSynonyms"];
}

- (void)setFlightDepartureAirportAddressSynonyms:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemEventFlightDepartureAirportAddressSynonyms"];
}

- (NSArray)flightDepartureAirportAddressSynonyms
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventFlightDepartureAirportAddressSynonyms"];
}

- (void)setFlightBoardingDateTime:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventFlightBoardingDateTime" copy:0];
}

- (NSDate)flightBoardingDateTime
{
  return (NSDate *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventFlightBoardingDateTime"];
}

- (void)setFlightDepartureGate:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventFlightDepartureGate" copy:1];
}

- (NSString)flightDepartureGate
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventFlightDepartureGate"];
}

- (void)setFlightArrivalGate:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventFlightArrivalGate" copy:1];
}

- (NSString)flightArrivalGate
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventFlightArrivalGate"];
}

- (void)setFlightDepartureDateTime:(id)a3
{
}

- (NSDate)flightDepartureDateTime
{
  return (NSDate *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemStartDate"];
}

- (void)setFlightDesignator:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = CSRedactString(v4, 1);
    int v7 = 138412290;
    int v8 = v6;
    _os_log_impl(&dword_18D0E3000, v5, OS_LOG_TYPE_DEFAULT, "[instant answers][donation] flight event donated with designator = %@", (uint8_t *)&v7, 0xCu);
  }
  [(CSSearchableItemAttributeSet *)self _setStringValue:v4 forKey:@"kMDItemEventFlightDesignator"];
}

- (NSString)flightDesignator
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventFlightDesignator"];
}

- (void)setFlightArrivalDateTime:(id)a3
{
}

- (NSDate)flightArrivalDateTime
{
  return (NSDate *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEndDate"];
}

- (void)setHotelUnderName:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventHotelUnderName" copy:1];
}

- (NSString)hotelUnderName
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventHotelUnderName"];
}

- (void)setHotelTimeZone:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventHotelTimeZone" copy:1];
}

- (NSString)hotelTimeZone
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventHotelTimeZone"];
}

- (void)setHotelProvider:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventHotelProvider" copy:1];
}

- (NSString)hotelProvider
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventHotelProvider"];
}

- (void)setHotelModifyReservationUrl:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventHotelModifyReservationUrl" copy:1];
}

- (NSString)hotelModifyReservationUrl
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventHotelModifyReservationUrl"];
}

- (void)setHotelReservationForName:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventHotelReservationForName" copy:1];
}

- (NSString)hotelReservationForName
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventHotelReservationForName"];
}

- (void)setHotelReservationForTelephone:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventHotelReservationForTelephone" copy:1];
}

- (NSString)hotelReservationForTelephone
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventHotelReservationForTelephone"];
}

- (void)setHotelReservationForAddress:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventHotelReservationForAddress" copy:1];
}

- (NSString)hotelReservationForAddress
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventHotelReservationForAddress"];
}

- (void)setHotelReservationForStreetAddress:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventHotelReservationForStreetAddress" copy:1];
}

- (NSString)hotelReservationForStreetAddress
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventHotelReservationForStreetAddress"];
}

- (void)setHotelReservationForAddressLocality:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventHotelReservationForAddressLocality" copy:1];
}

- (NSString)hotelReservationForAddressLocality
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventHotelReservationForAddressLocality"];
}

- (void)setHotelReservationForAddressRegion:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventHotelReservationForAddressRegion" copy:1];
}

- (NSString)hotelReservationForAddressRegion
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventHotelReservationForAddressRegion"];
}

- (void)setHotelReservationForAddressPostalCode:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventHotelReservationForAddressPostalCode" copy:1];
}

- (NSString)hotelReservationForAddressPostalCode
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventHotelReservationForAddressPostalCode"];
}

- (void)setHotelReservationForAddressCountry:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventHotelReservationForAddressCountry" copy:1];
}

- (NSString)hotelReservationForAddressCountry
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventHotelReservationForAddressCountry"];
}

- (void)setHotelReservationForAddressSynonyms:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemEventHotelReservationForAddressSynonyms"];
}

- (NSArray)hotelReservationForAddressSynonyms
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventHotelReservationForAddressSynonyms"];
}

- (void)setHotelReservationId:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = CSRedactString(v4, 1);
    int v7 = 138412290;
    int v8 = v6;
    _os_log_impl(&dword_18D0E3000, v5, OS_LOG_TYPE_DEFAULT, "[instant answers][donation] hotel event donated with reservationID = %@", (uint8_t *)&v7, 0xCu);
  }
  [(CSSearchableItemAttributeSet *)self _setStringValue:v4 forKey:@"kMDItemEventHotelReservationId"];
}

- (NSString)hotelReservationId
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventHotelReservationId"];
}

- (void)setHotelCheckinDate:(id)a3
{
}

- (NSDate)hotelCheckinDate
{
  return (NSDate *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemStartDate"];
}

- (void)setHotelCheckinTime:(id)a3
{
}

- (NSDate)hotelCheckinTime
{
  return (NSDate *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemStartDate"];
}

- (void)setHotelCheckoutDate:(id)a3
{
}

- (NSDate)hotelCheckoutDate
{
  return (NSDate *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEndDate"];
}

- (void)setHotelCheckoutTime:(id)a3
{
}

- (NSDate)hotelCheckoutTime
{
  return (NSDate *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEndDate"];
}

- (void)setCachedViewData:(id)a3
{
  id v4 = a3;
  if ((float)((float)(unint64_t)[v4 length] * 0.00097656) >= 2.0)
  {
    id v5 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CSSearchableItemAttributeSet(SwiftUI_Archiving) setCachedViewData:](v5);
    }
  }
  else
  {
    [(CSSearchableItemAttributeSet *)self _setDataValue:v4 forKey:@"MDItemCachedViewData"];
  }
}

- (NSData)cachedViewData
{
  return (NSData *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"MDItemCachedViewData"];
}

- (void)setRestaurantReservationId:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventRestaurantReservationId" copy:1];
}

- (NSString)restaurantReservationId
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventRestaurantReservationId"];
}

- (void)setRestaurantUnderName:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventRestaurantUnderName" copy:1];
}

- (NSString)restaurantUnderName
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventRestaurantUnderName"];
}

- (void)setRestaurantTimeZone:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventRestaurantTimeZone" copy:1];
}

- (NSString)restaurantTimeZone
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventRestaurantTimeZone"];
}

- (void)setRestaurantPartySize:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventRestaurantPartySize" copy:1];
}

- (NSString)restaurantPartySize
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventRestaurantPartySize"];
}

- (void)setRestaurantMealType:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventRestaurantMealType" copy:1];
}

- (NSString)restaurantMealType
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventRestaurantMealType"];
}

- (void)setRestaurantReservationForName:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventRestaurantReservationForName" copy:1];
}

- (NSString)restaurantReservationForName
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventRestaurantReservationForName"];
}

- (void)setRestaurantReservationForTelephone:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventRestaurantReservationForTelephone" copy:1];
}

- (NSString)restaurantReservationForTelephone
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventRestaurantReservationForTelephone"];
}

- (void)setRestaurantReservationForAddress:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventRestaurantReservationForAddress" copy:1];
}

- (NSString)restaurantReservationForAddress
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventRestaurantReservationForAddress"];
}

- (void)setRestaurantReservationForStreetAddress:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventRestaurantReservationForStreetAddress" copy:1];
}

- (NSString)restaurantReservationForStreetAddress
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventRestaurantReservationForStreetAddress"];
}

- (void)setRestaurantReservationForAddressLocality:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventRestaurantReservationForAddressLocality" copy:1];
}

- (NSString)restaurantReservationForAddressLocality
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventRestaurantReservationForAddressLocality"];
}

- (void)setRestaurantReservationForAddressRegion:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventRestaurantReservationForAddressRegion" copy:1];
}

- (NSString)restaurantReservationForAddressRegion
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventRestaurantReservationForAddressRegion"];
}

- (void)setRestaurantReservationForAddressPostalCode:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventRestaurantReservationForAddressPostalCode" copy:1];
}

- (NSString)restaurantReservationForAddressPostalCode
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventRestaurantReservationForAddressPostalCode"];
}

- (void)setRestaurantReservationForAddressCountry:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventRestaurantReservationForAddressCountry" copy:1];
}

- (NSString)restaurantReservationForAddressCountry
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventRestaurantReservationForAddressCountry"];
}

- (void)setRestaurantReservationForAddressSynonyms:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemEventRestaurantReservationForAddressSynonyms"];
}

- (NSArray)restaurantReservationForAddressSynonyms
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventRestaurantReservationForAddressSynonyms"];
}

- (void)setRestaurantStartDate:(id)a3
{
}

- (NSDate)restaurantStartDate
{
  return (NSDate *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemStartDate"];
}

- (void)setRestaurantStartTime:(id)a3
{
}

- (NSDate)restaurantStartTime
{
  return (NSDate *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemStartDate"];
}

- (void)setEventName:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventName" copy:1];
}

- (NSString)eventName
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventName"];
}

- (void)setEventCustomerNames:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemEventCustomerNames"];
}

- (NSArray)eventCustomerNames
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventCustomerNames"];
}

- (void)setEventContactPersonNames:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemEventContactPersonNames"];
}

- (NSArray)eventContactPersonNames
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventContactPersonNames"];
}

- (void)setEventProvider:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventProvider" copy:1];
}

- (NSString)eventProvider
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventProvider"];
}

- (void)setEventSeatNumbers:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemEventSeatNumbers"];
}

- (NSArray)eventSeatNumbers
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventSeatNumbers"];
}

- (void)setEventTotalCost:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventTotalCost" copy:1];
}

- (NSString)eventTotalCost
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventTotalCost"];
}

- (void)setEventStatus:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventStatus" copy:1];
}

- (NSString)eventStatus
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventStatus"];
}

- (void)setEventRoomNumbers:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"kMDItemEventRoomNumbers"];
}

- (NSArray)eventRoomNumbers
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventRoomNumbers"];
}

- (void)setEventNumberOfRooms:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventNumberOfRooms" copy:0];
}

- (NSNumber)eventNumberOfRooms
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventNumberOfRooms"];
}

- (void)setEventReservationID:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventReservationID" copy:1];
}

- (NSString)eventReservationID
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventReservationID"];
}

- (void)setEventReservationForName:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventReservationForName" copy:1];
}

- (NSString)eventReservationForName
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventReservationForName"];
}

- (void)setEventTicketType:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventTicketType" copy:1];
}

- (NSString)eventTicketType
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventTicketType"];
}

- (void)setEventURL:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventURL" copy:0];
}

- (NSURL)eventURL
{
  uint64_t v2 = [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventURL"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
LABEL_5:
    id v4 = v3;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
    goto LABEL_5;
  }
  id v4 = 0;
LABEL_7:

  return (NSURL *)v4;
}

- (void)setEventStartLocationName:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventStartLocationName" copy:1];
}

- (NSString)eventStartLocationName
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventStartLocationName"];
}

- (void)setEventStartLocationAddress:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventStartLocationAddress" copy:1];
}

- (NSString)eventStartLocationAddress
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventStartLocationAddress"];
}

- (void)setEventStartLocationTelephone:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventStartLocationTelephone" copy:1];
}

- (NSString)eventStartLocationTelephone
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventStartLocationTelephone"];
}

- (void)setEventEndLocationName:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventEndLocationName" copy:1];
}

- (NSString)eventEndLocationName
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventEndLocationName"];
}

- (void)setEventEndLocationAddress:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventEndLocationAddress" copy:1];
}

- (NSString)eventEndLocationAddress
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventEndLocationAddress"];
}

- (void)setEventEndLocationTelephone:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEventEndLocationTelephone" copy:1];
}

- (NSString)eventEndLocationTelephone
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventEndLocationTelephone"];
}

- (void)setEventDuration:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(CSSearchableItemAttributeSet *)self _setNumberValue:v4 forKey:@"kMDItemEventDuration"];
}

- (double)eventDuration
{
  uint64_t v2 = [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEventDuration"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (void)setCardType:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemCardType" copy:1];
}

- (NSString)cardType
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemCardType"];
}

- (void)setCardSubType:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemCardSubType" copy:1];
}

- (NSString)cardSubType
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemCardSubType"];
}

- (void)setCardProvider:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemCardProvider" copy:1];
}

- (NSString)cardProvider
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemCardProvider"];
}

- (void)setCardUnderName:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemCardUnderName" copy:1];
}

- (NSString)cardUnderName
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemCardUnderName"];
}

- (void)setCardNumber:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemCardNumber" copy:1];
}

- (NSString)cardNumber
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemCardNumber"];
}

- (void)setCardGroupNumber:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemCardGroupNumber" copy:1];
}

- (NSString)cardGroupNumber
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemCardGroupNumber"];
}

- (void)setCardIssuedBy:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemCardIssuedBy" copy:1];
}

- (NSString)cardIssuedBy
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemCardIssuedBy"];
}

- (void)setCardRegion:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemCardRegion" copy:1];
}

- (NSString)cardRegion
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemCardRegion"];
}

- (void)setCardCountry:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemCardCountry" copy:1];
}

- (NSString)cardCountry
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemCardCountry"];
}

- (void)setCardPlaceOfBirth:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemCardPlaceOfBirth" copy:1];
}

- (NSString)cardPlaceOfBirth
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemCardPlaceOfBirth"];
}

- (void)setCardAddress:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemCardAddress" copy:1];
}

- (NSString)cardAddress
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemCardAddress"];
}

- (void)setCardSex:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemCardSex" copy:1];
}

- (NSString)cardSex
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemCardSex"];
}

- (void)setCardHeight:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemCardHeight" copy:1];
}

- (NSString)cardHeight
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemCardHeight"];
}

- (void)setCardEyeColor:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemCardEyeColor" copy:1];
}

- (NSString)cardEyeColor
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemCardEyeColor"];
}

- (void)setCardWeight:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemCardWeight" copy:1];
}

- (NSString)cardWeight
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemCardWeight"];
}

- (void)setCardCategory:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemCardCategory" copy:1];
}

- (NSString)cardCategory
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemCardCategory"];
}

- (void)setCardRestrictions:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemCardRestrictions" copy:1];
}

- (NSString)cardRestrictions
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemCardRestrictions"];
}

- (void)setCardIssueDate:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemCardIssueDate" copy:0];
}

- (NSDate)cardIssueDate
{
  return (NSDate *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemCardIssueDate"];
}

- (void)setCardExpirationDate:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemCardExpirationDate" copy:0];
}

- (NSDate)cardExpirationDate
{
  return (NSDate *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemCardExpirationDate"];
}

- (void)setContactName:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemContactName" copy:1];
}

- (NSString)contactName
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemContactName"];
}

- (void)setContactNickname:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemContactNickname" copy:1];
}

- (NSString)contactNickname
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemContactNickname"];
}

- (void)setContactType:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemContactType" copy:1];
}

- (NSString)contactType
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemContactType"];
}

- (void)setContactSharedBy:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemContactSharedBy" copy:1];
}

- (NSString)contactSharedBy
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemContactSharedBy"];
}

- (void)setContactRelationship:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemContactRelationship" copy:1];
}

- (NSString)contactRelationship
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemContactRelationship"];
}

- (void)setContactSharedAppName:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemContactSharedAppName" copy:1];
}

- (NSString)contactSharedAppName
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemContactSharedAppName"];
}

- (void)setContactSharedDateTime:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemContactSharedDateTime" copy:0];
}

- (NSDate)contactSharedDateTime
{
  return (NSDate *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemContactSharedDateTime"];
}

- (void)setAppEntityInstanceId:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"_kMDItemAppEntityInstanceIdentifier" copy:1];
}

- (NSString)appEntityInstanceId
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemAppEntityInstanceIdentifier"];
}

- (void)setAppEntityType:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"_kMDItemAppEntityTypeIdentifier" copy:1];
}

- (void)setAppEntityTypeRepresentationName:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"_kMDItemAppEntityTypeRepresentationName" copy:1];
}

- (NSString)appEntityTypeRepresentationName
{
  return (NSString *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemAppEntityTypeRepresentationName"];
}

- (void)setAppEntityTypeRepresentationSynonyms:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v4 withItemClass:objc_opt_class() forKey:@"_kMDItemAppEntityTypeRepresentationSynonyms"];
}

- (NSArray)appEntityTypeRepresentationSynonyms
{
  return (NSArray *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemAppEntityTypeRepresentationSynonyms"];
}

- (_CSEmbedding)secondaryTextEmbedding
{
  double v3 = [_CSEmbedding alloc];
  id v4 = [(CSSearchableItemAttributeSet *)self attributeForKey:@"_kMDItemSecondaryTextEmbedding"];
  id v5 = [(_CSEmbedding *)v3 initWithDictionaries:v4];

  return v5;
}

- (void)setSecondaryTextEmbedding:(id)a3
{
  id v4 = [a3 _asDictionaries];
  [(CSSearchableItemAttributeSet *)self setAttribute:v4 forKey:@"_kMDItemSecondaryTextEmbedding"];
}

- (_CSEmbedding)primaryTextEmbedding
{
  double v3 = [_CSEmbedding alloc];
  id v4 = [(CSSearchableItemAttributeSet *)self attributeForKey:@"_kMDItemPrimaryTextEmbedding"];
  id v5 = [(_CSEmbedding *)v3 initWithDictionaries:v4];

  return v5;
}

- (void)setPrimaryTextEmbedding:(id)a3
{
  id v4 = [a3 _asDictionaries];
  [(CSSearchableItemAttributeSet *)self setAttribute:v4 forKey:@"_kMDItemPrimaryTextEmbedding"];
}

- (_CSEmbedding)photoEmbedding
{
  double v3 = [_CSEmbedding alloc];
  id v4 = [(CSSearchableItemAttributeSet *)self attributeForKey:@"_kMDItemPhotoEmbedding"];
  id v5 = [(_CSEmbedding *)v3 initWithDictionaries:v4];

  return v5;
}

- (void)setPhotoEmbedding:(id)a3
{
  id v4 = [a3 _asDictionaries];
  [(CSSearchableItemAttributeSet *)self setAttribute:v4 forKey:@"_kMDItemPhotoEmbedding"];
}

- (void)setEmbeddingVersion:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"kMDItemEmbeddingVersion" copy:0];
}

- (NSNumber)embeddingVersion
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDItemEmbeddingVersion"];
}

- (void)setMediaEmbeddingVersion:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"_kMDItemMediaEmbeddingVersion" copy:0];
}

- (NSNumber)mediaEmbeddingVersion
{
  return (NSNumber *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemMediaEmbeddingVersion"];
}

- (void)setMediaAnalysisTimeRangeEmbeddings:(id)a3
{
  id v4 = a3;
  [(CSSearchableItemAttributeSet *)self _setValue:v4 withClass:objc_opt_class() forKey:@"_kMDItemMediaTimeRangeEmbeddings" copy:0];
}

- (NSData)mediaAnalysisTimeRangeEmbeddings
{
  return (NSData *)[(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"_kMDItemMediaTimeRangeEmbeddings"];
}

- (id)getAllUniqueEventAttributes
{
  v7[98] = *MEMORY[0x1E4F143B8];
  v7[0] = @"kMDItemEventName";
  v7[1] = @"kMDItemEventCustomerNames";
  v7[2] = @"kMDItemEventContactPersonNames";
  v7[3] = @"kMDItemEventProvider";
  void v7[4] = @"kMDItemEventSeatNumbers";
  v7[5] = @"kMDItemEventDuration";
  v7[6] = @"kMDItemEventTotalCost";
  v7[7] = @"kMDItemEventStatus";
  v7[8] = @"kMDItemEventRoomNumbers";
  v7[9] = @"kMDItemEventNumberOfRooms";
  v7[10] = @"kMDItemEventReservationID";
  v7[11] = @"kMDItemEventReservationForName";
  v7[12] = @"kMDItemEventTicketType";
  v7[13] = @"kMDItemEventURL";
  v7[14] = @"kMDItemEventStartLocationName";
  v7[15] = @"kMDItemEventStartLocationAddress";
  v7[16] = @"kMDItemEventStartLocationTelephone";
  v7[17] = @"kMDItemEventEndLocationName";
  v7[18] = @"kMDItemEventEndLocationAddress";
  v7[19] = @"kMDItemEventEndLocationTelephone";
  v7[20] = @"kMDItemEventType";
  v7[21] = @"kMDItemEventHotelReservationId";
  v7[22] = @"kMDItemStartDate";
  v7[23] = @"kMDItemStartDate";
  v7[24] = @"kMDItemEndDate";
  v7[25] = @"kMDItemEndDate";
  v7[26] = @"kMDItemEventHotelUnderName";
  v7[27] = @"kMDItemEventHotelTimeZone";
  v7[28] = @"kMDItemEventHotelProvider";
  v7[29] = @"kMDItemEventHotelModifyReservationUrl";
  v7[30] = @"kMDItemEventHotelReservationForName";
  v7[31] = @"kMDItemEventHotelReservationForTelephone";
  v7[32] = @"kMDItemEventHotelReservationForAddress";
  v7[33] = @"kMDItemEventHotelReservationForStreetAddress";
  v7[34] = @"kMDItemEventHotelReservationForAddressLocality";
  v7[35] = @"kMDItemEventHotelReservationForAddressRegion";
  v7[36] = @"kMDItemEventHotelReservationForAddressPostalCode";
  v7[37] = @"kMDItemEventHotelReservationForAddressCountry";
  v7[38] = @"kMDItemEventHotelReservationForAddressSynonyms";
  v7[39] = @"kMDItemEventFlightNumber";
  v7[40] = @"kMDItemEventFlightCheckInUrl";
  v7[41] = @"kMDItemEventFlightBookingInfoUrl";
  v7[42] = @"kMDItemEventFlightStatus";
  v7[43] = @"kMDItemEventFlightCarrier";
  v7[44] = @"kMDItemEventFlightCarrierCode";
  v7[45] = @"kMDItemEventFlightDesignator";
  v7[46] = @"kMDItemEndDate";
  v7[47] = @"kMDItemEventFlightArrivalTimeZone";
  v7[48] = @"kMDItemStartDate";
  v7[49] = @"kMDItemEventFlightDepartureTimeZone";
  v7[50] = @"kMDItemEventFlightArrivalAirportCode";
  v7[51] = @"kMDItemEventFlightArrivalAirportName";
  v7[52] = @"kMDItemEventFlightDepartureAirportCode";
  v7[53] = @"kMDItemEventFlightDepartureAirportName";
  v7[54] = @"kMDItemEventFlightArrivalAirportLatitude";
  v7[55] = @"kMDItemEventFlightDepartureAirportLatitude";
  v7[56] = @"kMDItemEventFlightArrivalAirportLongitude";
  v7[57] = @"kMDItemEventFlightDepartureAirportLongitude";
  v7[58] = @"kMDItemEventFlightArrivalAirportInternationalNames";
  v7[59] = @"kMDItemEventFlightDepartureAirportInternationalNames";
  v7[60] = @"kMDItemEventFlightPassengerNames";
  v7[61] = @"kMDItemEventFlightPassengerSeatNumbers";
  v7[62] = @"kMDItemEventFlightArrivalTerminal";
  v7[63] = @"kMDItemEventFlightDepartureTerminal";
  v7[64] = @"kMDItemEventFlightConfirmationNumber";
  v7[65] = @"kMDItemEventFlightArrivalAirportAddress";
  v7[66] = @"kMDItemEventFlightArrivalAirportStreetAddress";
  v7[67] = @"kMDItemEventFlightArrivalAirportLocality";
  v7[68] = @"kMDItemEventFlightArrivalAirportRegion";
  v7[69] = @"kMDItemEventFlightArrivalAirportPostalCode";
  v7[70] = @"kMDItemEventFlightArrivalAirportCountry";
  v7[71] = @"kMDItemEventFlightDepartureAirportAddress";
  v7[72] = @"kMDItemEventFlightDepartureAirportStreetAddress";
  v7[73] = @"kMDItemEventFlightDepartureAirportLocality";
  v7[74] = @"kMDItemEventFlightDepartureAirportRegion";
  v7[75] = @"kMDItemEventFlightDepartureAirportPostalCode";
  v7[76] = @"kMDItemEventFlightDepartureAirportCountry";
  v7[77] = @"kMDItemEventFlightArrivalAirportAddressSynonyms";
  v7[78] = @"kMDItemEventFlightDepartureAirportAddressSynonyms";
  v7[79] = @"kMDItemEventFlightBoardingDateTime";
  v7[80] = @"kMDItemEventFlightDepartureGate";
  v7[81] = @"kMDItemEventFlightArrivalGate";
  v7[82] = @"kMDItemEventRestaurantReservationId";
  v7[83] = @"kMDItemEventRestaurantUnderName";
  v7[84] = @"kMDItemStartDate";
  v7[85] = @"kMDItemStartDate";
  v7[86] = @"kMDItemEventRestaurantTimeZone";
  v7[87] = @"kMDItemEventRestaurantPartySize";
  v7[88] = @"kMDItemEventRestaurantMealType";
  v7[89] = @"kMDItemEventRestaurantReservationForName";
  v7[90] = @"kMDItemEventRestaurantReservationForTelephone";
  v7[91] = @"kMDItemEventRestaurantReservationForAddress";
  v7[92] = @"kMDItemEventRestaurantReservationForStreetAddress";
  v7[93] = @"kMDItemEventRestaurantReservationForAddressLocality";
  v7[94] = @"kMDItemEventRestaurantReservationForAddressRegion";
  v7[95] = @"kMDItemEventRestaurantReservationForAddressPostalCode";
  v7[96] = @"kMDItemEventRestaurantReservationForAddressCountry";
  v7[97] = @"kMDItemEventRestaurantReservationForAddressSynonyms";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:98];
  double v3 = (void *)getAllUniqueEventAttributes_attrs;
  getAllUniqueEventAttributes_attrs = v2;

  id v4 = [MEMORY[0x1E4F1CAD0] setWithArray:getAllUniqueEventAttributes_attrs];
  id v5 = [v4 allObjects];

  return v5;
}

- (void)_setValue:withClass:forKey:copy:.cold.1()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_0_3(v0);
  OUTLINED_FUNCTION_1_2(&dword_18D0E3000, v2, v3, "Invalid value type:%@ for key:%@", v4, v5, v6, v7, v8);
}

- (void)_setDictionaryValue:withValueClass:keyClass:forKey:.cold.1()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_2_2(v0);
  OUTLINED_FUNCTION_3_1(&dword_18D0E3000, v2, v3, "Invalid key value type:%@ for the item %@ in the dictionary for key:%@", v4, v5, v6, v7, v8);
}

- (void)_setDictionaryValue:withValueClass:keyClass:forKey:.cold.2()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_2_2(v0);
  OUTLINED_FUNCTION_3_1(&dword_18D0E3000, v2, v3, "Invalid value type:%@ for the item %@ in the dictionary for key:%@", v4, v5, v6, v7, v8);
}

@end