@interface _ICPredictedItem
+ (BOOL)supportsSecureCoding;
+ (id)predictedItemFromQuickTypeItem:(id)a3 trigger:(id)a4;
- (BOOL)hasScoreSimilarToItem:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPredictedItem:(id)a3;
- (BOOL)shouldAggregate;
- (NSDate)date;
- (NSDictionary)operationData;
- (NSString)identifier;
- (NSString)label;
- (NSString)name;
- (NSString)originatingBundleID;
- (NSString)targetBundleID;
- (NSString)value;
- (NSURL)originatingWebsiteURL;
- (_ICPredictedItem)initWithCoder:(id)a3;
- (_ICPredictedItem)initWithIdentifier:(id)a3 itemType:(unsigned __int8)a4 score:(double)a5 value:(id)a6 label:(id)a7 name:(id)a8 date:(id)a9 originatingBundleID:(id)a10 originatingWebsiteURL:(id)a11 predictionAge:(unint64_t)a12 shouldAggregate:(BOOL)a13 flags:(unsigned __int8)a14 targetBundleID:(id)a15 operationData:(id)a16 proactiveTrigger:(id)a17;
- (_ICPredictedItem)initWithIdentifier:(id)a3 score:(double)a4 value:(id)a5 label:(id)a6 name:(id)a7 date:(id)a8 originatingBundleID:(id)a9 originatingWebsiteURL:(id)a10 predictionAge:(unint64_t)a11 shouldAggregate:(BOOL)a12 flags:(unsigned __int8)a13 proactiveTrigger:(id)a14;
- (_ICProactiveTrigger)trigger;
- (double)score;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)predictionAge;
- (unsigned)flags;
- (unsigned)itemType;
- (unsigned)layoutHint;
- (void)encodeWithCoder:(id)a3;
- (void)setFlags:(unsigned __int8)a3;
- (void)setItemType:(unsigned __int8)a3;
- (void)setLayoutHint:(unsigned __int8)a3;
- (void)setPredictionAge:(unint64_t)a3;
@end

@implementation _ICPredictedItem

- (_ICPredictedItem)initWithIdentifier:(id)a3 score:(double)a4 value:(id)a5 label:(id)a6 name:(id)a7 date:(id)a8 originatingBundleID:(id)a9 originatingWebsiteURL:(id)a10 predictionAge:(unint64_t)a11 shouldAggregate:(BOOL)a12 flags:(unsigned __int8)a13 proactiveTrigger:(id)a14
{
  LOWORD(v15) = __PAIR16__(a13, a12);
  return -[_ICPredictedItem initWithIdentifier:itemType:score:value:label:name:date:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:targetBundleID:operationData:proactiveTrigger:](self, "initWithIdentifier:itemType:score:value:label:name:date:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:targetBundleID:operationData:proactiveTrigger:", a3, 0, a5, a6, a7, a8, a4, a9, a10, a11, v15, 0, 0, a14);
}

- (_ICPredictedItem)initWithIdentifier:(id)a3 itemType:(unsigned __int8)a4 score:(double)a5 value:(id)a6 label:(id)a7 name:(id)a8 date:(id)a9 originatingBundleID:(id)a10 originatingWebsiteURL:(id)a11 predictionAge:(unint64_t)a12 shouldAggregate:(BOOL)a13 flags:(unsigned __int8)a14 targetBundleID:(id)a15 operationData:(id)a16 proactiveTrigger:(id)a17
{
  id v40 = a3;
  id obj = a6;
  id v37 = a6;
  id v34 = a7;
  id v23 = a7;
  id v35 = a8;
  id v24 = a8;
  id v39 = a9;
  id v38 = a10;
  id v25 = a11;
  id v26 = a15;
  id v27 = a16;
  id v28 = a17;
  v41.receiver = self;
  v41.super_class = (Class)_ICPredictedItem;
  v29 = [(_ICPredictedItem *)&v41 init];
  v30 = v29;
  if (v29)
  {
    objc_storeStrong((id *)&v29->_identifier, a3);
    v30->_itemType = a4;
    v30->_score = a5;
    objc_storeStrong((id *)&v30->_value, obj);
    objc_storeStrong((id *)&v30->_label, v34);
    objc_storeStrong((id *)&v30->_name, v35);
    objc_storeStrong((id *)&v30->_date, a9);
    objc_storeStrong((id *)&v30->_originatingBundleID, a10);
    objc_storeStrong((id *)&v30->_originatingWebsiteURL, a11);
    v30->_predictionAge = a12;
    v30->_shouldAggregate = a13;
    v30->_flags = a14;
    objc_storeStrong((id *)&v30->_targetBundleID, a15);
    objc_storeStrong((id *)&v30->_operationData, a16);
    objc_storeStrong((id *)&v30->_trigger, a17);
    v30->_layoutHint = 0;
  }

  return v30;
}

+ (id)predictedItemFromQuickTypeItem:(id)a3 trigger:(id)a4
{
  id v6 = a3;
  id v23 = a4;
  char v7 = [v6 flags];
  char v8 = [v6 flags] & 2 | v7 & 1;
  if (([v6 source] & 0xA) != 0) {
    v8 |= [v6 flags] & 4;
  }
  id v22 = objc_alloc((Class)a1);
  v21 = [v6 sourceIdentifier];
  [v6 score];
  double v10 = v9;
  v11 = [v6 value];
  v12 = [v6 label];
  v13 = [v6 name];
  v14 = [v6 date];
  uint64_t v15 = [v6 originatingBundleID];
  v16 = [v6 originatingWebsiteURL];
  uint64_t v17 = [v6 predictionAge];
  BYTE1(v20) = v8;
  LOBYTE(v20) = [v6 shouldAggregate];
  v18 = objc_msgSend(v22, "initWithIdentifier:itemType:score:value:label:name:date:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:targetBundleID:operationData:proactiveTrigger:", v21, 0, v11, v12, v13, v14, v10, v15, v16, v17, v20, 0, 0, v23);

  return v18;
}

- (id)description
{
  if (self->_itemType) {
    [NSString stringWithFormat:@"<_ICPredictedItem  '%@' %@>", self->_targetBundleID, self->_operationData, v4, v5, v6, v7];
  }
  else {
  v2 = [NSString stringWithFormat:@"<_ICPredictedItem '%@' %@=%@ [%@] s:%f f:%lu>", self->_name, self->_label, self->_value, self->_date, *(void *)&self->_score, self->_flags];
  }
  return v2;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_ICProactiveTrigger *)self->_trigger hash];
  NSUInteger v4 = [(NSString *)self->_name hash] - v3 + 32 * v3;
  NSUInteger v5 = [(NSString *)self->_label hash] - v4 + 32 * v4;
  NSUInteger v6 = [(NSString *)self->_value hash] - v5 + 32 * v5;
  NSUInteger v7 = [(NSString *)self->_name hash] - v6 + 32 * v6;
  uint64_t v8 = [(NSDate *)self->_date hash] - v7 + 32 * v7;
  NSUInteger v9 = [(NSString *)self->_originatingBundleID hash] - v8 + 32 * v8;
  uint64_t v10 = [(NSURL *)self->_originatingWebsiteURL hash];
  unint64_t v11 = self->_predictionAge - (v10 - v9 + 32 * v9) + 32 * (v10 - v9 + 32 * v9);
  uint64_t v12 = self->_shouldAggregate - v11 + 32 * v11;
  uint64_t v13 = self->_flags - v12 + 32 * v12;
  unint64_t v14 = (unint64_t)self->_score - v13 + 32 * v13;
  uint64_t v15 = self->_itemType - v14 + 32 * v14;
  NSUInteger v16 = [(NSString *)self->_targetBundleID hash] - v15 + 32 * v15;
  return [(NSDictionary *)self->_operationData hash] - v16 + 32 * v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_ICPredictedItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)_ICPredictedItem;
  NSUInteger v5 = [(_ICPredictedItem *)&v32 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    [v4 decodeDoubleForKey:@"score"];
    v5->_score = v8;
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];
    value = v5->_value;
    v5->_value = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
    label = v5->_label;
    v5->_label = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    date = v5->_date;
    v5->_date = (NSDate *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originatingBundleID"];
    originatingBundleID = v5->_originatingBundleID;
    v5->_originatingBundleID = (NSString *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originatingWebsiteURL"];
    originatingWebsiteURL = v5->_originatingWebsiteURL;
    v5->_originatingWebsiteURL = (NSURL *)v19;

    v5->_predictionAge = [v4 decodeIntegerForKey:@"predictionAge"];
    v5->_shouldAggregate = [v4 decodeBoolForKey:@"shouldAggregate"];
    v5->_flags = [v4 decodeInt64ForKey:@"flags"];
    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trigger"];
    trigger = v5->_trigger;
    v5->_trigger = (_ICProactiveTrigger *)v21;

    v5->_itemType = [v4 decodeInt64ForKey:@"itemType"];
    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"targetBundleID"];
    targetBundleID = v5->_targetBundleID;
    v5->_targetBundleID = (NSString *)v23;

    id v25 = (void *)MEMORY[0x263EFFA08];
    uint64_t v26 = objc_opt_class();
    id v27 = objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
    id v28 = [v4 decodeObjectOfClasses:v27 forKey:@"operationData"];
    uint64_t v29 = [v28 copy];
    operationData = v5->_operationData;
    v5->_operationData = (NSDictionary *)v29;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeDouble:@"score" forKey:self->_score];
  [v5 encodeObject:self->_value forKey:@"value"];
  [v5 encodeObject:self->_label forKey:@"label"];
  [v5 encodeObject:self->_name forKey:@"name"];
  [v5 encodeObject:self->_date forKey:@"date"];
  [v5 encodeObject:self->_originatingBundleID forKey:@"originatingBundleID"];
  [v5 encodeObject:self->_originatingWebsiteURL forKey:@"originatingWebsiteURL"];
  [v5 encodeInteger:self->_predictionAge forKey:@"predictionAge"];
  [v5 encodeBool:self->_shouldAggregate forKey:@"shouldAggregate"];
  [v5 encodeInt64:self->_flags forKey:@"flags"];
  [v5 encodeObject:self->_trigger forKey:@"trigger"];
  [v5 encodeInt64:self->_itemType forKey:@"itemType"];
  [v5 encodeObject:self->_targetBundleID forKey:@"targetBundleID"];
  [v5 encodeObject:self->_operationData forKey:@"operationData"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init((Class)objc_opt_class());
  if (v5)
  {
    uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
    NSUInteger v7 = (void *)v5[2];
    v5[2] = v6;

    v5[11] = *(void *)&self->_score;
    uint64_t v8 = [(NSString *)self->_label copyWithZone:a3];
    uint64_t v9 = (void *)v5[4];
    v5[4] = v8;

    uint64_t v10 = [(NSString *)self->_value copyWithZone:a3];
    uint64_t v11 = (void *)v5[5];
    v5[5] = v10;

    uint64_t v12 = [(NSString *)self->_name copyWithZone:a3];
    uint64_t v13 = (void *)v5[6];
    v5[6] = v12;

    uint64_t v14 = [(NSDate *)self->_date copyWithZone:a3];
    uint64_t v15 = (void *)v5[7];
    v5[7] = v14;

    uint64_t v16 = [(NSString *)self->_originatingBundleID copyWithZone:a3];
    uint64_t v17 = (void *)v5[8];
    v5[8] = v16;

    uint64_t v18 = [(NSURL *)self->_originatingWebsiteURL copyWithZone:a3];
    uint64_t v19 = (void *)v5[9];
    v5[9] = v18;

    v5[10] = self->_predictionAge;
    *((unsigned char *)v5 + 9) = self->_shouldAggregate;
    *((unsigned char *)v5 + 10) = self->_flags;
    id v20 = [(_ICProactiveTrigger *)self->_trigger copyWithZone:a3];
    uint64_t v21 = (void *)v5[3];
    v5[3] = v20;

    *((unsigned char *)v5 + 8) = self->_itemType;
    uint64_t v22 = [(NSString *)self->_targetBundleID copyWithZone:a3];
    uint64_t v23 = (void *)v5[12];
    v5[12] = v22;

    uint64_t v24 = [(NSDictionary *)self->_operationData copyWithZone:a3];
    id v25 = (void *)v5[13];
    v5[13] = v24;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_ICPredictedItem *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(_ICPredictedItem *)self isEqualToPredictedItem:v5];

  return v6;
}

- (BOOL)hasScoreSimilarToItem:(id)a3
{
  return vabdd_f64(self->_score, *((double *)a3 + 11)) < 0.000001;
}

- (BOOL)isEqualToPredictedItem:(id)a3
{
  id v4 = (NSString **)a3;
  if (!v4) {
    goto LABEL_27;
  }
  identifier = self->_identifier;
  if (identifier != v4[2] && !-[NSString isEqual:](identifier, "isEqual:")) {
    goto LABEL_27;
  }
  label = self->_label;
  if (label != v4[4] && !-[NSString isEqual:](label, "isEqual:")) {
    goto LABEL_27;
  }
  if (((value = self->_value, value == v4[5]) || -[NSString isEqual:](value, "isEqual:"))
    && ((name = self->_name, name == v4[6]) || -[NSString isEqual:](name, "isEqual:"))
    && ((date = self->_date, date == (NSDate *)v4[7]) || -[NSDate isEqual:](date, "isEqual:"))
    && ((originatingBundleID = self->_originatingBundleID, originatingBundleID == v4[8])
     || -[NSString isEqual:](originatingBundleID, "isEqual:"))
    && ((originatingWebsiteURL = self->_originatingWebsiteURL, originatingWebsiteURL == (NSURL *)v4[9])
     || -[NSURL isEqual:](originatingWebsiteURL, "isEqual:"))
    && (NSString *)self->_predictionAge == v4[10]
    && [(_ICPredictedItem *)self hasScoreSimilarToItem:v4]
    && ((trigger = self->_trigger, trigger == (_ICProactiveTrigger *)v4[3])
     || -[_ICProactiveTrigger isEqual:](trigger, "isEqual:"))
    && self->_flags == *((unsigned __int8 *)v4 + 10)
    && self->_shouldAggregate == *((unsigned __int8 *)v4 + 9)
    && self->_itemType == *((unsigned __int8 *)v4 + 8)
    && ((targetBundleID = self->_targetBundleID, targetBundleID == v4[12])
     || -[NSString isEqual:](targetBundleID, "isEqual:")))
  {
    operationData = self->_operationData;
    if (operationData == (NSDictionary *)v4[13]) {
      char v15 = 1;
    }
    else {
      char v15 = -[NSDictionary isEqual:](operationData, "isEqual:");
    }
  }
  else
  {
LABEL_27:
    char v15 = 0;
  }

  return v15;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (_ICProactiveTrigger)trigger
{
  return self->_trigger;
}

- (unsigned)itemType
{
  return self->_itemType;
}

- (void)setItemType:(unsigned __int8)a3
{
  self->_itemType = a3;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)value
{
  return self->_value;
}

- (NSString)name
{
  return self->_name;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)originatingBundleID
{
  return self->_originatingBundleID;
}

- (NSURL)originatingWebsiteURL
{
  return self->_originatingWebsiteURL;
}

- (unint64_t)predictionAge
{
  return self->_predictionAge;
}

- (void)setPredictionAge:(unint64_t)a3
{
  self->_predictionAge = a3;
}

- (BOOL)shouldAggregate
{
  return self->_shouldAggregate;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned __int8)a3
{
  self->_flags = a3;
}

- (unsigned)layoutHint
{
  return self->_layoutHint;
}

- (void)setLayoutHint:(unsigned __int8)a3
{
  self->_layoutHint = a3;
}

- (double)score
{
  return self->_score;
}

- (NSString)targetBundleID
{
  return self->_targetBundleID;
}

- (NSDictionary)operationData
{
  return self->_operationData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationData, 0);
  objc_storeStrong((id *)&self->_targetBundleID, 0);
  objc_storeStrong((id *)&self->_originatingWebsiteURL, 0);
  objc_storeStrong((id *)&self->_originatingBundleID, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_trigger, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end