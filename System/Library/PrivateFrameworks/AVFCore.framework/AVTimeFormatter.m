@interface AVTimeFormatter
- (AVTimeFormatter)init;
- (AVTimeFormatter)initWithCoder:(id)a3;
- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5;
- (BOOL)isFullWidth;
- (BOOL)isRightToLeft;
- (double)formatTemplate;
- (id)cachedDateFormatterFormat;
- (id)cachedDateFormatterTemplate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)locale;
- (id)numberFormatterWithOneMinimumIntegerDigits;
- (id)numberFormatterWithTwoMinimumIntegerDigits;
- (id)stringForObjectValue:(id)a3;
- (id)stringFromCMTime:(id *)a3;
- (id)stringFromTimeInterval:(double)a3;
- (int64_t)style;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setCachedDateFormatterFormat:(id)a3;
- (void)setCachedDateFormatterTemplate:(id)a3;
- (void)setFormatTemplate:(double)a3;
- (void)setFullWidth:(BOOL)a3;
- (void)setIsRightToLeft:(BOOL)a3;
- (void)setLocale:(id)a3;
- (void)setNumberFormatterWithOneMinimumIntegerDigits:(id)a3;
- (void)setNumberFormatterWithTwoMinimumIntegerDigits:(id)a3;
- (void)setStyle:(int64_t)a3;
@end

@implementation AVTimeFormatter

- (void)setStyle:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
  {
    v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"-[AVTimeFormatter setStyle:]: unsupported style", v3, v4, v5, v6, v7, v9), 0 reason userInfo];
    objc_exception_throw(v8);
  }
  self->_internal->style = a3;
}

- (AVTimeFormatter)init
{
  v5.receiver = self;
  v5.super_class = (Class)AVTimeFormatter;
  v2 = [(AVTimeFormatter *)&v5 init];
  if (v2)
  {
    uint64_t v3 = objc_alloc_init(AVTimeFormatterInternal);
    v2->_internal = v3;
    if (v3)
    {
      CFRetain(v3);
      v2->_internal->style = 0;
      v2->_internal->isFullWidth = 0;
      v2->_internal->formatTemplate = 0.0;
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (AVTimeFormatter)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AVTimeFormatter;
  uint64_t v4 = -[AVTimeFormatter initWithCoder:](&v7, sel_initWithCoder_);
  if (v4)
  {
    v4->_internal->style = [a3 decodeIntegerForKey:@"MediaUIStyle"];
    v4->_internal->isFullWidth = [a3 decodeBoolForKey:@"MediaUIFullWidth"];
    [a3 decodeDoubleForKey:@"MediaUIFormatTemplate"];
    v4->_internal->formatTemplate = v5;
  }
  return v4;
}

- (void)dealloc
{
  internal = self->_internal;
  if (internal)
  {

    CFRelease(self->_internal);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVTimeFormatter;
  [(AVTimeFormatter *)&v4 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AVTimeFormatter;
  -[AVTimeFormatter encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeInteger:self->_internal->style forKey:@"MediaUIStyle"];
  [a3 encodeBool:self->_internal->isFullWidth forKey:@"MediaUIFullWidth"];
  [a3 encodeDouble:@"MediaUIFormatTemplate" forKey:self->_internal->formatTemplate];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = objc_alloc_init(AVTimeFormatter);
  [(AVTimeFormatter *)v4 setStyle:self->_internal->style];
  [(AVTimeFormatter *)v4 setFullWidth:self->_internal->isFullWidth];
  [(AVTimeFormatter *)v4 setFormatTemplate:self->_internal->formatTemplate];
  return v4;
}

- (id)stringFromCMTime:(id *)a3
{
  CMTime v4 = *(CMTime *)a3;
  return [(AVTimeFormatter *)self stringFromSeconds:CMTimeGetSeconds(&v4)];
}

- (id)stringFromTimeInterval:(double)a3
{
  int8x16_t v64 = *(int8x16_t *)&a3;
  objc_super v5 = (void *)[MEMORY[0x1E4F1CA20] currentLocale];
  if (([(NSLocale *)self->_internal->locale isEqual:v5] & 1) == 0)
  {
    [(AVTimeFormatter *)self setLocale:v5];
    [(AVTimeFormatter *)self setCachedDateFormatterFormat:0];
    [(AVTimeFormatter *)self setCachedDateFormatterTemplate:0];
    [(AVTimeFormatter *)self setNumberFormatterWithOneMinimumIntegerDigits:objc_alloc_init(MEMORY[0x1E4F28EE0])];
    [(NSNumberFormatter *)self->_internal->numberFormatterWithOneMinimumIntegerDigits setLocale:self->_internal->locale];
    [(NSNumberFormatter *)self->_internal->numberFormatterWithOneMinimumIntegerDigits setMinimumIntegerDigits:1];
    [(NSNumberFormatter *)self->_internal->numberFormatterWithOneMinimumIntegerDigits setNumberStyle:0];
    [(AVTimeFormatter *)self setNumberFormatterWithTwoMinimumIntegerDigits:objc_alloc_init(MEMORY[0x1E4F28EE0])];
    [(NSNumberFormatter *)self->_internal->numberFormatterWithTwoMinimumIntegerDigits setLocale:self->_internal->locale];
    [(NSNumberFormatter *)self->_internal->numberFormatterWithTwoMinimumIntegerDigits setMinimumIntegerDigits:2];
    [(NSNumberFormatter *)self->_internal->numberFormatterWithTwoMinimumIntegerDigits setNumberStyle:0];
    self->_internal->isRightToLeft = 0;
    [v5 localeIdentifier];
    uint64_t v6 = (void *)_CFLocaleCopyNumberingSystemForLocaleIdentifier();
    if (v6)
    {
      objc_super v7 = v6;
      self->_internal->isRightToLeft = [v6 isEqualToString:@"arab"];
      CFRelease(v7);
    }
  }
  [(AVTimeFormatter *)self formatTemplate];
  long long v63 = v8;
  int64_t v9 = [(AVTimeFormatter *)self style];
  v15.i64[1] = *((void *)&v63 + 1);
  double v16 = *(double *)v64.i64;
  double v17 = ceil(fabs(*(double *)&v63) + -0.5);
  switch(v9)
  {
    case 0:
    case 1:
      *(double *)v15.i64 = ceil(fabs(*(double *)v64.i64) + -0.5);
      goto LABEL_7;
    case 2:
      *(double *)v15.i64 = floor(fabs(*(double *)v64.i64) + 0.5);
LABEL_7:
      v18.f64[0] = NAN;
      v18.f64[1] = NAN;
      *(void *)&double v16 = vbslq_s8((int8x16_t)vnegq_f64(v18), v15, v64).u64[0];
      break;
    case 3:
      break;
    default:
      v61 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"-[AVTimeFormatter stringFromTimeInterval:]: unsupported style", v10, v11, v12, v13, v14, v62), 0 reason userInfo];
      objc_exception_throw(v61);
  }
  double v19 = fabs(v16);
  if (v19 <= 4294967300.0 && (unsigned int v20 = v19, v19 >> 5 <= 0x464))
  {
    if (v20 <= 0xE0F)
    {
      if (v20 <= 0x257)
      {
        char v60 = 3;
        if (v20 <= 9) {
          char v60 = 1;
        }
        if (v20 <= 0x3B) {
          char v21 = v60;
        }
        else {
          char v21 = 7;
        }
      }
      else
      {
        char v21 = 15;
      }
    }
    else
    {
      char v21 = 31;
    }
  }
  else
  {
    char v21 = 63;
  }
  double v65 = v16;
  double v22 = fabs(v17);
  if (v22 <= 4294967300.0)
  {
    unsigned int v24 = v22;
    char v25 = 15;
    char v26 = 7;
    char v27 = 3;
    if (v22 <= 9) {
      char v27 = 1;
    }
    if (v24 <= 0x3B) {
      char v26 = v27;
    }
    if (v24 <= 0x257) {
      char v25 = v26;
    }
    if (v24 <= 0xE0F) {
      char v23 = v25;
    }
    else {
      char v23 = 31;
    }
    if (v22 >> 5 > 0x464) {
      char v23 = 63;
    }
  }
  else
  {
    char v23 = 63;
  }
  char v28 = v23 | v21;
  int64_t v29 = [(AVTimeFormatter *)self style];
  char v30 = 7;
  if (v29 == 3) {
    char v30 = 71;
  }
  char v31 = v30 | v28;
  BOOL v32 = [(AVTimeFormatter *)self isFullWidth];
  char v33 = (2 * v31) & 0x28;
  if (!v32) {
    char v33 = 0;
  }
  char v34 = v33 | v31;
  v35 = &stru_1EE5953B8;
  if ((v28 & 0x10) != 0)
  {
    v36 = @"H";
    if ((v34 & 0x20) == 0) {
      v36 = &stru_1EE5953B8;
    }
    v35 = (__CFString *)[&stru_1EE5953B8 stringByAppendingFormat:@"%@H", v36];
  }
  v37 = @"m";
  if ((v34 & 8) == 0) {
    v37 = &stru_1EE5953B8;
  }
  v38 = (void *)[(id)-[__CFString stringByAppendingFormat:](v35 stringByAppendingFormat:@"%@m", v37), "stringByAppendingFormat:", @"%@s", @"s"];
  uint64_t v39 = (uint64_t)v38;
  if (v29 == 3) {
    uint64_t v39 = [v38 stringByAppendingString:@"SS"];
  }
  if (([(NSString *)self->_internal->cachedDateFormatterTemplate isEqual:v39] & 1) == 0)
  {
    -[AVTimeFormatter setCachedDateFormatterFormat:](self, "setCachedDateFormatterFormat:", [MEMORY[0x1E4F28C10] dateFormatFromTemplate:v39 options:0 locale:self->_internal->locale]);
    [(AVTimeFormatter *)self setCachedDateFormatterTemplate:v39];
  }
  cachedDateFormatterFormat = self->_internal->cachedDateFormatterFormat;
  double v41 = v65;
  if ((v65 >= 0.0 || (v42 = [(AVTimeFormatter *)self style], double v41 = v65, v42 == 2))
    && (v41 < 0.0 || (v43 = [(AVTimeFormatter *)self style], double v41 = v65, v43 != 2)))
  {
    if (v41 >= 0.0 || [(AVTimeFormatter *)self style] != 2) {
      goto LABEL_50;
    }
    v44 = @"%@+%@";
  }
  else
  {
    v44 = @"%@−%@";
  }
  if (self->_internal->isRightToLeft) {
    v45 = @"\u200F";
  }
  else {
    v45 = @"\u200E";
  }
  cachedDateFormatterFormat = (NSString *)objc_msgSend(NSString, "stringWithFormat:", v44, v41, v45, cachedDateFormatterFormat);
LABEL_50:
  v46 = [[[(NSString *)cachedDateFormatterFormat stringByReplacingOccurrencesOfString:@"a" withString:&stru_1EE5953B8] stringByReplacingOccurrencesOfString:@"b" withString:&stru_1EE5953B8] stringByReplacingOccurrencesOfString:@"B" withString:&stru_1EE5953B8];
  v47 = -[NSString stringByTrimmingCharactersInSet:](v46, "stringByTrimmingCharactersInSet:", [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet]);
  v48 = v47;
  if (v19 <= 4294967300.0)
  {
    double v52 = v65;
    if ((v28 & 0x10) != 0)
    {
      uint64_t v53 = 72;
      if ((v34 & 0x20) == 0) {
        uint64_t v53 = 64;
      }
      uint64_t v54 = objc_msgSend(*(id *)((char *)&self->_internal->super.isa + v53), "stringFromNumber:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", v65));
      if (v54) {
        v48 = -[NSString stringByReplacingOccurrencesOfString:withString:](-[NSString stringByReplacingOccurrencesOfString:withString:](-[NSString stringByReplacingOccurrencesOfString:withString:](-[NSString stringByReplacingOccurrencesOfString:withString:](-[NSString stringByReplacingOccurrencesOfString:withString:]([[[(NSString *)v48 stringByReplacingOccurrencesOfString:@"j" withString:@"H"] stringByReplacingOccurrencesOfString:@"J" withString:@"H"] stringByReplacingOccurrencesOfString:@"C" withString:@"H"], "stringByReplacingOccurrencesOfString:withString:", @"k",
      }
                        @"H"),
                      "stringByReplacingOccurrencesOfString:withString:",
                      @"K",
                      @"H"),
                    "stringByReplacingOccurrencesOfString:withString:",
                    @"h",
                    @"H"),
                  "stringByReplacingOccurrencesOfString:withString:",
                  @"HH",
                  v54),
                "stringByReplacingOccurrencesOfString:withString:",
                @"H",
                v54);
    }
    uint64_t v55 = objc_msgSend(*(id *)((char *)&self->_internal->super.isa + (v34 & 8 | 0x40)), "stringFromNumber:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", v19 % 0xE10 / 0x3C, v52));
    if (v55) {
      v48 = [[(NSString *)v48 stringByReplacingOccurrencesOfString:@"mm" withString:v55] stringByReplacingOccurrencesOfString:@"m" withString:v55];
    }
    v56 = -[NSNumberFormatter stringFromNumber:](self->_internal->numberFormatterWithTwoMinimumIntegerDigits, "stringFromNumber:", [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:v19 % 0x3C]);
    if (v56) {
      v48 = [[(NSString *)v48 stringByReplacingOccurrencesOfString:@"ss" withString:v56] stringByReplacingOccurrencesOfString:@"s" withString:v56];
    }
    if (v29 != 3) {
      return v48;
    }
    LODWORD(v57) = vcvtmd_u64_f64((v19 - floor(v19)) * 100.0);
    v58 = -[NSNumberFormatter stringFromNumber:](self->_internal->numberFormatterWithTwoMinimumIntegerDigits, "stringFromNumber:", [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:v57]);
    if (!v58) {
      return v48;
    }
    v51 = (__CFString *)v58;
    v50 = @"SS";
    v49 = v48;
  }
  else
  {
    v49 = -[NSString stringByReplacingOccurrencesOfString:withString:](-[NSString stringByReplacingOccurrencesOfString:withString:](-[NSString stringByReplacingOccurrencesOfString:withString:](-[NSString stringByReplacingOccurrencesOfString:withString:](-[NSString stringByReplacingOccurrencesOfString:withString:](-[NSString stringByReplacingOccurrencesOfString:withString:]([[[(NSString *)v47 stringByReplacingOccurrencesOfString:@"j" withString:@"−"] stringByReplacingOccurrencesOfString:@"J" withString:@"−"] stringByReplacingOccurrencesOfString:@"C" withString:@"−"], "stringByReplacingOccurrencesOfString:withString:",
                      @"k",
                      @"−"),
                    "stringByReplacingOccurrencesOfString:withString:",
                    @"K",
                    @"−"),
                  "stringByReplacingOccurrencesOfString:withString:",
                  @"h",
                  @"−"),
                "stringByReplacingOccurrencesOfString:withString:",
                @"H",
                @"−"),
              "stringByReplacingOccurrencesOfString:withString:",
              @"m",
              @"−"),
            "stringByReplacingOccurrencesOfString:withString:",
            @"s",
            @"−");
    v50 = @"S";
    v51 = @"−";
  }
  return [(NSString *)v49 stringByReplacingOccurrencesOfString:v50 withString:v51];
}

- (id)stringForObjectValue:(id)a3
{
  if (objc_opt_respondsToSelector()) {
    [a3 doubleValue];
  }
  else {
    double v5 = NAN;
  }
  return [(AVTimeFormatter *)self stringFromTimeInterval:v5];
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  return 0;
}

- (int64_t)style
{
  return self->_internal->style;
}

- (double)formatTemplate
{
  return self->_internal->formatTemplate;
}

- (void)setFormatTemplate:(double)a3
{
  self->_internal->formatTemplate = a3;
}

- (BOOL)isFullWidth
{
  return self->_internal->isFullWidth;
}

- (void)setFullWidth:(BOOL)a3
{
  self->_internal->isFullWidth = a3;
}

- (id)locale
{
  return self->_internal->locale;
}

- (void)setLocale:(id)a3
{
  locale = self->_internal->locale;
  if (locale != a3)
  {

    self->_internal->locale = (NSLocale *)[a3 copy];
  }
}

- (BOOL)isRightToLeft
{
  return self->_internal->isRightToLeft;
}

- (void)setIsRightToLeft:(BOOL)a3
{
  self->_internal->isRightToLeft = a3;
}

- (id)cachedDateFormatterFormat
{
  return self->_internal->cachedDateFormatterFormat;
}

- (void)setCachedDateFormatterFormat:(id)a3
{
  cachedDateFormatterFormat = self->_internal->cachedDateFormatterFormat;
  if (cachedDateFormatterFormat != a3)
  {

    self->_internal->cachedDateFormatterFormat = (NSString *)[a3 copy];
  }
}

- (id)cachedDateFormatterTemplate
{
  return self->_internal->cachedDateFormatterTemplate;
}

- (void)setCachedDateFormatterTemplate:(id)a3
{
  cachedDateFormatterTemplate = self->_internal->cachedDateFormatterTemplate;
  if (cachedDateFormatterTemplate != a3)
  {

    self->_internal->cachedDateFormatterTemplate = (NSString *)[a3 copy];
  }
}

- (id)numberFormatterWithOneMinimumIntegerDigits
{
  return self->_internal->numberFormatterWithOneMinimumIntegerDigits;
}

- (void)setNumberFormatterWithOneMinimumIntegerDigits:(id)a3
{
  numberFormatterWithOneMinimumIntegerDigits = self->_internal->numberFormatterWithOneMinimumIntegerDigits;
  if (numberFormatterWithOneMinimumIntegerDigits != a3)
  {

    self->_internal->numberFormatterWithOneMinimumIntegerDigits = (NSNumberFormatter *)[a3 copy];
  }
}

- (id)numberFormatterWithTwoMinimumIntegerDigits
{
  return self->_internal->numberFormatterWithTwoMinimumIntegerDigits;
}

- (void)setNumberFormatterWithTwoMinimumIntegerDigits:(id)a3
{
  numberFormatterWithTwoMinimumIntegerDigits = self->_internal->numberFormatterWithTwoMinimumIntegerDigits;
  if (numberFormatterWithTwoMinimumIntegerDigits != a3)
  {

    self->_internal->numberFormatterWithTwoMinimumIntegerDigits = (NSNumberFormatter *)[a3 copy];
  }
}

- (void)stringFromTimeInterval:.cold.1()
{
  __assert_rtn("AVCrackTime", "AVTimeFormatter.m", 124, "time >= 0.0");
}

@end