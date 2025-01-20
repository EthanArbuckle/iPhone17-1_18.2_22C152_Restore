@interface HMDTimeBasedFlagDaily
+ (id)convertLegacyFlagBits:(id)a3 lastSaveTIme:(id)a4;
- (HMDTimeBasedFlagContext)context;
- (HMDTimeBasedFlagDaily)initWithContext:(id)a3 dateProvider:(id)a4;
- (HMDTimeBasedFlagDaily)initWithSerializedFlag:(id)a3 context:(id)a4 dateProvider:(id)a5;
- (HMMDateProvider)dateProvider;
- (NSDate)bit0Date;
- (id)description;
- (id)serializeToDictionary;
- (unint64_t)_bitMaskForDate:(id)a3;
- (unint64_t)bits;
- (unint64_t)bitsForDate:(id)a3 bitCount:(int64_t)a4 outValidBitCount:(int64_t *)a5;
- (unint64_t)currentBits;
- (void)clearBitForDate:(id)a3;
- (void)clearCurrentBit;
- (void)setBit0Date:(id)a3;
- (void)setBitForDate:(id)a3;
- (void)setBits:(unint64_t)a3;
- (void)setCurrentBit;
@end

@implementation HMDTimeBasedFlagDaily

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bit0Date, 0);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_destroyWeak((id *)&self->_context);
}

- (void)setBit0Date:(id)a3
{
}

- (NSDate)bit0Date
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBits:(unint64_t)a3
{
  self->_bits = a3;
}

- (unint64_t)bits
{
  return self->_bits;
}

- (HMMDateProvider)dateProvider
{
  return self->_dateProvider;
}

- (HMDTimeBasedFlagContext)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  return (HMDTimeBasedFlagContext *)WeakRetained;
}

- (id)description
{
  v3 = NSString;
  unint64_t v4 = [(HMDTimeBasedFlagDaily *)self bits];
  v5 = [(HMDTimeBasedFlagDaily *)self bit0Date];
  v6 = [v3 stringWithFormat:@"Daily flags: bits=0x%llx, date=%@", v4, v5];

  return v6;
}

- (id)serializeToDictionary
{
  v9[3] = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v8[0] = @"bits";
  unint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[HMDTimeBasedFlagDaily bits](self, "bits"));
  v9[0] = v4;
  v8[1] = @"bit0date";
  v5 = [(HMDTimeBasedFlagDaily *)self bit0Date];
  v8[2] = @"periodicity";
  v9[1] = v5;
  v9[2] = &unk_26E4710F8;
  v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (unint64_t)bitsForDate:(id)a3 bitCount:(int64_t)a4 outValidBitCount:(int64_t *)a5
{
  id v8 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v10 = (void *)MEMORY[0x263F499A8];
  v11 = [(HMDTimeBasedFlagDaily *)self bit0Date];
  uint64_t v12 = [v10 daysFromDate:v11 toDate:v8];

  if (v12 == 0 || (unint64_t)v12 >= 0xFFFFFFFFFFFFFFC1)
  {
    if (a5)
    {
      int64_t v13 = v12 + 64;
      if (v12 + 64 >= a4) {
        int64_t v13 = a4;
      }
      *a5 = v13;
    }
    if (a4 >= 64)
    {
      unint64_t v14 = [(HMDTimeBasedFlagDaily *)self bits] >> -(char)v12;
      goto LABEL_26;
    }
    unint64_t v16 = [(HMDTimeBasedFlagDaily *)self bits] >> -(char)v12;
LABEL_22:
    unint64_t v14 = v16 & ~(-1 << a4);
    goto LABEL_26;
  }
  if ((unint64_t)(v12 - 1) <= 0x3E)
  {
    if (a5)
    {
      int64_t v15 = 64;
      if (a4 < 64) {
        int64_t v15 = a4;
      }
      *a5 = v15;
    }
    if (a4 >= 64)
    {
      unint64_t v14 = [(HMDTimeBasedFlagDaily *)self bits] << v12;
      goto LABEL_26;
    }
    unint64_t v16 = [(HMDTimeBasedFlagDaily *)self bits] << v12;
    goto LABEL_22;
  }
  if (v12 < 64)
  {
    if (a5)
    {
      unint64_t v14 = 0;
      *a5 = 0;
      goto LABEL_26;
    }
LABEL_25:
    unint64_t v14 = 0;
    goto LABEL_26;
  }
  if (!a5) {
    goto LABEL_25;
  }
  unint64_t v14 = 0;
  int64_t v17 = 64;
  if (a4 < 64) {
    int64_t v17 = a4;
  }
  *a5 = v17;
LABEL_26:
  os_unfair_lock_unlock(p_lock);

  return v14;
}

- (unint64_t)currentBits
{
  v3 = [(HMDTimeBasedFlagDaily *)self dateProvider];
  unint64_t v4 = [v3 startOfCurrentDay];
  unint64_t v5 = [(HMDTimeBasedFlagDaily *)self bitsForDate:v4 bitCount:64 outValidBitCount:0];

  return v5;
}

- (unint64_t)_bitMaskForDate:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (void *)MEMORY[0x263F499A8];
  v6 = [(HMDTimeBasedFlagDaily *)self bit0Date];
  unint64_t v7 = [v5 daysFromDate:v6 toDate:v4];

  if (v7 != 0 && v7 < 0xFFFFFFFFFFFFFFC1)
  {
    if (v7 - 1 > 0x3E)
    {
      if (v7 + 127 <= 0x3F)
      {
        [(HMDTimeBasedFlagDaily *)self setBits:[(HMDTimeBasedFlagDaily *)self bits] >> (-63 - v7)];
        v11 = [MEMORY[0x263F499A8] startOfDateByAddingDayCount:63 toDate:v4];
        [(HMDTimeBasedFlagDaily *)self setBit0Date:v11];

        unint64_t v8 = 0x8000000000000000;
        goto LABEL_9;
      }
      v10 = self;
      unint64_t v9 = 0;
    }
    else
    {
      unint64_t v9 = [(HMDTimeBasedFlagDaily *)self bits] << v7;
      v10 = self;
    }
    [(HMDTimeBasedFlagDaily *)v10 setBits:v9];
    [(HMDTimeBasedFlagDaily *)self setBit0Date:v4];
    unint64_t v8 = 1;
    goto LABEL_9;
  }
  unint64_t v8 = 1 << -(char)v7;
LABEL_9:

  return v8;
}

- (void)clearBitForDate:(id)a3
{
  id v7 = a3;
  if (objc_msgSend((id)minAllowedDate, "compare:") != 1)
  {
    os_unfair_lock_lock_with_options();
    unint64_t v4 = [(HMDTimeBasedFlagDaily *)self _bitMaskForDate:v7];
    unint64_t v5 = [(HMDTimeBasedFlagDaily *)self bits];
    [(HMDTimeBasedFlagDaily *)self setBits:[(HMDTimeBasedFlagDaily *)self bits] & ~v4];
    os_unfair_lock_unlock(&self->_lock);
    if ((v5 & v4) != 0)
    {
      v6 = [(HMDTimeBasedFlagDaily *)self context];
      [v6 flagChanged];
    }
  }
}

- (void)clearCurrentBit
{
  id v4 = [(HMDTimeBasedFlagDaily *)self dateProvider];
  v3 = [v4 startOfCurrentDay];
  [(HMDTimeBasedFlagDaily *)self clearBitForDate:v3];
}

- (void)setBitForDate:(id)a3
{
  id v7 = a3;
  if (objc_msgSend((id)minAllowedDate, "compare:") != 1)
  {
    os_unfair_lock_lock_with_options();
    unint64_t v4 = [(HMDTimeBasedFlagDaily *)self _bitMaskForDate:v7];
    unint64_t v5 = [(HMDTimeBasedFlagDaily *)self bits];
    [(HMDTimeBasedFlagDaily *)self setBits:[(HMDTimeBasedFlagDaily *)self bits] | v4];
    os_unfair_lock_unlock(&self->_lock);
    if ((v5 & v4) == 0)
    {
      v6 = [(HMDTimeBasedFlagDaily *)self context];
      [v6 flagChanged];
    }
  }
}

- (void)setCurrentBit
{
  id v4 = [(HMDTimeBasedFlagDaily *)self dateProvider];
  v3 = [v4 startOfCurrentDay];
  [(HMDTimeBasedFlagDaily *)self setBitForDate:v3];
}

- (HMDTimeBasedFlagDaily)initWithSerializedFlag:(id)a3 context:(id)a4 dateProvider:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [(HMDTimeBasedFlagDaily *)self initWithContext:a4 dateProvider:v9];
  if (v10)
  {
    v11 = [v8 objectForKeyedSubscript:@"bits"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
    id v13 = v12;

    uint64_t v14 = [v13 unsignedLongLongValue];
    v10->_bits = v14;
    int64_t v15 = [v8 objectForKeyedSubscript:@"bit0date"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unint64_t v16 = v15;
    }
    else {
      unint64_t v16 = 0;
    }
    id v17 = v16;

    if (v17)
    {
      v18 = v15;
    }
    else
    {
      v18 = [v9 startOfCurrentDay];
    }
    bit0Date = v10->_bit0Date;
    v10->_bit0Date = v18;
  }
  return v10;
}

- (HMDTimeBasedFlagDaily)initWithContext:(id)a3 dateProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (initWithContext_dateProvider__onceToken != -1) {
    dispatch_once(&initWithContext_dateProvider__onceToken, &__block_literal_global_54648);
  }
  v13.receiver = self;
  v13.super_class = (Class)HMDTimeBasedFlagDaily;
  id v8 = [(HMDTimeBasedFlagDaily *)&v13 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_context, v6);
    objc_storeStrong((id *)&v9->_dateProvider, a4);
    v9->_bits = 0;
    uint64_t v10 = [v7 startOfCurrentDay];
    bit0Date = v9->_bit0Date;
    v9->_bit0Date = (NSDate *)v10;
  }
  return v9;
}

void __54__HMDTimeBasedFlagDaily_initWithContext_dateProvider___block_invoke()
{
  id v5 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v5 setDay:1];
  [v5 setMonth:1];
  [v5 setYear:2022];
  id v0 = objc_alloc(MEMORY[0x263EFF8F0]);
  v1 = (void *)[v0 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
  v2 = [MEMORY[0x263EFFA18] timeZoneForSecondsFromGMT:0];
  [v1 setTimeZone:v2];

  uint64_t v3 = [v1 dateFromComponents:v5];
  id v4 = (void *)minAllowedDate;
  minAllowedDate = v3;
}

+ (id)convertLegacyFlagBits:(id)a3 lastSaveTIme:(id)a4
{
  v11[3] = *MEMORY[0x263EF8340];
  v10[0] = @"bits";
  v10[1] = @"bit0date";
  v11[0] = a3;
  v11[1] = a4;
  v10[2] = @"periodicity";
  v11[2] = &unk_26E4710F8;
  id v5 = NSDictionary;
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 dictionaryWithObjects:v11 forKeys:v10 count:3];

  return v8;
}

@end