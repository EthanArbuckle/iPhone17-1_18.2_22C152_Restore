@interface GEOMediaLink
+ (id)mediaLinkFromProto:(id)a3;
- (GEOMediaLink)initWithAdamID:(id)a3 mediaType:(int)a4 mediaSubType:(int)a5 thirdPartyLinks:(id)a6 relatedCollectionItemIndex:(int64_t)a7 position:(unint64_t)a8;
- (NSArray)thirdPartyLinks;
- (NSString)adamID;
- (int)mediaSubType;
- (int)mediaType;
- (int64_t)relatedCollectionItemIndex;
- (unint64_t)position;
@end

@implementation GEOMediaLink

+ (id)mediaLinkFromProto:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = (uint64_t)v3;
  if (v3)
  {
    -[GEOPDMediaLink _readAdamId]((uint64_t)v3);
    if (*(void *)(v4 + 24))
    {
      BOOL v5 = 1;
    }
    else
    {
      -[GEOPDMediaLink _readSubId](v4);
      BOOL v5 = *(void *)(v4 + 40) != 0;
    }
    unsigned int v6 = *(unsigned __int8 *)(v4 + 76);
    int v7 = (v6 >> 1) & 1;
    int v8 = v6 & 1;
    if (v5 && (v6 & 2) != 0 && v8 != 0)
    {
      v10 = -[GEOPDMediaLink thirdPartyLinks]((id *)v4);
      v11 = objc_msgSend(v10, "_geo_compactMap:", &__block_literal_global_81);

      -[GEOPDMediaLink _readSubId](v4);
      if (*(void *)(v4 + 40)) {
        -[GEOPDMediaLink subId]((id *)v4);
      }
      else {
      v12 = -[GEOPDMediaLink adamId]((id *)v4);
      }
      -[GEOPDMediaLink _readMediaLinkPositionMetaData](v4);
      if (!*(void *)(v4 + 32))
      {
        uint64_t v15 = 0;
        uint64_t v14 = 1;
        goto LABEL_23;
      }
      uint64_t v13 = -[GEOPDMediaLink mediaLinkPositionMetaData]((id *)v4);
      if (!v13)
      {
        uint64_t v14 = 0;
        uint64_t v15 = 0;
        goto LABEL_21;
      }
      if ((*(unsigned char *)(v13 + 24) & 2) != 0)
      {
        uint64_t v14 = *(unsigned int *)(v13 + 20);
        if (v14 < 2)
        {
LABEL_20:
          uint64_t v15 = *(int *)(v13 + 16);
LABEL_21:

LABEL_23:
          v16 = [GEOMediaLink alloc];
          uint64_t v17 = -[GEOPDMediaLink mediaType](v4);
          v18 = -[GEOMediaLink initWithAdamID:mediaType:mediaSubType:thirdPartyLinks:relatedCollectionItemIndex:position:](v16, "initWithAdamID:mediaType:mediaSubType:thirdPartyLinks:relatedCollectionItemIndex:position:", v12, v17, -[GEOPDMediaLink mediaSubType](v4), v11, v15, v14);

          goto LABEL_36;
        }
        if (v14 == 2)
        {
          uint64_t v14 = 2;
          goto LABEL_20;
        }
      }
      uint64_t v14 = 0;
      goto LABEL_20;
    }
  }
  else
  {
    int v8 = 0;
    BOOL v5 = 0;
    int v7 = 0;
  }
  v19 = GEOGetCuratedCollectionsLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v20 = "NO";
    if (v5) {
      v21 = "YES";
    }
    else {
      v21 = "NO";
    }
    if (v7) {
      v22 = "YES";
    }
    else {
      v22 = "NO";
    }
    int v24 = 136315650;
    v25 = v21;
    __int16 v26 = 2080;
    v27 = v22;
    if (v8) {
      v20 = "YES";
    }
    __int16 v28 = 2080;
    v29 = v20;
    _os_log_impl(&dword_188D96000, v19, OS_LOG_TYPE_ERROR, "Media Link could not be initialized because some data is missing.\nMedia Link hasAdamID: %s, hasMediaType: %s, hasMediaSubType: %s", (uint8_t *)&v24, 0x20u);
  }

  v18 = 0;
LABEL_36:

  return v18;
}

id __35__GEOMediaLink_mediaLinkFromProto___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[GEOThirdPartyLink thirdPartyLinkFromProto:a2];
}

- (GEOMediaLink)initWithAdamID:(id)a3 mediaType:(int)a4 mediaSubType:(int)a5 thirdPartyLinks:(id)a6 relatedCollectionItemIndex:(int64_t)a7 position:(unint64_t)a8
{
  id v14 = a3;
  id v15 = a6;
  v22.receiver = self;
  v22.super_class = (Class)GEOMediaLink;
  v16 = [(GEOMediaLink *)&v22 init];
  if (v16)
  {
    uint64_t v17 = [v14 copy];
    adamID = v16->_adamID;
    v16->_adamID = (NSString *)v17;

    v16->_mediaType = a4;
    v16->_mediaSubType = a5;
    uint64_t v19 = [v15 copy];
    thirdPartyLinks = v16->_thirdPartyLinks;
    v16->_thirdPartyLinks = (NSArray *)v19;

    v16->_relatedCollectionItemIndex = a7;
    v16->_position = a8;
  }

  return v16;
}

- (NSString)adamID
{
  return self->_adamID;
}

- (int)mediaType
{
  return self->_mediaType;
}

- (int)mediaSubType
{
  return self->_mediaSubType;
}

- (NSArray)thirdPartyLinks
{
  return self->_thirdPartyLinks;
}

- (int64_t)relatedCollectionItemIndex
{
  return self->_relatedCollectionItemIndex;
}

- (unint64_t)position
{
  return self->_position;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thirdPartyLinks, 0);

  objc_storeStrong((id *)&self->_adamID, 0);
}

@end