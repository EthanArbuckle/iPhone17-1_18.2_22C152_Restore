@interface GEOComposedStringArgument_Countdown
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)rightToLeft;
- (GEOComposedStringArgument_Countdown)initWithCoder:(id)a3;
- (NSDate)overrideReferenceDate;
- (id)_initWithGeoFormatArgument:(id)a3;
- (id)_stringReplacementWithOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setOverrideReferenceDate:(id)a3;
- (void)setRightToLeft:(BOOL)a3;
@end

@implementation GEOComposedStringArgument_Countdown

- (id)_initWithGeoFormatArgument:(id)a3
{
  id v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)GEOComposedStringArgument_Countdown;
  id v6 = [(GEOComposedStringArgument *)&v31 _initWithGeoFormatArgument:v5];
  if (v6)
  {
    v7 = [v5 countdownData];
    v8 = v7;
    if (v7)
    {
      if ([v7 timestampValuesCount])
      {
        v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "timestampValuesCount"));
        if ([v8 timestampValuesCount])
        {
          v3 = 0;
          do
          {
            v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v8, "timestampValueAtIndex:", v3));
            [v9 addObject:v10];

            ++v3;
          }
          while ((unint64_t)v3 < [v8 timestampValuesCount]);
        }
        v11 = (void *)*((void *)v6 + 4);
        *((void *)v6 + 4) = v9;
      }
      if ([v8 alternateFormatStringsCount])
      {
        uint64_t v12 = [v8 alternateFormatStringsCount];
        if (v12 == [v8 alternateCountdownTypesCount])
        {
          v13 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v8, "alternateFormatStringsCount"));
          v14 = [v8 alternateFormatStrings];
          uint64_t v25 = MEMORY[0x1E4F143A8];
          uint64_t v26 = 3221225472;
          v27 = __66__GEOComposedStringArgument_Countdown__initWithGeoFormatArgument___block_invoke;
          v28 = &unk_1E53E9900;
          id v29 = v8;
          id v15 = v13;
          id v30 = v15;
          [v14 enumerateObjectsUsingBlock:&v25];

          v3 = (char *)*((void *)v6 + 5);
          *((void *)v6 + 5) = v15;
          id v16 = v15;
        }
      }
      v17 = objc_msgSend(v8, "separator", v25, v26, v27, v28);
      uint64_t v18 = [v17 copy];
      v19 = (void *)*((void *)v6 + 6);
      *((void *)v6 + 6) = v18;

      v20 = [v8 timezone];
      if (v20)
      {
        v21 = (void *)MEMORY[0x1E4F1CAF0];
        v3 = [v8 timezone];
        v22 = [v21 timeZoneWithName:v3];
      }
      else
      {
        v22 = 0;
      }
      objc_storeStrong((id *)v6 + 7, v22);
      if (v20)
      {
      }
    }
    id v23 = v6;
  }
  return v6;
}

- (id)_stringReplacementWithOptions:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v58 = a3;
  overrideReferenceDate = self->_overrideReferenceDate;
  unint64_t v5 = 0x1E4F1C000uLL;
  if (overrideReferenceDate)
  {
    id v6 = overrideReferenceDate;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1C9C8] date];
  }
  v7 = v6;
  v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  v59 = self;
  v9 = self->_timestampValues;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v63 objects:v69 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v64;
    unint64_t v14 = 2;
    uint64_t v60 = *(void *)v64;
    while (2)
    {
      uint64_t v15 = 0;
      uint64_t v61 = v11;
      do
      {
        if (*(void *)v64 != v13) {
          objc_enumerationMutation(v9);
        }
        id v16 = *(void **)(v5 + 2504);
        [*(id *)(*((void *)&v63 + 1) + 8 * v15) doubleValue];
        v17 = objc_msgSend(v16, "dateWithTimeIntervalSinceReferenceDate:");
        [v17 timeIntervalSinceDate:v7];
        double v19 = v18;
        double v20 = -GEOConfigGetDouble(GeoServicesConfig_DepartureCutoffGracePeriodNetworkDefault, (uint64_t)off_1E9114298);
        BOOL v21 = v19 < 60.0;
        if (v19 <= v20) {
          BOOL v21 = 0;
        }
        if (v19 >= 0.0 || v21)
        {
          if (v21)
          {
            v14 -= (v12 & 1) == 0;
            uint64_t v12 = 1;
          }
          else
          {
            unint64_t v23 = (uint64_t)v19 < 60 ? 1 : (uint64_t)v19 / 0x3CuLL;
            [NSNumber numberWithInteger:v23];
            v24 = v9;
            v26 = uint64_t v25 = v12;
            [v26 stringValue];
            unint64_t v27 = v14;
            unint64_t v28 = v5;
            v30 = id v29 = v7;
            [v8 addObject:v30];

            v7 = v29;
            unint64_t v5 = v28;
            unint64_t v14 = v27;

            uint64_t v12 = v25;
            v9 = v24;
            uint64_t v13 = v60;
            uint64_t v11 = v61;
          }
          if ([v8 count] >= v14)
          {

            goto LABEL_27;
          }
        }

        ++v15;
      }
      while (v11 != v15);
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v63 objects:v69 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }
LABEL_27:

  id v31 = v8;
  v32 = v31;
  v33 = v31;
  if (v59->_rightToLeft)
  {
    v34 = [v31 reverseObjectEnumerator];
    v33 = [v34 allObjects];
  }
  uint64_t v35 = [v33 count];
  if (v12)
  {
    if (!v35)
    {
      v45 = [(NSDictionary *)v59->_countdownFormatStrings objectForKeyedSubscript:&unk_1ED73EB00];
      goto LABEL_52;
    }
    uint64_t v36 = 2;
    goto LABEL_34;
  }
  if (v35)
  {
    uint64_t v36 = 3;
LABEL_34:
    countdownFormatStrings = v59->_countdownFormatStrings;
    v38 = [NSNumber numberWithInt:v36];
    v39 = [(NSDictionary *)countdownFormatStrings objectForKeyedSubscript:v38];

    if (v39)
    {
      v40 = v7;
      if ([(NSString *)v59->_separator length])
      {
        v41 = v59->_separator;
      }
      else
      {
        v50 = +[GEOComposedString localizationProvider];
        v41 = [v50 separatorForTimestampList];
      }
      v51 = [v33 componentsJoinedByString:v41];
      v52 = +[GEOComposedString localizationProvider];
      v53 = [v52 minutesFormatForCountdownList];

      if (v53)
      {
        uint64_t v62 = 0;
        id v54 = [NSString localizedStringWithValidatedFormat:v53, @"%@", &v62, v51 validFormatSpecifiers error];
      }
      else
      {
        id v54 = v51;
      }
      v55 = v54;
      v56 = [(GEOComposedStringArgument *)v59 token];
      v45 = [v39 stringByReplacingOccurrencesOfString:v56 withString:v55];

      v7 = v40;
    }
    else
    {
      if (qword_1EB29DE48 != -1) {
        dispatch_once(&qword_1EB29DE48, &__block_literal_global_204);
      }
      v42 = (void *)_MergedGlobals_3_3;
      if (os_log_type_enabled((os_log_t)_MergedGlobals_3_3, OS_LOG_TYPE_ERROR))
      {
        v43 = @"UPCOMING_ONLY";
        if (v12) {
          v43 = @"IMMINENT_AND_UPCOMING";
        }
        *(_DWORD *)buf = 138412290;
        v68 = v43;
        v44 = v42;
        _os_log_impl(&dword_188D96000, v44, OS_LOG_TYPE_ERROR, "Server did not provide a countdown format string for type: %@", buf, 0xCu);
      }
      v45 = 0;
    }
    goto LABEL_51;
  }
  v39 = [(NSArray *)v59->_timestampValues lastObject];
  [v39 doubleValue];
  double v47 = v46;
  v48 = +[GEOComposedString localizationProvider];
  v49 = [v48 locale];
  v45 = GEOStringForTimestamp(@"jjmm", v49, v59->_defaultTimeZone, v47);

LABEL_51:
LABEL_52:

  return v45;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)GEOComposedStringArgument_Countdown;
  v4 = [(GEOComposedStringArgument *)&v16 copyWithZone:a3];
  uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->_timestampValues copyItems:1];
  id v6 = (void *)v4[4];
  v4[4] = v5;

  uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:self->_countdownFormatStrings copyItems:1];
  v8 = (void *)v4[5];
  v4[5] = v7;

  uint64_t v9 = [(NSString *)self->_separator copy];
  uint64_t v10 = (void *)v4[6];
  v4[6] = v9;

  uint64_t v11 = [(NSTimeZone *)self->_defaultTimeZone copy];
  uint64_t v12 = (void *)v4[7];
  v4[7] = v11;

  uint64_t v13 = [(NSDate *)self->_overrideReferenceDate copy];
  unint64_t v14 = (void *)v4[8];
  v4[8] = v13;

  *((unsigned char *)v4 + 72) = self->_rightToLeft;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOComposedStringArgument_Countdown;
  id v4 = a3;
  [(GEOComposedStringArgument *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_timestampValues, @"_timestampValues", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_countdownFormatStrings forKey:@"_countdownFormatStrings"];
  [v4 encodeObject:self->_separator forKey:@"_separator"];
  [v4 encodeObject:self->_defaultTimeZone forKey:@"_defaultTimeZone"];
  [v4 encodeObject:self->_overrideReferenceDate forKey:@"_overrideReferenceDate"];
  [v4 encodeBool:self->_rightToLeft forKey:@"_rightToLeft"];
}

- (GEOComposedStringArgument_Countdown)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GEOComposedStringArgument_Countdown;
  objc_super v5 = [(GEOComposedStringArgument *)&v19 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_timestampValues"];
    timestampValues = v5->_timestampValues;
    v5->_timestampValues = (NSArray *)v6;

    uint64_t v8 = objc_opt_class();
    uint64_t v9 = [v4 decodeDictionaryWithKeysOfClass:v8 objectsOfClass:objc_opt_class() forKey:@"_countdownFormatStrings"];
    countdownFormatStrings = v5->_countdownFormatStrings;
    v5->_countdownFormatStrings = (NSDictionary *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_separator"];
    separator = v5->_separator;
    v5->_separator = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_defaultTimeZone"];
    defaultTimeZone = v5->_defaultTimeZone;
    v5->_defaultTimeZone = (NSTimeZone *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_overrideReferenceDate"];
    overrideReferenceDate = v5->_overrideReferenceDate;
    v5->_overrideReferenceDate = (NSDate *)v15;

    v5->_rightToLeft = [v4 decodeBoolForKey:@"_rightToLeft"];
    v17 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_super v5 = v4;
    v33.receiver = self;
    v33.super_class = (Class)GEOComposedStringArgument_Countdown;
    if (![(GEOComposedStringArgument *)&v33 isEqual:v5]) {
      goto LABEL_15;
    }
    uint64_t v6 = (void *)v5[4];
    unint64_t v7 = self->_timestampValues;
    unint64_t v8 = v6;
    if (v7 | v8)
    {
      uint64_t v9 = (void *)v8;
      int v10 = [(id)v7 isEqual:v8];

      if (!v10) {
        goto LABEL_15;
      }
    }
    uint64_t v11 = (void *)v5[5];
    unint64_t v12 = self->_countdownFormatStrings;
    unint64_t v13 = v11;
    if (v12 | v13)
    {
      unint64_t v14 = (void *)v13;
      int v15 = [(id)v12 isEqual:v13];

      if (!v15) {
        goto LABEL_15;
      }
    }
    objc_super v16 = (void *)v5[6];
    unint64_t v17 = self->_separator;
    unint64_t v18 = v16;
    if (v17 | v18)
    {
      objc_super v19 = (void *)v18;
      int v20 = [(id)v17 isEqual:v18];

      if (!v20) {
        goto LABEL_15;
      }
    }
    BOOL v21 = (void *)v5[7];
    unint64_t v22 = self->_defaultTimeZone;
    unint64_t v23 = v21;
    if (v22 | v23)
    {
      v24 = (void *)v23;
      int v25 = [(id)v22 isEqual:v23];

      if (!v25) {
        goto LABEL_15;
      }
    }
    uint64_t v26 = (void *)v5[8];
    unint64_t v27 = self->_overrideReferenceDate;
    unint64_t v28 = v26;
    if (!(v27 | v28)
      || (id v29 = (void *)v28, v30 = [(id)v27 isEqual:v28], v29, (id)v27, v30))
    {
      BOOL v31 = self->_rightToLeft == *((unsigned __int8 *)v5 + 72);
    }
    else
    {
LABEL_15:
      BOOL v31 = 0;
    }
  }
  else
  {
    BOOL v31 = 0;
  }

  return v31;
}

- (NSDate)overrideReferenceDate
{
  return self->_overrideReferenceDate;
}

- (void)setOverrideReferenceDate:(id)a3
{
}

- (BOOL)rightToLeft
{
  return self->_rightToLeft;
}

- (void)setRightToLeft:(BOOL)a3
{
  self->_rightToLeft = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideReferenceDate, 0);
  objc_storeStrong((id *)&self->_defaultTimeZone, 0);
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_countdownFormatStrings, 0);

  objc_storeStrong((id *)&self->_timestampValues, 0);
}

@end