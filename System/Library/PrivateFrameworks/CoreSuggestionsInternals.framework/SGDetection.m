@interface SGDetection
+ (id)detectionWithType:(unsigned int)a3 text:(id)a4 matchRange:(_NSRange)a5 matchString:(id)a6 label:(id)a7 hasPhoneLabel:(BOOL)a8 extractionInfo:(id)a9 isUnlikelyPhone:(BOOL)a10;
- (BOOL)hasPhoneLabel;
- (BOOL)isUnlikelyPhone;
- (NSString)context;
- (NSString)extraction;
- (NSString)label;
- (SGDetection)initWithType:(unsigned int)a3 extraction:(id)a4 context:(id)a5 contextRangeOfInterest:(_NSRange)a6 label:(id)a7 hasPhoneLabel:(BOOL)a8 match:(_NSRange)a9 extractionInfo:(id)a10 isUnlikelyPhone:(BOOL)a11;
- (SGExtractionInfo)extractionInfo;
- (_NSRange)contextRangeOfInterest;
- (_NSRange)match;
- (id)description;
- (unsigned)type;
@end

@implementation SGDetection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractionInfo, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_extraction, 0);
}

- (BOOL)isUnlikelyPhone
{
  return self->_isUnlikelyPhone;
}

- (SGExtractionInfo)extractionInfo
{
  return self->_extractionInfo;
}

- (_NSRange)match
{
  NSUInteger length = self->_match.length;
  NSUInteger location = self->_match.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (BOOL)hasPhoneLabel
{
  return self->_hasPhoneLabel;
}

- (NSString)label
{
  return self->_label;
}

- (_NSRange)contextRangeOfInterest
{
  NSUInteger length = self->_contextRangeOfInterest.length;
  NSUInteger location = self->_contextRangeOfInterest.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (NSString)context
{
  return self->_context;
}

- (NSString)extraction
{
  return self->_extraction;
}

- (unsigned)type
{
  return self->_type;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<SGDetection/%@ '%@'>", self->_label, self->_extraction];
  return v2;
}

- (SGDetection)initWithType:(unsigned int)a3 extraction:(id)a4 context:(id)a5 contextRangeOfInterest:(_NSRange)a6 label:(id)a7 hasPhoneLabel:(BOOL)a8 match:(_NSRange)a9 extractionInfo:(id)a10 isUnlikelyPhone:(BOOL)a11
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v17 = a4;
  id v18 = a5;
  id v19 = a7;
  id v24 = a10;
  v25.receiver = self;
  v25.super_class = (Class)SGDetection;
  v20 = [(SGDetection *)&v25 init];
  v21 = v20;
  if (v20)
  {
    v20->_type = a3;
    objc_storeStrong((id *)&v20->_extraction, a4);
    objc_storeStrong((id *)&v21->_context, a5);
    v21->_contextRangeOfInterest.NSUInteger location = location;
    v21->_contextRangeOfInterest.NSUInteger length = length;
    objc_storeStrong((id *)&v21->_label, a7);
    v21->_hasPhoneLabel = a8;
    v21->_match = a9;
    objc_storeStrong((id *)&v21->_extractionInfo, a10);
    v21->_isUnlikelyPhone = a11;
  }

  return v21;
}

+ (id)detectionWithType:(unsigned int)a3 text:(id)a4 matchRange:(_NSRange)a5 matchString:(id)a6 label:(id)a7 hasPhoneLabel:(BOOL)a8 extractionInfo:(id)a9 isUnlikelyPhone:(BOOL)a10
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v14 = *(void *)&a3;
  id v16 = a4;
  id v17 = a6;
  id v30 = a7;
  id v18 = a9;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  uint64_t v39 = 0;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0;
  uint64_t v35 = [v16 length];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __112__SGDetection_detectionWithType_text_matchRange_matchString_label_hasPhoneLabel_extractionInfo_isUnlikelyPhone___block_invoke;
  v31[3] = &unk_1E65B9100;
  v31[4] = &v36;
  v31[5] = location;
  objc_msgSend(v16, "enumerateSubstringsInRange:options:usingBlock:", 0, location, 260, v31);
  [v16 length];
  uint64_t v19 = objc_msgSend(v16, "enumerateSubstringsInRange:options:usingBlock:");
  uint64_t v20 = v14;
  if (v17)
  {
    id v21 = v17;
  }
  else
  {
    v22 = (void *)MEMORY[0x1CB79B230](v19);
    objc_msgSend(v16, "substringWithRange:", location, length);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v23 = objc_alloc((Class)a1);
  id v24 = (void *)MEMORY[0x1CB79B230]();
  objc_super v25 = objc_msgSend(v16, "substringWithRange:", v37[3], v33[3] - v37[3]);
  LOBYTE(v29) = a10;
  LOBYTE(v28) = a8;
  v26 = objc_msgSend(v23, "initWithType:extraction:context:contextRangeOfInterest:label:hasPhoneLabel:match:extractionInfo:isUnlikelyPhone:", v20, v21, v25, location - v37[3], length, v30, v28, location, length, v18, v29);

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v26;
}

uint64_t __112__SGDetection_detectionWithType_text_matchRange_matchString_label_hasPhoneLabel_extractionInfo_isUnlikelyPhone___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  if ((unint64_t)(*(void *)(result + 40) - a3) >= 0x50)
  {
    *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a3;
    *a7 = 1;
  }
  return result;
}

uint64_t __112__SGDetection_detectionWithType_text_matchRange_matchString_label_hasPhoneLabel_extractionInfo_isUnlikelyPhone___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  if ((unint64_t)(a3 - *(void *)(result + 40)) >= 0x50)
  {
    *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a3;
    *a7 = 1;
  }
  return result;
}

@end