@interface DDTimeZoneConversionAction
+ (BOOL)actionAvailableForResult:(__DDResult *)a3;
+ (id)timeZoneFromResult:(__DDResult *)a3 date:(id *)a4;
- (DDTimeZoneConversionAction)initWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5;
- (id)_titleWithValue;
- (id)localizedName;
@end

@implementation DDTimeZoneConversionAction

+ (id)timeZoneFromResult:(__DDResult *)a3 date:(id *)a4
{
  if (DDResultCopyExtractedDateFromReferenceDate())
  {
    if (a4) {
      *a4 = 0;
    }
    id v5 = 0;
  }
  else if (DDResultCopyExtractedStartDateEndDate())
  {
    if (a4) {
      *a4 = 0;
    }
    id v5 = 0;
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

+ (BOOL)actionAvailableForResult:(__DDResult *)a3
{
  id v5 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  uint64_t v6 = [a1 timeZoneFromResult:a3 date:0];
  v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8) {
    LOBYTE(v9) = 0;
  }
  else {
    int v9 = [v5 isEqualToTimeZone:v6] ^ 1;
  }

  return v9;
}

- (DDTimeZoneConversionAction)initWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)DDTimeZoneConversionAction;
  uint64_t v6 = [(DDConversionAction *)&v13 initWithURL:a3 result:a4 context:a5];
  if (v6)
  {
    id v12 = 0;
    uint64_t v7 = +[DDTimeZoneConversionAction timeZoneFromResult:a4 date:&v12];
    BOOL v8 = (NSDate *)v12;
    tz = v6->_tz;
    v6->_tz = (NSTimeZone *)v7;

    date = v6->_date;
    v6->_date = v8;
  }
  return v6;
}

- (id)_titleWithValue
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v3 setDateStyle:2];
  [v3 setTimeStyle:1];
  v4 = [v3 stringFromDate:self->_date];

  return v4;
}

- (id)localizedName
{
  if (-[DDAction calloutFlavor]((uint64_t)self))
  {
    id v3 = [(DDTimeZoneConversionAction *)self _titleWithValue];
  }
  else
  {
    v4 = [MEMORY[0x1E4F1CAF0] localTimeZone];
    id v3 = [v4 localizedName:4 locale:0];
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_tz, 0);
}

@end