@interface UIImageView(MKAdditions)
- (unint64_t)imageContentMode;
- (void)setImageContentMode:()MKAdditions;
@end

@implementation UIImageView(MKAdditions)

- (unint64_t)imageContentMode
{
  unint64_t v1 = [a1 contentMode];
  if (v1 > 4) {
    return 0x8000000000000000;
  }
  else {
    return qword_18BD1AD68[v1];
  }
}

- (void)setImageContentMode:()MKAdditions
{
  if (a3 > 1)
  {
    if (a3 == 2) {
      uint64_t v3 = 2;
    }
    else {
      uint64_t v3 = 0;
    }
    if (a3 != 4) {
      a3 = v3;
    }
  }
  else
  {
    if (a3 == 0x8000000000000000) {
      return a1;
    }
    if (a3 != 1) {
      a3 = 0;
    }
  }
  return (void *)[a1 setContentMode:a3];
}

@end