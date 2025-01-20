@interface MKRoundingByteCountFormatter
+ (id)stringFromByteCount:(int64_t)a3 roundedToNearest:(int64_t)a4;
+ (id)stringFromByteCountWithRoundingTo10MB:(int64_t)a3;
+ (id)stringFromByteCountWithRoundingTo1MB:(int64_t)a3;
+ (id)stringFromByteCountWithRoundingTo5MB:(int64_t)a3;
+ (int64_t)roundByteCount:(int64_t)a3 toNearest:(int64_t)a4;
@end

@implementation MKRoundingByteCountFormatter

+ (id)stringFromByteCount:(int64_t)a3 roundedToNearest:(int64_t)a4
{
  int64_t v4 = +[MKRoundingByteCountFormatter roundByteCount:a3 toNearest:a4];
  v5 = (void *)MEMORY[0x1E4F28B68];

  return (id)[v5 stringFromByteCount:v4 countStyle:2];
}

+ (int64_t)roundByteCount:(int64_t)a3 toNearest:(int64_t)a4
{
  return llround((double)a3 / (double)a4) * a4;
}

+ (id)stringFromByteCountWithRoundingTo1MB:(int64_t)a3
{
  return +[MKRoundingByteCountFormatter stringFromByteCount:a3 roundedToNearest:1000000];
}

+ (id)stringFromByteCountWithRoundingTo5MB:(int64_t)a3
{
  return +[MKRoundingByteCountFormatter stringFromByteCount:a3 roundedToNearest:5000000];
}

+ (id)stringFromByteCountWithRoundingTo10MB:(int64_t)a3
{
  return +[MKRoundingByteCountFormatter stringFromByteCount:a3 roundedToNearest:10000000];
}

@end