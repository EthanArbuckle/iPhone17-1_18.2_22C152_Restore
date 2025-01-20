@interface NSDateComponentsFormatter
+ (NSString)localizedStringFromDateComponents:(NSDateComponents *)components unitsStyle:(NSDateComponentsFormatterUnitsStyle)unitsStyle;
- (BOOL)_mayDecorateAttributedStringForObjectValue:(id)a3;
- (BOOL)_updateFormatterCacheIfNeeded_locked:(id)a3 unitsStyle:(int64_t)a4;
- (BOOL)allowsFractionalUnits;
- (BOOL)collapsesLargestUnit;
- (BOOL)getObjectValue:(id *)obj forString:(NSString *)string errorDescription:(NSString *)error;
- (BOOL)includesApproximationPhrase;
- (BOOL)includesTimeRemainingPhrase;
- (NSCalendar)calendar;
- (NSCalendarUnit)allowedUnits;
- (NSDate)referenceDate;
- (NSDateComponentsFormatter)init;
- (NSDateComponentsFormatter)initWithCoder:(id)a3;
- (NSDateComponentsFormatterUnitsStyle)unitsStyle;
- (NSDateComponentsFormatterZeroFormattingBehavior)zeroFormattingBehavior;
- (NSFormattingContext)formattingContext;
- (NSInteger)maximumUnitCount;
- (NSString)stringForObjectValue:(id)obj;
- (NSString)stringFromDate:(NSDate *)startDate toDate:(NSDate *)endDate;
- (NSString)stringFromDateComponents:(NSDateComponents *)components;
- (NSString)stringFromTimeInterval:(NSTimeInterval)ti;
- (id)_calendarFromDateComponents:(id)a3;
- (id)_calendarOrCanonicalCalendar;
- (id)_canonicalizedDateComponents:(id)a3 withCalendar:(id)a4 usedUnits:(unint64_t *)a5 withReferenceDate:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)stringForObjectValue:(id)a3 withReferenceDate:(id)a4;
- (void)_NSDateComponentsFormatter_commonInit;
- (void)_ensureUnitFormatterWithLocale:(id)a3;
- (void)_ensureUnitFormatterWithLocale_alreadyLocked:(id)a3;
- (void)_flushFormatterCache_locked;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)finalize;
- (void)receiveObservedValue:(id)a3;
- (void)setAllowedUnits:(NSCalendarUnit)allowedUnits;
- (void)setAllowsFractionalUnits:(BOOL)allowsFractionalUnits;
- (void)setCalendar:(NSCalendar *)calendar;
- (void)setCollapsesLargestUnit:(BOOL)collapsesLargestUnit;
- (void)setFormattingContext:(NSFormattingContext)formattingContext;
- (void)setIncludesApproximationPhrase:(BOOL)includesApproximationPhrase;
- (void)setIncludesTimeRemainingPhrase:(BOOL)includesTimeRemainingPhrase;
- (void)setMaximumUnitCount:(NSInteger)maximumUnitCount;
- (void)setReferenceDate:(NSDate *)referenceDate;
- (void)setUnitsStyle:(NSDateComponentsFormatterUnitsStyle)unitsStyle;
- (void)setZeroFormattingBehavior:(NSDateComponentsFormatterZeroFormattingBehavior)zeroFormattingBehavior;
@end

@implementation NSDateComponentsFormatter

- (id)_canonicalizedDateComponents:(id)a3 withCalendar:(id)a4 usedUnits:(unint64_t *)a5 withReferenceDate:(id)a6
{
  id v8 = a4;
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  unint64_t allowedUnits = self->_allowedUnits;
  if (!allowedUnits)
  {
    uint64_t v12 = 4 * ([a3 year] != 0x7FFFFFFFFFFFFFFFLL);
    uint64_t v13 = v12 | (8 * ([a3 month] != 0x7FFFFFFFFFFFFFFFLL));
    unint64_t v14 = v13 | ((unint64_t)([a3 weekOfMonth] != 0x7FFFFFFFFFFFFFFFLL) << 12);
    uint64_t v15 = v14 | (16 * ([a3 day] != 0x7FFFFFFFFFFFFFFFLL));
    uint64_t v16 = v15 | (32 * ([a3 hour] != 0x7FFFFFFFFFFFFFFFLL));
    unint64_t v17 = v16 | ((unint64_t)([a3 minute] != 0x7FFFFFFFFFFFFFFFLL) << 6);
    unint64_t allowedUnits = v17 | ((unint64_t)([a3 second] != 0x7FFFFFFFFFFFFFFFLL) << 7);
    id v8 = a4;
  }
  int64_t unitsStyle = self->_unitsStyle;
  if (!unitsStyle)
  {
    int v19 = 0;
    int v20 = 0;
    do
    {
      if ((*(void *)((unsigned char *)&unk_1823235F0 + unitsStyle) & ~allowedUnits) != 0)
      {
        v20 |= v19;
      }
      else
      {
        if (v19 & v20) {
          objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], @"Specifying positional units with gaps is ambiguous, and therefore unsupported", 0 reason userInfo]);
        }
        int v19 = 1;
      }
      unitsStyle += 8;
    }
    while (unitsStyle != 56);
  }
  if (!a6) {
    a6 = (id)[MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:0.0];
  }
  uint64_t v21 = [v8 dateByAddingComponents:a3 toDate:a6 options:0];
  uint64_t v22 = [v8 components:allowedUnits fromDate:a6 toDate:v21 options:0];
  v23 = (void *)v22;
  if (self->_collapsesLargestUnit || self->_maximumUnitCount >= 1)
  {
    uint64_t v75 = 0;
    memset(v74, 0, sizeof(v74));
    uint64_t v73 = 0;
    memset(v72, 0, sizeof(v72));
    v70[0] = 0;
    v70[1] = v70;
    v70[2] = 0x2020000000;
    int v71 = 0;
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __99__NSDateComponentsFormatter__canonicalizedDateComponents_withCalendar_usedUnits_withReferenceDate___block_invoke;
    v69[3] = &unk_1E51F9810;
    v69[4] = v22;
    v69[5] = v70;
    v69[6] = v72;
    v69[7] = v74;
    forEachUnit(allowedUnits, (uint64_t)v69);
    v66 = a5;
    v68 = self;
    if (self->_collapsesLargestUnit)
    {
      uint64_t v24 = 0;
      uint64_t v25 = -1;
      do
      {
        if (!*((void *)v74 + v24)) {
          goto LABEL_28;
        }
        uint64_t v26 = *((void *)v72 + v24);
        if (!v26) {
          goto LABEL_28;
        }
        if (v26 == 1 && v25 == -1)
        {
          v28 = (char *)v74 + 8 * v24;
          uint64_t v29 = objc_msgSend(v8, "rangeOfUnit:inUnit:forDate:", *((void *)v28 + 1));
          v31 = (char *)v72 + 8 * v24;
          uint64_t v32 = *((void *)v31 + 1);
          double v33 = (double)v30 * 0.1;
          if (v33 <= (double)(unint64_t)(v32 - v29) && v33 <= (double)(v29 + v30 - v32))
          {
LABEL_27:
            uint64_t v25 = v24;
            goto LABEL_28;
          }
          allowedUnits &= ~*((void *)v74 + v24);
          v23 = (void *)[v8 components:allowedUnits fromDate:a6 toDate:v21 options:0];
          *((void *)v72 + v24) = 0;
          uint64_t v34 = [v23 valueForComponent:*((void *)v28 + 1)];
          uint64_t v25 = v24 + 1;
          *((void *)v31 + 1) = v34;
        }
        else if (v25 == -1)
        {
          goto LABEL_27;
        }
LABEL_28:
        ++v24;
      }
      while (v24 != 6);
    }
    uint64_t maximumUnitCount = v68->_maximumUnitCount;
    if (maximumUnitCount >= 1)
    {
      uint64_t v36 = 0;
      unsigned int v37 = 0;
      uint64_t v38 = 0;
      while (1)
      {
        if (!*((void *)v74 + v36) || !*((void *)v72 + v36))
        {
          uint64_t v39 = v38;
          goto LABEL_36;
        }
        uint64_t v39 = v38 + 1;
        if (v38 == maximumUnitCount) {
          break;
        }
        unsigned int v37 = v36;
LABEL_36:
        ++v36;
        uint64_t v38 = v39;
        if (v36 == 7) {
          goto LABEL_39;
        }
      }
      unsigned int v37 = v36;
LABEL_39:
      if (v39 > maximumUnitCount && (int)v37 >= 1)
      {
        uint64_t v40 = v37;
        if (v37 <= 5)
        {
          uint64_t v41 = 8 * v37;
          bzero((char *)v72 + v41 + 8, 8 * (5 - v37) + 8);
          do
          {
            allowedUnits &= ~*(void *)((char *)v74 + v41 + 8);
            v41 += 8;
          }
          while (v41 != 48);
        }
        int v42 = 0;
        while (1)
        {
          if (v42)
          {
            uint64_t v43 = *((void *)v72 + v40);
            int v44 = v42 + v43;
            if (v40)
            {
              uint64_t v45 = [a4 rangeOfUnit:*((void *)v74 + v40) inUnit:*((void *)v74 + (v40 - 1)) forDate:v21];
              unint64_t v47 = v45 + v46 - 1;
              if ((int)v43 < 1) {
                int v48 = -1;
              }
              else {
                int v48 = 1;
              }
              BOOL v49 = v47 >= v44;
              if (v47 >= v44) {
                uint64_t v50 = 0;
              }
              else {
                uint64_t v50 = v45 + v46;
              }
              if (v49) {
                int v42 = 0;
              }
              else {
                int v42 = v48;
              }
              uint64_t v51 = v44 - v50;
            }
            else
            {
              int v42 = 0;
              uint64_t v51 = v44;
            }
            *((void *)v72 + v40) = v51;
            int v52 = v39 - (v51 == 0);
            if (v51) {
              int v53 = v39 + 1;
            }
            else {
              int v53 = v39;
            }
            if (v43) {
              LODWORD(v39) = v52;
            }
            else {
              LODWORD(v39) = v53;
            }
            id v8 = a4;
          }
          int64_t v54 = v68->_maximumUnitCount;
          if (v54 >= (int)v39 && v42 == 0) {
            goto LABEL_89;
          }
          uint64_t v56 = *((void *)v72 + v40);
          if (v40)
          {
            if (v54 < (int)v39) {
              break;
            }
          }
          if (!v56) {
            goto LABEL_86;
          }
LABEL_87:
          if (v40-- <= 0) {
            goto LABEL_89;
          }
        }
        if (*((void *)v74 + v40) == 16 && *((void *)v74 + (v40 - 1)) == 4096)
        {
          uint64_t v57 = *((void *)v72 + v40);
          int v58 = 7;
        }
        else
        {
          int v59 = objc_msgSend(v8, "rangeOfUnit:inUnit:forDate:");
          int v58 = v59 + v60;
          uint64_t v57 = *((void *)v72 + v40);
        }
        uint64_t v61 = 2 * v57;
        if ((v57 & 0x4000000000000000) != 0) {
          uint64_t v61 = -2 * v57;
        }
        if (v57 > 0) {
          int v62 = 1;
        }
        else {
          int v62 = -1;
        }
        if (v61 >= v58) {
          int v42 = v62;
        }
        else {
          int v42 = 0;
        }
        *((void *)v72 + v40) = 0;
        LODWORD(v39) = v39 - (v56 != 0);
LABEL_86:
        allowedUnits &= ~*((void *)v74 + v40);
        goto LABEL_87;
      }
    }
LABEL_89:
    uint64_t v64 = 0;
    a5 = v66;
    do
    {
      [v23 setValue:*(void *)((char *)v72 + v64) forComponent:*(void *)((char *)v74 + v64)];
      v64 += 8;
    }
    while (v64 != 56);
    _Block_object_dispose(v70, 8);
  }
  *a5 = allowedUnits;
  return v23;
}

- (void)_ensureUnitFormatterWithLocale_alreadyLocked:(id)a3
{
  unitFormatter = self->_unitFormatter;
  if (!unitFormatter)
  {
    v6 = objc_alloc_init(NSNumberFormatter);
    self->_unitFormatter = v6;
    [(NSNumberFormatter *)v6 setFormatterBehavior:1040];
    [(NSNumberFormatter *)self->_unitFormatter setPaddingCharacter:@"0"];
    [(NSNumberFormatter *)self->_unitFormatter setMinimumFractionDigits:0];
    [(NSNumberFormatter *)self->_unitFormatter setUsesGroupingSeparator:1];
    [(NSNumberFormatter *)self->_unitFormatter setRoundingMode:1];
    unitFormatter = self->_unitFormatter;
  }
  if (self->_unitsStyle == 4) {
    uint64_t v7 = 5;
  }
  else {
    uint64_t v7 = 1;
  }
  [(NSNumberFormatter *)unitFormatter setNumberStyle:v7];
  if (self->_allowsFractionalUnits) {
    uint64_t v8 = 3;
  }
  else {
    uint64_t v8 = 0;
  }
  [(NSNumberFormatter *)self->_unitFormatter setMaximumFractionDigits:v8];
  v9 = self->_unitFormatter;

  [(NSNumberFormatter *)v9 setLocale:a3];
}

- (void)setUnitsStyle:(NSDateComponentsFormatterUnitsStyle)unitsStyle
{
  if ((unint64_t)unitsStyle >= (NSDateComponentsFormatterUnitsStyleSpellOut|NSDateComponentsFormatterUnitsStyleShort)) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"NSDateComponentsFormatter.m", 914, @"Invalid parameter not satisfying: %@", @"unitsStyle == NSDateComponentsFormatterUnitsStyleSpellOut || unitsStyle == NSDateComponentsFormatterUnitsStyleFull || unitsStyle == NSDateComponentsFormatterUnitsStyleShort || unitsStyle == NSDateComponentsFormatterUnitsStyleAbbreviated || unitsStyle == NSDateComponentsFormatterUnitsStylePositional || unitsStyle == NSDateComponentsFormatterUnitsStyleBrief" object file lineNumber description];
  }
  os_unfair_lock_lock(&self->_lock);
  self->_int64_t unitsStyle = unitsStyle;
  [(NSDateComponentsFormatter *)self _flushFormatterCache_locked];

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)stringFromTimeInterval:(NSTimeInterval)ti
{
  if ((*(void *)&ti & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"NSDateComponentsFormatter.m", 484, @"Invalid parameter not satisfying: %@", @"isfinite(timeInterval) && !isnan(timeInterval)" object file lineNumber description];
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v5 setSecond:(uint64_t)ti];
  [v5 setMinute:0];
  [v5 setHour:0];
  [v5 setDay:0];
  [v5 setWeekOfMonth:0];
  [v5 setMonth:0];
  [v5 setYear:0];
  v6 = [(NSDateComponentsFormatter *)self stringForObjectValue:v5];

  return v6;
}

- (id)stringForObjectValue:(id)a3 withReferenceDate:(id)a4
{
  uint64_t v139 = *MEMORY[0x1E4F143B8];
  if (!a3 || (objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  context = (void *)MEMORY[0x185308110]();
  id v7 = [(NSDateComponentsFormatter *)self _calendarFromDateComponents:a3];
  uint64_t v8 = (void *)[v7 locale];
  if (!v8) {
    uint64_t v8 = (void *)[MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  }
  if (!objc_msgSend((id)objc_msgSend(v8, "localeIdentifier"), "length")) {
    uint64_t v8 = (void *)[MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  }
  v97 = v8;
  v98 = (void *)[v8 localeIdentifier];
  [v98 UTF8String];
  unint64_t zeroFormattingBehavior = self->_zeroFormattingBehavior;
  if (zeroFormattingBehavior == 1)
  {
    int v9 = 14;
    if (!self->_unitsStyle) {
      int v9 = 2;
    }
    LODWORD(zeroFormattingBehavior) = v9;
  }
  uint64_t v109 = 0;
  v99 = self;
  id v10 = [(NSDateComponentsFormatter *)self _canonicalizedDateComponents:a3 withCalendar:v7 usedUnits:&v109 withReferenceDate:a4];
  uint64_t v138 = 0;
  memset(v137, 0, sizeof(v137));
  memset_pattern16(__b, &unk_182323640, 0x38uLL);
  v107[0] = 0;
  v107[1] = v107;
  v107[2] = 0x2020000000;
  int v108 = 0;
  v106[0] = MEMORY[0x1E4F143A8];
  v106[1] = 3221225472;
  v106[2] = __68__NSDateComponentsFormatter_stringForObjectValue_withReferenceDate___block_invoke;
  v106[3] = &unk_1E51F9810;
  v106[4] = v10;
  v106[5] = v107;
  v106[6] = __b;
  v106[7] = v137;
  forEachUnit(v109, (uint64_t)v106);
  if ((zeroFormattingBehavior & 2) != 0)
  {
    for (uint64_t i = 0; i != 7; ++i)
    {
      uint64_t v12 = __b[i];
      if (v12 != 0x8000000000000000)
      {
        if (v12) {
          break;
        }
        __b[i] = 0x8000000000000000;
        *(void *)((char *)v137 + i * 8) = 0;
      }
    }
  }
  if ((zeroFormattingBehavior & 8) != 0)
  {
    for (uint64_t j = 6; j != -1; --j)
    {
      uint64_t v14 = __b[j];
      if (v14 != 0x8000000000000000)
      {
        if (v14) {
          break;
        }
        __b[j] = 0x8000000000000000;
        *(void *)((char *)v137 + j * 8) = 0;
      }
    }
  }
  if ((zeroFormattingBehavior & 4) != 0)
  {
    for (uint64_t k = 0; k != 7; ++k)
    {
      if (__b[k] != 0x8000000000000000) {
        break;
      }
    }
    for (int m = 6; m != -1; --m)
    {
      if (__b[m] != 0x8000000000000000) {
        break;
      }
    }
    if ((int)k < m)
    {
      unint64_t v17 = m - (unint64_t)k;
      v18 = (void *)v137 + k;
      int v19 = &__b[k];
      do
      {
        if (!*v19)
        {
          *int v19 = 0x8000000000000000;
          void *v18 = 0;
        }
        ++v18;
        ++v19;
        --v17;
      }
      while (v17);
    }
  }
  uint64_t v20 = 0;
  unint64_t unitsStyle = self->_unitsStyle;
  while (!*(void *)((char *)v137 + v20))
  {
    v20 += 8;
    if (v20 == 56)
    {
      *(void *)&long long v116 = 0;
      *((void *)&v116 + 1) = &v116;
      long long v117 = 0x2020000000uLL;
      v105[0] = MEMORY[0x1E4F143A8];
      v105[1] = 3221225472;
      v105[2] = __68__NSDateComponentsFormatter_stringForObjectValue_withReferenceDate___block_invoke_2;
      v105[3] = &unk_1E51F9838;
      v105[4] = v10;
      v105[5] = &v116;
      forEachUnit(v109, (uint64_t)v105);
      *(void *)&v137[0] = *(void *)(*((void *)&v116 + 1) + 24);
      __b[0] = 0;
      _Block_object_dispose(&v116, 8);
      break;
    }
  }
  if (unitsStyle)
  {
    uint64_t v100 = 0x8000000000000000;
    uint64_t v101 = 0x8000000000000000;
    unint64_t v102 = 0x8000000000000000;
    uint64_t v22 = v8;
    v23 = self;
  }
  else
  {
    uint64_t v25 = 0;
    unint64_t v102 = 0x8000000000000000;
    uint64_t v100 = 0x8000000000000000;
    uint64_t v101 = 0x8000000000000000;
    uint64_t v22 = v8;
    v23 = self;
    do
    {
      uint64_t v26 = *(void *)((char *)v137 + v25 * 8);
      switch(v26)
      {
        case 32:
          unint64_t v102 = __b[v25];
          break;
        case 64:
          uint64_t v101 = __b[v25];
          break;
        case 128:
          uint64_t v100 = __b[v25];
          break;
      }
      ++v25;
    }
    while (v25 != 7);
  }
  uint64_t v27 = 0;
  unint64_t v28 = 0;
  uint64_t v135 = 0;
  memset(v134, 0, sizeof(v134));
  uint64_t v133 = 0;
  memset(v132, 0, sizeof(v132));
  do
  {
    uint64_t v29 = *(void *)((char *)v137 + v27 * 8);
    if (v29)
    {
      *((void *)v134 + v28) = v29;
      *((void *)v132 + v28++) = __b[v27];
      *(void *)((char *)v137 + v27 * 8) = 0;
    }
    ++v27;
  }
  while (v27 != 7);
  if (v28 >= 2)
  {
    unint64_t v30 = v28 - 1;
    v31 = (uint64_t *)v132 + 1;
    do
    {
      uint64_t v32 = *v31;
      if (*v31 < 0) {
        uint64_t v32 = -v32;
      }
      *v31++ = v32;
      --v30;
    }
    while (v30);
  }
  if (!unitsStyle)
  {
    os_unfair_lock_lock(&v23->_lock);
    [(NSDateComponentsFormatter *)v23 _ensureUnitFormatterWithLocale_alreadyLocked:v22];
    id v34 = (id)[(NSNumberFormatter *)v23->_unitFormatter copy];
    v35 = v34;
    if ((zeroFormattingBehavior & 0x10000) != 0) {
      [v34 setMinimumIntegerDigits:2];
    }
    os_unfair_lock_unlock(&v23->_lock);
    BOOL v36 = v100 == 0x8000000000000000 || v101 == 0x8000000000000000;
    int v37 = !v36;
    if (v36 || v102 == 0x8000000000000000)
    {
      if (v37)
      {
        uint64_t v41 = v100;
        if (v100 < 0) {
          uint64_t v41 = -v100;
        }
        uint64_t v100 = v41;
      }
      else
      {
        if (v101 == 0x8000000000000000 || v102 == 0x8000000000000000)
        {
          v104 = 0;
          BOOL v69 = v102 == 0x8000000000000000 && v101 == 0x8000000000000000 && v100 == 0x8000000000000000;
          if (!v69 && v28 == 1)
          {
            if (!v23->_includesTimeRemainingPhrase && !v23->_includesApproximationPhrase)
            {
              v92 = [NSNumber alloc];
              uint64_t v93 = v100;
              if (v101 != 0x8000000000000000) {
                uint64_t v93 = v101;
              }
              if (v102 == 0x8000000000000000) {
                unint64_t v94 = v93;
              }
              else {
                unint64_t v94 = v102;
              }
              v95 = [(NSNumber *)v92 initWithInteger:v94];
              double v33 = (NSMutableString *)(id)objc_msgSend((id)objc_msgSend(v35, "stringFromNumber:", v95), "mutableCopy");

              goto LABEL_151;
            }
            v104 = 0;
            unint64_t v28 = 1;
            [0 insertString:@"{0} " atIndex:0];
            goto LABEL_108;
          }
LABEL_106:
          double v33 = v104;
          if (!v28) {
            goto LABEL_151;
          }
          [(NSMutableString *)v104 insertString:@"{0} " atIndex:0];
LABEL_108:
          unint64_t unitsStyle = 1;
          goto LABEL_109;
        }
        uint64_t v42 = v101;
        if (v101 < 0) {
          uint64_t v42 = -v101;
        }
        uint64_t v101 = v42;
      }
      uint64_t v40 = -2;
    }
    else
    {
      if (v100 >= 0) {
        uint64_t v38 = v100;
      }
      else {
        uint64_t v38 = -v100;
      }
      uint64_t v39 = v101;
      if (v101 < 0) {
        uint64_t v39 = -v101;
      }
      uint64_t v100 = v38;
      uint64_t v101 = v39;
      uint64_t v40 = -3;
    }
    long long v130 = 0u;
    long long v131 = 0u;
    long long v128 = 0u;
    long long v129 = 0u;
    long long v126 = 0u;
    long long v127 = 0u;
    long long v124 = 0u;
    long long v125 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    LODWORD(v110[0]) = 0;
    int TimePattern = uatmufmt_getTimePattern();
    if (SLODWORD(v110[0]) > 0) {
      goto LABEL_89;
    }
    int v44 = TimePattern;
    v104 = +[NSString string];
    long long v114 = 0u;
    long long v115 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    id v45 = +[NSDateFormatter _componentsFromFormatString:](NSDateFormatter, "_componentsFromFormatString:", +[NSString stringWithCharacters:&v116 length:v44]);
    uint64_t v46 = [v45 countByEnumeratingWithState:&v112 objects:v111 count:16];
    v28 += v40;
    if (v46)
    {
      uint64_t v47 = *(void *)v113;
      uint64_t v48 = *MEMORY[0x1E4F1C390];
      uint64_t v49 = *MEMORY[0x1E4F1C380];
      do
      {
        for (uint64_t n = 0; n != v46; ++n)
        {
          if (*(void *)v113 != v47) {
            objc_enumerationMutation(v45);
          }
          uint64_t v51 = *(void **)(*((void *)&v112 + 1) + 8 * n);
          int v52 = (void *)[v51 objectForKey:v48];
          if ((objc_msgSend((id)objc_msgSend(v51, "objectForKey:", v49), "BOOLValue") & 1) == 0)
          {
            unint64_t v53 = [v52 length];
            uint64_t v54 = ((v53 < 2) & WORD1(zeroFormattingBehavior)) != 0 ? 2 : v53;
            [v35 setMinimumIntegerDigits:v54];
            char v55 = [v52 hasPrefix:@"h"];
            unint64_t v56 = v102;
            if ((v55 & 1) != 0
              || (v57 = [v52 hasPrefix:@"m"], unint64_t v56 = v101, (v57 & 1) != 0)
              || (v58 = [v52 hasPrefix:@"s"], unint64_t v56 = v100, v58))
            {
              int v52 = objc_msgSend(v35, "stringFromNumber:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v56));
            }
          }
          [(NSMutableString *)v104 appendString:v52];
        }
        uint64_t v46 = [v45 countByEnumeratingWithState:&v112 objects:v111 count:16];
      }
      while (v46);
    }
    v23 = v99;
    goto LABEL_106;
  }
  v104 = 0;
  double v33 = 0;
  if (!v28) {
    goto LABEL_151;
  }
LABEL_109:
  long long v59 = 0uLL;
  long long v130 = 0u;
  long long v131 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  unint64_t v60 = v28 - 2;
  if (v28 != 2)
  {
    if (v28 == 1)
    {
      memset(&v110[8], 0, 128);
      if (!v104)
      {
        v104 = +[NSString stringWithString:@"{0}"];
        long long v59 = 0uLL;
      }
      v110[6] = v59;
      v110[7] = v59;
      v110[4] = v59;
      v110[5] = v59;
      v110[2] = v59;
      v110[3] = v59;
      v110[0] = v59;
      v110[1] = v59;
      os_unfair_lock_lock(&v23->_lock);
      if ([(NSDateComponentsFormatter *)v23 _updateFormatterCacheIfNeeded_locked:v98 unitsStyle:unitsStyle])
      {
        icuUnitFromNSUnit(*(uint64_t *)&v134[0]);
        int v61 = uatmufmt_format();
        os_unfair_lock_unlock(&v23->_lock);
        uint64_t v62 = [(NSString *)v104 rangeOfString:@"{0}"];
        -[NSMutableString replaceCharactersInRange:withCharacters:length:](v104, "replaceCharactersInRange:withCharacters:length:", v62, v63, v110, v61);
      }
      else
      {
        os_unfair_lock_unlock(&v23->_lock);
        v104 = 0;
      }
      goto LABEL_150;
    }
    goto LABEL_116;
  }
  if (!v104)
  {
    icuStyleFromNSStyle(unitsStyle);
    ListPatteruint64_t n = uatmufmt_getListPattern();
    double v33 = 0;
    if (ListPattern < 1) {
      goto LABEL_151;
    }
    double v33 = [(NSString *)[NSMutableString alloc] initWithCharacters:&v116 length:ListPattern];
    long long v122 = 0u;
    long long v123 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    os_unfair_lock_lock(&v23->_lock);
    if ([(NSDateComponentsFormatter *)v23 _updateFormatterCacheIfNeeded_locked:v98 unitsStyle:unitsStyle])
    {
      icuUnitFromNSUnit(*((uint64_t *)&v134[0] + 1));
      int v66 = uatmufmt_format();
      os_unfair_lock_unlock(&v23->_lock);
      uint64_t v86 = [(NSString *)v33 rangeOfString:@"{1}"];
      -[NSMutableString replaceCharactersInRange:withCharacters:length:](v33, "replaceCharactersInRange:withCharacters:length:", v86, v87, &v116, v66);
      char v88 = 0;
    }
    else
    {
      os_unfair_lock_unlock(&v23->_lock);
      double v33 = 0;
      char v88 = 1;
    }
    long long v122 = 0u;
    long long v123 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    os_unfair_lock_lock(&v23->_lock);
    if ([(NSDateComponentsFormatter *)v23 _updateFormatterCacheIfNeeded_locked:v98 unitsStyle:unitsStyle])
    {
      icuUnitFromNSUnit(*(void *)((unint64_t)v134 & 0xFFFFFFFFFFFFFFF7 | (8 * (v88 & 1))));
      int v89 = uatmufmt_format();
      os_unfair_lock_unlock(&v23->_lock);
      uint64_t v90 = [(NSString *)v33 rangeOfString:@"{0}"];
      -[NSMutableString replaceCharactersInRange:withCharacters:length:](v33, "replaceCharactersInRange:withCharacters:length:", v90, v91, &v116, v89);
      goto LABEL_151;
    }
    os_unfair_lock_unlock(&v23->_lock);
LABEL_89:
    double v33 = 0;
    goto LABEL_151;
  }
LABEL_116:
  if (unitsStyle >= 6) {
    abort();
  }
  int v64 = uatmufmt_getListPattern();
  double v33 = 0;
  if (v64 >= 1)
  {
    if (v104) {
      [(NSMutableString *)v104 replaceOccurrencesOfString:@"{0}", +[NSString stringWithCharacters:&v116 length:v64], 0, 0, [(NSString *)v104 length] withString options range];
    }
    else {
      v104 = [(NSString *)[NSMutableString alloc] initWithCharacters:&v116 length:v64];
    }
    long long v122 = 0u;
    long long v123 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    os_unfair_lock_lock(&v23->_lock);
    if ([(NSDateComponentsFormatter *)v23 _updateFormatterCacheIfNeeded_locked:v98 unitsStyle:unitsStyle])
    {
      icuUnitFromNSUnit(*((void *)v134 + v28 - 1));
      int v67 = uatmufmt_format();
      os_unfair_lock_unlock(&v23->_lock);
      uint64_t v70 = [(NSString *)v104 rangeOfString:@"{1}"];
      -[NSMutableString replaceCharactersInRange:withCharacters:length:](v104, "replaceCharactersInRange:withCharacters:length:", v70, v71, &v116, v67);
    }
    else
    {
      os_unfair_lock_unlock(&v23->_lock);
      v104 = 0;
      unint64_t v60 = v28 - 1;
    }
    long long v122 = 0u;
    long long v123 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    os_unfair_lock_lock(&v23->_lock);
    if ([(NSDateComponentsFormatter *)v23 _updateFormatterCacheIfNeeded_locked:v98 unitsStyle:unitsStyle])
    {
      icuUnitFromNSUnit(*((void *)v134 + v60));
      int v72 = uatmufmt_format();
      os_unfair_lock_unlock(&v23->_lock);
      --v60;
      uint64_t v73 = [(NSString *)v104 rangeOfString:@"{0}"];
      -[NSMutableString replaceCharactersInRange:withCharacters:length:](v104, "replaceCharactersInRange:withCharacters:length:", v73, v74, &v116, v72);
    }
    else
    {
      os_unfair_lock_unlock(&v23->_lock);
      v104 = 0;
    }
    long long v122 = 0u;
    long long v123 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    if ((v60 & 0x80000000) != 0)
    {
LABEL_150:
      double v33 = v104;
      goto LABEL_151;
    }
    int v75 = v60 + 1;
    do
    {
      --v75;
      int v76 = uatmufmt_getListPattern();
      double v33 = 0;
      if (v76 < 1) {
        break;
      }
      v77 = (void *)[(NSMutableString *)v104 copy];
      -[NSMutableString replaceCharactersInRange:withCharacters:length:](v104, "replaceCharactersInRange:withCharacters:length:", 0, [(NSString *)v104 length], &v116, v76);
      [(NSMutableString *)v104 replaceOccurrencesOfString:@"{1}", v77, 0, 0, [(NSString *)v104 length] withString options range];

      long long v122 = 0u;
      long long v123 = 0u;
      long long v120 = 0u;
      long long v121 = 0u;
      long long v118 = 0u;
      long long v119 = 0u;
      long long v116 = 0u;
      long long v117 = 0u;
      os_unfair_lock_lock(&v23->_lock);
      if ([(NSDateComponentsFormatter *)v23 _updateFormatterCacheIfNeeded_locked:v98 unitsStyle:unitsStyle])
      {
        icuUnitFromNSUnit(*((void *)v134 + v60));
        int v78 = uatmufmt_format();
        os_unfair_lock_unlock(&v23->_lock);
        --v60;
        uint64_t v79 = [(NSString *)v104 rangeOfString:@"{0}"];
        -[NSMutableString replaceCharactersInRange:withCharacters:length:](v104, "replaceCharactersInRange:withCharacters:length:", v79, v80, &v116, v78);
      }
      else
      {
        os_unfair_lock_unlock(&v23->_lock);
        v104 = 0;
      }
      double v33 = v104;
    }
    while (v75 > 0);
  }
LABEL_151:
  _Block_object_dispose(v107, 8);
  if ([(NSString *)v33 length])
  {
    if (v99->_includesApproximationPhrase)
    {
      BOOL v81 = !v99->_includesTimeRemainingPhrase;
      v82 = [NSString alloc];
      v83 = (void *)_NSFoundationBundle();
      if (v81) {
        v84 = -[NSString initWithFormat:locale:](v82, "initWithFormat:locale:", [v83 localizedStringForKey:@"About %@" value:&stru_1ECA5C228 table:@"DurationFormatting"], v97, v33);
      }
      else {
        v84 = -[NSString initWithFormat:locale:](v82, "initWithFormat:locale:", [v83 localizedStringForKey:@"About %@ remaining" value:&stru_1ECA5C228 table:@"DurationFormatting"], v97, v33);
      }
      goto LABEL_159;
    }
    if (v99->_includesTimeRemainingPhrase)
    {
      v84 = -[NSString initWithFormat:locale:]([NSString alloc], "initWithFormat:locale:", [(id)_NSFoundationBundle() localizedStringForKey:@"%@ remaining" value:&stru_1ECA5C228 table:@"DurationFormatting"], v97, v33);
LABEL_159:
      double v33 = (NSMutableString *)v84;
      goto LABEL_160;
    }
  }
  v85 = v33;
LABEL_160:
  return v33;
}

uint64_t __68__NSDateComponentsFormatter_stringForObjectValue_withReferenceDate___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) valueForComponent:a2];
  *(void *)(*(void *)(a1 + 48) + 8 * *(int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) = result;
  *(void *)(*(void *)(a1 + 56) + 8 * (int)(*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))++) = a2;
  return result;
}

uint64_t __99__NSDateComponentsFormatter__canonicalizedDateComponents_withCalendar_usedUnits_withReferenceDate___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) valueForComponent:a2];
  *(void *)(*(void *)(a1 + 48) + 8 * *(int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) = result;
  *(void *)(*(void *)(a1 + 56) + 8 * (int)(*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))++) = a2;
  return result;
}

- (BOOL)_updateFormatterCacheIfNeeded_locked:(id)a3 unitsStyle:(int64_t)a4
{
  if (self->_fmt && [(NSString *)self->_fmtLocaleIdent isEqualToString:a3]) {
    return 1;
  }
  os_unfair_lock_unlock(&self->_lock);
  [a3 UTF8String];
  if (a4 == 4)
  {
    unum_open();
    os_unfair_lock_lock(&self->_lock);
    [(NSDateComponentsFormatter *)self _flushFormatterCache_locked];
  }
  else
  {
    os_unfair_lock_lock(&self->_lock);
    [(NSDateComponentsFormatter *)self _flushFormatterCache_locked];
    if ((unint64_t)(a4 - 1) >= 5 || ((0x17u >> (a4 - 1)) & 1) == 0) {
      abort();
    }
  }
  self->_fmt = (void *)uatmufmt_openWithNumberFormat();
  self->_fmtLocaleIdent = (NSString *)[a3 copy];
  return 1;
}

- (NSString)stringForObjectValue:(id)obj
{
  return (NSString *)[(NSDateComponentsFormatter *)self stringForObjectValue:obj withReferenceDate:self->_referenceDate];
}

- (id)_calendarOrCanonicalCalendar
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_calendar;
  os_unfair_lock_unlock(p_lock);
  if (!v4)
  {
    if (qword_1E8EE7E48 != -1) {
      dispatch_once(&qword_1E8EE7E48, &__block_literal_global_33);
    }
    v4 = (NSCalendar *)(id)_MergedGlobals_6;
  }

  return v4;
}

- (id)_calendarFromDateComponents:(id)a3
{
  id result = (id)[a3 calendar];
  if (!result)
  {
    return [(NSDateComponentsFormatter *)self _calendarOrCanonicalCalendar];
  }
  return result;
}

- (void)_flushFormatterCache_locked
{
  if (self->_fmt)
  {
    uatmufmt_close();
    self->_fmt = 0;
  }

  self->_fmtLocaleIdent = 0;
  self->_unitFormatter = 0;
}

uint64_t __68__NSDateComponentsFormatter_stringForObjectValue_withReferenceDate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) valueForComponent:a2];
  if (result != 0x7FFFFFFFFFFFFFFFLL) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
  return result;
}

- (void)setAllowedUnits:(NSCalendarUnit)allowedUnits
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_unint64_t allowedUnits = allowedUnits;

  os_unfair_lock_unlock(p_lock);
}

- (void)setIncludesTimeRemainingPhrase:(BOOL)includesTimeRemainingPhrase
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_includesTimeRemainingPhrase = includesTimeRemainingPhrase;

  os_unfair_lock_unlock(p_lock);
}

- (NSDateComponentsFormatter)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)NSDateComponentsFormatter;
  v2 = [(NSDateComponentsFormatter *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(NSDateComponentsFormatter *)v2 _NSDateComponentsFormatter_commonInit];
    v3->_unint64_t zeroFormattingBehavior = 1;
  }
  return v3;
}

- (void)_NSDateComponentsFormatter_commonInit
{
  self->_lock._os_unfair_lock_opaque = 0;
  self->_calendar = (NSCalendar *)(id)[MEMORY[0x1E4F1C9A8] autoupdatingCurrentCalendar];
}

- (void)setZeroFormattingBehavior:(NSDateComponentsFormatterZeroFormattingBehavior)zeroFormattingBehavior
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_unint64_t zeroFormattingBehavior = zeroFormattingBehavior;

  os_unfair_lock_unlock(p_lock);
}

- (void)setCalendar:(NSCalendar *)calendar
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = self->_calendar;
  if (v6 != calendar)
  {
    self->_calendar = (NSCalendar *)[(NSCalendar *)calendar copy];
  }
  [(NSDateComponentsFormatter *)self _flushFormatterCache_locked];

  os_unfair_lock_unlock(p_lock);
}

- (NSDateComponentsFormatterZeroFormattingBehavior)zeroFormattingBehavior
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  NSDateComponentsFormatterZeroFormattingBehavior zeroFormattingBehavior = self->_zeroFormattingBehavior;
  os_unfair_lock_unlock(p_lock);
  return zeroFormattingBehavior;
}

- (NSDateComponentsFormatterUnitsStyle)unitsStyle
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  NSDateComponentsFormatterUnitsStyle unitsStyle = self->_unitsStyle;
  os_unfair_lock_unlock(p_lock);
  return unitsStyle;
}

- (NSCalendarUnit)allowedUnits
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  NSCalendarUnit allowedUnits = self->_allowedUnits;
  os_unfair_lock_unlock(p_lock);
  return allowedUnits;
}

- (void)setMaximumUnitCount:(NSInteger)maximumUnitCount
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_uint64_t maximumUnitCount = maximumUnitCount;

  os_unfair_lock_unlock(p_lock);
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  os_unfair_lock_lock(&self->_lock);
  [(NSDateComponentsFormatter *)self _flushFormatterCache_locked];
  os_unfair_lock_unlock(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)NSDateComponentsFormatter;
  [(NSDateComponentsFormatter *)&v3 dealloc];
}

- (void)finalize
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(NSDateComponentsFormatter *)self _flushFormatterCache_locked];
  os_unfair_lock_unlock(p_lock);
  v4.receiver = self;
  v4.super_class = (Class)NSDateComponentsFormatter;
  [(NSDateComponentsFormatter *)&v4 finalize];
}

uint64_t __57__NSDateComponentsFormatter__calendarOrCanonicalCalendar__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  v1 = (void *)[v0 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  _MergedGlobals_6 = (uint64_t)v1;
  uint64_t v2 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];

  return [v1 setLocale:v2];
}

- (NSString)stringFromDate:(NSDate *)startDate toDate:(NSDate *)endDate
{
  if (!startDate)
  {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"NSDateComponentsFormatter.m", 318, @"Invalid parameter not satisfying: %@", @"startDate != nil" object file lineNumber description];
    if (endDate) {
      goto LABEL_3;
    }
LABEL_13:
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"NSDateComponentsFormatter.m", 319, @"Invalid parameter not satisfying: %@", @"endDate != nil" object file lineNumber description];
    goto LABEL_3;
  }
  if (!endDate) {
    goto LABEL_13;
  }
LABEL_3:
  if (!_NSIsNSDate() || !_NSIsNSDate()) {
    return 0;
  }
  id v8 = [(NSDateComponentsFormatter *)self _calendarOrCanonicalCalendar];
  if (self->_allowedUnits) {
    unint64_t allowedUnits = self->_allowedUnits;
  }
  else {
    unint64_t allowedUnits = 4348;
  }
  uint64_t v10 = [v8 components:allowedUnits fromDate:startDate toDate:endDate options:0];

  return (NSString *)[(NSDateComponentsFormatter *)self stringForObjectValue:v10 withReferenceDate:startDate];
}

- (void)_ensureUnitFormatterWithLocale:(id)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(NSDateComponentsFormatter *)self _ensureUnitFormatterWithLocale_alreadyLocked:a3];

  os_unfair_lock_unlock(p_lock);
}

+ (NSString)localizedStringFromDateComponents:(NSDateComponents *)components unitsStyle:(NSDateComponentsFormatterUnitsStyle)unitsStyle
{
  id v6 = objc_alloc_init((Class)a1);
  [v6 setUnitsStyle:unitsStyle];
  id v7 = (NSString *)[v6 stringFromDateComponents:components];

  return v7;
}

- (NSString)stringFromDateComponents:(NSDateComponents *)components
{
  if (!components) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"NSDateComponentsFormatter.m", 499, @"Invalid parameter not satisfying: %@", @"components != nil" object file lineNumber description];
  }

  return [(NSDateComponentsFormatter *)self stringForObjectValue:components];
}

- (NSInteger)maximumUnitCount
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  NSInteger maximumUnitCount = self->_maximumUnitCount;
  os_unfair_lock_unlock(p_lock);
  return maximumUnitCount;
}

- (void)setAllowsFractionalUnits:(BOOL)allowsFractionalUnits
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_allowsFractionalUnits = allowsFractionalUnits;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)allowsFractionalUnits
{
  uint64_t v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_allowsFractionalUnits;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setCollapsesLargestUnit:(BOOL)collapsesLargestUnit
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_collapsesLargestUnit = collapsesLargestUnit;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)collapsesLargestUnit
{
  uint64_t v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_collapsesLargestUnit;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSCalendar)calendar
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_super v4 = self->_calendar;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setIncludesApproximationPhrase:(BOOL)includesApproximationPhrase
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_includesApproximationPhrase = includesApproximationPhrase;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)includesApproximationPhrase
{
  uint64_t v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_includesApproximationPhrase;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)includesTimeRemainingPhrase
{
  uint64_t v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_includesTimeRemainingPhrase;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setFormattingContext:(NSFormattingContext)formattingContext
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_formattingContext = formattingContext;

  os_unfair_lock_unlock(p_lock);
}

- (NSFormattingContext)formattingContext
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  NSFormattingContext formattingContext = self->_formattingContext;
  os_unfair_lock_unlock(p_lock);
  return formattingContext;
}

- (NSDate)referenceDate
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_super v4 = self->_referenceDate;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setReferenceDate:(NSDate *)referenceDate
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = self->_referenceDate;
  if (v6 != referenceDate)
  {
    self->_referenceDate = (NSDate *)[(NSDate *)referenceDate copy];
  }

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)getObjectValue:(id *)obj forString:(NSString *)string errorDescription:(NSString *)error
{
  if (getObjectValue_forString_errorDescription__onceToken != -1) {
    dispatch_once(&getObjectValue_forString_errorDescription__onceToken, &__block_literal_global_78);
  }
  return 0;
}

void __71__NSDateComponentsFormatter_getObjectValue_forString_errorDescription___block_invoke()
{
}

- (BOOL)_mayDecorateAttributedStringForObjectValue:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a3 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)NSDateComponentsFormatter;
    return [(NSFormatter *)&v9 _mayDecorateAttributedStringForObjectValue:a3];
  }
  else
  {
    uint64_t v5 = (objc_class *)objc_opt_class();
    MethodImplementatiouint64_t n = class_getMethodImplementation(v5, sel_attributedStringForObjectValue_withDefaultAttributes_);
    id v7 = (objc_class *)objc_opt_class();
    return MethodImplementation != class_getMethodImplementation(v7, sel_attributedStringForObjectValue_withDefaultAttributes_);
  }
}

- (NSDateComponentsFormatter)initWithCoder:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSDateComponentsFormatter cannot be decoded by non-keyed archivers" userInfo:0]);
  }
  v8.receiver = self;
  v8.super_class = (Class)NSDateComponentsFormatter;
  uint64_t v5 = [(NSFormatter *)&v8 initWithCoder:a3];
  id v6 = v5;
  if (v5)
  {
    [(NSDateComponentsFormatter *)v5 _NSDateComponentsFormatter_commonInit];
    v6->_unint64_t allowedUnits = [a3 decodeIntegerForKey:@"NS.allowedUnits"];
    v6->_allowsFractionalUnits = [a3 decodeBoolForKey:@"NS.allowsFractionalUnits"];
    v6->_calendar = (NSCalendar *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectForKey:", @"NS.calendar"), "copy");
    v6->_collapsesLargestUnit = [a3 decodeBoolForKey:@"NS.collapsesLargestUnit"];
    v6->_includesApproximationPhrase = [a3 decodeBoolForKey:@"NS.includesApproximationPhrase"];
    v6->_includesTimeRemainingPhrase = [a3 decodeBoolForKey:@"NS.includesTimeRemainingPhrase"];
    v6->_NSInteger maximumUnitCount = [a3 decodeIntegerForKey:@"NS.maximumUnitCount"];
    v6->_NSDateComponentsFormatterUnitsStyle unitsStyle = [a3 decodeIntegerForKey:@"NS.unitsStyle"];
    v6->_NSDateComponentsFormatterZeroFormattingBehavior zeroFormattingBehavior = (int)[a3 decodeInt32ForKey:@"NS.zeroFormattingBehavior"];
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSDateComponentsFormatter cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  os_unfair_lock_lock(&self->_lock);
  v7.receiver = self;
  v7.super_class = (Class)NSDateComponentsFormatter;
  [(NSFormatter *)&v7 encodeWithCoder:a3];
  [a3 encodeInteger:self->_allowedUnits forKey:@"NS.allowedUnits"];
  if (self->_allowsFractionalUnits) {
    [a3 encodeBool:1 forKey:@"NS.allowsFractionalUnits"];
  }
  [a3 encodeObject:self->_calendar forKey:@"NS.calendar"];
  if (self->_collapsesLargestUnit) {
    [a3 encodeBool:1 forKey:@"NS.collapsesLargestUnit"];
  }
  if (self->_includesApproximationPhrase) {
    [a3 encodeBool:1 forKey:@"NS.includesApproximationPhrase"];
  }
  if (self->_includesTimeRemainingPhrase) {
    [a3 encodeBool:1 forKey:@"NS.includesTimeRemainingPhrase"];
  }
  int64_t maximumUnitCount = self->_maximumUnitCount;
  if (maximumUnitCount) {
    [a3 encodeInteger:maximumUnitCount forKey:@"NS.maximumUnitCount"];
  }
  [a3 encodeInteger:self->_unitsStyle forKey:@"NS.unitsStyle"];
  unint64_t zeroFormattingBehavior = self->_zeroFormattingBehavior;
  if (zeroFormattingBehavior != 1) {
    [a3 encodeInt32:zeroFormattingBehavior forKey:@"NS.zeroFormattingBehavior"];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (id)copyWithZone:(_NSZone *)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v6 setAllowedUnits:self->_allowedUnits];
  [v6 setAllowsFractionalUnits:self->_allowsFractionalUnits];
  [v6 setCalendar:self->_calendar];
  [v6 setCollapsesLargestUnit:self->_collapsesLargestUnit];
  [v6 setIncludesApproximationPhrase:self->_includesApproximationPhrase];
  [v6 setIncludesTimeRemainingPhrase:self->_includesTimeRemainingPhrase];
  [v6 setMaximumUnitCount:self->_maximumUnitCount];
  [v6 setUnitsStyle:self->_unitsStyle];
  [v6 setZeroFormattingBehavior:self->_zeroFormattingBehavior];
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)receiveObservedValue:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"NSObservationFormatterSupport.m", 29, @"Invalid parameter not satisfying: %@", @"!value || [value isKindOfClass:STATIC_CLASS_REF(NSDateComponents)]" object file lineNumber description];
    }
    v6.receiver = self;
    v6.super_class = (Class)NSDateComponentsFormatter;
    [(NSDateComponentsFormatter *)&v6 receiveObservedValue:[(NSDateComponentsFormatter *)self stringFromDateComponents:a3]];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NSDateComponentsFormatter;
    [(NSDateComponentsFormatter *)&v7 receiveObservedValue:0];
  }
}

@end