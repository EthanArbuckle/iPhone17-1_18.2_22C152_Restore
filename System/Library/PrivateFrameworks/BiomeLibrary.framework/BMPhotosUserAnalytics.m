@interface BMPhotosUserAnalytics
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMPhotosUserAnalytics)initWithIdentifier:(id)a3 userEvent:(id)a4 containsVIP:(id)a5 faceCount:(id)a6 containsPets:(id)a7 capturedAtHome:(id)a8 capturedAtWork:(id)a9 capturedAtFrequentLocation:(id)a10 capturedOnTrip:(id)a11 capturedOnShortTrip:(id)a12 isDocument:(id)a13 isMeme:(id)a14 isScreenshot:(id)a15 isFavorite:(id)a16 isCapturedOnWeekend:(id)a17 isCapturedAtPrivateEvent:(id)a18 isCapturedOnHoliday:(id)a19 mediaType:(int)a20 importSource:(int)a21 assetAge:(int)a22 userLibrarySize:(int)a23 userNumTrips:(id)a24 userNumVIPPeople:(id)a25 userNumFavorites:(id)a26 userHasVIP:(id)a27 userHasHome:(id)a28 userHasPet:(id)a29 containsBaby:(id)a30 containsSocialGroup:(id)a31 containsMyPet:(id)a32 containsCoWorker:(id)a33 containsFamily:(id)a34 containsFriends:(id)a35 containsPartner:(id)a36 containsParent:(id)a37 containsSibling:(id)a38 containsChild:(id)a39 isCoupon:(id)a40 isRecipe:(id)a41 isReceipt:(id)a42 isRecentView:(id)a43 isRecentEdit:(id)a44 isRecentShare:(id)a45 isRecentFavorite:(id)a46 isContainedInSharedAlbum:(id)a47 isContainedInOnThisDay:(id)a48 capturedAtAOI:(id)a49 capturedAtPOI:(id)a50 capturedAtROI:(id)a51 capturedAtBusiness:(id)a52 isCapturedAtPublicEvent:(id)a53 isContainedInVisualTrend:(id)a54 isContainedInActivity:(id)a55 isContainedInChildActivity:(id)a56 userLibraryAgeInDays:(int)a57 userisDAU:(id)a58;
- (BMPhotosUserAnalytics)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)capturedAtAOI;
- (BOOL)capturedAtBusiness;
- (BOOL)capturedAtFrequentLocation;
- (BOOL)capturedAtHome;
- (BOOL)capturedAtPOI;
- (BOOL)capturedAtROI;
- (BOOL)capturedAtWork;
- (BOOL)capturedOnShortTrip;
- (BOOL)capturedOnTrip;
- (BOOL)containsBaby;
- (BOOL)containsChild;
- (BOOL)containsCoWorker;
- (BOOL)containsFamily;
- (BOOL)containsFriends;
- (BOOL)containsMyPet;
- (BOOL)containsParent;
- (BOOL)containsPartner;
- (BOOL)containsPets;
- (BOOL)containsSibling;
- (BOOL)containsSocialGroup;
- (BOOL)containsVIP;
- (BOOL)hasCapturedAtAOI;
- (BOOL)hasCapturedAtBusiness;
- (BOOL)hasCapturedAtFrequentLocation;
- (BOOL)hasCapturedAtHome;
- (BOOL)hasCapturedAtPOI;
- (BOOL)hasCapturedAtROI;
- (BOOL)hasCapturedAtWork;
- (BOOL)hasCapturedOnShortTrip;
- (BOOL)hasCapturedOnTrip;
- (BOOL)hasContainsBaby;
- (BOOL)hasContainsChild;
- (BOOL)hasContainsCoWorker;
- (BOOL)hasContainsFamily;
- (BOOL)hasContainsFriends;
- (BOOL)hasContainsMyPet;
- (BOOL)hasContainsParent;
- (BOOL)hasContainsPartner;
- (BOOL)hasContainsPets;
- (BOOL)hasContainsSibling;
- (BOOL)hasContainsSocialGroup;
- (BOOL)hasContainsVIP;
- (BOOL)hasFaceCount;
- (BOOL)hasIsCapturedAtPrivateEvent;
- (BOOL)hasIsCapturedAtPublicEvent;
- (BOOL)hasIsCapturedOnHoliday;
- (BOOL)hasIsCapturedOnWeekend;
- (BOOL)hasIsContainedInActivity;
- (BOOL)hasIsContainedInChildActivity;
- (BOOL)hasIsContainedInOnThisDay;
- (BOOL)hasIsContainedInSharedAlbum;
- (BOOL)hasIsContainedInVisualTrend;
- (BOOL)hasIsCoupon;
- (BOOL)hasIsDocument;
- (BOOL)hasIsFavorite;
- (BOOL)hasIsMeme;
- (BOOL)hasIsReceipt;
- (BOOL)hasIsRecentEdit;
- (BOOL)hasIsRecentFavorite;
- (BOOL)hasIsRecentShare;
- (BOOL)hasIsRecentView;
- (BOOL)hasIsRecipe;
- (BOOL)hasIsScreenshot;
- (BOOL)hasUserHasHome;
- (BOOL)hasUserHasPet;
- (BOOL)hasUserHasVIP;
- (BOOL)hasUserNumFavorites;
- (BOOL)hasUserNumTrips;
- (BOOL)hasUserNumVIPPeople;
- (BOOL)hasUserisDAU;
- (BOOL)isCapturedAtPrivateEvent;
- (BOOL)isCapturedAtPublicEvent;
- (BOOL)isCapturedOnHoliday;
- (BOOL)isCapturedOnWeekend;
- (BOOL)isContainedInActivity;
- (BOOL)isContainedInChildActivity;
- (BOOL)isContainedInOnThisDay;
- (BOOL)isContainedInSharedAlbum;
- (BOOL)isContainedInVisualTrend;
- (BOOL)isCoupon;
- (BOOL)isDocument;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFavorite;
- (BOOL)isMeme;
- (BOOL)isReceipt;
- (BOOL)isRecentEdit;
- (BOOL)isRecentFavorite;
- (BOOL)isRecentShare;
- (BOOL)isRecentView;
- (BOOL)isRecipe;
- (BOOL)isScreenshot;
- (BOOL)userHasHome;
- (BOOL)userHasPet;
- (BOOL)userHasVIP;
- (NSString)description;
- (NSString)identifier;
- (NSString)userEvent;
- (double)userisDAU;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)assetAge;
- (int)faceCount;
- (int)importSource;
- (int)mediaType;
- (int)userLibraryAgeInDays;
- (int)userLibrarySize;
- (int)userNumFavorites;
- (int)userNumTrips;
- (int)userNumVIPPeople;
- (unsigned)dataVersion;
- (void)setHasCapturedAtAOI:(BOOL)a3;
- (void)setHasCapturedAtBusiness:(BOOL)a3;
- (void)setHasCapturedAtFrequentLocation:(BOOL)a3;
- (void)setHasCapturedAtHome:(BOOL)a3;
- (void)setHasCapturedAtPOI:(BOOL)a3;
- (void)setHasCapturedAtROI:(BOOL)a3;
- (void)setHasCapturedAtWork:(BOOL)a3;
- (void)setHasCapturedOnShortTrip:(BOOL)a3;
- (void)setHasCapturedOnTrip:(BOOL)a3;
- (void)setHasContainsBaby:(BOOL)a3;
- (void)setHasContainsChild:(BOOL)a3;
- (void)setHasContainsCoWorker:(BOOL)a3;
- (void)setHasContainsFamily:(BOOL)a3;
- (void)setHasContainsFriends:(BOOL)a3;
- (void)setHasContainsMyPet:(BOOL)a3;
- (void)setHasContainsParent:(BOOL)a3;
- (void)setHasContainsPartner:(BOOL)a3;
- (void)setHasContainsPets:(BOOL)a3;
- (void)setHasContainsSibling:(BOOL)a3;
- (void)setHasContainsSocialGroup:(BOOL)a3;
- (void)setHasContainsVIP:(BOOL)a3;
- (void)setHasFaceCount:(BOOL)a3;
- (void)setHasIsCapturedAtPrivateEvent:(BOOL)a3;
- (void)setHasIsCapturedAtPublicEvent:(BOOL)a3;
- (void)setHasIsCapturedOnHoliday:(BOOL)a3;
- (void)setHasIsCapturedOnWeekend:(BOOL)a3;
- (void)setHasIsContainedInActivity:(BOOL)a3;
- (void)setHasIsContainedInChildActivity:(BOOL)a3;
- (void)setHasIsContainedInOnThisDay:(BOOL)a3;
- (void)setHasIsContainedInSharedAlbum:(BOOL)a3;
- (void)setHasIsContainedInVisualTrend:(BOOL)a3;
- (void)setHasIsCoupon:(BOOL)a3;
- (void)setHasIsDocument:(BOOL)a3;
- (void)setHasIsFavorite:(BOOL)a3;
- (void)setHasIsMeme:(BOOL)a3;
- (void)setHasIsReceipt:(BOOL)a3;
- (void)setHasIsRecentEdit:(BOOL)a3;
- (void)setHasIsRecentFavorite:(BOOL)a3;
- (void)setHasIsRecentShare:(BOOL)a3;
- (void)setHasIsRecentView:(BOOL)a3;
- (void)setHasIsRecipe:(BOOL)a3;
- (void)setHasIsScreenshot:(BOOL)a3;
- (void)setHasUserHasHome:(BOOL)a3;
- (void)setHasUserHasPet:(BOOL)a3;
- (void)setHasUserHasVIP:(BOOL)a3;
- (void)setHasUserNumFavorites:(BOOL)a3;
- (void)setHasUserNumTrips:(BOOL)a3;
- (void)setHasUserNumVIPPeople:(BOOL)a3;
- (void)setHasUserisDAU:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPhotosUserAnalytics

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userEvent, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setHasUserisDAU:(BOOL)a3
{
  self->_hasUserisDAU = a3;
}

- (BOOL)hasUserisDAU
{
  return self->_hasUserisDAU;
}

- (double)userisDAU
{
  return self->_userisDAU;
}

- (int)userLibraryAgeInDays
{
  return self->_userLibraryAgeInDays;
}

- (void)setHasIsContainedInChildActivity:(BOOL)a3
{
  self->_hasIsContainedInChildActivity = a3;
}

- (BOOL)hasIsContainedInChildActivity
{
  return self->_hasIsContainedInChildActivity;
}

- (BOOL)isContainedInChildActivity
{
  return self->_isContainedInChildActivity;
}

- (void)setHasIsContainedInActivity:(BOOL)a3
{
  self->_hasIsContainedInActivity = a3;
}

- (BOOL)hasIsContainedInActivity
{
  return self->_hasIsContainedInActivity;
}

- (BOOL)isContainedInActivity
{
  return self->_isContainedInActivity;
}

- (void)setHasIsContainedInVisualTrend:(BOOL)a3
{
  self->_hasIsContainedInVisualTrend = a3;
}

- (BOOL)hasIsContainedInVisualTrend
{
  return self->_hasIsContainedInVisualTrend;
}

- (BOOL)isContainedInVisualTrend
{
  return self->_isContainedInVisualTrend;
}

- (void)setHasIsCapturedAtPublicEvent:(BOOL)a3
{
  self->_hasIsCapturedAtPublicEvent = a3;
}

- (BOOL)hasIsCapturedAtPublicEvent
{
  return self->_hasIsCapturedAtPublicEvent;
}

- (BOOL)isCapturedAtPublicEvent
{
  return self->_isCapturedAtPublicEvent;
}

- (void)setHasCapturedAtBusiness:(BOOL)a3
{
  self->_hasCapturedAtBusiness = a3;
}

- (BOOL)hasCapturedAtBusiness
{
  return self->_hasCapturedAtBusiness;
}

- (BOOL)capturedAtBusiness
{
  return self->_capturedAtBusiness;
}

- (void)setHasCapturedAtROI:(BOOL)a3
{
  self->_hasCapturedAtROI = a3;
}

- (BOOL)hasCapturedAtROI
{
  return self->_hasCapturedAtROI;
}

- (BOOL)capturedAtROI
{
  return self->_capturedAtROI;
}

- (void)setHasCapturedAtPOI:(BOOL)a3
{
  self->_hasCapturedAtPOI = a3;
}

- (BOOL)hasCapturedAtPOI
{
  return self->_hasCapturedAtPOI;
}

- (BOOL)capturedAtPOI
{
  return self->_capturedAtPOI;
}

- (void)setHasCapturedAtAOI:(BOOL)a3
{
  self->_hasCapturedAtAOI = a3;
}

- (BOOL)hasCapturedAtAOI
{
  return self->_hasCapturedAtAOI;
}

- (BOOL)capturedAtAOI
{
  return self->_capturedAtAOI;
}

- (void)setHasIsContainedInOnThisDay:(BOOL)a3
{
  self->_hasIsContainedInOnThisDay = a3;
}

- (BOOL)hasIsContainedInOnThisDay
{
  return self->_hasIsContainedInOnThisDay;
}

- (BOOL)isContainedInOnThisDay
{
  return self->_isContainedInOnThisDay;
}

- (void)setHasIsContainedInSharedAlbum:(BOOL)a3
{
  self->_hasIsContainedInSharedAlbum = a3;
}

- (BOOL)hasIsContainedInSharedAlbum
{
  return self->_hasIsContainedInSharedAlbum;
}

- (BOOL)isContainedInSharedAlbum
{
  return self->_isContainedInSharedAlbum;
}

- (void)setHasIsRecentFavorite:(BOOL)a3
{
  self->_hasIsRecentFavorite = a3;
}

- (BOOL)hasIsRecentFavorite
{
  return self->_hasIsRecentFavorite;
}

- (BOOL)isRecentFavorite
{
  return self->_isRecentFavorite;
}

- (void)setHasIsRecentShare:(BOOL)a3
{
  self->_hasIsRecentShare = a3;
}

- (BOOL)hasIsRecentShare
{
  return self->_hasIsRecentShare;
}

- (BOOL)isRecentShare
{
  return self->_isRecentShare;
}

- (void)setHasIsRecentEdit:(BOOL)a3
{
  self->_hasIsRecentEdit = a3;
}

- (BOOL)hasIsRecentEdit
{
  return self->_hasIsRecentEdit;
}

- (BOOL)isRecentEdit
{
  return self->_isRecentEdit;
}

- (void)setHasIsRecentView:(BOOL)a3
{
  self->_hasIsRecentView = a3;
}

- (BOOL)hasIsRecentView
{
  return self->_hasIsRecentView;
}

- (BOOL)isRecentView
{
  return self->_isRecentView;
}

- (void)setHasIsReceipt:(BOOL)a3
{
  self->_hasIsReceipt = a3;
}

- (BOOL)hasIsReceipt
{
  return self->_hasIsReceipt;
}

- (BOOL)isReceipt
{
  return self->_isReceipt;
}

- (void)setHasIsRecipe:(BOOL)a3
{
  self->_hasIsRecipe = a3;
}

- (BOOL)hasIsRecipe
{
  return self->_hasIsRecipe;
}

- (BOOL)isRecipe
{
  return self->_isRecipe;
}

- (void)setHasIsCoupon:(BOOL)a3
{
  self->_hasIsCoupon = a3;
}

- (BOOL)hasIsCoupon
{
  return self->_hasIsCoupon;
}

- (BOOL)isCoupon
{
  return self->_isCoupon;
}

- (void)setHasContainsChild:(BOOL)a3
{
  self->_hasContainsChild = a3;
}

- (BOOL)hasContainsChild
{
  return self->_hasContainsChild;
}

- (BOOL)containsChild
{
  return self->_containsChild;
}

- (void)setHasContainsSibling:(BOOL)a3
{
  self->_hasContainsSibling = a3;
}

- (BOOL)hasContainsSibling
{
  return self->_hasContainsSibling;
}

- (BOOL)containsSibling
{
  return self->_containsSibling;
}

- (void)setHasContainsParent:(BOOL)a3
{
  self->_hasContainsParent = a3;
}

- (BOOL)hasContainsParent
{
  return self->_hasContainsParent;
}

- (BOOL)containsParent
{
  return self->_containsParent;
}

- (void)setHasContainsPartner:(BOOL)a3
{
  self->_hasContainsPartner = a3;
}

- (BOOL)hasContainsPartner
{
  return self->_hasContainsPartner;
}

- (BOOL)containsPartner
{
  return self->_containsPartner;
}

- (void)setHasContainsFriends:(BOOL)a3
{
  self->_hasContainsFriends = a3;
}

- (BOOL)hasContainsFriends
{
  return self->_hasContainsFriends;
}

- (BOOL)containsFriends
{
  return self->_containsFriends;
}

- (void)setHasContainsFamily:(BOOL)a3
{
  self->_hasContainsFamily = a3;
}

- (BOOL)hasContainsFamily
{
  return self->_hasContainsFamily;
}

- (BOOL)containsFamily
{
  return self->_containsFamily;
}

- (void)setHasContainsCoWorker:(BOOL)a3
{
  self->_hasContainsCoWorker = a3;
}

- (BOOL)hasContainsCoWorker
{
  return self->_hasContainsCoWorker;
}

- (BOOL)containsCoWorker
{
  return self->_containsCoWorker;
}

- (void)setHasContainsMyPet:(BOOL)a3
{
  self->_hasContainsMyPet = a3;
}

- (BOOL)hasContainsMyPet
{
  return self->_hasContainsMyPet;
}

- (BOOL)containsMyPet
{
  return self->_containsMyPet;
}

- (void)setHasContainsSocialGroup:(BOOL)a3
{
  self->_hasContainsSocialGroup = a3;
}

- (BOOL)hasContainsSocialGroup
{
  return self->_hasContainsSocialGroup;
}

- (BOOL)containsSocialGroup
{
  return self->_containsSocialGroup;
}

- (void)setHasContainsBaby:(BOOL)a3
{
  self->_hasContainsBaby = a3;
}

- (BOOL)hasContainsBaby
{
  return self->_hasContainsBaby;
}

- (BOOL)containsBaby
{
  return self->_containsBaby;
}

- (void)setHasUserHasPet:(BOOL)a3
{
  self->_hasUserHasPet = a3;
}

- (BOOL)hasUserHasPet
{
  return self->_hasUserHasPet;
}

- (BOOL)userHasPet
{
  return self->_userHasPet;
}

- (void)setHasUserHasHome:(BOOL)a3
{
  self->_hasUserHasHome = a3;
}

- (BOOL)hasUserHasHome
{
  return self->_hasUserHasHome;
}

- (BOOL)userHasHome
{
  return self->_userHasHome;
}

- (void)setHasUserHasVIP:(BOOL)a3
{
  self->_hasUserHasVIP = a3;
}

- (BOOL)hasUserHasVIP
{
  return self->_hasUserHasVIP;
}

- (BOOL)userHasVIP
{
  return self->_userHasVIP;
}

- (void)setHasUserNumFavorites:(BOOL)a3
{
  self->_hasUserNumFavorites = a3;
}

- (BOOL)hasUserNumFavorites
{
  return self->_hasUserNumFavorites;
}

- (int)userNumFavorites
{
  return self->_userNumFavorites;
}

- (void)setHasUserNumVIPPeople:(BOOL)a3
{
  self->_hasUserNumVIPPeople = a3;
}

- (BOOL)hasUserNumVIPPeople
{
  return self->_hasUserNumVIPPeople;
}

- (int)userNumVIPPeople
{
  return self->_userNumVIPPeople;
}

- (void)setHasUserNumTrips:(BOOL)a3
{
  self->_hasUserNumTrips = a3;
}

- (BOOL)hasUserNumTrips
{
  return self->_hasUserNumTrips;
}

- (int)userNumTrips
{
  return self->_userNumTrips;
}

- (int)userLibrarySize
{
  return self->_userLibrarySize;
}

- (int)assetAge
{
  return self->_assetAge;
}

- (int)importSource
{
  return self->_importSource;
}

- (int)mediaType
{
  return self->_mediaType;
}

- (void)setHasIsCapturedOnHoliday:(BOOL)a3
{
  self->_hasIsCapturedOnHoliday = a3;
}

- (BOOL)hasIsCapturedOnHoliday
{
  return self->_hasIsCapturedOnHoliday;
}

- (BOOL)isCapturedOnHoliday
{
  return self->_isCapturedOnHoliday;
}

- (void)setHasIsCapturedAtPrivateEvent:(BOOL)a3
{
  self->_hasIsCapturedAtPrivateEvent = a3;
}

- (BOOL)hasIsCapturedAtPrivateEvent
{
  return self->_hasIsCapturedAtPrivateEvent;
}

- (BOOL)isCapturedAtPrivateEvent
{
  return self->_isCapturedAtPrivateEvent;
}

- (void)setHasIsCapturedOnWeekend:(BOOL)a3
{
  self->_hasIsCapturedOnWeekend = a3;
}

- (BOOL)hasIsCapturedOnWeekend
{
  return self->_hasIsCapturedOnWeekend;
}

- (BOOL)isCapturedOnWeekend
{
  return self->_isCapturedOnWeekend;
}

- (void)setHasIsFavorite:(BOOL)a3
{
  self->_hasIsFavorite = a3;
}

- (BOOL)hasIsFavorite
{
  return self->_hasIsFavorite;
}

- (BOOL)isFavorite
{
  return self->_isFavorite;
}

- (void)setHasIsScreenshot:(BOOL)a3
{
  self->_hasIsScreenshot = a3;
}

- (BOOL)hasIsScreenshot
{
  return self->_hasIsScreenshot;
}

- (BOOL)isScreenshot
{
  return self->_isScreenshot;
}

- (void)setHasIsMeme:(BOOL)a3
{
  self->_hasIsMeme = a3;
}

- (BOOL)hasIsMeme
{
  return self->_hasIsMeme;
}

- (BOOL)isMeme
{
  return self->_isMeme;
}

- (void)setHasIsDocument:(BOOL)a3
{
  self->_hasIsDocument = a3;
}

- (BOOL)hasIsDocument
{
  return self->_hasIsDocument;
}

- (BOOL)isDocument
{
  return self->_isDocument;
}

- (void)setHasCapturedOnShortTrip:(BOOL)a3
{
  self->_hasCapturedOnShortTrip = a3;
}

- (BOOL)hasCapturedOnShortTrip
{
  return self->_hasCapturedOnShortTrip;
}

- (BOOL)capturedOnShortTrip
{
  return self->_capturedOnShortTrip;
}

- (void)setHasCapturedOnTrip:(BOOL)a3
{
  self->_hasCapturedOnTrip = a3;
}

- (BOOL)hasCapturedOnTrip
{
  return self->_hasCapturedOnTrip;
}

- (BOOL)capturedOnTrip
{
  return self->_capturedOnTrip;
}

- (void)setHasCapturedAtFrequentLocation:(BOOL)a3
{
  self->_hasCapturedAtFrequentLocation = a3;
}

- (BOOL)hasCapturedAtFrequentLocation
{
  return self->_hasCapturedAtFrequentLocation;
}

- (BOOL)capturedAtFrequentLocation
{
  return self->_capturedAtFrequentLocation;
}

- (void)setHasCapturedAtWork:(BOOL)a3
{
  self->_hasCapturedAtWork = a3;
}

- (BOOL)hasCapturedAtWork
{
  return self->_hasCapturedAtWork;
}

- (BOOL)capturedAtWork
{
  return self->_capturedAtWork;
}

- (void)setHasCapturedAtHome:(BOOL)a3
{
  self->_hasCapturedAtHome = a3;
}

- (BOOL)hasCapturedAtHome
{
  return self->_hasCapturedAtHome;
}

- (BOOL)capturedAtHome
{
  return self->_capturedAtHome;
}

- (void)setHasContainsPets:(BOOL)a3
{
  self->_hasContainsPets = a3;
}

- (BOOL)hasContainsPets
{
  return self->_hasContainsPets;
}

- (BOOL)containsPets
{
  return self->_containsPets;
}

- (void)setHasFaceCount:(BOOL)a3
{
  self->_hasFaceCount = a3;
}

- (BOOL)hasFaceCount
{
  return self->_hasFaceCount;
}

- (int)faceCount
{
  return self->_faceCount;
}

- (void)setHasContainsVIP:(BOOL)a3
{
  self->_hasContainsVIP = a3;
}

- (BOOL)hasContainsVIP
{
  return self->_hasContainsVIP;
}

- (BOOL)containsVIP
{
  return self->_containsVIP;
}

- (NSString)userEvent
{
  return self->_userEvent;
}

- (NSString)identifier
{
  return self->_identifier;
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
    v6 = [(BMPhotosUserAnalytics *)self identifier];
    uint64_t v7 = [v5 identifier];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMPhotosUserAnalytics *)self identifier];
      v10 = [v5 identifier];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_261;
      }
    }
    v13 = [(BMPhotosUserAnalytics *)self userEvent];
    uint64_t v14 = [v5 userEvent];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMPhotosUserAnalytics *)self userEvent];
      v17 = [v5 userEvent];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_261;
      }
    }
    if (![(BMPhotosUserAnalytics *)self hasContainsVIP]
      && ![v5 hasContainsVIP]
      || [(BMPhotosUserAnalytics *)self hasContainsVIP]
      && [v5 hasContainsVIP]
      && (int v19 = [(BMPhotosUserAnalytics *)self containsVIP],
          v19 == [v5 containsVIP]))
    {
      if (![(BMPhotosUserAnalytics *)self hasFaceCount]
        && ![v5 hasFaceCount]
        || [(BMPhotosUserAnalytics *)self hasFaceCount]
        && [v5 hasFaceCount]
        && (int v20 = [(BMPhotosUserAnalytics *)self faceCount],
            v20 == [v5 faceCount]))
      {
        if (![(BMPhotosUserAnalytics *)self hasContainsPets]
          && ![v5 hasContainsPets]
          || [(BMPhotosUserAnalytics *)self hasContainsPets]
          && [v5 hasContainsPets]
          && (int v21 = [(BMPhotosUserAnalytics *)self containsPets],
              v21 == [v5 containsPets]))
        {
          if (![(BMPhotosUserAnalytics *)self hasCapturedAtHome]
            && ![v5 hasCapturedAtHome]
            || [(BMPhotosUserAnalytics *)self hasCapturedAtHome]
            && [v5 hasCapturedAtHome]
            && (int v22 = [(BMPhotosUserAnalytics *)self capturedAtHome],
                v22 == [v5 capturedAtHome]))
          {
            if (![(BMPhotosUserAnalytics *)self hasCapturedAtWork]
              && ![v5 hasCapturedAtWork]
              || [(BMPhotosUserAnalytics *)self hasCapturedAtWork]
              && [v5 hasCapturedAtWork]
              && (int v23 = [(BMPhotosUserAnalytics *)self capturedAtWork],
                  v23 == [v5 capturedAtWork]))
            {
              if (![(BMPhotosUserAnalytics *)self hasCapturedAtFrequentLocation]
                && ![v5 hasCapturedAtFrequentLocation]
                || [(BMPhotosUserAnalytics *)self hasCapturedAtFrequentLocation]
                && [v5 hasCapturedAtFrequentLocation]
                && (int v24 = [(BMPhotosUserAnalytics *)self capturedAtFrequentLocation],
                    v24 == [v5 capturedAtFrequentLocation]))
              {
                if (![(BMPhotosUserAnalytics *)self hasCapturedOnTrip]
                  && ![v5 hasCapturedOnTrip]
                  || [(BMPhotosUserAnalytics *)self hasCapturedOnTrip]
                  && [v5 hasCapturedOnTrip]
                  && (int v25 = [(BMPhotosUserAnalytics *)self capturedOnTrip],
                      v25 == [v5 capturedOnTrip]))
                {
                  if (![(BMPhotosUserAnalytics *)self hasCapturedOnShortTrip]
                    && ![v5 hasCapturedOnShortTrip]
                    || [(BMPhotosUserAnalytics *)self hasCapturedOnShortTrip]
                    && [v5 hasCapturedOnShortTrip]
                    && (int v26 = [(BMPhotosUserAnalytics *)self capturedOnShortTrip],
                        v26 == [v5 capturedOnShortTrip]))
                  {
                    if (![(BMPhotosUserAnalytics *)self hasIsDocument]
                      && ![v5 hasIsDocument]
                      || [(BMPhotosUserAnalytics *)self hasIsDocument]
                      && [v5 hasIsDocument]
                      && (int v27 = [(BMPhotosUserAnalytics *)self isDocument],
                          v27 == [v5 isDocument]))
                    {
                      if (![(BMPhotosUserAnalytics *)self hasIsMeme]
                        && ![v5 hasIsMeme]
                        || [(BMPhotosUserAnalytics *)self hasIsMeme]
                        && [v5 hasIsMeme]
                        && (int v28 = [(BMPhotosUserAnalytics *)self isMeme],
                            v28 == [v5 isMeme]))
                      {
                        if (![(BMPhotosUserAnalytics *)self hasIsScreenshot]
                          && ![v5 hasIsScreenshot]
                          || [(BMPhotosUserAnalytics *)self hasIsScreenshot]
                          && [v5 hasIsScreenshot]
                          && (int v29 = [(BMPhotosUserAnalytics *)self isScreenshot],
                              v29 == [v5 isScreenshot]))
                        {
                          if (![(BMPhotosUserAnalytics *)self hasIsFavorite]
                            && ![v5 hasIsFavorite]
                            || [(BMPhotosUserAnalytics *)self hasIsFavorite]
                            && [v5 hasIsFavorite]
                            && (int v30 = [(BMPhotosUserAnalytics *)self isFavorite],
                                v30 == [v5 isFavorite]))
                          {
                            if (![(BMPhotosUserAnalytics *)self hasIsCapturedOnWeekend]
                              && ![v5 hasIsCapturedOnWeekend]
                              || [(BMPhotosUserAnalytics *)self hasIsCapturedOnWeekend]
                              && [v5 hasIsCapturedOnWeekend]
                              && (int v31 = [(BMPhotosUserAnalytics *)self isCapturedOnWeekend],
                                  v31 == [v5 isCapturedOnWeekend]))
                            {
                              if (!-[BMPhotosUserAnalytics hasIsCapturedAtPrivateEvent](self, "hasIsCapturedAtPrivateEvent")&& ![v5 hasIsCapturedAtPrivateEvent]|| -[BMPhotosUserAnalytics hasIsCapturedAtPrivateEvent](self, "hasIsCapturedAtPrivateEvent")&& objc_msgSend(v5, "hasIsCapturedAtPrivateEvent")&& (int v32 = -[BMPhotosUserAnalytics isCapturedAtPrivateEvent](self, "isCapturedAtPrivateEvent"), v32 == objc_msgSend(v5, "isCapturedAtPrivateEvent")))
                              {
                                if (![(BMPhotosUserAnalytics *)self hasIsCapturedOnHoliday]
                                  && ![v5 hasIsCapturedOnHoliday]
                                  || [(BMPhotosUserAnalytics *)self hasIsCapturedOnHoliday]
                                  && [v5 hasIsCapturedOnHoliday]
                                  && (int v33 = [(BMPhotosUserAnalytics *)self isCapturedOnHoliday],
                                      v33 == [v5 isCapturedOnHoliday]))
                                {
                                  int v34 = [(BMPhotosUserAnalytics *)self mediaType];
                                  if (v34 == [v5 mediaType])
                                  {
                                    int v35 = [(BMPhotosUserAnalytics *)self importSource];
                                    if (v35 == [v5 importSource])
                                    {
                                      int v36 = [(BMPhotosUserAnalytics *)self assetAge];
                                      if (v36 == [v5 assetAge])
                                      {
                                        int v37 = [(BMPhotosUserAnalytics *)self userLibrarySize];
                                        if (v37 == [v5 userLibrarySize])
                                        {
                                          if (![(BMPhotosUserAnalytics *)self hasUserNumTrips]
                                            && ![v5 hasUserNumTrips]
                                            || [(BMPhotosUserAnalytics *)self hasUserNumTrips]
                                            && [v5 hasUserNumTrips]
                                            && (int v38 = [(BMPhotosUserAnalytics *)self userNumTrips],
                                                v38 == [v5 userNumTrips]))
                                          {
                                            if (!-[BMPhotosUserAnalytics hasUserNumVIPPeople](self, "hasUserNumVIPPeople")&& ![v5 hasUserNumVIPPeople]|| -[BMPhotosUserAnalytics hasUserNumVIPPeople](self, "hasUserNumVIPPeople")&& objc_msgSend(v5, "hasUserNumVIPPeople")&& (int v39 = -[BMPhotosUserAnalytics userNumVIPPeople](self, "userNumVIPPeople"), v39 == objc_msgSend(v5, "userNumVIPPeople")))
                                            {
                                              if (!-[BMPhotosUserAnalytics hasUserNumFavorites](self, "hasUserNumFavorites")&& ![v5 hasUserNumFavorites]|| -[BMPhotosUserAnalytics hasUserNumFavorites](self, "hasUserNumFavorites")&& objc_msgSend(v5, "hasUserNumFavorites")&& (int v40 = -[BMPhotosUserAnalytics userNumFavorites](self, "userNumFavorites"), v40 == objc_msgSend(v5, "userNumFavorites")))
                                              {
                                                if (![(BMPhotosUserAnalytics *)self hasUserHasVIP]
                                                  && ![v5 hasUserHasVIP]
                                                  || [(BMPhotosUserAnalytics *)self hasUserHasVIP]
                                                  && [v5 hasUserHasVIP]
                                                  && (int v41 = [(BMPhotosUserAnalytics *)self userHasVIP],
                                                      v41 == [v5 userHasVIP]))
                                                {
                                                  if (![(BMPhotosUserAnalytics *)self hasUserHasHome]
                                                    && ![v5 hasUserHasHome]
                                                    || [(BMPhotosUserAnalytics *)self hasUserHasHome]
                                                    && [v5 hasUserHasHome]
                                                    && (int v42 = [(BMPhotosUserAnalytics *)self userHasHome],
                                                        v42 == [v5 userHasHome]))
                                                  {
                                                    if (![(BMPhotosUserAnalytics *)self hasUserHasPet]
                                                      && ![v5 hasUserHasPet]
                                                      || [(BMPhotosUserAnalytics *)self hasUserHasPet]
                                                      && [v5 hasUserHasPet]
                                                      && (int v43 = [(BMPhotosUserAnalytics *)self userHasPet],
                                                          v43 == [v5 userHasPet]))
                                                    {
                                                      if (!-[BMPhotosUserAnalytics hasContainsBaby](self, "hasContainsBaby")&& ![v5 hasContainsBaby]|| -[BMPhotosUserAnalytics hasContainsBaby](self, "hasContainsBaby")&& objc_msgSend(v5, "hasContainsBaby")&& (int v44 = -[BMPhotosUserAnalytics containsBaby](self, "containsBaby"), v44 == objc_msgSend(v5, "containsBaby")))
                                                      {
                                                        if (!-[BMPhotosUserAnalytics hasContainsSocialGroup](self, "hasContainsSocialGroup")&& ![v5 hasContainsSocialGroup]|| -[BMPhotosUserAnalytics hasContainsSocialGroup](self, "hasContainsSocialGroup")&& objc_msgSend(v5, "hasContainsSocialGroup")&& (int v45 = -[BMPhotosUserAnalytics containsSocialGroup](self, "containsSocialGroup"), v45 == objc_msgSend(v5, "containsSocialGroup")))
                                                        {
                                                          if (!-[BMPhotosUserAnalytics hasContainsMyPet](self, "hasContainsMyPet")&& ![v5 hasContainsMyPet]|| -[BMPhotosUserAnalytics hasContainsMyPet](self, "hasContainsMyPet")&& objc_msgSend(v5, "hasContainsMyPet")&& (int v46 = -[BMPhotosUserAnalytics containsMyPet](self, "containsMyPet"), v46 == objc_msgSend(v5, "containsMyPet")))
                                                          {
                                                            if (!-[BMPhotosUserAnalytics hasContainsCoWorker](self, "hasContainsCoWorker")&& ![v5 hasContainsCoWorker]|| -[BMPhotosUserAnalytics hasContainsCoWorker](self, "hasContainsCoWorker")&& objc_msgSend(v5, "hasContainsCoWorker")&& (int v47 = -[BMPhotosUserAnalytics containsCoWorker](self, "containsCoWorker"), v47 == objc_msgSend(v5, "containsCoWorker")))
                                                            {
                                                              if (!-[BMPhotosUserAnalytics hasContainsFamily](self, "hasContainsFamily")&& ![v5 hasContainsFamily]|| -[BMPhotosUserAnalytics hasContainsFamily](self, "hasContainsFamily")&& objc_msgSend(v5, "hasContainsFamily")&& (int v48 = -[BMPhotosUserAnalytics containsFamily](self, "containsFamily"), v48 == objc_msgSend(v5, "containsFamily")))
                                                              {
                                                                if (!-[BMPhotosUserAnalytics hasContainsFriends](self, "hasContainsFriends")&& ![v5 hasContainsFriends]|| -[BMPhotosUserAnalytics hasContainsFriends](self, "hasContainsFriends")&& objc_msgSend(v5, "hasContainsFriends")&& (int v49 = -[BMPhotosUserAnalytics containsFriends](self, "containsFriends"), v49 == objc_msgSend(v5, "containsFriends")))
                                                                {
                                                                  if (!-[BMPhotosUserAnalytics hasContainsPartner](self, "hasContainsPartner")&& ![v5 hasContainsPartner]|| -[BMPhotosUserAnalytics hasContainsPartner](self, "hasContainsPartner")&& objc_msgSend(v5, "hasContainsPartner")&& (int v50 = -[BMPhotosUserAnalytics containsPartner](self, "containsPartner"), v50 == objc_msgSend(v5, "containsPartner")))
                                                                  {
                                                                    if (!-[BMPhotosUserAnalytics hasContainsParent](self, "hasContainsParent")&& ![v5 hasContainsParent]|| -[BMPhotosUserAnalytics hasContainsParent](self, "hasContainsParent")&& objc_msgSend(v5, "hasContainsParent")&& (int v51 = -[BMPhotosUserAnalytics containsParent](self, "containsParent"), v51 == objc_msgSend(v5, "containsParent")))
                                                                    {
                                                                      if (!-[BMPhotosUserAnalytics hasContainsSibling](self, "hasContainsSibling")&& ![v5 hasContainsSibling]|| -[BMPhotosUserAnalytics hasContainsSibling](self, "hasContainsSibling")&& objc_msgSend(v5, "hasContainsSibling")&& (int v52 = -[BMPhotosUserAnalytics containsSibling](self, "containsSibling"), v52 == objc_msgSend(v5, "containsSibling")))
                                                                      {
                                                                        if (!-[BMPhotosUserAnalytics hasContainsChild](self, "hasContainsChild")&& ![v5 hasContainsChild]|| -[BMPhotosUserAnalytics hasContainsChild](self, "hasContainsChild")&& objc_msgSend(v5, "hasContainsChild")&& (int v53 = -[BMPhotosUserAnalytics containsChild](self, "containsChild"), v53 == objc_msgSend(v5, "containsChild")))
                                                                        {
                                                                          if (!-[BMPhotosUserAnalytics hasIsCoupon](self, "hasIsCoupon")&& ![v5 hasIsCoupon]|| -[BMPhotosUserAnalytics hasIsCoupon](self, "hasIsCoupon")&& objc_msgSend(v5, "hasIsCoupon")&& (int v54 = -[BMPhotosUserAnalytics isCoupon](self, "isCoupon"), v54 == objc_msgSend(v5, "isCoupon")))
                                                                          {
                                                                            if (!-[BMPhotosUserAnalytics hasIsRecipe](self, "hasIsRecipe")&& ![v5 hasIsRecipe]|| -[BMPhotosUserAnalytics hasIsRecipe](self, "hasIsRecipe")&& objc_msgSend(v5, "hasIsRecipe")&& (int v55 = -[BMPhotosUserAnalytics isRecipe](self, "isRecipe"), v55 == objc_msgSend(v5, "isRecipe")))
                                                                            {
                                                                              if (!-[BMPhotosUserAnalytics hasIsReceipt](self, "hasIsReceipt")&& ![v5 hasIsReceipt]|| -[BMPhotosUserAnalytics hasIsReceipt](self, "hasIsReceipt")&& objc_msgSend(v5, "hasIsReceipt")&& (int v56 = -[BMPhotosUserAnalytics isReceipt](self, "isReceipt"), v56 == objc_msgSend(v5, "isReceipt")))
                                                                              {
                                                                                if (!-[BMPhotosUserAnalytics hasIsRecentView](self, "hasIsRecentView")&& ![v5 hasIsRecentView]|| -[BMPhotosUserAnalytics hasIsRecentView](self, "hasIsRecentView")&& objc_msgSend(v5, "hasIsRecentView")&& (int v57 = -[BMPhotosUserAnalytics isRecentView](self, "isRecentView"), v57 == objc_msgSend(v5, "isRecentView")))
                                                                                {
                                                                                  if (!-[BMPhotosUserAnalytics hasIsRecentEdit](self, "hasIsRecentEdit")&& ![v5 hasIsRecentEdit]|| -[BMPhotosUserAnalytics hasIsRecentEdit](self, "hasIsRecentEdit")&& objc_msgSend(v5, "hasIsRecentEdit")&& (int v58 = -[BMPhotosUserAnalytics isRecentEdit](self, "isRecentEdit"), v58 == objc_msgSend(v5, "isRecentEdit")))
                                                                                  {
                                                                                    if (!-[BMPhotosUserAnalytics hasIsRecentShare](self, "hasIsRecentShare")&& ![v5 hasIsRecentShare]|| -[BMPhotosUserAnalytics hasIsRecentShare](self, "hasIsRecentShare")&& objc_msgSend(v5, "hasIsRecentShare")&& (int v59 = -[BMPhotosUserAnalytics isRecentShare](self, "isRecentShare"), v59 == objc_msgSend(v5, "isRecentShare")))
                                                                                    {
                                                                                      if (!-[BMPhotosUserAnalytics hasIsRecentFavorite](self, "hasIsRecentFavorite")&& ![v5 hasIsRecentFavorite]|| -[BMPhotosUserAnalytics hasIsRecentFavorite](self, "hasIsRecentFavorite")&& objc_msgSend(v5, "hasIsRecentFavorite")&& (int v60 = -[BMPhotosUserAnalytics isRecentFavorite](self, "isRecentFavorite"), v60 == objc_msgSend(v5, "isRecentFavorite")))
                                                                                      {
                                                                                        if (!-[BMPhotosUserAnalytics hasIsContainedInSharedAlbum](self, "hasIsContainedInSharedAlbum")&& ![v5 hasIsContainedInSharedAlbum]|| -[BMPhotosUserAnalytics hasIsContainedInSharedAlbum](self, "hasIsContainedInSharedAlbum")&& objc_msgSend(v5, "hasIsContainedInSharedAlbum")&& (int v61 = -[BMPhotosUserAnalytics isContainedInSharedAlbum](self, "isContainedInSharedAlbum"), v61 == objc_msgSend(v5, "isContainedInSharedAlbum")))
                                                                                        {
                                                                                          if (!-[BMPhotosUserAnalytics hasIsContainedInOnThisDay](self, "hasIsContainedInOnThisDay")&& ![v5 hasIsContainedInOnThisDay]|| -[BMPhotosUserAnalytics hasIsContainedInOnThisDay](self, "hasIsContainedInOnThisDay")&& objc_msgSend(v5, "hasIsContainedInOnThisDay")&& (int v62 = -[BMPhotosUserAnalytics isContainedInOnThisDay](self, "isContainedInOnThisDay"), v62 == objc_msgSend(v5, "isContainedInOnThisDay")))
                                                                                          {
                                                                                            if (!-[BMPhotosUserAnalytics hasCapturedAtAOI](self, "hasCapturedAtAOI")&& ![v5 hasCapturedAtAOI]|| -[BMPhotosUserAnalytics hasCapturedAtAOI](self, "hasCapturedAtAOI")&& objc_msgSend(v5, "hasCapturedAtAOI")&& (int v63 = -[BMPhotosUserAnalytics capturedAtAOI](self, "capturedAtAOI"), v63 == objc_msgSend(v5, "capturedAtAOI")))
                                                                                            {
                                                                                              if (![(BMPhotosUserAnalytics *)self hasCapturedAtPOI]
                                                                                                && ![v5 hasCapturedAtPOI]
                                                                                                || -[BMPhotosUserAnalytics hasCapturedAtPOI](self, "hasCapturedAtPOI")&& [v5 hasCapturedAtPOI]&& (int v64 = -[BMPhotosUserAnalytics capturedAtPOI](self, "capturedAtPOI"), v64 == objc_msgSend(v5, "capturedAtPOI")))
                                                                                              {
                                                                                                if (!-[BMPhotosUserAnalytics hasCapturedAtROI](self, "hasCapturedAtROI") && ![v5 hasCapturedAtROI] || -[BMPhotosUserAnalytics hasCapturedAtROI](self, "hasCapturedAtROI") && objc_msgSend(v5, "hasCapturedAtROI") && (int v65 = -[BMPhotosUserAnalytics capturedAtROI](self, "capturedAtROI"), v65 == objc_msgSend(v5, "capturedAtROI")))
                                                                                                {
                                                                                                  if (!-[BMPhotosUserAnalytics hasCapturedAtBusiness](self, "hasCapturedAtBusiness") && ![v5 hasCapturedAtBusiness] || -[BMPhotosUserAnalytics hasCapturedAtBusiness](self, "hasCapturedAtBusiness") && objc_msgSend(v5, "hasCapturedAtBusiness") && (int v66 = -[BMPhotosUserAnalytics capturedAtBusiness](self, "capturedAtBusiness"), v66 == objc_msgSend(v5, "capturedAtBusiness")))
                                                                                                  {
                                                                                                    if (!-[BMPhotosUserAnalytics hasIsCapturedAtPublicEvent](self, "hasIsCapturedAtPublicEvent") && ![v5 hasIsCapturedAtPublicEvent] || -[BMPhotosUserAnalytics hasIsCapturedAtPublicEvent](self, "hasIsCapturedAtPublicEvent") && objc_msgSend(v5, "hasIsCapturedAtPublicEvent") && (int v67 = -[BMPhotosUserAnalytics isCapturedAtPublicEvent](self, "isCapturedAtPublicEvent"), v67 == objc_msgSend(v5, "isCapturedAtPublicEvent")))
                                                                                                    {
                                                                                                      if (!-[BMPhotosUserAnalytics hasIsContainedInVisualTrend](self, "hasIsContainedInVisualTrend") && ![v5 hasIsContainedInVisualTrend] || -[BMPhotosUserAnalytics hasIsContainedInVisualTrend](self, "hasIsContainedInVisualTrend") && objc_msgSend(v5, "hasIsContainedInVisualTrend") && (int v68 = -[BMPhotosUserAnalytics isContainedInVisualTrend](self, "isContainedInVisualTrend"), v68 == objc_msgSend(v5, "isContainedInVisualTrend")))
                                                                                                      {
                                                                                                        if (!-[BMPhotosUserAnalytics hasIsContainedInActivity](self, "hasIsContainedInActivity") && ![v5 hasIsContainedInActivity] || -[BMPhotosUserAnalytics hasIsContainedInActivity](self, "hasIsContainedInActivity") && objc_msgSend(v5, "hasIsContainedInActivity") && (int v69 = -[BMPhotosUserAnalytics isContainedInActivity](self, "isContainedInActivity"), v69 == objc_msgSend(v5, "isContainedInActivity")))
                                                                                                        {
                                                                                                          if (!-[BMPhotosUserAnalytics hasIsContainedInChildActivity](self, "hasIsContainedInChildActivity") && ![v5 hasIsContainedInChildActivity] || -[BMPhotosUserAnalytics hasIsContainedInChildActivity](self, "hasIsContainedInChildActivity") && objc_msgSend(v5, "hasIsContainedInChildActivity") && (int v70 = -[BMPhotosUserAnalytics isContainedInChildActivity](self, "isContainedInChildActivity"), v70 == objc_msgSend(v5, "isContainedInChildActivity")))
                                                                                                          {
                                                                                                            int v71 = [(BMPhotosUserAnalytics *)self userLibraryAgeInDays];
                                                                                                            if (v71 == [v5 userLibraryAgeInDays])
                                                                                                            {
                                                                                                              if (!-[BMPhotosUserAnalytics hasUserisDAU](self, "hasUserisDAU") && ![v5 hasUserisDAU])
                                                                                                              {
                                                                                                                BOOL v12 = 1;
                                                                                                                goto LABEL_262;
                                                                                                              }
                                                                                                              if (-[BMPhotosUserAnalytics hasUserisDAU](self, "hasUserisDAU") && [v5 hasUserisDAU])
                                                                                                              {
                                                                                                                [(BMPhotosUserAnalytics *)self userisDAU];
                                                                                                                double v73 = v72;
                                                                                                                [v5 userisDAU];
                                                                                                                BOOL v12 = v73 == v74;
LABEL_262:

                                                                                                                goto LABEL_263;
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
      }
    }
LABEL_261:
    BOOL v12 = 0;
    goto LABEL_262;
  }
  BOOL v12 = 0;
LABEL_263:

  return v12;
}

- (id)jsonDictionary
{
  v176[56] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMPhotosUserAnalytics *)self identifier];
  uint64_t v4 = [(BMPhotosUserAnalytics *)self userEvent];
  if ([(BMPhotosUserAnalytics *)self hasContainsVIP])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics containsVIP](self, "containsVIP"));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = 0;
  }
  if ([(BMPhotosUserAnalytics *)self hasFaceCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPhotosUserAnalytics faceCount](self, "faceCount"));
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = 0;
  }
  if ([(BMPhotosUserAnalytics *)self hasContainsPets])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics containsPets](self, "containsPets"));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = 0;
  }
  if ([(BMPhotosUserAnalytics *)self hasCapturedAtHome])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics capturedAtHome](self, "capturedAtHome"));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = 0;
  }
  if ([(BMPhotosUserAnalytics *)self hasCapturedAtWork])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics capturedAtWork](self, "capturedAtWork"));
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = 0;
  }
  if ([(BMPhotosUserAnalytics *)self hasCapturedAtFrequentLocation])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics capturedAtFrequentLocation](self, "capturedAtFrequentLocation"));
    id v174 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v174 = 0;
  }
  if ([(BMPhotosUserAnalytics *)self hasCapturedOnTrip])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics capturedOnTrip](self, "capturedOnTrip"));
    id v173 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v173 = 0;
  }
  if ([(BMPhotosUserAnalytics *)self hasCapturedOnShortTrip])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics capturedOnShortTrip](self, "capturedOnShortTrip"));
    id v172 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v172 = 0;
  }
  if ([(BMPhotosUserAnalytics *)self hasIsDocument])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics isDocument](self, "isDocument"));
    id v171 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v171 = 0;
  }
  if ([(BMPhotosUserAnalytics *)self hasIsMeme])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics isMeme](self, "isMeme"));
    id v170 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v170 = 0;
  }
  if ([(BMPhotosUserAnalytics *)self hasIsScreenshot])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics isScreenshot](self, "isScreenshot"));
    id v169 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v169 = 0;
  }
  if ([(BMPhotosUserAnalytics *)self hasIsFavorite])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics isFavorite](self, "isFavorite"));
    id v168 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v168 = 0;
  }
  if ([(BMPhotosUserAnalytics *)self hasIsCapturedOnWeekend])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics isCapturedOnWeekend](self, "isCapturedOnWeekend"));
    id v167 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v167 = 0;
  }
  if ([(BMPhotosUserAnalytics *)self hasIsCapturedAtPrivateEvent])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics isCapturedAtPrivateEvent](self, "isCapturedAtPrivateEvent"));
    id v166 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v166 = 0;
  }
  if ([(BMPhotosUserAnalytics *)self hasIsCapturedOnHoliday])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics isCapturedOnHoliday](self, "isCapturedOnHoliday"));
    id v165 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v165 = 0;
  }
  v164 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPhotosUserAnalytics mediaType](self, "mediaType"));
  v163 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPhotosUserAnalytics importSource](self, "importSource"));
  v162 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPhotosUserAnalytics assetAge](self, "assetAge"));
  v161 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPhotosUserAnalytics userLibrarySize](self, "userLibrarySize"));
  if ([(BMPhotosUserAnalytics *)self hasUserNumTrips])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPhotosUserAnalytics userNumTrips](self, "userNumTrips"));
    id v160 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v160 = 0;
  }
  if ([(BMPhotosUserAnalytics *)self hasUserNumVIPPeople])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPhotosUserAnalytics userNumVIPPeople](self, "userNumVIPPeople"));
    id v159 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v159 = 0;
  }
  if ([(BMPhotosUserAnalytics *)self hasUserNumFavorites])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMPhotosUserAnalytics userNumFavorites](self, "userNumFavorites"));
    id v158 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v158 = 0;
  }
  if ([(BMPhotosUserAnalytics *)self hasUserHasVIP])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics userHasVIP](self, "userHasVIP"));
    id v157 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v157 = 0;
  }
  if ([(BMPhotosUserAnalytics *)self hasUserHasHome])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics userHasHome](self, "userHasHome"));
    id v156 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v156 = 0;
  }
  if ([(BMPhotosUserAnalytics *)self hasUserHasPet])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics userHasPet](self, "userHasPet"));
    id v155 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v155 = 0;
  }
  if ([(BMPhotosUserAnalytics *)self hasContainsBaby])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics containsBaby](self, "containsBaby"));
    id v154 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v154 = 0;
  }
  if ([(BMPhotosUserAnalytics *)self hasContainsSocialGroup])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics containsSocialGroup](self, "containsSocialGroup"));
    id v153 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v153 = 0;
  }
  if ([(BMPhotosUserAnalytics *)self hasContainsMyPet])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics containsMyPet](self, "containsMyPet"));
    id v152 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v152 = 0;
  }
  if ([(BMPhotosUserAnalytics *)self hasContainsCoWorker])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics containsCoWorker](self, "containsCoWorker"));
    id v151 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v151 = 0;
  }
  if ([(BMPhotosUserAnalytics *)self hasContainsFamily])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics containsFamily](self, "containsFamily"));
    id v150 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v150 = 0;
  }
  if ([(BMPhotosUserAnalytics *)self hasContainsFriends])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics containsFriends](self, "containsFriends"));
    id v149 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v149 = 0;
  }
  if ([(BMPhotosUserAnalytics *)self hasContainsPartner])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics containsPartner](self, "containsPartner"));
    id v148 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v148 = 0;
  }
  if ([(BMPhotosUserAnalytics *)self hasContainsParent])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics containsParent](self, "containsParent"));
    id v147 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v147 = 0;
  }
  if ([(BMPhotosUserAnalytics *)self hasContainsSibling])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics containsSibling](self, "containsSibling"));
    id v146 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v146 = 0;
  }
  if ([(BMPhotosUserAnalytics *)self hasContainsChild])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics containsChild](self, "containsChild"));
    id v145 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v145 = 0;
  }
  if ([(BMPhotosUserAnalytics *)self hasIsCoupon])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics isCoupon](self, "isCoupon"));
    id v144 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v144 = 0;
  }
  if ([(BMPhotosUserAnalytics *)self hasIsRecipe])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics isRecipe](self, "isRecipe"));
    id v143 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v143 = 0;
  }
  if ([(BMPhotosUserAnalytics *)self hasIsReceipt])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics isReceipt](self, "isReceipt"));
    id v142 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v142 = 0;
  }
  if ([(BMPhotosUserAnalytics *)self hasIsRecentView])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics isRecentView](self, "isRecentView"));
    id v141 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v141 = 0;
  }
  if ([(BMPhotosUserAnalytics *)self hasIsRecentEdit])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics isRecentEdit](self, "isRecentEdit"));
    id v140 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v140 = 0;
  }
  if ([(BMPhotosUserAnalytics *)self hasIsRecentShare])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics isRecentShare](self, "isRecentShare"));
    id v139 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v139 = 0;
  }
  if ([(BMPhotosUserAnalytics *)self hasIsRecentFavorite])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics isRecentFavorite](self, "isRecentFavorite"));
    id v138 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v138 = 0;
  }
  if ([(BMPhotosUserAnalytics *)self hasIsContainedInSharedAlbum])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics isContainedInSharedAlbum](self, "isContainedInSharedAlbum"));
    id v137 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v137 = 0;
  }
  if ([(BMPhotosUserAnalytics *)self hasIsContainedInOnThisDay])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics isContainedInOnThisDay](self, "isContainedInOnThisDay"));
    id v136 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v136 = 0;
  }
  if ([(BMPhotosUserAnalytics *)self hasCapturedAtAOI])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics capturedAtAOI](self, "capturedAtAOI"));
    id v135 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v135 = 0;
  }
  if ([(BMPhotosUserAnalytics *)self hasCapturedAtPOI])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics capturedAtPOI](self, "capturedAtPOI"));
    id v134 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v134 = 0;
  }
  if ([(BMPhotosUserAnalytics *)self hasCapturedAtROI])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics capturedAtROI](self, "capturedAtROI"));
    id v133 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v133 = 0;
  }
  if ([(BMPhotosUserAnalytics *)self hasCapturedAtBusiness])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics capturedAtBusiness](self, "capturedAtBusiness"));
    id v132 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v132 = 0;
  }
  if ([(BMPhotosUserAnalytics *)self hasIsCapturedAtPublicEvent])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics isCapturedAtPublicEvent](self, "isCapturedAtPublicEvent"));
    id v131 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v131 = 0;
  }
  if ([(BMPhotosUserAnalytics *)self hasIsContainedInVisualTrend])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics isContainedInVisualTrend](self, "isContainedInVisualTrend"));
    id v130 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v130 = 0;
  }
  if ([(BMPhotosUserAnalytics *)self hasIsContainedInActivity])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics isContainedInActivity](self, "isContainedInActivity"));
    id v129 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v129 = 0;
  }
  if ([(BMPhotosUserAnalytics *)self hasIsContainedInChildActivity])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics isContainedInChildActivity](self, "isContainedInChildActivity"));
    id v128 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v128 = 0;
  }
  v127 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPhotosUserAnalytics userLibraryAgeInDays](self, "userLibraryAgeInDays"));
  if (![(BMPhotosUserAnalytics *)self hasUserisDAU]
    || ([(BMPhotosUserAnalytics *)self userisDAU], fabs(v10) == INFINITY))
  {
    id v126 = 0;
  }
  else
  {
    [(BMPhotosUserAnalytics *)self userisDAU];
    int v11 = NSNumber;
    [(BMPhotosUserAnalytics *)self userisDAU];
    objc_msgSend(v11, "numberWithDouble:");
    id v126 = (id)objc_claimAutoreleasedReturnValue();
  }
  v175[0] = @"identifier";
  uint64_t v12 = v3;
  if (!v3)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v117 = (void *)v12;
  v176[0] = v12;
  v175[1] = @"userEvent";
  uint64_t v13 = v4;
  if (!v4)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v116 = (void *)v13;
  v176[1] = v13;
  v175[2] = @"containsVIP";
  uint64_t v14 = (uint64_t)v5;
  if (!v5)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v115 = (void *)v14;
  v176[2] = v14;
  v175[3] = @"faceCount";
  uint64_t v15 = (uint64_t)v6;
  if (!v6)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v114 = (void *)v15;
  v176[3] = v15;
  v175[4] = @"containsPets";
  uint64_t v16 = (uint64_t)v7;
  if (!v7)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v113 = (void *)v16;
  v176[4] = v16;
  v175[5] = @"capturedAtHome";
  uint64_t v17 = (uint64_t)v8;
  if (!v8)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v112 = (void *)v17;
  v176[5] = v17;
  v175[6] = @"capturedAtWork";
  uint64_t v18 = (uint64_t)v9;
  if (!v9)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v111 = (void *)v18;
  v176[6] = v18;
  v175[7] = @"capturedAtFrequentLocation";
  uint64_t v19 = (uint64_t)v174;
  if (!v174)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v176[7] = v19;
  v175[8] = @"capturedOnTrip";
  int v20 = v173;
  if (!v173)
  {
    int v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v176[8] = v20;
  v175[9] = @"capturedOnShortTrip";
  int v21 = v172;
  if (!v172)
  {
    int v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v176[9] = v21;
  v175[10] = @"isDocument";
  uint64_t v22 = (uint64_t)v171;
  if (!v171)
  {
    uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v119 = v9;
  v109 = (void *)v22;
  v176[10] = v22;
  v175[11] = @"isMeme";
  uint64_t v23 = (uint64_t)v170;
  if (!v170)
  {
    uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
  }
  int v24 = (void *)v3;
  v120 = (void *)v23;
  v176[11] = v23;
  v175[12] = @"isScreenshot";
  uint64_t v25 = (uint64_t)v169;
  if (!v169)
  {
    uint64_t v25 = [MEMORY[0x1E4F1CA98] null];
  }
  int v26 = (void *)v25;
  v176[12] = v25;
  v175[13] = @"isFavorite";
  uint64_t v27 = (uint64_t)v168;
  if (!v168)
  {
    uint64_t v27 = [MEMORY[0x1E4F1CA98] null];
  }
  v108 = (void *)v27;
  v176[13] = v27;
  v175[14] = @"isCapturedOnWeekend";
  uint64_t v28 = (uint64_t)v167;
  if (!v167)
  {
    uint64_t v28 = [MEMORY[0x1E4F1CA98] null];
  }
  v107 = (void *)v28;
  v176[14] = v28;
  v175[15] = @"isCapturedAtPrivateEvent";
  uint64_t v29 = (uint64_t)v166;
  if (!v166)
  {
    uint64_t v29 = [MEMORY[0x1E4F1CA98] null];
  }
  v106 = (void *)v29;
  v176[15] = v29;
  v175[16] = @"isCapturedOnHoliday";
  uint64_t v30 = (uint64_t)v165;
  if (!v165)
  {
    uint64_t v30 = [MEMORY[0x1E4F1CA98] null];
  }
  v105 = (void *)v30;
  v176[16] = v30;
  v175[17] = @"mediaType";
  uint64_t v31 = (uint64_t)v164;
  if (!v164)
  {
    uint64_t v31 = [MEMORY[0x1E4F1CA98] null];
  }
  v104 = (void *)v31;
  v176[17] = v31;
  v175[18] = @"importSource";
  uint64_t v32 = (uint64_t)v163;
  if (!v163)
  {
    uint64_t v32 = [MEMORY[0x1E4F1CA98] null];
  }
  v103 = (void *)v32;
  v176[18] = v32;
  v175[19] = @"assetAge";
  uint64_t v33 = (uint64_t)v162;
  if (!v162)
  {
    uint64_t v33 = [MEMORY[0x1E4F1CA98] null];
  }
  v102 = (void *)v33;
  v176[19] = v33;
  v175[20] = @"userLibrarySize";
  uint64_t v34 = (uint64_t)v161;
  if (!v161)
  {
    uint64_t v34 = [MEMORY[0x1E4F1CA98] null];
  }
  v101 = (void *)v34;
  v176[20] = v34;
  v175[21] = @"userNumTrips";
  uint64_t v35 = (uint64_t)v160;
  if (!v160)
  {
    uint64_t v35 = [MEMORY[0x1E4F1CA98] null];
  }
  v100 = (void *)v35;
  v176[21] = v35;
  v175[22] = @"userNumVIPPeople";
  uint64_t v36 = (uint64_t)v159;
  if (!v159)
  {
    uint64_t v36 = [MEMORY[0x1E4F1CA98] null];
  }
  v99 = (void *)v36;
  v176[22] = v36;
  v175[23] = @"userNumFavorites";
  uint64_t v37 = (uint64_t)v158;
  if (!v158)
  {
    uint64_t v37 = [MEMORY[0x1E4F1CA98] null];
  }
  v98 = (void *)v37;
  v176[23] = v37;
  v175[24] = @"userHasVIP";
  uint64_t v38 = (uint64_t)v157;
  if (!v157)
  {
    uint64_t v38 = [MEMORY[0x1E4F1CA98] null];
  }
  v97 = (void *)v38;
  v176[24] = v38;
  v175[25] = @"userHasHome";
  uint64_t v39 = (uint64_t)v156;
  if (!v156)
  {
    uint64_t v39 = [MEMORY[0x1E4F1CA98] null];
  }
  v96 = (void *)v39;
  v176[25] = v39;
  v175[26] = @"userHasPet";
  uint64_t v40 = (uint64_t)v155;
  if (!v155)
  {
    uint64_t v40 = [MEMORY[0x1E4F1CA98] null];
  }
  v95 = (void *)v40;
  v176[26] = v40;
  v175[27] = @"containsBaby";
  uint64_t v41 = (uint64_t)v154;
  if (!v154)
  {
    uint64_t v41 = [MEMORY[0x1E4F1CA98] null];
  }
  v94 = (void *)v41;
  v176[27] = v41;
  v175[28] = @"containsSocialGroup";
  uint64_t v42 = (uint64_t)v153;
  if (!v153)
  {
    uint64_t v42 = [MEMORY[0x1E4F1CA98] null];
  }
  v93 = (void *)v42;
  v176[28] = v42;
  v175[29] = @"containsMyPet";
  uint64_t v43 = (uint64_t)v152;
  if (!v152)
  {
    uint64_t v43 = [MEMORY[0x1E4F1CA98] null];
  }
  v92 = (void *)v43;
  v176[29] = v43;
  v175[30] = @"containsCoWorker";
  uint64_t v44 = (uint64_t)v151;
  if (!v151)
  {
    uint64_t v44 = [MEMORY[0x1E4F1CA98] null];
  }
  v91 = (void *)v44;
  v176[30] = v44;
  v175[31] = @"containsFamily";
  uint64_t v45 = (uint64_t)v150;
  if (!v150)
  {
    uint64_t v45 = [MEMORY[0x1E4F1CA98] null];
  }
  v90 = (void *)v45;
  v176[31] = v45;
  v175[32] = @"containsFriends";
  uint64_t v46 = (uint64_t)v149;
  if (!v149)
  {
    uint64_t v46 = [MEMORY[0x1E4F1CA98] null];
  }
  v89 = (void *)v46;
  v176[32] = v46;
  v175[33] = @"containsPartner";
  uint64_t v47 = (uint64_t)v148;
  if (!v148)
  {
    uint64_t v47 = [MEMORY[0x1E4F1CA98] null];
  }
  v88 = (void *)v47;
  v176[33] = v47;
  v175[34] = @"containsParent";
  uint64_t v48 = (uint64_t)v147;
  if (!v147)
  {
    uint64_t v48 = [MEMORY[0x1E4F1CA98] null];
  }
  v87 = (void *)v48;
  v176[34] = v48;
  v175[35] = @"containsSibling";
  uint64_t v49 = (uint64_t)v146;
  if (!v146)
  {
    uint64_t v49 = [MEMORY[0x1E4F1CA98] null];
  }
  v86 = (void *)v49;
  v176[35] = v49;
  v175[36] = @"containsChild";
  uint64_t v50 = (uint64_t)v145;
  if (!v145)
  {
    uint64_t v50 = [MEMORY[0x1E4F1CA98] null];
  }
  v85 = (void *)v50;
  v176[36] = v50;
  v175[37] = @"isCoupon";
  uint64_t v51 = (uint64_t)v144;
  if (!v144)
  {
    uint64_t v51 = [MEMORY[0x1E4F1CA98] null];
  }
  v84 = (void *)v51;
  v176[37] = v51;
  v175[38] = @"isRecipe";
  uint64_t v52 = (uint64_t)v143;
  if (!v143)
  {
    uint64_t v52 = [MEMORY[0x1E4F1CA98] null];
  }
  v83 = (void *)v52;
  v176[38] = v52;
  v175[39] = @"isReceipt";
  uint64_t v53 = (uint64_t)v142;
  if (!v142)
  {
    uint64_t v53 = [MEMORY[0x1E4F1CA98] null];
  }
  v82 = (void *)v53;
  v176[39] = v53;
  v175[40] = @"isRecentView";
  uint64_t v54 = (uint64_t)v141;
  if (!v141)
  {
    uint64_t v54 = [MEMORY[0x1E4F1CA98] null];
  }
  v81 = (void *)v54;
  v176[40] = v54;
  v175[41] = @"isRecentEdit";
  uint64_t v55 = (uint64_t)v140;
  if (!v140)
  {
    uint64_t v55 = [MEMORY[0x1E4F1CA98] null];
  }
  v80 = (void *)v55;
  v176[41] = v55;
  v175[42] = @"isRecentShare";
  uint64_t v56 = (uint64_t)v139;
  if (!v139)
  {
    uint64_t v56 = [MEMORY[0x1E4F1CA98] null];
  }
  v79 = (void *)v56;
  v176[42] = v56;
  v175[43] = @"isRecentFavorite";
  uint64_t v57 = (uint64_t)v138;
  if (!v138)
  {
    uint64_t v57 = [MEMORY[0x1E4F1CA98] null];
  }
  v78 = (void *)v57;
  v176[43] = v57;
  v175[44] = @"isContainedInSharedAlbum";
  uint64_t v58 = (uint64_t)v137;
  if (!v137)
  {
    uint64_t v58 = [MEMORY[0x1E4F1CA98] null];
  }
  v77 = (void *)v58;
  v176[44] = v58;
  v175[45] = @"isContainedInOnThisDay";
  uint64_t v59 = (uint64_t)v136;
  if (!v136)
  {
    uint64_t v59 = [MEMORY[0x1E4F1CA98] null];
  }
  v123 = v6;
  v76 = (void *)v59;
  v176[45] = v59;
  v175[46] = @"capturedAtAOI";
  uint64_t v60 = (uint64_t)v135;
  if (!v135)
  {
    uint64_t v60 = [MEMORY[0x1E4F1CA98] null];
  }
  v75 = (void *)v60;
  v176[46] = v60;
  v175[47] = @"capturedAtPOI";
  uint64_t v61 = (uint64_t)v134;
  if (!v134)
  {
    uint64_t v61 = [MEMORY[0x1E4F1CA98] null];
  }
  v125 = (void *)v4;
  double v74 = (void *)v61;
  v176[47] = v61;
  v175[48] = @"capturedAtROI";
  uint64_t v62 = (uint64_t)v133;
  if (!v133)
  {
    uint64_t v62 = [MEMORY[0x1E4F1CA98] null];
  }
  v122 = v8;
  double v73 = (void *)v62;
  v176[48] = v62;
  v175[49] = @"capturedAtBusiness";
  uint64_t v63 = (uint64_t)v132;
  if (!v132)
  {
    uint64_t v63 = [MEMORY[0x1E4F1CA98] null];
  }
  v124 = v5;
  double v72 = (void *)v63;
  v176[49] = v63;
  v175[50] = @"isCapturedAtPublicEvent";
  int v64 = v131;
  if (!v131)
  {
    int v64 = [MEMORY[0x1E4F1CA98] null];
  }
  v121 = v7;
  v176[50] = v64;
  v175[51] = @"isContainedInVisualTrend";
  int v65 = v130;
  if (!v130)
  {
    int v65 = [MEMORY[0x1E4F1CA98] null];
  }
  v110 = (void *)v19;
  v176[51] = v65;
  v175[52] = @"isContainedInActivity";
  int v66 = v129;
  if (!v129)
  {
    int v66 = [MEMORY[0x1E4F1CA98] null];
  }
  v176[52] = v66;
  v175[53] = @"isContainedInChildActivity";
  int v67 = v128;
  if (!v128)
  {
    int v67 = [MEMORY[0x1E4F1CA98] null];
  }
  v176[53] = v67;
  v175[54] = @"userLibraryAgeInDays";
  int v68 = v127;
  if (!v127)
  {
    int v68 = [MEMORY[0x1E4F1CA98] null];
  }
  v176[54] = v68;
  v175[55] = @"userisDAU";
  int v69 = v126;
  if (!v126)
  {
    int v69 = [MEMORY[0x1E4F1CA98] null];
  }
  v176[55] = v69;
  id v118 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v176 forKeys:v175 count:56];
  if (!v126) {

  }
  int v70 = v26;
  if (!v127)
  {

    int v70 = v26;
  }
  if (!v128)
  {

    int v70 = v26;
  }
  if (!v129)
  {

    int v70 = v26;
  }
  if (!v130)
  {

    int v70 = v26;
  }
  if (!v131)
  {

    int v70 = v26;
  }
  if (!v132)
  {

    int v70 = v26;
  }
  if (!v133)
  {

    int v70 = v26;
  }
  if (!v134)
  {

    int v70 = v26;
  }
  if (!v135)
  {

    int v70 = v26;
  }
  if (!v136)
  {

    int v70 = v26;
  }
  if (!v137)
  {

    int v70 = v26;
  }
  if (!v138)
  {

    int v70 = v26;
  }
  if (!v139)
  {

    int v70 = v26;
  }
  if (!v140)
  {

    int v70 = v26;
  }
  if (!v141)
  {

    int v70 = v26;
  }
  if (!v142)
  {

    int v70 = v26;
  }
  if (!v143)
  {

    int v70 = v26;
  }
  if (!v144)
  {

    int v70 = v26;
  }
  if (!v145)
  {

    int v70 = v26;
  }
  if (!v146)
  {

    int v70 = v26;
  }
  if (!v147)
  {

    int v70 = v26;
  }
  if (!v148)
  {

    int v70 = v26;
  }
  if (!v149)
  {

    int v70 = v26;
  }
  if (!v150)
  {

    int v70 = v26;
  }
  if (!v151)
  {

    int v70 = v26;
  }
  if (!v152)
  {

    int v70 = v26;
  }
  if (!v153)
  {

    int v70 = v26;
  }
  if (!v154)
  {

    int v70 = v26;
  }
  if (!v155)
  {

    int v70 = v26;
  }
  if (!v156)
  {

    int v70 = v26;
  }
  if (!v157)
  {

    int v70 = v26;
  }
  if (!v158)
  {

    int v70 = v26;
  }
  if (!v159)
  {

    int v70 = v26;
  }
  if (!v160)
  {

    int v70 = v26;
  }
  if (!v161)
  {

    int v70 = v26;
  }
  if (!v162)
  {

    int v70 = v26;
  }
  if (!v163)
  {

    int v70 = v26;
  }
  if (!v164)
  {

    int v70 = v26;
  }
  if (!v165)
  {

    int v70 = v26;
  }
  if (!v166)
  {

    int v70 = v26;
  }
  if (!v167)
  {

    int v70 = v26;
  }
  if (!v168)
  {

    int v70 = v26;
  }
  if (!v169) {

  }
  if (!v170) {
  if (!v171)
  }

  if (!v172) {
  if (!v173)
  }

  if (v174)
  {
    if (v119) {
      goto LABEL_359;
    }
  }
  else
  {

    if (v119)
    {
LABEL_359:
      if (v122) {
        goto LABEL_360;
      }
      goto LABEL_370;
    }
  }

  if (v122)
  {
LABEL_360:
    if (v121) {
      goto LABEL_361;
    }
    goto LABEL_371;
  }
LABEL_370:

  if (v121)
  {
LABEL_361:
    if (v123) {
      goto LABEL_362;
    }
    goto LABEL_372;
  }
LABEL_371:

  if (v123)
  {
LABEL_362:
    if (v124) {
      goto LABEL_363;
    }
    goto LABEL_373;
  }
LABEL_372:

  if (v124)
  {
LABEL_363:
    if (v125) {
      goto LABEL_364;
    }
LABEL_374:

    if (v24) {
      goto LABEL_365;
    }
    goto LABEL_375;
  }
LABEL_373:

  if (!v125) {
    goto LABEL_374;
  }
LABEL_364:
  if (v24) {
    goto LABEL_365;
  }
LABEL_375:

LABEL_365:

  return v118;
}

- (BMPhotosUserAnalytics)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v735[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 objectForKeyedSubscript:@"identifier"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v623 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v623 = v7;
LABEL_4:
    id v8 = [v6 objectForKeyedSubscript:@"userEvent"];
    if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v9 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v8;
LABEL_7:
      double v10 = [v6 objectForKeyedSubscript:@"containsVIP"];
      if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v620 = v9;
        id v11 = 0;
        goto LABEL_10;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v620 = v9;
        id v11 = v10;
LABEL_10:
        uint64_t v12 = [v6 objectForKeyedSubscript:@"faceCount"];
        id v614 = v11;
        if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v613 = v12;
          id v621 = 0;
          goto LABEL_13;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v613 = v12;
          id v621 = v12;
LABEL_13:
          uint64_t v13 = [v6 objectForKeyedSubscript:@"containsPets"];
          v617 = (void *)v13;
          if (!v13 || (uint64_t v14 = (void *)v13, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            id v615 = 0;
            goto LABEL_16;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v615 = v14;
LABEL_16:
            uint64_t v15 = [v6 objectForKeyedSubscript:@"capturedAtHome"];
            v612 = (void *)v15;
            if (!v15 || (uint64_t v16 = (void *)v15, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v608 = 0;
              goto LABEL_19;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v608 = v16;
LABEL_19:
              uint64_t v17 = [v6 objectForKeyedSubscript:@"capturedAtWork"];
              v611 = (void *)v17;
              if (!v17 || (uint64_t v18 = (void *)v17, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                id v609 = 0;
                goto LABEL_22;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v609 = v18;
LABEL_22:
                uint64_t v19 = [v6 objectForKeyedSubscript:@"capturedAtFrequentLocation"];
                v607 = (void *)v19;
                if (!v19 || (int v20 = (void *)v19, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  id v605 = 0;
                  goto LABEL_25;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v605 = v20;
LABEL_25:
                  uint64_t v21 = [v6 objectForKeyedSubscript:@"capturedOnTrip"];
                  v604 = (void *)v21;
                  if (!v21 || (uint64_t v22 = (void *)v21, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    id v602 = 0;
                    goto LABEL_28;
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v602 = v22;
LABEL_28:
                    uint64_t v23 = [v6 objectForKeyedSubscript:@"capturedOnShortTrip"];
                    v598 = (void *)v23;
                    if (!v23 || (int v24 = (void *)v23, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      id v590 = 0;
                      goto LABEL_31;
                    }
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v590 = v24;
LABEL_31:
                      uint64_t v25 = [v6 objectForKeyedSubscript:@"isDocument"];
                      v595 = (void *)v25;
                      if (!v25 || (int v26 = (void *)v25, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        id v591 = 0;
                        goto LABEL_34;
                      }
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        id v591 = v26;
LABEL_34:
                        uint64_t v27 = [v6 objectForKeyedSubscript:@"isMeme"];
                        v593 = self;
                        v587 = (void *)v27;
                        if (!v27 || (uint64_t v28 = (void *)v27, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                        {
                          id v585 = 0;
                          goto LABEL_37;
                        }
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          id v585 = v28;
LABEL_37:
                          uint64_t v29 = [v6 objectForKeyedSubscript:@"isScreenshot"];
                          v584 = (void *)v29;
                          if (!v29 || (uint64_t v30 = (void *)v29, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            id v578 = 0;
                            goto LABEL_40;
                          }
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            id v578 = v30;
LABEL_40:
                            uint64_t v31 = [v6 objectForKeyedSubscript:@"isFavorite"];
                            v577 = (void *)v31;
                            if (!v31 || (uint64_t v32 = (void *)v31, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                            {
                              id v575 = 0;
                              goto LABEL_43;
                            }
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              id v575 = v32;
LABEL_43:
                              uint64_t v33 = [v6 objectForKeyedSubscript:@"isCapturedOnWeekend"];
                              v574 = (void *)v33;
                              if (!v33 || (uint64_t v34 = (void *)v33, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                              {
                                id v572 = 0;
                                goto LABEL_46;
                              }
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                id v572 = v34;
LABEL_46:
                                uint64_t v35 = [v6 objectForKeyedSubscript:@"isCapturedAtPrivateEvent"];
                                v571 = (void *)v35;
                                if (!v35 || (uint64_t v36 = (void *)v35, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                {
                                  id v569 = 0;
LABEL_49:
                                  uint64_t v37 = [v6 objectForKeyedSubscript:@"isCapturedOnHoliday"];
                                  v568 = (void *)v37;
                                  if (v37 && (uint64_t v38 = (void *)v37, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                  {
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) == 0)
                                    {
                                      if (!a4)
                                      {
                                        id v566 = 0;
                                        uint64_t v45 = 0;
                                        uint64_t v56 = v613;
                                        a4 = v608;
LABEL_512:
                                        v112 = v590;
                                        goto LABEL_513;
                                      }
                                      id v169 = a4;
                                      id v567 = objc_alloc(MEMORY[0x1E4F28C58]);
                                      uint64_t v170 = *MEMORY[0x1E4F502C8];
                                      uint64_t v702 = *MEMORY[0x1E4F28568];
                                      id v171 = [NSString alloc];
                                      uint64_t v456 = objc_opt_class();
                                      id v172 = v171;
                                      self = v593;
                                      a4 = v608;
                                      id v173 = (void *)[v172 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v456, @"isCapturedOnHoliday"];
                                      v703 = v173;
                                      uint64_t v174 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v703 forKeys:&v702 count:1];
                                      uint64_t v175 = v170;
                                      id v11 = v614;
                                      v565 = (void *)v174;
                                      id v176 = (id)objc_msgSend(v567, "initWithDomain:code:userInfo:", v175, 2);
                                      id v566 = 0;
                                      uint64_t v45 = 0;
                                      *id v169 = v176;
                                      uint64_t v56 = v613;
                                      goto LABEL_511;
                                    }
                                    id v566 = v38;
                                  }
                                  else
                                  {
                                    id v566 = 0;
                                  }
                                  uint64_t v39 = [v6 objectForKeyedSubscript:@"mediaType"];
                                  v565 = (void *)v39;
                                  if (!v39
                                    || (uint64_t v40 = (void *)v39, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                  {
                                    v562 = 0;
                                    goto LABEL_140;
                                  }
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    id v147 = v40;
LABEL_139:
                                    v562 = v147;

LABEL_140:
                                    uint64_t v178 = [v6 objectForKeyedSubscript:@"importSource"];
                                    v564 = (void *)v178;
                                    if (!v178
                                      || (v179 = (void *)v178, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                    {
                                      v563 = 0;
                                      goto LABEL_148;
                                    }
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      id v180 = v179;
LABEL_147:
                                      v563 = v180;

LABEL_148:
                                      uint64_t v182 = [v6 objectForKeyedSubscript:@"assetAge"];
                                      v561 = (void *)v182;
                                      if (!v182
                                        || (v183 = (void *)v182, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                      {
                                        v560 = 0;
                                        goto LABEL_157;
                                      }
                                      objc_opt_class();
                                      if (objc_opt_isKindOfClass())
                                      {
                                        id v184 = v183;
LABEL_156:
                                        v560 = v184;

LABEL_157:
                                        uint64_t v186 = [v6 objectForKeyedSubscript:@"userLibrarySize"];
                                        v559 = (void *)v186;
                                        if (!v186
                                          || (v187 = (void *)v186, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                        {
                                          v558 = 0;
                                          goto LABEL_165;
                                        }
                                        objc_opt_class();
                                        if (objc_opt_isKindOfClass())
                                        {
                                          id v188 = v187;
LABEL_164:
                                          v558 = v188;

LABEL_165:
                                          uint64_t v190 = [v6 objectForKeyedSubscript:@"userNumTrips"];
                                          v557 = (void *)v190;
                                          if (!v190
                                            || (v191 = (void *)v190,
                                                objc_opt_class(),
                                                (objc_opt_isKindOfClass() & 1) != 0))
                                          {
                                            id v556 = 0;
                                            goto LABEL_168;
                                          }
                                          objc_opt_class();
                                          if (objc_opt_isKindOfClass())
                                          {
                                            id v556 = v191;
LABEL_168:
                                            uint64_t v192 = [v6 objectForKeyedSubscript:@"userNumVIPPeople"];
                                            v555 = (void *)v192;
                                            if (!v192
                                              || (v193 = (void *)v192,
                                                  objc_opt_class(),
                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                            {
                                              id v553 = 0;
                                              goto LABEL_171;
                                            }
                                            objc_opt_class();
                                            if (objc_opt_isKindOfClass())
                                            {
                                              id v553 = v193;
LABEL_171:
                                              uint64_t v194 = [v6 objectForKeyedSubscript:@"userNumFavorites"];
                                              v552 = (void *)v194;
                                              if (!v194
                                                || (v195 = (void *)v194,
                                                    objc_opt_class(),
                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                              {
                                                id v549 = 0;
                                                goto LABEL_174;
                                              }
                                              objc_opt_class();
                                              if (objc_opt_isKindOfClass())
                                              {
                                                id v549 = v195;
LABEL_174:
                                                uint64_t v196 = [v6 objectForKeyedSubscript:@"userHasVIP"];
                                                v551 = (void *)v196;
                                                if (!v196
                                                  || (v197 = (void *)v196,
                                                      objc_opt_class(),
                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                {
                                                  id v550 = 0;
                                                  goto LABEL_177;
                                                }
                                                objc_opt_class();
                                                if (objc_opt_isKindOfClass())
                                                {
                                                  id v550 = v197;
LABEL_177:
                                                  uint64_t v198 = [v6 objectForKeyedSubscript:@"userHasHome"];
                                                  v548 = (void *)v198;
                                                  if (!v198
                                                    || (v199 = (void *)v198,
                                                        objc_opt_class(),
                                                        (objc_opt_isKindOfClass() & 1) != 0))
                                                  {
                                                    id v546 = 0;
                                                    goto LABEL_180;
                                                  }
                                                  objc_opt_class();
                                                  if (objc_opt_isKindOfClass())
                                                  {
                                                    id v546 = v199;
LABEL_180:
                                                    uint64_t v200 = [v6 objectForKeyedSubscript:@"userHasPet"];
                                                    v545 = (void *)v200;
                                                    if (!v200
                                                      || (v201 = (void *)v200,
                                                          objc_opt_class(),
                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                    {
                                                      id v542 = 0;
                                                      goto LABEL_183;
                                                    }
                                                    objc_opt_class();
                                                    if (objc_opt_isKindOfClass())
                                                    {
                                                      id v542 = v201;
LABEL_183:
                                                      uint64_t v202 = [v6 objectForKeyedSubscript:@"containsBaby"];
                                                      v544 = (void *)v202;
                                                      if (!v202
                                                        || (v203 = (void *)v202,
                                                            objc_opt_class(),
                                                            (objc_opt_isKindOfClass() & 1) != 0))
                                                      {
                                                        id v543 = 0;
                                                        goto LABEL_186;
                                                      }
                                                      objc_opt_class();
                                                      if (objc_opt_isKindOfClass())
                                                      {
                                                        id v543 = v203;
LABEL_186:
                                                        uint64_t v204 = [v6 objectForKeyedSubscript:@"containsSocialGroup"];
                                                        v541 = (void *)v204;
                                                        if (!v204
                                                          || (v205 = (void *)v204,
                                                              objc_opt_class(),
                                                              (objc_opt_isKindOfClass() & 1) != 0))
                                                        {
                                                          id v540 = 0;
                                                          goto LABEL_189;
                                                        }
                                                        objc_opt_class();
                                                        if (objc_opt_isKindOfClass())
                                                        {
                                                          id v540 = v205;
LABEL_189:
                                                          uint64_t v206 = [v6 objectForKeyedSubscript:@"containsMyPet"];
                                                          v539 = (void *)v206;
                                                          if (!v206
                                                            || (v207 = (void *)v206,
                                                                objc_opt_class(),
                                                                (objc_opt_isKindOfClass() & 1) != 0))
                                                          {
                                                            id v538 = 0;
                                                            goto LABEL_192;
                                                          }
                                                          objc_opt_class();
                                                          if (objc_opt_isKindOfClass())
                                                          {
                                                            id v538 = v207;
LABEL_192:
                                                            uint64_t v208 = [v6 objectForKeyedSubscript:@"containsCoWorker"];
                                                            v537 = (void *)v208;
                                                            if (!v208
                                                              || (v209 = (void *)v208,
                                                                  objc_opt_class(),
                                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                                            {
                                                              id v536 = 0;
                                                              goto LABEL_195;
                                                            }
                                                            objc_opt_class();
                                                            if (objc_opt_isKindOfClass())
                                                            {
                                                              id v536 = v209;
LABEL_195:
                                                              v210 = [v6 objectForKeyedSubscript:@"containsFamily"];
                                                              if (!v210
                                                                || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                                              {
                                                                v531 = v210;
                                                                id v534 = 0;
                                                                goto LABEL_198;
                                                              }
                                                              objc_opt_class();
                                                              if (objc_opt_isKindOfClass())
                                                              {
                                                                v531 = v210;
                                                                id v534 = v210;
LABEL_198:
                                                                uint64_t v211 = [v6 objectForKeyedSubscript:@"containsFriends"];
                                                                v533 = (void *)v211;
                                                                if (!v211
                                                                  || (v212 = (void *)v211,
                                                                      objc_opt_class(),
                                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                                {
                                                                  id v532 = 0;
                                                                  goto LABEL_201;
                                                                }
                                                                objc_opt_class();
                                                                if (objc_opt_isKindOfClass())
                                                                {
                                                                  id v532 = v212;
LABEL_201:
                                                                  uint64_t v213 = [v6 objectForKeyedSubscript:@"containsPartner"];
                                                                  v530 = (void *)v213;
                                                                  if (!v213
                                                                    || (v214 = (void *)v213,
                                                                        objc_opt_class(),
                                                                        (objc_opt_isKindOfClass() & 1) != 0))
                                                                  {
                                                                    id v527 = 0;
                                                                    goto LABEL_204;
                                                                  }
                                                                  objc_opt_class();
                                                                  if (objc_opt_isKindOfClass())
                                                                  {
                                                                    id v527 = v214;
LABEL_204:
                                                                    uint64_t v215 = [v6 objectForKeyedSubscript:@"containsParent"];
                                                                    v529 = (void *)v215;
                                                                    if (!v215
                                                                      || (v216 = (void *)v215,
                                                                          objc_opt_class(),
                                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                                    {
                                                                      id v528 = 0;
                                                                      goto LABEL_207;
                                                                    }
                                                                    objc_opt_class();
                                                                    if (objc_opt_isKindOfClass())
                                                                    {
                                                                      id v528 = v216;
LABEL_207:
                                                                      uint64_t v217 = [v6 objectForKeyedSubscript:@"containsSibling"];
                                                                      v526 = (void *)v217;
                                                                      if (!v217
                                                                        || (v218 = (void *)v217,
                                                                            objc_opt_class(),
                                                                            (objc_opt_isKindOfClass() & 1) != 0))
                                                                      {
                                                                        id v525 = 0;
                                                                        goto LABEL_210;
                                                                      }
                                                                      objc_opt_class();
                                                                      if (objc_opt_isKindOfClass())
                                                                      {
                                                                        id v525 = v218;
LABEL_210:
                                                                        uint64_t v219 = [v6 objectForKeyedSubscript:@"containsChild"];
                                                                        v524 = (void *)v219;
                                                                        if (!v219
                                                                          || (v220 = (void *)v219,
                                                                              objc_opt_class(),
                                                                              (objc_opt_isKindOfClass() & 1) != 0))
                                                                        {
                                                                          id v523 = 0;
                                                                          goto LABEL_213;
                                                                        }
                                                                        objc_opt_class();
                                                                        if (objc_opt_isKindOfClass())
                                                                        {
                                                                          id v523 = v220;
LABEL_213:
                                                                          uint64_t v221 = [v6 objectForKeyedSubscript:@"isCoupon"];
                                                                          v521 = (void *)v221;
                                                                          if (!v221
                                                                            || (v222 = (void *)v221,
                                                                                objc_opt_class(),
                                                                                (objc_opt_isKindOfClass() & 1) != 0))
                                                                          {
                                                                            id v522 = 0;
                                                                            goto LABEL_216;
                                                                          }
                                                                          objc_opt_class();
                                                                          if (objc_opt_isKindOfClass())
                                                                          {
                                                                            id v522 = v222;
LABEL_216:
                                                                            uint64_t v223 = [v6 objectForKeyedSubscript:@"isRecipe"];
                                                                            v519 = (void *)v223;
                                                                            if (!v223
                                                                              || (v224 = (void *)v223,
                                                                                  objc_opt_class(),
                                                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                                                            {
                                                                              id v520 = 0;
                                                                              goto LABEL_219;
                                                                            }
                                                                            objc_opt_class();
                                                                            if (objc_opt_isKindOfClass())
                                                                            {
                                                                              id v520 = v224;
LABEL_219:
                                                                              uint64_t v225 = [v6 objectForKeyedSubscript:@"isReceipt"];
                                                                              v518 = (void *)v225;
                                                                              if (!v225
                                                                                || (v226 = (void *)v225,
                                                                                    objc_opt_class(),
                                                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                                                              {
                                                                                id v517 = 0;
                                                                                goto LABEL_222;
                                                                              }
                                                                              objc_opt_class();
                                                                              if (objc_opt_isKindOfClass())
                                                                              {
                                                                                id v517 = v226;
LABEL_222:
                                                                                uint64_t v227 = [v6 objectForKeyedSubscript:@"isRecentView"];
                                                                                v516 = (void *)v227;
                                                                                if (!v227
                                                                                  || (v228 = (void *)v227,
                                                                                      objc_opt_class(),
                                                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                                                {
                                                                                  id v513 = 0;
                                                                                  goto LABEL_225;
                                                                                }
                                                                                objc_opt_class();
                                                                                if (objc_opt_isKindOfClass())
                                                                                {
                                                                                  id v513 = v228;
LABEL_225:
                                                                                  uint64_t v229 = [v6 objectForKeyedSubscript:@"isRecentEdit"];
                                                                                  v515 = (void *)v229;
                                                                                  if (!v229
                                                                                    || (v230 = (void *)v229,
                                                                                        objc_opt_class(),
                                                                                        (objc_opt_isKindOfClass() & 1) != 0))
                                                                                  {
                                                                                    id v514 = 0;
                                                                                    goto LABEL_228;
                                                                                  }
                                                                                  objc_opt_class();
                                                                                  if (objc_opt_isKindOfClass())
                                                                                  {
                                                                                    id v514 = v230;
LABEL_228:
                                                                                    uint64_t v231 = [v6 objectForKeyedSubscript:@"isRecentShare"];
                                                                                    v511 = (void *)v231;
                                                                                    if (!v231
                                                                                      || (v232 = (void *)v231,
                                                                                          objc_opt_class(),
                                                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                                                    {
                                                                                      id v512 = 0;
                                                                                      goto LABEL_231;
                                                                                    }
                                                                                    objc_opt_class();
                                                                                    if (objc_opt_isKindOfClass())
                                                                                    {
                                                                                      id v512 = v232;
LABEL_231:
                                                                                      uint64_t v233 = [v6 objectForKeyedSubscript:@"isRecentFavorite"];
                                                                                      v508 = (void *)v233;
                                                                                      if (!v233
                                                                                        || (v234 = (void *)v233,
                                                                                            objc_opt_class(),
                                                                                            (objc_opt_isKindOfClass() & 1) != 0))
                                                                                      {
                                                                                        id v509 = 0;
                                                                                        goto LABEL_234;
                                                                                      }
                                                                                      objc_opt_class();
                                                                                      if (objc_opt_isKindOfClass())
                                                                                      {
                                                                                        id v509 = v234;
LABEL_234:
                                                                                        uint64_t v235 = [v6 objectForKeyedSubscript:@"isContainedInSharedAlbum"];
                                                                                        v507 = (void *)v235;
                                                                                        if (!v235
                                                                                          || (v236 = (void *)v235,
                                                                                              objc_opt_class(),
                                                                                              (objc_opt_isKindOfClass() & 1) != 0))
                                                                                        {
                                                                                          id v600 = 0;
                                                                                          goto LABEL_237;
                                                                                        }
                                                                                        objc_opt_class();
                                                                                        if (objc_opt_isKindOfClass())
                                                                                        {
                                                                                          id v600 = v236;
LABEL_237:
                                                                                          v506 = [v6 objectForKeyedSubscript:@"isContainedInOnThisDay"];
                                                                                          if (!v506
                                                                                            || (objc_opt_class(),
                                                                                                (objc_opt_isKindOfClass() & 1) != 0))
                                                                                          {
                                                                                            id v504 = 0;
LABEL_240:
                                                                                            id v237 = [v6 objectForKeyedSubscript:@"capturedAtAOI"];
                                                                                            v502 = v237;
                                                                                            if (!v237) {
                                                                                              goto LABEL_378;
                                                                                            }
                                                                                            objc_opt_class();
                                                                                            if (objc_opt_isKindOfClass())
                                                                                            {
                                                                                              id v237 = 0;
                                                                                              goto LABEL_378;
                                                                                            }
                                                                                            objc_opt_class();
                                                                                            if (objc_opt_isKindOfClass())
                                                                                            {
                                                                                              id v237 = v502;
LABEL_378:
                                                                                              id v498 = v237;
                                                                                              v500 = [v6 objectForKeyedSubscript:@"capturedAtPOI"];
                                                                                              if (!v500
                                                                                                || (objc_opt_class(),
                                                                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                                                                              {
                                                                                                id v383 = 0;
                                                                                                goto LABEL_381;
                                                                                              }
                                                                                              objc_opt_class();
                                                                                              if (objc_opt_isKindOfClass())
                                                                                              {
                                                                                                id v383 = v500;
LABEL_381:
                                                                                                v494 = [v6 objectForKeyedSubscript:@"capturedAtROI"];
                                                                                                if (!v494 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                                                                                {
                                                                                                  id v496 = 0;
LABEL_384:
                                                                                                  [v6 objectForKeyedSubscript:@"capturedAtBusiness"];
                                                                                                  v493 = id v490 = v383;
                                                                                                  if (v493 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                  {
                                                                                                    objc_opt_class();
                                                                                                    if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                    {
                                                                                                      v410 = self;
                                                                                                      if (!a4)
                                                                                                      {
                                                                                                        id v492 = 0;
                                                                                                        uint64_t v45 = 0;
                                                                                                        uint64_t v56 = v613;
                                                                                                        goto LABEL_479;
                                                                                                      }
                                                                                                      id v411 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                      uint64_t v412 = *MEMORY[0x1E4F502C8];
                                                                                                      uint64_t v636 = *MEMORY[0x1E4F28568];
                                                                                                      id v489 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"capturedAtBusiness"];
                                                                                                      id v637 = v489;
                                                                                                      v491 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v637 forKeys:&v636 count:1];
                                                                                                      id v413 = (id)objc_msgSend(v411, "initWithDomain:code:userInfo:", v412, 2);
                                                                                                      id v492 = 0;
                                                                                                      uint64_t v45 = 0;
                                                                                                      *a4 = v413;
                                                                                                      goto LABEL_537;
                                                                                                    }
                                                                                                    id v492 = v493;
                                                                                                  }
                                                                                                  else
                                                                                                  {
                                                                                                    id v492 = 0;
                                                                                                  }
                                                                                                  v491 = [v6 objectForKeyedSubscript:@"isCapturedAtPublicEvent"];
                                                                                                  if (!v491 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                                                                                  {
                                                                                                    id v489 = 0;
                                                                                                    goto LABEL_390;
                                                                                                  }
                                                                                                  objc_opt_class();
                                                                                                  if (objc_opt_isKindOfClass())
                                                                                                  {
                                                                                                    id v489 = v491;
LABEL_390:
                                                                                                    v487 = [v6 objectForKeyedSubscript:@"isContainedInVisualTrend"];
                                                                                                    if (!v487 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                                                                                    {
                                                                                                      id v488 = 0;
                                                                                                      goto LABEL_393;
                                                                                                    }
                                                                                                    v402 = self;
                                                                                                    objc_opt_class();
                                                                                                    if (objc_opt_isKindOfClass())
                                                                                                    {
                                                                                                      id v488 = v487;
LABEL_393:
                                                                                                      v486 = [v6 objectForKeyedSubscript:@"isContainedInActivity"];
                                                                                                      if (!v486 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                                                                                      {
                                                                                                        id v485 = 0;
                                                                                                        id v384 = v620;
                                                                                                        goto LABEL_396;
                                                                                                      }
                                                                                                      id v384 = v620;
                                                                                                      v402 = self;
                                                                                                      objc_opt_class();
                                                                                                      if (objc_opt_isKindOfClass())
                                                                                                      {
                                                                                                        id v485 = v486;
LABEL_396:
                                                                                                        v589 = v8;
                                                                                                        [v6 objectForKeyedSubscript:@"isContainedInChildActivity"];
                                                                                                        v597 = v7;
                                                                                                        v583 = v10;
                                                                                                        v482 = id v620 = v384;
                                                                                                        if (v482)
                                                                                                        {
                                                                                                          id v385 = v623;
                                                                                                          objc_opt_class();
                                                                                                          if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                          {
                                                                                                            objc_opt_class();
                                                                                                            if (objc_opt_isKindOfClass())
                                                                                                            {
                                                                                                              id v484 = v482;
                                                                                                              goto LABEL_435;
                                                                                                            }
                                                                                                            if (a4)
                                                                                                            {
                                                                                                              id v423 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                              uint64_t v424 = *MEMORY[0x1E4F502C8];
                                                                                                              uint64_t v628 = *MEMORY[0x1E4F28568];
                                                                                                              id v483 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isContainedInChildActivity"];
                                                                                                              id v629 = v483;
                                                                                                              v407 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v629 forKeys:&v628 count:1];
                                                                                                              id v484 = 0;
                                                                                                              uint64_t v45 = 0;
                                                                                                              *a4 = (id)[v423 initWithDomain:v424 code:2 userInfo:v407];
                                                                                                              goto LABEL_548;
                                                                                                            }
                                                                                                            id v484 = 0;
                                                                                                            uint64_t v45 = 0;
                                                                                                            id v7 = v597;
LABEL_546:
                                                                                                            id v11 = v614;
                                                                                                            uint64_t v56 = v613;
                                                                                                            v434 = v608;
                                                                                                            id v383 = v490;
                                                                                                            goto LABEL_475;
                                                                                                          }
                                                                                                        }
                                                                                                        else
                                                                                                        {
                                                                                                          id v385 = v623;
                                                                                                        }
                                                                                                        id v484 = 0;
LABEL_435:
                                                                                                        v407 = [v6 objectForKeyedSubscript:@"userLibraryAgeInDays"];
                                                                                                        id v623 = v385;
                                                                                                        if (!v407 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                                                                                        {
                                                                                                          id v483 = 0;
                                                                                                          goto LABEL_469;
                                                                                                        }
                                                                                                        objc_opt_class();
                                                                                                        if (objc_opt_isKindOfClass())
                                                                                                        {
                                                                                                          id v483 = v407;
LABEL_468:

LABEL_469:
                                                                                                          v426 = [v6 objectForKeyedSubscript:@"userisDAU"];
                                                                                                          if (!v426 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                                                                                          {
                                                                                                            v427 = v426;
                                                                                                            id v428 = 0;
LABEL_472:
                                                                                                            unsigned int v429 = [v562 intValue];
                                                                                                            unsigned int v430 = [v563 intValue];
                                                                                                            unsigned int v431 = [v560 intValue];
                                                                                                            unsigned int v432 = [v558 intValue];
                                                                                                            v433 = v428;
                                                                                                            LODWORD(v481) = [v483 intValue];
                                                                                                            unint64_t v480 = __PAIR64__(v432, v431);
                                                                                                            unint64_t v479 = __PAIR64__(v430, v429);
                                                                                                            id v11 = v614;
                                                                                                            v434 = v608;
                                                                                                            self = -[BMPhotosUserAnalytics initWithIdentifier:userEvent:containsVIP:faceCount:containsPets:capturedAtHome:capturedAtWork:capturedAtFrequentLocation:capturedOnTrip:capturedOnShortTrip:isDocument:isMeme:isScreenshot:isFavorite:isCapturedOnWeekend:isCapturedAtPrivateEvent:isCapturedOnHoliday:mediaType:importSource:assetAge:userLibrarySize:userNumTrips:userNumVIPPeople:userNumFavorites:userHasVIP:userHasHome:userHasPet:containsBaby:containsSocialGroup:containsMyPet:containsCoWorker:containsFamily:containsFriends:containsPartner:containsParent:containsSibling:containsChild:isCoupon:isRecipe:isReceipt:isRecentView:isRecentEdit:isRecentShare:isRecentFavorite:isContainedInSharedAlbum:isContainedInOnThisDay:capturedAtAOI:capturedAtPOI:capturedAtROI:capturedAtBusiness:isCapturedAtPublicEvent:isContainedInVisualTrend:isContainedInActivity:isContainedInChildActivity:userLibraryAgeInDays:userisDAU:](v593, "initWithIdentifier:userEvent:containsVIP:faceCount:containsPets:capturedAtHome:capturedAtWork:capturedAtFrequentLocation:capturedOnTrip:capturedOnShortTrip:isDocument:isMeme:isScreenshot:isFavorite:isCapturedOnWeekend:isCapturedAtPrivateEvent:isCapturedOnHoliday:mediaType:importSource:assetAge:userLibrarySize:userNumTrips:userNumVIPPeople:userNumFavorites:userHasVIP:userHasHome:userHasPet:containsBaby:containsSocialGroup:containsMyPet:containsCoWorker:containsFamily:containsFriends:containsPartner:containsParent:containsSibling:containsChild:isCoupon:isRecipe:isReceipt:isRecentView:isRecentEdit:isRecentShare:isRecentFavorite:isContainedInSharedAlbum:isContainedInOnThisDay:capturedAtAOI:capturedAtPOI:capturedAtROI:capturedAtBusiness:isCapturedAtPublicEvent:isContainedInVisualTrend:isContainedInActivity:isContainedInChildActivity:userLibraryAgeInDays:userisDAU:", v385, v620, v614, v621, v615, v608, v609, v605, v602, v590, v591, v585, v578, v575, v572, v569, v566, v479, v480, v556, v553, v549, v550, v546, v542, v543, v540, v538, v536, v534, v532, v527, v528, v525, v523, v522, v520, v517, v513, v514, v512, v509, v600, v504, v498, v490, v496, v492, v489, v488, v485, v484, v481, v428);
                                                                                                            uint64_t v45 = self;
                                                                                                            id v7 = v597;
LABEL_473:

                                                                                                            double v10 = v583;
                                                                                                            uint64_t v56 = v613;
LABEL_474:
                                                                                                            id v383 = v490;

                                                                                                            id v8 = v589;
LABEL_475:

LABEL_476:
LABEL_477:

LABEL_478:
                                                                                                            v608 = v434;

                                                                                                            goto LABEL_479;
                                                                                                          }
                                                                                                          objc_opt_class();
                                                                                                          v427 = v426;
                                                                                                          if (objc_opt_isKindOfClass())
                                                                                                          {
                                                                                                            id v428 = v426;
                                                                                                            goto LABEL_472;
                                                                                                          }
                                                                                                          if (a4)
                                                                                                          {
                                                                                                            id v436 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                            uint64_t v437 = *MEMORY[0x1E4F502C8];
                                                                                                            uint64_t v624 = *MEMORY[0x1E4F28568];
                                                                                                            v438 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"userisDAU"];
                                                                                                            v625 = v438;
                                                                                                            v439 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v625 forKeys:&v624 count:1];
                                                                                                            *a4 = (id)[v436 initWithDomain:v437 code:2 userInfo:v439];
                                                                                                          }
                                                                                                          v433 = 0;
                                                                                                          uint64_t v45 = 0;
LABEL_544:
                                                                                                          self = v593;
                                                                                                          id v7 = v597;
                                                                                                          id v11 = v614;
                                                                                                          v434 = v608;
                                                                                                          goto LABEL_473;
                                                                                                        }
                                                                                                        objc_opt_class();
                                                                                                        if (objc_opt_isKindOfClass())
                                                                                                        {
                                                                                                          id v425 = v407;
                                                                                                          id v483 = [NSNumber numberWithInt:BMPhotosUserAnalyticsUserLibraryAgeInDaysTypeFromString(v425)];

                                                                                                          goto LABEL_468;
                                                                                                        }
                                                                                                        if (a4)
                                                                                                        {
                                                                                                          id v440 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                          uint64_t v441 = *MEMORY[0x1E4F502C8];
                                                                                                          uint64_t v626 = *MEMORY[0x1E4F28568];
                                                                                                          v433 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"userLibraryAgeInDays"];
                                                                                                          v627 = v433;
                                                                                                          v427 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v627 forKeys:&v626 count:1];
                                                                                                          id v483 = 0;
                                                                                                          uint64_t v45 = 0;
                                                                                                          *a4 = (id)objc_msgSend(v440, "initWithDomain:code:userInfo:", v441, 2);
                                                                                                          goto LABEL_544;
                                                                                                        }
                                                                                                        id v483 = 0;
                                                                                                        uint64_t v45 = 0;
LABEL_548:
                                                                                                        id v7 = v597;
                                                                                                        id v11 = v614;
                                                                                                        uint64_t v56 = v613;
                                                                                                        v434 = v608;
                                                                                                        goto LABEL_474;
                                                                                                      }
                                                                                                      if (a4)
                                                                                                      {
                                                                                                        id v420 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                        uint64_t v421 = *MEMORY[0x1E4F502C8];
                                                                                                        uint64_t v630 = *MEMORY[0x1E4F28568];
                                                                                                        id v484 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isContainedInActivity"];
                                                                                                        id v631 = v484;
                                                                                                        v482 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v631 forKeys:&v630 count:1];
                                                                                                        id v422 = (id)objc_msgSend(v420, "initWithDomain:code:userInfo:", v421, 2);
                                                                                                        id v485 = 0;
                                                                                                        uint64_t v45 = 0;
                                                                                                        *a4 = v422;
                                                                                                        goto LABEL_546;
                                                                                                      }
                                                                                                      id v485 = 0;
                                                                                                      uint64_t v45 = 0;
LABEL_541:
                                                                                                      self = v402;
                                                                                                      id v11 = v614;
                                                                                                      uint64_t v56 = v613;
                                                                                                      v434 = v608;
                                                                                                      id v383 = v490;
                                                                                                      goto LABEL_476;
                                                                                                    }
                                                                                                    if (a4)
                                                                                                    {
                                                                                                      id v417 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                      uint64_t v418 = *MEMORY[0x1E4F502C8];
                                                                                                      uint64_t v632 = *MEMORY[0x1E4F28568];
                                                                                                      id v485 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isContainedInVisualTrend"];
                                                                                                      id v633 = v485;
                                                                                                      v486 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v633 forKeys:&v632 count:1];
                                                                                                      id v419 = (id)objc_msgSend(v417, "initWithDomain:code:userInfo:", v418, 2);
                                                                                                      id v488 = 0;
                                                                                                      uint64_t v45 = 0;
                                                                                                      *a4 = v419;
                                                                                                      goto LABEL_541;
                                                                                                    }
                                                                                                    id v488 = 0;
                                                                                                    uint64_t v45 = 0;
LABEL_539:
                                                                                                    id v11 = v614;
                                                                                                    uint64_t v56 = v613;
                                                                                                    v434 = v608;
                                                                                                    id v383 = v490;
                                                                                                    goto LABEL_477;
                                                                                                  }
                                                                                                  v410 = self;
                                                                                                  if (a4)
                                                                                                  {
                                                                                                    id v414 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                    uint64_t v415 = *MEMORY[0x1E4F502C8];
                                                                                                    uint64_t v634 = *MEMORY[0x1E4F28568];
                                                                                                    id v488 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isCapturedAtPublicEvent"];
                                                                                                    id v635 = v488;
                                                                                                    v487 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v635 forKeys:&v634 count:1];
                                                                                                    id v416 = (id)objc_msgSend(v414, "initWithDomain:code:userInfo:", v415, 2);
                                                                                                    id v489 = 0;
                                                                                                    uint64_t v45 = 0;
                                                                                                    *a4 = v416;
                                                                                                    goto LABEL_539;
                                                                                                  }
                                                                                                  id v489 = 0;
                                                                                                  uint64_t v45 = 0;
LABEL_537:
                                                                                                  self = v410;
                                                                                                  uint64_t v56 = v613;
                                                                                                  v434 = v608;
                                                                                                  id v383 = v490;
                                                                                                  goto LABEL_478;
                                                                                                }
                                                                                                objc_opt_class();
                                                                                                if (objc_opt_isKindOfClass())
                                                                                                {
                                                                                                  id v496 = v494;
                                                                                                  goto LABEL_384;
                                                                                                }
                                                                                                v390 = self;
                                                                                                if (a4)
                                                                                                {
                                                                                                  id v408 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                  uint64_t v497 = *MEMORY[0x1E4F502C8];
                                                                                                  uint64_t v638 = *MEMORY[0x1E4F28568];
                                                                                                  id v492 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"capturedAtROI"];
                                                                                                  id v639 = v492;
                                                                                                  v493 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v639 forKeys:&v638 count:1];
                                                                                                  id v409 = (id)objc_msgSend(v408, "initWithDomain:code:userInfo:", v497, 2);
                                                                                                  id v496 = 0;
                                                                                                  uint64_t v45 = 0;
                                                                                                  *a4 = v409;
                                                                                                  uint64_t v56 = v613;
LABEL_479:

                                                                                                  goto LABEL_480;
                                                                                                }
                                                                                                id v496 = 0;
                                                                                                uint64_t v45 = 0;
LABEL_465:
                                                                                                self = v390;
                                                                                                uint64_t v56 = v613;
LABEL_480:
                                                                                                v318 = v531;

                                                                                                goto LABEL_481;
                                                                                              }
                                                                                              v390 = self;
                                                                                              if (a4)
                                                                                              {
                                                                                                id v403 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                uint64_t v495 = *MEMORY[0x1E4F502C8];
                                                                                                uint64_t v640 = *MEMORY[0x1E4F28568];
                                                                                                id v496 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"capturedAtPOI"];
                                                                                                id v641 = v496;
                                                                                                uint64_t v404 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v641 forKeys:&v640 count:1];
                                                                                                uint64_t v405 = v495;
                                                                                                v494 = (void *)v404;
                                                                                                id v406 = (id)objc_msgSend(v403, "initWithDomain:code:userInfo:", v405, 2);
                                                                                                id v383 = 0;
                                                                                                uint64_t v45 = 0;
                                                                                                *a4 = v406;
                                                                                                goto LABEL_465;
                                                                                              }
                                                                                              id v383 = 0;
                                                                                              uint64_t v45 = 0;
LABEL_461:
                                                                                              self = v390;
                                                                                              uint64_t v56 = v613;
                                                                                              v318 = v531;
LABEL_481:

                                                                                              v395 = v498;
                                                                                              goto LABEL_482;
                                                                                            }
                                                                                            v390 = self;
                                                                                            if (a4)
                                                                                            {
                                                                                              id v501 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                              uint64_t v499 = *MEMORY[0x1E4F502C8];
                                                                                              uint64_t v642 = *MEMORY[0x1E4F28568];
                                                                                              id v383 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"capturedAtAOI"];
                                                                                              id v643 = v383;
                                                                                              uint64_t v399 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v643 forKeys:&v642 count:1];
                                                                                              v400 = v501;
                                                                                              v500 = (void *)v399;
                                                                                              id v401 = (id)objc_msgSend(v400, "initWithDomain:code:userInfo:", v499, 2);
                                                                                              id v498 = 0;
                                                                                              uint64_t v45 = 0;
                                                                                              *a4 = v401;
                                                                                              goto LABEL_461;
                                                                                            }
                                                                                            v395 = 0;
                                                                                            uint64_t v45 = 0;
LABEL_457:
                                                                                            self = v390;
                                                                                            uint64_t v56 = v613;
                                                                                            v318 = v531;
LABEL_482:

                                                                                            goto LABEL_483;
                                                                                          }
                                                                                          objc_opt_class();
                                                                                          if (objc_opt_isKindOfClass())
                                                                                          {
                                                                                            id v504 = v506;
                                                                                            goto LABEL_240;
                                                                                          }
                                                                                          v390 = self;
                                                                                          if (a4)
                                                                                          {
                                                                                            id v505 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                            uint64_t v503 = *MEMORY[0x1E4F502C8];
                                                                                            uint64_t v644 = *MEMORY[0x1E4F28568];
                                                                                            v395 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isContainedInOnThisDay"];
                                                                                            v645 = v395;
                                                                                            uint64_t v396 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v645 forKeys:&v644 count:1];
                                                                                            uint64_t v397 = v503;
                                                                                            v502 = (void *)v396;
                                                                                            id v398 = (id)objc_msgSend(v505, "initWithDomain:code:userInfo:", v397, 2);
                                                                                            id v504 = 0;
                                                                                            uint64_t v45 = 0;
                                                                                            *a4 = v398;
                                                                                            goto LABEL_457;
                                                                                          }
                                                                                          id v504 = 0;
                                                                                          uint64_t v45 = 0;
LABEL_453:
                                                                                          self = v390;
                                                                                          uint64_t v56 = v613;
                                                                                          v318 = v531;
LABEL_483:
                                                                                          v371 = v513;

                                                                                          goto LABEL_484;
                                                                                        }
                                                                                        v390 = self;
                                                                                        if (a4)
                                                                                        {
                                                                                          id v393 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                          uint64_t v601 = *MEMORY[0x1E4F502C8];
                                                                                          uint64_t v646 = *MEMORY[0x1E4F28568];
                                                                                          id v504 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isContainedInSharedAlbum"];
                                                                                          id v647 = v504;
                                                                                          v506 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v647 forKeys:&v646 count:1];
                                                                                          id v394 = (id)objc_msgSend(v393, "initWithDomain:code:userInfo:", v601, 2);
                                                                                          id v600 = 0;
                                                                                          uint64_t v45 = 0;
                                                                                          *a4 = v394;
                                                                                          goto LABEL_453;
                                                                                        }
                                                                                        id v600 = 0;
                                                                                        uint64_t v45 = 0;
LABEL_447:
                                                                                        self = v390;
                                                                                        uint64_t v56 = v613;
                                                                                        v318 = v531;
                                                                                        v371 = v513;
LABEL_484:

                                                                                        goto LABEL_485;
                                                                                      }
                                                                                      v390 = self;
                                                                                      if (a4)
                                                                                      {
                                                                                        id v391 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                        uint64_t v510 = *MEMORY[0x1E4F502C8];
                                                                                        uint64_t v648 = *MEMORY[0x1E4F28568];
                                                                                        id v600 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isRecentFavorite"];
                                                                                        id v649 = v600;
                                                                                        v507 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v649 forKeys:&v648 count:1];
                                                                                        id v392 = (id)objc_msgSend(v391, "initWithDomain:code:userInfo:", v510, 2);
                                                                                        id v509 = 0;
                                                                                        uint64_t v45 = 0;
                                                                                        *a4 = v392;
                                                                                        goto LABEL_447;
                                                                                      }
                                                                                      id v509 = 0;
                                                                                      uint64_t v45 = 0;
LABEL_443:
                                                                                      uint64_t v56 = v613;
                                                                                      v318 = v531;
                                                                                      v371 = v513;
LABEL_485:

                                                                                      goto LABEL_486;
                                                                                    }
                                                                                    if (a4)
                                                                                    {
                                                                                      id v386 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                      uint64_t v387 = *MEMORY[0x1E4F502C8];
                                                                                      uint64_t v650 = *MEMORY[0x1E4F28568];
                                                                                      id v388 = [NSString alloc];
                                                                                      uint64_t v478 = objc_opt_class();
                                                                                      v389 = v388;
                                                                                      self = v593;
                                                                                      id v509 = (id)[v389 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v478, @"isRecentShare"];
                                                                                      id v651 = v509;
                                                                                      v508 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v651 forKeys:&v650 count:1];
                                                                                      id v512 = 0;
                                                                                      uint64_t v45 = 0;
                                                                                      *a4 = (id)objc_msgSend(v386, "initWithDomain:code:userInfo:", v387, 2);
                                                                                      goto LABEL_443;
                                                                                    }
                                                                                    id v512 = 0;
                                                                                    uint64_t v45 = 0;
LABEL_432:
                                                                                    uint64_t v56 = v613;
                                                                                    v318 = v531;
                                                                                    v371 = v513;
LABEL_486:

                                                                                    goto LABEL_487;
                                                                                  }
                                                                                  if (a4)
                                                                                  {
                                                                                    id v379 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                    uint64_t v380 = *MEMORY[0x1E4F502C8];
                                                                                    uint64_t v652 = *MEMORY[0x1E4F28568];
                                                                                    id v381 = [NSString alloc];
                                                                                    uint64_t v477 = objc_opt_class();
                                                                                    v382 = v381;
                                                                                    self = v593;
                                                                                    id v512 = (id)[v382 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v477, @"isRecentEdit"];
                                                                                    id v653 = v512;
                                                                                    v511 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v653 forKeys:&v652 count:1];
                                                                                    id v514 = 0;
                                                                                    uint64_t v45 = 0;
                                                                                    *a4 = (id)objc_msgSend(v379, "initWithDomain:code:userInfo:", v380, 2);
                                                                                    goto LABEL_432;
                                                                                  }
                                                                                  id v514 = 0;
                                                                                  uint64_t v45 = 0;
                                                                                  uint64_t v56 = v613;
                                                                                  v318 = v531;
                                                                                  v371 = v513;
LABEL_487:

                                                                                  goto LABEL_488;
                                                                                }
                                                                                if (a4)
                                                                                {
                                                                                  id v374 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                  uint64_t v375 = *MEMORY[0x1E4F502C8];
                                                                                  uint64_t v654 = *MEMORY[0x1E4F28568];
                                                                                  id v376 = [NSString alloc];
                                                                                  uint64_t v476 = objc_opt_class();
                                                                                  v377 = v376;
                                                                                  self = v593;
                                                                                  id v514 = (id)[v377 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v476, @"isRecentView"];
                                                                                  id v655 = v514;
                                                                                  v515 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v655 forKeys:&v654 count:1];
                                                                                  id v378 = (id)objc_msgSend(v374, "initWithDomain:code:userInfo:", v375, 2);
                                                                                  v371 = 0;
                                                                                  uint64_t v45 = 0;
                                                                                  *a4 = v378;
                                                                                  uint64_t v56 = v613;
                                                                                  v318 = v531;
                                                                                  goto LABEL_487;
                                                                                }
                                                                                v371 = 0;
                                                                                uint64_t v45 = 0;
LABEL_421:
                                                                                uint64_t v56 = v613;
                                                                                v318 = v531;
LABEL_488:

                                                                                goto LABEL_489;
                                                                              }
                                                                              if (a4)
                                                                              {
                                                                                id v367 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                uint64_t v368 = *MEMORY[0x1E4F502C8];
                                                                                uint64_t v656 = *MEMORY[0x1E4F28568];
                                                                                id v369 = [NSString alloc];
                                                                                uint64_t v475 = objc_opt_class();
                                                                                v370 = v369;
                                                                                self = v593;
                                                                                v371 = (void *)[v370 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v475, @"isReceipt"];
                                                                                v657 = v371;
                                                                                uint64_t v372 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v657 forKeys:&v656 count:1];
                                                                                uint64_t v373 = v368;
                                                                                id v11 = v614;
                                                                                v516 = (void *)v372;
                                                                                id v517 = 0;
                                                                                uint64_t v45 = 0;
                                                                                *a4 = (id)objc_msgSend(v367, "initWithDomain:code:userInfo:", v373, 2);
                                                                                goto LABEL_421;
                                                                              }
                                                                              id v517 = 0;
                                                                              uint64_t v45 = 0;
LABEL_415:
                                                                              uint64_t v56 = v613;
                                                                              v318 = v531;
LABEL_489:
                                                                              v331 = v527;

                                                                              v362 = v519;
                                                                              goto LABEL_490;
                                                                            }
                                                                            if (a4)
                                                                            {
                                                                              id v363 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                              uint64_t v364 = *MEMORY[0x1E4F502C8];
                                                                              uint64_t v658 = *MEMORY[0x1E4F28568];
                                                                              id v365 = [NSString alloc];
                                                                              uint64_t v474 = objc_opt_class();
                                                                              v366 = v365;
                                                                              self = v593;
                                                                              id v517 = (id)[v366 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v474, @"isRecipe"];
                                                                              id v659 = v517;
                                                                              v518 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v659 forKeys:&v658 count:1];
                                                                              id v520 = 0;
                                                                              uint64_t v45 = 0;
                                                                              *a4 = (id)objc_msgSend(v363, "initWithDomain:code:userInfo:", v364, 2);
                                                                              goto LABEL_415;
                                                                            }
                                                                            id v520 = 0;
                                                                            uint64_t v45 = 0;
                                                                            uint64_t v56 = v613;
                                                                            v318 = v531;
                                                                            v362 = v519;
LABEL_409:
                                                                            v331 = v527;
LABEL_490:

                                                                            v354 = v521;
                                                                            goto LABEL_491;
                                                                          }
                                                                          if (a4)
                                                                          {
                                                                            v355 = a4;
                                                                            id v356 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                            uint64_t v357 = *MEMORY[0x1E4F502C8];
                                                                            uint64_t v660 = *MEMORY[0x1E4F28568];
                                                                            id v358 = [NSString alloc];
                                                                            uint64_t v473 = objc_opt_class();
                                                                            v359 = v358;
                                                                            self = v593;
                                                                            id v520 = (id)[v359 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v473, @"isCoupon"];
                                                                            id v661 = v520;
                                                                            uint64_t v360 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v661 forKeys:&v660 count:1];
                                                                            uint64_t v361 = v357;
                                                                            id v11 = v614;
                                                                            id v522 = 0;
                                                                            uint64_t v45 = 0;
                                                                            id *v355 = (id)[v356 initWithDomain:v361 code:2 userInfo:v360];
                                                                            v362 = (void *)v360;
                                                                            uint64_t v56 = v613;
                                                                            v318 = v531;
                                                                            goto LABEL_409;
                                                                          }
                                                                          id v522 = 0;
                                                                          uint64_t v45 = 0;
                                                                          uint64_t v56 = v613;
                                                                          v318 = v531;
                                                                          v354 = v521;
LABEL_403:
                                                                          v331 = v527;
LABEL_491:

                                                                          goto LABEL_492;
                                                                        }
                                                                        if (a4)
                                                                        {
                                                                          v347 = a4;
                                                                          id v348 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                          uint64_t v349 = *MEMORY[0x1E4F502C8];
                                                                          uint64_t v662 = *MEMORY[0x1E4F28568];
                                                                          id v350 = [NSString alloc];
                                                                          uint64_t v472 = objc_opt_class();
                                                                          v351 = v350;
                                                                          self = v593;
                                                                          id v522 = (id)[v351 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v472, @"containsChild"];
                                                                          id v663 = v522;
                                                                          uint64_t v352 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v663 forKeys:&v662 count:1];
                                                                          uint64_t v353 = v349;
                                                                          id v11 = v614;
                                                                          id v523 = 0;
                                                                          uint64_t v45 = 0;
                                                                          id *v347 = (id)[v348 initWithDomain:v353 code:2 userInfo:v352];
                                                                          v354 = (void *)v352;
                                                                          uint64_t v56 = v613;
                                                                          v318 = v531;
                                                                          goto LABEL_403;
                                                                        }
                                                                        id v523 = 0;
                                                                        uint64_t v45 = 0;
LABEL_375:
                                                                        uint64_t v56 = v613;
                                                                        v318 = v531;
                                                                        v331 = v527;
LABEL_492:

                                                                        goto LABEL_493;
                                                                      }
                                                                      if (a4)
                                                                      {
                                                                        id v343 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                        uint64_t v344 = *MEMORY[0x1E4F502C8];
                                                                        uint64_t v664 = *MEMORY[0x1E4F28568];
                                                                        id v345 = [NSString alloc];
                                                                        uint64_t v471 = objc_opt_class();
                                                                        v346 = v345;
                                                                        self = v593;
                                                                        id v523 = (id)[v346 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v471, @"containsSibling"];
                                                                        id v665 = v523;
                                                                        v524 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v665 forKeys:&v664 count:1];
                                                                        id v525 = 0;
                                                                        uint64_t v45 = 0;
                                                                        *a4 = (id)objc_msgSend(v343, "initWithDomain:code:userInfo:", v344, 2);
                                                                        goto LABEL_375;
                                                                      }
                                                                      id v525 = 0;
                                                                      uint64_t v45 = 0;
LABEL_369:
                                                                      uint64_t v56 = v613;
                                                                      v318 = v531;
                                                                      v331 = v527;
LABEL_493:

                                                                      goto LABEL_494;
                                                                    }
                                                                    if (a4)
                                                                    {
                                                                      id v339 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                      uint64_t v340 = *MEMORY[0x1E4F502C8];
                                                                      uint64_t v666 = *MEMORY[0x1E4F28568];
                                                                      id v341 = [NSString alloc];
                                                                      uint64_t v470 = objc_opt_class();
                                                                      v342 = v341;
                                                                      self = v593;
                                                                      id v525 = (id)[v342 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v470, @"containsParent"];
                                                                      id v667 = v525;
                                                                      v526 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v667 forKeys:&v666 count:1];
                                                                      id v528 = 0;
                                                                      uint64_t v45 = 0;
                                                                      *a4 = (id)objc_msgSend(v339, "initWithDomain:code:userInfo:", v340, 2);
                                                                      goto LABEL_369;
                                                                    }
                                                                    id v528 = 0;
                                                                    uint64_t v45 = 0;
                                                                    uint64_t v56 = v613;
                                                                    v318 = v531;
                                                                    v331 = v527;
LABEL_494:

                                                                    goto LABEL_495;
                                                                  }
                                                                  if (a4)
                                                                  {
                                                                    id v334 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                    uint64_t v335 = *MEMORY[0x1E4F502C8];
                                                                    uint64_t v668 = *MEMORY[0x1E4F28568];
                                                                    id v336 = [NSString alloc];
                                                                    uint64_t v469 = objc_opt_class();
                                                                    v337 = v336;
                                                                    self = v593;
                                                                    id v528 = (id)[v337 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v469, @"containsPartner"];
                                                                    id v669 = v528;
                                                                    v529 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v669 forKeys:&v668 count:1];
                                                                    id v338 = (id)objc_msgSend(v334, "initWithDomain:code:userInfo:", v335, 2);
                                                                    v331 = 0;
                                                                    uint64_t v45 = 0;
                                                                    *a4 = v338;
                                                                    uint64_t v56 = v613;
                                                                    v318 = v531;
                                                                    goto LABEL_494;
                                                                  }
                                                                  v331 = 0;
                                                                  uint64_t v45 = 0;
LABEL_358:
                                                                  uint64_t v56 = v613;
                                                                  v318 = v531;
LABEL_495:

                                                                  goto LABEL_496;
                                                                }
                                                                if (a4)
                                                                {
                                                                  id v327 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                  uint64_t v328 = *MEMORY[0x1E4F502C8];
                                                                  uint64_t v670 = *MEMORY[0x1E4F28568];
                                                                  id v329 = [NSString alloc];
                                                                  uint64_t v468 = objc_opt_class();
                                                                  v330 = v329;
                                                                  self = v593;
                                                                  v331 = (void *)[v330 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v468, @"containsFriends"];
                                                                  v671 = v331;
                                                                  uint64_t v332 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v671 forKeys:&v670 count:1];
                                                                  uint64_t v333 = v328;
                                                                  id v11 = v614;
                                                                  v530 = (void *)v332;
                                                                  id v532 = 0;
                                                                  uint64_t v45 = 0;
                                                                  *a4 = (id)objc_msgSend(v327, "initWithDomain:code:userInfo:", v333, 2);
                                                                  goto LABEL_358;
                                                                }
                                                                id v532 = 0;
                                                                uint64_t v45 = 0;
                                                                uint64_t v56 = v613;
                                                                v318 = v531;
LABEL_496:

                                                                goto LABEL_497;
                                                              }
                                                              if (a4)
                                                              {
                                                                v320 = a4;
                                                                id v535 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                uint64_t v321 = *MEMORY[0x1E4F502C8];
                                                                uint64_t v672 = *MEMORY[0x1E4F28568];
                                                                id v322 = [NSString alloc];
                                                                v318 = v210;
                                                                uint64_t v467 = objc_opt_class();
                                                                v323 = v322;
                                                                self = v593;
                                                                id v532 = (id)[v323 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v467, @"containsFamily"];
                                                                id v673 = v532;
                                                                uint64_t v324 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v673 forKeys:&v672 count:1];
                                                                uint64_t v325 = v321;
                                                                id v11 = v614;
                                                                v533 = (void *)v324;
                                                                id v326 = (id)objc_msgSend(v535, "initWithDomain:code:userInfo:", v325, 2);
                                                                id v534 = 0;
                                                                uint64_t v45 = 0;
                                                                id *v320 = v326;
                                                                uint64_t v56 = v613;
                                                                goto LABEL_496;
                                                              }
                                                              id v534 = 0;
                                                              uint64_t v45 = 0;
                                                              uint64_t v56 = v613;
                                                              v318 = v210;
LABEL_497:
                                                              v280 = v542;

                                                              a4 = v608;
                                                              goto LABEL_498;
                                                            }
                                                            if (a4)
                                                            {
                                                              v313 = a4;
                                                              id v314 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                              uint64_t v315 = *MEMORY[0x1E4F502C8];
                                                              uint64_t v674 = *MEMORY[0x1E4F28568];
                                                              id v316 = [NSString alloc];
                                                              uint64_t v466 = objc_opt_class();
                                                              v317 = v316;
                                                              self = v593;
                                                              id v534 = (id)[v317 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v466, @"containsCoWorker"];
                                                              id v675 = v534;
                                                              v318 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v675 forKeys:&v674 count:1];
                                                              uint64_t v319 = v315;
                                                              id v11 = v614;
                                                              id v536 = 0;
                                                              uint64_t v45 = 0;
                                                              id *v313 = (id)[v314 initWithDomain:v319 code:2 userInfo:v318];
                                                              uint64_t v56 = v613;
                                                              goto LABEL_497;
                                                            }
                                                            id v536 = 0;
                                                            uint64_t v45 = 0;
                                                            uint64_t v56 = v613;
                                                            a4 = v608;
LABEL_342:
                                                            v280 = v542;
LABEL_498:

                                                            goto LABEL_499;
                                                          }
                                                          if (a4)
                                                          {
                                                            v306 = a4;
                                                            id v307 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                            uint64_t v308 = *MEMORY[0x1E4F502C8];
                                                            uint64_t v676 = *MEMORY[0x1E4F28568];
                                                            id v309 = [NSString alloc];
                                                            uint64_t v465 = objc_opt_class();
                                                            v310 = v309;
                                                            self = v593;
                                                            a4 = v608;
                                                            id v536 = (id)[v310 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v465, @"containsMyPet"];
                                                            id v677 = v536;
                                                            uint64_t v311 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v677 forKeys:&v676 count:1];
                                                            uint64_t v312 = v308;
                                                            id v11 = v614;
                                                            v537 = (void *)v311;
                                                            id v538 = 0;
                                                            uint64_t v45 = 0;
                                                            id *v306 = (id)objc_msgSend(v307, "initWithDomain:code:userInfo:", v312, 2);
                                                            uint64_t v56 = v613;
                                                            goto LABEL_342;
                                                          }
                                                          id v538 = 0;
                                                          uint64_t v45 = 0;
                                                          uint64_t v56 = v613;
                                                          a4 = v608;
LABEL_336:
                                                          v280 = v542;
LABEL_499:

                                                          goto LABEL_500;
                                                        }
                                                        if (a4)
                                                        {
                                                          v299 = a4;
                                                          id v300 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                          uint64_t v301 = *MEMORY[0x1E4F502C8];
                                                          uint64_t v678 = *MEMORY[0x1E4F28568];
                                                          id v302 = [NSString alloc];
                                                          uint64_t v464 = objc_opt_class();
                                                          v303 = v302;
                                                          self = v593;
                                                          a4 = v608;
                                                          id v538 = (id)[v303 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v464, @"containsSocialGroup"];
                                                          id v679 = v538;
                                                          uint64_t v304 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v679 forKeys:&v678 count:1];
                                                          uint64_t v305 = v301;
                                                          id v11 = v614;
                                                          v539 = (void *)v304;
                                                          id v540 = 0;
                                                          uint64_t v45 = 0;
                                                          id *v299 = (id)objc_msgSend(v300, "initWithDomain:code:userInfo:", v305, 2);
                                                          uint64_t v56 = v613;
                                                          goto LABEL_336;
                                                        }
                                                        id v540 = 0;
                                                        uint64_t v45 = 0;
                                                        uint64_t v56 = v613;
                                                        a4 = v608;
LABEL_330:
                                                        v280 = v542;
LABEL_500:

                                                        goto LABEL_501;
                                                      }
                                                      if (a4)
                                                      {
                                                        v292 = a4;
                                                        id v293 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                        uint64_t v294 = *MEMORY[0x1E4F502C8];
                                                        uint64_t v680 = *MEMORY[0x1E4F28568];
                                                        id v295 = [NSString alloc];
                                                        uint64_t v463 = objc_opt_class();
                                                        v296 = v295;
                                                        self = v593;
                                                        a4 = v608;
                                                        id v540 = (id)[v296 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v463, @"containsBaby"];
                                                        id v681 = v540;
                                                        uint64_t v297 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v681 forKeys:&v680 count:1];
                                                        uint64_t v298 = v294;
                                                        id v11 = v614;
                                                        v541 = (void *)v297;
                                                        id v543 = 0;
                                                        uint64_t v45 = 0;
                                                        id *v292 = (id)objc_msgSend(v293, "initWithDomain:code:userInfo:", v298, 2);
                                                        uint64_t v56 = v613;
                                                        goto LABEL_330;
                                                      }
                                                      id v543 = 0;
                                                      uint64_t v45 = 0;
                                                      uint64_t v56 = v613;
                                                      a4 = v608;
                                                      v280 = v542;
LABEL_501:

                                                      goto LABEL_502;
                                                    }
                                                    if (a4)
                                                    {
                                                      v284 = a4;
                                                      id v285 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                      uint64_t v286 = *MEMORY[0x1E4F502C8];
                                                      uint64_t v682 = *MEMORY[0x1E4F28568];
                                                      id v287 = [NSString alloc];
                                                      uint64_t v462 = objc_opt_class();
                                                      v288 = v287;
                                                      self = v593;
                                                      a4 = v608;
                                                      id v543 = (id)[v288 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v462, @"userHasPet"];
                                                      id v683 = v543;
                                                      uint64_t v289 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v683 forKeys:&v682 count:1];
                                                      uint64_t v290 = v286;
                                                      id v11 = v614;
                                                      v544 = (void *)v289;
                                                      id v291 = (id)objc_msgSend(v285, "initWithDomain:code:userInfo:", v290, 2);
                                                      v280 = 0;
                                                      uint64_t v45 = 0;
                                                      id *v284 = v291;
                                                      uint64_t v56 = v613;
                                                      goto LABEL_501;
                                                    }
                                                    v280 = 0;
                                                    uint64_t v45 = 0;
                                                    uint64_t v56 = v613;
                                                    a4 = v608;
LABEL_502:

                                                    goto LABEL_503;
                                                  }
                                                  if (a4)
                                                  {
                                                    v276 = a4;
                                                    id v547 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                    uint64_t v277 = *MEMORY[0x1E4F502C8];
                                                    uint64_t v684 = *MEMORY[0x1E4F28568];
                                                    id v278 = [NSString alloc];
                                                    uint64_t v461 = objc_opt_class();
                                                    v279 = v278;
                                                    self = v593;
                                                    a4 = v608;
                                                    v280 = (void *)[v279 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v461, @"userHasHome"];
                                                    v685 = v280;
                                                    uint64_t v281 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v685 forKeys:&v684 count:1];
                                                    uint64_t v282 = v277;
                                                    id v11 = v614;
                                                    v545 = (void *)v281;
                                                    id v283 = (id)objc_msgSend(v547, "initWithDomain:code:userInfo:", v282, 2);
                                                    id v546 = 0;
                                                    uint64_t v45 = 0;
                                                    id *v276 = v283;
                                                    uint64_t v56 = v613;
                                                    goto LABEL_502;
                                                  }
                                                  id v546 = 0;
                                                  uint64_t v45 = 0;
                                                  uint64_t v56 = v613;
                                                  a4 = v608;
LABEL_503:
                                                  v249 = v549;

                                                  goto LABEL_504;
                                                }
                                                if (a4)
                                                {
                                                  v265 = a4;
                                                  id v266 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                  uint64_t v267 = *MEMORY[0x1E4F502C8];
                                                  uint64_t v686 = *MEMORY[0x1E4F28568];
                                                  id v268 = [NSString alloc];
                                                  uint64_t v460 = objc_opt_class();
                                                  v269 = v268;
                                                  self = v593;
                                                  a4 = v608;
                                                  id v546 = (id)[v269 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v460, @"userHasVIP"];
                                                  id v687 = v546;
                                                  uint64_t v270 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v687 forKeys:&v686 count:1];
                                                  uint64_t v271 = v267;
                                                  id v11 = v614;
                                                  v548 = (void *)v270;
                                                  id v550 = 0;
                                                  uint64_t v45 = 0;
                                                  id *v265 = (id)objc_msgSend(v266, "initWithDomain:code:userInfo:", v271, 2);
                                                  uint64_t v56 = v613;
                                                  goto LABEL_503;
                                                }
                                                id v550 = 0;
                                                uint64_t v45 = 0;
                                                uint64_t v56 = v613;
                                                a4 = v608;
                                                v249 = v549;
LABEL_504:

                                                goto LABEL_505;
                                              }
                                              if (a4)
                                              {
                                                v253 = a4;
                                                id v254 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                uint64_t v255 = *MEMORY[0x1E4F502C8];
                                                uint64_t v688 = *MEMORY[0x1E4F28568];
                                                id v256 = [NSString alloc];
                                                uint64_t v459 = objc_opt_class();
                                                v257 = v256;
                                                self = v593;
                                                a4 = v608;
                                                id v550 = (id)[v257 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v459, @"userNumFavorites"];
                                                id v689 = v550;
                                                uint64_t v258 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v689 forKeys:&v688 count:1];
                                                uint64_t v259 = v255;
                                                id v11 = v614;
                                                v551 = (void *)v258;
                                                id v260 = (id)objc_msgSend(v254, "initWithDomain:code:userInfo:", v259, 2);
                                                v249 = 0;
                                                uint64_t v45 = 0;
                                                id *v253 = v260;
                                                uint64_t v56 = v613;
                                                goto LABEL_504;
                                              }
                                              v249 = 0;
                                              uint64_t v45 = 0;
                                              uint64_t v56 = v613;
                                              a4 = v608;
LABEL_505:

                                              goto LABEL_506;
                                            }
                                            if (a4)
                                            {
                                              v245 = a4;
                                              id v554 = objc_alloc(MEMORY[0x1E4F28C58]);
                                              uint64_t v246 = *MEMORY[0x1E4F502C8];
                                              uint64_t v690 = *MEMORY[0x1E4F28568];
                                              id v247 = [NSString alloc];
                                              uint64_t v458 = objc_opt_class();
                                              v248 = v247;
                                              self = v593;
                                              a4 = v608;
                                              v249 = (void *)[v248 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v458, @"userNumVIPPeople"];
                                              v691 = v249;
                                              uint64_t v250 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v691 forKeys:&v690 count:1];
                                              uint64_t v251 = v246;
                                              id v11 = v614;
                                              v552 = (void *)v250;
                                              id v252 = (id)objc_msgSend(v554, "initWithDomain:code:userInfo:", v251, 2);
                                              id v553 = 0;
                                              uint64_t v45 = 0;
                                              id *v245 = v252;
                                              uint64_t v56 = v613;
                                              goto LABEL_505;
                                            }
                                            id v553 = 0;
                                            uint64_t v45 = 0;
                                            uint64_t v56 = v613;
                                            a4 = v608;
LABEL_506:
                                            id v173 = v562;

                                            goto LABEL_507;
                                          }
                                          if (a4)
                                          {
                                            v238 = a4;
                                            id v239 = objc_alloc(MEMORY[0x1E4F28C58]);
                                            uint64_t v240 = *MEMORY[0x1E4F502C8];
                                            uint64_t v692 = *MEMORY[0x1E4F28568];
                                            id v241 = [NSString alloc];
                                            uint64_t v457 = objc_opt_class();
                                            v242 = v241;
                                            self = v593;
                                            a4 = v608;
                                            id v553 = (id)[v242 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v457, @"userNumTrips"];
                                            id v693 = v553;
                                            uint64_t v243 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v693 forKeys:&v692 count:1];
                                            uint64_t v244 = v240;
                                            id v11 = v614;
                                            v555 = (void *)v243;
                                            id v556 = 0;
                                            uint64_t v45 = 0;
                                            id *v238 = (id)objc_msgSend(v239, "initWithDomain:code:userInfo:", v244, 2);
                                            uint64_t v56 = v613;
                                            goto LABEL_506;
                                          }
                                          id v556 = 0;
                                          uint64_t v45 = 0;
LABEL_288:
                                          uint64_t v56 = v613;
                                          a4 = v608;
                                          id v173 = v562;
LABEL_507:

                                          goto LABEL_508;
                                        }
                                        objc_opt_class();
                                        if (objc_opt_isKindOfClass())
                                        {
                                          id v189 = v187;
                                          id v188 = [NSNumber numberWithInt:BMPhotosUserAnalyticsLibrarySizeTypeFromString(v189)];

                                          goto LABEL_164;
                                        }
                                        if (a4)
                                        {
                                          id v274 = objc_alloc(MEMORY[0x1E4F28C58]);
                                          uint64_t v275 = *MEMORY[0x1E4F502C8];
                                          uint64_t v694 = *MEMORY[0x1E4F28568];
                                          id v556 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"userLibrarySize"];
                                          id v695 = v556;
                                          v557 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v695 forKeys:&v694 count:1];
                                          v558 = 0;
                                          uint64_t v45 = 0;
                                          *a4 = (id)objc_msgSend(v274, "initWithDomain:code:userInfo:", v275, 2);
                                          id v11 = v614;
                                          goto LABEL_288;
                                        }
                                        v558 = 0;
                                        uint64_t v45 = 0;
LABEL_313:
                                        id v11 = v614;
                                        uint64_t v56 = v613;
                                        a4 = v608;
                                        id v173 = v562;
LABEL_508:

                                        goto LABEL_509;
                                      }
                                      objc_opt_class();
                                      if (objc_opt_isKindOfClass())
                                      {
                                        id v185 = v183;
                                        id v184 = [NSNumber numberWithInt:BMPhotosUserAnalyticsAssetAgeTypeFromString(v185)];

                                        goto LABEL_156;
                                      }
                                      if (a4)
                                      {
                                        id v272 = objc_alloc(MEMORY[0x1E4F28C58]);
                                        uint64_t v273 = *MEMORY[0x1E4F502C8];
                                        uint64_t v696 = *MEMORY[0x1E4F28568];
                                        v558 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"assetAge"];
                                        v697 = v558;
                                        v559 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v697 forKeys:&v696 count:1];
                                        v560 = 0;
                                        uint64_t v45 = 0;
                                        *a4 = (id)objc_msgSend(v272, "initWithDomain:code:userInfo:", v273, 2);
                                        goto LABEL_313;
                                      }
                                      v560 = 0;
                                      uint64_t v45 = 0;
LABEL_307:
                                      id v11 = v614;
                                      uint64_t v56 = v613;
                                      a4 = v608;
                                      id v173 = v562;
LABEL_509:

                                      goto LABEL_510;
                                    }
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      id v181 = v179;
                                      id v180 = [NSNumber numberWithInt:BMPhotosUserAnalyticsImportSourceTypeFromString(v181)];

                                      goto LABEL_147;
                                    }
                                    if (a4)
                                    {
                                      id v263 = objc_alloc(MEMORY[0x1E4F28C58]);
                                      uint64_t v264 = *MEMORY[0x1E4F502C8];
                                      uint64_t v698 = *MEMORY[0x1E4F28568];
                                      v560 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"importSource"];
                                      v699 = v560;
                                      v561 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v699 forKeys:&v698 count:1];
                                      v563 = 0;
                                      uint64_t v45 = 0;
                                      *a4 = (id)objc_msgSend(v263, "initWithDomain:code:userInfo:", v264, 2);
                                      goto LABEL_307;
                                    }
                                    v563 = 0;
                                    uint64_t v45 = 0;
                                    uint64_t v56 = v613;
                                    a4 = v608;
                                    id v173 = v562;
LABEL_510:

                                    goto LABEL_511;
                                  }
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    id v177 = v40;
                                    id v147 = [NSNumber numberWithInt:BMPhotosUserAnalyticsMediaTypeTypeFromString(v177)];

                                    goto LABEL_139;
                                  }
                                  if (a4)
                                  {
                                    id v261 = objc_alloc(MEMORY[0x1E4F28C58]);
                                    uint64_t v262 = *MEMORY[0x1E4F502C8];
                                    uint64_t v700 = *MEMORY[0x1E4F28568];
                                    v563 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"mediaType"];
                                    v701 = v563;
                                    v564 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v701 forKeys:&v700 count:1];
                                    id v173 = 0;
                                    uint64_t v45 = 0;
                                    *a4 = (id)objc_msgSend(v261, "initWithDomain:code:userInfo:", v262, 2);
                                    id v11 = v614;
                                    uint64_t v56 = v613;
                                    a4 = v608;
                                    goto LABEL_510;
                                  }
                                  id v173 = 0;
                                  uint64_t v45 = 0;
                                  uint64_t v56 = v613;
                                  a4 = v608;
LABEL_511:

                                  goto LABEL_512;
                                }
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  id v569 = v36;
                                  goto LABEL_49;
                                }
                                if (a4)
                                {
                                  v162 = a4;
                                  id v570 = objc_alloc(MEMORY[0x1E4F28C58]);
                                  uint64_t v163 = *MEMORY[0x1E4F502C8];
                                  uint64_t v704 = *MEMORY[0x1E4F28568];
                                  id v164 = [NSString alloc];
                                  uint64_t v455 = objc_opt_class();
                                  id v165 = v164;
                                  self = v593;
                                  a4 = v608;
                                  v112 = v590;
                                  id v566 = (id)[v165 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v455, @"isCapturedAtPrivateEvent"];
                                  id v705 = v566;
                                  uint64_t v166 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v705 forKeys:&v704 count:1];
                                  uint64_t v167 = v163;
                                  id v11 = v614;
                                  v568 = (void *)v166;
                                  id v168 = (id)objc_msgSend(v570, "initWithDomain:code:userInfo:", v167, 2);
                                  id v569 = 0;
                                  uint64_t v45 = 0;
                                  id *v162 = v168;
                                  uint64_t v56 = v613;
LABEL_513:

                                  goto LABEL_514;
                                }
                                id v569 = 0;
                                uint64_t v45 = 0;
                                uint64_t v56 = v613;
                                a4 = v608;
                                v112 = v590;
LABEL_514:

                                goto LABEL_515;
                              }
                              if (a4)
                              {
                                id v155 = a4;
                                id v573 = objc_alloc(MEMORY[0x1E4F28C58]);
                                uint64_t v156 = *MEMORY[0x1E4F502C8];
                                uint64_t v706 = *MEMORY[0x1E4F28568];
                                id v157 = [NSString alloc];
                                uint64_t v454 = objc_opt_class();
                                id v158 = v157;
                                self = v593;
                                a4 = v608;
                                v112 = v590;
                                id v569 = (id)[v158 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v454, @"isCapturedOnWeekend"];
                                id v707 = v569;
                                uint64_t v159 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v707 forKeys:&v706 count:1];
                                uint64_t v160 = v156;
                                id v11 = v614;
                                v571 = (void *)v159;
                                id v161 = (id)objc_msgSend(v573, "initWithDomain:code:userInfo:", v160, 2);
                                id v572 = 0;
                                uint64_t v45 = 0;
                                *id v155 = v161;
                                uint64_t v56 = v613;
                                goto LABEL_514;
                              }
                              id v572 = 0;
                              uint64_t v45 = 0;
                              uint64_t v56 = v613;
                              a4 = v608;
                              v112 = v590;
LABEL_515:

                              goto LABEL_516;
                            }
                            if (a4)
                            {
                              id v148 = a4;
                              id v576 = objc_alloc(MEMORY[0x1E4F28C58]);
                              uint64_t v149 = *MEMORY[0x1E4F502C8];
                              uint64_t v708 = *MEMORY[0x1E4F28568];
                              id v150 = [NSString alloc];
                              uint64_t v453 = objc_opt_class();
                              id v151 = v150;
                              self = v593;
                              a4 = v608;
                              v112 = v590;
                              id v572 = (id)[v151 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v453, @"isFavorite"];
                              id v709 = v572;
                              uint64_t v152 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v709 forKeys:&v708 count:1];
                              uint64_t v153 = v149;
                              id v11 = v614;
                              v574 = (void *)v152;
                              id v154 = (id)objc_msgSend(v576, "initWithDomain:code:userInfo:", v153, 2);
                              id v575 = 0;
                              uint64_t v45 = 0;
                              *id v148 = v154;
                              uint64_t v56 = v613;
                              goto LABEL_515;
                            }
                            id v575 = 0;
                            uint64_t v45 = 0;
                            uint64_t v56 = v613;
                            a4 = v608;
                            v112 = v590;
LABEL_516:

                            goto LABEL_517;
                          }
                          if (a4)
                          {
                            id v140 = a4;
                            id v579 = objc_alloc(MEMORY[0x1E4F28C58]);
                            uint64_t v141 = *MEMORY[0x1E4F502C8];
                            uint64_t v710 = *MEMORY[0x1E4F28568];
                            id v142 = [NSString alloc];
                            uint64_t v452 = objc_opt_class();
                            id v143 = v142;
                            self = v593;
                            a4 = v608;
                            v112 = v590;
                            id v575 = (id)[v143 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v452, @"isScreenshot"];
                            id v711 = v575;
                            uint64_t v144 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v711 forKeys:&v710 count:1];
                            uint64_t v145 = v141;
                            id v11 = v614;
                            v577 = (void *)v144;
                            id v146 = (id)objc_msgSend(v579, "initWithDomain:code:userInfo:", v145, 2);
                            id v578 = 0;
                            uint64_t v45 = 0;
                            *id v140 = v146;
                            uint64_t v56 = v613;
                            goto LABEL_516;
                          }
                          id v578 = 0;
                          uint64_t v45 = 0;
                          uint64_t v56 = v613;
                          a4 = v608;
                          v112 = v590;
LABEL_517:

                          goto LABEL_518;
                        }
                        if (a4)
                        {
                          id v133 = a4;
                          id v586 = objc_alloc(MEMORY[0x1E4F28C58]);
                          uint64_t v134 = *MEMORY[0x1E4F502C8];
                          uint64_t v712 = *MEMORY[0x1E4F28568];
                          id v135 = [NSString alloc];
                          uint64_t v451 = objc_opt_class();
                          id v136 = v135;
                          self = v593;
                          a4 = v608;
                          v112 = v590;
                          id v578 = (id)[v136 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v451, @"isMeme"];
                          id v713 = v578;
                          uint64_t v137 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v713 forKeys:&v712 count:1];
                          uint64_t v138 = v134;
                          id v11 = v614;
                          v584 = (void *)v137;
                          id v139 = (id)objc_msgSend(v586, "initWithDomain:code:userInfo:", v138, 2);
                          id v585 = 0;
                          uint64_t v45 = 0;
                          *id v133 = v139;
                          uint64_t v56 = v613;
                          goto LABEL_517;
                        }
                        id v585 = 0;
                        uint64_t v45 = 0;
                        uint64_t v56 = v613;
                        a4 = v608;
                        v112 = v590;
LABEL_518:

                        goto LABEL_519;
                      }
                      if (a4)
                      {
                        v125 = a4;
                        id v592 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v126 = *MEMORY[0x1E4F502C8];
                        uint64_t v714 = *MEMORY[0x1E4F28568];
                        v582 = v10;
                        v127 = self;
                        id v128 = [NSString alloc];
                        uint64_t v450 = objc_opt_class();
                        id v129 = v128;
                        self = v127;
                        a4 = v608;
                        v112 = v590;
                        double v10 = v582;
                        id v585 = (id)[v129 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v450, @"isDocument"];
                        id v715 = v585;
                        uint64_t v130 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v715 forKeys:&v714 count:1];
                        uint64_t v131 = v126;
                        id v11 = v614;
                        v587 = (void *)v130;
                        id v132 = (id)objc_msgSend(v592, "initWithDomain:code:userInfo:", v131, 2);
                        id v591 = 0;
                        uint64_t v45 = 0;
                        id *v125 = v132;
                        uint64_t v56 = v613;
                        goto LABEL_518;
                      }
                      id v591 = 0;
                      uint64_t v45 = 0;
                      uint64_t v56 = v613;
                      a4 = v608;
                      v112 = v590;
LABEL_519:

                      goto LABEL_520;
                    }
                    if (a4)
                    {
                      v116 = a4;
                      id v117 = objc_alloc(MEMORY[0x1E4F28C58]);
                      uint64_t v118 = *MEMORY[0x1E4F502C8];
                      uint64_t v716 = *MEMORY[0x1E4F28568];
                      v581 = v10;
                      v119 = self;
                      id v120 = [NSString alloc];
                      uint64_t v449 = objc_opt_class();
                      v121 = v120;
                      self = v119;
                      a4 = v608;
                      double v10 = v581;
                      id v591 = (id)[v121 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v449, @"capturedOnShortTrip"];
                      id v717 = v591;
                      uint64_t v122 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v717 forKeys:&v716 count:1];
                      uint64_t v123 = v118;
                      id v11 = v614;
                      v595 = (void *)v122;
                      id v124 = (id)objc_msgSend(v117, "initWithDomain:code:userInfo:", v123, 2);
                      v112 = 0;
                      uint64_t v45 = 0;
                      id *v116 = v124;
                      uint64_t v56 = v613;
                      goto LABEL_519;
                    }
                    v112 = 0;
                    uint64_t v45 = 0;
                    uint64_t v56 = v613;
                    a4 = v608;
LABEL_520:

                    id v9 = v620;
                    goto LABEL_521;
                  }
                  if (a4)
                  {
                    id v603 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v108 = *MEMORY[0x1E4F502C8];
                    uint64_t v718 = *MEMORY[0x1E4F28568];
                    v580 = v10;
                    v109 = self;
                    id v110 = [NSString alloc];
                    uint64_t v448 = objc_opt_class();
                    v111 = v110;
                    self = v109;
                    double v10 = v580;
                    v112 = (void *)[v111 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v448, @"capturedOnTrip"];
                    v719 = v112;
                    uint64_t v113 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v719 forKeys:&v718 count:1];
                    uint64_t v114 = v108;
                    id v11 = v614;
                    v598 = (void *)v113;
                    id v115 = (id)objc_msgSend(v603, "initWithDomain:code:userInfo:", v114, 2);
                    id v602 = 0;
                    uint64_t v45 = 0;
                    *a4 = v115;
                    a4 = v608;
                    uint64_t v56 = v613;
                    goto LABEL_520;
                  }
                  id v602 = 0;
                  uint64_t v45 = 0;
                  uint64_t v56 = v613;
                  id v9 = v620;
                  a4 = v608;
LABEL_521:

                  goto LABEL_522;
                }
                if (a4)
                {
                  id v606 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v100 = *MEMORY[0x1E4F502C8];
                  uint64_t v720 = *MEMORY[0x1E4F28568];
                  v588 = v8;
                  v101 = v10;
                  v102 = self;
                  id v103 = [NSString alloc];
                  uint64_t v447 = objc_opt_class();
                  v104 = v103;
                  self = v102;
                  id v9 = v620;
                  double v10 = v101;
                  id v8 = v588;
                  id v602 = (id)[v104 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v447, @"capturedAtFrequentLocation"];
                  id v721 = v602;
                  uint64_t v105 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v721 forKeys:&v720 count:1];
                  uint64_t v106 = v100;
                  id v11 = v614;
                  v604 = (void *)v105;
                  id v107 = (id)objc_msgSend(v606, "initWithDomain:code:userInfo:", v106, 2);
                  id v605 = 0;
                  uint64_t v45 = 0;
                  *a4 = v107;
                  a4 = v608;
                  uint64_t v56 = v613;
                  goto LABEL_521;
                }
                id v605 = 0;
                uint64_t v45 = 0;
                uint64_t v56 = v613;
                id v9 = v620;
                a4 = v608;
LABEL_522:

                goto LABEL_523;
              }
              if (a4)
              {
                id v610 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v91 = *MEMORY[0x1E4F502C8];
                uint64_t v722 = *MEMORY[0x1E4F28568];
                v596 = v7;
                v92 = v8;
                v93 = v10;
                v94 = self;
                id v95 = [NSString alloc];
                uint64_t v446 = objc_opt_class();
                v96 = v95;
                self = v94;
                id v9 = v620;
                double v10 = v93;
                id v8 = v92;
                id v7 = v596;
                id v605 = (id)[v96 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v446, @"capturedAtWork"];
                id v723 = v605;
                uint64_t v97 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v723 forKeys:&v722 count:1];
                uint64_t v98 = v91;
                id v11 = v614;
                v607 = (void *)v97;
                id v99 = (id)objc_msgSend(v610, "initWithDomain:code:userInfo:", v98, 2);
                id v609 = 0;
                uint64_t v45 = 0;
                *a4 = v99;
                a4 = v608;
                uint64_t v56 = v613;
                goto LABEL_522;
              }
              id v609 = 0;
              uint64_t v45 = 0;
              uint64_t v56 = v613;
              id v9 = v620;
              a4 = v608;
LABEL_523:

              goto LABEL_524;
            }
            if (a4)
            {
              id v81 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v82 = *MEMORY[0x1E4F502C8];
              uint64_t v724 = *MEMORY[0x1E4F28568];
              id v599 = v6;
              v83 = v7;
              v84 = v8;
              v85 = v10;
              v86 = self;
              id v87 = [NSString alloc];
              uint64_t v445 = objc_opt_class();
              v88 = v87;
              self = v86;
              id v9 = v620;
              double v10 = v85;
              id v8 = v84;
              id v7 = v83;
              id v6 = v599;
              id v609 = (id)[v88 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v445, @"capturedAtHome"];
              id v725 = v609;
              uint64_t v89 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v725 forKeys:&v724 count:1];
              uint64_t v90 = v82;
              id v11 = v614;
              v611 = (void *)v89;
              uint64_t v45 = 0;
              *a4 = (id)objc_msgSend(v81, "initWithDomain:code:userInfo:", v90, 2);
              a4 = 0;
              uint64_t v56 = v613;
              goto LABEL_523;
            }
            uint64_t v45 = 0;
            uint64_t v56 = v613;
            id v9 = v620;
LABEL_524:

            goto LABEL_525;
          }
          if (a4)
          {
            id v616 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v69 = *MEMORY[0x1E4F502C8];
            uint64_t v726 = *MEMORY[0x1E4F28568];
            id v70 = v6;
            int v71 = v7;
            double v72 = v8;
            double v73 = v10;
            double v74 = self;
            id v75 = [NSString alloc];
            uint64_t v444 = objc_opt_class();
            v76 = v75;
            self = v74;
            id v9 = v620;
            double v10 = v73;
            id v8 = v72;
            id v7 = v71;
            id v6 = v70;
            v77 = (id *)[v76 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v444, @"containsPets"];
            v727 = v77;
            uint64_t v78 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v727 forKeys:&v726 count:1];
            uint64_t v79 = v69;
            id v11 = v614;
            v612 = (void *)v78;
            id v80 = (id)objc_msgSend(v616, "initWithDomain:code:userInfo:", v79, 2);
            id v615 = 0;
            uint64_t v45 = 0;
            *a4 = v80;
            a4 = v77;
            uint64_t v56 = v613;
            goto LABEL_524;
          }
          id v615 = 0;
          uint64_t v45 = 0;
          uint64_t v56 = v613;
          id v9 = v620;
LABEL_525:

          goto LABEL_526;
        }
        uint64_t v56 = v12;
        if (a4)
        {
          id v622 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v619 = *MEMORY[0x1E4F502C8];
          uint64_t v728 = *MEMORY[0x1E4F28568];
          id v59 = v6;
          uint64_t v60 = v7;
          uint64_t v61 = v8;
          uint64_t v62 = v10;
          uint64_t v63 = self;
          id v64 = [NSString alloc];
          uint64_t v443 = objc_opt_class();
          int v65 = v64;
          self = v63;
          id v9 = v620;
          double v10 = v62;
          id v8 = v61;
          id v7 = v60;
          id v6 = v59;
          id v11 = v614;
          id v615 = (id)[v65 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v443, @"faceCount"];
          id v729 = v615;
          uint64_t v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v729 forKeys:&v728 count:1];
          uint64_t v67 = v619;
          v617 = (void *)v66;
          id v68 = (id)objc_msgSend(v622, "initWithDomain:code:userInfo:", v67, 2);
          id v621 = 0;
          uint64_t v45 = 0;
          *a4 = v68;
          goto LABEL_525;
        }
        id v621 = 0;
        uint64_t v45 = 0;
        id v9 = v620;
LABEL_526:

        goto LABEL_527;
      }
      if (a4)
      {
        uint64_t v50 = a4;
        id v51 = objc_alloc(MEMORY[0x1E4F28C58]);
        v594 = self;
        uint64_t v52 = *MEMORY[0x1E4F502C8];
        uint64_t v730 = *MEMORY[0x1E4F28568];
        uint64_t v53 = v10;
        v618 = v50;
        id v54 = [NSString alloc];
        uint64_t v442 = objc_opt_class();
        uint64_t v55 = v54;
        double v10 = v53;
        id v621 = (id)[v55 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v442, @"containsVIP"];
        id v731 = v621;
        uint64_t v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v731 forKeys:&v730 count:1];
        uint64_t v57 = v52;
        self = v594;
        id v58 = (id)[v51 initWithDomain:v57 code:2 userInfo:v56];
        id v11 = 0;
        uint64_t v45 = 0;
        id *v618 = v58;
        goto LABEL_526;
      }
      id v11 = 0;
      uint64_t v45 = 0;
LABEL_527:

      goto LABEL_528;
    }
    if (a4)
    {
      id v46 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v47 = *MEMORY[0x1E4F502C8];
      uint64_t v732 = *MEMORY[0x1E4F28568];
      uint64_t v48 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"userEvent"];
      uint64_t v733 = v48;
      double v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v733 forKeys:&v732 count:1];
      uint64_t v49 = v47;
      id v11 = (id)v48;
      id v9 = 0;
      uint64_t v45 = 0;
      *a4 = (id)[v46 initWithDomain:v49 code:2 userInfo:v10];
      goto LABEL_527;
    }
    id v9 = 0;
    uint64_t v45 = 0;
LABEL_528:

    goto LABEL_529;
  }
  if (a4)
  {
    id v41 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v42 = *MEMORY[0x1E4F502C8];
    uint64_t v734 = *MEMORY[0x1E4F28568];
    uint64_t v43 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"identifier"];
    v735[0] = v43;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v735 forKeys:&v734 count:1];
    uint64_t v44 = v41;
    id v9 = (id)v43;
    id v623 = 0;
    uint64_t v45 = 0;
    *a4 = (id)[v44 initWithDomain:v42 code:2 userInfo:v8];
    goto LABEL_528;
  }
  id v623 = 0;
  uint64_t v45 = 0;
LABEL_529:

  return v45;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMPhotosUserAnalytics *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_userEvent) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasContainsVIP) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasFaceCount) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasContainsPets) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasCapturedAtHome) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasCapturedAtWork) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasCapturedAtFrequentLocation) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasCapturedOnTrip) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasCapturedOnShortTrip) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsDocument) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsMeme) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsScreenshot) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsFavorite) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsCapturedOnWeekend) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsCapturedAtPrivateEvent) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsCapturedOnHoliday) {
    PBDataWriterWriteBOOLField();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasUserNumTrips) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasUserNumVIPPeople) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasUserNumFavorites) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasUserHasVIP) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasUserHasHome) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasUserHasPet) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasContainsBaby) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasContainsSocialGroup) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasContainsMyPet) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasContainsCoWorker) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasContainsFamily) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasContainsFriends) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasContainsPartner) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasContainsParent) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasContainsSibling) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasContainsChild) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsCoupon) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsRecipe) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsReceipt) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsRecentView) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsRecentEdit) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsRecentShare) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsRecentFavorite) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsContainedInSharedAlbum) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsContainedInOnThisDay) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasCapturedAtAOI) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasCapturedAtPOI) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasCapturedAtROI) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasCapturedAtBusiness) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsCapturedAtPublicEvent) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsContainedInVisualTrend) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsContainedInActivity) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsContainedInChildActivity) {
    PBDataWriterWriteBOOLField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_hasUserisDAU) {
    PBDataWriterWriteFloatField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v396.receiver = self;
  v396.super_class = (Class)BMPhotosUserAnalytics;
  id v5 = [(BMEventBase *)&v396 init];
  if (!v5) {
    goto LABEL_630;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  id v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    id v9 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v8]) {
        break;
      }
      char v10 = 0;
      unsigned int v11 = 0;
      unint64_t v12 = 0;
      while (1)
      {
        uint64_t v13 = *v6;
        uint64_t v14 = *(void *)&v4[v13];
        unint64_t v15 = v14 + 1;
        if (v14 == -1 || v15 > *(void *)&v4[*v7]) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)&v4[*v9] + v14);
        *(void *)&v4[v13] = v15;
        v12 |= (unint64_t)(v16 & 0x7F) << v10;
        if ((v16 & 0x80) == 0) {
          goto LABEL_13;
        }
        v10 += 7;
        BOOL v17 = v11++ >= 9;
        if (v17)
        {
          unint64_t v12 = 0;
          int v18 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      int v18 = v4[*v8];
      if (v4[*v8]) {
        unint64_t v12 = 0;
      }
LABEL_15:
      if (v18 || (v12 & 7) == 4) {
        break;
      }
      switch((v12 >> 3))
      {
        case 1u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 152;
          goto LABEL_24;
        case 2u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 160;
LABEL_24:
          uint64_t v22 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        case 3u:
          char v23 = 0;
          unsigned int v24 = 0;
          uint64_t v25 = 0;
          v5->_hasContainsVIP = 1;
          while (2)
          {
            uint64_t v26 = *v6;
            uint64_t v27 = *(void *)&v4[v26];
            unint64_t v28 = v27 + 1;
            if (v27 == -1 || v28 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v29 = *(unsigned char *)(*(void *)&v4[*v9] + v27);
              *(void *)&v4[v26] = v28;
              v25 |= (unint64_t)(v29 & 0x7F) << v23;
              if (v29 < 0)
              {
                v23 += 7;
                BOOL v17 = v24++ >= 9;
                if (v17)
                {
                  uint64_t v25 = 0;
                  goto LABEL_402;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v25 = 0;
          }
LABEL_402:
          BOOL v390 = v25 != 0;
          uint64_t v391 = 16;
          goto LABEL_616;
        case 4u:
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v32 = 0;
          v5->_hasFaceCount = 1;
          while (2)
          {
            uint64_t v33 = *v6;
            uint64_t v34 = *(void *)&v4[v33];
            unint64_t v35 = v34 + 1;
            if (v34 == -1 || v35 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v36 = *(unsigned char *)(*(void *)&v4[*v9] + v34);
              *(void *)&v4[v33] = v35;
              v32 |= (unint64_t)(v36 & 0x7F) << v30;
              if (v36 < 0)
              {
                v30 += 7;
                BOOL v17 = v31++ >= 9;
                if (v17)
                {
                  LODWORD(v32) = 0;
                  goto LABEL_406;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v32) = 0;
          }
LABEL_406:
          uint64_t v392 = 116;
          goto LABEL_495;
        case 5u:
          char v37 = 0;
          unsigned int v38 = 0;
          uint64_t v39 = 0;
          v5->_hasContainsPets = 1;
          while (2)
          {
            uint64_t v40 = *v6;
            uint64_t v41 = *(void *)&v4[v40];
            unint64_t v42 = v41 + 1;
            if (v41 == -1 || v42 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v43 = *(unsigned char *)(*(void *)&v4[*v9] + v41);
              *(void *)&v4[v40] = v42;
              v39 |= (unint64_t)(v43 & 0x7F) << v37;
              if (v43 < 0)
              {
                v37 += 7;
                BOOL v17 = v38++ >= 9;
                if (v17)
                {
                  uint64_t v39 = 0;
                  goto LABEL_410;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v39 = 0;
          }
LABEL_410:
          BOOL v390 = v39 != 0;
          uint64_t v391 = 19;
          goto LABEL_616;
        case 6u:
          char v44 = 0;
          unsigned int v45 = 0;
          uint64_t v46 = 0;
          v5->_hasCapturedAtHome = 1;
          while (2)
          {
            uint64_t v47 = *v6;
            uint64_t v48 = *(void *)&v4[v47];
            unint64_t v49 = v48 + 1;
            if (v48 == -1 || v49 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v50 = *(unsigned char *)(*(void *)&v4[*v9] + v48);
              *(void *)&v4[v47] = v49;
              v46 |= (unint64_t)(v50 & 0x7F) << v44;
              if (v50 < 0)
              {
                v44 += 7;
                BOOL v17 = v45++ >= 9;
                if (v17)
                {
                  uint64_t v46 = 0;
                  goto LABEL_414;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v46 = 0;
          }
LABEL_414:
          BOOL v390 = v46 != 0;
          uint64_t v391 = 21;
          goto LABEL_616;
        case 7u:
          char v51 = 0;
          unsigned int v52 = 0;
          uint64_t v53 = 0;
          v5->_hasCapturedAtWork = 1;
          while (2)
          {
            uint64_t v54 = *v6;
            uint64_t v55 = *(void *)&v4[v54];
            unint64_t v56 = v55 + 1;
            if (v55 == -1 || v56 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v57 = *(unsigned char *)(*(void *)&v4[*v9] + v55);
              *(void *)&v4[v54] = v56;
              v53 |= (unint64_t)(v57 & 0x7F) << v51;
              if (v57 < 0)
              {
                v51 += 7;
                BOOL v17 = v52++ >= 9;
                if (v17)
                {
                  uint64_t v53 = 0;
                  goto LABEL_418;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v53 = 0;
          }
LABEL_418:
          BOOL v390 = v53 != 0;
          uint64_t v391 = 23;
          goto LABEL_616;
        case 8u:
          char v58 = 0;
          unsigned int v59 = 0;
          uint64_t v60 = 0;
          v5->_hasCapturedAtFrequentLocation = 1;
          while (2)
          {
            uint64_t v61 = *v6;
            uint64_t v62 = *(void *)&v4[v61];
            unint64_t v63 = v62 + 1;
            if (v62 == -1 || v63 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v64 = *(unsigned char *)(*(void *)&v4[*v9] + v62);
              *(void *)&v4[v61] = v63;
              v60 |= (unint64_t)(v64 & 0x7F) << v58;
              if (v64 < 0)
              {
                v58 += 7;
                BOOL v17 = v59++ >= 9;
                if (v17)
                {
                  uint64_t v60 = 0;
                  goto LABEL_422;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v60 = 0;
          }
LABEL_422:
          BOOL v390 = v60 != 0;
          uint64_t v391 = 25;
          goto LABEL_616;
        case 9u:
          char v65 = 0;
          unsigned int v66 = 0;
          uint64_t v67 = 0;
          v5->_hasCapturedOnTrip = 1;
          while (2)
          {
            uint64_t v68 = *v6;
            uint64_t v69 = *(void *)&v4[v68];
            unint64_t v70 = v69 + 1;
            if (v69 == -1 || v70 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v71 = *(unsigned char *)(*(void *)&v4[*v9] + v69);
              *(void *)&v4[v68] = v70;
              v67 |= (unint64_t)(v71 & 0x7F) << v65;
              if (v71 < 0)
              {
                v65 += 7;
                BOOL v17 = v66++ >= 9;
                if (v17)
                {
                  uint64_t v67 = 0;
                  goto LABEL_426;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v67 = 0;
          }
LABEL_426:
          BOOL v390 = v67 != 0;
          uint64_t v391 = 27;
          goto LABEL_616;
        case 0xAu:
          char v72 = 0;
          unsigned int v73 = 0;
          uint64_t v74 = 0;
          v5->_hasCapturedOnShortTrip = 1;
          while (2)
          {
            uint64_t v75 = *v6;
            uint64_t v76 = *(void *)&v4[v75];
            unint64_t v77 = v76 + 1;
            if (v76 == -1 || v77 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v78 = *(unsigned char *)(*(void *)&v4[*v9] + v76);
              *(void *)&v4[v75] = v77;
              v74 |= (unint64_t)(v78 & 0x7F) << v72;
              if (v78 < 0)
              {
                v72 += 7;
                BOOL v17 = v73++ >= 9;
                if (v17)
                {
                  uint64_t v74 = 0;
                  goto LABEL_430;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v74 = 0;
          }
LABEL_430:
          BOOL v390 = v74 != 0;
          uint64_t v391 = 29;
          goto LABEL_616;
        case 0xBu:
          char v79 = 0;
          unsigned int v80 = 0;
          uint64_t v81 = 0;
          v5->_hasIsDocument = 1;
          while (2)
          {
            uint64_t v82 = *v6;
            uint64_t v83 = *(void *)&v4[v82];
            unint64_t v84 = v83 + 1;
            if (v83 == -1 || v84 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v85 = *(unsigned char *)(*(void *)&v4[*v9] + v83);
              *(void *)&v4[v82] = v84;
              v81 |= (unint64_t)(v85 & 0x7F) << v79;
              if (v85 < 0)
              {
                v79 += 7;
                BOOL v17 = v80++ >= 9;
                if (v17)
                {
                  uint64_t v81 = 0;
                  goto LABEL_434;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v81 = 0;
          }
LABEL_434:
          BOOL v390 = v81 != 0;
          uint64_t v391 = 31;
          goto LABEL_616;
        case 0xCu:
          char v86 = 0;
          unsigned int v87 = 0;
          uint64_t v88 = 0;
          v5->_hasIsMeme = 1;
          while (2)
          {
            uint64_t v89 = *v6;
            uint64_t v90 = *(void *)&v4[v89];
            unint64_t v91 = v90 + 1;
            if (v90 == -1 || v91 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v92 = *(unsigned char *)(*(void *)&v4[*v9] + v90);
              *(void *)&v4[v89] = v91;
              v88 |= (unint64_t)(v92 & 0x7F) << v86;
              if (v92 < 0)
              {
                v86 += 7;
                BOOL v17 = v87++ >= 9;
                if (v17)
                {
                  uint64_t v88 = 0;
                  goto LABEL_438;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v88 = 0;
          }
LABEL_438:
          BOOL v390 = v88 != 0;
          uint64_t v391 = 33;
          goto LABEL_616;
        case 0xDu:
          char v93 = 0;
          unsigned int v94 = 0;
          uint64_t v95 = 0;
          v5->_hasIsScreenshot = 1;
          while (2)
          {
            uint64_t v96 = *v6;
            uint64_t v97 = *(void *)&v4[v96];
            unint64_t v98 = v97 + 1;
            if (v97 == -1 || v98 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v99 = *(unsigned char *)(*(void *)&v4[*v9] + v97);
              *(void *)&v4[v96] = v98;
              v95 |= (unint64_t)(v99 & 0x7F) << v93;
              if (v99 < 0)
              {
                v93 += 7;
                BOOL v17 = v94++ >= 9;
                if (v17)
                {
                  uint64_t v95 = 0;
                  goto LABEL_442;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v95 = 0;
          }
LABEL_442:
          BOOL v390 = v95 != 0;
          uint64_t v391 = 35;
          goto LABEL_616;
        case 0xEu:
          char v100 = 0;
          unsigned int v101 = 0;
          uint64_t v102 = 0;
          v5->_hasIsFavorite = 1;
          while (2)
          {
            uint64_t v103 = *v6;
            uint64_t v104 = *(void *)&v4[v103];
            unint64_t v105 = v104 + 1;
            if (v104 == -1 || v105 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v106 = *(unsigned char *)(*(void *)&v4[*v9] + v104);
              *(void *)&v4[v103] = v105;
              v102 |= (unint64_t)(v106 & 0x7F) << v100;
              if (v106 < 0)
              {
                v100 += 7;
                BOOL v17 = v101++ >= 9;
                if (v17)
                {
                  uint64_t v102 = 0;
                  goto LABEL_446;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v102 = 0;
          }
LABEL_446:
          BOOL v390 = v102 != 0;
          uint64_t v391 = 37;
          goto LABEL_616;
        case 0xFu:
          char v107 = 0;
          unsigned int v108 = 0;
          uint64_t v109 = 0;
          v5->_hasIsCapturedOnWeekend = 1;
          while (2)
          {
            uint64_t v110 = *v6;
            uint64_t v111 = *(void *)&v4[v110];
            unint64_t v112 = v111 + 1;
            if (v111 == -1 || v112 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v113 = *(unsigned char *)(*(void *)&v4[*v9] + v111);
              *(void *)&v4[v110] = v112;
              v109 |= (unint64_t)(v113 & 0x7F) << v107;
              if (v113 < 0)
              {
                v107 += 7;
                BOOL v17 = v108++ >= 9;
                if (v17)
                {
                  uint64_t v109 = 0;
                  goto LABEL_450;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v109 = 0;
          }
LABEL_450:
          BOOL v390 = v109 != 0;
          uint64_t v391 = 39;
          goto LABEL_616;
        case 0x10u:
          char v114 = 0;
          unsigned int v115 = 0;
          uint64_t v116 = 0;
          v5->_hasIsCapturedAtPrivateEvent = 1;
          while (2)
          {
            uint64_t v117 = *v6;
            uint64_t v118 = *(void *)&v4[v117];
            unint64_t v119 = v118 + 1;
            if (v118 == -1 || v119 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v120 = *(unsigned char *)(*(void *)&v4[*v9] + v118);
              *(void *)&v4[v117] = v119;
              v116 |= (unint64_t)(v120 & 0x7F) << v114;
              if (v120 < 0)
              {
                v114 += 7;
                BOOL v17 = v115++ >= 9;
                if (v17)
                {
                  uint64_t v116 = 0;
                  goto LABEL_454;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v116 = 0;
          }
LABEL_454:
          BOOL v390 = v116 != 0;
          uint64_t v391 = 41;
          goto LABEL_616;
        case 0x11u:
          char v121 = 0;
          unsigned int v122 = 0;
          uint64_t v123 = 0;
          v5->_hasIsCapturedOnHoliday = 1;
          while (2)
          {
            uint64_t v124 = *v6;
            uint64_t v125 = *(void *)&v4[v124];
            unint64_t v126 = v125 + 1;
            if (v125 == -1 || v126 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v127 = *(unsigned char *)(*(void *)&v4[*v9] + v125);
              *(void *)&v4[v124] = v126;
              v123 |= (unint64_t)(v127 & 0x7F) << v121;
              if (v127 < 0)
              {
                v121 += 7;
                BOOL v17 = v122++ >= 9;
                if (v17)
                {
                  uint64_t v123 = 0;
                  goto LABEL_458;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v123 = 0;
          }
LABEL_458:
          BOOL v390 = v123 != 0;
          uint64_t v391 = 43;
          goto LABEL_616;
        case 0x12u:
          char v128 = 0;
          unsigned int v129 = 0;
          uint64_t v130 = 0;
          while (2)
          {
            uint64_t v131 = *v6;
            uint64_t v132 = *(void *)&v4[v131];
            unint64_t v133 = v132 + 1;
            if (v132 == -1 || v133 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v134 = *(unsigned char *)(*(void *)&v4[*v9] + v132);
              *(void *)&v4[v131] = v133;
              v130 |= (unint64_t)(v134 & 0x7F) << v128;
              if (v134 < 0)
              {
                v128 += 7;
                BOOL v17 = v129++ >= 9;
                if (v17)
                {
                  LODWORD(v130) = 0;
                  goto LABEL_462;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v130) = 0;
          }
LABEL_462:
          if (v130 >= 0xD) {
            LODWORD(v130) = 0;
          }
          uint64_t v393 = 120;
          goto LABEL_625;
        case 0x13u:
          char v135 = 0;
          unsigned int v136 = 0;
          uint64_t v130 = 0;
          while (2)
          {
            uint64_t v137 = *v6;
            uint64_t v138 = *(void *)&v4[v137];
            unint64_t v139 = v138 + 1;
            if (v138 == -1 || v139 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v140 = *(unsigned char *)(*(void *)&v4[*v9] + v138);
              *(void *)&v4[v137] = v139;
              v130 |= (unint64_t)(v140 & 0x7F) << v135;
              if (v140 < 0)
              {
                v135 += 7;
                BOOL v17 = v136++ >= 9;
                if (v17)
                {
                  LODWORD(v130) = 0;
                  goto LABEL_468;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v130) = 0;
          }
LABEL_468:
          if (v130 >= 0xD) {
            LODWORD(v130) = 0;
          }
          uint64_t v393 = 124;
          goto LABEL_625;
        case 0x14u:
          char v141 = 0;
          unsigned int v142 = 0;
          uint64_t v130 = 0;
          while (2)
          {
            uint64_t v143 = *v6;
            uint64_t v144 = *(void *)&v4[v143];
            unint64_t v145 = v144 + 1;
            if (v144 == -1 || v145 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v146 = *(unsigned char *)(*(void *)&v4[*v9] + v144);
              *(void *)&v4[v143] = v145;
              v130 |= (unint64_t)(v146 & 0x7F) << v141;
              if (v146 < 0)
              {
                v141 += 7;
                BOOL v17 = v142++ >= 9;
                if (v17)
                {
                  LODWORD(v130) = 0;
                  goto LABEL_474;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v130) = 0;
          }
LABEL_474:
          if (v130 >= 7) {
            LODWORD(v130) = 0;
          }
          uint64_t v393 = 128;
          goto LABEL_625;
        case 0x15u:
          char v147 = 0;
          unsigned int v148 = 0;
          uint64_t v130 = 0;
          while (2)
          {
            uint64_t v149 = *v6;
            uint64_t v150 = *(void *)&v4[v149];
            unint64_t v151 = v150 + 1;
            if (v150 == -1 || v151 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v152 = *(unsigned char *)(*(void *)&v4[*v9] + v150);
              *(void *)&v4[v149] = v151;
              v130 |= (unint64_t)(v152 & 0x7F) << v147;
              if (v152 < 0)
              {
                v147 += 7;
                BOOL v17 = v148++ >= 9;
                if (v17)
                {
                  LODWORD(v130) = 0;
                  goto LABEL_480;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v130) = 0;
          }
LABEL_480:
          if (v130 >= 6) {
            LODWORD(v130) = 0;
          }
          uint64_t v393 = 132;
          goto LABEL_625;
        case 0x16u:
          char v153 = 0;
          unsigned int v154 = 0;
          uint64_t v32 = 0;
          v5->_hasUserNumTrips = 1;
          while (2)
          {
            uint64_t v155 = *v6;
            uint64_t v156 = *(void *)&v4[v155];
            unint64_t v157 = v156 + 1;
            if (v156 == -1 || v157 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v158 = *(unsigned char *)(*(void *)&v4[*v9] + v156);
              *(void *)&v4[v155] = v157;
              v32 |= (unint64_t)(v158 & 0x7F) << v153;
              if (v158 < 0)
              {
                v153 += 7;
                BOOL v17 = v154++ >= 9;
                if (v17)
                {
                  LODWORD(v32) = 0;
                  goto LABEL_486;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v32) = 0;
          }
LABEL_486:
          uint64_t v392 = 136;
          goto LABEL_495;
        case 0x17u:
          char v159 = 0;
          unsigned int v160 = 0;
          uint64_t v32 = 0;
          v5->_hasUserNumVIPPeople = 1;
          while (2)
          {
            uint64_t v161 = *v6;
            uint64_t v162 = *(void *)&v4[v161];
            unint64_t v163 = v162 + 1;
            if (v162 == -1 || v163 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v164 = *(unsigned char *)(*(void *)&v4[*v9] + v162);
              *(void *)&v4[v161] = v163;
              v32 |= (unint64_t)(v164 & 0x7F) << v159;
              if (v164 < 0)
              {
                v159 += 7;
                BOOL v17 = v160++ >= 9;
                if (v17)
                {
                  LODWORD(v32) = 0;
                  goto LABEL_490;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v32) = 0;
          }
LABEL_490:
          uint64_t v392 = 140;
          goto LABEL_495;
        case 0x18u:
          char v165 = 0;
          unsigned int v166 = 0;
          uint64_t v32 = 0;
          v5->_hasUserNumFavorites = 1;
          while (2)
          {
            uint64_t v167 = *v6;
            uint64_t v168 = *(void *)&v4[v167];
            unint64_t v169 = v168 + 1;
            if (v168 == -1 || v169 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v170 = *(unsigned char *)(*(void *)&v4[*v9] + v168);
              *(void *)&v4[v167] = v169;
              v32 |= (unint64_t)(v170 & 0x7F) << v165;
              if (v170 < 0)
              {
                v165 += 7;
                BOOL v17 = v166++ >= 9;
                if (v17)
                {
                  LODWORD(v32) = 0;
                  goto LABEL_494;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v32) = 0;
          }
LABEL_494:
          uint64_t v392 = 144;
LABEL_495:
          *(_DWORD *)((char *)&v5->super.super.isa + v392) = v32;
          continue;
        case 0x19u:
          char v171 = 0;
          unsigned int v172 = 0;
          uint64_t v173 = 0;
          v5->_hasUserHasVIP = 1;
          while (2)
          {
            uint64_t v174 = *v6;
            uint64_t v175 = *(void *)&v4[v174];
            unint64_t v176 = v175 + 1;
            if (v175 == -1 || v176 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v177 = *(unsigned char *)(*(void *)&v4[*v9] + v175);
              *(void *)&v4[v174] = v176;
              v173 |= (unint64_t)(v177 & 0x7F) << v171;
              if (v177 < 0)
              {
                v171 += 7;
                BOOL v17 = v172++ >= 9;
                if (v17)
                {
                  uint64_t v173 = 0;
                  goto LABEL_499;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v173 = 0;
          }
LABEL_499:
          BOOL v390 = v173 != 0;
          uint64_t v391 = 48;
          goto LABEL_616;
        case 0x1Au:
          char v178 = 0;
          unsigned int v179 = 0;
          uint64_t v180 = 0;
          v5->_hasUserHasHome = 1;
          while (2)
          {
            uint64_t v181 = *v6;
            uint64_t v182 = *(void *)&v4[v181];
            unint64_t v183 = v182 + 1;
            if (v182 == -1 || v183 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v184 = *(unsigned char *)(*(void *)&v4[*v9] + v182);
              *(void *)&v4[v181] = v183;
              v180 |= (unint64_t)(v184 & 0x7F) << v178;
              if (v184 < 0)
              {
                v178 += 7;
                BOOL v17 = v179++ >= 9;
                if (v17)
                {
                  uint64_t v180 = 0;
                  goto LABEL_503;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v180 = 0;
          }
LABEL_503:
          BOOL v390 = v180 != 0;
          uint64_t v391 = 50;
          goto LABEL_616;
        case 0x1Bu:
          char v185 = 0;
          unsigned int v186 = 0;
          uint64_t v187 = 0;
          v5->_hasUserHasPet = 1;
          while (2)
          {
            uint64_t v188 = *v6;
            uint64_t v189 = *(void *)&v4[v188];
            unint64_t v190 = v189 + 1;
            if (v189 == -1 || v190 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v191 = *(unsigned char *)(*(void *)&v4[*v9] + v189);
              *(void *)&v4[v188] = v190;
              v187 |= (unint64_t)(v191 & 0x7F) << v185;
              if (v191 < 0)
              {
                v185 += 7;
                BOOL v17 = v186++ >= 9;
                if (v17)
                {
                  uint64_t v187 = 0;
                  goto LABEL_507;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v187 = 0;
          }
LABEL_507:
          BOOL v390 = v187 != 0;
          uint64_t v391 = 52;
          goto LABEL_616;
        case 0x1Cu:
          char v192 = 0;
          unsigned int v193 = 0;
          uint64_t v194 = 0;
          v5->_hasContainsBaby = 1;
          while (2)
          {
            uint64_t v195 = *v6;
            uint64_t v196 = *(void *)&v4[v195];
            unint64_t v197 = v196 + 1;
            if (v196 == -1 || v197 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v198 = *(unsigned char *)(*(void *)&v4[*v9] + v196);
              *(void *)&v4[v195] = v197;
              v194 |= (unint64_t)(v198 & 0x7F) << v192;
              if (v198 < 0)
              {
                v192 += 7;
                BOOL v17 = v193++ >= 9;
                if (v17)
                {
                  uint64_t v194 = 0;
                  goto LABEL_511;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v194 = 0;
          }
LABEL_511:
          BOOL v390 = v194 != 0;
          uint64_t v391 = 54;
          goto LABEL_616;
        case 0x1Du:
          char v199 = 0;
          unsigned int v200 = 0;
          uint64_t v201 = 0;
          v5->_hasContainsSocialGroup = 1;
          while (2)
          {
            uint64_t v202 = *v6;
            uint64_t v203 = *(void *)&v4[v202];
            unint64_t v204 = v203 + 1;
            if (v203 == -1 || v204 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v205 = *(unsigned char *)(*(void *)&v4[*v9] + v203);
              *(void *)&v4[v202] = v204;
              v201 |= (unint64_t)(v205 & 0x7F) << v199;
              if (v205 < 0)
              {
                v199 += 7;
                BOOL v17 = v200++ >= 9;
                if (v17)
                {
                  uint64_t v201 = 0;
                  goto LABEL_515;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v201 = 0;
          }
LABEL_515:
          BOOL v390 = v201 != 0;
          uint64_t v391 = 56;
          goto LABEL_616;
        case 0x1Eu:
          char v206 = 0;
          unsigned int v207 = 0;
          uint64_t v208 = 0;
          v5->_hasContainsMyPet = 1;
          while (2)
          {
            uint64_t v209 = *v6;
            uint64_t v210 = *(void *)&v4[v209];
            unint64_t v211 = v210 + 1;
            if (v210 == -1 || v211 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v212 = *(unsigned char *)(*(void *)&v4[*v9] + v210);
              *(void *)&v4[v209] = v211;
              v208 |= (unint64_t)(v212 & 0x7F) << v206;
              if (v212 < 0)
              {
                v206 += 7;
                BOOL v17 = v207++ >= 9;
                if (v17)
                {
                  uint64_t v208 = 0;
                  goto LABEL_519;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v208 = 0;
          }
LABEL_519:
          BOOL v390 = v208 != 0;
          uint64_t v391 = 58;
          goto LABEL_616;
        case 0x1Fu:
          char v213 = 0;
          unsigned int v214 = 0;
          uint64_t v215 = 0;
          v5->_hasContainsCoWorker = 1;
          while (2)
          {
            uint64_t v216 = *v6;
            uint64_t v217 = *(void *)&v4[v216];
            unint64_t v218 = v217 + 1;
            if (v217 == -1 || v218 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v219 = *(unsigned char *)(*(void *)&v4[*v9] + v217);
              *(void *)&v4[v216] = v218;
              v215 |= (unint64_t)(v219 & 0x7F) << v213;
              if (v219 < 0)
              {
                v213 += 7;
                BOOL v17 = v214++ >= 9;
                if (v17)
                {
                  uint64_t v215 = 0;
                  goto LABEL_523;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v215 = 0;
          }
LABEL_523:
          BOOL v390 = v215 != 0;
          uint64_t v391 = 60;
          goto LABEL_616;
        case 0x20u:
          char v220 = 0;
          unsigned int v221 = 0;
          uint64_t v222 = 0;
          v5->_hasContainsFamily = 1;
          while (2)
          {
            uint64_t v223 = *v6;
            uint64_t v224 = *(void *)&v4[v223];
            unint64_t v225 = v224 + 1;
            if (v224 == -1 || v225 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v226 = *(unsigned char *)(*(void *)&v4[*v9] + v224);
              *(void *)&v4[v223] = v225;
              v222 |= (unint64_t)(v226 & 0x7F) << v220;
              if (v226 < 0)
              {
                v220 += 7;
                BOOL v17 = v221++ >= 9;
                if (v17)
                {
                  uint64_t v222 = 0;
                  goto LABEL_527;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v222 = 0;
          }
LABEL_527:
          BOOL v390 = v222 != 0;
          uint64_t v391 = 62;
          goto LABEL_616;
        case 0x21u:
          char v227 = 0;
          unsigned int v228 = 0;
          uint64_t v229 = 0;
          v5->_hasContainsFriends = 1;
          while (2)
          {
            uint64_t v230 = *v6;
            uint64_t v231 = *(void *)&v4[v230];
            unint64_t v232 = v231 + 1;
            if (v231 == -1 || v232 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v233 = *(unsigned char *)(*(void *)&v4[*v9] + v231);
              *(void *)&v4[v230] = v232;
              v229 |= (unint64_t)(v233 & 0x7F) << v227;
              if (v233 < 0)
              {
                v227 += 7;
                BOOL v17 = v228++ >= 9;
                if (v17)
                {
                  uint64_t v229 = 0;
                  goto LABEL_531;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v229 = 0;
          }
LABEL_531:
          BOOL v390 = v229 != 0;
          uint64_t v391 = 64;
          goto LABEL_616;
        case 0x22u:
          char v234 = 0;
          unsigned int v235 = 0;
          uint64_t v236 = 0;
          v5->_hasContainsPartner = 1;
          while (2)
          {
            uint64_t v237 = *v6;
            uint64_t v238 = *(void *)&v4[v237];
            unint64_t v239 = v238 + 1;
            if (v238 == -1 || v239 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v240 = *(unsigned char *)(*(void *)&v4[*v9] + v238);
              *(void *)&v4[v237] = v239;
              v236 |= (unint64_t)(v240 & 0x7F) << v234;
              if (v240 < 0)
              {
                v234 += 7;
                BOOL v17 = v235++ >= 9;
                if (v17)
                {
                  uint64_t v236 = 0;
                  goto LABEL_535;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v236 = 0;
          }
LABEL_535:
          BOOL v390 = v236 != 0;
          uint64_t v391 = 66;
          goto LABEL_616;
        case 0x23u:
          char v241 = 0;
          unsigned int v242 = 0;
          uint64_t v243 = 0;
          v5->_hasContainsParent = 1;
          while (2)
          {
            uint64_t v244 = *v6;
            uint64_t v245 = *(void *)&v4[v244];
            unint64_t v246 = v245 + 1;
            if (v245 == -1 || v246 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v247 = *(unsigned char *)(*(void *)&v4[*v9] + v245);
              *(void *)&v4[v244] = v246;
              v243 |= (unint64_t)(v247 & 0x7F) << v241;
              if (v247 < 0)
              {
                v241 += 7;
                BOOL v17 = v242++ >= 9;
                if (v17)
                {
                  uint64_t v243 = 0;
                  goto LABEL_539;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v243 = 0;
          }
LABEL_539:
          BOOL v390 = v243 != 0;
          uint64_t v391 = 68;
          goto LABEL_616;
        case 0x24u:
          char v248 = 0;
          unsigned int v249 = 0;
          uint64_t v250 = 0;
          v5->_hasContainsSibling = 1;
          while (2)
          {
            uint64_t v251 = *v6;
            uint64_t v252 = *(void *)&v4[v251];
            unint64_t v253 = v252 + 1;
            if (v252 == -1 || v253 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v254 = *(unsigned char *)(*(void *)&v4[*v9] + v252);
              *(void *)&v4[v251] = v253;
              v250 |= (unint64_t)(v254 & 0x7F) << v248;
              if (v254 < 0)
              {
                v248 += 7;
                BOOL v17 = v249++ >= 9;
                if (v17)
                {
                  uint64_t v250 = 0;
                  goto LABEL_543;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v250 = 0;
          }
LABEL_543:
          BOOL v390 = v250 != 0;
          uint64_t v391 = 70;
          goto LABEL_616;
        case 0x25u:
          char v255 = 0;
          unsigned int v256 = 0;
          uint64_t v257 = 0;
          v5->_hasContainsChild = 1;
          while (2)
          {
            uint64_t v258 = *v6;
            uint64_t v259 = *(void *)&v4[v258];
            unint64_t v260 = v259 + 1;
            if (v259 == -1 || v260 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v261 = *(unsigned char *)(*(void *)&v4[*v9] + v259);
              *(void *)&v4[v258] = v260;
              v257 |= (unint64_t)(v261 & 0x7F) << v255;
              if (v261 < 0)
              {
                v255 += 7;
                BOOL v17 = v256++ >= 9;
                if (v17)
                {
                  uint64_t v257 = 0;
                  goto LABEL_547;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v257 = 0;
          }
LABEL_547:
          BOOL v390 = v257 != 0;
          uint64_t v391 = 72;
          goto LABEL_616;
        case 0x26u:
          char v262 = 0;
          unsigned int v263 = 0;
          uint64_t v264 = 0;
          v5->_hasIsCoupon = 1;
          while (2)
          {
            uint64_t v265 = *v6;
            uint64_t v266 = *(void *)&v4[v265];
            unint64_t v267 = v266 + 1;
            if (v266 == -1 || v267 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v268 = *(unsigned char *)(*(void *)&v4[*v9] + v266);
              *(void *)&v4[v265] = v267;
              v264 |= (unint64_t)(v268 & 0x7F) << v262;
              if (v268 < 0)
              {
                v262 += 7;
                BOOL v17 = v263++ >= 9;
                if (v17)
                {
                  uint64_t v264 = 0;
                  goto LABEL_551;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v264 = 0;
          }
LABEL_551:
          BOOL v390 = v264 != 0;
          uint64_t v391 = 74;
          goto LABEL_616;
        case 0x27u:
          char v269 = 0;
          unsigned int v270 = 0;
          uint64_t v271 = 0;
          v5->_hasIsRecipe = 1;
          while (2)
          {
            uint64_t v272 = *v6;
            uint64_t v273 = *(void *)&v4[v272];
            unint64_t v274 = v273 + 1;
            if (v273 == -1 || v274 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v275 = *(unsigned char *)(*(void *)&v4[*v9] + v273);
              *(void *)&v4[v272] = v274;
              v271 |= (unint64_t)(v275 & 0x7F) << v269;
              if (v275 < 0)
              {
                v269 += 7;
                BOOL v17 = v270++ >= 9;
                if (v17)
                {
                  uint64_t v271 = 0;
                  goto LABEL_555;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v271 = 0;
          }
LABEL_555:
          BOOL v390 = v271 != 0;
          uint64_t v391 = 76;
          goto LABEL_616;
        case 0x28u:
          char v276 = 0;
          unsigned int v277 = 0;
          uint64_t v278 = 0;
          v5->_hasIsReceipt = 1;
          while (2)
          {
            uint64_t v279 = *v6;
            uint64_t v280 = *(void *)&v4[v279];
            unint64_t v281 = v280 + 1;
            if (v280 == -1 || v281 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v282 = *(unsigned char *)(*(void *)&v4[*v9] + v280);
              *(void *)&v4[v279] = v281;
              v278 |= (unint64_t)(v282 & 0x7F) << v276;
              if (v282 < 0)
              {
                v276 += 7;
                BOOL v17 = v277++ >= 9;
                if (v17)
                {
                  uint64_t v278 = 0;
                  goto LABEL_559;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v278 = 0;
          }
LABEL_559:
          BOOL v390 = v278 != 0;
          uint64_t v391 = 78;
          goto LABEL_616;
        case 0x29u:
          char v283 = 0;
          unsigned int v284 = 0;
          uint64_t v285 = 0;
          v5->_hasIsRecentView = 1;
          while (2)
          {
            uint64_t v286 = *v6;
            uint64_t v287 = *(void *)&v4[v286];
            unint64_t v288 = v287 + 1;
            if (v287 == -1 || v288 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v289 = *(unsigned char *)(*(void *)&v4[*v9] + v287);
              *(void *)&v4[v286] = v288;
              v285 |= (unint64_t)(v289 & 0x7F) << v283;
              if (v289 < 0)
              {
                v283 += 7;
                BOOL v17 = v284++ >= 9;
                if (v17)
                {
                  uint64_t v285 = 0;
                  goto LABEL_563;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v285 = 0;
          }
LABEL_563:
          BOOL v390 = v285 != 0;
          uint64_t v391 = 80;
          goto LABEL_616;
        case 0x2Au:
          char v290 = 0;
          unsigned int v291 = 0;
          uint64_t v292 = 0;
          v5->_hasIsRecentEdit = 1;
          while (2)
          {
            uint64_t v293 = *v6;
            uint64_t v294 = *(void *)&v4[v293];
            unint64_t v295 = v294 + 1;
            if (v294 == -1 || v295 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v296 = *(unsigned char *)(*(void *)&v4[*v9] + v294);
              *(void *)&v4[v293] = v295;
              v292 |= (unint64_t)(v296 & 0x7F) << v290;
              if (v296 < 0)
              {
                v290 += 7;
                BOOL v17 = v291++ >= 9;
                if (v17)
                {
                  uint64_t v292 = 0;
                  goto LABEL_567;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v292 = 0;
          }
LABEL_567:
          BOOL v390 = v292 != 0;
          uint64_t v391 = 82;
          goto LABEL_616;
        case 0x2Bu:
          char v297 = 0;
          unsigned int v298 = 0;
          uint64_t v299 = 0;
          v5->_hasIsRecentShare = 1;
          while (2)
          {
            uint64_t v300 = *v6;
            uint64_t v301 = *(void *)&v4[v300];
            unint64_t v302 = v301 + 1;
            if (v301 == -1 || v302 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v303 = *(unsigned char *)(*(void *)&v4[*v9] + v301);
              *(void *)&v4[v300] = v302;
              v299 |= (unint64_t)(v303 & 0x7F) << v297;
              if (v303 < 0)
              {
                v297 += 7;
                BOOL v17 = v298++ >= 9;
                if (v17)
                {
                  uint64_t v299 = 0;
                  goto LABEL_571;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v299 = 0;
          }
LABEL_571:
          BOOL v390 = v299 != 0;
          uint64_t v391 = 84;
          goto LABEL_616;
        case 0x2Cu:
          char v304 = 0;
          unsigned int v305 = 0;
          uint64_t v306 = 0;
          v5->_hasIsRecentFavorite = 1;
          while (2)
          {
            uint64_t v307 = *v6;
            uint64_t v308 = *(void *)&v4[v307];
            unint64_t v309 = v308 + 1;
            if (v308 == -1 || v309 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v310 = *(unsigned char *)(*(void *)&v4[*v9] + v308);
              *(void *)&v4[v307] = v309;
              v306 |= (unint64_t)(v310 & 0x7F) << v304;
              if (v310 < 0)
              {
                v304 += 7;
                BOOL v17 = v305++ >= 9;
                if (v17)
                {
                  uint64_t v306 = 0;
                  goto LABEL_575;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v306 = 0;
          }
LABEL_575:
          BOOL v390 = v306 != 0;
          uint64_t v391 = 86;
          goto LABEL_616;
        case 0x2Du:
          char v311 = 0;
          unsigned int v312 = 0;
          uint64_t v313 = 0;
          v5->_hasIsContainedInSharedAlbum = 1;
          while (2)
          {
            uint64_t v314 = *v6;
            uint64_t v315 = *(void *)&v4[v314];
            unint64_t v316 = v315 + 1;
            if (v315 == -1 || v316 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v317 = *(unsigned char *)(*(void *)&v4[*v9] + v315);
              *(void *)&v4[v314] = v316;
              v313 |= (unint64_t)(v317 & 0x7F) << v311;
              if (v317 < 0)
              {
                v311 += 7;
                BOOL v17 = v312++ >= 9;
                if (v17)
                {
                  uint64_t v313 = 0;
                  goto LABEL_579;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v313 = 0;
          }
LABEL_579:
          BOOL v390 = v313 != 0;
          uint64_t v391 = 88;
          goto LABEL_616;
        case 0x2Eu:
          char v318 = 0;
          unsigned int v319 = 0;
          uint64_t v320 = 0;
          v5->_hasIsContainedInOnThisDay = 1;
          while (2)
          {
            uint64_t v321 = *v6;
            uint64_t v322 = *(void *)&v4[v321];
            unint64_t v323 = v322 + 1;
            if (v322 == -1 || v323 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v324 = *(unsigned char *)(*(void *)&v4[*v9] + v322);
              *(void *)&v4[v321] = v323;
              v320 |= (unint64_t)(v324 & 0x7F) << v318;
              if (v324 < 0)
              {
                v318 += 7;
                BOOL v17 = v319++ >= 9;
                if (v17)
                {
                  uint64_t v320 = 0;
                  goto LABEL_583;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v320 = 0;
          }
LABEL_583:
          BOOL v390 = v320 != 0;
          uint64_t v391 = 90;
          goto LABEL_616;
        case 0x2Fu:
          char v325 = 0;
          unsigned int v326 = 0;
          uint64_t v327 = 0;
          v5->_hasCapturedAtAOI = 1;
          while (2)
          {
            uint64_t v328 = *v6;
            uint64_t v329 = *(void *)&v4[v328];
            unint64_t v330 = v329 + 1;
            if (v329 == -1 || v330 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v331 = *(unsigned char *)(*(void *)&v4[*v9] + v329);
              *(void *)&v4[v328] = v330;
              v327 |= (unint64_t)(v331 & 0x7F) << v325;
              if (v331 < 0)
              {
                v325 += 7;
                BOOL v17 = v326++ >= 9;
                if (v17)
                {
                  uint64_t v327 = 0;
                  goto LABEL_587;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v327 = 0;
          }
LABEL_587:
          BOOL v390 = v327 != 0;
          uint64_t v391 = 92;
          goto LABEL_616;
        case 0x30u:
          char v332 = 0;
          unsigned int v333 = 0;
          uint64_t v334 = 0;
          v5->_hasCapturedAtPOI = 1;
          while (2)
          {
            uint64_t v335 = *v6;
            uint64_t v336 = *(void *)&v4[v335];
            unint64_t v337 = v336 + 1;
            if (v336 == -1 || v337 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v338 = *(unsigned char *)(*(void *)&v4[*v9] + v336);
              *(void *)&v4[v335] = v337;
              v334 |= (unint64_t)(v338 & 0x7F) << v332;
              if (v338 < 0)
              {
                v332 += 7;
                BOOL v17 = v333++ >= 9;
                if (v17)
                {
                  uint64_t v334 = 0;
                  goto LABEL_591;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v334 = 0;
          }
LABEL_591:
          BOOL v390 = v334 != 0;
          uint64_t v391 = 94;
          goto LABEL_616;
        case 0x31u:
          char v339 = 0;
          unsigned int v340 = 0;
          uint64_t v341 = 0;
          v5->_hasCapturedAtROI = 1;
          while (2)
          {
            uint64_t v342 = *v6;
            uint64_t v343 = *(void *)&v4[v342];
            unint64_t v344 = v343 + 1;
            if (v343 == -1 || v344 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v345 = *(unsigned char *)(*(void *)&v4[*v9] + v343);
              *(void *)&v4[v342] = v344;
              v341 |= (unint64_t)(v345 & 0x7F) << v339;
              if (v345 < 0)
              {
                v339 += 7;
                BOOL v17 = v340++ >= 9;
                if (v17)
                {
                  uint64_t v341 = 0;
                  goto LABEL_595;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v341 = 0;
          }
LABEL_595:
          BOOL v390 = v341 != 0;
          uint64_t v391 = 96;
          goto LABEL_616;
        case 0x32u:
          char v346 = 0;
          unsigned int v347 = 0;
          uint64_t v348 = 0;
          v5->_hasCapturedAtBusiness = 1;
          while (2)
          {
            uint64_t v349 = *v6;
            uint64_t v350 = *(void *)&v4[v349];
            unint64_t v351 = v350 + 1;
            if (v350 == -1 || v351 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v352 = *(unsigned char *)(*(void *)&v4[*v9] + v350);
              *(void *)&v4[v349] = v351;
              v348 |= (unint64_t)(v352 & 0x7F) << v346;
              if (v352 < 0)
              {
                v346 += 7;
                BOOL v17 = v347++ >= 9;
                if (v17)
                {
                  uint64_t v348 = 0;
                  goto LABEL_599;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v348 = 0;
          }
LABEL_599:
          BOOL v390 = v348 != 0;
          uint64_t v391 = 98;
          goto LABEL_616;
        case 0x33u:
          char v353 = 0;
          unsigned int v354 = 0;
          uint64_t v355 = 0;
          v5->_hasIsCapturedAtPublicEvent = 1;
          while (2)
          {
            uint64_t v356 = *v6;
            uint64_t v357 = *(void *)&v4[v356];
            unint64_t v358 = v357 + 1;
            if (v357 == -1 || v358 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v359 = *(unsigned char *)(*(void *)&v4[*v9] + v357);
              *(void *)&v4[v356] = v358;
              v355 |= (unint64_t)(v359 & 0x7F) << v353;
              if (v359 < 0)
              {
                v353 += 7;
                BOOL v17 = v354++ >= 9;
                if (v17)
                {
                  uint64_t v355 = 0;
                  goto LABEL_603;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v355 = 0;
          }
LABEL_603:
          BOOL v390 = v355 != 0;
          uint64_t v391 = 100;
          goto LABEL_616;
        case 0x34u:
          char v360 = 0;
          unsigned int v361 = 0;
          uint64_t v362 = 0;
          v5->_hasIsContainedInVisualTrend = 1;
          while (2)
          {
            uint64_t v363 = *v6;
            uint64_t v364 = *(void *)&v4[v363];
            unint64_t v365 = v364 + 1;
            if (v364 == -1 || v365 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v366 = *(unsigned char *)(*(void *)&v4[*v9] + v364);
              *(void *)&v4[v363] = v365;
              v362 |= (unint64_t)(v366 & 0x7F) << v360;
              if (v366 < 0)
              {
                v360 += 7;
                BOOL v17 = v361++ >= 9;
                if (v17)
                {
                  uint64_t v362 = 0;
                  goto LABEL_607;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v362 = 0;
          }
LABEL_607:
          BOOL v390 = v362 != 0;
          uint64_t v391 = 102;
          goto LABEL_616;
        case 0x35u:
          char v367 = 0;
          unsigned int v368 = 0;
          uint64_t v369 = 0;
          v5->_hasIsContainedInActivity = 1;
          while (2)
          {
            uint64_t v370 = *v6;
            uint64_t v371 = *(void *)&v4[v370];
            unint64_t v372 = v371 + 1;
            if (v371 == -1 || v372 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v373 = *(unsigned char *)(*(void *)&v4[*v9] + v371);
              *(void *)&v4[v370] = v372;
              v369 |= (unint64_t)(v373 & 0x7F) << v367;
              if (v373 < 0)
              {
                v367 += 7;
                BOOL v17 = v368++ >= 9;
                if (v17)
                {
                  uint64_t v369 = 0;
                  goto LABEL_611;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v369 = 0;
          }
LABEL_611:
          BOOL v390 = v369 != 0;
          uint64_t v391 = 104;
          goto LABEL_616;
        case 0x36u:
          char v374 = 0;
          unsigned int v375 = 0;
          uint64_t v376 = 0;
          v5->_hasIsContainedInChildActivity = 1;
          while (2)
          {
            uint64_t v377 = *v6;
            uint64_t v378 = *(void *)&v4[v377];
            unint64_t v379 = v378 + 1;
            if (v378 == -1 || v379 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v380 = *(unsigned char *)(*(void *)&v4[*v9] + v378);
              *(void *)&v4[v377] = v379;
              v376 |= (unint64_t)(v380 & 0x7F) << v374;
              if (v380 < 0)
              {
                v374 += 7;
                BOOL v17 = v375++ >= 9;
                if (v17)
                {
                  uint64_t v376 = 0;
                  goto LABEL_615;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v376 = 0;
          }
LABEL_615:
          BOOL v390 = v376 != 0;
          uint64_t v391 = 106;
LABEL_616:
          *((unsigned char *)&v5->super.super.isa + v391) = v390;
          continue;
        case 0x37u:
          char v381 = 0;
          unsigned int v382 = 0;
          uint64_t v130 = 0;
          break;
        case 0x38u:
          v5->_hasUserisDAU = 1;
          uint64_t v387 = *v6;
          unint64_t v388 = *(void *)&v4[v387];
          if (v388 <= 0xFFFFFFFFFFFFFFFBLL && v388 + 4 <= *(void *)&v4[*v7])
          {
            float v389 = *(float *)(*(void *)&v4[*v9] + v388);
            *(void *)&v4[v387] = v388 + 4;
          }
          else
          {
            v4[*v8] = 1;
            float v389 = 0.0;
          }
          v5->_userisDAU = v389;
          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_629;
          }
          continue;
      }
      while (1)
      {
        uint64_t v383 = *v6;
        uint64_t v384 = *(void *)&v4[v383];
        unint64_t v385 = v384 + 1;
        if (v384 == -1 || v385 > *(void *)&v4[*v7]) {
          break;
        }
        char v386 = *(unsigned char *)(*(void *)&v4[*v9] + v384);
        *(void *)&v4[v383] = v385;
        v130 |= (unint64_t)(v386 & 0x7F) << v381;
        if ((v386 & 0x80) == 0) {
          goto LABEL_620;
        }
        v381 += 7;
        BOOL v17 = v382++ >= 9;
        if (v17)
        {
          LODWORD(v130) = 0;
          goto LABEL_622;
        }
      }
      v4[*v8] = 1;
LABEL_620:
      if (v4[*v8]) {
        LODWORD(v130) = 0;
      }
LABEL_622:
      if (v130 >= 6) {
        LODWORD(v130) = 0;
      }
      uint64_t v393 = 148;
LABEL_625:
      *(_DWORD *)((char *)&v5->super.super.isa + v393) = v130;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_629:
  }
    id v394 = 0;
  else {
LABEL_630:
  }
    id v394 = v5;

  return v394;
}

- (NSString)description
{
  id v20 = [NSString alloc];
  uint64_t v60 = [(BMPhotosUserAnalytics *)self identifier];
  unsigned int v59 = [(BMPhotosUserAnalytics *)self userEvent];
  uint64_t v62 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics containsVIP](self, "containsVIP"));
  uint64_t v61 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPhotosUserAnalytics faceCount](self, "faceCount"));
  char v57 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics containsPets](self, "containsPets"));
  unint64_t v56 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics capturedAtHome](self, "capturedAtHome"));
  char v58 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics capturedAtWork](self, "capturedAtWork"));
  uint64_t v54 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics capturedAtFrequentLocation](self, "capturedAtFrequentLocation"));
  uint64_t v53 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics capturedOnTrip](self, "capturedOnTrip"));
  uint64_t v55 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics capturedOnShortTrip](self, "capturedOnShortTrip"));
  char v51 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics isDocument](self, "isDocument"));
  char v50 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics isMeme](self, "isMeme"));
  unsigned int v52 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics isScreenshot](self, "isScreenshot"));
  uint64_t v48 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics isFavorite](self, "isFavorite"));
  uint64_t v47 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics isCapturedOnWeekend](self, "isCapturedOnWeekend"));
  unint64_t v49 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics isCapturedAtPrivateEvent](self, "isCapturedAtPrivateEvent"));
  unsigned int v45 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics isCapturedOnHoliday](self, "isCapturedOnHoliday"));
  char v44 = BMPhotosUserAnalyticsMediaTypeTypeAsString([(BMPhotosUserAnalytics *)self mediaType]);
  uint64_t v46 = BMPhotosUserAnalyticsImportSourceTypeAsString([(BMPhotosUserAnalytics *)self importSource]);
  char v43 = BMPhotosUserAnalyticsAssetAgeTypeAsString([(BMPhotosUserAnalytics *)self assetAge]);
  unint64_t v42 = BMPhotosUserAnalyticsLibrarySizeTypeAsString([(BMPhotosUserAnalytics *)self userLibrarySize]);
  uint64_t v41 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPhotosUserAnalytics userNumTrips](self, "userNumTrips"));
  uint64_t v40 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPhotosUserAnalytics userNumVIPPeople](self, "userNumVIPPeople"));
  uint64_t v39 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPhotosUserAnalytics userNumFavorites](self, "userNumFavorites"));
  unsigned int v38 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics userHasVIP](self, "userHasVIP"));
  char v37 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics userHasHome](self, "userHasHome"));
  char v36 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics userHasPet](self, "userHasPet"));
  unint64_t v35 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics containsBaby](self, "containsBaby"));
  uint64_t v34 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics containsSocialGroup](self, "containsSocialGroup"));
  uint64_t v33 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics containsMyPet](self, "containsMyPet"));
  uint64_t v32 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics containsCoWorker](self, "containsCoWorker"));
  unsigned int v31 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics containsFamily](self, "containsFamily"));
  char v30 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics containsFriends](self, "containsFriends"));
  char v29 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics containsPartner](self, "containsPartner"));
  unint64_t v28 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics containsParent](self, "containsParent"));
  uint64_t v27 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics containsSibling](self, "containsSibling"));
  uint64_t v26 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics containsChild](self, "containsChild"));
  uint64_t v25 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics isCoupon](self, "isCoupon"));
  unsigned int v24 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics isRecipe](self, "isRecipe"));
  char v23 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics isReceipt](self, "isReceipt"));
  uint64_t v22 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics isRecentView](self, "isRecentView"));
  uint64_t v19 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics isRecentEdit](self, "isRecentEdit"));
  int v18 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics isRecentShare](self, "isRecentShare"));
  BOOL v17 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics isRecentFavorite](self, "isRecentFavorite"));
  char v16 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics isContainedInSharedAlbum](self, "isContainedInSharedAlbum"));
  unint64_t v15 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics isContainedInOnThisDay](self, "isContainedInOnThisDay"));
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics capturedAtAOI](self, "capturedAtAOI"));
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics capturedAtPOI](self, "capturedAtPOI"));
  unint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics capturedAtROI](self, "capturedAtROI"));
  unsigned int v11 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics capturedAtBusiness](self, "capturedAtBusiness"));
  char v10 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics isCapturedAtPublicEvent](self, "isCapturedAtPublicEvent"));
  id v9 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics isContainedInVisualTrend](self, "isContainedInVisualTrend"));
  id v8 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics isContainedInActivity](self, "isContainedInActivity"));
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithBool:", -[BMPhotosUserAnalytics isContainedInChildActivity](self, "isContainedInChildActivity"));
  id v4 = BMPhotosUserAnalyticsUserLibraryAgeInDaysTypeAsString([(BMPhotosUserAnalytics *)self userLibraryAgeInDays]);
  id v5 = NSNumber;
  [(BMPhotosUserAnalytics *)self userisDAU];
  id v6 = objc_msgSend(v5, "numberWithDouble:");
  id v21 = (id)objc_msgSend(v20, "initWithFormat:", @"BMPhotosUserAnalytics with identifier: %@, userEvent: %@, containsVIP: %@, faceCount: %@, containsPets: %@, capturedAtHome: %@, capturedAtWork: %@, capturedAtFrequentLocation: %@, capturedOnTrip: %@, capturedOnShortTrip: %@, isDocument: %@, isMeme: %@, isScreenshot: %@, isFavorite: %@, isCapturedOnWeekend: %@, isCapturedAtPrivateEvent: %@, isCapturedOnHoliday: %@, mediaType: %@, importSource: %@, assetAge: %@, userLibrarySize: %@, userNumTrips: %@, userNumVIPPeople: %@, userNumFavorites: %@, userHasVIP: %@, userHasHome: %@, userHasPet: %@, containsBaby: %@, containsSocialGroup: %@, containsMyPet: %@, containsCoWorker: %@, containsFamily: %@, containsFriends: %@, containsPartner: %@, containsParent: %@, containsSibling: %@, containsChild: %@, isCoupon: %@, isRecipe: %@, isReceipt: %@, isRecentView: %@, isRecentEdit: %@, isRecentShare: %@, isRecentFavorite: %@, isContainedInSharedAlbum: %@, isContainedInOnThisDay: %@, capturedAtAOI: %@, capturedAtPOI: %@, capturedAtROI: %@, capturedAtBusiness: %@, isCapturedAtPublicEvent: %@, isContainedInVisualTrend: %@, isContainedInActivity: %@, isContainedInChildActivity: %@, userLibraryAgeInDays: %@, userisDAU: %@", v60, v59, v62, v61, v57, v56, v58, v54, v53, v55, v51, v50, v52, v48, v47, v49,
              v45,
              v44,
              v46,
              v43,
              v42,
              v41,
              v40,
              v39,
              v38,
              v37,
              v36,
              v35,
              v34,
              v33,
              v32,
              v31,
              v30,
              v29,
              v28,
              v27,
              v26,
              v25,
              v24,
              v23,
              v22,
              v19,
              v18,
              v17,
              v16,
              v15,
              v14,
              v13,
              v12,
              v11,
              v10,
              v9,
              v8,
              v3,
              v4,
              v6);

  return (NSString *)v21;
}

- (BMPhotosUserAnalytics)initWithIdentifier:(id)a3 userEvent:(id)a4 containsVIP:(id)a5 faceCount:(id)a6 containsPets:(id)a7 capturedAtHome:(id)a8 capturedAtWork:(id)a9 capturedAtFrequentLocation:(id)a10 capturedOnTrip:(id)a11 capturedOnShortTrip:(id)a12 isDocument:(id)a13 isMeme:(id)a14 isScreenshot:(id)a15 isFavorite:(id)a16 isCapturedOnWeekend:(id)a17 isCapturedAtPrivateEvent:(id)a18 isCapturedOnHoliday:(id)a19 mediaType:(int)a20 importSource:(int)a21 assetAge:(int)a22 userLibrarySize:(int)a23 userNumTrips:(id)a24 userNumVIPPeople:(id)a25 userNumFavorites:(id)a26 userHasVIP:(id)a27 userHasHome:(id)a28 userHasPet:(id)a29 containsBaby:(id)a30 containsSocialGroup:(id)a31 containsMyPet:(id)a32 containsCoWorker:(id)a33 containsFamily:(id)a34 containsFriends:(id)a35 containsPartner:(id)a36 containsParent:(id)a37 containsSibling:(id)a38 containsChild:(id)a39 isCoupon:(id)a40 isRecipe:(id)a41 isReceipt:(id)a42 isRecentView:(id)a43 isRecentEdit:(id)a44 isRecentShare:(id)a45 isRecentFavorite:(id)a46 isContainedInSharedAlbum:(id)a47 isContainedInOnThisDay:(id)a48 capturedAtAOI:(id)a49 capturedAtPOI:(id)a50 capturedAtROI:(id)a51 capturedAtBusiness:(id)a52 isCapturedAtPublicEvent:(id)a53 isContainedInVisualTrend:(id)a54 isContainedInActivity:(id)a55 isContainedInChildActivity:(id)a56 userLibraryAgeInDays:(int)a57 userisDAU:(id)a58
{
  id v84 = a3;
  id v81 = a4;
  id v83 = a4;
  id v62 = a5;
  id v63 = a6;
  id v64 = a7;
  id v125 = a8;
  id v123 = a9;
  id v65 = a10;
  id v66 = a11;
  id v122 = a12;
  id v67 = a13;
  id v68 = a14;
  id v69 = a15;
  id v121 = a16;
  id v120 = a17;
  id v119 = a18;
  id v118 = a19;
  id v70 = a24;
  id v117 = a25;
  id v116 = a26;
  id v115 = a27;
  id v114 = a28;
  id v113 = a29;
  id v112 = a30;
  id v111 = a31;
  id v110 = a32;
  id v109 = a33;
  id v108 = a34;
  id v107 = a35;
  id v106 = a36;
  id v105 = a37;
  id v104 = a38;
  id v103 = a39;
  id v102 = a40;
  id v101 = a41;
  id v100 = a42;
  id v99 = a43;
  id v98 = a44;
  id v97 = a45;
  id v96 = a46;
  id v95 = a47;
  id v94 = a48;
  id v93 = a49;
  id v92 = a50;
  id v91 = a51;
  id v90 = a52;
  id v89 = a53;
  id v88 = a54;
  id v87 = a55;
  id v86 = a56;
  id v85 = a58;
  v126.receiver = self;
  v126.super_class = (Class)BMPhotosUserAnalytics;
  char v71 = [(BMEventBase *)&v126 init];

  if (v71)
  {
    v71->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v71->_identifier, a3);
    objc_storeStrong((id *)&v71->_userEvent, v81);
    if (v62)
    {
      v71->_hasContainsVIP = 1;
      v71->_containsVIP = [v62 BOOLValue];
    }
    else
    {
      v71->_hasContainsVIP = 0;
      v71->_containsVIP = 0;
    }
    if (v63)
    {
      v71->_hasFaceCount = 1;
      int v72 = [v63 intValue];
    }
    else
    {
      v71->_hasFaceCount = 0;
      int v72 = -1;
    }
    v71->_faceCount = v72;
    if (v64)
    {
      v71->_hasContainsPets = 1;
      v71->_containsPets = [v64 BOOLValue];
    }
    else
    {
      v71->_hasContainsPets = 0;
      v71->_containsPets = 0;
    }
    if (v125)
    {
      v71->_hasCapturedAtHome = 1;
      v71->_capturedAtHome = [v125 BOOLValue];
    }
    else
    {
      v71->_hasCapturedAtHome = 0;
      v71->_capturedAtHome = 0;
    }
    if (v123)
    {
      v71->_hasCapturedAtWork = 1;
      v71->_capturedAtWork = [v123 BOOLValue];
    }
    else
    {
      v71->_hasCapturedAtWork = 0;
      v71->_capturedAtWork = 0;
    }
    if (v65)
    {
      v71->_hasCapturedAtFrequentLocation = 1;
      v71->_capturedAtFrequentLocation = [v65 BOOLValue];
    }
    else
    {
      v71->_hasCapturedAtFrequentLocation = 0;
      v71->_capturedAtFrequentLocation = 0;
    }
    if (v66)
    {
      v71->_hasCapturedOnTrip = 1;
      v71->_capturedOnTrip = [v66 BOOLValue];
    }
    else
    {
      v71->_hasCapturedOnTrip = 0;
      v71->_capturedOnTrip = 0;
    }
    if (v122)
    {
      v71->_hasCapturedOnShortTrip = 1;
      v71->_capturedOnShortTrip = [v122 BOOLValue];
    }
    else
    {
      v71->_hasCapturedOnShortTrip = 0;
      v71->_capturedOnShortTrip = 0;
    }
    if (v67)
    {
      v71->_hasIsDocument = 1;
      v71->_isDocument = [v67 BOOLValue];
    }
    else
    {
      v71->_hasIsDocument = 0;
      v71->_isDocument = 0;
    }
    if (v68)
    {
      v71->_hasIsMeme = 1;
      v71->_isMeme = [v68 BOOLValue];
    }
    else
    {
      v71->_hasIsMeme = 0;
      v71->_isMeme = 0;
    }
    if (v69)
    {
      v71->_hasIsScreenshot = 1;
      v71->_isScreenshot = [v69 BOOLValue];
    }
    else
    {
      v71->_hasIsScreenshot = 0;
      v71->_isScreenshot = 0;
    }
    if (v121)
    {
      v71->_hasIsFavorite = 1;
      v71->_isFavorite = [v121 BOOLValue];
    }
    else
    {
      v71->_hasIsFavorite = 0;
      v71->_isFavorite = 0;
    }
    if (v120)
    {
      v71->_hasIsCapturedOnWeekend = 1;
      v71->_isCapturedOnWeekend = [v120 BOOLValue];
    }
    else
    {
      v71->_hasIsCapturedOnWeekend = 0;
      v71->_isCapturedOnWeekend = 0;
    }
    if (v119)
    {
      v71->_hasIsCapturedAtPrivateEvent = 1;
      v71->_isCapturedAtPrivateEvent = [v119 BOOLValue];
    }
    else
    {
      v71->_hasIsCapturedAtPrivateEvent = 0;
      v71->_isCapturedAtPrivateEvent = 0;
    }
    if (v118)
    {
      v71->_hasIsCapturedOnHoliday = 1;
      v71->_isCapturedOnHoliday = [v118 BOOLValue];
    }
    else
    {
      v71->_hasIsCapturedOnHoliday = 0;
      v71->_isCapturedOnHoliday = 0;
    }
    v71->_mediaType = a20;
    v71->_importSource = a21;
    v71->_assetAge = a22;
    v71->_userLibrarySize = a23;
    if (v70)
    {
      v71->_hasUserNumTrips = 1;
      int v73 = [v70 intValue];
    }
    else
    {
      v71->_hasUserNumTrips = 0;
      int v73 = -1;
    }
    v71->_userNumTrips = v73;
    if (v117)
    {
      v71->_hasUserNumVIPPeople = 1;
      int v74 = [v117 intValue];
    }
    else
    {
      v71->_hasUserNumVIPPeople = 0;
      int v74 = -1;
    }
    v71->_userNumVIPPeople = v74;
    if (v116)
    {
      v71->_hasUserNumFavorites = 1;
      int v75 = [v116 intValue];
    }
    else
    {
      v71->_hasUserNumFavorites = 0;
      int v75 = -1;
    }
    v71->_userNumFavorites = v75;
    if (v115)
    {
      v71->_hasUserHasVIP = 1;
      v71->_userHasVIP = [v115 BOOLValue];
    }
    else
    {
      v71->_hasUserHasVIP = 0;
      v71->_userHasVIP = 0;
    }
    if (v114)
    {
      v71->_hasUserHasHome = 1;
      v71->_userHasHome = [v114 BOOLValue];
    }
    else
    {
      v71->_hasUserHasHome = 0;
      v71->_userHasHome = 0;
    }
    if (v113)
    {
      v71->_hasUserHasPet = 1;
      v71->_userHasPet = [v113 BOOLValue];
    }
    else
    {
      v71->_hasUserHasPet = 0;
      v71->_userHasPet = 0;
    }
    if (v112)
    {
      v71->_hasContainsBaby = 1;
      v71->_containsBaby = [v112 BOOLValue];
    }
    else
    {
      v71->_hasContainsBaby = 0;
      v71->_containsBaby = 0;
    }
    if (v111)
    {
      v71->_hasContainsSocialGroup = 1;
      v71->_containsSocialGroup = [v111 BOOLValue];
    }
    else
    {
      v71->_hasContainsSocialGroup = 0;
      v71->_containsSocialGroup = 0;
    }
    if (v110)
    {
      v71->_hasContainsMyPet = 1;
      v71->_containsMyPet = [v110 BOOLValue];
    }
    else
    {
      v71->_hasContainsMyPet = 0;
      v71->_containsMyPet = 0;
    }
    if (v109)
    {
      v71->_hasContainsCoWorker = 1;
      v71->_containsCoWorker = [v109 BOOLValue];
    }
    else
    {
      v71->_hasContainsCoWorker = 0;
      v71->_containsCoWorker = 0;
    }
    if (v108)
    {
      v71->_hasContainsFamily = 1;
      v71->_containsFamily = [v108 BOOLValue];
    }
    else
    {
      v71->_hasContainsFamily = 0;
      v71->_containsFamily = 0;
    }
    if (v107)
    {
      v71->_hasContainsFriends = 1;
      v71->_containsFriends = [v107 BOOLValue];
    }
    else
    {
      v71->_hasContainsFriends = 0;
      v71->_containsFriends = 0;
    }
    if (v106)
    {
      v71->_hasContainsPartner = 1;
      v71->_containsPartner = [v106 BOOLValue];
    }
    else
    {
      v71->_hasContainsPartner = 0;
      v71->_containsPartner = 0;
    }
    if (v105)
    {
      v71->_hasContainsParent = 1;
      v71->_containsParent = [v105 BOOLValue];
    }
    else
    {
      v71->_hasContainsParent = 0;
      v71->_containsParent = 0;
    }
    if (v104)
    {
      v71->_hasContainsSibling = 1;
      v71->_containsSibling = [v104 BOOLValue];
    }
    else
    {
      v71->_hasContainsSibling = 0;
      v71->_containsSibling = 0;
    }
    if (v103)
    {
      v71->_hasContainsChild = 1;
      v71->_containsChild = [v103 BOOLValue];
    }
    else
    {
      v71->_hasContainsChild = 0;
      v71->_containsChild = 0;
    }
    if (v102)
    {
      v71->_hasIsCoupon = 1;
      v71->_isCoupon = [v102 BOOLValue];
    }
    else
    {
      v71->_hasIsCoupon = 0;
      v71->_isCoupon = 0;
    }
    if (v101)
    {
      v71->_hasIsRecipe = 1;
      v71->_isRecipe = [v101 BOOLValue];
    }
    else
    {
      v71->_hasIsRecipe = 0;
      v71->_isRecipe = 0;
    }
    if (v100)
    {
      v71->_hasIsReceipt = 1;
      v71->_isReceipt = [v100 BOOLValue];
    }
    else
    {
      v71->_hasIsReceipt = 0;
      v71->_isReceipt = 0;
    }
    if (v99)
    {
      v71->_hasIsRecentView = 1;
      v71->_isRecentView = [v99 BOOLValue];
    }
    else
    {
      v71->_hasIsRecentView = 0;
      v71->_isRecentView = 0;
    }
    if (v98)
    {
      v71->_hasIsRecentEdit = 1;
      v71->_isRecentEdit = [v98 BOOLValue];
    }
    else
    {
      v71->_hasIsRecentEdit = 0;
      v71->_isRecentEdit = 0;
    }
    if (v97)
    {
      v71->_hasIsRecentShare = 1;
      v71->_isRecentShare = [v97 BOOLValue];
    }
    else
    {
      v71->_hasIsRecentShare = 0;
      v71->_isRecentShare = 0;
    }
    if (v96)
    {
      v71->_hasIsRecentFavorite = 1;
      v71->_isRecentFavorite = [v96 BOOLValue];
    }
    else
    {
      v71->_hasIsRecentFavorite = 0;
      v71->_isRecentFavorite = 0;
    }
    if (v95)
    {
      v71->_hasIsContainedInSharedAlbum = 1;
      v71->_isContainedInSharedAlbum = [v95 BOOLValue];
    }
    else
    {
      v71->_hasIsContainedInSharedAlbum = 0;
      v71->_isContainedInSharedAlbum = 0;
    }
    if (v94)
    {
      v71->_hasIsContainedInOnThisDay = 1;
      v71->_isContainedInOnThisDay = [v94 BOOLValue];
    }
    else
    {
      v71->_hasIsContainedInOnThisDay = 0;
      v71->_isContainedInOnThisDay = 0;
    }
    if (v93)
    {
      v71->_hasCapturedAtAOI = 1;
      v71->_capturedAtAOI = [v93 BOOLValue];
    }
    else
    {
      v71->_hasCapturedAtAOI = 0;
      v71->_capturedAtAOI = 0;
    }
    if (v92)
    {
      v71->_hasCapturedAtPOI = 1;
      v71->_capturedAtPOI = [v92 BOOLValue];
    }
    else
    {
      v71->_hasCapturedAtPOI = 0;
      v71->_capturedAtPOI = 0;
    }
    if (v91)
    {
      v71->_hasCapturedAtROI = 1;
      v71->_capturedAtROI = [v91 BOOLValue];
    }
    else
    {
      v71->_hasCapturedAtROI = 0;
      v71->_capturedAtROI = 0;
    }
    if (v90)
    {
      v71->_hasCapturedAtBusiness = 1;
      v71->_capturedAtBusiness = [v90 BOOLValue];
    }
    else
    {
      v71->_hasCapturedAtBusiness = 0;
      v71->_capturedAtBusiness = 0;
    }
    if (v89)
    {
      v71->_hasIsCapturedAtPublicEvent = 1;
      v71->_isCapturedAtPublicEvent = [v89 BOOLValue];
    }
    else
    {
      v71->_hasIsCapturedAtPublicEvent = 0;
      v71->_isCapturedAtPublicEvent = 0;
    }
    if (v88)
    {
      v71->_hasIsContainedInVisualTrend = 1;
      v71->_isContainedInVisualTrend = [v88 BOOLValue];
    }
    else
    {
      v71->_hasIsContainedInVisualTrend = 0;
      v71->_isContainedInVisualTrend = 0;
    }
    if (v87)
    {
      v71->_hasIsContainedInActivity = 1;
      v71->_isContainedInActivity = [v87 BOOLValue];
    }
    else
    {
      v71->_hasIsContainedInActivity = 0;
      v71->_isContainedInActivity = 0;
    }
    if (v86)
    {
      v71->_hasIsContainedInChildActivity = 1;
      v71->_isContainedInChildActivity = [v86 BOOLValue];
    }
    else
    {
      v71->_hasIsContainedInChildActivity = 0;
      v71->_isContainedInChildActivity = 0;
    }
    v71->_userLibraryAgeInDays = a57;
    if (v85)
    {
      v71->_hasUserisDAU = 1;
      [v85 floatValue];
      double v77 = v76;
    }
    else
    {
      v71->_hasUserisDAU = 0;
      double v77 = -1.0;
    }
    v71->_userisDAU = v77;
  }
  char v78 = v71;

  return v78;
}

+ (id)protoFields
{
  v60[56] = *MEMORY[0x1E4F143B8];
  unsigned int v59 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"identifier" number:1 type:13 subMessageClass:0];
  v60[0] = v59;
  char v58 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userEvent" number:2 type:13 subMessageClass:0];
  v60[1] = v58;
  char v57 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"containsVIP" number:3 type:12 subMessageClass:0];
  v60[2] = v57;
  unint64_t v56 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"faceCount" number:4 type:2 subMessageClass:0];
  v60[3] = v56;
  uint64_t v55 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"containsPets" number:5 type:12 subMessageClass:0];
  v60[4] = v55;
  uint64_t v54 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"capturedAtHome" number:6 type:12 subMessageClass:0];
  v60[5] = v54;
  uint64_t v53 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"capturedAtWork" number:7 type:12 subMessageClass:0];
  v60[6] = v53;
  unsigned int v52 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"capturedAtFrequentLocation" number:8 type:12 subMessageClass:0];
  v60[7] = v52;
  char v51 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"capturedOnTrip" number:9 type:12 subMessageClass:0];
  v60[8] = v51;
  char v50 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"capturedOnShortTrip" number:10 type:12 subMessageClass:0];
  v60[9] = v50;
  unint64_t v49 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isDocument" number:11 type:12 subMessageClass:0];
  v60[10] = v49;
  uint64_t v48 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isMeme" number:12 type:12 subMessageClass:0];
  v60[11] = v48;
  uint64_t v47 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isScreenshot" number:13 type:12 subMessageClass:0];
  v60[12] = v47;
  uint64_t v46 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isFavorite" number:14 type:12 subMessageClass:0];
  v60[13] = v46;
  unsigned int v45 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isCapturedOnWeekend" number:15 type:12 subMessageClass:0];
  v60[14] = v45;
  char v44 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isCapturedAtPrivateEvent" number:16 type:12 subMessageClass:0];
  v60[15] = v44;
  char v43 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isCapturedOnHoliday" number:17 type:12 subMessageClass:0];
  v60[16] = v43;
  unint64_t v42 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"mediaType" number:18 type:4 subMessageClass:0];
  v60[17] = v42;
  uint64_t v41 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"importSource" number:19 type:4 subMessageClass:0];
  v60[18] = v41;
  uint64_t v40 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"assetAge" number:20 type:4 subMessageClass:0];
  v60[19] = v40;
  uint64_t v39 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userLibrarySize" number:21 type:4 subMessageClass:0];
  v60[20] = v39;
  unsigned int v38 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userNumTrips" number:22 type:2 subMessageClass:0];
  v60[21] = v38;
  char v37 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userNumVIPPeople" number:23 type:2 subMessageClass:0];
  v60[22] = v37;
  char v36 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userNumFavorites" number:24 type:2 subMessageClass:0];
  v60[23] = v36;
  unint64_t v35 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userHasVIP" number:25 type:12 subMessageClass:0];
  v60[24] = v35;
  uint64_t v34 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userHasHome" number:26 type:12 subMessageClass:0];
  v60[25] = v34;
  uint64_t v33 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userHasPet" number:27 type:12 subMessageClass:0];
  v60[26] = v33;
  uint64_t v32 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"containsBaby" number:28 type:12 subMessageClass:0];
  v60[27] = v32;
  unsigned int v31 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"containsSocialGroup" number:29 type:12 subMessageClass:0];
  v60[28] = v31;
  char v30 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"containsMyPet" number:30 type:12 subMessageClass:0];
  v60[29] = v30;
  char v29 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"containsCoWorker" number:31 type:12 subMessageClass:0];
  v60[30] = v29;
  unint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"containsFamily" number:32 type:12 subMessageClass:0];
  v60[31] = v28;
  uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"containsFriends" number:33 type:12 subMessageClass:0];
  v60[32] = v27;
  uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"containsPartner" number:34 type:12 subMessageClass:0];
  v60[33] = v26;
  uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"containsParent" number:35 type:12 subMessageClass:0];
  v60[34] = v25;
  unsigned int v24 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"containsSibling" number:36 type:12 subMessageClass:0];
  v60[35] = v24;
  char v23 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"containsChild" number:37 type:12 subMessageClass:0];
  v60[36] = v23;
  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isCoupon" number:38 type:12 subMessageClass:0];
  v60[37] = v22;
  id v21 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isRecipe" number:39 type:12 subMessageClass:0];
  v60[38] = v21;
  id v20 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isReceipt" number:40 type:12 subMessageClass:0];
  v60[39] = v20;
  uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isRecentView" number:41 type:12 subMessageClass:0];
  v60[40] = v19;
  int v18 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isRecentEdit" number:42 type:12 subMessageClass:0];
  v60[41] = v18;
  BOOL v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isRecentShare" number:43 type:12 subMessageClass:0];
  v60[42] = v17;
  char v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isRecentFavorite" number:44 type:12 subMessageClass:0];
  v60[43] = v16;
  unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isContainedInSharedAlbum" number:45 type:12 subMessageClass:0];
  v60[44] = v15;
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isContainedInOnThisDay" number:46 type:12 subMessageClass:0];
  v60[45] = v14;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"capturedAtAOI" number:47 type:12 subMessageClass:0];
  v60[46] = v2;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"capturedAtPOI" number:48 type:12 subMessageClass:0];
  v60[47] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"capturedAtROI" number:49 type:12 subMessageClass:0];
  v60[48] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"capturedAtBusiness" number:50 type:12 subMessageClass:0];
  v60[49] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isCapturedAtPublicEvent" number:51 type:12 subMessageClass:0];
  v60[50] = v6;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isContainedInVisualTrend" number:52 type:12 subMessageClass:0];
  v60[51] = v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isContainedInActivity" number:53 type:12 subMessageClass:0];
  v60[52] = v8;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isContainedInChildActivity" number:54 type:12 subMessageClass:0];
  v60[53] = v9;
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userLibraryAgeInDays" number:55 type:4 subMessageClass:0];
  v60[54] = v10;
  unsigned int v11 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userisDAU" number:56 type:1 subMessageClass:0];
  v60[55] = v11;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:56];

  return v13;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4920;
}

+ (id)columns
{
  v60[56] = *MEMORY[0x1E4F143B8];
  unsigned int v59 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"identifier" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  char v58 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"userEvent" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  char v57 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"containsVIP" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:12 convertedType:0];
  uint64_t v55 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"faceCount" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:2 convertedType:0];
  unint64_t v56 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"containsPets" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:12 convertedType:0];
  uint64_t v53 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"capturedAtHome" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:12 convertedType:0];
  uint64_t v54 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"capturedAtWork" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:12 convertedType:0];
  unsigned int v52 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"capturedAtFrequentLocation" dataType:0 requestOnly:0 fieldNumber:8 protoDataType:12 convertedType:0];
  char v51 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"capturedOnTrip" dataType:0 requestOnly:0 fieldNumber:9 protoDataType:12 convertedType:0];
  char v50 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"capturedOnShortTrip" dataType:0 requestOnly:0 fieldNumber:10 protoDataType:12 convertedType:0];
  unint64_t v49 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isDocument" dataType:0 requestOnly:0 fieldNumber:11 protoDataType:12 convertedType:0];
  uint64_t v48 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isMeme" dataType:0 requestOnly:0 fieldNumber:12 protoDataType:12 convertedType:0];
  uint64_t v47 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isScreenshot" dataType:0 requestOnly:0 fieldNumber:13 protoDataType:12 convertedType:0];
  uint64_t v46 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isFavorite" dataType:0 requestOnly:0 fieldNumber:14 protoDataType:12 convertedType:0];
  unsigned int v45 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isCapturedOnWeekend" dataType:0 requestOnly:0 fieldNumber:15 protoDataType:12 convertedType:0];
  char v44 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isCapturedAtPrivateEvent" dataType:0 requestOnly:0 fieldNumber:16 protoDataType:12 convertedType:0];
  char v43 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isCapturedOnHoliday" dataType:0 requestOnly:0 fieldNumber:17 protoDataType:12 convertedType:0];
  unint64_t v42 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"mediaType" dataType:0 requestOnly:0 fieldNumber:18 protoDataType:4 convertedType:0];
  uint64_t v41 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"importSource" dataType:0 requestOnly:0 fieldNumber:19 protoDataType:4 convertedType:0];
  uint64_t v40 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"assetAge" dataType:0 requestOnly:0 fieldNumber:20 protoDataType:4 convertedType:0];
  uint64_t v39 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"userLibrarySize" dataType:0 requestOnly:0 fieldNumber:21 protoDataType:4 convertedType:0];
  unsigned int v38 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"userNumTrips" dataType:0 requestOnly:0 fieldNumber:22 protoDataType:2 convertedType:0];
  char v37 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"userNumVIPPeople" dataType:0 requestOnly:0 fieldNumber:23 protoDataType:2 convertedType:0];
  char v36 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"userNumFavorites" dataType:0 requestOnly:0 fieldNumber:24 protoDataType:2 convertedType:0];
  unint64_t v35 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"userHasVIP" dataType:0 requestOnly:0 fieldNumber:25 protoDataType:12 convertedType:0];
  uint64_t v34 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"userHasHome" dataType:0 requestOnly:0 fieldNumber:26 protoDataType:12 convertedType:0];
  uint64_t v33 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"userHasPet" dataType:0 requestOnly:0 fieldNumber:27 protoDataType:12 convertedType:0];
  uint64_t v32 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"containsBaby" dataType:0 requestOnly:0 fieldNumber:28 protoDataType:12 convertedType:0];
  unsigned int v31 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"containsSocialGroup" dataType:0 requestOnly:0 fieldNumber:29 protoDataType:12 convertedType:0];
  char v30 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"containsMyPet" dataType:0 requestOnly:0 fieldNumber:30 protoDataType:12 convertedType:0];
  char v29 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"containsCoWorker" dataType:0 requestOnly:0 fieldNumber:31 protoDataType:12 convertedType:0];
  unint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"containsFamily" dataType:0 requestOnly:0 fieldNumber:32 protoDataType:12 convertedType:0];
  uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"containsFriends" dataType:0 requestOnly:0 fieldNumber:33 protoDataType:12 convertedType:0];
  uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"containsPartner" dataType:0 requestOnly:0 fieldNumber:34 protoDataType:12 convertedType:0];
  uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"containsParent" dataType:0 requestOnly:0 fieldNumber:35 protoDataType:12 convertedType:0];
  unsigned int v24 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"containsSibling" dataType:0 requestOnly:0 fieldNumber:36 protoDataType:12 convertedType:0];
  char v23 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"containsChild" dataType:0 requestOnly:0 fieldNumber:37 protoDataType:12 convertedType:0];
  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isCoupon" dataType:0 requestOnly:0 fieldNumber:38 protoDataType:12 convertedType:0];
  id v21 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isRecipe" dataType:0 requestOnly:0 fieldNumber:39 protoDataType:12 convertedType:0];
  id v20 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isReceipt" dataType:0 requestOnly:0 fieldNumber:40 protoDataType:12 convertedType:0];
  uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isRecentView" dataType:0 requestOnly:0 fieldNumber:41 protoDataType:12 convertedType:0];
  int v18 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isRecentEdit" dataType:0 requestOnly:0 fieldNumber:42 protoDataType:12 convertedType:0];
  BOOL v17 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isRecentShare" dataType:0 requestOnly:0 fieldNumber:43 protoDataType:12 convertedType:0];
  char v16 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isRecentFavorite" dataType:0 requestOnly:0 fieldNumber:44 protoDataType:12 convertedType:0];
  unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isContainedInSharedAlbum" dataType:0 requestOnly:0 fieldNumber:45 protoDataType:12 convertedType:0];
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isContainedInOnThisDay" dataType:0 requestOnly:0 fieldNumber:46 protoDataType:12 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"capturedAtAOI" dataType:0 requestOnly:0 fieldNumber:47 protoDataType:12 convertedType:0];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"capturedAtPOI" dataType:0 requestOnly:0 fieldNumber:48 protoDataType:12 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"capturedAtROI" dataType:0 requestOnly:0 fieldNumber:49 protoDataType:12 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"capturedAtBusiness" dataType:0 requestOnly:0 fieldNumber:50 protoDataType:12 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isCapturedAtPublicEvent" dataType:0 requestOnly:0 fieldNumber:51 protoDataType:12 convertedType:0];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isContainedInVisualTrend" dataType:0 requestOnly:0 fieldNumber:52 protoDataType:12 convertedType:0];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isContainedInActivity" dataType:0 requestOnly:0 fieldNumber:53 protoDataType:12 convertedType:0];
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isContainedInChildActivity" dataType:0 requestOnly:0 fieldNumber:54 protoDataType:12 convertedType:0];
  unint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"userLibraryAgeInDays" dataType:0 requestOnly:0 fieldNumber:55 protoDataType:4 convertedType:0];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"userisDAU" dataType:1 requestOnly:0 fieldNumber:56 protoDataType:1 convertedType:0];
  v60[0] = v59;
  v60[1] = v58;
  v60[2] = v57;
  v60[3] = v55;
  v60[4] = v56;
  v60[5] = v53;
  v60[6] = v54;
  v60[7] = v52;
  v60[8] = v51;
  v60[9] = v50;
  v60[10] = v49;
  v60[11] = v48;
  v60[12] = v47;
  v60[13] = v46;
  v60[14] = v45;
  v60[15] = v44;
  v60[16] = v43;
  v60[17] = v42;
  v60[18] = v41;
  v60[19] = v40;
  v60[20] = v39;
  v60[21] = v38;
  v60[22] = v37;
  v60[23] = v36;
  v60[24] = v35;
  v60[25] = v34;
  v60[26] = v33;
  v60[27] = v32;
  v60[28] = v31;
  v60[29] = v30;
  v60[30] = v29;
  v60[31] = v28;
  v60[32] = v27;
  v60[33] = v26;
  v60[34] = v25;
  v60[35] = v24;
  v60[36] = v23;
  v60[37] = v22;
  v60[38] = v21;
  v60[39] = v20;
  v60[40] = v19;
  v60[41] = v18;
  v60[42] = v17;
  v60[43] = v16;
  v60[44] = v15;
  v60[45] = v14;
  v60[46] = v2;
  v60[47] = v3;
  v60[48] = v4;
  v60[49] = v5;
  v60[50] = v6;
  v60[51] = v7;
  v60[52] = v8;
  v60[53] = v13;
  v60[54] = v12;
  v60[55] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:56];

  return v11;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    id v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMPhotosUserAnalytics alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[28] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end