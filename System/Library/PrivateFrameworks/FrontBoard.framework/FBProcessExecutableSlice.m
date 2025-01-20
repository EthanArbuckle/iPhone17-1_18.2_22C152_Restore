@interface FBProcessExecutableSlice
+ (FBProcessExecutableSlice)sliceWithType:(int)a3;
+ (FBProcessExecutableSlice)sliceWithType:(int)a3 subtype:(int)a4;
+ (id)arm64;
+ (id)arm64e;
- (id)description;
- (int)subtype;
- (int)type;
@end

@implementation FBProcessExecutableSlice

+ (id)arm64
{
  return (id)[a1 sliceWithType:16777228 subtype:1];
}

+ (id)arm64e
{
  return (id)[a1 sliceWithType:16777228 subtype:2];
}

+ (FBProcessExecutableSlice)sliceWithType:(int)a3
{
  return (FBProcessExecutableSlice *)[a1 sliceWithType:*(void *)&a3 subtype:0xFFFFFFFFLL];
}

+ (FBProcessExecutableSlice)sliceWithType:(int)a3 subtype:(int)a4
{
  v6 = (_DWORD *)objc_opt_new();
  v6[2] = a3;
  v6[3] = a4;

  return (FBProcessExecutableSlice *)v6;
}

- (id)description
{
  if (self->_type == 16777228)
  {
    unsigned int v3 = self->_subtype + 1;
    if (v3 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"arm64_(%i)", self->_subtype);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = off_1E5C49C60[v3];
    }
  }
  else
  {
    v5 = NSString;
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    objc_msgSend(v5, "stringWithFormat:", @"<%@; type: %d; subtype: %d>",
      v7,
      self->_type,
      self->_subtype);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (int)type
{
  return self->_type;
}

- (int)subtype
{
  return self->_subtype;
}

@end