@interface NSMeasurement(Readable)
- (id)_intents_readableTitleWithLocalizer:()Readable metadata:;
@end

@implementation NSMeasurement(Readable)

- (id)_intents_readableTitleWithLocalizer:()Readable metadata:
{
  id v6 = a4;
  v7 = [a3 locale];
  id v8 = a1;
  id v9 = objc_alloc_init(MEMORY[0x1E4F28E30]);
  v10 = [v6 unit];

  if (v10)
  {
    v11 = [v6 unit];
    v12 = [v8 measurementByConvertingToUnit:v11];

    uint64_t v13 = 1;
  }
  else
  {
    uint64_t v13 = 2;
    v12 = v8;
  }
  [v9 setUnitOptions:v13];
  v14 = [v8 unit];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    uint64_t v16 = 2;
  }
  else {
    uint64_t v16 = 3;
  }
  [v9 setUnitStyle:v16];
  [v9 setLocale:v7];
  v17 = [v9 stringFromMeasurement:v12];

  return v17;
}

@end