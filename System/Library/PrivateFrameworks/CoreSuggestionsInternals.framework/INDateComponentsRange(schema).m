@interface INDateComponentsRange(schema)
+ (id)fromStartDate:()schema endDate:;
+ (uint64_t)fromStartDate:()schema;
@end

@implementation INDateComponentsRange(schema)

+ (id)fromStartDate:()schema endDate:
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5)
  {
    v8 = objc_msgSend(MEMORY[0x1E4F1C9D8], "sg_dateComponentsFromISO8601String:", v5);
    if (v7)
    {
LABEL_3:
      v9 = objc_msgSend(MEMORY[0x1E4F1C9D8], "sg_dateComponentsFromISO8601String:", v7);
      goto LABEL_6;
    }
  }
  else
  {
    v8 = 0;
    if (v6) {
      goto LABEL_3;
    }
  }
  v9 = 0;
LABEL_6:
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F303D8]) initWithStartDateComponents:v8 endDateComponents:v9];

  return v10;
}

+ (uint64_t)fromStartDate:()schema
{
  return [MEMORY[0x1E4F303D8] fromStartDate:a3 endDate:0];
}

@end