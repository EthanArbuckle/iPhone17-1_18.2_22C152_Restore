@interface CPMLStorageManager
- (id)readValue:(id)a3 withDoublePtr:(double *)a4 withItemCount:(id)a5;
- (id)readValue:(id)a3 withIntPtr:(int *)a4 withItemCount:(id)a5;
- (id)readValue:(id)a3 withUIntPtr:(unsigned int *)a4 withItemCount:(id)a5;
- (id)writeValue:(id)a3 withDoublePtr:(double *)a4 withItemCount:(id)a5;
- (id)writeValue:(id)a3 withIntPtr:(int *)a4 withItemCount:(id)a5;
- (id)writeValue:(id)a3 withUIntPtr:(unsigned int *)a4 withItemCount:(id)a5;
@end

@implementation CPMLStorageManager

- (id)writeValue:(id)a3 withUIntPtr:(unsigned int *)a4 withItemCount:(id)a5
{
  return 0;
}

- (id)writeValue:(id)a3 withIntPtr:(int *)a4 withItemCount:(id)a5
{
  return 0;
}

- (id)writeValue:(id)a3 withDoublePtr:(double *)a4 withItemCount:(id)a5
{
  return 0;
}

- (id)readValue:(id)a3 withUIntPtr:(unsigned int *)a4 withItemCount:(id)a5
{
  return 0;
}

- (id)readValue:(id)a3 withIntPtr:(int *)a4 withItemCount:(id)a5
{
  return 0;
}

- (id)readValue:(id)a3 withDoublePtr:(double *)a4 withItemCount:(id)a5
{
  return 0;
}

@end