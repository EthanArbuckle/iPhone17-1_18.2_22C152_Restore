@interface KCellularMmCommonInfo
+ (Class)eplmnListType;
+ (Class)regProvFlaiListType;
+ (Class)regProvFtaiListType;
+ (Class)roamingFlaiListType;
+ (Class)roamingFtaiListType;
- (BOOL)hasImsi;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)imsi;
- (NSMutableArray)eplmnLists;
- (NSMutableArray)regProvFlaiLists;
- (NSMutableArray)regProvFtaiLists;
- (NSMutableArray)roamingFlaiLists;
- (NSMutableArray)roamingFtaiLists;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)eplmnListAtIndex:(unint64_t)a3;
- (id)regProvFlaiListAtIndex:(unint64_t)a3;
- (id)regProvFtaiListAtIndex:(unint64_t)a3;
- (id)roamingFlaiListAtIndex:(unint64_t)a3;
- (id)roamingFtaiListAtIndex:(unint64_t)a3;
- (unint64_t)eplmnListsCount;
- (unint64_t)hash;
- (unint64_t)regProvFlaiListsCount;
- (unint64_t)regProvFtaiListsCount;
- (unint64_t)roamingFlaiListsCount;
- (unint64_t)roamingFtaiListsCount;
- (unint64_t)timestamp;
- (unsigned)subsId;
- (void)addEplmnList:(id)a3;
- (void)addRegProvFlaiList:(id)a3;
- (void)addRegProvFtaiList:(id)a3;
- (void)addRoamingFlaiList:(id)a3;
- (void)addRoamingFtaiList:(id)a3;
- (void)clearEplmnLists;
- (void)clearRegProvFlaiLists;
- (void)clearRegProvFtaiLists;
- (void)clearRoamingFlaiLists;
- (void)clearRoamingFtaiLists;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEplmnLists:(id)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setImsi:(id)a3;
- (void)setRegProvFlaiLists:(id)a3;
- (void)setRegProvFtaiLists:(id)a3;
- (void)setRoamingFlaiLists:(id)a3;
- (void)setRoamingFtaiLists:(id)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation KCellularMmCommonInfo

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasImsi
{
  return self->_imsi != 0;
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

- (void)clearRoamingFlaiLists
{
}

- (void)addRoamingFlaiList:(id)a3
{
  id v4 = a3;
  roamingFlaiLists = self->_roamingFlaiLists;
  id v8 = v4;
  if (!roamingFlaiLists)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_roamingFlaiLists;
    self->_roamingFlaiLists = v6;

    id v4 = v8;
    roamingFlaiLists = self->_roamingFlaiLists;
  }
  [(NSMutableArray *)roamingFlaiLists addObject:v4];
}

- (unint64_t)roamingFlaiListsCount
{
  return (unint64_t)[(NSMutableArray *)self->_roamingFlaiLists count];
}

- (id)roamingFlaiListAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_roamingFlaiLists objectAtIndex:a3];
}

+ (Class)roamingFlaiListType
{
  return (Class)objc_opt_class();
}

- (void)clearRegProvFlaiLists
{
}

- (void)addRegProvFlaiList:(id)a3
{
  id v4 = a3;
  regProvFlaiLists = self->_regProvFlaiLists;
  id v8 = v4;
  if (!regProvFlaiLists)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_regProvFlaiLists;
    self->_regProvFlaiLists = v6;

    id v4 = v8;
    regProvFlaiLists = self->_regProvFlaiLists;
  }
  [(NSMutableArray *)regProvFlaiLists addObject:v4];
}

- (unint64_t)regProvFlaiListsCount
{
  return (unint64_t)[(NSMutableArray *)self->_regProvFlaiLists count];
}

- (id)regProvFlaiListAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_regProvFlaiLists objectAtIndex:a3];
}

+ (Class)regProvFlaiListType
{
  return (Class)objc_opt_class();
}

- (void)clearRoamingFtaiLists
{
}

- (void)addRoamingFtaiList:(id)a3
{
  id v4 = a3;
  roamingFtaiLists = self->_roamingFtaiLists;
  id v8 = v4;
  if (!roamingFtaiLists)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_roamingFtaiLists;
    self->_roamingFtaiLists = v6;

    id v4 = v8;
    roamingFtaiLists = self->_roamingFtaiLists;
  }
  [(NSMutableArray *)roamingFtaiLists addObject:v4];
}

- (unint64_t)roamingFtaiListsCount
{
  return (unint64_t)[(NSMutableArray *)self->_roamingFtaiLists count];
}

- (id)roamingFtaiListAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_roamingFtaiLists objectAtIndex:a3];
}

+ (Class)roamingFtaiListType
{
  return (Class)objc_opt_class();
}

- (void)clearRegProvFtaiLists
{
}

- (void)addRegProvFtaiList:(id)a3
{
  id v4 = a3;
  regProvFtaiLists = self->_regProvFtaiLists;
  id v8 = v4;
  if (!regProvFtaiLists)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_regProvFtaiLists;
    self->_regProvFtaiLists = v6;

    id v4 = v8;
    regProvFtaiLists = self->_regProvFtaiLists;
  }
  [(NSMutableArray *)regProvFtaiLists addObject:v4];
}

- (unint64_t)regProvFtaiListsCount
{
  return (unint64_t)[(NSMutableArray *)self->_regProvFtaiLists count];
}

- (id)regProvFtaiListAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_regProvFtaiLists objectAtIndex:a3];
}

+ (Class)regProvFtaiListType
{
  return (Class)objc_opt_class();
}

- (void)setSubsId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSubsId
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)KCellularMmCommonInfo;
  char v3 = [(KCellularMmCommonInfo *)&v7 description];
  id v4 = [(KCellularMmCommonInfo *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v4 forKey:@"timestamp"];
  }
  imsi = self->_imsi;
  if (imsi) {
    [v3 setObject:imsi forKey:@"imsi"];
  }
  if ([(NSMutableArray *)self->_eplmnLists count])
  {
    id v6 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_eplmnLists, "count")];
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    objc_super v7 = self->_eplmnLists;
    id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v59 objects:v67 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v60;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v60 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v59 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v59 objects:v67 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"eplmn_list"];
  }
  if ([(NSMutableArray *)self->_roamingFlaiLists count])
  {
    id v13 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_roamingFlaiLists, "count")];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    v14 = self->_roamingFlaiLists;
    id v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v55 objects:v66 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v56;
      do
      {
        for (j = 0; j != v16; j = (char *)j + 1)
        {
          if (*(void *)v56 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [*(id *)(*((void *)&v55 + 1) + 8 * (void)j) dictionaryRepresentation];
          [v13 addObject:v19];
        }
        id v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v55 objects:v66 count:16];
      }
      while (v16);
    }

    [v3 setObject:v13 forKey:@"roaming_flai_list"];
  }
  if ([(NSMutableArray *)self->_regProvFlaiLists count])
  {
    id v20 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_regProvFlaiLists, "count")];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    v21 = self->_regProvFlaiLists;
    id v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v51 objects:v65 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v52;
      do
      {
        for (k = 0; k != v23; k = (char *)k + 1)
        {
          if (*(void *)v52 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = [*(id *)(*((void *)&v51 + 1) + 8 * (void)k) dictionaryRepresentation];
          [v20 addObject:v26];
        }
        id v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v51 objects:v65 count:16];
      }
      while (v23);
    }

    [v3 setObject:v20 forKey:@"reg_prov_flai_list"];
  }
  if ([(NSMutableArray *)self->_roamingFtaiLists count])
  {
    id v27 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_roamingFtaiLists, "count")];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v28 = self->_roamingFtaiLists;
    id v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v47 objects:v64 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v48;
      do
      {
        for (m = 0; m != v30; m = (char *)m + 1)
        {
          if (*(void *)v48 != v31) {
            objc_enumerationMutation(v28);
          }
          v33 = [*(id *)(*((void *)&v47 + 1) + 8 * (void)m) dictionaryRepresentation];
          [v27 addObject:v33];
        }
        id v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v47 objects:v64 count:16];
      }
      while (v30);
    }

    [v3 setObject:v27 forKey:@"roaming_ftai_list"];
  }
  if ([(NSMutableArray *)self->_regProvFtaiLists count])
  {
    id v34 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_regProvFtaiLists, "count")];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v35 = self->_regProvFtaiLists;
    id v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v43 objects:v63 count:16];
    if (v36)
    {
      id v37 = v36;
      uint64_t v38 = *(void *)v44;
      do
      {
        for (n = 0; n != v37; n = (char *)n + 1)
        {
          if (*(void *)v44 != v38) {
            objc_enumerationMutation(v35);
          }
          v40 = [*(id *)(*((void *)&v43 + 1) + 8 * (void)n) dictionaryRepresentation];
          [v34 addObject:v40];
        }
        id v37 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v43 objects:v63 count:16];
      }
      while (v37);
    }

    [v3 setObject:v34 forKey:@"reg_prov_ftai_list"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v41 = +[NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v41 forKey:@"subs_id"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100080108((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_imsi) {
    PBDataWriterWriteDataField();
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v5 = self->_eplmnLists;
  id v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v6)
  {
    objc_super v7 = v6;
    uint64_t v8 = *(void *)v47;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v47 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      objc_super v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v7);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v10 = self->_roamingFlaiLists;
  v11 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v42 objects:v53 count:16];
  if (v11)
  {
    v12 = v11;
    uint64_t v13 = *(void *)v43;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v43 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v42 objects:v53 count:16];
    }
    while (v12);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v15 = self->_regProvFlaiLists;
  id v16 = (char *)[(NSMutableArray *)v15 countByEnumeratingWithState:&v38 objects:v52 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v39;
    do
    {
      v19 = 0;
      do
      {
        if (*(void *)v39 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = (char *)[(NSMutableArray *)v15 countByEnumeratingWithState:&v38 objects:v52 count:16];
    }
    while (v17);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v20 = self->_roamingFtaiLists;
  v21 = (char *)[(NSMutableArray *)v20 countByEnumeratingWithState:&v34 objects:v51 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v35;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v35 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      id v22 = (char *)[(NSMutableArray *)v20 countByEnumeratingWithState:&v34 objects:v51 count:16];
    }
    while (v22);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v25 = self->_regProvFtaiLists;
  v26 = (char *)[(NSMutableArray *)v25 countByEnumeratingWithState:&v30 objects:v50 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v31;
    do
    {
      id v29 = 0;
      do
      {
        if (*(void *)v31 != v28) {
          objc_enumerationMutation(v25);
        }
        PBDataWriterWriteSubmessage();
        ++v29;
      }
      while (v27 != v29);
      id v27 = (char *)[(NSMutableArray *)v25 countByEnumeratingWithState:&v30 objects:v50 count:16];
    }
    while (v27);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 68) |= 1u;
  }
  id v25 = v4;
  if (self->_imsi) {
    [v4 setImsi:];
  }
  if ([(KCellularMmCommonInfo *)self eplmnListsCount])
  {
    [v25 clearEplmnLists];
    unint64_t v5 = [(KCellularMmCommonInfo *)self eplmnListsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(KCellularMmCommonInfo *)self eplmnListAtIndex:i];
        [v25 addEplmnList:v8];
      }
    }
  }
  if ([(KCellularMmCommonInfo *)self roamingFlaiListsCount])
  {
    [v25 clearRoamingFlaiLists];
    unint64_t v9 = [(KCellularMmCommonInfo *)self roamingFlaiListsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        v12 = [(KCellularMmCommonInfo *)self roamingFlaiListAtIndex:j];
        [v25 addRoamingFlaiList:v12];
      }
    }
  }
  if ([(KCellularMmCommonInfo *)self regProvFlaiListsCount])
  {
    [v25 clearRegProvFlaiLists];
    unint64_t v13 = [(KCellularMmCommonInfo *)self regProvFlaiListsCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        id v16 = [(KCellularMmCommonInfo *)self regProvFlaiListAtIndex:k];
        [v25 addRegProvFlaiList:v16];
      }
    }
  }
  if ([(KCellularMmCommonInfo *)self roamingFtaiListsCount])
  {
    [v25 clearRoamingFtaiLists];
    unint64_t v17 = [(KCellularMmCommonInfo *)self roamingFtaiListsCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t m = 0; m != v18; ++m)
      {
        id v20 = [(KCellularMmCommonInfo *)self roamingFtaiListAtIndex:m];
        [v25 addRoamingFtaiList:v20];
      }
    }
  }
  if ([(KCellularMmCommonInfo *)self regProvFtaiListsCount])
  {
    [v25 clearRegProvFtaiLists];
    unint64_t v21 = [(KCellularMmCommonInfo *)self regProvFtaiListsCount];
    if (v21)
    {
      unint64_t v22 = v21;
      for (uint64_t n = 0; n != v22; ++n)
      {
        uint64_t v24 = [(KCellularMmCommonInfo *)self regProvFtaiListAtIndex:n];
        [v25 addRegProvFtaiList:v24];
      }
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v25 + 16) = self->_subsId;
    *((unsigned char *)v25 + 68) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  unint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    v5[1] = self->_timestamp;
    *((unsigned char *)v5 + 68) |= 1u;
  }
  id v7 = [(NSData *)self->_imsi copyWithZone:a3];
  uint64_t v8 = (void *)v6[3];
  v6[3] = v7;

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  unint64_t v9 = self->_eplmnLists;
  id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v56 objects:v64 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v57;
    do
    {
      unint64_t v13 = 0;
      do
      {
        if (*(void *)v57 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = [*(id *)(*((void *)&v56 + 1) + 8 * (void)v13) copyWithZone:a3];
        [v6 addEplmnList:v14];

        unint64_t v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v56 objects:v64 count:16];
    }
    while (v11);
  }

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v15 = self->_roamingFlaiLists;
  id v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v52 objects:v63 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v53;
    do
    {
      v19 = 0;
      do
      {
        if (*(void *)v53 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = [*(id *)(*((void *)&v52 + 1) + 8 * (void)v19) copyWithZone:a3];
        [v6 addRoamingFlaiList:v20];

        v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      id v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v52 objects:v63 count:16];
    }
    while (v17);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  unint64_t v21 = self->_regProvFlaiLists;
  id v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v48 objects:v62 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v49;
    do
    {
      id v25 = 0;
      do
      {
        if (*(void *)v49 != v24) {
          objc_enumerationMutation(v21);
        }
        id v26 = [*(id *)(*((void *)&v48 + 1) + 8 * (void)v25) copyWithZone:a3];
        [v6 addRegProvFlaiList:v26];

        id v25 = (char *)v25 + 1;
      }
      while (v23 != v25);
      id v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v48 objects:v62 count:16];
    }
    while (v23);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v27 = self->_roamingFtaiLists;
  id v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v44 objects:v61 count:16];
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = *(void *)v45;
    do
    {
      long long v31 = 0;
      do
      {
        if (*(void *)v45 != v30) {
          objc_enumerationMutation(v27);
        }
        id v32 = [*(id *)(*((void *)&v44 + 1) + 8 * (void)v31) copyWithZone:a3];
        [v6 addRoamingFtaiList:v32];

        long long v31 = (char *)v31 + 1;
      }
      while (v29 != v31);
      id v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v44 objects:v61 count:16];
    }
    while (v29);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v33 = self->_regProvFtaiLists;
  id v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v40 objects:v60 count:16];
  if (v34)
  {
    id v35 = v34;
    uint64_t v36 = *(void *)v41;
    do
    {
      long long v37 = 0;
      do
      {
        if (*(void *)v41 != v36) {
          objc_enumerationMutation(v33);
        }
        id v38 = [*(id *)(*((void *)&v40 + 1) + 8 * (void)v37) copyWithZone:a3];
        [v6 addRegProvFtaiList:v38];

        long long v37 = (char *)v37 + 1;
      }
      while (v35 != v37);
      id v35 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v40 objects:v60 count:16];
    }
    while (v35);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v6 + 16) = self->_subsId;
    *((unsigned char *)v6 + 68) |= 2u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_23;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
LABEL_23:
    BOOL v11 = 0;
    goto LABEL_24;
  }
  imsuint64_t i = self->_imsi;
  if ((unint64_t)imsi | *((void *)v4 + 3) && !-[NSData isEqual:](imsi, "isEqual:")) {
    goto LABEL_23;
  }
  eplmnLists = self->_eplmnLists;
  if ((unint64_t)eplmnLists | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](eplmnLists, "isEqual:")) {
      goto LABEL_23;
    }
  }
  roamingFlaiLists = self->_roamingFlaiLists;
  if ((unint64_t)roamingFlaiLists | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](roamingFlaiLists, "isEqual:")) {
      goto LABEL_23;
    }
  }
  regProvFlaiLists = self->_regProvFlaiLists;
  if ((unint64_t)regProvFlaiLists | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](regProvFlaiLists, "isEqual:")) {
      goto LABEL_23;
    }
  }
  roamingFtaiLists = self->_roamingFtaiLists;
  if ((unint64_t)roamingFtaiLists | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](roamingFtaiLists, "isEqual:")) {
      goto LABEL_23;
    }
  }
  regProvFtaiLists = self->_regProvFtaiLists;
  if ((unint64_t)regProvFtaiLists | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](regProvFtaiLists, "isEqual:")) {
      goto LABEL_23;
    }
  }
  BOOL v11 = (*((unsigned char *)v4 + 68) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 2) == 0 || self->_subsId != *((_DWORD *)v4 + 16)) {
      goto LABEL_23;
    }
    BOOL v11 = 1;
  }
LABEL_24:

  return v11;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  unint64_t v4 = (unint64_t)[(NSData *)self->_imsi hash];
  unint64_t v5 = (unint64_t)[(NSMutableArray *)self->_eplmnLists hash];
  unint64_t v6 = (unint64_t)[(NSMutableArray *)self->_roamingFlaiLists hash];
  unint64_t v7 = (unint64_t)[(NSMutableArray *)self->_regProvFlaiLists hash];
  unint64_t v8 = (unint64_t)[(NSMutableArray *)self->_roamingFtaiLists hash];
  unint64_t v9 = (unint64_t)[(NSMutableArray *)self->_regProvFtaiLists hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v10 = 2654435761 * self->_subsId;
  }
  else {
    uint64_t v10 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  id v5 = v4;
  if (*((unsigned char *)v4 + 68))
  {
    self->_timestamp = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (v4[3]) {
    -[KCellularMmCommonInfo setImsi:](self, "setImsi:");
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v6 = *((id *)v5 + 2);
  id v7 = [v6 countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v48 != v9) {
          objc_enumerationMutation(v6);
        }
        [(KCellularMmCommonInfo *)self addEplmnList:*(void *)(*((void *)&v47 + 1) + 8 * i)];
      }
      id v8 = [v6 countByEnumeratingWithState:&v47 objects:v55 count:16];
    }
    while (v8);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v11 = *((id *)v5 + 6);
  id v12 = [v11 countByEnumeratingWithState:&v43 objects:v54 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v44;
    do
    {
      for (uint64_t j = 0; j != v13; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v44 != v14) {
          objc_enumerationMutation(v11);
        }
        [(KCellularMmCommonInfo *)self addRoamingFlaiList:*(void *)(*((void *)&v43 + 1) + 8 * (void)j)];
      }
      id v13 = [v11 countByEnumeratingWithState:&v43 objects:v54 count:16];
    }
    while (v13);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v16 = *((id *)v5 + 4);
  id v17 = [v16 countByEnumeratingWithState:&v39 objects:v53 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v40;
    do
    {
      for (uint64_t k = 0; k != v18; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v40 != v19) {
          objc_enumerationMutation(v16);
        }
        [(KCellularMmCommonInfo *)self addRegProvFlaiList:*(void *)(*((void *)&v39 + 1) + 8 * (void)k)];
      }
      id v18 = [v16 countByEnumeratingWithState:&v39 objects:v53 count:16];
    }
    while (v18);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v21 = *((id *)v5 + 7);
  id v22 = [v21 countByEnumeratingWithState:&v35 objects:v52 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v36;
    do
    {
      for (uint64_t m = 0; m != v23; uint64_t m = (char *)m + 1)
      {
        if (*(void *)v36 != v24) {
          objc_enumerationMutation(v21);
        }
        [(KCellularMmCommonInfo *)self addRoamingFtaiList:*(void *)(*((void *)&v35 + 1) + 8 * (void)m)];
      }
      id v23 = [v21 countByEnumeratingWithState:&v35 objects:v52 count:16];
    }
    while (v23);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v26 = *((id *)v5 + 5);
  id v27 = [v26 countByEnumeratingWithState:&v31 objects:v51 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v32;
    do
    {
      for (uint64_t n = 0; n != v28; uint64_t n = (char *)n + 1)
      {
        if (*(void *)v32 != v29) {
          objc_enumerationMutation(v26);
        }
        -[KCellularMmCommonInfo addRegProvFtaiList:](self, "addRegProvFtaiList:", *(void *)(*((void *)&v31 + 1) + 8 * (void)n), (void)v31);
      }
      id v28 = [v26 countByEnumeratingWithState:&v31 objects:v51 count:16];
    }
    while (v28);
  }

  if ((*((unsigned char *)v5 + 68) & 2) != 0)
  {
    self->_subsId = *((_DWORD *)v5 + 16);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSData)imsi
{
  return self->_imsi;
}

- (void)setImsi:(id)a3
{
}

- (NSMutableArray)eplmnLists
{
  return self->_eplmnLists;
}

- (void)setEplmnLists:(id)a3
{
}

- (NSMutableArray)roamingFlaiLists
{
  return self->_roamingFlaiLists;
}

- (void)setRoamingFlaiLists:(id)a3
{
}

- (NSMutableArray)regProvFlaiLists
{
  return self->_regProvFlaiLists;
}

- (void)setRegProvFlaiLists:(id)a3
{
}

- (NSMutableArray)roamingFtaiLists
{
  return self->_roamingFtaiLists;
}

- (void)setRoamingFtaiLists:(id)a3
{
}

- (NSMutableArray)regProvFtaiLists
{
  return self->_regProvFtaiLists;
}

- (void)setRegProvFtaiLists:(id)a3
{
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roamingFtaiLists, 0);
  objc_storeStrong((id *)&self->_roamingFlaiLists, 0);
  objc_storeStrong((id *)&self->_regProvFtaiLists, 0);
  objc_storeStrong((id *)&self->_regProvFlaiLists, 0);
  objc_storeStrong((id *)&self->_imsi, 0);

  objc_storeStrong((id *)&self->_eplmnLists, 0);
}

@end