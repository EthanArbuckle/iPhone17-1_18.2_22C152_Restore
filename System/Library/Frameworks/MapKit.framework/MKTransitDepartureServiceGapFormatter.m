@interface MKTransitDepartureServiceGapFormatter
- (MKTransitDepartureServiceGapFormatter)initWithTimeZone:(id)a3 departureCutoffDate:(id)a4;
- (NSDate)departureCutoffDate;
- (NSTimeZone)timeZone;
- (id)_descriptionForDepartureDate:(id)a3 canIncludeDate:(BOOL)a4 outDateFormat:(unint64_t *)a5;
- (id)lastDepartureAtStringFromDate:(id)a3;
- (id)lastDepartureString;
- (id)lastDepartureUntilStringFromDate:(id)a3;
@end

@implementation MKTransitDepartureServiceGapFormatter

- (MKTransitDepartureServiceGapFormatter)initWithTimeZone:(id)a3 departureCutoffDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MKTransitDepartureServiceGapFormatter;
  v9 = [(MKTransitDepartureServiceGapFormatter *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_timeZone, a3);
    objc_storeStrong((id *)&v10->_departureCutoffDate, a4);
  }

  return v10;
}

- (id)lastDepartureString
{
  v2 = [MKTransitDepartureServiceGapFormatterResult alloc];
  v3 = _MKLocalizedStringFromThisBundle(@"Last departure");
  v4 = [(MKTransitDepartureServiceGapFormatterResult *)v2 initWithFormat:v3 dateDescription:0 dateFormat:0];

  return v4;
}

- (id)lastDepartureUntilStringFromDate:(id)a3
{
  uint64_t v8 = 0;
  v3 = [(MKTransitDepartureServiceGapFormatter *)self _descriptionForDepartureDate:a3 canIncludeDate:1 outDateFormat:&v8];
  v4 = 0;
  if ((unint64_t)(v8 - 1) <= 3)
  {
    v4 = _MKLocalizedStringFromThisBundle(off_1E54BC098[v8 - 1]);
  }
  v5 = [MKTransitDepartureServiceGapFormatterResult alloc];
  v6 = [(MKTransitDepartureServiceGapFormatterResult *)v5 initWithFormat:v4 dateDescription:v3 dateFormat:v8];

  return v6;
}

- (id)lastDepartureAtStringFromDate:(id)a3
{
  uint64_t v8 = 0;
  v3 = [(MKTransitDepartureServiceGapFormatter *)self _descriptionForDepartureDate:a3 canIncludeDate:0 outDateFormat:&v8];
  v4 = 0;
  if ((unint64_t)(v8 - 1) <= 3)
  {
    v4 = _MKLocalizedStringFromThisBundle(@"Last departure at <hours:minutes> format");
  }
  v5 = [MKTransitDepartureServiceGapFormatterResult alloc];
  v6 = [(MKTransitDepartureServiceGapFormatterResult *)v5 initWithFormat:v4 dateDescription:v3 dateFormat:v8];

  return v6;
}

- (id)_descriptionForDepartureDate:(id)a3 canIncludeDate:(BOOL)a4 outDateFormat:(unint64_t *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v9 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  if (v6)
  {
    v10 = [(MKTransitDepartureServiceGapFormatter *)self timeZone];
    if (objc_msgSend(v9, "_navigation_isDateInToday:inTimeZone:", v8, v10))
    {
    }
    else
    {
      v11 = [(MKTransitDepartureServiceGapFormatter *)self departureCutoffDate];
      [v8 timeIntervalSinceDate:v11];
      double v13 = v12;

      if (v13 >= 43200.0)
      {
        uint64_t v21 = 0;
        v19 = [(MKTransitDepartureServiceGapFormatter *)self timeZone];
        v16 = objc_msgSend(v9, "_navigation_transitRelativeDateStringForDate:context:inTimeZone:outUsedFormat:", v8, 5, v19, &v21);

        uint64_t v20 = 2;
        if (v21 == 1) {
          uint64_t v20 = 3;
        }
        unint64_t v17 = 4;
        if (v21 != 2) {
          unint64_t v17 = v20;
        }
        if (a5) {
          goto LABEL_8;
        }
        goto LABEL_9;
      }
    }
  }
  if (qword_1EB316020 != -1) {
    dispatch_once(&qword_1EB316020, &__block_literal_global_65);
  }
  v14 = (void *)_MergedGlobals_158;
  v15 = [(MKTransitDepartureServiceGapFormatter *)self timeZone];
  [v14 setTimeZone:v15];

  v16 = [(id)_MergedGlobals_158 stringFromDate:v8];
  unint64_t v17 = 1;
  if (a5) {
LABEL_8:
  }
    *a5 = v17;
LABEL_9:

  return v16;
}

uint64_t __99__MKTransitDepartureServiceGapFormatter__descriptionForDepartureDate_canIncludeDate_outDateFormat___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_MergedGlobals_158;
  _MergedGlobals_158 = (uint64_t)v0;

  v2 = (void *)_MergedGlobals_158;
  v3 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [v2 setLocale:v3];

  v4 = (void *)_MergedGlobals_158;

  return [v4 setLocalizedDateFormatFromTemplate:@"jma"];
}

- (NSDate)departureCutoffDate
{
  return self->_departureCutoffDate;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);

  objc_storeStrong((id *)&self->_departureCutoffDate, 0);
}

@end