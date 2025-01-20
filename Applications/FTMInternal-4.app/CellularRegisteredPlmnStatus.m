@interface CellularRegisteredPlmnStatus
+ (Class)ehplmnListType;
+ (Class)eplmnListType;
+ (Class)homeSidNidListType;
- (BOOL)hasHMCC;
- (BOOL)hasHMNC;
- (BOOL)hasNumSubs;
- (BOOL)hasPlmn;
- (BOOL)hasPsPref;
- (BOOL)hasRMCC;
- (BOOL)hasRMNC;
- (BOOL)hasRNID;
- (BOOL)hasRSID;
- (BOOL)hasRoamStatus;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)plmn;
- (NSMutableArray)ehplmnLists;
- (NSMutableArray)eplmnLists;
- (NSMutableArray)homeSidNidLists;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)ehplmnListAtIndex:(unint64_t)a3;
- (id)eplmnListAtIndex:(unint64_t)a3;
- (id)homeSidNidListAtIndex:(unint64_t)a3;
- (id)roamStatusAsString:(int)a3;
- (int)StringAsRoamStatus:(id)a3;
- (int)roamStatus;
- (unint64_t)ehplmnListsCount;
- (unint64_t)eplmnListsCount;
- (unint64_t)hash;
- (unint64_t)homeSidNidListsCount;
- (unint64_t)timestamp;
- (unsigned)hMCC;
- (unsigned)hMNC;
- (unsigned)numSubs;
- (unsigned)psPref;
- (unsigned)rMCC;
- (unsigned)rMNC;
- (unsigned)rNID;
- (unsigned)rSID;
- (unsigned)subsId;
- (void)addEhplmnList:(id)a3;
- (void)addEplmnList:(id)a3;
- (void)addHomeSidNidList:(id)a3;
- (void)clearEhplmnLists;
- (void)clearEplmnLists;
- (void)clearHomeSidNidLists;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEhplmnLists:(id)a3;
- (void)setEplmnLists:(id)a3;
- (void)setHMCC:(unsigned int)a3;
- (void)setHMNC:(unsigned int)a3;
- (void)setHasHMCC:(BOOL)a3;
- (void)setHasHMNC:(BOOL)a3;
- (void)setHasNumSubs:(BOOL)a3;
- (void)setHasPsPref:(BOOL)a3;
- (void)setHasRMCC:(BOOL)a3;
- (void)setHasRMNC:(BOOL)a3;
- (void)setHasRNID:(BOOL)a3;
- (void)setHasRSID:(BOOL)a3;
- (void)setHasRoamStatus:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHomeSidNidLists:(id)a3;
- (void)setNumSubs:(unsigned int)a3;
- (void)setPlmn:(id)a3;
- (void)setPsPref:(unsigned int)a3;
- (void)setRMCC:(unsigned int)a3;
- (void)setRMNC:(unsigned int)a3;
- (void)setRNID:(unsigned int)a3;
- (void)setRSID:(unsigned int)a3;
- (void)setRoamStatus:(int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularRegisteredPlmnStatus

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_WORD *)&self->_has & 1;
}

- (int)roamStatus
{
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
    return self->_roamStatus;
  }
  else {
    return -1;
  }
}

- (void)setRoamStatus:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_roamStatus = a3;
}

- (void)setHasRoamStatus:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasRoamStatus
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (id)roamStatusAsString:(int)a3
{
  v4 = @"SYS_ROAM_STATUS_NONE";
  switch(a3)
  {
    case -1:
      goto LABEL_46;
    case 0:
      v4 = @"SYS_ROAM_STATUS_OFF";
      break;
    case 1:
      v4 = @"SYS_ROAM_STATUS_ON";
      break;
    case 2:
      v4 = @"SYS_ROAM_STATUS_BLINK";
      break;
    case 3:
      v4 = @"SYS_ROAM_STATUS_OUT_OF_NEIGHBORHOOD";
      break;
    case 4:
      v4 = @"SYS_ROAM_STATUS_OUT_OF_BLDG";
      break;
    case 5:
      v4 = @"SYS_ROAM_STATUS_PREF_SYS";
      break;
    case 6:
      v4 = @"SYS_ROAM_STATUS_AVAIL_SYS";
      break;
    case 7:
      v4 = @"SYS_ROAM_STATUS_ALLIANCE_PARTNER";
      break;
    case 8:
      v4 = @"SYS_ROAM_STATUS_PREMIUM_PARTNER";
      break;
    case 9:
      v4 = @"SYS_ROAM_STATUS_FULL_SVC";
      break;
    case 10:
      v4 = @"SYS_ROAM_STATUS_PARTIAL_SVC";
      break;
    case 11:
      v4 = @"SYS_ROAM_STATUS_BANNER_ON";
      break;
    case 12:
      v4 = @"SYS_ROAM_STATUS_BANNER_OFF";
      break;
    default:
      if (a3 == 64)
      {
        v4 = @"SYS_ROAM_STATUS_HOME_SYSTEM";
      }
      else
      {
        v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
LABEL_46:
      }
      break;
  }
  return v4;
}

- (int)StringAsRoamStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SYS_ROAM_STATUS_NONE"])
  {
    int v4 = -1;
  }
  else if ([v3 isEqualToString:@"SYS_ROAM_STATUS_OFF"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SYS_ROAM_STATUS_ON"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SYS_ROAM_STATUS_BLINK"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SYS_ROAM_STATUS_OUT_OF_NEIGHBORHOOD"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SYS_ROAM_STATUS_OUT_OF_BLDG"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SYS_ROAM_STATUS_PREF_SYS"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SYS_ROAM_STATUS_AVAIL_SYS"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SYS_ROAM_STATUS_ALLIANCE_PARTNER"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SYS_ROAM_STATUS_PREMIUM_PARTNER"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"SYS_ROAM_STATUS_FULL_SVC"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"SYS_ROAM_STATUS_PARTIAL_SVC"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"SYS_ROAM_STATUS_BANNER_ON"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"SYS_ROAM_STATUS_BANNER_OFF"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"SYS_ROAM_STATUS_HOME_SYSTEM"])
  {
    int v4 = 64;
  }
  else
  {
    int v4 = -1;
  }

  return v4;
}

- (void)setHMCC:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_hMCC = a3;
}

- (void)setHasHMCC:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasHMCC
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHMNC:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_hMNC = a3;
}

- (void)setHasHMNC:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasHMNC
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setRMCC:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_rMCC = a3;
}

- (void)setHasRMCC:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasRMCC
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setRMNC:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_rMNC = a3;
}

- (void)setHasRMNC:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasRMNC
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setRSID:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_rSID = a3;
}

- (void)setHasRSID:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRSID
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setRNID:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_rNID = a3;
}

- (void)setHasRNID:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRNID
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)clearHomeSidNidLists
{
}

- (void)addHomeSidNidList:(id)a3
{
  id v4 = a3;
  homeSidNidLists = self->_homeSidNidLists;
  id v8 = v4;
  if (!homeSidNidLists)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_homeSidNidLists;
    self->_homeSidNidLists = v6;

    id v4 = v8;
    homeSidNidLists = self->_homeSidNidLists;
  }
  [(NSMutableArray *)homeSidNidLists addObject:v4];
}

- (unint64_t)homeSidNidListsCount
{
  return (unint64_t)[(NSMutableArray *)self->_homeSidNidLists count];
}

- (id)homeSidNidListAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_homeSidNidLists objectAtIndex:a3];
}

+ (Class)homeSidNidListType
{
  return (Class)objc_opt_class();
}

- (void)clearEplmnLists
{
}

- (void)addEplmnList:(id)a3
{
  id v4 = a3;
  eplmnLists = self->_eplmnLists;
  id v8 = v4;
  if (!eplmnLists)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_eplmnLists;
    self->_eplmnLists = v6;

    id v4 = v8;
    eplmnLists = self->_eplmnLists;
  }
  [(NSMutableArray *)eplmnLists addObject:v4];
}

- (unint64_t)eplmnListsCount
{
  return (unint64_t)[(NSMutableArray *)self->_eplmnLists count];
}

- (id)eplmnListAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_eplmnLists objectAtIndex:a3];
}

+ (Class)eplmnListType
{
  return (Class)objc_opt_class();
}

- (void)clearEhplmnLists
{
}

- (void)addEhplmnList:(id)a3
{
  id v4 = a3;
  ehplmnLists = self->_ehplmnLists;
  id v8 = v4;
  if (!ehplmnLists)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_ehplmnLists;
    self->_ehplmnLists = v6;

    id v4 = v8;
    ehplmnLists = self->_ehplmnLists;
  }
  [(NSMutableArray *)ehplmnLists addObject:v4];
}

- (unint64_t)ehplmnListsCount
{
  return (unint64_t)[(NSMutableArray *)self->_ehplmnLists count];
}

- (id)ehplmnListAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_ehplmnLists objectAtIndex:a3];
}

+ (Class)ehplmnListType
{
  return (Class)objc_opt_class();
}

- (void)setSubsId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSubsId
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setNumSubs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasNumSubs
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasPsPref
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (BOOL)hasPlmn
{
  return self->_plmn != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularRegisteredPlmnStatus;
  __int16 v3 = [(CellularRegisteredPlmnStatus *)&v7 description];
  id v4 = [(CellularRegisteredPlmnStatus *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = +[NSMutableDictionary dictionary];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v31 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v31 forKey:@"timestamp"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_68;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  int roamStatus = self->_roamStatus;
  v33 = @"SYS_ROAM_STATUS_NONE";
  switch(roamStatus)
  {
    case -1:
      break;
    case 0:
      v33 = @"SYS_ROAM_STATUS_OFF";
      break;
    case 1:
      v33 = @"SYS_ROAM_STATUS_ON";
      break;
    case 2:
      v33 = @"SYS_ROAM_STATUS_BLINK";
      break;
    case 3:
      v33 = @"SYS_ROAM_STATUS_OUT_OF_NEIGHBORHOOD";
      break;
    case 4:
      v33 = @"SYS_ROAM_STATUS_OUT_OF_BLDG";
      break;
    case 5:
      v33 = @"SYS_ROAM_STATUS_PREF_SYS";
      break;
    case 6:
      v33 = @"SYS_ROAM_STATUS_AVAIL_SYS";
      break;
    case 7:
      v33 = @"SYS_ROAM_STATUS_ALLIANCE_PARTNER";
      break;
    case 8:
      v33 = @"SYS_ROAM_STATUS_PREMIUM_PARTNER";
      break;
    case 9:
      v33 = @"SYS_ROAM_STATUS_FULL_SVC";
      break;
    case 10:
      v33 = @"SYS_ROAM_STATUS_PARTIAL_SVC";
      break;
    case 11:
      v33 = @"SYS_ROAM_STATUS_BANNER_ON";
      break;
    case 12:
      v33 = @"SYS_ROAM_STATUS_BANNER_OFF";
      break;
    default:
      if (roamStatus == 64)
      {
        v33 = @"SYS_ROAM_STATUS_HOME_SYSTEM";
      }
      else
      {
        v33 = +[NSString stringWithFormat:@"(unknown: %i)", self->_roamStatus];
      }
      break;
  }
  [v3 setObject:v33 forKey:@"roam_status"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_69;
  }
LABEL_68:
  v36 = +[NSNumber numberWithUnsignedInt:self->_hMCC];
  [v3 setObject:v36 forKey:@"h_MCC"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_70;
  }
LABEL_69:
  v37 = +[NSNumber numberWithUnsignedInt:self->_hMNC];
  [v3 setObject:v37 forKey:@"h_MNC"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_71;
  }
LABEL_70:
  v38 = +[NSNumber numberWithUnsignedInt:self->_rMCC];
  [v3 setObject:v38 forKey:@"r_MCC"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_72;
  }
LABEL_71:
  v39 = +[NSNumber numberWithUnsignedInt:self->_rMNC];
  [v3 setObject:v39 forKey:@"r_MNC"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_72:
  v40 = +[NSNumber numberWithUnsignedInt:self->_rSID];
  [v3 setObject:v40 forKey:@"r_SID"];

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_9:
    v5 = +[NSNumber numberWithUnsignedInt:self->_rNID];
    [v3 setObject:v5 forKey:@"r_NID"];
  }
LABEL_10:
  if ([(NSMutableArray *)self->_homeSidNidLists count])
  {
    id v6 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_homeSidNidLists, "count")];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    objc_super v7 = self->_homeSidNidLists;
    id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v49 objects:v55 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v50;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v50 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v49 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v49 objects:v55 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"home_sid_nid_list"];
  }
  if ([(NSMutableArray *)self->_eplmnLists count])
  {
    id v13 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_eplmnLists, "count")];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    v14 = self->_eplmnLists;
    id v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v45 objects:v54 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v46;
      do
      {
        for (j = 0; j != v16; j = (char *)j + 1)
        {
          if (*(void *)v46 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [*(id *)(*((void *)&v45 + 1) + 8 * (void)j) dictionaryRepresentation];
          [v13 addObject:v19];
        }
        id v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v45 objects:v54 count:16];
      }
      while (v16);
    }

    [v3 setObject:v13 forKey:@"eplmn_list"];
  }
  if ([(NSMutableArray *)self->_ehplmnLists count])
  {
    id v20 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_ehplmnLists, "count")];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v21 = self->_ehplmnLists;
    id v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v41 objects:v53 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v42;
      do
      {
        for (k = 0; k != v23; k = (char *)k + 1)
        {
          if (*(void *)v42 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = [*(id *)(*((void *)&v41 + 1) + 8 * (void)k) dictionaryRepresentation];
          [v20 addObject:v26];
        }
        id v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v41 objects:v53 count:16];
      }
      while (v23);
    }

    [v3 setObject:v20 forKey:@"ehplmn_list"];
  }
  __int16 v27 = (__int16)self->_has;
  if ((v27 & 0x400) != 0)
  {
    v34 = +[NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v34 forKey:@"subs_id"];

    __int16 v27 = (__int16)self->_has;
    if ((v27 & 8) == 0)
    {
LABEL_39:
      if ((v27 & 0x10) == 0) {
        goto LABEL_41;
      }
      goto LABEL_40;
    }
  }
  else if ((v27 & 8) == 0)
  {
    goto LABEL_39;
  }
  v35 = +[NSNumber numberWithUnsignedInt:self->_numSubs];
  [v3 setObject:v35 forKey:@"num_subs"];

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_40:
    v28 = +[NSNumber numberWithUnsignedInt:self->_psPref];
    [v3 setObject:v28 forKey:@"ps_pref"];
  }
LABEL_41:
  plmn = self->_plmn;
  if (plmn) {
    [v3 setObject:plmn forKey:@"plmn"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10013BA54((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_40;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_44:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
LABEL_9:
  }
    PBDataWriterWriteUint32Field();
LABEL_10:
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v6 = self->_homeSidNidLists;
  objc_super v7 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v31;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      id v8 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v8);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v11 = self->_eplmnLists;
  v12 = (char *)[(NSMutableArray *)v11 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v27;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
      }
      id v13 = (char *)[(NSMutableArray *)v11 countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v13);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v16 = self->_ehplmnLists;
  uint64_t v17 = (char *)[(NSMutableArray *)v16 countByEnumeratingWithState:&v22 objects:v34 count:16];
  if (v17)
  {
    v18 = v17;
    uint64_t v19 = *(void *)v23;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteSubmessage();
      }
      v18 = (char *)[(NSMutableArray *)v16 countByEnumeratingWithState:&v22 objects:v34 count:16];
    }
    while (v18);
  }

  __int16 v21 = (__int16)self->_has;
  if ((v21 & 0x400) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 v21 = (__int16)self->_has;
    if ((v21 & 8) == 0)
    {
LABEL_33:
      if ((v21 & 0x10) == 0) {
        goto LABEL_35;
      }
      goto LABEL_34;
    }
  }
  else if ((v21 & 8) == 0)
  {
    goto LABEL_33;
  }
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
LABEL_34:
  }
    PBDataWriterWriteUint32Field();
LABEL_35:
  if (self->_plmn) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((_WORD *)v4 + 46) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_33;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 21) = self->_roamStatus;
  *((_WORD *)v4 + 46) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v4 + 8) = self->_hMCC;
  *((_WORD *)v4 + 46) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v4 + 9) = self->_hMNC;
  *((_WORD *)v4 + 46) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v4 + 17) = self->_rMCC;
  *((_WORD *)v4 + 46) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_8;
    }
LABEL_37:
    *((_DWORD *)v4 + 20) = self->_rSID;
    *((_WORD *)v4 + 46) |= 0x100u;
    if ((*(_WORD *)&self->_has & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_36:
  *((_DWORD *)v4 + 18) = self->_rMNC;
  *((_WORD *)v4 + 46) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0) {
    goto LABEL_37;
  }
LABEL_8:
  if ((has & 0x80) != 0)
  {
LABEL_9:
    *((_DWORD *)v4 + 19) = self->_rNID;
    *((_WORD *)v4 + 46) |= 0x80u;
  }
LABEL_10:
  id v20 = v4;
  if ([(CellularRegisteredPlmnStatus *)self homeSidNidListsCount])
  {
    [v20 clearHomeSidNidLists];
    unint64_t v6 = [(CellularRegisteredPlmnStatus *)self homeSidNidListsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(CellularRegisteredPlmnStatus *)self homeSidNidListAtIndex:i];
        [v20 addHomeSidNidList:v9];
      }
    }
  }
  if ([(CellularRegisteredPlmnStatus *)self eplmnListsCount])
  {
    [v20 clearEplmnLists];
    unint64_t v10 = [(CellularRegisteredPlmnStatus *)self eplmnListsCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        id v13 = [(CellularRegisteredPlmnStatus *)self eplmnListAtIndex:j];
        [v20 addEplmnList:v13];
      }
    }
  }
  if ([(CellularRegisteredPlmnStatus *)self ehplmnListsCount])
  {
    [v20 clearEhplmnLists];
    unint64_t v14 = [(CellularRegisteredPlmnStatus *)self ehplmnListsCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t k = 0; k != v15; ++k)
      {
        uint64_t v17 = [(CellularRegisteredPlmnStatus *)self ehplmnListAtIndex:k];
        [v20 addEhplmnList:v17];
      }
    }
  }
  __int16 v18 = (__int16)self->_has;
  uint64_t v19 = v20;
  if ((v18 & 0x400) != 0)
  {
    *((_DWORD *)v20 + 22) = self->_subsId;
    *((_WORD *)v20 + 46) |= 0x400u;
    __int16 v18 = (__int16)self->_has;
    if ((v18 & 8) == 0)
    {
LABEL_24:
      if ((v18 & 0x10) == 0) {
        goto LABEL_26;
      }
      goto LABEL_25;
    }
  }
  else if ((v18 & 8) == 0)
  {
    goto LABEL_24;
  }
  *((_DWORD *)v20 + 12) = self->_numSubs;
  *((_WORD *)v20 + 46) |= 8u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_25:
    *((_DWORD *)v20 + 16) = self->_psPref;
    *((_WORD *)v20 + 46) |= 0x10u;
  }
LABEL_26:
  if (self->_plmn)
  {
    [v20 setPlmn:];
    uint64_t v19 = v20;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = v5;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v5[1] = self->_timestamp;
    *((_WORD *)v5 + 46) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_38;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 21) = self->_roamStatus;
  *((_WORD *)v5 + 46) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)v5 + 8) = self->_hMCC;
  *((_WORD *)v5 + 46) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v5 + 9) = self->_hMNC;
  *((_WORD *)v5 + 46) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v5 + 17) = self->_rMCC;
  *((_WORD *)v5 + 46) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v5 + 18) = self->_rMNC;
  *((_WORD *)v5 + 46) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_42:
  *((_DWORD *)v5 + 20) = self->_rSID;
  *((_WORD *)v5 + 46) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_9:
    *((_DWORD *)v5 + 19) = self->_rNID;
    *((_WORD *)v5 + 46) |= 0x80u;
  }
LABEL_10:
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v8 = self->_homeSidNidLists;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v39 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v38 + 1) + 8 * i) copyWithZone:a3];
        [v6 addHomeSidNidList:v13];
      }
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v10);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  unint64_t v14 = self->_eplmnLists;
  id v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v16; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v35 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = [*(id *)(*((void *)&v34 + 1) + 8 * (void)j) copyWithZone:a3];
        [v6 addEplmnList:v19];
      }
      id v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v16);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v20 = self->_ehplmnLists;
  id v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v30 objects:v42 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v31;
    do
    {
      for (uint64_t k = 0; k != v22; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = [k copyWithZone:a3];
        [v6 addEhplmnList:v25];
      }
      id v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v30 objects:v42 count:16];
    }
    while (v22);
  }

  __int16 v26 = (__int16)self->_has;
  if ((v26 & 0x400) == 0)
  {
    if ((v26 & 8) == 0) {
      goto LABEL_33;
    }
LABEL_45:
    *((_DWORD *)v6 + 12) = self->_numSubs;
    *((_WORD *)v6 + 46) |= 8u;
    if ((*(_WORD *)&self->_has & 0x10) == 0) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
  *((_DWORD *)v6 + 22) = self->_subsId;
  *((_WORD *)v6 + 46) |= 0x400u;
  __int16 v26 = (__int16)self->_has;
  if ((v26 & 8) != 0) {
    goto LABEL_45;
  }
LABEL_33:
  if ((v26 & 0x10) != 0)
  {
LABEL_34:
    *((_DWORD *)v6 + 16) = self->_psPref;
    *((_WORD *)v6 + 46) |= 0x10u;
  }
LABEL_35:
  id v27 = -[NSData copyWithZone:](self->_plmn, "copyWithZone:", a3, (void)v30);
  long long v28 = (void *)*((void *)v6 + 7);
  *((void *)v6 + 7) = v27;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_65;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 46);
  if (has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_65;
    }
  }
  else if (v6)
  {
LABEL_65:
    unsigned __int8 v13 = 0;
    goto LABEL_66;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 46) & 0x200) == 0 || self->_roamStatus != *((_DWORD *)v4 + 21)) {
      goto LABEL_65;
    }
  }
  else if ((*((_WORD *)v4 + 46) & 0x200) != 0)
  {
    goto LABEL_65;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_hMCC != *((_DWORD *)v4 + 8)) {
      goto LABEL_65;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_65;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_hMNC != *((_DWORD *)v4 + 9)) {
      goto LABEL_65;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_65;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_rMCC != *((_DWORD *)v4 + 17)) {
      goto LABEL_65;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_65;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_rMNC != *((_DWORD *)v4 + 18)) {
      goto LABEL_65;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_65;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 46) & 0x100) == 0 || self->_rSID != *((_DWORD *)v4 + 20)) {
      goto LABEL_65;
    }
  }
  else if ((*((_WORD *)v4 + 46) & 0x100) != 0)
  {
    goto LABEL_65;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_rNID != *((_DWORD *)v4 + 19)) {
      goto LABEL_65;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_65;
  }
  homeSidNidLists = self->_homeSidNidLists;
  if ((unint64_t)homeSidNidLists | *((void *)v4 + 5)
    && !-[NSMutableArray isEqual:](homeSidNidLists, "isEqual:"))
  {
    goto LABEL_65;
  }
  eplmnLists = self->_eplmnLists;
  if ((unint64_t)eplmnLists | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](eplmnLists, "isEqual:")) {
      goto LABEL_65;
    }
  }
  ehplmnLists = self->_ehplmnLists;
  if ((unint64_t)ehplmnLists | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](ehplmnLists, "isEqual:")) {
      goto LABEL_65;
    }
  }
  __int16 v10 = (__int16)self->_has;
  __int16 v11 = *((_WORD *)v4 + 46);
  if ((v10 & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 46) & 0x400) == 0 || self->_subsId != *((_DWORD *)v4 + 22)) {
      goto LABEL_65;
    }
  }
  else if ((*((_WORD *)v4 + 46) & 0x400) != 0)
  {
    goto LABEL_65;
  }
  if ((v10 & 8) != 0)
  {
    if ((v11 & 8) == 0 || self->_numSubs != *((_DWORD *)v4 + 12)) {
      goto LABEL_65;
    }
  }
  else if ((v11 & 8) != 0)
  {
    goto LABEL_65;
  }
  if ((v10 & 0x10) != 0)
  {
    if ((v11 & 0x10) == 0 || self->_psPref != *((_DWORD *)v4 + 16)) {
      goto LABEL_65;
    }
  }
  else if ((v11 & 0x10) != 0)
  {
    goto LABEL_65;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((void *)v4 + 7)) {
    unsigned __int8 v13 = -[NSData isEqual:](plmn, "isEqual:");
  }
  else {
    unsigned __int8 v13 = 1;
  }
LABEL_66:

  return v13;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    unint64_t v19 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
LABEL_3:
      uint64_t v18 = 2654435761 * self->_roamStatus;
      if ((has & 2) != 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else
  {
    unint64_t v19 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v18 = 0;
  if ((has & 2) != 0)
  {
LABEL_4:
    uint64_t v17 = 2654435761 * self->_hMCC;
    if ((has & 4) != 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v17 = 0;
  if ((has & 4) != 0)
  {
LABEL_5:
    uint64_t v4 = 2654435761 * self->_hMNC;
    if ((has & 0x20) != 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v4 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_6:
    uint64_t v5 = 2654435761 * self->_rMCC;
    if ((has & 0x40) != 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v5 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_7:
    uint64_t v6 = 2654435761 * self->_rMNC;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_8;
    }
LABEL_16:
    uint64_t v7 = 0;
    if ((has & 0x80) != 0) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
LABEL_15:
  uint64_t v6 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_16;
  }
LABEL_8:
  uint64_t v7 = 2654435761 * self->_rSID;
  if ((has & 0x80) != 0)
  {
LABEL_9:
    uint64_t v8 = 2654435761 * self->_rNID;
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v8 = 0;
LABEL_18:
  unint64_t v9 = (unint64_t)[(NSMutableArray *)self->_homeSidNidLists hash];
  unint64_t v10 = (unint64_t)[(NSMutableArray *)self->_eplmnLists hash];
  unint64_t v11 = (unint64_t)[(NSMutableArray *)self->_ehplmnLists hash];
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x400) == 0)
  {
    uint64_t v13 = 0;
    if ((v12 & 8) != 0) {
      goto LABEL_20;
    }
LABEL_23:
    uint64_t v14 = 0;
    if ((v12 & 0x10) != 0) {
      goto LABEL_21;
    }
LABEL_24:
    uint64_t v15 = 0;
    return v18 ^ v19 ^ v17 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ (unint64_t)[(NSData *)self->_plmn hash];
  }
  uint64_t v13 = 2654435761 * self->_subsId;
  if ((v12 & 8) == 0) {
    goto LABEL_23;
  }
LABEL_20:
  uint64_t v14 = 2654435761 * self->_numSubs;
  if ((v12 & 0x10) == 0) {
    goto LABEL_24;
  }
LABEL_21:
  uint64_t v15 = 2654435761 * self->_psPref;
  return v18 ^ v19 ^ v17 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ (unint64_t)[(NSData *)self->_plmn hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  __int16 v6 = *((_WORD *)v4 + 46);
  if (v6)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v6 = *((_WORD *)v4 + 46);
    if ((v6 & 0x200) == 0)
    {
LABEL_3:
      if ((v6 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_40;
    }
  }
  else if ((*((_WORD *)v4 + 46) & 0x200) == 0)
  {
    goto LABEL_3;
  }
  self->_int roamStatus = *((_DWORD *)v4 + 21);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v6 = *((_WORD *)v4 + 46);
  if ((v6 & 2) == 0)
  {
LABEL_4:
    if ((v6 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_41;
  }
LABEL_40:
  self->_hMCC = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 2u;
  __int16 v6 = *((_WORD *)v4 + 46);
  if ((v6 & 4) == 0)
  {
LABEL_5:
    if ((v6 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_42;
  }
LABEL_41:
  self->_hMNC = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 4u;
  __int16 v6 = *((_WORD *)v4 + 46);
  if ((v6 & 0x20) == 0)
  {
LABEL_6:
    if ((v6 & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_rMCC = *((_DWORD *)v4 + 17);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v6 = *((_WORD *)v4 + 46);
  if ((v6 & 0x40) == 0)
  {
LABEL_7:
    if ((v6 & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_rMNC = *((_DWORD *)v4 + 18);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v6 = *((_WORD *)v4 + 46);
  if ((v6 & 0x100) == 0)
  {
LABEL_8:
    if ((v6 & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_44:
  self->_rSID = *((_DWORD *)v4 + 20);
  *(_WORD *)&self->_has |= 0x100u;
  if ((*((_WORD *)v4 + 46) & 0x80) != 0)
  {
LABEL_9:
    self->_rNID = *((_DWORD *)v4 + 19);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_10:
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v7 = *((id *)v4 + 5);
  id v8 = [v7 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v7);
        }
        [(CellularRegisteredPlmnStatus *)self addHomeSidNidList:*(void *)(*((void *)&v31 + 1) + 8 * i)];
      }
      id v9 = [v7 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v9);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v12 = *((id *)v5 + 3);
  id v13 = [v12 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v14; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v12);
        }
        [(CellularRegisteredPlmnStatus *)self addEplmnList:*(void *)(*((void *)&v27 + 1) + 8 * (void)j)];
      }
      id v14 = [v12 countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v14);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v17 = *((id *)v5 + 2);
  id v18 = [v17 countByEnumeratingWithState:&v23 objects:v35 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v24;
    do
    {
      for (uint64_t k = 0; k != v19; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(v17);
        }
        -[CellularRegisteredPlmnStatus addEhplmnList:](self, "addEhplmnList:", *(void *)(*((void *)&v23 + 1) + 8 * (void)k), (void)v23);
      }
      id v19 = [v17 countByEnumeratingWithState:&v23 objects:v35 count:16];
    }
    while (v19);
  }

  __int16 v22 = *((_WORD *)v5 + 46);
  if ((v22 & 0x400) != 0)
  {
    self->_subsId = *((_DWORD *)v5 + 22);
    *(_WORD *)&self->_has |= 0x400u;
    __int16 v22 = *((_WORD *)v5 + 46);
    if ((v22 & 8) == 0)
    {
LABEL_33:
      if ((v22 & 0x10) == 0) {
        goto LABEL_35;
      }
      goto LABEL_34;
    }
  }
  else if ((v22 & 8) == 0)
  {
    goto LABEL_33;
  }
  self->_numSubs = *((_DWORD *)v5 + 12);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)v5 + 46) & 0x10) != 0)
  {
LABEL_34:
    self->_psPref = *((_DWORD *)v5 + 16);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_35:
  if (*((void *)v5 + 7)) {
    -[CellularRegisteredPlmnStatus setPlmn:](self, "setPlmn:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)hMCC
{
  return self->_hMCC;
}

- (unsigned)hMNC
{
  return self->_hMNC;
}

- (unsigned)rMCC
{
  return self->_rMCC;
}

- (unsigned)rMNC
{
  return self->_rMNC;
}

- (unsigned)rSID
{
  return self->_rSID;
}

- (unsigned)rNID
{
  return self->_rNID;
}

- (NSMutableArray)homeSidNidLists
{
  return self->_homeSidNidLists;
}

- (void)setHomeSidNidLists:(id)a3
{
}

- (NSMutableArray)eplmnLists
{
  return self->_eplmnLists;
}

- (void)setEplmnLists:(id)a3
{
}

- (NSMutableArray)ehplmnLists
{
  return self->_ehplmnLists;
}

- (void)setEhplmnLists:(id)a3
{
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (unsigned)numSubs
{
  return self->_numSubs;
}

- (unsigned)psPref
{
  return self->_psPref;
}

- (NSData)plmn
{
  return self->_plmn;
}

- (void)setPlmn:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plmn, 0);
  objc_storeStrong((id *)&self->_homeSidNidLists, 0);
  objc_storeStrong((id *)&self->_eplmnLists, 0);

  objc_storeStrong((id *)&self->_ehplmnLists, 0);
}

@end