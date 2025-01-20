@interface GEOWiFiConnectionQuality
+ (BOOL)isValid:(id)a3;
+ (Class)essMembersType;
+ (Class)feedbackType;
+ (Class)hotspotHelperProviderType;
+ (Class)nearbyBSSType;
+ (Class)roamStatesType;
+ (Class)speedTestType;
- (BOOL)hasApMode;
- (BOOL)hasAssociationLength;
- (BOOL)hasAssociationReason;
- (BOOL)hasBand;
- (BOOL)hasBeaconInfo;
- (BOOL)hasBytesInActive;
- (BOOL)hasBytesInTotal;
- (BOOL)hasBytesOutActive;
- (BOOL)hasBytesOutTotal;
- (BOOL)hasCaptiveDetermination;
- (BOOL)hasCca;
- (BOOL)hasChannel;
- (BOOL)hasChannelWidth;
- (BOOL)hasClientAssociationSubreason;
- (BOOL)hasDataStalls;
- (BOOL)hasDisassociationReason;
- (BOOL)hasDohAvailability;
- (BOOL)hasFailedConnections;
- (BOOL)hasFaultyStay;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasHotspot20;
- (BOOL)hasIdentifier;
- (BOOL)hasIsEdgeBSS;
- (BOOL)hasIsKnownGood;
- (BOOL)hasLabel;
- (BOOL)hasLocation;
- (BOOL)hasLowInternetDL;
- (BOOL)hasLowInternetUL;
- (BOOL)hasLowLQMStay;
- (BOOL)hasLowqStay;
- (BOOL)hasLqmTranCount;
- (BOOL)hasNetworkOrigin;
- (BOOL)hasNetworkType;
- (BOOL)hasOverAllStay;
- (BOOL)hasPacketsIn;
- (BOOL)hasPacketsOut;
- (BOOL)hasPasspointInfo;
- (BOOL)hasPhyMode;
- (BOOL)hasReTxBytes;
- (BOOL)hasReceivedDupes;
- (BOOL)hasResponsivenessScore;
- (BOOL)hasRoundTripTimeAvg;
- (BOOL)hasRoundTripTimeAvgActive;
- (BOOL)hasRoundTripTimeMin;
- (BOOL)hasRoundTripTimeMinActive;
- (BOOL)hasRoundTripTimeVar;
- (BOOL)hasRoundTripTimeVarActive;
- (BOOL)hasRssi;
- (BOOL)hasRxOutOfOrderBytes;
- (BOOL)hasSnr;
- (BOOL)hasSslConnectionCount;
- (BOOL)hasSslErrorCount;
- (BOOL)hasSuccessfulConnections;
- (BOOL)hasTimeOfDay;
- (BOOL)hasTimestamp;
- (BOOL)hasTopDLRate;
- (BOOL)hasType;
- (BOOL)hasUniqueID;
- (BOOL)hasWasCaptiveFlag;
- (BOOL)hotspot20;
- (BOOL)isEdgeBSS;
- (BOOL)isEqual:(id)a3;
- (BOOL)isKnownGood;
- (BOOL)lowInternetDL;
- (BOOL)lowInternetUL;
- (BOOL)readFrom:(id)a3;
- (GEOLocation)location;
- (GEOWiFiBeaconInfo)beaconInfo;
- (GEOWiFiConnectionQuality)init;
- (GEOWiFiConnectionQuality)initWithData:(id)a3;
- (GEOWiFiConnectionQuality)initWithDictionary:(id)a3;
- (GEOWiFiConnectionQuality)initWithJSON:(id)a3;
- (GEOWiFiHarvestLabel)label;
- (GEOWiFiPasspointInfo)passpointInfo;
- (NSMutableArray)essMembers;
- (NSMutableArray)feedbacks;
- (NSMutableArray)hotspotHelperProviders;
- (NSMutableArray)nearbyBSSs;
- (NSMutableArray)roamStates;
- (NSMutableArray)speedTests;
- (NSString)identifier;
- (NSString)uniqueID;
- (double)responsivenessScore;
- (float)roundTripTimeAvg;
- (float)roundTripTimeAvgActive;
- (float)roundTripTimeMin;
- (float)roundTripTimeMinActive;
- (float)roundTripTimeVar;
- (float)roundTripTimeVarActive;
- (float)topDLRate;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_initWithDictionary:(char)a3 isJSON:;
- (id)apModeAsString:(int)a3;
- (id)associationLengthAsString:(int)a3;
- (id)associationReasonAsString:(int)a3;
- (id)authTraitsAsString:(int)a3;
- (id)captiveDeterminationAsString:(int)a3;
- (id)clientAssociationSubreasonAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)disassociationReasonAsString:(int)a3;
- (id)dohAvailabilityAsString:(int)a3;
- (id)essMembersAtIndex:(unint64_t)a3;
- (id)feedbackAtIndex:(unint64_t)a3;
- (id)hotspotHelperProviderAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)nameAttributesAsString:(int)a3;
- (id)nearbyBSSAtIndex:(unint64_t)a3;
- (id)networkOriginAsString:(int)a3;
- (id)networkTypeAsString:(int)a3;
- (id)roamStatesAtIndex:(unint64_t)a3;
- (id)speedTestAtIndex:(unint64_t)a3;
- (id)traitsAsString:(int)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsApMode:(id)a3;
- (int)StringAsAssociationLength:(id)a3;
- (int)StringAsAssociationReason:(id)a3;
- (int)StringAsAuthTraits:(id)a3;
- (int)StringAsCaptiveDetermination:(id)a3;
- (int)StringAsClientAssociationSubreason:(id)a3;
- (int)StringAsDisassociationReason:(id)a3;
- (int)StringAsDohAvailability:(id)a3;
- (int)StringAsNameAttributes:(id)a3;
- (int)StringAsNetworkOrigin:(id)a3;
- (int)StringAsNetworkType:(id)a3;
- (int)StringAsTraits:(id)a3;
- (int)StringAsType:(id)a3;
- (int)apMode;
- (int)associationLength;
- (int)associationReason;
- (int)authTraits;
- (int)authTraitsAtIndex:(unint64_t)a3;
- (int)captiveDetermination;
- (int)cca;
- (int)clientAssociationSubreason;
- (int)disassociationReason;
- (int)dohAvailability;
- (int)nameAttributes;
- (int)nameAttributesAtIndex:(unint64_t)a3;
- (int)networkOrigin;
- (int)networkType;
- (int)rssi;
- (int)snr;
- (int)traits;
- (int)traitsAtIndex:(unint64_t)a3;
- (int)type;
- (unint64_t)authTraitsCount;
- (unint64_t)bytesInActive;
- (unint64_t)bytesInTotal;
- (unint64_t)bytesOutActive;
- (unint64_t)bytesOutTotal;
- (unint64_t)dataStalls;
- (unint64_t)essMembersCount;
- (unint64_t)failedConnections;
- (unint64_t)faultyStay;
- (unint64_t)feedbacksCount;
- (unint64_t)hash;
- (unint64_t)hotspotHelperProvidersCount;
- (unint64_t)lowLQMStay;
- (unint64_t)lowqStay;
- (unint64_t)lqmTranCount;
- (unint64_t)nameAttributesCount;
- (unint64_t)nearbyBSSsCount;
- (unint64_t)overAllStay;
- (unint64_t)packetsIn;
- (unint64_t)packetsOut;
- (unint64_t)reTxBytes;
- (unint64_t)receivedDupes;
- (unint64_t)roamStatesCount;
- (unint64_t)rxOutOfOrderBytes;
- (unint64_t)speedTestsCount;
- (unint64_t)successfulConnections;
- (unint64_t)timeOfDay;
- (unint64_t)timestamp;
- (unint64_t)traitsCount;
- (unsigned)band;
- (unsigned)channel;
- (unsigned)channelWidth;
- (unsigned)phyMode;
- (unsigned)sslConnectionCount;
- (unsigned)sslErrorCount;
- (unsigned)wasCaptiveFlag;
- (void)_addNoFlagsEssMembers:(uint64_t)a1;
- (void)_addNoFlagsFeedback:(uint64_t)a1;
- (void)_addNoFlagsHotspotHelperProvider:(uint64_t)a1;
- (void)_addNoFlagsNearbyBSS:(uint64_t)a1;
- (void)_addNoFlagsRoamStates:(uint64_t)a1;
- (void)_addNoFlagsSpeedTest:(uint64_t)a1;
- (void)_readAuthTraits;
- (void)_readBeaconInfo;
- (void)_readEssMembers;
- (void)_readFeedbacks;
- (void)_readHotspotHelperProviders;
- (void)_readIdentifier;
- (void)_readLabel;
- (void)_readLocation;
- (void)_readNameAttributes;
- (void)_readNearbyBSSs;
- (void)_readPasspointInfo;
- (void)_readRoamStates;
- (void)_readSpeedTests;
- (void)_readTraits;
- (void)_readUniqueID;
- (void)addAuthTraits:(int)a3;
- (void)addEssMembers:(id)a3;
- (void)addFeedback:(id)a3;
- (void)addHotspotHelperProvider:(id)a3;
- (void)addNameAttributes:(int)a3;
- (void)addNearbyBSS:(id)a3;
- (void)addRoamStates:(id)a3;
- (void)addSpeedTest:(id)a3;
- (void)addTraits:(int)a3;
- (void)clearAuthTraits;
- (void)clearEssMembers;
- (void)clearFeedbacks;
- (void)clearHotspotHelperProviders;
- (void)clearNameAttributes;
- (void)clearNearbyBSSs;
- (void)clearRoamStates;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearSpeedTests;
- (void)clearTraits;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setApMode:(int)a3;
- (void)setAssociationLength:(int)a3;
- (void)setAssociationReason:(int)a3;
- (void)setAuthTraits:(int *)a3 count:(unint64_t)a4;
- (void)setBand:(unsigned int)a3;
- (void)setBeaconInfo:(id)a3;
- (void)setBytesInActive:(unint64_t)a3;
- (void)setBytesInTotal:(unint64_t)a3;
- (void)setBytesOutActive:(unint64_t)a3;
- (void)setBytesOutTotal:(unint64_t)a3;
- (void)setCaptiveDetermination:(int)a3;
- (void)setCca:(int)a3;
- (void)setChannel:(unsigned int)a3;
- (void)setChannelWidth:(unsigned int)a3;
- (void)setClientAssociationSubreason:(int)a3;
- (void)setDataStalls:(unint64_t)a3;
- (void)setDisassociationReason:(int)a3;
- (void)setDohAvailability:(int)a3;
- (void)setEssMembers:(id)a3;
- (void)setFailedConnections:(unint64_t)a3;
- (void)setFaultyStay:(unint64_t)a3;
- (void)setFeedbacks:(id)a3;
- (void)setHasApMode:(BOOL)a3;
- (void)setHasAssociationLength:(BOOL)a3;
- (void)setHasAssociationReason:(BOOL)a3;
- (void)setHasBand:(BOOL)a3;
- (void)setHasBytesInActive:(BOOL)a3;
- (void)setHasBytesInTotal:(BOOL)a3;
- (void)setHasBytesOutActive:(BOOL)a3;
- (void)setHasBytesOutTotal:(BOOL)a3;
- (void)setHasCaptiveDetermination:(BOOL)a3;
- (void)setHasCca:(BOOL)a3;
- (void)setHasChannel:(BOOL)a3;
- (void)setHasChannelWidth:(BOOL)a3;
- (void)setHasClientAssociationSubreason:(BOOL)a3;
- (void)setHasDataStalls:(BOOL)a3;
- (void)setHasDisassociationReason:(BOOL)a3;
- (void)setHasDohAvailability:(BOOL)a3;
- (void)setHasFailedConnections:(BOOL)a3;
- (void)setHasFaultyStay:(BOOL)a3;
- (void)setHasHotspot20:(BOOL)a3;
- (void)setHasIsEdgeBSS:(BOOL)a3;
- (void)setHasIsKnownGood:(BOOL)a3;
- (void)setHasLowInternetDL:(BOOL)a3;
- (void)setHasLowInternetUL:(BOOL)a3;
- (void)setHasLowLQMStay:(BOOL)a3;
- (void)setHasLowqStay:(BOOL)a3;
- (void)setHasLqmTranCount:(BOOL)a3;
- (void)setHasNetworkOrigin:(BOOL)a3;
- (void)setHasNetworkType:(BOOL)a3;
- (void)setHasOverAllStay:(BOOL)a3;
- (void)setHasPacketsIn:(BOOL)a3;
- (void)setHasPacketsOut:(BOOL)a3;
- (void)setHasPhyMode:(BOOL)a3;
- (void)setHasReTxBytes:(BOOL)a3;
- (void)setHasReceivedDupes:(BOOL)a3;
- (void)setHasResponsivenessScore:(BOOL)a3;
- (void)setHasRoundTripTimeAvg:(BOOL)a3;
- (void)setHasRoundTripTimeAvgActive:(BOOL)a3;
- (void)setHasRoundTripTimeMin:(BOOL)a3;
- (void)setHasRoundTripTimeMinActive:(BOOL)a3;
- (void)setHasRoundTripTimeVar:(BOOL)a3;
- (void)setHasRoundTripTimeVarActive:(BOOL)a3;
- (void)setHasRssi:(BOOL)a3;
- (void)setHasRxOutOfOrderBytes:(BOOL)a3;
- (void)setHasSnr:(BOOL)a3;
- (void)setHasSslConnectionCount:(BOOL)a3;
- (void)setHasSslErrorCount:(BOOL)a3;
- (void)setHasSuccessfulConnections:(BOOL)a3;
- (void)setHasTimeOfDay:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTopDLRate:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setHasWasCaptiveFlag:(BOOL)a3;
- (void)setHotspot20:(BOOL)a3;
- (void)setHotspotHelperProviders:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsEdgeBSS:(BOOL)a3;
- (void)setIsKnownGood:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setLocation:(id)a3;
- (void)setLowInternetDL:(BOOL)a3;
- (void)setLowInternetUL:(BOOL)a3;
- (void)setLowLQMStay:(unint64_t)a3;
- (void)setLowqStay:(unint64_t)a3;
- (void)setLqmTranCount:(unint64_t)a3;
- (void)setNameAttributes:(int *)a3 count:(unint64_t)a4;
- (void)setNearbyBSSs:(id)a3;
- (void)setNetworkOrigin:(int)a3;
- (void)setNetworkType:(int)a3;
- (void)setOverAllStay:(unint64_t)a3;
- (void)setPacketsIn:(unint64_t)a3;
- (void)setPacketsOut:(unint64_t)a3;
- (void)setPasspointInfo:(id)a3;
- (void)setPhyMode:(unsigned int)a3;
- (void)setReTxBytes:(unint64_t)a3;
- (void)setReceivedDupes:(unint64_t)a3;
- (void)setResponsivenessScore:(double)a3;
- (void)setRoamStates:(id)a3;
- (void)setRoundTripTimeAvg:(float)a3;
- (void)setRoundTripTimeAvgActive:(float)a3;
- (void)setRoundTripTimeMin:(float)a3;
- (void)setRoundTripTimeMinActive:(float)a3;
- (void)setRoundTripTimeVar:(float)a3;
- (void)setRoundTripTimeVarActive:(float)a3;
- (void)setRssi:(int)a3;
- (void)setRxOutOfOrderBytes:(unint64_t)a3;
- (void)setSnr:(int)a3;
- (void)setSpeedTests:(id)a3;
- (void)setSslConnectionCount:(unsigned int)a3;
- (void)setSslErrorCount:(unsigned int)a3;
- (void)setSuccessfulConnections:(unint64_t)a3;
- (void)setTimeOfDay:(unint64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTopDLRate:(float)a3;
- (void)setTraits:(int *)a3 count:(unint64_t)a4;
- (void)setType:(int)a3;
- (void)setUniqueID:(id)a3;
- (void)setWasCaptiveFlag:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOWiFiConnectionQuality

- (GEOWiFiConnectionQuality)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOWiFiConnectionQuality;
  v2 = [(GEOWiFiConnectionQuality *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOWiFiConnectionQuality)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOWiFiConnectionQuality;
  v3 = [(GEOWiFiConnectionQuality *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOWiFiConnectionQuality;
  [(GEOWiFiConnectionQuality *)&v3 dealloc];
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x80000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x80000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_flags = *(void *)&self->_flags & 0xFFFFFFFFFFF7FFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasTimestamp
{
  return (*(void *)&self->_flags >> 19) & 1;
}

- (void)_readUniqueID
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 352));
    if ((*(unsigned char *)(a1 + 480) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiConnectionQualityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUniqueID_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 352));
  }
}

- (BOOL)hasUniqueID
{
  return self->_uniqueID != 0;
}

- (NSString)uniqueID
{
  -[GEOWiFiConnectionQuality _readUniqueID]((uint64_t)self);
  uniqueID = self->_uniqueID;

  return uniqueID;
}

- (void)setUniqueID:(id)a3
{
  *((unsigned char *)&self->_flags + 8) |= 0xCu;
  objc_storeStrong((id *)&self->_uniqueID, a3);
}

- (unint64_t)overAllStay
{
  return self->_overAllStay;
}

- (void)setOverAllStay:(unint64_t)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x400uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_overAllStay = a3;
}

- (void)setHasOverAllStay:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 1024;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFBFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasOverAllStay
{
  return (*(void *)&self->_flags >> 10) & 1;
}

- (unint64_t)faultyStay
{
  return self->_faultyStay;
}

- (void)setFaultyStay:(unint64_t)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x40uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_faultyStay = a3;
}

- (void)setHasFaultyStay:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 64;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFFBFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasFaultyStay
{
  return (*(void *)&self->_flags >> 6) & 1;
}

- (unint64_t)lowLQMStay
{
  return self->_lowLQMStay;
}

- (void)setLowLQMStay:(unint64_t)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x80uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_lowLQMStay = a3;
}

- (void)setHasLowLQMStay:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 128;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFF7FLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasLowLQMStay
{
  return (*(void *)&self->_flags >> 7) & 1;
}

- (unint64_t)lowqStay
{
  return self->_lowqStay;
}

- (void)setLowqStay:(unint64_t)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x100uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_lowqStay = a3;
}

- (void)setHasLowqStay:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 256;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFEFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasLowqStay
{
  return (*(void *)&self->_flags >> 8) & 1;
}

- (unint64_t)lqmTranCount
{
  return self->_lqmTranCount;
}

- (void)setLqmTranCount:(unint64_t)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x200uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_lqmTranCount = a3;
}

- (void)setHasLqmTranCount:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 512;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFDFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasLqmTranCount
{
  return (*(void *)&self->_flags >> 9) & 1;
}

- (unint64_t)successfulConnections
{
  return self->_successfulConnections;
}

- (void)setSuccessfulConnections:(unint64_t)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x20000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_successfulConnections = a3;
}

- (void)setHasSuccessfulConnections:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x20000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_flags = *(void *)&self->_flags & 0xFFFFFFFFFFFDFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasSuccessfulConnections
{
  return (*(void *)&self->_flags >> 17) & 1;
}

- (unint64_t)failedConnections
{
  return self->_failedConnections;
}

- (void)setFailedConnections:(unint64_t)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x20uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_failedConnections = a3;
}

- (void)setHasFailedConnections:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 32;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFFDFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasFailedConnections
{
  return (*(void *)&self->_flags >> 5) & 1;
}

- (unint64_t)packetsIn
{
  return self->_packetsIn;
}

- (void)setPacketsIn:(unint64_t)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x800uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_packetsIn = a3;
}

- (void)setHasPacketsIn:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 2048;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFF7FFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasPacketsIn
{
  return (*(void *)&self->_flags >> 11) & 1;
}

- (unint64_t)packetsOut
{
  return self->_packetsOut;
}

- (void)setPacketsOut:(unint64_t)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x1000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_packetsOut = a3;
}

- (void)setHasPacketsOut:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 4096;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFEFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasPacketsOut
{
  return (*(void *)&self->_flags >> 12) & 1;
}

- (unint64_t)bytesInTotal
{
  return self->_bytesInTotal;
}

- (void)setBytesInTotal:(unint64_t)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 2uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_bytesInTotal = a3;
}

- (void)setHasBytesInTotal:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 2;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFFFDLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasBytesInTotal
{
  return (*(void *)&self->_flags >> 1) & 1;
}

- (unint64_t)bytesOutTotal
{
  return self->_bytesOutTotal;
}

- (void)setBytesOutTotal:(unint64_t)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 8uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_bytesOutTotal = a3;
}

- (void)setHasBytesOutTotal:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 8;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFFF7 | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasBytesOutTotal
{
  return (*(void *)&self->_flags >> 3) & 1;
}

- (unint64_t)bytesInActive
{
  return self->_bytesInActive;
}

- (void)setBytesInActive:(unint64_t)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 1uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_bytesInActive = a3;
}

- (void)setHasBytesInActive:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFFFELL | a3;
  *((unsigned char *)&self->_flags + 8) = v3;
}

- (BOOL)hasBytesInActive
{
  return *(_DWORD *)&self->_flags & 1;
}

- (unint64_t)bytesOutActive
{
  return self->_bytesOutActive;
}

- (void)setBytesOutActive:(unint64_t)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 4uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_bytesOutActive = a3;
}

- (void)setHasBytesOutActive:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 4;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFFFBLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasBytesOutActive
{
  return (*(void *)&self->_flags >> 2) & 1;
}

- (unint64_t)reTxBytes
{
  return self->_reTxBytes;
}

- (void)setReTxBytes:(unint64_t)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x2000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_reTxBytes = a3;
}

- (void)setHasReTxBytes:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x2000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFDFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasReTxBytes
{
  return (*(void *)&self->_flags >> 13) & 1;
}

- (unint64_t)dataStalls
{
  return self->_dataStalls;
}

- (void)setDataStalls:(unint64_t)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x10uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_dataStalls = a3;
}

- (void)setHasDataStalls:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 16;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFFFEFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasDataStalls
{
  return (*(void *)&self->_flags >> 4) & 1;
}

- (unint64_t)receivedDupes
{
  return self->_receivedDupes;
}

- (void)setReceivedDupes:(unint64_t)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x4000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_receivedDupes = a3;
}

- (void)setHasReceivedDupes:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x4000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_flags = *(void *)&self->_flags & 0xFFFFFFFFFFFFBFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasReceivedDupes
{
  return (*(void *)&self->_flags >> 14) & 1;
}

- (unint64_t)rxOutOfOrderBytes
{
  return self->_rxOutOfOrderBytes;
}

- (void)setRxOutOfOrderBytes:(unint64_t)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x10000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_rxOutOfOrderBytes = a3;
}

- (void)setHasRxOutOfOrderBytes:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x10000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_flags = *(void *)&self->_flags & 0xFFFFFFFFFFFEFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasRxOutOfOrderBytes
{
  return (*(void *)&self->_flags >> 16) & 1;
}

- (float)roundTripTimeMin
{
  return self->_roundTripTimeMin;
}

- (void)setRoundTripTimeMin:(float)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x2000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_roundTripTimeMin = a3;
}

- (void)setHasRoundTripTimeMin:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x2000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_flags = *(void *)&self->_flags & 0xFFFFFFDFFFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasRoundTripTimeMin
{
  return (*(void *)&self->_flags >> 37) & 1;
}

- (float)roundTripTimeAvg
{
  return self->_roundTripTimeAvg;
}

- (void)setRoundTripTimeAvg:(float)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x800000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_roundTripTimeAvg = a3;
}

- (void)setHasRoundTripTimeAvg:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x800000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_flags = *(void *)&self->_flags & 0xFFFFFFF7FFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasRoundTripTimeAvg
{
  return (*(void *)&self->_flags >> 35) & 1;
}

- (float)roundTripTimeVar
{
  return self->_roundTripTimeVar;
}

- (void)setRoundTripTimeVar:(float)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x8000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_roundTripTimeVar = a3;
}

- (void)setHasRoundTripTimeVar:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x8000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_flags = *(void *)&self->_flags & 0xFFFFFF7FFFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasRoundTripTimeVar
{
  return (*(void *)&self->_flags >> 39) & 1;
}

- (float)roundTripTimeMinActive
{
  return self->_roundTripTimeMinActive;
}

- (void)setRoundTripTimeMinActive:(float)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x1000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_roundTripTimeMinActive = a3;
}

- (void)setHasRoundTripTimeMinActive:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x1000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_flags = *(void *)&self->_flags & 0xFFFFFFEFFFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasRoundTripTimeMinActive
{
  return (*(void *)&self->_flags >> 36) & 1;
}

- (float)roundTripTimeAvgActive
{
  return self->_roundTripTimeAvgActive;
}

- (void)setRoundTripTimeAvgActive:(float)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x400000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_roundTripTimeAvgActive = a3;
}

- (void)setHasRoundTripTimeAvgActive:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x400000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_flags = *(void *)&self->_flags & 0xFFFFFFFBFFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasRoundTripTimeAvgActive
{
  return (*(void *)&self->_flags >> 34) & 1;
}

- (float)roundTripTimeVarActive
{
  return self->_roundTripTimeVarActive;
}

- (void)setRoundTripTimeVarActive:(float)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x4000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_roundTripTimeVarActive = a3;
}

- (void)setHasRoundTripTimeVarActive:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x4000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_flags = *(void *)&self->_flags & 0xFFFFFFBFFFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasRoundTripTimeVarActive
{
  return (*(void *)&self->_flags >> 38) & 1;
}

- (BOOL)hotspot20
{
  return self->_hotspot20;
}

- (void)setHotspot20:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x800000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_hotspot20 = a3;
}

- (void)setHasHotspot20:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x800000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_flags = *(void *)&self->_flags & 0xFFFF7FFFFFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasHotspot20
{
  return (*(void *)&self->_flags >> 47) & 1;
}

- (unsigned)band
{
  return self->_band;
}

- (void)setBand:(unsigned int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x800000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_band = a3;
}

- (void)setHasBand:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x800000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_flags = *(void *)&self->_flags & 0xFFFFFFFFFF7FFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasBand
{
  return (*(void *)&self->_flags >> 23) & 1;
}

- (unsigned)channel
{
  return self->_channel;
}

- (void)setChannel:(unsigned int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x8000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_channel = a3;
}

- (void)setHasChannel:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x8000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_flags = *(void *)&self->_flags & 0xFFFFFFFFF7FFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasChannel
{
  return (*(void *)&self->_flags >> 27) & 1;
}

- (unsigned)channelWidth
{
  return self->_channelWidth;
}

- (void)setChannelWidth:(unsigned int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x4000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_channelWidth = a3;
}

- (void)setHasChannelWidth:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x4000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_flags = *(void *)&self->_flags & 0xFFFFFFFFFBFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasChannelWidth
{
  return (*(void *)&self->_flags >> 26) & 1;
}

- (int)rssi
{
  return self->_rssi;
}

- (void)setRssi:(int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x10000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_rssi = a3;
}

- (void)setHasRssi:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x10000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_flags = *(void *)&self->_flags & 0xFFFFFEFFFFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasRssi
{
  return (*(void *)&self->_flags >> 40) & 1;
}

- (int)snr
{
  return self->_snr;
}

- (void)setSnr:(int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x20000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_snr = a3;
}

- (void)setHasSnr:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x20000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_flags = *(void *)&self->_flags & 0xFFFFFDFFFFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasSnr
{
  return (*(void *)&self->_flags >> 41) & 1;
}

- (int)cca
{
  return self->_cca;
}

- (void)setCca:(int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x2000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_cca = a3;
}

- (void)setHasCca:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x2000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_flags = *(void *)&self->_flags & 0xFFFFFFFFFDFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasCca
{
  return (*(void *)&self->_flags >> 25) & 1;
}

- (unsigned)phyMode
{
  return self->_phyMode;
}

- (void)setPhyMode:(unsigned int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x200000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_phyMode = a3;
}

- (void)setHasPhyMode:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x200000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_flags = *(void *)&self->_flags & 0xFFFFFFFDFFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasPhyMode
{
  return (*(void *)&self->_flags >> 33) & 1;
}

- (unint64_t)timeOfDay
{
  return self->_timeOfDay;
}

- (void)setTimeOfDay:(unint64_t)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x40000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_timeOfDay = a3;
}

- (void)setHasTimeOfDay:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x40000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_flags = *(void *)&self->_flags & 0xFFFFFFFFFFFBFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasTimeOfDay
{
  return (*(void *)&self->_flags >> 18) & 1;
}

- (void)_readLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 352));
    if ((*(void *)(a1 + 472) & 0x2000000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiConnectionQualityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocation_tags_9);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 352));
  }
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (GEOLocation)location
{
  -[GEOWiFiConnectionQuality _readLocation]((uint64_t)self);
  location = self->_location;

  return location;
}

- (void)setLocation:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x2000000000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_location, a3);
}

- (unsigned)wasCaptiveFlag
{
  return self->_wasCaptiveFlag;
}

- (void)setWasCaptiveFlag:(unsigned int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x400000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_wasCaptiveFlag = a3;
}

- (void)setHasWasCaptiveFlag:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x400000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_flags = *(void *)&self->_flags & 0xFFFFBFFFFFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasWasCaptiveFlag
{
  return (*(void *)&self->_flags >> 46) & 1;
}

- (int)networkType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x100000000) != 0) {
    return self->_networkType;
  }
  else {
    return 0;
  }
}

- (void)setNetworkType:(int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x100000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_networkType = a3;
}

- (void)setHasNetworkType:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x100000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFEFFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasNetworkType
{
  return HIDWORD(*(void *)&self->_flags) & 1;
}

- (id)networkTypeAsString:(int)a3
{
  if (a3 >= 0x11)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53EA088[a3];
  }

  return v3;
}

- (int)StringAsNetworkType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_NETWORK_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PRIVATE_NETWORK_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PRIVATE_WITH_GUEST_ACCESS_NETWORK_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CHARGEABLE_PUBLIC_NETWORK_TYPE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"FREE_PUBLIC_NETWORK_TYPE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"PERSONAL_DEVICE_NETWORK_TYPE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"EMERGENCY_SERVICE_ONLY_NETWORK_TYPE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_1"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_2"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_3"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_4"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_5"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_6"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_7"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_8"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"TEST_OR_EXPERIMENTAL_NETWORK_TYPE"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"WILDCARD_NETWORK_TYPE"])
  {
    int v4 = 16;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readTraits
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 352));
    if ((*(void *)(a1 + 472) & 0x40000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiConnectionQualityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTraits_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 352));
  }
}

- (unint64_t)traitsCount
{
  return self->_traits.count;
}

- (int)traits
{
  return self->_traits.list;
}

- (void)clearTraits
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x40000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 8u;

  PBRepeatedInt32Clear();
}

- (void)addTraits:(int)a3
{
  -[GEOWiFiConnectionQuality _readTraits]((uint64_t)self);
  if (self) {
    PBRepeatedInt32Add();
  }
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_uint64_t flags = &self->_flags;
  *(void *)p_flags |= 0x40000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)p_flags + 8) |= 8u;
}

- (int)traitsAtIndex:(unint64_t)a3
{
  -[GEOWiFiConnectionQuality _readTraits]((uint64_t)self);
  p_traits = &self->_traits;
  unint64_t count = self->_traits.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_traits->list[a3];
}

- (void)setTraits:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x40000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 8u;

  MEMORY[0x1F4147390](&self->_traits, a3, a4);
}

- (id)traitsAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53E9E08[a3];
  }

  return v3;
}

- (int)StringAsTraits:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_CONNECTION_TRAIT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MOVING_CONNECTION_TRAIT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"OMNI_PRESENT_CONNECTION_TRAIT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"IS_SECURED_TRAIT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"TCP_GOOD_CONNECTION_TRAIT"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"LONG_TERM_NETWORK_CONNECTION_TRAIT"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)captiveDetermination
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x1000000) != 0) {
    return self->_captiveDetermination;
  }
  else {
    return 0;
  }
}

- (void)setCaptiveDetermination:(int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x1000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_captiveDetermination = a3;
}

- (void)setHasCaptiveDetermination:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x1000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFEFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasCaptiveDetermination
{
  return (*(void *)&self->_flags >> 24) & 1;
}

- (id)captiveDeterminationAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E9E38[a3];
  }

  return v3;
}

- (int)StringAsCaptiveDetermination:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_CAPTIVE_DETERMINATION"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NOT_CAPTIVE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"IS_CAPTIVE"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)associationLength
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x200000) != 0) {
    return self->_associationLength;
  }
  else {
    return 0;
  }
}

- (void)setAssociationLength:(int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x200000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_associationLength = a3;
}

- (void)setHasAssociationLength:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x200000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFDFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasAssociationLength
{
  return (*(void *)&self->_flags >> 21) & 1;
}

- (id)associationLengthAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E9E50[a3];
  }

  return v3;
}

- (int)StringAsAssociationLength:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_ASSOCIATION_TIME_BUCKET"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TIME_BUCKET_LT_ONE_MIN"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TIME_BUCKET_LT_FIVE_MIN"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TIME_BUCKET_LT_TWENTY_MIN"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"TIME_BUCKET_LT_ONE_HOUR"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"TIME_BUCKET_GT_ONE_HOUR"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readAuthTraits
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 352));
    if ((*(void *)(a1 + 472) & 0x10000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiConnectionQualityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAuthTraits_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 352));
  }
}

- (unint64_t)authTraitsCount
{
  return self->_authTraits.count;
}

- (int)authTraits
{
  return self->_authTraits.list;
}

- (void)clearAuthTraits
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x10000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 8u;

  PBRepeatedInt32Clear();
}

- (void)addAuthTraits:(int)a3
{
  -[GEOWiFiConnectionQuality _readAuthTraits]((uint64_t)self);
  if (self) {
    PBRepeatedInt32Add();
  }
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_uint64_t flags = &self->_flags;
  *(void *)p_flags |= 0x10000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)p_flags + 8) |= 8u;
}

- (int)authTraitsAtIndex:(unint64_t)a3
{
  -[GEOWiFiConnectionQuality _readAuthTraits]((uint64_t)self);
  p_authTraits = &self->_authTraits;
  unint64_t count = self->_authTraits.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_authTraits->list[a3];
}

- (void)setAuthTraits:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x10000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 8u;

  MEMORY[0x1F4147390](&self->_authTraits, a3, a4);
}

- (id)authTraitsAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53E9E80[a3];
  }

  return v3;
}

- (int)StringAsAuthTraits:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_AUTH_TRAIT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"OPEN"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WEP"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"WPA"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"EAP"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)networkOrigin
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  int flags = (int)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags < 0) {
    return self->_networkOrigin;
  }
  else {
    return 0;
  }
}

- (void)setNetworkOrigin:(int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x80000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_networkOrigin = a3;
}

- (void)setHasNetworkOrigin:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x80000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_int flags = *(void *)&self->_flags & 0xFFFFFFFF7FFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasNetworkOrigin
{
  return (*(void *)&self->_flags >> 31) & 1;
}

- (id)networkOriginAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E9EA8[a3];
  }

  return v3;
}

- (int)StringAsNetworkOrigin:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_ORIGINATOR_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"USER"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"APP"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CARRIER"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (float)topDLRate
{
  return self->_topDLRate;
}

- (void)setTopDLRate:(float)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x100000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_topDLRate = a3;
}

- (void)setHasTopDLRate:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x100000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_int flags = *(void *)&self->_flags & 0xFFFFEFFFFFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasTopDLRate
{
  return (*(void *)&self->_flags >> 44) & 1;
}

- (BOOL)lowInternetUL
{
  return self->_lowInternetUL;
}

- (void)setLowInternetUL:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x8000000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_lowInternetUL = a3;
}

- (void)setHasLowInternetUL:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x8000000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_int flags = *(void *)&self->_flags & 0xFFF7FFFFFFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasLowInternetUL
{
  return (*(void *)&self->_flags >> 51) & 1;
}

- (BOOL)lowInternetDL
{
  return self->_lowInternetDL;
}

- (void)setLowInternetDL:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x4000000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_lowInternetDL = a3;
}

- (void)setHasLowInternetDL:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x4000000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_int flags = *(void *)&self->_flags & 0xFFFBFFFFFFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasLowInternetDL
{
  return (*(void *)&self->_flags >> 50) & 1;
}

- (BOOL)isKnownGood
{
  return self->_isKnownGood;
}

- (void)setIsKnownGood:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x2000000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_isKnownGood = a3;
}

- (void)setHasIsKnownGood:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x2000000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_int flags = *(void *)&self->_flags & 0xFFFDFFFFFFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasIsKnownGood
{
  return (*(void *)&self->_flags >> 49) & 1;
}

- (BOOL)isEdgeBSS
{
  return self->_isEdgeBSS;
}

- (void)setIsEdgeBSS:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x1000000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_isEdgeBSS = a3;
}

- (void)setHasIsEdgeBSS:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x1000000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_int flags = *(void *)&self->_flags & 0xFFFEFFFFFFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasIsEdgeBSS
{
  return HIWORD(*(void *)&self->_flags) & 1;
}

- (int)associationReason
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x400000) != 0) {
    return self->_associationReason;
  }
  else {
    return 0;
  }
}

- (void)setAssociationReason:(int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x400000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_associationReason = a3;
}

- (void)setHasAssociationReason:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x400000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFBFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasAssociationReason
{
  return (*(void *)&self->_flags >> 22) & 1;
}

- (id)associationReasonAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E9EC8[a3];
  }

  return v3;
}

- (int)StringAsAssociationReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_ASSOCIATION_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"AUTOMATIC"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CLIENT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ROAM"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)disassociationReason
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x20000000) != 0) {
    return self->_disassociationReason;
  }
  else {
    return 0;
  }
}

- (void)setDisassociationReason:(int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x20000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_disassociationReason = a3;
}

- (void)setHasDisassociationReason:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x20000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFDFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasDisassociationReason
{
  return (*(void *)&self->_flags >> 29) & 1;
}

- (id)disassociationReasonAsString:(int)a3
{
  if (a3 >= 0x1B)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E9EE8[a3];
  }

  return v3;
}

- (int)StringAsDisassociationReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_DISASSOCIATION_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DEAUTH"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"BEACON_LOSS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"INTERNAL_ERROR"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"PWR_SAVE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"USR_PWROFF"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"TRIGGER_DISC"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"TEMP_DISABLE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"CLIENT_DISC"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"SET_NETWORK"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"DECRYPTION_FAILURE"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"PRIMARY_INT_FAILURE"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"PPM_RESTRICTION"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"MIS_ENABLED"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"USR_PREFERENCE"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"MISC_REASON"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"EAP_RESTART"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"USER_FORCED"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"EAP_FAILURE"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"NET_TRANSITION"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"AUTO_UNLOCK"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"CAPTIVE"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"USER_NOTIFICATION"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"P2P_BSS_STEERING"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"AUTO_HS"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"AUTO_HS_TRANSITION"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"ROAM_FOR_PERF"])
  {
    int v4 = 26;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readEssMembers
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 352));
    if ((*(void *)(a1 + 472) & 0x100000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiConnectionQualityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEssMembers_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 352));
  }
}

- (NSMutableArray)essMembers
{
  -[GEOWiFiConnectionQuality _readEssMembers]((uint64_t)self);
  essMembers = self->_essMembers;

  return essMembers;
}

- (void)setEssMembers:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x100000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 8u;
  essMembers = self->_essMembers;
  self->_essMembers = v4;
}

- (void)clearEssMembers
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x100000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 8u;
  essMembers = self->_essMembers;

  [(NSMutableArray *)essMembers removeAllObjects];
}

- (void)addEssMembers:(id)a3
{
  id v4 = a3;
  -[GEOWiFiConnectionQuality _readEssMembers]((uint64_t)self);
  -[GEOWiFiConnectionQuality _addNoFlagsEssMembers:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOWiFiConnectionQuality *)((char *)self + 472);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x100000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 8u;
}

- (void)_addNoFlagsEssMembers:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 136);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 136);
      *(void *)(a1 + 136) = v5;

      id v4 = *(void **)(a1 + 136);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)essMembersCount
{
  -[GEOWiFiConnectionQuality _readEssMembers]((uint64_t)self);
  essMembers = self->_essMembers;

  return [(NSMutableArray *)essMembers count];
}

- (id)essMembersAtIndex:(unint64_t)a3
{
  -[GEOWiFiConnectionQuality _readEssMembers]((uint64_t)self);
  essMembers = self->_essMembers;

  return (id)[(NSMutableArray *)essMembers objectAtIndex:a3];
}

+ (Class)essMembersType
{
  return (Class)objc_opt_class();
}

- (void)_readNearbyBSSs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 352));
    if ((*(void *)(a1 + 472) & 0x4000000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiConnectionQualityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNearbyBSSs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 352));
  }
}

- (NSMutableArray)nearbyBSSs
{
  -[GEOWiFiConnectionQuality _readNearbyBSSs]((uint64_t)self);
  nearbyBSSs = self->_nearbyBSSs;

  return nearbyBSSs;
}

- (void)setNearbyBSSs:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x4000000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 8u;
  nearbyBSSs = self->_nearbyBSSs;
  self->_nearbyBSSs = v4;
}

- (void)clearNearbyBSSs
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x4000000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 8u;
  nearbyBSSs = self->_nearbyBSSs;

  [(NSMutableArray *)nearbyBSSs removeAllObjects];
}

- (void)addNearbyBSS:(id)a3
{
  id v4 = a3;
  -[GEOWiFiConnectionQuality _readNearbyBSSs]((uint64_t)self);
  -[GEOWiFiConnectionQuality _addNoFlagsNearbyBSS:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOWiFiConnectionQuality *)((char *)self + 472);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x4000000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 8u;
}

- (void)_addNoFlagsNearbyBSS:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 224);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 224);
      *(void *)(a1 + 224) = v5;

      id v4 = *(void **)(a1 + 224);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)nearbyBSSsCount
{
  -[GEOWiFiConnectionQuality _readNearbyBSSs]((uint64_t)self);
  nearbyBSSs = self->_nearbyBSSs;

  return [(NSMutableArray *)nearbyBSSs count];
}

- (id)nearbyBSSAtIndex:(unint64_t)a3
{
  -[GEOWiFiConnectionQuality _readNearbyBSSs]((uint64_t)self);
  nearbyBSSs = self->_nearbyBSSs;

  return (id)[(NSMutableArray *)nearbyBSSs objectAtIndex:a3];
}

+ (Class)nearbyBSSType
{
  return (Class)objc_opt_class();
}

- (void)_readFeedbacks
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 352));
    if ((*(void *)(a1 + 472) & 0x200000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiConnectionQualityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFeedbacks_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 352));
  }
}

- (NSMutableArray)feedbacks
{
  -[GEOWiFiConnectionQuality _readFeedbacks]((uint64_t)self);
  feedbacks = self->_feedbacks;

  return feedbacks;
}

- (void)setFeedbacks:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x200000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 8u;
  feedbacks = self->_feedbacks;
  self->_feedbacks = v4;
}

- (void)clearFeedbacks
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x200000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 8u;
  feedbacks = self->_feedbacks;

  [(NSMutableArray *)feedbacks removeAllObjects];
}

- (void)addFeedback:(id)a3
{
  id v4 = a3;
  -[GEOWiFiConnectionQuality _readFeedbacks]((uint64_t)self);
  -[GEOWiFiConnectionQuality _addNoFlagsFeedback:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOWiFiConnectionQuality *)((char *)self + 472);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x200000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 8u;
}

- (void)_addNoFlagsFeedback:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 160);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 160);
      *(void *)(a1 + 160) = v5;

      id v4 = *(void **)(a1 + 160);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)feedbacksCount
{
  -[GEOWiFiConnectionQuality _readFeedbacks]((uint64_t)self);
  feedbacks = self->_feedbacks;

  return [(NSMutableArray *)feedbacks count];
}

- (id)feedbackAtIndex:(unint64_t)a3
{
  -[GEOWiFiConnectionQuality _readFeedbacks]((uint64_t)self);
  feedbacks = self->_feedbacks;

  return (id)[(NSMutableArray *)feedbacks objectAtIndex:a3];
}

+ (Class)feedbackType
{
  return (Class)objc_opt_class();
}

- (void)_readIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 352));
    if ((*(void *)(a1 + 472) & 0x800000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiConnectionQualityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIdentifier_tags_8);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 352));
  }
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (NSString)identifier
{
  -[GEOWiFiConnectionQuality _readIdentifier]((uint64_t)self);
  identifier = self->_identifier;

  return identifier;
}

- (void)setIdentifier:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x800000000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void)_readRoamStates
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 352));
    if ((*(unsigned char *)(a1 + 480) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiConnectionQualityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRoamStates_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 352));
  }
}

- (NSMutableArray)roamStates
{
  -[GEOWiFiConnectionQuality _readRoamStates]((uint64_t)self);
  roamStates = self->_roamStates;

  return roamStates;
}

- (void)setRoamStates:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *((unsigned char *)&self->_flags + 8) |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 8u;
  roamStates = self->_roamStates;
  self->_roamStates = v4;
}

- (void)clearRoamStates
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((unsigned char *)&self->_flags + 8) |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 8u;
  roamStates = self->_roamStates;

  [(NSMutableArray *)roamStates removeAllObjects];
}

- (void)addRoamStates:(id)a3
{
  id v4 = a3;
  -[GEOWiFiConnectionQuality _readRoamStates]((uint64_t)self);
  -[GEOWiFiConnectionQuality _addNoFlagsRoamStates:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOWiFiConnectionQuality *)((char *)self + 472);
  LOBYTE(self->_reader) |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 8u;
}

- (void)_addNoFlagsRoamStates:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 288);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 288);
      *(void *)(a1 + 288) = v5;

      id v4 = *(void **)(a1 + 288);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)roamStatesCount
{
  -[GEOWiFiConnectionQuality _readRoamStates]((uint64_t)self);
  roamStates = self->_roamStates;

  return [(NSMutableArray *)roamStates count];
}

- (id)roamStatesAtIndex:(unint64_t)a3
{
  -[GEOWiFiConnectionQuality _readRoamStates]((uint64_t)self);
  roamStates = self->_roamStates;

  return (id)[(NSMutableArray *)roamStates objectAtIndex:a3];
}

+ (Class)roamStatesType
{
  return (Class)objc_opt_class();
}

- (void)_readSpeedTests
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 352));
    if ((*(unsigned char *)(a1 + 480) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiConnectionQualityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSpeedTests_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 352));
  }
}

- (NSMutableArray)speedTests
{
  -[GEOWiFiConnectionQuality _readSpeedTests]((uint64_t)self);
  speedTests = self->_speedTests;

  return speedTests;
}

- (void)setSpeedTests:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *((unsigned char *)&self->_flags + 8) |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 8u;
  speedTests = self->_speedTests;
  self->_speedTests = v4;
}

- (void)clearSpeedTests
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((unsigned char *)&self->_flags + 8) |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 8u;
  speedTests = self->_speedTests;

  [(NSMutableArray *)speedTests removeAllObjects];
}

- (void)addSpeedTest:(id)a3
{
  id v4 = a3;
  -[GEOWiFiConnectionQuality _readSpeedTests]((uint64_t)self);
  -[GEOWiFiConnectionQuality _addNoFlagsSpeedTest:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOWiFiConnectionQuality *)((char *)self + 472);
  LOBYTE(self->_reader) |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 8u;
}

- (void)_addNoFlagsSpeedTest:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 304);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 304);
      *(void *)(a1 + 304) = v5;

      id v4 = *(void **)(a1 + 304);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)speedTestsCount
{
  -[GEOWiFiConnectionQuality _readSpeedTests]((uint64_t)self);
  speedTests = self->_speedTests;

  return [(NSMutableArray *)speedTests count];
}

- (id)speedTestAtIndex:(unint64_t)a3
{
  -[GEOWiFiConnectionQuality _readSpeedTests]((uint64_t)self);
  speedTests = self->_speedTests;

  return (id)[(NSMutableArray *)speedTests objectAtIndex:a3];
}

+ (Class)speedTestType
{
  return (Class)objc_opt_class();
}

- (unsigned)sslConnectionCount
{
  return self->_sslConnectionCount;
}

- (void)setSslConnectionCount:(unsigned int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x40000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_sslConnectionCount = a3;
}

- (void)setHasSslConnectionCount:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x40000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFBFFFFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasSslConnectionCount
{
  return (*(void *)&self->_flags >> 42) & 1;
}

- (unsigned)sslErrorCount
{
  return self->_sslErrorCount;
}

- (void)setSslErrorCount:(unsigned int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x80000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_sslErrorCount = a3;
}

- (void)setHasSslErrorCount:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x80000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFF7FFFFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasSslErrorCount
{
  return (*(void *)&self->_flags >> 43) & 1;
}

- (int)apMode
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x100000) != 0) {
    return self->_apMode;
  }
  else {
    return 0;
  }
}

- (void)setApMode:(int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x100000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_apMode = a3;
}

- (void)setHasApMode:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x100000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFEFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasApMode
{
  return (*(void *)&self->_flags >> 20) & 1;
}

- (id)apModeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E9FC0[a3];
  }

  return v3;
}

- (int)StringAsApMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_AP_MODE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"IBSS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"INFRA"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ANY"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)clientAssociationSubreason
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x10000000) != 0) {
    return self->_clientAssociationSubreason;
  }
  else {
    return 0;
  }
}

- (void)setClientAssociationSubreason:(int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x10000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_clientAssociationSubreason = a3;
}

- (void)setHasClientAssociationSubreason:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x10000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFEFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasClientAssociationSubreason
{
  return (*(void *)&self->_flags >> 28) & 1;
}

- (id)clientAssociationSubreasonAsString:(int)a3
{
  if (a3 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E9FE0[a3];
  }

  return v3;
}

- (int)StringAsClientAssociationSubreason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_SUBREASON_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SETTINGS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SETUP"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CONTROL_CENTER"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"RECOMMENDATION"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"QR"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"ATJ"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"APPLICATION"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"WALLET"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)type
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x200000000000) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x200000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x200000000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFDFFFFFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasType
{
  return (*(void *)&self->_flags >> 45) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53EA028[a3];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_HARVEST_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CONNECTION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LABEL"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readLabel
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 352));
    if ((*(void *)(a1 + 472) & 0x1000000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiConnectionQualityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLabel_tags_4);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 352));
  }
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (GEOWiFiHarvestLabel)label
{
  -[GEOWiFiConnectionQuality _readLabel]((uint64_t)self);
  label = self->_label;

  return label;
}

- (void)setLabel:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x1000000000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_label, a3);
}

- (void)_readPasspointInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 352));
    if ((*(void *)(a1 + 472) & 0x8000000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiConnectionQualityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPasspointInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 352));
  }
}

- (BOOL)hasPasspointInfo
{
  return self->_passpointInfo != 0;
}

- (GEOWiFiPasspointInfo)passpointInfo
{
  -[GEOWiFiConnectionQuality _readPasspointInfo]((uint64_t)self);
  passpointInfo = self->_passpointInfo;

  return passpointInfo;
}

- (void)setPasspointInfo:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x8000000000000000;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_passpointInfo, a3);
}

- (void)_readHotspotHelperProviders
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 352));
    if ((*(void *)(a1 + 472) & 0x400000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiConnectionQualityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHotspotHelperProviders_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 352));
  }
}

- (NSMutableArray)hotspotHelperProviders
{
  -[GEOWiFiConnectionQuality _readHotspotHelperProviders]((uint64_t)self);
  hotspotHelperProviders = self->_hotspotHelperProviders;

  return hotspotHelperProviders;
}

- (void)setHotspotHelperProviders:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x400000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 8u;
  hotspotHelperProviders = self->_hotspotHelperProviders;
  self->_hotspotHelperProviders = v4;
}

- (void)clearHotspotHelperProviders
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x400000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 8u;
  hotspotHelperProviders = self->_hotspotHelperProviders;

  [(NSMutableArray *)hotspotHelperProviders removeAllObjects];
}

- (void)addHotspotHelperProvider:(id)a3
{
  id v4 = a3;
  -[GEOWiFiConnectionQuality _readHotspotHelperProviders]((uint64_t)self);
  -[GEOWiFiConnectionQuality _addNoFlagsHotspotHelperProvider:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOWiFiConnectionQuality *)((char *)self + 472);
  self->super.super.isa = (Class)((unint64_t)self->super.super.isa | 0x400000000000000);
  os_unfair_lock_unlock(p_readerLock);
  LOBYTE(self->_reader) |= 8u;
}

- (void)_addNoFlagsHotspotHelperProvider:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 168);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 168);
      *(void *)(a1 + 168) = v5;

      id v4 = *(void **)(a1 + 168);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)hotspotHelperProvidersCount
{
  -[GEOWiFiConnectionQuality _readHotspotHelperProviders]((uint64_t)self);
  hotspotHelperProviders = self->_hotspotHelperProviders;

  return [(NSMutableArray *)hotspotHelperProviders count];
}

- (id)hotspotHelperProviderAtIndex:(unint64_t)a3
{
  -[GEOWiFiConnectionQuality _readHotspotHelperProviders]((uint64_t)self);
  hotspotHelperProviders = self->_hotspotHelperProviders;

  return (id)[(NSMutableArray *)hotspotHelperProviders objectAtIndex:a3];
}

+ (Class)hotspotHelperProviderType
{
  return (Class)objc_opt_class();
}

- (void)_readNameAttributes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 352));
    if ((*(void *)(a1 + 472) & 0x20000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiConnectionQualityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNameAttributes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 352));
  }
}

- (unint64_t)nameAttributesCount
{
  return self->_nameAttributes.count;
}

- (int)nameAttributes
{
  return self->_nameAttributes.list;
}

- (void)clearNameAttributes
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x20000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 8u;

  PBRepeatedInt32Clear();
}

- (void)addNameAttributes:(int)a3
{
  -[GEOWiFiConnectionQuality _readNameAttributes]((uint64_t)self);
  if (self) {
    PBRepeatedInt32Add();
  }
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_uint64_t flags = &self->_flags;
  *(void *)p_flags |= 0x20000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)p_flags + 8) |= 8u;
}

- (int)nameAttributesAtIndex:(unint64_t)a3
{
  -[GEOWiFiConnectionQuality _readNameAttributes]((uint64_t)self);
  p_nameAttributes = &self->_nameAttributes;
  unint64_t count = self->_nameAttributes.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_nameAttributes->list[a3];
}

- (void)setNameAttributes:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x20000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((unsigned char *)&self->_flags + 8) |= 8u;

  MEMORY[0x1F4147390](&self->_nameAttributes, a3, a4);
}

- (id)nameAttributesAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53EA040[a3];
  }

  return v3;
}

- (int)StringAsNameAttributes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"INDICATES_NOT_PUBLIC"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"INDICATES_PUBLIC"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)dohAvailability
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  uint64_t flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x40000000) != 0) {
    return self->_dohAvailability;
  }
  else {
    return 0;
  }
}

- (void)setDohAvailability:(int)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x40000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_dohAvailability = a3;
}

- (void)setHasDohAvailability:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x40000000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFBFFFFFFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasDohAvailability
{
  return (*(void *)&self->_flags >> 30) & 1;
}

- (id)dohAvailabilityAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53EA058[a3];
  }

  return v3;
}

- (int)StringAsDohAvailability:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_DNS_AVAILABILITY"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DOH_PERMITTED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"DOH_BLOCKED"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readBeaconInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 352));
    if ((*(void *)(a1 + 472) & 0x80000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiConnectionQualityReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBeaconInfo_tags_208);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 352));
  }
}

- (BOOL)hasBeaconInfo
{
  return self->_beaconInfo != 0;
}

- (GEOWiFiBeaconInfo)beaconInfo
{
  -[GEOWiFiConnectionQuality _readBeaconInfo]((uint64_t)self);
  beaconInfo = self->_beaconInfo;

  return beaconInfo;
}

- (void)setBeaconInfo:(id)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x80000000000000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  objc_storeStrong((id *)&self->_beaconInfo, a3);
}

- (double)responsivenessScore
{
  return self->_responsivenessScore;
}

- (void)setResponsivenessScore:(double)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8) | 8;
  *(void *)&self->_flags |= 0x8000uLL;
  *((unsigned char *)&self->_flags + 8) = v3;
  self->_responsivenessScore = a3;
}

- (void)setHasResponsivenessScore:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->_flags + 8);
  uint64_t v4 = 0x8000;
  if (!a3) {
    uint64_t v4 = 0;
  }
  *(void *)&self->_uint64_t flags = *(void *)&self->_flags & 0xFFFFFFFFFFFF7FFFLL | v4;
  *((unsigned char *)&self->_flags + 8) = v3 | 8;
}

- (BOOL)hasResponsivenessScore
{
  return (*(void *)&self->_flags >> 15) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOWiFiConnectionQuality;
  uint64_t v4 = [(GEOWiFiConnectionQuality *)&v8 description];
  id v5 = [(GEOWiFiConnectionQuality *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOWiFiConnectionQuality _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v172 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v145 = 0;
    goto LABEL_250;
  }
  [(id)a1 readAll:1];
  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  unint64_t v5 = 0x1E4F28000uLL;
  if ((*(void *)(a1 + 472) & 0x80000) != 0)
  {
    objc_super v6 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 328)];
    [v4 setObject:v6 forKey:@"timestamp"];
  }
  id v7 = [(id)a1 uniqueID];
  if (v7) {
    [v4 setObject:v7 forKey:@"uniqueID"];
  }

  uint64_t v9 = *(void *)(a1 + 472);
  if ((v9 & 0x400) != 0)
  {
    v13 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 232)];
    [v4 setObject:v13 forKey:@"overAllStay"];

    uint64_t v9 = *(void *)(a1 + 472);
    if ((v9 & 0x40) == 0)
    {
LABEL_8:
      if ((v9 & 0x80) == 0) {
        goto LABEL_9;
      }
      goto LABEL_44;
    }
  }
  else if ((v9 & 0x40) == 0)
  {
    goto LABEL_8;
  }
  v14 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 152)];
  [v4 setObject:v14 forKey:@"faultyStay"];

  uint64_t v9 = *(void *)(a1 + 472);
  if ((v9 & 0x80) == 0)
  {
LABEL_9:
    if ((v9 & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_45;
  }
LABEL_44:
  v15 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 200)];
  [v4 setObject:v15 forKey:@"lowLQMStay"];

  uint64_t v9 = *(void *)(a1 + 472);
  if ((v9 & 0x100) == 0)
  {
LABEL_10:
    if ((v9 & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_46;
  }
LABEL_45:
  v16 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 208)];
  [v4 setObject:v16 forKey:@"lowqStay"];

  uint64_t v9 = *(void *)(a1 + 472);
  if ((v9 & 0x200) == 0)
  {
LABEL_11:
    if ((v9 & 0x20000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_47;
  }
LABEL_46:
  v17 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 216)];
  [v4 setObject:v17 forKey:@"lqmTranCount"];

  uint64_t v9 = *(void *)(a1 + 472);
  if ((v9 & 0x20000) == 0)
  {
LABEL_12:
    if ((v9 & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_48;
  }
LABEL_47:
  v18 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 312)];
  [v4 setObject:v18 forKey:@"successfulConnections"];

  uint64_t v9 = *(void *)(a1 + 472);
  if ((v9 & 0x20) == 0)
  {
LABEL_13:
    if ((v9 & 0x800) == 0) {
      goto LABEL_14;
    }
    goto LABEL_49;
  }
LABEL_48:
  v19 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 144)];
  [v4 setObject:v19 forKey:@"failedConnections"];

  uint64_t v9 = *(void *)(a1 + 472);
  if ((v9 & 0x800) == 0)
  {
LABEL_14:
    if ((v9 & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_50;
  }
LABEL_49:
  v20 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 240)];
  [v4 setObject:v20 forKey:@"packetsIn"];

  uint64_t v9 = *(void *)(a1 + 472);
  if ((v9 & 0x1000) == 0)
  {
LABEL_15:
    if ((v9 & 2) == 0) {
      goto LABEL_16;
    }
    goto LABEL_51;
  }
LABEL_50:
  v21 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 248)];
  [v4 setObject:v21 forKey:@"packetsOut"];

  uint64_t v9 = *(void *)(a1 + 472);
  if ((v9 & 2) == 0)
  {
LABEL_16:
    if ((v9 & 8) == 0) {
      goto LABEL_17;
    }
    goto LABEL_52;
  }
LABEL_51:
  v22 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 104)];
  [v4 setObject:v22 forKey:@"bytesInTotal"];

  uint64_t v9 = *(void *)(a1 + 472);
  if ((v9 & 8) == 0)
  {
LABEL_17:
    if ((v9 & 1) == 0) {
      goto LABEL_18;
    }
    goto LABEL_53;
  }
LABEL_52:
  v23 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 120)];
  [v4 setObject:v23 forKey:@"bytesOutTotal"];

  uint64_t v9 = *(void *)(a1 + 472);
  if ((v9 & 1) == 0)
  {
LABEL_18:
    if ((v9 & 4) == 0) {
      goto LABEL_19;
    }
    goto LABEL_54;
  }
LABEL_53:
  v24 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 96)];
  [v4 setObject:v24 forKey:@"bytesInActive"];

  uint64_t v9 = *(void *)(a1 + 472);
  if ((v9 & 4) == 0)
  {
LABEL_19:
    if ((v9 & 0x2000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_55;
  }
LABEL_54:
  v25 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 112)];
  [v4 setObject:v25 forKey:@"bytesOutActive"];

  uint64_t v9 = *(void *)(a1 + 472);
  if ((v9 & 0x2000) == 0)
  {
LABEL_20:
    if ((v9 & 0x10) == 0) {
      goto LABEL_21;
    }
    goto LABEL_56;
  }
LABEL_55:
  v26 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 264)];
  [v4 setObject:v26 forKey:@"reTxBytes"];

  uint64_t v9 = *(void *)(a1 + 472);
  if ((v9 & 0x10) == 0)
  {
LABEL_21:
    if ((v9 & 0x4000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_57;
  }
LABEL_56:
  v27 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 128)];
  [v4 setObject:v27 forKey:@"dataStalls"];

  uint64_t v9 = *(void *)(a1 + 472);
  if ((v9 & 0x4000) == 0)
  {
LABEL_22:
    if ((v9 & 0x10000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_58;
  }
LABEL_57:
  v28 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 272)];
  [v4 setObject:v28 forKey:@"receivedDupes"];

  uint64_t v9 = *(void *)(a1 + 472);
  if ((v9 & 0x10000) == 0)
  {
LABEL_23:
    if ((v9 & 0x2000000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_59;
  }
LABEL_58:
  v29 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 296)];
  [v4 setObject:v29 forKey:@"rxOutOfOrderBytes"];

  uint64_t v9 = *(void *)(a1 + 472);
  if ((v9 & 0x2000000000) == 0)
  {
LABEL_24:
    if ((v9 & 0x800000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_60;
  }
LABEL_59:
  LODWORD(v8) = *(_DWORD *)(a1 + 424);
  v30 = [NSNumber numberWithFloat:v8];
  [v4 setObject:v30 forKey:@"roundTripTimeMin"];

  uint64_t v9 = *(void *)(a1 + 472);
  if ((v9 & 0x800000000) == 0)
  {
LABEL_25:
    if ((v9 & 0x8000000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_61;
  }
LABEL_60:
  LODWORD(v8) = *(_DWORD *)(a1 + 416);
  v31 = [NSNumber numberWithFloat:v8];
  [v4 setObject:v31 forKey:@"roundTripTimeAvg"];

  uint64_t v9 = *(void *)(a1 + 472);
  if ((v9 & 0x8000000000) == 0)
  {
LABEL_26:
    if ((v9 & 0x1000000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_62;
  }
LABEL_61:
  LODWORD(v8) = *(_DWORD *)(a1 + 432);
  v32 = [NSNumber numberWithFloat:v8];
  [v4 setObject:v32 forKey:@"roundTripTimeVar"];

  uint64_t v9 = *(void *)(a1 + 472);
  if ((v9 & 0x1000000000) == 0)
  {
LABEL_27:
    if ((v9 & 0x400000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_63;
  }
LABEL_62:
  LODWORD(v8) = *(_DWORD *)(a1 + 420);
  v33 = [NSNumber numberWithFloat:v8];
  [v4 setObject:v33 forKey:@"roundTripTimeMinActive"];

  uint64_t v9 = *(void *)(a1 + 472);
  if ((v9 & 0x400000000) == 0)
  {
LABEL_28:
    if ((v9 & 0x4000000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_64;
  }
LABEL_63:
  LODWORD(v8) = *(_DWORD *)(a1 + 412);
  v34 = [NSNumber numberWithFloat:v8];
  [v4 setObject:v34 forKey:@"roundTripTimeAvgActive"];

  uint64_t v9 = *(void *)(a1 + 472);
  if ((v9 & 0x4000000000) == 0)
  {
LABEL_29:
    if ((v9 & 0x800000000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_65;
  }
LABEL_64:
  LODWORD(v8) = *(_DWORD *)(a1 + 428);
  v35 = [NSNumber numberWithFloat:v8];
  [v4 setObject:v35 forKey:@"roundTripTimeVarActive"];

  uint64_t v9 = *(void *)(a1 + 472);
  if ((v9 & 0x800000000000) == 0)
  {
LABEL_30:
    if ((v9 & 0x800000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_66;
  }
LABEL_65:
  v36 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 464)];
  [v4 setObject:v36 forKey:@"hotspot20"];

  uint64_t v9 = *(void *)(a1 + 472);
  if ((v9 & 0x800000) == 0)
  {
LABEL_31:
    if ((v9 & 0x8000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_67;
  }
LABEL_66:
  v37 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 368)];
  [v4 setObject:v37 forKey:@"band"];

  uint64_t v9 = *(void *)(a1 + 472);
  if ((v9 & 0x8000000) == 0)
  {
LABEL_32:
    if ((v9 & 0x4000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_68;
  }
LABEL_67:
  v38 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 384)];
  [v4 setObject:v38 forKey:@"channel"];

  uint64_t v9 = *(void *)(a1 + 472);
  if ((v9 & 0x4000000) == 0)
  {
LABEL_33:
    if ((v9 & 0x10000000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_69;
  }
LABEL_68:
  v39 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 380)];
  [v4 setObject:v39 forKey:@"channelWidth"];

  uint64_t v9 = *(void *)(a1 + 472);
  if ((v9 & 0x10000000000) == 0)
  {
LABEL_34:
    if ((v9 & 0x20000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_70;
  }
LABEL_69:
  v40 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 436)];
  [v4 setObject:v40 forKey:@"rssi"];

  uint64_t v9 = *(void *)(a1 + 472);
  if ((v9 & 0x20000000000) == 0)
  {
LABEL_35:
    if ((v9 & 0x2000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_71;
  }
LABEL_70:
  v41 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 440)];
  [v4 setObject:v41 forKey:@"snr"];

  uint64_t v9 = *(void *)(a1 + 472);
  if ((v9 & 0x2000000) == 0)
  {
LABEL_36:
    if ((v9 & 0x200000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_72;
  }
LABEL_71:
  v42 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 376)];
  [v4 setObject:v42 forKey:@"cca"];

  uint64_t v9 = *(void *)(a1 + 472);
  if ((v9 & 0x200000000) == 0)
  {
LABEL_37:
    if ((v9 & 0x40000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
LABEL_72:
  v43 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 408)];
  [v4 setObject:v43 forKey:@"phyMode"];

  if ((*(void *)(a1 + 472) & 0x40000) != 0)
  {
LABEL_38:
    v10 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 320)];
    [v4 setObject:v10 forKey:@"timeOfDay"];
  }
LABEL_39:
  v11 = [(id)a1 location];
  v12 = v11;
  if (v11)
  {
    if (a2) {
      [v11 jsonRepresentation];
    }
    else {
    id v44 = [v11 dictionaryRepresentation];
    }

    [v4 setObject:v44 forKey:@"location"];
  }

  uint64_t v46 = *(void *)(a1 + 472);
  if ((v46 & 0x400000000000) != 0)
  {
    v47 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 460)];
    [v4 setObject:v47 forKey:@"wasCaptiveFlag"];

    uint64_t v46 = *(void *)(a1 + 472);
  }
  if ((v46 & 0x100000000) != 0)
  {
    uint64_t v48 = *(int *)(a1 + 404);
    if (v48 >= 0x11)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 404));
      v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v49 = off_1E53EA088[v48];
    }
    [v4 setObject:v49 forKey:@"networkType"];
  }
  if (*(void *)(a1 + 72))
  {
    v50 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    v51 = (void *)(a1 + 64);
    if (*(void *)(a1 + 72))
    {
      unint64_t v52 = 0;
      do
      {
        uint64_t v53 = *(int *)(*v51 + 4 * v52);
        if (v53 >= 6)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v53);
          v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v54 = off_1E53E9E08[v53];
        }
        [v50 addObject:v54];

        ++v52;
        v51 = (void *)(a1 + 64);
      }
      while (v52 < *(void *)(a1 + 72));
    }
    [v4 setObject:v50 forKey:@"traits"];

    unint64_t v5 = 0x1E4F28000;
  }
  uint64_t v55 = *(void *)(a1 + 472);
  if ((v55 & 0x1000000) != 0)
  {
    uint64_t v56 = *(int *)(a1 + 372);
    if (v56 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 372));
      v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v57 = off_1E53E9E38[v56];
    }
    [v4 setObject:v57 forKey:@"captiveDetermination"];

    uint64_t v55 = *(void *)(a1 + 472);
  }
  if ((v55 & 0x200000) != 0)
  {
    uint64_t v58 = *(int *)(a1 + 360);
    if (v58 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 360));
      v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v59 = off_1E53E9E50[v58];
    }
    [v4 setObject:v59 forKey:@"associationLength"];
  }
  if (*(void *)(a1 + 24))
  {
    v60 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    v61 = (void *)(a1 + 16);
    if (*(void *)(a1 + 24))
    {
      unint64_t v62 = 0;
      do
      {
        uint64_t v63 = *(int *)(*v61 + 4 * v62);
        if (v63 >= 5)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v63);
          v64 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v64 = off_1E53E9E80[v63];
        }
        [v60 addObject:v64];

        ++v62;
        v61 = (void *)(a1 + 16);
      }
      while (v62 < *(void *)(a1 + 24));
    }
    [v4 setObject:v60 forKey:@"authTraits"];

    unint64_t v5 = 0x1E4F28000uLL;
  }
  uint64_t v65 = *(void *)(a1 + 472);
  if ((v65 & 0x80000000) != 0)
  {
    uint64_t v66 = *(int *)(a1 + 400);
    if (v66 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 400));
      v67 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v67 = off_1E53E9EA8[v66];
    }
    [v4 setObject:v67 forKey:@"networkOrigin"];

    uint64_t v65 = *(void *)(a1 + 472);
    if ((v65 & 0x100000000000) == 0)
    {
LABEL_111:
      if ((v65 & 0x8000000000000) == 0) {
        goto LABEL_112;
      }
      goto LABEL_123;
    }
  }
  else if ((v65 & 0x100000000000) == 0)
  {
    goto LABEL_111;
  }
  LODWORD(v45) = *(_DWORD *)(a1 + 452);
  v68 = [*(id *)(v5 + 3792) numberWithFloat:v45];
  [v4 setObject:v68 forKey:@"topDLRate"];

  uint64_t v65 = *(void *)(a1 + 472);
  if ((v65 & 0x8000000000000) == 0)
  {
LABEL_112:
    if ((v65 & 0x4000000000000) == 0) {
      goto LABEL_113;
    }
    goto LABEL_124;
  }
LABEL_123:
  v69 = [*(id *)(v5 + 3792) numberWithBool:*(unsigned __int8 *)(a1 + 468)];
  [v4 setObject:v69 forKey:@"lowInternetUL"];

  uint64_t v65 = *(void *)(a1 + 472);
  if ((v65 & 0x4000000000000) == 0)
  {
LABEL_113:
    if ((v65 & 0x2000000000000) == 0) {
      goto LABEL_114;
    }
    goto LABEL_125;
  }
LABEL_124:
  v70 = [*(id *)(v5 + 3792) numberWithBool:*(unsigned __int8 *)(a1 + 467)];
  [v4 setObject:v70 forKey:@"lowInternetDL"];

  uint64_t v65 = *(void *)(a1 + 472);
  if ((v65 & 0x2000000000000) == 0)
  {
LABEL_114:
    if ((v65 & 0x1000000000000) == 0) {
      goto LABEL_115;
    }
    goto LABEL_126;
  }
LABEL_125:
  v71 = [*(id *)(v5 + 3792) numberWithBool:*(unsigned __int8 *)(a1 + 466)];
  [v4 setObject:v71 forKey:@"isKnownGood"];

  uint64_t v65 = *(void *)(a1 + 472);
  if ((v65 & 0x1000000000000) == 0)
  {
LABEL_115:
    if ((v65 & 0x400000) == 0) {
      goto LABEL_116;
    }
    goto LABEL_127;
  }
LABEL_126:
  v72 = [*(id *)(v5 + 3792) numberWithBool:*(unsigned __int8 *)(a1 + 465)];
  [v4 setObject:v72 forKey:@"isEdgeBSS"];

  uint64_t v65 = *(void *)(a1 + 472);
  if ((v65 & 0x400000) == 0)
  {
LABEL_116:
    if ((v65 & 0x20000000) == 0) {
      goto LABEL_135;
    }
    goto LABEL_131;
  }
LABEL_127:
  uint64_t v73 = *(int *)(a1 + 364);
  if (v73 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 364));
    v74 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v74 = off_1E53E9EC8[v73];
  }
  [v4 setObject:v74 forKey:@"associationReason"];

  if ((*(void *)(a1 + 472) & 0x20000000) != 0)
  {
LABEL_131:
    uint64_t v75 = *(int *)(a1 + 392);
    if (v75 >= 0x1B)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 392));
      v76 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v76 = off_1E53E9EE8[v75];
    }
    [v4 setObject:v76 forKey:@"disassociationReason"];
  }
LABEL_135:
  if ([*(id *)(a1 + 136) count])
  {
    v77 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 136), "count"));
    long long v163 = 0u;
    long long v164 = 0u;
    long long v165 = 0u;
    long long v166 = 0u;
    id v78 = *(id *)(a1 + 136);
    uint64_t v79 = [v78 countByEnumeratingWithState:&v163 objects:v171 count:16];
    if (v79)
    {
      uint64_t v80 = v79;
      uint64_t v81 = *(void *)v164;
      do
      {
        for (uint64_t i = 0; i != v80; ++i)
        {
          if (*(void *)v164 != v81) {
            objc_enumerationMutation(v78);
          }
          v83 = *(void **)(*((void *)&v163 + 1) + 8 * i);
          if (a2) {
            [v83 jsonRepresentation];
          }
          else {
          id v84 = [v83 dictionaryRepresentation];
          }

          [v77 addObject:v84];
        }
        uint64_t v80 = [v78 countByEnumeratingWithState:&v163 objects:v171 count:16];
      }
      while (v80);
    }

    [v4 setObject:v77 forKey:@"essMembers"];
  }
  if ([*(id *)(a1 + 224) count])
  {
    v85 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 224), "count"));
    long long v159 = 0u;
    long long v160 = 0u;
    long long v161 = 0u;
    long long v162 = 0u;
    id v86 = *(id *)(a1 + 224);
    uint64_t v87 = [v86 countByEnumeratingWithState:&v159 objects:v170 count:16];
    if (v87)
    {
      uint64_t v88 = v87;
      uint64_t v89 = *(void *)v160;
      do
      {
        for (uint64_t j = 0; j != v88; ++j)
        {
          if (*(void *)v160 != v89) {
            objc_enumerationMutation(v86);
          }
          v91 = *(void **)(*((void *)&v159 + 1) + 8 * j);
          if (a2) {
            [v91 jsonRepresentation];
          }
          else {
          id v92 = [v91 dictionaryRepresentation];
          }

          [v85 addObject:v92];
        }
        uint64_t v88 = [v86 countByEnumeratingWithState:&v159 objects:v170 count:16];
      }
      while (v88);
    }

    [v4 setObject:v85 forKey:@"nearbyBSS"];
  }
  if ([*(id *)(a1 + 160) count])
  {
    v93 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 160), "count"));
    long long v155 = 0u;
    long long v156 = 0u;
    long long v157 = 0u;
    long long v158 = 0u;
    id v94 = *(id *)(a1 + 160);
    uint64_t v95 = [v94 countByEnumeratingWithState:&v155 objects:v169 count:16];
    if (v95)
    {
      uint64_t v96 = v95;
      uint64_t v97 = *(void *)v156;
      do
      {
        for (uint64_t k = 0; k != v96; ++k)
        {
          if (*(void *)v156 != v97) {
            objc_enumerationMutation(v94);
          }
          v99 = *(void **)(*((void *)&v155 + 1) + 8 * k);
          if (a2) {
            [v99 jsonRepresentation];
          }
          else {
          id v100 = [v99 dictionaryRepresentation];
          }

          [v93 addObject:v100];
        }
        uint64_t v96 = [v94 countByEnumeratingWithState:&v155 objects:v169 count:16];
      }
      while (v96);
    }

    [v4 setObject:v93 forKey:@"feedback"];
  }
  v101 = [(id)a1 identifier];
  if (v101) {
    [v4 setObject:v101 forKey:@"identifier"];
  }

  if ([*(id *)(a1 + 288) count])
  {
    v102 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 288), "count"));
    long long v151 = 0u;
    long long v152 = 0u;
    long long v153 = 0u;
    long long v154 = 0u;
    id v103 = *(id *)(a1 + 288);
    uint64_t v104 = [v103 countByEnumeratingWithState:&v151 objects:v168 count:16];
    if (v104)
    {
      uint64_t v105 = v104;
      uint64_t v106 = *(void *)v152;
      do
      {
        for (uint64_t m = 0; m != v105; ++m)
        {
          if (*(void *)v152 != v106) {
            objc_enumerationMutation(v103);
          }
          v108 = *(void **)(*((void *)&v151 + 1) + 8 * m);
          if (a2) {
            [v108 jsonRepresentation];
          }
          else {
          id v109 = [v108 dictionaryRepresentation];
          }

          [v102 addObject:v109];
        }
        uint64_t v105 = [v103 countByEnumeratingWithState:&v151 objects:v168 count:16];
      }
      while (v105);
    }

    [v4 setObject:v102 forKey:@"roamStates"];
  }
  if ([*(id *)(a1 + 304) count])
  {
    v110 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 304), "count"));
    long long v147 = 0u;
    long long v148 = 0u;
    long long v149 = 0u;
    long long v150 = 0u;
    id v111 = *(id *)(a1 + 304);
    uint64_t v112 = [v111 countByEnumeratingWithState:&v147 objects:v167 count:16];
    if (v112)
    {
      uint64_t v113 = v112;
      uint64_t v114 = *(void *)v148;
      do
      {
        for (uint64_t n = 0; n != v113; ++n)
        {
          if (*(void *)v148 != v114) {
            objc_enumerationMutation(v111);
          }
          v116 = *(void **)(*((void *)&v147 + 1) + 8 * n);
          if (a2) {
            [v116 jsonRepresentation];
          }
          else {
          id v117 = [v116 dictionaryRepresentation];
          }

          [v110 addObject:v117];
        }
        uint64_t v113 = [v111 countByEnumeratingWithState:&v147 objects:v167 count:16];
      }
      while (v113);
    }

    [v4 setObject:v110 forKey:@"speedTest"];
  }
  uint64_t v118 = *(void *)(a1 + 472);
  if ((v118 & 0x40000000000) != 0)
  {
    v119 = [*(id *)(v5 + 3792) numberWithUnsignedInt:*(unsigned int *)(a1 + 444)];
    [v4 setObject:v119 forKey:@"sslConnectionCount"];

    uint64_t v118 = *(void *)(a1 + 472);
    if ((v118 & 0x80000000000) == 0)
    {
LABEL_199:
      if ((v118 & 0x100000) == 0) {
        goto LABEL_200;
      }
      goto LABEL_205;
    }
  }
  else if ((v118 & 0x80000000000) == 0)
  {
    goto LABEL_199;
  }
  v120 = [*(id *)(v5 + 3792) numberWithUnsignedInt:*(unsigned int *)(a1 + 448)];
  [v4 setObject:v120 forKey:@"sslErrorCount"];

  uint64_t v118 = *(void *)(a1 + 472);
  if ((v118 & 0x100000) == 0)
  {
LABEL_200:
    if ((v118 & 0x10000000) == 0) {
      goto LABEL_201;
    }
LABEL_209:
    uint64_t v123 = *(int *)(a1 + 388);
    if (v123 >= 9)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 388));
      v124 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v124 = off_1E53E9FE0[v123];
    }
    [v4 setObject:v124 forKey:@"clientAssociationSubreason"];

    if ((*(void *)(a1 + 472) & 0x200000000000) == 0) {
      goto LABEL_217;
    }
    goto LABEL_213;
  }
LABEL_205:
  uint64_t v121 = *(int *)(a1 + 356);
  if (v121 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 356));
    v122 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v122 = off_1E53E9FC0[v121];
  }
  [v4 setObject:v122 forKey:@"apMode"];

  uint64_t v118 = *(void *)(a1 + 472);
  if ((v118 & 0x10000000) != 0) {
    goto LABEL_209;
  }
LABEL_201:
  if ((v118 & 0x200000000000) != 0)
  {
LABEL_213:
    uint64_t v125 = *(int *)(a1 + 456);
    if (v125 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 456));
      v126 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v126 = off_1E53EA028[v125];
    }
    [v4 setObject:v126 forKey:@"type"];
  }
LABEL_217:
  v127 = [(id)a1 label];
  v128 = v127;
  if (v127)
  {
    if (a2) {
      [v127 jsonRepresentation];
    }
    else {
    id v129 = [v127 dictionaryRepresentation];
    }

    [v4 setObject:v129 forKey:@"label"];
  }

  v130 = [(id)a1 passpointInfo];
  v131 = v130;
  if (v130)
  {
    if (a2) {
      [v130 jsonRepresentation];
    }
    else {
    id v132 = [v130 dictionaryRepresentation];
    }

    [v4 setObject:v132 forKey:@"passpointInfo"];
  }

  if (*(void *)(a1 + 168))
  {
    v133 = [(id)a1 hotspotHelperProviders];
    [v4 setObject:v133 forKey:@"hotspotHelperProvider"];
  }
  if (*(void *)(a1 + 48))
  {
    v134 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    v135 = (void *)(a1 + 40);
    if (*(void *)(a1 + 48))
    {
      unint64_t v136 = 0;
      do
      {
        uint64_t v137 = *(int *)(*v135 + 4 * v136);
        if (v137 >= 3)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v137);
          v138 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v138 = off_1E53EA040[v137];
        }
        [v134 addObject:v138];

        ++v136;
        v135 = (void *)(a1 + 40);
      }
      while (v136 < *(void *)(a1 + 48));
    }
    [v4 setObject:v134 forKey:@"nameAttributes"];

    unint64_t v5 = 0x1E4F28000uLL;
  }
  if ((*(void *)(a1 + 472) & 0x40000000) != 0)
  {
    uint64_t v139 = *(int *)(a1 + 396);
    if (v139 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 396));
      v140 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v140 = off_1E53EA058[v139];
    }
    [v4 setObject:v140 forKey:@"dohAvailability"];
  }
  v141 = [(id)a1 beaconInfo];
  v142 = v141;
  if (v141)
  {
    if (a2) {
      [v141 jsonRepresentation];
    }
    else {
    id v143 = [v141 dictionaryRepresentation];
    }

    [v4 setObject:v143 forKey:@"beaconInfo"];
  }

  if ((*(void *)(a1 + 472) & 0x8000) != 0)
  {
    v144 = [*(id *)(v5 + 3792) numberWithDouble:*(double *)(a1 + 280)];
    [v4 setObject:v144 forKey:@"responsivenessScore"];
  }
  id v145 = v4;

LABEL_250:

  return v145;
}

- (id)jsonRepresentation
{
  return -[GEOWiFiConnectionQuality _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOWiFiConnectionQuality)initWithDictionary:(id)a3
{
  return (GEOWiFiConnectionQuality *)-[GEOWiFiConnectionQuality _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(char)a3 isJSON:
{
  uint64_t v233 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (!a1) {
    goto LABEL_488;
  }
  id v5 = (id)[a1 init];

  if (!v5)
  {
    a1 = 0;
    goto LABEL_488;
  }
  objc_super v6 = [v4 objectForKeyedSubscript:@"timestamp"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setTimestamp:", objc_msgSend(v6, "unsignedLongLongValue"));
  }

  id v7 = [v4 objectForKeyedSubscript:@"uniqueID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v8 = (void *)[v7 copy];
    [v5 setUniqueID:v8];
  }
  uint64_t v9 = [v4 objectForKeyedSubscript:@"overAllStay"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setOverAllStay:", objc_msgSend(v9, "unsignedLongLongValue"));
  }

  v10 = [v4 objectForKeyedSubscript:@"faultyStay"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setFaultyStay:", objc_msgSend(v10, "unsignedLongLongValue"));
  }

  v11 = [v4 objectForKeyedSubscript:@"lowLQMStay"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setLowLQMStay:", objc_msgSend(v11, "unsignedLongLongValue"));
  }

  v12 = [v4 objectForKeyedSubscript:@"lowqStay"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setLowqStay:", objc_msgSend(v12, "unsignedLongLongValue"));
  }

  v13 = [v4 objectForKeyedSubscript:@"lqmTranCount"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setLqmTranCount:", objc_msgSend(v13, "unsignedLongLongValue"));
  }

  v14 = [v4 objectForKeyedSubscript:@"successfulConnections"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setSuccessfulConnections:", objc_msgSend(v14, "unsignedLongLongValue"));
  }

  v15 = [v4 objectForKeyedSubscript:@"failedConnections"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setFailedConnections:", objc_msgSend(v15, "unsignedLongLongValue"));
  }

  v16 = [v4 objectForKeyedSubscript:@"packetsIn"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setPacketsIn:", objc_msgSend(v16, "unsignedLongLongValue"));
  }

  v17 = [v4 objectForKeyedSubscript:@"packetsOut"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setPacketsOut:", objc_msgSend(v17, "unsignedLongLongValue"));
  }

  v18 = [v4 objectForKeyedSubscript:@"bytesInTotal"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setBytesInTotal:", objc_msgSend(v18, "unsignedLongLongValue"));
  }

  v19 = [v4 objectForKeyedSubscript:@"bytesOutTotal"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setBytesOutTotal:", objc_msgSend(v19, "unsignedLongLongValue"));
  }

  v20 = [v4 objectForKeyedSubscript:@"bytesInActive"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setBytesInActive:", objc_msgSend(v20, "unsignedLongLongValue"));
  }

  v21 = [v4 objectForKeyedSubscript:@"bytesOutActive"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setBytesOutActive:", objc_msgSend(v21, "unsignedLongLongValue"));
  }

  v22 = [v4 objectForKeyedSubscript:@"reTxBytes"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setReTxBytes:", objc_msgSend(v22, "unsignedLongLongValue"));
  }

  v23 = [v4 objectForKeyedSubscript:@"dataStalls"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setDataStalls:", objc_msgSend(v23, "unsignedLongLongValue"));
  }

  v24 = [v4 objectForKeyedSubscript:@"receivedDupes"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setReceivedDupes:", objc_msgSend(v24, "unsignedLongLongValue"));
  }

  v25 = [v4 objectForKeyedSubscript:@"rxOutOfOrderBytes"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setRxOutOfOrderBytes:", objc_msgSend(v25, "unsignedLongLongValue"));
  }

  v26 = [v4 objectForKeyedSubscript:@"roundTripTimeMin"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v26 floatValue];
    objc_msgSend(v5, "setRoundTripTimeMin:");
  }

  v27 = [v4 objectForKeyedSubscript:@"roundTripTimeAvg"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v27 floatValue];
    objc_msgSend(v5, "setRoundTripTimeAvg:");
  }

  v28 = [v4 objectForKeyedSubscript:@"roundTripTimeVar"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v28 floatValue];
    objc_msgSend(v5, "setRoundTripTimeVar:");
  }

  v29 = [v4 objectForKeyedSubscript:@"roundTripTimeMinActive"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v29 floatValue];
    objc_msgSend(v5, "setRoundTripTimeMinActive:");
  }

  v30 = [v4 objectForKeyedSubscript:@"roundTripTimeAvgActive"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v30 floatValue];
    objc_msgSend(v5, "setRoundTripTimeAvgActive:");
  }

  v31 = [v4 objectForKeyedSubscript:@"roundTripTimeVarActive"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v31 floatValue];
    objc_msgSend(v5, "setRoundTripTimeVarActive:");
  }

  v32 = [v4 objectForKeyedSubscript:@"hotspot20"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setHotspot20:", objc_msgSend(v32, "BOOLValue"));
  }

  v33 = [v4 objectForKeyedSubscript:@"band"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setBand:", objc_msgSend(v33, "unsignedIntValue"));
  }

  v34 = [v4 objectForKeyedSubscript:@"channel"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setChannel:", objc_msgSend(v34, "unsignedIntValue"));
  }

  v35 = [v4 objectForKeyedSubscript:@"channelWidth"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setChannelWidth:", objc_msgSend(v35, "unsignedIntValue"));
  }

  v36 = [v4 objectForKeyedSubscript:@"rssi"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setRssi:", objc_msgSend(v36, "intValue"));
  }

  v37 = [v4 objectForKeyedSubscript:@"snr"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setSnr:", objc_msgSend(v37, "intValue"));
  }

  v38 = [v4 objectForKeyedSubscript:@"cca"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setCca:", objc_msgSend(v38, "intValue"));
  }

  v39 = [v4 objectForKeyedSubscript:@"phyMode"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setPhyMode:", objc_msgSend(v39, "unsignedIntValue"));
  }

  v40 = [v4 objectForKeyedSubscript:@"timeOfDay"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setTimeOfDay:", objc_msgSend(v40, "unsignedLongLongValue"));
  }

  v41 = [v4 objectForKeyedSubscript:@"location"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v42 = [GEOLocation alloc];
    if (a3) {
      uint64_t v43 = [(GEOLocation *)v42 initWithJSON:v41];
    }
    else {
      uint64_t v43 = [(GEOLocation *)v42 initWithDictionary:v41];
    }
    id v44 = (void *)v43;
    [v5 setLocation:v43];
  }
  double v45 = [v4 objectForKeyedSubscript:@"wasCaptiveFlag"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setWasCaptiveFlag:", objc_msgSend(v45, "unsignedIntValue"));
  }

  uint64_t v46 = [v4 objectForKeyedSubscript:@"networkType"];
  objc_opt_class();
  id v186 = v4;
  if (objc_opt_isKindOfClass())
  {
    id v47 = v46;
    if ([v47 isEqualToString:@"UNKNOWN_NETWORK_TYPE"])
    {
      uint64_t v48 = 0;
    }
    else if ([v47 isEqualToString:@"PRIVATE_NETWORK_TYPE"])
    {
      uint64_t v48 = 1;
    }
    else if ([v47 isEqualToString:@"PRIVATE_WITH_GUEST_ACCESS_NETWORK_TYPE"])
    {
      uint64_t v48 = 2;
    }
    else if ([v47 isEqualToString:@"CHARGEABLE_PUBLIC_NETWORK_TYPE"])
    {
      uint64_t v48 = 3;
    }
    else if ([v47 isEqualToString:@"FREE_PUBLIC_NETWORK_TYPE"])
    {
      uint64_t v48 = 4;
    }
    else if ([v47 isEqualToString:@"PERSONAL_DEVICE_NETWORK_TYPE"])
    {
      uint64_t v48 = 5;
    }
    else if ([v47 isEqualToString:@"EMERGENCY_SERVICE_ONLY_NETWORK_TYPE"])
    {
      uint64_t v48 = 6;
    }
    else if ([v47 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_1"])
    {
      uint64_t v48 = 7;
    }
    else if ([v47 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_2"])
    {
      uint64_t v48 = 8;
    }
    else if ([v47 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_3"])
    {
      uint64_t v48 = 9;
    }
    else if ([v47 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_4"])
    {
      uint64_t v48 = 10;
    }
    else if ([v47 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_5"])
    {
      uint64_t v48 = 11;
    }
    else if ([v47 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_6"])
    {
      uint64_t v48 = 12;
    }
    else if ([v47 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_7"])
    {
      uint64_t v48 = 13;
    }
    else if ([v47 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_8"])
    {
      uint64_t v48 = 14;
    }
    else if ([v47 isEqualToString:@"TEST_OR_EXPERIMENTAL_NETWORK_TYPE"])
    {
      uint64_t v48 = 15;
    }
    else if ([v47 isEqualToString:@"WILDCARD_NETWORK_TYPE"])
    {
      uint64_t v48 = 16;
    }
    else
    {
      uint64_t v48 = 0;
    }

    goto LABEL_118;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v48 = [v46 intValue];
LABEL_118:
    [v5 setNetworkType:v48];
  }

  v49 = [v4 objectForKeyedSubscript:@"traits"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_146;
  }
  long long v222 = 0u;
  long long v223 = 0u;
  long long v220 = 0u;
  long long v221 = 0u;
  v184 = v49;
  id v50 = v49;
  uint64_t v51 = [v50 countByEnumeratingWithState:&v220 objects:v232 count:16];
  if (!v51) {
    goto LABEL_145;
  }
  uint64_t v52 = v51;
  uint64_t v53 = *(void *)v221;
  do
  {
    for (uint64_t i = 0; i != v52; ++i)
    {
      if (*(void *)v221 != v53) {
        objc_enumerationMutation(v50);
      }
      uint64_t v55 = *(void **)(*((void *)&v220 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v56 = v55;
        if ([v56 isEqualToString:@"UNKNOWN_CONNECTION_TRAIT"])
        {
          uint64_t v57 = 0;
        }
        else if ([v56 isEqualToString:@"MOVING_CONNECTION_TRAIT"])
        {
          uint64_t v57 = 1;
        }
        else if ([v56 isEqualToString:@"OMNI_PRESENT_CONNECTION_TRAIT"])
        {
          uint64_t v57 = 2;
        }
        else if ([v56 isEqualToString:@"IS_SECURED_TRAIT"])
        {
          uint64_t v57 = 3;
        }
        else if ([v56 isEqualToString:@"TCP_GOOD_CONNECTION_TRAIT"])
        {
          uint64_t v57 = 4;
        }
        else if ([v56 isEqualToString:@"LONG_TERM_NETWORK_CONNECTION_TRAIT"])
        {
          uint64_t v57 = 5;
        }
        else
        {
          uint64_t v57 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          continue;
        }
        uint64_t v57 = [v55 intValue];
      }
      [v5 addTraits:v57];
    }
    uint64_t v52 = [v50 countByEnumeratingWithState:&v220 objects:v232 count:16];
  }
  while (v52);
LABEL_145:

  v49 = v184;
  id v4 = v186;
LABEL_146:

  uint64_t v58 = [v4 objectForKeyedSubscript:@"captiveDetermination"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v59 = v58;
    if ([v59 isEqualToString:@"UNKNOWN_CAPTIVE_DETERMINATION"])
    {
      uint64_t v60 = 0;
    }
    else if ([v59 isEqualToString:@"NOT_CAPTIVE"])
    {
      uint64_t v60 = 1;
    }
    else if ([v59 isEqualToString:@"IS_CAPTIVE"])
    {
      uint64_t v60 = 2;
    }
    else
    {
      uint64_t v60 = 0;
    }

LABEL_157:
    [v5 setCaptiveDetermination:v60];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v60 = [v58 intValue];
      goto LABEL_157;
    }
  }

  v61 = [v4 objectForKeyedSubscript:@"associationLength"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v62 = v61;
    if ([v62 isEqualToString:@"UNKNOWN_ASSOCIATION_TIME_BUCKET"])
    {
      uint64_t v63 = 0;
    }
    else if ([v62 isEqualToString:@"TIME_BUCKET_LT_ONE_MIN"])
    {
      uint64_t v63 = 1;
    }
    else if ([v62 isEqualToString:@"TIME_BUCKET_LT_FIVE_MIN"])
    {
      uint64_t v63 = 2;
    }
    else if ([v62 isEqualToString:@"TIME_BUCKET_LT_TWENTY_MIN"])
    {
      uint64_t v63 = 3;
    }
    else if ([v62 isEqualToString:@"TIME_BUCKET_LT_ONE_HOUR"])
    {
      uint64_t v63 = 4;
    }
    else if ([v62 isEqualToString:@"TIME_BUCKET_GT_ONE_HOUR"])
    {
      uint64_t v63 = 5;
    }
    else
    {
      uint64_t v63 = 0;
    }

LABEL_175:
    [v5 setAssociationLength:v63];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v63 = [v61 intValue];
      goto LABEL_175;
    }
  }

  v64 = [v4 objectForKeyedSubscript:@"authTraits"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_201;
  }
  long long v218 = 0u;
  long long v219 = 0u;
  long long v216 = 0u;
  long long v217 = 0u;
  id v65 = v64;
  uint64_t v66 = [v65 countByEnumeratingWithState:&v216 objects:v231 count:16];
  if (!v66) {
    goto LABEL_200;
  }
  uint64_t v67 = v66;
  uint64_t v68 = *(void *)v217;
  while (2)
  {
    uint64_t v69 = 0;
    while (2)
    {
      if (*(void *)v217 != v68) {
        objc_enumerationMutation(v65);
      }
      v70 = *(void **)(*((void *)&v216 + 1) + 8 * v69);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v71 = v70;
        if ([v71 isEqualToString:@"UNKNOWN_AUTH_TRAIT"])
        {
          uint64_t v72 = 0;
        }
        else if ([v71 isEqualToString:@"OPEN"])
        {
          uint64_t v72 = 1;
        }
        else if ([v71 isEqualToString:@"WEP"])
        {
          uint64_t v72 = 2;
        }
        else if ([v71 isEqualToString:@"WPA"])
        {
          uint64_t v72 = 3;
        }
        else if ([v71 isEqualToString:@"EAP"])
        {
          uint64_t v72 = 4;
        }
        else
        {
          uint64_t v72 = 0;
        }

LABEL_197:
        [v5 addAuthTraits:v72];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v72 = [v70 intValue];
          goto LABEL_197;
        }
      }
      if (v67 != ++v69) {
        continue;
      }
      break;
    }
    uint64_t v67 = [v65 countByEnumeratingWithState:&v216 objects:v231 count:16];
    if (v67) {
      continue;
    }
    break;
  }
LABEL_200:

  id v4 = v186;
LABEL_201:

  uint64_t v73 = [v4 objectForKeyedSubscript:@"networkOrigin"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v74 = v73;
    if ([v74 isEqualToString:@"UNKNOWN_ORIGINATOR_TYPE"])
    {
      uint64_t v75 = 0;
    }
    else if ([v74 isEqualToString:@"USER"])
    {
      uint64_t v75 = 1;
    }
    else if ([v74 isEqualToString:@"APP"])
    {
      uint64_t v75 = 2;
    }
    else if ([v74 isEqualToString:@"CARRIER"])
    {
      uint64_t v75 = 3;
    }
    else
    {
      uint64_t v75 = 0;
    }

LABEL_214:
    [v5 setNetworkOrigin:v75];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v75 = [v73 intValue];
      goto LABEL_214;
    }
  }

  v76 = [v4 objectForKeyedSubscript:@"topDLRate"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v76 floatValue];
    objc_msgSend(v5, "setTopDLRate:");
  }

  v77 = [v4 objectForKeyedSubscript:@"lowInternetUL"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setLowInternetUL:", objc_msgSend(v77, "BOOLValue"));
  }

  id v78 = [v4 objectForKeyedSubscript:@"lowInternetDL"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setLowInternetDL:", objc_msgSend(v78, "BOOLValue"));
  }

  uint64_t v79 = [v4 objectForKeyedSubscript:@"isKnownGood"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setIsKnownGood:", objc_msgSend(v79, "BOOLValue"));
  }

  uint64_t v80 = [v4 objectForKeyedSubscript:@"isEdgeBSS"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setIsEdgeBSS:", objc_msgSend(v80, "BOOLValue"));
  }

  uint64_t v81 = [v4 objectForKeyedSubscript:@"associationReason"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v82 = v81;
    if ([v82 isEqualToString:@"UNKNOWN_ASSOCIATION_TYPE"])
    {
      uint64_t v83 = 0;
    }
    else if ([v82 isEqualToString:@"AUTOMATIC"])
    {
      uint64_t v83 = 1;
    }
    else if ([v82 isEqualToString:@"CLIENT"])
    {
      uint64_t v83 = 2;
    }
    else if ([v82 isEqualToString:@"ROAM"])
    {
      uint64_t v83 = 3;
    }
    else
    {
      uint64_t v83 = 0;
    }

LABEL_238:
    [v5 setAssociationReason:v83];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v83 = [v81 intValue];
      goto LABEL_238;
    }
  }

  id v84 = [v4 objectForKeyedSubscript:@"disassociationReason"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v85 = v84;
    if ([v85 isEqualToString:@"UNKNOWN_DISASSOCIATION_TYPE"])
    {
      uint64_t v86 = 0;
    }
    else if ([v85 isEqualToString:@"DEAUTH"])
    {
      uint64_t v86 = 1;
    }
    else if ([v85 isEqualToString:@"BEACON_LOSS"])
    {
      uint64_t v86 = 2;
    }
    else if ([v85 isEqualToString:@"INTERNAL_ERROR"])
    {
      uint64_t v86 = 3;
    }
    else if ([v85 isEqualToString:@"PWR_SAVE"])
    {
      uint64_t v86 = 4;
    }
    else if ([v85 isEqualToString:@"USR_PWROFF"])
    {
      uint64_t v86 = 5;
    }
    else if ([v85 isEqualToString:@"TRIGGER_DISC"])
    {
      uint64_t v86 = 6;
    }
    else if ([v85 isEqualToString:@"TEMP_DISABLE"])
    {
      uint64_t v86 = 7;
    }
    else if ([v85 isEqualToString:@"CLIENT_DISC"])
    {
      uint64_t v86 = 8;
    }
    else if ([v85 isEqualToString:@"SET_NETWORK"])
    {
      uint64_t v86 = 9;
    }
    else if ([v85 isEqualToString:@"DECRYPTION_FAILURE"])
    {
      uint64_t v86 = 10;
    }
    else if ([v85 isEqualToString:@"PRIMARY_INT_FAILURE"])
    {
      uint64_t v86 = 11;
    }
    else
    {
      if ([v85 isEqualToString:@"PPM_RESTRICTION"])
      {
        uint64_t v86 = 12;
      }
      else if ([v85 isEqualToString:@"MIS_ENABLED"])
      {
        uint64_t v86 = 13;
      }
      else if ([v85 isEqualToString:@"USR_PREFERENCE"])
      {
        uint64_t v86 = 14;
      }
      else if ([v85 isEqualToString:@"MISC_REASON"])
      {
        uint64_t v86 = 15;
      }
      else if ([v85 isEqualToString:@"EAP_RESTART"])
      {
        uint64_t v86 = 16;
      }
      else if ([v85 isEqualToString:@"USER_FORCED"])
      {
        uint64_t v86 = 17;
      }
      else if ([v85 isEqualToString:@"EAP_FAILURE"])
      {
        uint64_t v86 = 18;
      }
      else if ([v85 isEqualToString:@"NET_TRANSITION"])
      {
        uint64_t v86 = 19;
      }
      else if ([v85 isEqualToString:@"AUTO_UNLOCK"])
      {
        uint64_t v86 = 20;
      }
      else if ([v85 isEqualToString:@"CAPTIVE"])
      {
        uint64_t v86 = 21;
      }
      else if ([v85 isEqualToString:@"USER_NOTIFICATION"])
      {
        uint64_t v86 = 22;
      }
      else if ([v85 isEqualToString:@"P2P_BSS_STEERING"])
      {
        uint64_t v86 = 23;
      }
      else if ([v85 isEqualToString:@"AUTO_HS"])
      {
        uint64_t v86 = 24;
      }
      else if ([v85 isEqualToString:@"AUTO_HS_TRANSITION"])
      {
        uint64_t v86 = 25;
      }
      else if ([v85 isEqualToString:@"ROAM_FOR_PERF"])
      {
        uint64_t v86 = 26;
      }
      else
      {
        uint64_t v86 = 0;
      }
      id v4 = v186;
    }

LABEL_299:
    [v5 setDisassociationReason:v86];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v86 = [v84 intValue];
      goto LABEL_299;
    }
  }

  uint64_t v87 = [v4 objectForKeyedSubscript:@"essMembers"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v214 = 0u;
    long long v215 = 0u;
    long long v212 = 0u;
    long long v213 = 0u;
    id v88 = v87;
    uint64_t v89 = [v88 countByEnumeratingWithState:&v212 objects:v230 count:16];
    if (v89)
    {
      uint64_t v90 = v89;
      uint64_t v91 = *(void *)v213;
      do
      {
        for (uint64_t j = 0; j != v90; ++j)
        {
          if (*(void *)v213 != v91) {
            objc_enumerationMutation(v88);
          }
          uint64_t v93 = *(void *)(*((void *)&v212 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v94 = [GEOWiFiAP alloc];
            if (a3) {
              uint64_t v95 = [(GEOWiFiAP *)v94 initWithJSON:v93];
            }
            else {
              uint64_t v95 = [(GEOWiFiAP *)v94 initWithDictionary:v93];
            }
            uint64_t v96 = (void *)v95;
            [v5 addEssMembers:v95];
          }
        }
        uint64_t v90 = [v88 countByEnumeratingWithState:&v212 objects:v230 count:16];
      }
      while (v90);
    }

    id v4 = v186;
  }

  uint64_t v97 = [v4 objectForKeyedSubscript:@"nearbyBSS"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v210 = 0u;
    long long v211 = 0u;
    long long v208 = 0u;
    long long v209 = 0u;
    id v98 = v97;
    uint64_t v99 = [v98 countByEnumeratingWithState:&v208 objects:v229 count:16];
    if (v99)
    {
      uint64_t v100 = v99;
      uint64_t v101 = *(void *)v209;
      do
      {
        for (uint64_t k = 0; k != v100; ++k)
        {
          if (*(void *)v209 != v101) {
            objc_enumerationMutation(v98);
          }
          uint64_t v103 = *(void *)(*((void *)&v208 + 1) + 8 * k);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v104 = [GEOWiFiAP alloc];
            if (a3) {
              uint64_t v105 = [(GEOWiFiAP *)v104 initWithJSON:v103];
            }
            else {
              uint64_t v105 = [(GEOWiFiAP *)v104 initWithDictionary:v103];
            }
            uint64_t v106 = (void *)v105;
            [v5 addNearbyBSS:v105];
          }
        }
        uint64_t v100 = [v98 countByEnumeratingWithState:&v208 objects:v229 count:16];
      }
      while (v100);
    }

    id v4 = v186;
  }

  v107 = [v4 objectForKeyedSubscript:@"feedback"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v206 = 0u;
    long long v207 = 0u;
    long long v204 = 0u;
    long long v205 = 0u;
    id v108 = v107;
    uint64_t v109 = [v108 countByEnumeratingWithState:&v204 objects:v228 count:16];
    if (v109)
    {
      uint64_t v110 = v109;
      uint64_t v111 = *(void *)v205;
      do
      {
        for (uint64_t m = 0; m != v110; ++m)
        {
          if (*(void *)v205 != v111) {
            objc_enumerationMutation(v108);
          }
          uint64_t v113 = *(void *)(*((void *)&v204 + 1) + 8 * m);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v114 = [GEOWiFiQualityFeedback alloc];
            if (a3) {
              uint64_t v115 = [(GEOWiFiQualityFeedback *)v114 initWithJSON:v113];
            }
            else {
              uint64_t v115 = [(GEOWiFiQualityFeedback *)v114 initWithDictionary:v113];
            }
            v116 = (void *)v115;
            [v5 addFeedback:v115];
          }
        }
        uint64_t v110 = [v108 countByEnumeratingWithState:&v204 objects:v228 count:16];
      }
      while (v110);
    }

    id v4 = v186;
  }

  id v117 = [v4 objectForKeyedSubscript:@"identifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v118 = (void *)[v117 copy];
    [v5 setIdentifier:v118];
  }
  v119 = [v4 objectForKeyedSubscript:@"roamStates"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v202 = 0u;
    long long v203 = 0u;
    long long v200 = 0u;
    long long v201 = 0u;
    id v120 = v119;
    uint64_t v121 = [v120 countByEnumeratingWithState:&v200 objects:v227 count:16];
    if (v121)
    {
      uint64_t v122 = v121;
      uint64_t v123 = *(void *)v201;
      do
      {
        for (uint64_t n = 0; n != v122; ++n)
        {
          if (*(void *)v201 != v123) {
            objc_enumerationMutation(v120);
          }
          uint64_t v125 = *(void *)(*((void *)&v200 + 1) + 8 * n);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v126 = [GEOWiFiConnectionRoamState alloc];
            if (a3) {
              uint64_t v127 = [(GEOWiFiConnectionRoamState *)v126 initWithJSON:v125];
            }
            else {
              uint64_t v127 = [(GEOWiFiConnectionRoamState *)v126 initWithDictionary:v125];
            }
            v128 = (void *)v127;
            [v5 addRoamStates:v127];
          }
        }
        uint64_t v122 = [v120 countByEnumeratingWithState:&v200 objects:v227 count:16];
      }
      while (v122);
    }

    id v4 = v186;
  }

  id v129 = [v4 objectForKeyedSubscript:@"speedTest"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v198 = 0u;
    long long v199 = 0u;
    long long v196 = 0u;
    long long v197 = 0u;
    id v130 = v129;
    uint64_t v131 = [v130 countByEnumeratingWithState:&v196 objects:v226 count:16];
    if (v131)
    {
      uint64_t v132 = v131;
      uint64_t v133 = *(void *)v197;
      do
      {
        for (iuint64_t i = 0; ii != v132; ++ii)
        {
          if (*(void *)v197 != v133) {
            objc_enumerationMutation(v130);
          }
          uint64_t v135 = *(void *)(*((void *)&v196 + 1) + 8 * ii);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            unint64_t v136 = [GEOWiFiConnectionSpeedTest alloc];
            if (a3) {
              uint64_t v137 = [(GEOWiFiConnectionSpeedTest *)v136 initWithJSON:v135];
            }
            else {
              uint64_t v137 = [(GEOWiFiConnectionSpeedTest *)v136 initWithDictionary:v135];
            }
            v138 = (void *)v137;
            [v5 addSpeedTest:v137];
          }
        }
        uint64_t v132 = [v130 countByEnumeratingWithState:&v196 objects:v226 count:16];
      }
      while (v132);
    }

    id v4 = v186;
  }

  uint64_t v139 = [v4 objectForKeyedSubscript:@"sslConnectionCount"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setSslConnectionCount:", objc_msgSend(v139, "unsignedIntValue"));
  }

  v140 = [v4 objectForKeyedSubscript:@"sslErrorCount"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setSslErrorCount:", objc_msgSend(v140, "unsignedIntValue"));
  }

  v141 = [v4 objectForKeyedSubscript:@"apMode"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v142 = v141;
    if ([v142 isEqualToString:@"UNKNOWN_AP_MODE"])
    {
      uint64_t v143 = 0;
    }
    else if ([v142 isEqualToString:@"IBSS"])
    {
      uint64_t v143 = 1;
    }
    else if ([v142 isEqualToString:@"INFRA"])
    {
      uint64_t v143 = 2;
    }
    else if ([v142 isEqualToString:@"ANY"])
    {
      uint64_t v143 = 3;
    }
    else
    {
      uint64_t v143 = 0;
    }

LABEL_389:
    [v5 setApMode:v143];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v143 = [v141 intValue];
      goto LABEL_389;
    }
  }

  v144 = [v4 objectForKeyedSubscript:@"clientAssociationSubreason"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v145 = v144;
    if ([v145 isEqualToString:@"UNKNOWN_SUBREASON_TYPE"])
    {
      uint64_t v146 = 0;
    }
    else if ([v145 isEqualToString:@"SETTINGS"])
    {
      uint64_t v146 = 1;
    }
    else if ([v145 isEqualToString:@"SETUP"])
    {
      uint64_t v146 = 2;
    }
    else if ([v145 isEqualToString:@"CONTROL_CENTER"])
    {
      uint64_t v146 = 3;
    }
    else if ([v145 isEqualToString:@"RECOMMENDATION"])
    {
      uint64_t v146 = 4;
    }
    else if ([v145 isEqualToString:@"QR"])
    {
      uint64_t v146 = 5;
    }
    else if ([v145 isEqualToString:@"ATJ"])
    {
      uint64_t v146 = 6;
    }
    else if ([v145 isEqualToString:@"APPLICATION"])
    {
      uint64_t v146 = 7;
    }
    else if ([v145 isEqualToString:@"WALLET"])
    {
      uint64_t v146 = 8;
    }
    else
    {
      uint64_t v146 = 0;
    }

LABEL_413:
    [v5 setClientAssociationSubreason:v146];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v146 = [v144 intValue];
      goto LABEL_413;
    }
  }

  long long v147 = [v4 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v148 = v147;
    if ([v148 isEqualToString:@"UNKNOWN_HARVEST_TYPE"])
    {
      uint64_t v149 = 0;
    }
    else if ([v148 isEqualToString:@"CONNECTION"])
    {
      uint64_t v149 = 1;
    }
    else if ([v148 isEqualToString:@"LABEL"])
    {
      uint64_t v149 = 2;
    }
    else
    {
      uint64_t v149 = 0;
    }

LABEL_425:
    [v5 setType:v149];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v149 = [v147 intValue];
      goto LABEL_425;
    }
  }

  long long v150 = [v4 objectForKeyedSubscript:@"label"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v151 = [GEOWiFiHarvestLabel alloc];
    if (a3) {
      uint64_t v152 = [(GEOWiFiHarvestLabel *)v151 initWithJSON:v150];
    }
    else {
      uint64_t v152 = [(GEOWiFiHarvestLabel *)v151 initWithDictionary:v150];
    }
    long long v153 = (void *)v152;
    [v5 setLabel:v152];
  }
  long long v154 = [v4 objectForKeyedSubscript:@"passpointInfo"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v155 = [GEOWiFiPasspointInfo alloc];
    if (a3) {
      uint64_t v156 = [(GEOWiFiPasspointInfo *)v155 initWithJSON:v154];
    }
    else {
      uint64_t v156 = [(GEOWiFiPasspointInfo *)v155 initWithDictionary:v154];
    }
    long long v157 = (void *)v156;
    [v5 setPasspointInfo:v156];
  }
  long long v158 = [v4 objectForKeyedSubscript:@"hotspotHelperProvider"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v194 = 0u;
    long long v195 = 0u;
    long long v192 = 0u;
    long long v193 = 0u;
    id v159 = v158;
    uint64_t v160 = [v159 countByEnumeratingWithState:&v192 objects:v225 count:16];
    if (v160)
    {
      uint64_t v161 = v160;
      uint64_t v162 = *(void *)v193;
      do
      {
        for (juint64_t j = 0; jj != v161; ++jj)
        {
          if (*(void *)v193 != v162) {
            objc_enumerationMutation(v159);
          }
          long long v164 = *(void **)(*((void *)&v192 + 1) + 8 * jj);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v165 = (void *)[v164 copy];
            [v5 addHotspotHelperProvider:v165];
          }
        }
        uint64_t v161 = [v159 countByEnumeratingWithState:&v192 objects:v225 count:16];
      }
      while (v161);
    }
  }
  long long v166 = [v4 objectForKeyedSubscript:@"nameAttributes"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v190 = 0u;
    long long v191 = 0u;
    long long v188 = 0u;
    long long v189 = 0u;
    v185 = v166;
    id v167 = v166;
    uint64_t v168 = [v167 countByEnumeratingWithState:&v188 objects:v224 count:16];
    if (!v168) {
      goto LABEL_467;
    }
    uint64_t v169 = v168;
    uint64_t v170 = *(void *)v189;
    while (1)
    {
      for (kuint64_t k = 0; kk != v169; ++kk)
      {
        if (*(void *)v189 != v170) {
          objc_enumerationMutation(v167);
        }
        uint64_t v172 = *(void **)(*((void *)&v188 + 1) + 8 * kk);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v173 = v172;
          if ([v173 isEqualToString:@"NONE"])
          {
            uint64_t v174 = 0;
          }
          else if ([v173 isEqualToString:@"INDICATES_NOT_PUBLIC"])
          {
            uint64_t v174 = 1;
          }
          else if ([v173 isEqualToString:@"INDICATES_PUBLIC"])
          {
            uint64_t v174 = 2;
          }
          else
          {
            uint64_t v174 = 0;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          uint64_t v174 = [v172 intValue];
        }
        [v5 addNameAttributes:v174];
      }
      uint64_t v169 = [v167 countByEnumeratingWithState:&v188 objects:v224 count:16];
      if (!v169)
      {
LABEL_467:

        long long v166 = v185;
        id v4 = v186;
        break;
      }
    }
  }

  v175 = [v4 objectForKeyedSubscript:@"dohAvailability"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v176 = v175;
    if ([v176 isEqualToString:@"UNKNOWN_DNS_AVAILABILITY"])
    {
      uint64_t v177 = 0;
    }
    else if ([v176 isEqualToString:@"DOH_PERMITTED"])
    {
      uint64_t v177 = 1;
    }
    else if ([v176 isEqualToString:@"DOH_BLOCKED"])
    {
      uint64_t v177 = 2;
    }
    else
    {
      uint64_t v177 = 0;
    }

LABEL_479:
    [v5 setDohAvailability:v177];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v177 = [v175 intValue];
      goto LABEL_479;
    }
  }

  v178 = [v4 objectForKeyedSubscript:@"beaconInfo"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v179 = [GEOWiFiBeaconInfo alloc];
    if (a3) {
      uint64_t v180 = [(GEOWiFiBeaconInfo *)v179 initWithJSON:v178];
    }
    else {
      uint64_t v180 = [(GEOWiFiBeaconInfo *)v179 initWithDictionary:v178];
    }
    v181 = (void *)v180;
    [v5 setBeaconInfo:v180];
  }
  v182 = [v4 objectForKeyedSubscript:@"responsivenessScore"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v182 doubleValue];
    objc_msgSend(v5, "setResponsivenessScore:");
  }

  a1 = v5;
LABEL_488:

  return a1;
}

- (GEOWiFiConnectionQuality)initWithJSON:(id)a3
{
  return (GEOWiFiConnectionQuality *)-[GEOWiFiConnectionQuality _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      double v8 = (int *)&readAll__recursiveTag_404;
    }
    else {
      double v8 = (int *)&readAll__nonRecursiveTag_405;
    }
    GEOWiFiConnectionQualityReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOWiFiConnectionQualityCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWiFiConnectionQualityIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWiFiConnectionQualityReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEOWiFiConnectionQualityIsDirty((uint64_t)self))
  {
    v40 = self->_reader;
    objc_sync_enter(v40);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v41 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v41];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v40);
    goto LABEL_173;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOWiFiConnectionQuality *)self readAll:0];
  if ((*(void *)&self->_flags & 0x80000) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_uniqueID) {
    PBDataWriterWriteStringField();
  }
  p_uint64_t flags = &self->_flags;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x400) != 0)
  {
    PBDataWriterWriteUint64Field();
    uint64_t flags = *(void *)p_flags;
    if ((*(void *)p_flags & 0x40) == 0)
    {
LABEL_9:
      if ((flags & 0x80) == 0) {
        goto LABEL_10;
      }
      goto LABEL_134;
    }
  }
  else if ((flags & 0x40) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteUint64Field();
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_10:
    if ((flags & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_135;
  }
LABEL_134:
  PBDataWriterWriteUint64Field();
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x100) == 0)
  {
LABEL_11:
    if ((flags & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_136;
  }
LABEL_135:
  PBDataWriterWriteUint64Field();
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x200) == 0)
  {
LABEL_12:
    if ((flags & 0x20000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_137;
  }
LABEL_136:
  PBDataWriterWriteUint64Field();
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x20000) == 0)
  {
LABEL_13:
    if ((flags & 0x20) == 0) {
      goto LABEL_14;
    }
    goto LABEL_138;
  }
LABEL_137:
  PBDataWriterWriteUint64Field();
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_14:
    if ((flags & 0x800) == 0) {
      goto LABEL_15;
    }
    goto LABEL_139;
  }
LABEL_138:
  PBDataWriterWriteUint64Field();
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x800) == 0)
  {
LABEL_15:
    if ((flags & 0x1000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_140;
  }
LABEL_139:
  PBDataWriterWriteUint64Field();
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x1000) == 0)
  {
LABEL_16:
    if ((flags & 2) == 0) {
      goto LABEL_17;
    }
    goto LABEL_141;
  }
LABEL_140:
  PBDataWriterWriteUint64Field();
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_17:
    if ((flags & 8) == 0) {
      goto LABEL_18;
    }
    goto LABEL_142;
  }
LABEL_141:
  PBDataWriterWriteUint64Field();
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_18:
    if ((flags & 1) == 0) {
      goto LABEL_19;
    }
    goto LABEL_143;
  }
LABEL_142:
  PBDataWriterWriteUint64Field();
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_19:
    if ((flags & 4) == 0) {
      goto LABEL_20;
    }
    goto LABEL_144;
  }
LABEL_143:
  PBDataWriterWriteUint64Field();
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_20:
    if ((flags & 0x2000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_145;
  }
LABEL_144:
  PBDataWriterWriteUint64Field();
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x2000) == 0)
  {
LABEL_21:
    if ((flags & 0x10) == 0) {
      goto LABEL_22;
    }
    goto LABEL_146;
  }
LABEL_145:
  PBDataWriterWriteUint64Field();
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_22:
    if ((flags & 0x4000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_147;
  }
LABEL_146:
  PBDataWriterWriteUint64Field();
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x4000) == 0)
  {
LABEL_23:
    if ((flags & 0x10000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_148;
  }
LABEL_147:
  PBDataWriterWriteUint64Field();
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x10000) == 0)
  {
LABEL_24:
    if ((flags & 0x2000000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_149;
  }
LABEL_148:
  PBDataWriterWriteUint64Field();
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x2000000000) == 0)
  {
LABEL_25:
    if ((flags & 0x800000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_150;
  }
LABEL_149:
  PBDataWriterWriteFloatField();
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x800000000) == 0)
  {
LABEL_26:
    if ((flags & 0x8000000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_151;
  }
LABEL_150:
  PBDataWriterWriteFloatField();
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x8000000000) == 0)
  {
LABEL_27:
    if ((flags & 0x1000000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_152;
  }
LABEL_151:
  PBDataWriterWriteFloatField();
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x1000000000) == 0)
  {
LABEL_28:
    if ((flags & 0x400000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_153;
  }
LABEL_152:
  PBDataWriterWriteFloatField();
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x400000000) == 0)
  {
LABEL_29:
    if ((flags & 0x4000000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_154;
  }
LABEL_153:
  PBDataWriterWriteFloatField();
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x4000000000) == 0)
  {
LABEL_30:
    if ((flags & 0x800000000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_155;
  }
LABEL_154:
  PBDataWriterWriteFloatField();
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x800000000000) == 0)
  {
LABEL_31:
    if ((flags & 0x800000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_156;
  }
LABEL_155:
  PBDataWriterWriteBOOLField();
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x800000) == 0)
  {
LABEL_32:
    if ((flags & 0x8000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_157;
  }
LABEL_156:
  PBDataWriterWriteUint32Field();
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x8000000) == 0)
  {
LABEL_33:
    if ((flags & 0x4000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_158;
  }
LABEL_157:
  PBDataWriterWriteUint32Field();
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x4000000) == 0)
  {
LABEL_34:
    if ((flags & 0x10000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_159;
  }
LABEL_158:
  PBDataWriterWriteUint32Field();
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x10000000000) == 0)
  {
LABEL_35:
    if ((flags & 0x20000000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_160;
  }
LABEL_159:
  PBDataWriterWriteInt32Field();
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x20000000000) == 0)
  {
LABEL_36:
    if ((flags & 0x2000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_161;
  }
LABEL_160:
  PBDataWriterWriteInt32Field();
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x2000000) == 0)
  {
LABEL_37:
    if ((flags & 0x200000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_162;
  }
LABEL_161:
  PBDataWriterWriteInt32Field();
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x200000000) == 0)
  {
LABEL_38:
    if ((flags & 0x40000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
LABEL_162:
  PBDataWriterWriteUint32Field();
  if ((*(void *)&self->_flags & 0x40000) != 0) {
LABEL_39:
  }
    PBDataWriterWriteUint64Field();
LABEL_40:
  if (self->_location) {
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = (uint64_t)self->_flags;
  if ((v8 & 0x400000000000) != 0)
  {
    PBDataWriterWriteUint32Field();
    uint64_t v8 = (uint64_t)self->_flags;
  }
  if ((v8 & 0x100000000) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_traits.count)
  {
    unint64_t v9 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v9;
    }
    while (v9 < self->_traits.count);
  }
  uint64_t v10 = (uint64_t)self->_flags;
  if ((v10 & 0x1000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    uint64_t v10 = (uint64_t)self->_flags;
  }
  if ((v10 & 0x200000) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_authTraits.count)
  {
    unint64_t v11 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v11;
    }
    while (v11 < self->_authTraits.count);
  }
  v12 = &self->_flags;
  uint64_t v13 = (uint64_t)self->_flags;
  if ((v13 & 0x80000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    uint64_t v13 = *(void *)v12;
    if ((*(void *)v12 & 0x100000000000) == 0)
    {
LABEL_58:
      if ((v13 & 0x8000000000000) == 0) {
        goto LABEL_59;
      }
      goto LABEL_166;
    }
  }
  else if ((v13 & 0x100000000000) == 0)
  {
    goto LABEL_58;
  }
  PBDataWriterWriteFloatField();
  uint64_t v13 = (uint64_t)self->_flags;
  if ((v13 & 0x8000000000000) == 0)
  {
LABEL_59:
    if ((v13 & 0x4000000000000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_167;
  }
LABEL_166:
  PBDataWriterWriteBOOLField();
  uint64_t v13 = (uint64_t)self->_flags;
  if ((v13 & 0x4000000000000) == 0)
  {
LABEL_60:
    if ((v13 & 0x2000000000000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_168;
  }
LABEL_167:
  PBDataWriterWriteBOOLField();
  uint64_t v13 = (uint64_t)self->_flags;
  if ((v13 & 0x2000000000000) == 0)
  {
LABEL_61:
    if ((v13 & 0x1000000000000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_169;
  }
LABEL_168:
  PBDataWriterWriteBOOLField();
  uint64_t v13 = (uint64_t)self->_flags;
  if ((v13 & 0x1000000000000) == 0)
  {
LABEL_62:
    if ((v13 & 0x400000) == 0) {
      goto LABEL_63;
    }
LABEL_170:
    PBDataWriterWriteInt32Field();
    if ((*(void *)&self->_flags & 0x20000000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_64;
  }
LABEL_169:
  PBDataWriterWriteBOOLField();
  uint64_t v13 = (uint64_t)self->_flags;
  if ((v13 & 0x400000) != 0) {
    goto LABEL_170;
  }
LABEL_63:
  if ((v13 & 0x20000000) != 0) {
LABEL_64:
  }
    PBDataWriterWriteInt32Field();
LABEL_65:
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  v14 = self->_essMembers;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v62 objects:v71 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v63;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v63 != v16) {
          objc_enumerationMutation(v14);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v62 objects:v71 count:16];
    }
    while (v15);
  }

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v18 = self->_nearbyBSSs;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v58 objects:v70 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v59;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v59 != v20) {
          objc_enumerationMutation(v18);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v58 objects:v70 count:16];
    }
    while (v19);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v22 = self->_feedbacks;
  uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v54 objects:v69 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v55;
    do
    {
      for (uint64_t k = 0; k != v23; ++k)
      {
        if (*(void *)v55 != v24) {
          objc_enumerationMutation(v22);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v54 objects:v69 count:16];
    }
    while (v23);
  }

  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v26 = self->_roamStates;
  uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v50 objects:v68 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v51;
    do
    {
      for (uint64_t m = 0; m != v27; ++m)
      {
        if (*(void *)v51 != v28) {
          objc_enumerationMutation(v26);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v50 objects:v68 count:16];
    }
    while (v27);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v30 = self->_speedTests;
  uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v46 objects:v67 count:16];
  if (v31)
  {
    uint64_t v32 = *(void *)v47;
    do
    {
      for (uint64_t n = 0; n != v31; ++n)
      {
        if (*(void *)v47 != v32) {
          objc_enumerationMutation(v30);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v46 objects:v67 count:16];
    }
    while (v31);
  }

  uint64_t v34 = (uint64_t)self->_flags;
  if ((v34 & 0x40000000000) != 0)
  {
    PBDataWriterWriteUint32Field();
    uint64_t v34 = (uint64_t)self->_flags;
  }
  if ((v34 & 0x80000000000) != 0)
  {
    PBDataWriterWriteUint32Field();
    uint64_t v34 = (uint64_t)self->_flags;
  }
  if ((v34 & 0x100000) != 0)
  {
    PBDataWriterWriteInt32Field();
    uint64_t v34 = (uint64_t)self->_flags;
  }
  if ((v34 & 0x10000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    uint64_t v34 = (uint64_t)self->_flags;
  }
  if ((v34 & 0x200000000000) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_label) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_passpointInfo) {
    PBDataWriterWriteSubmessage();
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v35 = self->_hotspotHelperProviders;
  uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v42 objects:v66 count:16];
  if (v36)
  {
    uint64_t v37 = *(void *)v43;
    do
    {
      for (iuint64_t i = 0; ii != v36; ++ii)
      {
        if (*(void *)v43 != v37) {
          objc_enumerationMutation(v35);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v42 objects:v66 count:16];
    }
    while (v36);
  }

  if (self->_nameAttributes.count)
  {
    unint64_t v39 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v39;
    }
    while (v39 < self->_nameAttributes.count);
  }
  if ((*(void *)&self->_flags & 0x40000000) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_beaconInfo) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(void *)&self->_flags & 0x8000) != 0) {
    PBDataWriterWriteDoubleField();
  }
LABEL_173:
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOWiFiConnectionQuality _readLocation]((uint64_t)self);
  locatiouint64_t n = self->_location;

  return [(GEOLocation *)location hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  long long v47 = (id *)a3;
  [(GEOWiFiConnectionQuality *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v47 + 1, self->_reader);
  *((_DWORD *)v47 + 86) = self->_readerMarkPos;
  *((_DWORD *)v47 + 87) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  id v4 = v47;
  if ((*(void *)&self->_flags & 0x80000) != 0)
  {
    v47[41] = self->_timestamp;
    v47[59] = (id)((unint64_t)v47[59] | 0x80000);
  }
  if (self->_uniqueID)
  {
    objc_msgSend(v47, "setUniqueID:");
    id v4 = v47;
  }
  p_uint64_t flags = &self->_flags;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x400) != 0)
  {
    v4[29] = self->_overAllStay;
    v4[59] = (id)((unint64_t)v4[59] | 0x400);
    uint64_t flags = *(void *)p_flags;
    if ((*(void *)p_flags & 0x40) == 0)
    {
LABEL_7:
      if ((flags & 0x80) == 0) {
        goto LABEL_8;
      }
      goto LABEL_116;
    }
  }
  else if ((flags & 0x40) == 0)
  {
    goto LABEL_7;
  }
  v4[19] = self->_faultyStay;
  v4[59] = (id)((unint64_t)v4[59] | 0x40);
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_8:
    if ((flags & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_117;
  }
LABEL_116:
  v4[25] = self->_lowLQMStay;
  v4[59] = (id)((unint64_t)v4[59] | 0x80);
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x100) == 0)
  {
LABEL_9:
    if ((flags & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_118;
  }
LABEL_117:
  v4[26] = self->_lowqStay;
  v4[59] = (id)((unint64_t)v4[59] | 0x100);
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x200) == 0)
  {
LABEL_10:
    if ((flags & 0x20000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_119;
  }
LABEL_118:
  v4[27] = self->_lqmTranCount;
  v4[59] = (id)((unint64_t)v4[59] | 0x200);
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x20000) == 0)
  {
LABEL_11:
    if ((flags & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_120;
  }
LABEL_119:
  v4[39] = self->_successfulConnections;
  v4[59] = (id)((unint64_t)v4[59] | 0x20000);
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_12:
    if ((flags & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_121;
  }
LABEL_120:
  v4[18] = self->_failedConnections;
  v4[59] = (id)((unint64_t)v4[59] | 0x20);
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x800) == 0)
  {
LABEL_13:
    if ((flags & 0x1000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_122;
  }
LABEL_121:
  v4[30] = self->_packetsIn;
  v4[59] = (id)((unint64_t)v4[59] | 0x800);
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x1000) == 0)
  {
LABEL_14:
    if ((flags & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_123;
  }
LABEL_122:
  v4[31] = self->_packetsOut;
  v4[59] = (id)((unint64_t)v4[59] | 0x1000);
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_15:
    if ((flags & 8) == 0) {
      goto LABEL_16;
    }
    goto LABEL_124;
  }
LABEL_123:
  v4[13] = self->_bytesInTotal;
  v4[59] = (id)((unint64_t)v4[59] | 2);
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_16:
    if ((flags & 1) == 0) {
      goto LABEL_17;
    }
    goto LABEL_125;
  }
LABEL_124:
  v4[15] = self->_bytesOutTotal;
  v4[59] = (id)((unint64_t)v4[59] | 8);
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_17:
    if ((flags & 4) == 0) {
      goto LABEL_18;
    }
    goto LABEL_126;
  }
LABEL_125:
  v4[12] = self->_bytesInActive;
  v4[59] = (id)((unint64_t)v4[59] | 1);
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_18:
    if ((flags & 0x2000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_127;
  }
LABEL_126:
  v4[14] = self->_bytesOutActive;
  v4[59] = (id)((unint64_t)v4[59] | 4);
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x2000) == 0)
  {
LABEL_19:
    if ((flags & 0x10) == 0) {
      goto LABEL_20;
    }
    goto LABEL_128;
  }
LABEL_127:
  v4[33] = self->_reTxBytes;
  v4[59] = (id)((unint64_t)v4[59] | 0x2000);
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_20:
    if ((flags & 0x4000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_129;
  }
LABEL_128:
  v4[16] = self->_dataStalls;
  v4[59] = (id)((unint64_t)v4[59] | 0x10);
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x4000) == 0)
  {
LABEL_21:
    if ((flags & 0x10000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_130;
  }
LABEL_129:
  v4[34] = self->_receivedDupes;
  v4[59] = (id)((unint64_t)v4[59] | 0x4000);
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x10000) == 0)
  {
LABEL_22:
    if ((flags & 0x2000000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_131;
  }
LABEL_130:
  v4[37] = self->_rxOutOfOrderBytes;
  v4[59] = (id)((unint64_t)v4[59] | 0x10000);
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x2000000000) == 0)
  {
LABEL_23:
    if ((flags & 0x800000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_132;
  }
LABEL_131:
  *((_DWORD *)v4 + 106) = LODWORD(self->_roundTripTimeMin);
  v4[59] = (id)((unint64_t)v4[59] | 0x2000000000);
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x800000000) == 0)
  {
LABEL_24:
    if ((flags & 0x8000000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_133;
  }
LABEL_132:
  *((_DWORD *)v4 + 104) = LODWORD(self->_roundTripTimeAvg);
  v4[59] = (id)((unint64_t)v4[59] | 0x800000000);
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x8000000000) == 0)
  {
LABEL_25:
    if ((flags & 0x1000000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_134;
  }
LABEL_133:
  *((_DWORD *)v4 + 108) = LODWORD(self->_roundTripTimeVar);
  v4[59] = (id)((unint64_t)v4[59] | 0x8000000000);
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x1000000000) == 0)
  {
LABEL_26:
    if ((flags & 0x400000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_135;
  }
LABEL_134:
  *((_DWORD *)v4 + 105) = LODWORD(self->_roundTripTimeMinActive);
  v4[59] = (id)((unint64_t)v4[59] | 0x1000000000);
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x400000000) == 0)
  {
LABEL_27:
    if ((flags & 0x4000000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_136;
  }
LABEL_135:
  *((_DWORD *)v4 + 103) = LODWORD(self->_roundTripTimeAvgActive);
  v4[59] = (id)((unint64_t)v4[59] | 0x400000000);
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x4000000000) == 0)
  {
LABEL_28:
    if ((flags & 0x800000000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_137;
  }
LABEL_136:
  *((_DWORD *)v4 + 107) = LODWORD(self->_roundTripTimeVarActive);
  v4[59] = (id)((unint64_t)v4[59] | 0x4000000000);
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x800000000000) == 0)
  {
LABEL_29:
    if ((flags & 0x800000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_138;
  }
LABEL_137:
  *((unsigned char *)v4 + 464) = self->_hotspot20;
  v4[59] = (id)((unint64_t)v4[59] | 0x800000000000);
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x800000) == 0)
  {
LABEL_30:
    if ((flags & 0x8000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_139;
  }
LABEL_138:
  *((_DWORD *)v4 + 92) = self->_band;
  v4[59] = (id)((unint64_t)v4[59] | 0x800000);
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x8000000) == 0)
  {
LABEL_31:
    if ((flags & 0x4000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_140;
  }
LABEL_139:
  *((_DWORD *)v4 + 96) = self->_channel;
  v4[59] = (id)((unint64_t)v4[59] | 0x8000000);
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x4000000) == 0)
  {
LABEL_32:
    if ((flags & 0x10000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_141;
  }
LABEL_140:
  *((_DWORD *)v4 + 95) = self->_channelWidth;
  v4[59] = (id)((unint64_t)v4[59] | 0x4000000);
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x10000000000) == 0)
  {
LABEL_33:
    if ((flags & 0x20000000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_142;
  }
LABEL_141:
  *((_DWORD *)v4 + 109) = self->_rssi;
  v4[59] = (id)((unint64_t)v4[59] | 0x10000000000);
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x20000000000) == 0)
  {
LABEL_34:
    if ((flags & 0x2000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_143;
  }
LABEL_142:
  *((_DWORD *)v4 + 110) = self->_snr;
  v4[59] = (id)((unint64_t)v4[59] | 0x20000000000);
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x2000000) == 0)
  {
LABEL_35:
    if ((flags & 0x200000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_144;
  }
LABEL_143:
  *((_DWORD *)v4 + 94) = self->_cca;
  v4[59] = (id)((unint64_t)v4[59] | 0x2000000);
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x200000000) == 0)
  {
LABEL_36:
    if ((flags & 0x40000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
LABEL_144:
  *((_DWORD *)v4 + 102) = self->_phyMode;
  v4[59] = (id)((unint64_t)v4[59] | 0x200000000);
  if ((*(void *)&self->_flags & 0x40000) != 0)
  {
LABEL_37:
    v4[40] = self->_timeOfDay;
    v4[59] = (id)((unint64_t)v4[59] | 0x40000);
  }
LABEL_38:
  if (self->_location)
  {
    objc_msgSend(v47, "setLocation:");
    id v4 = v47;
  }
  uint64_t v7 = (uint64_t)self->_flags;
  if ((v7 & 0x400000000000) != 0)
  {
    *((_DWORD *)v4 + 115) = self->_wasCaptiveFlag;
    v4[59] = (id)((unint64_t)v4[59] | 0x400000000000);
    uint64_t v7 = (uint64_t)self->_flags;
  }
  if ((v7 & 0x100000000) != 0)
  {
    *((_DWORD *)v4 + 101) = self->_networkType;
    v4[59] = (id)((unint64_t)v4[59] | 0x100000000);
  }
  if ([(GEOWiFiConnectionQuality *)self traitsCount])
  {
    [v47 clearTraits];
    unint64_t v8 = [(GEOWiFiConnectionQuality *)self traitsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t i = 0; i != v9; ++i)
        objc_msgSend(v47, "addTraits:", -[GEOWiFiConnectionQuality traitsAtIndex:](self, "traitsAtIndex:", i));
    }
  }
  uint64_t v11 = (uint64_t)self->_flags;
  if ((v11 & 0x1000000) != 0)
  {
    *((_DWORD *)v47 + 93) = self->_captiveDetermination;
    v47[59] = (id)((unint64_t)v47[59] | 0x1000000);
    uint64_t v11 = (uint64_t)self->_flags;
  }
  if ((v11 & 0x200000) != 0)
  {
    *((_DWORD *)v47 + 90) = self->_associationLength;
    v47[59] = (id)((unint64_t)v47[59] | 0x200000);
  }
  if ([(GEOWiFiConnectionQuality *)self authTraitsCount])
  {
    [v47 clearAuthTraits];
    unint64_t v12 = [(GEOWiFiConnectionQuality *)self authTraitsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t j = 0; j != v13; ++j)
        objc_msgSend(v47, "addAuthTraits:", -[GEOWiFiConnectionQuality authTraitsAtIndex:](self, "authTraitsAtIndex:", j));
    }
  }
  uint64_t v15 = &self->_flags;
  uint64_t v16 = (uint64_t)self->_flags;
  if ((v16 & 0x80000000) != 0)
  {
    *((_DWORD *)v47 + 100) = self->_networkOrigin;
    v47[59] = (id)((unint64_t)v47[59] | 0x80000000);
    uint64_t v16 = *(void *)v15;
    if ((*(void *)v15 & 0x100000000000) == 0)
    {
LABEL_58:
      if ((v16 & 0x8000000000000) == 0) {
        goto LABEL_59;
      }
      goto LABEL_148;
    }
  }
  else if ((v16 & 0x100000000000) == 0)
  {
    goto LABEL_58;
  }
  *((_DWORD *)v47 + 113) = LODWORD(self->_topDLRate);
  v47[59] = (id)((unint64_t)v47[59] | 0x100000000000);
  uint64_t v16 = (uint64_t)self->_flags;
  if ((v16 & 0x8000000000000) == 0)
  {
LABEL_59:
    if ((v16 & 0x4000000000000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_149;
  }
LABEL_148:
  *((unsigned char *)v47 + 468) = self->_lowInternetUL;
  v47[59] = (id)((unint64_t)v47[59] | 0x8000000000000);
  uint64_t v16 = (uint64_t)self->_flags;
  if ((v16 & 0x4000000000000) == 0)
  {
LABEL_60:
    if ((v16 & 0x2000000000000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_150;
  }
LABEL_149:
  *((unsigned char *)v47 + 467) = self->_lowInternetDL;
  v47[59] = (id)((unint64_t)v47[59] | 0x4000000000000);
  uint64_t v16 = (uint64_t)self->_flags;
  if ((v16 & 0x2000000000000) == 0)
  {
LABEL_61:
    if ((v16 & 0x1000000000000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_151;
  }
LABEL_150:
  *((unsigned char *)v47 + 466) = self->_isKnownGood;
  v47[59] = (id)((unint64_t)v47[59] | 0x2000000000000);
  uint64_t v16 = (uint64_t)self->_flags;
  if ((v16 & 0x1000000000000) == 0)
  {
LABEL_62:
    if ((v16 & 0x400000) == 0) {
      goto LABEL_63;
    }
LABEL_152:
    *((_DWORD *)v47 + 91) = self->_associationReason;
    v47[59] = (id)((unint64_t)v47[59] | 0x400000);
    if ((*(void *)&self->_flags & 0x20000000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_64;
  }
LABEL_151:
  *((unsigned char *)v47 + 465) = self->_isEdgeBSS;
  v47[59] = (id)((unint64_t)v47[59] | 0x1000000000000);
  uint64_t v16 = (uint64_t)self->_flags;
  if ((v16 & 0x400000) != 0) {
    goto LABEL_152;
  }
LABEL_63:
  if ((v16 & 0x20000000) != 0)
  {
LABEL_64:
    *((_DWORD *)v47 + 98) = self->_disassociationReason;
    v47[59] = (id)((unint64_t)v47[59] | 0x20000000);
  }
LABEL_65:
  if ([(GEOWiFiConnectionQuality *)self essMembersCount])
  {
    [v47 clearEssMembers];
    unint64_t v17 = [(GEOWiFiConnectionQuality *)self essMembersCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t k = 0; k != v18; ++k)
      {
        uint64_t v20 = [(GEOWiFiConnectionQuality *)self essMembersAtIndex:k];
        [v47 addEssMembers:v20];
      }
    }
  }
  if ([(GEOWiFiConnectionQuality *)self nearbyBSSsCount])
  {
    [v47 clearNearbyBSSs];
    unint64_t v21 = [(GEOWiFiConnectionQuality *)self nearbyBSSsCount];
    if (v21)
    {
      unint64_t v22 = v21;
      for (uint64_t m = 0; m != v22; ++m)
      {
        uint64_t v24 = [(GEOWiFiConnectionQuality *)self nearbyBSSAtIndex:m];
        [v47 addNearbyBSS:v24];
      }
    }
  }
  if ([(GEOWiFiConnectionQuality *)self feedbacksCount])
  {
    [v47 clearFeedbacks];
    unint64_t v25 = [(GEOWiFiConnectionQuality *)self feedbacksCount];
    if (v25)
    {
      unint64_t v26 = v25;
      for (uint64_t n = 0; n != v26; ++n)
      {
        uint64_t v28 = [(GEOWiFiConnectionQuality *)self feedbackAtIndex:n];
        [v47 addFeedback:v28];
      }
    }
  }
  if (self->_identifier) {
    objc_msgSend(v47, "setIdentifier:");
  }
  if ([(GEOWiFiConnectionQuality *)self roamStatesCount])
  {
    [v47 clearRoamStates];
    unint64_t v29 = [(GEOWiFiConnectionQuality *)self roamStatesCount];
    if (v29)
    {
      unint64_t v30 = v29;
      for (iuint64_t i = 0; ii != v30; ++ii)
      {
        uint64_t v32 = [(GEOWiFiConnectionQuality *)self roamStatesAtIndex:ii];
        [v47 addRoamStates:v32];
      }
    }
  }
  if ([(GEOWiFiConnectionQuality *)self speedTestsCount])
  {
    [v47 clearSpeedTests];
    unint64_t v33 = [(GEOWiFiConnectionQuality *)self speedTestsCount];
    if (v33)
    {
      unint64_t v34 = v33;
      for (juint64_t j = 0; jj != v34; ++jj)
      {
        uint64_t v36 = [(GEOWiFiConnectionQuality *)self speedTestAtIndex:jj];
        [v47 addSpeedTest:v36];
      }
    }
  }
  uint64_t v37 = &self->_flags;
  uint64_t v38 = (uint64_t)self->_flags;
  if ((v38 & 0x40000000000) != 0)
  {
    *((_DWORD *)v47 + 111) = self->_sslConnectionCount;
    v47[59] = (id)((unint64_t)v47[59] | 0x40000000000);
    uint64_t v38 = *(void *)v37;
    if ((*(void *)v37 & 0x80000000000) == 0)
    {
LABEL_89:
      if ((v38 & 0x100000) == 0) {
        goto LABEL_90;
      }
      goto LABEL_156;
    }
  }
  else if ((v38 & 0x80000000000) == 0)
  {
    goto LABEL_89;
  }
  *((_DWORD *)v47 + 112) = self->_sslErrorCount;
  v47[59] = (id)((unint64_t)v47[59] | 0x80000000000);
  uint64_t v38 = (uint64_t)self->_flags;
  if ((v38 & 0x100000) == 0)
  {
LABEL_90:
    if ((v38 & 0x10000000) == 0) {
      goto LABEL_91;
    }
    goto LABEL_157;
  }
LABEL_156:
  *((_DWORD *)v47 + 89) = self->_apMode;
  v47[59] = (id)((unint64_t)v47[59] | 0x100000);
  uint64_t v38 = (uint64_t)self->_flags;
  if ((v38 & 0x10000000) == 0)
  {
LABEL_91:
    if ((v38 & 0x200000000000) == 0) {
      goto LABEL_93;
    }
    goto LABEL_92;
  }
LABEL_157:
  *((_DWORD *)v47 + 97) = self->_clientAssociationSubreason;
  v47[59] = (id)((unint64_t)v47[59] | 0x10000000);
  if ((*(void *)&self->_flags & 0x200000000000) != 0)
  {
LABEL_92:
    *((_DWORD *)v47 + 114) = self->_type;
    v47[59] = (id)((unint64_t)v47[59] | 0x200000000000);
  }
LABEL_93:
  if (self->_label) {
    objc_msgSend(v47, "setLabel:");
  }
  if (self->_passpointInfo) {
    objc_msgSend(v47, "setPasspointInfo:");
  }
  if ([(GEOWiFiConnectionQuality *)self hotspotHelperProvidersCount])
  {
    [v47 clearHotspotHelperProviders];
    unint64_t v39 = [(GEOWiFiConnectionQuality *)self hotspotHelperProvidersCount];
    if (v39)
    {
      unint64_t v40 = v39;
      for (kuint64_t k = 0; kk != v40; ++kk)
      {
        long long v42 = [(GEOWiFiConnectionQuality *)self hotspotHelperProviderAtIndex:kk];
        [v47 addHotspotHelperProvider:v42];
      }
    }
  }
  if ([(GEOWiFiConnectionQuality *)self nameAttributesCount])
  {
    [v47 clearNameAttributes];
    unint64_t v43 = [(GEOWiFiConnectionQuality *)self nameAttributesCount];
    if (v43)
    {
      unint64_t v44 = v43;
      for (muint64_t m = 0; mm != v44; ++mm)
        objc_msgSend(v47, "addNameAttributes:", -[GEOWiFiConnectionQuality nameAttributesAtIndex:](self, "nameAttributesAtIndex:", mm));
    }
  }
  long long v46 = v47;
  if ((*(void *)&self->_flags & 0x40000000) != 0)
  {
    *((_DWORD *)v47 + 99) = self->_dohAvailability;
    v47[59] = (id)((unint64_t)v47[59] | 0x40000000);
  }
  if (self->_beaconInfo)
  {
    objc_msgSend(v47, "setBeaconInfo:");
    long long v46 = v47;
  }
  if ((*(void *)&self->_flags & 0x8000) != 0)
  {
    v46[35] = *(id *)&self->_responsivenessScore;
    v46[59] = (id)((unint64_t)v46[59] | 0x8000);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 8) & 8) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOWiFiConnectionQualityReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_110;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOWiFiConnectionQuality *)self readAll:0];
  if ((*(void *)&self->_flags & 0x80000) != 0)
  {
    *(void *)(v5 + 328) = self->_timestamp;
    *(void *)(v5 + 472) |= 0x80000uLL;
  }
  uint64_t v9 = [(NSString *)self->_uniqueID copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 336);
  *(void *)(v5 + 336) = v9;

  p_uint64_t flags = &self->_flags;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x400) != 0)
  {
    *(void *)(v5 + 232) = self->_overAllStay;
    *(void *)(v5 + 472) |= 0x400uLL;
    uint64_t flags = *(void *)p_flags;
    if ((*(void *)p_flags & 0x40) == 0)
    {
LABEL_9:
      if ((flags & 0x80) == 0) {
        goto LABEL_10;
      }
      goto LABEL_113;
    }
  }
  else if ((flags & 0x40) == 0)
  {
    goto LABEL_9;
  }
  *(void *)(v5 + 152) = self->_faultyStay;
  *(void *)(v5 + 472) |= 0x40uLL;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_10:
    if ((flags & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_114;
  }
LABEL_113:
  *(void *)(v5 + 200) = self->_lowLQMStay;
  *(void *)(v5 + 472) |= 0x80uLL;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x100) == 0)
  {
LABEL_11:
    if ((flags & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_115;
  }
LABEL_114:
  *(void *)(v5 + 208) = self->_lowqStay;
  *(void *)(v5 + 472) |= 0x100uLL;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x200) == 0)
  {
LABEL_12:
    if ((flags & 0x20000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_116;
  }
LABEL_115:
  *(void *)(v5 + 216) = self->_lqmTranCount;
  *(void *)(v5 + 472) |= 0x200uLL;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x20000) == 0)
  {
LABEL_13:
    if ((flags & 0x20) == 0) {
      goto LABEL_14;
    }
    goto LABEL_117;
  }
LABEL_116:
  *(void *)(v5 + 312) = self->_successfulConnections;
  *(void *)(v5 + 472) |= 0x20000uLL;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_14:
    if ((flags & 0x800) == 0) {
      goto LABEL_15;
    }
    goto LABEL_118;
  }
LABEL_117:
  *(void *)(v5 + 144) = self->_failedConnections;
  *(void *)(v5 + 472) |= 0x20uLL;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x800) == 0)
  {
LABEL_15:
    if ((flags & 0x1000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_119;
  }
LABEL_118:
  *(void *)(v5 + 240) = self->_packetsIn;
  *(void *)(v5 + 472) |= 0x800uLL;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x1000) == 0)
  {
LABEL_16:
    if ((flags & 2) == 0) {
      goto LABEL_17;
    }
    goto LABEL_120;
  }
LABEL_119:
  *(void *)(v5 + 248) = self->_packetsOut;
  *(void *)(v5 + 472) |= 0x1000uLL;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_17:
    if ((flags & 8) == 0) {
      goto LABEL_18;
    }
    goto LABEL_121;
  }
LABEL_120:
  *(void *)(v5 + 104) = self->_bytesInTotal;
  *(void *)(v5 + 472) |= 2uLL;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_18:
    if ((flags & 1) == 0) {
      goto LABEL_19;
    }
    goto LABEL_122;
  }
LABEL_121:
  *(void *)(v5 + 120) = self->_bytesOutTotal;
  *(void *)(v5 + 472) |= 8uLL;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_19:
    if ((flags & 4) == 0) {
      goto LABEL_20;
    }
    goto LABEL_123;
  }
LABEL_122:
  *(void *)(v5 + 96) = self->_bytesInActive;
  *(void *)(v5 + 472) |= 1uLL;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_20:
    if ((flags & 0x2000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_124;
  }
LABEL_123:
  *(void *)(v5 + 112) = self->_bytesOutActive;
  *(void *)(v5 + 472) |= 4uLL;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x2000) == 0)
  {
LABEL_21:
    if ((flags & 0x10) == 0) {
      goto LABEL_22;
    }
    goto LABEL_125;
  }
LABEL_124:
  *(void *)(v5 + 264) = self->_reTxBytes;
  *(void *)(v5 + 472) |= 0x2000uLL;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_22:
    if ((flags & 0x4000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_126;
  }
LABEL_125:
  *(void *)(v5 + 128) = self->_dataStalls;
  *(void *)(v5 + 472) |= 0x10uLL;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x4000) == 0)
  {
LABEL_23:
    if ((flags & 0x10000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_127;
  }
LABEL_126:
  *(void *)(v5 + 272) = self->_receivedDupes;
  *(void *)(v5 + 472) |= 0x4000uLL;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x10000) == 0)
  {
LABEL_24:
    if ((flags & 0x2000000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_128;
  }
LABEL_127:
  *(void *)(v5 + 296) = self->_rxOutOfOrderBytes;
  *(void *)(v5 + 472) |= 0x10000uLL;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x2000000000) == 0)
  {
LABEL_25:
    if ((flags & 0x800000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_129;
  }
LABEL_128:
  *(float *)(v5 + 424) = self->_roundTripTimeMin;
  *(void *)(v5 + 472) |= 0x2000000000uLL;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x800000000) == 0)
  {
LABEL_26:
    if ((flags & 0x8000000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_130;
  }
LABEL_129:
  *(float *)(v5 + 416) = self->_roundTripTimeAvg;
  *(void *)(v5 + 472) |= 0x800000000uLL;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x8000000000) == 0)
  {
LABEL_27:
    if ((flags & 0x1000000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_131;
  }
LABEL_130:
  *(float *)(v5 + 432) = self->_roundTripTimeVar;
  *(void *)(v5 + 472) |= 0x8000000000uLL;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x1000000000) == 0)
  {
LABEL_28:
    if ((flags & 0x400000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_132;
  }
LABEL_131:
  *(float *)(v5 + 420) = self->_roundTripTimeMinActive;
  *(void *)(v5 + 472) |= 0x1000000000uLL;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x400000000) == 0)
  {
LABEL_29:
    if ((flags & 0x4000000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_133;
  }
LABEL_132:
  *(float *)(v5 + 412) = self->_roundTripTimeAvgActive;
  *(void *)(v5 + 472) |= 0x400000000uLL;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x4000000000) == 0)
  {
LABEL_30:
    if ((flags & 0x800000000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_134;
  }
LABEL_133:
  *(float *)(v5 + 428) = self->_roundTripTimeVarActive;
  *(void *)(v5 + 472) |= 0x4000000000uLL;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x800000000000) == 0)
  {
LABEL_31:
    if ((flags & 0x800000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_135;
  }
LABEL_134:
  *(unsigned char *)(v5 + 464) = self->_hotspot20;
  *(void *)(v5 + 472) |= 0x800000000000uLL;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x800000) == 0)
  {
LABEL_32:
    if ((flags & 0x8000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_136;
  }
LABEL_135:
  *(_DWORD *)(v5 + 368) = self->_band;
  *(void *)(v5 + 472) |= 0x800000uLL;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x8000000) == 0)
  {
LABEL_33:
    if ((flags & 0x4000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_137;
  }
LABEL_136:
  *(_DWORD *)(v5 + 384) = self->_channel;
  *(void *)(v5 + 472) |= 0x8000000uLL;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x4000000) == 0)
  {
LABEL_34:
    if ((flags & 0x10000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_138;
  }
LABEL_137:
  *(_DWORD *)(v5 + 380) = self->_channelWidth;
  *(void *)(v5 + 472) |= 0x4000000uLL;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x10000000000) == 0)
  {
LABEL_35:
    if ((flags & 0x20000000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_139;
  }
LABEL_138:
  *(_DWORD *)(v5 + 436) = self->_rssi;
  *(void *)(v5 + 472) |= 0x10000000000uLL;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x20000000000) == 0)
  {
LABEL_36:
    if ((flags & 0x2000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_140;
  }
LABEL_139:
  *(_DWORD *)(v5 + 440) = self->_snr;
  *(void *)(v5 + 472) |= 0x20000000000uLL;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x2000000) == 0)
  {
LABEL_37:
    if ((flags & 0x200000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_141;
  }
LABEL_140:
  *(_DWORD *)(v5 + 376) = self->_cca;
  *(void *)(v5 + 472) |= 0x2000000uLL;
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x200000000) == 0)
  {
LABEL_38:
    if ((flags & 0x40000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
LABEL_141:
  *(_DWORD *)(v5 + 408) = self->_phyMode;
  *(void *)(v5 + 472) |= 0x200000000uLL;
  if ((*(void *)&self->_flags & 0x40000) != 0)
  {
LABEL_39:
    *(void *)(v5 + 320) = self->_timeOfDay;
    *(void *)(v5 + 472) |= 0x40000uLL;
  }
LABEL_40:
  id v13 = [(GEOLocation *)self->_location copyWithZone:a3];
  v14 = *(void **)(v5 + 192);
  *(void *)(v5 + 192) = v13;

  uint64_t v15 = (uint64_t)self->_flags;
  if ((v15 & 0x400000000000) != 0)
  {
    *(_DWORD *)(v5 + 460) = self->_wasCaptiveFlag;
    *(void *)(v5 + 472) |= 0x400000000000uLL;
    uint64_t v15 = (uint64_t)self->_flags;
  }
  if ((v15 & 0x100000000) != 0)
  {
    *(_DWORD *)(v5 + 404) = self->_networkType;
    *(void *)(v5 + 472) |= 0x100000000uLL;
  }
  PBRepeatedInt32Copy();
  uint64_t v16 = (uint64_t)self->_flags;
  if ((v16 & 0x1000000) != 0)
  {
    *(_DWORD *)(v5 + 372) = self->_captiveDetermination;
    *(void *)(v5 + 472) |= 0x1000000uLL;
    uint64_t v16 = (uint64_t)self->_flags;
  }
  if ((v16 & 0x200000) != 0)
  {
    *(_DWORD *)(v5 + 360) = self->_associationLength;
    *(void *)(v5 + 472) |= 0x200000uLL;
  }
  PBRepeatedInt32Copy();
  unint64_t v17 = &self->_flags;
  uint64_t v18 = (uint64_t)self->_flags;
  if ((v18 & 0x80000000) != 0)
  {
    *(_DWORD *)(v5 + 400) = self->_networkOrigin;
    *(void *)(v5 + 472) |= 0x80000000uLL;
    uint64_t v18 = *(void *)v17;
    if ((*(void *)v17 & 0x100000000000) == 0)
    {
LABEL_50:
      if ((v18 & 0x8000000000000) == 0) {
        goto LABEL_51;
      }
      goto LABEL_145;
    }
  }
  else if ((v18 & 0x100000000000) == 0)
  {
    goto LABEL_50;
  }
  *(float *)(v5 + 452) = self->_topDLRate;
  *(void *)(v5 + 472) |= 0x100000000000uLL;
  uint64_t v18 = (uint64_t)self->_flags;
  if ((v18 & 0x8000000000000) == 0)
  {
LABEL_51:
    if ((v18 & 0x4000000000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_146;
  }
LABEL_145:
  *(unsigned char *)(v5 + 468) = self->_lowInternetUL;
  *(void *)(v5 + 472) |= 0x8000000000000uLL;
  uint64_t v18 = (uint64_t)self->_flags;
  if ((v18 & 0x4000000000000) == 0)
  {
LABEL_52:
    if ((v18 & 0x2000000000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_147;
  }
LABEL_146:
  *(unsigned char *)(v5 + 467) = self->_lowInternetDL;
  *(void *)(v5 + 472) |= 0x4000000000000uLL;
  uint64_t v18 = (uint64_t)self->_flags;
  if ((v18 & 0x2000000000000) == 0)
  {
LABEL_53:
    if ((v18 & 0x1000000000000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_148;
  }
LABEL_147:
  *(unsigned char *)(v5 + 466) = self->_isKnownGood;
  *(void *)(v5 + 472) |= 0x2000000000000uLL;
  uint64_t v18 = (uint64_t)self->_flags;
  if ((v18 & 0x1000000000000) == 0)
  {
LABEL_54:
    if ((v18 & 0x400000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_149;
  }
LABEL_148:
  *(unsigned char *)(v5 + 465) = self->_isEdgeBSS;
  *(void *)(v5 + 472) |= 0x1000000000000uLL;
  uint64_t v18 = (uint64_t)self->_flags;
  if ((v18 & 0x400000) == 0)
  {
LABEL_55:
    if ((v18 & 0x20000000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_56;
  }
LABEL_149:
  *(_DWORD *)(v5 + 364) = self->_associationReason;
  *(void *)(v5 + 472) |= 0x400000uLL;
  if ((*(void *)&self->_flags & 0x20000000) != 0)
  {
LABEL_56:
    *(_DWORD *)(v5 + 392) = self->_disassociationReason;
    *(void *)(v5 + 472) |= 0x20000000uLL;
  }
LABEL_57:
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  uint64_t v19 = self->_essMembers;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v81 objects:v90 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v82;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v82 != v21) {
          objc_enumerationMutation(v19);
        }
        uint64_t v23 = (void *)[*(id *)(*((void *)&v81 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addEssMembers:v23];
      }
      uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v81 objects:v90 count:16];
    }
    while (v20);
  }

  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  uint64_t v24 = self->_nearbyBSSs;
  uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v77 objects:v89 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v78;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v78 != v26) {
          objc_enumerationMutation(v24);
        }
        uint64_t v28 = (void *)[*(id *)(*((void *)&v77 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addNearbyBSS:v28];
      }
      uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v77 objects:v89 count:16];
    }
    while (v25);
  }

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  unint64_t v29 = self->_feedbacks;
  uint64_t v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v73 objects:v88 count:16];
  if (v30)
  {
    uint64_t v31 = *(void *)v74;
    do
    {
      for (uint64_t k = 0; k != v30; ++k)
      {
        if (*(void *)v74 != v31) {
          objc_enumerationMutation(v29);
        }
        unint64_t v33 = (void *)[*(id *)(*((void *)&v73 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addFeedback:v33];
      }
      uint64_t v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v73 objects:v88 count:16];
    }
    while (v30);
  }

  uint64_t v34 = [(NSString *)self->_identifier copyWithZone:a3];
  v35 = *(void **)(v5 + 176);
  *(void *)(v5 + 176) = v34;

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  uint64_t v36 = self->_roamStates;
  uint64_t v37 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v69 objects:v87 count:16];
  if (v37)
  {
    uint64_t v38 = *(void *)v70;
    do
    {
      for (uint64_t m = 0; m != v37; ++m)
      {
        if (*(void *)v70 != v38) {
          objc_enumerationMutation(v36);
        }
        unint64_t v40 = (void *)[*(id *)(*((void *)&v69 + 1) + 8 * m) copyWithZone:a3];
        [(id)v5 addRoamStates:v40];
      }
      uint64_t v37 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v69 objects:v87 count:16];
    }
    while (v37);
  }

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  v41 = self->_speedTests;
  uint64_t v42 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v65 objects:v86 count:16];
  if (v42)
  {
    uint64_t v43 = *(void *)v66;
    do
    {
      for (uint64_t n = 0; n != v42; ++n)
      {
        if (*(void *)v66 != v43) {
          objc_enumerationMutation(v41);
        }
        long long v45 = (void *)[*(id *)(*((void *)&v65 + 1) + 8 * n) copyWithZone:a3];
        [(id)v5 addSpeedTest:v45];
      }
      uint64_t v42 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v65 objects:v86 count:16];
    }
    while (v42);
  }

  long long v46 = &self->_flags;
  uint64_t v47 = (uint64_t)self->_flags;
  if ((v47 & 0x40000000000) != 0)
  {
    *(_DWORD *)(v5 + 444) = self->_sslConnectionCount;
    *(void *)(v5 + 472) |= 0x40000000000uLL;
    uint64_t v47 = *(void *)v46;
    if ((*(void *)v46 & 0x80000000000) == 0)
    {
LABEL_94:
      if ((v47 & 0x100000) == 0) {
        goto LABEL_95;
      }
      goto LABEL_153;
    }
  }
  else if ((v47 & 0x80000000000) == 0)
  {
    goto LABEL_94;
  }
  *(_DWORD *)(v5 + 448) = self->_sslErrorCount;
  *(void *)(v5 + 472) |= 0x80000000000uLL;
  uint64_t v47 = (uint64_t)self->_flags;
  if ((v47 & 0x100000) == 0)
  {
LABEL_95:
    if ((v47 & 0x10000000) == 0) {
      goto LABEL_96;
    }
LABEL_154:
    *(_DWORD *)(v5 + 388) = self->_clientAssociationSubreason;
    *(void *)(v5 + 472) |= 0x10000000uLL;
    if ((*(void *)&self->_flags & 0x200000000000) == 0) {
      goto LABEL_98;
    }
    goto LABEL_97;
  }
LABEL_153:
  *(_DWORD *)(v5 + 356) = self->_apMode;
  *(void *)(v5 + 472) |= 0x100000uLL;
  uint64_t v47 = (uint64_t)self->_flags;
  if ((v47 & 0x10000000) != 0) {
    goto LABEL_154;
  }
LABEL_96:
  if ((v47 & 0x200000000000) != 0)
  {
LABEL_97:
    *(_DWORD *)(v5 + 456) = self->_type;
    *(void *)(v5 + 472) |= 0x200000000000uLL;
  }
LABEL_98:
  id v48 = [(GEOWiFiHarvestLabel *)self->_label copyWithZone:a3];
  long long v49 = *(void **)(v5 + 184);
  *(void *)(v5 + 184) = v48;

  id v50 = [(GEOWiFiPasspointInfo *)self->_passpointInfo copyWithZone:a3];
  long long v51 = *(void **)(v5 + 256);
  *(void *)(v5 + 256) = v50;

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v52 = self->_hotspotHelperProviders;
  uint64_t v53 = [(NSMutableArray *)v52 countByEnumeratingWithState:&v61 objects:v85 count:16];
  if (v53)
  {
    uint64_t v54 = *(void *)v62;
    do
    {
      for (iuint64_t i = 0; ii != v53; ++ii)
      {
        if (*(void *)v62 != v54) {
          objc_enumerationMutation(v52);
        }
        long long v56 = objc_msgSend(*(id *)(*((void *)&v61 + 1) + 8 * ii), "copyWithZone:", a3, (void)v61);
        [(id)v5 addHotspotHelperProvider:v56];
      }
      uint64_t v53 = [(NSMutableArray *)v52 countByEnumeratingWithState:&v61 objects:v85 count:16];
    }
    while (v53);
  }

  PBRepeatedInt32Copy();
  if ((*(void *)&self->_flags & 0x40000000) != 0)
  {
    *(_DWORD *)(v5 + 396) = self->_dohAvailability;
    *(void *)(v5 + 472) |= 0x40000000uLL;
  }
  id v57 = -[GEOWiFiBeaconInfo copyWithZone:](self->_beaconInfo, "copyWithZone:", a3, (void)v61);
  long long v58 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v57;

  if ((*(void *)&self->_flags & 0x8000) != 0)
  {
    *(double *)(v5 + 280) = self->_responsivenessScore;
    *(void *)(v5 + 472) |= 0x8000uLL;
  }
  id v59 = (id)v5;
LABEL_110:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_307;
  }
  [(GEOWiFiConnectionQuality *)self readAll:1];
  [v4 readAll:1];
  uint64_t flags = (uint64_t)self->_flags;
  uint64_t v6 = *((void *)v4 + 59);
  if ((flags & 0x80000) != 0)
  {
    if ((v6 & 0x80000) == 0 || self->_timestamp != *((void *)v4 + 41)) {
      goto LABEL_307;
    }
  }
  else if ((v6 & 0x80000) != 0)
  {
    goto LABEL_307;
  }
  uniqueID = self->_uniqueID;
  if ((unint64_t)uniqueID | *((void *)v4 + 42))
  {
    if (!-[NSString isEqual:](uniqueID, "isEqual:")) {
      goto LABEL_307;
    }
    uint64_t flags = (uint64_t)self->_flags;
    uint64_t v6 = *((void *)v4 + 59);
  }
  if ((flags & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_overAllStay != *((void *)v4 + 29)) {
      goto LABEL_307;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_faultyStay != *((void *)v4 + 19)) {
      goto LABEL_307;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_lowLQMStay != *((void *)v4 + 25)) {
      goto LABEL_307;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_lowqStay != *((void *)v4 + 26)) {
      goto LABEL_307;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_lqmTranCount != *((void *)v4 + 27)) {
      goto LABEL_307;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_successfulConnections != *((void *)v4 + 39)) {
      goto LABEL_307;
    }
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_failedConnections != *((void *)v4 + 18)) {
      goto LABEL_307;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_packetsIn != *((void *)v4 + 30)) {
      goto LABEL_307;
    }
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_packetsOut != *((void *)v4 + 31)) {
      goto LABEL_307;
    }
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_bytesInTotal != *((void *)v4 + 13)) {
      goto LABEL_307;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_bytesOutTotal != *((void *)v4 + 15)) {
      goto LABEL_307;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_307;
  }
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_bytesInActive != *((void *)v4 + 12)) {
      goto LABEL_307;
    }
  }
  else if (v6)
  {
    goto LABEL_307;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_bytesOutActive != *((void *)v4 + 14)) {
      goto LABEL_307;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_reTxBytes != *((void *)v4 + 33)) {
      goto LABEL_307;
    }
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_dataStalls != *((void *)v4 + 16)) {
      goto LABEL_307;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_receivedDupes != *((void *)v4 + 34)) {
      goto LABEL_307;
    }
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0 || self->_rxOutOfOrderBytes != *((void *)v4 + 37)) {
      goto LABEL_307;
    }
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x2000000000) != 0)
  {
    if ((v6 & 0x2000000000) == 0 || self->_roundTripTimeMin != *((float *)v4 + 106)) {
      goto LABEL_307;
    }
  }
  else if ((v6 & 0x2000000000) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x800000000) != 0)
  {
    if ((v6 & 0x800000000) == 0 || self->_roundTripTimeAvg != *((float *)v4 + 104)) {
      goto LABEL_307;
    }
  }
  else if ((v6 & 0x800000000) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x8000000000) != 0)
  {
    if ((v6 & 0x8000000000) == 0 || self->_roundTripTimeVar != *((float *)v4 + 108)) {
      goto LABEL_307;
    }
  }
  else if ((v6 & 0x8000000000) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x1000000000) != 0)
  {
    if ((v6 & 0x1000000000) == 0 || self->_roundTripTimeMinActive != *((float *)v4 + 105)) {
      goto LABEL_307;
    }
  }
  else if ((v6 & 0x1000000000) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x400000000) != 0)
  {
    if ((v6 & 0x400000000) == 0 || self->_roundTripTimeAvgActive != *((float *)v4 + 103)) {
      goto LABEL_307;
    }
  }
  else if ((v6 & 0x400000000) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x4000000000) != 0)
  {
    if ((v6 & 0x4000000000) == 0 || self->_roundTripTimeVarActive != *((float *)v4 + 107)) {
      goto LABEL_307;
    }
  }
  else if ((v6 & 0x4000000000) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x800000000000) != 0)
  {
    if ((v6 & 0x800000000000) == 0) {
      goto LABEL_307;
    }
    if (self->_hotspot20)
    {
      if (!*((unsigned char *)v4 + 464)) {
        goto LABEL_307;
      }
    }
    else if (*((unsigned char *)v4 + 464))
    {
      goto LABEL_307;
    }
  }
  else if ((v6 & 0x800000000000) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x800000) != 0)
  {
    if ((v6 & 0x800000) == 0 || self->_band != *((_DWORD *)v4 + 92)) {
      goto LABEL_307;
    }
  }
  else if ((v6 & 0x800000) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x8000000) != 0)
  {
    if ((v6 & 0x8000000) == 0 || self->_channel != *((_DWORD *)v4 + 96)) {
      goto LABEL_307;
    }
  }
  else if ((v6 & 0x8000000) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x4000000) != 0)
  {
    if ((v6 & 0x4000000) == 0 || self->_channelWidth != *((_DWORD *)v4 + 95)) {
      goto LABEL_307;
    }
  }
  else if ((v6 & 0x4000000) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x10000000000) != 0)
  {
    if ((v6 & 0x10000000000) == 0 || self->_rssi != *((_DWORD *)v4 + 109)) {
      goto LABEL_307;
    }
  }
  else if ((v6 & 0x10000000000) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x20000000000) != 0)
  {
    if ((v6 & 0x20000000000) == 0 || self->_snr != *((_DWORD *)v4 + 110)) {
      goto LABEL_307;
    }
  }
  else if ((v6 & 0x20000000000) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x2000000) != 0)
  {
    if ((v6 & 0x2000000) == 0 || self->_cca != *((_DWORD *)v4 + 94)) {
      goto LABEL_307;
    }
  }
  else if ((v6 & 0x2000000) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x200000000) != 0)
  {
    if ((v6 & 0x200000000) == 0 || self->_phyMode != *((_DWORD *)v4 + 102)) {
      goto LABEL_307;
    }
  }
  else if ((v6 & 0x200000000) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x40000) != 0)
  {
    if ((v6 & 0x40000) == 0 || self->_timeOfDay != *((void *)v4 + 40)) {
      goto LABEL_307;
    }
  }
  else if ((v6 & 0x40000) != 0)
  {
    goto LABEL_307;
  }
  locatiouint64_t n = self->_location;
  if ((unint64_t)location | *((void *)v4 + 24))
  {
    if (!-[GEOLocation isEqual:](location, "isEqual:")) {
      goto LABEL_307;
    }
    uint64_t flags = (uint64_t)self->_flags;
    uint64_t v6 = *((void *)v4 + 59);
  }
  if ((flags & 0x400000000000) != 0)
  {
    if ((v6 & 0x400000000000) == 0 || self->_wasCaptiveFlag != *((_DWORD *)v4 + 115)) {
      goto LABEL_307;
    }
  }
  else if ((v6 & 0x400000000000) != 0)
  {
    goto LABEL_307;
  }
  if ((flags & 0x100000000) != 0)
  {
    if ((v6 & 0x100000000) == 0 || self->_networkType != *((_DWORD *)v4 + 101)) {
      goto LABEL_307;
    }
  }
  else if ((v6 & 0x100000000) != 0)
  {
    goto LABEL_307;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_307;
  }
  uint64_t v9 = (uint64_t)self->_flags;
  uint64_t v10 = *((void *)v4 + 59);
  if ((v9 & 0x1000000) != 0)
  {
    if ((v10 & 0x1000000) == 0 || self->_captiveDetermination != *((_DWORD *)v4 + 93)) {
      goto LABEL_307;
    }
  }
  else if ((v10 & 0x1000000) != 0)
  {
    goto LABEL_307;
  }
  if ((v9 & 0x200000) != 0)
  {
    if ((v10 & 0x200000) == 0 || self->_associationLength != *((_DWORD *)v4 + 90)) {
      goto LABEL_307;
    }
  }
  else if ((v10 & 0x200000) != 0)
  {
    goto LABEL_307;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_307;
  }
  uint64_t v11 = (uint64_t)self->_flags;
  uint64_t v12 = *((void *)v4 + 59);
  if ((v11 & 0x80000000) != 0)
  {
    if ((v12 & 0x80000000) == 0 || self->_networkOrigin != *((_DWORD *)v4 + 100)) {
      goto LABEL_307;
    }
  }
  else if ((v12 & 0x80000000) != 0)
  {
    goto LABEL_307;
  }
  if ((v11 & 0x100000000000) != 0)
  {
    if ((v12 & 0x100000000000) == 0 || self->_topDLRate != *((float *)v4 + 113)) {
      goto LABEL_307;
    }
  }
  else if ((v12 & 0x100000000000) != 0)
  {
    goto LABEL_307;
  }
  if ((v11 & 0x8000000000000) != 0)
  {
    if ((v12 & 0x8000000000000) == 0) {
      goto LABEL_307;
    }
    if (self->_lowInternetUL)
    {
      if (!*((unsigned char *)v4 + 468)) {
        goto LABEL_307;
      }
    }
    else if (*((unsigned char *)v4 + 468))
    {
      goto LABEL_307;
    }
  }
  else if ((v12 & 0x8000000000000) != 0)
  {
    goto LABEL_307;
  }
  if ((v11 & 0x4000000000000) != 0)
  {
    if ((v12 & 0x4000000000000) == 0) {
      goto LABEL_307;
    }
    if (self->_lowInternetDL)
    {
      if (!*((unsigned char *)v4 + 467)) {
        goto LABEL_307;
      }
    }
    else if (*((unsigned char *)v4 + 467))
    {
      goto LABEL_307;
    }
  }
  else if ((v12 & 0x4000000000000) != 0)
  {
    goto LABEL_307;
  }
  if ((v11 & 0x2000000000000) != 0)
  {
    if ((v12 & 0x2000000000000) == 0) {
      goto LABEL_307;
    }
    if (self->_isKnownGood)
    {
      if (!*((unsigned char *)v4 + 466)) {
        goto LABEL_307;
      }
    }
    else if (*((unsigned char *)v4 + 466))
    {
      goto LABEL_307;
    }
  }
  else if ((v12 & 0x2000000000000) != 0)
  {
    goto LABEL_307;
  }
  if ((v11 & 0x1000000000000) != 0)
  {
    if ((v12 & 0x1000000000000) == 0) {
      goto LABEL_307;
    }
    if (self->_isEdgeBSS)
    {
      if (!*((unsigned char *)v4 + 465)) {
        goto LABEL_307;
      }
    }
    else if (*((unsigned char *)v4 + 465))
    {
      goto LABEL_307;
    }
  }
  else if ((v12 & 0x1000000000000) != 0)
  {
    goto LABEL_307;
  }
  if ((v11 & 0x400000) != 0)
  {
    if ((v12 & 0x400000) == 0 || self->_associationReason != *((_DWORD *)v4 + 91)) {
      goto LABEL_307;
    }
  }
  else if ((v12 & 0x400000) != 0)
  {
    goto LABEL_307;
  }
  if ((v11 & 0x20000000) != 0)
  {
    if ((v12 & 0x20000000) == 0 || self->_disassociationReason != *((_DWORD *)v4 + 98)) {
      goto LABEL_307;
    }
  }
  else if ((v12 & 0x20000000) != 0)
  {
    goto LABEL_307;
  }
  essMembers = self->_essMembers;
  if ((unint64_t)essMembers | *((void *)v4 + 17)
    && !-[NSMutableArray isEqual:](essMembers, "isEqual:"))
  {
    goto LABEL_307;
  }
  nearbyBSSs = self->_nearbyBSSs;
  if ((unint64_t)nearbyBSSs | *((void *)v4 + 28))
  {
    if (!-[NSMutableArray isEqual:](nearbyBSSs, "isEqual:")) {
      goto LABEL_307;
    }
  }
  feedbacks = self->_feedbacks;
  if ((unint64_t)feedbacks | *((void *)v4 + 20))
  {
    if (!-[NSMutableArray isEqual:](feedbacks, "isEqual:")) {
      goto LABEL_307;
    }
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 22))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_307;
    }
  }
  roamStates = self->_roamStates;
  if ((unint64_t)roamStates | *((void *)v4 + 36))
  {
    if (!-[NSMutableArray isEqual:](roamStates, "isEqual:")) {
      goto LABEL_307;
    }
  }
  speedTests = self->_speedTests;
  if ((unint64_t)speedTests | *((void *)v4 + 38))
  {
    if (!-[NSMutableArray isEqual:](speedTests, "isEqual:")) {
      goto LABEL_307;
    }
  }
  uint64_t v19 = (uint64_t)self->_flags;
  uint64_t v20 = *((void *)v4 + 59);
  if ((v19 & 0x40000000000) != 0)
  {
    if ((v20 & 0x40000000000) == 0 || self->_sslConnectionCount != *((_DWORD *)v4 + 111)) {
      goto LABEL_307;
    }
  }
  else if ((v20 & 0x40000000000) != 0)
  {
    goto LABEL_307;
  }
  if ((v19 & 0x80000000000) != 0)
  {
    if ((v20 & 0x80000000000) == 0 || self->_sslErrorCount != *((_DWORD *)v4 + 112)) {
      goto LABEL_307;
    }
  }
  else if ((v20 & 0x80000000000) != 0)
  {
    goto LABEL_307;
  }
  if ((v19 & 0x100000) != 0)
  {
    if ((v20 & 0x100000) == 0 || self->_apMode != *((_DWORD *)v4 + 89)) {
      goto LABEL_307;
    }
  }
  else if ((v20 & 0x100000) != 0)
  {
    goto LABEL_307;
  }
  if ((v19 & 0x10000000) != 0)
  {
    if ((v20 & 0x10000000) == 0 || self->_clientAssociationSubreason != *((_DWORD *)v4 + 97)) {
      goto LABEL_307;
    }
  }
  else if ((v20 & 0x10000000) != 0)
  {
    goto LABEL_307;
  }
  if ((v19 & 0x200000000000) != 0)
  {
    if ((v20 & 0x200000000000) == 0 || self->_type != *((_DWORD *)v4 + 114)) {
      goto LABEL_307;
    }
  }
  else if ((v20 & 0x200000000000) != 0)
  {
    goto LABEL_307;
  }
  label = self->_label;
  if ((unint64_t)label | *((void *)v4 + 23) && !-[GEOWiFiHarvestLabel isEqual:](label, "isEqual:")) {
    goto LABEL_307;
  }
  passpointInfo = self->_passpointInfo;
  if ((unint64_t)passpointInfo | *((void *)v4 + 32))
  {
    if (!-[GEOWiFiPasspointInfo isEqual:](passpointInfo, "isEqual:")) {
      goto LABEL_307;
    }
  }
  hotspotHelperProviders = self->_hotspotHelperProviders;
  if ((unint64_t)hotspotHelperProviders | *((void *)v4 + 21))
  {
    if (!-[NSMutableArray isEqual:](hotspotHelperProviders, "isEqual:")) {
      goto LABEL_307;
    }
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_307;
  }
  uint64_t v24 = (uint64_t)self->_flags;
  uint64_t v25 = *((void *)v4 + 59);
  if ((v24 & 0x40000000) != 0)
  {
    if ((v25 & 0x40000000) == 0 || self->_dohAvailability != *((_DWORD *)v4 + 99)) {
      goto LABEL_307;
    }
  }
  else if ((v25 & 0x40000000) != 0)
  {
    goto LABEL_307;
  }
  beaconInfo = self->_beaconInfo;
  if (!((unint64_t)beaconInfo | *((void *)v4 + 11))) {
    goto LABEL_302;
  }
  if (!-[GEOWiFiBeaconInfo isEqual:](beaconInfo, "isEqual:"))
  {
LABEL_307:
    BOOL v27 = 0;
    goto LABEL_308;
  }
  uint64_t v24 = (uint64_t)self->_flags;
  uint64_t v25 = *((void *)v4 + 59);
LABEL_302:
  if ((v24 & 0x8000) != 0)
  {
    if ((v25 & 0x8000) == 0 || self->_responsivenessScore != *((double *)v4 + 35)) {
      goto LABEL_307;
    }
    BOOL v27 = 1;
  }
  else
  {
    BOOL v27 = (v25 & 0x8000) == 0;
  }
LABEL_308:

  return v27;
}

- (unint64_t)hash
{
  [(GEOWiFiConnectionQuality *)self readAll:1];
  if ((*(void *)&self->_flags & 0x80000) != 0) {
    unint64_t v112 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v112 = 0;
  }
  NSUInteger v111 = [(NSString *)self->_uniqueID hash];
  uint64_t flags = (uint64_t)self->_flags;
  if ((flags & 0x400) != 0)
  {
    unint64_t v110 = 2654435761u * self->_overAllStay;
    if ((flags & 0x40) != 0)
    {
LABEL_6:
      unint64_t v109 = 2654435761u * self->_faultyStay;
      if ((flags & 0x80) != 0) {
        goto LABEL_7;
      }
      goto LABEL_28;
    }
  }
  else
  {
    unint64_t v110 = 0;
    if ((flags & 0x40) != 0) {
      goto LABEL_6;
    }
  }
  unint64_t v109 = 0;
  if ((flags & 0x80) != 0)
  {
LABEL_7:
    unint64_t v108 = 2654435761u * self->_lowLQMStay;
    if ((flags & 0x100) != 0) {
      goto LABEL_8;
    }
    goto LABEL_29;
  }
LABEL_28:
  unint64_t v108 = 0;
  if ((flags & 0x100) != 0)
  {
LABEL_8:
    unint64_t v107 = 2654435761u * self->_lowqStay;
    if ((flags & 0x200) != 0) {
      goto LABEL_9;
    }
    goto LABEL_30;
  }
LABEL_29:
  unint64_t v107 = 0;
  if ((flags & 0x200) != 0)
  {
LABEL_9:
    unint64_t v106 = 2654435761u * self->_lqmTranCount;
    if ((flags & 0x20000) != 0) {
      goto LABEL_10;
    }
    goto LABEL_31;
  }
LABEL_30:
  unint64_t v106 = 0;
  if ((flags & 0x20000) != 0)
  {
LABEL_10:
    unint64_t v105 = 2654435761u * self->_successfulConnections;
    if ((flags & 0x20) != 0) {
      goto LABEL_11;
    }
    goto LABEL_32;
  }
LABEL_31:
  unint64_t v105 = 0;
  if ((flags & 0x20) != 0)
  {
LABEL_11:
    unint64_t v104 = 2654435761u * self->_failedConnections;
    if ((flags & 0x800) != 0) {
      goto LABEL_12;
    }
    goto LABEL_33;
  }
LABEL_32:
  unint64_t v104 = 0;
  if ((flags & 0x800) != 0)
  {
LABEL_12:
    unint64_t v103 = 2654435761u * self->_packetsIn;
    if ((flags & 0x1000) != 0) {
      goto LABEL_13;
    }
    goto LABEL_34;
  }
LABEL_33:
  unint64_t v103 = 0;
  if ((flags & 0x1000) != 0)
  {
LABEL_13:
    unint64_t v102 = 2654435761u * self->_packetsOut;
    if ((flags & 2) != 0) {
      goto LABEL_14;
    }
    goto LABEL_35;
  }
LABEL_34:
  unint64_t v102 = 0;
  if ((flags & 2) != 0)
  {
LABEL_14:
    unint64_t v101 = 2654435761u * self->_bytesInTotal;
    if ((flags & 8) != 0) {
      goto LABEL_15;
    }
    goto LABEL_36;
  }
LABEL_35:
  unint64_t v101 = 0;
  if ((flags & 8) != 0)
  {
LABEL_15:
    unint64_t v100 = 2654435761u * self->_bytesOutTotal;
    if (flags) {
      goto LABEL_16;
    }
    goto LABEL_37;
  }
LABEL_36:
  unint64_t v100 = 0;
  if (flags)
  {
LABEL_16:
    unint64_t v99 = 2654435761u * self->_bytesInActive;
    if ((flags & 4) != 0) {
      goto LABEL_17;
    }
    goto LABEL_38;
  }
LABEL_37:
  unint64_t v99 = 0;
  if ((flags & 4) != 0)
  {
LABEL_17:
    unint64_t v98 = 2654435761u * self->_bytesOutActive;
    if ((flags & 0x2000) != 0) {
      goto LABEL_18;
    }
    goto LABEL_39;
  }
LABEL_38:
  unint64_t v98 = 0;
  if ((flags & 0x2000) != 0)
  {
LABEL_18:
    unint64_t v97 = 2654435761u * self->_reTxBytes;
    if ((flags & 0x10) != 0) {
      goto LABEL_19;
    }
    goto LABEL_40;
  }
LABEL_39:
  unint64_t v97 = 0;
  if ((flags & 0x10) != 0)
  {
LABEL_19:
    unint64_t v96 = 2654435761u * self->_dataStalls;
    if ((flags & 0x4000) != 0) {
      goto LABEL_20;
    }
    goto LABEL_41;
  }
LABEL_40:
  unint64_t v96 = 0;
  if ((flags & 0x4000) != 0)
  {
LABEL_20:
    unint64_t v95 = 2654435761u * self->_receivedDupes;
    if ((flags & 0x10000) != 0) {
      goto LABEL_21;
    }
LABEL_42:
    unint64_t v94 = 0;
    if ((flags & 0x2000000000) != 0) {
      goto LABEL_22;
    }
LABEL_43:
    unint64_t v8 = 0;
    goto LABEL_46;
  }
LABEL_41:
  unint64_t v95 = 0;
  if ((flags & 0x10000) == 0) {
    goto LABEL_42;
  }
LABEL_21:
  unint64_t v94 = 2654435761u * self->_rxOutOfOrderBytes;
  if ((flags & 0x2000000000) == 0) {
    goto LABEL_43;
  }
LABEL_22:
  roundTripTimeMiuint64_t n = self->_roundTripTimeMin;
  double v5 = roundTripTimeMin;
  if (roundTripTimeMin < 0.0) {
    double v5 = -roundTripTimeMin;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_46:
  if ((flags & 0x800000000) != 0)
  {
    float roundTripTimeAvg = self->_roundTripTimeAvg;
    double v11 = roundTripTimeAvg;
    if (roundTripTimeAvg < 0.0) {
      double v11 = -roundTripTimeAvg;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((flags & 0x8000000000) != 0)
  {
    float roundTripTimeVar = self->_roundTripTimeVar;
    double v16 = roundTripTimeVar;
    if (roundTripTimeVar < 0.0) {
      double v16 = -roundTripTimeVar;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if ((flags & 0x1000000000) != 0)
  {
    float roundTripTimeMinActive = self->_roundTripTimeMinActive;
    double v21 = roundTripTimeMinActive;
    if (roundTripTimeMinActive < 0.0) {
      double v21 = -roundTripTimeMinActive;
    }
    long double v22 = floor(v21 + 0.5);
    double v23 = (v21 - v22) * 1.84467441e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  if ((flags & 0x400000000) != 0)
  {
    float roundTripTimeAvgActive = self->_roundTripTimeAvgActive;
    double v26 = roundTripTimeAvgActive;
    if (roundTripTimeAvgActive < 0.0) {
      double v26 = -roundTripTimeAvgActive;
    }
    long double v27 = floor(v26 + 0.5);
    double v28 = (v26 - v27) * 1.84467441e19;
    unint64_t v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0) {
        v24 += (unint64_t)v28;
      }
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    unint64_t v24 = 0;
  }
  if ((flags & 0x4000000000) != 0)
  {
    float roundTripTimeVarActive = self->_roundTripTimeVarActive;
    double v31 = roundTripTimeVarActive;
    if (roundTripTimeVarActive < 0.0) {
      double v31 = -roundTripTimeVarActive;
    }
    long double v32 = floor(v31 + 0.5);
    double v33 = (v31 - v32) * 1.84467441e19;
    unint64_t v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0) {
        v29 += (unint64_t)v33;
      }
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    unint64_t v29 = 0;
  }
  if ((flags & 0x800000000000) != 0)
  {
    uint64_t v91 = 2654435761 * self->_hotspot20;
    if ((flags & 0x800000) != 0)
    {
LABEL_88:
      uint64_t v90 = 2654435761 * self->_band;
      if ((flags & 0x8000000) != 0) {
        goto LABEL_89;
      }
      goto LABEL_97;
    }
  }
  else
  {
    uint64_t v91 = 0;
    if ((flags & 0x800000) != 0) {
      goto LABEL_88;
    }
  }
  uint64_t v90 = 0;
  if ((flags & 0x8000000) != 0)
  {
LABEL_89:
    uint64_t v89 = 2654435761 * self->_channel;
    if ((flags & 0x4000000) != 0) {
      goto LABEL_90;
    }
    goto LABEL_98;
  }
LABEL_97:
  uint64_t v89 = 0;
  if ((flags & 0x4000000) != 0)
  {
LABEL_90:
    uint64_t v88 = 2654435761 * self->_channelWidth;
    if ((flags & 0x10000000000) != 0) {
      goto LABEL_91;
    }
    goto LABEL_99;
  }
LABEL_98:
  uint64_t v88 = 0;
  if ((flags & 0x10000000000) != 0)
  {
LABEL_91:
    uint64_t v87 = 2654435761 * self->_rssi;
    if ((flags & 0x20000000000) != 0) {
      goto LABEL_92;
    }
    goto LABEL_100;
  }
LABEL_99:
  uint64_t v87 = 0;
  if ((flags & 0x20000000000) != 0)
  {
LABEL_92:
    uint64_t v86 = 2654435761 * self->_snr;
    if ((flags & 0x2000000) != 0) {
      goto LABEL_93;
    }
LABEL_101:
    uint64_t v85 = 0;
    if ((flags & 0x200000000) != 0) {
      goto LABEL_94;
    }
    goto LABEL_102;
  }
LABEL_100:
  uint64_t v86 = 0;
  if ((flags & 0x2000000) == 0) {
    goto LABEL_101;
  }
LABEL_93:
  uint64_t v85 = 2654435761 * self->_cca;
  if ((flags & 0x200000000) != 0)
  {
LABEL_94:
    uint64_t v84 = 2654435761 * self->_phyMode;
    goto LABEL_103;
  }
LABEL_102:
  uint64_t v84 = 0;
LABEL_103:
  unint64_t v92 = v29;
  if ((flags & 0x40000) != 0) {
    unint64_t v83 = 2654435761u * self->_timeOfDay;
  }
  else {
    unint64_t v83 = 0;
  }
  unint64_t v82 = [(GEOLocation *)self->_location hash];
  uint64_t v34 = (uint64_t)self->_flags;
  if ((v34 & 0x400000000000) != 0)
  {
    uint64_t v81 = 2654435761 * self->_wasCaptiveFlag;
    if ((v34 & 0x100000000) != 0) {
      goto LABEL_108;
    }
  }
  else
  {
    uint64_t v81 = 0;
    if ((v34 & 0x100000000) != 0)
    {
LABEL_108:
      uint64_t v80 = 2654435761 * self->_networkType;
      goto LABEL_111;
    }
  }
  uint64_t v80 = 0;
LABEL_111:
  uint64_t v79 = PBRepeatedInt32Hash();
  uint64_t v35 = (uint64_t)self->_flags;
  if ((v35 & 0x1000000) != 0)
  {
    uint64_t v78 = 2654435761 * self->_captiveDetermination;
    if ((v35 & 0x200000) != 0) {
      goto LABEL_113;
    }
  }
  else
  {
    uint64_t v78 = 0;
    if ((v35 & 0x200000) != 0)
    {
LABEL_113:
      uint64_t v77 = 2654435761 * self->_associationLength;
      goto LABEL_116;
    }
  }
  uint64_t v77 = 0;
LABEL_116:
  uint64_t v76 = PBRepeatedInt32Hash();
  uint64_t v36 = (uint64_t)self->_flags;
  if ((v36 & 0x80000000) != 0)
  {
    uint64_t v75 = 2654435761 * self->_networkOrigin;
    if ((v36 & 0x100000000000) != 0) {
      goto LABEL_118;
    }
LABEL_123:
    unint64_t v41 = 0;
    goto LABEL_126;
  }
  uint64_t v75 = 0;
  if ((v36 & 0x100000000000) == 0) {
    goto LABEL_123;
  }
LABEL_118:
  float topDLRate = self->_topDLRate;
  double v38 = topDLRate;
  if (topDLRate < 0.0) {
    double v38 = -topDLRate;
  }
  long double v39 = floor(v38 + 0.5);
  double v40 = (v38 - v39) * 1.84467441e19;
  unint64_t v41 = 2654435761u * (unint64_t)fmod(v39, 1.84467441e19);
  if (v40 >= 0.0)
  {
    if (v40 > 0.0) {
      v41 += (unint64_t)v40;
    }
  }
  else
  {
    v41 -= (unint64_t)fabs(v40);
  }
LABEL_126:
  if ((v36 & 0x8000000000000) != 0)
  {
    uint64_t v73 = 2654435761 * self->_lowInternetUL;
    if ((v36 & 0x4000000000000) != 0)
    {
LABEL_128:
      uint64_t v72 = 2654435761 * self->_lowInternetDL;
      if ((v36 & 0x2000000000000) != 0) {
        goto LABEL_129;
      }
      goto LABEL_134;
    }
  }
  else
  {
    uint64_t v73 = 0;
    if ((v36 & 0x4000000000000) != 0) {
      goto LABEL_128;
    }
  }
  uint64_t v72 = 0;
  if ((v36 & 0x2000000000000) != 0)
  {
LABEL_129:
    uint64_t v71 = 2654435761 * self->_isKnownGood;
    if ((v36 & 0x1000000000000) != 0) {
      goto LABEL_130;
    }
LABEL_135:
    uint64_t v70 = 0;
    if ((v36 & 0x400000) != 0) {
      goto LABEL_131;
    }
    goto LABEL_136;
  }
LABEL_134:
  uint64_t v71 = 0;
  if ((v36 & 0x1000000000000) == 0) {
    goto LABEL_135;
  }
LABEL_130:
  uint64_t v70 = 2654435761 * self->_isEdgeBSS;
  if ((v36 & 0x400000) != 0)
  {
LABEL_131:
    uint64_t v69 = 2654435761 * self->_associationReason;
    goto LABEL_137;
  }
LABEL_136:
  uint64_t v69 = 0;
LABEL_137:
  unint64_t v74 = v41;
  if ((v36 & 0x20000000) != 0) {
    uint64_t v68 = 2654435761 * self->_disassociationReason;
  }
  else {
    uint64_t v68 = 0;
  }
  uint64_t v67 = [(NSMutableArray *)self->_essMembers hash];
  uint64_t v66 = [(NSMutableArray *)self->_nearbyBSSs hash];
  uint64_t v65 = [(NSMutableArray *)self->_feedbacks hash];
  NSUInteger v64 = [(NSString *)self->_identifier hash];
  uint64_t v63 = [(NSMutableArray *)self->_roamStates hash];
  uint64_t v62 = [(NSMutableArray *)self->_speedTests hash];
  uint64_t v42 = (uint64_t)self->_flags;
  if ((v42 & 0x40000000000) != 0)
  {
    uint64_t v61 = 2654435761 * self->_sslConnectionCount;
    if ((v42 & 0x80000000000) != 0)
    {
LABEL_142:
      uint64_t v60 = 2654435761 * self->_sslErrorCount;
      if ((v42 & 0x100000) != 0) {
        goto LABEL_143;
      }
LABEL_147:
      uint64_t v59 = 0;
      if ((v42 & 0x10000000) != 0) {
        goto LABEL_144;
      }
      goto LABEL_148;
    }
  }
  else
  {
    uint64_t v61 = 0;
    if ((v42 & 0x80000000000) != 0) {
      goto LABEL_142;
    }
  }
  uint64_t v60 = 0;
  if ((v42 & 0x100000) == 0) {
    goto LABEL_147;
  }
LABEL_143:
  uint64_t v59 = 2654435761 * self->_apMode;
  if ((v42 & 0x10000000) != 0)
  {
LABEL_144:
    uint64_t v58 = 2654435761 * self->_clientAssociationSubreason;
    goto LABEL_149;
  }
LABEL_148:
  uint64_t v58 = 0;
LABEL_149:
  unint64_t v93 = v24;
  unint64_t v43 = v19;
  if ((v42 & 0x200000000000) != 0) {
    uint64_t v57 = 2654435761 * self->_type;
  }
  else {
    uint64_t v57 = 0;
  }
  unint64_t v56 = [(GEOWiFiHarvestLabel *)self->_label hash];
  unint64_t v55 = [(GEOWiFiPasspointInfo *)self->_passpointInfo hash];
  uint64_t v53 = [(NSMutableArray *)self->_hotspotHelperProviders hash];
  uint64_t v44 = PBRepeatedInt32Hash();
  if ((*(void *)&self->_flags & 0x40000000) != 0) {
    uint64_t v45 = 2654435761 * self->_dohAvailability;
  }
  else {
    uint64_t v45 = 0;
  }
  unint64_t v46 = [(GEOWiFiBeaconInfo *)self->_beaconInfo hash];
  if ((*(void *)&self->_flags & 0x8000) != 0)
  {
    double responsivenessScore = self->_responsivenessScore;
    double v49 = -responsivenessScore;
    if (responsivenessScore >= 0.0) {
      double v49 = self->_responsivenessScore;
    }
    long double v50 = floor(v49 + 0.5);
    double v51 = (v49 - v50) * 1.84467441e19;
    unint64_t v47 = 2654435761u * (unint64_t)fmod(v50, 1.84467441e19);
    if (v51 >= 0.0)
    {
      if (v51 > 0.0) {
        v47 += (unint64_t)v51;
      }
    }
    else
    {
      v47 -= (unint64_t)fabs(v51);
    }
  }
  else
  {
    unint64_t v47 = 0;
  }
  return v111 ^ v112 ^ v110 ^ v109 ^ v108 ^ v107 ^ v106 ^ v105 ^ v104 ^ v103 ^ v102 ^ v101 ^ v100 ^ v99 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v8 ^ v9 ^ v14 ^ v43 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v44 ^ v45 ^ v46 ^ v47;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v4 = (char *)a3;
  [v4 readAll:0];
  if ((*((void *)v4 + 59) & 0x80000) != 0)
  {
    self->_timestamp = *((void *)v4 + 41);
    *(void *)&self->_flags |= 0x80000uLL;
  }
  if (*((void *)v4 + 42)) {
    -[GEOWiFiConnectionQuality setUniqueID:](self, "setUniqueID:");
  }
  double v5 = (uint64_t *)(v4 + 472);
  uint64_t v6 = *((void *)v4 + 59);
  if ((v6 & 0x400) != 0)
  {
    self->_overAllStay = *((void *)v4 + 29);
    *(void *)&self->_flags |= 0x400uLL;
    uint64_t v6 = *v5;
    if ((*v5 & 0x40) == 0)
    {
LABEL_7:
      if ((v6 & 0x80) == 0) {
        goto LABEL_8;
      }
      goto LABEL_43;
    }
  }
  else if ((v6 & 0x40) == 0)
  {
    goto LABEL_7;
  }
  self->_faultyStay = *((void *)v4 + 19);
  *(void *)&self->_flags |= 0x40uLL;
  uint64_t v6 = *((void *)v4 + 59);
  if ((v6 & 0x80) == 0)
  {
LABEL_8:
    if ((v6 & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_lowLQMStay = *((void *)v4 + 25);
  *(void *)&self->_flags |= 0x80uLL;
  uint64_t v6 = *((void *)v4 + 59);
  if ((v6 & 0x100) == 0)
  {
LABEL_9:
    if ((v6 & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_lowqStay = *((void *)v4 + 26);
  *(void *)&self->_flags |= 0x100uLL;
  uint64_t v6 = *((void *)v4 + 59);
  if ((v6 & 0x200) == 0)
  {
LABEL_10:
    if ((v6 & 0x20000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_46;
  }
LABEL_45:
  self->_lqmTranCount = *((void *)v4 + 27);
  *(void *)&self->_flags |= 0x200uLL;
  uint64_t v6 = *((void *)v4 + 59);
  if ((v6 & 0x20000) == 0)
  {
LABEL_11:
    if ((v6 & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_47;
  }
LABEL_46:
  self->_successfulConnections = *((void *)v4 + 39);
  *(void *)&self->_flags |= 0x20000uLL;
  uint64_t v6 = *((void *)v4 + 59);
  if ((v6 & 0x20) == 0)
  {
LABEL_12:
    if ((v6 & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_48;
  }
LABEL_47:
  self->_failedConnections = *((void *)v4 + 18);
  *(void *)&self->_flags |= 0x20uLL;
  uint64_t v6 = *((void *)v4 + 59);
  if ((v6 & 0x800) == 0)
  {
LABEL_13:
    if ((v6 & 0x1000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_49;
  }
LABEL_48:
  self->_packetsIuint64_t n = *((void *)v4 + 30);
  *(void *)&self->_flags |= 0x800uLL;
  uint64_t v6 = *((void *)v4 + 59);
  if ((v6 & 0x1000) == 0)
  {
LABEL_14:
    if ((v6 & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_50;
  }
LABEL_49:
  self->_packetsOut = *((void *)v4 + 31);
  *(void *)&self->_flags |= 0x1000uLL;
  uint64_t v6 = *((void *)v4 + 59);
  if ((v6 & 2) == 0)
  {
LABEL_15:
    if ((v6 & 8) == 0) {
      goto LABEL_16;
    }
    goto LABEL_51;
  }
LABEL_50:
  self->_bytesInTotal = *((void *)v4 + 13);
  *(void *)&self->_flags |= 2uLL;
  uint64_t v6 = *((void *)v4 + 59);
  if ((v6 & 8) == 0)
  {
LABEL_16:
    if ((v6 & 1) == 0) {
      goto LABEL_17;
    }
    goto LABEL_52;
  }
LABEL_51:
  self->_bytesOutTotal = *((void *)v4 + 15);
  *(void *)&self->_flags |= 8uLL;
  uint64_t v6 = *((void *)v4 + 59);
  if ((v6 & 1) == 0)
  {
LABEL_17:
    if ((v6 & 4) == 0) {
      goto LABEL_18;
    }
    goto LABEL_53;
  }
LABEL_52:
  self->_bytesInActive = *((void *)v4 + 12);
  *(void *)&self->_flags |= 1uLL;
  uint64_t v6 = *((void *)v4 + 59);
  if ((v6 & 4) == 0)
  {
LABEL_18:
    if ((v6 & 0x2000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_54;
  }
LABEL_53:
  self->_bytesOutActive = *((void *)v4 + 14);
  *(void *)&self->_flags |= 4uLL;
  uint64_t v6 = *((void *)v4 + 59);
  if ((v6 & 0x2000) == 0)
  {
LABEL_19:
    if ((v6 & 0x10) == 0) {
      goto LABEL_20;
    }
    goto LABEL_55;
  }
LABEL_54:
  self->_reTxBytes = *((void *)v4 + 33);
  *(void *)&self->_flags |= 0x2000uLL;
  uint64_t v6 = *((void *)v4 + 59);
  if ((v6 & 0x10) == 0)
  {
LABEL_20:
    if ((v6 & 0x4000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_56;
  }
LABEL_55:
  self->_dataStalls = *((void *)v4 + 16);
  *(void *)&self->_flags |= 0x10uLL;
  uint64_t v6 = *((void *)v4 + 59);
  if ((v6 & 0x4000) == 0)
  {
LABEL_21:
    if ((v6 & 0x10000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_57;
  }
LABEL_56:
  self->_receivedDupes = *((void *)v4 + 34);
  *(void *)&self->_flags |= 0x4000uLL;
  uint64_t v6 = *((void *)v4 + 59);
  if ((v6 & 0x10000) == 0)
  {
LABEL_22:
    if ((v6 & 0x2000000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_58;
  }
LABEL_57:
  self->_rxOutOfOrderBytes = *((void *)v4 + 37);
  *(void *)&self->_flags |= 0x10000uLL;
  uint64_t v6 = *((void *)v4 + 59);
  if ((v6 & 0x2000000000) == 0)
  {
LABEL_23:
    if ((v6 & 0x800000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_59;
  }
LABEL_58:
  self->_roundTripTimeMiuint64_t n = *((float *)v4 + 106);
  *(void *)&self->_flags |= 0x2000000000uLL;
  uint64_t v6 = *((void *)v4 + 59);
  if ((v6 & 0x800000000) == 0)
  {
LABEL_24:
    if ((v6 & 0x8000000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_60;
  }
LABEL_59:
  self->_float roundTripTimeAvg = *((float *)v4 + 104);
  *(void *)&self->_flags |= 0x800000000uLL;
  uint64_t v6 = *((void *)v4 + 59);
  if ((v6 & 0x8000000000) == 0)
  {
LABEL_25:
    if ((v6 & 0x1000000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_61;
  }
LABEL_60:
  self->_float roundTripTimeVar = *((float *)v4 + 108);
  *(void *)&self->_flags |= 0x8000000000uLL;
  uint64_t v6 = *((void *)v4 + 59);
  if ((v6 & 0x1000000000) == 0)
  {
LABEL_26:
    if ((v6 & 0x400000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_62;
  }
LABEL_61:
  self->_float roundTripTimeMinActive = *((float *)v4 + 105);
  *(void *)&self->_flags |= 0x1000000000uLL;
  uint64_t v6 = *((void *)v4 + 59);
  if ((v6 & 0x400000000) == 0)
  {
LABEL_27:
    if ((v6 & 0x4000000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_63;
  }
LABEL_62:
  self->_float roundTripTimeAvgActive = *((float *)v4 + 103);
  *(void *)&self->_flags |= 0x400000000uLL;
  uint64_t v6 = *((void *)v4 + 59);
  if ((v6 & 0x4000000000) == 0)
  {
LABEL_28:
    if ((v6 & 0x800000000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_64;
  }
LABEL_63:
  self->_float roundTripTimeVarActive = *((float *)v4 + 107);
  *(void *)&self->_flags |= 0x4000000000uLL;
  uint64_t v6 = *((void *)v4 + 59);
  if ((v6 & 0x800000000000) == 0)
  {
LABEL_29:
    if ((v6 & 0x800000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_65;
  }
LABEL_64:
  self->_hotspot20 = v4[464];
  *(void *)&self->_flags |= 0x800000000000uLL;
  uint64_t v6 = *((void *)v4 + 59);
  if ((v6 & 0x800000) == 0)
  {
LABEL_30:
    if ((v6 & 0x8000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_66;
  }
LABEL_65:
  self->_band = *((_DWORD *)v4 + 92);
  *(void *)&self->_flags |= 0x800000uLL;
  uint64_t v6 = *((void *)v4 + 59);
  if ((v6 & 0x8000000) == 0)
  {
LABEL_31:
    if ((v6 & 0x4000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_67;
  }
LABEL_66:
  self->_channel = *((_DWORD *)v4 + 96);
  *(void *)&self->_flags |= 0x8000000uLL;
  uint64_t v6 = *((void *)v4 + 59);
  if ((v6 & 0x4000000) == 0)
  {
LABEL_32:
    if ((v6 & 0x10000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_68;
  }
LABEL_67:
  self->_channelWidth = *((_DWORD *)v4 + 95);
  *(void *)&self->_flags |= 0x4000000uLL;
  uint64_t v6 = *((void *)v4 + 59);
  if ((v6 & 0x10000000000) == 0)
  {
LABEL_33:
    if ((v6 & 0x20000000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_69;
  }
LABEL_68:
  self->_rssuint64_t i = *((_DWORD *)v4 + 109);
  *(void *)&self->_flags |= 0x10000000000uLL;
  uint64_t v6 = *((void *)v4 + 59);
  if ((v6 & 0x20000000000) == 0)
  {
LABEL_34:
    if ((v6 & 0x2000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_70;
  }
LABEL_69:
  self->_snr = *((_DWORD *)v4 + 110);
  *(void *)&self->_flags |= 0x20000000000uLL;
  uint64_t v6 = *((void *)v4 + 59);
  if ((v6 & 0x2000000) == 0)
  {
LABEL_35:
    if ((v6 & 0x200000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_71;
  }
LABEL_70:
  self->_cca = *((_DWORD *)v4 + 94);
  *(void *)&self->_flags |= 0x2000000uLL;
  uint64_t v6 = *((void *)v4 + 59);
  if ((v6 & 0x200000000) == 0)
  {
LABEL_36:
    if ((v6 & 0x40000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
LABEL_71:
  self->_phyMode = *((_DWORD *)v4 + 102);
  *(void *)&self->_flags |= 0x200000000uLL;
  if ((*((void *)v4 + 59) & 0x40000) != 0)
  {
LABEL_37:
    self->_timeOfDay = *((void *)v4 + 40);
    *(void *)&self->_flags |= 0x40000uLL;
  }
LABEL_38:
  locatiouint64_t n = self->_location;
  uint64_t v8 = *((void *)v4 + 24);
  if (location)
  {
    if (v8) {
      -[GEOLocation mergeFrom:](location, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[GEOWiFiConnectionQuality setLocation:](self, "setLocation:");
  }
  uint64_t v9 = *((void *)v4 + 59);
  if ((v9 & 0x400000000000) != 0)
  {
    self->_wasCaptiveFlag = *((_DWORD *)v4 + 115);
    *(void *)&self->_flags |= 0x400000000000uLL;
    uint64_t v9 = *((void *)v4 + 59);
  }
  if ((v9 & 0x100000000) != 0)
  {
    self->_networkType = *((_DWORD *)v4 + 101);
    *(void *)&self->_flags |= 0x100000000uLL;
  }
  uint64_t v10 = [v4 traitsCount];
  if (v10)
  {
    uint64_t v11 = v10;
    for (uint64_t i = 0; i != v11; ++i)
      -[GEOWiFiConnectionQuality addTraits:](self, "addTraits:", [v4 traitsAtIndex:i]);
  }
  uint64_t v13 = *((void *)v4 + 59);
  if ((v13 & 0x1000000) != 0)
  {
    self->_captiveDeterminatiouint64_t n = *((_DWORD *)v4 + 93);
    *(void *)&self->_flags |= 0x1000000uLL;
    uint64_t v13 = *((void *)v4 + 59);
  }
  if ((v13 & 0x200000) != 0)
  {
    self->_associationLength = *((_DWORD *)v4 + 90);
    *(void *)&self->_flags |= 0x200000uLL;
  }
  uint64_t v14 = [v4 authTraitsCount];
  if (v14)
  {
    uint64_t v15 = v14;
    for (uint64_t j = 0; j != v15; ++j)
      -[GEOWiFiConnectionQuality addAuthTraits:](self, "addAuthTraits:", [v4 authTraitsAtIndex:j]);
  }
  long double v17 = (uint64_t *)(v4 + 472);
  uint64_t v18 = *((void *)v4 + 59);
  if ((v18 & 0x80000000) != 0)
  {
    self->_networkOrigiuint64_t n = *((_DWORD *)v4 + 100);
    *(void *)&self->_flags |= 0x80000000uLL;
    uint64_t v18 = *v17;
    if ((*v17 & 0x100000000000) == 0)
    {
LABEL_91:
      if ((v18 & 0x8000000000000) == 0) {
        goto LABEL_92;
      }
      goto LABEL_146;
    }
  }
  else if ((v18 & 0x100000000000) == 0)
  {
    goto LABEL_91;
  }
  self->_float topDLRate = *((float *)v4 + 113);
  *(void *)&self->_flags |= 0x100000000000uLL;
  uint64_t v18 = *((void *)v4 + 59);
  if ((v18 & 0x8000000000000) == 0)
  {
LABEL_92:
    if ((v18 & 0x4000000000000) == 0) {
      goto LABEL_93;
    }
    goto LABEL_147;
  }
LABEL_146:
  self->_lowInternetUL = v4[468];
  *(void *)&self->_flags |= 0x8000000000000uLL;
  uint64_t v18 = *((void *)v4 + 59);
  if ((v18 & 0x4000000000000) == 0)
  {
LABEL_93:
    if ((v18 & 0x2000000000000) == 0) {
      goto LABEL_94;
    }
    goto LABEL_148;
  }
LABEL_147:
  self->_lowInternetDL = v4[467];
  *(void *)&self->_flags |= 0x4000000000000uLL;
  uint64_t v18 = *((void *)v4 + 59);
  if ((v18 & 0x2000000000000) == 0)
  {
LABEL_94:
    if ((v18 & 0x1000000000000) == 0) {
      goto LABEL_95;
    }
    goto LABEL_149;
  }
LABEL_148:
  self->_isKnownGood = v4[466];
  *(void *)&self->_flags |= 0x2000000000000uLL;
  uint64_t v18 = *((void *)v4 + 59);
  if ((v18 & 0x1000000000000) == 0)
  {
LABEL_95:
    if ((v18 & 0x400000) == 0) {
      goto LABEL_96;
    }
    goto LABEL_150;
  }
LABEL_149:
  self->_isEdgeBSS = v4[465];
  *(void *)&self->_flags |= 0x1000000000000uLL;
  uint64_t v18 = *((void *)v4 + 59);
  if ((v18 & 0x400000) == 0)
  {
LABEL_96:
    if ((v18 & 0x20000000) == 0) {
      goto LABEL_98;
    }
    goto LABEL_97;
  }
LABEL_150:
  self->_associationReasouint64_t n = *((_DWORD *)v4 + 91);
  *(void *)&self->_flags |= 0x400000uLL;
  if ((*((void *)v4 + 59) & 0x20000000) != 0)
  {
LABEL_97:
    self->_disassociationReasouint64_t n = *((_DWORD *)v4 + 98);
    *(void *)&self->_flags |= 0x20000000uLL;
  }
LABEL_98:
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v19 = *((id *)v4 + 17);
  uint64_t v20 = [v19 countByEnumeratingWithState:&v80 objects:v89 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v81;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v81 != v22) {
          objc_enumerationMutation(v19);
        }
        [(GEOWiFiConnectionQuality *)self addEssMembers:*(void *)(*((void *)&v80 + 1) + 8 * k)];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v80 objects:v89 count:16];
    }
    while (v21);
  }

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v24 = *((id *)v4 + 28);
  uint64_t v25 = [v24 countByEnumeratingWithState:&v76 objects:v88 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v77;
    do
    {
      for (uint64_t m = 0; m != v26; ++m)
      {
        if (*(void *)v77 != v27) {
          objc_enumerationMutation(v24);
        }
        [(GEOWiFiConnectionQuality *)self addNearbyBSS:*(void *)(*((void *)&v76 + 1) + 8 * m)];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v76 objects:v88 count:16];
    }
    while (v26);
  }

  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v29 = *((id *)v4 + 20);
  uint64_t v30 = [v29 countByEnumeratingWithState:&v72 objects:v87 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v73;
    do
    {
      for (uint64_t n = 0; n != v31; ++n)
      {
        if (*(void *)v73 != v32) {
          objc_enumerationMutation(v29);
        }
        [(GEOWiFiConnectionQuality *)self addFeedback:*(void *)(*((void *)&v72 + 1) + 8 * n)];
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v72 objects:v87 count:16];
    }
    while (v31);
  }

  if (*((void *)v4 + 22)) {
    -[GEOWiFiConnectionQuality setIdentifier:](self, "setIdentifier:");
  }
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v34 = *((id *)v4 + 36);
  uint64_t v35 = [v34 countByEnumeratingWithState:&v68 objects:v86 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v69;
    do
    {
      for (iuint64_t i = 0; ii != v36; ++ii)
      {
        if (*(void *)v69 != v37) {
          objc_enumerationMutation(v34);
        }
        [(GEOWiFiConnectionQuality *)self addRoamStates:*(void *)(*((void *)&v68 + 1) + 8 * ii)];
      }
      uint64_t v36 = [v34 countByEnumeratingWithState:&v68 objects:v86 count:16];
    }
    while (v36);
  }

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v39 = *((id *)v4 + 38);
  uint64_t v40 = [v39 countByEnumeratingWithState:&v64 objects:v85 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v65;
    do
    {
      for (juint64_t j = 0; jj != v41; ++jj)
      {
        if (*(void *)v65 != v42) {
          objc_enumerationMutation(v39);
        }
        [(GEOWiFiConnectionQuality *)self addSpeedTest:*(void *)(*((void *)&v64 + 1) + 8 * jj)];
      }
      uint64_t v41 = [v39 countByEnumeratingWithState:&v64 objects:v85 count:16];
    }
    while (v41);
  }

  uint64_t v44 = (uint64_t *)(v4 + 472);
  uint64_t v45 = *((void *)v4 + 59);
  if ((v45 & 0x40000000000) != 0)
  {
    self->_sslConnectionCount = *((_DWORD *)v4 + 111);
    *(void *)&self->_flags |= 0x40000000000uLL;
    uint64_t v45 = *v44;
    if ((*v44 & 0x80000000000) == 0)
    {
LABEL_137:
      if ((v45 & 0x100000) == 0) {
        goto LABEL_138;
      }
      goto LABEL_154;
    }
  }
  else if ((v45 & 0x80000000000) == 0)
  {
    goto LABEL_137;
  }
  self->_sslErrorCount = *((_DWORD *)v4 + 112);
  *(void *)&self->_flags |= 0x80000000000uLL;
  uint64_t v45 = *((void *)v4 + 59);
  if ((v45 & 0x100000) == 0)
  {
LABEL_138:
    if ((v45 & 0x10000000) == 0) {
      goto LABEL_139;
    }
    goto LABEL_155;
  }
LABEL_154:
  self->_apMode = *((_DWORD *)v4 + 89);
  *(void *)&self->_flags |= 0x100000uLL;
  uint64_t v45 = *((void *)v4 + 59);
  if ((v45 & 0x10000000) == 0)
  {
LABEL_139:
    if ((v45 & 0x200000000000) == 0) {
      goto LABEL_141;
    }
    goto LABEL_140;
  }
LABEL_155:
  self->_clientAssociationSubreasouint64_t n = *((_DWORD *)v4 + 97);
  *(void *)&self->_flags |= 0x10000000uLL;
  if ((*((void *)v4 + 59) & 0x200000000000) != 0)
  {
LABEL_140:
    self->_type = *((_DWORD *)v4 + 114);
    *(void *)&self->_flags |= 0x200000000000uLL;
  }
LABEL_141:
  label = self->_label;
  uint64_t v47 = *((void *)v4 + 23);
  if (label)
  {
    if (v47) {
      -[GEOWiFiHarvestLabel mergeFrom:](label, "mergeFrom:");
    }
  }
  else if (v47)
  {
    -[GEOWiFiConnectionQuality setLabel:](self, "setLabel:");
  }
  passpointInfo = self->_passpointInfo;
  uint64_t v49 = *((void *)v4 + 32);
  if (passpointInfo)
  {
    if (v49) {
      -[GEOWiFiPasspointInfo mergeFrom:](passpointInfo, "mergeFrom:");
    }
  }
  else if (v49)
  {
    -[GEOWiFiConnectionQuality setPasspointInfo:](self, "setPasspointInfo:");
  }
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v50 = *((id *)v4 + 21);
  uint64_t v51 = [v50 countByEnumeratingWithState:&v60 objects:v84 count:16];
  if (v51)
  {
    uint64_t v52 = v51;
    uint64_t v53 = *(void *)v61;
    do
    {
      for (kuint64_t k = 0; kk != v52; ++kk)
      {
        if (*(void *)v61 != v53) {
          objc_enumerationMutation(v50);
        }
        -[GEOWiFiConnectionQuality addHotspotHelperProvider:](self, "addHotspotHelperProvider:", *(void *)(*((void *)&v60 + 1) + 8 * kk), (void)v60);
      }
      uint64_t v52 = [v50 countByEnumeratingWithState:&v60 objects:v84 count:16];
    }
    while (v52);
  }

  uint64_t v55 = [v4 nameAttributesCount];
  if (v55)
  {
    uint64_t v56 = v55;
    for (muint64_t m = 0; mm != v56; ++mm)
      -[GEOWiFiConnectionQuality addNameAttributes:](self, "addNameAttributes:", objc_msgSend(v4, "nameAttributesAtIndex:", mm, (void)v60));
  }
  if ((*((void *)v4 + 59) & 0x40000000) != 0)
  {
    self->_dohAvailability = *((_DWORD *)v4 + 99);
    *(void *)&self->_flags |= 0x40000000uLL;
  }
  beaconInfo = self->_beaconInfo;
  uint64_t v59 = *((void *)v4 + 11);
  if (beaconInfo)
  {
    if (v59) {
      -[GEOWiFiBeaconInfo mergeFrom:](beaconInfo, "mergeFrom:");
    }
  }
  else if (v59)
  {
    -[GEOWiFiConnectionQuality setBeaconInfo:](self, "setBeaconInfo:");
  }
  if ((*((void *)v4 + 59) & 0x8000) != 0)
  {
    self->_double responsivenessScore = *((double *)v4 + 35);
    *(void *)&self->_flags |= 0x8000uLL;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_speedTests, 0);
  objc_storeStrong((id *)&self->_roamStates, 0);
  objc_storeStrong((id *)&self->_passpointInfo, 0);
  objc_storeStrong((id *)&self->_nearbyBSSs, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_hotspotHelperProviders, 0);
  objc_storeStrong((id *)&self->_feedbacks, 0);
  objc_storeStrong((id *)&self->_essMembers, 0);
  objc_storeStrong((id *)&self->_beaconInfo, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end