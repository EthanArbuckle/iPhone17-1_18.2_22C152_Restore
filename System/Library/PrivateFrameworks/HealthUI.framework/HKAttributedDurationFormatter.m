@interface HKAttributedDurationFormatter
+ (id)formattedValueWithDuration:(double)a3 unitsStyle:(int64_t)a4 font:(id)a5 valueColor:(id)a6 unitColor:(id)a7;
- (HKAttributedDurationFormatter)init;
@end

@implementation HKAttributedDurationFormatter

- (HKAttributedDurationFormatter)init
{
  sub_1E0ECD800();
  swift_bridgeObjectRelease();
  result = (HKAttributedDurationFormatter *)sub_1E0ECD8F0();
  __break(1u);
  return result;
}

+ (id)formattedValueWithDuration:(double)a3 unitsStyle:(int64_t)a4 font:(id)a5 valueColor:(id)a6 unitColor:(id)a7
{
  v27[0] = sub_1E0ECDB70();
  uint64_t v11 = *(void *)(v27[0] - 8);
  MEMORY[0x1F4188790](v27[0], v12);
  v14 = (char *)v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1E0ECB640();
  MEMORY[0x1F4188790](v15 - 8, v16);
  v18 = (char *)v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v19 = a5;
  v20 = (char *)a6;
  id v21 = a7;
  uint64_t v22 = sub_1E0ECDBB0();
  uint64_t v24 = v23;
  if (a4 == 1)
  {
    sub_1E0ECDB60();
  }
  else
  {
    if (a4)
    {
      v27[1] = a4;
      id result = (id)sub_1E0ECDA00();
      __break(1u);
      return result;
    }
    sub_1E0ECDB40();
  }
  swift_getObjCClassMetadata();
  sub_1E0E25858();
  sub_1E0E25AA4(v22, v24, (uint64_t)v14, v19, v20, v21, (uint64_t)v18);
  (*(void (**)(char *, void))(v11 + 8))(v14, v27[0]);
  v25 = (void *)sub_1E0ECD620();

  return v25;
}

@end