@interface HKSelectedRangeData
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSelectedRangeData:(id)a3;
- (BOOL)prefersImageAffixes;
- (HKSelectedRangeData)initWithStatisticsType:(int64_t)a3;
- (NSAttributedString)attributedString;
- (NSMutableDictionary)metadata;
- (NSNumber)valueAsNumber;
- (NSString)titleOverride;
- (UIColor)prefixColor;
- (UIColor)titleColorOverride;
- (id)description;
- (id)titleTapOutBlock;
- (int64_t)dataType;
- (int64_t)statisticsType;
- (unint64_t)hash;
- (void)setAttributedString:(id)a3;
- (void)setDataType:(int64_t)a3;
- (void)setMetadata:(id)a3;
- (void)setPrefersImageAffixes:(BOOL)a3;
- (void)setPrefixColor:(id)a3;
- (void)setStatisticsType:(int64_t)a3;
- (void)setTitleColorOverride:(id)a3;
- (void)setTitleOverride:(id)a3;
- (void)setTitleTapOutBlock:(id)a3;
- (void)setValueAsNumber:(id)a3;
@end

@implementation HKSelectedRangeData

- (HKSelectedRangeData)initWithStatisticsType:(int64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)HKSelectedRangeData;
  v4 = [(HKSelectedRangeData *)&v14 init];
  v5 = v4;
  if (v4)
  {
    v4->_statisticsType = a3;
    v4->_dataType = 0;
    attributedString = v4->_attributedString;
    v4->_attributedString = 0;

    titleOverride = v5->_titleOverride;
    v5->_titleOverride = 0;

    titleColorOverride = v5->_titleColorOverride;
    v5->_titleColorOverride = 0;

    valueAsNumber = v5->_valueAsNumber;
    v5->_valueAsNumber = 0;

    prefixColor = v5->_prefixColor;
    v5->_prefixColor = 0;

    v5->_prefersImageAffixes = 1;
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    metadata = v5->_metadata;
    v5->_metadata = v11;
  }
  return v5;
}

- (unint64_t)hash
{
  int64_t v3 = [(HKSelectedRangeData *)self statisticsType];
  int64_t v4 = [(HKSelectedRangeData *)self dataType] ^ v3;
  v5 = [(HKSelectedRangeData *)self attributedString];
  uint64_t v6 = v4 ^ [v5 hash];
  v7 = [(HKSelectedRangeData *)self valueAsNumber];
  uint64_t v8 = [v7 hash];
  v9 = [(HKSelectedRangeData *)self prefixColor];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  uint64_t v11 = [(HKSelectedRangeData *)self prefersImageAffixes];
  v12 = [(HKSelectedRangeData *)self titleOverride];
  uint64_t v13 = v10 ^ v11 ^ [v12 hash];
  objc_super v14 = [(HKSelectedRangeData *)self titleColorOverride];
  uint64_t v15 = [v14 hash];
  v16 = [(HKSelectedRangeData *)self metadata];
  unint64_t v17 = v13 ^ v15 ^ [v16 hash];

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  int64_t v4 = (HKSelectedRangeData *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (self == v4)
  {
    BOOL v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v6 = [(HKSelectedRangeData *)self isEqualToSelectedRangeData:v5];
  }
  else {
LABEL_5:
  }
    BOOL v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)isEqualToSelectedRangeData:(id)a3
{
  id v4 = a3;
  v5 = [(HKSelectedRangeData *)self attributedString];
  if (v5)
  {

LABEL_4:
    v7 = [(HKSelectedRangeData *)self attributedString];
    uint64_t v8 = [v4 attributedString];
    int v9 = [v7 isEqualToAttributedString:v8];

    int v10 = v9 ^ 1;
    goto LABEL_5;
  }
  BOOL v6 = [v4 attributedString];

  if (v6) {
    goto LABEL_4;
  }
  int v10 = 0;
LABEL_5:
  uint64_t v11 = [(HKSelectedRangeData *)self valueAsNumber];
  if (v11)
  {

LABEL_8:
    uint64_t v13 = [(HKSelectedRangeData *)self valueAsNumber];
    objc_super v14 = [v4 valueAsNumber];
    int v15 = [v13 isEqualToNumber:v14];

    int v16 = v15 ^ 1;
    goto LABEL_9;
  }
  v12 = [v4 valueAsNumber];

  if (v12) {
    goto LABEL_8;
  }
  int v16 = 0;
LABEL_9:
  unint64_t v17 = [(HKSelectedRangeData *)self titleOverride];
  if (v17)
  {

LABEL_12:
    v19 = [(HKSelectedRangeData *)self titleOverride];
    v20 = [v4 titleOverride];
    int v21 = [v19 isEqualToString:v20];

    goto LABEL_13;
  }
  v18 = [v4 titleOverride];

  if (v18) {
    goto LABEL_12;
  }
  int v21 = 1;
LABEL_13:
  v22 = [(HKSelectedRangeData *)self titleColorOverride];
  if (v22)
  {

LABEL_16:
    v24 = [(HKSelectedRangeData *)self titleColorOverride];
    v25 = [v4 titleColorOverride];
    int v26 = [v24 isEqual:v25];

    int v27 = v26 ^ 1;
    goto LABEL_17;
  }
  v23 = [v4 titleColorOverride];

  if (v23) {
    goto LABEL_16;
  }
  int v27 = 0;
LABEL_17:
  v28 = [(HKSelectedRangeData *)self prefixColor];
  if (v28)
  {

LABEL_20:
    v30 = [(HKSelectedRangeData *)self prefixColor];
    v31 = [v4 prefixColor];
    int v21 = [v30 isEqual:v31];

    goto LABEL_21;
  }
  v29 = [v4 prefixColor];

  if (v29) {
    goto LABEL_20;
  }
LABEL_21:
  int64_t v32 = [(HKSelectedRangeData *)self statisticsType];
  if (v32 == [v4 statisticsType]
    && (int64_t v33 = -[HKSelectedRangeData dataType](self, "dataType"), v33 == [v4 dataType])
    && (BOOL v34 = [(HKSelectedRangeData *)self prefersImageAffixes],
        ((v34 ^ [v4 prefersImageAffixes] | v10 | v21 ^ 1 | v27 | v16) & 1) == 0))
  {
    v37 = [(HKSelectedRangeData *)self metadata];
    v38 = [v4 metadata];
    char v35 = [v37 isEqualToDictionary:v38];
  }
  else
  {
    char v35 = 0;
  }

  return v35;
}

- (id)description
{
  int64_t v3 = NSString;
  v15.receiver = self;
  v15.super_class = (Class)HKSelectedRangeData;
  id v4 = [(HKSelectedRangeData *)&v15 description];
  v5 = [(HKSelectedRangeData *)self attributedString];
  BOOL v6 = [(HKSelectedRangeData *)self titleOverride];
  v7 = [(HKSelectedRangeData *)self titleColorOverride];
  uint64_t v8 = [(HKSelectedRangeData *)self valueAsNumber];
  int v9 = _NSStringFromSelectedRangeStatisticsType([(HKSelectedRangeData *)self statisticsType]);
  int v10 = _NSStringFromSelectedRangeDataType([(HKSelectedRangeData *)self dataType]);
  uint64_t v11 = [(HKSelectedRangeData *)self prefixColor];
  [(HKSelectedRangeData *)self prefersImageAffixes];
  v12 = HKStringFromBool();
  uint64_t v13 = [v3 stringWithFormat:@"%@, attributed: %@, titleOverride: %@, titleColorOverride: %@, valueAsNumber: %@, statisticsType: %@, dataType: %@, prefixColor: %@, prefersImageAffixes: %@", v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return v13;
}

- (int64_t)statisticsType
{
  return self->_statisticsType;
}

- (void)setStatisticsType:(int64_t)a3
{
  self->_statisticsType = a3;
}

- (int64_t)dataType
{
  return self->_dataType;
}

- (void)setDataType:(int64_t)a3
{
  self->_dataType = a3;
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (void)setAttributedString:(id)a3
{
}

- (NSString)titleOverride
{
  return self->_titleOverride;
}

- (void)setTitleOverride:(id)a3
{
}

- (UIColor)titleColorOverride
{
  return self->_titleColorOverride;
}

- (void)setTitleColorOverride:(id)a3
{
}

- (NSNumber)valueAsNumber
{
  return self->_valueAsNumber;
}

- (void)setValueAsNumber:(id)a3
{
}

- (UIColor)prefixColor
{
  return self->_prefixColor;
}

- (void)setPrefixColor:(id)a3
{
}

- (BOOL)prefersImageAffixes
{
  return self->_prefersImageAffixes;
}

- (void)setPrefersImageAffixes:(BOOL)a3
{
  self->_prefersImageAffixes = a3;
}

- (NSMutableDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (id)titleTapOutBlock
{
  return self->_titleTapOutBlock;
}

- (void)setTitleTapOutBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_titleTapOutBlock, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_prefixColor, 0);
  objc_storeStrong((id *)&self->_valueAsNumber, 0);
  objc_storeStrong((id *)&self->_titleColorOverride, 0);
  objc_storeStrong((id *)&self->_titleOverride, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
}

@end