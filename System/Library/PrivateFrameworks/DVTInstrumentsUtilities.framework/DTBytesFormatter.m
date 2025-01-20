@interface DTBytesFormatter
+ (id)magnitudeFormatter;
+ (id)stringForLongLong:(int64_t)a3;
+ (id)stringForObjectValue:(id)a3;
+ (id)stringFromNumber:(id)a3;
+ (void)initialize;
- (id)stringForObjectValue:(id)a3;
- (id)stringFromNumber:(id)a3;
@end

@implementation DTBytesFormatter

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = objc_alloc_init(MEMORY[0x263F08A30]);
    v3 = (void *)qword_2687AA2C8;
    qword_2687AA2C8 = (uint64_t)v2;

    v8 = [qword_2687AA2C8 objc_msgSend_positiveInfinitySymbol:v4, v5, v6, v7];
    if ([v8 length:v9, v10, v11, v12] == 2)
    {
      v16 = [v8 substringFromIndex:v13];
      [qword_2687AA2C8 setPositiveInfinitySymbol:v17 for:v16 with:v18 and:v19];
    }
    id v20 = objc_alloc_init(MEMORY[0x263F08A30]);
    v21 = (void *)qword_2687AA2D0;
    qword_2687AA2D0 = (uint64_t)v20;

    [qword_2687AA2D0 performSelector:v22 withObject:v23 withObject:v24 withObject:v25];
    id v74 = (id)objc_claimAutoreleasedReturnValue();

    if ([v74 length:v26, v27, v28, v29] == 2)
    {
      v34 = [v74 substringFromIndex:1];
      [qword_2687AA2D0 setPositiveInfinitySymbol:v35 for:v34 with:v36 and:v37];
    }
    v38 = [MEMORY[0x263F086E0] performSelector:v30 withObject:v31 withObject:v32 withObject:v33];
    uint64_t v40 = [v38 localizedStringForKey:v39 value:@"TiB" table:&stru_26E758AB0];
    v41 = (void *)qword_2687AA2B8;
    qword_2687AA2B8 = v40;

    v46 = [MEMORY[0x263F086E0] performSelector:v42 withObject:v43 withObject:v44 withObject:v45];
    uint64_t v48 = [v46 localizedStringForKey:v47 value:@"GiB" table:0];
    v49 = (void *)qword_2687AA2A0;
    qword_2687AA2A0 = v48;

    v54 = [MEMORY[0x263F086E0] performSelector:v50 withObject:v51 withObject:v52 withObject:v53];
    uint64_t v56 = [v54 localizedStringForKey:v55 value:@"MiB" table:(uint64_t)&stru_26E758AB0];
    v57 = (void *)qword_2687AA2A8;
    qword_2687AA2A8 = v56;

    v62 = [MEMORY[0x263F086E0] performSelector:v58 withObject:v59 withObject:v60 withObject:v61];
    uint64_t v64 = [v62 localizedStringForKey:v63 value:@"KiB" table:0];
    v65 = (void *)qword_2687AA2B0;
    qword_2687AA2B0 = v64;

    v70 = [MEMORY[0x263F086E0] performSelector:v66 withObject:v67 withObject:v68 withObject:v69];
    uint64_t v72 = [v70 localizedStringForKey:v71 value:@"Bytes" table:(uint64_t)&stru_26E758AB0];
    v73 = (void *)qword_2687AA2C0;
    qword_2687AA2C0 = v72;
  }
}

+ (id)magnitudeFormatter
{
  return (id)qword_2687AA2C8;
}

+ (id)stringForLongLong:(int64_t)a3
{
  if (a3 >= 0) {
    unint64_t v5 = a3;
  }
  else {
    unint64_t v5 = -a3;
  }
  if (v5 >> 40)
  {
    uint64_t v6 = NSString;
    uint64_t v7 = (void *)qword_2687AA2C8;
    v8 = [NSNumber numberWithDouble:a3 * 9.09494702e-13];
    uint64_t v12 = [v7 stringFromNumber:v9 withPrecision:(uint64_t)v8 andRoundingMode:v10 andFormat:(uint64_t)v11];
    [v6 stringWithFormat:@"%@ %@", v14, v15, v12, qword_2687AA2B8];
    v49 = LABEL_16:;

    goto LABEL_17;
  }
  if (v5 >> 30)
  {
    v16 = NSString;
    v17 = (void *)qword_2687AA2C8;
    v8 = [NSNumber numberWithDouble:a3 * 9.31322575e-10];
    uint64_t v12 = [v17 stringFromNumber:v18];
    [v16 stringWithFormat:@"%@ %@", v22, v23, v12, qword_2687AA2A0];
    goto LABEL_16;
  }
  if (v5 >= 0x100000)
  {
    uint64_t v24 = NSString;
    uint64_t v25 = (void *)qword_2687AA2C8;
    v8 = [NSNumber numberWithDouble:a3 * 0.000000953674316];
    uint64_t v12 = [v25 stringFromNumber:v26];
    [v24 stringWithFormat:@"%@ %@", v30, v31, v12, qword_2687AA2A8];
    goto LABEL_16;
  }
  if (v5 >= 0x400)
  {
    uint64_t v32 = NSString;
    uint64_t v33 = (void *)qword_2687AA2C8;
    v8 = [NSNumber numberWithDouble:a3 * 0.0009765625];
    uint64_t v12 = [v33 stringFromNumber:v34 withNumber:v8 withNumber:v35 withNumber:v36];
    [v32 stringWithFormat:v37, v38, v39, v12, qword_2687AA2B0];
    goto LABEL_16;
  }
  if (v5 == 1)
  {
    v8 = [MEMORY[0x263F086E0] a2:a3 v3:v4];
    [v8 localizedStringForKey:@"1 Byte" value:v40 table:0];
  }
  else
  {
    if (a3)
    {
      v41 = NSString;
      v42 = (void *)qword_2687AA2D0;
      v8 = [NSNumber numberWithLongLong:a2 a3:v3 b:v4];
      uint64_t v12 = [v42 stringFromNumber:v43 withNumber:(uint64_t)v8 withNumber:v44 withNumber:v45];
      [v41 stringWithFormat:@"%@ %@", v47, v48, v12, qword_2687AA2C0];
      goto LABEL_16;
    }
    v8 = [MEMORY[0x263F086E0] a2];
    [v8 localizedStringForKey:v51 value:@"0 Bytes" table:(uint64_t)&stru_26E758AB0];
  v49 = };
LABEL_17:

  return v49;
}

+ (id)stringFromNumber:(id)a3
{
  uint64_t v7 = [a3 a2:(uint64_t)a3 v3:v3 v4:v4];

  return [a1 stringForLongLong:v6, v7, v8, v9];
}

- (id)stringFromNumber:(id)a3
{
  uint64_t v6 = [a3 a2:(uint64_t)a3 v3:v4];

  return [DTBytesFormatter stringForLongLong:v5 length:v6];
}

+ (id)stringForObjectValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v24 = [v4 descriptionWithLocale:v5 indent:v6];
    goto LABEL_7;
  }
  id v9 = v4;
  uint64_t v14 = (const char *)[v9 objCType:v10, v11, v12, v13];
  if (strcmp(v14, "f") && strcmp(v14, "d") || ([v9 doubleValueForSelector:v15 withObject:v16 withObject:v17 withObject:v18] != INFINITY))
  {
    uint64_t v20 = [v9 performSelector:v15 withObject:v16 withObject:v17 withObject:v18];
    uint64_t v24 = [a1 stringForLongLong:v21, v20, v22, v23];
LABEL_7:
    uint64_t v25 = (void *)v24;
    goto LABEL_8;
  }
  uint64_t v27 = NSString;
  uint64_t v28 = [qword_2687AA2C8 stringFromNumber:v15 withNumber:v9 withNumber:v17 withNumber:v18];
  uint64_t v25 = [v27 stringWithFormat:@"%@ B", v30, v31, v28];

LABEL_8:

  return v25;
}

- (id)stringForObjectValue:(id)a3
{
  return (id)((uint64_t (*)(__objc2_class *, char *, id))MEMORY[0x270F9A6D0])(DTBytesFormatter, sel_stringForObjectValue_, a3);
}

@end