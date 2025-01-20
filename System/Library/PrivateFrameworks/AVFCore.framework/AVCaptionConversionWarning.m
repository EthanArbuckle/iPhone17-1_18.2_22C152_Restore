@interface AVCaptionConversionWarning
+ (AVCaptionConversionWarning)captionConversionWarningWithFigDictionary:(__CFDictionary *)a3;
- (AVCaptionConversionAdjustment)adjustment;
- (AVCaptionConversionWarning)initWithFigDictionary:(__CFDictionary *)a3;
- (AVCaptionConversionWarningType)warningType;
- (NSRange)rangeOfCaptions;
- (id)description;
- (void)dealloc;
@end

@implementation AVCaptionConversionWarning

+ (AVCaptionConversionWarning)captionConversionWarningWithFigDictionary:(__CFDictionary *)a3
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFigDictionary:a3];
  return (AVCaptionConversionWarning *)v3;
}

- (AVCaptionConversionWarning)initWithFigDictionary:(__CFDictionary *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVCaptionConversionWarning;
  v4 = [(AVCaptionConversionWarning *)&v6 init];
  if (v4) {
    v4->_warningInternal = (void *)[(__CFDictionary *)a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCaptionConversionWarning;
  [(AVCaptionConversionWarning *)&v3 dealloc];
}

- (AVCaptionConversionWarningType)warningType
{
  if (objc_msgSend((id)objc_msgSend(self->_warningInternal, "objectForKeyedSubscript:", *MEMORY[0x1E4F32838]), "longValue") == 1)return (AVCaptionConversionWarningType)@"AVCaptionConversionWarningTypeExcessMediaData"; {
  else
  }
    return 0;
}

- (NSRange)rangeOfCaptions
{
  v2 = (void *)[self->_warningInternal objectForKeyedSubscript:*MEMORY[0x1E4F32830]];
  uint64_t v3 = objc_msgSend((id)objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E4F32808]), "integerValue");
  NSUInteger v4 = objc_msgSend((id)objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E4F32800]), "integerValue");
  NSUInteger v5 = v3;
  result.length = v4;
  result.location = v5;
  return result;
}

- (AVCaptionConversionAdjustment)adjustment
{
  uint64_t v2 = [self->_warningInternal objectForKeyedSubscript:*MEMORY[0x1E4F32828]];
  return +[AVCaptionConversionAdjustment captionConversionAdjustmentWithFigDictionary:v2];
}

- (id)description
{
  if (description_createWarningTypeMappingOnce != -1) {
    dispatch_once(&description_createWarningTypeMappingOnce, &__block_literal_global_0);
  }
  uint64_t v3 = objc_msgSend((id)description_warningMapping, "objectForKeyedSubscript:", -[AVCaptionConversionWarning warningType](self, "warningType"));
  uint64_t v4 = [(AVCaptionConversionWarning *)self rangeOfCaptions];
  unint64_t v6 = v5;
  v7 = [(AVCaptionConversionWarning *)self adjustment];
  if (v6 < 2) {
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @" = %lu", v4, v14);
  }
  else {
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"es = (%lu-%lu)", v4, v6 + v4 - 1);
  }
  uint64_t v9 = v8;
  if (v7) {
    v10 = (__CFString *)[NSString stringWithFormat:@"adjustment = %@", v7];
  }
  else {
    v10 = @"no remedial adjusment available; caption must be omitted during conversion";
  }
  v11 = NSString;
  v12 = (objc_class *)objc_opt_class();
  return (id)[v11 stringWithFormat:@"<%@: %p, warning = \"%@\", caption index%@, %@", NSStringFromClass(v12), self, v3, v9, v10];
}

id __41__AVCaptionConversionWarning_description__block_invoke()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v1 = @"AVCaptionConversionWarningTypeExcessMediaData";
  v2[0] = @"excess media data";
  id result = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v2 forKeys:&v1 count:1];
  description_warningMapping = (uint64_t)result;
  return result;
}

@end