@interface IMMessagePartSyndicationRange
+ (BOOL)supportsSecureCoding;
+ (id)_stringFromSyndicationStatus:(int64_t)a3;
+ (id)_stringFromSyndicationType:(int64_t)a3;
+ (id)deserializeSyndicationRangeFromString:(id)a3;
+ (id)findChangesFromRangeArray:(id)a3 comparedToRangeArray:(id)a4;
+ (id)maxStartDateForRanges:(id)a3;
+ (id)messagePartSyndicationRangeForRange:(_NSRange)a3 inRangesArray:(id)a4;
+ (id)messageRangeFromTokens_v1:(id)a3;
+ (id)messageRangeFromTokens_v3:(id)a3;
+ (id)minStartDateForRanges:(id)a3;
+ (id)rangesFromSerializedString:(id)a3;
+ (id)removeAssetInfoForAsset:(int64_t)a3 range:(id)a4;
+ (id)replaceAssetInfoWith:(id)a3 asset:(int64_t)a4 range:(id)a5;
+ (id)serializedStringFromArray:(id)a3;
+ (id)syndicationRangeForAssetDescriptor:(id)a3 range:(id)a4;
+ (id)unarchiveClasses;
+ (id)updateAssetInfoWith:(id)a3 asset:(int64_t)a4 range:(id)a5;
+ (id)updateMessagesRanges:(id)a3 withMessagePartSyndicationRanges:(id)a4 didUpdate:(BOOL *)a5;
+ (unint64_t)serializationVersion;
+ (void)setSerializationVersion:(unint64_t)a3;
- (BOOL)_canBeReplacedByRange:(id)a3;
- (BOOL)isEqual:(id)a3;
- (IMMessagePartSyndicationAssetDescriptor)assetDescriptor;
- (IMMessagePartSyndicationRange)initWithCoder:(id)a3;
- (IMMessagePartSyndicationRange)initWithSyndicationAction:(id)a3;
- (IMMessagePartSyndicationRange)initWithSyndicationType:(int64_t)a3 messagePartRange:(_NSRange)a4 syndicationStartDate:(id)a5;
- (IMMessagePartSyndicationRange)initWithSyndicationType:(int64_t)a3 messagePartRange:(_NSRange)a4 syndicationStartDate:(id)a5 syndicationStatus:(int64_t)a6 assetDescriptor:(id)a7;
- (NSDate)syndicationStartDate;
- (NSString)serializedString;
- (_NSRange)messagePartRange;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)syndicationForPartIndex:(unint64_t)a3 asset:(int64_t)a4;
- (int64_t)syndicationStatus;
- (int64_t)syndicationType;
- (unint64_t)serializedVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setSyndicationStatus:(int64_t)a3;
@end

@implementation IMMessagePartSyndicationRange

+ (id)rangesFromSerializedString:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!v4 || ![v4 length])
  {
    v17 = 0;
    goto LABEL_26;
  }
  v6 = [v5 componentsSeparatedByString:@","];
  v7 = v6;
  if (!v6 || ![v6 count])
  {
    v8 = IMLogHandleForCategory("IMMessagepartSyndicationRange");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1A09F2D18();
    }
    goto LABEL_24;
  }
  v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count") - 1);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = objc_msgSend(a1, "deserializeSyndicationRangeFromString:", *(void *)(*((void *)&v21 + 1) + 8 * i), (void)v21);
        if (!v14)
        {
          v18 = IMLogHandleForCategory("IMMessagePartSyndicationRange");
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            sub_1A09F2DE8();
          }

          goto LABEL_24;
        }
        v15 = (void *)v14;
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  uint64_t v16 = [v8 count];
  if (v16 != [v9 count])
  {
    v19 = IMLogHandleForCategory("IMMessagePartSyndicationRange");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1A09F2D80();
    }

LABEL_24:
    v17 = 0;
    goto LABEL_25;
  }
  v8 = v8;
  v17 = v8;
LABEL_25:

LABEL_26:

  return v17;
}

- (IMMessagePartSyndicationRange)initWithSyndicationType:(int64_t)a3 messagePartRange:(_NSRange)a4 syndicationStartDate:(id)a5
{
  return -[IMMessagePartSyndicationRange initWithSyndicationType:messagePartRange:syndicationStartDate:syndicationStatus:assetDescriptor:](self, "initWithSyndicationType:messagePartRange:syndicationStartDate:syndicationStatus:assetDescriptor:", a3, a4.location, a4.length, a5, ((unint64_t)a3 >> 5) & 1, 0);
}

- (IMMessagePartSyndicationRange)initWithSyndicationType:(int64_t)a3 messagePartRange:(_NSRange)a4 syndicationStartDate:(id)a5 syndicationStatus:(int64_t)a6 assetDescriptor:(id)a7
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v14 = a5;
  id v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)IMMessagePartSyndicationRange;
  uint64_t v16 = [(IMMessagePartSyndicationRange *)&v22 init];
  v17 = v16;
  if (!v16) {
    goto LABEL_12;
  }
  if ((unint64_t)a3 < 0xA)
  {
    if (!(location | length))
    {
      v19 = IMLogHandleForCategory("IMMessagePartSyndicationRange");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1A09F27CC(v19);
      }

      goto LABEL_10;
    }
    v16->_syndicationType = a3;
    v16->_messagePartRange.NSUInteger location = location;
    v16->_messagePartRange.NSUInteger length = length;
    objc_storeStrong((id *)&v16->_syndicationStartDate, a5);
    v17->_syndicationStatus = a6;
    objc_storeStrong((id *)&v17->_assetDescriptor, a7);
LABEL_12:
    v20 = v17;
    goto LABEL_13;
  }
  v18 = IMLogHandleForCategory("IMMessagePartSyndicationRange");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    sub_1A09F2764();
  }

LABEL_10:
  v20 = 0;
LABEL_13:

  return v20;
}

- (IMMessagePartSyndicationRange)initWithSyndicationAction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 messagePartSyndicationType];
  uint64_t v6 = [v4 messagePartRange];
  uint64_t v8 = v7;
  id v9 = [v4 syndicationStartDate];
  uint64_t v10 = [v4 messagePartSyndicationStatus];

  uint64_t v11 = -[IMMessagePartSyndicationRange initWithSyndicationType:messagePartRange:syndicationStartDate:syndicationStatus:assetDescriptor:](self, "initWithSyndicationType:messagePartRange:syndicationStartDate:syndicationStatus:assetDescriptor:", v5, v6, v8, v9, v10, 0);
  return v11;
}

- (IMMessagePartSyndicationRange)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IMMessagePartSyndicationRange;
  uint64_t v5 = [(IMMessagePartSyndicationRange *)&v13 init];
  if (v5)
  {
    v5->_syndicationType = [v4 decodeIntegerForKey:@"syndicationType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"messagePartRange"];
    v5->_messagePartRange.NSUInteger location = [v6 rangeValue];
    v5->_messagePartRange.NSUInteger length = v7;

    v5->_serializedVersion = [v4 decodeIntegerForKey:@"serializedVersion"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"syndicationStartDate"];
    syndicationStartDate = v5->_syndicationStartDate;
    v5->_syndicationStartDate = (NSDate *)v8;

    v5->_syndicationStatus = [v4 decodeIntegerForKey:@"syndicationStatus"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetDescriptor"];
    assetDescriptor = v5->_assetDescriptor;
    v5->_assetDescriptor = (IMMessagePartSyndicationAssetDescriptor *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t syndicationType = self->_syndicationType;
  id v6 = a3;
  [v6 encodeInteger:syndicationType forKey:@"syndicationType"];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", self->_messagePartRange.location, self->_messagePartRange.length);
  [v6 encodeObject:v5 forKey:@"messagePartRange"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[IMMessagePartSyndicationRange serializedVersion](self, "serializedVersion"), @"serializedVersion");
  [v6 encodeObject:self->_syndicationStartDate forKey:@"syndicationStartDate"];
  [v6 encodeInteger:self->_syndicationStatus forKey:@"syndicationStatus"];
  [v6 encodeObject:self->_assetDescriptor forKey:@"assetDescriptor"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  int64_t v5 = [(IMMessagePartSyndicationRange *)self syndicationType];
  uint64_t v6 = [(IMMessagePartSyndicationRange *)self messagePartRange];
  uint64_t v8 = v7;
  id v9 = [(IMMessagePartSyndicationRange *)self syndicationStartDate];
  int64_t v10 = [(IMMessagePartSyndicationRange *)self syndicationStatus];
  uint64_t v11 = [(IMMessagePartSyndicationRange *)self assetDescriptor];
  uint64_t v12 = objc_msgSend(v4, "initWithSyndicationType:messagePartRange:syndicationStartDate:syndicationStatus:assetDescriptor:", v5, v6, v8, v9, v10, v11);

  return v12;
}

- (NSString)serializedString
{
  v26[8] = *MEMORY[0x1E4F143B8];
  serializedString = self->_serializedString;
  if (!serializedString)
  {
    id v4 = [(IMMessagePartSyndicationRange *)self assetDescriptor];
    int64_t v5 = [v4 serializedString];

    if (v5 && [v5 length])
    {
      uint64_t v6 = [v5 cStringUsingEncoding:4];
      v26[0] = @"|";
      long long v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[IMMessagePartSyndicationRange serializedVersion](self, "serializedVersion"));
      v26[1] = v24;
      uint64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[IMMessagePartSyndicationRange syndicationType](self, "syndicationType"));
      v26[2] = v7;
      uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[IMMessagePartSyndicationRange messagePartRange](self, "messagePartRange"));
      v26[3] = v8;
      id v9 = NSNumber;
      [(IMMessagePartSyndicationRange *)self messagePartRange];
      uint64_t v11 = [v9 numberWithUnsignedInteger:v10];
      v26[4] = v11;
      uint64_t v12 = NSNumber;
      objc_super v13 = [(IMMessagePartSyndicationRange *)self syndicationStartDate];
      id v14 = objc_msgSend(v12, "numberWithLongLong:", objc_msgSend(v13, "__im_nanosecondTimeInterval"));
      v26[5] = v14;
      id v15 = objc_msgSend(NSNumber, "numberWithInteger:", -[IMMessagePartSyndicationRange syndicationStatus](self, "syndicationStatus"));
      v26[6] = v15;
      uint64_t v16 = [NSString stringWithUTF8String:v6];
      v26[7] = v16;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:8];
    }
    else
    {
      v25[0] = @"|";
      long long v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[IMMessagePartSyndicationRange serializedVersion](self, "serializedVersion"));
      v25[1] = v24;
      uint64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[IMMessagePartSyndicationRange syndicationType](self, "syndicationType"));
      v25[2] = v7;
      uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[IMMessagePartSyndicationRange messagePartRange](self, "messagePartRange"));
      v25[3] = v8;
      v18 = NSNumber;
      [(IMMessagePartSyndicationRange *)self messagePartRange];
      uint64_t v11 = [v18 numberWithUnsignedInteger:v19];
      v25[4] = v11;
      v20 = NSNumber;
      objc_super v13 = [(IMMessagePartSyndicationRange *)self syndicationStartDate];
      id v14 = objc_msgSend(v20, "numberWithLongLong:", objc_msgSend(v13, "__im_nanosecondTimeInterval"));
      v25[5] = v14;
      id v15 = objc_msgSend(NSNumber, "numberWithInteger:", -[IMMessagePartSyndicationRange syndicationStatus](self, "syndicationStatus"));
      v25[6] = v15;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:7];
    }

    long long v21 = [v17 componentsJoinedByString:@"|"];
    objc_super v22 = self->_serializedString;
    self->_serializedString = v21;

    serializedString = self->_serializedString;
  }

  return serializedString;
}

- (unint64_t)serializedVersion
{
  unint64_t result = self->_serializedVersion;
  if (!result)
  {
    unint64_t result = +[IMMessagePartSyndicationRange serializationVersion];
    self->_serializedVersion = result;
  }
  return result;
}

+ (id)_stringFromSyndicationType:(int64_t)a3
{
  if ((unint64_t)a3 > 0xC) {
    return 0;
  }
  else {
    return off_1E5A14E50[a3];
  }
}

+ (id)_stringFromSyndicationStatus:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return 0;
  }
  else {
    return off_1E5A14EB8[a3];
  }
}

- (id)description
{
  v3 = NSString;
  v14.receiver = self;
  v14.super_class = (Class)IMMessagePartSyndicationRange;
  id v4 = [(IMMessagePartSyndicationRange *)&v14 description];
  int64_t v5 = objc_msgSend((id)objc_opt_class(), "_stringFromSyndicationType:", -[IMMessagePartSyndicationRange syndicationType](self, "syndicationType"));
  uint64_t v6 = objc_msgSend((id)objc_opt_class(), "_stringFromSyndicationStatus:", -[IMMessagePartSyndicationRange syndicationStatus](self, "syndicationStatus"));
  uint64_t v7 = NSStringFromRange(self->_messagePartRange);
  uint64_t v8 = [(IMMessagePartSyndicationRange *)self syndicationStartDate];
  unint64_t v9 = [(IMMessagePartSyndicationRange *)self serializedVersion];
  uint64_t v10 = [(IMMessagePartSyndicationRange *)self serializedString];
  uint64_t v11 = [(IMMessagePartSyndicationRange *)self assetDescriptor];
  uint64_t v12 = [v3 stringWithFormat:@"%@, syndicationType: %@, syndicationStatus: %@, messagePartRange: %@, syndicationStartDate: %@, version: %ld, serializedString: %@, assetSyndications: %@", v4, v5, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (uint64_t v5 = objc_opt_class(), v5 == objc_opt_class()))
  {
    uint64_t v7 = [v4 serializedVersion];
    if (v7 == [(IMMessagePartSyndicationRange *)self serializedVersion]
      && (uint64_t v8 = [v4 syndicationType],
          v8 == [(IMMessagePartSyndicationRange *)self syndicationType])
      && (uint64_t v9 = [v4 syndicationStatus],
          v9 == [(IMMessagePartSyndicationRange *)self syndicationStatus]))
    {
      uint64_t v10 = [v4 syndicationStartDate];
      uint64_t v11 = objc_msgSend(v10, "__im_nanosecondTimeInterval");
      uint64_t v12 = [(IMMessagePartSyndicationRange *)self syndicationStartDate];
      if (v11 == objc_msgSend(v12, "__im_nanosecondTimeInterval"))
      {
        uint64_t v13 = [v4 messagePartRange];
        uint64_t v15 = v14;
        BOOL v18 = v13 == [(IMMessagePartSyndicationRange *)self messagePartRange] && v15 == v16;
      }
      else
      {
        BOOL v18 = 0;
      }
    }
    else
    {
      BOOL v18 = 0;
    }
    uint64_t v19 = [v4 assetDescriptor];
    uint64_t v20 = [(IMMessagePartSyndicationRange *)self assetDescriptor];
    uint64_t v21 = v20 | v19;

    if (v21) {
      char v6 = 0;
    }
    else {
      char v6 = v18;
    }
    if (v21 && v18)
    {
      objc_super v22 = [(IMMessagePartSyndicationRange *)self assetDescriptor];
      char v6 = [v22 isEqual:v19];
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

+ (id)serializedStringFromArray:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F28E78] string];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) serializedString];
          if ([v4 length]) {
            [v4 appendFormat:@",%@", v10];
          }
          else {
            [v4 appendString:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)messageRangeFromTokens_v1:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count] != 5 && objc_msgSend(v4, "count") != 6)
  {
    long long v15 = IMLogHandleForCategory("IMMessagePartSyndicationRange");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1A09F29F4(v4);
    }
    goto LABEL_29;
  }
  id v5 = [v4 objectAtIndexedSubscript:1];
  unint64_t v6 = [v5 integerValue];

  uint64_t v7 = [v4 objectAtIndexedSubscript:2];
  uint64_t v8 = [v7 integerValue];

  uint64_t v9 = [v4 objectAtIndexedSubscript:3];
  uint64_t v10 = [v9 integerValue];

  uint64_t v11 = [v4 objectAtIndexedSubscript:4];
  unint64_t v12 = [v11 longLongValue];

  if ([v4 count] == 6)
  {
    long long v13 = [v4 objectAtIndexedSubscript:5];
    unint64_t v14 = [v13 integerValue];
  }
  else
  {
    unint64_t v14 = 0;
  }
  if (v6 >= 9)
  {
    long long v15 = IMLogHandleForCategory("IMMessagePartSyndicationRange");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = [a1 _stringFromSyndicationType:v6];
      uint64_t v17 = [v4 componentsJoinedByString:@","];
      int v23 = 138412546;
      uint64_t v24 = (uint64_t)v16;
      __int16 v25 = 2112;
      uint64_t v26 = (uint64_t)v17;
      _os_log_error_impl(&dword_1A0772000, v15, OS_LOG_TYPE_ERROR, "Syndication type is out of range: %@ in tokens: %@", (uint8_t *)&v23, 0x16u);

LABEL_28:
      goto LABEL_29;
    }
    goto LABEL_29;
  }
  if (v8 < 0 || v10 < 0)
  {
    long long v15 = IMLogHandleForCategory("IMMessagePartSyndicationRange");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = [v4 componentsJoinedByString:@","];
      int v23 = 134218498;
      uint64_t v24 = v8;
      __int16 v25 = 2048;
      uint64_t v26 = v10;
      __int16 v27 = 2112;
      v28 = v16;
      _os_log_error_impl(&dword_1A0772000, v15, OS_LOG_TYPE_ERROR, "Message part range is out of range. Location: %ld, Length: %ld, in tokens: %@", (uint8_t *)&v23, 0x20u);
      goto LABEL_28;
    }
LABEL_29:
    uint64_t v19 = 0;
    goto LABEL_30;
  }
  if (!v10)
  {
    long long v15 = IMLogHandleForCategory("IMMessagePartSyndicationRange");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1A09F2810(v4);
    }
    goto LABEL_29;
  }
  if (!v12)
  {
    long long v15 = IMLogHandleForCategory("IMMessagePartSyndicationRange");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1A09F289C(v4);
    }
    goto LABEL_29;
  }
  long long v15 = objc_msgSend(MEMORY[0x1E4F1C9C8], "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:", (double)v12);
  if (!v15)
  {
    uint64_t v16 = IMLogHandleForCategory("IMMessagePartSyndicationRange");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1A09F2954(v4);
    }
    goto LABEL_28;
  }
  if (v14 >= 3)
  {
    BOOL v18 = IMLogHandleForCategory("IMMessagePartSyndicationRange");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = [a1 _stringFromSyndicationStatus:v14];
      objc_super v22 = [v4 componentsJoinedByString:@","];
      int v23 = 138412546;
      uint64_t v24 = (uint64_t)v21;
      __int16 v25 = 2112;
      uint64_t v26 = (uint64_t)v22;
      _os_log_error_impl(&dword_1A0772000, v18, OS_LOG_TYPE_ERROR, "Syndication status is out of range: %@ in tokens: %@", (uint8_t *)&v23, 0x16u);
    }
    goto LABEL_29;
  }
  uint64_t v19 = -[IMMessagePartSyndicationRange initWithSyndicationType:messagePartRange:syndicationStartDate:syndicationStatus:assetDescriptor:]([IMMessagePartSyndicationRange alloc], "initWithSyndicationType:messagePartRange:syndicationStartDate:syndicationStatus:assetDescriptor:", v6, v8, v10, v15, v14, 0);
LABEL_30:

  return v19;
}

+ (id)messageRangeFromTokens_v3:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count] == 6 || objc_msgSend(v4, "count") == 7)
  {
    id v5 = [v4 objectAtIndexedSubscript:1];
    unint64_t v6 = [v5 integerValue];

    uint64_t v7 = [v4 objectAtIndexedSubscript:2];
    uint64_t v8 = [v7 integerValue];

    uint64_t v9 = [v4 objectAtIndexedSubscript:3];
    uint64_t v10 = [v9 integerValue];

    uint64_t v11 = [v4 objectAtIndexedSubscript:4];
    unint64_t v12 = [v11 longLongValue];

    if ([v4 count] == 6 || objc_msgSend(v4, "count") == 7)
    {
      long long v13 = [v4 objectAtIndexedSubscript:5];
      unint64_t v14 = [v13 integerValue];
    }
    else
    {
      unint64_t v14 = 0;
    }
    if ([v4 count] == 7)
    {
      uint64_t v17 = [v4 objectAtIndexedSubscript:6];
      long long v15 = +[IMMessagePartSyndicationAssetDescriptor descriptorFromSerializedString:v17];
    }
    else
    {
      long long v15 = 0;
    }
    if (v6 < 9)
    {
      if (v8 < 0 || v10 < 0)
      {
        BOOL v18 = IMLogHandleForCategory("IMMessagePartSyndicationRange");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          uint64_t v19 = [v4 componentsJoinedByString:@","];
          int v25 = 134218498;
          uint64_t v26 = v8;
          __int16 v27 = 2048;
          uint64_t v28 = v10;
          __int16 v29 = 2112;
          v30 = v19;
          _os_log_error_impl(&dword_1A0772000, v18, OS_LOG_TYPE_ERROR, "Message part range is out of range. Location: %ld, Length: %ld, in tokens: %@", (uint8_t *)&v25, 0x20u);
          goto LABEL_33;
        }
      }
      else
      {
        if (!v10)
        {
          BOOL v18 = IMLogHandleForCategory("IMMessagePartSyndicationRange");
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            sub_1A09F2810(v4);
          }
          goto LABEL_34;
        }
        if (!v12)
        {
          BOOL v18 = IMLogHandleForCategory("IMMessagePartSyndicationRange");
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            sub_1A09F289C(v4);
          }
          goto LABEL_34;
        }
        BOOL v18 = objc_msgSend(MEMORY[0x1E4F1C9C8], "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:", (double)v12);
        if (!v18)
        {
          uint64_t v19 = IMLogHandleForCategory("IMMessagePartSyndicationRange");
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            sub_1A09F2954(v4);
          }
          goto LABEL_33;
        }
        if (v14 < 3)
        {
          uint64_t v16 = -[IMMessagePartSyndicationRange initWithSyndicationType:messagePartRange:syndicationStartDate:syndicationStatus:assetDescriptor:]([IMMessagePartSyndicationRange alloc], "initWithSyndicationType:messagePartRange:syndicationStartDate:syndicationStatus:assetDescriptor:", v6, v8, v10, v18, v14, v15);
          goto LABEL_35;
        }
        uint64_t v21 = IMLogHandleForCategory("IMMessagePartSyndicationRange");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          int v23 = [a1 _stringFromSyndicationStatus:v14];
          uint64_t v24 = [v4 componentsJoinedByString:@","];
          int v25 = 138412546;
          uint64_t v26 = (uint64_t)v23;
          __int16 v27 = 2112;
          uint64_t v28 = (uint64_t)v24;
          _os_log_error_impl(&dword_1A0772000, v21, OS_LOG_TYPE_ERROR, "Syndication status is out of range: %@ in tokens: %@", (uint8_t *)&v25, 0x16u);
        }
      }
    }
    else
    {
      BOOL v18 = IMLogHandleForCategory("IMMessagePartSyndicationRange");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = [a1 _stringFromSyndicationType:v6];
        uint64_t v20 = [v4 componentsJoinedByString:@","];
        int v25 = 138412546;
        uint64_t v26 = (uint64_t)v19;
        __int16 v27 = 2112;
        uint64_t v28 = (uint64_t)v20;
        _os_log_error_impl(&dword_1A0772000, v18, OS_LOG_TYPE_ERROR, "Syndication type is out of range: %@ in tokens: %@", (uint8_t *)&v25, 0x16u);

LABEL_33:
      }
    }
LABEL_34:
    uint64_t v16 = 0;
LABEL_35:

    goto LABEL_36;
  }
  long long v15 = IMLogHandleForCategory("IMMessagePartSyndicationRange");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_1A09F2A8C(v4);
  }
  uint64_t v16 = 0;
LABEL_36:

  return v16;
}

+ (id)deserializeSyndicationRangeFromString:(id)a3
{
  id v4 = a3;
  id v5 = [v4 substringToIndex:1];
  unint64_t v6 = [v4 substringFromIndex:2];
  uint64_t v7 = [v6 componentsSeparatedByString:v5];

  if (!v7 || ![v7 count])
  {
    uint64_t v8 = IMLogHandleForCategory("IMMessagePartSyndicationRange");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1A09F2B24();
    }
    goto LABEL_8;
  }
  if ([v7 count] == 1)
  {
    uint64_t v8 = IMLogHandleForCategory("IMMessagePartSyndicationRange");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1A09F2B8C();
    }
LABEL_8:

    uint64_t v9 = 0;
    goto LABEL_9;
  }
  uint64_t v11 = [v7 objectAtIndexedSubscript:0];
  uint64_t v12 = [v11 integerValue];

  if ((unint64_t)(v12 - 1) >= 2)
  {
    if (v12 != 3)
    {
      unint64_t v14 = IMLogHandleForCategory("IMMessagePartSyndicationRange");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1A09F2C98((uint64_t)v4, v12);
      }

      goto LABEL_21;
    }
    uint64_t v13 = objc_msgSend(a1, "messageRangeFromTokens_v3:", v7);
  }
  else
  {
    uint64_t v13 = objc_msgSend(a1, "messageRangeFromTokens_v1:", v7);
  }
  uint64_t v9 = (void *)v13;
  if (!v13)
  {
LABEL_21:
    uint64_t v8 = IMLogHandleForCategory("IMMessagePartSyndicationRange");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1A09F2BF4((uint64_t)v4, v7);
    }
    goto LABEL_8;
  }
LABEL_9:

  return v9;
}

+ (unint64_t)serializationVersion
{
  return qword_1E94F8488;
}

+ (void)setSerializationVersion:(unint64_t)a3
{
  qword_1E94F8488 = a3;
}

- (BOOL)_canBeReplacedByRange:(id)a3
{
  id v4 = a3;
  if ([(IMMessagePartSyndicationRange *)self isEqual:v4])
  {
    BOOL v5 = 0;
  }
  else
  {
    unint64_t v6 = [(IMMessagePartSyndicationRange *)self syndicationStartDate];
    uint64_t v7 = [v4 syndicationStartDate];
    uint64_t v8 = [v6 compare:v7];

    BOOL v5 = v8 != 1;
  }

  return v5;
}

+ (id)unarchiveClasses
{
  if (qword_1E94FFC70 != -1) {
    dispatch_once(&qword_1E94FFC70, &unk_1EF2BFC00);
  }
  v2 = (void *)qword_1E94FFC68;

  return v2;
}

+ (id)updateMessagesRanges:(id)a3 withMessagePartSyndicationRanges:(id)a4 didUpdate:(BOOL *)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (a5) {
    *a5 = 0;
  }
  if (v8 && [v8 count])
  {
    if (!v7) {
      id v7 = (id)MEMORY[0x1E4F1CBF0];
    }
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x2020000000;
    char v38 = 0;
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x3032000000;
    v32 = sub_1A077795C;
    v33 = sub_1A07777A4;
    id v34 = 0;
    id v34 = (id)[v7 mutableCopy];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = v9;
    uint64_t v10 = [obj countByEnumeratingWithState:&v25 objects:v39 count:16];
    BOOL v18 = v9;
    if (v10)
    {
      uint64_t v11 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v14 = [v13 messagePartRange];
          uint64_t v21 = 0;
          objc_super v22 = &v21;
          uint64_t v23 = 0x2020000000;
          char v24 = 1;
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = sub_1A086C8E0;
          v20[3] = &unk_1E5A14E30;
          v20[8] = v14;
          v20[9] = v15;
          v20[4] = v13;
          v20[5] = &v29;
          v20[6] = &v35;
          v20[7] = &v21;
          [v7 enumerateObjectsUsingBlock:v20];
          if (*((unsigned char *)v22 + 24))
          {
            [(id)v30[5] addObject:v13];
            *((unsigned char *)v36 + 24) = 1;
          }
          _Block_object_dispose(&v21, 8);
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v25 objects:v39 count:16];
      }
      while (v10);
    }

    if (a5) {
      *a5 = *((unsigned char *)v36 + 24);
    }
    id v16 = (id)v30[5];
    _Block_object_dispose(&v29, 8);

    _Block_object_dispose(&v35, 8);
    uint64_t v9 = v18;
  }
  else
  {
    id v7 = v7;
    id v16 = v7;
  }

  return v16;
}

+ (id)messagePartSyndicationRangeForRange:(_NSRange)a3 inRangesArray:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v13, "messagePartRange", (void)v18) == location && v14 == length)
          {
            id v16 = v13;
            goto LABEL_15;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    id v16 = 0;
LABEL_15:
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

+ (id)findChangesFromRangeArray:(id)a3 comparedToRangeArray:(id)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5 && [v5 count])
  {
    if (!v6) {
      id v6 = (id)MEMORY[0x1E4F1CBF0];
    }
    if (v6 == v5)
    {
      id v7 = 0;
      id v6 = v5;
    }
    else if ([v5 isEqualToArray:v6])
    {
      id v7 = 0;
    }
    else
    {
      v49 = [MEMORY[0x1E4F1CA48] array];
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      id v45 = v5;
      id obj = v5;
      id v47 = (id)[obj countByEnumeratingWithState:&v63 objects:v70 count:16];
      if (v47)
      {
        uint64_t v46 = *(void *)v64;
        do
        {
          for (uint64_t i = 0; i != v47; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v64 != v46) {
              objc_enumerationMutation(obj);
            }
            uint64_t v11 = *(void **)(*((void *)&v63 + 1) + 8 * i);
            long long v59 = 0u;
            long long v60 = 0u;
            long long v61 = 0u;
            long long v62 = 0u;
            id v12 = v6;
            uint64_t v13 = (IMMessagePartSyndicationRange *)v6;
            uint64_t v14 = [(IMMessagePartSyndicationRange *)v13 countByEnumeratingWithState:&v59 objects:v69 count:16];
            if (v14)
            {
              uint64_t v15 = v14;
              uint64_t v16 = *(void *)v60;
LABEL_25:
              uint64_t v17 = 0;
              while (1)
              {
                if (*(void *)v60 != v16) {
                  objc_enumerationMutation(v13);
                }
                long long v18 = *(IMMessagePartSyndicationRange **)(*((void *)&v59 + 1) + 8 * v17);
                uint64_t v19 = [(IMMessagePartSyndicationRange *)v18 messagePartRange];
                uint64_t v21 = v20;
                if (v19 == [v11 messagePartRange] && v21 == v22) {
                  break;
                }
                if (v15 == ++v17)
                {
                  uint64_t v15 = [(IMMessagePartSyndicationRange *)v13 countByEnumeratingWithState:&v59 objects:v69 count:16];
                  if (v15) {
                    goto LABEL_25;
                  }
                  goto LABEL_34;
                }
              }
              if ([(IMMessagePartSyndicationRange *)v18 isEqual:v11]) {
                goto LABEL_37;
              }
            }
            else
            {
LABEL_34:

              char v24 = [IMMessagePartSyndicationRange alloc];
              uint64_t v25 = [v11 messagePartRange];
              uint64_t v27 = v26;
              long long v28 = [v11 syndicationStartDate];
              long long v18 = -[IMMessagePartSyndicationRange initWithSyndicationType:messagePartRange:syndicationStartDate:](v24, "initWithSyndicationType:messagePartRange:syndicationStartDate:", 0, v25, v27, v28);

              uint64_t v13 = v18;
            }
            [v49 addObject:v18];
LABEL_37:

            id v6 = v12;
          }
          id v47 = (id)[obj countByEnumeratingWithState:&v63 objects:v70 count:16];
        }
        while (v47);
      }

      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v6 = v6;
      uint64_t v29 = [v6 countByEnumeratingWithState:&v55 objects:v68 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v56;
        id v48 = v6;
        do
        {
          for (uint64_t j = 0; j != v30; ++j)
          {
            if (*(void *)v56 != v31) {
              objc_enumerationMutation(v48);
            }
            v33 = *(void **)(*((void *)&v55 + 1) + 8 * j);
            long long v51 = 0u;
            long long v52 = 0u;
            long long v53 = 0u;
            long long v54 = 0u;
            id v34 = obj;
            uint64_t v35 = [v34 countByEnumeratingWithState:&v51 objects:v67 count:16];
            if (v35)
            {
              uint64_t v36 = v35;
              uint64_t v37 = *(void *)v52;
              while (2)
              {
                for (uint64_t k = 0; k != v36; ++k)
                {
                  if (*(void *)v52 != v37) {
                    objc_enumerationMutation(v34);
                  }
                  uint64_t v39 = [*(id *)(*((void *)&v51 + 1) + 8 * k) messagePartRange];
                  uint64_t v41 = v40;
                  if (v39 == [v33 messagePartRange] && v41 == v42)
                  {

                    goto LABEL_57;
                  }
                }
                uint64_t v36 = [v34 countByEnumeratingWithState:&v51 objects:v67 count:16];
                if (v36) {
                  continue;
                }
                break;
              }
            }

            [v49 addObject:v33];
LABEL_57:
            ;
          }
          id v6 = v48;
          uint64_t v30 = [v48 countByEnumeratingWithState:&v55 objects:v68 count:16];
        }
        while (v30);
      }

      if ([v49 count]) {
        v44 = v49;
      }
      else {
        v44 = 0;
      }
      id v7 = v44;

      id v5 = v45;
    }
  }
  else
  {
    if (v6)
    {
      if ([v6 count]) {
        id v8 = v6;
      }
      else {
        id v8 = 0;
      }
    }
    else
    {
      id v8 = 0;
    }
    id v7 = v8;
  }

  return v7;
}

- (id)syndicationForPartIndex:(unint64_t)a3 asset:(int64_t)a4
{
  id v7 = [(IMMessagePartSyndicationRange *)self assetDescriptor];

  if (v7)
  {
    id v8 = [(IMMessagePartSyndicationRange *)self assetDescriptor];
    uint64_t v9 = [v8 syndicationForPartIndex:a3 asset:a4];
  }
  else
  {
    uint64_t v10 = IMLogHandleForCategory("IMMessagePartSyndicationRange");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1A09F2E50(v10, v11, v12, v13, v14, v15, v16, v17);
    }

    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)syndicationRangeForAssetDescriptor:(id)a3 range:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [IMMessagePartSyndicationRange alloc];
  uint64_t v8 = [v5 syndicationType];
  uint64_t v9 = [v5 messagePartRange];
  uint64_t v11 = v10;
  uint64_t v12 = [v5 syndicationStartDate];
  uint64_t v13 = [v5 syndicationStatus];

  uint64_t v14 = -[IMMessagePartSyndicationRange initWithSyndicationType:messagePartRange:syndicationStartDate:syndicationStatus:assetDescriptor:](v7, "initWithSyndicationType:messagePartRange:syndicationStartDate:syndicationStatus:assetDescriptor:", v8, v9, v11, v12, v13, v6);

  return v14;
}

+ (id)updateAssetInfoWith:(id)a3 asset:(int64_t)a4 range:(id)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a3;
  uint64_t v9 = [v7 assetDescriptor];
  uint64_t v10 = (void *)[v9 copy];

  if (v10)
  {
    [v10 updateSyndicationAssetWithInfo:v8 asset:a4];
    uint64_t v11 = +[IMMessagePartSyndicationRange syndicationRangeForAssetDescriptor:v10 range:v7];
  }
  else
  {
    uint64_t v12 = [IMMessagePartSyndicationAssetDescriptor alloc];
    uint64_t v13 = [NSNumber numberWithInteger:a4];
    uint64_t v17 = v13;
    v18[0] = v8;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    uint64_t v15 = [(IMMessagePartSyndicationAssetDescriptor *)v12 initWithAssetSyndications:v14];

    uint64_t v11 = +[IMMessagePartSyndicationRange syndicationRangeForAssetDescriptor:v15 range:v7];
  }

  return v11;
}

+ (id)replaceAssetInfoWith:(id)a3 asset:(int64_t)a4 range:(id)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a3;
  uint64_t v9 = [v7 assetDescriptor];
  uint64_t v10 = (void *)[v9 copy];

  if (v10)
  {
    [v10 replaceSyndicationAssetsInfoWith:v8 asset:a4];
    uint64_t v11 = +[IMMessagePartSyndicationRange syndicationRangeForAssetDescriptor:v10 range:v7];
  }
  else
  {
    uint64_t v12 = [IMMessagePartSyndicationAssetDescriptor alloc];
    uint64_t v13 = [NSNumber numberWithInteger:a4];
    uint64_t v17 = v13;
    v18[0] = v8;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    uint64_t v15 = [(IMMessagePartSyndicationAssetDescriptor *)v12 initWithAssetSyndications:v14];

    uint64_t v11 = +[IMMessagePartSyndicationRange syndicationRangeForAssetDescriptor:v15 range:v7];
  }

  return v11;
}

+ (id)removeAssetInfoForAsset:(int64_t)a3 range:(id)a4
{
  id v5 = a4;
  id v6 = [v5 assetDescriptor];
  id v7 = (void *)[v6 copy];

  if (v7)
  {
    [v7 removeSyndicationAssetsInfoFor:a3];
    id v8 = +[IMMessagePartSyndicationRange syndicationRangeForAssetDescriptor:v7 range:v5];
  }
  else
  {
    id v8 = v5;
  }
  uint64_t v9 = v8;

  return v9;
}

+ (id)minStartDateForRanges:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (v6)
        {
          uint64_t v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) syndicationStartDate];
          uint64_t v11 = [v10 compare:v6];

          if (v11 != -1) {
            continue;
          }
        }
        uint64_t v12 = [v9 syndicationStartDate];

        id v6 = (void *)v12;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)maxStartDateForRanges:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (v6)
        {
          uint64_t v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) syndicationStartDate];
          uint64_t v11 = [v10 compare:v6];

          if (v11 != 1) {
            continue;
          }
        }
        uint64_t v12 = [v9 syndicationStartDate];

        id v6 = (void *)v12;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (int64_t)syndicationType
{
  return self->_syndicationType;
}

- (int64_t)syndicationStatus
{
  return self->_syndicationStatus;
}

- (void)setSyndicationStatus:(int64_t)a3
{
  self->_syndicationStatus = a3;
}

- (_NSRange)messagePartRange
{
  NSUInteger length = self->_messagePartRange.length;
  NSUInteger location = self->_messagePartRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (NSDate)syndicationStartDate
{
  return self->_syndicationStartDate;
}

- (IMMessagePartSyndicationAssetDescriptor)assetDescriptor
{
  return self->_assetDescriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetDescriptor, 0);
  objc_storeStrong((id *)&self->_syndicationStartDate, 0);

  objc_storeStrong((id *)&self->_serializedString, 0);
}

@end