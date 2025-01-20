@interface BMAskToBuyEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMAskToBuyEvent)initWithProto:(id)a3;
- (BMAskToBuyEvent)initWithProtoData:(id)a3;
- (BMAskToBuyEvent)initWithRequestID:(id)a3 status:(int)a4 eventTime:(double)a5 userID:(id)a6 actionUserID:(id)a7 itemTitle:(id)a8 itemDescription:(id)a9 itemLocalizedPrice:(id)a10 thumbnailPath:(id)a11 ageRating:(id)a12 starRating:(id)a13 productType:(id)a14;
- (BMAskToBuyEvent)initWithRequestID:(id)a3 status:(int)a4 eventTime:(double)a5 userID:(id)a6 actionUserID:(id)a7 itemTitle:(id)a8 itemDescription:(id)a9 itemLocalizedPrice:(id)a10 thumbnailPath:(id)a11 ageRating:(id)a12 starRating:(id)a13 productType:(id)a14 isActionUserDevice:(BOOL)a15 storeLink:(id)a16;
- (BOOL)isActionUserDevice;
- (BOOL)isEqual:(id)a3;
- (BOOL)validNonOptionalProperty:(id)a3 propertyName:(id)a4;
- (NSNumber)itemStarRating;
- (NSString)actionUserID;
- (NSString)itemAgeRating;
- (NSString)itemDescription;
- (NSString)itemLocalizedPrice;
- (NSString)itemTitle;
- (NSString)productType;
- (NSString)requestID;
- (NSString)storeLink;
- (NSString)thumbnailPath;
- (NSString)userID;
- (double)eventTime;
- (id)encodeAsProto;
- (id)json;
- (id)jsonDict;
- (id)proto;
- (int)status;
- (unint64_t)hash;
- (unsigned)dataVersion;
- (void)setActionUserID:(id)a3;
- (void)setEventTime:(double)a3;
- (void)setIsActionUserDevice:(BOOL)a3;
- (void)setItemAgeRating:(id)a3;
- (void)setItemDescription:(id)a3;
- (void)setItemLocalizedPrice:(id)a3;
- (void)setItemStarRating:(id)a3;
- (void)setItemTitle:(id)a3;
- (void)setProductType:(id)a3;
- (void)setRequestID:(id)a3;
- (void)setStatus:(int)a3;
- (void)setStoreLink:(id)a3;
- (void)setThumbnailPath:(id)a3;
- (void)setUserID:(id)a3;
@end

@implementation BMAskToBuyEvent

- (BOOL)validNonOptionalProperty:(id)a3 propertyName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5)
  {
    v11 = __biome_log_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[BMAskToBuyEvent validNonOptionalProperty:propertyName:]((uint64_t)v6, v11);
    }
    goto LABEL_8;
  }
  v7 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  v8 = [v5 stringByTrimmingCharactersInSet:v7];
  uint64_t v9 = [v8 length];

  if (!v9)
  {
    v11 = __biome_log_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[BMAskToBuyEvent validNonOptionalProperty:propertyName:]((uint64_t)v6, v11);
    }
LABEL_8:

    BOOL v10 = 0;
    goto LABEL_9;
  }
  BOOL v10 = 1;
LABEL_9:

  return v10;
}

- (BMAskToBuyEvent)initWithRequestID:(id)a3 status:(int)a4 eventTime:(double)a5 userID:(id)a6 actionUserID:(id)a7 itemTitle:(id)a8 itemDescription:(id)a9 itemLocalizedPrice:(id)a10 thumbnailPath:(id)a11 ageRating:(id)a12 starRating:(id)a13 productType:(id)a14
{
  LOBYTE(v15) = 0;
  return [(BMAskToBuyEvent *)self initWithRequestID:a3 status:*(void *)&a4 eventTime:a6 userID:a7 actionUserID:a8 itemTitle:a9 itemDescription:a5 itemLocalizedPrice:a10 thumbnailPath:a11 ageRating:a12 starRating:a13 productType:&stru_1EDD7E578 isActionUserDevice:v15 storeLink:0];
}

- (BMAskToBuyEvent)initWithRequestID:(id)a3 status:(int)a4 eventTime:(double)a5 userID:(id)a6 actionUserID:(id)a7 itemTitle:(id)a8 itemDescription:(id)a9 itemLocalizedPrice:(id)a10 thumbnailPath:(id)a11 ageRating:(id)a12 starRating:(id)a13 productType:(id)a14 isActionUserDevice:(BOOL)a15 storeLink:(id)a16
{
  id v37 = a3;
  id v31 = a6;
  id v44 = a6;
  id v33 = a7;
  id v36 = a7;
  id v34 = a8;
  id v42 = a8;
  v21 = (__CFString *)a9;
  id v41 = a10;
  id v40 = a11;
  id v43 = a12;
  id v39 = a13;
  id v35 = a14;
  id v22 = a16;
  v45.receiver = self;
  v45.super_class = (Class)BMAskToBuyEvent;
  v23 = [(BMEventBase *)&v45 init];
  v24 = v23;
  if (!v23)
  {
    v25 = v37;
LABEL_19:
    v28 = v24;
    goto LABEL_20;
  }
  v25 = v37;
  if ([(BMAskToBuyEvent *)v23 validNonOptionalProperty:v37 propertyName:@"requestID"]&& [(BMAskToBuyEvent *)v24 validNonOptionalProperty:v44 propertyName:@"userID"]&& [(BMAskToBuyEvent *)v24 validNonOptionalProperty:v43 propertyName:@"ageRating"]&& [(BMAskToBuyEvent *)v24 validNonOptionalProperty:v42 propertyName:@"itemTitle"]
    && [(BMAskToBuyEvent *)v24 validNonOptionalProperty:v41 propertyName:@"localizedPrice"]&& [(BMAskToBuyEvent *)v24 validNonOptionalProperty:v40 propertyName:@"thumbnailPath"])
  {
    if (!v21)
    {
      v26 = __biome_log_for_category();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        -[BMAskToBuyEvent initWithRequestID:status:eventTime:userID:actionUserID:itemTitle:itemDescription:itemLocalizedPrice:thumbnailPath:ageRating:starRating:productType:isActionUserDevice:storeLink:](v26);
      }

      v21 = &stru_1EDD7E578;
    }
    if (!v39)
    {
      v27 = __biome_log_for_category();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[BMAskToBuyEvent initWithRequestID:status:eventTime:userID:actionUserID:itemTitle:itemDescription:itemLocalizedPrice:thumbnailPath:ageRating:starRating:productType:isActionUserDevice:storeLink:](v27);
      }
    }
    objc_storeStrong((id *)&v24->_requestID, a3);
    v24->_status = a4;
    v24->_eventTime = a5;
    objc_storeStrong((id *)&v24->_userID, v31);
    objc_storeStrong((id *)&v24->_requestID, a3);
    objc_storeStrong((id *)&v24->_actionUserID, v33);
    objc_storeStrong((id *)&v24->_itemTitle, v34);
    objc_storeStrong((id *)&v24->_itemDescription, v21);
    objc_storeStrong((id *)&v24->_thumbnailPath, a11);
    objc_storeStrong((id *)&v24->_itemLocalizedPrice, a10);
    objc_storeStrong((id *)&v24->_itemAgeRating, a12);
    objc_storeStrong((id *)&v24->_itemStarRating, a13);
    objc_storeStrong((id *)&v24->_productType, a14);
    v24->_isActionUserDevice = a15;
    objc_storeStrong((id *)&v24->_storeLink, a16);
    v25 = v37;
    goto LABEL_19;
  }
  v28 = 0;
LABEL_20:

  return v28;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6 = a3;
  if (a4 - 3 > 0xFFFFFFFD)
  {
    v8 = (void *)[objc_alloc((Class)a1) initWithProtoData:v6];
  }
  else
  {
    v7 = __biome_log_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[BMAskToBuyEvent eventWithData:dataVersion:](a4, v7);
    }

    v8 = 0;
  }

  return v8;
}

- (unsigned)dataVersion
{
  return 2;
}

- (id)encodeAsProto
{
  v2 = [(BMAskToBuyEvent *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMAskToBuyEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBAskToBuyEvent alloc] initWithData:v4];

    self = [(BMAskToBuyEvent *)self initWithProto:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BMAskToBuyEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_10:
    uint64_t v15 = 0;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = __biome_log_for_category();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[BMAskToBuyEvent initWithProto:]((uint64_t)self, v16);
    }

    goto LABEL_10;
  }
  id v5 = v4;
  unsigned int v6 = [v5 status];
  if (v6 - 1 >= 3) {
    unsigned int v7 = 0;
  }
  else {
    unsigned int v7 = v6;
  }
  unsigned int v27 = v7;
  v25 = [v5 requestID];
  [v5 eventTime];
  double v9 = v8;
  v26 = [v5 userID];
  v24 = [v5 actionUserID];
  v23 = [v5 itemTitle];
  id v22 = [v5 itemDescription];
  v21 = [v5 itemLocalizedPrice];
  v20 = [v5 thumbnailPath];
  v19 = [v5 ageRating];
  BOOL v10 = NSNumber;
  [v5 starRating];
  v11 = objc_msgSend(v10, "numberWithFloat:");
  v12 = [v5 productType];
  char v13 = [v5 isActionUserDevice];
  v14 = [v5 storeLink];

  LOBYTE(v18) = v13;
  self = [(BMAskToBuyEvent *)self initWithRequestID:v25 status:v27 eventTime:v26 userID:v24 actionUserID:v23 itemTitle:v22 itemDescription:v9 itemLocalizedPrice:v21 thumbnailPath:v20 ageRating:v19 starRating:v11 productType:v12 isActionUserDevice:v18 storeLink:v14];

  uint64_t v15 = self;
LABEL_11:

  return v15;
}

- (id)proto
{
  unsigned int status = self->_status;
  if (status - 1 >= 3) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = status;
  }
  id v5 = objc_opt_new();
  [v5 setRequestID:self->_requestID];
  [v5 setStatus:v4];
  [v5 setEventTime:self->_eventTime];
  [v5 setItemTitle:self->_itemTitle];
  [v5 setItemDescription:self->_itemDescription];
  [v5 setItemLocalizedPrice:self->_itemLocalizedPrice];
  [v5 setThumbnailPath:self->_thumbnailPath];
  [v5 setUserID:self->_userID];
  [v5 setActionUserID:self->_actionUserID];
  [(NSNumber *)self->_itemStarRating floatValue];
  objc_msgSend(v5, "setStarRating:");
  [v5 setAgeRating:self->_itemAgeRating];
  [v5 setProductType:self->_productType];
  [v5 setIsActionUserDevice:self->_isActionUserDevice];
  [v5 setStoreLink:self->_storeLink];

  return v5;
}

- (id)jsonDict
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:self->_requestID forKeyedSubscript:@"requestID"];
  uint64_t v4 = [NSNumber numberWithInt:self->_status];
  [v3 setObject:v4 forKeyedSubscript:@"status"];

  id v5 = [NSNumber numberWithDouble:self->_eventTime];
  [v3 setObject:v5 forKeyedSubscript:@"eventTime"];

  [v3 setObject:self->_itemTitle forKeyedSubscript:@"itemTitle"];
  [v3 setObject:self->_itemDescription forKeyedSubscript:@"itemDescription"];
  [v3 setObject:self->_thumbnailPath forKeyedSubscript:@"thumbnailPath"];
  [v3 setObject:self->_itemLocalizedPrice forKeyedSubscript:@"itemLocalizedPrice"];
  [v3 setObject:self->_userID forKeyedSubscript:@"userID"];
  [v3 setObject:self->_actionUserID forKeyedSubscript:@"actionUserID"];
  [v3 setObject:self->_itemStarRating forKeyedSubscript:@"starRating"];
  [v3 setObject:self->_itemAgeRating forKeyedSubscript:@"ageRating"];
  [v3 setObject:self->_productType forKeyedSubscript:@"productType"];
  unsigned int v6 = [NSNumber numberWithBool:self->_isActionUserDevice];
  [v3 setObject:v6 forKeyedSubscript:@"isActionUserDevice"];

  [v3 setObject:self->_storeLink forKeyedSubscript:@"storeLink"];

  return v3;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(BMAskToBuyEvent *)self jsonDict];
  uint64_t v8 = 0;
  uint64_t v4 = [v2 dataWithJSONObject:v3 options:1 error:&v8];
  uint64_t v5 = v8;

  if (v5)
  {
    unsigned int v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[BMDeviceMetadataEvent json](v6);
    }
  }

  return v4;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_requestID hash];
  return [(NSString *)self->_userID hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unsigned int v6 = NSNumber;
    [(BMAskToBuyEvent *)self eventTime];
    unsigned int v7 = objc_msgSend(v6, "numberWithDouble:");
    uint64_t v8 = [v7 longValue];

    double v9 = NSNumber;
    [v5 eventTime];
    BOOL v10 = objc_msgSend(v9, "numberWithDouble:");
    uint64_t v11 = [v10 longValue];

    v12 = [(BMAskToBuyEvent *)self requestID];
    char v13 = [v5 requestID];
    int v14 = [v12 isEqualToString:v13];

    LODWORD(v12) = [(BMAskToBuyEvent *)self status];
    if (v12 == [v5 status]) {
      int v15 = v14;
    }
    else {
      int v15 = 0;
    }
    if (v8 == v11) {
      int v16 = v15;
    }
    else {
      int v16 = 0;
    }
    v17 = [(BMAskToBuyEvent *)self userID];
    uint64_t v18 = [v5 userID];
    int v19 = [v17 isEqualToString:v18];

    v20 = [(BMAskToBuyEvent *)self actionUserID];
    if (v20)
    {
      v21 = [(BMAskToBuyEvent *)self actionUserID];
    }
    else
    {
      v21 = @"___";
    }
    int v23 = v16 & v19;

    v24 = [v5 actionUserID];
    if (v24)
    {
      v25 = [v5 actionUserID];
    }
    else
    {
      v25 = @"___";
    }

    int v26 = [(__CFString *)v21 isEqualToString:v25];
    unsigned int v27 = [(BMAskToBuyEvent *)self itemAgeRating];
    v28 = [v5 itemAgeRating];
    int v29 = v23 & v26 & [v27 isEqualToString:v28];

    v30 = NSNumber;
    id v31 = [(BMAskToBuyEvent *)self itemStarRating];
    [v31 floatValue];
    id v33 = [v30 numberWithInteger:(uint64_t)(float)(v32 * 100.0)];
    uint64_t v34 = [v33 longValue];

    id v35 = NSNumber;
    id v36 = [v5 itemStarRating];
    [v36 floatValue];
    v38 = [v35 numberWithInteger:(uint64_t)(float)(v37 * 100.0)];
    uint64_t v39 = [v38 longValue];

    if (v34 == v39) {
      int v40 = v29;
    }
    else {
      int v40 = 0;
    }
    id v41 = [(BMAskToBuyEvent *)self itemAgeRating];
    id v42 = [v5 itemAgeRating];
    int v43 = [v41 isEqualToString:v42];

    id v44 = [(BMAskToBuyEvent *)self itemTitle];
    objc_super v45 = [v5 itemTitle];
    int v46 = v43 & [v44 isEqualToString:v45];

    v47 = [(BMAskToBuyEvent *)self itemDescription];
    v48 = [v5 itemDescription];
    int v49 = v46 & [v47 isEqualToString:v48];

    v50 = [(BMAskToBuyEvent *)self itemLocalizedPrice];
    v51 = [v5 itemLocalizedPrice];
    int v52 = v49 & [v50 isEqualToString:v51];

    v53 = [(BMAskToBuyEvent *)self thumbnailPath];
    v54 = [v5 thumbnailPath];
    int v55 = v52 & [v53 isEqualToString:v54];

    uint64_t v56 = [(BMAskToBuyEvent *)self productType];
    v57 = [v5 productType];
    int v58 = v55 & [(id)v56 isEqualToString:v57];

    LODWORD(v56) = [(BMAskToBuyEvent *)self isActionUserDevice];
    int v59 = v58 & (v56 ^ [v5 isActionUserDevice] ^ 1);
    v60 = [(BMAskToBuyEvent *)self storeLink];
    if (v60)
    {
      v61 = [(BMAskToBuyEvent *)self storeLink];
    }
    else
    {
      v61 = @"___";
    }
    int v62 = v40 & v59;

    v63 = [v5 storeLink];
    if (v63)
    {
      v64 = [v5 storeLink];
    }
    else
    {
      v64 = @"___";
    }

    int v22 = v62 & [(__CFString *)v61 isEqualToString:v64];
  }
  else
  {
    LOBYTE(v22) = 0;
  }

  return v22;
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_unsigned int status = a3;
}

- (double)eventTime
{
  return self->_eventTime;
}

- (void)setEventTime:(double)a3
{
  self->_eventTime = a3;
}

- (NSString)userID
{
  return self->_userID;
}

- (void)setUserID:(id)a3
{
}

- (NSString)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
}

- (NSString)actionUserID
{
  return self->_actionUserID;
}

- (void)setActionUserID:(id)a3
{
}

- (NSString)itemTitle
{
  return self->_itemTitle;
}

- (void)setItemTitle:(id)a3
{
}

- (NSString)itemDescription
{
  return self->_itemDescription;
}

- (void)setItemDescription:(id)a3
{
}

- (NSString)thumbnailPath
{
  return self->_thumbnailPath;
}

- (void)setThumbnailPath:(id)a3
{
}

- (NSString)itemLocalizedPrice
{
  return self->_itemLocalizedPrice;
}

- (void)setItemLocalizedPrice:(id)a3
{
}

- (NSNumber)itemStarRating
{
  return self->_itemStarRating;
}

- (void)setItemStarRating:(id)a3
{
}

- (NSString)itemAgeRating
{
  return self->_itemAgeRating;
}

- (void)setItemAgeRating:(id)a3
{
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
}

- (BOOL)isActionUserDevice
{
  return self->_isActionUserDevice;
}

- (void)setIsActionUserDevice:(BOOL)a3
{
  self->_isActionUserDevice = a3;
}

- (NSString)storeLink
{
  return self->_storeLink;
}

- (void)setStoreLink:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeLink, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_itemAgeRating, 0);
  objc_storeStrong((id *)&self->_itemStarRating, 0);
  objc_storeStrong((id *)&self->_itemLocalizedPrice, 0);
  objc_storeStrong((id *)&self->_thumbnailPath, 0);
  objc_storeStrong((id *)&self->_itemDescription, 0);
  objc_storeStrong((id *)&self->_itemTitle, 0);
  objc_storeStrong((id *)&self->_actionUserID, 0);
  objc_storeStrong((id *)&self->_requestID, 0);

  objc_storeStrong((id *)&self->_userID, 0);
}

- (void)validNonOptionalProperty:(uint64_t)a1 propertyName:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "%@ is required", (uint8_t *)&v2, 0xCu);
}

- (void)validNonOptionalProperty:(uint64_t)a1 propertyName:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "%@ is empty", (uint8_t *)&v2, 0xCu);
}

- (void)initWithRequestID:(os_log_t)log status:eventTime:userID:actionUserID:itemTitle:itemDescription:itemLocalizedPrice:thumbnailPath:ageRating:starRating:productType:isActionUserDevice:storeLink:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18E67D000, log, OS_LOG_TYPE_ERROR, "starRating is required", v1, 2u);
}

- (void)initWithRequestID:(os_log_t)log status:eventTime:userID:actionUserID:itemTitle:itemDescription:itemLocalizedPrice:thumbnailPath:ageRating:starRating:productType:isActionUserDevice:storeLink:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_18E67D000, log, OS_LOG_TYPE_DEBUG, "itemDescription fallback to empty string", v1, 2u);
}

+ (void)eventWithData:(int)a1 dataVersion:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109376;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = 2;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "BMAskToBuyEvent: Mismatched data versions (%u != %u) cannot deserialize", (uint8_t *)v2, 0xEu);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  __int16 v3 = (objc_class *)objc_opt_class();
  int v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  unsigned int v6 = v4;
  _os_log_fault_impl(&dword_18E67D000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBAskToBuyEvent proto", (uint8_t *)&v5, 0xCu);
}

@end